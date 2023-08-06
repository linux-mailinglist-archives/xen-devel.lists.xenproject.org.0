Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460C57715D0
	for <lists+xen-devel@lfdr.de>; Sun,  6 Aug 2023 17:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577710.904701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSfUA-0000po-0n; Sun, 06 Aug 2023 15:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577710.904701; Sun, 06 Aug 2023 15:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSfU9-0000ml-Tp; Sun, 06 Aug 2023 15:16:01 +0000
Received: by outflank-mailman (input) for mailman id 577710;
 Sun, 06 Aug 2023 15:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/He2=DX=netrider.rowland.org=stern+64c0f95a@srs-se1.protection.inumbo.net>)
 id 1qSfU8-0000mf-Pn
 for xen-devel@lists.xenproject.org; Sun, 06 Aug 2023 15:16:00 +0000
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by se1-gles-flk1.inumbo.com (Halon) with SMTP
 id 226247e7-346c-11ee-8613-37d641c3527e;
 Sun, 06 Aug 2023 17:15:54 +0200 (CEST)
Received: (qmail 96132 invoked by uid 1000); 6 Aug 2023 11:15:51 -0400
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
X-Inumbo-ID: 226247e7-346c-11ee-8613-37d641c3527e
Date: Sun, 6 Aug 2023 11:15:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Zhang Shurong <zhang_shurong@foxmail.com>, jgross@suse.com,
  xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen: fix potential shift out-of-bounds in
 xenhcd_hub_control()
Message-ID: <3481a644-1648-4fa9-86eb-2a0b86b8f47a@rowland.harvard.edu>
References: <tencent_15DD79B42AD8A0D64A7CDC24D4FE6C85800A@qq.com>
 <2023062628-shame-ebook-56f2@gregkh>
 <4825193.GXAFRqVoOG@localhost.localdomain>
 <tencent_942CC5C35E410E3545C2E386BE566B8B1405@qq.com>
 <2023080659-turban-exemption-1196@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2023080659-turban-exemption-1196@gregkh>

On Sun, Aug 06, 2023 at 04:27:27PM +0200, Greg KH wrote:
> On Sun, Aug 06, 2023 at 10:11:43PM +0800, Zhang Shurong wrote:
> > 在 2023年7月1日星期六 CST 下午11:51:43，Zhang Shurong 写道：
> > > 在 2023年6月26日星期一 CST 下午1:52:02，您写道：
> > > 
> > > > On Mon, Jun 26, 2023 at 07:48:05AM +0200, Jan Beulich wrote:
> > > > > On 25.06.2023 18:42, Zhang Shurong wrote:
> > > > > > --- a/drivers/usb/host/xen-hcd.c
> > > > > > +++ b/drivers/usb/host/xen-hcd.c
> > > > > > @@ -456,6 +456,8 @@ static int xenhcd_hub_control(struct usb_hcd *hcd,
> > > > > > __u16 typeReq, __u16 wValue,> >
> > > > > > 
> > > > > >  			info->ports[wIndex - 1].c_connection =
> > > 
> > > false;
> > > 
> > > > > >  			fallthrough;
> > > > > >  		
> > > > > >  		default:
> > > > > > +			if (wValue >= 32)
> > > > > > +				goto error;
> > > > > > 
> > > > > >  			info->ports[wIndex - 1].status &= ~(1
> > > 
> > > << wValue);
> > > 
> > > > > Even 31 is out of bounds (as in: UB) as long as it's 1 here rather
> > > > > than 1u.
> > > > 
> > > > Why isn't the caller fixed so this type of value could never be passed
> > > > to the hub_control callback?
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > 
> > > Although I'm not knowledgeable about the USB subsystem, I've observed that
> > > not all driver code that implements hub_control callback performs a shift
> > > operation on wValue, and not all shift operations among them cause
> > > problems. Therefore, I've decided to fix this issue within each driver
> > > itself.
> > > 
> > > For example, in r8a66597_hub_control, it will first check whether wValue is
> > > valid (always < 31) before the shift operation. In case of an invalid
> > > number, the code would execute the error branch instead of the shift
> > > operation.
> > > 
> > > switch (wValue) {
> > > case USB_PORT_FEAT_ENABLE:
> > > 	rh->port &= ~USB_PORT_STAT_POWER;
> > > 	break;
> > > case USB_PORT_FEAT_SUSPEND:
> > > 	break;
> > > case USB_PORT_FEAT_POWER:
> > > 	r8a66597_port_power(r8a66597, port, 0);
> > > 	break;
> > > case USB_PORT_FEAT_C_ENABLE:
> > > case USB_PORT_FEAT_C_SUSPEND:
> > > case USB_PORT_FEAT_C_CONNECTION:
> > > case USB_PORT_FEAT_C_OVER_CURRENT:
> > > case USB_PORT_FEAT_C_RESET:
> > > 	break;
> > > default:
> > > 	goto error;
> > > }
> > > rh->port &= ~(1 << wValue);
> > 
> > Hi there. I apologize for reaching out once more. I'm feeling a bit puzzled 
> > about what my next step should be. I'm unsure whether I should rewrite this 
> > patch or attempt to address the issue at the caller level.
> 
> Try addressing it at the caller level first please.  If that somehow
> does not work, then we will take a patch series that fixes all of the
> host controller drivers at once.

It's not feasible to fix all the callers, because the calls can come 
from userspace via usbfs.

Alan Stern

