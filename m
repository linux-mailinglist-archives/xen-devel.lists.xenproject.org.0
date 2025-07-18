Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7DCB09D68
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 10:11:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048143.1418431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucgAr-0002Yv-Te; Fri, 18 Jul 2025 08:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048143.1418431; Fri, 18 Jul 2025 08:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucgAr-0002XT-Qi; Fri, 18 Jul 2025 08:10:33 +0000
Received: by outflank-mailman (input) for mailman id 1048143;
 Fri, 18 Jul 2025 08:10:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ODAA=Z7=bounce.vates.tech=bounce-md_30504962.687a0174.v1-fd920aecd9e04b49b126fd14a70e068c@srs-se1.protection.inumbo.net>)
 id 1ucgAq-0002XN-ND
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 08:10:32 +0000
Received: from mail132-21.atl131.mandrillapp.com
 (mail132-21.atl131.mandrillapp.com [198.2.132.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab2a5647-63ae-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 10:10:30 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4bk2Xh5GJVz1XLF6s
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 08:10:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fd920aecd9e04b49b126fd14a70e068c; Fri, 18 Jul 2025 08:10:28 +0000
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
X-Inumbo-ID: ab2a5647-63ae-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752826228; x=1753096228;
	bh=9v3RvNn3og/vnGMjRNCHbK2EsjnkNsgZix1oMc/Rcns=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SgWoUij+h35XgWvzk4ZZNgJzu7QcKqzt2UuwFmFfTPu4lO0OXH9rTf9jsiz/oFPYz
	 ND/7LXizAQKsCVOdn5FacMBO3Ko41h8x3v2emjvBFkiljpGm+9ntB1nSHUvJJOAf/+
	 5h/vkI2DYSmDrWzMi2F5rBZpfx+VovfjODF0Ar5Z7o1cD335Nh7Jh1uSEgoFLVOWpy
	 dnPLKMdE63eCkGcluUt4AF4VgGXrR5/6zmhuHSgjGDykFohzXSXxWE0+7KgRFSTSCg
	 7aPH4JRrpbI867ATPRiqpS+v7kOaz8nMNOJG1d5Q5H2fxCy5EjiBzmp3/NTJll32QI
	 E5fofqiiZIgLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752826228; x=1753086728; i=anthoine.bourgeois@vates.tech;
	bh=9v3RvNn3og/vnGMjRNCHbK2EsjnkNsgZix1oMc/Rcns=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KAHN5M6Dkf32LI3IU1rnfS7m35aUHsqdzvOsrzciueBaVGaziil36DDHfpgaQJAlz
	 3Aq7aVYLnb7KY6XMLbRrqcNPpvZR52pY5/SrvMQ5fGqzC0x0B4ssFRr4YdIljzelNN
	 bInjm8Y5zypb3JEM4XjIIxV4U5zfGHROxsxWiD6GsGwYAov/n6XuUbBTDg9Vkymi00
	 mAwWCRAxlPDdBXl3cum4+p0G6wm1IMjVlD7+A7X+pTcMIamPSGzBXyIgW1ocnreIfx
	 yck9flQMAMf+dlYIBVNna+05JASz/DmdMnG38Mxc9rN9Q1QDv5cBRhQ6ae0PO/zGOg
	 fcsYG/bRKakbw==
From: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20xen/netfront:=20Fix=20TX=20response=20spurious=20interrupts?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752826227429
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Wei Liu" <wei.liu@kernel.org>, "Paul Durrant" <paul@xen.org>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, "Elliott Mitchell" <ehem+xen@m5p.com>
Message-Id: <aHoBcULQVVsbx6XO@mail.vates.tech>
References: <20250715160902.578844-2-anthoine.bourgeois@vates.tech> <20250717072951.3bc2122c@kernel.org>
In-Reply-To: <20250717072951.3bc2122c@kernel.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fd920aecd9e04b49b126fd14a70e068c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250718:md
Date: Fri, 18 Jul 2025 08:10:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 17, 2025 at 07:29:51AM -0700, Jakub Kicinski wrote:
>On Tue, 15 Jul 2025 16:11:29 +0000 Anthoine Bourgeois wrote:
>> Fixes: b27d47950e48 ("xen/netfront: harden netfront against event channel storms")
>
>Not entirely sure who you expect to apply this patch, but if networking
>then I wouldn't classify this is a fix. The "regression" happened 4
>years ago. And this patch doesn't seem to be tuning the logic added by
>the cited commit. I think this is an optimization, -next material, and
>therefore there should be no Fixes tag here. You can refer to the commit
>without the tag.

Ok, you're right the cited commit exacerbates a problem that was already
there before.
I will change this in v3.

>> @@ -849,9 +847,6 @@ static netdev_tx_t xennet_start_xmit(struct sk_buff *skb, struct net_device *dev
>>  	tx_stats->packets++;
>>  	u64_stats_update_end(&tx_stats->syncp);
>>
>> -	/* Note: It is not safe to access skb after xennet_tx_buf_gc()! */
>> -	xennet_tx_buf_gc(queue);
>> -
>>  	if (!netfront_tx_slot_available(queue))
>>  		netif_tx_stop_queue(netdev_get_tx_queue(dev, queue->id));
>
>I thought normally reaping completions from the Tx path is done
>to prevent the queue from filling up, when the device-generated
>completions are slow or the queue is short. I say "normally" but
>this is relatively a uncommon thing to do in networking.
>Maybe it's my lack of Xen knowledge but it would be good to add to
>the commit message why these calls where here in the first place.

Good to know how it should "normally" works, I'm not an expert.
The patch also has the advantage of standardizing the network driver
with other Xen PV drivers that do not have this reponse collection
outside of the interrupt handler.

As this part of the code is here since the driver was upsteamed and the
author no longer works on xen, I will do my best to add my guess on why
this code was there.

Regards,
Anthoine


Anthoine Bourgeois | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


