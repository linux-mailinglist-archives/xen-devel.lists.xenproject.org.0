Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927957A6635
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 16:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604781.942292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibQR-000415-IL; Tue, 19 Sep 2023 14:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604781.942292; Tue, 19 Sep 2023 14:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibQR-0003zx-Em; Tue, 19 Sep 2023 14:10:03 +0000
Received: by outflank-mailman (input) for mailman id 604781;
 Tue, 19 Sep 2023 14:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qibQP-0003gN-He
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 14:10:01 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 381ef2b6-56f6-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 16:10:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8995.eurprd04.prod.outlook.com (2603:10a6:20b:42e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:09:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:09:55 +0000
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
X-Inumbo-ID: 381ef2b6-56f6-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAFMzOVDvb6NxRag1LgYuOeHAF8vaAu0Ugx3cJo+hh8C+YeSd0NDc+aLWOLl28OfwBaNgpT6J5JndEC9xh1sB1h6aUCW5fVoVoCwEq0urN6bz1f+uttTUd8q3inaueFi4hapdsoDPF0rrV2sDosmkHFwJEXQYexvw6FkZYmx2/AMr5N+D5zTugTntjFq9NVKTUoqf1ZM14OvCy5bklmYqXRtwh74q7GBfsap2/lWU3rkK+yFCiI6VizH9BKVd+zNw34N12qNNhoK0H7GFct2me5Uf+t5XkxYXZ6ICngTFhHdXDDvxDMiydLLPeQ4jU/SYCmEKDjEJj4kEJdEB1n39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6D1HEJl/uoWwIh9nm6xb2KWhWxCzcX5yqwyKUCxnNLU=;
 b=g3VRmhJ6m/AW6u7DRZKo2NJ+FYBJ+2uWRSMsjt1k9HZAttfM7GTl5fn9RDFXYVPExwrWNKGkAbh131lzSkn0mFOYmu+Z+AZ8m5Cdy0oVJmH335K6+u/xxsxtoAlvZmgxoZIYJUUlXxOB2O8g/ai671gpKOopBKsvj8vPEdpzN3RJLo1E1tWI6U14pdF0f+LEXfsOHZmqzcTe6M0Whh1mVcYjuwb/6y1zFUyURHuVtAKQSnWQDzpwVtUdwrAnUZvDgGJw73pMhbn5dU24I11GbzBHO/h3PNFFiYy2MTU8puRP1iLhehV2LDL7pTZoVleq4KKr6PJr69UD0kXqqotEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D1HEJl/uoWwIh9nm6xb2KWhWxCzcX5yqwyKUCxnNLU=;
 b=yVVRMW9dQ9fk/4P//MUOsENEUzEl5ByMvVWmdEa2qfD1Ipc8hsbvMD0mS86RDt0Sx4D/9l3dvRlIlgFJ0EInEXsEK5+YZH7TEmS2yIgi2wHa6HbRuVty7vt8eNODQNyHh7xtTdp7ikVgmquh/tAy4fV64FlX4PWnh2wE2bre9J2P8uQGy2/XXkB8l6GSIpub9VF3/yLv4L0jgb5TAexXW8DfNFWBoEnqHLF2Ep4zrON/dUIIUPWLvNuqpswRDFcwfMjXCyIFniX1SXwWs023s/aNfd+BddbmJ0v7pN8WnU/D8ALH990uvpU7FrB4E75XRe05eDYjfxvarXYfA51xNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <920e0bde-7381-32ef-9fba-bbf058590870@suse.com>
Date: Tue, 19 Sep 2023 16:09:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 06/10] x86 setup, microcode: switch to the new bootinfo
 structures
Content-Language: en-US
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, xen-devel@lists.xenproject.org
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-7-christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230701071835.41599-7-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: b548a99c-9f36-4390-dfae-08dbb91a1965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N58+8zWuUm5V5dR/o1yttgeFesAjfigvmYMYoQWzpGrdRYo4WZOQ+EBu3oKkh0yoBMoHDjesslJtPx9foeg5i0/mMgGyXDc2OPMeVWMFGLV89g0/aPlZXM0Kx0BU05L2KpEgwoXFQTtu1Mrl9aztxTsZHidX4Dvefle7nJIs9UFdC6MezFjKkB1i9wV8BYd2ZKhaGt7UC4Uj8KxLMvF0Gn3RVBOx4zexvjJ3TEW+/RFMZXzXQ/G3EodSyh5ZNhORUK9wosFfgBacQB4XGSbgRudNzyrEVXlvWJUmr2wVP8D2q3hEDrRVxqZbNCAkpJUIHNmJpkoEHTG/+8nkWJ1IKg9V51eWW/YzCRTtJHWIFJYTd3YsWE/xWUNMdtCPlewy7tMB85baf7iy+2PUUOot4uyivmXNFa+8LhibGjO8CjUrM3M+l2vKqwluNO8iF+G+fJLNbKX0f8v3eFAJ7L5S8HFaVqsWoNupqSpr4aNONBqMooUjm/WioKLCSC3NrvyE85eDI76GtURkUuCKUsPkxbu/Ulx3d9Ck4bGvjK39L1N02Zids7u7lHF7HF8U655Tz36PDGXEwGVO9LtlWh5DJj9t6tWp6AHAID476ffmDf3+XhLyixpBt6YpV9JxAL+D/011n5wsqlzeNQOW+sDmfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199024)(1800799009)(186009)(36756003)(38100700002)(31696002)(86362001)(31686004)(478600001)(6486002)(53546011)(54906003)(2906002)(66476007)(66556008)(5660300002)(66946007)(8936002)(6666004)(8676002)(4326008)(6506007)(6512007)(83380400001)(26005)(316002)(41300700001)(7416002)(6916009)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXZNL0tHbitiSTYwajd3MEI3T0gzS1VmTnoybXQ0bEFvWWhVK2JrV2Q0UHJp?=
 =?utf-8?B?YkxIMmZwWnY0WFN0V0NaVTZMNzBHL2taVzhYay84eFc2OVB0N285Qk5FMit2?=
 =?utf-8?B?VWk3cFpLc3g2eU5LMDNWM2xzNnJOeXlKbFRYaGFIeGVpaDVyUWJyME41YUR6?=
 =?utf-8?B?UFhGejdHQXlMRkNPdk5LR2w1TDlENG1tdUJVSHg0QlVhUUIwZDU5SmVkZTBE?=
 =?utf-8?B?TjIxNzdEdXo1bm5MRVF0RUR5SDhFTldQYVNXNHFaM1o0RFRPNTJkWnc3dGx1?=
 =?utf-8?B?RkE5TmFjS0lUZTBqSGt1MzY2YWp5RkVqVVJGY1U3RGlrL1R6dUF0NkRNRXJG?=
 =?utf-8?B?RHU2WTJPMVo3SmV4WnhpdUY1a3RXN3dHRjVxdnRMT0FYK2luYUZZNnFra1pN?=
 =?utf-8?B?SHI5ZHBieTJFOWxxbUJZSjVoTTFJV2xhYk11M3hTaHJTekkwV1YxSEJSb2wv?=
 =?utf-8?B?T2x1ZWNKdEpYUWVjeUtDWDB2MlM4eExSazdiSnBOOEtURWo3UXh6RFlXQnpl?=
 =?utf-8?B?S2RvYURZOW42SWRjWTdhVE9CYVM1RzArTVVKNUwrZ2VZZ0ZrQWEyZitBT09Z?=
 =?utf-8?B?RXFpb0R1Vm12QjhQZkZ2MlRmNCtjcTlSMnNKbWQ0R052VXlPTDRzamxCQ3JZ?=
 =?utf-8?B?dXVnWkh0Tm9GSUtRWXM0SmNTWXozMmpZKzhndjluTXhpWWEzRXNVaStLd3d4?=
 =?utf-8?B?OVdrZWZLWjJHa2JIYWI5RUlEWG82YW9zcStvQjhlaHo4NzR3NGRrWW92Zk5X?=
 =?utf-8?B?cUJXYmlkWDJ3QTk5cUc2a3JWVkFHcFA3Z1FhM2YzTzBQVVRIYThRYzB1MEpu?=
 =?utf-8?B?d0xrNCtaOWVYSUQ2a2p3a01IOUhhTG1tdUEwUXJ6M1IySC9HWXlrY3Q5and5?=
 =?utf-8?B?ZGVBdlIyNlBoRGJEbzNDTFVIamVhalppb0p1eFBCL1c2V0FDTHNscGFjSnJz?=
 =?utf-8?B?QjBLVnp5VWVmSVBucGF5VnJUTWJuWUZvMUM1VWtHZlc3Sm1ONllONGRkQmhB?=
 =?utf-8?B?aGVPT3Z3cTZkd0FhMy9lUGtDbUxmMldpWk5vblN6UUV1azdqN09WbVZhV0Nl?=
 =?utf-8?B?UDkyYnpRWmZ0MFNueE1LWFNGMWJBZ3hMVnVQM0pZU0Q1QnRrYldKRmhKbThG?=
 =?utf-8?B?cXZXQzRvTnhSbzUzZ2k3cEEwZVRTb20zdE4veXFNT1A1eC94aWlYcmt2RW9X?=
 =?utf-8?B?bzZ4TUZxRFNBNDBQOTE5aDNJSDB0V3VZMUQ5RU5BZEQzZ1pvZXdrelJlV3NH?=
 =?utf-8?B?Mm1oZDRqN0pMcjExOUhSYkFZWTljMXYzRG5qdTduOW43RktrbndiSXhJUzBr?=
 =?utf-8?B?bjhnV0E5djg5UW5YZDFKOHBCVng3RkxKNDhkeE9GdUk0cWNMSzFBTHQ3ZHNE?=
 =?utf-8?B?Ui9TUnFtWG5KTUM2NXd3dXlqZzJRYjdKWkZDZjVOWEY1MElWNHJGWU5tZDQ1?=
 =?utf-8?B?cUhVN3pKTkdBZWhUS2ZjT0VGdHU0cVF3clE4YWpHc1ViR0FscW9VV0Z6TnFy?=
 =?utf-8?B?UW83OS94amxMbHFQd0tjZXRjK01FRk4yRHE3eHhrb3Z1M2NvNjJaUkR6Nis2?=
 =?utf-8?B?dDhKd29qV1pzMjg4bk1BZ0E5NXVNRHpiaTJ3T25LbTVXMjh0ZjFvSkVHbjZu?=
 =?utf-8?B?czVobFZHS1QvR3NlZVJoTTF4SXhNN3ZQWnU5UGdPVTd5YjFQdERBT2Z6ZE1I?=
 =?utf-8?B?ZXNSUnFpSitPNWhDbUhoK2tjT2JLSk9QQllWeFE4UXBXUHp2MzhvM1prYlpF?=
 =?utf-8?B?Q2ZMeWM4emNRcHczb1pJZStHcnhlNm1heFprWnZXZzNsQkdQb29zMWFiY2R4?=
 =?utf-8?B?cHdOTWJpdlpXaW5UbDFOaysxUnFTWTZpMzYzTmw5Y1VjNzZCMkVldVV2NUgw?=
 =?utf-8?B?MEQrcThuNS80VUF6dU5MOHArclhHR0FvaWJxbXQ0MDNYWEJkc0xkczFKMWFH?=
 =?utf-8?B?ZXpSdThXbW5lVlFXYWZHY0R2c1V0L1YyT1FOYzBtUG9iQ1NsdHRLVVN2WTdq?=
 =?utf-8?B?RXFCTllMWmlyRGpWei85aHFCN3lIN2p5ZncyZFRpZmgrSkZrNDduTHlXeXRB?=
 =?utf-8?B?SHVnZUhwdzU1Y2Jhb3dzRTVRMVdjSGczcWx4TmVIdkhjU2RpM0lsdjRORzVy?=
 =?utf-8?Q?lLJeoq3hGslawXcZ3s8BevjLq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b548a99c-9f36-4390-dfae-08dbb91a1965
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:09:55.0353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9Vxcrm0RNVHrBkAkq3uRns+xIsuWPmO1N4gx2sVJoJ8ASpi5MsvNGtWk+Cb8FHR7sDs0vLCGC1XpWGGFKXTvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8995

On 01.07.2023 09:18, Christopher Clark wrote:
> Next step in incremental work towards adding a non-multiboot internal
> representation of boot modules, converting the fields being accessed for
> the startup calculations.
> 
> Move the per-module scan logic into a dedicated function from the
> iteration loop and set the BOOTMOD_UCODE module type when microcode is found.

It's not really clear to me why the split (and the associated code churn)
is needed.

> @@ -150,75 +149,109 @@ static int __init cf_check parse_ucode(const char *s)
>  }
>  custom_param("ucode", parse_ucode);
>  
> -void __init microcode_scan_module(
> -    unsigned long *module_map,
> -    const multiboot_info_t *mbi)
> +#define MICROCODE_MODULE_MATCH 1
> +#define MICROCODE_MODULE_NONMATCH 0
> +
> +static int __init microcode_check_module(struct boot_module *mod)
>  {
> -    module_t *mod = (module_t *)__va(mbi->mods_addr);
>      uint64_t *_blob_start;
>      unsigned long _blob_size;
> -    struct cpio_data cd;
> +    struct cpio_data cd = { NULL, 0 };

Why? You don't ...

>      long offset;
>      const char *p = NULL;
> -    int i;
> -
> -    ucode_blob.size = 0;
> -    if ( !ucode_scan )
> -        return;
>  
>      if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
>          p = "kernel/x86/microcode/AuthenticAMD.bin";
>      else if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
>          p = "kernel/x86/microcode/GenuineIntel.bin";
>      else
> +        return -EFAULT;
> +
> +    _blob_start = bootstrap_map(mod);
> +    _blob_size = mod->size;
> +    if ( !_blob_start )
> +    {
> +        printk("Could not map multiboot module (0x%lx) (size: %ld)\n",
> +               mod->start, _blob_size);
> +        /* Non-fatal error, so just say no match */
> +        return MICROCODE_MODULE_NONMATCH;
> +    }
> +
> +    cd = find_cpio_data(p, _blob_start, _blob_size, &offset /* ignore */);

... use the variable ahead of this assignment.

> +    if ( cd.data )
> +    {
> +        ucode_blob.size = cd.size;
> +        ucode_blob.data = cd.data;
> +
> +        mod->bootmod_type = BOOTMOD_UCODE;
> +        return MICROCODE_MODULE_MATCH;
> +    }
> +
> +    bootstrap_map(NULL);
> +
> +    return MICROCODE_MODULE_NONMATCH;
> +}
> +
> +void __init microcode_scan_module(struct boot_info *bootinfo)
> +{
> +    int i;

No plain int please for variables holding only non-negative values.

> +    if ( !ucode_scan )
>          return;
>  
> -    /*
> -     * Try all modules and see whichever could be the microcode blob.
> -     */
> -    for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
> +    i = bootmodule_index(bootinfo, BOOTMOD_UNKNOWN, 0);
> +    while ( i < bootinfo->nr_mods )

Why is the comment going away?

>      {
> -        if ( !test_bit(i, module_map) )
> -            continue;
> +        int ret = microcode_check_module(&bootinfo->mods[i]);
>  
> -        _blob_start = bootstrap_map_multiboot(&mod[i]);
> -        _blob_size = mod[i].mod_end;
> -        if ( !_blob_start )
> +        switch ( ret )
>          {
> -            printk("Could not map multiboot module #%d (size: %ld)\n",
> -                   i, _blob_size);
> +        case MICROCODE_MODULE_MATCH:
> +            return;
> +        case MICROCODE_MODULE_NONMATCH:
> +            i = bootmodule_index(bootinfo, BOOTMOD_UNKNOWN, ++i);
>              continue;
> +        default:
> +            printk("%s: (err: %d) unable to check microcode\n",
> +                   __func__, ret);
> +            return;
>          }
> -        cd.data = NULL;
> -        cd.size = 0;
> -        cd = find_cpio_data(p, _blob_start, _blob_size, &offset /* ignore */);
> -        if ( cd.data )
> -        {
> -            ucode_blob.size = cd.size;
> -            ucode_blob.data = cd.data;
> -            break;
> -        }
> -        bootstrap_map(NULL);
>      }
>  }
>  
> -static void __init microcode_grab_module(
> -    unsigned long *module_map,
> -    const multiboot_info_t *mbi)
> +static void __init microcode_grab_module(struct boot_info *bootinfo)
>  {
> -    module_t *mod = (module_t *)__va(mbi->mods_addr);
> +    ucode_blob.size = 0;
>  
>      if ( ucode_mod_idx < 0 )
> -        ucode_mod_idx += mbi->mods_count;
> -    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= mbi->mods_count ||
> -         !__test_and_clear_bit(ucode_mod_idx, module_map) )
> -        goto scan;
> -    ucode_mod = mod[ucode_mod_idx];
> -scan:
> +        ucode_mod_idx += bootinfo->nr_mods;
> +    if ( ucode_mod_idx >= 0 &&  ucode_mod_idx <= bootinfo->nr_mods &&
> +         bootinfo->mods[ucode_mod_idx].bootmod_type == BOOTMOD_UNKNOWN )
> +    {
> +        int ret = microcode_check_module(&bootinfo->mods[ucode_mod_idx]);
> +
> +        switch ( ret )
> +        {
> +        case MICROCODE_MODULE_MATCH:
> +            return;
> +        case MICROCODE_MODULE_NONMATCH:
> +            break;
> +        default:
> +            printk("%s: (err: %d) unable to check microcode\n",
> +                   __func__, ret);
> +            return;
> +        }
> +    }
> +
>      if ( ucode_scan )
> -        microcode_scan_module(module_map, mbi);
> +        microcode_scan_module(bootinfo);
>  }
>  
> +/* Undefining as they are not needed anymore */
> +#undef MICROCODE_MODULE_MATCH
> +#undef MICROCODE_MODULE_NONMATCH

No need to comment this; we do so elsewhere as well.

> @@ -738,11 +771,6 @@ static int __init cf_check microcode_init(void)
>          ucode_blob.size = 0;
>          ucode_blob.data = NULL;
>      }
> -    else if ( ucode_mod.mod_end )
> -    {
> -        bootstrap_map(NULL);
> -        ucode_mod.mod_end = 0;
> -    }

I can spot why this and ...

> @@ -786,8 +814,7 @@ static int __init early_update_cache(const void *data, size_t len)
>      return rc;
>  }
>  
> -int __init microcode_init_cache(unsigned long *module_map,
> -                                const struct multiboot_info *mbi)
> +int __init microcode_init_cache(struct boot_info *bootinfo)
>  {
>      int rc = 0;
>  
> @@ -796,12 +823,9 @@ int __init microcode_init_cache(unsigned long *module_map,
>  
>      if ( ucode_scan )
>          /* Need to rescan the modules because they might have been relocated */
> -        microcode_scan_module(module_map, mbi);
> +        microcode_scan_module(bootinfo);
>  
> -    if ( ucode_mod.mod_end )
> -        rc = early_update_cache(bootstrap_map_multiboot(&ucode_mod),
> -                                ucode_mod.mod_end);
> -    else if ( ucode_blob.size )
> +    if ( ucode_blob.size )
>          rc = early_update_cache(ucode_blob.data, ucode_blob.size);
>  
>      return rc;
> @@ -819,11 +843,6 @@ static int __init early_microcode_update_cpu(void)
>          len = ucode_blob.size;
>          data = ucode_blob.data;
>      }
> -    else if ( ucode_mod.mod_end )
> -    {
> -        len = ucode_mod.mod_end;
> -        data = bootstrap_map_multiboot(&ucode_mod);
> -    }

... this isn't needed anymore. The code doesn't appear to move elsewhere.

Jan

