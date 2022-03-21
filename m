Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB254E2568
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 12:47:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292940.497511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGV3-00042Q-H2; Mon, 21 Mar 2022 11:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292940.497511; Mon, 21 Mar 2022 11:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGV3-0003zD-DN; Mon, 21 Mar 2022 11:47:01 +0000
Received: by outflank-mailman (input) for mailman id 292940;
 Mon, 21 Mar 2022 11:47:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWGV2-0003z7-Eu
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 11:47:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d45195f-a90c-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 12:46:58 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-RazywuRPO8K_vm4v-l1iHw-1; Mon, 21 Mar 2022 12:46:57 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6273.eurprd04.prod.outlook.com (2603:10a6:208:137::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 11:46:56 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 11:46:56 +0000
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
X-Inumbo-ID: 9d45195f-a90c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647863218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2X6yEMK+OHgNoVyLNONBqCrM4DUfGQtj1DZaz8XZ8Xc=;
	b=Ia8zchv8bpEJDNtK8mlfedn9H/D9+ni5dbTRDzLo5wfLhog64B7yqhHuld8auOPEzHV+hJ
	wpmQ5oVmEn5hKimH4IwAyCCjjmc0d0Y3v2zQ8J6UgXAO121noiW6bvhQ8hx0H4UjwW8w87
	58RQiHC4j/vzqwbllrZrGqAOWIB3gjM=
X-MC-Unique: RazywuRPO8K_vm4v-l1iHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7+JA3EFncm/WTWh/XTkx/SX8ZvuK13gmv+TauKcXHStVtwt8v9wEMUGOn/FN9LlyzGp4dvsdY6hh5yMs2rhTlqWSOJc1XXZb+vdVxgkn37oWXV3ePLwJu+y6FGXPxsQRQrRkuYa3xG0ngNp6XdsBK2JFMeDBsxasvY/IBbxINK7excmSb3N2PU8k3zPKMVZAbEJkQ4riKeef7dPWLHZtKyLepcZEtRWHPMLvxWoPrbK0ZRKzYFLsFC4z3cvIBaZgmY222SFWbEB5su87kPTGeHpxt0YB7oZrxeM+VsTgVy8FERa0D9SvdEooRHqx4pueZrBC8dKfxXk6YoWaqutgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2X6yEMK+OHgNoVyLNONBqCrM4DUfGQtj1DZaz8XZ8Xc=;
 b=TskZJrxJTJza7uS7pbZpfO5/44UU25R3pJd+9WeszWbItaig5Kqce78r7VNY/Adag8DjlBsQByLux0wnV7JJBUVvM1WqRkHzbtEYFj798XSoKdlo91HMnZcP7MdchbnwPhvxn3zh0w6a2knD7KS5Lf1Pkbk+PrfTprLFOfb1nll92VnEslcVLr1e8Dgo/162yr/4YdPKKmhHkc2ThwQiFuILUcPz8EkkQ0yqkkoLmCaXKwtsyE7yC2Fx+gEPmLKV3/EhSYK0MAZHJBgXWTx7RyPJF0DLcaCea4QZ27lLUjE808GapZrpURrVpc8kyEOhSvMox6PF1nD0o/jQ5z+gyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <057172d5-437a-347b-b5bb-d102b6b37f0a@suse.com>
Date: Mon, 21 Mar 2022 12:46:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/build: work around older GNU ld not leaving .got.plt
 empty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0068.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35606d6f-533e-4944-9746-08da0b307fe2
X-MS-TrafficTypeDiagnostic: AM0PR04MB6273:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6273F5CC286B7B8CB342B738B3169@AM0PR04MB6273.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PKEjjx+N+ybA0P0AjR55IF3HZETGke8WwdOrcJ29fE1jgkAhNyoUZhjEnKRuonHW2ciVhfwQ/dS3Hp77HeAZerL7zdDD3SLd/oELrlZH4qpDOL1Qc3upJM3ilZQw1TnOKu3GybDvMCTal7CtKGTOQ26xNOf4eLFlyueqF1e4IWSk2EIZwMy4TqcQKtRGcpELcvppfMtc1UaYPP6j5dDlgVTl+xVdD5xJLIBqj+JfwmRWxaIZJbJwMvIvQ3qrOjvR/3Mzdm3vSdo8Xwqyfkks/JkxLKPIPzN+HdaJp0kcGKK17XML7P6xPX4R76Vfggehb+xl45Eo0nbBdWE/PEbmh7A1fCpegh5BX0Rb/AvuTCbUFZJ/kaFfJDrFVs0VWjMRHvzfrnndksBkoNwSLBtuMjePYTvji0eq+fW/p9KlNMB0CbcSPI9fB/Kt5dr4C9yGM5J8VzPhYu5Jbtnqeab7SQu3FcVnc2cA1iS+r6cBhrPt9exRB0tpVzvOz1GwYdPUuI547oNrU7OmwffLTswUZhOzAdkwbqIBy7pemUCb6XMHbf7IuL1R9wEPwR7GnpXnqUQxCHwZnw8GrONL56pAnT4BFOsLTfalErvXh7NQtwnVfpTreHAXFHg6qsAP7Og0nUKG8v8e7J2epQltVov6Vtrs3qwDoYGgB5DOri1fq2qiZoVpH47GU2Y7fIF3uPqpDeChgfyWLmMTXueijo1d9+5b5qgANkuZLquNVQHDzEyGRfwiTMJGiElojUCsWf5fndESMdDMBu8trrugWJZdKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(31686004)(66476007)(38100700002)(66556008)(66946007)(4326008)(316002)(508600001)(86362001)(5660300002)(31696002)(6486002)(6916009)(186003)(8936002)(26005)(6506007)(2616005)(6512007)(2906002)(36756003)(54906003)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTQ0OWkzWUJkS2EwcnhNQ1NObTE4Si9UYmhPY3JSc0ViNzhUUG1aVFFucnVD?=
 =?utf-8?B?NmcvSnVaai9TclFtNkladlNtbFRzYjNiSFJLd2g4QnZaTDdZRGxiVUIzamsr?=
 =?utf-8?B?dk9oSDFSakVyVmk5ZUxEcjdSZDA4SzRFS1ZEQTdMaE15VFZLdVkrQWlzT1V1?=
 =?utf-8?B?Q29Ea0N6Sy9aNldteG03Q2dQTlhiM3lYZ01UZkNSLzZDTmg1YTdPMlcyTFFq?=
 =?utf-8?B?M0lwQ1F4T2tVV3A3b2wwazZ2K2NTbjhJVkRma3dyOTE3dk41MHl2WU82SWtF?=
 =?utf-8?B?UFBVdGZnYVdkTEdCTWtBUmlvTEpKM2toSXVFcVBoL0RyV1gvME45SEVnd3dQ?=
 =?utf-8?B?cXJMWGRnQ1ZTeXRqM3lnZTdXRFRuU1M0eVkzcmc3MVFUMjhlTDNJaWN1MGJR?=
 =?utf-8?B?Z0FTaXdHd1l5cU12T3lMRHg0VzFSZWZRLzUyUXdocXlZMXJka3ZnVUZ0eEZC?=
 =?utf-8?B?RHlFeVhZaDQ0NlhSbHorNkx1eTRxRGtXdGtGSlF2SG91UEc3NDNRSldyMEI5?=
 =?utf-8?B?Y0xEd2FEVFlRdFhnTS91OU1rQ0phTmFkTW5Xczl6ajdmVUNxWVMwNWVjUXl0?=
 =?utf-8?B?NjRYVlNwWERZajVFanc0NExPdkd1T0c5UDFVWHc3bVZGRC8zcU1iMDhjMlBu?=
 =?utf-8?B?MXhtREZ6bVhSTzh3Wmp4ekxqM0pvZEtDY1hhTFZ0RG5IRzNwWGJvdTdzS0VF?=
 =?utf-8?B?cSt6OVVQQ2E2cWZGMkMzKzY5Z3VLNEFGZVdRRHg0cWk2WlIvYUZUenRTaFpL?=
 =?utf-8?B?ZStTNFhFYUY5OUNNTG43NWJzU0JEUVlYaWdjZ2EzakVIelI4ZmVIb253MCtR?=
 =?utf-8?B?SkVFTmhxaitGMktTK2MyUXFGbWxmaTdVWWhXK1N5Nis3SVRqTjBrWlpEWEdo?=
 =?utf-8?B?NW5xZDV1Um0ybTlMcXQ5NzVrajhjR000MGlOMjNrMGtEQ2g4R09ZWmJBamRD?=
 =?utf-8?B?TGxVcmVpOFNkQVhxdUpraysvQVlEVm4rRDVNT1VtMlFzVDU4cmRjcWpnUzFn?=
 =?utf-8?B?RWRuMlN3Mmp4dVRKRFNvOFJ5aGZWT3dCbVVBVkxVdDNDcHB4cUtLUUVFcE1L?=
 =?utf-8?B?UklVcGpmaGQxNWsrTFFvVjJLL1k3MzQxTDNVVGdaUXlZRy9hc1dScUNPdTZ4?=
 =?utf-8?B?dVdFcWladHlrN0Q1dEtlSzBUcTFzMkUrUWhoVlYxQ0hBOThzaDJCNlUwS3NW?=
 =?utf-8?B?OXVSQWt1dWsxOXpVRDdTdUxuKy9XRXZUdURhNW42bGw2QWN6WHg1b0VXcVJm?=
 =?utf-8?B?MHlJVXIyd2NrNmZoYnVTNSszRFhEcXF2dkFMRThxU1NLY0RlcXhlZFZIdTlS?=
 =?utf-8?B?bWRNOHpuUjF1bExmNE5xbjRhcWV5eGtyZUFneVBTa05xdWFSMmZBOEJKbFpz?=
 =?utf-8?B?clFuM3pQTG5IWUQrTHEweUZ6ZytJdHVNTTFsczVNM1ZTMFR5T3E2R1pBazE3?=
 =?utf-8?B?TTJoc1pzbmZtQ3gyaVJXdTBrZndKQUxTVE5yNHlVVTQySTNrakNmRExqU0tu?=
 =?utf-8?B?aU9LZG44UWhKNVRNNi9lQVEwcFE2anlSYW82d1ROVkprWGZqNEFXSkh1cFpi?=
 =?utf-8?B?TkdFUnprTGFDVWIrMUpmL1BiRXZSaVZXM2pLeUwwZzUzcXVpWWcrenNjZGZn?=
 =?utf-8?B?QWp6UFdLQzZsZk1EOHlYTUdDZWpoZFhQNm1CRzM4SzJjVnlsQW1PVFNYS0Q5?=
 =?utf-8?B?a3MzY0xnZ01zN202Z2g1cVRaQmhlRzB4RHFlTWh1b2lSeXV6Y0xhTllJR3p3?=
 =?utf-8?B?WVl4c2dndk9uaTB0UEFkcGsvb2krZzdUeWdmOEpQZWZsaVFYbGsvQ215a2d5?=
 =?utf-8?B?SHo0cFNaa0puRVpVOEh6RXM3M1VaOWtRQTVIc1BUWDB3VVJjZWpSRlAyK2sw?=
 =?utf-8?B?ekFpUXE2UUFrSFE0L3U5Mmltc3hPblVrUlJ3dWwwMTkxMU8vRkcxU1BweVJV?=
 =?utf-8?Q?CwhbGHXcH8LGMRCQopxkjvbyalKT80ka?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35606d6f-533e-4944-9746-08da0b307fe2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 11:46:55.9175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkVoCbTRn8apzNlwZ02yu3mvX6z/v6UsW6FH9AAbPIG/nA6wvxmLNYS/CxrEnlN5fZEJ7GMlzcvoG+9JDUY6Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6273

The initial three entries in .got.plt are "static", i.e. present
independent of actual entries allocation of which is triggered by
respective relocations. When no real entries are needed, halfway recent
ld discards the "static" portion of the table as well, but older GNU ld
fails to do so.

Fixes: dedb0aa42c6d ("x86/build: use --orphan-handling linker option if available")
Reported-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -497,7 +497,13 @@ ASSERT(IS_ALIGNED(__bss_end,        8),
 
 #ifndef EFI
 ASSERT(!SIZEOF(.got),      ".got non-empty")
-ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
+/*
+ * At least GNU ld 2.30 and earlier fail to discard the generic part of
+ * .got.plt when no actual entries were allocated. Permit this case alongside
+ * the section being empty.
+ */
+ASSERT(!SIZEOF(.got.plt) || SIZEOF(.got.plt) == 3 * 8,
+       "unexpected .got.plt size")
 ASSERT(!SIZEOF(.igot.plt), ".igot.plt non-empty")
 ASSERT(!SIZEOF(.iplt),     ".iplt non-empty")
 ASSERT(!SIZEOF(.plt),      ".plt non-empty")


