Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A83777418F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 19:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580388.908577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQQC-0000lW-0D; Tue, 08 Aug 2023 17:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580388.908577; Tue, 08 Aug 2023 17:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQQB-0000iE-Th; Tue, 08 Aug 2023 17:23:03 +0000
Received: by outflank-mailman (input) for mailman id 580388;
 Tue, 08 Aug 2023 17:23:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTQQ9-0000hY-VC
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 17:23:02 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 381b4b6c-3610-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 19:22:59 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691515374507665.4281754622317;
 Tue, 8 Aug 2023 10:22:54 -0700 (PDT)
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
X-Inumbo-ID: 381b4b6c-3610-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691515376; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KfWyKAd7k/j1FvjXNy8LfveOuk5h72ovl4+xbP7C9k1vyRlVcI/odaQusP1zKIuQ0Dsm6zUnKqygrEPKnsp7jAdedO9BWKtxqAbwPMFYTc5jUrRJyt5JdsP1Be4zpF++HPkom3cJiWX9swlp8l7L05QcJKHl6OwO6U7hs/ZmSTc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691515376; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=QgUwB5bURqerdWrUtMak9mr4Qnpb0Dv3X45/DrKwdsY=; 
	b=ZkyhkoGDS6TBGNIiXjZypsMkibvCumAdWKk/VubxVqMe+8OmTeZZd8clQ3McqzTbqTMJLvLQzGv+HeCLtg4AaK+VgZFfpC6zxSlaTA1ElcuYjwHsbGHk9XLVKTj7XGpMgOAJc1MpwgLiXYA9nOG4RpDNI+eZ2zFj8d9rMqlZle4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691515376;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QgUwB5bURqerdWrUtMak9mr4Qnpb0Dv3X45/DrKwdsY=;
	b=PEinN6+ckmSE7+oiygpyU5WPE1QhGKSwcwzwJ+C3YPVCaTj9L0WbI8EmFcF6Ap/h
	YAc7IuQAWDIH9zFOASMzqwl5oc8P/yKy++UeNrh4czPN5b6ViL0tUTv4w1Lpq6eQdtF
	i8Qpk8gv+B9nxhRLpxw3lIrzBoGkZcopaHZaYUUs=
Message-ID: <bdbf125d-b772-404b-e2d1-79d40090a100@apertussolutions.com>
Date: Tue, 8 Aug 2023 13:22:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
 <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com>
 <65e62111-7997-de4d-cf12-15d89ec87471@apertussolutions.com>
 <alpine.DEB.2.22.394.2308031620160.2127516@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031620160.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/3/23 19:38, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Daniel P. Smith wrote:
>>> Also, what is the plan for the existing dom0less dt properties?
>>> Will they need to be moved to new /hypervisor node or we will have to parse
>>> both /chosen and /hypervisor nodes?
>>
>> In the proposal I sent to xen-devel in response to Luca's RFC for rebranding
>> dom0less features under hyperlaunch, that is the purpose of this commit. Get
>> this document up to date with what was done in v1 along with what we are
>> planning/working on for hyperlaunch. One could think of this as effectively
>> the API to the capabilities hyperlaunch will provide. Not just how to
>> construct a domain, but what kinds of domains can be constructed by
>> hyperlaunch. Step one of the proposal is to publish a patch upon which we all
>> can iterate over and get to an agreement on a suitable interface for all. The
>> next step would be the introduction of hyperlaunch dom0less compatibility
>> mode, that would see the moving of the parsing logic for the existing dom0less
>> nodes under /xen/common/domain-builder. It would continue to exist there even
>> after hyperlaunch proper is merged and can remain there for backward
>> compatibility until there is a decision to retire the compatibility interface.
> 
> I like this plan. The two interfaces are so similar that it is basically
> one interface with a couple of tiny differences.
> 
> So I expect we would move the existing dom0less parsing code to common/,
> add a couple of extensions (such as parsing /hypervisor in addition to
> /chosen) and use it as it.

Do you mean /chosen/hypervisor?

> Later on, after a few years of using /hypervisor instead of /chosen, if
> nobody is using /chosen anymore, we could retire /chosen completely. But
> this is just one DT node/property that gets retired (there are a couple
> of others). I don't imagine we'll have a full new implementation of the
> DT parsing logic that supersedes the existing implementation of it
> (especially considering the difficulty of maintaining 2 different parsing
> logics in the hypervisor for similar interfaces).

+1

> Same thing for the DT interface documentation. I don't think we need two
> DT interface docs? We could start with the existing dom0less interface
> (docs/misc/arm/device-tree/booting.txt), and move it somewhere common
> like docs/misc/device-tree.

So in the plan that I sent, patch series 3 was were I was going to 
consolidate docs/design/launch/hyperlaunch-devicetree.rst and 
docs/misc/arm/device-tree/booting.txt into a single document under 
docs/features/hyperlaunch/device-tree.rst along with moving 
docs/features/dom0less.pandoc to 
docs/features/hyperlaunch/dom0less-compatibility-mode.pandoc. The 
thinking here was to get all the feature documentation together in a 
single place, but I would be open to putting the suggested consolidated 
device-tree.rst mentioned above into 
docs/misc/device-tree/hyperlaunch.rst if that is preferred.

> Then add any changes or extensions required by other architecture, such
> as x86 and RISC-V.
> 
> For sure for x86 we need "module-index". I don't know if anything else
> is must-have to get it to work on x86 but if there is, we should add
> those too.

Hmm good point, since in the suggested patch series 3 from the plan, 
this probably should get cropped down to what we actually have 
implemented for x86 hyperlaunch and then get expanded as it becomes 
feature complete.

v/r,
dps

