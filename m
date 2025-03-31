Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB1A76A0C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 17:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932771.1334829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzGxr-0005Fp-Kx; Mon, 31 Mar 2025 15:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932771.1334829; Mon, 31 Mar 2025 15:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzGxr-0005D2-I3; Mon, 31 Mar 2025 15:22:15 +0000
Received: by outflank-mailman (input) for mailman id 932771;
 Mon, 31 Mar 2025 15:22:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCWu=WS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzGxp-0005Cu-UO
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 15:22:14 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaa5c347-0e43-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 17:22:11 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so42220255e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 08:22:11 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d830f5708sm171173915e9.32.2025.03.31.08.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 08:22:10 -0700 (PDT)
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
X-Inumbo-ID: eaa5c347-0e43-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743434531; x=1744039331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d1fbdHQ/q+hF26CG9hyu5qocDg1dLaSEAlJKxV4m+c8=;
        b=BiM5XsM6O32fBC3FYZXXzcU4zwQHyPxrBjyHh8VMYGYqqBBDi4yQb42nm1iYwrmbpf
         mYBjdLOimQQoV0TlzepcGnSh1fNB/fTtAjPpJ9PN7XPD+msg/UsrbsRUgUSfgllIj33s
         sKL0ubLvfvMY1E6m5Vtz7jG1obJpMSEHSHywA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434531; x=1744039331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1fbdHQ/q+hF26CG9hyu5qocDg1dLaSEAlJKxV4m+c8=;
        b=nMn2CJcj3nJt1SEAo4Q/NqVNq806PzALusl2jWW1iNe3g0DLkofqtSJQtFPAlzP5FG
         c3Qb/4cvu/zDyQ6EOP5XY64/EHxhXk87AY2FISLPQEeLjJUqGpxVZuoHss/zN/mN6b65
         U5HIcJw9b8yAuRzIYXsdLE9m5ZU6D1VNY0uwwOXFzIKgePgqV+Qg67niEtwid9VqyT//
         c+SFwbkDN5CVw7lTikvH7G03Ei3F41I8M4RP52PAxvECXV7yULgK/JII1S9dmW2wY+bJ
         TyegDsGy+nx2qSCkDu5/oob3mF9gnrWvaDCsa+R1TQLFTX9lMJ6UqZVt1ew8xuuS0m1I
         stTA==
X-Forwarded-Encrypted: i=1; AJvYcCWcpwM2S7x44pJQC3g7aG0PBLKUnDJXKG7G1GCr+c4SC5MqNXWoEtB/3wu8TZaIdlT9t7vZZw17tL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxOys0sitxQ9cyEfoLnzG8xW2z90K2w+Wv/qFkLn8+ZXleCAC2
	Fpiesw1oXUB0Pw/ZAraB1Ls/I7O7Df1Gwa6aVmkAtQhJP8Z517Rfz0dRW9rTfB4=
X-Gm-Gg: ASbGncumNEfgkImLAzXi7oiEKQLRCcr/CbSMb7UCumFXZFrEw36FBfLu/T/cjvv47Sp
	FJPrAYxgd97jwEImf7PDtixU1rfB8phpJXYxj3p8+iYz7qyjW4vEMx2nM0t7U5kHP1ns2qZcrbr
	xu0CG+ACQvTmyzSdkVjXv9VxhEIWKZmraaf4GLfjK4YEVcbiY3lWVbfF1E08SsT7MiSwVTLYVvC
	AZFIT9a2EYdo7Yn4+NU3+JA9RYLKoc9PtHHn+h2ddiiM7juu5J36jVHXCVHQhx9jXuv9ZnvLiRM
	VDAX3EvnnVfaPW1GMwiYBNESACdQjHRNMVgoglk0H84G3ggvAAwP3u13kZd8VPvoSUornips282
	0d0TMn8xEvo9JNtd7ffvY
X-Google-Smtp-Source: AGHT+IH133xS9WiJLbRzsnpwPP+k7DJ9Khqxl1xaWOmFIVyWz79JGdDMTBGFufTPIAWkiUznn8kCXQ==
X-Received: by 2002:a05:600c:5119:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-43db62bc109mr58514165e9.20.1743434531024;
        Mon, 31 Mar 2025 08:22:11 -0700 (PDT)
Message-ID: <96beef90-6ed5-42ee-8406-a7f7ef8629ac@citrix.com>
Date: Mon, 31 Mar 2025 16:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config.mk: correct gcc5 check
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <03f284a2-cc9b-4950-89b7-f9feaac0e129@suse.com>
 <4042ed88-5921-46a8-877c-81fa96a82b42@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4042ed88-5921-46a8-877c-81fa96a82b42@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2025 1:06 pm, Jan Beulich wrote:
> On 31.03.2025 14:01, Jan Beulich wrote:
>> Passing the -dumpversion option to gcc may only print the major version
>> (for 4.x.y it printed major and minor, which in nowaday's scheme is then
>> indeed just 5 for 5.x).
> I meanwhile notice that my self-built compilers print 3 digits, so there
> really is a point to doc saying
>
> "Depending on how the compiler has been configured it can be just a single
> number (major version), two numbers separated by a dot (major and minor
> version) or three numbers separated by dots (major, minor and patchlevel
> version)."
>
> I've locally changed the above to
>
> (my system 4.x.y printed major and minor, which in nowaday's scheme is
> then indeed just 5 for 5.x, which in turn is what my secondary system
> compiler does)

Oh, that's useless.

Do all versions provide __GNUC_MINOR__ correctly?

~Andrew

