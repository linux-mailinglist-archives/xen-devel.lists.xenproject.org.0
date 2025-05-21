Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C12ABF99B
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 17:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992100.1375879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlXJ-00066z-6V; Wed, 21 May 2025 15:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992100.1375879; Wed, 21 May 2025 15:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlXJ-00064h-3c; Wed, 21 May 2025 15:39:17 +0000
Received: by outflank-mailman (input) for mailman id 992100;
 Wed, 21 May 2025 15:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvEX=YF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uHlXI-00064b-4S
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 15:39:16 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be5adc25-3659-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 17:39:13 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747841949196258.15362504154143;
 Wed, 21 May 2025 08:39:09 -0700 (PDT)
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
X-Inumbo-ID: be5adc25-3659-11f0-a2fa-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1747841950; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OZIUfmRvCVnNETPzommRHutb0jMPgejoNWFt8Xy8Tu1ot/pLPcUBagdWXppxlOgzXa4gNzXWh0uCTHkkWISejhIdw8lVp/L8JJcksOiOrPK+2xa58gdcDmetvu60f+40Wg8uNdFbVtd6a8uoF0CDQP1vOH0FwgbL0B4Y29le3Qo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747841950; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=wQvoDCGpLpyz8uDJKqSsfk2KWp4dhhdOk5HLxm6M23U=; 
	b=Bwpey/p6Wkppjcuu1exIyCUE8u1mKYalgzT7+OSCRyJlbUEvpKKRDLFkczBRkz6CDG1AY8XOM+DzOrhuV6qplm8oqGiJtUVfgt+hxSXx2IdU/tGppqU3xvsswAoqgsZ/QHDosxjljlo60Cx0TSlYYWIxJk/U5TjzIQTr9CCaFDA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747841950;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:References:From:From:To:To:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=wQvoDCGpLpyz8uDJKqSsfk2KWp4dhhdOk5HLxm6M23U=;
	b=pdcDbB1/DdXPqu3AQl7cd0KZ80j/sj5453BwDvCAynlEPMVmdeZpvKLaemvdA13j
	1onvRzREoluoee6EJCyWXqld3+EUlv7ZDn9fmXKOkIqm72girFc25T/g67lNvnkhmI7
	4G/G6yLD/KxaXTcwycwJ2BRKWIzcNvUq8tKulf0o=
Message-ID: <ba4ace43-b736-409b-a582-b730c763694e@apertussolutions.com>
Date: Wed, 21 May 2025 11:39:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Hyperlaunch Device Tree Discussion
Content-Language: en-US
References: <85d65163-6120-4653-8ed5-e7752ae7ce48@apertussolutions.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <85d65163-6120-4653-8ed5-e7752ae7ce48@apertussolutions.com>
X-Forwarded-Message-Id: <85d65163-6120-4653-8ed5-e7752ae7ce48@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Greetings,

Per my response to Allejandro's message, here is the response sent the 
the DTB working group formed last year to discuss DTB parsing for x86.


Original Message:

I have copied everyone that attended the hyperlaunch working group a few 
weeks back to ensure everyone has a chance to review and comment.

As a start and to provide a common understanding, first is a quick 
overview of Flattened Device Tree and Xen's "Unflattened Device Tree". 
The intent is to assist everyone in having an equal footing when 
considering the impacts that Device Tree parsing brings.

A Flattened Device Tree (FDT) is a nested linear tree structure that 
uses a combination of tags, layout definition, and headers to allow 
navigation through the tree. Because the layout is nested, if given the 
offset for a node in the FDT, it is possible to start at that node and 
jump directly into the tree to access child nodes and properties. 
Provided below is a visual representation of what any parent node, 
including the root node, may look like:

+------------------------------+
| NODE TAG (parent node)       |
+------------------------------+
| Null-term String (node name) |
+------------------------------+
| PROPERTY TAG                 |
+------------------------------+
| struct property {            |
|   u32 len                    |
|   u32 name_offset            |
| }                            |
+------------------------------+
| Property Data                |
+------------------------------+
| NODE TAG (child node)        |
+------------------------------+
| Null-term String (node name) |
+------------------------------+
| PROPERTY TAG                 |
+------------------------------+
| struct property {            |
|   u32 len                    |
|   u32 name_offset            |
| }                            |
+------------------------------+
| Property Data                |
+------------------------------+
| END NODE TAG (child node)    |
+------------------------------+
| END NODE TAG (parent node)   |
+------------------------------+

Before moving forward, let us clarify some terminology to ensure a 
common understanding when discussing a tree.

  - node path: represents a series of hierarchical child nodes starting 
at the root node
  - adjacent node: the logically next node that is at the same level in 
the tree
  - child node: a node that is a one level lower leaf to another node, 
the parent node
  - tree walk: incrementally walking the nodes, to locate a specific 
node or to iterate over the whole tree

The libfdt library provides handlers for finding the offset of a node, 
as well as handlers to jump to a node offset and iterate only on the 
child nodes. While the libfdt is fairly optimized, the reality is that 
to find a node, the library must do a tree walk starting with the first 
node written in the FDT. If a node is not a path match at the current 
depth, it must cross a null terminated string, all the node's property 
entries and all children nodes to reach the next adjacent node. Once a 
path match for the depth is found, then the search may descend into the 
next depth and repeat the process until a match at that level is found.

This brings us to Xen's "Unflattened Device Tree" (UDT), for which I am 
quoting as I find myself thinking of it in another way, which IMHO is a 
more descriptive name, which is that it is an FDT lookup index. It just 
happens that the implementation for the lookup index structure is a tree 
structure. UDT uses a structure to represent a node and one to represent 
a property. The node structure is a traditional tree structure with 
adjacent and child node pointers. The contents of both structures are 
pointers to the respective memory locations within the FDT. As with the 
FDT, in order to locate a node in the index, a tree walk of the index 
must be done. The difference comes when a node is not a path match, to 
reach the adjacent node, it only needs to access the node pointed to by 
the adjacent node pointer of the current node. UDT provides an API for 
walking the node tree, walking the property list for a node, and methods 
for type-interpreted extraction of property values. NB: the 
type-interpreted extraction API is codified around taking a UDT property 
structure, but the interpreted extraction logic isn't UDT specific as it 
is still reading the property value from the FDT.

The benefit UDT brings is when repeated node lookups and/or repeated 
phandle dereferencing are done. For both FDT and UDT, a tree walk must 
be done. The walk will start with a node, either the root node or one 
for which a reference has already been found, walking each adjacent node 
and descending into a node's children when a path match occurs. For 
phandle dereferencing, the benefit is greater due to the fact that when 
indexing the FDT, phandles get dereferenced, thus allowing direct 
reference in the index. For comparison, a phandle dereference using 
libfdt does a walk of the tree to find the node referenced by the phandle.

The UDT, as implemented, is not without cost. The current implementation 
takes two complete walks of the entire FDT using libfdt. The first pass 
is to obtain the amount of memory that is required to allocate enough 
instances of the UDT node and property structures to represent the full 
tree. The second pass is when the FDT nodes and properties are indexed 
into the UDT.

With the expense of using FDT and UDT established, it is important to 
put that expense into context. Consider hyperlaunch on x86 where the 
arch itself has no DT requirements. In all likelihood, an FDT 
constructed for this arch would only contain the nodes necessary for 
hyperlaunch. If hyperlaunch were constructed x86 only, loading the 
configuration could be done in a single full walk of the FDT, even when 
considering phandle usage. The reason this is true for the phandles 
case, is that as nodes known to be a phandle target are encountered, 
their offset into the FDT could be stored with dereferencing resolved 
post walk.

For DT based archs, currently accepted costs are two FDT node lookups 
along with the two full walks to construct the UDT. These first two node 
lookups being the memory allocation table and the Xen command line. As 
noted above, an FDT node lookup requires a walk of the linear tree until 
the node is located. AIUI at this point is that the number of nodes that 
must be crossed is indeterminate. I did not see anything in the device 
tree specification that the FDT must be packed in the same order as the 
string representation. NB: I have not reviewed the DT compiler to see if 
it optimizes for early access nodes to be packed at the beginning of the 
linear tree to reduce the number of nodes that must be crossed.

While the aforementioned strategy for x86 would be optimal for x86, it 
is not necessarily the best for DT based archs. Hyperlaunch started, and 
currently is, focused on the x86 arch, but long term it was always 
understood that its more expansive design would be desirable by all 
archs. Like anything that moves into common, a slightly less efficient 
approach for one platform is accepted for the benefit of a common 
implementation that reduces the amount of code while increasing the 
number of reviewers.

After listening to everyone's concerns, re-reviewing all of Arm's device 
tree logic, and considering everything in totality, the conclusion is 
that there is a core root cause from with which all the concerns raised 
flow. First a summary of the main concerns raised,

  - The issue of memory allocator(s) available at the time when the 
first FDT walk/parsing occurs.
  - Overhead of doing a more than one FDT walk to obtain the hyperlaunch 
configuration when phandles are in use.
  - Supporting FDT would require the introduction of a 
duplicate/competing set of property parsers.

This root cause is due to a design decision difference made for the 
hyperlaunch domain builder versus the dom0less domain builder and Arm's 
approach to device tree parsing. For dom0less, the approach is to walk 
the UDT index tree at the domain construction time, which appears to 
stem from Arm's need and practice of repeatedly accessing device tree 
entries. Whereas x86 has no need for the device tree and took the 
approach to do a single walk to extract its configuration into a code 
usable structure.

With that understanding, it is believed that these two approaches are 
not diametrically opposed and in fact can be blended together to result 
in a generally optimized approach. The approach will be to conduct two 
full walks of the FDT, an early boot pass before memory allocation is 
available and a second pass after a memory allocator is set up. Both 
passes serve to populate the proposed boot info structure, specifically 
the scope of these passes are as follows:

Early FDT Walk: (static values)
  - calculate the space required for the device tree index
  - count the number of domains defined
  - Xen command line
  - XSM policy
  - arch specific static values, via an arch_early_fdt()

Late FDT Walk: (dynamic values)
  - construct device tree index, aka "unflattened device tree"
  - populate boot modules entries (NB: boot modules are expected to be 
static array)
  - store device tree node index for top level index and hyperlaunch node
  - populate boot domain entries, basis will be device tree index node
  - arch specific dynamic values, via an arch_late_fdt()

By taking this approach which is constructed around a set of arch 
neutral structures will enable another goal of the hyperlaunch series, 
which is to move to having a common domain creation/construction logic. 
Currently, there is a significant amount of duplication in each arch's 
branch for boot time construction of domains. It will also allow 
removing arch specific code from the initialization of common 
infrastructure such as XSM.

V/r,
Daniel P. Smith

