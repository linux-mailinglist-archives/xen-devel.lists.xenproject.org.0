Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H2mMmbveWnG1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:13:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130AA01E1
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:13:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215455.1525634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3UB-0005fR-IM; Wed, 28 Jan 2026 11:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215455.1525634; Wed, 28 Jan 2026 11:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3UB-0005d4-F5; Wed, 28 Jan 2026 11:13:23 +0000
Received: by outflank-mailman (input) for mailman id 1215455;
 Wed, 28 Jan 2026 11:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pnMD=AB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vl3U9-0005cy-Mf
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:13:21 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 565b3d35-fc3a-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 12:13:16 +0100 (CET)
Received: from PH7P220CA0153.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::15)
 by CY1PR12MB9557.namprd12.prod.outlook.com (2603:10b6:930:fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 11:13:08 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::3f) by PH7P220CA0153.outlook.office365.com
 (2603:10b6:510:33b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 11:13:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 11:13:08 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 05:13:05 -0600
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
X-Inumbo-ID: 565b3d35-fc3a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W61zSwf8DSbazCfu9NMjY52bF5oB/zNx9VN5GbhjH0z5ULTHgm/qqNyQbMr/xAGd/6mzewyoZNrFunpoxMG1BDyLvTZrHZdjUijevA9El8ZrLPcZ/bTGI1tnnZ6cGFTyUfCR5fwrNpmKWcjx2C4roM4C4HKOptVjnGwyVKRGR2rETMrH/k4CjTyX7kLbVZHWlje4sOaVoT+wyw8SMRZmPpK97lZFtGAKYL7Sje6VoODNp+ExL1HDrO6FGjOdsua6rSog1vrJroqqcMEAP5gmvJGQuhdGDXmxngLKCk/uprhFxhLI/sqodXkd9sHl1if2pSLqfpgtHmqQH2Ebm7vMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEcL3V16C6/Sgcab/8hRP1Une+UWDuwQ72flmdToY/c=;
 b=UeN6eO/RXD8PaToGX+bfCabR39VdRXJ6TIWmv6cnP+tTnJ4j3sC68+ZqYUnSkP6qxV2lSVZ1aB47q1WIRevoh+EC0oIHfta+gs5Cqx7lNV6/MLVtqJbqwZK8eEfKSbML77uBHZiHZmi0ixZAtHVurL9VSkI5IbfGa3h9T8xnT5Wftr2/pS4dUg9HG4An4zfeqxFaBYNZgOfmnwVG68HmXzJDTuGLrp7oGqaXkW1Hz001H2UWuq7L8ZnsufeS02CA/AbPVIZVUbienHJQce1sEcmMrguD7GrZPKwofmoiRQ7iqAT4OseOMe8ZEq+qktZtxYFRJg5G15dk3iLi4LSOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEcL3V16C6/Sgcab/8hRP1Une+UWDuwQ72flmdToY/c=;
 b=PnlLpwyWlrazHtnuecs6r8iLwjSZ3oUP8jZJOdSuq7tFDKvKmQ/Hvj7xUDqzlUnYpq9UYcyeyIp37fbHhcc7iA5S/4C1TasNN72sQgue8AsAGyJ1sE1ZdFvOzwbrcLMIoMffnpens2+UGvUbQnRIb0NJ4MDGG7V6+0UdPBIRg+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Jan 2026 12:13:03 +0100
Message-ID: <DG06EYF3621O.20KGVKPZRDYMC@amd.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
 <aXnEdQxyevj-wMuv@Mac.lan> <DG03YWKDDNUC.1622RXX7ZJUW8@amd.com>
 <aXnZsg9mRD_atvt2@Mac.lan> <DG057RNBOT01.25ODFMNGWAZMO@amd.com>
 <aXnlfguNkm_Wuqig@Mac.lan>
In-Reply-To: <aXnlfguNkm_Wuqig@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|CY1PR12MB9557:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cbad06-a8ba-4b49-f689-08de5e5e37b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aG5wL2hucy95Z2IxNzR3ZGY3OFFaYUJjWVM2R0Yxcnh6Z3NJak43dW9qY1Ex?=
 =?utf-8?B?eWs0ZE1OenN4NGRQUXppd2lVU3FWOEtZblpuNXprRXdpWmxldXkxUEpHcWVm?=
 =?utf-8?B?VGFlR00rb0d3eWY2VlpuN1g0VzZqS1Vhb0ZhSHY1c1FzeU8vVFQ3R3RDYitW?=
 =?utf-8?B?NDNwTzFxVlJWbDJXQ3lTUm9SL2pzUHRjMk1DSGg2RkFaTkpLQlFTNGYrNVRX?=
 =?utf-8?B?M3RTK2NaYUhEcXJUejB3TkViVk45N3BLcy8xM3RzWGhQbXpkQ040UFFCZUxS?=
 =?utf-8?B?S05BaVljY0wyemkwcDB6N0FjMFpWcGVEMUFGREtSK3Z2Zk43VHZLVWpZWms2?=
 =?utf-8?B?VGZuYVluS1U4RXFWdlhBOWtNTHpyYjNXWDl0MnZNNkU2eS9rV3Y0TkFLNHF5?=
 =?utf-8?B?dFpMK0xiOWhpeTVObGZFeURQUXVSQnllMnRBZHlGT0sxb3dGUkNIbDJqT3Z5?=
 =?utf-8?B?emlMMXVUZFpMeVlBZXZUNFd5OGZ3UTgrK1lobTVla2JLbFliZUF4dTBWblRp?=
 =?utf-8?B?YnV3RWtiSTVxRmpsUUVYMnJ1ai9tQkdnUDBrN0pqSzNpUlJ2Nkd6aktuQ3Jy?=
 =?utf-8?B?ZlJsMHpURnZlbnR5ZnBaQTJKV0FFV0Q3ZDdwYzZBanFhMWFXcThTanVYeUls?=
 =?utf-8?B?TGdvdHlEK0IxZ1ZIcFhJcll6dDdTMGs4TEh3eUVqeUluelNLbXdQbDlMbVdZ?=
 =?utf-8?B?WDUzcThTV0kraFNFaUtYSTdiUmdSS0FiMkpreVJPSmZuSWhyQjFsVVJDZWJX?=
 =?utf-8?B?U0xOQVhITEI0L2g0YzRsY2hKVENsTnlnK1gzbzlHenFPSUtqMFhWODNHTE54?=
 =?utf-8?B?bUw3UVJ5bzhsbWtVeHlTcC9RNW1yaXdzU0R0RVVkaUlHbENvS002RThVSkpG?=
 =?utf-8?B?UDkxbHFVWDA3SWxZaVV3ZTBiZHVPYzBLd1NMbWhYOU8vN3FDdjVXWTVDdHpK?=
 =?utf-8?B?R2lmc3N3Q0VPODRQNWQ4M0hINjVWSjEyVWVmZjhSL1l3Y3dseFNWbUNhMWJ6?=
 =?utf-8?B?Y1VPcGNGV2dsL1NrZnQvbG50QUk1bEd0UjF5WW02NURvRTdSTGdJUk1kRnd2?=
 =?utf-8?B?eUM4K0FTM1lLdzRRN3l2bzlKeXYzdDkxZVdvN205cUZwWG9oeWNCYXdVanZn?=
 =?utf-8?B?OXd3ejhsQWJDbm51Qk1PQ0dzUHU1RmIyT0hUT1RkWkhKV1oxbGp0Y0U1OVVr?=
 =?utf-8?B?emQ4NDNQZVhVOXNWV3dKT2pjQzR0MGM4VG5lVkxRR2FRaStGTVY0VmlNSWdn?=
 =?utf-8?B?UnpnMjFsdlZKTWxUVGZ1c3N0aGpMUUh0ZmF4WG9sUEQwOWlBU1FjOTJ3aWFn?=
 =?utf-8?B?QS9YTm9JOUxxS1ptb0cvdjVDYUdwY0RhTUtpMWlXb1g5cDl3TXhEbE4rM1VL?=
 =?utf-8?B?YzJZdWRHaUR2OFdTNU1ld1hjT0dyWVJKRjNITVRRU0lER1YrNlJhUG9Ibldy?=
 =?utf-8?B?bit3TDB5M2U3ZzdoNEk1Z1UrcGp6S0VLZWo4NHZpS0VPNmI5UGpINEpiNmxs?=
 =?utf-8?B?L2FhZEdRd01TakhFWENZRTNVclFtN2hiREhnWUNxdW93UFA3cDR1QWNkaUxQ?=
 =?utf-8?B?blFZaUxQeFhuai96Z25GaEFRMXl0dC9CWG1HZVovNzl1TE9rVzZVWlR3L3Y1?=
 =?utf-8?B?RmRycDF3dW5aeEVpTVZ0WDl3ekhZNnZGUlI2NXlsYS80ZDN2NW83ellkTm9j?=
 =?utf-8?B?bkdGWEt1NDd5VENiVlBJS1RKN21zZXVwbkM3VlFxTWxMVnpWQWdFNUxKckVS?=
 =?utf-8?B?QkdjL05jSzluM2dTTVRnWU9MM0ZNTkJ5ZG1RRk5vd0lXMUhxMFFhRG9hbFo5?=
 =?utf-8?B?THo3bGhkR2xCVFgvcWFjT1BEdWtZTDVPZVJmb3dMZ0ljVXJoUGo3RGF4Z1V4?=
 =?utf-8?B?QWtQZk8za0ZoTGtoemNEUUJLUVBNRHMvSkI5clNyS1NTN0hUbEI1SXBFOEl1?=
 =?utf-8?B?OEVuWGl4bDNxbkFNR0VRczEvQUZob0F3MlVMVFc0R2hHZTE2RTBBa1Q2c0Fs?=
 =?utf-8?B?TndQZ2J3ZmtUc2pLUkhhZjB6Q1lFYk91TWpRK2M4eWU2QTBleHZuMTh0cnpj?=
 =?utf-8?B?VGxBY1g2L05iUkNwNWNKa2taODFUWnM5ZWJQdFRkcEx2MEJRdGJYcDgrSDR4?=
 =?utf-8?B?QWEycmRKNGQ2a3RaSTdZR2dSTmZQZVRXQ0VEdU9qZStXN0VCQnpFQkdHZ3Ew?=
 =?utf-8?Q?XqPdk1HFKsnlsSlaVohGjW0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:13:08.7209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cbad06-a8ba-4b49-f689-08de5e5e37b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9557
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid,llvm.org:url];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0130AA01E1
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 11:31 AM CET, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jan 28, 2026 at 11:16:39AM +0100, Alejandro Vallejo wrote:
>> On Wed Jan 28, 2026 at 10:41 AM CET, Roger Pau Monn=C3=A9 wrote:
>> > On Wed, Jan 28, 2026 at 10:18:03AM +0100, Alejandro Vallejo wrote:
>> >> Hi,
>> >>=20
>> >> On Wed Jan 28, 2026 at 9:10 AM CET, Roger Pau Monn=C3=A9 wrote:
>> >> > On Tue, Jan 27, 2026 at 07:24:01PM +0100, Alejandro Vallejo wrote:
>> >> >> This patch modifies CODING_STYLE to severely discourage use of cop=
yright
>> >> >> notices when their presence is not legally mandatory.
>> >> >>=20
>> >> >> Copyright notices are redundant on commit, misleading from the tim=
e the file
>> >> >> receives contributions from anyone not represented by such notice,=
 and actively
>> >> >> harmful for attribution by the time the original code is long gone=
. They are
>> >> >> plain wrong when added on code motion.... the list goes on.
>> >> >>=20
>> >> >> All attribution worth keeping is version-controlled through Signed=
-off-by,
>> >> >> Co-authored and the like, DCO and the cumulative contents of git h=
istory.
>> >> >> License banners have already been superseded by the contents of li=
censes/ and
>> >> >> SPDX tags.
>> >> >>=20
>> >> >> Other FOSS projects have already moved away from explicit copyrigh=
t notices
>> >> >> where possible, and severely discourage their use when not.
>> >> >>=20
>> >> >> Apache and LLVM take active issue with copyrighted contributions a=
nd Chromium
>> >> >> takes issues with copyrighted contributions not attributed to the =
project. Some
>> >> >> Linux subsystem maintainers already frown upon copyright notices t=
oo, even if
>> >> >> it hasn't reached the point of being a mandated requirement yet.
>> >> >>=20
>> >> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> >> >> ---
>> >> >> The actual changes are almost verbatim from the LLVM guideline, bu=
t it's not
>> >> >> exact. Wording can be adjusted as needed. I care about the core of=
 the proposal.
>> >> >> Saying "please, drop the notice" on contributions where it's clear=
ly not a
>> >> >> legal requirement, or have the contributor state that it is a lega=
l requirement
>> >> >> and why. For fairness sake for all contributors to the project.
>> >> >>=20
>> >> >> I'd prefer taking the Apache approach for new contributions, but I=
 want
>> >> >> some discussions to happen first.
>> >> >>=20
>> >> >> Thoughts?
>> >> >>=20
>> >> >> Relevant examples:
>> >> >>=20
>> >> >>   - LLVM: They banned copyright notices, unless part of a vendored
>> >> >>     components.
>> >> >>     - Links:
>> >> >>       - https://llvm.org/docs/DeveloperPolicy.html#embedded-copyri=
ght-or-contributed-by-statements
>> >> >>     - Relevant quote:
>> >> >>         The LLVM project does not accept contributions that includ=
e
>> >> >>         in-source copyright notices except where such notices are
>> >> >>         part of a larger external project being added as a vendore=
d
>> >> >>         dependency.
>> >> >>=20
>> >> >>   - Apache: They banned optional copyright notices and relegated
>> >> >>             mandatory notices to a NOTICES file that also contains=
 an
>> >> >>             Apache copyright notice. See links.
>> >> >>     - Links:
>> >> >>        - https://www.apache.org/legal/src-headers.html
>> >> >>        - https://infra.apache.org/licensing-howto.html#mod-notice
>> >> >>     - Relevant quote:
>> >> >>         If the source file is submitted with a copyright notice in=
cluded
>> >> >>         in it, the copyright owner (or owner's agent) must either:
>> >> >>           * remove such notices, or
>> >> >>           * move them to the NOTICE file associated with each appl=
icable
>> >> >>             project release, or
>> >> >>           * provide written permission for the ASF to make such re=
moval
>> >> >>             or relocation of the notices.
>> >> >>=20
>> >> >>   - btrfs: They are highly discouraged.
>> >> >>     - Links:
>> >> >>       - https://lore.kernel.org/20220909101521.GS32411@twin.jikos.=
cz/
>> >> >>       - https://lwn.net/ml/linux-fsdevel/20221026074145.2be5ca09@g=
andalf.local.home/
>> >> >>       - https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/i=
ndex.php/Developer's_FAQ.html#Copyright_notices_in_files.2C_SPDX
>> >> >>       - https://lwn.net/Articles/912355/
>> >> >>     - Relevant quote:
>> >> >>       Let's say it's OK for substantial amount of code. What if so=
mebody
>> >> >>       moves existing code that he did not write to a new file and =
adds
>> >> >>       a copyright notice? We got stuck there, both sides have diff=
erent
>> >> >>       answer. I see it at minimum as unfair to the original code a=
uthors
>> >> >>       if not completely wrong because it could appear as "stealing=
"
>> >> >>       ownership.
>> >> >>=20
>> >> >> There's more cases of other projects taking similar stances.
>> >> >> ---
>> >> >>  CODING_STYLE | 18 ++++++++++++++++++
>> >> >>  1 file changed, 18 insertions(+)
>> >> >>=20
>> >> >> diff --git a/CODING_STYLE b/CODING_STYLE
>> >> >> index aae5a47ac2..97f80245ed 100644
>> >> >> --- a/CODING_STYLE
>> >> >> +++ b/CODING_STYLE
>> >> >> @@ -24,6 +24,24 @@ license, e.g.:
>> >> >> =20
>> >> >>  See LICENSES/ for a list of licenses and SPDX tags currently used=
.
>> >> >> =20
>> >> >> +Copyright notices
>> >> >> +-----------------
>> >> >> +
>> >> >> +Copyright for the code in the Xen Project is held by the respecti=
ve
>> >> >> +contributors. Because you (or your company) retain ownership of t=
he code you
>> >> >> +contribute, you know it may only be used under the terms of the o=
pen source
>> >> >> +license you contributed it under: the license for your contributi=
ons cannot be
>> >> >> +changed in the future without your approval.
>> >> >
>> >> > The usage of such direct language here, by using you to refer to th=
e
>> >> > reader / contributor, set a different tone from the rest of the
>> >> > document.  Maybe something like:
>> >> >
>> >> > "Copyright for the code in the Xen Project is held by the respectiv=
e
>> >> > contributors.  The author of the code is the owner of it as stated =
in
>> >> > the DCO.  The project cannot retroactively change the copyright of
>> >> > contributions, unless explicitly accepted by all authors of the
>> >> > code."
>> >>=20
>> >> Ack for the tone. The particulars of the wording might need tweaking =
even in
>> >> this version to constraint the scope of "contribution", "the code", a=
nd so on.
>> >
>> > Yeah, it probably needs even more integration to make sure the terms
>> > used match the rest of the document.  I didn't take much care into
>> > that, as I was writing this in the email reply and didn't have much
>> > context.
>> >
>> >> -----------------
>> >>=20
>> >> I have the same question for you I asked Jan elsewhere.
>> >>=20
>> >> There's 1 question in 2 forms I'd like to have an answer to from a co=
re
>> >> maintainers.
>> >>=20
>> >> Would you be willing to ack a change along these lines?
>> >>   1. to a Copyright Notice policy within CODING_STYLE.
>> >
>> > I'm fine with that.
>> >
>> >>   2. to the relegation of existing notices to a NOTICES file in the s=
tyle of
>> >>      Apache. Apache in particular mandates the file not be touched un=
less
>> >>      absolutely required for legal reasons.
>> >
>> > Hm, that might be more complicated.  I am however not a lawyer, don't
>> > expect the rants below to have any kind of legal base.
>>=20
>> Neither am I, for the public record.
>>=20
>> >
>> > What about the public headers in xen/include/public?  I don't think we
>> > can just remove the copyright notices from those files and place them
>> > in a top level NOTICES file.  Then OSes would copy the headers
>> > without the NOTICES file and end up effectively dropping the original
>> > copyright notices.
>> >
>> > Also, what about people importing files from Xen into different
>> > projects (apart from the public headers)?  If we remove the copyright
>> > notices the imported files won't have them either, and people is not
>> > simply going to pickup the top level Xen NOTICES and import it into
>> > their project?
>> >
>> > How does Apache deal with people importing their code into separate
>> > projects, do they mandate the NOTICES file to also be included as part
>> > of any code import?
>>=20
>> They do. It's part of the Apache license. See point 4.d:
>>=20
>> 	https://www.apache.org/licenses/LICENSE-2.0
>>=20
>> This would require some sort of ammendment to xen/COPYING.
>>=20
>> OTOH, to avoid being a PITA to Linux and others by changing how we do th=
ings
>> it'd be sensible to keep the existing headers on everything under xen/in=
clude/
>> public/ for being-a-good-citizen reasons.
>>=20
>> Anyone actively copying an internal file (say, msi.c) would thus be forc=
ed to
>> also copy NOTICES, but that's a heck of a lot rarer and not much to ask.
>
> Possibly a very dummy question, but won't our NOTICES file be fairly
> big and complex?  If we have to move every single variation of the
> different copyright headers we currently have in the tree.  We have
> GPL-2 only, >=3D GPL-2, MIT, LGPL, BSD... Each with a possibly different
> set of copyright owners.

Any licenses still around as banners we neither need nor want to keep. That=
's
what SPDX tags are for, and why we have them collected under licenses/.
Irrespective of the copyright amalgamation, licensing is still per file, wi=
th
each file having an SPDX line.

But yes, every copyright owner would need a "row". Unless we can contact th=
em
and ask for permission for removal.

>
> Also, would we need to somehow reference which notices go with which
> files in the tree?  Otherwise we would effectively loose tracking of
> the specific copyright owners of each file I fear.  Figuring those out
> would need to be done by going back to the last commit before the
> copyright notices were removed.

I don't think so. Apache definitely doesn't do that. They might reference w=
hich
file was imported, but that's the extent of it.

At most, I'd consider file+hash-at-its-commit so it doesn't need updating a=
nd
it reflects accurately the contribution at hand.

Conversely, when code moves around and files evaporate so do copyright noti=
ces
even though the copyrighted contribution is still around. It's not the file
that's copyrighted, but it's contents.

In any case, the first thing to do is to prevent MORE coming in. This can b=
e
a discussion for later when the set of existing notices is more or less fix=
ed,
possibly alongside another RFC with how a NOTICE file might look like. It m=
ay
very well be too unwieldy, as you suggest, and this discussion be moot.

I'll wait a bit for more answers before sending a non-RFC more carefully wr=
itten
version of this.

Cheers,
Alejandro

