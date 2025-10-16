Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9657BE444D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 17:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144607.1477966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Q0J-0004wR-9o; Thu, 16 Oct 2025 15:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144607.1477966; Thu, 16 Oct 2025 15:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Q0J-0004uy-5V; Thu, 16 Oct 2025 15:34:59 +0000
Received: by outflank-mailman (input) for mailman id 1144607;
 Thu, 16 Oct 2025 15:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIav=4Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9Q0H-0004uc-8s
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 15:34:57 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa5dd3bc-aaa5-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 17:34:56 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB7250.namprd03.prod.outlook.com (2603:10b6:8:115::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 15:34:52 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 15:34:52 +0000
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
X-Inumbo-ID: aa5dd3bc-aaa5-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1jFkXUwX9SSiDT8JCYrqRmJRqMojxqfn5UcilJqjg7lcnlTmCVJYnqDnM1UqgBA8SFKxM4Ze+vbg6ztn0CT4tCjQxP9UeRlNyBDWo6BK+ugny4Bq6jiKlhcIbHrEcGHLwQZCOP7RdSVeCEZjgEJcrGCCXrUKJu+TLkcZngjIYE9pEJLt5SkZDgrkEb3dKPxlxs+OepsMr8W91E9HtbxEtaRfI+t2gR2D20vRhfFE/DZ69koCRLBfCeLvEozL2qasskCtObHpt2qcE2+wAx188fD8zTAOXgb0X2wTMGb/sJdy7TG0uvjsA1+MvEqsD/rsjMKzvIY55dGZfME4RnKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBIssmUWeyJFA0tn3r6qac/otQUUQ4F1dBBzVIiiji8=;
 b=kUNLtVE+vl0ss5Cfg43AH10jNsOJ/HDFJbQ5jfmVWMpZZ/BrCKw5gfU93HPE1hJerAkJWVSdEFfDE4FNdxi9aA6Ug5msLTIi4zzK6rQfLbBjlzNMyRi508omTtRofsfZG7i6lnLE0Olew92AYqL9YvsmqFtSasbg29CHugYa8C/LbLryWaaEaAqxFoA8L/Qla/qG/psI14HsVw607dJzUj++GxnzTVHjTwcCL04guSyCfcujjvSc1bwHhf5UKOQoAGx/gglVG58ZSVIyRytiGO+rMXwW32EhybeWt9c6e/eYfI7Wyam3dhWRBFxcCsfHG6UzIuw5O+NvZW9nhQTOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBIssmUWeyJFA0tn3r6qac/otQUUQ4F1dBBzVIiiji8=;
 b=qjZ7VmoHrZ3XrzC5dyvtnmFDSueICYBMmEtgHCnSFPmeTZ1SgVFWw08fEqSiF2Ac0I4QkwkjsMJz7l+c5Au7XHcxpPVAEvBUtTYOn52tWi1tujaLNkeWoTq5BN+LIMB3lhbrExyV678H/DodfVne9QtTvvYJb5CxHYA9GUgJhjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Oct 2025 17:34:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 02/10] x86/HPET: disable unused channels
Message-ID: <aPEQmMKYRwPaKxX6@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <8913e64b-d172-43f9-9c4d-447ba4984c9a@suse.com>
 <aPDaIssJOFh00-W7@Mac.lan>
 <bc7467ca-ba06-417c-8583-8de3782a1d83@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc7467ca-ba06-417c-8583-8de3782a1d83@suse.com>
X-ClientProxiedBy: MA2P292CA0017.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::20)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e1027a-7081-42e7-c76d-08de0cc98c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXlPWlNIWXJqU2I2eE5MVk9lQWFNbVVCclFlRGJta0YySHlJVFl5aVRZdDFL?=
 =?utf-8?B?STE0TkJwbTQraVNCOFRrNlFOb2RLMWM3T2tLZTFsT1RDamN2YjNILzBDSkND?=
 =?utf-8?B?a0V3bTRUL2xxempGR3hZWlg3ejdjSFhDZEs3RTR3bE9ybDdzOFJSU0VNOVZB?=
 =?utf-8?B?SE1leWlnZ3I5OUpEVjRNemE3T0lsTW9ZeExReGNLTHpmS2hEUXlJYndTeXFh?=
 =?utf-8?B?N1RHMCtuTkhYSHByZVN1amxxKy83NXRZNFVJV0doNHhZZWx1RC9ab2dtQnYw?=
 =?utf-8?B?Nlh6WUhQckZEeE1ZUjJ0ZGtiaXFCLzJWL0QzQUJMV3VHT3ViRnFFalR2Y1dX?=
 =?utf-8?B?TDk4cFhnejcxeG1RYVRncHk3em1OczdYTUF5a3NpTzl6MUZ5MXV1cW1EeEV5?=
 =?utf-8?B?ZHhCaHVRWHVOUzdIU2Zrd2NyWGNYVmRVWXFsa1ZQQ3BFZlN6WTNkTEs3cGpy?=
 =?utf-8?B?dENNOW1NNjlnby9ORloxSTdjcHlDRGZoNGVNS05DbFd5YWZIUFdFQlBlTlFL?=
 =?utf-8?B?V0FnaWdmTmZBU1UyZTNEclJmT1JMR2FmYUc4bkVCVkNhdWlOMDh6SzlmV0M3?=
 =?utf-8?B?dFloczhNTmF3M3FZcXFEaGZTS3dGZmxlWlZDWFBVSGJPcjRKbXFPeHB0QWdV?=
 =?utf-8?B?T0NUak9pZTVHMDNYU0JwcklaYnhjUGUxZG5OY0tZSnlMMW5kR2t5WGVub09E?=
 =?utf-8?B?OWpSSGYrZ2F4SU9hTUpBT2xpeWg2TUdRY1VhU3AwYnpKcG9icnZVNHRRVnEv?=
 =?utf-8?B?UE9LVXV5RlVTSWMrcW9Tdi84dWpIRFk5WExVZUQ4MVhiNHlLbzRvemtDT3ow?=
 =?utf-8?B?d3lwUTJLQk1QZzZpVEd1MVpEMVNpZUk3T3lUSUhDc0ZMUHEzSTVOWnErUE9t?=
 =?utf-8?B?Rm5PbHBkY2lvNkZyYlZMamsyZ0FkYVVyVW8xSnZ6RDVoUms5bW5JMXo2UlVE?=
 =?utf-8?B?cTR1TktNS2laM05uVzQxNEtDRDJxdEcvWjV1YUJFblFaMkZ2OWxzK0JEeEpP?=
 =?utf-8?B?WjRneHBxc1Q5U1YrbU5BR3VmWlJybUJUV1MzVkRpby95TmxsYUw2NDJXbTh0?=
 =?utf-8?B?dm9ocVlHREs0SXhtaVRMakpUNWh2cDVHcDdORVZUNUxjejB6cXo4TExuSVYz?=
 =?utf-8?B?bVlIWUdtSWlSOUFVOCsrK3hpRjBMY0ZkWFVpb1g3S1d2dU92WGJIeGFBTUZ5?=
 =?utf-8?B?TlcxV25uUElQRFJhREY2MHJqTXZQdVBxNnRqRGozVXdZSk4vdVZVOG1FUHlx?=
 =?utf-8?B?Y2hKWWgzR1l1NkxFNVkyZ2Rpd1p6V3RzNm1wNGJPY2hsNVVzTFliSlFDbzlt?=
 =?utf-8?B?SEx5ODZ3UVoyTHFuZWR6UjJLa1ZkSXRGOGR5Q3JEclJkNjN5RC9ySU5JYUtN?=
 =?utf-8?B?ZUp2YVpDQlRWUDF5N0JUekp0cytnekZDYld0WXA2L2t6TGxYdGJROGNLU2pH?=
 =?utf-8?B?bEF1MWZlaHN5NjNRTzJXQ0dSc2JSS3BaQit2QW5KQ3JhRFZiSUVhZVRyUEV4?=
 =?utf-8?B?bW9UUkdINkVUcFlPcHU0Tlc2L1c5dTdUWmJFdk1ZS091cko3RnU2TDR0RjVk?=
 =?utf-8?B?YzdQbm53MUdtUE1Nb1hEOGdPNjlES0hhZ2F4ZmRxNUowQ1VGZTRIMTBhUS9o?=
 =?utf-8?B?QVhSRWIxT0xWQ1ljYVFvZXFYNTQwVzRDaVdkTmFPSXk3U0hGdE1xNlczZVhk?=
 =?utf-8?B?dzJEdEw1Q0RYWUpLYUFPUUo5QnhKVEVwQXZsUlBwdzNHYlVvaVA3NEFhWkha?=
 =?utf-8?B?bXpyVWZIbXFsUS9wTndodHFnODl1SGhxWkt5UmtVeW52RG5RREtROWhhc2FB?=
 =?utf-8?B?NGRxeDd4ckpYZVc1Mmx6Sk1UcDMvL2YyNVZ2cFp3aFVGVzRYUTJrUVMrVzhF?=
 =?utf-8?B?ZjU1akZiN3hJa3V1R1dxZVAvVFl2Sy8rbFJBQ1g2cHBsSGNJUFExZndTbDBy?=
 =?utf-8?Q?E8JpERmSTFHrwxrV6OApq+4GOXg1/9uz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K04zanZPODVseHdqQWZDNkV2Vkd1U25udE5JWFNPLzliK3RuYklBTy84Nysw?=
 =?utf-8?B?WHBIUkRkWDBxdG51R1FsSUtkUjhlazZvY1d2SjJtdjRyUXI4cXRJZHo1ekow?=
 =?utf-8?B?OEtyaERGS2RkdTA0WHFhY3R3S1FZcDhWMWdhRlFKaThWRUt6MW03SGxxaGE4?=
 =?utf-8?B?amZVUXNIUS81L1ZSUUJrMFJ0ZkFCY0IwTFpkK0NKMUtJSFVqZmJSdEtpSEJz?=
 =?utf-8?B?Zk9qa0RZalIzN0pmZnJtWnArdjlrOUhzVFB1ZmVvTFc5VWlQWXhpMVk4WFFs?=
 =?utf-8?B?OExUaE55eGQ4TVRYMlphT1VmQjg1ZTdWNnpzZkJHYzdIbWw4b1RXTDQvWVRu?=
 =?utf-8?B?L2F0N0xuVlFKb2NCYTNBWE1YZzRuS0loL0FmVEo2ZVJKRCtNRWhKNndKdjIy?=
 =?utf-8?B?aDk5ekVvLzJZWkhoMTI3Sko0SG1Sbit0THg2QVd0MWlwYldRTjJ4aDNla01W?=
 =?utf-8?B?R2JLU1M5SEN2NkR6RmpPQ3dPYXd2di91WHlXOFVnY2ttanI5MGVQbUtPVEN4?=
 =?utf-8?B?bHhhYUk0RE9yRUx6dm1pQ29qMGFzbEZLckNUMElRWVlUTWNnU2JPVVJJeTlJ?=
 =?utf-8?B?Wm5MMHhtdkN4S2JmZnhRbXVDVTQ4UlRkazloajlIQVUvTXRGYkFWL3Ixem00?=
 =?utf-8?B?VFd6M29paTdacnhZVmk1ODN1ZjFBSVM4NzBwWFZyNFZZSGRGczNaYXJzRW9S?=
 =?utf-8?B?d2djMFhHOS9MWm90S0NvWjFpZm9Cc0MvYTBZek1FRXNzeWh5ZnJVMXlXclhX?=
 =?utf-8?B?V2ZmbUlkVU1YRXVSMnpaQlhJL0R5YlJJcFBrOHJHaVNveVN5Ui9DTjFrWFBT?=
 =?utf-8?B?aGwyVExoc3YvLzhqeWlHUmhqc2NWQTZaenV4NUo3Y1pSQXFybGpZVmdCd0Uw?=
 =?utf-8?B?SHBKUWZ5TTlhcGF6ektGSXJSNE5JU0hHUWQ3eHFwL2c4b09CbVJZK2VBbUFV?=
 =?utf-8?B?MjErbWNVSkJzc0t4NHc3c3N5d1V2QkgxNFNYbVU0OEFoSTZJdzVvSDlmTEFu?=
 =?utf-8?B?VzFjbVpnR3ZyTDdvdU81SXdzWk90dTdDa1RRdXozdCtvZmlwRlBjYU1ldU5u?=
 =?utf-8?B?NGozcUpRcThGVEFDQnBiODVPM29ZeUxXdk9CRm1ZMU5hRzB1YWlXY1h2QkZi?=
 =?utf-8?B?ZnN0b2tFYVIzMzN3ZUJjYVljNGo3NTRyUHRxQ0F0dTlCMm5kMkYvVm5XY2Vm?=
 =?utf-8?B?UU90emQwaEFkTzBvd3l1L2RVRUJZUXlGWWlEYnJzYWZmVlFXMDNzN2hWSkgw?=
 =?utf-8?B?WDdLWkxZY1Q0aCttNW51Ni95VUZYY2tyWnFINndhUTdoTnJTMHVUOGxmTnht?=
 =?utf-8?B?elBia1d2TWxMOUk1a2R5VXUvYnVVSmFhVHZzS3g4TzY5R0VtVnB1RGRRUjht?=
 =?utf-8?B?NEpJTVV0SGUzaVM4MTBybW5hVjFMRXlTZEVLbDRQbncxSGllL0Vtb3hQZ1Z6?=
 =?utf-8?B?dTdWVjI3aDN5RGZHeE0vUk00OG1kMzFJTkk2U2Y0YzFQaGo5UmVlQWRvM2NN?=
 =?utf-8?B?MEVxUTRucXFSRzhIVnpsNXV4Qy9LZlp1VFdzL1lSSzdWYlRSRjQ1NXBVUThl?=
 =?utf-8?B?K09FWWlaVFZIckpubWdkeEtnR203MERZd3dtQy9HRUlJU2FtVVd4cmdpQUZ5?=
 =?utf-8?B?RjJCS0Fody9nb1BCRXNjMGdJbDE1VXJ4WHppeGZNUjh0K0dJcEppeEVDNFBK?=
 =?utf-8?B?MWNqVDVCMVFUK0VQT2YrVWF4UEMrVlJvTzl1eWd2K2w3VEZ0VFZKOFVvclFv?=
 =?utf-8?B?alluZkRJS1FOQ1QrbmJQdTlFNlI4eG1tTTFZTlVMcDlMRHZPZXo1WUtQYk9T?=
 =?utf-8?B?MzVvOG93eWZFbVR5eVFIUE9hMm56bnRRVmVTYzdCSFpJM1BnQ0sxQktXeUMy?=
 =?utf-8?B?TEdpZXduallxempySDVrdmg3NFlwS2hDTmFCSHNSWHBpYlB3elZIaG9zQ25R?=
 =?utf-8?B?bFJZdFVVdThpbUNKbnJHMVZZVlZBVnByUWEzZjJjN2JyU1F0b0pLTVVieFFz?=
 =?utf-8?B?OUpveXdBSFIvL2xmUlR2Z2RzWjE4Q0pIdldSWUg3OGpFU0pQc3hpU3pNNW9x?=
 =?utf-8?B?QWZ3eVp4bWgybStIM2dVK0pUanhlNm16aDN4U0pxZFdNdCttM0JwRWc2dDNT?=
 =?utf-8?Q?OCjh7PyliPMVnvp23mvYtAqaE?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e1027a-7081-42e7-c76d-08de0cc98c80
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:34:52.4056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCFzwigSGY+pY2a9d2dHGHuE2Q7mLcFPHKzIaKsCWMN2l7spRAFj2UNzFqtagr4gAlHwsWpE4v1r6lm0qtRurQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7250

On Thu, Oct 16, 2025 at 01:57:41PM +0200, Jan Beulich wrote:
> On 16.10.2025 13:42, Roger Pau Monné wrote:
> > On Thu, Oct 16, 2025 at 09:31:42AM +0200, Jan Beulich wrote:
> >> Keeping channels enabled when they're unused is only causing problems:
> >> Extra interrupts harm performance, and extra nested interrupts could even
> >> have caused worse problems.
> >>
> >> Note that no explicit "enable" is necessary - that's implicitly done by
> >> set_channel_irq_affinity() once the channel goes into use again.
> >>
> >> Along with disabling the counter, also "clear" the channel's "next event",
> >> for it to be properly written by whatever the next user is going to want
> >> (possibly avoiding too early an IRQ).
> >>
> >> Further, along the same lines, don't enable channels early when starting
> >> up an IRQ. This similarly should happen no earlier than from
> >> set_channel_irq_affinity() (here: once a channel goes into use the very
> >> first time). This eliminates a single instance of
> >>
> >> (XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
> >> (XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request
> >>
> >> during boot. (Why exactly there's only one instance, when we use multiple
> >> counters and hence multiple IRQs, I can't tell. My understanding would be
> >> that this was due to __hpet_setup_msi_irq() being called only after
> >> request_irq() [and hence the .startup handler], yet that should have
> >> affected all channels.)
> >>
> >> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> A window still remains for IRQs to be caused by stale comparator values:
> >> hpet_attach_channel() is called ahead of reprogram_hpet_evt_channel().
> >> Should we also write the comparator to "far into the future"?
> > 
> > It might be helpful to reprogram the comparator as far ahead as
> > possible in hpet_attach_channel() ahead of enabling it, or
> > alternatively in hpet_detach_channel().
> 
> The downside is yet another (slow) MMIO access. Hence why I didn't make
> such a change right away. Plus I wasn't quite sure about the locking there:
> Imo if we did so, it would be better if the lock wasn't dropped
> intermediately.
> 
> >> @@ -542,6 +540,8 @@ static void hpet_detach_channel(unsigned
> >>          spin_unlock_irq(&ch->lock);
> >>      else if ( (next = cpumask_first(ch->cpumask)) >= nr_cpu_ids )
> >>      {
> >> +        hpet_disable_channel(ch);
> >> +        ch->next_event = STIME_MAX;
> >>          ch->cpu = -1;
> >>          clear_bit(HPET_EVT_USED_BIT, &ch->flags);
> >>          spin_unlock_irq(&ch->lock);
> > 
> > I'm a bit confused with what the HPET code does here (don't know
> > enough about it, and there are no comments).  Why is the timer rotated
> > to a CPU in ch->cpumask once disabled, instead of just being plain
> > disabled?
> 
> Because it will still be needed by the other CPUs that the channel is
> shared with.

Yeah, missed that part, the channel is migrated to a different CPU.  I
wonder however: since an active channel can be migrated around between
CPUs, isn't there a risk of the timer firing just in the middle of
migration (when interrupt generation is disabled), and hence Xen
possibly missing a deadline?

In hpet_broadcast_exit() we need to check whether the timer has
expired after the migration, and manually trigger a broadcast if
needed.  This also risks doing to broadcasts also back-to-back, but
it's the only option I see to avoid missing a deadline.

Maybe there's something I'm missing, this is all fairly complex.

Thanks, Roger.

