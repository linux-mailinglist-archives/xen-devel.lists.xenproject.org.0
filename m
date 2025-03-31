Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED8A7642D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 12:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932374.1334522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzCMe-0005hP-WF; Mon, 31 Mar 2025 10:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932374.1334522; Mon, 31 Mar 2025 10:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzCMe-0005eH-S1; Mon, 31 Mar 2025 10:27:32 +0000
Received: by outflank-mailman (input) for mailman id 932374;
 Mon, 31 Mar 2025 10:27:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Zft=WS=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tzCMd-0005A2-Cy
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 10:27:31 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20606.outbound.protection.outlook.com
 [2a01:111:f403:2607::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd6a4522-0e1a-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 12:27:26 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6927.eurprd03.prod.outlook.com
 (2603:10a6:102:ee::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 10:27:22 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 10:27:21 +0000
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
X-Inumbo-ID: bd6a4522-0e1a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaLZCQ5/e/Ulc1mZEcAJ0+H6rfULdsb0VrvaRVrDDKkBCR0I4jN2K0/QAgP2N8ygFXiKpCfce8R398jjDfKlLBL5p0Mn/Omc8wko+YTzft5xsl6Jfv7cg+oubFf6N9rXl7rYyfZSYQ4I6lTATD1vCfBiHzsCNFYeiUdNGpofa7UiuOsX7fMjg7ghEdtvEAyjLCFOX1yvQIVapTibebdFGVufs9LRpHIqkZWUU6JCmLOlfclA1EeO6TA9+Z+nBztfdWat8sg88qTdYep7W84SHma+FW4UUzQEXSS+lYzPCAwMr08nRud3xincbCFd7gkXdfPa7KS8DgFdaD4lBlRrqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irRNGvGTrVqo5FaUMm2fPxYwCNrJmfj9Fl8mJ1eHTyc=;
 b=DTHLvJeIyGY+WHNV5CKvwcdPsm+MRG6cuOLFkjiLGLBbhMcSlKyeXCmw3sTEmnkM79RErgLx7WFHNM8tvuESm8mKrv7cLtwcmDRdFVq6vuGyHvXkXvmSCQTOF7gIMGEJn0ivxZRGQIqOG+vKw4rDv8TpOBvQPn+v6D0IJ++OLS4rD64rWioBBKztPhk6lUT2ovtIW0pMmKtgvdgoF5m7n8NvyH8FeVJ3SpsTa0xpdTKFi5YnVvBm5jrKpIHO/7eDDhx8wAiIbGnqRmmBnEqOUXHAHHhjUUtD6bnouE6ieky9i/nXbPRKKrAYmqDVjQBPL+GjRW4XxE03VIYZ/sZKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irRNGvGTrVqo5FaUMm2fPxYwCNrJmfj9Fl8mJ1eHTyc=;
 b=bubg1J6VPpaPAVqXrjjTsbFyMKosSX/X/pfLg1DkI5ngqtzI+hiVYSbOZ9xardDfP/gidppl6bBEPl23GAK5AOX033uF/fcywftaR6/mFLljg+S3P6XprrbHppk7EXmk9JAF6Fj+ptwT6ZtnWpkgvnbyA22FJwWLh81uKzqCOHGhrtUBnqHJrtinACKZyVTR7wnURWFvRwfYzISMuLMjqsssZ68x4pGgGsyiLCYXnQ82f9Di4BBTDhxv7JLeJ7BksnRkLUeOWaIKOg3WSxsxcQEz8ByxZ0XEBUIBVrL94yUGxcxUO2z6/r4KqZ20FGAEJB85Db5UT4FlfN+ybiQZBQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Topic: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Index: AQHaRWELmXttIq3ydUeKyfZPAZRMh7DpfE8AgqZH5gA=
Date: Mon, 31 Mar 2025 10:27:21 +0000
Message-ID: <6c6a4ee5-506b-4a49-9749-7518b19809e0@epam.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
 <a289ae5e-0831-4f7b-8f04-df71af23ae0b@citrix.com>
In-Reply-To: <a289ae5e-0831-4f7b-8f04-df71af23ae0b@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6927:EE_
x-ms-office365-filtering-correlation-id: 8d843cfc-81c0-4fca-e06d-08dd703e9f0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S0VWYUtJRnVCOE16UDN5ZUdBbFFKSHlCR3VtYkJwTjFGNVBUTXY1dFpaa2lR?=
 =?utf-8?B?NitnSXgxeStHSExRWHVnQjBGOHVpa1JPWWJ2QXdXT0tKRzFCcXFHek5lczdI?=
 =?utf-8?B?TE1pREVyQlAxTDc1dXJ5REJDaEhQazNNcGNWNERVcWJqc1NWV2syQ3ZMbGhW?=
 =?utf-8?B?VkhIWmUyUFNXYVNWY1V5bDQ2VnQyWWdtZFVGRm9wazlSaXQ3ak81a3ZrZUdq?=
 =?utf-8?B?Vm0ybThNaTJSejE5Y25DNlpzMkNvZjJmSDU2cEZ4NFhjZWpBSFhvTGxOOERW?=
 =?utf-8?B?SkZIUlVYR21wUjVCRWtHZ2lXRml3QnIwbkFQWE94TUFUbjdxaENTbU4raG5N?=
 =?utf-8?B?UHdXa1BSdTJWcHRudlExVVpweGtlZ3dQMi9OQ2NYT3NRYVE2aU4zUXdYWWx3?=
 =?utf-8?B?UEZNbDVKdXhSNHdFLzZSSEJ3Z2w0TWVxenprMTJqVmw2NWdTZGliTkUwMk5x?=
 =?utf-8?B?VVkrY0Q3cDkxaFJNWGhpeEVUa25iOW9TRFc1eWFvSG5Qd0JPYW1GNC9SM1Q2?=
 =?utf-8?B?OWtIZFZ6eGswRVlGTzVxd1RodDY5bWhYdnBWRitOamozU2JTRU8xbldNWW5V?=
 =?utf-8?B?aUR0N0V4UXk1dHJhaGkwSGV1MkErVTFzUU43ZWZIS1lyeDdMS0l0QUpXWmFm?=
 =?utf-8?B?L0UwczFFUUVRZ2w3WGx5NVB5T2FiVHpsbmZEMlM4WVB3Z1dHOEE1Zlhqc21q?=
 =?utf-8?B?dWRMb0l2dUV0bmxDMjRxRWprUE5reXY2bUpKOGI4c211Mkx6Qk1PTE9hK3l2?=
 =?utf-8?B?Z3RPV1VMV3A3WHAzcmRGVkJJODg4M3dHSHpQblRsbUU1ajlvbFFvWlZwZWlp?=
 =?utf-8?B?dlhNVk9QamJFdmF4TFBVREUvLy9rdHkxRjdySzdndVB6YmEzRXd3RzZrOHo4?=
 =?utf-8?B?MlB1dnZDOHhCRXhvVXRQYUVSN2pvenI5TU1rd1FtVHZjR2dOTGgzRG56TGpD?=
 =?utf-8?B?WFBsblhxdWlKcnh1SGdjSEs4NXh1bm9JQ3RJMlhnZGlnQlRBNENhblZpNGxY?=
 =?utf-8?B?U0NkT29ybGZSZGFnbjdack5aZEZwYWtYUk9TL3YrYmVBenB1bnM1dlZvN3ZL?=
 =?utf-8?B?THFkMDRkNitsdVBMb2d5eklxTmpQUHVOdEs0Q3NtdUEzNjRxZjhUdnRUZk15?=
 =?utf-8?B?ZkxwUXNIL0V4SUg3eFRFaUNWVzFSbXJJQjJvWTBRcml2T2l4UGh6QVVwN0pl?=
 =?utf-8?B?eXBEQ2ttRjhwQWRncXAyVlFIcDhsbElqbFR4Um16N1FWWFlNUE5NbG5UaEZD?=
 =?utf-8?B?azM4WXh0c0Q3OSs1MHFpUS9KNXlOd2tvVXhFL2Q5SHRKWFlwbTIyUVRxWlNj?=
 =?utf-8?B?SjFncTZmSzExeGFqdEdrclMwRjJqRUtZY1BaS2psbHJDeDNDVnZOVzgwNVpu?=
 =?utf-8?B?Uk9LMVIrYnRvb0tVUVFKQVYyang5K0FvMjBSQVI0YjQ2em1wL0pmSFVnZ0t2?=
 =?utf-8?B?d0tEbWhybFljQ3JQZ3VXaUdrT3JCRnNIUkFFVjlmZEljcGdJVklQUUd3NXpj?=
 =?utf-8?B?a2tvTjhjT2lFNWo0bE9jeUxTNjh3cHZuaC85VkRHdkJGOFhTK2JISVVsNEph?=
 =?utf-8?B?dUQ1ZDBOeG5lVUJWa2FpZFpYL0liRzFwTGdtWkRucllEbGdKWGo1RmZBb1Yz?=
 =?utf-8?B?bm8wK0tnV0hXaEg2QTdIUkhMcXo5cG1vK1NNS3V5RUwyYzVQOTlVeEllWElO?=
 =?utf-8?B?a1N5QThWTHZnbHBCdlIyaWQzUlY5cXdJUWo1KzNaUEZMZ3VOVjd0aXdaQVN4?=
 =?utf-8?B?eUpvM0RocEM5cnhVSUpYdHNVQ0xrRjRYL2phQlZUWjhYZExtV1JkU2VaT0kv?=
 =?utf-8?B?MEYyZ3FTTWhiZWxwMm8vVXVZR2xqR3dqclU3Y2dQZFNadGxJNjhBangvQXpL?=
 =?utf-8?B?SlN2RHdvTUJNTDRvVWZ0YkxkdVRnbThjQWQvWkxJSVBCZEp2MFphTHFpeDI0?=
 =?utf-8?Q?9+59mzxGQO+GOP+Od65/tn92wj8en+27?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEQ2aUgvM1JORFZDTHBJdVRUSmhmUEk2Tmc5dVVLVWp1RU9uQnZsa1Z3c09h?=
 =?utf-8?B?ZEZJWk52Z3J5R1dHK0o2NmVLcndSQWtFcXhpZGdQQUR3NmFZWUJJWHlUUE1J?=
 =?utf-8?B?ZmJFQlVyTU5aN0Z2bTRIS012Tm42bU9xdUFEWlRpZmNFdWtoRmtwNGozMDE2?=
 =?utf-8?B?a3hweGpvZ3ZGUEVXSnVjVWJobDhPbmthbi94QnkxdStlQXRURHg3dU15U0tS?=
 =?utf-8?B?MGF2dlByMGVRMzBpUkNvRE5mcHViNjYzWWg0eE5YUzVYelNxYW43TEN2MjZo?=
 =?utf-8?B?MWhaZmRGVTRSdCtYc0NsYW1FdWV4VldoSnRGRDZvZHA3RXluNiswb0d5WUd0?=
 =?utf-8?B?cmY4STlUN3lZc252MHQ4ajBtTUloY3hXYVBvbXgwazI1RkQyVFEwWVBKZmh2?=
 =?utf-8?B?SlBseHdzNXkvSjFhM1d6OFFCRU1IN1F3WFZJTDZUaEx4ek1yTVI4ZzNzQlM0?=
 =?utf-8?B?RUtxQVBpazdRYS82MGFpZ3YvK3NwUmgyeW05d1JjQzkwWVdrTGluN3NBQ21X?=
 =?utf-8?B?YlRBWFlSNXN3ajd3cDhNZ09lNWpzclgvSjR0YlowQjJSZXgxZWdlRmhxRzE3?=
 =?utf-8?B?RUJQREh4VGRjNkxCM2NYRklPUEhhNWZUWHJJdXV0TUFESWlFTkxiRTFaTTNC?=
 =?utf-8?B?Z1JBSDFad01FYVArYUNkQklreDMyTGpRR05tT2Q5eDFXbDJnN3VSQjZLK29z?=
 =?utf-8?B?K09NR29QVUp0L3NqcHJ1Z21Ob2F0WHU4aU5CVTUvL3BDQkg2OWZMbmlFZ0pl?=
 =?utf-8?B?cllvNkhtZjhMUmgvRUxReWNDUDhhTi9pYzlNZjR4UFNjQkp1a0tzQWNKQ2xX?=
 =?utf-8?B?QURUUGJMVU5QTVVVMTVjYXRCMnRmdnU4QkRFTk5aQnZMUnNpbWtnTVd5a3hj?=
 =?utf-8?B?VWJnNTFyN3JRZGFXOExPSEttM244VDJSVjN1SVV2TWpkNHpjMjZQTTc3dVhJ?=
 =?utf-8?B?cUpRYlJWQmZ3Tll5V3I1LzJVNkRsV1M3bUt4WGNtRWE2SEx2R1N4T2l2S3Qr?=
 =?utf-8?B?SDVUK2tmVHdNZC9hVmpCZnMwUE9JZ21seHJnTTdMNU96Q0dqZllGcjJtbXB0?=
 =?utf-8?B?WkJZMWJ0cHJTNllJVGlLd04yeWQ5YStPV21kQWFwMjJsclBNc2lqNVI4Tkh5?=
 =?utf-8?B?UUNBalg3L0Nwbk5oL2Npb1MraFVvUmpTbVgySjIxTjFBMEFSSHdvMEcrdWgw?=
 =?utf-8?B?Snh4bDlFWXcyNjFyM0ZQOWlpY3BmNGNJLzlXN2N0S1NOU0tPUFVZY09qTkxO?=
 =?utf-8?B?NFVCM2FhdEh6akVRaUc2Q056UURnSnRrNVF4bHJlR25aOUNSWTJNeTlOSDNF?=
 =?utf-8?B?TDMwdFJNcGljbGYwOFo3Q1QwSWxDdTFKMXQrRkVHbERyNWhPYndlK2dkcDdv?=
 =?utf-8?B?T3RkVFpGa29Xak1xN0pxclcvNWYyWWJIaFNzdDMvaktnSE1hUmpDR1BwSkRF?=
 =?utf-8?B?SU9YNTBsWUhscWJoK200Um5EbDI0ZTFEM1hTaHJ1a0NnMHhoMEkxWmNmRTBy?=
 =?utf-8?B?dEdOaG8vcGpVdndmVFNhangzaFdUOUFlRWh2ejI3bFg0ZjJ0WnJINmtOVndz?=
 =?utf-8?B?UnpXVUU3UTZQY1ptdVJJN3FQbkVxNjZqS3JxUVBRZGx6YlJzMVkyTU9BbVpy?=
 =?utf-8?B?Y05ISjE0dStKeC9rL0NpUXpMN3h2VmJraEJMeUtaM3FOdGhkckRKdnRKZzdq?=
 =?utf-8?B?R3lPeVA1NlAwM3dyaFZzSG9Tbi92WEFDUzFYMUEzYTBQUUwvRU8zSW9BV2VH?=
 =?utf-8?B?bERoV3Fqd1YrY21TMDZsaW9qUGRhaDhaQncwR29LN0FSazJ5RjhYY1R3MEl2?=
 =?utf-8?B?NjUwVzZmZ2d0enlZZkhtL1UxSjVnRUxnQVdkUWQ0TzJUd3JBcjZ4enhjMEI1?=
 =?utf-8?B?Vk9qRVI3TlBPSlhIZzlJUFBPYzVMWjdpdk9PVVRXUURWOXBjeGVDY3lpR3Za?=
 =?utf-8?B?Qk40NGVSbHZXNUVqSnlQVkhxeG4ycDdWK1NJZGxQb09VUmVOL1lKSCtteXVV?=
 =?utf-8?B?NGk2UXV4aXIwS2dkbmFvN1dzZ0JJSXJ6dGMwdTVFc3p5UDlKeHlhdFBmM054?=
 =?utf-8?B?YlppWUs2aTl4VUZ6Qk5qVTdEV2tZN3ltNldDQjNURnlFMzJkNStQRWV3OEtz?=
 =?utf-8?B?UzFvWXhUNHlzdis2a0xaZXRRUS9vczRwUFh5dkg1YVo3b3NTT0hoZldTeEow?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <457BD4C845E3314FBA7D532DDB0D0E1F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d843cfc-81c0-4fca-e06d-08dd703e9f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 10:27:21.4812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbAZBDY2t+JKGV3OFX4d2SluRrWT1oPZaaKGkERiiPjO2/zm9sjHwK7rcynm5etOP74agz5qZmmc6iF8bhsKEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6927

T24gMjQuMDEuMjQgMjI6MjUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE0LzAxLzIwMjQg
MTA6MDEgYW0sIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2lu
Y2x1ZGUveGVuZGV2aWNlbW9kZWwuaCBiL3Rvb2xzL2luY2x1ZGUveGVuZGV2aWNlbW9kZWwuaA0K
Pj4gaW5kZXggNzk3ZTBjNmIyOS4uNDgzM2U1NWJjZSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2lu
Y2x1ZGUveGVuZGV2aWNlbW9kZWwuaA0KPj4gKysrIGIvdG9vbHMvaW5jbHVkZS94ZW5kZXZpY2Vt
b2RlbC5oDQo+PiBAQCAtMjM2LDYgKzIzNiwyMCBAQCBpbnQgeGVuZGV2aWNlbW9kZWxfaW5qZWN0
X21zaSgNCj4+ICAgICAgIHhlbmRldmljZW1vZGVsX2hhbmRsZSAqZG1vZCwgZG9taWRfdCBkb21p
ZCwgdWludDY0X3QgbXNpX2FkZHIsDQo+PiAgICAgICB1aW50MzJfdCBtc2lfZGF0YSk7DQo+PiAg
IA0KPj4gKyAqIEBwYXJtIHNvdXJjZV9pZCB0aGUgUENJIFNCREYgb2YgdGhlIHNvdXJjZSBkZXZp
Y2UNCj4+ICsgKiBAcGFybSBtc2lfZGF0YSB0aGUgTVNJIGRhdGENCj4+ICsgKiBAcmV0dXJuIDAg
b24gc3VjY2VzcywgLTEgb24gZmFpbHVyZS4NCj4+ICsqLw0KPj4gK2ludCB4ZW5kZXZpY2Vtb2Rl
bF9pbmplY3RfbXNpMigNCj4+ICsgICAgeGVuZGV2aWNlbW9kZWxfaGFuZGxlICpkbW9kLCBkb21p
ZF90IGRvbWlkLCB1aW50NjRfdCBtc2lfYWRkciwgdWludDMyX3Qgc291cmNlX2lkLA0KPj4gKyAg
ICB1aW50MzJfdCBtc2lfZGF0YSwgdW5zaWduZWQgaW50IHNvdXJjZV9pZF92YWxpZCk7DQo+IA0K
PiBUaGUgU291cmNlIElEIGlzIGFsd2F5cyB2YWxpZCB3aGVuIG1ha2luZyB0aGlzIGNhbGwuICBJ
dCBpcyBvbmx5IHdpdGhpbg0KPiB0aGUgaHlwZXJ2aXNvciBpdHNlbGYgdGhhdCB3ZSBtYXkgbmVl
ZCB0byB3b3JyeSBhYm91dCB0aGUgc291cmNlIElEDQo+IGJlaW5nIGludmFsaWQuDQo+IA0KPiBU
aGlzIG1lYW5zIHlvdSBkb24ndCBoYXZlIHRoZSBmbGFncyBmaWVsZCwgYW5kIGFzIGEgY29uc2Vx
dWVuY2UsIHRoZXJlJ3MNCj4gbm8gcGFkZGluZyB0byB3b3JyeSBhYm91dC4NCj4gDQoNCkhpIEFu
ZHJldywNCkkgd2FzIHRoaW5raW5nIHRoYXQgdGhlIHBsYW4gaXMgdG8gZXZlbnR1YWxseSBkZXBy
ZWNhdGUgdGhlIGluamVjdF9tc2kgDQpjYWxsIGFuZCBoYXZlIG9ubHkgdGhlIG5ldyBvbmUgd2l0
aCBkaWZmZXJlbnQgYmVoYXZpb3JzIGRlcGVuZGluZyBvbiANCnNvdXJjZV9pZF92YWxpZCBmbGFn
Lg0KRG8geW91IG1lYW4gd2UgYXJlIGxlYXZpbmcgYm90aCBvZiB0aGVtIGluZGVmaW5pdGVseSBh
bmQgc2hvdWxkIHRyZWF0IA0Kc291cmNlIGlkIGFzIGEgdmFsaWQgb25lIGltcGxpY2l0bHkgZnJv
bSB0aGUgZmFjdCB0aGF0IHRoZSBuZXcgY2FsbCBpcyANCmJlaW5nIGlzc3VlZD8NCg0KLS0gDQpN
eWt5dGE=

