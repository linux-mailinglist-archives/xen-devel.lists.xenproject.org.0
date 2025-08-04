Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F559B1AB7C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 01:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069868.1433559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj4jQ-0004Mh-0x; Mon, 04 Aug 2025 23:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069868.1433559; Mon, 04 Aug 2025 23:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj4jP-0004LL-UJ; Mon, 04 Aug 2025 23:36:39 +0000
Received: by outflank-mailman (input) for mailman id 1069868;
 Mon, 04 Aug 2025 23:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C33k=2Q=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uj4jO-0004LF-TS
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 23:36:39 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20611.outbound.protection.outlook.com
 [2a01:111:f403:2407::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da56f8e1-718b-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 01:36:33 +0200 (CEST)
Received: from CH0PR03CA0357.namprd03.prod.outlook.com (2603:10b6:610:11a::6)
 by SJ5PPF6D27E3EA3.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::998) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 23:36:27 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::26) by CH0PR03CA0357.outlook.office365.com
 (2603:10b6:610:11a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.19 via Frontend Transport; Mon,
 4 Aug 2025 23:36:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 23:36:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 18:36:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 18:36:26 -0500
Received: from [172.17.155.73] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Aug 2025 18:36:25 -0500
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
X-Inumbo-ID: da56f8e1-718b-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSbd4diBC5bIJk8qqb/jxPhH9YqqwTVHNq8dJxoxrnik8DfJGsFVzN0uwybsUYu+1vTMkxZ4rQRy8U+GoO7UmpskIonODE8n9Kx60xoAWM0I1FJLcv5PTPEbdt0SBMoM07TBW1FFsHH28XGdk0Zm7GtDJ/MQLry09pnj65rPlnOGNkw+9GCENWCePp2kL8WDXLoOMwDCbTHTxUbWIZJdVzn/B7Vuht1NI89kllD52nm0kqsNQMq5fa3OOdexdZs1HDPYVDMOlYW4aW5cq2m5zb3ofhc9tOZOPUabDnLHMmWb5M5zHm2lOGFEYRlTQpr1I+s9+NLPqSjWNruqTAqzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+FnWxTbd2sJ1Go3v5SfdpwD1SRiUC4hSQuQzT2VSow=;
 b=NFtFUmoS7hbY+jcvrn5mi8W0o35fGKW0+jkp5EMISkNDBLA4jSfLD8uIZ/8Yj4FD9WFmhPv8VUAyxClg+swpTe+ifVzrOpqwigapIDJReVJyPhzjyN85FGi6xTjGS0m7Q83rSwRm9724OOwNKCISjXuTCNoL6RfalQps8cxDTDrTUktSYmGBXFbGYUClK7O6GjXfC7nd8HgLq/FYxUq3t4y5uZIKGx93fpUUMC8NKPmypXg5f8aD9gfxlQTx2Eo8VoIM0lGAj9IGJCxQTebx6FornSWSjA8nsumyIzwMyw/eEy1ZqQt1pHLl/qUj3oSe3XalgkTzy7Ay0TaGkTmktQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+FnWxTbd2sJ1Go3v5SfdpwD1SRiUC4hSQuQzT2VSow=;
 b=1I170uy7VH1ofWs82L9cyn43siqWiYdt3aATyYDn6wttD2ua8GqKsgGorTjRPa4l83PBrZJ0akSonIU96Kk68I25Iks2o6OQh5OEYp93dC43WBBGSKEH0S3vmjAmTclRmsNv5oJ/HfosNKYQru7uE0Wxe3rL/LAS63kpBmo5kzk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4f5009e6-3099-4f6d-af45-dc7c418f483c@amd.com>
Date: Mon, 4 Aug 2025 19:36:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: rework error handling in vcpu_create
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>
References: <20250801202418.38977-1-stewart.hildebrand@amd.com>
 <c1aff2d0-0542-48da-a0bd-30d0eae1eef4@citrix.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <c1aff2d0-0542-48da-a0bd-30d0eae1eef4@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|SJ5PPF6D27E3EA3:EE_
X-MS-Office365-Filtering-Correlation-Id: d9286db3-61a3-43c9-4663-08ddd3afbb5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEt2b0dqQXNDWkVZSVEyUFdRYVpNM0F5SDd6T0cxNHdqdmlkdWI0bGZvZVNw?=
 =?utf-8?B?Zy9kd2xBUTRRSnJycTFJMEc3ZHVnajI0RG1lWHRQdDJuQmx1ZmRlVGxiYk9n?=
 =?utf-8?B?RDE0M3AvOVZBRzBmZVNTb3RVdE1nM0pKZ2hWRUo1NXM4cjE0cUJlUmRMdFV1?=
 =?utf-8?B?ckFWL3pkWGwxWUZETGhuVE1jZ2NSVU1PVXRodE9ZV3NucEhkQlVONlltaHFG?=
 =?utf-8?B?WC95b2U3R29JZGcwVThiaTBPUmV1SEVPSE8vTjdpRUI4bjcrNGE1MzBBSW1T?=
 =?utf-8?B?OE11aHExM1B1TEdKUU8zMnJacDJxYnRtS21WVkF2OWlVVTBMNkhXa09pZ2hs?=
 =?utf-8?B?S01pUVZEaE1uekM1REJhMmRGU25HdFJoaHQ4Q2daaXY0VnphM1NnWXF1U1Fr?=
 =?utf-8?B?MWxUenBVQkpZSnJSWlBGQ1lmUE9tZUJtaTlNb3VTZ3JibjVXd0hYdDFiZmNX?=
 =?utf-8?B?T3ZMMEhCaENJK0pBMjhVc1J1dXFvZmRTR1p4Vkh3akg2TzVZRTh6UW5URm02?=
 =?utf-8?B?dXB3OUFoVnNHK1dKVHVuWkVlc3NERmdtUjRtR0dUOEFwNFgrNzRZbUNlTXhW?=
 =?utf-8?B?SEtqYnNtUzVpbE1uaFhmYmJ5cDQydVM0VW9EQ1grcFRHSDBEQmk5aStvVEIz?=
 =?utf-8?B?aVBvemphTnU5eFUwVEtjUERPZFdwNXA3UHN2TEl1SlpSU2NsWkUxMzZNUTVi?=
 =?utf-8?B?U1RUeklPR3lJTjg1Z04vTHJUaVhFby9LUFhLR05LOVN1aXpaajUwSzdkbjdQ?=
 =?utf-8?B?amNjWDh0M3RoT0ZpcXhjaXgxYS9NVnUwR1d2bEl4OElIcE1LMjVuYSt4ckF5?=
 =?utf-8?B?TVRESk1yUGx2UXRidmw5M2FFd2JaYkpRZE15LzM5TkN6MjZOQUJyV0YzVFY1?=
 =?utf-8?B?bVJ4NWhMWElKY1dwS3VLUkZReEQ0ajBNWm5NbWRuN25PQlJ4L1lzK3A1eHlD?=
 =?utf-8?B?SVNwVzdRbmhOd1ZkdU9BSWdwclU5VEhaSXFKUDJsRU9rMThDU0tmNDdoNG4x?=
 =?utf-8?B?a0pMR2tvZEZGNnl6VFBVN05HWk41MUpubGdQYXVHRUQ3c2NLN0hJYW9DQXNH?=
 =?utf-8?B?TVJDdDY2YktvaGdjTXdBejVLY05KRi9VQ3ljVmI1MHZvK3c2SUxFek9LYURw?=
 =?utf-8?B?L0lVUUIwckpmSTdaSEg3YkFxL3RMdVh1RFNCNzBPYkN3RWVUUW5mYWswVVZ5?=
 =?utf-8?B?Y3AvQlNUTmtMZEtFaVJRc2lVMG41WFFQYVdMRWpuOHlpbXFUSlh6cEhWS2Qx?=
 =?utf-8?B?MGZBOFdYLzJITExJVHJDK25iOHloNEpXQnh4L1haS1NjMDF4MnlQTlo1L0JX?=
 =?utf-8?B?SE1RTDl2SHlNaHVzVkJyaU5mSXN3bGRJeDRiY0ZWWk5YaWREcTJyVTQrZHB2?=
 =?utf-8?B?U3BFbzNoSVVzdlVFZ1ZYUU0zdVRRTlJ2cnA4Sy9nNjlGTnZYSms3cngwcjhF?=
 =?utf-8?B?TEtBM1F3WlI1VUJKeTlMRm8zbkZCRVozNVluNjRIejNWZjMzZTJ3Z1pIVzRr?=
 =?utf-8?B?RlE2bWNYd1YyblQxVHNWS2N4cmdqcHF4a2hKdWNaN1RrMWJkRVI4SDBNNkdT?=
 =?utf-8?B?djdjRzNZaTE0OXdPWkNrRDN0TzM2dy93TFZhYW9JZlMxK0VhNDNkTnNWbndY?=
 =?utf-8?B?UlJFVkJhcWRhTWQzZVhZOHNyT1dLeVMxZWdHMlcvOUxOYmNNd05vT0l5WTBh?=
 =?utf-8?B?bnhEcUNoYXdldFUyZ1Zoc2dneDAvRktndTR2em5JQW1QbDNGM2xQcm9Tc0Jw?=
 =?utf-8?B?UmN1TTBVVldWemFhSWFDV2RjTU9iRjB5TnAzNHpOdVhzcnFyVkppbEVJRjVC?=
 =?utf-8?B?R2pwT09Rd3k5bXo1LzJiR0tWeTc2SUVvR2M0cVp2U0N0RGFadGxqVGhTUmIw?=
 =?utf-8?B?NmtwUVZKZmVDMUxGSnl6ditRWFdlV3JXeElZeGtHWHl4QU9lQ1k5QjFLeU9H?=
 =?utf-8?B?UTVjeUt1YXVFQVVEd0I5cEh0cjBEUHg4ZktxcVJaS0twakFvVmFGMVNVYkVW?=
 =?utf-8?B?Zm91VEJFQjFlb2IybDhCb0dsQXRPOTdOUXE3ZStoL2U2dytmZnlMdlM5WVZo?=
 =?utf-8?Q?mgKJJ+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 23:36:27.2250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9286db3-61a3-43c9-4663-08ddd3afbb5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6D27E3EA3

On 8/3/25 09:19, Andrew Cooper wrote:
> On 01/08/2025 9:24 pm, Stewart Hildebrand wrote:
>> In vcpu_create after scheduler data is allocated, if
>> vmtrace_alloc_buffer fails, it will jump to the wrong cleanup label
>> resulting in a memory leak.
>>
>> Move sched_destroy_vcpu and destroy_waitqueue_vcpu to vcpu_teardown.
>> Make vcpu_teardown idempotent: deal with NULL unit.
>>
>> Fix vcpu_runstate_get (called during XEN_SYSCTL_getdomaininfolist post
>> vcpu_teardown) when v->sched_unit is NULL.
> 
> This is unfortunate.  It feels wrong to be updating stats on a domain
> that's in the process of being destroyed, especially as a side effect of
> a get call.
> 
> But, I wonder if we've uncovered an object lifecycle problem here. 
> Previously any vCPU which was addressable in the system (i.e. domid was
> addressable, a d->vcpu[x] was not NULL) had a unit.

Hm.

My understanding is that domain destruction happens in roughly two
parts. The first part finishes right away, e.g. before "xl destroy"
returns. The 2nd part may be deferred and happens in
complete_domain_destroy. There may pass a non-negligible amount of time
before complete_domain_destroy runs, giving opportunity for an admin to
invoke all sorts of hypercalls from dom0 in the meantime when
half-destroyed domains still exist. E.g. see 54fe207f29f8 ("sched/null:
avoid another crash after failed domU creation").

Currently, sched_destroy_vcpu happens in complete_domain_destroy (i.e.
it's deferred), so half-destroyed domains still have their vcpu data.
The present patch moves sched_destroy_vcpu to the first stage of domain
destruction, not deferred. A consequence of doing so is that it would
open up a non-negligible window for an admin to invoke all sorts of
hypercalls while there exists half-destroyed domains with freed vcpus.

This is getting to be a bit complex, and it appears there's potential
for more fallout. While I'd be happy to make the changes to address your
comments below, I wonder if we should consider taking v1 of the patch
for now.

>>
>> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v1->v2:
>> * move cleanup functions to vcpu_teardown
>> * renamed, was ("xen: fix memory leak on error in vcpu_create")
>> ---
>>  xen/common/domain.c     | 14 ++++++--------
>>  xen/common/sched/core.c |  5 ++++-
>>  2 files changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 5241a1629eeb..9c65c2974ea3 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -388,6 +388,8 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
>>  static int vcpu_teardown(struct vcpu *v)
>>  {
>>      vmtrace_free_buffer(v);
>> +    sched_destroy_vcpu(v);
>> +    destroy_waitqueue_vcpu(v);
>>  
>>      return 0;
>>  }
> 
> Along with this, you want a matching:
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 5241a1629eeb..3fd75a6d6784 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1412,8 +1412,6 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
>              continue;
>          tasklet_kill(&v->continue_hypercall_tasklet);
>          arch_vcpu_destroy(v);
> -        sched_destroy_vcpu(v);
> -        destroy_waitqueue_vcpu(v);
>      }
>  
>      grant_table_destroy(d);
> 
> 

OK

>> @@ -448,13 +450,13 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>>      }
>>  
>>      if ( sched_init_vcpu(v) != 0 )
>> -        goto fail_wq;
>> +        goto fail;
>>  
>>      if ( vmtrace_alloc_buffer(v) != 0 )
>> -        goto fail_wq;
>> +        goto fail;
>>  
>>      if ( arch_vcpu_create(v) != 0 )
>> -        goto fail_sched;
>> +        goto fail;
>>  
>>      d->vcpu[vcpu_id] = v;
>>      if ( vcpu_id != 0 )
>> @@ -472,11 +474,7 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>>  
>>      return v;
>>  
>> - fail_sched:
>> -    sched_destroy_vcpu(v);
>> - fail_wq:
>> -    destroy_waitqueue_vcpu(v);
>> -
>> + fail:
>>      /* Must not hit a continuation in this context. */
>>      if ( vcpu_teardown(v) )
>>          ASSERT_UNREACHABLE();
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 2ab4313517c3..fb7c99b05360 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -321,7 +321,7 @@ void vcpu_runstate_get(const struct vcpu *v,
>>       */
>>      unit = is_idle_vcpu(v) ? get_sched_res(v->processor)->sched_unit_idle
>>                             : v->sched_unit;
>> -    lock = likely(v == current) ? NULL : unit_schedule_lock_irq(unit);
>> +    lock = likely(v == current || !unit) ? NULL : unit_schedule_lock_irq(unit);
> 
> This is obfuscation for obfuscations sake.  The normal way of writing it
> would be:
> 
>     if ( v != current && unit )
>         lock = unit_schedule_lock_irq(unit);
> 
> and that is precisely what the compiler emits.
> 
> Moreover it also matches the pattern for how the lock is released, later
> in the function.

OK, but I'd need to initialize lock to NULL (or add "else lock = NULL;")
to avoid error: 'lock' may be used uninitialized in this function. Also,
would we want the condition enclosed in unlikely(...) ?

    if ( unlikely(v != current && unit) )
        lock = unit_schedule_lock_irq(unit);
    else
        lock = NULL;

