Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEiTJIHJcGkNZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 13:41:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A656F03
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 13:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209688.1521623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viXW6-0005Xs-L2; Wed, 21 Jan 2026 12:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209688.1521623; Wed, 21 Jan 2026 12:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viXW6-0005Ws-GH; Wed, 21 Jan 2026 12:40:58 +0000
Received: by outflank-mailman (input) for mailman id 1209688;
 Wed, 21 Jan 2026 12:40:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viXW5-0005Wh-4R
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 12:40:57 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6caef466-f6c6-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 13:40:54 +0100 (CET)
Received: from PH0PR07CA0048.namprd07.prod.outlook.com (2603:10b6:510:e::23)
 by CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 12:40:49 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::4a) by PH0PR07CA0048.outlook.office365.com
 (2603:10b6:510:e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 21 Jan 2026 12:40:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:40:49 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 06:40:47 -0600
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
X-Inumbo-ID: 6caef466-f6c6-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq+nk7Dln4/a8KblEwSl5xVkI+scHN01i3Wx6rFbjcB5yt3jpWXxw62JqEt+56su+UqXJLyV4R/I95v6+oRIKxZLihm8LNYuEoqtYoQWB4tkMmC72WJB1jdDrTt0PhgfJQrumhDCTaqALJEemNg+5xdaT27QsvtknIpuw/Grzr0+Z0ZuJ5TicpacyeXFS6Z8HMbcTZ0MbQUGPZ3poXmst0YC6LwRWS/mZOJcmWlvzJtnrSBsZi2z2diHLGDofT9/u8iBx+oB2qOQPSFVcFPbxenGh9Q93xJTdELwFST7OPFskaHW76xmzxWL3khVLefqgeDzWMBESoWH3e9RJJ4DAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDTbiEe+7vOD9nVnUGjI676FssFr+cbGLwlghSkzKGE=;
 b=U36/n7M0VPRs8mo1qz5PmSeNRriHuweOg3E1vjCTxlMH8san/qDCC5JHivj8ysqE1jmXn4sAO87HbP2LNtZhmlMBkxHBI41ybxEd29BncgJKMNumzRlFaymCoGL7CBKFR+k+fAngY/JHrpsG21jP8jbsuXdVR0c6bPMwokJyyzeIY8xPg5uz1Zb8XneY+D5947JXdcYoj5rIxTfNZjqdP3gE33wnJoblZ2Kr2ngdm/KSemlbE6kD9VGcqTCvsQNYMaZWNUtKCTmpNv/8lPNPJ9F8rZ/XwLI01sJCJCip8cZsYZZw3l1mq7ccA7rw+WN7r8DTiVylpQwgp68aV51rVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDTbiEe+7vOD9nVnUGjI676FssFr+cbGLwlghSkzKGE=;
 b=xjtFECg14/nGTu406BkEownZLqsWmWD3KeuSqG5n0AWf+7RP1tJnLXW7jOO16OQdyC0PFODV588WtOsfSkK2+ov7lf5Qx6RUMUcfSYi4VuctPlIG7+QoAG8gFRns/NK6LcdHwGheP1LyOBsM6PRB9Ng6jDq3qYMjC72EGmSaua4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jan 2026 13:40:45 +0100
Message-ID: <DFU9WAGCWK27.1UYPR2JSWZHKF@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86/svm: Add infrastructure for Bus Lock Threshold
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-2-alejandro.garciavallejo@amd.com>
 <9097240c-a892-41e8-a686-b89d84d0c03f@vates.tech>
 <dd7404b4-7f31-4189-937a-0278eb54bb2a@suse.com>
In-Reply-To: <dd7404b4-7f31-4189-937a-0278eb54bb2a@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: ee34a112-950b-49ce-1d99-08de58ea4e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?andDaE1uRWdKSkhJV1ZvUTVrTndJQVRFei9tdDFHcTFPbTllVzBYQzhrMVpv?=
 =?utf-8?B?dlFoMnZhSjNVVU51TzJXNFczdlR3YTZMejlVM1Jucm9Dd1NROGNxVmRuWGxS?=
 =?utf-8?B?NHBjQVZQbFM2WVFKVGtFNDVGY05yc3U4M1hRcGM0QkhHMGFKb2p6eUdCRzEx?=
 =?utf-8?B?WlN6Z1NjLzNhcThOOGZjNlRYekRPc2RHYTVnOG9zT0RkWUF0eWpWQWc2b3N2?=
 =?utf-8?B?RHZNd3ZoVzVVUlJqbW9IMDRURGZpZnc5dkRvWHJXaFNPbGdvOEhweEl6eHhP?=
 =?utf-8?B?WndUSVpqdDhyVnEydUZQMG1JZEFWZjV3YUI5dkdTRVV5Z0c1SE4vMmU1SzZp?=
 =?utf-8?B?cGVsRUtFUW9mWTRPQTdVc3lISkhyV2RCNXJSTmlOVkpyVVdDdnhSeXNUaEVZ?=
 =?utf-8?B?UnFpTHlRMHFxNWNzUHp5ZnFtUnFDVnJmWGdGZi9ZVTJtN2V4eEJ1Nm05R213?=
 =?utf-8?B?c1VzM3cwbHdmdTRzUDRJa0F3S0trTkRWM3JyQ3ZBQzNFMGtDRDVuOGcwTGZ1?=
 =?utf-8?B?c3p5S2h4SWZPYnhWRmJqc0R1cGdlOVJJamxDQWdNVWJMVVAvSit6RmFtU244?=
 =?utf-8?B?bFZKRE9EUlhsb2J2UXEycUVtcDNoUGZSYU1zSElUOWpDbEo5NGNoT1EzeG41?=
 =?utf-8?B?R0o1VnMzK2pjR0xSN2kyOC9OOGYvWFhvS1R5VWVjYmxESXMzVFJ3ZEtZWXNW?=
 =?utf-8?B?NFQwUjFCL0YyUU9TTW5wc1VRQ3haSHJjditsaVFCclhUT3Q1Mmg2dXNwQnVK?=
 =?utf-8?B?VU1wQ1BHOSszSkNjY29LazhkMDNvWDBnNDdVOXltekI4SVhUVXZVUEtRZlow?=
 =?utf-8?B?M3hBZUVIdU5nL1hpWmF3Q0RCSFYxWVlhbWNMVnFDQTJncGhYTTFpRDlXaG11?=
 =?utf-8?B?SFBRTnVsRXBKTFV5ZWhNTHNsTnRFdmNZeVFqUGxQbWZhaVFsNkttcnZSUjY3?=
 =?utf-8?B?MGM5SXlucDUzODk2OWFoWUg5WlcwRDZ6QmVEZHloejBWclYyeWVGc0JPYVRB?=
 =?utf-8?B?WjhabUsvZWZZYy9DVkplay9lQXRNdkp2U1pOUzFEWld0WTg1c1JpTXprdW5U?=
 =?utf-8?B?THMycXJFREFhcXh0cWhRaDJLWW5HdUFYbGl3UUprd1JCT2l0ZC9xVE5LTGNK?=
 =?utf-8?B?T0hjd0YzMG1yakdPWGp2Q2Fjblh3WDJxMmQ0TWNzVmpiUXkvM3VFQkdNWnp3?=
 =?utf-8?B?aHkvM2hQNDk4MC9PcHVURGRoWExWUWxxbzRXQnpiWEJFK3N6RVZaNFRnaWxN?=
 =?utf-8?B?SldhcFNrNzhCcEdGaW50ak5XOEFwZHdUM1VBL1A3bGxSU3ltTlZUVS9XQkpa?=
 =?utf-8?B?TmxFM2tpakU0YlAxTVR6Z3g1ZGhVKzBKZUxpZStkVlNuRGFtVzBnR2VCWHdr?=
 =?utf-8?B?d05ZZ0FhdEhYai8rWUVrem5Lc3h2QTI5VnNxQzZSdTJhSkJiRDZoMVA0TmNU?=
 =?utf-8?B?bmZDMFlhMk40Z0JjQTNYeFBINTRNK3orN0UwTTdvcUNzV2FsanY1MkVYQ1F4?=
 =?utf-8?B?NmxTZ1krNzdUbWFsVi94ZUd1YjJVUmxybGNtSHVEdXFsVUxvNW5YWWJrM1Jk?=
 =?utf-8?B?WjBTUXpXMHQwSDR3ck5TdnhvZGJROTdsQklGL1lRN1RkeEUyN1lJZUExUmFQ?=
 =?utf-8?B?dDUvMHR1TEFVczRJeGNBNG1TcG1TZi84WE1MMTBZTGh0R09PU1B4VHVDRTNZ?=
 =?utf-8?B?KzNTSzkySDVTbGh6SUJFMHJjMUpEcE9HdW5QK3Y5bzZ3OGg3WFVoOE5NaCtM?=
 =?utf-8?B?M2J2aVljYUNWNCtzZUVTUndaWkhsMU85TEMvNTc5ZGFaQVdpcktMTEFhL3ha?=
 =?utf-8?B?RUltRWkweTc2ZHkxV05HcHFhS04yeHROZTdHNkhhbUlWZGpmTWVHcVg0VEha?=
 =?utf-8?B?MEdvamJTakRjN0pMOU1TUXdtcWRBSVhoN2JXSlBLVFF1M2FSRlpaVDRCMXJw?=
 =?utf-8?B?NXFZY2VPaVhHZ1NvcHRqS2NBKzZpcmNha2dYbWZVenYvbVk2RjgwTEllTTBo?=
 =?utf-8?B?ZWh3TVFoV21FcDhBUUVuRkV6Nm5Oc1lEVFpDb2NOV2VhRkdvdkpNUDZ1Mmxp?=
 =?utf-8?B?MW9mcXhKb1VnQTdqcWV5L08rMGlxRGpOM1VTUmRTRzN5bnpoeFplYnRXMWVa?=
 =?utf-8?B?Z1pGZGY1RGtuS0VFYTdTZkxzMWo5WWE2alF1TFhON2h3bTJINHhPNlpkaS9Z?=
 =?utf-8?B?ZGtpVXBXVFdiSG9zbzFiemJPYTJBaDNjd2xaK0dHL0JneDdnVHRab2F1Mi9H?=
 =?utf-8?B?RXBJOVpETWcvKytoeHFsOVhMTUtnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:40:49.0926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee34a112-950b-49ce-1d99-08de58ea4e43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E38A656F03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 2:30 PM CET, Jan Beulich wrote:
> On 20.01.2026 14:19, Teddy Astie wrote:
>> Le 20/01/2026 =C3=A0 10:56, Alejandro Vallejo a =C3=A9crit=C2=A0:
>>> --- a/xen/arch/x86/hvm/svm/vmcb.h
>>> +++ b/xen/arch/x86/hvm/svm/vmcb.h
>>> @@ -65,6 +65,11 @@ enum GenericIntercept2bits
>>>       GENERAL2_INTERCEPT_RDPRU   =3D 1 << 14,
>>>   };
>>>  =20
>>> +/* general 2 intercepts */
>>=20
>> nit, you want to says general 3 intercepts
>
> And then, further nit, also get comment style right.
>
> Jan

What do you mean by comment style? it's a /* ... */ oneliner that matches
what the other general intercepts say. What am I missing?

Cheers,
Alejandro

