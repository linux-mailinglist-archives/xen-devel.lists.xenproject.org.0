Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FC62FEC8D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 15:02:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72049.129468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2aXe-00046c-Sp; Thu, 21 Jan 2021 14:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72049.129468; Thu, 21 Jan 2021 14:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2aXe-00046G-Pn; Thu, 21 Jan 2021 14:02:30 +0000
Received: by outflank-mailman (input) for mailman id 72049;
 Thu, 21 Jan 2021 14:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2aXd-00046B-9N
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 14:02:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd162ac5-86db-4b3e-b4f8-a2def1f5e45f;
 Thu, 21 Jan 2021 14:02:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE981AF85;
 Thu, 21 Jan 2021 14:02:26 +0000 (UTC)
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
X-Inumbo-ID: cd162ac5-86db-4b3e-b4f8-a2def1f5e45f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611237747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hhE4YGz9J8mmKamg72GyNybiKH5/WhkcD6pfWgBnVFc=;
	b=QXkkvLKjhKOhmsYjln04F/bgpTFc7sCHQFo9XMxB0b3RkCYttO+po5kXA2/t9YdtydHq3x
	n8BWXEDUCLzGVfv2ghNYYpDeJi2ujdMunX23leckO6Obt2JoCXpLxX7Acg7SBEKmIVTdn1
	Ks0T2DoST761y2n0gm5WJdkOr4NBo3E=
Subject: Re: [PATCH V4 21/24] xen/ioreq: Make x86's send_invalidate_req()
 common
To: 'Oleksandr Tyshchenko' <olekstysh@gmail.com>
Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien.grall@arm.com>, paul@xen.org,
 xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-22-git-send-email-olekstysh@gmail.com>
 <00d401d6ed85$160a10c0$421e3240$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e478019-6505-a50a-8fe7-3ee9be7f0683@suse.com>
Date: Thu, 21 Jan 2021 15:02:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <00d401d6ed85$160a10c0$421e3240$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.01.2021 11:31, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Oleksandr Tyshchenko
>> Sent: 12 January 2021 21:52
>> To: xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Jan Beulich <jbeulich@suse.com>; Andrew
>> Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>;
>> George Dunlap <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Julien Grall
>> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Paul Durrant <paul@xen.org>; Julien
>> Grall <julien.grall@arm.com>
>> Subject: [PATCH V4 21/24] xen/ioreq: Make x86's send_invalidate_req() common
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> As the IOREQ is a common feature now and we also need to
>> invalidate qemu/demu mapcache on Arm when the required condition
>> occurs this patch moves this function to the common code
>> (and remames it to ioreq_signal_mapcache_invalidate).
>> This patch also moves per-domain qemu_mapcache_invalidate
>> variable out of the arch sub-struct (and drops "qemu" prefix).
>>
>> We don't put this variable inside the #ifdef CONFIG_IOREQ_SERVER
>> at the end of struct domain, but in the hole next to the group
>> of 5 bools further up which is more efficient.
>>
>> The subsequent patch will add mapcache invalidation handling on Arm.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Applicable parts
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

