Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE873F621
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 09:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555892.868071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3VF-0007aS-5f; Tue, 27 Jun 2023 07:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555892.868071; Tue, 27 Jun 2023 07:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3VF-0007Y3-2A; Tue, 27 Jun 2023 07:52:45 +0000
Received: by outflank-mailman (input) for mailman id 555892;
 Tue, 27 Jun 2023 07:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vDKW=CP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qE3VE-0007Xx-36
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 07:52:44 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e89::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97d74929-14bf-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 09:52:42 +0200 (CEST)
Received: from MW3PR06CA0014.namprd06.prod.outlook.com (2603:10b6:303:2a::19)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Tue, 27 Jun
 2023 07:52:39 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::32) by MW3PR06CA0014.outlook.office365.com
 (2603:10b6:303:2a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.34 via Frontend
 Transport; Tue, 27 Jun 2023 07:52:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Tue, 27 Jun 2023 07:52:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 27 Jun
 2023 02:52:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 27 Jun
 2023 02:52:25 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 27 Jun 2023 02:52:23 -0500
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
X-Inumbo-ID: 97d74929-14bf-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP5g1+25gVgodSWutKnkomO/ZWKDnpaNoivl+YSx1xPVXeiEpMfUJSk5lf5qCTRKzdDdwbp7N6+pCtoF803HoAdwANjcINr9Ka8VBOY3ljOKlJJdBZKBrrfPHMfTYrQvOFkovSu14Bc8451nQKHIF4DZ0nhYUO+MZIFlJ4N0DiD/Bhm/aCTpeKuQ1cmr2wUzr7XO3bsmgDp90GGx+zr5FuC9SKRtnLek9ppJbAELDrGZKNYH3paJgfMkwFgtBQQugLeYHU2xpIfA+ax1SWeLmez4p9S79VTANM9cPDONyy9o5BR7VEbNWPnChPvzi1V1EdPi7rP1ejBFaRqm7exC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqXPWbi9gCNFb/0cjUi0Lw/8NKO/jfoYhBLXew9oV6s=;
 b=hHIKfusgAy3iJB6LboKBxbXCl+3SKotZZPEmsXaav1TKNvW/dPEBOhB47fKYVfMbazrJRNrkzu3LMGpHOlZmYQmhYZiBcdaVR8GvUG6fcNeP8KfEj08tgV640xz2eLz4K/U94eJqHqOJxDWFXkDJPHlPuy6dVh4DL81ujh2WywdGTj5DrjagmBei+myNOwG0uY4swHhCL+SP0yL8Te08xFqROXy1NCT9a+BehyARiply+I/YyJzSbmE/2sdNFE3Hbl6p9SHlydbtMcxLmfO2gFAsWsL/8H1xlEJRJDmZIFrSFBSDG8AT+gXPh2KN81+gneDzyCNhIKS/REREqdbR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqXPWbi9gCNFb/0cjUi0Lw/8NKO/jfoYhBLXew9oV6s=;
 b=LxykMGJui/p5soC4e3+PXJ+fzqZvAMe0z3x4qVTUWuWiAkXGCpXhF03f6N9WRYqbfZncvNkxgmGoRSkEDJCxbE7qhEsIysredgs1mfuE7u3ziJdV/4eErRFgrP8Au7cE8T7EK4ntPT2Wal2KvWX/znPr+GSCHj2enqF4gdxoeXI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <487bf03d-3c11-e5b1-74d9-7c9ae9d57521@amd.com>
Date: Tue, 27 Jun 2023 09:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/9] xen/arm64: entry: Don't jump outside of an
 alternative
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-7-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230625204907.57291-7-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT014:EE_|CY5PR12MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 54509b5f-1490-4ccd-531a-08db76e37a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KKsS/uw3p0zTUAME2WbNfZVMdI9p3hMtJUa8bzkzhNa0v7djMJuVOKzJUD2PYW9K4hMqrfU0U+eycxPj0mLyfpnK4n06AWoX1Tipb88DSAJic70OATXsb+wwOydwMQTWxRdMQf5xOX/nDdzaCetamt9L3NrbAVYc9Y34y1ltZyhZ37EpkhPoHmKndO40E7AhG43l2ycAKOad2YzltuKp5JC3GBDWSlzXzU2MAbPq7coVkeuknCWEWGSCrl3I8FZj5w0x6WbFVrYH2gyGxvg8gwyYtGaMFUqzJBZN/jtEQg1f+qYlzq4hOQZWIriT4GW9bgLYbgzzKjw+Rv2zeTbwW3U+k2T//vQCYKDVobObfXJJTB/jEgLVZoB1A7MCSw8aQ1VNykRcmmn7VhiookRIMzMgLHzmgkefH1lKcyOx7GI99kcljwjOLcdD17+GomltCHDNVmLgB3147s4LmDX861O+Jbc+az1klAiCv0d4P9WPpw1JXMXIxG2fu8QqPC9I9drUh+LSGPmX0pCPimwli87C+ZNba+KHyM57OtFLdIqNih2+a6abYueVOLVqMyZEHXUxz53BtcwOyIE9q2L56EYFmT0/Qy26TkzM1Hboiy+x8LgpkjGX1LSqmSej1SMXez4BWqIafOKVqLMY6OLBK0bcbwYqMolKF5V9JpoHMtMwyiOv+z9eEDWQF/gAQ68gzPZDl7QqRltfXFxU/MdtLHHHiG1HAxEHxA0+Cc3+HT8KEPAnZiVcCuqoQMJzM/2HL11viw85nuPSDCn5ZEeEfTRbOfPL8ad8LySB7XjzCQQiCEuEilwZy0UOWY8S5fw4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(31686004)(41300700001)(82310400005)(36860700001)(26005)(86362001)(40460700003)(36756003)(70206006)(356005)(5660300002)(44832011)(316002)(4326008)(8936002)(8676002)(81166007)(40480700001)(31696002)(70586007)(53546011)(82740400003)(47076005)(186003)(2906002)(478600001)(336012)(2616005)(16576012)(83380400001)(110136005)(426003)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 07:52:38.3207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54509b5f-1490-4ccd-531a-08db76e37a52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035



On 25/06/2023 22:49, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> The instruction CBNZ can only jump to a pc-relative that is in the
> range +/- 1MB.
> 
> Alternative instructions replacement are living in a separate
> subsection of the init section. This is usually placed towards
> the end of the linker. Whereas text is towards the beginning.
> 
> While today Xen is quite small (~1MB), it could grow up to
> 2MB in the current setup. So there is no guarantee that the
> target address in the text section will be within the range +/-
> 1MB of the CBNZ in alternative section.
> 
> The easiest solution is to have the target address within the
> same section of the alternative. This means that we need to
> duplicate a couple of instructions.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
> I couldn't come up with a solution that would not change the number
> of instructions executed in the entry path.
It looks like the max offset is indeed 1MB for conditional branches and I cannot
think of any better way of doing this, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

> ---
>  xen/arch/arm/arm64/entry.S | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index 95f1a9268419..492591fdef54 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -242,13 +242,24 @@
>          msr     daifclr, \iflags
>          bl      enter_hypervisor_from_guest
> 
> +        /*
> +         * CBNZ can only address an offset of +/- 1MB. This means, it is
> +         * not possible to jump outside of an alternative because
> +         * the .text section and .altinstr_replacement may be further
> +         * appart. The easiest way is to duplicate the few instructions
s/appart/apart

~Michal

