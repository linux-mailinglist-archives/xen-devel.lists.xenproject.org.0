Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D487CF050
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 08:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618899.963173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMnD-00067X-E2; Thu, 19 Oct 2023 06:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618899.963173; Thu, 19 Oct 2023 06:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMnD-00065C-BF; Thu, 19 Oct 2023 06:46:03 +0000
Received: by outflank-mailman (input) for mailman id 618899;
 Thu, 19 Oct 2023 06:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtMnC-000650-6z
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 06:46:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29b1e086-6e4b-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 08:46:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9178.eurprd04.prod.outlook.com (2603:10a6:10:2f5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 06:45:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 06:45:58 +0000
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
X-Inumbo-ID: 29b1e086-6e4b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgxJOC4W1/9/PQVzOjffI5Y0iYAbeOAFsyugegNcVYrANc2kSfhhiJ6hKqvu2hnjEwHMJyqN3zr3zMnZmv99Ex8/pHqfgbiqlhuFz4GLmQkJEns9pNIppbTiltWTAjpOz/7ofYvnto8UXzlehL98l5HsupHfkzRdiAX+QkeRp8Vc4yh2ATdbCeVROsv80BkV8dGj42ZucJ/pB7q3reXiit8bQYtPYWBta142DoenJP1/OPfDRe2qVnv54C6OrPxtZ3GVHGobWLfBxnX9K4s1RqyzgyxVhh9Y49cmGBVRdNhB80T/CC0lT770O1SH41DjjLYTByP/+aObINIDEJ499Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGxyZhtmVl/sCWm/OqAtrZJ9AnUyWarl1V3WAOY+BUY=;
 b=TYKMXk70KCS/lg1Aw89cUD7P6k5fWlhDh3au+B6oeNyddATolgWhYNo/jgvE99bytDOoq2mBzSQQX5TttoacafO5Ng9c01sgnSUiCvbZ9N88H+6ULghMWNb9oxLNuHclFvIycJXj8TQNEs7QJuyKs/2jUSCP/6PZcF1igMk9hClwyX+RG+zExmqUb+tiEkSNTHaf6KTNuc553dcPTmejotX5ulNzNB0WVYHU+hzGyKPJ9TNI5hLXlsFhCqkgNQsPmyAq/mRP/EJElVkYNzjqX6nQjAAvP4rZRP7Sz/z6Dz8GNefa9aCn9LR+Mbika3U4VZzZg/tHSjcZpzjF+mEYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGxyZhtmVl/sCWm/OqAtrZJ9AnUyWarl1V3WAOY+BUY=;
 b=gcIct5EYbuoxLrhfs+x9hEajvkeib+uXzmMfffE26JGDFD1eiGcGOTusnt8JcnAdRIpHsR3VBfoep/SI+7Wlm+x9owPvWtLstUHCBk1B6KhZa11K3g0/efNA0f5hc8yvdzbEjgfHjX/M2z1uux9he/QeNpifzunQ9xBx2r3aa1J4m4U54ycU/Llbb3fAKPNKPTjJTiEmKzd8GyJBBagfKu5I/LqrBvBmm0e+FGKRDjhyWrWhq7XSOSe5Lfn7MJVV03tNq/kUnQ3tHxJxQ9nI3p5ycl3vCa52W6LjDQa3qG6xH72OFftToDDowRJPg5IIlk3Z+r7cQKPSgqj1to/wRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1567a9f8-9b3d-2285-4d60-fcbd3dfad0c4@suse.com>
Date: Thu, 19 Oct 2023 08:45:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 v3] x86/pvh: fix identity mapping of low 1MB
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231017082907.14455-1-roger.pau@citrix.com>
 <f1ef0a3d-fbca-51ad-f282-fe3b9d49414b@suse.com> <ZTAEBxMjHAHdlfS3@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTAEBxMjHAHdlfS3@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: 3737cdc9-292c-4ecf-013e-08dbd06f0cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kMXzl/aK4t9GtPU3/ZuAg0DnPN/pVFjOSfAwfZMFLzfQWxMM6nhIuGGYtDY2G7NoHFr4MwLrdHe+plXuThdaQONmeuMEuQyqpteop9JqUtSbsBqoBj82+CwxmVWwyRNpeaA9f+CdqjDe9UQZa3Y8nQC7OKQRt5U/WwIAZFTp/CNVIhjuWHSzPM9rtsXgwTLJiyFDV6eBTzq1ismRzdw6lWE5H9HjjqeZfPpY1f5nK+9WGjJmrpfBufuKC3sOwK/WyF3DsJ4TspDhVGy+upclxZgzfk0s38PVd/+DiZxPO6FZaU067x0ntYJHvgRD0vpQ+lShg2QxtmXccfa3eO1GM4vT1u8s4riSJ7fFDc6lL83CNAg9ZH/jY0XgieLFP5zjAnvIrkgumwU4R+cYQN/H1xg4MWVSdiNrbQmQDs9mE+PX6Ef7ntfQ3ivPTfgAvDlePpqGzn0hhFeRKVpkOjXkF5BW8HtM5mB8eJ/8P+Amc+WvUqYHPIgyAHz3gZbihQV5IDE0ZwD2iUhA2sFpYSZb6x9ei0esYlwTIUqs3UHmocHsfV0iy1+mXc/wWFIXGJvnfxNKTUQvWmqGg3TLf3G1TZAINgOo5D81n7kUoXENvx766Wd/q+BS6wV91xb3bK91IML52i1Y9jE72z12UcVjtw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(36756003)(31686004)(54906003)(66476007)(6916009)(316002)(66946007)(66556008)(86362001)(31696002)(38100700002)(53546011)(83380400001)(26005)(2616005)(6512007)(6666004)(6506007)(2906002)(8936002)(478600001)(6486002)(41300700001)(4326008)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFlaR2FodVphNXd3V0U2N3pwa3oyNVo5UFlHU3puaWJaMHdHN3JKR1NNaDVZ?=
 =?utf-8?B?OVZnalF6N0xSZzErTlRwbjRiTys1UzVKUGdVNTU0em0rQzVGczdrWjFqcUtr?=
 =?utf-8?B?RDBZdGY4YTlHaUQrQzN3N0hZZmRXbzRicklEaGFLekkrV0JPVWpsdnhRY0JD?=
 =?utf-8?B?OWloRVdhM0NtbzRzOU05RDd6M0g3b2FHK3BCMCtZc1lwODdmMUdaQlR2VlFp?=
 =?utf-8?B?VlNyYW80cTFrQWdwZ013Y2RrN1kwT0xYVStzODBCRHAzT3psZkNiZ3BwcWVT?=
 =?utf-8?B?Zk5BQS9YaUxVL2tjMm15UDJqc0IxR3ZuZExMT2cyQmt1YWhsU1ZDNHhGeUZP?=
 =?utf-8?B?UzZQc0ZGSmI1MGdpZ0hENC9NTzZVaHpDT2xGbm5BNWJpUk5UQXhzZkx5NUNZ?=
 =?utf-8?B?bm9UMG5CVm12Wk1MbzExSXhHdE8vbU1qS3RCWWx5NTgwTlovTU4rYWpwMFFI?=
 =?utf-8?B?V1hMMnRBNU5VaklMWXUzL1MwTHZaUzUwKzNLZ0h4RUNaaVJmV1VBYlFmNnNx?=
 =?utf-8?B?VDRJV1J5MlU2M2F1Wkc5cWtJZlVIWTdzTDZnNUZIMEN1SEpoMnIxVkZ1ZW9D?=
 =?utf-8?B?L21qUTNxUk1uVkhTKyt6eE1TZzNoMDlzUCtHZWRsK1I0SVdiN3N3c2hRMVpK?=
 =?utf-8?B?YjhCU25tZEFTUVI5QnBoU2RPTFNKMXZRL2RUV1JIZWdRYzhnTWtmc1EyUUZC?=
 =?utf-8?B?KzhBbGhHM3ZIbFdJV3VTZEVnVyt6anZqV0Z1MFlwYklmWmhuVWpVWU9CMUdX?=
 =?utf-8?B?bGZJb0czcFVaYnpDdEJxQ0ltczBMM3ZId3dMTTVISHhiYTBNdG5SMzBSZk94?=
 =?utf-8?B?UlJZdC9KajhkT0paRzF6RkEwQ3RYTHpEZU1aZ3FBNURlZVRpQnNsZStpWFlB?=
 =?utf-8?B?VS8waEZsMUhJNXNBUDVValBEL3FKN1VlZE5YYWExNTJ0T3Z4SDQ2bjllbU5K?=
 =?utf-8?B?bE95WUtJUlhnOEhsZm9iMFFDM00xYnVIQ3Eyc0ZyTXRRSFphUk44dUxPU090?=
 =?utf-8?B?RVNLdkF0NE1rTU9IZ0tHajdSaFpTYzVEZ0FkRnVPb2YrcS9tNnhFT2tudnVI?=
 =?utf-8?B?S05wSHhRcis3cXZOMXROdHFIdEF6QU1MVU1tMGZnT2wyQ2lqbG0rQnVYY3lZ?=
 =?utf-8?B?c1FydDVsNFdGZVhhUm5aR1lVRm9HMjFYaHBRMi9HYm9MUkxmRHk2bkRtS08y?=
 =?utf-8?B?ZFNIb1U3RzRlZzlXOFo1VWIrbnRVbVl5QnA4Mk5CYVlyNGZRTE5zVkRUWmZH?=
 =?utf-8?B?TTdNUXR0WjZsdDVhSkhGek5vN0VaZ1djdEJ4b2RXL0NjQTZNSlh5TG53TDZq?=
 =?utf-8?B?QjBjQmdKWXY2VGhKYW1YK2JGRzJyR29sb1JXeUk2Qk0vNjNwbTMyMlF1UzRD?=
 =?utf-8?B?S2NkQU9qOWNEQUo3T0pETGtzNkdWbGczNDJ0S214RjdjdTZDU00wYUtualZk?=
 =?utf-8?B?RUhxK0lZUTdJdlEwTWdoajl2WkNKZlR4V3o3c3dqN3M4L1V6MHhlZmpSNVIr?=
 =?utf-8?B?WTc4ZFZvUTdRMk1OV0wyMkgxSFZxSWFJN1Y4bWJ2Uyt5clY4VEducmNJcnNv?=
 =?utf-8?B?b0VMTVZRMVJhQjY2cTR5cVJTblE4TU4yRGs4ellreHpCZHVWb1BCUEZpZ3Bq?=
 =?utf-8?B?UXpYVFVxdjNWWTFPZG55YUdMcmx6NVdZN1pQQ2UzbXlGVnVDWjZwcGdRQ3VO?=
 =?utf-8?B?V05HN2xNVGRCVE5EdEJZRUVIU0M4QnhJVmJtaTlmbEFPSWkzSUIzME9TQ3dL?=
 =?utf-8?B?b2NjeUkyeVdSUldrbDg3Tzd2RDV5RkJ4Q2huTGRVQktDOU43bDFHNmdEbHZB?=
 =?utf-8?B?V1QrMDVzSGc1SzBuNHRzalZmWnRMMEcwZXBDRlNrWGZNVVVEWmZaOFNmZTJW?=
 =?utf-8?B?T3hla1U1dXUwMmtWcndEaGlKeU4rd3MvLzVJWEFyMERDSFB0dHg5SzNvbnVB?=
 =?utf-8?B?L0grUS9oS0M3cHNWbTV6N1ArSXdQZVIrTldyVm53djU1OEgrbEcrQTRacEoy?=
 =?utf-8?B?eEtVT0JNemFtQlZpYU1HMzEvTG1TN0dvbGI1R2wyY1d6RjhLQWlOMnJYMFh5?=
 =?utf-8?B?US9NcXpnd3ltRExlUWUySDJLVkJGU2xoc0hGbVpmQnFPL3ozb0Q2Y2RrTTNX?=
 =?utf-8?Q?RsF032YJAOxxbuIcYLctvYvOG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3737cdc9-292c-4ecf-013e-08dbd06f0cd0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 06:45:57.9563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JrY4W6UXOssF4uNKd4AtwQixSiG/B1nZrPhQMO82s8hUJIpS0xH4nsCAetAFlsrH4aJlca+2kQticJEZboiXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9178

On 18.10.2023 18:12, Roger Pau Monné wrote:
> On Wed, Oct 18, 2023 at 05:11:58PM +0200, Jan Beulich wrote:
>> On 17.10.2023 10:29, Roger Pau Monne wrote:
>>> The mapping of memory regions below the 1MB mark was all done by the PVH dom0
>>> builder code, causing the region to be avoided by the arch specific IOMMU
>>> hardware domain initialization code.  That lead to the IOMMU being enabled
>>> without reserved regions in the low 1MB identity mapped in the p2m for PVH
>>> hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
>>> describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
>>> faults until the p2m is populated by the PVH dom0 builder:
>>>
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
>>>
>>> Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
>>> Opteron(tm) Processor 3350 HE).
>>>
>>> Rely on the IOMMU arch init code to create any identity mappings for reserved
>>> regions in the low 1MB range (like it already does for reserved regions
>>> elsewhere), and leave the mapping of any holes to be performed by the dom0
>>> builder code.
>>>
>>> Fixes: 6b4f6a31ace1 ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with one suggestion:
>>
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -449,7 +449,7 @@ static int __init pvh_populate_p2m(struct domain *d)
>>>          }
>>>      }
>>>  
>>> -    /* Non-RAM regions of space below 1MB get identity mapped. */
>>> +    /* Identity map everything below 1MB that's not already mapped. */
>>>      for ( i = rc = 0; i < MB1_PAGES; ++i )
>>>      {
>>>          p2m_type_t p2mt;
>>> @@ -459,8 +459,8 @@ static int __init pvh_populate_p2m(struct domain *d)
>>>              rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K);
>>>          else
>>>              /*
>>> -             * If the p2m entry is already set it must belong to a RMRR and
>>> -             * already be identity mapped, or be a RAM region.
>>> +             * If the p2m entry is already set it must belong to a RMRR/IVMD or
>>> +             * reserved region and be identity mapped, or else be a RAM region.
>>>               */
>>>              ASSERT(p2mt == p2m_ram_rw || mfn_eq(mfn, _mfn(i)));
>>
>> Would you mind wording the comment slightly differently, e.g.
>>
>> "If the p2m entry is already set it must belong to a reserved region
>>  (e.g. RMRR/IVMD) and be identity mapped, or else be a RAM region."
>>
>> This is because such RMRR/IVMD regions are required to be in reserved
>> ranges anyway.
> 
> IIRC there's an option to provide extra RMRR/IVMD regions on the
> command line, and those are not required to be on reserved regions?

On AMD we force-reserve such regions, and I think it is a mistake that
we don't on VT-d.

> Otherwise LGTM, so would you mind adjusting at commit?

Sure.

Jan

