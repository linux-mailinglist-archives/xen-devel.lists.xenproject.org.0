Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A1AAD531C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 13:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011568.1390019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJIQ-0001Ai-2d; Wed, 11 Jun 2025 11:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011568.1390019; Wed, 11 Jun 2025 11:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJIP-00018a-VY; Wed, 11 Jun 2025 11:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1011568;
 Wed, 11 Jun 2025 11:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lgg=Y2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uPJIO-00018T-9m
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 11:07:04 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33a9b0f7-46b4-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 13:07:02 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-442ea341570so43198125e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 04:07:02 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45325228c2esm17790605e9.37.2025.06.11.04.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 04:07:01 -0700 (PDT)
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
X-Inumbo-ID: 33a9b0f7-46b4-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749640022; x=1750244822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rJf7a7CEriqV9+fqxFzpKUGW4Wrmcm2whxa7AjjrNjY=;
        b=upOk2SekjJjWyXpkxmgmf2RTbcVkTxTnf3P+FStKeY+ZG1hZPuqq6ccw+uz9Yq8UPz
         NuMxlGHG6EXOElS39LaFyK9XlJ7ZafqSDFT+2W0eCznvKS6e5A3d3B06bKuUO+vnjl4F
         pmBFHXCdeESPTTqTEHtqsf2ldS/gxJIo6hrfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640022; x=1750244822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJf7a7CEriqV9+fqxFzpKUGW4Wrmcm2whxa7AjjrNjY=;
        b=ZNfs4os/yDcKSvHDs5ojWb21FRJ14rbhId7O+W6XQxkFjPp9h/ZgCbVlSE0wpC97gL
         1uStVukB8zbWRylesrVkM4m1K5W1MeipyasA5pa6ueDZulygiWkzgoy9TqdiLHUL/v53
         GNJSWhk1ZERGC88pZVWhMZtS6vz3831DOGJWX1qfoc9HxjOElAUTEgyxC6rDO2rT0her
         eQ3/Vf7MGKtDrM2Ox3Hm4HxnDz0boDtgHE0HmOm3ekz2wbGgBQOsQLyQjE/rhtgNbv3b
         cN2UgAMAPmlMAJBcyXJiH4uC29mfizTtfP10JHKQf/dsjcgbb4/4xpfX3h5MqLZ8e2qz
         RPng==
X-Forwarded-Encrypted: i=1; AJvYcCVrfghuDwLW4fdHSu6U9nOc4P0IOM/AUiftAJPPcVJ2bEldDdYdub6U3uHMg+RGWtes4Ryyqm04I1c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSe/g5KKAe7cz8Fv7B7O0jf6KsCChr9Ew3xmLivuyl6KevrdiH
	0H4VNbKjCQ09JUvUZnRFQ2S9TYAFYGwgamjQmOp9RO/OCl04WfJtX1J4kToPYoN8Dic=
X-Gm-Gg: ASbGnctSbAtHhLJl2fKZ1ETu8S9pU4uIfdKantmqGlbD7AUZHkvHgYL0tgihOMLGviU
	6UChIKFxtarcMoYg6V4V4VQDOqSxOPmTqOSuj3QKHJmXmyTiC7z4THZTk0dDRs/jCyBuaYv6gJn
	XvGoV1vDEIdEfwHQ6oiWlCcXUl9sgIynZEZPh0ht1Ygck6cD3VzF/hIaILrKSCFEFGWDZOvnlvU
	q0nd8kkDBTjkv6jlKK4w07FZCtHF/RPLcUqOPCPwtFVthzeAsE6Aq/N2c5HJvbqZmHVuUlZs0Sn
	eeUmYuoGpV0F6JS+1NjbbbrwD8uSDOOOwXVuh2Q4CO6+4bSDGHZOBOHEbYL66+Z6GvWPD20VBBz
	RPy8jacqS9g==
X-Google-Smtp-Source: AGHT+IHp7g4Ya8QktUVqtDDcOR9b0RdGhQuihIwrjwQC7/orz+KkURipHOO5ASfP+iC97pJLYUnsPg==
X-Received: by 2002:a05:600c:c494:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-45324f36ddcmr22720065e9.18.1749640021873;
        Wed, 11 Jun 2025 04:07:01 -0700 (PDT)
Message-ID: <ea269ff2-73bf-4c40-b2c2-aa147c2534ff@citrix.com>
Date: Wed, 11 Jun 2025 12:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] vVMX: adjust reg_read() for 32-bit guests
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
 <9384234e-3a07-4ae1-b632-fe007beb4c4f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9384234e-3a07-4ae1-b632-fe007beb4c4f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/06/2025 11:42 am, Jan Beulich wrote:
> Using the full 64-bit register values is wrong in this case; especially
> soon after a mode switch from long mode to 32-bit one upper halves of
> registers may continue to be non-zero.
>
> Fixes: 09fce8016596 ("Nested VMX: Emulation of guest VMXON/OFF instruction")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note that the affected VMX insns are invalid to use from compatibility
> mode, and hence the more expensive vmx_guest_x86_mode() doesn't need
> using here.

Fine, but you must have a comment to this effect in the code, and what
prevents compatibility mode getting here?

> (VMCALL and VMFUNC, which are permitted in compatibility
> mode, aren't taking this path. In fact both aren't dealt with at all
> [explicitly] in vvmx.c.)

VMCALL has no operands, implicit or otherwise.

VMFUNC does have implicit operands, but post-dates the last time anyone
did any serious nested virt work, hence why it's unhandled.

Personally, I think vVMFUNC emulation can safely be left to whomever
first wants it.  The only potential usecase I'm aware of has ceased to
be for unrelated reasons.

~Andrew

