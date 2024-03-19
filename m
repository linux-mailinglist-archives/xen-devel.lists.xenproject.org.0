Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12430880015
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 15:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695432.1085160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmauq-00013I-VU; Tue, 19 Mar 2024 14:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695432.1085160; Tue, 19 Mar 2024 14:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmauq-00010i-SX; Tue, 19 Mar 2024 14:58:12 +0000
Received: by outflank-mailman (input) for mailman id 695432;
 Tue, 19 Mar 2024 14:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UIi=KZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rmaup-0000z5-2v
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 14:58:11 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1879bea9-e601-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 15:58:08 +0100 (CET)
Received: from MN2PR22CA0023.namprd22.prod.outlook.com (2603:10b6:208:238::28)
 by CY8PR12MB8362.namprd12.prod.outlook.com (2603:10b6:930:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 14:58:02 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::da) by MN2PR22CA0023.outlook.office365.com
 (2603:10b6:208:238::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Tue, 19 Mar 2024 14:58:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 14:58:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 09:58:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 09:58:02 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 19 Mar 2024 09:58:00 -0500
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
X-Inumbo-ID: 1879bea9-e601-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkWxsPbwapFMqkH1k5eCSd+TNL5ZLnJURvTytWbzAUBVYPVsRYqQTPzEMIvpzDEXADKN3sx7kzu3a5r1U+OPO6mKFwuUMdTD2XOq6PhipqPkhtWNkFK6ryfHC/QBKyJARfEa4oMShUmiBMZtLv/3L8wKeBtG7TKLrUOfHMmPbaJIiOBub8Nd2OySbsHj/twhFc/wGluAQRin53LIwPQBjjvw0u/w3CM3VOyep4Jj7W1SDcKA/EcOhwZDh70j93RBf4JOPrSvuv3RaBhe6YzO9aA+CfhUtJ8qemTNpgVDRsiQHJBOvfhluMOtB9C9xwUkosRA10pufa6qggH+Kx9RAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh6tmfvN8fcDo+SfSU22ZT+cMk+cmr5zybKRLkkMs8E=;
 b=mcpHUkqIDNtOpip0mQ4ljqLuscm3HWZb8lgCLj7QiX2OkYAXg/M9wE0PUdVWKvA1ploesJEhy1wwYN9pt4MEeSCUEf0p6+7ZIuUxQ4K5NbPltj1g/VF6hBmNFXqKDq3vh5LbMKokn/SZtt9lklBg+9/T9zPDnqnDA3kCyXCQju7lW7IEj87bfoM/WyXe/PdU4OkkUb6Vce7ssrZAAK5XF8ysJ8qlpQDaHuE/r4He1V+FDrkemCMW/sUSJUkBKbcHKVUcfTI2bZdUcKHlkBgn+/d6806Vik6wxNBUQlMme9lS8Fnjxb4DpYT8qJW5jVww/1U02CgcFWHheZ+Jwmpzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh6tmfvN8fcDo+SfSU22ZT+cMk+cmr5zybKRLkkMs8E=;
 b=loL6JEqm/kFOX+KTboMxkLlAR/irhIIVbRy6j4xhkeJ0ToCCpKnMrym2yDbLJbUtHHK2DUBRn5xZC1/4gInZbGHdpm6skM3phnF0mtaFqim+GpcP4Gk+bVAm6dyX1bxrrIVOPOl6QgP8X9kkWYVCASxiFDMoAg1p3p3NwKOrS1A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0dd4d824-068a-4975-a1af-e194337a64b9@amd.com>
Date: Tue, 19 Mar 2024 15:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] xen/arm: Conditional compilation of
 kernel_info.shm_mem member
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-5-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240312130331.78418-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|CY8PR12MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 9deb9f31-0f01-4d36-8f26-08dc4824f9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jC2ZlGRpDPj0vt/We8sXD3w2g9I54PfbAyy1DDd5ZEMpScE7u8FcI4LkNLQwywYoRMRE+QBx76l5kv9SQikcyZDc6IDzKpi1HeR3/Xfn4773/or/cRYsLbrK2zD8O7TXeMQIrHEelVWrGUN3TKu1VQh+/n7QGwv/ldqcdIgYvWNKkoD8GolwvHDr5fi9cbFFo45SzeFFcInANMRS4L79Iykz2gxElZG2+sfzdzuMII2nyXUxZg+CxJsGMBkAaLuM5eC1dmFtdRqJKIzzW6NrGsM567A6r6+Xvc7RBjcYf9A1+eQXniARYb0nH90fk50Pln+oIPJ6o5e1eFzRgRuTu5JYokzA77dFhYsTW5BQaoS0KlLYvmAOqexVBI41aIzFbVPn4+ScCbxWeL3Ldkuczr3QD9dXRQhOwVE7lHr+howK6CcbU2E3TVvCTDqB5hy+lVyo5kgcXoCBTKezKP4ekdoLMUJybG8l2nuZWO4dtVUgHywozbTw3gvVQzr791eXRabJlvlpftTmdzXXvTYdTom+TF9+teDUTHd/KVUwXfd7bXobI+k9GtYPdfXxePGGeXKaVpugsSMmIgkL6ZQTqySY55nAUYuI5gIkq3vqAawFJ7yU9tt4bWIC1Jtm5LG11vquK3kMqzq8JUE38UvBuHSeUv7GDE3+Lv4LPHl9K1hPbOMXe5OdbBsZrlDJhbhgv0+7xcRnFeylZglt6t6Kgxy1uBQGO7Y1uTUmq/z5E3ELPz6q8gX47rZZ7wD5yPix
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(34020700007)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 14:58:02.5926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9deb9f31-0f01-4d36-8f26-08dc4824f9c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8362

Hi Luca,

On 12/03/2024 14:03, Luca Fancellu wrote:
> 
> 
> The user of shm_mem member of the 'struct kernel_info' is only
> the code managing the static shared memory feature, which can be
> compiled out using CONFIG_STATIC_SHM, so in case the feature is
> not requested, that member won't be used and will waste memory
> space.
> 
> To address this issue, protect the member with the Kconfig parameter
> and modify the signature of the only function using it to remove
> any reference to the member from outside the static-shmem module.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

NIT: I always wonder why we have hundreds of functions taking both struct domain and
struct kernel_info as arguments if the latter has the former as its member. As you are
revisiting the function and modifying parameter list, you could take the opportunity
to change it. But you don't have to.

~Michal


