Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA67AB36BD
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 14:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981374.1367770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERyf-0003MC-B2; Mon, 12 May 2025 12:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981374.1367770; Mon, 12 May 2025 12:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERyf-0003JS-89; Mon, 12 May 2025 12:09:49 +0000
Received: by outflank-mailman (input) for mailman id 981374;
 Mon, 12 May 2025 12:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oz7/=X4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uERyd-0003JM-Nv
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 12:09:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff0546a9-2f29-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 14:09:46 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-442d146a1aaso40393375e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 05:09:46 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3aecb0sm169013085e9.28.2025.05.12.05.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:09:45 -0700 (PDT)
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
X-Inumbo-ID: ff0546a9-2f29-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747051786; x=1747656586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1XybKaSeMET3ehfT/Pk08q5R7nB6PeZjU+wO/tiIGbQ=;
        b=cXW1upvcIzrDQhagMgvo3DP1n16DQS8VVthhpaOOFy+9MXODJ/JI21A5fcEJqTmjXY
         YUynn8QbQFHbTPVLRuoOm0VI/SUxmhQOF/9mLX6WFVfBMKXupfenNWNVrznXOyAMK7aQ
         9B+O8FtHviLpYMyaY1nUuJMSXM6cTynq8YmLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051786; x=1747656586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XybKaSeMET3ehfT/Pk08q5R7nB6PeZjU+wO/tiIGbQ=;
        b=lOKidwczjZmsji0a/tPfccA1JyF9xUkUDataDmzGxqir272Ag9HZ1YaObLR7zLXfMA
         2wo2Z1ik5orTj3L2LZtH24sFG6i7phS0lZmq0uuQt++tweC/wBQuLOl/vo87oZtmaM2V
         3LQ4J2QFedJVa3LluWqx0YPAvZG5DIFYho70b02it+s1Ju74f41xpW8mpizO0SE20Ylb
         ZrXFsniw3L/gSododwhh42gPvx9U5j+a9wRnk205InmENLYH5Un1BaMeEqnmCiS5UNi+
         //QAhW7513g1NmNbqgZ8+Bx4YYG8DcYDDrfyFQYzw1h5zIWYdDbUntqGW09/TxaYhEXt
         Z9TA==
X-Gm-Message-State: AOJu0Yywa148MRkP6yve1rDKrABd6liDCb3ksaMYHAJSWoeHMuMioKvc
	BzyMM5XBh5eWtlQpl/fry/bAF2gevS0KA49gSqOPMUCJ3bYDAGawBtmCuacWfQA=
X-Gm-Gg: ASbGncsd5zeB2WhOv/H0e/EFZQUoZoAWLWxVHSqdJWjbnxSSKT8ztv74Bu0tGbbsC2A
	s34dkmYL/LD47/t3tEvCPepPPMYVM+GXQzXSTF+G/4mxavWj5hqKgZptPDeVk76uXgyKgvLCkN2
	UGPoFIphshWk4Y4ZLQTTKhEZDlSEfFtfj3uvCyYWo5lVhjXSl56yWgfWGAXQdq7y7bcesS0ZbZS
	o/BtstYlfwnQNr31KbdfhTJGulrH8VxYWRoz/K80UjvyI2+sZCeR2SVsbDBncHWQ5jW39k389lA
	q/GXtIbID0A6tiI+lqgHCK2zTrfPoWJhVp+YNpNhPJG+7EjMEm8hkgU9a0CWPi9weRjaGqav0/3
	Ojz72sMpAFYIwhliFMjR9mOXxFo8=
X-Google-Smtp-Source: AGHT+IEHy7zUQakT+qgVzLlZGy4BxYJ7YD+USINp1q4dMcfZTLEcgT3YlTPICkfIYebEYIzKNO7h2Q==
X-Received: by 2002:a05:600c:8519:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-442d6dacbdcmr130772525e9.17.1747051786286;
        Mon, 12 May 2025 05:09:46 -0700 (PDT)
Message-ID: <7acc83a3-2b15-4557-b293-0832b35e3680@citrix.com>
Date: Mon, 12 May 2025 13:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use __auto_type
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2505051244090.3879245@ubuntu-linux-20-04-desktop>
 <548430a5-fa4a-41d1-b5ba-ba45efa90bbc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <548430a5-fa4a-41d1-b5ba-ba45efa90bbc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/05/2025 12:59 pm, Jan Beulich wrote:
> On 05.05.2025 21:44, Stefano Stabellini wrote:
>> On Mon, 5 May 2025, Andrew Cooper wrote:
>>> In macros it is common to declare local variables using typeof(param) in order
>>> to ensure that side effects are only evaluated once.  A consequence of this is
>>> double textural expansion of the parameter, which can get out of hand very
>>> quickly with nested macros.
>>>
>>> A GCC extension, __auto_type, is now avaialble in the new toolchain baseline
>>> and avoids the double textural expansion.
>> I think this is a good change
> +1

That looks like agreement.

Now for the (new) controversial part.  Since sending this, Linux has
decided to just #define auto __auto_type for C < 23, in order to start
writing C23 compatible code from now.  It's more succinct, and has
better longevity.

We might want to consider the same, although it will introduce a new
example of defining a keyword, which we'd have to call out in the
MISRA/Eclair config.

If we're going to do this, we should do it from the outset.

Thoughts?

~Andrew

