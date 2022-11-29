Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77FF63C31B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449440.706173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01tv-0006h8-HU; Tue, 29 Nov 2022 14:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449440.706173; Tue, 29 Nov 2022 14:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01tv-0006ep-El; Tue, 29 Nov 2022 14:47:59 +0000
Received: by outflank-mailman (input) for mailman id 449440;
 Tue, 29 Nov 2022 14:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p01tu-0006eh-3y
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:47:58 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe16::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfa5837d-6ff4-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 15:47:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8126.eurprd04.prod.outlook.com (2603:10a6:102:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Tue, 29 Nov
 2022 14:47:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:47:54 +0000
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
X-Inumbo-ID: cfa5837d-6ff4-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIqrW4ZHeuIWC0JSmzcIFJRTCyzMpG0aOjQ6FnGmCx0PHAEurUqwO4DZPhNyDk+SNz9uRiitoMPbTLqd+t28xQ4Zq4V94vlgKX5r6AGfXurQQbuYXj2D+CvcOfTlPGPIJItStmPv0ZUZgHZkFKg3dsnoNO9M+hxQyhc3wqgFIgzvI6Reye5LJsplIyI1WRlT/WuR2+UGMIsap7PVvUStuT4tR9+HBgclZN/4jldp3K/th6jn4QXIFpaSAnUldz0Qh45bqBZVKjOdU/TMEi86f7xXsE50WMNONfV9usEExJptMC+SRTQZJ8bSkKCeLau2uVQvQY/UQqw/b8kPn63Gew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXqcNSjY1JBioDkQ9SEAT1phAWhY/M3WTiUf0zQqqQ8=;
 b=XenCGMvoxrUu9mgF2USc0TfNQuutCnIcCg9w5EHt4q0HLlSRLXVkZLE9vsPwHWoLrItjtDCyNqgLUZqnYsRMIrITE23DNv+WigJVfVVT9DqyKKO5e2JhWQreZ07zxcnNYG+EMdBspYJlFG1AZu/mlKKQbF1XrWbQk7soc24EflSXaFngj7RruBfQ6cvQL/3I93Kf6+5shFjemLRhmex9hYq3wr4RNCidq6t3zBbaBpdob4qCciiYDirx5WoH5rtEye/uKla99a9AEjZ/MfQa6Sdr5TQgQIf0q9oULqbxobpcTeZ18Jacx3Ag+2YlWxKcSEJrCz8LqVgSNz7pGGY1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXqcNSjY1JBioDkQ9SEAT1phAWhY/M3WTiUf0zQqqQ8=;
 b=PGxrinrF+6zddszchVRtRkr06YOMp/lsoMKD1TslAmfyJET2fFSk1G0BMawQpoZsAMbCasvN29loRnMB0ETBnPpJPydRwPP9ffIvQ6GSp9/JkFZMJFWl/X3xRBsD08VG4mIcxWwHS0CJENpDCsL7Tig03TQEIr6nkY3p8j11/pswATwSnBuTNwJ6Imj9qwJMZ1R5dHubdWb9YYocX4rNh7Vs5qL2KVhsq0Hy05vEtQ6i/oeXjCeTKoeiIi0xQbglVXCUQTmmfnlfB8iu9pJFgPktLgT+orxlYicaH89H14BMTM3UTS7kipSaq0jKLwPTXLvdSOPZTSKtyWV7F5WK/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3876e026-2a98-b74e-2f49-4bed8fc0a224@suse.com>
Date: Tue, 29 Nov 2022 15:47:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/p2m: don't calculate page owner twice in p2m_add_page()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d970489-dbe1-4b14-1fc7-08dad218b2a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Hf4D2vvbk6VMR9plBRN/IY91h7nKO7HYfQLRA2V90bK2ErCx+3h72TJtxECicPUdBC9HvXZTWjs48lkbeglD/GheyXuSsHZLzwT/oIS25/x2e7BlPFsg3En2jw+Su6AcRXJfElVj17X+moqUI/x1NcvetVwbu7WVrSgSQyrsMXuthYtR/t6/TP02uQ/8dnEY2RTkNE0Gj/A5n3zx2BTC9T6bXGOLx3Bn6XguvCSVWY7HgL0inarfGzpZxWhjA2EP7ayVtobyD7eVipWiYNtFFQ2WISAJNLSnfAxk8h+8fu7nEkidVPPQh5db00cIxFNAUKZAZ/raGUcLSbjsDEiEVmZDZ6RZ3EZS6mMLztS80yHjHclOG8bQ+LfW4YKYL9hEc/ALVGM4DKkN9pAQEYRyWw7XOKU0eg8Sm0cn4bveyCB/OyPtWZ/ohHrXlaEfUIAbeoE5L2GiCwXM9uOXieRrORzIgn2lp+lve7MMCSNVkKji7EsN4c5GFJIMecZt+qpw+5F0mzJdwqVRVolVNo7saiBlrl2EiPllqDOkCsZzh9N7LLoXvAvG3V89FyfCgdpFYhoJtL916kCxMUjO8i6gZUOgnHl1t5yldh+PrjMOkZc64RCr+mDR1O2x3vHBBSD0ScedP9PNb6Mm8mPrY2szs18qWsOfW3/DaljKPG4sqreJOtbf/jH2mFbmYrgBuNb0oRRqXlxeoFOMQBd0CjDm6NyCqrqliTZi2511wC7ED0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199015)(31686004)(38100700002)(66899015)(6486002)(6916009)(54906003)(478600001)(316002)(8936002)(2906002)(41300700001)(83380400001)(6512007)(26005)(2616005)(86362001)(36756003)(6506007)(66476007)(66556008)(186003)(8676002)(31696002)(5660300002)(66946007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTNRbWp0Mms5OWwxcUNqd0kzck15cG01MVlyanhBVEpFTE9DUDdObmc5VGdD?=
 =?utf-8?B?SmQ4YS9FbVh1dktxVGdNeWVGbnFuaExFNVI1RThtZzlEek1mZ2IrWE1aMFpY?=
 =?utf-8?B?aGRyQ1hNdFN3VW9pWDR4R1FWbzlJMjhQbnNGOWNCVXhDdldoS0Z1QzNQbjMv?=
 =?utf-8?B?RzFIbDZUUDNFZ2NXYVhzSlNMcUNXaCtPRDI3NWpQWnhsY1Q0RUVVUm1qS2R2?=
 =?utf-8?B?bDJmTWVGVDIvbXpmUnRwWEs0TFI5d2ZQam13T09KN3l6QlovWS83RmtuYldl?=
 =?utf-8?B?R2t0dmxsVDFNNGx1SFFrRUkwL0VCUmtJMTFvNmV0NlRoUERKek9tY0ZYWHF4?=
 =?utf-8?B?dVVzY1VkOHhSbkE2YjF0QlBWTDFEd2dEK29iV1pXTzdTQWdGeUZIYUVjTnJZ?=
 =?utf-8?B?TjA2YnB1cm1CaTdyOU51RVloUklULzJuRkp5aHVSd1piemZPZjdyUWpXL3Zh?=
 =?utf-8?B?VDF4SGhSZTgxbVBGWVJxS0FSajdFYkNVUlBtdFNuS1hjVGYxMnB5c3ZQV3Qx?=
 =?utf-8?B?eW1IaEl1RUxDOVRPNWxtdWpxbXhnUUZadlhmdWpoMGxOaE5zdGZpMmZtdlR1?=
 =?utf-8?B?U2FuaVZnb3lOcTFoWlQ4SXI0S0VRNlA1cDhJaHNNY3IrbmcxNk9hTUQ4bHZ5?=
 =?utf-8?B?ZER1YnZQeENHYk5OeXZVRU54M2ZrQUE0aDlwMHVnYTVVMW05UWhmNWY2N2Ev?=
 =?utf-8?B?SmVOak1MeUFqWEQxMTJBZ0xKTHFMRTFNQjVBRlRCUTcwOU9SZ2NZNnA0aUJJ?=
 =?utf-8?B?dXUrYklFSzFvcFl5MG1abENnN2FLQm5ERjYva3dxL2tMY2JyVFRNYXcwMVpS?=
 =?utf-8?B?THByTVZaR3g4MmhiQUdhN2RORUJ1bVlyTmtvTjI4cVZqUlB0Q0twU21XbG9U?=
 =?utf-8?B?OTJ2YVdKQ1FiaENDeWpSajhQUGNlcExhMmVic3RHL09ITWFYbWJLTTA2Q2d2?=
 =?utf-8?B?d3hhaElUdHJDdit5cVlJc0VmZ2IzTVVBVExQUlZWTG0wN05JRllTaGU3cDNl?=
 =?utf-8?B?cjU0MzV2L3BUVXZKSXdQeDVDblJ6QlYxS29GVGZadnZCM0Q2S016L0MyS1Yx?=
 =?utf-8?B?YkRWSkVZRXFseUtOZDdEOTJod3dreHQvdTRBdlVNaWNzUjNDaDRmVlJvSnVI?=
 =?utf-8?B?a2RjNll0UkJLcnlJRU1vKzJoSXNFQlhFYmdMcXNJME1BaDBNemZQOWZoVi84?=
 =?utf-8?B?cC9icjAvUjFlWnhhREJyS2Zma0paeEFPc2s3Z1hwYlpEVVRzcUxyVWd6YStD?=
 =?utf-8?B?S0xnbzdQSnRyRDViR0NERmJsa2tVbEFxYlRZSjliUGtDRThnQ1ZuRm5qT2JI?=
 =?utf-8?B?bHY1cmxEZEZFR1lVSCtEcm42RjVaV0FiVXBoTVVteHZicENBVmd6RDV1bzVF?=
 =?utf-8?B?bHhIL2JVaXNRMnpsZWNCLys2ZGVhV3p2eCs0dVFKb1hGR1VQMDBFcjk1V2dy?=
 =?utf-8?B?M1Y3dlhVZDJuTU1rWGs5KzdJT1F6WGFUSk4rMDNVTk8wYi9JYm1VMjlvY0kw?=
 =?utf-8?B?ckU4Wk9lNVlET0VCeFhmR2RDejh3MzAzTWVWbXJVR25BbWNVcUpYZEZYRWxF?=
 =?utf-8?B?RVgxM1N2S0NzTnNIMHUvSnVaaDZLS1BKT0QvSTRzSVlGaWlUUVpyc3BHaVZq?=
 =?utf-8?B?K0JSOVBaUEpqQ1F4amxDR0VCZjQweUVzSTZrVDVFcy9NVEx3YVhxYW1qZW5D?=
 =?utf-8?B?TW1ia0tPdTdDSm8yZ0hRaExPRStVSi9UTXhRQmkzY3ZYWGs1UkwyY2IzTE5y?=
 =?utf-8?B?WWd4NWdISTQ4b1F0ZHRJd0ZGVVFveWV0VDY2am9GMy85WWFYaHhnQUNJSDFj?=
 =?utf-8?B?U1lPbjV2WjhTSU40QTF6dWJpUEZRVi9BNE02RCtIOUk4QnIvTlA4eGFBOFQ0?=
 =?utf-8?B?a3FaY2oxc0VNYTFQR2s4QkZZbW5Na3piMVdqSGhTbnBXZ0t4WW9VWnZlamho?=
 =?utf-8?B?WHJnZGJjZUhhQ2dCWTZMbkhPc3dhbXIwR0oreTdXMlhZSWZZL1BKVWNGRmRW?=
 =?utf-8?B?NExTL2NsdWh5cXU3d0k0WFVjUVRtcHNXNThZYTZuRkFUSCtzdHVLakdMbmli?=
 =?utf-8?B?bWpyS2NWRndwQi9Vb3JJU0RFSjdONURMblNEazhZS1pEODlZdi9qdWF5VWdv?=
 =?utf-8?Q?N4TWGPt1nW4eWjqBOzwaFv3d5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d970489-dbe1-4b14-1fc7-08dad218b2a4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:47:54.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zr6wCxR1/ufbQeKkHMp8CS7x6KHeSett/pNUfwImapsnjSZjblipvpJPLoROYu6mEMn2XEfsi+godNkiBo7NfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8126

Neither page_get_owner() nor mfn_to_page() are entirely trivial
operations - don't do the same thing twice in close succession. Instead
help CSE (when MEM_SHARING=y) by introducing a local variable holding
the page owner.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
According to my observations gcc12 manages to CSE mfn_to_page() but not
(all of) page_get_owner(). The overall savings there are, partly due to
knock-on effects, 64 bytes of code.

While looking there, "mfn_eq(omfn, mfn_add(mfn, i))" near the end of the
same loop caught my eye: Is that really correct? Shouldn't we fail the
operation if the MFN which "ogfn" was derived from doesn't match the MFN
"ogfn" maps to? Excluding grant mappings here is of course okay, but
that's already taken care of by the enclosing p2m_is_ram().

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -691,8 +691,10 @@ p2m_add_page(struct domain *d, gfn_t gfn
     /* Then, look for m->p mappings for this range and deal with them */
     for ( i = 0; i < (1UL << page_order); i++ )
     {
-        if ( dom_cow &&
-             page_get_owner(mfn_to_page(mfn_add(mfn, i))) == dom_cow )
+        const struct domain *owner =
+            page_get_owner(mfn_to_page(mfn_add(mfn, i)));
+
+        if ( dom_cow && owner == dom_cow )
         {
             /* This is no way to add a shared page to your physmap! */
             gdprintk(XENLOG_ERR, "Adding shared mfn %lx directly to dom%d physmap not allowed.\n",
@@ -700,7 +702,7 @@ p2m_add_page(struct domain *d, gfn_t gfn
             p2m_unlock(p2m);
             return -EINVAL;
         }
-        if ( page_get_owner(mfn_to_page(mfn_add(mfn, i))) != d )
+        if ( owner != d )
             continue;
         ogfn = mfn_to_gfn(d, mfn_add(mfn, i));
         if ( !gfn_eq(ogfn, _gfn(INVALID_M2P_ENTRY)) &&

