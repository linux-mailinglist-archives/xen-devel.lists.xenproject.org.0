Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFA0774B88
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 22:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580437.908641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTTdq-0007Q7-JS; Tue, 08 Aug 2023 20:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580437.908641; Tue, 08 Aug 2023 20:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTTdq-0007OP-Gi; Tue, 08 Aug 2023 20:49:22 +0000
Received: by outflank-mailman (input) for mailman id 580437;
 Tue, 08 Aug 2023 20:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTTdp-0007Ln-I7
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 20:49:21 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aa53b01-362d-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 22:49:19 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691527754532158.44535830733014;
 Tue, 8 Aug 2023 13:49:14 -0700 (PDT)
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
X-Inumbo-ID: 0aa53b01-362d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691527755; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KY/s9YNKZ1aTKvo1EedCM+0ctLQxGveKJIHTVRzf0hIboO6dS39ezOOSu/9bbKhge5DmYYvroBDxQgf+TrhEqAv9fcmvEHjxQtQv/uFeGm9/UWAlsz0PYTX3TEwRdlLwVdXCCOcqkws0s/3FK0eHsiYODULc+GEoeLWHVRQQwf0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691527755; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/w/Am2MySHbgAw5P6JWjiaZULfNc48wFcVVLbQ8Y9YE=; 
	b=oE2WhI2WZUzZSYfHsGwTpum4wX0zuUrHt5baBLLSCGhItvVEMoDqH+5YBDogA87HxEl5y8aFi9lqcWTkRI1kftVZ6ul4daGerJmvDkfd4xtQcduXAw12YnBmuvEEnkluVF3UR9B0cXSDJ4ASHVfNLz+ZQZi6YdJ5wkY06M3iGW0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691527755;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/w/Am2MySHbgAw5P6JWjiaZULfNc48wFcVVLbQ8Y9YE=;
	b=AX32es/gDFgK+jw8qczNeHL3bcSOIezkDHseY3xF1gmbglwh1UAJ1uye6ePoA3pj
	JklQVTVhEdYsXQxnH8AYSSqkqbSf7l2UEfN3jSzq1CifwY2v+7Klo8YHRsnEudwwTw7
	2SqUxgroZJu+dlAPxNyNi4MInhCn4E0o9Y7YJrmY=
Message-ID: <76249714-6d1d-a2ad-cfe5-d7eae0ce3a1b@apertussolutions.com>
Date: Tue, 8 Aug 2023 16:49:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
 <3ddab6ee-54fc-49a0-8f14-79ca258d04af@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <3ddab6ee-54fc-49a0-8f14-79ca258d04af@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/4/23 05:03, Julien Grall wrote:
> Hi Daniel,
> 
> On 03/08/2023 11:44, Daniel P. Smith wrote:
>> +compatible
>> +  Identifies which hypervisors the configuration is compatible. 
>> Required.
>> -    hypervisor {
>> -        compatible = “hypervisor,xen”
>> +  Format: "hypervisor,<hypervisor name>", e.g "hypervisor,xen"
> 
> I read "e.g" as "for example". You don't explicitely say which 
> compatible will be supported by Xen, so one could write "hypervisor,foo" 
> and expect to work.
> 
> Also, it is not fully clear why you need both the hypervisor and each 
> domain node to have a compatible with the hypervisor name in it.

Ack, it should be explicit to what is expected for a Xen configuration. 
As for compatible on the domain node, I think that was from being overly 
cautious, it can be dropped.

This did get me reflecting that the compatibility was added there as 
there was some initial participation in standardization efforts going on 
at the time. I am not sure what has come of those, but the question it 
raised is that domain is a Xen specific term, whereas generally vm is 
accepted as the generic term. Maybe this node needs renaming?

>> +compatible
>> +  Identifies the hypervisor the confiugration is intended. Required.
> 
> Also typo: s/confiugration/configuration/

Ack.

>> -The modules that would be supplied when using the above config would be:
>> +  Format: "<hypervisor name>,config", e.g "xen,config"
>> -* (the above config, compiled into hardware tree)
>> -* CPU microcode
>> -* XSM policy
>> -* kernel for boot domain
>> -* ramdisk for boot domain
>> -* boot domain configuration file
>> -* kernel for the classic dom0 domain
>> -* ramdisk for the classic dom0 domain
>> +bootargs
>> +  This is used to provide the boot params for Xen.
> 
> How is this different from the command line parameter chosen? And if you 
> want to keep both, what is the expected priority if a user provides both?

A DT file for x86, there is only a need to provide the hypervisor node, 
for which we already needed a hypervisor config section to describe XSM 
policy and microcode, at this point at least. It was decided in an 
effort to provide flexibility, the ability to specify command line 
parameters to the hypervisor in DT config. It is expected these 
parameters would function as a base parameters that would be overridden 
by those provided via the multiboot kernel entry.

Now as you point out for Arm, this becomes a bit redundant, to a degree, 
as the Xen command line is already under the /chosen node. But even here 
it would be beneficial, as a hyperlaunch configuration could be 
distributed consisting of a dtb that has core parameters set with base 
values along with a set of kernels and ramdisks. At boot, the 
hyperlaunch dtb could then be concatenated with the device specific dtb.


>> -The hypervisor device tree would be compiled into the hardware device 
>> tree and
>> -provided to Xen using the standard method currently in use. The 
>> remaining
>> -modules would need to be loaded in the respective addresses specified 
>> in the
>> -`module-addr` property.
>> +  Format: String, e.g. "flask=silo"
>> +Child Nodes
>> +"""""""""""
>> -The Hypervisor node
>> --------------------
>> +* module
>> -The hypervisor node is a top level container for the domains that 
>> will be built
>> -by hypervisor on start up. On the ``hypervisor`` node the ``compatible``
>> -property is used to identify the type of hypervisor node present..
>> +Domain Node
>> +-----------
>> -compatible
>> -  Identifies the type of node. Required.
>> +A ``domain`` node is for describing the construction of a domain. 
>> Since there
>> +may be one or more domain nodes, each one requires a unique, DTB 
>> compliant name
>> +and a ``compatible`` property to identify as a domain node.
>> -The Config node
>> ----------------
>> +A ``domain`` node  may provide a ``domid`` property which will be 
>> used as the
>> +requested domain id for the domain with a value of “0” signifying to 
>> use the
>> +next available domain id, which is the default behavior if omitted. 
>> It should
>> +be noted that a domain configuration is not able to request a domid 
>> of “0”
> 
> Why do you need this restriction? And more importantly how would you 
> describe dom0 in hyperlaunch?

I would start by saying one of the goals/purposes behind hyperlaunch is 
to remove the binding that "dom0" is identified by having domid 0. That 
is what the roles patch recently submitted is working to achieve. "Dom0" 
is a role in the system, which I tried calling the "unbounded role" but 
that seems to have caused some confusion.

That aside, IMHO because of the legacy around domid 0, I don't think it 
should be assignable through hyperlaunch. Additionally, there should be 
an identifier that signifies auto-assign the domid and that value should 
not conflict/limit what domids are usable by the hypervisor. Given we 
should not be assigning domid 0 through this interface, it makes it the 
perfect candidate value.

>> +Beyond that, a domain node may have any of the following optional 
>> properties.
>> -A config node is for detailing any modules that are of interest to 
>> Xen itself.
>> -For example this would be where Xen would be informed of microcode or 
>> XSM
>> -policy locations. If the modules are multiboot modules and are able 
>> to be
>> -located by index within the module chain, the ``mb-index`` property 
>> should be
>> -used to specify the index in the multiboot module chain.. If the 
>> module will be
>> -located by physical memory address, then the ``module-addr`` property 
>> should be
>> -used to identify the location and size of the module.
>> +Properties
>> +""""""""""
>>   compatible
>> -  Identifies the type of node. Required.
>> -
>> -The Domain node
>> ----------------
>> +  Identifies the node as a domain node and for which hypervisor. 
>> Required.
>> -A domain node is for describing the construction of a domain. It may 
>> provide a
>> -domid property which will be used as the requested domain id for the 
>> domain
>> -with a value of “0” signifying to use the next available domain id, 
>> which is
>> -the default behavior if omitted. A domain configuration is not able 
>> to request
>> -a domid of “0”. After that a domain node may have any of the following
>> -parameters,
>> -
>> -compatible
>> -  Identifies the type of node. Required.
>> +  Format: "<hypervisor name>,domain", e.g "xen,domain"
>>   domid
>> -  Identifies the domid requested to assign to the domain. Required.
>> +  Identifies the domid requested to assign to the domain.
>> -permissions
>> +  Format: Integer, e.g <0>
>> +
>> +role
>>     This sets what Discretionary Access Control permissions
>>     a domain is assigned. Optional, default is none.
>> -functions
>> -  This identifies what system functions a domain will fulfill.
>> +  Format: Bitfield, e.g <3> or <0x00000003>
>> +
>> +          ROLE_NONE                (0)
>> +          ROLE_UNBOUNDED_DOMAIN    (1U<<0)
>> +          ROLE_CONTROL_DOMAIN      (1U<<1)
>> +          ROLE_HARDWARE_DOMAIN     (1U<<2)
>> +          ROLE_XENSTORE_DOMAIN     (1U<<3)
> 
> Please describe what each roles are meant for.

Agreed, but this obviously is in flux based on the current review of the 
roles patch.

>> +
>> +capability
>> +  This identifies what system capabilities a domain may have beyond 
>> the role it
>> +  was assigned.
>>     Optional, the default is none.
>> -.. note::  The `functions` bits that have been selected to indicate
>> -   ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last 
>> two bits
>> -   (30, 31) such that should these features ever be fully retired, 
>> the flags may
>> -   be dropped without leaving a gap in the flag set.
>> +  Format: Bitfield, e.g <3221225487> or <0xC0000007>
> 
> I thik we should favor the hexadecimal version because this will be 
> somewhat easier to read.

I too favor the hex version, but as I recall, DT/libfdt doesn't 
care/enforce.

> Also, the Device-Tree values work in term of 32-bit cell. Also, how do 
> you plan to handle the case where you have more than 32 capabilities?

I would add a capabalities2 field, this is how SELinux/Flask handle the 
same problem.

>> +
>> +          CAP_NONE            (0)
>> +          CAP_CONSOLE_IO      (1U<<0)
> 
> Please describe the capabilities.

Agreed and again, will change based on final version of roles patch.

>>   mode
>>     The mode the domain will be executed under. Required.
>> +  Format: Bitfield, e.g <5> or <0x00000005>
>> +
>> +          MODE_PARAVIRTUALIZED     (1 << 0) PV | PVH/HVM
>> +          MODE_ENABLE_DEVICE_MODEL (1 << 1) HVM | PVH
>> +          MODE_LONG                (1 << 2) 64 BIT | 32 BIT
>> +
>>   domain-uuid
>>     A globally unique identifier for the domain. Optional,
>>     the default is NULL.
>> +  Format: Byte Array, e.g [B3 FB 98 FB 8F 9F 67 A3]
>> +
>>   cpus
>>     The number of vCPUs to be assigned to the domain. Optional,
>>     the default is “1”.
>> +  Format: Integer, e.g <0>
> 
> This is odd to suggest to give '0' as an example. Wouldn't Xen throw an 
> error if a user provide it?

Good catch, though I am now thinking individual examples are not needed 
and the full example below should be sufficient.

>> +
>>   memory
>> -  The amount of memory to assign to the domain, in KBs.
>> +  The amount of memory to assign to the domain, in KBs. This field 
>> uses a DTB
>> +  Reg which contains a start and size. For memory allocation start 
>> may or may
>> +  not have significance but size will always be used for the amount 
>> of memory
>>     Required.
> 
> The description doesn't match...

Ack, others caught that as well. Will be fixed.

>> +  Format: String  min:<sz> | max:<sz> | <sz>, e.g. "256M"
> 
> ... the format. But strings are difficult to parse. If you want to 
> provide 3 different values (possibly optional), then it would be best to 
> have 3 different properties.

That format comes from the command line dom0 memory parameter, in the 
hyperlaunch series I reused that existing parser that I am fairly 
confident will be maintained.

> I will continue to review the rest later.

Great, thank you so much for your feedback thus far.

v/r,
dps

