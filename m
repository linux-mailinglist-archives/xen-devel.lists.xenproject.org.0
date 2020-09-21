Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50108271F49
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 11:50:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKISn-0006cy-2i; Mon, 21 Sep 2020 09:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PHp+=C6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kKISl-0006cs-Dz
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 09:50:23 +0000
X-Inumbo-ID: 55a4a227-c23e-4a11-9c75-b361eadfbd1d
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55a4a227-c23e-4a11-9c75-b361eadfbd1d;
 Mon, 21 Sep 2020 09:50:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e16so12041062wrm.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=dejfqyowQqa9qIsTUSPtWKEGWgkq3D5qwrZhBmUsiQA=;
 b=PUa729eFkK6h93NGVu5gQo1zS4N0F8uOQWWTv0vBvmc3dHyY+l+Wedowb5wCQs9pPP
 T0Dn54BgOa8mPwFDlApooYhnlGhj+9JEh261AO535VWmdqCJzmVgbc/2I4a+MSNOs3s+
 TMquUTOKLKqMqDrYTYpMKI/C4UpESDMjEP8dTAyi2OQaAUyEa7YKG8PqpOWkObfR1n/B
 qfmlC2DFoPIVK+twMzoZCO+OH3/VGSkJY2CSVMKDbWc0ORsdr0XNGGSMTa5ZjJnqQiSm
 GfcEf5HpJb2HnM9nePm1LYAJ1MRXn/Sw60J6ciodDXijnIZdBT4/YbZjh6CWpHhkTRLN
 uw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=dejfqyowQqa9qIsTUSPtWKEGWgkq3D5qwrZhBmUsiQA=;
 b=As+OiJq/7uvRxLnHQZWVbXTl4saoADcTe+9BDdWyIr0nk/qmie8Yywge1RKYble/j1
 LJARqIfQgPHWNulb0J6V8UslgX8DLoZnAtFw6xyNKZ0f+FjDbbePK7eDdGOcTkD0gkNu
 zU7SHU998yP6pOWTBdsFFeYEknrBxWWq7m03mceD6j64TetdPk+PuFHIIc0eHw05EPL8
 QGsYaMy+D1cdfIuAlb6N8mxvbBpRROltP9dWV4TITFC5y817oR2g56bzmLXVjXkYtQhc
 uUwoaTOxT9bdPMB78ebNSPQ1cHkP7J5m3qx2/p53Qr6xqAgdSixUPSrYd+9ksyuwzmew
 67LQ==
X-Gm-Message-State: AOAM533sKnAYXukJFnWsNW6L19qeC0DvUvb12EB9mcrvVf/6Ty9CoBh+
 rHDB3r5VTjR67HIM4Yu6p4g=
X-Google-Smtp-Source: ABdhPJwbWGJobFvTA0g5q9OWhqEqR9vGIWdxZBSlwrMoVz9tTsbnUzUQFnRJ0nZLCLwhSxEx0rB1MA==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr49974822wrq.282.1600681821667; 
 Mon, 21 Sep 2020 02:50:21 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id q15sm19406906wrr.8.2020.09.21.02.50.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 02:50:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Ian Jackson'" <iwj@xenproject.org>,
 "'Debian folks: Michael Tokarev'" <mjt@tls.msk.ru>,
 "'Hans van Kranenburg'" <hans@knorrie.org>,
 "'Xen upstream folks with an interest: Andrew Cooper'"
 <Andrew.Cooper3@citrix.com>, 
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 <pkg-xen-devel@lists.alioth.debian.org>, <xen-devel@lists.xenproject.org>,
 "'My Xen upstream tools co-maintainer: Wei Liu'" <wl@xen.org>
References: <24420.58027.291045.507128@mariner.uk.xensource.com>
 <001b01d68fe9$fb3ae060$f1b0a120$@xen.org>
 <a034987c-3b73-cc99-fdf2-74959710b6c1@suse.com>
In-Reply-To: <a034987c-3b73-cc99-fdf2-74959710b6c1@suse.com>
Subject: RE: qemu and Xen ABI-unstable libs
Date: Mon, 21 Sep 2020 10:50:20 +0100
Message-ID: <003301d68ffc$9eaff2f0$dc0fd8d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH2uLOlkL5RRHeQwNjnzSMb6hz+iQIfRTUkAYQM0u6pFW0TcA==
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 21 September 2020 10:41
> To: paul@xen.org
> Cc: 'Ian Jackson' <iwj@xenproject.org>; 'Debian folks: Michael =
Tokarev' <mjt@tls.msk.ru>; 'Hans van
> Kranenburg' <hans@knorrie.org>; 'Xen upstream folks with an interest: =
Andrew Cooper'
> <Andrew.Cooper3@citrix.com>; 'Roger Pau Monn=C3=A9' =
<roger.pau@citrix.com>; pkg-xen-
> devel@lists.alioth.debian.org; xen-devel@lists.xenproject.org; 'My Xen =
upstream tools co-maintainer:
> Wei Liu' <wl@xen.org>
> Subject: Re: qemu and Xen ABI-unstable libs
>=20
> On 21.09.2020 09:36, Paul Durrant wrote:
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of Ian Jackson
> >> Sent: 18 September 2020 17:39
> >>
> >> xc_domain_iomem_permission
> >> xc_domain_populate_physmap_exact
> >> xc_domain_ioport_mapping
> >> xc_domain_memory_mapping
> >>
> >> The things done by these calls in qemu should be done by the Xen
> >> toolstack (libxl), during domain creation etc., instead.
> >
> > I don't think that is practical. E.g. if a guest re-programs a PCI =
I/O BAR then it may necessitate
> re-calling
> > xc_domain_ioport_mapping(); the tool-stack cannot know a priori =
where PCI BARs will end up in guest
> port/memory space.
>=20
> In your reply I assume you meant just the latter two of the four?
> For these I agree, and as a result they shouldn't be domctl in
> the new model.
>=20

Sorry if I wasn't clear. Yes, the latter two are what I was referring =
to.

  Paul

> Jan


