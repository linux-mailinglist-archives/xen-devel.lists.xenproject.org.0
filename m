Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEDE76FE7A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 12:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577083.903941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRs3a-0001Q1-81; Fri, 04 Aug 2023 10:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577083.903941; Fri, 04 Aug 2023 10:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRs3a-0001Nt-52; Fri, 04 Aug 2023 10:29:18 +0000
Received: by outflank-mailman (input) for mailman id 577083;
 Fri, 04 Aug 2023 10:29:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HS9z=DV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qRs3Y-0001Nl-H6
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 10:29:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c27ba174-32b1-11ee-b26b-6b7b168915f2;
 Fri, 04 Aug 2023 12:29:15 +0200 (CEST)
Received: from [192.168.1.15] (host-79-35-203-138.retail.telecomitalia.it
 [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id 596214EE0737;
 Fri,  4 Aug 2023 12:29:14 +0200 (CEST)
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
X-Inumbo-ID: c27ba174-32b1-11ee-b26b-6b7b168915f2
Message-ID: <3c642d70-1b1a-5b09-fb34-127172f96118@bugseng.com>
Date: Fri, 4 Aug 2023 12:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] x86/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US, it
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <c690d653a6fc2dd9cd0d1aa3b204d6ac7fb12ed6.1691141621.git.federico.serafini@bugseng.com>
 <c74bd41e-20e3-2616-f077-f213bf115dbc@citrix.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <c74bd41e-20e3-2616-f077-f213bf115dbc@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/08/23 11:47, Andrew Cooper wrote:
> On 04/08/2023 10:38 am, Federico Serafini wrote:
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index be2b10a391..e1d9b94007 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -5591,7 +5591,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>>    *
>>    * It is an error to call with present flags over an unpopulated range.
>>    */
>> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
>> +int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
> 
> I think both of these examples want to stay as nf (new flags).  Flags on
> its own is ambiguous in context, and nf is a common shorthand in our
> pagetable code.
> 
> And it will make the patch rather shorter.
> 
> ~Andrew

The arm code has its own implementation of modify_xen_mappings()
which uses `flags`.
I put Stefano and Julien in CC, so that if everyone likes `nf` I can 
propagate the change.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

