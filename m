Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE88ABB025
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 14:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989052.1373393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcp1-00069w-5e; Sun, 18 May 2025 12:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989052.1373393; Sun, 18 May 2025 12:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcp1-00066p-2y; Sun, 18 May 2025 12:08:51 +0000
Received: by outflank-mailman (input) for mailman id 989052;
 Sun, 18 May 2025 12:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGcp0-00066j-Bk
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 12:08:50 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db06cd9e-33e0-11f0-9eb8-5ba50f476ded;
 Sun, 18 May 2025 14:08:49 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso25066035e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 05:08:49 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d230sm9097583f8f.4.2025.05.18.05.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 05:08:48 -0700 (PDT)
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
X-Inumbo-ID: db06cd9e-33e0-11f0-9eb8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747570128; x=1748174928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJaxceEbx1hG9jeZHaW0n8Na17V6UW7vFwACzQTFrTg=;
        b=CbwMpxoN9wrglJm9VJzuArRfm13i/mYrTy+zWtEqG/HLFv6iB9CeUcph43OqZniiMF
         /sgl4czi/2a91Cn5OQ0qAY96OcKR4Ci4Yqd+mEPG31KrWg0oVZMov/yTZ/LdhemsOjPB
         RiFuMNaul8R0Zi3stGN7tjpV/I12r4c25huDUiAskpZbTR10scS9vCOhyL/Ws6G+jzwd
         2twCqnI2Rs3Lek3C1Sx0vgNg5PPkMNin+HFSHpfn7DzzrYNneoPeUTuUh8p1sY8GtzmK
         oQYbL/wTnL2V5czTWuCAn+Z9eLi3wMLW250VKts2/yBHLKc4aQwh1FfsfsLuxHJlt8DG
         i1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747570128; x=1748174928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJaxceEbx1hG9jeZHaW0n8Na17V6UW7vFwACzQTFrTg=;
        b=N4mB7ilLBqv5gtOdCiKCjRkJEy1S3Fe0lOyHU3VhGyfAYal/PAyQ+0LhhvmdmSHINr
         DEPkkTwFtf2PLgNLgtQYyIgCsftJSXlVC1ml9GbuwGt8WjxhkjPy8GNWWCri/SyHjyHR
         pOfO3liZuDAe1/TwLrH56cC9ZRx9qQVskvikR2rOlSWFWKyZhW7vKGpq9pQb806tizdK
         tUFdyXdZNBZXWwH7dZnlVUPbp46f1Rth3DmwTYDZKTMEqFxuEqlcPPAHhuttKXjsJETQ
         8O7w6qgpBVHOsPEnjQtv/hkxZPcYoQyNelHleO/NWWAZzbXqagAo9iu68v5x/PgtR6dR
         F++Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCd703dqI3ajUF3EGTMJEz5aKxkDOg+uPZ9H3ot9B9AI9tWKWGCojv5MrpRH2htA/19MRuvuAyRbM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuJIXKGjApw1TSN8VYJcKbHJ9QhIk1pyXd2SRuA7dMXZ7L9HTu
	Xjkv5zftqjlYlZtUYpH6fOO43rnTrvkZi4fCPOxvXN8chFWdzumkFXTtumnWslNlsA==
X-Gm-Gg: ASbGncs7WSJUp/NumaT8XQ0MGtt91ZpRxfolR5n2LX/VV2dcRqVP3yxEM/1f/DIL4bF
	Sq/MlQeFYlW9Xhhsx7hgiKweMTGDx9aaIUeNBb4hmfGRkCyeP8kSFlXjnHb3HvEXr2n0CZkWfYJ
	oA/wRx71MrISf26kBYj1CjLpNNtjtCtyAwuvkA9pjWhmnQLmKo1YjpBRbJ9/y9B5/pTSH1ofkJo
	VNHth7Ryqiuuw5ZY39XAyCBxcM6WHMto9CWfEhvpVs7MlkPMIKCtGCQlPUFBGrqS2DUtONNbp1g
	RdyV6/uvrl4uqjyqOAPab4dPGtyw+MF7jYO5gOzQOsCx1Nu6OkrSX2qiYax/0Ld9k0vZIZBk3nt
	ldB6z35WbvqBS6YFuf8vjNJ9G
X-Google-Smtp-Source: AGHT+IGrB7lPiaiivVX0lak8ubJVhQ4AZCWd17ta6Z+tXkyLcjqYe1hOeMbQNxSn4kvEmCRvS/uZtQ==
X-Received: by 2002:a05:6000:40d9:b0:3a3:4b8a:9a36 with SMTP id ffacd0b85a97d-3a35c808b92mr8665482f8f.11.1747570128462;
        Sun, 18 May 2025 05:08:48 -0700 (PDT)
Message-ID: <a6dced6f-3663-4221-92d0-aa89ce31f6b5@suse.com>
Date: Sun, 18 May 2025 14:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] crypto: Add RSA support
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250515093822.659916-1-ross.lagerwall@citrix.com>
 <20250515093822.659916-4-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250515093822.659916-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2025 11:38, Ross Lagerwall wrote:
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
>  obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>  obj-$(CONFIG_VM_EVENT) += mem_access.o
>  obj-y += memory.o
> +obj-$(CONFIG_PAYLOAD_VERIFY) += mpi.o

This being odd and non-scalable, I now think the file would better move to
lib/. It _is_ library code, after all. Then it can be included in lib-y
(thus always being built, i.e. reducing the risk of accidental build
breakages), but will be included in the final image only when needed.

> --- /dev/null
> +++ b/xen/include/xen/mpi.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* mpi.h  -  Multi Precision Integers
> + *        Copyright (C) 1994, 1996, 1998, 1999,
> + *                    2000, 2001 Free Software Foundation, Inc.
> + *
> + * This file is part of GNUPG.
> + *
> + * GNUPG is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * GNUPG is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
> + *
> + * Note: This code is heavily based on the GNU MP Library.
> + *         Actually it's the same code with only minor changes in the
> + *         way the data is stored; this is to support the abstraction
> + *         of an optional secure memory allocation which may be used
> + *         to avoid revealing of sensitive data due to paging etc.
> + *         The GNU MP Library itself is published under the LGPL;
> + *         however I decided to publish this code under the plain GPL.
> + */
> +
> +#ifndef XEN__MPI_H
> +#define XEN__MPI_H

With the recent change to header guard naming, the double underscore here
(and in rsa.h) wants to shrink back to a single one.

Jan

