Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76673791957
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 16:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595269.928781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdABV-0006ep-K1; Mon, 04 Sep 2023 14:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595269.928781; Mon, 04 Sep 2023 14:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdABV-0006bW-G9; Mon, 04 Sep 2023 14:04:09 +0000
Received: by outflank-mailman (input) for mailman id 595269;
 Mon, 04 Sep 2023 14:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ceyR=EU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qdABT-0006bG-HN
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 14:04:07 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e83::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e81c99e5-4b2b-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 16:04:06 +0200 (CEST)
Received: from BL1P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::12)
 by PH8PR12MB6889.namprd12.prod.outlook.com (2603:10b6:510:1c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 14:04:01 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2c5:cafe::93) by BL1P221CA0001.outlook.office365.com
 (2603:10b6:208:2c5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Mon, 4 Sep 2023 14:04:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 14:04:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 09:04:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 07:04:00 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 09:03:58 -0500
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
X-Inumbo-ID: e81c99e5-4b2b-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZOltmfR7PaYWuWegK3MZPzKqvcs4arjanyq82dVIEbxUiTTfPZl0UtH5OR3cy6YPl3Nr0rt/SuN8rDxbmyhBYQvL+tWVmW9KWmWXWdDVQZHsM9QpSN1d0QJ2dGqlOA2CoboBQjJUak+VXiPiprXhbUbkgD/zMfDcpzavnFue2QFblJ5KGHIk6hdY5S5NwQF53ufck5KIxq43pcoiCqs+DziiIkvWYm6rGgQmzNTGIce7kyZ/Ci4kHtgZyN36p0BM7wFKD/USYg27jDE7Qfxinv4peCrgJNiel4RnmQJk6FfZy/F61EEy7pui/rJm4PzXxVwrnj4AKA/IBylkwJRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP8xNuXL0PAriXUf5AHCn8c4rfj0NpsovbDCdgUptzM=;
 b=bxwyE6sTQtLxEwl9hPJBCiYKv8Xh3xIWFnBRPdo4mEtl4wZ7Rvq3hcwSpnPQB784gfNDJZ4Mx98JxKqD57+167SUvT1cUYWl/1W2VY7FJq9P4TS96uXEk0Sqw/QcQh/YC0cthNq0IwL0QXfXWFUYYp7fLYhRKJotAMeXD6mMPOKJpLjKRaOcbb5jIzUq0hJdruiEn1vPvE5j4TWFObQABnWz1jwM/3bK4XNZ/iXRsTShApkJAmp539idWaMge73ij6cGvaAMKrsvjkkfIdLGJUHbcqWR92tStH04EAQBEdqX8ECjOXzhQmqjOI/dR0qYxynj6K/kmFEi3K2QkF7Ckw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP8xNuXL0PAriXUf5AHCn8c4rfj0NpsovbDCdgUptzM=;
 b=MNmZpaXOWIxSuYO1+TbfmWprILmcQDMvfyYr/Z5otamE0mSSL+aZZqCCYPaLBL6uPmEdOo5HpzMk/Sm2MtyUz10Jujo6ZWmGw+ir/3Cp1sKCznJlklAwPJz8N6hcTfHTLt20HIi66KbfNln0pXYYvpGJHyngDk5ejafnoQcO86E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3538634f-61df-efc1-e45c-ba4c01b5014b@amd.com>
Date: Mon, 4 Sep 2023 16:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] xen: Change parameter of generic_fls() to unsigned
 int
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20230904091406.942-1-michal.orzel@amd.com>
 <20230904091406.942-3-michal.orzel@amd.com>
 <ec00892f-d9e8-1095-fb27-c344caa6aa28@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ec00892f-d9e8-1095-fb27-c344caa6aa28@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|PH8PR12MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ae584a-0806-4093-2027-08dbad4fca99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U+X2mD5qo0xR/GTXpAGnDelYE+cFdfUMO3B93bHfLYw1PsXiaDBDC6WrOaxhlssTdtxBav784Ha7RshrXRWwgctAFq5ep0dD+rFTQXBed66BgFDJfud/0TvR0NJzaGY+/Z3Jk44JayVKP8kE8/zoWe6tOIugBYMFk5kycgMZeu+awfiwEI6aq76z8VHVlvm9ri29CbIJyh2Pyo8RUpK8zpx5CMoxDb+qDvFwNf0h90DwuOfjYaE18bp3f9J9vNlXC1MFQcy4Rv7U19BPPiX+mdOwXmh5kawev3xWUHvCmh4fz6wMAUqn1xDCpCwfxCgYWM4HxE5XWwpwEdHJOtcgcQWIrtI7FqkpxOL0rQu7oy5V0sPKxvtgLgf3UP1L2doEk4RVMqY0fEF0lospPkSfiXd8RDthIiC61Z4JXgNaTaQXrD6A4eWA77c/a3+Fktb8MSIVAhxyQaCKSnD4wIAfjDKQD0OdnjJqeqzCLqGEdoZfEFYAGngUMsf2pCXRec3ZJZU54QA79su36K+BFnP+lThJo5KAEDOQz6UkosgFJ+o5p4+5gCaXe9Q9XXP+DSQtZGAKo/uE2CNWQpf8hbP81UjcJp8oWGUVYBRR/AkTOWzEXrtOnHWbjYIX+iIw7ejxwBm6MhZDr9L/5xMEpAfk3/wbsTL2oBdeEl1vVHOFEId4EFzFybgupfQ6p+mUm1Ac2NI3ql5FtyYLGSfZeUYg2ga41c4yLycNY1cGAqjcQ6gxphRLZdACeO/NmRcPM8h9oQANoVXXD+u8ESrIVbPLK+k14Bk9hl2qfykSvTKGp9BToo9u30xQF8SJ3SjyD31wo6rPYeVWg2WuAEw9CkqeUw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(41300700001)(26005)(356005)(82740400003)(6666004)(81166007)(86362001)(31696002)(478600001)(2616005)(336012)(47076005)(53546011)(36860700001)(40480700001)(426003)(8676002)(70586007)(70206006)(36756003)(2906002)(54906003)(16576012)(6916009)(316002)(8936002)(5660300002)(31686004)(44832011)(4326008)(41533002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 14:04:01.5642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ae584a-0806-4093-2027-08dbad4fca99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6889



On 04/09/2023 15:28, Jan Beulich wrote:
> 
> 
> On 04.09.2023 11:14, Michal Orzel wrote:
>> --- a/xen/include/xen/bitops.h
>> +++ b/xen/include/xen/bitops.h
>> @@ -51,7 +51,7 @@ static inline int generic_ffs(int x)
>>   * fls: find last bit set.
>>   */
>>
>> -static __inline__ int generic_fls(int x)
>> +static __inline__ int generic_fls(unsigned int x)
>>  {
>>      int r = 32;
>>
> 
> Even if perhaps not affected by UBSAN, generic_ffs() then wants taking care
> of as well, imo. If additionally you switch __inline__ to inline, things
> will become nicely symmetric with generic_f{f,l}sl().
If others agree, I can switch generic_ffs() to take unsigned as well (together with s/__inline__/inline/).
However, such change would no longer fall in fixes category (i.e. nothing wrong with ffs() taking int):
- is it ok at this stage of release? (not sure but no problem for me to do this)
- is it ok to mix a fix with non-fix change? (I always prefer fixes to be done as standalone changes)

> 
> Another aspect that may be nice to take care of at this occasion is their
> return values: None of them can return negative values, so return type
> would better be unsigned int.
Looking at all the variations (including arch asm specific) of helpers to find first set/clear in the codebase, returning int is the de-facto standard.
So, this would result in some inconsistency or require changing at least the direct callers to also return unsigned.
I'd prefer not to be required to add this extra churn at this release stage.

~Michal

