Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A06379728
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 20:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125480.236198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgAvr-00081L-HT; Mon, 10 May 2021 18:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125480.236198; Mon, 10 May 2021 18:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgAvr-0007yY-Di; Mon, 10 May 2021 18:47:07 +0000
Received: by outflank-mailman (input) for mailman id 125480;
 Mon, 10 May 2021 18:47:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fIyG=KF=fensystems.co.uk=mbrown@srs-us1.protection.inumbo.net>)
 id 1lgAvq-0007yS-4R
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 18:47:06 +0000
Received: from blyat.fensystems.co.uk (unknown [54.246.183.96])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d65bd89e-cb0d-4530-afa7-2193a1ccdd30;
 Mon, 10 May 2021 18:47:04 +0000 (UTC)
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5495:5e00:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 28319442C3;
 Mon, 10 May 2021 18:47:02 +0000 (UTC)
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
X-Inumbo-ID: d65bd89e-cb0d-4530-afa7-2193a1ccdd30
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: paul@xen.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 wei.liu@kernel.org, pdurrant@amazon.com
References: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
 <20210413152512.903750-1-mbrown@fensystems.co.uk> <YJl8IC7EbXKpARWL@mail-itl>
From: Michael Brown <mbrown@fensystems.co.uk>
Message-ID: <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
Date: Mon, 10 May 2021 19:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YJl8IC7EbXKpARWL@mail-itl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	blyat.fensystems.co.uk

On 10/05/2021 19:32, Marek Marczykowski-Górecki wrote:
> On Tue, Apr 13, 2021 at 04:25:12PM +0100, Michael Brown wrote:
>> The logic in connect() is currently written with the assumption that
>> xenbus_watch_pathfmt() will return an error for a node that does not
>> exist.  This assumption is incorrect: xenstore does allow a watch to
>> be registered for a nonexistent node (and will send notifications
>> should the node be subsequently created).
>>
>> As of commit 1f2565780 ("xen-netback: remove 'hotplug-status' once it
>> has served its purpose"), this leads to a failure when a domU
>> transitions into XenbusStateConnected more than once.  On the first
>> domU transition into Connected state, the "hotplug-status" node will
>> be deleted by the hotplug_status_changed() callback in dom0.  On the
>> second or subsequent domU transition into Connected state, the
>> hotplug_status_changed() callback will therefore never be invoked, and
>> so the backend will remain stuck in InitWait.
>>
>> This failure prevents scenarios such as reloading the xen-netfront
>> module within a domU, or booting a domU via iPXE.  There is
>> unfortunately no way for the domU to work around this dom0 bug.
>>
>> Fix by explicitly checking for existence of the "hotplug-status" node,
>> thereby creating the behaviour that was previously assumed to exist.
> 
> This change is wrong. The 'hotplug-status' node is created _only_ by a
> hotplug script and done so when it's executed. When kernel waits for
> hotplug script to be executed it waits for the node to _appear_, not
> _change_. So, this change basically made the kernel not waiting for the
> hotplug script at all.

That doesn't sound plausible to me.  In the setup as you describe, how 
is the kernel expected to differentiate between "hotplug script has not 
yet created the node" and "hotplug script does not exist and will 
therefore never create any node"?

Michael

