Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6876C1D0F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 18:00:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512020.791572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIra-0005i2-IJ; Mon, 20 Mar 2023 17:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512020.791572; Mon, 20 Mar 2023 17:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIra-0005eA-F6; Mon, 20 Mar 2023 17:00:02 +0000
Received: by outflank-mailman (input) for mailman id 512020;
 Mon, 20 Mar 2023 17:00:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peIrY-0005V3-Tq
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 17:00:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a505c8f9-c740-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 17:59:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7912.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:59:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 16:59:52 +0000
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
X-Inumbo-ID: a505c8f9-c740-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yp4BjthC4XTzROGGliVfuCCAMQ2gV942d62Q4o5s99nZECZp4UtzvpBDwvmWbSBVxAjy8P/iPT81/6tQ/gPvvCjG5HR+57eS1q8+yYgIiciVYCTsG+tD0RFStOMlLrbESdgwdl8g88qgzUsj8XyQChLWqgxB5YtRvYx4OVX5jO7d/Hm3xna9ihytFCPxyI+xK6MnyiFn6SozZClTy6eA1UjpDe7e0xYPwQUjERzwwYKaZJeev2BWOb9EiEFXbpxloseVqrH9EpnK2uIpGH99ZW2qsdI++Qp0P+70Bihj9wU/uEPfmOsXBwBCIpY/fV/ZbcfEqs0QfcCxnN6eA2O8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sYTxr06Na9EFC+Yir9pzobnPKK96xE+BCTSE7UeaOc=;
 b=T0oRjGGUmhzrtL3RplxDAwyRwy96ecuJ8YQtwFUTEBjl1FofiE2zUVqggmTsJSepxomaga/adZgG0k5gldK4yCQg9ErYMOqTDKFUQ+EDYhd6mEDQjVFI+etIzvPWFNXLUIOvmdXdg9biX3z+606VsoCO4M1e+1U5KYrDqi54wI2BHTQlEWuUWGyFw8J/wRCDnEc5IWNXiZd3ZPKDk10WKHhWw/3YF6SUzr83cRuwmz+3fKxjeRHYencAq1zZalDqdR8h8kkaHT4mXwyzNTkH8W6x2Tu2KCdr815fhqaUqMkVfuS1u+UDNDLMXu0i98dXggwuFcZuuRk0COME1oUwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sYTxr06Na9EFC+Yir9pzobnPKK96xE+BCTSE7UeaOc=;
 b=VVKMTd5N6AuOgKytKAcKxJ/pH49oskgq8/mPKiNDHy5mN51s6uElD2ONdGEiPEV65lotz5eqtjYPhUgIR+rc8r3uIoXbR0hCTqaLptcV/liQScGpTkfeQ75Il+pEPlv5XsDeO5E80QoAlGx8mznuCUiZO+FEqpH/qcDhFI5T/eQlAC98qVoK9KZvBZFvG5YohDUfBd22JHF1AtWKTAZXRt+BJ2pgcCkGc94T/EuQmy/pgvxLAQ9dmsZBkcd5h8fTfzn+45uijsGsIsvPViYeWndc2P0YKNzL0VNTskFZqyHuZtfYOqCUtPIohwLYxOZL8IN/oFj/Pj+QuDZREW0+4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82c163bc-7feb-7256-0a24-f565e9b7bc33@suse.com>
Date: Mon, 20 Mar 2023 17:59:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] x86/APIC: modify error_interrupt() to output using
 single printk()
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1679084101.git.ehem+xen@m5p.com>
 <4db49e192b6829e520cf497481a51deef227b23b.1679084101.git.ehem+xen@m5p.com>
 <f945860e-6a82-7070-3a1b-2e73a53040de@suse.com>
 <ZBhtzfhumm9AWqte@mattapan.m5p.com>
 <5b62c34e-5013-50ba-b218-925fe4eb6c0d@suse.com>
 <ZBiBtiSKkaCmtMAB@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBiBtiSKkaCmtMAB@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b09d40-9fc0-4734-9f66-08db296485c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7iNtt9i3h3GASS0CxaJM7AZuSODpR4fPanZkSztg3DCXRCy7Z4hyHp7PLIAQ5tE/p6twONZ3kzPp/bHjykKHCjutHks0H/84jdTcuYkt3AzVSQ2Z89puiVKNdZTiOMcLPfXlq8eutbUe/qIDKUpgkI5QPV9DwKUeV/GBjQBgbMAXGWX5ea43blDUcPEzBRxC7u5Dz/jfc1uM1rwlYg3VGeWEuzKz+Bx1SvmqnhTb2WB0BieOSjrJjR/fUat1kVi3lZlfPTSZ03zjY49NxL+tjcDjuLo8WQ8ZK3s5BU+KX/HfbxhEgQXBGRuImEySX5LlOEk2PCyLeUDcvC8R2Mo4N4SinHHKwEAQUQ1M7Djk1VWl4i/HhB5M+jgdtPDBiGaiG/lLZm6xEKSfGsNqiyGKLTKuk7AxRpm2PDrftN4P/j7wn/mkSB5gjiF/mbrM3zdmQjOquPyMGNbZajcynMbGb4DpBUNIUuIMsORWRZKpblAxz/uNQVb9Wx1+pgv2GXFQ0KV+avz1M4ZZNuxIATxEUIuYqLqRTPEsbpwXx77lz4sgLd/mVhTQmrh0rrhtxa8+kfxWssj/Fvr0ZY87eD+mUaIP11zqi8cutMDNMoXDhom7DExjw4jRFgD+726/DmpDm+YSF/pNitrIuiIJd/ypaOYHvuKTks4GnabrFzn+td+rZrk8Y0KS3X+CVs56JDzErb2wly4GZDqPzGUEy4gUpxosVaeRQzDvKuajebIPt6w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199018)(2616005)(83380400001)(6486002)(4326008)(478600001)(316002)(66476007)(66946007)(66556008)(8676002)(53546011)(6512007)(6506007)(186003)(26005)(54906003)(31686004)(8936002)(41300700001)(5660300002)(38100700002)(2906002)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVU1Z25JbzdwSUJSZUI1RVlvc0lubmY4TkdzRmdVMU93TS9sa3RsRHRlQzZI?=
 =?utf-8?B?cDlEd1NMTFkvZ3RrUXFkN1BVVlpHUUlsSnl6R1lIWGhIbjRqOW0vZVdFUGh6?=
 =?utf-8?B?WnZsYzBRZkxCNXg5L1NPTC82NFcwNjB5SUU2UE0wMlUvTWxVTEhTQXd6dDMr?=
 =?utf-8?B?KzRhMTNtQ0REZWRGenBhbitwVk4wSk1XL01qejRva0IwUzBPbXBoVDRPekw1?=
 =?utf-8?B?NHFidlplallDaFRoY1VrWG5rNHYzdERkc3dkQTdYbTFpbWxkT1FpTTQ4T0J5?=
 =?utf-8?B?YXRaLzduUTRIRlFLYjdYbFEyY2FMelpRcEs4ZXZhMmtzelNyZHRvR3V5eHVy?=
 =?utf-8?B?bnFsbm9NT2NqYjFlbkxYdnA3em9LVk1Vd2w5aU5IZXhLbnlzQkRVM1d3WThz?=
 =?utf-8?B?bEt2bkFobjlXWTBxejZEUHBIUTZ0dERFbEZSajlWN21kOTlYbjBxL0R6SmhG?=
 =?utf-8?B?anpUQ09YU0l4WWtCNGRWVzhVaEswMllncE0zeklVby83MnczWlJ1bWQ0Z1pU?=
 =?utf-8?B?bklZODczOFZ6SU9DOXppbDM5ZUE2WmV2cTNUK1ZHQnQ5MWVuekl4VUJ2dXpC?=
 =?utf-8?B?MFFhTzFqTHdqYmJkZzBVdmxoSll2b3ArTUZZeitndHlIUkJHUExMQmt2Mm9x?=
 =?utf-8?B?emFITHJmbXNDNHVGSWpmcWlhTmlMZUpTSnQ0TmJYTGMrY200NkNvZHZFSUJO?=
 =?utf-8?B?dE1WQk5XWVBOcEtnUnFObDZheW16Ull5Y3pXUERNMXJ5Q1pZVDJmc1JqQTZj?=
 =?utf-8?B?N0trKzhJZDF4cExRZDhJYlVnbG1aemszaTlhMjc0b1lsK08wRGJNMEdQRWla?=
 =?utf-8?B?OFh2R1dESnZMMk9jSzZiY1pxcmhMdHFkNkU0b3d2TVFVQmlGUlQ3QnpmTUJj?=
 =?utf-8?B?MkxwdDNkSVhLOVlqRGZad1diN2ZLMTNtanZLaHJSUWxodUVnMDdFL1NvK2hD?=
 =?utf-8?B?cGExbktxMWoweVowbnFFUUZ6d0NFRWtFVGFJdHpOY3prQ29nV29MdWQ4WHN4?=
 =?utf-8?B?VEx1OGdQQW82cXNZeDdkRVpDVXJCRnh0azRIMmU5ajY0NnBTRyt5OVV3UDl3?=
 =?utf-8?B?aWl5YUxBZkFMZW42QzhnWGI5Si92bE40dS92aTV1Q2E4azkvb3M4dHk1RnVl?=
 =?utf-8?B?MWI0RmVFeDV1S1JPTUp0ZytJYnJ0L0hLWFBxQ0lINVF2RWw5S3RhSDFZRTQ0?=
 =?utf-8?B?ckhMREFnNExnclordENPbjU1dnpIZTd2ZEFSQWMxdnpIZmowamVZYUtKaURB?=
 =?utf-8?B?Q0lKSnVGNmNvL0hyYUJVUzE1UWdxTXhBaDMrd2VPMkZhVU5pd1ZQbEhlS0wr?=
 =?utf-8?B?cWlSS0ZhVzBCaFJjbzVrYUFoQ1NHNU5HVWpucnJhZCtKVDl3bUpaMzRkZEk4?=
 =?utf-8?B?eHl3cWRmaGRSYURDNEpBZHhjeGdJNzNsNW9pQ090RDBndnZwWDVvcmFEZFFr?=
 =?utf-8?B?YkhLd2RWOC8xTTNPTWxVempBVWZ0bVA0QlZDNy9sakdEWTgxek5MT0krK1Z2?=
 =?utf-8?B?clFucFo1cUJYdHhLYVIya2tVL1ZrYWNaKzdJV0VHS2xEQ0YybnBoS0NQNFp4?=
 =?utf-8?B?UEVBbkZadHROdUsvM0x0eG9EYzV1VU5DK2llQWNnZ21XTFRLUUVYRTdtQlBR?=
 =?utf-8?B?QVllZlRlbFpPS0xCMUJOWFViZmZITnRxaDhCc21zT2pxTGdCMDdRalJiV3Zw?=
 =?utf-8?B?U1RUMWlXLzFlRTlZdVJXOEJUTnFFM0taSVNHQkN2UUVNckhFL3JvWjlsZGNV?=
 =?utf-8?B?YWZUSHpLZ1pLSU1zd3N5WnpFeHpFdGVqQkpTZXhBUzRQakQycnpMUllCd3Rv?=
 =?utf-8?B?WkVKL2Uvc29ac3dLMkdDOG5FdTZiR1E4WEdCWUhJYmthNThUMU4xUU8vZDhl?=
 =?utf-8?B?Wk41UmE0bXZLMDJsdGZFdGNIWDBsYy9iRDlpNVhTaWtkTjdNM1JXdUJLZ1kv?=
 =?utf-8?B?NUlzc2IyY2ZPNExWUEdCZVI5Mkh1MnR4WUcyMDlaV1JyMTBONFNEejFraSti?=
 =?utf-8?B?aXhudENvL2VhRXo3V0tFRVhjRGRmVzhHeTREOHdCOU95UTVjSzVXVmc3SzRF?=
 =?utf-8?B?ZDAvUlRtNG9ncG91R3Rjd0R1Q1FRd3o2U2RsNmdNNUhUWEJPbGdYRkozTzZy?=
 =?utf-8?Q?InTSKAWAUr9QPKgQgTIh4YdZr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b09d40-9fc0-4734-9f66-08db296485c1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 16:59:52.1678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CU2vD3YSaV9ahAsB3NV0GPbJWsdbxaGAa4M4pytyi9qID0LMx0gag/svs/dVWs5DqJcKB6HDOjhNp0cmnqXXsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7912

On 20.03.2023 16:54, Elliott Mitchell wrote:
> On Mon, Mar 20, 2023 at 04:39:48PM +0100, Jan Beulich wrote:
>> On 20.03.2023 15:29, Elliott Mitchell wrote:
>>>
>>> There are several minor issues here which may be best handled during
>>> commit as they're very small items about how precisely you want this to
>>> look.
>>>
>>> First, I later realized I goofed the argument order.  In order to match
>>> the original implementation, it needs to be entries[7] ... entries[0]
>>> (could though be the low-order bits should be reported first).
>>
>> I'm not really concerned of the order. A change of order wants
>> mentioning in the description though.
> 
> Seemed simple enough to fix on commit (simply switch the order of
> numbers).
> 
>>> Second, the order of the for loop no longer matters.  Using
>>> ARRAY_SIZE(esr_fields) and increment should now be more maintainable
>>> (this would also allow i to be unsigned).
>>
>> Indeed. But that would better done in a separate patch then anyway.
> 
> Feel free to split.
> 
>>> Third, I'm simply unsure how you would prefer to format the printk().
>>
>> About any way matching style guidelines is okay. There are two more
>> things to mention though (sorry for not noticing earlier): We aim at
>> keeping the entire format string on one line, for grep-ability. And
>> there's no need (and in fact no reason) to split the sequence of %s
>> from the \n. To summarize:
>>
>>     printk(XENLOG_DEBUG
>>            "APIC error on CPU%u: %02x(%02x)%s%s%s%s%s%s%s%s\n",
>>
>> (unless of course it all fits on one line, which it looks like it
>> does).
> 
> I like keeping the "%s%s%s%s%s%s%s%s" section separated since it needs to
> match the number of arguments.  In the future where more bits of the
> register are defined, both sections will need to be modified together.
> 
> 
> This seems to be a spot where there are large numbers of similarly
> functional, but mildly different style variants.  As such I suspect this
> is best left in your hands as this is a bog of trivial style
> considerations which have no real functional effect.

Just to clarify: What is or is not adjusted on commit is a decision of
the committer. A no longer as active committer was actually of the
opinion that it is a mistake to ever make any changes while committing.
In the case here you're asking for far more changes (including either
one to the description of patch 1, or the folding of both patches) than
I personally would be willing to do. I'm sorry for that.

Jan

