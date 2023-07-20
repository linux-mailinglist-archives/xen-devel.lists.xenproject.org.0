Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DAD75B928
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 23:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566732.885959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMamd-0003aP-Vc; Thu, 20 Jul 2023 21:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566732.885959; Thu, 20 Jul 2023 21:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMamd-0003Yk-S9; Thu, 20 Jul 2023 21:01:59 +0000
Received: by outflank-mailman (input) for mailman id 566732;
 Thu, 20 Jul 2023 21:01:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Zrf=DG=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qMamc-0003Ye-Br
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 21:01:58 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5c4be25-2740-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 23:01:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1A6A4828592D;
 Thu, 20 Jul 2023 16:01:50 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4K1Mqb2OoRIc; Thu, 20 Jul 2023 16:01:49 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6E7E5828591A;
 Thu, 20 Jul 2023 16:01:49 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zOPcqLNKvelT; Thu, 20 Jul 2023 16:01:49 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 104978285360;
 Thu, 20 Jul 2023 16:01:49 -0500 (CDT)
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
X-Inumbo-ID: a5c4be25-2740-11ee-b23a-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6E7E5828591A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1689886909; bh=BBXupLHE7ezMphtTIJAT0V4n6GT9GziempBUvQ+opOE=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=exeLL5D/PggcyI9Yxv7T8m2ou0+zTPIwoJfqJkSXcc9BhMJZ3NoltC4QOpelsQdlz
	 hAZy45eTpHnB19MlF3OgBt0F9+Lgi9fH736Em2wAYdFFaiG/1kdpZpN3iDOj3qPYb3
	 Ee8GHBGXxDzmG4OyoX+yWc4I7O4cGDW3EG3HOEHY=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <596297da-a335-6463-a9db-982f649f7183@raptorengineering.com>
Date: Thu, 20 Jul 2023 16:01:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1689710519.git.sanastasio@raptorengineering.com>
 <7c416ff843ea359bb24b8c954cc079fe1bbaf75f.1689710519.git.sanastasio@raptorengineering.com>
 <6d3b7cd6-7d6a-8d28-f1e7-7e939e393445@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <6d3b7cd6-7d6a-8d28-f1e7-7e939e393445@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/19/23 9:05 AM, Jan Beulich wrote:
> Before you/we grow more assembly code, may I re-raise a request regarding
> readability: I think it would be nice if operands started at a fixed column,
> unless the insn mnemonic is unusually long. Where exactly to draw the line
> is up to each archtecture; on x86 we use 8 positions from the start of the
> mnemonic.

There is quite a large variance in mnemonic length on ppc -- many common
mnemonics only use 2 characters (e.g. ld, mr) while other common ones
use 6+ (e.g. rldicr, the mtspr family, etc.). Enforcing a column size
that's too short would make the longer mnemonics look misaligned and out
of place, but using a longer column length (like 8) that can accommodate
most common mnemonics adds too much space between short mnemonics and
their arguments.

That said if you still feel strongly about this then I am not strongly
opposed to adding an 8-space column alignment.

> Jan

Thanks,
Shawn

