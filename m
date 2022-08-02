Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCE6587D6E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 15:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379349.612728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsHT-0007zw-KE; Tue, 02 Aug 2022 13:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379349.612728; Tue, 02 Aug 2022 13:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsHT-0007x8-HT; Tue, 02 Aug 2022 13:49:55 +0000
Received: by outflank-mailman (input) for mailman id 379349;
 Tue, 02 Aug 2022 13:49:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIsHR-0007x2-9k
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 13:49:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb6c48bf-1269-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 15:49:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4981.eurprd04.prod.outlook.com (2603:10a6:20b:f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 13:49:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 13:49:50 +0000
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
X-Inumbo-ID: fb6c48bf-1269-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmBGHElTdgyJhMqSPvVTyBnqJk8uEbxFSz9WvOzJ9nmu8nuM7h8GjMm6QwFb84aOytrjt6PVETmzC3eKekcN29a/okA25cWNg10/L+h0NQ6y/Rnk/c36FCoLaNtF48OKchODM+Xt4t90NbK2kOvjDAey0Pl8WVQ7lDLstuMs8cm0MGljY+KuVYsI6zURvHafxNbfkFDuKPpf1uY04X5CaUJrodn+9YH1zXeXMcOXj8I9qyll/Qpi2hCrU/FM6eQLceXST4f3yUeog0IP2uOJ+O1ojCi9yT4Odqvkhk2FR5pwezxRNqlZ8k+tLcbBAOnDDT85z6xnJt5Hy3+GzO4P9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjHhj687bB1N/fUDO+UxrkaUXeca6WM44E+lwGtUS8A=;
 b=MaIjFG8WwiGFve7k1kbYO3LUlgAtw1aEJv8Hu52MI4orSBo8NAPp3a8Yy8D+X6LoRvCpX0F0RcAC+S5UoDSxcJIGgMB5Ax3IYKH7pyksTOmxYk5DL5fk0xN2WNlFMPLF4l006qqqLP4xd9hLGTKXXGYrMLxPWTUeFw335zpMIqgt7Gi2NX8DiKRgL3sQPvJbHPNKGK0vvAZBHXY9i3Q/rV/v+rKE/Dzm78LocGBiOA7vxtXDo8TUb/H9H0lcmvi8YL42Cr/plfFPGZelfj+B59IqDR2wf89Ix6eL8BRN38Hpw22OF8/rYnz6Kv5xnu15NvArzyi5vIVmufdRX59kWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjHhj687bB1N/fUDO+UxrkaUXeca6WM44E+lwGtUS8A=;
 b=r8K/1jTpvLhUij3nMRAr9a7HOozybAPo3zQ4l3UjkYcS5NV1+XkazNVjxG1RjwV8WCkT6RXI3TfDqkmn8sJ9tss7YiC+VkpZRKxETo5YZTP5Ui+LpBZGw7sF4O8VRDyMcxiY6kM9Mx1fkxjwY42X0ni4pDfMm7plcQljflIW/47J7wi6cnlkfJxfChcMEz0W5DT0+3UKhDXVV09rGAoYAQ6Vqy9P3NjhW17E7lasAAZeYpHG/ugKRt0dXIDKD5TpgT6uAhw7Sv+Jjd2KmtdiL7NOtxehtk+cbCTGiDNC5sIf/bxuc4q/NIng2pzGZwbjjXilNNhUqdzSvaJbVjKyrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6470ea9-f225-a0e9-64cb-a24e25ca7604@suse.com>
Date: Tue, 2 Aug 2022 15:49:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/char: imx-lpuart: Fix MISRA C 2012 Rule 20.7
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220802075433.1748035-1-burzalodowa@gmail.com>
 <7e78d64a-c700-5846-f046-a1b0f2c98ea3@suse.com>
 <3b0fd31a-c847-f5ff-2365-5fca5becb051@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3b0fd31a-c847-f5ff-2365-5fca5becb051@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0048.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b39850b8-96d1-4219-4db7-08da748dde95
X-MS-TrafficTypeDiagnostic: AM6PR04MB4981:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WhWisS3jahdYJ/n3C4AWvEyFKgLjLAWAoAumtOtKykHeqUmYFOpp3hlwntkOohP5ZaJ4nL20p0yNSVHmmFn5RDINEobZ9rBZxAUm/RY+dCQcauDzJireyx4YSoEiNU/5frViwDrxkm9rhgdCYpTMFYwaS0rf5W6mKF/oXD/e4Cq6Fc8L8tRWeU8xJ3i0QbujMkBw57Sb2C4Ob6lpMe1DpC5POiCCVMwVCLRScLfiJLZUgW5UUX0+SZz9p+audlMKe5TXJcPs5uV4EsfwMCaxyq+tTMtntQLZNJEixsZr4x19dJ+RtEP7GKwAlDDsJX7rLT5fbHKWeXnaNTCLXHXd8xY+/xeHW3p+iJYS8qV13/L97SLZDwX/vZhFtfFUv5kp5UCCHnpONUsmKfDtbNPnFIJxxh4/MJNCwUodp4ziCGVBCVHoBv05IDu7DQvgz6iH7aG1at34UUY1AyogvkEIPm+3Kk22oOznnSAmaBZezdLnxfEiJYtahUhhsYZWZIVfRAUbqa1TtKr//61paSFCOOD0HgpDfbgWe+Y8owCTL7x7MqhUqdeaZ8/q85d5A1/Y0n/YWZv//lCw6WLQhuTXy5xI/BalXb8PSGC+xZaVxkXfpqCE0LTy6NhmwpQrXT8oNWKrCV/GAo/AzT7qEzkm82Y3Cz+uWH/Fr4LOpFbEUNruDQFTN68bCiFs9zpr1+U9Jzb2oOdy1SH4tcu1BnwFuDrnxs/HpPW+Wq1KcxRThCB1Ed3XN6HqplYpb81gTo5hUU7xxYraphQ4Yi0zIArtYZ8w3VU2TWNdWfVwwgbrtegP59aC+O91HblTnSNXhn54sWI7TD7+6xu/M0wXE97tbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(39860400002)(366004)(376002)(2616005)(2906002)(316002)(31696002)(86362001)(41300700001)(26005)(8936002)(38100700002)(6512007)(6916009)(54906003)(36756003)(8676002)(4326008)(6486002)(66476007)(66556008)(53546011)(478600001)(66946007)(6506007)(186003)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU5YQTRhZHVyNEFWN1Rjc1NtVHczT1g4d3hSdnN4Q2RENzFXTmxCLzhuY1Vy?=
 =?utf-8?B?WC9BUXRqdnVyWXcwQXJWSVhqYzJydUtjUHpiWCs4N3VGWG9vSWdxa0Qwa2pJ?=
 =?utf-8?B?S2ttS1VTSWlUL3dKNTI4T3lMaCtGWmtUaHI1c0ZIREVBMUNCbDZNamtNU0Nx?=
 =?utf-8?B?S05XYUpVTWoyUjFKYi9xYlBmUUN0VTJiNU5NSHp5QzVXWk5TSVVzamFwbGlp?=
 =?utf-8?B?WUxtWjZsUkMydE5NNjNTODg3Z0U5MHdMQkE5ZGQzWDAxY2t6L2l6elNJREhT?=
 =?utf-8?B?L20yRXNaaGpiZWR1MHBuNk9lOW8wSFBIZk9tZzYvRVhPUG1ma2lNNVRPWU1Q?=
 =?utf-8?B?TkRwTmZ0VVVDZWhpdTBGeTJxNlR2YmdHNzNaT21qS3pnVU1tMWRUcHNmOEFC?=
 =?utf-8?B?cHFydnRPbGM4WnNYUmpTeUxXbHY5QWl2L2R0M0x4T0s1OXdOOWFwbzFESklj?=
 =?utf-8?B?ZjFQb2dabkRneThIODJTNTZWaDNzaUZoNWJ2NEVnakFRYXh3SFlWTUxCKzlM?=
 =?utf-8?B?bVE5RjYraVJDMnd1RURQQ2hUTmFBY1ZpeWx3SThQUWhmbnZpN2E1anRScFJO?=
 =?utf-8?B?UHZId2lqSDk5eWR2TW02Mi9sbThyb3BobENRVUM2VzF6S21tTTFaYmlrR1dn?=
 =?utf-8?B?SWljUTZKVVFITVRKRjFnSkQvOGxPSFlOVVh0Ti8rUkxoQzRvb0s3K043NEpQ?=
 =?utf-8?B?Z25JSlhrM2x6VjM0cG0vTXNPcytyNUFNT2Q3Q1NoQ0x0NWtrUGV2VG9xc3dJ?=
 =?utf-8?B?Uk9SbU1oMGQyY2FvaVR2SVo5bnJWRGxDT0hFeFhVRFNTNmZ6ZWdVM3Zmcldk?=
 =?utf-8?B?Qk1lWjJWc0xTOVFjcWd4ODFSRXovdjVQZjdYUUhlWG1WKzdkZmVyVE9wUitx?=
 =?utf-8?B?K25sanBZR2xtNzlTNEc3MjJSZC85eDl5K1FvRjlOdTZldzh3dFdqQmh5SUNH?=
 =?utf-8?B?MmllMnlRNVp0OGtyMDB0MVQyRFdYcHNTNW9oQ2F4TnlwS3dFWnFZUDJ1b1Nz?=
 =?utf-8?B?RDMwTy9OUGpqeEpaR1RsOU5oVnNXM2xaZlRTSitPVWxCSXdLanQzS1FXWXpS?=
 =?utf-8?B?dmlDU2NhSUM5bG55VFE5Uklrc3hVMHZvVUIxZU1TMjdhU2o4ajVWS1N5NnNC?=
 =?utf-8?B?NUtxbmJib2lwN3hqWGhpQm03b0o1TFdwOFVnN1dHTjFGa0tLOTBLbVU1NzlC?=
 =?utf-8?B?ZCsyZk9ZRHQ3ODI2VjhXMlo4a3U1R1U2bngrM250dTJpNmVvY0tBc29hK2lm?=
 =?utf-8?B?UDFpY3V6ZVhPWVMza3JPbHNwSCt6UldxWGlaNG9rRzUvRytFZmV4VjJVSHRz?=
 =?utf-8?B?dzBPOGc1bC9aeHJtcUNUQ0xqNTFuSW9UYjRsRTF5RW9UQTJXWVh3Q0g0ZjA2?=
 =?utf-8?B?OVlwV09DcGw1aS9XcmsrdkZKVjdpVXB0U3RNRkU3SkJKMjhHYnJrSks1UFpm?=
 =?utf-8?B?MVNHYjFKVUtnYktyd2IwTFlqdnFzZVVDYlBRNHIyN2ZDUWFicUR1eXdwc1JR?=
 =?utf-8?B?SUxsMTd4dm56eS9PV3dXY282ckNtSXlDTFFyNHRNYTF1by9MbGJWY3JzR01o?=
 =?utf-8?B?QUhZaFJha2k3dzlCZFI0K05Va2R4aWpjcTlpaE9SblJXNGJRRUhETFNNVGpa?=
 =?utf-8?B?N1VqTXE2cDNjdjU2Y1ZQZWlXTS81cEFLb3dxS0dNbzlqMk1NZlFVWUFhaTFJ?=
 =?utf-8?B?QlVhV2dQb3lkVS9ORG0zSHE4ZTlsZjlCQkZaYm45ZEphZW9VS3lBSmVEYVEr?=
 =?utf-8?B?dXZsdzBaVk51STE0aWVhWVhYMjZKcmJzM0VUZmR4TTBDSlBWOEdJUHJCYVp3?=
 =?utf-8?B?ME0yVkdXNlJkTGxLazlLUlR3K3lsOVRaR0s2eUthUVJnc21aZDNEazhXRU04?=
 =?utf-8?B?QnlSYkNPRVNYVGpJV3NWM2NManR4ajJjSFJsSXpaVTNjaEVjbGpjbVUySm00?=
 =?utf-8?B?NFQ0K21HU1VKRUxscWdOWW01Z1JiemdHQ3RxTDNlRUdNMTUyNzQ2QllWbjN4?=
 =?utf-8?B?ZElnczVpNS8yVzhuUFdXekNCQUdCNEpWcFl5ZFZmUkN2b2dBdERVRmtlVFZ6?=
 =?utf-8?B?UlVNUEw1UXpCdmV5OFFTRzhrbnJSSzZ4ZXdaelJ6SWVvYlpOaG5Ybm4yZ1BO?=
 =?utf-8?Q?dmAs3aVQepFMZUNlh45jJQmOP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39850b8-96d1-4219-4db7-08da748dde95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 13:49:50.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXabNm4dlg7z3BKki/Bbx0uoh4sf3mNZqb1mOlGv6hpoKg+2OX2T3SLRQh/xvEaqrtcme0Y0TPOkcQBF4tqxlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4981

On 02.08.2022 14:40, Xenia Ragiadakou wrote:
> On 8/2/22 14:58, Jan Beulich wrote:
>> On 02.08.2022 09:54, Xenia Ragiadakou wrote:
>>> --- a/xen/drivers/char/imx-lpuart.c
>>> +++ b/xen/drivers/char/imx-lpuart.c
>>> @@ -26,8 +26,8 @@
>>>   #include <asm/imx-lpuart.h>
>>>   #include <asm/io.h>
>>>   
>>> -#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
>>> -#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + off)
>>> +#define imx_lpuart_read(uart, off)       readl((uart)->regs + (off))
>>> +#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + (off))
>>
>> As elsewhere before I think at the same time you want to drop the
>> parentheses from the single use of "val".
>>
> 
> In general I do not want to include irrelevant changes in my patches.
> Also, here, I do not want to drop the parentheses from val because the 
> removal of the parentheses
> - consists a violation of the rule 20.7
> - would allow the following to compile
> #define VAL x, y, z);(
> imx_lpuart_write(uart, off, VAL)

Parenthesization won't help against all forms of odd use of parentheses
in macro expansions anyway. Maybe MISRA should (or even does) have a
rule disallowing unbalanced parentheses (an square brackets) in macro
expansions ...

> - is not justifiable (i.e does not fix a bug, does not result in more 
> readable code etc)

As said before, I very much view too many parentheses as affecting
readability.

> I understand that the rest of the community does not agree with adding 
> parentheses around macro parameters used as function arguments

This may indeed be the case, while ...

> and as 
> the right-side operand of the assignment operator,

... iirc for this one it was only Julien so far who disliked the
addition of parentheses.

> but I consider them 
> useful and I do not want to remove them myself. Maybe somebody else from 
> the community could do that.

Fair enough; my remark was indeed _only_ a remark - the maintainers
will have to judge in the end.

Jan

