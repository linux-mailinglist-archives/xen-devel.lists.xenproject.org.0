Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1232686DCA1
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 09:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687546.1071157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxpD-0005ub-QS; Fri, 01 Mar 2024 08:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687546.1071157; Fri, 01 Mar 2024 08:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxpD-0005sr-NW; Fri, 01 Mar 2024 08:00:59 +0000
Received: by outflank-mailman (input) for mailman id 687546;
 Fri, 01 Mar 2024 08:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GBmU=KH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfxpC-0005QY-4s
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 08:00:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d530558e-d7a1-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 09:00:56 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id ADA174EE0737;
 Fri,  1 Mar 2024 09:00:55 +0100 (CET)
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
X-Inumbo-ID: d530558e-d7a1-11ee-a1ee-f123f15fe8a2
MIME-Version: 1.0
Date: Fri, 01 Mar 2024 09:00:55 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 jbeulich@suse.com, george.dunlap@citrix.com, julien@xen.org,
 bertrannd.marquis@arm.com, roger.pau@citrix.com,
 roberto.bagnara@bugseng.com, federico.serafini@bugseng.com,
 Luca.Fancellu@arm.com, michal.orzel@amd.com
Subject: Re: [PATCH v2 1/3] docs/misra/rules.rst: add rule 16.6 and 20.12
In-Reply-To: <alpine.DEB.2.22.394.2402291754010.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-1-stefano.stabellini@amd.com>
 <alpine.DEB.2.22.394.2402291754010.853156@ubuntu-linux-20-04-desktop>
Message-ID: <0dbad2c350e1f6a9af081dc6d4589ae5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-01 02:56, Stefano Stabellini wrote:
> Hi all,
> 
> This patch broke gitlab-ci. The jobs failing are the cppcheck jobs.
> 
> xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j80
> No summary for rule 20.12
> WARNING: Can't open 
> /builds/xen-project/hardware/xen/xen/drivers/video/font_8x14.c: 'utf-8' 
> codec can't decode byte 0x9f in position 7228: invalid start byte
> WARNING: Can't open 
> /builds/xen-project/hardware/xen/xen/drivers/video/font_8x16.c: 'utf-8' 
> codec can't decode byte 0x80 in position 5436: invalid start byte
> WARNING: Can't open 
> /builds/xen-project/hardware/xen/xen/drivers/video/font_8x8.c: 'utf-8' 
> codec can't decode byte 0x80 in position 4410: invalid start byte
> ERROR: An error occured when running:
> /builds/xen-project/hardware/xen/xen/tools/convert_misra_doc.py -i 
> /builds/xen-project/hardware/xen/docs/misra/rules.rst -o 
> /builds/xen-project/hardware/xen/xen/cppcheck-misra.txt -j 
> /builds/xen-project/hardware/xen/xen/cppcheck-misra.json
> 
> I'll look into it as soon as possible.
> 
> 
> On Tue, 13 Feb 2024, Stefano Stabellini wrote:
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>  docs/misra/rules.rst | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>> 
>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>> index 182331089d..c185366966 100644
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -478,6 +478,12 @@ maintainers if you want to suggest a change.
>>         adhere to Rule 16.2 would result in increased complexity and
>>         maintenance difficulty, and could potentially introduce bugs.
>> 
>> +   * - `Rule 16.6 
>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_06.c>`_
>> +     - Required
>> +     - Every switch statement shall have at least two switch-clauses
>> +     - Single-clause switches are allowed when they do not involve a
>> +       default label.
>> +
>>     * - `Rule 16.7 
>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
>>       - Required
>>       - A switch-expression shall not have essentially Boolean type
>> @@ -554,6 +560,13 @@ maintainers if you want to suggest a change.
>>         evaluation
>>       -
>> 
>> +   * - `Rule 20.12 
>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_12.c>`_
>> +     - A macro parameter used as an operand to the # or ## operators,
>> +       which is itself subject to further macro replacement, shall 
>> only
>> +       be used as an operand to these operators
>> +     - Required
>> +     - Variadic macros are allowed to violate the rule.
>> +

I think here it wants the strictness "Required" first, and then the 
headline second "A macro parameter..."

>>     * - `Rule 20.13 
>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_13.c>`_
>>       - Required
>>       - A line whose first token is # shall be a valid preprocessing
>> --
>> 2.25.1
>> 
>> 

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

