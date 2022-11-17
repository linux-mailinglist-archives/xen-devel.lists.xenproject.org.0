Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D1D62DD0E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 14:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445227.700304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovfDN-0005JR-2z; Thu, 17 Nov 2022 13:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445227.700304; Thu, 17 Nov 2022 13:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovfDM-0005GU-Vi; Thu, 17 Nov 2022 13:46:00 +0000
Received: by outflank-mailman (input) for mailman id 445227;
 Thu, 17 Nov 2022 13:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovfDL-0005GO-Gu
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 13:45:59 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e83::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 296453d8-667e-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 14:45:57 +0100 (CET)
Received: from DS7PR03CA0217.namprd03.prod.outlook.com (2603:10b6:5:3ba::12)
 by MN0PR12MB5812.namprd12.prod.outlook.com (2603:10b6:208:378::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Thu, 17 Nov
 2022 13:45:54 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::49) by DS7PR03CA0217.outlook.office365.com
 (2603:10b6:5:3ba::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 13:45:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 13:45:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 07:45:53 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 17 Nov 2022 07:45:51 -0600
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
X-Inumbo-ID: 296453d8-667e-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqPM8M8BAcoxsvfgmN1n05XAxjj79lY/Txu3SgFADYNIGrBRYZl0QgG0LXxDdtw1Uq0fIKwWhYD3Lk3FQcqKhJC3TpvxPkjCFKT+fG5h5z4GcS8Q/Dry1QqLc/RRVT013OddJr43MSR51CsvvnmWtAKHESb1vFYX4VD5PY6Lz5JDC2MFex+Zberlh1IM784HtaASj9tLhYcXTlMqAJ+O755pW3kenE4iMp3c51DW/sxN3MDmdpAYldEOp1IFlGUPrvWJPi7J6lRYOyvr92lsJF/NNMNCgLvMTUHXpZKsS99Q3ffMi3166xUB7Tmm6XMP7sb8J4Fa9Zw7Xt8Kl+NTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BAk/TnPe3gIY2QdjrinC/eQ4kYJI22yvxAgwDf6BJw=;
 b=oT0FfSfRAFpsWe+Mkry7gjJdsUCeicKp24Z6oOnoooqKUI1HDsGGujX0YHswk8a7zbCx1N5o66BUSl8gQgVcHHbMQo07etncxMPZsVTCl/w9EIpMzEZyEMDnRkpMRSvvAFm5jajHL8rTzjeBN/hk6SnRVhRn5rEZ9hy/UwXNfJuDyouJYLXaqnHxqhm1lglRyaW+dduyriPlQrGVXa09Gno7r31O6uDrahds6HMP46dxWLhRoOvtrCRhF8v4ROs1o6mO/m+oKGTEsuXVPtjWiS4U6JfOwnrWO+zvpgFra4yGMknt+a6ij9vZjj2bbMlz/83dXFP1Dp6zoESbxeqoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BAk/TnPe3gIY2QdjrinC/eQ4kYJI22yvxAgwDf6BJw=;
 b=F9IEX9k4nvQKJr0KveEZ4K1LzBzzdX7emaUi6gKdnE548MZOIZADQfX/YqFWMTXcZO8qQcMMoB8iJz2fVZKnDJ+hSA8zG9yZQUpnyrmjsNfgYWgerWekx/ukEgr80sLs8d1rjsgBv6Socl00qZytwNMlIvjqSFqaLuN5q1996GQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6c3ecded-7e98-2fc9-dc92-fcb6117922f2@amd.com>
Date: Thu, 17 Nov 2022 14:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN v3 04/12] xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for
 AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-5-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221111141739.2872-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|MN0PR12MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee7cda7-d0eb-41f6-b417-08dac8a20c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GVnMZ5IikYIto9wXcYk4QWSj7Bdz2tmH4OIOvqeUwyl9DZ+71B2E4iY9v38fGcUDjsSohkQ9U+2hZG5dQnFeL/dwBFcY5IX2MshcafcaEjSKbT0rEbZUwDL8/Xg0ZO47/1RpQZj0O7spHngVb0WAsr8hnatYZsqyu0i1WIiIscV0hzdNJXBf9PaPKJvTKhk5Wfbfs2JMqmr9hPvn/QEuc2RcFfnAX2vdtOEBglptIxRAtMgdXNRDgfFSxkDRMFp8qrhRiPkrqkc4LmnaIlGabX6EpaMEDECdw1msy4aMitZsdJwblkdzxa8bQ4qc6Hafy81JUP06iYRHuEsgSNZ9fkP6LR5d6yB1LoRcqh3xosKxNKYQiQNKRSy77iqntYL4uNvMJhH4Kj8bOHbWv48+Nsrz087MrkFBmouFIRNEYWOUz0ZJJuVYlBZBcnJ704J3ogx/ya0LUj/6Re/Wxo5KllunSkk2+gmHn4VOpfLU49KtzEjlqmpm2Vkho7WgowSD/Lam74nQCtji8goYPfV6CU6ovwPTiKVN9BhV5W5lZBb/i38Wm0+N51kf9OzRCc7AnHLViy5taBdeprR1/ANimGfqod4WrALkp5zKNDyxnTuEWAL+W6mY6EUSK8QgIQ1vTmmOctv8uth1zFTnhXpXkk5ckLbUuyPfXR5s9pL0Fr0DzCvucKrZy1t5JXLEsaYs3gAWyZvvf/XlhE539bRuf+9vVdYCQH5tRUPPnzs7MyXefvsEv/43U3aW0NdSppR9KgSBXns8Ad2PbQeKpO5DYw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(8676002)(70586007)(82310400005)(70206006)(4326008)(83380400001)(36756003)(36860700001)(4744005)(44832011)(41300700001)(81166007)(82740400003)(356005)(40480700001)(8936002)(426003)(53546011)(47076005)(186003)(2616005)(336012)(26005)(478600001)(54906003)(86362001)(316002)(31696002)(110136005)(16576012)(5660300002)(40460700003)(2906002)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 13:45:53.7482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee7cda7-d0eb-41f6-b417-08dac8a20c02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5812

Hi Ayan,

On 11/11/2022 15:17, Ayan Kumar Halder wrote:
> 
> 
> Refer ARM DDI 0487I.a ID081822, G8-9650, G8.2.113
> Aff3 does not exist on AArch32.
> Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106
> Aff3 does not exist on Armv7 (ie arm32).
> 
> Thus, access to aff3 have been contained within "#ifdef CONFIG_ARM_64".
s/have been contained within/has been protected with/

> Also, v->arch.vmpidr is a 32 bit register on AArch32. So, we have copied it to
s/copied/assigned/

> 'uint64_t vmpidr' to perform the shifts.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

