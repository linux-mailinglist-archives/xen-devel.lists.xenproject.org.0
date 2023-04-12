Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F326DFB8C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 18:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520271.807670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmdXa-0002jB-Tu; Wed, 12 Apr 2023 16:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520271.807670; Wed, 12 Apr 2023 16:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmdXa-0002g9-PR; Wed, 12 Apr 2023 16:41:50 +0000
Received: by outflank-mailman (input) for mailman id 520271;
 Wed, 12 Apr 2023 16:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DpjG=AD=bounce.vates.fr=bounce-md_30504962.6436df48.v1-cc6b503e5fa0409fa2eeb092e8a9f553@srs-se1.protection.inumbo.net>)
 id 1pmdXY-0002g3-Ez
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 16:41:48 +0000
Received: from mail136-25.atl41.mandrillapp.com
 (mail136-25.atl41.mandrillapp.com [198.2.136.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e91b97a0-d950-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 18:41:45 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-25.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4PxT4m3534z35hjR4
 for <xen-devel@lists.xenproject.org>; Wed, 12 Apr 2023 16:41:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cc6b503e5fa0409fa2eeb092e8a9f553; Wed, 12 Apr 2023 16:41:44 +0000
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
X-Inumbo-ID: e91b97a0-d950-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1681317704; x=1681375304; i=yann.dirson@vates.fr;
	bh=3JTXjkmoPGh0ttTfkEsTFYXtthTwOcD8aDvT7t9kOso=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XpZktOdtZSTN6L3Y0D/3a+svDlbMllPmTEsPvZFup8oOh6+9XU68GfoG1IDdPLPHg
	 MquK1nTt0TufVg0a/6BoL8aWG+5Tl3vgAyXsUqGim91DGrl1lpsK43g7Q99ihw69d8
	 G+u25KvAQJDDHj4GPPlhfACpEzeFjfnoWa3j4ny8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1681317704; h=From : 
 Subject : Message-Id : To : References : In-Reply-To : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=3JTXjkmoPGh0ttTfkEsTFYXtthTwOcD8aDvT7t9kOso=; 
 b=aAz8xn02E6Lzb1c19IB1SBKRJXAlqRuDDXzimIymw9OUJfS1is8tYMDDzKAUuWuy7duzu4
 ODLipWXY9o4F0LWhTeIn7dIJJg5R8DVhXJEqjuEERKUZbF7JrIgq7g+CQl68WlkmrBsyYmlx
 T+9ikeP0tdY9gSn7ANV/wmfHZwN/4=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: Re: xenstored: EACCESS error accessing control/feature-balloon 1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: aebc14ef-2387-424b-ab1b-4782f58676dc
X-Bm-Transport-Timestamp: 1681317702247
Message-Id: <678df1ff-df18-b063-eda3-2a1aed6d40f8@vates.fr>
To: xen-devel@lists.xenproject.org
References: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu> <474b531f-2067-a5d4-8b01-5b8ef1f7061d@citrix.com>
In-Reply-To: <474b531f-2067-a5d4-8b01-5b8ef1f7061d@citrix.com>
X-Native-Encoded: 0
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.cc6b503e5fa0409fa2eeb092e8a9f553
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230412:md
Date: Wed, 12 Apr 2023 16:41:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On 4/12/23 18:05, Andrew Cooper wrote:
> On 12/04/2023 4:48 pm, zithro wrote:
>> Hi all,
>>
>> this is what I have in "xenstored-access.log" in dom0 :
>>
>> [20230411T23:48:27.917Z]=C2=A0 D5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 write=C2=A0=C2=A0=C2=A0=C2=A0 control/feature-balloon 1
>> [20230411T23:48:27.917Z]=C2=A0 D5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 error=C2=A0=C2=A0=C2=A0=C2=A0 EACCES
>> [20230411T23:48:27.923Z]=C2=A0 D5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 write=C2=A0=C2=A0=C2=A0=C2=A0 data/updated Wed Apr 12
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
>> xl.conf has : autoballoon=3D"0"
>> GRUB_CMDLINE_XEN=3D"dom0_mem=3D2048M,max:2048M dom0_max_vcpus=3D4
>> dom0_vcpus_pin loglvl=3Dall guest_loglvl=3Dall ucode=3Dscan iommu=3Dverb=
ose"
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
>> xen-detect=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xenstore-control=C2=
=A0 xenstore-ls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xenstore-watch
>> xenstore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xenstore-=
exists=C2=A0=C2=A0 xenstore-read=C2=A0=C2=A0=C2=A0=C2=A0 xenstore-write
>> xenstore-chmod=C2=A0=C2=A0=C2=A0 xenstore-list=C2=A0=C2=A0=C2=A0=C2=A0 x=
enstore-rm
>>
>> root@truenas[~]# xenstore-ls
>> xenstore-ls: xs_directory (/): Permission denied
>>
>> root@truenas[~]# ps aux
>> root=C2=A0=C2=A0 [...]=C2=A0=C2=A0=C2=A0=C2=A0 0:36.98 [xenwatch]
>> root=C2=A0=C2=A0 [...]=C2=A0=C2=A0=C2=A0=C2=A0 0:01.01 [xenstore_rcv]
>> root=C2=A0=C2=A0 [...]=C2=A0=C2=A0=C2=A0=C2=A0 0:00.00 [balloon]
>> root=C2=A0=C2=A0 [...]=C2=A0=C2=A0=C2=A0=C2=A0 0:01.74 /bin/sh /usr/loca=
l/sbin/xe-daemon -p
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
> Hello,
>
> (Leaving the full report intact so CC'd people can see it whole)
>
> Yes, it is TrueNAS trying to re-write that file every minute.=C2=A0 It
> appears that TrueNAS has inherited (from debian?) a rather old version
> of https://github.com/xenserver/xe-guest-utilities/

TrueNAS being FreeBSD-based probably inherits this from the 
sysutils/xe-guest-utilities port, which installs a fork of the shell 
version which predates this golang repository.


> https://xenbits.xen.org/docs/unstable/misc/xenstore-paths.html doesn't
> list feature-balloon as a permitted feature node.
>
> But, I suspect that it used to be the case that guests could write
> arbitrary feature nodes, and I suspect we tightened the permissions in a
> security fix to reduce worst-case memory usage of xenstored.
>
> I suspect the best (/least bad) thing to do here is formally introduce
> feature-ballon as a permitted node, and have the toolstack initialise it
> to "" like we do with all other nodes, after which TrueNAS ought to be
> able to set it successfully and not touch it a second time.

Is there anything besides XAPI using this node, or the other data 
published by xe-daemon?

Maybe the original issue is just that there is no reason to have 
xe-guest-utilities installed in this setup?

Best regards,

-- 
Yann Dirson | Vates Platform Developer
XCP-ng & Xen Orchestra - Vates solutions
w: vates.tech | xcp-ng.org | xen-orchestra.com



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com


