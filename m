Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A844D6A7C02
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 08:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504392.777047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXdfy-0000sZ-Io; Thu, 02 Mar 2023 07:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504392.777047; Thu, 02 Mar 2023 07:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXdfy-0000pr-Fe; Thu, 02 Mar 2023 07:48:30 +0000
Received: by outflank-mailman (input) for mailman id 504392;
 Thu, 02 Mar 2023 07:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x2w7=62=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pXdfx-0000pl-6x
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 07:48:29 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bf73119-b8ce-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 08:48:24 +0100 (CET)
Received: from MW3PR05CA0019.namprd05.prod.outlook.com (2603:10b6:303:2b::24)
 by PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 07:48:22 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::42) by MW3PR05CA0019.outlook.office365.com
 (2603:10b6:303:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Thu, 2 Mar 2023 07:48:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.19 via Frontend Transport; Thu, 2 Mar 2023 07:48:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Mar
 2023 01:48:20 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 2 Mar 2023 01:48:20 -0600
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
X-Inumbo-ID: 9bf73119-b8ce-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYrrwelFlnmpd095XN0e/IagdGEld50aO60mJT4+OfCmYJRirehZVQg9AYWGpe9HOjCEfjTyAX57OfLahAsLNwLPfCHafUoU1iLWJEJu8ZeyIXMBXfMsGDSW7Z6MbL0yByHsvE5UC/q2hstS6Ey6N0O/5pHkW5Q97uZOWKO5Sm4MM7klm75MYB4IDujkw4YNp8aZotuHX7dXq/VGD3yAtvQxsfgu9wieQiQpJVRa0m99vlsogChZpi3p5RBh8gYgrTVzTbjJGbXzV78HVhtyGlgneH8GOzN4bKFDNJS8oqPY6ZjSWFK+J1xMNLuJRqyJPQZbh5Sk7botDsFmD6ClxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks5PPQf3duNCvh5OioSqg24JCh6shBntudZLj1/OinE=;
 b=QofSfxvYiqf1zOmM/9b47u+4QV4icd5N+OjKsJvtJ/CRSKgHFZkD3bD2BrpqDjxcjaQStwIuJ2A/RZi1CNzQhGSvSQ4qCI/maroNPG41yDDnz2T7rPVq5H/ksGfKK48c58wiRMq5ylcVVKeMYC13ZexpRYkObzA5HWmhdMXHsDjQlXGkwsdYMM+eZd8mJ78voG2L1f6R93+4AXpnwy+rtv61IjHXbVuZORY/2JbA6GIYPjWA/0j3O/qU46BK+3dO5fmeaD2ZB5Hp2YPM/xfDMeOa2HU9o3QaTz+9XZkGdUOwfbm7yLxe1WiwcbtIHdy4WMt88zYRxbgkTWmK9wgwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks5PPQf3duNCvh5OioSqg24JCh6shBntudZLj1/OinE=;
 b=UgWmEr7I3kflJmSjxcUbdJx4LCK+Huw4Qayl8e8G5gqhQNEis3Mu6tAfR+gYJCkd8tOcvAboFkhtU0qHBG5bKHnt36tHN8dbJK7DQGKLwBkV73Kfnediuf6TRvUp7JECnNU9gHtmTtI3drKk0k0H/hJtc/vgK4l9MDHYPttxsPA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c9e46216-2d43-b856-7310-1634d703a967@amd.com>
Date: Thu, 2 Mar 2023 08:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] automation: Add missing and drop obsoleted aliases from
 containerize
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20230301090644.4452-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2303011622060.3680@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2303011622060.3680@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT004:EE_|PH7PR12MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ebf5426-679b-45c5-ac0c-08db1af27f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q0+x6xiCbhMxIs6D9v4hHTyr8mudKWvvajVYLBu3XqTgptHu/6U4p91eK+hfjQzxGAy8Ie1jav3EAOiH4dHJZdOvhumySjxOxkgFasVH+ZQoLTNBsK87fEqAcywyZa88G0uteaervA06SFPXooITnsO8IYH3guTzQ2rGn6X2ykGFOxOI9yLYMyJLvtMfxVIdhzQj3u3sip7LrxNHrNl3wTahv8bCs6C0T36Dq0n6vPtDzktUPtmJajijO2bUX8oxOugWryXs5RZd44u1/dUYBcadXtsMULn72GvRH5moc/5KCBJTAR8sNDE/ABezzTz3iIN7xGvz9LMmc7+S04MRfVHJnnk5BON8Vguw8eqBKyg9/90ISVonsEbb4wUU+yErIfbViJuFItXJhoYtLJQcgq1v/Gxt8VEiUU1UrIPYLDEjr9Gen2bDRnvTu/c/F9LbFsfqqp6rsprZ7eynRoED8vfNp9O3LCF+zrUImxm/p1pjmcSqaYHKlD5XxqpIRX6NrzaJJPT/EI5zAXB3LJtX4yqkKUH6eFvTAyhLS7JlNU6unO3tH24g2Oc2bgMNo3sxwEHhrPicCTM+YWRHT5w/XEnW/7swZ744hamyhgp1+kd743lcNgjfgyDKo67sBGDF8s9SxpNdhNSiQAIB/fEwhhekEmGtCbl1LSQ4Wr/CPZ3t8fxRntQWFTFU9qSnHdkfJ8o/1dfiHoUlh/MTf6Cza4p7LFgBxJC3vsbPWOyaWhui+7Gp4ksyevJ9a7+wWLD9OBAaP7OhfmHhwHgTTgRmlA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199018)(36840700001)(46966006)(40470700004)(356005)(8676002)(81166007)(36860700001)(82740400003)(31696002)(36756003)(86362001)(40480700001)(2906002)(44832011)(8936002)(41300700001)(70206006)(4326008)(5660300002)(82310400005)(426003)(40460700003)(70586007)(2616005)(336012)(26005)(53546011)(186003)(110136005)(47076005)(478600001)(16576012)(316002)(54906003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 07:48:21.8356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebf5426-679b-45c5-ac0c-08db1af27f1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7820


On 02/03/2023 01:23, Stefano Stabellini wrote:
> 
> 
> On Wed, 1 Mar 2023, Michal Orzel wrote:
>> Add missing aliases for:
>>  - debian:unstable-cppcheck
>>  - debian:unstable-arm64v8-arm32-gcc
>>  - ubuntu:bionic
>>
>> Remove aliases for no longer used containers:
>>  - centos:7.2
>>  - debian:unstable-arm32-gcc
>>
>> Modify docs to refer to CentOS 7 instead of 7.2 not to create confusion.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>> ---
>> Open questions related to the CI cleanup (@Andrew, @Anthony):
>>  - Why do we keep suse:sles11sp4 dockerfile?
> 
> please remove, it EOLed in 2016
ok will do

> 
> 
>>  - Why do we keep jessie dockefiles?
> 
> please remove, it EOLed in 2020
For this I would like to check with Anthony and Andrew \wrt recent patches
that first modified the Jessie containers to use EOL tag and then removed Jessie related jobs.
I am confused why we keep dockerfiles in git tree while not having any jobs for them.

Anthony, Andrew?

~Michal

