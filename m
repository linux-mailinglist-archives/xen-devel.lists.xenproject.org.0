Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1DF8A93FC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708001.1106508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMDh-0001lI-9j; Thu, 18 Apr 2024 07:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708001.1106508; Thu, 18 Apr 2024 07:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMDh-0001jF-6U; Thu, 18 Apr 2024 07:30:09 +0000
Received: by outflank-mailman (input) for mailman id 708001;
 Thu, 18 Apr 2024 07:30:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qd9Q=LX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rxMDf-0001gC-8u
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:30:07 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7937b8be-fd55-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 09:30:05 +0200 (CEST)
Received: from DM6PR13CA0013.namprd13.prod.outlook.com (2603:10b6:5:bc::26) by
 CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 18 Apr
 2024 07:30:01 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:5:bc:cafe::5f) by DM6PR13CA0013.outlook.office365.com
 (2603:10b6:5:bc::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Thu, 18 Apr 2024 07:30:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 18 Apr 2024 07:30:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 02:30:00 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 02:29:59 -0500
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
X-Inumbo-ID: 7937b8be-fd55-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1gARDwOC5jZsGOZ2r59pSrOiFPKHIUS8Q3/ahiQ+iOg8XbvYB24CLsPRDts0soSb50TNrzhx6stHPMNtGARuL7+0NT0PaQCAQ8f9prqGHoM/o6J7zllZnUce4MDZx/S4FnwsNLCAJ2eSvzC65Av9RgBwILrcNt+PhnwI7wo+D9gdsHUdiB3XXkgR6sYR7gTIN1jLnQgVm+jkN1Nr1i153Q3VxYrmoNXRYKj3MUnDxFquCBEUbTdPoO5eQtBHjtm5j4hjvuqdg1V8Er/N6GukmbDLGjedb5dXUze4bZC/hTKj83X1DnKulMKZo54Qk3AgyAappSfrgh2ES7pMb7w2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRaiKWp+xsdI4WLMgfOVM3FLsbmAXpU2D4zBgQEyjs0=;
 b=GKkv10J7zAbJl13LZUvvZj0FnCXcIK/xIFpsDruH3bl/dB61S266+Rz4PLD7AagYHKGI6W8fLaCByGEiGDdk4jMFPxUoabV5R813s0D1qLanCoIsb3RgONu6001KVMFIk/mZUPOfmysxsE2sR+JbGFENzYUT1+c17pdYzy48lQpM3zA/9xrp4hOgAbmgw2nDsy/tNM7798caRD1fmb9SQ4o4jVaGS2iCIf95ATCYAb48gLUrfa31snYQo+HN1d6cwNaStTvaMOZPK5DQkDdOYIcZY8Wpuamz+Sudz0Oah07knExZq8kfuy+QlgNleXYLsZz+14nFUD4ZPiOONamnRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRaiKWp+xsdI4WLMgfOVM3FLsbmAXpU2D4zBgQEyjs0=;
 b=j7tFFl/BtfuG2BC5ezLCZaFxPRR+Eave3HKGR2Tefkxwo37FMSMw6hQbZwTBm8v5bdCzShc7c7ZThEc2zo6URu9Uah3t12E7aXU8ETLVXclhDcRpK2UjPSsclA5Z0hbYKxvPffUEDwHsevn6FV/Rmq+3JDhzPO7ijFQpuO4mHR8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2d7a1961-4a26-4a95-96b1-f351b4d3ad45@amd.com>
Date: Thu, 18 Apr 2024 09:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] public: xen: Define missing guest handle for int32_t
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20240417121442.56178-1-michal.orzel@amd.com>
 <e8210c90-e023-4912-8d12-640512c97805@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e8210c90-e023-4912-8d12-640512c97805@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|CH3PR12MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: db3e67eb-ba9e-428e-13bf-08dc5f795bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NJ4oEnJgLd8+0kWO3kRUUpc4HpncjiEiPHLEVqBgqkPw3szeNiHWuthEbZXDJXFs62vgzUIvEPkEYj3vItHclv4otbiiUlo00L49g2yXgB42hMS2Amxjnth1dfaHovmUNnSxbWJy1vw1kZHxKN0sTvhdm6tKR+cfEWCW6yerza288+ORVVHOuu7lXseYZQYA4izRdoguynBNyvuskrbyxbSPFHkAUQtcPOVI/7RdZXc9amzVYU/W+uEdN7lToNHZQmdaXVPz44dzeqBhqcv6KJSgMg/9BguQ1R1SfVkW+3+cCjIU9lQRfJkOMLo2PRDgx4juxejI7A/5ShD5rci1F5WSUIOHyV6ordWQVjYddm5kuz15obJxV8hsqFwwMLIdVqHZ31I1E8Xz2XqFNdLQlCpD/0cvvFkRV7na8s2SZB12Fv5iEBk+bA0i8pBm2n43rjRwUjTWLZZHKANq5fsmodMIrri/8vVHZ37r8XtJ4ATjsHJGxPAgUiOS6GkmhgStIVHIHUTg1GuZgVToUw6ilZ3BpEWau2zgWfy/mpz3zrZ2v23NPUTJ7BvZ+ouqxL4ZGthstLOthgfGmTjerHmLDUT/13g20EaZRT6W3B3uo+yRh1zCMC1SDEh902o3muTJkEd5HC4EhL+FZ5t3oslkQP0wOqa+U+jpBXwdyFeLgtWAzVh0dlqXznjkOLCW9pnlrbnynkCvVNusIGB8QiAjLzh9BYqLN673mbCfDzxzaoFM1CgoKIDnjzKEt7+eZKE+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 07:30:01.5439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db3e67eb-ba9e-428e-13bf-08dc5f795bdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852

Hi Jan,

On 18/04/2024 09:26, Jan Beulich wrote:
> 
> 
> On 17.04.2024 14:14, Michal Orzel wrote:
>> Commit afab29d0882f ("public: s/int/int32_t") replaced int with int32_t
>> in XEN_GUEST_HANDLE() in memory.h but there is no guest handle defined
>> for it. This results in a build failure. Example on Arm:
>>
>> ./include/public/arch-arm.h:205:41: error: unknown type name ‘__guest_handle_64_int32_t’
>>   205 | #define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
>>       |                                         ^~~~~~~~~~~~~~~~~~
>> ./include/public/arch-arm.h:206:41: note: in expansion of macro ‘__XEN_GUEST_HANDLE’
>>   206 | #define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
>>       |                                         ^~~~~~~~~~~~~~~~~~
>> ./include/public/memory.h:277:5: note: in expansion of macro ‘XEN_GUEST_HANDLE’
>>   277 |     XEN_GUEST_HANDLE(int32_t) errs;
>>
>> Fix it. Also, drop guest handle definition for int given no further use.
> 
> Such cannot be done like this. Consumers of the header may have grown their
> own uses. The declaration needs to remain active for any consumers
> supplying __XEN_INTERFACE_VERSION__ < 0x00041900. Which means you need to
> bump __XEN_LATEST_INTERFACE_VERSION__ and wrap the handle type declaration
> in #ifdef. Provided the removal of that handle type for newer interface
> versions is really warranting all this effort.
I think we could just leave this guest handle definition as is then.

~Michal

