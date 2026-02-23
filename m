Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AEcOt4XnGmq/gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:03:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA1173753
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238554.1540165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRqP-0004s9-Ue; Mon, 23 Feb 2026 09:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238554.1540165; Mon, 23 Feb 2026 09:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRqP-0004q7-S1; Mon, 23 Feb 2026 09:03:09 +0000
Received: by outflank-mailman (input) for mailman id 1238554;
 Mon, 23 Feb 2026 09:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2fJ=A3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vuRqO-0004q1-AF
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 09:03:08 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7722ecea-1096-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 10:03:06 +0100 (CET)
Received: from BL0PR01CA0009.prod.exchangelabs.com (2603:10b6:208:71::22) by
 BL1PR12MB5801.namprd12.prod.outlook.com (2603:10b6:208:391::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 09:03:00 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::bd) by BL0PR01CA0009.outlook.office365.com
 (2603:10b6:208:71::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 09:03:03 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 09:03:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 03:02:59 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 03:02:58 -0600
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
X-Inumbo-ID: 7722ecea-1096-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kj+U6CYMwkxj0KoegJuzhGrr0UESWNumVriiSaZSkzHGTX4lQAKlzxcQIN+JYtucqo+6hu+SqavFs+VF/F1oUdjZsVTPXurrInZlBmGWS3voG4qbl7SyQqQECwi7Z+1vF3hgMWROCKebB6Lt2TixG2tjlhQ9DnoAs25zWH2eOozrlZd/uTJ1PfwtEY7EAKKkmD+yxGkDRg/X7XJ1rL6InrN3RaQDgJF0xhT3q0SggWCVYP3po6xeaveuU+VulxzBf8icsrPi74cB32KNcI1vNogr7kPeEQFcjzfWaG4M7AaN6YXUSwFeqjDpJd/81mocCC9wzUPC/wQASCfFloRD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mj+BfBn6GbWqGU5a2/q4jw/ngVvX580fXa9Cwon3VkM=;
 b=SYG+D6LqzKHXYwEXXOFdKjN5KHw5jRmO7RYTxCqMTdZVwJy4WtFiDOL3jkwajjoWSksMbziJv42s0RG5Hk1F0pG/OjO40rdDmNt9YtF4fikvRcBA0r29BScnDpHLYhbjkaKBy2GtwPjDH9IrWmavXibKnxxFUEbSgwkud2zjijCZfotf0aPzDQo5iZEKn1kooyTDQoGicJpwQ/Ja2IunpIAVSaVnvHeR7XzoDLLGtenUwDfTYOiJVdZGopBFVueSd/mIu6ycU6gddelwF/o+N+3FZEpaNdla6Drkpc6Fyxmtx0zzyrGb7ggSndPSNTAqhecFglzJcJrI7I353K/L7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mj+BfBn6GbWqGU5a2/q4jw/ngVvX580fXa9Cwon3VkM=;
 b=eRSGYfnCRrJXUOJsJJacjZzKc0gK+pyCDT2zWPBxnyJIDwGs0vDJ0NvpuRLuisWoeWnZiUs/DOW3wg5pKJJGKXOcCbN3yRXaPLwBwQ87FLuVR4jegZyCu6CWUjtcdYGLaJEInOgDwWTFqKti4NY6M89daa0DAj085Vio25Yk2F0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <32994472-5892-4eca-ae72-a7d1432d4f2b@amd.com>
Date: Mon, 23 Feb 2026 10:02:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] xen: Adjust break/fallthrough statements
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-11-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260220214653.3497384-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|BL1PR12MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5ae539-04f7-4bc8-ccd8-08de72ba5875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFowTXJpWkRmaDdMT0FvTjZBeW1najJUZ0hDK3JjMnVFSG5qQVRlSmxHV21Q?=
 =?utf-8?B?U1NXTWxUaGFkdmVMWDVtbE1VS2FKaXFVZ1VYNWFLbVc0dW5QTmo5V0xXaURi?=
 =?utf-8?B?TnlhU2NlQml6eFZqTGFYL2ZZT3BseTlQV2RCV2RJSjZicklnZnloZEdCaTJF?=
 =?utf-8?B?Q2RQQWlxUjJiS0dpc0VYanZIekpwWEhXOEFVbXJ3Y1F3eUFJMnM1emppeHA5?=
 =?utf-8?B?WTlYU01sWFVGaS91TFVxL0M3ckh0ODUrRkphVUNJT0FDaGtrT2tuSUtvTzZE?=
 =?utf-8?B?bzVOV0FRNDJJTWRNWFhoeVQ0L2gwblNGSFZqTmNZb004WERtZ3NKd1NQd25W?=
 =?utf-8?B?em1HMzl6ZnNKOXg3ZFQwQWhESzhNaGEyS2hCWXl3MzJ0L3orQVJEY0J5bUls?=
 =?utf-8?B?NVdGbi9HSzkrYnQ5N1VFMlNLbWhvQTFjSForZFpFamNaZEhiYmZVeG9SVWNt?=
 =?utf-8?B?NHBDalhiNEhvTklsaDdZMzVxeVNOSU9RMk1qQ0pzRHcxNStNb21RY2VSL2xI?=
 =?utf-8?B?cHYvbW1ESmtGVCtjNHBOWWdrZTgvaXorRE9ZMjN4cytJaUQ0aXIwb3NaK1hG?=
 =?utf-8?B?Y0tpNlZvVDM3RHppK0RqbFJhK1FlaGJld1k3S21veGhUaXJ5N0k0aUpaWlcx?=
 =?utf-8?B?NjJkN0R1M0VzYmxNODhPMjg4TThRZ1FlTEdmUXpVcng1THV6d2czOElydGtk?=
 =?utf-8?B?dWUvTjNvTk1wNVNjeVVaNnJFc25SRGxNOTMwK1ZPOStYbUdBYUdDUnROZW9N?=
 =?utf-8?B?K1lScFEwcmlFVmpDTDFrYnVqcmk0ZXplR1FabjM2OW1Kc1RaN05FcGlGTTJt?=
 =?utf-8?B?N01yV3JseGZ0VU1XN1FVQW9nbkhXdWU5VytxWlgxTlZOSDE2cFF3Tm1LNUti?=
 =?utf-8?B?UU9kUlViSGd1bkpqS2h0UWVsbVFlYmVQSUNNcGk4SzJaTk5yZ2hZRngxbW5s?=
 =?utf-8?B?L3JqUE9PQm4yWjJ3U1RkWkNFRUpyazI0bThvYmQ3RGhWMStKdWlOUXZsb3VZ?=
 =?utf-8?B?Z2tTNzRBTkpYWFZwSTR4WUFVWkJZQzFyR3FYUWcyNkhQR0c1WndkUnpCL1pS?=
 =?utf-8?B?ZFo4dkNMVnRXanBCemREZkNPQXZoY0ZidHRPZHZ3bzFKWTdQbGU0M0UvMmwv?=
 =?utf-8?B?bkNuOWlYSkl3VXh1RHBrNE1ycDB2K1V3N1RYbzU0MW4yTTZkQ05RVjYzbFh3?=
 =?utf-8?B?Si9VVTB0ejBncWsrcDNBNnMzZStrY01KTHpJbTdSbG44ZE5ZRys5WjhJbHlw?=
 =?utf-8?B?dW1tWW1WeWhETS9ZT2NsNlFTNS93ZC9RYXFzTHhOWUM4b2xoRnhtTC93QnYy?=
 =?utf-8?B?MnNGNDBrNk5hc3F3Wjk1bzdoYUR0NGV6eTlqaXdPMXFXSWFMejJRenF5Mlly?=
 =?utf-8?B?T2JLV1kzcEpNbEhKaTF5ckl2S0k4U292dlhneU1LSHoyM3BUeGxiSDh2T2s1?=
 =?utf-8?B?NEUrVjhSR0UwSEwrWlFHSFUzaG5uaFpQMjhLdjRuT21HTXllNkpGejUzQVdj?=
 =?utf-8?B?ZDZ4K3JOUlpJMTdDdHlkMGs0UzEvSUlUYjhrbWlQdmtjT0tsdWVTQm56VmVV?=
 =?utf-8?B?dzJYU3B0ZGV0WEpqMFVqUWdCbjFjMi9uUnZOd0YxajFHdnlnNDY0dEtPZnNr?=
 =?utf-8?B?Ujc1dGlpK2FRZk50NUJSMEJLVDZWMUhGMXR1cWZTSHBrb3dDQlVWOUFiZkV1?=
 =?utf-8?B?bDJRQzE1TGhRREc2Tm8wSnVIcHRoMWpORjh1Vmx3Tk1PVXJQVDgyMUduRHAr?=
 =?utf-8?B?Z2NXeHBJNjd2TFZMWUdiQm5vdThtUDVpWUJ5b1MxK0JvWDgyY3pzT1FRREk1?=
 =?utf-8?B?aDllMGQyKzRjYzJveGt2bDFQd3hJM1M0QXJ0YnVDRWFaaTFIK1RidlBhZjFK?=
 =?utf-8?B?dlJWY2FDT0czVDdqT3pxdFcyYThhVkxxazI2akNZVzBZdGlSSXdzVTVwOVBY?=
 =?utf-8?B?RWdUQnA2R3pDVkJBVHJPY00vYjBONnBkUFZvR3hoMUQybXc5YWM2TmxEaHhT?=
 =?utf-8?B?K2t2dVRsTGllcGo0VE9JZm95a0ZwZG5MT3NkcWdEMzU0L2dGU3I3c1lBL3Br?=
 =?utf-8?B?a2wxYVFTMnJRVjBZOE5RdlBiOUd1WDIrVzcwcWpoRVhyaUVxNjlrbkZqS25h?=
 =?utf-8?B?SGhzQjZVak10Y1NuSDBacWxlYmZ3MVB3QjJKWjU3elhxYnR2RzRwVU5XcUg4?=
 =?utf-8?B?ajF4WGFYVVZPSnlrZHFzanQxaHdHSGVSSnBEQXRyc2xqblVML1BiTlpRaGV5?=
 =?utf-8?B?RkxnUDdJWVZpb2t3VmhjOHY2SldBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aPjBlkl9a/Tr0hUI2rl519vAnYG3jlE7iUvECXcz8bs1yE2FFeGy7+GJFXM9P+wmkBEPGdiqiJ0eBySechtzAUmbnn94a05uQsMjYutEXGo+Vp25TiFeKmB7+kg4xXBrioREzb7DR7x3qaEEfiNBZC8jXFeV8Oj7q7c5yXub3eE7xe1Jqma5OgNPvoal/KfgDZt+mSzeTOMXpYTCyfiyYtNCPufQqrrbh8XVCFjDW9Skq9fZiTVXK3C3QFK5VTjdcCrFepO/fvm9htCIl58iJT0PSNoqvffH+A608bfr5EeJ5wV7FjiwCHAsVlrcXoBDIH4S3ETdDGy7BD9Gbnu6FaK2xLe5rw9RkSOoUkvejn48UBZZhL5vSyvs6Ma/ivqqivpw08ZvyDAFHNfW3h7sqUgZdrKbcNyQ2MW86iBUf7uuoL5/eRn9Fx2QrjdR8vyS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:03:00.6425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5ae539-04f7-4bc8-ccd8-08de72ba5875
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5801
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 5DEA1173753
X-Rspamd-Action: no action



On 20/02/2026 22:46, Andrew Cooper wrote:
> sh_destroy_shadow() has a spelling of fallthrough which doesn't match the
> permitted pattern.  Convert it to a real fallthrough (psedo)keyword.
> 
> Elsewhere, insert breaks at the end of the default statements.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


