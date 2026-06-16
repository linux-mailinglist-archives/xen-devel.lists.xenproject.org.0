Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id khHRCuj6MGr/ZwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:27:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C71C68CD84
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:27:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=H3RAx4r1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338740.1599795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZOCm-0004ry-5e; Tue, 16 Jun 2026 07:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338740.1599795; Tue, 16 Jun 2026 07:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZOCm-0004pn-2b; Tue, 16 Jun 2026 07:27:28 +0000
Received: by outflank-mailman (input) for mailman id 1338740;
 Tue, 16 Jun 2026 07:27:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wZOCj-0004la-Qd
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:27:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZOCj-002aYM-7G
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:27:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a30fad4-5cb7-0a2a0a5109dd-0a2a450485d8-38
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:27:24 +0200
Received: from [52.101.53.0]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a30fadb-1dec-0a2a45040019-3465350086b6-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:27:24 +0200
Received: from MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::16)
 by PHXPR12MB999257.namprd12.prod.outlook.com (2603:10b6:510:3ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Tue, 16 Jun
 2026 07:27:20 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::a2) by MW4P221CA0011.outlook.office365.com
 (2603:10b6:303:8b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 07:27:19 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 16 Jun 2026 07:27:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 02:27:19 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 00:27:19 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 16 Jun 2026 02:27:17 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjcpOPUSko0CUEKQRbJnHK8mmOMRInla5hi/52GWtGiiF9wThhceVdNj+LpINbJDYS9fcbZ4Em2wVDKNsbSnzA1raNhJh5/1GuiT1TVZEditHBzauNxWg8dSvKQDXboD1So/xAIzp4YOQ/0/+ompsLbd4odUyPiwFBiYahdELdninAKxuBEZMo3pbNOw1mi3nTRLBaNB7RC10jGDCuA1/VLvmfa+VG9WexK+qeCDCTgkZsVE82d7iesdSjXcjsVSxhF5kfs3aR6bSvN1A1zfvi9fvDV46n9jLHpFu4msd/JsgE2f068hLeYjybM/Qax0v9t9DSi6TiOfckTaZPsBtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4Ir/S2IwEo3pVKjYLUFXRo5kDzYyMx5CooExoVCkZY=;
 b=v8zkIC5dt9U/hxAny/EPR99zLjcUHqJcV88LKVmw8NGH4OPS94UZ3uxsiy4nmU2HAWnh3YYZ9JkZbabUo/QkkjT0miLpsAdsxmYDpWnbBNHlC2hwL2nhqXQHgXSuFRCrxfqvjFY1Q/qUlOq+UjUTc8d5TgvZW/klJqJu5hTUNHCAsvK9UbX98z7haMq5V7/2kV5yLeGRc5dysUZMwyRAk08y0SqYPmrWdGL2Gy0iJ/0YXnZoBH0vh7gcUrhkaKfoYmdCNK+x5+nYhMa1HVOzYEeUsC3ON9aTIBie1jVBlk2IPRBSEwjP3Akl32cn4DeRLTwIntqudJQS5Sw+DsHZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4Ir/S2IwEo3pVKjYLUFXRo5kDzYyMx5CooExoVCkZY=;
 b=H3RAx4r15aJIqyvwJ3yVWL22ub/mHviqmkA0W6zHosiC/wYmf9UR+aqvjIYxF0FQZq1ypcGhB5023sqM9ciMpLXmukEF1fVPZMDhfNnmexHbsnw7Fgg5bgPUotwISPPvYFLrVr5Bh+BAyFQ56hYoV9DIDSNL+Tq/LgJfpgtsI/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e792e106-4301-4a50-9aa7-8884bca0df6e@amd.com>
Date: Tue, 16 Jun 2026 09:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] gnttab: drop dead local variable from
 gnttab_map_frame_begin()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <d0702419-2cec-45fe-86b4-470cf4d55b5e@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <d0702419-2cec-45fe-86b4-470cf4d55b5e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|PHXPR12MB999257:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e752ef-030d-477b-bc5a-08decb78b34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mZVFDaChWllVrbfWlt7iGuA3tw2SrZ+JYS9nz9JDvZ15bhWp0Ku7t/OCpmzURTV8VHBJq22h/J11vV2sMFZeNbVHSI6Yyx8DvgSI0MwbU3+9N1mEuBYBfL98Zrbef8Eehwm0p2T3X1Sppzv0q+YHa0SLEVTYBxyCiGCwMPs289BhXIX9QOSMIy+Ecv0F1lfNXj+Zu/WBTZyPyy7itixaSHFXD6gAWR0KftPu51ZAsfaQLNXe0RYHTox4ao0TaUAWeC1Gfnw1qrTD+4jHxYl4h54q1JWtWhUM4dD11N+Q4cxC64ZeyZ6db6/XIC4tyyXKJdTP53bTEzDuwQtdt18AQefLmmTiWUxggSiWROXzlZp5mh7Ntd58sI2dm/mXOZOx/XNUg3ALe5byRShcgzr6p09x0/P4CqEesjUqLq9A3AQn9qVWcKs1ycqP0cLRS0Lz9FQCBLSI64E8Rl1bgPJdQaxTYOJnCSab1Luv/JwoyoiGj0Cl64zhCLUndHbMx2NKUV18ydMfjIuDfLTn0WMTEnPgkgt5XAW/Z2yQ7CVvk+PUJFn/HYRwlYN0biIoP978Vw5JTVz4sETwbwg7GYMy0oxguuxs+ZEchT4FrI2/bIcwmhg/5nlbxuqa6IyEfLEUGY7HP4oYBIngb0PLcRBSXPcma57ROd0GaIo1n6mRJXkJ4G0M+eyQvbIMOIkhXsT1UPmCylZE/bi9Hqlon9IwnU+8zFAMEf/UYMFWHx7r/0E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iFBf1+33Y5s7huq2ZD7HVsoQ+1viEf4ETeCqZZYttpE7mvUjvqgNbGrX4XcI2ujW34I3+LvNfyjrcEhTHXtlxA1wGBLmiz1J2A0jSF/apNIfXNsjISJpWfqGgpWQJg5StzDgNmFPFsS5hqJDNVSku9GH7PPVK5dfuKKafoDE776XPAAhzbtuDYGq9cuui16kaB9XFtuc8ac8494A9/9rpk1z6PKCQ/JVNyucL4lJAkYDo5yyIcnAGis3RN77eWZVNFaTcDgVGBDAwf/MLwdHmzVWGWR2uKeYCIL0XTppQ05XbPdCQ+cygHr0CNFtEZhQa2n/1qm66V4BMHCAIFvMNDJQo5g6o+iOMv5omLbR+pKGQ7QTVCD73xSFlKMckvEP/wmrQqAD+q9LBOTw5oFvF+vIeNfJ6q40BnUpFMmS5/lNz5ePyCWXmO5F6rUfprX0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 07:27:19.6747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e752ef-030d-477b-bc5a-08decb78b34f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR12MB999257
X-purgate-ID: tlsNG-ebf023/1781594844-2A5603FF-53EAE43E/0/0
X-purgate-type: clean
X-purgate-size: 508
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C71C68CD84



On 16-Jun-26 09:02, Jan Beulich wrote:
> As Michal had indicated in review, status is now a variable that is set
> but never read. I made the resulting change locally, but then committed a
> stale version of the patch (also omitting Michal's R-b).
> 
> Amends: eff88c4d3543 ("gnttab: simplify (really: drop) gnttab_set_frame_gfn()")
> Reported-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


