Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CFBAD1B94
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 12:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010211.1388373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOZkp-0001xh-AI; Mon, 09 Jun 2025 10:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010211.1388373; Mon, 09 Jun 2025 10:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOZkp-0001vI-7K; Mon, 09 Jun 2025 10:29:23 +0000
Received: by outflank-mailman (input) for mailman id 1010211;
 Mon, 09 Jun 2025 10:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vAqw=YY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOZko-0001vC-GZ
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 10:29:22 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ae47d41-451c-11f0-a304-13f23c93f187;
 Mon, 09 Jun 2025 12:29:21 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-adb2bb25105so655041966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jun 2025 03:29:21 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade38c11d28sm408418266b.12.2025.06.09.03.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 03:29:19 -0700 (PDT)
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
X-Inumbo-ID: 9ae47d41-451c-11f0-a304-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749464960; x=1750069760; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yj1IhCqqgHEjXOxBKFgKywQRgT0OBUStm3j3rXnSfO4=;
        b=J4Pqp/5hz9SHdusFNS/sFg5M/OXU4agGSHgdxwsWTOkeH5wAItkeThKlVzg5Y/ImIO
         hrfC/NSQmr1m1AY5CDtINag9V06Io2ntqIFVGlUcGRYTAYGS5cCmHfiJZRJ2b00G42ir
         gaXaefQsOYhNMXvffn7UPzTSUZiGfFuQymkat5f6TpMmVlFXHoMfAm2o9u1QcSsLZok/
         eyOug9g4UOqHE6/14i+GRyzRS4LyFOuz5DzmmV5vhHdbKnJpJvvPgM3RvJtuGO5OJFQJ
         21GIabqIQw9BtfRytMioY2BRMZd/PMZMUpoVARhti7EjAEFz2pmQZZCLVM86gLrBC8tt
         L3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464960; x=1750069760;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yj1IhCqqgHEjXOxBKFgKywQRgT0OBUStm3j3rXnSfO4=;
        b=TePos/6WsII72V7wqf1ra2VQIDleOz5TsaNwAyVsaNJDtNLnTIE+t1Xq8BfIcPRond
         ml9gh/yTSwYIPoZdn+kR+w6E+30+xETH/javJRb012GLvMkMhnmVE/0CXRC7gmEtJ/1M
         X5z4YWuHpznaeAqAPKHupKKNN446q0nsRP7BEtwYR4lIhjLmdfGlOljXezces7/vNlHD
         3Iar9qSu76mQNCXiILtDvngk9et4uaWmY3SHcOOI8ekXP/L1wUd4W0AIz1e7kS7lpZOH
         DOZgJl+bVEuYpBJh6hdI+UBvsEGs3vVuI0D1fFxqRMxw99nXGqOHrixNv0h73iJjRS0q
         9ZQA==
X-Gm-Message-State: AOJu0YwcVWvi8nWkkdMcCdJ/VHp8dL0QGHO1Lj38dZF47sSOxxRPF3v9
	nEKP2qtCdOiIBMx0eHAR4Tz3jM1yAYUgvOyOynMnoD8HiywKbNvs0FA1
X-Gm-Gg: ASbGncsH0XGY7hNAqiLB7cNeuS7L/CCA6ffhql9L0Gr18o/hLTdTUjxHLCFJ7HVni7T
	0LluWLhhNa5RNEQnWk7gjYi0dswEx/MP6okESQHoAqttWL1TUoG7+v+++bP2aQmd6HmQLsM1jyX
	ia8KM/uMEwGfolm2c4K6EvA/h2HaqeaVl+XYwVQCs6DwVeA0aJPUx7xhV1+kz6R1HPr98b96J58
	QmwM3q7bUIrHznQ5V3X3Lw0EjUvYPRyiR6iSVG/8U3oL55lv2ksgKx/GUq28Pr5Qc9BI8MJBTwk
	12p5xfo7pK0Mx2OHUUCmX9J2ChFrYs419ahMbUYy0xqCtjAbTPOonh5YZZXmFlhJwS+XSdkKm55
	xot4wfp+RrJhHd8oOez6ELacA
X-Google-Smtp-Source: AGHT+IGCQgw8gOACUHnUWwSZ1ZvlkkS7cCnyzq4l37WkcX6IgzcqFQuwlAudh1YMLXvPy5KH/8yyKw==
X-Received: by 2002:a17:907:3f0a:b0:ad5:a29c:efed with SMTP id a640c23a62f3a-ade1aab9c7emr1242410166b.33.1749464960073;
        Mon, 09 Jun 2025 03:29:20 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------m5fI4O5tmeltvp3INcdWr9He"
Message-ID: <dd201319-9f76-4ff4-b470-f3a2099af895@gmail.com>
Date: Mon, 9 Jun 2025 12:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
References: <20250605161659.18201-1-roger.pau@citrix.com>
 <aELwGScJ_XME26Sq@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aELwGScJ_XME26Sq@macbook.local>

This is a multi-part message in MIME format.
--------------m5fI4O5tmeltvp3INcdWr9He
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/6/25 3:41 PM, Roger Pau Monné wrote:
> On Thu, Jun 05, 2025 at 06:16:59PM +0200, Roger Pau Monne wrote:
>> The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
>> have the functionality of a traditional PCI device.  The exposed MMIO BAR
>> is used by some guests (including Linux) as a safe place to map foreign
>> memory, including the grant table itself.
>>
>> Traditionally BARs from devices have the uncacheable (UC) cache attribute
>> from the MTRR, to ensure correct functionality of such devices.  hvmloader
>> mimics this behavior and sets the MTRR attributes of both the low and high
>> PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.
>>
>> This however causes performance issues for users of the Xen PCI device BAR,
>> as for the purposes of mapping remote memory there's no need to use the UC
>> attribute.  On Intel systems this is worked around by using iPAT, that
>> allows the hypervisor to force the effective cache attribute of a p2m entry
>> regardless of the guest PAT value.  AMD however doesn't have an equivalent
>> of iPAT, and guest PAT values are always considered.
>>
>> Linux commit:
>>
>> 41925b105e34 xen: replace xen_remap() with memremap()
>>
>> Attempted to mitigate this by forcing mappings of the grant-table to use
>> the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
>> into account to calculate which PAT type to use, and seeing the MTRR cache
>> attribute for the region being UC the PAT also ends up as UC, regardless of
>> the caller having requested WB.
>>
>> As a workaround to allow current Linux to map the grant-table as WB using
>> memremap() introduce an xl.cfg option (xenpci_bar_uc=0) that can be used to
>> select whether the Xen PCI device BAR will have the UC attribute in MTRR.
>> Such workaround in hvmloader should also be paired with a fix for Linux so
>> it attempts to change the MTRR of the Xen PCI device BAR to WB by itself.
>>
>> Overall, the long term solution would be to provide the guest with a safe
>> range in the guest physical address space where mappings to foreign pages
>> can be created.
>>
>> Some vif throughput performance figures provided by Anthoine from a 8
>> vCPUs, 4GB of RAM HVM guest(s) running on AMD hardware:
>>
>> Without this patch:
>> vm -> dom0: 1.1Gb/s
>> vm -> vm:   5.0Gb/s
>>
>> With the patch:
>> vm -> dom0: 4.5Gb/s
>> vm -> vm:   7.0Gb/s
>>
>> Reported-by: Anthoine Bourgeois<anthoine.bourgeois@vates.tech>
>> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
>> ---
>> Changes since v2:
>>   - Add default value in xl.cfg.
>>   - List xenstore path in the pandoc file.
>>   - Adjust comment in hvmloader.
>>   - Fix commit message MIO -> MMIO.
>>
>> Changes since v1:
>>   - Leave the xenpci BAR as UC by default.
>>   - Introduce an option to not set it as UC.
>> ---
>>   docs/man/xl.cfg.5.pod.in                |  8 ++++
>>   docs/misc/xenstore-paths.pandoc         |  5 +++
>>   tools/firmware/hvmloader/config.h       |  2 +-
>>   tools/firmware/hvmloader/pci.c          | 49 ++++++++++++++++++++++++-
>>   tools/firmware/hvmloader/util.c         |  2 +-
>>   tools/include/libxl.h                   |  9 +++++
>>   tools/libs/light/libxl_create.c         |  1 +
>>   tools/libs/light/libxl_dom.c            |  9 +++++
>>   tools/libs/light/libxl_types.idl        |  1 +
>>   tools/xl/xl_parse.c                     |  2 +
>>   xen/include/public/hvm/hvm_xs_strings.h |  2 +
>>   11 files changed, 86 insertions(+), 4 deletions(-)
> I've noticed this is missing a changelog entry, I propose the
> following:
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1ee2f42e7405..23215a8cc1e6 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -15,6 +15,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - On x86:
>      - Restrict the cache flushing done as a result of guest physical memory map
>        manipulations and memory type changes.
> +   - Allow controlling the MTRR cache attribute of the Xen PCI device BAR
> +     for HVM guests, to improve performance of guests using it to map the grant
> +     table or foreign memory.
>   
>   ### Added
>    - On x86:
>
> I can fold into the patch if Oleksii and others agree.

It would be nice: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------m5fI4O5tmeltvp3INcdWr9He
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
    <div class="moz-cite-prefix">On 6/6/25 3:41 PM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aELwGScJ_XME26Sq@macbook.local">
      <pre wrap="" class="moz-quote-pre">On Thu, Jun 05, 2025 at 06:16:59PM +0200, Roger Pau Monne wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
have the functionality of a traditional PCI device.  The exposed MMIO BAR
is used by some guests (including Linux) as a safe place to map foreign
memory, including the grant table itself.

Traditionally BARs from devices have the uncacheable (UC) cache attribute
from the MTRR, to ensure correct functionality of such devices.  hvmloader
mimics this behavior and sets the MTRR attributes of both the low and high
PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.

This however causes performance issues for users of the Xen PCI device BAR,
as for the purposes of mapping remote memory there's no need to use the UC
attribute.  On Intel systems this is worked around by using iPAT, that
allows the hypervisor to force the effective cache attribute of a p2m entry
regardless of the guest PAT value.  AMD however doesn't have an equivalent
of iPAT, and guest PAT values are always considered.

Linux commit:

41925b105e34 xen: replace xen_remap() with memremap()

Attempted to mitigate this by forcing mappings of the grant-table to use
the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
into account to calculate which PAT type to use, and seeing the MTRR cache
attribute for the region being UC the PAT also ends up as UC, regardless of
the caller having requested WB.

As a workaround to allow current Linux to map the grant-table as WB using
memremap() introduce an xl.cfg option (xenpci_bar_uc=0) that can be used to
select whether the Xen PCI device BAR will have the UC attribute in MTRR.
Such workaround in hvmloader should also be paired with a fix for Linux so
it attempts to change the MTRR of the Xen PCI device BAR to WB by itself.

Overall, the long term solution would be to provide the guest with a safe
range in the guest physical address space where mappings to foreign pages
can be created.

Some vif throughput performance figures provided by Anthoine from a 8
vCPUs, 4GB of RAM HVM guest(s) running on AMD hardware:

Without this patch:
vm -&gt; dom0: 1.1Gb/s
vm -&gt; vm:   5.0Gb/s

With the patch:
vm -&gt; dom0: 4.5Gb/s
vm -&gt; vm:   7.0Gb/s

Reported-by: Anthoine Bourgeois <a class="moz-txt-link-rfc2396E" href="mailto:anthoine.bourgeois@vates.tech">&lt;anthoine.bourgeois@vates.tech&gt;</a>
Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
---
Changes since v2:
 - Add default value in xl.cfg.
 - List xenstore path in the pandoc file.
 - Adjust comment in hvmloader.
 - Fix commit message MIO -&gt; MMIO.

Changes since v1:
 - Leave the xenpci BAR as UC by default.
 - Introduce an option to not set it as UC.
---
 docs/man/xl.cfg.5.pod.in                |  8 ++++
 docs/misc/xenstore-paths.pandoc         |  5 +++
 tools/firmware/hvmloader/config.h       |  2 +-
 tools/firmware/hvmloader/pci.c          | 49 ++++++++++++++++++++++++-
 tools/firmware/hvmloader/util.c         |  2 +-
 tools/include/libxl.h                   |  9 +++++
 tools/libs/light/libxl_create.c         |  1 +
 tools/libs/light/libxl_dom.c            |  9 +++++
 tools/libs/light/libxl_types.idl        |  1 +
 tools/xl/xl_parse.c                     |  2 +
 xen/include/public/hvm/hvm_xs_strings.h |  2 +
 11 files changed, 86 insertions(+), 4 deletions(-)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I've noticed this is missing a changelog entry, I propose the
following:

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1ee2f42e7405..23215a8cc1e6 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -15,6 +15,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
      manipulations and memory type changes.
+   - Allow controlling the MTRR cache attribute of the Xen PCI device BAR
+     for HVM guests, to improve performance of guests using it to map the grant
+     table or foreign memory.
 
 ### Added
  - On x86:

I can fold into the patch if Oleksii and others agree.</pre>
    </blockquote>
    <pre>It would be nice: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------m5fI4O5tmeltvp3INcdWr9He--

