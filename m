Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA3C7048C5
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 11:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535077.832676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyqkH-000085-Uq; Tue, 16 May 2023 09:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535077.832676; Tue, 16 May 2023 09:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyqkH-00005P-Rq; Tue, 16 May 2023 09:13:25 +0000
Received: by outflank-mailman (input) for mailman id 535077;
 Tue, 16 May 2023 09:13:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyqkG-00005J-7x
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 09:13:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7b2f663-f3c9-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 11:13:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8925.eurprd04.prod.outlook.com (2603:10a6:102:20c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 09:13:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 09:13:19 +0000
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
X-Inumbo-ID: e7b2f663-f3c9-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpsVJDsbC++Tf8PSbRlecHOhvLkqmLLEiuQDHgxHlCttYartm7RFSH97hA1aQB/xNWCAQ9JCu6Kb5Vg6LQykqoVXMatQX6TTFdXRf9hE8tm5fo8W5pydX5tVGcNkR3NXRg9m7MMnK/0+JN6Mj2aO4LxT0wrB1RN1UU6FXzlIf+m7RY97pk43ZGHpAhBTQ2SpDwSXyjRH2u+U+QYAQV0LRbnJRisD3sZiqeg76u8OEWh4YzBbgLtHGG+TEkrTOg6iQNkIDie9wOWWJGr6v6UdNir/2AGSMcOGhL4oK3gRBXM7sZgnLs0ySKlBlrZSlZvYf0K8VMRPpWpKTlNnioD0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ML7NNYnIEVvp9wboHB3nARQtK27CnZkjSArpdibskKQ=;
 b=iMqWK+y2j5XPfavqr/marj7uOuMNl4NH0jzFIf4L/jVVWUjJEvs7UzlK+7JYWSBtfn/O/rm2sZA5AV1Cy2iPBjmVrzk/4CrIoO9RbwNZWa6ZHAWdQpWhGOHbUOLOFjZL0UgnUyFeew/kx+tbc6u2xHJkbENtAvxCNAsci9jixaOFgRnfeZq1oyPPAri2awiXxffPErHVgLJN4bm5ZZ68yjg7MJFszdRkkj3FTeJ79zAY6r9iOer8L4ty25XmrOMZrdEamkUG41OKaB3r1lBKOKGoqnhMIC0t9ng6X2xhSFIt6ozL9WH72lgvt1noCCm2a2uBLQSOrWbvrJxH7Yw7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML7NNYnIEVvp9wboHB3nARQtK27CnZkjSArpdibskKQ=;
 b=3TyvC+xD/ywd3vsbs45CPkjTuNe9qAG7Wec+pA7jRMc5aJFeFHoM/aV8pR07snZJhpp+kYOOheuT412+r9hYX4qM9G848YdTpqYRQG/4CAjy/995jaQu9Jx1/Lof6R0OyJnhFA5dZYVQl3/ZVnSuy0XO1YH7H+voCdgXnIo0g7wCY9U1YJzoSTBa4D/JqeeGjxfLvARiFKStm1cYUCJpGCfuDk5MaSkFHUIV2uywZtWd7tyc0d9ausEQ5SqXTFU0n4kWaRLcTww8asE+Tg+SVW4qFCpwn8+SWWevXiiR3v4ks797mzGS+Lu3BijqG/2wiKUUjNAPDjdmnM3XY7V5hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb550850-4cf7-5bb6-d84f-633be1ce3bac@suse.com>
Date: Tue, 16 May 2023 11:13:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT
 generation
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 Xenia.Ragiadakou@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-1-sstabellini@kernel.org>
 <ZGHx9Mk3UGPdli1h@Air-de-Roger>
 <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com>
 <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
 <ZGM6X19p50oSqbNB@Air-de-Roger> <ZGM9vzwGm7Jv6i7M@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZGM9vzwGm7Jv6i7M@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: e555bcd3-e7b8-4c77-b54f-08db55edca5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wPdeFcqsZsTxvmOEqu9BlMh3zw/eKS0tlVGOWnGF7lqMq8VNxWhS3p8v2MR2MhgSWyh5sIclZlTObXXQ6CF1fjC/xGFUUw+/FMM23xmBAyfMRr4BIj4i02tae1S1o8dyr1A5CjJesI0V4GPn8d48LKVQlPcA3nKboGAQFsb+2bhUxcz8viADxoYW+KXTGlwKml717yafnSH4dHuzTMsqGntoMSMQXbD6SREPAVjYNgAcAMvAsDZDe7FTzE8xUxLXyy0O0kqgPcGurQGmwysu+Se5R0D9N3X6YAXpYmWH89+rXe9dzAU+51FhzwqekxS2n9aR/gQmohovdAM/LnTjYXI66ZgwLbiqTu0WawVA6OvavEenLjkHi6cIvnVtaSXRAXb7N6H1awoPvH78Gt8+2eQr0tPzYC6zek/qjsYhbZGMVZiKEEbQfTxxiBB0JQOGjS5I2+jFcdV6YtotgfM1a5ngLO6GNtKwdhBWu/uGX02AmmKFYAs4CTmydytf4XfmA6JJip54PNmPCBOOeJIWoHMV/qn1NjZlpPRnGXoN8qFFE03ntItmkbUfOqHxwv6XebxaYacPl6ai81lToneTb6uC0qG9tnC2jrRY83byNBzOBS2ZEFOr9PMChA4f5mvOj2oETJsWdqhDFRlvQiJA1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(38100700002)(2616005)(186003)(26005)(83380400001)(53546011)(2906002)(6506007)(8936002)(41300700001)(5660300002)(8676002)(6512007)(36756003)(66946007)(31696002)(478600001)(66476007)(110136005)(6486002)(86362001)(66556008)(4326008)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU5DS3J0WlJRc3JBOFQ3WmxCdXlhd2ZWeFFRQXBBd0d4UnM0MHlleDVHMmty?=
 =?utf-8?B?QWZoazVOSVp4TjRncklDMkd4WWY3TnVxRTduTUVmZm1FbTRsdDRMMHlLT25H?=
 =?utf-8?B?cktSbFdXY2JJNE01Zm5qanA1NnZkemFzYVdVNjh2cjQzSG1UTUFKWU1lbzFD?=
 =?utf-8?B?cWw0K3gxei95VmI5UjlqR3ZuakU1TXFuQks1eml1c0RXKzJSNFhhQmdGK29Y?=
 =?utf-8?B?b0NxRnV1eDBSRFlYSGVjVHBzNzkrSGFxaEE5bzJCM3dSS1ZsdDhGOGlUMlo1?=
 =?utf-8?B?MkIxNUFNMERkREYzQ3ZENmlvdmROK3h4ZHFnbEJQd0Q0UU5uWXlVSE1XZFJS?=
 =?utf-8?B?aGpzcC8zYUpraCtzSFE4WFRjUUdkWW92OFJZdDRFcHFtbXZaMXBGS0xmMEZw?=
 =?utf-8?B?MjNNSGorUm1ZdXpETE1ILzlLQzNqR0R2V2hXc21RREN3ampqc0lLcUVBYUVy?=
 =?utf-8?B?U1ViMmlXR2VaWUgxOTYxbTBMM253QlJZRVBiekZRRnZVaXBWekpDZm10Rjhs?=
 =?utf-8?B?WUVaTU52WllZcHFDRmJ5MUpJUjRPbkpQeHIxL044Zkg3RlZuWitOcnQxd1RJ?=
 =?utf-8?B?MVVScVBrU3puclBRV1lWTmx2VnpDTm43dUdaaTcwUEkvNTc4b2Jxak94aE5W?=
 =?utf-8?B?VmhXYmxwYm9TNVQyRG13VnRQODBvdXJMYVBBb1lCQVFPWGw4anRZWk1iTnc2?=
 =?utf-8?B?K2NMaXdGd2NiM0d4Z1JGWjBHakM1STdpWjJrcHJMNVBIZmE0Ny9SaUU2ZHI2?=
 =?utf-8?B?dm44cGtybmo5UHZSU0prR0ZHNjRGaW1JbUtTNHh6R0NkcWlIQ0ZBT1JoLy95?=
 =?utf-8?B?NVV6d3RMeC9Dbk5XdklqUlpPVXJrUUJwQklUdHltdGdYQlY4c0pjS1FoeVZE?=
 =?utf-8?B?Wmo1MG9qV0hkdWtFbm4zZWtPK2dJUHdFL3RBb2JCSDF1UkhWNUdaT3Z1eklo?=
 =?utf-8?B?Wjl2MEEvZmZmcG8ralp3U1BlS2prQzZOZlRYWGN5cndTc3E4MjNoNG0ydVpi?=
 =?utf-8?B?a3FnbGFsZ25wNlRKUmJodUpENFhZVnNwMFdoRTl5NUNmMDB6TERyVk1rSkpl?=
 =?utf-8?B?N3NXSlVvcjFlRzNqODB1YmlxYldPaUhIS1VSbDlwRGhsc1dhdjRQcTZQU3lE?=
 =?utf-8?B?dE51UUcvK0lKR2ZhYTl3TXFxbFp2M3REQjkyZ1lmWm5uNzM2WTR4YjhFNVll?=
 =?utf-8?B?V0R2cDU1UzhhOUtjUU1UQVNMMENOWjVPVm1veFZNYXZqaCt6bC9pUTN2N1NG?=
 =?utf-8?B?OVY5UERUeWdCdEsyaU9qSzVaUisxeDBEekZTSElhMjJpemUrTHUvVy9VMWJS?=
 =?utf-8?B?Tis2Yk5nd2NQTW9oOWtFckYyclUyZzFJMmE2TUx5MHF4Q1ZjNEN0WUdiK21l?=
 =?utf-8?B?V0VJSkxyUitYSVpiZHk1Y01VQ29HY3pZY0tCa2NpOG5HQk9qb3UzRDErSGpX?=
 =?utf-8?B?SnRnMmlIWDJLc25qbGtNQmVtRGZsZ1pEOWtTbjJobXVWZkVlOFZLbDlpSW9P?=
 =?utf-8?B?OEJzK0MyMHRyRm9QeFZ5ODg1UmVZN2FqZ3F5cllnL3ZENUxGeUE1cjVReUxz?=
 =?utf-8?B?b0pROCtMNWVJNWNpc2NaWGloNWZCTWpGYlRTWTJzWDNwZEFvVUgwN2JBb05t?=
 =?utf-8?B?RngySzlILzQyMElUazdnL0JCdjZxaHhmaDdQZjVVcisyRGZwZzZ5dG85NmpE?=
 =?utf-8?B?RlJobisxSVN4dUNrTDNYNEVQS0lsTS9TOWw0M1g0YlZaUjkyQmF2ZE5mTDRU?=
 =?utf-8?B?UmhTOS9ocTZPaFVCUlFseEJEalFPYjVkelJsRnp3WnBzOGs0V0pSTlFEemNZ?=
 =?utf-8?B?MlIxcnNWUkhLbnpkYzBpT3AzUFRHYjhWV2ZYSUI4Mk1YVFBPOW9aSmQ4dkVu?=
 =?utf-8?B?dWFTSXZibndPbW1vbVRGcUJHYWRZM1hlVGNOcCsyeEVQV1JEZmt6eFFJeEFL?=
 =?utf-8?B?VlBSNW1PRFlIRkwzODNUOTY4dlRHQnd0NG0yV1ZFVk54NWNtbDErb2xHd0NC?=
 =?utf-8?B?MHlVRy8yQmJKQmJVbW9Jc1pkZGdzYnRNcVBEMlNIYjRTR0REM2tKVHN3Vzgv?=
 =?utf-8?B?RjFpS0QvMlVUVVdDSi9xV3pnbklyUVphTGVvT3E3RGp1eUVZYlFKRzdLRWFa?=
 =?utf-8?Q?0KYfck21UVR0Lgnk7uggkaEUf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e555bcd3-e7b8-4c77-b54f-08db55edca5c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 09:13:19.6599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tf3VlUVkZI+3EE4HCTFEsTnM+wLBqqUyAagETvognbbFR2IDffuOH+tfjX0Uw8TgUfe+5v4tFOEiBXIeVqNZiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8925

On 16.05.2023 10:24, Roger Pau Monné wrote:
> On Tue, May 16, 2023 at 10:10:07AM +0200, Roger Pau Monné wrote:
>> On Mon, May 15, 2023 at 05:16:27PM -0700, Stefano Stabellini wrote:
>>> On Mon, 15 May 2023, Jan Beulich wrote:
>>>> On 15.05.2023 10:48, Roger Pau Monné wrote:
>>>>> On Fri, May 12, 2023 at 06:17:19PM -0700, Stefano Stabellini wrote:
>>>>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>>
>>>>>> Xen always generates a XSDT table even if the firmware provided a RSDT
>>>>>> table. Instead of copying the XSDT header from the firmware table (that
>>>>>> might be missing), generate the XSDT header from a preset.
>>>>>>
>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>> ---
>>>>>>  xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
>>>>>>  1 file changed, 9 insertions(+), 23 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>>>>>> index 307edc6a8c..5fde769863 100644
>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>> @@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>>>>>>                                        paddr_t *addr)
>>>>>>  {
>>>>>>      struct acpi_table_xsdt *xsdt;
>>>>>> -    struct acpi_table_header *table;
>>>>>> -    struct acpi_table_rsdp *rsdp;
>>>>>>      const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
>>>>>>      unsigned long size = sizeof(*xsdt);
>>>>>>      unsigned int i, j, num_tables = 0;
>>>>>> -    paddr_t xsdt_paddr;
>>>>>>      int rc;
>>>>>> +    struct acpi_table_header header = {
>>>>>> +        .signature    = "XSDT",
>>>>>> +        .length       = sizeof(struct acpi_table_header),
>>>>>> +        .revision     = 0x1,
>>>>>> +        .oem_id       = "Xen",
>>>>>> +        .oem_table_id = "HVM",
>>>>>
>>>>> I think this is wrong, as according to the spec the OEM Table ID must
>>>>> match the OEM Table ID in the FADT.
>>>>>
>>>>> We likely want to copy the OEM ID and OEM Table ID from the RSDP, and
>>>>> possibly also the other OEM related fields.
>>>>>
>>>>> Alternatively we might want to copy and use the RSDT on systems that
>>>>> lack an XSDT, or even just copy the header from the RSDT into Xen's
>>>>> crafted XSDT, since the format of the RSDP and the XSDT headers are
>>>>> exactly the same (the difference is in the size of the description
>>>>> headers that come after).
>>>>
>>>> I guess I'd prefer that last variant.
>>>
>>> I tried this approach (together with the second patch for necessity) and
>>> it worked.
>>>
>>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>>> index fd2cbf68bc..11d6d1bc23 100644
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -967,6 +967,10 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>>>          goto out;
>>>      }
>>>      xsdt_paddr = rsdp->xsdt_physical_address;
>>> +    if ( !xsdt_paddr )
>>> +    {
>>> +        xsdt_paddr = rsdp->rsdt_physical_address;
>>> +    }
>>>      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
>>>      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
>>>      if ( !table )
>>
>> To be slightly more consistent, could you use:
>>
>> /*
>>  * Note the header is the same for both RSDT and XSDT, so it's fine to
>>  * copy the native RSDT header to the Xen crafted XSDT if no native
>>  * XSDT is available.
>>  */
>> if (rsdp->revision > 1 && rsdp->xsdt_physical_address)
>>     sdt_paddr = rsdp->xsdt_physical_address;
>> else
>>     sdt_paddr = rsdp->rsdt_physical_address;
>>
>> It was an oversight of mine to not check for the RSDP revision, as
>> RSDP < 2 will never have an XSDT.  Also add:
>>
>> Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')
> 
> Just realized this will require some more work so that the guest
> (dom0) provided RSDP is at least revision 2.  You will need to adjust
> the field and recalculate the checksum if needed.

We could also mandate ACPI version >= 2 for PVH Dom0.

Jan

