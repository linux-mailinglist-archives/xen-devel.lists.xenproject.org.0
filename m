Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A791DB4E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 11:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751416.1159379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sODCY-0006k2-M8; Mon, 01 Jul 2024 09:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751416.1159379; Mon, 01 Jul 2024 09:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sODCY-0006h4-JA; Mon, 01 Jul 2024 09:19:58 +0000
Received: by outflank-mailman (input) for mailman id 751416;
 Mon, 01 Jul 2024 09:19:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpbD=OB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sODCX-0006gy-3V
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 09:19:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 148aada4-378b-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 11:19:55 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4D8D84EE0746;
 Mon,  1 Jul 2024 11:19:55 +0200 (CEST)
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
X-Inumbo-ID: 148aada4-378b-11ef-90a4-e314d9c70b13
MIME-Version: 1.0
Date: Mon, 01 Jul 2024 11:19:55 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2] x86/mctelem: address violations of MISRA C: 2012
 Rule 5.3
In-Reply-To: <37478823-39d1-44a9-8e73-1afa40554a4d@suse.com>
References: <94752f77597b05ef9b8a387bf29512b11c0d1e15.1719398571.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2406261757480.3635@ubuntu-linux-20-04-desktop>
 <37478823-39d1-44a9-8e73-1afa40554a4d@suse.com>
Message-ID: <c639b5e00f027ec599aa007eb1826f70@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-01 10:27, Jan Beulich wrote:
> On 27.06.2024 02:57, Stefano Stabellini wrote:
>> On Wed, 26 Jun 2024, Nicola Vetrini wrote:
>>> From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>> 
>>> This addresses violations of MISRA C:2012 Rule 5.3 which states as
>>> following: An identifier declared in an inner scope shall not hide an
>>> identifier declared in an outer scope.
>>> 
>>> In this case the gloabl variable being shadowed is the global static 
>>> struct
>>> mctctl in this file, therefore the local variables are renamed to 
>>> avoid this.
> 
> "global" and "static" contradict one another; I think you mean "file 
> scope".

Yes.

> While there (nit) also s/gloabl/global/ or perhaps even s/gloabl// to 
> deal
> with the conflict with "static" also there (without writing "file 
> scope"
> twice).
> 
>>> No functional change.
>>> 
>>> Signed-off-by: Alessandro Zucchelli 
>>> <alessandro.zucchelli@bugseng.com>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> Nice one!
>> 
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> With the adjustment:
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

