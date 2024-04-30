Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23528B66C6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 02:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714413.1115615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1b6P-0000LK-MW; Tue, 30 Apr 2024 00:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714413.1115615; Tue, 30 Apr 2024 00:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1b6P-0000J8-JN; Tue, 30 Apr 2024 00:12:09 +0000
Received: by outflank-mailman (input) for mailman id 714413;
 Tue, 30 Apr 2024 00:12:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K8V5=MD=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1s1b6N-0000J2-9R
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 00:12:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4553603d-0686-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 02:12:03 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 00:12:00 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::2af1:bf89:5576:b0f4]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::2af1:bf89:5576:b0f4%4]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 00:12:00 +0000
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
X-Inumbo-ID: 4553603d-0686-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2oicx69g3NndI4oBwZm9eoG6KnzJwoOrvDco+Pyjl2U83662zfOKx5Y/ojQdcx8c3evUWGBwzTTTfIO4TyxsAYQY+uVacWFv63pcCRc/+2zghDHs27drW9H8rJ3MtaVNY7eQY6063ffYabU9HkjxSQOmkZ880CPr3JnSatkKVQ/VX8HmwNQiVwcNqUiW4NBayndAhkoqr+lO3OJ0ZSMBJvLCGHT+UfzpOdl3sDKTF5iunNio3ySLOjEvkqhfAN7G19j7Giqyr4AyKZv2k+ggQv5BJoaJv7Yr3yecPeukKQswuBJSuy2NbdsGT32hngevGiYCfq0HHO8zjWfsUlaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YunsvWqqtQ5s6eFa057QKSD7Sa8jVj08zEQzNNlggk=;
 b=XStPd9raW1GE84JMbOTWGjIaUPWhUnsmESEhHk9qJya0PIW6NsA5jaqYulyDyeolmrJm+pU2/D0yqCPjJwSGreQO9DAXITZ5iDYq8B+7Xxfk9W0n1dRtaujZnsIbGDyXZGh8n7ReDFo7e/u5r4pu0VX7Z4exc2T9JIU03UH8dP2qAl2QO2CGZGUSE2zC8UyebXz8FJQ0VvX75smxtg8IRc3n4FOsE8EOuZ+whEfEMsg1uoeewePAAaqQThoXvzVrYLF8UC+/nK+AuPGBDld55Y60xIKZlZz+3jyEzboZ/34qhNUw1wR2jjNsj0FA2f4o5qoWL2PLKwZqc8mv/CJiRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YunsvWqqtQ5s6eFa057QKSD7Sa8jVj08zEQzNNlggk=;
 b=YGWodBuSbELPvreQK2orhWM98mOVBVaZW6rgrMNs3+GL55gI3tzPdTEV0cAQ1IhsvkfSDKzIIjJyPXRbpVPY2z7K/OW2UEhuWQge95VPsPEJUxC5ArQcI+Vf26ion2Y1u+F/hQ+N+IXnOu3iUcedhMjkzFMqBbd+LkUwPMI3iBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Content-Type: multipart/alternative;
 boundary="------------0vPBalhwZiHNz5xZPm6i5SNv"
Message-ID: <5bea35a1-8521-4527-844e-ff4c6a57fa41@oss.nxp.com>
Date: Tue, 30 Apr 2024 03:11:13 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [VirtIO] Support for various devices in Xen
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "olekstysh@gmail.com" <olekstysh@gmail.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>, Bertrand.Marquis@arm.com,
 michal.orzel@amd.com, Artem_Mygaiev@epam.com, Edgar.Iglesias@amd.com
References: <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop>
 <ZaCOVSuEJtsAj9G5@amd.com> <5fb49c84-0f54-49a5-9106-7f207b3eee4c@oss.nxp.com>
 <alpine.DEB.2.22.394.2404111446490.997881@ubuntu-linux-20-04-desktop>
 <CAJy5ezqVL0d_U-QbTw0hdGASCv=OcwZ1QnBAPcGDnXD_ssaQBQ@mail.gmail.com>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <CAJy5ezqVL0d_U-QbTw0hdGASCv=OcwZ1QnBAPcGDnXD_ssaQBQ@mail.gmail.com>
X-ClientProxiedBy: AM0PR03CA0032.eurprd03.prod.outlook.com
 (2603:10a6:208:14::45) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: b52e8b4f-006d-4a56-d60b-08dc68aa26e5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|7416005|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dERUd0RIQXN2aHgwRVRYaGpseThXWkd4akh4aEdEQW8vdmtlSENzQzEvZCt1?=
 =?utf-8?B?Y1Y3YTkzRW1Ga0NpUmZ4YzRmUEc2UllpK2FybHZrUGh5eWUzUDNJdFhRRzB1?=
 =?utf-8?B?VldqT0luT2FHTnlpdFZnRTU3bER6V2M2c1o4Wi82emxoY2pCcEY3dnA2OSs2?=
 =?utf-8?B?RzJieXhnZkhZeDRkdXdvdklhci9qVzNsd04vWjNVeG1aQi9ycnZ3ajhGRC85?=
 =?utf-8?B?UHRyYll4R216TjhPTUdFSDFlSFpaVVVDT1dUa0hoVjNqZUVhYjlxVFJ5MXho?=
 =?utf-8?B?QkppcVNTZ3RXKzF5bldjbFd4N1NNdXFDQ1V4YUJLVHBFcndNTTIya2hYZEtn?=
 =?utf-8?B?dnBxN01jQWdabmlQejNMaXU0bWExN1ppNmFIeU9TVjdwTjByU082enBYZ0lO?=
 =?utf-8?B?YnY2ZlpZWjIwODk1YkE4Q3VydDYxWHZ3T3h3Q29HNG1QdFBKWTBiTnBYV2Ja?=
 =?utf-8?B?MzZNcXdUOHROWUU5ZDVxUGg0WnBmZ2U1d3RBVzI1U09BSkhPT045cFBxeHpO?=
 =?utf-8?B?U1FVOFl1SjgvZlNDMzVyZlJ6K2Y3T1pLcXdoVjl1M3ZWNjZnWU9TQ3JxL3BV?=
 =?utf-8?B?NmUwZjZpckZ3UUxBNFkyY1YxUzlBSkI2M0NEbnNQSzVHNWFlUlFUMmErZGRm?=
 =?utf-8?B?akV6WW9yc3lHODdxVHpjaG1Ka1pGS0cvaW5mWlpIM0ErZXYxN0g3SUZuMkR5?=
 =?utf-8?B?bnF4Y2JDU2w1dFRaZTBaVDVQL3JrUmVmWnZBUEFrM1hvQWJwM01UWHBWaUhS?=
 =?utf-8?B?dlVxME1jd3MwTEM3UlFPWXZNNUVnaW5KaGY0THZrb0dvMTZ1Z3lrRVZXNGlS?=
 =?utf-8?B?QlFFZ3N1clRNU3ZQVk1oNjVpdmFicDNjTzQzZ1Jza2Y5OFphcWNIeGJ5TEhD?=
 =?utf-8?B?dG9VY0pMVS9xK04rYm9zajh0Mk9MeXYzdW1GRnZRRmVraGI3MEJFT0QyQjdD?=
 =?utf-8?B?UDJ4L3grK3J0UzFYeGtqbkFwcTI0Zy9NTU1Hbjk2YnR3RFhkZFNqTEpTWUxT?=
 =?utf-8?B?eVAxVzYwc1kxbGVLVzdzTmFCZU80QW5ZdFl1VG9qczRuOTM5aEc5ZU5qVnNZ?=
 =?utf-8?B?RGlYRllJcVZFS3E1Yy80amJiMTl5OVJWcWk2cTR4VS9rV0xPdzVmMHQvWDVx?=
 =?utf-8?B?V0RtRnozYlZyRGh5cGNsTjBVNS9aQ2pPZGNhaGlqa1N1RXduSnhKMUNDQ2pZ?=
 =?utf-8?B?SDBXbU81bWNYMmpEb1hXajhlOXU5WWcrYTd1bHh4aTBVL243dE9kY1FQVWpZ?=
 =?utf-8?B?L3M3WlZrcStteUs2ZHREa3BrYm9WdnlYWWsvNEMyVTF3NjVTZHpReHRyUmJF?=
 =?utf-8?B?UGJQYnZJN0s1WS9Ec2pNODd2RnY4Q2t4azl6MFprNFlGSUxUOGtoTG02UGgr?=
 =?utf-8?B?MEx6SzlzdWdBMVJNMlB3Q2FVWE1iRWVzQktCZ2w3dGp5UWVwM1JBNCtNL21o?=
 =?utf-8?B?T1hFYysrTFE0d3hiL3pSei8xRkNURHpNOTRydHhlL3h1SXhobXJIcmVwVVFJ?=
 =?utf-8?B?a3ZIRUF1NE02bXltZ0JaclRPdG8yRjBjZkp5a1l3c3I2WUM4UjJVZU83RUkr?=
 =?utf-8?B?ZDBTaUpIQWMyTDF3VnNsNkxnVmt5dTQyZDJVUHVOT29yd3RINDVWTkFLV081?=
 =?utf-8?Q?37cuyG9Q6jSsYkpAkoAsJmeIBNE9U22z4iafEmvx95VI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXF4SFdxSjhEdzRsZkZ4ZGc0eXN3ck93QjlEcFU3SlVkZnRPM0lJUCtnR0Qz?=
 =?utf-8?B?d1BtQ2IzU1pyUTJWWWhIVVJQZmQ0VlVkZXFTTHptekRpOGFCWk43TU9LdlJn?=
 =?utf-8?B?WWgxUXN6Ny9va21WYmFmS0J1aXNFS0lyaUY0OVpwcFpLUE1TMFZEWXRYbG1i?=
 =?utf-8?B?c2VDQTQ0clpkTGtud3Q1di9MckV4S3ZxcXVnUHFLQW9sQi85VkZWRS9wUWVP?=
 =?utf-8?B?dS9vYmpwM3JXZnZKbStCT0IrK2l6bkVJemFpdGFYRVlWKzdOTUJtQUg1R1Rr?=
 =?utf-8?B?V2x3YWZWQ2hOSThBcXFxRERuTXNXQkpVYkUvZnMvWXNRZ3NFL3h0RFgwUlVi?=
 =?utf-8?B?ZjIyOFB5cytLa0pmN21hVGFTUWFmNlZLTVY0ZWR3ak1ublZYak8vQSt6c0JE?=
 =?utf-8?B?Ni9jOVBrWUd2OUtEUVRIdklhSXE4S1pkZEw3U0FqZS9jOVVjWTk5MGphbFN4?=
 =?utf-8?B?Q0R6UnBOeHRISU9jakRjQnVCVUZZNFRvcnBGa2NmeEFGOUNENTRsRlUvWm5F?=
 =?utf-8?B?VlUwQ3lLTUpMNFIwQTZralBJaGxiUmtIeHc3cGJtWUltbGxiL0RTSWdEdXBG?=
 =?utf-8?B?VnRabXR5dWU5VDMvNWpodGVUc1VSdFdTenZqemh2bnkvMUkrVGxTa3hLelpn?=
 =?utf-8?B?QVdWbWdiREY5RjYyUU9qNkVlNGhHTHFqR3I5TGtKcGczblA2dDd2dXFGdFRF?=
 =?utf-8?B?WWhycjBCM3h2b0IwZXFGc0UxaFdCNk9qalR1blAxSmZZdWd6NWtJRng2eHpk?=
 =?utf-8?B?UWo0T3owZjFhZndMeklidUl2dWNGNDkycmNjLytHdURhQy9VNTY4WjVZVFgy?=
 =?utf-8?B?MnZwaitLTE5uMWdKN1JROCswRjVqR2VaRmtTMHNhZjlsMEgxZ21qNXZ5aDlp?=
 =?utf-8?B?YjJHNWl5b2pSdjdtY0pxeGp2S0pTVGl5dTI1ME0zS1lXckRNeDExMU9XaXR4?=
 =?utf-8?B?V2dnekcrVURoUjZqWmtuaWNVZlJPNHg1aFFabitVRGlmRm0wVUZuckFySll3?=
 =?utf-8?B?QzJ1b3R6aTdwNWREMndoRW9Da2k1K2ttTWtRSXRNaTBsd0RxalFFcXBHUkla?=
 =?utf-8?B?ODl3djdmbFI5KzVsVStUZGQwckVHRnNvZ2JLSGZEdGpJZkNKMHYvWEFOYXBV?=
 =?utf-8?B?YXliWjdBUk4rUGRYR3lMRXY1eEpFQVBtWjFmTEExTDRoanloeFc0SVAvekds?=
 =?utf-8?B?T0hTcWpyaGlCUDVLbkhuZjJNaHM4Wlc0bW9JVit4ZXh0c1J5VVNEU0Fob0ZW?=
 =?utf-8?B?aVJUR3VkRXpPTzR4OStRNGp6bTRxMW9EN3p0VkZJb0FJZUNYdHRqWlVVUGJM?=
 =?utf-8?B?blVvZVhXSksvQ0ZZNHpucGY0Y3RURzdGUktsRE1RckxaTnRlQlIxT3VZbk5l?=
 =?utf-8?B?L2ovWnNLSUt1bTFUbENkNStJdDdlNkFzckRJVDRDNVBqaGNkNU9CQXpJV0pO?=
 =?utf-8?B?S3BsdFlHYWxCZ0lBdWhxNXpHa0VhYi9majAyT0srb2J6UnliTjNvUmhHangy?=
 =?utf-8?B?Q0hXeHBGWHdQMWptdi9UUitwdlAwRXJEaDdTTDhtd1RmZlVrT0N5dFg3QjNF?=
 =?utf-8?B?Mjk5V1ZnM0NXdGx2SXJCdnpZMUtTVjVHelVCYTZNcDVZM2VOL3gzcWVYYkFx?=
 =?utf-8?B?b3BBMXFKaGJJNm9xcjBpd21OZzNvQTRIWDI1TXZvOUlQWWFPQitYMlBIQnFX?=
 =?utf-8?B?MHVIMkc4ZkpFTVFPVy9IOEtTQXY4UGc5VU01SEp3RzMwQU5WemNzNlhXUkwz?=
 =?utf-8?B?TThDWGZuRVpKOC9NRlJ0RXYwdTE2dnN0RkFxUVpreHlJOXBiM3R4ZStJYkh3?=
 =?utf-8?B?eEVWYmxhZjVzVjBwYUxpcG51MHFLWmtlT2NOVTY3bExpWXg3Y2swODAxc2Yz?=
 =?utf-8?B?TTk3MnZlQW94RERFS0FkNlJGWWw0SUlNOXpUdjd5VWNPcVpuZW9EQjNUbkFB?=
 =?utf-8?B?blhJU3RVS0J0dDEvSHZQYWdqQk5KZ0RmYUZmODJLSEhKc2tlbjdlYUdRZENX?=
 =?utf-8?B?STc1MFVFVmlSY3JxTzlGa0hUcTNrbW43NmF1WFgvUkMzRXV5L3FpNFpURDF4?=
 =?utf-8?B?d3RpOENFSG9WL2paQ21henY0R3VrTUIrcENqL3BGcElCMDM2QXFHUXluQjli?=
 =?utf-8?B?QSt4aGJUZ1NGMUlpdHV0dmJrR0NMYUYwaXkvMEl2emVoRjJmSG9tMmpTMnpU?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52e8b4f-006d-4a56-d60b-08dc68aa26e5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 00:12:00.6829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/zmhzkWsDZxO756Ulqy1zJ5OT2kpEkTi6ExC/LlfVkP6MQZpjk6ipRg7mR4DtCqhcl16MgDgx02Dy8FNzqUqiEwHEhPz3PYqJaKzFACnSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991

--------------0vPBalhwZiHNz5xZPm6i5SNv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/04/2024 11:35, Edgar E. Iglesias wrote:
> On Fri, Apr 12, 2024 at 1:23 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>
> -Vikram +Edgar
>
> On Thu, 11 Apr 2024, Andrei Cherechesu wrote:
>>> I've managed to successfully get a DomU up and running with the rootfs based on virtio-blk. I'm running QEMU 8.2.1, Xen 4.18 + Vikram's downstream patches, Linux 6.6.12-rt, built through yocto with some changes to xen-tools and QEMU recipes.
>>>
>>> However, when also enabling PV networking through virtio-net, it seems that DomU cannot successfully boot. The device model args passed by xen-tools when invoking QEMU look exactly like what Vikram said they should.
>>>
>>> While executing `xl -v create ..` I can see some error regarding the device model crashing:
>>>
>>>         libxl: debug: libxl_exec.c:127:libxl_report_child_exitstatus: domain 1 device model (dying as expected) [300] died due to fatal signal Killed
>>>
>>> But the error is not fatal and the DomU spawn goes on, it boots but never reaches prompt. It seems that kernel crashes silently at some point. Though, the networking interface is present since udev tries to rename it right before boot hangs:
>>>
>>>         [    4.376715] vif vif-0 enX0: renamed from eth1
>>>
>>> Why would the QEMU DM process be killed, though? Invalid memory access?
>>>
>>> Here are the full logs for the "xl create" command [0] and for DomU's dmesg [1].
>>> Any ideas as to why that might happen, some debugging insights, or maybe some configuration details I could have overlooked?
>>>
>>> Thank you very much for your help once again.
> Hi Andrei,
>
> I'll share some info about my setup:
> I'm using:
>
> Xen upstream/master + virtio patches that Vikram shared
> Commit 63f66058b5 on this repo/branch:
> https://github.com/edgarigl/xen/tree/edgar/virtio-base
>
> QEMU 02e16ab9f4 upstream/master
> Linux 09e5c48fea17 upstream/master (from March)
> Yocto rootfs.
> I had a look at your logs but I can't tell why it's failing on your side.
> I've not tried using a virtio-blk as a rootfs on my side, perhaps related.
> It would be useful to see a diff of your Xen tree compared to plain
> 4.18 or whatever base you've got.
> You probably don't have
> https://github.com/edgarigl/xen/commit/63f66058b508180107963ea37217bc88d813df8f
> but if that was the problem, I'd thought virtio wouldn't work at all
> with your kernel it could also be related.
>
> My guest config looks like this:
> name = "g0"
> memory = 1024
> vcpus = 1
> kernel = "Image"
> ramdisk = "core-image-minimal-qemuarm64.rootfs.cpio.gz"
> extra = "root=/dev/ram0 console=ttyAMA0"
> vif = [ 'model=virtio-net,type=ioemu,bridge=xenbr0' ]
> disk = [ '/etc/xen/file.img,,xvda,backendtype=qdisk,specification=virtio' ]
Hi Edgar, Stefano,


Thank you for your support. Just wanted to let you know that I've managed to run everything just fine. After some more debugging, I figured the fix I needed was actually in QEMU, one which had been already merged upstream (available in v9.0.0) by Peng Fan [0], following a discussion a few months ago on this list. And since I'm running v8.2.1, my QEMU did not have it.

So I can confirm granting DomU access to rootfs from an SDCard partition over virtio-blk also works. However, if I use the usual Xen PV drivers for block + virtio-net, it does not work (device model fails to spawn). But if I'm using virtio-blk + Xen PV Net, it works :). Also both VirtIOs at the same time work.

This is the configuration:
    vif = [ 'model=virtio-net,type=ioemu' ]
    disk = [ 'phy:/dev/mmcblk0p3,xvda,backendtype=qdisk,specification=virtio' ]
    extra = "root=/dev/vda ..."

Also tested them with foreign mappings and with grant based transports.

Are there any other virtio device types you managed to test so far besides these ones (over virtio-mmio/virtio-grant)? Has anyone tested the rust-vmm vhost-device backends from Viresh with Xen?


Regards,
Andrei C

[0] https://github.com/qemu/qemu/commit/9253d83062268209533df4b29859e5b51a2dc324

>
> xl launches QEMU with the following args:
> /usr/bin/qemu-system-aarch64 -xen-domid 1 -no-shutdown -chardev
> socket,id=libxl-cmd,path=/var/run/xen/qmp-libxl-1,server=on,wait=off
> -mon chardev=libxl-cmd,mode=control -chardev
> socket,id=libxenstat-cmd,path=/var/run/xen/qmp-libxenstat-1,server=on,wait=off
> -mon chardev=libxenstat-cmd,mode=control -nodefaults -no-user-config
> -xen-attach -name g0 -vnc none -display none -nographic -global
> virtio-mmio.force-legacy=false -device
> virtio-net-device,id=nic0,netdev=net0,mac=00:16:3e:13:86:9c,iommu_platform=on
> -netdev type=tap,id=net0,ifname=vif1.0-emu,br=xenbr0,script=no,downscript=no
> -machine xenpvh -m 1024 -device
> virtio-blk-device,drive=image,iommu_platform=on -drive
> if=none,id=image,format=raw,file=/etc/xen/file.img -global
> virtio-mmio.force-legacy=false
>
> Cheers,
> Edgar
>
>
>> Edgar (CCed) has recently setup a working system with QEMU and the
>> xenpvh machine for ARM. He should be able to help you.
>>
>> Cheers,
>>
>> Stefano
>>
>>
--------------0vPBalhwZiHNz5xZPm6i5SNv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix"><font face="monospace">On 12/04/2024
        11:35, Edgar E. Iglesias wrote:</font><br>
    </div>
    <blockquote type="cite" cite="mid:CAJy5ezqVL0d_U-QbTw0hdGASCv=OcwZ1QnBAPcGDnXD_ssaQBQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Apr 12, 2024 at 1:23 AM Stefano Stabellini
<a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a> wrote:

-Vikram +Edgar

On Thu, 11 Apr 2024, Andrei Cherechesu wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite"><span style="white-space: pre-wrap">
</span>
          <pre class="moz-quote-pre" wrap="">I've managed to successfully get a DomU up and running with the rootfs based on virtio-blk. I'm running QEMU 8.2.1, Xen 4.18 + Vikram's downstream patches, Linux 6.6.12-rt, built through yocto with some changes to xen-tools and QEMU recipes.

However, when also enabling PV networking through virtio-net, it seems that DomU cannot successfully boot. The device model args passed by xen-tools when invoking QEMU look exactly like what Vikram said they should.

While executing `xl -v create ..` I can see some error regarding the device model crashing:

        libxl: debug: libxl_exec.c:127:libxl_report_child_exitstatus: domain 1 device model (dying as expected) [300] died due to fatal signal Killed

But the error is not fatal and the DomU spawn goes on, it boots but never reaches prompt. It seems that kernel crashes silently at some point. Though, the networking interface is present since udev tries to rename it right before boot hangs:

        [    4.376715] vif vif-0 enX0: renamed from eth1

Why would the QEMU DM process be killed, though? Invalid memory access?

Here are the full logs for the &quot;xl create&quot; command [0] and for DomU's dmesg [1].
Any ideas as to why that might happen, some debugging insights, or maybe some configuration details I could have overlooked?

Thank you very much for your help once again.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi Andrei,

I'll share some info about my setup:
I'm using:

Xen upstream/master + virtio patches that Vikram shared
Commit 63f66058b5 on this repo/branch:
<a class="moz-txt-link-freetext" href="https://github.com/edgarigl/xen/tree/edgar/virtio-base">https://github.com/edgarigl/xen/tree/edgar/virtio-base</a>

QEMU 02e16ab9f4 upstream/master
Linux 09e5c48fea17 upstream/master (from March)
Yocto rootfs.</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:CAJy5ezqVL0d_U-QbTw0hdGASCv=OcwZ1QnBAPcGDnXD_ssaQBQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I had a look at your logs but I can't tell why it's failing on your side.
I've not tried using a virtio-blk as a rootfs on my side, perhaps related.
It would be useful to see a diff of your Xen tree compared to plain
4.18 or whatever base you've got.
You probably don't have
<a class="moz-txt-link-freetext" href="https://github.com/edgarigl/xen/commit/63f66058b508180107963ea37217bc88d813df8f">https://github.com/edgarigl/xen/commit/63f66058b508180107963ea37217bc88d813df8f</a>
but if that was the problem, I'd thought virtio wouldn't work at all
with your kernel it could also be related.

My guest config looks like this:
name = &quot;g0&quot;
memory = 1024
vcpus = 1
kernel = &quot;Image&quot;
ramdisk = &quot;core-image-minimal-qemuarm64.rootfs.cpio.gz&quot;
extra = &quot;root=/dev/ram0 console=ttyAMA0&quot;
vif = [ 'model=virtio-net,type=ioemu,bridge=xenbr0' ]
disk = [ '/etc/xen/file.img,,xvda,backendtype=qdisk,specification=virtio' ]</pre>
    </blockquote>
    <font face="monospace">Hi Edgar, Stefano,<br>
      <br>
    </font>
    <font face="monospace"><br>
      Thank you for your support. Just wanted to let you know that I've
      managed to run everything just fine. After some more debugging, I
      figured the fix I needed was actually in QEMU, one which had been
      already merged upstream (available in v9.0.0) by Peng Fan [0],
      following a discussion a few months ago on this list. And since <span style="white-space: pre-wrap">I'm running v8.2.1, my QEMU did not have it.</span><br>
    </font>
    <font face="monospace"><br>
      <span style="white-space: pre-wrap">So I can confirm granting DomU access to rootfs from an SDCard partition over virtio-blk also works. However, if I use the usual Xen PV drivers for block + virtio-net, it does not work (device model fails to spawn). But if I'm using virtio-blk + Xen PV Net, it works :). Also both VirtIOs at the same time work.</span><br>
    </font>
    <br>
    <font face="monospace">This is the configuration:</font><br>
    <font face="monospace">&nbsp;&nbsp;&nbsp; vif = [ 'model=virtio-net,type=ioemu' ]</font><br>
    <font face="monospace">&nbsp;&nbsp;&nbsp; disk = [
      'phy:/dev/mmcblk0p3,xvda,backendtype=qdisk,specification=virtio' ]</font><br>
    <font face="monospace">&nbsp;&nbsp;&nbsp; extra = &quot;root=/dev/vda ...&quot;
    </font><br>
    <br>
    <font face="monospace"><span style="white-space: pre-wrap">Also tested them with foreign mappings and with grant based transports.</span></font><br>
    <font face="monospace"></font><br>
    <font face="monospace">Are there any other virtio device types you
      managed to test so far besides these ones (over
      virtio-mmio/virtio-grant)? Has anyone tested the rust-vmm
      vhost-device backends from Viresh with Xen?</font><br>
    <font face="monospace"><span style="white-space: pre-wrap"></span></font><br>
    <font face="monospace"><br>
      <span style="white-space: pre-wrap">Regards,</span></font><br>
    <font face="monospace"><span style="white-space: pre-wrap">Andrei C</span><span style="white-space: pre-wrap"></span></font><br>
    <p><span style="white-space: pre-wrap"><font face="monospace">[0] <a class="moz-txt-link-freetext" href="https://github.com/qemu/qemu/commit/9253d83062268209533df4b29859e5b51a2dc324">https://github.com/qemu/qemu/commit/9253d83062268209533df4b29859e5b51a2dc324</a></font></span></p>
    <p></p>
    <blockquote type="cite" cite="mid:CAJy5ezqVL0d_U-QbTw0hdGASCv=OcwZ1QnBAPcGDnXD_ssaQBQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

xl launches QEMU with the following args:
/usr/bin/qemu-system-aarch64 -xen-domid 1 -no-shutdown -chardev
socket,id=libxl-cmd,path=/var/run/xen/qmp-libxl-1,server=on,wait=off
-mon chardev=libxl-cmd,mode=control -chardev
socket,id=libxenstat-cmd,path=/var/run/xen/qmp-libxenstat-1,server=on,wait=off
-mon chardev=libxenstat-cmd,mode=control -nodefaults -no-user-config
-xen-attach -name g0 -vnc none -display none -nographic -global
virtio-mmio.force-legacy=false -device
virtio-net-device,id=nic0,netdev=net0,mac=00:16:3e:13:86:9c,iommu_platform=on
-netdev type=tap,id=net0,ifname=vif1.0-emu,br=xenbr0,script=no,downscript=no
-machine xenpvh -m 1024 -device
virtio-blk-device,drive=image,iommu_platform=on -drive
if=none,id=image,format=raw,file=/etc/xen/file.img -global
virtio-mmio.force-legacy=false

Cheers,
Edgar


</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:CAJy5ezqVL0d_U-QbTw0hdGASCv=OcwZ1QnBAPcGDnXD_ssaQBQ@mail.gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Edgar (CCed) has recently setup a working system with QEMU and the
xenpvh machine for ARM. He should be able to help you.

Cheers,

Stefano


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0vPBalhwZiHNz5xZPm6i5SNv--

