Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDEAA3FCAE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 18:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894538.1303247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlWRi-00083W-H8; Fri, 21 Feb 2025 17:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894538.1303247; Fri, 21 Feb 2025 17:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlWRi-00080O-E4; Fri, 21 Feb 2025 17:04:14 +0000
Received: by outflank-mailman (input) for mailman id 894538;
 Fri, 21 Feb 2025 17:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jkcg=VM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlWRh-00080C-5C
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 17:04:13 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddcb44b8-f075-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 18:04:09 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so3906427e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 09:04:09 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452db28594sm2345483e87.40.2025.02.21.09.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 09:04:08 -0800 (PST)
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
X-Inumbo-ID: ddcb44b8-f075-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740157449; x=1740762249; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PwKvJ6GwG6qg6pEUuqhjf8aHGVTzyOEh3ZzWc2kdl4=;
        b=SUyOTN1BOj6NuWKlBhl0mPo8QEavtestt4hs2cO9+Rf6/jHRl/iGryvz1Yj9XZAWw8
         BSUIC78Pvt08i2aYh7+5K5fpsIiiY1HNraw/sM12FMtEIsl+DU6cLtLbKTLpd20xPwkI
         VrTmXv8ZgO7JDf0bGL/qOV6NKQw+QCgkGJkcrxeaLsoSGOL9wF1JZglCYclXM5pWOUD4
         jnNZMTIT9o4jRHvSGC4LYISX//yqnM5zJMTlvcS/TqqXEGtmwlPskqXjZ4GOSTmAWVn0
         iQxCMEDOdgx9rD24e/0CkyuxnBub/c5oQb93upNGKyQOH0ioB6WWowsE+K4fuY6XEzhD
         eW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740157449; x=1740762249;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1PwKvJ6GwG6qg6pEUuqhjf8aHGVTzyOEh3ZzWc2kdl4=;
        b=lWM9O4CTzeQznRy4U9idMt5srpsJQSweKJ6+JKoDeQKTPYHxbErTi1xz1GNL9CSPtA
         kmkt66LshLlCXFlReq5znD29KCVKCONaHOMPsruMii1QY6IQ44/cSa/GvBXTQnKpAplX
         I9eNLt/jOeJFJmYMnNQmFnytn4PbGv5KUt/v85AAsAbJouJL5qgJa/blEYvCG2BGHgWr
         Uvl6o+S09HUnOEDWqVA5lfrQ80VlQlRhdFw7ZSUdKhzxCl4tBP3XgjjItG5eQOEUBOJy
         X60BG7gCVgZdQanPN/I+HrtdsZWwam4f/5Qv3vxg/50baOR6ykkcnjhioSzKVhd/G7fO
         MZmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFANW1N9WX027jqSG5A8iC/lYYtKJe6bHEH0JkqNXeAoMkTz3If/oyNa+bZc29x6le2LO+PpYmhls=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzL3LIuWvDCbLtlu0NxU+w2MTnpmTKBF1IJ48JyRfgn2v9aNGbT
	9tHm3uTiBZROUQ0ekKlJ6J+NsCx4EGjsRaR+YJxfvHlkLKEazNN7
X-Gm-Gg: ASbGncsllyyhX6tDX4abPGz+Q8jVCqLrqzHd6NnD4YzynhBH+4hTPXhbj6o+qmH78vB
	Jkxmb/nClzAF06/muA9DQzLq14QmV96JJChXDLfxt2hPHgM3zOC7zdaWpH1QQ/qccnQyKyzOgB1
	y+cjmHiXQWtCJWG3FWnV7+sNEaFfLO7EsbMyiro3SL/mODjcIGMIRx+f8t8onUWgjL1PBrp7Uwe
	S6V8oyraY6QXK4I33lcqfhKd/KKe4hWtCB2BgIR3hHM8ALzdYpDrjYFDGTObWJDvcWJN9LMI/D2
	nb08W1+rPEssj0qI67f9B8fTxzKowrQsfMA=
X-Google-Smtp-Source: AGHT+IE5HH17RGXPqJoivgWxVCUO6X/s4b22jXPpnsG5u4YAO5SzUswUXqveqI20Rb2HkUQhgSJ91w==
X-Received: by 2002:a05:6512:1153:b0:545:e2e:8442 with SMTP id 2adb3069b0e04-54838c5e21amr1208176e87.6.1740157448639;
        Fri, 21 Feb 2025 09:04:08 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------LMms07Wctq8KcJfjhaW7PoVp"
Message-ID: <cb818120-dc01-470d-a9c8-9b3587042405@gmail.com>
Date: Fri, 21 Feb 2025 18:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 1/4] automation: drop debian:11-riscv64
 container
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <659bd8c00e79be1a47fc2aae75accd69b3bedaf4.1740071755.git.oleksii.kurochko@gmail.com>
 <d2a9d3f1-0584-4c9c-95c5-5babf0ffde06@suse.com>
 <d7b833b3-780c-449c-a07b-3b7198a0fa62@gmail.com>
 <e1215fff-65cf-418b-b13f-6405c38b1787@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e1215fff-65cf-418b-b13f-6405c38b1787@suse.com>

This is a multi-part message in MIME format.
--------------LMms07Wctq8KcJfjhaW7PoVp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/21/25 1:30 PM, Jan Beulich wrote:
> On 21.02.2025 12:57, Oleksii Kurochko wrote:
>> On 2/21/25 9:35 AM, Jan Beulich wrote:
>>> On 20.02.2025 18:44, Oleksii Kurochko wrote:
>>>> There are two reasons for that:
>>>> 1. In the README, GCC baseline is chosen to be 12.2, whereas Debian 11
>>>>      uses GCC 10.2.1.
>>> Which README is this? Not the one at the root of the tree, afaics, which
>>> continues to mention only x86 and Arm.
>> I missed to add this patch:https://gitlab.com/xen-project/people/olkur/xen/-/commit/57901e60066e93d986670aa91fb390774c965d3f.
>>
>> Would it be enough just to do a reply for this patch series and send what git format-patch gives?
> Don't know. In particular I have been under the impression that "git format-patch"
> formats things slightly differently than what "git am" would expect. Can't you use
> "git send-email" here as well, making that patch 0.5/4?

Done by using git send-email.
At least, my mail app parsed this case well.

~ Oleksii

--------------LMms07Wctq8KcJfjhaW7PoVp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/21/25 1:30 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e1215fff-65cf-418b-b13f-6405c38b1787@suse.com">
      <pre wrap="" class="moz-quote-pre">On 21.02.2025 12:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 2/21/25 9:35 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 20.02.2025 18:44, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">There are two reasons for that:
1. In the README, GCC baseline is chosen to be 12.2, whereas Debian 11
    uses GCC 10.2.1.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Which README is this? Not the one at the root of the tree, afaics, which
continues to mention only x86 and Arm.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I missed to add this patch:<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/57901e60066e93d986670aa91fb390774c965d3f">https://gitlab.com/xen-project/people/olkur/xen/-/commit/57901e60066e93d986670aa91fb390774c965d3f</a>.

Would it be enough just to do a reply for this patch series and send what git format-patch gives?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Don't know. In particular I have been under the impression that "git format-patch"
formats things slightly differently than what "git am" would expect. Can't you use
"git send-email" here as well, making that patch 0.5/4?</pre>
    </blockquote>
    <pre>Done by using git send-email.
At least, my mail app parsed this case well.

~ Oleksii</pre>
  </body>
</html>

--------------LMms07Wctq8KcJfjhaW7PoVp--

