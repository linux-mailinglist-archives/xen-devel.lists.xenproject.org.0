Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB23876E78
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 02:18:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690436.1076410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilKq-0004rD-1H; Sat, 09 Mar 2024 01:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690436.1076410; Sat, 09 Mar 2024 01:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilKp-0004ph-Ui; Sat, 09 Mar 2024 01:17:11 +0000
Received: by outflank-mailman (input) for mailman id 690436;
 Sat, 09 Mar 2024 01:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWqy=KP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rilKo-0004pb-Aj
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 01:17:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be63f0cb-ddb2-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 02:17:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73E6860EC0;
 Sat,  9 Mar 2024 01:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C46C433F1;
 Sat,  9 Mar 2024 01:17:03 +0000 (UTC)
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
X-Inumbo-ID: be63f0cb-ddb2-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709947025;
	bh=8je4Crl/Z3efIc1qlcOV20ttvsZSJbCMin/n/tKDpuw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oBAwFcfs8SvEDWrn/JEQckHhmBMlA0QpqOgz3zAAJqWwH7CLm0g1niqsOaVn7WF+d
	 gbs3jH558T1iI1eVaOFwOGuv4eVj6+MiQ1H7vr2iC8faX8R+gi8Um2MIy/L5NW8H3Y
	 yENen0kVsXNpT/ZSWi6VJHsI1YcOnweHhA0q+VOWC/aLT9/cGr+dOVuBoneN8g4L04
	 oZZzquoLyhauR1WAFUaun3Ave9qOwf1MOt8R0Y5zLZ5RmAZEdWHoAE5BAgawBDOrVF
	 j7bcbjQPK7KxeM4I8Y4gpdhWTHnM0Wog71/9BDyHlTdLnasJqeKCcRAnI8ttkR3JLI
	 aqWjMnJ6L8pLQ==
Date: Fri, 8 Mar 2024 17:17:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/compiler: deviate the inline macro for MISRA C
  Rule 20.4
In-Reply-To: <d2b3ae062756a28a040a9553a4f0e621cfdeb5e0.1709885163.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403081716410.853156@ubuntu-linux-20-04-desktop>
References: <d2b3ae062756a28a040a9553a4f0e621cfdeb5e0.1709885163.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Mar 2024, Nicola Vetrini wrote:
> Rule 20.4 states: "A macro shall not be defined with the same name
> as a keyword".
> 
> Defining this macro with the same name as the inline keyword
> allows for additionally checking that out-of-lined static inline
> functions end up in the correct section while minimizing churn and
> has a positive impact on the overall safety. See [1] for additional
> context on the motivation of this deviation.
> 
> No functional change.
> 
> [1] https://lore.kernel.org/xen-devel/adaa6d55-266d-4df8-8967-9340080d17e4@citrix.com/
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

