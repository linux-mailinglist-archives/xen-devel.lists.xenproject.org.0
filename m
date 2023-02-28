Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42546A5787
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 12:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503248.775471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxsq-0005Sl-Jx; Tue, 28 Feb 2023 11:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503248.775471; Tue, 28 Feb 2023 11:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxsq-0005Ph-Gk; Tue, 28 Feb 2023 11:11:00 +0000
Received: by outflank-mailman (input) for mailman id 503248;
 Tue, 28 Feb 2023 11:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KG2Y=6Y=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pWxso-0005Pb-Tx
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 11:10:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e88::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 903c288c-b758-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 12:10:53 +0100 (CET)
Received: from BN0PR07CA0023.namprd07.prod.outlook.com (2603:10b6:408:141::6)
 by DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Tue, 28 Feb
 2023 11:10:50 +0000
Received: from BN8NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::c) by BN0PR07CA0023.outlook.office365.com
 (2603:10b6:408:141::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30 via Frontend
 Transport; Tue, 28 Feb 2023 11:10:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT090.mail.protection.outlook.com (10.13.177.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.17 via Frontend Transport; Tue, 28 Feb 2023 11:10:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 28 Feb
 2023 05:10:49 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 28 Feb 2023 05:10:48 -0600
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
X-Inumbo-ID: 903c288c-b758-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXLqBoG0z/uAV9TPAxFxQrNC+WenpnIBq0ay40RZmelw6Lyji2E/jBh3qDRW2Gdwiblu9tHAUOBS4KwuIi3ypi46KrifrzuUuzTkvW0ShwZmvMvWGhbzKI+O0swBVkYTPSPgTP2KfnWOdUXSQ0OcdWmzx/1/rU7tgirRqT6fOXV8f4Dyk4QE1jL+aiEZ+7IhB38OX9Rkin2qq5ya/4seyLUvj/ZPKeHSLAjSMOBQqeqJz/W/OTOOgfzf4hTIuC+eFBtabfFKbj/y57h5zwx4c/qKMTlmrG8rPd4uL8WlLlXT/Sp82Kara9TbhdRPu6UUjACRT8KQOc0b/gVGfprIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlUMh6B6jAvgKlcVcmtBYCCvYf1PJVMVHdIdhhSF/Z8=;
 b=QOQKVPoxnlAs6Tw/Z000T6ARqrle/9q8Erxg6lkpUycGyai/CVrq1L/VZhAHYWwue6LtZC94YwjOdUe32OB6erEoTvWuXvrRtBQy0O5AediJKBfoWY1TGTHxIkV/ZV4ISSp9PXB6OkVvkyTlA46apZWKUt2cN/VOtGi4K+HUi5afl1MOO3opGkk8TSenMOX8c0xLb4ylrzmiuTBHSqD1qSn0uqlPQNz4lMjts1+LK7t1QXoA5oRHvnBEhPiJ6y2UV4HSm3R/wuDThp4R/OQmrCgavwJdCVUUbkW+dwJIHfGVBqvwf1Ud5Rt+pHU7zphDrjT1inNP4LQJ+ZoRODBcyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlUMh6B6jAvgKlcVcmtBYCCvYf1PJVMVHdIdhhSF/Z8=;
 b=GWfqzAhdRD1HtPYctkPkOUhheZNQlJXCHOhbFrZqYtTsJwG8lRjoF9NBay4QQ8pzAd0UxlAozajrsjws59iawmtHzJ+wfberjOZqhidoI81rwSMe3ND21PszOs7gX9iERfBhxM9JiraqrD6Rj+EAE8MuksnulS0Yl51WUmfXZzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <15c427ed-c452-a0d7-078e-58f040dcd9b4@amd.com>
Date: Tue, 28 Feb 2023 12:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/arm: check max_init_domid validity
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <0cf2013e5e6018cae300c39fb65ed526eac5c35c.1677511937.git.bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0cf2013e5e6018cae300c39fb65ed526eac5c35c.1677511937.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT090:EE_|DM4PR12MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d9af49-0819-4426-1cad-08db197c7324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S116uJ4ooo8PaPzcZOpDq3iRMmrkEWjqSvYVKyvBAzV5oN+AZvUvS2MLBRtc20h7m6K0mxPWLMg5aq8LdU73NU77uZrPScHU1mdF1kvnvP9ZKYPBX/vjQCEeRc7adxG0Zb3ymS6+FYuRekmhsAPW/pai4bPAspZdNeSKycZc2J7BR3sbvblg5NprDt4d6njxICr4XQLFvIyibOgiPsK+PbmY2aoIUY74+O2TlMgZu+USpebrOYQ/6UF0/BGFNFx69bNEw9/UWiqHNMWtH+395ElvR+r3WLGHBMvmzw8aO1vfjN1CIJ9qoontM5SvuLSowgfTjYEUw/tjjBHO41cifx88uJ/dLbZaRkGzwoF/DZuETipUl3mAo5QkVPPWIYQ6LW8DfVX9P4pMX69MaJsrn2QwCzCU0ylXDHa8y8ZS8vh2TSZ8qUw4t7fFY7+EdeTQYYN8ZN2HNq/0caiJqSkq445hDLfsce2n7ErnYiYShE+ueALLymq9XQWDBP/pjoYOnYX3zNMYp7Ck8JWjKhuk2/8zL6/sUSXtNRnQ868rH+EcI+G001A6wUrZfMUolVVyLabHOx2yVPcvoKpUbYwHq+3kfFeLEiqVqb/1I8DaPY/KObriBBB/62frqqIYU2Yc/1s44DJpfblpa4+9Ws1TDAOpYcI9ykcrxY8Ko1xvi1dvC9vVheCqCO0JhjiFf44nPsyQFayv+lLJbw41OlhOdILqmyhZn6/5VHabxkN7PzNELlQ1uI1W25YO7qQlGDYOfLvWL0INzNTT7Tmjck+1Jg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199018)(46966006)(40470700004)(36840700001)(426003)(2906002)(36860700001)(31686004)(44832011)(82310400005)(81166007)(5660300002)(8936002)(47076005)(336012)(2616005)(16576012)(356005)(86362001)(40480700001)(316002)(4326008)(53546011)(26005)(82740400003)(186003)(8676002)(41300700001)(54906003)(110136005)(478600001)(70586007)(31696002)(36756003)(70206006)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 11:10:50.0974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d9af49-0819-4426-1cad-08db197c7324
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8451

Hi Bertrand,

On 28/02/2023 09:08, Bertrand Marquis wrote:
> 
> 
> Before trying to create a dom0less guest, check that max_init_domid
> increment will generate a valid domain ID, lower than
> DOMID_FIRST_RESERVED.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index edca23b986d2..9707eb7b1bb1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3879,6 +3879,9 @@ void __init create_domUs(void)
>          if ( !dt_device_is_compatible(node, "xen,domain") )
>              continue;
> 
> +        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
> +            panic("No more domain IDs available\n");
Here are some of my thoughts:
1. The check if domid is >= DOMID_FIRST_RESERVED is used in quite a lot of
places in the Xen code. We might want to introduce a global function for that purpose
instead of repeating this check all over the codebase.

2. This check is something that could be moved to be generic. At the moment we do have
an ASSERT with is_system_domain in domain_create. I know domain_create can be called for
domids in special range so this would need to be thought through.

3. The placement of this check at the top of the function before starting to parse dt properties
might be problematic in the future if we decide to allow specifying static domids for dom0less domUs.
In a static configuration, most of the time, we do not have xenstore (either because of lack of xenstore
support or because of lack of dom0). AFAIKT, in Xen a domain can get to know its domid only through xenstore
(DOMID_SELF is not working in all the cases). Also, in a static configuration, it makes the life of an integrator
easy to know all the domids upfront to easily set up some communication, grant tables, etc.

Let me know your thoughts.

~Michal

