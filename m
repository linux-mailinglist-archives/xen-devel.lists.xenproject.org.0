Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBB57EB140
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 14:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632456.986739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ttc-0002nP-Ku; Tue, 14 Nov 2023 13:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632456.986739; Tue, 14 Nov 2023 13:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ttc-0002kl-I0; Tue, 14 Nov 2023 13:56:04 +0000
Received: by outflank-mailman (input) for mailman id 632456;
 Tue, 14 Nov 2023 13:56:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2tta-0002jL-Iu
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 13:56:02 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b590f21-82f5-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 14:56:01 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c509d5ab43so81259361fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 05:56:01 -0800 (PST)
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c470e00b0040a47091602sm13749947wmo.31.2023.11.14.05.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 05:55:57 -0800 (PST)
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
X-Inumbo-ID: 8b590f21-82f5-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699970159; x=1700574959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvQiIJnm8epdhnB5vkpeRbG5RDMsBlsUOmn/ErmAs3E=;
        b=J0l6sRt4viL2Vm4ivi/T5OWgceZ0/AmEdi7tBlq4lWiGTMK8IlH5Ri0hMcfL7CIAcu
         GPHhxEVQ62mTjdhRos1316CJXBYX5BggtpQuaqgWlXFoWumWWBhLeiPRATAduDcHk0FH
         6+JERbYRZ5HN2O7K9b4zJrOXRk4mg4qdVQm+Mg0WwtSqKoODWsKM3W/aRLsv/vmk/hov
         uISKOMEI5ToiXiDWoKLnkiH6xrQPyOBOMbfeLuxTJGktMuMtMSq+jcRDAVpvpcVaB0Fn
         mhxf9vgERfSdWGMryAbLFGTkK96aI46kKb+gABWER0q0x637jaGB7cAIsW0r89aJSrKO
         LlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970159; x=1700574959;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvQiIJnm8epdhnB5vkpeRbG5RDMsBlsUOmn/ErmAs3E=;
        b=UVvTmsJFqaHIgFlhShlNtPk4lRYbOmjIohniviJiZU/JdBbpYt03DYvvj/gKpd+llr
         ub0ui5vqZdljHnAs1jPO03uL0cLRV3MyBG869nfZ69w0t+VbCepsY2UheUQxkdUJHiFw
         G93UBSmggzfv9j1/p2yQwItcIS2HDlXieuG/b3rM3ml1L4vqZQmNDH7qEAPTmt2IkLF5
         aI2J2GqNX3nm0qpNn+AZe3rB3nQagHivBK4pO6YjMKEeA0qYux2POJ8hWtwzNa0Pn5yc
         vh/vMk/GgRwmQLPvp7+Jy9ao0QmHineZS4wAykv/cwDgtyJwbKLDD7TdXu16OKD8Spsa
         glnQ==
X-Gm-Message-State: AOJu0Yyz96ow8/dIBMC1DIYksxgwbuDkqw6rCP4H7pNKFtC+XP96oVlw
	i9iH6fZzjNcuzWwnaXiHu9DiNg==
X-Google-Smtp-Source: AGHT+IHzswkfE7e3I7hDUvm2VdqNG2hFrVp8V7AJ7+73k/8D9WsRzXIdAy+MgUwZ78p+bsfL1MXbEw==
X-Received: by 2002:a2e:8842:0:b0:2c5:47f:8ff7 with SMTP id z2-20020a2e8842000000b002c5047f8ff7mr2475960ljj.18.1699970159645;
        Tue, 14 Nov 2023 05:55:59 -0800 (PST)
Message-ID: <3b7badd2-931f-47f4-a24e-3f5b9541c06d@linaro.org>
Date: Tue, 14 Nov 2023 14:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 07/10] sysemu/xen-mapcache: Check Xen availability
 with CONFIG_XEN_IS_POSSIBLE
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-8-philmd@linaro.org>
 <9ba10b4a92ac6782d0c581b1e1ee5d5efee44c33.camel@infradead.org>
 <86153cf2-129d-4e1e-8949-786764bdf607@linaro.org>
In-Reply-To: <86153cf2-129d-4e1e-8949-786764bdf607@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Cc'ing Paolo

On 14/11/23 13:25, Philippe Mathieu-Daudé wrote:
> On 13/11/23 20:52, David Woodhouse wrote:
>> On Mon, 2023-11-13 at 16:21 +0100, Philippe Mathieu-Daudé wrote:
>>> "sysemu/xen.h" defines CONFIG_XEN_IS_POSSIBLE as a target-agnostic
>>> version of CONFIG_XEN. Use it in order to use "sysemu/xen-mapcache.h"
>>> in target-agnostic files.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Noting that CONFIG_XEN_IS_POSSIBLE is for Xen accelerator support, and
>> may not be set in all cases when we're hosting Xen-compatible guests,
> 
> As is CONFIG_XEN.

Actually we have:

- host Xen support
   . CONFIG_XEN_BACKEND

- QEMU Xen accelerator
   . CONFIG_XEN

- HW models
   . CONFIG_XEN (old / generic models)
   . CONFIG_XEN_BUS
   . XEN_IGD_PASSTHROUGH (PCI stuff)
   . CONFIG_XEN_EMU (Xen on KVM)

Paolo, David, is that correct?

When can we have CONFIG_XEN without CONFIG_XEN_BACKEND
(and vice-et-versa)?

So for clarity CONFIG_XEN could be split as:
  - CONFIG_ACCEL_XEN
  - CONFIG_XEN_MACHINE_FV (Fully-virtualized)
  - CONFIG_XEN_MACHINE_PV (Para-virtualized)

> Maybe be worth renaming CONFIG_ACCEL_XEN if you think we need
> guest hw specific CONFIG_foo_XEN variables.
> 
>> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> 
> Thanks!


