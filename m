Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B45C773AD9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580010.908258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOGt-0001uu-3v; Tue, 08 Aug 2023 15:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580010.908258; Tue, 08 Aug 2023 15:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOGt-0001sA-0v; Tue, 08 Aug 2023 15:05:19 +0000
Received: by outflank-mailman (input) for mailman id 580010;
 Tue, 08 Aug 2023 15:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6aok=DZ=netrider.rowland.org=stern+64c0f95a@srs-se1.protection.inumbo.net>)
 id 1qTOGs-0001s4-Aj
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:05:18 +0000
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by se1-gles-sth1.inumbo.com (Halon) with SMTP
 id fa967014-35fc-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:05:15 +0200 (CEST)
Received: (qmail 161982 invoked by uid 1000); 8 Aug 2023 11:05:14 -0400
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
X-Inumbo-ID: fa967014-35fc-11ee-b280-6b7b168915f2
Date: Tue, 8 Aug 2023 11:05:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Zhang Shurong <zhang_shurong@foxmail.com>, jgross@suse.com,
  xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen: fix potential shift out-of-bounds in
 xenhcd_hub_control()
Message-ID: <ccb08027-6836-4207-969b-fd0cf63e9faf@rowland.harvard.edu>
References: <tencent_15DD79B42AD8A0D64A7CDC24D4FE6C85800A@qq.com>
 <2023062628-shame-ebook-56f2@gregkh>
 <4825193.GXAFRqVoOG@localhost.localdomain>
 <tencent_942CC5C35E410E3545C2E386BE566B8B1405@qq.com>
 <2023080659-turban-exemption-1196@gregkh>
 <3481a644-1648-4fa9-86eb-2a0b86b8f47a@rowland.harvard.edu>
 <2023080845-talisman-ravage-0b58@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2023080845-talisman-ravage-0b58@gregkh>

On Tue, Aug 08, 2023 at 10:26:38AM +0200, Greg KH wrote:
> On Sun, Aug 06, 2023 at 11:15:51AM -0400, Alan Stern wrote:
> > On Sun, Aug 06, 2023 at 04:27:27PM +0200, Greg KH wrote:
> > > On Sun, Aug 06, 2023 at 10:11:43PM +0800, Zhang Shurong wrote:
> > > > 在 2023年7月1日星期六 CST 下午11:51:43，Zhang Shurong 写道：
> > > > > 在 2023年6月26日星期一 CST 下午1:52:02，您写道：
> > > > > 
> > > > > > On Mon, Jun 26, 2023 at 07:48:05AM +0200, Jan Beulich wrote:
> > > > > > > On 25.06.2023 18:42, Zhang Shurong wrote:
> > > > > > > > --- a/drivers/usb/host/xen-hcd.c
> > > > > > > > +++ b/drivers/usb/host/xen-hcd.c
> > > > > > > > @@ -456,6 +456,8 @@ static int xenhcd_hub_control(struct usb_hcd *hcd,
> > > > > > > > __u16 typeReq, __u16 wValue,> >
> > > > > > > > 
> > > > > > > >  			info->ports[wIndex - 1].c_connection =
> > > > > 
> > > > > false;
> > > > > 
> > > > > > > >  			fallthrough;
> > > > > > > >  		
> > > > > > > >  		default:
> > > > > > > > +			if (wValue >= 32)
> > > > > > > > +				goto error;
> > > > > > > > 
> > > > > > > >  			info->ports[wIndex - 1].status &= ~(1
> > > > > 
> > > > > << wValue);
> > > > > 
> > > > > > > Even 31 is out of bounds (as in: UB) as long as it's 1 here rather
> > > > > > > than 1u.
> > > > > > 
> > > > > > Why isn't the caller fixed so this type of value could never be passed
> > > > > > to the hub_control callback?
> > > > > > 
> > > > > > thanks,
> > > > > > 
> > > > > > greg k-h
> > > > > 
> > > > > Although I'm not knowledgeable about the USB subsystem, I've observed that
> > > > > not all driver code that implements hub_control callback performs a shift
> > > > > operation on wValue, and not all shift operations among them cause
> > > > > problems. Therefore, I've decided to fix this issue within each driver
> > > > > itself.
> > > > > 
> > > > > For example, in r8a66597_hub_control, it will first check whether wValue is
> > > > > valid (always < 31) before the shift operation. In case of an invalid
> > > > > number, the code would execute the error branch instead of the shift
> > > > > operation.
> > > > > 
> > > > > switch (wValue) {
> > > > > case USB_PORT_FEAT_ENABLE:
> > > > > 	rh->port &= ~USB_PORT_STAT_POWER;
> > > > > 	break;
> > > > > case USB_PORT_FEAT_SUSPEND:
> > > > > 	break;
> > > > > case USB_PORT_FEAT_POWER:
> > > > > 	r8a66597_port_power(r8a66597, port, 0);
> > > > > 	break;
> > > > > case USB_PORT_FEAT_C_ENABLE:
> > > > > case USB_PORT_FEAT_C_SUSPEND:
> > > > > case USB_PORT_FEAT_C_CONNECTION:
> > > > > case USB_PORT_FEAT_C_OVER_CURRENT:
> > > > > case USB_PORT_FEAT_C_RESET:
> > > > > 	break;
> > > > > default:
> > > > > 	goto error;
> > > > > }
> > > > > rh->port &= ~(1 << wValue);
> > > > 
> > > > Hi there. I apologize for reaching out once more. I'm feeling a bit puzzled 
> > > > about what my next step should be. I'm unsure whether I should rewrite this 
> > > > patch or attempt to address the issue at the caller level.
> > > 
> > > Try addressing it at the caller level first please.  If that somehow
> > > does not work, then we will take a patch series that fixes all of the
> > > host controller drivers at once.
> > 
> > It's not feasible to fix all the callers, because the calls can come 
> > from userspace via usbfs.
> 
> It can?  Hm, that happens through the call in rh_call_control(), right?
> But there, we do a bunch of validation before calling hub_control() so
> why can't we do the same thing in that one place as well?  Making
> invalid requests from userspace should be disallowed (or we can catch
> this in the usbfs interface.)

Yes, we could filter these things out at either spot.

But that's not the best approach.  The reason xen-hcd.c needs this 
change in the first place is because the code is buggy, and the change 
does not fix the real bug.

Section 11.24.2.2 (CLEAR PORT FEATURE) of the USB-2 spec says:

        It is a Request Error if wValue is not a feature selector listed 
        in Table 11-17, if wIndex specifies a port that does not exist,
        or if wLength is not as specified above.

xenhcd_hub_control() validates wIndex but not wValue.  (In theory we 
should validate wLength also, but in practice it doesn't matter.)  
Here's an example from the code:

	case ClearPortFeature:
		if (!wIndex || wIndex > ports)
			goto error;

		switch (wValue) {
		case USB_PORT_FEAT_SUSPEND:
			xenhcd_rhport_resume(info, wIndex);
			break;
		case USB_PORT_FEAT_POWER:
			xenhcd_rhport_power_off(info, wIndex);
			break;
		case USB_PORT_FEAT_ENABLE:
			xenhcd_rhport_disable(info, wIndex);
			break;
		case USB_PORT_FEAT_C_CONNECTION:
			info->ports[wIndex - 1].c_connection = false;
		default:
			info->ports[wIndex - 1].status &= ~(1 << wValue);

This line is wrong, and not just because wValue might be too large.  The 
only status bits that should be manipulated are the ones controlling 
features the driver actually implements.  Not random bits passed in by 
the caller!

			break;
		}
		break;

So here's what the code _should_ look like (just the end part):

		case USB_PORT_FEAT_C_CONNECTION:
			info->ports[wIndex - 1].c_connection = false;
			fallthrough;
		case USB_PORT_FEAT_C_RESET:
		case USB_PORT_FEAT_C_ENABLE:
		case USB_PORT_FEAT_C_SUSPEND:
			info->ports[wIndex - 1].status &= ~(1 << wValue);
			break;
		default:
			goto error;
		}
		break;

(Perhaps also include USB_PORT_FEAT_C_OVER_CURRENT and 
USB_PORT_FEAT_INDICATOR, depending on whether the driver supports them.)

This way the driver does the right thing in all cases and it never runs 
the risk of a shift amount being too big.  The other HCD drivers are 
written this way.

Similar reasoning applies to the SetPortFeature section.

Alan Stern

