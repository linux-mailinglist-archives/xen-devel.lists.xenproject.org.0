Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC3675977
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 17:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482001.747283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItrh-0002Hb-VS; Fri, 20 Jan 2023 16:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482001.747283; Fri, 20 Jan 2023 16:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItrh-0002Ex-Rm; Fri, 20 Jan 2023 16:03:41 +0000
Received: by outflank-mailman (input) for mailman id 482001;
 Fri, 20 Jan 2023 16:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUaQ=5R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pItrg-0002Dj-5c
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 16:03:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff3bb2b1-98db-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 17:03:37 +0100 (CET)
Received: from DM6PR06CA0007.namprd06.prod.outlook.com (2603:10b6:5:120::20)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 16:03:34 +0000
Received: from DM6NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::83) by DM6PR06CA0007.outlook.office365.com
 (2603:10b6:5:120::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27 via Frontend
 Transport; Fri, 20 Jan 2023 16:03:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT088.mail.protection.outlook.com (10.13.172.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 20 Jan 2023 16:03:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 10:03:33 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 20 Jan 2023 10:03:31 -0600
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
X-Inumbo-ID: ff3bb2b1-98db-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQXdluOwXLyM5mVhZXeEJP0pNTQhCdSkwNcuO1qK/QTn+i6MEiBE2GgTDaCdN6zOkNQn0/cGZiexGw2kB0aNrzCIx1wm6RromiLVjPBp5v0zJWuYRTPfNMDeY8NwK0nXyF+tbnUaxKxpactFE/J4UZ/TkEOVsd+IVO72979+xsIPTcCaOTk73wsTpnvRsXXwAuUok7Wg+uUHmz1lDp+C0ddDH1j33vvf8p8OYtl1mtl1o4sYvcqass8jlP8tUdqHBXTae6Tar8wqmjBcpzrjPvs+BTX8Ytuai0LDdsGPbhI9sveOV00rJ+57vssHVh3OuWpg/yxXQI2qb8mnL478KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAYvzcLgC+VmA+eUVGn/Va5dzSjMM1zIXoiSSZqCQC8=;
 b=PXtC9VAWvLtFBZzVXdwRaHQupw+KFwpg+VGPCrl0Rgo0/F8DlPxmhpgAmXokMAjX+OrIPLcoPqqPPfWlfYMnh/+DQhUsyztSTZExSyKZHpuxxUwis1Ofl4DKvoShcSvli45cZRgkIOrP9auxvBFMZHuotpCw+csSA5TsDrn7MBeryTl3k+rrbJaEEzThStxtA2B5hAjWG/jucTAJjE6uQF4HXx54fk82hDDB2l0EVvZYAjcHMsgABStMLpPjQdegYMYNbWeetrQtUYn/fwezHovX9RfH3XdAHilIMRd6VCwFPWJQq1zqhQuBuEc3SLql2FfT4mx4V3zCNePalCrRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAYvzcLgC+VmA+eUVGn/Va5dzSjMM1zIXoiSSZqCQC8=;
 b=SGxV4kDM+t3COtVNPINA66hs+muGhUEt1CoD7hLifQzAOzI6iFJEzaetR81qUhYJbnZQA+Z0gGy1uYKVaAh+xUAY/klt/0lby6eN8+BXhbM30cHwknNC6N5LW8UYDflyDRw8afpQEXdBPv1ovagnY8JF8V/yfPHA+vW46aLH2UQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2017e0d4-dd02-e81d-99f4-1ef47fc9e774@amd.com>
Date: Fri, 20 Jan 2023 17:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v2 02/11] xen/arm: Use the correct format specifier
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: <xen-devel@lists.xenproject.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-3-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191454080.731018@ubuntu-linux-20-04-desktop>
 <c7e5fbf3-9e90-7008-0299-f53b20566b9a@xen.org>
 <ba37ee02-c07c-2803-0867-149c779890b6@amd.com>
 <cd673f97-9c0d-286b-e973-7a85c84dd576@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <cd673f97-9c0d-286b-e973-7a85c84dd576@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT088:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6f4354-922a-44ca-3b2b-08dafaffe200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BDb5TJbB+3pP/ULoobozaBrXNRKWrJGcpFOIItFIgDhT4RxyZ3vF9UdPYVWqxcyhNnfNqnPmV0Y9CfLYEBdgftTduifjumpVJTHlS3c8gK4c+bEu7AA5khSdVclCmmfZEt90YaCr2ia7VxaTSriaAOvxTyIRYkIszGX+E5x2oKFtIzLWUAlKusDzBe4xaTXILcX002hTAC62xAscqO6fVdbuIRnh1i3pYhxdexyg94Cj48AoJCDBLhFowOJ73WyHZLcNgtnSYZ29onaeripYQdd9wX9AwjsqrS9CSB9k5k0JvFjH5PM2/26IpvfiMMW9Ew5FYT0Tmz0fsx3XrghvAdKO9nR9hPQJMk1v6QvwwCAkzJmhi176/kO/i6Fw7E9g//6iMLblLJ0Tpn12MIw6E9kQI39SjpQTUGJFKMSmJrJqTTDiDsdIDRdOiAJVOGxvypBhSTN+WccOp5vfim4rvWLlXdMCc/0p6OI4SOeXAKY8vmenGDCsVpQYzmFkMgIYxViAs5SbK+pFlx7LnLj+Krf+Jrp2CiAEnUhTXIjByJV8T9zBUzxmFXPPGqkmQOVwwl7oUJletOWc58WJDEyCcQy//JoYPWzwzUcne3WBdKe0Oo/DkavWuEE4vW4QAoVBtnyyuFT5XS3jEI4fvvYBkrN+9RaYCMwyO9IxZhNOM7HbmjlBuHKvLUzA4fihJPqeuJcSPVXV1hleEx7k0ct5ivZRVU/THbu0TdFSG7goXHW9P5qkkkjJxvwWmIjMUDMZXJ3s0eU7LAYfK8PAHqOpBqH7BZ0+pu4e5yvJV0DiQBzbLS+oV6UcEa3qsIqJf5MuSoiXjJAoXJHutborZZMaLw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(81166007)(31686004)(478600001)(53546011)(356005)(82740400003)(186003)(26005)(86362001)(966005)(31696002)(82310400005)(83380400001)(41300700001)(36860700001)(2906002)(44832011)(8936002)(16576012)(110136005)(54906003)(6636002)(2616005)(316002)(5660300002)(426003)(4326008)(70206006)(70586007)(8676002)(336012)(47076005)(40480700001)(40460700003)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 16:03:34.0835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6f4354-922a-44ca-3b2b-08dafaffe200
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722

Hi Julien,

On 20/01/2023 16:09, Julien Grall wrote:
> 
> 
> On 20/01/2023 14:40, Michal Orzel wrote:
>> Hello,
> 
> Hi,
> 
>>
>> On 20/01/2023 10:32, Julien Grall wrote:
>>>
>>>
>>> Hi,
>>>
>>> On 19/01/2023 22:54, Stefano Stabellini wrote:
>>>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>>>> 1. One should use 'PRIpaddr' to display 'paddr_t' variables.
>>>>> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
>>>>> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
>>>>> address.
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>
>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>
>>>
>>> I have committed the patch.
>> The CI test jobs (static-mem) failed on this patch:
>> https://gitlab.com/xen-project/xen/-/pipelines/752911309
> 
> Thanks for the report.
> 
>>
>> I took a look at it and this is because in the test script we
>> try to find a node whose unit-address does not have leading zeroes.
>> However, after this patch, we switched to PRIpaddr which is defined as 016lx/016llx and
>> we end up creating nodes like:
>>
>> memory@0000000050000000
>>
>> instead of:
>>
>> memory@60000000
>>
>> We could modify the script,
> 
> TBH, I think it was a mistake for the script to rely on how Xen describe
> the memory banks in the Device-Tree.
> 
> For instance, from my understanding, it would be valid for Xen to create
> a single node for all the banks or even omitting the unit-address if
> there is only one bank.
> 
>> but do we really want to create nodes
>> with leading zeroes? The dt spec does not mention it, although [1]
>> specifies that the Linux convention is not to have leading zeroes.
> 
> Reading through the spec in [2], it suggested the current naming is
> fine. That said the example match the Linux convention (I guess that's
> not surprising...).
> 
> I am open to remove the leading. However, I think the CI also needs to
> be updated (see above why).
Yes, the CI needs to be updated as well.
I'm in favor of removing leading zeroes because this is what Xen uses in all
the other places when creating nodes (or copying them from the host dtb) including xl
when creating dtb for domUs. Having a mismatch may be confusing and having a unit-address
with leading zeroes looks unusual.

> 
> Cheers,
> 
> [2] https://www.devicetree.org/
> 
> --
> Julien Grall

~Michal


