Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0A66CD24E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 08:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516063.799581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phPe1-00079x-M4; Wed, 29 Mar 2023 06:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516063.799581; Wed, 29 Mar 2023 06:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phPe1-00077O-I7; Wed, 29 Mar 2023 06:50:53 +0000
Received: by outflank-mailman (input) for mailman id 516063;
 Wed, 29 Mar 2023 06:50:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phPe0-00077I-EZ
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 06:50:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09520038-cdfe-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 08:50:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 06:50:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 06:50:46 +0000
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
X-Inumbo-ID: 09520038-cdfe-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0nYBF8Y7ZxO88hnGgZV+GYYppJcP0ey9mWHIZpCd+HRIjs3JRQOpBKac4oX6Lvai1vnZ+y5P8P4kp9PVDzi5I6TtH5AEbxFYRZKyRuvQjAzhSMtlOOuYvYzy/weKRdYYdHVS1Kqf85mjhZlVSKCq/9m5FzgdVtve3uCiekuURKtxxzPaUcAUAmMPwk3+xmAdEJPP+cALloJsiMat8XDm/pVmYYq/GCUeQkARkwLj0OrePvFzmpHC56hz7hqVAP2H+L88qSJevarvp8NKwXfIhwjHAianzNoUDG44hkIHDo0vUDmOnjy1GiyK6HWyH9sNLfFSDi0qIR0UvnWxW9/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SC8JjrPz6uqOyyhMgMFiAFkMiLXWPS32xD/kCYDQ6Us=;
 b=GcZ+2cXrbqawfheG5FfdglutgEDxA2MLrpQabo4iff8oqr/bolQTTu084lakZSv1FsbRJJDiMUuzbQ2PcnLvfLhzLCS9xoUO1pymqCxzut5PtB6lZmhAHajZsb0T2ngCqCK6tx1+B2TJn3T/Vz5fH17G8JeVqT7o3RhRRFfEmet5B0DmjoXsC0SD9VHJpwTNPTzyf59wTLjVIg4wwl2eZmq7z7yEidL7autCqIaRLXKHpVGdcFbaxEfq4ssfJ6rtIr3cWHqoZc87IgGynsn6N8KybOAVrZJpC0Xz8lQ6k+WkI8ihRG6KVuPHZ8xDeSDBVYRumHaob8aGKdeRzVbfKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SC8JjrPz6uqOyyhMgMFiAFkMiLXWPS32xD/kCYDQ6Us=;
 b=T48QqwBx6XBWyMndpIiM0jMOkO4WfiWlJEMV80pEnKQasTG91fNHSAkUUj3nB6DCb+6pfhXiktd2IDPX24moPyMUl1IhcQLSRIBv75dXdySliB+lrA0I6iMCv5TWX9RB17g40dBV9lbd+s8Mk1mGQnR7vpkmrWebSn4LPS1rOJO4e0PZGECwYiwwYUiG0lJyyuBa5WU3rESOung5+1Kb1ajB3DbJtht1V0aaOE2XvT/AacSJ+RD5w12yEtU4IjKL7dN/U6vZtNf9IvnmEkcjjcc21ieLQdMwO78iio947PFRuLyuXO7zQyl9URZ3jSDsoXe9rXTEYhMBV548xZc/pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e96dec5-1575-3561-c61f-ee188c884b9a@suse.com>
Date: Wed, 29 Mar 2023 08:50:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ns16550: correct name/value pair parsing for PCI port/bridge
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: afc99936-8446-46c5-d4bc-08db3021ec6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nhMY8KW7+I7MXFzt/Un5DIS7Mcr5nYlLvu4B2w4Zx/jhCLfEolJ3KkP947HHkfiQ39Ksjgjo0O6EzsAQfMBGxfdNi24lG4qWrhrL7WcuICWh9cz8seYR5/jPI830cvUB1RfW2gjti3QDrV+TzNUofXR9tpZH6sVNZxgq2SeoaX3MkRKUyaHc3MSGAjeZtIMF9GP+the/+B8axWc0tw/+BuTKf6CWT3/tMmJbpBDVY9LmYBicoRfayZizjyz2YdYrpRSTTFKEbGcQfdixwJfdyMEyQlbPe7GjTVen0hCojsd96DsbH5+ClkycNNgtPrSM5xCRXGrnCZU5WospP9ruFHTBUWHzWgjiApMKCpt6HOz/W3SCMSKWAhb/kPfW/ndKYSdh8CEOB14u6ylNlFCe9B1Mijo1TPxfaMJceI+T3K1DF1kSW4ZSsCwFKnEUEZGZJxVI40NT0WBYTlIdsWgWzyKnmjo5QAbX0dLCrXQ/3IyeuFu5tHOB805g3egjX7Wb3xjane6/mLenjcaFeKojizWassyIdxr6zh5A9lnrWXN01YTg0qcIK3oATePWEhkAKHKWZzZ4JBoN128qUxZXJfWkZul4jnx69WFY+wu9XMXEd5j6199sPVgq3HkHorkbXwhAg5XhtMFjLZ9S1sD9iQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(26005)(6486002)(38100700002)(2616005)(186003)(2906002)(5660300002)(8936002)(6512007)(6506007)(36756003)(54906003)(478600001)(316002)(86362001)(41300700001)(4326008)(31696002)(6916009)(66476007)(66556008)(66946007)(8676002)(83380400001)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEZLcDltY1N3YkUyYU1YZWZKejZrdjFEMHlydm93NS9nYzZ0OWR4dmFFc3o1?=
 =?utf-8?B?c0RJbjdnemJNNXRUeTFmUnUxeTFqTWJHMU0wVmZjTmgvQTlEOG1XMzgxVEww?=
 =?utf-8?B?UEZvUnAzemR5SHdmTXFHVmk3Qzk1eGNMOWJGdUd3T0h2b1Fsdk5BZGtETVVK?=
 =?utf-8?B?OU9ERG91KzJ6V29zajRVWlFFR096S1p2ZXBtWUVnRE1FMlFMM3VkWVRqOStz?=
 =?utf-8?B?bXBIWi9Vb3k1M0VGb2VZTkJxZUYvZG9VR1MyVXNCTFNUb0hFMVU3Vi9Id3Ji?=
 =?utf-8?B?Nm9udVVCVTVNZ21LTXpBRTZhQlVjQUh6cmlHWjZzUWpZMmpFVDZEenpNMG15?=
 =?utf-8?B?UmdESk5CaE1qczJYNWlDQmVCbFpEVU1FdkhGS3ZGZlVaSmZxSXdRZnhFaUdm?=
 =?utf-8?B?OE11MjZRUWR3NGdGNXpXN1lld1c4TlN1UXBHbmZveHkvZnpzdjlhT09aVTdp?=
 =?utf-8?B?STZONUlYUTY3b3kwVFJvYXdLTHoyQzNwMUp1T29NaFZTS0l4dlRpVEczTVdG?=
 =?utf-8?B?VVhkcVBFaDBHaTRMbEQzYUIxNjdZZTJJT1ovVnpQWmRGTmNmUk5wRk5XQ2NK?=
 =?utf-8?B?cGx5YTViM1c1YTUrdU11RXdKTjJ5MTNsQ0VrMGJjcGhOQ1dTdFJ4YmJ6TjVo?=
 =?utf-8?B?N0JaZExuT1dGUVZHU216RzB4U1ZhMlZPd0NGNGpFbkNxeDM3bm9WRXVJU1Iy?=
 =?utf-8?B?NXoyYUU5ZkRPYVhhdVV1anM0QUI0WXduT2piRVBlU2o3UGVsWThNbjdKVzhN?=
 =?utf-8?B?ZkJtd3VUWWNFNW5NM2dmWHdNQXBhSWV6TXRUcWFWQk9POVV4NGdQNkRkNVp6?=
 =?utf-8?B?OVBIT05RaXFUY1ZBRDB4a2pxYWdkRUVBc3ZnRmNidlBDWGlCU09FVGpzS3Ja?=
 =?utf-8?B?MUZOQUJuWnBaSXc2TTFvUFpIbGVjUnJrMEdaMm9BSUk0ZlJ3KzY2Q2JPMUc1?=
 =?utf-8?B?ak9SaHQwRDFzZzJDNnJ1S3d3SnNmOVFlYkJjMHZJUDlIbDF2SW92SnZuUkRv?=
 =?utf-8?B?SVgrSkZFWUh3eFB2dFFRdGtjMElnQ2lDSzhlRkFxcHJUcmlVSGtTTTVob3pV?=
 =?utf-8?B?WkZpdXhhV3hHa1ZUcHIyOWJWS25LWVFWcWpLeVBNTnhmb2FxTXM0MzYzd3hM?=
 =?utf-8?B?bFhiUVRqc1ZrYzNmNmJqUlFQMkFzS2dKQlZHQmdFb2xDVFBuTktXc2pRQjY0?=
 =?utf-8?B?Ny9pL29UcWlYR0tzREFPQm90cWd4Y29nYm9KY3duVDBsZEFSbStCSHdnallh?=
 =?utf-8?B?S0xib0Y1cFJHVVpUdWk4V0h1aTEyZDdCMVdMajc5RGtqM1JSY0xPQVpxOEMz?=
 =?utf-8?B?QlR2S2lzSlZXMjZYbmRWV29pMTQ3NzdGRnE0aHhYRCtvUmF0bzlyckMwVW5O?=
 =?utf-8?B?R0VvOGxKWjh2QmFidlZEa3VOM3EyYWxoemNpWXQvdGVtaHVhaTRpNkZXZGl4?=
 =?utf-8?B?SllrRFlxS3NqSS9DUHZDcnhSU3pzby9TQUZ0YmpmUUpsYkRGbkZ6dXo4OE84?=
 =?utf-8?B?WDhDWVVycmVqOHBsbzNGbEduUC9uRDVGQUIxYWM3ek1wYUllMUpnYm5LU0pQ?=
 =?utf-8?B?TFpRc3oyY2NaM28xVThGVlkrY2FFNkM4OGd6di9hRjU5VWRxbUxVdHQ0U1FZ?=
 =?utf-8?B?Rzcwc3NVeXNPMW5hRW44VzAvaGptczBnYnNqeCtKWkJzMFlXSVRySzNzWFl6?=
 =?utf-8?B?M2xSS0JiZjlUVHFLYzhpMGgvMVpDWWdhUWZpV2ZwTWtiQjhaazdkSmVReWNN?=
 =?utf-8?B?VTg4QmZRb2F0dStUY2Q2YWQrK0JuWk1QR3dwaHY4bVVORFYrcWpFMkRZNGRG?=
 =?utf-8?B?MGpucjlSQ0hOOFRyL2ZvMlN5Uklra3hXb1J0MGd2T1c4Y2k5dTNXd01Vbkox?=
 =?utf-8?B?VUNCVlowakVUWmg4MmhYT21HL01zaXVRMUlzNVF6VnVJMGJqUFF3RG80NFJQ?=
 =?utf-8?B?ZXJGT3BLVHgvZ2I5L2JJTXN0emJxMmN2b253UFY5YmRGWEZoRDk1VFhjRnRx?=
 =?utf-8?B?dnE4bUpqME14R1l6eXRaeFlhVnQ5bnNPUnFxMFNEczFISE90S09DKy84TnA5?=
 =?utf-8?B?MjlkMHRZZ0hacmV3VG5ENnB6ZmJKUXBvZ2NncFBZTXMyVnhyOXM1Vzk5WFpn?=
 =?utf-8?Q?DkkUcCrEW/C6nu0+JRxm6rmwh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc99936-8446-46c5-d4bc-08db3021ec6e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 06:50:46.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pQPVMTifLyunzUHCmKrM8BoKJ2zjm905d7CqAe6v2UZAloL0yOBD/Dgts43mpg2BgmhUcZQ2iWcQPJKKawQ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651

First of all these were inverted: "bridge=" caused the port coordinates
to be established, while "port=" controlled the bridge coordinates. And
then the error messages being identical also wasn't helpful. While
correcting this also move both case blocks close together.

Fixes: 97fd49a7e074 ("ns16550: add support for UART parameters to be specifed with name-value pairs")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
pci_serial_early_init() only dealing with I/O port variants is also
bogus, but that's a separate topic (which arguably would better be taken
care of by someone actually in the position of testing it). Additionally
I think it would be a good idea if the function left the bridge windows
alone if they're already configured suitably (perhaps with a wider
range).

_ns16550_resume() also doesn't care about configuring the bridge
correctly.

It further looks to be a shortcoming that pci_uart_config() doesn't
determine the bridge behind which the selected device may be located
(let alone a hierarchy of bridges).

--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1631,13 +1631,6 @@ static bool __init parse_namevalue_pairs
             break;
 
 #ifdef CONFIG_HAS_PCI
-        case bridge_bdf:
-            if ( !parse_pci(param_value, NULL, &uart->ps_bdf[0],
-                            &uart->ps_bdf[1], &uart->ps_bdf[2]) )
-                PARSE_ERR_RET("Bad port PCI coordinates\n");
-            uart->ps_bdf_enable = true;
-            break;
-
         case device:
             if ( strncmp(param_value, "pci", 3) == 0 )
             {
@@ -1652,9 +1645,16 @@ static bool __init parse_namevalue_pairs
             break;
 
         case port_bdf:
+            if ( !parse_pci(param_value, NULL, &uart->ps_bdf[0],
+                            &uart->ps_bdf[1], &uart->ps_bdf[2]) )
+                PARSE_ERR_RET("Bad port PCI coordinates\n");
+            uart->ps_bdf_enable = true;
+            break;
+
+        case bridge_bdf:
             if ( !parse_pci(param_value, NULL, &uart->pb_bdf[0],
                             &uart->pb_bdf[1], &uart->pb_bdf[2]) )
-                PARSE_ERR_RET("Bad port PCI coordinates\n");
+                PARSE_ERR_RET("Bad bridge PCI coordinates\n");
             uart->pb_bdf_enable = true;
             break;
 #endif

