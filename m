Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6752E1AEB7F
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 11:50:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPk6R-0007oA-Up; Sat, 18 Apr 2020 09:49:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8kJB=6C=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jPk6Q-0007o5-B2
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2020 09:49:34 +0000
X-Inumbo-ID: e82de844-8159-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e82de844-8159-11ea-b58d-bc764e2007e4;
 Sat, 18 Apr 2020 09:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7fymu2QlK+KyWYQjKNKQ+iYld+MrrAymt1eIIKU97D4=; b=NFqRTJaO2EzRlKtoqWPJd6D4fT
 X84Qic93SleF0b62T1i/GfwOLE7OEvaCVASz9Cepq79qfrWQhQ3pT9hLLRYkWGURirimiA/dLm0/W
 OaA3dxtaitmvsbhxL0PtH0EGMGwWgpQ43aP3ngxFCsyXblT9mebTfdmfBjzWGVdoI70c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPk6N-0005xw-UK; Sat, 18 Apr 2020 09:49:31 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPk6N-0001ZI-Mi; Sat, 18 Apr 2020 09:49:31 +0000
Subject: Re: [PATCH][RESEND] xen/arm: vgic-v3: fix GICD_ISACTIVER range
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <20200417221609.19928-1-sstabellini@kernel.org>
 <CAJ=z9a2yCLfOGChD8YL3K7H50spGyifcpeLq_dz_T7aFV8VGQQ@mail.gmail.com>
 <alpine.DEB.2.21.2004171600580.32540@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <aa8013f5-2209-ed0d-6ef4-e6a195bff75a@xen.org>
Date: Sat, 18 Apr 2020 10:49:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004171600580.32540@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 18/04/2020 00:12, Stefano Stabellini wrote:
> On Fri, 17 Apr 2020, Julien Grall wrote:
>> Hi,
>>
>> The title claim this is a resend, but this is actually not the latest
>> version of this patch. Can you explain why you decided to use v1
>> rather than v2?
> 
> Because v2 added a printk for every read, and I thought you only wanted
> the range fix. Also, the printk is not a "warn once" so after the
> discussion where it became apparent that the register can be read many
> times, it sounded undesirable.

You previously mentionned that you will use Peng's patch. From my 
perspective, this meant you are using the latest version of a patch not 
a previous one.

So this was a bit of a surprised to me.

> 
> Nonetheless I don't have a strong preference between the two. If you
> prefer v2 it is here:
> 
> https://marc.info/?l=xen-devel&m=157440872522065
I understand the "warn" issue but we did agree with it back then. I am 
ok to drop it. However, may I request to be more forthcoming in your 
patch in the future?

For instance in this case, this a link to the original patch and an 
explanation why you selected v1 would have been really useful.

> 
> Do you need me to resent it? If it is OK for you as-is, you can give
> your ack here, and I'll go ahead and commit it.
> 
> 
>> On Fri, 17 Apr 2020 at 23:16, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> The end should be GICD_ISACTIVERN not GICD_ISACTIVER.
>>>
>>> (See https://marc.info/?l=xen-devel&m=158527653730795 for a discussion on
>>> what it would take to implement GICD_ISACTIVER/GICD_ICACTIVER properly.)
>>>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> I don't think you can be at the same time an author of the patch and a
>> reviewer. Otherwise, I could review my own patch ;).
> 
> Yeah ... that was not the intention. I changed the commit message so I
> had to add my signed-off-by for copyright reasons.
> At the same time I
> reviewed it even before changing the commit message so I added the
> reviewed-by. I agree it looks kind of weird.

I don't feel this should go as-is. It is not clear in the commit message 
the changes you did and could lead confusion once merged. One may think 
you reviewed your own patch.

In general when I tweak a commit message, I will not add my 
signed-off-by but just add [julieng: Tweak commit message] above my 
reviewed-by/acked-by tag.

Alternatively, you can remove your reviewed-by and let another 
maintainer reviewing it.

I will let you decide your preference and resend the patch appropriately.

Cheers,

-- 
Julien Grall

