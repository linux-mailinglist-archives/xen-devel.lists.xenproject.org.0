Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1339A79293
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 18:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935990.1337335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u00We-00064G-Vo; Wed, 02 Apr 2025 16:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935990.1337335; Wed, 02 Apr 2025 16:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u00We-00062H-Ss; Wed, 02 Apr 2025 16:01:12 +0000
Received: by outflank-mailman (input) for mailman id 935990;
 Wed, 02 Apr 2025 16:01:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYE3=WU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u00Wc-00062B-R7
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 16:01:10 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0a8cca5-0fdb-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 18:01:08 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so5664705f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 09:01:08 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e304sm17450271f8f.73.2025.04.02.09.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 09:01:07 -0700 (PDT)
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
X-Inumbo-ID: b0a8cca5-0fdb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743609668; x=1744214468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G+1sbc63Ze+euMZdz+WzYemuEtRMyFbIG9QURo1ofzA=;
        b=k0GiNrRNsHujyM+x4NIyIi6TssQCmYSkmiCeW8JnOP1dEoN2qQJJE5g2TZ+T3TBplB
         jG82nSvWtKWcZSeaux8x2rQeTBXo3sobBMd7ml1bfO7JWiRL/QfrZPsrC2oFentW0JLs
         XuO0gTgZuidFO4rgM5CvEoEi0tgkoMd5iZU+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609668; x=1744214468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+1sbc63Ze+euMZdz+WzYemuEtRMyFbIG9QURo1ofzA=;
        b=VBkZleut2Uk2M/KmYSFPTzY2jBvmj8AeSqUX8l16kaLW8H4K+MNf+n2af4KipngNnW
         LVwXAopmyGfuJhjoRQ7hm7Y1Pi01Ld1aMou8eizyaQDlwlcmbw7prI0ca6cP+WP44fs3
         8C0xi0gpj0IuqoRfZ41wZ6bMwU6y14ffdyHfLz7Chnk1Ww/cywZKS0CEUI1qDhgLXiGg
         mBZ9NnNgIdeGvvtBQt7Ruuiw+ftAa4kViOo579h0dKMknww1+dvVrqGBpoAn6yeu041J
         CYX/DRXLX0vueidplt/f6b79KWAFMd+WEhqJVn4RXcPSScNbSgzBAuk2Wi1XG960xlw7
         d3qg==
X-Forwarded-Encrypted: i=1; AJvYcCUMgpva5KlC+DKnkv05t8gRs5o14A2to+88EdJ9BhZKKMdJW+JqTavtTxrBQk+2i3wa0GpM+CPA5T0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZvMf6GFmsMLVkrz4JfzDdRLv+wy49J1s8BlvvFXurXur3pofQ
	+nsoSA+Vmjdd0TC+U5A1a3RgQ5gWujott8cLIDRP+Ku4zpa6KdkP0RWVVi9YIn4=
X-Gm-Gg: ASbGncs1JfYXQ9azDLOM4HDB+ss5nfamC9nsfa4NmnDGAYdE9v0obrKF8SpEF7KIjzu
	IJnBjqNDoacuvaRT5cUK8CQDu1OR06av+SU8tpEYaTpp5+TukkX8NehaFN7BpNmoBiupTKvrjL3
	manuW6bsy4IyVmRfo5rClPBxrBfXhOwEDJqxEXD5UyDrPW1K4nfCj6o3LSIgfvgc35LYY0MrsXK
	1zJBtHmPzmW2+kUOQOLb2dRqiBW6vbM476mTaJVYtTzvi7ADNEkMrmZPn+ryuXZpxQ4tuKd7oRL
	ZSiIcdrqhS5TIeh0jFlpzK1NUq+EGMsVFlMYg/8OfTQEsVuF7JTAHZm8k84jCJtDd/D6R7tYJc5
	+PLL5aPuJNONTABc/exyr
X-Google-Smtp-Source: AGHT+IFyEjzK8/XL32Y+XmMdrmXR7JnLAvofjVJqJCU1vrU4HL9gcBjTvtVUguaS3552GGSZP4HR8g==
X-Received: by 2002:a05:6000:2181:b0:39c:1257:cd41 with SMTP id ffacd0b85a97d-39c1257d4f0mr9858132f8f.59.1743609667830;
        Wed, 02 Apr 2025 09:01:07 -0700 (PDT)
Message-ID: <98c3fe8e-9965-45a0-85e7-f6064f16c575@citrix.com>
Date: Wed, 2 Apr 2025 17:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67ed34047fd3c_1209992cc92a0f99a0989e0@prd-scan-dashboard-0.mail>
 <e9e139fb-c023-460d-9d84-632a5ca4374c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e9e139fb-c023-460d-9d84-632a5ca4374c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/04/2025 3:19 pm, Jan Beulich wrote:
> On 02.04.2025 14:56, scan-admin@coverity.com wrote:
>> ** CID 1645573:  Null pointer dereferences  (FORWARD_NULL)
>>
>>
>> ________________________________________________________________________________________________________
>> *** CID 1645573:  Null pointer dereferences  (FORWARD_NULL)
>> /xen/arch/x86/mm/p2m.c: 346 in get_page_from_mfn_and_type()
>> 340     
>> 341         if ( p2m_is_ram(t) )
>> 342         {
>> 343             if ( p2m_is_shared(t) )
>> 344                 d = dom_cow;
>> 345     
>>>>>     CID 1645573:  Null pointer dereferences  (FORWARD_NULL)
>>>>>     Passing null pointer "d" to "get_page", which dereferences it.
>> 346             if ( get_page(page, d) )
>> 347                 return page;
>> 348         }
> I wonder how the tool concludes d is NULL. The only vague guess I could come
> up with is that it checks a MEM_SHARING=n build, where dom_cow is always
> NULL. Yet in such a build p2m_shared() is also always false. Should we perhaps
> help it by forcing P2M_SHARED_TYPES (maybe also P2M_SHARABLE_TYPES) to 0 when
> MEM_SHARING=n? We do such already for MEM_PAGING=n ...

What's in the web UI but missing from the email is:

343        if ( p2m_is_shared(t) )
      4. assign_zero: Assigning: d = NULL.
344            d = dom_cow;
345
     
CID 1645573: (#1 of 1): Explicit null dereferenced (FORWARD_NULL)
5. var_deref_model: Passing null pointer d to get_page, which
dereferences it.[show details]
346        if ( get_page(page, d) )
347            return page;

So it's definitely running a CONFIG_MEM_SHARING=n build, with some logic
that doesn't DCE properly.

I think we'd have a better time if dom_cow remained a dangling extern,
but I expect it's NULL because it doesn't DCE properly.

~Andrew

