Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F4564B3AC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460486.718403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p532D-0003uC-1v; Tue, 13 Dec 2022 11:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460486.718403; Tue, 13 Dec 2022 11:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p532C-0003r9-VC; Tue, 13 Dec 2022 11:01:16 +0000
Received: by outflank-mailman (input) for mailman id 460486;
 Tue, 13 Dec 2022 11:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nvb8=4L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p532B-0003r3-9j
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:01:15 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 748c22e8-7ad5-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 12:01:13 +0100 (CET)
Received: from BN0PR07CA0030.namprd07.prod.outlook.com (2603:10b6:408:141::13)
 by DS0PR12MB8270.namprd12.prod.outlook.com (2603:10b6:8:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 11:01:09 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::df) by BN0PR07CA0030.outlook.office365.com
 (2603:10b6:408:141::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Tue, 13 Dec 2022 11:01:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Tue, 13 Dec 2022 11:01:08 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 05:01:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 03:01:00 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 13 Dec 2022 05:00:59 -0600
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
X-Inumbo-ID: 748c22e8-7ad5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/00ESfNWx9ibvKXw+M4aEnwjayzRcT2OUBNHyKMnHQs5OPZ5ZmZ5RjY9h5XSVsQmcr9r3vWGW5yZ+tdSE9FqnTHO7VUz2Uu9p51mD15xQU07gzxDAaILsrcVyu/xdgxqVjCgxWGeahoZqBYAFQiQDxdYrsnPcFioccSCnDU7/O8PyWtvezTZ9x59jpJ2I46QU37P4hC/PK1O2z1WvUvvcNv3pZiDRFnSAbiqoz0MY89avSy26x4q+Xk32HJOBmJIzwyLM2WhNfSkt5MB/Kg1PcEUcPSjlgNuKr7lmoh4QVQMjmFkjqxAAf7aVgiQDCtLpaCmts9X8s/zvYj8cuMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jk5wOyOTt+uxgrFJolwdZrWgJ2UIB8HAi3os42RQM/w=;
 b=nfBehRA10WmGg/MmrEhTUkckgb/yLY/Y1rrBBKlv8BX/7NEw85tNSRSRI/YczR9G8iB4lfdul/cALq8K1gL0FDQrteYijeHdJNsOlZ3DLKK+dTzKQtnNvFPnv15IyYn2jqOV5LcO6hQtY9puns1WrkE62PvhnL+qB4C7lv0+jKdk6AGzqA5OL1Q88/3/LRBk8owFez3JwgIM7muurOXrqx11lkPdc095x1w68CizxwvaUHMYPxxypA61vmXk0c5O/OcKmwyJe+b0VvzDyyXzO6sDebEKRym86ZTipZarqGEOHM0kmc60pTJTDOfCZY90nNTIcrd5nBEgvyew7Qxy6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jk5wOyOTt+uxgrFJolwdZrWgJ2UIB8HAi3os42RQM/w=;
 b=MRyam6TzSz6yhGMiey6H0gbsy//TUgcMAEU3TMfP1j2F0RtWjmfULD4J22of9OdVE7Kbyw1cGGTAi5EvP5fG49wi2W1xvOD2z0axiOX/5icPiITnMUyyEBz4BGz3LppCHHczxPmHGDOLkgiOy0u0NGJcRHIlK+En2JIVsAdS5hk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b2cd2cdb-661e-5ae4-923f-f5d6fc405279@amd.com>
Date: Tue, 13 Dec 2022 12:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 05/18] xen/arm: Clean-up the memory layout
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-6-julien@xen.org>
 <876a32c3-7eab-6503-c58b-4d0aa2fd7621@amd.com>
In-Reply-To: <876a32c3-7eab-6503-c58b-4d0aa2fd7621@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT005:EE_|DS0PR12MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef7c5a5-8952-4728-cf22-08dadcf956ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AMMoSlJr/jH+k6GmB6LPw6amgXp5XyWK47fFVMapxwvYAgLrvAqVA6X/QZg7Xr2CI/5ndVJbkVXr2nZh/qzUL83fNuOn1xH/6Gcy89o269Pj/X+HDcbiVSGvsm2ya0M29Ya/hjghFXTxN2Ug7GC4YS/FkAVBqZ+dAq2Fxfc+F9OWZUPBiJ9uNdKVcN7Jyv+GjeuNN1y83R9+HYPtncvqti4RfVUXPFKtgAgrHLnDpmZIdKBlhWD4ifrMnUQ/F9frWp41GNl+xzACaiCaRmjoqesHAP6poShjLym8jnE+aDm5prOdnNJexEAS/GBWF0kLa/UbBzTu8jP3I6EFep7sfWN8n/+EQptR4b/8Xf1soRqvU4eI5C+oUKmEjmTUAJ0mOws2uW8ygocnIJpuiRemRmMapr1U48G1/1mL8RDyhZL1U7aCnERTlLBlBVDy6V01TVbjgzXfze8IqraFFoVKgGRo4mVy7q1pDP0NyHblKsW1U0b5yVzvBA7cdtaQEOitCniGJKM+wISAZRuNaFbMsufdHmG0w9bvVDa6sILgJSUC10dndVhTbYlHKjJEU9p0s9oyguI6X6178DgOnyler/gQvolZW0XDtvzfAzDevmy/41raApzd6sdArX9zgWBjWe7uUOLlt/85ekazu9Rpn7gaGsZYjWJDfwc6XabgTF8mQyVK0D2ZMOZMFII2u4oBx5EqdKywS4xw8QHwaKhh0Pu8+EBay5X1WFpKZ8ujFVRk+eWIl+1/ZPdWpmxH2fxPXx2Pta5DfCoxHKkVaRwrSA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(4744005)(82310400005)(478600001)(44832011)(82740400003)(81166007)(8936002)(2616005)(31696002)(41300700001)(40460700003)(8676002)(70206006)(86362001)(70586007)(26005)(53546011)(36756003)(47076005)(5660300002)(356005)(426003)(4326008)(186003)(336012)(6666004)(31686004)(16576012)(40480700001)(316002)(36860700001)(110136005)(2906002)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:01:08.6977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef7c5a5-8952-4728-cf22-08dadcf956ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8270



On 13/12/2022 11:57, Michal Orzel wrote:
> 
> 
> Hi Julien,
> 
> On 12/12/2022 10:55, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In a follow-up patch, the base address for the common mappings will
>> vary between arm32 and arm64. To avoid any duplication, define
>> every mapping in the common region from the previous one.
>>
>> Take the opportunity to:
>>     * add missing *_SIZE for FIXMAP_VIRT_* and XEN_VIRT_*
>>     * switch to MB()/GB() to be avoid hexadecimal (easier to read)
I forgot about this one:
NIT: s/to be/to/

>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal
> 
> 

~Michal

