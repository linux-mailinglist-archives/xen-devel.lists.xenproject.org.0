Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C164C5AE089
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399432.640604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSfl-0005JX-FW; Tue, 06 Sep 2022 07:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399432.640604; Tue, 06 Sep 2022 07:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSfl-0005HF-Ce; Tue, 06 Sep 2022 07:07:01 +0000
Received: by outflank-mailman (input) for mailman id 399432;
 Tue, 06 Sep 2022 07:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVSfk-0005H9-5N
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:07:00 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20047.outbound.protection.outlook.com [40.107.2.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f869f1b-2db2-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 09:06:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7813.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 07:06:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 07:06:56 +0000
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
X-Inumbo-ID: 7f869f1b-2db2-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eo28dIGOGO5GV/E4gSKb+miXFIAfpbtJVUV+DxzoYj07EudT+JdXoBKCh0M7mR5ECdIPrG5QZqlEHLQL/QVAFNvXkTRzfNepdClyu1xfVllzL3pqFAToxZ2gKyx/93YlqUiWSpSfWWzEqZbNF6JW7p/UunhX7ABaWDJczqq+8VcM1PhVAFAljbgC5b+k23zNUTnm5Y5mtJC3tamAfSsmsHSY58TLnNCrcItaCWO3AVQWblQh227wgoPxaL+qEA/GpQrCpAbJ5Uhm+lguo2gqEmy0rlsz9RS9mLFyEN+uuZyKoZoqiDS4Om03fl9AeBwZGfyTNO80vBzZyHILlnysIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6I/63x5qAG9k0n9qEXH2a0xgxLGEscX/MDRhYH8wntA=;
 b=FhiKETB9F67rU6VECki6fUTuOuRrqmyFZo3UQM4xmoY5/2nlrU6k/328wh2+4ueZaWSIkvJF34lbel1fRrx3pFoWVqZGe5UBDMAvQgcoId1NyjKq95Bot8xYn3pvjGArAdmdNyCgcBkGwZqgkDX6NIltQSTGeI1+NLvN6KvynHpvRrArGHgbO8bAhzQbMqmeJfFuKp7DGRqmtEApF0U+62itort/7r5sAKcXd952nIIRPsHb6+BjsDXg/KAh9dhP+ptsB442EgTchHi7x4+28Y9+3nYhh5kRZukGGoLy2NsZrbffs0fRn+dE9kpr+JstnX5eWMrV6ba6CW20xamMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I/63x5qAG9k0n9qEXH2a0xgxLGEscX/MDRhYH8wntA=;
 b=sAUkN14+WHv62c782QgvXpJk7ONIJgX9j4kkGKFGu2KR1OWeQhoY1VeYBUXNWAT9kRwh5T1+gXXqGzk/M7OjK0NxZOzI+mvU7TBYrzFbWIavjOqHBFR9IzCJg4P1ak6LY7carkZqjdOz8R1x/65i611t8e6wnr+czTJaHHRSEhCormglGTGL7OBKlRHOYf4IGA77eyoVVkZ8VYEJXEG0VRCLopCD+4moVbYvvZJxtJaFKtE5KUW/ZeLDAua2Cdq1Xcj2KoJ7GaAFWOF71QskFrPy2ilO+qVEv2SMN1EaIfmiMLYYR1T6nr77VTnmpWYXq9pmtJb7nYvVBPq/3jIQpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a02774d0-8ae1-e89a-8d4e-8a5823d05d86@suse.com>
Date: Tue, 6 Sep 2022 09:07:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-3-wei.chen@arm.com>
 <15c1de02-efa3-5d2d-db3f-1b04de8a1ba4@suse.com>
 <PAXPR08MB74201ABCEC5CCFF65F4C84969E769@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74201ABCEC5CCFF65F4C84969E769@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b57241d-2fdf-4422-d844-08da8fd6626f
X-MS-TrafficTypeDiagnostic: AS8PR04MB7813:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P/7FuLAkt3lRiCQe741iObennzBu6M/T6HTsSVzT6k35YPo/67fSFjplBToI0Q3v98LG10xrXUpdVHAJkLOBxVw0S68fTpun1HV1n0SrWOzK8/r3D9zXdj+x6X5bsL9KK/KPtOpccduHS9JPJESAbTfhK0QWx+Az5uEapg59NCLJzzIFBvkgw7GKOTYHejKWMs4BtR8gOEYZkIVbKFwQ9fL6oGSKfatydzJm2mjmdMAfzG4Jt9wBgjG4K48da6vBUjfvkdIvxB7d+HXlwdftXiiIK/GTl6x8tvpU9yI1sEJ7HGH0UorGQtXlVNFtJIe7P5HBycGPLM8yVCGBHvLH5VowczpVSQAfqf2lJDwI0Qj1fp1KFUnIV7xGYgsCatatwDkmz473EnCEt/KsUNcyEpw0VSIA+9OwHbuY4gtZP0pJtamMWuXyAdTJNvP0yCfVIoQUo6DD4f0F2quGV9+1o+oDv1zeL17997n7HllBtRO3hs25KRQpUC2NV/BV/0IxKm0onR64VEHsR34xhGFPJLrP0uknpUoZl7ypJsw0Mf3sdHND7SefWtsxFQuEU+A9T73PDLd9aq5VzXEuHY9tr7dqIre6TxzWtJnt28PSGGa6flP5QDogejZ+SXsCdZIgARANvtLcMXfsvtSQsUKgiXFKg02tmXZb5Iavx9VYfiGA0PAEGEAHOJKawWFiXq8A3sAvyEoUT9sllPE1QVpfPynMynJvavKJPwo9xdxDXCWCxf80fjMNygwtVBlfzsrO+Oz/TTBhKTb/M8GezkxsTvopMiVjTzUH6K1VnGezKt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(396003)(366004)(376002)(66946007)(8676002)(478600001)(4326008)(66476007)(5660300002)(8936002)(6486002)(6506007)(83380400001)(66556008)(41300700001)(6512007)(26005)(6666004)(2906002)(86362001)(31696002)(53546011)(31686004)(38100700002)(316002)(36756003)(54906003)(2616005)(6916009)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2F3cENuSTQ4cTlybS90OGNFYTlFcjlGSVRsZXAyL1BVN3pUdVRZYWp5djNw?=
 =?utf-8?B?OXNHZU0wdDBNK25yYXYwSTFqcXM0N0ZMbUVHcWdVdDhoU1FBM21mOGN3eG4x?=
 =?utf-8?B?amdRdnBlNXdYSitvMEE5VUNZWnVpUzBuWlI4eU54eDVNU1lyY3RhNS82Rkx4?=
 =?utf-8?B?blVvYjdIc1djU2h0WW5JclVrNEloYXBERjNXT3lvaXh3VG0rTzlwZDVaSVly?=
 =?utf-8?B?UXNqVGpTdDlDZ3JYL1FtcmtLSmZuMm9DSTBnRlBzV1hldjdiRTRZVmUveFl2?=
 =?utf-8?B?Y3dPdWNNNmRucE1PQjdicjlVUkFaZ2ZLWnp3aC9JMnZHckR4cElBVzNTMnlZ?=
 =?utf-8?B?K1Y2S3g3VnFLWHNVUTMxMlBIY0NmVVFZdyt4S2pCR0Y0NXFDNExzY092TWJs?=
 =?utf-8?B?NVRXNTYvN2dyZTVudVVxazR6U0dKWWp0TjFCU1paU2JzR21BOWlDYVNlQnBW?=
 =?utf-8?B?K2owWS9SUVpuZW40R2tISmpER25LL2NDOHdBbUtYNTl0YXQ3NHY0OFZLK0VI?=
 =?utf-8?B?Z1BucVdBMy9jR2E5Zk90Z2xtUTRQTjVkQm1tT21IWUVCU2gxOVNRNWIxM3VH?=
 =?utf-8?B?KzdiOXhWTUQwdm5jZFpmamp6LzRIdkh6Smt0aWZ3QjVnQ21lMDNvcmFBTGJp?=
 =?utf-8?B?WnBvU0xqSXQrWTM5dU9yejQrTWtYQzJ2U2hQQW9peWtURHVuU2JpRU12TXRB?=
 =?utf-8?B?aENQTHFNaG12bkJ4MDFkdElLY2Vpc0ZtcUdMNnU4ZGFZeXVmTkhZQnc2dGV0?=
 =?utf-8?B?VFRYRWphS1FMVzZGZXBsMjlIRVVNY2ovU2FhVDJHVDlxTFJEa3pZYmNyMHR5?=
 =?utf-8?B?cDNuUGtmQVRIUkxtaXhGcWdMNEprV2lJV3EvQy9oS2ZuQWVxYTV3UEVoeEZD?=
 =?utf-8?B?Mlh3eUpITmtsRnFRa1pXN09Hd3MyVGJSeDZ6ZkEveFVEcWRGRSsxSitiZm93?=
 =?utf-8?B?UXU3REd0U1RtQ3NOb3dxYnBsNWhHbDIyWC91WGJBSFFnOGpoYjI5OWNldWcw?=
 =?utf-8?B?WDVmank2VDF4eVkyYnlBQ0FxUzBLNnRwcno3bm9URjlQL2UzVll0Y1NvR2ZW?=
 =?utf-8?B?OCsxNElPTkVZWDNrYUp1Y29RYUpxRWEvVHYwQ2dBcDZZb2F0YnVjdGUzUXYr?=
 =?utf-8?B?UGNMWUtQNXVUNTZkU2xwMGhNYlE2NDRrV3pxaFB1alBpVHQ5NDZiazRUUVdl?=
 =?utf-8?B?YUl5Y29WQW9LSXV4NGErQUROR2xybGNIVk9Gc3hqd25rMUYxTXNSMy9kYmp3?=
 =?utf-8?B?SWxyK0h1T0VsOUxoQVJ3N09ZZFdmT2J4K0xtNW91K0p2blNWRWxWM2pibXpn?=
 =?utf-8?B?OEZkc3V5T2wrSkRPcTZLcFR4K3B4Q1BNalo0UFczTVJKUkJvZXZSVmI2Zklk?=
 =?utf-8?B?Q2JVRzRHTzB1NkIvNVpabWRlK1pBdEVuODBzU0MrMFNiVFdLamV3Z3F2MmV2?=
 =?utf-8?B?Yit1bmhGaGJ0ajMrSHZJYlBaaGxIV0h4TEowTGxyYkZJWDdrYzlFakZBdVo3?=
 =?utf-8?B?ejRETXZWYUVRWk1IaDAvbzdRbWNKSDBubklTWDVhNDJybEIxbVlDNXA2ekNQ?=
 =?utf-8?B?bVdqTEovTTNmZU1mSmwyeU1SajZBV2NSQUphdnF2ZVlxa04rNk1FYVFyUUdR?=
 =?utf-8?B?WG1sTWFYZ25qZDh4bVJtNFlzd0dxeXdXWnJ1dDVLR0owREV5YUIwd2tqS3A5?=
 =?utf-8?B?R2htZ3djSVZuMC9Zck9YNzVZd1N5SDg0enZ0Ly9WWitWUDVOSCtmdnA3bDFV?=
 =?utf-8?B?VDdPd2E3ck0zRHBVV0Q4aGNOWnNQbDhBZUVVS2ozUiszM0dIQ3lINkVJWnY2?=
 =?utf-8?B?VkM2OHlOZWJFa3RrQ3c0VFYzVXQ3UnZoSkdKTFkrY1N4Tm9ldXlleHBLU29J?=
 =?utf-8?B?YjJuS3ZxZ0FJbFJaY0h0dHBqNVJiZkNjYlFnaFBucGhadmVsS1JuSE5WclJW?=
 =?utf-8?B?blNHdEswdmx4MHU4SVRTY3RxWG1KK0lGUVNNWHQxbXJTQy9Xb3NzS0V2bVpC?=
 =?utf-8?B?Z0wrcEhQbGRnL0o0L2xVSDg3Z2s5MzRLZ0dJclY1RXVQRFo0TG8vT2hnZ2xy?=
 =?utf-8?B?WFFyZ1NFZGZSSFNOSEsxS3lGRVNYU0hiSFlYZEN4dTRYSWJ5N1BkK3pHUkgw?=
 =?utf-8?Q?Bp1oRGkFFZFXmaN+pjw9UzlRR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b57241d-2fdf-4422-d844-08da8fd6626f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 07:06:56.4710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sw+5/upvWodD0kfflxvI4vt6I9RJRIeMShLSwZk4t680QtGnEoSxa2v9ks0R7Dmxr8P5YrzoYTW6cYgFSS0FzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7813

On 29.08.2022 11:49, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年8月25日 18:58
>>
>> On 22.08.2022 04:58, Wei Chen wrote:
>>> +nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>>> +
>>> +bool __read_mostly numa_off;
>>
>> This, otoh, can be, or have I missed a place where it's written by a
>> non-__init function?
>>
> 
> I think yes, it will be used in numa_disabled and numa_disabled will
> be called in cpu_add.

In the original code I cannot spot such a path - can you please point
out how exactly you see numa_disabled() reachable from cpu_add()? I'm
clearly overlooking something ...

>>> +bool numa_disabled(void)
>>> +{
>>> +    return numa_off || arch_numa_disabled(false);
>>> +}
>>> +
>>> +/*
>>> + * Given a shift value, try to populate memnodemap[]
>>> + * Returns :
>>> + * 1 if OK
>>> + * 0 if memnodmap[] too small (of shift too small)
>>> + * -1 if node overlap or lost ram (shift too big)
>>> + */
>>> +static int __init populate_memnodemap(const struct node *nodes,
>>> +                                      nodeid_t numnodes, unsigned int
>> shift,
>>
>> I don't think you can use nodeid_t for a variable holding a node count.
>> Think of what would happen if there were 256 nodes, the IDs of which
>> all fit in nodeid_t. (Same again further down.)
>>
> 
> If we use u8 as nodeid_t, why there will be 256 nodes to here?
> And the MAX_NUMNODES has been limited to 64 (using NODES_SHIFT or
> CONFIG_NR_NUMA_NODES). If we allow 256 nodes, we have to update MAX_NUMNODES
> and nodeid_t first I think?

Well, when writing the reply I did forget about MAX_NUMNODES, so yes,
with that the value can't be larger than 255. Nevertheless I don't
think a count-of-nodes value should be expressed with nodeid_t. It
should be simply "unsigned int".

>>> +                                      nodeid_t *nodeids)
>>> +{
>>> +    unsigned long spdx, epdx;
>>> +    nodeid_t i;
>>
>> This is likely inefficient for a loop counter variable. Note how you
>> use "unsigned int" in e.g. extract_lsb_from_nodes().
>>
> 
> Did you mean u8 for "i" will cause something like unalignment, and will
> cause loop inefficient. If yes, I will use unsigned int for "i" in next
> version.

There's no issue with mis-alignment afaics, but there still is the
inefficiency issue requiring the loop variable to be zero-extended
before being usable as an array. Both x86-64 and aarch64 have the
zero-extension as a side effect when moving 32-bit quantities (from
memory or between registers), and arm wouldn't require any zero-
extension at all then.

Jan

