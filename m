Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE65AA943B
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 15:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976135.1363363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBvjf-0001zK-Jz; Mon, 05 May 2025 13:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976135.1363363; Mon, 05 May 2025 13:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBvjf-0001wp-HR; Mon, 05 May 2025 13:19:55 +0000
Received: by outflank-mailman (input) for mailman id 976135;
 Mon, 05 May 2025 13:19:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uBvjd-0001wj-Rv
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 13:19:53 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a042650a-29b3-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 15:19:51 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5f5bef591d6so8839825a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 06:19:51 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa77bf3f01sm5420515a12.70.2025.05.05.06.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 06:19:50 -0700 (PDT)
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
X-Inumbo-ID: a042650a-29b3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746451191; x=1747055991; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwfPy/WlxFS+xjL+sGzQ9+jQ9+Cj3IlH5XVfxD04LC0=;
        b=Yypa+MPtSU8jxe1k2nYPhI6Ol1BuLD57au2zCv/veZhW9LkmIuFQFcaGk4BZ1F8JHK
         HDln+k+In4Z6OE2eLb9rfcXoOJXjSYgs+kNWbOJinbg6YdBUoFVYd6qg+WqkaDwDYHtT
         W8+GtckswLGgN8LpKGTIEL4EeVfN3fRz4+vSFXTtUpF6cGb3wUoo7SwXBzqXwDQ6SfHH
         LTCQcx8sTa5Y2yqlRb7NqaPuCJ3JW7OyrGbVN3RZLvKrtVyNY2St1J8THIFFob9nuL13
         ficSnBEkw+IudpY9VwsQByh2ZjPMOrkg924JMKV0Si5bRjwt7kEkD9T4j+Z/tHtkdqpg
         ImZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746451191; x=1747055991;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bwfPy/WlxFS+xjL+sGzQ9+jQ9+Cj3IlH5XVfxD04LC0=;
        b=jTeLLjcbd1+UHDiFC9kcfmklKzq5eCvOeUPY3ZpuqVT1R1rC1SmlXRedXosq+f7CpF
         J7vDmfDvdQ6dlHVGxyheIoC2y3jXynPHPtPUOL4s+NoKdtvia/zTSd78yvEypagI3Kns
         +r+Pb5QZ4q8jkQUuhw7/F1mtrD80XecLsikgqzpkR73Cqhq9XCw/cIg1jh40zX53f+yt
         A1PjHBkL0FtsPXU8KcQCTFByrwDh7qIp5Nk52VQXEW5Bg10yDD374xGWRCM4KA45zeXd
         a6M9DtOiIqwEl0TrTshtoHJA3MzHy/XvTzPZWQKmWCYZQ4Yy5sP5BOQmqisHAyxqaGM4
         t6yw==
X-Gm-Message-State: AOJu0YwL8fZp+qCbv78Oib8DugauGh7dycl0lclSTQc2AxPhWUwRne/H
	AzFSEv4H5z17fi3HKAT41UPS1R9kg8t5quYIlqqfDMJGRCi1X22T
X-Gm-Gg: ASbGncv1hw+K9+WXEQOub5hbSJIJGzk1+97AjL7HZGHLarVHLpMthR5VLUMyT0Je65y
	+RwRw8FivHXujCvFZ4oQtPoBGEHGknB9/wKhxxclM4NbCZI9/e7nUhHYe08NaRQZsbz+2bPlID7
	KNCs/1yr7rtDweErISf+rtN/zoMxfZHRWxSuN4iTI/DEKQF9WrbR8ha64iqrbSoJRKmgvawIFxy
	Px9ANXdE0U5OwJvnAXRbafBDQMBING04Y7qt4l3qVj9rbOwyJSgV0p4QU8uWXDxbqowG0jCaio2
	f7k1Z1TRSLvxroba++YRyqZitKfm4YAilYcI+//eD8NLPO1ItKLdr9CdJpnmpSQ9M85sX7o+Yg4
	O7we+JuQ+dEeF9fVG
X-Google-Smtp-Source: AGHT+IEkdEUtyrP6ECgxH924iiZzuUnmlKQwrMGJTEXjmJ7r/86x1Rqopg0y8rkjjX5VKYMbWNr+0w==
X-Received: by 2002:a05:6402:2811:b0:5ed:c09c:10f with SMTP id 4fb4d7f45d1cf-5fa7805567dmr9365247a12.15.1746451191110;
        Mon, 05 May 2025 06:19:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------oy0RkXrUhnNWVpH2vi0dh6Sn"
Message-ID: <ac04dd06-1e7d-4013-8e1b-ab5f8ab39ce3@gmail.com>
Date: Mon, 5 May 2025 15:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] xen/common: dom0less: make some parts of Arm's
 CONFIG_DOM0LESS common
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
 <82f0c1d4fe25b4a52d76f3c8004e107b183af56c.1746199009.git.oleksii.kurochko@gmail.com>
 <alpine.DEB.2.22.394.2505021028020.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2505021028020.3879245@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------oy0RkXrUhnNWVpH2vi0dh6Sn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/2/25 7:55 PM, Stefano Stabellini wrote:
> On Fri, 2 May 2025, Oleksii Kurochko wrote:
>> Move some parts of Arm's Dom0Less code to be reused by other architectures.
>> At the moment, RISC-V is going to reuse these parts.
>>
>> Move dom0less-build.h from the Arm-specific directory to asm-generic
>> as these header is expected to be the same across acrhictectures with
>> some updates: add the following declaration of construct_domU(),
>> and arch_create_domUs() as there are some parts which are still
>> architecture-specific.
>>
>> Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
>> code for an architecture.
>>
>> Relocate the CONFIG_DOM0LESS configuration to the common with adding
>> "depends on HAS_DOM0LESS" to not break builds for architectures which
>> don't support CONFIG_DOM0LESS config, especically it would be useful
>> to not provide stubs for  construct_domU(), arch_create_domUs()
>> in case of *-randconfig which may set CONFIG_DOM0LESS=y.
>>
>> Move is_dom0less_mode() function to the common code, as it depends on
>> boot modules that are already part of the common code.
>>
>> Move create_domUs() function to the common code with some updates:
>> - Add arch_create_domUs() to cover parsing of arch-specific features,
>>    for example, SVE (Scalar Vector Extension ) exists only in Arm.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> It was suggested to change dom0less to predefined domus or similar
>> (https://lore.kernel.org/xen-devel/cd2a3644-c9c6-4e77-9491-2988703906c0@gmail.com/T/#m1d5e81e5f1faca98a3c51efe4f35af25010edbf0):
>>
>> I decided to go with dom0less name for now as it will require a lot of places to change,
>> including CI's test, and IMO we could do in a separate patch.
>> If it is necessry to do now, I'll be happy to do that in next version of the current
>> patch series.
> I think it is fine to use dom0less for now, it will make the code easier
> to review and it is not necessary to change the name at this point.
>
> The patch looks good to me, except for a couple of minor suggestions I
> have below. I could make them on commit. With those:
>
> Reviewed-by: Stefano Stabellini<sstabellini@kernel.org>

During the randconfig testing the following issue occurs:
   
common/device-tree/dom0less-build.c: In function 'create_domUs':
common/device-tree/dom0less-build.c:156:42: error: implicit declaration of function 'gnttab_dom0_frames'; did you mean 'gnttab_map_frame'? [-Werror=implicit-function-declaration]
   156 |                 d_cfg.max_grant_frames = gnttab_dom0_frames();
       |                                          ^~~~~~~~~~~~~~~~~~
       |                                          gnttab_map_frame
common/device-tree/dom0less-build.c:156:42: error: nested extern declaration of 'gnttab_dom0_frames' [-Werror=nested-externs]

I fixed that by the following #ifdef-ing:
...
         d_cfg.max_grant_frames = -1;
...

         if ( dt_property_read_u32(node, "capabilities", &val) )
         {
...

#ifdef CONFIG_GRANT_TABLE
                 d_cfg.max_grant_frames = gnttab_dom0_frames();
#endif
                 d_cfg.max_evtchn_port = -1;
                 flags |= CDF_hardware;
                 iommu = true;
             }

Do you agree with such fix?

If the CONFIG_GRANT_TABLE=n then the init value (d_cfg.max_grant_frames = -1;) will be used.

~ Oleksii

--------------oy0RkXrUhnNWVpH2vi0dh6Sn
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
    <div class="moz-cite-prefix">On 5/2/25 7:55 PM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021028020.3879245@ubuntu-linux-20-04-desktop">
      <pre class="moz-quote-pre" wrap=""><pre wrap=""
      class="moz-quote-pre">On Fri, 2 May 2025, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">Move some parts of Arm's Dom0Less code to be reused by other architectures.
At the moment, RISC-V is going to reuse these parts.

Move dom0less-build.h from the Arm-specific directory to asm-generic
as these header is expected to be the same across acrhictectures with
some updates: add the following declaration of construct_domU(),
and arch_create_domUs() as there are some parts which are still
architecture-specific.

Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
code for an architecture.

Relocate the CONFIG_DOM0LESS configuration to the common with adding
"depends on HAS_DOM0LESS" to not break builds for architectures which
don't support CONFIG_DOM0LESS config, especically it would be useful
to not provide stubs for  construct_domU(), arch_create_domUs()
in case of *-randconfig which may set CONFIG_DOM0LESS=y.

Move is_dom0less_mode() function to the common code, as it depends on
boot modules that are already part of the common code.

Move create_domUs() function to the common code with some updates:
- Add arch_create_domUs() to cover parsing of arch-specific features,
  for example, SVE (Scalar Vector Extension ) exists only in Arm.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E"
      href="mailto:oleksii.kurochko@gmail.com" moz-do-not-send="true">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
It was suggested to change dom0less to predefined domus or similar
(<a class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/cd2a3644-c9c6-4e77-9491-2988703906c0@gmail.com/T/#m1d5e81e5f1faca98a3c51efe4f35af25010edbf0"
      moz-do-not-send="true">https://lore.kernel.org/xen-devel/cd2a3644-c9c6-4e77-9491-2988703906c0@gmail.com/T/#m1d5e81e5f1faca98a3c51efe4f35af25010edbf0</a>):

I decided to go with dom0less name for now as it will require a lot of places to change,
including CI's test, and IMO we could do in a separate patch.
If it is necessry to do now, I'll be happy to do that in next version of the current
patch series.
</pre></blockquote><pre wrap="" class="moz-quote-pre">I think it is fine to use dom0less for now, it will make the code easier
to review and it is not necessary to change the name at this point.

The patch looks good to me, except for a couple of minor suggestions I
have below. I could make them on commit. With those:

Reviewed-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E"
      href="mailto:sstabellini@kernel.org" moz-do-not-send="true">&lt;sstabellini@kernel.org&gt;</a></pre></pre>
    </blockquote>
    <pre>During the randconfig testing the following issue occurs:
  
common/device-tree/dom0less-build.c: In function 'create_domUs':
common/device-tree/dom0less-build.c:156:42: error: implicit declaration of function 'gnttab_dom0_frames'; did you mean 'gnttab_map_frame'? [-Werror=implicit-function-declaration]
  156 |                 d_cfg.max_grant_frames = gnttab_dom0_frames();
      |                                          ^~~~~~~~~~~~~~~~~~
      |                                          gnttab_map_frame
common/device-tree/dom0less-build.c:156:42: error: nested extern declaration of 'gnttab_dom0_frames' [-Werror=nested-externs]

I fixed that by the following #ifdef-ing:
...
        d_cfg.max_grant_frames = -1;
...

        if ( dt_property_read_u32(node, "capabilities", &amp;val) )
        {
...

#ifdef CONFIG_GRANT_TABLE
                d_cfg.max_grant_frames = gnttab_dom0_frames();
#endif
                d_cfg.max_evtchn_port = -1;
                flags |= CDF_hardware;
                iommu = true;
            }

Do you agree with such fix?

If the CONFIG_GRANT_TABLE=n then the init value (d_cfg.max_grant_frames = -1;) will be used.

~ Oleksii
</pre>
  </body>
</html>

--------------oy0RkXrUhnNWVpH2vi0dh6Sn--

