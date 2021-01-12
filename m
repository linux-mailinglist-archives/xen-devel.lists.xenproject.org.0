Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F262F37FF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65821.116610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzO93-0003RQ-Ve; Tue, 12 Jan 2021 18:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65821.116610; Tue, 12 Jan 2021 18:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzO93-0003R2-Rx; Tue, 12 Jan 2021 18:11:53 +0000
Received: by outflank-mailman (input) for mailman id 65821;
 Tue, 12 Jan 2021 18:11:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v4LF=GP=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kzO91-0003Qw-TS
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:11:52 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 910096c2-34c5-4da9-aca3-7b46085420a6;
 Tue, 12 Jan 2021 18:11:50 +0000 (UTC)
Received: from 88-111-124-141.dynamic.dsl.as9105.com ([88.111.124.141]:54012
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kzO8p-000WRC-RT (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Tue, 12 Jan 2021 18:11:39 +0000
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
X-Inumbo-ID: 910096c2-34c5-4da9-aca3-7b46085420a6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KIj6x13UeirtkWuT0nEWGxuobGxMZT3nhyetTI08Y6I=; b=CrcKJRwNA2To7x5cHpWc4+2+m0
	t3FSw2vHlRDNGiyXP7CpxBZJLgom3sWN3dUhm6i/G2/WbMOYxWuIK5s2b5YgA7KsKrhCQB8cKFv8d
	++f4oPsVudhrq30ZMjIpd+lXaEUJIoRLcV83+97umUMujDLj5gr4FlqqAk2km/I52zy4=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-3-andrew.cooper3@citrix.com>
 <538236fd-af25-9e35-8f44-3125fe71e4bd@suse.com>
 <a2c77b68-5434-836d-40e4-40fb037617d5@cam.ac.uk>
 <7ee919a3-87db-a0b0-2637-319c0ea237c8@suse.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <dcbfc0df-adf0-6ca6-3d8d-2d4fa0727026@cam.ac.uk>
Date: Tue, 12 Jan 2021 18:11:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <7ee919a3-87db-a0b0-2637-319c0ea237c8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 12/01/2021 08:15, Jan Beulich wrote:
> On 11.01.2021 22:22, Andrew Cooper wrote:
>> On 25/09/2020 14:17, Jan Beulich wrote:
>>> On 22.09.2020 20:24, Andrew Cooper wrote:
>>>> --- a/xen/common/grant_table.c
>>>> +++ b/xen/common/grant_table.c
>>>> @@ -4013,6 +4013,81 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>>>>      return 0;
>>>>  }
>>>>  
>>>> +int gnttab_acquire_resource(
>>>> +    struct domain *d, unsigned int id, unsigned long frame,
>>>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>>>> +{
>>>> +    struct grant_table *gt = d->grant_table;
>>>> +    unsigned int i = nr_frames, tot_frames;
>>>> +    mfn_t tmp;
>>>> +    void **vaddrs = NULL;
>>>> +    int rc;
>>>> +
>>>> +    /* Input sanity. */
>>>> +    if ( !nr_frames )
>>>> +        return -EINVAL;
>>> I continue to object to this becoming an error.
>> It's not a path any legitimate caller will ever exercise.  POSIX defines
>> any mmap() of zero length to be an error, and I completely agree.
>>
>> The problem isn't, per say, with accepting bogus arguments.  It is the
>> quantity of additional complexity in the hypervisor required to support
>> accepting the bogus input cleanly.
> Is there any, besides s/-EINVAL/0/ for the line above?

It's really not that simple.

I've dropped this particular hunk from v3 (as it is not necessary for
safety at this point in the series), but retained the equivalent logical
change in later patches where it does become necessary.

>
>> There are exactly 2 cases where 0 might be found here.  Either the
>> caller passed it in directly (and bypassed the POSIX check which would
>> reject the attempt), or some part of multi-layer continuation handling
>> went wrong on the previous iteration.
>>
>> For this hypercall (by the end of the series), _acquire_resource()
>> returning 0 is specifically treated as an error so we don't livelock in
>> 32-chunking loop until some other preemption kicks in.
>>
>> In this case, the check isn't actually necessary because it is (will be)
>> guarded higher up the call chain in a more general way, but I'm not
>> interested in adding unnecessary extra complexity (to area I've had to
>> rewrite from scratch to remove the bugs) simply to support a
>> non-existent usecase.
> In a couple of cases you've been calling out the principle of least
> surprise. This holds for the entirety of batched (in whatever form)
> hypercalls then as well. Either zero elements means "no-op"
> everywhere, or it gets treated as an error everywhere. Anything
> else is inconsistent and hence possibly surprising.

If you want to talk consistency, I'm fixing an inconsistency with this
change, not introducing one.

The existing logic will already yield EINVAL for addr==0, num !=0,
rather than writing the size back.

addr!=0, num==0 is the odd-combination-out.  Its not a useful input, and
won't be seen from legitimate callers, but can crop up from bugs in the
continuation logic.

~Andrew

