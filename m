Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3553976E3C4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576108.901877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRU9G-0003f0-E3; Thu, 03 Aug 2023 08:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576108.901877; Thu, 03 Aug 2023 08:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRU9G-0003bw-B5; Thu, 03 Aug 2023 08:57:34 +0000
Received: by outflank-mailman (input) for mailman id 576108;
 Thu, 03 Aug 2023 08:57:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRU9F-0003bq-5D
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:57:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c74ff36f-31db-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 10:57:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 08:57:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 08:57:28 +0000
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
X-Inumbo-ID: c74ff36f-31db-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8NE/dYkCE8kI5SFu7Q4AUn3lLRr7RfxezZk1qxugD3J4ZbEgi+/r/2r3KzKDKFu2OcD2zJXU1raESp6li8yzzsDw6Kkum/rU2dWVZnx7PT+3l9LPMCmxkmnrY5crHZqfcc3MmDjWHsNlAq4F3cCeVzj3AeyRIGZRTSVxxNMTUCltMCt0wL3uRH80TfRR0w6JX3+rkN+1BMFRoNEuWrVEnDeUNCl57CEcrXEKTy3Nw0XJn6trAdsnqroUkkzRdVLJdLOJIx639c/RLBDEciex/YBkAotQJibntEoa3pCUGNIKCrKdNn8AL2rQ3ng/l74kD4QaM5Mo/jfUh9xvfFUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RT9ryw0LZDBkectChClncy0rb3IV7pG2xjcg6yTcE10=;
 b=cTyTI6ZGBtg/KVQGR3LTFTkeuKTCuRSH6ArohsfTgqxLrsn1r1Y/6UKtIENH67NzuzvuG+/kf+3CzNOgxx/prXCrvzOteqCxV2QUW5yAO5Tjqsrr9KnjuJ1414Nz64hodgaRI53JurUTFAdaVOWBul/o9LWNudxDMm9cWw3pS6jcPO1VYMhejZ+TWswT1cgSXYWweXrip/KNCJoMgPGw8xQj7jemAGlskctXLn4lfzOyy6xvl2LUWRzUZxMDC2BsoGr+bryaO/u1p0OnKF74NEfP8JZuArjpCh6xttfP+uTSL1kbHYyHvJmZwhzYCSZiDx1VDBQOx9dW/zO1bAipKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RT9ryw0LZDBkectChClncy0rb3IV7pG2xjcg6yTcE10=;
 b=RvelaCQEPmHbGl/xh8kJ/GpGNTFrHMKMbMFj41nKEQYHFGx90ilYSJQYs+AuE6aS1VKcMYLhBDcjTkAL4cxnjwtwQX0u4Z9gAeYxX8fRz0hpwldIworkuKxrrXhzbvo4jWtZj2k8UZIV6JcrgjArfwypi1PhKNk3UXcpVDBMGMkShfTO0o3ZLfvpOxgYqZ6ZMg3L778i1ddy3bNO99Yx9jOpGfN8pqJj/DVJWw+zE+jrAP634wE9+Tauvi9rVGoe0RI+KLgzjV3Ph/FWlJYOgiOoHl0sI9yntRZQc7KV+YFujko9AmAZ5tVdFgFQ5HjrJABGu3h54WGwx+Myua8ePA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3af75576-4a34-ab0e-3c1a-20a143e993e8@suse.com>
Date: Thu, 3 Aug 2023 10:57:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 01/11] x86/efi: move variable declaration to address
 MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <aa72e3371fa4ab4806cd866c569718d766d3142e.1690985045.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021906530.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308021906530.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: bc00d21b-de8a-4913-c863-08db93ffa9e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lMJx3AhdgOfIEaVqpWEEb0zR3wDLENyV4DIsUhDTXrom7zqe/JpN+u6jqhYjYVzCMi8qOqIBFtZYKBwIGJX5Yd1pEr6cByCLdXVlEGQenZtYsMv8nQ3lZQ2bPOTtcP9KWSRto1YfLi5/LZkBjdJ+pdZPjhRzJZqPrqaN30S1H5/imyRjfVyYetXwNTbX+FHqg8UptpuMOrKadhBOMKicht4wAiXYIiN8g+W6Xf9SBxjcefIRu0yN5awYv9LRzNohST34GSN0zHjNyKDBNyruZkOqERYf5Ryo4ahtbxngJdZ+HbqBQOdhmdtBdHeQsVj57mdp16qEXjCHt8cHfvMGXwtsTA9GHhjKMHWcQSHafCB6lPUw9BQToQR8Y7WZL37au8/HnVFcH4CkMaZp+PY+cBsCPEqpHylqmmbrNRlJiqVMrOW4UfqMdotwvFRLRhBhBHvnH6kit626tIx2WW2bSrhfPWo7uZj+5RmhNzAR9z18WmBW0huqla/YRyLE6vF/vRX6u19HtvXlVKkNG3xP/6OaCy+qZMv8phfv9F2zdsOCtlOpQv/RaIYN8X/7H24A1HzkrfGoK6Lo01zI6rd+kmbSu0k+4pogUhVhDbX9h1GvIxiRu8I/IkHYIaBjbIB1LD+8XykTN+ZwC8GN4gjCjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(36756003)(31696002)(86362001)(31686004)(54906003)(478600001)(110136005)(38100700002)(2616005)(6506007)(186003)(26005)(83380400001)(53546011)(8676002)(8936002)(41300700001)(6512007)(6486002)(316002)(66476007)(66556008)(5660300002)(4326008)(7416002)(66946007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVFaOUhXT2R2WVdPSU9zNG1raHF4OXFEcDJ0b3l0U3ExUStHWnRoMTQweHJZ?=
 =?utf-8?B?aDdxNDFDRVVLdEtyUGJUSTV4ZFVzUzBUQUlZYTJHOGFKWnB3S1NraU0zSWQ2?=
 =?utf-8?B?Y1l1RlJlMVBKSHRBYjRBeml3WWJDVmx5SjNTMjFRaHE5VzBMcFNIYXJ0dnJp?=
 =?utf-8?B?aEtjMFFoRHc4bWlmSlVyN1l0RDJoWkpaRWl0dURTUVRmbWtsRnBDQ3FBb1p4?=
 =?utf-8?B?Q2pEV3pMS2l5MzBhOENZNDR6Y0xGR2V1Q3lXN1lyV2Rxeks0OU41bCtrazFJ?=
 =?utf-8?B?ZHF1V1ZmcTVrM2F5VFk4TXViSlByR3YxaDhQWEkxSWNFclF0N3lBV3hNMmhY?=
 =?utf-8?B?aHBtQ0xMS2V2M1M3QVB6SG1IM2hicDlnM2RVeDlmRHRHNVEzMFAxaGNCdDdz?=
 =?utf-8?B?UDhNc3J6dDYwTUtSUkZtSThuVURIRGRIRDFNVTBGcG1VOUJMMllBcEcvK3cv?=
 =?utf-8?B?c2tYTm5PU3c5cCtwTEJidTk4S1dlNStrb1kwVldHZG9oSnYxN1RSbTFUREhx?=
 =?utf-8?B?L0xUL2NrRDBxTmg3MDFnWXVTdER0MlFKRkN2bmxHejJETFN3MmRTd3dQMlRR?=
 =?utf-8?B?RU1adXBWaU16UUNOMmxrOTJINmdpVytNdjBPYWVlUkcySXZ4d0RlL2ZXWHI3?=
 =?utf-8?B?Nm9TODdLN1l0T21PTUV5Z29Pdll4S1RIb3YybmM3OGpDV0gzN0pDNjNGeXNz?=
 =?utf-8?B?dk1LQ0xuWUluWEk4SElhRzhsSlByRXZ4UjBJTlFUalIzYm5QczQ1a2FZaStC?=
 =?utf-8?B?VlpzZWZKS1UrK3oray9UV1BNWVpra0pzU0VvN081azR5eGVCSE8zNXpsYVc4?=
 =?utf-8?B?ektiWVAxb2FuQm53NS8wdHJCdHp2QTFSWDBnVVJRRUM4cW5TZUNsTWFLMjNZ?=
 =?utf-8?B?VFEwc1ZScmFCc0xIK0dsekNZUTU0Ty9kRFBwbVU2a3NWN0IwaVdsUVF1eDBh?=
 =?utf-8?B?Sno4RTEwZHYyVks2R1gzUmtBZmJjaUMvNFNkR212Y2dOYWRNMlZrSjJIS2sr?=
 =?utf-8?B?TFBnRzZoaldjdVNtcG50aE1ieStmcXF4M2hDeWtSZEZXRDNyUmFxdlM3V0c5?=
 =?utf-8?B?T3BXTFRKQ3hlMi8vL2l4V1AyYklDY0hEcmRsQWRqdUNobXNLc0xNWW9DR2lL?=
 =?utf-8?B?bDRobkkrOWZxd0JaNVNVMjFVeHAwTiszOG5vZ3g3RzE3ZnEvUXM2dXg3Nndu?=
 =?utf-8?B?OVNMQ3kvUDFEU2tWcjVIQjhYVUtDeENIK0dLQnlidE15OGh5L3p3UE5YK0Nj?=
 =?utf-8?B?QzhNOEVSbUUyTGIwbnhkMlVoQ2lwbVZ3TDZXanBvWDVTZ0g0Zlh6MGZtTUZK?=
 =?utf-8?B?Z0YvSmhWS3RkK3ora3BmUm9TZnN2NDl4R0tyMTFFeDZnRm84RXZiM3hqMEZq?=
 =?utf-8?B?RzZjbTZwbDBrOXhTWXZjTklpcmxuWWZDMTczenRtYmptamhsMFJlSmtvTkQ4?=
 =?utf-8?B?dTJqSUlSdlVYRGpaS25nYldrYWgxbHFxLzBuMUxqaFFlUnF1cEI2ejJROE5l?=
 =?utf-8?B?R2REcGxNSG1ScERCSVBLUktrZ2JXN3NhdXVZeTAvUlBNOWFRRnJMdmFJRk43?=
 =?utf-8?B?YXNPRXhZU2Myd1drNk9XUDZwdW91ejBaUkFhZ21SZnJHVjVjbDI2cUVXUmlq?=
 =?utf-8?B?VkNRZTRjaDdqdjhiZ0NVd3kwUG10aVlKS1BVMkNGTkxYelFZTlhFN1dYb01T?=
 =?utf-8?B?Y2gzYVJOeTBiK2IvNGVlRkI2a2lMOFBDaEpzQXFsVW15bWFybXB6YitnYmRJ?=
 =?utf-8?B?WUlzekJqL21oOVpLRVFBelo0N201SlR0RFk4RkdJdlFBYkRjUXpHNVQ5QnpB?=
 =?utf-8?B?RzFJRmpXWVRJN0JWMUxyK1RoMU9JclE2aUZCL3RiNnZKSVpqdDZ3eEFyc2Fz?=
 =?utf-8?B?Qy9hUTVWRG45c3lPR1J2VmU4QjE0VksxVWoyVXZockxJNytzM01kaVVFUE1X?=
 =?utf-8?B?WDFJOEs5T0JzakxmNjdoN2NGWGhVemE2YzBKOWFPMFg4UEdSbjBKY1VyUzhu?=
 =?utf-8?B?eE4rUDlDQW4vaVBZL3hLSWhpUVNUcVBhUjgxaEM2SnVyM0RhcmFxcitSU1Rq?=
 =?utf-8?B?N0F5U0gwR0JkNHVqM3ZGdkVkSTZBSkVGaU4zK0doVk9NQmhIRGU5SWE0d1pv?=
 =?utf-8?Q?KHMrnoDZNmkaOZVUpE+LTAg/I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc00d21b-de8a-4913-c863-08db93ffa9e2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 08:57:28.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4G5k8rFqLH/osLL8c6JiULqdNEaUIxGzLV97Jbh+ram1yYWWdLdVWY9a7DDAvybS0HwNJxwAdcplTjTlrTvEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8825

On 03.08.2023 04:08, Stefano Stabellini wrote:
> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
>> The variable declaration is moved where it's actually used, rather
>> than being declared in the switch before any clause, thus being
>> classified as unreachable code.
>>
>> No functional changes.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/arch/x86/efi/efi-boot.h | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
>> index 92f4cfe8bd..b00441b1a2 100644
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -390,8 +390,6 @@ static void __init efi_arch_edd(void)
>>          {
>>              switch ( DevicePathType(devp.DevPath) )
>>              {
>> -                const u8 *p;
>> -
>>              case ACPI_DEVICE_PATH:
>>                  if ( state != root || boot_edd_info_nr > EDD_INFO_MAX )
>>                      break;
>> @@ -463,7 +461,8 @@ static void __init efi_arch_edd(void)
>>                  params->device_path_info_length =
>>                      sizeof(struct edd_device_params) -
>>                      offsetof(struct edd_device_params, key);
>> -                for ( p = (const u8 *)&params->key; p < &params->checksum; ++p )
>> +                for ( const u8 *p = (const u8 *)&params->key;
>> +                      p < &params->checksum; ++p )
> 
> In Xen we don't mix declaration and code. So the following is not
> something we use:
> 
>   for (int i = 0; i < 10; i++)

You're aware that we gained a couple of such uses already? I also think
that when we discussed this we said this style could be at least
okay-ish (until formalized in ./CODING_STYLE).

What I'm unhappy with here is the retaining of u8, when it could easily
become uint8_t at this occasion.

Jan

