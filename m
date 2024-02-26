Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5094E866C0C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685302.1065789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWH4-0001ZP-V5; Mon, 26 Feb 2024 08:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685302.1065789; Mon, 26 Feb 2024 08:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWH4-0001XD-SP; Mon, 26 Feb 2024 08:23:46 +0000
Received: by outflank-mailman (input) for mailman id 685302;
 Mon, 26 Feb 2024 08:23:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HDYM=KD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1reWH2-00015c-Vd
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:23:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a338a19-d480-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 09:23:43 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A270E4EE0742;
 Mon, 26 Feb 2024 09:23:42 +0100 (CET)
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
X-Inumbo-ID: 5a338a19-d480-11ee-98f5-efadbce2ee36
MIME-Version: 1.0
Date: Mon, 26 Feb 2024 09:23:42 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/2] xen/console: drop return value from
 consoled_guest_rx/tx
In-Reply-To: <004877c8-9aea-44b9-aa93-65665b0d3a8d@suse.com>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <4998ec735bd7e5a50a229507e2b92ae56ec1ba4b.1708680104.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2402231456350.754277@ubuntu-linux-20-04-desktop>
 <004877c8-9aea-44b9-aa93-65665b0d3a8d@suse.com>
Message-ID: <b417d7a330addd295b3cbbbac4bed2a4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-26 09:00, Jan Beulich wrote:
> On 23.02.2024 23:56, Stefano Stabellini wrote:
>> On Fri, 23 Feb 2024, Nicola Vetrini wrote:
>>> These functions never saw a usage of their return value since
>>> they were introduced, so it can be dropped since their usages
>>> violate MISRA C Rule 17.7:
>>> "The value returned by a function having non-void return type shall 
>>> be used".
>>> 
>>> No functional change.
>>> 
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> The cleanup is certainly okay, but would one of you mind clarifying in 
> how
> far this code is relevant for certification? I don't expect there are 
> plans
> to run shim Xen in any projected production uses for which 
> certification is
> relevant? (The subject prefix is also unnecessarily wide here, when 
> it's
> only daemon code which is affected, not console code in general.)
> 

I agree on the subject prefix being too wide. The configuration that 
uses consoled_guest_tx is #ifdef-ed for x86, so even in configurations 
that may never reach this condition this is relevant, unless its #ifdef 
is restricted to cases where the call may actually be reachable.
consoled_guest_rx was adjusted for uniformity, even though it's 
technically not included in the configuration under analysis at the 
moment.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

