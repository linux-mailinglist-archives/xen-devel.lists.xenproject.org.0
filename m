Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F960A09D36
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 22:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870028.1281479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWMby-0003Mb-Oz; Fri, 10 Jan 2025 21:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870028.1281479; Fri, 10 Jan 2025 21:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWMby-0003KU-LX; Fri, 10 Jan 2025 21:32:10 +0000
Received: by outflank-mailman (input) for mailman id 870028;
 Fri, 10 Jan 2025 21:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uskN=UC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tWMbx-0003K4-CT
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 21:32:09 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57fa925e-cf9a-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 22:32:08 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso18493795e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 13:32:08 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2df2faesm98812955e9.26.2025.01.10.13.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 13:32:07 -0800 (PST)
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
X-Inumbo-ID: 57fa925e-cf9a-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736544727; x=1737149527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bF5cgY7m5DZljHXFxQBQ1a72NDsRU6mtLCuqzP8cfcQ=;
        b=YtTtlFTHJEarjUU5QzNHrYMK2RsdQnHwj8djDVztqKnT9g2+MwdEhCEP+PSI5tzCdj
         M7IId/wKqw8JGMu3gA+KFSngBwwy+9LGQdjUOrkTZm4Tp+RDz5pN5bzsWagSNTgSlYma
         3tWg3P6fSsNo3mJMXsy7ti1aV7Y9aZDDCDzTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736544727; x=1737149527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF5cgY7m5DZljHXFxQBQ1a72NDsRU6mtLCuqzP8cfcQ=;
        b=ClKEQ5Zh+tMvnOm8KF3wwNDd8/k5BtYSWNL5IsrTE9ImGZRZvyaNhTRzymMsfJINEF
         sxt9m7bWPwCik9n/7HoBFRKBKw2gPToRRFjt7azkYt5iuypDa9I6OD9tq3FeydR/mruh
         oIcCocATgjUK1XV2NiAupwYCvrYOp9D0Qoc25XfnmGWlmRg+UlH16u8AtTw5ZY8DqEEd
         VhRxps23wZBOwQwXVGUKGcxVawTrAO12/KMlnSdmlI7YOoL90Eq25NKDUr6aCQFi2/RG
         CJtGqUuSCNOAV4NssxSdC1oKa8YGdiL7xFLF9JaHoW4lx/k5ySTMT+En8lDypqfoSmSF
         xudQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIp1Ddr6eNr7zI3BlZLMUSLEU8aDwFtN4y8oBbM9UWQREXWvaAFNcTaLy3LWMvwpCnFx9n2y7LQWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnlDxJ9sxzI1VfXgFq9mWkC6uMxES7jaC6G7f4cgK4vIxTN/KD
	Pu2JWLD+KKzq9CMxtXqAQxQx+kLLKE9FQr4lzXhYpkb0tiToq3K1GV/4l2Qctxj5MmnNOUJKCFQ
	aLwY=
X-Gm-Gg: ASbGncv18210ujLxBlxXhCBJo+73DOfA++RJY4LN9BfhnWApWMiZigw28nhnDdPD7Zk
	af6J5dwOumfT732sOESemeCE7ST5VbeMcPYTDEAl5rZ7NVY1KAUIPjq85Bpm8of5Fagajh6kBy3
	PfSbjCF4oG2/q1bUX4tiZqLtrBQ3Bl4qpM9yIYxziX7XEA/hxjaXmQom/DCLGyy9waLeXiZrNrQ
	C0VnIwbTI3mT50O8LqatR7EZlDU40Ow8NK7xYlaQh09gLvDXf1TbQA4V9rMTOjXpuQ=
X-Google-Smtp-Source: AGHT+IFl9i+s20vSR9nf5hSv9Zst+j7vMzYtd3dq6Y0iOR94/+I5X7TcTj7+bG6xfvLIlo5Gf6AFUA==
X-Received: by 2002:a05:600c:138f:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-436e26a88d9mr121456625e9.12.1736544727346;
        Fri, 10 Jan 2025 13:32:07 -0800 (PST)
Message-ID: <fe71538a-92ed-4ab5-95f7-e5c8d42929d2@citrix.com>
Date: Fri, 10 Jan 2025 21:32:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/1] Bug: Hyperlinks in generated documentation may
 point to the wrong architecture
To: Maximilian Engelhardt <maxi@daemonizer.de>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1736542505.git.maxi@daemonizer.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cover.1736542505.git.maxi@daemonizer.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/01/2025 9:19 pm, Maximilian Engelhardt wrote:
> As suggested by Andrew Cooper in [1], I formally submit this patch for
> fixing that documentation hyperlinks may point to the wrong
> architecture. This fix also makes building the documentation
> reproducible in Debian.
>
> With this patch applied, I still get the following:
>
> /usr/bin/perl -w /build/reproducible-path/xen-4.19.1/docs/xen-headers -O html/hypercall/ppc \
> 	-T 'arch-ppc - Xen public headers' \
> 	-X arch-arm -X arch-riscv -X arch-x86_32 -X arch-x86_64 \
> 	-X xen-arm -X xen-riscv -X xen-x86_32 -X xen-x86_64 \
> 	-X arch-x86 \
> 	/build/reproducible-path/xen-4.19.1/docs/../xen include/public include/xen/errno.h
> include/public/hvm/dm_op.h:476: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:55
> include/public/hvm/dm_op.h:476: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:61
> include/public/hvm/dm_op.h:476: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:55
> include/public/hvm/dm_op.h:476: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:61
>
> This seems to happen due to multiple "typedef uint64_t xen_ulong_t;"
> in xen/include/public/arch-ppc.h (albeit in different if(n)def blocks).
> It does not cause any problems for us at the moment, but probably should
> still be addressed somehow.
>
> [1] https://lists.xen.org/archives/html/xen-devel/2025-01/msg00324.html
>
> Maximilian Engelhardt (1):
>   docs/Makefile: Add ppc and riscv to DOC_ARCHES

Thanks for the patch.  I'll commit it in due course.

As an aside though, is there anything we could sensibly do in our own CI
(Gitlab) to not regress this?

https://salsa.debian.org/reproducible-builds/reprotest looks like it
might be good start, but I've never really played in this area before. 
Would this be suitable, or do you have any other suggestion?

~Andrew

