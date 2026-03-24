Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP3oLdjVwmllmgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39331AA8D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261239.1554322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56M1-0003dD-IA; Tue, 24 Mar 2026 18:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261239.1554322; Tue, 24 Mar 2026 18:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56M1-0003bU-Bf; Tue, 24 Mar 2026 18:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1261239;
 Tue, 24 Mar 2026 18:19:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w56Ly-0003bI-Ve
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:19:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w56Ly-00FIkF-BF
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:19:46 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5a2-2eae-0a2a0a5409dd-0a2a450887c8-24
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:19:46 +0100
Received: from [52.101.57.50]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5c1-1950-0a2a45080019-346539324965-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:19:46 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:19:42 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:19:42 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i15pewFpMkhVkSh2KFM1clt4taaBhTz1F6+Eh1FpwYjT5bSSpLmMzToV2EsrsxetgrHFZuya/cNVJfWWIiGX/bJQdKKvCEx6qN2/C+CsCEHVz480ZRJmjB3hsIuHWT2FgO23TrJoB0IrEOYR2U4qi/ZzGoiADyJ8/14USV8uWh4Obfh3yKoi1DBdrVbAZGVFsUECTBARwNY8QzQcoHDF583m2sMqOgRS+CxwFulOWKRsNp62LAgkj1lUiM4SF1jW59XWJekDzd4iNvecjJCMB3Tw8HIp6Be9bcZmMUAzQebCw/FCnFZ/gsZZ1cwKxerLvbcS6JPHAuS31v2l+WBweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsDVWm2HyHxUVi0OR75wg4R0kv0bP476+3frH8dkrtE=;
 b=PzJC6pQZ0I/wHZ3g9riHnz6xsCtDkVzZ84u2DTf8cTTHAfV44SCyQZ+vYhP/kWDC3b29LzmOjxT3WQMpwtqwWdqFPE4TgEr6dNjm3WSTvFTEH8DA6Xf8xjdwx5kGiWzNsy1tXmmDYvCVyZRrBevxR643iTMS3Uc9FhXHZxL/Ot6k5yZXfPYRqyDOEtV+X4f2BoJ+vRXMTAyYwcVDrofPZzSjomEHIXH2TbW5M8ST8IWPzeKuuljPV4a3ZJBk33DFGFju3LgMw5hghVz0eayNUc0EmUc70uiOCEiYDfC1GbLNlHFguC5CKJ4yBiUvoXItHrG8aFd/Uk7T4OVBuQFUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsDVWm2HyHxUVi0OR75wg4R0kv0bP476+3frH8dkrtE=;
 b=hoGIi+xLxGJ5cOQeGTAnf5u1XVuY93PHktHOm+VeUrnBH3L0bx48Bd7nEzfSYsuSOsDF1dpBHoE6GAVjZJJ9Nvjj7sip/Im2RO2bmjVjsFAVHpJ1FMUo/YgufXl6zKdSpgPbptKGL48X58hBNRqfPf6ysL5hyTrlUMPPla9pHpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/9] x86: Always use eager-fpu
Date: Tue, 24 Mar 2026 18:19:28 +0000
Message-ID: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0295.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::12) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 0000c53e-6835-4650-5f95-08de89d1eb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IsQzS0msO5SKADCwosXn2ErGnl1mrcNz/jgf5Nf9/tHEK8AM4d8XXjqcoVEG0GQUe1p/IzFRaonX5awoOJhpiiM7N306Meu+5GHXt3kXaHDKNyy9p5gxk02TZCSVUqz11gRBdsE4ZjnkSZdB5ZRbIu5ppwzHtdb37w/rinRN9vdFhiUgNrjeQDFfxWnwD30fEXcZUNsM0JP4MLxSdvECqn7JVy2xjZ7iSLiezC9msoubY8/NVQJ7VPplfw7V7yqukyGUkXv75GBD9f09RP9yc8R4mZbA7zYgHCXHqHg++cULkqr8FixHYzhO7jHPB9YS5gvOv+Prntp31oHxIDRPz+a9Vk8u8ddtOFlRLeYKBfTswFEY39EleEsc9xhb7QB/9qtXJlKy9OvFStTjA0mDQ0X8sXwau0vhmvIB2Ks3eH2+gh1whpxHK0eotPole8od4puB+qZ1ryyuNmLR4agObW8lbeC8bhyzcQCCRApjGLlpbCm3Jz7gGSlt1kekx09qasghFm5+Li1slZojbee7DDdI2Yn9yl4n/bzSZo2EAiE1ws1uiDmfHNJaeO62ICxMAPM9tZyrMv5lEuG/KpIrMjiD2cl9T78fexasHq5v8rselQj92cyXKEIypYYF8VcUFw5Nevcy+9AThxtkpVax33P3JB1Xzl+CvdBTTK57Fsg7qcetO3FoaoOOhtzqzAUZUWY5QVk4BCalpqAGTaUuqZeVk3uhIiumbcY/Tt+uuyw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/q3LzfXZrPVjjTHqBFup73B2xolMkx0K2kk6wXyLMZlmtABL8p8JIcGXpEny?=
 =?us-ascii?Q?Z2wOS46T86n/RUDyr1Zr+Ms9/3Z/SxS2N288AYtmMMewxtNCpSb7gpUIWv3P?=
 =?us-ascii?Q?REKBzoRpXd2TwcWRLs4hiK1I+66KZYX9B5QmUmhoiNolCNdapghAs7JiZwNB?=
 =?us-ascii?Q?q34lQ8qjWZwCDoo89s0N/UK4+0Y4aJ6Y3HBiMEF4oOYrMu2sbiE8WfcQ1Fmp?=
 =?us-ascii?Q?3t2crEEzFQpA7PVyYqV2+ipciM6rVRKlNZk3CqYfs02jQ4ShphswNYMXNTxI?=
 =?us-ascii?Q?SPhMRYTm/ZPuQCdq5lPzLSBkPQRYqM1KfVzIJCr3JfFwqaVDhlBm12lmuqMi?=
 =?us-ascii?Q?+PU1ley8KdIkiFGtac6AQNs4qz5qiUdaFuoUx61M9wifp43Khy7bBhq2mCRk?=
 =?us-ascii?Q?CTdt8Aa+Lowi/iqiyyepwRghdnSI8mmnZxh5lFe/9qCQnT0QcIp8q93xK7e3?=
 =?us-ascii?Q?9ldP024LytKkp4MwkwRPDupt7tJxOR6GCGB7AztiJ5JdY6SUB+rBnn0xC3pm?=
 =?us-ascii?Q?S3kEvpLTVBqryJrBDcO2IYC3Na1+Nm0beUuhvSp2tUoxZ20MA9+tPHhTObPZ?=
 =?us-ascii?Q?61XlBUaCx/HxgJRNTlPqZJu/O66QThYKRz94XUJYKvrL1AzANo6nqpjrn5ru?=
 =?us-ascii?Q?DiqLl/QvFU7qr+xEp8uJpVrz1Do+wOtdPZ1hJv5DYMqpcdcKdBaEp2iJM5zj?=
 =?us-ascii?Q?trB7fj5mCfd3VNejVrXJUJZW+7bGWQq4ZQpR2aqd2fW7tKdp/ZmYFD2d2+sg?=
 =?us-ascii?Q?Wn77f5IbkUw6B8ATtHLxeImt6SDIBWGT8XxUlCAF9v3/6FHa4wE85Fe3U4wg?=
 =?us-ascii?Q?rECU1l6mvyv08irFcZV3bsAPoJMjmo/VgcJV6VjXPFj2j5WJOWz2/WanLHoG?=
 =?us-ascii?Q?7yxlwpznzgtY5JcLT4iokv1XDtjJIB6cS3mAROaK1abFvRcB5NEsu9uTy6nA?=
 =?us-ascii?Q?Lb1BldfSlfCNMM/DsTLatgPZHG6k/DPakT6x5O+rgzI0tq/Qg3ZWEcCtM7L+?=
 =?us-ascii?Q?cdBmyD+i7Lypd/ljHm2yQMEBM9ZxACKF5/T0tvaJblL409iDSiqI+owUi9l8?=
 =?us-ascii?Q?fUOEyK/bRGbC4oTKHMOgtUGJAs+TNiMReCSgfs7/jJQ1BQiGUuuir4Gu4Crf?=
 =?us-ascii?Q?lxHC/qBezqNqN3TSrDXwUzWZqjt4EyVqdQ2pcfct5DJMLRqroJZtOrF6/8AV?=
 =?us-ascii?Q?jM+LoRpGjuquZnICP7qdsXdrM/QSINJCCQjDyDEs1BEhGcUPzWFq+edEZqXU?=
 =?us-ascii?Q?uatzIG5M14TETXEYKIe13YWhObBfu0IP89pWVCwePlvSjMlWGzP7be3XltQj?=
 =?us-ascii?Q?AP0mtKW7YLnMD25yr9DHZBm0t0hYG0ouLixh0P9snm3qeUCz82Ok0/D3AGfm?=
 =?us-ascii?Q?Lrz83FNHGoNqFzL94GMdNsR0jHIAyQg5DMHvOdhBZC6IU0WePYgWNZX7vNpm?=
 =?us-ascii?Q?F0wfeF9X7nzzsynKWNZXd/A3Y/kB2Biqi+ilrRpQhuA03svv9XE1dzpNytGZ?=
 =?us-ascii?Q?nBF07tXWjOBqXrxaaR5j8I6HbsjRQqHo6Ra8HgT9KcbFV/4iY6b7dxlPcxNY?=
 =?us-ascii?Q?MFQmJAzPD+mA33ujLPNBYcnCqcn+H5E+XdHn1nQQSFhx/5MQpGtoUr150PTx?=
 =?us-ascii?Q?iniPjbsiwft7EMuaiqslhD44eJG68IcKl07T6jwiztNQM0LyUDxri06Pc3Mt?=
 =?us-ascii?Q?4ru12HT+/TmQFBkCRsI2VFC5wS9wwwYqpQEY+M1DSzVJ8pUmhj+LcRVFH47j?=
 =?us-ascii?Q?oGmGt5V/b+QGD8ek14SXgbCwVcabkm4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0000c53e-6835-4650-5f95-08de89d1eb71
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:19:42.5262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhDFNRIKgapF7T0pR3EVdnm+0Dhwri1t6VHrpg1Fs1FewR5pxG853ctcC7Mna+TJi1B/uLE0g0kUcF03hNn0pLfwMLovU52T6MInKMXxD2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771
X-purgate-ID: tlsNG-c1860d/1774376386-EBC9C726-8B1A7A87/0/0
X-purgate-type: clean
X-purgate-size: 2843
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2D39331AA8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the eager-fpu option and cleanup the code accordingly.

The first patch is a bugfix, new in v2.
The second patch removes the option and includes the justification.
The rest of the patches are cleanup and mostly have no functional change.

I measured a 0.7% geometric mean improvement with this series across a few
different benchmarks (Linux VMs on an AMD host). I'm not sure the
improvement is statistically significant, but it likely indicates it is
no worse than before.

A previous series to do this was submitted here:
https://lore.kernel.org/xen-devel/20240304091307.2295344-1-fouad.hilly@cloud.com/

With the exception of patch 5, I haven't kept authorship and sign-offs
since this is a reimplementation, albeit ending up at a similar place.

Thanks,
Ross

Ross Lagerwall (8):
  x86/domain: Ensure a vCPU's FPU is reset early
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
 xen/arch/x86/domain.c                    |   4 +-
 xen/arch/x86/domctl.c                    |   4 +-
 xen/arch/x86/hvm/emulate.c               |  38 +-------
 xen/arch/x86/hvm/hvm.c                   |  16 ++--
 xen/arch/x86/hvm/svm/nestedsvm.c         |  67 +-------------
 xen/arch/x86/hvm/svm/svm.c               |  81 +----------------
 xen/arch/x86/hvm/svm/vmcb.c              |   4 +-
 xen/arch/x86/hvm/vlapic.c                |   3 -
 xen/arch/x86/hvm/vmx/vmcs.c              |   8 +-
 xen/arch/x86/hvm/vmx/vmx.c               |  70 +--------------
 xen/arch/x86/hvm/vmx/vvmx.c              |  15 +---
 xen/arch/x86/i387.c                      | 109 ++---------------------
 xen/arch/x86/include/asm/domain.h        |   6 --
 xen/arch/x86/include/asm/hvm/hvm.h       |   3 -
 xen/arch/x86/include/asm/hvm/svm-types.h |   6 --
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h  |   2 -
 xen/arch/x86/include/asm/i387.h          |   4 +-
 xen/arch/x86/include/asm/spec_ctrl.h     |   1 -
 xen/arch/x86/include/asm/xstate.h        |  17 +---
 xen/arch/x86/pv/misc-hypercalls.c        |   3 +-
 xen/arch/x86/spec_ctrl.c                 |  88 +-----------------
 xen/arch/x86/traps.c                     |  20 +++--
 xen/arch/x86/xstate.c                    |  24 ++---
 xen/common/domain.c                      |   2 -
 xen/common/efi/runtime.c                 |   4 +-
 xen/include/xen/sched.h                  |   4 -
 29 files changed, 59 insertions(+), 556 deletions(-)

-- 
2.53.0


