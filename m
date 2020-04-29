Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4B31BDD6F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 15:22:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmfS-0007tE-DL; Wed, 29 Apr 2020 13:22:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uTc=6N=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTmfR-0007t7-4g
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:22:25 +0000
X-Inumbo-ID: 766b47bc-8a1c-11ea-b07b-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 766b47bc-8a1c-11ea-b07b-bc764e2007e4;
 Wed, 29 Apr 2020 13:22:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t14so2478635wrw.12
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2020 06:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=7QaBiRW4xSkhhUWlHoNtsHvIq9713jNgN1BqjrnK9uk=;
 b=YtbTmF8dFZKWbgUOPRP5VnunwnlokKjJM0ORMySyVIATrGZGQOAuhGaAkMCmZbiFm/
 HabuNvVyaRf262oL44TjuCQnT34mf/szbeZ3XLyKk02MHeBlPVTxpLVIwP9CXZEhDgFP
 iczLKhAA4sQ8zRr1NaxN1nFULOZckoBl+6I6JhU6Mkksx+wXF7e8gRN2MQLtkWfGPt1D
 LUtwmsbY10wSJGc1tQOdCyT3qxTn+IfZyWB0tgb7mlHOn24jGoNXdkUyijqexeKK6E3s
 r+couGiVxWcA4khojNbAktI/HQXSXivwmzLS2OJtLt4J9D2nH+a2CWSUdHyxHzDEWv7n
 6kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=7QaBiRW4xSkhhUWlHoNtsHvIq9713jNgN1BqjrnK9uk=;
 b=FvjOp0SEFqgkD1sx4U1ZRJVxMfdGjh+66HoGDId+u36x6mRbamHwyrOFb+yWM3gt9F
 BgJ/5ZuGyUqxXSkVZ2ed9MOvb6muO+oKR/kQsEDaIHEFzYyJt161+LhjxDfYXxHS9zlk
 0oKS7kIbsxGV59PL5mSpfFZGnto5MO1xXjJVHlxDcMft3SAz7Tq2MdA/qeicwu7SHjuz
 mwM0CFtQVxP0feWG/SBkKuXG9zKUTCpOfKtsj0vh6GVQsMr936OPzw4lSIpMiK0QgapA
 jW6EDUCGmtqq8uw5on/dEQz53a1T9gENqQMGUh1wxu7O/Za1oq+D3pNy4hAxZJl7UUsQ
 9LGQ==
X-Gm-Message-State: AGi0PuYO6M3JR9bW2jHh1K0P+1Pvug24sUIfV45VUbir+Y++Ym9RXMFt
 sfH53SywRWQjUalEcX9N7s8=
X-Google-Smtp-Source: APiQypI/eUep6KdlA0qho55MsHdOEUyLGfPtC+5OPviSGtlu7aqqQy4JoazPfYzayvvE1XLVmsyUyA==
X-Received: by 2002:a5d:4381:: with SMTP id i1mr38005620wrq.194.1588166543490; 
 Wed, 29 Apr 2020 06:22:23 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id k3sm33414039wru.90.2020.04.29.06.22.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Apr 2020 06:22:22 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
 =?UTF-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Julien Grall'" <julien.grall.oss@gmail.com>
References: <20200428155144.8253-1-jgross@suse.com>
 <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
 <d1c41bd7-676e-c50a-416d-c62efcbdd41d@suse.com>
 <76ed29d6-e2fc-cd48-6de7-e0032daaa2e9@xen.org>
 <3fd79cb1-e18f-1987-69ff-94f1bd15c66f@citrix.com>
 <3dcbe001-c66c-13a6-7a28-ef24b05eefa0@suse.com>
 <c07e5106-d8de-f6a7-e406-b25ee9ff6d49@citrix.com>
 <f80aff47-8617-8f59-0d34-bf0385128b62@suse.com>
 <a23c3d72-f5c8-5c3f-2c2f-5a9ca1065d1f@citrix.com>
 <000001d61e25$97f86530$c7e92f90$@xen.org>
 <0eaea23f-8b4a-2c67-2fc4-827cf26dbd8d@citrix.com>
In-Reply-To: <0eaea23f-8b4a-2c67-2fc4-827cf26dbd8d@citrix.com>
Subject: RE: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
Date: Wed, 29 Apr 2020 14:22:21 +0100
Message-ID: <000101d61e29$37890f70$a69b2e50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQI5DSqNP/4D/SMDjCtgzueaLTX80QC4bkXHAbDXqJ8CsNUfVQLT/QPPATMMdVoBnbvEPwMR4MQ0ANMkKK0Bz5197wJMukkIpzQ1JXA=
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
Cc: 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>,
 andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 29 April 2020 14:17
> To: paul@xen.org; 'J=C3=BCrgen Gro=C3=9F' <jgross@suse.com>; 'Julien =
Grall' <julien@xen.org>; 'Julien Grall'
> <julien.grall.oss@gmail.com>
> Cc: 'xen-devel' <xen-devel@lists.xenproject.org>; 'Ian Jackson' =
<ian.jackson@eu.citrix.com>; 'Wei Liu'
> <wl@xen.org>; andrew.cooper3@citrix.com
> Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring =
page in xensotred
>=20
> On 29/04/2020 13:56, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> >> Sent: 29 April 2020 13:50
> >> To: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>; Julien Grall =
<julien@xen.org>; Julien Grall
> >> <julien.grall.oss@gmail.com>
> >> Cc: xen-devel <xen-devel@lists.xenproject.org>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Wei Liu
> >> <wl@xen.org>; andrew.cooper3@citrix.com; Paul Durrant =
<paul@xen.org>
> >> Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring =
page in xensotred
> >>
> >> On 29/04/2020 13:29, J=C3=BCrgen Gro=C3=9F wrote:
> >>>
> >>> Wei, Ian, can you please tell me where I'm wrong?
> >>>
> >>> A soft reset should restart the domain in a clean state. AFAIK =
libxl is
> >>> handling that by doing kind of in-place save-restore, including =
calling
> >>> xs_release_domain() and later xs_introduce_domain(). This should =
result
> >>> in xenstored throwing away all state it has regarding the domain =
and
> >>> then restarting with a new (internal) domain instance.
> >>>
> >>> Is XAPI doing soft reset differently? Why should there be a need =
for
> >>> keeping xenstored data across a soft reset?
> >>
> >> Yes, XAPI is doing soft reset differently from libxl. You need to =
keep xenstore
> >> data to at least keep backends working without the need to =
reinitialize them
> >> before entering kdump kernel. We do the same thing while entering =
crash kernel
> >> in Windows after BSOD (CC Paul as he recommended this approach).
> >
> > IIRC I recommended not involving Xen or the toolstack in entering =
the crash kernel... they don't
> need to know. Windows quite happily enters its crash kernel, rebuilds =
its Xen interfaces and re-
> attaches to PV backends without any external intervention.
>=20
> In case of kdump toolstack certainly needs to know as it gets shutdown =
code 5 and
> needs to restart the domain.
>=20

The toolstack needs to restart the domain once the crash has completed, =
yes.

> And I'm not completely sure it's possible to enter kdump without =
calling soft reset
> at all. Even if it's possible I'd be cautious to do it in production =
for the future.
>=20

If it is not possible at the moment then IMO it should be made so; =
having soft reset in the toolstack is a layering violation IMO.

  Paul



