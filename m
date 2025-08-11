Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC75B203C1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 11:34:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077165.1438242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOv0-0006JX-Ti; Mon, 11 Aug 2025 09:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077165.1438242; Mon, 11 Aug 2025 09:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOv0-0006I5-Qs; Mon, 11 Aug 2025 09:34:14 +0000
Received: by outflank-mailman (input) for mailman id 1077165;
 Mon, 11 Aug 2025 09:34:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulOuy-0006Hx-Ju
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 09:34:12 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 566c08d1-7696-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 11:34:11 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b79bd3b1f7so1887519f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 02:34:11 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ad803sm39660387f8f.6.2025.08.11.02.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 02:34:10 -0700 (PDT)
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
X-Inumbo-ID: 566c08d1-7696-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754904851; x=1755509651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Cz/d1D2rU6ODDYD7qOW4j4fo0XFs1scsOGjxN01U+A=;
        b=Vh7ZrfnbYXTz91jjEFKyu8PcyhAGU6PIyOYURD/Q4u5tpm/eeymdwQShBBV5Zt1SPb
         OiaTSeq4GR18l4E959aFSlpv0C1LvyMO9AeC8twg+IymXvE/tanodIWk27Lq8/Z0B9+a
         pJFqp6IxS405q0edR6Gpk/IdwY7QB6z643unE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904851; x=1755509651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Cz/d1D2rU6ODDYD7qOW4j4fo0XFs1scsOGjxN01U+A=;
        b=R9f3GKgROcZIPV6INoKDRCmOdiLU1juxrA5H3WHSMaIx7bnDMokgkBYV0UbTpeOwJ2
         sdBBt4gkq4xn375QfspCBeZsAn77Z59q1cSL5xiLdsZauR3Ik4Z+VbgeSh9p/rxd47Md
         xhEfyksStmW45xCCVx9cP3jGMPr8Wb6poRLiF/1i1xB1GYS9swGQ+57Gng14gz19NhIe
         xGwxlyveNhk86MAaJfAHw5PmVoX7ynyeIOo7+osW6X6L6kEnwIPzdBfIgqBxDnVtIdGU
         VXt4s9uhkwpQjPikSgQQI3Z1D0RrgDLkLwarwsr/PVLPbqPKvigNFYRYT3GB9XNl/7+0
         73CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsB5LTFpUES8oDYNKXFfbVP9BgpX/JVoMaaucb5hDVtGfUt5VjzopFj8cAI6ASAgSyXjuNYzP7h8g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzO/vnsZfCL/jmB7egTgVWOxGunpj490EVoAWSsLxF/t4opbB8w
	IPYxUzDx6ElU41vaWtghiMphJOyjHXuJATm1nu0hx5CQcGcAzEcKYB39ihd+Yh/rz/A=
X-Gm-Gg: ASbGncv8UkVO3raSu0Y5iKnna/z1QbAga5jrX1DCg8RUn5hWUYi3FbPKnZVCeNIHVtD
	Y4UdjJZlLb2ZuncSaLWmzer1Xk/N3dvNDVQemnF96MaNGDxJ2RJtCi1B4nWatAifEi6YvGTO7p7
	fuqhJSUG1EiSja0KKvfWOVJVQYHos1kIK9kokSruaoDiExAGbPBYzBHbKstGiAwW5uzcLadi+w+
	oiXfa/KSM6xd61wtAC8QFPKkc51GdLr77fbB6FB4lv36bO/FYGJeL1jOStEd5jzH7fVhwQXwEry
	/AZpOlXOHis6CLw4CCEBRIk8rZqVmQtT+GT6cR7/qsPICqQAnB+qVGHb6r23jK32u5z4ksQc1L5
	xnsNktCeEygjA/aYvKgVVmTYBbrYdJEFw4EyKBscjmXn0ily+l/4Fmw3NN4+46mWgU1/Z
X-Google-Smtp-Source: AGHT+IEQZ7ByTq2SeYaVU30pzH0vZBcachC15kCFt3Y1t/KhmeeyoaSEdQuItA2RapOOleym1Y7cRA==
X-Received: by 2002:a05:6000:25c7:b0:3b7:970d:a565 with SMTP id ffacd0b85a97d-3b900b551c7mr9589869f8f.46.1754904851086;
        Mon, 11 Aug 2025 02:34:11 -0700 (PDT)
Message-ID: <80a714e6-0c9b-44af-b786-6b8b53ea9e25@citrix.com>
Date: Mon, 11 Aug 2025 10:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: Drop logic for old clang versions.
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: nicola.vetrini@gmail.com, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <e8bb42876317c19aca79f81c3fc48dc3a4fdaf71.1754830862.git.nicola.vetrini@bugseng.com>
 <96b878a1-2a4e-4df3-900c-a2b2142f0638@citrix.com>
 <3a1fe9570bdaf5332c93a97c1da38255@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3a1fe9570bdaf5332c93a97c1da38255@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/08/2025 10:13 am, Nicola Vetrini wrote:
> On 2025-08-11 10:07, Andrew Cooper wrote:
>> On 10/08/2025 2:03 pm, nicola.vetrini@gmail.com wrote:
>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> The enforced toolchain baseline for clang is version 11,
>>> therefore this logic is effectively dead code.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
>>
>> Thanks for the patch, but your From and SoB lines don't match.  Which is
>> it supposed to be?
>>
>> ~Andrew
>
> The gmail one, git misconfiguration, sorry. Should I resend?
>

No need.  I can fix up on commit.  Thanks.

~Andrew

