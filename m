Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69FCD195E8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 15:17:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201772.1517349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffDM-00005G-DC; Tue, 13 Jan 2026 14:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201772.1517349; Tue, 13 Jan 2026 14:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffDM-0008Uq-AS; Tue, 13 Jan 2026 14:17:44 +0000
Received: by outflank-mailman (input) for mailman id 1201772;
 Tue, 13 Jan 2026 14:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vffDL-0008Uk-7u
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 14:17:43 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e8dbb36-f08a-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 15:17:40 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6865.namprd03.prod.outlook.com (2603:10b6:303:1b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:17:36 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:17:34 +0000
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
X-Inumbo-ID: 9e8dbb36-f08a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbUcC+3Aygqb9EmFy6w1uwPsnq/vTRE0nliwTxMmrNrrACECXyGhBZ4yRgdxkscnGMQl1xaPZS7DKYjk02ao7MCTaGUfNx6bfoFbpVKIBCyyhkpSR1lsj89C+JbAmDSPL8c6ZSHj4CvL65uopOjG9W7hKKgc4ehZINnsQLWz4CBULCSB3kzg4KJwjvUHHcCQ9BEeehRyQOi1rTPo4yrOGwXme8lPbgApArN1M1JoCDYIavGFGj5Gi3FJpcewYOK8dU8pJ4NTqBQKa4iBLhLbR+0Vx0v25IuaneNgLKj0oDDtb4XQZ+o/7WQWUR+bjA2LR+cOFERF/D8s5HhlGvLT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58bMqXgpPTnxmQ/kqdDpy8DKpQ6x+tmiCu3NwDspKi4=;
 b=Glsaxbch5cvjwV6eKLlN8k1F+zLnxquljOzlxzxRtnltAqgZsos2nzJXSfSqm2+UcBmgde2KUK5GO/jqs3snxJ+CI4mr8oEbnJAaqAL8I2nFEPbugNtksTMjBqgamLxJ1FTUmcGwTBri2foRusGgIXvIzM2JpYzWfUs+kkSNwEF0+w+qtq/XbW6mr4jCQjOqSgGGUzGhuIaFFbhSaWJqI7Xs0vFaQ+cNWcQhcgPfmdOmqRsfsp/Z97Ax6jr8p1R9rc1snJ6LnucGCtrk52ZmslYR6io2Do5wQPM8H+LunFwNizOHIOL6hWK8R7Gz69OD8vqY+tmLgjUq/RjszKi2bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58bMqXgpPTnxmQ/kqdDpy8DKpQ6x+tmiCu3NwDspKi4=;
 b=aFqhScK9VzL3jGBN3m+bIkjpsuhXlfodWx8uGCElj7/l7p1Svd41VTMuIEs05oDiQjlqkMZ8eVsrFi43gf3A0AGyIYVmbKxIxmqEtJhQd4CkQzFyNyNl0os6fsfldFLFvviH3M+G62G3sTBgdlsSArQnp4GnYbDuRoQwgEhx7Ag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Jan 2026 15:17:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86: Use 32-bit counter for TLB clock on debug builds
Message-ID: <aWZT-fGptBd58cAD@Mac.lan>
References: <20260113120959.55156-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113120959.55156-1-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: PA7P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e43476b-f854-40be-8dab-08de52ae7ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1pibFdxN0ZVSEVvRjlwUTFUTXJtQWl1RDRLczlDR2JNYmNCVFV0K3Y4Y3hB?=
 =?utf-8?B?Y2lWMytMZURmemRFTytFaFl4OHhOejJVL09LWEh2M21kdStEUlE5OENzVU1n?=
 =?utf-8?B?dko2S1lTY0tFZitrNFpKOUJLZDZNemZhSGY2QTVJYjRGbFpUQWNtUTJGTVJy?=
 =?utf-8?B?ZU93N3pJTkx4ZVBXNmM0bVlyWXVNUmVTM21mS0Uwc1V4WkZlZWhadHNwYWZh?=
 =?utf-8?B?Tk1jNW1vSTQ1eFYzMVo0Rlc1K3FVb25XVG5nV2ZVYmZoOFBkQWVIWDZXTVo1?=
 =?utf-8?B?NWhRb3BXMWZQSjgvVUpTTXB3QVJUVklCQWkwdWF6aXNoMXlQamxLYUxqQkNq?=
 =?utf-8?B?WitDU2Fac3h1cm5hSUwrdUZoQTd6TFAvV1lNR2o0VERaSzVxZ3E2TTNhQi9F?=
 =?utf-8?B?aEZwSHFmZ3E5VmtqSTNtL2U3Sld3eXhlZ2x3NVB3UFZVVnptWkExcVdVVmpp?=
 =?utf-8?B?UytaVWNPeHNxNXBTd0VnK1FxSFNQWTNRd0N1T1luWXNKeXVxY0pOWERmSHZX?=
 =?utf-8?B?U2t1bGY3T1NDTitXemRTNFNORkp2MGUrUUFjWGhTS2RQaFlaYW1pMFpFK0xU?=
 =?utf-8?B?eWFXblMzZXYySUp2WWxMOHVSdUZXZm13OENENWVwbHNFYXVaSXhvN3c2b2dp?=
 =?utf-8?B?SFRHRlpkaGk0N3lZRTF6WjVBWDJxY0RJNE1NNkNoVTJJcVh1TmJSNWVYZTZq?=
 =?utf-8?B?bG9WS1U1ckY2VHhtREo2dS91NnhCQllMbDhxOTRKTTlxK3lBMHBrM2pzZUZR?=
 =?utf-8?B?Z0tBVEZrZXhoTGxiZEV0ZFNJQjNLUGtja1pkYmE0cDNocVpLZzhLSU9YQkwv?=
 =?utf-8?B?NmFDVnBmSnhOYW9rdkUzbXBkYlkzcS9kM1hnZHh0Y0QySnkxcDM5SHJoNlR1?=
 =?utf-8?B?MVB6VURwSlJPR0FaNmpYbmFLU3ZYeEUvRHN5OHFjUDN5dEhVT1JReEpRdEQ2?=
 =?utf-8?B?QUJta0tPK1JRZ3duMFU0NWlwQ0xPNnpDczhiQkQ2UnhjLzZ5MWR1djVnVVo2?=
 =?utf-8?B?Mk9UeWdwTTdxa2VqRGR3NHFTYm9SRGwxQ3drcEZLUE9KeFJleUdKeGdLVmt4?=
 =?utf-8?B?dEU4djFDcEtLOS84cWgyZnVoazlPU1NWL0ltc1Y2aUo4MmN0ejFpZ2ZSUVJC?=
 =?utf-8?B?RmovZnRyeVhYb3dhaFIzbHBnaThLM2Jyamd6OXg5QlZnbWJvK2NucFdVbkQ2?=
 =?utf-8?B?TXFub1BkUWlMV3J4Y3ViNFFLMVhWazE4TVBlSm9WeGN1ek9VMmREMWtUVDRa?=
 =?utf-8?B?MTBUN09XYitKSTdrMElHSDFRbXVrTnFsQkI5SlQvV2FDcTZoYW1pM1ZFWWVR?=
 =?utf-8?B?TDRkbkdFZmdtZ0Z4eHlWdkh0QjVaT2x2dUhCQ1JIQlpyOUlKV0MrbGVXNjZQ?=
 =?utf-8?B?UmRPWHpRd1IzZzlHZlhtY0tyNm9UUDVJYzgzV1ozZDlmM1g2QXZrMUFSY05M?=
 =?utf-8?B?Z0RIQXlXRGg2M1lXY3VYaE9BYW53RVpRT1NGcnlOWHpDbmRvN0JSdGFXaW1I?=
 =?utf-8?B?SmJHR1JSUzdwQzlUQTc5VFRiYS83bm14SFZQNm9ZNkY0LzBpdHpBYzZ3b1cx?=
 =?utf-8?B?MlZsSnNENjNJWWZUZlM3dGk1ZWZENm1oRTU3ZkljZmxJYllrYU5ORUY5bmpu?=
 =?utf-8?B?L0F0Z3M0bUpvUGRqZHFGY0c4dlgxVE45ZFFoVVMxclVNMk5MMUlDN2M5Tncv?=
 =?utf-8?B?RjNlUHhrTW83UVBQVkFmRmdZTmhkUmR0eS9zMDUvZUdaTklnbHdSczhOYzhl?=
 =?utf-8?B?aEV1K1ltb2dDdklIeUJ5VWZNeGt5ZWhCMTFsdmxweUhIaDMyeVZ1d2V4dEkx?=
 =?utf-8?B?THJkMzVhVUlhQzY2UFJQZ3cyelRhbmtnTCtFelJKSWM4MlhNM2gyYUhWOVVl?=
 =?utf-8?B?cmg0MEprK0tkbGRTTmJtNUhoQVd1SFd1V3pJWUgvMmJkRXFodXpSZzFCV1Zn?=
 =?utf-8?Q?D8kTmK8yAdFhPRoD21fBvxFDPz85v7i2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGlhNVRDTUdaMkk1RStZempNejFMVXBza25GNnRuS0R4Tk1nSE4rdkpYaGZD?=
 =?utf-8?B?OWtvY1p3YjBGS3ZROHcvTnRLL3J4MUZzMFh6L1pHa2x4dE9WaklCaGcyTGEz?=
 =?utf-8?B?OE80VU1iUm5JbHlCYkxNa1dCdGNkMENpMlI2TUQ0eVhXSXJ4VlpDSjc5dStM?=
 =?utf-8?B?aXBBbGNvYWpGWUZVa0hhMklkcTBmQ2d2eTV3NHBKVWw4a0x0QWttUkh1Z3dK?=
 =?utf-8?B?cmFtcURzR0Y5UXdZblRkbzRIcXlnc3dDSU9KSUQ2YWZyTnlaMjJqcHU2bkR6?=
 =?utf-8?B?a1I4N2hOQVhLMGhwT1AxZ29kTXZvM1VpQ0M4OXNnbTVaT2NScThjMElWbUxR?=
 =?utf-8?B?TmM0UjRReVNzUTY0Vm1XQm44SkRTVE14TEtodEVjYmY4NHUrVmVZVGVFS1U5?=
 =?utf-8?B?Ly9sOUpKbG1sT090d0Z5VG1xTUFNd1FGUGU1dE8xSTdYakxuSjdMRVVHSG1z?=
 =?utf-8?B?SjZlbnAvYnQyWVAzRVFSeFRucFAxeXc5eHZ5NGVlbWlQODRzT2thOXU1MEZt?=
 =?utf-8?B?UXpLby8xNXZJWk1RcUMwZlROWm5WZkozR3Z1UWZtTk52SVlpdGs1aWM4WDAy?=
 =?utf-8?B?TVRBajludkQ1OXNVRklibGxnMUNIL2JVOFBGT3ZjMnBiU3N6RlhMMWhleXRv?=
 =?utf-8?B?QTQyTjE4RGpUSWIrZDJ5S3MwU1Z2bnEwcDJVTCtpLzYvVVlIVGxWby9kUWJi?=
 =?utf-8?B?MGp1WFhqbVR3Z2NPVVJ6eDc5MmtQUlRQVjR4SUFuRFd4MThkY0x1ZVZMcXEv?=
 =?utf-8?B?SG1pQUtOSGx1OWtIemVzZEtxL2Y5VWg3blBHZFRmRVBaWElYeVFjTHlmU25W?=
 =?utf-8?B?THJNMGpHZXZNS05SY2psNkxIRitPZ0FBeERENWtZa3BnQ1cwdWh6YWRJOU5n?=
 =?utf-8?B?Q3FZQ3RwWjNtVC9KNUhWazlpVm8xaGNzR2tNZ3A5RURtUkxyWGhlamdSWURI?=
 =?utf-8?B?bXU1VThoWlY1ZEJPdk12VnBYSXpYTktrYnFlbUJ1QkovM2gxNFZZZFdWendF?=
 =?utf-8?B?SG1jSDVxM1VuMGV3cWRuNFZGSTdPVE1CQ0FaRmUrZ2R3R0o1VVJPWGVkMHph?=
 =?utf-8?B?UzJUTEdidmxUeGk1SG93OFlzclZlQTBETm9pOFhaQ3k2VU5Udmlrb2ZxM2lP?=
 =?utf-8?B?Z1U2VHpxZzBtR2FXQ1JjT2lISEFSQlJ4SEJuN2ZqeHRMQjRMVkplUUdkWDRa?=
 =?utf-8?B?MVNIdjNPM0ZsSzAvZlpLMmlIRWZTRlMwZXI3Y2owQmZjWW84blRZcnpCQTEx?=
 =?utf-8?B?ZmxuMUxDTFk1TEErVWk4MFVia3hRRmU5KzVNVXdkMGJUQm16UmNEREphZ2d1?=
 =?utf-8?B?V0s1N2tVNXpqblJQaW1CNWpVS0hnR1FOOW1BS1JRUW13WVd3ZVJmWjBxWXJW?=
 =?utf-8?B?TkRBL3gxblluSmNVL0JJZkQvK2JaN1ZSNFpuNW9LdGNxQkNqby85Z01XS3du?=
 =?utf-8?B?RDBpcy9VMlBFREVUTFZWWkVGTkowcHRlSTIzTXVpR2FQeEVEQmN2bStka1d0?=
 =?utf-8?B?TlVuYjVNWCtreGEvTWJkRGJZem1pSE8zZnF4ZGY1Y1lkbGxnRC9tbzJpZlVx?=
 =?utf-8?B?QXJ2N0hMVHVaY0ladmZVUy9UcWRXV2lKU2VTVzBmejJ0V3JiZFdLREduOVVH?=
 =?utf-8?B?ODZaWTZ6OG9rSm5ndUlvUXVLUkpDMG1UbGtEaDBGdVZEYzlEMFBiblJqenpB?=
 =?utf-8?B?YStNaU5hT1lrTGhJVXlKazVQZnZCdVUxMENJcWlWTnFkYTlISVR0UnFZcmZp?=
 =?utf-8?B?RWd2cnRBc05OTStXS2JyazVyMTRSR0xhVlVLM1JXUHVZY1BtSFNhaVRzU1JK?=
 =?utf-8?B?UG9uMnY3RTRNWWcxaERDRnhHUzN0QWlPczRITk9pQ0VFTUJUVDlhZ1lpejdI?=
 =?utf-8?B?aXpuL2FaMHgzTUpIdnlYVjlZbE91LzlEV3BqU2JqK2s0R1JwVUhqcGpwTkdR?=
 =?utf-8?B?SjJneE4vTnNZaW5jS1FJVDNrUHJ6ZENJUEdkY3hhakZ1NEFkV0pvMWZ3eGRN?=
 =?utf-8?B?cnlpRVRJU25HWkRVVjg2dkFucXdHWkRiNk94eXUwZlZHdXJpcEd0U3NqZVlH?=
 =?utf-8?B?ajh0N05mak9BWGFNNG85QmpzQ2NlRW5WWjFUSllXNkpEeVFYdWNWVHZpSzFJ?=
 =?utf-8?B?Vy8vNG1hRmZPOHZjUXNuemY0NlZuVW15Tm5xRHMrVW80Z21XTTYzMkVDeDdT?=
 =?utf-8?B?QzFFdWxIOFZ6ejdHVWxMQzBsd1pxR1pVZE1wM1RmYS9DUDRORkRWcEVjcmRX?=
 =?utf-8?B?RUYxb3RqWGNUaVlJc09rNHZ6WmdBUnBNSVc4cEdSNFJKbHowZ3NVOTZlWjhF?=
 =?utf-8?B?L1g1UGw5dUM4cFNBS3NmOE5EaTMwY1FTYXF6dzFIUkNRK1gxVXRsQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e43476b-f854-40be-8dab-08de52ae7ecd
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:17:33.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBiApLRnkuP1roafz1Uljy3aGm53r8QMxNTQIsLFM2qwjqFvZH6BQrmm9wcsw+grXqeasRkMSpU2zVos7Y1FZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6865

On Tue, Jan 13, 2026 at 01:09:58PM +0100, Alejandro Vallejo wrote:
> Debug builds traditionally ship with a 10-bit counter for the TLB
> clock. This forces global TLB shootdowns with high frequency, making
> debug builds unsuitable for any form of real time testing.
> 
> Remove this quirk, unifying release and debug under a wide counter.

I wonder if it makes any sense to provide this as a Kconfig tunable,
set to 32bit width for both debug and release builds?

Not sure whether there's a ton of interest in stressing the flushing
however, and by then it's a small hack to adjust the code itself.

Regards, Roger.

