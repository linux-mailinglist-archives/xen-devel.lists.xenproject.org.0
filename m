Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62E482E069
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 20:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667552.1038932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPSFH-0000ND-51; Mon, 15 Jan 2024 19:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667552.1038932; Mon, 15 Jan 2024 19:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPSFH-0000K0-2N; Mon, 15 Jan 2024 19:03:39 +0000
Received: by outflank-mailman (input) for mailman id 667552;
 Mon, 15 Jan 2024 19:03:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghqi=IZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rPSFE-0000Ju-T3
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 19:03:37 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7a46f25-b3d8-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 20:03:34 +0100 (CET)
Received: from BY5PR17CA0051.namprd17.prod.outlook.com (2603:10b6:a03:167::28)
 by IA1PR12MB8240.namprd12.prod.outlook.com (2603:10b6:208:3f2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Mon, 15 Jan
 2024 19:03:29 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:a03:167:cafe::82) by BY5PR17CA0051.outlook.office365.com
 (2603:10b6:a03:167::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Mon, 15 Jan 2024 19:03:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 19:03:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 13:03:27 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 15 Jan 2024 13:03:26 -0600
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
X-Inumbo-ID: c7a46f25-b3d8-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoW7iQz50aF9HRTfYwANYoPTFuJhchdv8GzXL3Kx33aXMvL3dqsOD+3QfpLsUdwXrE9Om5jwj/9wg/DobvaosvE7jkInPCEW7z0zgft4XzKaH5ztMPfAExL9cGR7hI8XswB7C19T1C1s9d6KwIAtaSgjlriNh2qeD8GYp1VDxsETmjXt5jVom6yEJCUS7eo5oQMC1weR5a1VdJ/3OPMAaWDaIgjkWMtHVYb9aaNJN6NeRw7I7Eswcxsm8flCweGRXA3aMqwZxezWoPE0UjWJfjy5cHxXWoVjp2ueHdlcEaJEU9Tq2ThV650GUcA7oPUIbK4JDkN3hTYVV1wIo1f4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VV713wtEQl2T2nzjh+f3k8gUYFwCuB+tqUdroNeowc=;
 b=fscSGl4jet4YajLnjdX57pQxfMNTgjSWrY7t+JCoMq6aYPmX8IbF5bOIeOit6f6/uyjIQ7M5NoR5CdT3q9FNjIhYUVlctCUpihIEqd5AXwQVMHm7J50ZD9pLTz9OBQ/VFsqO/PX1fAElwigzDrTonvKNfX4EsFpxvzvrsHxJW1pRdS19kp96GxBtOn+G2vxnY4YKM1kZJOYjZ4go/Ku1FkBr+X3cxooDumaRXCWBD8Ou1Ybz8C3Fi2PyaVjvc4mhsDgcxn+WW9fR2TzqiumxRyt1ctan1LYKnNI/K0aFZzDMVlZvjoayThbcpwQf8jzeznauYURwDBIywmSXM7pZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VV713wtEQl2T2nzjh+f3k8gUYFwCuB+tqUdroNeowc=;
 b=ehhjVZsP8bmdictYtrhcS9WOKvKOLYWADwbfW8t0oDB0AL69veRUnbDYxKIzIjSoDKiHkxwNmdiEI9T4r7NRR3LhSUBQoDn9WxwU7iefPSKlzZ7LgXmIrkX92ccplsdupEE3E6gEORHc/dJwqZEyNr0sGmBWF+e87mw+Q1uk3yE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <649ac8c8-6554-466a-a4fd-4ffd612d0756@amd.com>
Date: Mon, 15 Jan 2024 14:03:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/15] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-10-stewart.hildebrand@amd.com>
 <ZaFVhaVvpDljEgdM@macbook> <2e2bc9b7-f0c0-4924-89f6-8717e10266de@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <2e2bc9b7-f0c0-4924-89f6-8717e10266de@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|IA1PR12MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 068a1271-af83-4b83-2555-08dc15fca8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i8umBLD50AxJ8NOc/PaQ8SOHxhyvJP0i4dUE1xVYLZkhySz2LmquB1GrnzWueYg0wn0HGncljX0Ze0ZnU3XeanNDGO+l8lcnGk4B94kcZ67Z55+U3NckMDEAkl36qvAVVHd2m33zQmx4+EIk5y9t9ed6siprnGkHtkrvO9Ns35CB/WaBYTZJnLw7McXJe3cHWh1IRNvgIjn+0N6iK9bRV97xsVBK6kpuA2etj4rJP571dIWb7OBCbSp8Y2QLlRZNPGhfHxqR8Hqtw1FxtTE9tTZ2p2w3rM+rgpvtq1krK9A58TOp8x2MG6HpnP6kgFCbPSSH5TOae3HVJEey3QE/v0se4HCsgtqPvgWZmFj0DKY8OaBBXZXmUZZsk/WGtYnff8GKFwtARMoUqk1IeTJW8J49RXJMC6Y8hzDdwNdZXTum0y2NgPXoXKmgMx3HbGjSS3QIFw7XMGWChC44uc9jZguR/rFx5Mh3E8EQS+s8Q6recDe2/hXc18aYtE5q/vkeVxmG2KFXWh41je1hbrcD+nMoTVq+lNZYAXe4LogWPvn9XBs1EjXVBKxs9VNcx7syFA579qtjRXmjGQjvEJm5hRp6DZTAzGuPcS1R42sYTX3MHrpnTWliMLkR7zkhpuz+htXhDgNUSBA5JEiSYcGmHi0ZFluoDGKt8+5v3S/clCYos+OsKM5P2BpdfuAWVzIPZoDmpH19L6foCuYgzlnckTZwuCRnxNLZ4wFs32Ghjb/4UGKQoMqCRXpEwntRA/2re3RLkV1HdZMH/u/2yScAyD6X7N5VCmBv+C5m2xpZT3nbkwOOuXFpSUMsko7YAJ28grbQp5pYWjZ9iYastOljqGLg99+lEi09HLl3mgrC4As=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(46966006)(40470700004)(36840700001)(426003)(2616005)(336012)(26005)(83380400001)(41300700001)(5660300002)(47076005)(31686004)(40460700003)(40480700001)(44832011)(36756003)(31696002)(86362001)(82740400003)(36860700001)(316002)(53546011)(478600001)(2906002)(8936002)(70206006)(110136005)(8676002)(16576012)(54906003)(4326008)(70586007)(356005)(81166007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 19:03:28.4585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 068a1271-af83-4b83-2555-08dc15fca8a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8240

On 1/15/24 04:07, Jan Beulich wrote:
> On 12.01.2024 16:06, Roger Pau Monné wrote:
>> On Tue, Jan 09, 2024 at 04:51:24PM -0500, Stewart Hildebrand wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> +        /*
>>> +         * Make sure that the guest set address has the same page offset
>>> +         * as the physical address on the host or otherwise things won't work as
>>> +         * expected.
>>> +         */
>>> +        if ( PAGE_OFFSET(bar->guest_addr) != PAGE_OFFSET(bar->addr) )
>>> +        {
>>> +            gprintk(XENLOG_G_WARNING,
>>> +                    "%pp: Can't map BAR%d because of page offset mismatch: %lx vs %lx\n",
>>                                            ^u
>>
>> Also when using the x modifier it's better to also use # to print the
>> 0x prefix.  You can also reduce the length of the message using
>> s/because of/due to/ IMO:
>>
>> %pp: Can't map BAR%u due to offset mismatch: %lx vs %lx
> 
> Or even
> 
> %pp: can't map BAR%u - offset mismatch: %lx vs %lx
> 
> ? 

Using # that becomes:

"%pp: can't map BAR%u - offset mismatch: %#lx vs %#lx\n"

I'll send v12.2.

> Note also my use of lower-case 'c', which brings this log message in
> line with all pre-existing (prior to the whole series) vPCI log messages
> starting with "%pp: " (when not limiting to thus-prefixed there are a
> couple of "Failed to ..." outliers).
> 
> Jan

