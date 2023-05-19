Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F17098BD
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 15:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537081.835854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q00Vp-0001zr-CH; Fri, 19 May 2023 13:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537081.835854; Fri, 19 May 2023 13:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q00Vp-0001wf-9J; Fri, 19 May 2023 13:51:17 +0000
Received: by outflank-mailman (input) for mailman id 537081;
 Fri, 19 May 2023 13:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9j/4=BI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q00Vo-0001wZ-7I
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 13:51:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36287e52-f64c-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 15:51:11 +0200 (CEST)
Received: from BYAPR07CA0096.namprd07.prod.outlook.com (2603:10b6:a03:12b::37)
 by CH3PR12MB8457.namprd12.prod.outlook.com (2603:10b6:610:154::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 13:51:08 +0000
Received: from DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:12b:cafe::d7) by BYAPR07CA0096.outlook.office365.com
 (2603:10b6:a03:12b::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 13:51:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT004.mail.protection.outlook.com (10.13.172.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 13:51:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 08:51:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 08:51:07 -0500
Received: from [10.31.192.57] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 19 May 2023 08:51:05 -0500
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
X-Inumbo-ID: 36287e52-f64c-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMeuCN6/YIyNP7kp+7PqjfEvtYCtLZUMwlIqMyBAQefm/xt/+Hko5UQqaNxRk8K+SzDG/m4Yt5cNt+8wxAbDZZHJB0LbZGcJMJN23xp8wSVInkhEIqTGdm+RBjEzYYsdMwmWDJYpq0mAlim6h+5hch3nn0VAbpPwSZivhKOZumsSurMAbFP3OKlaRAyUBH661F4+gBx0P/5tpNlT0hOEkOz4nZnF9D8izNdQ82G7qGyCw5wAx6IKICCFbrwqbpbUBqyiK+4uJuT90r9D6QlbvvXqVMuc0+cIPFXtv4I4LGwbpKSxvVDo6JvpJrA+AsIboEmjEXy96qE2v1U13ieJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne1kIOEt0to5/Wp87p+qktz7CIMqfTtz1Jeunn9xaUs=;
 b=Pc104TGmDxpaMYlKNnmIDUt1I/UL9tyKSGaOPi8rHn+JSqrEOt+2KSSx5cfbPr41S0mVh+Xqfp9ag7Z7jpw3jKPzGGK80daZ/uKFyvwxXfx+KnAuOlsfAs4pmvkLVwwnzrc4kwiw2UQGC6isIPSz3ljdUsQeNFfbqvcbzHzsfHQa2FZShyWk5FwSHkD3oyuC6Kxzk48fpdtVkaeXxLqRidp3rhOSn1cU6AqhVMEdTo5qVRLWR35f2ZDPyFhyQ5pRMjrXgCKPj0RQqxOyKxzOt6+9RVc/5+4SmxKLANwGG9YrTd4v3yqDDQP7b8cd6GfbCPQD0Gnf9NFIIX0D+sap1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne1kIOEt0to5/Wp87p+qktz7CIMqfTtz1Jeunn9xaUs=;
 b=ZhH7lxEASAMapN491GwJBy8jdDCTbAZplqqdqay6RTIR1lVDHskBpPeMZBveGoZnjIF/uB4neXQfUnAun+BBvkXbpjVm9Ldq/zr0pOJcVLSBUdHVbM4LekvK6voC17DeioLsEh+tlNx1JYThi6fAJ4Xg1cGex9mDclqYHNIKCWg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c3ed3834-fafb-ddfa-a422-2d3b3dd30a06@amd.com>
Date: Fri, 19 May 2023 15:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: xen cache colors in ARM
Content-Language: en-US
To: Oleg Nikitenko <oleshiiwood@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>,
	<Stewart.Hildebrand@amd.com>
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <4e859659-8532-7ba2-63b9-a06d91cb0ffc@amd.com>
 <CA+SAi2u3UdjDkpMWT0ScY8b84GutXmn+7hdMYSxJSDictgzhXw@mail.gmail.com>
 <CA+SAi2u9uT7R6u1csxg1PqTLnJ-i=+71H3ymP5REv09-srJEYA@mail.gmail.com>
 <alpine.DEB.2.22.394.2305091248560.974517@ubuntu-linux-20-04-desktop>
 <CA+SAi2u_gwuotOWexJ1MXii82NkLx8inx4VO_f_EjO9NqgM+CQ@mail.gmail.com>
 <bcac90c2-ef35-2908-9fe6-f09c1b1e2340@amd.com>
 <CA+SAi2sgHbUKk6mQVnFWQWJ1LBY29GW+eagrqHNN6TLDmv2AgQ@mail.gmail.com>
 <CA+SAi2tErcaAkRT5zhTwSE=-jszwAWNtEAnm5jNGEP1NoqbQ3w@mail.gmail.com>
 <53af4bc6-97ad-d806-003b-38e70ccd2b58@amd.com>
 <CA+SAi2vrB714Tc9dn4SbtDo3VrT3Q8OpSiFXRLRaO5=0BJo_rQ@mail.gmail.com>
 <f0e6ca10-2142-7c39-0c7b-042c454e7e08@amd.com>
 <CA+SAi2tCVDiQ1BLdvuH2XnvTDGDCnPBDCq70AVbsO+TZKMERSw@mail.gmail.com>
 <fa9ebe0a-6ba0-6f1a-0df1-ad65ec1e93b3@amd.com>
 <CA+SAi2u9uxSgUHZ6EdNuQHSh9FYn3YR0kEg9BB3BQwrkf11zCw@mail.gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CA+SAi2u9uxSgUHZ6EdNuQHSh9FYn3YR0kEg9BB3BQwrkf11zCw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT004:EE_|CH3PR12MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb29d2b-069f-4ae3-1b94-08db587018f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NNzNQlM2P8LjCouaSO8QzyH8g5XPBLVDdYDFslh06GA5cphpxabOcmRVUBcZ6hl7jf35W4NNcF/A8f+02wZJrjGDUyGmssuimGQJov4/5T2FZAZBw8zy1zR7MaBuXhQPL2r9FX1ESENIJKIOAVEQXGf6g1Cn2dIIgs/mGDcK6MKQcBvFmU5UQy2gJrNcCqMBUgxjMsKw81D6+qMA8ZzKiiNFPIXMlDNsnz4mMEUE7HOd68SnH+URh4z66/KiJa9o/eU49pBG1esSN6MKlYdJmCAefB4/8rm8vhv8/LvrGoHulFwNhWlFMf/P0qWfotENUUAHQnCReffFM4XKT/BVKWQVhhY4jL3OrOd2At+sb2w3m81MsU1aKspWzGxd5H8u5stG5NGxNU+YZ6PtpB+bhpIZYtHNFBCxB/c3CsSK2OrtYsJshBRQ1IcbCQUOcx15UMW0pdLdmoR5MWzk7ZwXnXWlRQXRNnxpIEq1pODlKiECXYU8OarTU4jE+rk2azJu/P+vkOJkoXlfRCLfd9HtieeTMFSlnudnNuypWJYtth5tNAvjanAvZHinqPJamP3dh4z6xxRQwQr98G7y3ocE1QxgbkyDS8heL7Gt1cbVgR/eHwfgq2XZkMeIxCHzUwmQIxEObQxiloQ9VZm8sTG4PCtnnGtWg4Go8nbuB9NAePdPcPZ/sIvA51dpfeWAsfTGIlJuYUwef0sV5cvylAYECDCXI2r1CyAqkXsdGg46OAQf6U5cIvzhPWsQlAkQz9jl
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(336012)(478600001)(40460700003)(54906003)(16576012)(86362001)(2616005)(426003)(47076005)(83380400001)(36860700001)(26005)(186003)(53546011)(31696002)(356005)(82740400003)(81166007)(82310400005)(36756003)(40480700001)(4326008)(6916009)(316002)(70586007)(70206006)(2906002)(8936002)(8676002)(31686004)(44832011)(41300700001)(5660300002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:51:08.0442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb29d2b-069f-4ae3-1b94-08db587018f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8457

Hi Oleg,

On 19/05/2023 15:38, Oleg Nikitenko wrote:
> 	
> 
> 
> Hello,
> 
> Thanks Michal.
> 
> Then the next question. Now it is more related to the integration than to the development.
> A license for the xen in 4.17 revision at branch xlnx_rebase_4.17 xilinx repo has changed.
> I found out when I built this version.
> Now bitbake and yocto build fault by COPYING file md5 hashe inequality reason.
> I found out md5 hash stored at sources/libs/meta-virtualization/recipes-extended/xen directory in files
> xen-tools_4.15.bb <http://xen-tools_4.15.bb>
> xen_4.15.bb <http://xen_4.15.bb>
> xen_git.bb <http://xen_git.bb>
> xen-tools_git.bb <http://xen-tools_git.bb>
> xen-tools_4.16.bb <http://xen-tools_4.16.bb>
> xen_4.16.bb <http://xen_4.16.bb>
> So this is a question. Should I update the license file for all our branches or is it possible to keep an old one for old branches ?

I'm not a Yocto expert but it looks like you want to use Xen 4.17 using old meta-virtualization with no support for 4.17.
Anyway, this discussion is no longer related to the original issue (nor to Xen itself) which I hope I helped to overcome.
In case of other Xen related issues, please send a new e-mail to a mailing list.

~Michal

