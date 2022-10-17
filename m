Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EF8600A3F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 11:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424228.671497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMEj-0004j6-O1; Mon, 17 Oct 2022 09:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424228.671497; Mon, 17 Oct 2022 09:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMEj-0004gm-Ku; Mon, 17 Oct 2022 09:16:41 +0000
Received: by outflank-mailman (input) for mailman id 424228;
 Mon, 17 Oct 2022 09:16:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rj3b=2S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1okMEi-0004gg-Oj
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 09:16:40 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6731b0f7-4dfc-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 11:16:38 +0200 (CEST)
Received: from MW4PR04CA0169.namprd04.prod.outlook.com (2603:10b6:303:85::24)
 by IA0PR12MB7553.namprd12.prod.outlook.com (2603:10b6:208:43f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:16:34 +0000
Received: from CO1NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::70) by MW4PR04CA0169.outlook.office365.com
 (2603:10b6:303:85::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 09:16:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT093.mail.protection.outlook.com (10.13.175.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 09:16:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 04:16:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 04:16:30 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 17 Oct 2022 04:16:28 -0500
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
X-Inumbo-ID: 6731b0f7-4dfc-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=og48GawsKTm/RFj4IiO94dHPxogyA7UYoBuYwZmEDGDAvpzhoWk6gbc006QWDH9KtYr8q7QLVrOHGlYa87r6hRAfs4NQWOe1lg3J73todZUDvf6rZQ4PYTtEoIiiE7grNCdl0cKHN5y37WEaz1ZmAIctnuy1Mym7gkwdK0c/XiSEV9dYzr94mPJ4cQG3V2HOBpRyufJcKuPku9WKS2DOubUOquid2t3IeRgnlXNdv4mKON3+YVOqiUdpIas1ryF3FfFf3AWeeEZ9Orz88v68mrWwm4vMlPtTcdvTOLc3CGtmvSJ9viJP6roFmVubT9cOMlxUIOJn/Pz0JzQ5hCoHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6mYxFMc5KCEh5tkDNBekcfoPxP5pY6m79Nwlt66Pqs=;
 b=U+dvpD4/OTcFxjc3xBm9NbD4eEFHe7xp7Z/f5qK2Q6hJa5893bLCeCKCEmMgej9EsNW8+eCxjyAlTCuZ435jJoERcVfgrrxIm9J7yfbUddvcHDaEzNb93u6DgWsV7ZYOIG7wOPZ1tmQxDe6j9ICdBMGTYe3J7ufJdF+72F8kH6nK3OqTZvIUb2zmelMrdwMx6nY/a+v9JtanjcAvocIm470DqyLbW9Qhw4ab6b6zwnYnJWbAUnVQqxQZRaRALf7ILkvJ9XdCNdufFx8qQDTnr2b2AdszKJTR3ifsz6R5D+4l/YMEmt0sQNsEOuBV2EdnTzRogVEjvhXRMLkHhG2tUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6mYxFMc5KCEh5tkDNBekcfoPxP5pY6m79Nwlt66Pqs=;
 b=M7v3xmSxzAuzja5GXm5TuxoZpQanF7EMq+5Hn4KeEuEhd7kmZwq42ucRalVuw42FId0dIDFWllZkCRIzIdRvFP95SZRBiOltOZnkhfEWDEB4A/2uMZy4rjk4I6X9O5daYXJl5HBpkoqf0zAbjEhq3XyDOQLtrsn1zIQTsyu4q9g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <cf57a263-c0a5-2fe3-e12b-84d86d8e65b9@amd.com>
Date: Mon, 17 Oct 2022 11:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 06/12] xen/common: add cache coloring allocator for
 domains
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Carlo Nonato
	<carlo.nonato@minervasys.tech>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>,
	<jbeulich@suse.com>, <stefano.stabellini@amd.com>, <wl@xen.org>,
	<marco.solieri@unimore.it>, <andrea.bastoni@minervasys.tech>,
	<lucmiccio@gmail.com>, Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-7-carlo.nonato@minervasys.tech>
 <ff6a5e85-0867-2e22-e173-15805bfc7843@amd.com>
 <b61624ad-f631-b09a-0e3e-598b8982a0ee@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <b61624ad-f631-b09a-0e3e-598b8982a0ee@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT093:EE_|IA0PR12MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 593084aa-ba0b-42dd-e13d-08dab0204945
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4/i6+Pap1mKYxILPKdA0zXqfnTM+XiMFe8uGhWkxfqSnxiyMoYV9bOC35UtPSM+0/v4U8m9rtVa2snzo2gDEsQQq9R1f7o2OOdfxsG32P33hqYLhNDV15UNUD1IeHTIpCz1i3lVV56ZyGr/8w3CEQSfsKFlQvPrEMVTZQ4/jWUrxOfRruD+wqk41IFQ61Cx+9sh9oJv/Klnjdnaac4poNoxf0CGulCyDTMBaObNYd0Vh8RjFdSKyY4Qe99bxTk+jFLMh++rDkAYlKrSWnGsSrkalwtln+oJdqeL037yQu4b5TxceGhMpH/1gVeboB6IhuNghKIshy6eeDznHLopWtQUOrfUF47X+9K944101P/NHDrpgdceMo4kyoliWANxilKLwjHY9hpJHTp/t1tpcjRZLEpcu60swoL66eYbp8MlSUV0gXEHT6/7kSHDmIc3U2mJfCszk3483PoTyH0e6aefSSiHIDhKg07yy2n9TpZ+dXXCCVofexJNgxJtwaiib7PMxN9XuS/08EPD9KcdqPTgXbO4FI+/pWZh4r6B5G7OqhRTiSmIGAaV94/b5pJCAEu2ySVj7BuvpxM6KmqSmkAeMtX5B7g9JQh9G4ZM2nVMvl+ajxCUaBWNoM2mAwlRt4bJ5YHylbrMzzggpywe0CBk9mzy0vCOYzZpEhD5MqKGtzrfzhUx1eoGo8xz2V5vsWL0i4IG5W0J7MQl7/zlQGXj3MK2j9LtcwD3m+WC76JOIwODAQLxb+jGsRbnddHMCHton/uQnPrMHewZ0c1J8jIcHVu5EEAwxgbifMIvyxWHTCoODSd9WFLZY3Mv2lNATwYGlLFgXdzka6FgcwvWoYA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(86362001)(336012)(186003)(2616005)(426003)(47076005)(356005)(81166007)(31696002)(36860700001)(82740400003)(44832011)(2906002)(41300700001)(5660300002)(7416002)(8936002)(82310400005)(40480700001)(40460700003)(478600001)(26005)(53546011)(4326008)(8676002)(70586007)(70206006)(16576012)(316002)(110136005)(54906003)(36756003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:16:33.9386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 593084aa-ba0b-42dd-e13d-08dab0204945
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7553

Hi Julien,

On 17/10/2022 10:44, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 17/10/2022 08:06, Michal Orzel wrote:
>> On 26/08/2022 14:51, Carlo Nonato wrote:
>> Apart from that, the memory coming from the buddy is of any color. Shouldn't it be that the memory
>> allocated for domains comes from colored memory of the colors assigned to them and anything else
>> should come from colors given to Xen? At the moment, the memory for e.g. allocating P2M tables comes
>> from the buddy which means it can be of any color and might cause some cache interference.
> 
> Somewhat related. IIUC what you are saying, the P2M pool will still be
> allocated from the buddy. I would expect we want to instead allocate the
> P2M pool from the same color as the domain to prevent interference when
> the TLBs are loaded. Or is the interference negligible?
> 
Good point and I agree. I do not think it is negligible.
All in all, allocating this memory from buddy which is of any color is incorrect.
When cache coloring is enabled, it should not be possible to allocate memory of any color.
If we can do this so that this memory comes from either Xen or domain colors, the
intereference will be reduced. When it comes to P2M tables, if the memory comes from
the colors assigned to a domain, there will be even less interference.


> Cheers,
> 
> --
> Julien Grall
> 

~Michal

