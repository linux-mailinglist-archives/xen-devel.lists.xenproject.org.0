Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A518426C2FE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 14:56:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIWyd-0002Au-Kp; Wed, 16 Sep 2020 12:55:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIWyc-0002Al-46
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 12:55:58 +0000
X-Inumbo-ID: 018a581d-c609-4366-af31-fccdf5fa6d73
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 018a581d-c609-4366-af31-fccdf5fa6d73;
 Wed, 16 Sep 2020 12:55:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600260956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGjEXI8xvLo83Jrzv7aZdQ4aCW03/EPhghT9tSAdB8Q=;
 b=lRP+W25o3bXKA7Zq9ZStWU+mZpk+Fry+Un1s0KBYC2maPR0pGXPFXoRWvSuHui+wx5dK4f
 056HLtgacRVgRXynFMGZF6TwnKU/p5dBDXfG5cnTF1k++NVm/SD4P5fU1k8wjL1muUs0BX
 Fc6zxXz0uIilRi17ob/ZvoBlbiGFPzY4c/JMG01Ba1Y7eXWcjh9TVAbaKQT01PxbGpwpJR
 DmmPONmTf8h+oR2+3mR7GZWHwmM00eL1Ns9D3O6TeaMX+4a/r4V9yzVHaRSjWfd8UkUbhD
 tWjUw+LWLf/IwRhgiml/Qp7Z3+vR3iHOL1bNYNpLIlW+/59Rtoo2RD63si5oMA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B071B538;
 Wed, 16 Sep 2020 12:56:11 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: ignore accesses to EX_CFG
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200916105426.6663-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a55eeb7-a5bf-8c9c-80e3-d697d029e7ce@suse.com>
Date: Wed, 16 Sep 2020 14:55:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916105426.6663-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.09.2020 12:54, Roger Pau Monne wrote:
> Windows 10 will try to unconditionally read EX_CFG on AMD hadrware,
> and injecting a #GP fault will result in a panic:
> 
> svm.c:1964:d5v0 RDMSR 0xc001102c unimplemented
> d5v0 VIRIDIAN CRASH: 7e ffffffffc0000096 fffff8054cbe5ffe fffffa0837a066e8 fffffa0837a05f30
> 
> Return 0 when trying to read the MSR and drop writes.

So I've gone through a bunch of BKDGs and PPRs, without finding
this MSR mentioned in any of them. Could you point out on which
model(s) it actually exists? You must have found it somewhere,
or else you wouldn't know a name for it...

> @@ -2108,6 +2109,7 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>      case MSR_K8_TOP_MEM2:
>      case MSR_K8_SYSCFG:
>      case MSR_K8_VM_CR:
> +    case MSR_AMD64_EX_CFG:
>          /* ignore write. handle all bits as read-only. */
>          break;

Is this necessary, rather than having writes fault?

> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -330,6 +330,7 @@
>  #define MSR_AMD64_DC_CFG		0xc0011022
>  #define MSR_AMD64_DE_CFG		0xc0011029
>  #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
> +#define MSR_AMD64_EX_CFG                0xc001102c

Indentation here wants to match the siblings, i.e. use hard tabs
(for now). Easily addressed while committing, of course.

Jan

