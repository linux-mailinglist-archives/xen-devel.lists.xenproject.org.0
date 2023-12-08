Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87709809EAB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 09:57:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650438.1015955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWg3-0002C7-FX; Fri, 08 Dec 2023 08:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650438.1015955; Fri, 08 Dec 2023 08:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWg3-000293-BA; Fri, 08 Dec 2023 08:57:43 +0000
Received: by outflank-mailman (input) for mailman id 650438;
 Fri, 08 Dec 2023 08:57:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8K7=HT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBWg1-0001qG-LO
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 08:57:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d679bfe5-95a7-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 09:57:39 +0100 (CET)
Received: from DS7PR03CA0012.namprd03.prod.outlook.com (2603:10b6:5:3b8::17)
 by MW6PR12MB7086.namprd12.prod.outlook.com (2603:10b6:303:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 08:57:35 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::e1) by DS7PR03CA0012.outlook.office365.com
 (2603:10b6:5:3b8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28 via Frontend
 Transport; Fri, 8 Dec 2023 08:57:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 08:57:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 02:57:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 02:57:34 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 8 Dec 2023 02:57:32 -0600
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
X-Inumbo-ID: d679bfe5-95a7-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcrhrAY7FtHbANvi7c1WdRJuqgvPmLai31B9abFDSECwMiBlKHZHaiKPW9U9XQyCBiqoQjjJEB0NU0pv9eL7USExWMvz2IJAXXyFTKYg9Y6gd8RjSM+dPHpcp2iDnxCy2qrzmLilYYsfW+AhTSWRK+Wo6K1fxovq9jKVzKSQTBSqh9AQ9IZnOdHOiQULgSGy8WbWilLVd4Seh1yzuGwc8xLRzDcaWNVm2h7/1YVVcRBxCBcZeuMUFHxdL9hjaLSwQqmT4r5D21ysHct02vBHu1r3ViH5nIFVsfIWPPnPVqSfCyO2kdJsP1tAuojNNw+CtFsdXGO77oCjOxpBdqsWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XN12JkQGBwSaOfSvP9mZi0zL+J7NZwkhkTthFK1VfDw=;
 b=CWoJcjBWuVMFH8UW50O73dGVqMZXFGzTdQKR7JA3B57RR+Wh0C5uEyQ4EuHpgU/mP4hhv19NQq0Y4CwITzfPcZY72368mv+73MWzTlHpv0q9kSjJdcgRC6OriWnsNetekWGjQRv64vvQrAIkqWJKhMS/HB6u7gg5xiFV0RxQ8TFI/2U5A4ftPVWyslYHGiIWXMZOGHxbNVpYcZt1tx5TMxvOYfvL1fTQSFsGPm+H6syFdjSJ/6m7c5h2ufMZSqXXKFtieLBx91xfzCCng/Rv2Zh5o0gRO9KXgPgE+ic/vYsm8emKTEC7eZb9SzO8xOT4pE/6uuSRswKwttlXap37bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XN12JkQGBwSaOfSvP9mZi0zL+J7NZwkhkTthFK1VfDw=;
 b=rjSLVMsmsSPGrGW2Yxyayusi7nK1oFyVHqXpijao3JDcJSPoPex2TuDfecLzhfIBAbG6RGwQkmKtBJxNS1xCMirBlrQLBIi2MVE/0Y7Z08LwveP5A61H55AXvQitVghIXl7aB898O2b4CCO8W4ba2cR8SOcwLHfvUd+OHFB3lVM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
Date: Fri, 8 Dec 2023 09:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-4-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231208054637.1973424-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|MW6PR12MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6db9da-e341-42ec-916a-08dbf7cbb8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n8ggWu/iAkRveh+PBbC4QR1eAb6PnfjM6iWfdorPfM0BZvLsgCMJOay8VxCYayaE5Y07uEHVkL/uRWLGtntdt57lz9bcN+eI+x2+zFNXCpjy4M4dEaIN+J1vPCugR9q4503GLJT9zjNl/pibv++QgyY2Tr5Eg8iIbTNzZndqpBAlQ7rtYVmARyMuLqn9xVguKYtyg3m1W87KkdX3Bvl250Iho8JqfSK2l1uX8QmvjAHENPItMlSrPBxmo2/7LHXx5UacDG4M6aPfl5WycbH1EQI/fqYLi+xqSr1pAqJ+KKU3/0s62ZYQmrBikWBTkrdP1bfgabfgKgry+hye2L/JKlioh0gvHmOgVxcIWdCoN6EiS/UQDsv1Scwe6Zg3JGUpEGiZpdfPxcnJix1dfz+jx7XudiQ4WBmED3V8NUBIdG5jMfh3IllNO6vWg1M4Ja+4JtwtT7oyYmj5bJtzIpSAgoYl3HJtCGjQsGZajDkEaL/PD8+gVu3mSHPsUiJ8CfhxmJB8c1dR+gWIF+5Z9h8myteRSe0nO0QsYXZWikaTtI8fdELUBI7t/nWG2CpNVcymDZHAOCCL4cJnytGEC1cTtUa0XfWlc9zj2Q9ykylDgAAfeGcfrr+c1vnsQ2+Dh/ClNGSKpVFc8oKOiT2G3rvm5Zh3cO/MSxDmLILoAgVTEZGwaONKagesx5Rzq+IbJOZqCoz6bDZyfKX21SCFSgCmBYyM4TjkuNIpqPdfq0KOUERGKSyv+UdOBPd/X3fNvDWTCKfdKYr+IMsCpCuo/6atimcqxtKrxRiKxjKM2m4/5qEtXwHzggHzUCqcs0s2q4MN
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(40470700004)(36840700001)(46966006)(82740400003)(110136005)(54906003)(16576012)(31686004)(478600001)(6666004)(316002)(36860700001)(70206006)(70586007)(44832011)(356005)(8936002)(26005)(86362001)(336012)(83380400001)(4326008)(426003)(81166007)(53546011)(40460700003)(8676002)(40480700001)(47076005)(31696002)(2616005)(5660300002)(2906002)(36756003)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 08:57:35.1080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6db9da-e341-42ec-916a-08dbf7cbb8ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7086

Hi Henry,

On 08/12/2023 06:46, Henry Wang wrote:
> 
> 
> To interact with the FVP (for example entering the U-Boot shell
> and transferring the files by TFTP), we need to connect the
> corresponding port by the telnet first. Use an expect script to
> simplify the automation of the whole "interacting with FVP" stuff.
> 
> The expect script will firstly detect the IP of the host, then
> connect to the telnet port of the FVP, set the `serverip` and `ipaddr`
> for the TFTP service in the U-Boot shell, and finally boot Xen from
> U-Boot and wait for the expected results by Xen, Dom0 and DomU.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with 1 question...

> ---
> v2:
> - No change.
> ---
>  .../expect/fvp-base-smoke-dom0-arm64.exp      | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100755 automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
> 
> diff --git a/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
> new file mode 100755
> index 0000000000..25d9a5f81c
> --- /dev/null
> +++ b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
> @@ -0,0 +1,73 @@
> +#!/usr/bin/expect
> +
> +set timeout 2000
Do we really need such a big timeout (~30 min)?
Looking at your test job, it took 16 mins (quite a lot but I know FVP is slow
+ send_slow slows things down)

~Michal


