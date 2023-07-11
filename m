Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B674F816
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 20:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561852.878426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJIHM-0008Ma-1i; Tue, 11 Jul 2023 18:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561852.878426; Tue, 11 Jul 2023 18:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJIHL-0008JG-Uh; Tue, 11 Jul 2023 18:40:03 +0000
Received: by outflank-mailman (input) for mailman id 561852;
 Tue, 11 Jul 2023 18:40:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e9Pp=C5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qJIHK-0007qT-F4
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 18:40:02 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56829af1-201a-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 20:39:59 +0200 (CEST)
Received: from MW4P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::7) by
 BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 18:39:54 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::65) by MW4P223CA0002.outlook.office365.com
 (2603:10b6:303:80::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Tue, 11 Jul 2023 18:39:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Tue, 11 Jul 2023 18:39:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 13:39:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 13:39:52 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 11 Jul 2023 13:39:51 -0500
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
X-Inumbo-ID: 56829af1-201a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+G17aqSaUlumij63/FZ+tbsK1ve9YfIxEP+00AN4GNqkdgYWw9deyaqwanOiLiFZaRjs3oGMvYd7ah7owxwtYbNR4HHhcDd09h0verKzcV0c4Pa6T1HhNDhBPY/hQV/WYMsys8IvJT8WVbPxpbIiSljQMDYCby3ut42ZG05EI5LbgLrTlNoELf6ix4k1KZj6gJ1ErRn5/eZISE9D8Wet5HvqQpbPl08EHLIKo+ugnDY0nlN6jTVI0JeCUoIbQCfTnHUzcKB/IPDEFey//K56MMrtPgyTLLTJZH3Opka0G6CZjdwDzdr/feb1x5NQkjz6uqaafjx9LDECOX0maq8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx8DOHT2p5MU8kS/X9RGeA2+Wmz1iLb+nZoRNiHb5d8=;
 b=RiW9kwOZXf64M73QMvn1NFiL8jaFYhfSt7alTh+7hmEhZ1ByeWyCpODdQVeItPeELuqt2FGmSDadIylLGJq2DYw1bcijFPhpnlERzBnHCfA5eUOb3ksftL8+JfBPmxS38SuxtqeLQSTflyYWvtna7mHhOe6NwAnlfiet/lJXfx2W9zWJazoquLVngUqaMmnpUqqHa/qyJ8BTVCrSq3OOn5UzPduC7wXPekAJGSQJD1nTvo7Mz/j+6ZdE2Rr0vziegAkPF2lak566DeyxtsX1gXC0FSjUYcq2OK+d+i4IStenrqOWaGbPy/xmk38rK+DxaY2H1BwCV6qSwsqtbLQAAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx8DOHT2p5MU8kS/X9RGeA2+Wmz1iLb+nZoRNiHb5d8=;
 b=D85UwZhrVib9zooTChcK4GR9YZe8b1XIx9T52p+/Tw/1SQtA1/xBJrzKXT30w2XRVWm/O4qJDCYMkBoJMHyjqfRljlnpShm+CT2ORqOXO8aLAO0cL7o+RogM0HBcNinC1KLVGLSWHl1r/0WEfmXtr3p69Vfp36h7pDcfqKtvPXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <911710f3-8462-1178-9ae6-3e71df228f18@amd.com>
Date: Tue, 11 Jul 2023 14:39:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] xen/arm: pci: fix check in pci_check_bar()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
References: <20230711154648.729567-1-stewart.hildebrand@amd.com>
 <da7a0268-57d6-74ad-4f22-80ca8a0a5f3c@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <da7a0268-57d6-74ad-4f22-80ca8a0a5f3c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT031:EE_|BY5PR12MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: c065e295-6978-47a1-3864-08db823e37a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hBhSUU17sOGHmtP9bZaAiy39lxaIQbegRGc4XwxcBU4kfG+eVx9ARHxu+L7AsCVWKsq4mEzMPeuO8zfUgK5TMWFa8MeKkSAFjBKQw+sATOTJ7kxDW3BWyCY59XDO5rs2JT3E9vhrYw42KdGpMUYU/Eq96bTIJipuX7HpxpHAUUw2M5HCkrfw6PN7QY+KhB4uUTUR9bLz8BCd7OCcsXEFoCTQTxeYmlvAlvH0MhoEIXQOKFzyMYUGTEheZ0qoP1Dcak9nugzLMlErifCNitr+JeiccGSeuS1mQMHykgvn9+rYNzUsuW3/DGW5gJFr7FRew6qRTSfqVh6vcAaPOcymo/fPvWkCz15nm98suPzwrgwppDN+h/NWS+/s7w+H1bHzvYMgpNtJpMPUxwrNqPZ6GBdozTawbUoqt567LvLwgIQs8KZMoJU3wsa6hnd5JfBd2TqewU0aYVIOQGiwnsyf1jFAfGfxZgKG3avZfBQrLHdMMpPd031cZB95n+ddbIq7XE47+QV7iFB/KSSRx/8NakzNHDXaZuXbNDCihQc6KhmgikoFlynVUyQWzssJ7ppGrSqlrk3wPMPMXFt/2b9Zb0m0gyuuEIeTQVatnr/oLnTOF+3fVlMqLlHGk/tJtcWqkbl0cO3eh+go77EDXk+Twsml3IV82UOi59QcQmjSiUdITs6xcht1U7l7IdcOVaC5G6aYYBdnQ5E/xTjcnhDqL1DVwwfVf8I8uyXX+bf1iLctpNCQ5NKAMxmiAvXH/vHo0GIw37Rwwr58abV8tr9P3nabaTCQwfJCY0sEuXFo4dOzS5S6KqYN9WDONE5HMicK
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(86362001)(40460700003)(82310400005)(8676002)(8936002)(186003)(426003)(47076005)(336012)(36860700001)(2616005)(2906002)(83380400001)(36756003)(5660300002)(44832011)(26005)(53546011)(40480700001)(356005)(81166007)(82740400003)(54906003)(16576012)(110136005)(70206006)(70586007)(4326008)(478600001)(31686004)(31696002)(41300700001)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 18:39:53.4693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c065e295-6978-47a1-3864-08db823e37a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084

On 7/11/23 12:10, Julien Grall wrote:
> Hi,
> 
> On 11/07/2023 16:46, Stewart Hildebrand wrote:
>> When mapping BARs for vPCI, it's valid for a BAR start address to equal the BAR
>> end address (i.e. s == e). However, pci_check_bar() currently returns false in
>> this case, which results in Xen not mapping the BAR. In this example boot log,
>> Linux has mapped the BARs, but since Xen did not map them, Linux encounters a
>> data abort and panics:
>>
>> [    2.593300] pci 0000:00:00.0: BAR 0: assigned [mem 0x50008000-0x50008fff]
>> [    2.593682] pci 0000:00:00.0: BAR 2: assigned [mem 0x50009000-0x50009fff]
>> [    2.594066] pci 0000:00:00.0: BAR 4: assigned [mem 0x5000a000-0x5000afff]
>> ...
>> [    2.810502] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
>> (XEN) 0000:00:00.0: not mapping BAR [50008, 50008] invalid position
>> (XEN) 0000:00:00.0: not mapping BAR [50009, 50009] invalid position
>> (XEN) 0000:00:00.0: not mapping BAR [5000a, 5000a] invalid position
>> [    2.817502] virtio-pci 0000:00:00.0: virtio_pci: leaving for legacy driver
>> [    2.817853] virtio-pci 0000:00:00.0: enabling bus mastering
>> (XEN) arch/arm/traps.c:1992:d0v0 HSR=0x00000093010045 pc=0xffff8000089507d4 gva=0xffff80000c46d012 gpa=0x00000050008012
>> [    2.818397] Unable to handle kernel ttbr address size fault at virtual address ffff80000c46d012
>> ...
>>
>> Fix this by changing the condition in pci_check_bar().
>>
>> Fixes: cc80e2bab0d0 ("xen/pci: replace call to is_memory_hole to pci_check_bar")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>>   xen/arch/arm/pci/pci-host-common.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
>> index 7cdfc89e5211..e0ec526f9776 100644
>> --- a/xen/arch/arm/pci/pci-host-common.c
>> +++ b/xen/arch/arm/pci/pci-host-common.c
>> @@ -406,7 +406,7 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>>           .is_valid = false
>>       };
>>
>> -    if ( s >= e )
>> +    if ( s > e )
>>           return false;
> 
> This is yet another example why using start/end in parameters are a bad
> idea :). I am OK if you want to keep the same interface, but can we at
> least document on top of the function whether we are expecting 'end' to
> be excluded or included?

Yes, will do. I will send a v2 that also addresses Roger's comments. For clarity's sake, e is inclusive.

