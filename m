Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A171B34E5E1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 12:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103405.197318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRC3V-000782-80; Tue, 30 Mar 2021 10:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103405.197318; Tue, 30 Mar 2021 10:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRC3V-00077h-4L; Tue, 30 Mar 2021 10:57:05 +0000
Received: by outflank-mailman (input) for mailman id 103405;
 Tue, 30 Mar 2021 10:57:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRC3U-00077K-7q
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 10:57:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c17fc19f-5d4e-4129-8a80-42b8e58aa92b;
 Tue, 30 Mar 2021 10:56:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14F14B256;
 Tue, 30 Mar 2021 10:56:59 +0000 (UTC)
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
X-Inumbo-ID: c17fc19f-5d4e-4129-8a80-42b8e58aa92b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617101819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fPs7C6K+03OGpQOFqswfldKu2ngL3N2nb6b2KWezE9s=;
	b=oKgrWNGrB2XEJ2xBiiTPJTdHzaC9nCkZX+LrbYHYdb+cM+1Ak7A+f8H9uaf/xzWXnBciGO
	085F2UOkWkewX+dD90D42PNmzy+5PNBt/FsD5gT6EBkYIlX4PAvIwGpUc4XlCCTcSHJZs/
	21N76RHcQZE3QkTp4GPuQZCoGM7AYp8=
Subject: Re: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd
 compression support
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
 <20210329161457.345360-3-george.dunlap@citrix.com>
 <CAJ=z9a0DxKKkLGMDK1nisVsefwE=8RQcD8M4vpOO1QopjzZtjw@mail.gmail.com>
 <87E259CB-2BB4-4BAE-9916-BE46584E0EF4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3fdba65d-3d23-f331-c04d-d70ed82f1df8@suse.com>
Date: Tue, 30 Mar 2021 12:56:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87E259CB-2BB4-4BAE-9916-BE46584E0EF4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.03.2021 12:08, George Dunlap wrote:
>> On Mar 29, 2021, at 7:54 PM, Julien Grall <julien.grall.oss@gmail.com> wrote:
>> On Mon, 29 Mar 2021 at 17:15, George Dunlap <george.dunlap@citrix.com> wrote:
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 8c89212f14..538eae611c 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>  - ARM SMMUv3 (Tech Preview)
>>>  - Intel Processor Trace support (Tech Preview)
>>>  - Named PCI devices for xl/libxl
>>> + - Support for zstd-compressed dom0 and domU kernels
>>
>> Looking at the log, the feature looks x86 only (at least the dom0 part).
> 
> Oh, interesting.  So what about the following?
> 
> - Support for zstd-compressed dom0 (x86) and domU kernels

Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

