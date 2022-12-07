Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA5A6459D9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 13:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456289.714051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2tcJ-0007qK-27; Wed, 07 Dec 2022 12:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456289.714051; Wed, 07 Dec 2022 12:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2tcI-0007ni-Tv; Wed, 07 Dec 2022 12:33:38 +0000
Received: by outflank-mailman (input) for mailman id 456289;
 Wed, 07 Dec 2022 12:33:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9USZ=4F=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2tcG-0007nc-Re
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 12:33:37 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ce8d952-762b-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 13:33:34 +0100 (CET)
Received: from MW4PR04CA0202.namprd04.prod.outlook.com (2603:10b6:303:86::27)
 by CY8PR12MB7292.namprd12.prod.outlook.com (2603:10b6:930:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 7 Dec
 2022 12:33:31 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::7f) by MW4PR04CA0202.outlook.office365.com
 (2603:10b6:303:86::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 12:33:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 12:33:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 06:33:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 06:33:26 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 06:33:25 -0600
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
X-Inumbo-ID: 5ce8d952-762b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsoH+8mQ1rvqWyMkWt1B/SgOPqiJALruk+WTN9LS67vU5gYN0MASAfu2thzd+BT0QFZt1Blt9wj4fazOBRn+/nR4GKcGTvplW+R/rtxqZKoZCUQDZKbAAA/K7/UecAh6pEwmV8jiIEpugelxCTS/ksht+WssSBIlwuyLoeHIkUnPusPJMM+GS8+V3XkcqqjYe6s3etjzCPW+kbnAI2QaADNSZb14koejslUtz0I6ycxbYooV1kIzORjyy1usxLGfwFYQYnz2W+cO/N7MfWH63Jen8H7W8mld/xNX8CTK5ztcHYWOY656znPhFnhyQNefS4EtpXoPvaZneQSlUVVOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBWhfeSt4SfbMufp38iIBdJ6FQhv/mSDx8J7idlk9LI=;
 b=YuP/G86HUMS8w9n05yZgMjNytvxmBN+00dptAkqRJ60BQhMcLk7w2KNLelQoDXXV0J1IHSFQagFNdmSnyfpAfWV7sgXaQHGTWtUgHWPQJh2RsPbGRXn7uymr0hLy9dMix1wyPxbaqWy9Motakzfw+pgV9qtTcoHyCUbQH7Z/LO/6PoDZ46oHzW3YLBAVJvuMIdX+gzrHlh7o744rynan/0XSWqQFiRk2BwFeyZJOTsx62fgjjirzcPbF+9chL1ZXqSu38ynxmv1phVq+nlk0s8/0mDvhAx1Xhf3SnXXV97sArlkqHKqW9pybBkEZipSqmSC/OX35n8f+Lv+3PdEpwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBWhfeSt4SfbMufp38iIBdJ6FQhv/mSDx8J7idlk9LI=;
 b=OP0X8IlLTaLohgIJQqOQlLoH419STrFJw6kcQzOpqjl6btSWKc7YqL+R1tBOimJYil8GpBMNznpn1tAqB1osvLQ+LaMYY+ylRweXHcWOhHoZueCSTcN8u7MqsX8p5GNPPDAjwJBmpsB4t2fEocUASsHiH94irCMN8ph96SshFXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d9ea8f69-8cbe-abda-4ca5-b71b502a3fb7@amd.com>
Date: Wed, 7 Dec 2022 13:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xsm: misra rule 8.4 fix
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <dpsmith@apertussolutions.com>
References: <alpine.DEB.2.22.394.2212061808570.4039@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2212061808570.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|CY8PR12MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6b6c9c-5931-40d1-1d91-08dad84f3fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n5vBUGV17fIPEoQNd+rNOuoj2nq4LWoU1jGjmymVv1GeoLj+QpEXchk7uZbMvUUMqZONMUXVkW3xGrKx106pfKG9znS+50zC/dluhJQuWGkLLm6x5NYfIzhyyTx0jyONqSYY2COHd6syqnWAuyXqNwlRsGGoxjhRtOfSH3qe+d2W704IQv7yuZuNLsD9yX0SLBaoc71cItIS6nANmgtrDVs5YLBZC1xi+QQG1oP7JgHNp97ID3bqeX34KIUCcRuYaCkOYqheECRsyfHZj4630ZiTNYIzB01bXF0TWVCdrjnpRW/Hc2pm4L8cXyrPA1Ge8L+o3d+/SwS1JOkcbSDhtMp9Mfddu3Acbcx5KwPpxHqTKioPRf+PdfJ3mOdLf/RTkW/jA3mXCxCnUlH6km8qbi1q2fZPXmzgwRHkrrRrwnSvEg0pT7lO6uynsBkFKgY0RL52c69fYpTF9Lbi387rlKwA9U1yTheMDL3icHJf20Y70ShyzP6Og9CUMinE91jvyItbxB63Cj7hsgiCZ4eT673ekL+dbMXRyMXjmaEchWI+BbjdpJKft/3+9BqE+8jz8FxOxvifFQuVQuWCwKQqhTohmdohEXxIMIb/JKOYg5gOHdSZrkoDSmOEzlQweNAOBFUvtVdJ10Ap+WVvfxRFX2K9Ihvh/Z0v3v0tvdPYYdhLHoxBQGZ/+GgywdOmsBo9/+pb8zVTiCdMgNXRwuN1hIfPZSce/Fo/870mm4H8Y4slmLofIjVSRm+E2nX7Y6DnnTtTYid2oD2t6MhhWdPsvQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(2906002)(44832011)(31686004)(5660300002)(41300700001)(8936002)(81166007)(356005)(4326008)(8676002)(70586007)(36756003)(70206006)(82740400003)(16576012)(110136005)(316002)(36860700001)(478600001)(53546011)(2616005)(40480700001)(336012)(186003)(82310400005)(86362001)(31696002)(426003)(40460700003)(47076005)(26005)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 12:33:31.0583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6b6c9c-5931-40d1-1d91-08dad84f3fe2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7292

Hi Stefano,

On 07/12/2022 03:12, Stefano Stabellini wrote:
> 
> 
> Fix two MISRA Issues Rule 8.4 ("A compatible declaration shall be
> visible when an object or function with external linkage is defined")
> found by cppcheck affecting xen/xsm/flask/ss/services.c.
> 
> Fix the first issue by making policydb_loaded_version static and the
> second issue by declaring ss_initialized in a proper header.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

cppcheck also reports findings for rule 8.4 with regards to the following functions:
- security_get_bools
- security_set_bools
- security_get_bool_value
- security_get_bool_name

The prototypes for them are stored in xen/xsm/flask/include/conditional.h,
but services.c only does:
#include "conditional.h"

This include refers to xen/xsm/flask/ss/conditional.h and not to xen/xsm/flask/include/conditional.h.
This means that we should also explicitly do:
#include <conditional.h>

This way we will fix all the findings in this file for the rule 8.4.

~Michal

