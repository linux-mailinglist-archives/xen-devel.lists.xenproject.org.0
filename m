Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D2C532F3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:51:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160175.1488383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJD88-0006GF-F7; Wed, 12 Nov 2025 15:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160175.1488383; Wed, 12 Nov 2025 15:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJD88-0006DN-BT; Wed, 12 Nov 2025 15:51:32 +0000
Received: by outflank-mailman (input) for mailman id 1160175;
 Wed, 12 Nov 2025 15:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onbl=5U=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vJD87-0006DF-7v
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:51:31 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73111bb0-bfdf-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 16:51:28 +0100 (CET)
Received: from SN7PR04CA0042.namprd04.prod.outlook.com (2603:10b6:806:120::17)
 by PH7PR12MB6468.namprd12.prod.outlook.com (2603:10b6:510:1f4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 15:51:22 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:120:cafe::a6) by SN7PR04CA0042.outlook.office365.com
 (2603:10b6:806:120::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 15:51:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:51:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 12 Nov
 2025 07:51:21 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Nov
 2025 09:51:21 -0600
Received: from [172.31.139.223] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 12 Nov 2025 07:51:19 -0800
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
X-Inumbo-ID: 73111bb0-bfdf-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYdAOyFE+BJWMoetwofGts653UC6eVTlxsVeyHKX3jYH/tT4tu3lxOU10Zay8PG5plgH2NbzmH/jFjuyzgVDTtvtGTNFrtQ90UGsgEaQyFMpmeP4k07K0YbNRCsozNfkHaZ+fXUjkVXLBcxh7BSov7MG3wCckvVF81cwsAUixKCaIo2EXcQEFM+hSQBzLctgBw/zZK8pqR1NgbUSfiXCE3eJw9mi7U7pJfvgbR95ON0jYLCRnMqt2gXh8HvAqtPfmcKNv/+PVknJDf9VdeEDHsvA8dz6EpfE7ZwbtYUNNJDXu7wM/LRTx++8VP68vZiv9pnzuN9vJJ6jVIGZttol8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhOhxZSzbM/DBiNV0hItvRWwAI0FPi50RpxqEs3zpSk=;
 b=pLT89I49hdu2hdP3xO0QAy949YSisl6ZfmduHgHTchLu+GJFyZkWvn3TrJmSrlDdcRmyqOFYIsOthf/WXdm/XIH+eAVahJMRDNCrsFSjW4+/7lgI08k8UJhADPTSKmllq7+sraLb0zsxRuEY13LOjr14MuFBdNB6Tzi3qFpX9jSVqoeJ1znfRizhZ+UlbHrMVPzeb2GrR9GYz92IaJ/vLqMV/Go3mgE6swO1F5aIt1jh1gc3TnrMJdD/SG7bwYFv6R9hqRSmjx3UxfO9YQQu8TwKC05YNbStdDTBJZU4BV9lykdOR105lLOnlD3kpdgmT71tdhY9PDd1GkUOyLqVZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhOhxZSzbM/DBiNV0hItvRWwAI0FPi50RpxqEs3zpSk=;
 b=yXwhNbkOcmYOjqAz5kx+qWK7dMkP6yc4zDPmON0YY4y1922txeMO++z7Q5lAkpD4bzlSk3MDP5If399GVFf+jHHj7qPlZwOq+nkVB57c4CbIx/uHfJViTg1AuK8uYUDUpkLMB6ah/U8Dj5yfjig7WeUBiDwrgra6mcYfgJnwMq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8b9d7300-ef9b-497c-b6c7-3922edbb7f75@amd.com>
Date: Wed, 12 Nov 2025 10:51:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Frediano
 Ziglio <freddy77@gmail.com>, Demi Marie Obenour <demiobenour@gmail.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20251110153707.84879-1-frediano.ziglio@citrix.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20251110153707.84879-1-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|PH7PR12MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: aedf1aa3-461b-43fe-7683-08de220353cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y210aW9iSlJsaWtoaHpGeThvMy96bmthOGNhOUdyY0h3Q3NLdW9VWWtFV2E3?=
 =?utf-8?B?NlI3alhTcEI2U1hvZUd2eG1RU2I4OWVOZVJCeWViVmVtdlk3OU13UDRwMWhP?=
 =?utf-8?B?Q1Rna21mUDEzdTIycTkvejJGdmtFR1h6NFlLSDFJV2x3bElNOUtPbHg3WGU4?=
 =?utf-8?B?Q3dTOUNwSUF1MXpnMEJvSTJaZXI0S05mTFF5VEl3RDEyTTFBK3NVMjlJQWc1?=
 =?utf-8?B?SUpKS1BBQTFNNkg4ZTJyak9Za1ZHRHpUS0VKeDVBL1Y5eEZsTzR1a1dqaE9B?=
 =?utf-8?B?VDVTM0I3a2s3VHpoUDV1OGhYTHFqcWZxMDhiTTg1MHBZbllKQUI5amg1UE5L?=
 =?utf-8?B?aWdtMVdFSHpwZy9WU2VFbTYzWWNEdS9xZ1JOdElYdDdlYWtXMGZwSTZGN2VH?=
 =?utf-8?B?djl0MzRqRzdCL1dmcjlkTWFhelJYWURVNFI1YmhKYVlvdGdQT3BWbDY2VGlL?=
 =?utf-8?B?OGlrTTUyWXZZNWhvTHNuQW9lalBDYnVxSC9WN1I0ZVUrb3N1TmtlbVlvQUlr?=
 =?utf-8?B?RURmREtOWHc5S3EzcklZOW9GcGhHSHVPdk1LbDRrMkRtQS9lLzFvbFBBd1ZD?=
 =?utf-8?B?aDJ1SHE3M281OHVOSTZPQWduZzIyS0FLOG9CbG5WR1YybDlkbHQxWnNEbmNP?=
 =?utf-8?B?MHBCRWV2Mk54ZUFUOUxxS0xja2hGNGhscitRNVV3aXpJbnNiMTFlVGZHaDlW?=
 =?utf-8?B?d2c4Wlo2dldTYXRsK0NJaU9YN3pLT2RxT2xVVG1RTzRuQmRTejVzcVRuT3NK?=
 =?utf-8?B?NisxVnVCQVhOQjdBbmE4bWtMYjRjUEkzV0Y2cWFRdXZrbjltdWNjdGtYNXBK?=
 =?utf-8?B?R0U0N3JROEE0bWdaV2FORmNQRlArTEdDdnlURHArdkRHVFViQ1hJNlMxT20x?=
 =?utf-8?B?cTFUMElMQjlHaTNTYkJlV1RDeGFmU1hsUnA2SHozcDdMVDJGeEJyUkRlc0Qr?=
 =?utf-8?B?TzU2M01Gc2ZLUFdJdU5DMHdpZDd6SzFxVXVtUHBWR0NUaklLbkZjZmxUL1lF?=
 =?utf-8?B?bjI1NGt6RDVoNVk4NWZDbHhhdFJNVjVIcjk3NGRYV1lIbkFmREpTUnhYQUNo?=
 =?utf-8?B?Q0NScktIbHVsQlFvSXUycWRHcWFwb2pOV0pQT3I1OWN4QzJNelk2dFZkYlVR?=
 =?utf-8?B?ZGVDeXVhTzBmbTN6WXpsYVRtVDZoTW9zWlY4RnEvdFliVWpYekNXVE9QVWt3?=
 =?utf-8?B?dlJNZmlSYzJLYk9EczVQRTIyQS93eTlqYkw5RVdldGlXM2VmU0gzM0FCUjVi?=
 =?utf-8?B?cEEwelZSVDBZOTFwZUlzY1ZranI4QzBXeW1sS09VR1VZQVVGYllaZzljUkV1?=
 =?utf-8?B?V0tnN0xlWjBRcUY1M0hERUZMNjVXeWF1ajRpWGF0eUZFSnJyRHNOV1pwWkxl?=
 =?utf-8?B?SE5Sb1ZTb0lxYXlvaHVsNTRvVUN4QkJhV2VnY0JOOU5OcVVwREhaSlJyVU5i?=
 =?utf-8?B?ckY1QXYwMkpPeURRTU5BL2lWOW5td045Z29RblBzQkhBTEZyVXJUVUtrdVJV?=
 =?utf-8?B?MHdrZlRRWHB2alJDcDlnblR5V3E5TDlkV3ozNUZhZ3ZiNTBoTGlaUFMwM2dZ?=
 =?utf-8?B?bEVmOWlDbXcyR082OUNGTnpXYW1ZVU44R3JTSGxuTURuTTJPTXRZMXlmeitW?=
 =?utf-8?B?Tm14SnROSWJnSTZqRE9LeHdmTGNEQllUU3Q0ZjZRcjV3Q1ZLUEhJanA5TWZy?=
 =?utf-8?B?cVdpdEQxUzlSLzZnL1VRR0ljVXFjakM5cVJrK3ZhRUhjTFpjWFFhSStCSWly?=
 =?utf-8?B?QUJFOXNiZ2RPL2gzODB2MHhQNG0veVArM005QVgxb3MxNWZMTmk2RFlScWF0?=
 =?utf-8?B?Mjc2UWkzMmt1Z3ZLbjhHS0tZME5iUDlBdkZDcWlycVJuWDNLbmZ2bTFhNUNM?=
 =?utf-8?B?WFJ1M0c1NVZDTXB3SXJxVjBXQWN0VzBxdFVtOWt4S21NSk1nTkJ6eGNhTmJl?=
 =?utf-8?B?OWErZnJtT2ozcDZNSlY3Q3d2M3JEbGY0dWFBUzg3aktIdGJrM3IrSUxtcnYz?=
 =?utf-8?B?ZDU1Y2tUMk55aXJzMlZQbXVTbG43WkpIUXRpZTZSQ3EzVHBUK29EZ0hzanAv?=
 =?utf-8?B?alRhNHQvZzQ1TTZCMXJxMndLYzdLTkVUd2VrZE5kbGtjSTdDS0xFRWtmb0E1?=
 =?utf-8?Q?OLR8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:51:21.8846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aedf1aa3-461b-43fe-7683-08de220353cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6468

On 11/10/25 10:37, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> For xen.gz file we strip all symbols and have an additional
> xen-syms.efi file

Can you add xen/xen-syms.efi to .gitignore please? Or perhaps change the
existing xen/xen-syms.map to xen/xen-syms.* ?

