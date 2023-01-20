Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA916754FF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 13:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481751.746850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIqr0-0001Ne-NQ; Fri, 20 Jan 2023 12:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481751.746850; Fri, 20 Jan 2023 12:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIqr0-0001Kn-K2; Fri, 20 Jan 2023 12:50:46 +0000
Received: by outflank-mailman (input) for mailman id 481751;
 Fri, 20 Jan 2023 12:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUaQ=5R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pIqqz-0001KZ-Pv
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 12:50:45 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d5028eb-98c1-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 13:50:44 +0100 (CET)
Received: from DS7PR03CA0011.namprd03.prod.outlook.com (2603:10b6:5:3b8::16)
 by DM4PR12MB6616.namprd12.prod.outlook.com (2603:10b6:8:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 12:50:41 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::6b) by DS7PR03CA0011.outlook.office365.com
 (2603:10b6:5:3b8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27 via Frontend
 Transport; Fri, 20 Jan 2023 12:50:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 20 Jan 2023 12:50:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 06:50:40 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 06:50:40 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 20 Jan 2023 06:50:39 -0600
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
X-Inumbo-ID: 0d5028eb-98c1-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt4akUxZaIeSPVsP/Tk4pYCOsdO8jtWTlIhF9eMCS3clJXDIS4nvfK5SZaVkT5bKbrZvoF46KP9yPQWb9L03Xq54erM7K/vP/xDZ4gE5Ab+x7I5OZeAxqOYCkoPwqyCuMczMZA4rGH7lNzQxvTLGhfhIpNHC300M0L8GBobCtasmbuO7gvclzLgmTww3H9/HmQMPjTyDCrHCOkDZaRAYrQh5G/mQWRhhN/Xf9SMQVDXGRbH2JA8n752PPXMe1gA7iQuPnFPBAsbmVG4UD2W6Y6tHIou1FWqqlD3bIkEzEW/+CeR/eI7D/045KjU/5wpOdafiB3qAFRVdr3EFDmRYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRIjhlI7J3YlTvH//k+3wzT8sYdd/bnubg/ndIDpPq0=;
 b=lTNSq2pqBBTUwudrYO6lHxV0kSBDOb+NtpXXVMi/QNvH1eKBNBrCPVGCl0FO6Wrg+zvfIVTnoAIgkhP1GybDbzs3e7jfQPz6FjyzjsJmUFHVNDKtU+5yc3yIVZ5pM744STwWyHsbJ/Cy2XqSxNoOgOtrorANNfClS8hvwnLfpsMokMF0UlPF/5fXSVDEuaoln7QZI76pqN37xz7jdyVdBW3Z0YaFgUKFrjBvvCG/i+aUO8dpVfWdPHoxcx2kzJoquCpqb9GARDAYOLGwl0xEmzk78lRB+naXMkRqT9D60iDwMITuPZq0pMo934rWjNcT7AmsVhkJxxxDpv8DzVdW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRIjhlI7J3YlTvH//k+3wzT8sYdd/bnubg/ndIDpPq0=;
 b=nmAJMmKhfl06NiYWNKqcf4wjg5F7yOma8RlwnLM0YMeFvu/a2O+SEbIYyXDfgSfQVG8/mJyUlhTEjVGYmEkZUETzWoNCugiYwjZJNXvfTwa5viG5VV476avx8pSHwDdJMJT3wz2rDsoWMiXUF9yTN4Bq67KaE/+XlQp9ZLsVLJ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e0f7b825-4b2f-e709-07c5-09b8ff192041@amd.com>
Date: Fri, 20 Jan 2023 13:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 05/16] xen/device-tree: Add
 _dt_find_node_by_path() to find nodes in device tree
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
 <20221207061537.7266-6-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221207061537.7266-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|DM4PR12MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 3430bcb5-e276-44f4-697b-08dafae4efe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0AvtHYFlF+NB4bzlnFoyeZGVNUI8s5N9yf/ImebH4azJO6Qm7dn68Sn+7sKN1y9myOrpNBtOhcXtRDmR4zgyS6Yyks24H1O2rparNCQfNU/haWJhmROrexPMvZZAS3hmU1qGGwtOKoUJdb77lmd9uVOysG89OjaEpsOfY5Lhtcx4x77KlzVxg5wv9Ilkf5OePZLAQVLRCt5ajv74tDC/k59Yak4/kgLY4N7cD8HyHY4GEMMzEWi6H6YqM9M9h4USgMSn0sAZ3GO6jew8mrD+XUoS5hr2K0MllRLsdxZtu95T8rEEyYZDMlPRpBPXBhX1yK4FewbQHTBfZA2GNHBp0n6eg9/ADfJR9lrJsDuR1/c99LoRPN7FXhs42LQ2F3PbxrjXSrdXf2z2S+UeUmjJK8yDNJTb9pIeHDqF9xYzpF+qdz0E66SEMlwwdLQWOKuDa6n5c2c3ag19sW0k8msNJblJJK1a2DiQN5RdTbC4Ak8FtdGwD0EqZ0BRdgI/aIjn6cUdqWBS0ET/FeYHmAUlNzwTGsPJiIQPmTv8x5FNq51NQFpeKGDT7wlX6amSM9t4BA/keLQ2pMO1AsWKKDd42cjFzYPhuiYUyXeDHfqTtj70IpvzPa2jp0MuDrKcQCkaQYjEj72Zdwu1Ol/w9UnVg3/cmu6/kg9r4uclzvKjGJQyjR0UnqtnCpruke+GpujVJBi2tyxi4ZNKhop6xLusXPvFt9oeIEn+KKVTG5eGdVeRLUHO0NXfOXvRC/gpMzmdrq+oXoxAzCvBL2I7Y9MrCUIwTglz25Wy9XlyPPWqYLI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(26005)(110136005)(186003)(54906003)(316002)(16576012)(2616005)(478600001)(36756003)(53546011)(31696002)(36860700001)(81166007)(40460700003)(86362001)(356005)(82740400003)(40480700001)(336012)(426003)(47076005)(83380400001)(41300700001)(4326008)(44832011)(5660300002)(31686004)(8936002)(70206006)(70586007)(82310400005)(8676002)(37363002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 12:50:40.9842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3430bcb5-e276-44f4-697b-08dafae4efe5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6616

Hi Vikram,

On 07/12/2022 07:15, Vikram Garhwal wrote:
> 
> 
> Add _dt_find_by_path() to find a matching node with path for a dt_device_node.
Here and in commit title you say _dt_find_by_path but you introduce device_tree_find_node_by_path.
Also, it would be beneficial to state why such change is needed.

> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/common/device_tree.c      |  5 +++--
>  xen/include/xen/device_tree.h | 16 ++++++++++++++--
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 6518eff9b0..acf26a411d 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>      return np;
>  }
> 
> -struct dt_device_node *dt_find_node_by_path(const char *path)
> +struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
> +                                                     const char *path)
>  {
>      struct dt_device_node *np;
> 
> -    dt_for_each_device_node(dt_host, np)
> +    dt_for_each_device_node(dt, np)
>          if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
>              break;
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index bde46d7120..51e251b0b4 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -537,13 +537,25 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>  struct dt_device_node *dt_find_node_by_alias(const char *alias);
> 
>  /**
> - * dt_find_node_by_path - Find a node matching a full DT path
> + * device_tree_find_node_by_path - Find a node matching a full DT path
This description and ...
> + * @dt_node: The device tree to search
>   * @path: The full path to match
>   *
>   * Returns a node pointer.
>   */
> -struct dt_device_node *dt_find_node_by_path(const char *path);
> +struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
> +                                                     const char *path);
> 
> +/**
> + * dt_find_node_by_path - Find a node matching a full DT path
... this are identical. I think you should describe the difference.
The function names are also very similar and can be confused but I won't oppose it.
I will leave the decision to maintainers.


> + * @path: The full path to match
> + *
> + * Returns a node pointer.
> + */
> +static inline struct dt_device_node *dt_find_node_by_path(const char *path)
> +{
> +    return device_tree_find_node_by_path(dt_host, path);
> +}
> 
>  /**
>   * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
> --
> 2.17.1
> 
> 
~Michal


