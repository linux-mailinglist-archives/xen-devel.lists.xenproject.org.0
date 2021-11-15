Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB52451101
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 19:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226009.390433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmh8o-0006mt-G3; Mon, 15 Nov 2021 18:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226009.390433; Mon, 15 Nov 2021 18:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmh8o-0006l9-Cw; Mon, 15 Nov 2021 18:55:42 +0000
Received: by outflank-mailman (input) for mailman id 226009;
 Mon, 15 Nov 2021 18:55:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mmh8m-0006l3-26
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 18:55:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmh8k-0006rC-RC; Mon, 15 Nov 2021 18:55:38 +0000
Received: from [54.239.6.189] (helo=[192.168.10.237])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmh8k-0000wJ-L9; Mon, 15 Nov 2021 18:55:38 +0000
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
	bh=fwHkXMjWbDotTJgHDIt1lkTTSaQy7KYL8SDzLf3Nrs8=; b=Ic5L0C6pDV7cn6hNRTkNkIKYTN
	rxBvIFnp8WDjwa1Rv3G7ka2+eanFeqSswtF7prHsbrTS0qSEaY6/2UuqkBotYpHVN1It5T5QSbnoe
	lTUND2kyDikiHAKst/vOsG/flpnVd6QF71m1gqKbr/2mklu7sBehtICXybqTYdj6X7Ko=;
Message-ID: <57d10284-cbd0-2867-2c09-9f1f7824d938@xen.org>
Date: Mon, 15 Nov 2021 18:55:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [XEN][RFC PATCH v4 1/1] Update libfdt to v1.6.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com
References: <1636702040-116895-1-git-send-email-fnu.vikram@xilinx.com>
 <1636702040-116895-2-git-send-email-fnu.vikram@xilinx.com>
 <AE30D3B0-0863-465C-AFBC-8DEB28919A8A@arm.com>
 <alpine.DEB.2.22.394.2111121400280.1412361@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111121400280.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/11/2021 22:01, Stefano Stabellini wrote:
> On Fri, 12 Nov 2021, Luca Fancellu wrote:
>>> On 12 Nov 2021, at 07:27, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>>>
>>> Update libfdt to v1.6.1 of libfdt taken from git://github.com/dgibson/dtc.
>>> This update is done to support device tree overlays.
>>>
>>> A few minor changes are done to make it compatible with Xen:
>>>     fdt_overlay.c: overlay_fixup_phandle()
>>>
>>>         Replace strtoul() with simple_strtoul() as strtoul() is not available in
>>>         Xen lib and included lib.h.
>>>
>>>         Change char *endptr to const char *endptr. This change is required for
>>>         using simple_strtoul().
>>>
>>>     libfdt_env.h:
>>>         Remaining Xen changes to libfdt_env.h carried over from existing
>>>         libfdt (v1.4.0)
>>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>
>> I’ve also tested it on FVP and on a Juno board, starting few guests and it worked.
>>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Thanks Luca! The patch also passes the gitlab-ci tests and looks OK to
> me. I'll let Julien ack it as he was the one with a couple of comments
> before.

The next version addressed my comments. So:

Reviewed-by: Julien Grall <jgrall@amazon.com>

I have also queued the patch in a temporary branch for-next/4.17:

https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/for-next/4.17

The patch will land in staging when the tree re-opens.

Cheers,

-- 
Julien Grall

