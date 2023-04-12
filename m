Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B37136DFF5B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 22:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520370.807887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmghM-0007i8-Jm; Wed, 12 Apr 2023 20:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520370.807887; Wed, 12 Apr 2023 20:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmghM-0007fn-Gq; Wed, 12 Apr 2023 20:04:08 +0000
Received: by outflank-mailman (input) for mailman id 520370;
 Wed, 12 Apr 2023 20:04:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmghK-0007fh-GV
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 20:04:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmghJ-00039z-CT; Wed, 12 Apr 2023 20:04:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmghJ-0004cU-5q; Wed, 12 Apr 2023 20:04:05 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=rf55FNKq+3vzbc7Nnoy2CdPTLoMelHYpsXH6DzqDWIo=; b=vTNhmpSQZqXYkXD/IOY7ipUExn
	1W1u0knuQaen6LdHmYmQR2pQewwqSSdlgpZOA4iksIaodBBzL9dDvtr9FfX4zFIyyPutN95D3A12u
	/ctLeufxH1xQrmU6iee82+N4IvU58IGZUz3QGb4/+wnwD0PqOCcsc/saOF5gN99YRkcA=;
Message-ID: <4d4ecf63-dd07-439d-4fdf-85cebea05b29@xen.org>
Date: Wed, 12 Apr 2023 21:04:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Andrew Cooper <andrew.cooper3@citrix.com>, zithro <slack@rabbit.lu>,
 xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>
References: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>
 <474b531f-2067-a5d4-8b01-5b8ef1f7061d@citrix.com>
From: Julien Grall <julien@xen.org>
Subject: Re: xenstored: EACCESS error accessing control/feature-balloon 1
In-Reply-To: <474b531f-2067-a5d4-8b01-5b8ef1f7061d@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 12/04/2023 17:05, Andrew Cooper wrote:
> On 12/04/2023 4:48 pm, zithro wrote:
>> Hi all,
>>
>> this is what I have in "xenstored-access.log" in dom0 :
>>
>> [20230411T23:48:27.917Z]  D5         write     control/feature-balloon 1
>> [20230411T23:48:27.917Z]  D5         error     EACCES
>> [20230411T23:48:27.923Z]  D5         write     data/updated Wed Apr 12
>> 01:48:27 CEST 2023
>>
>> It happens once each minute, on two different hosts, both amd64.
>> (both hosts using the same config, only the hardware differs).
>>
>> I tried looking up for a similar bug, but didn't find one.
>> I apologize in advance if this error is known, and if this is not the
>> place to report this !
>>
>> -----------------------
>> Technical infos
>> -----------------------
>> dom0s:
>>
>> Debian stable, kernel 5.10.0-21-amd64
>> Xen 4.14.5
>> xl.conf has : autoballoon="0"
>> GRUB_CMDLINE_XEN="dom0_mem=2048M,max:2048M dom0_max_vcpus=4
>> dom0_vcpus_pin loglvl=all guest_loglvl=all ucode=scan iommu=verbose"
>> Running "xenstore-ls -f -p | grep balloon" returns no result
>> -----------------------
>> domUs (D5 in above logs):
>>
>> HVM TrueNAS Core, based on FreeBSD 13.1-RELEASE-p7
>> (it happened also on previous FreeBSD realeases, but don't remember when
>> it started, logs have been filled and rotated).
>> In cfg files, using either the same value for "memory" and "maxmem" or
>> only setting "memory" give the same results.
>>
>> What's strange is that I have xen* commands in FreeNAS :
>>
>> xen-detect        xenstore-control  xenstore-ls       xenstore-watch
>> xenstore          xenstore-exists   xenstore-read     xenstore-write
>> xenstore-chmod    xenstore-list     xenstore-rm
>>
>> root@truenas[~]# xenstore-ls
>> xenstore-ls: xs_directory (/): Permission denied
>>
>> root@truenas[~]# ps aux
>> root   [...]     0:36.98 [xenwatch]
>> root   [...]     0:01.01 [xenstore_rcv]
>> root   [...]     0:00.00 [balloon]
>> root   [...]     0:01.74 /bin/sh /usr/local/sbin/xe-daemon -p
>> /var/run/xe-daemon.pid
>> [...]
>>
>> The xe-daemon looks strange also, I don't use XenServer/XCP-ng, only
>> "raw" Xen.
>> And this script which hand
>>
>> I also use PFsense domUs (based on FreeBSD), but they don't exhibit
>> this behaviour (ie. no xenstore access error in dom0, no xen*
>> commands in domU).
>>
>> So is this a problem with TrueNAS rather than with Xen ?
>> If so I apologize for wasting your time.
>>
>> Thanks, have a nice day !
>> (and as it's my first post here: thx for Xen, it rocks)
> 
> Hello,
> 
> (Leaving the full report intact so CC'd people can see it whole)
> 
> Yes, it is TrueNAS trying to re-write that file every minute.  It
> appears that TrueNAS has inherited (from debian?) a rather old version
> of https://github.com/xenserver/xe-guest-utilities/
> 
> https://xenbits.xen.org/docs/unstable/misc/xenstore-paths.html doesn't
> list feature-balloon as a permitted feature node.
> 
> But, I suspect that it used to be the case that guests could write
> arbitrary feature nodes, and I suspect we tightened the permissions in a
> security fix to reduce worst-case memory usage of xenstored.

 From a brief look, this is very similar to the patch below that was 
sent 3 years ago. I bet no-one ever tested the driver against libxl.

commit 30a970906038
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Tue Sep 4 13:39:29 2018 +0200

     libxl: create control/sysrq xenstore node

     'xl sysrq' command doesn't work with modern Linux guests with the 
following
     message in guest's log:

      xen:manage: sysrq_handler: Error -13 writing sysrq in control/sysrq

     xenstore trace confirms:

      IN 0x24bd9a0 20180904 04:36:32 WRITE (control/sysrq )
      OUT 0x24bd9a0 20180904 04:36:32 ERROR (EACCES )

     The problem seems to be in the fact that we don't pre-create 
control/sysrq
     xenstore node and libxl_send_sysrq() doing libxl__xs_printf() 
creates it as
     read-only. As we want to allow guests to clean 'control/sysrq' 
after the
     requested action is performed, we need to make this node writable.

     Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
     Acked-by: Wei Liu <wei.liu2@citrix.com>

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 60676304e9b5..dcfde7787e2c 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -695,6 +695,9 @@ retry_transaction:
                          GCSPRINTF("%s/control/feature-s4", dom_path),
                          rwperm, ARRAY_SIZE(rwperm));
      }
+    libxl__xs_mknod(gc, t,
+                    GCSPRINTF("%s/control/sysrq", dom_path),
+                    rwperm, ARRAY_SIZE(rwperm));
      libxl__xs_mknod(gc, t,
                      GCSPRINTF("%s/device/suspend/event-channel", 
dom_path),
                      rwperm, ARRAY_SIZE(rwperm));

> 
> I suspect the best (/least bad) thing to do here is formally introduce
> feature-ballon as a permitted node, and have the toolstack initialise it
> to "" like we do with all other nodes, after which TrueNAS ought to be
> able to set it successfully and not touch it a second time.

+1. This would match how libxl already deal "feature-s3" & co.

Cheers,

-- 
Julien Grall

