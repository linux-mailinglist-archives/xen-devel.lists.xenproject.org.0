Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478B9C458A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 20:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834175.1249752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAZh0-0005BV-S0; Mon, 11 Nov 2024 19:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834175.1249752; Mon, 11 Nov 2024 19:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAZh0-00059K-PR; Mon, 11 Nov 2024 19:03:18 +0000
Received: by outflank-mailman (input) for mailman id 834175;
 Mon, 11 Nov 2024 19:03:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mW2F=SG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAZgz-00059E-82
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 19:03:17 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 989e473a-a05f-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 20:03:11 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9aa8895facso913704266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 11:03:11 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a18872sm628446066b.11.2024.11.11.11.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 11:03:10 -0800 (PST)
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
X-Inumbo-ID: 989e473a-a05f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk4OWU0NzNhLWEwNWYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzUxNzkxLjYzMDYwMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731351791; x=1731956591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hcn3we831zpxplpf2/dfDCbDYk0zqZWM9RDxlTs+6NY=;
        b=GYHXdlHqHyCl8xR/DAbRSq3m4lkj29CYlwuPbFoZQ4WyBYEUDMBNPVPCR3rr5miE9m
         5xriKiBfYCW2baIIV+ZZUg9TSm5v4hBG5oHLl14Sr+94bTZnbc/uMcVJuAJ77y4tXC9+
         FIhQ7QQd53nIcVfno2hOCf3bXhKOgfcPgEUA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731351791; x=1731956591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcn3we831zpxplpf2/dfDCbDYk0zqZWM9RDxlTs+6NY=;
        b=f55Wxb9r7NwXxohBLk94lE1Boo0ti0VgpvoqVUQcJuO3zmoNCmj9DptZTRDMGbeJNf
         +qtGWvOXl3ujjEE+VBSZ2AuBjJGCPmiZt2mDTxUCLW3ETYyq2tkCEUsJarlOwP5i7N6z
         arikuh3zsyU+GpmiKiPuTd49lJMxCo0gkajn/BzC3bfbTklwgUcQ65+mPtixTVbaHCN1
         x0AjJVNrgeP+dDxbynfDb9JOk9GLflC7CbulaG7rO8yblpG++x+xGLIMh6yomJTeGsJn
         X81J+quypXJKnNGJ3buv1Jg7mE/xKEyRfBXkkWU+0m9nu5nrn3V43y47ABbQ0/jmOe8m
         O0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUtiKc2xydhsoyId867U1K+vCzaYRLn7Ay6pr4PQ8aHiiFwISpPEXK2HUgix53EmOPfCUHkVISA2Nw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGoCM+iBS6YIW/wfu16utlVQzZOCv5DwFlPiz7ihczO1dqfSMF
	n0/hz/S5C7ZQdKrJocZ0bv09lAYaTlU3KY8YPen+SJHU8YvnU95duy2Vh9B+DmEDUmq2A2qWTbJ
	v
X-Google-Smtp-Source: AGHT+IGADKlunvxaruzte1NqTcWAMkL3OwHYfFPzJdJWtO0ssfGAd12Q47KDWvC18mkNj/lXMuszaw==
X-Received: by 2002:a17:907:ea7:b0:a9e:733f:eaf6 with SMTP id a640c23a62f3a-a9eefe9bbcfmr1368409266b.6.1731351791014;
        Mon, 11 Nov 2024 11:03:11 -0800 (PST)
Message-ID: <f6973275-0d7e-4db4-b949-f21e530e1dfc@citrix.com>
Date: Mon, 11 Nov 2024 19:03:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 00/15] Remove the directmap
To: Elias El Yandouzi <eliasely@amazon.com>, xen-devel@lists.xenproject.org
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com
References: <20241111131148.52568-1-eliasely@amazon.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2024 1:11 pm, Elias El Yandouzi wrote:
> Hongyan Xia (8):
>   x86: Create per-domain mapping for guest_root_pt
>   x86/pv: Rewrite how building PV dom0 handles domheap mappings
>   x86: Add a boot option to enable and disable the direct map
>   x86/domain_page: Remove the fast paths when mfn is not in the
>     directmap
>   xen/page_alloc: Add a path for xenheap when there is no direct map
>   x86/setup: Leave early boot slightly earlier
>   xen/page_alloc: vmap heap nodes when they are outside the direct map
>   x86/setup: Do not create valid mappings when directmap=no
>
> Julien Grall (5):
>   xen/x86: Add support for the PMAP
>   xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
>   xen/arm64: mm: Use per-pCPU page-tables
>   xen/arm64: Implement a mapcache for arm64
>   xen/arm64: Allow the admin to enable/disable the directmap
>
> Wei Liu (2):
>   x86/pv: Use copy_domain_page() to manage domheap pages during initrd
>     relocation
>   x86: Initialize mapcache for PV, HVM, and idle domains

There are rather a lot of build failures somewhere in this series:

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1536969743

~Andrew

