Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF6228A709
	for <lists+xen-devel@lfdr.de>; Sun, 11 Oct 2020 12:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5652.14663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRYlv-0002zl-T1; Sun, 11 Oct 2020 10:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5652.14663; Sun, 11 Oct 2020 10:40:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRYlv-0002zM-PX; Sun, 11 Oct 2020 10:40:11 +0000
Received: by outflank-mailman (input) for mailman id 5652;
 Sun, 11 Oct 2020 10:40:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCit=DS=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kRYlu-0002zH-Ci
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 10:40:10 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 423286cd-ae2d-47e7-967d-02826e164a25;
 Sun, 11 Oct 2020 10:40:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CCit=DS=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kRYlu-0002zH-Ci
	for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 10:40:10 +0000
X-Inumbo-ID: 423286cd-ae2d-47e7-967d-02826e164a25
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 423286cd-ae2d-47e7-967d-02826e164a25;
	Sun, 11 Oct 2020 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602412808;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=Jh8UfBfcxQz0Av/ZjvCOrikS4XhNNBeDoYLcxC4dop4=;
  b=KHZig0/xSI6ako5h1qsXqqjReeH7uph/+jDHiYANm/Qv4ItzJnDfVQvV
   7vUqEmGOoNUZHoe47T+xqxdTAC1xeVWpiFx+1kHHGYXSQro3Brlg52PMk
   hfFDgC9VvTDgu0kU3wfjonxaHde5Argx1wfpywZsAGMnKJF+vj3kjGUg5
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /FiDJ1BaYzq8ZrPucYfk86aq9HAhHQGUliFWhIZiP+gkHlh7DQFsCIXnXZO8YnliYvxA/GhVCL
 7Qvt5Mo6dAUqvPQpFsZ+MJyLUWqd18IzOEDTh2H0MDSkOV5sUOqXC8zK3nQpQ+rJQQoxcPQPXd
 ClS7UE71k82ZJwV2vcwZUlBVxlYY+C2fqyilKu4NEPrv8Rks6xxenb9AmLNFDD7JMTe6x9kw+w
 Bi0oROLYC0+LGtSxTtQwVwzP6/ZuRGEKIomCU6lBWfAW/SvRvvHoteVIdMKxSsNnjp5hE954ql
 DV0=
X-SBRS: 2.5
X-MesageID: 29003191
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,362,1596513600"; 
   d="scan'208";a="29003191"
Subject: Re: [SUSPECTED SPAM]Xen-unstable :can't boot HVM guests, bisected to
 commit: "hvmloader: indicate ACPI tables with "ACPI data" type in e820"
To: Sander Eikelenboom <linux@eikelenboom.it>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>
References: <9293a9e1-e507-4788-5460-d5ec9abc1af9@eikelenboom.it>
 <bbc026b0-06f1-a052-030d-d6757dda89b9@citrix.com>
 <24413d2e-5665-bc36-452b-af5c9b1af0b8@eikelenboom.it>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <a7e46051-999d-fa5a-6707-d4c6e61727bb@citrix.com>
Date: Sun, 11 Oct 2020 11:40:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24413d2e-5665-bc36-452b-af5c9b1af0b8@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/10/2020 10:43, Sander Eikelenboom wrote:
> On 11/10/2020 02:06, Igor Druzhinin wrote:
>> On 10/10/2020 18:51, Sander Eikelenboom wrote:
>>> Hi Igor/Jan,
>>>
>>> I tried to update my AMD machine to current xen-unstable, but
>>> unfortunately the HVM guests don't boot after that. The guest keeps
>>> using CPU-cycles but I don't get to a command prompt (or any output at
>>> all). PVH guests run fine.
>>>
>>> Bisection leads to commit:
>>>
>>> 8efa46516c5f4cf185c8df179812c185d3c27eb6
>>> hvmloader: indicate ACPI tables with "ACPI data" type in e820
>>>
>>> I tried xen-unstable with this commit reverted and with that everything
>>> works fine.
>>>
>>> I attached the xl-dmesg output.
>>
>> What guests are you using? 
> Not sure I understand what you ask for, but:
> dom0 PV
> guest HVM (qemu-xen)
> 
>> Could you get serial output from the guest?
> Not getting any, it seems to be stuck in very early boot.
> 
>> Is it AMD specific?
> Can't tell, this is the only machine I test xen-unstable on.
> It's a AMD phenom X6.
> Both dom0 and guest kernel are 5.9-rc8.
> 
> Tested with guest config:
> kernel      = '/boot/vmlinuz-xen-guest'
> ramdisk     = '/boot/initrd.img-xen-guest'
> 
> cmdline     = 'root=UUID=7cc4a90d-d6b0-4958-bb7d-50497aa29f18 ro
> nomodeset console=tty1 console=ttyS0 console=hvc0 earlyprintk=xen'
> 
> type='hvm'
> 
> device_model_version = 'qemu-xen'
> 
> cpus        = "2-5"
> vcpus = 2
> 
> memory      = '512'
> 
> disk        = [
>                   'phy:/dev/xen_vms_ssd/media,xvda,w'
>               ]
> 
> name        = 'guest'
> 
> vif         = [ 'bridge=xen_bridge,ip=192.168.1.10,mac=00:16:3E:DC:0A:F1' ]
> 
> on_poweroff = 'destroy'
> on_reboot   = 'restart'
> on_crash    = 'preserve'
> 
> vnc=0
> 
> 
>> If it's a Linux guest could you get a stacktrace from
>> the guest using xenctx?
> 
> It is, here are few subsequent runs:
> 
> ~# /usr/local/lib/xen/bin/xenctx -s
> /boot/System.map-5.9.0-rc8-20201010-doflr-mac80211debug+ -f -a -C 4
> vcpu0:
> cs:eip: ca80:00000256

Ok, it's stuck in linuxboot.bin option ROM. That's not something we test in Citrix -
we don't use fw_cfg. It could be something with caching (given it's moving but slowly) or a
bug uncovered by memory map changes. I'll try to get a repro on Monday.

It could be AMD specific if it's caching related and that's why osstest didn't pick it up.

Igor

