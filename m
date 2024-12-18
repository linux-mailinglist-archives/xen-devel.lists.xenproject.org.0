Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10569F6BCD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 18:03:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860675.1272678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNxRQ-0003g0-Aq; Wed, 18 Dec 2024 17:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860675.1272678; Wed, 18 Dec 2024 17:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNxRQ-0003eV-5e; Wed, 18 Dec 2024 17:02:32 +0000
Received: by outflank-mailman (input) for mailman id 860675;
 Wed, 18 Dec 2024 17:02:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjqD=TL=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tNxRN-0003eP-Sh
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 17:02:29 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dae6658b-bd61-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 18:02:26 +0100 (CET)
Received: from DM6PR03CA0001.namprd03.prod.outlook.com (2603:10b6:5:40::14) by
 CYYPR12MB8855.namprd12.prod.outlook.com (2603:10b6:930:bb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.22; Wed, 18 Dec 2024 17:02:19 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:40:cafe::16) by DM6PR03CA0001.outlook.office365.com
 (2603:10b6:5:40::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend Transport; Wed,
 18 Dec 2024 17:02:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 17:02:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 11:02:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 11:02:17 -0600
Received: from [172.18.155.234] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Dec 2024 11:02:16 -0600
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
X-Inumbo-ID: dae6658b-bd61-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFVa/vHc7lqhln4BJCZV8viCld7QIBKla/e6aN5hHstZJp9zdca8DLoJVdEfPeGB4XkW6GKI2N/o3pba9vwaeSZFRXArLz9N1rKLpZe5I0bobUep8T2Q1liuEM5gz1cRnU5bqkcRNDwdXE5UONZrdMrU+ogjAqvLYC/CObWaiQcdUCFZUB4ov4pxeWRKfrVFM8S/kAmOcLuVzX8dSvXGfRXWwJy2jpYJ38Hp6pLWs3yn34Ht7xINY5RHSNqGhg3TtYWR0pDglJRUz+Bfsnikd3NMFzfw+BEBYs66faxzVfLIIvwfq+QExmqiStw5rTebuwJHroM6foDLBlJ3QBpA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWPi4XnMezOAj6zJKPnLBpd9iQiUqvY/JJJZS86mVa4=;
 b=fAeKr3wX46RhomxpgNxBPVC/Gwnen+ORgxrulA5EpISOBzODpE1kLyaXilZwual4CG2iHUi046Q6+9nXOhrPV7+KeaQw89xa1jaVTy+fwaSzPMCw/vW8+o53AeDIeIO1g9lo/smK6v+86ESnXuUvjRWkwQUIc6fVwO9i5oCpHpDRDvCL2z8TEv73qDMCpzyR8REjlbhYCQXrb9UqUZz9opy9r1Nhlvxg1BpFGWjgqEn5vuprWfQP0EdNwZieK9p+yquKmkeXVBNEx8Jx4dzAbYkLCDcjRVP4eiv6jG/chMpAbEMJrYbCpALBOlfXkb183nuYAsz0Dwt/sdrzB9OJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWPi4XnMezOAj6zJKPnLBpd9iQiUqvY/JJJZS86mVa4=;
 b=5G6mRzutQborC1JZrqRy6ePKK7+NVfr8HLpcafnXiMxK+eWyYaLC5bZuZyMaH40lyZr47KEueI2U3R1lwZjcdTm57Y+RFS9SETpgIuYjZxq0VO8DHOdGU3H3AgLquaX4LolMe3nbphFGWgzK2beazvq0+D1m3E4RRi9g5uh3e/0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <48b45ce4-b966-49e2-93e4-4b66d9ad170c@amd.com>
Date: Wed, 18 Dec 2024 12:02:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Use printk_once() instead of opencoding it
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241218123845.58850-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241218123845.58850-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CYYPR12MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 712d8018-6849-475c-7e66-08dd1f85bb8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFRrMGNseXFCZEh2YW91QUVIcXcxUS9JRGl2WjR1UmduRXQ2L1RqMHRVQU50?=
 =?utf-8?B?bEMwdHU5MmZycmM1elFDMUsyMHF2QXczTmdwU0V0WkFuY1EwMjB4cWdDMG45?=
 =?utf-8?B?bXVKMmZaTjNDMUo5M2VqK0FLM0R1NDk3K3liUTdrOFQwck5YZzNIQXhYQzhX?=
 =?utf-8?B?SEpqM0x6Q1BBa2hhNUZlVzdjWWxCdUZoLzJCUUNRZGRVLzhETFF3YXE1WGZu?=
 =?utf-8?B?aW82SDdvQThZMGZSenRqM2FHTStMTGN6RFpZbWNVYVQwQkFZVzVyQmJVWFlz?=
 =?utf-8?B?ZXFNdGhyUTVUVXFFZXFPQUNqYm9jck5penBmdlBWckVwd1luL0diU2VFSG5y?=
 =?utf-8?B?WWRWV3pLck1ka0VDUlBxYjJ3WitGQzg5M2s5eTFOT0QxQzFWR3dnSWFzTC9v?=
 =?utf-8?B?MC9zM3NtelI0QlRGWFpaOUFNRlVONnREY3l2TVFBaWwwamk2SThxbGxpMG0v?=
 =?utf-8?B?NTNrSnJjMy9veUN6QU9STzRTYWVhUWM2NlpRRXdMc1B6bk5rSmRFSmRtMTdp?=
 =?utf-8?B?amE1K2REMXFBVDlnMHEvWk5HV0ZjQ1dqcmdHcURncS9pQVVhWGJyeTFqYUJa?=
 =?utf-8?B?NU9kdEY3R3BqNlZWY3FxYTl0OUVFaytXVFp3RFRvcGE5eHNXYXlmSUNVd1JY?=
 =?utf-8?B?YkFQZndQMTk4Wk5manV5VE1RWUdJNURZaG0zdlBrclBvTndTODlNM2FaQUNV?=
 =?utf-8?B?Sm9sNlVSWStqOGx3b0U5V2RrNkFRc2NBd082Y3F5VG00QTFnRU5zeUxYZXNJ?=
 =?utf-8?B?ZnoyRng0QVQ5VEV6cFhDQzE5RGZiU2JTVENYaDJlZ2xHWk45d1h2UXdkVG0w?=
 =?utf-8?B?UnJWbXJ3bEQzNGd1M09NK0ZhbGFWaU1jcHFhOU5GejB6TVIxcXU2YnF2VzQw?=
 =?utf-8?B?dkNMcmJVRlVRNFhlZjVnL0ZKRzYzaTd4YWpnL0Z2Q3VjUW5WQ0ROdk5TTWVE?=
 =?utf-8?B?TjBzeDZxejBlVjIwNW9Zd2d0amhtdnBxQ2V3b3FsK2hybjNKV1lDUWJsYVVQ?=
 =?utf-8?B?WTN1NklTckJsUHU2M29zbWFZbFVydStvOW5uV0hDakczYkpBdW9PZGlEMzBs?=
 =?utf-8?B?RytVcWkwbFdUZjNXRHp5ekVOWHFmd3VzMWQ4K1d4c3JRUUhEb3BTa2E1alI0?=
 =?utf-8?B?RnRQVVp6NVJtaTlhMkJRTHFXTXIzN1FRUVlVeGtGTVMwZHhNb215amFDR0tB?=
 =?utf-8?B?ZUtvcU5mZVhNVk5pT2V6QXV4R1lWZEJSN3JGUXFuUGkwaVplMHZqNnBSVEdl?=
 =?utf-8?B?M1lybW1kRVRBRFpCYUl4anZHaTNodmFJTkpPUlBKeW1hSDFLRHNGS0JKb3Z2?=
 =?utf-8?B?UldrSktnZHN5S0xHejN1M25yVElpTDZGY29LRlpVd3JkT0VwZG5uVWs1QWFT?=
 =?utf-8?B?a20yN3dkblZUSGVRZHJpa2h0Q2dGUVJadjh3YVUyREhEZElUOEJ5VWZydUVM?=
 =?utf-8?B?WFo2T0RTRld0YlQ0LzJqbUtUTks0OHp0dlFjN2F2ZVI0YzlMWk40b2tkSloz?=
 =?utf-8?B?eFMrdjQrYndMcmR1bEpLeURpQkFCaXpBQUxmM09MSmdnaDgxMGw2ZUlOdFlo?=
 =?utf-8?B?QTMrUFM5aHNUZ2lScXFyQWpxTk9FOW9qZ2s0VHhGb05lUnVjLzlySmRpQzg5?=
 =?utf-8?B?Rm9URzhVZ1VWNXkzZXY4T1creDZwZ2Q3OW16RDZUMXpGQUppR3hMSDNQVGhv?=
 =?utf-8?B?b3hxVkpkanY0YUpxVnVPZW9mTzdYN240TXpjcDZZRlA4TXFZZUVLZ21iYWdM?=
 =?utf-8?B?QzgrU0grY0NrNFlhNXlla3hyOTlTcndBbWRDRE9RZkJYNC9WZi9IWU81bVMr?=
 =?utf-8?B?NDg2VzErSFBVNHpkaTk0R2MxNEJDd1hOdmROeW9KTFhFZm1qU2tVa1Qwd0V2?=
 =?utf-8?B?VW0zelVhNFNLLzdhZ0NOVnZjK3BsbXMrdzBkdzdSUXBMZXVjc01VMHZEL1Ni?=
 =?utf-8?B?TEMrZ2phclhqbDFSMUsrekljRUl3STRiQkYxTGZsUW9qNHRNRVJ4UHBMUkI5?=
 =?utf-8?Q?BzoFGkbdMf2yPAdzaOb7ATB7qud7l4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 17:02:19.2286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 712d8018-6849-475c-7e66-08dd1f85bb8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8855

On 2024-12-18 07:38, Andrew Cooper wrote:
> Adjust the message for brevity.  No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

