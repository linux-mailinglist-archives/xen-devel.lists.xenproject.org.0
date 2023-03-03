Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6B6A9700
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 13:10:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505949.778949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY4EH-0002Wq-Kj; Fri, 03 Mar 2023 12:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505949.778949; Fri, 03 Mar 2023 12:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY4EH-0002UC-HM; Fri, 03 Mar 2023 12:09:41 +0000
Received: by outflank-mailman (input) for mailman id 505949;
 Fri, 03 Mar 2023 12:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DvcW=63=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pY4EG-0002U5-A8
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 12:09:40 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20628.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41dbfa9f-b9bc-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 13:09:34 +0100 (CET)
Received: from BN1PR12CA0021.namprd12.prod.outlook.com (2603:10b6:408:e1::26)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 12:09:30 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::ae) by BN1PR12CA0021.outlook.office365.com
 (2603:10b6:408:e1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 12:09:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.19 via Frontend Transport; Fri, 3 Mar 2023 12:09:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 06:09:29 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 3 Mar 2023 06:09:28 -0600
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
X-Inumbo-ID: 41dbfa9f-b9bc-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdnGYK2pjlh6nsLeJO6zT4Rt0BfXBZ8gXg0uy9A9xV6WP30OynBr2/ssAxmVJTKYIYAP4EZuVi33x14u/k1/MwnRHJvVWZG6ReMizoUgMFeALGp1AxKnlMgxD6ZXBzXQRJKA+Hl7r+vwPVcbY+9JsOrhoueQATdbAHx/RJjGj73BX/9XwmGjbOuj54+JtYoTqaEOGoz+DeBwv5iozFsNnYfu2l0Gr7QfGTbAh9+iFlpinM3F2ah1+dG0LRR8Tc4YJg7kTBSGIk1XztvcqOgoqWhbRktca+XnmKU9RH2ukm1yWxsZubXiLMl2Ex74fk7hdFDdMhmRuFsuPsKLlPxFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPqu7jOc0vI9s4y/WybfmC0Ew++zE39dV2zMMv0sMqY=;
 b=ZDRdaxc9INFp/OR3HElIaU3DNl4y5mLXqsdbyNRA7UV7QTqKN2kZChRMXrT0ZXejQaCM7Z41W7WE7kvnMnx9cQ+9EvUmd/mFYvSHw70tTaPVbrlPhRzqtOoEfLQGOeMkKYtsLHQtzFNTQko61FKJf5Lqp/N0choByXcx4gQBxi9gfx3pOEecuhxG+ekZCvs2hlv9d2nc6I3Ko5QhFsJoIqTXM/jU/Nug6VcWlKtEna3qMn2NUgrAfrC8nw8BsSgD4Bt1TnYpQ3lWPpprRlSvuIF8zsTHK8bR6XxbSdKJF8ErqIKiVXcsjZ4opK8eMtghLT299aHytL7QJtByjt4G/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPqu7jOc0vI9s4y/WybfmC0Ew++zE39dV2zMMv0sMqY=;
 b=k3S+lGLlkaisPjIBJNcamQRyvEQt9uRAsLTmdloqFjkztGFXA80jQ4bcrlkuKHyN2AVG8ZpgXOSdNzQ0Js/lK12CvYmAZuvgs+kcZvCdqhwFE7e3hElkgUHse5YA/9maFY46gXlRFtZFd1NjBG10ykpJkF1P1Mr8Wv7mXL7x8+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <631c534d-5781-7884-4814-7182b0c59621@amd.com>
Date: Fri, 3 Mar 2023 13:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] automation: Add missing and drop obsoleted aliases from
 containerize
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230301090644.4452-1-michal.orzel@amd.com>
 <62e997e2-8e45-9048-10fa-469bfb28b08b@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <62e997e2-8e45-9048-10fa-469bfb28b08b@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT021:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: faf147a2-e864-4d27-13b5-08db1be02473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	viX6ep4N0clk6HGvfqMbBpctoa50t0NpCmgPOf2M7X4wOvwxkZo7lEnpr2QWClfuTjYE8U4h4EHhuC81htx7yHXeamKDJ0rbETXbhSbC6Jp+xhI8WjmAbAzkXJcRrVeZNJJsLh9wosNu0R6HXPdXGXTrFxIyJUsnJ1B5wG7HCPNTCXkcypvobf8pyMEhUVFZpWaKPBcPMSIumKZ9/lqHsvVeLMMyg9JV14zwLtwuqHGZtAJI2atInodTEN8ZfzZJwRS1N4UgJaVDFMGH0qt/D0mh9ZrYwQo912RC6XB15A5Smzw/KeOFG8YhyFLKl5GMAXcgNCJTz6tup+DoG07onXqPxl4YZ9kGY3h3BTQhMg+9zFlnAYMO0tgMg/4SfhLYfIG1Fp/EpuHd8Hy6kL8OXnH/wNMxRnvE4BO1I4P9wtuU8HA2nWHk5HPyNXpk+yFH3DTQ5wc8nwmd8Scu4L6me1xjVTMunpRCxHaZXhkLDAEdG2XiMUamwOZwlX0rgli8UDs1hDbSfXjcrrin25TanzWJzdGTOuJAyXiBQsoh8BALC5AwR6rGyamf7w97aJ30IbT58b1zOhEZ6eP1xRF98lfe1Pqr98xOBlXd2CGVCu56pTkwlWrvjmvvE16UNSCqqcCEYYM3lzkaec6/X9B54OndPBfy02bKz6/EHTxtKVwbQRvvo0kzebxrz3VrylzzYQg4lEdGZQNT0DUmodJ55GD1/2Ed81vZC+hDFrCEv7QqAxgQp4yztelJge/1Fvp15cnhL/rX2F0LekeXrtcWYg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199018)(46966006)(40470700004)(36840700001)(478600001)(186003)(16576012)(82740400003)(110136005)(40480700001)(8936002)(36860700001)(356005)(316002)(86362001)(41300700001)(31696002)(54906003)(81166007)(82310400005)(36756003)(2616005)(426003)(47076005)(336012)(5660300002)(40460700003)(4326008)(44832011)(26005)(31686004)(2906002)(8676002)(70586007)(70206006)(53546011)(6666004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 12:09:30.0734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faf147a2-e864-4d27-13b5-08db1be02473
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223



On 03/03/2023 12:59, Andrew Cooper wrote:
> 
> 
> On 01/03/2023 9:06 am, Michal Orzel wrote:
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
>> ---
>> Open questions related to the CI cleanup (@Andrew, @Anthony):
>>  - Why do we keep suse:sles11sp4 dockerfile?
>>  - Why do we keep jessie dockefiles?
> 
> Because we don't yet have a process for retirement of such things.
> 
> Right now, all branches other than staging are using the jessie
> containers.  While it's still in use on any branch, we need some way to
> rebuild the container (potentially with modifications - see the recent
> HTTPS fun), and standard practice is "patches into staging".
> 
> An alternative could be to patch into the most recent staging branch
> containing the dockerfile.
> 
> 
> sles11sp4 is more complicated.  We specifically tried to get a SLES
> container working, but it was always in a weird state (only @suse people
> could rebuild the container).  We did eventually replace it with
> OpenSUSE containers, but I can't currently locate any evidence in the
> gitlab yml that we wired sles11sp4 up.   Which is confusing because I
> swear we did have it running at some point in the past...

Ok, thanks for answering. Stefano wanted me to remove these unused dockefiles.
Are you ok with that or only to remove sles for now?

~Michal

