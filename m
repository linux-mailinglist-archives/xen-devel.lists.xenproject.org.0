Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960F1851B61
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 18:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679684.1057286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZa5D-0005zV-MQ; Mon, 12 Feb 2024 17:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679684.1057286; Mon, 12 Feb 2024 17:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZa5D-0005xT-JX; Mon, 12 Feb 2024 17:27:07 +0000
Received: by outflank-mailman (input) for mailman id 679684;
 Mon, 12 Feb 2024 17:27:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tUo2=JV=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rZa5B-0005x4-U7
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 17:27:06 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef78a95a-c9cb-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 18:27:03 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-410e7b08252so19345e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 09:27:03 -0800 (PST)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 ch16-20020a5d5d10000000b0033b58cbf3ebsm7355426wrb.26.2024.02.12.09.27.01
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 09:27:01 -0800 (PST)
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
X-Inumbo-ID: ef78a95a-c9cb-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1707758822; x=1708363622; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjZj30nDMcqp2zKXpCE5Uei4AaXUao7Snh8f9+MbwJQ=;
        b=ZH1/GjXXQPZW9Q6maJYpab8IIHBUqBgVoMR9pU8aoMzhXDgDWHIw0wfj4reSCYehYi
         BvJCTfU58c/eR3BZ4lUiEn8rAns1D3qfbf9owYgxgKoiHVt4eAiClh/RRxxFWF9tGUmU
         6AUQWaFAlo2g113Lttfbp8C9f6mECgSgiim4LlWj4KaqCaNdStbb3XV6Fx9VgFoe0lQd
         TfWS5uH+W7IVV7PDQPjp0U5xhLPmzCEyzPrOj2s/U21G9uiG3XsbmUeFAJwKiIVOwEgO
         5JdKqHa97VoOMoaDdU7CSIJCoHXAafRu2U7o4AuKIj/oD6ypV8DbuAQ+k62j7u//BHrQ
         bMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707758822; x=1708363622;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yjZj30nDMcqp2zKXpCE5Uei4AaXUao7Snh8f9+MbwJQ=;
        b=OSatZCA3WH61xVWMYxgaTbh5dARJLH/cMUk7pTgFagvNUGgBesbBC4eL/O/UfR+VJA
         DIfQUxwOLdEHKFdbZwPEnnYUdGt9ZWCo2vS7qNPx8v9wIVzd1uK1rPIL03ipzB02f/m0
         c8oe9CqAZ7E5mSSEoMXomuP6t91jrG02Y3gK9Tz3BGJ3as9L8zUGRhXRqiNgh0Al2cVh
         hY7G3JY5N73lTc23SS8xItrumVZ5MKmTSFOEFNyee/Z6s3iTdXs6O/NZFBsr+D96wNX3
         orrS/do6sBcfYHXKHrEHarXloKJw3nSTSXzJsNbXZYGSIKdsD2HB2z/cqKBbTWJHOr0r
         b7Sg==
X-Gm-Message-State: AOJu0Ywz63h1iiVTk3J7Wlsf3LPKKhnVD7pvLhhtv0lUqQ7/h5qb1rmY
	YAIrmz8qLptLk1pWpR7wty43FIpAhSQeM/laownns69Bxo+zTvLevWpd/+jYKXjvQfaiIpfsTNP
	iOV0=
X-Google-Smtp-Source: AGHT+IHdHjLZXca1fAAhTcJzF5V7Wlw/r89uGooEU+IUUgXYeY++DtZRzmuKVuACVlL5O6kuN/IAww==
X-Received: by 2002:a5d:6890:0:b0:33c:2e8a:ddee with SMTP id h16-20020a5d6890000000b0033c2e8addeemr330101wru.4.1707758822281;
        Mon, 12 Feb 2024 09:27:02 -0800 (PST)
Message-ID: <51e993f4-c250-400c-bbf4-017a1dbf1c2d@rabbit.lu>
Date: Mon, 12 Feb 2024 18:27:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: zithro <slack@rabbit.lu>
Subject: The "64bits time_t transition" in Debian/Xen
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

the Debian project is focused on the "2038 time_t" switch.
So the maintainers of the Debian Xen package must ensure that all
imported Xen code conforms to the new Debian standards.

I was asked by Andrew Cooper to post here about this, I'll quote him :
"So I had been idly wondering whether Xen would match up to Debian's new
policy, and it appears not
this topic really needs to be brought up on the xen-devel mailing list
do you have any more details as to what has gone wrong?
this is something we ought to arrange to happen in CI by default
but it sounds like there's some work needed first"

(Not answering the question because I'm just a messenger).

Relevant links:
https://wiki.debian.org/ReleaseGoals/64bit-time
https://bugs.debian.org/1063270
   (xen: NMU diff for 64-bit time_t transition)

Thanks

-- 
++
zithro / Cyril

