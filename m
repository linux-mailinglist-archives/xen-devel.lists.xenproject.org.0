Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E121863D640
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 14:04:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449889.706910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Mkt-0006Pv-EE; Wed, 30 Nov 2022 13:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449889.706910; Wed, 30 Nov 2022 13:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Mkt-0006Nr-BK; Wed, 30 Nov 2022 13:04:03 +0000
Received: by outflank-mailman (input) for mailman id 449889;
 Wed, 30 Nov 2022 13:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXMn=36=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p0Mkr-0006Dm-Gg
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 13:04:01 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71ac933c-70af-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 14:03:55 +0100 (CET)
Received: from MW2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:907::33) by
 DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Wed, 30 Nov 2022 13:03:57 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::1d) by MW2PR16CA0020.outlook.office365.com
 (2603:10b6:907::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19 via Frontend
 Transport; Wed, 30 Nov 2022 13:03:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.18 via Frontend Transport; Wed, 30 Nov 2022 13:03:57 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 30 Nov
 2022 07:03:56 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 30 Nov
 2022 05:03:56 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 30 Nov 2022 07:03:54 -0600
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
X-Inumbo-ID: 71ac933c-70af-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHUo04o/Yvy9ICJ51vr0LLpqQTrfMxLDlqHzBwWfF8aMcEx5UEG2wIEFL8nAndp52b6IyY/K2r8Lu23vDENyva2ELMCg6m6Yqu1p7OA8cXwoNe/Eja94XKbG4yw6RDM1KcXyK4E2eYAqPLsYVcplpgxxhUBD5XO7pJDLlQrPYLkWR78j0eGoXrnSs0jSUkUYgd3wcAedgPjikrpSINFKPR2xuFr0XHoJlZXQEiavh0aNO5F651XQqMgyk+N0xJScZMy1aW1hyUfdM8hLzy3gaJMaZ44IoAWchK76Wm2XKBxfuQMBn4BZ+XHd61WEeNdU9GS1M8S1IKbaQKKflTgZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTzPXVFlihTMkRLvYxpy6qV8ssb43VZ4yz0SOUYVC84=;
 b=L1GTBzcYpiFLxh5Kz1z+ii7OR4MvJAdjkyR2vDh3+hxU1e29MFAaW13tFnZamyg3Z/Cl4sJ/ypm7P3Hw8VGJA9XG2bH1maQFw4Nl7xdJwCtiWy/cDPxyInEa1nd0jzCMAgQSaFbsWPq3SnFPxUODWWs5Oesh5wmJq0bYRoAm8D6Ao7Lxf3/ITp+WZLWQNEPMuQzhqSOV8STk8xtWvrvarqvZfUTD3JGkCEDFoZrdVbsLQLpPZY7oV5DBDcZRwwVUf1BzrQ5XB4hcp9FnF8kjPfGio9px62pwBCIJj2ysrfu0WBF1pJOdh7raU+AQ025HpX7+TNZQ4erZHdG9ANPj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTzPXVFlihTMkRLvYxpy6qV8ssb43VZ4yz0SOUYVC84=;
 b=kXzJeOUpdew0jmstSCcZ2nIXQaKkPe1fPzB7yDpBs1Lr3PKob1GDMpTlS5PtgqKCT6exrYi9sn2fTZZR9lxqpt5pXhzicPIhoJo3xorxZ0LigHPR+WbRCqrS13xZPO2TAbPUgDYMH7C64kETcddZ2jTpdWy16O0r1PQsA+iccuY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d3e3c74e-308c-3132-95b3-330a2bb44dff@amd.com>
Date: Wed, 30 Nov 2022 14:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 2/3] automation: Add a clean rule for containers
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <f793cc70fdb6802b66156a8756bf676fbac0d809.1669810269.git.bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <f793cc70fdb6802b66156a8756bf676fbac0d809.1669810269.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT015:EE_|DM6PR12MB4123:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b261ac-2f02-4655-9ba3-08dad2d35759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ax7x78+Y8AVSNyLLBa5nfjpA5Mj59f4ZRLjNCTPpG190/li+daWXCNBi1itZn+JjZ0J6u+eRt98DbcgnMn57stBsdZgHj7++3kefBt46RoauEPovpHQAl8qaZuEgYUc7F2XupLnw1tkVySzy01561AoAcBGgiFubPCBwSro+fezcwfz9dxTgD/ccxKq9kFyWLEWsZEvHh5ORzRB9PxLB0H8JZjOHSQvbcyC1dOAdPtcXWJ5PPELwiJvjQa4GkjtVTa4VbJLbl+CiqEq2jmUmefmsRRqgr51Mpi7c4AQCG67btXWv7/M4oUWcoY0U0/Exf2vlEEh/UZBPwivWt2PpY5fhsAgQwiS8F9eCq1pNPl/dqwEg07bhL3uJ5EVzIismWQgjvY5bUDNNl7iJMurnT2GsnOtHjnQ8k1RXeGoRRrrJVghmBvlBNv9dxhM1kmtgjE5ruF/6Eq2njcg+SASF6F1RSajjGNOUSvcanFFZrOKi4RMPni6+n1RPheHk992VzYBeUAO2T6EMukXO1Gz9JAgG8xgLTR9hC2GDzspi5u+bqI9TJrQJcxP1JF+qiPLOBMPpk7m47giB1oYRmK9968Lo9OyuiqgCGNnqIY+xty6FSJtyqgVTQFfiMsJFRpx7JQjS7NUWJPfP62kcqee1eN3zqzIycRtujwcv6X5CKPkihVQa9x2p0oVr5Lff6DwXiq6dCizzjIbExmzDIv05kgwhdIm86kG8ptAdIzFNHOBIn70q6e+fWwywTxY90Wo6SQKcSlRADSecDKomDCYBdQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(356005)(2906002)(40480700001)(36756003)(40460700003)(81166007)(86362001)(31696002)(478600001)(44832011)(41300700001)(26005)(4744005)(316002)(70586007)(36860700001)(5660300002)(70206006)(54906003)(8676002)(8936002)(4326008)(16576012)(110136005)(82740400003)(2616005)(186003)(336012)(53546011)(82310400005)(47076005)(426003)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 13:03:57.0206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b261ac-2f02-4655-9ba3-08dad2d35759
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4123

Hi Bertrand,

On 30/11/2022 13:15, Bertrand Marquis wrote:
> 
> 
> Add make clean support to remove the containers from the local docker
> registry.
> make clean-<image_name> must be called to remove an image:
> make clean-yocto/kirkstone-qemuarm: remove yocto kirkstone for qemuarm
> image
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

