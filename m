Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8148BF92
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 09:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256354.439851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YkV-000811-5s; Wed, 12 Jan 2022 08:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256354.439851; Wed, 12 Jan 2022 08:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YkV-0007yr-2j; Wed, 12 Jan 2022 08:12:51 +0000
Received: by outflank-mailman (input) for mailman id 256354;
 Wed, 12 Jan 2022 08:12:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BEGY=R4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7YkT-0007yg-SJ
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 08:12:49 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3635b0-737f-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 09:12:48 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48186)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7YkQ-000zOW-2r (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 12 Jan 2022 08:12:46 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id AB30E1FD4B;
 Wed, 12 Jan 2022 08:12:46 +0000 (GMT)
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
X-Inumbo-ID: 6d3635b0-737f-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <3124ed39-ba23-ccd1-a036-67032f36c0b7@srcf.net>
Date: Wed, 12 Jan 2022 08:12:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 03/12] mini-os: use alloc_file_type() and
 get_file_from_fd() in xs
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-4-jgross@suse.com>
 <a41f6688-d14a-dad5-1625-1b98f793062e@srcf.net>
 <501262b0-510b-3add-35a6-2f2ad7452518@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <501262b0-510b-3add-35a6-2f2ad7452518@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/01/2022 07:52, Juergen Gross wrote:
> On 11.01.22 21:21, Andrew Cooper wrote:
>> On 11/01/2022 15:12, Juergen Gross wrote:
>>>   void xs_daemon_close(struct xs_handle *h)
>>>   {
>>> -    int fd = _xs_fileno(h);
>>> -    struct xenbus_event *event, *next;
>>> -    for (event = files[fd].dev; event; event = next)
>>> -    {
>>> -        next = event->next;
>>> -        free(event);
>>> -    }
>>> +    close(_xs_fileno(h));
>>>   }
>>
>> You've deleted the sole caller of xs_daemon_close() from the main
>> close() function.
>>
>> That said, I'm very confused, because nothing in minios declares it.
>> The declaration appears to come from xenstore.h, which is clearly
>> included unconditionally (when it ought not to be), but libxenstore also
>> defines the function too...
> I already thought of restructuring this mess.
>
> lib/xs.c is the Mini-OS variant of libxenstore, and as such it shares
> quite some code with libxenstore.
>
> So the correct thing to do would be to split libxenstore into a common
> part and a posix/Mini-OS part, drop lib/xs.c, and use the library in
> Mini-OS instead.
>
> But this should be done in a separate series.

Sounds like a plan.

~Andrew

