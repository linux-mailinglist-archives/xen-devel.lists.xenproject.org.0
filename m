Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B34B308ED
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 00:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089345.1446970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upDTJ-0001bI-4y; Thu, 21 Aug 2025 22:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089345.1446970; Thu, 21 Aug 2025 22:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upDTJ-0001Ye-1E; Thu, 21 Aug 2025 22:09:25 +0000
Received: by outflank-mailman (input) for mailman id 1089345;
 Thu, 21 Aug 2025 22:09:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1upDTH-0001YY-C9
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 22:09:23 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d12c18b-7edb-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 00:09:21 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b0d224dso7251395e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:09:21 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b506bdd9csm10473625e9.3.2025.08.21.15.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 15:09:20 -0700 (PDT)
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
X-Inumbo-ID: 7d12c18b-7edb-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755814160; x=1756418960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F13gbUi7lwhM91iCKsCE7081tAwOWe8eZS1YXYamcE0=;
        b=DUP7C4Ipk9TRfzcGdcnqRgdKTFqDs1usuM+gv17KB8W/0QvWuweu96B/xNHvDlIKOq
         ikPRUOZOeWyUn8A6pgG2FDR7MmeOretk3AjnMlzWFeopIVeCpEe0lUr6TW/91cnmoF0I
         QCj0EXbVRfAmddrT+zpkQ0ZWLkxrnTTEotS9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755814160; x=1756418960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F13gbUi7lwhM91iCKsCE7081tAwOWe8eZS1YXYamcE0=;
        b=Hw/O31gXKYCm0oHl3An6KDqeedAIY/xXKDaNidLkd0CxS6pwwW3+WLhpEEytPid7r9
         jZFy+GT2W86M3MDM4zhUnMoVOqwbYKGzBznw0t9isf/qzJUOeRR04lt6dfpNQgLEkccX
         Vt5ln4JPG0Y1FRq4QLRRGLvY2Kg5newf50Wnh3WdeUq79dRd1I5GYbw1s+4ji1AcT573
         DrFOIG/fPVHu3HW+VhTA3xv1/aW7wnxGPfKSJpO10E6bY5KcHUjdRJQHDc54cCZjLo4b
         JZQOy0GSr19LybMgRB1OfYl+lbSwcCD8LWxNIqOlF5jLkP0grcaMtebQGiiNEJmXN3Sm
         XtEg==
X-Forwarded-Encrypted: i=1; AJvYcCUv2FP/pzvcNpSgHlT6YpXsPE/LGOQAmYdfZn8lvsEr5QF+iFHrC0wR0RbR/rh9pPZidWOHn7GBFlY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKc87wdfb77Mq14x4/YhuTc6t4bvl8dggooDeXd4Yq2tXflptC
	8eSHPXPQjnPMsW8AXV6aVEjhAwS+bVcAw3GE0KzZl23nfUGHLGTsIySlj3ltx8fUh7g=
X-Gm-Gg: ASbGnctdXO7nWs8k8K4TcbXS7VKFe1/DVCYFTlujbyTiBiuanC8Ztp1OC4Mj2lNzccz
	cBTJPc0mYuaet6OZf6WIq46AzF7w5iTfH70Bvua9ZCT0H7VuUgMHo5NbSXwQEk/caj48RRdTM89
	m04ofM1hmVyN4PcCyk+PWhR33LTdUHuASM+ZPCrRk96kwSBxt2MfvTtWx5on/+plrBFhzi5MKON
	g6efGhg/cVgsY46UUij4AD6nCJsSjLuXs//2CI7U7O50BLggvUc5oAxHm/khgzlF79tFwHTjTHb
	DYrvHfK5WbZTu0YZbfPVORRkqlAyk3KG31+2C8R5JiIad1nMf3cgCVS18/oTqsSEm1j44l5n1cL
	oPg4YNDyTPlrC2M1aH/4Ym3rvmr5OiyGAtvxP/xUeXUKOcor9qJ4fK1mJXlde8x6Uw5SZKWzJ4F
	9cGbA=
X-Google-Smtp-Source: AGHT+IHezUj68i85eCk26DoVLXNNGANV/m4SLthUCjmaSJrfI6d+ZwL9dE5BfRf1Kxo5sZDOA7MUGw==
X-Received: by 2002:a05:600c:b8d:b0:456:496:2100 with SMTP id 5b1f17b1804b1-45b517c2e4emr5519655e9.31.1755814160484;
        Thu, 21 Aug 2025 15:09:20 -0700 (PDT)
Message-ID: <536cce8a-46f2-4a90-837b-09ed8f1a9ef2@citrix.com>
Date: Thu, 21 Aug 2025 23:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/22] x86/boot: Use RSTORSSP to establish SSP
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-20-andrew.cooper3@citrix.com>
 <5ad64534-514c-412a-b2a2-23adaf835f60@suse.com>
 <757e3b87-bb4f-410a-84b7-cf3607bf3eb3@citrix.com>
 <1576d28d-bdd9-488e-a374-29695fca4ca5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1576d28d-bdd9-488e-a374-29695fca4ca5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2025 10:03 am, Jan Beulich wrote:
> On 14.08.2025 22:09, Andrew Cooper wrote:
>> On 14/08/2025 4:11 pm, Jan Beulich wrote:
>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>> Under FRED, SETSSBSY is unavailable, and we want to be setting up FRED prior
>>>> to setting up shadow stacks.  As we still need Supervisor Tokens in IDT mode,
>>>> we need mode-specific logic to establish SSP.
>>>>
>>>> In FRED mode, write a Restore Token, RSTORSSP it, and discard the resulting
>>>> Previous-SSP token.
>>>>
>>>> No change outside of FRED mode.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Why is it that in patch 17 you could use identical code, but here you can't?
>> This caught me out at first too.
>>
>> For S3, we're going from "no shadow stack" to "back to where we were on
>> an active shadow stack".  All we need to do is get saved_ssp back into
>> the SSP register.
>>
>> Here, we're going from "no shadow stack" to "on a good, empty, shadow
>> stack".  For FRED we only need to load a value into SSP, but in IDT mode
>> we must also arrange to create a busy Supervisor Token on the base of
>> the stack.
>>
>> We could in principle conditionally write a busy supervisor token, then
>> unconditionally RSTORSSP, but that's even more complicated to follow IMO.
> Why would the write need to be conditional?

Because the tokens are different.  One has the value &addr, and one has
&addr + 9.

The Supervisor Shadow Stack Token for IDT needs to survive for the
lifetime of Xen, while the Restore Token for FRED is temporary and
discarded by the logic added in this patch.

>  Can't we write what effectively
> is already there? Or is it more a safety measure to avoid the write when
> it's supposed to be unnecessary, to avoid papering over bugs?

I genuinely don't understand what you're trying to suggest here.

~Andrew

