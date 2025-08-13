Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD0B24CC3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 17:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080022.1440655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umD11-0007bJ-2h; Wed, 13 Aug 2025 15:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080022.1440655; Wed, 13 Aug 2025 15:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umD10-0007Zv-W2; Wed, 13 Aug 2025 15:03:46 +0000
Received: by outflank-mailman (input) for mailman id 1080022;
 Wed, 13 Aug 2025 15:03:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ADYb=2Z=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1umD0z-0007Zp-Hr
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 15:03:45 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2414::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b362fd6a-7856-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 17:03:43 +0200 (CEST)
Received: from MN0P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::18)
 by DM4PR12MB6663.namprd12.prod.outlook.com (2603:10b6:8:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 15:03:38 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::c4) by MN0P221CA0013.outlook.office365.com
 (2603:10b6:208:52a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Wed,
 13 Aug 2025 15:03:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 15:03:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 10:03:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 10:03:34 -0500
Received: from [172.23.255.54] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Aug 2025 10:03:32 -0500
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
X-Inumbo-ID: b362fd6a-7856-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcPt3LjFUgL5sInauuz86Coww4uSJ64ZeGfmP7j/wGAXupyDxREFppM9z6QC0KUcpc4/HsBXvP9o8qJ9H9mNdDW3QwT4ljC6JzyJXzdmNq18wQKfK809zJ/OtOKGcBJB9rilp6LK4irym8/FobbDuEsG4mQM2pmOwH+2bsqKfAURkk08dsK64JFD7qnbj7wkYathBEpzg+N04GnS/VIEWWhzZ8THmiM1VdT2lTs3DGb9osHXk0xaiVGWNi7Ac9YGdoZPKoeTYsvyRcNLAJvadLSzf/CF0/xXLCQs9G8JfOKY08O2TfsOReKpYmsqBSDFlASuetugD+PtQoyWO6+yfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbXIz+dpf07LB8Lps4BsCGr7J8+XyURVjsYYM66Yg1Y=;
 b=WayCJ5Vyv1Gc4z/M1yktRmM5RRMEQse2enL59vlTX0XP2VjPrNT0gAwVoYp1uYXd24/oyp9viVYg7uuBq330wBbv1pRglUcpIuhiOSaCaeDdxVZkzcIH18oebMafVyt96cLZNMC+aKmkx032lTCJSWm53zoN/wkbFABkRsI1NG0Aw6JZwUiEMxZIwU+J3+pJnIUl90NJFR9brEF34oeP1aWkHQzJ6JEQQw7K0sD74PH4dOctqWlpSmT3ncXDtYE94XcEBlz5YdgFQQ8Ob0ccBtE91bonxHQovZH35d544PQrI5/nHCB1dMshUUM0T39p9qYm0LW71bYl3sz9730TgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbXIz+dpf07LB8Lps4BsCGr7J8+XyURVjsYYM66Yg1Y=;
 b=py+VIA2ICXxTSJ8YMzZAZmBbBfUBJrgcotpgG2oxqyZrqbTJJ9GoqiBMcEFayUUG6Etalbchh8ViWxMdGy18CDYKRulRtsQhZKgi5uZrZebdRDtymvbHTUV1Ir/1DEcOds1o3so3nBNspm06gL92oHls255zW4TEnBmgZKoPtak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a4b5fd6b-80db-4b58-b3e8-5832e542d64c@amd.com>
Date: Wed, 13 Aug 2025 11:03:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/events: Fix Global and Domain VIRQ tracking
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Chris Wright <chrisw@sous-sol.org>, "Jeremy
 Fitzhardinge" <jeremy@xensource.com>
CC: <stable@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
References: <20250812190041.23276-1-jason.andryuk@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250812190041.23276-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|DM4PR12MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4759dc-dea8-49be-b56e-08ddda7a9579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OE5CNXFid3cyZG9VR1E3Ym4rK1RHNWRDaDV2WHBIbDZCZFRCVDd4Q3Z3dHBD?=
 =?utf-8?B?ZVB1Z2xQdy9Fc29EcjR3WnZqZDNEYjlDakdJZTVlT1lWaFQzTitqZDFHd05H?=
 =?utf-8?B?akR1LytvVEpFRVRrTW1ncXJBMk1vYncvTEFhSDc1cTR2eVlXQmNEdHlrbkNy?=
 =?utf-8?B?d1k3UGNLQUJDS0lySUxjaVFlTkRxcVEyeW5NdVQwaWZ6R3VtN280RVh6ekds?=
 =?utf-8?B?S01BeEFlTGo1Mmd1RnlxL3hvb2NZUHhsY3NoczRaT3VwM0tpb1hIWURPUnZy?=
 =?utf-8?B?OFFwOWV4UmlwZDBZVG1RczRxZzJCWnlTSFdYMld3M3VzMnVEUWlDNjQ5VDhw?=
 =?utf-8?B?RVJwdnZOY01rVjFvaktWTHpxa1F1bU1pUkVPTzRva1JZTzhNTDlBV0xkVTcx?=
 =?utf-8?B?S3RGZDg5anhsdTg0eFo3YlJZZ2dCdnBLNnhnVEcvdmdydXNUTjFBZjAzTU41?=
 =?utf-8?B?TEpPL08rbm5Qb0ZlNHJYVHFURXBlbHdoZzF0dkh0R1d0b09sQ0lHd3N2ZW5P?=
 =?utf-8?B?eHVQYjhrSDZrbVM3RWN0cmlrdGt5a085cmNndkRSMmt0SU82eVc1MWg4ZHBn?=
 =?utf-8?B?dEc1bjJwR0dBNUVldWpaWmJMc3k5aTM0N1l6WThIOVdrR1pOajhnQzZwK0dq?=
 =?utf-8?B?cnFwdHlnL0JqWG5hazBvRmRoS3h4em1FWnV6NUhsbithaDU2MXY2WmNXaHNr?=
 =?utf-8?B?YXg4WnpkREpuWXVrTzVvd0lOUlp2UDZtbDJaUWlRYzhzWHFqWnlBcjZ3Q2tq?=
 =?utf-8?B?K0NBanN6d3l2YUVyak5yUmJHbmJnaVdrQ2tLei9BR0Z6a1BMeHpIa1JjUDAv?=
 =?utf-8?B?Z0FvZ1ZLZnhzNXI2dklpbWhKZjJuK2pYNU96Y0JQQkxpQjRiNG1qVWVROHdo?=
 =?utf-8?B?eW9NTVhxeHdyMFl2SkVrMjc0LzhlUEQ5VCtQQmxlNWI4aFZNeFowZU1HbnFy?=
 =?utf-8?B?Ymp0U1ZOcVhyTGlyaDhBTE5xY3BrYU95MGlSVHcrWjlpdUgwQ3E4YmhEYW9M?=
 =?utf-8?B?c2hNNm5yVzg3NVRZTllaUWpydGQ4V0ZvWml3MFY2TWxsSGVlWlZTeVRQMlZi?=
 =?utf-8?B?VjZOcENKbTVMSk1EWlhTU1FQSEtKMys4QnZ6M1hGNDhmNWc3SDFlY1VaVWhk?=
 =?utf-8?B?Mk16WDBxSU9PR3JlWTg4RmJVQWVKb01GekMyK0tGYUJWc3VvR0RwdXdVTnZv?=
 =?utf-8?B?UXJlRTZ5aE4vM0FycDJ2T1YrR29CT3RPWHRQV01yeExBMkl0MUk2L2NyTkd6?=
 =?utf-8?B?WGNibWp3TkRXbTJpME5FSVVwK1RGSXVza1JvdXlsY0pBMUtjZnhiZVZVdHVw?=
 =?utf-8?B?RWtlZjFDOG1GWFJHeGx3RXIxZ2RRMVpIalduUlQxb3IrTFdZdEtxeXkyU0hy?=
 =?utf-8?B?WVIyZU1MZGNLdGN0Ry8vR29UczQzcTl3eDdZaDZKdmpYUENLbjZrQWl5aDNx?=
 =?utf-8?B?bmpjU2x4QVVINmdEYVYzRlZERS9LTC9kU1o3L2JWZ3U0L1ZCdEJRTDRIaXdn?=
 =?utf-8?B?NHdVOVZvc2syenZDczJMNnVDNlpWdXVHMU5XMHM5TjIzR2ZKZG1kNHBjbXp5?=
 =?utf-8?B?VG1kU2hXSGVUM0VaMnhWd0RKd0c4ZTc1bTMzV3ZDWFRySXFJK0RCOXNiK2Nn?=
 =?utf-8?B?WUVqZ05Ka2ZHVjhiQ1VKSUxvcTlVWVBLUUIvR21zbkZuaG52R09iUkdhR29y?=
 =?utf-8?B?MGZPU3ZTRVpQT1o2NTJEdGZuZ29SNU95QnVobVVMNHlPd0J5bjBzWlBDNkpV?=
 =?utf-8?B?bXpOWDVoRnRWalNSbzI2aU81T2NEQmdxd3RuSDBkWWNOcTR6Si9lbG9xdTB4?=
 =?utf-8?B?WXU3dU5jUi8zSDB3eVpkcHdGaDZzTjZMb2k1WXFrSmdTNXNlU2ZrcllpaWdL?=
 =?utf-8?B?REVZZVhYRnFFMVRzdlpFdlVPNlc1enQwcWJFbGZ3ZE0zd0Z1YTNkNnVnWEc2?=
 =?utf-8?B?b1d1U1hpWXZxcXF6RU5CWVZCRmN6WGZwR0RKMUVXTGJibHIzVFlhclV1cStC?=
 =?utf-8?B?amR0RVY5S1BwNWF4MU9hMU5nUTZkbmgxUFc3ZFdWQUVsM2hidHAzUTVtaVAx?=
 =?utf-8?Q?d+ru2D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 15:03:38.4675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4759dc-dea8-49be-b56e-08ddda7a9579
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6663

On 2025-08-12 15:00, Jason Andryuk wrote:
> VIRQs come in 3 flavors, per-VPU, per-domain, and global.  The existing
> tracking of VIRQs is handled by per-cpu variables virq_to_irq.
> 
> The issue is that bind_virq_to_irq() sets the per_cpu virq_to_irq at
> registration time - typically CPU 0.  Later, the interrupt can migrate,
> and info->cpu is updated.  When calling unbind_from_irq(), the per-cpu
> virq_to_irq is cleared for a different cpu.  If bind_virq_to_irq() is
> called again with CPU 0, the stale irq is returned.
> 
> Change the virq_to_irq tracking to use CPU 0 for per-domain and global
> VIRQs.  As there can be at most one of each, there is no need for
> per-vcpu tracking.  Also, per-domain and global VIRQs need to be
> registered on CPU 0 and can later move, so this matches the expectation.
> 
> Fixes: e46cdb66c8fc ("xen: event channels")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Fixes is the introduction of the virq_to_irq per-cpu array.
> 
> This was found with the out-of-tree argo driver during suspend/resume.
> On suspend, the per-domain VIRQ_ARGO is unbound.  On resume, the driver
> attempts to bind VIRQ_ARGO.  The stale irq is returned, but the
> WARN_ON(info == NULL || info->type != IRQT_VIRQ) in bind_virq_to_irq()
> triggers for NULL info.  The bind fails and execution continues with the
> driver trying to clean up by unbinding.  This eventually faults over the
> NULL info.
> ---
>   drivers/xen/events/events_base.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> index 41309d38f78c..a27e4d7f061e 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -159,7 +159,19 @@ static DEFINE_MUTEX(irq_mapping_update_lock);
>   
>   static LIST_HEAD(xen_irq_list_head);
>   
> -/* IRQ <-> VIRQ mapping. */
> +static bool is_per_vcpu_virq(int virq) {
> +	switch (virq) {
> +	case VIRQ_TIMER:
> +	case VIRQ_DEBUG:
> +	case VIRQ_XENOPROF:
> +	case VIRQ_XENPMU:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/* IRQ <-> VIRQ mapping.  Global/Domain virqs are tracked in cpu 0.  */
>   static DEFINE_PER_CPU(int [NR_VIRQS], virq_to_irq) = {[0 ... NR_VIRQS-1] = -1};
>   
>   /* IRQ <-> IPI mapping */
> @@ -974,6 +986,9 @@ static void __unbind_from_irq(struct irq_info *info, unsigned int irq)
>   
>   		switch (info->type) {
>   		case IRQT_VIRQ:
> +			if (!is_per_vcpu_virq(virq_from_irq(info)))
> +				cpu = 0;
> +
>   			per_cpu(virq_to_irq, cpu)[virq_from_irq(info)] = -1;
>   			break;
>   		case IRQT_IPI:

Thinking about it a little more, bind_virq_to_irq() should ensure cpu == 
0 for per-domain and global VIRQs to ensure the property holds.  Also 
virq_to_irq accesses should go through wrappers to ensure all accesses 
are handled consistently.

I'll send a v2.

Regards,
Jason

