Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDA3849C39
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:52:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676083.1051906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzNv-0004Ox-Tj; Mon, 05 Feb 2024 13:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676083.1051906; Mon, 05 Feb 2024 13:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzNv-0004Mb-QQ; Mon, 05 Feb 2024 13:51:43 +0000
Received: by outflank-mailman (input) for mailman id 676083;
 Mon, 05 Feb 2024 13:51:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Sh=JO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rWzNu-0004MV-BL
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:51:42 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b08ca260-c42d-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 14:51:41 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40fdc500db5so5781195e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:51:41 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 fj3-20020a05600c0c8300b0040fdd361c5fsm1902192wmb.47.2024.02.05.05.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:51:40 -0800 (PST)
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
X-Inumbo-ID: b08ca260-c42d-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707141101; x=1707745901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oa4bBqi9S19tUVsoSzmhSdurXd96E8njIM7dJUC1EpY=;
        b=RIh2AFyw0pWtWGXQL1pefOMBDy5hGa/ZoA9uSN+RwcNk536kpn4GD9BwAS9uQtccxu
         m/QeVnDOXcoZiufclpcMadSkaknBG70euhW6VKJljbTwfK58rvAc5uwQhGhfz++2hI3e
         SvhAItqIFnMDyYuvSzfryeI3j2ASUR3VVvOyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707141101; x=1707745901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oa4bBqi9S19tUVsoSzmhSdurXd96E8njIM7dJUC1EpY=;
        b=mKH0fPqjCZZxRic7J1bGXmfrbGSgg0KD6rNNn3evH+gRyXqfKeV+PDzSTocB4flPXL
         LbpIVKZW+1kBrxoagqq+NP1xYFrdBhhHlT400KYpy0WbbZK1zF13aZK6p1Rm7DPzZXKV
         LcGpGxIlAjsacK4P1YcxD6AefoAIvxyAXVxaY6e/TY8fX8x1kBdksmBlH5d92ULEPwz1
         oW1ElLLEoVBrlF+MbbRf1Z/LWYk09JUDKZc4zJ48izdXtDPFpxKjg7qoR6/Yc4xIDLtL
         mIp3j9gxvwL8ck9w3/ES1p9FpPCla1/FKt8IDQ0VtsirGXPL8FGcmSFJ9uutXXxmDIUs
         DqbQ==
X-Gm-Message-State: AOJu0YwrT4hfR9zjbbI6xMbDi6h4QOzjMbppts54d4gBQclRTC0FoIon
	B6pOyUogMZyszRVMjkxaYwiFqbxTsjrwbnUzbtQqlUDArpabDm3OotMUgxf4QWE=
X-Google-Smtp-Source: AGHT+IEIKbafgRlyI/ns248dlUKYhMt3avcs4W0vGOtzIFr7TL2F+9E8U4S4k9TqzPpuvJTtUIxssQ==
X-Received: by 2002:a5d:6da9:0:b0:33b:3b86:b881 with SMTP id u9-20020a5d6da9000000b0033b3b86b881mr3160495wrs.38.1707141100725;
        Mon, 05 Feb 2024 05:51:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUf6zHtOb7u5CxHNTdniPQ2/u/Fq0M8tVKk6y9+bv3O6ycNFaoe3kAF3ln5LFJm5+t2A/v8thc3qH0N0dLQfXgyQIuMnVKejPjUek8Ut5GiIbB63utlgAoENvfY4OTOWJEtt+s2D0Q19fCf65T5Ymxn4dDXjKOOePRcvGGkNeDnLf8n87s3RDxsgRLN2C4I98h5thRr11b5aYdq+7ga933tF5IDlfUBS4fX0A2dgXk/74BKDr/Qr5R3hfbjshGxNsNx4Jl9XQs7vxDUxEgATMLLctzpo+8HyHWsXwLOEuU+SLdsiXs=
Message-ID: <f97088c6-ec2e-4c60-b91d-ec1a30d077df@citrix.com>
Date: Mon, 5 Feb 2024 13:51:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] consolidate do_bug_frame() / bug_fn_t
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <f20d2cef-4435-4b9a-9ad8-61ceddb6bcba@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f20d2cef-4435-4b9a-9ad8-61ceddb6bcba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2024 1:32 pm, Jan Beulich wrote:
> The type not being used in do_bug_frame() is suspicious. Apparently
> that's solely because the type uses a pointer-to-const parameter,
> when so far run_in_exception_handler() wanted functions taking pointer-
> to-non-const. Expand use of const, in turn requiring common code's
> do_bug_frame() as well as [gs]et_irq_regs() to also gain const. This
> then brings the former function also closer to the common one, with
> Arm's use of vaddr_t remaining as a difference.
>
> While there also replace the bogus use of hard tabs in [gs]et_irq_regs()
> (I clearly didn't mean to put it in like this).

I meant to query that at the time and clearly forgot to.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm still confident we can get rid of the fake frame in the serial
drivers, but this is an improvement nonetheless.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll rebase my work over this.  It's going to collide horribly.

~Andrew

