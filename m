Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64730CB56
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 20:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80703.147827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l71El-0002tv-BF; Tue, 02 Feb 2021 19:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80703.147827; Tue, 02 Feb 2021 19:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l71El-0002tW-7x; Tue, 02 Feb 2021 19:21:19 +0000
Received: by outflank-mailman (input) for mailman id 80703;
 Tue, 02 Feb 2021 19:21:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l71Ej-0002tR-Dw
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 19:21:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l71Ei-000461-1U; Tue, 02 Feb 2021 19:21:16 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l71Eh-0003nu-Ns; Tue, 02 Feb 2021 19:21:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=tDuQlJufbyrkxG6R+9PVQYZDZUQUiOSapiecrWdniUU=; b=W4VH4UaNqTVeE4v+oqQ7pJOkJx
	m0MFcVHbxa2rZ2qyfAhc0AI37K/abPeez97p1zlQ2IziRqftW27aSH5VeFJloPPa9LSPMpXCjw/uv
	SuOQ53YCnQgat9lrGGXxT/3cB1xIZ1PNb8YJJi3qLzS6lgWx1i5COuJs7zFL2wpgK/1Q=;
Subject: Re: [PATCH] xen/arm: domain_build: Ignore device nodes with invalid
 addresses
From: Julien Grall <julien@xen.org>
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <YBmQQ3Tzu++AadKx@mattapan.m5p.com>
 <a422c04c-f908-6fb6-f2de-fea7b18a6e7d@xen.org>
Message-ID: <b6d342f8-c833-db88-9808-cdc946999300@xen.org>
Date: Tue, 2 Feb 2021 19:21:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a422c04c-f908-6fb6-f2de-fea7b18a6e7d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 02/02/2021 18:12, Julien Grall wrote:
> Hi,
> 
> On 02/02/2021 17:47, Elliott Mitchell wrote:
>> The handle_device() function has been returning failure upon
>> encountering a device address which was invalid.  A device tree which
>> had such an entry has now been seen in the wild.  As it causes no
>> failures to simply ignore the entries, ignore them. >
>> Signed-off-by: Elliott Mitchell <ehem+xenn@m5p.com>
>>
>> ---
>> I'm starting to suspect there are an awful lot of places in the various
>> domain_build.c files which should simply ignore errors.  This is now the
>> second place I've encountered in 2 months where ignoring errors was the
>> correct action.
> 
> Right, as a counterpoint, we run Xen on Arm HW for several years now and 
> this is the first time I heard about issue parsing the DT. So while I 
> appreciate that you are eager to run Xen on the RPI...
> 
>>  I know failing in case of error is an engineer's
>> favorite approach, but there seem an awful lot of harmless failures
>> causing panics.
>>
>> This started as the thread "[RFC PATCH] xen/arm: domain_build: Ignore
>> empty memory bank".  Now it seems clear the correct approach is to simply
>> ignore these entries.
> 
> ... we first need to fully understand the issues. Here a few questions:
>     1) Can you provide more information why you believe the address is 
> invalid?
>     2) How does Linux use the node?
>     3) Is it happening with all the RPI DT? If not, what are the 
> differences?

So I had another look at the device-tree you provided earlier on. The 
node is the following (copied directly from the DTS):

&pcie0 {
         pci@1,0 {
                 #address-cells = <3>;
                 #size-cells = <2>;
                 ranges;

                 reg = <0 0 0 0 0>;

                 usb@1,0 {
                         reg = <0x10000 0 0 0 0>;
                         resets = <&reset 
RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
                 };
         };
};

pcie0: pcie@7d500000 {
    compatible = "brcm,bcm2711-pcie";
    reg = <0x0 0x7d500000  0x0 0x9310>;
    device_type = "pci";
    #address-cells = <3>;
    #interrupt-cells = <1>;
    #size-cells = <2>;
    interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
                 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
    interrupt-names = "pcie", "msi";
    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
    interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143
                                                      IRQ_TYPE_LEVEL_HIGH>;
    msi-controller;
    msi-parent = <&pcie0>;

    ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000
              0x0 0x40000000>;
    /*
     * The wrapper around the PCIe block has a bug
     * preventing it from accessing beyond the first 3GB of
     * memory.
     */
    dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000
                  0x0 0xc0000000>;
    brcm,enable-ssc;
};

The interpretation of "reg" depends on the context. In this case, we are 
trying to interpret as a memory address from the CPU PoV when it has a 
different meaning (I am not exactly sure what).

In fact, you are lucky that Xen doesn't manage to interpret it. Xen 
should really stop trying to look region to map when it discover a PCI 
bus. I wrote a quick hack patch that should ignore it:

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 374bf655ee34..937fd1e387b7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1426,7 +1426,7 @@ static int __init handle_device(struct domain *d, 
struct dt_device_node *dev,

  static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                                struct dt_device_node *node,
-                              p2m_type_t p2mt)
+                              p2m_type_t p2mt, bool pci_bus)
  {
      static const struct dt_device_match skip_matches[] __initconst =
      {
@@ -1532,9 +1532,14 @@ static int __init handle_node(struct domain *d, 
struct kernel_info *kinfo,
                 "WARNING: Path %s is reserved, skip the node as we may 
re-use the path.\n",
                 path);

-    res = handle_device(d, node, p2mt);
-    if ( res)
-        return res;
+    if ( !pci_bus )
+    {
+        res = handle_device(d, node, p2mt);
+        if ( res)
+           return res;
+
+        pci_bus = dt_device_type_is_equal(node, "pci");
+    }

      /*
       * The property "name" is used to have a different name on older FDT
@@ -1554,7 +1559,7 @@ static int __init handle_node(struct domain *d, 
struct kernel_info *kinfo,

      for ( child = node->child; child != NULL; child = child->sibling )
      {
-        res = handle_node(d, kinfo, child, p2mt);
+        res = handle_node(d, kinfo, child, p2mt, pci_bus);
          if ( res )
              return res;
      }
@@ -2192,7 +2197,7 @@ static int __init prepare_dtb_hwdom(struct domain 
*d, struct kernel_info *kinfo)

      fdt_finish_reservemap(kinfo->fdt);

-    ret = handle_node(d, kinfo, dt_host, default_p2mt);
+    ret = handle_node(d, kinfo, dt_host, default_p2mt, false);
      if ( ret )
          goto err;

A less hackish possibility would be to modify dt_number_of_address() and 
return 0 when the device is a child of a PCI below.

Stefano, do you have any opinions?

Cheers,

-- 
Julien Grall

