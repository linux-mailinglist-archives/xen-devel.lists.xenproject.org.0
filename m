Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E542E286D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 18:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58777.103575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksUa9-0000FC-2e; Thu, 24 Dec 2020 17:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58777.103575; Thu, 24 Dec 2020 17:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksUa8-0000Em-Vc; Thu, 24 Dec 2020 17:39:20 +0000
Received: by outflank-mailman (input) for mailman id 58777;
 Thu, 24 Dec 2020 17:39:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnYj=F4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ksUa8-0000Eh-1W
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 17:39:20 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b968df92-117d-42c6-bf81-74cc21e1ea36;
 Thu, 24 Dec 2020 17:39:19 +0000 (UTC)
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
X-Inumbo-ID: b968df92-117d-42c6-bf81-74cc21e1ea36
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608831558;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=7inTMIk0tMlR5a5l5/wH4uFWmYYM7nYbmVGMOJ+fAhU=;
  b=FsLieeRr2b70OrsEzHnpFsavq+Vm+hm7vMMmm+pA5REApaGqOjzhT/IG
   BdZ53u8mMaz41QVmgtmTBqdt4WiohQ0KwbpkSrXu+zgwmkm1PruaxwgeX
   oxjY/9C0DuBDjy3lV06v6UiH9Q3GBwGTtbpGnnD0aMq60WKGEGLyvBRV7
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WLgvFoCKz3lADIvrM4iwSjCS4adQHYiTgBjQaw8PaPU7exnS/hbazl8sTYQrg/Qkey5N5pV6ir
 LdHpg2U6/QprjOMvFV14c/SRlgeVSItvAs8fV5bvzRgJ1asYP/ZSPP6BubYjacfhqFeh+An3Hp
 skbQ23GyZ5AxrCLSASv9Rslu+ciTdJkaGGrAWEuoHkVVewoHTefpnua8VZaoYWCiy32VAhHByw
 kWHwZUiguDo8ysW2SJMMxUfTs4Mq/XkkvepKZPZ/K523Yt8FN9NKPFHe7TbnnMWWG02FCw+Ntd
 Iy8=
X-SBRS: 5.2
X-MesageID: 33920861
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,444,1599537600"; 
   d="scan'208";a="33920861"
Subject: Re: [PATCH] xen/iommu: smmu: Rework how the SMMU version is detected
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <bertrand.marquis@arm.com>, <Rahul.Singh@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20201224164953.32357-1-julien@xen.org>
 <0d592001-66de-4582-f7a1-6ee56cbe7c27@citrix.com>
 <11aad53b-2fca-d893-0897-532e5ac4248c@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e5e73b9c-5653-7333-b252-0bcb1f7ebb20@citrix.com>
Date: Thu, 24 Dec 2020 17:39:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11aad53b-2fca-d893-0897-532e5ac4248c@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 24/12/2020 17:10, Julien Grall wrote:
>
>
> On 24/12/2020 17:00, Andrew Cooper wrote:
>> On 24/12/2020 16:49, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Clang 11 will throw the following error:
>>>
>>> smmu.c:2284:18: error: cast to smaller integer type 'enum
>>> arm_smmu_arch_version' from 'const void *'
>>> [-Werror,-Wvoid-pointer-to-enum-cast]
>>>          smmu->version = (enum arm_smmu_arch_version)of_id->data;
>>>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> The error can be prevented by introduce static variable for each SMMU
>>> version and store a pointer for each of them.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> You can also fix this by casting through (uintptr_t) instead of (enum
>> arm_smmu_arch_version), which wouldn't involve an extra indirection.
>
> I thought about using a different cast, but it feels just papering
> over the issue.
>
> But I don't see what's the problem with the extra indirection... It is
> self-contained and only used during the IOMMU initialization.

Well - its extra .rodata for the sake of satisfying the compiler in a
specific way.

Irrespective, all of this looks like it ought to be initdata rather than
runtime data, which is probably a bigger deal than worrying about one
extra pointer access.

~Andrew

