Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE75D7193C1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 08:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542249.845883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cGg-0003kl-Mv; Thu, 01 Jun 2023 06:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542249.845883; Thu, 01 Jun 2023 06:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cGg-0003iD-Jg; Thu, 01 Jun 2023 06:58:42 +0000
Received: by outflank-mailman (input) for mailman id 542249;
 Thu, 01 Jun 2023 06:58:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ef9=BV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4cGf-0003i7-3m
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 06:58:41 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb7bafe5-0049-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 08:58:38 +0200 (CEST)
Received: from MWH0EPF00056D10.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:13) by SJ2PR12MB7990.namprd12.prod.outlook.com
 (2603:10b6:a03:4c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Thu, 1 Jun
 2023 06:58:31 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2a01:111:f403:f807::1) by MWH0EPF00056D10.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.7 via Frontend
 Transport; Thu, 1 Jun 2023 06:58:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.3 via Frontend Transport; Thu, 1 Jun 2023 06:58:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 01:58:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 01:58:27 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 01:58:27 -0500
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
X-Inumbo-ID: bb7bafe5-0049-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4ZFAb17r9jbXM+98GQsFSM357oJtNJZ2PTNRyHTarS/NBHO8lk9XeuWrQwmj4zmw9JXf7+CdHRv0VwY6BzrPdUyErNlxvtNzv3DfiqAkb6j1l11tEI1+J56uKJJ+145tC8kBTS3bHnHuu18bJKkekESTbsXlmC5k751Dehazj6L8zT/mczdVyzIhqoVFHXr0rNMzdgIOgSWN1U1OQwtwm484tnekPSHgLdSXv2zHlvHfUjQ2jSGt/xQZTVpuiKgMtJzgdK8TvGaXPV9Hnha3l8UdZdwyXGuLkiOa6GEZ5EkxMuM+F1+mAZsH+GrP6Svnop105Y0FnGIPjE/+sWOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTF8SE41U7AikeKtvWn9Dua2dAKfj1zQOj57L7NbJQU=;
 b=AUpM26WkwrNxA/DgP2Vru1VfmT4ZYkpHSXqK3yt8bMyutXHQUddvfBbv9zJ2jKVe6KNYXmTmJOo/JX9OMIR3URt0KVS3q1eztOh9AYZSkne19plYLTzsrnjY4U3AKTa7TSXDITGHzLhwaVXSHswwesUyTY6IsbfyLBtmPrpU8V/U52t+Jq6y8KPRPieu7AeCIWLp9+CGmpWjeqTtrZoftv7wDoIYMlsC7spuc2Pcnu8nJfbapklKkXDVAKdOBN8yhyOQWrvej9AwfJ11D5yF6IexwcdhPnnGBU4kgOegJx11W+62LCcWbaAr94LCm3TgtQ0D6OtHZAzl9iLbFet1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTF8SE41U7AikeKtvWn9Dua2dAKfj1zQOj57L7NbJQU=;
 b=ZdKAzx/n5pW5PRz0eRD/dkTQZAIagdvkICr4FGxEaKGDMCbeOxIm25kvH4uc5JaeUKih9fUpZ68BadvXCsyf7CPZymR+x9HOnwRrSk/bQX4t2C3yo6aRB1HQOpzqSYQiieyNv8WSCRjIDCduFVYpaG3wt6TUeGpUlCE3fhrOf8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c10b35e5-7af8-fb2f-53b6-a49c8e102280@amd.com>
Date: Thu, 1 Jun 2023 08:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v6 02/19] common/device_tree: handle memory
 allocation failure in __unflatten_device_tree()
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-3-vikram.garhwal@amd.com>
 <57937e19-e038-b36a-73aa-c2a95de7e525@amd.com>
 <f854bfc4-1f3c-19df-ba22-89c8859cfe6d@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <f854bfc4-1f3c-19df-ba22-89c8859cfe6d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: faa1dc76-e2e6-423a-d3be-08db626d9ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dZ+XhMqa9lYUw5GNzZnPvj6OBp7WYVD71MbBORBoqcnOPJUxqy4q4OPp47XNq4NoGvE0tJLoXPz/7OzSNdS/neQgiRRRwwIQHIcCIow/ThtEHPXoJi7w0sqERhQLWjinazTfArPT9xlh8I3tRlfmR8GDjoSjwV+y3pd0Mola29eoj4pfm5NEK/X+ufkvUtlvAqczT6AuyTr93N7VM4SmQj8hHPR/7hr6glvqfpJ2rLxZCU62RuXBCRpAY56s7uq2yolcGeMImrxa6/F0mX7u44/E0UBntdSJPxB2jCYZh8l1cvkbITkmN64YaxNwH+imO7xk9I4MQL26CvoDMZ/xd2ybpX+gqc8iwNBBfXtzZZq/zZWO5foqRXdM8S4yld0CwrOF0ZdhPasMVrbPxUUTpZVQa9uABEhGoxXLZuc4nrPTCmtK/VAAMPDyTSSZNcOCNmcj9+FSXZKI8vK0IyED8C8gLX7svY12lzzeodtpCkTAIc6JyySFdU/KMXAaJQSUff6Co4korYpNfuhdhXWkdNINFaaeAnwfsdldNBikqFpDaR//BZx1NDB5qwYu9fhXxGVemnEo0hK+HcwT6UjCm2g99JrQCXQOETjejgtuyfQcbv5NrrvWDpvLFl9bf9HsPnCyyZfFQGRw5ayShCxPB8r7dx6oXJtOvlsadkryWJ5Bix4lgG0HQKoNnpQF8eX9XXLxsHmnyMTpr8o48nznsvuR+U40XBNDptzXj4iGakUYrJlfqLOnJeZWFUF23B5bohzMcN7EBinm+kQc0bBCfApfDyoz012qeMhHh91sHNE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(4744005)(2906002)(16576012)(40460700003)(2616005)(54906003)(110136005)(186003)(82310400005)(86362001)(6666004)(31696002)(36756003)(26005)(53546011)(40480700001)(478600001)(4326008)(8676002)(8936002)(5660300002)(47076005)(82740400003)(81166007)(356005)(83380400001)(44832011)(70586007)(70206006)(316002)(426003)(336012)(41300700001)(31686004)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 06:58:28.7953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa1dc76-e2e6-423a-d3be-08db626d9ab1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990

Hi Vikram,

On 31/05/2023 22:32, Vikram Garhwal wrote:
> Hi Michal,
> 
> On 5/5/23 2:38 AM, Michal Orzel wrote:
>> On 03/05/2023 01:36, Vikram Garhwal wrote:
>>>
>>> Change __unflatten_device_tree() return type to integer so it can propagate
>>> memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
>>> memory allocation failure during boot.
>>>
>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> I think we are missing a Fixes tag.
> Like the below line?
> Fixes: fb97eb6 ("xen/arm: Create a hierarchical device tree")
Please check docs/process/sending-patches.pandoc
The correct format for a Fixes tag should be:
Fixes: fb97eb614acf ("xen/arm: Create a hierarchical device tree")

~Michal


