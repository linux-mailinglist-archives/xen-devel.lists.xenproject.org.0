Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C874B617D20
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 13:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436509.690611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqZld-0000gr-W2; Thu, 03 Nov 2022 12:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436509.690611; Thu, 03 Nov 2022 12:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqZld-0000e5-Sk; Thu, 03 Nov 2022 12:56:21 +0000
Received: by outflank-mailman (input) for mailman id 436509;
 Thu, 03 Nov 2022 12:56:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZPm=3D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqZlb-0000de-Q1
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 12:56:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7dda0e1-5b76-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 13:56:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9006.eurprd04.prod.outlook.com (2603:10a6:102:20e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 12:56:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 12:56:14 +0000
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
X-Inumbo-ID: e7dda0e1-5b76-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evLDLtKE4GNlHPJau7PRxggMOZ8IvK6bjoO4vNUnzQxFeNT8kcrgPPrbrxgJ4lwCeVqa7swgmMh1Rb5p5WGn14kJRsHXjiKsgRFfXq4pKtf92BMS6AYGWFQadMuYupzRxk0HwV3oewrqStFP365YZDgVnPoBaqNlIsxq4PZZd9DPQCamtX+3nft5YehDsd/60kQ+3oKxARV8oyDWjsy1WXLOzkmHNdsGwawUT85crOjl+6hDOxslnd4qMV4YKPrwpOmy0SX/8D2XtfSgaJ7QhyEyjKKQXa+K59pH8ZJeO6hrhqudEd+MetYRS1uhc4GTfULLSlkSqo+qZ0fY75TOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9f2gBqeoiq55r67JYtIZwPfGfWOyDmu9Wq/m5d9fQn0=;
 b=JKv2FqrgwfxQbyoBChCTr1VxggXiLSfjx7gihgbuY1boYR7ZHevkth5MqXQMWb4o/JO17YsVfQOFJdMJtVI3TmXTZhaLSlHBG4tzUbHKzb27aFnpEn7yF6Y7p3Ww2JdxP0ZcvJaVid0KDHZ6Ht/3/5TaZTNGRNE8cqKBoEmb4zVk7aP+/xSpO+jlGr7ZzAiBUSUdvnBqi8bfYkSryIlEffs48GFAiSGgn5vUpoRw1UsEOpdCE8KzwwQn2CQy8XcOClVrYcTBpafVWY7fkYGFEaMZfiix3A9shA6LpQjDg4QVFvtm8iPyFXtrye6W5keEktVsLMw3P0DIYB6dV+UoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9f2gBqeoiq55r67JYtIZwPfGfWOyDmu9Wq/m5d9fQn0=;
 b=Cv6nmzJcujx0//Azd4DkdPk7ilLYpKbfyUr5rZLnBTSxP3gBv7Lap2JwDUpSrnAXuPyWKGkTDA3LrNullhZG6AL4kCy5kngiPrwndVfB1H8VxWIzwChJmqjod2VA265I/d/7XYj8YXxZVhDV3oeD+KWW9nV8G/T+M2Ad/xPhCc7CRZW3VyLKpt8Zu+5QXfQi6nGsxoiL5n/gf75nwmkb/JuaribQgorniRJD0+jzjW9icrpXxhCMuX4wWhKUlpbnJ6BHmIWEcgqcvBItYFaRoik4NfKMDJHb/v9j5uUyNGl8gPj/qusELBqPBMk3b0FEUp6KZW5Bzuzbi0U85h5o6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebdcad0e-8e9b-e07f-c7d8-779b2b31168a@suse.com>
Date: Thu, 3 Nov 2022 13:56:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.16.2 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6fb70a-cd92-47f0-343f-08dabd9aca92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RtNf9vh1dXyd+Zl/EvjUilU1roww8inQn4uUwWXu6JtJMwCxP7bkpcLjOyvW6/Gqw4fv4I0mmV8lrwqhvi6H4BM5VP2PaCNaSHx1HRcH0T5FhZmX96qM4IfLVlJ7D7DGQ+SyFpMYWe9pP8257wc8AhMMcbnFtXcTN1dtEt+7rXaaJRlKspsD4RN0vGXer29J9lvoi9oPIxPt/CeWjuCmbgYjoc4tdL+yJMNR1JNxkWLad1hlMCjTWTSr/HjM6qJnOBYYBjrHAwos4JhgApB6LQMXo1iUiCmIJRU2LvXR5YoUsxsMQ8PWK5CVEyHwhQCNdvXnmBmqdZMC6kcdwDAUfrCYxp+qmVgWzwXt4j/MbZACQRbtEDUDpEhwVXMVsYAFiTIGDNPr3Y6z/DTHbePs41WbqQelwO1J6Ti7P4pv7qTIz/LM/Jk57uUQaNhwP40BbenaW+6L/wFAOF8UgcwEgYrFty6c1mstDgzL3xZcpMOJfTFxHE9bZ5EBhuP+lmuOP0Oknss9e9U3dO8Nvjpn7KOQxytaU2ZQNYCI55wIuWxD84YAH93eeQxu84FjnMNZTSXrp8Ltk36hVxPbTXvXqF4soXwYT4ltYVk1VmTChe3Ax3ivwLrOVGcernNmHi6Jkzc1blk+j2Dj34yGBAe9CWNtgsgRsyVtfJbwozAQzeUzv1ctqsjMGzzXIVKzuBNAvfkhFvMQ8zx77sBRA4nH1O9O/WSdlvn1ZKcwJhzjvB7W/MYdl0bAtnMG/9+r7x2O4tzvVsgt7QCbXR2aiGW8bgVfoV73u08qvul7RrvfRhe4kfUNtSjBRXerjdOdl1PQikY0v9x92bknDUI0ux8qLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199015)(38100700002)(86362001)(83380400001)(31696002)(5660300002)(26005)(4744005)(2906002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(7116003)(66556008)(6506007)(6512007)(186003)(450100002)(6486002)(316002)(2616005)(6916009)(478600001)(966005)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWVzOWJiVDlxY3grbU9zK3NYRk16YVp2cFkybkVOWksvclNoL2p1aGhudFhi?=
 =?utf-8?B?VW1UaTFLSUozTEk1ZDJwNDloK2hZL0FJZHloS0VQTlFmVCttNjVjWUlrTkZa?=
 =?utf-8?B?Nkl0K2Z0M1VFRTIwbVU5U3FxT3Q3QitSb3dNVkRWMlh3YVplTnprM1pLV1FU?=
 =?utf-8?B?SWE1WUpQOUx2bWZ6aWVDdXljeEdzYnFkZWV6WHZacERWRWVZQThRWFVUZ2Qr?=
 =?utf-8?B?Y2hPOUNWYTlGU3h6QVExRHZCTlFhNmpGTGdSbmNrT1V2eTlDTFVlWG1vYTZU?=
 =?utf-8?B?U1NJSlMzQU5aZkJSckcxc3dRUTl2QklUb1phNDJlVnpkSXFKaE93THRhbFFS?=
 =?utf-8?B?UGdKWVlPYk5wZWJIZ2IzeU11L0tXdUEzVmV3TkdNMmpLVFRpREkvZGE4MUNh?=
 =?utf-8?B?VFd4em1MU3lVZFhkamF2ckdvVlVJUExWalhaVGFVaGVGQ0FwT0NGa1I3WWkv?=
 =?utf-8?B?K29WUFYrbysyMmppM1U4SURPWGEyWlk2ZksxSldabXZrNER5SWw4OFlRY0JT?=
 =?utf-8?B?T2dXOGJVb0xSNkcxMzlTS1g3Rkdna29SZGluQklzemtvSHd1cnFXdXZ3YVo5?=
 =?utf-8?B?RFBZWUE4OHF2cEhqZ3N6c1hNa1BSOHYrbjlIY0x0VlVWbXo3Vk9pTzlrcUsz?=
 =?utf-8?B?TzJMd1pMekk0MzFXejIvdUlNWFZvZjljaFR4RmRDNjNKempTSjhGUE5McFox?=
 =?utf-8?B?S0l2ZVRyakVLV1MwdkxPNnYvemFzTThmYkhtenczbFA3NTVHTTllSHlVcFVS?=
 =?utf-8?B?WFJpL2lBMWV3OFVVTnRUeGlUTDdhYmlSNXcrN21qeU5lYTVCM1dyekU3anF1?=
 =?utf-8?B?Uk1EeTNZcmEzZGl3VFhTN3BWa0J2QzR0WXYyQktTLzZ3ZmZub2NEbUZPNncz?=
 =?utf-8?B?Q0FkQ0NxK09qS1dnZG5jTGVJaVZMK3ZyTUVLZlhMeFhZRGIrZGlmN1MrZ0kx?=
 =?utf-8?B?WWc4dUVwcy9KSTAvYVAxMDcvd2NUYWVidStaQ0pkK2Y4dzkyak0yVXVHRkhh?=
 =?utf-8?B?dWVyZVlaUXVKS1FGZE1wK3FWQ0M5VTMzazRKZ1RPOHZ3L01YbHlna0Y1N0w2?=
 =?utf-8?B?cFloMWd1VmRZLzVDTVhTSG9mY0hndmVoTTdDOVQ3dmxDdE1aYzl2eTZ5cUVp?=
 =?utf-8?B?ak84R211RkhUbGt4aEhSTnpBankxOGNxU1ZSeUtsZDVudW5wWTdMdE96dk8v?=
 =?utf-8?B?SkNHWjdGanFjWTVTYXhtUjdsc1A2L3NCdmtCcUJvWTQwNUczSDA5U0JNd2F1?=
 =?utf-8?B?SUp5ZStWdmJiRGpzbHpMNDUrUFM5QTV5a28vWFM2UE4raTROZWRvR3dUUmwv?=
 =?utf-8?B?T0p4a3RXV1JRdklVTkhDaU9jR3ZMcFpWZytYL0dYNS9CVS9mM3NzWjUzZ2U1?=
 =?utf-8?B?cmFwV0F3eGdMQkFxNEdnVGNBakEwZU9UT2NwQUlXT3JjL1RTWjVOdlh6ZHRS?=
 =?utf-8?B?d3lPcjlPMGY2cGh5UmJoaWtkbkkvbnM4ODlGWTVLbUt4eENmNmpBeGdXYW5F?=
 =?utf-8?B?TjdQOVc5QWlYYjNyelhIRzRydjlMZjRkd1JESm93eWlidGJ5enp4OWt3N0J1?=
 =?utf-8?B?SEY1dWVia2pqOExMbXFlS05raG84RGxxQUdHSGdnbXV5NWw3MjA4bVdGN0RJ?=
 =?utf-8?B?cE15REZiSnFpaU81anpyUDJRTGF6TGV2cGtlckRqR0VlYzA5NFBtSk85SmNv?=
 =?utf-8?B?ai9PaGNJV0tHNzlqQ2FZT2ZkbGwvb09Ja2thWG85SWdGVGVXOWU4YmQ1bmNl?=
 =?utf-8?B?M0NwMk9ldVF4V3YrNXg1ZmtBdWdlZ1FwOHc0bzVhZTEyVXdFK2hQaWVuUURn?=
 =?utf-8?B?TEZKcWhiOTE0WDdHbkUyb1E5ZzBXZG1yaUZqREZ5VjNDZGNXbHlUWSt2ZlBS?=
 =?utf-8?B?VXhNVkZRSDkxMUc3VUI0OHZMV2NmVGo3SXJRYTJaOUdQaFZNTlRHeEU3OUx4?=
 =?utf-8?B?Z25KNUpnZno0bXJFOTMwZ2t3YXp5bGswaWcvK2ovZUhQODYwUnQ4L0Rtb2p0?=
 =?utf-8?B?VkhjMDM2bXFkdVpwYmJJV2dudS96ZlJPSEhGOW14OEF4V0hrUEZwYWhxUUZN?=
 =?utf-8?B?WGc3bndmWGNNZ3RFd01KdGZJcnlKd2Q0TzkzL0tycXE1OHp3K1QzRVlHakRt?=
 =?utf-8?Q?XPGIhGBulsubcYHaOt4yAhpP4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6fb70a-cd92-47f0-343f-08dabd9aca92
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 12:56:14.8945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGr8vkNQOEivvl7l42dZ12DIkUZ6sm7OSHAkqEsebYwzKHQ+7R/5KTcQBws5X5n/mDwsJ9JyKlCchAjMEEo7vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9006

All,

we're pleased to announce the release of Xen 4.16.2. This has been available
for a while from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.16
(tag RELEASE-4.16.2) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-16-series/xen-project-4-16-2/
(where a list of changes can also be found).

We recommend all users of the 4.16 stable series to update to this
latest point release.

I apologize for the delayed announcement.

Regards, Jan

