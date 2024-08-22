Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B6795ADAA
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 08:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781572.1191060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh1RC-0001ZT-Ov; Thu, 22 Aug 2024 06:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781572.1191060; Thu, 22 Aug 2024 06:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh1RC-0001Xd-MA; Thu, 22 Aug 2024 06:36:50 +0000
Received: by outflank-mailman (input) for mailman id 781572;
 Thu, 22 Aug 2024 06:36:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUbg=PV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sh1RA-0001XX-W2
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 06:36:49 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2415::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6b8edd9-6050-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 08:36:46 +0200 (CEST)
Received: from SJ0PR05CA0200.namprd05.prod.outlook.com (2603:10b6:a03:330::25)
 by LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 06:36:38 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::25) by SJ0PR05CA0200.outlook.office365.com
 (2603:10b6:a03:330::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Thu, 22 Aug 2024 06:36:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 06:36:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 01:36:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 01:36:34 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 22 Aug 2024 01:36:33 -0500
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
X-Inumbo-ID: e6b8edd9-6050-11ef-a50a-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CU9/pWBaCTfLbNggxlr0DSNjinM/R36Dwu8jbX6WAuUKcsQKEPszW5nVNSgJlz6iXPLJEazJ8gpJ407L91ErtgfNxCEb7A/nBd31ntTAkuaKo9W4QRFv5iCO3GQlC7xTEJydgaWGIB32wqzKIRutlKCftduQ2UQliCWFBqArZmGYY5AXATJ6mU6dbt+6gzMviE50slfhe0jfC+AUsdInz0MeXFwcyUwdF2NzP/vTnd/omC+YG8LlgUh1OOK/KR6tlByCu9RtWu3fyrXbpdaBK5zc6QxSeyeXBqPBVtGjKlmfH0I1EQx3LKrsKXWnhyjo3dD/Wyb4lCqCvc8Z5sMbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TypTdbROAv6TPgQfQPDqTF5ieOnuAKqqR0kMU2lmy6E=;
 b=Kza2UhO0/legfur64yp/FYXArBjjDUDqlLPuQVLaTaBO9xfe61weB64Sgfg4sgFPJ28ElmQqVQy/fo2RiFPoy0u02RwAMu1MJvGW6pz2txdDCgZba30Qkvz9XAj41b7/TwQum4O+cXpzLdj/eSXHZcN5KKoN6s2OLwoBhCZl3hHAqziXCKCH8MeFqYGLf819JzlAYP8wVewHYnwuL7d9wvf75K/zt798rZxIMha7rVpXQJtKOALEjBsFGjFd0XS7IpzsEF5k6Gj1PV9v83ky3hY4GfwUQZS3NYcjAysXUplY8qF3GwHM6ttkDt8GH+lUb6H05kDNDUNmgT/tPiRaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TypTdbROAv6TPgQfQPDqTF5ieOnuAKqqR0kMU2lmy6E=;
 b=JBbj+bD+OIxGWQEoydh8I8ygbb2beIGrozfQTMGvCwBFX0bgixUHDc5h2Qix16agq0HG95KeLESO8tkheVRKYUiqDL/DO8JzOaZdCVfroU+jLjRlWMPkC+o27bnDtkHrGjzrDiIO3/g4BypD3vWARev5uocTbtiSJgSe4z6MSvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e2b23cca-9652-4aac-8131-56d7ad2cb06a@amd.com>
Date: Thu, 22 Aug 2024 08:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] automation: restore CR filtering
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <anthony.perard@vates.tech>,
	<cardoe@cardoe.com>, <andrew.cooper3@citrix.com>
References: <20240821202958.3942632-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240821202958.3942632-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc07888-64ed-4f3f-4c21-08dcc274c504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGlHbWpOWUxaOGZ0STNzbllkclk3bkNtU1lFZHZCRkRsU1Y5M3RBZmZkd0pX?=
 =?utf-8?B?bnhiYzdGZDRIQkt2TExhVnVJcHJKTVEyalF2WlpBcHd2c29yaUxPZzFQMEZL?=
 =?utf-8?B?UTQzbDB2VzduNENDMEc1WWRDUlBBR0VlNENoYlRNQnZDYmRPNWJ5V055U1VN?=
 =?utf-8?B?cEpzMW0zK1FKOFprYXRmYzNlZU01SE9aN1gydDk3M1ZXeEVhUEhaOXZJNzZO?=
 =?utf-8?B?TDdNR3RrNXA2Rmpvc2tMbmpUM2dtNGl2UXowSVpnNEpNOXpDckw5cHVCd0Zm?=
 =?utf-8?B?Y01RMHgzd1ZLckRkWnM4WFBNaGo2TGd4bHFzckp3WnIxRHppcWM2djV4aWxC?=
 =?utf-8?B?QVFVS084clFxYlVPeURKNDBXald2dkJlOVhZSVg4N3hYcWZMZUE0TUtHS1ZR?=
 =?utf-8?B?MmNIbitCeVhtcVJpdy8vQlRQSXZXMUE0R2YxZkdDYTZSU0hvWmhnajBZdGI5?=
 =?utf-8?B?eW1TdlVpM2U3eisrMFQrUHVxUWt2N0NqV21OaTg5cFFRTDk5dkwwOVJJU3hT?=
 =?utf-8?B?NVVjQUxTUkROQ2c0QzhTZU9oVFVSS2FlSTRJVHYwTDFEemZNTFBFMDk5MWJs?=
 =?utf-8?B?YVc1b1B5N1djYmYzMk90Lzdack5wcjAxUk8rQ1J2VGs0dWpyTmw2SmYwKzJW?=
 =?utf-8?B?bU1YdjN5eXNpVG1LSTFvN2UwYjMxc0FZZ3B4N2JYMVF6SUJWdDFvdVF6eGZl?=
 =?utf-8?B?ZFVTRlBCWlNGZnhSMDVqOUhOVVNWdkRNTG1yV1JnQnJVTmpTRnJsVG1yL09C?=
 =?utf-8?B?WUhpUXdrdlVWRUVuSGZ6aUtHK3pDUlNBN1FJSXE2YjlKWWFKVEZabGpKMGRy?=
 =?utf-8?B?R0NobTJjTFJxUi9qTVpjSzhWVnRGOTE5STZ1TWZqYzJ5VVRWVXBMZ3AvL1dh?=
 =?utf-8?B?dkJmUUNrQ1F4akhpMlU0dllnTG5kNE1yREZhY3Z0YnFwVjRIQmE3dm1XRUhy?=
 =?utf-8?B?TC9aTGxKNUE2SXgvcDVUQ3dRVGJydjQ4blc0YVpWeVpRa2xkR0NNdTIyck84?=
 =?utf-8?B?bmw1c1ZiQm9kbm9GbkdmNnE3SjVHS0NaOVFnV3hNMnhyS3AyWFJIN2xQTWo4?=
 =?utf-8?B?SGY0V3lRbU0xNXNZSnJwbGI2ajE3NXFQQjlIUS94dGZHOTRuekRFdURXSEZz?=
 =?utf-8?B?MFVzZVRSdXJoc0h6ZS9LcjUyYzJncUN6WW9FdnJMUGtuaTZVZFZvMDdySEQ5?=
 =?utf-8?B?aC9xQ2RCYVcvaWhQdEQyanB6ZlRudUhURHhhZ0RCMWl0MGk3dDlDV0k3ckhB?=
 =?utf-8?B?QmhoeENROU1GdTNUdWJiWUpTSlFzeFVkSXczd3grQXI5Wkd0aDRPMGNJc0Vs?=
 =?utf-8?B?RzkvR1ErTkkwWU5Bc3dCdDdnUFp2WlJxZ0JubFBydVVRYnlKSmx0ODlKUjV3?=
 =?utf-8?B?amNBbVN1Tjlha0VNSDVWMGk2Q2VyWWNKUGNSeWlPdjdpL0dXRWh5N3FpMGZI?=
 =?utf-8?B?TkJzVU5LS1EzaEs1ekVyclNEMVBCR1R0OVpGVlJ4M3hoVnZQQTVPL1ppYkw0?=
 =?utf-8?B?OERYdnpoWU9KeGI4aWlzK2QrL1BIL3c2NHkwdUp3bk4vZWdPSThMSHVFSCt1?=
 =?utf-8?B?QmdlVU9qa2VoZmdCUXpneFdKaHhGSjNhK2poODhMSTBxTVIva0FWaTJkVmdu?=
 =?utf-8?B?S29EWWN1WVU3M3ZOTHhpZ0dDQW5BZ25mdmpxYVl1aU91a0I5K0hqN1p6eWxp?=
 =?utf-8?B?RGI0NDdxY0V6L0JrMnF6em9SSXZpTUh3Y1ZrRDNWOTNWd01UWHlHS2ZYRnlY?=
 =?utf-8?B?enVQVzRJSUhVdDA0WFUyVEE4b3lBOGw2R3I1V2RrWk9pT1I4WWFvQU5idnZF?=
 =?utf-8?B?K3k5ZDBoUzZMQ2NqVVpFSlNHQnNkQWVnWm1FVXA4N2hxN0h0WUl5ZmtIS21T?=
 =?utf-8?B?bW9qNGxTaFAvd3p4MzhiazJnMnd5YzR0Q1gwaHMzT3lMOW1YOGdWMWpxdGEr?=
 =?utf-8?Q?mxUfV2bnk2Yivg1+WWAHeSGnxS1fNRNr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:36:35.5593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc07888-64ed-4f3f-4c21-08dcc274c504
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407



On 21/08/2024 22:29, Stefano Stabellini wrote:
> 
> 
> After commit c36efb7fcea6 ("automation: use expect to run QEMU") we lost
> the \r filtering introduced by b576497e3b7d ("automation: remove CR
> characters from serial output"). This patch reintroduced it.
> 
> Fixes: c36efb7fcea6 ("automation: use expect to run QEMU")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


