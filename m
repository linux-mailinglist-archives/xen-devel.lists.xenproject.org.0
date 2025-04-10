Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC33A84E07
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 22:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946287.1344236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2yPZ-0002fM-8B; Thu, 10 Apr 2025 20:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946287.1344236; Thu, 10 Apr 2025 20:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2yPZ-0002cp-5P; Thu, 10 Apr 2025 20:22:09 +0000
Received: by outflank-mailman (input) for mailman id 946287;
 Thu, 10 Apr 2025 20:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2yPX-0002cA-J2
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 20:22:07 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7934bec7-1649-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 22:22:07 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so796520f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 13:22:07 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0b35sm5713285f8f.70.2025.04.10.13.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 13:22:06 -0700 (PDT)
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
X-Inumbo-ID: 7934bec7-1649-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744316526; x=1744921326; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vJuMSl6MDCHrCfCwO5gwrSt7KECAIJMXM9EXOu8ucRw=;
        b=d0II9GWik8QaNzv6mqos97xHGEhfG9zfBRGvvmR30lZJyUebVqElMR7QxlftJuNO/o
         cgSv53nwl9tNPeE/Qu8SZfMKsMDUwceTBfzXbVWQBjQ1nGzVieCYA3uFn0Lk/e8+1cvO
         kCJkNMKKU+3rlL8l3umoEm/6QZyqw+4nWHsog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744316526; x=1744921326;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJuMSl6MDCHrCfCwO5gwrSt7KECAIJMXM9EXOu8ucRw=;
        b=Gd9Z3F59ydv1Du1AeCsR1hAOSRHkjUrmx+E3OH0/Cr3ow01n5RwHmwnHjRoLwmBXIL
         fGn5rr21fZMH08SKzrbRkEVQGeZaFnNkxmxO1gOYYT0+F4yLo/jQsmqXdTc/LWyFWQwW
         6x39+zzH58AD0jaUgmfPtiVyXkFS8rSeuCMrMhLvx+OG67UyUEZ1G7LSgC5PL4DLKAHf
         NCaK13te2GeHDtyBXcD2q2VpJ3Yppz8vPvcs03OJkHVpjJKNwt2x3nQRlwbDCyIVbxQj
         G0qgZjb5Mks8PV3SDR0RbTH3DDn80CqP0JZwprp1GF6FN++yepP+aqkQQR8EO154tXQC
         OsPw==
X-Gm-Message-State: AOJu0YxNZumrSJsEBu2pYGLxydcVm9iULAU7Qd7lsjYxo9/cg8qMTOcr
	eyj/9ceVXpR3uOchaF0f2p4YNc5ZNLLlzXFsMc3pf3YujmUqvgn3aisEVd43mao=
X-Gm-Gg: ASbGncs6Uui9hRUbGOyltA16LEEkKyb3vUrsDyqq6XfyB6dcWE4aGyxWjghYvGaOJlY
	X8t+CpicrK80jbUksZvfZ9Ih+/FdK7w+UB5M4zPTAPGOnjEdopwTc5uKtAm2RefWDGHi4Sbec1E
	RukbDIB9Ht9X93698DEkZXKfNAsUM/Khj6UZoTAtCC0/YBQbr4H7wDmBRq0SHdbZFE7S/9znzrZ
	JE0ttqQKdDvopVLuNscbbnTNi3mq2VKbaYfzh+t7GoNTznKhBYRyie8P1rVyWWGb2mxl4W3veN0
	AMiKH1I4f37yZL+mpV1+4GMFfWDSILKmtCJNrppbm0HHN2PZprRmVLYIwL0t0ctcu/z1P/eQJIm
	tKw87iQ==
X-Google-Smtp-Source: AGHT+IHi5WGrrOMHU4I9mNQ3ro/5r31Pa3tngRTxcoWSmgKxPyWERI/L6nc94H2ye0H71VtQ6Vi+Dg==
X-Received: by 2002:a05:6000:2ab:b0:39c:1f04:a367 with SMTP id ffacd0b85a97d-39ea51d359fmr66019f8f.4.1744316526641;
        Thu, 10 Apr 2025 13:22:06 -0700 (PDT)
Message-ID: <c4118db0-668a-4b34-a152-3d79dee0666e@citrix.com>
Date: Thu, 10 Apr 2025 21:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: Remove bespoke service B.UNEVALEFF
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>
References: <a2b2d290e62bf6727769af91d3955bdd989ede3c.1744313419.git.nicola.vetrini@bugseng.com>
 <b5f0ef7c-2f5d-49a2-b164-9f1e433b748a@citrix.com>
 <a39c5089ab9e1b5b97308bfd9728a162@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a39c5089ab9e1b5b97308bfd9728a162@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2025 9:17 pm, Nicola Vetrini wrote:
> On 2025-04-10 22:08, Andrew Cooper wrote:
>> On 10/04/2025 8:32 pm, Nicola Vetrini wrote:
>>> The service is now part of the updated ECLAIR runner, therefore
>>> redefining will result in an error.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Presumably this will be needed on all branches using Eclair ?
>>
>
> Tes, that would allow to reuse the latest runner on those branches,
> which is probably the best course of action. Since they get
> (presumably?) less activity than staging, that might be held off until
> then, before any other backports.

Well, I'm doing backports for other reasons, so I'll include this.

~Andrew

