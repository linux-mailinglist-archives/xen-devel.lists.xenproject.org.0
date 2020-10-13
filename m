Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214D928D040
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6256.16682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSLKw-0002ef-8l; Tue, 13 Oct 2020 14:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6256.16682; Tue, 13 Oct 2020 14:31:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSLKw-0002eG-5f; Tue, 13 Oct 2020 14:31:34 +0000
Received: by outflank-mailman (input) for mailman id 6256;
 Tue, 13 Oct 2020 14:31:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COa4=DU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kSLKu-0002eB-Ve
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:31:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b06388ef-72c6-41c1-8d04-d86572adeab9;
 Tue, 13 Oct 2020 14:31:31 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=COa4=DU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kSLKu-0002eB-Ve
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:31:33 +0000
X-Inumbo-ID: b06388ef-72c6-41c1-8d04-d86572adeab9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b06388ef-72c6-41c1-8d04-d86572adeab9;
	Tue, 13 Oct 2020 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602599491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iDo8FB4WmMtlZfau0epF9uABoNlYLbVDVOagXTbSFWw=;
  b=ZnoGxfOFCB7IPx1An806voamNE2FSoVHbnGwJ4YIvPajfqMxTvAQRXsZ
   1k53takEcsHkdszKsX0i+/nphHekNh4AKL4rAvAFpgU1OS3a6jUhPxpYh
   jYYp5+lfqKP8ew4FEHH51cZl2c87AxXZuq4gzTJBTEb+ZV5Y7DkqG0EKo
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rJTEUAUpSIF3w8Y+dF/haT23n5jHUbv36bMw98Rv2kxrfE55nZe7EQmOP7dIwmdEyKNWMLA8n4
 Ssvw/Wr4mL0gLeiXzlXjGj2V2ADTLrZSbk7E7wG9EYuWJfbHrPkyrQkaqCrxvGAXgL+JlFvy2W
 H1pbU7FaazmR/KX/lDwSwmic6Qt3RFPyeEt13gasVSx1X569AXIBJiA88u2BFEznNQN3MvrN3z
 ZIPVxeuNsM6xoEIRyTO0geMBXwyZA5AfGY1Pffw/KKlNWmlJPApHhWRPMwxbmcUAaf7tJOgcI+
 rr8=
X-SBRS: 2.5
X-MesageID: 28897343
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,371,1596513600"; 
   d="scan'208";a="28897343"
Date: Tue, 13 Oct 2020 16:30:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 03/11] x86/vlapic: introduce an EOI callback mechanism
Message-ID: <20201013143028.GQ19254@Air-de-Roger>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-4-roger.pau@citrix.com>
 <a6863a90-584a-af21-4a0a-1b104b750978@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <a6863a90-584a-af21-4a0a-1b104b750978@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Fri, Oct 02, 2020 at 11:39:50AM +0200, Jan Beulich wrote:
> On 30.09.2020 12:41, Roger Pau Monne wrote:
> > Add a new vlapic_set_irq_callback helper in order to inject a vector
> > and set a callback to be executed when the guest performs the end of
> > interrupt acknowledgment.
> 
> On v1 I did ask
> 
> "One thing I don't understand at all for now is how these
>  callbacks are going to be re-instated after migration for
>  not-yet-EOIed interrupts."
> 
> Afaics I didn't get an answer on this.

Oh sorry, I remember your comment and I've changed further patches to
address this.

The setter of the callback will be in charge for setting the callback
again on resume. That's why vlapic_set_callback is not a static
function, and is added to the header.

Patch 5/11 [0] contains an example of hw the vIO-APIC resets the callbacks
on load. 

> 
> > ---
> > RFC: should callbacks also be executed in vlapic_do_init (which is
> > called by vlapic_reset). We would need to make sure ISR and IRR
> > are cleared using some kind of test and clear atomic functionality to
> > make this race free.
> 
> I guess this can't be decided at this point of the series, as it
> may depend on what exactly the callbacks mean to do. It may even
> be that whether a callback wants to do something depends on
> whether it gets called "normally" or from vlapic_do_init().

Well, lets try to get some progress on the other questions and we will
eventually get here I think.

> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -144,7 +144,32 @@ bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
> >      return vlapic_test_vector(vec, &vlapic->regs->data[APIC_IRR]);
> >  }
> >  
> > -void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
> > +void vlapic_set_callback(struct vlapic *vlapic, unsigned int vec,
> > +                         vlapic_eoi_callback_t *callback, void *data)
> > +{
> > +    unsigned long flags;
> > +    unsigned int index = vec - 16;
> > +
> > +    if ( !callback || vec < 16 || vec >= X86_NR_VECTORS )
> > +    {
> > +        ASSERT_UNREACHABLE();
> > +        return;
> > +    }
> > +
> > +    spin_lock_irqsave(&vlapic->callback_lock, flags);
> > +    if ( vlapic->callbacks[index].callback &&
> > +         vlapic->callbacks[index].callback != callback )
> > +        printk(XENLOG_G_WARNING
> > +               "%pv overriding vector %#x callback %ps (%p) with %ps (%p)\n",
> > +               vlapic_vcpu(vlapic), vec, vlapic->callbacks[index].callback,
> > +               vlapic->callbacks[index].callback, callback, callback);
> > +    vlapic->callbacks[index].callback = callback;
> > +    vlapic->callbacks[index].data = data;
> 
> Should "data" perhaps also be compared in the override check above?

Could do, there might indeed be cases where the callback is the same
but data has changed and should be interesting to log.

Thanks, Roger.

[0] https://lore.kernel.org/xen-devel/20200930104108.35969-6-roger.pau@citrix.com/

