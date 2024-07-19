Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E85937D72
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 23:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761199.1171206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUuwR-00008k-7l; Fri, 19 Jul 2024 21:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761199.1171206; Fri, 19 Jul 2024 21:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUuwR-00005L-3s; Fri, 19 Jul 2024 21:15:03 +0000
Received: by outflank-mailman (input) for mailman id 761199;
 Fri, 19 Jul 2024 21:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4QG=OT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sUuwQ-00005D-20
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 21:15:02 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20603.outbound.protection.outlook.com
 [2a01:111:f403:2408::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3b1f255-4613-11ef-8776-851b0ebba9a2;
 Fri, 19 Jul 2024 23:14:59 +0200 (CEST)
Received: from MW4PR03CA0145.namprd03.prod.outlook.com (2603:10b6:303:8c::30)
 by DM4PR12MB8560.namprd12.prod.outlook.com (2603:10b6:8:189::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 19 Jul
 2024 21:14:55 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:8c:cafe::ca) by MW4PR03CA0145.outlook.office365.com
 (2603:10b6:303:8c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 19 Jul 2024 21:14:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Fri, 19 Jul 2024 21:14:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Jul
 2024 16:14:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Jul
 2024 16:14:53 -0500
Received: from [172.27.205.14] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 19 Jul 2024 16:14:52 -0500
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
X-Inumbo-ID: f3b1f255-4613-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EP7+oAux5Yywf03ondlUOF59NRtZMZ3oJEXILdx2yAXM3UtKO+XkrYgP3zducx/h9YUpVT/bWZl6Rr4leWvoudiCb4AvBtyDVm2D+wzu3KEm7u+8zEmrJAdeZ2bXY27ECPI5+WWprbX+mH6HzTfRpN1VOTrIlgaGC905P4RUvbfzsO+eP+opH0YvoFISugOQ7xqrnHb01GScBY29EEpJB8nvsz7HyWZXOAmAQtsd5uYd5ZELHAHMcyW1IJtqzBwuMiTwKMDTwbK8JXyvh2tZZi+0oD8ZF7vdvfR/LDlZ3XwzRY3xXpamUs30DgRDhGKSY96jkMkDQM9j2ATMrmkkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsleLYF7hff2fEi3p44OOijzqxdPGzwyb+EgqFa98zY=;
 b=FsLg/CdIYCNc1ZYu0Tj7tf3+16C8EVD6XsjSYYwaZooxiKjM6hREwAb3NDxecbD16dTPNpHSZUfgvG8jX3mivNyiFKrMOckgzKPGH2Gz98yZ1EowxSIuBKXzy0O0AxxJkvEa5NzOCnD6tA5BjUmv5u7JMGSDODHJfc8qoUE1lhj9SSisY61RhMMUWftJs3reajAVXIACDsWUyQUb7LTQC+9+lEN5IbFyX0d8TzfpJbesBnfyS8dV10/qkloWz5HLPpn7z25Ro0HLmE+Fj3zrG5WoI5u835mpolU9UDmDSntDfY/uxr9cGDzIS+TU9LZVsbvnsSVMI0SZMDTcogdsaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsleLYF7hff2fEi3p44OOijzqxdPGzwyb+EgqFa98zY=;
 b=Y5TngCi3ansXVsjSaBvLoo64CvaOhivdu5YwFtbo32zbGhanlHFDM6uvqIx/mcsnpStsv5ybtG6nTAClrSwaZF8t8QDhtsKOai8A+AJgRbTvs4sS6aRejdYnEYJhXlhZCXivD9JwuK1aEzgt1RoLFPqNZexvzSgM/t6rbcV6tUo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <78c73bac-deb9-4e6e-8027-fb78369f695a@amd.com>
Date: Fri, 19 Jul 2024 17:14:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tools/libxs: Fix length check in xs_talkv()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240718164842.3650702-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|DM4PR12MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: e40628c2-ffd4-44f3-bb69-08dca837d60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXR3bStxWjVIYW1IclFYT0FmL2YxWEtzZnkyNmFFWmo2cEtRZDRVK3UvTU55?=
 =?utf-8?B?OUR0cnpEMEdNdUpwVzFnbkVWTUk5V2pETVBpYmVMRCtxMlBOQWgxWmhNQTEv?=
 =?utf-8?B?KzMzSkRrYzNsQ1MrdkxkdXUyaXNMbHpxMkdsaW9NbStiTDZlQTdhQlNONm9p?=
 =?utf-8?B?cThadnFtcVYxOVZIejVGMEdhUFVLaVZ4S1FzbVpubUFIVG9SVkp3alF4bFdS?=
 =?utf-8?B?UGlmenZZMFRoS2tTWkxoYU5qOEYvaEo2TDd1Y2xlbndtdlVXa3U2UURZV042?=
 =?utf-8?B?RnhscWxhN0o0NS8wY29QZlRWL3hYVEQ4SmJnM0NSZXBCd1hlbjVZTDIrOHdM?=
 =?utf-8?B?SnRIdDBQa0J2SDhhaWhoNkVNQ01GU0JyMDl5Y1NTOEdHdE0zOGQzRFhSY0RL?=
 =?utf-8?B?SS95Zm5kWThGamIvL05UQXQ5RnpINkZMK2NwN1lKYkJLVEhqcHFQK3dUbFpv?=
 =?utf-8?B?TFFRNVlvWWl4S29oeFVXZU9EcExJSlFxMzVMbEJjWlRHaEFOTlN4UHMrN2RK?=
 =?utf-8?B?eEhTNVRubzNWZ1VOdURDZG5SVzFFRWdGbnJCYSs3M1FTa2RQN2IzbUdrUWtE?=
 =?utf-8?B?ZkdxWWV6YmJhejU5NWlXS3RaY0N0RHR3NzdPMGMrZlMvQ1BMUjk4ODYwcUQw?=
 =?utf-8?B?Wlk5dFpKQkZWa3pOR3NEbGlPUWNlYWdheGpJNmxFcG5YQ05wemJ2U1hRY21W?=
 =?utf-8?B?VUtveUZDVnI2dzlIWkVkQ0g1VUVYTVgzWHJyNzlZek5lYzhNbEt2Q1JPb2RU?=
 =?utf-8?B?TWNjT3RZZFZ1K0hReFl5U1pyZjdvTWFjWjB3c2F6REhsU3pmWE1Ld2xIYXlL?=
 =?utf-8?B?YnR2bmJxMDY4bEJqZ1k2NEllZkU2d2lwRlk1U1lpa3I2c1g1OVdEa3BITFFn?=
 =?utf-8?B?SzBkYTNoQnlZQjdwRk8xM1U1SEZYd0FkWDRJWFkzZlljZ0JweWRDR2ZTR3Nx?=
 =?utf-8?B?MkY4aUZtWWdZQTVQekllWk5VdkNRRTFQdFh3bzViZ3ZkaWc5V2pqaVBQbE5t?=
 =?utf-8?B?aGgrcG1hemZ0NkFMdmhrMGc2eWRYVld5aUk5MitsV09adzVvdUwwOHBSdVFH?=
 =?utf-8?B?WmhiUGhXUUlJNFhhRDI2V2oyRFpsa3U0dS9rN3lNNjVBWUovYmY3V0ZQcm5S?=
 =?utf-8?B?dytLd2NuWExGa0RjZ1JuSHQ1V3d4emxIWENFZmNMZy9tUURTS2ViTXJrQkVt?=
 =?utf-8?B?NzFOT0szQytPNEVRMFN3VGNka0hvS2pNL3NKcmR4Y3FQYmZmQ0hDNlZFelZh?=
 =?utf-8?B?d2pZTXZNNnhpWW1LVXZ1NURRZVhqRS9wTzJ6NHFIWTRoWm5aQ1VHajFKcTFz?=
 =?utf-8?B?YkVRSHRnR015bFpUYVdlUThBS2lkVHFxYVhpNXZGek5Ra0JvR2crTElQeUkz?=
 =?utf-8?B?dUEzUkFZdThXYndIUWpqNzZwNnc4U2xTTUp0SGovekpJdXlhUnZLTGE0U0tS?=
 =?utf-8?B?Uy8yc0RFZFI1SFBmZ3RYSHpsaEdNdkk0QTdJQXJoeCtCZlBsVHp6NmhwZzdC?=
 =?utf-8?B?WWhFVVlJQmpiM0RGbVJwazNEelBZMGhOL2F2b2FGM2JselNuU3B5WTFRK1pO?=
 =?utf-8?B?aHYvMGVodkthdnNJTWZhRGMyN3hOOTJZU1RvTkN0VHczTEp2cTBtcXF5RDd6?=
 =?utf-8?B?dU5lSzU4SUZTZnNxeEdlbVNFM3VhQzZvMGkrRGplTWxTR0dPSnBGY3RpS3Y0?=
 =?utf-8?B?MlkwTm1LeEo0SnFhZ1A1WkRDUDcrbmlOWkFzZmxXbGc0MUowVzdjenp6SE1P?=
 =?utf-8?B?WGFDdzEzT25lZmFmOFpQTVpJOHdTWFYxVWlrZnpPamptYWFkTjZzNUQ2Vkdu?=
 =?utf-8?B?S0xWQVk1UmlrOGZ6V0k4MEFTdE9wbk41VHV2dlg0ZjdBc1NyTW41SFNxZ3Js?=
 =?utf-8?B?OHVqcUVJOWZVdUNqNzZkNDZpM2UralRpS1FKdlFMZkJOOG9HaHN0QlRjVlU4?=
 =?utf-8?Q?EK3RHTS53616WLNptDlI8EriZLIKEl/z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 21:14:54.5653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e40628c2-ffd4-44f3-bb69-08dca837d60b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8560

On 2024-07-18 12:48, Andrew Cooper wrote:
> If the sum of iov element lengths overflows, the XENSTORE_PAYLOAD_MAX can
> pass, after which we'll write 4G of data with a good-looking length field, and
> the remainder of the payload will be interpreted as subsequent commands.
> 
> Check each iov element length for XENSTORE_PAYLOAD_MAX before accmulating it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> ---
>   tools/libs/store/xs.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index ec77379ab9bd..81a790cfe60f 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -571,21 +571,24 @@ static void *xs_talkv(struct xs_handle *h, xs_transaction_t t,
>   	struct xsd_sockmsg msg;
>   	void *ret = NULL;
>   	int saved_errno;
> -	unsigned int i;
> +	unsigned int i, msg_len;
>   	struct sigaction ignorepipe, oldact;
>   
>   	msg.tx_id = t;
>   	msg.req_id = 0;
>   	msg.type = type;
> -	msg.len = 0;
> -	for (i = 0; i < num_vecs; i++)
> -		msg.len += iovec[i].iov_len;
>   
> -	if (msg.len > XENSTORE_PAYLOAD_MAX) {
> -		errno = E2BIG;
> -		return 0;
> +	/* Calculate the payload length by summing iovec elements */
> +	for (i = 0, msg_len = 0; i < num_vecs; i++) {
> +		if ((iovec[i].iov_len > XENSTORE_PAYLOAD_MAX) ||
> +		    ((msg_len += iovec[i].iov_len) > XENSTORE_PAYLOAD_MAX)) {
> +			errno = E2BIG;
> +			return 0;

return NULL;

With that,
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

