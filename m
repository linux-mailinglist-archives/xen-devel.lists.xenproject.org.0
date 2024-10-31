Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3AA9B82FF
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 20:02:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828884.1243926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6aRM-0005qv-RV; Thu, 31 Oct 2024 19:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828884.1243926; Thu, 31 Oct 2024 19:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6aRM-0005od-Nr; Thu, 31 Oct 2024 19:02:40 +0000
Received: by outflank-mailman (input) for mailman id 828884;
 Thu, 31 Oct 2024 19:02:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6aRL-0005oX-Q8
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 19:02:39 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aed312f2-97ba-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 20:02:32 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso2150024a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 12:02:32 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac74c667sm818877a12.20.2024.10.31.12.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 12:02:31 -0700 (PDT)
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
X-Inumbo-ID: aed312f2-97ba-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFlZDMxMmYyLTk3YmEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDAxMzUyLjY0Mjk3OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730401352; x=1731006152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WqWEkMhVGpBJV/aCyXRNSUlAVML40hW5M18Fxc3Z4ik=;
        b=FDJXempGEvbV68wvk9/tmEJldiIb8Vy7nN/zB7+VoPejn3vMEcdJipyfeS1qE+edc+
         rU+7ssMasGWpwmg8IRYG+LDUcw/Xbs/u0kmYWxuyNs99UrdRX+rBalbIH+x7I84Jezn2
         +JHQUec9pKR3HeExzH0Bir+46Ak6A45aP7Ehw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730401352; x=1731006152;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqWEkMhVGpBJV/aCyXRNSUlAVML40hW5M18Fxc3Z4ik=;
        b=MnkypGjat6bWguLpIJjhhsVe3FA2ZtkdM6b1FsYQVxJRJnYD/hvNMXUjheL2jj4tLG
         6bJ3aoaXVSHo6W8mFCG9XMy3jerB74SZ5/lLgIf4U0LCtNEyyQZxCSTYM/X1Naq1tRks
         v8rY578QZRiVLr+qL36v+1+gXZ3RIvl7zzewhoLc+0kj4fR1yK+uYI0lHGzuFNS3SaZY
         ff0xiGfPihT9m9hCR3i28kbbncYTToquP1OHE4nnqurnZk5rwO3tH1jAY0ukWnWKhMaK
         Xe7jT0ED5203pQRLHZpxfaGVK5YX7PCBG2HpdwciZlBqXfCUl+dML8WIhVVshKCqbnKM
         /E3g==
X-Forwarded-Encrypted: i=1; AJvYcCUbFHXeVJqpS2yLZftHwN3h0fdpRPEWIILcs5akKxSEGk6cIFsOJSCf4e3OsiJ7nJX3qrbrIEILGn4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTbGzcXUs6AfLc35ag+UgkCBHSKhm3agbB+tq9y+gOeF/X6D2c
	BKzxdz6lf4dEnXN9E0YPjiDMpqjshed3WbmR21kAWtaBpanqBs/9yBQ7hAYxyWE=
X-Google-Smtp-Source: AGHT+IGHwYW++ALWE+WOqgw47HylAcxaD99KyI04tp5U+tvNg40ejp+CKZDef4qx7N4njp4DnC9jQw==
X-Received: by 2002:a05:6402:e09:b0:5cb:632c:c638 with SMTP id 4fb4d7f45d1cf-5cea9689dd2mr3832746a12.16.1730401352051;
        Thu, 31 Oct 2024 12:02:32 -0700 (PDT)
Message-ID: <49f258b5-c4e5-4bb7-848b-5779d43c1f58@citrix.com>
Date: Thu, 31 Oct 2024 19:02:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: Argo: Upgrade status to Tech Preview
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud
 <persaur@gmail.com>, Jason Andryuk <jandryuk@gmail.com>,
 openxt@googlegroups.com
References: <20241019190652.21559-1-christopher.w.clark@gmail.com>
 <8d419b12-efbf-4314-8148-3ece0baa779b@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8d419b12-efbf-4314-8148-3ece0baa779b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 1:41 pm, Andrew Cooper wrote:
> On 19/10/2024 8:06 pm, Christopher Clark wrote:
>> Recent patches to xen-devel indicate active interest in Argo within the Xen
>> community, and as the feature has been documented and in use by
>> OpenXT for multiple years, update the Xen SUPPORT.md statement of status.
>>
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> We also discussed this in XenSummit didn't we?
>
> If so, I'd suggest that gets mentioned too.

Testing has now gone ahead.  I'm going take this patch so SUPPORT.md is
less far from reality.

~Andrew

