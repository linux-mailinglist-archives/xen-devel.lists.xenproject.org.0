Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770F2E2822
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 18:01:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58767.103551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksTz4-0005hj-0v; Thu, 24 Dec 2020 17:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58767.103551; Thu, 24 Dec 2020 17:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksTz3-0005hK-TT; Thu, 24 Dec 2020 17:01:01 +0000
Received: by outflank-mailman (input) for mailman id 58767;
 Thu, 24 Dec 2020 17:01:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnYj=F4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ksTz2-0005hF-2s
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 17:01:00 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8bf08bd-fc67-477b-af90-cf42b18aae48;
 Thu, 24 Dec 2020 17:00:58 +0000 (UTC)
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
X-Inumbo-ID: a8bf08bd-fc67-477b-af90-cf42b18aae48
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608829258;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=eFVHLt0a04goO6nAl+fS918d/GFGWZW+6Zucil4GllY=;
  b=aIq4VDQkpuYwPusjaVAWfXngTLatir8BsgjvsAc2/MUCBYfmn42CJ/rj
   YYXhzMkGyN/OY//KIaFs/U+K6TWE1xq8OL2U/2nnWgxrL1lRTPC8Fv2Hh
   abFYv2IwmN0gkwPAbzycI5N2u5S118+OZwN2MdFZnqG88gViNKJbr8qpr
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Gf1Edw8hsyXi4mbKhRjTIvfgzNVEZMkGAFxl2QG2E88RcPCUz9RR57ENsa0+HFh7aLGm2RYzaq
 /u/RkAO3OzFXDWK+qBa7aw7YtP9bgWHnDd5zg2YR+pN42UwAle4xILbXyiA1Q8iUQMrHKNIqFm
 vJY0mzk7Rk+1/Fm1hmnDTwB+sW/wrj3YjR8cloMD18ZIua3Uc7WbTSt3WNaqudn3yrEq5es41R
 +PHkS4tprUbqcDsCjPo8L19ac7uXJ1evhjL1eBDVQtgXButuBdpWSbKmpTA5K1VD48RQ0LiDMA
 E7A=
X-SBRS: 5.2
X-MesageID: 34158617
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,444,1599537600"; 
   d="scan'208";a="34158617"
Subject: Re: [PATCH] xen/iommu: smmu: Rework how the SMMU version is detected
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <bertrand.marquis@arm.com>, <Rahul.Singh@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20201224164953.32357-1-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0d592001-66de-4582-f7a1-6ee56cbe7c27@citrix.com>
Date: Thu, 24 Dec 2020 17:00:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201224164953.32357-1-julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 24/12/2020 16:49, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> Clang 11 will throw the following error:
>
> smmu.c:2284:18: error: cast to smaller integer type 'enum arm_smmu_arch_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>         smmu->version = (enum arm_smmu_arch_version)of_id->data;
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The error can be prevented by introduce static variable for each SMMU
> version and store a pointer for each of them.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

You can also fix this by casting through (uintptr_t) instead of (enum
arm_smmu_arch_version), which wouldn't involve an extra indirection.

Alternatively, you could modify dt_device_match to union void *data with
uintptr_t val for when you want to actually pass non-pointer data.

~Andrew

