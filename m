Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6045B8374
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 10:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406861.649257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYOBy-0004Hh-K0; Wed, 14 Sep 2022 08:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406861.649257; Wed, 14 Sep 2022 08:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYOBy-0004FU-GT; Wed, 14 Sep 2022 08:56:22 +0000
Received: by outflank-mailman (input) for mailman id 406861;
 Wed, 14 Sep 2022 08:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOXq=ZR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oYOBw-0004FO-RZ
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 08:56:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18c68907-340b-11ed-a31c-8f8a9ae3403f;
 Wed, 14 Sep 2022 10:56:18 +0200 (CEST)
Received: from MW4PR04CA0037.namprd04.prod.outlook.com (2603:10b6:303:6a::12)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Wed, 14 Sep
 2022 08:56:15 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::fa) by MW4PR04CA0037.outlook.office365.com
 (2603:10b6:303:6a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 14 Sep 2022 08:56:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 08:56:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 14 Sep
 2022 03:56:11 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 14 Sep 2022 03:56:10 -0500
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
X-Inumbo-ID: 18c68907-340b-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jszu0xVS9WOKpZJSkuz1V3O+fxzNYQzA478zksv7UxdKr9eXnsgZEZrhOtjGgMTAbImgtKYzQGMLbKLdLKiT1dRcfQMSCMzRJHmyWI5NpiTlH1PD7y6lo96vSVrq7rafOm47oLd+jb2SsROagTiOTAuZoiZgycnhgy11CghmqwxtJE8sCJa5oE4ucYp699ZV+lrsMklvhgfp3l95C2vymORUhqauhITxQ+zdSdIBUj9iKV3WpOoX29XT8iDQ2LjBcsuDk0uMVGvfLrwHn8GGASPmpHFUoidz8NBtQSXSaKhdmft3s0Ba/JmWi9NYuJbgD9adk81w5Ob0AW7DDy8wpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlSBLE5PhDzBmNfA4MbQV/g6UZ0OSm0ZZMm2UjqKgm4=;
 b=Xs22l7XcYc2HJ5xggSBivfzN6ItYaukOt0KXAATRV1GY7ks3adX83GhuGrETV87kAT+xGVM8SRwP47nVdxr47n1CmEf00L7dZx0IJcLFd51hW3ejCjdcsvogWZVK/7uRcygxdVHWloh+cUFcPgqNdxsi7yJrSPipR7vufR/2FvqQCZ8va/nkBAwE/qOzuCYkTGT+xtHSigM/hsD/DSA/FpyA7woMuCPZcTTcK7N/2q7ZxyPdLZsimDIqZt+hJ2Sl9SzraFt/OLP1ffjJqEg7/7UC2QjAjmFLQX1wyDBZp7WioGHGpvS/of4q3aLlhlBHg1SX8b7vAe6CNTEnO8IYnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlSBLE5PhDzBmNfA4MbQV/g6UZ0OSm0ZZMm2UjqKgm4=;
 b=M4Y7lpQq0tfbwvnpMEcz+TnJQggjC1GRHta/Y2rddMxyRflXICPrcpUZ5WnNIibmm16A40AEordtOWCl4X9WxkSbbJeVZ9w66riOoyqKZGrl00HEnnWfWMn1OwP4QjrMS1vCATs0oWk+buoBOpC8jgYKv5p3iVTOY8EN++AYO6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <04fd3e27-1105-4ba6-bf04-d3b25bd3b087@amd.com>
Date: Wed, 14 Sep 2022 10:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [ImageBuilder 0/2] Use lopper to generate partial dts
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
References: <20220912115934.19552-1-michal.orzel@amd.com>
 <64aadcab-5f41-6d2f-4dc9-39415016816a@amd.com>
 <81eee8c0-03e4-fa41-757d-ee749ebcbe07@amd.com>
 <alpine.DEB.2.22.394.2209131215390.157835@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2209131215390.157835@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|MN2PR12MB4303:EE_
X-MS-Office365-Filtering-Correlation-Id: 76acce41-d823-48f3-79fd-08da962efa95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jBfJ3Syi0Jha29v4nbOtGWWtiywYvpH3EHKVy4IgMRANncorB/tlTkOYo93ohQoZiB0Uv2x5wU0Fza9fSS7VqCzWsFmnKHbruupmdsJnHCwqIx0e+qew/1IgQmKtcwT0P0dYRrpqfTcByYuDPKUB/P2iQkPOBOnNFl4Fc8qHHricrXS4CBoxpnDb4JdV2sFSnXIDFeNKhxZPHnaj2LUPtNqGzbiplOUG7gmmtCpu0Zst499SuoEWvIDyxFUkBqUUPMU8cQMQECLQFPhqKBSCgIf/iCBo3MNbwAQ4UUOaKoOQ7CkDzmAxUS1EQmJhfRn0x5O8VBdKpF1V4EhHPImctbJu5svdW6TTTjqJUja8LFcBaakxG7tVQRvHw1c/4rL6/QH0N0MA2bv02KSbxg5FZ/+azOkV+jTiO2edJU5httkxhFY/zIaEFtOwb4s3KD0qdNAom26FdMaXPAGXlg5uCXECK7d0Ks0c0h7rSK/FeK0NXar07Fox8qeVCE4kRey+l240mMdTabD6DSLYPIA4QQf2fPxDv/HgAnZ60A5+UxYcdsJOlc8IdW5uURVBU+IeuNiCFlpFnvahtAPUhd/ixDsfJMg2yKzFcI4DIXK8wYrfh0GgBE68B+ZoK81mxpD6+tEjguNYcK3Y5O6X62TzT1cpaOkj/SDPjwj2iY1FPIE8BNHV/UYvWfOdpqOq3UpR5169dUr/UxvvTbTgopwvGuRlabJ3G6E+IhJlhYqLpfe7Sy4APSXLZVlcvGvHJoTqsNx8Qp2UEiRj8HMfIoODNVGCAM6ilQvxSDT3KjCY4cHPgag62LcCJnynXbdqQ6DWxEg+vq056GaYmhEnsxheIWwyoTxkbepbHU55uZh/ag8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(4326008)(336012)(54906003)(16576012)(6916009)(47076005)(31696002)(86362001)(2906002)(41300700001)(26005)(966005)(5660300002)(36860700001)(83380400001)(53546011)(426003)(31686004)(316002)(82740400003)(186003)(356005)(40480700001)(82310400005)(40460700003)(8676002)(81166007)(478600001)(70586007)(45080400002)(36756003)(44832011)(70206006)(2616005)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 08:56:14.1077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76acce41-d823-48f3-79fd-08da962efa95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303

Hi Stefano,

On 13/09/2022 21:28, Stefano Stabellini wrote:
> 
> 
> On Tue, 13 Sep 2022, Michal Orzel wrote:
>> Hi Ayan,
>>
>> On 12/09/2022 18:27, Ayan Kumar Halder wrote:
>>> Hi Michal,
>>>
>>> On 12/09/2022 12:59, Michal Orzel wrote:
>>>> This patch series introduces support to generate automatically passthrough
>>>> device trees using lopper. This feature should be used with care as the
>>>> corresponding lopper changes are still in an early support state. Current
>>>> integration has been tested with several devices from ZynqMP ZCU102 board
>>>> e.g. serial, spi, ahci, mmc.
>>>>
>>>> When using this feature, make sure to use the latest lopper's master branch
>>>> status [1].
>>>
>>> I am guessing that this is the first time the imagebuilder is using
>>> script from an external repo. There might always be a possibility that
>>> future changes to lopper (master branch) might not be backward
>>> compatible or might break something in imagebuilder.
>>>
>>> As such, will it make things better if lopper is included as a
>>> gitsubmodule for imagebuilder. This way a specific revision of lopper
>>> will be in sync with a specific revision of imagebuilder.
>>>
>>> Please let me know your thoughts.
>>
>> I think it could be beneficial in the future but not in the current state.
>> The reason why is that the lopper changes are in an early support state
>> (I try to highlight it on each occasion). This means that in the near
>> future we will be improving lopper extract assists to cover some corner cases.
>> Adding lopper as a submodule now, would result in a need of additional commits
>> for the ImageBuilder fetching new lopper changes each time we improve something
>> in lopper. I think we do not need such overhead at this stage.
>>
>> Also lopper's README states that "Internal interfaces are subject to change"
>> so we can assume that the interface given to the user will not change.
> 
> Forward and backward compatibility is something we'll need to think
> about at some point.
> 
> Personally I dislike git submodules and I would try to avoid using them
> unless strictly necessary. However, we could specify a commit-id or tag
> to use (the same way Yocto specifies component versions.)
> 
> Given that it is still early stage for this feature, I think we could
> ignore the problem for now and come back to it in the future.
> 
> Or we could change this patch series now to take as LOPPER_PATH input
> something like a SRC_URI in Yocto, which could be any of the following:
> 
> git://some.host/somepath;branch=branchX,branchY;name=nameX,nameY
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsome.host%2Fsomepath%3Bbranch%3DbranchX%2CbranchY%3Bname%3DnameX%2CnameY&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C5ae88781fff24f8e6a8c08da95be2fb6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637986941323037721%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=dHzcGYqr9mIv2t746FnEE8QTrSmxqBJ4G9esebbAnu4%3D&amp;reserved=0
> file://local.path/to/file.txt
> 
> If we did this, it would be more future proof and we could use the
> https:// URI by default with the "master" or "master-next" branch so
> that we would automatically get the latest updates. In the future we
> would specificy a stable branch instead (e.g. v0.2022.x).

This is a good idea in general but has one big drawback IMO.
Specifying the git repository such as lopper to be cloned by ImageBuilder results in
transferring the responsibility of installing prerequisite packages required by looper from a user to ImageBuilder.
Some of the packages are available to download using apt-get install and some of them unfortunately using pip manager which can be tricky sometimes.
In the current solution, lopper is an external dependency and the user is responsible for cloning the lopper and making sure the packages are installed,
in the same way as we require e.g. mkfs.ext4 to be installed. However, cloning a project from ImageBuilder means that it is the one who needs to fulfill the requirements
of the cloned project and keep up with syncing them (different package versions required by different versions of lopper).

Once the lopper+imagebuilder integration is in the shippable state, we can just inform user in the README with regards
to which lopper's branch/commit-id should be used.

~Michal

