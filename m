Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHvLMTwvi2lEQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 14:14:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277D411B257
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 14:14:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226394.1532918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpnZ9-0003e3-Ng; Tue, 10 Feb 2026 13:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226394.1532918; Tue, 10 Feb 2026 13:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpnZ9-0003ce-KW; Tue, 10 Feb 2026 13:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1226394;
 Tue, 10 Feb 2026 13:14:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBUt=AO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpnZ8-0003cX-8S
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 13:14:06 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ec94871-0682-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 14:14:04 +0100 (CET)
Received: from SJ0PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:33f::13)
 by SJ2PR12MB8783.namprd12.prod.outlook.com (2603:10b6:a03:4d0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 13:13:56 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::5b) by SJ0PR05CA0038.outlook.office365.com
 (2603:10b6:a03:33f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 13:13:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 13:13:56 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 07:13:54 -0600
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
X-Inumbo-ID: 5ec94871-0682-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZ/GhgxNN+gZXKOUeS0+Pn3jDzj4zmy7gFjjffVutLPLRzfGj6o9bqlJuLuBUlR1nK45TbC4tr8lFc4UxwflrBa7kh6ziwx95V5jLK/dLLLJ615V4xOL4lTG9rHwEkH/6yQAh5kpBsO9CjhnBzY324/cgfjRE6p3itjpa4MMjj84hEZFU9JdJDyt/mYCuT+yKPQ9fjEPHqDZC4ldf+pGxcEcPjyOSXmr4almHzPK6d10JXn7KupTO7kUjAbqZnZRsw0gVGImMWyKJ8hX0UbO55cJ9x47HtJb0QGius0IW25A49kN4E8kd+uIrgGwrZ4rw7gZBlfwupQmbI/RSgDqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVC/1Nt6dIfIwr1rIFI/h9TRiDzbKb+lNLnMutHE8kI=;
 b=YEqSxPzfoq2eXyMQzxu+oeQPsNsybm7v/QYlc7mqLEVvDKfpPSwERBinHatWnWUMtF9OcREQ/yWkaQkk7MOk2LBidCPoKSzZ4Vzfuk49XmxZNKn5+uegNjsLuUdNpq8XN1W0EJhSjgiDrTMmFkP5sd+fD8Du52QqjXFgDgz0mLW+gu4mn5jW5Lm65V5q6Me1PM8BcaJAG7lSQ2W6HGnCkcAlZLoeR/2JFzTouPGR5elGE9KxKDychHqYcIdD0XPjv8RktPnr67ArXomyAna5x7sRLiaQReMrw+9jdR7Z+cnl+meQ0vrjnfGK3nKM6dS/VXGwY/Tj2VBlVxieVyd8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVC/1Nt6dIfIwr1rIFI/h9TRiDzbKb+lNLnMutHE8kI=;
 b=uZ03oGIspYP/XmxseOMiyodV4vv34VCmV7wtfBAMyn6W8NjSc2oQJF+k6FPImXak13yrocsW5cN4crLoZ4CIu9DctLjOt702cSz+crvOUy1wHXs1xP1TUEkxT7bsdG2LmK4oJ/1yfjBzGFPok1PsSG/6Thp/KPGjnkPO5mpP9MU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Feb 2026 14:13:52 +0100
Message-ID: <DGBB4JCFAPUT.GTAWF68EZP9Q@amd.com>
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
 <DGAJ9XN03HPS.TC0OLO5PJN6H@amd.com>
 <1c33beef-f638-4e62-b38a-8b79575adf18@suse.com>
In-Reply-To: <1c33beef-f638-4e62-b38a-8b79575adf18@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|SJ2PR12MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e16ff74-259b-4ee3-c6d1-08de68a63f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjVINDhWVmhuL2llMURDTmtBdXNrNzh1SWVkbmczR0twbFkzaG9KTkVJem9P?=
 =?utf-8?B?UXVxOGQ2RFIwR0d5RFNROG5Ua29OMGZkY0FFcUI3WDJpS3N0eWJDRWtVZHY5?=
 =?utf-8?B?U2REcnVOYVpjNjRrYXVBZStKajFJaWgxMDhsbUZtR0ZlNyszQ0ttWjhpZ3pq?=
 =?utf-8?B?WjdlZENlTTF3ODZ1WXV3TG5iQnZIenhPMW1lRk0xenpIQm41V3lQN0dPWnFk?=
 =?utf-8?B?MjNaNkhrMWFYY3k3UHdsaHQ5UG9BRzhUakJpZ3A4UXpMZ0lxSG9Xa3h5WnlB?=
 =?utf-8?B?Ylorck1ja2hCWUdJeTBNbzBYRzVsMjZ1V29ZRlBzb2FIUzBlYVFpVnhBREpu?=
 =?utf-8?B?ZWJ3SHgrMGl5RTczbXBOdStGWGI3UTJITzF4QlQyclFHTC9EU0NyRFhlZzQ1?=
 =?utf-8?B?ZWNONHJ6M1c0NWZQR1BLbk9TK0NPZFMrOXpLUXQ0cnBpdkt4YjZNQXJjVVIy?=
 =?utf-8?B?VFA2RjVQT1Iya1JaOG94ejJLU3FCN3gvcmhLa0NKSVM3NksyVnViUGhsVnVD?=
 =?utf-8?B?bFFDMGlHaGpxQTIwNW05R0cwUldOKzBVQmx0cnp3eEdmOW9hc3ZHa2ZOQTlO?=
 =?utf-8?B?VHUwRVFVVlZOMm92Q3h6aHF6TTVidHFXMVp1OHF6V1NOTHFwMktPcmFPR3lJ?=
 =?utf-8?B?L1FQQnA3cW01eFpNbmtuNGIvUnhxYy9tbnBxVjZHUURYZVFYMTJqcjByTG9S?=
 =?utf-8?B?bkwyUTlCWlVlWkdSTnc3NklMc3E1d3JiYlJTVG9lWlREOHJaTGhXMnZ0VFlX?=
 =?utf-8?B?MXB0azJEdlkxa1hISmlPSjhzbmJkdXhtbENxTEVrSXN0SVlWSHJ6aUhPaXFC?=
 =?utf-8?B?NGZTRWpjV0pVcTRhV1pQcnluZUl5bmhkMXVDVHNwRUkwU1Q5UkcvbDhwZXRC?=
 =?utf-8?B?ZytpVjFmQjZpYmFVVEM4Y256dTRNYzV1WExlZmR5a1hoeCtuSE5BVXIxbk9I?=
 =?utf-8?B?dFlXS1JhUTRkS05sYmlONGt2QkxWT2JPaDVNckZvaHl4ZjNqQkRMTnN0RThv?=
 =?utf-8?B?bVd5ZnpUQzdNMkwyd0FDaDRwakUwMEZUY0lST0tjUnZVaVRRUVZzWjJRdVpv?=
 =?utf-8?B?dU1VaW52TEt6MlcwN0JEa0lqeHpNZmIyKzNXUWplVVZOTWxTVXJLQkR5bmZQ?=
 =?utf-8?B?dHZzenNBdThheUtmcjNyQWYvaTErOEVZQVVYMG1yVHRDQ2VJMlNGV0ZLZHFx?=
 =?utf-8?B?b0o1RGg0RGFMZjdrQkJpNXdCdjBSWTdrRHM1ZXVhMG95UElmYVBGVld5dVNI?=
 =?utf-8?B?WmMzWnlQU2k3QnVna2x5SzlDRzJCRUREM2tneHFlaG5jM1kyeklWSExyY1h0?=
 =?utf-8?B?dHdXcHRybFZNcXFmNVB4ZkxlMjc2dkc5aEtiUjc3am1TTUU2a2RpeldNSlZM?=
 =?utf-8?B?Wm1ORnRBZ2pzTmIwOExjZVJKYysrNnR5Vkt5L0FYOEJVS29MT0VWQ2ZvMHB1?=
 =?utf-8?B?K0dBT1o3T1l0RmVEYTBzdUlQUzVrcGtGckRsTVZLTGZOSFE4ZmNIcHA4WTJw?=
 =?utf-8?B?eUN6cS9kYkhJV0Z6Vm5iRUg4Y05mV0tmRmNMVGl3U1BwTHhVVDFOUmh6MnFC?=
 =?utf-8?B?ZzVqZXdFUHBSNDAwYUx0aUd5TFZKTkVkM1ZFTXZZVmZPaE1YVE1sdk8zSGJ6?=
 =?utf-8?B?cGxJT2hVRit5d3RQTTlWZ0oyaG8rSk9HR3p3UTdCQklnS3BVaTI1RmlsT0xC?=
 =?utf-8?B?QXJmaUhUaEhSSWZxVGczRnZJMDF4TXY4U1QvZmRBR21NZXNaSTR1TWF3SnRv?=
 =?utf-8?B?QU9EVTZSbXhVdGxmVXo3d20vdkFCVFJEQkUwVmpIM3dXOWZCbEVxMUFpOWdP?=
 =?utf-8?B?dlk5UTBValFLOXpSdVFpeDQwNTh5V2J5bkFodzRZOERkSHh0SHZMM2lyQlNr?=
 =?utf-8?B?Y3M1enBXc01USCswRklNRUJLVGM2VEdibi9YWWJxSFZEYnBFUm1TSXpVTlRz?=
 =?utf-8?B?Z3ZTbzY3QU9ZMStDVkozSmYyNyszZEx3NVBZVitWNmpwMVpqSExVdThQOG1v?=
 =?utf-8?B?M1BGemdNQjJKdTdPTXpzQ21LeGlGc0t4OXkybkhRcVFqRTRjSFNPckdRcWdP?=
 =?utf-8?B?cDN5UUNtVFYrSTVnNWVMd1pvQUpZUmRwakkrU1N4QnhCZ3ZXWWhicUQ1V0N1?=
 =?utf-8?B?K1FiYjRqMG0vR05uY1AvNVg3T2p3NHJUQkJ2czEwb1h1cVQzNWwyWHBReGln?=
 =?utf-8?B?NzA3SkZuVXVWWG0xRGRNb0QwWGNFcXc1ei8yK2tyQXhNYTBmV0RvaXJ2Q0lH?=
 =?utf-8?B?ZXNIdU5sazhtWnVRdmVGUEx1d3NnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	85HOe2OEfwpbyQTSzEbQ6oj125o3CrDZ0D68MYbJmZuZYH7ycKwGQLPHub3aO07ZUhXZ770X9t6k+yQIGeXtL/D2+HmYf1Ra7hsjFUo2Yu27bFMfcx0kVNfebkuzfXlUTScBut8Gy7XRzs3e8X7zhXPwrJvZxLJOZ9dyXtBTB/TpZT0sYJ4myNsvlqwwLtvxVOFbR2yyDYkpA3DC5DAQtEQpYvVJTDwjEchdMrDIi35oHu84bqOe71CJrYNP7Em4rrLiOKc06BpAfP58Yt7CXA3YASAQXZ0ywByHjdnIvjB7btDHmm1D/rwtsTitHdv1fpURf79eU0NBZI75/11kNQcj1d7VdI2G9FUZ5OWebroaYA4yu3BNtNFVXcmFHWPYZCMTnVkV6q+vPI+89f8QKaZS6OPvdZVMm9bpXimjZfrGlx0NB70kYkMzAk5KQWYy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 13:13:56.5419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e16ff74-259b-4ee3-c6d1-08de68a63f29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8783
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
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
X-Rspamd-Queue-Id: 277D411B257
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 4:55 PM CET, Jan Beulich wrote:
> On 09.02.2026 16:24, Alejandro Vallejo wrote:
>> On Mon Feb 9, 2026 at 3:48 PM CET, Jan Beulich wrote:
>>> On 09.02.2026 11:31, Alejandro Vallejo wrote:
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -146,6 +146,7 @@ config XEN_IBT
>>>>  config SHADOW_PAGING
>>>>  	bool "Shadow Paging"
>>>>  	default !PV_SHIM_EXCLUSIVE
>>>> +	select LOG_DIRTY
>>>>  	depends on PV || HVM
>>>>  	help
>>>
>>> Why would this be? IOW why would shadow imply log-dirty, but HAP wouldn=
't?
>>=20
>> The logic is rather opaque. I admit I'm a bit fuzzy on the uses of logdi=
rty.
>>=20
>> I know what it's for and I could navigate the code if a problem arose, b=
ut I'm
>> less clear about which other elements of the hypervisor rely on it (pod?=
 nsvm?
>> vvmx? shadow? hap?).
>>=20
>> If it's strictly toolstack/DM-driven maybe it'd be more apt to have a se=
parate
>> LIVE_MIGRATION and SAVE_RESTORE configs where LM selects SAVE_RESTORE, w=
hich
>> selects LOG_DIRTY. That's also improve some defaults auto-downgraded fro=
m the
>> max policy just in case a VM is migrated.
>
> It's save (not restore) for both PV and HVM, and VRAM dirty tracking for =
HVM
> only. Ordinary HVM guests will want VRAM tracking, so compiling out suppo=
rt
> for it will imo want mentioning in the Kconfig help text.

ack.

>
>>>> --- a/xen/arch/x86/domctl.c
>>>> +++ b/xen/arch/x86/domctl.c
>>>> @@ -220,15 +220,15 @@ long arch_do_domctl(
>>>>      {
>>>> =20
>>>>      case XEN_DOMCTL_shadow_op:
>>>> -#ifdef CONFIG_PAGING
>>>> +        ret =3D -EOPNOTSUPP;
>>>> +        if ( !IS_ENABLED(CONFIG_LOG_DIRTY) )
>>>> +            break;
>>>> +
>>>>          ret =3D paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
>>>>          if ( ret =3D=3D -ERESTART )
>>>>              return hypercall_create_continuation(
>>>>                         __HYPERVISOR_paging_domctl_cont, "h", u_domctl=
);
>>>>          copyback =3D true;
>>>> -#else
>>>> -        ret =3D -EOPNOTSUPP;
>>>> -#endif
>>>>          break;
>>>
>>> Can a HVM-only hypervisor create any guests with this? I simply fail to
>>> see how XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION would then make it through =
to
>>> hap_domctl().
>>=20
>> xl doesn't seem to call it at all. hap_set_allocation() is implicitly ca=
lled
>> through paging_enable() -> hap_enable() -> hap_set_allocation()
>
> xl must be calling it, at least in the case where the paging pool size is
> explicitly set in the guest config. The important point is - not all of
> XEN_DOMCTL_shadow_op's sub-ops are log-dirty related.
>
> It's also odd that you did make changes at the call site here, but then
> left the called function (and its sibling paging_domctl_cont()) in place.
>
> Jan

That goes through DOMCTL_set_paging_mempool_size. With identical behaviour
except it uses a different op. Blergh.

There are no uses for shadow ops other than logdirty that I can see.

libs/guest/xg_sr_save.c:    rc =3D xc_shadow_control(xch, ctx->domid,
libs/guest/xg_sr_save.c-                           XEN_DOMCTL_SHADOW_OP_ENA=
BLE_LOGDIRTY,
--
libs/guest/xg_sr_save.c:        rc =3D xc_shadow_control(xch, ctx->domid, X=
EN_DOMCTL_SHADOW_OP_OFF,
libs/guest/xg_sr_save.c-                               NULL, 0);
--
libs/guest/xg_sr_save.c:            rc =3D xc_shadow_control(xch, ctx->domi=
d,
libs/guest/xg_sr_save.c-                                   XEN_DOMCTL_SHADO=
W_OP_ENABLE_LOGDIRTY,
--
libs/guest/xg_sr_save.c:    xc_shadow_control(xch, ctx->domid, XEN_DOMCTL_S=
HADOW_OP_OFF,
libs/guest/xg_sr_save.c-                      NULL, 0);
--
libs/light/libxl_colo_restore.c:    if (xc_shadow_control(CTX->xch, domid,
libs/light/libxl_colo_restore.c-                          XEN_DOMCTL_SHADOW=
_OP_ENABLE_LOGDIRTY,
--
libs/light/libxl_colo_restore.c:    if (xc_shadow_control(CTX->xch, domid, =
XEN_DOMCTL_SHADOW_OP_OFF,
--
ocaml/libs/xc/xenctrl_stubs.c:  ret =3D xc_shadow_control(xch, Int_val(domi=
d),
ocaml/libs/xc/xenctrl_stubs.c-                          XEN_DOMCTL_SHADOW_O=
P_GET_ALLOCATION,
--
ocaml/libs/xc/xenctrl_stubs.c:  ret =3D xc_shadow_control(xch, Int_val(domi=
d),
ocaml/libs/xc/xenctrl_stubs.c-                          XEN_DOMCTL_SHADOW_O=
P_SET_ALLOCATION,

Not even for shadow, which seems=20

There's an ocaml stub, but I can't be bothered to check whether XAPI uses i=
t.

I'll leave around the domctl so XEN_DOMCTL_SHADOW_OP_OFF doesn't return
-EOPNOTSUPP, but set/get allocation should go away at some point before
stabilising the control interfaces.

I'll also remove the bad #if PG_log_dirty gating these, as it really just w=
ants
to be !PV_SHIM_EXCLUSIVE (that's why I originally got rid of it all).

Cheers,
Alejandro

