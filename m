Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IP+E7kWnGkq/gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:58:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58491735B9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238534.1540145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRlp-0002ip-4M; Mon, 23 Feb 2026 08:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238534.1540145; Mon, 23 Feb 2026 08:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRlp-0002hD-1A; Mon, 23 Feb 2026 08:58:25 +0000
Received: by outflank-mailman (input) for mailman id 1238534;
 Mon, 23 Feb 2026 08:58:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2fJ=A3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vuRln-0002Vg-65
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 08:58:23 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd25499a-1095-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 09:58:21 +0100 (CET)
Received: from SJ0PR13CA0175.namprd13.prod.outlook.com (2603:10b6:a03:2c7::30)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 08:58:16 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::2e) by SJ0PR13CA0175.outlook.office365.com
 (2603:10b6:a03:2c7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Mon,
 23 Feb 2026 08:58:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 08:58:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 02:58:14 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 02:58:12 -0600
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
X-Inumbo-ID: cd25499a-1095-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZ7KfFVgBhiKfFwU3BwFCmZl0VHdJpJxg17RehyUHPJ/DtiYK8ulIqcf+OJoECA5fpzaiGd26fB8+wMIwKzlQDhzp3cINYi8cmjwuHatKC3l12R9Gjv9XweoUoM9Bn2ZiIFeOJtgZitLRElqf0LObh+OgS0gvg0vHaqmwM12o/JUu3SZFaAZkHTDb8093nRx8vgz5pEKhGpSoiRkhOTnlJv/EGiH7SIh1I5YikfIJ9sK9idIWWBFhip5iPf2+mpltrl51EHV5R59/L43GCP6GaivBdLFMxvRr4QMQGlskht9JQtQCVEGPIvYNZl4mQktN0x+j7Zb1WgUAGru10L8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0sUhXZr66Tr7ijbuuAeshFgTkO/onTkAvF/bb2gMCg=;
 b=TdOLerFCEQBlRYVDVMmzvH2NeX2CjdkdOaxuh4K7MEvn9cTdqzdcyreGG6v35qm+CxpZf4bYMJSyi655NnXwyWWbwCyWlhbQV4W2pgWnl2Dy4aXtpP2BN84Giv2EhAJF1ZGtI2wqj04j8BsOlKFAhFTfd/xvqj1njKoMNlXlmAeeHSux5JSAgAVqxH7h/7pMhWfE7OCnxImp4xQe5fNoyYX/4xdtrMpV0ql7E7MZd315fj5PQPxRAQ+a7bS1HP74odEvtIx4A6wzJ/ffJ4p++kz2sXW9jTf8bIbSjrzvkbwrG18jygS7Efswy1vx/S5NOo2T9Hm6x82nuUn5NeHdwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0sUhXZr66Tr7ijbuuAeshFgTkO/onTkAvF/bb2gMCg=;
 b=ZMZOT0rho4DvADAZFHKoZnPYf5J5Gy+D3ZJe7TNaKNxl9BoIzS3YG3v9/RIO/mqyaF1pDhmwiwRFWFp8Hh0pgvQi/ju+z7OKm9FyH737I6oSnXbqXW7YAw2I8lom2v9g0JL7stZka7K6n4F+69DTGkCJhCuu191nAWoShidyq5Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c76e301d-8301-4d05-ab5a-b0b40c34ff54@amd.com>
Date: Mon, 23 Feb 2026 09:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] xen/treewide: Adjust parameter names and types
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-5-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260220214653.3497384-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 0576eee1-f511-4347-4fa4-08de72b9ae6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzIxZE9uV2J1YmtFOS9yNFBreHNOeTdzNU1yU201K29PMFdyditkU3dtUlY3?=
 =?utf-8?B?SVNjMTFKT2tPdFBrWUxDRnN0VDdjdm9VeUp5YmtiYlgvVWszNi9CSkxkT2to?=
 =?utf-8?B?eS9xU3h5OFlqaUpkMjJGeGVhRHg2a1pvK0gyUXJzbC9oT3FMR2k0NDV5SnM2?=
 =?utf-8?B?TFk3VjgyOEFmOVcycEhwMFY3MXJFZTdTNnQyNG9tRWpqZWhDc1NCdFNpMXZ0?=
 =?utf-8?B?ZkZlb0Qzd1NTS2l2RWlXSzhGTWhteWhZZ3QxRXM0cWx3TDZpbWpYcXdHUEw1?=
 =?utf-8?B?V2V5KzlJd1FuUnRXdmxVc2xjTkNuQ1ZGNHdFcmxoUUJaUEdrTmM0eVpjU0pr?=
 =?utf-8?B?SlZrQkU1OFd0L1NBOFArN21SODZvbW1MNDdsZXN6QktYa0lndWFESEJ4NWtm?=
 =?utf-8?B?UmdPMy9mSUJhVU9qYmozR1RNb0NYaUplcm9wbE1mbHZiN3lLT0tMVFdxZ2dP?=
 =?utf-8?B?TThBWGV0RWNzcitweHpxVGQweGZpd1lSVGxnTElxdnQySnRjdDZQMzJqVzM2?=
 =?utf-8?B?WjNTK2RJblVxRFUzZElnT090RUFIWk1UNTErbHBXUUhIRUYrY25OZ3VlWVJ5?=
 =?utf-8?B?ZzJrKzMvQ2ZadzJLbkpwV3hjeE9NUXp2b0pmcDJlOHJ6Q2s5UERmNHRHR0V0?=
 =?utf-8?B?N0xDby92SUtUblIwMDZ0VWtlY0ZpZEkrcnRQRGgrdXZrOHh5VkNDZ3R1dUh1?=
 =?utf-8?B?MWFuQng0QkUzcnQ1QmNTbnZaMDd5MWFSUG9CNXExYXl3ZnRGL3E0UFBydGtY?=
 =?utf-8?B?bFhlUlR0QVYzdEQxZitXeHhVSzIwT3BwSFpEK2NFck50ZUdYZUdjNmtMV2RY?=
 =?utf-8?B?WTZuS0N5dzVJUThrTXk1ZDlyS3dsNjdVRklzVG9BNFB1Wi9pc0p0SENFOFV5?=
 =?utf-8?B?QkpFNndDaklTQjhmdEdyNm9jSzVYd0k3cXZFNEM2T2N0eVM4Y2VpRXJEakgz?=
 =?utf-8?B?VkVLNEJjRDQxTXNjR1RkOXAyK2w2cHlJS1M2YVY5SmgwYkZCOTBvWlpEMWlk?=
 =?utf-8?B?c2ZjZHZLWXoyQ2hCWVA0eVV2dmo1QWJSb0V6QjlVZno5eHZNV29CRzRXTGtR?=
 =?utf-8?B?Q2lsb2Q3ZS9vQWI3K2FPSmQveXhGMW1ZZjJiczExcWFvZmM1dStTL2o3TWhF?=
 =?utf-8?B?OFBFeFNKM09CdHR6NXZNRitXVEowNUkrWmZjZklBMW1IN1RxTlRQcm1Ic2gz?=
 =?utf-8?B?MFNjZmJJQ3UwSWYvdjJLLyt3aHVQS0NYU3QwTm02RWVsWVE1a2daWXZBd254?=
 =?utf-8?B?RFRVbzdMS2d6RmRsMnhrQXhJeWQ5cDA0RFFxWEx1S2pPN2NJRUNkNVlUWS9s?=
 =?utf-8?B?OWsrWDQ4TXFpZEduaGdXQ1N4L0F3emlMTkhncU1QQ051RXdOeTZ5VXQ2SjhO?=
 =?utf-8?B?a04reUpCbWdnN25NMnhrSDNHa3pxNmEyL2UvbWE1V0F0TTdOQnJMVnRSQVpk?=
 =?utf-8?B?eWdsYWhJWE1jZExsM3hGdHlLeEt1dnMzdG10Z3pZYkZZempyd3hScXlZNWZw?=
 =?utf-8?B?UGJMMTdzUktHTy9kRjhLZ3BxL1VRMDVnTks4TGxkdExBZUg4VXlVVTk1dkZM?=
 =?utf-8?B?MVlhWi8wdUdOWjhuOForZzBUdWRlTld0c21iZTdYREhmSUxUQnZaenZ3ZENm?=
 =?utf-8?B?Y1o3dmxadVpUZnBwVHNCQlBhdmpoMGpOVUFmL0wyOGVJSnN6RkdnaU5mSGp5?=
 =?utf-8?B?ZFZ4dTgvdnExYXBka1FuRjM4ZzBacGZyTUlOMHRacENmRWhYVm9nVTdrOW14?=
 =?utf-8?B?TCtNNHhoV01SV2RsSlRlK0ppWlBBRDVnUmpPUTFiKzZUMktkY2hTQW80Q3JB?=
 =?utf-8?B?UTk4RjNTRlJXODVXNkxkMHdkcHNkRWUwdFlaZW9oLzBHZHdrWXdsN0JqUlk1?=
 =?utf-8?B?VG4rTktOcXBGYytTdG5lWEtnVFpOSWtPMmxzWW95TDhaU0l2dE4ySE5WQjNO?=
 =?utf-8?B?T3FpOTZMd2xRdXVWTmZSVU5TRENEaUNpWmc4QW50anFQNzk1bXJoQ2NVNmVN?=
 =?utf-8?B?akw4SWVFMkgwSEJieDNmVTN1c3NLL3Nwei83TWJmSDhVeDdBU1p4Ymp3Y1Mz?=
 =?utf-8?B?TnJocVMwQ3I2YkVyTUg3OXErcGgxcnBMaUk4cFR2NVhTV2s2dU1QRkllYlBX?=
 =?utf-8?B?UUZIT0ZXQkp1QjBNZ01qQVdaV0R4MnhMenMzRGpENzErNjVsdTRVZFJkU1lw?=
 =?utf-8?B?REJWeHpOZjJUb0VPZ0RlYkpzODhuWWdQdlN1MFJaNDgveUR5cjdVazJncXRq?=
 =?utf-8?B?YjgvVGlMMXZjT3Zsc0FLOFJPRXZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DPshjIhtw3sk5ptOjUYXbDdNSQy6V6lvql8ZJFxnebmFd0jWlUyc+JbofzV/fkiBsBDqIEEdQoMk9XzAAYKKSli63SErVyrMc10DHDd/0URZEyO6SgfO704jzV4L53WT8oTKynWD95haW444lZrm3KSX3ibrSEfmvJIV3x/xtE8qAz5cwyO8axen0GeH1OMSOjzegjD3E8qJxHrXCbN29IQqxyEX3uYgKLaNsxXVQsnDy/fH/b7XkqNDincX/W1wH4OLuB/Jub2hMPKMHEzGlYKs1hbWSgVVKhn9RxEjGgkaAsOJ4UfZvdq41DC3w8raqhKXxq2ncnRmiP3NHrqP9gbte2lY6+PvOLXIJfiyoev4Z17otFtcFNkdXr6+MThM7SBt4WJ1ksDeQhjv8IvVWi42f1YomiAHCQsrta+U60H3j/YRYjayb1a59J7lPGo4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 08:58:15.3471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0576eee1-f511-4347-4fa4-08de72b9ae6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D58491735B9
X-Rspamd-Action: no action



On 20/02/2026 22:46, Andrew Cooper wrote:
> MISRA Rule 8.2 says that parameters must all have names.  Rule 8.3 says that
> the names and types must match between declaration and definition.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


