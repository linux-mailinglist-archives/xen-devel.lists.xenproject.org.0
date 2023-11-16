Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491C7EE430
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 16:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634471.989928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3eGi-0002KO-Ua; Thu, 16 Nov 2023 15:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634471.989928; Thu, 16 Nov 2023 15:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3eGi-0002Ii-RR; Thu, 16 Nov 2023 15:27:00 +0000
Received: by outflank-mailman (input) for mailman id 634471;
 Thu, 16 Nov 2023 15:26:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UU04=G5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r3eGh-0002IZ-9a
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 15:26:59 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93be9338-8494-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 16:26:57 +0100 (CET)
Received: from DM6PR07CA0094.namprd07.prod.outlook.com (2603:10b6:5:337::27)
 by SA1PR12MB7248.namprd12.prod.outlook.com (2603:10b6:806:2be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.34; Thu, 16 Nov
 2023 15:26:52 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:337:cafe::5d) by DM6PR07CA0094.outlook.office365.com
 (2603:10b6:5:337::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 15:26:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.19 via Frontend Transport; Thu, 16 Nov 2023 15:26:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 09:26:50 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 09:26:41 -0600
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 16 Nov 2023 09:26:39 -0600
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
X-Inumbo-ID: 93be9338-8494-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYC+soGsVm3R6cO6dwbB3yfjQo9KblIjECq4MDdYkDmSe8RxfZFpWIyH0DZQ0PNhZArKkPOO1F84bigwpjHgzQYCVRZsPYp22Ul+PAcr58aFEkwnPKyiQW4Af2UDZE6qticOUVrYRTGElqIqo+KKtyqsrZT6WpHsHEaDCz/LsHVlBzdaq/Ux8VqNHCB3xMD/hdY18+ABG1AQsO/Xhv0tYrUDEizq+PKqNKEmpUmLIea5n8j6LBPpiF3pb1XirpMNJT/RNFagKtAdpK5s1DsVhosE52YdcM+jcRcL4uhnsbrd2Kh5MMTgBAORX7SqirqY5YLIWcYZKn8zimqErkiVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cefHjYjOV+h/LZVsktYOyroyJEyrlH6VzZsfmy8UtQ=;
 b=aOoZFlyAcukCqLDh3+0JDpKtf12WpUbsduhsCuIXo87q56XSGLnWOL8p7svkl9bDJsjAsl6INHDav81wJtZhEU2oAS/aaiMswKflYmtriIkxjKhOdTCSpuAsUY7+E4onPpyqt+iMWE+3hfg77gBwQ2RZJ77PsiDkoRV6Fu6w/Q2l6lmwK4cg+3RuvVEcWYKM1z6DnPorIIlMruFHI0fFoE7c9P5/PVie9crXSGoQuLpmFX/cqDRFa2MXQKj+9645S1oo1vSZ7ZwJslyyff8Os+z3qWe0hfKQG6zHWrfPPtmoVy/Y4MFR4kf6F/cMBRn+amvSbDlcM0dQw71diWhajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cefHjYjOV+h/LZVsktYOyroyJEyrlH6VzZsfmy8UtQ=;
 b=nCj356+9oU9MaIkCnV6u3OWHTQu2vInQ89UKmJqfnWeIoKT2jjrun7yPbKxadpUQbyUzqR312xxfEVQPcV1fteYKj8fwlW+pq6e+apir+tJGTYFAhRq3mqXhBV6LyARjco9ohsuiIiuOnTZRh8cayPqL8UjFFMzha8S9Hh0Eh2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7964c688-c4b5-4688-9f53-88679bb931b3@amd.com>
Date: Thu, 16 Nov 2023 10:26:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
To: Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Sergiy Kibrik
	<Sergiy_Kibrik@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	"vikram.garhwal@amd.com" <vikram.garhwal@amd.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
 <875y2168ki.fsf@epam.com> <0999dc30-05ed-4afd-bb10-0128e2ca1d97@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <0999dc30-05ed-4afd-bb10-0128e2ca1d97@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|SA1PR12MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: dba55eab-86e3-4155-67d0-08dbe6b8755c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/LGjROwOizXB+iGNz2rDYmsjh6l41iqUFF4k4FxXLP6lt5kHzSSzBe2hsv+apDSOn9WR1C8fGZtfkxjSJh2w83z8fonvfaUcS4cWxoH2uUHm2t4RwrmOFIx5m0ZdtpyjmaDavcH1r0435PeN+BjgjDmNFgDJ4naw3e54LXOFA3Dz9cmgCOHg95Pe1hR8uycyL6Csro6HTGIVWV69l8Zf3UJ50EzI1NIsWtAGpyFwXYk7ecsE5dkkEVK1wPipPJzBkuMZS0wjWqWx7tJhGTrRTNbjfHmO9YIJLKCITDdmezK4FlNj8dShk9mQVfvuAHJ57AaAnQaX+CxXclDE48lT12lZXmhK7u39Q1LNa9YNMz5Xkxjc9e/IA8Os+7v4bErqEka+mHxCur7MqOGpQJW3ESJBtVF3iNxIRa2b300ksyD3FpKHhoSsqBxRLCi5Nq2Udpe3KRoBCyoh31Ib9w3rdpX4BFz5zDjooLHjfFgqRrMKOGVYtEUad1iBBnbeObN+w8VX8fJD5Q4s+T7DJFbXr4LhVTHi3qNW44nTiOUJY3Z64lLRhVjz+MfOTdvOmVbIvsEB+KCkOoG86bOdiH1Yt2rJhkpaQlqL4uCt0yvvyLws06shxIZ2GB5pyvNf6bjq2R9fwZGS6nTqPTSSqrpy4Ee0DYKMtdiy4x62McOxFuhYI0hfqduXVillJzPS7rbnA74Qu/QW5PVASSryZ/EOjGe68A0qLqSl3NMa53D7d33CuctC1D4svIn1+9aH4FubfdDKst+gUm9HoZ/pBp/mv0BFN4mkF+NcvOJf+yFk5ZI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(70586007)(16576012)(70206006)(54906003)(110136005)(478600001)(316002)(4744005)(31696002)(44832011)(966005)(86362001)(5660300002)(40460700003)(4326008)(8676002)(8936002)(2906002)(36756003)(36860700001)(2616005)(40480700001)(81166007)(356005)(41300700001)(82740400003)(83380400001)(26005)(47076005)(336012)(426003)(53546011)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 15:26:51.8855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba55eab-86e3-4155-67d0-08dbe6b8755c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7248

On 11/16/23 10:12, Julien Grall wrote:
> Hi Volodymyr,
> 
> On 16/11/2023 15:07, Volodymyr Babchuk wrote:
>> With my vPCI patch series in place, hypervisor itself assigns BDFs for
>> passed-through devices. Toolstack needs to get this information to know
>> which BDFs are free and can be used by virtio-pci.
> 
> It sounds a bit odd to let the hypervisor to assign the BDFs. At least because there might be case where you want to specific vBDF (for instance this is the case with some intel graphic cards). This should be the toolstack job to say "I want to assign the pBDF to this vBDF".

Keep in mind we are also supporting dom0less PCI passthrough.

> 
> Do you have a link to the patch adding the logic in the hypervisor? I will comment there as well.

See add_virtual_device() in [1], specifically the line:

    pdev->vpci->guest_sbdf = PCI_SBDF(0, 0, new_dev_number, 0);

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00673.html

