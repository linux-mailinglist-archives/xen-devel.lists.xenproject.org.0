Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5A97E695D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 12:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629615.981937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r130B-0001BU-Kl; Thu, 09 Nov 2023 11:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629615.981937; Thu, 09 Nov 2023 11:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r130B-00019k-Hg; Thu, 09 Nov 2023 11:15:11 +0000
Received: by outflank-mailman (input) for mailman id 629615;
 Thu, 09 Nov 2023 11:15:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/1w=GW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r1309-00019c-Ix
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 11:15:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c0cbced-7ef1-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 12:15:06 +0100 (CET)
Received: from BLAPR03CA0174.namprd03.prod.outlook.com (2603:10b6:208:32f::11)
 by PH8PR12MB6748.namprd12.prod.outlook.com (2603:10b6:510:1c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 11:15:03 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::2) by BLAPR03CA0174.outlook.office365.com
 (2603:10b6:208:32f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 11:15:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 11:15:02 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 05:15:02 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 03:15:02 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 05:15:01 -0600
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
X-Inumbo-ID: 3c0cbced-7ef1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0LmfJ++A1R45kqbOTm6XN1Dltjs0RG57ok7ZFm6JPumxtmmw+Fnn7sM/PqNOktEUBx88cJXav1h4hAAT/5vpQMjq6IfwpFqI8AGxGfF0+3Y6UU1ESnBzoOOJDbjJRZ7YLa9oTfayh0X9nrRhbkreT5V9J6uuTgb7+BmBDtB4Eks6WBkkJ6fJFTOo3Z58kz75DBOSDgHfwHa3czmg1T51Fr4NY7Bu9VvhpSEkFq1CJUeUPcg6HJKutRCEAqerCj1eO/4fITS0/rlUyGaMjTWcq05mMpBiWZv1GsaE1vIz14sjDGWTpuliepdX8GvAdsshnte6mogwXeqw+kCscmNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeAdgFk2ZgPrs1MfXYt+/cxzHvz3krNaFewDB5CQbOM=;
 b=aarAnzUpsZUtfrweIjYkm79cUtN1q/OFRmIqTfC90xZ6p6XVVX/n+2NBCObIzS1n8vM+SZFSnuqUoulHWC/6nHScAF+e/OcQLJk3gxxZm9fxpLlHeyJxJFPWuHW1USKlB5e1L4ctsY1R1i5w1x+ix3gSeQxocQCFl1eCkcRN9ZiMcV5tt+RXQuA0tyEqCsyDjT0aIX6EhQOnlPn3dE6SjwCG62u//LInlDYrIJrFK69LUzuVpYhM2ch2oeAMEqNVHRK5Votv1ZzzePgm/g1XivfAfQ4+lbb0GRMN2tB7YW+2znG8gsEv83dNX9iYh9SDZx97yvUpiuujmK28DSeECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeAdgFk2ZgPrs1MfXYt+/cxzHvz3krNaFewDB5CQbOM=;
 b=0ooERydQj1soylQ+awx7ZIyo5qUONKeND5e+WBHwP5RUWrMEXQpRmd2RMxBWy+oKiD005GYw8KMIFLJUcBxfLOQtz1UqdtXsHo2GD83wbKhWss7hGRZg15M2Sl9JbinSYK08qXd/9lRuXmUt7o5FF93ioMLVxkBOH5LPGcFkCBI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <cea75c65-ed76-4f23-a0cf-7500da9e3e36@amd.com>
Date: Thu, 9 Nov 2023 12:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] xen/arm: Move static memory build code in separate
 modules
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-5-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231109090615.3878767-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|PH8PR12MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 1349c4a2-ecc9-4573-4899-08dbe1151ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Vh1s4DLZASRsffYD3CtEF3D7oFnHAhQ9qj+gbIDXAIZcm5uVFjnX1297tD/DP1+hGk8t9xr33t5WQ3LrziYSZQn3bUKbjwP/l6AcMJQKESPVccaj+09uJKUoaARWv4YgPAo+/dMsa+XuM4/ngK+rlDJ4dpTwsSdhZRyo1LU9/azZ13yGcitT+vwSjuf1/c1lsrinb6XRiZAkmLEnojadQlWd+TqOQRidwDA9w5AxF5u1tSAD7uVwh9K2pb0GDLiXugM13w2PRfYhnwIVHbEh55vUzarUBMiw6WxiF6Jm4YZ8CkuMQsBuJHBp1EffS08cdQOphD+ZPbreS5n6uFCy4/IS6zzwNWFFXy7b0F6fxMBbLiinV45KQNRA+5NOEM7tthQIc3D25OWvQZnCtH5mkav0yEjZz9N2GIgoWypQ+MkwtRMVfqd8WSuTk3K7AHdk8ocssOUKT72I9KWXPRxX/twRgEgDYDaSNIvBT4idryk72dpGEP2anLyHkbIRHODulcdNQxTgSqhwLPsYpuerJhqIF6wKpGjMEglWJBH+oTDhwa/HUe9T1Vo3eLnRUlT+3o4cXUx8HCzCoQeSXkSQsK3cN24qikThmAhh/1yTMGbHEq3zRLl4jbZbO7n5x6kW/0+I3iqMzgExyaf4YqkzqhbN5zCf03sVSTRTyjZx66f1F+SM/1TeDyPy+Vf8/wrgkFj//WtuIsRcuDKkaK9UEBypQ3rJbODDNWUq00rOoOJL6DFpsdMWs5RFyJIRcBVMpWfqCE7zOzOyoPZm9ARmmHhFlc2FaEWtIb1xboKFqiaGZ18a8U1FZsHkCwB8f6TkEnszr5mqs2uWiow2kZzC9zMS6T6Vo/LNqjWXFr7rYI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230273577357003)(230173577357003)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(64100799003)(36840700001)(40470700004)(46966006)(2906002)(31686004)(44832011)(41300700001)(4744005)(8676002)(8936002)(4326008)(40480700001)(5660300002)(316002)(16576012)(54906003)(70586007)(70206006)(110136005)(40460700003)(47076005)(31696002)(36860700001)(478600001)(26005)(53546011)(2616005)(36756003)(426003)(336012)(356005)(81166007)(86362001)(6666004)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 11:15:02.9094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1349c4a2-ecc9-4573-4899-08dbe1151ebe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6748

Hi Luca,

On 09/11/2023 10:06, Luca Fancellu wrote:
> 
> 
> Move static memory and static shared memory code in separate modules
> so that they are included only when the corresponding feature is
> enabled, doing that we modularise the features and we remove some
> ifdefs from the code to improve readability.
> 
> Move process_shm_node function from bootfdt module and make it
> externally visible.
What about process_domain_node()? This function is related to "xen,domain"
compatible that is only present for dom0less domUs.

~Michal


