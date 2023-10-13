Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A507C8C9E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 19:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616807.959094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMNL-00083c-NF; Fri, 13 Oct 2023 17:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616807.959094; Fri, 13 Oct 2023 17:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMNL-00080u-JU; Fri, 13 Oct 2023 17:55:03 +0000
Received: by outflank-mailman (input) for mailman id 616807;
 Fri, 13 Oct 2023 17:55:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwK+=F3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qrMNJ-00080l-Ua
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 17:55:02 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a025eb53-69f1-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 19:55:00 +0200 (CEST)
Received: from MW4PR04CA0174.namprd04.prod.outlook.com (2603:10b6:303:85::29)
 by PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Fri, 13 Oct
 2023 17:54:55 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:85:cafe::e4) by MW4PR04CA0174.outlook.office365.com
 (2603:10b6:303:85::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.28 via Frontend
 Transport; Fri, 13 Oct 2023 17:54:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 13 Oct 2023 17:54:50 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 13 Oct
 2023 12:54:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 13 Oct
 2023 10:54:49 -0700
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 13 Oct 2023 12:54:48 -0500
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
X-Inumbo-ID: a025eb53-69f1-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqUvKYONHodB9y1O2kMHo1wWl7W1dq37uBXw42+Vqo3PHIEKUPcn3l4vdVrqkYnYG33LkPVjrMUrN6vMfed7cBq0elgRgySB9oMdSQHYFumZ5U1jEx5b3ZdO9KiGNflk3eAPvaDF1nIi1IXB7ojHa0yToq3YijSkSTyQdrqd7XFmS0kbeb1tpTlpbZkQCArNyD/ccJKZaL4r9opYMKWOBFl2q+O8Z3rd8hKnVV1koxvHYj0zmXXAAaBdfzmmry9GjLwH+234il4Htod905LDDvZU4D7wipNScqPliQ/jtItdHY1J1hXcFUCBak4I1f4Mz0e3f3wojgtHIHkmfX7EmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1FO6rl2PQi7Hyf06Kdf1tfP1smy/xGo16oVHG8vb54=;
 b=k/2ZRIaYB8ovl6QEZ7m5pTEpwRLhcEbcCpgG4uES6iEOB0SntFLxhfDDUvURFgih9jeCthjNwF+WhgaF1MSlkrKsboo3UJHrxh/6z3wkzWwbShhDcw0/cGzMm+D3yVcGVeLCO4hOCay0YRBFFzrC2ZxS5aGLU2Or5nRUSD6qMGX68xQCrAaaXaMr4A3QFKMaeJDzG9xLsjy897ITxtCVg3/e6A/jv8U8Yb7oHvYeh/fjWPMQxpXBqzvnk9/rVmI4O6J298jEoD8C4WI8h2DGlzJnXFQU6weqf+UBPaMkSa7Z2xHoH3wjE1a17d1Hsrjaw9GzX1nEo2YhQrjqqtrfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1FO6rl2PQi7Hyf06Kdf1tfP1smy/xGo16oVHG8vb54=;
 b=t4iKqeHXF/3rNPtQBGxPjU5VJl8zAsUMisryBEi7jEMtzPRAeIfYwUnxmSdRQ1OwL5WnshlN4BrOkaJXaNILv+zO80Fq6lalItGOQ9olU59TlUmySXjw7x0VbsUgen9lg/e3m7t6fp0uVBvaWOa++LE/WZD/SulVcHoKnJPXpi0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <73c3c6ff-20e8-4ec4-a159-b60e6b906dfb@amd.com>
Date: Fri, 13 Oct 2023 13:54:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/17] rangeset: add rangeset_empty() function
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-10-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20231012220854.2736994-10-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|PH7PR12MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b521065-5faa-4933-3281-08dbcc1581a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R6RJFfjmyiw1EQHN96wskdhlEud5TpuT1OTrtKBy0oGd8Gb3JnMAI03KstWBufeJV7kdUMSB4Tme30RpZh7STsGvnq0lA/1AmwKkFkcFFpbDrB1y33LMiK+iaH76nqC3PE2Tp8Va30a35uAGQJvnLBTWQbc+yPFoA3M57DUUFXAAW/E1/7aCPFv/F2s2BP1T5oAeWct+oBSkfmT23/GzxUmdB9Mygtlq1BOfJpcTy+KbtTOO1moWe87Eovxy1DrNqDQq3rTzcU7zz2zGCAQkseBOGPp9ekeCJyTj39GZouasFq3RxixxbTZtFGAUPhuCmE2sda3GxkwPglSwBTI5dWvBOGHwpL/Je1noX6fkuCAcQJDzC9dNkRpY/tZIXpT7luAqcHtXJKaYf5C/E4tymqw8JFMUH6yC8ma8++5LEqnKGKW5KUTUXNPH1CI0LVQz8LzlI9R/KyDKTNNgYqjiRSuDoWrD4oeIfnk8uAKnxDYVy9+ceAfg8/McEqlHe5osiqB6AWxU/Z3qRJk9BnyAmvjiwioaHDnAJIVVPVVtmFWS5iIcaQpLeoCpsKTlJ/fIrFGIpVHYbOh23PVY0Q0AEpUhFs+xRK8KgURvKRQNYI4B1wSU7C8D+sTdAO1WeocBxAZ/3/V6kx+qbZDo6WWplqQ7ixJCCeGBp080Q2eCK0X6UFReSyzYmJ5Ap3xHEI6ULBdUj9A5KN4m80prab+2kIMGtKDyEbMmNEjmFqMVHxBx5KM8kQ9mjR2lR8mbb8En5CUBxRneh06cp33SCqT8DoFZzr3C05BfOXnurgve2Ag=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799009)(40470700004)(46966006)(36840700001)(81166007)(356005)(82740400003)(40460700003)(44832011)(5660300002)(6666004)(40480700001)(2906002)(53546011)(70586007)(31696002)(86362001)(83380400001)(16576012)(36860700001)(316002)(36756003)(54906003)(70206006)(426003)(26005)(336012)(110136005)(2616005)(47076005)(478600001)(31686004)(8676002)(8936002)(4326008)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 17:54:50.9977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b521065-5faa-4933-3281-08dbcc1581a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825

On 10/12/23 18:09, Volodymyr Babchuk wrote:
> This function can be used when user wants to remove all rangeset
> entries but do not want to destroy rangeset itself.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> Changes in v10:
> 
>  - New in v10. The function is used in "vpci/header: handle p2m range sets per BAR"
> ---
>  xen/common/rangeset.c      | 9 +++++++--
>  xen/include/xen/rangeset.h | 3 ++-
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
> index 35c3420885..420275669e 100644
> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -448,8 +448,7 @@ struct rangeset *rangeset_new(
>      return r;
>  }
> 
> -void rangeset_destroy(
> -    struct rangeset *r)
> +void rangeset_empty(struct rangeset *r)
>  {
>      struct range *x;
> 
> @@ -465,6 +464,12 @@ void rangeset_destroy(
> 
>      while ( (x = first_range(r)) != NULL )
>          destroy_range(r, x);
> +}
> +
> +void rangeset_destroy(
> +    struct rangeset *r)
> +{
> +    rangeset_empty(r);
> 
>      xfree(r);
>  }

I think the list_del(&r->rangeset_list) operation (and associated locking and NULL check) shouldn't be moved to the new rangeset_empty() function, it should stay in rangeset_destroy().

