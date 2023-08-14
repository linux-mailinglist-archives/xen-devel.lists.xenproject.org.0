Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9B677B2A5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583257.913359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVS9M-0004Xz-EM; Mon, 14 Aug 2023 07:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583257.913359; Mon, 14 Aug 2023 07:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVS9M-0004Vx-Bb; Mon, 14 Aug 2023 07:38:04 +0000
Received: by outflank-mailman (input) for mailman id 583257;
 Mon, 14 Aug 2023 07:38:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ZCf=D7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qVS9K-0004Vo-8O
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:38:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e88::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d5f9d5c-3a75-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:37:58 +0200 (CEST)
Received: from SN7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::10)
 by CH0PR12MB5388.namprd12.prod.outlook.com (2603:10b6:610:d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:37:55 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::d7) by SN7P220CA0005.outlook.office365.com
 (2603:10b6:806:123::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 07:37:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 07:37:54 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 14 Aug
 2023 02:37:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 14 Aug
 2023 00:37:53 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 14 Aug 2023 02:37:52 -0500
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
X-Inumbo-ID: 7d5f9d5c-3a75-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMbesJp9NhoQLbCueZkCgKo9bp3AzeM+X6ykvsw9DhMRjkRp/CBNnVnHs4sn0EMMUW9wh9LXIH7zBWSahOrKGlgUVA/JkhVd3xVa9AMnQP6fIA8bmkCKldlblXN+jbqFMDRENsWGTbrOBg/3K+/YpRX+QazJFqi9IPBMW4BBblI4Kf4dzO2PA34QzTCx/fA+dRi3vMyLraaMcKChy1RIzjrkaCmHcGUJ0pIyGYErZr7TGF+Ll4OMG4WHTwx/boX780G5r1Pqu75uQ5E9Zq2rIQagI6LEvjhCmDvYGLEsvxV497rY9sSRSFkcEkOIA4rZ6rxwtHNk3NoyDXAQevO1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hLt7EYgTCmOcFJHhepMvtfSDUNli3omXmqEhW1+r0I=;
 b=lN8ZXwmgUMFCepM8JZVPakfnQwRjHtlBngAu59KzZVBItD2kCGona/rgHUN0PLhhN2Hinoe2thVgHLd4fT9ZiSwSLp46KmycmyITNWvq0H4LzPAiilG/tIysfya5bH7gSfjpNLvgxjABI4KRI9OHUwjGIhlroxP5MjjAl+egUhlzZijcNFhtfSjx6rwtFCd6TUAiRBT44cBtIeMDKZAVzkDODgIHhKmV78BMjqrkbNWExUgVXOfQsR55kFvrlCVfk2P4WpnTwUXu7s4aLikrcy01RWq+3E4/eP2rC//zGAy59eBjY4Pksta7vz53yHzsRafIMUM2xLmASdFRcLsdZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hLt7EYgTCmOcFJHhepMvtfSDUNli3omXmqEhW1+r0I=;
 b=oYcyCaMKWrPWpLp9XQZqXNGqkTPa/eEpy25oP/IK5VNtT1fuZ/hzneE3LwnnPjWJw4kqkd16LhdLRFVDzJGnY9T4MrLRfC96GCDrQewJfSL/XxHD3u7pmnn+OCJ3jbL++cfy4E+yo20wcm90AMbjBD0RxWaz/5w0QyVsXnSqskk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ec14c448-2165-9f59-a47a-2a9556a6d615@amd.com>
Date: Mon, 14 Aug 2023 09:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] automation: switch from Debian unstable to bookworm
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2308111842430.6458@ubuntu-linux-20-04-desktopa>
 <20230812020651.11608-1-sstabellini@kernel.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230812020651.11608-1-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|CH0PR12MB5388:EE_
X-MS-Office365-Filtering-Correlation-Id: a81f34ff-ac59-47c4-a6fc-08db9c995f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ru4d88NLfSai3YOspWQkShL7v7ybVdhNGqla2eFzib2jgxwzqPMFZEi8sOfoK2vpAVLDvO+6Yif53/guWQbhbuc3cFN0pGzIyXxFHvmgslqqeA7vjIekikpdNnBeqT8q7zTxVfuGFfhmpn9aKCu2Rl8E3pVETZtpykX0tPU2vnhkOjWVrhw8nUqZyeiZ4PXOEWlvo5lNxphs/uUx77QUv/LDqS8ntkypLxuAlUqxv/ckj2pvkl3YiFv5KbpIuK6hTxBcp3ikxYER+vovK1hnB2Y0j26zpDewwRlM6AKYkY3FyQu8rfUfOPYVDfeYFGRzV6Sg3pTMUp2nisjqfvopunI4ZodPqY1VWp2P64W6dhw0shXAlxqF/mY5cHDSZ4P2F4CcRccfNWt8cuJlI4fcSaSlO1ofDlFjTS4khj2GKJaRJG/qZ6FdkDWt+8IhJRuXe48sU63RxNUL0VcJ9c+hgkPwKUTmtgPIH4nWMZSTNoyvxyg2ayoeIDCj9RM1D/y9ZmNHsFjkC/OK8/OotnaK2ArYr9WoFs+a3pSFLqFCh9gcQatnsjaDOz7DZ2t2G3IuXkNY9XMeKZ31sX5xOAWC9fHblYyGqV7ymxSeNLya8XHzoLniw6DrvR1+KkEd1M7GTD7AVjXdql7RbhdmWsjRQAKOsKJ3llZjRqeEz7smSkQar9eNucdA8JIMhOW7vdvNh9eOsKabd0c/15k1+Iomgl5HOHhKUL3Atp8iWQJxf+v/DDsmL+wRTeZQNI3mmMz6bpiuYIl7CvxBe38D/Ak1jh+aea7ru5aoOQjULH0/MlUxdzjMfmZ1OOLV6CX8krSO
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39860400002)(186006)(1800799006)(82310400008)(451199021)(40470700004)(46966006)(36840700001)(31686004)(86362001)(31696002)(36756003)(81166007)(356005)(82740400003)(83380400001)(47076005)(36860700001)(26005)(2906002)(4744005)(336012)(110136005)(54906003)(478600001)(40480700001)(53546011)(426003)(2616005)(8676002)(8936002)(70586007)(5660300002)(40460700003)(41300700001)(316002)(44832011)(4326008)(70206006)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:37:54.6727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a81f34ff-ac59-47c4-a6fc-08db9c995f63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5388

Hi Stefano,

On 12/08/2023 04:06, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Debian unstable used in the Xen containers is actually bookworm.
> Switching to bookworm which is now stable means we are not basing our
> containers on a moving target anymore.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
You should also update "containerize" script to keep it up-to-date to allow
making use of the newly created containers. With that fixed (no need for respin):
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


