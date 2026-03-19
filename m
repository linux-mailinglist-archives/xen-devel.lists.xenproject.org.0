Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M+PL0z6u2mzqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D32CBFDB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257116.1551553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRR-0004qP-Uy; Thu, 19 Mar 2026 13:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257116.1551553; Thu, 19 Mar 2026 13:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRR-0004oY-Rs; Thu, 19 Mar 2026 13:29:37 +0000
Received: by outflank-mailman (input) for mailman id 1257116;
 Thu, 19 Mar 2026 13:29:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl8P=BT=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3DRQ-0004oN-LK
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:29:36 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab168b78-2397-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:29:35 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by CH5PR03MB7816.namprd03.prod.outlook.com (2603:10b6:610:210::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 13:29:25 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 13:29:27 +0000
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
X-Inumbo-ID: ab168b78-2397-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fh/abOj6TbsJBERSuIRSREnZJWm9p5Ans47bJqSG/FYhN10M1dhJWOl8T1GLA1m9U0qglrXN2wsI5DmWcQ1W6ovwI8sViw7cWlw5grymStJy1XEUqtz42xA3kbIEVYQmlRLSl1df2uu/xbaa+NGfSKrIbm1K6PiYyk8agRQbHgiucfECSo5ROUjFkHA+WCnl3e2t9MQQ5t2C/N9BoXoCkTfMJTJ7jxnNeL3EF621j95IhNgwCtnA9tX0tfe7VRrm5Te2HbrO84Vk4a+5ygV3vHHS32HhVVQSJfuoGiSC7sDU+6DlKU1basjF2ZMrQJT0Kp+Yp9Le6Oc/B8CmFArS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZYHh2nERUuC3aPj87t1rqwwMQkqw6AuIWVuFd7BOtY=;
 b=K/2rRVWPl/EjEb/RzYTwyFvRoWaUzTLcWuk5j1A9k0i0yg8Lg99ja+i86Mo6VyFaAUq7e+riY4JbyY5RxcEyUzy8n9BvUGL6t1f9WPLEU2R2rYIgZRxrK82/9uc9ZFBBcxlpj5g34NP4Lfg3x4CmIVdMoNTzDLD6CbNYUw92sXk5Sma6LicCChe6umicOJ0IbMrqX1GPbtIHyg/xBa2ihQW3m2OKYuBr0NhH4DPMW5gPH2PbTZGvQOuvcvL7EggF1TUg5oRAl40FGt1g+6YAdWrnm5p7bLCaUkttzAcsajwNi/3ym1++wHqZjef/f39QlXQdMoWh8+jsvreyK4SICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZYHh2nERUuC3aPj87t1rqwwMQkqw6AuIWVuFd7BOtY=;
 b=aWe8XWVMPfD2etaDucuTe4G+x+fUl4N1KrPjjZcWH9GrL3nfZMbm/9mWMmYyORUj9cOO2gV6eEpoKgOhWT9NwgFCXzCOfazLfURClrT+kx4ug9RvSK02txwmGFQgppPdpYuUcxnVxo/y7rxfeJT6+qoTtKjza8tw7vJ+zc7wc9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v1 0/8] x86: Always use eager-fpu
Date: Thu, 19 Mar 2026 13:29:16 +0000
Message-ID: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::11) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|CH5PR03MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d757c3-ada7-464d-3ce3-08de85bb8b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Th/on3hRMg8qcdVnkR04ZJXkyol+2XH+iQzC3DRCXYWeeB7WdkDYuVsOqni0hqGMyVuxmzDJfrhukCxqR3fZJ8RS9n/YjOFlGClYUUNEYau28f05In9FeMQ5SEGkYNEEtPcqmscUBQ5KFb3nZiyWUoqwJZHgdmMfMgQxweFYrARBwppLnnyKmiTBwbjtkT/nvmwYo57fLtVNHTywOnGm59zu9KI8X2OF6+46RbwnuAkDQzxe9vFOxnFja+q7YH5rprQgmOi4adgtTKq5nAIJq9wh3+ECO6MDhFLoYczw3HBwruQ6Xez6N0rxuWlyPF4Ax33RzggC8pM3sa29j4ki02fakPAqxI3XqLLHE6CAwnYN1k6X2z7CLBZ+lpU3K9bHAHaZ5ZuA3h3/ZsQ+qkjHVKBnjr3hxXEgrKn6ixrGYkOK1T6wfuI789pMKenyX+OjqlXVT1wW+7UGrZzRRVNuWEH2qZKAg6yoS6Gb2WW4dZdp/+YmIVyYmzpRc1r05YYulBn7ltpNDw/rnbgf9YoEwQdh7tZ1egaLa1uUoThJffWZvh4ZBKn0qZoNjArcq95An9klPc+oI2GaS2ABIJohgVM8ypVyvYJ5mz1Abe7Y4TQ0rhvbyhV0AOZa+cvobH4PHcFI1osr8Mb+4NQjLEDlThDeCjuu+qVf4QZvU6b+xekTu3rajO+FNlCckkzzOiJUe1lb4k529VubRxzJ9yIXChnGG/vMlktX/YEtr1edbL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wYdQMd9Hb+bi7sjpoG6cv0uWl5AfgXrwm7wxjuBdvvCLOpkB+lbWAiAMKeXJ?=
 =?us-ascii?Q?ndmKHEgtKgWGisGbwpVtsM+AODFkl715XF67U8wgODeATKezAtEYLL2c+Acn?=
 =?us-ascii?Q?7+FpLVLSLaDbzWNmirAMlQxikHZ8t+/pbero/piQwoW8wHBMLGbYNsitEqMq?=
 =?us-ascii?Q?6WcwUAJpvvCIf4YMHEa04LqbkYUruO764Bx4oz9v4f6AZFpqpyh35e/85Qf8?=
 =?us-ascii?Q?BHE0sVln6N6TJ97x4ZiPdjMubphSjMnGkzITdZkKDcpwd5E8BXpX42sUuaA5?=
 =?us-ascii?Q?d5KLgS3YxEcGVk3eSSKa0KoetT6/9X/CAcTXHmQDYHsicooxNSi9cuz4rUqh?=
 =?us-ascii?Q?Bx2Osm7K3PLUMHr0LepAyQP0S2ubezan8bDR1s3yfd51ZrFVHPDWnQ7NxfVE?=
 =?us-ascii?Q?dHDIOBpHyvFIYlnh1ynXu6SFBS5moTXXhC4qqelCnK1bjjd4WPkaVq7FIhFU?=
 =?us-ascii?Q?sczYihZY0YFGo77/PKCb5hHw0ahUmp+TzCPSkY4+RiGHrY6eoAsr0eWbzy54?=
 =?us-ascii?Q?8s71m2dARCdL8pLmKtpD/KZoiw2C3rZN8oRSHV7a1N5cmBYSNPsv8J7TJz2C?=
 =?us-ascii?Q?bbUtoXmDSV/4kTLpgq65mgb+fJzwgLZN0jh59CRrCneUpBxG+KWom/dVKCFB?=
 =?us-ascii?Q?9uVr84sGSWFaRgCpS1y7029HKhBx8Mb2Mj/DvzCUgkC0zQffvvnx9DRmBhkM?=
 =?us-ascii?Q?No2ZH3uivz7kNW5DjTOjKhcucPIiGWnhzisQOrrT7YSnMok1KTnXmCayrmT6?=
 =?us-ascii?Q?KguowpM1NxMgTdvzuNZhbvlK4kMBmAP6Pzc5ZxMtJmsjYf/zT2WjkL8mwgkp?=
 =?us-ascii?Q?g847ino+8uUSIEv1q9/9DAwMc33YjI0v4uJCtDUMs7zlPZIcGbvb6YFFVZ73?=
 =?us-ascii?Q?adX92VgadB4Ut65DGaiqEmcEIPZFckmu5t0F1Af7KrPBj0VeIpk3MT3s1kDI?=
 =?us-ascii?Q?+NLtflQ2RkMZI9xKhpB8+RWFWXP7yKQJ0mE4g6sopg2V10XjcZIjiPhc/8Th?=
 =?us-ascii?Q?QWQNLVoUTbpeOV8AAjxDj6OHPYYlWelaM0aTeeOk8DNb6TFzQme9LAgbGEMy?=
 =?us-ascii?Q?IXqqPxGSwB5LtamSElFNT0LVNUIeZzRVi5AOjIgxkMzxItxK4Cz33Cgj9MQE?=
 =?us-ascii?Q?KbjEU2jHGrJ1D2BLpRE46ih2Gf50PBvfTGdc9YOREg9WVKmfEMsaf8EGaJ4w?=
 =?us-ascii?Q?pw5XeSfvbcbgaPgQoZ9FN7Xb79nL+i9uEF3WcI6JSN7ifd2CJSNM1z8GiuQs?=
 =?us-ascii?Q?ua3yZu7z/NuAsKYnIg38phCM9nwm3tCr9li66Lvm0mn7Msl/rTlQkt6U1won?=
 =?us-ascii?Q?kuof4ZM8a3STFoeaJedF0wxBjsfHREi9yaSHNyQqJ+4CMTtc2fnQSNPZ2oVZ?=
 =?us-ascii?Q?n5pDh+9GcNp4TkkLnbD543aWLVcj98OEIUDxW8LSdpoQuC4c0d25nDkXPQJ8?=
 =?us-ascii?Q?CK96YqNBs7R1qln0xjv6VElqZZjIwEv0lCj3pEa4rFLVzJKblu2uz2knoneA?=
 =?us-ascii?Q?jlhMX0sBqzIKqO4h52buwvInpm42yCMXXwg/YwD+I/W9h64Yd6NFrQQTFGEY?=
 =?us-ascii?Q?5Vl5bVEY3b5dIEQ9FitA4GjkptD4z/u26vw3JCzCRzswwjNqVQ4YhVSdBsij?=
 =?us-ascii?Q?HHDeojrKF5FWZsjabnDydk8evBjjHeRn1rY/jkje9ojPd/JPgbUj3AhJOFQW?=
 =?us-ascii?Q?LbAIlyHdXJLTHFDejlF9hSZWOTXxqABilqbGwnE4M8PMRZDwXEBVnu9zYS6Z?=
 =?us-ascii?Q?PbBn82JAhOmHipPM5PgL/BIFFlJPZck=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d757c3-ada7-464d-3ce3-08de85bb8b10
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:29:27.2856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXPpaBl+qKVrb7ZaxwBL7gnlQEB7CZOkwjNJvqB0V7C6oAobKiFUHhlv9vs8WMBuqI6vInZLDG5LpCK7gf13k15dkICOaESQnJd95EZmvDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7816
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 290D32CBFDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the eager-fpu option and cleanup the code accordingly.

The first patch removes the option and includes the justification.
The rest of the patches are cleanup and mostly have no functional change.

I measured a 0.7% geometric mean improvement with this series across a few
different benchmarks (Linux VMs on an AMD host). I'm not sure the
improvement is statistically significant, but it likely indicates it is
no worse than before.

A previous series to do this was submitted here:
https://lore.kernel.org/xen-devel/20240304091307.2295344-1-fouad.hilly@cloud.com/

With the exception of patch 4, I haven't kept authorship and sign-offs
since this is a reimplementation, albeit ending up at a similar place.

Thanks,
Ross


Ross Lagerwall (7):
  x86: Always use eager-fpu
  x86/vmx: Remove lazy FPU support
  x86/svm: Remove lazy FPU support
  x86: Remove fully_eager_fpu
  x86: Remove fpu_initialised/fpu_dirty
  x86/xstate: Stop tracking nonlazy xstate use
  x86: Cleanup cr0.TS flag handling

Wei Liu (1):
  x86/traps: Remove lazy FPU support

 docs/misc/hypfs-paths.pandoc             |   2 -
 docs/misc/xen-command-line.pandoc        |   7 +-
 xen/arch/x86/cpu/common.c                |   3 -
 xen/arch/x86/domain.c                    |   2 +-
 xen/arch/x86/domctl.c                    |   4 +-
 xen/arch/x86/hvm/emulate.c               |  38 +-------
 xen/arch/x86/hvm/hvm.c                   |  16 ++--
 xen/arch/x86/hvm/svm/nestedsvm.c         |  67 +-------------
 xen/arch/x86/hvm/svm/svm.c               |  81 +---------------
 xen/arch/x86/hvm/svm/vmcb.c              |   4 +-
 xen/arch/x86/hvm/vlapic.c                |   3 -
 xen/arch/x86/hvm/vmx/vmcs.c              |   8 +-
 xen/arch/x86/hvm/vmx/vmx.c               |  70 +-------------
 xen/arch/x86/hvm/vmx/vvmx.c              |  15 +--
 xen/arch/x86/i387.c                      | 112 ++---------------------
 xen/arch/x86/include/asm/domain.h        |   6 --
 xen/arch/x86/include/asm/hvm/hvm.h       |   3 -
 xen/arch/x86/include/asm/hvm/svm-types.h |   6 --
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h  |   2 -
 xen/arch/x86/include/asm/i387.h          |   4 +-
 xen/arch/x86/include/asm/spec_ctrl.h     |   1 -
 xen/arch/x86/include/asm/xstate.h        |  17 +---
 xen/arch/x86/pv/misc-hypercalls.c        |   3 +-
 xen/arch/x86/spec_ctrl.c                 |  88 +-----------------
 xen/arch/x86/traps.c                     |  18 ++--
 xen/arch/x86/xstate.c                    |  24 +----
 xen/common/domain.c                      |   2 -
 xen/common/efi/runtime.c                 |   4 +-
 xen/include/xen/sched.h                  |   4 -
 29 files changed, 56 insertions(+), 558 deletions(-)

-- 
2.53.0


