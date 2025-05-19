Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F0ABBEC2
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989790.1373744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0Ht-0001VG-75; Mon, 19 May 2025 13:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989790.1373744; Mon, 19 May 2025 13:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0Ht-0001Se-38; Mon, 19 May 2025 13:12:13 +0000
Received: by outflank-mailman (input) for mailman id 989790;
 Mon, 19 May 2025 13:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH0Hs-0001SY-Jj
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:12:12 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e011080c-34b2-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 15:12:11 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6020053cbd5so355032a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 06:12:11 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac33d7asm5727855a12.52.2025.05.19.06.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 06:12:10 -0700 (PDT)
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
X-Inumbo-ID: e011080c-34b2-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747660331; x=1748265131; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Xwedm6Ci7gw/Y1DGzI1B2QHKHiuHQ2T900iL3ZIxhk=;
        b=MJbO1U37d05ziBs8G4sVdApwaynEYEXjMwtCJOs4sFFKwzMTdeDjSJ7uf9nnr4ML+Q
         tvEJ1j/caNIZytbgoWGawOg1hcE/ScukFghRfB/O1kaTTHUls1AUO0yzklRJ9/z9ybrT
         nqGmWHFDDB/6CPihfFbPqaV9L7130Mr+NFtKj3LAl6iIvd8dDsCJqRQVYSKLXHLMxBGj
         53eMXmrGuGgzx8DAFANP7vZFsWdqnOcs4jyEf9uG8Oyp0i62NH3uR9fPhUHp9ZTXUXM4
         PbjBXofGNsi9pNKKPO+MI6IgdjsNKKqf0WUwuiDeN6ykeIc2QNze4keb1vtjWXXD2Bqw
         CS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660331; x=1748265131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Xwedm6Ci7gw/Y1DGzI1B2QHKHiuHQ2T900iL3ZIxhk=;
        b=AIXOqfSR+z2KegJ1kwMrN6vRu3dIbXE2EWAnJEIshIlwbTSkgygnB9aj+b0bBRY2Zn
         oO4ZBZu7e8RvaCENbcyMcwExCYOaTrkgF5G6lWIwBzAW35qxWPRPQnaiG5SHKXhqWL2q
         KxGhTMzROqCR9ZdcgnbdSIHzOHSMZFIyiYF1eKO5exjGWgqhZs2VVE86Al8Fx4+ledky
         bojhl5e0Vle8N2Nj/kIe3ZanewHEXlKtJ20crZ6InkTmYJalYW+qiyzGFOnmkR4URRN/
         5+rBMcnp/ut8PAe2Fhqb2PQkCKulzOruZOe2A7+Yuq5nC/ezDsj9b/2N3GDvPKqBOcoE
         WQCg==
X-Forwarded-Encrypted: i=1; AJvYcCWh5Q0981hsj9y5lU0TUbQ7QBHK8ujE6IJvzXpBhcNESsMsdaYNHeqp35QwIKk4K0LCLVIPkRjYkR4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywvuy8OV/A9tFK+2mQLU63H8dfB+UH7aYpSV+Bq1zCOlBc9Ek6U
	qDM8YHCOoYRxC8oNKmrhemdlzosP2pjAUk/lt4Ls66Z7ErXOBk64DheWx4VxI5dqZA==
X-Gm-Gg: ASbGncvElbW7o9Yt9goUdcUX4evhuDdvtAtuul4bS825Bz0Iz+AptoWP4Eg1hQ9aZH8
	UaOcl7PPP7kGm69hVg+dXaw2cD9ExVcR2cVhIMIsK83O8yGuEJYzNcBMkrvPGDD42/8N7CdHEAh
	f4NK8/PteKNWe4tg8m9zwsyiXi5Rj1mubWB+m0fDTF2PbfDUIjNbH5ybfOETr+RWZMNg4EyDD67
	iuUZAfgvIEqUGqvLsPa/c/pml1KjGy54WasNa580B2WZJ3UkNdN4O7WBKi0cvGpHtkfyvaeiWRG
	/r+gl8yg9pZPZChztFpDdwtL0Vc0NdrOXAlGkDb0TavsjtVOTNeBoB7CBj3bCA==
X-Google-Smtp-Source: AGHT+IG9V3kbGylfNierMJujsYwFRYqDIP892HWrZCzl+nyJctU+ZQeWm9SGfEEjmJOXjVPZXqkaCg==
X-Received: by 2002:a05:6402:26cd:b0:601:d9f4:eac6 with SMTP id 4fb4d7f45d1cf-601d9f4eef5mr4524785a12.21.1747660331151;
        Mon, 19 May 2025 06:12:11 -0700 (PDT)
Message-ID: <981cf287-f096-4dd8-b98f-3b59de4a76c7@suse.com>
Date: Mon, 19 May 2025 15:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] vpci: Hide extended capability when it fails to
 initialize
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-7-Jiqian.Chen@amd.com>
 <48c71b8b-2b59-41aa-ad02-b237d53f1d6d@suse.com>
 <BL1PR12MB58494E5187A483E992930AE5E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB58494E5187A483E992930AE5E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 09:41, Chen, Jiqian wrote:
> On 2025/5/18 22:47, Jan Beulich wrote:
>> On 09.05.2025 11:05, Jiqian Chen wrote:
>>> --- a/xen/include/xen/pci_regs.h
>>> +++ b/xen/include/xen/pci_regs.h
>>> @@ -448,7 +448,10 @@
>>>  /* Extended Capabilities (PCI-X 2.0 and Express) */
>>>  #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
>>>  #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
>>> -#define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
>>> +#define PCI_EXT_CAP_NEXT_MASK		0xFFF00000U
>>> +/* Bottom two bits of next capability position are reserved. */
>>> +#define PCI_EXT_CAP_NEXT(header) \
>>> +    (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xFFCU)
>>
>> Please can the hex digits all be / remain to be lower case, with just
>> the U suffixes be upper case?
> Including "0xFFF00000U" or just "0xFFCU" ?

Both. See also patch context here.

Jan

