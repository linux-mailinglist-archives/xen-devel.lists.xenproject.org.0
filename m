Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CD4B049AA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 23:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043140.1413252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQwZ-000204-UM; Mon, 14 Jul 2025 21:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043140.1413252; Mon, 14 Jul 2025 21:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQwZ-0001wy-R1; Mon, 14 Jul 2025 21:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1043140;
 Mon, 14 Jul 2025 21:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbYV=Z3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubQwX-0001uc-Ni
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 21:42:37 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2405::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73ef11ad-60fb-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 23:42:35 +0200 (CEST)
Received: from BN0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:408:141::20)
 by MW3PR12MB4345.namprd12.prod.outlook.com (2603:10b6:303:59::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 14 Jul
 2025 21:42:32 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::bf) by BN0PR07CA0005.outlook.office365.com
 (2603:10b6:408:141::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 21:42:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 21:42:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:42:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:42:31 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 16:42:30 -0500
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
X-Inumbo-ID: 73ef11ad-60fb-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5j9uU7epIH5ilftwd9f0NnTBqmscyE3a44orPT4HTyVzAxGW2CJvUT4FKSzaXsMBRiYo47qP3j0k0SiFsCJFunHikGLsnF844mcaqlCPWBE9vn97gdAkimUr8jTlJbiVtISjWJO5elYVj9lf6Eyi0njfJoZBVg+Dhw9YgJFv94xQ+f6DR1bPEpxrOuoL5rhb96nkwc74O4shMCXe/vz8R4j5qf8U/rEVb4N0cf14mfdz2kdOheVju6tB+WLu4TbkcOTvhFjzimeznIBJdNCCUzxc80XX5tYf/R5uvFr+5mRf8SauUnRMi5RrqUdeYEZWoPfSb27uQLzKtmsPG1NLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvU4exCx6/Z7NnbQCbrrsiL9pA5g/pC7F3iL0anFBRs=;
 b=kKYOPAE1l3zAt8ZfJDQHXlPm03n5rNuOCQMp7iFJRsHjLUhtCjP0AgrQpV4PNglwZ2IxAiBci9FOYI8LUz1zJZVCRXrs1Tw0Kc+oZlclxHWoM7w561VC2It1AL2lXy9BRCY0MaOvDGHODLcj7jNnyHI+psU9pRnkqFxW6O3WY8xKwuENmR8jRhe+RNDlM43QoSNQVyu1wQjno+FHPOiLaeweakAOjLuaXM08aq/HBKIYRv+PW7EsVaCmtdQ90W7TiNVqBnDVlXxr23CCGRXT/0KY+8SOwP51w8oWgdqOrWiS21AS7DbOKhEqWzvJNPL3yNOJY3l4wBhH+GHVL8Wfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvU4exCx6/Z7NnbQCbrrsiL9pA5g/pC7F3iL0anFBRs=;
 b=JGPlINCZZN2AsMLEM6/SfJQ03ouPlhauISERSlymoOCXv1LgVvgxELMO840eDyHFAJDzy0f4h9rx9DLw7mooaIanf9Mv2P0WAi2YI9zSCzs3XprHe0V88srQDVclefECgqk2XftfE9gD38H3Ohsg91O46koNbXIt2eUuiTZp1LY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1551b518-1062-43c0-9daa-cf1aeb8b8034@amd.com>
Date: Mon, 14 Jul 2025 17:31:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [MINI-OS PATCH 13/19] kexec: add support for allocating pages
 from kexec module memory
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-14-jgross@suse.com>
Content-Language: en-US
In-Reply-To: <20250702081254.14383-14-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|MW3PR12MB4345:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b51d6e-bd96-4999-1b3c-08ddc31f563f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azNodVMzdHgybzZZUVFmNWd1UGRoL0hCRHdxZk9TcGh2RGVzMXlBNGlQbHdo?=
 =?utf-8?B?bnAwbk1YSStCMFJuaGxvaGpoTXZlNG5aYWNDOG1wVWNXV09VK1NJeThWOTZ0?=
 =?utf-8?B?L2RtaEtSeHdvSEc4M0V3SzB3TUNDSEtFU2dkWkV0VGlrSUFoSU9YSzBIWmxJ?=
 =?utf-8?B?MjR1Mk9LN2dnbnR6MnJYc1dTdWVWZkJDZ2wvazIwRHQrVXJUQ2JVcDhsejJC?=
 =?utf-8?B?NEZIOStVcGREOXE0VkNaTVEzSFRiaUF0eGRFdDc1ZTJzbzJMZXdiaEFHam43?=
 =?utf-8?B?WEhkcGE3QzRtWjgyTWJZUVUraFkyYWxFTmV5TTY1U3hLOFFhRXI2QkUxb1U5?=
 =?utf-8?B?Q050TnVYeU8zakxIV0pKQ1lEQmhuU2llM3h1SEZQVjdidEVpc0M4akV6aXE2?=
 =?utf-8?B?Y1QrQkNWU1IvMkdFZEh4aHpxR3lCaGpQZkNicTlOWmpNZ2J1NURNSFdZdmt3?=
 =?utf-8?B?SzNXVWRoQU5WcVlWb0tlaTJMVy95UTJqQUN2OG9PV0tnWEhweUgxVjFEamt5?=
 =?utf-8?B?aXpIZHlmTElTL3JqNExCZEIrQTZMMW0rOVBPQytlVkpuamhhajJnOWV1aEN2?=
 =?utf-8?B?MXJhOXNVVjJUdnllOHNpNlZZcGpMVVRKcTQvZWtvU25IVE9Xd1ZGbGxUZHdv?=
 =?utf-8?B?WHdJVEZKUGo3VC9NY0dlOVlBVVpXVk5VZmFFdmhCZTluNFpVQk04WTJPVnQ1?=
 =?utf-8?B?T0phb0hYaDJCVXpwaGREZ3M4TUh0T1F0Qmo5T0QzUlpoU2E5Z2QvQVRGY1I5?=
 =?utf-8?B?OTZKbCtraVg1NWEvRHNZa1QwOGw3Uzh1UUErWTRkL29JZ0R2UU9Lc3R5aERB?=
 =?utf-8?B?MTBySkx3cDZOQVFraUZTUHBJcGx5em9qRHRsT1JHZjhtOTM1TkFkSXJLMmd4?=
 =?utf-8?B?dWdwSDEzcGJ0bk9acExKNGJlMU1WMHRJbjVPN1hpVmhabkE0OEFuR1NDQzR3?=
 =?utf-8?B?NzNIY0FNU3hRUFFERFR6V3owT2I0UHl5WDZkQ215M28wTG55U3Z1YkZtSW41?=
 =?utf-8?B?T3dKcEt1R3NYL3M3bDIxa1NHaU5lNzRaeFJKbEQwOEdCVStLZkxQZjlZUDBL?=
 =?utf-8?B?NFg3UzZBK2x3eDNaRUZHYlpXR2VwTFZ2QUdPNTZIa0JFeXo4cE0vNXJLVEUr?=
 =?utf-8?B?dkh3SVBZb1drY3kwenRmZjRPV0tlY3A5UzF1MUlmMjlQK3pWTEZ4cGpFY0J6?=
 =?utf-8?B?MmxQUGNWMDR0U1ZaempSdXJjRVdLdE0xQ3c3REJ5cXpPVEgvSVp3eEdwWGkz?=
 =?utf-8?B?SC9nUGxMSm9sNWVXNlpyK3BMRko3ZHQrQ3lmOUt6QzA0YlY0b2ZkSzBTeU85?=
 =?utf-8?B?bjMvWjA2WUQ2ckVWN3ZqQlBWQnFPN2oyd3pyS1VveW5aRmRKTzJDeDhRYWg4?=
 =?utf-8?B?d0FzSXpjUGtsd0dPaGZLY0ozWWxabUV5NWRSbnBDWHA5U0RGTm9BdGxEOVZB?=
 =?utf-8?B?NDZ3VVNnTEs0Si9SMU5ubU5JQkFUcU1LSE5CbjJsYjR3UVhYWG5VUFdoT2hR?=
 =?utf-8?B?aG9XNE9iUmovVWMyR0M3Rk0vT3Z6bEFwc1dsSGxnQnhNdER2cU1mWjJRWnMw?=
 =?utf-8?B?QnZuaXJveE1FdVpFVUxBWHZpR1ZTRUVuTGozNEJNZ1NwTmluWlY0RnQvMk9J?=
 =?utf-8?B?aFlIYmdvVDJsOG1CdVc0dDhuNjYyMktIZUEvb3BqOHBjODhtMmRQdjVSYWhC?=
 =?utf-8?B?blo2UVRSMzJReTVlMUlLWEZaeE5hMjNNbk50MDJRYnpVU3NNTmk4S3NmRXB4?=
 =?utf-8?B?R2dtOGFxK3NUTFFQVHNNZXJ0anMyS0I3NG5aYnhlZHp6UEJmTGtJV0Y5aGZE?=
 =?utf-8?B?YTMzblN2OTgwN0NyNmNUWk5UMEN0Sm96T3J3aEhQYkxFUVZsYXdJYndaOXBB?=
 =?utf-8?B?Y1M3M3Rncmg3NVVWalp2V3ltZXlYZU9JNDRFcUpZVnYwd3NPMU5oQmlnUmdL?=
 =?utf-8?B?MUlrdGdwQWttL2c4ZWFFdjlSWEJXSFcvakdGU1ltUFR4ZGdmeEc5NVV6Zytu?=
 =?utf-8?B?eDhSVGluNVgrbFpXcEJZVGpjV3R4YkVaZitDSTBRYjRSK2dDTmljTTZOZ0kv?=
 =?utf-8?Q?TRrbBZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:42:31.4416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b51d6e-bd96-4999-1b3c-08ddc31f563f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345

On 2025-07-02 04:12, Juergen Gross wrote:
> Add the needed functions for allocating and freeing memory pages of
> the kexec module.
> 
> As the pages are always related to a kexec module record, add the
> related utility functions, too. For now only support adding records
> and retrieving them.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

