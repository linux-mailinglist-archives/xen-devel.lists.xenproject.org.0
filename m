Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607244336A8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213181.371334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcooV-0003r5-J9; Tue, 19 Oct 2021 13:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213181.371334; Tue, 19 Oct 2021 13:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcooV-0003o8-Eb; Tue, 19 Oct 2021 13:05:55 +0000
Received: by outflank-mailman (input) for mailman id 213181;
 Tue, 19 Oct 2021 13:05:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mcooU-0003jn-NT
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:05:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mcooS-0001pr-3r; Tue, 19 Oct 2021 13:05:52 +0000
Received: from [54.239.6.189] (helo=[192.168.0.120])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mcooR-0007OW-Tt; Tue, 19 Oct 2021 13:05:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=g8YXb52Ju3ZoCyKAwm/nE1Y9OgmgrAPTCcRTFPbMDfc=; b=LW3QhCWvE3l70JjMv0/KdljF6X
	i2zxMuIle6CGHOjNvjzta9uUjJ8UwfzEOppKrUBDyD+HLOvcTr6oK9ZrQvEDGZDprGzglhmMxBAxy
	xYb/LA6+byJz441dmpMV4AWE84LIYzulmYpDCRhgG14ug/u/x+mXeszNR/y+IBkS0E5w=;
Message-ID: <7f6a0b1b-c325-95c4-a9d2-2bc28ae79268@xen.org>
Date: Tue, 19 Oct 2021 14:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Xen Booting Problem on ARM Machine
To: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>,
 xen-devel@lists.xenproject.org, kannan@cimware.in
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol>
 <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org>
 <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com>
 <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
 <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com>
 <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s>
 <CAEsO4uyjNs97Cx8n2owDk4kKTVCycji377pm7aXHcPWzeszUTw@mail.gmail.com>
 <alpine.DEB.2.21.2109301942370.3209@sstabellini-ThinkPad-T480s>
 <CAEsO4ux_AqXBeCtbwnPAdnBnVYHTur_2EfcZBTuN4QKCq4ko8Q@mail.gmail.com>
 <alpine.DEB.2.21.2110131711280.9408@sstabellini-ThinkPad-T480s>
 <CAEsO4uxo_A4pEwP6dHK8kvYtKcbSr-ewqX1v-KLsEkyHNLFyUA@mail.gmail.com>
 <alpine.DEB.2.21.2110141536090.9408@sstabellini-ThinkPad-T480s>
 <CAEsO4uzwNHiLEZVEy90uua9YRud=Bmj=EPhzbhyk0tsEai=UQg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAEsO4uzwNHiLEZVEy90uua9YRud=Bmj=EPhzbhyk0tsEai=UQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19/10/2021 13:04, Sai Kiran Kumar Reddy Y wrote:
> Hi,

Hello,

> 
> Thanks for your inputs. As you have mentioned, I tried to boot Xen 
> directly from EFI, thereby skipping GRUB. I made sure that kernel, 
> xen.cfg and ramdisk are on the first FAT partition. I still get "All 128 
> bootinfo membanks exhausted error". The following link has my grub.cfg 
> config. file and also the snapshot of the error.
> 
> Link: 
> https://drive.google.com/drive/folders/1o7WT5oB7UsaZBeY5m4mWSidT5NalzvvJ?usp=sharing 
> <https://drive.google.com/drive/folders/1o7WT5oB7UsaZBeY5m4mWSidT5NalzvvJ?usp=sharing>
> 
> I feel that even with EFI bootloader, there's some issue with bootinfo 
> mem banks and it maynot be a bug in GRUB. Let me know your thoughts on this.

As I wrote a few weeks ago. Both issues ("mem banks exhausted" and 
"Cannot exit boot services") are meant to be non-fatal. So you should be 
able to continue booting Xen afterwards.

The fact you don't see any log seems to suggest that you didn't enable 
properly earlyprintk. Would you be able to post your xen/.config?

Could you also confirm which server are you using? The ACPI table seems 
to suggest this is an Ampere Altra.

Best regards,

-- 
Julien Grall

