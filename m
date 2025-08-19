Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DBFB2CB0F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 19:40:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086776.1444969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoQK5-0002Jj-4l; Tue, 19 Aug 2025 17:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086776.1444969; Tue, 19 Aug 2025 17:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoQK5-0002IH-1E; Tue, 19 Aug 2025 17:40:37 +0000
Received: by outflank-mailman (input) for mailman id 1086776;
 Tue, 19 Aug 2025 17:40:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xG4o=27=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uoQK4-0002IB-1h
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 17:40:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2418::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ae6f843-7d23-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 19:40:33 +0200 (CEST)
Received: from SA0PR11CA0077.namprd11.prod.outlook.com (2603:10b6:806:d2::22)
 by IA0PR12MB8931.namprd12.prod.outlook.com (2603:10b6:208:48a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Tue, 19 Aug
 2025 17:40:29 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:d2:cafe::a9) by SA0PR11CA0077.outlook.office365.com
 (2603:10b6:806:d2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.22 via Frontend Transport; Tue,
 19 Aug 2025 17:40:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 17:40:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 12:40:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 12:40:28 -0500
Received: from [172.28.207.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Aug 2025 12:40:27 -0500
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
X-Inumbo-ID: 9ae6f843-7d23-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvldbD4WCWC4Pbp3ws+7hwzCwLvYj6BokDqbdwyfNO8hzj4mbUR7QSV3M/+tGwj5wYtPPscEmcwZxGmIZ6X4GCLxx8AvcGTRzxLJ4Xu9c31NNwkLpmoSocEARgGTLdS0kCeC+0U2uDXEikL23gQIKSQCq9Jf7U2ev6S7iWXHLBF1uSoe988qYkWxncdu48FeYWkNq4v54L9BmNRk7geAsjj6Oh12BlG+OunPUXC4HrmUowZ3ScpkmdjoX43hdEkG8Wuf8Wm8eiwJOt5eYqdKpB2XLdA0i6RyNE+/GtHhqinhDEBHKidpJZ6HEv3sN/QWbN+GD8bHw2oJSssoG+ABZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1BdeOuf9QUOOuYzEZ6NTRNDJNMVnMY5NhMV7Sz1540=;
 b=OwDhedBmyYgAFLoYSbE7XImM44ioCeRGurfiroOmMii0U2VSdRNDr86rhfHp0ZsvygSPjfsxwAPrhrKzNfBAfWaizKI5Erj309mX6Zl/YqlGlBPS4QxbBXaK7aYh6TZqEy9B4UdfMtmhUByyGqB0Kzc6fDONr9dTF6jPLpyCxhrSUdFUMQW2xqSovXfiGBFl5P0Jj4yHRoLdJWzseAmNdE77QyqFwDFfrixN9lQ0W6j9RFcJxncFD+2B9rXOPVFdpHjNwE6sIe8IaZFacyQySgs5ZchZxeExyUrcADMpoopgh0YxvARTEUM56CJ/s5iDiZwt2DKfT/MvpkRJqfgRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1BdeOuf9QUOOuYzEZ6NTRNDJNMVnMY5NhMV7Sz1540=;
 b=IZiEhFAJfiIYdzxeayy5CP7pUM2GZM16vK5I529bYOfq9asH2N4CQP6L1HnQCG/spTHnkp5KLkTliFRwT2nngkcd49d8xoiCXyYo6qQ3dUo/JVF70WLXMxFvwUSyR4yWaB6EW/74hokJ4XRbP3Q4CukgOLYy6A7+EtrONILlUJw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <da23dabd-8e48-414c-b36c-d36ea7ca9d79@amd.com>
Date: Tue, 19 Aug 2025 13:40:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Arm: drop assertion from page_is_ram_type()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
 <753ce2a1-8d9c-41ba-a066-abf6f625cb60@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <753ce2a1-8d9c-41ba-a066-abf6f625cb60@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|IA0PR12MB8931:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a65777-a469-45eb-8a71-08dddf477d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckZaUy9BRmJkV0gzdDhuTlhnQ21oV2c4Tkw4SlVZQm1kWEU2ZjRqRlpNa2l6?=
 =?utf-8?B?V0dHOXB3NVEzRkM1YmU1SzhKUmlsaWJBTEE2clBmN0ZITHpNbHl6ZllSYXpE?=
 =?utf-8?B?eTUyTjllY21NMU52U0E0WU45VFpDamJEUUZLeUhVQjFrMmtvMWdibnNEcThS?=
 =?utf-8?B?NDd6T2wxb1UzTnBUbms1K2QyQWRPKzN1QTY4RnRlY0Y5d1Z0dzEyK2t2aWRs?=
 =?utf-8?B?SmpJVktSZVhSaDRkWVlCbW1pY3pqNWRnT2tlTnRSVHExQmcxWHFKK2Y0ZEo3?=
 =?utf-8?B?NXhrOVc4bFRQczBQMXpZL2pLQzk2VE5XNzlqR2JhRXVCUHVoUHV6aHdQU01r?=
 =?utf-8?B?QlBPajRpZDlFSDVnMUNYVEVzRmorRHc5bkljZFFBdXdYaFprVXB1K3BYSHY5?=
 =?utf-8?B?bjdHMkpkSUx6REdCVUg5Y1EvUS9YcTJQVndHMVQrSU9GMC9jTkd3K014UnJI?=
 =?utf-8?B?azFRcmQvb3FmUXRRcnZtQjZ3V3h3YTVybG9BbHpLWnpWcUJsRzZ3ZDZ6eG83?=
 =?utf-8?B?UGJwcWNUZzJtK01jRXNzS2MrZG1HL3UyUHNTUWtadHJJdElUcnBxTDBNbzhZ?=
 =?utf-8?B?OUlvOU5jbFdtcmd2RW10aXhMUnZNQmEybXE4dXVVSWdoU1R4VVFzdHJkSzFJ?=
 =?utf-8?B?bmFLR2VWOCtVa2ZtbzgvT3BrUkYvb1lnYzlOaHp2a0Vac0RRWHZhODUvN2w0?=
 =?utf-8?B?bkN2V1VyM3IwUDVyT0l4RzBBOEJ3RWRXS1NiYmIvbXVvdU9Hbkc2U1FITG1R?=
 =?utf-8?B?TTRNbTQrYks0VTBPTmFCOS9TR3hCSldEK2JFUjJMSk9hT0pHZ0hwd3h2QkFs?=
 =?utf-8?B?ajAzcHpHNjZFMlhmN1N5TnRweUw2RUxpbVlBWGlibTNvUE5mMEVyTGJoUVNG?=
 =?utf-8?B?eFYyVmNiTFI4N21INUlGbGF0OHFCdVBqMUVEZVluOUNkeGdXRDNQd2hWTjhu?=
 =?utf-8?B?YlNwZUVHZXZiaGxobXIvVG14ajd5eWVxU05GSnNjYUUvSlFZQWhHTVBwRTlQ?=
 =?utf-8?B?KzQxRmw1cFBKLzFHcWVRc1kra1VvVmJ0clZYbGFnYVphVUxQMlEydFRDY05t?=
 =?utf-8?B?aDJuNHNGQlJmVU5OUG9VYzdRcmc5YkVPY0MxdXArWFJDd2NuQlhTMzBpQ2Y4?=
 =?utf-8?B?OVQxTStpOWxyNDZzUEVNcnFZVEtuemhzUUxXcmJIeXV2TEhKbTdSSnBFZURU?=
 =?utf-8?B?Z0RRYXh2VGdBUmlZWThuM0ZjOVdidDlOWDZ0RXpnbE82RGtCcFg3QzlmSjhF?=
 =?utf-8?B?Y2FSa1lpVUg1R3hnUjl1SE1ndklHMGpLZlVzVVEvYlVveFRtdk1yTGlzNzRp?=
 =?utf-8?B?bmZxZFAwSlhjZUl4Skh3dnlvdjk1S2cvRTIybXUyY1ZlTlkvOTJkZ0hpcXg3?=
 =?utf-8?B?N094emVIYTJaUnJubUUvMHloVnF5dVNaSkNwbUt2YXlhbFlEVG9vN1JrVjdG?=
 =?utf-8?B?M3drYk5uZjZrRUFqKzdWWmpJSEFqaHRQK1R3R1BhY3J5aUFpekY2eWt5T3d4?=
 =?utf-8?B?eGlVcDhQeUtzWHAvUWRvK01ma3Q0UmFZcHBrRnkrSzBxZEVOamlsM1YvY010?=
 =?utf-8?B?L2hHWE9tVXkvT3FHNGRtMW1sVVFRK1YwSUxWeW1nR3JnRzNlR08ydDFyYjR5?=
 =?utf-8?B?VDdPVWdndUdzcDhrQ05hN0I2Y0tSVGR5a0JxQkZzY0thTmxBNmluck1TaHd2?=
 =?utf-8?B?WDFxdm1PVEtaZ213T3c2Vm44Vk10RDRvUmFoajVCS0pjNmd3STd1TWdsSU94?=
 =?utf-8?B?WHRnbFQrU21TdFZhYUVGWVVDUjZ3N3c4blFOVGZ0bUo5bzR5bjdJV3k5dWx4?=
 =?utf-8?B?M3J1ZnNsaW1ScmFTTDBSSDRnMGpVTmVQd1c4NkhzcVRwRkozUXFScktIMWlx?=
 =?utf-8?B?Y3pqSzlLZzI3bDhFWGxlZGhJMUVZZ0xIWFZsWWJSMzQwWmxCSi9adXlWaC8z?=
 =?utf-8?B?QitzZ2VhR2dwSEFWclFnd2lQNVBSTlBtWWdOSG5EeWdYOHBHcHNBRXA0dzV4?=
 =?utf-8?B?QjBlUDRkY05WWjFidjVSQXNTR0xQTnk3YTFvbVh5R1ZWK0dLSFUzRHA0ZkJ2?=
 =?utf-8?Q?wj+FmA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 17:40:28.8920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a65777-a469-45eb-8a71-08dddf477d05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8931

On 2025-08-18 03:55, Jan Beulich wrote:
> Its uses in offline_page() and query_page_offline() make it reachable on
> Arm, as long as XEN_SYSCTL_page_offline_op doesn't have any Arm-specific
> code added. It being reachable was even mentioned in the commit
> introducing it, claiming it "clearly shouldn't be called on ARM just
> yet".
> 
> However, dropping the assertion from a function of this name is deemed
> problematic. Rename it to better reflect its sole purpose outside of
> x86-specific code.
> 
> Fixes: 214c4cd94a80 ("xen: arm: stub page_is_ram_type")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

