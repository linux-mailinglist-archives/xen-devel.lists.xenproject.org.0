Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2F1450460
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225881.390190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmb3V-0001Ex-L3; Mon, 15 Nov 2021 12:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225881.390190; Mon, 15 Nov 2021 12:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmb3V-0001BY-Gz; Mon, 15 Nov 2021 12:25:49 +0000
Received: by outflank-mailman (input) for mailman id 225881;
 Mon, 15 Nov 2021 12:25:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jrjg=QC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmb3U-0001BS-8C
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:25:48 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28706ddf-460f-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 13:25:47 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:59200)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmb3R-000Zyl-8a (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 15 Nov 2021 12:25:45 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5AFDF1FDB0;
 Mon, 15 Nov 2021 12:25:45 +0000 (GMT)
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
X-Inumbo-ID: 28706ddf-460f-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH for-4.16] freebsd/privcmd: fix MMAP_RESOURCE ioctl
 definition
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20211115110851.1462-1-roger.pau@citrix.com>
 <11c7c89d-ba8f-e1da-e2af-4ba186f92fbe@srcf.net>
 <YZJQS5bG+/7M0fEh@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Message-ID: <cc65f5b4-6bf4-5580-8f4e-42c16d69179f@srcf.net>
Date: Mon, 15 Nov 2021 12:25:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZJQS5bG+/7M0fEh@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 15/11/2021 12:19, Roger Pau Monné wrote:
> On Mon, Nov 15, 2021 at 12:03:26PM +0000, Andrew Cooper wrote:
>> On 15/11/2021 11:08, Roger Pau Monne wrote:
>>> Current ioctl definition was wrong in both FreeBSD and Xen sources, as
>>> the MMAP_RESOURCE ioctl needs to copy back the size of the resource
>>> when passed a zero address and size. FreeBSD encodes in the definition
>>> of the ioctl number whether parameters should be copied in (W) and/or
>>> copied out (R). The current definition for MMAP_RESOURCE is lacking
>>> the copy out part (R), and thus the call to query the size of a
>>> resource would always return 0.
>>>
>>> This change will break the current ioctl interface, the tools can
>>> however fall back to using the foreign memory interface in order to
>>> map resources from guests.
>>>
>>> This was a shortcoming from when the hypercall and ioctl gained the
>>> ability to query the size of the resources, as originally the
>>> MMAP_RESOURCE ioctl didn't need to copy out any data.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Cc: Ian Jackson <iwj@xenproject.org>
>>>
>>> The change only affects FreeBSD, and it's only a change in a
>>> definition of an ioctl, so it's unlikely to break existing code logic.
>>> Without this change Xen tools won't be able to use the MMAP_RESOURCE
>>> ioctl.
>> I guess you found this while trying to fix test-resource, in which case
>> a further argument for the change is "the unit tests now pass on FreeBSD" ?
> Indeed. It seems like this is the only instance of a resource size
> query that we have implemented so far.

Well - it's used on the domain create path ever since being introduced
to avoid the "shoot a hole in a superpage in order to map the grant
table" problem, but it does have a fallback which is probably why it
went unnoticed.

~Andrew

