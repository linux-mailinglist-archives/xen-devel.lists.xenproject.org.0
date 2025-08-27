Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3EFB3855C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 16:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096237.1450994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHRZ-0004Av-7V; Wed, 27 Aug 2025 14:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096237.1450994; Wed, 27 Aug 2025 14:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHRZ-00048d-4K; Wed, 27 Aug 2025 14:48:09 +0000
Received: by outflank-mailman (input) for mailman id 1096237;
 Wed, 27 Aug 2025 14:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AuO=3H=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1urHRY-00048V-3H
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 14:48:08 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d71e94f0-8354-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 16:48:06 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45a1ac7c066so5953605e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 07:48:06 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b66c383b1sm37866455e9.3.2025.08.27.07.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 07:48:04 -0700 (PDT)
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
X-Inumbo-ID: d71e94f0-8354-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756306085; x=1756910885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Obdz0x/yj+Spq5okJ7Np12BJQZUL7mGTKCXXm1j+vN0=;
        b=lEQmn7y/0PulsZn6MbeFp5fb6V8Gn4lJtwDS7/DO9Cvhy99/q+zrnNnxzuqPj0YJgV
         4AcQkezycNIs/k4yYCE+kG1tgw2XTyEhIUu7RjelBbIX815Hk8uDjrQlMCl8kWsV88+A
         8xdOukVEty++TsasVCjbPCZhO9MBE/PWFZofA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756306085; x=1756910885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Obdz0x/yj+Spq5okJ7Np12BJQZUL7mGTKCXXm1j+vN0=;
        b=dyl/MMNjEZsYVEx8FG8FiaJY0hfP4+w+Zk9u9s5KQQE7im3VLGA4Q1HR8GKXTmk9xr
         WX0Fq3EF3KGHIvDKTKgchpe3VpYcxDfGOFRjlVTTJDg9sRviwBRMqZ6s+zpj9OxX7lMv
         3BUVdkpLMGEsQtLMWIz2Lh02Gkj+Xr6uhiVKLGi0dDmwf1VFX9RiZu1kLGwzzRWtHHEG
         7LoCKe0BSk5ObqKoKjTerhaCP1PcaKLINdIcUncd3m2cpFhAhOfv1S82mH8ZrDsIWjsh
         wbkJmHHN/+FhscZFyMpDfo0nXJBhiBlSxd6VuhRtnQAvNdfOkgjAE8zycaxEE/9MzUSX
         VmmA==
X-Gm-Message-State: AOJu0YyeRoeN7bHoqwj5DxRX5PIeDJ2EgDqCDZ2bOucVCfvNc9Sd8mHT
	fEp/I8JAf89NqkZ6GEa4qe/BdWljkFwjKhw1UPD/tZBFf6+udG0F1ZZvULhSG1wYBdc=
X-Gm-Gg: ASbGnctUaUGZaY+U8NffWMjSsQkt3O3Cc8T5PF17CvBEpKKcxlArn43+TQPeFrO+o4P
	rNBlVx7ZivvT68aAX0I4tT7wy1pDwI60d9MrWzAishMoDbLwcn5I3nTCNj6mC/nkqhxyj5FPTDv
	JGuOP0LlL2KNTNbBlH8hqfgVJz3LN5ZEUqoDlH81KT6udU0rL+q2wOuCvYr/cU4HE9zUaobJQc8
	hYx2LjGFALq/Z4iGjK24FfFrwBDTv6AkwUiVHe17IbaCLGcNiiyjpgL4Xk7OXAurQjvYjkBLGk8
	09TmKrv4wK81HkigWSfNyaY4g8X7oLzqOzaTmJ5ITgnMezevDNKBKeZV2HSP3sLbeAbiT0pI6lJ
	/k01WqS7oLAUgm+DrHmcxGU6zHL25NNZ0432+ufwGz79XgqRwqEknZ7oHVRkXy0OYF+C6YcLcVT
	t9arQ=
X-Google-Smtp-Source: AGHT+IFub5R9LZJw+P2GEqnEbL67YdW5VLMTeyQTpVwVMd2JdrU+RLeGXatI33kuY7tMTcV+Axdhrw==
X-Received: by 2002:a05:600c:4443:b0:459:e39e:e5a5 with SMTP id 5b1f17b1804b1-45b6870e392mr51398765e9.5.1756306085297;
        Wed, 27 Aug 2025 07:48:05 -0700 (PDT)
Message-ID: <55b8dcc0-2d16-467d-9d86-ce2d8a3bc7a4@citrix.com>
Date: Wed, 27 Aug 2025 15:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
To: Anthony PERARD <anthony@xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
 <aK8aQhpOYWcm3EzR@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aK8aQhpOYWcm3EzR@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2025 3:46 pm, Anthony PERARD wrote:
> On Mon, Aug 25, 2025 at 05:50:02PM +0200, Oleksii Kurochko wrote:
>> Hello community,
>>
>> I’d like to remind everyone that the Feature Freeze deadline is approaching,
>> and we still have some outstanding requests from the community for patch series
>> to be merged into 4.21:
>>
>> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
>> 2. Introduce SCI SCMI SMC multi-agent support [2]
>> 3. Introduce eSPI support [3]
>> 4. FRED work: [4], [5], possibly others (?)
>> 5. Introduce CONFIG_DOMCTL [6]
>> 6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
>> 7. Some other patch series I missed.
> Do we want to add this following one to the list?
> - Allow to build libxl and other tools with json-c instead of yajl
> https://lore.kernel.org/xen-devel/20250808145602.41716-1-anthony@xenproject.org/

Yes.  That was requested by downstreams, and is also bordering on a bugfix.

~Andrew

