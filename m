Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDFE8D2610
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 22:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731305.1136752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC3c2-0005aT-43; Tue, 28 May 2024 20:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731305.1136752; Tue, 28 May 2024 20:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC3c2-0005Xd-1I; Tue, 28 May 2024 20:40:02 +0000
Received: by outflank-mailman (input) for mailman id 731305;
 Tue, 28 May 2024 20:40:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYOI=M7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sC3c0-0005QA-G0
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 20:40:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 730cbdbc-1d32-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 22:39:59 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6A2014EE073F;
 Tue, 28 May 2024 22:39:58 +0200 (CEST)
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
X-Inumbo-ID: 730cbdbc-1d32-11ef-90a1-e314d9c70b13
MIME-Version: 1.0
Date: Tue, 28 May 2024 22:39:58 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/4] x86: address violations of MISRA C Rule 8.4
In-Reply-To: <ffb55f45-d08e-4c60-af71-f9a56856bca9@suse.com>
References: <cover.1716814609.git.nicola.vetrini@bugseng.com>
 <cf926194a541d11e02670516a8d337de27836dce.1716814609.git.nicola.vetrini@bugseng.com>
 <ffb55f45-d08e-4c60-af71-f9a56856bca9@suse.com>
Message-ID: <7f39c844e1c781504ef71fecbd086009@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-28 08:28, Jan Beulich wrote:
> On 27.05.2024 16:53, Nicola Vetrini wrote:
>> Rule 8.4 states: "A compatible declaration shall be visible when
>> an object or function with external linkage is defined."
>> 
>> These variables are only referenced from asm modules, so they
>> need to be extern and there is negligible risk of them being
>> used improperly without noticing.
> 
> "asm modules" isn't quite correct, as there's one use from inline
> assembly. I have to admit I have no good wording suggestion other than
> explicitly covering both: "asm modules or inline assembly". Yet that
> then is ambiguous, as a use in inline assembly may also mean that
> symbol is actually visible to the compiler by being mentioned as on of
> the operands. Better ideas?
> 

Maybe generically "asm code" or just "asm"? It's not really relevant 
whether it's inline or not, as far as I understand.

>> As a result, they can be exempted using a comment-based deviation.
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> With suitably adjusted wording:
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

