Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0FA613925
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433001.685805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVxI-0002vp-8e; Mon, 31 Oct 2022 14:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433001.685805; Mon, 31 Oct 2022 14:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVxI-0002sU-5T; Mon, 31 Oct 2022 14:40:00 +0000
Received: by outflank-mailman (input) for mailman id 433001;
 Mon, 31 Oct 2022 14:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oXMc=3A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1opVxG-0002sO-Gz
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 14:39:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e14ee608-5929-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 15:39:53 +0100 (CET)
Received: from BN9PR03CA0043.namprd03.prod.outlook.com (2603:10b6:408:fb::18)
 by BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 14:39:53 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::20) by BN9PR03CA0043.outlook.office365.com
 (2603:10b6:408:fb::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 14:39:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 14:39:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 09:39:53 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 31 Oct 2022 09:39:52 -0500
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
X-Inumbo-ID: e14ee608-5929-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZII/Fn4ELcWS+Dph2b9XNqpFwKUX7wocV8z4scfgZUuyLvHIbLdbKk2cwGnJBRe2tQYkxaeCLSBsgKMc6hLdSInTNsb0ZVQBuPmrzq7PD7ciq74JUwSjrzjAMMNdt3XN9po+rAqT1NA/KNg7YcoAzxcoxvrgfgjeLOUvXasELf1OtQKbrpAlFbuLAE2HjSr/Eg6jt0sFBeZ6tWVhd8nWKGv4UX4VOvAKS5jMdwQM//OP8lmHmdB3mr1w3TDWVdNCh7UFJkr5k386koNCA06t/MYP4p7tlHRiWpGz7wNiH2AN/Vbl82BCGqfWUUZTySP3WjXKSuTjgTpecjZFjUYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kzh/2fMj11dCzNgbkaFsZ+6FEGFZsdHD3qiMMvY1mKg=;
 b=bMVgV8hCU+C6KVPer2StbuT3ieJVmRnpQ/HKaQNDeKMlWKoXXM7ynT31X/ps21BCgev106jGSnyLtzQ66TpsuRK+1nzD4Rmo7aJ0WCObzKKyUtOKdiSysFI0Egb9WKEcoZG2TwXc93/CyGrxQA4b3LBJczL4GvI/MSK+aOU7XtuQalaVFFklvLfIbMx/gBqI+f3KeMXbITyDajtw/p4hVq0iZ1++6IUkRZDBbDmcTiJvYsJk0dZLFwRA7T7DQk+pm2pMkOhZKncnPUtLoVNkseUwXKYRNGnpVt2zGVlNKjju8ykLT/laRgVtTqWJmEEuo6XdEFjvXLl4vUVpUP/WVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kzh/2fMj11dCzNgbkaFsZ+6FEGFZsdHD3qiMMvY1mKg=;
 b=pBmpnrO1i2s5dHD+bW3gXSzOPxPDCyHztScqwEBm6bWd+zDzb85cuHBgGzK2fS83UAPctRK5/Ye62ow9X0xMfnolxI0jGaXPRnUw83lKmV/sO8bq6NuLmIlLRBKxO0sE1c5QfnAhOffrkXpPDb4fGq3L1/Gr5G0Oqk8UxB0eOTM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
Date: Mon, 31 Oct 2022 15:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <cover.1667224593.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT052:EE_|BL1PR12MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: 1575bac6-6ffd-4613-2061-08dabb4dc5f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Hgpo3j9S/bS4PfSfkfFTnE3YpzP7wOA8289FZLQPxjvJh3zyhdUNrYGoHcWhR7JuXOoB5a5uflnfQBUpdEfpq+CSOZfvCZBoBE7EhYaIYYxfCYaJyy/IFU2EQyTXtUR3g3/2Dx91xG0m6oCU9GmqnC40WiK/u3gZw6uquluWpGSMnH3FW4CE0shO/iY8SoU6WCp6tfTzYI2DIs4d8eb+AOawrxK/5qnaS8nBI3+Dv8PalFtO1cBkCbDcZLHALeYZIsntymCjMdAp8kV0nFONUdGTW68aDoRw31MTiYtXgS4fJzILt7cpj92QdWyyHy8jD7YNiJMD5+mio/KKdakRoPjwXxJTmtsmUc9JmwgNue3UP/FrNexNsjkZaX3CpaK8eskgKuJXGQ5sDa2mgT5nd9LO8HktVK8mUq9mWoscxn4h8QkYwh+5Yl5XN59/fPL7RdUcQtaajLvrwSM9uzxV6P/NmlxwCENNbUU9OgdYYpcqsk1rADuNx1D7osJCVerX2K4/X58tHn6B7P+kVfHAj4/eGdvUOL/2pJcdmVMVbIeBsskL184MxtH8nEUUT/eFyZslFiX12KRtF4wu0ELCTEvI4gQY0+aNJrugCApPpSTuxWAAvfVwuNeW4KWLFNtGNMZo3WQExmDe+y7fx1L4CtHQxEZN28CKiXq/ZliYrmh1QzwrTaS8Fp0iYD3fgUUdh3Kh93UvlymYRpR/ZS1cl+FdMlRQZYob6WPpiOFWO7Qzi+6bCrwA3fzXxWaUtVMY+MGPpVAqYAMMJpDgthoae+cNk5LhWrakDm4H993shxYFO5SlvbNe620Td2UHA4ldUwTTNjtvz5ZEcuE2TfxJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(356005)(86362001)(81166007)(36756003)(31696002)(82740400003)(44832011)(2906002)(40480700001)(4326008)(5660300002)(8676002)(316002)(16576012)(8936002)(110136005)(478600001)(54906003)(41300700001)(70586007)(70206006)(40460700003)(82310400005)(36860700001)(186003)(2616005)(53546011)(26005)(426003)(47076005)(336012)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 14:39:53.4151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1575bac6-6ffd-4613-2061-08dabb4dc5f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5269

Hi Bertrand,

On 31/10/2022 15:00, Bertrand Marquis wrote:
> 
> 
> This patch series is a first attempt to check if we could use Yocto in
> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
> 
> The first patch is creating a container with all elements required to
> build Yocto, a checkout of the yocto layers required and an helper
> script to build and run xen on qemu with yocto.
> 
> The second patch is creating containers with a first build of yocto done
> so that susbsequent build with those containers would only rebuild what
> was changed and take the rest from the cache.
> 
> The third patch is adding a way to easily clean locally created
> containers.
> 
> This is is mainly for discussion and sharing as there are still some
> issues/problem to solve:
> - building the qemu* containers can take several hours depending on the
>   network bandwith and computing power of the machine where those are
>   created
This is not really an issue as the build of the containers occurs on the local
machines before pushing them to registry. Also, building the containers
will only be required for new Yocto releases.

> - produced containers containing the cache have a size between 8 and
>   12GB depending on the architecture. We might need to store the build
>   cache somewhere else to reduce the size. If we choose to have one
>   single image, the needed size is around 20GB and we need up to 40GB
>   during the build, which is why I splitted them.
> - during the build and run, we use a bit more then 20GB of disk which is
>   over the allowed size in gitlab
As we could see during v2 testing, we do not have any space restrictions
on the Xen GitLab and I think we already decided to have the Yocto
integrated into our CI.

I will do some testing and get back to you with results + review.

~Michal

