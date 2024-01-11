Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3C382AEAF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 13:27:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666267.1036775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNu9X-0005YJ-Md; Thu, 11 Jan 2024 12:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666267.1036775; Thu, 11 Jan 2024 12:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNu9X-0005VJ-J3; Thu, 11 Jan 2024 12:27:19 +0000
Received: by outflank-mailman (input) for mailman id 666267;
 Thu, 11 Jan 2024 12:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WCg5=IV=bounce.vates.tech=bounce-md_30504962.659fdea2.v1-67bed4a62c204c4ab1070e00b57b904a@srs-se1.protection.inumbo.net>)
 id 1rNu9W-0005T6-3z
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 12:27:18 +0000
Received: from mail136-6.atl41.mandrillapp.com
 (mail136-6.atl41.mandrillapp.com [198.2.136.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0e4776f-b07c-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 13:27:16 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-6.atl41.mandrillapp.com (Mailchimp) with ESMTP id 4T9kSf68pSzlfcV4
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 12:27:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 67bed4a62c204c4ab1070e00b57b904a; Thu, 11 Jan 2024 12:27:14 +0000
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
X-Inumbo-ID: c0e4776f-b07c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1704976034; x=1705236534;
	bh=GWJycRM1RMsGCNg44DODZ3MsQtz9ke7/m21LBuXqsT4=;
	h=From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=s6dF0u9xKDMEdabS75Eq7pEcF0WTmaTrdiXqcfN7Ek7UNY625kVGu4Nv9oBfbpFjg
	 x1roGJOFxQkG6sXwo++413e+YJ9f95QdlZjkDSjlAVgv2UjcqSBEdkIqTM/807zp4c
	 Eq/3VHzOiX9JsZCvceydYh3iyKMxdO+VYwgYAHJcDi+3pB14OTIJzo4/ujO030Fa1d
	 FrFs4PuhDZjIlRFdM8Z0bY0zpim1RTItFSAmNxdgQswNCzsXm5E5R2h4Jo/vvt86wc
	 qWoj7AaKvtNpOszmC5Xgt4NTl9akUFeMMYzHTXW3o9PmEc9WXWN65SK2VfhMK6yjwm
	 ey+ACn5qsBRZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
	s=mandrill; t=1704976034; x=1705236534; i=yann.dirson@vates.tech;
	bh=GWJycRM1RMsGCNg44DODZ3MsQtz9ke7/m21LBuXqsT4=;
	h=From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fU8mg0Nm+Z3YX7s3CoXbe1rbBUe5fF/yoKPgfPowGyahVRwVz+P261jKZzsuUDzbb
	 /aLaPXwgu5yBJBcAfgArTCyA56IoEnNAZV9e3qe5aewzpPQKwZ0bcM2S3+RYUDrBht
	 Qzp+zBEklvgOWh/AQfrz4OLeUgyKPsXELvN1FhOs=
From: Yann Dirson <yann.dirson@vates.tech>
Subject: =?utf-8?Q?Re:=20Next=20steps=20for=20Rust=20guest=20agent?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1704976032651
Message-Id: <1be8f6f1-f977-4743-bd26-362ada960dc6@vates.tech>
To: xen-devel@lists.xenproject.org
References: <aea51d2e-5da8-4da8-954f-2ee2a43be73e@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Lunfan Zhang <Lunfan.Zhang@citrix.com>, Xihuan Yang <xihuan.yang@citrix.com>, dpsmith@apertussolutions.com, marmarek@invisiblethingslab.com
In-Reply-To: <aea51d2e-5da8-4da8-954f-2ee2a43be73e@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.67bed4a62c204c4ab1070e00b57b904a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240111:md
Date: Thu, 11 Jan 2024 12:27:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 12/8/23 10:38, Yann Dirson wrote:
> Current status:
> - primary goal: to have one guest agent all downstreams can use, in all
> guests (with Linux and FreeBSD already supported), as efficient as
> possible (with Netlink already supported on Linux)
> - developed at https://gitlab.com/xen-project/xen-guest-agent (till now
> using gitlab PRs)
> - works fine as a replacement for the Xenserver xe-guest-utilities

Let's try to reboot the discussion.

> Some points raised during the community call:
> - we likely want first to agree on a core set of collected information

Currently I see the set of information collected as divided in the 
following categories:

- those that are genuinely useful
   - OS identifier (data/os_distro), and more detailed descriptive 
string (data/os_name)
   - kernel version (data/os_uname)
   - IP addresses assigned to VIFs attached to the guest

- those that could be more useful but XAPI wants them
   - free memory (data/meminfo_free) and total memory 
(data/meminfo_total) according to guest OS (not necessarily well defined)
   - control/feature-balloon=1 (necessary for XAPI's ballooning control 
to do anything today)
   - the version of the running agent, split in components 
(attr/PVAddons/{Major,Minor,Micro,Build}Version) (including constraints 
like Major being at least 1)

- those we provide for XAPI to be but without which it seems to be not 
too sad, and I'd happily drop
   - OS major and minor version (data/os_majorver, data/os_minorver)

What set of information (not necessarily from this list) do you think 
would qualify as "core set of information to collect" ?


> - could be made more configurable (eg. define a xenstore schema at
> runtime, we don't want specific schemas needs to cause forks)
>     -> it could be the agent requesting a specific xenstore schema

I do find some appeal to the idea that a toolstack should decide what 
info the guest should give it and where.  That could take the form of a 
TBD string written to xenstore before the domain starts, e.g. matching 
well-known IDs for pieces of information to xenstore paths.


> - what should be the criteria to advertise it as official Xenproject
> guest agent ?

What do people think here?

There is at least one known issue I'd like to address rapidly, which is 
that the FreeBSD ports ship a buggy bash script [1] derived from 
obsolete version of a XenServer tool.  Maybe at least it's not necessary 
to wait before approaching them to replace that old script with the Rust 
agent in its current state?

[1] 
https://github.com/freebsd/freebsd-ports/tree/main/sysutils/xe-guest-utilities

Best regards,
-- 
Yann



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

