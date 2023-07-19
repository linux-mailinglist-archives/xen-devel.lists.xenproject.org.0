Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC1B7594C5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 14:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565816.884339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM60K-00087D-Eb; Wed, 19 Jul 2023 12:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565816.884339; Wed, 19 Jul 2023 12:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM60K-00084I-Bb; Wed, 19 Jul 2023 12:10:04 +0000
Received: by outflank-mailman (input) for mailman id 565816;
 Wed, 19 Jul 2023 12:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM60J-0007p8-58
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 12:10:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f735fc1-262d-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 14:10:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Wed, 19 Jul
 2023 12:09:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:09:57 +0000
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
X-Inumbo-ID: 2f735fc1-262d-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5WILTlvVcaGwysrJweNi6lD+sp7oA6ayT0TaB9+6Mjzz7j55qslk+0sJUIaYwDnjbIPWoZj3b1byZmCtyvKaR3rf5wqXBnP7Y3NS1BEKI1pVv+/mb+SnQZLngtDmA9CtL/ZxfPpYaG4I1s1pNyEu4rh4sWRXGTAjW+07RjCYVfd6rI3r52DmdOJaS48cd2r7/yHydmrjOyMwFHtFmm+boIYj7AOVTFQZFGeqiYRvn5aYWZjUcuLq2q3KdOGIMtqV0O3+4p3Lr3eZw73taNfFha9BKsmDV4DpiFM0WcSID4PEV4Xx7pam2U/HTarQw6sd44h3cTN8W/cMNgHDLIdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zgvzx1+kQfyNFDJjPsTMWl1tEm167XHAuH0ZeoLNMTs=;
 b=kRErIVi0xS0U3tfC7qV+PHuBEQqF7QrmL8YmGIwQ8i6Er7wAR0kPFq5BRHoEhne4FhtoyXAkF7S/GTCP4uu0M309CdPZVantdapAFpxhfBd+f9S1fyjxwYZixvl0ktXr8nsMJ3r5iEraVZFbJeIJ/5i2CvROeZi6W2gwgBG3lC7hrfU40NFcslGBa0PHD4YZHehGPdRwfxSXGg6x2HAylyC42vC+CWbNGwhmxHGyhGq8annlMk4PPUrLUjdBuCDI8M3bUHUKFlGbDF43GTsG0IIcN6vLb73hRjmL2SLNo9msKykWanrNQlib44ZGieLDC9jxikc+NZ8iO+Lx2JpfDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zgvzx1+kQfyNFDJjPsTMWl1tEm167XHAuH0ZeoLNMTs=;
 b=ivNYAVh4CYcE2pxGcc6XAhhavjADirjHLqmZVgAMNC28dO74/lq93J2R9mlEjtYJ+J2ZSBesp1wgZKyBD9FIke8fB7pxFxFPnydZJNUABdPq9T8kR357OhfSitoMFHmOtXgnxbhHXTNWKMC8R8ST/ujbYTEMUXCYJyxZG74AyyYrEb8UQ3HNb94WhnAXQ6G2pGEA3ylxCo0nKYzTk4XyfqMLAM9swl4mPh4WfGtNkWorVUnm40r627hAYG7HhbKWLmcsV0WToLkO5us5pWKhb3otlKSSGPd7WcIQMoWUSGziQmUL0+pq3E0Cy7A9jGwS/D9WgEEyke9nGqahShOdqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <468474ed-60b4-9ff2-83c4-036e1252b99d@suse.com>
Date: Wed, 19 Jul 2023 14:09:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/mem: Make mem_hotadd_check() more legible
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230719100808.4046779-1-andrew.cooper3@citrix.com>
 <64b7ca84.170a0220.758d8.90e0@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64b7ca84.170a0220.758d8.90e0@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: c10b8bfd-1925-4d19-fa3e-08db885111e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z+hV9CtizYEaNjQf1q1dAj8IA0OXS6HAKVm3KFXN/SOHWqS3sBa7XZK4rQyUxQT9CpERNFV4m5mJv11q5kf1zXkmMIV5ZrqezCOsf+E9wp/jyvDgkjYMXU0iFFMCL4DN1OKSrPe9ilqnJ/tg7E1D5yCEaB6kcUVqMoX51XPDmgk6pXZo1M+xelSH9Cd1ZuNKqt3akZ3FiTxNaZNvvB+/FJeZZZKHmg6wi79FBZD6t/IKhtmlqWFA0iOJ8wDZ9OW6BwFGevhO4sPpcy4SjL6jtTAK3gqJvUDw/ZJHRONIhDPTkojSA+MG8rDClkB8qgcukSut2ptsdD9wl+sQOJMJmrP6DQp4RimH1JyWKhCQrYAHEujc7KecvGoS81+ufTWZO6AFHBZLDI5Ariyx4PkhMzbIEflXoj0ELTefERa24Ysr+4AH9KVIh1NRxUpaDStQDsIy3MAqa6SUrp+5n4N/GKbeiw13g62yFdXi/w8KJf+3NM0Seuj906fKEM7jd8s1HRe8js59aLFZvMOE3c/y+Le+bwb/RAJPNKsocQ0xQKclHvwrChfg+2CX3gkNqUz1AxeXqaEjUpFHTJ6z/MkNqsp19u7hgKVOjvtMFfS7hu+dduwds4VhHMxSFovB/PDrRL0FFLCb4LOLhwf05jxHdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199021)(36756003)(86362001)(31696002)(31686004)(110136005)(478600001)(6486002)(54906003)(38100700002)(2616005)(6506007)(83380400001)(66476007)(186003)(26005)(53546011)(6512007)(4326008)(8936002)(5660300002)(8676002)(2906002)(66946007)(66556008)(316002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0hXV3plRDdERUJiY3lCZUJjRldtaGtGb2pTN3huWU9uOExLQXU3N3pCTk15?=
 =?utf-8?B?WFhxWUM1VEZhTGlMZzVNNy9CcjlkbDQwOGRaazQ3R3QzcEg0c3lmbDBpUXVL?=
 =?utf-8?B?ZDJaWDVjeXNnWThCcVJsTlg5b0JWdmtYaDVpV2kzT1hmb3EyMVRnUHRvbGZK?=
 =?utf-8?B?d1RTakc5bjMwQmNEZU5NRTltOHZWNWxaMUt2ejNoSjJPK2xNbVA1NFBxSGVI?=
 =?utf-8?B?WUk0Yng3ZkhWR2JxdWdFNzFXbHVUck0wWDNKVStQUHJxQTlrQm93R0Y5VERt?=
 =?utf-8?B?N2J5amlzcWRaaFUwRlphTitSSmxKSGFxRnpIU0FWa0RlZm1Tb2gzZ0tlWnZQ?=
 =?utf-8?B?RDIrbkNFUlUvZFZtclNBc2N1TGxMeFVSdlA2dTBKcFFJTXljeEppR1lvem5h?=
 =?utf-8?B?KytBbHVFcDh3NCtZYzFRWGFna3VqMGlqNUt1aWduR010ZXhSdnh4cVVFRlVs?=
 =?utf-8?B?TmU5YVdjMkxyMlR6WE00bWtTd01mNEJxcEx5M0VKNEZRcWtTRStSVFU2eDJB?=
 =?utf-8?B?RC83MGlIT28vamorQ2MzZW80Z0xCTzI0MytWTXJjTEk5MUNDYUM5KytVQmoz?=
 =?utf-8?B?Z1BWMVNyZWtGK01zc2VsWUpkZTA3bUpRNkFUaG9OS1NadGdEV3VqaHluQmhT?=
 =?utf-8?B?RC9KakNEaXRCenpkREwzSlNQNzdKUzJSUDY5ZHhtcDlIT251UUNYVGZSNVVj?=
 =?utf-8?B?UW9NQmFtREhMQisrOWVHV3FESTlsamEyOTYvTTBOaVJ2d2VtOVlRd254Q2tF?=
 =?utf-8?B?THZscXp4SVErTEpPcTNjbmxkbVJSdXM5UTkzbFM0eWp0TTZCek1rWllNbTlL?=
 =?utf-8?B?ZWZVTTVTZ0ROdnV3NFBuNjI3ajJVN3J2OSt2eGtvcC9YemRrRGZPTlhYOGlM?=
 =?utf-8?B?ZEI5K1paYjJWeFNjNWJGbGJNNkw5MHNmelZrc29pUmppd2tqclIxa3NyVmFv?=
 =?utf-8?B?U3Z2a0xyL2lJdnh4REZIWjVza2p1SnJnem9xQzlDUWRNd0QrcmloSWZQRDho?=
 =?utf-8?B?WmozYmZWSE9ZT2MzQ09HODhweGNOQjY2WGFqZnlnVkZCOUI4bEhOSFdvT3Jl?=
 =?utf-8?B?SHVJd2RsT05USHU1YjRBZlZUSXhDQ3NRZ2R2NVAvYUQ3SFU1bXd2ZW8zSFd3?=
 =?utf-8?B?RHdYeVVuZ0tzZDZQd3VwcHhtS0xTeCtxOTBUYTJkWW9qQk40VWxNeUtScTBK?=
 =?utf-8?B?MjQ3UTREbGRHL3d4SVlJb2Zka044Rlo2VjFtb2FsU2U2Q2R6NEQrRXppV1A2?=
 =?utf-8?B?WjdzclkwbFR3RHlkaU9QNXUrbk1neXljWkpmN0FHMmlXa1Z0NHRlUElOQlZV?=
 =?utf-8?B?ZTRUWldZTkMwQmU3elV6UTVEUnU2U0N3Zm5Ed3QrZUw2T2hYM2R6eUpLbWhk?=
 =?utf-8?B?U1JtZVdXNzB6bEQ5eG1mdXhMNE1WTDFXakM5VWVralNJenpocjdPK1g0MUsv?=
 =?utf-8?B?bC9GemFhVFRSTkl4bWRrTTVCaFRYcFJKamFkTUR3ajIxRGR2YUVFQVRxTVlj?=
 =?utf-8?B?QjEvV3RDZjFuS2loSXIzMEVQTDN2MUk3NG40c1Z3em9pR0JDOWhzcTJKS1JW?=
 =?utf-8?B?eUgxNGhKQ2tpYlQ4RFRWMFV6V3BUYUcza291SWJGanB3OEZJRUJzc0hocUdC?=
 =?utf-8?B?R0E1TlhFTWJ1ZnZFL01qb1YwazV3WEwwZnlaZDk2YXBVNnBFZG5nTXdlUXl3?=
 =?utf-8?B?aXhOcml1VktqM0pUM1BWVThnVlc3dWhBR3NobERqeURuZy9XbTZ1WXlTMVox?=
 =?utf-8?B?Z093SDZweENMbTUxRmdZbXh3QXZPbEd2bmk0dDE4Nm5wQnFjVlg3MTZpa1JK?=
 =?utf-8?B?bStQR3Y0bVI2Q3NRVWd3QlBXeG9PRmFWRWJSbHVYS1ErRzRwNUlDY2RzM0Uw?=
 =?utf-8?B?QkRROFBIM05aV0p5REROKytMN3ZzRUpyaUlNemFGM3ZiQjJKNUcrYlN0bU5y?=
 =?utf-8?B?cEpJM2VQSEFFaGsyZjdJTGZBbnNGWTNBbkt5WWxWcDFuTTg4SlJUNkpLUnp1?=
 =?utf-8?B?ZHBiNldJckZ6NDdmWjJoNGZqc0NoYVZ0K1l0bFBMd3M4bStmS0dKU3prV1ZD?=
 =?utf-8?B?cHoyQUhRZklaRUs0SDJFeG9rVDVCYmZXbURSclJCTmJNWHZJWGFyc09RRWhy?=
 =?utf-8?Q?35WTmxV7g2e+atymbVrXGnoe4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10b8bfd-1925-4d19-fa3e-08db885111e3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:09:57.7910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/mjz3oQNmShD6s8VEqlmkxqcKj53gV1Q6rXmC+zaxzllO8uezZVbH2wB2/SkaPWKUnLjdiUcY/EwBjZroELZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045

On 19.07.2023 13:35, Alejandro Vallejo wrote:
> On Wed, Jul 19, 2023 at 11:08:08AM +0100, Andrew Cooper wrote:
>> Introduce a ROUND() macro to mirror ROUNDUP().  Use both to remove all the
>> opencoded rounding in mem_hotadd_check().  Fix other minor style issues.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> The compiled binary is identical.
>> ---
>>  xen/arch/x86/x86_64/mm.c | 31 +++++++++++++------------------
>>  xen/include/xen/macros.h |  1 +
>>  2 files changed, 14 insertions(+), 18 deletions(-)
>>
>> diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
>> index 60db439af3ec..38f978cab269 100644
>> --- a/xen/arch/x86/x86_64/mm.c
>> +++ b/xen/arch/x86/x86_64/mm.c
>> @@ -1159,10 +1159,10 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
>>  {
>>      unsigned long s, e, length, sidx, eidx;
>>  
>> -    if ( (spfn >= epfn) )
>> +    if ( spfn >= epfn )
>>          return 0;
>>  
>> -    if (pfn_to_pdx(epfn) > FRAMETABLE_NR)
>> +    if ( pfn_to_pdx(epfn) > FRAMETABLE_NR )
>>          return 0;
>>  
>>      if ( (spfn | epfn) & ((1UL << PAGETABLE_ORDER) - 1) )
>> @@ -1172,10 +1172,9 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
>>          return 0;
>>  
>>      /* Make sure the new range is not present now */
>> -    sidx = ((pfn_to_pdx(spfn) + PDX_GROUP_COUNT - 1)  & ~(PDX_GROUP_COUNT - 1))
>> -            / PDX_GROUP_COUNT;
>> -    eidx = (pfn_to_pdx(epfn - 1) & ~(PDX_GROUP_COUNT - 1)) / PDX_GROUP_COUNT;
>> -    if (sidx >= eidx)
>> +    sidx = ROUNDUP(pfn_to_pdx(spfn),     PDX_GROUP_COUNT) / PDX_GROUP_COUNT;
>> +    eidx = ROUND  (pfn_to_pdx(epfn - 1), PDX_GROUP_COUNT) / PDX_GROUP_COUNT;
> See [1] for both the sidx and eidx lines.
>> +    if ( sidx >= eidx )
>>          return 0;
>>  
>>      s = find_next_zero_bit(pdx_group_valid, eidx, sidx);
>> @@ -1186,28 +1185,24 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
>>          return 0;
>>  
>>      /* Caculate at most required m2p/compat m2p/frametable pages */
>> -    s = (spfn & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1));
>> -    e = (epfn + (1UL << (L2_PAGETABLE_SHIFT - 3)) - 1) &
>> -            ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1);
>> +    s = ROUND  (spfn, 1UL << (L2_PAGETABLE_SHIFT - 3));
>> +    e = ROUNDUP(epfn, 1UL << (L2_PAGETABLE_SHIFT - 3));
>>  
>>      length = (e - s) * sizeof(unsigned long);
>>  
>> -    s = (spfn & ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1));
>> -    e = (epfn + (1UL << (L2_PAGETABLE_SHIFT - 2)) - 1) &
>> -            ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1);
>> -
>> -    e = min_t(unsigned long, e,
>> +    s =     ROUND  (spfn, 1ULL << (L2_PAGETABLE_SHIFT - 2));
> See [1] for s.
>> +    e = min(ROUNDUP(epfn, 1ULL << (L2_PAGETABLE_SHIFT - 2)),
>>              (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2);
>>  
>>      if ( e > s )
>> -        length += (e -s) * sizeof(unsigned int);
>> +        length += (e - s) * sizeof(unsigned int);
>>  
>> -    s = pfn_to_pdx(spfn) & ~(PDX_GROUP_COUNT - 1);
>> -    e = ( pfn_to_pdx(epfn) + (PDX_GROUP_COUNT - 1) ) & ~(PDX_GROUP_COUNT - 1);
>> +    s = ROUND  (pfn_to_pdx(spfn), PDX_GROUP_COUNT);
> See [1] for s.
>> +    e = ROUNDUP(pfn_to_pdx(epfn), PDX_GROUP_COUNT);
>>  
>>      length += (e - s) * sizeof(struct page_info);
>>  
>> -    if ((length >> PAGE_SHIFT) > (epfn - spfn))
>> +    if ( (length >> PAGE_SHIFT) > (epfn - spfn) )
>>          return 0;
>>  
>>      return 1;
>> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
>> index 7b92d345044d..ceeffcaa95ff 100644
>> --- a/xen/include/xen/macros.h
>> +++ b/xen/include/xen/macros.h
>> @@ -1,6 +1,7 @@
>>  #ifndef __MACROS_H__
>>  #define __MACROS_H__
>>  
>> +#define ROUND(x, a)   ((x) & ~((a) - 1))
> Why not ROUNDDOWN() or ROUND_DOWN()? ROUND() doesn't imply a specific
> direction and can be confusing if ROUNDUP is not seen next to it.

ROUNDDN() would address some of your blank padding concerns, for ...

>>  #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))

... being the same length as this then. That said, ...

> [1] The hand-crafted alignment there is going to collide with the efforts
> to integrate automatic style checkers. It's also not conveying critical
> information, so I'd argue for its removal in the spirit of making future
> diffs less intrusive.

... I don't agree here. First of all I don't see why this should
make style checking harder. There's nothing written anywhere that
such alignment padding isn't allowed in our code, so any checker
we want to use would need to tolerate it. Plus while such padding
doesn't convey critical information, it still helps readability.

Jan

