Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF97DDFB0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 11:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626378.976621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy8iI-00014a-Br; Wed, 01 Nov 2023 10:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626378.976621; Wed, 01 Nov 2023 10:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy8iI-00012K-9D; Wed, 01 Nov 2023 10:44:42 +0000
Received: by outflank-mailman (input) for mailman id 626378;
 Wed, 01 Nov 2023 10:44:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qy8iG-00012E-NJ
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 10:44:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qy8iF-0006Fa-S0; Wed, 01 Nov 2023 10:44:39 +0000
Received: from [15.248.3.7] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qy8iF-0002LJ-Jt; Wed, 01 Nov 2023 10:44:39 +0000
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
	bh=ccAFXGKkqQK/mtlIpXLVY5okZS+iVf0F6ViqoWsx61o=; b=ddvx19nGD5EnfN9RqdQWx0A8Vd
	56vbeSS4+z4mS3aH9oqubW4l0EUdFAXQKTV76cfDFpOGQRhY2TXg8xj129y2mquYEBQFZtwIICbzI
	eo0daV7D3pLcFelCZeQj57X4iBTU0KN/eALgSeWorUWO72jVIGxtF1d35wXzP78oPQRo=;
Message-ID: <0d94c15f-e65b-42cd-b57b-f524179520c7@xen.org>
Date: Wed, 1 Nov 2023 10:44:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/29] tools/xenstored: rename xenbus_evtchn()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-19-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231101093325.30302-19-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2023 09:33, Juergen Gross wrote:
> Rename the xenbus_evtchn() function to get_xenbus_evtchn() in order to
> avoid two externally visible symbols with the same name when Xenstore-
> stubdom is being built with a Mini-OS with CONFIG_XENBUS set.
This works right now, but what guarantee us that Mini-OS will not change 
other symbols and clash with the one provided by Xenstored again?

Furthermore, technically, this is a problem for all the other software 
linked with Mini-OS. So wouldn't it be better to modify the Mini-OS 
build system to prefix all the symbols of the linked binary (here 
Xenstored)?

Cheers,

-- 
Julien Grall

