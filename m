Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C528C6356D4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 10:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447464.703700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmAU-0000KW-GM; Wed, 23 Nov 2022 09:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447464.703700; Wed, 23 Nov 2022 09:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmAU-0000Hc-D3; Wed, 23 Nov 2022 09:35:46 +0000
Received: by outflank-mailman (input) for mailman id 447464;
 Wed, 23 Nov 2022 09:35:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5PS=3X=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oxmAS-0000HU-Hd
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 09:35:44 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eab::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3279f236-6b12-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 10:35:43 +0100 (CET)
Received: from DS7PR03CA0077.namprd03.prod.outlook.com (2603:10b6:5:3bb::22)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 09:35:39 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::70) by DS7PR03CA0077.outlook.office365.com
 (2603:10b6:5:3bb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Wed, 23 Nov 2022 09:35:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 09:35:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 03:35:39 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 03:35:38 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 23 Nov 2022 03:35:37 -0600
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
X-Inumbo-ID: 3279f236-6b12-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1b5/s4i/Zv9yiO1K3WypKf0Is4wPTxAGJ8dp0sXIoq58YukV5iYpkfwItOPm1VQ6H58BmLToZkd1xpXhWGJMiEaLUHNOQXoaSbVE+FMBAyZfW3c1cYihLZEfSZAfdrUlJLoC9c9CtVHeGspQjrRelKO45eMkEo1DtLtiygC8zhg0kKJOmPxd6NnQq/Zr2A2SAvBRQ4AzMSicmhLu8TMFl8MibxiA8wLr7rxgh6B4q7VyCAokY4qGYaFoG2DGD2yfxQJWY1dE8Qza+XxC09mTCz33DYXRLBktLlSUnWu4KkDdpjy6z8UlJzGAMQ3rA1JNl4fDmeH0HOSF2yJSzhUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1Z0ulfy2zznqdIdy3z7j/WsoVF/LjxWP35bDf2X2ck=;
 b=b0uoCs1ofsNbW46y9lOzjsT5ZCkoxkdM95ALkLfPViYrHtd34ulf2Xw2UMZR2OY1nvwdS699xw+tpLT/oRYEe4dDBwrdzcBaTUAuSo3LOl8Qoxm76EgQe5xkTnFZtv6/g9eGiJluIP90xVAwnan623F79VSU0iQpRIFlV4VGK1TIGR7Jw5AlOUUgWOgbogykUHb1Ly7naYSAYqhUGy5HFrSoGm0MgXxoqoSZ+CqjvVa07WFK5GK3Wwwwn3L6I30nItgxs+fSWm42/551dSsfj7RWfEvn1bQDJ9UGccqiTZNqtMfrG382l+ZRm3u2VL7teOi6pUDXlyfFUznO1uDE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1Z0ulfy2zznqdIdy3z7j/WsoVF/LjxWP35bDf2X2ck=;
 b=IrEp6UoSmYCOheoIknACKudHjo4OR3/5lEAduHPTkfp6Ija/gfsYVC3I4bblu9kyImCX/zX2JmNhbQti/I2SXDnIP2TwPfoiQtcGQgl1qympupeplMH9KWr1E2WdZKCslDyWGFY2RtY/UQcqBa8Qld8T/x0gqcrNiTpLNV5pyko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d6a8b31b-8622-8c6e-0495-9619f38cf18d@amd.com>
Date: Wed, 23 Nov 2022 10:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [XEN v3 02/12] xen/Arm: GICv3: Adapt access to VMPIDR register
 for AArch32
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-3-ayan.kumar.halder@amd.com>
 <8086e3ac-445b-17a1-bba3-078024ab2579@amd.com>
 <4045f91a-620a-98b0-d3c7-28af1b0ba4a8@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4045f91a-620a-98b0-d3c7-28af1b0ba4a8@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT041:EE_|DM6PR12MB4466:EE_
X-MS-Office365-Filtering-Correlation-Id: 702ba933-e328-4a46-770d-08dacd361558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qL5fSlKsyVmSSt/799tm4jG0ShBX6hVRqqPjFObs5bVCCL7uZ3GplSTaRd/essSRFNTPUrHkZhlUYlXGVgAII1fYr6IgqPPOHmN+iGKbw8lhyes27J5Qn6lH5rAIot/w6Ehm/jONCBk2KRbkNkYZEt7iJIftFm5riXeG/2OVF2Efn3BDodj8JSvT9/nYezH/O+XO7Qgs+v+6p92xeOHB65FpG5cePZGb/NsrqE3shRC3acsuQGny+PTF9N0zLH9KSWlJOGDUfbz6FE5Lf//ll7wRub7x5JZNBa/Rnn2NNoV9KFCzAAmEgwGRL04B9v/eqNBZMkCrjzvx0y9MT3qs1K1tUcaSrjqoZhew79dAaE4i5Jm2eMPSsSwtmAUh4mldZxNKOH3jARYq/kmiTUKr1fe0oBRPZ87AwUSPviLxKFYPUKcFItEWkPlbROFq+3mSVhb38x0FzS/GL5PeyqBfyGnC5fvP4oh2phv2/IrFvpzDHUqngX9C5o+vXG9ZQYzSJasBxaxlXF4Ur8OsGFlY3g9V8ejGXyOjTFrUwJ9sfCJhLjYePCVe6qgeRnDU1FeMEzWtFj3sD4eGRrOWmzZ4W6OykYXoGdPk7zGwua9b+sDrkDcRIWfcCjN/ph8VGNzgBljy6jowfIbQ7PJy5CKcReiqjvaertkbbC9doW8KiTKxnXIKTHrbxwwMNucGb3/1g3Ke1ZOLiGEqtLFWH60ifil3OtnTw52/gmCl+dHivCVLwl8nz4YK53lojW3jR/NoOASF/1gy90aXXckZ6qZVFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(31686004)(86362001)(53546011)(31696002)(82740400003)(81166007)(40460700003)(356005)(47076005)(8936002)(44832011)(83380400001)(40480700001)(8676002)(82310400005)(36860700001)(2906002)(41300700001)(336012)(426003)(316002)(26005)(70586007)(186003)(5660300002)(16576012)(54906003)(478600001)(4326008)(110136005)(70206006)(2616005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 09:35:39.5612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 702ba933-e328-4a46-770d-08dacd361558
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466

Hi Julien,

On 22/11/2022 21:31, Julien Grall wrote:
> 
> 
> On 17/11/2022 13:39, Michal Orzel wrote:
>> Hi Ayan,
>>
>> On 11/11/2022 15:17, Ayan Kumar Halder wrote:
>>> Refer ARM DDI 0487I.a ID081822, G8-9817, G8.2.169
>>> Affinity level 3 is not present in AArch32.
>>> Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106,
>>> Affinity level 3 is not present in Armv7 (ie arm32).
>>> Thus, any access to affinity level 3 needs to be guarded within
>>> "ifdef CONFIG_ARM_64".
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> although, IMO the commit msg does not reflect the change (i.e. you do nothing
>> related to accessing MPIDR, but instead you are just not taking the Aff3 into account for AArch32).
>> Also, I'm not sure why you used VMPIDR and not MPIDR.
> 
> +1. Can one of you propose an improved commit message/title?
Title: "Do not calculate affinity level 3 for AArch32"

I think the commit message can stay as it is.
> 
> I would be happy to update the patch on commit if there are nothing else
> to update in this series.
The series requires re-spinning anyway so no need to update the patch on commit.

> 
> Cheers,
> 
> --
> Julien Grall

~Michal

