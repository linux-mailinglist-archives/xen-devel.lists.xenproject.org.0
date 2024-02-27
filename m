Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5620A8691B2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 14:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686170.1067840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexRf-0001cx-2W; Tue, 27 Feb 2024 13:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686170.1067840; Tue, 27 Feb 2024 13:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexRe-0001au-V9; Tue, 27 Feb 2024 13:24:30 +0000
Received: by outflank-mailman (input) for mailman id 686170;
 Tue, 27 Feb 2024 13:24:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fto1=KE=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rexRd-0001aI-KX
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 13:24:29 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 878b1bf5-d573-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 14:24:27 +0100 (CET)
Received: from BYAPR06CA0012.namprd06.prod.outlook.com (2603:10b6:a03:d4::25)
 by IA0PR12MB8304.namprd12.prod.outlook.com (2603:10b6:208:3dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 13:24:22 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::ce) by BYAPR06CA0012.outlook.office365.com
 (2603:10b6:a03:d4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Tue, 27 Feb 2024 13:24:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 13:24:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 07:24:21 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 07:24:21 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 07:24:18 -0600
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
X-Inumbo-ID: 878b1bf5-d573-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyLxjzTldQQEazV08EdsnjoNw4HzhX+HfsWhaavy281yB5GWgLU3ZqDqk3Vr38rAwZfjA4M9p+VjGjtRytRgKrFTZLxiYViaxGYS/YxA8t2UVotzyua6DsZuTvtR5qYc3XWD+fb/ieJBrzYYr2McS42tp7BrB1yuWd49X2qiW3wLAhfL8AR571z12dUvqFeqVkrosxtX1PBmlU8SV33Wd6VZ47LKYaUvqP7q4axhG0tQaW/Dekhfb61Bdzy2rhG282cE6g1AvEPSBw+dhE3XrteNJ0djJPxMHvX+IgcZS5qcYd29Qh3YzZxZnitujVc8sTk73AChEoij1fYO/zfWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrzLqgCioMChk63CLo+D5m7J1D016EnpPjTTKejBi8I=;
 b=ZEEk5+SXQh0GKSrPqwkpbGPlJjriquDUf89VusHnZe/1nEsUAVYmYNIo9idvC9eQIbX0MhB8xhvNzOzh4sJBPgfuPyeRZaEczwgURLHjyB8gOT3Z6YR1lBFBj88IpwKoCHGsx+9nVubvBGuRHuJKqD75CbQ6j8OglBUGJDdJYJUTvlQImtvVKDfGcBQgB0+kLaRDrjwUzEGgXBSlfOiMXn0CovJU5I0SZ6zLHOYQ/tOohVXG9CiSzno3L3Ad6zyjkVTDFmxomq42KURLkYhemOK9so+PZR4MP5ZOT3IGwq0IfX+c1OkoLYsrKeQNhu5Er0khQkaqdmPtfnA+C+kwYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrzLqgCioMChk63CLo+D5m7J1D016EnpPjTTKejBi8I=;
 b=MZMGGWHzZWxNe9gkwbRHBlE7UwEkE0MwnZE1Vkj6wfsMxnQap5SNS+u7ZtFcRdW2w0b+ebXJNhksWBKOQNg9hVunCg36R6ybnVWAEP0Y0bv7qoE86PUjtmf4jOdHkMjxBkp1DXW2PEhnRgXd6SyY+FZ1jAI/bSebHLiQRdKckQI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c3edf84d-3177-4125-bdd6-ba99190340a3@amd.com>
Date: Tue, 27 Feb 2024 21:24:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <b41daccb-d402-4da8-bc88-933facd088a8@suse.com>
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <b41daccb-d402-4da8-bc88-933facd088a8@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|IA0PR12MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: 13af9ca9-5b1c-4ced-2cd9-08dc3797691c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bt6SAEwumedJDIynDD0jkCObIsEeoslWjm15FUz9Fz16UFhUlFqyrSaRMhmjrDp0AzATermYRyjOI+mXGmI5AE4CP4eKXYzpU39e6CHwo7RIzSToJsrzA0Nj5c3BOPfqNagFE/pRPrEs93ETGjU1YDeloRtuMCqPk1XSRRIhEGXkHm+uN3n1xXrbZvJ5lEEt/Y2/iGiEBpPw+obpVMtdkE+gcMe/EyecuVnd9rrH8+wMCIvk9jPdmP1o5uz0Gb6xYp7LOx+B735RPjHMtdQPRugSv/0EDf9UaT8mxNOjCMgWa3SQ77ezLNvTMfxxsmKMPdABOI+h9NRABBl88YOAEA9DbvZraQPw2TBReQrznh3PRVmXGqLjHGp6ajmf/6rRRhXzfvNCA9jg1sc7DkvBW/aDVQ9YCWWsAvad/nbMxRzvSUBST2lOaSrNav9f3USIhI9PkNFLnM8a6I8LjgrM8+R+YUL+7ZimeSnutyY7sR5Kmxhr/f5x4RYwuJ3VdyT1u0kJ0llvYiM8HgdvJhbPRZXwTIS7b92sMf9tcxknotHgneeOf4Z/tpTluFm0wrn+6eFDjRVnk6kK7Frk0uo0LEhzwbeketXxvu3tgpulypIomN1AElCADuZ/DSc2gpVcD8F1zHWrYKBn93PxsbJS12OiCZBjSLTpCteee9y1cQhAgtSNkPxd8tGR9C7tHriyfsyWLqE4cpVfxtfOvf9ka5SAOl1WskpgEIcXBz9mpQKKfvICD9wtWDXfZf7a/fmK
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 13:24:22.1561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13af9ca9-5b1c-4ced-2cd9-08dc3797691c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8304

Hi Jan,

On 2/26/2024 4:25 PM, Jan Beulich wrote:
> On 26.02.2024 02:19, Henry Wang wrote:
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -428,6 +428,19 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>>       } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>>   }
>>   
>> +#define MAGIC_PAGE_N_GPFN(n)     ((GUEST_MAGIC_BASE >> PAGE_SHIFT) + n)
>> +static inline bool is_magic_gpfn(xen_pfn_t gpfn)
>> +{
>> +    unsigned int i;
>> +    for ( i = 0; i < NR_MAGIC_PAGES; i++ )
> Nit: Blank line please between declaration(s) and statement(s).

Thanks, will correct in next version.

>> --- a/xen/arch/x86/include/asm/mm.h
>> +++ b/xen/arch/x86/include/asm/mm.h
>> @@ -628,4 +628,9 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>       return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
>>   }
>>   
>> +static inline bool is_magic_gpfn(xen_pfn_t gpfn)
>> +{
>> +    return false;
>> +}
> I don't think every arch should need to gain such a dummy function.

Thanks for raising the concern here and about the 
is_domain_direct_mapped(), I will try to do some clean-ups if necessary 
in next version.

> Plus
> the function name doesn't clarify at all what kind of "magic" this is
> about. Plus I think the (being phased out) term "gpfn" would better not
> be used in new functions anymore. Instead type-safe gfn_t would likely
> better be used as parameter type.

Sure, I will use gfn_t in the next version.

>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>>           }
>>           else
>>           {
>> -            if ( is_domain_direct_mapped(d) )
>> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
>>               {
>>                   mfn = _mfn(gpfn);
>>   
> I wonder whether is_domain_direct_mapped() shouldn't either be cloned
> into e.g. is_gfn_direct_mapped(d, gfn), or be adjusted in-place to gain
> such a (then optional) 2nd parameter. (Of course there again shouldn't be
> a need for every domain to define a stub is_domain_direct_mapped() - if
> not defined by an arch header, the stub can be supplied in a single
> central place.)

Same here, it looks like you prefer the centralized 
is_domain_direct_mapped() now, as we are having more archs. I can do the 
clean-up when sending v2. Just out of curiosity, do you think it is a 
good practice to place the is_domain_direct_mapped() implementation in 
xen/domain.h with proper arch #ifdefs? If not do you have any better 
ideas? Thanks!

>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -476,6 +476,12 @@ typedef uint64_t xen_callback_t;
>>   #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>>   #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>>   
>> +#define NR_MAGIC_PAGES 4
>> +#define CONSOLE_PFN_OFFSET 0
>> +#define XENSTORE_PFN_OFFSET 1
>> +#define MEMACCESS_PFN_OFFSET 2
>> +#define VUART_PFN_OFFSET 3
>> +
>>   #define GUEST_RAM_BANKS   2
> Of these only NR_MAGIC_PAGES is really used in Xen, afaics.
> Also while this is added to a tools-only section, I'm also concerned of
> the ongoing additions here without suitable XEN_ prefixes. Any number
> of kinds of magic pages may exist for other reasons in a platform; which
> ones are meant would therefore better be sufficiently clear from the
> identifier used.

Yes you are correct, like I replied in another thread, I will undo the 
changes in next version.

Kind regards,
Henry
> Jan


