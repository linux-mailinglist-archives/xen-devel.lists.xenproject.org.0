Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2CD234729
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:48:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VP0-00087X-5d; Fri, 31 Jul 2020 13:48:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fae6=BK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k1VOz-00087P-1I
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:48:49 +0000
X-Inumbo-ID: 8ee47f00-d334-11ea-8e3e-bc764e2007e4
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ee47f00-d334-11ea-8e3e-bc764e2007e4;
 Fri, 31 Jul 2020 13:48:48 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 184so9321932wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 06:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=KKYSpQQGDTEf/rszLaXCTRWUnIGy5njL3CATz1Qk9lc=;
 b=cTMMW/JmUVKMziEy1Y7wBpvFpLH/cRfHIAUoYRaziHki0mINkYBYj2ks3qerMk1GMX
 a2r69LCc4j3ncftJpCzjzZ6Jgz8HD/isCTCTI3nI+tG7iJ+Oo1sFRJCzD2enIT7Y36Gi
 HUrLe/CzfBy5hGSUsayz6H3zTmJSXGMrO5lJC+Rt5A/paqGecL6N1ZQRTtA6kBRQG/UY
 ZQbAgTDAY6n/Rm286KmlEOPlz8Z+xKstG074lRJaE1+yEJyVzf1h0TFYAZPzS7CZM/sD
 eX8U1Vo/5HqVJgAIT6qXUJKwZV1n1cw1qe8pswSazWZNumg3jMe9HRMM140yj6ZVlNNj
 MZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=KKYSpQQGDTEf/rszLaXCTRWUnIGy5njL3CATz1Qk9lc=;
 b=XUt5LCyRaa39nfPx6IFYYgcKZYmlnYOF2Ggs4TMxUcrtp3qfV/T1Y2Rz+R0iENK+C/
 Aelwxrk90yhGVzUfMnrywm+R+aqvdwvtziA9x9rPAaUsvCOfv7O6grPMAeqXeP2o/iBo
 nCcBVim+F5naVJnaiMvxvlRrS8HpCOttNGsyn1mdiFNy8LZuc4G2X75pW/k67qMz8xFB
 CB5mMWsc70Bf6I2r2NuT+WF+m6CTU3nSq7D8UiGJHincO8lRcpIkeUAN9OesuUAemDmY
 /yKfV1/5ZtdQTfkfL7Pmdiu2OtBxdRUL/3ltQmw8qBWBq/sHmQ+61+lBu1G4HHhPA0Sm
 +kiA==
X-Gm-Message-State: AOAM530ly3aN9DU5dUExjQcSDGhNCm04FOR8LtS14R2eMPmA3IIFHxrQ
 aAjANXOF2QmKcXZm08j59jg=
X-Google-Smtp-Source: ABdhPJyu6AWHs0On15gV36rotdLoKobT2q5+M9ZsUp+rj+N1uQ6GQ1fdPwD7wC/ZIAxl3JOc6iSbBw==
X-Received: by 2002:a7b:c8d3:: with SMTP id f19mr3778273wml.163.1596203327417; 
 Fri, 31 Jul 2020 06:48:47 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id z7sm12010526wmk.6.2020.07.31.06.48.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Jul 2020 06:48:46 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200731123926.28970-1-paul@xen.org>
 <20200731123926.28970-3-paul@xen.org>
 <a4856c33-8bb0-4afa-cc71-3af4c229bc27@suse.com>
 <004501d6673b$9adffbf0$d09ff3d0$@xen.org>
 <84cdd5b8-5149-a240-8bad-be8d67dca0d8@suse.com>
In-Reply-To: <84cdd5b8-5149-a240-8bad-be8d67dca0d8@suse.com>
Subject: RE: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()
Date: Fri, 31 Jul 2020 14:43:34 +0100
Message-ID: <004601d66740$9661ad80$c3250880$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLlfQu00pWfsofZfQkBPK3LKKgwygFbp5BqArgsBgQC0uj+iQMLOy2gprP24fA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 31 July 2020 14:41
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' =
<pdurrant@amazon.com>; 'Andrew Cooper'
> <andrew.cooper3@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Roger Pau =
Monn=C3=A9' <roger.pau@citrix.com>
> Subject: Re: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in =
epte_get_entry_emt()
>=20
> On 31.07.2020 15:07, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 31 July 2020 13:58
> >> To: Paul Durrant <paul@xen.org>
> >> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Andrew Cooper
> >> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>
> >> Subject: Re: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check =
in epte_get_entry_emt()
> >>
> >> On 31.07.2020 14:39, Paul Durrant wrote:
> >>> From: Paul Durrant <pdurrant@amazon.com>
> >>>
> >>> Re-factor the code to take advantage of the fact that the APIC =
access page is
> >>> a 'special' page.
> >>
> >> Hmm, that's going quite as far as I was thinking to go: In
> >> particular, you leave in place the set_mmio_p2m_entry() use
> >> in vmx_alloc_vlapic_mapping(). With that replaced, the
> >> re-ordering in epte_get_entry_emt() that you do shouldn't
> >> be necessary; you'd simple drop the checking of the
> >> specific MFN.
> >
> > Ok, it still needs to go in the p2m though so are you suggesting
> > just calling p2m_set_entry() directly?
>=20
> Yes, if this works. The main question really is whether there are
> any hidden assumptions elsewhere that this page gets mapped as an
> MMIO one.
>

Actually, it occurs to me that logdirty is going to be an issue if I use =
p2m_ram_rw. If I'm not going to use p2m_mmio_direct then do you have =
another suggestion?

  Paul


