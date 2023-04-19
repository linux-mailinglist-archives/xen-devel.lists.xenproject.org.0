Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A66E7B4F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 15:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523503.813603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8GU-0008VL-KL; Wed, 19 Apr 2023 13:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523503.813603; Wed, 19 Apr 2023 13:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8GU-0008SQ-Hb; Wed, 19 Apr 2023 13:54:30 +0000
Received: by outflank-mailman (input) for mailman id 523503;
 Wed, 19 Apr 2023 13:54:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifGd=AK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pp8GS-0008SI-SI
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 13:54:28 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e88::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2728df2-deb9-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 15:54:27 +0200 (CEST)
Received: from BN9PR03CA0158.namprd03.prod.outlook.com (2603:10b6:408:f4::13)
 by MW4PR12MB6682.namprd12.prod.outlook.com (2603:10b6:303:1e3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 13:54:24 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::d) by BN9PR03CA0158.outlook.office365.com
 (2603:10b6:408:f4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 13:54:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 13:54:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 08:54:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 06:54:22 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 19 Apr 2023 08:54:20 -0500
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
X-Inumbo-ID: b2728df2-deb9-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIudMR5PNccoLSuUTWK8WY/Pd+DnN1whehTvpViHcEpO0sdINe/aNWYeJ1iuqua+VEkFAPo41AakREVQz+pD6Bdvd5Q9GH0IiBYdmLY5KGrgCTlGp4bt91Cmdg+kwMHzOmZYYfjJkoASomg9SXYYzTddowd6BhTbVi7d4PrH3wTtRrmkyts/VOKAImlGy7qIB/uS2elF/TelaW38mU0TWf7SB80kckuvcstgcYdg8dbRsVcKJwxJiv+qqEIXaXD6ctAVpLUnMiTQ9LJVNHKgTXJwQfYFwVp7jgBK9tL+GuAw8fsnC4ARBFenvN2JSDdk7SRZuSb5VxCJYOR6VHvSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHMkKwX1+xcemUZez2mazKLKo7+2/VeQYEertk59Pc4=;
 b=ahwm/etPRIqjEW0I5M/8nLsfqw7eN5DT+gFekYesTr6nIXJglgNGKkjrrghgTlgy9ciuoknZD8TeTkXRSnDy3odepCHY6QEjWE7pQ/EpA6aex5mdR3O3dhM2mxuwKrthS3VW8L1OevdP8kPh6Aoqa2yYzwMsfuK7wi0MxI24w903HWjBZ5Tk7+U6tJRvTOPDXG9WR98o0D8Hs11R/B/O7lzl+hObXosjNOmkjZPHiLfI/JfujrBWfLqHvgx3luZPCGffS0+DjGUQ8Yt5Af9y/x+ZhR715f3PzApTIjsv2kdfWZEtzpfitY1zr0NciJNFENJXEyVI/jse6EIasJt25A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHMkKwX1+xcemUZez2mazKLKo7+2/VeQYEertk59Pc4=;
 b=qJo3rXnknFRp9XOXuHux/fPPI/BZtaZL0AmfspuwAS+G0WtZwo6lrC3Qfh6lmlSpVwXAZqyGompJyzQgIS5g1JhyZRv3nPuZGMqvRejzsIq1tqnxfZUvtEO8sS0hPqpKZQlYL/+vFRA6b0WWRfUgz4cy7ev/VTEpmfVUvTNy5MY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8560fac2-5c92-8362-090d-bbaeae3f5d22@amd.com>
Date: Wed, 19 Apr 2023 15:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
In-Reply-To: <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT033:EE_|MW4PR12MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: 780171f6-2523-438d-307a-08db40dd94f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EfkG4OhvvWrmpu+yBcTas1+n1MnFX4JOSOZhKSIOjTegaeFWkLHN1pHVAbyjk3VgcXOFONRIILj/O5F+zfwmC/IrVpEnOyXhRjb5JkzeG2jAX4FqDNJgbgU+mZpEPTu/cg9aAdPOx8/T/A2uwBhfJ1+x6xL9pBkoi8eQD02F/7iJzDGchW4Be3XP9oGsW8Ws+6LLj2hSGmmrXEu6I1JEhtPFaHICQAtGOB3OgT0Q9Uvbg1R0nMcJpDzfuC1H+ijabn/a0fX9kqkRzr2ujvUOo58b9D0eI8tsi75dFShzoVD6zLCs2RU2ocLM30EGKB8JE2BydTtHg9E5VSo5EzNNCFbpiWYwcD9y5eP+Z84j1ec2Q/91P5GWjEoAhsg9/S/jmJ489gkRy2Z/tXDf0xqGI7N4TqgDwJXHopCRRT4TJ1Sl72eFMYaE8/m0Ju0QaSkUoc6mRtbx5I2Lbr6jQkR8vMiWyV2Tg81qn1UNd074cSy1n3pnbPmCQSNMOX0zUvOC3lusxK6CkLfBbZ37tfrt8eIOT9udIT/UDxDHOLDOZi3H9WW4bHfsBo/KLXadJ3vFpxarJthpLROKz5OP5mHhJphX2UfBUJSu8RckBaBKTEeglwJdQJ7UiStvXbQRmtS50k74ptxud1Pt2NQ7cUIX/kWsLKAwug6V5MPlfRi4D3Iweb1m3lqBA1LyWEwTeqJ3INv2hqJlnDNwVIcwUpTy6F3/n7ayQsywQHipIkhTeq0/tOfdE4FH3Fz6uRvtb/Ca6pzYwHdOlp7c8ARNcG4z6w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(40470700004)(46966006)(36840700001)(356005)(82740400003)(478600001)(6666004)(40460700003)(16576012)(110136005)(54906003)(81166007)(2906002)(40480700001)(83380400001)(426003)(336012)(47076005)(186003)(2616005)(53546011)(82310400005)(36756003)(36860700001)(4326008)(5660300002)(316002)(7416002)(44832011)(70586007)(26005)(70206006)(86362001)(31686004)(31696002)(41300700001)(8676002)(8936002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 13:54:23.3438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780171f6-2523-438d-307a-08db40dd94f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6682


On 19/04/2023 15:19, Michal Orzel wrote:
> 
> 
> Hi Ayan,
> 
> On 13/04/2023 19:37, Ayan Kumar Halder wrote:
>>
>>
>> The DT functions (dt_read_number(), device_tree_get_reg(), fdt_get_mem_rsv())
>> currently accept or return 64-bit values.
>>
>> In future when we support 32-bit physical address, these DT functions are
>> expected to accept/return 32-bit or 64-bit values (depending on the width of
>> physical address). Also, we wish to detect if any truncation has occurred
>> (i.e. while parsing 32-bit physical addresses from 64-bit values read from DT).
>>
>> device_tree_get_reg() should now be able to return paddr_t. This is invoked by
>> various callers to get DT address and size.
>>
>> For fdt_get_mem_rsv(), we have introduced a wrapper named
>> fdt_get_mem_rsv_paddr() which will invoke fdt_get_mem_rsv() and translate
>> uint64_t to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as it
>> has been imported from external source.
>>
>> For dt_read_number(), we have also introduced a wrapper named dt_read_paddr()
>> dt_read_paddr() to read physical addresses. We chose not to modify the original
>> function as it is used in places where it needs to specifically read 64-bit
>> values from dt (For e.g. dt_property_read_u64()).
>>
>> Xen prints warning when it detects truncation in cases where it is not able to
>> return error.
>>
>> Also, replaced u32/u64 with uint32_t/uint64_t in the functions touched
>> by the code changes.
>>
>> Also, initialized variables to fix the warning "-Werror=maybe-uninitialized".
> I can see that now you explicitly set to 0 variables passed to fdt_get_mem_rsv_paddr()
> which haven't been initialized before being passed to fdt_get_mem_rsv(). Is this what
> you are reffering to? I cannot reproduce it, hence my question.
I can see why did you get this error.
Before your change, we always checked for an error from fdt_get_mem_rsv() by checking if < 0.
In your wrapper fdt_get_mem_rsv_paddr(), you switched (not sure why) to checking if not zero.
Becasue of this, you got an error and tried to fix it by initializing the variables to 0.

~Michal

