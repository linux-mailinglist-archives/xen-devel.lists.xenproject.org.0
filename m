Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05021255ED7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 18:36:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBhMH-0000au-5U; Fri, 28 Aug 2020 16:36:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2Rs=CG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kBhMF-0000ap-0H
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 16:36:07 +0000
X-Inumbo-ID: fda1f3a6-98b9-45fc-8bc4-f99e1a0a701c
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fda1f3a6-98b9-45fc-8bc4-f99e1a0a701c;
 Fri, 28 Aug 2020 16:36:05 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id f7so1885524wrw.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2020 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=EKuh2zra/ZvDXnfzaaaVoNAee+3kPdgRj0+Y7FNnwvE=;
 b=TJTkgP4MMC3umiEFCnZXfg2REKB5FODvIJ9P8hvqtcxaJHLfUNc+y7Z4Yy0h3WNVrl
 VkqNq9Ar2OI+5+JjOBRSzO6J5YpmaAObBalU+Oqs3y5TqdEE5Ec+oll/+1rq6XYvAwnx
 YZbH/HacKHJ3jkBdHAigBR4Oc/cLOar/bRDEV1lNM/YveeEvNEyl9gOoKWsxr8eBw73D
 K6LXEM45j9g+fI7HUfvNZyCTShJXlnyxrRAiig77WAoE6xW5Kh9OxaI+EKdv6GNRo3M8
 M+SjvgkVYHR+bBWAzO3HXcG9HaklTag0bLj0eLDoto4b/EMkd+c4PSKXu5iN+cdofOwg
 VESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=EKuh2zra/ZvDXnfzaaaVoNAee+3kPdgRj0+Y7FNnwvE=;
 b=qmcYZsx1GbruXkEuhPo12MvpmWD1NFX1wIlm/Jr7K5uAo7nt8SWPcCogLInDNH90R/
 gd/YpFBcCTIBIm39nStoBeOpx8MfD1XAXBchDsB13rSSD/ZRM/reLvtvHKIAGa0OLTBe
 S/1Eim9V1mkkMjVouj+pq07/o6XBXTQFxv/DpDJIe1NHyNCdhpDm5SJItcBoVVLqtji8
 SUWCCzw+eD8hMUS+vLRWFOBwypZ2Afkwux69rUrahE2N3xKQoM7GKoiDrLWzW/sfE60O
 AvKZiM2MSUuAyG/VQ+290NsBaSRBCC9ND4yMvhUXdIREYegC8hDZ+jMYssWkasQ2kaC8
 xjnA==
X-Gm-Message-State: AOAM532L1PixunZ+y4pF3FcQgTDR4LIOJDlRrUCHlMTBfE2yOC1aizZr
 m63HCf46+BaU5wHZJuttVE8=
X-Google-Smtp-Source: ABdhPJxgPwQ/v99AMUnn993i4Q9w3fBWQchWaw/h3zfE+UT0SFhxflPLqoJwwTmgxGt31ob4P3/vpA==
X-Received: by 2002:adf:e68f:: with SMTP id r15mr2258131wrm.196.1598632564607; 
 Fri, 28 Aug 2020 09:36:04 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:750e:72f5:bca:b4e5])
 by smtp.gmail.com with ESMTPSA id g15sm1888001wrx.66.2020.08.28.09.36.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Aug 2020 09:36:04 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>, "'Wei Liu'" <wl@xen.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
References: <20200818103032.3050-1-paul@xen.org>
 <20200818103032.3050-9-paul@xen.org>
 <153634db-bd1a-62d8-f53f-2c4019ffda4c@suse.com>
 <006401d67d2b$991e3dd0$cb5ab970$@xen.org>
 <eabd43d5-f220-2a96-fda6-ababffc4c3f9@suse.com>
In-Reply-To: <eabd43d5-f220-2a96-fda6-ababffc4c3f9@suse.com>
Subject: RE: [EXTERNAL] [PATCH v7 8/9] x86/time: add a domain context record
 for tsc_info...
Date: Fri, 28 Aug 2020 17:36:03 +0100
Message-ID: <001201d67d59$5249add0$f6dd0970$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI3t7iXj66qvRdG8GCx2a1a4xz7XAJdPdyxAnABMAgCOOdCDwGgjGILqEYMsAA=
Content-Language: en-gb
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
> Sent: 28 August 2020 16:53
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Ian Jackson' =
<ian.jackson@eu.citrix.com>; 'Wei Liu' <wl@xen.org>;
> 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Julien
> Grall' <julien@xen.org>; 'Stefano Stabellini' =
<sstabellini@kernel.org>; 'Roger Pau Monn=C3=A9'
> <roger.pau@citrix.com>
> Subject: Re: [EXTERNAL] [PATCH v7 8/9] x86/time: add a domain context =
record for tsc_info...
>=20
> On 28.08.2020 13:08, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 26 August 2020 15:03
> >> To: Paul Durrant <paul@xen.org>
> >> Cc: xen-devel@lists.xenproject.org; Durrant, Paul =
<pdurrant@amazon.co.uk>; Ian Jackson
> >> <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; Andrew Cooper =
<andrew.cooper3@citrix.com>;
> George
> >> Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; =
Stefano Stabellini
> >> <sstabellini@kernel.org>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> >> Subject: RE: [EXTERNAL] [PATCH v7 8/9] x86/time: add a domain =
context record for tsc_info...
> >>
> >> CAUTION: This email originated from outside of the organization. Do =
not click links or open
> >> attachments unless you can confirm the sender and know the content =
is safe.
> >>
> >>
> >>
> >> On 18.08.2020 12:30, Paul Durrant wrote:
> >>> --- a/xen/include/public/save.h
> >>> +++ b/xen/include/public/save.h
> >>> @@ -93,7 +93,18 @@ struct domain_shared_info_context {
> >>>
> >>>  DECLARE_DOMAIN_SAVE_TYPE(SHARED_INFO, 2, struct =
domain_shared_info_context);
> >>>
> >>> -#define DOMAIN_SAVE_CODE_MAX 2
> >>> +#if defined(__i386__) || defined(__x86_64__)
> >>> +struct domain_tsc_info_context {
> >>> +    uint32_t mode;
> >>> +    uint32_t incarnation;
> >>> +    uint64_t elapsed_nsec;
> >>> +    uint32_t khz;
> >>> +};
> >>
> >> sizeof() for this struct varies between 32-bit and 64-bit - is
> >> this not a problem? (alignof() varies too, but there I think
> >> it's indeed not a problem, albeit it could still be taken care
> >> of by using uint64_aligned_t, alongside the addition of an
> >> explicit padding field).
> >
> > I don't think it should matter because domain context records have
> > implicit padding to align up to the next 64-bit boundary,
>=20
> Could you remind me where this is written down and enforced?
>=20

With the series fully applied, see xen/include/public/save.h line 62-68 =
for the comment and then see domain_save_end() in xen/common/save.c for =
where the padding is applied.

  Paul

> > so as long as fields within the struct don't move (which I think
> > is true in this case) then we should be ok.
>=20
> Right.
>=20
> Jan


