Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0316D7AFF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 13:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518466.805051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk19j-0002wu-Ry; Wed, 05 Apr 2023 11:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518466.805051; Wed, 05 Apr 2023 11:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk19j-0002uS-Ol; Wed, 05 Apr 2023 11:18:23 +0000
Received: by outflank-mailman (input) for mailman id 518466;
 Wed, 05 Apr 2023 11:18:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btvB=74=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pk19i-0002uD-2G
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 11:18:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90c3ae6a-d3a3-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 13:18:19 +0200 (CEST)
Received: from DM6PR13CA0006.namprd13.prod.outlook.com (2603:10b6:5:bc::19) by
 LV2PR12MB5797.namprd12.prod.outlook.com (2603:10b6:408:17b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 11:18:16 +0000
Received: from DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::ca) by DM6PR13CA0006.outlook.office365.com
 (2603:10b6:5:bc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.28 via Frontend
 Transport; Wed, 5 Apr 2023 11:18:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT110.mail.protection.outlook.com (10.13.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.16 via Frontend Transport; Wed, 5 Apr 2023 11:18:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 5 Apr
 2023 06:18:14 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 5 Apr 2023 06:18:02 -0500
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
X-Inumbo-ID: 90c3ae6a-d3a3-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egDyTYTFPoXBuaPuUrAD9TIEGGve+2IIoVmgyF6JUzvYgryJWYPHAMYw20B0KuWW0BtTCS9ACMpeMbWPKy5q28j2N7dEQq0KivkJwRURKPcVa/U671ljgAg6sSaFwAE1mhE70OVIkpWYR+SrMiZ7FN5DZiqf//xounPKlBXfio395jiI+LZxX006EG58Ql1PTuSwkTrd0QAUlfgGkAIdV9WGGRQJ3OhdenRhvqb8i7ujEnS+47xrKcHsMIbFaZEllsD4OG8As4s1f4cHYao7ZiL86nYT4S6J7/ua72vanhWNNI78O0UptfXu8KhBCk8AW2u8BzRa8HjyK72pP8xDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJXtiKGy9roPQFWOXibFz3rmlQ5I0iIIqdyGcUL9dLg=;
 b=XKrbqeswns5TthJXJwPqB4Q5KiMpreiKPV12hCDB/K4KweghOGEhuo3QXBrI+DKl1Yher+9Cb2GAEt4VT10Vptox72aFgclSHJiepE8FTZ0f3oeYS1zLcVvKugFRWG2HC65hAORhvJaHKp2Bk2NBENn6eEOebFxj7onjoxw8KVuiIcmao1RbcwRt2EXKe5O5cWqZi4mp11jXeQgCZyDSDqrdJdnfvCsZsdy8uRDiOR5tdCxIXIIX0kZ2nsL1GlQxfNLu4tbcroFA61bSyH9iMr95yiyjAxeO7ZY7L2W00GMwVHn6S/7U8/WmAWVEjZ9cpr6bTsPiEb4OCXNyOjP+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJXtiKGy9roPQFWOXibFz3rmlQ5I0iIIqdyGcUL9dLg=;
 b=xRv0XUvvy2NUHf7BBziOnH3akAQ8WGIbMxKS3dETvK1eGBhCn/iBoxvVf3VLJBAFxg7hYqyDA/HArTxc1UTtmQx9rOBw++4QuQl6jECHRizqNENfgNxDurzsXz+MxztG2WzIEYbGcDXueeSTkM4G/AnRi8zQHGcAHkOtYXzCp70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] xen/arm: vpl011 fixes continuation
Date: Wed, 5 Apr 2023 13:17:47 +0200
Message-ID: <20230405111750.12491-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT110:EE_|LV2PR12MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abba9e8-18d2-44f0-f264-08db35c773cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+cf5rcUvuzkcGJlAeB5SDbeP4/EoGERkmpIX6kGb86VINHd5Tu9VddoOdFcO3a7+jv2Ou/6WzVAh4FKBG26QCQlGR9iu8qHhEKzaqeskYXd1vRHDfXmk2ocG1TwN+Xok9sqLhLZT6I7RPbW7Qd1V6xop3h+p/AZVfr4LzjiLf3AHqdhW0ubgTJlxiJJkH3J4lhoxdtVXbKqZbCu6CXMU+Nqg5tVu70oBXTN+plfiVkRPjpllgZheYq+rS1ghMNqNH9o0b6VgGgJ6rX7dg3w2HDiP+PeBZM+lTqXm4ZNDHcgOTVy/mk1J6//iRAgsdkdgI4wK0hS3jikN4xRtC7BkBAi5XhQBhBeNKh0sM4ixT5ZGaUghdjRQYCa4TiBcrBMRA4Qg8ivdidF7hJIDXkHFkQIFWznn5e/5mijT8HR5jl1IPJKUOJA/pS4zbLqDzvxEle8ZZ0ip3Il7bKXC9asvdNtKW4IlYnB0goQxLN2KmhxeFPK4PxJD7fEmAqUq3VkssGfyZGvRFmpagOpfBIOV+FsLNkEeyWgwAZhxWfyW9T1XYYyguM6D6bE8jtEYR1MnqcxQoax4WegMCz5I37/DIYh7m1ND2Tk3Q+/e+XoNOIfwh3V3aueE3CVdou3vKVd4yW3Bia8SblDLZowKP6hXqhqLdxOSdKakA7ZndZawRy6ZJ44Tvj+ZAhb1LSOJ00Roi7ns0/S3P0ZSl5zYdeDyZ5KEnjtIx5g+S2UqRjqXYdw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(2616005)(86362001)(82310400005)(2906002)(36756003)(40480700001)(47076005)(336012)(426003)(83380400001)(186003)(26005)(6666004)(1076003)(4326008)(36860700001)(478600001)(70586007)(8676002)(6916009)(40460700003)(54906003)(70206006)(81166007)(82740400003)(5660300002)(44832011)(41300700001)(356005)(316002)(4744005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 11:18:15.8848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abba9e8-18d2-44f0-f264-08db35c773cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5797

Another portion of vpl011 fixes/hardening.

Michal Orzel (3):
  xen/arm: vpl011: Fix misleading comments
  xen/arm: vpl011: Handle correctly TXFE when backend in Xen
  xen/arm: vpl011: Do not try to handle TX FIFO status when backend in
    Xen

 xen/arch/arm/vpl011.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

-- 
2.25.1


