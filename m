Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55B98E547
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 23:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809050.1221178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw6yO-0005W2-5K; Wed, 02 Oct 2024 21:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809050.1221178; Wed, 02 Oct 2024 21:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw6yO-0005Ua-2c; Wed, 02 Oct 2024 21:33:28 +0000
Received: by outflank-mailman (input) for mailman id 809050;
 Wed, 02 Oct 2024 21:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw6yN-0005UU-AV
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 21:33:27 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4840f9b-8105-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 23:33:25 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so21919866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 14:33:25 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297dda9sm917351666b.166.2024.10.02.14.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 14:33:23 -0700 (PDT)
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
X-Inumbo-ID: f4840f9b-8105-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727904804; x=1728509604; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fcusw84TCVSrenkHmdU4KckVgKTNxVRFd99wzfkSrqo=;
        b=ubkfjeG5XL4pxviRvdiTh8Jhs8E1Bsjio5CfF3WhWIIWuVjqWA/a4ZEYO0PbesaomX
         PS8LkjVwadqaYcVvUCz83GZiKI2gBzBGxkpgPkugx3C+HAML62+XlLotMNxPPuSs3NG4
         R5JefWXM6VHtEWsAUwJVH9UeUcXLEUn3KjADg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727904804; x=1728509604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcusw84TCVSrenkHmdU4KckVgKTNxVRFd99wzfkSrqo=;
        b=vV2g0i4IcoKTE09w7piHxNpm0EJrdOeuzqcxKXOb5JzDg9SpTnGTF79jWgiwNkyJl3
         GkBc1Noyd69hI2dlQsbg8mQBhlqeGF+mD8E7Dz7rvGCGRS54CQ+0loB7w48981MBDuyn
         YW27SaS3nooMO8Qo/w+yCfkBvteC4BO7qEPaamQuG0AAKJWapGQzIyT/7cijsYg5kcKS
         NY3hbtmSRgcioBUgs4xdiCAocYHEUzE4I3eS8M7Z6xttYCuZxrkUNna6WRgk02eX5epE
         NII2VA4JccR6mzyfg8nUIBFsQjNFxRmHrA9RneiVC+B2g3+26N8IiPoJCJ2jzEUter+x
         e+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWoGViiZNI9ZvCCfgrjNd6uvXGf1CC1k77VaVJWZMIVp0nrQKPyGNtsrFq5sD8kuhrX6WP31IGwFuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPj+c/dRLP3uTs8ByKqkcIhe0pRi+Ia0z6UzyA6/Czm5jGe+nG
	rvYX57ec8+1/QYT6X6cXAT/cw6MZRD84xdkOup675otKIGArOfx0xqhCi7pzpicCTVlGqtt4LdR
	u4tH2YQ==
X-Google-Smtp-Source: AGHT+IFnEc5XzfN+F5fren4HMmmPZMwKS907FvwMSaK07l6ILYuGG1GfScWDDiZ3b2bELnQhkdOEag==
X-Received: by 2002:a17:907:7ea2:b0:a86:c372:14c3 with SMTP id a640c23a62f3a-a98f8363884mr448185666b.48.1727904804387;
        Wed, 02 Oct 2024 14:33:24 -0700 (PDT)
Message-ID: <34074457-8730-435f-a6b6-3f43fee6620e@citrix.com>
Date: Wed, 2 Oct 2024 22:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC-for-4.20 v2 1/1] x86/hvm: Introduce Xen-wide ASID allocator
To: Jan Beulich <jbeulich@suse.com>,
 Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <cover.1723574652.git.vaishali.thakkar@vates.tech>
 <8512ff4c4d78fcd59e6f3185d8a5abd9ef3168b8.1723574652.git.vaishali.thakkar@vates.tech>
 <c618d4ac-0735-44ac-9f37-f3146039d0d7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c618d4ac-0735-44ac-9f37-f3146039d0d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/10/2024 12:02 pm, Jan Beulich wrote:
> On 13.08.2024 21:01, Vaishali Thakkar wrote:
>> +static DEFINE_SPINLOCK(hvm_asid_lock);
>> +
>>  /*
>> - * ASIDs partition the physical TLB.  In the current implementation ASIDs are
>> - * introduced to reduce the number of TLB flushes.  Each time the guest's
>> - * virtual address space changes (e.g. due to an INVLPG, MOV-TO-{CR3, CR4}
>> - * operation), instead of flushing the TLB, a new ASID is assigned.  This
>> - * reduces the number of TLB flushes to at most 1/#ASIDs.  The biggest
>> - * advantage is that hot parts of the hypervisor's code and data retain in
>> - * the TLB.
>> - *
>>   * Sketch of the Implementation:
>> - *
>> - * ASIDs are a CPU-local resource.  As preemption of ASIDs is not possible,
>> - * ASIDs are assigned in a round-robin scheme.  To minimize the overhead of
>> - * ASID invalidation, at the time of a TLB flush,  ASIDs are tagged with a
>> - * 64-bit generation.  Only on a generation overflow the code needs to
>> - * invalidate all ASID information stored at the VCPUs with are run on the
>> - * specific physical processor.  This overflow appears after about 2^80
>> - * host processor cycles, so we do not optimize this case, but simply disable
>> - * ASID useage to retain correctness.
>> + * ASIDs are assigned in a round-robin scheme per domain as part of
>> + * global allocator scheme and doesn't change during the lifecycle of
>> + * the domain. Once vcpus are initialized and are up, we assign the
>> + * same ASID to all vcpus of that domain at the first VMRUN. With the
>> + * new scheme, we don't need to assign the new ASID during MOV-TO-{CR3,
>> + * CR4}. In the case of INVLPG, we flush the TLB entries belonging to
>> + * the vcpu and do the reassignment of the ASID belonging to the given
>> + * domain.
> Why reassignment? In the description you say that ASIDs no longer change while
> a domain exists.
>
>>  Currently we do not do anything special for flushing guest
>> + * TLBs in flush_area_local as wbinvd() should able to handle this.
> How's WBINVD coming into the picture here? Here we solely care about TLBs,
> which WBINVD is solely about caches.

I suspect there might be confusion based on the eventual linkage in
encrypted VMs.

The ASID (== encryption key index) is stuffed in the upper physical
address bits, and memory accesses are non-content between different
encryption domains (they're genuinely different as far as physical
address logic is concerned).

Therefore in due course, Xen will need to issue WBINVD on all CPUs
before the ASP will free up the ASID for reuse.

But - this is a policy requirement for managing the VM lifecycle with
the platform, rather than an actual linkage of TLB and caches.

Otherwise a malicious Xen could create a new encrypted VM using the
ASID, and the old VM's key (there's a protocol for using the same key
"opaquely" to Xen for NVDIMM reasons), and read any not-yet-evicted
cachelines in the clear (because both the ASID and the loaded key are
the same).

~Andrew

