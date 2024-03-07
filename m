Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D6B874EEA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:24:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689861.1075245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCmf-0007yX-Ke; Thu, 07 Mar 2024 12:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689861.1075245; Thu, 07 Mar 2024 12:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCmf-0007wG-Hz; Thu, 07 Mar 2024 12:23:37 +0000
Received: by outflank-mailman (input) for mailman id 689861;
 Thu, 07 Mar 2024 12:23:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xW6h=KN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riCme-0007wA-9B
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:23:36 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83ffc5fa-dc7d-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 13:23:35 +0100 (CET)
Received: from CH0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:610:32::33)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 12:23:30 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::72) by CH0PR07CA0028.outlook.office365.com
 (2603:10b6:610:32::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Thu, 7 Mar 2024 12:23:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 12:23:30 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:23:29 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 04:23:29 -0800
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 06:23:28 -0600
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
X-Inumbo-ID: 83ffc5fa-dc7d-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c566m8QQrLEe67WmQ5apK+U0G4CLLwFLwf197nkMF3FofR7/2YRRUXt/mROlNj/Xe/OChVLXQO51EUHAvL0aPBznn+1Bio83c5CJM29EX+gNFoHtNbc/RLRaVb/qXCAK9abz/MrXSGEPIJCAhIRt3j9NXgAvZNNLLkMOvYvfsSSz4j+WMufPx2+GuYzBZ4M3Ic0/SgxwESCdcGdhzk6Qa33ML7+JhMkoIjVKhJpSsdTbyce112CyJltY80ivGkzMw+W4Ear542CPibqO+CFoT0fAucNFr1NzFMXqiJ70ClwX4cCj6CjysW3nsEAfizx2yckZQbu7Fy8zP1NdPCbdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIvYTYf4ZZUtA8PeomYaaxZ3wiW64APXTpJB+YGmRRg=;
 b=P1yZ9Fe0k5va8RYeGX3bBwAmiG3wF2o53EsiDhd8PCVV1xxfcRiyUHLoaiTssMcPvYxVn/N7V7E4G5QkS1XA3MuzI8K8mfR5vEP2tBOzdb9RyTKCG2RC9kw0PFEWDfa+K0LGWo29btbuOWtBaGs2lqn1bTgzKxobCF/1/iSCrXel/ILxRofZ1ToXbqmepZHEJaEiOfw+FHaLG5KIkhpddBSlJgOneBiXJRT2TiU/e2Wpi0Pe58JIDrPXhzdB/bGalie1bCkHnBYig3VyHi4tDsP2nb62DYH/JkLGsBIe14wo1Y/H7EKR39yawZkFsrXRLAhbCK4VayvyL1lr3dClHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIvYTYf4ZZUtA8PeomYaaxZ3wiW64APXTpJB+YGmRRg=;
 b=i7Q13wwwb9QwVGXLFC75VhsM4MSKhXDlkdTXwC9dyYA07Yz2Z1s5jrkDGHAQ5rdWdhXl73Ndasu0JtKLOP1+Qbx+Mzg8xpz3paphUZHtW/tBkSoY9VooG+IOKk3rVtN/Xzef9Izkw62yRfm25gK9AmdnBYar7DXH9weIAFLuRrc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3bb50a0d-cb0f-493a-b9a2-06e621fa8d16@amd.com>
Date: Thu, 7 Mar 2024 20:23:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/9pfsd: Fix build error caused by strerror_r()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>
References: <20240307103847.3710737-1-xin.wang2@amd.com>
 <86f363fb-80f4-45cd-aa1f-58b504546422@suse.com>
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <86f363fb-80f4-45cd-aa1f-58b504546422@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: a144c132-5ccf-412b-772a-08dc3ea16607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hre+SexOKZrYlN2K2LkRXjps/vCe7LeUe3JT10hNX4AwUsLBES/MfKppIHfwOInaTEnkoI+0lh2IBgDSuBIfYAllrGj2WQJ9TRBQljzQYXzsib65ivi3FUTfr5K4fc3g0jCq1qxhpQD7f9IpF7i7j+IVHjJ+ZfPXtUqXKvETJ9sb7N38hSU1O7StxU8VyU2E/ipgo4NeJWqioiqcpjaMVC359w2GAfrTBLhRGZTXI5ncPDyz/Pjez64HN2D2mYsusHMSBKOZF9jFNw2Nq1AOReCz+lKZbF96DvziCXu9nH63hShpApwY/8DStVvBdJbXHaA1nVt64n3Ly0nTeagqB2AbV7W9ukPo7IfPtagPQjSWmGdlMbShnNjJNmISnEzrObsHg4wX+ttIBjxhYtzYspnpRfZUfPsmTsWxie2h0Q2rC5XuZ7/dA4vq965r8oMHvGnVicOoJAq6rwDv8RCes2Vy2DW7QwUgw4DicmBoty4H94UQGCsFU3nJoIKt2R8jM8kCwJTk9Dsr0+ukLolJQlve+qDv6ZBUU+82IgOGP3SAVq2o+KM+VHVUwjrfIAS48qZxGVLx6Bh2sBvQ5kDoEFWrIcsGzN+j9VdtguHMmNo9JjH0P6/UkgFl+unGmVnyj+qLhi+LCTVt5frPRiqbyMmBnwMuPXQS2W/gmun/6+enjDPjWqk9yLVPCkXvjUreIJIIopMacFJofSKNcVRBNWWFcq+zNoh8b1p00XwDb4ZB4RdPOO5JHGekHGsTz6LI
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 12:23:30.1564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a144c132-5ccf-412b-772a-08dc3ea16607
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342

Hi Juergen,

On 3/7/2024 6:51 PM, Juergen Gross wrote:
> On 07.03.24 11:38, Henry Wang wrote:
>> Below error can be seen when doing Yocto build of the toolstack:
>>
>> | io.c: In function 'p9_error':
>> | io.c:684:5: error: ignoring return value of 'strerror_r' declared
>>    with attribute 'warn_unused_result' [-Werror=unused-result]
>> |   684 |     strerror_r(err, ring->buffer, ring->ring_size);
>> |       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> | cc1: all warnings being treated as errors
>>
>> Fix the build by using strerror() to replace strerror_r(). Since
>> strerror() is thread-unsafe, use a separate local mutex to protect
>> the action. The steps would then become: Acquire the mutex first,
>> invoke strerror(), copy the string from strerror() to the designated
>> buffer and then drop the mutex.
>>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>
> Maybe add a "Fixes:" tag referencing Jan's patch?

Yes, will do.

> And I would expand on the reason why you are using strerror() instead 
> of just
> checking the strerror_r() result. Something like:
>
>   Using strerror_r() without special casing different build
>   environments is impossible due to the different return types
>   (int vs char *) depending on the environment. As p9_error()
>   is not on a performance critical path, using strerror() with a
>   mutex ought to be fine.

Thanks! Will add in commit message.

>> ---
>>   tools/9pfsd/io.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
>> index adb887c7d9..2b80c9528d 100644
>> --- a/tools/9pfsd/io.c
>> +++ b/tools/9pfsd/io.c
>> @@ -680,8 +680,18 @@ static bool name_ok(const char *str)
>>   static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
>>   {
>>       unsigned int erroff;
>> +    static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
>> +    char *strerror_str;
>> +    RING_IDX strerror_len = 0, copy_len = 0;
>
> I wouldn't use RING_IDX for the type, but unsigned int.

Ok, I just mainly wanted to keep some consistency, but yeah unsigned int 
is definitely ok. Will follow your suggestion.

Kind regards,
Henry


