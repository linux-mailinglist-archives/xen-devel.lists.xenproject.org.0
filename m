Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLxgK0b8iWluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:24:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1241E111DE1
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225613.1532159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpT7z-0000vp-SQ; Mon, 09 Feb 2026 15:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225613.1532159; Mon, 09 Feb 2026 15:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpT7z-0000uM-OX; Mon, 09 Feb 2026 15:24:43 +0000
Received: by outflank-mailman (input) for mailman id 1225613;
 Mon, 09 Feb 2026 15:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpT7x-0000uE-L6
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:24:41 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72fe64a3-05cb-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 16:24:40 +0100 (CET)
Received: from SA0PR13CA0001.namprd13.prod.outlook.com (2603:10b6:806:130::6)
 by SA1PR12MB6728.namprd12.prod.outlook.com (2603:10b6:806:257::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:24:29 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:130:cafe::70) by SA0PR13CA0001.outlook.office365.com
 (2603:10b6:806:130::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Mon,
 9 Feb 2026 15:24:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:24:29 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 09:24:26 -0600
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
X-Inumbo-ID: 72fe64a3-05cb-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/O6DFAOWGIhrYqF1tALyHQ+cZBAA+5ALyMv8ROqUU9I1YTBAGOAgtsxjoMWy1U0DGwIMuVC5IO9vdyjbbkcWp3iuuMT/d+mRLbURl5XtyRiIEEWzaw7hwjkumE2/axsRItsqXKO8I9AowRo/liODDZBCtDmzzR5bAo8EuGyzwvF+tpxGRpBNBYgaL9+rev3JRmuIwwfmeRtYz9IlD+TmPyUFtDY1Ad3Z1IIoEioaivotOc1m3kTy+g4ypF6O4VXaklZOSyV4RTmVw8+C02I6l4eEM69MY7bfasUt/gP3URK1ybELbw5AOFWfucxNwSEDDLUp9aLOZXZKvkAE9OHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fMWWQUBccgWkfSBLwgf2XCzwOW6dseuCIZp8QsjhLE=;
 b=b1EMDGci29mB5P7CV+m0vFEe/B6riM7zHcmSwNkv35opetH7QUOoqzHO5LqkK1R5rh+vXiD/ennhelzpunLHRovorrWKWVPT1/yKi/B2np8nOuk9XciEIN5G7ZEtieDSeNocXQeGQq+V0J2fpvwvPxenUE9aKL0KTLfXbUUwhXQIvzyxwqkVfqILJ1qhQVAspS8dU/yhFn5XqmAQ/5ZGTonnwJeeSlqGtMIbJPakx1DAGZELfYU3BuChqUGjLgDDmxmyOXi6krJ392sH4C0d0YrSY2zD0qjQRgR6z8stl16RWRq/QyflwpTL8sBY3YT9XQESo6Ldic7vlFmPaAxeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fMWWQUBccgWkfSBLwgf2XCzwOW6dseuCIZp8QsjhLE=;
 b=XoyiyOAecDDzJjbaBDGyVKnBwA71+uDx9SGd3HbHCFFBUeVFyOlnzo+n/m1JElEIl3sIhh9BB76sXoTTA2Boq//X3CdqgEXRE38Vgf3yZlZqxgmwJpoxn84uAuWimS2nNByxxs53Klicclyp1zdePy9ePlILnvYcPuJFjQmlBWw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 16:24:24 +0100
Message-ID: <DGAJ9XN03HPS.TC0OLO5PJN6H@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: Add Kconfig option for log-dirty tracking
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260209103118.5885-1-alejandro.garciavallejo@amd.com>
 <c5a9075b-6ed0-4778-b3ad-fe6647dad8b7@suse.com>
In-Reply-To: <c5a9075b-6ed0-4778-b3ad-fe6647dad8b7@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|SA1PR12MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 98931d58-d674-4b54-c127-08de67ef5181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVAyZTd6UmpZamQvVGpBVUFmZTIvbTNCMFhaaEtHdkZHaTA1bnNvK2ViL3Ey?=
 =?utf-8?B?UzdXUFVhNFJKZUlxdnZXa2dvS05Qd3RXZnkzL3dDQndBbHF3WkM4U2FFSjhl?=
 =?utf-8?B?S2pyV21TUEJ2N0VDNkJrVDUrR0hSYWM0UzNWVmF5YWw5NHBlaEgrTXVEUXly?=
 =?utf-8?B?cmRHdmhsSjdVcDlLSmdTdE5BSnJqYkxNTnkwc3N6QmdsUjZDcm05ejVISGNV?=
 =?utf-8?B?YTI0UzkxVmRWemtnVHIzWXNxcS9RUUZOZk5FL3dZU2hxU0puVEJqSVlhQUZq?=
 =?utf-8?B?NTBOSlVzRGNkZC8wWis2R0dIUmZocmh4V3VnUjM5amxJVkw0MjFSYUdnUFFR?=
 =?utf-8?B?NkVOTWZOVGF5VHJ5YUJvQkZ4Z3JvWko3SHRlOVFEd0U0dUgrTi9vRWZwTENN?=
 =?utf-8?B?UGM1emVtZjhyZERSbVk4TlMrWmpkYUdGSDBqUHB6SEhuQk0wUStJcW1lenA0?=
 =?utf-8?B?dXcrdlNaOTAyRHFaN0hVNzZtZ0lzWWxEZkJ0bXMrZ1ZCd1ZQeFFIdlQwNVA3?=
 =?utf-8?B?cW0vT01LVlduQmRxYzlFVUFvVHg5WFJVb0lCN3lwTjZlbi9qV1dOTittQUZO?=
 =?utf-8?B?T3hJNWhIckRLOHlCNDJoejFQZGh5cjB3TzJUemc3NE85UkhzMXlRZkVmeEs0?=
 =?utf-8?B?VkRmUGJiSHVxbkt0ci9uUzFoVUx0ZEpCeHFESVNWYXdFeDgrQlNJbGlXdWhQ?=
 =?utf-8?B?U3M1RWhPR3JnczZHK2ZYbE9MKzQvWVBtR21lMTRaOGNEbDN1cHNXUlNZUHRl?=
 =?utf-8?B?V1F5UHR6ZTBBdjh3aVViMDRHSloyVzZqZUxpRTUxLzVSVXh2U1FqUzJwQTdG?=
 =?utf-8?B?M05XRkc4dUhZUmNrL3JNcjRISkRJWUw0NEUrSVRjWU9aSEpoYmJvczhMTFY4?=
 =?utf-8?B?TzlweHphNDFNOGpLVWR1M25tMjBYWGRFcmxuM3RINmx0UWNQZWxod1JEeE51?=
 =?utf-8?B?TnU5ZG5NNXduN1E2MGEwcGpESk5ZMCtDUUtqVGZsQ01PdGttemJwWGhMeCtY?=
 =?utf-8?B?Sll2ejdWRmdybnNPMWVOKzRIckVORklxdFB0dXJkbXdUQVoxR1ArVHdBTlpp?=
 =?utf-8?B?UWpwS2lTNGc0K0FkNVFtNEJqaWdabzE1NTFrU1lIM3FYUXJRKzhCNFRqa2xv?=
 =?utf-8?B?T2dITk9ubmxIaDlXRVR0S1ZyOGZ1MjFzQXdZODNSS2J5cFdOblYweUNjNUxQ?=
 =?utf-8?B?V2RmNEx4NllteFJzYy9lL1d4QkdReEVVczBKbUJWdEpjeGN3QXJmS2NKcHgy?=
 =?utf-8?B?TzE2YjRyMDhERDIzcHR6dUdTRzdXUnY4T2F2MUtHc2FNQXdqV1RwT3FpM1d3?=
 =?utf-8?B?aWh2QkpyUlFWTHhKeG1rSko2bWJ6SnhEOFpKS1Bha0xyQTA3eUZBbERkd0hY?=
 =?utf-8?B?YVBVcGJwQzZrd1hkSkxBVldyOUZvOVNhcGJ4eTBNbkI2ajZMVWxKYWIra29Q?=
 =?utf-8?B?Z1JQRTlRQjRaeDZXbnMzVE1uV2owVUJ0WWhzYzBZemFjcW9XR3VEL1F1OWd0?=
 =?utf-8?B?ZzEvU2NiZTVZK2hGS0Q3d2tYZTFKOFdqQ2xHeWY3WTBHUGdpQWtQeU5YNEpn?=
 =?utf-8?B?enVCUE51dGxDejFoZEtFQWwrTHpSRVVOVDJ0VlpNQkc0YkpnM1JZcDN1TE5G?=
 =?utf-8?B?OEx0RzQvVnBBWXQwTG9DOElpMVU3UitvWFJHeFo3N01rZHJ3ZjViYkxaMUxp?=
 =?utf-8?B?YVRyWHd5QmZvUDBIQk5jVGc1NnZqNXVYZnVOMnZEbmpkSGhnSzlLTGlZNWRz?=
 =?utf-8?B?RVJweUE3OVI5UTFBeC95eHJKMFpGOFlDb1hRR2wxdlB1d3plZURndHNyYjhC?=
 =?utf-8?B?L3c0MzU0aWdWWHVXbEQ3NVdrbnkvY1lBT2RPR3dxKzVYVXRZdjhNS3paRHJT?=
 =?utf-8?B?YlVwTUVYVFNlK25pVEowYmVkelFiWExCYnlpN1FnVXI5TmtJWDAwNXRqczgz?=
 =?utf-8?B?QWdvMTJ2a2c2azJtRHFmSlIyUVF0R2cvTVVuR05BZzdPbmtYZjFIWkd1cHZx?=
 =?utf-8?B?MGlyK2FTaWdML0trZG85dVVBbVJGVzlBN1RvWndMZU9RY2NsMHNtZ0dWcG5o?=
 =?utf-8?B?b2U1aDVReVB5TGtiZDB1My8xZG5QSzI0TUVWa1FaWC83ZVc4b2gxNWFoK3F0?=
 =?utf-8?B?ajNYSjZOdCt2c1ltVEc5amZEUFp1aWg5QW8vRXJ6WDdIOHNxQlFiSUhsUllW?=
 =?utf-8?B?Rk9tdHVFd1hGRmdPdWFUejRYWlZCb3BYb3ViMjJCTW14cllCK3hhVjE3WkJF?=
 =?utf-8?B?QTVhbHh1aEJyNFI0RHhwcitvR0FnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MhZX64HhAePVtQiqy67OywHncaHYpTnE74WKLy8gSJvJIqfqwpQFeOEe9VDnSYzYOoLIkPK49HCQ2pjrax10RMTj9sTD1O3Dh3NAxoanhuIn5htT34fNAZQvViJquuWyIGNR5uAuSKPqB6Hafp/75ZZ5bDgYIVzxsT0FJqnteveqgf/zQScJNRCgTK+wB4f3o954/DJx1Nq9w/6uA7UKfmqRkGBhRj677wEC07N4hmP1D5JKlQiGKjSzaHQxDkn7eWljkZ6sokdDtHyRYhcjL2ShjwPAhd0kYz3M+UuJIjTLChulKQ6ZlqlLOgOSnGUwDOAuFPlPx4vhI+lVKKemZpK4DkbIQrKl5HMtdgQhLy16Lu622oag1NDRDFoGNzUzeD1z424xmjgMyaWXwOfVobWgl45wS0dTrhqYBwtIfZ+9ndNnHV26w694wEy1AUfq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:24:29.4892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98931d58-d674-4b54-c127-08de67ef5181
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6728
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1241E111DE1
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 3:48 PM CET, Jan Beulich wrote:
> On 09.02.2026 11:31, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -146,6 +146,7 @@ config XEN_IBT
>>  config SHADOW_PAGING
>>  	bool "Shadow Paging"
>>  	default !PV_SHIM_EXCLUSIVE
>> +	select LOG_DIRTY
>>  	depends on PV || HVM
>>  	help
>
> Why would this be? IOW why would shadow imply log-dirty, but HAP wouldn't=
?

The logic is rather opaque. I admit I'm a bit fuzzy on the uses of logdirty=
.

I know what it's for and I could navigate the code if a problem arose, but =
I'm
less clear about which other elements of the hypervisor rely on it (pod? ns=
vm?
vvmx? shadow? hap?).

If it's strictly toolstack/DM-driven maybe it'd be more apt to have a separ=
ate
LIVE_MIGRATION and SAVE_RESTORE configs where LM selects SAVE_RESTORE, whic=
h
selects LOG_DIRTY. That's also improve some defaults auto-downgraded from t=
he
max policy just in case a VM is migrated.

>
>> @@ -166,6 +167,14 @@ config SHADOW_PAGING
>>  config PAGING
>>  	def_bool HVM || SHADOW_PAGING
>> =20
>> +config LOG_DIRTY
>
> PAGING_LOG_DIRTY?

sure.

>
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -220,15 +220,15 @@ long arch_do_domctl(
>>      {
>> =20
>>      case XEN_DOMCTL_shadow_op:
>> -#ifdef CONFIG_PAGING
>> +        ret =3D -EOPNOTSUPP;
>> +        if ( !IS_ENABLED(CONFIG_LOG_DIRTY) )
>> +            break;
>> +
>>          ret =3D paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
>>          if ( ret =3D=3D -ERESTART )
>>              return hypercall_create_continuation(
>>                         __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
>>          copyback =3D true;
>> -#else
>> -        ret =3D -EOPNOTSUPP;
>> -#endif
>>          break;
>
> Can a HVM-only hypervisor create any guests with this? I simply fail to
> see how XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION would then make it through to
> hap_domctl().

xl doesn't seem to call it at all. hap_set_allocation() is implicitly calle=
d
through paging_enable() -> hap_enable() -> hap_set_allocation()

>
>> --- a/xen/arch/x86/include/asm/domain.h
>> +++ b/xen/arch/x86/include/asm/domain.h
>> @@ -226,7 +226,9 @@ struct paging_domain {
>>      unsigned int            p2m_pages;    /* number of pages allocated =
to p2m */
>> =20
>>      /* log dirty support */
>> +#ifdef CONFIG_LOG_DIRTY
>>      struct log_dirty_domain log_dirty;
>> +#endif /* CONFIG_LOG_DIRTY */
>
> Such an #ifdef can likely replace the comment? Or else the comment would
> better also live inside the #ifdef?

true.

>
>> --- a/xen/arch/x86/include/asm/paging.h
>> +++ b/xen/arch/x86/include/asm/paging.h
>> @@ -55,12 +55,9 @@
>>  #define PG_translate   0
>>  #define PG_external    0
>>  #endif
>> -#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>>  /* Enable log dirty mode */
>> -#define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_s=
hift)
>> -#else
>> -#define PG_log_dirty   0
>> -#endif
>> +#define PG_log_dirty   IS_ENABLED(CONFIG_LOG_DIRTY) * \
>> +                       (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_s=
hift)
>
> Need wrapping in parentheses then.

true.

>
>> --- a/xen/arch/x86/mm/hap/hap.c
>> +++ b/xen/arch/x86/mm/hap/hap.c
>> @@ -50,7 +50,7 @@ struct hap_dirty_vram {
>>   * calling p2m_log_dirty_range(), which interrogates each vram
>>   * page's p2m type looking for pages that have been made writable.
>>   */
>> -
>> +#ifdef CONFIG_LOG_DIRTY
>
> This wants to move further up.

sure

>
>> --- a/xen/include/hypercall-defs.c
>> +++ b/xen/include/hypercall-defs.c
>> @@ -194,7 +194,7 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op=
_buf_t *bufs)
>>  #ifdef CONFIG_SYSCTL
>>  sysctl(xen_sysctl_t *u_sysctl)
>>  #endif
>> -#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV=
_SHIM_EXCLUSIVE)
>> +#if defined(CONFIG_LOG_DIRTY)
>>  paging_domctl_cont(xen_domctl_t *u_domctl)
>>  #endif
>>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
>> @@ -292,7 +292,7 @@ dm_op                              compat   do      =
 compat   do       do
>>  hypfs_op                           do       do       do       do       =
do
>>  #endif
>>  mca                                do       do       -        -        =
-
>> -#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV=
_SHIM_EXCLUSIVE)
>> +#if defined(CONFIG_LOG_DIRTY)
>>  paging_domctl_cont                 do       do       do       do       =
-
>>  #endif
>
> The CONFIG_X86 part of the checking wants to remain: Another port may als=
o gain
> a setting of this name, without necessarily having this auxiliary hyperca=
ll.

Hmmm. Makes sense.

>
> Jan


