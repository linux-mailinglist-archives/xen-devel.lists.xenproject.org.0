Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6006E4844
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522086.811262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poOK6-00028N-QV; Mon, 17 Apr 2023 12:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522086.811262; Mon, 17 Apr 2023 12:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poOK6-00026G-NN; Mon, 17 Apr 2023 12:51:10 +0000
Received: by outflank-mailman (input) for mailman id 522086;
 Mon, 17 Apr 2023 12:51:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poOK4-00026A-M8
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:51:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83009214-dd1e-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 14:51:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9210.eurprd04.prod.outlook.com (2603:10a6:10:2f9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 12:51:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 12:51:01 +0000
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
X-Inumbo-ID: 83009214-dd1e-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyO7EAA4USMbp63Kr6iijrENMI7rzHjsGKHr4WP1u+ipxxfhyCmUajt9vtTYVVlDNnOGhvBdLu0HeooRoxSHKu5kce+5FK4EiJY7ZhFRCbJwL5KMkjs7UF2A01iBe89MqCrt9/EjLKhmqVBZTpPl3SK1/VkXdCMtvAtw2rq+JxgECb2cKkQzQAZCiC0PQDRS4lT5wgEnoD09mBeV5F17mdba+/W6VABxSyzV03x3agq/Iv+qPcQUgqsUsor4pJkCh6j1kNIubhe8Q2aOSdZMXb9jPii9LmNWrhCDIAuj1F9TNQ9WxZePKwdD7mVhry/ojOV6mskTbl6hMRlENc5s7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkNfOviI4hf1AzPUv3CbDAXMwM+GNKcA60lFWDNu3Zg=;
 b=aMNwt2n9G6K6fDxY3mjZGzYmNbqLgZfOXF4yixK+HEgLgPMQG3/IwPBR0z+whooe8Cw4NIC3arz+6Xh2tls7F4H8lm3oq0eYtuO+Me1M5qNxaaxJJaDhW2lZAUGS7GQI4ayi0q4jopH/mrv9bsrtQ13ein/08Ae8NuTRkl4Yl44QHZ5NIhbK296qZr0aW64UkhyxL69zObZ09KDXit2FcWHfCh0YkbavfvUcPBi7o0P/zXC6CY9h8vzLQfewBJnKGtoyNqCWvRAwjuZX28pz2G+XlmSYv6UQV933KDOu9la8ITwfRrMevdbZLdasUuZt5ura867dY4gMKJjawSuDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkNfOviI4hf1AzPUv3CbDAXMwM+GNKcA60lFWDNu3Zg=;
 b=BSR9Vvl94CRRQSqTOjeHKTh2xrpjdIxq/t+B/eB3CwAWFT471rTUnwqZIloxeZ7YwBFbnJZRHLc15uXwjHzOkTEY3CBOK9/hVLgA9pGBbh3c1xkLckqLSLYyIdWEgfWKRyV3a0d+MtByc2StLF/uYWUjlK3Tt25IY7osPpJi246wSaY+11BXSU9xK8dTBdMy/qvzBnZjx1cXdUqFQ8X2/GxVt+9oHgbuc72s1k7jApXHdEqpACC2TAyN5kgKOdWJEmcaCusG1j0bkZUXpdIN2NyFQjU5yJet/UTFQ5RakIpFsk4cq8myAC3MJU2LQ7jJIaWVKt+MTrDovyy6jYp0ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <823ca649-9a9d-cbb1-e7bd-a91ab38e15d5@suse.com>
Date: Mon, 17 Apr 2023 14:50:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 8/9] x86emul: support AVX-NE-CONVERT insns
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <bdcb4822-397a-0795-08eb-74e661d9b7ae@suse.com>
 <385b175a-5123-3b1f-0663-1a956f5ca3a7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <385b175a-5123-3b1f-0663-1a956f5ca3a7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: dee3e646-495c-467d-0b4e-08db3f4265cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wIEhO/hkGpM5wNeAn4MohZKLqQbm84uaj41nffzeTv4yy7J59sC70+IB643+eRc1b13MeZaX8eWZ5E2otLN+L6fSsC9VeftxP/wLiLMcJjLJNR9RV3h7aczMLXpv6a2zET9UVMjP/hpAnouy6aDSstMvvCFkTEpajEU9qgtOaSasmicYWb7UY+QdZrfjkjlblNVFzkMY7x95g2fA75nudxpBDG/z2fSY79JmaRrSu8QUSAvrH9wAb6I+DUXStjeZB6sttz3WmMWaR9Dz8jLFfWllWfrgaoLuK6TSvbHPxgxx0gV/h0uy5ZZor6gR1YoxAhBB1NTFmRxWrEUZibuj2kykXpNtQgEek5MeFnsm3pJwGhksy3xe/AIFhJCBnxQIzKoph4L+SuxuOecMcgeozaMYRfFhsBBqEdGtR6Y5x/dEOIdXiACW0ydPmJo81EllggqRSiJHeX1x2ZR23N+W597t/ql+waLDPZ9deGiU6LRT5Kpb+kULAAjpjLDD9c5lmE0hvRvXttMasC8g7gJYLFOKCXqTd4adAkkVAOr06SWLVXf8FeEr56qciNRREMJg2rNmNVPukuWfXy4f4MX0uYtDFXgABMRerj06DrFmhmHpzBmgoi/2RGzKIuVTuzjXdWN4DhjgE3YtJ2Pgf//jlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(36756003)(2906002)(5660300002)(8936002)(8676002)(41300700001)(86362001)(31696002)(38100700002)(31686004)(478600001)(54906003)(2616005)(26005)(6506007)(53546011)(6512007)(186003)(6486002)(6916009)(4326008)(66476007)(66556008)(66946007)(316002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHZ2L2x4L1NBRzEzc0NRUEFoZW8vUGYyZW1xSklBQXdmam9VV3BwbTNJbUdK?=
 =?utf-8?B?SjVUdVFyQjZoeGFJdzdCWkZBRTlTcktsaDAxaEhaN1dQWnR3cFNmMXVWNXFB?=
 =?utf-8?B?WmhnZnpoUTJ1aUw1L1pkYVh0UEJCSnFtb3lDVXEzTE9SZWloajEzL09KcGRB?=
 =?utf-8?B?RjdjQXBlT3Z3SFNwbi9XaEJhb3haM09yRW1ZZWJzZXZKNVZBQjZqTkFpaXZM?=
 =?utf-8?B?VjAvMktYdUg4TjlKN1hJcVh6R3UwRldrNWRDN1ZYVlptWEx2TlVIMHhxdzkw?=
 =?utf-8?B?SUN2cnhIL3N6NFdYMERMWExpa1NRWWxZcDhwWi9mTTFqYjVCd3liTmUyZlFZ?=
 =?utf-8?B?M3hCekx3ZjRibjdITHNsdTl2bmtOY201ck4rYUs5R1dzUnE5SXdSVTBDRHlx?=
 =?utf-8?B?bkFSTC90cG9QTmdOTVRLTEZMT3NWa29qY0NoQTlhN1hTSEQ5VjdDOE8waXhl?=
 =?utf-8?B?ckpTcENNN0F1UTNheTU3VEZsazV0Q3Y3K3FRNGJiallxR1duU1NuYmZMNjlJ?=
 =?utf-8?B?c1VaeTZobS80S2hMQXJXZEpFVWxXbzJKdXc1SjhnT0YzdWhqRmI4VmpFWUt4?=
 =?utf-8?B?T2dmaWhrT1RxQzhoc1ZNMzg2V0tDWUlYbzJ2N0c4QzV5YloxOWtyQzhsZzRj?=
 =?utf-8?B?eGRybXAvbXVGMXcraEQvb3p1M2FxMC9kWDNLMWRZdElzSCtDR3dZRUkwa2dE?=
 =?utf-8?B?QkJ6Mjh3Vjd2NURGQnJMQnd3SFZEaEFxT2JydHkwMzBlQmZ0MlpGRDF0VDdH?=
 =?utf-8?B?UVoxbWF2UnlxVGREZ3NmbXhKM3ltN1JOS2JQT05HazJWUGx0MVBtZU5DVVgw?=
 =?utf-8?B?Wkp1dU9rNHVWYURVVStIK0txbENpNnQ1TXdoMkQxMjV2YUNjbllScVJteHZI?=
 =?utf-8?B?MlZNWnpIVWwvMWdsK1J2bWpRMjd0WDJNamZtVE9pZG5nNjM2MjFrVUZwT0xo?=
 =?utf-8?B?ZENNYVM1bFozR3p3K1U2RVYwaVdvaUZmOVVia1NYbmd5dStlaFFybWVVdjlB?=
 =?utf-8?B?azdxY2VXdFBlYUZmRkVtTUlJOWlBY0xBK1J1aGNoYXlVZ3JyaXlsZFdsTVFP?=
 =?utf-8?B?YWorTXBUK2syMDA4S0QyYVZlRzZFZ1RpSlg0VHVqeHZQNEZ3WGtrNEZtVTNp?=
 =?utf-8?B?azNCN2tGZ2U2UTRoZzNDTWVWdWpLQ0xlSXFYSHRmcnZROXVPdjczcjFiU29Q?=
 =?utf-8?B?Y3dXMXN1U2JwMXFSZUJ3a1lXS1oweWlreU5LUHlieGZ3M1BUS3FiK0I5TVhN?=
 =?utf-8?B?Q2NLd0QvYitLZXFlRnZtYUJsYmtMUjMxNVRIRDhITXM3MmVtSUZMcFhuNm9D?=
 =?utf-8?B?MVFkZjFLaWRlSEt4NGx5b0lMNWsxOW8zVVZQS0VJZlFJMHNHOEtjR04xNXRu?=
 =?utf-8?B?TVQ0RVJHZEg0RG51M29rZU12SHoxRzZQdVJDd1B0SlRycWE5bExGZzk3NnlH?=
 =?utf-8?B?b09zbDl3aTNBYUxMZTRuOThBSmVrRXBoa25FN0FPeGlka28vNDBQYkFPZGZz?=
 =?utf-8?B?SmR0b0NOL245Uk12bStKaWszSmVZa3hPaE5nQXRZcTVkLzhWL3BpRG9wTnJr?=
 =?utf-8?B?aVVYaHo1L3hTU3lzMUF2TVdUR2xpdEkybzFvandZSDB5SzZBSHgxa1AwMXVZ?=
 =?utf-8?B?d2pFVTFjTW5YNGRNbjJNcEUzQ3A5Umh5bUc0TnJRZ3Z6Zzc4bnd5SzRDUlk4?=
 =?utf-8?B?L2RIelR5QmtrWlZCcnlCenAwVEZHODN0T09uNW1XWTgvYmxqL3E3ZHhGQU11?=
 =?utf-8?B?NUVUaDR5WXN4TXJSL2pvQktRZXM4b1FFZVhUY1J6RHNvSmVZa29GSFE3UGk0?=
 =?utf-8?B?QWhvRjN4Vm5Ub2hueUIwN3JQKy8wNWVqK0hHUUtZK3FkVXlXbTFSdG9OSXMy?=
 =?utf-8?B?bzZpeVZ6bHZEdmQ3NE0vZEtMRm9NYmlLamp3NUN2ZnI0Vkp3ZTUweExsM29i?=
 =?utf-8?B?MUdKR0NYUFJVOHl5YkMvZkExQXVWeUNQTGJuY3A2QVZTMFBsYVdZMThKVUd4?=
 =?utf-8?B?UGhoYUVYQnpKODFYbU1Ga2pwUVpYOTNFYjZNYTdQTzJSUENVQmwrVTBvRjlv?=
 =?utf-8?B?R0FaUjZSVXFOekRla2diNzhSSkhXMzIycUswTFJHQ3J6MTBUdzVHZGtaZExn?=
 =?utf-8?Q?dUYXEW3FJ3Yt5wsA19k6AfO6L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee3e646-495c-467d-0b4e-08db3f4265cf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 12:51:01.3163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmfQc3Zcjy/EChEbopmibKoR301jH2FJbmZmeMIXj5mKfHRMKzqJnHC4VOGPNhvWZsm/CKIba8mHzV51J07ULQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9210

On 06.04.2023 23:22, Andrew Cooper wrote:
> On 04/04/2023 3:54 pm, Jan Beulich wrote:
>> Matching what was done earlier, explicit tests are added only for
>> irregular insn / memory access patterns.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>,

Thanks.

> with two minor requests.
> 
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -214,7 +214,7 @@ static const char *const str_7c1[32] =
>>  
>>  static const char *const str_7d1[32] =
>>  {
>> -    [ 4] = "avx-vnni-int8",
>> +    [ 4] = "avx-vnni-int8", [ 5] = "avx-ne-convert",
> 
> I'd leave a bit more horizontal space.  These names are getting rather
> long, and we're only 10% into this word.

Sure. I had taken neighboring arrays as reference; I've now switched
to "aligning" with rtm-always-abort.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -6208,6 +6208,19 @@ x86_emulate(
>>          host_and_vcpu_must_have(avx512_vbmi2);
>>          goto avx512f_no_sae;
>>  
>> +    case X86EMUL_OPC_VEX   (0x0f38, 0xb0): /* vcvtneoph2ps mem,[xy]mm */
>> +    case X86EMUL_OPC_VEX_66(0x0f38, 0xb0): /* vcvtneeph2ps mem,[xy]mm */
>> +    case X86EMUL_OPC_VEX_F3(0x0f38, 0xb0): /* vcvtneebf162ps mem,[xy]mm */
>> +    case X86EMUL_OPC_VEX_F2(0x0f38, 0xb0): /* vcvtneobf162ps mem,[xy]mm */
>> +        generate_exception_if(ea.type != OP_MEM, EXC_UD);
>> +        /* fall through */
> 
> Only just occurred to me, but we should probably be using fallthrough;
> in new code, now there's a real attribute to use.

I did actually consider doing so (and iirc also already on an earlier
occasion), but that'll be yet another item we also need to cater for
in the harness'es x86-emulate.h. For the moment I prefer to stick to
comments, switching over - if necessary for e.g. Misra - all in one
go at some point.

Jan

