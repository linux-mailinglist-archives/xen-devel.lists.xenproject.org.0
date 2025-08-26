Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F65B36F0C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 17:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094829.1450059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqw2b-0001YL-P4; Tue, 26 Aug 2025 15:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094829.1450059; Tue, 26 Aug 2025 15:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqw2b-0001VD-Lo; Tue, 26 Aug 2025 15:56:57 +0000
Received: by outflank-mailman (input) for mailman id 1094829;
 Tue, 26 Aug 2025 15:56:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GyYq=3G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uqw2a-0001V7-Oc
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 15:56:56 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49ad4536-8295-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 17:56:54 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb7aea37cso761558966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 08:56:54 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe8c25ceafsm358613966b.87.2025.08.26.08.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 08:56:53 -0700 (PDT)
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
X-Inumbo-ID: 49ad4536-8295-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756223814; x=1756828614; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/OoEh1spNdErWKUH9/YcK6iBUBhd4On/KhJJmMIAMQ=;
        b=R71iq0KB1YQj5QR/MU8Mz4XZPEc3oAw1V4sy8bmXdJO73BV3jONB9AzUHOg3dLb/hW
         +jYh+NJiQ2u3Z/FHyP3WqHlFDvDjgJXTKr//nVF7JWMYFFqxN6bslnxIQAqinbw4xZq7
         igh4rX9OB2K3EzOymih7v3/GyD6uY0CkbARpVgIUpuzgtKncDhsuMggxjbuBdwpzyNc+
         qfl2MkMQoj9NowbQa+brcoeqM8pLUsfzin6mqAloyBYOqMu3N+4DtxOfBtfK1hRtbUZJ
         Fr9vKXLJ2HWeJfvPR6OO0WSfh9jFrdbAv9UFT5AEVaG1oF2c2aQ00e+ACQ/i1T1G1hSR
         66ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756223814; x=1756828614;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v/OoEh1spNdErWKUH9/YcK6iBUBhd4On/KhJJmMIAMQ=;
        b=M6iAYKQ+5Ym8/dlleMnQyTGLpMlJAGhG65DeWrtVvmcpuYXPJa+esqWwM8kyAdJ2DK
         PprUUr6PPYQBfT7664YvpdkkdCjheB6vyjggTZO4hv8/m87AJqaqzVuIrOr5I+rgESWn
         C+/MA1M+mWxgasAJpvgcStddtrEDp1eEtEqveqrxqKNhBZQddOj5dTq+SN6dA8IWCIZ7
         Kikw/kwtdB8NL3zosc6jCY1/xgm3eYtVJg1G1U4X0J5tfZ/689OjDjO0PXDVWl371BRQ
         5PZMYfsGFj72R8p3bYlb7a0oTSKMOaQTPSdiXclVQX4R7uIAXgRjJ7Bnj7vwHaycReoj
         UWew==
X-Gm-Message-State: AOJu0YzsivWPbI/WESE3h3biDF4EjrKZWLSyecRpyftXq84KCYsO4Yur
	tsdYjhfPF+mS7FaOFY0CZdq2e3wZJwJrkP+eu13wi0iUO9oMlK+HyhfRuC0EVg==
X-Gm-Gg: ASbGncvsEEMFa6e1/prYmCdrLhdO7GR2g4fqIzh6BpsBfCR3H2VpKVa83y7slvQVHva
	nnQkxQoGwxztX1E0UWn99z7hK/St5Muo6+PvGLg9jpzmxXnsPdkwWfSW2afj9ZNamtVdiK8syRw
	3oQhG7aAKXjqayUXkreeehlfB57XONyqpAI2UZm7fq52CZ4k2FDGVRECEBUtBfhGLiLowwGtFEb
	YangGQceCakwZsvGVndK0dMn6EXtF+PDNR675M9apfgN8q0P6LtHJqWeTzmrzRwbNfVgz6Fj+Z3
	8yzLk3ZzTMonImjiiMTu9WAbaeSa+KoT66N+jqOidJfeYcV1rgUiTlpJ6atc0dyNrrc0+znRMVz
	3y477pMIGm7iVZhrB31NUgjLw8xB48wMM4JNbkRiLzW8o5w4ixe3v5CQNl17802viYropz5smcO
	7PF2urYg==
X-Google-Smtp-Source: AGHT+IHp8mAJUaw8qIohEgGuqYVSEhRozUMCSsa5zl8GLHz7kFWzBgu0n6v9C1j3r/AFw182mWT6MA==
X-Received: by 2002:a17:906:d54e:b0:af9:36b3:d695 with SMTP id a640c23a62f3a-afe29637bfbmr1563243466b.43.1756223813922;
        Tue, 26 Aug 2025 08:56:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------sgoe41cxqyZJkWMG0C15P3z8"
Message-ID: <614030ab-2dca-49b9-8256-f19bf848638b@gmail.com>
Date: Tue, 26 Aug 2025 17:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
 <c243d9b1-385f-49a3-9c50-507250f7bb68@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c243d9b1-385f-49a3-9c50-507250f7bb68@suse.com>

This is a multi-part message in MIME format.
--------------sgoe41cxqyZJkWMG0C15P3z8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+ Penny Zheng

On 8/26/25 7:55 AM, Jan Beulich wrote:
> On 25.08.2025 17:50, Oleksii Kurochko wrote:
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
> "amd-cppc CPU Performance Scaling Driver" has been pending for quite a while,
> and really ought to make it imo. I'm inclined to say even if an exception was
> needed. Parts have gone in, I'm about to commit more parts, but whether
> everything would be in by Friday I can't predict.

Considering that only a few patches are required to receive Ack/Reviewed-by,
this could be considered for inclusion in 4.21.

Penny, do you have some time to provide a new version of the "amd-cppc CPU
Performance Scaling Driver" patch series?

~ Oleksii

--------------sgoe41cxqyZJkWMG0C15P3z8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>+ Penny Zheng<br>
    </p>
    <div class="moz-cite-prefix">On 8/26/25 7:55 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c243d9b1-385f-49a3-9c50-507250f7bb68@suse.com">
      <pre wrap="" class="moz-quote-pre">On 25.08.2025 17:50, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hello community,

I’d like to remind everyone that the Feature Freeze deadline is approaching,
and we still have some outstanding requests from the community for patch series
to be merged into 4.21:

1. Enable guest suspend/resume support on ARM via vPSCI [1]
2. Introduce SCI SCMI SMC multi-agent support [2]
3. Introduce eSPI support [3]
4. FRED work: [4], [5], possibly others (?)
5. Introduce CONFIG_DOMCTL [6]
6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
7. Some other patch series I missed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
"amd-cppc CPU Performance Scaling Driver" has been pending for quite a while,
and really ought to make it imo. I'm inclined to say even if an exception was
needed. Parts have gone in, I'm about to commit more parts, but whether
everything would be in by Friday I can't predict.</pre>
    </blockquote>
    <pre data-start="48" data-end="174">Considering that only a few patches are required to receive Ack/Reviewed-by,
this could be considered for inclusion in 4.21.</pre>
    <pre data-start="176" data-end="294">Penny, do you have some time to provide a new version of the "amd-cppc CPU
Performance Scaling Driver" patch series?</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------sgoe41cxqyZJkWMG0C15P3z8--

