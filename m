Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525A5616110
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 11:41:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435788.689559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBBh-0002Wd-5W; Wed, 02 Nov 2022 10:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435788.689559; Wed, 02 Nov 2022 10:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBBh-0002Tm-2V; Wed, 02 Nov 2022 10:41:37 +0000
Received: by outflank-mailman (input) for mailman id 435788;
 Wed, 02 Nov 2022 10:41:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd3U=3C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oqBBg-0002Tg-IC
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 10:41:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb733bc1-5a9a-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 11:41:35 +0100 (CET)
Received: from BN1PR12CA0022.namprd12.prod.outlook.com (2603:10b6:408:e1::27)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Wed, 2 Nov
 2022 10:41:32 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::f9) by BN1PR12CA0022.outlook.office365.com
 (2603:10b6:408:e1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.21 via Frontend
 Transport; Wed, 2 Nov 2022 10:41:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 10:41:30 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 2 Nov
 2022 05:41:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 2 Nov
 2022 03:41:30 -0700
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 2 Nov 2022 05:41:28 -0500
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
X-Inumbo-ID: eb733bc1-5a9a-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mwx51ZVKWVxYJBIwZWEyf7IeDtlAJ7VqKDaLtzsCGpPEICkQzTh6vZrCx0hkivguwJnf4mQgBB4J60YCip8pgwR40WeWl2wpksFQIWGJ290Lax8OUrpqXmABPoK+upOWkIGlUFm1j/SJ+h7GjJLlJPBRuzHI3st9XOXwmYi3Ik1T6G0hVJAmqWaX+/QKz1ZpgKdR3MjzrBWJCMRxLldgZamAdK9jGAnfAQ7rYiHYYouwN6in9iEpvG8ecHN34A5esW53NJLyLaf3GRtXIMrLDJyH5g1clvlL5gekuM6igve62pPFRUeUThN2SpUlvoXsOPIgheVE/UTE29qJAudX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/61dQBjz0dzgrdbi5L+d0tNRXILRBKjyyY1wjD5yCQ=;
 b=Uk13Vs06jW6W2FboPzyO6y+LX6Z3Dbj8zbFX8fceisPOJIN5yvh2SXxEGdsTF92UOIOGDBjZ9hhVkol4PmwVcCZlpjLyQ/Lu0c+yKvUGsdSc7D89XAftVE8yufsWGzzr3U27TI85smUO5+WeTVJRDGFFm2K3tl8r+2doUbFEyDEkF/izO6P33PKz6IwAFBPwwLh0iKcE1Cve6+Pk/PjT6D5/IB1l8FqvTtK5ArsHaVzR0oI8gTml0jq/1aZx9bYx+Qqz+DuvC5DfnSXDQkSOSMuGwBF57Hk6MuJZGN91TTtpSYjkk2yjmpjNpsRThWVz0xjT0nhwgEUGjep84CaMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/61dQBjz0dzgrdbi5L+d0tNRXILRBKjyyY1wjD5yCQ=;
 b=WMmzT7YcDEFX9u/5cISX/2tevNFFxdXKiTkSrBQnmvSLxlXSSL6RXlLydKJlyeJjGHDsvkDRtJPe+2j08s1fDq6+Q48l16DBSIJlJe3Kwr4Z1l3YLyz5GNHw9bxDJRyzjHQRsbMJwSiFSI0GQDkuGmp6BX1BQBOaZ4Jp857cVjI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2cd6324e-71eb-f489-15ac-8c7438e03b0a@amd.com>
Date: Wed, 2 Nov 2022 11:41:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v2 06/12] xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on
 AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-7-ayankuma@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221031151326.22634-7-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT040:EE_|DM4PR12MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 720b5abf-78c2-4923-4c45-08dabcbecdc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Ilgm6bETglNRcSOJTkn3yonCwfjzh71aDcbyFGVXaBkWxaINlyZxvlZ6M9RJwM1oDedJJjBd9EYoqyyqDvylHGOWR2ouZWQiULIcFuvZjTQXfvdRUYZOYfl1fOh5eTTbLPlPysSjzVC/HFxj5F2AQFjWMLZvx2RVEmtYAZDtnc7aSicoAttI+RKWCVRcPj3iCvor1vcFM4ttksXvpahKAMkJTHbnJnOoFVngbIqw/saSM8I7cIyVIT/XnmQHklBMqacbe9cEfXkOpRik1JaceAHxGGtpR6SfMP4Qu9Bj/vDQpJYiA0h8mPjANrdwOWXzlnzimYgXa7ix6ONUhXgE+neQNqZUOqxdghroyWEQSK9qtdBppmtYr6yYbBOUBnZsMyJ3zg+o6ODw59TUZtZnGT83DDq2R68eu6mJbs8rnMIeNAOnM5Ugu2Y0obC0+uNzU2bPZIv0Bt8CIpnmwCXNLi/mkD1F55m07mGrlbTvBPIbg3b9Aq6zlK8ot5wsoQqKnm7rpzzDVsN2JHBIOqwYeQlSf0fmuttCmdMPVGQLAlxSX5OeEdF2SE7vzD1fBVO+7kiC2qEaXW2W1uSBtz/f3BZfx8EUlRQ6+jWV5deidMQVIx7rVDzI8xY/AsStYyUxV1JU7EXfJMAU51HJy/YD31hklBFEk34gg/8YPgALjoFMTytYumSTo2i5OhHFjSpd1Lfw0oVCInHf3vc+tVJhzeVuQ9R4dnBykL8+jCvMtkZgB31qqBSyVNV+0WumIuDbZLbo3zMmq64elYIAv4E8QKmNFKVkonQRbyAb96gmLghsCxl4f+mi1wYrFYDZoxZ/z0snNo3ghWFHJymQukn0w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(44832011)(26005)(53546011)(4326008)(478600001)(186003)(426003)(40480700001)(36860700001)(336012)(47076005)(2616005)(40460700003)(16576012)(5660300002)(82310400005)(54906003)(110136005)(8936002)(8676002)(70206006)(41300700001)(70586007)(4744005)(316002)(86362001)(31696002)(82740400003)(36756003)(356005)(2906002)(81166007)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 10:41:30.8036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 720b5abf-78c2-4923-4c45-08dabcbecdc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622

Hi Ayan,

On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> 
> 
> Refer Arm IHI 0069H ID020922, 12.5.23, ICC_SGI1R is a 64 bit register on
> Aarch32 systems. Thus, the prototype needs to change to reflect this.
NIT: prototype means function declaration.
vgic_v3_to_sgi is a function that has no prototype.

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

