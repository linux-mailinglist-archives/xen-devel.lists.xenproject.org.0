Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447BF7318D6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 14:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549571.858165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9lyH-0007qp-BS; Thu, 15 Jun 2023 12:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549571.858165; Thu, 15 Jun 2023 12:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9lyH-0007ov-8D; Thu, 15 Jun 2023 12:21:01 +0000
Received: by outflank-mailman (input) for mailman id 549571;
 Thu, 15 Jun 2023 12:20:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAiO=CD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q9lyF-0007op-La
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 12:20:59 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13c486ca-0b77-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 14:20:57 +0200 (CEST)
Received: from BN8PR04CA0034.namprd04.prod.outlook.com (2603:10b6:408:70::47)
 by DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Thu, 15 Jun
 2023 12:20:51 +0000
Received: from BN8NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::81) by BN8PR04CA0034.outlook.office365.com
 (2603:10b6:408:70::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25 via Frontend
 Transport; Thu, 15 Jun 2023 12:20:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT100.mail.protection.outlook.com (10.13.177.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.27 via Frontend Transport; Thu, 15 Jun 2023 12:20:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 15 Jun
 2023 07:20:51 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 15 Jun 2023 07:20:49 -0500
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
X-Inumbo-ID: 13c486ca-0b77-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQNLaqUTWRXLol2tMHnPaeRcwUi1DzINEbMSUiyjrcaLDz6rn6evgy1WImMySImGIyz+IJqMRdio2we+ZUTuWpwuT9YODyydLoditgL0ftPO9FKj+AlGlUUJn2PqleJqidh9A5+d1i+qYYy4PDLCuUbgZc9+5RcA4KGyAXIZ7z+7BXX6hAOZ7kXV1IULX8c3ejHZINdbOlNtsF4lcT2LT1YwOpCfV6PXZ7AI4xQfWp2/PBzN+6BPs7vscxgnD69vDOIo2a9n5OxB1ZpPbZ4OnZaKtXsdWqA32H4gJzbHg5rrD+n/nKrUqMwz/994fm7KAg80hkGGz1xtC9LsWL1t1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGje6PgFAJIH8je0TbbXGfv4L46SJSd1zMr/ZOKOmOg=;
 b=N9C0OaOLYIg4A7vVjaCfe/6ovs2Qyu5T5bf4wdP4ysC6jRw9JRf+pdgxBPSdPBYrTQZV5EmJNCINNWblRonc+f1e1nGH7WVXOLOmv3ym6lxb4xpbqw7jAb1Vs506cx1RyUQAtq+6hkG3oBrDiz0b1MWrLZNZGCoAzBzcbFpyAsKjT5O9m5dcSE4NEwnh202uSfbUEW7cwFWqe3qCoCnaKDp/tD3IWU2LmD2It02YvPoj+5NsPY8XD2Xdc3bNvNZzrFRL3eYCrrDMuj9JZEEth+13xIi/+Jh8g8v46Zm0jLhiCsFpOgOKhJTYVzIlYudo7cMWbcOTQUzXu9yDbuTV3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGje6PgFAJIH8je0TbbXGfv4L46SJSd1zMr/ZOKOmOg=;
 b=EW3mXuf42xemHcu7LexBBoehMTdsuXKhng2Qfs8KlKIErFoc/yH2M447glkZCAi/ta+BcekwHjG9fzcCc72zXIKnVLBKrLZiLu9xgNQe/UTE+3qOn3plcVIM1gSltQe6LZ57b2ljtRyEBXHKgqcBfPLQpSmn0tuyi7ySrkBJDwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2b1faf85-dc6c-76dd-3d88-d33bbd3c5df3@amd.com>
Date: Thu, 15 Jun 2023 14:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/misra: add rules 1.4 and 2.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <julien@xen.org>, <andrew.cooper3@citrix.com>,
	<roger.pau@citrix.com>, <bertrand.marquis@arm.com>,
	<roberto.bagnara@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
References: <20230614230328.1060282-1-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230614230328.1060282-1-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT100:EE_|DM8PR12MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: f4cd4bbd-021d-4bb6-a639-08db6d9af5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0ZteP2tQv0Hdnf5y7aoXP5X8jAL5jAopKFkMPatFD7cSQdUkbis9cs/EqFj3BaccphJoWy3W0MngqKEBNMwFZ7/b/iq7aUScjAG0IOn6iMsddN+TKgX4ENZKlXnefHneHGBQtWX7Cjxala72tmWvxrkM5HvsyE15xka8qNZ1JmGayaL5+aosS1y3btOyvKpZ6taEmkiSNyZIRkXjzY+HQxbu85gT1Rsnx/wLBZ/4QXx88w2c9lPHTJ0gQqmqYAr+TQSDly2MDbhVfsed/91wLbDxnh/Wt4X2Xd6xcX9KJpQHBH2Z2tL1Iso7oMkc2tC4G6qqwL1cy7LkDIqAP2lLOUIKWaBNK9EpG/5S59hn1CTQ/JwShrsZb1LSNwtDXT002bOpxKGF6GGYvSfV4os7t9UTg+XaYRAD7sD0UFSC6FG9rxCxTnuHITjqLpGQqNK72PthS4jRuWPHEVtl/Ecrim58wSPKAuJaCJ13hsKk9owCllNhD3hni0bluvUhyxD7WbbqP0IGYyZst/Z6fggc4bHB32j621mDYFCAQ130JWrUVKOHcrthQGF8B/a8NKrngPQ6keq4le5D5kivUjPP/24Rix4t0r1hwGVCoV5YygcSTQn8DmiDGH0kSj7Ii1CYpNQVK9cYxFSMh0LHdRcK8Si8DIMoGLzRM+4GXmGnaGn8QqxuS3UZZ7VEc3NT28eL1YIHW0dy+CZXl6v3H02OCBBkEAPgZSte0zL6sIYiLxOp8Qoz+697EXVDTHU4wjCY+Qs4I2wB1OumrYh+gL3kTjy0vRgpOpRiqq5qNsON/L01ceK27cSDH6Hq1rH0swtg
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199021)(36840700001)(40470700004)(46966006)(70206006)(70586007)(40460700003)(316002)(4326008)(186003)(2616005)(356005)(81166007)(82310400005)(31696002)(86362001)(53546011)(26005)(36860700001)(83380400001)(47076005)(82740400003)(426003)(336012)(478600001)(36756003)(110136005)(6666004)(54906003)(16576012)(40480700001)(4744005)(2906002)(44832011)(5660300002)(31686004)(8676002)(8936002)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 12:20:51.7957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cd4bbd-021d-4bb6-a639-08db6d9af5bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5400

Hi Stefano,

On 15/06/2023 01:03, Stefano Stabellini wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  docs/misra/rules.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 41a727ca98..4179e49ac2 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -90,6 +90,17 @@ existing codebase are work-in-progress.
>         behaviour
>       -
> 
> +   * - Rule 1.4
Just as for the previous patch:
This is incorrect as it should be surrounded by `` similar to other lines.
Otherwise it will not be taken into account by convert_misra_doc.py which converts this document into cppcheck rule list.

~Michal

