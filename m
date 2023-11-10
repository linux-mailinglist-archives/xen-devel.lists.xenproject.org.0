Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAAB7E7B24
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 11:02:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630079.982766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1OKu-0000ge-Qg; Fri, 10 Nov 2023 10:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630079.982766; Fri, 10 Nov 2023 10:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1OKu-0000dR-Nn; Fri, 10 Nov 2023 10:02:00 +0000
Received: by outflank-mailman (input) for mailman id 630079;
 Fri, 10 Nov 2023 10:01:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCxK=GX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r1OKs-0000dL-SB
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 10:01:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d50d11c-7fb0-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 11:01:55 +0100 (CET)
Received: from DM5PR07CA0092.namprd07.prod.outlook.com (2603:10b6:4:ae::21) by
 BN9PR12MB5365.namprd12.prod.outlook.com (2603:10b6:408:102::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Fri, 10 Nov
 2023 10:01:51 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:4:ae:cafe::de) by DM5PR07CA0092.outlook.office365.com
 (2603:10b6:4:ae::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Fri, 10 Nov 2023 10:01:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 10:01:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 04:01:49 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 04:01:49 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Fri, 10 Nov 2023 04:01:48 -0600
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
X-Inumbo-ID: 2d50d11c-7fb0-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHYFeSL0SqNMzcF//bYsfLknWblXDto5DD9zeCiqY4OUF+GElSTUXot/dzh1JPBl6lkNMJPaUxMH5aQa3cPn2jUKgEFFlBtdELYATk0xa4vhv6Tyt7y3FdSJREz64tabtAsbvCeDRIsfiswd7f/Fm3lTXg7uH42fDTyuhhrC9PZYGvwpPW48/L4Xh/6vn7RqrLO1LztTvVyR4Rv/Db3CzdDdBHUhEcLo+G/zFxvJ0x+MZx3lnQR2FHAgwV1Q0X6y7QXgCmm5ZMnahNSPatCQNNNu/3ANzW96kLubp+4CqQwW0RCiQo7mm5+nI12S88aEp9+PJSzWURbkW21nfeE3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKMb+/GHSauPkQE56Z/DBjl7z7+8qs1QJMXMrPO8YVc=;
 b=kyRLBQ57HKjtM+IG0g35Wf3ZvyqDep7/KWEyGzM+14YkAhE3ZxxpgNvXWmScKcDCVa7L+DgJzwvRvocpze5j/OGZoHZXtWRQnAF+CHqZmIHYJ1iIf9aWtOKQ5Yk5cMM0VqPbVEG2iy2BKLEClWuB8XqWOznZn+yGYmEwIbFxa8lPic1HuG5QNg1dnbVZlwdnvmvz08O+3fF8LsD0Uy5V1sIddZf+8tPck1Wd6UKlpHRRKvW58H9q72Whrq89igaGNTD5T/v9TA38qL94BOAhfRJQkArWJZ4hJNd0JM4sIazYC0p5FxfV7wgHe3t29Df/3LtDG+Ghevrm/oWMGoEZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKMb+/GHSauPkQE56Z/DBjl7z7+8qs1QJMXMrPO8YVc=;
 b=VmiiOyqlhuLHK59NuYR1S02iW10rX7AuvV50W4pzhlXjCjJ8kTFZw/ye8K6ChMypeIUA/7AJADDXnh1iJ7/63AyzZlBFsB+778UGJVkRUqilEwByaFoJi7l809vaMSyBEdRsUovfGTtNPkPheUmAa+hWrtim5tyv3cg03iHo/Wg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <dbab3224-a15b-41b4-9a1f-bef4222f3a9d@amd.com>
Date: Fri, 10 Nov 2023 11:01:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Use hex for bitstream_size as expected by u-boot
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <viryaos-discuss@lists.sourceforge.net>
CC: <xen-devel@lists.xenproject.org>, <brian@woods.art>
References: <alpine.DEB.2.22.394.2311091740490.3478774@ubuntu-linux-20-04-desktop>
 <329849be-f2c1-4ca6-8b97-b288d163aeb1@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <329849be-f2c1-4ca6-8b97-b288d163aeb1@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|BN9PR12MB5365:EE_
X-MS-Office365-Filtering-Correlation-Id: 55828b9e-02d2-46b0-52d7-08dbe1d40ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+B78CcAmUcXca/+1pdVbdNUUTeLrpryyrz6qpe6I0rHY+EY7FIAnMsaKnb/Qa1evAEOEJwU5udcCaJ7+QIV1cyPF+pvIs0wXyjqogV2H4GrqxMm8+CLdFuRL7fu1XzyC7RdTytV5NHKJs4PwUaz6gdQnflLoGZVrB0++2I2LBi4Vj7JWx5lEPvLvEtyxzWA6wninZjOvj2Yc1IEJ+Zh1c0huIGty53cVaL+ugNRqm8kwdrZCUgRI5bsENxu26Z+edcO9cqqw205RJhavWZbCVNSEQw0F2Vz1NcsuWp1c93AsIkrWr9SRjY6DaHI+DkRbgJw33oXtyhbSKviSKrU5LN1kxWKKHbniYqy/yR0B817Xs1OZvoc/f4VZLkFw1uabz311J1Z5qJ/D6isNDP2cXFnWBES70xrCnSUyFTXkEY/t9awkUUxnG3t77MdQbFRQfrfTkoNXBS+V1CVen9/szbgBZqBfLTwzH5K+wSyCI3igvDheA2rBjhqV6J4/FSRTA39i3rMqpn2ZJ0kUGVLgh2OEcG1msIFbmXtN3IKoRnoZ6XfkWZD5jN8AQ0f75jcl4pGUsh1c/qeV+gpSMWX5bGW5B2AT2VxWlheYKc3yDsVRt033wpLcUZMOr5xaBLFD0LbP1XgDf2X6IXg1cgridodYdNhvNO4zxDpvZ5OzT9IdT6J0FIjobo/mbiVr2XZDks4PzuKS/tyjKDT17ue4j6eweDzv0B7SUwwh+q5DDps8KwmFZlEvw9fWGZmr2njpsAxhPyF1BElrDPg09RDFP8qpGeW9ogught0tzzkjKuM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(82310400011)(451199024)(186009)(64100799003)(1800799009)(46966006)(40470700004)(36840700001)(8936002)(83380400001)(4326008)(8676002)(966005)(426003)(31686004)(2616005)(53546011)(316002)(47076005)(110136005)(26005)(70586007)(44832011)(54906003)(16576012)(70206006)(336012)(478600001)(40480700001)(36860700001)(5660300002)(41300700001)(40460700003)(81166007)(356005)(82740400003)(2906002)(86362001)(36756003)(31696002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 10:01:50.2223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55828b9e-02d2-46b0-52d7-08dbe1d40ef0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5365

Hi Julien,

On 10/11/2023 10:27, Julien Grall wrote:
> 
> 
> Hi Stefano,
> 
> On 10/11/2023 01:44, Stefano Stabellini wrote:
>> Reported-by: Brian Woods <brian@woods.art>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index b284887..6e52da5 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -790,7 +790,7 @@ bitstream_load_and_config()
>>           check_file_type "$BITSTREAM" "BIT data"
>>           bitstream_addr=$memaddr
>>           load_file $BITSTREAM "fpga_bitstream"
>> -        bitstream_size=$filesize
>> +        bitstream_size=`printf "0x%X\n" $filesize`
> 
> Looking at [1], there is no indication that the size parameter for "fpga
> load" should be hexadecimal. At the contrary, all the example I have
> found seems to use $filesize.
U-boot expects size to be passed in hex format. You can see it here:
https://github.com/u-boot/u-boot/blob/master/cmd/fpga.c#L60C20-L60C27

Also, AFAICT $filesize var that gets updated after image load (e.g. tftpb) is in hex format.

~Michal

