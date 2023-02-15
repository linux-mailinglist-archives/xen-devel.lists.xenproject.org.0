Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E1697AE0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 12:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495879.766322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSG2d-0006lT-4x; Wed, 15 Feb 2023 11:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495879.766322; Wed, 15 Feb 2023 11:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSG2d-0006jF-2A; Wed, 15 Feb 2023 11:33:39 +0000
Received: by outflank-mailman (input) for mailman id 495879;
 Wed, 15 Feb 2023 11:33:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSG2b-0006j9-CH
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 11:33:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94acb731-ad24-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 12:33:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7523.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 11:33:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 11:33:32 +0000
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
X-Inumbo-ID: 94acb731-ad24-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ev7ac47h2W1zrCO3SMqfSTI9BvTdy/NFZkQgqGBr+31BHEhaeHoNXqRcW5DH3XcnaxaiSf/kd2R4BmcMuuWjQVQYBeBrNIgKjUqim9hdsXLDc0xArHLd9M8z3lht6MHWY/FR7D703MSrZzdW/XK5CKQvEyAqXwQ5ec1NceOghFH6tiY6/Gcy6KEAposcT+M2PWFUrDy+b/fvtsjtZrAOLaQhvOLqe9HUTej3MA/VGv24ammDI6/opKYr0yKXw5DtqcHbDaLR0k46xJPZMxUNpeFk7jWWSMx+n8Hlje8IQ8ZN/Ch699VbdwHX08I9rkCEuh/kxs1CPs8f960LUG6Ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir2XACLlXoYPNEU1byd6Ec5CzhHU+/fEwvRtqRixVnw=;
 b=k5oiRSs688fnToot2w08UhbtnEtrGzMfoz/BMuTolBleGBhpGapPy61GVmuAQ4Vwnfy/kgk8JrqhrU6Hwu9AYrDtilgjdyvnq5eG9kvftckhjPpWY+cceAZto3W6agm5YrCrSAkY9FiyXidKJUV0fu4ru3Nt3918GUcb0kwTOoYEcD7BPI7grKsdwZe107uqBUavA25AiWwlc1w03ktWRtZv4NLhApsAxrckZKa9iWpRPm+FLPHU1bi5/YS0VkDmebEJZl13o8Edp85SInVASX34mki3TYOzf3yZM8OJ8d7lKwkkqFElLosxAo0UlV8pHmPeGwqR7fr1AboLXfu6OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ir2XACLlXoYPNEU1byd6Ec5CzhHU+/fEwvRtqRixVnw=;
 b=TQ6Fq+Qd2phg1GXdZMmMrjjz2DTQj8A404q1PEe6j8FQfhEsKBIsx8B9+m1PZikW2UcgKYpo1WZ8GhXu6fSfco8n1lDTCn9aXzSumZmak7hj82510dsLI5C/VN49G9FTjYJKkkUTe/yNBJnVAA01gcxjG3jhgX8VAhqsQT74I89ep5pchIDr1ej6pENOvbm2YGWjF0GpQp484dpql+UQRHEfDfnOOKWlGaMioX7ByKVgt/SNdINJ8PkK4ro9lZnEA0Wvs20SS+pj5awd8p3Q/DHMP8JDEhOZUn+hX6WTVnnfr3JyPfSrLaj4dD7GrbQRMYQsU5Eql3efSFIoD8WQ/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>
Date: Wed, 15 Feb 2023 12:33:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Xen: tidy xen-head.S
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 658d4215-c68b-44f7-b46a-08db0f4877d6
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mcYNAxc93uvMGghRZJeNt/82X4fO5n7yWjNj8m+xl6HYJUkvLzZ7utG/XmPjoXgTh7ShN/ESiHYZhEar50s8C6WsLfVqSl9XrLIIrmMRW9cJ6ALLR7RaokJrhenufk9cM+Msevnm0QIL4eDGSpZrNZkbpvP1ODtOCMl/TqX4j6/d/aauwekmSoMG6iTv3ne55h2RjwUmLmZMpOiDYg7foxKPd2SvaJtu1qqjNrIOyjKBtbmEmrB5DtqzEZjye6+bGb+EsHkwCw7WGLG6/M1gTE+DedPJ84TFj4MaKhMWxCVPBXAKDwjS8BnVBgYcVHSu5SfmRDwQr/RDYjBdw5YEmhYQQEsguH5zJ+ttbUv/eeTktURSY9pSjfHYqIvYP3JPaeoCVpbBZkQHnAcTfHyLrlS9Q0W/30PPXZjhGbLT2tvlMwQcTyeF4RErdK28TFjcUFXVmgKmJik5CFmrAM1gUYJ/pPiS89baf/zJU6yMlkXN4hwF6WfWX0QsDAmntUlzQD4IgDEqGjY7m4mbbbs29aNq14zSlsAU3aZYSgXoIcBUB0+ZobvQtk+/NgHi5O5V3DibcCS7T0rccI8TeErF8XIaTSEQqAMg0Ief7Sd3Dr5QcyKKBDlwt2q3iShrVTs7XsIw1VgSHTmXwGjSrhY3RGi4Cf6h/e/62lHwtSswiUfYZkP2daVbB7ncm3oaOas4LOAl7281yEfGHYz5rlboF4bzlg8/8GFtTn7xgHBPTVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199018)(2616005)(36756003)(31696002)(38100700002)(83380400001)(86362001)(31686004)(54906003)(316002)(41300700001)(8936002)(5660300002)(2906002)(66476007)(8676002)(6916009)(66946007)(66556008)(4326008)(186003)(6506007)(26005)(6486002)(6512007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N25zMTlFQ1d4UGdFMGhSME1aOVpkOUtaV2FYWURDNzFxUmpiNXdPRGlPeUFH?=
 =?utf-8?B?UnZLdlA5a0JQSmZCY2VCTzJKaHdEZncxdEVtb3lMU1lobk1YY0lxMHZkclhX?=
 =?utf-8?B?N2dpRlRMMHRwYk5LUUp5Q2RCK1JJTTMxdEp2MDdBWHk0Qm4xNUtlbW8zZnIv?=
 =?utf-8?B?NVJtYlUvUmwwaThPNlBqUnVNSG1Kd0xhTzFGL2pTSjh2OEZvQlVDWWFFbXVq?=
 =?utf-8?B?NjlRZ1Flb3JOb3ZBcFY1VzREQVR6UWQ2U0NHQ1hzd2VFWmduRkJoYi9VTkpD?=
 =?utf-8?B?S1BYaTF4SVl3dUdRRnFHOC9PSmdYS2EwdFZ0RTRsdmVUa0JzTmtDZ1Bzdndn?=
 =?utf-8?B?d09nU05ERFlTMDl1dDlxWDB4blJJeTZkRk1nOXdIT1dZcE5TK29HSHZzeEtV?=
 =?utf-8?B?YmRKQlFicXhLcE1ubHE0OXVpOGZnOGx3OVJQUHppbUFIT0ljdFl6V1FnNDc3?=
 =?utf-8?B?eFRlV3dxODJFd2ZvdXdHT2tZbC9tTkNPS1diSkgyQ2V4dXpTckNlbjlOUWVj?=
 =?utf-8?B?cWt0L3lmVVV6MTVmNVNhLzRmYkVXZzZGTm5wYlZLUDYxRGlWVHQvZnRpVDNW?=
 =?utf-8?B?WlpwY0NkK2NJeE04Vlc0bk00d2pYUmZsdnV1ZitpY3o3ZDNFOEFxNzdCbUZt?=
 =?utf-8?B?Z0tzTzlRZUUyeXBTYlhQOUhBQmo1cndrLzBYeGNGTVpHQXA5cjdtbXZHdXlW?=
 =?utf-8?B?T0hEdmpxV2l4Q214Z2FkbXZJNDlwbThYR0JYRDE2SEQwTmNsOHN0bDZlWG9Z?=
 =?utf-8?B?Q2tUK2xUNEhReGw0TXRnRnlWTVhveWVnV2lXOHBnWlphS3VncjBZRlVmL2E1?=
 =?utf-8?B?UEVpOGlOMndKaTNiZFJabjF2a24yUUUrdW56MTduSUJGSmxHOUg4bXE4ZGtM?=
 =?utf-8?B?RHlzWGs5aWNPcDFYVFlmRGZlU3BTOTQ0by9GZ0VTZmMvV3k2dWNEdDFyNk1n?=
 =?utf-8?B?K2lUcTBJQmtkcEkvR285dk9zNDA3K2RzTGVIYlExMzY0TzdkUmc5SU1BNS9v?=
 =?utf-8?B?WFRZZG11MEdITmpSampKVHFSWGRoOE1oZklET2RLRWo4MmVXM2g2UkNSZWE1?=
 =?utf-8?B?VWFRc2F4ZUNaY0hQdTk5MW4rZU5TVUloSkpWU3FtTXdrS1NEQkUwZWlIa3hK?=
 =?utf-8?B?Yi9WalF2c1NnMzN4dU1KcE4vZ1FqWkl0YlMxaytpdzlsb0xNdGZaOGVHU3A3?=
 =?utf-8?B?VWVhczk4aGwxS0pZUW0rMUhGZTFqcVQvOVhFY3QwdmFocVBVU3ZEL09SWUpZ?=
 =?utf-8?B?Y2doQnBoTFJSeXBZVVR0dmdvdzRlWnllanhJZ095aSt1K01ScHk2bUlwM2Y4?=
 =?utf-8?B?N0p3SzlrUzlOSHMwRGJLYU1sUEFBTkVObGJOZWVQODQzRVE2SjlZaWsrNndm?=
 =?utf-8?B?bk1PYzVTUWRFSklXSUhaNHZrcm4zZmdmRWNtdDNhUlhoVGdVRHlXclV3OFVX?=
 =?utf-8?B?MHZta1pjTm01bkxpR3ZBYUlEYUF3ZXpvVGJzeWpDK0VlOWgyMS9oNFc4aGNF?=
 =?utf-8?B?RysvUHZXQzNCQW4vckZFdFZmZ2NmUDVEK2RlN2JkK3lFaFpCOWhHVlEyUm1V?=
 =?utf-8?B?Nnh2L1R0eDUzOGE3WmNXSzNwZDNjcTVmUVQ0L0NRdUMvTkE2UFh0NWVVTlJI?=
 =?utf-8?B?WlBmazd6Q1BLZDBjQ0k1enFyeVp1TTd3cVl0cFh2ZXJWZzVlV0ZsRWFDVzV4?=
 =?utf-8?B?Q1Y0NHhJNThLSVI2bUZLQmJRSFFVY3liZFl1QWQxbS82OXJjTHVUcFcrSFRV?=
 =?utf-8?B?ajhpcnhnemJwaTNFMjQrNnFHSU1hRDRsS0kzL2pnZ0J5R3BjR2U0bGxQTmg2?=
 =?utf-8?B?QVJib0c5b29KQkNvbnoxaGsrNmg2U2lpZUF3VktTcVBMVnByc1JTZjBuelh4?=
 =?utf-8?B?NEM3bEJxTnJ4N0poU1ozQ05ERCtxaXdEYm04QkhnRjNmSU05Y1dIYzFFbXUw?=
 =?utf-8?B?YTRVKzNaYkMxYkUyaWE2MGU2TjN1aGp6dDhkNU1GajNHQnFuQzRMSWNLWVNS?=
 =?utf-8?B?RlJCaDUyT2xHUWVwNlc0b2xBQnBZUllLaHZSbTNaRFA1Sk9VYWRZNzNsY3pL?=
 =?utf-8?B?K2o0dG1SNmpRVGNYcVdDMDdieWMweVRnRmIrZ3IwdjdKcGNOZHk4WmpldlNw?=
 =?utf-8?Q?e0liiFR4yYqe/2qHkychdhHfa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658d4215-c68b-44f7-b46a-08db0f4877d6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 11:33:32.6928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+37LuIkflROcOt7nzssRe2cKnyEC4QEYaj0NRWnyUiv0QTa6xkAVXJi5fXWTLJfvPhGz5FolHwrBUnrT/6kuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7523

First of all drop 32-bit leftovers, including the inclusion of the file
from head_32.S. Then further move PV-only ELF notes inside the XEN_PV
conditional. Finally have the "supported features" note actually report
reality: All three of the features are supported and/or applicable only
in certain cases.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -524,8 +524,6 @@ __INITRODATA
 int_msg:
 	.asciz "Unknown interrupt or fault at: %p %p %p\n"
 
-#include "../../x86/xen/xen-head.S"
-
 /*
  * The IDT and GDT 'descriptors' are a strange 48-bit object
  * only used by the lidt and lgdt instructions. They are not
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -83,27 +83,33 @@ SYM_CODE_END(asm_cpu_bringup_and_idle)
 	ELFNOTE(Xen, XEN_ELFNOTE_GUEST_OS,       .asciz "linux")
 	ELFNOTE(Xen, XEN_ELFNOTE_GUEST_VERSION,  .asciz "2.6")
 	ELFNOTE(Xen, XEN_ELFNOTE_XEN_VERSION,    .asciz "xen-3.0")
-#ifdef CONFIG_X86_32
-	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __PAGE_OFFSET)
-#else
 	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __START_KERNEL_map)
 	/* Map the p2m table to a 512GB-aligned user address. */
 	ELFNOTE(Xen, XEN_ELFNOTE_INIT_P2M,       .quad (PUD_SIZE * PTRS_PER_PUD))
-#endif
 #ifdef CONFIG_XEN_PV
 	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
+	ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,       .ascii "!writable_page_tables")
+	ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
+	ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
+		.quad _PAGE_PRESENT; .quad _PAGE_PRESENT)
+# define FEATURES_PV (1 << XENFEAT_writable_page_tables)
+#else
+# define FEATURES_PV 0
+#endif
+#ifdef CONFIG_XEN_PVH
+# define FEATURES_PVH (1 << XENFEAT_linux_rsdp_unrestricted)
+#else
+# define FEATURES_PVH 0
+#endif
+#ifdef CONFIG_XEN_DOM0
+# define FEATURES_DOM0 (1 << XENFEAT_dom0)
+#else
+# define FEATURES_DOM0 0
 #endif
 	ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, _ASM_PTR hypercall_page)
-	ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,
-		.ascii "!writable_page_tables|pae_pgdir_above_4gb")
 	ELFNOTE(Xen, XEN_ELFNOTE_SUPPORTED_FEATURES,
-		.long (1 << XENFEAT_writable_page_tables) |       \
-		      (1 << XENFEAT_dom0) |                       \
-		      (1 << XENFEAT_linux_rsdp_unrestricted))
-	ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
+		.long FEATURES_PV | FEATURES_PVH | FEATURES_DOM0)
 	ELFNOTE(Xen, XEN_ELFNOTE_LOADER,         .asciz "generic")
-	ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
-		.quad _PAGE_PRESENT; .quad _PAGE_PRESENT)
 	ELFNOTE(Xen, XEN_ELFNOTE_SUSPEND_CANCEL, .long 1)
 	ELFNOTE(Xen, XEN_ELFNOTE_MOD_START_PFN,  .long 1)
 	ELFNOTE(Xen, XEN_ELFNOTE_HV_START_LOW,   _ASM_PTR __HYPERVISOR_VIRT_START)

