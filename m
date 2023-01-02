Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA7D65B30F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 15:01:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470325.729792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCLNk-0006ta-Pj; Mon, 02 Jan 2023 14:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470325.729792; Mon, 02 Jan 2023 14:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCLNk-0006rn-Ms; Mon, 02 Jan 2023 14:01:40 +0000
Received: by outflank-mailman (input) for mailman id 470325;
 Mon, 02 Jan 2023 14:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7CY=47=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pCLNj-0006rh-AF
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 14:01:39 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f89bd132-8aa5-11ed-91b6-6bf2151ebd3b;
 Mon, 02 Jan 2023 15:01:37 +0100 (CET)
Received: from BN8PR12CA0025.namprd12.prod.outlook.com (2603:10b6:408:60::38)
 by CH0PR12MB5042.namprd12.prod.outlook.com (2603:10b6:610:e1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 14:01:34 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:60:cafe::94) by BN8PR12CA0025.outlook.office365.com
 (2603:10b6:408:60::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Mon, 2 Jan 2023 14:01:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Mon, 2 Jan 2023 14:01:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 08:01:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 08:01:00 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 2 Jan 2023 08:00:59 -0600
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
X-Inumbo-ID: f89bd132-8aa5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTOhaNPCQopKF+VeJPvubk3OPDFMBCmITNpImUqg2rJQJ7yCyrHHZ6qusE2moXStFi84dNKUsDhyxuMzM/M3owBLoqoWQvWuhd3qgy+z4AE48E6AncLV8di8z0aOVB3kk0ip1N+PMXMOUpnkiIe8hxZn1VHTC0+UHj4cGpz9zWxUyTt0b57a287o5oMwFBbe1+qudt3W2G6uA0/FEHtME0/ULS1clYbdEULMZEB01EQeHKSQA5VhoHSHaSii7yjZ+cbrvHXyUT0NXDOOcCzHMug1hrDU8ujhnLCfbgm36OBG0lGNYql0r21BjX6cWwwEGGhfuwwRTCpDaXbf07+h9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABCgx/a3xNCjBPacP85PXQGgbm8BLLReM5BWn7wRal4=;
 b=YTHiozJc7qQygkeKY11CSBPldE2VcMZ1ZfjzxL1GlpGW+5AbxcvPVg7CU2Lz+NpQMJd7zhRfr2JlTwLGEUsnE/5QL22HZJE06xXH9sSR/60xmjysYyFmc3OiHxi/Zovhgff1Y0cWeBA4SarOkRtXZYFRe7NVb8/ZmIR9FL277pVKO/Wqwenks8Uzv2DiGiJY6+IhFnXO/x5gf0XBWacEW98QCa2zYu29EGnNVDvccTHDewdf3dE00vudf+cdKB6osn8QGaqh6DlEfMwlgbC98752ZbdjlaElRL9pObjKmMOTT15VOc0zp8isDAyDSgYWd96ECnOBqLTER5uj++vZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABCgx/a3xNCjBPacP85PXQGgbm8BLLReM5BWn7wRal4=;
 b=QlP3WhmhYXG2zjR4hs5QyBxkdkZcgr5Jz0feaTXiSjtrR3mtTVyfOEpldrLVs5lgrOEy9TTqR9glZwndzip7fZmbi8VH3kxPGhtsTfHfKj/0FVNcCItw2kCM6VJYhpBlSFS91SMPpXKvJIx+PjGa3TlfhL+fcc3oZb2EUxK7S3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <07b5cc36-e0ea-9b51-036a-9523920dd74a@amd.com>
Date: Mon, 2 Jan 2023 15:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/6] CI: Remove guesswork about which artefacts to
 preserve
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
 <20221230003848.3241-3-andrew.cooper3@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221230003848.3241-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|CH0PR12MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c969fc-3648-4ae2-67c3-08daecc9db87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0u6BXlASZ44acsqFlYmT9XE87+1XgE2geVGvdLjglH2ynRwISjm8YRU6RmNmTN03Ij/QqGKwaa7OZxjLWVrqsLRSEnXw5AXk7N1s42F7QwY/ZnVogJRXWLiRR706cE/buRn52VjbCFDY1L/NJwIdbuIjMaBQvR5QzWpg177nblI7GEgIs49wT1QRYrcgvnDYBlCV+wpWv3HQjX4j8MX17Yc51FwB3j3HTUOWDtH+I4/zvkpUpq7F5BMLbWuvrK/6Qj5bwkaveFWVbRzk66duJbUYMor8APfS7z8wIB9qJ64esisaLyOcFFz3joXo251qRWZgib/UdH1uqfKTBeNzO7nveFu7l/2hiJf/q3KO4QsapLHARdkjaw3nLLJUqGZVRjlQ05XNKn/B468jSVwo0Wmm5XAC3edzCxBU4js8pnKjKx9mkVu9QB21G4GE0XKnco3ITVbiha5j+3jcZ9pJ0I8hdSba27q+s5+iUK6v9WcNCopr/0xmF8SW/3+Ggvl7RsB2xmAOh9Gcl8Tyw5Hyy20DdxihZFN9Sry2nKevQ7mLYNvUP62kOkf0+pMxfUQaN/+gSdundOb+o8FD/mmrjOe8WPG/JmBE7l/AOlBsEA6pdebA+CjrDynuaLqUtjNE1xZpJ5yl6N+KG+vV2lX9qJBn56UWSeXId6+pOZ6wRB+0IpOo+k7UdwNgcf1PHLKL+fpbNbn1Cv1KUqbo3j1pfcH8ylEG/QAmL+pLp0tNRFkQA/yHDsE0xZEqWYMriCVdE29aROQH9F4KBsConi2m30njmcw2pPCvwp1+d06UzqI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(2906002)(82740400003)(356005)(8936002)(5660300002)(41300700001)(44832011)(4744005)(426003)(47076005)(36860700001)(86362001)(31696002)(83380400001)(70206006)(110136005)(54906003)(31686004)(70586007)(81166007)(40460700003)(82310400005)(336012)(40480700001)(478600001)(316002)(4326008)(8676002)(16576012)(53546011)(186003)(26005)(2616005)(22166006)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 14:01:34.0762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c969fc-3648-4ae2-67c3-08daecc9db87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5042

Hi Andrew,

On 30/12/2022 01:38, Andrew Cooper wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Preserve the artefacts based on the `make` rune we actually ran, rather than
> guesswork about which rune we would have run based on other settings.
> 
> Note that the ARM qemu smoke tests depend on finding binaries/xen even from
> full builds.  Also that the Jessie-32 containers build tools but not Xen.
> 
> This means the x86_32 builds now store relevant artefacts.  No change in other
> configurations.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'd prefer to keep using "artifacts" and not "artefacts" as the former is what GitLab uses
and what we use in build/test.yaml.

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

