Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2C94C2760
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 10:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278057.475151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNA03-0000cS-OF; Thu, 24 Feb 2022 09:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278057.475151; Thu, 24 Feb 2022 09:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNA03-0000ac-Ky; Thu, 24 Feb 2022 09:01:23 +0000
Received: by outflank-mailman (input) for mailman id 278057;
 Thu, 24 Feb 2022 09:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x4ms=TH=ipxe.org=mcb30@srs-se1.protection.inumbo.net>)
 id 1nNA02-0000aW-4m
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 09:01:22 +0000
Received: from blyat.fensystems.co.uk (blyat.fensystems.co.uk [54.246.183.96])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 550cbd1d-9550-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 10:01:20 +0100 (CET)
Received: from pudding.home (unknown
 [IPv6:2a00:23c6:5486:8700:eaa7:4ea6:88e4:6f0e])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 314E643912;
 Thu, 24 Feb 2022 09:01:17 +0000 (UTC)
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
X-Inumbo-ID: 550cbd1d-9550-11ec-8539-5f4723681683
Subject: Re: [PATCH v2 2/2] Revert "xen-netback: Check for hotplug-status
 existence before watching"
To: paul@xen.org, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 "moderated list:XEN NETWORK BACKEND DRIVER"
 <xen-devel@lists.xenproject.org>,
 "open list:XEN NETWORK BACKEND DRIVER" <netdev@vger.kernel.org>
References: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
 <20220222001817.2264967-2-marmarek@invisiblethingslab.com>
 <d9969551-77ca-fda7-b30a-da5d9e1dfcd6@gmail.com>
From: Michael Brown <mcb30@ipxe.org>
Message-ID: <a10683f1-59ef-93e1-150a-f755bf470602@ipxe.org>
Date: Thu, 24 Feb 2022 09:01:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d9969551-77ca-fda7-b30a-da5d9e1dfcd6@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	blyat.fensystems.co.uk

On 24/02/2022 07:56, Durrant, Paul wrote:
> On 22/02/2022 00:18, Marek Marczykowski-Górecki wrote:
>> This reverts commit 2afeec08ab5c86ae21952151f726bfe184f6b23d.
>>
>> The reasoning in the commit was wrong - the code expected to setup the
>> watch even if 'hotplug-status' didn't exist. In fact, it relied on the
>> watch being fired the first time - to check if maybe 'hotplug-status' is
>> already set to 'connected'. Not registering a watch for non-existing
>> path (which is the case if hotplug script hasn't been executed yet),
>> made the backend not waiting for the hotplug script to execute. This in
>> turns, made the netfront think the interface is fully operational, while
>> in fact it was not (the vif interface on xen-netback side might not be
>> configured yet).
>>
>> This was a workaround for 'hotplug-status' erroneously being removed.
>> But since that is reverted now, the workaround is not necessary either.
>>
>> More discussion at
>> https://lore.kernel.org/xen-devel/afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org/T/#u 
>>
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Marek Marczykowski-Górecki 
>> <marmarek@invisiblethingslab.com>
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

In conjunction with patch 1/2 (which reverts the patch that caused the 
original problem):

Reviewed-by: Michael Brown <mbrown@fensystems.co.uk>

Thanks,

Michael


