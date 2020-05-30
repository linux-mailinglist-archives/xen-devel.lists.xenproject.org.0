Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA081E9268
	for <lists+xen-devel@lfdr.de>; Sat, 30 May 2020 17:56:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jf3pB-0007Ww-Ie; Sat, 30 May 2020 15:55:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcdI=7M=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jf3pA-0007Wr-0q
 for xen-devel@lists.xenproject.org; Sat, 30 May 2020 15:55:04 +0000
X-Inumbo-ID: ec2bd9e2-a28d-11ea-81bc-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec2bd9e2-a28d-11ea-81bc-bc764e2007e4;
 Sat, 30 May 2020 15:55:03 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:50216
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jf3p4-000jH7-MD (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Sat, 30 May 2020 16:54:58 +0100
Subject: Re: [PATCH v10 05/12] libs: add libxenhypfs
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-6-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8468b7ea-81ba-0512-c638-322803134576@citrix.com>
Date: Sat, 30 May 2020 16:54:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519072106.26894-6-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/05/2020 08:20, Juergen Gross wrote:
> diff --git a/tools/libs/hypfs/include/xenhypfs.h b/tools/libs/hypfs/include/xenhypfs.h
> new file mode 100644
> index 0000000000..ab157edceb
> --- /dev/null
> +++ b/tools/libs/hypfs/include/xenhypfs.h
> @@ -0,0 +1,90 @@
> +/*
> + * Copyright (c) 2019 SUSE Software Solutions Germany GmbH
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
> +#ifndef XENHYPFS_H
> +#define XENHYPFS_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <sys/types.h>
> +
> +/* Callers who don't care don't need to #include <xentoollog.h> */
> +struct xentoollog_logger;
> +
> +typedef struct xenhypfs_handle xenhypfs_handle;
> +
> +struct xenhypfs_dirent {
> +    char *name;
> +    size_t size;
> +    enum {
> +        xenhypfs_type_dir,
> +        xenhypfs_type_blob,
> +        xenhypfs_type_string,
> +        xenhypfs_type_uint,
> +        xenhypfs_type_int,
> +        xenhypfs_type_bool
> +    } type;
> +    enum {
> +        xenhypfs_enc_plain,
> +        xenhypfs_enc_gzip
> +    } encoding;
> +    bool is_writable;
> +};

I'm afraid this a blocker bug for 4.14.

enum's aren't safe in public ABI structs, even under _GNU_SOURCE.  Use
unsigned int's, and declare the enumerations earlier.

There is also 3/7 bytes of trailing padding and very little forward
extensibility.  How about an unsigned int flags, of which writeable is
the bottom bit, seeing as this is purely an informational field?

~Andrew

