Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B337B40E08
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 21:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107321.1457789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utWvz-0005DX-HF; Tue, 02 Sep 2025 19:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107321.1457789; Tue, 02 Sep 2025 19:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utWvz-0005Aq-Eb; Tue, 02 Sep 2025 19:44:51 +0000
Received: by outflank-mailman (input) for mailman id 1107321;
 Tue, 02 Sep 2025 19:44:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cuX2=3N=onlineschubla.de=paul@srs-se1.protection.inumbo.net>)
 id 1utWvy-0005Ad-Ou
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 19:44:50 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47fc9721-8835-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 21:44:49 +0200 (CEST)
Received: from mail.onlineschubla.de by smtp.strato.de (RZmta 52.1.2 AUTH)
 with ESMTPSA id e4daa2182JiXhVP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 Sep 2025 21:44:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.onlineschubla.de (Postfix) with ESMTP id CC72021579;
 Tue,  2 Sep 2025 21:44:32 +0200 (CEST)
Received: from mail.onlineschubla.de ([127.0.0.1])
 by localhost (mail.onlineschubla.de [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 9Hax-33er-4N; Tue,  2 Sep 2025 21:44:31 +0200 (CEST)
Received: from [10.0.0.105] (unknown [10.0.0.105])
 by mail.onlineschubla.de (Postfix) with ESMTPA id 6E50C201BF;
 Tue,  2 Sep 2025 21:44:31 +0200 (CEST)
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
X-Inumbo-ID: 47fc9721-8835-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; t=1756842273; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bVvT49nGbsgpSlIUVos0SmdzFFejtMHZs3aXPs+U+M33+xecsrFscnbBgfsE15fc+n
    e+VO0e/qA/J0xsG1va678JMCVMwZS5cfo46+jy9DtSI48Gx6zIKoT+zpcjVrwalYlcWU
    RHe+ybaMVC93gqrUg7sh8i8lcqRsk3E/Ho4WHc+4ZdGVWIBOFI9rJm5/ZEoVV39O1B7A
    ac0UGHv/m8YzDDV5DcsJEyygbNYJE2bq7A24XgPx7i0eTCQ7mEUtPcVXcK/bC6Pg5Vuk
    1WTr7lv4QZ3qBcv/4xktc5d/+3loCajo09Xw7ZBVuH/CQRMmviUQqqr+zpEkyBfWgND5
    CxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1756842273;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=GbpgQVIjjGUXL3PXvixxP4aig2ii2mgDcC5RxM3z/Io=;
    b=h78IRfWthvTv5iPFtWBn11lzk/QE0UaRL/mqhqoeOQULKKil7mmwhrX1kVLA6MgUI0
    Z6bE7B4nBb0qJU7aRKk6kOOioy943bKfHx9+ibusxKaSG3fQokjWtSngsUK3UuqxyYz/
    BrdMelPGoQH4/0bYk3WkGYGYHbX3ZwjoS9rppAqQu5NJgjgq2M+qsOJ1xnOgcaRUP5uj
    takzfNlVkvXUYJxuWphU4j+yDTu3wfQxBRERNxqLzqLDe2r3wgQvwIgZB3k/qjS9wjcF
    H/PpFtw9ZWBbkB+HmBj60ZbJueT3w3zxmgTlGftJAabJkow2SJWd6DgKOYe55sQ2DS2X
    ApZA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1756842273;
    s=strato-dkim-0002; d=onlineschubla.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=GbpgQVIjjGUXL3PXvixxP4aig2ii2mgDcC5RxM3z/Io=;
    b=a99IERNCjEOYKZLO6id8nMqUYnXoCLKg6e+SM+D1INvZutvJ0jl7KsaT6e3KXu3eJ4
    4Gz9HusO46uB8aUFEtYMDtCqxpWyStX+WhYvCset5DsU+J58Dq2+cQGcH6+U2akRB06o
    yJ/XLZhWVmNXowvUPiqg0vhJeCzf7ita2x9/jPuFI5HT8nAgOq2UlCG6ZPsqr+3R1Ce1
    /NzUmhqIRNf2YsmYqHEsDX50gCDoMroI1ma94HL5YOcLwf0rWfZKt+5lFwgkjTdQl54n
    +O4xT8nOCY0wsVOSBBkffHhiz24aHn1Z714Pdl+P6aDtf0aTTITjjyNPkk1t7/BF6mDB
    u9tQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1756842273;
    s=strato-dkim-0003; d=onlineschubla.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=GbpgQVIjjGUXL3PXvixxP4aig2ii2mgDcC5RxM3z/Io=;
    b=NTuMIkGmU1oOGsQcgG0BrZVIE3GUsaQX4b3S4R0446ISA2f3ZMCPx8izbiX2h5Xu88
    WdKP1u40ZE1unPAu83Cw==
X-RZG-AUTH: ":PG0ReWCndfO3rCSML4AvNaDxJ7WJyilEI/NMX3IPpS4dskMFCImCETb1V6b0vc0G82XEylMud93Y+DuZ3uJ2CpXvFoK3ctvQEzg="
X-Virus-Scanned: Debian amavis at onlineschubla.de
Message-ID: <291070b9-c79d-47ed-b971-cb935a1724c0@onlineschubla.de>
Date: Tue, 2 Sep 2025 21:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
To: Julien Grall <julien@xen.org>, Elliott Mitchell <ehem+xen@m5p.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
 xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
 <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
 <6e9b5265-7a3b-4fd5-b14e-0e60a8b49833@gmail.com>
 <a3092ae1-d836-4403-8fb5-30593fcd2fb8@suse.com>
 <aKjOaT-P74Yh4-bi@mattapan.m5p.com>
 <2f11b8ea-a386-4c2a-afe6-c7e57d1d7f75@xen.org>
Content-Language: en-US
From: Paul Leiber <paul@onlineschubla.de>
In-Reply-To: <2f11b8ea-a386-4c2a-afe6-c7e57d1d7f75@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 23.08.2025 um 09:59 schrieb Julien Grall:

> Out of interest, sorry if this was already mentioned before, is there 
> any reason ACPI is used on the Raspberry PI over Device-Tree? Is there 
> any issue with the latter on Xen?

Perhaps I can chime in here and point out why I have been using ACPI on 
Raspberry Pi (RPi) with Xen. This is my personal experience as a user, 
and I don't really know much about Device Trees, so I can't make a 
technical analysis of ACPI vs. DT.

Debian is currently the only linux distribution I am using. Therefore, I 
am used to setting up Xen by installing Debian and then installing the 
packages from Debian. When installing these packages, I end up with a 
ready-to-use Xen/Dom0 setup and Grub as the bootloader. When I install 
kernel updates, grub automatically is updated to use the correct 
Xen/kernel combination as a default. This is very convenient.

My first tries with a RPi were with RPi OS. However, RPi OS doesn't 
provide Xen packages. Next, the official explanations on [1] seemed 
rather complicated to me. Coming from Debian, I didn't know anything 
about U-Boot. As I didn't want to mess with U-boot, I installed vanilla 
Debian (following [2]), which provided me with the familiar 
ACPI/Grub/Debian environment. With Julien's help, I managed to compile 
Xen (with ACPI switched on) on the RPi, got it running, and have been 
using it since then with an occasional recompile of Xen. (There are 
still some networking related issues I experience in certain setups, but 
that's a different story.)

So, to sum it up, the combination of ACPI/Grub/Debian and a 
self-compiled Xen package provided a solution that comes close to the 
experience I have on my other Xen systems. Apart from some deviation 
when installing vanilla Debian and the need to compile Xen myself (due 
to the experimental status of ACPI, of course), I can basically use and 
manage the RPi system like any x86 system. That's why I am using it this 
way.

 From my point of view, the biggest drawback of the ACPI solution is 
that I can't use I2C because I2C is not supported when using UEFI boot 
on a RPi. [3]

Nowadays, there are semi-official packages for RPi provided by Debian, 
but as they use a different boot mechanism, they break my workflow, 
that's why I haven't been using them.

Best regards,

Paul


[1] https://xenproject.org/blog/xen-on-raspberry-pi-4-adventures/
[2] https://forums.raspberrypi.com/viewtopic.php?t=282839
[3] https://github.com/pftf/RPi4/issues/130


