Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CBFCF4C0A
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:39:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195640.1513569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnbx-0004F7-TP; Mon, 05 Jan 2026 16:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195640.1513569; Mon, 05 Jan 2026 16:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnbx-0004CX-Qe; Mon, 05 Jan 2026 16:39:17 +0000
Received: by outflank-mailman (input) for mailman id 1195640;
 Mon, 05 Jan 2026 16:39:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtAc=7K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vcnbw-0004CR-SQ
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:39:16 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11d5d516-ea55-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 17:39:15 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV9PR03MB8365.namprd03.prod.outlook.com (2603:10b6:408:368::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:39:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 16:39:11 +0000
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
X-Inumbo-ID: 11d5d516-ea55-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/IHUIuBqFSJ+I9g5kFde+uQmQj+l4aUfzaBZURYHcNbXyFv8RjHEpeIknUrXZG1HMRWODor18Ah3IyZblCGNsWEbBuUQJ2Vs4eR5eH32o19RKOuBo6MDpgTbb+BGCFZykRPQHz0bemj25Zg2xxA3r4sUONbuMt2lbnQ4Or3DczdjynHq8TL0cqD+3zDbEBYgWJHPQHGpmZ49pT2od63ZI5j0V+Mp+9G1v8y/cIlVvFgExYRhRc/QOHbgfUmADGHq4/DIUvsMbK7CjfQUkhFW81bWZQrpUBu9r9s7H9TMbzSK0n3jnrjgaoiuoVjZ9fNzSpnyTJw6/Y0FXrqdaURPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGBMpuiMJb+UJ2De7d9N+iXS6VpGaV00kOHkC/mEeNo=;
 b=o2W1JfHWfnyuw0GLfihzZCm36tIKZUOQwkqGdcFhjhoRWwDVVNr8RIIME/fVedFUftICX9U8z4gNjuqvTcGZ9alox8c3m7x8xex+tL+lT5tH5qGYAvv/kU+kg6kQLdw/TpPNgC05VoUh/maq8vw4YiVeKnWaWxQR5JdDVLGkpTWZUJfao5E1wZp9IUbWjOuFjqqVTaSB0YXMZwjSJLHw5W9yrAz83Kpt5DNh03qY+UzPg7u3ysI0fERdGxgbx2HLTq7jEVeahfB2a1bcBQAC1E+uWFaVQBl+xxvGtAOXs+Wxe3eHg1NEsN2apzlCtZnbxXggaTHb3j3fVSTdf7ybJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGBMpuiMJb+UJ2De7d9N+iXS6VpGaV00kOHkC/mEeNo=;
 b=ZD7SWbXHGjq1IqOHRcZ+py0PPQeEkW2mrzv1Rpgq/k91SQetUHhr+Pta+8ew5y+LbkieDzAvjvQzOjed70SDLo1WU3GG/IMPnlF1OutDyKz/EshRbyMnCr5DsUI/XY82h9bzPIAuh/CywpKk5LY+7hl7hR3RCeLn1drCFDyBcHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <31301264-0655-4cda-a66c-8768269e0c89@citrix.com>
Date: Mon, 5 Jan 2026 16:39:08 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/4] x86/i387: Rework fpu_fxrstor() given a newer
 toolchain baseline
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-4-andrew.cooper3@citrix.com>
 <662888ee-e983-4194-b8ca-f28560881c29@suse.com>
 <37ff7e30cc0715d619a20d7ea6ab72b5@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <37ff7e30cc0715d619a20d7ea6ab72b5@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0167.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV9PR03MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db19400-a324-4a6b-0733-08de4c78f48f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3VCNHR1TEh5d1drNUxnSkc5R3hpR01MNmhGNnF1clhWYmplMU9rWWlLeUpW?=
 =?utf-8?B?ZmZGSTBQZ1BaSCtzdjhPZDFtYjJKUmlISFg3K3JCZnlLVW5vN0JISmJ4Q2x5?=
 =?utf-8?B?Y0pNM3pDb2ptR3dXMTFwblpJSFBSV2FlYnJEUm1tWWY1U2RDOEtSTlB2dkt1?=
 =?utf-8?B?Vm1ULzBaeTZ1aU53b3g0d0xNQVZpcHR6bkRnRFBRbjk3bWRhSXE1NTdudzFO?=
 =?utf-8?B?M1dQZzhxblJXODcyTVV5Z0RDTll3cUc2MjYvclBISzh3VVpuSFRBc09aeEln?=
 =?utf-8?B?a2hnSXk3SXdSTE54Y1FHb2JicTRrOEppUHFFUC9VZllZeFlRaDNyWTVWWGJL?=
 =?utf-8?B?VXpoN2J5VWJ6bVZMZUFDditybzE4d1pNdXN1YjYyaEw1VHFnZzNGWW5OWDVu?=
 =?utf-8?B?bEJDL1F6ME1TVnhuc2YvcHlIM2ZFbmhDWElUWjVpNjJtY3lpd241bVBKZXJX?=
 =?utf-8?B?T3l4aWxSdmVhMzlmemFyWEJINktPOWF1N0hML1h4TU1RSk1hQmxXemlRSmJm?=
 =?utf-8?B?ZklhYUFhVHFEY2kyMk4wRHZTQlhYaEtod2w5NTFwYVE2N1Z0QlBWNldCTC9U?=
 =?utf-8?B?b242aVhsZlRaeVNNN09XeTIvS1RLWjZzd29ESUZDaG1NTnJkeXZ2blROSVVJ?=
 =?utf-8?B?MkdXVXFWR3N3WWR5OTVnK2xzMG9kb2xJQVNRcEVCRFR2Z1RpWlQ5ME9UMnUz?=
 =?utf-8?B?dGNNOXN3Z2JwRk10V1VDYi9rZm9MWFUyRFRrcnBxY1VjelRFd01pYSt4Tndi?=
 =?utf-8?B?TzBPeVVVUitNcEg4QWwwQk1mVi9JMko0NEVVS2FTQk5QNWEzK2kvd0JCUGRF?=
 =?utf-8?B?dXhkcENWYnRXM1FMSDZMUlExdXpZakE5cnF4WWhtMGFlTE44bVYraWVsQzBL?=
 =?utf-8?B?TytOeFdubTJ6MFZoZ1ZtSXpJcnM4RVNsUGJXejlVWU1JNkVTeE5KUWZKemVY?=
 =?utf-8?B?RGRUMkx5eklMZFZLUEpXUks4WHBRT3Z0Sm9GS2Jyb3RRbDIyUDNHMG9TYTA2?=
 =?utf-8?B?NEJmZm5ZTVlJbDh2UlFpcmZ6V25IcmNtZmZMSDVSNGxPWkY5SU9GM1dTTUJs?=
 =?utf-8?B?T0FoajNBa1dEbHB0SDNLTCtLQjhGcVY1em8vSXROYTlSQjY3bUF4ZFREbkxC?=
 =?utf-8?B?Rm1vVExhVWdqQ1NiMUpPVVBmNHN0MEp5NHdjL0ZsZXdOS2swLzdBaWt1SFds?=
 =?utf-8?B?ZGJGdk1tdXBMU1UzaTNSUnpIVmZzRjNvczZMeUNDM2tWN2pXcUgzR04vdjFW?=
 =?utf-8?B?d0xWbitJWEtxemhsSFhETnpDbHJQQlUvV0NGNHJaM3dHNjR4WnkwNTlKQlRu?=
 =?utf-8?B?bWJac0FrcWx4WmUrQ09jbi8vaTdMZHdna2hJMWg0MDQ4MExFUnBYRE15bG9i?=
 =?utf-8?B?NzMrRVkzQkJlelN5ZzIvNnRBbzFyRkdRQU9WYk9qYld2ZjAzUWZwNThBZS9z?=
 =?utf-8?B?YmFUWGVGaWVZR1daUWd1Q25vREJhUjh0WkNSYW9EWGNPTU1jNWJsK1ZMMFlY?=
 =?utf-8?B?azkyNkt1UjJwNGlaU0ZOOFplYmRRcFJIRmlBZ0xkK3U2TlJKS0pqcmtUaGV2?=
 =?utf-8?B?eFFBdWt6VW1NU2s0WGMyeEZrSHNuNXRpOGVwc1l3T1hzaDJqNjAzcmY0WVMy?=
 =?utf-8?B?NDBJTDc1UTJCRWJJbEhIblZCbUZUZzhMVWVOL0wzajN1M2NnK2dJSVZUcFVF?=
 =?utf-8?B?dm9PblU5aFVFbkJ3MzEvY3J0eHZxbzJLYmhLZjdta1dRSGRkck8wQkpXS0lp?=
 =?utf-8?B?ZjRYelEzNGF5cmc0SG42Vi9uc2dYNTUxQ1FlMEY4L0lrTnB4VGNGbGNNMXZy?=
 =?utf-8?B?d0xsNG1OM0NDeWNCSUdKa3lBMHkrTE5mOU16ZS9hbnZUdFZQeUx3S2ZKRTVh?=
 =?utf-8?B?cloydHZaUldMU2NYNkFxVG5sVUNENmRCZ1FnR2hDa09qVkh2bVlxNVpaTVFs?=
 =?utf-8?Q?HoFzCU3Itqzcgm9I2hu/u0Mi2UZ9qJCR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WStZTzhzU1c4NzNJMU5OajhZUVZkRncyVkpsdVd3dUREYzBwa0RNOGtMZ0ha?=
 =?utf-8?B?MFFNbGJOVC9wbW5ON0RTaE9Ca1p2d0JVa2YySTk3a01jTG1NR29jMjFNS3VB?=
 =?utf-8?B?S3lrcWQ5eDNwVDJzNWdPb0lVRjdxalR2ZVV4cG1Cd2lEbkZMRGwvZ0lxZjFX?=
 =?utf-8?B?STFTT2RwQUVSYVRvTExUVXhoS01ZSnBiWDE4WWdvKzcwUXozeWJJemZqRUpp?=
 =?utf-8?B?YVRjVE5ZTWl4ZmtnZHg5NXpnK09sRTJIaEF5UlhyMzBjRDBnM1QwQ2JTUE5N?=
 =?utf-8?B?OGtpUGxxYW1tUUd3QVJjcXlmNlFiRkxoZHBYTk16Q0pUUXkvRjdUMlErNjI0?=
 =?utf-8?B?VU53dHJXZjcvTWV1MGZPQ0dOaWlqeldZL2Nabnk5K3U5ck14eE9kcnAyc0pr?=
 =?utf-8?B?c0FZUk1WeVBEL0ZsaHJBcjhTdzRCKzJFVUdpU1dUS1JSeGR6VE1MdzQwc2VG?=
 =?utf-8?B?aEd0cUYvdFI0cks3c3luWDhhZHBqNUVTcUJETTVsOWtPMEt0dmRJM2pEYlBB?=
 =?utf-8?B?NU9tdVBPalkxbExzam40VDZ6MGViWVFtcFJjMGh0ZW56d0UxT09vSGpMQTRl?=
 =?utf-8?B?UWpJVlJkQ002cW5PZmhOTnJqcVVTU3EyUW5NSTZYNCtFVEVYaEw5RWIvN0p6?=
 =?utf-8?B?UlNGaW9aRUZiZjNlSlBhcE9MWTVGcXNYTlBCN1ljZnVnQWpzOWFGOW56NDI0?=
 =?utf-8?B?akFZR2RmOHFBeDc4K29vYlBTK2VEME1tSXVOL2Q4bGVMSlBwVVJmVm5DbzJ0?=
 =?utf-8?B?Vi9CeDQzRmI5WlFiVXB0a1k2eFBCL1JtU1doS0wwRDV2Q2JXaHR2ZVhCc1Qz?=
 =?utf-8?B?S0NjeXlSTUdBeG14UnpOWjBxZ2ZCYjJKNDFwWHIrNlpzTnNYc2tGcUM2SUdX?=
 =?utf-8?B?NmJtSk5GSkM5UHB0UnRqN0luNGdqeHJJamFDMW41YXZQNXV1cmxMU0lmb3dx?=
 =?utf-8?B?TEpEUmNOZjU5cWwzUkZPcmRaWGt3VWlIUW1GV2JOZThiVGpleThjSlhrYTJx?=
 =?utf-8?B?S3dwOElZa1VUNzViK3d0SDU5clo3MXZNd0FlanlmUGc3SVRqZWxZNzMyWmxJ?=
 =?utf-8?B?SFRkdmNYdFA4YUZmc1hsbFcwc1FneVVYTzBYdlBiSVFLcmtUWTNTMklaUVo4?=
 =?utf-8?B?b0pMbkhQZEJPamFpZFZMSklxK3NpWkVJaG9xcVEyYTRYRmpUa0toaWNnak9S?=
 =?utf-8?B?enNQYk9EUGdZUVNiMW5laVVISGpPMHM1ZUhTcEpQY0x0WlFDZGI5c2FFZVpU?=
 =?utf-8?B?ekZSMEZZWUJzNzk0V1kwNXFNQnF2UlhDTW04cHJZbU41eW5DTDdxNnowN09W?=
 =?utf-8?B?QjVCNitSWFJYVG5iUDV1Qmw3dW8vcTdldW1LZXRGcEJZWDMvWHkydlh2V0o1?=
 =?utf-8?B?WWp0NVRRRStPRmkzeTAzd2UzSWlONEJ1T1JzbDlzRndDaTd4dTRzQ1YreVVU?=
 =?utf-8?B?dCs5Q0tXUnZCQzdERHV4L1ZPazU1NlJRUThGYUtrUHhPeG80UW4vU243a0pU?=
 =?utf-8?B?WUtWVzNzRmRTeldjSlB1MHNET1dQUXVLQ3g4UkRwcFdib2tjTmI0T2Q3SVBi?=
 =?utf-8?B?ZVA3bWFWT2NkaE9vci83NWV1YVVTNXA3STIycUhidm1aMUZ1WUh6SmZScHZE?=
 =?utf-8?B?aUNZLzI0KzVwZlBac3hyR29LU3pUd0xva2xaVURpS2lEaTZ0Wmg1M3NuRmlB?=
 =?utf-8?B?Q0U4d3FlVVEvZnIydEJ2ei8yUDB3OUtyVjhxb0lKeUs1UDU1YTZ4d1MwbGVL?=
 =?utf-8?B?YmlMQTY5UnNmSVJkcVJtMVVuSnMzczRXcjJNRnBzdkxIaExYa3NHaGluRjdM?=
 =?utf-8?B?ZGwzdTI2cXNMbHd5WDYvWWVuZzV3SmNVYTFCdFZxNzlXSnNDOXlSdG45S2hL?=
 =?utf-8?B?ZDEzVWdNcGdKVW5pRXVVL01NenNlbnVzWW9PcnNZZjRxYjBhZzdPcGR6SG1C?=
 =?utf-8?B?VVlVRjNVVmtucFlEdW9mMncvTnN0U0RwUTZzR3FXNlZUa2trRmFUT1VoQU9I?=
 =?utf-8?B?NUUycG9DUWxMT0ZENXE0aVFKcGYrdDJta2RId3hMdlpWMngxUE1LSEpZMlZE?=
 =?utf-8?B?Y3RaS0g3UElVWU94bGdJdldIaWpRZ1l5cE5iVmpPNGNSNGlOU2dBMGdJZ3Vk?=
 =?utf-8?B?em50ZW4vSVg4QW1Hc1A0ZjJCUmUwZDNESHNHWmNFQ0tGcTZJR081cnduY3N6?=
 =?utf-8?B?cE5mMnBCUHpGSlZWOFNOZHNqSkFZd2VnWVZNMDlRaEMzOFdLMkRkYldRZUMz?=
 =?utf-8?B?bEVmN0dtbVZ1UUVOUFBDSG83ODNNQkZvWmlYODdPUkVHM2FaL2RRMzR6M1FQ?=
 =?utf-8?B?VkZKKzNSMk5uRG05YTFlcGJKMjA0RnF2NWFROXdjV1Z1MkNrZWZITFIyamtX?=
 =?utf-8?Q?nqfCIqdgHCC5p9K4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db19400-a324-4a6b-0733-08de4c78f48f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:39:11.7078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Um/r2RoU7oQaE0QzOeSBlcuPkk5qBWDVDRmAzVPtj6JGat5ycVdALYXiJk+vV+9X5Hdrhiu/2km3m118ETbXzWPHK0nHtdJSwPLMJ/vdULQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8365

On 05/01/2026 4:13 pm, Nicola Vetrini wrote:
> On 2026-01-05 16:52, Jan Beulich wrote:
>> On 30.12.2025 14:54, Andrew Cooper wrote:
>>> Use asm goto rather than hiding a memset() in the fixup section. 
>>> With the
>>> compiler now able to see the write into fpu_ctxt (as opposed to the asm
>>> constraint erroneously stating it as input-only), it validly objects
>>> to the
>>> pointer being const.
>>>
>>> While FXRSTOR oughtn't to fault on an all-zeros input, avoid a risk
>>> of an
>>> infinite loop entirely by using a fixup scheme similar to xrstor(), and
>>> crashing the domain if we run out options.
>>
>> Question being - does ...
>>
>>> --- a/xen/arch/x86/i387.c
>>> +++ b/xen/arch/x86/i387.c
>>> @@ -38,7 +38,8 @@ static inline void fpu_xrstor(struct vcpu *v,
>>> uint64_t mask)
>>>  /* Restore x87 FPU, MMX, SSE and SSE2 state */
>>>  static inline void fpu_fxrstor(struct vcpu *v)
>>>  {
>>> -    const fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
>>> +    fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
>>> +    unsigned int faults = 0;
>>>
>>>      /*
>>>       * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
>>> @@ -59,49 +60,41 @@ static inline void fpu_fxrstor(struct vcpu *v)
>>>       * possibility, which may occur if the block was passed to us
>>> by control
>>>       * tools or through VCPUOP_initialise, by silently clearing the
>>> block.
>>>       */
>>> + retry:
>>>      switch ( __builtin_expect(fpu_ctxt->x[FPU_WORD_SIZE_OFFSET], 8) )
>>>      {
>>>      default:
>>> -        asm_inline volatile (
>>> +        asm_inline volatile goto (
>>>              "1: fxrstorq %0\n"
>>> -            ".section .fixup,\"ax\"   \n"
>>> -            "2: push %%"__OP"ax       \n"
>>> -            "   push %%"__OP"cx       \n"
>>> -            "   push %%"__OP"di       \n"
>>> -            "   lea  %0,%%"__OP"di    \n"
>>> -            "   mov  %1,%%ecx         \n"
>>> -            "   xor  %%eax,%%eax      \n"
>>> -            "   rep ; stosl           \n"
>>> -            "   pop  %%"__OP"di       \n"
>>> -            "   pop  %%"__OP"cx       \n"
>>> -            "   pop  %%"__OP"ax       \n"
>>> -            "   jmp  1b               \n"
>>> -            ".previous                \n"
>>> -            _ASM_EXTABLE(1b, 2b)
>>> -            :
>>> -            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
>>> +            _ASM_EXTABLE(1b, %l[fault])
>>> +            :: "m" (*fpu_ctxt)
>>> +            :: fault );
>>>          break;
>>> +
>>>      case 4: case 2:
>>> -        asm_inline volatile (
>>> -            "1: fxrstor %0         \n"
>>> -            ".section .fixup,\"ax\"\n"
>>> -            "2: push %%"__OP"ax    \n"
>>> -            "   push %%"__OP"cx    \n"
>>> -            "   push %%"__OP"di    \n"
>>> -            "   lea  %0,%%"__OP"di \n"
>>> -            "   mov  %1,%%ecx      \n"
>>> -            "   xor  %%eax,%%eax   \n"
>>> -            "   rep ; stosl        \n"
>>> -            "   pop  %%"__OP"di    \n"
>>> -            "   pop  %%"__OP"cx    \n"
>>> -            "   pop  %%"__OP"ax    \n"
>>> -            "   jmp  1b            \n"
>>> -            ".previous             \n"
>>> -            _ASM_EXTABLE(1b, 2b)
>>> -            :
>>> -            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
>>> +        asm_inline volatile goto (
>>> +            "1: fxrstor %0\n"
>>> +            _ASM_EXTABLE(1b, %l[fault])
>>> +            :: "m" (*fpu_ctxt)
>>> +            :: fault );
>>>          break;
>>>      }
>>> +
>>> +    return;
>>> +
>>> + fault:
>>> +    faults++;
>>> +
>>> +    switch ( faults )
>>> +    {
>>> +    case 1: /* Stage 1: Reset all state. */
>>> +        memset(fpu_ctxt, 0, sizeof(*fpu_ctxt));
>>> +        goto retry;
>>> +
>>> +    default: /* Stage 2: Nothing else to do. */
>>> +        domain_crash(v->domain, "Uncorrectable FXRSTOR fault\n");
>>> +        return;
>>
>> ... this then count as unreachable and/or dead code in Misra's terms?
>> Nicola?
>> Sure, Eclair wouldn't be able to spot it, but that's no excuse imo.
>>
>> Jan
>
> Right now, probably not, but even if it did, an ASSERT_UNREACHABLE can
> be added in the default branch to deal with that.

It's fully reachable.

FXRSTOR can fault multiple times, and can fault for reasons unrelated to
the contents of the buffer.  Fault recovery isn't even limited to only
#GP[0] only, and FXRSTOR can suffer #AC from a misaligned pointer.

If Xen is operating properly, it oughtn't to fault more than once, but
right now the logic will livelock rather than terminate.

Further fixes being discussed (better auditing of toolstack-provided
buffers) should cause it never to fault for buffer-contents reasons, at
which point I'll be removing the retry aspect and escalating to
domain_crash() unconditionally.

~Andrew

