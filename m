Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B57CF85F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 14:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619290.964113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRph-0007EK-Mx; Thu, 19 Oct 2023 12:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619290.964113; Thu, 19 Oct 2023 12:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRph-0007BH-Jp; Thu, 19 Oct 2023 12:08:57 +0000
Received: by outflank-mailman (input) for mailman id 619290;
 Thu, 19 Oct 2023 12:08:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtRpf-0007BB-Cl
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 12:08:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2070.outbound.protection.outlook.com [40.107.13.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45d76eed-6e78-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 14:08:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7528.eurprd04.prod.outlook.com (2603:10a6:20b:297::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 12:08:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 12:08:25 +0000
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
X-Inumbo-ID: 45d76eed-6e78-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIDSZu5FS154AzL5yFbyD9vn5yt5eZxrs4Rglc2oY7iGXqNQ4VaV2MqDR9PLrtYoL0uRdJAOmP8CVCCKcim1PkD6DrPRbHJGKVVFQ7/Nqx7t2BQmsxRacoaYqkFdFZNJH6bMHKQFzHmAWrbHsAo3pXYcGz/bFXzthO6Eb2cr35XueUNVSDbuYdSepRUjuEdivtp5UIQBGT8xsgV0qT3x9gbd8GL69WVSlmKloOI27L/53kFENe++TM7ayA3waSwWJv4ktm4ZJXCQEfVQQRbcRlWqjCprlwlNACyzQZvIFN4+Ubf4WoVt1QlTYj1T940xJW2a/89iCIooCnrgK6WVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPLOdN0IunUdktcorMlI1VaAvn/ISjH55YTNG2RP1hM=;
 b=M6PrHeAvlVEiVcXojUcKbtOdU1xo0aNKaUsA89NausbSpcqbx6hiwKLNDLnA2UzCQuZTCYjPwcBG7OwcmA5MuD63yjR2kP0A78D93D//oW0SSJ7eJUDYGFH99Df3EACL4kERkAtoG5uR8ynKb3JC5HDZlAd5sIaPW+lToUGaWHGId+89U5sBwZIfSzwJ+vSf0tThh8bE0laIg+KJhwcJyIVW+i3QOCQ2AqbOTzCiUIOI4+1NbiY8UxzOah5PSBqWep8YX29ILgR3uwActvUvJfCWW2iQPw8yMBHMhcKzv+y9VZahI2hihbWId3agM+oZ2fpygJsTXGiniDcaSZAsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPLOdN0IunUdktcorMlI1VaAvn/ISjH55YTNG2RP1hM=;
 b=g0ad9+bqnishRYCRGUkY3uMFVaVhWGLkauWQLy96zgi+XoGdE7o1x7XQ0afD7GTWEpFClW3Gp3A32VL8X37jst9AZJfA0FF+PO2Xpj9rPbQUp1seN2je++4iLcC5u4N0BKjVLauVbx7IbB2O7Zh3M4lO1pv96HXzCqHqMTQCJiYa10vlm+XRiMFJ4gGMwvQ+0524kpmrQE8roZr+31Efhb+milrstUQMs2cG0+UbquKLh4K89AIZVqTN5rVx2e/kuTea8ot7bOm5QhRPg7AjU3p3bXmS462hA4rWUCGiCseXd8YRrhRuAsESOghBTgerO15wNw7cGzerhU3EPIX/xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16a32be2-6982-2463-3d71-383a21d7e074@suse.com>
Date: Thu, 19 Oct 2023 14:08:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.18] EFI: reduce memory map logging level
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 4584eaba-c405-478e-cb2e-08dbd09c18e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KHnK6VrGGPErR7Ow7XWMgY9fsEdlgZtIHUc/HlglZP+/vx7vFJVl/aHaVscy9r0lU1cPUH9mLdgw75hXRY+K9W1hhHK5aGD511ae1J1RogYtejRHGB6/08gqfbxaSlzIioDQJdbpMpPd7UahB13c05SUzxRXXNnSpVHnyn1SZDM++vQEHPaPzgmLqyJbSOtud+Y3Jdt86mYzOWRdcxGXaCiWL7HbtndB2rM/VYi98VgbqVjkSbYiUduMhrd6LpOcu3mxZRUPmH6qK7LlpwYK0wo0dC9B2RZMrY8pptJiJ/shojdCMcc/w+5mYNfSBnuxCcwoacPeMcrXSLHkcBzWer0chkPTHlpf9UBTAUYj1Pidrf5i9psXp4VXhnn8+SR0429/8mGacbC/o5Ok7MmmlFSsd0TTYRYV+LePZ5p6T7px8+gB3PyZ3fB6m7QEO0ILDyPdaLbyhFCKn3Z3dT8Hp25jfOFdLK2sYCquOqv8bzuCE6AITLblFmfHGc/3Xx+HG+DHVF5CDG/0wbRlShP0XPEHw8C+E+SvaDQL6Elm0emctQwUTQ9uS5LEYtjRrZm4XdsQissKPVrS6lgi+YMy0fj04vU5nRrsdr0jLwLXHPtLopaxutK+EoJx570JtolNpoVLLeKXVG6JvJmeO9g6Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(86362001)(6512007)(26005)(2616005)(478600001)(6486002)(8676002)(5660300002)(8936002)(41300700001)(4326008)(4744005)(2906002)(31696002)(66946007)(316002)(6916009)(36756003)(54906003)(66476007)(66556008)(6666004)(6506007)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXlQYXJ1NDF3czg4U01WYW81WTZPYzlpSEFhWVEvVjJSaHpxVlMxRFlaZ0R1?=
 =?utf-8?B?NUlOTW41YjRmWk16VEl4aGtWZ2dPRTJIbEdWR0JWeTNxTGhWSXE3ZTEyTGph?=
 =?utf-8?B?a2pxbUkyd3Q5VUtlN0xva0FHU2U5cU85TDA0L1ZaUzhpbWw1QjV2VXFFeXo4?=
 =?utf-8?B?KzhyMlU4SFBROE5mWnlMYk93MW5aL1JFaWdhQWpjV1dSOUtRckNMTkZlY21Z?=
 =?utf-8?B?U3Jpd3l3aHpSR0xtUGU1bmlzT3JZUGJUb2xaY3dCN0Nua25nZndaQVdxenFv?=
 =?utf-8?B?OWh2bFNXTWovK0dWSUE0SENsN2hBZUxaQ0J2REljSW9rNXgrN2ZCY1Q1QU16?=
 =?utf-8?B?ZFpQL0F2M0NjdGVzZWNiMC9oVFVJNzlqQ2t3c2xudHBsVXNEV1VKcVd4L2Rl?=
 =?utf-8?B?UVF1OEdqcjk5U3p0UHd5V0kycDMyOWUxQnFCNVpST09nUEgzbC9JTjJFTzRx?=
 =?utf-8?B?K3lYd1FZbjlmWEFZTm93K1g0SE1uWGc5b0gvU1ZyOWxVakcvSkFyYy9PMUtD?=
 =?utf-8?B?TTJRMGpMZnVvTVh3NVBXMjJSbW5xUkdaSzlCVDNVcVNibkdwUUJrcVFmWlpm?=
 =?utf-8?B?ZGdHaFNRdlQ0Q0k1SzNYQW9PWUFReVdlRzRCajViVklxS3pGRnQ1dm5VVnVo?=
 =?utf-8?B?dTBZa04yMGZpS0pMZkxHRnFwSjUvalNKVmtVbVlLL1BMeFBZZFZtdHQ1L0g0?=
 =?utf-8?B?UW91QWlkNml3R0JUM21TS3NPUzIxM01oM1M4a2owZ2x1Y0ZvcFdvakVyY3li?=
 =?utf-8?B?bWNJWjVKSjJ4Z3gzcm5EYm9HbngzTFRZR2srV0Rybzh0TUc2V2hMc0RtRlQ0?=
 =?utf-8?B?aWNrVElmeTlQYitEZkZ5M1diN3FmWkpKZmcwZnYvRUlPaDd0ZHhsa1BmSkRJ?=
 =?utf-8?B?T0FZUUlWY2hFUkt4YTJ2bW9nQlhIM2pyV0haRU93TjhlbjZoU3dFalRPeDZq?=
 =?utf-8?B?TVIxYmVEdzdzSy9LbDRmUlVVU1ZReFI2aWdFZ2gzdnBnODlhQUptQ29YNEJN?=
 =?utf-8?B?bnFVYW9CTnpta0paREZRb0YvN3JVRUNHRWhQNkhhYmIyb3BndStmTU4vcS84?=
 =?utf-8?B?Q1BKbmlQK2U3d1BiUDVwZnRLREtwbzNDSXZXOWtWOFlodVpBYVlEOWxoY3pJ?=
 =?utf-8?B?YmhUMEJaQlhaTjdQTFlhUGlpSnUzK2g1OWhNQVV4bW9lREEvRDdNVXlmVEdn?=
 =?utf-8?B?MEdGbHdBbWpiZkF3Y3lRTkxRYnZYcnNXdGt3Z3gvL3I3VUExU1VMSVV1QkdM?=
 =?utf-8?B?MmVIRGd0Y0Z4SnY0RDVhNktMbkdmUXorc3p4T1p5NER5c2FJbU1KVHJoanhx?=
 =?utf-8?B?aTNiREgweGcrY3hsMjhidUwveStyQ3RWUDhkTFlQeGNWb0QxQnBqeHE1TGox?=
 =?utf-8?B?dUp0R3d5SllaenBQWmpXNmVNM1d1YTJ5ajJWZlpDMTU2TnZUM042cDNxZWxs?=
 =?utf-8?B?dytuSWlzWjQxamh1N21xZ0x1N2tQcGFrVnFCeGxGRnhkaytLamppVmYxa3dJ?=
 =?utf-8?B?bXNvTnVkL2JMUDdjNklKcU9ZUG4zeGxVSGVaQ2srVlZybEhZUW1GMS9pdjBh?=
 =?utf-8?B?R0xGWnBEbWNERWxoS2I2U3Q1dzRTSThKWHlKNmFqRURRQVFPdVdSWUdVM25J?=
 =?utf-8?B?QVZrcENib3dCMUU2ZnozaXkxcjNidDJ2NDVOdklEaWxLNTl5U3d1aTlRZzFK?=
 =?utf-8?B?WmlPRkVOOTkySWUzRVRPdFlJeklnZE16UXRHaTVicEp5Sk8yZ0wrVm0zSU9j?=
 =?utf-8?B?NmkzSGJwZzZrOXNFZXBCMTlaa3NwRExtS1BZdTBzeHFXRkhrTFlrL0Y2L0M0?=
 =?utf-8?B?Q1pvZ1lieG1mSFZSVHNqMmRQT2RMN3pCZ0RjMEY0bXRuQTBOalB2K3FEb0xm?=
 =?utf-8?B?ZHJQR1FSbXdYNU1ud25NM0lDZzdNMEtVWkQ0SERIdE5QeVJHaGJPNk9aUy9k?=
 =?utf-8?B?QjNmN2hiK2F2dFpTS2RmNEwxdFU5ZUNLSEpMb3ZONUprbC9zV1ptYmJKazdJ?=
 =?utf-8?B?Tm5OY1RZNlVJeXVSMDRTY2FKamU1VWVBZVRoYmtmc1BLWGFvN3JvYzBTUVJx?=
 =?utf-8?B?S2RIbjhFdms3UjJuUW5OamFJY0dPZkdOenhSUjJnMytSVDFoelQvL28rK29r?=
 =?utf-8?Q?pingFrexJ3Xf/zeqCFxYIn19M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4584eaba-c405-478e-cb2e-08dbd09c18e3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 12:08:25.5189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sukfhjdN5mus5fBY+BIjBVyW4omySIfn4UkPHXHxflfC+ZP5RYSlEB/wyBNEGuFe0SDFRk+UyihtA+BvvlXzeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7528

With the release build default now being INFO, the typically long EFI
memory map will want logging at DEBUG level only.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1677,7 +1677,7 @@ void __init efi_init_memory(void)
     if ( !efi_enabled(EFI_BOOT) )
         return;
 
-    printk(XENLOG_INFO "EFI memory map:%s\n",
+    printk(XENLOG_DEBUG "EFI memory map:%s\n",
            map_bs ? " (mapping BootServices)" : "");
     for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
     {
@@ -1688,8 +1688,8 @@ void __init efi_init_memory(void)
         paddr_t mem_base;
         unsigned long mem_npages;
 
-        printk(XENLOG_INFO " %013" PRIx64 "-%013" PRIx64
-                           " type=%u attr=%016" PRIx64 "\n",
+        printk(XENLOG_DEBUG " %013" PRIx64 "-%013" PRIx64
+                            " type=%u attr=%016" PRIx64 "\n",
                desc->PhysicalStart, desc->PhysicalStart + len - 1,
                desc->Type, desc->Attribute);
 

