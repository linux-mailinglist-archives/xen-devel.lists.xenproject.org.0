Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500FB7FD099
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 09:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643728.1004181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Fq8-0002Pm-2T; Wed, 29 Nov 2023 08:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643728.1004181; Wed, 29 Nov 2023 08:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Fq7-0002O8-Vz; Wed, 29 Nov 2023 08:22:35 +0000
Received: by outflank-mailman (input) for mailman id 643728;
 Wed, 29 Nov 2023 08:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1bx=HK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r8Fq6-0002Nw-7W
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 08:22:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71b2e044-8e90-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 09:22:33 +0100 (CET)
Received: from [192.168.1.15] (host-82-59-158-146.retail.telecomitalia.it
 [82.59.158.146])
 by support.bugseng.com (Postfix) with ESMTPSA id 6C7514EE0737;
 Wed, 29 Nov 2023 09:22:32 +0100 (CET)
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
X-Inumbo-ID: 71b2e044-8e90-11ee-98e3-6d05b1d4d9a1
Message-ID: <da8da742-dc81-43c6-ba78-4424cbedb3c1@bugseng.com>
Date: Wed, 29 Nov 2023 09:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 5.6
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <5826d25aeb31ebd29b0f2aebf3f78e676deb50b9.1701191295.git.federico.serafini@bugseng.com>
 <957f7d84-d7c1-4fa2-b006-53f22248d19a@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <957f7d84-d7c1-4fa2-b006-53f22248d19a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/23 18:17, Jan Beulich wrote:
> On 28.11.2023 18:09, Federico Serafini wrote:
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -90,6 +90,22 @@ Deviations related to MISRA C:2012 Rules:
>>            - __emulate_2op and __emulate_2op_nobyte
>>            - read_debugreg and write_debugreg
>>   
>> +   * - R5.6
>> +     - The type ret_t is deliberately defined multiple times depending on the
>> +       type of guest to service.
>> +     - Tagged as `deliberate` for ECLAIR.
>> +
>> +   * - R5.6
>> +     - Some files are not subject to respect MISRA rules at
>> +       the moment, but, among these out-of-scope files, there are definitions
>> +       of typedef names that are already defined within in-scope files and
>> +       therefore, ECLAIR does report a violation since not all the files
>> +       involved in the violation are excluded from the analysis.
>> +     - Tagged as `deliberate` for ECLAIR. Such excluded files are:
>> +         - xen/include/efi/.*
>> +         - xen/arch/x86/include/asm/x86_64/efibind.h
>> +         - xen/arch/arm/include/asm/arm64/efibind.h
> 
> Could these two be generalized to xen/arch/*/include/asm/*/efibind.h?

OK.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

