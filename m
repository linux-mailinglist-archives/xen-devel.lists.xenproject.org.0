Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30DDAE3258
	for <lists+xen-devel@lfdr.de>; Sun, 22 Jun 2025 23:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021900.1397623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTSHA-0000il-0X; Sun, 22 Jun 2025 21:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021900.1397623; Sun, 22 Jun 2025 21:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTSH9-0000gl-UG; Sun, 22 Jun 2025 21:30:55 +0000
Received: by outflank-mailman (input) for mailman id 1021900;
 Sun, 22 Jun 2025 21:30:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTSH8-0000gf-M5
 for xen-devel@lists.xenproject.org; Sun, 22 Jun 2025 21:30:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b60e598-4fb0-11f0-a30f-13f23c93f187;
 Sun, 22 Jun 2025 23:30:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0FAA660052;
 Sun, 22 Jun 2025 21:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7683C4CEE3;
 Sun, 22 Jun 2025 21:30:47 +0000 (UTC)
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
X-Inumbo-ID: 2b60e598-4fb0-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750627849;
	bh=1WHOrDmxX+S1gNKbRkBpiy7iIDp48xtuOEDupSqobM4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iRIik7bKG8mJzo+hrcx5IoM2c7eVDVEKHC5+SQzD1TKcYx9MoHqxAPPWcjQz9RLtN
	 VvO0oYydDVJQlybAShjw/MT+pduBYIXtTUoXCDeqePktxG1uR6gQkwp0FMkuveWpyb
	 o/CGbpHluranEg1JlaIO1kCBDPAZwJYaJuM0J7DMtkSvvuc5tHIiPakKfL8p0uvtOT
	 04vZJ9GhxaiX0ddhVEQ+/Ro2P6xpk96jX0mvK6TXjqKjSeTFVvhpcsu9tm5TxqH5PT
	 ail4EpJqCWbm2apJloWeM0aB5K3JBE9bspqDjbREhHblxkbK2pGTbF/OBgz7hM9Wsx
	 zaaNThSFvH1/A==
Date: Sun, 22 Jun 2025 14:30:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, jbeulich@suse.com, 
    roger.pau@citrix.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
In-Reply-To: <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
Message-ID: <alpine.DEB.2.22.394.2506221428420.8066@ubuntu-linux-20-04-desktop>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com> <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop> <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
 <alpine.DEB.2.22.394.2506171701190.1780597@ubuntu-linux-20-04-desktop> <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Jun 2025, Oleksii Moisieiev wrote:
> On 18/06/2025 03:04, Stefano Stabellini wrote:
> > On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
> >> Hi Stefano,
> >>
> >> I'm very sorry for a long silence. Please see my answers below:
> >>
> >> On 22/05/2025 03:25, Stefano Stabellini wrote:
> >>> On Mon, 19 May 2025, Oleksii Moisieiev wrote:
> >>>> From: Grygorii Strashko<grygorii_strashko@epam.com>
> >>>>
> >>>> Add chained handling of assigned DT devices to support access-controller
> >>>> functionality through SCI framework, so DT device assign request can be
> >>>> passed to FW for processing and enabling VM access to requested device
> >>>> (for example, device power management through FW interface like SCMI).
> >>>>
> >>>> The SCI access-controller DT device processing is chained after IOMMU
> >>>> processing and expected to be executed for any DT device regardless of its
> >>>> protection by IOMMU (or if IOMMU is disabled).
> >>>>
> >>>> This allows to pass not only IOMMU protected DT device through
> >>>> xl.cfg:"dtdev" property for processing:
> >>>>
> >>>> dtdev = [
> >>>>       "/soc/video@e6ef0000", <- IOMMU protected device
> >>>>       "/soc/i2c@e6508000", <- not IOMMU protected device
> >>>> ]
> >>>>
> >>>> The change is done in two parts:
> >>>> 1) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
> >>>> not fail if DT device is not protected by IOMMU
> >>>> 2) add chained call to sci_do_domctl() in do_domctl()
> >>>>
> >>>> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
> >>>> Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>
> >>>> ---
> >>>>
> >>>>
> >>>>
> >>>>    xen/arch/arm/firmware/sci.c             | 37 +++++++++++++++++++++++++
> >>>>    xen/arch/arm/include/asm/firmware/sci.h | 14 ++++++++++
> >>>>    xen/common/domctl.c                     | 19 +++++++++++++
> >>>>    xen/drivers/passthrough/device_tree.c   |  6 ++++
> >>>>    4 files changed, 76 insertions(+)
> >>>>
> >>>> diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
> >>>> index e1522e10e2..8efd541c4f 100644
> >>>> --- a/xen/arch/arm/firmware/sci.c
> >>>> +++ b/xen/arch/arm/firmware/sci.c
> >>>> @@ -126,6 +126,43 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
> >>>>        return 0;
> >>>>    }
> >>>>    
> >>>> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> >>>> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >>>> +{
> >>>> +    struct dt_device_node *dev;
> >>>> +    int ret = 0;
> >>>> +
> >>>> +    switch ( domctl->cmd )
> >>>> +    {
> >>>> +    case XEN_DOMCTL_assign_device:
> >>>> +        ret = -EOPNOTSUPP;
> >>> Are you sure -EOPNOTSUPP is the right error code for the 3 checks below?
> >> The -EOPNOTSUPP code is used because this is part of a chained call after
> >> iommu_do_domctl, as stated in xen/common/domctl.c:859. The
> >> XEN_DOMCTL_assign_device
> >> call is expected to handle any DT device, regardless of whether the DT
> >> device is
> >> protected by an IOMMU or if the IOMMU is disabled.
> >> The following cases are considered:
> >>
> >> 1. IOMMU Protected Device (Success)
> >>
> >> If the device is protected by the IOMMU and iommu_do_domctl returns 0,
> >> we continue
> >> processing the DT device by calling sci_do_domctl.
> >>
> >> 2. IOMMU Disabled (-EOPNOTSUPP from iommu_do_domctl)
> >>
> >> If iommu_do_domctl returns -EOPNOTSUPP, indicating that the IOMMU is
> >> disabled,
> >> we still proceed to call sci_do_domctl.
> > OK this makes sense.  I think it is OK to have a special error code to
> > say "the IOMMU is disabled" but I don't know if it is a good idea to try
> > to use -EOPNOTSUPP for that. -EOPNOTSUPP could mean a hypervisor
> > configuration with domctl disabled, for instance.
> >
> > It might be wiser to use a different error code. Maybe ENOENT?
> >
> I see that in the following commit:
> 
> 71e617a6b8 (use is_iommu_enabled() where appropriate..., 2019-09-17)
> 
> -ENOSYS return code was changed to -EOPNOTSUPP in iommu_do_domctl.
> 
> It's not clear to me why this was done from the commit description.
> 
> Maybe we should add commit author?

Roger and Jan might know

