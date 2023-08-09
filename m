Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93177622A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 16:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581152.909721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjxk-0004Dx-7Q; Wed, 09 Aug 2023 14:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581152.909721; Wed, 09 Aug 2023 14:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjxk-0004Bw-4m; Wed, 09 Aug 2023 14:15:00 +0000
Received: by outflank-mailman (input) for mailman id 581152;
 Wed, 09 Aug 2023 14:14:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTjxi-0004B4-QN
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 14:14:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ed36ac9-36bf-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 16:14:58 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B2F574EE073F;
 Wed,  9 Aug 2023 16:14:57 +0200 (CEST)
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
X-Inumbo-ID: 1ed36ac9-36bf-11ee-b281-6b7b168915f2
MIME-Version: 1.0
Date: Wed, 09 Aug 2023 16:14:57 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 3/8] xen: address MISRA C:2012 Rule 8.4
In-Reply-To: <F44603D5-6DB1-4266-AD2A-482AD481E9C2@arm.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <c010bbb270ff3b546d4790487cf973413ca2af26.1691575243.git.nicola.vetrini@bugseng.com>
 <F44603D5-6DB1-4266-AD2A-482AD481E9C2@arm.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <f0fd8d910c0eb3d127eaa776e7819455@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2023 15:50, Luca Fancellu wrote:
>> On 9 Aug 2023, at 12:02, Nicola Vetrini <nicola.vetrini@bugseng.com> 
>> wrote:
>> 
>> The variable 'saved_cmdline' can be defined static,
>> as its only uses are within the same file. This in turn avoids
>> violating Rule 8.4 because no declaration is present.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> xen/common/kernel.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
>> index fb919f3d9c..52aa287627 100644
>> --- a/xen/common/kernel.c
>> +++ b/xen/common/kernel.c
>> @@ -28,7 +28,7 @@ CHECK_feature_info;
>> 
>> enum system_state system_state = SYS_STATE_early_boot;
>> 
>> -xen_commandline_t saved_cmdline;
>> +static xen_commandline_t saved_cmdline;
> 
> I see this line was touched by 
> fa97833ae18e4a42c0e5ba4e781173457b5d3397,
> have you checked that making it static was not affecting anything else?
> 
> 

Though Jan already replied on this, the commit(s) were tested by patchew 
and our
pipeline. This is normally our process, apart from MISRA checks.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

