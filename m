Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B8BF7DB9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 19:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147514.1479822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBG2t-0003qH-Dn; Tue, 21 Oct 2025 17:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147514.1479822; Tue, 21 Oct 2025 17:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBG2t-0003oi-9a; Tue, 21 Oct 2025 17:21:15 +0000
Received: by outflank-mailman (input) for mailman id 1147514;
 Tue, 21 Oct 2025 17:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bj24=46=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vBG2s-0003oW-Bv
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 17:21:14 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f65ba08-aea2-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 19:21:00 +0200 (CEST)
Received: from MW4P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::14)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 17:20:56 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:303:80:cafe::67) by MW4P223CA0009.outlook.office365.com
 (2603:10b6:303:80::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Tue,
 21 Oct 2025 17:20:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 21 Oct 2025 17:20:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 21 Oct
 2025 10:20:55 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Oct
 2025 12:20:55 -0500
Received: from [172.21.152.226] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Oct 2025 10:20:53 -0700
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
X-Inumbo-ID: 4f65ba08-aea2-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9aXNOYmBxx3nGLRU5qzwJhhPvIk15wsC7GNJUnG4r6FaPn1BorYoKbH7TqMvQVAZGd0Psi1ojnav2TZJJnienKrc9BEveQ3yGn35fsBHZfWEshFzfyt6zv9NY84hJV5DYvJkvIvqWTsTZiT/jdLXCzk5Q1YF8WFvffHyv25MLo2qtLpEWTjSfy57lnANHgvbiEwLX52Sn32/+k7OEXd2tAVY37tIHwuSpLgVE6llr4YcBN19Js0Pa37zGc9zODDHzTHCWgM3AJH6AuPW52N8+3oE4R3lAw/e3hcO/R5O/MefLtAe9SDKMY8RyOv95craBUAMF/7XaQsSuSU4x4hGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1a9B53zZi20Oa49So7sdfTfj5Oao41vAW32lubUwIE=;
 b=HXWx9u8w/7GCguc0TEGEPxOx1t4d9A7WNFEWUX2lRMq9hUAK29Yahz9Dmalkj4MiRZBqrRzeHQnDthW0RyCEfYmunHUDNc+IfsnfmIhwiWMVQjjSGvwHzmCuE0yyUd6/L0FGfdBOA7aLmcBSRWmLGTJsq7VwpftHoWumUuSaFf0O90OyvkE42hkL1BcwTgl4s7XQPFdGwNVrLQbfwiImJTNB3blfbz8Ij2kCJda7qAcB8krOAlterIINtdWI7WPJOer37B4/+ailEJ4vA/NRjZGmNqNdqObWuRLEutBwTeri6XepVSkjIst90dcIFRMGJ/9dADkwI9Bxz74BnShbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1a9B53zZi20Oa49So7sdfTfj5Oao41vAW32lubUwIE=;
 b=LSXeMAOnsZr2+ysTvoV0ZVvlCXsdbRgEswn4Q5w51uI1gmmCY7jdSy/OmPQKAtDAw5p1AEsNkwpuucnDlI1EYO5wni6ARqi+5kvMYmCCI03wHNUkQW1b15WBhxzfqRkSoMbHgb9WHLawrMeM1Rz81tigyq/Pz008MZBYhBCu4pY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <11778663-c884-40f0-9a4b-04ff4aa80355@amd.com>
Date: Tue, 21 Oct 2025 13:20:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: Make gentypes.py compatible with older
 Python
To: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony@xenproject.org>
CC: <jbeulich@suse.com>, <anthony.perard@vates.tech>, <jgross@suse.com>,
	<oleksii.kurochko@gmail.com>, <xen-devel@lists.xenproject.org>
References: <81c56c9c-882e-4433-b41a-6952315efa25@suse.com>
 <20251017020613.79855-1-jason.andryuk@amd.com> <aPezgmtiRHlDqFLE@l14>
 <fa9cf040-7acc-4bfb-bef3-5da5f9f5a558@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <fa9cf040-7acc-4bfb-bef3-5da5f9f5a558@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a369a7d-9528-4de0-b568-08de10c6320e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVZCU2tweEVoVHg3ZWZ0M2psb2RDcEtGZ2dwQTRQeWIxUHFLT3RwbXI5R09r?=
 =?utf-8?B?NlhocXVsV256Y1ZFdUJuWUtyQkZPVWlLNUZBQk9PTE1iTk1qUG50YlBxRUFR?=
 =?utf-8?B?L0tWNTZVUjlFSzl1Y2tBUjZPOU02SXZ0aytuNVNJRlEvc2xlR09sSG03a0x2?=
 =?utf-8?B?RTdBZjRocnA2dkRWRm84RjlzL0dPOVN4WXk0U1hnQ0dLN081N2JHMlVLSjRF?=
 =?utf-8?B?QkFocWwvZlJaK01pYUNLMWpNUkZHcGFVK096TXIwNWtTT2J6ZUE1TjREZ0Vm?=
 =?utf-8?B?RUZDWDc4RUREcjlVc2tkQlBvOUZqQUxIU25lUWtjTTVpZ3ZiNXJDRlRlOU1o?=
 =?utf-8?B?MUppTktRYW5NZ2RhNnBCN2RWd3NURVFMbHg2VHFzUGxJcGNvaXVaMUMyMVdx?=
 =?utf-8?B?TW1CMmdjMjNDV1BQTE5KS21Xd3lWaWxEODNidnZiTytKcm9DbHFaUHJDZGhY?=
 =?utf-8?B?OWRUdGVZem5Wd0tmcDkzWTcrZTRwTENQZEJsWDNtNHZkbWttV1FNYmtPdE0z?=
 =?utf-8?B?VHo2dVVKcWZaVWxWOEZrL09sY2hZemVGM0hVL21uNjVQbHkzUktCMzlFVlVT?=
 =?utf-8?B?MFJ3ZXZ2OW1nazRuUm4reDJKQUdOOGJSRmd1NUMvOGFTT00rUGdsaDZPakFE?=
 =?utf-8?B?Y29pWVZuZkwvbU4zZ0ZudGVNZzJEaDlib1EySVNvbmgvclgwbFlKM2UxWWUx?=
 =?utf-8?B?eEFuRzQwUWljQTV1aSsxd1ZlS2FtUWt4S01UWTArMGxtQm5GYzBNa2NQeXFN?=
 =?utf-8?B?TlZtNUlBUXhEMzdBZ2oyQWd2VERNVzh3WHpkY3VITTcxTzQ2a2xoRjg4QUE2?=
 =?utf-8?B?Q1JJTVMzYzJDU2EzaHU0VnF3cW5yc1N2MEZYck5PMU9jR2VVM1ViSUpjQ2tq?=
 =?utf-8?B?VURTN2oyNCtXdHhIUnh4dWlEUVdPKzM4dEwrekwzcVloUDZoNUtFaFptUjl2?=
 =?utf-8?B?SVB2VUNDNUl1RUgwYndVOFAwU0lvWWNUelZ6c1BmSEJGQjZSZGhId0dmU0pI?=
 =?utf-8?B?L2RJcGpRSUhWZU9QbFJXbzBLbzE4N1VLUGN1b2xoODhoVTA3SUo5c1lWdUti?=
 =?utf-8?B?RCtPcmNiYXYvMmlrVktHNGwzeXNFU2FWeFVKc1d0NkJraUJITEx6RXM3Tmg0?=
 =?utf-8?B?R1FEV3ZFR0thanlRVkJoKzhoZTd6R3pSWFBxOXZnZi9NcEh3aURPWmNSWVpt?=
 =?utf-8?B?YmMxdnBZVFpJWlNXYUxNUVpNMlM4eHp0K3Y0TkhTMzJ1Nnc4dkdxODFrWXpO?=
 =?utf-8?B?dnJrd3luL0ZlUnFxaHlvUGJNVmVrYjJGOU9xQmNrb2tPVzJLTDZtNmxCb3N2?=
 =?utf-8?B?ZEN0Vzk0Q0tMa1REYjFEaGNmaGlGRDhKWFhOTFlHVUYxcndtMjhsdWEzOWtB?=
 =?utf-8?B?ajNUNWx3ZXdIZDI1R0pRRlBNM2x5RTBYZllKWnBHQ2lIY0czZDhYUEc2RTBR?=
 =?utf-8?B?d3RIbFI1OWxEMlVqaHBtZkRrRXpMdzJQQTBIUG1qbWkzMWhTQ1p0alR3cTRn?=
 =?utf-8?B?Zlp2UnJIWG5CS0h5RVQvYmlhQVVQWVRkN2k1OEtyR012cFhiL2JseWFySkRV?=
 =?utf-8?B?Snh4aVFMQVd0VDZ1SVRMMHVTaTVLRHJWT2U1d3lpNTZNWVZNVlFoT094VnNr?=
 =?utf-8?B?RzIwMjM1YUgwcTVtelF6TEt4aTZZei9QWkpScTQyRHlNbjMvWWFOM1JvQTh3?=
 =?utf-8?B?b2MxYU96WW1vWHZFd1JVOGtHaVlNZ2lZQ3NTWHZQb3hPR21ta3VqWG9Baks0?=
 =?utf-8?B?U1FCR01MdWkvVmMrdnlodkFTSWl2TmE1bFNkMnRCMW91OGprbmkvZTRlMll3?=
 =?utf-8?B?eXhKbDZYOCt3UU5iNm1qUFM1ODcrWmtoZFJXRHpEV2hpR3lCMUl4YnFzZmli?=
 =?utf-8?B?QlhPMkVlTi83KzBVc3J3THZaelRRWlNDM1pNdlYrQlQ4SDVDb2FpUk96a1hy?=
 =?utf-8?B?NEczNyt1MVNLQnpZS2srMEdLQk42V2JleHBGNmxpSFZEV3RCdTFINWZwb1B4?=
 =?utf-8?B?UnpFTXE0QS9meHJSRlhXSFprYnFPVWIyMmVwU3pXai9iSlVubHJlT01tRmFk?=
 =?utf-8?B?UkdTZEdrV3J3SDh5cjFvL0RjUzR2ZG9IU1RyS1VpMXJlWDF2YzljNlRkTkw4?=
 =?utf-8?Q?7+WQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 17:20:56.1232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a369a7d-9528-4de0-b568-08de10c6320e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650

On 2025-10-21 12:31, Andrew Cooper wrote:
> On 21/10/2025 5:23 pm, Anthony PERARD wrote:
>> On Thu, Oct 16, 2025 at 10:06:13PM -0400, Jason Andryuk wrote:
>>> removeprefix is only added in Python 3.9.
>>>
>>> Instead of the prefix removal, switch to passing in a "depth" parameter,
>>> and incrementing it for each level.
>>>
>>> There is a slight change in the generated _libxl_types.c.  instances of
>>> KeyedUnion increment depth without outputing any code.  The net result
>>> is some cases where jso_sub_1 is followed by jso_sub_3.  As an example:
>>>
>>> _libxl_types.c
>>> _libxl_types.c
>>> @@ -5535,12 +5535,12 @@
>>>                   if (!jso_sub_1)
>>>                       goto out;
>>>                   if (!libxl__string_is_default(&p->u.pty.path)) {
>>> -                    json_object *jso_sub_2 = NULL;
>>> -                    rc = libxl__string_gen_jso(&jso_sub_2, p->u.pty.path);
>>> +                    json_object *jso_sub_3 = NULL;
>>> +                    rc = libxl__string_gen_jso(&jso_sub_3, p->u.pty.path);
>>>                       if (rc)
>>>                           goto out;
>>> -                    if (json_object_object_add(jso_sub_1, "path", jso_sub_2)) {
>>> -                        json_object_put(jso_sub_2);
>>> +                    if (json_object_object_add(jso_sub_1, "path", jso_sub_3)) {
>>> +                        json_object_put(jso_sub_3);
>>>                           goto out;
>>>                       }
>>>                   }
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> ---
>>> Here's an alternative approach to workaround removeprefix.
>> Yeah, this version is less obscure about what's going on. Let's go for
>> it.
>>
>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Thanks.  I'll take this version, and take the liberty of assuming that
> the Release Ack is transferable to whichever solution the maintainers
> prefer in the end.
> 
>>
>>>   tools/libs/light/gentypes.py | 14 ++++++++------
>>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
>>> index 006bea170a..0e45c04f49 100644
>>> --- a/tools/libs/light/gentypes.py
>>> +++ b/tools/libs/light/gentypes.py
>>> @@ -377,15 +377,16 @@ def get_default_expr(f, nparent, fexpr):
>>>       return "%s" % fexpr
>>>   
>>>   # For json-c gen_json functions
>>> -def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso"):
>>> +def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso", depth = 0):
>>>       s = ""
>>>       if parent is None:
>>>           s += "json_object *jso;\n"
>>>           s += "int rc;\n"
>>> -        sub_scope_object = "jso_sub_1"
>>> +        depth = 1
>>>       else:
>>> -        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
>>> +        depth += 1
>> We could simply do `depth += 1` regardless of the value of parent, it
>> would have the same effect, since depth start at 0.
> 
> That makes the code even more simple, because it takes out the else.
> The net hunk is:
> 
> @@ -377,15 +377,14 @@ def get_default_expr(f, nparent, fexpr):
>       return "%s" % fexpr
>   
>   # For json-c gen_json functions
> -def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso"):
> +def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso", depth = 0):
>       s = ""
>       if parent is None:
>           s += "json_object *jso;\n"
>           s += "int rc;\n"
> -        sub_scope_object = "jso_sub_1"
> -    else:
> -        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
>   
> +    depth += 1
> +    sub_scope_object = "jso_sub_%d" % depth
>       if isinstance(ty, idl.Array):
>           if parent is None:
>               raise Exception("Array type must have a parent")
This works for me, thanks - I even tried it at some point while tracking 
down the jso_sub_2/3 difference from KeyedUnion.  I should have gone 
back to it :)

Regards,
Jason

