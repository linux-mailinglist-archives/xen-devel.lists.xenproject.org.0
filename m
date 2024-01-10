Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B528294E3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 09:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665321.1035484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNThN-000516-H3; Wed, 10 Jan 2024 08:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665321.1035484; Wed, 10 Jan 2024 08:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNThN-0004zT-E9; Wed, 10 Jan 2024 08:12:29 +0000
Received: by outflank-mailman (input) for mailman id 665321;
 Wed, 10 Jan 2024 08:12:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PEGk=IU=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rNThL-0004zL-Td
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 08:12:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcb09ff0-af8f-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 09:12:25 +0100 (CET)
Received: from [192.168.1.10] (host-79-60-221-62.business.telecomitalia.it
 [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 570934EE073D;
 Wed, 10 Jan 2024 09:12:24 +0100 (CET)
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
X-Inumbo-ID: fcb09ff0-af8f-11ee-9b0f-b553b5be7939
Message-ID: <eb1111f4-5511-4b46-a3ec-3d02ebf68873@bugseng.com>
Date: Wed, 10 Jan 2024 09:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] x86/uaccess: remove __{put,get}_user_bad()
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com>
 <a2050ac1-e205-4d7f-b9b1-aa625136e63a@suse.com>
 <0c5bbfde-4cf0-4878-b1ee-ccc8eb775464@citrix.com>
 <eb53449bd6595ea0931460e62dd57b9c@bugseng.com>
 <1330c757-1ca3-4b07-898b-799cbfa67e8a@suse.com>
 <6a39fe3e-524f-4e39-81bc-ffb3d48ba306@bugseng.com>
 <192c393a-3702-4cc3-af60-e2711098ec6d@suse.com>
 <8fa1f868-c7de-4a46-a827-a75c38513f6f@bugseng.com>
 <19d5c152-3ab7-4762-980b-3570d3a948e4@suse.com>
 <7ecb7703-25c6-4295-946b-7b9aed7b3c67@bugseng.com>
 <05f088cf-4736-40d4-9f4b-1f6120e12a08@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <05f088cf-4736-40d4-9f4b-1f6120e12a08@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/24 15:44, Jan Beulich wrote:
> On 08.01.2024 15:01, Federico Serafini wrote:
>> Additionally, looking at violations of 16.3 on X86 [1],
>> I think we should also consider generate_exception(),
>> ASSERT_UNREACHABLE() and PARSE_ERR_RET() as allowed terminals
>> for a switch-clause, do you agree?
> 
> No, and iirc this was discussed before. ASSERT_UNREACHABLE() is a
> debug-build-only construct, so unsuitable. The other two aren't
> global constructs, and hence shouldn't be deviated globally.
> generate_exception() at least ends in a goto anyway, so why would
> it need special treatment?

This is related to what I said before regarding the fact that Rule 16.3
is a purely syntactic rule.
The goto is within an if statement; the tool is able to considered the
fact that the condition is always true but an explicit configuration is
needed.
Sorry for the late reply.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

