Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B14882F04F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 15:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667785.1039391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPk8z-0000m0-Fj; Tue, 16 Jan 2024 14:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667785.1039391; Tue, 16 Jan 2024 14:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPk8z-0000kJ-CJ; Tue, 16 Jan 2024 14:10:21 +0000
Received: by outflank-mailman (input) for mailman id 667785;
 Tue, 16 Jan 2024 14:10:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8OVi=I2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rPk8y-0000kA-CD
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 14:10:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9663b4e-b478-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 15:10:17 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 1AE3D4EE073F;
 Tue, 16 Jan 2024 15:10:16 +0100 (CET)
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
X-Inumbo-ID: f9663b4e-b478-11ee-9b0f-b553b5be7939
Message-ID: <d4fb75c8-b856-41c7-9c69-828d4505b231@bugseng.com>
Date: Tue, 16 Jan 2024 15:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpuid: Change cpuid() from a macro to a static inline
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240116115838.560473-1-andrew.cooper3@citrix.com>
 <39debf73-14bf-40a6-8aff-adf086595581@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <39debf73-14bf-40a6-8aff-adf086595581@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/01/24 14:02, Jan Beulich wrote:
> On 16.01.2024 12:58, Andrew Cooper wrote:
>> Fixes MISRA XXX
> 
> Rule 5.5 if I'm not mistaken; had to look it up for the patch sent
> earlier in the day. As to "fixes" - when it's not an actual bug, I had
> (successfully) asked the bugseng guys to avoid that term, and instead
> use "addresses" or "eliminates a ... violation" or some such.
> 
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

I confirm that it is Rule 5.5.

I would like to point out that although the patch fixes violations of
Rule 5.5, it introduces new violations of Rule 5.3 "An identifier 
declared in an inner scope shall not hide an identifier declared in an 
outer scope": cpuid is used also as an identifier for some formal 
arguments (the pipeline does not fail because Rule 5.3 is not tagged
as "clean" and the introduction of new violations does not cause
a failure).
A solution could be to rename the function adding a prefix or a suffix
to its name.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

