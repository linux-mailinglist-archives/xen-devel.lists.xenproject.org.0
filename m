Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E411446366
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222273.384380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyQe-0001yX-NE; Fri, 05 Nov 2021 12:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222273.384380; Fri, 05 Nov 2021 12:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyQe-0001ut-JB; Fri, 05 Nov 2021 12:34:44 +0000
Received: by outflank-mailman (input) for mailman id 222273;
 Fri, 05 Nov 2021 12:34:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miyQc-0001oS-FF
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:34:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf862ca3-3e34-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 13:34:41 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-BJeZGZFQPaWWITxkYE6xIA-1; Fri, 05 Nov 2021 13:34:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 12:34:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 12:34:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 12:34:38 +0000
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
X-Inumbo-ID: bf862ca3-3e34-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636115681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpyFyOIyYBFgdujGQvciBKudkZZ0UUaeJu4HvGRPCY4=;
	b=GlIgAY4FXa5x/j3KGJ1OmcI7+CNSWJyiQX9d1U5HGY99GxeO4N1EfQP/abojeCR3cd9432
	IU00hpJqhqpatGfTfVLdN/pTbNxHbOggCcNsS3AdZpOTM+wqEl6dNdeYkRXKxAcIpomic6
	QawNgm1MZsa3yaQ+FyCFg/dE31MnW9M=
X-MC-Unique: BJeZGZFQPaWWITxkYE6xIA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANtaR4RXqBt0ME6t3m/xTHzDNRdEn7OxEow/A4vfMN813rS1j4l85Xij0vUAlRiYYh5mFdKsiAYRiNrowET8WobzKz1Pq5v8Ej1q9u+sizaFRFq20bJ0HJlIvPfLNfdq4mVUaJjQltwPM6ZJQtCjMp2/j+iAqkS49+rri8a5wHk9acSo9eLv0vQI1CDQw5vLpfWZUt/YH+wM+JBIizs+vjFUvDLMDpCw8Zfy7RtGaU8D0zIh3x6QCvUK3OkfM/fRznxwctLJjg1XpbeVXyaENol49j0QI4bo/hg1obFc7O9OLfC48iu21C1sxNtwCxx3i2fp5qIT0Nez1D0bz8/dOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpyFyOIyYBFgdujGQvciBKudkZZ0UUaeJu4HvGRPCY4=;
 b=fJNLe0gp5zWk4gO+5wwiOhC3Q319uAbHYuDwDAsoMwztQ6jPnQeOy9F5XqqEHvUlVNtYD0ofD5sCM7fbNY9Hl/YwHdPrduN5MCY4U+SVjdq8s/lHCt3x6KkpKQOaBPsXB/JCyQQeBAu1ErdS8i0QUoIogkaXYqnFdO/LuR/cj7CMsa6Hn4nCbrXJM7nV/6atckyLWPYyrBIQl1hl/7bNUNje5BPDn/DfCzo0dd8kcdvv5gvM9Yt+3cQer9KpyyvkFFT8pwU5H5rbFMSPvsQ7BeiiRl2w2mUa39vLj5TjeLLKWU9lHJm+xYDxy2MjI4KbNZeOhtMfCvYANl9pCxrcAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <777dd74c-37a0-20b8-72b4-fe52890aa9e0@suse.com>
Date: Fri, 5 Nov 2021 13:34:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH v2 3/6] x86/APIC: drop {acpi_madt,mps}_oem_check() hooks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
In-Reply-To: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ca4ca57-430a-4d23-4661-08d9a058a267
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703768ABE9FA63E7CDDA0704B38E9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OiwxTodr6iCtBxTOwgEIV3/Yx65J3jKARHm12A+PU0OX66vLwv/jPrDGUIDcX4axnc5Tfn1QN3EDjjODUtdDCsdyO5qBLmlfqXZAcl/Gec3gkdotdprHb6u9Dg7xc6mmzs6g2/RvVUCvFYCtDXFaEshQcabQlSk7fq/wIgw1FocPhZUyMwkQKEbCd2GIqPt5MpGIgLyVZ5VQ9sJbkb6Rnq04OfrAkqx9Q/7Y5V704gAK5ZTz8mB9BbMuAAHbJmv/nASXjx7ROFRtB/LjzpBD/E6JdWPHPma14UEZDgKyw4+C4JCgTSrRet+b4Tg1Y++Z1hg5ksoVTbmooJf6GzDBsiw0QcXkW8kZISsOKvUCiRIsJTMSt5Mn9W+ooj87+qXjfCYzdNW+QJuQf+czsNZLC4uuftKynL7F356DUdWA2nsUyMTdVFDqrDfHr/5Mb881kBiAOwvTxxPXbxPgcU190x373Ez5xw/hUoPGmgbnzSZpJUktm2bXgyCdRQJ9aUZHOWod2NmWlbNoZTnmncGY/Y0QR7NF2w143Iann8G+/apEAfIxzf+vto8GbuGAt2qtlM6N4mY24o3ga21seSLGtrVXwRxWGQ/NvTt6fMmiKcmE4V3msUTRqTUG3XdE51owdE10MtnfyJidqBPGjnfV4SWd8DKozxtyPjHE2VVWkM3Ite/R+sgcFO5FHG7AqI0ndaXgi+Mgb7q954Ji92W3OoMPWUuuf3ERQdfGKRxEoGY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(26005)(8676002)(956004)(66476007)(186003)(38100700002)(6916009)(36756003)(86362001)(31696002)(31686004)(4326008)(316002)(2616005)(6486002)(5660300002)(508600001)(54906003)(16576012)(66556008)(66946007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnpPRUI1OHg4SkJqVW14bXplc0QzWHFwUXpZTjJmUHFBeWZlTlgrQmxocmR4?=
 =?utf-8?B?NktSOG9FblpYTVg3VkxwQXhVbkt1UTNLTjN1VUJhVm0vVXVzK2pDNGVRNlpv?=
 =?utf-8?B?QUlEeXYrVWhIRFYydzJaMjZxZFRBMFFPdElUUHorODZrTTkrVzVKa1pkZWpG?=
 =?utf-8?B?NUhheGd5ak51M3V0R01pS0xGOGZia0RlaWpKOXN5bytqaFJjK1VNOTRIYnps?=
 =?utf-8?B?bHorR3BsU0hZRkRGbnlHTjFKSm52bVNJOEdIandNMklwQ0dPK25acytjRjlL?=
 =?utf-8?B?ZXYzSFlvQW5ocVBESjhUZHdRMS8rU0tpQVZuRHk4WTJwK2pWdlJ4M0JOSmJO?=
 =?utf-8?B?STRkQm5qS0VpRGs2MUtaTWdnUzhrQXpGSnVaOWdLY0UxM3hUNEtXb3lqZXg5?=
 =?utf-8?B?TllEdEg0V1lwMWFyQVhJRjltaE9tRzVXeEp1bFVKb3BRMmYxZTF1QU5wdjBo?=
 =?utf-8?B?UDlXWmkzUFBQbDhPOEQ1Yy92cXI0VHNxNE1zT3NwUVhQVnE1akVaV1psVnFV?=
 =?utf-8?B?ZTFhbWZaVFNhSEJVQi9VU0R1bGhnbnp1TU1pajRWZ3A4RE02cDR2cGxQeE9X?=
 =?utf-8?B?WFVrMVJ2V3ZoM1cydUJ1SGVibjE1c3VtTlpTUm5NS0V6Z3BOK1FHN2FuMHVV?=
 =?utf-8?B?MnNGSkFWQncrajdGTEVVK2tINUwyT1NEZUJSZnNPU1JsTVRCM0xnaDNIL3pn?=
 =?utf-8?B?eHphVmVnY3pRNnM0bTlrTFFIUHF3V1V5OU9uQlRaMGxtQUhoSjRMU0JIZGZZ?=
 =?utf-8?B?emxtTXdSdWtiaGpERXVxMGNHMDBOM1I3eDNaWTRuVFhUOFFoS0xXNk9waU1x?=
 =?utf-8?B?TXF5YXhSUXV2VTNUc0lMWEF3UmVTclQxL2dQRUo1dXJnaXI4SkNnSUtEMkl3?=
 =?utf-8?B?L2t1bkJKQ2xzOUFkdU9zZG5NRnh2STNWWHJRTXY1U2FaNk5uVXN0Unlzb0pW?=
 =?utf-8?B?Sk9MZHFqaTRCQjhaekVjaHQwNHFEdWNEZnhZOG4wc1ZKd1ZzZThJYlZUMWU1?=
 =?utf-8?B?di9XRkx6N3VEZWhMclZ5Q2g0T0ZxM0trcVlwYnBnZkFhMXZ1VjJXclgxOXpz?=
 =?utf-8?B?THBBS0RFRHYzSzFtS1J2MFd3Tm1NRHloSUV0eUdOTldYZG0ydzhEK2VDNGd1?=
 =?utf-8?B?UXdGZUY3dmNDWTJBR0ExNEkxUVZUMDdMS1dJamdlekpBM1J5N3VQdDBmdmpZ?=
 =?utf-8?B?TVV2MDl0VkpuOFdsRzhhenFvTDJ5ajVGektlc21BcXIvbm1QQ1RvRUwxNU11?=
 =?utf-8?B?dXN5TUJ5d1dsaWFTWWFEb09oQWNuTG9hRG9oWTczOXcxRHpPVFVBZ25jaVVl?=
 =?utf-8?B?enNMTlZQemNEWllkaXY3NGpNM3dpNjJIUnllL0tLeWZHUDFzM1IwWG1Rek1S?=
 =?utf-8?B?LzBodnRIeXVtYlhrTlk1S3Vuem1HQVgwamF3amZjK2FaM1l5MmlSSHplbUVz?=
 =?utf-8?B?UU5pTmZQQUJ0RnBqWnU5amdNdXRZditZNVZPNmdHWlA3cFNqQmhhSTM2RjNY?=
 =?utf-8?B?Zk5VeFRIalFZV1FuZ0tYbklNOENHb0x2RXowbngvZlFyWEhVcU9tNTVVMEh3?=
 =?utf-8?B?dE5WdFB6ZVdpbmYrMm9qN1NpblVab05RL0psK2NTQTgrYyt6N2RHai9oVjRu?=
 =?utf-8?B?dnQ1ekJOTFNsb1UwOHJJQ0s0ZWI2WDVJOWxEQ1I4TWxvdWV2WlAwYWVmOW1E?=
 =?utf-8?B?MTM4UldINThqdEJHYkZ6RTlSOGJHR0krak9lZFZsMVg3a0FOdDZFZVdGTVpU?=
 =?utf-8?B?enVzdjE5SzU3K2U1aFpVZWN2ZHhCM2FOa2N3Tjd4Ymc5a2wzOVNJVmtBQUlw?=
 =?utf-8?B?OFA5Ky9TV1ZBMzBoNFIyWFdSUFdpaFZ0bXlzR3hjamFxMUdURE5JdUZvWGhL?=
 =?utf-8?B?L3ZoQmVDeXgxd0d1NktTc2JOUXFUVmRBbmw2ZVZWR1ludnkvYmtHYXRQU3Vh?=
 =?utf-8?B?UXNRam9tWmU4aUtjV0tXeGVnT0F6Y0NlcVl3RGQ1QlhJVWpFOEw4aFA3THZ2?=
 =?utf-8?B?d3pPUFZUay9VczYxdFJKaGprTlp3dGw0NXdLUXhVSldicXh5NXhwaEx1a2sw?=
 =?utf-8?B?dk5OS0FlV0x5WVJPanhxWFU2UVNTRDRzcy9QOWFvV3k5OHBTZEdCUGNtaEEr?=
 =?utf-8?B?S0pBampweWVRUHpXcWFWbGU0V3dOWndTRk5tL0pjVmdJOHlxejFTakZtK01J?=
 =?utf-8?Q?LIHjeWqyBRrNtUfd7KDmGjw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca4ca57-430a-4d23-4661-08d9a058a267
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:34:39.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6CwI0N3/xQtc3a2lPLc8N1fYueJp3tEDjuUdOz/s7iGaOtdquSw2oxfukZg/eyDpeSGm6wefCYBQB62P+Ntdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

The hook functions have been empty for a very long time, if not
(according to git history) forever. Ditch them alongside the then empty
mach_mpparse.h instances and the then unused APICFUNC() macro.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -39,7 +39,6 @@
 #include <asm/processor.h>
 #include <asm/hpet.h> /* for hpet_address */
 #include <mach_apic.h>
-#include <mach_mpparse.h>
 
 #define PREFIX			"ACPI: "
 
@@ -75,8 +74,6 @@ static int __init acpi_parse_madt(struct
 		       madt->address);
 	}
 
-	acpi_madt_oem_check(madt->header.oem_id, madt->header.oem_table_id);
-
 	return 0;
 }
 
--- a/xen/arch/x86/genapic/bigsmp.c
+++ b/xen/arch/x86/genapic/bigsmp.c
@@ -8,7 +8,6 @@
 #include <xen/smp.h>
 #include <xen/init.h>
 #include <xen/dmi.h>
-#include <asm/mach-default/mach_mpparse.h>
 #include <asm/io_apic.h>
 
 static __init int force_bigsmp(const struct dmi_system_id *d)
--- a/xen/arch/x86/genapic/default.c
+++ b/xen/arch/x86/genapic/default.c
@@ -12,7 +12,6 @@
 #include <xen/smp.h>
 #include <xen/init.h>
 #include <asm/io_apic.h>
-#include <asm/mach-default/mach_mpparse.h>
 
 /* should be called last. */
 static __init int probe_default(void)
--- a/xen/arch/x86/genapic/probe.c
+++ b/xen/arch/x86/genapic/probe.c
@@ -78,39 +78,3 @@ void __init generic_apic_probe(void)
 
 	printk(KERN_INFO "Using APIC driver %s\n", genapic.name);
 } 
-
-/* These functions can switch the APIC even after the initial ->probe() */
-
-int __init mps_oem_check(struct mp_config_table *mpc, char *oem, char *productid)
-{ 
-	int i;
-	for (i = 0; apic_probe[i]; ++i) { 
-		if (apic_probe[i]->mps_oem_check(mpc,oem,productid)) { 
-			if (!cmdline_apic &&
-			     genapic.name != apic_probe[i]->name) {
-				genapic = *apic_probe[i];
-				printk(KERN_INFO "Switched to APIC driver `%s'.\n", 
-				       genapic.name);
-			}
-			return 1;
-		} 
-	} 
-	return 0;
-} 
-
-int __init acpi_madt_oem_check(char *oem_id, char *oem_table_id)
-{
-	int i;
-	for (i = 0; apic_probe[i]; ++i) { 
-		if (apic_probe[i]->acpi_madt_oem_check(oem_id, oem_table_id)) { 
-			if (!cmdline_apic &&
-			     genapic.name != apic_probe[i]->name) {
-				genapic = *apic_probe[i];
-				printk(KERN_INFO "Switched to APIC driver `%s'.\n", 
-				       genapic.name);
-			}
-			return 1;
-		} 
-	} 
-	return 0;	
-}
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -27,7 +27,6 @@
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <xen/smp.h>
-#include <asm/mach-default/mach_mpparse.h>
 
 static DEFINE_PER_CPU_READ_MOSTLY(u32, cpu_2_logical_apicid);
 static DEFINE_PER_CPU_READ_MOSTLY(cpumask_t *, cluster_cpus);
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -30,7 +30,6 @@
 #include <asm/setup.h>
 
 #include <mach_apic.h>
-#include <mach_mpparse.h>
 #include <bios_ebda.h>
 
 /* Have we found an MP table */
@@ -326,8 +325,6 @@ static int __init smp_read_mpc(struct mp
 	str[12]=0;
 	printk("Product ID: %s ",str);
 
-	mps_oem_check(mpc, oem, str);
-
 	printk("APIC at: %#x\n", mpc->mpc_lapic);
 
 	/* 
--- a/xen/arch/x86/x86_64/acpi_mmcfg.c
+++ b/xen/arch/x86/x86_64/acpi_mmcfg.c
@@ -38,7 +38,6 @@
 #include <asm/mpspec.h>
 #include <asm/processor.h>
 #include <mach_apic.h>
-#include <mach_mpparse.h>
 
 #include "mmconfig.h"
 
--- a/xen/include/asm-x86/genapic.h
+++ b/xen/include/asm-x86/genapic.h
@@ -21,13 +21,6 @@ struct genapic {
 	const char *name;
 	int (*probe)(void);
 
-	/* When one of the next two hooks returns 1 the genapic
-	   is switched to this. Essentially they are additional probe 
-	   functions. */
-	int (*mps_oem_check)(struct mp_config_table *mpc, char *oem, 
-			      char *productid);
-	int (*acpi_madt_oem_check)(char *oem_id, char *oem_table_id);
-
 	/* Interrupt delivery parameters ('physical' vs. 'logical flat'). */
 	int int_delivery_mode;
 	int int_dest_mode;
@@ -38,13 +31,9 @@ struct genapic {
     void (*send_IPI_self)(uint8_t vector);
 };
 
-#define APICFUNC(x) .x = x
-
 #define APIC_INIT(aname, aprobe) \
 	.name = aname, \
-	.probe = aprobe, \
-	APICFUNC(mps_oem_check), \
-	APICFUNC(acpi_madt_oem_check)
+	.probe = aprobe
 
 extern struct genapic genapic;
 extern const struct genapic apic_default;
--- a/xen/include/asm-x86/mach-default/mach_mpparse.h
+++ /dev/null
@@ -1,17 +0,0 @@
-#ifndef __ASM_MACH_MPPARSE_H
-#define __ASM_MACH_MPPARSE_H
-
-static inline int __init mps_oem_check(struct mp_config_table *mpc, char *oem,
-				       char *productid)
-{
-	return 0;
-}
-
-/* Hook from generic ACPI tables.c */
-static inline int __init acpi_madt_oem_check(char *oem_id, char *oem_table_id)
-{
-	return 0;
-}
-
-
-#endif /* __ASM_MACH_MPPARSE_H */
--- a/xen/include/asm-x86/mach-generic/mach_mpparse.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef _MACH_MPPARSE_H
-#define _MACH_MPPARSE_H 1
-
-int mps_oem_check(struct mp_config_table *mpc, char *oem, char *productid);
-int acpi_madt_oem_check(char *oem_id, char *oem_table_id);
-
-#endif


