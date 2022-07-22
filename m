Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A057E4E0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 18:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373380.605562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvvH-0000l9-2r; Fri, 22 Jul 2022 16:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373380.605562; Fri, 22 Jul 2022 16:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvvG-0000iR-W5; Fri, 22 Jul 2022 16:54:42 +0000
Received: by outflank-mailman (input) for mailman id 373380;
 Fri, 22 Jul 2022 16:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEvvF-0000iE-AU
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 16:54:41 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9e509db-09de-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 18:54:40 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id d16so7283300wrv.10
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 09:54:40 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a7bc8d2000000b003a327b98c0asm5372518wml.22.2022.07.22.09.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:54:39 -0700 (PDT)
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
X-Inumbo-ID: f9e509db-09de-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7oJJgHVcmYFn8MF2+FvbVxvhYZdqbXU2SoUn7GdHc8U=;
        b=fMco9Vj4Cu/pFo1pFkHcTb91YtrqkRPQfICExE1Ukwbzsk3oL8hgoiWvoBd1nJaIcw
         lQ/Cfva64vOE4CPR3fdNLYeITrcQibvHLNnnViyeb4769XQHU3/YnGW9JutDGvKkGWZl
         tctE8lZG7/hApv8ecQ9g5f4EAPK8FroRadV+JFkB+d1vcDi/7nIU8HoIZ8oKo9yFVjoC
         sl+LuKCvniW1zMrMxxvyt9DzHjU0zEWdtzi0XHjifwkEOdLABFwXV2TMm3b3k3xD5u0m
         6p8Vnw7x6GHscOEHaU3ceehDbfMNGMBdTdaZDuvVRr3CmUrHziJtvLzUJdD/vMndD3K+
         EnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7oJJgHVcmYFn8MF2+FvbVxvhYZdqbXU2SoUn7GdHc8U=;
        b=hY4zUyi7r0jMT8c2Atom7L67L80kiLzfXG016USQb8dgsPJeKfViJ23ybdnZNsUbAA
         jaDqjr0KwkmOYUoiLS2ESbrLihnbf5E1bnQcY6/EcQQFsFZht91nGRyEjdWyvKtdIuzo
         adNjxIEJeuKSQDQFOtJkQK9KL2kxdhGEF7W8Mf2sqMEtklNkdx3QA+uaTV5PG2NsJCv7
         pk/xAs46nkVWXLl7H7b84GywvpvV8K68cbcPcHHdHKuTIt8m5LMIInwbjs+PKUe3C05T
         8ZSWf8+4xgqCTvTddC/yRGCC1WYvFiDCCszrmFIVNaDWczwnlwYXbbxrVamDf+uFXn1D
         Wr2Q==
X-Gm-Message-State: AJIora/NMIgAhGNGLC2V2TCVQ6+KOfd651X1Y1Onn2O1BI2/ROKtl9ME
	Zixf2qJK7EELE8SxwvildHA=
X-Google-Smtp-Source: AGRyM1sWVPPqX0lhQet60L0j9W22O4EQrD0Q7+fx9xhtSnU9lPEstJfuYtYtd49TacM4pXzRt2NA9g==
X-Received: by 2002:adf:dc01:0:b0:21e:28ea:5d41 with SMTP id t1-20020adfdc01000000b0021e28ea5d41mr562938wri.440.1658508879764;
        Fri, 22 Jul 2022 09:54:39 -0700 (PDT)
Message-ID: <349cf7c2-6426-9a42-02c8-185aa02e272b@gmail.com>
Date: Fri, 22 Jul 2022 17:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 07/14] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <1ff53db0-088e-ec08-b757-b03639c09432@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <1ff53db0-088e-ec08-b757-b03639c09432@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:47, Jan Beulich wrote:
> This is a re-usable helper (kind of a template) which gets introduced
> without users so that the individual subsequent patches introducing such
> users can get committed independently of one another.
> 
> See the comment at the top of the new file. To demonstrate the effect,
> if a page table had just 16 entries, this would be the set of markers
> for a page table with fully contiguous mappings:
> 
> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
> 
> "Contiguous" here means not only present entries with successively
> increasing MFNs, each one suitably aligned for its slot, but also a
> respective number of all non-present entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

