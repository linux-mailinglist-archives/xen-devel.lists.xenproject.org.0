Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AB970DB7A
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 13:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538427.838358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QEG-0006fi-Uw; Tue, 23 May 2023 11:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538427.838358; Tue, 23 May 2023 11:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QEG-0006ck-QW; Tue, 23 May 2023 11:31:00 +0000
Received: by outflank-mailman (input) for mailman id 538427;
 Tue, 23 May 2023 11:30:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1QEF-0006cZ-70
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 11:30:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4828b6f7-f95d-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 13:30:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8684.eurprd04.prod.outlook.com (2603:10a6:20b:43f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 11:30:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 11:30:54 +0000
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
X-Inumbo-ID: 4828b6f7-f95d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hR79YJUBQ4c3RHDFird+ptlKd4eqvanPXtv08a7/cTKT2XosjDZVG4oTsdCsNSWEQZAWbnNijnT6uh82rB6CO46WPj63xIVYrQ3N79G8vQP0kTmQqKj3EEKRk8XwITgGmZWXpD3q5IF/oiE530Lam2msNpT378xZ/4OokvhNT/27QAh2qugR2tLIKfclQbm79nFPRY5MsDCkRa110neRWkYvIRd7KPGEcuUZdxWduFUrzDuFhpvrkllXEJS+XZwiHlh/DGvQpb3H0z3igRT1vHrTiX7ab6KrCEpKC5jmhdM4ud5vltSBO3pzJNrigGG78SverTH4eHS1SzcL9qH9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Zz7/XvWMX03lfJxE79MpM7wbSIlFPhaPUKfMq4W8cw=;
 b=MMLU+9PVno9os3YW51AQlhSlg4zTt35hRNck1Hd5IXaaxNHruw/R5hvv5MSWRuZDaOgTGROQPMrN8UjzN7a5TjfrPHudYcy3Xczi2nbQFF98p+cgxs6lULEt7iCwkn/+RZOeqP2NMVlb9mIu3n8nHKBux4qrrjvfcqz03YCnrVXpGz5Jxa1yf9vFNwLbx0HLwlYTkiQ04DmR1ALAIIvwMqIf6l01V4xhYKKpkX7QBJrAvzYR/jGvVL7yn/IX+3z7+qxfGtJxVZzm0ifK/TlTHC8LmyibBiflYLqM/YQsi5dSJwKGJyEeBUnnf+8LnRRWwXCfiSccNWzi3YIi80ORqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Zz7/XvWMX03lfJxE79MpM7wbSIlFPhaPUKfMq4W8cw=;
 b=PMrXSY9t2TzUzB79pYgiszIkt+XGVnrdsoL9ZVNLGL4WiaTETRMcfeoFBoQLV922jowywwQfMVP0j8vbEevtrZKm9JYfWW93lSuNoP6gJFUzoypSIeIoX6DwHHGxgeBrTvV4sMAP6p1BI0bEal7ohwQWMllSYY3DmJIjUtl/PzO/IOP+2R2OwDoMymMj9Log+UjUry7bOjSyUrXxd0634J333BtjaDTRGVxMx5aWWS12KAgRQ8xHH11n5jOg+NmBJCzs7xOyNcwZBkpaApC5ArQYV3MG5Uv0ehZCFyazTORQy4gmORa2Ugfs92JDxym4Onna1IlRzD5Hwi5Buxd3UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd492a4a-11ba-b63a-daf4-99697db0db0e@suse.com>
Date: Tue, 23 May 2023 13:30:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v2 1/2] x86: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
In-Reply-To: <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e91a961-fd11-4585-2b35-08db5b812b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j0XQV98t+G7gD6vf4Z6qBPi5D6WLWfeP80Z8nZhDNoqzYIrYI029Oj03EJdNIMTbCXNL/yZcIT6W3kPoe0+iBR7mSZPrfLlGu6b4lXHv1jHmPRtRyZ6/6+9mkIrMBNxYlIlEMXZt2lUBArE8Ro1ho9u1yEQY1tBQgws8dWZGednnkDmBw61xpahw3q3o/I6lPmNwqJgpj8gHrn5K/ceWInk9hFTQpec+wLr0r+6TPfFLaS2oz3zRqvbj6ObomwwsUIxDqoIyRcwHWLktdP5tuyLw0cJ5x1amCur96wR1TJZqgV4e15t9jdc4jA5H2TAMowvN58Vm8V0mrztjxcXFoadP+Be9Sy6v6hc7Qreztybmk2ZTc6KsjRZhb9tVzfxz7GyDptQmtgc2MXJmzLYzuL7748e3q8PzKU/U689DKKxXMvELfkecIx+icewPj7+tnvIAH6k363xnmZ8qnmC6KE2e9l1uATSPkYgD5Y7d+WK7uepjTljKUHtufXnsBsm1Mpi7Mk2rIX8hCP017y7HCJ27rLh5UyejjJpwLoa7k+DZnyYfWjx2jZv1i8M7+h+3N7tNPpbGxA17Pa4HWH61x8RgJ7fkLEK/Fii1DDXmFeTqmUr0fAPqa53L++tv6NgFIsMwcq698fYxbG/NEEFj2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(38100700002)(86362001)(31686004)(30864003)(2906002)(2616005)(478600001)(7416002)(8676002)(8936002)(6916009)(6512007)(6506007)(36756003)(316002)(4326008)(5660300002)(54906003)(6666004)(6486002)(83380400001)(31696002)(966005)(186003)(26005)(66556008)(66946007)(41300700001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3FwcFNzUHhkbmhzY2VnR09LSUJaMG1KUGxCQ005STk2eFVKVGZjd0gxMnlD?=
 =?utf-8?B?U2xmU3p0Zk5NakRGYmd3K3B3c1pzelJjZUVYTU9VTFZ0SkJvTVliZUpNSXBZ?=
 =?utf-8?B?TU0ySVMvUlhodmdKWWYyelZoUCtEQkRObVNpMTBEdzZneGRsbXBhVXgvUGV3?=
 =?utf-8?B?K2R6R29WSDkwVnl1SGNsOVdBNXVLUGlNd1ZBRE9OSVFFRi9hd0x0VHRpVndU?=
 =?utf-8?B?U3ZZT0pXa0JIS0JsYmlhaG1qMG9OYXg0K0ZvMlRsVlcrTFNKMzIvdHJJMDh5?=
 =?utf-8?B?d3lpZFFtLzRRdk5tVHJNMmNtblV1b2ZpQ21Mc2tZV2RsM0NJMU5LZVBwOWJy?=
 =?utf-8?B?WU9STzEySzMrWWYybndNWkVwaTRUbFliYnI5ZWpjazRuZW84a0lDc3RzLzI1?=
 =?utf-8?B?V3RLV3dkRVFaSHZlbHA3N3krUXU4M2cwYWZ5bE45NUk0TzJlQm5ldkl0SDRV?=
 =?utf-8?B?ZlYvOTFxa1hvM3BPakFYYVkyd3ZQb0tEZ1VuaUh5OTBsZ3B2dHJWU1k5SlJR?=
 =?utf-8?B?Wk8xb2E1amViem5vby8rZ3VCYVNQZHdjeTFyRVIrWGdaeEtVeHZhcktWMUtK?=
 =?utf-8?B?M2dQVDFiRXZqR25UUkVnU2RoaEhOTGJsSGwvb3hrK2RJQWx3Q3BsYUtCb25n?=
 =?utf-8?B?NHNGR3BZeHBvVXZHVnVvNkwrWnBJbVFlN1FqMVg5L0trQTI3UVQyNzF3VnNp?=
 =?utf-8?B?ejQyU1NncTducnV5RDdySWZRc0VMaENIaVQ4VlNERDlkMjB1UG40aVM0Yyt3?=
 =?utf-8?B?MUVXQ1JWZ3ArY01QQitmQWg1Yy9lazZ0YkNQNzgzd2x5OUwvMi9GcEY1SkNR?=
 =?utf-8?B?dlV4dU01K3ljU3VJT053Q2M3UDk2RFF4MnhDNGVBOEY3bWlLTjlYKzBtMFNz?=
 =?utf-8?B?VUhrUlpvQmR0Q3FHaTdUakdjT09DaG81OWxtcHYrbVQ3b1I1TkVzbzhZZ1dU?=
 =?utf-8?B?RlRybVFTdlh6UVZkc2dhTnhIQUNEYm84dkZJck1mM1BEL0Z3M2xPNzRuL3Y5?=
 =?utf-8?B?NUVkdnFmc0V2NDQ4eXdCSUl5Q2R5NlpTejBqTlhjN2ZjNUNuRVRBZmlqc3Rh?=
 =?utf-8?B?MktURGgzOFg0YXQ1cWJCZjhWUW5hbGRlcHorcHJQYUY2RHNwMzJEMlFpZHF0?=
 =?utf-8?B?V1RwWmVhL29yUlp0UUE0N2pKZDlBODlsanlNdEZKQ2VuNm10eVZ1Z0RSc3JP?=
 =?utf-8?B?Sm9zRzFnK09PKzFqaUJiY0hQWmRBMWE1c0ZOZEVaTjhLQkZFWDBIcklIWjFr?=
 =?utf-8?B?OGlhZmltMzI0QXM2NU9lZXQ4K2lQZlNHYjRKaFQ3cSs1K1E4VWtPM0YrS2JW?=
 =?utf-8?B?bGlvRWlSMHFOa0NNbnM2MXpnVW96UFBDUDJxNHE0ajQ5YmJxZ1V1cUVzR1lC?=
 =?utf-8?B?SHRXaEtYbDhrVGNJaVN3Q2wwSjNiT1Z4TXVvK1l5cmY3Q0VmV3VDVEE5Z1Zu?=
 =?utf-8?B?anJGQnQ0R0lpbkZXK2dzMEpjM1l2bGhUNmRubTEvdkdNRTduUjFnNXFpSzdL?=
 =?utf-8?B?UU1FNXFEOUNick9qVUlFa3VERVl3MUdTNGZqTXpCUlpMOVFHVW8zTjI4RldY?=
 =?utf-8?B?WHhLZnRockRXVXhmbWgyTUFBZUhnT0tyaUthR3ZzOUZxM2lvSm1QMFlkT2VW?=
 =?utf-8?B?S3R1VnBVaHNvVnlYdkZFY0hEVko4Ly8zU3FGV3M2MDhDRUtHWjN3VStybGVP?=
 =?utf-8?B?eHVNa2xCRlBYSTJsMHl1TEFONGFyUlBNdDRwNEs1b3ZhK2NCYjVheHRnZFRo?=
 =?utf-8?B?M1ZUbzN0QUJMWExrOENFNzhYZVVLUkRJVXZBZ3dub0hvQkkrUDZHTXNaU2xv?=
 =?utf-8?B?eGJMREdZR3YxaVNYLzZCSDd3enlqK2hyaXpWOU1nTnBvbDJKQkZsaHFYdnEr?=
 =?utf-8?B?ZFUrd2RDbmdDdVp0emdMTUdRTGtKTDQrOW9xbUFRYlRVZHlrTjdDdkt4Qm96?=
 =?utf-8?B?Q05uUGJXNUFBdFNzZzFSRDBoTTJKNEI0Z1VHUmdiOXk5cjFvWXdPMTRGQmZH?=
 =?utf-8?B?RFAwRmk1RXlMMzZvUGg2NlVITlR6MzdIVUxRMENMNC9KMEdOMkd3ZnRHeDVW?=
 =?utf-8?B?cE81SmZBVzA5Y0hXUHJUSU4raTR4eFkxNFBqVmFVMVZGb2JUZDIxK21rWDB1?=
 =?utf-8?Q?fL6KXJCOHE6yHx8DD0GOhDigN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e91a961-fd11-4585-2b35-08db5b812b07
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 11:30:54.1505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HDMDl3CRilZWY9bzb2iAeI97zmfFWMQmI1N5/oGsmhXmRufbE+jNiRAGP85+KNaOy6vnxiayGPR0QwAIT/IzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8684

Recent gas versions generate minimalistic Dwarf debug info for items
annotated as functions and having their sizes specified [1]. "Borrow"
Arm's END() and (remotely) derive other annotation infrastructure from
Linux'es.

For switch_to_kernel() and restore_all_guest() so far implicit alignment
(from being first in their respective sections) is being made explicit
(as in: using FUNC() without 2nd argument). Whereas for
{,compat}create_bounce_frame() and autogen_entrypoints[] alignment is
newly arranged for.

Except for the added alignment padding (including their knock-on
effects) no change in generated code/data.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=591cc9fbbfd6d51131c0f1d4a92e7893edcc7a28
---
v2: Full rework.
---
Only two of the assembly files are being converted for now. More could
be done right here or as follow-on in separate patches.

In principle the framework should be possible to use by other
architectures as well. If we want this, the main questions are going to
be:
- What header file name? (I don't really like Linux'es linkage.h, so I'd
  prefer e.g. asm-defns.h or asm_defns.h as we already have in x86.)
- How much per-arch customization do we want to permit up front (i.e.
  without knowing how much of it is going to be needed)? Initially I'd
  expect only the default function alignment (and padding) to require
  per-arch definitions.

Note that the FB-label in autogen_stubs() cannot be converted just yet:
Such labels cannot be used with .type. We could further diverge from
Linux'es model and avoid setting STT_NOTYPE explicitly (that's the type
labels get by default anyway).

Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
still have ALIGN.

--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -81,6 +81,45 @@ register unsigned long current_stack_poi
 
 #ifdef __ASSEMBLY__
 
+#define SYM_ALIGN(algn...) .balign algn
+
+#define SYM_L_GLOBAL(name) .globl name
+#define SYM_L_WEAK(name)   .weak name
+#define SYM_L_LOCAL(name)  /* nothing */
+
+#define SYM_T_FUNC         STT_FUNC
+#define SYM_T_DATA         STT_OBJECT
+#define SYM_T_NONE         STT_NOTYPE
+
+#define SYM(name, typ, linkage, algn...)          \
+        .type name, SYM_T_ ## typ;                \
+        SYM_L_ ## linkage(name);                  \
+        SYM_ALIGN(algn);                          \
+        name:
+
+#define END(name) .size name, . - name
+
+#define ARG1_(x, y...) (x)
+#define ARG2_(x, y...) ARG1_(y)
+
+#define LAST__(nr) ARG ## nr ## _
+#define LAST_(nr)  LAST__(nr)
+#define LAST(x, y...) LAST_(count_args(x, ## y))(x, ## y)
+
+#define FUNC(name, algn...) \
+        SYM(name, FUNC, GLOBAL, LAST(16, ## algn), 0x90)
+#define LABEL(name, algn...) \
+        SYM(name, NONE, GLOBAL, LAST(16, ## algn), 0x90)
+#define DATA(name, algn...) \
+        SYM(name, DATA, GLOBAL, LAST(0, ## algn), 0xff)
+
+#define FUNC_LOCAL(name, algn...) \
+        SYM(name, FUNC, LOCAL, LAST(16, ## algn), 0x90)
+#define LABEL_LOCAL(name, algn...) \
+        SYM(name, NONE, LOCAL, LAST(16, ## algn), 0x90)
+#define DATA_LOCAL(name, algn...) \
+        SYM(name, DATA, LOCAL, LAST(0, ## algn), 0xff)
+
 #ifdef HAVE_AS_QUOTED_SYM
 #define SUBSECTION_LBL(tag)                        \
         .ifndef .L.tag;                            \
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -8,10 +8,11 @@
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/desc.h>
+#include <xen/lib.h>
 #include <public/xen.h>
 #include <irq_vectors.h>
 
-ENTRY(entry_int82)
+FUNC(entry_int82)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
@@ -27,9 +28,10 @@ ENTRY(entry_int82)
 
         mov   %rsp, %rdi
         call  do_entry_int82
+END(entry_int82)
 
 /* %rbx: struct vcpu */
-ENTRY(compat_test_all_events)
+FUNC(compat_test_all_events)
         ASSERT_NOT_IN_ATOMIC
         cli                             # tests must not race interrupts
 /*compat_test_softirqs:*/
@@ -66,24 +68,21 @@ compat_test_guest_events:
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu */
-compat_process_softirqs:
+LABEL_LOCAL(compat_process_softirqs)
         sti
         call  do_softirq
         jmp   compat_test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu, %rdx: struct trap_bounce */
-.Lcompat_process_trapbounce:
+LABEL_LOCAL(.Lcompat_process_trapbounce)
         sti
 .Lcompat_bounce_exception:
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
 
-	ALIGN
 /* %rbx: struct vcpu */
-compat_process_mce:
+LABEL_LOCAL(compat_process_mce)
         testb $1 << VCPU_TRAP_MCE,VCPU_async_exception_mask(%rbx)
         jnz   .Lcompat_test_guest_nmi
         sti
@@ -97,9 +96,8 @@ compat_process_mce:
         movb %dl,VCPU_async_exception_mask(%rbx)
         jmp   compat_process_trap
 
-	ALIGN
 /* %rbx: struct vcpu */
-compat_process_nmi:
+LABEL_LOCAL(compat_process_nmi)
         testb $1 << VCPU_TRAP_NMI,VCPU_async_exception_mask(%rbx)
         jnz   compat_test_guest_events
         sti
@@ -116,9 +114,10 @@ compat_process_trap:
         leaq  VCPU_trap_bounce(%rbx),%rdx
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+END(compat_test_all_events)
 
 /* %rbx: struct vcpu, interrupts disabled */
-ENTRY(compat_restore_all_guest)
+FUNC(compat_restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
         mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
         and   UREGS_eflags(%rsp),%r11d
@@ -161,9 +160,10 @@ ENTRY(compat_restore_all_guest)
         RESTORE_ALL adj=8 compat=1
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+END(compat_restore_all_guest)
 
 /* This mustn't modify registers other than %rax. */
-ENTRY(cr4_pv32_restore)
+FUNC(cr4_pv32_restore)
         push  %rdx
         GET_CPUINFO_FIELD(cr4, dx)
         mov   (%rdx), %rax
@@ -193,8 +193,9 @@ ENTRY(cr4_pv32_restore)
         pop   %rdx
         xor   %eax, %eax
         ret
+END(cr4_pv32_restore)
 
-ENTRY(compat_syscall)
+FUNC(compat_syscall)
         /* Fix up reported %cs/%ss for compat domains. */
         movl  $FLAT_COMPAT_USER_SS, UREGS_ss(%rsp)
         movl  $FLAT_COMPAT_USER_CS, UREGS_cs(%rsp)
@@ -222,8 +223,9 @@ UNLIKELY_END(compat_syscall_gpf)
         movw  %si,TRAPBOUNCE_cs(%rdx)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
         jmp   .Lcompat_bounce_exception
+END(compat_syscall)
 
-ENTRY(compat_sysenter)
+FUNC(compat_sysenter)
         CR4_PV32_RESTORE
         movq  VCPU_trap_ctxt(%rbx),%rcx
         cmpb  $X86_EXC_GP, UREGS_entry_vector(%rsp)
@@ -236,17 +238,19 @@ ENTRY(compat_sysenter)
         movw  %ax,TRAPBOUNCE_cs(%rdx)
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+END(compat_sysenter)
 
-ENTRY(compat_int80_direct_trap)
+FUNC(compat_int80_direct_trap)
         CR4_PV32_RESTORE
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+END(compat_int80_direct_trap)
 
 /* CREATE A BASIC EXCEPTION FRAME ON GUEST OS (RING-1) STACK:            */
 /*   {[ERRCODE,] EIP, CS, EFLAGS, [ESP, SS]}                             */
 /* %rdx: trap_bounce, %rbx: struct vcpu                                  */
 /* On return only %rbx and %rdx are guaranteed non-clobbered.            */
-compat_create_bounce_frame:
+FUNC_LOCAL(compat_create_bounce_frame)
         ASSERT_INTERRUPTS_ENABLED
         mov   %fs,%edi
         ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
@@ -352,3 +356,4 @@ compat_crash_page_fault:
         jmp   .Lft14
 .previous
         _ASM_EXTABLE(.Lft14, .Lfx14)
+END(compat_create_bounce_frame)
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -9,6 +9,7 @@
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 #include <asm/processor.h>
+#include <xen/lib.h>
 #include <public/xen.h>
 #include <irq_vectors.h>
 
@@ -24,7 +25,7 @@
 
 #ifdef CONFIG_PV
 /* %rbx: struct vcpu */
-switch_to_kernel:
+FUNC_LOCAL(switch_to_kernel)
         leaq  VCPU_trap_bounce(%rbx),%rdx
 
         /* TB_eip = 32-bit syscall ? syscall32_addr : syscall_addr */
@@ -89,24 +90,21 @@ test_guest_events:
         call  create_bounce_frame
         jmp   test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu */
-process_softirqs:
+LABEL_LOCAL(process_softirqs)
         sti
         call do_softirq
         jmp  test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu, %rdx struct trap_bounce */
-.Lprocess_trapbounce:
+LABEL_LOCAL(.Lprocess_trapbounce)
         sti
 .Lbounce_exception:
         call  create_bounce_frame
         jmp   test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu */
-process_mce:
+LABEL_LOCAL(process_mce)
         testb $1 << VCPU_TRAP_MCE, VCPU_async_exception_mask(%rbx)
         jnz  .Ltest_guest_nmi
         sti
@@ -120,9 +118,8 @@ process_mce:
         movb %dl, VCPU_async_exception_mask(%rbx)
         jmp  process_trap
 
-        ALIGN
 /* %rbx: struct vcpu */
-process_nmi:
+LABEL_LOCAL(process_nmi)
         testb $1 << VCPU_TRAP_NMI, VCPU_async_exception_mask(%rbx)
         jnz  test_guest_events
         sti
@@ -139,11 +136,12 @@ process_trap:
         leaq VCPU_trap_bounce(%rbx), %rdx
         call create_bounce_frame
         jmp  test_all_events
+END(switch_to_kernel)
 
         .section .text.entry, "ax", @progbits
 
 /* %rbx: struct vcpu, interrupts disabled */
-restore_all_guest:
+FUNC_LOCAL(restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
 
         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
@@ -220,8 +218,7 @@ restore_all_guest:
         sysretq
 1:      sysretl
 
-        ALIGN
-.Lrestore_rcx_iret_exit_to_guest:
+LABEL_LOCAL(.Lrestore_rcx_iret_exit_to_guest)
         movq  8(%rsp), %rcx           # RIP
 /* No special register assumptions. */
 iret_exit_to_guest:
@@ -230,6 +227,7 @@ iret_exit_to_guest:
         addq  $8,%rsp
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+END(restore_all_guest)
 
 /*
  * When entering SYSCALL from kernel mode:
@@ -246,7 +244,7 @@ iret_exit_to_guest:
  *  - Guest %rsp stored in %rax
  *  - Xen stack loaded, pointing at the %ss slot
  */
-ENTRY(lstar_enter)
+FUNC(lstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
@@ -281,9 +279,10 @@ ENTRY(lstar_enter)
         mov   %rsp, %rdi
         call  pv_hypercall
         jmp   test_all_events
+END(lstar_enter)
 
 /* See lstar_enter for entry register state. */
-ENTRY(cstar_enter)
+FUNC(cstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
@@ -321,8 +320,9 @@ ENTRY(cstar_enter)
         jne   compat_syscall
 #endif
         jmp   switch_to_kernel
+END(cstar_enter)
 
-ENTRY(sysenter_entry)
+FUNC(sysenter_entry)
         ENDBR64
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
@@ -331,7 +331,7 @@ ENTRY(sysenter_entry)
         pushq $FLAT_USER_SS
         pushq $0
         pushfq
-GLOBAL(sysenter_eflags_saved)
+LABEL(sysenter_eflags_saved, 0)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $3 /* ring 3 null cs */
         pushq $0 /* null rip */
@@ -385,8 +385,9 @@ UNLIKELY_END(sysenter_gpf)
         jne   compat_sysenter
 #endif
         jmp   .Lbounce_exception
+END(sysenter_entry)
 
-ENTRY(int80_direct_trap)
+FUNC(int80_direct_trap)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
@@ -474,6 +475,7 @@ int80_slow_path:
          */
         GET_STACK_END(14)
         jmp   handle_exception_saved
+END(int80_direct_trap)
 
         /* create_bounce_frame & helpers don't need to be in .text.entry */
         .text
@@ -482,7 +484,7 @@ int80_slow_path:
 /*   { RCX, R11, [ERRCODE,] RIP, CS, RFLAGS, RSP, SS }                   */
 /* %rdx: trap_bounce, %rbx: struct vcpu                                  */
 /* On return only %rbx and %rdx are guaranteed non-clobbered.            */
-create_bounce_frame:
+FUNC_LOCAL(create_bounce_frame)
         ASSERT_INTERRUPTS_ENABLED
         testb $TF_kernel_mode,VCPU_thread_flags(%rbx)
         jnz   1f
@@ -618,6 +620,7 @@ ENTRY(dom_crash_sync_extable)
         xorl  %edi,%edi
         jmp   asm_domain_crash_synchronous /* Does not return */
         .popsection
+END(create_bounce_frame)
 #endif /* CONFIG_PV */
 
 /* --- CODE BELOW THIS LINE (MOSTLY) NOT GUEST RELATED --- */
@@ -626,7 +629,7 @@ ENTRY(dom_crash_sync_extable)
 
 /* No special register assumptions. */
 #ifdef CONFIG_PV
-ENTRY(continue_pv_domain)
+FUNC(continue_pv_domain)
         ENDBR64
         call  check_wakeup_from_wait
 ret_from_intr:
@@ -641,26 +644,28 @@ ret_from_intr:
 #else
         jmp   test_all_events
 #endif
+END(continue_pv_domain)
 #else
-ret_from_intr:
+FUNC(ret_from_intr, 0)
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
+END(ret_from_intr)
 #endif
 
         .section .init.text, "ax", @progbits
-ENTRY(early_page_fault)
+FUNC(early_page_fault)
         ENDBR64
         movl  $X86_EXC_PF, 4(%rsp)
         SAVE_ALL
         movq  %rsp, %rdi
         call  do_early_page_fault
         jmp   restore_all_xen
+END(early_page_fault)
 
         .section .text.entry, "ax", @progbits
 
-        ALIGN
 /* No special register assumptions. */
-restore_all_xen:
+FUNC_LOCAL(restore_all_xen)
         /*
          * Check whether we need to switch to the per-CPU page tables, in
          * case we return to late PV exit code (from an NMI or #MC).
@@ -677,8 +682,9 @@ UNLIKELY_END(exit_cr3)
 
         RESTORE_ALL adj=8
         iretq
+END(restore_all_xen)
 
-ENTRY(common_interrupt)
+FUNC(common_interrupt)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
@@ -707,12 +713,14 @@ ENTRY(common_interrupt)
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp ret_from_intr
+END(common_interrupt)
 
-ENTRY(page_fault)
+FUNC(page_fault)
         ENDBR64
         movl  $X86_EXC_PF, 4(%rsp)
+END(page_fault)
 /* No special register assumptions. */
-GLOBAL(handle_exception)
+FUNC(handle_exception, 0)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
@@ -882,92 +890,108 @@ FATAL_exception_with_ints_disabled:
         movq  %rsp,%rdi
         call  fatal_trap
         BUG   /* fatal_trap() shouldn't return. */
+END(handle_exception)
 
-ENTRY(divide_error)
+FUNC(divide_error)
         ENDBR64
         pushq $0
         movl  $X86_EXC_DE, 4(%rsp)
         jmp   handle_exception
+END(divide_error)
 
-ENTRY(coprocessor_error)
+FUNC(coprocessor_error)
         ENDBR64
         pushq $0
         movl  $X86_EXC_MF, 4(%rsp)
         jmp   handle_exception
+END(coprocessor_error)
 
-ENTRY(simd_coprocessor_error)
+FUNC(simd_coprocessor_error)
         ENDBR64
         pushq $0
         movl  $X86_EXC_XM, 4(%rsp)
         jmp   handle_exception
+END(coprocessor_error)
 
-ENTRY(device_not_available)
+FUNC(device_not_available)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NM, 4(%rsp)
         jmp   handle_exception
+END(device_not_available)
 
-ENTRY(debug)
+FUNC(debug)
         ENDBR64
         pushq $0
         movl  $X86_EXC_DB, 4(%rsp)
         jmp   handle_ist_exception
+END(debug)
 
-ENTRY(int3)
+FUNC(int3)
         ENDBR64
         pushq $0
         movl  $X86_EXC_BP, 4(%rsp)
         jmp   handle_exception
+END(int3)
 
-ENTRY(overflow)
+FUNC(overflow)
         ENDBR64
         pushq $0
         movl  $X86_EXC_OF, 4(%rsp)
         jmp   handle_exception
+END(overflow)
 
-ENTRY(bounds)
+FUNC(bounds)
         ENDBR64
         pushq $0
         movl  $X86_EXC_BR, 4(%rsp)
         jmp   handle_exception
+END(bounds)
 
-ENTRY(invalid_op)
+FUNC(invalid_op)
         ENDBR64
         pushq $0
         movl  $X86_EXC_UD, 4(%rsp)
         jmp   handle_exception
+END(invalid_op)
 
-ENTRY(invalid_TSS)
+FUNC(invalid_TSS)
         ENDBR64
         movl  $X86_EXC_TS, 4(%rsp)
         jmp   handle_exception
+END(invalid_TSS)
 
-ENTRY(segment_not_present)
+FUNC(segment_not_present)
         ENDBR64
         movl  $X86_EXC_NP, 4(%rsp)
         jmp   handle_exception
+END(segment_not_present)
 
-ENTRY(stack_segment)
+FUNC(stack_segment)
         ENDBR64
         movl  $X86_EXC_SS, 4(%rsp)
         jmp   handle_exception
+END(stack_segment)
 
-ENTRY(general_protection)
+FUNC(general_protection)
         ENDBR64
         movl  $X86_EXC_GP, 4(%rsp)
         jmp   handle_exception
+END(general_protection)
 
-ENTRY(alignment_check)
+FUNC(alignment_check)
         ENDBR64
         movl  $X86_EXC_AC, 4(%rsp)
         jmp   handle_exception
+END(alignment_check)
 
-ENTRY(entry_CP)
+FUNC(entry_CP)
         ENDBR64
         movl  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
+END(entry_CP)
 
-ENTRY(double_fault)
+FUNC(double_fault)
         ENDBR64
         movl  $X86_EXC_DF, 4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
@@ -991,8 +1015,9 @@ ENTRY(double_fault)
         movq  %rsp,%rdi
         call  do_double_fault
         BUG   /* do_double_fault() shouldn't return. */
+END(double_fault)
 
-ENTRY(nmi)
+FUNC(nmi)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NMI, 4(%rsp)
@@ -1120,21 +1145,24 @@ handle_ist_exception:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
+END(nmi)
 
-ENTRY(machine_check)
+FUNC(machine_check)
         ENDBR64
         pushq $0
         movl  $X86_EXC_MC, 4(%rsp)
         jmp   handle_ist_exception
+END(machine_check)
 
 /* No op trap handler.  Required for kexec crash path. */
-GLOBAL(trap_nop)
+FUNC(trap_nop, 0)
         ENDBR64
         iretq
+END(trap_nop)
 
 /* Table of automatically generated entry points.  One per vector. */
         .pushsection .init.rodata, "a", @progbits
-GLOBAL(autogen_entrypoints)
+DATA(autogen_entrypoints, 8)
         /* pop into the .init.rodata section and record an entry point. */
         .macro entrypoint ent
         .pushsection .init.rodata, "a", @progbits
@@ -1143,7 +1171,7 @@ GLOBAL(autogen_entrypoints)
         .endm
 
         .popsection
-autogen_stubs: /* Automatically generated stubs. */
+FUNC_LOCAL(autogen_stubs, 0) /* Automatically generated stubs. */
 
         vec = 0
         .rept X86_NR_VECTORS
@@ -1187,6 +1215,7 @@ autogen_stubs: /* Automatically generate
 
         vec = vec + 1
         .endr
+END(autogen_stubs)
 
         .section .init.rodata, "a", @progbits
-        .size autogen_entrypoints, . - autogen_entrypoints
+END(autogen_entrypoints)


