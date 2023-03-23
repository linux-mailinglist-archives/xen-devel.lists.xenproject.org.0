Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D516C6477
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 11:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513728.795167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfHtC-0000MC-9h; Thu, 23 Mar 2023 10:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513728.795167; Thu, 23 Mar 2023 10:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfHtC-0000Ic-5b; Thu, 23 Mar 2023 10:09:46 +0000
Received: by outflank-mailman (input) for mailman id 513728;
 Thu, 23 Mar 2023 10:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfHtA-0000IG-57
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 10:09:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4a46e38-c962-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 11:09:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8483.eurprd04.prod.outlook.com (2603:10a6:20b:34b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 10:09:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 10:09:40 +0000
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
X-Inumbo-ID: d4a46e38-c962-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtKyuLpAfobRDnzQZwZYCTgfvF+58rWkT+DyFQcnM7ZdqOiPWZt6jBYZ7K7+egTaJ0yQzNuX6E4v6VS+dMs56eir8RjyxX7+G000rdtZEamvuE1Kce3jnveSEXku7BtIl4G/VgMzheBro/4FVXwZH+fCJ/FlKsqyux75swGsihvv53KLEoVoZ3aVD4WlJFq+vH6Q0SwPJ7xClzhU6ZnBswXG/r14696eNpwlL34q7t9QyZNBRRNB7WhEAMgFMpMaGhXvvWXaPDVeeBCa1JU9LR3C810z3fS6Jg94vlVyDPMfsBE2LQ16R+damzakDl4oxaWr+J1eVmJXfLX2W6pDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYaUDMdrK2XcXMKL8Bzvq2LZH5YaGZ9OgSxajGMg5qU=;
 b=O8HeSUXhjJdJtV6DfEMjVhVzrYsdjPr4K9Hj8rVrlADp3zyucQ/I+7tPp9MmB7Jc6LgDpQ7dNmQ0saMdXUeZ2mYKvfkRY7JldZdlep0TzX3/6qCsvLqO/2CVNKA3+2DoYphnH4rKH27lQU8tsYbrdCSKBieolTIXe71fxg2+7mjM/f6iUWCPHW6mLzMrJd4qYvZ9KZtGMGKYQVkOTGLYHTQNaIq92W34GITaa3cb2cLGSGJ8QaEbqdSDqWotdqfhtMgzcUzAZ8fgMXdDAS+c/LMvArHhvFrgz2eAlfIZtTMwm8TqKYFcXLETgTcahvjyVCeqbVGFWW2ehoZzwPgr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYaUDMdrK2XcXMKL8Bzvq2LZH5YaGZ9OgSxajGMg5qU=;
 b=E/8em8+5Ba91j3DnZelDuXQcF3+KiGhBcORaDs5wltt/LWpn3ohX1EVx6q705TP362U7Ts++jeNNhzlXX1FpNwm2fw430ZVqUu+CikNmYn0nqrK0kPGgyxyOh8tNL6lMi1IF2LcUtES+2AOMnumbcJM4Tserr+KNmTnDQDqDsXo/OKhK8AWigzfKpAWkxiz/u4NA2UxlGQNxMezmLUil5FwoasUhv7Pg+ZLtaYYxRCnrlAd9z70JCqfYeBhYUYaXwcsrahrcO8zO6r0imnYUWG2YimvAtnYB76KOggSXQr7glGKSILUMi7h09sTx84LyDpCN9/XCahBz0Opvw/+Pig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3178a474-371c-2dbd-a9d8-f90a6fb4e13c@suse.com>
Date: Thu, 23 Mar 2023 11:09:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/5] tools/hvmloader: remove private offsetof()
 definition
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230323090859.25240-1-jgross@suse.com>
 <20230323090859.25240-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230323090859.25240-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cccd1a-913e-4cc5-d147-08db2b86b756
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qWmbaCLAu6YXRzfxetTdseZhp7afiGHSRMrE0oNJwJg0B/DHPiv24eINjcaKXcKaZKgTZxRzbf7GrYDBZzdrM/HxB3f4cXesXx+ggfevcShzkRVtdoCMZPUeEXyvqmWm1BE09d6+qdOIkfqdCETUdDJwA+Y3QyjDV34C98RKIORprzpB9FbSmBZCzT+4QXWXvwie5oHXz3b4biNi+8Uhecryt1aYV2DqDGO7Xq4byQ/QYnDhNf9ujRNm3i8bToTMS61IvaiaqAwQoBZ+4FWTbDbbIYUbmDroR8RPSAFV00hhV7D1rNPmGHofXIqV88lWP8s3+J6lJLET99xNXfZlwf57YtK2PzKQb/tz5OLXx4buNcugCgAo1Y5dgwVNVGclI9L/g3IiYdSFHERDjr5wcbzg+6nKc2xrSlSz39VOuIfmzPeq6NgnlEABEOUz3yS5tIuNGwzdMro9j/0PhDEg70xwaZzoa6izw5Um/nrf3cX7H8W9VE++de1QLo8ikSkpozgxmJuGhwZ/YFbh/hVOiRZriYAW5csqt+fAf114aCWofAanH7eTAFvth9I0IcqEUSUD++uhyAxUXO+Z267KM7yOv5muxu6UbOp1exSafsrfQO+4I241rdG2KdD0WBQjqNYObz4spn1iGKf2AZSutC3P/SgkEkTgAIECDkQHkenlpGqC6xX6NSpEoaaYMS1Pidsho2ONkurs1J9Td6waCsZfwENZ80VDXMT9V6BdhDc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199018)(4326008)(66556008)(66476007)(8676002)(66946007)(37006003)(316002)(6636002)(54906003)(4744005)(5660300002)(41300700001)(8936002)(6862004)(53546011)(26005)(6512007)(6506007)(2616005)(186003)(478600001)(6486002)(86362001)(31696002)(36756003)(38100700002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODJDMzJCMDZTN1Y2RFVwdnpQNVh3N0tvZmk2enJXNURqUFRIMVlibGZaWGg0?=
 =?utf-8?B?RXplU0tjZ2h2QUl1YVdZT3E0ZHZqOU8vWDFuaFdBbm9IbmxTdkxBeW5oRVcv?=
 =?utf-8?B?bnFhbk1GTm1tUWVhRkJRb0ROT01VTWNOc0thQ1l2VHlMcnhVdWttNWU3cGtI?=
 =?utf-8?B?dFdzMWs5QnJEN1F2WmUrSDFxbkNJU21UNk1PM3ZvQmNFenZVOGtwZlBJeXpq?=
 =?utf-8?B?endFSkNydlVIcTZXMmhGSlZJdmY5aTBiMzdBVXI2VjNKSGpWdzZaSHkyZkFq?=
 =?utf-8?B?Z3RkUXd5T3pHbDFlMmJQVkVLdzBOemZZb3hwaG56R2pzZ1Y3WVMzS0NMYmdr?=
 =?utf-8?B?VlZMQ243ZG5LUGpiVjdJcm54K0RzVThySGhRZjdvWnJnRERPVVArMmJ3Vno3?=
 =?utf-8?B?bEVMVVN1cVQySlBYUlhGM25LL3VzSCsyNzdaZFM4MzFrYjFZdi9CU3lITXdp?=
 =?utf-8?B?T3dWMlQ2SXBzNWgyczhJT29waGZwV0FLMkU2aDBKWnk0MlVCbDM1YkNtL0s0?=
 =?utf-8?B?Q2RmeWlMVTk2U0hjdmVVcGJEdkc4TzNDTDhsSUpNOVpyZW9JZ0hPc3p4L0ZN?=
 =?utf-8?B?K1hhYm1xUTF3VGRFWVVTOEs3THJTMFZOU3BOY3k0eGNBK3IzS1J0a3dJQVdN?=
 =?utf-8?B?RHgvQjZUUzRRaWxubHlHRENEdTJsWWI4UlMzSWVDaGNLQW1CdW5KcmxJSzNH?=
 =?utf-8?B?bitzMUZvT09nLysrcG9vTE1EVi9TZkY3bW9hdlQ1RE15aFY4bVNNL0VZc0lT?=
 =?utf-8?B?NGg2K1NwN3lyUkFueExYd1lkMFdteWQrUFlCbWdLR1JXUFF3UUdGaTdUU3JG?=
 =?utf-8?B?WkdneUVzelZDL0U2RGkxeXpORFJXOWRyUmE0d2VWRWp1aTREQ0o2bFk5K3ZL?=
 =?utf-8?B?aDlDVVN2ZnhkQzVXd1daNFZoWG05cTRDODlQZEdiSVY4V2k4NGRxR0RuUjAy?=
 =?utf-8?B?VWw0WUR4U3BwQjJ1S2FpVlFhbUs4NnFPdTdBMzVWOWduSzBzUFBPZWxtYmFB?=
 =?utf-8?B?anY1WlNPbW5EM3czS3o2bjB0dnJtN0FFY3VzWnI0RkVRdXhES01TV0Y4QnZK?=
 =?utf-8?B?SVErK3EvREowYXVQemZuODZCOEkvZk50aWkvNTNnVEY3NXRmZFdIaUdlaEZM?=
 =?utf-8?B?aFhpNFQ3dGFwbUtwL2xMYmVId0FvblM2eTdobGQ2VXhobWRXb2Z0K1VKNFFJ?=
 =?utf-8?B?cDUyYitVREJOMTdQZGM3YjdmaHpvdVl3VjRidnNGWmR4ek9wdWVrQTRacmNJ?=
 =?utf-8?B?bTdpaFE0MFhzYllWSEdyd255VEtaT0Z1dDBIMEFpejFWQkM5T3U2L0VqaU1L?=
 =?utf-8?B?eUlRR2JoWTdiS3gvVHhXVU1QVzFBS0JURWllNlJuNi80NUZHZGRxM0xHbHU4?=
 =?utf-8?B?UUlsaDlpUng4ZUNMV0VPekNHbUxIQVlYNlZPQ2tCOGdzQXRxKzhFMTM0aTJE?=
 =?utf-8?B?S3cybzNTL2ZNWlliQ3ZqVm9vM0lxMEl3em1pdDJmUDU2N1lHRnNQN2Npbkkv?=
 =?utf-8?B?bzZYbUF0SkpnRWxzK3Y1R1VVejVhWnpXOTBBQWVIVmJvYXZReEF1MXVOanN5?=
 =?utf-8?B?RTNtdExDbTJOVmQ5VGlhOVZCdGY0NVZhRkxoTEhPMmVKYmNNY2NDK2V0aDYz?=
 =?utf-8?B?cE42Vk5Lak9ScGMvek1ueFZJcUJERFRlK3lhbUNvQmxkTk12b0NwR0JLMEFy?=
 =?utf-8?B?UnI1RUlWVlMxazdENUJkTHoxbjBxRUUzcERaR2lrQ2Vmekl2SkZYVi9LcERy?=
 =?utf-8?B?M2ZOVDY1QWpFOFFUVnpGZlJJVExlVVh2Rkc3QWQ3UlNYZ3ZYck1mdEN0amVV?=
 =?utf-8?B?dXQ3RkM1M1B1QmJVc1RmQXlXTGpkOGpaaC92QnpSVmg0Z1dCZ2p2ZjhjVzVV?=
 =?utf-8?B?b0g2U0JDQTVsM09kNXRlUkhDeGlvUXE3bm51aGVhRitzOHBDcGJWWHIzV0VL?=
 =?utf-8?B?cGlXZHNic2FrbG91TG5mUjZiMUd3YkpLOVV5MkhwQmdCdmNGZng3cVdQM1VT?=
 =?utf-8?B?ZW9OZHZTNTI3RUxjWVd6c3ZsMlB1SDViZmQ4SUNCYWNuZHZpaEJsZStOMCtl?=
 =?utf-8?B?WDdQdWNRb0JGU2k2QVc1SGFIN3FSVWtsWThaL1FSdlVtcERFbTFVU3VyWFBE?=
 =?utf-8?Q?dQZYY8ziLzZC6+i2Ea+3ya+gJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cccd1a-913e-4cc5-d147-08db2b86b756
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 10:09:40.5683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXe32yKMN496i1atxYeHY1+lnaIuBwmrdYpfi2X50Bh7CIqCuv3i5Ngi2D/BGV5aVktsYvw8/wfTkAD6MmLEng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8483

On 23.03.2023 10:08, Juergen Gross wrote:
> util.h contains a definition of offsetof(), which isn't used.

Coming back to my comment on the earlier version: "not used" isn't true,
but the earlier "not needed" also didn't make clear why it was not needed
(misleading me into making the [wrong] suggestion): The macro is used,
just not in hvmloader/ but in files living in libacpi/ and compiled here
(as well as elsewhere).

New suggestion (which I'm happy to apply while committing): "... which
isn't needed, as firmware/include/stddef.h's doesn't really need
overriding". (The same, btw, is true for NULL, so I guess I'll make a
follow-up patch to remove that one as well.)

Jan

