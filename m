Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF17CC765
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 17:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618289.961746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qslw2-0003Gr-5x; Tue, 17 Oct 2023 15:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618289.961746; Tue, 17 Oct 2023 15:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qslw2-0003Dl-20; Tue, 17 Oct 2023 15:24:42 +0000
Received: by outflank-mailman (input) for mailman id 618289;
 Tue, 17 Oct 2023 15:24:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHSl=F7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qslw0-0003Df-6U
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 15:24:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 483778b4-6d01-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 17:24:37 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8839F4EE0738;
 Tue, 17 Oct 2023 17:24:36 +0200 (CEST)
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
X-Inumbo-ID: 483778b4-6d01-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 17 Oct 2023 17:24:36 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v2 6/7] xen/console: make function static
 inline
In-Reply-To: <5cad5cef-27b7-58ef-42f1-8c4a83497f4b@suse.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <6ca7d9834079b7824f9432799cce2308aa88d159.1696833629.git.nicola.vetrini@bugseng.com>
 <5cad5cef-27b7-58ef-42f1-8c4a83497f4b@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <1dd47c07730ae143963891d79148e8f0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:52, Jan Beulich wrote:
> On 09.10.2023 08:54, Nicola Vetrini wrote:
>> --- a/xen/include/xen/consoled.h
>> +++ b/xen/include/xen/consoled.h
>> @@ -12,7 +12,7 @@ size_t consoled_guest_tx(char c);
>> 
>>  #else
>> 
>> -size_t consoled_guest_tx(char c) { return 0; }
>> +static inline size_t consoled_guest_tx(char c) { return 0; }
> 
> Why inline? We do so in headers, but we generally avoid "inline" in
> .c files.
> 
> Jan

Yes. The file modified is in fact an header.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

