Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE017DB8F3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 12:29:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625058.973922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxQST-0006dC-Db; Mon, 30 Oct 2023 11:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625058.973922; Mon, 30 Oct 2023 11:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxQST-0006aj-B0; Mon, 30 Oct 2023 11:29:25 +0000
Received: by outflank-mailman (input) for mailman id 625058;
 Mon, 30 Oct 2023 11:29:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxQSR-0006ad-O4
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 11:29:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxQSQ-0007Ew-9K; Mon, 30 Oct 2023 11:29:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxQSP-0001TW-Vb; Mon, 30 Oct 2023 11:29:22 +0000
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
	bh=jfNWRxjvoAH8O3mgyZy30Z0zXan+pp4ep5ijBXXcR4Q=; b=qUsqBqdtmbkCOBZikFJpIdLLxw
	l4EQX2aA7u7/FmLaQZzZS811j6sKoN0EkB2DNlFew6Ge61HXVQVMijsr/EPF1zFQ+6eUi62PKk8ER
	RvL5vJLTgX8BW/3tm7jFzMtpxqPpm59YXAY8zMC8ojRAAl87xvKErcizk5TmRLhxaOjk=;
Message-ID: <4c5db3e9-cf77-43aa-be7b-df5734104fea@xen.org>
Date: Mon, 30 Oct 2023 11:29:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v5 2/8] x86: add deviation for asm-only
 functions
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <cover.1698655374.git.nicola.vetrini@bugseng.com>
 <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 30/10/2023 09:11, Nicola Vetrini wrote:
> As stated in rules.rst, functions used only in asm modules
> are allowed to have no prior declaration visible when being
> defined, hence these functions are marked with an
> 'asmlinkage' macro, which is then deviated for MISRA C:2012
> Rule 8.4.

AFAIU, this is a replacement of SAF-1. If so, I would like a consistent 
way to address Rule 8.4. So can you write a patch to replace all the use 
of SAF-1 with asmlinkage and remove SAF-1?

Cheers,

-- 
Julien Grall

