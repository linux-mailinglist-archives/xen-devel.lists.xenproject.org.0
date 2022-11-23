Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5309635C42
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 12:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447531.703854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxoMR-0006EY-9t; Wed, 23 Nov 2022 11:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447531.703854; Wed, 23 Nov 2022 11:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxoMR-0006Ce-6Q; Wed, 23 Nov 2022 11:56:15 +0000
Received: by outflank-mailman (input) for mailman id 447531;
 Wed, 23 Nov 2022 11:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5PS=3X=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oxoMP-0006CY-6r
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 11:56:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d119e4e7-6b25-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 12:56:09 +0100 (CET)
Received: from BN9PR03CA0647.namprd03.prod.outlook.com (2603:10b6:408:13b::22)
 by DM4PR12MB5939.namprd12.prod.outlook.com (2603:10b6:8:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 11:56:05 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::d5) by BN9PR03CA0647.outlook.office365.com
 (2603:10b6:408:13b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Wed, 23 Nov 2022 11:56:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Wed, 23 Nov 2022 11:56:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 05:56:04 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 03:55:41 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 23 Nov 2022 05:55:40 -0600
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
X-Inumbo-ID: d119e4e7-6b25-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4ohfH7hPJuJgjjwGq4GWIXhVrPOFmtsdaEbEFvKsCGPpR3KkVS8rZdvecuqkD8Cf2/k33cDfDz1IXzRaOEzVnFv/1RgJ34Jq8KfzfgFF6ik5uGzsH3MN++roMWL1gxx8G1xINaJHU/hAgdIWxzcNFaj7OQVT1zTp9MRW6cW/lu+8VILUXUwcyESY2hGyorj1usFVV9SbDQ59joGJYivirjBEh/K4ePba3QEjx3bjfkQhktMoi5dmJhDGxDBxiev52iJE7UDlI21+Crjhx4PtkWo2r7/NEqKI3OURa63bmmj6Lg3pu9XOmIh06vycVJ7mZg70cck4/2omU+y48H+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86NL5ohWvqF9C5W7vTd4ysara5FRkbSAMBGZKGKQt1k=;
 b=bOs7QYuKKxtkkDG5ei/kN7AFvgpICV8YIgCaOa5yV3Mh+6QIu6rjpclDl4SDwYa3fkQ/PRcchcJDQyHF9JBG01Xlz5/g4ZXgQSaOlM88EyjrEm4d7DyAPTKTu4fR5aN7y25VvJQD1DRqPHp3i/wACfeGWC/sEqqrdpznsgufI7IybGmwbXh1/hnW+NY4cYiSdceLRatQ3k85GCbqNrnBP70jH0bpJiFFzwNVIWYMdOnCi1wIZjfoZJPwqli5wWKz4/eBXtNwmwVmDpYmli2WUbeWg+ojUcjx5/j1I+vhRAW1/1g3Y+gMdIlxNZd7s+5G7kyn+PTffhl11MGPwzNnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86NL5ohWvqF9C5W7vTd4ysara5FRkbSAMBGZKGKQt1k=;
 b=bwnTRzczqNdRGRX+9zxJurkQJY29TtiEDN6q09bzzM/cLbzXJrVGa/fmL/EgvbE3xEOjpsD/uwob7aCVsUZtd/riv9WQVCUodlP6I5Rz3WfE2ny1m2xcq9P5n4MwvhvexXfy/Fu7TKEGQNuTY7SCq45TvDxak/VeXert+GPY7/Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <54111a37-9319-2497-ad64-2f47c4d69764@amd.com>
Date: Wed, 23 Nov 2022 12:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Community Manager
	<community.manager@xenproject.org>
References: <20221123040315.1480112-1-Henry.Wang@arm.com>
 <20221123040315.1480112-2-Henry.Wang@arm.com>
 <cf68a696-29bf-aa05-ea8f-5c13ca181286@amd.com>
 <AS8PR08MB799108E640EC1BB9373AD557920C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB799108E640EC1BB9373AD557920C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT035:EE_|DM4PR12MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c91e47-0dd3-4051-ead8-08dacd49b343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qw6skuIB2ti1nl8cAaS/mV24muDzWZsbAgyOOFVwSid6lOvBEY72GHNHL1Pl0BoUnptszQUXSsvk5lcw3Ctr56aMq5goTaSqDbmPAGb3xic1rCK7VYE/aexAwC+Uy/3taeOl7XIcFHjuRvRoIa0ozusNljMAb9bptZg0X+mvY/XI2UzQZhsbLxfXB6/heBWaRj3AyGv+p8OypWq+VCWLJ/6k2Km0ZiEc+2lTA/hrIIiGJvYvTVoM0+NZHjqnoPjNfs03+saA26OenBzjxHwxGyKbNwqyh/7W8/CjHa19Chw1AnJz7GY3l8IEOfDmjbeC7TxBlEXvZs1t9/e3m4j5Hf9Zh90jGNYWDRHqfiA9jgeNObu83qotkqKL/azt7ateODqYrVoSei/Qfd7CX7ehg+AArPgW4tnikntlWjDZQ1aLzpit2F2kFNkjCF32WMxdl3aGArE5FheCLkIJCzSbSFgSYzgqHFBd1lKw2kDrlDGW14aLVg0TmZak6B74mfOa4dQEA/kql/8MI8PboLm++jD92hsNiRn59oUhl1HwwWOz4szAeVIbQKeKP1HnyLTojYuH5MzBllNkxHPvYEpl+i8txAtEGqfbP7KCagsS+cjGfN4IZ9MUFV5f1iETTQCW54x0cmC79p1ctgYnKncMiJ6ngfpylsWCJqigdPHpAnTYhhTV+DJjGNLc4K8oYS9Re4zkQUQOE6oaroeSJYMUBwnqyZmMEdG+iKBlHl6Z6nC5XLLYCSSkQ7JUpil5WRuIGsdLiMI6QuDV+go1wavjyEcT1gNcpka8YIubnm+CyLD6aMbtsfQl3bAWESaAE1aKVhZJur4c/Qjtx9CC657bchhuKh1abWZgCUirAc5AX0E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(31686004)(336012)(426003)(47076005)(2906002)(186003)(83380400001)(2616005)(53546011)(478600001)(86362001)(70586007)(31696002)(26005)(70206006)(4326008)(8676002)(36756003)(40480700001)(8936002)(5660300002)(44832011)(82310400005)(36860700001)(41300700001)(82740400003)(81166007)(356005)(54906003)(16576012)(110136005)(316002)(40460700003)(59356011)(207903002)(219803003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 11:56:04.9913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c91e47-0dd3-4051-ead8-08dacd49b343
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5939

Hi Henry,

On 23/11/2022 11:46, Henry Wang wrote:
> 
> 
> Hi Michal,
> 
>> -----Original Message-----
>> Subject: Re: [PATCH v4 1/3] CHANGELOG: Add missing entries for work during
>> the 4.17 release
>> Hi Henry,
>> Looking at the "Added" section for the previous releases, we seem to
>> mention the changes to CI (automation/) as well.
>> Because there were quite a few changes done in this release, adding at least
>> the following, can be beneficial (something to consider):
>> - gitlab-ci automation: Fixes and improvements together with new tests
> 
> I only saw CI entries in 4.15 release, but if you want to add this I am ok with that.
The CI entries are present in both 4.15 and 4.16: 
4.15:
 - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
 - CI loop: Add qemu-based dom0 / domU test for ARM
 - CI loop: Add dom0less aarch64 smoke test
4.16:
 - 32bit Arm builds to the gitlab-ci automated tests.
 - x86 full system tests to the gitlab-ci automated tests.

> So I will wait for a day to see if people oppose this, if not I will add your suggested
> sentence in v5.
> 
> Kind regards,
> Henry

~Michal

