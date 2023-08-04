Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7F76FA63
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576912.903592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoaz-0001Gk-D9; Fri, 04 Aug 2023 06:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576912.903592; Fri, 04 Aug 2023 06:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoaz-0001De-9z; Fri, 04 Aug 2023 06:47:33 +0000
Received: by outflank-mailman (input) for mailman id 576912;
 Fri, 04 Aug 2023 06:47:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Igz=DV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qRoax-0001DY-8M
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:47:31 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c737f687-3292-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:47:29 +0200 (CEST)
Received: from CYXPR03CA0050.namprd03.prod.outlook.com (2603:10b6:930:d1::15)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 4 Aug
 2023 06:47:25 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:930:d1:cafe::50) by CYXPR03CA0050.outlook.office365.com
 (2603:10b6:930:d1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21 via Frontend
 Transport; Fri, 4 Aug 2023 06:47:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Fri, 4 Aug 2023 06:47:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 01:47:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 23:47:24 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 4 Aug 2023 01:47:23 -0500
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
X-Inumbo-ID: c737f687-3292-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItjTyImhefCfRO+Zt571kaiaAQQk3fITBpasw/WykhgCojAQ2ji/O9Mla1NeOUa6nu8NYxhxWeuMyyZmmeqM0MNy3N536pJlOCvizjLPE0Fmu7aJc+YZm8nVcXj0qM7coqNy+jAoFwSW+jGToYao/dLtlYipz7KCuV7o3fflr3yw7+DBwPpQeWaA1fJPdVE7KRWANxZGCldVlyEjddvvAQjCqqmRngkRDovt9yvw3po2GNNz9uOjP7eyqK3A0fC6jxm16HOBx41cpVroIJ3xIQ6gCZshA/6VXHoMaqg81WeS7hyLaw2/co94dt3UZKUADCx/ajmPW543SdEX9OlAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk07luqyc19Gb4QVPiE8g/+iyvi63Oe8nAIjXx8Mp0A=;
 b=TlLgWTqkhqExtKSP8+Oo1S3spAOGMGuJ4jl3jbhtLRjUMGvAKS0N5KOqLZld+O5pIk7gMrTZ0uBYCKOb73ick0+0MZn1haCFVy0GELVuJFCvy9CDEkPWIDPwI67yUNhtu5aVA7l5BqrCOxPiOCAfxfuhDDlMcRUuhfvU89c3zEo49YY8Cmy4TjrmzUmfe6Mm+qyJMMuS+8p0PmZNvDz0VuF5dbO8zOTcx0R2EV2DaDFzuyZF87bO30mFThon6tePcVkkMIjLZZBPt2UCxIETT8FYVtjKMEQgxSJB6UnsRT5fYDd9zOS+7SyGnQeHw03pzSi79Bgcjbc1gzp4P2OUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk07luqyc19Gb4QVPiE8g/+iyvi63Oe8nAIjXx8Mp0A=;
 b=Vqg7XSm4j18n9gbvrz3hupVVb3EiyYzcgvEBGTqLXdbAWVleJYBTiJy/n2v4f+g4mPnmvcg6qDghemCK548LC2gzJx5HD6ONER+Ufcn9De2kA71aSOR5JlBmqATi60dEaj6sRlCPS+xPKSmrgSV1SxDkIzPIjxG/kUv+JWzUecM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0300d94b-33dc-6ec7-11c0-3a926ea7c92e@amd.com>
Date: Fri, 4 Aug 2023 08:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20230803144035.4071610-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230803144035.4071610-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 6705fbde-56e4-410f-2cbe-08db94b6a98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7nrRwV7lNvSVfmeijOy+DT7Jd2jfZOkcsUYg0N9SaEV9C+jinq5ykdHeH8m4DjXNfR8WzM8SJEs2QbwwW9ChNgQoUI6Qzf4uXcSAX3h5yfEx17FLQpaeR3ObSiTyN/7v/jG41wq1NpRonVzw1jPod9oVBObpcA0c3ApcSv3exF7LQcGbuAi54w1qSFuZkeDDKFQ76OKhDYDWReY4ok2oj6lcc7v45oZlg2gKOcsL3yGVjalYdBq0pNZGy6/FMkBT1ha2YnF7wB64aoPcfvEvrBpgWvjYkVgTF4rSa5VXVRvQMsyvfVhtpd3h7E3TqWlEoEXgep2B43gqFSFe0gUWYV6p01sXFBQNvPultKwbEK0Lpncxeq8WsyCiNYH9BZfsYUYacqXqLKD83TcfxU1kGnlGw9xhirKAPW+nCf2xB9hMEGO6Vn2v8CBCd7Jvth23Mwgh9yWKGezh4M70UDBmQ6NFf+lF9knLchx7yjxZx++24Fm/jPFiJIiamFi7R1qda7xDHkaZzeM/HGfOuMI8XWgWuncHe5csNam9aohcUESQvLmge8ULEjLwdui8DwMKDbyNuKCU7v8l8HILP+gP2BS2bRm4Eknrv9p2chH/osza0pb92J9YXjorMdEA0eeLwcwt18cJfxxoVvQJ1wkd25PVj9+idkU+nMhfpkhqwllkYu5sTPK4XLlmwIkV3lBRdi/9IcUY5yfnRVq7zUWwiRHsag2GhWrKsRchPD3ydzvMzevxR3wrjpcgwN3xR4BuBbf0bNeeL7+Lfe9MujqtmlrnPwlJafL+jAJfEdYY8KtOrwhRIzwTrPB++CV20fD7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199021)(1800799003)(186006)(82310400008)(40470700004)(46966006)(36840700001)(31686004)(2616005)(426003)(8676002)(8936002)(47076005)(44832011)(4744005)(2906002)(31696002)(86362001)(5660300002)(36860700001)(70206006)(70586007)(36756003)(41300700001)(66899021)(16576012)(356005)(4326008)(40460700003)(81166007)(53546011)(316002)(336012)(26005)(478600001)(110136005)(40480700001)(6666004)(82740400003)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:47:25.1679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6705fbde-56e4-410f-2cbe-08db94b6a98d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707



On 03/08/2023 16:40, Luca Fancellu wrote:
> 
> 
> Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
> when needed, the option is active by default.
> 
> Introduce Kconfig VGICV2 that compiles the Generic Interrupt
> Controller v2 emulation for domains, it is required only when using
> GICv2 driver, otherwise using the GICv3 driver it is optional and can
> be deselected if the user doesn't want to offer the v2 emulation to
> domains or maybe its GICv3 hardware can't offer the GICv2 compatible
> mode.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


