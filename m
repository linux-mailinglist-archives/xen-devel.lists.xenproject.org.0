Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F4A93A1A1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 15:36:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763203.1173460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFgg-0002w5-Dl; Tue, 23 Jul 2024 13:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763203.1173460; Tue, 23 Jul 2024 13:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFgg-0002tN-8Z; Tue, 23 Jul 2024 13:36:18 +0000
Received: by outflank-mailman (input) for mailman id 763203;
 Tue, 23 Jul 2024 13:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1nq=OX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sWFge-0002s4-8j
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 13:36:16 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2009::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 875b7628-48f8-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 15:36:14 +0200 (CEST)
Received: from MN2PR06CA0003.namprd06.prod.outlook.com (2603:10b6:208:23d::8)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Tue, 23 Jul
 2024 13:36:10 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:23d:cafe::1b) by MN2PR06CA0003.outlook.office365.com
 (2603:10b6:208:23d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Tue, 23 Jul 2024 13:36:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Tue, 23 Jul 2024 13:36:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 08:36:09 -0500
Received: from [172.23.111.139] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 23 Jul 2024 08:36:08 -0500
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
X-Inumbo-ID: 875b7628-48f8-11ef-bbfe-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqbbPrcwjf1S6npgTFubicbBXPoakkr1UueaGZnHwpUBwfy7Hr+81IPj9gfteDl5WXF6gTB7pZgOPCzObv3ImNNdr/Lu5n4+6Acyy5CGY9RroxHdI6tMhZgIM6/3FKl9OW714D/2KKNvcCDO74BpMPzGuOz43TKx1r42pHtSxSh61n5Zv7TBx7fxLNA1eE9mxrZSFofAatLmjIQqlIJ6fRQxTPavQ5ZPwQPERuTnJ7mNBiYMb7ki7qYGGXfbArFyP0rUmtodsrOMTMlrsGWbHBvDsiA5DNC1xqrwjjnX5y6GSAL6WXI1+gIw700XHpltWePqPiPwhHMnlyN8eKd5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8VthCRXraIiNFbEqzH/+77YKs+ZZNodAJVfWtzplKE=;
 b=LD0rcvOIfc8jB3/mUU4asLcwV0kxSsNl8HYolYNR4lyTJqsvscuK3ktb+Dr0L+BCmnY+4yEs2PK5YvngCPpYrcsQwGG84mP6PQMoo4yocSYaRQ+GFhde1A3WhIWok7qcEFP0NwNCJP4xzYbN3xEjSdZzG1T5YeLK4Shfwq1QOiLeNvR6HrmdDz9TOlkUGVkKmYU1rLMf/1B73pzfzpfoODvV0VxjJZ6Jaucqt8oN6lUkKXz37kPSD9FtwnyZ63WCKdURgdz5JXEZxhCfnu6iSTRayeqW3wPtsfTltZz6ald6dXYF+TSiLdc4sdqBdfZMuVOi7NB88BNgoGo93VzysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8VthCRXraIiNFbEqzH/+77YKs+ZZNodAJVfWtzplKE=;
 b=rvkKm/+wyv62OD2F4Ov6zGyuDlHrj30DjxOsQHiI5hoqHMytT96uJb0X4cxk3IrIJOYfVfh82hFA/rjnJ3sAVHLv+YpHhXKzYm4sIq/UG7tK7sFN91SLi+2+tFkCDFLBFuz3cLpNEXuF66m8WxSUaLN+ZZzAgesoH5AyhnOkSs8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ac1bd263-e9b4-4bc6-a9be-649b075add46@amd.com>
Date: Tue, 23 Jul 2024 09:13:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 2/6] tools/libxs: Rework xs_talkv() to take xsd_sockmsg
 within the iovec
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-3-andrew.cooper3@citrix.com>
Content-Language: en-US
In-Reply-To: <20240718164842.3650702-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|MN2PR12MB4061:EE_
X-MS-Office365-Filtering-Correlation-Id: b63a424d-f871-43ca-a382-08dcab1c69da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWh0eU91RjVRdUtCNlIvZUZxT0Iyc0xja3dhelZuT2RLTTNaV2FLb1hhU2VX?=
 =?utf-8?B?SmVud09rSTZCd2UzRGltMkU2ZXlqaGI5NXhEeEVxZzFFQUJnRXJxS09ZS05l?=
 =?utf-8?B?RUhuSGJGRXhZT1hPbnF4VmVKYTRBekZwMzFldzVTWU9Fc29jREZPQlk3eURn?=
 =?utf-8?B?TjFJUmtROWVYYStaZWJhUEhyS2hxOEJLQzB5eG40TVE5ZE5KeGhRSlE5Y2Q5?=
 =?utf-8?B?UUFZT3A4SUV2bmlmVkpXaGZqZVVzWllvR0p4OGduZ3FlWHZzUTJ3NCtWaWk0?=
 =?utf-8?B?WktNbzNTKzZkUG1NUjkvUTBJNjhQWWU3N0s3TDQyZnh5NUoraEFyYTRqL09r?=
 =?utf-8?B?MTJQMVlBNXF5T0FBY3BhWlZqSkFlS3FnSmgvNFA0YUl6VHk5eW9YdE93UkpT?=
 =?utf-8?B?eWJQUXdVVXJjcExrUUZBOG0wUEVHcGtNSy9OZkpuNGNHRVJtNGtabnQ4czFx?=
 =?utf-8?B?Tm5qRHZyVWlaR2tLb0tWc2JvbHNXYWZJSFhMeUtJbitCeDlaaUFSeHNhZEZj?=
 =?utf-8?B?VlROUzVaZkRzbEpWUklEYVJCQ1ZxT1ZTOEM5UERYK3JuM3lGOW1kMlJkWGI2?=
 =?utf-8?B?WVZoVHdEK2RCR1VTdFJxUzRpRWNmTWVYWU5xZUlwZVVkN3VoYjNibWMraTZO?=
 =?utf-8?B?MVVvUHIxckF6WmtUd1ZPR3NEa2ZQTVZUbmIyVVl1aUdSZlhHaG4vcHRCNmlU?=
 =?utf-8?B?MGVXOEtyellubE9KbCtGZ3ZySnlJOXdTN0FpUUlWYW5XeDJoK1NVcUROeXZo?=
 =?utf-8?B?RkNPb3FNL0dFaTRiSVllMFZCK0k0OEcrRjgwdzR5NGluOG94MjFJZ2Y0ajVN?=
 =?utf-8?B?bjBNT2FteWh0bUxYV0dNNURLNVo2SVJxYUtyYUFDVFRraVBVbFZrN05jRG5X?=
 =?utf-8?B?WDJaVU1JZlVZUDQwNDYvRkM1Und0TGlaU3ZmQjZvUUtTUkNZM1NtUG8rNDhG?=
 =?utf-8?B?Y0s0RzhPYnUvcGNRZHVkamZzNE93dXJiZjhkaDdCVlpNbXphVTVNQlgyRHdX?=
 =?utf-8?B?U1psbHNIaHBTc2tiUm9GRWhsYy9pQVlFbjJIcmFJZTdKa0FodmlVVE9GZXZl?=
 =?utf-8?B?RDFDTExmQ0JsSU03eVFFRHMvYnJydXByQ0J3NllHUFZHLzJCVi8wMmkzaW1F?=
 =?utf-8?B?ODdZOXRmNjVEYUJuWmxsalkzNStiQWhjMWhYTDkyZDVpVE1GWkdWY0l5Visr?=
 =?utf-8?B?bjRiL0V2WXRJYlBCSzVBVHFWbDFzWUlmMjJTVzFMdklZS1ZkenJuYisvUlVx?=
 =?utf-8?B?bm9OZ0tvR2xqSDU1SGtram1hYTkxcnBDOVhrNHV3bElUTkZPeGdBSlNSWmcz?=
 =?utf-8?B?RDF2Z2o5OEQrN0swcHdjQmxTOGtaTGc2NjZneUxXSG9ZdzB4cTBTSDloeWY4?=
 =?utf-8?B?ekRUOHVvaWxYdjdqZHpySlhHSWw3UE9qQVRRSWRlNEVBazhRM2tiTWltUnRq?=
 =?utf-8?B?N1dLOEMrWks1NE94SlpUSlIyRlZlekgxTFVDSGZvbEJwM25hZ1hKVlh1WU9V?=
 =?utf-8?B?dXVXWXN2RjVZdE9nMlY5TFJ5UGhSS0xRNHY4TjU1L01lL214RncrSjBuaWFT?=
 =?utf-8?B?MHh3cHA5YWNRTnlLNlJLK3BoVzk4RHhYaTMreTJsNFdqdlE1TWNVT3FJNGVH?=
 =?utf-8?B?NjJTdW5JT1lEL2VtRTF6eDVUaXhmbk91dVNCLzVKUWVFMHQ0dkU2V2ZRN1g1?=
 =?utf-8?B?UzhxcUlXU0M2UW5tdHNjaEZ3TkZPemNpU0xEc2NGR01EVkt6c09YaFo2NDJD?=
 =?utf-8?B?YkYwLzBMU0dIcWdrYXdLaXVzWkx4NFBSSVJ5STI0TUhpdnVVUzJOTktDNldZ?=
 =?utf-8?B?UjMxTU5LdjBvRnNHZ2NEUFhoYytyLy9uWkwwWnNuVXBGMEQvUWYySzNyOTBU?=
 =?utf-8?B?YzRLSEZGVDU4eXJaZWsrZ1M2UWVDcUN1MTh0VTI3d0pqRzdoZFNBOVFoMVZ1?=
 =?utf-8?Q?pUE+d3wpcwtXsu7d0gGYka80YwF1MH78?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:36:10.1419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b63a424d-f871-43ca-a382-08dcab1c69da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061

On 2024-07-18 12:48, Andrew Cooper wrote:
> We would like to writev() the whole outgoing message, which is hard given the
> current need to prepend the locally-constructed xsd_sockmsg.
> 
> Instead, have the caller provide xsd_sockmsg in iovec[0].  This in turn drops
> the t and type parameters from xs_talkv().
> 
> Note that xs_talkv() may alter the iovec structure.  This may happen when
> writev() is really used under the covers, and it's preforable to having the

preferable

> lower levels need to duplciate the iovec to edit it upon encountering a short

duplicate

> write.  xs_directory_part() is the only function impacted by this, and it's
> easy to rearrange.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

