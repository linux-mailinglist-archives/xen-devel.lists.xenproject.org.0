Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKQwGPuzb2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9A4817A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209101.1521217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDRb-0004sh-9Q; Tue, 20 Jan 2026 15:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209101.1521217; Tue, 20 Jan 2026 15:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDRb-0004qY-6m; Tue, 20 Jan 2026 15:14:59 +0000
Received: by outflank-mailman (input) for mailman id 1209101;
 Tue, 20 Jan 2026 15:14:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viDRZ-0004qN-LW
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 15:14:57 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c469c1e3-f612-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 16:14:53 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6419.namprd03.prod.outlook.com (2603:10b6:806:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 15:14:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 15:14:48 +0000
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
X-Inumbo-ID: c469c1e3-f612-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTnmBKNbQjefLXC1NoFMHU3Hi907K8uZVYS7wTMWAXNzO90+ePY1jTgpfhFgfqOBqw4oTRGuHN1lftx5+qEdceKSNCeghuhZRa6EmQY84+1AiVP0aE/eetumMC2PPq1+SO62Tyi/wr67M4/xsVIe7702KVM+W1drTxh9Z2H625Bul6WNm93fDKWkoG7Eii0QnL9uOiVDJzH6R8rAemaBZgnwd8TwQxYUHXmcz0qsZC1fvqWQJdn4Kw8X2Wd6RKVxlo8l7RBcEYi6QznzZWjHKtG69bTwDoDb+yaZzh0hoJVxIdG7+/lV0TjprR4w8Gk5fXvzWf7b8Ff/fSK0o1kJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp9k0SGCJ5kwC7jsQWpBu3yCDk7tRTXusSApoQK+Zg4=;
 b=JgznqKozsHZcI9qrAJ8Y0544J+GAQ7Y3F/P4jGP9zKWyi6aeUfS3cshzygwWIh0XlLLFJtOgF2F0hfn4KnKnKZgzyOwk51OKG3KhDEsA45FTH7dZuTTdwGfHETw/FITRrDeQTfwSLEI7T2a1RmQrIC6yGoMwndu7zc2+n8olUw6U3EWJREkgX9TTSCO9jV9F+FLEpZW6GAlk6audQJsBHL2WCfGK+Dg1cV/I8fWi+VRfL09HvdnY/C9px0iAVa8coVYCb9BpH3e8RkwbcjNfO0kW84B2tTuVeFehg62fkGS0ZBE4nidms4g9Uq0IsUg+dlT23gezScbpcAmLtihcGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lp9k0SGCJ5kwC7jsQWpBu3yCDk7tRTXusSApoQK+Zg4=;
 b=s5a2HkaAzu9jioV2GNut6MyNI2hmtg1LVYgJasviM1CvLSoLj9aoxNrxKzbgtjrDvuNFhL02ePP1d0pIUVgWxgGfkMR3wqcTh11CKzjLjMPl5qvLSR5/+gmaw7X2Mf17idibWc6BSLkzdqIsBa8TGhh/rO7vJBW1RW4fpx662uU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d07d6040-cc6b-4634-b4ac-041bb903d6fa@citrix.com>
Date: Tue, 20 Jan 2026 15:14:44 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v4 4/5] docs/misra: Remove earlycpio.c from the Eclair
 exclusion list.
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jbeulich <jbeulich@suse.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
 <1d374226e3f91ab3bbc05c3354c8f8fe@bugseng.com>
 <DFTDPKJN6EHE.3LH3Z9WEO0AGW@amd.com>
 <bd95ae24c9b9767467938dcd42a93a6d@bugseng.com>
 <DFTE7R78R78U.2T09MMJU7F0CF@amd.com> <DFTELY2QHKPN.P7317UWE8QZR@amd.com>
 <0a6eca6eb344e9829ed9e0b381f26e95@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0a6eca6eb344e9829ed9e0b381f26e95@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0479.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9e5914-70f7-44ba-de0d-08de5836a6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGUvL2NJbUcvNlRvY1JWTThEV1N6Qzl6SnJmSlBOMm1HdTRyWnBBa1U2dS95?=
 =?utf-8?B?a0N2UTNjOU9TazFsVnExbndqdHRlTG9Sb2tWNzVKQVo0R3VWVUc4NXNvdW1x?=
 =?utf-8?B?dHM1RXI5Yk11RFJxOEtYTXk2ZHUvUnUzc3A1cWI1MGprV1J6OFZ4Z2lIYmh3?=
 =?utf-8?B?eS9RRmRaS254REtSZUxVcW9vYW9iU3F0SmFJdm9Zb2RkVzlPb0xvWHFHYkN6?=
 =?utf-8?B?M1ZmaWZDTjJZRzBKK3p3bkp2dnFPektKcC92NkU3S1Q4aGZzczFzcjlpbC9H?=
 =?utf-8?B?VkVDbENXcUVsOGRJcWd1TUNqWnZYOXBxSzhSdFU3azlST2RiR2FEdUorY0hr?=
 =?utf-8?B?YVhvRHFha2pyd3RyUHpkc04wWEV1TUhnREFWZ1lCVkVOUGxFbjlweVQ5VDMy?=
 =?utf-8?B?K00raVNBMXhaMFFXbDVkSjQ2VFlmeWFPcWNJMC9hdEFpVjMxQk9kOUdnTXIw?=
 =?utf-8?B?TytxK2duRFJMTkZybHdGdmFWNmRaSDhtQXJnbDNEZGJYeHFyMWpUTXZqWFVj?=
 =?utf-8?B?c0xuRmxDSFRQVlZMWGpnbThaaC9mblo2ZFlkVEUvWUkyc2Z5bnUxeTBtV2Fr?=
 =?utf-8?B?ZTJmd3dmVTBZWGprbDJVRHYxMCtycFJ0cnZBbjIrZG8ySE9xSXR1MTNRQjls?=
 =?utf-8?B?UExNbU41UUt0a3ZKN2J2YThMZHF6MzdZa2R3b0d3N284OC9zMXRhd21IbERN?=
 =?utf-8?B?dTdua0Q4ZE92bENQZG9VWVNERVR2QlkvcmlsSDhnQXlwWnI3SjN1U014TVRL?=
 =?utf-8?B?SE9iMFREOFBmMm9xUFFOY2FxVTJDOFZ3bS9wQmhZaXlOSmJqRW03SkdnU0Ju?=
 =?utf-8?B?TDdXSHJRMXdXaExzUDN6US9TME94RGpkRm1BK1FGVlR4YTlkbTBGNDFzM2lR?=
 =?utf-8?B?SElkbENTek5FZks4VE1PRHhvbVNwTytZd2xvV2llWEJpTnNFMWptZFZRT0F1?=
 =?utf-8?B?SDdmaTV4MUpxcHRDVkJLWms5QWxwS0orbkIvYlR1S0h4RzhpU2ZmYXJEV3h6?=
 =?utf-8?B?aGJhQkQ3bzNDWVp1OS9XUjJtY0ZxRDg1VEJIVk9MY1ZoUzlxRnRIR3BtYldY?=
 =?utf-8?B?THNBWGRJSFN1N3d0YW5tQ3NGa3IxOUdyS2x0ME1JMzVBMVZEd05SQWU3NWlh?=
 =?utf-8?B?RGxhSHNncXhmNDRyTUZOQ3RzcUF0eXZNRkh1bTZoMm40TUFqcEUxbit6L28r?=
 =?utf-8?B?Q3hWMWszN0ttK3lTbHVNRFloWHJNa0gvZEp4M0RlenBxbGpMaVQyeXhtYk45?=
 =?utf-8?B?UEpDZG8rZytFcGZsUFRwSjRveGhNODlYbVJhZ0pJZ0pmRVhxbkErVW8vTnZE?=
 =?utf-8?B?Zit2NnVwbTNUaG94VEVGQjF4Vzl6SHdNR2ZueVc1U0U3Vm1VVXdIVjBqdFdu?=
 =?utf-8?B?OW9KVzhOQVRDQmd6REFhMS93dzFDQ1l2eDhTTHVHMUtKUllUR1hsTlVQWHVu?=
 =?utf-8?B?MTExajA4MnRPbUtBU0NaZ0tmTDVLd0NSZGVMSzV6dnJOcHFIOXBHeEpZQmUy?=
 =?utf-8?B?UDhDaVd3dDQzK3lqcnM3R1FtYXpXODRZWGs3RlVoZE14b0pEcWRZc2QxRjBh?=
 =?utf-8?B?RHZRQkdaZnFzeDdQS05PYkxKTGhQQitiVktRS0FtL0xPNlhiZE1yUHlnendJ?=
 =?utf-8?B?TitSR3k3TlB5eEhwNDRXNlFMeXZPdUVybkFCUHdpVVU5cytiN0Y3QXlLUDBL?=
 =?utf-8?B?WUZLQ2xmWDNrVzI0REdSNjAzK0l0cUhaOTNOT3U3Ni9HU2dFYUZMUXZkaWdE?=
 =?utf-8?B?c21qWTdsNlFqTU11UC95ckhtY2FRaHVteHR4ZW1vUWtkaXRrUTZNdmI2dTV2?=
 =?utf-8?B?dm5WemwyTnFVVzV3cTE0ZEN1WnNxTlZSVXE1V3BFL0hvNXJvTjZ1NENyNTYr?=
 =?utf-8?B?QXBqb1NVWUI2VnVKRjhwTFd6ZG9nNnIyRklMMk1SRHVCcFBLWkE0YTRZeis2?=
 =?utf-8?B?SnVWQ1FhbGthT3NEQ2VERkxVOG45NTVaN1dEcmhPV3h1VUlrTkkrQUxrVzBZ?=
 =?utf-8?B?MG9pcFZPZHUyZmlwVit3blY4RnI2c0twWU1zRktLL1JHT0hsVFhkNnFIQlFU?=
 =?utf-8?Q?KmGh8F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHRsODZnNis5NzZqL1hCc2FBd0NHbXFBdlJMSHBCeEZzellsWm1IUGRMd3gz?=
 =?utf-8?B?NVprZ0VwMHg0YjdRRHE2dHFOTG52amIyYk04eFlmUWNwYlJDKzlzQkEvNXdh?=
 =?utf-8?B?RitTTmdDTThEMFAzV3JMTEJGYlh6emc3U1Q2elY5czIyNXZGbGpKTmgwd0N2?=
 =?utf-8?B?b2pDd0IyTFBYRjc0cm53THl1Q0hBM3BteVliODJKc2lZL1d4Y1ArNFNSNUZt?=
 =?utf-8?B?VU5NVy90bXNJSGFlQVlDMGpnUjJsTGI2RGVpWDJ3ZFhCbEd3Sm0yN0pVakVY?=
 =?utf-8?B?MktmZW03cTJDcDJnaGVnVTFLcVNoeUNqcWpUcDA1S1FyRDJ5ME15UWRRcCtq?=
 =?utf-8?B?cGl3bHBPc0o2eGJoeGtOSWlwYThTamtiZEdQZG9OSW1NeHRHWmUyb2t1K21u?=
 =?utf-8?B?Sm11Q0lQZ2pUSlgrdFlMZmhyMVI5MzhScEhLdHlKUDFLblVSRDhMblBZVW5o?=
 =?utf-8?B?UjVTbVVObkNjYnZZejE1R29WNUxmUnNQWHZCeGQrOE9tOW9RQXB1RFZnV1Vl?=
 =?utf-8?B?RzZ3ZlRPZkJRQ1IrSDRORDBLTGtZMHYzWXh0bERrUWhPTlF0OElRRHA4cXhM?=
 =?utf-8?B?dFFkdUNkMDFsQlZab09CczY5TjVMeTZIU01TWDZ3dVlzTUhEV2RSUXRxcFlx?=
 =?utf-8?B?am9ZaDcvamVUS0tCc2dyQ0w5REVaRTQzbFd4N3VrQmROaHJRajZUaFovZ0Jv?=
 =?utf-8?B?WWx4WTljV0VaT25qc3UwbGltWG1Tandqd09PMGhuWDVOOE8rV1F1MzNydnlP?=
 =?utf-8?B?ZGhwZllHVmFIZFJ4YzdXMEdXMkFtYjNMa2hPMEg5Qmc4WStKbXR4ditCU2ZL?=
 =?utf-8?B?SlR6RVd4VFg3SElaTDd6cHk1ZTZFK20rQ1FsN2RkaURmM3R5MGt0TXJoUVNG?=
 =?utf-8?B?WlJYb2NDOWRFNFNSL1dNK0VabG1JTlcvRzhxRlkybXhEdFgyZG0rRWJPK2dw?=
 =?utf-8?B?NFFORENQV3pPU3c3dVlUaEk1NjJkMnRkNzhlbnhyYWwrdGlZNWNkSE55M2FP?=
 =?utf-8?B?c09yaHVocnpKNEJPTTJPckFBdGlkUVR3THA3OHJudVpJeUNweEFlaHN6b08z?=
 =?utf-8?B?ak1JcWJ4OHpoWm0wL1dKTVhqNXFGNTJkeGJyYlFJWnR5WGluZzJvMTBNWmtE?=
 =?utf-8?B?REZsdjFJZUJDRU9jSG5hTHRpVXduZGw1ZGFGLzFrYnFXZnMwb3Zhd2FxMzRh?=
 =?utf-8?B?MUVHSUM4Wm8vazZkbEZ1a0RPR0ZqZWpQbVdRSjZiNmVhcW52dTkwWTJGKzdp?=
 =?utf-8?B?SXptVnFaVXFISGJFeFpWYlFoM3d4SG9nWHh2cmJLSTZMNFRxUEVKTUwvMDEv?=
 =?utf-8?B?WGsxT3lZYUQrSHozUzNzM2d3clR1S3d2a21BMEVyNmdhdndJUjZDR0xHelNF?=
 =?utf-8?B?UTJaNEdxdXFCWWJlL3A5dUJCUFZWUGhuMGRKNDhSaEpqRndKT3lDZkRJYU9Q?=
 =?utf-8?B?SHJRZHYxd1hYM1c1c1FNamF1TmR0bFl1UDlVQVY5Qk1TNldMNE5GczBtT0JV?=
 =?utf-8?B?VmtPK1hWNE9VczI4aHhqYWlQMGFFYkx0aityZlBDQkUzcnBlV0E4cndRZmxO?=
 =?utf-8?B?b2RPOWNJZjNoY2FnUTlob3N6VmJkQmZhajVrVWRNOWp3L0hwRE1jSDNTWG1w?=
 =?utf-8?B?NmlZYmVrb3l0dDRlc1ZVZlhpT1VWQkszWTdDY1lDZFZKbGx1ckRrTCtFaUFt?=
 =?utf-8?B?azhQaG9NTDd0bHp2eEJaZDZYd0xmRU5EMVBnWGdldUowWG5KbExiRytucUNS?=
 =?utf-8?B?OXF4SnVMV1NQSUw5QmpaeHd4VnFOUDJ4WnpQZnBpOVJTdE9hRVFNOSsva2Rh?=
 =?utf-8?B?K3BGL1BRcWhOaS90YlozdG1UK0FFS1BJcGJIMEF0akNqdVJueEk3NnJITlhB?=
 =?utf-8?B?TU96b0h3bDE1MGlVVUdyWUJBWkRjZWxSS3JTZFNSdHE1VzVSbkNUK3N0dENj?=
 =?utf-8?B?UUFTVnJOcmh4Q3VPT3lsOGhiVHRmMWZFNE5Kb2NTVUJpNm1BQ1ZFZ3ZaOHRo?=
 =?utf-8?B?Nlp5aXI4K3BFS290MTlDcmtxbEJMVFF3MGh1OUNvNm9PSjRLRGx0c2RMeXNL?=
 =?utf-8?B?Um1ObVlnalFaK1JjdGRQdHRuZDU3aWlFUS9ObU4zdDVwcEw1RGJkdDBSWHBF?=
 =?utf-8?B?OVZ1RFlUY01acGFyZmZzblQ4a1hsTEp4Wkc1TDUvL2RSMlRTQk0vL0U2dXpJ?=
 =?utf-8?B?WEgvcVM4bE80RnNWNTczU0Q5TjJlVXRsUW5EQklIdzFyVVUyS3BsYU5BUHpw?=
 =?utf-8?B?ZlpWRTF5MDhGaTFRZDF2V2JkZ3RXanpNSDIwd0VpcENOYzRlVzRkVHkrSDhD?=
 =?utf-8?B?eVVuclNScHpHWi9pSEtzK2JhbkpncnB2UkoxV1lYeTdHYTkyVGJrbk92ZnlT?=
 =?utf-8?Q?LhadviOqJlTCNYjs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9e5914-70f7-44ba-de0d-08de5836a6a5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:14:48.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZATXbk/Pq1/mUM2xHQAjvxpMHJH+AH70BGs9x47+8+5+kjuyqF+h3aGuxyx1ynigyqHPkUib48j2sxxRodzdGgXQ4jpgeznfv9ftiFyBCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6419
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,xenproject.org:url,citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel-bounces@lists.xenproject.org,m:nicola.vetrini@bugseng.com,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 16D9A4817A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 2:20 pm, Nicola Vetrini wrote:
> On 2026-01-20 13:09, Alejandro Vallejo wrote:
>> On Tue Jan 20, 2026 at 12:51 PM CET, Alejandro Vallejo wrote:
>>> On Tue Jan 20, 2026 at 12:41 PM CET, Nicola Vetrini wrote:
>>>> On 2026-01-20 12:27, Alejandro Vallejo wrote:
>>>>> On Tue Jan 20, 2026 at 12:21 PM CET, Nicola Vetrini wrote:
>>>>>> On 2026-01-20 10:38, Alejandro Vallejo wrote:
>>>>>>> It's clean.
>>>>>>>
>>>>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>>>>> ---
>>>>>>>  docs/misra/exclude-list.json | 4 ----
>>>>>>>  1 file changed, 4 deletions(-)
>>>>>>>
>>>>>>
>>>>>> Hi. Do you have a link to a pipeline?
>>>>>
>>>>> In the cover letter. I only run it on allcode.
>>>>>
>>>>
>>>> I see. I can spot these additional violations from earlycpio.c. It
>>>> does
>>>> not result in a failure, but only because x86_64-allcode has also
>>>> other
>>>> non-clean guidelines and is thus allowed to fail. Ideally in some
>>>> copious free time I'd send a patch to create a subset of clean
>>>> guidelines for the *-allcode analysis that is failing, so that the
>>>> "allow_fail: true" can be removed.
>>>>
>>>> https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/people/agvallejo/xen/ECLAIR_normal/ucode-disable_v4/X86_64/12771570090/PROJECT.ecd;/by_main_file/xen/lib/earlycpio.c.html
>>>>
>>>
>>> The web interface doesn't allow to search?! Sigh... thanks for the
>>> pointer.
>>
>> It's your usual mess of miscasting, enum-as-int, etc.
>>
>> Would you rather keep the exclusion and deal with it later or let it
>> pile up?
>> I just don't have the time to go into it myself.
>>
>
> Well, including more stuff in the scan doesn't hurt and it's only a
> handful of reports that could be fixed, but the maintainers will have
> the final say. This file is not really inside my area as a reviewer,
> but if it helps:
>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>

I'm not seeing anything in that report that's on the clean and blocking
list.  But to double check, I've started

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2274001675

which is this patch in isolation to see if anything shows up in the
*-amd runs.

~Andrew

