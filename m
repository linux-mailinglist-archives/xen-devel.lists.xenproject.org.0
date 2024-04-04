Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4F3898957
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 15:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700896.1094673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNZC-0003MT-KK; Thu, 04 Apr 2024 13:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700896.1094673; Thu, 04 Apr 2024 13:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNZC-0003Ki-Hf; Thu, 04 Apr 2024 13:55:46 +0000
Received: by outflank-mailman (input) for mailman id 700896;
 Thu, 04 Apr 2024 13:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/v=LJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rsNZA-0003KY-Rt
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 13:55:44 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06b307a3-f28b-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 15:55:43 +0200 (CEST)
Received: from BN8PR12CA0019.namprd12.prod.outlook.com (2603:10b6:408:60::32)
 by CH3PR12MB8657.namprd12.prod.outlook.com (2603:10b6:610:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 13:55:40 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:60:cafe::2e) by BN8PR12CA0019.outlook.office365.com
 (2603:10b6:408:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 4 Apr 2024 13:55:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 13:55:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 08:55:38 -0500
Received: from [172.21.219.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 08:55:38 -0500
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
X-Inumbo-ID: 06b307a3-f28b-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwSD+Ll2Wu4PGqt+j37NktE7nmReOaeQ+nWOw7fmke3sFoC49InXZo9hf1fmjREXQiNvpiTqvmQ+M2rOmzmCqQls4glo/aV8TXGDTg3HGpbhedZQRzw0RpxtOIgn3+5k5z/rz2jxC+eP2kWUSmy0sfblh5z3c9NA721lyx5EivfyJeR0OIUntYk6hekz+orBvw/irhX1ggvyQfEwHt2LvJ7tNrkoEAmrYMFBDvJGAQBCzpHwBCmJWehn9Vbs4/CLXIfv+4+xBYxL5JgUALIXsKkKnUjzkVJJ1K5zYyWcGm8BePXBtvzfUapQCTEUITF8bu1xP+atSrA/g4UEsXk1FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfrwydNOu9rGKoycIz0VPxZJX5Ttm5fjIwbiFDyUay0=;
 b=fFj/W4N7peLhaDCcJSWbKdv1UAg02T3Akmqu5eScXnpiPYtjTTjKrFYVf06we544inMo9rRs1EHDLpkBXIbwIOJJKJkhyoTME4QZcJvAYWhC/H7US5m6Lrv2F/oYcv6iKmQNT92upYuUnLzsfC2VpF68gV34vfauDWm8apvyg1rb3HvHia4YP/GGw4c0T75By9kAiMK3/TTdiJFBEqzGYNSvBa9zsBzFl0i1Id9Fcg8eeSRGsAEHI3Kir/CNx/rI5sbaX8CK/M4NXBqsRuEmr6j2W7BAUoGcFmT/krzSjtigfBQMcvBwSp9ZEqjb9zF7+vX/WTuY8FUpB6XjIkhnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfrwydNOu9rGKoycIz0VPxZJX5Ttm5fjIwbiFDyUay0=;
 b=bImnKvGeXaUtnFvrUN5w1bnCo8wf3LOZIZB4FwLref8VfukNjZjqqU79NlODKbPobGespHL1hKeOrhR/8eR584WdFV/OqRG10AB8XVtMPQqFGYUnJunWVb0zZW7A3pNt4sOMQI4gI0WYHH+y3vOkCDpHtoQoCNnxrpjoQ9ahZ+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <286d581b-680d-4d66-a0ca-6adaff162d2b@amd.com>
Date: Thu, 4 Apr 2024 09:55:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] tools/init-xenstore-domain: Replace variable MB()
 usage
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20240327215102.136001-1-jason.andryuk@amd.com>
 <20240327215102.136001-2-jason.andryuk@amd.com>
 <759cb3a3-3eb2-48a4-ab85-36005378ade1@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <759cb3a3-3eb2-48a4-ab85-36005378ade1@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|CH3PR12MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ab2990-9855-4e33-e296-08dc54aee976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YJV0K3qd5BJEUUKPk+cKdg4wXzb4KTNk2pdt2G23gflVjIgEBYUl3ugiiQk8SsWjnTPfiQa0orjeVDCau90v9GaEGjoD4q7rtzYri6s3JCQANdVosN0O7WPYJoR6yZ4CeSma/mWbvtNMAOZXBuLfOEtpJZb/JWXi6PSLwxMREQXEoC4pB7l80jhYRLDUb0jjd/j8P+lYutL5rRqrHP7wMk2jpGFbbsG5sy2denXCVOQSkL4mzF4kmYI0+ptupolx69mF6uWI0niy+itY9GaLF3ucRMfZyePk+i8RzXlhnbjepZuxPNkCIpaDGauEBcoE4alt2HSxrqPPA14p+HEZ1AlSuYUjH9olWLvadn3t0q71EE82si8WI9o7sHg7bQX0gKg3koHmWcVrZL8mw+96vtzC+iv7bxAyG5ZML+63CIAfLbNJ+JsRMA6t54Wvmx5Gwc/55ftoNr5+JNTnXDcE2TzNQ8rfPigNFsZ1xa1EllY2otdBRG5m2aBgKk3rpJaFVxTFnnxjYKxhn18JlkUSycyEMJ/925GSq5vIszDdhEIibpYp27YUxoGP1jbzJS6wX5tMiaMBRED3GUPDaJDp6K85dpkoHXrzfJfszYNMR9MTJI/f9w9/p/Bcdm053EbANI4dXvBUJBPamw/DcLB/5Y1n5WTzlB0FV3uh3WE+uSS5VYHO64SnN061osg2kGMvCt4YWFgEksF7VwU1IIm/oz2AFFeQ6m8EmG6CnvSTCh1ot2nadGk9OtV17eITPvup
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 13:55:39.5661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ab2990-9855-4e33-e296-08dc54aee976
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8657

On 2024-04-04 06:09, Jan Beulich wrote:
> On 27.03.2024 22:50, Jason Andryuk wrote:
>> @@ -36,6 +35,11 @@ static xc_evtchn_port_or_error_t console_evtchn;
>>   static xentoollog_level minmsglevel = XTL_PROGRESS;
>>   static void *logger;
>>   
>> +static inline uint64_t mb_to_bytes(int mem)
>> +{
>> +	return (uint64_t)mem << 20;
>> +}
> 
> While committing I noticed tab indentation here, which looked to be in
> conflict with ...
> 
>>   static struct option options[] = {
>>       { "kernel", 1, NULL, 'k' },
>>       { "memory", 1, NULL, 'm' },
>> @@ -76,8 +80,8 @@ static int build(xc_interface *xch)
>>       int rv, xs_fd;
>>       struct xc_dom_image *dom = NULL;
>>       int limit_kb = (maxmem ? : memory) * 1024 + X86_HVM_NR_SPECIAL_PAGES * 4;
>> -    uint64_t mem_size = MB(memory);
>> -    uint64_t max_size = MB(maxmem ? : memory);
>> +    uint64_t mem_size = mb_to_bytes(memory);
>> +    uint64_t max_size = mb_to_bytes(maxmem ? : memory);
>>       struct e820entry e820[3];
>>       struct xen_domctl_createdomain config = {
>>           .ssidref = SECINITSID_DOMU,
> 
> ... everything else in the file. Hence I took the liberty to adjust this.

Thank you for catching that and fixing it up.

-Jason

