Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DEB69DE48
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 11:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498754.769652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQKO-0000KY-4c; Tue, 21 Feb 2023 10:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498754.769652; Tue, 21 Feb 2023 10:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQKO-0000HA-03; Tue, 21 Feb 2023 10:56:56 +0000
Received: by outflank-mailman (input) for mailman id 498754;
 Tue, 21 Feb 2023 10:56:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUQKL-0000Ge-P2
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 10:56:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c2af847-b1d6-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 11:56:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9236.eurprd04.prod.outlook.com (2603:10a6:10:370::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Tue, 21 Feb
 2023 10:56:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 10:56:49 +0000
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
X-Inumbo-ID: 5c2af847-b1d6-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWtauqPfFvVWlSABcgw8LeKH9Mk8wk7GamkIo9BwiMlhxhudMA3sXI08QeYHYP49Zr4wcp+4oMfAmpFitb0k5+FqSfl1EqM3+QGFPvyMScaDGayPDZTMWufEFqDKdWkwAvw7ez//ckPK5Xhapn2/rUVYuBok0ZWehxQaXoh8qA9GXDC4YK2NkiiQKLU3MOECM3GEH484l7isnfM4d2nkNGJMnq8wWDbUqnM9V70QODQM44gxV52vLnUow9/DyaEC0BfztAeRcIPGw1CWroS61UspwYQBWycBTtxYtaCfyADdVlc0H+WTD0j6wAuq2tgOCz9oZ72TsTDpSjkYbMwmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/CZXZxRenR9PER6hQ2CBFDZ1Sg8SZ/wZydxOvUZ4ug=;
 b=ncxhxEyUz6mJUhhxJ47KHDW7ZPjQ6I57KkRS8hA6BsLJiygwQagEtMDI5zE3ItQjGPEtzHY6fZYEwN+0KqfHNrwhjkU0UwqkGmhzk0691ubnSzeRs9bsF+G4K1RJPcMbzU9/VC8FQKNG12TK2YKvmP4efYe5jO9ifr3yBj/umz7DVrO7bhhU/m+mbEThtqFzNNMKHDDd8rdeWtxBCw1UkN05OCrNAekfncms48bsjjzfJWEuRMyYKibq4alLRab2851U1EmlWUeuTNaXBxh3wOscxnXUztnPaN8PIscf2pu/QsxbPUL4iMyU8Lt/4KNQVy+XdF3tbajO/EIgAMW63Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/CZXZxRenR9PER6hQ2CBFDZ1Sg8SZ/wZydxOvUZ4ug=;
 b=DEpthQ8V8lpie0i8MxnFdpv3tkvYepIGN7LqamGq9EwwCsuPS0OOmPolI6fcxpMM5G6VzDk0hpRPxnYZPUq1BE4Wi0JxKrlsFURtcDz3UIfKw/vDd7TkWY6jyEsXm6SmFMzoRx5CkWX/adeYXeQK6kT6nVdT8CAIlKJK8ZPRghiv61G6ZaDKjqwRRKMdHRtByHYEmHp3uAGr+ksc3L45DIVjGOqIuDGQXWb62yOqRhh+5yecG3NIYSbK0KI8IbXk14Lr71AQam9I8Qm6vlXDewYo5BOYz156R8dfeUuIJXKB3E+mUHhHOKPn7h/2MBSnKRRc68M+8O/T6/svrFvUnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5468423-802f-9442-5198-882738ff6c69@suse.com>
Date: Tue, 21 Feb 2023 11:56:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/asm: ELF metadata for simple cases
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220110439.1518972-1-andrew.cooper3@citrix.com>
 <DM6PR03MB53727DCAB918F421A26DD314F0A49@DM6PR03MB5372.namprd03.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DM6PR03MB53727DCAB918F421A26DD314F0A49@DM6PR03MB5372.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: d2148356-e75f-488e-1bd0-08db13fa554f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZUxUn7FlguVxx6rIrKz1BJCfT5/Gleab0ey0JuPoXmJPip9P+353xSuKrXRXkVydgc/7gXf2SMGrE3VV5zET4FDR310CUPfA8WjyErx4QT+5VvLYqZPp5qa1z+vpQhmfPpWYZ26VfzasZJcs02iMBnB2udxB/lvWHGbvZLoUMeE0hmWFTX4QB4pV/v8hyqTsxw12R+vZniHz0uOEZOhtseG9cvUjZ009lNUdL1vmnKbr6OlJdVct8vrlnOBOW09dVvbjZ/0zmiBQWvgskwUVWt+VMf9uYGeIH80eZ4y0WvVFtuZRu6v8ZPGtWjcws0NeQvGcosLhvE1XjBZpZ7FoH2+ze0+yWhJj+Pc4agndZmyYLMmJ/fidM2Kf0EzCU2jPg6OJfNlop4E72YZhUXmZvm0uOIgdteiYsAAFC67BvqJw/iVh6hK3f2B5LuA3rQzpQIXyqtvi6vTHZETyhVLvlVu2JbJlOZFNdA8C9Pqy5fsM6sNF7Y/cbT+gXJKTrJI4pT/twbhBCq5Ujzy7MW0jiFU2KdfHFH3keSR0OkKzo3Nfkb+opIxplz5dHGDKU+m9JsRQkjLhT+EWJZK8rp1a+h7X+mBNoeVJlv+BhGBp4xbsTBIc/B0X+e3Kh0887YYc410FF437jWFd2oVz9RVpzA2URBGBUo2TE5FaDJfiBgJovsDWxd2fbmrOQzRUYYO8+7iIGWJMfWh4JA8hD2hgp/iBmiRiCd2puN92ALcoSxA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199018)(6916009)(31686004)(31696002)(36756003)(38100700002)(5660300002)(2906002)(8936002)(86362001)(4326008)(6506007)(478600001)(53546011)(6486002)(6666004)(66476007)(2616005)(4744005)(66946007)(54906003)(8676002)(186003)(41300700001)(66556008)(26005)(316002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHd3K2E2VkE3bnVtTmdGUzBSOUNYK0R2dnJNKzFGUTFPaEY1aWtWNEZWSm41?=
 =?utf-8?B?eFBXSEhDYU9BS1lBYTUxaGFSeWJ6a3dsSERMQUhHM2RoR1l3elFzOUMvZU9G?=
 =?utf-8?B?QVpscWxUeXhiSzNNTFBrYWVMWC8vMnZMZVllV2ozcTFqcFJXaFVUNGt5K090?=
 =?utf-8?B?Q1k1UFc5Q3pNMytIbmhwNnRPS3dLTGlrblViM2dIZml1Y0xYRFZxd3FMbHpN?=
 =?utf-8?B?U2ZoZm1QVlZ1bDlPbzVhV2lFcXgyTDRIV2krdjhHejBaeG9kd09ISjBhdXRy?=
 =?utf-8?B?akVaZGJ2MWxqS0hXR2ZLOEJ1YTE0WUYzRlJqMzU5Y0VYWkNHL3NuL2VBaFls?=
 =?utf-8?B?aHdSbTR3Q2RyNnV4TE9yOFNzZDRZeFl0ak5oN210RG9WS0I0VGlwNTZmR0dy?=
 =?utf-8?B?cTFQMnFnQVluM1l3ZSswSWxHWG5kY2szMnV1T1ZnRTZ4NENNbUtBb1ZUakFZ?=
 =?utf-8?B?cVRTK2k5YWhjR1lRbzVMQldxd1d2NmRnVmtDbkJWVE81SVdsSXB1dnRMT0dl?=
 =?utf-8?B?MjJHK1hDRkVENzZiL0lseDFza01yNUFSREZBVGx2MWIxRXlqVmlNSmFKakFh?=
 =?utf-8?B?THNydmtCeUxxZE1IMTRsN2R6YVFOSU9WMzlkWFRPb3RsQmVtdFVhSzlzUkI5?=
 =?utf-8?B?L1B3K3AxWWFmNVNFUTZ6R1VoT0IrVUlLbUdsWndOaU15ejI1Tk81dWorZFBJ?=
 =?utf-8?B?Z28zVVdpOURIVVplRGZCZ0NPS0puZkVyaEhIaXNscnBiU2E3cVRpTEdCbnFQ?=
 =?utf-8?B?WEpibGNFUmpFUEN5WW9HUmsxSlhpRFVrb1NING41TVYyeFU5ZXpMQi9IcDFj?=
 =?utf-8?B?YmgwR1ZUcFVHd2haWEZlenBGZWI3WHo1U0ZXQnRKemgyL0toTFF0bEtuQ3Q1?=
 =?utf-8?B?VUVPWWkyendlR0krMkFnR01pcEl3OVZrYzhCOUVEMlE3V3Z6T0s3OUpEQTc4?=
 =?utf-8?B?dTF3cDdtQk9ZeERTS05zWXdwMytoU1JKNUJOSldCVkFQeE1ueWV1NG4yNUlI?=
 =?utf-8?B?dWxTdWRZUGV3Qm8ydlhseUxQRHZYOEdWeE5oSUFuRXB0UTVaYk5MWnAzQ25O?=
 =?utf-8?B?NzVlMVBVeHo3eEVZZi9PNFc0VGZxc2Y4azk0THNKUnV3NTRLWHNrUkpvcXZl?=
 =?utf-8?B?NFJQUGZ1TWJPa3g2QXdnT3Vmd1VHSlNCWWJKRERYRHAyemVqeTRna2o4bGRY?=
 =?utf-8?B?STZvdWIzUmYyenNhM2pKVUVqRjE2RXdHVlNMRjI4bkRZZkFxNGlpaEZNRTBZ?=
 =?utf-8?B?ZzluaWxVeHVZVFZZVW5ia0E3clVidGVYSEw4VDBBbHRxQmpxTlpLZW1LOFUx?=
 =?utf-8?B?Y2FVNWVsbU1qSXhjVjRFTVpraHpvYVRlYldFVHJsc3pEYUxGUmIxV0pUeXJY?=
 =?utf-8?B?T2lIZW1RckJaaytycWc4YnJEcW5JUG9NV01nNUV5b05xNmI5eE9HejE5dktH?=
 =?utf-8?B?VmxxUUJGb1ExdkdBdnR0aVY3bnUvTUtuVFZnK3M3YmFXNHA3U1RhdnhnbHBj?=
 =?utf-8?B?VERmenU5N3JDR3JHSzNZUGg0Q3BoYkxMbEtpdm12Z2hWQmQ3VHdvelNBV28r?=
 =?utf-8?B?ZldzRWYrZ1VrQnNjbm5XRklkK2lxbkRTM29qZCtxSGE4ZVVId1M5RkxDVGNh?=
 =?utf-8?B?N1FaNzh3VWJvekR1Y3psb0g1dHkyNE1UN1JxeEFIT0Z5d2NJNzlGUldqT0Jo?=
 =?utf-8?B?NkxLa2x6VWxwZkpPOXY1U2V1MEQ0UmVRUTdzblBIU0JuZVVJYTlFd2xaZzRo?=
 =?utf-8?B?by9GRmZmTkNJUmxadU81WHZpY0Y0WVRTcjRCMWJNL284c3NLcjhmVVlmZ1RQ?=
 =?utf-8?B?ckUySVN4M3pSVUtkUE4rTHA2ZXBNdkwrcEsvQ2lDeXVBcWw0YXJCVVBENEcr?=
 =?utf-8?B?ZFI1Q2pLYW5sd24rdExRUExIZ1RRb1JFZnllTHFYRERWdEtIN2x6bG5pbGNr?=
 =?utf-8?B?K3B0aW80dW1INzd6cjdwQWJqd2lsRUlYQ29SNENNaVBDcFVxSTczUnhIdjRL?=
 =?utf-8?B?WS83V1RYbUg2cHd4Wmc5TkxIMzU5VmRQd2p1a210ZUxQWlNSYXYwd3FNcFBt?=
 =?utf-8?B?REtjcVBQb3krUjkvSFRNendLYVRIY21mOVF3UjB5RnVNUU1hNWVUVGVUZ016?=
 =?utf-8?Q?j9lJpR+9kjpUzfsqOxqjhT5Yu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2148356-e75f-488e-1bd0-08db13fa554f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 10:56:49.8462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7/ieXnBrg6s5YBjUFGPB2HaAwWdnQjtS55WoSS+Hd3F2fD4sXP7+B3VemFkbfHmpDocDAum0t0bbMK0UGcz4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9236

On 20.02.2023 12:51, Ross Lagerwall wrote:
>> --- a/xen/arch/x86/clear_page.S
>> +++ b/xen/arch/x86/clear_page.S
>> @@ -16,3 +16,6 @@ ENTRY(clear_page_sse2)
>>  
>>          sfence
>>          ret
>> +
>> +        .type clear_page_sse2, @function
>> +        .size clear_page_sse2, . - clear_page_sse2
> 
> Would it be worth wrapping this pattern in a macro?

Funny you should ask this: Yes, certainly, but we can't quite agree
what shape that macro (or really set of macros) is to take. Hence we
did agree on this minimalistic approach as an intermediate solution.

Jan

