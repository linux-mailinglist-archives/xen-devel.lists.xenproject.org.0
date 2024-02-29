Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E786CFB0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687339.1070681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjcB-0005RG-Cf; Thu, 29 Feb 2024 16:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687339.1070681; Thu, 29 Feb 2024 16:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjcB-0005On-9S; Thu, 29 Feb 2024 16:50:35 +0000
Received: by outflank-mailman (input) for mailman id 687339;
 Thu, 29 Feb 2024 16:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfjcA-0005OR-BR
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:50:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a77307e8-d722-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:50:33 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CD5974EE0737;
 Thu, 29 Feb 2024 17:50:32 +0100 (CET)
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
X-Inumbo-ID: a77307e8-d722-11ee-afd8-a90da7624cb6
MIME-Version: 1.0
Date: Thu, 29 Feb 2024 17:50:32 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 05/10] xen/perfc: address violations of MISRA C Rule
 20.7
In-Reply-To: <dca418e7-d863-4fa9-9740-aada11313c33@suse.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <3418c09bb8c4ceeceb66334191adfad190954f56.1709219010.git.nicola.vetrini@bugseng.com>
 <dca418e7-d863-4fa9-9740-aada11313c33@suse.com>
Message-ID: <c272200b83065adf6adac2a464d30a40@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-29 17:42, Jan Beulich wrote:
> On 29.02.2024 16:27, Nicola Vetrini wrote:
>> --- a/xen/common/perfc.c
>> +++ b/xen/common/perfc.c
>> @@ -10,10 +10,10 @@
>>  #include <public/sysctl.h>
>>  #include <asm/perfc.h>
>> 
>> -#define PERFCOUNTER( var, name )              { name, TYPE_SINGLE, 0 
>> },
>> -#define PERFCOUNTER_ARRAY( var, name, size )  { name, TYPE_ARRAY,  
>> size },
>> -#define PERFSTATUS( var, name )               { name, TYPE_S_SINGLE, 
>> 0 },
>> -#define PERFSTATUS_ARRAY( var, name, size )   { name, TYPE_S_ARRAY,  
>> size },
>> +#define PERFCOUNTER( var, name )              { (name), TYPE_SINGLE, 
>> 0 },
>> +#define PERFCOUNTER_ARRAY( var, name, size )  { (name), TYPE_ARRAY,  
>> (size) },
>> +#define PERFSTATUS( var, name )               { (name), 
>> TYPE_S_SINGLE, 0 },
>> +#define PERFSTATUS_ARRAY( var, name, size )   { (name), TYPE_S_ARRAY, 
>>  (size) },
> 
> Same question as for patch 4. Plus if this needed touching, then the 
> stray
> blanks immediately inside the parentheses would please be dropped as 
> well.
> 

Noted

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

