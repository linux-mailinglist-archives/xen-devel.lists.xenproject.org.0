Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A6B80E71D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652755.1018772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCyog-0003Wk-Hh; Tue, 12 Dec 2023 09:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652755.1018772; Tue, 12 Dec 2023 09:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCyog-0003Tz-Dx; Tue, 12 Dec 2023 09:12:38 +0000
Received: by outflank-mailman (input) for mailman id 652755;
 Tue, 12 Dec 2023 09:12:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5yJ=HX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCyof-0003Tt-46
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:12:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95c0ca2e-98ce-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:12:34 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 89A334EE0737;
 Tue, 12 Dec 2023 10:12:33 +0100 (CET)
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
X-Inumbo-ID: 95c0ca2e-98ce-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Tue, 12 Dec 2023 10:12:33 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 2/7] x86/mm: address MISRA C:2012 Rule 2.1
In-Reply-To: <alpine.DEB.2.22.394.2312111741390.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <5913d8871ff6c4f320c521e50e550a64e58d4351.1702283415.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2312111741390.1703076@ubuntu-linux-20-04-desktop>
Message-ID: <ff95c65f53ab8acfd577ec132009cd7b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-12 02:42, Stefano Stabellini wrote:
> On Mon, 11 Dec 2023, Nicola Vetrini wrote:
>> The "return 0" after the swich statement in 'xen/arch/x86/mm.c'
>> is unreachable because all switch clauses end with returns.
>> However, some of them can be substituted with "break"s to allow
>> the "return 0" outside the switch to be reachable.
>> 
>> No functional changes.
> 
> This is correct but makes the code inconsistent. I would either remove
> the return 0; at the end of arch_memory_op, or do the following:
> 
> - initialize rc to 0 at the beginning: int rc = 0;
> - all switch clauses break instead of return;
> - at the end: return rc;
> 

Given the feedback on the Arm side, the first solution is likely to be 
preferred.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

