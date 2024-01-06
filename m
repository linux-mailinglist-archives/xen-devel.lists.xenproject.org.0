Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51034825D7E
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jan 2024 01:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662406.1032503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLuxI-000468-7c; Sat, 06 Jan 2024 00:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662406.1032503; Sat, 06 Jan 2024 00:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLuxI-00043w-53; Sat, 06 Jan 2024 00:54:28 +0000
Received: by outflank-mailman (input) for mailman id 662406;
 Sat, 06 Jan 2024 00:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2yR=IQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rLuxG-00043q-VN
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2024 00:54:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 225b0ba6-ac2e-11ee-98ef-6d05b1d4d9a1;
 Sat, 06 Jan 2024 01:54:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0777ECE1F4A;
 Sat,  6 Jan 2024 00:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EC9C433C7;
 Sat,  6 Jan 2024 00:54:19 +0000 (UTC)
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
X-Inumbo-ID: 225b0ba6-ac2e-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704502461;
	bh=0/eARfuTJ2vS8WCAOGEEFVqfFAGooNKG++AMQkqckac=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FiPA+do+vV8O1dF3P2K0CEmZ+pJpY5MAnjkDRew6VRkVouYFsdkkRS7jisoOcnjag
	 bvMJ9fpn4EtxZEk7ccbUOQSwxOsc6yENr9YhEvENtNJDzYyiIHaSDzrOj7KbcgQ5dx
	 Qd+tdWNrVun9CgZ+7tTo0tTQdyE7YgK5/rhqZnkuk1DqIzCJg7LDd6pnwo3LsjWji/
	 nL3z9WikSA7QWBe+eenPoiW7mVZdxgnVyvnvJ3p6OUbCGNKihGOvWt8A9Afwa2DNHW
	 velr3vHTEqdhjmTQ7lobQ2S9Qv9Q+wMDWXFOReXIY5eS6TG3OEILbaMh8I0LIxtlz2
	 SB2IO7YXNVH2w==
Date: Fri, 5 Jan 2024 16:54:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC XEN PATCH v4 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
In-Reply-To: <20240105070920.350113-4-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2401051651270.3675@ubuntu-linux-20-04-desktop>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com> <20240105070920.350113-4-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jan 2024, Jiqian Chen wrote:
> On PVH dom0, the gsis don't get registered, but
> the gsi of a passthrough device must be configured for it to
> be able to be mapped into a hvm domU.
> On Linux kernel side, it calles PHYSDEVOP_setup_gsi for
> passthrough devices to register gsi when dom0 is PVH.
> So, add PHYSDEVOP_setup_gsi for above purpose.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  xen/arch/x86/hvm/hypercall.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 632a68be3cc4..e27d3ca15185 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -97,6 +97,12 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +    case PHYSDEVOP_setup_gsi:
> +        if ( is_hardware_domain(currd) && !has_pirq(currd) )
> +            break;
> +        else
> +            return -ENOSYS;

I am not sure what is the best "if" check for this situation but I am
guessing we don't need has_pirq(currd). Maybe this is sufficient:

if ( is_hardware_domain(currd) )
    break;
else
    return -ENOSYS;


This is another one for the x86 maintainers.


>      case PHYSDEVOP_eoi:
>      case PHYSDEVOP_irq_status_query:
>      case PHYSDEVOP_get_free_pirq:
> -- 
> 2.34.1
> 

