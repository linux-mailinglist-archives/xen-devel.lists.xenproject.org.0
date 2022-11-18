Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6E662EE91
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 08:42:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445460.700630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovw0c-0003bC-Tb; Fri, 18 Nov 2022 07:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445460.700630; Fri, 18 Nov 2022 07:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovw0c-0003Yi-Ph; Fri, 18 Nov 2022 07:41:58 +0000
Received: by outflank-mailman (input) for mailman id 445460;
 Fri, 18 Nov 2022 07:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovw0a-0003Yc-P7
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 07:41:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7816b087-6714-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 08:41:54 +0100 (CET)
Received: from DM6PR02CA0037.namprd02.prod.outlook.com (2603:10b6:5:177::14)
 by PH7PR12MB7212.namprd12.prod.outlook.com (2603:10b6:510:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 18 Nov
 2022 07:41:51 +0000
Received: from DS1PEPF0000B074.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::db) by DM6PR02CA0037.outlook.office365.com
 (2603:10b6:5:177::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 07:41:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000B074.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.9 via Frontend Transport; Fri, 18 Nov 2022 07:41:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 01:41:47 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 23:41:45 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 18 Nov 2022 01:41:44 -0600
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
X-Inumbo-ID: 7816b087-6714-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCzZg6YHylYkQMPyV0OtXm5U+CRExY23a855H1LzhbuSDxYvpioFYLGoLZgY0RTV4Ye0N0pOTLeKeONAl3jvD6/PYX2SikRjYi/xlaXg0XqGN9/D4Ln9NYIpNx3mesGOrWYm96pZ7bW2LHxgjGDoTFwQxLEQJa9wKuR/AQbnYwwpmaJI1TKyRqJHoJhBN/jRytpDBo7SPEG3K2WCkZd4nktxuORBRHVjUxt976tPu0YVJI95Ab5oNVfkvuPH84PF+hyPM1A3N0MpTii1UVa2WSGV/fHb/eeuMreSk6PfeChm2DxUQAiV/FbPpGzDGmv7XKppOA5360O0u9c7MeIaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksGVRKNoRoyjmTJxebrKBZRAtlNnHdoeymssGWOX+W4=;
 b=UM2au9DDFm8IxBoqZT3hSvCdEZYNkZXOWDnqRYcSuWeL9OOifhsWyBtPsgrKNsgc6mwQZNk92dEoPpx4StAN14Lza1Q41Nq5NMsdZP0l5qRvYCxut02KsAV6i4+Ux00XXm9clP1cAE1dtNKSToep3wLHYpPmC7TSzNigIdxeXDEmjB/XoULp2ckDj7cxEb4PBhphTwsxVuV4EZgECL2FWOIec0uguQ5bv3vS8GQ/LClVkv9NgofohVREeD2QSmL7vOeAEvrcx6qY8AKUuqo+UEXJCqHw+hITCXDsZaQIs1CblFTcxjmNVRvrzjLFTpOQ+YoFFLFOwlEZiI3hf0YeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksGVRKNoRoyjmTJxebrKBZRAtlNnHdoeymssGWOX+W4=;
 b=e1oHUoxPtkkffJyqrpta1lLDgI5rPvoT7+nvZh8r+9sy3ZuiNNfNLXMyI2bBzW2Hc8pKjLH3mVvvg2kKU28KaGmmfVxlnU2fbBvk41UnUsfrTgo0c28eZoh80yoMACVY+hWS7aRs1AD52HHkHhSKC8UobmDlgQV1mFd7TRKQ/z8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <afb778af-398b-7bff-3af9-963395ea5f46@amd.com>
Date: Fri, 18 Nov 2022 08:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/arm: vpl011: Make access to DMACR write-ignore
To: Jiamei Xie <Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20221118020013.125987-1-jiamei.xie@arm.com>
 <AS8PR08MB76963BD3ED96EE6F5314B70992099@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB76963BD3ED96EE6F5314B70992099@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B074:EE_|PH7PR12MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 275a69fa-d243-45aa-1663-08dac93859c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g6TMJ+cEUClA9MDpm4CgfSefBuDbyMOky4ZLFQIjnxageWHnH4C/mK1qQTLVjZIF85hnMiYMEjOZwDJQtdq5F+up4xE+bVElIWc/inArR570RpHl/CKlsKuIXa7f5i6SRiMUNRe2NuDdAegP+Xl6QcSKUbev6zfEhlXnVTjL49T1wsRtZxiodryY2eZ/QL+6mFqMa54c2A+5cC6L2J2xFFbroQ2IyXEXOojxL/mkP4Oc9G2RTOtRS+mGsL/LMR4qtjKWTrhWTNx+0y1CyQO/ch6WZoHS4Hh9Kf+Zc/m1+I1IDckxrf06KEyGlcqVal/c9cA5MD7KXqWNkO1ySYgIHqC9vHeq3JkEQslfOqbxYWsEZpN7j53Q/ii5AD/ylEXjyhyg6UqAfVhtkQyynEkDpi+H9hqhmKF9mWkopGaBA7QwV8ZP1VJ/8mVGJHByKGWotfDT82jM0psyDa3Ki39OHnZ0t2+++qI+wsiYcyg+npFq0+irTgryDveC8fF88NrcMANA89CePsCtbUd1PjmKKLPjIEwpe+vXgLy2NFzvsESlWonKzn/1Iz/9cXEM2v5fzOSHGm2NTOvE4k22z6AxIvXSys/KH/nKDJ/tQYidbYEQtsUfjVSajleWx1c45Zj4IaIZWsCGFx22iDYZfNjYQ3i5WmVeZJQnezxFcGFmBfnR/6VvHEigcelDzCta3G9vI1JAo8JTpoRaB5AC86GLKkdAJQGEUcT6XgwhVEEgM2Z6DHEvNb3hqJUC3SgiLZML2L9ThfFtDN0MP1golZy/Rw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(82740400003)(36860700001)(110136005)(82310400005)(54906003)(36756003)(40480700001)(426003)(186003)(4744005)(2906002)(26005)(44832011)(31696002)(16576012)(316002)(70586007)(8676002)(5660300002)(70206006)(41300700001)(2616005)(356005)(31686004)(81166007)(4326008)(86362001)(53546011)(8936002)(40460700003)(478600001)(47076005)(336012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 07:41:48.7005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 275a69fa-d243-45aa-1663-08dac93859c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B074.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7212

Hi Jiamei,

On 18/11/2022 03:18, Jiamei Xie wrote:
> 
> 
> Hi
> 
> Sorry there is no subject in the  last email. So add in this one.
I would consider re-pushing this patch(although please wait for some comments).
The reason being, a patch without a subject is not picked by patchwork/b4 or other
tools used to grab a patch.

~Michal


