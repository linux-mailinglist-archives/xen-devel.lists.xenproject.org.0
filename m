Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EC3A50295
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902378.1310333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpq2V-0002dK-D8; Wed, 05 Mar 2025 14:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902378.1310333; Wed, 05 Mar 2025 14:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpq2V-0002b9-8n; Wed, 05 Mar 2025 14:48:03 +0000
Received: by outflank-mailman (input) for mailman id 902378;
 Wed, 05 Mar 2025 14:48:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOX7=VY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpq2T-0002b1-DX
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:48:01 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5a53087-f9d0-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 15:48:00 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e4ebc78da5so10530290a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:48:00 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3b6cfd0sm9779224a12.28.2025.03.05.06.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 06:47:59 -0800 (PST)
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
X-Inumbo-ID: d5a53087-f9d0-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741186080; x=1741790880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mHHmztZAjJxvYP5dhGLCPAJTUSZ/NvSgW1eL8jBD1qM=;
        b=Usi6ah+VgRNbFsSkWFqvE/SsN0PoM2K4i2yNMvWjLiYrgvQOD4DBwTt07mINEWJQ5M
         +Ou4Y9ld+xhRrY2xf90Atoa2yTXl6nOE4KlS1wBDC6HcGmp+il5A34xCRYf+qcm+hfvI
         OTRMS9L5sRk9AZLT5RlcE50lt1S0P7oa3uTyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186080; x=1741790880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHHmztZAjJxvYP5dhGLCPAJTUSZ/NvSgW1eL8jBD1qM=;
        b=wzsU2auEcu3SSH4oW97hkopavxDPq/W8i09cOiNSqk1bwwJSQ0Rd70FIVRqaY3U2Cf
         m03P3dqmC8125W2FCQBlWzYbVuTsZBvX3OWqAnlgzc7NUaECNSnhxITRij9N2NuXV28Q
         1pEVdEtYC9442/TsAOFw7EQ0zZjYYUukdZm0GJTKkG2TyJDqdfOCIuNFwjwVlLHHCJo/
         3OoHnpQ90iX1/Mqoww76zpkL2YgLxOMHn9DW4n/jLprjTY7fxBHJJBGlJHRBnzA7HHqF
         BD3MXSYvL+TuoIhOo2AFofZAxUaKJuZQ5qPZlhkCAxTyqZYaYqIAAhkZAUDdP/kXoocP
         9asQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1UGTel4srDolhyg2xisAcfRAWuaoIYvxgj9NReChRHRmk/vw1TUfcoUWq9+8oMUiCyXoJIh9YXFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxsSvRSiwp0iJw3dizLby2pFf4pIB+tMz2z46M29Vdjex211NQ
	KZvZnbVLFJ1NNqVHjB759MKM5CPZRGFB17pC6AvAgDleSoCW+6LN3WaRyTc+unk=
X-Gm-Gg: ASbGncsn+9UWosEti2A17vNT501DvddBttCVgHov2b9+363H1CiqxibXlrfoWFrvHL/
	IvuMdaZvhLnMFw4C2lwp+N+lBMgzcZeDce9Ux409RBKo1G0GUnEkGLAlGgNTN2GFseys/bgMhQT
	4S5WR4dOsaekt/VsMItmKkJfPiVQ1WZW3HvMHuvuhhK/UEC2dXO5pOzgcl3TJRoq4nDx83L/tC+
	yxk3d1fepJ08BHfM15s+D0oBub6tq1V8dIgA2eQAVMM2IyKWKUBP186dE8j6YtEhHNCUIvH1KZN
	AAZZfEXzMq7RFHt4P8fyXerl3HmkeDmp3BaLZLu/tm3VAWOzvwxdHD3KlDYAGql/WaSKRuOOgrJ
	H/IL5Dgii
X-Google-Smtp-Source: AGHT+IG3Bb+9oPGvRgjNn+DsHmLL7dUD6t1F06RhQapElKL0lQBpOP99jFFzqiRxd6NVLgwc5bcB6g==
X-Received: by 2002:a05:6402:350f:b0:5db:f26d:fff1 with SMTP id 4fb4d7f45d1cf-5e59f4561bbmr3046370a12.21.1741186079999;
        Wed, 05 Mar 2025 06:47:59 -0800 (PST)
Message-ID: <11dc36a1-6b34-4e06-ae6b-4019a024bbd5@citrix.com>
Date: Wed, 5 Mar 2025 14:47:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] x86/HVM: improve CET-IBT pruning of ENDBR
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
 <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 11:37 am, Jan Beulich wrote:
> __init{const,data}_cf_clobber can have an effect only for pointers
> actually populated in the respective tables. While not the case for SVM
> right now, VMX installs a number of pointers only under certain
> conditions. Hence the respective functions would have their ENDBR purged
> only when those conditions are met. Invoke "pruning" functions after
> having copied the respective tables, for them to install any "missing"
> pointers.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I don't especially like this, but I can't suggest anything better right
now, so

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> This is largely cosmetic for present hardware, which when supporting
> CET-IBT likely also supports all of the advanced VMX features for which
> hook pointers are installed conditionally. The only case this would make
> a difference there is when use of respective features was suppressed via
> command line option (where available). For future hooks it may end up
> relevant even by default, and it also would be if AMD started supporting
> CET-IBT; right now it matters only for .pi_update_irte, as iommu_intpost
> continues to default to off.

This is all mixed up in the breakage underpinning nested-virt (the false
believe that there is some kind of "global" idea of how a VMCS is
configured).

I suspect this might just disappear in due course.

> Originally I had meant to put the SVM and VMX functions in presmp-
> initcalls, but hvm/{svm,vmx}/built_in.o are linked into hvm/built_in.o
> before hvm/hvm.o. And I don't think I want to fiddle with link order
> here.

Why does the link order matter?

~Andrew

