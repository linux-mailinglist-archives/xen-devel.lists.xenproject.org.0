Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E84F7F59FD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 09:28:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639423.996774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r654S-0003Ak-T7; Thu, 23 Nov 2023 08:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639423.996774; Thu, 23 Nov 2023 08:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r654S-00037f-QG; Thu, 23 Nov 2023 08:28:24 +0000
Received: by outflank-mailman (input) for mailman id 639423;
 Thu, 23 Nov 2023 08:28:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FfzT=HE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r654R-00037W-FC
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 08:28:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4355a94f-89da-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 09:28:22 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C86564EE073C;
 Thu, 23 Nov 2023 09:28:21 +0100 (CET)
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
X-Inumbo-ID: 4355a94f-89da-11ee-98e2-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 23 Nov 2023 09:28:21 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 0/2] use the macro ISOLATE_LSB where appropriate
In-Reply-To: <4aa80555-2c57-4470-a914-e22df497a040@suse.com>
References: <cover.1700724699.git.nicola.vetrini@bugseng.com>
 <4aa80555-2c57-4470-a914-e22df497a040@suse.com>
Message-ID: <a1d2db3d7663bdf2072e0cba211f0120@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-23 09:19, Jan Beulich wrote:
> On 23.11.2023 08:37, Nicola Vetrini wrote:
>> This series replaces two instances of the pattern (x & -x) with the
>> macro ISOLATE_LSB.
>> 
>> Nicola Vetrini (2):
>>   xen/vmap: use ISOLATE_LSB to wrap a violation of Rule 10.1
>>   xen/iommu: use ISOLATE_LSB to wrap a violation of Rule 10.1
>> 
>>  xen/common/vmap.c               | 2 +-
>>  xen/drivers/passthrough/iommu.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Just to mention it: This is an example of where tracking the various 
> pieces
> of Misra work is artificially made difficult (see e.g. earlier 
> respective
> remarks by Julien). Why wasn't this combined into a single series 
> together
> with the 3-patch one sent the same minute?
> 
> Jan

I didn't think of collapsing them

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

