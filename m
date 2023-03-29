Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4C56CD942
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 14:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516250.800071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUnW-0001Ht-QN; Wed, 29 Mar 2023 12:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516250.800071; Wed, 29 Mar 2023 12:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUnW-0001Fp-Mn; Wed, 29 Mar 2023 12:21:02 +0000
Received: by outflank-mailman (input) for mailman id 516250;
 Wed, 29 Mar 2023 12:21:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phUnV-0001Fh-DW
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 12:21:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7d00::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a07b784-ce2c-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 14:21:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9940.eurprd04.prod.outlook.com (2603:10a6:10:4c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Wed, 29 Mar
 2023 12:20:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 12:20:57 +0000
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
X-Inumbo-ID: 2a07b784-ce2c-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh559brhhcbviKZK8gEQoSbeS4hng0RWQU7/AW5TtjynERSk3hU2Zim6NkyCAdk04PIpntdG7t2tI+eszzOeqS4GKZ8HQBlqFFnhNQr4NAgLIang3I53GEIb6ZdNCGAPy13DftGtQApQ1PI8zRR3JQ2vzdNHsuClyotfjj6b20L6+kbTbKmW3CdGm1voUeYAAqdVVjVFZoUeNTzSGK16hP3INJaLzN7sFpeJCwjHffTn61vzGnA93TkZqdJMmceGS41ALyi3yXakIAFJ2h0P2S+fNzlB3ioDC4dHTl3LoqZyFYr2Y5f9r6IhyQp2HvAHzZXj8UZemhVT0mr9Q1jN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRbQe96ngt7JAwoH3/zxEPzhlOJ9PsMfTDPEbysMuUE=;
 b=HoVNthqrge7vqXPLkLGZdHloMvJEoL2OiKnjbsuCCkNsg3xuiloPOXaNkdSK/h76umWN0Dpo4vVxDDz1Hy/equTGezw5CGWV5D4LemR77KzC7EFPtSTa9zkLL4NdZNlGmP1YWCEwjbtFnTux0E7F0ZUO+EzveDV+pazONJ0nys3IU3DmP3eYjyS2fbmbUoLLYGR1Cw4FYnGYIRdtxZu0lvBYKt8Kww9GcoEkqcI+z5S7EWI4Ll6bcOnlNb5CkO9EyOA3t41KEPIfKNzK7WkhEgUczeKzZL947xMcVmW21baT+Cl8fIehxeReKPVhrilxdv6nsiBZjIaPFOfE5GLHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRbQe96ngt7JAwoH3/zxEPzhlOJ9PsMfTDPEbysMuUE=;
 b=CzxWiC23uUcqN4qWZ5z22osotgYSR/KcVwZ7mkQjI/c18guiKss0akXN39Ma6lZSx9Nz0xXwht83DbG6EEwUiCxvYEzHraZqv8iLqaBsn8ha+nHfepExnLZdI6u6INvUUlrWEkFwyEvFE945cCFf4t5jHNId4IyQLcbhb0wKWSL9n7i0LryGv1EtZ73ql8PWewhnl3W5fMhqfdbNYvMu3xxHSV7FyEcXYiGX0FyUldkDtrGlAIspP95QWsI3VZvkUYYb+s5R30dfoOVQElxdVL6ZOVYFyjbY0VBwRaLkUCxZ6K56iR+rCu65R6e9WfrUryt0UKVsDmycIe9XyShRcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f4ec693-d3f5-d1d9-03fb-1a5918bae0b3@suse.com>
Date: Wed, 29 Mar 2023 14:20:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <cover.1679934166.git.oleksii.kurochko@gmail.com>
 <93da6ba381604748e2c71e2ebd35e80798ec4bb2.1679934166.git.oleksii.kurochko@gmail.com>
 <0a16b79e-8292-6947-24d4-dd027113943f@suse.com>
 <fa074729-ccf7-cf2a-b8df-6c77ae3117f1@xen.org>
 <66b64c69fdc1404d9ade4be97c4a184715e4c967.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <66b64c69fdc1404d9ade4be97c4a184715e4c967.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fec1a7f-3e17-4447-1932-08db30500cee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	65cDqIt/GKGZsRZTDhevjQ09tzdU5/UG1FTsmaN2brPj70s35ilnC5S+O403pCVR4uJJILh2NGh1UAzZB6Ic0SOIpsJMPrSvnG130ZO0gVRFV438r+82SoWFBCjrCFYms1P3BwPzTlkj38dxiO99Ou/zCPSMGLbJsl6cqTxptuWzM+Re9heRREU8v358ngrJpVoM/rbcV4gX/G+8QP6OnIXZ1BhspMCvrZgxoIDBkFvEdxDk8r92d24Ba53pr9H9IRogjcOsiP5/V0MX9iqylZEKRy3akrMOilSrh6yU2IrSvbE12810vY8Z4jr5yFo6+kjG3aybir8UmfTgN/5nOsOBWVuVJgmFDZZ8YFyByenx3BDq7x4npF7KjrJGOBIc56326w/SDDL166+CwmIGvjVicNAZ/yuN+ouvW8tpjk+xrAyRuQi/XZNVeJbQsxCosUyW3unTY8oJtt6NVYvn3dSUILPYseDPLCNnpvFk4dprfDxs0HN6XFYhl/GDAWaaUG9GHEbqC+SYO8AUZ8SYsRIjAwUizmIi5UvF1WYwLg9vvj8YUPHwhP5FXfw9xegHS/KgsfVK3WCVxLS76PN9t8t+21nI7vphshOOdbJ6VS6iFaztrOFpEIyrv8n+gTXnkaWb9a4i2+4B5on6F8Rv6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(86362001)(36756003)(31696002)(38100700002)(2906002)(31686004)(478600001)(83380400001)(6486002)(26005)(54906003)(2616005)(4326008)(6506007)(6512007)(6916009)(316002)(66476007)(41300700001)(8676002)(186003)(66556008)(53546011)(66946007)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWY2Y3plWFZWbklaNEs0NFZBZGU1RjRBekRIYkVmeXV3NVpoeVJTMUFqamxU?=
 =?utf-8?B?UncxeUVPdW55SWp1NTFPNm1jNG9SSzhhVExQbWVyaWxkUG95UXFjSFh5YVFy?=
 =?utf-8?B?WHRza0FTVi9XclA4Q0FsWkFNZGQwM1BsTnhWdWU0NmUxaW1SUVJZd0hzZURD?=
 =?utf-8?B?L0xiSGxQVElKVjlHYnIyYjFrNVpUUW4weTZJLzFMUmQ0Y2F1SG9PRUZiMHBN?=
 =?utf-8?B?WnRwNkZMWjVhRGR4SytLOUdwYlI5SjhJZUdINmE1TGNnYmQrUVlCZTVyaU41?=
 =?utf-8?B?eWo0aVp1R2VDSEFuTkd2ZmlBRDJVY2JNalJTSnBqRUtjNTlGZG1Dd2NBa2Mv?=
 =?utf-8?B?NWhzRDN5VDkveHFXN3NBekNjMDdjOWZ1bExOenFEalVGeklPWXRhYVpKMHlI?=
 =?utf-8?B?REFUdWtjc3N0cllOUjZsQ2VSR2ZrRDVIMkg3WUQrSGV3bTY0Zzk0eTRwYnRX?=
 =?utf-8?B?QVloQm9jZWRrYlA0aDZjVlNMVER2c0RSNmh0UmhZR0FiOWRJemgxaE16WXRE?=
 =?utf-8?B?STdvZTU0d3JTclBQZVZRbi9qMEZtOGJ2SFJURkh4cGRxTWtDRmxLMHhnQXlU?=
 =?utf-8?B?K3RRZTVFTFN5bkhMWjBmY3NzU01KaWYxM3M5elVvb21OMlpsQTFrUU45SlE0?=
 =?utf-8?B?U1pEdHhLN05qSEJVOWVPQVZwdGF0L0JzSXNtWnZSbjRwZk5sb2UzUG1raDVh?=
 =?utf-8?B?cHhXL2NJYVh1cWpEYVhYYlZNYkw0aXRGb0FYMHpHUWU3WWRVOHRkTy85Y2VH?=
 =?utf-8?B?T0V5bVBVeVZIdUZzVzVGbVFqMTBaVlFKYUhSY1BvM0ptVmowSkdpczZLdjVs?=
 =?utf-8?B?eExNU3NEWHFtTkk1YllKMHNnb1l0Z1p2WGpKQWpLak9TaTRTdW9wMWJRQVRI?=
 =?utf-8?B?amRlR2JrMTI0REx6bHAzK2R3a0JIbWh3TEU4bENNWXdiQnJrejJSOWpYSkhJ?=
 =?utf-8?B?eEIxVFpHT2loaStyZjRFVDBmdXF5RWtpcDh3ZlJobUphSk9tdm8ycnRWYzdM?=
 =?utf-8?B?Rk9BbU9lZHVtejZaYVBWRXdEQzlxcjQwbGR0VkEyRkJDNVFmSW9zelg0ZzFo?=
 =?utf-8?B?OXhxZVkyNmRNVmFrOWVzNUZpMVlCelUwRnFoT3VucmN0c20xdzhNdVlYQUdl?=
 =?utf-8?B?NEpDclVhY0V5UDZycHNsOC9aeGVUZ1Q1ZkV1SUM2UDBlbS9iSkhyQVZkUEdY?=
 =?utf-8?B?cXhIS1hlcTZNSytIU0tJbzFqSWw1azd0RU1ibmhzV2tITGIzd3pvVXlXVlp5?=
 =?utf-8?B?K0RSTU1IaS83K0VTdTFEQTJKdE5FVjhmTTNvZU9ueXV4QTh2VHF0bS9wYXVZ?=
 =?utf-8?B?eW5QMmdNTmlyQ3pJU2tLdGlVQy8rcGNsS1FmZEpKajlhSjJJcDRvT0hpV3Zq?=
 =?utf-8?B?dlVSZWJoNjdFODIvd3RpVHNyOHVnaEJiOTZQOFNOMmlQVlVEclBEcXc2bkMy?=
 =?utf-8?B?bzhuRXJObHVtaGROb0htMEliaFhIdUYvK3M5U1E2MGM5N0FTcVMzMmpQZWQv?=
 =?utf-8?B?azExTTg1Zk9PVlRoSVgzdjVLRFR3MFAwMHV4VkNiS0xDSG80Q3BPK0xJamFj?=
 =?utf-8?B?MjZFd3hEMWtoaWwxWU5OQTdLcFp5dFJibnR3UmV1ajUweWlUdTF3R1Yyd3Ra?=
 =?utf-8?B?MktSN093amF0ekd2bEZxU3NGR1Rtekd1UnZvcGtkSGlNZ3EyTk5yRUloclhm?=
 =?utf-8?B?blJCaEVadm1VR29qZ0I4TG5tVnZhbGt2anpoYWtHaWMxSThjTFBDVDJRM1J1?=
 =?utf-8?B?WUgrcTR3bnJqMlZsSk5kS1ZRVmo2c0NIVUdqT0hMYTZNTXpQWVpBRHVVazlq?=
 =?utf-8?B?bldnUHFWRCtieTBFZ0FKN2l3dGI2RjVRblJNUjJ1NnpONFRLUjNyZTlhWDZK?=
 =?utf-8?B?ZitIOTZwdGU5L3V2TXJ0YmxYeGhpZmMzTk5aYUFxU1VmaU14OWJvRDhickx0?=
 =?utf-8?B?dVR4cklNb1RwTXRRajc4aEFBSXpYZ0tLZmE0RFFkRzRzVVF5NXpxeFpYclJI?=
 =?utf-8?B?cyttam43VVh4ZVFyR3QrdlpacFFwVHJDMFQzU0tTdUQvNEJrZUp5WHBsMnVk?=
 =?utf-8?B?WjA0cDVnL2hrVUdFV3pEU2FxRC9vMk5xdlZ3S1N3MUxHVE1OKyt3MEJXSlVY?=
 =?utf-8?Q?b6Trrris87grv3QugeTJGEW9J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fec1a7f-3e17-4447-1932-08db30500cee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 12:20:57.7037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMY7slbxGPjzQLwhO/whKt2JujxpShMo+gpWxUGs36SPQnc8QoJRUM+2vqiYnZNEWRU21aNghd/04nNzDoS83w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9940

On 29.03.2023 13:47, Oleksii wrote:
> On Tue, 2023-03-28 at 16:44 +0100, Julien Grall wrote:
>> On 28/03/2023 16:34, Jan Beulich wrote:
>>> On 27.03.2023 19:17, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/config.h
>>>> +++ b/xen/arch/riscv/include/asm/config.h
>>>> @@ -39,12 +39,25 @@
>>>>     name:
>>>>   #endif
>>>>   
>>>> -#define XEN_VIRT_START  _AT(UL, 0x80200000)
>>>> +#define ADDRESS_SPACE_END (_AC(-1, UL))
>>>> +#define SZ_1G             0x40000000
>>>
>>> No need for this - please use GB(1) (see xen/config.h) in its
>>> stead.
>>>
>>>> +#ifdef CONFIG_RISCV_64
>>>> +#define XEN_VIRT_START    (ADDRESS_SPACE_END - SZ_1G + 1)
>>>
>>> I first thought the " + 1" would be rendering the address
>>> misaligned.
>>> May I suggest (ADDRESS_SPACE_END + 1 - SZ_1G) to help avoiding this
>>> impression?
>>
>> I will jump on this to say that I am finding quite difficult to
>> review 
>> code using define/variable that contains "end" in their name because
>> it 
>> is never clear whether this is inclusive or exclusive.
>>
>> In this case, it is inclusive, but within the same patch I can see 
>> map_end which is exclusive.
>>
>> For this case, my suggestion would be to remove ADDRESS_SPACE_END and
>> just hardcode the value where you want to put Xen. For others, you
>> could 
>> use (start, size) to describe a region.
> Thanks for the suggestion. I'll take it into account.
>>
>> Also, are you sure that all the CPU will be able to support more full
>> 64-bit VA space?
> I am not sure but based on Linux it looks like it is true. ( at least,
> they use the same definitions for RV64 ).

Hmm, the spec has this text in a rationalizing remark: "The mapping
between 64-bit virtual addresses and the 39-bit usable address space
of Sv39 is not based on zero-extension but instead follows an
entrenched convention that allows an OS to use one or a few of the
most-significant bits of a full-size (64-bit) virtual address to
quickly distinguish user and supervisor address regions."

Apart from that all descriptions look to assume that the top VA bits
are simply ignored for the purpose of translating to PA, which would
mean that any address within the 64-bit address space can be mapped,
and the same mapping would appear many times in VA space. I wonder
whether that's really how it's meant to be, or whether I'm overlooking
something, or whether the spec would want clarifying.

> I am curious how that can be checked.

Try it out somewhere?

Jan

