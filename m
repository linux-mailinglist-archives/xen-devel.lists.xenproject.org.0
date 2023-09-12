Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679A379CA5D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 10:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600111.935709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfyxs-0006EB-De; Tue, 12 Sep 2023 08:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600111.935709; Tue, 12 Sep 2023 08:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfyxs-0006Bo-9W; Tue, 12 Sep 2023 08:41:44 +0000
Received: by outflank-mailman (input) for mailman id 600111;
 Tue, 12 Sep 2023 08:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfyxq-0006Bi-KY
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 08:41:42 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31aa445e-5148-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 10:41:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 08:41:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 08:41:38 +0000
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
X-Inumbo-ID: 31aa445e-5148-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY16JQ2XzAj0JaYoK4gB8MCqJthwRsePW1NrOcRTFaHGRHKJM7dY/K3OqGVnlIJ+wUhp3GmTXZe2zNyRybSC3GDedmLaL4Cw1hnw+SzYiVyTdjwkI8Snvxce9DNATOdx4w2ns0eyseid+6iu0Bllbvs9PH00bKIYOp2/+fvHUki2Ekg6/TUe/orXQGvSsOhZnKph0dSCm2nQAjQe3+VAm6KnsaN3Wm4rHORJfmf3d9RjhpDhwjAzke524DXUOTiLzAFrpH2dfq05dF/1guBmb9xZAbC2GC0nrsXx7InMDdN/jCgsaqgL7e9d0Yd4F2bc6GArP72OEUL1JDtkKUHC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBA2HB3LErKFfGJU+4/38H/W44ymcmlhqexfCYDooFY=;
 b=oJ49hmkMcH9wXkarfIZoXYCHaFXAvxtfuI3L65DltbOsmRdZBZ68Zpa1zGRbJjYV6YFaC1QKU8JSlsHrxS8fRCdDHRcDWwoeqKD2K86CfbZPqDLRsZ+XyfvK2mvFh67LuRGqDsvBelYEURf0/iXI+SknlmuiHokLyjaGEVtel8KcB//esVC2D3a7YCZHDblBND0Q0PGVXcaCtWNZGgcOwko0j1DR4pojV9eAajxTc0s3kBTgRErtVcih5BPSv011rWgvkZQtbJGB4A6FNa0HpRdUiVIhqy6+ptX61EMb5Fga6Ivjn0xiusRKk0bXkXkN4fYhhOWqFjiIjiVCOQutAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBA2HB3LErKFfGJU+4/38H/W44ymcmlhqexfCYDooFY=;
 b=v4FkiPAtf95BR6OEAH+CSHN/UM5LkaPmLuCnBDKBYwCPlPMzHBhMPeKk51PAFhpkVqGJV339WvkNDmrpbfSAr+th+ve280yd/GHVL9AmCm2YhLhXClgFUb01WwEV6RZbybl2d/S/fzjrJmrC7pgDQ9hZr+0hROlACfhUEhtQ6/dieFg5TPnX6DutM3MpLYGZkAFYH2aKHkVEWPz5o/lRZ328gNmLn12Qqqa7oXzqk/5Oau+DEVOlkwuITE01P3Y/92YDJXB2inyEZDmxpWiKYOZNEIBb9oqleeWClWvMTtF8AWtferpsPu+JmWc3UsigLjUks/GCUdZz2WrjW7MaRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f780d40e-c828-c57a-b19c-16ee15c1454a@suse.com>
Date: Tue, 12 Sep 2023 10:41:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
 <89f112fd-70c6-c191-ea52-e2caa6495ac6@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <89f112fd-70c6-c191-ea52-e2caa6495ac6@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: 816594ba-44db-470c-e021-08dbb36c14a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n2OD5VjnLpyN3YLQ+sfFyS0rr3WhbeDJCD159+X9q0NWmhVNAEwFB2klmf6yFk3Vn/VaPgxG/IrdvgxrQqF/PnWfiqPthwXjkGsSYpPXgBFFKfdvEofXVf3aN83o41CYvCct8SDpjN/lMiP6xMGvoork5Wf9VJe+43lXEUOykrxIm4tuls5pjyv5CfOBdhaw2bHacPxpotNPYUYSZMeJ52ryQ3iO2lTFg21WEbxzkjhbVuBHeBpE7J09JgQNwgal43gKPBZYCVDY1yj3rqfvcDX18OW029B/cqoQL/16Fd9+SnP0/oibpaT4sSPfDDewvQJDyt6G+iuKxnui6w/37CxO0X19WYfouqmWdeTipM+zNtQdJ1iBlJP9F5JccMh4lwQt/cgRAT5w95GxFXyui1/FiXNSHqtZqs5eiZxr+9H2hoslKlDFxl+1sMJlnIANmNSpPHS70g1SCDqYw6RqmcPNqJf4HKealoSo+UyvBPM6y/rnDpqjOllWJyUU0vj2xDFOeJug1rgS0zGDZyuGYbl+LZiPQf4EkWNRl8d9LhYvuBZwUP5dpSsoZKEjjplHqM9461Uq9N1jg8jVBiQVeGd3wwVoJnqyvpnf0W/LJKwd8cuElo3zpod1YmEpozhshpb4e4f8IG4UqqRNa3fTEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(186009)(451199024)(1800799009)(31686004)(53546011)(6486002)(6506007)(86362001)(38100700002)(31696002)(36756003)(2616005)(2906002)(966005)(6512007)(26005)(478600001)(83380400001)(4326008)(5660300002)(110136005)(316002)(8676002)(8936002)(41300700001)(66476007)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGJkNU01S1NFcm9MN0pEeFJOZ1V5cjd1R3B2UEwrSko0dVQxeG1FWG9YTDM2?=
 =?utf-8?B?VXlFb2VabFFXV0Q5enVKU0xjWG1oOGhxby94Y1BoZUVWUmFtcEswQVBjVi81?=
 =?utf-8?B?cEh2amx0MERpR2drNnBoWU1vYWRpWHBVKzhydnRBa3hkbU1vNkpxZFVkZ3gr?=
 =?utf-8?B?MisvZjFtay9lZzFraTlIWkVnQk1MWXdod09kUVpueFhsNmZtUGRicnhDWDJT?=
 =?utf-8?B?eW1kY2dhK0x2WnVJSEFYYXM2Vy9XYzJDSzdwTytYdW5EYlcrWUpYcStlbFRk?=
 =?utf-8?B?KzZsSEpIS1Y1aUsyR2RlM1FjRERsOWV3cTcxWHZ1MlBMRWlmNm5NRTdGWW9p?=
 =?utf-8?B?NFA0eWRhbndGMitVcnE5T1dUKzhFNDd1NmVDd2dTS0V5SG5TUEk0cC9ka3hE?=
 =?utf-8?B?Vk54ejc1UCtIZ2VxeWlsbS9TVm0yTm9FWXBzdjVtazNLeTNYZ056YW50UXVZ?=
 =?utf-8?B?SU1QTVBvcHgzS3VEMnhBN0JZUGpUTnlER0dMZWROUHdsYXBlRlh6OWNFaU5E?=
 =?utf-8?B?dkd6ejBnbHoxNFBRR0k3Q3JsWHZvMS8yYVR4cnAyREg5enMvWER1d3FBU25k?=
 =?utf-8?B?VVV5SFpjN01ZSyswSmVIeW5JcmVhWWlUVnVsRUJCWFp0bUZ6UDhuWU5UQzYw?=
 =?utf-8?B?NVA2NWpCNXdiMVFPQlZUYjQrVmtKcFdhODJ5QUlaNlg5YzA3Zm1VRDROTFNr?=
 =?utf-8?B?NDl6RldmS2JYc1d3clU5ZmE0anZZR1lZK2p1NmY0ZUlrQlpITVhWc0Z6RUNV?=
 =?utf-8?B?Mld2M1Z0dW5yUS9BS0FlWFlXWURMYURVUUI5UWhJQnFKV3FScFpqK0FIb0pN?=
 =?utf-8?B?em13MFJPQVF6WmVWNjBSU3FOTnhRSmVMZ0dLSnduT0pGTXVZM3V2eXYxdEp6?=
 =?utf-8?B?ZTVSMGZZelJhM25PWldTbkFmdDdGM1UySzdSdkwwa0JuU0J0eHVJZVl2dlR3?=
 =?utf-8?B?QjRkd0xRZjBZcmJFZC9pMENYbVQzblUrcVcxVVhNWE9vb2FnOEwzckxWNWNz?=
 =?utf-8?B?T0FUMHQ4Qk5mUXJ3c3FmWW1JVGg4WkhiTlpoRzdxVTNpamszdy9qLytGVEoy?=
 =?utf-8?B?cFg3RSswRW5mM1BLWmQ2Qmt6d1JjdnlMSDhpbjFrb1ZlUERrMTRGenFScjlK?=
 =?utf-8?B?dUREcW5POHFKQ2tZK21kSXFZRXlzQjQ4ZUJIUFdnR0hreENvdE1mNi9HdHRq?=
 =?utf-8?B?SVY2R0xnQkhObSs0ZVBRMnl4VzkyWEJvZmFYL1JyMVJLYVRLSG5jb3ZOb0NI?=
 =?utf-8?B?c3ZRSVBzUmxZN2Q0VS92U2d1RDl6ZTJjaTVTdGt3c2tjdGZUNjFsUjF1WFhS?=
 =?utf-8?B?REFHS1hJVC9LSTlnZlFUdHk5cXVrTVpvVHNmRjhGNC96WTl0TG5lK0ViMVho?=
 =?utf-8?B?ZXEwRm14a0tGUU1RdXNqRlB3NlUzc0p0SkxILzhoc0laaXNYYnY4L1VSVis5?=
 =?utf-8?B?TCs5VndYbTViNWZuMWkwOTZOb0pMWENZUnRwS0ZBdlJYa3R4d2xnN1o2bEx3?=
 =?utf-8?B?NTdjUElDeEtKR0pteTlSWWlsVkhlclFxamtOT1BZOHpieTY1aDg4MXBUUWh0?=
 =?utf-8?B?SFBPTStKNlZoSGttSFl6TVcwZmdma2JtL0M1bW1Sblpmdk5tRUlKSzNHTk9U?=
 =?utf-8?B?cUE1SVYxeThkUHQ0N0pRSEtLMnV1MlordU9uZ2IxcFg2MWswcWVTZXp2eTVM?=
 =?utf-8?B?N0hKZjJNeXFrVnFTODJVVGtNMjUzam5aejA4M3hrajRYOUtEaTVQREU4bHgz?=
 =?utf-8?B?NzRrVVFVOTh6eTNkT2Q1ZGRSVEs4NGgrZU5WTVFiSnZXYUcrRjlDQ0hJZlI0?=
 =?utf-8?B?MEI4MHhHOThhbitUY0JWbEFEcjh6TDdFWFptQ1ArRWhMNUJxbEZQWDhLTkF2?=
 =?utf-8?B?NlI1NlNvTU1PSjB4dFdZVk5ia2JGNXdkdzNPLzRhTEU3SmVlV00yemR2c01k?=
 =?utf-8?B?MUx0djA3bEZXa1dOMWxLNUF6cjNWQ3QvbmpTS1J6UWk2OUxZc09rTHhtNmFO?=
 =?utf-8?B?RlN4SXIvb2dDQS9QVXAwMk9zSFBsZGhGalpzMW92MXJGZ3hVa09EOERKUFR5?=
 =?utf-8?B?QW01NFB4cUxrcnRoYlI2K0ZZekR2ZnZIMEZtWmNnRW9zeHA3c0dEYTl0ZG1l?=
 =?utf-8?Q?D+9p3D6wnTWdXn7ZfJpnWc5de?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816594ba-44db-470c-e021-08dbb36c14a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 08:41:38.8764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEfvHSztAh998YCd9sYdWN3E/UH58wHN7ciMSwHYLLYFqrDAjBTtAO7KYw44O/f5Ste+YYAT6HEol3E3tGV1ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7055

On 11.09.2023 20:05, Simon Gaiser wrote:
> Jan Beulich:
>> On 07.08.2023 11:38, Simon Gaiser wrote:
>>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>> 0xff. Linux already has code to handle those cases both in
>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>> same check to Xen.
>>>
>>> Note that on some older (2nd gen Core i) laptop of mine I also saw dummy
>>> entries with a valid APIC ID. Linux would still ignore those because
>>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
>>> this check is only active for madt_revision >= 5. But since this version
>>> check seems to be intentionally I leave that alone.
>>>
>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
>>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>>
>> This patch was committed with unaddressed review comments. The normal action
>> in such a case would be to revert, expecting a v2 to arrive. One alternative
>> here would be a timely incremental patch submission. Another alternative,
>> considering in particular Thomas's most recent reply, would be to properly
>> downgrade CPU hotplug support in SUPPORT.md (with a corresponding entry in
>> CHANGELOG.md).
>>
>> I'll give it until the end of next week for either of the alternatives to be
>> carried out. If nothing appears by then, I'll assume I may rightfully revert.
>> (This timeline also allows putting this topic on the Community Call agenda,
>> should anyone think this is necessary.)
> 
> To avoid misunderstandings, since you mentioned the above in your
> response to the related patch I submitted today [3]:
> 
> My understanding is that your main concern is that those entries with
> invalid APIC IDs shouldn't be ignored, since some firmwares later update
> them with valid IDs (on hotplug). This fully conflicts with the
> intention of the patch. Resolving the disagreement that followed is
> outside of my control, as being only the submitter of the patch.

Why would that be outside of your control? Your change broke a feature
officially stated as supported. Now that there is a patch to downgrade
support, that aspect will be resolved as soon as that patch gets ack-ed
and committed.

> You also commented about not logging the ignored entries. Until it's
> clear if the change in general is accepted in the end, I considered it
> pointless to address that detail. If you disagree and want a follow up
> for that, just let me know.

I take a different perspective here: The patch shouldn't have been
committed without this aspect addressed, either verbally or by sending
a v2. I continue to think that an incremental change is warranted to
make sure logging of entries, at least with "cpuinfo" in use, remains
consistent with what we had before. Otherwise debugging of possible
issues becomes yet more difficult.

Jan

