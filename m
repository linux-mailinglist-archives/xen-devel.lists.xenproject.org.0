Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BA2ABC745
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 20:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990116.1374054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5J4-00079v-TZ; Mon, 19 May 2025 18:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990116.1374054; Mon, 19 May 2025 18:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5J4-000789-Q1; Mon, 19 May 2025 18:33:46 +0000
Received: by outflank-mailman (input) for mailman id 990116;
 Mon, 19 May 2025 18:33:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH5J2-000781-Sc
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 18:33:44 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca885a25-34df-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 20:33:43 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso8639176a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 11:33:43 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac35e33sm6094828a12.60.2025.05.19.11.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 11:33:42 -0700 (PDT)
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
X-Inumbo-ID: ca885a25-34df-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747679622; x=1748284422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZxwnH2sbaztQap8EHDBZ7HxwD0Q+CBtn0Lhd116yDo=;
        b=Ml/UOnk4/wSlxv78pBDMTuamn8gSZjNrZ2DEm3qOFOx8SFLcbxKbgjOmMRN1wGHXDK
         gC/idt0fwX0ScwyI2Dnfb1T8uUmb22Ol/9Pe0aPuI+vRLXD3a518h4gX0maB7LYrbIyh
         dAmm9IjTPWPRonV7RqWyl8KIp2YT2O5xI3wDy1W5awpRNHUJ4hW6hvCqZRU5hKkvWShE
         sEZqrAZkLOLP2UHmWuZ/5iAobawUbA9rwJ15Gzc0qgOUnxVNsv5KC2uOOh6XoL7MB/nQ
         qN7Rkwbgz+uhSn1hQxc8dS2GbxWY/H4A8ny1pOa6UE+4fpZS8KUYoKVXv3ra6Qs+yEqz
         oJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747679622; x=1748284422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZxwnH2sbaztQap8EHDBZ7HxwD0Q+CBtn0Lhd116yDo=;
        b=KcchPMOe0LVveiXOXea3GD2lNHyA4yb7n2FLTjjEOJkgLMpamSxGOVKEQUpHr7MFWd
         wkDHTp6RZxKljTTKEHxe11XpZ4gbG16150vbcPqNE+eiBIdROzLiz7iQugV5a5VKQQ/J
         eJ05jFHIbsEpWC02TP+c9c1PEZH+ibB/ark/yCkF8RJWvhY80FRm0bsEWp70eHRXWOTJ
         SBoXwSizuKlIEWN57Z19lc83J9low7MY6jj/tXFwDEMQlhbRCaS7QtYA/M0x19XFiTQg
         gNr3icRMu1eydJbrfppHjRWAmjuAbVh0rchIiehrGJ1g2JXO7EgzeWUN1HKV9l54Ya1H
         8lew==
X-Forwarded-Encrypted: i=1; AJvYcCVhlzAc1SwFrwaFONMIzD0YbTC9+yK9tWLUvOOUCPEkAb89yi7THyOHpNlAOOqGgRPGeWeltnqw+cI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrayLrhJOePdgeiGJM8lqEJtFYOddEs8FGVxiCmJ5P/nlItxi7
	MOhJ4xCczAdew+TUsWlBUF6chJEcsV1/29AzUN3BeJ/d+ChL+ucMhOi0ZtHL95x7TA==
X-Gm-Gg: ASbGncu2tIGhaGfdg7LJBXGgbseUr6nz4xqySg1W8b4eing6Acew8gmSrFoDY7Jjd+0
	BAtn8c/9hRIszGMgrQE2frTWh3+quX1IsKa7Mlqj+EgYDwhX9+wRN43VeA2j6GazM7E9JrQDWl+
	2+QVS8ohX5RzLMOHKAm0WSzhva4llFF3nnc3FfiCkfKAGmmwDKL+AORb7Ffo/4JKLANY38PniGh
	fJOMNxeONR9eMAsbAdhErmhUjFONc0JhOkFPPeJELoIyhG4XixdEpfjhVyMHtChjHlNuITJKs9J
	cVvtlWJ8xShfblqJFhXH4DOnn5JKSlrXJvoi4FOtDCb+ISvCPy3/YG86lYKzaA==
X-Google-Smtp-Source: AGHT+IG89LkTyeaGHkrc8e+4+N16se0aYXB66uAcA7R5H0Qo+l2IZPi951RrrLVcihmsuwThJNuYNQ==
X-Received: by 2002:a05:6402:4410:b0:5f4:c5eb:50c9 with SMTP id 4fb4d7f45d1cf-60119cc8f77mr11797584a12.21.1747679622420;
        Mon, 19 May 2025 11:33:42 -0700 (PDT)
Message-ID: <2966ad6f-179f-47fe-acf1-7fb568cb4fb8@suse.com>
Date: Mon, 19 May 2025 20:33:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] xen/riscv: imsic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <f7588e93d0ddacc29ce5d89b2855624f82d6baa9.1746530883.git.oleksii.kurochko@gmail.com>
 <0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com>
 <4b948489-6fb9-4554-9a4c-4fa75de7345d@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4b948489-6fb9-4554-9a4c-4fa75de7345d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 17:26, Oleksii Kurochko wrote:
> On 5/15/25 10:42 AM, Jan Beulich wrote:
>>> +                   node->name, imsic_cfg.msi[cpuid].base_addr + reloff);
>>> +            imsic_cfg.msi[cpuid].offset = 0;
>>> +            imsic_cfg.msi[cpuid].base_addr = 0;
>>> +            continue;
>>> +        }
>>> +
>>> +        bitmap_set(imsic_cfg.mmios[index].cpus, cpuid, 1);
>> Depending on clarification on the number space used, this may want to be
>> cpumask_set_cpu() instead. Else I think this is simply __set_bit().
> 
> cpumask_set_cpu() requires cpumask_t which uses static definition but we are
> using dynamic allocation.

But you're aware of cpumask_var_t (and respective allocation functions)?

Jan

> So it seems like bitmap_set() is the  best one option or reworking to static
> allocation will require.
> Am I missing something?
> 
> ~ Oleksii
> 
> 


