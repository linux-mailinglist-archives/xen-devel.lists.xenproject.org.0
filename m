Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FEFA893C1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 08:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951941.1347550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Zbd-0004pG-N3; Tue, 15 Apr 2025 06:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951941.1347550; Tue, 15 Apr 2025 06:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Zbd-0004no-KO; Tue, 15 Apr 2025 06:17:13 +0000
Received: by outflank-mailman (input) for mailman id 951941;
 Tue, 15 Apr 2025 06:17:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mbqe=XB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4Zbc-0004mw-1X
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 06:17:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2415::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 424800d6-19c1-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 08:17:09 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 06:17:05 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 06:17:05 +0000
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
X-Inumbo-ID: 424800d6-19c1-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leSzKzVDxX25vVCAcE7VTNF1PMl9oup5CV+gYT9Y6rKOKUR9d28Rl11ARjSe2CC5CCqmv3SBSYZBzoxtYK+U6CZ913GUhFNu2TWtWE4JqUdLkop1E5/XpK8LKy5CiSng39cqyGIUvPKkstvUc8XyKHS0ufmaa/j85CNVg7wYZSUKBWRZaSj6BK9IHXUYqispLySDxlsuBMkJbOMAPpK2odCRnxh61rv3uFa+5XDIywWYdykCjB0afNDKcMf4c4e+Us9H3Yvg5WSpG/Syb8U6Yp3DQ4jiDvFXk30RTTXxgyqJBDTlu+Egx86jjO6QrHADqlL51n/apNoBNbDUm/oiWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOumO4VpLPUn91AvwhNi8nzir0dcLkg4zI2wljtJbm4=;
 b=CjcWqlOtOrQrDmBZz9TYFYb4EQKSv7E8qCbWTfTRh0isKDOYhP/8w3m4Hfofki+zvXRrfpB3hS89upSMDbpDNhYCSRozMzBlbAkU4zbfXNFS+KcEy3mIPNGh7LRH/ypkipRiq04A4wQk7osjfbPcevzVKmbJuXksYfBH3wNUrkMHHhkQLfT+X0c589gC9PHKYzB9xt8wa6stLZxVIePSaJuSg6OGBTUL2zLdEjqTebVM6OHNC39pG/+WsfW5gzqu3ALR5zZJAchK8tywU5fwvqlUSomwJN1nIrko13Xy21LXyN0IaKhU3G4OJ5grRBUT+sD2cN0JR0Dx0yCOt4y6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOumO4VpLPUn91AvwhNi8nzir0dcLkg4zI2wljtJbm4=;
 b=y1XJSGHa52eBZf0Ppk1GJBLHwpKcIsW9Cf0chimAWzVX7Wf5U/Wn037R2H3kwyuC9JDawsjnD8RasQZt1nsXZ+tw2W1x0UwlqQA+Men8Kc+kW/UsfiGl3uC1rXtETAGjcEHvHG3ZqoQPCMRPVjbJ9EI15I3nuiNWM8DlDq+1y+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <07125c67-6f62-4580-ac8f-4cdea6fce91d@amd.com>
Date: Tue, 15 Apr 2025 08:17:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
 <20250414164514.588373-3-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250414164514.588373-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c45875-7be7-4c02-eb65-08dd7be5250b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGlnV1lzVmVPSjZ5UjEwVWdRKzVxNG1vVlI5cVRnYjd5czZnTWFKY3hteWpP?=
 =?utf-8?B?cHA3UFp3a0Z6MnZlbmpoakpobFZ4anR5b3Bvc1ZyQTQzTVFkREpSdmprVkln?=
 =?utf-8?B?R2pLUGVQalFxYUM5QTdkMXg5K1RBYWxqSFZJdTBBM2I3aThEUUh2V3ZzbExy?=
 =?utf-8?B?UEV0d0dBUm5FRXhQQTU2Y2RyYXkrWTg4aGN5NHVRd0VOd0Vsblp2WVNqYTVW?=
 =?utf-8?B?dFBvTXRLS1VOL0pUdE8vRjdtenhpdkJjeVB6aHgzUTZyOEtzQ1IweE50dldT?=
 =?utf-8?B?ZTFvOWpzaysveTlVSU5jZVRvVlpqTzl4V0pTZGVnN3QyQWJoOHdacGhtTkdH?=
 =?utf-8?B?Q25mK2JXTG5RTnZzR242ak9HNWVoS3FmQmtNTjNDTFdTQmVwcVQ5STdFMFo0?=
 =?utf-8?B?ZXRMUjU0ZzFlOHovYTE2NEZIR3l0VVc5dTNvTHU5aUlGWlhseUZnU2lqa0FH?=
 =?utf-8?B?ZFY4aWpmRllmU2NCaVZtL3lUdGQ0Uk5lTVVrdTI4aTFqY3dqN2xVSDFsTUhN?=
 =?utf-8?B?MWlFclQ0ZUMxUzRzNHJMTWRjMUNCRWdxSzAzZEtFbThNM2VqRjk0MTh5LzBo?=
 =?utf-8?B?bHVxTndONm5ESHZPWFNDeE41cEhHejk1YTF3QzdGZ1Q3UjlabVdCSzdMaFkw?=
 =?utf-8?B?MW50VFVaSVRDZzhzVGliY2tKY3FpSE5Zb3JLSHlKNWFSRFEwTFBscnExbW96?=
 =?utf-8?B?RVBWVWRKakdBM3ZSQWJqWlBtOGl2S3Z1c2Y5dmtySDFHYXI4M0ZUV0JiYmVS?=
 =?utf-8?B?b0xqaUdZYUdKSmlad01iMXc0ZFB2aWNXSkdlRTdxNjlEYU1Zd0NSaldXd2tt?=
 =?utf-8?B?K3dtb2Z6TmNjcU1QdFNTVi9TbzlZYlF6RTIvcFFPOExJNzY3TGJiWHp6cm5F?=
 =?utf-8?B?MXJwVzFUd0tVVkdSRDNRQW9PamVEUXh2a2FwVitQTXdkVjFRMDRCSXJabkRu?=
 =?utf-8?B?M1N5Q2ttQmlqdzhNazcxUTZLSHJIQWYvaE9ZdlZlS3hQcUtHb1BpTWtpckls?=
 =?utf-8?B?Z3ZteVlYVWtyMzRJYWRMZHFrY2lQYitjWERBU1hlcENRTFk2YkYweE5CRUhs?=
 =?utf-8?B?TVo1ZFhKaFVPVjQwM0ROT014Q3puYVl2cVgvZE9NZXRVRXFLQmhUUGtFUjBP?=
 =?utf-8?B?ZFEyb0M4VXhRTGRvS1d0d0JXb0JqYk1mUWlyRDRHdU5UU3FFSW1lNm41SDIv?=
 =?utf-8?B?dUpYajVPY1o4UlB2L0hpVGlpcFBBQm53R21ZVFRMZ3IzcnBWZFhYV2o5bnZH?=
 =?utf-8?B?TG1qWGlFNmRJLzBPd0VlQ01QZ1RGd2htandEakJ4YmQ4S2taR3lzTVJVQzVt?=
 =?utf-8?B?Nk9SOFFTR0hBck4xa1NsTnNWUFVUUnh4MXY0TWppTjBZYmQ4aUMzL29ySW43?=
 =?utf-8?B?ZGtuNWJLVmVodkV1ZWM3ZVBqQVR4aXh0VTVFa2tFM3hySERWVGZpK1NzSG0z?=
 =?utf-8?B?ODhvd3dOUFNLZnFkVU8ycldaN2cyZUtseUROMjdjeE9qdWg2YWszVGlhUlYy?=
 =?utf-8?B?ZGxLOGF5Q3JjWWV6NXFsSmJFZy9xWTlRYzhoUmpOclo0cU5iSVVGc1pWWHBG?=
 =?utf-8?B?QWJwR0tzV3FXRHh5UUd1UHRreGRUWTVEWTRVOWtGRjhDMFVBYUpVaUppdTlR?=
 =?utf-8?B?ZFVwWGRQZ1EyZ0gzWWhpTHRTYnoxRUQ4WjVoN0thSk9UTjJWREZvT05ObHJY?=
 =?utf-8?B?OEtmd2tTK2U1VHJ5bG9qNitzRkljYXVkd3hpeHBBcGhEdEVHOUg5UVlUVE52?=
 =?utf-8?B?bVFzUzZURERCTnlYdzFKanVxeVF5UkdTSkZzNG9xK25nVzBWN0RYSHNCcHl3?=
 =?utf-8?B?djZWbzFUNEFZTC90eWQxRFMwK08yTmpiMjMxNmpyM3ZlK1dCN1ZQN0RiZHNG?=
 =?utf-8?B?NmwvTlNkdmJGSVg3YkEyNEF1MXo3QmNyTDZ2akNmcUV4N2N4clBuY2N6cnF4?=
 =?utf-8?Q?y+kxj3dWUmk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkVMK1RPU1B3N0wrUDVzZ0QzeDhINkVqYU5qVmtScmtXV204c21Bb1lVS1E5?=
 =?utf-8?B?OHR0NHp2TGlEaWpwcVZ3YStWQzlFVEt1em04RWl2Z09kVzVlbWVNM1FwdzRY?=
 =?utf-8?B?MlBQdG9BY2puM0Vrai9aNmxDWEFXSlUvbEh6M2lXYkpsQVBycDhuREpoV29h?=
 =?utf-8?B?RGhmaFd2ZmpvbVpuQkkwdll3dGJDcjd2M3ptM2xPY1Y2dHlFZi9PTHNNQXdq?=
 =?utf-8?B?Y2o5QldjUE5WcXpJTFRGTnVFMFRxaWZsZjNqZWhET0VTQnVKbWhicEhXclBM?=
 =?utf-8?B?MmtsUTUyVXFJcDg5T1FENDNrVFVPVGhVUlFSS2t6WStjZ0dnSEZKMlYwNk5p?=
 =?utf-8?B?c083Y0JCaHpncmFlaHVZOXdFWk5qTzI1ZUZLTlN4NlpiUCtTcXhHMWE1RjRN?=
 =?utf-8?B?QjJ6bnVNREVoMmxlY1pKVVZaKzZqaUJuUnArWUc5WmJkalNraUIweGRBWEVI?=
 =?utf-8?B?b2k0YjJ0eUtlQTJTZFl4V3lEaHh4RldMMzhiSm9ZU25VcmsvaHNLRjVBMytJ?=
 =?utf-8?B?SWdvdVdiYlR1Q1hGaDJ3YnRrc1hEUHBFY2xqSHQ3U3hvaXBsL1VwZEVaMXNH?=
 =?utf-8?B?SFhhNk80TS9aWUpQZ050MmY0NmVLNUVzUERXeTZML3kxL0VQdkwxMXBWc1Fy?=
 =?utf-8?B?M2F3N2VZUjAybi9QcDdxcjBEeDZQRzRFTGthTGQvYjhld2Rib1RyVG0reVhp?=
 =?utf-8?B?U3QrRGVYY0VESGNFQnU1TXhkRitsQ1B1aGFnSzFoWGZ6bTIwMlpIa3pGWXZn?=
 =?utf-8?B?N3RKWkNURXB0NWNGUjJGZFZIUTZtcllRZ1NqYmQ3Mm52OFh1V29YL1ZTUjhp?=
 =?utf-8?B?MDdROThITVY0dnZnZXphZEZPd05OTkh1YnNRK0ZOSnZBQWhhc1ZIcmZMMXV6?=
 =?utf-8?B?cFFFNkFCV0E0MWgxelo0UDh2UVhXTmtQVmErc0R6anZITmNuWEZ3UFVrblp6?=
 =?utf-8?B?QTYrbk1LenRuYzd4Q1EzWHhZK3lIVndhZVdKcExobDgzMENSbVVmVklZK1Bm?=
 =?utf-8?B?b3FYRVIvL1dWRDBuNlVOa05iRndMSFRJZXVpOGFmOEgzdzFOUmplaWpsQXBz?=
 =?utf-8?B?SlNDaWJyOEp4bUE4SkR0YWhCdFFZSk15S0dXeVJLaUt3aVdCRitOZlBISnlK?=
 =?utf-8?B?TEQ3RXVRZXBHcXQ2RExXd3Y3TS9UTGMwZzEyNEE3UzVmR00zSmh0bUZYeUVP?=
 =?utf-8?B?WGVlVVJtM0J6dUVtYlpQMVlFRHVXbkx0QllXZ0FJRnYrenNiMDAxWE83c1FO?=
 =?utf-8?B?Q0x1eGZtWXpFaElKbmxGRjN0VVhmOFlENWV4eGpFS2tHSzl4eTNlVlRldllP?=
 =?utf-8?B?WTI4V0l2MnNhdDZrM0V6VzF1ZVdJelRkZlc1VzVneXV3dGN4VjBvQ28ydzZM?=
 =?utf-8?B?ci9NN1hMZHNSeHNBcWhJOW5CRUNSZlNKU3FjTWJ0eGtSMEpvUWU0TlplbWJi?=
 =?utf-8?B?UHNzQm9vd0NiZFZmUnlMZWZubHVQT2ZZcUlyL2tpY0taanNib2U0NVRMM3FB?=
 =?utf-8?B?aVFBemV5RmNlOXNFRHdQKys0bU41TDk4YnE0NTExYlBmSDdQcS9KaFpnQzRD?=
 =?utf-8?B?bkV4M3lBMjFjS0lQM294VnQ2dVlmajBJWHRIZlZnQnl1cEFCdlN0M3Y4Z3lK?=
 =?utf-8?B?Y08xZUkybG43Mlc5bDN0aGtpUnlJK01oSFhPZjNhZk9YNW5OSFg4YmlzY05X?=
 =?utf-8?B?aFMwdG4xamt3Z0tKN2lWN3AzRnNnYXdxVDErMG5YRUxGanUyRG1CVzBhTGZj?=
 =?utf-8?B?d3ZJZkNMMCtXSmorUjBBSG9VQ2ptdW5KUEQwSUVUYS9KTjZFYk02NEZrRzNq?=
 =?utf-8?B?TXJOMnVPMitHYlhZK2ZIVElPNS92ZXNJaVFjT3FSZWY2OUY0VTBSTHlMTCtO?=
 =?utf-8?B?V1QrK3FNZEdrQ1FZQXR5V2JYaVkxdW14M05BNVkveFZJRFZWRlVXaHRuNmN1?=
 =?utf-8?B?dHJnMVNlY1lrVFN2YnBWanhmeitic3VBMW9VVXgrQzhmRnFMdTkralF1alRB?=
 =?utf-8?B?dEt5cGxCMXhlR2JsT1grdEJnN0VDNkt3MVhzZjZzTEFkTnhKQ1Vrakk0Wi9S?=
 =?utf-8?B?ZWwvdFh6WjQ3Y2ppSXJWRTFSWEdRTThHR0h0ODAyWTZQOURKUmlZaDNzWDJO?=
 =?utf-8?Q?qHe2/k6uX+3Wq7c/cn4/sDOGm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c45875-7be7-4c02-eb65-08dd7be5250b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 06:17:05.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FR9lr2ICmbom9oo4BKcXOzMnF6F9bKJSU/DmGQbgsWg2CCUlKBiiOS4ytw4Ht7bH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134



On 14/04/2025 18:45, Ayan Kumar Halder wrote:
> Create Boot-time MPU protection regions (similar to Armv8-R AArch64) for
> Armv8-R AArch32.
> Also, defined *_PRBAR macros for arm32. The only difference from arm64 is that
> XN is 1-bit for arm32.
> Define the system registers and macros in mpu/cpregs.h.
> 
> Introduce WRITE_SYSREG_ASM() to write to system registers in assembly.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from
> 
> v1 -
> 
> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
> being done in enable_mmu(). All the mm related configurations happen in this
> function.
> 
> 2. Fixed some typos. 
> 
> v2 -
> 1. Include the common prepare_xen_region.inc in head.S.
> 
> 2. Define LOAD_SYSREG()/STORE_SYSREG() for arm32.
> 
> v3 -
> 1. Rename STORE_SYSREG() as WRITE_SYSREG_ASM()
> 
> 2. enable_boot_cpu_mm() is defined in head.S
> 
> v4 -
> 1. *_PRBAR is moved to arm32/sysregs.h.
> 
> 2. MPU specific CP15 system registers are defined in mpu/cpregs.h. 
> 
> v5 -
> 1. WRITE_SYSREG_ASM is enclosed within #ifdef __ASSEMBLY__
> 
> 2. enable_mpu() clobbers r0 only.
> 
> 3. Definitions in mpu/cpregs.h in enclosed within ARM_32.
> 
> 4. Removed some #ifdefs and style changes.
> 
> v6 -
> 1. Coding style issues.
> 
> 2. Kept Luca's R-b and T-b as the changes should not impact the behavior.
Note for the future: Especially for T-b, it's better to drop the tags because
the series has not been tested in its current shape.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


