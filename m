Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7388772A010
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 18:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546212.852910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7es7-0004jv-K5; Fri, 09 Jun 2023 16:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546212.852910; Fri, 09 Jun 2023 16:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7es7-0004ga-HE; Fri, 09 Jun 2023 16:21:55 +0000
Received: by outflank-mailman (input) for mailman id 546212;
 Fri, 09 Jun 2023 16:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h0cG=B5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q7es5-0004gO-Ru
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 16:21:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd23c378-06e1-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 18:21:52 +0200 (CEST)
Received: from MW4PR04CA0189.namprd04.prod.outlook.com (2603:10b6:303:86::14)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 16:21:48 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:86:cafe::66) by MW4PR04CA0189.outlook.office365.com
 (2603:10b6:303:86::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.27 via Frontend
 Transport; Fri, 9 Jun 2023 16:21:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.0 via Frontend Transport; Fri, 9 Jun 2023 16:21:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 11:21:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 11:21:46 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 9 Jun 2023 11:21:45 -0500
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
X-Inumbo-ID: bd23c378-06e1-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BI0qkqp3UPglu5VakniH1Cp5PtKPjsFM0YxpWCi3dNlmHro2dvZs99670urfTV/Go/qVEzvZvm2v18eD4xr3PPqpV3Dj5xVlK8+yH7RjAikg7KP2u/qQzzGiKX1j9J26Re03VQgqS44L5B2dCtsn/JblVMHsQ3Qutvcs5Ug1wISR6ZN0/i12Mwb4o1PR9x82fbdysQZm8cPR1Vp7uUMH83UszvDOFSkl2A/EQ9MLtdVK8xm9Jy6E1xBxwp/5Vzssimke1iEnGjcnkVF/AFcCBNaRETwym4ilp9YN1sTSZThfsR+bw+sWPqy9e5c7sDKsd6lund4l2O2NviMkl2xXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMXJzclzwmtePPxoLNGkq/Rld4HKgylg+yA34roB5Wk=;
 b=h8iTQVBpVo88LDLrdekPQ4Bf6zyqErZ5QlA6qBQ8XdO9mK3E5wc3vSIT2Q6KcMfq+Fwvgx52nBxcTXVu69Azw7HiVJy/hZVAfnDF6ryROBdSdAWrQAyAMEfymV5N4JML0YT7ryQayI4tno3SOcVSJKmP0mIxajn4QNd0GBq8wh8aQ1Qwp6DJispE89UBQDA3BmosTL4ExiYWquFDrc8FdAJt1usExOH21BryYj/ZXnBnWTjG2FXR76bDtmrqWbgl+vVaa/uyDFrAcVl/VpPzQ4A9VqgniP/rJxb9LkwI3rrFB9C610+6dIwd5mN9VdJOchDNvOa5u+03IChcFuM9LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMXJzclzwmtePPxoLNGkq/Rld4HKgylg+yA34roB5Wk=;
 b=JHajrNanMoDbWIAz8taY294PVuyi8fPzqK5gIAcpDoHA6bAlSNvfnmOZtqKsdjX9vYryGWLfU4qCjCtx4eUBCOV/MGffFLjrBGNFVlHcUxb/PpUgMKgJurUJJJ24tQ/6eM04MieNggcSTDbGS0ISwZO3O0WE6LKTJ+D1vSqQDdA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2dcb05a1-d408-e9f3-1108-a155dc3312ff@amd.com>
Date: Fri, 9 Jun 2023 18:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] CI: Add Ocaml to the alpine containers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20230609160244.2638438-1-andrew.cooper3@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230609160244.2638438-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6c0755-6bea-4b6b-b43d-08db69059fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AekhKunJraBAGWaxuMBAa5rscWwk1/coRhR69D1DZh4Cy2TX6ZONYWzAQz9ArXfZtY+wQ4Bx1Do8mICRxxt0EGBJO5Ivm9Eiyjnlbpf2kP34OhpK9H0VwJWYbXbdp7I/yRRPZCkEbggBfQiY9qZw40NoS70JnvCTOwDhNwn5aA+eCvIjguC2IchRFiQRQEyIWv4yMkp7QtA94GQpAC7lol70cFyVWVDpYFuYTYIegyjFJ0K4njG03IuFRielLm3Rv2mEyfltCXUYE3YTPh7q2H5Kdb1adU/51IhfYNwOiHn6BGtOsGQfPzj9VK/GsHWAit3fymXxWlspkwg+ZiNoPxj4e3D42kyDYi/ocORl9UJPPxBqxRkXwE8hAhJzskaaXIC6QMJgKMfOQGgnlIk7U4vTBO3aXm2gItuIPwj5aKTP3qKMWkFzDQk+nbOvS/lnwDpldgd+5P6xvV3mct4PO2/8BrqLt6bajoWQEgFolQkV9z+/a+7yndTBqjg6pxGvER8CP4sRFHVNqtXU0K4yha6FMx/YygfLOilHraQarEVtnWAwl/T6ayeOPf3NTiCUFndAh7vc3S6rxHZbrlNNQF+p4fCpz1AWrXbp7gOvtmppB4r38RnHG3ZVNTaXctCSKbHwAf5qLTqMZvY3m4WDKDw7s6SGeBh7F/e6kf2Xdu3fFnIyHk3V3xqOxiR3CiIiPEzsxRjl4E3N+Gsxj8fjejypxN+d6LDQeZN/edAOoNZFIS3G5J5EWO1dPKFT2ZunL489IeDURvpoc2QTI65CNHMiqyfNH0EOGkKoddseGVU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(83380400001)(40460700003)(336012)(47076005)(426003)(2906002)(2616005)(36860700001)(36756003)(86362001)(31696002)(82310400005)(356005)(82740400003)(81166007)(40480700001)(316002)(41300700001)(966005)(5660300002)(8936002)(186003)(8676002)(110136005)(16576012)(478600001)(54906003)(31686004)(70586007)(70206006)(4326008)(53546011)(26005)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 16:21:47.6758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6c0755-6bea-4b6b-b43d-08db69059fb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081


On 09/06/2023 18:02, Andrew Cooper wrote:
> 
> 
> This gets more coverage of optional parts of the build, and makes it easier to
> trial Ocaml related changes in the smoke tests.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> 
> Hacked up manually to fix the Ocaml bindings for arm64:
> 
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/895162017
> 
> but this aspect should be done irrespective.
> ---
>  automation/build/alpine/3.12-arm64v8.dockerfile | 2 ++
>  automation/build/alpine/3.12.dockerfile         | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
> index 3f1e6a3fc6df..1be3bf780509 100644
> --- a/automation/build/alpine/3.12-arm64v8.dockerfile
> +++ b/automation/build/alpine/3.12-arm64v8.dockerfile
> @@ -28,6 +28,8 @@ RUN apk --no-cache add \
>    make \
>    musl-dev  \
>    ncurses-dev \
> +  ocaml \
> +  ocaml-findlib \
I can see that in your CI pipeline, this package is missing. Is it then necessary to be added?
Asking just out of curiosity because other containers have it installed too.

Apart from that, I can confirm that containers can be built without issues, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

