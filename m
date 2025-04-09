Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D907A82634
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:24:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944018.1342594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VPE-0000vM-HZ; Wed, 09 Apr 2025 13:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944018.1342594; Wed, 09 Apr 2025 13:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VPE-0000t5-Ey; Wed, 09 Apr 2025 13:23:52 +0000
Received: by outflank-mailman (input) for mailman id 944018;
 Wed, 09 Apr 2025 13:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2VPD-0000sz-B3
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:23:51 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df450fc7-1545-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 15:23:49 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso480781f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 06:23:49 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb8dsm20313125e9.7.2025.04.09.06.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 06:23:48 -0700 (PDT)
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
X-Inumbo-ID: df450fc7-1545-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744205029; x=1744809829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TgIz7i6YaW8v/6KpiMCsPwlMyXeUJycTLb012FbQC3s=;
        b=I1UwBpNAPY/fGPUgiGp/Mn0SUQwcpMD+qzekTcpqFt4gk99tGCalptcbofjkCHShKL
         OiYfrqRXdpWRPcoyfaeRZypF1qq9oBO4sLnVjrbF7+7wDRiTzZ5/aKOOS+G4GjhVRLOy
         nIZ6NVg5QJZof54sxr0ueP8/Ik0qKgFp6yjwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744205029; x=1744809829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgIz7i6YaW8v/6KpiMCsPwlMyXeUJycTLb012FbQC3s=;
        b=v5ShqVb8gEsu8axKv2Me/F0YVCMAqrZWHZTpV/FEmEp5l5MjbUK6awgdQjJoslS6P1
         wtyb4clnyJn32Mph/bPzRCBH8OIWmRSWwXFLqTff8y+PQAjs2UESTatSP3nWoRtqv0sM
         jE1czR9dfV8zKaPWFnkfXp4/8vZa+eyT288tqDAkeXFTRmGFZfwCs450uH1h59LYbyqN
         PQJJxEeb+eRAF5pOYgEqoctbAgTpc6K3aNFj4LATr9j2r854A7VpL9ABfvQu913TVgIk
         YwPEq5tge+hML2WKZGKsQxi2ue7hJSrWr0bldvQQVMDGzpjDvNWi7ZouTcqfi4OCSOxS
         4l/g==
X-Forwarded-Encrypted: i=1; AJvYcCWK0goQx4uN0RW60CLjvkkkEIzcpskpfzkFzZXiQ41f+La017egeabb2w8Tuss3u2cFuTZOhfQXcHY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoWCXyV9pjKQZ5qiDAIMmOwwjAX1S1bDn0n56OYEStB6AxmtiO
	OCHRirUpQjtc44VIpXAI2f4QwaKd6Xfp7wZf0OCmxJAlP6w62bmQA6D0KVbhlQ0=
X-Gm-Gg: ASbGnctnc1qU+zgSZZfO0d7mN0BOSTjbSAaHgCMh8IJepDQWa+e+OWpNhoueqvm9QjF
	KShJCamOdeykMZJICi1J4wWYrY+vLRTGCG6t6EfOs6pVQ9TiuVb+XH62wY0RM2NGvX3i7mPsiLK
	7A1juV7ooAscCu9MDPtxlQFiTGjP+CEYhCkVXZ4ie09Pj13AmLPqxuDfHZ0TDXx9l9Qy4fCss/p
	NL4woiVi7Pd6XoNUeE+uibseTnplvHfAcrolkROj4/jMoGg6t/9KfwDgpmJlI0E1+2JwRDOD+x5
	NYXeWuw0/PUotcV6UuwfaGOV+/NIRYX3rIGTfJ+mtpEn9GkHBHS9QjzBzsi3CQfsTO3bF8i2nL7
	npFi+Ig==
X-Google-Smtp-Source: AGHT+IE9WSdO/rYDJsUF8gHZQQqbRBzDQJJOf0FR2ipveEiMoGUox08JK0go2+GUFDRz1H/oPRNQnw==
X-Received: by 2002:a05:6000:420c:b0:391:386d:5971 with SMTP id ffacd0b85a97d-39d820b4509mr6375215f8f.14.1744205028731;
        Wed, 09 Apr 2025 06:23:48 -0700 (PDT)
Message-ID: <6f15946d-48d4-4809-8795-01584bfbc334@citrix.com>
Date: Wed, 9 Apr 2025 14:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: improve local variable use in
 hvm_hap_nested_page_fault()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <055d3235-7ee0-472b-b520-6426b51d3927@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <055d3235-7ee0-472b-b520-6426b51d3927@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/04/2025 2:17 pm, Jan Beulich wrote:
> First gfn can be set just once, rather than (conditionally) twice.

This wants a comma after First, or you're implying "the first gfn can
be..." which not the meaning you're trying to convey.  You also don't
really want one before "rather".

> And then gfn can be used in two function calls, rather than re-
> calculating the value there.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> I wasn't quite sure about continuing to use an open-coded shift.
> PFN_DOWN() could be used, or paddr_to_pfn(). Neither looks to be an
> overly good fit to translate a gaddr to a gfn, yet gaddr_to_gfn() can't
> be used quite nicely either as long as gfn isn't of type gfn_t.

I think it wants to stay like this here.

