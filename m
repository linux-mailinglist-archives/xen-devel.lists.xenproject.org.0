Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C3648936
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 20:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458219.716112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3jQJ-0006c1-0C; Fri, 09 Dec 2022 19:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458219.716112; Fri, 09 Dec 2022 19:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3jQI-0006Z9-TB; Fri, 09 Dec 2022 19:52:42 +0000
Received: by outflank-mailman (input) for mailman id 458219;
 Fri, 09 Dec 2022 19:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bplO=4H=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1p3jQI-0006R1-09
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 19:52:42 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a59f675-77fb-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 20:52:41 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id f7so4532802edc.6
 for <xen-devel@lists.xenproject.org>; Fri, 09 Dec 2022 11:52:41 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0a59f675-77fb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/9R9FdUoL2qsV8lEemTy8Krnnda8kROPexOO+rf+Zc=;
        b=RBzb4sd1Chw7N3IhqCo1r0Z57LDHinRmkpKj0Z6KFpOExGqbcOZTPEnO2BFykTy4sx
         cepYYbvEMmZEuU54y6lanTJSbIvcdlUmdIivAjTy9vROgsQunLMolvBg5SIsCPf0cVaw
         gnD+94PAIIPHlZ8NTQtowurwRXQG2Y0N14lXkLKGQwrhD4ebp2CDQ3FxJzIpfZMY9ll4
         Xn63aywovkD8LRGOVsYGFBcGhSwKMQGEHsxUaifTWSNvugJyrk9+Fn5GccEnJlzvJjWt
         BjedUMaj+Jn17nBL1AMPXEsGXjkJfb54iLUfVkv/PxgSYRLsl2F9vrXpgZpJDN2KLcFf
         keIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/9R9FdUoL2qsV8lEemTy8Krnnda8kROPexOO+rf+Zc=;
        b=EnlIGKGUeCbbvuuIQ2pMyFDvnJ39mI2yja6jwBDIBPPP0uchjyOBI1i3Nlj6A2G7jh
         y+3BQiE5lmUUm/GxWDkO6mKyFDjiR22mK6AP5SMBa1LA6X5zEfjeoUISreaWZXcjqzWe
         Ys3SbYc3ZDoeVzMfu5BvQ6DY7mdiBRHPiUJeMUaTqrSca5QfA4w2Gcor4NcRHeNmcVSV
         4hj1H6zsXi3u0Rano1lT1XYbWgWMYwsllv2/05Jj0b42cfcimBxNMWjy4Tlw9d4Y1lbH
         Rp4lHCNG0vulPDN7dUXkX1rQ6pfLjlTDdOGUet2QYen1MWG+PA2Hb+w6eu48lp9gQzbI
         Sx+g==
X-Gm-Message-State: ANoB5pl5yFjsFlpBmjZbWDGr3IlPmfKG7cpHYkqxeCN3kO/S9o5/qi/a
	uDTzSoLXGFv+Oy+KOgoadMCbDkNiyYraBO4rEQs=
X-Google-Smtp-Source: AA0mqf6caaSGnXsrOnBa3iNT0u23FV61L/qvR4dBAxMu4HH0Z/+tl3Qcrw8Nfkd/hRhuuF1S35d/Qv3NhDXlPM6ul/M=
X-Received: by 2002:a05:6402:3212:b0:46c:76da:b58b with SMTP id
 g18-20020a056402321200b0046c76dab58bmr18854635eda.116.1670615560906; Fri, 09
 Dec 2022 11:52:40 -0800 (PST)
MIME-Version: 1.0
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com> <bae74b9b-eeb6-76d9-b4d4-55c9a4fb2835@suse.com>
In-Reply-To: <bae74b9b-eeb6-76d9-b4d4-55c9a4fb2835@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 9 Dec 2022 14:52:27 -0500
Message-ID: <CAKf6xpsajy7xczMMib4v6KSELp30wpY_FJUQ9uobhoD6HSCi+w@mail.gmail.com>
Subject: Re: [PATCH 4/5] x86/tboot: correct IOMMU (VT-d) interaction
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 6, 2022 at 8:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> First of all using is_idle_domain() on the subject domain in the body of
> for_each_domain() is pointless. Replace that conditional by one checking
> that a domain actually has IOMMU support enabled for it, and that we're
> actually on a VT-d system (both are largely cosmetic / documentary with
> how things work elsewhere, but still).
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

