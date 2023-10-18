Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D67E7CDF4C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618593.962425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7Nj-0004yz-Hm; Wed, 18 Oct 2023 14:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618593.962425; Wed, 18 Oct 2023 14:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7Nj-0004w2-EP; Wed, 18 Oct 2023 14:18:43 +0000
Received: by outflank-mailman (input) for mailman id 618593;
 Wed, 18 Oct 2023 14:18:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TS4B=GA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qt7Ni-0004vw-6F
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:18:42 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b77d017-6dc1-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 16:18:39 +0200 (CEST)
Received: from CY8P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:930:6b::13)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 18 Oct
 2023 14:18:35 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:6b:cafe::bc) by CY8P222CA0008.outlook.office365.com
 (2603:10b6:930:6b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23 via Frontend
 Transport; Wed, 18 Oct 2023 14:18:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 14:18:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 09:18:33 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 09:18:32 -0500
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
X-Inumbo-ID: 3b77d017-6dc1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPfxnL5we/M5TE0XndVZWf9heS+gN3gAWKD91g9r79/qk9A6H7Z6RYzarUnIP44Male9K84+xV5xVMZxARfxuzV0poJWqw9a63BmbjWS8ypC937yKh+TT6WMO6KWaYWpDCiy0AWwZrtYk0UfKAmszVAMdCZrTBKNZoA+0iP51i3WeSBMmjSB/1QmEW4Y0flybVP/auIh8DpR50HgmF6OEbI1x/oHmCfTLuDt/3EqqDMXfMGfd/AmVnhJZR+rWV3uIvlWMcSGu3FyIFLYC89wOMtGWChKfHM6R6XSzMD93S+sjrvf8Dm2PhCv2/RHxVPYqox4/GfxufcRC/VnF/qE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pO17vVtioHFKbYGcClS0dWe5vmQ+t96ZiIvfyxUwlJs=;
 b=GhaydBR1t5nGZ4N8/EO4TXoX8MzvtCY+zCRi4c6p81ogv/LTAJgFz1Zfl9so5exV5ScfezlII/RFW0dKxQupAMKn3myhqwTwhkpg1Q0XZ5ACMHlNqovKKVpld/0ylafRBMrKW+rE6CeJenrpe3rET/OGsAUriONIw1f48gC/tlEaJpYum8FE9z6HM/jOXp5QMtQPapPPSZpmpf2uxdJxownjzqziDFwgri0+BTpIZrSd1VbQzgNGJ123IVnu42DQKJ0FPqCLQQR1KUyoZmNU1E4TtjkHFtismKayh8wRbKt1SjNEc7jPYYWcMidWIqxxdld9HEZWJ/OrqNcNUU6yEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO17vVtioHFKbYGcClS0dWe5vmQ+t96ZiIvfyxUwlJs=;
 b=I1Cvdk1B+6HkATJ9qm3PIgA6OpHVey3CbUyASRtbJ3sBr41RkqCKWkVyC3jg3OloFtLaosiaiceVxhKmBk/tw8IiWsyyeEVgLP8t7ZvRBFCBaYHawLwodWoz0fu3/HD2gqW6YiAItd9MTEkjm3JzdQmj6m7Ms9eKJOc9TFvqpvw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ea9a1990-ecf4-43fb-af5b-b3aac0c71b2b@amd.com>
Date: Wed, 18 Oct 2023 16:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18 pvshim console issue (with patch)
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
References: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
 <9f5c0af3-44b6-e98a-2032-14185af265c9@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9f5c0af3-44b6-e98a-2032-14185af265c9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f76ba6-31ce-4ec4-f26e-08dbcfe51d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZKKMAIvKm7pGsfLURwNFuPkcgwL7e3LMj4F1PgbN1VPnyz2kTSnvAjy/nXMGzYYB/jzDQ/2ZWaGhNga0NfzrEfn0pk7kalvz7zlxs5k6mIvFbKWSLCLS6gNwHSuVU5lL4V5MFkiQPxn+1s9htxZORd29vq1kLBTmrFYMqA/VYU6e2tzGSQvx3bPXDIg7V9Y6fWc+85S1m6YhdhjeZwogsppm5C1B83fyjHIYm3bThRs3bsRccPk1HKKEn/Y0xfTO2SWha7nfegktImcChpFlZm4cXwJsUMLqL1ORWtuOlcuYgwfMWUK1wfVgalxoHLYQtmmcbhtUg7wgRkB3n5DsodHisfeh/XMHzabDgH0Xj6SCoLHS0T7YeRsKY5dcVA1R8NeeM2jSUrMNOsjvvCW6DgJIwl86WikNrAHR8N/cOLNF5MiBeKs/oE/AW9u9yZdaDuem/pGPwFQjU0VX5M/j5NeoIlxiSOeYa3OKGKFhDJXtUKmSsvGUVeKOrmMOjh/P+HQ1y8hF0y3EiCt74UDtvl49O62rHa2JLqUx1CtQ0YuuVltTCBS/S/V9vmGT9qbcfoHEk98LWS4q7qgXoQeCkFyGuoTAwchW0iWuYK7/yAcbsTKoWbeIu/iERZkYsc61gHtwOv9gGEOiIMddV4KDKuz9ssD7XMfV2OaLXH/qjz/shzO25ArLuUrSEZvBg5QTpZS48/zG5k5ZVyOHP0pP2c5j6E3lakqSWwmgRGBqeiBmzSAJcelEUwRfnuO0zRzRi/uO/WRYPQbltQwuoyFv6KvCYLImybcA9PPwVuh3RqdQjMUjOq514ib8jIRKEJLv
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(186009)(82310400011)(1800799009)(451199024)(64100799003)(40470700004)(36840700001)(46966006)(16576012)(478600001)(110136005)(70206006)(70586007)(6666004)(54906003)(316002)(53546011)(336012)(426003)(26005)(2616005)(8936002)(4326008)(2906002)(8676002)(44832011)(5660300002)(36756003)(41300700001)(81166007)(31696002)(86362001)(82740400003)(47076005)(36860700001)(356005)(31686004)(40480700001)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 14:18:35.3183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f76ba6-31ce-4ec4-f26e-08dbcfe51d9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881

Hi,

On 18/10/2023 15:29, Jan Beulich wrote:
> 
> 
> On 18.10.2023 12:38, Manuel Bouyer wrote:
>> Hello,
>> With Xen 4.18, a PV domain running under pvshim doesn't get console input.
>> This is because the domain id in pvshim isn't 0 (and on x86 max_init_domid is
>> hardwired to 0), so console_input_domain() will never select that domain
>> as input.
>>
>> The attached patch fixes it by translating 0 to the real domain id for
>> pvshim, but there may be a better way to do this.
> 
> My primary observation with the patch is that it presumably won't build for
> other than x86. There are also indentation and other style issues, no S-o-b,
> and no description. But I wonder whether a different approach doesn't want
> taking: Wouldn't it help if max_init_domid was 1 in the shim case, with no
> need for any other changes?
> 
> Also Cc-ing Michal as the author of the (possibly) offending patch.
What if we set max_init_domid in pvshim case to the value returned by get_initial_domain_id()
in create_dom0()? The drawback is that we would waste some time in a loop if the value is large.

~Michal

