Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF72771D02
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577897.905004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwPY-0005IR-IV; Mon, 07 Aug 2023 09:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577897.905004; Mon, 07 Aug 2023 09:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwPY-0005G7-FK; Mon, 07 Aug 2023 09:20:24 +0000
Received: by outflank-mailman (input) for mailman id 577897;
 Mon, 07 Aug 2023 09:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qSwPX-0005Fz-4i
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:20:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a24c3c73-3503-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 11:20:22 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id AA3C34EE0737;
 Mon,  7 Aug 2023 11:20:21 +0200 (CEST)
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
X-Inumbo-ID: a24c3c73-3503-11ee-b27d-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 11:20:21 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 5/6] x86/xstate: address MISRA C:2012 Rule 5.3
In-Reply-To: <82438990-cb32-a2fc-273f-151818834c4d@suse.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <1ea70e5f8293fdca2bb69ec75f532722136e52a5.1691162261.git.nicola.vetrini@bugseng.com>
 <82438990-cb32-a2fc-273f-151818834c4d@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <4ce6f80a5749dff1aee4ba7458f1139d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2023 10:23, Jan Beulich wrote:
> On 04.08.2023 17:27, Nicola Vetrini wrote:
>> Rename the local variables to avoid clashing with function 'xstate'
>> defined below, but declared in the corresponding header file.
> 
> Hmm, there are two functions with such a local variable, but you don't
> change those. You change "xsave" instead. The new name you use you took
> from older functions afaict; newer ones use "xstate" (and use of this
> name is extended in pending patches), so preferably we would follow
> that naming model (and eventually rename all "xsave_area" as well).
> 
> Also - does "below" really matter and hence warrant the "but"?
> 
> Jan

I made a typo in the commit message. Indeed 'xsave' here is the culprit. 
I think 'xstate'
is ok for a rename, as it does not shadow anything  afaict.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

