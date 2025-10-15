Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FBEBE0441
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 20:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143930.1477502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v96bh-00006K-Ho; Wed, 15 Oct 2025 18:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143930.1477502; Wed, 15 Oct 2025 18:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v96bh-0008VD-F1; Wed, 15 Oct 2025 18:52:17 +0000
Received: by outflank-mailman (input) for mailman id 1143930;
 Wed, 15 Oct 2025 18:52:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzz5=4Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v96bf-0008V3-TX
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 18:52:15 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f58662a-a9f8-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 20:52:13 +0200 (CEST)
Received: from MW4PR04CA0333.namprd04.prod.outlook.com (2603:10b6:303:8a::8)
 by SA3PR12MB9106.namprd12.prod.outlook.com (2603:10b6:806:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 18:52:10 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::3) by MW4PR04CA0333.outlook.office365.com
 (2603:10b6:303:8a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Wed,
 15 Oct 2025 18:52:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 18:52:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Oct
 2025 11:52:06 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Oct
 2025 13:52:05 -0500
Received: from [172.18.10.234] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 11:52:05 -0700
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
X-Inumbo-ID: 0f58662a-a9f8-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kanJf1rqF0hPZpqQ7wL+LBy1D7FwQWzVKZ+BZbmaIWS8dkUyyk1QD10Y7RCAkSiJYOwB0CnJIhkPu1jBt98hOQ3Ne9LlR2erh2w2tR5t8iN4RRkH6OSF46HeCmFCKMdiQ+kwmjH+IQAzIDsgMlSh0UDy712AsEqgFbQAEpiYM6wjA6HF50WrbDBgaUp6MVt2G0OygcDQijPolo5+/YeNj/s+GbEiYZ0z9Zvx289WqZl7tuGvnI2YH2x4BnZQQCzxcweUKealpEtr0TExIWJDhefr37UsHw0+6yMrR7IpcIEB6D9hMyAkXMWiqnLae0kjAQQmF69H/fv6vYb3U5+Gcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfIDTQ4ZHtHMJTG7B2yhaC5eSTap5FSz9rY+Pm7zJ1M=;
 b=TBWEAkLMFkSXNi6onS1EawCs6+NwU6R16oCDO+69tn66LNO+9LHIY9olxd+sAK9AzRiBoXQe3BDXy7UsTQKdirLD5uLl4m6nsXTWl9u2TzcyIkK+86Y0KUn2yr0s7dpD+iGV8OcKA/4cpWko3SyPF05RIhCLakiCkzxe5w5VtzwA/R8cK+iEyRFI3ReDXpMuAp0jOYr6r3mRcKN4lTf+D44lBMir+WCdTq4vkVX7HFdFoQ62IRJWxcLfH8ttV8qmsc4GLwaVFt3jp+bBVhLvq/Yk0NErv9oo37mrFUWLhjYLv447A5Zmyf/RH1WPpTejCsgflMU5f5Wu/7iQxZxXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfIDTQ4ZHtHMJTG7B2yhaC5eSTap5FSz9rY+Pm7zJ1M=;
 b=fA6ALkRTEHPaPIKBv5ij7Ny1lfQDfZ24RmYv/EydOm5VMZd9n7r+DOgtJ2Qg2QCppqEs8Zcj2sc3cSfQf/4DAyg/o2JLGuuB53QKZc9dOTesmBNqlYISndzajPERVD5j7EiIoGmRLewn2AoANmuZmsIPQLoCdXSDqAt5+37kWSo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f3387925-0902-42b0-bbf4-99c614cdb86c@amd.com>
Date: Wed, 15 Oct 2025 14:52:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 4/6] tools/xl: check return value of
 printf_info_one_json() in list_domains_details()
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <oleksii.kurochko@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pua@citrix.com>
References: <20251015134043.72316-1-roger.pau@citrix.com>
 <20251015134043.72316-5-roger.pau@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251015134043.72316-5-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SA3PR12MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 21dddf7f-2879-4238-d1fd-08de0c1bf20a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUhvUE04UmJ6T1V4UWlyMXNGYjdNdFYyWU5jZXNSZmM5OE1EWC9wZ0xOamg1?=
 =?utf-8?B?dGdPTkN5WXNRTXU2Z0NqYS9KbHlnaHJzbVhUWE5WclFHZzE2SE55MzA1cnRS?=
 =?utf-8?B?TW8xa2U4K29Fd3FPaE9UZmROWWJMS2tnZnRYR252VVpUU21xYVNvdk9UQml0?=
 =?utf-8?B?UWxSMmxZcDF2L3BpSDNVZUF3MWxWSE9jTXYvdWcvM3ZNeWRUOHNKQkdaclJZ?=
 =?utf-8?B?RVVSRmxybkN6M3kxRTV3Tm12b0J4dVA2OWNMTE0yQW5Rc1VldmRRUDA5VlZI?=
 =?utf-8?B?K2RPc3BkVWdsaEU2dzVtTDJxM0VvbHR4THJUZ002eENTOHZORm14MmlxMDlU?=
 =?utf-8?B?ZlZqUkU0VzBsNFRCWUdaTTQvSG0wMWNwVTN2OHJLR1czcXZreWtrVlJoK3Ex?=
 =?utf-8?B?ZTF4Qlp2VWYwK2pQMC91ZUtVVXVzKzF2Snd4czB3ZGp6SWlycWxzVnBISUZ3?=
 =?utf-8?B?Yy9FclpqcWRseUwvcng1dWZyYkFNNS9XdFlBRU11akx5b2sxc1VHRVdRc3Fn?=
 =?utf-8?B?N0lCSGJyclNYRTZheGlaWktiaDQ4UWxERWNGa3JsbERtL0tKWWVOMW9rVHR0?=
 =?utf-8?B?SlFJRitaVEVtdGZvOWxoWnNGS1pJUlhucDRYd0E1YVlZT3p6KzQ4SVJLaFl1?=
 =?utf-8?B?eTJMZWpNWWpjcFBURHpqVS84ck14dksyamFZVk95NERPaDEyblhwUnhmakt0?=
 =?utf-8?B?S0JFSFdMclRWS3ZndlhXOUFmUEt3dFdONnpKSmtFU3JiNjlneUdabzE0bGVT?=
 =?utf-8?B?SzVTQ2JDbmo3aVBQNkdsVWtNdUN1ekhnSm9KazRkbEN6MHk1VEZoQXdVaExl?=
 =?utf-8?B?VmVKeG9HclJzaXFvUkR2WEZJMFI3STlMaEJBdXY3YzB3dlNPTVpZYlVJYWIv?=
 =?utf-8?B?a3RJSGtmRDZRaTh5N1ZXbjd3UWZCMC9QVGIvam5QM0hacm1wU3k0Y296WlVm?=
 =?utf-8?B?Y0dRRWcwb0VPNXlUbzVOeVQrUFVHUm5IdHdiTGFDaVhja3pSeXJGQkY0UnR3?=
 =?utf-8?B?bmZramxvUzhqZHh5RGs4S0tkUTFoZ1N1T2VDL3JVTDF4aFBDVHh6YkU2M3cz?=
 =?utf-8?B?ZWVBeTdTUVhveVR5K2IvNmhTQ01QUVB5Ni9vdUFheTlKeG9OTjVBZHF1aHVG?=
 =?utf-8?B?SHhlZS9vcVVZRHpMV2RKQnllN3N5WEtqY1h6NXl1TEkxdFZQbzBtSzIrN1dP?=
 =?utf-8?B?K2lUS1YzbG5QVU9INXBDNFBuVFB2YW50YXZYZnBLRGpRV2Q1N1BGQ3RLVHM1?=
 =?utf-8?B?NlFTcW9CQ3dNUDVDdXdOWUZqdHkvRWx1aHFpckVqWjJGK1RFV09GcVpyS1Zv?=
 =?utf-8?B?blNRQlRqTDZ3ekNONjZRY2dPVlRtZ1hEVFVDVk4zQURaWVlMWXdLdkxYa3VT?=
 =?utf-8?B?MDFHUEVIZXNSL1NHR1hGODF2Sys1Q2tIaUFxUUhvVVNaLzF6UVgrUGdBU3cw?=
 =?utf-8?B?eDluN1lJd202cUd5WTFXUHdLbkxaMGlMUjhXUjdwME9uaXFXbFRveTFwYWlE?=
 =?utf-8?B?RlFHT3l2dWFmM2VQdWtHM2VrSWpubm1VL3NyT1NONFJ4OHJ3b2RXeG11MDNK?=
 =?utf-8?B?VUl6aDBWcktCNExrZHB4NHMzZDZ1ekZDRnpnT1ZsMnlBc2ZmeGFrVnlwOTlP?=
 =?utf-8?B?UkZnNDJCZ2VVc3Y3L0FSVkNLUW1ZaFBYMXJoNDY1Ykp4ZnNoSHNXd2JOUGJR?=
 =?utf-8?B?V1pLUjUwWnpXY3hEN0JheUlzNkl1WjQrR1N2SGl0cEJOT0JqTjJHMS9weVRt?=
 =?utf-8?B?NEVSdzN2eDczSGFxVW80TGNYOFA4LzFuNTNTZXV4WTQ4dGUwZVgzRkM1Vml2?=
 =?utf-8?B?b3BBbm44Y1J3S1JScXR2S01sL2NLS3FGWVByZzZYZ2g1bysxUTVJSWIzcDBG?=
 =?utf-8?B?SjRhaW9sNmoyOWwrcVVqY01WTjdPdEhUNTA3Wi9FemJQWDRtRXFPVHB4encw?=
 =?utf-8?B?Sk1oWVpicXNzbHZPd1kzSVpWOU9uR3RkWnRIdUhPbmRhcnNialk1Y3pDaTAv?=
 =?utf-8?B?S09CMUdhYjR4RzNPeDdqVDhLQ3pvcVFJRDB1c1ZxTVZDNUtLWjFyUHB6VC9y?=
 =?utf-8?B?eDEvNUl3Tko5cUg5OHJwRE4zN0UvV1VkSWhVdjB0czFPY3dDaFFyY25DMHJu?=
 =?utf-8?Q?gkWo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:52:09.6284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21dddf7f-2879-4238-d1fd-08de0c1bf20a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9106

On 2025-10-15 09:40, Roger Pau Monne wrote:
> And return from the function early if printf_info_one_json() returns error.
> 
> Reported by internal XenServer Coverity instance.
> 
> Fixes: f6c6f2679d49 ("libxl: Convert libxl__object_to_json() to json-c")
> Signed-off-by: Roger Pau Monné <roger.pua@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

