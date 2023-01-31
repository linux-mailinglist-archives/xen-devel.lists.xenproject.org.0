Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD1F6832D1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 17:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487742.755428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMtar-0000p4-5W; Tue, 31 Jan 2023 16:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487742.755428; Tue, 31 Jan 2023 16:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMtar-0000mO-1s; Tue, 31 Jan 2023 16:34:49 +0000
Received: by outflank-mailman (input) for mailman id 487742;
 Tue, 31 Jan 2023 16:34:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+3C0=54=citrix.com=prvs=388cd47ec=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pMtap-0000mI-0F
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 16:34:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aa028ac-a185-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 17:34:45 +0100 (CET)
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
X-Inumbo-ID: 2aa028ac-a185-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675182885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OI0aUjgIDP5iwsnoG0J9LhGm3fJcpKlqkuEsb9JqX44=;
  b=hs7IW1os3qTFabLSWPUt70x6NW6ClR/HdpvDBkqNTEW8yAlECJSYoFwW
   8m5IoWOAFuvmANyIRJI6B61ifbmwUxk9aILrdvj8WOduPx/05nl/xHUgJ
   DTUuOmrvNC0/HQHLbIXAU/81qH5TgbOLbSAW1irnvCRa7+hoy3ExDSJ+9
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94981247
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:aiNk9aPqnFugflzvrR06l8FynXyQoLVcMsEvi/4bfWQNrUorhjxSx
 2YcWjqFbvyDMDP8e9hyPd7k/ExQ6JGGx4JhSwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5QVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rlyHWJr2
 PckESwAdjrTlvm82Z+xReY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3WFJUMxBrHz
 o7A117nWEBKadPO8Bbb0y682O7kpiPSaLtHQdVU8dY12QbOlwT/EiY+WV66veOozFWzXt9ZJ
 lAP0iUrpKk2skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQqsd4qXzsdz
 VKMktXkGSdHvaWcTDSW8bL8hSy2ETgYKykFfyBsZQkK+d74u6kokwnCCN1kFcadidn4Gir5x
 TyQmyE4i68Ols4A16i9/lfvjiqlo97CSQtdzgzRV3m55xh4ZYeSY5Gr6FHd4PBDK66UVlCE+
 nMDnqC25fgDF5iXmASRQe8GG/ei4PPtDdHHqQcxRd97rW3roiP9O9kKu1mSOXuFLO5bfCPqR
 WLYhTpN6Yd5bGqxZ7ZaaY2+XpFCIbfbKfzpUfXdb9xra5d3dROa8CwGWXN8z1wBg2B3z/hhZ
 M7zndKESC9DVP85lGbeq/I1i+dD+8wo+Y/EqXkXJTyD2KHWWnOaQKxt3LCmPrFgt/PsTOk4H
 r9i2yq2J/d3CrSWjsr/q9R7wbU2wZ8TW/jLRzR/LLLrH+afMDhJ5wXt6b0gYZd5uK9ei/3F+
 HqwMmcBlgWi3CWcd1/SMio8AF8KYXqYhStrVRHAwH7ygyRzCWpRxPh3m2QLkUkPq7U4kK8co
 wgtcMScGPVfIgkrCBxEBaQRWLdKLUzx7SrXZnrNXdTKV8I4L+A/0oO+L1SHGehnJnbfiPbSV
 JX6iV2FGcBaHV45ZCsUAdr2p26MUbEmsLoadyP1zhN7Ii0ALKACx/TNs8IK
IronPort-HdrOrdr: A9a23:b7BPJK/gidJq61MWVlpuk+A0I+orL9Y04lQ7vn2ZESYlDfBxl6
 iV7ZMmPGzP+UgssRAb6KK90cy7Kk80mqQFmrU5ELe5VgzvuG+lN6tl4IeK+VGPJ8STzJ856U
 4kSdkDNDSSNykOsS+Z2njDLz9I+rDunc/J9ISurUuFDzsaFp2IhD0JbDpzZ3cGPDWucqBJba
 Z0iPA3wwaIRHIsZMy9K1w9NtKjmzUW/KiWFSLuASRM1ODEt0LY1FezKWnp4v4xaUI9/Ysf
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="94981247"
Date: Tue, 31 Jan 2023 16:34:37 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dmytro Semenets <dmitry.semenets@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Dmytro Semenets
	<dmytro_semenets@epam.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Anastasiia Lukianenko
	<anastasiia_lukianenko@epam.com>
Subject: Re: [RFC PATCH v3 03/10] tools/xl: Add pcid daemon to xl
Message-ID: <Y9lDHdnhW56AOEAX@perard.uk.xensource.com>
References: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
 <20230115113111.1207605-4-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230115113111.1207605-4-dmitry.semenets@gmail.com>

On Sun, Jan 15, 2023 at 01:31:04PM +0200, Dmytro Semenets wrote:
> diff --git a/tools/include/pcid.h b/tools/include/pcid.h
> new file mode 100644
> index 0000000000..6506b18d25
> --- /dev/null
> +++ b/tools/include/pcid.h

Please, rename it "xen-pcid.h". We should try to use our own namespace
to avoid issue with another unrelated project using "pcid.h" as well.

Also, it would be a good idea to introduce this file and/or a protocol
description in a separate patch.

> @@ -0,0 +1,94 @@
> +/*
> +    Common definitions for Xen PCI client-server protocol.
> +    Copyright (C) 2021 EPAM Systems Inc.
> +
> +    This library is free software; you can redistribute it and/or
> +    modify it under the terms of the GNU Lesser General Public
> +    License as published by the Free Software Foundation; either
> +    version 2.1 of the License, or (at your option) any later version.
> +
> +    This library is distributed in the hope that it will be useful,
> +    but WITHOUT ANY WARRANTY; without even the implied warranty of
> +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +    Lesser General Public License for more details.
> +
> +    You should have received a copy of the GNU Lesser General Public
> +    License along with this library; If not, see <http://www.gnu.org/licenses/>.

This licence boilerplate could be replace by
    /* SPDX-License-Identifier: LGPL-2.1+ */
at the top of the file.

> +*/
> +
> +#ifndef PCID_H
> +#define PCID_H
> +
> +#define PCID_SRV_NAME           "pcid"
> +#define PCID_XS_TOKEN           "pcid-token"
> +
> +#define PCI_RECEIVE_BUFFER_SIZE 4096
> +#define PCI_MAX_SIZE_RX_BUF     MB(1)
> +
> +/*
> + *******************************************************************************
> + * Common request and response structures used be the pcid remote protocol are
> + * described below.
> + *******************************************************************************
> + * Request:
> + * +-------------+--------------+----------------------------------------------+
> + * | Field       | Type         | Comment                                      |
> + * +-------------+--------------+----------------------------------------------+
> + * | cmd         | string       | String identifying the command               |
> + * +-------------+--------------+----------------------------------------------+
> + *
> + * Response:
> + * +-------------+--------------+----------------------------------------------+
> + * | Field       | Type         | Comment                                      |
> + * +-------------+--------------+----------------------------------------------+
> + * | resp        | string       | Command string as in the request             |

Instead of sending back the command, you could use a new field "id" that
would be set by the client, and send back as is by the server. A command
could be sent several time, but with an "id", the client can set a
different id to been able to differentiate which commands failed.

"id" field is been usable by QEMU's QMP protocol for example.

> + * +-------------+--------------+----------------------------------------------+
> + * | error       | string       | "okay", "failed"                               |
> + * +-------------+--------------+----------------------------------------------+
> + * | error_desc  | string       | Optional error description string            |
> + * +-------------+--------------+----------------------------------------------+
> + *
> + * Notes.
> + * 1. Every request and response must contain the above mandatory structures.
> + * 2. In case if a bad packet or an unknown command received by the server side
> + * a valid reply with the corresponding error code must be sent to the client.
> + *
> + * Requests and responses, which require SBDF as part of their payload, must
> + * use the following convention for encoding SBDF value:
> + *
> + * pci_device object:
> + * +-------------+--------------+----------------------------------------------+
> + * | Field       | Type         | Comment                                      |
> + * +-------------+--------------+----------------------------------------------+
> + * | sbdf        | string       | SBDF string in form SSSS:BB:DD.F             |
> + * +-------------+--------------+----------------------------------------------+
> + */

It could be nice to have a better description of the protocol, it's not
even spelled out that JSON is been used.

Also what are the possible commands with there arguments?

> +
> +#define PCID_MSG_FIELD_CMD      "cmd"
> +
> +#define PCID_MSG_FIELD_RESP     "resp"
> +#define PCID_MSG_FIELD_ERR      "error"
> +#define PCID_MSG_FIELD_ERR_DESC "error_desc"
> +
> +/* pci_device object fields. */
> +#define PCID_MSG_FIELD_SBDF     "sbdf"
> +
> +#define PCID_MSG_ERR_OK         "okay"
> +#define PCID_MSG_ERR_FAILED     "failed"
> +#define PCID_MSG_ERR_NA         "NA"
> +
> +#define PCID_SBDF_FMT           "%04x:%02x:%02x.%01x"

Thanks,

-- 
Anthony PERARD

