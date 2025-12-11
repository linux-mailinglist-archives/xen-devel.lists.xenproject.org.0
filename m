Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A6FCB46BA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 02:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183474.1506160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTVTd-0005yB-Km; Thu, 11 Dec 2025 01:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183474.1506160; Thu, 11 Dec 2025 01:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTVTd-0005v9-GP; Thu, 11 Dec 2025 01:28:17 +0000
Received: by outflank-mailman (input) for mailman id 1183474;
 Thu, 11 Dec 2025 01:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rmkk=6R=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vTVTb-0005v1-F2
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 01:28:15 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7fa9927-d630-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 02:28:12 +0100 (CET)
Received: from BL1P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::34)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 01:28:06 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::eb) by BL1P223CA0029.outlook.office365.com
 (2603:10b6:208:2c4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Thu,
 11 Dec 2025 01:28:05 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 01:28:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 10 Dec
 2025 19:28:05 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Dec
 2025 19:28:05 -0600
Received: from [172.17.249.106] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 17:28:04 -0800
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
X-Inumbo-ID: a7fa9927-d630-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yR0PkEznYxHxbA9clEjt1I20dpiDdpMxlI+k3AKmZMsyoOJi/5mUcJroAFh7riiDEeZz0Te++BNH8R0rUbve7FUkgcsn6UsKZWe1a2lG/m2CxbZfhaPy+GO7mteNVJWuKA4m2sjbhIa+y4TRtgYKVQUkybtmOkzRIbJ5tM3q7sYkWtpfdZJCzxEGih14NpogjbAYdiwxtY01p0AV0DLqwvRerRWdk3F5sawCfkprN+VeQfHVIXRzTl7z9wbHdgCnQXykBFfD3sdcqRvIrPMcUpRbMk8Z+dxQuiv4vkbK1mZEVg3oRiXo+YNoOP0Qbndbmw5gndGsftCaC0Ibp7S/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Z+Z8qADGgmCOreig4fdSc0wc8YNUCn3z0n/8lTheFc=;
 b=Xy1fiMF74cm9vXNopxYkJatlEy/mXHJQr4Z9eeJDIjYfEin3eEAl7M52bOPeJ5PX1LLAe0wPK7NT9Vhauh3GYzZvQlVsJcz3CjeaW84zIf113T+DiY2mvwAYm31aWNzt8BxbBLbtC+41G9PSXzIeHlSJhHI70MduTpD2155HIQ+byH2xkxQ7f/B8sjwySK9KDb0tv6hPBnKqJ3dcN2hB9I7sI79Yk32cjMpa/k27iMqw7xMWrKB+FUjfzJNIb5N10mgv2SzEVmJND+MSay9zGJXtTAeoezuGQAOzPXvU/q66nytH5b2F31Ac+Amk7DGmnESJXhe+OS+PiWbsVm1eaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z+Z8qADGgmCOreig4fdSc0wc8YNUCn3z0n/8lTheFc=;
 b=oznjtAe0Ab77zeuD6At2ST2mQiOtm8Pnm5u8NqBGdTbaXQvSirFNuROVvwYH5bS7xvagipXmpDySU6GZQ1fRtIZK8pYx6mX/0ivrVMKjhmb9sQg5P2kA2XvYKqYh82FrZE89JjNgR0Ieh1/1XwWT7LJtVmDNGs3ORg6gzxdiQy4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
Date: Wed, 10 Dec 2025 20:28:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ee8575-c43f-4944-db0d-08de38548936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmNlT01RVWFIRU4vVlY3OEZhbFViM0N6NUZ5NE9qSmNrQ29SMExEZnVnNXht?=
 =?utf-8?B?bklaNHVnTkEwYk80bk5EWmI2MG5iMlo0a2pDbHVBZmN3dzQyc1daNVdpb3BV?=
 =?utf-8?B?WDhxZ0JpbXdBbitIVS9YYXJaeGRmcW1JemtsaDBjZTVBL0NoUFFqOGtLNmgx?=
 =?utf-8?B?a3BpUjNQTm5aVVg5aE5RdFVIK3AwQkhVeXk3VGdvTFhFa2FqM3RSZ3BJNFBO?=
 =?utf-8?B?QnowNzVBOEQybjRocWdJZ0ZIYUlNeGI2dS9UbTZkMC9jUGw4c0NJQW9qVjNv?=
 =?utf-8?B?aGtVMVJEQkNwUmtXVkxib2ZiMWs3WGVvdmxMSytBMm9zcXJlTy82RFpEN1NR?=
 =?utf-8?B?YTRoUHlPUVk2cG50Qlk2TExCQlJvUEhJVDFYTkpEYjE1V25jR1BWeGhGeTBU?=
 =?utf-8?B?U01hSDJkUmRueEsyQzZsWWdGS09rcHdqN29TL0FwSnBjT2lsY0FBRGpoV0xz?=
 =?utf-8?B?RzNNbWpsZE4vK2hUYVE1Szhsdkw1VkZyOHBMYm12TnJOeTVvcEk0aHgrcCt4?=
 =?utf-8?B?b0poTEliZVBTTS9NcXpDam1BU0UwK1NIV3JRTVdaL1RLd3lpSVc0MVRYRlN5?=
 =?utf-8?B?SmJNL1d3aWNFdHcxSTUzRUxBSktpd1pqZTA0WlpOdDhvVlBRMXpnTXRCbmNB?=
 =?utf-8?B?eGdORHVjZSt1RFFjcHZ6Mkp4YkVxdHN6cm00alJoWFdRVGMzWEZmT1Y4RkV4?=
 =?utf-8?B?VFJqTlZsUUF6U2N2dE4rZW9kbnFLQklGWnpUdTY1VGY0eXdYWGdWVzBKWElq?=
 =?utf-8?B?dTZ4OGRaTVFnQjBHZHl2U1NCRkE5cUEwdUxkdjZVYWp5OUtrVDVHbDQ1WmRF?=
 =?utf-8?B?Vm9zcW5uYnYrRzVCMnFPYm1BdlpyQ2E3WnhNQTRxYzdnZVN0RW5BY2wzSmxj?=
 =?utf-8?B?Ylg5NzJGcWs4blVJQVBMdE9JekJEanY4bEFKeDB5L3ZsbWhjZVdKRFU5MDVX?=
 =?utf-8?B?SWxtLyszVncwSmlXL0d6RXFJTUpxSXVkdkJXRWpDSVA4Z3RrSGtqSGYvaTFt?=
 =?utf-8?B?VSs3QWQrbUdrVWZhWm85UDQvRFVOS3BSZHFrL1NlUVlIMDZIM3lwbGZPZ2dz?=
 =?utf-8?B?Qlh2RzdLN3RuT3d1ZFZadlVjSWtxQlJXNXF5bWozR1hNNDd6RmJJUVUvTjFo?=
 =?utf-8?B?dFBFNjV3VGpYTFdWRGNlNTlVT0NHeXBkSGt4WC9NT29KWnhWK05PQWRzYlNt?=
 =?utf-8?B?WUV0d0k0K2VzcU1DR3plVmRIMnRlOHpMaXJOVTIyd2tsV1RuZnNvSmY1aStL?=
 =?utf-8?B?aGJjbDdPbEdVQ0w5RFFDUXpGeWhsKys3cmxhYytxUlhhSG9LYUNxZkhOVVp1?=
 =?utf-8?B?Vk1Mc2hlYlJBcWNzaEFNN3o1UXR6S2h3SFRkVzlqb3ZXcERFSTJ0MXNKUXNN?=
 =?utf-8?B?V1FrQVFMYjZUZFRMWjhMcUV6anZzc0QydlZ1THE4ZlBJV2srVXJjTEg4d2lJ?=
 =?utf-8?B?VHVDRlVhMisxeXlOakx6aWdNMXFFT1FZWDRsbkx4WHRvSmcxUEtieXhnWFhw?=
 =?utf-8?B?VUVuTVJuOHpaT0NoaVdRZ2psaVpNV0VYOUtXc2tHcHdGZFRoajVtb3dTeWxF?=
 =?utf-8?B?WS80K0o0dFliSXJIbFpOSmZibC92bzYvNXMycUV3bFhWS3BUTUxJSk12ejZp?=
 =?utf-8?B?TjQvbGY0dWFRSzdkN0FnTzg1czYyU1FER2h4N3VsR2NCTkhWZnc2NWY4R0Jq?=
 =?utf-8?B?NEc4SlV6Zk1wYTlidHRBMUlYZUt6eUFWQmdENS80VENmTVg2ejZTWUpoUTAz?=
 =?utf-8?B?bmQ1LzhXUHFMc2haWUhqNzhCN0ppdXlJRkZhUWt3aFUxbDczTW51V3hucWhJ?=
 =?utf-8?B?Z25Qa1N5NjFDWWQvQjhTZGhxK0NBSkR0ZHNxUDQrM0dRM1dmakl5VWt0R3o3?=
 =?utf-8?B?bHRWRERXY2hHZXpBWjA0Zm5RQkNFY3hzZzc4cTZjSDZ1eEUvTzBMRmtMY2d5?=
 =?utf-8?B?WUltdW9zaWlhdzgwRFR5RjRSYzhTZ2lnVGZ3clM1SElGQzN2TitSUWJycHlZ?=
 =?utf-8?B?Z1FNQkVvcG1OdjZ0ZldrK3JaQnZFR0dXd3dOZWVvQVlhMCt0NVNTaWVzQThT?=
 =?utf-8?B?aWVKckg3Y1F2bkpnUUU2aTJkR3NDQjhhaGg2Z2hjc0g1SXlIek41QXUxaWE4?=
 =?utf-8?Q?PsFI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 01:28:06.3244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ee8575-c43f-4944-db0d-08de38548936
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597

On 2025-12-10 11:55, Andrew Cooper wrote:
> On 09/12/2025 9:47 pm, Jason Andryuk wrote:
>>          . = ALIGN(4);
>>          __alt_instructions = .;
>> -       *(.altinstructions)
>> +       KEEP(*(.altinstructions))
>>          __alt_instructions_end = .;
> 
> Thinking about this, what we need is for there to be a reference tied to
> the source location, referencing the replacement metadata and
> replacement instructions.
> 
> Looking at https://maskray.me/blog/2021-02-28-linker-garbage-collection
> might be able to do this with .reloc of type none.  In fact,
> BFD_RELOC_NONE seems to have been invented for precisely this purpose.
> 
> This means that if and only if the source function gets included, so
> does the metadata and replacement.

With Jan's -Wa,--sectname-subst changes added to CFLAGS, this seems to 
work somewhat.  I'm trying to make the ALTERNATIVE place relocations 
against the .altinstructions.%%S and .altinstr_replacement sections:

diff --git c/xen/arch/x86/include/asm/alternative.h 
w/xen/arch/x86/include/asm/alternative.h
index 18109e3dc5..e871bfc04c 100644
--- c/xen/arch/x86/include/asm/alternative.h
+++ w/xen/arch/x86/include/asm/alternative.h
@@ -90,18 +90,25 @@ extern void alternative_instructions(void);
  /* alternative assembly primitive: */
  #define ALTERNATIVE(oldinstr, newinstr, feature)                      \
          OLDINSTR_1(oldinstr, 1)                                       \
-        ".pushsection .altinstructions, \"a\", @progbits\n"           \
+        ".reloc ., BFD_RELOC_NONE, 567f\n"                            \
+        ".reloc ., BFD_RELOC_NONE, 568f\n"                            \
+        ".pushsection .altinstructions.%%S, \"a\", @progbits\n"       \
+        "567:\n"                                                      \
          ALTINSTR_ENTRY(feature, 1)                                    \
          ".section .discard, \"a\", @progbits\n"                       \
          ".byte " alt_total_len "\n" /* total_len <= 255 */            \
          DISCARD_ENTRY(1)                                              \
          ".section .altinstr_replacement, \"ax\", @progbits\n"         \
+        "568:\n"                                                      \
          ALTINSTR_REPLACEMENT(newinstr, 1)                             \
          ".popsection\n"

--print-gc-sections shows a few .altinstructions.%%S dropped - as an 
example:

ld: removing unused section '.text.reserve_lapic_nmi' in file 'prelink.o'
ld: removing unused section '.text.release_lapic_nmi' in file 'prelink.o'
...
ld: removing unused section '.altinstructions..text.reserve_lapic_nmi' 
in file 'prelink.o'
ld: removing unused section '.altinstructions..text.release_lapic_nmi' 
in file 'prelink.o'

The full list is below.

Unfortunately, EFI doesn't like it with ~14000 lines of:
ld: error: 0-bit reloc in dll

Also, my test of removing the path to memory_add() still doesn't drop 
memory_add().

There is still something wrong where I get a fault in some shadow code. 
I'm still investigating that.

Regards,
Jason


ld: removing unused section '.text.__bitmap_full' in file 'prelink.o'
ld: removing unused section '.text.__bitmap_xor' in file 'prelink.o'
ld: removing unused section '.text.__bitmap_set' in file 'prelink.o'
ld: removing unused section '.text.__bitmap_clear' in file 'prelink.o'
ld: removing unused section '.text.bitmap_find_free_region' in file 
'prelink.o'
ld: removing unused section '.text.bitmap_release_region' in file 
'prelink.o'
ld: removing unused section '.text.safe_copy_string_from_guest' in file 
'prelink.o'
ld: removing unused section '.text.domain_has_ioreq_server' in file 
'prelink.o'
ld: removing unused section '.text.compat_kexec_op' in file 'prelink.o'
ld: removing unused section '.text.in_atomic' in file 'prelink.o'
ld: removing unused section '.text.radix_tree_next_hole' in file 'prelink.o'
ld: removing unused section '.text.radix_tree_prev_hole' in file 'prelink.o'
ld: removing unused section '.text.radix_tree_gang_lookup_slot' in file 
'prelink.o'
ld: removing unused section '.text._nrspin_trylock' in file 'prelink.o'
ld: removing unused section '.text.xen_compile_host' in file 'prelink.o'
ld: removing unused section '.text.vm_event_cancel_slot' in file 'prelink.o'
ld: removing unused section '.text.vscnprintf' in file 'prelink.o'
ld: removing unused section '.text.wake_up_one' in file 'prelink.o'
ld: removing unused section '.text.xmem_pool_get_used_size' in file 
'prelink.o'
ld: removing unused section '.text.xmem_pool_get_total_size' in file 
'prelink.o'
ld: removing unused section '.text.xmem_pool_destroy' in file 'prelink.o'
ld: removing unused section '.text.xmem_pool_maxalloc' in file 'prelink.o'
ld: removing unused section '.text.xlat_start_info' in file 'prelink.o'
ld: removing unused section '.text.elf_sym_by_name' in file 'prelink.o'
ld: removing unused section '.text.elf_sym_by_index' in file 'prelink.o'
ld: removing unused section '.text.elf_get_ptr' in file 'prelink.o'
ld: removing unused section '.text.elf_lookup_addr' in file 'prelink.o'
ld: removing unused section '.text.serial_vuart_info' in file 'prelink.o'
ld: removing unused section '.text.pci_find_next_cap' in file 'prelink.o'
ld: removing unused section '.text.free_hvm_irq_dpci' in file 'prelink.o'
ld: removing unused section '.text.iommu_has_feature' in file 'prelink.o'
ld: removing unused section '.text.__erst_get_next_record_id' in file 
'prelink.o'
ld: removing unused section '.text.__erst_read' in file 'prelink.o'
ld: removing unused section '.text.erst_get_record_count' in file 
'prelink.o'
ld: removing unused section '.text.erst_get_next_record_id' in file 
'prelink.o'
ld: removing unused section '.text.erst_read' in file 'prelink.o'
ld: removing unused section '.text.erst_read_next' in file 'prelink.o'
ld: removing unused section '.text.erst_clear' in file 'prelink.o'
ld: removing unused section '.text.mce_barrier_init' in file 'prelink.o'
ld: removing unused section '.text.mce_barrier_dec' in file 'prelink.o'
ld: removing unused section '.text.mce_barrier' in file 'prelink.o'
ld: removing unused section '.text.apei_read_mce' in file 'prelink.o'
ld: removing unused section '.text.apei_check_mce' in file 'prelink.o'
ld: removing unused section '.text.apei_clear_mce' in file 'prelink.o'
ld: removing unused section '.text.efi_halt_system' in file 'prelink.o'
ld: removing unused section '.text.get_vvmcs_virtual_safe' in file 
'prelink.o'
ld: removing unused section '.text.get_vvmcs_real_safe' in file 'prelink.o'
ld: removing unused section '.text.set_vvmcs_real' in file 'prelink.o'
ld: removing unused section '.text.set_vvmcs_virtual_safe' in file 
'prelink.o'
ld: removing unused section '.text.set_vvmcs_real_safe' in file 'prelink.o'
ld: removing unused section '.init.text.early_page_fault' in file 
'prelink.o'
ld: removing unused section '.text.domain_set_alloc_bitsize' in file 
'prelink.o'
ld: removing unused section '.text.reserve_lapic_nmi' in file 'prelink.o'
ld: removing unused section '.text.release_lapic_nmi' in file 'prelink.o'
ld: removing unused section '.text.watchdog_enabled' in file 'prelink.o'
ld: removing unused section '.text.unset_nmi_callback' in file 'prelink.o'
ld: removing unused section '.text.sha2_256_init' in file 'prelink.o'
ld: removing unused section '.text.xxh64_copy_state' in file 'prelink.o'
ld: removing unused section '.text.xxh64' in file 'prelink.o'
ld: removing unused section '.discard' in file 'prelink.o'
ld: removing unused section 
'.altinstructions..text.safe_copy_string_from_guest' in file 'prelink.o'
ld: removing unused section '.rodata.xen_compile_host.str1.1' in file 
'prelink.o'
ld: removing unused section 
'.altinstructions..text.vm_event_cancel_slot' in file 'prelink.o'
ld: removing unused section '.rodata.xmem_pool_destroy.str1.8' in file 
'prelink.o'
ld: removing unused section '.altinstructions..text.xmem_pool_destroy' 
in file 'prelink.o'
ld: removing unused section '.rodata.elf_lookup_addr.str1.1' in file 
'prelink.o'
ld: removing unused section '.altinstructions..text.iommu_has_feature' 
in file 'prelink.o'
ld: removing unused section '.rodata.__erst_read.str1.8' in file 'prelink.o'
ld: removing unused section 
'.altinstructions..text.erst_get_record_count' in file 'prelink.o'
ld: removing unused section 
'.altinstructions..text.erst_get_next_record_id' in file 'prelink.o'
ld: removing unused section '.altinstructions..text.erst_read' in file 
'prelink.o'
ld: removing unused section '.altinstructions..text.erst_read_next' in 
file 'prelink.o'
ld: removing unused section '.altinstructions..text.erst_clear' in file 
'prelink.o'
ld: removing unused section '.rodata.apei_read_mce.str1.8' in file 
'prelink.o'
ld: removing unused section '.rodata.efi_halt_system.str1.8' in file 
'prelink.o'
ld: removing unused section '.rodata.play_dead.str1.1' in file 'prelink.o'
ld: removing unused section '.altinstructions..text.reserve_lapic_nmi' 
in file 'prelink.o'
ld: removing unused section '.altinstructions..text.release_lapic_nmi' 
in file 'prelink.o'
ld: removing unused section '.data.rel.ro.local.fetch_type_names' in 
file 'prelink.o'
ld: removing unused section '.data.lapic_nmi_owner_lock' in file 'prelink.o'

