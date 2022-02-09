Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89BF4AF145
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 13:18:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269072.463049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHluT-0003mT-8n; Wed, 09 Feb 2022 12:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269072.463049; Wed, 09 Feb 2022 12:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHluT-0003jw-5n; Wed, 09 Feb 2022 12:17:21 +0000
Received: by outflank-mailman (input) for mailman id 269072;
 Wed, 09 Feb 2022 12:17:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHluR-0003jq-NO
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 12:17:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHluR-0003kJ-CL; Wed, 09 Feb 2022 12:17:19 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHluR-0002BV-66; Wed, 09 Feb 2022 12:17:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=xwC83qprue0+vCj/j23rpgpvrwFpknweT159heWGT3g=; b=CdqLeVdsvei902+cnR798WrQqd
	3N2Hfb/tfcp7G/eXzUjzmGtsDbsUKLwA8czTP2T/I5YiAZZdGFQFogTF9ug7b3M6ZJX2xSfA6GTfa
	TXkMjgxzE7MLWr70f6aymXGjit4mr23BXk62WrYmn+6ypBuYEDI3fN6e//IU2j5Ud+a4=;
Message-ID: <316bd101-af8b-d2f0-1db5-ea6c583acd59@xen.org>
Date: Wed, 9 Feb 2022 12:17:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross <jgross@suse.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <e440e4f16a506ecc87078635dbb3fda2ebd45346.1644341635.git.oleksii_moisieiev@epam.com>
 <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>
 <20220209102037.GA1025795@EPUAKYIW015D>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220209102037.GA1025795@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2022 10:20, Oleksii Moisieiev wrote:
> Hi Julien,

Hi,

> 
> On Tue, Feb 08, 2022 at 06:26:54PM +0000, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 08/02/2022 18:00, Oleksii Moisieiev wrote:
>>> If enabled, host device-tree will be exported to hypfs and can be
>>> accessed through /devicetree path.
>>> Exported device-tree has the same format, as the device-tree
>>> exported to the sysfs by the Linux kernel.
>>> This is useful when XEN toolstack needs an access to the host device-tree.
>>>
>>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>>> ---
>>>    xen/arch/arm/Kconfig           |   8 +
>>>    xen/arch/arm/Makefile          |   1 +
>>>    xen/arch/arm/host_dtb_export.c | 307 +++++++++++++++++++++++++++++++++
>>
>> There is nothing specific in this file. So can this be moved in common/?
> 
> You're right. I will move it to common.
> 
>>
>>>    3 files changed, 316 insertions(+)
>>>    create mode 100644 xen/arch/arm/host_dtb_export.c
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index ecfa6822e4..895016b21e 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -33,6 +33,14 @@ config ACPI
>>>    	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>>>    	  an alternative to device tree on ARM64.
>>> +config HOST_DTB_EXPORT
>>> +	bool "Export host device tree to hypfs if enabled"
>>> +	depends on ARM && HYPFS && !ACPI
>>
>> A Xen built with ACPI enabled will still be able to boot on a host using
>> Device-Tree. So I don't think should depend on ACPI.
>>
>> Also, I think this should depend on HAS_DEVICE_TREE rather than ARM.
> 
> I agree. Thank you.
> 
>>
>>> +	---help---
>>> +
>>> +	  Export host device-tree to hypfs so toolstack can have an access for the
>>> +	  host device tree from Dom0. If you unsure say N.
>>> +
>>>    config GICV3
>>>    	bool "GICv3 driver"
>>>    	depends on ARM_64 && !NEW_VGIC
>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>> index 07f634508e..0a41f68f8c 100644
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -8,6 +8,7 @@ obj-y += platforms/
>>>    endif
>>>    obj-$(CONFIG_TEE) += tee/
>>>    obj-$(CONFIG_HAS_VPCI) += vpci.o
>>> +obj-$(CONFIG_HOST_DTB_EXPORT) += host_dtb_export.o
>>>    obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>>>    obj-y += bootfdt.init.o
>>> diff --git a/xen/arch/arm/host_dtb_export.c b/xen/arch/arm/host_dtb_export.c
>>> new file mode 100644
>>> index 0000000000..794395683c
>>> --- /dev/null
>>> +++ b/xen/arch/arm/host_dtb_export.c
>>
>> This is mostly hypfs related. So CCing Juergen for his input on the code.
> 
> Thank you.
> 
>>
>>> @@ -0,0 +1,307 @@
>>> +/*
>>> + * xen/arch/arm/host_dtb_export.c
>>> + *
>>> + * Export host device-tree to the hypfs so toolstack can access
>>> + * host device-tree from Dom0
>>> + *
>>> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>>> + * Copyright (C) 2021, EPAM Systems.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include <xen/device_tree.h>
>>> +#include <xen/err.h>
>>> +#include <xen/guest_access.h>
>>> +#include <xen/hypfs.h>
>>> +#include <xen/init.h>
>>> +
>>> +#define HOST_DT_DIR "devicetree"
>>> +
>>> +static int host_dt_dir_read(const struct hypfs_entry *entry,
>>> +                            XEN_GUEST_HANDLE_PARAM(void) uaddr);
>>> +static unsigned int host_dt_dir_getsize(const struct hypfs_entry *entry);
>>> +
>>> +static const struct hypfs_entry *host_dt_dir_enter(
>>> +    const struct hypfs_entry *entry);
>>> +static void host_dt_dir_exit(const struct hypfs_entry *entry);
>>> +
>>> +static struct hypfs_entry *host_dt_dir_findentry(
>>> +    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len);
>>
>> This is new code. So can you please make sure to avoid forward declaration
>> by re-ordering the code.
>>
> 
> I can't avoid forward declaration here because all those functions
> should be passed as callbacks for node template dt_dir. And dt_dir is
> used in read and findentry functions.

You can avoid most of those forward declarations if you define the 
static variable now but fill them up after (see [1]). I don't think we 
can avoid the static variable forward declaration without reworking the API.

BTW, I could not fully apply the series on the staging tree:

Applying: xen/hypfs: support fo nested dynamic hypfs nodes
Applying: libs: libxenhypfs - handle blob properties
Applying: xen/arm: Export host device-tree to hypfs
Applying: xen/arm: add generic SCI mediator framework
error: patch failed: MAINTAINERS:512
error: MAINTAINERS: patch does not apply
error: patch failed: xen/arch/arm/domain_build.c:1894
error: xen/arch/arm/domain_build.c: patch does not apply
error: xen/include/asm-arm/domain.h: does not exist in index
Patch failed at 0004 xen/arm: add generic SCI mediator framework
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

 From the errors, it sounds like your baseline is from a couple of 
months ago. Please make sure to send your series based on the latest 
staging (at the time you send it).

>>> +static int host_dt_dir_read(const struct hypfs_entry *entry,
>>> +                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
>>> +{
>>> +    int ret = 0;
>>> +    struct dt_device_node *node;
>>> +    struct dt_device_node *child;
>>
>> The hypfs should not modify the device-tree. So can this be const?
> 
> That's a good point.
> Unfortunatelly child can't be const because it is going to be passed to
> data->data pointer, but node can be const I think. In any case I will go
> through the file and see where const for the device_node can be set.

Can you explain why that data->data is not const?
>>> +static HYPFS_DIR_INIT_FUNC(host_dt_dir, HOST_DT_DIR, &host_dt_dir_funcs);
>>> +
>>> +static int __init host_dtb_export_init(void)
>>> +{
>>> +    ASSERT(dt_host && (dt_host->sibling == NULL));
>>
>> dt_host can be NULL when booting on ACPI platform. So I think this wants to
>> be turned to a normal check and return directly.
>>
> 
> I will replace if with
> if ( !acpi_disabled )
>      return -ENODEV;
> 
>> Also could you explain why you need to check dt_host->sibling?
>>
> 
> This is my way to check if dt_host points to the top of the device-tree.
> In any case I will replace it with !acpi_disabled as I mentioned
> earlier.

dt_host will always points to the root of the host device-tree. I don't 
think it is the job of hypfs to enforce it unless you expect the code to 
be buggy if this happens. But then I would argue the code should be 
hardened.

Cheers,

[1]

diff --git a/xen/arch/arm/host_dtb_export.c b/xen/arch/arm/host_dtb_export.c
index 794395683cd1..5f242b2cb683 100644
--- a/xen/arch/arm/host_dtb_export.c
+++ b/xen/arch/arm/host_dtb_export.c
@@ -26,39 +26,9 @@

  #define HOST_DT_DIR "devicetree"

-static int host_dt_dir_read(const struct hypfs_entry *entry,
-                            XEN_GUEST_HANDLE_PARAM(void) uaddr);
-static unsigned int host_dt_dir_getsize(const struct hypfs_entry *entry);
-
-static const struct hypfs_entry *host_dt_dir_enter(
-    const struct hypfs_entry *entry);
-static void host_dt_dir_exit(const struct hypfs_entry *entry);
-
-static struct hypfs_entry *host_dt_dir_findentry(
-    const struct hypfs_entry_dir *dir, const char *name, unsigned int 
name_len);
-
-static const struct hypfs_funcs host_dt_dir_funcs = {
-    .enter = host_dt_dir_enter,
-    .exit = host_dt_dir_exit,
-    .read = host_dt_dir_read,
-    .write = hypfs_write_deny,
-    .getsize = host_dt_dir_getsize,
-    .findentry = host_dt_dir_findentry,
-};
-
-static int host_dt_prop_read(const struct hypfs_entry *entry,
-                    XEN_GUEST_HANDLE_PARAM(void) uaddr);
-
-static unsigned int host_dt_prop_getsize(const struct hypfs_entry *entry);
-
-const struct hypfs_funcs host_dt_prop_ro_funcs = {
-    .enter = host_dt_dir_enter,
-    .exit = host_dt_dir_exit,
-    .read = host_dt_prop_read,
-    .write = hypfs_write_deny,
-    .getsize = host_dt_prop_getsize,
-    .findentry = hypfs_leaf_findentry,
-};
+/* Forward declare it */
+static const struct hypfs_funcs host_dt_dir_funcs;
+static const struct hypfs_funcs host_dt_prop_ro_funcs;

  static HYPFS_DIR_INIT_FUNC(dt_dir, "node_template", &host_dt_dir_funcs);

@@ -260,6 +230,15 @@ static struct hypfs_entry *host_dt_dir_findentry(
      return ERR_PTR(-ENOENT);
  };

+static const struct hypfs_funcs host_dt_dir_funcs = {
+    .enter = host_dt_dir_enter,
+    .exit = host_dt_dir_exit,
+    .read = host_dt_dir_read,
+    .write = hypfs_write_deny,
+    .getsize = host_dt_dir_getsize,
+    .findentry = host_dt_dir_findentry,
+};
+
  static int host_dt_prop_read(const struct hypfs_entry *entry,
                      XEN_GUEST_HANDLE_PARAM(void) uaddr)
  {
@@ -293,6 +272,15 @@ static unsigned int host_dt_prop_getsize(const 
struct hypfs_entry *entry)
      return prop->length;
  }

+static const struct hypfs_funcs host_dt_prop_ro_funcs = {
+    .enter = host_dt_dir_enter,
+    .exit = host_dt_dir_exit,
+    .read = host_dt_prop_read,
+    .write = hypfs_write_deny,
+    .getsize = host_dt_prop_getsize,
+    .findentry = hypfs_leaf_findentry,
+};
+
  static HYPFS_DIR_INIT_FUNC(host_dt_dir, HOST_DT_DIR, &host_dt_dir_funcs);

  static int __init host_dtb_export_init(void)

-- 
Julien Grall

