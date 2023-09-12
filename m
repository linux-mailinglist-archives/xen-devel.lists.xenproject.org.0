Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A870679C9B1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 10:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600085.935674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfycv-0000yd-5u; Tue, 12 Sep 2023 08:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600085.935674; Tue, 12 Sep 2023 08:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfycv-0000uy-2L; Tue, 12 Sep 2023 08:20:05 +0000
Received: by outflank-mailman (input) for mailman id 600085;
 Tue, 12 Sep 2023 08:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfyct-0000X7-5e
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 08:20:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29a96f00-5145-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 10:19:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9478.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 08:19:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 08:19:56 +0000
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
X-Inumbo-ID: 29a96f00-5145-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDHbBKV5mjXSFw1sCvEyEBJHvS8/h5h9WRkcBp1oy/6n1e3z1b2scql9tlzJyWB/pc30ReJT5BPt0A9LnOnoFy6R/uqBxhiqraPErRSq6WVSmavwUlPQHGH0BuQRKoODsRe9xYJIXMP+wC//+kefwmjF/IlQLu20quKHh+rJeO3fg/0m2Q+gv0Fwwk58DIRSktfI/5cwup0YRPDAIYqi7S7TH3f5VuF24dHO4hsQOeo2zSQMG7NSs71JJaxNpDZOQXfZiv8lQVDeeiyPa1GtLp1MyiQcLnRDlWEIlV11vnfgjmD3Fk9NZ44Qm6Mz/ssuNNT8g5aR34skSyvk0c5vag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnsui2lZ9kWhvpHteJ/3NBXRxa3x4/pRhx+2A8ZmrOA=;
 b=cUKcEly5fc7/+qNtcV+gRCDN3cFXxeIjZ0NEvdZ5iG8OFPmtAkUn5O7pU5/wMsjfOdlaQa9umI53MRi/erxT+HXBVoRxysHmvuQTX4dAeU12k+pZSygE39KJmg/z+Diy46h5Mi2d/ev/Lm+m/aWMBJt2Is9vWmRlzciSqjqpm+y00X31JzfSu/LzpjaNw5Jz0Qo3xjGw/k3usLdL/I1bKxzuigG+nXnUjT84hwc7j6MXyL0Cum3SPsqU3VIyvEvsfOrRFJSLfN6DqPwE4m/eTU+2Tv0UlSAfqVoyBJ9c5rZcDtT+WC/L4maBcC5tfsGyom58mcADw/0g6uj51Kb72A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnsui2lZ9kWhvpHteJ/3NBXRxa3x4/pRhx+2A8ZmrOA=;
 b=266jRnepEjWhuvXv217XKT5Z5uis0EOvsO6edRdL5LxYAV1XOWjuSlSemlGrelz/Ln1IaRBluGKT0xAjCZAfa0VLyTzJ+3GtU9HdH/C1vGWWA0lhrySMpS7EM3Qum5TDTiKBFIMbyASCiRmCacapqYDrKdYeQnvqCnaY7YZuvYkk1K3b/gBKPXu/xChnlaVWDFK1wTfwE+gs5LXSH5xeAN3I5GsuUXGUm40lTfPxNyx0piPZ4ariddyWNgsnNWqKHC7oLkhmGWSYMHeXOBLQi8ygKL0GV3l9p8vxqyz3yVYOHyuxLehIfJga4yoM4G/c6lZeWW3VFib//UbGcLnRNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e591aa9-96dc-2d92-1a8b-c82ee73ea27b@suse.com>
Date: Tue, 12 Sep 2023 10:19:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries marked as unusable when
 parsing MADT
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20230911101238.18005-1-simon@invisiblethingslab.com>
 <2a19aef4-8bd6-ef8e-de4b-b85135dc7ea4@suse.com>
 <46959668-24b2-bf7e-7535-9fc47fcfc5e0@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <46959668-24b2-bf7e-7535-9fc47fcfc5e0@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e71134b-653d-4882-3378-08dbb3690c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3agvz+1+IqTTKhRxbJFqYshI8+mZw8+ogIpa4i9Fvzvb0u1FPQnjPOgxoUyAljCgpZkxge3U+m1BY5HG0ofxYmdBArqerMMlgQbf90KoqkJ5qAwBh45PNOfsRSkL5mJIJXmJ7kYakmUgu/xKbn3ufHquW+Zs3B5o1jCZSMrg+Q4614LIasVUKZGL1D4KTSQXIBhrVX7iNGJxKnW9IMZmfCzsIf5H+c8oTMqF1Ly1qJTVMDhO9D5gRdu/45zSU5Re7lLdFLFGy4AGD002eAs5z7bPyOLG9Zb1AnZmOnnEu3lLXCw6ansOBdNOUB3YagQsTO8/533uO24EyE7NbGCHgACGDT1XxAgjsQ6mZdUlZYwHJiAuDbTiz2gH/tiSBQ/cjq1V2za2oxOhAVSjZ7i2TZEQJS0BOHg7qRaRYFSB+Fbhj6NqiPNrcL8QpENMHdRHxZRpyAP+8gRucgzRR16QHQlKR+tPOrui3cWiCLmxlY9bmjiXFrMRtYtnr8FHDh55xfPW2eEYCaMNq58SW3w3wgNh2gb2Hwvzg/pvKrHRJc4l1LkYiDtRsdsmIsxtFA3kZFkMMqLVq5a1SpuP9ts/dpjfSzAEPOOCuIiA0c1eROiGcjnHLJN9uQ8edjecLySaaj1rlIzVBvi1PhkSmC87g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199024)(186009)(1800799009)(6486002)(6512007)(53546011)(86362001)(26005)(6506007)(38100700002)(4326008)(5660300002)(8676002)(2906002)(2616005)(31696002)(66946007)(41300700001)(36756003)(316002)(8936002)(54906003)(66556008)(6916009)(66476007)(478600001)(966005)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVUvcDQyV3RVd05ndk82NllkTno2SmhXTG14My8zWlU0dlpyQ05UeklLaWl5?=
 =?utf-8?B?aEw2ZkNBaktRSXp5TGxTYTdnRk9TRXJSeTRtT3k2b1VHejhFU0doVGQ4dnhr?=
 =?utf-8?B?SDZlK01CWnQ5MEdlQ0YzR0Q4ckQ5cUs0dVJLVmxreUV2WXpKKzBmZENEUmdt?=
 =?utf-8?B?MStxMGtZUkZIcS9xYmFJMEtRVDZSMUg4eUtDc0RQTHU5bjB4SHhZbXArTWUr?=
 =?utf-8?B?dzAyazVMMExxbmU2R3N3MGxzOFVpYjdDaERTc0x5VGE2TFY4K2ZTakdkNWZL?=
 =?utf-8?B?Z2MvaUNhRHN0dnpNNlMxVElSSUJqSTAvTGlrNkdTbVlQcTZJcDducXJvQTF1?=
 =?utf-8?B?NVdUK0dtZmxLTnhDeUNnMFVFVHJXVHVLUjluNCs5K3BDOTU1Z0xXYnBDWERM?=
 =?utf-8?B?T09NNkNkV05wWW94WjhiSWg3QUhmZCthTFJIU1hiMHpFNmxYSmc0czFHSHBT?=
 =?utf-8?B?cE94bGJ6MitLT2FabVZpT0dIRVljVVAwOHRVMGY1dlJ1REZSTndnZkJ5UUZV?=
 =?utf-8?B?MWJyRXU1b0NpQ0dUOW9wQy9PVEVDSWJmVWZmL3VTMFg0T0xyU3pBQTZVVDVY?=
 =?utf-8?B?c2Y4Wit6Y3ZoU2huNHpJZEZSbmVCeURvQW1YYzlJQTlOUGhCbGtnd0tTZ0xz?=
 =?utf-8?B?M0hURVdkVWFmeHZCRjRyT255dnZEcndPSkF1L09HeVZDWEt0SFFmWjUvL1A5?=
 =?utf-8?B?Z1RFUzRKcjM2RTY3WVdUcyswQzcvSVRibEdDL1B0ZkJ4Q0dmQW1jdEJDdXY4?=
 =?utf-8?B?N3VJS0tqZDZxVFkySXB0YVYxTEpFVkU2RU9sbitYRE13QXdtVFZGQmw2VGRl?=
 =?utf-8?B?MlM5WVo3eFBwNXhwLzVyN0NSOGpFSUUrWmFHd2VrZEFQeUVLeDJYV3hveTV3?=
 =?utf-8?B?aDQ4bzFsTk92Tkp6MkR4L0FYNWpnSyt3Z01kOVZXRlFvbk00Q0QvWHVnU0pR?=
 =?utf-8?B?eEF4cjI4RlUxeUxhckxDK01YS3VtUk9yWEtlTFByK1U0MUxaMmU0b0NicVZU?=
 =?utf-8?B?L1prMUNPNmpVR1h2bW1GVUhkZlc2T1l4ekRuQVVHczdPdlUxSldoMTRmSzdn?=
 =?utf-8?B?Rk1MWkc4RG1hYlhMUzI5NEhnaW5SbDQ3WjZTUEVQTTlhT3NoTGpRY0xzY211?=
 =?utf-8?B?Q3JpSnNOOTY5WkowL0dLVENDZzhxUnJvZjFYdkN1MTBtMUUxeDIzNWJrY1VO?=
 =?utf-8?B?OE1wdHlOYjMyZGl3LzEyeEFJc0ZoS3dFRXRoODRrREVBN2NOajQrcHVnbDRC?=
 =?utf-8?B?a3BOSUNRTE1xblBLZ1h3UUxRaW9JM1FiOHh6ckRLTWpnUnBKa3ZVcXRWWGVL?=
 =?utf-8?B?d1N6L1d4ZElhTit6ZEIxRWdIVDlFTUxTcU9yOUhDSjNZZHI3Y0p3bm5zVFhY?=
 =?utf-8?B?ZnhmQkREd2U0NFpyNnJxai9EcHFobnZmalZxTnFQejY5cVVVd3dxbHhCU2dy?=
 =?utf-8?B?TkxWVzlPVGdyK2JZNS9TVGtCaWxNL3ptS2NFQm4wb1UzSTMyWC93OGtNcTVt?=
 =?utf-8?B?RzJYKy96RGFLWXdkcVNUWEhGYWwzblgwSjk3Q0YrZVViMW01SjRTbHFCV3FH?=
 =?utf-8?B?ZGM2Q1BpdDNHTWdCcFBjN25qVCtBVWhEL0NkMlp1U1dzNjZzcHZSZDVzNlBj?=
 =?utf-8?B?d3V2SzRiTTk4aC8zeHZrRVFneXZoSkVjbFpGemVrQzMrWFBLYzczdThPQU1X?=
 =?utf-8?B?Y3VpS3EzOG1PcDVyMmhqUXlwTXdBK21CUVJaU2c2OTNKakJMQUNLbWRSVVNH?=
 =?utf-8?B?eUdkb2dqeUJHejlDdW5Zb3RINnk0eUw2VXg4UmMwNzhYNThObVpFamUwYUpE?=
 =?utf-8?B?dzdBMzM2SCs2amFKcU9kaTdtb1htVWIwdzc0L3RZdkRyT1hqQ1I4SjVVenFJ?=
 =?utf-8?B?OTdkdlFmVm8rTlMrSTFWZ0pjWEZnUXl2M0YvS1ZDK2VkSEZaSEdKakdnakVP?=
 =?utf-8?B?eWlOdUFJcFl5S0RGMkp5WTdkbUREa29lc0NubjNlUnBBcDQyT2Y2STRLazJN?=
 =?utf-8?B?MjB2b3JVMmk4aFUzTE5JWWk2UmVWSTZ0anQzbUdFNXJGd0hsZitVQ0RudFBS?=
 =?utf-8?B?dy9UN1Z1clMrUUNLaHVMcWNTdE1MdVA3NEhZMy9aZ3J6eFdRNkhicWFYRmpC?=
 =?utf-8?Q?JLDxZss2FxKbU+9lTcLkLqa3q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e71134b-653d-4882-3378-08dbb3690c96
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 08:19:56.8766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vlO/D68H2K1scjdmG0Ck+TlTancYqUgQQoVNOwYi6hE+0t6wbvrb/RIYIkiizyOjPqwxhrOFrSCTB4jEkm0TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9478

On 11.09.2023 19:51, Simon Gaiser wrote:
> Jan Beulich:
>> On 11.09.2023 12:12, Simon Gaiser wrote:
>>> Up to version 6.2 Errata B [2] the ACPI spec only defines
>>> ACPI_MADT_ENABLE as:
>>>
>>>     If zero, this processor is unusable, and the operating system
>>>     support will not attempt to use it.
>>>
>>> The bit that later will be ACPI_MADT_ONLINE_CAPABLE is reserved with
>>> "Must be zero".
>>>
>>> Version 6.3 [3] then adds ACPI_MADT_ONLINE_CAPABLE and changes the
>>> meaning of ACPI_MADT_ENABLE:
>>>
>>>     Enabled
>>>         If this bit is set the processor is ready for use. If this bit
>>>         is clear and the Online Capable bit is set, system hardware
>>>         supports enabling this processor during OS runtime. If this bit
>>>         is clear and the Online Capable bit is also clear, this
>>>         processor is unusable, and OSPM shall ignore the contents of the
>>>         Processor Local APIC Structure.
>>>
>>>     Online Capbable
>>>         The information conveyed by this bit depends on the value of the
>>>         Enabled bit. If the Enabled bit is set, this bit is reserved and
>>>         must be zero. Otherwise, if this this bit is set, system
>>>         hardware supports enabling this processor during OS runtime.
>>>
>>> So with conforming firmwares it should be safe to simply ignore the
>>> entry if !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE
>>>
>>> As a precaution against buggy firmwares this change, like Linux [4],
>>> ignores ACPI_MADT_ONLINE_CAPABLE completely if MADT revision < 5. Note
>>> that the MADT revision was already increased to 5 with spec version 6.2
>>> Errata A [1], so before introducing the online capable flag. But it
>>> wasn't changed for the new flag, so this is the best we can do here.
>>>
>>> For previous discussion see thread [5].
>>>
>>> Link: http://www.uefi.org/sites/default/files/resources/ACPI%206_2_A_Sept29.pdf # [1]
>>> Link: https://uefi.org/sites/default/files/resources/ACPI_6_2_B_final_Jan30.pdf # [2]
>>> Link: https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf # [3]
>>> Link: https://git.kernel.org/torvalds/c/e2869bd7af608c343988429ceb1c2fe99644a01f # [4]
>>> Link: https://lore.kernel.org/xen-devel/80bae614-052e-0f90-cf13-0e5e4ed1a5cd@invisiblethingslab.com/ # [5]
>>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>>
>> Just to avoid misunderstandings: This change addresses a comment from
>> Andrew. I does not attempt to address my feedback on the earlier change,
>> which - as indicated - I intend to revert (timeline extended until mid
>> of the week), unless by then my earlier comments are addressed or the
>> suggested possible alternative is carried out.
>>
>> I think it goes without saying that this patch can't sensibly go in
>> until the earlier one was properly settled upon. In particular, in case
>> of reverting aiui this patch won't even apply anymore.
> 
> It textually conflicts with the other patch [6], and obviously was
> triggered by that discussion, but addresses a slightly different aspect.
> The textual conflict is trivial to resolve. I wasn't sure if it also
> conflicts with the concern you raised there, see below.
> 
> The other patch is about ignoring entries with invalid APIC IDs. As the
> discussion there showed the spec isn't very clear on that and there are
> different opinions how they should be handled. Regarding the flags the
> spec is much more concrete although given the response above I assume
> you also interpret "is unusable" of the old version of the
> ACPI_MADT_ENABLE flag as such that Xen should still allocate resources
> for those processors?
> 
> If I understood your main concern with the other patch correctly you
> have seen firmwares that later update those invalid APIC IDs with valid
> ones. Do those firmwares make use of the online capable flag? (Given
> above response probably not)

Being an older ACPI version, they don't.

> If not, then it indeed doesn't address your concern, and I see no way,
> at least by parsing MADT, how to distinguish those cases from firmwares
> that have dummy entries (the motivation for these patches).

Right. And while this _may_ be kind of acceptable when accompanied by a
downgrade of CPU hotplug support status, I haven't seen any patch to this
effect up to now. Without such a downgrade, my review comments would need
addressing, to avoid a perceived regression. Same goes for the tightening
done in the patch here: It _may_ be kind of acceptable, but only under
that same condition.

Jan

