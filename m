Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB8708A0C
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536537.834952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkoq-00037c-Af; Thu, 18 May 2023 21:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536537.834952; Thu, 18 May 2023 21:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkoq-00034H-7I; Thu, 18 May 2023 21:05:52 +0000
Received: by outflank-mailman (input) for mailman id 536537;
 Thu, 18 May 2023 21:05:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yK0N=BH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pzkop-0002TM-5I
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:05:51 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c21ebb46-f5bf-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 23:05:49 +0200 (CEST)
Received: from DS7PR05CA0038.namprd05.prod.outlook.com (2603:10b6:8:2f::23) by
 LV8PR12MB9230.namprd12.prod.outlook.com (2603:10b6:408:186::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19; Thu, 18 May 2023 21:05:44 +0000
Received: from DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::36) by DS7PR05CA0038.outlook.office365.com
 (2603:10b6:8:2f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17 via Frontend
 Transport; Thu, 18 May 2023 21:05:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT071.mail.protection.outlook.com (10.13.173.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Thu, 18 May 2023 21:05:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:05:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 14:05:42 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 16:05:40 -0500
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
X-Inumbo-ID: c21ebb46-f5bf-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSBMC7Fgg24ZPnpX3aVmBY2/IGVjjGIis5L7Vh1dr0WlP8EJTUwyXTbO5Dh5nsqNJHwN6HLsmeoJ30exuWeo9m9yxBhyuzjg7U6Hko5oV9IM/n2WvlHa5JRtuWrN+TnehPutvBqp38MhD5c5/lZNOtaVCX8JB9cPzoWwx31Blbmsnp/3Rdk0tGcJ34r3xujLThjDmF0IVbt8b9C5EDE46tU3ohO6/0JS06pfp4GPkFqWiSLOB6MUQuqg8O0P9NpFctzNN0pu4qCowJd2+hW31DXwvh3dcEc1EqTEsS7I6niao9ztjr94D0nRcd3zUlGQuz5mB1Q7mh/HkMvK2nvtqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wygi/9UjCLj36Lrc8DeTiXmlBt2FEHRZaM65Iiuxq6M=;
 b=E1PGpbWO6yyskAAiffKgFkZohaHBI9N8+VbuP6f+FSUOA3g4I4MT1DGcbjkhEYMEbXD5Q9Q8sobW4+CBuPt5w9A2TTij34jFPPu2zs+DOI+IsdjxYAvKqR7EXGoH83fQRLx9PAxPYv1EYKceVBkZybh+QUIfv2Qg2kQNdzVhZZBK7T/rXnOH5drTU+2hwVjcU01R1I23bnrRB0lvpNn+hmiJsdJUOh+7y91Y1imoiW7xBmifotRNb4Zb+jANxA2Fzf2lSbFI8OQfNtLZMxSb+hdExCF6wqAFQf2ZIGkVu3lqM4bCdUwYo6ZnY8tIQLnZp4m4a5wofPvKVLnvWX3gqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wygi/9UjCLj36Lrc8DeTiXmlBt2FEHRZaM65Iiuxq6M=;
 b=AqHDWjV7KVSH+adhAy1jKC779+2m9P3wfxchXFyyBGUjKDMr2soSQZutr9BEVl3rKw2myiNNHTtCIUzayPKp7C6QlxybSXZKZ8JxZPvIXn4//QHuD/ASW1R0AkLEzcGPM/W4cC6IuIqNC5DPlVxPo3XMwJWCIcP6UXCKJV6PIrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e06aa189-dcb6-cdc0-122a-0743ee831ce8@amd.com>
Date: Thu, 18 May 2023 17:05:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 6/8] pci/arm: don't do iommu call for phantom
 functions
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
 <20230511191654.400720-7-stewart.hildebrand@amd.com>
 <b1403a6b-80f8-6277-5bd0-b21a2c8f0dd9@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <b1403a6b-80f8-6277-5bd0-b21a2c8f0dd9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT071:EE_|LV8PR12MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a5699c-6f5d-4ee7-d793-08db57e3a4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KRMJ/9Hs1ST+YirQGMmQyThbnBtbxICq+1X25ADzcdjNUX/MNHGfgYxXmTWp4Vh6e9W69fbkuvK5xxm26JXFWfBICskU9kLKpZcClLAIUff8k1aaTtTM1Wfg42Jyha3ukOKS3qHKf5aEr1Cle0ZUfkVXsEk7zKaak2OayZCGlB1gKwpjP7yNLxyZPXaLzAYvELRx10u5+DhjWE+R0pQuUODvUY72eUtipLcs6GMe62Ldd4lClb9tY3Gaoakrawzr3rZ4cX7p8sRYsQV9KWa+dKIY0HiFfeEADBl4RyZ3PRg7Q81ePRHL13W2iPNt5Seda9+ecmP0AHU6eKVFbjSD89N2DI+g6lAhaXjlxvnDzxCQRqXSZspw/TX7DE4AEvnGwrfH11IxTSTgGppeoCcxhSq1JByImOiQcuDotSHsy90907wNUATDfzGq6OWanw518f5xGrV02h8tZsTM1/t+lOvnBMV2Ngpvk5+ngqR4zTLd2ZSXAgphGuIobiV4zp8bov+TH2fAlJfP0z5vGoGlKGvbtWhp3lFrTTQFwsJ+Q4RR6AiCwTPzn2nrLrVQJojb1q+tEI6CIilDHcdsQ2Tgp7/I3n3D2vy/4/dtFrQv2sdVpHpKgLEG4s/9RN/yt3XA+iwT3MH4m8oQDR29RtxGIBxpMMcxjboFBKkJg9yFWz9pdAb+psbO9FI4VyWog8h6hTthO+KOr1EPjj0Ah0LHctk8MjAQRe93NregulAxmAonmgoGKU1YT83d0zlwMLwX5Jb3VZykOldVxff3zSH5M998UkeyFoXyKBIS6bTqsn89SJHlh6ui8sYEho6fRAMW
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(82740400003)(31696002)(47076005)(426003)(336012)(2616005)(53546011)(36756003)(186003)(26005)(40480700001)(356005)(82310400005)(81166007)(36860700001)(40460700003)(86362001)(83380400001)(70206006)(70586007)(6916009)(4326008)(2906002)(4744005)(316002)(8676002)(44832011)(8936002)(31686004)(41300700001)(5660300002)(478600001)(54906003)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:05:43.5988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a5699c-6f5d-4ee7-d793-08db57e3a4c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9230

On 5/12/23 03:28, Jan Beulich wrote:
> On 11.05.2023 21:16, Stewart Hildebrand wrote:
>> It's not necessary to add/remove/assign/deassign pci phantom functions
>> for the ARM SMMU drivers. All associated AXI stream IDs are added during
>> the iommu call for the base PCI device/function.
>>
>> However, the ARM SMMU drivers can cope with the extra/unnecessary calls just
>> fine, so this patch is RFC as it's not strictly required.
> 
> Tying the skipping to IS_ENABLED(CONFIG_HAS_DEVICE_TREE) goes against
> one of Julien's earlier comments, towards DT and ACPI wanting to
> co-exist at some point. So I think keeping the supposedly unnecessary
> calls is going to be unavoidable, unless you have a runtime property
> that you could check instead.

I'll drop this patch in v3

