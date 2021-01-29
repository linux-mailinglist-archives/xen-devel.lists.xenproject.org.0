Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9A30847E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 05:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77697.140891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5L95-0005i6-Cn; Fri, 29 Jan 2021 04:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77697.140891; Fri, 29 Jan 2021 04:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5L95-0005hj-9H; Fri, 29 Jan 2021 04:12:31 +0000
Received: by outflank-mailman (input) for mailman id 77697;
 Fri, 29 Jan 2021 04:12:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CfXQ=HA=gmail.com=jlpoole56@srs-us1.protection.inumbo.net>)
 id 1l5L93-0005hc-M7
 for xen-devel@lists.xen.org; Fri, 29 Jan 2021 04:12:29 +0000
Received: from mail-pl1-x62c.google.com (unknown [2607:f8b0:4864:20::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a7a44a6-c483-45da-aee4-1e47b5038210;
 Fri, 29 Jan 2021 04:12:28 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id b17so4551885plz.6
 for <xen-devel@lists.xen.org>; Thu, 28 Jan 2021 20:12:28 -0800 (PST)
Received: from [192.168.1.2] (75-164-166-38.ptld.qwest.net. [75.164.166.38])
 by smtp.googlemail.com with ESMTPSA id b17sm6876227pfo.151.2021.01.28.20.12.26
 for <xen-devel@lists.xen.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 20:12:26 -0800 (PST)
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
X-Inumbo-ID: 2a7a44a6-c483-45da-aee4-1e47b5038210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=k49HqiK/igngsk3HCsvQ+LGIboeDo80MI6abtqN5nE4=;
        b=KcopK7fhF8JFKyRyk8fn7zWl+//B5Jh2KUNTVkV+GAFFpDM7VQkJAXg2wZo4jeyYbT
         4oFVUAbZeQh8KY/RvR02vByRKM4AsxGB/Qd9UgXb2aE78vcxGVz8gff8k+FZWgkiEnqF
         7ftuWNf24TTahjakuwUi6bgLkfgWPr8EF3BwABZzYMeeFqpUTjmAucDYU5UI2hhz7tgV
         +d15u95dkuwwVO7AVbq1XPCwCdWy4QnuMQWIg4kEXwYBqlg5cHh1RlT5dAPBQPMvey18
         WIWrhwJf+YGpHy7f2NyItyDYN/+CbToVzhDwXIkbIva/x6MUhLJJQi70xJlqJpMcqrMg
         sgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:from:subject:to:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=k49HqiK/igngsk3HCsvQ+LGIboeDo80MI6abtqN5nE4=;
        b=jr2mfPtQr5jV8HbeuFlN22FfGrMPGR+ppChwJ1+N6vW/Q/RMTn2KV9v884ZtrLBaK9
         YwcAGpcNI5ooVOKDVFTrnHuoRdX7ZTYmLnUzvSNDnusdFHucFXoNJu27hhiaFScJhUSU
         FEokvNVFhZtaSy2cHr85PzwEOTGI4scq6n/SCgdv4GNCUj2sxaUeSX5C4lO2Vmj/5Zb7
         w0uBpiufEFaQjyM7AU/8mKa4cNNfe4KkvEjWhC5z+Wx+jrHVkzxHUZ5ynhgpq01Va7DX
         mfTZGhl0o0XqOVYoDCHfQodrbuk0Mfgv3pBw/W/ZbAU6kSyRrqaUid4GCJg0SsC6KURf
         k9zg==
X-Gm-Message-State: AOAM532JIMBS5P9d38y0SVsPkXUErl0usg0qUGeCjjb7aVJ2gBz7/WdF
	IcihNAVdiNVqNAEtYKmg0zKHmOgGzZc=
X-Google-Smtp-Source: ABdhPJwDVhRVz/PmJj3rWrmKklCFVzSh72SG9zRYXAIOQdIKSHB9b5V/CQe+3bbe5pCzUzib1ZpXIA==
X-Received: by 2002:a17:903:31d1:b029:de:8361:739b with SMTP id v17-20020a17090331d1b02900de8361739bmr2605812ple.85.1611893547415;
        Thu, 28 Jan 2021 20:12:27 -0800 (PST)
Reply-To: jlpoole56@gmail.com
From: "John L. Poole" <jlpoole56@gmail.com>
Subject: Is initramfs' /dev supposed to show exposed targets at Guest Boot
 Time?
To: xen-devel@lists.xen.org
Message-ID: <1b60bde3-3f11-baee-d2b1-e33e05ffe0b1@gmail.com>
Date: Thu, 28 Jan 2021 20:11:48 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Greetings,

I try to run Xen on low energy platforms.  I've previously been here 
about an Intal Atom which died
just after the 3 year warranty expired.  So I'm trying AMD's laptop 
Ryzen.  I think I've been using Xen
for 8 years.

I have Debian (Linux snuc 4.19.0-13-amd64 #1 SMP Debian 4.19.160-2 
(2020-11-28) x86_64 GNU/Linux)
running on a new SimplyNuC:  Aspen PN50 R7 4800U with a AMD Ryzen™ 4000 
Renoir mobile processor.

(I tried to run Xen from the factory installed Ubuntu and ran into the 
same problem below, so I
thought I ought to use Debian in case Ubuntu had a shortcoming re: lvm)

I created volumes with lvm, i.e. /dev/vg0/aresboot, /dev/vg0/aresswap, 
/dev/vg0/aresserver
which are to be exposed to the Gentoo environment as sda1, sda2, and 
sda3.  My Gentoo
/etc/fstab accordingly has sda1,2, & 3 specified.  My problem occurs, I 
think, before my Gentoo
kernel even has a chance to perform its initialization.

I am trying to create a Gentoo VM and successfully built a kernel and 
initramfs in a chrooted
environment within /dev/vg0/aresserver.  I've successfully done this 
before on
other platforms; however, my attempt now is on this tiny, but powerful 
and efficient, SimplyNUC.

And, I think this may be my first time using LVM partitions exclusively 
rather than standard fsdisk partitions.

When I try to "xl create ares.conf -c", the Gentoo kernel is unable to 
see the labeled "sda3"
[target is Debian's /dev/vg0/aresserver].

I'm not new Xen and have not had this kind of problem before, but I also 
don't think I staged
my guests completely on lvm partitions.  I'm thinking there is a problem 
between the
Xen Kernel code and Gentoo's kernel and I think the problem may be on 
the Gentoo side.

The version of lvm on Debian is: 2.03.02(2)
The version of lvm [lvm2] on Gentoo is: 2.02.187-r2

(Would a lvm 2.02 be unable to read a 2.03??)

My question now is: when my Gentoo initramfs can't find the partition 
and I enter its shell, should I
be seeing the exposed partition, e.g. "sda3", under /dev?  I think so.

None of the names I specify, e.g. "sda3", appear under the /dev listing 
(see pastebin below).

A sample configuration for the disk (just 1 target used to debug this 
problem) is:

disk = ['format=raw, vdev=sda3, access=rw, 
target=/dev/mapper/vg0-aresserver']

I have tried specifying root as "sda3" -- the name that the target 
should appear as in the guest
environment as well as the full path from the Dom0 environment (above).

I'm guessing my problem is an initramfs and/or kernel issue in Gentoo: 
being unable to
read an lvm partition.  Note, when I compiled, I used genkernel as follows:

      genkernel --menuconfig --lvm --mdadm all

and my xen configuration has:

      root=/dev/vg0/aresserver dolvm  domdadm

(root=/dev/sda3 and root=sda3 do not work either)

Before I approach Gentoo developers, I wanted to learn from the Xen 
gurus that my assumption that the
initramfs /dev listing is the correct assay to determine if initramfs 
and/or the kernel are
able to see the Debian lvm partitions.

Here is a pastebin of my create session and listing of /dev from within 
initramfs shell: https://pastebin.com/juybx5gU

So, should I be seeing "sda3" when I list /dev?

Thank you.
-- 
Email Rider

John Laurence Poole



