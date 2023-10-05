Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E637BAB59
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 22:17:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613118.953427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoUlH-0006cF-NK; Thu, 05 Oct 2023 20:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613118.953427; Thu, 05 Oct 2023 20:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoUlH-0006aZ-Kc; Thu, 05 Oct 2023 20:15:55 +0000
Received: by outflank-mailman (input) for mailman id 613118;
 Thu, 05 Oct 2023 20:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dokh=FT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qoUlG-0006aP-1j
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 20:15:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa927bf7-63bb-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 22:15:51 +0200 (CEST)
Received: from BLAPR03CA0011.namprd03.prod.outlook.com (2603:10b6:208:32b::16)
 by MN0PR12MB5835.namprd12.prod.outlook.com (2603:10b6:208:37a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 5 Oct
 2023 20:15:46 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::a7) by BLAPR03CA0011.outlook.office365.com
 (2603:10b6:208:32b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Thu, 5 Oct 2023 20:15:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 20:15:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 15:15:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 13:15:45 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 5 Oct 2023 15:15:44 -0500
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
X-Inumbo-ID: fa927bf7-63bb-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtKWOtOOnEJpzA7agCnMpXdsR75gH3aF9H8ZAYh0f3/gkeE7b673Nu1YvTBRL8Jgekd384pnC0QwExRvw2SXJbz3/u8cD+gkUMFN0c6YzQriM+RqYapkhEysF18Oi6L2eApEVXSYtNUIlWUWXbGDiqU0CyJxjsE/V1Yv2iPoPZ0P8uWffFLTbX/NF5RpH20+8TrfhhKY0GjN6VuFEzIxZPLWh0UmkwOB90jzzkEzjK+Fdsu96dU0mOXZaR8KJM6tSyJpKrVl3Vy6v1vN3o97on4O/33ZGFQjuoSWtrX5z0Tyvg/UEa7UF7nmAARxDILgQs6JRgeZiaM24bqexgGh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFWJtjr1R4ZmXhaAM0FGC4gDS8Tum3//rC6Eut+RLyw=;
 b=WDKkUyv/5PR7KYt0bELCiInUVenlwGplEYRF6Us7p+dxmb7vt/T6eGzq5HbNuPBo150eQgA/mxipoZkEJ92FFH8PEwMWUaBE3AxU51oUm5+WqsksMS84Uy5tdlaNBjjvdT3ejhsO1qNdVttRaTMO0DnZl1ISNasBpcZjZ8dUQkfD3y8xfZjTMGI5nsYObHo6wjszQiQ2KRtRqqozmeI+GBM0tYtF/xDqn5YCu28uFGr6+EZubxFXbAvnGGlZC54SIgOjrFR4a7YpIYt53ixMxzG/0GMx7ALk24x3ARuCbwA5IfXjDSrbfL7rxhqX3ckSFU837Ko3ESo+cUORUOGkyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFWJtjr1R4ZmXhaAM0FGC4gDS8Tum3//rC6Eut+RLyw=;
 b=3oLB4kLtaA7lRBIg7QgaQvk3nYFZSUPZU1The9UQKlBPDsoGqS02AXVzaSjAG5+K5I+6vzpMNsPClRykYitFT6US3mUBwAlwNib0gsW1WTQIJ9FA36aARphqbPoQsPZEDoXVKWU3wTRagyzzAOb5PEJmp5WjIyfp68K5Ih7ZiWk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <edaa4c87-9e7e-485f-aa77-e330dcafa344@amd.com>
Date: Thu, 5 Oct 2023 22:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vtimer: Don't read/use the secure physical timer
 interrupt for ACPI
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Henry.Wang@arm.com>, <dan.driscoll@siemens.com>,
	<arvind.raghuraman@siemens.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231005165454.18143-1-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231005165454.18143-1-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|MN0PR12MB5835:EE_
X-MS-Office365-Filtering-Correlation-Id: f357ad08-44b2-4541-3d6b-08dbc5dfdc1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sccq+u3ToQKYS0p4Ed3v6TI7sVsI7xZO9qI+FoB/KVoRskRX8GnVonvkDwh7RqF5eqrVLdMUOn0YJ003trj3gAlxM+CXCIsJS331bwYDdIoYTNmBCWzLi0Q89RKckSVnjDrxyUwhMAGnbbRTyFNBdAfEbfKNJeWiTd5maex8cfBFTSiQDm98PjQgHJbD0XvJCwOE79uXwv8TgGhhzZ5ENo5u+Km2mvpE8Yj7P+jHBlZNTRpzMsn1RY4XeSdUzBxQ/sEZMrvSKT80JoGMEWTqvBima+ZqdmYJIzVS/VEYspbmg6dLAKzNpUmmHKDxNPOhORarGQY9yy5ecZLfte07Kxdu2I25rgvBf/UWeD12RI7sskOdufPUryNj5nbZdnLME3oV0QLz99lnsjShFzQcpWVYT9ncq7XgDqpMD9Fvb4hU1bJGwotf7ZEwxa1lfG9ZsGOAhv3d+DZU3odtt3chEfGucntKv8TwNNNTrTLS5RdaWcT0cQyA5LuwMPhY8qsRwBbJf3+4lQCDYQwVcwBgOKvuyRFiJdhAfLipXdPJlswBxKxTLT9OxqyqkJpN/SpSoPacgeClwTKA0NAZBuKJFsLB0os9hBgXz0rcRsR8T7QnjgryjxvvumGMy8qjdClF1ZQVpJQXEkQ8hdEbyxPcwOsgb9e6+9z1jRXRiCzCOAAB2UtjBG5hIJBrtA8Ex3Om50UUpknfOISpY9NGylPokT24Ffj/oMNtFas99zu5+N+rCvcmAsMHg0nPbGb1Mwxg06VXCBc7PA1p2i+s2ERwHJkTt728zcUja4dcNpoDNQAZ+cxcTk2XwEgwZxv+M8qF
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(2906002)(40460700003)(36860700001)(6666004)(82740400003)(31696002)(53546011)(316002)(110136005)(86362001)(54906003)(16576012)(426003)(336012)(47076005)(81166007)(356005)(26005)(478600001)(8936002)(41300700001)(4744005)(70206006)(40480700001)(70586007)(36756003)(44832011)(8676002)(5660300002)(4326008)(31686004)(2616005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 20:15:46.3830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f357ad08-44b2-4541-3d6b-08dbc5dfdc1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5835

Hi Julien,

On 05/10/2023 18:54, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Per ACPI 6.5 section 5.2.25 ("Generic Timer Description Table (GTDT)"),
> the fields "Secure EL1 Timer GSIV/Flags" are optional and an OS running
> in non-secure world is meant to ignore the values.
> 
> However, Xen is trying to reserve the value. When booting on Graviton
> 2 metal instances, this would result to crash a boot because the
> value is 0 which is already reserved (I haven't checked for which device).
Per my understanding it is not reserved by any device.
0 means SGI and for SGIs we pre-reserve the bits in allocated_irqs at the very start.

~Michal

