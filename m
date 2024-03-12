Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B49878D64
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 04:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691627.1077828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjsTX-0003Th-6L; Tue, 12 Mar 2024 03:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691627.1077828; Tue, 12 Mar 2024 03:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjsTX-0003Rg-2O; Tue, 12 Mar 2024 03:06:47 +0000
Received: by outflank-mailman (input) for mailman id 691627;
 Tue, 12 Mar 2024 03:06:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Msr=KS=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rjsTV-0003Ra-MY
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 03:06:45 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d05a581-e01d-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 04:06:43 +0100 (CET)
Received: from MW4PR04CA0246.namprd04.prod.outlook.com (2603:10b6:303:88::11)
 by CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 03:06:38 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::29) by MW4PR04CA0246.outlook.office365.com
 (2603:10b6:303:88::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Tue, 12 Mar 2024 03:06:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 03:06:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 22:06:37 -0500
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Mar 2024 22:06:34 -0500
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
X-Inumbo-ID: 8d05a581-e01d-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8BkrzFWZEd0o+tqV5FdVLfeJaMO4SEW1LIe03lanVK+nAt6cV3rsfQZRGLiy7n3VUCModkGLQyFB4T38FFHhh1QL2YrlVMgawbxfNYwcPPwPCeKR1kiXQf87Qwn5iE0y7O0j3pIGTsSiXWI1LQc7p9cCZw9OJ3HBX+TJlZPnBHEfNU3tNSJqrHyQJVLY2dWRtOSxSHjlab3LYxvVhFfpQJe1+qtANRBnmAdEp8Sqion2I3vZ8fl+J85zabde4E2LV6Tyzg5AJDPhI35MJjemLEsC4HhkKnpr2/4Uqdr67ukMG1G/iMj+blG+/K8/eM+Fp1C7batxzpAkRBGWc1gBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr+6X7xSWaUnvmFFO5ZiabKYnnYNP0V6W0IAmustyf0=;
 b=iz/523KXuauK0OV9hNG32E1xlCtc6CRA05oSHeOC7oPm35JEz1kp2xPfy2G/i+ultvu9PmlMx1iq+2TdN5iRknGwFVtx1S17CwWznAcW9svIGsaP7Y4HfqL066IuSGUeU80oluY+KGIs7570RHywghA50iyV4EuemKnZmbNDDSUl6//L8xNrItrsqktv1kxuLXkpSW552ysc8zwJSlae3n2Y5Zt8WWO+L8TS36NdFo7DSR71VHg0zMajDSGo/ap3pmtsu/yycduy/zq7vQZJ0lMLaQz+xSDPFDTMosYnng4i2tDkEia3w9B34J0TcxUVJL/Eu8G7gUr+bJJX+97q7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr+6X7xSWaUnvmFFO5ZiabKYnnYNP0V6W0IAmustyf0=;
 b=VR6cGT44B4HnQoYgeHydKmH+dZiJXPVShww7fysvIuIz+RpZJoTgEaWXZuhGYrMRWG2ESWCLbjnjqYE+xq2i/yH2BfpQ5JDoA6F4T/HgsO6oYO3SLd/kTelclvWth2KguAubANo6ywC8kkOy5YjRZdydqRDOHCuMXNdlUz1qglg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <76180f81-3969-4587-b91e-cf9bd7d2e888@amd.com>
Date: Tue, 12 Mar 2024 11:06:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] xen/domctl, tools: Introduce a new domctl to get
 guest memory map
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-4-xin.wang2@amd.com>
 <ef01a9fd-4825-4430-9c20-62277e1b2114@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <ef01a9fd-4825-4430-9c20-62277e1b2114@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: ab888f4a-7ce9-46e0-e9f2-08dc42416f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gSw7pWihXcP60cfNN96I4ptbQAMLt+jm/50D1gNwVnnAQDfHrpc1vYNfPjf/CQHbWBt3psnJrz1TNBeGuW3c/14ASh/WMgKY5jMIt2UCSkDCgF9q+BvzErXa87t+5tlwmj4vVoVMQUU1w857Bbvtkh6GiIZQf4+7DWBCGp2AZcdKCORcNY3HMbT4mIYhBMTX+8XJNQQRyT/S/nIXTqnemQn8TIjbvCRnln9eTdjQwxHmHx6RoucbpfSZ+HxZqkJbkC0ua8EJcUJaINE3wfGNRIeQGVBmBTH/435rAnK5kdX5IJpe1Nib78AVlcHHvvdMmGkzhZHFqsNvCZHqoUcg/lFHAro4tzgFgh3EZ2sfKiV+gm9hEoZi/r50GRl2rANUNQ0jE4+SK8yVCc0OF8p1XO5CrNzRH8KsYqGtVnzteXrcy//ZXrv954XG7t6W8EkySoaA/tRo+kcAYW1+tU2LCbV6+v9aaxssOoFZgdKqupnKTu9W+/peUCeone3Xdtg7+EubUYy28xW9CVbtrdqV/aTrm6ObMORBfbOFLoE5N47UrdMNCP0QY6dMtIOKuQTQH9Nkk2t/V5qaP/yc5KU90mvnHoldR6aIMRJXc6XYgAQTIMBoh98E4W00t5sShwQvL0uVMq+UqedzhSE/mZRgqrORUsBn6Ov3KHo19Q0KcNZO1r9NxVygnvFE0XCUYofG4uVHIprpEN5mCO83FOqG8MEvaDuCQS4UwPeqsQmD0NARuHKXl9EsjFDfFQYE9FDp
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(7416005)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 03:06:38.2769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab888f4a-7ce9-46e0-e9f2-08dc42416f1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103

Hi Jan,

On 3/12/2024 12:58 AM, Jan Beulich wrote:
> On 08.03.2024 02:54, Henry Wang wrote:
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -946,6 +946,25 @@ struct xen_domctl_paging_mempool {
>>       uint64_aligned_t size; /* Size in bytes. */
>>   };
>>   
>> +#define XEN_MAX_MEM_REGIONS 1
>> +
>> +struct xen_mem_region {
>> +    uint64_t start;
>> +    uint64_t size;
> uint64_aligned_t?

Yes this makes great sense, thanks for catching it here and ...

>> +    unsigned int type;
> uint32_t and explicit padding (incl checking thereof) please.

...here and ...

>> +};
>> +typedef struct xen_mem_region xen_mem_region_t;
>> +DEFINE_XEN_GUEST_HANDLE(xen_mem_region_t);
>> +
>> +struct xen_domctl_mem_map {
>> +    /* IN & OUT */
>> +    uint32_t nr_mem_regions;
>> +    /* OUT */
>> +    XEN_GUEST_HANDLE(xen_mem_region_t) buffer;
> XEN_GUEST_HANDLE_64() and explicit padding (+checking) again please.

...here. I will update the patch accordingly and add the padding + 
checking in v3.

Kind regards,
Henry

> Jan


