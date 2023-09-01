Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E68D78F7FB
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594388.927699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwdQ-0003zR-IT; Fri, 01 Sep 2023 05:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594388.927699; Fri, 01 Sep 2023 05:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwdQ-0003wr-FU; Fri, 01 Sep 2023 05:23:56 +0000
Received: by outflank-mailman (input) for mailman id 594388;
 Fri, 01 Sep 2023 05:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=am4h=ER=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qbwdP-0003wl-7b
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:23:55 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bce3c47b-4887-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:23:53 +0200 (CEST)
Received: from MN2PR14CA0010.namprd14.prod.outlook.com (2603:10b6:208:23e::15)
 by BL1PR12MB5173.namprd12.prod.outlook.com (2603:10b6:208:308::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 05:23:49 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:23e::4) by MN2PR14CA0010.outlook.office365.com
 (2603:10b6:208:23e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25 via Frontend
 Transport; Fri, 1 Sep 2023 05:23:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.20 via Frontend Transport; Fri, 1 Sep 2023 05:23:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:23:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:23:36 -0500
Received: from [192.168.139.126] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:23:35 -0500
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
X-Inumbo-ID: bce3c47b-4887-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K11Fjs44LYfa19+Cw9dFAAibzJemG839nQZXO650L1pvQHZyrZ0WIjY5/7vu6lVH8SBg6a4TF70QiUyTkPQbPIZhZLsQfM+OT4NAiduGLNhYGSCCNww6jS+wy7Hf1kRzI6KliVss8e/BTcBDJzZLwZ9zj/Y9lYM5WLk47avMHC12jMY6RJdHe4zc6d/y7rfwqL3rxUrfdQaJTZW0MJurzPF96qdPhTYWhBmSuTJYZmCpMiJBHszzzLu3ab/o1VEki7d+zG4kDGD+OLhtW01UoUTWAGdUPu+bqk/SKH2PILYJlvN4KFNkLUwfXYoAAYTOmU5J+2R5IIn3Fh3pN37ZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xn88MwuMqvRm9L17DSJ6UxuL5FMJtpVnGRfdeS2PdlY=;
 b=XAK/UOsC33OkHkfPxYo7kvAPtKJxiFE245zpqVDMFEfp6jpDLWB3bcd46sS3l7Bv3l5tTssyRB8HVKBHT9ZU1NwXv/9kf1jnxFNmfuvMVVQVBhvLYxA0mWxjFJe0oCAnWVPLDLLMds6NDxlWjPTcb6NbKeMrm426DUqAPv9so3kNRgPuQdwgYkr4AoDdcM7qzFrk0dgkMFT909JuK0Qr5tk6u+bzpnbvAkt5QPz/YzjnlL4BsdwqOuHTrhRjuPuLnv1OxLwMRlxO/JHfvvMpmptXM8TjqFL92LsbHeyoIDOOi+5ZlfWEPd2zk+AwXzDMQfZt3YjTTt6XKfhDsxQ+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xn88MwuMqvRm9L17DSJ6UxuL5FMJtpVnGRfdeS2PdlY=;
 b=WfOj979VVSzh3XRkN6CYOf6bRMGk64JB7OQDT64SKVJ9pXAFtZwNT1bSqjwS3Kx1lBKMKuOtkRoOF5ma+9UBeQBa77weyZ3DEhW2uYfklkGYcmAmE15PcA3+TcISzxKFamaY4zmvD1YpPo3/cusVTI4jaYbcyNTnN6ZcmLp8tSY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9abdda50-6d5d-a9f9-d02f-d91e99968e9e@amd.com>
Date: Fri, 1 Sep 2023 01:23:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 10/16] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-11-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230829231912.4091958-11-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|BL1PR12MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af0d5ce-2592-4b25-6bf4-08dbaaab9f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pQ85/FKbWdqrAAdOVH+HVVBFMFT0dQcwgKZcYq44xgHwclSC78xIjkyVexwu3EFW/qalZRAPeDJHjX5aHqdR1jB9hBHVitZ3QuYrEEl5FTTXp4gCjBb25R2Y2M0BM2mZj9ROdc0E7K8gH9UAdrPastzT4gkkYf/gpe6AMJEhJ2rXWPsH53dD0FKkVzo/WjhKvngAP9m//cI5Axfwf3hQPJbyM9aIsreEz/vtvLk9xxOiTIOngjie21qIZZkbvimq4Bh7GEFn8dAjpjl8iymYamxvKo2QWpkU6zMCOfc3V4r/iStZtN2WeRKV8j9wSrrUQFTGUSwiLUTLnp7yNXn6mrDBip+GDgINfqp4bENRxt6chYMKk4LC1/VhKcQ+v6cJmIjVcQNaJJShGTaNcvJ2RUnQRMZxGsoJKVEkHCc2XQn4tBvB6rDvRS48tagapkbxD4fseIxx52X8k8ncdPmyvJAoaMNBZvU3mShXpI7aUI55QakIDJfWlVCE+vtL/ujZmTx8fr2p0QUA5uOapbuyandg76Pga9LD5XTSVgQGmZ0DboCA8D6FA1RSA62PjS2R+Ad7UKxRERbHVqfL+AawfjJkOLmvIiqA+gucrIsXJ8vjinsxe/hf4cLv0Q4fF5eTK7+EoRYCCaJ3uo0kiC6m2uV0kcsRjOuLdP5sljVtpn5JXptayHUizrovtrfujykYDLGINYZ6kFAG5ZzV1PH1Y177rO8ve89APN7InEtHzswMVb7mCCuAFZFxzfkut5fH4s2T4JSNrpfb1UGmoUz+s6enzHrbbrCtBjgw9Cbp5fzpHqG2BFQDhdJU9AGjmF9Q
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(6666004)(53546011)(478600001)(2616005)(336012)(426003)(26005)(2906002)(4744005)(44832011)(16576012)(54906003)(316002)(41300700001)(70586007)(70206006)(110136005)(5660300002)(8936002)(8676002)(4326008)(40460700003)(36756003)(40480700001)(47076005)(36860700001)(31696002)(86362001)(81166007)(356005)(82740400003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:23:49.1590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af0d5ce-2592-4b25-6bf4-08dbaaab9f4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5173

On 8/29/23 19:19, Volodymyr Babchuk wrote:
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 1e82217200..e351db4620 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -523,6 +546,14 @@ static void cf_check cmd_write(
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
> 
> +static uint32_t guest_cmd_read(const struct pci_dev *pdev, unsigned int reg,

As this function is called indirectly, it needs a cf_check attribute

> +                               void *data)
> +{
> +    const struct vpci_header *header = data;
> +
> +    return header->guest_cmd;
> +}
> +
>  static void cf_check bar_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {

