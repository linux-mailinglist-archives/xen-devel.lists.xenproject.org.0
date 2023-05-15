Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6616C702F61
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 16:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534764.832097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyYyE-0004hR-N9; Mon, 15 May 2023 14:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534764.832097; Mon, 15 May 2023 14:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyYyE-0004eV-KP; Mon, 15 May 2023 14:14:38 +0000
Received: by outflank-mailman (input) for mailman id 534764;
 Mon, 15 May 2023 14:14:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyYyD-0004eP-N0
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 14:14:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d22f49ba-f32a-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 16:14:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9101.eurprd04.prod.outlook.com (2603:10a6:150:20::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 14:14:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 14:14:33 +0000
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
X-Inumbo-ID: d22f49ba-f32a-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkAHW3h0Vc9mNWWt1U5GjGBOEpSchaO75BBi6lNW8SAuvBUTgEZBydL9RK/iTt0G/B38+S8l8rJRvFxyHlY7vtqwdlgGSqYxyu5FPT8d2YcCT1rJG0SjcdJayvqTrTcHxnDEhdOCCqqCP2vV24Jm3vNPoghbmlPPzrm6KawpwgmYHZLVx2nOn+sg7SzduqvaNUgfSMuotEwpDsNnUXoeC21WKCiklZot5HiBFlbh/0P/xg355jpt8BeZ0HHI72Fsse5RL2dXCmsJvo70P8VG51fMoclazff4BcFU6wzIQ/YArZ7jR12Id+3U/VZxxkQm+bGQyB4ep2tuDNFqLZ4w2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHnVB35JtcM912OMMxay/u6Y/5S8hm7gNAIw+GrofE8=;
 b=NIYVyfo0bh1tVNHsDvUXQ/HDuJyIVpQUfy5bYeHjB4j6xSHh3tc5zRcYITiBWVCZ2LEWV4sk8snQVs3M3Daf85Zl6oJ2D/ZOhRo3fgJa+Eki3/zazCY+dfUVgsiWc0kv6z8NMDJdRZkVqZPEAta2wNpS1TRMTphjWi0n3mAMzJafVJ+6hCDiv1D9se7f9GwtueMk5EF/wuOnyQOboVtlNmSHFi6cjdBb9buvyiiJ3cVT7HYQBmcaiXC5KWtKvNugpgeWyr5QMsOnaNv22AA5gkFxunYKqxgg9o5C64S3WSdz5fG2rB6+/Y1IAJD1NC9LyQ3N1ccZUASOL6MHGppbyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHnVB35JtcM912OMMxay/u6Y/5S8hm7gNAIw+GrofE8=;
 b=DQl+sBOPSa4Zql0gIM/EHBgY+K+kkEagQwol40o76B4UZX1ndr2FgtWpNpevLwgaj2GRSeut82mEPN0ikbnrPtVfnfY/gnrMcH+F06zKjfEFT+Lwld7DoutKcGUPtAJwcIggYITRucO0VNeUnsQWGM6TXUfy6Z+HHuqjp6rDVF9j8LiKytIieh9KNoxyGvKyb2B+K3JM4OhxLO5vM4wik36U0HtdphgVK+i5XX3eaT48VUyLCh2BVVa1E5BS83QRXmsPBhOU4pBBA113U9vPAjI4y8+Hvth8e2HzYx8kJC8a4PDGMfAzJIaEha5vtr7n7ab/Oycm5F8MJmKMZxvKgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com>
Date: Mon, 15 May 2023 16:14:30 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZGHx9Mk3UGPdli1h@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: 4378200d-7fdf-406d-6ac5-08db554eb47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VkLrTEPCsTXbdp1cJsofcSY2cG8LeAWFYxKiXwBrZuvcyW6Mx7L2f6aDHqODQ9TirNidqcFk/ZJsDqwrXmWrqR89+t0yzf+czubpoW8FOt8DmI5phITJC3azaysJOP4d9XX+5lCCaE07oJbKjD+rS360IcMHkR4rXYLmqWo6n/8I7VGmuMnXOEHzmkCVtgknxq4XFSytLSU1XAX5WaD7+BKQj0jsrUHYaLumQN7F1lCUMtBMM7DtuRXiXWJfquOJsVG4NpoRoIK1rFo07etmw1CfpAWpaR83ZuePI/KFUkVSEzx3wG/BVBxoB6DyynF34u2P6QLbsfZDZpuIp3N9qIUHw1WFpe7ieirzLxqsKkhd8UaFhaMYASUeMNJKTovu6EcFAg8MYogMjB1Wott4rmImxlFkWdUskJG7nUsgWCOu/a6UY4g8EWvE612WlT67H1bApUw3n+Tvi5uQQ/W6YOBhQzNRl5/OtftJKq5YlBHRdEZOh0B1iYFIWW4r9YtmzusKsEIrtEhoiiKTFWfqt7DyzYJMwVSKfGTC1vKF/U1FRNbnZkEnp5+tOjqTDTwpyti4MozGVsHBifNvQ4T73ay3/CIwZ7/DVBJVVXUwNgaU5KDsjhit354IT7YsjgXZqYUVOpsUcTNXfncvEzLVPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(2906002)(38100700002)(316002)(41300700001)(5660300002)(8936002)(8676002)(36756003)(31696002)(86362001)(478600001)(53546011)(6512007)(6506007)(26005)(186003)(6486002)(31686004)(2616005)(66946007)(110136005)(66556008)(66476007)(83380400001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjUrczlJZGRhN2FLQWd0ZjZBeVV0SGhFYWIvYVd5RHVWVjQ5NGU2cVZIckZU?=
 =?utf-8?B?QUZqVFJrZkhPT25idEZNdUNsNndtcjFJaTlaOGUyVEp6MnhuaTM1RzNnK0p2?=
 =?utf-8?B?dkVGRVdWUjhzMXZwOEJOK3NVbFp5T2RseTNoUW85UDhGTk5wSTZwU2hZMzFN?=
 =?utf-8?B?KzlhMm83dW1wUkRBV2RoczVTY2J2Z0Jaa3ZMOWJ4dklnZWU4N3JRU0ZWOEFU?=
 =?utf-8?B?M3IxNGYvNzVFY3A5WExuWDBmMHVBYWNLSS9YOWhvQ0k5OGx2V2ZzelIrdlY5?=
 =?utf-8?B?YW1pNGI5VXNpb05rOFg1NUlGUy9KZklUblhxTldTbUVpR0FwMGo3Ym4yZ25T?=
 =?utf-8?B?MWgzcFdzMmtiQXgvTWo2dytRSW9hRi9YS08xVEx6U0tGdTl2Rng1dXhpQnpr?=
 =?utf-8?B?SHZqclF6QUs1MHdMVjdhQUtwRVdGUmZ2bTV0TEt0bXlvbGx4UmJNeGR3UVZM?=
 =?utf-8?B?NitRbU80dUZJc3RhaGlmbERqVm1sMHBvQkJ6aitOenJOeGdUZTRDeXNjbHBY?=
 =?utf-8?B?cExpMzcrckVNdnZ6a0VaR1NzSU5NS21MZFFuNTZJZjhRQlFyTDZaRVMwaE82?=
 =?utf-8?B?aXFOMEVnQjRudjZFM0x1dVJnM25ucHRwSmZkNEF1YnNjcTBMZG83SjlHYUhk?=
 =?utf-8?B?YitmL0tzNUx6UFZzc3QrYXN5OWhoTUt1ZDhKZWlBcVVhUFhHSG1TVVdZNHZ5?=
 =?utf-8?B?Q3FGZmE0MHNWMm9KUjR5amlIc2FSTExZUGVLRHZrOCtSZ2lUeGI1QlFsWXJD?=
 =?utf-8?B?RGRvWHpFeEFxS1ZwdlVDR3Zqc0wxRUxmbXl3Tk9Dc0crbGRuSGJkcU9SS2hT?=
 =?utf-8?B?MTlaK0RwZFQ5RjhHanpzK2hBTUlSbnBmL0YxQlRsU0E0Q0wyc1M1N1JmL1FX?=
 =?utf-8?B?ZlNwZHVXWnF1ZUQ4eG16czlQTWR3ZmR0YU5FU3ZrbkZUSnkwNERac29VUmFn?=
 =?utf-8?B?M2M3ZW91OFYrL2xINVhoWTZTWTdBd2JvenRrK3lRbXM4S3ZCdW8zeXFnTHZp?=
 =?utf-8?B?NktvZmhyV2wybk1SUjhMejhMbXk3WGFrYXdKNlZOS0hwM3FKVFhFRzJrbno2?=
 =?utf-8?B?TURrV2ptd3czTWxXZjdJRXRrU1FCaGpTTTYxQWNCb0RiQW9qLzYrckcwMDZq?=
 =?utf-8?B?U0R0M1hOc21RRDcxZFlWanpXcVB3RnlvSjJsc2R5S3pUSkJQUjNIakNDS0lx?=
 =?utf-8?B?QkJ5alVRbnN0TEt2VWUvVUlQTVdyY2syRkRnQXk2TmhFWE81dlVPUkRwL2c0?=
 =?utf-8?B?RWpObi8rS2hYM0ZIcHNJREs2bTFMR1ZIMVcxMWkvMmpqTUtIS1R5VXBHTnNV?=
 =?utf-8?B?UTVrdTU1bmVwczJrRHkvZHVlaTVBYnVlVmxTYkJPM09ERWMrLzh5dU4vZXQr?=
 =?utf-8?B?VmtFdm44WFpTMm9FU0FUL2tzK2NCR2trZElJTWhwK1E4cjRuLzBSOFE3TVVo?=
 =?utf-8?B?cktwZmVkRkZ4QUxaUmR3UlBnQVVoN3JHSmFNSUw5bTFURmlCd0dSdzZINGJI?=
 =?utf-8?B?TnI0NHdEb1NqQVNOUE55UlNoVDRmS0JwQU0zM1lITjQweHRGMG1ENGhEZjJC?=
 =?utf-8?B?RFk3bElyWW5MVFRHWmh1UlhQQkFoR0haZ3poeDcxNEp3b3BBWitkaVEvYldt?=
 =?utf-8?B?ejliOFh5ZmNLNy9VOFZHOUpoOEd2UGRqck9xUXlsV3ZZby9OTGJTRmNualpr?=
 =?utf-8?B?L09FNllIS3JXVjM1bW1peWtXUHR3c2N6TmNFdmU4TjhqQzBCOGd5Q1o0YnlY?=
 =?utf-8?B?TjhUMGNaWG9uM3hleDVrQ3NZTlpMeHJKZFp3eHhMRTVKckNhaWNiWEVIN3ZO?=
 =?utf-8?B?QWh2VDhKcTFaOG95VStaR0NTb043WkZOZHdnR0kvNUFVVTlnZ2M4ODROWG5r?=
 =?utf-8?B?L1VSTlJTdzVRSDlKdjRWcHJiZ0dvUHhFUzcxVGNUbUdiOVQ3cnhSc0p1ZmEz?=
 =?utf-8?B?V3FxSzFWMDVwaXdlQVlhRXpOV3c1cG9qVit5UVFFQzJKT2lDcFg3Z1VvUHFt?=
 =?utf-8?B?cXI0REFaRUtXSGNrc3FBVjdCRGRVbmtCUVVHSXhKS1EwVld0QnpzaU5CRS9L?=
 =?utf-8?B?MHBib3FCYXJNbFJHMmZDVjhxcVVLTkhnaTJ1NlY4OC9mK1plZ2NMU2FIZ3N5?=
 =?utf-8?Q?oZGvD7wHBv2R342QtIIN1OgPW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4378200d-7fdf-406d-6ac5-08db554eb47e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 14:14:32.8969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEWvRQGBJtzq6f0zwRZfncjYvWaxQPwrb5wrUIIgxmKF/dlGYwI/46Cpag7sxGNhlJUXKJzWKtEAWomG74QTvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9101

On 15.05.2023 10:48, Roger Pau Monné wrote:
> On Fri, May 12, 2023 at 06:17:19PM -0700, Stefano Stabellini wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> Xen always generates a XSDT table even if the firmware provided a RSDT
>> table. Instead of copying the XSDT header from the firmware table (that
>> might be missing), generate the XSDT header from a preset.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>  xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
>>  1 file changed, 9 insertions(+), 23 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>> index 307edc6a8c..5fde769863 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>>                                        paddr_t *addr)
>>  {
>>      struct acpi_table_xsdt *xsdt;
>> -    struct acpi_table_header *table;
>> -    struct acpi_table_rsdp *rsdp;
>>      const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
>>      unsigned long size = sizeof(*xsdt);
>>      unsigned int i, j, num_tables = 0;
>> -    paddr_t xsdt_paddr;
>>      int rc;
>> +    struct acpi_table_header header = {
>> +        .signature    = "XSDT",
>> +        .length       = sizeof(struct acpi_table_header),
>> +        .revision     = 0x1,
>> +        .oem_id       = "Xen",
>> +        .oem_table_id = "HVM",
> 
> I think this is wrong, as according to the spec the OEM Table ID must
> match the OEM Table ID in the FADT.
> 
> We likely want to copy the OEM ID and OEM Table ID from the RSDP, and
> possibly also the other OEM related fields.
> 
> Alternatively we might want to copy and use the RSDT on systems that
> lack an XSDT, or even just copy the header from the RSDT into Xen's
> crafted XSDT, since the format of the RSDP and the XSDT headers are
> exactly the same (the difference is in the size of the description
> headers that come after).

I guess I'd prefer that last variant. ACPI specifically says "Platforms
provide the RSDT to enable compatibility with ACPI 1.0 operating
systems." IOW any halfway modern system (including qemu, that is) ought
to supply an XSDT anyway.

Jan

