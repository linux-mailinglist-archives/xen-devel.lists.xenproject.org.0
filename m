Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5908F339879
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 21:37:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97329.184893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKoX2-0006um-7p; Fri, 12 Mar 2021 20:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97329.184893; Fri, 12 Mar 2021 20:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKoX2-0006uN-4b; Fri, 12 Mar 2021 20:37:12 +0000
Received: by outflank-mailman (input) for mailman id 97329;
 Fri, 12 Mar 2021 20:37:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=egQD=IK=lunn.ch=andrew@srs-us1.protection.inumbo.net>)
 id 1lKoX0-0006uI-9l
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 20:37:10 +0000
Received: from vps0.lunn.ch (unknown [185.16.172.187])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78857b94-a625-426a-92c8-f35cd35329d5;
 Fri, 12 Mar 2021 20:37:09 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lKoWp-00AaIe-Fb; Fri, 12 Mar 2021 21:36:59 +0100
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
X-Inumbo-ID: 78857b94-a625-426a-92c8-f35cd35329d5
Date: Fri, 12 Mar 2021 21:36:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Hsu, Chiahao" <andyhsu@amazon.com>
Cc: netdev@vger.kernel.org, wei.liu@kernel.org, paul@xen.org,
	davem@davemloft.net, kuba@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable
 ctrl-ring
Message-ID: <YEvQ6z5WFf+F4mdc@lunn.ch>
References: <20210311225944.24198-1-andyhsu@amazon.com>
 <YEuAKNyU6Hma39dN@lunn.ch>
 <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>

On Fri, Mar 12, 2021 at 04:18:02PM +0100, Hsu, Chiahao wrote:
> 
> Andrew Lunn 於 2021/3/12 15:52 寫道:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On Thu, Mar 11, 2021 at 10:59:44PM +0000, ChiaHao Hsu wrote:
> > > In order to support live migration of guests between kernels
> > > that do and do not support 'feature-ctrl-ring', we add a
> > > module parameter that allows the feature to be disabled
> > > at run time, instead of using hardcode value.
> > > The default value is enable.
> > Hi ChiaHao
> > 
> > There is a general dislike for module parameters. What other mechanisms
> > have you looked at? Would an ethtool private flag work?
> > 
> >       Andrew
> 
> 
> Hi Andrew,
> 
> I can survey other mechanisms, however before I start doing that,
> 
> could you share more details about what the problem is with using module
> parameters? thanks.

It is not very user friendly. No two kernel modules use the same
module parameters. Often you see the same name, but different
meaning. There is poor documentation, you often need to read the
kernel sources it figure out what it does, etc.

Ideally, you want a mechanism which is shared by multiple drivers and
is well documented.

Does virtio have the same problems? What about VmWare? HyperV? Could
you make a generic solution which works for all these technologies?
Is this just a networking problem? Or does disk, graphics etc, need
something similar?

    Andrew

