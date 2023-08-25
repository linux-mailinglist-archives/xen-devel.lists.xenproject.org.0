Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2F97881EE
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590739.923120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZS1t-0007jA-2b; Fri, 25 Aug 2023 08:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590739.923120; Fri, 25 Aug 2023 08:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZS1s-0007gj-Vq; Fri, 25 Aug 2023 08:18:52 +0000
Received: by outflank-mailman (input) for mailman id 590739;
 Fri, 25 Aug 2023 08:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8Gy=EK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qZS1r-0007gc-EZ
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:18:51 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe59::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04a30ea6-4320-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:18:49 +0200 (CEST)
Received: from CY5PR22CA0093.namprd22.prod.outlook.com (2603:10b6:930:65::11)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 08:18:44 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:930:65:cafe::da) by CY5PR22CA0093.outlook.office365.com
 (2603:10b6:930:65::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 08:18:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023 08:18:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:18:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:18:42 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:18:41 -0500
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
X-Inumbo-ID: 04a30ea6-4320-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyE5cc/zwWpa4sWyrHdVSqBsrDPUFfe75ovG31j03nr7wyhYSlU5kblbLtdLeLN6YdSBNoSrL4Jbhhzfq7kiDltqriVNdwqLjUPCzc0iS4ey35cD/EdPY6dKXy5gkKTdZcJeEz3JmMjiIwxeMFfKlOYTCW72fkGkKtwfQZaoEAQ3zPJwLydClL4IM/q5Qr8sclo5z3PooVey2rtWt4b+GBd7QEP/PY9klHwYU9Ry/qchQSni6BKs8rbbQMTYTuhnZ6zihju891PVIuHm+5cyAwRj4kWNqO9gtinpsxmnk2UeBu3Oz7604pKln9R533wlTfqcW8bqNO4biHpHUGylJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/hjiJFOaAyN9HaKeW6rH+L7wnQJYIfr10GPJBnqNSQ=;
 b=irjs4sAv2z+B4VJW7/JPoOtwT5CEZAbEDlN2K1j+7ghgrszIfbrHSSMZS8Me9FVZZei3lUpL1balG4pj7WzLsTaFImnmd+H7BRcnKPSH/ca1SCmk67Tsz6zBtcID7bqHBZ+4XLHnxhftjZyjnSdiCupij9/+KJsu24AukQ6vrAtjLN0w5LRPdZ5j2MBr6sseTOHFNUXEByAAXn9OjY8AXeJtZg+bXMVes1JkaA/Mr7SyEpJtj7AizqAolED9bVY6jrICB9sEQS6P0VIdmV/nLdT2BxilZmBJ0rhSUv8G+8bfdsCgL2+lp+TCrL6qEFEBlU+FrRV3llu/kI4A+t/IrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/hjiJFOaAyN9HaKeW6rH+L7wnQJYIfr10GPJBnqNSQ=;
 b=kFI8pRO/OeM9urmYt7UMcp/NyKIoXcTQFSUGWxy51Vh4IneGuYAQdUQxPKe3ILhg5JlVGtPOXm6ndei+dSMX2HJn6pEo4VXebZPuf/Sj2natX0+p/TP2FOAPpDkrp4lJdUSM1KDm1ldG9TAEBswYEyxB61gcbGjqkog1tuSMK8A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <aec70a33-b5b7-0bcb-52db-15162407c8bb@amd.com>
Date: Fri, 25 Aug 2023 10:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: xen-analysis ECLAIR support
To: Stefano Stabellini <sstabellini@kernel.org>, <luca.fancellu@arm.com>
CC: <nicola.vetrini@bugseng.com>, <xen-devel@lists.xenproject.org>,
	<bertrand.marquis@arm.com>
References: <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|MN2PR12MB4405:EE_
X-MS-Office365-Filtering-Correlation-Id: 793d66e3-82c9-4b1c-67cc-08dba543e62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Znc3EEg2S9gYtN1/dv1YWgFw+6z2KPi5grrrlN/Ov2joF+b9B8RqIwsF64vgCbTStQPS3JeMfClS/dRbzwrON4I8kvUL1asMEAetdSxKv6S7Iz2fBRgv+sALpy2PVvIoymq+smdjpBhyKecsKTXxYaJ+FmXPd7V1v2IfOIpXsdjm8urZoEAUTrAiNJHyGrt3OTHVPTwn04rN4NqMStV+1VAJk4uWHRkYstEn3z24Dt4HYzA0/btcuaIlSgU5WA/xMefraBGmydofApqn2WbfVbTbRQBAuQko4cuTv0NY3nhSKqswFHHfJEfgHVrzeNEpuDiVzE5e9mocC7qaSOjGhUAcrvHR+hgj+r3DZxpd8B4mnoaY0eGEHQZs3XgGHJP1iLa0KAxINYD27pzF7zkDL2paXnzA7MMCHvbdMh29fUWNspjtj9wDEQX9Gt3hgYTLQdIlwDJiPQQzCTUa2DgKASsY1Kgj8lJh+frieMuGWxIHGfeypfjaRdEOAAig0Sz4UdC8tCnuec6DkJftawkUlNrFUX8jYfLLnYlcAWCygsyr5zPnjEQzd088d2iVO/kYJKnd2P1iqHMx9AuEin397ys4dhQ7SPTX3O1KUSdzibLrtfndyVZjZQT8idHmtLIyZHHas32MW3uYjUen86DdqDTazGvl2uQwdD5c3VMJmThnjmOeQBaocR0DkZdNk5sUq/l6UMlHVsNAC0ChwCYLyv8hQZ7spkesQ+ATvC+7Z2Nhfm+oWJLrLhRn7n43q/W+zI3y9AyzpkZldMEVIPd9RKMSH9QWUA/LmebSGX4lyag=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(1800799009)(82310400011)(451199024)(186009)(40470700004)(36840700001)(46966006)(336012)(44832011)(36860700001)(83380400001)(26005)(478600001)(47076005)(40480700001)(2616005)(5660300002)(426003)(3480700007)(31686004)(2906002)(8936002)(4326008)(8676002)(356005)(82740400003)(81166007)(40460700003)(110136005)(70206006)(70586007)(16576012)(86362001)(41300700001)(31696002)(54906003)(53546011)(36756003)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:18:44.4894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 793d66e3-82c9-4b1c-67cc-08dba543e62a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405

Hi Stefano,

On 25/08/2023 00:24, Stefano Stabellini wrote:
> 
> 
> Hi Luca,
> 
> We are looking into adding ECLAIR support for xen-analysis so that we
> can use the SAF-n-safe tags also with ECLAIR.
> 
> One question that came up is about multi-line statements. For instance,
> in a case like the following:
> 
> diff --git a/xen/common/inflate.c b/xen/common/inflate.c
> index 8fa4b96d12..8bdc9208da 100644
> --- a/xen/common/inflate.c
> +++ b/xen/common/inflate.c
> @@ -1201,6 +1201,7 @@ static int __init gunzip(void)
>      magic[1] = NEXTBYTE();
>      method   = NEXTBYTE();
> 
> +    /* SAF-1-safe */
>      if (magic[0] != 037 ||
>          ((magic[1] != 0213) && (magic[1] != 0236))) {
>          error("bad gzip magic numbers");
> 
> 
> Would SAF-1-safe cover both 037, and also 0213 and 0213?
> Or would it cover only 037?
> 
> We haven't use SAFE-n-safe extensively through the codebase yet but
> my understanding is that SAFE-n-safe would cover the entire statement of
> the following line, even if it is multi-line. Is that also your
> understanding? Does it work like that with cppcheck?
Looking at the docs and the actual script, only the single line below SAF comment is excluded.
So in your case you would require:

/* SAF-1-safe */
if (magic[0] != 037 ||
    /* SAF-1-safe */
    ((magic[1] != 0213) && (magic[1] != 0236))) {
    error("bad gzip magic numbers");

I guess this was done so that it is clear that someone took all the parts of the statements into account
and all of them fall into the same justification (which might not be the case).

BTW. I don't think we have also covered the case where there is more than one violation in a single line
that we want to deviate (e.g. sth like /* SAF-1-safe, SAF-2-safe */

~Michal

