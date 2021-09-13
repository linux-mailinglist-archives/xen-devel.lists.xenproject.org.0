Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6D640984A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 18:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185792.334530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPoQC-0006Lr-8t; Mon, 13 Sep 2021 16:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185792.334530; Mon, 13 Sep 2021 16:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPoQC-0006JH-5q; Mon, 13 Sep 2021 16:03:04 +0000
Received: by outflank-mailman (input) for mailman id 185792;
 Mon, 13 Sep 2021 16:03:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPoQA-0006JB-IK
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:03:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3459a061-50bf-46ab-bd10-e2eef857fd88;
 Mon, 13 Sep 2021 16:03:01 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-O-cC-OpeMyuDGSfaymYevA-1; Mon, 13 Sep 2021 18:02:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 16:02:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 16:02:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Mon, 13 Sep 2021 16:02:58 +0000
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
X-Inumbo-ID: 3459a061-50bf-46ab-bd10-e2eef857fd88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631548980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6lVGNSeDPKamwhrf6Flt+scb/eycOt6W9k3kD4zIHAo=;
	b=EkBFuf/p/eG7glXqg9WW6jBqFMFDGsIfTSVqh4uz3sefHosoH3hhmwV/rJpatQOvE6RPsO
	11VtTjVc7NlMDTG7um8+gw7JS0x/eaPTntaDFbWRcJTIrHZPWCbEcFig6H7Mjg6R5YHCaT
	e+fU8aykdDld7CwWTh+Z58t8dlKZ2tE=
X-MC-Unique: O-cC-OpeMyuDGSfaymYevA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgbAo8RKb+C8vIRoXni4CjMCHnRpalhbcb2gQD0IWwBfhLK680+PdMwi3pWx9Tn3wukla5uIy8LilAIZ0IZEhQFCK2DidFSKqIPtb/Ux7DvX9XVLXAH5tqikNj6U1BBvgY7wtxZNyRJCiD8IDkZ1CtWyi48b5VFuVS5omnzDSbIfFMNitLffbtTjK/lBczISiWKf8J3yhQtBLQr6PafXrnOR0qs7wyy2WNnKrUhlsSAzwGEO0vpEyZunkdCjuAA3rjUy6/PofwrL+s1C1mzzU7s5oSRH7/G7DahX+76Eajn/n0MOkX/g3hI+YpXNMDqY7/90HZ30SHmGpmZV2DkAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6lVGNSeDPKamwhrf6Flt+scb/eycOt6W9k3kD4zIHAo=;
 b=C7igSjMt4Lu9g43c9I5jC5SjLLD9ZYs5zCn/AisJD9FL7DiElSWTUCAQWhjjSqZuhC67QbQw6DnryTjLuz+khHfHWXvTHsXaAz7bekddUqgEkqmsq5oh32V/BQUt4mys41cYtgbMbkC/uOCF1mEFsHsKsAHzNZ7wYuxzX57ory04v0OTRqDx7I337HwXahBW01Qpdsy2+8jmAIMVxy3ieZFxFL7p0clsOIvqgqCqU8FHEEc5SblaIur78BwyHtVV49k8+IF3HoX3bzzs3D1W4Xv4zx/kIr1TBzaCHd9YsQgGpi85/odjEbfoH9Ay+y4evvClS3HvQDzpyhIWSNQwqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/boot: properly "ignore" early evaluated "no-real-mode"
Message-ID: <6b7e3281-4893-a5fb-cd1e-5b1918a1ee05@suse.com>
Date: Mon, 13 Sep 2021 18:02:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe030721-0855-482d-a5b5-08d976cff4c4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48452B97AA316AE7E111E75DB3D99@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tpEuRLjoTrY0sHB4865CyqI6na+HWViWAiAWEavnWuUUNRl8Kfrnh6NJhxEzfqKPH9grAlDJEl4IV/GR/0f9X34HYYPpHR2gfB34pQ1CkG6E3LWINhKOPeFE274kLDsXPallBtUdzeXOwA5svbzKVI/ABdq/BlKVipmNDgFeT0PBNQxJ+VW1tRVpSmzaVkXnbGn41SVgjnnVb7jsyBD90tKP1VuF/RdqqWVHv5J5ukv2sniBO0YW2PCrL/+LwVywtBtg990Ly6SODlqYRp74R0e5dRxzbjKdACmXMaR6T1B74HnHkWZx/HMVSTnpVPGKIJK6dh7OzupjFLMFNQZUlg7CZ+l9oV8j93ycKCNesZSnj1UVxtA9ErxievtuSJgmaP8STEEuVHZSUmWYA1p4v26BheK3G4tyTZIBbdeJKqJSzI+69Aj+DQfI5a0SIKhZ8XtOuoB6ts6QSTkTLClfJkggui2p1KSvfJbXeyz55Zje2uahyc5nfvuHMpLXCP0kZis8f+dyhU8payO/DTsRZxsWz0rEbDpKc/TJc8flvKjy857U21KwOSSUi3zae+syOHnm1tKzHJwISYodyTbk6Rxw3gHiO6Z8tq1wvugQa6Cg0bz39g0N96C8TpbTW1rKsP4cXGV23fgG2Z4CljbO4FgNCebLUTXfbDRvEuWBrV7KIB/RfIo+mPEEmvYb3RdOvmgCyN0gf3wk8K/IlUqch0Oe/wNmvVrX1s9Hm7VTjD5q6uaADlnE1XL/onhuMlcO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(956004)(36756003)(2616005)(508600001)(5660300002)(54906003)(6486002)(86362001)(8676002)(66946007)(16576012)(316002)(186003)(38100700002)(66556008)(4326008)(6916009)(26005)(66476007)(4744005)(31696002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHkzQXU4RGZqcjJ3eldKc1I2U3lwc1p4ajZRc1Y3M05HV2JDU1dHSGNUdUs0?=
 =?utf-8?B?c0pKN2VPZ2ovMm1pTXF2TDdVdEU3bzBMckV0QXI0NUdRa2Z1d2l6cTkyVkR4?=
 =?utf-8?B?cmN5ekg3dG4venNLY3BPSFFlZmZYRTY5dnhZeDNXZElpcVdxbjdudUx6b1Jy?=
 =?utf-8?B?UUFVMHBVSGFwUHhOM1BQNnRodWluYkJzWWtoNTJmVENxOHFsbldOKzFoYzMy?=
 =?utf-8?B?MDNwZmFpaHl4S0hhTUVsR09qZ3VIY1ZVY0tQTUVNbXQzMGU0OGNRd0NVTCtn?=
 =?utf-8?B?MmVLRDJKRG8wK254R1NQeVFpVktZV1QwVTRmaWEwZndRaWpnVi9SRGw0N252?=
 =?utf-8?B?RnQ2ZXlta29LKzBlb0EzWGVKZ0VRTUFhM0NkcUh6UHI4Y1MrTmRkZVhpbXh0?=
 =?utf-8?B?UUtWUWtidjdJQlNLWkIwb1dvTmNZQkRPZXNUMWpPZEdTUjhOSFZnTmJvRHBV?=
 =?utf-8?B?RnF1L1V0Wml6MDM3MGdma3kwWlVWQ1hMQ0hNeSsxRU5hVkY0WnlFaVp5VkJi?=
 =?utf-8?B?U3dZaFdQK3FYV2J3WFpQd3hxandOYXowYjZuSUxjVlQxS2RZUjBTNDhsRHdu?=
 =?utf-8?B?Zi94RllKbmh1TWdRaXJYNE92eGZ6andnN2QxMFlKL09wYzVubStHSkdreVc2?=
 =?utf-8?B?MkZZZzdZdWVyMFhOVElHdms1a3hHRVJkRjVkVURMNERGNmRXdklzZFVwVlE3?=
 =?utf-8?B?SitWdzY3a0Mvc3JmeDlFdXV4dUdVcEJDUSs5emhLUTZuMnd6YmRTRHlRWWJP?=
 =?utf-8?B?a3lRajREV3BHTHNrVTREQUV5MXRZSXRZbThaeStuVWpYeldpeVN3SHdjSE1m?=
 =?utf-8?B?Z3pNbHovU0RBTGFVaDc5bWdJeFNndmVXMWc4b2NvdnRJMFRMZWtsWnQ4Z01o?=
 =?utf-8?B?SHpVYi9QR1pPU3JFTEwvYmRDWXV5K3VpYzVYQzY3cFBOZW5lVW40SlhyY3or?=
 =?utf-8?B?YmtZTW5VOEZZaVdTN1IvbGg3VGxSSFJieTlnZWVYOXFmMExnSlBtSTBRdU1V?=
 =?utf-8?B?MElSOTRuNE5jRU1wT242RHBsMm5zVWpDV1RXUDRVWVdXYUpQbXl2Y3BjNFpI?=
 =?utf-8?B?RlJtOTdIWk1nZ1ArOEJKNlowZmxKVG56ZlZMbkRaWkVXZFNicHJ1K0NUWEQ4?=
 =?utf-8?B?OThIYXZaM1NTRTd0MCtqQnpUTTZyU3JJZlpvTGFnUXdRZmcwRjhEOURLUUdy?=
 =?utf-8?B?TG0zMGV1MFNvMzdGN2p4MzBySVJ5SDNvN1AvMGRkMHVNcXMzOFBtMTBwZ05R?=
 =?utf-8?B?S1J5UnViaGdmRXRVRUFGYW5SUklhK0RMOXI3NHNrNHdMNU9vbHNEcU9LeEdj?=
 =?utf-8?B?c1RIVElzOTNwNld6M1lwY1JDcEN2R25HeG5kazZGQllnSFNEOGpMMlpEMHNq?=
 =?utf-8?B?NElweG5XeDVJYTBmbGZGV29aenFQVGVjWkRlL0tkaitqM0xJZlY5NjNiUmJz?=
 =?utf-8?B?SHIvWHBIYXV3QlZwOXZhTVljdXhKSi83VmtkZ3E1Tktibk03MkV4VVkwci9O?=
 =?utf-8?B?cTFvdWhCcUtZamkybEkrMGRndG01QWltQTI2K2lUSkl1eWI5N1Zwd3FGTnAz?=
 =?utf-8?B?clk2dmZIand1ZVN1OHVkV2VqK3BQY3hVME9SUkpVeCtwVEl1eTdpamJIRmVE?=
 =?utf-8?B?blErN21TLzRCeTRSQStKTVpUeGdWVVZ4akRZYnIvY0ZuOERPNXlxeTlPWkhK?=
 =?utf-8?B?dXhGdE1qNERlVlJhV2NES3cvOUtKYnhEUi9yQWdJYTdxTFhqS25VUGNYWjd0?=
 =?utf-8?Q?CFOJex0UTrRPMrhu0b7T6o4HcEt4swbTzGBg2XU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe030721-0855-482d-a5b5-08d976cff4c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:02:58.7871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0KhxZcS0pEmD4TLVtHSiA/3jNATMl1d/+Ng67sLfLelf8vEw2XAVT9zyHWZOzYMUbCByZXRzK+woNR9kHONfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

The option parser takes off "no-" prefixes before matching, so they also
shouldn't be specified to match against.

Fixes: e44d98608476 ("x86/setup: Ignore early boot parameters like no-real-mode")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -692,7 +692,7 @@ static void __init noreturn reinit_bsp_s
  * has options that are only used during the very initial boot process,
  * so they can be ignored now.
  */
-ignore_param("no-real-mode");
+ignore_param("real-mode");
 ignore_param("edd");
 ignore_param("edid");
 


