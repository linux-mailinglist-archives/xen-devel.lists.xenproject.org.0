Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6DA73DD8A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 13:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555447.867223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkRU-00005G-5a; Mon, 26 Jun 2023 11:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555447.867223; Mon, 26 Jun 2023 11:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkRU-0008Ty-2w; Mon, 26 Jun 2023 11:31:36 +0000
Received: by outflank-mailman (input) for mailman id 555447;
 Mon, 26 Jun 2023 11:31:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tM71=CO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qDkRR-0008Pa-Sv
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 11:31:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffc6d0c0-1414-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 13:31:33 +0200 (CEST)
Received: from MWH0EPF00056D12.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:15) by IA0PR12MB8206.namprd12.prod.outlook.com
 (2603:10b6:208:403::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 11:31:29 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::204) by MWH0EPF00056D12.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.11 via Frontend
 Transport; Mon, 26 Jun 2023 11:31:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 11:31:28 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 06:31:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 26 Jun
 2023 04:31:27 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 06:31:25 -0500
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
X-Inumbo-ID: ffc6d0c0-1414-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzBtjwu+0/ads2SvWFBzypHxwONFL7p4Vdxw+nkQVPwB5SZA0ZXV+vC1V643ZPvtD6mtA//mK8qg6bHgti0GxBoj3owGXIrZyzOl/EosSutpX2ySjGi1NDvsH9DbVMRkzi7QnBMp7Eko4ju7elSoUMSWtzRzQ+A4v2teaWvJy//9MH2UHgoKCPX+CSF2BjMQOOFkbmL6y7GXBMmS0fqRZrRoqoTsRUd6aCnS/Q+YMOjLcRYo1HYT8CN7JHb3Sc8biqK1SsrM17FOvqlqcACOxA8kBXvUSiY3LTuwLLMwKClI0frvMAFSAp6FSeIG5T5CPpzxvdx5LNpYg4j6+t2L/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRzXEuCdUF6N9Cf0yuaoWMNHh8QNFwi+UQgq+EnFytA=;
 b=FfPgIekGE8nyrE7aO6ifvOA4gp+qJI2wrGnOf4GQfVMTcrFLGr8RGSCfu4+QJv2MBkckPeSnarrJrUJ7nvpcOZjBfqmgo5R3af0hNCLoddgZkWjYyBb7otGNhF3N+kPQlHcPX489Z973+8pA7qD4SMDY3yWk/c01NGy5C9rd1EKjjmNp3tM2ze4abuIwbDobnOmX8inhRSi8aNf5se4SIJuufuSJXX/qEiV9ZBjvgbRNwB7mxSUgW+tC+fdIB/0mpELMSpil0oc+YYnf9m40lzZMe/yK/LHdI81/BgCr/2HDxDrnSzFsWd5wZAhzAyFvA35IbdV/IbvIsjNEqeYqiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRzXEuCdUF6N9Cf0yuaoWMNHh8QNFwi+UQgq+EnFytA=;
 b=OxY26xYccQYTMUIDQF6dExPP/wenvhsjiSFd+7BWYeXOvlfRid87Q5g5gHLeXTCHRnRo3GbOWeS3KsfT7gy2wPjRsv57tKgbCzbZkijWEqo15ZDPLht3XJ9Ga7RiKelfGWlMYkYQ9M/iKb05v53QNZ/Q9YY+hycWAzdfyWQgS0w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <dd08c26f-ffca-e1f9-499b-fb191b51462a@amd.com>
Date: Mon, 26 Jun 2023 13:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/9] xen/arm32: head: Remove 'r6' from the clobber list of
 create_page_tables()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-5-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230625204907.57291-5-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|IA0PR12MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: a09fe06c-f86b-48a8-eb2e-08db7638e1ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7fxQ2FDYswm9rFW4xYNTMY7xFO2ZJCJ0iMuitAUOGqbcPkEm9uzh5pBy8xl9ipThd61BZhVJjr0VYCYGdT8KIYhk33eTcS8ohAKPXVnl62pqoGgfJO1N5nf+YoDfB9ReAvA+SSLXgPcqCwkCMsgfaEGxpYZFwA7r2kTDJopgS7MOnBIRJkZc7/f+WJ14nLszFftq/Qzt88vvjExbQS27EvE3us5fP+1LypwlwOWAjh9ZWkEl58cSn1uuJfYGmeC4un+d9BU8IHzoHx0xWftt+WYCrAYWJpoFmJdx3eGDoun+rcM9zYKv0pi4hP1BJgY/qrUKZjX1ZZIPssNAP8gsUDe+9Wx+X6la0QFvgWpAEFxJKnm0+udXtZKVuw4RjUcraEdbQ9IYb4h5PpPdcoeXTz4IRviiPUNw1JHUJT1c89fVoI0/OU+qhpPiwqQ6nBrtaqGfJt5aOGUHtPlCJQ0eLKfkoVVinlGXBX5W1rSpTZ1DNkHbbbPm7lhF6OZ9E0i/bxa9+goEWHo3CiRpCVtpQgFQBIOaSLA5hCczlAKfSJNFNO4VV/JIQVR+gHNxRfGYExzmyVX1RgbZPTw+L94LHgToWOx5pbvn5ZSBezS5b10GhGcTINUlTblAXfJZmcX5Se5dfQJ8bW8Fm/+Q4kjXtjyuDfjwSIlD1cSxzVEy+s7l5YWfjfijKOy1eYXe1AutAfH4zim1JcAncBtD4kb9Of12WlcemiCNnOoZqYiKuz4G94yC4ac1L+M4TZQVVt7EkTQw97rCZxAocXjXlKuOJKf+lwfRrrF1d3AU3FhfkUMkQmwQfQv6+q5iqY3MnxTh
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(47076005)(110136005)(2616005)(54906003)(478600001)(16576012)(426003)(336012)(26005)(53546011)(186003)(4744005)(2906002)(5660300002)(44832011)(356005)(40460700003)(36756003)(70206006)(31696002)(70586007)(82740400003)(81166007)(40480700001)(8936002)(8676002)(41300700001)(86362001)(4326008)(316002)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 11:31:28.2050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a09fe06c-f86b-48a8-eb2e-08db7638e1ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8206



On 25/06/2023 22:49, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 62529f16c8a2 ("xen/arm32: head: Use a page mapping for the
> 1:1 mapping in create_page_tables()"), the register 'r6' is not used
> anymore within create_page_tables(). So remove it from the documentation.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


