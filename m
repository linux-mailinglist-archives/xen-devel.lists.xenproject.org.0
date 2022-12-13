Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C4564B3F3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460513.718436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53GB-0006pH-SM; Tue, 13 Dec 2022 11:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460513.718436; Tue, 13 Dec 2022 11:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53GB-0006nF-OQ; Tue, 13 Dec 2022 11:15:43 +0000
Received: by outflank-mailman (input) for mailman id 460513;
 Tue, 13 Dec 2022 11:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nvb8=4L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p53G9-0006Xp-TY
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:15:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79cd57f2-7ad7-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 12:15:40 +0100 (CET)
Received: from MWH0EPF00056D05.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:e) by SA1PR12MB7270.namprd12.prod.outlook.com
 (2603:10b6:806:2b9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 11:15:38 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::205) by MWH0EPF00056D05.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.4 via Frontend
 Transport; Tue, 13 Dec 2022 11:15:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Tue, 13 Dec 2022 11:15:37 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 05:15:35 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 03:15:26 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 13 Dec 2022 05:15:25 -0600
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
X-Inumbo-ID: 79cd57f2-7ad7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMbEKkWHN+1J4LE5ypmUGXch5YMYCfjQf2XpYTxN+GM22FLya69G4oqPr1EAbDNwC62Nrel1s0tIAfYlYZluhz6rjNPWdxKgLXkIzf08FydiakDbS/q7XtCYbc3eItuDndLUXwA0k0FtnSlqp3omdIk3afFcJPgowSRM8cCutQIxUVIyfvHk3RIWK0JQTxDvtKzlUrzvrSJF9hW5hjZw8OJ9LtwD0Z/kuFUBAKgs2o74YRUDqf/ZK+HBKH5yDySW28EKGO/TNQRhUQO41xHR50fhAERyORLZzWNlVhickqpjdC7DifBlozSfJQLd2opJLZkiHNNSIIaSQCnA5g1TGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZv2BOBeiwQj8AIfhOvYiRfO9zZ/zOcsoW76c9Hyg4E=;
 b=CTx0AEjgH7SCpGumSD0MQpWAGx6pXt2Kd+bDLQPWG/lGSebVCScjRyHrxSPNx5fe3nNqHmt2ti3qL2/dURw7IiQ+60vB4Qv2PSnFlLWEmXfRI9nkEXmui0GDfca0+gM24iAAL0HTbmGM+TI+mQVCkJPH+eVNLCQc5YBP8n5zH64iAdEVpM4jN65KPOjAEJzQMbtBPrMsAcVuLzzYXM+Cb8EeMOzg7WC3ZGK39K0wvgv9q/llAveswhiTP6IwXbtEmUS0HE125uBaCQCwBJ9BqDz12CTtZoq6UZmMasIQb7HL6GOsd6mbvN475KNaxArZiGJ1U9zGZ1m41W4vgeraCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZv2BOBeiwQj8AIfhOvYiRfO9zZ/zOcsoW76c9Hyg4E=;
 b=hAZzEYpjZUC0CcH/LovRjJSKkIHB0aY/cyoAqsJ4vNnoIrgu3UTfBeBgnohQQF61zZrkv9ZFxjter2d9Do6VJ6xVzh/NKTqbiRm48XDfnHYB1SNjh8WKgbbciBG0m4bU6mg+Nj4UKvj1A61ogvr9gxwm7hagGRaAc6m85CoxJds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4504e545-04ed-2f2d-2fb1-b84a491aad69@amd.com>
Date: Tue, 13 Dec 2022 12:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 04/18] xen/arm: flushtlb: Reduce scope of barrier for
 the TLB range flush
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-5-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221212095523.52683-5-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT064:EE_|SA1PR12MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: c3927d49-004d-4bf4-5e92-08dadcfb5c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2bGgVTao36iTVzWejUn7E4tkyCsM7KwpUCMge4hpGKqYVU/BzLO5bhKuWfP6qBgQ61zozBEKu1Fb10D5VroC6Jk7ozwXTb2d9RJFuY8ClEEdXTl0Jce2Mg8ousAFZlxT9bCoLrLw6utldeLDq43dmnCNrHsmM1Rg+cPSkF9hy2tnO74v+A1tZzybHURLMEKJjhQw9w+iGNmkx+aR4kYnsWyPHySJKoaHBq23Pmo2OA9Iu2kjsqKMhP2fyKCozi2eFliOO4MBT7bkNHx1IUekK0o40535EYzMQdf+HKZM7rBnKB76f0cSAwmQr896HAUw66oeC1uyDotqqNXD7MsBx+02Uxy+z+q9sopJszddb3t1TxCFyFVGhw/lxE+EzxPBQLclOSidT8Q44lBjuMen7KPjS+QRRDzWSF/Jz+xO9Jq1ggUl2Y9rBUR99OpnLg8yDhMS+7sJREkVed2uyJ30z52xqXdlsbxEc+GzMs4T/n2ro6jtcZqZ1cDBSLPHXILEMuyG6qtOqJlYQfQOMJVBwEtsJoEoU4F+cKCNo7+OUlFUyhYEXVs1663tccjaD7vkOIDcOFwAQBX3Z5ROS3sPB2nZhoNO+buPSbVkq1vK6kBNqydh2hlFKTVov3CchiKxWsRiI00zbJVfRFl9k0h48/Qi+SrcEgdZZaerIlhh7xuthVp/GiEnP8b8I2uXNccztHhniDRsRoT6g9oyA8jhrrJRQLLVhUJNO+s8MBVnKK7ZT5idQP356W9xN2KZPdxV
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(31686004)(2906002)(2616005)(36756003)(70206006)(47076005)(82310400005)(70586007)(186003)(4326008)(426003)(336012)(8676002)(40460700003)(5660300002)(41300700001)(44832011)(8936002)(4744005)(110136005)(16576012)(54906003)(31696002)(53546011)(478600001)(316002)(81166007)(26005)(82740400003)(356005)(40480700001)(86362001)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:15:37.0251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3927d49-004d-4bf4-5e92-08dadcfb5c69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7270

Hi Julien,

On 12/12/2022 10:55, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, flush_xen_tlb_range_va{,_local}() are using system
> wide memory barrier. This is quite expensive and unnecessary.
> 
> For the local version, a non-shareable barrier is sufficient.
> For the SMP version, a inner-shareable barrier is sufficient.
s/a/an/

> 
> Furthermore, the initial barrier only need to a store barrier.
s/need/needs/

> 
> For the full explanation of the sequence see asm/arm{32,64}/flushtlb.h.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


