Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3233B4B4583
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 10:20:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271252.465633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXVT-0000Of-V8; Mon, 14 Feb 2022 09:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271252.465633; Mon, 14 Feb 2022 09:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXVT-0000Mt-N4; Mon, 14 Feb 2022 09:18:51 +0000
Received: by outflank-mailman (input) for mailman id 271252;
 Mon, 14 Feb 2022 09:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJXVT-0000Mn-0U
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 09:18:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bdb9582-8d77-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 10:18:45 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-Pe1rmBISPdm6btwxw60gdg-1; Mon, 14 Feb 2022 10:18:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5701.eurprd04.prod.outlook.com (2603:10a6:20b:a5::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 09:18:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 09:18:46 +0000
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
X-Inumbo-ID: 1bdb9582-8d77-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644830328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NHclxgsO2wIjGnas3J2z0bvbE6Wc/i62+cLKn6ifHNc=;
	b=aYs7hdz+/+DPgwQq7HThKqP8+M405G657drDeuWEMw4cZAOK//VAVhjKHcYwWV6gh5F2YR
	1jx4VbcHZ96zc4aCY+izar/DwihE2W/D0oqJ12IEiHut//QPwP5JHPJKbecCXni2LQo/+G
	ByireRQkGHRLJrtXlqqkzJxTfnNwD9c=
X-MC-Unique: Pe1rmBISPdm6btwxw60gdg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1LZkgtKYVsPRUXovmXXrMqRrl8zc3WwhvukIHx/tzGsdhkcGnbzun8IMUkqus9D6mbpw1FefJjAqUpTnMWuczmi5SsiG9zolshSCiAN7Ur7fJLa4LPaGeQMch6bIwXvEhmNbd1uqvRYyYj7yWC+AnfiwK/4fZKBmhpUyE5XQLpCSxBIeUN4x48hTSKokfsq4NBNTkF8U3YYrsAjqRVUNdFVzrsptSSZg0H1YSU75oNsy4R81IcOe2dO3pbAYRSGilfmeTmd6LQRiBNgaijuNG/0vWpMuprnjnHBHbyBr5MFIhLCH0tC6cRYqGY5mlEWxx37SevnFMQcM5P80Iaobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHclxgsO2wIjGnas3J2z0bvbE6Wc/i62+cLKn6ifHNc=;
 b=YiLdY3Fyp3us9kbTfuSb4y5w8coSkobAw3TPbt3FBKC+k8v0Zv6CSf9QD2msHXOH21I+e/FD31EyWKtYEHUt2JZZlF93IlB870bkvAhg10ZwUdwMvxjSLn/9mlrjAVG0XUs3g1JzL2NrjDor30Q1H/KB7+Z1LKwgkXvi2e8++7SBhYsgXym+d+hprP/vJdpYw8un5KoT/y2kWOcRmIRagt2D4KcgKHz9Ig9RWr0DGGPQtd50o8p29eQud/1yTXXrW1TBoKxuy6ID1EGjW6pRSrDsw+moXlocB956NppIHlk38/YpDeLabHUNMEqJ0/EM2N1uQKJpOXfAKNYII9nw4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <92d00aea-9984-3940-2e2a-d54281e4c3a1@suse.com>
Date: Mon, 14 Feb 2022 10:18:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Intel: re-indent family 6 switch() in intel_log_freq()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0012.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49c7c767-5e7e-4b03-a397-08d9ef9b00ff
X-MS-TrafficTypeDiagnostic: AM6PR04MB5701:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB57014A3D496C0AB609A92F06B3339@AM6PR04MB5701.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NoAMbhcwcBjRCNl1734LlLB4UdnZ156+D7OiRHssbLaNIbnedP+rr8B+f3QBajaEX/VJxFbbEADl9NOKwfkXpqDKHb+Nn9lCgBLlIFhcimd3RHQzdtEqXdSfxbPJHO/D0V0iZ+D1FgW9CkKMnOV3vclQctKQcJZfKZfJ6SWMtNzayr8a4hfz6sZdmcNEgS1wMyd7U61JgADcCdfIZ1HCfJl3Zv49xJw0rtq82o05g7NNSjKLOdtmSyfXlEgJKi2qJGy1uN21ycmuUvQaPjS+NJQnYiwuCpyREESsMGRw2jPZqGr6VLAnBH41TS/BhLrU02Ll5IJhYJ4/Qk5Taz28T9Vwvnl2uyzc3dnF31J7q+r22KRw43dXPkNdiJvCk497VTnRAvfKAUlCnOmMK8Utkd2H1aDdKKWiKYU1K6RmQvWm9SL9US3vq3uvdLv61Uz1gR4Kf4aF8DTKcuFQiZND9plY4Rsa+QZZba24GnEkO3pFNstbDAv5dksZmW7uwLIcXFYzcyZ6ZDTzAyoBo+ZsZkN2trq+JZC5DfcEeq+L6/gq7wAkld8Vikv9fQgAWL92nXlV9rHQu/q3ePJS0Ad7A+un0wy73QCo3zpp68RIL2F+ZcNAva5zbGad1X2zoVL3SeAyuQHyRFOfOjP6ZmBpYiwOHGUjrScIGiRl55NjNM3sRi5Z3L6yjFlFXtTwcwcODLp0xfSq681yqTiOC4okRuDr0tCULEFFzHpP6yrm5AY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(6916009)(54906003)(86362001)(508600001)(316002)(6486002)(66946007)(31686004)(6506007)(38100700002)(8936002)(5660300002)(36756003)(6512007)(2906002)(26005)(8676002)(4326008)(66476007)(66556008)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmhQT3B2aXhxV2JGZWQ0eUNwZGdWQ1FsRFlzd2xHblVnaG4zb3Vhb1JiOGRO?=
 =?utf-8?B?NVc1cDZpcjd5amV1MktvQzMrZGZoY2tTeTQyMFVNZmlhNno3bVRtdjhWUG9z?=
 =?utf-8?B?MjFIOWJDdkhBVFhIWGNrMnp2Z1JoR1FpY3JJL3NaRzFhZ1NNMkN2ZXppWTFI?=
 =?utf-8?B?WGgvL25Hbm9lNzc4UXc3aWsvZ0pCYkVVSk5tMXJpWFR5T3loRWRIcldmbVM5?=
 =?utf-8?B?U2N4VGdiZVBqYnNRQng4N2VTN3huMmtIUEtpYTYrRzNpMkpTQ3lIL0pMNVVL?=
 =?utf-8?B?eHJLam9sZTlqK1ZwUHlyZUdpdzRTTG9OcGJ1bDRoc29rbDhiUjFrVkpvWUdN?=
 =?utf-8?B?cDhWYmR3ZG1UcVFWOXBFdkxjMDZETjJVQ2tZRnprdzBsR01UcGNHeVFlZjAz?=
 =?utf-8?B?anR3dWpLZzhEamJvRHRDNThkRFM0Q05oVmR1L2FYcnMxWXVubm56TXNFdU0r?=
 =?utf-8?B?TUxZYlNNeHloczAwbEhoT0FzUDE1dkh4TWJyc2dUYXExOUx6dy9ua0JKcnRw?=
 =?utf-8?B?TEtENzQxQ0ZEQ1JKbElxOGtpejJseUZhKzl4Z2p4aFlBdlZzLy9ud05ETlR4?=
 =?utf-8?B?eVpuU2QyT2NGclQ0dTRzRjVEbGlpMUFqLzRIcklkQ1FiNkpkT3RjL1hHYnNy?=
 =?utf-8?B?NmsvVEZhVk1Hc3FEbzBSYVpRb3kyZVNlSlpDVmxQOTJ2d1ZOdHJ0dWd5UTJX?=
 =?utf-8?B?dHN3MDBPb0ErQzVsWDVSbkg4ZEI2bHhvQUNybzZ0UldGbEoyZkMyWWRadG93?=
 =?utf-8?B?Zy9vcG9ENHhKRU16aUxtOXRIbG1HbndoTUpHOEp5MklicHdyd3VQTk10d0xY?=
 =?utf-8?B?YVc2enVzTmdvK1krOEpxUG92d3RidGVwRWF3VC9Wc1hGU2RkdG9jNlF5NkZM?=
 =?utf-8?B?Y3dmdW1hcExYYWZmclFJS2loNXNVZ01Uc0Zha0d0ZmhSTEd5aWpZT3dlaTEr?=
 =?utf-8?B?NFRROHZyL3pUSk8wemliUzBCS1UrVEVrRGU0RjVpMWhKMXBDUW1tZWVJV3FT?=
 =?utf-8?B?cDgvcDFhVDlmMWxUTGV6NlVKZ3IvcTNaUTJTeFIvUU84U1h0eFVJdzJzeWtH?=
 =?utf-8?B?cjBwUWJPdmltTi9zWUhrUVVjZjlQVEpLb2NvaHRpcHJCcXVOOHRTblZ2cFVs?=
 =?utf-8?B?aFpybTBwRlJxVGFVVU1uNTZvcTlqMERpVEFnZWNVaEp6UXlIYS94T2EyZDhl?=
 =?utf-8?B?TlREREV0UERPdWt6ZW9kTDdGU3FmbzRJSjlKM1IzbHN4U1AzK2JSQWRFRW5x?=
 =?utf-8?B?NnV6UEZkSk5HcGpwbUQ0TmRWcEw1NDdnNjI2VFdsOUpuNVdvUEc1VkZMaTFR?=
 =?utf-8?B?OERocytxRFFROWZxdW5kUXk2TUg2RXBoNHlQRlJ2WTBoT09qM0cxZE5namNv?=
 =?utf-8?B?azQ5QnNyMk5VQ0hNaVI2SEYwL08xbkV6SHNPVDZlWTd4WlBLa2dyRGtMUGNY?=
 =?utf-8?B?aFJiQzVvbEVTWXVKZkh0dVRmQmNoZ0EvOEhiT3hCVE9QVGVnaGFxOTdOQnc4?=
 =?utf-8?B?OXNPNGpGR0NOK1JRdUdaVDlnNjU0TFlVbmdocE15VUduQWg5OURFMDIwd1Fp?=
 =?utf-8?B?K2luRWM4NDMwZlNrUjJQeWltUnRQdmxzbDc1Qmh0TGZkR0RQemFiSGE3TXIz?=
 =?utf-8?B?Zld5Z1BueS9leXJ4RzJEUUZUaldjQ29YM0VQMytIY3A0NW9rOUNVWmp4LzBE?=
 =?utf-8?B?WGN4RzV0dFJMUy82WHhIU0RINDBzbzluWnhwcElrRmN4N3U2R1RMRWk0b09k?=
 =?utf-8?B?WHBuSElxeVZTUy9xOThkY3ZxOW1GSjYwUjg0YUVHcXNGbmhKb2dyQ05xNC9u?=
 =?utf-8?B?NWVnLzZCMVBUK3FOTUJoTHN3UXA0YThDY296dzFUNllzQ1lYbTdIRHU5WlBJ?=
 =?utf-8?B?RnR1ZHFIbGtENWJDeVY3ZkZsYVNidVA2L2hOUWxVWnRYd2FzS01nVHF6Q1RP?=
 =?utf-8?B?TFIrSzduSS9POU0wc2ozKzEreEp4Q3gyTDhFK1lIODdtMVo4aTZuZ2xCN2Q2?=
 =?utf-8?B?eHF0SEJ6K2pPcFJ1d1JTS3Z4T1d0VUkzc095ZFVjM2dpaUk1NEFraWZySkk2?=
 =?utf-8?B?WFhnYU5FYWkvK0xIOXIyTWpHaDZCTXdkNXJXcEZKUWRRNmthOEE4S0xiNU1s?=
 =?utf-8?B?T0ExME1yK1JiOGdtNkhsV2dGRjFkcEtpYjRiNkxaUTcyYllwQTZndHNwd2Y0?=
 =?utf-8?Q?zEWd8DOvs2XoKTPRXfojF6k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c7c767-5e7e-4b03-a397-08d9ef9b00ff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 09:18:46.7389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LDO4MM3Wdj3F8ONEjhEuvpI+gUmVFXLx00RgK8ZHWQSRBr2h3bDck9PigSsx+2sI/jCzkRoair6kt5UUuYMIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5701

This was left at its previous indentation by e6e3cf191d37 ("x86/Intel:
also display CPU freq for family 0xf") to ease review. Remove the now
unnecessary level of indentation.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -468,35 +468,33 @@ static void intel_log_freq(const struct
         if ( !max_ratio )
             return;
 
+        switch ( c->x86_model )
         {
-            switch ( c->x86_model )
-            {
-            case 0x0e: /* Core */
-            case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
-                /*
-                 * PLATFORM_INFO, while not documented for these, appears to
-                 * exist in at least some cases, but what it holds doesn't
-                 * match the scheme used by newer CPUs.  At a guess, the min
-                 * and max fields look to be reversed, while the scaling
-                 * factor is encoded in FSB_FREQ.
-                 */
-                if ( min_ratio > max_ratio )
-                    SWAP(min_ratio, max_ratio);
-                if ( rdmsr_safe(MSR_FSB_FREQ, msrval) ||
-                     (msrval &= 7) >= ARRAY_SIZE(core_factors) )
-                    return;
-                factor = core_factors[msrval];
-                break;
+        case 0x0e: /* Core */
+        case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
+            /*
+             * PLATFORM_INFO, while not documented for these, appears to exist
+             * in at least some cases, but what it holds doesn't match the
+             * scheme used by newer CPUs.  At a guess, the min and max fields
+             * look to be reversed, while the scaling factor is encoded in
+             * FSB_FREQ.
+             */
+            if ( min_ratio > max_ratio )
+                SWAP(min_ratio, max_ratio);
+            if ( rdmsr_safe(MSR_FSB_FREQ, msrval) ||
+                 (msrval &= 7) >= ARRAY_SIZE(core_factors) )
+                return;
+            factor = core_factors[msrval];
+            break;
 
-            case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
-            case 0x25: case 0x2c: case 0x2f: /* Westmere */
-                factor = 13333;
-                break;
+        case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
+        case 0x25: case 0x2c: case 0x2f: /* Westmere */
+            factor = 13333;
+            break;
 
-            default:
-                factor = 10000;
-                break;
-            }
+        default:
+            factor = 10000;
+            break;
         }
         break;
 


