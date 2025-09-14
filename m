Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602EDB56699
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 06:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123700.1466532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxe0S-0003yN-1P; Sun, 14 Sep 2025 04:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123700.1466532; Sun, 14 Sep 2025 04:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxe0R-0003wT-Uz; Sun, 14 Sep 2025 04:06:27 +0000
Received: by outflank-mailman (input) for mailman id 1123700;
 Sun, 14 Sep 2025 04:06:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLjW=3Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uxe0Q-0003wJ-8m
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 04:06:26 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d3d5c04-9120-11f0-9809-7dc792cee155;
 Sun, 14 Sep 2025 06:06:24 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-24b28de798cso22077255ad.0
 for <xen-devel@lists.xenproject.org>; Sat, 13 Sep 2025 21:06:24 -0700 (PDT)
Received: from ?IPV6:2601:646:9e00:b920::2bf4? ([2601:646:9e00:b920::2bf4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607a4734esm9924071b3a.34.2025.09.13.21.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Sep 2025 21:06:22 -0700 (PDT)
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
X-Inumbo-ID: 2d3d5c04-9120-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822783; x=1758427583; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0bwFi0gWVX0C7UbIGK4b1ALT6ZyeTA2AoW/1bSIA9k=;
        b=MKIhruA7dDAPLEsd+pwgu2poKHLyw55Ih5e9OaeJ5X/syGd6UYGSlJB5A87zJwA7o3
         n+RJlFgYQCpxC/Vdi4QCKYB6NfIDRp+iWUJFLdMXmV1mq+CNQ1SOJcM1mxSmuTKaNonn
         yLh+ODBiBNEZoExF3Vh6rbxseeflosLvkNAq7xu3U1wCWJqHI9rmLd6aGNekDknxmEI7
         fmUqH/L7y6wZN8ZdGreMuOMJyzZ+4pY/mdT3XlDoO9wqEup47BrPfGPltsDW3XkC6pbv
         /sGw8HTsJ7PRmREmxUHblZwsX5TWI8fsSg6cN/LqIH4YDZwkcJAlyez6IOhSZm/3D4CC
         87/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822783; x=1758427583;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j0bwFi0gWVX0C7UbIGK4b1ALT6ZyeTA2AoW/1bSIA9k=;
        b=HrUaF2cBiKwlPudZuxhgNcyJ+25+GM6I7ov07Jq52xk7dBxCjsR8KzmaC3O1iTiHr5
         xiinndDDAPbYGkIRhvsmiFU8DUHeEv8IC8kJUTw3V0HRBeGxz9nIIABcD2NhZOExD12Y
         yt7+dd0nyf9Yg0MqLjtGQ5fgBdDOeiwMTbspRgexmwjq4y/2uEW0A7E/XZ8xJKzLBBZp
         nQ2i35OpY+5CC39pU6yQdClF07WGbt4bt0CobIOQnENKObr4R0gz7biV1ihEtlJZFQxG
         Bh+sxd+10ikvQIsObruVF3JX4Qt3BsvS+xvnJpsbrV+XTcBynCwoGou+fVcb6MM7p62p
         n5sg==
X-Forwarded-Encrypted: i=1; AJvYcCVupXgLfE2ufSQL5teKQXcamrsCB+P2BHf8Msc6bkK5FO/jTQW9wy3TZoLxonHWe2kRzQAV3ZTMbn8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwI8AL8jXRv9nTW9BqxGbnWubpJP64RqBfHEREDkzgVy0BYCa6F
	pjLRr9+DC53qjEu6v82nqZmcA4Pu03no2ZhRVJ58WDR8Nqs87XjoJ1OZ
X-Gm-Gg: ASbGncvMY/FcGtLhtqvntGOWYXbikBsGKz6qDh2cq3kVaec0Fz9Nk1T3zvCnSSUY5Ne
	JmhcE1l1ty9pwvzsTuJEPW8hbtXZf/ZOKYHoYvnO38W1NZ2/PdjZc2ZyMMYcca9kR5E6wPOJ6hL
	ojCh5U2O7sAX2qEuMeels8oBMqIMNc7rorA7+fcSM5Q4kdcOjewiASoAKhwzDmw2O5gourQfeWG
	ayoA9462VHKrHw8Q0VeLuMLkEIOAW9GBtECRNXprn40Hf2Yrkfs+3HNzAOYNpSqIcLbpa1IFrwJ
	Y6Kf9kaMrQdwKioKtkPskyVARNvAOJsh3VhzBLJtW6N6E6kHOMLr4x8uobdVmorA1rPoH4pl85s
	bMaSWKtG/im32SgL5ldCAc3AQbWemPvzFN55762SpDMg=
X-Google-Smtp-Source: AGHT+IEXpKZi6drgIBTtnKy7edy0xXQ0DWz0G0yacZQdQE50SEUWaxYQMVmZs3oYdx9PgQtqjzGpQg==
X-Received: by 2002:a17:903:3c2c:b0:256:2b13:5f11 with SMTP id d9443c01a7336-25d26d4c335mr91569125ad.40.1757822782712;
        Sat, 13 Sep 2025 21:06:22 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------PI7vKfyN0dsXWqX0ITXmDRXi"
Message-ID: <a87c98df-4af3-4779-b97f-87395e5adcf5@gmail.com>
Date: Sun, 14 Sep 2025 06:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] CI: Use the Debian Trixie container for RISC-V
 test jobs
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Denis Mukhin <dmukhin@ford.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Victor Lira <victorm.lira@amd.com>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
 <20250912144427.1905141-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250912144427.1905141-2-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------PI7vKfyN0dsXWqX0ITXmDRXi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/12/25 4:44 PM, Andrew Cooper wrote:
> This was missed when introducing Trixie.
>
> Fixes: aad6ebf0596f ("CI: Update riscv64 to use Debian Trixie")
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> Reviewed-by: Denis Mukhin<dmukhin@ford.com>

Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii


> ---
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Shawn Anastasio<sanastasio@raptorengineering.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Doug Goldstein<cardoe@cardoe.com>
> CC: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
> CC: Victor Lira<victorm.lira@amd.com>
>
> v3:
>   * New
> ---
>   automation/gitlab-ci/test.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 95b883b32bb6..1de68a0fe450 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -77,7 +77,7 @@
>   .qemu-riscv64:
>     extends: .test-jobs-common
>     variables:
> -    CONTAINER: debian:12-riscv64
> +    CONTAINER: debian:13-riscv64
>       LOGFILE: qemu-smoke-riscv64.log
>     artifacts:
>       paths:
--------------PI7vKfyN0dsXWqX0ITXmDRXi
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
    <div class="moz-cite-prefix">On 9/12/25 4:44 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250912144427.1905141-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">This was missed when introducing Trixie.

Fixes: aad6ebf0596f ("CI: Update riscv64 to use Debian Trixie")
Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Reviewed-by: Denis Mukhin <a class="moz-txt-link-rfc2396E" href="mailto:dmukhin@ford.com">&lt;dmukhin@ford.com&gt;</a></pre>
    </blockquote>
    <pre>Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20250912144427.1905141-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Doug Goldstein <a class="moz-txt-link-rfc2396E" href="mailto:cardoe@cardoe.com">&lt;cardoe@cardoe.com&gt;</a>
CC: Marek Marczykowski-Górecki <a class="moz-txt-link-rfc2396E" href="mailto:marmarek@invisiblethingslab.com">&lt;marmarek@invisiblethingslab.com&gt;</a>
CC: Victor Lira <a class="moz-txt-link-rfc2396E" href="mailto:victorm.lira@amd.com">&lt;victorm.lira@amd.com&gt;</a>

v3:
 * New
---
 automation/gitlab-ci/test.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 95b883b32bb6..1de68a0fe450 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -77,7 +77,7 @@
 .qemu-riscv64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:12-riscv64
+    CONTAINER: debian:13-riscv64
     LOGFILE: qemu-smoke-riscv64.log
   artifacts:
     paths:
</pre>
    </blockquote>
  </body>
</html>

--------------PI7vKfyN0dsXWqX0ITXmDRXi--

