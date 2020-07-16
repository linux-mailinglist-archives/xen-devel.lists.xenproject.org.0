Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16832221E4A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 10:27:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvzE2-0003lt-4J; Thu, 16 Jul 2020 08:26:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvzE0-0003lo-LE
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 08:26:40 +0000
X-Inumbo-ID: 114d59a6-c73e-11ea-948b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 114d59a6-c73e-11ea-948b-12813bfff9fa;
 Thu, 16 Jul 2020 08:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594887998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eJpoVJ5o3Om7legFwg1TQfD6fd6IeunmXaH8O4YF6OQ=;
 b=M9dWhRqKl4gLZKwkZLFgzaSG1m5OxtTEt7RBRDZrIkCRvIgog9GNdbWc
 PQECeTuIVknysplydSbX6SzdkxiTZHA+91TOcAohz1by4Q7Lg+YpDpuIQ
 e+E8prnaWlQyHZOr1RMK2FleEJkTnkScnODUPyR2cn/yOkCyMdLgx/EqE o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BOluNTHkSYVdzAMNQb58R6010i5ICF06kvXn1w7dBi2F6w5uRxXGfl8G8ujIKy9LXU1DpqdzA3
 OwGy2MpWKdDTH0M8ZHq8fxcFvgE8BmPfa/ps6/PxDDu4GsBCU0GQor1ZGHY2NxfOFdk4sDVgyp
 5iSz+983d3HsU+ruXy2HddlTFvprP1+lMasYyKr2cjOz0c0VjCt59fRIhWMj/tZoBXpIdB2vqb
 5Qp0HcelBMhhpcbVKj0IK66Y8zBjx54uZfHrTacN6Y0uq0Pj4VEYBT7ijNmaxo7n6pkY2RH8eg
 NKI=
X-SBRS: 2.7
X-MesageID: 22834130
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,358,1589256000"; d="scan'208";a="22834130"
Date: Thu, 16 Jul 2020 10:26:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 10/11] tools/libxc: add xc_vmtrace_* functions
Message-ID: <20200716082630.GI7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <476203bca92f1fb0e8de2be2bcfb88695a5688f8.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <476203bca92f1fb0e8de2be2bcfb88695a5688f8.1594150543.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, tamas.lengyel@intel.com,
 luwei.kang@intel.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 07, 2020 at 09:39:49PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Add functions in libxc that use the new XEN_DOMCTL_vmtrace interface.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  tools/libxc/Makefile          |  1 +
>  tools/libxc/include/xenctrl.h | 40 ++++++++++++++++
>  tools/libxc/xc_vmtrace.c      | 87 +++++++++++++++++++++++++++++++++++
>  3 files changed, 128 insertions(+)
>  create mode 100644 tools/libxc/xc_vmtrace.c
> 
> diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
> index fae5969a73..605e44501d 100644
> --- a/tools/libxc/Makefile
> +++ b/tools/libxc/Makefile
> @@ -27,6 +27,7 @@ CTRL_SRCS-y       += xc_csched2.c
>  CTRL_SRCS-y       += xc_arinc653.c
>  CTRL_SRCS-y       += xc_rt.c
>  CTRL_SRCS-y       += xc_tbuf.c
> +CTRL_SRCS-y       += xc_vmtrace.c
>  CTRL_SRCS-y       += xc_pm.c
>  CTRL_SRCS-y       += xc_cpu_hotplug.c
>  CTRL_SRCS-y       += xc_resume.c
> diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
> index 4c89b7294c..491b2c3236 100644
> --- a/tools/libxc/include/xenctrl.h
> +++ b/tools/libxc/include/xenctrl.h
> @@ -1585,6 +1585,46 @@ int xc_tbuf_set_cpu_mask(xc_interface *xch, xc_cpumap_t mask);
>  
>  int xc_tbuf_set_evt_mask(xc_interface *xch, uint32_t mask);
>  
> +/**
> + * Enable processor trace for given vCPU in given DomU.
> + * Allocate the trace ringbuffer with given size.
> + *
> + * @parm xch a handle to an open hypervisor interface
> + * @parm domid domain identifier
> + * @parm vcpu vcpu identifier
> + * @return 0 on success, -1 on failure
> + */
> +int xc_vmtrace_pt_enable(xc_interface *xch, uint32_t domid,
> +                         uint32_t vcpu);
> +
> +/**
> + * Disable processor trace for given vCPU in given DomU.
> + * Deallocate the trace ringbuffer.
> + *
> + * @parm xch a handle to an open hypervisor interface
> + * @parm domid domain identifier
> + * @parm vcpu vcpu identifier
> + * @return 0 on success, -1 on failure
> + */
> +int xc_vmtrace_pt_disable(xc_interface *xch, uint32_t domid,
> +                          uint32_t vcpu);
> +
> +/**
> + * Get current offset inside the trace ringbuffer.
> + * This allows to determine how much data was written into the buffer.
> + * Once buffer overflows, the offset will reset to 0 and the previous
> + * data will be overriden.
                   ^ overridden.
> + *
> + * @parm xch a handle to an open hypervisor interface
> + * @parm domid domain identifier
> + * @parm vcpu vcpu identifier
> + * @parm offset current offset inside trace buffer will be written there
> + * @parm size the total size of the trace buffer (in bytes)
> + * @return 0 on success, -1 on failure
> + */
> +int xc_vmtrace_pt_get_offset(xc_interface *xch, uint32_t domid,
> +                             uint32_t vcpu, uint64_t *offset, uint64_t *size);
> +
>  int xc_domctl(xc_interface *xch, struct xen_domctl *domctl);
>  int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl);
>  
> diff --git a/tools/libxc/xc_vmtrace.c b/tools/libxc/xc_vmtrace.c
> new file mode 100644
> index 0000000000..ee034da8d3
> --- /dev/null
> +++ b/tools/libxc/xc_vmtrace.c
> @@ -0,0 +1,87 @@
> +/******************************************************************************
> + * xc_vmtrace.c
> + *
> + * API for manipulating hardware tracing features
> + *
> + * Copyright (c) 2020, Michal Leszczynski
> + *
> + * Copyright 2020 CERT Polska. All rights reserved.
> + * Use is subject to license terms.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation;
> + * version 2.1 of the License.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "xc_private.h"
> +#include <xen/trace.h>
> +
> +int xc_vmtrace_pt_enable(
> +        xc_interface *xch, uint32_t domid, uint32_t vcpu)
> +{
> +    DECLARE_DOMCTL;

You could do:

DECLARE_DOMCTL = {
    .cmd = XEN_DOMCTL_vmtrace_op,
    .domain = domid,
    ...
};

And avoid setting the fields below, the same applies to the rest
of the functions. Note that when doing this there's no need to set the
padding fields, as they will be zeroed by the initialization.

> +    int rc;
> +
> +    domctl.cmd = XEN_DOMCTL_vmtrace_op;
> +    domctl.domain = domid;
> +    domctl.u.vmtrace_op.cmd = XEN_DOMCTL_vmtrace_pt_enable;
> +    domctl.u.vmtrace_op.vcpu = vcpu;
> +    domctl.u.vmtrace_op.pad1 = 0;
> +    domctl.u.vmtrace_op.pad2 = 0;
> +
> +    rc = do_domctl(xch, &domctl);
> +    return rc;

Just do 'return do_domctl(xch, &domctl);', and you can drop the rc
variable (here and in xc_vmtrace_pt_disable).

> +}
> +
> +int xc_vmtrace_pt_get_offset(
> +        xc_interface *xch, uint32_t domid, uint32_t vcpu,
> +        uint64_t *offset, uint64_t *size)
> +{
> +    DECLARE_DOMCTL;
> +    int rc;
> +
> +    domctl.cmd = XEN_DOMCTL_vmtrace_op;
> +    domctl.domain = domid;
> +    domctl.u.vmtrace_op.cmd = XEN_DOMCTL_vmtrace_pt_get_offset;
> +    domctl.u.vmtrace_op.vcpu = vcpu;
> +    domctl.u.vmtrace_op.pad1 = 0;
> +    domctl.u.vmtrace_op.pad2 = 0;
> +
> +    rc = do_domctl(xch, &domctl);
> +    if ( !rc )
> +    {
> +        if (offset)
               ^ missing spaces.

Thanks.

