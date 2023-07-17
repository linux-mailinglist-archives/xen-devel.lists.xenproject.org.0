Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8AF756208
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 13:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564455.881880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLMjg-0005uC-LO; Mon, 17 Jul 2023 11:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564455.881880; Mon, 17 Jul 2023 11:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLMjg-0005rK-IR; Mon, 17 Jul 2023 11:49:52 +0000
Received: by outflank-mailman (input) for mailman id 564455;
 Mon, 17 Jul 2023 11:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLMje-0005nK-Sa
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 11:49:50 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08511dc5-2498-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 13:49:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 11:49:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 11:49:46 +0000
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
X-Inumbo-ID: 08511dc5-2498-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iyl1Oo8DB/kCRdv0R84EN5n7GDu0dtuzo7OtTj4H5XHw5wEcYGsCULLStxBcM4mlP4mipYatrm6cATI7eBxbPubQcQ6vHLzGTjYm8nUkOwcOibCGcaft8ELtaJV836IjlUpsP/bYkW9Xqb+mtV3pnYI8ViCnBV9A/XZJYN4fkBPT4QrpK6PEa/8rEsKlEvARQJ7A5wTXKkY6/gK2soasOGFIk4uO5dlcgJfv59l/j/UQx7fDmmku+1+vmc0DTet3ZiHlOHBtfuEffENeX/i3OPaG5s0tnET24XaHJJ7TCNIqPZaf+KhPJZYYLNGNG7vK0xIqNzm0I+Y5eja7PgggMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2hGiGSrw+OF/jiEOTj/fWw3gTtw4oQnJMlMtS2g2eo=;
 b=jnfZl6zcAsEuVaoP/IvEMGjQgdQwrexHulLCdRCEYshAziY1xx1eiORVwK5rbHwmuA7mIIFt6ccNidD0Vz/VNBtg4zjsjVihn2HA2M5ADvbLbwaGosPoOG5M+KKjEUlOqv8mC7LEu3XwH5PCTg3dPftdrYbdnTDsTEJps1knNkOV5ahU47oBK5tc047NS2+dYUqyUIjgkh7SrW30dGVuGDtyDItktCz5JeEMPE7eL41lP4y0VLhhUUyLZ+TCmBKSHiJF6boNDFSTQ/OZln1mN1fAOlTK/G2K8dC2xTMpHfnRgG9u8yq506C7vhMVjTDm97/sVIXHIEItH5kKVvBjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2hGiGSrw+OF/jiEOTj/fWw3gTtw4oQnJMlMtS2g2eo=;
 b=I/16AX3aoY6n3wnXIpKb6Vuzyx4B1rBr7e7EAIujMg2xOLTUjGEOVP7L2ZLxFG6p9IjFIevmE2bG70bGHWaFN84oMJgMfPheNQqvugty/W4nYqOa7wlohrzkqO9G21hl33YyHpKertqz6h71PonwUurPYZGDvqHv2ejUWts0adaSm0SP69Iw7UYIOlFJnhzFJ+TmPjMdy4wqe8Ag2Q2BUmI+4tJt51L6NTAY10C2sGSN4h1AvUra+MHQR2Sewfj+ZdyqBLTcODnHulf6PT8HrmU5r6juOfdBtKXUBOT5QCcEuBVA38L1JnHZNn+VHpxeAdQXeWBpa79uwNFabQ8HMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f254729d-1b6c-8aaf-98d5-c1b739519081@suse.com>
Date: Mon, 17 Jul 2023 13:49:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/HVM: adjust pIRQ calculation in hvm_inject_msi()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <5cfda162-07a3-8a02-4511-b0578b12dbc2@suse.com>
 <ZLUdTB_gZjRzhpJe@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLUdTB_gZjRzhpJe@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: ad36f198-9379-40c2-bcce-08db86bbeaeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n2qOyv6lxsTcOao3IjmMeP8QhiJqTOUvxg6ZKbtXF+abvopnK5TMNmGfy0SYDa9PffoObCOGHQEp1xHGLHCnYnEDhGSc5zQ85yKSqXyo67uINsxwpMzaSQVMld8j0ypL4WVf2IwJaGLaorL/bBCTd8vTkrC2WuGE8X9sD319/bUb0NVyiMlqi8pdI8e9OVuk1i3+M24W/L3k3kfSrsQQOvR3nRdKEvG/Ql8SUX7AZQ3wITVwbqj15wGOiysbXz3hrDcPai6YZ7LxmUIqa9ASmqyxihRhijUUuyYQwH4ykcn2rBOFTLwstbrbdEXdMwWFnLGhUPqH9DOYoWw15TwThkIWVjGYlffCClv/Y5NR4Z6nyQSCTMVNGdIC27dKjAZCZP0gyJuTDtY6DFCiewu/meMAa1SOb82W3Hs54OI0Wdkuu8cMWI1PN1yeGr8sW5eEUvdhdX6xFX2VZhb5gOCIbqFhtwPUG+Qk7OMM3BxQr6joH6ej0Yfjb+MSVeJmkvxmDRFxQ9NCvwkOXc3JmPvBCeNpVlumogTwkfTTGSCCdcXkUej139QaCyQNgVaEGLSCXtlRM2vhE7mPfiKF2Qh73ctWnhnBOxR2zdcD/5Q4tBiAQLQjYhLb5bD1xpwJ3bY97XoZgEuEQiVfNlR54j0Qnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(41300700001)(8676002)(8936002)(26005)(53546011)(6506007)(54906003)(478600001)(66946007)(66556008)(66476007)(4326008)(6916009)(316002)(6512007)(36756003)(6666004)(6486002)(38100700002)(31686004)(86362001)(83380400001)(2906002)(31696002)(2616005)(5660300002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0tBOWZlVjVGNm1mOUszSGo1K3J0MmZNamVzb1lSRUNSU25xRDh2ek9jVzc1?=
 =?utf-8?B?N0V0L0h3d0lnUStSK3FEK2Ewd1VNUWtaR01ZNG5LZ0VpT1Z4UGFGdDl0Wmhh?=
 =?utf-8?B?d2Y4akNoVmpkT2pjQjE1VjNMU2JsWGw2Wm5XMWxqRldJOC91bm1EdjFBNTM4?=
 =?utf-8?B?Qi9PVVF0d0YvaTJPY0NLRjZqeXByNk5UQ2ZaKys0SlcvZzhhNHM2Y3pMeFUw?=
 =?utf-8?B?ekd3WTErMnh3U0pXQmIrbUlDUHVIUzgrR3dTaUNNSWNOZjI2NGQzUHpqaWtC?=
 =?utf-8?B?Vmx5N291VmVOQ3JBWFN5V3R4NDUrUE5oNzk5YkVaalZGTjZZMHF0TG1uYjhh?=
 =?utf-8?B?U3dpekxPd2kwVE5CY0s1bEc4a085L1h3bUMwbEtiT3h4anNrOU5mbjFzdVVX?=
 =?utf-8?B?b1dWSWRzV3BMTnRLT00vMlNMOUxRVWJVaE13UFBQLzdsdERBTmhnQ3dJRlJJ?=
 =?utf-8?B?d2F1NWVnN1dhVTMrNVlpekkwWjhVbmNiUkhtemVEN0xKckNXcU0xSzJFSFhi?=
 =?utf-8?B?UFZ2dXkwTC8zNUU0YjA0RERuVGZmUktyM1hBSUplODFyczdZZUxTeHB2YXFX?=
 =?utf-8?B?WkRjQ1BBNVpFR1JIN2Z5VWhvM1NSRHFUTEllRVk5THlLZmJ2c05ZNHQzd2gw?=
 =?utf-8?B?NE5XcjJqZERIci9aeXF3TmFOODZodVQ1T3RRcnhIUnhKRjE3elYvUWNPQ2Zp?=
 =?utf-8?B?OU5qbHR4MjhLOFRUelZIQjZZTDNVbHlTYmk0eERwYUVyWlNSVDdVelhSbFZp?=
 =?utf-8?B?TEthWjFlclFyMjh1UG9hUjUrUHBhdXB6QXBUb1NtQUdWUlFpY2JwbjAvK1NW?=
 =?utf-8?B?bkErejVEYm9iRlpCVFViMFlwREdMYnlZdDU0enpMUjllM0ZRaERocUpLTHVD?=
 =?utf-8?B?WXY3UWFxd2drak4yaklIZkFJOVh5UWQ3VUcyV1UrQkxETTE3VDYybFNwL2FQ?=
 =?utf-8?B?Ujk4SU9qNFlWeStlaEdFTHpmUUJlb0U3dGxsNCttRjZLcTRCUVQwN3U0cFBv?=
 =?utf-8?B?U2RsOEhYWHFJRGRValh6S1JFOHJZUzdrNTRnUldOeG5NbjJiNzBqWHliNmFK?=
 =?utf-8?B?eWdQWnhBeCtxNFZyT2RVSDZDZk9JUnVqRHM0YkxXVno3YlZ0L0lMUjc5ak1s?=
 =?utf-8?B?Nm5rTlBwQnBlZFZQb2ZUdEtzODFVb2tTWXFZeVpUS0FWN1NyV3BPd05pcnJt?=
 =?utf-8?B?RjE2OU9QS0ZmWW1OM2tvdktuNGp2REIreWlJdlFiaHgyWUZyQll0TEJhNHNJ?=
 =?utf-8?B?alVvVVYyY3U3dXkyOURNd0dLSXdrOG9hQVMzQjJhaVZ4TS9tVXg0SFRHSXg2?=
 =?utf-8?B?RXo1UlYrZHd2ZzFvN1d0dWtKSHFueURxRTFyN09raVdMQ2pnQitpRTZXVmM0?=
 =?utf-8?B?SFIyQ2NhdmZIbEpqb3dqelBkZEg1c3UvMFRvb0Z3M0R5YTRrTytxeUcwb1l5?=
 =?utf-8?B?dlpSQUdsdmhrZVBzeDY1YlByWDJjYzNXNjF5dU9xWW1yN3Q2NGdtUE1PbkUv?=
 =?utf-8?B?cVYrSWNDTll0RXQ5TGY2WURhcDNoWVl0VWxtZGJKZ2I2MGRjRllDSk15SjMy?=
 =?utf-8?B?OEEzTk80TW1HeHBhbktHbmh5UzlEVWVOTE94OVdpQUtpQ0ozczB0VWg0WDI3?=
 =?utf-8?B?d1BZWlBIQ1FYdXMrKzRBdXdoOU1SWko0UTJVN2J4Wm0vM0FyQlRMWC9uKzRk?=
 =?utf-8?B?VldMUXorWU5ObmYwVUs2cTRpVHVqMnhyQWpRUzloamo0cmFnVGxMaHJWWG40?=
 =?utf-8?B?UTZrNHZvaTVoT0c1akJMa2U1VnNWdVl3QURUTlozeHR5b1Z6cFNiZEVlQ0Zr?=
 =?utf-8?B?MzN0RTBFaStPSjJtTEg0bWdFWXZvZTdnQ2pFTW9nd3RHaXIzRFBocEpXZk5T?=
 =?utf-8?B?Q085QmRGYXNiaWVVRThKalJSdVR3S05ZcENBb040UjNpcm5nUDdLS1FjUVN2?=
 =?utf-8?B?RzRxUi9kaDc5RUhQVjlLQzBzL3FpcGEzVDJoM1VJRkpsT3B4SWFYdFFEdUxm?=
 =?utf-8?B?L1RZN1pxVVhHNzlxeTFhR0NRZS9nWjA0TlI2bGNVS0ZSM0dIUEkyK0lRcXBz?=
 =?utf-8?B?ekd3cUE2U2c4MkdXZjYyZzJZeTNiTW1RT3oyMzlJc1Y1dzhjU3U2bWIzejNY?=
 =?utf-8?Q?K6iDxv1P3lcVy/cS51pK+9MP1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad36f198-9379-40c2-bcce-08db86bbeaeb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 11:49:46.2977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JeNSWuaSG41rSK58sKe2b4wQc/TTEayX3tBIWX3pTfTF5YCT7U4vmFJODYTsJrhbHS10jMM2kVt+UakaNquBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

On 17.07.2023 12:51, Roger Pau Monné wrote:
> On Mon, Jul 17, 2023 at 11:31:57AM +0200, Jan Beulich wrote:
>> While the referenced commit came without any update to the public header
>> (which doesn't clarify how the upper address bits are used), the
>> intention looks to have been that bits 12..19 and 40..63 form the pIRQ.
>> Negative values simply make no sense, and pirq_info() also generally
>> wants invoking with an unsigned (and not just positive) value.
>>
>> Since the line was pointed out by Eclair, address Misra rule 7.2 at the
>> same time, by adding the missing U suffix.
>>
>> Fixes: 88fccdd11ca0 ("xen: event channel remapping for emulated MSIs")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I have a question below, but not related to the change here.
> 
>>
>> --- a/xen/arch/x86/hvm/irq.c
>> +++ b/xen/arch/x86/hvm/irq.c
>> @@ -383,7 +383,7 @@ int hvm_inject_msi(struct domain *d, uin
>>  
>>      if ( !vector )
>>      {
>> -        int pirq = ((addr >> 32) & 0xffffff00) | dest;
>> +        unsigned int pirq = ((addr >> 32) & 0xffffff00U) | dest;
>>  
>>          if ( pirq > 0 )
> 
> I do wonder whether this check is also accurate, as pIRQ 0 could be a
> valid value.  Should it instead use INVALID_PIRQ?

I think 0 is okay to use here, as the low IRQs (at least the 16 ISA
ones) are all 1:1 mapped to their "machine" (i.e. Xen's) IRQ numbers.
And IRQ0 is always the timer, never given to guests (not even to
Dom0).

If we wanted to use INVALID_PIRQ here, we'd first need to make this
part of the public interface.

> Since there's no specification or documentation how this is supposed
> to work it's hard to tell.

Indeed.

Jan

