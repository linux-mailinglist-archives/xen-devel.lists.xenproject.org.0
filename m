Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2187324B1DE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 11:14:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8geB-0004tI-5T; Thu, 20 Aug 2020 09:14:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bq9Y=B6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k8ge9-0004tD-0B
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 09:14:09 +0000
X-Inumbo-ID: 8af2b364-aa9d-4ec1-83aa-f238f9c11b6c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8af2b364-aa9d-4ec1-83aa-f238f9c11b6c;
 Thu, 20 Aug 2020 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=9VyQnzD8Wn0XDQzfITdRElPw0hwk1Fg7i9HBBhfJhM0=; b=2hfR0VhTm7paIrPHL0xyHuCcfb
 kAR5ssX3AGBsckdJB1uRVKZsSQY3ZVtzCCttisgvwfNBtpIANyMrOp+ZWdU7HBdB/BV1dwiY2JEj9
 6YuyA440B+1CyC/pLAVPCvo+RddLJ5Kont6PkjAq1X1TUxX8qIaZgutHxwsadUaCNtgo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8ge5-00073J-Q7; Thu, 20 Aug 2020 09:14:05 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8ge5-0003Bi-IE; Thu, 20 Aug 2020 09:14:05 +0000
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20200815172143.1327-1-julien@xen.org>
 <20200817092406.GO975@Air-de-Roger>
 <b620dc46-7446-a440-5fd2-fd1cc7f8ffa7@xen.org>
 <20200817103306.GA828@Air-de-Roger>
 <f8b9a884-79e3-bd9d-d7bc-94fb9ee9906d@xen.org>
 <20200817114730.GB828@Air-de-Roger>
 <67e0c0f1-d85f-ad4d-d6bb-cee3603962f4@xen.org>
 <0fc30c51-9a7b-6421-ecdf-dbdbb76480f7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7f37a386-d758-ac3e-c32b-f7bb1b523f52@xen.org>
Date: Thu, 20 Aug 2020 10:14:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0fc30c51-9a7b-6421-ecdf-dbdbb76480f7@suse.com>
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



On 19/08/2020 10:22, Jan Beulich wrote:
> On 17.08.2020 15:03, Julien Grall wrote:
>> On 17/08/2020 12:50, Roger Pau Monné wrote:
>>> On Mon, Aug 17, 2020 at 12:05:54PM +0100, Julien Grall wrote:
>>>> The only way I could see to make it work would be to use the same trick as
>>>> we do for {read, write}_atomic() (see asm-arm/atomic.h). We are using union
>>>> and void pointer to prevent explicit cast.
>>>
>>> I'm mostly worried about common code having assumed that cmpxchg
>>> does also handle 64bit sized parameters, and thus failing to use
>>> cmpxchg64 when required. I assume this is not much of a deal as then
>>> the Arm 32 build would fail, so it should be fairly easy to catch
>>> those.
>> FWIW, this is not very different to the existing approach. If one would
>> use cmpxchg() with 64-bit, then it would fail to compile.
> 
> A somewhat related question then: Do you really need both the
> guest_* and the non-guest variants? Limiting things to plain
> cmpxchg() would further reduce the risk of someone picking the
> wrong one without right away noticing the build issue on Arm32.
> For guest_cmpxchg{,64}() I think there's less of a risk.

For the IOREQ code, we will need the guest_* version that is built on 
top of the non-guest variant.

I would like at least consistency between the two variants. IOW, if we 
decide to use the name guest_cmpxchg64(), then I would like to use 
cmpxchg64().

I still need to explore the code generated by cmpxchg() if I include 
support for 64-bit.

Cheers,

-- 
Julien Grall

