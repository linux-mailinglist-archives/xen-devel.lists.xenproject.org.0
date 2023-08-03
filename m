Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD4176F033
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 18:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576516.902745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbeG-0007wM-BQ; Thu, 03 Aug 2023 16:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576516.902745; Thu, 03 Aug 2023 16:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbeG-0007te-7P; Thu, 03 Aug 2023 16:58:04 +0000
Received: by outflank-mailman (input) for mailman id 576516;
 Thu, 03 Aug 2023 16:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRbeF-0007tY-2C
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 16:58:03 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5b64568-321e-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 18:57:59 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691081874405559.5269101632989;
 Thu, 3 Aug 2023 09:57:54 -0700 (PDT)
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
X-Inumbo-ID: e5b64568-321e-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691081875; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jqqFM6/EMfOAtUrd5h8u3ybTWClM66RarMeijom0fgf+muYUb2yZ100tQan4qMFvJOSNeVrzj4TeLlvPpa9kmzZxmMeR2+8FCeEpuk2L/kBkM7ikq7Lq5nSRle2z6ysuyql4QLetZIPMhIsjAtcGUHF2TdWfF7C2fJIikDg8LCk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691081875; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=g4Ss0M45LZqDBXjGFDnG/1CBGH1BmnZ0+WnJqg4+oiU=; 
	b=DGzCJAJL7TVQTOxXK5dCB9oWvFiS5Okq2q08RRUJw9N0prMIkT5CZCH8ho4QjC1PqAHovj8lx04NP5ZLMEzNLEs3nD71AbZrOZ/7Mplm5Ih9DjqisM/54ZchSnD3DIk7JSryo3hRtaZLbUfp0TndWWGVvJWbrd0khkxwMkoSwq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691081875;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=g4Ss0M45LZqDBXjGFDnG/1CBGH1BmnZ0+WnJqg4+oiU=;
	b=Xt43XqDNNNyxQTDXbN8WxgvcUidAa01DhWQnZoOV5xSeUyCsEslDKQlVDfnBzWT0
	PI9sSVCt9Sta3mpzXnlLPZu1WM5o18NbWW8etc49UrK3NDHXRRUwv2wjHHnF620vOYf
	S73BAxAbq1L7Awub8mn6FRnb4s3D6kKgIDIMaEsc=
Message-ID: <65e62111-7997-de4d-cf12-15d89ec87471@apertussolutions.com>
Date: Thu, 3 Aug 2023 12:57:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
 <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/3/23 07:45, Michal Orzel wrote:
> Hi Daniel,
> 
> On 03/08/2023 12:44, Daniel P. Smith wrote:
>>
>>
>> With on going development of hyperlaunch, changes to the device tree definitions
>> has been necessary. This commit updates the specification for all current changes
>> along with changes expected to be made in finalizing the capability.
>>
>> This commit also adds a HYPERLAUNCH section to the MAINTAINERS file and places
>> this documentation under its purview. It also reserves the path
>> `xen/common/domain-builder` for the hyperlaunch domain builder code base.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   MAINTAINERS                                   |   9 +
>>   .../designs/launch/hyperlaunch-devicetree.rst | 566 ++++++++++--------
>>   2 files changed, 309 insertions(+), 266 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d8a02a6c19..694412a961 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -332,6 +332,15 @@ M: Nick Rosbrook <rosbrookn@gmail.com>
>>   S:     Maintained
>>   F:     tools/golang
>>
>> +HYPERLAUNCH
>> +M:     Daniel P. Smith <dpsmith@apertussolutions.com>
>> +M:     Christopher Clark <christopher.w.clark@gmail.com>
>> +W:     https://wiki.xenproject.org/wiki/Hyperlaunch
>> +S:     Supported
>> +F:     docs/design/launch/hyperlaunch.rst
>> +F:     docs/design/launch/hyperlaunch-devicetree.rst
>> +F:     xen/common/domain-builder/
>> +
>>   HYPFS
>>   M:     Juergen Gross <jgross@suse.com>
>>   S:     Supported
>> diff --git a/docs/designs/launch/hyperlaunch-devicetree.rst b/docs/designs/launch/hyperlaunch-devicetree.rst
>> index b49c98cfbd..0bc719e4ae 100644
>> --- a/docs/designs/launch/hyperlaunch-devicetree.rst
>> +++ b/docs/designs/launch/hyperlaunch-devicetree.rst
>> @@ -2,10 +2,11 @@
>>   Xen Hyperlaunch Device Tree Bindings
>>   -------------------------------------
>>
>> -The Xen Hyperlaunch device tree adopts the dom0less device tree structure and
>> -extends it to meet the requirements for the Hyperlaunch capability. The primary
>> -difference is the introduction of the ``hypervisor`` node that is under the
>> -``/chosen`` node. The move to a dedicated node was driven by:
>> +The Xen Hyperlaunch device tree is informed by the dom0less device tree
>> +structure with extensions to meet the requirements for the Hyperlaunch
>> +capability. A major depature from the dom0less device tree is the introduction
>> +of the ``hypervisor`` node that is under the ``/chosen`` node. The move to a
>> +dedicated node was driven by:
>>
>>   1. Reduces the need to walk over nodes that are not of interest, e.g. only
>>      nodes of interest should be in ``/chosen/hypervisor``
>> @@ -13,331 +14,364 @@ difference is the introduction of the ``hypervisor`` node that is under the
>>   2. Allows for the domain construction information to easily be sanitized by
>>      simple removing the ``/chosen/hypervisor`` node.
>>
>> -Example Configuration
>> ----------------------
>> -
>> -Below are two example device tree definitions for the hypervisor node. The
>> -first is an example of a multiboot-based configuration for x86 and the second
>> -is a module-based configuration for Arm.
>> -
>> -Multiboot x86 Configuration:
>> -""""""""""""""""""""""""""""
>> -
>> -::
>> -
>> -    hypervisor {
>> -        #address-cells = <1>;
>> -        #size-cells = <0>;
>> -        compatible = “hypervisor,xen”
>> -
>> -        // Configuration container
>> -        config {
>> -            compatible = "xen,config";
>> -
>> -            module {
>> -                compatible = "module,microcode", "multiboot,module";
>> -                mb-index = <1>;
>> -            };
>> -
>> -            module {
>> -                compatible = "module,xsm-policy", "multiboot,module";
>> -                mb-index = <2>;
>> -            };
>> -        };
>> -
>> -        // Boot Domain definition
>> -        domain {
>> -            compatible = "xen,domain";
>> -
>> -            domid = <0x7FF5>;
>> -
>> -            // FUNCTION_NONE            (0)
>> -            // FUNCTION_BOOT            (1 << 0)
>> -            // FUNCTION_CRASH           (1 << 1)
>> -            // FUNCTION_CONSOLE         (1 << 2)
>> -            // FUNCTION_XENSTORE        (1 << 30)
>> -            // FUNCTION_LEGACY_DOM0     (1 << 31)
>> -            functions = <0x00000001>;
>> -
>> -            memory = <0x0 0x20000>;
>> -            cpus = <1>;
>> -            module {
>> -                compatible = "module,kernel", "multiboot,module";
>> -                mb-index = <3>;
>> -            };
>> -
>> -            module {
>> -                compatible = "module,ramdisk", "multiboot,module";
>> -                mb-index = <4>;
>> -            };
>> -            module {
>> -                compatible = "module,config", "multiboot,module";
>> -                mb-index = <5>;
>> -            };
>> -
>> -        // Classic Dom0 definition
>> -        domain {
>> -            compatible = "xen,domain";
>> -
>> -            domid = <0>;
>> -
>> -            // PERMISSION_NONE          (0)
>> -            // PERMISSION_CONTROL       (1 << 0)
>> -            // PERMISSION_HARDWARE      (1 << 1)
>> -            permissions = <3>;
>> -
>> -            // FUNCTION_NONE            (0)
>> -            // FUNCTION_BOOT            (1 << 0)
>> -            // FUNCTION_CRASH           (1 << 1)
>> -            // FUNCTION_CONSOLE         (1 << 2)
>> -            // FUNCTION_XENSTORE        (1 << 30)
>> -            // FUNCTION_LEGACY_DOM0     (1 << 31)
>> -            functions = <0xC0000006>;
>> -
>> -            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
>> -            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
>> -            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
>> -            mode = <5>; /* 64 BIT, PV */
>> -
>> -            // UUID
>> -            domain-uuid = [B3 FB 98 FB 8F 9F 67 A3];
>> -
>> -            cpus = <1>;
>> -            memory = <0x0 0x20000>;
>> -            security-id = “dom0_t;
>> -
>> -            module {
>> -                compatible = "module,kernel", "multiboot,module";
>> -                mb-index = <6>;
>> -                bootargs = "console=hvc0";
>> -            };
>> -            module {
>> -                compatible = "module,ramdisk", "multiboot,module";
>> -                mb-index = <7>;
>> -            };
>> -    };
>> -
>> -The multiboot modules supplied when using the above config would be, in order:
>> +The Hypervisor node
>> +-------------------
>>
>> -* (the above config, compiled)
>> -* CPU microcode
>> -* XSM policy
>> -* kernel for boot domain
>> -* ramdisk for boot domain
>> -* boot domain configuration file
>> -* kernel for the classic dom0 domain
>> -* ramdisk for the classic dom0 domain
>> +The ``hypervisor`` node is a top level container for all information relating
>> +to how the hyperlaunch is to proceed. This includes definitions of the domains
>> +that will be built by hypervisor on start up. The node will be named
>> +``hypervisor``  with a ``compatible`` property to identify which hypervisors
>> +the configuration is intended. The hypervisor node will consist of one or more
>> +config nodes and one or more domain nodes.
>>
>> -Module Arm Configuration:
>> -"""""""""""""""""""""""""
>> +Properties
>> +""""""""""
>>
>> -::
>> +compatible
>> +  Identifies which hypervisors the configuration is compatible. Required.
>>
>> -    hypervisor {
>> -        compatible = “hypervisor,xen”
>> +  Format: "hypervisor,<hypervisor name>", e.g "hypervisor,xen"
>>
>> -        // Configuration container
>> -        config {
>> -            compatible = "xen,config";
>> +Child Nodes
>> +"""""""""""
>>
>> -            module {
>> -                compatible = "module,microcode”;
>> -                module-addr = <0x0000ff00 0x80>;
>> -            };
>> +* config
>> +* domain
>>
>> -            module {
>> -                compatible = "module,xsm-policy";
>> -                module-addr = <0x0000ff00 0x80>;
>> +Config Node
>> +-----------
>>
>> -            };
>> -        };
>> +A ``config`` node is for passing configuration data and identifying any boot
>> +modules that is of interest to the hypervisor.  For example this would be where
>> +Xen would be informed of microcode or XSM policy locations. Each ``config``
>> +node will require a unique device-tree compliant name as there may be one or
>> +more ``config`` nodes present in a single dtb file. To identify which
>> +hypervisor the configuration is intended, the required ``compatible`` property
>> +must be present.
>>
>> -        // Boot Domain definition
>> -        domain {
>> -            compatible = "xen,domain";
>> -
>> -            domid = <0x7FF5>;
>> -
>> -            // FUNCTION_NONE            (0)
>> -            // FUNCTION_BOOT            (1 << 0)
>> -            // FUNCTION_CRASH           (1 << 1)
>> -            // FUNCTION_CONSOLE         (1 << 2)
>> -            // FUNCTION_XENSTORE        (1 << 30)
>> -            // FUNCTION_LEGACY_DOM0     (1 << 31)
>> -            functions = <0x00000001>;
>> -
>> -            memory = <0x0 0x20000>;
>> -            cpus = <1>;
>> -            module {
>> -                compatible = "module,kernel";
>> -                module-addr = <0x0000ff00 0x80>;
>> -            };
>> +While the config node is not meant to replace the hypervisor commandline, there
>> +may be cases where it is better suited for passing configuration details at
>> +boot time.  This additional information may be carried in properties assigned
>> +to a ``config`` node. If there are any boot modules that are intended for the
>> +hypervisor, then a ``module`` child node should be provided to identify the
>> +boot module.
>>
>> -            module {
>> -                compatible = "module,ramdisk";
>> -                module-addr = <0x0000ff00 0x80>;
>> -            };
>> -            module {
>> -                compatible = "module,config";
>> -                module-addr = <0x0000ff00 0x80>;
>> -            };
>> +Properties
>> +""""""""""
>>
>> -        // Classic Dom0 definition
>> -        domain@0 {
>> -            compatible = "xen,domain";
>> -
>> -            domid = <0>;
>> -
>> -            // PERMISSION_NONE          (0)
>> -            // PERMISSION_CONTROL       (1 << 0)
>> -            // PERMISSION_HARDWARE      (1 << 1)
>> -            permissions = <3>;
>> -
>> -            // FUNCTION_NONE            (0)
>> -            // FUNCTION_BOOT            (1 << 0)
>> -            // FUNCTION_CRASH           (1 << 1)
>> -            // FUNCTION_CONSOLE         (1 << 2)
>> -            // FUNCTION_XENSTORE        (1 << 30)
>> -            // FUNCTION_LEGACY_DOM0     (1 << 31)
>> -            functions = <0xC0000006>;
>> -
>> -            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
>> -            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
>> -            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
>> -            mode = <5>; /* 64 BIT, PV */
>> -
>> -            // UUID
>> -            domain-uuid = [B3 FB 98 FB 8F 9F 67 A3];
>> -
>> -            cpus = <1>;
>> -            memory = <0x0 0x20000>;
>> -            security-id = “dom0_t”;
>> -
>> -            module {
>> -                compatible = "module,kernel";
>> -                module-addr = <0x0000ff00 0x80>;
>> -                bootargs = "console=hvc0";
>> -            };
>> -            module {
>> -                compatible = "module,ramdisk";
>> -                module-addr = <0x0000ff00 0x80>;
>> -            };
>> -    };
>> +compatible
>> +  Identifies the hypervisor the confiugration is intended. Required.
>>
>> -The modules that would be supplied when using the above config would be:
>> +  Format: "<hypervisor name>,config", e.g "xen,config"
>>
>> -* (the above config, compiled into hardware tree)
>> -* CPU microcode
>> -* XSM policy
>> -* kernel for boot domain
>> -* ramdisk for boot domain
>> -* boot domain configuration file
>> -* kernel for the classic dom0 domain
>> -* ramdisk for the classic dom0 domain
>> +bootargs
>> +  This is used to provide the boot params for Xen.
>>
>> -The hypervisor device tree would be compiled into the hardware device tree and
>> -provided to Xen using the standard method currently in use. The remaining
>> -modules would need to be loaded in the respective addresses specified in the
>> -`module-addr` property.
>> +  Format: String, e.g. "flask=silo"
>>
>> +Child Nodes
>> +"""""""""""
>>
>> -The Hypervisor node
>> --------------------
>> +* module
>>
>> -The hypervisor node is a top level container for the domains that will be built
>> -by hypervisor on start up. On the ``hypervisor`` node the ``compatible``
>> -property is used to identify the type of hypervisor node present..
>> +Domain Node
>> +-----------
>>
>> -compatible
>> -  Identifies the type of node. Required.
>> +A ``domain`` node is for describing the construction of a domain. Since there
>> +may be one or more domain nodes, each one requires a unique, DTB compliant name
>> +and a ``compatible`` property to identify as a domain node.
>>
>> -The Config node
>> ----------------
>> +A ``domain`` node  may provide a ``domid`` property which will be used as the
>> +requested domain id for the domain with a value of “0” signifying to use the
>> +next available domain id, which is the default behavior if omitted. It should
>> +be noted that a domain configuration is not able to request a domid of “0”.
>> +Beyond that, a domain node may have any of the following optional properties.
>>
>> -A config node is for detailing any modules that are of interest to Xen itself.
>> -For example this would be where Xen would be informed of microcode or XSM
>> -policy locations. If the modules are multiboot modules and are able to be
>> -located by index within the module chain, the ``mb-index`` property should be
>> -used to specify the index in the multiboot module chain.. If the module will be
>> -located by physical memory address, then the ``module-addr`` property should be
>> -used to identify the location and size of the module.
>> +Properties
>> +""""""""""
>>
>>   compatible
>> -  Identifies the type of node. Required.
>> -
>> -The Domain node
>> ----------------
>> +  Identifies the node as a domain node and for which hypervisor. Required.
>>
>> -A domain node is for describing the construction of a domain. It may provide a
>> -domid property which will be used as the requested domain id for the domain
>> -with a value of “0” signifying to use the next available domain id, which is
>> -the default behavior if omitted. A domain configuration is not able to request
>> -a domid of “0”. After that a domain node may have any of the following
>> -parameters,
>> -
>> -compatible
>> -  Identifies the type of node. Required.
>> +  Format: "<hypervisor name>,domain", e.g "xen,domain"
>>
>>   domid
>> -  Identifies the domid requested to assign to the domain. Required.
>> +  Identifies the domid requested to assign to the domain.
>>
>> -permissions
>> +  Format: Integer, e.g <0>
>> +
>> +role
>>     This sets what Discretionary Access Control permissions
>>     a domain is assigned. Optional, default is none.
>>
>> -functions
>> -  This identifies what system functions a domain will fulfill.
>> +  Format: Bitfield, e.g <3> or <0x00000003>
>> +
>> +          ROLE_NONE                (0)
>> +          ROLE_UNBOUNDED_DOMAIN    (1U<<0)
>> +          ROLE_CONTROL_DOMAIN      (1U<<1)
>> +          ROLE_HARDWARE_DOMAIN     (1U<<2)
>> +          ROLE_XENSTORE_DOMAIN     (1U<<3)
>> +
>> +capability
>> +  This identifies what system capabilities a domain may have beyond the role it
>> +  was assigned.
>>     Optional, the default is none.
>>
>> -.. note::  The `functions` bits that have been selected to indicate
>> -   ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last two bits
>> -   (30, 31) such that should these features ever be fully retired, the flags may
>> -   be dropped without leaving a gap in the flag set.
>> +  Format: Bitfield, e.g <3221225487> or <0xC0000007>
>> +
>> +          CAP_NONE            (0)
>> +          CAP_CONSOLE_IO      (1U<<0)
>>
>>   mode
>>     The mode the domain will be executed under. Required.
>>
>> +  Format: Bitfield, e.g <5> or <0x00000005>
>> +
>> +          MODE_PARAVIRTUALIZED     (1 << 0) PV | PVH/HVM
>> +          MODE_ENABLE_DEVICE_MODEL (1 << 1) HVM | PVH
>> +          MODE_LONG                (1 << 2) 64 BIT | 32 BIT
>> +
>>   domain-uuid
>>     A globally unique identifier for the domain. Optional,
>>     the default is NULL.
>>
>> +  Format: Byte Array, e.g [B3 FB 98 FB 8F 9F 67 A3]
>> +
>>   cpus
>>     The number of vCPUs to be assigned to the domain. Optional,
>>     the default is “1”.
>>
>> +  Format: Integer, e.g <0>
>> +
>>   memory
>> -  The amount of memory to assign to the domain, in KBs.
>> +  The amount of memory to assign to the domain, in KBs. This field uses a DTB
>> +  Reg which contains a start and size. For memory allocation start may or may
>> +  not have significance but size will always be used for the amount of memory
>>     Required.
>>
>> +  Format: String  min:<sz> | max:<sz> | <sz>, e.g. "256M"
> There is a mismatch between the description and above format:
> - KB vs MB
> - string vs reg format
> - the x86 example uses string and Arm uses reg format

Hmmm. I missed this in the hyperlaunch v1 update. In the original design 
that came from the working group it was going to use a reg as suggest by 
dom0less. During development of v1, we found it was not rich enough to 
express how Dom0 could be allocated memory and switched to a string to 
mirror the dom0 memory hypervisor command line parameter.

A question for those involved with dom0less, is what are the opinions 
about using this form for memory allocation. Is it required/possible to 
be able to instruct the hypervisor what physical address to use as the 
start of a domain's memory?

>> +
>>   security-id
>>     The security identity to be assigned to the domain when XSM
>>     is the access control mechanism being used. Optional,
>> -  the default is “domu_t”.
>> +  the default is “system_u:system_r:domU_t”.
>> +
>> +  Format: string, e.g. "system_u:system_r:domU_t"
> This is specifying full label (as expected) whereas the examples use only type

Ack, the examples needs fixing.

>> +
>> +Child Nodes
>> +"""""""""""
>> +
>> +* module
>> +
>> +Module node
>> +-----------
>>
>> -The Module node
>> ----------------
>> +This node describes a boot module loaded by the boot loader. A ``module`` node
>> +will often appear repeatedly and will require a unique and DTB compliant name
>> +for each instance. The compatible property is required to identify that the
>> +node is a ``module`` node, the type of boot module, and what it represents.
>>
>> -This node describes a boot module loaded by the boot loader. The required
>> -compatible property follows the format: module,<type> where type can be
>> -“kernel”, “ramdisk”, “device-tree”, “microcode”, “xsm-policy” or “config”. In
>> -the case the module is a multiboot module, the additional property string
>> -“multiboot,module” may be present. One of two properties is required and
>> -identifies how to locate the module. They are the mb-index, used for multiboot
>> -modules, and the module-addr for memory address based location.
>> +Depending on the type of boot module, the ``module`` node will require either a
>> +``module-index`` or ``module-addr`` property must be present. They provide the
>> +boot module specific way of locating the boot module in memory.
>> +
>> +Properties
>> +""""""""""
>>
>>   compatible
>>     This identifies what the module is and thus what the hypervisor
>>     should use the module for during domain construction. Required.
>>
>> -mb-index
>> -  This identifies the index for this module in the multiboot module chain.
>> +  Format: "module,<module type>"[, "module,<locating type>"]
>> +          module type: kernel, ramdisk, device-tree, microcode, xsm-policy,
>> +                       config
>> +
>> +          locating type: index, addr
>> +
>> +module-index
>> +  This identifies the index for this module when in a module chain.
>>     Required for multiboot environments.
>>
>> +  Format: Integer, e.g. <0>
>> +
>>   module-addr
>>     This identifies where in memory this module is located. Required for
>>     non-multiboot environments.
>>
>> +  Format: DTB Reg <start size>, e.g. <0x0 0x20000>
> I guess the number of cells for start and size will be taken from #address-celss and #size-cells
> defined either in /chosen or a config/domain node?

Correct, in the working group, that is what we were informed was the 
desired approach.

> Also, what is the plan for the existing dom0less dt properties?
> Will they need to be moved to new /hypervisor node or we will have to parse both /chosen and /hypervisor nodes?

In the proposal I sent to xen-devel in response to Luca's RFC for 
rebranding dom0less features under hyperlaunch, that is the purpose of 
this commit. Get this document up to date with what was done in v1 along 
with what we are planning/working on for hyperlaunch. One could think of 
this as effectively the API to the capabilities hyperlaunch will 
provide. Not just how to construct a domain, but what kinds of domains 
can be constructed by hyperlaunch. Step one of the proposal is to 
publish a patch upon which we all can iterate over and get to an 
agreement on a suitable interface for all. The next step would be the 
introduction of hyperlaunch dom0less compatibility mode, that would see 
the moving of the parsing logic for the existing dom0less nodes under 
/xen/common/domain-builder. It would continue to exist there even after 
hyperlaunch proper is merged and can remain there for backward 
compatibility until there is a decision to retire the compatibility 
interface.

v/r,
dps


