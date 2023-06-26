Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9A473DE4D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 13:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555467.867263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkpq-0004PC-TW; Mon, 26 Jun 2023 11:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555467.867263; Mon, 26 Jun 2023 11:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkpq-0004NG-Qk; Mon, 26 Jun 2023 11:56:46 +0000
Received: by outflank-mailman (input) for mailman id 555467;
 Mon, 26 Jun 2023 11:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tM71=CO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qDkpp-0004NA-2Q
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 11:56:45 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83278a8d-1418-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 13:56:42 +0200 (CEST)
Received: from MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::7)
 by PH0PR12MB8173.namprd12.prod.outlook.com (2603:10b6:510:296::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 11:56:38 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::55) by MW4P222CA0002.outlook.office365.com
 (2603:10b6:303:114::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.34 via Frontend
 Transport; Mon, 26 Jun 2023 11:56:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 11:56:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 06:56:36 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 06:56:34 -0500
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
X-Inumbo-ID: 83278a8d-1418-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6KBU1dYYbIECh+c2rW+J2r2ojws3o8upt6lgEakd0N5tS7LNIuRZL3vH1/OUXXSvQEv8oSMoXMTNpBMCu0vtF9g0zjlGKCNuGbJCwsuCTzNowL71v380FOjBlsMtB31W+38ByPEMbrPkNq4lH19ULLK7OwrBeDc+csf9Bw9ddXZWmmGSLVoto/MCqKWtJXX+MotmDPfVItN3w+PB5MeHQm08Tpx9/lGDQQCMMycr07+N8/xqAz5BhW1m4MJMMeoMg+8Xuf+yeomtDfGKDZbl6RBnpanD3DxtxpVYArRW2MnQ99ur7AyHJFQWc/cGsBkbiHXJf1Z9d8jFND04f3kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8clPIsIJDfgxgDxyUqxHnCDuPH9LTf+Jzd0sj2FwRw=;
 b=CJzHWXgSRkvGWIOqNq3bing4kVTkMmGi2NY8H2VJ4EjFtcaT0RPiQVVPFfMlf90B4UE08SLP//QCuhuUU4dqAG1ALbzj6vswiU+MeNxoRH5L9zxMfolYu5gE4gPFKjZcQBM2ABpCDfOQiCb/FhhE3ucXml/OPP0ln+RR/h8Sc/pNr02Z3LjYkd7ZvX9Fg8SO2O+raZXd8kWpkBfj0j/9z7QRM5lsiP77bgrRuct6iPF1BqrfiXyLfDI2OXIvIsEUsy5EbsZsYRyRWFPn8O151JYbtZMDDM0XahgAHNnoQuVQTfOp9BA+MkUS6bbORJjXHWqnJTn2isGfAXekV/iupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8clPIsIJDfgxgDxyUqxHnCDuPH9LTf+Jzd0sj2FwRw=;
 b=ECHzSDbXL3jGs1OV3LsL87kJyk8T4l0ijuyKATUK5mxIDSvI6O1S/Oz37DUXwhfSyfNMOiZ8N7sJpTyBYyAYQpUyi6ZnSGVcs298/Z8fxYDkClPxqfqDuT72jkGfTc8e7OW9TpDg0LI0FjIRnLa2Biw6XvFZFA+UfKXA0icZuyU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <804682ce-ad88-34dc-1501-c9ff6347fb8b@amd.com>
Date: Mon, 26 Jun 2023 13:56:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230625204907.57291-9-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT005:EE_|PH0PR12MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 972446aa-63bf-4009-a63d-08db763c6570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ea86I73chB2EsYBvOxWqDy5oRRyvKBpDjFMvV5L51Gx5YCB5e/HqHfW+UYosnPq5NjNVr6KJ7LQPKDwnQSMHTQ/cglhnYJoMTs2s099SXsMSUwsgMT4NP8KNlqU3uy/RBeqjqaLsxp83HR5GKyqE1mAd8qtY6pbI7RFqf9MezgsFi6XFEOESKUMGDom4ptLGAFerpwf+Ka3d1B11E6BYizT+Ecm6eW1UqnFUpLrF24JpWza5ZfJyHo0UBUiAgZusA/0XFwOhQGgYm8OeSF3uur3D9R0bmruOwymU4YU9FxesR/Dc9xipvYy7FILbclyTPocr3uMtRfUQO97uo46YLaRrZucVfmguqJokLmQXO0maMS1kFbecKMTUhkLZsY21rVUe2LCEx9DWA4Ubg3a0yduNMBnYUI3xsnSC8YN/vs5iUkz/tXWJN+WIz++8DIDotxTlOc68o9AeEZsvO1ZgpyyOBl+VJce3J03rN+M/JNHa66fCG/GqakX6H99nYFcHZyk25dnL7pisi+IIozcrmFBuGm8yNLGGMWH7RULTfEG/kHMa5J50XXoBtVgn51KH2jmLcOg2psffuHMZGwB/r461Oc7XFTzvJkn8yp/oyrnVak5CcaQS7HNl79GI5Vtmx8vQ7lANiaeBF16AehDFDS8G05lafQYfK0NafLPIjspqb1iwKxk9S6z4xu2kTzN5I75HwIv77jANsC9j9p4Y0WdTNPRmaWbVoLKk26kfcKjxkQqtja2dHEGJwjEi4Tec0cWWvd+6lsxV0xVZygiYORgFXxCA/udDg7mJicSDgSr/vgKG4N4XSw2oHHwHWoU8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(2906002)(82310400005)(81166007)(2616005)(83380400001)(356005)(426003)(26005)(47076005)(53546011)(186003)(336012)(82740400003)(36860700001)(41300700001)(40480700001)(31696002)(86362001)(16576012)(110136005)(54906003)(478600001)(70206006)(70586007)(4326008)(316002)(36756003)(5660300002)(31686004)(8936002)(8676002)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 11:56:37.3179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 972446aa-63bf-4009-a63d-08db763c6570
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8173



On 25/06/2023 22:49, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> UBSAN has been enabled a few years ago on x86 but was never
> enabled on Arm because the final binary is bigger than 2MB (
> the maximum we can currently handled).
> 
> With the recent rework, it is now possible to grow Xen over 2MB.
> So there is no more roadblock to enable Xen other than increasing
> the reserved area.
> 
> On my setup, for arm32, the final binaray was very close to 4MB.
> Furthermore, one may want to enable USBAN and GCOV which would put
> the binary well-over 4MB (both features require for some space).
> Therefore, increase the size to 8MB which should us some margin.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
> The drawback with this approach is that we are adding 6 new
> page-table (3 for boot and 3 for runtime) that are statically
> allocated. So the final Xen binary will be 24KB bigger when
> neither UBSAN nor GCOV.
> 
> If this is not considered acceptable, then we could make the
> size of configurable in the Kconfig and decide it based on the
> features enabled.
Both of these features are enabled only in a debug build of Xen, so
another option would be to increase Xen size only for a debug build.

~Michal

