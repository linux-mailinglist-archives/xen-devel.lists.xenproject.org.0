Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C947AE9E4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 12:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608391.946852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql4wQ-0006wZ-OE; Tue, 26 Sep 2023 10:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608391.946852; Tue, 26 Sep 2023 10:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql4wQ-0006tZ-KF; Tue, 26 Sep 2023 10:05:18 +0000
Received: by outflank-mailman (input) for mailman id 608391;
 Tue, 26 Sep 2023 10:05:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zadu=FK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ql4wO-0006tR-Ve
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 10:05:17 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e89::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f5934c7-5c54-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 12:05:13 +0200 (CEST)
Received: from SN1PR12CA0111.namprd12.prod.outlook.com (2603:10b6:802:21::46)
 by PH0PR12MB5483.namprd12.prod.outlook.com (2603:10b6:510:ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Tue, 26 Sep
 2023 10:04:56 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:802:21:cafe::37) by SN1PR12CA0111.outlook.office365.com
 (2603:10b6:802:21::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 10:04:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Tue, 26 Sep 2023 10:04:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 05:04:55 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 26 Sep 2023 05:04:54 -0500
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
X-Inumbo-ID: 2f5934c7-5c54-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9gZioRJtcoUnM2ar9OsxEMjdxSipzg/x6mm/oCffQJe2cwvNhiBOuDhuXxslWUebG8/GAX1RPvJZ7rz15IQkgChhUv9J6jydnKEj9fZCeMsqmeyFuk3IteGQZ/7cT9F+z9I21SLBgGRgsr9E3LEmI0fd58b+ZrJPJneJiDubElk75uSN/6mmjUqXF664pW4GGmoHP6ffk+R6Nq2yR7P3oPmcOUoEzjUqZhfanCPteOfxUGGf1uJ4/iShcFvruDRFNS+I5MRSfzvpBqPk0laZVkKsyjC2pU5p/uP9fvtwXsali9lZWs6DVQrdkO0uDozxOxNh6zs1bQzvE/bIgZs8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N63SmYyPocsClgivlEL65BTZ6TVrPJ+QQhcWCXQc2Qk=;
 b=lGXSPSy7saNmbAiEFWKXIhGkVeBPJx7aJ+eJEgeSG1kv2jn/uZr1pRR+HiqX+Yxxl8ZsvaugeywZkLOnsYwrdOyMrV5IArj1Q0lP29VZM5+KsYSdwIqeuv8lUpplHobfP10YXlxn2dOSc1y/3Yp/u3hsfXHFRYzLEI32IazB+2v1zH/Lvu4TjiDNObsj8vt/V0bT3LdPbzweVKs0+OOf8De+IOYuloI8chpYkVa11QN9Esk6eDn0JUB4/gWKlDC0SkLusFw18Q3utZdBPbt13AxzVfuq0DHLNJKI7E6VsL6YBOX9kNd2yKnBLmuwj3eWYjlp38vBN7FStryXvdQXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N63SmYyPocsClgivlEL65BTZ6TVrPJ+QQhcWCXQc2Qk=;
 b=xIwdSOeGWx/TIxNgN/OzyDxR16qkvK3lMidhKnl9Ngwd6+WOavkeRn1COwrC0JCdfaWDB1GBqLuAH3KrrEZRa5FP54z3vGedehg/bBl7QE7Uutcn9J+TMceQbuoaFYkuSC5PidCdl4xR3as/Bb6K2XAg9wd1ptM1/dAeu2O7fQc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <10c01fc1-8140-c81d-8e9a-4fdce2adcaa0@amd.com>
Date: Tue, 26 Sep 2023 12:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, "leo.yan@linaro.org"
	<leo.yan@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230926053333.180811-1-leo.yan@linaro.org>
 <BDC53ABB-AC26-45AF-A8FC-E12C83209400@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <BDC53ABB-AC26-45AF-A8FC-E12C83209400@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|PH0PR12MB5483:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f8f972-73ce-4778-19d8-08dbbe78095d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zRLMf/deG6AqRyuz3GlYMOChoUSE/bIPSjlmSifxhWOhwYD8+i69rZvGI693Kh6UDkebVgzlV2UFuoilZ13TU8xbPmJi9LiySNrhppA9kRyiuWKMMhQt7V1jjW+OJC4eyIEXOC4V/Hb9vu/v7q5nBNiytPbaTQMYamGrG0BVVySVsI++ffu94AlrTJjFT657y8kD2yI8v0GtJrHf2qw83V6VxUnOwW0x9xLjVz/pJz09jmvbYhpRTzVTRkRTmz6+tGLHdCArr+WFussk1L519jZN4GTLsKSZvCpsqDJlmGS+2KV3FjV7dKj35zeX6yZnRIsR2tmBvw5eCRtmeTX9rj7rTpALfGvrWy0exf4qSF7TWgMRLx0AnLPA8x5ILywwN/2ta5OaGRCEBZVd5GSVAnvXqpnDF063SD1bJvPGRLHZTIbqcQfq20OVi2Yhmv9q3gyFh/D2mTDVh/KBZWQQs9/W6h6PlDqeUFylr02piwHkNMg7Fh0pg8bia3EbektIzm13l7Yo9P/mi6GO/oq9mOo+hu4xEKqZrBTwrVXrqMnMDJ1eeG8zxl17gL7fVpKFw/BeH9dMe34qBq0lsySkkjswyBVTUWp9DIvlribQovlFZ7xxRUYTO3qVYM9IFIGAB8DyRlMKfk5ad32SV6iVJpQGnJ8WX7yvTrsX5AB4SY5s0pRVvNUu/6PaPLWDtwr3YQaqqNwJDCePKEphYPRsxhRwZ7XwYaXKhaVeAXZHz4/4TeJzaLEizrLE23Aqi2nHmuBz1t1oUojnML4+qt7YXKioPAucglpm8AhOv2uKxn43DN9e04VMDhuCaUG++FGt
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(2616005)(26005)(53546011)(356005)(81166007)(36756003)(82740400003)(86362001)(31696002)(36860700001)(47076005)(40480700001)(40460700003)(426003)(336012)(83380400001)(316002)(54906003)(16576012)(70206006)(70586007)(8936002)(4326008)(8676002)(5660300002)(44832011)(41300700001)(110136005)(31686004)(2906002)(478600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 10:04:56.4881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f8f972-73ce-4778-19d8-08dbbe78095d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5483

Hi Luca,

On 26/09/2023 11:52, Luca Fancellu wrote:
> 
> 
>> On 26 Sep 2023, at 06:33, Leo Yan <leo.yan@linaro.org> wrote:
>>
>> During the Linux kernel booting, an error is reported by the Xen
>> hypervisor:
>>
>>  (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc
>>
>> The kernel attempts to use an invalid memory frame number, which can be
>> converted to: 0x1a02dc << PAGE_SHIFT, resulting in 0x1_a02d_c000.
>>
>> The invalid memory frame falls into a reserved memory node, which is
>> defined in the device tree as below:
>>
>>  reserved-memory {
>>          #address-cells = <0x02>;
>>          #size-cells = <0x02>;
>>          ranges;
>>
>>  ...
>>
>>          ethosn_reserved {
>>                  compatible = "shared-dma-pool";
>>                  reg = <0x01 0xa0000000 0x00 0x20000000>;
>>                  status = "disabled";
>>                  no-map;
>>          };
>>
>>  ...
>>  };
>>
>> Xen excludes all reserved memory regions from the frame management
>> through the dt_unreserved_regions() function. On the other hand, the
>> reserved memory nodes are passed to the Linux kernel. However, the Linux
>> kernel ignores the 'ethosn_reserved' node since its status is
>> "disabled". This leads to the Linux kernel to allocate pages from the
>> reserved memory range.
> 
> I might be wrong, but reading the specifications seems that “status” is not a property
> of the child nodes of /reserved-memory, so I’m not sure Xen should do something about it.
Please take a look at dt documentation (v0.4) for /memory and /reserved-memory.
Under the tables listing possible properties, there is a statement:
Note: All other standard properties (Section 2.3) are allowed but are optional.

"status" is part of standard properties so it is perfectly fine for /memory or /reserved-memory
nodes to have it defined.

~Michal

