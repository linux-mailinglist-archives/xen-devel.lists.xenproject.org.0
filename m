Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8951E7B037D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 14:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608919.947730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlTJe-0007yK-Sj; Wed, 27 Sep 2023 12:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608919.947730; Wed, 27 Sep 2023 12:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlTJe-0007uy-OP; Wed, 27 Sep 2023 12:06:54 +0000
Received: by outflank-mailman (input) for mailman id 608919;
 Wed, 27 Sep 2023 12:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlTJd-0007us-Ji
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 12:06:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57cd7dd5-5d2e-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 14:06:52 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DBBPR04MB7515.eurprd04.prod.outlook.com (2603:10a6:10:202::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 12:06:50 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 12:06:49 +0000
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
X-Inumbo-ID: 57cd7dd5-5d2e-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I28uU4ryiv9T6FYqDo8wcm2DoMZ1glCTKdNA2XJHM5QQCF7rxxSAcklaQTo6+7VwdUNooe8uBahkh/ot5d+kc0oLwhP9JLjtNIw8GH2xUYg5LYCr2UVh79ps5NJrDQDion4BLw5LYqcS/eaAPMsSlfOaAapthC3i4D2/zYcZPHBpJnUjPiIgIvL7BSQLq+x9cb88G2F4+rDUXAt4SaWp/da2bxMj0o62BCIv1eFFIFT8p4QV8dfKkj2vaYbjbsGydES5m8XJyj7wXmL7IJIAQeogZj4tsRoIor+IKq3cixheG1dK0GwffbFwf6SpWDVi6KM7qMOsuxqUP8IpVxVo3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM6p6qb2FJFitCTznxEHROk9pzQ6PCqp4nEnKrT5lIU=;
 b=aZEDLhaJ7qEQmOcKUZUbZKL/LGO4PGLHs65QHwIPoWHAOHydFjSiKm843tVcfevIHTpfdVcgk1CIiHIhPfHUgAjMUT92m66q6Oo3y5gt2QePnJCoTsVYw1cPLP+cDZUxxIpJHHc9YVmUU0EGNSMJqK5tguMvh9F5LEIEwS2fHACGMBPpNjXYBNnjXOv9Ok+hDWFDohREQIDmrFNHEzvZnMbgoQYzRH5D2VbHV9xCIKgfICMGPflR3EBOroOLCOxFtNB7QR9g5CGN3y653Q/2TGvKaYPvF6bDIknGmOZ3Q5jXSCsgqu30bYcQHjATMFnjNoUCxCGq9dotwHryRbj2Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM6p6qb2FJFitCTznxEHROk9pzQ6PCqp4nEnKrT5lIU=;
 b=AusuW1jDGOm1N0BMzMAMcZsEx7Adxj/eYuWC/JkshZk/F1ijZQpYNgjzzwjeGoCQEpqAmzDZze1wyQTXXw62BHOVb45csqW9P3xsXqa9pFxaPyJxBlMnUSsMHR89FD9sbUw99DC9K/qOoI+PSqBa867eiiSlS7QKlxtDU3vNx2C2SaMVH8INfJez6hfLWMCwe/Khgvfw0RBpdl9GgM91gTdqAweKHQ5UiRxbOgPwR8tCX7ZRUPY+pd4O0pl48qqFXxzpf6fgkGOb3s32QlCdlJXyU2PE0cM4ZE3YOrooiTI4A0T3PUnUOaKH7XkZBu200o2mZ1l4S+sqp23eUAEAhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b55a773-c005-f524-531c-45247cac1d55@suse.com>
Date: Wed, 27 Sep 2023 14:06:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
 <ZRQNHyggOFD1FuMD@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRQNHyggOFD1FuMD@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::7) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DBBPR04MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdcff9a-8424-4f7e-85db-08dbbf523a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Q8zphx558WNdZvghzZ+hVBsMbSMFFvUNl/JIcOD9tZNLJgMN0c4raHbfTJyTiRe0ulGSBs/0r+SkCl/J+ROBcdceS1znqMVs256RWtk9b1WhqFP4f/a9fmhvGPwl03jaI1p+PVC1iWmXgCwKk9Z5KqUoUrjwL2mrHdldchEvLzJcPlZMXuUuNPELL36hOHxig8qn18zXIyMz0RjOkh2W0kszUvHFdwbSYxu92AVc+kIOFHEA/zZhRghm9U51wR1NHp6Tgv9v7kf4TdRAkRw1jQF106E/HI41V3788WPDXzB/UuwmqKO5i0u27FChVksKEhEq9+54qWsw0VlybfsNj7azstBwg0Hnl92HP02V9P+UtGH8WlMZ94RmbxRIQJz/rY+yRAK9hNuTIS2+TMLiTcoURmbMqcqGYn+JbAUNSKKtxhbj2DOQIgUgS1jQbDlogt4aim0rYC9AjTuRrxSPx4dOOSjGUjTczh2B7sUW8VKIPOGJIsRj+CMgX4u9ONyUi3dAtllfskYuYKWHMrsjQoy859jLsF/cQ8s/LpQ4focV06SB7iywf8k7EsJPsDg570jKVnoI0QpIH8faDp49cbxKe2Xz69JmnyXvFgNUaau6TaINn4UFmNHIeUZMUTaaLE5RneqB7s6TQxfd3sYWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(39860400002)(366004)(230922051799003)(1800799009)(451199024)(186009)(31686004)(53546011)(26005)(2616005)(6512007)(86362001)(31696002)(36756003)(38100700002)(83380400001)(2906002)(6506007)(6486002)(478600001)(5660300002)(316002)(41300700001)(6916009)(4326008)(66556008)(66946007)(8676002)(8936002)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWNPNk5RTFQ0Z2toR2c0aFJKS0FJb1BuaVlldmorQ2VGS0dseHgwWlExZlpX?=
 =?utf-8?B?QkgvZ2plYjhkckI2L3hlU0FLM2Z5MDVOajJrQkdkNlY2QVR0dUoxTW5kaVNw?=
 =?utf-8?B?L2FNMmlKUFBmUWZXcmZLTDlzYzA3YjB4eVNDNTlWNjZKckhVRG9yOEFGQkpl?=
 =?utf-8?B?RDhnYXFKdjhjdTE2bmYvUnZhTitUQksvdWUyQXd4QllPcUhJK21DU2YvV2Ev?=
 =?utf-8?B?MTZ4WU0wSjdlWTBmeEVkMDZIVnN3bnkweHU1SWozUDAyY1hpL01JWC9YYXZI?=
 =?utf-8?B?c3hqcHZjaUxWVE84U0Z3MW4yZkJLWURuY2pHQWk1UENWbnBaQXVjbUNoRjRj?=
 =?utf-8?B?VGhDNHA3VFl4M0dLWThuMnR5TnBJakFiSmpCNExwR1ZpdmErVWxMUmRqZzRw?=
 =?utf-8?B?NXREUHFyWSthWnhaTGs1Zmp6VHhQaEZ2TndwNjl5LzFTd1FBeXJVMGQ5U01I?=
 =?utf-8?B?Tzhra1YxZk00WUhYRTd0dUp6VGtIc1A3ZmEyL2tLR2h2K1pVUzY4UVBDQnBy?=
 =?utf-8?B?endObnN0MisydUxRcE5rZFJtMks3a0R4R1ZZNHRwbzVFVjVTQzlPbnJXR2JY?=
 =?utf-8?B?RTNTbS9DdHVNZ0t0VUkxNXBQRDlxeUxlem44MzY3MGgrNjZaTk1GVGJIMU5U?=
 =?utf-8?B?czdGNjI3UnJ4QjlXenptS3JYTzM5QU9ob0hCdWlKWjEycllWNGVOOVIxNGtv?=
 =?utf-8?B?bXZJdFFpRTIzS3VJMnpmKzNvMkJISW5KY241MnZTV3BmT1ArYitPRGtnbFpB?=
 =?utf-8?B?cU1GQVNiNzVvaGcwb0YvS3dPakUwZHVhcm9Kb1hxWlRpeHV1ckFhWjJ1R1ZN?=
 =?utf-8?B?ejhwclZRTUI5QzRGSDJTMUw3YTNGREJqNDVpeXBUSmFackI5NGVYb0VPYyt0?=
 =?utf-8?B?ald3eXpJVnJOQ3V3dXJ0RU5PUHV1bzFhS0NSakREb0FSQ0oyZWE4OG5TUjRD?=
 =?utf-8?B?YU5ZMlFoSVlIZUJLVmZHY3dqbWpROU54MXQwdmVxRldwaXBvRnhsSHFMVXM2?=
 =?utf-8?B?R2JaOTVRUUxKL1BWa0s5cjI0K0tiNDJIOGNqVDl1UWw4Y0luUVBtaUxtTlp2?=
 =?utf-8?B?bzBGQm82cDN2T1NqaksrMGVOTmtFNHdkYmZ4d1dmUHNDc2ltWTA3RlpyWFBG?=
 =?utf-8?B?S0ZxcU9ZcTBWRHk2ZEl1S1hQNHhQV216QlRQMTlRYUVxWDd4UFA3WlB2dm1W?=
 =?utf-8?B?VFBsd0hxNmZZczRBbmVtUVI5STl5NzVVeXFyTUM1VGtHRS96anFhYmZhQzgv?=
 =?utf-8?B?ZUtJYmt1UXEydzFWNGZpdXVuc1QvbkdwMmRnWEgvTmQrQ3hNNndSdmh4d2pP?=
 =?utf-8?B?bWxvMEFDRWpSMTZhMlZtbGdpK05UMDMzd0k5WU15UERhVk9lZUIvcXlOK2xT?=
 =?utf-8?B?Y0w2YUNJdDlYa1pGakMyc2p5VGk4b3NYeFgybVg5d3p0ejU4SnYwSVBKc21u?=
 =?utf-8?B?N3dRRjBleFlEekx0bVNKcVU0NnRwYlNLYlE5N0xpcUdITzJVakU5V0YwcWRN?=
 =?utf-8?B?L2U2cXdlLzJkTFExbTk3SkZRbjZwbE5FTFBrSkFxSlp0OWxXcExhOU9EdGxh?=
 =?utf-8?B?MUM1NEg5UTQ5WkVBb1ljZTd5UmtmUUpyaEx5OWxSYUJod01zU0xmWXZyR2JH?=
 =?utf-8?B?Q3RoNGFOVjdsWWZYUEJTUkpqcWJISUxCMkY2K3VneE80cVJJVzY4bWFtSTMx?=
 =?utf-8?B?VGYrRFhtTWpEVEp2L1l5Q1JTa2ora1ZoTk56NUN1SUhMWmNuK3gxVm91YlQ3?=
 =?utf-8?B?enpNT2Y5YnJ4YlJFaE5sVmV2eDNreEZTU3g2aklLeFpLVUZPSmxycy9lMGhN?=
 =?utf-8?B?bjlIM2g2Ykp4Snh2bHVPS21BQU1IRUl1Wmg5Sm9IYmtSUEdSQ0pXd2xua1JE?=
 =?utf-8?B?eHlRM1VXQlp2cC9jdnErc3lUUURwZFJLeFo3OThyVWMyeXJ3aWRabk5EOVZ5?=
 =?utf-8?B?TVZvTHVWOEpJU3JXVk9Rcmt2eXFnUEgvd0pxY1dBa29uTXZOMDIvdnpFY01Q?=
 =?utf-8?B?RmJHZlNINWNabmNsKzU5cmlMY2RFMzB3WnlQd1ROaHYyQUk0VUJLd1hna0dO?=
 =?utf-8?B?THlWRm5DQWdLbHlQUEw2Z0ZrNFZHaDRZdWZXaEVDN0IxektTRTEvdW50YVMv?=
 =?utf-8?Q?wTMS3tbtVCUkp1Ov2kduOy8yj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdcff9a-8424-4f7e-85db-08dbbf523a76
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 12:06:49.8239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8fXWCLKn7ZO5EAKQiLertIRAcks70YIoCMlEoN9LsAqHdS2eoDDNw4cOayEUH1P+VVr6WO10KeMb6bQHtm6Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7515

On 27.09.2023 13:08, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 05:56:46PM +0200, Jan Beulich wrote:
>> In preparation of the introduction of new vCPU operations allowing to
>> register the respective areas (one of the two is x86-specific) by
>> guest-physical address, add the necessary fork handling (with the
>> backing function yet to be filled in).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Given the very limited and specific usage of the current Xen forking
> code, do we really need to bother about copying such areas?
> 
> IOW: I doubt that not updating the runstate/time areas will make any
> difference to the forking code ATM.

I expect Tamas'es reply has sufficiently addressed this question.

>> --- a/xen/arch/x86/mm/mem_sharing.c
>> +++ b/xen/arch/x86/mm/mem_sharing.c
>> @@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
>>      hvm_set_nonreg_state(cd_vcpu, &nrs);
>>  }
>>  
>> +static int copy_guest_area(struct guest_area *cd_area,
>> +                           const struct guest_area *d_area,
>> +                           struct vcpu *cd_vcpu,
>> +                           const struct domain *d)
>> +{
>> +    mfn_t d_mfn, cd_mfn;
>> +
>> +    if ( !d_area->pg )
>> +        return 0;
>> +
>> +    d_mfn = page_to_mfn(d_area->pg);
>> +
>> +    /* Allocate & map a page for the area if it hasn't been already. */
>> +    if ( !cd_area->pg )
>> +    {
>> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
>> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
>> +        p2m_type_t p2mt;
>> +        p2m_access_t p2ma;
>> +        unsigned int offset;
>> +        int ret;
>> +
>> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
>> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
>> +        {
>> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
>> +
>> +            if ( !pg )
>> +                return -ENOMEM;
>> +
>> +            cd_mfn = page_to_mfn(pg);
>> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
>> +
>> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
>> +                                 p2m->default_access, -1);
>> +            if ( ret )
>> +                return ret;
>> +        }
>> +        else if ( p2mt != p2m_ram_rw )
>> +            return -EBUSY;
> 
> Shouldn't the populate of the underlying gfn in the fork case
> be done by map_guest_area itself?

I've used the existing logic for the info area to base my code on. As
noted in the patch switching the info area logic to use the generalize
infrastructure, I've taken the liberty to address an issue in the
original logic. But it was never a goal to re-write things from scratch.
If, as Tamas appears to agree, there a better way of layering things
here, then please as a follow-on patch.

> What if a forked guest attempts to register a new runstate/time info
> against an address not yet populated?

What if the same happened for the info area? Again, I'm not trying to
invent anything new here. But hopefully Tamas'es reply has helped here
as well.

>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1572,6 +1572,13 @@ void unmap_vcpu_info(struct vcpu *v)
>>      put_page_and_type(mfn_to_page(mfn));
>>  }
>>  
>> +int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
>> +                   struct guest_area *area,
>> +                   void (*populate)(void *dst, struct vcpu *v))
> 
> Oh, the prototype for this is added in patch 1, almost missed it.
> 
> Why not also add this dummy implementation in patch 1 then?

The prototype isn't dead code, but the function would be until it gains
users here. If anything, I'd move the prototype introduction here; it
merely seemed desirable to me to touch xen/include/xen/domain.h no
more frequently than necessary.

Also, to be quite frank, I find this kind of nitpicking odd after the
series has been pending for almost a year.

Jan

