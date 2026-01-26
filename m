Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK96NuuNd2m9hgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 16:53:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B18A57E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 16:53:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213795.1524247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkOth-0005an-KY; Mon, 26 Jan 2026 15:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213795.1524247; Mon, 26 Jan 2026 15:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkOth-0005ZE-HG; Mon, 26 Jan 2026 15:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1213795;
 Mon, 26 Jan 2026 15:52:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJHa=77=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vkOtf-0005Z6-SR
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 15:52:59 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1582d105-facf-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 16:52:58 +0100 (CET)
Received: from MN2PR03CA0009.namprd03.prod.outlook.com (2603:10b6:208:23a::14)
 by DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 15:52:53 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::e3) by MN2PR03CA0009.outlook.office365.com
 (2603:10b6:208:23a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.14 via Frontend Transport; Mon,
 26 Jan 2026 15:52:17 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 15:52:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 09:52:51 -0600
Received: from [172.29.134.248] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 26 Jan 2026 09:52:49 -0600
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
X-Inumbo-ID: 1582d105-facf-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqZLgctYR+5Wo1j+QVxR7E6HO/jl2YY66+267y3UQLLodKWgG+SL7WsHs+DzW11k5T08P29DeCBnA06ayUGQjRi+1BnT2k1y1xlJ3y4W81sYsPf59/Ac8cdZlJD/X2paByg6C3ub+GMT5bcI9TIVkzE497jQCefBcjxqOnmD4MTgHb6LJ+bhgtsphs+mI6NmWXQefJEfV57DJ+VPypz7K8a1Ae8BY8mZaLnpUbyYw5LRItBrNuG1gnk4wNHnZftm+TJ7B4CcalxQBxOsZMieGUjAeVvJmT4yUrMeN+JmOPlvFVBDoSBEPUUQnmGnzr2i1htxZ1esGpihnk4QzqrthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDQTNnwCK6KgVxROBuRzsO3wGa3kVbvWTcDgtLnkClE=;
 b=oo1YG/yO3daT8foNbC/JGw+OwtiuOuETpgqFbF/SbSv7S/WP9clHgwWdgAtNfLh/G/coyUKqHVfnL0ZGvKfCkFfCsk+t8iPDJzDqb/IW7oz409TupRHjrXPYEZMLYvEalOwn9Qc8BqtxKREXsRGxXOV7LM1793+88BWh6fLsPPpJuXrLo9AvYoRpEhwO5Onx8p/m1cZg49XNgmjjlAedkfciRHC+3yiRMySjcMIZN5vdVfXbWGYv13B0ssX4YEGrVbagxHkuIBPTL4ump81qteVaT9Z8Y4H4erMUXq4/GSdaGAYTsiIdxNmFEEnOPh/1mzs5mfL0HouxAa9RF1ImPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDQTNnwCK6KgVxROBuRzsO3wGa3kVbvWTcDgtLnkClE=;
 b=zzk0xMj4U8KQbSM9g3Xn2Du6m323WdCx0yrmKmKBVYvtZqCtfOnlGMj1WYcSybV4YJxT6AGReubyobRcQDp4M22Tue7YBCBI9YFTRoSWj1/oL9ygA7iK11tDrUyWKZI6oPDkLoIqnLfiyceJuGy7ULpiH/9JD2Opa+Jlu8ZeY48=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <673d69ff-2859-4678-b90f-11fdc7a915f4@amd.com>
Date: Mon, 26 Jan 2026 10:52:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] vPCI/DomU: really no ext-caps without extended
 config space
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <96e90685-3321-4884-8fe7-f083c25ba7ab@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <96e90685-3321-4884-8fe7-f083c25ba7ab@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|DS0PR12MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: b594fb45-945c-4c1a-5bb8-08de5cf2f623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1ZiTlp1SXY3NDl2TUdSRUNtRXgrTktmakhYczF2WWs0WEhVa3FtY0tJc0FT?=
 =?utf-8?B?RjBNOGlTTlNKNXhTQXA4d2J6Tkl3S0EyaS8wbWdncmpQSnNNZ01td1EvVFdi?=
 =?utf-8?B?UkJtSnJjdGpWOWpVZnlwNEw0OGM1akhsVUtCaFFmd2MwZytFNzBvRHpoQ01W?=
 =?utf-8?B?VHJvTHhGQ21vNnkrSVdvaTRrcU4rWVZJNzhMNUtqWnRKVkRiRlhHOXBOcFpM?=
 =?utf-8?B?V2tRdG12UEwwMlQ2WStpbWMreWpqU1FJWEJVU1BiV09ySjFzcFN3d1BVY0x1?=
 =?utf-8?B?ZDA2bXBtTUdMQlZDWFJFV2dWdzg1Uk4wQUFHVGxoNVZhUDZoUUs1NVA3L09t?=
 =?utf-8?B?RUljM2crN3laZmxHZzNGS293ZlNzbWdQZUdPZmgwUldraklTcEx3SEV4UjhK?=
 =?utf-8?B?N3JaNXRLanVYS0x5YSs2ZW9PVjVtb2hnVUpqbXFyT1hON0lxcmZnbit3aEVa?=
 =?utf-8?B?N2xmcWVGK0NwYllJVGJ4cXY4Y2xNUzZNOSt4U3BIYjBhZzIrN1J0UVM3SU40?=
 =?utf-8?B?a2ptT2pyWFhYbkt6eGlQN242V1pTMEVrUkhxTlNGM2JZQ2lNRVZTRmp2QXR4?=
 =?utf-8?B?T1ZnSXdlWm1CNFFjY3RWVm54Vjd5R0d6WEFublBqZ3BjSXg0YXpzUzR3NkxN?=
 =?utf-8?B?NkowTUlIdDlENVZYMnFDb0ZDZEgvSkxpejBLY3dGek5GRUZzWDhwRnZXUWcw?=
 =?utf-8?B?S1ltcUhZNWcwVmtmUktGSkNjVkZac1Vra2pveXNGL0xCZ3Q0cXhBd0dydUdO?=
 =?utf-8?B?blpIdnZvdld1QW80b0dzTWJUcUZvZGJidjFibzFkUzladms3QUhLbHhiVTdt?=
 =?utf-8?B?dVdSakp5eDQvNGg0T2U5RTl6eENDWVR3cVRIVXprWmUzeDRqUVEwOVJBMHRs?=
 =?utf-8?B?Z0cvTEdXLzNPR3lrSzNrUUNDVzhDY3hTektkNnZnZmZMdEwweDZiWCtPL0RY?=
 =?utf-8?B?dk80ak5wb1lJbXNSeStXRzlpMUladms1TzY2U3lhaVlmdTJTaEhtVjBXdDRm?=
 =?utf-8?B?R01pcDdoc25hSUxhbmwxMkd6VFpsTnJJWU1qdWVLdXdydmJ6K2V6R3JFUWJi?=
 =?utf-8?B?Wk5XTzFyN1JiZDNnVEtWYmxKekc2MW1kb0pEVThIM1kxK1M4YnBkaDZ2d0F1?=
 =?utf-8?B?RkoyQjRBNzFpbTBEbDF1cWZya2FCREdBWFpIVGxQTTBJeGJuTXE2VXhDa2tR?=
 =?utf-8?B?UlVHNnlFMjI2b1Z3VTVCYUFFNXRsQk1uV1pxTThDWXAvYVlQUzd0SVpLT0ZJ?=
 =?utf-8?B?dy9GWmJpY3B3bmZ1YVhFSkRLNG0weGhlSTZRcXVJRUlUZjhNVW1idGdXei9i?=
 =?utf-8?B?L1dBUDlIMjFMeWlMSnpma210ekdqeS9GL3p1UzVNSHRrSTdZT2tra0hJNWR2?=
 =?utf-8?B?RVBmQkZtREFNa0NPaUZ0dHF0RDJ0aEhLeEF6OG9LY2tJWUFHd2MyNTZMOWJ5?=
 =?utf-8?B?UmpYLzNXSExzeGlFMHV3aW1semRNaUVKam93YXhOcWJxTlZFRXFFY1lyaE1w?=
 =?utf-8?B?ekxIVGtoT3c0YVlJd2hiQnhaSDM2SmJLbDA0K2x3T2twR0h6eFFPRWRRUG1S?=
 =?utf-8?B?dnhUWXlOb2dBWkNiOGZmSXJMV1JXVU5yWHhFNHphajhjTGR2RzBWbU94SEly?=
 =?utf-8?B?S3J3bjRnVzJnaXFXTXVreE1zaDUybWFMT1ljM2VEVnl0cXlHcjJMc2FwR2pP?=
 =?utf-8?B?RVJiY0tValdIS0ZETmh0VTF6NGV2TDVzak9PQzArbkRJWktvMU9vR2ZIdURl?=
 =?utf-8?B?L2tmNm9XbGdTRGFIVlNQZjR0aEJtMDdjWm9Od2xFNU5VZ0dGVE16WTN4eHZS?=
 =?utf-8?B?NFVOOXBmaXFPSmRhdm1yenZzRndtYWpyTkpLcThETk1ONklvQ2Q1UWx6ZHFh?=
 =?utf-8?B?QVRFclk5Q0RhTHJZNUdibEFqMUl2SVM1Ump6Rmg1NjBKU0lOMi81YmlLZlpU?=
 =?utf-8?B?M0IvU3dxUVE3U3FON0x5aTg0bDNIbkw0MWVuRDBJNm1oRjhra0tubFQxcGlX?=
 =?utf-8?B?c0t4d1p3WGpvSncyYlZDK0gydGFETmNKMjMvZ3ZacG1mdlNZVnVaM2UxelNq?=
 =?utf-8?B?TS9yaEs3dm5MUjBYLzJndElCZkljWDk5d3RaMGxsSFV0ZGpURjJCTTQ1dEZn?=
 =?utf-8?B?Z25FYnB1ZEdDVmZYMmhwTVRGWGozbzVmVmlMdWxwV05kODk4UUpGQy84Sk9u?=
 =?utf-8?B?UmpybnJCQU1uS2FyaUZGTGhSV3JUM2FTb3hPUDZvNUdQMVhIb0FQano4ZFk1?=
 =?utf-8?B?Wm9FdklYV0dDS1k5U0dLY0t5QmdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 15:52:51.4109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b594fb45-945c-4c1a-5bb8-08de5cf2f623
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 488B18A57E
X-Rspamd-Action: no action

On 1/19/26 09:48, Jan Beulich wrote:
> Whether to emulate accesses to the first 32 bits of extended config space
> as read-as-zero or read-as-all-ones depends on whether a device actually
> has extended config space. If it doesn't, read-as-zero isn't correct; not
> getting this right may confuse functions like Linux 6.19-rc's
> pci_ext_cfg_is_aliased().
> 
> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

