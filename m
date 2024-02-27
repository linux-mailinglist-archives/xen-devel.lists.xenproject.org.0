Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AD7869A90
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 16:39:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686237.1068021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rezYE-0000oM-5t; Tue, 27 Feb 2024 15:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686237.1068021; Tue, 27 Feb 2024 15:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rezYE-0000ln-35; Tue, 27 Feb 2024 15:39:26 +0000
Received: by outflank-mailman (input) for mailman id 686237;
 Tue, 27 Feb 2024 15:39:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NOTz=KE=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rezYD-0000lh-2F
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 15:39:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61e299f8-d586-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 16:39:24 +0100 (CET)
Received: from [192.168.1.9] (net-93-144-106-196.cust.dsl.teletu.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 6AB524EE0742;
 Tue, 27 Feb 2024 16:39:23 +0100 (CET)
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
X-Inumbo-ID: 61e299f8-d586-11ee-afd6-a90da7624cb6
Message-ID: <ea2f8c01-35d9-4c4f-9c57-1691a9d66fca@bugseng.com>
Date: Tue, 27 Feb 2024 16:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [XEN PATCH v4 4/4] eclair: move function and
 macro properties outside ECLAIR
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <387b160ae93c221c4bc2426605b96b432b26224e.1706886631.git.simone.ballarin@bugseng.com>
 <b549f8f3-b21d-4ca5-9ef8-e1c39856d691@citrix.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <b549f8f3-b21d-4ca5-9ef8-e1c39856d691@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/02/24 16:44, Andrew Cooper wrote:
> On 02/02/2024 3:16 pm, Simone Ballarin wrote:
>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>>
>> Function and macro properties contained in ECLAIR/call_properties.ecl are of
>> general interest: this patch moves these annotations in a generaric JSON file
>> in docs. In this way, they can be exploited for other purposes (i.e. documentation,
>> other tools).
>>
>> Add rst file containing explanation on how to update function_macro_properties.json.
>> Add script to convert the JSON file in ECL configurations.
>> Remove ECLAIR/call_properties.ecl: the file is now automatically generated from
>> the JSON file.
>>
>> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
>> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
>>
>> ---
>> Changes in v4:
>> - add missing script for converting the JSON file in ECL configurations;
>> - improve commit message;
>> - remove call_properties.ecs.
>> ---
>>   .../eclair_analysis/ECLAIR/analysis.ecl       |   1 +
>>   .../ECLAIR/call_properties.ecl                | 128 ---
>>   automation/eclair_analysis/prepare.sh         |   2 +
>>   automation/eclair_analysis/propertyparser.py  |  37 +
>>   docs/function_macro_properties.json           | 841 ++++++++++++++++++
>>   docs/function_macro_properties.rst            |  58 ++
>>   6 files changed, 939 insertions(+), 128 deletions(-)
>>   delete mode 100644 automation/eclair_analysis/ECLAIR/call_properties.ecl
>>   create mode 100644 automation/eclair_analysis/propertyparser.py
>>   create mode 100644 docs/function_macro_properties.json
>>   create mode 100644 docs/function_macro_properties.rst
> 
> This breaks the Sphinx build.
> 
> checking consistency...
> /local/xen.git/docs/function_macro_properties.rst: WARNING: document
> isn't included in any toctree
> 
> Also, the top level of docs really isn't an appropriate place to put
> it.  Everything else is in docs/misra/.
> 
> When you've moved the files, you'll need to edit docs/misra/index.rst to
> fix the build.
> 
> ~Andrew
> 

I've submitted a new patch moving these files in docs/misra
and adding the rst file in the docs/misra/index.rst's toctree.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


