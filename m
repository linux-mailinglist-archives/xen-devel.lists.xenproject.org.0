Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2BF10DBEF
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 01:21:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaqSh-0006yH-NM; Sat, 30 Nov 2019 00:18:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDlk=ZW=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1iaqSg-0006yB-WA
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 00:18:11 +0000
X-Inumbo-ID: e4234c7e-1306-11ea-a55d-bc764e2007e4
Received: from mail-yw1-xc41.google.com (unknown [2607:f8b0:4864:20::c41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4234c7e-1306-11ea-a55d-bc764e2007e4;
 Sat, 30 Nov 2019 00:18:10 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id j137so11562462ywa.12
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2019 16:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=qvwRv3PVcm3KJfHR8T5RldL/lNYY7ayfSo89FxgWEc8=;
 b=LNMhdQHHEE1Tp0vcS7qBkTehzGlDj9+pv6NlK9/FFaLfiCEal+YP4BtnswU6atIA/2
 XXuLwQr7vwpNaR/QyA6uzCQM+VIldRvj1wA9dwBezVhes7OxAnGdQRmzST+1jua+fBCA
 J4FCS3cENl4tDzDaxYUHDVZOAQI0OwPuIRaEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=qvwRv3PVcm3KJfHR8T5RldL/lNYY7ayfSo89FxgWEc8=;
 b=ZQm9S9JE7yVfnM8TtRsUJv1pc1AkdJoVipVi617kbY34vhE6TZm+jZCmvQRhAoUAm1
 h6OpbFOvB4YpkG6kBPjEG3Ni8Pwaqb63hMJSwV/OWg0Flf4eFBqcxJQ8e7NzZCCN9Ss/
 em6wSXoviuM1iJszyEbzmHHdjlc8aG6xudK2pZSNKQnA6aZHHDOr/hcPHGrR8T23oHuE
 gVsgXUtHqo5rJbVT4Jej/npy9IJi24FMsNncpcczTlrVxPzVctm+j1KjxtmnvHd7iU0J
 28Z65oENeo3QFZa34M58cIUCbl5owL37flp+sJvX8HCcPCs7Axpzxysj833lubmb39nM
 w/tA==
X-Gm-Message-State: APjAAAW0nIBc9wZj29tnAPtVTqnamEi77i/SYrlnFtf2oHJoG/XaI8/V
 nVKfHJgVjIno61jzr8F54dTMzg==
X-Google-Smtp-Source: APXvYqwLdhyI8bc/6TLwZURtgRPbAnaqjzmlYUUrEmFNHXjOyvIHN0ILZ9cEl1qL3IkQDPcw5G6FvQ==
X-Received: by 2002:a81:924d:: with SMTP id j74mr13934730ywg.381.1575073090338; 
 Fri, 29 Nov 2019 16:18:10 -0800 (PST)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:7066:715b:bb7b:d058])
 by smtp.gmail.com with ESMTPSA id 2sm10599187ywj.72.2019.11.29.16.18.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 16:18:09 -0800 (PST)
To: Julian Tuminaro <julian.tuminaro@gmail.com>, xen-devel@lists.xenproject.org
References: <20191114045543.6759-1-julian.tuminaro@gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <dc3b14a8-e5eb-25c2-f81f-931aa22b79ba@cardoe.com>
Date: Fri, 29 Nov 2019 18:18:07 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191114045543.6759-1-julian.tuminaro@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2] kdd.c: Add support for initial handshake
 in KD protocol for Win 7, 8 and 10 (64 bit)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jenish Rakholiya <rjenish@cmu.edu>,
 Tim Deegan <tim@xen.org>, Julian Tuminaro <jtuminar@andrew.cmu.edu>
Content-Type: multipart/mixed; boundary="===============5083763932435462360=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--===============5083763932435462360==
Content-Type: multipart/alternative;
 boundary="------------F6543A27A84659E243BA18AF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F6543A27A84659E243BA18AF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/19 10:55 PM, Julian Tuminaro wrote:

> From: Julian Tuminaro and Jenish Rakholiya <julian.tuminaro@gmail.com and rakholiyajenish.07@gmail.com>
>
> Current implementation of find_os is based on the hard-coded values for
> different Windows version. It uses the value for get the address to
> start looking for DOS header in the given specified range. However, this
> is not scalable to all version of Windows as it will require us to keep
> adding new entries and also due to KASLR, chances of not hitting the PE
> header is significant. We implement a way for 64-bit systems to use IDT
> entry to get a valid exception/interrupt handler and then move back into
> the memory to find the valid DOS header. Since IDT entries are protected
> by PatchGuard, we think our assumption that IDT entries will not be
> corrupted is valid for our purpose. Once we have the image base, we
> search for the DBGKD_GET_VERSION64 structure type in .data section to
> get information required for handshake.
>
> Currently, this is a work in progress feature and current patch only
> supports the handshake and memory read/write on 64-bit systems.
>
> NOTE: This is the Updated version of the previous patch submitted
> NOTE: This has currently been only tested when debugging was not enabled
> on the guest Windows.
>
> Signed-off-by: Jenish Rakholiya <rjenish@cmu.edu>
> Signed-off-by: Julian Tuminaro <jtuminar@andrew.cmu.edu>
> ---

This commit has broken the build of the staging tree. For a full log 
see: https://gitlab.com/xen-project/xen/-/jobs/365398313#L5184 But the 
relevant bit is likely:

||

|gcc -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall 
-Wstrict-prototypes -Wdeclaration-after-statement 
-Wno-unused-but-set-variable -Wno-unused-local-typedefs -O2 
-fomit-frame-pointer 
-D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF 
.kdd-xen.o.d -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -mno-tls-direct-seg-refs -Werror 
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/libxc/include 
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/libs/toollog/include 
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/include 
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/libs/foreignmemory/include 
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/include 
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/libs/devicemodel/include 
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/include 
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/include 
-D__XEN_TOOLS__ -DXC_WANT_COMPAT_MAP_FOREIGN_API -c -o kdd-xen.o kdd-xen.c |
|
In file included from kdd.c:53:0:
kdd.c: In function 'get_os_info_64':
kdd.c:616:35: error: cast to pointer from integer of different size 
[-Werror=int-to-pointer-cast]
  KDD_LOG(s, "idt0 addr: %p\n", (void *)idt0_addr);
|


--------------F6543A27A84659E243BA18AF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>On 11/13/19 10:55 PM, Julian Tuminaro wrote:<br>
    </p>
    <blockquote type="cite"
      cite="mid:20191114045543.6759-1-julian.tuminaro@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Julian Tuminaro and Jenish Rakholiya <a class="moz-txt-link-rfc2396E" href="mailto:julian.tuminaro@gmail.comandrakholiyajenish.07@gmail.com">&lt;julian.tuminaro@gmail.com and rakholiyajenish.07@gmail.com&gt;</a>

Current implementation of find_os is based on the hard-coded values for
different Windows version. It uses the value for get the address to
start looking for DOS header in the given specified range. However, this
is not scalable to all version of Windows as it will require us to keep
adding new entries and also due to KASLR, chances of not hitting the PE
header is significant. We implement a way for 64-bit systems to use IDT
entry to get a valid exception/interrupt handler and then move back into
the memory to find the valid DOS header. Since IDT entries are protected
by PatchGuard, we think our assumption that IDT entries will not be
corrupted is valid for our purpose. Once we have the image base, we
search for the DBGKD_GET_VERSION64 structure type in .data section to
get information required for handshake.

Currently, this is a work in progress feature and current patch only
supports the handshake and memory read/write on 64-bit systems.

NOTE: This is the Updated version of the previous patch submitted
NOTE: This has currently been only tested when debugging was not enabled
on the guest Windows.

Signed-off-by: Jenish Rakholiya <a class="moz-txt-link-rfc2396E" href="mailto:rjenish@cmu.edu">&lt;rjenish@cmu.edu&gt;</a>
Signed-off-by: Julian Tuminaro <a class="moz-txt-link-rfc2396E" href="mailto:jtuminar@andrew.cmu.edu">&lt;jtuminar@andrew.cmu.edu&gt;</a>
---
</pre>
    </blockquote>
    <p>This commit has broken the build of the staging tree. For a full
      log see: <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/jobs/365398313#L5184">https://gitlab.com/xen-project/xen/-/jobs/365398313#L5184</a>
      But the relevant bit is likely:</p>
    <p><code class="job-log d-block">
        <div class="js-line log-line"> <span class="ws-pre-wrap">gcc
            -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99
            -Wall -Wstrict-prototypes -Wdeclaration-after-statement
            -Wno-unused-but-set-variable -Wno-unused-local-typedefs -O2
            -fomit-frame-pointer
            -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
            -MMD -MF .kdd-xen.o.d -D_FILE_OFFSET_BITS=64
            -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
            -mno-tls-direct-seg-refs -Werror
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/libxc/include
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/libs/toollog/include
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/include
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/libs/foreignmemory/include
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/include
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/libs/devicemodel/include
-I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/include
            -I/builds/xen-project/xen/tools/debugger/kdd/../../../tools/include
            -D__XEN_TOOLS__ -DXC_WANT_COMPAT_MAP_FOREIGN_API -c -o
            kdd-xen.o kdd-xen.c </span></div>
        <div class="js-line log-line"><span class="ws-pre-wrap">In file
            included from kdd.c:53:0:</span></div>
        <div class="js-line log-line"><span class="ws-pre-wrap">kdd.c:
            In function 'get_os_info_64':</span></div>
        <div class="js-line log-line"><span class="ws-pre-wrap">kdd.c:616:35:
            error: cast to pointer from integer of different size
            [-Werror=int-to-pointer-cast]</span></div>
        <div class="js-line log-line"><span class="ws-pre-wrap"> KDD_LOG(s,
            "idt0 addr: %p\n", (void *)idt0_addr);</span></div>
      </code></p>
  </body>
</html>

--------------F6543A27A84659E243BA18AF--


--===============5083763932435462360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5083763932435462360==--

