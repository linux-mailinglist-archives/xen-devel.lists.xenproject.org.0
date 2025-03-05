Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A798A5064E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 18:26:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902578.1310567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpsVX-0008U7-Ko; Wed, 05 Mar 2025 17:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902578.1310567; Wed, 05 Mar 2025 17:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpsVX-0008S9-HN; Wed, 05 Mar 2025 17:26:11 +0000
Received: by outflank-mailman (input) for mailman id 902578;
 Wed, 05 Mar 2025 17:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCKF=VY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpsVV-0008S3-IL
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 17:26:09 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8fe4aad-f9e6-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 18:26:02 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac0b6e8d96cso523209966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 09:26:02 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abf627daa5esm703163366b.154.2025.03.05.09.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 09:26:01 -0800 (PST)
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
X-Inumbo-ID: e8fe4aad-f9e6-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741195561; x=1741800361; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xeesjz60AZETYOgB9n1R+Mb7R1HS5mpUxtd/jkNtyUY=;
        b=OE89Dvjt/Y7Ny3j1MEwijuoKJ2OXo1VvD1JViT1UumZIem/XL83AX7/t2miaiEdrQS
         uR6aVXZUItK601rYDk7WK3cp1clKGALy4ogfnDfPM8yDfC9NVwIhlHwcKbJub6KAWM0T
         TFZOzfjp4ueSRWwbo79x3RzTO12DL+JlmpCjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741195561; x=1741800361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xeesjz60AZETYOgB9n1R+Mb7R1HS5mpUxtd/jkNtyUY=;
        b=Gzkc7o5dNvk2GP6ysshgXzP5BSBNei+L5tD7ajqFhuBnmTZCuWfrXamBU26CsvwXB9
         sRzMiVifH1L/pFn0HtvHttNRQnMJhW3LWkcQJrVv70N6Sc1kbvl2rG7eFcmTio/1t7B3
         qNV8qFx6JlRQoDoye9LhRjPrdnSz7IvJ6JT7oNC/TwnJtE9Ssn1IZWBJZ3tqaZHiZMk+
         6xNlp0RrskFQb3j/Mz7P4SP/thciOUTa2yqWUJuyr6Ah4A4wnB40havJTOGJwYDfr3Mj
         tEIA8NrlvIYFasUBYLJN0jVsKwY1vFDJ6HMAz2wTfaRIBjkS6USQsdiNU+jdmulokyE5
         tQxQ==
X-Gm-Message-State: AOJu0Yx9LXg0qtakNn8nGnOqEI4CvA92eGDltYNcj3cW8OOYEypDgKXf
	VU73nDIfvIubkq+IBgr0RUohLU5867fJK0GFPtemRMaPAr2sirhhL1hFm/t7GpI=
X-Gm-Gg: ASbGnct/rNPGlGUJv3fudE2CQmvy2AItfOcYdRQag/9X3FDjBNWzhdedhC4fy08vOmN
	z8r4tlDXrAeNU+UsfBrIiekqyuMsqX7BBhaN8JqvBMnDX389qN1Z/uvpEAvYWLAFRCPJgZ1SXTK
	K3xwQoP7uLOSFn6nHy1LSTrdtVT0lasU+V+UZzMgXf++s8vXchdp1M7eKXWDDcNB3Z1RrNPhSMF
	vVXTzX3qZNcrnZnEG3Bg08NdHkLnyNJ/b5pCJQAoBh9uI3wk2mVopt5ZgwWQkRsIZTDPSPiWc9c
	MHcfYFmLRWLzFCR0VhfrChx0rUHSKkSqz18/Ep2nqSV25MVTZ33rW9U=
X-Google-Smtp-Source: AGHT+IF+Hf/M5MyPJ5X7jQo+Ae7F7PRt1vnlHXzArnGwOu6bpPtOjajmfu2QizsYzAIfTMtTBgIYvw==
X-Received: by 2002:a17:907:9692:b0:ac1:e881:89b1 with SMTP id a640c23a62f3a-ac20d925e29mr392880566b.30.1741195561437;
        Wed, 05 Mar 2025 09:26:01 -0800 (PST)
Date: Wed, 5 Mar 2025 18:26:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 01/11] x86/HVM: improve CET-IBT pruning of ENDBR
Message-ID: <Z8iJKJN17mILVEGS@macbook.local>
References: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
 <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>
 <Z8hkLjMAQfhBR2Cm@macbook.local>
 <5978ed8d-ecef-41f7-adde-bc52312b483c@suse.com>
 <Z8hwTL8bsgjU3fJi@macbook.local>
 <0d298a29-91f6-4e3f-abac-c14fcbfbccf5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d298a29-91f6-4e3f-abac-c14fcbfbccf5@suse.com>

On Wed, Mar 05, 2025 at 05:23:05PM +0100, Jan Beulich wrote:
> On 05.03.2025 16:39, Roger Pau Monné wrote:
> > On Wed, Mar 05, 2025 at 04:02:51PM +0100, Jan Beulich wrote:
> >> On 05.03.2025 15:48, Roger Pau Monné wrote:
> >>> On Tue, Feb 25, 2025 at 12:37:00PM +0100, Jan Beulich wrote:
> >>>> __init{const,data}_cf_clobber can have an effect only for pointers
> >>>> actually populated in the respective tables. While not the case for SVM
> >>>> right now, VMX installs a number of pointers only under certain
> >>>> conditions. Hence the respective functions would have their ENDBR purged
> >>>> only when those conditions are met. Invoke "pruning" functions after
> >>>> having copied the respective tables, for them to install any "missing"
> >>>> pointers.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Thanks.
> >>
> >>> However I find this filling slightly ugly, and prone to be forgotten
> >>> when further hooks are added.
> >>
> >> Indeed. Luckily, while undesirable, that wouldn't be an outright bug.
> >>
> >>> Would it make sense to delay enabling of IBT until after alternatives
> >>> have been applied, and thus simply not use the cf_clobber attribute on
> >>> functions that are patched to not be indirectly called?
> 
> Hmm, wait - how would that work? cf_clobber is used on function pointer
> tables; any function indirectly callable prior to patching still needs
> marking with cf_check, for build-time analysis to not throw errors (with
> the specially patched gcc that Andrew prepared with a patch of H.J.'s).

Yeah, we would need something there?

Maybe disable such detection around alternative_{,v}call() usages if
possible?

I assume the build-time detection is done based on call sites?  We
would need to figure out whether the detection can be disabled for
chunks of code.

Thanks, Roger.

