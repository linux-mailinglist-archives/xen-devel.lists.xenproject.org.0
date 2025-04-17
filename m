Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEA0A91FA5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957879.1350893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QEq-0005HG-Dy; Thu, 17 Apr 2025 14:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957879.1350893; Thu, 17 Apr 2025 14:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QEq-0005Ew-B9; Thu, 17 Apr 2025 14:29:12 +0000
Received: by outflank-mailman (input) for mailman id 957879;
 Thu, 17 Apr 2025 14:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CA5y=XD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5QEp-0005CJ-7G
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:29:11 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5320b3fa-1b98-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 16:29:09 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a823036so448545e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:29:09 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b58cc0csm56669645e9.32.2025.04.17.07.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:29:08 -0700 (PDT)
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
X-Inumbo-ID: 5320b3fa-1b98-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744900149; x=1745504949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5MG1fV5CsnDmr/QY08A2+RQ9cjrClV9EXex1K4KaxIM=;
        b=HqoF2X5O9MAOKIqgDWgfkQFFM78mz6gkfQlhAl9fFRJE7oO8v4RPZx5+OIdNUNwiXA
         nCMZhrSSOD7BFL6vg8U5+DABJCwoYOfARQiNM2dGtl4VNxqt+L/jSmgyHEqBwqCmisPA
         wlP0/VOIs0mlCh86vuPSt3s2R8dPXNVmywpCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900149; x=1745504949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MG1fV5CsnDmr/QY08A2+RQ9cjrClV9EXex1K4KaxIM=;
        b=qJT3264AAhTY37+jII1NEbg3/YznwmDb6yoYNB34SyD+u6pT47gdlBs5IAhHHLCris
         rxEAN8BLW0nSrf8B+3AmH9a7rILIwgl4v1Ayi5ZEL7oXG05aepvCIDCkvK1iItFp45Rj
         9+Ob6rv9y41bK+zffIBvGpuL/ipV9TUJ/1MRZM75vNgVUhCKIXFT7WG12sz1ArdwH3Sh
         Ak7b2Z9nBsDt/sJOq7oBjgORyR+0mrsN/GOskj3Nmg1GZp7sEurCDlqYplW0tby9Rpt3
         Oypr1UOGJCyqKFNLE3e5FFPJX0hOOxlWYYnZUcUidJVPw2zrNIMQXMIjkAE3GOKnR0q3
         Y3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUO56oU0IfSnk1FTqEIsQdVwigFBhEusruLGK2URsmZ9AOtAzJJoZjrjEvouBAWgOwN7zjSXtou7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRyu3D1EMscL/X7MFnsfYCHZd+5ZnfjN+zf1R5pL9EMubIIEFg
	x1AUsFfaccI+eOD1NuWwClAFop7zCPpLUJXg7RycjQMDQIN2hET2SI33AiP4o70=
X-Gm-Gg: ASbGncvEHEqR3s1mkKFq1vAEinauP1sI13p01vU7kwOddbVqvXUyzjhqm7u5YrW9zbz
	eHLE2nMyJxlwumul9VqaVM9yCyrMVowGOy2RqY3WHsd7YfdoeRNJDmgvq9uWFd82xHpNOpYEMvZ
	MsK2aDQ/YitfMlPa073g8bc7asSwCDNjfUnH0F6XNLJdk/z/9xH+x8nD6AGZ+PLca/1AxQ2RhAD
	VaArfkyUUfSPRGHIJZVXsg1j/jZ7BwIS64GRYo20aVmNopnK1VXCnfvBH6SBCsy4Kl3NuLdKsF6
	cRSM8QeQndcWb0DfmbCDxoV9Jj/8mzTVk5M8XF+DVpbKuQqyqvjy66PAr1Ue6lq5v1JRvLjag5f
	7umtpsw==
X-Google-Smtp-Source: AGHT+IHdkfLPMyr4v36T0lVcKIwgCaWjCA0mwhPqFx6fqfi9S2yIlspz666+TQPphHfQ5jGm6TP4CQ==
X-Received: by 2002:a05:600c:4f8e:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-4405d6cea58mr60099425e9.30.1744900148838;
        Thu, 17 Apr 2025 07:29:08 -0700 (PDT)
Message-ID: <ad75c664-4576-4fc9-b469-e854c72c5da9@citrix.com>
Date: Thu, 17 Apr 2025 15:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vmx: Don't open-code vmresume/vmlaunch instructions
To: Teddy Astie <teddy.astie@vates.tech>, security@xenproject.org,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <2d9480b75c80d49952812769f283a220c1753571.1744899753.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2d9480b75c80d49952812769f283a220c1753571.1744899753.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 3:24 pm, Teddy Astie wrote:
> binutils 2.25 has support for assembling vmresume/vmlaunch
> instructions, so we don't need to open-code the byte sequences
> for these opcodes anymore.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

