Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2336B1D5A7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 12:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072779.1435751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujxgt-000260-PI; Thu, 07 Aug 2025 10:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072779.1435751; Thu, 07 Aug 2025 10:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujxgt-00023Z-MW; Thu, 07 Aug 2025 10:17:43 +0000
Received: by outflank-mailman (input) for mailman id 1072779;
 Thu, 07 Aug 2025 10:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYnK=2T=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujxgr-00023T-MP
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 10:17:41 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcd5dce6-7377-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 12:17:35 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-459e1338565so7723545e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 03:17:35 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3c33fesm26651226f8f.29.2025.08.07.03.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 03:17:34 -0700 (PDT)
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
X-Inumbo-ID: bcd5dce6-7377-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754561855; x=1755166655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fSmOKeMJ4X/DXAykdFa6tQ4kNJhJb62PX4h/sBM1lw8=;
        b=rBGxwRecgOlK5FVmFuBAgFVH/mD8IH0dWDXshCgDTIdaOZtjnHVQSM299gWQmFVg50
         StNe7LJoDTZHblIyUFBfR7nC0t7e1xhglE8sUfwN0HPcqvE+3FxM1bLLptM4cwvcrtDa
         KFmnq4Y+gMnsH1scZ+XZA8wZuREeZp54odw1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754561855; x=1755166655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSmOKeMJ4X/DXAykdFa6tQ4kNJhJb62PX4h/sBM1lw8=;
        b=nqjCB6Js38lSNLMWSjimXCDN2YAYbgZ7GkqmJdCGsia637lKuEU073q5p7HI7GqwBj
         O60gEjPY4WDsMhSHhDIrq3NobTQB5HIhW7J7UwwGA6EpTlM4e8E+6V+tYat9HIpYN/m/
         VwkROc98eXW1q8b+aMKwBcYFkakph19Je4H5VjWn46dvwzeaOsY5P65ut62XPtWAtTIy
         clYKy0RzcDhSp837Cv4bu6Fx5sOUEsQ8wpIPQp4m9yK8Dq5lJ4zdQgLIm10gO4NnY3SI
         /7OMk6oSnrJe0yryhpTTSNu3ba3NAohesSQbqobIWus+7Yrd/tjzsQRC1yvsoXUKQ3uS
         HmGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB9ArU74qJmiWo0MtJKRfKfNACW2l/nxlyEjzJi/jgTotjY5Z1zhCvar3wimRMC36sHh2qwLkFC08=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqemXyEfVjWNCUvM3LCRTK/wMmzY5Eh4dxD3YvLrgwk+GcVbVT
	QPLm5T+8AHFsPH0idXVA0Vd6VXidBenNzEF/UIb2kDDWXiQLxO5l1oHuAV4a5bjsyqw=
X-Gm-Gg: ASbGnctarZIugI6NyoC4Xzu7+uF62CUy29Dr/uyJM7wBoicikR+FgUPsriawZh5YBMm
	3aJmB6uO2k+yqSndzhIKlTya49B8kBRpXhBysh45PrtMo+ljXn7Gfi/9JEEDdkoYME6tXBciO08
	KxS25XBT+fqQk8usiWN075hQumlgpa00qoMIZm3PQ4haRGa6m354UIsho2Lowm8b7ZVa0RekXPK
	VJf21KIJ+usg4k81gEtncpFhJO2lXm+Pw8nn2DP8CEMc4xmBukqjxkGe1JJX4dYpzH3aZGHmEK7
	Zcjr/z1LZdkE6LN2kw6fdzWNWWpiKPXxyzOUd6kMmoGWuZkBWU0PyTZHlKmpBHoq3Nou5hbt1ye
	t4tdaJIn0/QJI6lYZP+FQtx+zaxGCX4TEmxyjc4EfHNXKCcg7hoQYfwnkfGsivkxZQYi4eGmBYU
	CBVQI=
X-Google-Smtp-Source: AGHT+IEMLxhLzUpNuACgKsbjsE/gPXs84zP+2A7un4e247ynqw0SJt24yiqiEgDSj+zl+wrfibOznw==
X-Received: by 2002:a05:6000:40e1:b0:3b8:d138:41d3 with SMTP id ffacd0b85a97d-3b8f49441a1mr4551260f8f.56.1754561854943;
        Thu, 07 Aug 2025 03:17:34 -0700 (PDT)
Message-ID: <848c5da3-5aa8-4f0e-a9ed-cd41a5fac0b0@citrix.com>
Date: Thu, 7 Aug 2025 11:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domctl: Reject XEN_DOMCTL_hypercall_init against
 oneself
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250806165543.169140-1-andrew.cooper3@citrix.com>
 <a4a0d4ab-1fb5-4949-891f-318e3dfa22ac@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a4a0d4ab-1fb5-4949-891f-318e3dfa22ac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/08/2025 10:30 am, Jan Beulich wrote:
> On 06.08.2025 18:55, Andrew Cooper wrote:
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -372,6 +372,14 @@ long arch_do_domctl(
>>          struct page_info *page;
>>          void *hypercall_page;
>>  
>> +        /*
>> +         * Kernels should use the MSR method to get a hypercall page.  The
>> +         * toolstack should not be using the DOMCTL on itself.
>> +         */
>> +        ret = -EINVAL;
>> +        if ( d == currd )
>> +            break;
> Isn't what the comment says more generally true? To act on themselves, most
> domctl-s are inappropriate to use, I think. There are a few exceptions, where
> alternatives simply don't exist (and where, if a kernel wanted to use a domctl
> [or sysctl], it would need to go through hoops to deal with the interface
> versioning). Yet there's still the question of whether we shouldn't apply this
> restriction in a broader fashion.

I'd go so far as to say that domctls ought to be restricted against
oneself, but it's not quite that easy.  The majority of them already are
restricted because of domain/vcpu_pause(), but this is all ad-hoc.

In principle, the control domain ought to be able to issue some of the
getter's on itself, but even that's inconsistent.  get_dominfo is
permitted, but paging ops are not.

This is still a TBD for the stable tools interfaces.  One option I am
considering was to split the opcode space by whether it was logically a
getter or setter, but I expect this does not work nicely if we also want
to retain backwards compatibility.

~Andrew

