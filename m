Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ECC379761
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 21:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125501.236248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgBF7-0003vm-VB; Mon, 10 May 2021 19:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125501.236248; Mon, 10 May 2021 19:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgBF7-0003tC-S5; Mon, 10 May 2021 19:07:01 +0000
Received: by outflank-mailman (input) for mailman id 125501;
 Mon, 10 May 2021 19:06:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fIyG=KF=fensystems.co.uk=mbrown@srs-us1.protection.inumbo.net>)
 id 1lgBF5-0003t6-JD
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 19:06:59 +0000
Received: from blyat.fensystems.co.uk (unknown [54.246.183.96])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 516b5dd3-a205-40d1-b485-3b4065e6ffe0;
 Mon, 10 May 2021 19:06:58 +0000 (UTC)
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5495:5e00:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id CBAA7442C4;
 Mon, 10 May 2021 19:06:55 +0000 (UTC)
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
X-Inumbo-ID: 516b5dd3-a205-40d1-b485-3b4065e6ffe0
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: paul@xen.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 wei.liu@kernel.org, pdurrant@amazon.com
References: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
 <20210413152512.903750-1-mbrown@fensystems.co.uk> <YJl8IC7EbXKpARWL@mail-itl>
 <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
 <YJmBDpqQ12ZBGf58@mail-itl>
From: Michael Brown <mbrown@fensystems.co.uk>
Message-ID: <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>
Date: Mon, 10 May 2021 20:06:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YJmBDpqQ12ZBGf58@mail-itl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	blyat.fensystems.co.uk

On 10/05/2021 19:53, Marek Marczykowski-Górecki wrote:
> On Mon, May 10, 2021 at 07:47:01PM +0100, Michael Brown wrote:
>> That doesn't sound plausible to me.  In the setup as you describe, how is
>> the kernel expected to differentiate between "hotplug script has not yet
>> created the node" and "hotplug script does not exist and will therefore
>> never create any node"?
> 
> Is the later valid at all? From what I can see in the toolstack, it
> always sets some hotplug script (if not specified explicitly - then
> "vif-bridge"),

I don't see any definitive documentation around that so I can't answer 
for sure.  It's probably best to let one of the Xen guys answer that.

If you have a suggested patch, I'm happy to test that it doesn't 
reintroduce the regression bug that was fixed by this commit.

Michael

