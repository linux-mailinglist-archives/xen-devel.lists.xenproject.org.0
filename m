Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AE47BB501
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 12:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613487.954022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohwh-0001Tu-BJ; Fri, 06 Oct 2023 10:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613487.954022; Fri, 06 Oct 2023 10:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohwh-0001Qx-7k; Fri, 06 Oct 2023 10:20:35 +0000
Received: by outflank-mailman (input) for mailman id 613487;
 Fri, 06 Oct 2023 10:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5b7L=FU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qohwf-0001Qr-9k
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 10:20:33 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eab::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa70ca72-6431-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 12:20:31 +0200 (CEST)
Received: from MW4P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::15)
 by DM4PR12MB5245.namprd12.prod.outlook.com (2603:10b6:5:398::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 10:20:21 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::bd) by MW4P222CA0010.outlook.office365.com
 (2603:10b6:303:114::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Fri, 6 Oct 2023 10:20:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 6 Oct 2023 10:20:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 05:20:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 05:20:19 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 6 Oct 2023 05:20:18 -0500
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
X-Inumbo-ID: fa70ca72-6431-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDq1IIisU52E8tYJ+jVRzEcUImEO+6hcwk0Dj4AS1fSrfDu4kNlsxeM5RSTQwJTim+OPX93+ZlzpkGVaXu33o0GVUCqfjM7ECIB1cJd6glOzQVpGRH40rnb0s90m0N0wY/5RtOo9CrmegUVaGmSrnvuS/vbjY/T2OtPRF9SFt98f+QizaYfeXDUv+oUMmg52i/RgK2wgtzgMaXKr3khtmogENdiS7oUQk6Iagag/PITLGviSxAQrkkMqDtroS0nCyJ/nKu6HTrsFcW1PqFeLonbudAbaldDweoBERzDF8NOBCv0U4EYSh6PSzCQp1exLy15q87hKQDBhCBS60jLdxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf9spSzX6T7isr+gGgZ8ccmitmtEI00f1YcZrkWAlxY=;
 b=l6CRlBRKiAuyU+vZipn6SRilp7dkAobQUhR44gBuG8YsCHyKQytRSwtlc1HwTLY11BDM9EGa9TmTYg55JciwlJkRNuV5p+JRhPAzT85JFLq74heduP4qYxbLeBPcHuw2Vz6bN/sXIxBZZpntt4s1x2ZiVghAgkhyblITVU3CMNEk3t0eYhC173WP2FHFFSTctHrPk7N01633YnmMRFfn3K0Yc99OB4xpFNuwVv5KpoBL6DzQzdqIvVfCvu6ZoNbOFsNihe7qtWBeYwH09x8ew1QVu2B0fiNlbRmUTFQbz17/zOSDw7NlPSqslVgtbtEuhQXvIbDmFtXjCVOgDJRvwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pf9spSzX6T7isr+gGgZ8ccmitmtEI00f1YcZrkWAlxY=;
 b=g+cSF93d3x4I24sMxXvLhJ/x53jIjuUmL/1SHSg+gIijxBXYwsfT/a8AOWvn8mwbjggTNPQkvCiLOHtLxjeUQ6rnX72z2aFZv0ORsK9mwZ4hMIhjUve7GbaUNOik+cWfK4L5ujqSTvvwBehnUZrKoCHHbRtiTicHYrOYi5uT1WI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <40878a29-d681-485b-8d58-0187ec586a2b@amd.com>
Date: Fri, 6 Oct 2023 12:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.18][PATCH 2/2] xen/public: arch-arm: Update list of
 supported hypercalls
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, <Henry.Wang@arm.com>
References: <20231006075142.9803-1-michal.orzel@amd.com>
 <20231006075142.9803-3-michal.orzel@amd.com>
 <b9d30cbc-255f-473c-974d-6dd262f22325@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <b9d30cbc-255f-473c-974d-6dd262f22325@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|DM4PR12MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: a113360a-ad69-4059-a109-08dbc655d870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5BEsBlyudFLgs1rMP+u1DhcH7r9shNG8GBJ0vp6tq4s1g1aw6EY7ESY2E+MbP53tPZVeQ/oYytI56Ub+jF4w5teqGGVCpwlkAgUSyo+J11kbGoGQCnlO0vGv3rlCnJDz//OEDjEwgGS/ujlkb0hnTiF4QBnwRwPAGNlgBglPi2imhIB03Kz5qRc4xEWGojQZU4v4QAWyMSvcTq5D/71NnNC+VIX79FweTkUV1Pa2CdgoiOZHABUjQIf7sT+WWows42cTxFoENG25E6woUXhzfdoEbUYhkhv7rMBHJn5F+mouKacDmsetZToYK5ZpL8gnQ/jWZbqoI/wP0BMd8/qYMx+SCgo7vHMpKopKxoxnlOpadsANwAA9mGD9UlYp81CzoSHFIq/KJfJ8kZXA9/NZLFnflG+EW/8TurMIvjLjEfNr+qrgSUi4ct47+Hvq1ntc/PztmOb6GY5PcXhNoUWBFlWjqq8sCC4SA+GQ/SYK+TAq0NAhozm9K3kzcQBjDrC2F8D1uGTXzwbKa9mAcr7OcnvCUrPyu1xsrzw+k9v+6oxir5fwwUrHwvIKAtJInZyZD1EwNwWc2+g4Gav6HIjTCJCyVbOYkd88ARu8UoKNmljGHKG3t8r5/KM20piVcSf+6gUj/JJQdHkLs34pMv33zJMO75vfD8ndy7YP3co/zYT43iuk8YMDmKPle/UtvZZMbdVfBoXqd0Kx1t8k+ChK8daEDaVLBsMQDSrE5Lw+H7oOkpeget4EqCkJMWwdNRw/TfmsNfsMao5evwQ0/hq1ndVqAnJvKuMkEQnnXRt8oGh8SDO7qy0RdZfZQ2juKBDC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(31686004)(53546011)(5660300002)(2616005)(40460700003)(86362001)(40480700001)(36756003)(31696002)(81166007)(82740400003)(356005)(36860700001)(426003)(26005)(15650500001)(110136005)(2906002)(47076005)(478600001)(6666004)(336012)(83380400001)(316002)(8676002)(8936002)(4326008)(41300700001)(70206006)(44832011)(70586007)(16576012)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 10:20:20.7274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a113360a-ad69-4059-a109-08dbc655d870
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5245

Hi Julien,

On 06/10/2023 12:11, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 06/10/2023 08:51, Michal Orzel wrote:
>> The list is out of date and does not specify all the hypercalls/sub-ops
>> we support, so update it.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/include/public/arch-arm.h | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index 6a4467e8f5d1..263b1e182eb3 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -104,6 +104,7 @@
>>    *   Exactly these sub-operations are supported:
>>    *    * HVMOP_set_param
>>    *    * HVMOP_get_param
>> + *    * HVMOP_guest_request_vm_event
>>    *
>>    *  HYPERVISOR_grant_table_op
>>    *   All generic sub-operations
>> @@ -116,6 +117,26 @@
>>    *  HYPERVISOR_argo_op
>>    *   All generic sub-operations
>>    *
>> + *  HYPERVISOR_hypfs_op
>> + *   All generic sub-operations
>> + *
>> + *  HYPERVISOR_platform_op
>> + *   Exactly these sub-operations are supported:
>> + *    * XENPF_settime64
>> + *
>> + *  HYPERVISOR_vm_assist
>> + *   All generic sub-operations
>> + *
>> + *  HYPERVISOR_dm_op
>> + *   All ioreq server sub-operations are supported as well as:
> 
> I interpret this sentence as all the hypercall with 'ioreq' in their
> name is supported. But, for Arm, we at least don't support
> XEN_DMOP_map_mem_type_to_ioreq_server.
What I meant is that we support all sub-ops from ioreq_server_dm_op (ioreq.c).
XEN_DMOP_map_mem_type_to_ioreq_server is only accessible on x86 and not part of ioreq.c

~Michal

