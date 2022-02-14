Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E13F4B45A0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 10:26:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271299.465711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXcQ-0005Gf-6p; Mon, 14 Feb 2022 09:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271299.465711; Mon, 14 Feb 2022 09:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXcQ-0005Dg-2k; Mon, 14 Feb 2022 09:26:02 +0000
Received: by outflank-mailman (input) for mailman id 271299;
 Mon, 14 Feb 2022 09:26:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJXcO-00043T-7o
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 09:26:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c6b6420-8d78-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 10:25:55 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-44xOc3-cNESaSOgGW-xH_Q-1; Mon, 14 Feb 2022 10:25:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5522.eurprd04.prod.outlook.com (2603:10a6:208:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 09:25:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 09:25:56 +0000
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
X-Inumbo-ID: 1c6b6420-8d78-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644830759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMb8XxBGQTglh7QS0g0uFzDDbX+ZM/GP4Y8wGvBBNIg=;
	b=mRdAclEOr//rEAsbA5nW6vo6WGZ2K0Mtmi0xj6pSgO5ovwU+SOeW2clKxIqetaZvEP+z07
	0otW1HStR8JQWWyp/mWnAsrSS3oa3Bx0VaE5rkVuq/ZCw+OQtY1DVDTIv34Imyo0rbbNYW
	mFPRCjz/KEJWVBpMEejNqdSUYNGP1eA=
X-MC-Unique: 44xOc3-cNESaSOgGW-xH_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2lIMcFN/Xk1/EWFHbeENn5NOo8ur8Q/hwxL9PUUxZsKWoUoumgCEC0USv578EU4oP6xtkfpVewigMenXqZ0oxNZXI+n3zH03r1HkEfGUCZzxHKqdw5cijhj6J4nvNkdK4mto6DFR4EtfRN8RFcuOshYK73Cgl+ohNY3TrUiuaTJSLBWQcspkmKHV6kbTtRjRxsauuU21U2Ok+fah3nOB8QqYDDuT69JEMOUZAbRfdsfa9aOhdoWEjt2l2bPTIqntb6SBV9aO+Fb7UeBeDvGdVyfYugtQi6vv7pjQYuRa770Ta6hsFwk12dD+vZZ4W37bLh01AHmWsvQpqecq90IgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMb8XxBGQTglh7QS0g0uFzDDbX+ZM/GP4Y8wGvBBNIg=;
 b=TUitKUC7TY2iXqruTsb5cNw8Z9W5KyyNJ7FYo71aedaQR+xlcqsAuGMyvfpx5H7ZkYPE7LTboLOHc6nVgPIAJzJstQfAn/i9401hDdxHLO01m+1g0T5ocJVyGe3i+wbPgKK8Ziy5lfHLUTpt5RUyTjh4be2h9gJcuyvcyS8oUYQmjW7MlQXP8g0nQBN+shcIqE0yKdOfcYGgM4VkAfkkaeaGnkrQx/AJ/g2qeQQA0wxC0VYgdYJ/rsSZ2SrjxobxVEnvB1WTh6HoStyyRJ3EWy0shUY3+7eTbP1WwtrGbxabQ10eLPuT1sam6d3LFACnmylPdbHDv4E+CxzDSaEdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <123a9ae8-caab-01ae-5bea-8c590bd8f9d9@suse.com>
Date: Mon, 14 Feb 2022 10:25:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: [PATCH v3 4/4] x86/APIC: make connections between seemingly arbitrary
 numbers
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
In-Reply-To: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0021.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a71eb634-5e70-4ede-25e7-08d9ef9c010f
X-MS-TrafficTypeDiagnostic: AM0PR04MB5522:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB55220C3E8B672B7C0D4A1375B3339@AM0PR04MB5522.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kswmukf+cs3lUe73hJqwM7zK573UjtjOyK3XOdlQncPof+NAghW8VsVwDhci2KFalTP8uKZTUQsrPLIXMhGmjb+dHn4JTSenENCVw1LhS/2+MaXjB2dghW6gWOBVIjLxlFP9BkTeOgihnVQyUdZyMZxQBWQQu0QTeUJ7Vn/KzWXlq7inGRY+3xn6SmMZ2zRA9ahh/HNPwj8o0YVsehdfsEQSPCzkrHlazzOzjUixmwKyKttP3HPEzujppX4AEcygrjIxK0rhLbLkySs3eqqyhnIj4Oj7CBHb4w5GDTyD00VI6pJUuFV8WbngmAuzr4SRQa6XFdC0fzSM1zjvUfN5OsXTDoEOTV5KQMm5pkfG++m3kRcLWX+Ak7H8jmecsveaI9eOXWqdCDjLFJglJsHO7i9Lp8JJUKXAeCVMUSTfjmrEFnmCihOsCn4ErYHOw+NRhMjslZtBCUUCroG5kRfM0SDbndKeAmoB34zVqZTXhqm8cegEHZCiJNivFBLiqPSgpchRX7aCM4sftH8af6ifHI4FUNW/rC6Y2JyIcyoiGIss4C+gd5FJlMZzsnmSkbowEolJwnFKY1Omzxum9vUYRMKAOK3qR4WQgaIBoffSzsQ2wBubqs53+xRTJ3YMCnSNSKoBsj5p/bLYOB9lx/TItAu/ZeTEuxpVdzZWM0i6Asd8SVAVOSWMA/qTdQiHf7E/uS+R7UWSz1qLSx/eaRc4WxeJvU0HVZsQHCvmPKJmWETXTJRhsa6U8hjG9uHrRLqK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66946007)(8676002)(66476007)(4326008)(2616005)(2906002)(6506007)(38100700002)(8936002)(6512007)(5660300002)(6916009)(54906003)(83380400001)(186003)(26005)(31696002)(36756003)(6486002)(31686004)(86362001)(508600001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHN1Q2htMTd1YitpalFCejJ3UDc2ZjBOYk5YSmgyWGY5bmdBS2V1c2Y2T3FY?=
 =?utf-8?B?LzdTc3FHWWlHTXFSeUJ1VGtnNm1acVlndmpiQlB1T2Fzdng2WTZTMWVvYkpq?=
 =?utf-8?B?enZ0TXErTlFxZEt5emtVeVBndlB1THJpMTBhTCtPZjNkS0l0a3hTTGZtREZy?=
 =?utf-8?B?MzV3Qlc5bVJ2U2s4K0ZTMnJKNVFIMktHT2dQbjZpUFFwR0JrTWVpcFMyTGRu?=
 =?utf-8?B?MlRWc0ZkelZJUEFOZ3ZlUEorVElrTE1tZWRsSndLbEsvdWpsVXRFbEp4K3VK?=
 =?utf-8?B?VzhnSzBTUHVZT00vYUFJSnlHTXVwRnlwSDJ2U1NWVXhiTytyMHBDOTFzdHFJ?=
 =?utf-8?B?ek0xT2wyNzk2Z0RnZDdqaHFxdlorc0xLRnVVRk9Da3htVVVnaE1KZEF1UHMy?=
 =?utf-8?B?d0wrZEs3VzZoZnNiSmhNc2s3RUl3S2Zkdy9haC9FU05SZ0R4SDI4Yko4Szg4?=
 =?utf-8?B?ejFpUmx6L1FHUW1lNm43NXBxbW5aYU9vaEdEL2M3aWZWZXEzcklIOVBqT2lu?=
 =?utf-8?B?U0syOHBWU092eURBNVF4NVVmcUxnbkVtRWRyRWFHQXdpY2lpdUdTRmRlMzFm?=
 =?utf-8?B?UDhvYWoyMzc2dG91eVl4dzhJdTJJNVBoaXFTcHNsQndXN3FuQ3dCN2dweVU2?=
 =?utf-8?B?RTEzNnl0eFRNQThEYVBqckFVU0ZRaHIzY3RoYnFZQzFqV0VKN1pzZXNIU3JY?=
 =?utf-8?B?U045NVpQbFA5aDJoR1NyYStEbmlRS2xIOENQWmQ1RE5vMEx2bWVSbXRzckdH?=
 =?utf-8?B?TjlId3F6Sys4UDRVRHN0NEU2Nm5weG96QWZTeTgrU3VzemxUVjNuejZLU01i?=
 =?utf-8?B?d2gxak5lOGZDS1dFNjZxRGVSK2ZPckhRcEhJOHFVNEYyVVk4R1g2S1lMM0FR?=
 =?utf-8?B?M2ZZQjJrWWNPd1c0R2hLdDhhVmNXU1QxMzVWdHZvMGdQbURpa2dUZFhFcFRC?=
 =?utf-8?B?TmZaOXZYN0svL0tzS0trQmVjNXIydlVqckZiUlkra0RHaStKbk9NVjhraXlj?=
 =?utf-8?B?eWZlSEZZY01RTUdSR3VtTktyLy9mMFpMZElEZ0ZqSlFIODlkb0w0eFNCNVY1?=
 =?utf-8?B?bTZBN3E4dDJCbEQ1VmRuc0lta0pFQ243SUE2Mllvd0pkeXR5UGsxZ2RjeDVw?=
 =?utf-8?B?N3lwZUxWRGZnR0lydk9kZW1nTVVIT3VPalptVElab2hnWk1PcFh4eVQ2dVVz?=
 =?utf-8?B?RDQzNE1YbGE4dnRweHNadHdFZWtyeFdVekVyUFk1R05uMmdYOTBkUFlhVXJp?=
 =?utf-8?B?bTR4OHRVZmY2bytydjlkWXFzcHlYdzlFWjFVOWNFOHliaFJuMmVhWlFrbzU4?=
 =?utf-8?B?Zm5sZGdrT3pRSUtFMFRZYkwraHRFNTlMaWV0NU1EOVJnb0tCdkE5eVhzam9p?=
 =?utf-8?B?TzQrRytmU2pSNmZ6d081RERYcXhpdnJoY1BjWUhLRWZ3bE0va0RwWXB4WXZT?=
 =?utf-8?B?RWJsMEJ3N2xRVUNiY1lEbHBOVW1ZSWtqYTl4QXcxUHJBYXdzaERpZWNZNXdk?=
 =?utf-8?B?aG00NDBEdVB6MFZLbksvRjRhU0Q1TlNiRzRFY2o1NEMreUdFRjFlcm84OTdJ?=
 =?utf-8?B?M1VhdHh5UVVMbjExd1p4MmpraFN2WmFOYTNkVmNscEFJZ2gyNVkyWnd1L0NX?=
 =?utf-8?B?OHZMc3I5cDFnWm9md0tWVlp2REp4VGlvS1RzemVvaDN2K2xUeVpLVUFBeFly?=
 =?utf-8?B?blBuTkRnLzVqcHRWbmRkVnlyd3pPZXdZTWlpdFNmYk1nOE05N3dQWld5SktW?=
 =?utf-8?B?VE02K3VMNkV4bGx4c2VLelVuQjhzY3ZTaFZZaUI5R3h3WGtGcGpVaXJqOEV5?=
 =?utf-8?B?V0FmWE16MGVlTnE2cjJKRjUyUnpxK1RVQ1BxL0JzeWF4VVdZeUlrejZEQUFX?=
 =?utf-8?B?UlRFbXFHUmRNQnkxU2ZhS0lDYUN5RVI5Q2w5Z2FsckhGUGMxeG5oU0N0Wng4?=
 =?utf-8?B?anFVMTdMbGtMVGVhY2kxd0hHSGhkRXg0NEl3ZE02clhwcnJRSjBwVVhTTFc0?=
 =?utf-8?B?ajkxM3ZnbVRBK1NRdzVYaG1BVHBmbms4MGI1ckxLS2RPdHJrNlNQTkNKYk5W?=
 =?utf-8?B?RXRPSm1MZ1NpRWx0Qmh4V24yelJycjJsR3F0OHJlYzVvYkZHOUxiZWZuamxG?=
 =?utf-8?B?S01weFdCVnFMbGpvSEJPWGxQZ00yOG01Z0l5ZmFSNEM4UlhGbkM3bGwza2VN?=
 =?utf-8?Q?o45Xs/x/i7IqzxoPOXjBp0w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71eb634-5e70-4ede-25e7-08d9ef9c010f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 09:25:56.2592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfCXRqUmHuKmIHXDpbd9qz9DH02FHdx+3RNSlbt9rIpUkd6DuE2AhkmiXySJCj5LLuI3nWshpXgVQyUIFhTCGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5522

Making adjustments to arbitrarily chosen values shouldn't require
auditing the code for possible derived numbers - such a change should
be doable in a single place, having an effect on all code depending on
that choice.

For one make the TDCR write actually use APIC_DIVISOR. With the
necessary mask constant introduced, also use that in vLAPIC code. While
introducing the constant, drop APIC_TDR_DIV_TMBASE: The bit has been
undefined in halfway recent SDM and PM versions.

And then introduce a constant tying together the scale used when
converting nanoseconds to bus clocks.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I thought we have a generic "glue" macro, but I couldn't find one. Hence
I'm (ab)using _AC().
---
v2: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1078,8 +1078,8 @@ static void __setup_APIC_LVTT(unsigned i
     lvtt_value = /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
     apic_write(APIC_LVTT, lvtt_value);
 
-    tmp_value = apic_read(APIC_TDCR);
-    apic_write(APIC_TDCR, tmp_value | APIC_TDR_DIV_1);
+    tmp_value = apic_read(APIC_TDCR) & ~APIC_TDR_DIV_MASK;
+    apic_write(APIC_TDCR, tmp_value | _AC(APIC_TDR_DIV_, APIC_DIVISOR));
 
     apic_write(APIC_TMICT, clocks / APIC_DIVISOR);
 }
@@ -1196,6 +1196,8 @@ static void __init check_deadline_errata
  * APIC irq that way.
  */
 
+#define BUS_SCALE_SHIFT 18
+
 static void __init calibrate_APIC_clock(void)
 {
     unsigned long bus_freq; /* KAF: pointer-size avoids compile warns. */
@@ -1249,8 +1251,8 @@ static void __init calibrate_APIC_clock(
     /* set up multipliers for accurate timer code */
     bus_cycle  = 1000000000000UL / bus_freq; /* in pico seconds */
     bus_cycle += (1000000000000UL % bus_freq) * 2 > bus_freq;
-    bus_scale  = (1000*262144)/bus_cycle;
-    bus_scale += ((1000 * 262144) % bus_cycle) * 2 > bus_cycle;
+    bus_scale  = (1000 << BUS_SCALE_SHIFT) / bus_cycle;
+    bus_scale += ((1000 << BUS_SCALE_SHIFT) % bus_cycle) * 2 > bus_cycle;
 
     apic_printk(APIC_VERBOSE, "..... bus_scale = %#x\n", bus_scale);
     /* reset APIC to zero timeout value */
@@ -1337,7 +1339,8 @@ int reprogram_timer(s_time_t timeout)
     }
 
     if ( timeout && ((expire = timeout - NOW()) > 0) )
-        apic_tmict = min_t(u64, (bus_scale * expire) >> 18, UINT_MAX);
+        apic_tmict = min_t(uint64_t, (bus_scale * expire) >> BUS_SCALE_SHIFT,
+                           UINT32_MAX);
 
     apic_write(APIC_TMICT, (unsigned long)apic_tmict);
 
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -580,7 +580,7 @@ static uint32_t vlapic_get_tmcct(const s
 static void vlapic_set_tdcr(struct vlapic *vlapic, unsigned int val)
 {
     /* Only bits 0, 1 and 3 are settable; others are MBZ. */
-    val &= 0xb;
+    val &= APIC_TDR_DIV_MASK;
     vlapic_set_reg(vlapic, APIC_TDCR, val);
 
     /* Update the demangled hw.timer_divisor. */
@@ -887,7 +887,7 @@ void vlapic_reg_write(struct vcpu *v, un
     {
         uint32_t current_divisor = vlapic->hw.timer_divisor;
 
-        vlapic_set_tdcr(vlapic, val & 0xb);
+        vlapic_set_tdcr(vlapic, val);
 
         vlapic_update_timer(vlapic, vlapic_get_reg(vlapic, APIC_LVTT), false,
                             current_divisor);
@@ -1019,7 +1019,7 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
         break;
 
     case APIC_TDCR:
-        if ( msr_content & ~APIC_TDR_DIV_1 )
+        if ( msr_content & ~APIC_TDR_DIV_MASK )
             return X86EMUL_EXCEPTION;
         break;
 
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -106,7 +106,7 @@
 #define		APIC_TMICT	0x380
 #define		APIC_TMCCT	0x390
 #define		APIC_TDCR	0x3E0
-#define			APIC_TDR_DIV_TMBASE	(1<<2)
+#define			APIC_TDR_DIV_MASK	0xB
 #define			APIC_TDR_DIV_1		0xB
 #define			APIC_TDR_DIV_2		0x0
 #define			APIC_TDR_DIV_4		0x1


