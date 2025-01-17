Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EECFA15218
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 15:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874112.1284953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYnem-0008Iu-SS; Fri, 17 Jan 2025 14:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874112.1284953; Fri, 17 Jan 2025 14:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYnem-0008Gh-Ph; Fri, 17 Jan 2025 14:49:08 +0000
Received: by outflank-mailman (input) for mailman id 874112;
 Fri, 17 Jan 2025 14:49:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uuMv=UJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tYnel-0008GW-CP
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 14:49:07 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 338d1311-d4e2-11ef-a0e2-8be0dac302b0;
 Fri, 17 Jan 2025 15:49:06 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so2176016e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 06:49:06 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543a24d2237sm5809e87.9.2025.01.17.06.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2025 06:49:05 -0800 (PST)
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
X-Inumbo-ID: 338d1311-d4e2-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737125346; x=1737730146; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW9ZYsB86Q9/+J1D7xZz6p0RqShqfz4LZx9J65RLi70=;
        b=E+jKzxlUGqsZ/tHOu3Q2FePvX27BoddjXAvJ27zQ8Uy5yxXYUqRIugL+NxgRIVNxZE
         Vflz0zCemlZYWP5Qc48kRnvC9lgxrJRjLndIjrQkUry0HBXB3hBbhLUVIguHkcr1s0LE
         3jL2T/Z6Yzqgoiw8opL0rrxBSL8f2t01It24u9Doa1CdYM/gnBkJeNE9ABMXPIXZPsG6
         2uGC/PcJJTV8TAE7d9xUtC0sdr3fEvDtQAeykdBN6OEmRTZkYq5wlbb0mq+iC0bI/Vie
         fCiWPIYquiMT25zb3QqHNssmqPq4CGfqBD/JU0tl+ucygEgBZCGmpWF6WHI4iG2QGsD0
         GdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737125346; x=1737730146;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qW9ZYsB86Q9/+J1D7xZz6p0RqShqfz4LZx9J65RLi70=;
        b=QlPpsxUp7/+55/FyKQQqEF+9+H/vp+s7CLuqSWdpNgDcAU5JypOEgvv/7DUDtj2a20
         ov0p+iuofH1S5wJ+C25uyVH3yNLUI7/2s1VGQye4QJvvI2KEUXQmKAGzljcd7+KYxhXU
         Simy0TvGLSVn4DD/Szsd04ajltNkFK/Jgw3HoDGLZaE7afr3PJWYxTqsrB9XZNL8P47u
         Tr6tjEU1E6nI8ElHUAnHkzPzIL/gblBhnGA9eXs/UBfgmfN4V5LQG7mZRdc5VxQN8p+F
         Wp75umoXurn7pE/WW/sHQiR46wBSUb971t7DGXoQLLKotKZN56dikvpKGZn2ODQTEwV/
         REaw==
X-Gm-Message-State: AOJu0YyT824QyCGI2AA6/295fZS64mFYRic76Wmko+mEttft2qqdsZJz
	gwYTrtlgCiu5X/sQKA4isdw+Dtl5GbguLrZNm9UPpYuf4rU6iGxo
X-Gm-Gg: ASbGncs98IDbG4uYjhFLmwRSXsqH55TFJlR5B+yTYb/eYzWN8ZU1/TH+c/Xx1Du4vEt
	qsMtwe3j5aPpWmR+I264MVmPtLMmi4zxgcxl0UDip7oJ808qAi1ACKhHaeDsf65WpngvEuXnBsk
	6L8OJukBxcB0IIZ/2h/bJaV/7wHoGpL55M49EOj93NELfxgtBh6ay2o3S6qmd/avx/B184AApvy
	NydMAoqDXPFspqCMXF5DpKfEOC3mKoSDn+MFplsSgWrWIDy70UCYPXAPCbzYxgORrpa+A==
X-Google-Smtp-Source: AGHT+IEM/KdAXnsc4qYMmKoF0DpK0hX8iSzZqwvM3nZytSFO04u12XZNvwnINUz8l4IXS4ZFB/fnsg==
X-Received: by 2002:ac2:561b:0:b0:540:353a:5b1f with SMTP id 2adb3069b0e04-5439c1ba039mr977823e87.0.1737125345591;
        Fri, 17 Jan 2025 06:49:05 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------zvh0GQkezdH8j6rlGDHgZ2Uz"
Message-ID: <51ac13ed-c6a8-4cd6-9790-d7c13de4c5ee@gmail.com>
Date: Fri, 17 Jan 2025 15:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v2 2/2] automation/cirrus-ci: introduce FreeBSD
 randconfig builds
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <Z4j4s-1iK2CH4ssK@macbook.local>
 <20250116135957.80826-1-roger.pau@citrix.com>
 <94bbb56e-4a44-4981-a617-cdc541ea5308@citrix.com>
 <Z4kUGFKFHFBExvBl@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z4kUGFKFHFBExvBl@macbook.local>

This is a multi-part message in MIME format.
--------------zvh0GQkezdH8j6rlGDHgZ2Uz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/16/25 3:13 PM, Roger Pau Monné wrote:
> On Thu, Jan 16, 2025 at 02:02:38PM +0000, Andrew Cooper wrote:
>> On 16/01/2025 1:59 pm, Roger Pau Monne wrote:
>>> Add a new randconfig job for each FreeBSD version.  This requires some
>>> rework of the template so common parts can be shared between the full and
>>> the randconfig builds.  Such randconfig builds are relevant because FreeBSD
>>> is the only tested system that has a full non-GNU toolchain.
>>>
>>> While there replace the usage of the python311 package with python3, which is
>>> already using 3.11, and remove the install of the plain python package for full
>>> builds.
>>>
>>> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
>> That looks cleaner, and likely to have better longevity.  Thanks.
>>
>> Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>
> Forgot to Cc Oleksii on the patches, as I would like a Release-Ack.

R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> Thanks, Roger.
--------------zvh0GQkezdH8j6rlGDHgZ2Uz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/16/25 3:13 PM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Z4kUGFKFHFBExvBl@macbook.local">
      <pre wrap="" class="moz-quote-pre">On Thu, Jan 16, 2025 at 02:02:38PM +0000, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 16/01/2025 1:59 pm, Roger Pau Monne wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Add a new randconfig job for each FreeBSD version.  This requires some
rework of the template so common parts can be shared between the full and
the randconfig builds.  Such randconfig builds are relevant because FreeBSD
is the only tested system that has a full non-GNU toolchain.

While there replace the usage of the python311 package with python3, which is
already using 3.11, and remove the install of the plain python package for full
builds.

Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
That looks cleaner, and likely to have better longevity.  Thanks.

Reviewed-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Forgot to Cc Oleksii on the patches, as I would like a Release-Ack.</pre>
    </blockquote>
    <pre>R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>Thanks.</pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite" cite="mid:Z4kUGFKFHFBExvBl@macbook.local">
      <pre wrap="" class="moz-quote-pre">

Thanks, Roger.
</pre>
    </blockquote>
  </body>
</html>

--------------zvh0GQkezdH8j6rlGDHgZ2Uz--

