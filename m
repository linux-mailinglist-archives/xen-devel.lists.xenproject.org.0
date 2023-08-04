Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F4476FCC5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576999.903761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRqiG-00005o-HV; Fri, 04 Aug 2023 09:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576999.903761; Fri, 04 Aug 2023 09:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRqiG-0008UY-Eu; Fri, 04 Aug 2023 09:03:12 +0000
Received: by outflank-mailman (input) for mailman id 576999;
 Fri, 04 Aug 2023 09:03:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRqiF-0008US-49
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:03:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRqiE-0005sO-3B; Fri, 04 Aug 2023 09:03:10 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.95.104.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRqiD-0004g7-Qw; Fri, 04 Aug 2023 09:03:09 +0000
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
	bh=+dhv7Xz6G0hkrYUySzHtu1LHHXk+PnYz26B7+9SAGWc=; b=LWhL/Wom9fUevXyJP728xdOzPA
	x0z8Zk48naKY19QBX+/K9pE+yzRyRkiuDtj2XfofyHVKTWAfwHtwTdyRFAGZhPk34PwpzCDD4qbXI
	5TUo/oINoNMmiYS7Lyjk28q8BckhM1LGPdUaWLwjfQbZmIPrDONnTJIFA4gan0Gq2b8M=;
Message-ID: <3ddab6ee-54fc-49a0-8f14-79ca258d04af@xen.org>
Date: Fri, 4 Aug 2023 10:03:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-GB
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230803104438.24720-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 03/08/2023 11:44, Daniel P. Smith wrote:
> +compatible
> +  Identifies which hypervisors the configuration is compatible. Required.
>   
> -    hypervisor {
> -        compatible = “hypervisor,xen”
> +  Format: "hypervisor,<hypervisor name>", e.g "hypervisor,xen"

I read "e.g" as "for example". You don't explicitely say which 
compatible will be supported by Xen, so one could write "hypervisor,foo" 
and expect to work.

Also, it is not fully clear why you need both the hypervisor and each 
domain node to have a compatible with the hypervisor name in it.

[...]

> +compatible
> +  Identifies the hypervisor the confiugration is intended. Required.

Also typo: s/confiugration/configuration/

>   
> -The modules that would be supplied when using the above config would be:
> +  Format: "<hypervisor name>,config", e.g "xen,config"
>   
> -* (the above config, compiled into hardware tree)
> -* CPU microcode
> -* XSM policy
> -* kernel for boot domain
> -* ramdisk for boot domain
> -* boot domain configuration file
> -* kernel for the classic dom0 domain
> -* ramdisk for the classic dom0 domain
> +bootargs
> +  This is used to provide the boot params for Xen.

How is this different from the command line parameter chosen? And if you 
want to keep both, what is the expected priority if a user provides both?

>   
> -The hypervisor device tree would be compiled into the hardware device tree and
> -provided to Xen using the standard method currently in use. The remaining
> -modules would need to be loaded in the respective addresses specified in the
> -`module-addr` property.
> +  Format: String, e.g. "flask=silo"
>   
> +Child Nodes
> +"""""""""""
>   
> -The Hypervisor node
> --------------------
> +* module
>   
> -The hypervisor node is a top level container for the domains that will be built
> -by hypervisor on start up. On the ``hypervisor`` node the ``compatible``
> -property is used to identify the type of hypervisor node present..
> +Domain Node
> +-----------
>   
> -compatible
> -  Identifies the type of node. Required.
> +A ``domain`` node is for describing the construction of a domain. Since there
> +may be one or more domain nodes, each one requires a unique, DTB compliant name
> +and a ``compatible`` property to identify as a domain node.
>   
> -The Config node
> ----------------
> +A ``domain`` node  may provide a ``domid`` property which will be used as the
> +requested domain id for the domain with a value of “0” signifying to use the
> +next available domain id, which is the default behavior if omitted. It should
> +be noted that a domain configuration is not able to request a domid of “0”

Why do you need this restriction? And more importantly how would you 
describe dom0 in hyperlaunch?

> +Beyond that, a domain node may have any of the following optional properties.
>   
> -A config node is for detailing any modules that are of interest to Xen itself.
> -For example this would be where Xen would be informed of microcode or XSM
> -policy locations. If the modules are multiboot modules and are able to be
> -located by index within the module chain, the ``mb-index`` property should be
> -used to specify the index in the multiboot module chain.. If the module will be
> -located by physical memory address, then the ``module-addr`` property should be
> -used to identify the location and size of the module.
> +Properties
> +""""""""""
>   
>   compatible
> -  Identifies the type of node. Required.
> -
> -The Domain node
> ----------------
> +  Identifies the node as a domain node and for which hypervisor. Required.
>   
> -A domain node is for describing the construction of a domain. It may provide a
> -domid property which will be used as the requested domain id for the domain
> -with a value of “0” signifying to use the next available domain id, which is
> -the default behavior if omitted. A domain configuration is not able to request
> -a domid of “0”. After that a domain node may have any of the following
> -parameters,
> -
> -compatible
> -  Identifies the type of node. Required.
> +  Format: "<hypervisor name>,domain", e.g "xen,domain"
>   
>   domid
> -  Identifies the domid requested to assign to the domain. Required.
> +  Identifies the domid requested to assign to the domain.
>   
> -permissions
> +  Format: Integer, e.g <0>
> +
> +role
>     This sets what Discretionary Access Control permissions
>     a domain is assigned. Optional, default is none.
>   
> -functions
> -  This identifies what system functions a domain will fulfill.
> +  Format: Bitfield, e.g <3> or <0x00000003>
> +
> +          ROLE_NONE                (0)
> +          ROLE_UNBOUNDED_DOMAIN    (1U<<0)
> +          ROLE_CONTROL_DOMAIN      (1U<<1)
> +          ROLE_HARDWARE_DOMAIN     (1U<<2)
> +          ROLE_XENSTORE_DOMAIN     (1U<<3)

Please describe what each roles are meant for.

> +
> +capability
> +  This identifies what system capabilities a domain may have beyond the role it
> +  was assigned.
>     Optional, the default is none.
>   
> -.. note::  The `functions` bits that have been selected to indicate
> -   ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last two bits
> -   (30, 31) such that should these features ever be fully retired, the flags may
> -   be dropped without leaving a gap in the flag set.
> +  Format: Bitfield, e.g <3221225487> or <0xC0000007>

I thik we should favor the hexadecimal version because this will be 
somewhat easier to read.

Also, the Device-Tree values work in term of 32-bit cell. Also, how do 
you plan to handle the case where you have more than 32 capabilities?

> +
> +          CAP_NONE            (0)
> +          CAP_CONSOLE_IO      (1U<<0)

Please describe the capabilities.

>   
>   mode
>     The mode the domain will be executed under. Required.
>   
> +  Format: Bitfield, e.g <5> or <0x00000005>
> +
> +          MODE_PARAVIRTUALIZED     (1 << 0) PV | PVH/HVM
> +          MODE_ENABLE_DEVICE_MODEL (1 << 1) HVM | PVH
> +          MODE_LONG                (1 << 2) 64 BIT | 32 BIT
> +
>   domain-uuid
>     A globally unique identifier for the domain. Optional,
>     the default is NULL.
>   
> +  Format: Byte Array, e.g [B3 FB 98 FB 8F 9F 67 A3]
> +
>   cpus
>     The number of vCPUs to be assigned to the domain. Optional,
>     the default is “1”.
>   
> +  Format: Integer, e.g <0>

This is odd to suggest to give '0' as an example. Wouldn't Xen throw an 
error if a user provide it?

> +
>   memory
> -  The amount of memory to assign to the domain, in KBs.
> +  The amount of memory to assign to the domain, in KBs. This field uses a DTB
> +  Reg which contains a start and size. For memory allocation start may or may
> +  not have significance but size will always be used for the amount of memory
>     Required.

The description doesn't match...

>   
> +  Format: String  min:<sz> | max:<sz> | <sz>, e.g. "256M"

... the format. But strings are difficult to parse. If you want to 
provide 3 different values (possibly optional), then it would be best to 
have 3 different properties.

I will continue to review the rest later.

Cheers,

-- 
Julien Grall

