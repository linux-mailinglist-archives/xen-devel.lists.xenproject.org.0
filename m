Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5D378E62E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 08:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593361.926364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbaxd-0006pK-8q; Thu, 31 Aug 2023 06:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593361.926364; Thu, 31 Aug 2023 06:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbaxd-0006na-4Y; Thu, 31 Aug 2023 06:15:21 +0000
Received: by outflank-mailman (input) for mailman id 593361;
 Thu, 31 Aug 2023 06:15:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbaxb-0006nU-SS
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 06:15:19 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe16::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1f055f9-47c5-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 08:15:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9959.eurprd04.prod.outlook.com (2603:10a6:102:387::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Thu, 31 Aug
 2023 06:15:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 06:15:16 +0000
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
X-Inumbo-ID: c1f055f9-47c5-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwIqk/jkU6YwJ60uVcPzOqIYXKk6RyRPIRupU5pSxQ9GG5SFaYhYnU9dqKK2XHC2+E8ohM+oUhbRhcaBsRfq/yphDfUU1IUxakJSpItsnHjFEXP/cKO2+4jC20+Aj1XM+KoigR+DX9uU04tpn4uzy5l/0Mxk3pXa0ZVbIc/ylGVfp2Wd0BPjOCpCIlAU7KMQ5/lx2OqUSeEikmNOqLr/FVnbqI9Tt3BFNZ2vSu+DUewbFCFwwHXnbPLAHGI98JFJVTV7hJPywK51T4P85fgPu8P05t17SL8pyOwc7avrJv6+1tCKuqNiWHI5cm6y7yvlwthT2LubFfXiclxsGfJpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/uhMQIUJkpNDbQp8w14s3Rnav8Hu3quoN6QCu+nTUo=;
 b=hShKUQttjLQvOmKRvQW8copKjI+pJULlX7MpMfT8Vh5KvskqeDg7YJdVjwrWH7xdtPFS23S3HkQUzAK3QRMkrEzhLtwj4RC0pPO+kw5k3UcxyEElsBYN0p+9tZgAeRK1hdqFq5fT0Y8484PdCU/X4Y8C/197LIZUcxb+Hjf90WgW9jbP7wDAhYsOsVrzSFBb2k4Y9pOvJrZUNzq5d4TMxchH/ctDpoD0SpgbmOHlr4TAFf/frvIYka1pka19c15yxVg+9vu4L3C0YEp9+tnqamOzYos66d1n7g87s5vDAg5kDlbnAXDBHkmGlMGS3o7Lr8wb0Lr9DORSXWuDVnB8Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/uhMQIUJkpNDbQp8w14s3Rnav8Hu3quoN6QCu+nTUo=;
 b=pVc17duEYsQkom6puOs5dKUgjDDcj5rXu0lCye7e4wgY6gSJPCzJ6/QqGXjSZA34s/8R6RH2PNiS04RvTu3iELQ6ph/Cd3sPxQlKPu/J4ApfQtLL8oCq4nCus3YYbrUih6iVOqf7k6UuIJ+96rbnRazQzzhYBhshhbAHsdkWQ43uQhm5i8GqC3bjEqGGHoRFFCPVOUYcl9RwW/x9q1nKNJvwoNpZa41+VoEKNuuk3MpIokFCZlMp+IWisX4J88d62owkTzbqm3cBot2Fyvn/zvJxThhOlNs/DBQpmubrXCqIGhK5EL9nDzRvj8ymLG8Qu2tLqMr9X0J5ruBEPYj+hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3ccc381-1fd5-b99c-e37e-5870af401dd0@suse.com>
Date: Thu, 31 Aug 2023 08:15:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] MAINTAINERS: consolidate vm-event/monitor entry
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9959:EE_
X-MS-Office365-Filtering-Correlation-Id: 533ebbb6-d7ca-4316-af62-08dba9e9a4ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oT7yX6+9/XK3yQD2qLRc4o4ILI5Yr7gieyzpa2pxyf4K6gXqSOrjnQ5MytXVH2KojJ8t2vnYBlP4H+mz+oDB3zNB7FP9qd6ygpqdNJiZ3VB1uKd6Gh9Z5XVsP/JyeW87F6agzElZGzuwFTBPkEejGEqw8+Rz84F+qaEnoB6UuEitgPXUR+O24v+64zvZvxdrOjjOnCV7qOaevqBR3euCj5QU+1zxPVUpmbIFKlg51lpqvpRZd6Gv4dVe+tBibgzurWaJvDjC1KRYOKlVoaX09PVIwDdjOnEVLOrZO4OuxLh5bx5c/yuKwwrSND2RgejcU9ZWLN/hrdOEbf7WAfxwxmOMKx436u+pmdXiSydK3nElBmKL9M6pupG4Zh/j8M8BzXxqZEDQ3x/ueO/TerPzHEPaOKFfvMJ+qlv5UkDEUzAF3sxiYB07NY3vuQTZyLH4q3qGDCbB3gDYR5Zg6o3tXDdEX2S5Z5yApn39fJz+Q1mRCPmhFurycvFKiay7KZVbkczuST4K04z9eHnffXBlnvpMeQn9SFa7swPtf181Qj7VSq2qr+3L4CzPT3rrhxXPi+ztGsFc1VS/N+P9B8zEaYvQjLaMqwyVXYGBqpqs6ID5aiPn3FpndBQo67pwx3Obwx2s3Ip7LqZyffwZlUnrtg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199024)(1800799009)(186009)(31686004)(2906002)(4326008)(54906003)(66556008)(36756003)(66476007)(6916009)(316002)(66946007)(8676002)(5660300002)(8936002)(41300700001)(38100700002)(31696002)(6666004)(6486002)(6512007)(2616005)(86362001)(478600001)(26005)(6506007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cldxMzZReGJqaUFoUGh3WWFPM3lib3l2eThnS0l4dVAxUzFoVnpxWXdYcmcr?=
 =?utf-8?B?Z2dkMTAvbnRmWU4zUFFUMXdFREZRRkhRSWhnbkV5MUVjYWlxNXVBdXJiUkwx?=
 =?utf-8?B?RlE3U2l4bVRhOUNaaGFkTHZSeDVVY0o0UHVvcE1pdFg5NW5ENVVNUmFBdnFW?=
 =?utf-8?B?bHdvVk5WUnFFUS95dDRrdlJ1cEpYOG03bGZIWERLa1JweEo3bDZYT3kvQjNh?=
 =?utf-8?B?eTF1K2FMRGQ2Rkppb05CME1xbHpNV2ViRzVhUm9NYkNXejcyc3ltZzIwWkpP?=
 =?utf-8?B?ZXQ4RnV6OHEvdS9MM1I3NTlqczVGK2FhWVZacGtBUWFweHhMM29pZHAyKzVT?=
 =?utf-8?B?VVRWWTc4MVdIdS9nWnNidmV4STFJaE4yOU9QT1ZjcHdDdUp6MzdnVTNUYURI?=
 =?utf-8?B?ckVHb2FKRkxNT2pUUWdGODVHd1JmbDRkQ3QvWFBPL0RkWXhNMDVRTFpFbDNZ?=
 =?utf-8?B?eDA3djhqTVB6MFJ2eUo0ZWdoNmNhRVJIR1AzTjVvSHpScjRlNE9JdUdvVEhk?=
 =?utf-8?B?ZXllK1ZEdEdpYVdvU1RXOW1wMXROWEk1cGhDamhoUWNVVS9RVFZ4L0hwRkFk?=
 =?utf-8?B?ZVBmMi9mN0taay9oZ3JDbXJENkZScGNBS2lBL205dkx2eTFUYkpIeWIxTEh0?=
 =?utf-8?B?d0dXbnBML2I3Y3hockd5RHlUR3VQZlZyNkhLOC9halBGZWhLK3pZWGhaS09G?=
 =?utf-8?B?enFjMUNBaHZmV1Boem5xVnpSdW04dmMzTXMxYzNWSks3a1N1MmNqZ1BOWE1Z?=
 =?utf-8?B?RW5VMk1EWTROcVdEQlBZR3I0TS80eTlONDRQLys2TlRQU0tLN0s4NjUxMUpU?=
 =?utf-8?B?STZ5bWVsdy9jL3ltTmw0emFsVGtBR28wMThndWxXaUFXOFNmUWhPTHc3SGNZ?=
 =?utf-8?B?NnRnQXVTMVRsL0lRZHJYcnFZTGRpeWo3VWwzcDdwTTcra3c3SThNcTB1NkRM?=
 =?utf-8?B?UmdQVEErTTliK2F1bXRFdHBIY2RkenBZT1puUHV4OHhtT1NHa1JwVzd3S0hS?=
 =?utf-8?B?NzFzOWpkMlRFTXJaOEZKbmVHd2VNN2g4aEowQXRHMkVFdmdSeUw4ME1oWVRF?=
 =?utf-8?B?WTBOQXFlVStUOEl5QXdOU0VtQUtpQjZQbTJSUnNOcFFkU2lkeXNkaHpmMTBD?=
 =?utf-8?B?OHUyZnZncFZ6M1RCaHNZQWxrak1pQUx0SlRUaVkyK3plUmJMVW9aTmRsUlA5?=
 =?utf-8?B?bDRZUFFrdGJvaElWR0tOaWNXdDBlWEpzMllOUVlzQTZDblhBcFF2R3JlRUZn?=
 =?utf-8?B?MURVcGxzZHM0eGF1TWg5anJlV3I3RVJrV1IwcHoxQnJUK2gwU2x2QnRndXlm?=
 =?utf-8?B?TVQ1eEI2Mk0vME1yK1BVOThZR055aWMxdUViSktrMUgwT0t2SXoyaThrVFNJ?=
 =?utf-8?B?MS9ibVFkQmpjSzdxZXkycjdZcEdsK005YS9oVmJvdVBVT0piWmp2NmNDNTFR?=
 =?utf-8?B?TjdVNXJHa1VkR2ZDWHBLK21MdHQ3a2VQUmtXSVdtQTgwRXBPN0VnY29kWksr?=
 =?utf-8?B?cWZHSUhmVkFVL2tEWFVLSGNTK2NjKzA4NXVnOHR0OFFrUnpIYVEvcTRRSGRT?=
 =?utf-8?B?MWp6dDNNb01vVmM5bWozYXZ2SWJ3ZXZMenhqdUJ2MHpNZllqd2FTTlRBb3F5?=
 =?utf-8?B?OUh0UTFubjJ5M05nR2dwZ25rN3NVc1Y4MnQzVnY3b1ZQVWxFQ1J3YjN3b3lO?=
 =?utf-8?B?SERsVVRJMFJVcEVtNzVsVXFhL3JTbTRaaExXTlJsaHdUSFo4dHBvVEdzc1lY?=
 =?utf-8?B?N0xwY25PSjlrcjhkY2c3YUdWNmhEZTA1S0o0STBIdExSaUhHTFFyMHZFdWh3?=
 =?utf-8?B?TUVsSmhBRnBxWWJJY2dJQUNCOGxzK3F2UnpudUxnd2xycFU2emFGdDl4OGtP?=
 =?utf-8?B?Umcxa083RFBBSk9rRk1IV3JnTnA2cGlQVndkYTFQZytvS0pTbVFKM0Vwc29E?=
 =?utf-8?B?MmlZR0UyU3Rla0cvR1lJTDJ4N2FRRHVKaktkMGM5cVNiVXdTMU5ibFM2TWdC?=
 =?utf-8?B?R2JRaGI1SE5YRjBVMlYyam4wVkwxamtVSHBrbkxkNUQ4N2JySDNUSFd1ZDMz?=
 =?utf-8?B?REcwSkVEcDdLbUQzWEh3ZXBDMHJJU1ZEY0tPZ1lYSnQvYXZ2LzBqM05ucGkx?=
 =?utf-8?Q?1LWc4dqwV4EUppPclZJfhF+4N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533ebbb6-d7ca-4316-af62-08dba9e9a4ae
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:15:15.9838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xYa+OoBdDO1lL0DjrcSDuzPR9UsOcjtLRmrLNfHjfAa59rt3qeDE0tvzgXHhVBl6RqTD7E1tdJifsMX4suQxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9959

If the F: description is to be trusted, the two xen/arch/x86/hvm/
lines were fully redundant with the earlier wildcard ones. Arch header
files, otoh, were no longer covered by anything as of the move from
include/asm-*/ to arch/*/include/asm/. Further also generalize (by
folding) the x86- and Arm-specific mem_access.c entries.

Finally, again assuming the F: description can be trusted, there's no
point listing arch/, common/, and include/ entries separately. Fold
them all.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Further fold patterns.
---
Triggered by me looking at the entry in the context of Oleksii's RISC-V
preparatory patch.

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -558,20 +558,9 @@ R:	Alexandru Isaila <aisaila@bitdefender
 R:	Petre Pircalabu <ppircalabu@bitdefender.com>
 S:	Supported
 F:	tools/misc/xen-access.c
-F:	xen/arch/*/monitor.c
-F:	xen/arch/*/vm_event.c
-F:	xen/arch/arm/mem_access.c
-F:	xen/arch/x86/include/asm/hvm/monitor.h
-F:	xen/arch/x86/include/asm/hvm/vm_event.h
-F:	xen/arch/x86/mm/mem_access.c
-F:	xen/arch/x86/hvm/monitor.c
-F:	xen/arch/x86/hvm/vm_event.c
-F:	xen/common/mem_access.c
-F:	xen/common/monitor.c
-F:	xen/common/vm_event.c
-F:	xen/include/*/mem_access.h
-F:	xen/include/*/monitor.h
-F:	xen/include/*/vm_event.h
+F:	xen/*/mem_access.[ch]
+F:	xen/*/monitor.[ch]
+F:	xen/*/vm_event.[ch]
 
 VPCI
 M:	Roger Pau Monné <roger.pau@citrix.com>

