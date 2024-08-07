Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC6194AB15
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 17:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773574.1184014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbiAz-0005H4-9V; Wed, 07 Aug 2024 15:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773574.1184014; Wed, 07 Aug 2024 15:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbiAz-0005Fa-6u; Wed, 07 Aug 2024 15:02:09 +0000
Received: by outflank-mailman (input) for mailman id 773574;
 Wed, 07 Aug 2024 15:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlkY=PG=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sbiAx-0005FU-NG
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 15:02:07 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 027c213b-54ce-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 17:02:06 +0200 (CEST)
Received: from MN2PR19CA0057.namprd19.prod.outlook.com (2603:10b6:208:19b::34)
 by CY5PR12MB6431.namprd12.prod.outlook.com (2603:10b6:930:39::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Wed, 7 Aug
 2024 15:02:02 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:19b:cafe::1d) by MN2PR19CA0057.outlook.office365.com
 (2603:10b6:208:19b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Wed, 7 Aug 2024 15:02:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 15:02:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 10:02:01 -0500
Received: from [172.24.53.91] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 10:02:00 -0500
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
X-Inumbo-ID: 027c213b-54ce-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3mQocEVCPwtZ1dshHR5xDl5hz+IwopsIJC/9BvBhj0KlG+kW/o8o2owAHDv+/YQZKR5nG8UYuR6mMP9xPTIidEXPXMLb0nPcTvfYeS2aDLNNraWFgwYQtpe2p9NRB6cYuk1VHmPwEvvs95EcDaC13gd5jo9vVKo+m1YqKVVkc++A2+mZhx9Xw+c2dAq3xSnd5QPBMq0JTf43mF6hBlVcF6B+KLCfLZTsUz5T8YHQm0iLfqPv358DHPVp8KOufAzU8GCgNZemD4psHYAVCCuIt9mGQQaA7UMaMxFORL++YlbEhNQKD28K11/FFE3A0mwjlhp7lypmz8yPu0UcZALPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYYUaF/FTTY48T5J102NLO42+tpmVcbrbpil0R9w4dw=;
 b=ngui8AzShIVfFrImCGqxfbPgqSImUqJwJEqlAkydB0nZWII+vQlPIdCUjnG70IzmBNVpCQT6ZqzzudDokgd3yjSk6G01lvZ0a+1a9jVCprre0wkCfSkYg7corqDyLiGn+uEeXxxXucGc8jzpGElFokj2xAAr/onuHyWsKWInt1UNmhK5UJCXc6CvKcA9objqxNtkjf0Jm4jppIp9wu1C3cXoJn335H8r4xwx8Hy97zj3h2cmZj5cd8KnLCQx7GKeyRgE9FRFbSLUZzQ8k7S+IQdV0NcaLCqx0LOQPgbz2is4m/p5wqqApb3XSG3NaO+gWtNksg+mitTFFD6J+l0ImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYYUaF/FTTY48T5J102NLO42+tpmVcbrbpil0R9w4dw=;
 b=IOF60S8JZTtwb0BnUC9f8YidiK/XRAzbKMsmBdvmyNos8B1Zyy1n9scCgCBYPd+PKqMUncXeIGrmCs+Jq/VLJnt7ISPho3+zcOTFsJkfnuHzN+dqrHhA69Au0eRu6lStB2rhpzptMgultSGp3J6mn0iXjb/lDQk2VBjKd/QRJCs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <32d13cad-b9b9-4775-a18e-c3ac6b7c5657@amd.com>
Date: Wed, 7 Aug 2024 11:02:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: add suspend-to-ram and resume subcommands
To: Jan Beulich <jbeulich@suse.com>, zithro <slack@rabbit.lu>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <4e9f3590be9f19edb87e05c7b7c2efeae8863109.1709190010.git.slack@rabbit.lu>
 <500adb55-4927-4876-aa22-3269538bb4c7@rabbit.lu>
 <59e3fdd5-f13b-414c-95e1-46e86a4779ac@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <59e3fdd5-f13b-414c-95e1-46e86a4779ac@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|CY5PR12MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 401eaa12-1ad4-46f7-6d6f-08dcb6f1e486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlVpRnpCTWhKcTFEMXFqNzg5NU9LNlRWWWU1YXpBQStON2FQYy9zMkVrYlkw?=
 =?utf-8?B?ZW5teTdHMW1nUVIxUEd1cWRtYmtuTStJRWNiYmxYNkV3SzN1OFE3M1pUeGVn?=
 =?utf-8?B?RE4yK1NkSTdDL1kxUzd5T3UzaFZBRFdZOFVwR3c2cE10TExZWG5pQXluVzVt?=
 =?utf-8?B?UlJweERFTVFETUF2NVVLWDY2STduSzgxQm5iS29MVTF0eThyVVNFV3dkMHhq?=
 =?utf-8?B?bGd2UUF0YmpraUkwZTJIS2c0QStoMUFKdDJPY2lkMUp3OHpYdnBwMENiajRr?=
 =?utf-8?B?WmxVL0toYUhTWklEWmlZSzVpald6RXgvNlBEOEtZcHBIbk9BSXFsSzErZ1dF?=
 =?utf-8?B?YW5kbGYvcE13bjd5c3pneURKTU9qdWlXdlhiY2FtYWo3SW9BcVZCc3M5cE1j?=
 =?utf-8?B?T0l3YWxuL0xYOFBRdkhMamFBREVvMWVleVV1QXE2QUUxeWZ4dW1heTZvWGdO?=
 =?utf-8?B?OThPLzE1S1BWUGkzeDNYSFlPQWw2ZlZaQnpLNnkrM3NwVHF0dGNzajZabW5x?=
 =?utf-8?B?eGVtanFQWnY2OERYMHJKeVBsa2ZVZGdjS3lEdmVFS0k1VStQNmVCenVFcW5P?=
 =?utf-8?B?VVp6d0ZhK05XS1R0L1dTK1JBY25ML0tPdUFoanJrTVk3bVZHODRRa3VtKzk4?=
 =?utf-8?B?aExMOGhIRUk4cUtiVFZUUnA2dVBaUSthU1puWUlTU1NUT003R0hmZHFocVBD?=
 =?utf-8?B?enV6Z3BKSkVCTHNkQkxoVHB3Z3BiZ1JxcnNoMDBLU3NQZ0dYMHpVNURqaDg3?=
 =?utf-8?B?b2lFcGQ5VVREYnRJVHpjaDdETDN0WTQxdkljZDU1ck0xTjRVT24rVUlHeHph?=
 =?utf-8?B?QjNoMXp1UXFoYWJsdm1CY0FCYW13ZGUrbEp5N3lkQ2JrM0RPZ2R2ZVhzdzNG?=
 =?utf-8?B?a0xJSFpyWEhlZVZxaFh1Um54SVk1OFNSRER0UWtMTy8wVWwvajNrdy91V0tw?=
 =?utf-8?B?ZXFaV2tQdjhTdTNBZmZlTncrdmZPZ3lBKy90d3ZUS3JuZ1dpVUtUa2cxSmgz?=
 =?utf-8?B?MTM4M0hxNnRWcDNucVVGQlVkd25mRFdnYk8yUFJpWStMNDZmdFp4SzZSNHBn?=
 =?utf-8?B?OFFhOWZpa2J1cUlncG00ckNMSmthTUpFSnJ5QmVoVjdVN3Z4MkRDR09yaDVB?=
 =?utf-8?B?K3Y2OVhkVmw2anJRTUE4WkZkZkM4WXUyeFB3SHVEM21CNXhCcUJGdlJvQW1r?=
 =?utf-8?B?TWpvZ2t1anVqREJuZjgvNjd6ZXRtSlJ0Q05vVTNTWm1wTG4zNHpLZWdQUTBa?=
 =?utf-8?B?c0tzS1plKy9IMjlYMkJkNFcwelNJcVh0ZUpOaFJ6REZJWVZ3djNoNW1ISHpx?=
 =?utf-8?B?Sk9vZHZqN1hLLzZTQ3c2Vmh2bWZXeVhCd01rdGtaRGNQU1ZkekJJU0t5dW4z?=
 =?utf-8?B?RXZUV2ZYYk9OOWhaZHhlNHNFSzBjcFJKVU1kMFB1TTdlS0xRd2piODBsSTla?=
 =?utf-8?B?U0xTa2hpNzBVQmtTTzhCK1M2bXVSbTZMTXZtMDcwcG16blI3WTQwd1ozZlg0?=
 =?utf-8?B?cUZ3T2xYcVQ1Z3lUTDNxdFpKTG1JUmhhVTRMZ0pWT1c2aGNMK0NONVV5QzN3?=
 =?utf-8?B?SzRqcDdMVThic0JaU2tUV1JtUk1oS2J1M1pkR0JDV05Xa045TE55ZkdvbXpn?=
 =?utf-8?B?T2tVckNuMngzSVZ3aDBzcncyM3dyOFphZmFPRndGT09OcGsvK2NCaEJnalVw?=
 =?utf-8?B?a0c3WWRhY1BUSjlWUFBmR3BYc0N6UzhTL3F0NXAvRW1hemhkTVYxcEU1YzY1?=
 =?utf-8?B?THdWOHNCVk5IUnBZeFo4SzRKejlZaGRaa3ZLaWlvVTc3M0dwZVN3UW1vZmhQ?=
 =?utf-8?B?bU10eXpPd1RFYkVDZDhRdGFNRWhNdVhNbDJQNVgwU0lscCtSSkZpRGtqSGU3?=
 =?utf-8?B?RXJZbzM1MjJUaEhkYUgrRS9FTHhFd3ROOUNyUHgvMmR1UWkwN3U3T201YnlN?=
 =?utf-8?Q?hz2F5LWP+HfF1JCJ4P08o0tK47WMM/s/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 15:02:01.6531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 401eaa12-1ad4-46f7-6d6f-08dcb6f1e486
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6431

On 2024-07-30 02:42, Jan Beulich wrote:
> On 30.07.2024 00:31, zithro wrote:
>> Added my S-o-B (no other change).
>>
>> PS: re-sent to account for Anthony mail address change
>>
>> On 29 Feb 2024 08:00, zithro / Cyril Rébert wrote:
>>> The xl command doesn't provide suspend/resume, so add them :
>>>     xl suspend-to-ram <Domain>
>>>     xl resume <Domain>
>>>
>>> This patch follows a discussion on XenDevel: when you want the
>>> virtualized equivalent of "sleep"-ing a host, it's better to
>>> suspend/resume than to pause/unpause a domain.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
> 
> Imo you want to properly re-submit, ...
> 
>>> ---
>>> - Tested on v4.17, x86
> 
> ... with this testing also advanced to 4.19.

I'll test and re-submit this.

Thanks,
Jason

