Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB27A9C7CC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967790.1357509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HP5-0007kb-Qr; Fri, 25 Apr 2025 11:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967790.1357509; Fri, 25 Apr 2025 11:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HP5-0007ic-OI; Fri, 25 Apr 2025 11:39:35 +0000
Received: by outflank-mailman (input) for mailman id 967790;
 Fri, 25 Apr 2025 11:39:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c45=XL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u8HP3-0007i5-LE
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:39:33 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3af097d-21c9-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 13:39:31 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so18696215e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 04:39:31 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a5310a1csm22164165e9.20.2025.04.25.04.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 04:39:30 -0700 (PDT)
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
X-Inumbo-ID: f3af097d-21c9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745581171; x=1746185971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z30g6b8JfD0qVCG8icP/UxDOnqfQU4fvycuZG/EmgkY=;
        b=il0XoHS+OsGQK2LrGLhihz/KCI7yzbjQEngmvA2ux7aB+gAvr21R+I/Batpen0nBL6
         xm3bDwqPkwCJ+31vbMxKZ9G50xvDUE5itFsVdqnHkwu5OmjWbQzn83BFrAhoygWnsexn
         LXaakVQlwRR6kEr6rngiIwv++MI9LvT4hD3G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581171; x=1746185971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z30g6b8JfD0qVCG8icP/UxDOnqfQU4fvycuZG/EmgkY=;
        b=o/Siqixk9/TUsCeJELoFhFFRkWYIzcvCAYEZGSlynm06iq4m8h7HCkBRDIsjGZUKuz
         6+sKpNZ+r9SDtqet+F0erczjPHJhINQ+DgADWfHXk5NfyhMfTyjFckyZZP+0kyj1vPoC
         IZBq3GZY/5Ga0a8vGIhi+6kvfl+5EMuWuEP5hFlKBZdb3u73QBdQlI1an0AH+mSQWWlF
         X0v68aEOjyKe5EsM4NrxlJfzbD0/MReA4fI5EtQvXvqQZ4oOOsOR5EhwbIHMVS/iXT08
         pG1NqTsQpwlVMmMvw+/CNrrX5FP7UpgZIFEXMYIG1aStofBjcV52TSTWr78i1Vfxu09m
         H+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFe0wc4fPHEUZu+9XeUQIExZ8txxHDS3orFgT42hc19W9lRnkFWKwK1+c9UgwO0GMDgQcEX5NF+UQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBayYGDH+fKY5ncWNAVxYvsMkRugaJZ9ya5BQ/DuH1S6Ie85dO
	xJDHdrsFFko3Lg8HT5vR5wsl5RnGvEEk+4+4jvgIeo59aBrO/EhYgY1ObD456ung7gAlmNaqb6p
	D
X-Gm-Gg: ASbGncvk44tSHC9yDXI3S62WE1y9JvvzBaa4JnqQ98SRrt+4F3EKbSUiy7cnYD6+LA4
	GQoNIOpTkzqQedKcObmdasrtulfyXtMB6h9+4/a4o7HyCqHXkwcb+aNFzKlCBezos0aqhz+mc1Y
	rEp/ybvlVCxMLfMPVQlZvV2JBOsaEUDKwJ8FZXRSgoSJIZusyNT/bRMHEjoLHDEPEXpHevPft7n
	o3bxSg5VovpK3EtFZqOfjNd00lkS3LE5vp2JJkDSkyWa6bVvShFYYdEVBqc3GlakHvXS0G8ZQm1
	GltgqY9eUwasl45jJiNM/UDNIgTyOWAsdoyehVInpzgEKtfCuvVSAxnrC153Bq2GKqe/YtmcAdz
	rJsZsEA==
X-Google-Smtp-Source: AGHT+IHQDWVRNnRugX0+1l3h0D50/d+pO9WsdFrv/ZO6dEniUnRD1Dy8MdD2WOJQm+628qqv2fXCBw==
X-Received: by 2002:a05:600c:468d:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-440a669edabmr14338175e9.23.1745581170972;
        Fri, 25 Apr 2025 04:39:30 -0700 (PDT)
Message-ID: <62216f26-e408-4ba2-a2bc-702531a13bcd@citrix.com>
Date: Fri, 25 Apr 2025 12:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] ppc/mm: Introduce mm-types.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
 <20250425112415.245585-4-andrew.cooper3@citrix.com>
 <71e1847a-6469-4596-b721-38e8e0060194@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <71e1847a-6469-4596-b721-38e8e0060194@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/04/2025 12:37 pm, Oleksii Kurochko wrote:
>
>
> On 4/25/25 1:24 PM, Andrew Cooper wrote:
>> From: Shawn Anastasio <sanastasio@raptorengineering.com>
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>>
>> Possibly not for taking on it's own (might be better with the PPC
>> implemenation of map_pages_to_xen()).
>>
>> Nevertheless, this patch alone now does trip:
>>
>>   diff --git a/xen/common/vmap.c b/xen/common/vmap.c
>>   index d6991421f3f7..9552806dba39 100644
>>   --- a/xen/common/vmap.c
>>   +++ b/xen/common/vmap.c
>>   @@ -228,6 +228,8 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity,
>>        void *va = vm_alloc(nr * granularity, align, type);
>>        unsigned long cur = (unsigned long)va;
>>
>>   +    BUILD_BUG_ON(sizeof(pte_attr_t) != 4);
>>   +
> Could you please clarify what kind of changes should done in the case if 
> sizeof(pte_attr_t) == 8 (unsigned long)?

Nothing.  This is simply to demonstrate that __has_include() is working,
and is making PPC different to all the other architectures.

~Andrew.

