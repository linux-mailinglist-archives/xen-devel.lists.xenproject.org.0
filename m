Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF3EAE849A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 15:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024882.1400666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQ9X-00032W-5e; Wed, 25 Jun 2025 13:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024882.1400666; Wed, 25 Jun 2025 13:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQ9X-000301-0u; Wed, 25 Jun 2025 13:27:03 +0000
Received: by outflank-mailman (input) for mailman id 1024882;
 Wed, 25 Jun 2025 13:27:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrh=ZI=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUQ9V-0002zo-Kk
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 13:27:01 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20616.outbound.protection.outlook.com
 [2a01:111:f403:240a::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 113110bb-51c8-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 15:27:00 +0200 (CEST)
Received: from SJ0PR03CA0269.namprd03.prod.outlook.com (2603:10b6:a03:3a0::34)
 by CY8PR12MB8214.namprd12.prod.outlook.com (2603:10b6:930:76::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 25 Jun
 2025 13:26:55 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::b5) by SJ0PR03CA0269.outlook.office365.com
 (2603:10b6:a03:3a0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Wed,
 25 Jun 2025 13:26:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 13:26:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 08:26:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 08:26:53 -0500
Received: from [172.28.201.131] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 25 Jun 2025 08:26:52 -0500
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
X-Inumbo-ID: 113110bb-51c8-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdw3HtkIWS7bzDvQQTgcujC1mPsm0Ap2j/EiXr/P2NnykoLfzY7YnuO5KRzz+kNleZz8nCyGMNDOYzqpOH6wmLOGg3D7xgqpNhKKPqhmkxQxTuUYX4du/fIxecUKHwXCUXrMHOExp8h0twmj6/+Equl8AuiYNNS66G/vR7ZkcSTK0wOQyV49cHbg7AEYDpPxCEJhNC5kEdr/lPV1WKFnpOw0JGXhhbfdH0Rp+ulrTIP+lGVE+IOnv6yG3wz6MlKDOeBmxU2ymvYykPJjXLFdNFzaU/lSSQ+xLzZEL+XEJNNpshmdnVyGM0tyc91vODfEfGkBMw6+P4DEiSB4C5VuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8wnfYIJML8VKa7z5A0ujjxh/RVxgjvfIFcsjT7Igns=;
 b=Ckwx2JUZFLvZt63uO2c7AkTxRDKMC4gP5qLzSk7m742xqSsIh1k4wygRn760j6JZrfOqPzFkMuPgLQKEMV6OpjBTwEOtFL4jI2YSgksjCbR2aF5ggyt77Z8PyuUA/CCWswK867NufXapAJpX8axFoPGkaG5+w/YczvITx+fWUTOV+h5ZLkCleQu3THODvUnE3Zx+tRqP+KRX+p4VTebvTKUx5/NGcPt9SN5iYnL3duX7j/Ss0c0ASV1l/r83qxGojgOVlKarYnN4MVauJFNKe/nzNFHB4qtdeKDshYndqwbNRzI13UcplG3uBsdnfdeMQ8evHYQjs+u7eiPxEx6zJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8wnfYIJML8VKa7z5A0ujjxh/RVxgjvfIFcsjT7Igns=;
 b=EZw3j7IrxXlIh/hW3Eh/F86jmwmGVpiODQJEyBDOgpRGOoXcKC+jJc5i9qOkmHMZw/HVbuDXKnxOW0Isfpp/a2+la7FapiAeY7PQ8OFiuf5xZ1+TK77J7GfCbwjLFgzoYDXHjNZjj9Nw5muprvmjzLe7WpEwSoTW8DdSEIL9lic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <78c324cf-edbb-4628-a019-ce8cf85a0e0c@amd.com>
Date: Wed, 25 Jun 2025 09:26:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH] x86/pv: fix breakage of grub-pv build
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250625111426.25321-1-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250625111426.25321-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|CY8PR12MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: abecb1e3-dffb-4c28-a1d0-08ddb3ebf35b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3F4ZUd2ZDdxQ3J5ekMzZlRubFltSmIrd2pncEd4SlhWVWZMbHhKTFBzR2wv?=
 =?utf-8?B?cTV1cGRxd0oxWkczZVdQT3N0QkZvbDM1aFB6am5IeVR4TXRjZ1liSFVBdFUv?=
 =?utf-8?B?U2JmSXRzQmZJRG9WUEo5emdHQ3cyUUxNa3FoaEZibkZUUjBMTlJWRFB6M0M0?=
 =?utf-8?B?Q1lxaTYrS1pvVVNjeFVPTUovRnhzS3pXakl5Q3JMTlZJZ2I0YWVWcGJBalF5?=
 =?utf-8?B?UnpuTFNmT21qeUxYZkpWSDhiYXJyZWs2RTFHT25sYzlla1AzK1ppakxwOFdK?=
 =?utf-8?B?MDNPUkNBK2RvWEg1ZlQ0cUtrT2orbzhUdmRGb1RtckRjVVRMb09MampheXZ1?=
 =?utf-8?B?MGxiK0ppaDBScXQ5d0RMZVY0Zlc0L3I2Nk1iaFhKTUV0cmMrZkthYzV5am5i?=
 =?utf-8?B?YkFaeERMbGI5Q3BHbm1oczRFQ2hJV0luWkFvNktxTDdRMDV5cURweWdJdmtt?=
 =?utf-8?B?KzlqMWdGdDVxMjd0OU4ySkpObi9iazBqRmVaaUpKQ2tLYVZxVTVUTmI0OVpO?=
 =?utf-8?B?OEJzV3RjRHpTQ0NzMzFBR25RSlRFQWxmR1hvVHFMcXg0WDRobWg2NkZJaDhD?=
 =?utf-8?B?SGV1WDArMXdZbmxwRnJ3QXlkaFFYeVFJRERkZllvc0l1S1JxSVlDSzlrTUR5?=
 =?utf-8?B?dlM3Z2M0bkcvaTJJRSs3MUtYb2hKaGpQazc1TlpaakszREhRNmZvSk1JQ3cy?=
 =?utf-8?B?ZFZHRFV6YVI3OXhFRnFCSGowNXhVNXppcXBxZkJ6T3ZKdGREVXFmOWwxSFRU?=
 =?utf-8?B?ZWZvZVA2eUNSRWtvbmcvSjM1ckVLMGFHSG1GN3BCUWpMUGNGcGZaOWxySzJl?=
 =?utf-8?B?enF1dFBLS21ycTZxaGpSQWc4Slo5Ly9jcmt3d1Z1MkVIN1k2cDc0RWdrSlRL?=
 =?utf-8?B?RkRIYjFJUW1OaDN6czRHSHVrNGVjbVR5TllBMXFUbTZ2eHVrbHpDQVdzaXhH?=
 =?utf-8?B?bCsvOWw1czUrZHhiTlZpenFFVk5Ud1VvZkRwc1dGTVFoT2ZQT2FyQTM5Zy8x?=
 =?utf-8?B?WE82ek92QU5DWUxKcEhGWDNsOFhCNjRFV2lGWXgzd1pvR2cvNlVHa3FRbkRJ?=
 =?utf-8?B?dnVZbC9udm1hTlc1ZlNWaEdSRmxTTUxIQkQ4Ums0SjBWOCtpUXRnS05lVlNV?=
 =?utf-8?B?UDhWQ2JPLzFTaHBneXlnRkJVc0wzc3d2REFqU1ozTDNmS2hZMmhpbDJEMDR1?=
 =?utf-8?B?dEFnRlVtWjN6TXB4WHFYNzUzaU0zbkMzVGorUWszVnhxcnEyUzlYM1RsWGk1?=
 =?utf-8?B?V2gyWW9HREFtRmVKODhOdmEyVTFVdjlEYlRjRmpaS1M5VnJiU1hjRVFFQ0ts?=
 =?utf-8?B?RWxOSXQrN2oxWU5mODlkK0hOUHJQVHFiZTNhRmRWQTdhdGJRaWF3dWlhZ2cw?=
 =?utf-8?B?RkxvVEJ4VEpCUGFyTWYyK2J3VWFmSUViWmFVdHpYZy9uTlpZN28raDZydkow?=
 =?utf-8?B?UmhCV0pnNXp3Vm96T0ZzdklHck1TRWVWRGNJS3psVmZSeUxnUmN2ZWdUdm9S?=
 =?utf-8?B?bWxQdDhXVGxqYytCaCt0QjhCRmQwVTN5WlFzR2RvY3Q2WWlDSHRWRjJya0tG?=
 =?utf-8?B?L1lxaHA0UkRsWnNCMVpsREJuaUJsVW9WaHVsYnV1MG85QmhZckpBKzdOanpD?=
 =?utf-8?B?TGJSOVNpWUJXMWlMVzhDeEVzRVJ1TSsvSkpuVExRR21rKzh3T0hhVVNOVzkz?=
 =?utf-8?B?K3ZuZTAvUityUDYxTVQvcjNtYlUwMnRYQURCVU5VanJPL3E4Vzl2NW9vMDZE?=
 =?utf-8?B?SHJXckZDQjZXc0xLdGVIUTNPclhnRnJ6cjdtait4R1hoS084TkNxdXRwQVIx?=
 =?utf-8?B?TnQvUDJBbG9Sd2tFSWNPd2czcko3NS9NOVZxWjhrN0ExbXM2MVVEYmwzUDBP?=
 =?utf-8?B?SllVRDJldEFBd0piM3l6SEc3YjZ5ZzlBV29JUEJjc09WWGRKbTBZTUh2cWN4?=
 =?utf-8?B?bmQwRWpQU0pJdzMwb3lISjhCWTRmbFc2TngvcEoyTllGZHJSTXUyQk1weVpz?=
 =?utf-8?B?RGc5VFNVVkxZTnZpZ3ZyNTRZd2lmM2YzcDRrSThtUmMzT28rRGpBeUFja01X?=
 =?utf-8?Q?WtgAJO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 13:26:53.7376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abecb1e3-dffb-4c28-a1d0-08ddb3ebf35b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8214

On 2025-06-25 07:14, Juergen Gross wrote:
> grub-pv is relying on start_info being defined, so provide a definition
> which can be used.
> 
> Fixes: d669a312b2b2 ("x86/pv: remove global start_info")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

