Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A473F684
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 10:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555929.868121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3lg-0003hn-8O; Tue, 27 Jun 2023 08:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555929.868121; Tue, 27 Jun 2023 08:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3lg-0003f2-55; Tue, 27 Jun 2023 08:09:44 +0000
Received: by outflank-mailman (input) for mailman id 555929;
 Tue, 27 Jun 2023 08:09:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vDKW=CP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qE3le-0003eu-4X
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 08:09:42 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e83::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f61fb78a-14c1-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 10:09:39 +0200 (CEST)
Received: from MW2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:907::47) by
 MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 08:09:36 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::fd) by MW2PR16CA0034.outlook.office365.com
 (2603:10b6:907::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Tue, 27 Jun 2023 08:09:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Tue, 27 Jun 2023 08:09:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 27 Jun
 2023 03:09:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 27 Jun
 2023 01:09:34 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 27 Jun 2023 03:09:33 -0500
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
X-Inumbo-ID: f61fb78a-14c1-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiUBxaGa++6XPm//dBkqg0PSp+Qhh2rtXAklfpGV9bCEcVx3WI348WVtuXFmzX7+oJ19QnQ8Ls1P7Bm1ymrzh64OQ46/pgeGm7uZZZbdCoMmV7f0W+9ktDLdO1AeMrNN452Iicm+oTFIIrj9RcVRPA6X66VtKj43hC8LB38ojji44TvmKJBWy8r+c9JJ3qX1c4/Yzh1ahS8dqN++EBdtntS7dIEctItKAs+k0607r81Jy4WlXiguaM4q11dlhWvzjlwl5N1HmhsRP80eZQeSTOGFz5uSFl18mVVJwcm3plyDuE1+k59yrzxoSN6tnX9zEUAN55Kk87OiJG383mPiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R88fq9ogQ2owywQM64SA3x6PE4QsQk17DhiGpWWPvKQ=;
 b=KoqMLRec6F7QxR6cBIXMPdfk8MaqjE2NjSeQxc0u4Kz3MWF+jFaj0xRS+4d9QkKulPwZskgPNnQ20JaD4M1imo1g5Bkzqdx7n6mw0SQ2ZqoMH3ncLcNHDNg3NIz+RHm/jHSyG4OUpwY+SXHZuM+x4y8iZmOgES9kpkms2oqNM7Km2Y/C9ZLlk5/opJDYFB6x1yv4Tzhn8X8KaAp87dGqGM3OLQawv8G13xhr7k4nuT2V8j8Qye5fJzbe8+Yh04dbF+L0H4+bwp4ozIHd9MtyoBGfsZbBBLewgCfHIu7AccZRMwFg8d1Xr5VvSWfSx4tTyVkuLZtGo0sLTXjseSM8sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R88fq9ogQ2owywQM64SA3x6PE4QsQk17DhiGpWWPvKQ=;
 b=ry+1BpjETDepqbshxgUj4nfqu2vsSIo7yjcag+9Vvob0luNH/TAL6eu1Erc/ORxE1CAo9WXbpW04s+gdcGyh1KTxQ/bIRpfBVqRX5LWGHezbxXqxmZ2Ejz9FWU0WiX7H46w8v2D0p607I0NNbN0LMEVEmpz9ewdXTimRjDf9bF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bfa85ebc-74a7-e693-6392-cee24302c19e@amd.com>
Date: Tue, 27 Jun 2023 10:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
 <804682ce-ad88-34dc-1501-c9ff6347fb8b@amd.com>
 <f9afb315-34f8-0e1d-de67-5024fe7f616f@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <f9afb315-34f8-0e1d-de67-5024fe7f616f@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT028:EE_|MW4PR12MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: 952f73ea-80ee-4640-f552-08db76e5d8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	29o1DQ7Vy2mX165cA/s9163Nxz24gZrretwVUla29LRGMepQd3FA2LLTxHUyM2QfuPJBSPLgefOM1JzCPrS4n17aMmJtQbaJsLLNbcY7NmTTJJKLFJIRppKnpf9U0/+NM6LHYexRxExG7tgcR9iU8qhW8hSxunrn58ywWSNrBIVDy//lYPzgXdgttV1HHD9SI1A4ESQpJRixO1IZGDr+q3cJqCwNeNJ6685qGEA4FwmtwHvTbFycmjzjwKFdtoaIbR7sN5JeP74WvAoc1u7sY1SlcWPurqn+ulsA4Em0ey7cAADaf+mGD4lDe/inimwEX9s639il2i1xsVz2tH1vxiXRiqUI3yQzwzwWVu/+fWwwsYMnyVcbK8zk2FxMwZEDaEXvC1qgLNcq4g1Dt8CiLI4K6oWCCbXJhJbyHneLOXos7ZPCMHEw7uOoXstxRcKfYgyHVU1uce+kug3mWZDZ5RiER1EyopW2H1MLouebyRLj5AZJUeF9dIjU4wdk2cOjnIBdMc6dTsvVeUb4TLSJCQsQzq5quOjm13rBSvMUfHo+YFN36LYQM+1e9lGVhIXzTKrAB+FellAXmjmVHchOkp5QGyWejUbMU+8zSrvH6wuzS/gJVp7Nt1wZyPXKbBAnu9l1sC+SzmtJtzQ6v3hP8V/5F7WfTAuzBTDN9gteCzPbb4v3wEFfq6+RKJRv5T12hC0roRmKjFxNaQavNAHO7T1yI4EMn3evzKWYFZwEXDAwVtW2lTMJWq5n/rde2o+w8SV0HLsC6xHEqSXqXlXgXIE0eM2Hc1M7fXi/efyTufd83oiT+gaYfl2zxCy0EKiI
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(31686004)(186003)(26005)(2906002)(5660300002)(82740400003)(8676002)(36756003)(336012)(82310400005)(316002)(16576012)(54906003)(81166007)(86362001)(110136005)(478600001)(31696002)(4326008)(2616005)(426003)(47076005)(83380400001)(44832011)(41300700001)(70206006)(8936002)(40460700003)(70586007)(53546011)(356005)(36860700001)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 08:09:35.6689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 952f73ea-80ee-4640-f552-08db76e5d8b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5668

Hi Julien,

On 26/06/2023 14:56, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 26/06/2023 12:56, Michal Orzel wrote:
>>
>>
>> On 25/06/2023 22:49, Julien Grall wrote:
>>>
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> UBSAN has been enabled a few years ago on x86 but was never
>>> enabled on Arm because the final binary is bigger than 2MB (
>>> the maximum we can currently handled).
>>>
>>> With the recent rework, it is now possible to grow Xen over 2MB.
>>> So there is no more roadblock to enable Xen other than increasing
>>> the reserved area.
>>>
>>> On my setup, for arm32, the final binaray was very close to 4MB.
>>> Furthermore, one may want to enable USBAN and GCOV which would put
>>> the binary well-over 4MB (both features require for some space).
>>> Therefore, increase the size to 8MB which should us some margin.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> ----
>>>
>>> The drawback with this approach is that we are adding 6 new
>>> page-table (3 for boot and 3 for runtime) that are statically
>>> allocated. So the final Xen binary will be 24KB bigger when
>>> neither UBSAN nor GCOV.
>>>
>>> If this is not considered acceptable, then we could make the
>>> size of configurable in the Kconfig and decide it based on the
>>> features enabled.
>> Both of these features are enabled only in a debug build of Xen, so
>> another option would be to increase Xen size only for a debug build.
> 
> At least UBSAN can be selected without DEBUG. For that you need to add
> EXPERT.
> 
> Anyway, from your comment, it is not clear to me whether you dislike the
> existing approach (and why) or you are OK with the increase.
Sorry, I was traveling and did not have time to complete review.
I cannot see why increasing the size would be problematic so it is ok. That said, it could be
a good idea to write some comment above XEN_VIRT_SIZE, that this value is somewhat exaggerated,
so that we are on the safe side at the time of activating features like UBSAN/GCOV.

Also, it would be nice to update comments in head.S of both arm32 and arm64 above
GLOBAL(start) that were left stating:
"All of text+data+bss must fit in 2MB, or the initial pagetable code below will need adjustment."

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


