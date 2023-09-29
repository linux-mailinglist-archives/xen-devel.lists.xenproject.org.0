Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81617B35FB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 16:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610569.950016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmEki-0008Id-Ly; Fri, 29 Sep 2023 14:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610569.950016; Fri, 29 Sep 2023 14:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmEki-0008G8-JC; Fri, 29 Sep 2023 14:46:00 +0000
Received: by outflank-mailman (input) for mailman id 610569;
 Fri, 29 Sep 2023 14:45:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1P3=FN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qmEkg-0008G0-SX
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 14:45:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5dcb8b1-5ed6-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 16:45:56 +0200 (CEST)
Received: from BL1PR13CA0079.namprd13.prod.outlook.com (2603:10b6:208:2b8::24)
 by LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 14:45:53 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::67) by BL1PR13CA0079.outlook.office365.com
 (2603:10b6:208:2b8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.17 via Frontend
 Transport; Fri, 29 Sep 2023 14:45:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 14:45:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 09:45:52 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 29 Sep 2023 09:45:51 -0500
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
X-Inumbo-ID: e5dcb8b1-5ed6-11ee-878c-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cT4G7THiQBvZwlxLVZshf4KbDETvCYf7Qpyz8FHA9fJDv0TwQ3Cyhzh7FBGRyDyn41D20GPipNzWKtnoHY2S/tK9SeD1XouVD7+VXLc41H8+C8eNJZFdUjZCL+uLCofx6sDLb/hOWcEk+bIh983qXSjlLItBOJxh94c3GZ0FcZSzrI06xeNTtTJ7TK2jXAfhEW+N+Lg2BmBPOngUVV3AcQrro1RqZ2O6iG80aPtr1GPu9VbMzoxFqPKlD747aVJwhdz72zJR1LAQ4ZWLO18S3Z4MFnKuyKO2xwqieWSxkRRmZFonY652o+NGcpF7ZOI0y1oDuYTICR+14P8o51gPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/rACsvD9deej7mRHRLgIYaQ+88uyhwhaY1776gumyo=;
 b=OM+KBYm9jwmauTy4dAuL8S2wmQPO5EBPHLoMstM2DQC5KQpeZ5+EwMNwgQcbqA0UvTdfqml5a+Ru9xM5RtCE+GMp4QaJQNJUzGcMOhyifsYEkqhIr/UsApc7Gie0y9U02hQNHlz8E7Mu2gDwF2TCUuLDpivEPJlvVzxCtHSUS9W+LZHMzRXC5/uzWqaOy0vmQYLOL5aLND7EQDMtb+vyLKivLfWFP/luT3G/UGJcxpktXy2VU46eaUIjvUROo8CLbaCMoNGgqRKVf/NDq7F9QJf1f3u2Q5BGvpCBBb6D3jDNYyQZ//Vzq9pjKJU8eYDP++7JjF8kA+0QUkPjHK9AWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/rACsvD9deej7mRHRLgIYaQ+88uyhwhaY1776gumyo=;
 b=fhsH0Vg15knUNBIot16XexabLTPsagjajfh2/FNjHxpZV40JtFQ4m+NO8mH+7UYpiUqzKp3H3G5t5+j0zd6HJxLLeCfHNpN84vWla3xt4yCf7hFUQ4ilas2evUSQbkn/RGehudeN9Du6F3+sDz5MwyGHix7MfHaPTByigFUQpWw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3c54fe2b-0174-d5f1-55e4-30e2ae88d94c@amd.com>
Date: Fri, 29 Sep 2023 10:45:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/7] xen/arm: Move is_protected flag to struct device
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh
	<rahul.singh@arm.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-3-stewart.hildebrand@amd.com>
 <78ad0cfd-1046-36b1-ab17-68b5ea29f35c@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <78ad0cfd-1046-36b1-ab17-68b5ea29f35c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a0d79d-f282-4129-2a61-08dbc0fac7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A/EuMtTYFCy+W+k90PWBqHytivmodVw51ZQ8bIAnNhFJfmNCFDBgMsz5XN/xLlSaDeR+Vk3Q4FWQJLUPeV7jX+VYFSIUagaQuL9q4051JYB91N34b7N8IDfFa9RQ294ArfgKq7HX6ZZW9634rRYirS7aDymXFPbLswb4UL06vnmpftfNXH39AVGOW8TS8E2iAw/k50O93m9Y6D0b0DagfaHJ6MSlJ5dIkZ2RGlG1XNsMIFVTNCiVVzvapkRHhLXaoJmfLFSJqDspWOLx5W9l2lqwqIH7yR7265B0N08W441g/IrsAt2OG88YFBvdlFefITey2Xkkujj6CJeafVBfdtObTCHOi3dw9eUlOZz+ory8Cu7AdRbA0LMM5D337EUITBkjvXmONC1RTm94N38zmSHyyew3YhM+STb/KCCsKFChTUVvFocIJqd0FkwoenCE0acGGHw+4y6D/5mm0AUsbc4S67pXWZ/AJ3iFSHNI/zMGDDDdUwtLVz6Z+N+1DSsvNqjmNFqCbUKhCB9vh/yQc/sJK97NAj9WtjZ6UveyFDr+vgjxQlYHj7mWjuB7WYBCnIoEkjFYfqDWbC3aSYClzo7b8Sh4eRnDy8HdEW33v3rcbtg0mKG6bLIYsypTx7NfZnbVQspbE/4B9mOuXJlTrnLa8kZNG8fvWSc4Tu7I78szt7Bzi/yZ9+TiNo+3tikobi0/3E5sBTCh4LljgzPl0+q1sMtAq5m4H81+noqGehdsEQj5xNllucgGfJQt9iuG66Rbex29FJmzgx/vKZElytE4Ega0rc+IRA6000WY+7o=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(186009)(451199024)(64100799003)(82310400011)(1800799009)(40470700004)(46966006)(36840700001)(36756003)(31696002)(86362001)(31686004)(70586007)(53546011)(40480700001)(5660300002)(8936002)(26005)(478600001)(54906003)(70206006)(2616005)(110136005)(426003)(2906002)(336012)(8676002)(4326008)(316002)(41300700001)(16576012)(44832011)(47076005)(356005)(6666004)(40460700003)(82740400003)(81166007)(83380400001)(4744005)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 14:45:53.1219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a0d79d-f282-4129-2a61-08dbc0fac7ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168

On 6/29/23 18:22, Julien Grall wrote:
> Hi Stewart,
> 
> On 07/06/2023 04:02, Stewart Hildebrand wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This flag will be re-used for PCI devices by the subsequent
>> patches.
> 
> I was expecting that we would only do PCI passthrough on boards where
> all the PCI devices are behind an IOMMU. So it would be a all or nothing
> and therefore is_protected would not be used.

That makes sense.

> Do you have an example where this wouldn't be the case?

No. I'll drop this patch for v5 of the series.

