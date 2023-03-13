Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FDC6B7968
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509305.784812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiWd-0002J5-Hp; Mon, 13 Mar 2023 13:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509305.784812; Mon, 13 Mar 2023 13:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiWd-0002G6-EB; Mon, 13 Mar 2023 13:47:43 +0000
Received: by outflank-mailman (input) for mailman id 509305;
 Mon, 13 Mar 2023 13:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OtBq=7F=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pbiWb-0002Fy-VQ
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:47:42 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e74148f-c1a5-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 14:47:40 +0100 (CET)
Received: from BN1PR14CA0005.namprd14.prod.outlook.com (2603:10b6:408:e3::10)
 by SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:47:37 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::e) by BN1PR14CA0005.outlook.office365.com
 (2603:10b6:408:e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 13:47:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Mon, 13 Mar 2023 13:47:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Mar
 2023 08:47:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Mar
 2023 08:47:36 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 13 Mar 2023 08:47:34 -0500
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
X-Inumbo-ID: 9e74148f-c1a5-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI3Bur+MbZyca7dY7zlLgu+7LcWPvXPTksxtN453kWKe5mqQs6JspgVOzozwaEl2KWClu0Eciv9okuPKcuitsY39VFWK0LIyktI9/3EdS9ko0hAJfnlbwEUA7PThLaXiuiZWR8m4regrRTfVKEO8uMxVh59td3VaPQBXBd2wkI3ca2sliL0Jx4rwEBNLTWPBIif1a3SgV7xA2hMbr1eOM/2J9ylC6T3Qh+Jc35XPSe+HhWctbFD85siReEu7AGfJFVLksc5QcLwkSJ8l5Z6fvalo4NzFGgD4SMrR+KqdkXV2m31bIiKXd0iCPVmmF/o5A6AtY0KdNYALH83gZgQMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxvF3Weffj/99Gw1FdZ/bzAlrd8XAXZV8dxKNWRn2Eo=;
 b=QokkITtivz02CLsMxRL7HYJ22CO0HC7Hyt8FaQLTgHmtSl/n4kdeh6d/rTSCO91BgtE+uaQQZHSyFhwwNy6bilyytcELE2V7AewswIGepaVlhaGyutfQQu6OoZR2KAhwq9OyNRTw1oP0CrSKo4YkksXO+sqUfXJnkY/SgC4IeZK8XecPQCS5FiyhPkYI10E3uRL5pkbAfLmcv/Gef+dSaZFB33BbG3U/B1zjGZaUxkIbRR0YtwGeMcYS5cI74szuCl91zH1BBCsBen9f1ZTJ2HZ8hz8a69Xca4RZYpt1UC6mlSXLA0dDFpLv3UfUn1qbTG6lJhnGQEpwV/B0yAOuhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxvF3Weffj/99Gw1FdZ/bzAlrd8XAXZV8dxKNWRn2Eo=;
 b=wI4ALFP3Y5V3wjBB9dybKJ2ksnBHyKu7b4W44JgqL5+l5xzMz7ko7FsgrDt+6WLognNhe6M1Podg3RR5jEh7XMq3oHddnB4ZDQ+CoGu7wsHwruYndn7W4JdugqSoYf0AIVUEOh3CWlzsFot4Gx0TpiB5venue4l1jWwT5MkgJ38=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6f97a454-0444-a633-31b3-e356b3b5259a@amd.com>
Date: Mon, 13 Mar 2023 14:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] arch/arm: time: Add support for parsing interrupts
 by names
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <Bertrand.Marquis@arm.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <rahul.singh@arm.com>, Andrei Cherechesu
	<andrei.cherechesu@nxp.com>
References: <20230313130803.3499098-1-andrei.cherechesu@oss.nxp.com>
 <20230313130803.3499098-3-andrei.cherechesu@oss.nxp.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230313130803.3499098-3-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|SA1PR12MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: e9656ef2-03a5-46f2-2e81-08db23c98134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M1WTXiHDnhd0QeunKvbslw2+Z4+aaxfEEczzkt+TlGXfuUr2Dqt2J/TPKpY1upZSRJ/2Hiy1QJzKii+PwahFgV9x3kPCEgjl4C2MqjzIgnCx9W11eoxrOQVs57FrYUk2+g9xEUYgM7GLDHiGfn1pfWydaJ6l3JJNfQV86/Dd+yalm8q6AZpc8zTqcA8ou87oc1fhwwa458d2Q0CW7neGNACmo4ALaVQtgCvJOuLP1JR7pfsYSMYYvlDJlRBacL85WPtRRbeujAE/pqKQXYwyQBEN7FU7JZHwVVahMIP6XclojHtY+TPPwx4xoPpTorTFHhLKC0b6uxbabgAkqutxwoL1/PnagdagEpawJ0aUn+7IOl7VemtTKXIPUyOXPoOKt5AIxx9JFXqu32EKfn1JRjUxoAqcR/9JQU6nx0ueCX5lt6OfN+2X2TGrxHdNWCA7AEHpi3t/oxjYeKG5lmXbAvZhRPBQmTUgZXgqjR19w0J4AaURJVlJEf/IQfvsAZSNWK11TVlxqZ1zIGSfFMluYNt/OkXVE6mCq2/5v8qwZTF0aLw29oNqpcj7tL3/HFUEp7B5/+DU1fEcU/pQhvFv87w5uPTZg3mcN4Co86d8aTmO1FKKTo6lDCwbJ4pi6p9Kl0n0HfdhbQUKPuY/g7b+0puZ7clKzFaSvuptXnyk4son4CDC+oMfCJtgk/nKAzXite35PfuhPLcy4AJRokfR77Z5blQjfgtlbXQPKYBqy/FQhlejgbdOQWKD0YbcNzntLj6+y/XQ+OFZsHGLrb9t/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199018)(46966006)(36840700001)(40470700004)(336012)(2616005)(186003)(31686004)(44832011)(53546011)(26005)(8936002)(83380400001)(82310400005)(36860700001)(356005)(82740400003)(426003)(81166007)(4744005)(5660300002)(47076005)(40460700003)(4326008)(2906002)(70206006)(8676002)(70586007)(40480700001)(41300700001)(16576012)(110136005)(478600001)(316002)(31696002)(36756003)(54906003)(86362001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:47:36.5667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9656ef2-03a5-46f2-2e81-08db23c98134
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198


On 13/03/2023 14:08, Andrei Cherechesu (OSS) wrote:
> 
> 
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Added support for parsing the ARM generic timer interrupts DT
> node by the "interrupt-names" property, if it is available.
> 
> If not available, the usual parsing based on the expected
> IRQ order is performed.
> 
> Also treated returning 0 as an error case for the
> platform_get_irq() calls, since it is not a valid PPI ID and
> treating it as a valid case would only cause Xen to BUG() later,
> when trying to reserve vIRQ being SGI.
> 
> Added the "hyp-virt" PPI to the timer PPI list, even
> though it's currently not in use. If the "hyp-virt" PPI is
> not found, the hypervisor won't panic.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


