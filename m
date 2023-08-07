Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C0D772886
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578594.906169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1lf-00067S-Hq; Mon, 07 Aug 2023 15:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578594.906169; Mon, 07 Aug 2023 15:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1lf-00065I-F5; Mon, 07 Aug 2023 15:03:35 +0000
Received: by outflank-mailman (input) for mailman id 578594;
 Mon, 07 Aug 2023 15:03:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qT1le-000658-5O
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:03:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9371f5f0-3533-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 17:03:33 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A82E74EE0737;
 Mon,  7 Aug 2023 17:03:32 +0200 (CEST)
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
X-Inumbo-ID: 9371f5f0-3533-11ee-b280-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 17:03:32 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
 <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <a7c9f20e95bf514650637049e1947f8f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2023 10:09, Jan Beulich wrote:
> On 04.08.2023 17:27, Nicola Vetrini wrote:
>> The variable declared in the header file 
>> 'xen/arch/x86/include/asm/e820.h'
>> is shadowed by many function parameters, so it is renamed to avoid 
>> these
>> violations.
>> 
>> No functional changes.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> This patch is similar to other renames done on previous patches, and 
>> the
>> preferred strategy there was to rename the global variable. This one
>> has more occurrences that are spread in various files, but
>> the general pattern is the same.
> 
> Still I think it would be better done the other way around, and perhaps 
> in
> more than a single patch. It looks like "many == 3", i.e.
> - e820_add_range(), which is only ever called with "e820" as its 
> argument,
>   and hence the parameter could be dropped,
> - e820_change_range_type(), which is in the same situation, and
> - reserve_e820_ram(), which wants its parameter renamed.

This one is defined as

return e820_change_range_type(e820, s, e, E820_RAM, E820_RESERVED);

so I'm not certain that the parameter can be dropped from that function, 
because the cascade effect
would eliminate the need to have a 'boot_e820' in 'xen/arch/x86/setup.c' 
afaict and since the comment says

/* A temporary copy of the e820 map that we can mess with during 
bootstrap. */
static struct e820map __initdata boot_e820;

I'm not sure it's a good idea to alter this call chain.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

