Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A595268808
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:13:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkXo-0005t3-LE; Mon, 14 Sep 2020 09:13:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LHiq=CX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kHkXn-0005sy-47
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:13:03 +0000
X-Inumbo-ID: a26737d8-6605-4eb0-a1e0-bf954196ae3e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a26737d8-6605-4eb0-a1e0-bf954196ae3e;
 Mon, 14 Sep 2020 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=IuMWCAoA0XqTXXhvDeAQTsqVj8dLFHN1iIZTVggPNq8=; b=ZF6VH8VeHdfWg1Pv0BFbIDTs2d
 TXU7QAphl7F8NTt1ztyjDcI0XNrJcaITQIjKF3iu2fUph89ihmoeneM80HNy2bwNa8vh/ioWw9XTu
 2BRiW+AbxWCYVpR2PridjnQqavausCHHGwLEj1C1P6bZykGT/7il+ziFPW4NUU/M2/a0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kHkXX-0001aZ-TX; Mon, 14 Sep 2020 09:12:47 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kHkXX-0003IP-Jn; Mon, 14 Sep 2020 09:12:47 +0000
Subject: Re: Adopting the Linux Kernel Memory Model in Xen?
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <1bc70974-2efb-2e73-34bf-bdd3c1d0ef96@xen.org>
 <58ab227d-4899-4dd2-de49-b5cd1d449f94@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <281673e0-4694-4900-5095-8215c4d11fd2@xen.org>
Date: Mon, 14 Sep 2020 10:12:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <58ab227d-4899-4dd2-de49-b5cd1d449f94@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

On 11/09/2020 20:53, Andrew Cooper wrote:
> On 11/09/2020 17:33, Julien Grall wrote:
>> Hi all,
>>
>> At the moment, Xen doesn't have a formal memory model. Instead, we are
>> relying on intuitions. This can lead to heated discussion on what can
>> a processor/compiler do or not.
>>
>> We also have some helpers that nearly do the same (such as
>> {read,write}_atomic() vs ACCESS_ONCE()) with no clear understanding
>> where to use which.
>>
>> In the past few years, Linux community spent a lot of time to write
>> down their memory model and make the compiler communities aware of it
>> (see [1], [2]).
>>
>> There are a few reasons I can see for adopting LKMM:
>>     - Xen borrows a fair amount of code from Linux;
>>     - There are efforts to standardize it;
>>     - This will allow us to streamline the discussion.
>>
>> Any thoughts?
> 
> It might not be formally written down, but we inherited an old version
> of it from Linux directly, and memory-barriers.txt is often referred to,
> and I have fixed our helpers several times to not have a semantic
> difference vs Linux.
> 
> We even import some drivers verbatim, and they certainly are expecting
> to use LKMM.
> 
> 
> Memory ordering is a phenomenally complicated topic and getting it wrong
> usually results in very subtle memory corruption issues.  The Xen
> community does not have the expertise to invent something custom.  LKMM
> is already familiar to most people liable to contribute in areas where
> it is likely to matter.
> 
> I don't mind how we go about formally stating that we use LKMM, but as
> far as I'm concerned, we already use it, and any semantic deviation is a
> bug needing fixing in Xen.

Thank you for the input! My plan is to:
    - Create a brief document (maybe docs/memory-barrier.txt) explaing 
that we follow LKMM.
    - Look for existing differences in the helpers and sync them if needed.

Cheers,

-- 
Julien Grall

