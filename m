Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D0BB63F7
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 10:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136429.1473004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4bJ9-0002C1-6d; Fri, 03 Oct 2025 08:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136429.1473004; Fri, 03 Oct 2025 08:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4bJ9-000296-42; Fri, 03 Oct 2025 08:38:31 +0000
Received: by outflank-mailman (input) for mailman id 1136429;
 Fri, 03 Oct 2025 08:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TaDF=4M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v4bJ7-000290-W7
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 08:38:29 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55f062c9-a034-11f0-9d14-b5c5bf9af7f9;
 Fri, 03 Oct 2025 10:38:29 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-62fc28843ecso2919567a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 01:38:29 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3ab4b0sm3541664a12.5.2025.10.03.01.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 01:38:27 -0700 (PDT)
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
X-Inumbo-ID: 55f062c9-a034-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759480708; x=1760085508; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hl6DKbhYmaWddgFsA96ck65hAIkdKmRmctwiDKkWjns=;
        b=epshcqVPvvFQuxLRwfL7lETDJl1AH9VCrjJhlIhNrATtkL/KMmrJe5AeaEMgi/fwVj
         1Yi3eUgCaYnX+odxf1HUeAhVDPDjB2a93sQldbRdf3AUySAY50eEriDNMUKMdbrfkTcR
         bW5M6NqKyT8NkuMCSHyyf98/85CNodg/ae6p/HirkeZn2Wgho6Hjufsd70nna+ouh7Hq
         VGSRD2kL3iTdl3YMVveGS678ile0shZ4Lj6NxEDQdZYoW3Zo0CeQ4lY5+WUNC3ihkRfT
         nxbpwZQshN42VV5pBHOLDBF/4EqGgr5gOrreorEiv8V5dSXZKN7eF5lQuiKOWkh+HudA
         VyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759480708; x=1760085508;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hl6DKbhYmaWddgFsA96ck65hAIkdKmRmctwiDKkWjns=;
        b=EZr8cX9UunR+YLXrN8Xpw60lucvlgiTUFBDfb3xzWsx0V4QLzNKEafqV7HcnLXtj33
         WEZUMXGj+iwd5m0/uNwoOnqQA7JcvPiMicenHBXPALVk7jptudDY762n2ZicxCfiX/u3
         rFXel2h/oxKZTgaT4JE6IeKY0/YwkImkNVluSTc1vbHMb3gmi/4oUMe6rSyqlGv7oKAq
         WVayzBb0s8Gh52KGe3NiBh5yWUCHBKGq8X3cMX1KC53ojaOLYCfG4IQ89zPa1SR5sDsY
         hUolf0Eu+kIJBGapdm/VARmrJK2ZFK5YvCBuKawQ9x6vIiNrLV/Be6Kk3Ec4xT0LHWHS
         L+eg==
X-Gm-Message-State: AOJu0YwLx3i5oPY474yYC6iHlU3SWjT0jOPipEP+IpKn8V5W155J1wRl
	9EGnJjvvn7r8MAY1eER++MuE4LC3ewvo3fnD4NkGvEW5VmxfbifEN74Qu+7hsQ==
X-Gm-Gg: ASbGncvCg85sPsb4yXxCKLyeSTjoUnHGG62gOfmvv5mcBuZ1Uuc7mj0T7ykAg6u0dJz
	tfxm6iKJTNEpjPpK7FOPYTbhw0tlWDCrUD8DHaediWrmxLbg6IySsSDOIqi7zxqesJ/tl+UW2nt
	9+7489derCl9ZRDIjeSva6U+qyYxO9fX3VHOSvk0fY9DqenFbSMhZei181GK6vrwC1W50pB8GDU
	P2LG35i0ne+WGAWyvbvCxIWoVHmvvDEevJxbnnIdJfoMgIaIwGBL4vqTzvQsa7/40T9N6obJ9kl
	CiZtCSXfwURAFo7QGUszWSD77Wp+C93aXu8OESsUI1DMgWgHRX+4jnJOf1NsB3UWJ+e+NZhYhRy
	31TrEEwL4FNSjy0coHwthvOV2NUpjxPDHghdjLdxHjAmFTVgETZRcZqUYVW2d8sG8l90r2e7+5U
	9lnkrpqOcgvCDQD5wUQ22up6nPLkA+7AHnPDQ=
X-Google-Smtp-Source: AGHT+IGZEuldA8S/udifmtpZVgfUTugv0952Lll0Nxqs88YhxznHjYM08cBEPRl/dDgBglOg6hWLCw==
X-Received: by 2002:a05:6402:3585:b0:638:3f72:125a with SMTP id 4fb4d7f45d1cf-639348d76b4mr2171290a12.14.1759480708220;
        Fri, 03 Oct 2025 01:38:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------zyZ48vpMNzFA60oUHSnRUi4M"
Message-ID: <ef97c06c-7552-401b-8e7e-210cf66de5aa@gmail.com>
Date: Fri, 3 Oct 2025 10:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/hvm: fix reading from 0xe9 IO port if port
 E9 hack is active
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20251002102200.15548-1-roger.pau@citrix.com>
 <1b4bcb40-d62b-47b5-847f-b6e16906f52e@citrix.com> <aN6APR-CUc9xRjfM@Mac.lan>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aN6APR-CUc9xRjfM@Mac.lan>

This is a multi-part message in MIME format.
--------------zyZ48vpMNzFA60oUHSnRUi4M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/2/25 3:38 PM, Roger Pau Monné wrote:
> On Thu, Oct 02, 2025 at 11:37:36AM +0100, Andrew Cooper wrote:
>> On 02/10/2025 11:22 am, Roger Pau Monne wrote:
>>> Reading from the E9 port if the emergency console is active should return
>>> 0xe9 according to the documentation from Bochs:
>>>
>>> https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html
>>>
>>> See `port_e9_hack` section description.
>>>
>>> Fix Xen so it also returns the port address.  OSes can use it to detect
>>> whether the emergency console is available or not.
>>>
>>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>>> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
>> Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>
>> That's been wrong for rather a long time.  How did you find it?
> I came across the documentation above and I didn't remember Xen
> returning any value for reads, which sadly was indeed true.
>
> This was because I had the intention to suggest Alejandro to (also?) use
> the port 0xe9 hack for printing from XTF, which should work for both
> Xen and QEMU.
>
>> CC-ing Oleksii as you've tagged this for 4.21.
> I was told that bugfixes didn't need a release-ack until hard code
> freeze, which is the 31st of October?

I meant until the start of the hard code freeze, which is on October 4.
So there is no need for a release-ack for this patch.

Thanks.

~ Oleksii

--------------zyZ48vpMNzFA60oUHSnRUi4M
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
    <div class="moz-cite-prefix">On 10/2/25 3:38 PM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aN6APR-CUc9xRjfM@Mac.lan">
      <pre wrap="" class="moz-quote-pre">On Thu, Oct 02, 2025 at 11:37:36AM +0100, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 02/10/2025 11:22 am, Roger Pau Monne wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Reading from the E9 port if the emergency console is active should return
0xe9 according to the documentation from Bochs:

<a class="moz-txt-link-freetext" href="https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html">https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html</a>

See `port_e9_hack` section description.

Fix Xen so it also returns the port address.  OSes can use it to detect
whether the emergency console is available or not.

Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Reviewed-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>

That's been wrong for rather a long time.  How did you find it?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I came across the documentation above and I didn't remember Xen
returning any value for reads, which sadly was indeed true.

This was because I had the intention to suggest Alejandro to (also?) use
the port 0xe9 hack for printing from XTF, which should work for both
Xen and QEMU.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">CC-ing Oleksii as you've tagged this for 4.21.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I was told that bugfixes didn't need a release-ack until hard code
freeze, which is the 31st of October?</pre>
    </blockquote>
    <pre>I meant until the start of the hard code freeze, which is on October 4.
So there is no need for a release-ack for this patch.

Thanks.

~ Oleksii
</pre>
    <pre>
</pre>
  </body>
</html>

--------------zyZ48vpMNzFA60oUHSnRUi4M--

