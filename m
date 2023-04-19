Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB76E7E84
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 17:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523570.813745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9uz-000157-N1; Wed, 19 Apr 2023 15:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523570.813745; Wed, 19 Apr 2023 15:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9uz-00013N-K4; Wed, 19 Apr 2023 15:40:25 +0000
Received: by outflank-mailman (input) for mailman id 523570;
 Wed, 19 Apr 2023 15:40:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69VN=AK=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pp9ux-00013H-Sm
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 15:40:23 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d717ad5-dec8-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 17:40:20 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 15:40:17 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94%7]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 15:40:17 +0000
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
X-Inumbo-ID: 7d717ad5-dec8-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGQkYB+1If2dlpkI1fyLEM+3nTfmAaivMRP6zX1z01O6KVTUOU5DzvCmknt3GydlCzya5RRgH1pbHSdEVpsez3G/Xw2WNvDyo5RWbSVM3YFfxdfEguNwyloQaP1v0qkVm6Uv5zI+jWTW/PS0r3WqpsECgxqRjNdOrjrg6EStLuGccfA6gKb32euGJfMio37XWBo60p493/bNfDT3pb3RJhMSHWQ6oIRHh5utGVgQbOSG6B+7aqtbzbdA5p6ObtWjmPWdswy9IA3MRpMuSpa7Lu4kpCs+YUizWqmC8H5ha22oZuq1XuEp3SiS+Rmy75hOQ3CoCmikIPj41fGU/wNfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeXM0AacA8l146vdLOHHv0X0V//zGxDisucT65c7Oxk=;
 b=YMrYj2TwTyvyk36Od3ObCb3aUA0OmLTOGaCTstf4UeavMzyejSWaBsLz/pRpZ5b8Yr1dnCOeHHuUBlTm4Zew1f5/VQI8pqB/Ctp0ymmSNEKWBOj7/FKpPM0gr0NLQnZUk+d6XziPu4zvIw4+PM8g3F1RthHv42etQQ4gfPhr+2RzzxqdNKYNixoRtieSoGs49JDvgRSGanVYPYy0BL8LYrjLrvjC1PlFpQBKvMNJ2femsKkg9boDWhc6EMCQfwEXW04kcLPcL/iz8CLfBW26Pjm42xLoGEIBtjrRkn2oF1RvsOs+HR5ZtDwCywT1KcgTnAy+mXSe8Cf0u99uzQZRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeXM0AacA8l146vdLOHHv0X0V//zGxDisucT65c7Oxk=;
 b=zDjGmnPfDKKeaiLPitoVkU0pUq9RSonubdxVGZLohUVf/gw3yqitY20i9yy5gFXMfXENYXc38jL0V384eq1AsKoTjcUS5Le1J6BTCEQyLKBZEcUG/kBRGV+OqZ6J/CUHm3yg6+Jt19YuucqseS9VzyUJJGtuCxOeGU7kngGGbxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <561c8918-8d3b-91f6-5641-0313b0df5b82@amd.com>
Date: Wed, 19 Apr 2023 16:40:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
 <8560fac2-5c92-8362-090d-bbaeae3f5d22@amd.com>
 <4e11e153-2224-15a1-2563-0f1a3c5a6a81@amd.com>
 <b9dbb568-e35a-4854-3b75-2b4b3ebb9ab6@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <b9dbb568-e35a-4854-3b75-2b4b3ebb9ab6@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0470.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::26) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN2PR12MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 4206cc03-cb1e-4017-8447-08db40ec601b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CSEIrdmfwPL0RgSW0BtJwCrc9ErgAQNYeJ54B2P1YgVGiys1R4tk9WQXA+GtIhj/sgsUGLWNi8kXP1UifV59SNdZw0GbnoDSNQYp4ekBXK4U4svHM++4HO4cT4YAelz0Tvqzw0sFX9JgfcsjJdO/kjIxumk9jfcJnigzal504ks+QQeDDj1e2BJz7omfBO/8P6MLrFlMm5s18dAV9DsVLsUk7znVHg4eNPZFqUymKjjjW0j8R6gLzPSUa+sF51aM36o/HJSy7FN3y9W/CM4zaI6zvK3LYpg95EdSRIi2JaE5sPSKM83NjtcGeQZziPghmsJsgd13D2SDMyBlrgK6hwga+iPcPJCQyR+m/wF2mZwkj/9uGi2O+zl4do75XK2M4L0/N7+/b22MFWNhb3n7U33BNCScuJnr/VG30lQOzYjJhgcldEb/lbTcN5rFvclE+ti8U/aOSSWryMIZTBHQkOw4ZEablZFtOaLCCsOcTlW6tEEG0arvb4rMa90qFjJg5ioCFh4BZLBC1URkxYNh9f0Jov7O5j32j1Id4vOR/suqua+CuDLChK5GUbLRusl18vjx3+W7fEra8NCUKJejAj2gSicZ+Q8HLhV1GsY3WHFK/g5ntYrjAXr33ZWRDDNszWLAHzguS7Rf1QRrCQT9TA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199021)(36756003)(2616005)(83380400001)(5660300002)(31686004)(7416002)(38100700002)(53546011)(8936002)(8676002)(2906002)(478600001)(6666004)(6486002)(316002)(26005)(4326008)(6506007)(6512007)(41300700001)(110136005)(66946007)(66556008)(66476007)(31696002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWs0ZXVtdzZNcVhqdml2a1ZiREVZRTB4RlRQRUtHZ242WHFFRzgyZmFTOUE4?=
 =?utf-8?B?NUp5L3d0djJMbysrbG54UWtDRlptQm43cVN6dy9qcUljaEhReEJGRGkrSk1r?=
 =?utf-8?B?Q1poenRpeWdQSVVoRVZEY0dPc2NSUkx4enJhRmYvSk5jUEZDdThaN0wyS2Rp?=
 =?utf-8?B?SlBPYXhvUkxBSFVuamZqMVZHMWVvVXoyb05DMXBETkNJYW9xeG5POHJ3aXVa?=
 =?utf-8?B?QjZVRWVqakhRaTg3VzQzSjUxQUI2QnhVWlJ3d3c2c0hvMzE5aEQzRkVBazkx?=
 =?utf-8?B?OTRLdE1Mek5PTkxYUC9HMHZOZ2lTOTU4c3RBNmdYeDlLSlExS05mNW5IdkZC?=
 =?utf-8?B?bU8xU1NsSUhwM0c5MGNKVHlweHB3d0VzWUM0b0RFWUIwaVpCSDRCdVVUZnM4?=
 =?utf-8?B?Q201ZE55TVorMjJ1bWkxbGdXOGxPUzhBakxySjFEVzczNFVITTVNSGszTjA0?=
 =?utf-8?B?TXhmdGtaQzQ4OEhtS09qSnJiQ00xQk9WN3FzVzBRaGlmbDMyYzRJc3NSZEw1?=
 =?utf-8?B?UW5NelEybEpoSUlZTk5GWWRJQnp4SDFuNVBpd282VUtNTHZFZVQ3aU5yOWw5?=
 =?utf-8?B?b3hjQStTeENmMTVIUE5YRjF1OEFVRHJnN2hwWlc0cGIyQ0JLY1BnREd6M0E5?=
 =?utf-8?B?dVJvR0lrNmplUjl5cXl0S3U2SUdwTVZDN1dTb0VmQnV6OVY2aXVNOXpGTzRX?=
 =?utf-8?B?dHMzWFNEemgvYzZyYXAyeVBSazl2djFTQUFCcDhkTnhiQ1BlTmNiSGwwZmtN?=
 =?utf-8?B?UnRlbVdWZFZQYlJVOUN3MTBmYXAzRnNldGU5UzZUdkZlVlUzU2VJZlk2RFhK?=
 =?utf-8?B?U2Fkb2xXelZNbVFsanV1SWVvRmxONUVoSUJyUmdyR09kQTZ0QzM3b2lWMGto?=
 =?utf-8?B?Y2Rsc3dRaTJLcXNLSGcwTWxTSzE5dk9naG9lN1hxcmFDQ2VKaVYxdHJZYmh4?=
 =?utf-8?B?b0VWN3EyZlVablIwUkdhOVlmSnRZcFBaN0xrNWxlcE9lMVdrSjRtQitZU1Uz?=
 =?utf-8?B?V3BtNG9hU0tHZmZoYjR4RXl4Ry9zTVJoajRyd01ERXJJd2RWZUh4SmI4WERu?=
 =?utf-8?B?TzB4eUtWOStKOVFvckFQeFBRUG1vZUhRQUppaG9KRzczajVEUkNsb0IrQ0dB?=
 =?utf-8?B?bExINi9GSnpiT1k1ZmJLcGI1UWRYOVhTUm01bzZ3RHdSK3dFZWlqN051aGo3?=
 =?utf-8?B?b2NxS0d3dnBwY1QxVlJubG5mNUxvdzhjUDgxQU0vVVNCK3dwOW9WRmJscmhB?=
 =?utf-8?B?VFovYU1IQzRTUExqRTdESEQyc2d0d2UrdXRXRk5Pa1pUMDVVNzNXOG1oQ21B?=
 =?utf-8?B?eDJRVU5WcE5tZ3hxbis1eDdrSDBpM2dSM0ladDdYK0g0a0pLdUdCNTUySFpV?=
 =?utf-8?B?L2JMNmIvcUFJb25JVlBUZ25Va3M1d3RMVHZaS3JiRWhucEZURjBheExtdzlP?=
 =?utf-8?B?RnJPNjJjNVRaVkNLTmJ4eE9QL3pYaGZBd0RTOWdBR2NER1Q5b3lpZ0hzZS9Q?=
 =?utf-8?B?bEFCZ3RaRk1ZYU8rNFBiOEdFalNtTVFHWHZOdmprVXlsdkgyWjRsTmx5WFRt?=
 =?utf-8?B?SjdxR1dYRCt0ZFJnaVp0bVpTb2tQQjg2dmtQSXdkYW9sTU5GWmhrM3JkRGtW?=
 =?utf-8?B?T1dkZTN4dkIveEF3cEwwTDVQanFqTEJIc29UZ0ZWUnlGUi9Gak5EMTZJbWp0?=
 =?utf-8?B?RUpDQ2tBVGkxeVVJTFlwc25PVUhjTkplUG00RHpzRFdPRGYzYlFNU2w4Vlhn?=
 =?utf-8?B?N1JHUGJoQjRpQkR4Y2Q1d1hTanJSWGl5KyszUlRCTmM3S0Y0WWhEL0NRVjZl?=
 =?utf-8?B?eEM1VzBVMGhVQnJqQ3FOUUQwcjlxcENCMGRDRW40dld3VTcxd1NqdWdGQ0lj?=
 =?utf-8?B?ZnJkZzN6WFBPaThXTDFRS1Z4RnJvS01FQVZyNFZwM2dJMkVVNDVUbS85dmpw?=
 =?utf-8?B?cjV0aG1NWUtKK3lrY1pDcCtZK05JS0VOM0RGbmlCcDl0OHJsWkZ5WTZjdnor?=
 =?utf-8?B?OGJURGJFd0lNYm1qR1llMUlDT241dVcyN2EvdkZ1aTJKbFdxb2VQamt2dTFW?=
 =?utf-8?B?WHFrb2FXdUFSa01RTXlSNzM5azROWUd5WmhTa0kwWWVsMDJzdzFOZmYxM29E?=
 =?utf-8?Q?dTCzQ8oUBebpa6a2kpFEx+HIo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4206cc03-cb1e-4017-8447-08db40ec601b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 15:40:17.4744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+K+RgsLuc8o7xx9QLDppJdQ3JvEIlSMnzdcbXEfqRvqdqVXplJK0Joc7hMyNq0AnibXowKHzQ1qMa53l3c61w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470


On 19/04/2023 16:18, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 19/04/2023 15:58, Ayan Kumar Halder wrote:
>>
>> On 19/04/2023 14:54, Michal Orzel wrote:
>>> On 19/04/2023 15:19, Michal Orzel wrote:
>>>>
>>>> Hi Ayan,
>>>>
>>>> On 13/04/2023 19:37, Ayan Kumar Halder wrote:
>>>>>
>>>>> The DT functions (dt_read_number(), device_tree_get_reg(), 
>>>>> fdt_get_mem_rsv())
>>>>> currently accept or return 64-bit values.
>>>>>
>>>>> In future when we support 32-bit physical address, these DT 
>>>>> functions are
>>>>> expected to accept/return 32-bit or 64-bit values (depending on 
>>>>> the width of
>>>>> physical address). Also, we wish to detect if any truncation has 
>>>>> occurred
>>>>> (i.e. while parsing 32-bit physical addresses from 64-bit values 
>>>>> read from DT).
>>>>>
>>>>> device_tree_get_reg() should now be able to return paddr_t. This 
>>>>> is invoked by
>>>>> various callers to get DT address and size.
>>>>>
>>>>> For fdt_get_mem_rsv(), we have introduced a wrapper named
>>>>> fdt_get_mem_rsv_paddr() which will invoke fdt_get_mem_rsv() and 
>>>>> translate
>>>>> uint64_t to paddr_t. The reason being we cannot modify 
>>>>> fdt_get_mem_rsv() as it
>>>>> has been imported from external source.
>>>>>
>>>>> For dt_read_number(), we have also introduced a wrapper named 
>>>>> dt_read_paddr()
>>>>> dt_read_paddr() to read physical addresses. We chose not to modify 
>>>>> the original
>>>>> function as it is used in places where it needs to specifically 
>>>>> read 64-bit
>>>>> values from dt (For e.g. dt_property_read_u64()).
>>>>>
>>>>> Xen prints warning when it detects truncation in cases where it is 
>>>>> not able to
>>>>> return error.
>>>>>
>>>>> Also, replaced u32/u64 with uint32_t/uint64_t in the functions 
>>>>> touched
>>>>> by the code changes.
>>>>>
>>>>> Also, initialized variables to fix the warning 
>>>>> "-Werror=maybe-uninitialized".
>>>> I can see that now you explicitly set to 0 variables passed to 
>>>> fdt_get_mem_rsv_paddr()
>>>> which haven't been initialized before being passed to 
>>>> fdt_get_mem_rsv(). Is this what
>>>> you are reffering to? I cannot reproduce it, hence my question.
>>> I can see why did you get this error.
>>> Before your change, we always checked for an error from 
>>> fdt_get_mem_rsv() by checking if < 0.
>>> In your wrapper fdt_get_mem_rsv_paddr(), you switched (not sure why) 
>>> to checking if not zero.
>>> Becasue of this, you got an error and tried to fix it by 
>>> initializing the variables to 0.
>>
>> I actually wanted to return the error code obtained from 
>> fdt_get_mem_rsv() to the caller.
>>
>> In this case, it returns a single error code.
>
> I would rather not rely on this.
>
>> So does this look sane to you ?
>>
>> diff --git a/xen/include/xen/libfdt/libfdt-xen.h 
>> b/xen/include/xen/libfdt/libfdt-xen.h
>> index 3296a368a6..1da87d6668 100644
>> --- a/xen/include/xen/libfdt/libfdt-xen.h
>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>> @@ -22,9 +22,8 @@ static inline int fdt_get_mem_rsv_paddr(const void 
>> *fdt, int n,
>>       uint64_t dt_size;
>>       int ret = 0;
>>
>> -    ret = fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size);
>> -    if ( ret )
>> -        return ret;
>> +    if ( fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size) < 0 )
>> +        return -FDT_ERR_BADOFFSET;
>
> So the problem if you check for ret to be non-zero. But the caller of 
> fdt_get_mem_rsv_paddr() check for < 0.
>
> Given that fdt_get_mem_rsv() is not inline, the compiler doesn't know 
> that it will not return a positive value (other than 0). Hence why I 
> think you get an unitialize value.
>
> The snippet below should work:
>
> if ( ret < 0 )
>   return ret;

Awesome, thanks for the explanation. This works. :)

- Ayan

>
> Cheers,
>

