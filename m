Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753E8BE542
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718153.1120726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LUn-0000R8-G7; Tue, 07 May 2024 14:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718153.1120726; Tue, 07 May 2024 14:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LUn-0000Oc-DN; Tue, 07 May 2024 14:08:41 +0000
Received: by outflank-mailman (input) for mailman id 718153;
 Tue, 07 May 2024 14:08:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r/6G=MK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s4LUl-0000OW-Ij
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:08:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4caafadb-0c7b-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 16:08:38 +0200 (CEST)
Received: from BL0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:91::28)
 by CY8PR12MB7219.namprd12.prod.outlook.com (2603:10b6:930:59::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Tue, 7 May
 2024 14:08:29 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::54) by BL0PR05CA0018.outlook.office365.com
 (2603:10b6:208:91::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43 via Frontend
 Transport; Tue, 7 May 2024 14:08:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 14:08:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 09:08:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 09:08:16 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 09:08:15 -0500
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
X-Inumbo-ID: 4caafadb-0c7b-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDrCSjtDeQHKuhOOGU5mmOyPMNgADY2Tf75XodKp58x4DepGGIuAuVsJSuAxYH/wX69H53NA8idjDUnFj2AzF7a/6RJRv3ZExsttsvPQg0JvKPKIS/K4G5LqV6bED+BsoQGxqzTVWrAydf+8UtnlsnGhAm3CQ64t2CE5ePXc3sZKs3tUXiPBP5XL99HpEDVNgR9L40LJofKlHcG7xG6b5BzP0e2GoT/LAlFjpFukyNA0qaQggd9OLq0aI4rROchP8iRMIsnUx6y8e5ip74To9wSyetDBUBlTOtypLQa6MoZ7lgnqp5OTOYP65n0barw8XzkT2HkdF84CT0VhCDg4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5NEyJuvreuOJv1SiUQGdPNtvBALU/HTlg5HwYrgl8k=;
 b=Kj6fKt+zszLRz81J/64ZDl4V20NJO5Pl3VJQp/raFM9twvE3KmVOx+rS+eMspNOCn16SAozA7zIpZYuDxCAwknok2+IEhjHpBvin/vmIYIHS02nymnw/+kL31YMtQYtAYMZX/2/IPuR2G0FzOxdy2/75pxqAOiPDEAsZyr1IQt6+JfiMRMToBHL5krtraiZ4GG906dhUOQTZu7c/j51aJiYXqS92E3npg/5iZdLwm5oKCN6mDR7+eYoVyBgumW3oBIh4mR0zsZciHjfcXY5ThOAUt2s5xtauqH9H72cL7FxSFvu/7I4i2fUEJn3b2cfbYnIkaOK77uakDmoPcNIzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5NEyJuvreuOJv1SiUQGdPNtvBALU/HTlg5HwYrgl8k=;
 b=qN11mdBFCNU/mNmIAghx4y6jLFXfMAzyLJ8v81tFenB0hXDxbi9mCwcI+jsF8N0J5Hr9KTVkBRI+S19n81py4AaR65rMfFwevfXBRl475F1ahrOnfYQFfMwWToP7RV0UyAlq8RVHXBl1MeZcH+ZZMQBFFlDIFSB3I4omLbnLrNI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <86e0857b-32f3-4e53-b869-604f7c6c82c6@amd.com>
Date: Tue, 7 May 2024 16:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] xen/arm: Wrap shared memory mapping code in one
 function
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-3-luca.fancellu@arm.com>
 <ef9b0a4d-134c-4eea-927d-5cce0b330aff@amd.com>
 <E429579D-8698-4A92-BD9A-CCD686D1720B@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <E429579D-8698-4A92-BD9A-CCD686D1720B@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|CY8PR12MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a331fc-4531-4274-e670-08dc6e9f2b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEJNNXpoS0RkMWpXWHJmTE1XQ1VwMHA2eEZzd0ViaXQ5TGJJdlpGNW1scFg3?=
 =?utf-8?B?aGF1NjZmWnZRZUtrV2NEdFdRcU5wZkJkZVU4ZE5DclZKY3NGSCtMWHRGQnFn?=
 =?utf-8?B?czZ5ajN1d0t2eW5LcEN0NzJTNStiMEw4dEpTTjkwRUJnbUVuQjVmNWFSQnB3?=
 =?utf-8?B?STJyZjNQTDhyamN1STB5N25ObmlPMStQOGkrQnZzenBycVdhcDJZQ21xRXJa?=
 =?utf-8?B?TFkvVmRqVmFMZjJpeXdCQXJ2ZFVUeEhjU0phem9mZklxMDJtUklQamVpeVNX?=
 =?utf-8?B?VThncmZBZnpiaFNhYUljN3Y3c0lQOXh6WGpSUUtxWi9yZGhya2ZBYlNpUmt2?=
 =?utf-8?B?a0ZWc0FacEoyei9tVDhsMURMQ0ZRalpNZDhRZ1RWZXpMdUxUR1RKZjlUTDVE?=
 =?utf-8?B?YzJWMEgyVkh6RjBKbGhqdDhmK1drbTJrODhFM0djUmd2aWl0Y3hFbG83L0RV?=
 =?utf-8?B?dzkxNXFaWG9QcWd2Snk1NzNVaUpRNUJ1TzdDeXFzdy9lRk5BR3pzS2paS1l6?=
 =?utf-8?B?dkNNazFJR081VjlrWG9ESHhyT21YbFhnK2VyRXh1TW04RVJaT2tmWEFTcWFs?=
 =?utf-8?B?MjdyMTNJYWtzL2pmWmVOL0xXQ1FUY0pIVWcvUkhRUWxuNXh6NkJoY3JReE9P?=
 =?utf-8?B?N1NvV2hNa3k0U0UzK0xSNW1CWjBTTS9ZTUNMSWkycWVmalcyOGN3eVB0a25v?=
 =?utf-8?B?ZlNsc3dKTUtNT3BaOThIdW5QdVZwd1lQN1ZaU3ZVSTEySVNvblRrOExLZmVB?=
 =?utf-8?B?QlhKdEczQUZ1MjRXYVN5Y1U2VTBjN0hEYXY5ZHAwK0Q3akZpT1cyRUxhS0wy?=
 =?utf-8?B?Q3BLTFh1d1dtY1lOaldseGVBb0FaclBCWHNlaG9lSmxDeWpOQlRRVEtsYXRG?=
 =?utf-8?B?bWtmYkJxYzcxYjhydWdwRjdmc0lNbFBadzcxUzNUNUh0aVJ5VnNNS3h5ZFht?=
 =?utf-8?B?ekhncFFmRGhUZTN2NjhWNzlBUkpkRGVoRUZOd0t1aDRHcmVDVHJlbG1ZWHFx?=
 =?utf-8?B?dlIxRUNFWlJoRmdUb2dUbS9LcVRTdkVkYnBuSjlxWFZ6VFdaMzJOaGxsK2da?=
 =?utf-8?B?MHJPSlk5YUVhVDZCSEJyOUhVMUxZTXE1blRSR05KSjZXY0h6WmdEMnBCcFZt?=
 =?utf-8?B?cFpKNUhCMElqRENBZTNFa2crbUQ5RTNrM3EyeGhTNS9STVhTU0UvTVZodStw?=
 =?utf-8?B?cVU0QisyWnJmSUMyL0pjakRQUlJpeTlwY0VoS3VrdmNjWWFxMGd1aVdwaG1F?=
 =?utf-8?B?TUJqQ3FKcU4xUjZteVBQZCs3bzRKOHNXWXlWUHY3WW9aZjY1VWkxR0lLTUtz?=
 =?utf-8?B?TVU3NHdIaHp4cXJ2Tm44RGtoSUdacVYxSUk0TTVRb1AxYTVESE0wT084aXI4?=
 =?utf-8?B?WDJSTFVYZ2ZRZFdJSkhDWmZUV2JyQitUemJtc0V6ZXdHMjd1Z2lYUXZjYit4?=
 =?utf-8?B?aFoxVE5acnovTGNTOURtaHF3amJBbXE1aE1xTWErMFVqdTBmUDVoZC9NTXhQ?=
 =?utf-8?B?ZHgwTDIrcGJYRFdxeVZPZGZOQnV6UG5RVy96TU5zQW5BcjFpY2ZsTGlUaVV0?=
 =?utf-8?B?T01pUUJnT2VmbGZoQmg1c2k2cFVXa3JxbC9Qc01vU3J6SmI4eXVvc28wU1p0?=
 =?utf-8?B?VEk2eENITnpBSmo5VVhpSmg3Z2ZmamNJYUpqU3FMQWtMR3oybmdYMGRlNXpn?=
 =?utf-8?B?YXF2TC9LOHdRWDZDd2gxS2VYOTN2bUlucFRyczU1OGFOeFZrZ1NBWnNWaGpm?=
 =?utf-8?B?QVZ6cE1yUkxyVVpvN1lZd082L3QrcEFJWlliVy8zZUl3ak1scVdMNXI4Q3Bz?=
 =?utf-8?B?dXNuL3oxUWFTZ2xvaHJiT3JJY1NvWmdlUmZaUHk4a2pva0ZTMnp1S01ubDlS?=
 =?utf-8?Q?aqtUUznhUSLTe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 14:08:28.3951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a331fc-4531-4274-e670-08dc6e9f2b42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7219



On 07/05/2024 15:57, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>>>
>>> +static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
>>> +                                         bool owner_dom_io,
>>> +                                         const char *role_str,
>>> +                                         const struct membank *shm_bank)
>>> +{
>>> +    paddr_t pbase, psize;
>>> +    int ret;
>>> +
>>> +    BUG_ON(!shm_bank);
>> not needed
>>
>>> +
>>> +    pbase = shm_bank->start;
>>> +    psize = shm_bank->size;
>> please add empty line here
> 
> Will do
>>>
>>> int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>                        const struct dt_device_node *node)
>>> {
>>> @@ -249,32 +290,10 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>         if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
>>>             owner_dom_io = false;
>> Looking at owner_dom_io, why don't you move parsing role and setting owner_dom_io accordingly to handle_shared_mem_bank()?
> 
> I think I wanted to keep all dt_* functions on the same level inside process_shm, otherwise yes, I could
> pass down shm_node and do the reading of role_str in handle_shared_mem_bank, or I could derive
> owner_dom_io from role_str being passed or not, something like:
> 
> role_str = NULL;
> dt_property_read_string(shm_node, "role", &role_str)
> 
> [inside handle_shared_mem_bank]:
> If ( role_str )
>     owner_dom_io = false;
> 
> And pass only role_str to handle_shared_mem_bank.
> 
> Is this comment to reduce the number of parameters passed? I guess it’s not for where we call
In this series as well as the previous one you limit the number of arguments passed to quite a few functions.
So naturally I would expect it to be done here as well. owner_dom_io is used only by handle_shared_mem_bank, so it makes more sense to move parsing to this
function so that it is self-contained.

~Michal

