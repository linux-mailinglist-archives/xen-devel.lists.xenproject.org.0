Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D55FAF8A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 11:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419487.664263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiBlh-0005VI-Cu; Tue, 11 Oct 2022 09:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419487.664263; Tue, 11 Oct 2022 09:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiBlh-0005Sk-A9; Tue, 11 Oct 2022 09:41:45 +0000
Received: by outflank-mailman (input) for mailman id 419487;
 Tue, 11 Oct 2022 09:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiBlg-0005Se-Iz
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 09:41:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a381c6ec-4948-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 11:39:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8797.eurprd04.prod.outlook.com (2603:10a6:102:20c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Tue, 11 Oct
 2022 09:41:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 09:41:41 +0000
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
X-Inumbo-ID: a381c6ec-4948-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVK36Dr2a/MjxVqTeWYw7y/TXXwemlfoQRITM4K3OYzqJOmqXhQBJO2MglMfJbJ2gwc5Gwg/+jTvuwSh6lnidp1uMowWpL9DN9C1rYPotyYJ9zXOPV87F+BXMxfHTZxd7VRcKDbfOrIbSQzp4C+DbZcfy7LMdmGOf4RHKjKnzmN5upGG7Ognutli/W+OBtg/iq/2gtumrW0nVWM/nxiTo0doww9R0ZTMe8k4uQCh0CPa+15Ket633aTAZMUUINKJBGc0jQQxVIqdZ+NYkcGJSCtwyFQeFjoznd45U2JyNqmHPaYYpZ7MPAyEzAZXZ0GYUoxjnwX1KMAbn2q2OTQqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gI19HlK+CO49gbR4ePjFhXDQFIgGxU0z5umPLsZbJxo=;
 b=DeRaVHD0Mg6HuFj2bXXIFQPR4nlTmhEVHGt/aW99m1SkDsRGoIIus0bMHCHRMHu9a5BexpJrYkbeELK2J2SQaKI1F2jJw3x2ZX1Sbml5ekLSPZyT5cElis1Iwgdpar7mL8eVrLplR55+Kkdpg3koTltV1oDlmzH2XJaztunKvQ+JQD46+DPJQjIJ8kdxijKS5MYVOYAMFK9B2AYmN8xFUd9Q3D9qVUu0yhdfYpZwgLYO+CmJN6EVWBCMGtOHMhNhlLfikC6Ve4JhHZdutaCPayECkiKzBKw0LkGnm1dfPWeo9V+kJ+leJfwfEAYw7XwZ8Big7MRwjySctt3N71kMpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gI19HlK+CO49gbR4ePjFhXDQFIgGxU0z5umPLsZbJxo=;
 b=X3KXzH/EkgNbxumTMix2x4CGl8/lXqpwEWl0oyxYG5RpmTP66QPfMXpbpUySDCi5e3AtfODV8utIDDFILWp+iF3YlJcADjT+iDjIk/YaPftGohv8Yt5I+OigKJvc9y1YMQq2elyCOkjcQs9Tl7sk/HoDPAYxvUCtzKcxJvjnMrwokuPoJS3Ndl4UXf4jQeflC6W0ZRoxd1mOR1QwcqjfU3vEp9eW0tclUqQqYwFaWKe8QwFshvJbtOeg5j80pF862fSZC8iFNlb4nOdEGVCg5KrjuoYcUsCwBUuzFYd6aTVIoa5MQQ0NQoZZ+N/PL9meCYiWjaf6/tCpe9p9Ta7T2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81c08d76-0937-32d1-c6ac-439c4bf33883@suse.com>
Date: Tue, 11 Oct 2022 11:41:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: ca33df96-7167-4d3f-2561-08daab6ccd2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t39YMtTicgy/yb05vmicxlhqXpZPetnB4YINIL+LhzhpvMwkRyhpOgeyXfeOscyK87qUO4VtgCvwQ/j3WAVdwR+B4WA3lL531N2Vog7lmd3RjIEcMzgWCpHe0eMHKmXuc6Kbp6Rz0SMI14ck45+zxTWOiz2c+NBYNdm6TGTe/VSc0adJ0ZdNsFLSPYCgSauY6tTn56zsw/cSA3EYVRjZnRRINxHP0pNbElynBHMHsea/brDfOeEv2AZs+gepZd8VhgwnpB5xuNNr4imhZiLEL9X12vj0i12HIQjUOXcuhOEw/+4HFG0zU/oU2xpDIqOjbS4++B3tyquAqqAyWW70/zMFTV3eiK9mA2xi3f8rro9P/uTrccJvUVB/pJC4JAWDR9dlfsagxU1j8qzU8lgEYbncaGhy1tdqi7zhGKqG4r5NiwUN9PErAPXUJjmRDBLYWRIApsHLlk1xS6Mtyj0Nbfz3W7ZH6/nzXHOJdBmasrvHNckx+qGLYJ9XnsBpM9eMJBa5RAMaydVz5G0kSrT32KTKwfgmzdxyibw+5f42GsH1Pm3fmcm6KSMgeCknjRNlOdAtqgNtrnQ46Vta8YQpFrcHJtaQTqtEybbL4AMRaxL3I2h82R6fSrqdtcRU4aNzcJgQlT91GIM5awNWED1R418pLxtJ87wOuBPYh9zuPicd90J5DGKGKMrHg+DVeMsbHe3P2dWyAZdeViJyfpFgb6s1Q6wrBm6sQozJYRvGhU/tdGhXy8+VTMh8lvQBRf0CQCPAl1qDKpreRg9KCTm+ITtdpN1BraYk80Zv4DFMKo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199015)(26005)(4326008)(478600001)(6486002)(66556008)(66946007)(8676002)(6916009)(36756003)(6506007)(316002)(54906003)(66476007)(83380400001)(38100700002)(2616005)(86362001)(6512007)(186003)(31696002)(31686004)(5660300002)(2906002)(8936002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmdwV1NYWVBmaEhCdjUxMEpDWEN6OGhFOEFWaUgybnJMeWx5NDdpaEtLL2NF?=
 =?utf-8?B?QUZ4Z2dZYUErNXdicGwvWDN0cEs5RXpKMnA0bkdORHJIUzBhaGpJUjY5Mkdu?=
 =?utf-8?B?TUZuWENyM05qOXlLQUtXc2U3dUx4Wnc3dXNEYzJRWDY3QS9Jb2J1dHVUeWtr?=
 =?utf-8?B?WkQ4dGdoK0ZGTnlnbkhBYjlWTW4wVVRqbExtS2wzU3RDMC9RNTVrYzhiendD?=
 =?utf-8?B?YWtVWjBxcTdnSVRxbTdaU3VZQjJWdHlqUkErWXpkMzVrQXIwT09Bd3p5aVEr?=
 =?utf-8?B?RExvV29VZGk1SG1zQ0JFY2xMV01xREViNXA3Z2MxZVVSLzdUYXc4TTA5d3dZ?=
 =?utf-8?B?NXpxU3JOVkI4ZVVSbW0zSGJEN2hDQWZQdXo2K0I4bSs0NU1ZVGhPL3lhTUhY?=
 =?utf-8?B?aEpDSHhoMDczcnFkQjVUM0k1Zm05UHBBWGxGMDFXQS9nc25jdzBKSDlHUER0?=
 =?utf-8?B?dENrN0dSdldHNXhEVDNGL2JUck16RTJDWXNoY3FWQmtLaFpEcTQ4dUhNcCtR?=
 =?utf-8?B?ejVWZFlaTkdkZXNEL0hCRi9zYzBDQzc3UTJsV2tzNjRRcUJsUEdaRUJwZ2U3?=
 =?utf-8?B?bzBDb0lHSFQ4WXQ5Q0JMR3ZZQU9sayt4azQybWJFUFA0RUZ1TzVZS0gxL3Rm?=
 =?utf-8?B?aHJuMWptd3hhQ0FQa3d5RVZzcDY1akE3aDArUXdJcTlIS1FBS2szSzFBQlZj?=
 =?utf-8?B?eENNOUt2ODI0UmRTeE9tTHA0VGhScEJaNHVlYUJneUZuRjV4V0NlVnNwSlo1?=
 =?utf-8?B?MFcrQlhEYURBYjJ5VFVlRks5Wi9EMUFYM1V4a25BdjZLVlIzcVdOS01UbHc2?=
 =?utf-8?B?ZnVZTlRBVTBHL0h0ZnNEWkI0QitYM3pRMW1mZmZJWktlemlhbTN2azVqOWJC?=
 =?utf-8?B?OWZPS3BNUTNmbE9qS2EvV3JuSHVGd2ZGNGdvVW9JNTJCK0kyb2t5RHJDMTVw?=
 =?utf-8?B?VVFHZDBOeGd5S1g0akRRVG5Fa0taUzJ5V2RnVmNtUWVQR0VJaXZRVkhKL1dz?=
 =?utf-8?B?cnVmS1cySFhnbFZBdENBYkc0TEt5THN6UVl2OGExRlJNVVN4UjJLREprMHZ5?=
 =?utf-8?B?eHpWZnc3UU5KYnk3SnMzbkhXNFVVbU55TmFaM1duUHVzVTV3d2p5a2Z2eXln?=
 =?utf-8?B?MyswYmFRdUdrV1loZTZqY3pZYTRLQUx6cVU4Z3dCbXJZdFlSRUw1cjV1dGlL?=
 =?utf-8?B?Zlc3OXBYbUg4T1J6bVhjQjByeXdtaEZGWnUyNUU3MjlILzF5a3k5WFdBNkR1?=
 =?utf-8?B?SnYzNTJxUXNpbjFlcUwyb0lPMElWc0NpZitJLzNxSVBCN01lWGNZNFFhcjkv?=
 =?utf-8?B?YW43MFZvNDRzL3dnSWRlTS92aVA4eFRPU2VxRlg0OWQ4RnZ1STE2amNOUXZP?=
 =?utf-8?B?QUxTZ1lCcnp1ak94OVFGbDhMamJxL1IyTGhJRktFZ3FtM0NjTC9HZzQ1bHF5?=
 =?utf-8?B?MnJ4VEpQTDVxdTRyL2gzYjZYOHFWREZ3U3h6bGdjNGdVVUN6ZXVBYnNSa012?=
 =?utf-8?B?WEpNTHp4bkx1MDdqQXFvSHVkb1F3TTk1NStFY0RWbWgxN2szcWMrOXlUREVE?=
 =?utf-8?B?Z3pTWTRYZjRqODRmNlBnSjhtYTllNWFWcTN6LytLV3FnOWxvMG04V0lKMDFz?=
 =?utf-8?B?SDZ5VnBrUC9MeU1IclBuRlFHSTREVnA5M0hDL09pUEFmQWFGUy93YTNpSmUy?=
 =?utf-8?B?NGdITGsyWTJoNlYrTmxJaXlKVVNIL2NadGNGb3NrVXZXWklKZDRhMG52SGlB?=
 =?utf-8?B?Z2IrSWVZbTBOL3Z3aDJVczRJdUlXRXgyMU5LL3dDTG9yTUZGY1F1Um9OeDMy?=
 =?utf-8?B?ZjlRSEFvNEhHdlNvOUdkbkZSSll5UFpXemdvY3dzRkdsOEEwZE1NTXZ5OGdW?=
 =?utf-8?B?clF6QlZldy9VeHU3eE1ra05EQTBnUWIydEFEZ0JPek9CaENnTjhTMzU3c2d4?=
 =?utf-8?B?QlBueFpMd0ZCMXprUXlCM3VmR1dsQm03ekJSOS9qRyttVEJmU3ZrWWZoNXEv?=
 =?utf-8?B?ZGM2dTM5dm1nQW0vdWtIckthSS9BYWUra2ZpTi9OVWZySW9VSnN1Tkc2aDlp?=
 =?utf-8?B?aFBrQTYzZFpMeVNmZ2NpZmRMby9uK05YQU1QZVlXVDA0M2tKaG40Vi9FcjlR?=
 =?utf-8?Q?+HUmEyErcedhNYxisqzhu+QCN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca33df96-7167-4d3f-2561-08daab6ccd2d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 09:41:41.4233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moKC9lJzPXEl9xH/RzGFDlcu/OOANfDNc3Z1d9PFwBjBFgrZGm1XmQwT8qjACBwVm2mFA05PM4i+sUaYNatHCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8797

efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
higher priority than the type of the range. To avoid accessing memory at
runtime which was re-used for other purposes, make
efi_arch_process_memory_map() follow suit. While in theory the same would
apply to EfiACPIReclaimMemory, we don't actually "reclaim" or clobber
that memory (converted to E820_ACPI on x86) there (and it would be a bug
if the Dom0 kernel tried to reclaim the range, bypassing Xen's memory
management, plus it would be at least bogus if it clobbered that space),
hence that type's handling can be left alone.

Fixes: bf6501a62e80 ("x86-64: EFI boot code")
Fixes: facac0af87ef ("x86-64: EFI runtime code")
Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
v3: Alter Arm change to leave EfiACPIReclaimMemory handling alone.
v2: Amend description.

--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -183,7 +183,8 @@ static EFI_STATUS __init efi_process_mem
 
     for ( Index = 0; Index < (mmap_size / desc_size); Index++ )
     {
-        if ( desc_ptr->Attribute & EFI_MEMORY_WB &&
+        if ( !(desc_ptr->Attribute & EFI_MEMORY_RUNTIME) &&
+             (desc_ptr->Attribute & EFI_MEMORY_WB) &&
              (desc_ptr->Type == EfiConventionalMemory ||
               desc_ptr->Type == EfiLoaderCode ||
               desc_ptr->Type == EfiLoaderData ||
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -185,7 +185,9 @@ static void __init efi_arch_process_memo
             /* fall through */
         case EfiLoaderCode:
         case EfiLoaderData:
-            if ( desc->Attribute & EFI_MEMORY_WB )
+            if ( desc->Attribute & EFI_MEMORY_RUNTIME )
+                type = E820_RESERVED;
+            else if ( desc->Attribute & EFI_MEMORY_WB )
                 type = E820_RAM;
             else
         case EfiUnusableMemory:

