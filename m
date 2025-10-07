Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA72DBC17D9
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 15:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138798.1474409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67g3-0000Yn-CV; Tue, 07 Oct 2025 13:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138798.1474409; Tue, 07 Oct 2025 13:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67g3-0000WW-8V; Tue, 07 Oct 2025 13:24:27 +0000
Received: by outflank-mailman (input) for mailman id 1138798;
 Tue, 07 Oct 2025 13:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jiYT=4Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v67g1-0000WQ-KY
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 13:24:25 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f06f4c41-a380-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 15:24:23 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so960427466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 06:24:23 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865e7c47fsm1400170466b.37.2025.10.07.06.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 06:24:22 -0700 (PDT)
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
X-Inumbo-ID: f06f4c41-a380-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759843463; x=1760448263; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yuz8CIN0GvgIzF0Q2+x+b9HVjtseIzXwWUfY2+2KheM=;
        b=drNSdQPiQVl9tVC/M9Jg2r7SbX0RzOM3u4IvppajsrRqGP0JDtcWkpV+bPYnvg5APF
         pNAYvYWBVu8CAyTWeWNsB7NoZxeXSIZbu6EeiXWHFEc/6kc057fiZ/WKdZRrl94OLMaI
         BdjcJJlpTU3dcI95KFt4W5DOYoS4ELkqDmuRTDkxmC1Epw5ktCjCZMwFoE4SMulC8z2q
         pkMbgtUPo7TG3MIMD7V3E9jqHLuMWTr88VLPovf2mqf+rtsmNVE6NYyXYSYwTaob+W6w
         DBUNwIkotoT/udwK6YK4DmWX5X/uclH0JJb9AC+VIdchcuxGNWiHMfdt9rVR/yTmMYnl
         cHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843463; x=1760448263;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yuz8CIN0GvgIzF0Q2+x+b9HVjtseIzXwWUfY2+2KheM=;
        b=eQkZSBJ7aLppLbFrcFhPE0+48GUfsvoQOiKKywlvppRMnirNl4JkDYZ2j4pdDd7aIw
         VwOAgHOvqQ+Jib/CKYjcktpgJ2Ba8sLhP7370EWX+SHWqKmh0/1qQD3ttSsbQb6/aJIE
         PLiNfd+CyRxLZBQrN8/RgXQP08BI8e/25/V6uLDxuJl9bUAoeCiem8a6jt3sqtEqhbOL
         3JGIT+9YY1Qn5cJ2UL7gLqAg8MSnaTiNIfuavJXLpWwrlX6SkHkXF39JFzJIqHVhfkHW
         qC3Ak8mZd961RuMIJYqE9McwgBsugQMQ1zm8KH1g7jO2gvgRJpkClBs0dl4dm426OOkv
         QaXg==
X-Forwarded-Encrypted: i=1; AJvYcCVw8v5hwBtx6RNWnn9fReSXMsIVon8lK2Sg99MhIXUzWPovVFgmgYnNx8Z0FIHbhxlejgpTt9CG3X8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyokt1n0E1Od9KzB53HEnk/A+5C/UlFVUH3rL8VlbHDRi/qsuhY
	4QNUXAFSSEIU3FXqqQMeZfdya4t1q2hom8gM1SoG9AIEz74l8CqjabFr
X-Gm-Gg: ASbGncuZGQ+NNJ28JgDmTs+Pc06AeFnJku6oB+0n4Az/zdgGfh9QXUxUNbQR6HGy96Z
	pI01RisPYVp79h37145iXwNLIiCEe2zWwSqH4g7o9DuqZM0exbhwgeJjdF9yMfZ3BDfEHKqhcYx
	DhilSX7bclQRyrSQDpB80OQdKMora5TmQhKFx6C8lgPe33OZweHZmk5VwV7uB28ps4mFGOV/+rU
	t8XFLbtjmWoUA2YBLqO4ldlVo4OFFw/gnxRgV3Sxo8m08ZD3L4WxpPJMQgVC+NrrgodAFPuAF/x
	ncL4KETvZ8khNvNoveldNiGz80lM5l4Sm4WhPlt2RE+wRuFdQApYgfBddZyBKBLj91jhPPygHgF
	arsKL86au4VMWrelsUJfLjQITD14cTWl/hnub/VuJeoqmXb0qmqL+vikWfNJIgWY9PiinwloaO6
	Rb9zbtyVTwH8TC1wTBFopI2HsDYgE=
X-Google-Smtp-Source: AGHT+IEsBqTZWJfpIv+5/UyV3gxe5XLUElJvl0W53iz2OIXzlgA9gF1wciZGOa+CI1+MEekDJKZJqw==
X-Received: by 2002:a17:906:ef03:b0:b40:bdc3:ca04 with SMTP id a640c23a62f3a-b4f3e1fb611mr569550566b.0.1759843462505;
        Tue, 07 Oct 2025 06:24:22 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------KgmRIvrdh9S4ZOYDJtUNxB0G"
Message-ID: <0f2541de-03f7-4032-8330-55d22e31ae95@gmail.com>
Date: Tue, 7 Oct 2025 15:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v2 0/3] cirrus-ci: get testing working again
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251007070056.83423-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251007070056.83423-1-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------KgmRIvrdh9S4ZOYDJtUNxB0G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Roger,

On 10/7/25 9:00 AM, Roger Pau Monne wrote:
> Hello,
>
> The following series fixes Cirrus-CI testing so it's fully working
> again.  I request a release-ack to get those committed (once reviewed).
> The risk is very low, since they only modify Cirrus-CI code, so
> Gitlab-CI is not changed at all.

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> Roger Pau Monne (3):
>    cirrus-ci: install libinotify for FreeBSD
>    cirrus-ci: fix bashism in the test_script code
>    cirrus-ci: bump FreeBSD version
>
>   .cirrus.yml | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

--------------KgmRIvrdh9S4ZOYDJtUNxB0G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello Roger,</pre>
    <div class="moz-cite-prefix">On 10/7/25 9:00 AM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251007070056.83423-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">Hello,

The following series fixes Cirrus-CI testing so it's fully working
again.  I request a release-ack to get those committed (once reviewed).
The risk is very low, since they only modify Cirrus-CI code, so
Gitlab-CI is not changed at all.</pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251007070056.83423-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">

Roger Pau Monne (3):
  cirrus-ci: install libinotify for FreeBSD
  cirrus-ci: fix bashism in the test_script code
  cirrus-ci: bump FreeBSD version

 .cirrus.yml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------KgmRIvrdh9S4ZOYDJtUNxB0G--

