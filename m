Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C64174085D9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 09:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185501.334195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgn2-0005Zr-KO; Mon, 13 Sep 2021 07:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185501.334195; Mon, 13 Sep 2021 07:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgn2-0005XP-HP; Mon, 13 Sep 2021 07:54:08 +0000
Received: by outflank-mailman (input) for mailman id 185501;
 Mon, 13 Sep 2021 07:54:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPgn1-0005XJ-4W
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 07:54:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aacd3fa0-6a5d-4fc6-9af7-85e8a96afcda;
 Mon, 13 Sep 2021 07:54:06 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-OVERijrXP2qmc_dFFo24kg-1; Mon, 13 Sep 2021 09:54:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 07:54:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 07:54:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0045.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 07:54:02 +0000
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
X-Inumbo-ID: aacd3fa0-6a5d-4fc6-9af7-85e8a96afcda
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631519645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oyitoaSUmmKQXuQt8LX+L4zVmOF8/FORFu7eBvzwIt8=;
	b=Da+SpHajWkqxifr29gUkBl7WNCFj3PJcduV3Z5iNqjF824jW9AuUG0oCD0vByJLLFa7mHL
	9iEtSWZ3kPPlS3nLIYKlRrsLYleszxNIE5GRF5XS+JHrlbVvhIBKtLkoEGsR7gYGnnAcSm
	85/uAO+5r09vv3Q2L26BNUqJbgsStXM=
X-MC-Unique: OVERijrXP2qmc_dFFo24kg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/Gu7hZ7xfvVe7ZKlC05a+eFu8XlPNaMq3IWKDfe2gC1Vscm+d/bd/yII0rIWtjxv+vZw4PMWF8ugEPNpr6j0wuNo4CTuqdiZi2oH7+rRBV5/TYpK4XlL3U1d2IkczjSWjY8eq2DrLZG/a9VF6kA5rHhQMcB422wm1beNaGWdQdhDYSx1I9uZOppmN+LyPtbAFDV/cVTrzS3FKPcw8ew/e2xHCWMMLOCA2rBZGcHkRIWb+AG/+bk8xiwQZsifn7CZqhbf/lpbj5t7oHnJOaccsnvlG5vjp/NnTLryiX0Z3oylwNaiSIwA7k9He1x7dIWqxeQ9NWjTERZnEjn2kqkYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oyitoaSUmmKQXuQt8LX+L4zVmOF8/FORFu7eBvzwIt8=;
 b=COfuoosgniN+lUHyUfRjMP0Uip2jRJSinMogZ4RKuSqfznsch3RdcnERGDrAKUAy2OO52lQLSkAnAw1sM9WUZ3GN2H+p8J0r0PbLd8gspKidUsmQxKOfur3nOjB78eaptctT454f+wGcvgjf3Rqr7aiXXr1OwNouSWJDdOeaJNTOm3Uxqme6Ii2XHYQE1cEdDQBeaAkCMMWc/9y2Lq2VMhqfjdQEt5tFQ8kUn0QHFo6w/vC3ZYZZaQOTFp0t9gNbsv4H9sy2l3UJqfl4A6twr7DPIV6eKC9Yb+J2f3n2Qx8D6PeUm0jA7jwvuzgAwJ4OEY/yIlMx6BDr5hH9G2N4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/ACPI: ignore processors which cannot be brought online
Message-ID: <370f1ebf-b8d6-70f2-b9c5-d642f710c550@suse.com>
Date: Mon, 13 Sep 2021 09:54:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0045.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e07178e-2b1e-44b4-9dac-08d9768ba760
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2448B215A03DDE7E5AED8AC2B3D99@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4CvPon3jrgMUD1y+aiTFPXYMuNtKsP8dUFa5/pKgfpcVYygqCFf/UtqfXpOSDwQfROfNKUy3lZDNAqTED2hrJDuvAhjAG5nqwDISDee6cC9s4I7X72HXT4XO3ZCqdohXO74gNPgF1ZLnzaD+sQMjWYg1L7xxrP3ikm4SEkJb/sVEXxhlsFrL9xVLFQFbocZqD6WK18gqrHUr5g2mpRY0yuVLvFRfbeuDe8NpmUHIwgRwsMuDoTvZ9TrLtl2OQ2D3efPV0eGLtuc6rQf8H5mFDrZFYyjx0SO72qiai8AD/0BM5qop1jZDZlyIVcikpbH4tgF4Rqels6xNFr7JZ8xnk5B68+LxwIargeO8bZnE+rKRreluAW7FnCVgLt173jKt35CbJSBiWo3ZZd+mwAe0C9RFj7dpsZzMvzQsFywfrjcn3UguSL/1DwmrQxMveXWq6XXicbrE26AdtR7KXSL9qW9eomNIf28QUbGLiau9G2YiWrVNFxnHr4WLthcotO/lem97YjkW+TQkQHNWg9VF1sU9vaKloolutayS/j5cMwntcZEaN3K+k59d6hrnSIfPjuEdwFLnCqU9vG5RtKgWInpzRWH5/Uyl3SihOvcOFI864OZKZvfs/xeHQzzgh6Ybq1T1Dpu3t9N3WSuux7GtUspDEBzgs2Bh0wQZstM3r9irjGyHrpchCVUtfcxLNamH1/yY3N5tA441fPDQtDWcudz+Euf+JB4kLmXP/YypElscMdJjZFig4CcRU/Vv8lex
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(396003)(346002)(366004)(5660300002)(956004)(2616005)(186003)(36756003)(83380400001)(8936002)(54906003)(38100700002)(66556008)(66476007)(66946007)(478600001)(31686004)(316002)(16576012)(31696002)(4326008)(26005)(2906002)(8676002)(6486002)(86362001)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3NIMlRjNTErL2YvLzdjNnVmWjZubmxlcFduRDlEbHh6Qk9Ra25RTzdiSjV4?=
 =?utf-8?B?RkQ0RDdIL25YREdjUjk1MS9Hdkl3VHZwQ0tWRlRTQ1VKWkRidmt5NXFEQW82?=
 =?utf-8?B?NzlFY1Baa0swbjBocHMzcXBEVFc4M3RpQk5LT3Vlc256bVJENEhaZ3VEdDMw?=
 =?utf-8?B?cXYwSy9aWXdYYitZdWpOaWEvajRKU05WSncvUjIrTTkveW1pMm53V0JJMFZC?=
 =?utf-8?B?bXMrNXl1TzRiSGxlQkNGbm51eXhFZkdQSGFMYVQ3eXUxdE9DemdObWduOFlF?=
 =?utf-8?B?U0ZGZGNaSEdnZml5MVdySEE1cUJoRi92V0JGUU0rd1NITzROdDQvbkl2VFRt?=
 =?utf-8?B?SXRINFV3RjF1R1pLTE9xNnJOOThyc1VlcXA1OVhCU0RMZkVOWkwxWlNEQmJE?=
 =?utf-8?B?ZUtCZDRjK2dncFZNNVNlSVc4cFdHUkc2WDhvRUFsYkZTeDFYWDR0cStuYjJy?=
 =?utf-8?B?WUVJL1E3aEtGSUc2UUZjZnNkQWM0TWhjYjQzbXMrSHFRVnd3MkdMWG1tdDZn?=
 =?utf-8?B?MU9zcnZHVGhEODBLQTZocUtOU04vWTl4YzdwMTNsVE81VDE2UFpvbHl3Z1ls?=
 =?utf-8?B?cldyVnVoaHZLaklKY1FZSWk3clBzQUllNm8rdUJKS082QVcrRmxBV3NWbFVX?=
 =?utf-8?B?ZUNpdkZKa2FKdzVQSnpFRWYzbTU4UEw3VzNvVE5JTEFmYkhlNnVpeXhhekxm?=
 =?utf-8?B?cmtvSVVwTlNSS05COEx6UmxFZ2g1aloveXFKRHRhR2w1Sy90VkFXcjhBdi83?=
 =?utf-8?B?aVc0S3d5K0hsT0J5UkpYc0FIYW45bVowZHVqMHZhUmdZM3k3Rmd6cTJZT2l3?=
 =?utf-8?B?UTlNSnB5ZFpZVHFEOXRoRndsclRjT0xIZzhZU240UFhxYlRwWFk4dFRKZDJ5?=
 =?utf-8?B?TmRYQ3I5b3k5b1c1bmk4d2hydWMreWhiQW15Z21TL1o2NC9EVU5EMEtMbitv?=
 =?utf-8?B?YXhWRUdOUVhiZUFWUVJCbExaSU1leWNXbWprSGZOZ2E4VXpnVUhaUVp3eDQ2?=
 =?utf-8?B?WjgxcVE5NkNnU3ZxVGN3cy9QZEFsY0lTdm0rMzZUMnhjTFF2bnV1UmFkdjFw?=
 =?utf-8?B?UjFkRzUxNUlIVFZvd2pnc041RFUwbFZtc3JST2R4WnhiZlVoT1dqZk02cHUx?=
 =?utf-8?B?Ny9aaHBBRWVJL3ZLd2h0S0JEK0lnTWdnLzVNWVN6dmxOL0ZBQ0x5QUYzNEE5?=
 =?utf-8?B?RzdBN3lIbVpSOHhZKzhwOTlEVjRMV1ZjQ2hIWHVNbGt6N1VscEhmUTg3d0Ux?=
 =?utf-8?B?MitycHF3SW1GdGpIeldRUUhRQXRZWFBLNTFOY0ZUYSs4KzFUL0JBaG9CQm85?=
 =?utf-8?B?bFZTTEFRNzNiT245cW9HcWkwSmxBRkNWck9ESlY3ak5OQmIrQ2FWQUxtY21B?=
 =?utf-8?B?UVdDdmR6bC9vUy9MdHdCaHdOdWZnVjduamh2WmpEREI5bVp1aDVTNklnNDhB?=
 =?utf-8?B?YlRaQW5VOTRWZHVkOE5kS1EwRVV6R2F0a3hEa2szMWVGSnBPaVpneFZUNmpX?=
 =?utf-8?B?S08vNmFSd2lXZDZ0WWJYOWVBU2dUVFBEREZHOXphYkdDK3QyVkZvK3Flb1lK?=
 =?utf-8?B?K1J2aTRRRFVXc3AxSXpEcWNDeEJlOWwrWlQ5M3JsY2x5dlZXbmpoamlZZDRz?=
 =?utf-8?B?R3VFUDJZZDlreXl5TnpMK05qazBrNytzeVBGek1wM3JRSGRyQ05FaVN5bE9J?=
 =?utf-8?B?SjNRVS9OVTI1WHJjTW5SbzE1RjE3elU5bEwrdE92NERTK0wvaE5mdkRvMDlK?=
 =?utf-8?Q?3JYvw4hEc98RwaLy78O0BgMQ5oGRAcU9plDzrZE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e07178e-2b1e-44b4-9dac-08d9768ba760
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 07:54:03.1293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3N++RcdBRXHbGFh/EE1uE5M8Rkg2gEJdOx/yVpN3tztpMHZk8jxWzH2DIBn6A8PWeMQPrNj3RHQuemYlPYOrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

ACPI 6.3 introduced a flag allowing to tell MADT entries describing
hotpluggable processors from ones which are simply placeholders (often
used by firmware writers to simplify handling there).

Inspired by a Linux patch by Mario Limonciello <mario.limonciello@amd.com>.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -53,6 +53,8 @@ bool __initdata acpi_ioapic;
 static bool __initdata acpi_skip_timer_override;
 boolean_param("acpi_skip_timer_override", acpi_skip_timer_override);
 
+static uint8_t __initdata madt_revision;
+
 static u64 acpi_lapic_addr __initdata = APIC_DEFAULT_PHYS_BASE;
 
 /* --------------------------------------------------------------------------
@@ -64,6 +66,8 @@ static int __init acpi_parse_madt(struct
 	struct acpi_table_madt *madt =
 		container_of(table, struct acpi_table_madt, header);
 
+	madt_revision = madt->header.revision;
+
 	if (madt->address) {
 		acpi_lapic_addr = (u64) madt->address;
 
@@ -86,6 +90,12 @@ acpi_parse_x2apic(struct acpi_subtable_h
 	if (BAD_MADT_ENTRY(processor, end))
 		return -EINVAL;
 
+	/* Don't register processors that cannot be onlined. */
+	if (madt_revision >= 5 &&
+	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
+	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
+		return 0;
+
 	if ((processor->lapic_flags & ACPI_MADT_ENABLED) ||
 	    processor->local_apic_id != 0xffffffff || opt_cpu_info) {
 		acpi_table_print_madt_entry(header);
@@ -136,6 +146,12 @@ acpi_parse_lapic(struct acpi_subtable_he
 	if (BAD_MADT_ENTRY(processor, end))
 		return -EINVAL;
 
+	/* Don't register processors that cannot be onlined. */
+	if (madt_revision >= 5 &&
+	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
+	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
+		return 0;
+
 	if ((processor->lapic_flags & ACPI_MADT_ENABLED) ||
 	    processor->id != 0xff || opt_cpu_info)
 		acpi_table_print_madt_entry(header);
--- a/xen/include/acpi/actbl1.h
+++ b/xen/include/acpi/actbl1.h
@@ -858,7 +858,8 @@ struct acpi_madt_generic_translator {
 
 /* MADT Local APIC flags */
 
-#define ACPI_MADT_ENABLED           (1)	/* 00: Processor is usable if set */
+#define ACPI_MADT_ENABLED           (1 << 0)	/* 00: Processor is usable if set */
+#define ACPI_MADT_ONLINE_CAPABLE    (1 << 1)	/* 01: Processor can be onlined */
 
 /* MADT MPS INTI flags (inti_flags) */
 


