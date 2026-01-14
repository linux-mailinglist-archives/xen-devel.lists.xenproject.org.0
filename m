Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2FED2133E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 21:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203827.1518823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg7ff-000295-Jj; Wed, 14 Jan 2026 20:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203827.1518823; Wed, 14 Jan 2026 20:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg7ff-00025y-G1; Wed, 14 Jan 2026 20:40:51 +0000
Received: by outflank-mailman (input) for mailman id 1203827;
 Wed, 14 Jan 2026 20:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSw=7T=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vg7fd-00025s-MV
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 20:40:49 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e60c841-f189-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 21:40:47 +0100 (CET)
Received: from MN2PR04CA0004.namprd04.prod.outlook.com (2603:10b6:208:d4::17)
 by DS0PR12MB7725.namprd12.prod.outlook.com (2603:10b6:8:136::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 20:40:39 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::80) by MN2PR04CA0004.outlook.office365.com
 (2603:10b6:208:d4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Wed,
 14 Jan 2026 20:40:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 20:40:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 14 Jan
 2026 14:40:38 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Jan
 2026 14:40:38 -0600
Received: from [172.28.136.14] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 14 Jan 2026 12:40:37 -0800
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
X-Inumbo-ID: 4e60c841-f189-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4hS3Z+2an1laxi9cJ8LtLX0VsFk4HwBS4WPkL+igLefiipexMwUY5kr/t6HsWZCHAhYVubdPLJfaZo5SQ4Wi+IgWIT2c9LmPmK8GXKMwSEqIEhC6DaNFF7qDXuJlagt3EN+iRViMQ4UDYYwVLe/SABw8Ebkt9T6JJjip9QTXtzEYHnqVRJkTki+QGQl75T/9TVDCMjMEczrK4djACvDdnGoCY892ZHvrVB5HKu0Lacqp9wv1bpBPg/ekL1KxkK6maqSUqZFqPK0kFj4zAsTv+Dhwi3aT4WBjebcuVP9gQ4OcImjWi3Op437qXWBASxzozahBjxouqJVfKAxprALwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enNkDqd3q5BKhxWeYe0DgnTS2QiQY3lBAcyP4VvJLj8=;
 b=BFd+FH6zwWaPu+dlevU3bM5dCpYx17XA5ocELfEFRjHYCpMIghOqRJq0gc7w6PH8+GN2qgW67OlH2Kte0EfowM/Yj8FUbtXA5AGmw6TTPxQ2ts2AwL/z8mFIYbbbJyJDkI7CDnikEWx8yEJniafrmxckPYHPPfj2ekEaywdXJWd00htTUzlhgxyp2PdwJtSKzB56xt1XdZjOSQX8CULJrTCo+BLG/fv7DwADxiye/GvovT71S7hy4lAAtFFRdazSYgRNeO203crQb+G+LqcxErpv7npWcL3dycqPvLGIJ7yg1Zsel7KnvZhu8+HcA2mUvdjii5Rs54uKphGwCk2QNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enNkDqd3q5BKhxWeYe0DgnTS2QiQY3lBAcyP4VvJLj8=;
 b=Z1HAkeDpktxfw86QCgeY7jGDPNyOJnp+yFXZnzyu5nBzv5Phsy1QjLtfhFXK6DXoTcEisi2NP6jMc4A2jkFQQQXhtyN563rgpEErZLqwZDR/3pzSWEcyaDUo3Fo8Y9apCKTCSiCiNEzW0DGewBQF17Ne5nHGJcwUMZuIYG68NaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <87de17df-0aed-4ce1-b556-f93a381b66d3@amd.com>
Date: Wed, 14 Jan 2026 15:40:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/mce: use offsetof to determine section offset
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <350bd19ec4b0b190911d748df6ec92c626e7151a.1768415160.git.nicola.vetrini@bugseng.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <350bd19ec4b0b190911d748df6ec92c626e7151a.1768415160.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|DS0PR12MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d396a8-9c6e-4517-872f-08de53ad2d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bElXZ1RRYkwxWlp2QzZhdjRVTmN5dnVlaXpMalRhWmh1MjBWN0RES1p3OHNy?=
 =?utf-8?B?c3cyR3FZN2hZclpiU1VkamYrZ1plVklSQndDSXFSQmE1b2d3OFhiejhab3I0?=
 =?utf-8?B?N2J4ek1pamh0bzFhT09oSFJIcVJYSFo4eTFrWGRjOCszSmVMRUhqRW5yZG4z?=
 =?utf-8?B?UnFDVUVLVU9yUDlBU0hEdWxLck5oT2VTSnFlemNaU0wyTTJ0aFlqVUswUGV4?=
 =?utf-8?B?Wm5OMDVVRG5yU3pvQ3BuRzZZSENBc2NtZ0FPY0ZweTdwQmRUWk9QT0M1TEh3?=
 =?utf-8?B?QnVSTTBvSDZXNUdXWmxkOExTMEpUWER6MlR0VmVla2hKL21LQUcwdE9BTGtq?=
 =?utf-8?B?anA0Y0VQTW1pVUVKU2w1cTNSL0oyRFI4Rk5TbzY3NGpTNlpwSzgzSzBpRG9i?=
 =?utf-8?B?UmhWQXpINjRDUWdnZkxPMFlYUmpvOTdHWHNpcklXOS9Dd3ZGZFp3SUdhRS92?=
 =?utf-8?B?UkNwZVZSalJ4K1RzYTBoeDlVQ1hYbFV2SFcweXlUNlRuQ0g1K2YybHhJOEl4?=
 =?utf-8?B?KytVaVNrSGlJdFk3WTdZTWlBbDZTWlNkQVN2eno5NFdONGQxM09xQm9RQjlJ?=
 =?utf-8?B?YzZLWGxjSDJRVXJNMmd4NzJTVnNhSHVzV3BpYjdUdHhIY2dVSnpHMzJjWkU4?=
 =?utf-8?B?bm4xSldRM0ZtSGtvcDluZGJJUmpBMVNjdmpYeWJqdkJVQUw1ZnJqaTMwMDlI?=
 =?utf-8?B?TS9RQzJHd3ZZT1lLem5rVzNzUW0zMzlpTDZOaVBVaTZtU3hFTkt1WnY0N1Bt?=
 =?utf-8?B?QlVsait2L0NPREV4a29uTkE4MDlERTcra1pNUlNGTEFTa1ZlNFJCbm43RFVG?=
 =?utf-8?B?Kzg3WlRaRGptdXplMlNDK1l0dStFM1ltSUhjd0drQkIvcFIxZk96YW9oNEpp?=
 =?utf-8?B?VHA3QVp0SzBTZ1NxOXBxN2ZXQzJ0MGtzY0NxYWZ2d3hSTUgvbkZ0SzN3UU8v?=
 =?utf-8?B?TlBTTHRNRVhsSkpocDF4WG9JL2N6cHZBRTdESVBPbHN4K3JLVTFBSlZOclVw?=
 =?utf-8?B?cU5pTnE4RlMrejh1RHM4UkNJZitEOS9PMUVxNlQ1YVBhMUdwa0wyMFJpZEdM?=
 =?utf-8?B?OHoxV1R0QWE3U2Rxa29xNDI4VW9xbVR5MjUwNTVrTTBBVEwxTGxsbXJsMEtn?=
 =?utf-8?B?eVBCNENHQUk5eVh4cFpOWGtaaDlqbWVTeTJHMTRxczM5MU1HUlo3R2lyVFds?=
 =?utf-8?B?clNxbXZCZHV4WHRhMWl1QnRPM2FIOE1QV0hqNXpaVXR4eWtoTkpmL3l1TUFJ?=
 =?utf-8?B?ZG9icWkxQ1lvU0ZnYW5KUUk5QVQ2WmpCU0lJN082OWxrVnd0dDUzeWM5dU1B?=
 =?utf-8?B?SE9CdzN5RjN6YktXdnJLWEdZL3krbW14UVMvSktIcnBRdmRSS2VnajUrczk0?=
 =?utf-8?B?ZnRZY3o5R2VOMGoySXQ1SndpM011TGY0K2JuRUlTTlpmVnJZMmtsdGdkOHhI?=
 =?utf-8?B?MXdrdCtSeHUrVjZxUCt3dkZWZ0xFWkV3YXYvZXdmTllxRWRDY2RYMjArcEwr?=
 =?utf-8?B?S1BVM1NFaXdtYUxpNEN5bDdzWE4yZFNMNkNQUjhDVEc4OWN4ZldsL04ySEtP?=
 =?utf-8?B?SlZGcDd1NmVhOXdERVN0cFBSV1NsMHNlMUFMbFhhdTVINEZmZjRkWTNJc29Y?=
 =?utf-8?B?M0tQOWEvOFNNdXFzZU1QcVlHZzZXNG1jOTVSNjMveXhwZXRrR3o0MzJOeFlv?=
 =?utf-8?B?S3g3R2grclZPbndCSDB3eVJpclZEWnQwa2dZaFdtcUtURlpRRzlNb2pyMkVt?=
 =?utf-8?B?KzNDU01yMlhIUWVuZFRFRUhiNzVha0JCMkZLMjJlVEJCZU83ZW9paWNoaGNK?=
 =?utf-8?B?WCtiNVdnUXIrbFUzR2hPVVlCSWJyNE1JdHZGSXZoWUxZY1B6Q0sxUUZJNTVT?=
 =?utf-8?B?N2Zzc09OZTRnNkdIQXNHYjQwNDdMNTFHRFJOR0llR2d3a3V5cVhodlVPcUs5?=
 =?utf-8?B?ZXF2ODNwSSs2cXgyZW1rYnRCdFpmRmFXS3c4M0RsamF1RHFWVnlGc3hEZ0Rj?=
 =?utf-8?B?b2RjY3ArZ3BvU3ZsU2FkMjA4RVFhcnp3YVZQVXMwRVE5MXNLa1p6ZTdEWHM0?=
 =?utf-8?B?UVo4MHRnZjMyRDBwODJVV0luS3drV3JleHBoTlB5aFcyaGpTV1VNalRtOXFV?=
 =?utf-8?B?ZHFUdzZoNVdPNzJUekJFQmNSZ2NIalZNb0x4L2hlempmU3h2WjhQUGt1aE0y?=
 =?utf-8?B?N1FmVFBPRnRreVlUbU9nblVrczF0VXRpSklRYmI4aHpiZHpWaGg4U29iVXpV?=
 =?utf-8?B?cmxBYkgxcXRuNEd0aDlYYmN4TFRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 20:40:38.9421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d396a8-9c6e-4517-872f-08de53ad2d6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7725

On 2026-01-14 13:27, Nicola Vetrini wrote:
> There is no reason to use pointer difference.
> A violation of MISRA C Rule 18.2 ("Subtraction between pointers
> shall only be applied to pointers that address elements of the
> same array") is also resolved because the object to the subtraction
> is applied is not an array.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Found while randomly browsing violations of the rule on the allcode-x86_64 scan.
> ---
>   xen/arch/x86/cpu/mcheck/mce-apei.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/cpu/mcheck/mce-apei.c b/xen/arch/x86/cpu/mcheck/mce-apei.c
> index b89502088243..21aabe2027d0 100644
> --- a/xen/arch/x86/cpu/mcheck/mce-apei.c
> +++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
> @@ -74,7 +74,8 @@ int apei_write_mce(struct mce *m)
>   	rcd.hdr.record_id = cper_next_record_id();
>   	rcd.hdr.flags = CPER_HW_ERROR_FLAGS_PREVERR;
>   
> -	rcd.sec_hdr.section_offset = (void *)&rcd.mce - (void *)&rcd;
> +	rcd.sec_hdr.section_offset = offsetof(struct cper_mce_record, mce) -
> +		                     offsetof(struct cper_mce_record, hdr);

"= offsetof(struct cper_mce_record, mce);" should be sufficient since 
the offset of hdr is 0?

Regards,
Jason

>   	rcd.sec_hdr.section_length = sizeof(rcd.mce);
>   	rcd.sec_hdr.revision = CPER_SEC_REV;
>   	/* fru_id and fru_text is invalid */


