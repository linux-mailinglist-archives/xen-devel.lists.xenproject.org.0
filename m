Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CC060F153
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 09:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430905.683184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onxXT-0008Un-00; Thu, 27 Oct 2022 07:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430905.683184; Thu, 27 Oct 2022 07:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onxXS-0008Ro-Sk; Thu, 27 Oct 2022 07:42:54 +0000
Received: by outflank-mailman (input) for mailman id 430905;
 Thu, 27 Oct 2022 07:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a7vm=24=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onxXR-0008Ri-JG
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 07:42:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5b9f6ff-55ca-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 09:42:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7511.eurprd04.prod.outlook.com (2603:10a6:20b:23f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 07:42:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Thu, 27 Oct 2022
 07:42:49 +0000
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
X-Inumbo-ID: f5b9f6ff-55ca-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCKbqd/dbt8R6ig8Xr7f1F3KOlRqe5+oajETQajI1IYQV/xbvjDwaJr5/GmI+Z2r5o6kxGZZ7e09/fcaVhDkBQCjVPREi1/qFanFy1TueiYB7S82F/xw2+FP38htrFOhR85xhYazqollis+9znneKXDnpZA2XOWM7rkeZhz4r3LxxDtbhpHK9Y6OCyBYemWE/oSZmMAtNJG4k/tOqfXbhe8lpQg3myCPx4776jbi4LqhsMVSaHnjG++OKQS7Li6URXsP8Cl0vkj9fHhFjSw01n7m+bXL9LdKqfpMu083bqHZSefVOo1YoNDGu21oSRUxcvbnMpCTAJ0elmm8j1dnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbj/4eHtZ0EwWOarKG1TXEsOJjIYCSgqAK0gFP8TdVg=;
 b=XHA4XlqG3MervS9rJN3CtLrS17EPT5dOyaXcWIsOWXi2cfn3fkyCztae5Nzg7NroFTKLRY2q4VoD0xm7U1C4Fd0+A6amhUI//eCBSrj24HHu4g+Wp2aL+XZj3rSq6j6h38AUbMfg+UwSF5ZkFWYSjzBgPTGUuU9M2JT8pXBqk+rI8/lRcXhDQQqD//klqp9cQs/u2ICWdK1wCifrdIVnBfqjOOeiiVGt80WRnZC6/E/+r5ea5H9IJszpq+FO0eqMICO9nTwI9yBJPJqaHosNQl07OtVK5vXCdDbGMhtOAFq7dF/3koKlp8BexUZBZkw97RWTpk4CQOONdY68+0swnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbj/4eHtZ0EwWOarKG1TXEsOJjIYCSgqAK0gFP8TdVg=;
 b=xc0KkG2NuG4wFMtG1WqObT2hzILUOsln+hANK4F9ZnXAjODe3My+byWTqZy3HivcG2rPIxyCwORzhe+/JjHfM3GGup1OJRqc/PF1R/G4DCniB5+i7Q6tBrtYbfw8cR62HtbMrwtdt4IrRlwgk9xFLIw40dKIilsjnRQAanBdCmYA4j+VCvqs1sBkOVqE6lR00v5KtlDn0zFqwbIaGqNX+/jXzS5FRhI2BL5mMoEE/YJN6IRzpZQ0NaOC3MINfCc4QNcJQpUTiq85vDsaVZJ0Eb7AaBhMUw+3DPkZYx71J6ym+9V6IxvljA6ZUvzr2EYywAuJHSf3xFjTUAEvbNSZXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ddcfd948-a189-7094-2300-aa7a1cdd5f2a@suse.com>
Date: Thu, 27 Oct 2022 09:42:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool
 size
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen Security Team <security@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Henry Wang <Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221026102018.4144-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b27d9c-06aa-4566-d84e-08dab7eed8c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sQj4tF+WeFNY/QArBkCVhBG3LbPjSnz2LQO4/t+syP/qvKYHP9HhAEEpgBejCG8z/ghJlP8gctdccTzTrV+JgO+B8lj5JDPHHnzZMAfG38h5RwgJg/y0aa0go2QFlCPhFs6X7ZtrmArr9Sub+KQr0PkAPxy2uD02AyjF0Nprm5NyiCxrZeFiPWFKzBPNv3cmVdByWlHEfRhn8Z8rWxnSnWsqCB+AFe4T4Ix+zG1cPnLjswcPPrX4lzqkq86guw++4r7PXtxGp0iA/FeWZIruQyizq7/ParEnj4HaT/ANHgIiCn9bi3ybdsnUphJ3FCIPFofKO9II6TH4wdJgYSdzlWLbUddtJ3P0Cib2aQZG97FxaxOqaZ8dpXoKWkoxelgYOBRh5VeZjJk/g7YDUvfRYJ1bOFV45TkS8dBM9E+ZGPFA66/BQaNsjUXEhRdg5XjOejbSKHYk2szT4djhhB9msaJkizXD09uzYP19PiT2agWC6WMqwUnUwOqLNOJ4Gi3Jwfa9TU8Ng3NfmOEpYuUlyzu3v51RDLc2Yy57QERdI/jf7WVKcKEQwakt52MhKcofYc6hN5Xa8Hssbdd7DwPX0T0OgFIWHoR0WSszYhcdog81Ys/vQ4R/1itJF+Kv9TAP9X3RuyUWYAsWYexcW1fvH6+SMpTKlN9+nFjMlsySFH1OZ/GTrS7zf25uFx3grjO4RLwXj7BeScyS0uckHmr5/woWeb+NuXD9kDT+duA7YkPZ86ymhR6e1uIJp+JoWT/chrErbbtAdDXS8vHca0q5go2NGwEn1lHWfCbuMwud8KE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(6916009)(31696002)(86362001)(54906003)(8676002)(316002)(26005)(6512007)(186003)(2906002)(7416002)(5660300002)(83380400001)(38100700002)(66946007)(66556008)(66476007)(4326008)(8936002)(36756003)(41300700001)(2616005)(6486002)(31686004)(478600001)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzdlWk5ScU5mNlNDY0VUbEwrbmI1NEticzJrZHBxR0l4QkExN0gyd2RYV2pI?=
 =?utf-8?B?QjdDSHRHOThSdGRMZWswYnQ2dVJ4VytxZGNzTWk3Z0VxNDdJS0FGT1pGQzgy?=
 =?utf-8?B?Ym9zWWlaSy9GU3I0cmdZWWNJanRQM3BRRHo5NnQ5SDB5dHZQL1Uyc0M1WkIz?=
 =?utf-8?B?ODM1NjNqQVBlZzNXdDVNeGQvSmJwV245bWtJZWJCUFQrZnFaSzg4cGNKQnBq?=
 =?utf-8?B?UkpZWUpUMU14enJwM05NWHAyK05RSUlRbWQ3Z3QrQ1dZQ3JPSzdNaS9sNHRa?=
 =?utf-8?B?SWRLZVQ2ait4bzhjeWUvaDBORytVWlAxQStFM0xkaUpmaSthZHpuQXU1cGFj?=
 =?utf-8?B?T1YwOGJXdldMNk5wVk9BY09uU2REVnlBSmcvbVJkSnQybWoyenB0UVV5Rklw?=
 =?utf-8?B?TEJSREZ6NjZlaGxVLzJGbm05akk4RGJ1Z0NqS3RzNEgwajFUL3htRTRleHVD?=
 =?utf-8?B?WmhoYTFPSWNsblhhbVJEQ1pPRmJwNmJ5SlAxYkRQMGhIZVNEOW91MHVNM3Bi?=
 =?utf-8?B?VmZuVmtadFdmcDhlYnFQMms4VWtINzk1UlVQVEpQQ1JGczhpVGcxUTZ1VHh2?=
 =?utf-8?B?ekJOZmhoejUxTTdkS3IxSkdkRUlVYlFrT0dXcjVpV3NpL1FhWDlhY1hwVlNi?=
 =?utf-8?B?Mk16eDUyay92ODFLNlljMkNkVVg3OTJ1bFcydDRuVmRSRkU0MDVYUS9MNGhD?=
 =?utf-8?B?YW4rcmxUVVI2allORUN2akt4eWt6MjJBblV3aXp4bDNuMUpYVTlHeTZXK0F1?=
 =?utf-8?B?Z3p1V1pTSGlvdzNVLzkxN3pIS0UvcUtadXFsTzM1YXZZVWFLeHg0WmZSQ09N?=
 =?utf-8?B?ODlqZjFoSEZWdExYREwzSzA0Z0lpdTdMUDBHQUVwOG5jeVJqQ3UwVzh2c0Mz?=
 =?utf-8?B?YmxwQmZmTkowTEJmNFVJdkhNQlVtZ3dzTWV5UDR2TC9mODhOU1ZDWW5XdHVS?=
 =?utf-8?B?bklHeFRTT0lwalRORXdhM2dZdjN2NU5iZmdTdUxodXhsdG9HRGF3YXhmS1JP?=
 =?utf-8?B?T2MzSE1QZDUwM3V4QVMrbDYxRXZGdFd1OU1lMjF5UkNVSHY3RTlsbmZ0TzVB?=
 =?utf-8?B?R1dDMkkxbkxDSEtDWk1ZanVzaHdDRnJPMGZ1VnlKdXVvazBaRDNNaG1sUVBx?=
 =?utf-8?B?d0Z4aHRnNytPcWdTcERJcmRzOTNHaEtnNm1qTWlJcFlvL0IrOUFCUEtRK0Vs?=
 =?utf-8?B?QkxvczJQanR5a3g0L0JBMkVDd3AvL094KzBVYjcwQk9ONVgwREJMZXVabUlZ?=
 =?utf-8?B?NlJhYWdSVHoyMVZKOHB4bW1mRGVMRjVFNDZoTUNYUmpPZHAzSlZnZjhMNHE3?=
 =?utf-8?B?VUpCSGYxUEJIeWNwY2FJZUI5TlBDcm5pMFc2QzlvMEtaaWkvVyt3cGFxNlhT?=
 =?utf-8?B?U2lYK1orK1VlU1dGY2lqZmZLS3JYNElPYThoMmhHWUJlenZQVGkvdHdPbHJm?=
 =?utf-8?B?ZHRQM3hyTFQvcmJFaHhrVURVSXhieFBSOFRocm94QUVhUVk2NEg4VlJTMXhm?=
 =?utf-8?B?em05VVowOXJLQ3dnZ1lqdFFHeDV6cjhNK09MTWVvYmFQM2RManE0WjQwQWt6?=
 =?utf-8?B?dkxraVUzenlTU284dmUvQ3BiVWFyUzFTdXFQRkg2Nnc5cGRmclhTSlpubTR6?=
 =?utf-8?B?Y1Rzc3F5THJyRTN3M0FJVVM1Qzc2bWIwUVRvV3ZiU0FjZUx6SjE5bldWR2wz?=
 =?utf-8?B?U2JFcEJsZ0Q5ejBnNTlkRXEvNFVaQTlEeTM2ZndNM3RMZENUdmY4WUNFdjBl?=
 =?utf-8?B?dGtsZFlicFR0bnJXZHZNR1Z5T1RuOU5DeFY5aUgyQ0JVTU03NEJMdnpWeXc4?=
 =?utf-8?B?aXIrZHNlVHdWLzl6T05LWndhRzhtWTJMTCtMbFQ3c05QM2lFNzdmQVg5MlFO?=
 =?utf-8?B?ZjY1WVpSV2NmdHFHdk9kM3NvWk4zNGJxRU1xaHNiQm5sM2R6WDRjTVhHRzI0?=
 =?utf-8?B?MExCWUVUeUs1dVpzVG1SZVFtTGFMZTJmU1RocE0yNEEwcGxoR3MrZXV3bEJ3?=
 =?utf-8?B?cEVmQ0k1aHJWNk9yRTRZcGNXMnBsOHljQ1Y3cVNqYjVkWjNtbUZpd2QrR3o2?=
 =?utf-8?B?TFpIcnlDODlicnpmbzJQQ3NKM0NHWUpVVkQ1QmJyeVdFVGp3ZUVYUnVsREVD?=
 =?utf-8?Q?8pYzBCMCEb/y+k7Crk5o51Rna?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b27d9c-06aa-4566-d84e-08dab7eed8c8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 07:42:49.4893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgmcFwg+9uEAHRroNzT/7B9wnAr/0YkWYcK4Fh3SK2f9jppLALTMZThtphDt12RjimbT8KuFkH8eNaPBiISuiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7511

On 26.10.2022 12:20, Andrew Cooper wrote:
> +int arch_set_p2m_mempool_size(struct domain *d, uint64_t size)
> +{
> +    unsigned long pages = size >> PAGE_SHIFT;
> +    bool preempted = false;
> +    int rc;
> +
> +    if ( is_pv_domain(d) )
> +        return -EOPNOTSUPP;
> +
> +    if ( size & ~PAGE_MASK )             /* Non page-sized request? */
> +        return -EINVAL;
> +
> +    ASSERT(paging_mode_enabled(d));
> +
> +    paging_lock(d);
> +    if ( hap_enabled(d) )
> +        rc = hap_set_allocation(d, pages, &preempted);
> +    else
> +        rc = shadow_set_allocation(d, pages, &preempted);
> +    paging_unlock(d);
> +
> +    return preempted ? -ERESTART : rc;
> +}

There's a further difference between HAP and shadow which may want/need
reflecting here: shadow's handling of XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION
rejects 0 as an input when shadow mode is still enabled. On one hand
that's reasonable from an abstract pov, while otoh it may be viewed as
questionable when at the same time setting to a very small value (which
will then be upped to the minimum acceptable one) is permitted. At the
very least this guards against emptying of the pool where active shadows
would be allocated from (which isn't a problem on HAP as there apart
from the allocations through hap_alloc_p2m_page() the only thing coming
from the pool are the monitor tables of each vCPU, which set-allocation
wouldn't attempt to free).

Jan

