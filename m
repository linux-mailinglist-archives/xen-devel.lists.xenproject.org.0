Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81AD475557
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 10:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247295.426406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxQmH-0007oV-Ou; Wed, 15 Dec 2021 09:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247295.426406; Wed, 15 Dec 2021 09:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxQmH-0007lW-Lb; Wed, 15 Dec 2021 09:40:49 +0000
Received: by outflank-mailman (input) for mailman id 247295;
 Wed, 15 Dec 2021 09:40:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxQmG-0007lK-73
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 09:40:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxQmF-0008Sv-OG; Wed, 15 Dec 2021 09:40:47 +0000
Received: from [54.239.6.190] (helo=[10.85.97.145])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxQmF-0004Tr-Gi; Wed, 15 Dec 2021 09:40:47 +0000
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
	bh=QTqsXTRgholLSboenw5XLI8MHw4DOIR4Wf5YAshPVqE=; b=bVtQ63DoKIQUZ9MN5kDyhw9weW
	QISoMVc+7QWWM39Y7mIX3D33oCWABQ5CFGy56mZp5lkM/62sqBs8+vQ7SiS4gCfxs9GXogVbqg/AL
	MymSkQT7UdoQg9Efj2vfuu5DeLeb61xrgmxBKUXFIJaxj+Jm08ae9OEZodiAghMhCybw=;
Message-ID: <89d039a4-bf48-cc2b-5055-15441af2090a@xen.org>
Date: Wed, 15 Dec 2021 09:40:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3 01/13] xen: move do_vcpu_op() to arch specific code
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-2-jgross@suse.com>
 <1ce9aa8a-adc2-18cb-2c06-8a8a63c3b774@xen.org>
 <3af8127b-36b6-b810-3060-313736ce1735@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3af8127b-36b6-b810-3060-313736ce1735@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 15/12/2021 07:12, Juergen Gross wrote:
> On 14.12.21 18:21, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 08/12/2021 15:55, Juergen Gross wrote:
>>> Today Arm is using another entry point for the vcpu_op hypercall as
>>
>> NIT: The 'as' doesn't sound right here. Did you mean 'compare to'?
> 
> Hmm, it should even be "different" instead of "another". And then it
> should be:
> 
>    The entry point used for the vcpu_op hypercall on Arm is different
>    from the one on x86 today.

LGTM.

Cheers,

-- 
Julien Grall

