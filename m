Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF14493FDE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 19:27:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258906.446413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAFfi-0004jC-N0; Wed, 19 Jan 2022 18:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258906.446413; Wed, 19 Jan 2022 18:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAFfi-0004hM-Jv; Wed, 19 Jan 2022 18:27:02 +0000
Received: by outflank-mailman (input) for mailman id 258906;
 Wed, 19 Jan 2022 18:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zsuW=SD=eikelenboom.it=linux@srs-se1.protection.inumbo.net>)
 id 1nAFfg-0004hG-L6
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 18:27:01 +0000
Received: from server.eikelenboom.it (server.eikelenboom.it [91.121.65.215])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63118e73-7955-11ec-bc18-3156f6d857e4;
 Wed, 19 Jan 2022 19:26:59 +0100 (CET)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:34506
 helo=[172.16.1.50])
 by server.eikelenboom.it with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <linux@eikelenboom.it>)
 id 1nAFgN-00010r-Fc; Wed, 19 Jan 2022 19:27:43 +0100
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
X-Inumbo-ID: 63118e73-7955-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EaSTjipOuBT861aSRDtUI1rpXsQTwxohUEiwfdgy3zU=; b=DSahA0sdBDJK0Q2y07AWF0C4Em
	ErjIZC/iG03/fH/9IEcfgmQMUFZLtjeqIK5HeNpesKIJYay9FvtJipyWGJ/dEAazAnze3NGYDHOuf
	yzDSwWlBex1u949oQOaW7fRmINbAn/8TzCRwXyLv1leuN9aVA+YwLv2FQoKMIVqlkvt0=;
Subject: Re: Regression booting Linux kernel 5.16.1 under Xen: Failed to
 update kernel mapping for mfn=6930582 pfn=524288
From: Sander Eikelenboom <linux@eikelenboom.it>
To: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <d3ba970c-3930-fb4e-4fd2-4246700fd11e@eikelenboom.it>
 <39794058-78ce-994c-c854-cea206ff938e@suse.com>
 <ef7f62cf-82a7-22f7-2cf6-2ffb584ea5da@eikelenboom.it>
Message-ID: <666c2522-e0b2-3a9c-0a0c-9c492f0ac00c@eikelenboom.it>
Date: Wed, 19 Jan 2022 19:26:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ef7f62cf-82a7-22f7-2cf6-2ffb584ea5da@eikelenboom.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: nl-NL
Content-Transfer-Encoding: 8bit

On 18/01/2022 14:55, Sander Eikelenboom wrote:
> On 18/01/2022 12:13, Juergen Gross wrote:
>> On 18.01.22 11:53, Sander Eikelenboom wrote:
>>> L.S.,
>>>
>>> Both Linux kernel 5.16.0 and 5.16.1 fail to boot as Dom0 under
>>> xen-unstable and crash early in boot on my hardware.
>>> With Linux 5.15.13 it boots fine. Serial log is below.
>> ...
>>
>>> (XEN) [0000001b1ffedeb8] Command line: dom0_mem=2048M,max:2048M
>>> loglvl=all guest_loglvl=all console_timestamps=datems
>>> vga=gfx-1280x1024x32 no-cpuidle com1=38400,8n1 console=vga,com1
>>> ivrs_ioapic[6]=00:14.0 iommu=on,verbose,debug conring_size=128k
>>> ucode=scan sched=credit2 gnttab_max_frames=64 reboot=a
>> ...
>>
>>> mapping kernel into physical memory
>>> about to get started...
>>> [    0.000000] Linux version 5.16.1-20220118-doflr-mac80211debug+
>>> (root@serveerstertje) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils
>>> for Debian) 2.31.1) #1 SMP PREEMPT Tue Jan 18 10:49:09 CET 2022
>>> [    0.000000] Command line: root=/dev/mapper/serveerstertje_ssd-root ro
>>> verbose earlyprintk=xen mem=2048M console=hvc0 scsi_mod.use_blk_mq=1
>>> console=tty0 acpi_enforce_resources=lax max_loop=30 loop_max_part=10
>>> r8169.use_dac=1 loglevel=10 nomodeset net.ifnames=0 biosdevname=0
>>> xen-pciback.hide=(00:14.2)(04:00.*)(08:00.0)(09:00.*)(0a:00.0)(0d:00.0)
>> ...
>>
>>> [    0.135670] ------------[ cut here ]------------
>>> [    0.135690] Failed to update kernel mapping for mfn=6930582 pfn=524288
>>> [    0.135701] WARNING: CPU: 0 PID: 0 at arch/x86/xen/setup.c:312
>>> xen_remap_memory+0x191/0x26c
>> There seems to be a problem with rearranging the dom0 memory layout
>> to match that of the host. Especially it is going sideways when trying
>> to remap a memory frame to PFN 524288 (0x80000).
>>
>> You are limiting dom0 memory to 2 GB via Xen command line, but in
>> addition to that you specify "mem=2048M" for the dom0 kernel, too. This
>> should cap memory from PFN 0x80000 onwards, hence the failure when dom0
>> tries to remap a frame into this area.
>>
>> Can you please try removing the "mem=2048M" from the dom0 parameters?
>>
>> I think there has been a kernel commit fixing the correct handling of
>> the "mem=" parameter in 5.16, which might be the reason why you are
>> seeing the crash only now.
>>
>>
>> Juergen
>>
> Ah that sounds plausible, will test tomorrow and report back.
> Thanks once again !
> 
> --
> Sander

Hi Juergen,

Just tested without "mem=2048M" and with that the machine boots fine.
Thanks for the help and sorry for the noise !

--
Sander


