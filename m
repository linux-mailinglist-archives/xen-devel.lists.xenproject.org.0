Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B139B06EA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 17:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.826079.1240428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Lqz-0007Qj-UH; Fri, 25 Oct 2024 15:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826079.1240428; Fri, 25 Oct 2024 15:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Lqz-0007Oc-Qj; Fri, 25 Oct 2024 15:03:53 +0000
Received: by outflank-mailman (input) for mailman id 826079;
 Fri, 25 Oct 2024 15:03:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jrJ=RV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t4Lqy-0007OW-3Q
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 15:03:52 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2407::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56dd6395-92e2-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 17:03:49 +0200 (CEST)
Received: from SN7PR04CA0028.namprd04.prod.outlook.com (2603:10b6:806:f2::33)
 by CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 25 Oct
 2024 15:03:45 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::ac) by SN7PR04CA0028.outlook.office365.com
 (2603:10b6:806:f2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Fri, 25 Oct 2024 15:03:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 15:03:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 10:03:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 10:03:44 -0500
Received: from [172.26.85.121] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Oct 2024 10:03:44 -0500
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
X-Inumbo-ID: 56dd6395-92e2-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWGOHxAIpafruyvpf8Pnh4QE34F4dyiV9qD7qseUgq+aZSIHvl4YlLbeccgm6GpUxYhApGOMoZHWmgOyBg/WlDTCD9gxjOATfz8Rt5jlpjHjb41xwtbC8RVp+OIqFVtjG86LglmlKqNx6WyN7YLtIRGuCuj1oiLby4qcEFgOJqEAjUtyZxKJPet+0kFx+5fjb9ye8+ML65Mk+70JbgFrG1YdXuLLMFgAo4AS0bOOvVaoqbL6klX3FwRqTLYq6Fitv2i73GkVss/pWLwvNgd8Jg/OhMnaEyN5vFpYgwgX0YP99xoiRaEOhm/jullO5hKPW6QMrIth4qpSiyZgVd5RCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MV/vACyTFpjZx59/9qqPFisOBGQP7WlVKceSMZX/nsw=;
 b=lP3ovOJuKczpDuOT1j7mtpNxuIUAQQ3o4DjN99lFzIrwb1FD2bqvFPVkhIxhs6lvR3GoyT0HvoODmb8tU7wQRqJcoPzpYJ0Z7kXfGqADuh5lJ5RRu7PL9CvpYGCuWzUpxq3tEf9UGJY+WfSOCOAzK99+tqaheo4sfwo0sfm8pm5kocDLY2jMAWQ7Ij25cbvDHOp9IUwGmWuEn2eeLPIl1OBfW6Q/ZXa6bN3odUucx3XZo74h+QII7X0Y9XScxuvqAow7O9H7haw9S8WJtdFQZDc5ISjXmQQx1tAq2uusWAPP/pF6vO30x1VsqSbp1AAr+iXhrUzjg7Q3/wlcAzm0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV/vACyTFpjZx59/9qqPFisOBGQP7WlVKceSMZX/nsw=;
 b=FS5zvbeQo+lf+eIJRuk7EOQJhisPKToBzWhDzqtHJUW/+gmFL6ucvJ8MUHPk81jdyisLl9pgc9OhmC9zDqWIpbRJZqiWt8Qv9Yvp7ji+1aCP2U16yvt1vwSE56AE6W+r4Fgl4i6Ta0PiRwYDB3f26xa4TKSo4KXP2DqYpPJgdhA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3fb31bca-626a-48a6-8b06-7b37d6865862@amd.com>
Date: Fri, 25 Oct 2024 11:03:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/ucode: Rename the cpu_request_microcode() hook to
 parse()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
 <20241024132205.987042-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241024132205.987042-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|CH3PR12MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 938d6ad0-f855-43fa-63f4-08dcf50638bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGg0TzRtT0RCYlRjdS9rOU1GbGFXRm9GNUtSVkdlQ0Z3K2FQTlJ2TkgyWWVM?=
 =?utf-8?B?UnI4YWJZK1pnSW9jakhZcGdXcGNyRlREVG5zOVJBbWlNSkxSRW5TdjFSZDM2?=
 =?utf-8?B?NHlSZmVFVjYvNjY5Y1VKVlNuSGlhMG5YRmtWL1I1QTErTnB2citvWHBleFVQ?=
 =?utf-8?B?UzZ6b1Y5dXhheTkrRmQzejN3dDY0aG5TSTU1N1BvbVpTdHFqOW5kb1ovRGNX?=
 =?utf-8?B?S3JMU3pnbEpITEZBV0JzUFM4OVc3b3U2TDE0NkVmaDVKNlRnNnl1Rk85MXd4?=
 =?utf-8?B?dGM3blhqVlA2bEJocmM1NEhoU0s5aGxaL3BwRlg3dkdPOEJoeU1MdkhjQUcv?=
 =?utf-8?B?Mjl6QlllL1N4OGU0QlN0ejlOemxUS1dDTUp2NWRSdk4yNi9nekswSU42SW5L?=
 =?utf-8?B?Y3dDT3loU0UzbElkaStsTGlhRXcvQm9vR1k0alZDMHhKSkk0eHFIOG9UZTFl?=
 =?utf-8?B?TUo1cnZmK2g3bkVuN3JRRll0S2NHc2dKckFnY0hEYmVocnB6U2JDV3hXM0Fa?=
 =?utf-8?B?Q0dicDdmYUU4VmZpVHVEaWtOL0xocjdaYUdPYUlKdmRndVBnY0VzVkFYS21D?=
 =?utf-8?B?U0gxZTV4bmRpM21uWWZjZjBudXlEa0NsOGx3TlBkNGdvd2tsQzJ6RGEwVFlL?=
 =?utf-8?B?WlJBV2dDK0xoeWd0UENZWHQ5b1ZtcDFqUjA2QUNNdXUwdE1oZXlvQ2IzRUhF?=
 =?utf-8?B?UUZybm9vdUNub0JsdkUzU1BKWFhvaHhTRzZWS0xLalUwSGJyMy9lMldObDg1?=
 =?utf-8?B?VTRadFJTT2hrUGhZaDM4NkFVd28vNkdSOW1rNlAxcnl0V2JKYm5UazdlNmNj?=
 =?utf-8?B?d1g0RFY5U0JuY0xJdEZneHFVY200UmROdFI4QlRidDA1NWpmUmlLd1BsT3ho?=
 =?utf-8?B?SHY1OForRlFTdDk4dnpucGpjc29zK3dPckxLcmZRZVV2YXc0dGlKSllEWWJh?=
 =?utf-8?B?QnNlSmtGVWpRamNaWk9OTm8wS1p4ZjJoNXkyZ2NrQjRteW1DYXRhYiszQXpW?=
 =?utf-8?B?c3E4eFhoL21wNFVEc21pMnk1NWE2THRjdkZFaXBzbmp2VUNXUG1tY3pTM1pw?=
 =?utf-8?B?S0ZXaUsvQ3o0K3VZNEhYOWVEYURJYjhLRXhNaE5DWnphRG1NNFM0ZHk0d1Er?=
 =?utf-8?B?ZVV0ZjEzdkFFb3ZhVXkvOVJGT3RyL1VqV1ZsTTkzT3NNMGZNMVJzREUwOVZJ?=
 =?utf-8?B?RW9FdWhNazJ4RGZON0ZRdUpHcC9Ya21Yb205SFhZUlk5NnhueGlyZjRPUFph?=
 =?utf-8?B?c0FGOG9KNGNWYjJRYU9aeDhWNUpXdkdESUxpUXIvMGxpNkptZnhiSVY0SW1w?=
 =?utf-8?B?TXdRMnFsa1dvZEh4N2VSc0d0eng5VEFPemVCOHRUajFMTjJjaGZCSzJnaTF2?=
 =?utf-8?B?M3o2cmFBMkNZUGJPdkZaN1JqY1M3bUlnZEdXQVVQcFVXMHNNN3hSY2pFL2wv?=
 =?utf-8?B?UXBPaDlzRGI1Q3JLR3JSNzFBOUVjYXExMzZ4UTJ2ZHhHQVZkQ0daWVYwOFFw?=
 =?utf-8?B?MVo5WEVyQWE2bHRaWDJXZzEreUpJQTBLNTArRkZaZGFrNkhiNlMrYzNuQWhu?=
 =?utf-8?B?cjNxZ1ZPaGNNNlg5T2RZY2crOTJtV0NQaTJNRmhBazJpVStldTQrcW9JRjRP?=
 =?utf-8?B?QXA2dksvUnhrVy81SWpEVW14Q3JxY3hBam9NNElOdFRkNENER25Tb2FlSjlv?=
 =?utf-8?B?K3duMFFzY3lmNkZRZnZsZGVJOEJ5a2R5Mlo5QUFtTjhVRWwxWXBRSHcxWVFO?=
 =?utf-8?B?K29LcEtyWlNIT29qU0xvQ1Z1WkJkRXNxdVJiWUhSajZUYS90NDZjdkpWYzl1?=
 =?utf-8?B?YU0xSCtTUFdKVzljVUEyMHRlSENJYUpUNElLdnlrZVl3cEh6cmhVV1JnVHF3?=
 =?utf-8?B?d2pUSkRIUkpSczZPRTFGRGpkUFloRGRJUzFHMjZ3YlJlSlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 15:03:44.9531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 938d6ad0-f855-43fa-63f4-08dcf50638bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852

On 2024-10-24 09:22, Andrew Cooper wrote:
> cpu_request_microcode() was never a good name, and the microcode suffix is
> redundant.  Rename it to simply parse().
> 
> Introduce ucode_parse() and ucode_parse_dup() wrappers around the parse()
> hook, also abstracting away the make_copy parameter and associated
> const-correctness.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

