Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34E77396B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 11:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579513.907515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJF1-0003zG-JE; Tue, 08 Aug 2023 09:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579513.907515; Tue, 08 Aug 2023 09:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJF1-0003wn-GL; Tue, 08 Aug 2023 09:43:03 +0000
Received: by outflank-mailman (input) for mailman id 579513;
 Tue, 08 Aug 2023 09:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTJEz-0003we-Sy
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 09:43:01 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f564ded8-35cf-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 11:42:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8446.eurprd04.prod.outlook.com (2603:10a6:10:2ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 09:42:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 09:42:57 +0000
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
X-Inumbo-ID: f564ded8-35cf-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPXeyOsLZliMptjjZeeTGURCav9pRAq9yWEBq9BFhgmIJElUJc9BpqPbkJ/I2WWVC+QKHXQugHBHo0yWXLsVHnnJgW7YFuT+73cXKnGX8umeLz8xp1N7RElM2zhIf/33x9mgcq/93Ig/pZr6jKqpJlFouqbO/g0i0qrgUMfj11kOiuomnEQbdG98OcKAui/SXbSHrHQfQa7uZDT5N7aCy4NRdflGbEkkMvLy/grB7wm+0wLLqbW0SadWq3xIgTjHAcLoLNJPGmor9rnoxyVh5ucnsewDIVR1XUD6ecrXnFBJfVJCOnZyrcZh48yTxb3SbCHnVcPQIgnA+bHXqzTIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k294eyeSeuiB2Xr7E798WNtAaFEAoAWoNZteqPxNH5c=;
 b=Vp4LkRnSI2ZLLZllY6dNSiwLiDvkyRzSx94bPnW6i68QN8dVFOgtnrgWBdT71pBtE0ZAolU589qem5sdYiqlG45cIs6CFZG7NaISsIkEl5wP9RaYy0bq5NKBKBG92jAIGRWH85otpeCCs0v/fE9x4jWmxHYLAz7bisuEmTIr9gWIJbnBCcFsTK9cBSsdtD2PCPTGosFAxtf1bMH+n3BH5maRCB9MZoftFS4y2QloHiddty48qFHOJ8gH0H4/mXatxQr1FCETIbA+lmdKPzwubZb4JafNP//Z6qQqS3VxlgQTHKMY7i4dOYZWxADgY0lhgjmhHXukNauRwQVuzURoUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k294eyeSeuiB2Xr7E798WNtAaFEAoAWoNZteqPxNH5c=;
 b=LvrBKXUva837NtaMuSUuUEKsUcuQXcqqjzrNsnQw1FklZP3jk2gsRaE4PAeXt+6nG9QgqF9i3xPlB5M1ycDkExi9JqafBn9MVxYylICsNm+WKgXwvC5whbNPxlvyoBFl9mvTgqpAXQ3CJb6xts9/id2WvrWATjIg476DDCJdpwYfryRPjGd0nTQzjbX2PUSEGd69RA295eF7rTHualUWzOiCC+xFm/8LvPVZcNe1h+As/ORHG2KlVciPdSuvItM+1TyOjmM1I/Ex4PdqIH5GYAzkmVjP/UADJcqCrfdjkBy5g3cyJy/NpB2sHfnsObxpfDawqIbtssfRj+LCDQRLgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ea0cd2e-1821-541d-068f-a18309d1823c@suse.com>
Date: Tue, 8 Aug 2023 11:42:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] common: asm/desc.h is an x86-only header
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b51bdc6-18fe-4c32-1d02-08db97f3d8c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oYClyM64+2U6YcM1VUd3uitq2aXhx8+pr42+7aw4OQq0EbiHvd01arkiOeZYnp5QrgjD48iVT3VdJHNpPf7KcT5c3XZqKNYjzb7H/UYlbnYSsuH3PVdtjozQbAwrzM1BuR+N52QyJtSA3ZBP2U3DMuljmXkEggR110e0pPPiDKuCdepWZqa53FApN9FR62vn1vf+FkvO1t6+54K4BcS+dVFtGBqRV+nYEn1oDmNqigZ+BW77q51jt8v+7JQQVLZaQGKRBsNKIiD9fkYM6enU5tLK0NYRbWYRtoyafDZmQOolbUKQ7viJKDy+gjYxnkpsn7aPKRVzY2b82bUH36OEN1qNglWHeN/073rdIEy1Tvf0E/4u2Tda3XPWRF+q7G1k3f+K5rGVks3CAoUI9rgM/JY0QP1wIOljlErSrnhV12D7DW2KjsSKxdDB558n2o8h+SmQfuWu3sxR5ty7xGLd8oJNsqN8kURpXp+L7lpPiil/pOd5nnPaD5f5f/m89ImsAkYWAMhbbcsDIYhMSG7/a8zUYzBKG5lVqodRRF7EgLKWNvjqFPF7HbhUilvKw7YbOF13kz+Si5hEdBKYzaEADfhCtH2V+0XEshDNY4H+4SRKoK7gti6r6XrtarniHiHRGWuZTy7llt+CZ1P6E1uUyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199021)(186006)(1800799003)(8676002)(8936002)(5660300002)(4326008)(6916009)(41300700001)(316002)(83380400001)(86362001)(31696002)(4744005)(2906002)(6512007)(6486002)(2616005)(6506007)(26005)(36756003)(66946007)(66476007)(66556008)(478600001)(31686004)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEk2eVZpMzVBRU1TQy9DK3dyd3VXaEJvNUxoSXlUazA3WVhudjJud2ZubFgz?=
 =?utf-8?B?My9yeDdhMFRSOE9tNG9tRlJBaS9sMnQvdk1zWENNRWlZV1ZTVUNhcC9BQXRR?=
 =?utf-8?B?eDlHKzJKbEQ0Y2d6ZzBORXBTdWM3MWE0THQvNFlWSXcvU0FEMUE5bEpxVENy?=
 =?utf-8?B?TXpKN3NLNURVVHRoVHlsamFTeEo0MVc3M3lyNDdvK3JLTlpnNURIaEF1Rkh5?=
 =?utf-8?B?SlRxcXd5aVNDV0xua2UrdXZLOEgvNjRqdEY4eTJyT21UWXo5cnNCSlpTdUx0?=
 =?utf-8?B?NEdSRVNNc2ozN3ByRy9wN0J4V21pY2JTbmNZZG5GdkZXOFplejZsd29heVVs?=
 =?utf-8?B?ZTlja3hDTk8wbHZmNTJzdk9vWWNkSFpQaWhhc3RPZmluZkxtZTNCektCYWU1?=
 =?utf-8?B?SHlrL2kvR1JqQkl6Q2dqV3NJcjZXSWM2ejVFMkRTTUFrbEtzaW1XREtuS25l?=
 =?utf-8?B?RWQyNk9YUEU2SGNndDMyN2xLcC9teXJkL2l5RGNxdmhxTzVLREh1T2RqTFZp?=
 =?utf-8?B?S252WkF2S3EvRzB2YnV4T3Ayd2thQWJyOVNXUng4cTduaXE2NXE4dVNKaGM0?=
 =?utf-8?B?TllqWWRQUjdsdVM5VmdKbG9OZWprRU1rdHZxTWJrYVBuV3UzZUZoa0x0T1pl?=
 =?utf-8?B?UkJHelpUZmw3eGdXbFJ4eDVDRmxSU0lOWkxxRFVTaEFoUXZMbTlDdlF3SDVQ?=
 =?utf-8?B?N3JCdnc5YzFLbEQ3KzV1TlVNMFZmT25Ya0JMWFJhT3RWVWxKdzNEVTBsaDI4?=
 =?utf-8?B?RHBmS0xOb25LbmI1dmxGRXcwTnRLTG5oUHhsNVNxVWhEMm9TY2ZOcmV5cXlD?=
 =?utf-8?B?bE0zOVRjUW1pZDVKN3RxUEs5enVLd1BVRnhraUV6K3hydng4VURPNHhITVdi?=
 =?utf-8?B?ZldCSmFCUW40eUdlWEJ4MGVvZCtBVEw0RnBaN0ppT2dnR0lJU09jN0I4MEgr?=
 =?utf-8?B?cDZ3V0xQY3Z3RC84UlBTVXp3TWVkVnFSMG5yVlg2bWxYaWRaeFdtZWJzRXZN?=
 =?utf-8?B?RHpRK2xZSWNQVDBibkhzOXZJbTNvWG9XNnR5RHQvWEV3S0JUaEZhdmFiK3Fl?=
 =?utf-8?B?d3g3dkdYODJ6OXl0clhrMHdlbFdKV2o0RWNZeWk3Ritld0UxRkdqWDVtT1NJ?=
 =?utf-8?B?VWxGeEJmbVQ2QkcvcHpCRHlmMjdVUjZSUEhFUkY5c1BIMVloa214VDUxZ1Rr?=
 =?utf-8?B?ZWdmMllURWtWNDgraCt6V0hyTzM5ZW85NXFNa2VVTWlhOHdUUjVrYUZaemJy?=
 =?utf-8?B?TVM4ZExqNnRycVRqcWoyYk9WSGtoYjZDT05NWk5XQUE2Y2g0K1FJVjlmeGJM?=
 =?utf-8?B?eDFRSTdRcUs3V1k0Uk83OTdXUE9yeUpYbTBpK2J5VFBqU3pjaHlhQmpRb3JW?=
 =?utf-8?B?WVYzSmgvbCtITTRrM3EyZVE1cDMxdVE4UEZTZ2dCQjhCMkorbmxpYVAvVEN2?=
 =?utf-8?B?emo4Mk5NMmdDdWpiaGc1ZHUzdHlQQnF0S25EUEJxVU9kMlk4bWZ3aHAycSt6?=
 =?utf-8?B?RlRIN294V0MyUE1ZeHhmWVBrajAvdlZPUHUyMWp5UkYvN0EwMlJWeUdrM2o2?=
 =?utf-8?B?L0xUZ0FzbVdhSlBoaUJSNXlnZGlDNlcwUk5lZE9nTVBROVYvd3dYSkxMWUIv?=
 =?utf-8?B?LzlSeVBaaWVwbk1pSkxCcU1oQjQ4TThwdzVBbVpJcXF6MnRVMlFna05OMERx?=
 =?utf-8?B?b1ZZYnpoK0ZzVmZjWFpWK1JORXZleWwyMVp4SHdhMnBOd1VCVkMwQ3FVVFRB?=
 =?utf-8?B?STFydm5MTUxtSEFhbnJtVEFOKzhuWUM3d3kyRmtQdUJxVEpjZ0dhVE1iaHRj?=
 =?utf-8?B?OUJQK1RHL1d2RjJuT2pIS2F1NGV5bTFBZUJSVDBpOHZBbW9CWGY1UnZGMWg1?=
 =?utf-8?B?Sld4aHNJQjNJQ0VHRWVhdU95R2ZUeDdaUVJmZUc1aUFOZXdodklqZnpuYnB2?=
 =?utf-8?B?bHhhZk5WZk1sZnZNU2ZJVndMTTU1UUhhZG4yNVJxSExuYlVCY3J2RmpRWncx?=
 =?utf-8?B?eFpQSk40ZVY3bnMycTJrd3MzclhYT1NtL1Q3bEpFQ2xlanRyYmZxTlBpRVN1?=
 =?utf-8?B?SGtHRmRpUW11eHdnUkRkZ2g4bHhOcThQcEpZcEx5TFBhclVBZ3lmdE81b0RZ?=
 =?utf-8?Q?tSlgPbJ1v7z9XLdi5KrhdtLZa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b51bdc6-18fe-4c32-1d02-08db97f3d8c9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 09:42:57.4311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVWPT2ZUeH5KoTnOoTJZpd3Ajo/olGy6LJh3G4JIVfjXToJ/mvo+vd4ugW7n31HxexZMxVhJHrcqRoX/OnNrMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8446

From briefly going over 9062553a0dc1 it looks like the #include in what
was ac_timer.c was added there for no reason. It's unneeded now in any
event, and it is the sole reason for Arm to have that dummy header.
Purge that, thus avoiding PPC to also gain one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/desc.h
+++ /dev/null
@@ -1,12 +0,0 @@
-#ifndef __ARCH_DESC_H
-#define __ARCH_DESC_H
-
-#endif /* __ARCH_DESC_H */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -22,7 +22,6 @@
 #include <xen/rcupdate.h>
 #include <xen/symbols.h>
 #include <asm/system.h>
-#include <asm/desc.h>
 #include <asm/atomic.h>
 
 /* We program the time hardware this far behind the closest deadline. */

