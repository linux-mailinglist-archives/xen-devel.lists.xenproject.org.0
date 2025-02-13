Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C1BA3381D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 07:44:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887122.1296670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiSwn-0004mE-3h; Thu, 13 Feb 2025 06:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887122.1296670; Thu, 13 Feb 2025 06:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiSwn-0004kE-0v; Thu, 13 Feb 2025 06:43:41 +0000
Received: by outflank-mailman (input) for mailman id 887122;
 Thu, 13 Feb 2025 06:43:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fPX=VE=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tiSwl-0004k8-Nf
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 06:43:39 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9e6ed3e-e9d5-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 07:43:36 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab7f2b3d563so106948266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 22:43:36 -0800 (PST)
Received: from [10.23.200.101] ([194.183.181.59])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339d9cfsm65533466b.139.2025.02.12.22.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 22:43:35 -0800 (PST)
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
X-Inumbo-ID: d9e6ed3e-e9d5-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739429016; x=1740033816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnEEDszUw8seYdhnlvB3w4Do0d17BoYLpMn4byUCCSs=;
        b=jdQQTK7IYJqaiB7xlpIrHurlrkT6zjybohMGEkjbvdAEFi3s4aUJAxqzgCqsGxSkWu
         hHBoAgUBSclpOC7LVefGlae/YOWuik8Hf7DrLAwS+JlU9G1DtD8Ku2lS8KWQykTTItDl
         O8BmE8oB2HAHjhpNo00oNzJbAxZISBfg1H+FxuQZxn3AbTWlaVA+1cWOXEXJrKezNX+o
         0EdWmZskbrXkLTCG8OcDmz0w506qyipPGdm+qPUkXlj3QRgm9pOrSW/mYD0bHFBr8cCW
         WZ1CF0ck0CL88YNwmaPwgwzqkoSZF4j9DLb3X07H9iYZTbKm6JXPp0VpfvmM2dY6sQmc
         HCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739429016; x=1740033816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnEEDszUw8seYdhnlvB3w4Do0d17BoYLpMn4byUCCSs=;
        b=pCtpMf6OpvbGQOnjZTUgrd37qmLTPY/kpfA/nCP8940MFcqknJr2onXLVm4wyWjans
         Kddrhv7aP7kVpAaBd08WiIO/LeDMMxPaLcUWEbvo8vMM2ozkp2XKtVjlBx/cnjRyQgqR
         i2lAccsNJ86Cqz+UFmb11Ep6kbSx3P+3QXVjAwnITt0SrKlmqtS2a1SuTGE1bT/F07er
         69k95YW/lw1xcX6h6hMIeoHBInM8UsIWg51d1Po+RYUvL9Is/agvDlVKivso7cKyJjAQ
         rqePtah4El51SV94yDxlAafyGQ+XM2Yfop3JbrsBgF3X6hqM85zrorBHOIz6BdBBySsn
         LXaw==
X-Gm-Message-State: AOJu0YwAuyjeyXebFa+bewuaCFAYdNEWBrbIYwcAmizJWOwd2dVM+qHu
	g8M2bSdoZFAc2M87FBLhn0A3y2fbpQWrPxGCOleC4ZPuZ9Vd5kTR
X-Gm-Gg: ASbGncsUrqYF/TWV1ahpW3t+sGUNCkKBygo8Ui/voHSJduijm0ehnW0F91uU8xb1u2l
	TmBcCer8xx2rkFy9BtsH1dg4URnWDfFbQ/gYfLE65GNaqkGElFrYnVevpQkj3lw+evhq+Gfnaml
	+Eqa5l1sFDOMsSiKphy1RbehlmeB0xOLH0dWdA9Q3U5saq0ubTOQiOERChy2ZBHF1tkcNQcrKHR
	awVbcsvfkrt73XiNzhh7OudtcqRgPLGhEyeuWTO6liYeycl/g3MnlY+yGKqbpKPhUAs5RrGhuvP
	8yO5daxahS3OeuADezg=
X-Google-Smtp-Source: AGHT+IEfKoY8g2Vz6J7c4Act7zl4lY5ANkFSRh0bPSRKSbvq1rTqFxaVWsrfZ8rCKEgphKcxyqHwLA==
X-Received: by 2002:a17:907:a07:b0:ab6:dd24:3338 with SMTP id a640c23a62f3a-aba5018d16dmr162546466b.37.1739429015790;
        Wed, 12 Feb 2025 22:43:35 -0800 (PST)
Message-ID: <d9d216c2-14a0-4d99-b79e-c67dcbd3fcc7@gmail.com>
Date: Thu, 13 Feb 2025 08:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Coding Style Review and Automation
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <alpine.DEB.2.22.394.2502111426380.619090@ubuntu-linux-20-04-desktop>
 <Z6xma27ZxfeHK6Y0@macbook.local>
 <65fcc449-3b15-4e14-995a-ddd3bec9f3d0@epam.com>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <65fcc449-3b15-4e14-995a-ddd3bec9f3d0@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Grygorii,

On 12.02.25 13:14, Grygorii Strashko wrote:
> Hi
>
> On 12.02.25 11:14, Roger Pau Monné wrote:
>> On Tue, Feb 11, 2025 at 02:33:08PM -0800, Stefano Stabellini wrote:
>>> Hi Oleksandr,
>>>
>>> This morning, we had a discussion among maintainers, and the suggested
>>> approach moving forward is as follows:
>>>
>>> - First, it would be helpful to see a sample of the proposed changes
>>>    applied to a single source file as an example. If you could provide
>>>    such a patch, it would help advance the discussion.
>>>
>>> - If the changes are acceptable, we need to properly document the new
>>>    coding style in xen.git. If not, we will need to iterate again. 
>>> We may
>>>    also need to add a "xen" template to clang-format.
>>>
>>> - Once finalized, we will proceed by making changes to the Xen source
>>>    code piece by piece, as you suggested, rather than applying a single
>>>    large patch.
>>
>> No objections, just wandering myself whether it was considered to
>> initially only apply the new style to new chunks of code?  Using
>> `git-clang-format` or similar as suggested by Anthony.
>>
>> Is the adjusted style expected to be too different from the current
>> one as such approach would lead to hard to read code due to the mixed
>> styles?
>
> Sorry for may be dumb question, but wouldn't it be reasonable to consider
> adding just .clang-format specification to the Xen code base without
> automation features?
>
> For example, I've downloaded .clang-format from [1] and using it with 
> my editor
> which supports clang-format integration. So, I can just select chunk 
> of code and
> do auto-format on it. It speed ups my work very much and results make 
> me happy more
> than 90% of the times.
>
> So, it would be nice to have it out of the box while cloning Xen code 
> instead
> of searching for it, even if it's not perfect for now.
>
> Unhappy: it's probably "known" things - identification of complex 
> defines and
> static struct/arrays declarations.
>
> For example original code:
> DT_DEVICE_START(ipmmu, "Renesas IPMMU-VMSA", DEVICE_IOMMU)
>     .dt_match = ipmmu_dt_match,
>     .init = ipmmu_init,
> DT_DEVICE_END
>
> And after auto format (me, personally, unhappy):
> DT_DEVICE_START(ipmmu, "Renesas IPMMU-VMSA", DEVICE_IOMMU)
>     .dt_match = ipmmu_dt_match, .init = ipmmu_init,
> DT_DEVICE_END
>
This is covered by [1]
> Best regards,
> -grygorii
[1] https://github.com/andr2000/xen/blob/clang/xen/.clang-format#L859

