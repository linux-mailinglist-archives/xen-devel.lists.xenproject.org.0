Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C924640359
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 10:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451651.709440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12NG-0001XH-Hi; Fri, 02 Dec 2022 09:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451651.709440; Fri, 02 Dec 2022 09:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12NG-0001Ul-Eg; Fri, 02 Dec 2022 09:30:26 +0000
Received: by outflank-mailman (input) for mailman id 451651;
 Fri, 02 Dec 2022 09:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJJJ=4A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p12NF-0001Ru-7k
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:30:25 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecbfdc9f-7223-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 10:30:15 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH0PR12MB5139.namprd12.prod.outlook.com (2603:10b6:610:be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 09:30:16 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 09:30:16 +0000
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
X-Inumbo-ID: ecbfdc9f-7223-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLt4ZD5WmQ9jkw/osf34dK0TYSoHGtV/aQItlLDUDkzFCbC1def+8urAfioDM8y0jYnGzCDiqzU5hToTyneHbz81IAep62yC6PGBeXZTNc/ihJPZdeMbefbHHGykllRJERx507bxEXrszoII/g4qxp6FKekZMmNemQuhuA60WbD3mg10D1NvmXDdPrVDsLc7+uuOfBtk3swfDcEuBClX2vZtNAD1wHdCfH0FwhjPJVRQaFZy5Nx4cnP5Rh/ZLh2nVr/w3M64cM42abJ9rZEkNgEbriY2/DacIkyhlfEX0aO0zd+oKuo58t/WAHuulY+AP7XF46OxsbAnoaeWaPRUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFVRM6GqmR69Rkton10Je9G+TqBKtrsIIlgkNlTXFE8=;
 b=maqhqkVcoWRwaJPAnH7+g8LxkkUxZEshWNvYRc0vIll9JIvPS6jqJ0+2g0SxAXdB3scR1JNNcNje22axY7ruqJP+BUDoVVX7JEXKxETTokrpQH7lQdF+/SJT9a96YAvf3dq7CxD9C+WJvDGHeq6R0E+tROITebOM3Zi9s3BPeMNEcWrG/wp621kCZc7Ve6IioOxtJDA+4UUTkpc5JcM5JzG/h7Yl5lwyVkiAX7yI1sXZUwQCHsP+1l/4G1ZS1emrKNzAuWYetjQXCegyZKamQRBzfkh915XRWzHwjrWWeeOQMjlsk5/GDnv7T/muGFvtvlZU+122rvqXJk2SXByCMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFVRM6GqmR69Rkton10Je9G+TqBKtrsIIlgkNlTXFE8=;
 b=Jg4OE4XXC2zBMcybmmqSZ1jjz6qBNLceXEGiW9sLIHgqvgCS/u/elJ44A+fR5iirwDw0qf8wSc8cJCy3Hmu+1bkND42IvVBNCjWzWY/8WVpGL49LQL1syG5DhoNMRufY/8SCXJKFvQq+62feBjUyvRl+gikE5zoRkM2j8XJftjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f431e6c5-5525-2029-81d7-3efdc418990b@amd.com>
Date: Fri, 2 Dec 2022 09:30:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [XEN v2] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used to
 shift "unsigned long"
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <20221201181145.45279-1-ayan.kumar.halder@amd.com>
 <d0d974a8-d463-9362-8b6e-cda1691a3464@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d0d974a8-d463-9362-8b6e-cda1691a3464@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::20) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH0PR12MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bfd3bf8-402d-48a0-b689-08dad447d271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ZitfIX/kKSLVS/dkeExMis+yaI9v2GHNGbSmVh2crO/aYDTIsYYrN2Wfufq069h30vagvKHGZoXQFRZ1Jvg9ePZBymaJx0+m5qNgQISxOFM1zD4AxAMskTmB5Iz0p6TVX+tGosLYdB0GErV6Ou72T81CC9shZrOX7fUw6uFO1uiDrwId+Lq+dTDZl6sAO/yc3VN5lLnSajqXZ0OudJWcVoFUiDjaWUJpkrCflreOEgB5L57xEgKJCKHNSA+TKcppr6PoZJ32gsvxNdlAT0XwnK7ha5z7nGlnkXeEDos9w6OYULKvQyR4rWZ3bQRbsQdtsMgfUGTQPd/QvKoTc3v+b/cm/++YEUTfYzfhIciNEajeWxUOQmnM1bW9DM6NDKTzqugqT1kauURoMQLByQyZn0jMRslu3Jg05/I/zk8Vnl5vESccL7Es+UHB3THQcEOZaAfkQvoS0Do0y2u51ypOwiIHaEMOHpZQjQBIWNUkRd1VdD5hLLUeB+wgzAvPq14nAVVZ+xWe/XhP+QZxYQgHijKkfmZZGW05+JgQhu7CPVUTPJq7YIbQrup8EBP4CDUuO3w8oXyRYoxSt1hNTYUY1bqbeP95xtpYtHPUxE0srBF51rIgBVnEOTxxLr7tQDdhFiTQOmEs/ADsZ/PQHhtxlZ374WOB/V1INARMJezuDQXbBFUAsUlp6lo8B9Wmc9pwNKXiswrLtnet2MZHL7DG4dDDLd5TS3x4kX4i1dSbmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(36756003)(31696002)(6486002)(478600001)(6506007)(53546011)(6512007)(186003)(6666004)(26005)(5660300002)(4326008)(41300700001)(66946007)(316002)(8936002)(6636002)(110136005)(8676002)(66476007)(66556008)(2906002)(38100700002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDRwT1ZZajVIT3phblJDQWFJcVVRKzBnbDdscXBsUVl2bklCQldESjN3NXM2?=
 =?utf-8?B?VWVTRGdOblVYMXpmYkgvN0dFMnVoaDZOK1JHb2Jmd3BtbDZ3b2Z6ZXA1YjRH?=
 =?utf-8?B?b0ZOQmFvbjdWaUt4QWpFL2N2M3JxdU1PSGNIQTJHUk1JaUJ6emlvZ01lQXEz?=
 =?utf-8?B?b2FmT21YYVozS3J0QUNhSm15N2w3NGhRcVJncHFqZ2xKSGJNTW5jN1dQM09W?=
 =?utf-8?B?K1c4WTFBSzFHeFlid21JV0hubUNuR3QySmphRGY2bExsNDZ0OVlXZUJzY0E1?=
 =?utf-8?B?d2N5RmhkVUFFaVNDNmdzbjBpUCs2U2o1Q01sMlVZWnZMZGl3bjI3Mlk3WDVx?=
 =?utf-8?B?VUVBVmlaV2xvYWxhWHVpN3FXRXRqS2JRZmVHK0l3a25aSVIzQ3pRR0lnNjFn?=
 =?utf-8?B?TURxa1JZekoxV29tcHQ0VmpaMHFtOURqTXdhTUlSWDVyd0RCRnJ6bG44Si9y?=
 =?utf-8?B?eENTR2pzNXk1dzFVdG9JcGc4K1BUeFhHRkhlNzJPZTlUSFQ0ejM5MjRzaWFt?=
 =?utf-8?B?OEFoM2Z6OUlsSlhWYWR1R1RnMG5MRjUxdUFhaEsyakc2YlRqQWtxTk9xeElv?=
 =?utf-8?B?OU4waDhDaHExOUM2K3dYdFpqbmhLZWJVRmo0ajgrNWRxd0FpWURRTzBBK0dh?=
 =?utf-8?B?TndsZEI2RHB3eWhSNjZ0bVZHa1hhTytIS3J2UXJ1ZlVyU0pNL094OUxiWDZ3?=
 =?utf-8?B?UWRXcElYYjR2RW8xSkpxbWFmK3UxTFJNR3o3UnROVmVReEpvMlMveTZHTzRu?=
 =?utf-8?B?SXp2Z2N0ZFZOazNrSVhSY3JFYkdwQ2RXS2RSK1luZllPRzhFem4veGZXVldV?=
 =?utf-8?B?dmdJRlE0Z3RTZUJWQ0J1ckovaGNZQ2tyZVBNSVlDem4rK001cjBzamV6d29l?=
 =?utf-8?B?NEFRKzZVd0FVUTV1TjErWW9Id3E0R3pDU2NvOHdEdktVRjE4RzRwUlRHb2NU?=
 =?utf-8?B?SmNUZGUxbGNkM2RzdmVYUlA0Q0FXbmYzcklnVldhejZSYVdCZlBrVVh6NDlJ?=
 =?utf-8?B?NHFvNTdIeU02SDk4S3lYQ1FxdThuSVZnR1JtVWZaM3p5ZnB2SzJiN2dFWCtv?=
 =?utf-8?B?ZXFpR3lkZCtEd1VUTXRXQkRnWGRHeXBIbGdzcE5jbVB4QXRNSCt2VlMrcGNO?=
 =?utf-8?B?OTVUM0FwRjFHZHFRM2JScTcwV0xnTVdoUkorNTA3dHh4VGVBa25TdVYxOXVx?=
 =?utf-8?B?N2NUckFGQkQyUjFUR1QzMEJFamhBMUlBTDZ3M0xaSDAyNFhvMFk5RFgySTBt?=
 =?utf-8?B?UXpPdE44alUwTG54WUVUQVFHdWRJWkJBL3VBOWxPWmNDWEFCVW1HK3FZUFBY?=
 =?utf-8?B?TTBSYnhNUWFoeXpQVHRjME8yaHpRMWV6YWlLZVlJOHU4Y0VpM0hyZVFvMnly?=
 =?utf-8?B?elpNT2VueXVCZlM5QWVQSGxXdWdHM281amg5eG42cDJISllNQWZ6MmV5TWdY?=
 =?utf-8?B?QlI5ZTRNNEwxZ2htdzZsNXJkSFpHMkphOGtBVEdqTDBEc3B1VWloTDNhcm5N?=
 =?utf-8?B?N2g4NU1WdjdKdUhHaDFQR0JXcElodVpRQW1EamlCMjFyd21icmNtYlRkNStH?=
 =?utf-8?B?YU1KWllWbDdkQVd0bDN0WjRDWG8yZTRtRjM4d2hWc2graXdtMzY0QkNpdXBF?=
 =?utf-8?B?bnpDcGZ6cW1GRFVNa3RBZHQxOWRiQXBZMkRmSzd6L01xWlp5NnNRRXJ4eGZl?=
 =?utf-8?B?U3IxQkQrL2lNbDBNQklDMzFSNHFFNFRrdWNqb2YxMUhFZHVYZWN4N05OR1pv?=
 =?utf-8?B?VGYyNnhJUDRTSThKL0dKdGVRcURvYUtpWW10cDc2NDNUR04wZ2FiSkhyZkRn?=
 =?utf-8?B?WUphdEs4S3d2THR0UG5MNEpjZ1ZsOVNDTGNFaDZqZWNCNTRzcXkydUpVbVdL?=
 =?utf-8?B?U0VEL3YwTU1EY3YyRFo1ZkpGa2YyNWFiaEhQZ082dzF4UnNaVzZaaml1VzJI?=
 =?utf-8?B?Rkc0OW9pTy83NjdReWFVY1VJRnFpRDA3QmRGbjhUZUZWVFJoNEZvazlpRUk5?=
 =?utf-8?B?ckpzdFg2TklhT0Y4bjFZQUozQStSdmZueTJOejZpa2pMMEdJTmEvbkdZK1dB?=
 =?utf-8?B?dUp1Ky9yL1R2dnh1eVZVZXloK2dnekw4aG9yNWlRVmMvQkg3SGJuWHp5UHBK?=
 =?utf-8?Q?J/JH/JUkYhiwBmsCFMMOcQzp3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfd3bf8-402d-48a0-b689-08dad447d271
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 09:30:16.7124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5jQkc4CN0lgZ9q8qmMPXadIb00RgO4SMtttPun/TzvEpLA03vONLd0e4Rh8Q1aHDdVvriDOpKLJDhGpbk3CDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5139

Hi Jan,

On 02/12/2022 08:31, Jan Beulich wrote:
> On 01.12.2022 19:11, Ayan Kumar Halder wrote:
>> Machine frame number (mfn) is used to represent the hardware page address.
>> This is an unsigned long variable. We need to check if it can hold the complete
>> range of hardware page addresses. To ensure this we check that the count of bits
>> represented by 'unsigned long' added to the bit index of page size, should be
>> less than the count of bits required to represent the maximum physical address.
> I'm afraid I can't connect the description with ...
>
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -2245,7 +2245,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
>>   {
>>       ASSERT(!first_node_initialised);
>>       ASSERT(!xenheap_bits);
>> -    BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
>> +    BUILD_BUG_ON((PADDR_BITS - PAGE_SHIFT) >= BITS_PER_LONG);
> ... the actual change made. Julien, when replying to v1, already gave
> a clear hint what is relevant: The use of (xenheap_bits - PAGE_SHIFT)
> in right hand operands of shift operators. As relevant is of course
> the absence of uses directly as shift counts, which otherwise could
> still be UB (and which iirc is why the adjustment by PAGE_SHIFT was
> left out in the original check).

I could see the following uses of xenheap_bits in page_alloc.c

1. init_node_heap()

               (!xenheap_bits ||
                !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )

                (!xenheap_bits ||
                !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )

2. In alloc_xenheap_pages()

     if ( xenheap_bits && (memflags >> _MEMF_bits) > xenheap_bits )
         memflags &= ~MEMF_bits(~0U);
     if ( !(memflags >> _MEMF_bits) )
         memflags |= MEMF_bits(xenheap_bits);

 From what I see, whenever "xenheap_bits" is used as a right hand 
operand of shift operator, it is always used as "(xenheap_bits - 
PAGE_SHIFT)".

So, is it correct to say this :-

Ensure (xenheap_bits - PAGE_SHIFT) can be used as a rhs operand of a 
shift operator

We want to ensure that "xenheap_bits - PAGE_SHIFT" is strictly less than 
the number of bits to represent unsigned long as it is used a rhs 
operand to shift mfn.

- Ayan

>
> Jan

