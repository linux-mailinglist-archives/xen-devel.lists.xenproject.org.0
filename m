Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09EAB363E
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 13:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981326.1367719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERgz-0007Wy-TX; Mon, 12 May 2025 11:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981326.1367719; Mon, 12 May 2025 11:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERgz-0007Ur-Qs; Mon, 12 May 2025 11:51:33 +0000
Received: by outflank-mailman (input) for mailman id 981326;
 Mon, 12 May 2025 11:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oz7/=X4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uERgy-0007UY-Mv
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 11:51:32 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 727089d9-2f27-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 13:51:32 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a1b8e8b2b2so2149142f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 04:51:32 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5d6sm12094962f8f.83.2025.05.12.04.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 04:51:30 -0700 (PDT)
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
X-Inumbo-ID: 727089d9-2f27-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747050691; x=1747655491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8SDF3LYJCyjiVfqNond5j2p/vCSnfsuzefPFVHAPXo4=;
        b=IvoE3UbxYAEtmMMraMFG0ymxcv/TVInxfW56QDvXvJ47pGOiAPkPYXEdLsKpudP94h
         UJTOMNUJrKNFlwP27II+q/FMqTIsIEDvJqLlhaaMBK3qU4hVL76Y2p/fp0SPBVCtFF6Q
         w2aCRCL9m7FLlEtgZi6yilErhPBEpzc9D2I4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747050691; x=1747655491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SDF3LYJCyjiVfqNond5j2p/vCSnfsuzefPFVHAPXo4=;
        b=OfV7Wk+7h215wHiujJ4nVUWtFoOfl+UEYqFcoaSGt3m2tk0mwLsCiZy8tSORdX0c4Y
         OHc5W4ODMlQlY239i1GidPrXvPZfMCBGWP1SkpIxoekIiB9qQH5pErEMKBJARjRZYPAp
         QH2Lb9xD3HoihjESzJBoTxIidC9waiW4oehunvBxNWtNkPVOlEZeIlfkRDZ+B6zFDqqz
         R48lCNcHsz1JLbmsUlDsXtsS7uoW+TF3Lw1spL0XDcT0yQVnH8tYkrjoXesLLPja8aPt
         oI+/EIcMKTaKtLtxBFH0aDwd5LZrRcFkxlKyFEB+kcjMd8zavWl0Sp8Z2h+EyDb8hFBg
         ZaCA==
X-Gm-Message-State: AOJu0Yxl5CjC2jmsIVtf6xr0tACGfbUPDv2ZtDNlm47Hgtbjmv/jzZDN
	BHtBiwlQu+KO5vC+A4sGWZZdZTQTuNeFY8+/34VfFzpLrxgE2D3nqalc/FkuXn8=
X-Gm-Gg: ASbGnctlEX3RsdT+HmoIdK7n69gbYoyKuANmDqTjqsYck0WL8No/29YLnDsHxsmUzOq
	EDZYhWctmVLOFE5Wtf+9Sa1huFVL0UY9ltwCf1ghDx2tSROZmOGeM/Gi3G0qVhmiOJXtQgHWD8j
	oaFFrHCB6MUnv7tJp6GAZ6jOm7QDbKrSb+9PDc3CX4URu/16qtqi7hj38v5bqabVAUt7qmlK9QY
	M6wcRaBwChXvALifOfOcRzIee3VHY1k6/TIPwPFP5aBvnkcPLy/Os249zD6yR5gwECZMJ8mjzQF
	1w6Bw2GKhoSIoia8/kYjn31mU6IQWiUq/3GTeun0fJbS8gULmTDwl48uqjKKF2cZRy4avGfSXlV
	VLqDFIxpsV5519kU2
X-Google-Smtp-Source: AGHT+IGdXHuIiKYssrajeFOsVbHZ6SnQScWj+fkWJ9N15W1jc1FzwLy2ucCrQvxW2ng9vUxgzkwTNg==
X-Received: by 2002:a5d:64cd:0:b0:3a0:7017:61f6 with SMTP id ffacd0b85a97d-3a1f6436694mr10495635f8f.14.1747050691423;
        Mon, 12 May 2025 04:51:31 -0700 (PDT)
Message-ID: <33bb2c1d-0283-4cea-b1ce-84ef0ea950ad@citrix.com>
Date: Mon, 12 May 2025 12:51:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add lockdown mode
To: Jan Beulich <jbeulich@suse.com>, Kevin Lampis <kevin.lampis@cloud.com>
Cc: xen-devel@lists.xenproject.org
References: <20250506162347.1676357-1-kevin.lampis@cloud.com>
 <10454237-2ada-4972-8e31-8ae21a6d6d22@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <10454237-2ada-4972-8e31-8ae21a6d6d22@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/05/2025 11:27 am, Jan Beulich wrote:
> On 06.05.2025 18:23, Kevin Lampis wrote:
>> Add lockdown mode
>>
>> The intention of lockdown mode is to prevent attacks from a rogue dom0
>> userspace from compromising the system. Lockdown mode can be controlled by a
>> Kconfig option and a command-line parameter. It is also enabled automatically
>> when Secure Boot is enabled and it cannot be disabled in that case.
>>
>> Ross Lagerwall (3):
>>   lib: Add strcspn function
>>   efi: Add a function to check if Secure Boot mode is enabled
>>   Add lockdown mode
>>
>> Kevin Lampis (1):
>>   Disallow most command-line options when lockdown mode is enabled
> Returning from vacation, this series is a mess in my inbox (and also on
> https://lists.xen.org/archives/html/xen-devel/2025-05/threads.html): Only
> patch 4 is properly threaded. Please can you see about adjusting your
> mail configuration?

We had corporate mail problems last week, which was interfering with
posting patches.  It's hopefully been resolved now.

Kevin: It will be best to resend the series in full.

~Andrew

