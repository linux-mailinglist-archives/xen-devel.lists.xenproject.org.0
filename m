Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D160F6E3D49
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 03:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521706.810497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poE6R-0003Tu-Rk; Mon, 17 Apr 2023 01:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521706.810497; Mon, 17 Apr 2023 01:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poE6R-0003R6-Lr; Mon, 17 Apr 2023 01:56:23 +0000
Received: by outflank-mailman (input) for mailman id 521706;
 Mon, 17 Apr 2023 01:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nDUx=AI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1poE6P-0003R0-Ed
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 01:56:21 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09258ca3-dcc3-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 03:56:18 +0200 (CEST)
Received: from DM6PR02CA0129.namprd02.prod.outlook.com (2603:10b6:5:1b4::31)
 by CH2PR12MB5001.namprd12.prod.outlook.com (2603:10b6:610:61::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 01:56:12 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::57) by DM6PR02CA0129.outlook.office365.com
 (2603:10b6:5:1b4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 01:56:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.19 via Frontend Transport; Mon, 17 Apr 2023 01:56:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 16 Apr
 2023 20:56:11 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 16 Apr 2023 20:56:09 -0500
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
X-Inumbo-ID: 09258ca3-dcc3-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6h8uEcyrXaSqE7NLvJr78YzvVRWmVlDte/7ccNjxlmZIi4zOJSsYW05cTG1rwhlyGqFKbRpa/laPwOxR3J2iT5Elo/oQfq6qfX7rGdi/Xgdlg0eD39hn68Dw2jbioI+o/Mi/g2dv3aL0dMM3ptUJREOZLSsQyn9QxTwh4uch8nc9zaJTNPi9Iu+Lbz6asar9NIGPSwUMD2stGujzledz0+vgddT4SugiT0OFE379H8ZWnXfmv9NMaCBbyq4Bue3sYkZXKJcGkovyczB1l1VoQDOld4jclSNJXrfkVty9cDxD6/mgMxwIeXji6Yc5YjhPp5NbUCLnNHSgNKxewwhbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWdT4+fYncLA3IivelBA4rg96u9zi5g/rldo/VCvoS8=;
 b=CtAdh902PevljIBMiwW1+G6V9zcYzG/7//Whp8/tnUexP8TgUj8I4We9MR+cpRNqHSIQULzC50NVaUU/wpvsFpqaMnKe4g/PPIBrmzGVUztxwTZt6XafLzQZB8hj7//Jas1Lx676tXv5niWmmILtizB1121NSf3Lv+qbPVww9T6ITwt305ra4YEuQRDdJaa9D4yG83MQX1A3fyzwlsGCv7Eh+4n7V1G2Qh3lyaNcPwS+i83usbjlPbQJ21Lq9Rdd1qIQXB0yQEr84JW0pW2QSlyzFKtQEHc0/OrDGQjOK4vqfg0KGIzqYdV98EPI40RSuEzJ+svP4Sucg3NHRoNFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWdT4+fYncLA3IivelBA4rg96u9zi5g/rldo/VCvoS8=;
 b=1RZ7TW1r1dwONAwI1GDBpvCmtBaOt7MJSHhwOzEiZzbdscdkxpX4a8crjMOmXzcev0vBOB4rUaLxcQpa6/MCMXoIzIB1zdH7qLzumZsXIZygPjqzFim7ciVI7F/J2sAsbbbio+wxkA+njDcwSNxDlwwSPFumJNhHTd6v26dRCks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <cb28fbd8-8fbc-4f71-f1f6-6d5c2a5f2c46@amd.com>
Date: Sun, 16 Apr 2023 21:56:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] xen/arm: mark __guest_cmpxchg always_inline
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
 <20230414185714.292881-2-stewart.hildebrand@amd.com>
 <bed2fc02-6b6a-aecc-e279-e7ea3ddffe7e@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <bed2fc02-6b6a-aecc-e279-e7ea3ddffe7e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT061:EE_|CH2PR12MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0ad564-9830-4d47-4094-08db3ee6eb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6exLxPMaOSLYgnbX9/0LAHL/6pBRon9n+8ay1b9iqfsfss2Gw8RZAfx8xvOZPpazO9pvmCSzCMrMKeNhlGMmxy49Dqe3XT9cN/1Zu8IocfgW29SLVqHnt4e4wDtdnENSIZgj7+jjQ9Hv18O8pPw49wZIoKLCmIo24EaT/WxFGwWMokGhZEg4idjbZgOkwSqcOmTV8gG2wgNhAcWu8ZsBC9kE5zNu1wMOo9yUWKKKoX/4l2VPc500Ax/8ksHc25HGvFDJjKwm/BMQn58FsC0ilY91yhgEzGM5DtUDm8LK8463sOgw4QeGcpPecmuSA4Jk5YuX0w8bq4Gce0x1EpZqqujurauAjQYyOtk87qcBzKmxGw66ODCUSqJRu6NypIVVVpevWe8OOm4gSGUB6kInKA7n2lZF4d6Kc64QtV5C5uI+UnmWmkturnxrSK9HLl0vjVUY2woLe/Oick+OCCv+V10lPhXrSBkeYCg1bd+5Y0Quf6A2psNGDg9blJaN9Fdu7fgfN6BmIsbpqfIlfKz1RY/4g3i1oaSRE60FaDWBv7dAgfWxyaL0v/wjIQ5Uof3SRZmRYZFEyLoIKigVTCYDnJJBAaapgfkWa+9ZSd7Q1gG4F5zFS9+NjahQ4flA0Iap03SadEG2dQwybYu0XW2OCrsMmNy5csJHa8IFtdjl+jEs+huAdOcnyR5XE9AalN5mUV3pCGA1Ea9txhEMB2FjRbAuISY5pr5wi2JRBnv5kLEVp3cZB7gPL2gjs10B+s9bcOzc3nhHoX4Z4B7gg0PaJA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(44832011)(40460700003)(82310400005)(2906002)(5660300002)(8936002)(8676002)(356005)(41300700001)(81166007)(40480700001)(86362001)(31696002)(31686004)(478600001)(54906003)(2616005)(110136005)(16576012)(36860700001)(26005)(53546011)(186003)(336012)(4326008)(426003)(70206006)(70586007)(82740400003)(316002)(47076005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 01:56:11.8168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0ad564-9830-4d47-4094-08db3ee6eb96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5001

On 4/16/23 08:50, Julien Grall wrote:
> Hi Stewart,
> 
> On 14/04/2023 19:57, Stewart Hildebrand wrote:
>> When building the hypervisor with -Og, we run into a __bad_cmpxchg link error:
>>
>> aarch64-none-linux-gnu-ld: prelink.o: in function `__int_cmpxchg':
>> .../xen/./arch/arm/include/asm/arm64/cmpxchg.h:117: undefined reference to `__bad_cmpxchg'
>> aarch64-none-linux-gnu-ld: .../xen/./arch/arm/include/asm/arm64/cmpxchg.h:117: undefined reference to `__bad_cmpxchg'
>> aarch64-none-linux-gnu-ld: ./.xen-syms.0: hidden symbol `__bad_cmpxchg' isn't defined
>> aarch64-none-linux-gnu-ld: final link failed: bad value
>>
>> This is due to the function __guest_cmpxchg not being inlined in the -Og build
>> with gcc 12. Fix this by marking __guest_cmpxchg always_inline.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com
>> ---
>> I considered also changing "guest_cmpxchg64" just below in the same file to
>> always_inline, but I decided not to because this function does not take a size
>> parameter.
> 
> Make sense. I will fixed the signed-off-by line issue reported by Henry
> while committing:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thank you!

