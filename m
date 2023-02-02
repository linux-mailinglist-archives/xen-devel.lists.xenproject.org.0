Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078656876FB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 09:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488585.756716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNUcA-0006jF-L0; Thu, 02 Feb 2023 08:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488585.756716; Thu, 02 Feb 2023 08:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNUcA-0006gg-HJ; Thu, 02 Feb 2023 08:06:38 +0000
Received: by outflank-mailman (input) for mailman id 488585;
 Thu, 02 Feb 2023 08:06:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8a/s=56=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pNUc9-0005Ed-En
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 08:06:37 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 813f7dc2-a2d0-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 09:06:33 +0100 (CET)
Received: from DM6PR02CA0116.namprd02.prod.outlook.com (2603:10b6:5:1b4::18)
 by CH0PR12MB5217.namprd12.prod.outlook.com (2603:10b6:610:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 08:06:29 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::88) by DM6PR02CA0116.outlook.office365.com
 (2603:10b6:5:1b4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24 via Frontend
 Transport; Thu, 2 Feb 2023 08:06:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.27 via Frontend Transport; Thu, 2 Feb 2023 08:06:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 02:06:24 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 02:06:21 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 2 Feb 2023 02:06:20 -0600
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
X-Inumbo-ID: 813f7dc2-a2d0-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRtbGVeTBKtkpfJcQG1VdvQnehbswqo7QDHWa4TgQVDrU/IQOSVc1t+3HQsqowqIMZe2/TWNx2fpAdFmV1AxGiP7zUwn9+zYDw26u+IUjD/JaFU9l/hpwRXICiIeP5nkiZGtkdftllXfC9MGljAfRk2++mECiyFNvoc2GiI1AxyWINnMMajtKR1mQriBdxT53WeihdRGuW2Yu20QF4rvLM8a9KbGyDAEhMrn3tOZDUt7IKixuotVbOufTQsfa9vppuPRlVN99T7Z4k5+N9flQ+YT/STJaAiBD2eVs3LUT6gnCr6uG7BB8Ymw/zXjPe/r1C49RHhErZ/qaGUhMEmz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7VC1h+8je+j4d4guKURpOqcDAiPdLiwramoPfCIikg=;
 b=bLESw6IL0/GHPSTVP/8kNOxrQutaXSgPiEg/QqwdBkRV9cFKkqWy8yKrNiifVV1qQM3c47Sof4cVydAFJP1B/jbyfSxxbaBogqW3LfZVBwhqc73/hX43AEx4uN/mOY5Fk95eNkN71b/BYs5cxKAGiR5yk/wRLIwqXiXOoASGs2fuERsGDNZ0Rto4K50H9OpfAqn8+uBTcp8XeGd4eIxrbh0w0DvCAq9+0vlepEMJBKsm4He2vezaP40hasiUesM26QUii4Ut2tHSwCLnz0ICZoxFKCoVe2dLuiVkiZyuC1NUawkpaLAumwvedru9v72/C17zSn9EpLJniDWY/6Ijhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7VC1h+8je+j4d4guKURpOqcDAiPdLiwramoPfCIikg=;
 b=1gkcNles5cerb5VVw31kyPoey2aflHmjib9LYuP4Gzmh7+2frQ0ePY0tYmEnFNM5quuF9sb8eNrPFofQqBLheNChb1IQhb2b3E0sz/PZYE31bJVRjDdy9SzAJGquvS2bmynijjokLX7oOR40HIeS2AWgzb6zBr0CF9pSSGGbXq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f1549a1d-785b-6052-5b3b-bcd873b21576@amd.com>
Date: Thu, 2 Feb 2023 09:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] xen/arm: Add support for booting gzip compressed
 uImages
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<ayankuma@amd.com>
References: <20230131151354.25943-1-michal.orzel@amd.com>
 <20230131151354.25943-3-michal.orzel@amd.com>
 <653d05c1-a860-052c-4ce2-55998c77db42@xen.org>
 <442d7e6b-9b51-69bc-48ea-c844427a4a97@amd.com>
 <f45dfe55-ca51-7aa0-ef9a-2788cfead470@xen.org>
 <7c09b900-6568-e57d-3256-2cf72a73690c@amd.com>
 <6d3638e0-5613-ee7b-d919-1db3cd0ca2fb@xen.org>
 <bbb9e223-5112-4370-d569-c78b6ab609a8@amd.com>
 <1c9d7bcb-9ef1-8940-f709-a361285ad206@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <1c9d7bcb-9ef1-8940-f709-a361285ad206@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT067:EE_|CH0PR12MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 542277da-ec06-4079-61fc-08db04f46370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D8+8VKL9GfYLkS3emGDRrAMXHVvqIAa58T8K8sFtyekj9065IMcCKaBs8gCRZHzEtAv89/w9mvSkur8fTNNLTP9INC57WShjNUlNtZdTR2gFeJD6DJV/aI3hK2OnWoa/lh5ljxhUxK5K0oAaqUvhyi/AxU4OOAhRC3D12cyW+oGEUsYUrUD1nzFE4QtJbglxH0NwVJTOwNk4p7gGsOdrIBGT9FpTeLqPGLnV7yelBp8D9lDqicRN6KRIwT5zNM6352T+vVSVSLsi/kchcpC8tFIIiGAts1h7Lw+UONUDBUiA5ejdGBsK/mpM2BzNxmcS8vTuWShkqDtgHX0HqsNSapVfzyNFv5t5frHRVKkpHzkC7Fzx6ztzV7/y2rgFXgDvcZ3qJ1XcbHpt2XbtZ3yN6Z6+CY7rM/h9G1iM6N3yke0/gSKIxYdFT54xCp0uuD97iaQ/qworwFoCKqht4/KZmqjRFon05TswFT+nKk5yHHO6tK3iXSEglMcFH+7Kd98dSSrA1LFkIi755vXk482Om8Ew41Mdag1yjkiRa7r4gkvy9CSMlFwNmGX02cDyAqW/BN3dwFqy1UgjlgkpYQh6FFk+PBwXJTtscDeEVYKVvwsE5wd+aUqVe0g6oPLrByqyQs5roZp7RXQHwAg4eDD31gTGEU6umsE76/FWGgYRFQ0XLFm+QRLBxKyl9AOgMtOYHwHZr4DcrcDxG3hGCCsz0jTtVLZpCph86S4+SXISaPQ1vO71JF5mSYAFXE/UUVQ4CjlDc8p23EJ70atmVype0Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199018)(46966006)(36840700001)(40470700004)(47076005)(356005)(81166007)(82310400005)(86362001)(40460700003)(36756003)(31696002)(40480700001)(36860700001)(82740400003)(31686004)(44832011)(4326008)(8676002)(41300700001)(2906002)(8936002)(110136005)(54906003)(16576012)(5660300002)(316002)(2616005)(83380400001)(336012)(426003)(478600001)(26005)(70586007)(70206006)(186003)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 08:06:28.9116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 542277da-ec06-4079-61fc-08db04f46370
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5217

Hi Julien,

On 01/02/2023 19:54, Julien Grall wrote:
> 
> 
> On 01/02/2023 12:56, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 01/02/2023 12:20, Julien Grall wrote:
>>>
>>>
>>> On 01/02/2023 11:01, Michal Orzel wrote:
>>>> I would prefer not to do this in this series as the goals are different. This series is to remove
>>>> the known Xen limitation.
>>>
>>> The reason I am asking is it effectively change the way you would
>>> implement. If we were going to support zImage/Image within uImage, then
>>> we would need to fallthrough rather than calling kernel_decompress().
>>>
>>> I am not aware of any at the moment. Better asking now than realizing
>>> after the fact that there is a need...
>> We need uImage support as there is more and more need to support booting
>> raw images of some RTOSes (there is always additional concern \wrt booting requirements
>> but at least the header allows to try to boot them). We are not aware of any need
>> to do some special handling to parse more than one header + from what I said earlier,
>> this is an unusual approach not seen to be handled by anyone.
>>
>>>
>>>>>> This could be solved by doing (not harmful in my opinion for common case)
>>>>>> addr &= PAGE_MASK.
>>>>> I don't quite understand your argument here. We need a check that work
>>>>> for everyone (not only in the common case).
>>>> As we assume the kernel module is at page aligned address (otherwise the issue you observed
>>>> can happen not only in uImage compressed case)
>>>
>>> I am not aware of such assumption. It is allowed to use non page-aligned
>>> address and it is correct for Xen to not free the first part if it is
>>> not page aligned because the first part may contain data from another
>>> module (or else).
>>>
>>>> , having a check like
>>>> this is generic. I.e. for normal usecase (no uImage compressed), addr &= PAGE_MASK
>>>> does not modify the address. For uImage compressed usecase it causes the addr to get
>>>> back to the previous value (before we added header size to it).
>>>>
>>>> Apart from the addr, we need to pass the correct size (as we extracted header size from it).
>>>> We could have the following (with appropriate comment):
>>>> size += addr - (addr & PAGE_MASK);
>>>> addr &= PAGE_MASK;
>>>> fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
>>>>
>>>> It does not look great but solves the uImage issue and does not modify
>>>> the previous behavior. Anyway, I'm open for suggestions.
>>>
>>> Two options:
>>>    1) Move the call to fw_unreserved_regions() outside of
>>> kernel_decompress().
>>>    2) Pass the offset of the gzip header to kernel_decompress().
>>> Something like where it would be  sizeof(uimage) in the uImage case or 0
>>> otherwise.
>>>
>>> I have a slight preference for the latter.
>> That is cool.
>> I'm in favor of this as well because it would allow not to set mod->start,size
>> from kernel_uimage_probe. Everything can be done in kernel_decompress:
>>
>> Diff:
> 
> A few comments because you resend the patch with it included.
> 
>>
>> -static __init int kernel_decompress(struct bootmodule *mod)
>> +static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
>>   {
>>       char *output, *input;
>>       char magic[2];
>> @@ -201,8 +201,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
>>       struct page_info *pages;
>>       mfn_t mfn;
>>       int i;
>> -    paddr_t addr = mod->start;
>> -    paddr_t size = mod->size;
>> +
>> +    /*
>> +     * It might be that gzip header does not appear at the start address
>> +     * (i.e. in case of compressed uImage) so take into account offset to
> 
> NIT: I would use 'e.g.' because in the future we may have multiple
> reason where the offset is not zero.
> 
>> +     * gzip header.
>> +    */ > +    paddr_t addr = mod->start + offset;
>> +    paddr_t size = mod->size - offset;
> 
> You want to check that mod->size is at least equal to offset.
Sounds reasonable. Thanks.

~Michal

