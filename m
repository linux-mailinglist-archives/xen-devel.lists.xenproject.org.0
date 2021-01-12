Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634C12F3BA7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 21:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66016.117061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzQjp-00057E-Oy; Tue, 12 Jan 2021 20:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66016.117061; Tue, 12 Jan 2021 20:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzQjp-00056p-LF; Tue, 12 Jan 2021 20:58:01 +0000
Received: by outflank-mailman (input) for mailman id 66016;
 Tue, 12 Jan 2021 20:57:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v4LF=GP=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kzQjn-00056h-SL
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 20:57:59 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd2c1171-cfe0-48c8-a2b8-aa3dcfe3189d;
 Tue, 12 Jan 2021 20:57:56 +0000 (UTC)
Received: from 88-111-124-141.dynamic.dsl.as9105.com ([88.111.124.141]:59034
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kzQjY-0007vT-RK (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Tue, 12 Jan 2021 20:57:44 +0000
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
X-Inumbo-ID: fd2c1171-cfe0-48c8-a2b8-aa3dcfe3189d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dego4v4Zh+WI+DqstNx6chBLMb2OBpto/QNpt8D+Bac=; b=ZzNqf89yyRLUN8TGrpPHbHqmYz
	QqODEdVaTiUI0raz4P0kX+R2WSRKHAt0xHPuYZ1RMmCvmA+NOI+srWSbf/tSGo4ASJJtTpUDx3Lx9
	ATZCkqFLvghqQJQ34UMCaNRmF/98gWXQ6jv2QcOWeZLVwTc7BDCPFD3aWEzusDfm+o3Y=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH v3 2/7] xen/memory: Fix acquire_resource size semantics
To: Julien Grall <julien.grall.oss@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <amc96@cam.ac.uk>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-3-andrew.cooper3@citrix.com>
 <CAJ=z9a30MFcV4=5YU9O2oHmNeMU3vdPwSJ6vYCpDi5Zoi6aNtQ@mail.gmail.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <ac46431b-3d68-e758-f598-0d39c6c39aeb@cam.ac.uk>
Date: Tue, 12 Jan 2021 20:57:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a30MFcV4=5YU9O2oHmNeMU3vdPwSJ6vYCpDi5Zoi6aNtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 12/01/2021 20:15, Julien Grall wrote:
> Hi Andrew,
>
> On Tue, 12 Jan 2021 at 19:49, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> Calling XENMEM_acquire_resource with a NULL frame_list is a request for the
>> size of the resource, but the returned 32 is bogus.
>>
>> If someone tries to follow it for XENMEM_resource_ioreq_server, the acquire
>> call will fail as IOREQ servers currently top out at 2 frames, and it is only
>> half the size of the default grant table limit for guests.
> I haven't yet looked at the code, just wanted to seek some clarification here.
> Are we expecting someone else outside the tools (e.g. QEMU) to rely on
> the new behavior? If so, what would happen if such code ran on older
> Xen?
>
> IOW, will that code require some compatibility layer to function?

This is total mess.

Requesting the size of a resource was never implemented for userspace. 
The two current users of this interface (domain builder for gnttab
seeding, qemu for ioreq server) make blind mapping calls with a priori
knowledge of the offsets and sizes.

The next patch in this series adds the xenforeignmemory_resource_size()
API for userspace, so we can reliably say that anything built against
anything earlier than Xen 4.15 isn't making size requests.

The added complication is that if you have Xen 4.15, and Linux 4.18 or
later without the kernel fix provided by Roger (which is CC stable),
you'll get a bogus 32 back from the size requests.

But that is fine because nothing is making size requests yet.

The first concrete user of size requests will be Michał's Processor
Trace series, where there is a daemon to map the PT buffer and shuffle
the contents into a file.  That will also depend on new content in 4.15.

At some point in the future, Qemu is going to have to change it's
approach, when we want to support more than 128 vcpus.  This is the
point at which the synchronous ioreq page needs to turn into two pages. 
In practice, qemu could make a size call, or could make the same
calculation as Xen makes, as Qemu does know d->max_vcpus via other means.


Honestly, I'm expecting that Linux stable will do the rounds faster than
Xen 4.15 gets rolled out to distros.  The chances of having a bleeding
edge Xen, and not an up-to-date (or at least patched) dom0 kernel is
minimal.

>> Also, no users actually request a resource size, because it was never wired up
>> in the sole implementaion of resource acquisition in Linux.
> s/implementation/
>
>> Introduce a new resource_max_frames() to calculate the size of a resource, and
>> implement it the IOREQ and grant subsystems.
> in the?

Fixed, thanks,

~Andrew

