Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7032347550A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 10:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247265.426326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxQSz-00034m-Mh; Wed, 15 Dec 2021 09:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247265.426326; Wed, 15 Dec 2021 09:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxQSz-00032L-Je; Wed, 15 Dec 2021 09:20:53 +0000
Received: by outflank-mailman (input) for mailman id 247265;
 Wed, 15 Dec 2021 09:20:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxQSx-00032C-Ux
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 09:20:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxQSt-00085a-PN; Wed, 15 Dec 2021 09:20:47 +0000
Received: from [54.239.6.190] (helo=[10.85.97.145])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxQSt-0002o7-Ig; Wed, 15 Dec 2021 09:20:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=OCQYv43R9XULZPs9AF1DXysbDDo+UclFveHYvBtLyxA=; b=mQgzMWgqd7YuUXGq3RlD/2SYwm
	aNnIc8OfI83iDq79CGekBtJ0yez+j1Yg6pnZKD7Sap9su2Bn4idtCqfJzCqV7Si4L0+ZRDEit9q1T
	C1fNn2Yo4I3FslAcO8Ycy1xZux4suPWvQm7Ov3HF1u1fOeCI7DqLOyU9FDMpZD8T2BKk=;
Message-ID: <10dff775-9890-0ecb-6b71-f61893051ad2@xen.org>
Date: Wed, 15 Dec 2021 09:20:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 14/47] build: rename __LINKER__ to LINKER_SCRIPT
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-15-anthony.perard@citrix.com>
 <bcca6950-666f-63ea-9ea2-49f70d8a252a@xen.org>
 <cd636560-dcc3-1035-43cd-2813f5978333@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cd636560-dcc3-1035-43cd-2813f5978333@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 15/12/2021 07:49, Jan Beulich wrote:
> On 14.12.2021 18:05, Julien Grall wrote:
>> On 25/11/2021 13:39, Anthony PERARD wrote:
>>> For two reasons: this macro is used to generate a "linker script" and
>>> is not by the linker, and name starting with an underscore '_' are
>>> supposed to be reserved, so better avoid them when not needed.
>>
>> If that's the case, then shouldn't we also rename __ASSEMBLY__?
> 
> I'd rather not - unlike __LINKER__ (afaict at least) __ASSEMBLY__

I can't remember where I took __LINKER__ from.

> is a commonly used identifier (which we've actually inherited from
> Linux)

Fair enough.

Cheers,

-- 
Julien Grall

