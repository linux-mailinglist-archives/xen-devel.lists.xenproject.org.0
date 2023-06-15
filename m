Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B26731BC2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 16:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549655.858301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oIh-0004JI-Vn; Thu, 15 Jun 2023 14:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549655.858301; Thu, 15 Jun 2023 14:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oIh-0004GO-Sa; Thu, 15 Jun 2023 14:50:15 +0000
Received: by outflank-mailman (input) for mailman id 549655;
 Thu, 15 Jun 2023 14:50:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAiO=CD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q9oIg-0004GI-Cw
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 14:50:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee8e0ea6-0b8b-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 16:50:12 +0200 (CEST)
Received: from MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::21)
 by DS7PR12MB5936.namprd12.prod.outlook.com (2603:10b6:8:7f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.37; Thu, 15 Jun 2023 14:50:08 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::ea) by MW4P220CA0016.outlook.office365.com
 (2603:10b6:303:115::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27 via Frontend
 Transport; Thu, 15 Jun 2023 14:50:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.23 via Frontend Transport; Thu, 15 Jun 2023 14:50:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 15 Jun
 2023 09:50:06 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 15 Jun 2023 09:50:05 -0500
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
X-Inumbo-ID: ee8e0ea6-0b8b-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuzXXBjtzys7TlIGEnPOHqaZ3ELpPH9pl+9X+WUFxNa5a2BMVVRwZodEtMs3j9A7Otww4d3QrI9uefZJaNSLliqjdqLSPkgTMKF26Xl01Y/cQRwwGN++GiCOZCcTpsa1BbePFYoeT8RpqJlQWP+xW0Wz+OT78maX1FsRYn1Rx47LsD9jdcQnf9e3nyjg2B/VLd1thEG2bv8dUDuHZ/HGbsk9WJt1TSFC3JAVnsxZaddlmfsjTzO6crjioGrpVaZQVubUxiUqw1ziqfHHi11BQOlONqAAgTXgdKxjamePQqS+6wdHvR3As3PCkupCuOGoXOtRqIWx3kBh92w+t1mzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PSe3wL1FlX4SRiiVy+oQUs2Fn1Y5kSvri+Me8B2+8s=;
 b=UG/YoctD2buf/z0sHIiCR/dHKXBtQQwewZ97v8kZ9Ecvasp4MgJfAhig+TKPXT1DdyMcjNCFORGs78jgXQZEfRnNVma8AYFyozyXhWOD8AA0soAlvSpOxfnKmUM9+EgY28/dp2oPqfIrTpFOk9Zxf94I2aR8L+ByLTlTo6D67b+rC0Q2uI8uXuPFKK1R+76E12qf+ex3S7HtUSn0wauudmhJ3dF6YwAuiidXnmpDH6xvcyNOiqbvPLG2j2oNnwATF9ts/hXvJ0WWrcCXYfYQvM0pLwZk6tcP23tD1YT+AqOVbZJ4HrAQn42E3GNrXmVQr61VzwndvuRjqX0lo4BaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PSe3wL1FlX4SRiiVy+oQUs2Fn1Y5kSvri+Me8B2+8s=;
 b=iOhI48lDi62nynRnEq5jEtzx3wvSrgCEtrJf0gLQ/mbyu1PkS65ovAgnCHewBz5d8swVFyzcSOoHAJUE5xw8t4uin8gU9Aon+6Hb56LIk7gN3gTQPVxPhW5BJcrXaBj8k8hSCLxk3DPC0h5G3sp9u0rHfUD3CBIhYwqKPCOPhTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7a3becdb-6002-47ce-96f0-844fff23ee7b@amd.com>
Date: Thu, 15 Jun 2023 16:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] xen/arch/arm/traps: remove inlining of
 handle_ro_raz()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
	<xen-devel@lists.xenproject.org>
CC: <consulting@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <98c6fb7ace8fce22bc263fe1d7fffac4e8130b57.1686835890.git.federico.serafini@bugseng.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <98c6fb7ace8fce22bc263fe1d7fffac4e8130b57.1686835890.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|DS7PR12MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: b337cc9b-78c1-4487-a04d-08db6dafcfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kDBXo5qr7JHldktS+xkF3fFDzeGbSnarKnZtDFEyiufnvcBcCPwZTV1aSf4Q5lZzVi0AxzdnNoz22MBtBMUcnRfO2fGlL4UjeXRlsZc7JoOUb5O1SZs2vRETu0WGU7MwlzCNMDznxFs1zqJ6fGFhqhFtgctNzLh4WxBItbU1sjlwPmQglNK9WCJGP1gvUAN7TTZBbavQX1I/p+k9YWrpzL3LYq/HGQA6gtGL0CyaWHAvvVD6NsHDj08qJZdMOmHydF+ze+CMb2Dydce9WiVusfHd7+VeyS3Fvz+GGS2su1ObqDvIBW8Ai1gnoN65r44BF2efjwYnWFFT9NTeV3OOMV1zHSVn5UzdUtRAByZ3PC3oqUeGQ3wS6ryp5PBNogVTHSGyzk+bcy8cfcQfJsicfDNHic5mtJS/PrpBr8litwK6CqSAALiDgCogWC2PTlwVjAx5T+6Mj5CjF/WCRRV4fw3VyAaPlNggFCbBZUgy9g8i4iyQbKj8fTzriQ3fSI7vY0pmKMMamES17msD6v2bTM00WGr+eL2nQCAbE4QA6sBPT5oDOWdWOyxWXvsTD5++YuX4JgbdgZdV12hWzwbvfXtRm92A5Y6jsAYhvdZbzmh5cPMVZUrFdVMQVMkil5ZLD7qgF2qimnacwAth7JETvtUcGWar4MfvRO7nfqi1CGF50fXgU0pOlmHK6JZZ5qDd5sQYUW3UJUSfKYssh0OeZyWlLXxvZdbxOzuxre0zZCE4ID+4ieOrl26IFziXaCh7P/mzlfC3fvNBWU6b2RPFvMKWfVw2nlyDy8r6cf2EpDLeRUwfWNJPmfkvRc6ThEaA
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(478600001)(2906002)(36756003)(110136005)(4744005)(82740400003)(54906003)(16576012)(8936002)(6666004)(8676002)(5660300002)(4326008)(70586007)(70206006)(44832011)(316002)(41300700001)(40480700001)(356005)(81166007)(31696002)(53546011)(26005)(86362001)(186003)(47076005)(426003)(336012)(36860700001)(2616005)(31686004)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 14:50:07.6262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b337cc9b-78c1-4487-a04d-08db6dafcfe7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5936

Hi Federico,

NIT: for Arm, we use "xen/arm: " as a component name in a commit title or if you want to also specify
the sub component, then "xen/arm: <subcomponent>: " e.g. "xen/arm: traps: "

On 15/06/2023 15:50, Federico Serafini wrote:
> 
> 
> To comply with MISRA C:2012 Rule 8.10 ("An inline function shall be
> declared with the static storage class"), remove inline function
> specifier from handle_ro_raz() since asking the compiler to inline
> such function does not seem to add any kind of value.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


