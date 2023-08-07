Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42C772B57
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 18:44:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578730.906379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT3KN-0003ZB-02; Mon, 07 Aug 2023 16:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578730.906379; Mon, 07 Aug 2023 16:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT3KM-0003XR-TZ; Mon, 07 Aug 2023 16:43:30 +0000
Received: by outflank-mailman (input) for mailman id 578730;
 Mon, 07 Aug 2023 16:43:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qT3KK-0003XL-Vg
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 16:43:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87d8a7b6-3541-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 18:43:26 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id DE71F4EE0737;
 Mon,  7 Aug 2023 18:43:25 +0200 (CEST)
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
X-Inumbo-ID: 87d8a7b6-3541-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 18:43:25 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 2/4] x86/mtrr: address MISRA C:2012 Rule 5.3
In-Reply-To: <17069ab9-03ff-9f7b-6480-d50e1349e16a@suse.com>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
 <2f7380396ee146132738dd5c6b2a80d62a8035d5.1691135862.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308041345360.2127516@ubuntu-linux-20-04-desktop>
 <17069ab9-03ff-9f7b-6480-d50e1349e16a@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <e4eaad8dec9a289821d799b6eab8f29b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2023 14:48, Jan Beulich wrote:
> On 04.08.2023 22:45, Stefano Stabellini wrote:
>> On Fri, 4 Aug 2023, Nicola Vetrini wrote:
>>> Rename variables to avoid shadowing and thus address
>>> MISRA C:2012 Rule 5.3:
>>> "An identifier declared in an inner scope shall not hide an
>>> identifier declared in an outer scope".
>>> 
>>> The shadowing happens between the struct declaration 'mtrr_state' in
>>> 'xen/arch/x86/include/asm/mtrr.h' and local variable names.
> 
> Let's try to be precise: The issue isn't with the struct declaration,
> but with the declaration of the global variable of that name a few
> lines later. Afaict - please clarify.

Yes, my wording is wrong.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

