Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A12A05C1
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 13:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15797.38959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYTq1-0007iu-HL; Fri, 30 Oct 2020 12:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15797.38959; Fri, 30 Oct 2020 12:49:01 +0000
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
	id 1kYTq1-0007iV-E1; Fri, 30 Oct 2020 12:49:01 +0000
Received: by outflank-mailman (input) for mailman id 15797;
 Fri, 30 Oct 2020 12:48:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYTpz-0007iN-TZ
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:48:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb1da06d-fac9-4217-8190-94c2c1452d5f;
 Fri, 30 Oct 2020 12:48:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F576ACF1;
 Fri, 30 Oct 2020 12:48:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYTpz-0007iN-TZ
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:48:59 +0000
X-Inumbo-ID: bb1da06d-fac9-4217-8190-94c2c1452d5f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bb1da06d-fac9-4217-8190-94c2c1452d5f;
	Fri, 30 Oct 2020 12:48:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604062133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stJsz8pcnbLkb/mKwROM89PQ6yuqery6EnfKrVSpJHY=;
	b=o1Wb9dFJ33ANRTZ6QLIwhoEOchP8mrEMEnDVi+N4C4ng7GOogMfiX2FOAxLInsRz5XVTDq
	eK50immDJSzmcHBhxfZRD4BHdWnVMYFOQ0BVB0MUScxHfjftz4pBFN2s8UnZVexVrsuI0R
	8sFeM+LU0YgJTE1csYjj7DcjqIxPxX8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8F576ACF1;
	Fri, 30 Oct 2020 12:48:53 +0000 (UTC)
Subject: Re: [PATCH v1 1/2] No insert of the build timestamp into the x86 xen
 efi binary
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1603725003.git.frederic.pierret@qubes-os.org>
 <64fc67bc2227d6cf92e079228c9f8d2d6404b001.1603725003.git.frederic.pierret@qubes-os.org>
 <93b0b06e-cb73-66eb-3535-e7ab2ca60bf8@suse.com>
 <20201030122319.GA16953@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b278993-08bb-7ad2-2dfd-743987a9fd6f@suse.com>
Date: Fri, 30 Oct 2020 13:48:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201030122319.GA16953@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.10.2020 13:23, Marek Marczykowski-Górecki wrote:
> On Fri, Oct 30, 2020 at 01:08:44PM +0100, Jan Beulich wrote:
>> On 30.10.2020 13:03, Frédéric Pierret (fepitre) wrote:
>>
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -170,6 +170,7 @@ EFI_LDFLAGS += --major-image-version=$(XEN_VERSION)
>>>  EFI_LDFLAGS += --minor-image-version=$(XEN_SUBVERSION)
>>>  EFI_LDFLAGS += --major-os-version=2 --minor-os-version=0
>>>  EFI_LDFLAGS += --major-subsystem-version=2 --minor-subsystem-version=0
>>> +EFI_LDFLAGS += --no-insert-timestamp
>>
>> Generally I prefer binaries to carry timestamps, when they are
>> intended to do so (i.e. when they have a respective field). So
>> I think if no timestamp is wanted, it should be as an option
>> (not sure about the default).
> 
> What about setting it to the SOURCE_DATE_EPOCH[1] variable value, if
> present? Of course if there is an option to set explicit timestamp
> value.
> 
> [1] https://reproducible-builds.org/docs/source-date-epoch/

Why not.

>> This said, I didn't think time stamps got meaningfully in the
>> way of reproducible builds - ignoring the minor differences
>> cause by them, especially when they sit at well known offsets
>> in the binaries, shouldn't be a big deal.
> 
> It is a big deal. There is a huge difference between running sha256sum
> (or your other favorite hash) on two build artifacts, and using a
> specialized tool/script to compare each file separately. Note the
> xen.efi may be buried very deep in the thing you compare, for example
> inside deb/rpm and then ISO image (installation image), at which point
> it's far from "they sit at well known offsets".

If you care about checking images / blobs where binaries with time
stamps are merely constituent parts, why not strip the time stamps
at the time of creation of those images / blobs (or as a minor
intermediate step, in case you want to e.g. record the hashes for
later reference)?

Jan

