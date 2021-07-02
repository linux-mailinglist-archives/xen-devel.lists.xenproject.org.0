Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B85C3BA454
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 21:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149312.276071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzOi7-0007RT-Pq; Fri, 02 Jul 2021 19:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149312.276071; Fri, 02 Jul 2021 19:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzOi7-0007Oz-Mg; Fri, 02 Jul 2021 19:20:23 +0000
Received: by outflank-mailman (input) for mailman id 149312;
 Fri, 02 Jul 2021 19:20:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wENR=L2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lzOi5-0007Ot-Pl
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 19:20:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 839e4e15-2028-4f20-acd0-a4a6cfecbec9;
 Fri, 02 Jul 2021 19:20:20 +0000 (UTC)
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
X-Inumbo-ID: 839e4e15-2028-4f20-acd0-a4a6cfecbec9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625253620;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8gPoalEr9Re1SNhKgmmyuCgslTud+udKlbclHPxuTBE=;
  b=N/FSOkVQ5vLd8p25MRY77hy3rw6rbT43qYsco6GUrUSZzChS+aTYJJgp
   UJRQ9tzsssQzLv62+0S5vTCmWtB+lnb1BpF53BTDuQYacLWEi/nbI0ab9
   2No6YMLPJik/65B2FYxH8zP+ECeVnDjle7D4WkIddTpEWL1TTsZMYnYM8
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 22pzsmOhQAFc27y794eckw6i84WlBRb0t1PSNfqbPJk3s3VlGLLKvBIgFmSFAQDr6tN4ODiuoG
 qo/HLqw4GlEkzK8RjwHLEjXP06CpV5DO8wnv7xyUCplaYBZHRSPawKqHzNgRnBrtL2z32pKunn
 a+2IdQZtyhmwcg1M3yFhfEVW9mRmoMCIsaZQJW+XGN7Wds1oUL1/S+MUhYdBJu/YGc73oHvNip
 9wXgZtJO3UgRRTMss8dYhJTA9JW1xQRsk2Lm6sox6HZ11ZYhh609dTsAVg7TboVQ9y+gNcs+TZ
 mY0=
X-SBRS: 5.1
X-MesageID: 47864053
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ERxzZKNDbhuMxMBcTyz155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/uxoS5PwP080kqQFnrX5XI3SIDUO3VHIEGgM1/qY/9SNIVyGygcZ79
 YcT0EcMqyDMbEZt7eD3ODQKb9Jq7PrgcPY55ar854ud3ANV0gJ1XYLNu/xKDwSeOApP+tcKH
 PR3Ls8m9L2Ek5nHvhTS0N1ENTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJp5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87SsIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsCuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Rs5Vma/pbVFZtl/1ZwKsMe61wWh4SqbpXUN
 WGNfusocq/KjihHinkVgAF+q3YYpwxdi32CHTq9PbliwS+p0oJuXfw8vZv1UvoxKhNPKWs2N
 60e5iAtIs+A/P+PpgNSNvof6OMeyTwqEX3QROvyBLcZfo6B04=
X-IronPort-AV: E=Sophos;i="5.83,319,1616472000"; 
   d="scan'208";a="47864053"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWmXMFlUsYPYaa0J63xGwXHvwW+zF3VEDFAwkLAgVGUov2CRhLrSNcVW/MvN3cRygJoOCxI/p1wUSpjSoeU9yUG+eYg3+zusGcDFyhrxiqSmHeYrfcOiqOg6hmeAGmXy0h+5c3Qc+B5+/i0SNSSKPLkv7Pw3JYxi09Z5uSYv7ympHd5Jg3TZfINUFY/oGUhb9cMiKt02zqVnsCoLgJLQtu/83urnMbuaKoBF7RDDQKe9bfqyXDWDUMVZjJyKS5mOjVrDE3fCJ2u52Yqr2zkvtovYuLi2VfcmtVzglv4foC4vjoy/Oi/tToO84DwrZ+NtdyrCmF5KXFLljXtU30zG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZyIw04UjhrPa5KiX5OOX2k6ZBfrmL8RM/sb7+4MSIE=;
 b=TMDQgzPIxdCoTC9sjbjDm24DnCGj4OrbmxrJJjLhYDzX4Ms0rtPLcXZsREPCKlVCypioIhxPp54Q+Qf4+yWd+VxQasXFKC0ctMRcDabw30Sp/p62TZpol6zzI1QQBuOBtFDIBpMlqPWz+xwGwl7m3dJjVruPEgIzqphAtYdPGn4iRA03J3CGQRkyBk4JtfnRT/0cfcMkLDgXZtoYzBVSqwxJEfBSswit5BVotZP9Z5Xx8+HnQRH4d4V/XxJ/y0LCE/90o6bEKulLhGjxeMnEGMzewlZB+A+jM9keYEGYSF/Yx4q3seU6mnea6k72unhabuoo9BW9QahzjcdzgVf7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZyIw04UjhrPa5KiX5OOX2k6ZBfrmL8RM/sb7+4MSIE=;
 b=lf4haiG22LiV7Nu3DJZIcBD8fbGSKU+vpKa7nQW+3HyLg5pMdnhYu1muQ0xc4Q8IBNfZQghqMyTDGiZfN7/uXcb4kUyMDnnH3G4PXQl1iiQAgFYXSCc2T7As/Xt8lsUWQOud2/XPDdqWzagNksWsaX68wxiz/zBT9W47TKCXQXE=
Subject: Re: [PATCH v20210701 10/40] tools: add xc_is_known_page_type to
 libxenctrl
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-11-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3c0efa9b-aaff-b4b7-0fd5-9eed32b20e01@citrix.com>
Date: Fri, 2 Jul 2021 20:20:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701095635.15648-11-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0441.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9492f2bb-36ff-474b-8095-08d93d8e6bc6
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6392:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB639276FE4D8895879A5754DDBA1F9@SJ0PR03MB6392.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5ySoHgNeKv60/5SxJ04wuYdgId3IgVF/BMq1F7eILVRxPF6iv4Ta34Bc4sgBSXrsO+EubnFMVTbp9iEGnxuKfIoLeLP9NmypTqwCbsY8LJbZSytPXtRCxdjHBFk9ssdUk57fPVB2HXYIXITL2c3W6RcsQwDe/Am68oN2bI287Mc7Y+x2jlq4F7/gFQWsWqMgy7XXgamDO6bqSr22/1f6EnS7Qsg7+gWtO9rHJyLl0ZxCOZg5bK7EjYDu9OsE/Hfd5tzYB39OXuEesSuHUX8KJHW34nZ5mp+fSi1l/276/M9RFNcNN39WYFoZ4Vz9jpTdN/FecKv44lg+x+YzHhjr2I97SV9lZKsUGmm1QYEZZryGMr9sTcvEXirgG/uNAdU+TpwoH8A+bwbWFFgJPlU2VULT+2HBRGYDSbebMPv4pDwKkFhjf9M7J+gmAKKbJ1+GFSFvyeroNjkIfJya1HIn9aQJGNAAd6Wo8COKdL+QpL5i8jJjNHOfn/zqxPh8JRbS1A///kvgNXCTEkWfixAAUT4H6AKynlyNqpH8fg8+/hKKZkRzjCDENpe/tLYt0xgkaBgGm5jgdOQlcXQK8tQaqctHBsL2ak7JIjkRbnFueXZSTmPZJR0R4MbkzYQw0GIg9HTXJLQJgQ4sqmHu03RexSaa5lsCj4mqkrbgL8f1yzAZXWaPUNKoYNvBI7CF3Luem0jk/QWvoDucEoYfsQ/YnKAZJwS+FQCjwAfh0KYt4XeQFpww1yT4UrGjdWyl+LV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(16576012)(83380400001)(2616005)(316002)(478600001)(6666004)(86362001)(956004)(54906003)(4326008)(36756003)(2906002)(8676002)(31686004)(31696002)(66946007)(186003)(16526019)(66556008)(26005)(8936002)(5660300002)(6486002)(38100700002)(66476007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmlRVlJIRTdlTDNOVE9DMmZmOTZHR0RiRUM1Y3RQSVU4cnFaS0pSMmk1OTdL?=
 =?utf-8?B?bERZTUx5UHpOOUZFeWZSYkpjMmk1dTNtam9kcCtITHEwZkE1ejd1Z0wrUFlV?=
 =?utf-8?B?WHdyMlNKUUpVbHVSNkx5ZkRaVnY5RHRseVo3UXc3U3N0anhuNkZyN1VVMjVD?=
 =?utf-8?B?TFlUUTd2ZkRMU2Vadkt2Qi81TGliT2hZYUgrMVgrQTJaQTFaOW9aemJUVVJE?=
 =?utf-8?B?RzIxM3lqeEFRaWZ5MldUenNWM2lSeTJuZkhudS9sd0ZydzFXWmNhQ2srNDM5?=
 =?utf-8?B?aEJCdENsdlkvbnlXdHFDUzVsdnExYldtZ1dtWHc0YnVkK0dQL0R3eE5tRU1G?=
 =?utf-8?B?Vmxid0cwVXZXamlvdVZxbG5zVW5JdExtK3NoVUlienRzV0dacUQzT3drWFNp?=
 =?utf-8?B?YWY0VG9lcTVOcmVqWVpHV2VyalNjK3lEc25kT095RkRpaFowbDNWdS9UdmZs?=
 =?utf-8?B?Uk14b2pXbnhyamJuRHY4bFByTnZiWFAyS1lSVzhGQlNybjFLQTUxZkFSVTV2?=
 =?utf-8?B?SFN1ZzdUYVFHeVQ0SmdLNm13bHdsUXprdHVaTHBIQ2todTRYNU9OWWlSZ0lt?=
 =?utf-8?B?alFYNUFObnVnKys0WFg2eEF5QUlkR3R0dk9RcW5JUG5kNk52QlN3OG5BcWcx?=
 =?utf-8?B?UXJYWFpWWlZYa3FMRnBWcUtZemEvRHZuZnJiT0drdWlSM2ZiMmV5UnZFMGp3?=
 =?utf-8?B?RzVSakVNVDAycXZsYVZBZ2JPd1lVbHYxVUtvODFueE90cWNvWGVTK3BOTDFa?=
 =?utf-8?B?cm13VVU3Z29ubFdiTG5RTGcyMEZvaUhkRzduVm1URTBMSUJDVHVhandxUHZ6?=
 =?utf-8?B?UFB6T0dETDVCeUlwSGJuSFpwaS9SNlZkK3daT21MQU5URnVCc1hGVUFvaU1Y?=
 =?utf-8?B?WU9RdkpOZCtIVG9HQXJWT2FhTHI4aEJwRmRucVh2OVFOWnhIMUcvYngxL0Mv?=
 =?utf-8?B?R3RaOGRucGNCVkgrK2dWaGZIa05mK1g0Z0VUSXN0VmNHQ1U2dWh3SUEwVXhW?=
 =?utf-8?B?U20zOGpjcldPRjlwdjBaWTV4WW5scjJ6cGJMdVJkb3FHNjRCSTBkK2M2aCtr?=
 =?utf-8?B?R2o1Wkw2M21UVSt6K2lzQ1QxSHlzbkhwRG9YdE9OYXE0aUM1Zk9KUlRGemVR?=
 =?utf-8?B?SE91aDhPVWFoTURKWlhiVlQvb1JtWXZqM2JpclRkVnFRR2VpMEJHYUZ5Mlhu?=
 =?utf-8?B?YWMwWHlOR2dHOVdVLzVYQ3hlazFGSTdVWjdscjIwd2luTkhSY0xvSTVydTI0?=
 =?utf-8?B?NThJc1k0WXJsWjh6TFExK0Rqbkc3b013QjYrNzI1cUZFcllMdmFldFBiWnNE?=
 =?utf-8?B?SHFUbGorODAvQUhDanhoOTFUNHlNR1VaOERDaFhIQWFOR3ZPTEx4SlYyRlI2?=
 =?utf-8?B?NWl3eDFibTZvT3pMRjJERVRaelhjem5jcUs3RFhDYnAzdnRqa0VzbTJmWS80?=
 =?utf-8?B?QnZkekEwb25EL3VDUnZqN2VDbmFOdW9XSkRmYk9XMGlYT2NKYjFsTHlHSU5M?=
 =?utf-8?B?ZURoVzgwMWxGamtkQ3dkaHByTUNIcFRCYXMyQktxZk8vRnVJdDNJSDBrc21L?=
 =?utf-8?B?N1h3NGR0R3BKYVQrQzhmMksxbVBvZldDbUEzbU9NRVEvZ2xNZEZkUnkwTVlT?=
 =?utf-8?B?TThSQ2ovTXlMNnpmV0pYNy9UbnhITnhPOGp0RW1OYnlSc3dYUFptdjRYcll2?=
 =?utf-8?B?VEhENUxyNFBlSXNSOGdEM01MdXY2bUg0cHhjbkRrUENvWlZOaXNGbDV0Z2Fn?=
 =?utf-8?Q?05cFtfoUZhPhGBDHGisUk6mBGwdb8AxSi9pIbEd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9492f2bb-36ff-474b-8095-08d93d8e6bc6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 19:20:15.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AO7QSuJNpKVkkIJlRZog8Kov/+d3RONxx0Bnp/adVGyL5cJNeoU/oXN+2y/ikfDV5ZF26BY8/Xz05i+nlZc7t9E1Z3rwaToeXHy50xL5G64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6392
X-OriginatorOrg: citrix.com

On 01/07/2021 10:56, Olaf Hering wrote:
> Users of xc_get_pfn_type_batch may want to sanity check the data
> returned by Xen. Add a simple helper for this purpose.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Subject needs correcting after v2.

However, given that this is in the save/restore common header, does it
really need a prefix?  Simply is_known_page_type() seems good enough.

>
> v02:
> - rename xc_is_known_page_type to sr_is_known_page_type
> - move from ctrl/xc_private.h to saverestore/common.h (jgross)
> ---
>  tools/libs/saverestore/common.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
> index ca2eb47a4f..07c506360c 100644
> --- a/tools/libs/saverestore/common.h
> +++ b/tools/libs/saverestore/common.h
> @@ -467,6 +467,39 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
>  /* Handle a STATIC_DATA_END record. */
>  int handle_static_data_end(struct xc_sr_context *ctx);
>  
> +/* Sanitiy check for types returned by Xen */
> +static inline bool sr_is_known_page_type(xen_pfn_t type)

uint32_t

> +{
> +    bool ret;

The logic will be rather shorter and cleaner to read by dropping ret and
using return directly out of the switch.

> +
> +    switch (type)

Spaces.

I can fix up everything on commit if you're happy with the suggestions.

~Andrew

