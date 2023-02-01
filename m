Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEEC685C20
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 01:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487978.755823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN0sv-0002J5-BC; Wed, 01 Feb 2023 00:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487978.755823; Wed, 01 Feb 2023 00:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN0sv-0002Gh-8Q; Wed, 01 Feb 2023 00:21:57 +0000
Received: by outflank-mailman (input) for mailman id 487978;
 Wed, 01 Feb 2023 00:21:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7L9=55=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pN0ss-0002Gb-Vl
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 00:21:54 +0000
Received: from ppsw-42.srv.uis.cam.ac.uk (ppsw-42.srv.uis.cam.ac.uk
 [131.111.8.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cf0116f-a1c6-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 01:21:53 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43156)
 by ppsw-42.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pN0sl-0010SJ-EJ (Exim 4.96) (return-path <amc96@srcf.net>);
 Wed, 01 Feb 2023 00:21:47 +0000
Received: from [192.168.1.10] (host-92-12-62-6.as13285.net [92.12.62.6])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 132C91FBCC;
 Wed,  1 Feb 2023 00:21:47 +0000 (GMT)
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
X-Inumbo-ID: 6cf0116f-a1c6-11ed-933c-83870f6b2ba8
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9d5841b2-5d0b-390f-6e95-cf492e99e5a2@srcf.net>
Date: Wed, 1 Feb 2023 00:21:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Alistair Francis <alistair23@gmail.com>
Cc: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Connor Davis
 <connojdavis@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
 Julien Grall <julien@xen.org>
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
 <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
 <f5cd1bfb116bfcc86fc2848df7eead05cd1a24c0.camel@gmail.com>
 <CAKmqyKMGiDiPRZBekdKan=+YduSmkB2DoWo5btrtVQ8nS3KMAg@mail.gmail.com>
 <2f6a3b17-4e41-fe9a-1713-4942b3bd3585@xen.org>
 <CAKmqyKNwH4-D3dKGQEsW_Zup4OT32C1RwaA7_Sey4fo_jOzFcA@mail.gmail.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v7 1/2] xen/riscv: introduce early_printk basic stuff
In-Reply-To: <CAKmqyKNwH4-D3dKGQEsW_Zup4OT32C1RwaA7_Sey4fo_jOzFcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/01/2023 11:17 pm, Alistair Francis wrote:
> On Tue, Jan 31, 2023 at 10:03 PM Julien Grall <julien@xen.org> wrote:
>> On 31/01/2023 11:44, Alistair Francis wrote:
>>> On Sat, Jan 28, 2023 at 12:15 AM Oleksii <oleksii.kurochko@gmail.com> wrote:
>>>
>>  From my understanding, on RISC-V, the use of PC-relative address is
>> only guaranteed with medany. So if you were going to change the cmodel
>> (Andrew suggested you would), then early_*() may end up to be broken.
>>
>> This check serve as a documentation of the assumption and also help the
>> developer any change in the model and take the appropriate action to
>> remediate it.
>>
>>> I think this is safe to remove.
>> Based on what I wrote above, do you still think this is safe?
> With that in mind it's probably worth leaving in then. Maybe the
> comment should be updated to make it explicit why we want this check
> (I find the current comment not very helpful).

The presence of this check pre-supposes that Xen will always relocate
itself, and this simply not true.  XIP for example typically does not.

Furthermore it's not checking the property wanted.  The way C is
compiled has no bearing on what relocation head.S uses to call it.

It is a given that we compile the hypervisor with a consistent code
model, meaning that the properly actually making the check do what is
wanted is also the property that means it is not needed in the first place.

This check is literally not worth the bytes it's taking up on disk, and
not worth the added compiler time, nor the wasted time of whoever comes
to support something like XIP in the future finds it to be in the way. 
Xen as a whole will really genuinely function as intended in models
other than medany, and it demonstrates a misunderstanding of the topic
to put in such a check to begin with.

~Andrew

