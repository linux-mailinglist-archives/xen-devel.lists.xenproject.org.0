Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658030A5CA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 11:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79737.145163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WoG-0006xY-VN; Mon, 01 Feb 2021 10:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79737.145163; Mon, 01 Feb 2021 10:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WoG-0006x9-Rz; Mon, 01 Feb 2021 10:51:56 +0000
Received: by outflank-mailman (input) for mailman id 79737;
 Mon, 01 Feb 2021 10:51:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6WoF-0006x4-5N
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 10:51:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4b4005f-915e-431b-bf55-61e6327bf8a5;
 Mon, 01 Feb 2021 10:51:53 +0000 (UTC)
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
X-Inumbo-ID: b4b4005f-915e-431b-bf55-61e6327bf8a5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612176713;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Zil1B4wupZZkBaHmSr/HdAE1skdwfI3C1XPaoopK2/A=;
  b=XlQ/oDprvMhmM9fGQNVMra+HVM+RJM5gGhpyC0jV/9nYyh/0rCv3E1+b
   6UJ6GccU4MQXeQ2VK9C689TnfGjbOj31sUi6Hq6mmKBwgJasYAEfWbb8X
   Lmu3FX1OkITXAmLhrLYcl6AUPtjM9XSffjCMRk/u0L0faF0XAtGQhHMoi
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3jBgMnvTeCgPLpUuyhrNiTegVVrAdxvSNhexpm2gNTbol48gS1D737pY/K3Nrlz1HJViOXP12j
 AjOXelFhS+IO4jsJ2gl+KFoUHjtryomFvvjybHoZXRsW8W23FlFBK+0AbmCGAkzwDJveg5Rt7a
 h1zWeSY+QzP5j/N8QkIkVFK1EaLtxzSdBWwfgcqdYScPM+Uw8N/83K4pAUfOwYLXwuCHfsGG8o
 7/HNt/i8v4XRg33edxpgvkZT9Rzyh/2lq7D0BWdJhnmf0novThBbn06ylfIL4NGZwYBV8TFA/7
 OpQ=
X-SBRS: 5.2
X-MesageID: 36643314
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36643314"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2IEpwaaUalgnFYdc+kBa1wsK8LQ3gbR/CjyAfYv2mguFYANJRA8oSO2jm4udJK+jMGzFsRXnSeKmQofFcXjdE7kiwbwAkXttN9bZIwA23kgFiE0q6oMdmPR+Te/y6RB0gK8sl0BQA9GrypeApcxqpAUIUpZ/whVeO8ALtihLoYhKD7bFWnvqGb+cc/VAwHS7pwA6KeiOxZu3ZnqYubNrmiuvg+ICNhR6TuCFuCcNPSNha8VDmfsCQRgyeofue9E4qIWifLJYFdwtT/IM5Vt6wH/Ae8eZWtH48870V6eIscsA0QiodNgnTWEtfuaP67naiHyEk5Z43q8XYamsEgVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYLg1wGSXbQKI4Z4xRkQiVWoIqP80XI6rUhcotB2DRg=;
 b=jOIGhg2wWTLoakI2+7zIL9e0JJXu38Fjbr0I2DPWEvzLiPVwJmY4JeMToQcgLQz9H2NpTsuo0RDIiVryy1Bf07lwx6noI1nWAQVU/+JdlVYCdBEt50QgpZlNkR7upJJYv4WVwiM7kjsm360sinB9k1jfmoyjWZ+fRRW6eaYtooAXkl5S9+XOJXxKjIUxrvrzaNcz4DP/0dE3YaC3i8l3fttSf1GkC6aGhPjoj3jnSK/KKR1b1WFHo1sZ2b316SzXyRs5Egtv5Pfesc5Ltc5wweLPovNlC2nidMLFWNy/S8Z1NzFthR41SkTdmeLdwXTOa8JeHMHndR/IrWJ5cnjBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYLg1wGSXbQKI4Z4xRkQiVWoIqP80XI6rUhcotB2DRg=;
 b=qrQwqggIGP//6umtv1a8bmVjC9dHDnAq+xwy4c8/38fvY/sEKaJ5bux5ERuCl0oK5NoEoXApqMNcAhsPDKK7r1KYk6VTmJ0aD9Q9jLE3JCePhXNOkS+cjA4MMfVO0BMcAC8jDBS8vd2DFKwCiZWFcXRp6u/R2lAXMBNyHKnWRzA=
Date: Mon, 1 Feb 2021 11:51:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>, Jan
 Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v8 08/16] xen/domain: Add vmtrace_size domain creation
 parameter
Message-ID: <YBfc+BaXLm5dSvkG@Air-de-Roger>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210130025852.12430-9-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0053.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99b14d32-64e7-4d1a-d91d-08d8c69f5e3b
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB532458CF06F12547EC3C5B548FB69@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fj35sBvW4vYsjBT/kpHPrIh5MXaW7oK+FGh/8V4ApFTZOJ2FZFGSAxQOlF1tJ/F6/T555EU3vHW25D77xHbIv535ZmXOwuvhc4VWNpFiHOMZxpVNfJwaYN3TnT/hG+iECrtDWpvGQ1p/RnvLoF6gSnTNkRMrHdFy8eX2RYjrchmQ7ob8W+u298LQM004FHWtC1N4e8j24YRW94F+WktGro88J1MbjD0vX4b50ojwtHhcQqudOigkI5dp9JrOYDNtKET1b+SVUyfx9zKtdL2yb6MYRAx0WCsOpGrk6DDwYqxtkKFS5wl7M/ltLIFs3so4/xRItZ7LWySs3ACxokxml0Z8ja7KLn/xzoA+cOsJfE9k4+K1p25tWeNUNs+iscX7AYObfizbVRMfN0MY3gPvneN/eOgrpPSEm6OtCIgj7zd1obOUgQmypJNcTCKmthoIATZ8VtQE9eY4N+vdBMfjGa9KI1QVezT/XUKQXp2B2nNvmIYBwyUuujyeliBe8pdcqVMROqW5vBGvd4CI59Ss9aJaEgp0GOnGxxCbzi1q0WXlZKnVveHTlKcUaTbHh8qx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(2906002)(956004)(478600001)(5660300002)(6636002)(86362001)(8676002)(33716001)(66476007)(66556008)(6496006)(66946007)(186003)(8936002)(4326008)(316002)(85182001)(16526019)(6862004)(9686003)(54906003)(83380400001)(6666004)(6486002)(26005)(66574015)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFlXemt4WDFQMVF0bUV1b0xrNzNTcy9nWHFLRElwa3pwQWo2Sm15UGNCNk9Y?=
 =?utf-8?B?TEpIMXlLUUhMdHdBdmt5T2xvOEExK1VVQVpXc0pUaWNoa1BEM3ZXVUpsU2tt?=
 =?utf-8?B?OWZsRkt1dzQrY0pkUWY3UmRkZGN1a2ViZDNwYVBRT05SMnpKa1htQ0NZRzFt?=
 =?utf-8?B?VFJkT2hBUVlvcmozbDBRdGpWM0krSGRxdDQ2OTJTdUFkczZHVHl6cVFmZ2I5?=
 =?utf-8?B?Z2puemU1UDZneWF2eXRXRDhCc21FSEtHVWxWYXpGY1AwVmt4QWFrVEg3aDBw?=
 =?utf-8?B?cy8reDc2T0ZpdnRsdm1rcC9tWUl3aWxqdkxXbGtINUdyUlRtSnBvYmtNakhT?=
 =?utf-8?B?eCttbnZsOExGQnVHZ1FSMm1ieFNYclU4TXQrcWdkVWNXaWZiMXpoUlloekNT?=
 =?utf-8?B?TjRFQ0NKcmpPaDhuNVZ3ZzNoWHJ5eWJwOVROWlFVM2trcjNUVDJBMHJlQ2tV?=
 =?utf-8?B?dDNNZnEzTW4weHJvZzhMOGNpYjBXaTRsM3MyWTIzTG5iMkNuUWdlRy9kenBH?=
 =?utf-8?B?USsyUDE5K3lQbWtCL0l4MXp2Y2Q1SHpIelU3Zk5SOG9xYWNkRmsrUExUenFY?=
 =?utf-8?B?TVdYNFdIL2ZMdEVrNU1GL3F3cEZVVjVVcytDYmpoVnlITjdEWTlSVXRxcG8y?=
 =?utf-8?B?b0l3OW9YSElObjA1a0RxeGpOd3NpTVdWS2ZIWUkwTHVNT1dHenBMaHcxblgz?=
 =?utf-8?B?L0V3Z2RlcHRMelZ0ZkpOOFk1YWVZVFJUUnJ1MFFIbkFXQ09rL01qd1hnMmdl?=
 =?utf-8?B?K2R2ZTFORTMvZ3hZUHE2MzdrTjNBZ2xScGNGNERGbXNVWTdqa2lqaS9pZHNx?=
 =?utf-8?B?UGJMVS9NZFdFaGZiSVV2UVdlSHFlaXUvZTZnOUFiUmJ5TUNRd3duZE5BRDBZ?=
 =?utf-8?B?aDZpRFFDRUNIZjZaVE9iTWc1d1U1cXFubE9mNmx5Z0dXYUttaHAydmZCeUpj?=
 =?utf-8?B?WUhGOURsOG5mZTZ1UTRxc2J6WEVmYlNRUkVYOFdEYVIxcGtOc1l5K2FmWUNU?=
 =?utf-8?B?L0FuZ1k1TWVxYUlpN3VldUlyWmxiYzFzc1JKaEI1dlkvM3V1QkNSUmdpV2JK?=
 =?utf-8?B?VFlKZFdLb04wbVRTZjFJZ1g2aDRuNExKRHRvMVRDM0lmQmpiWG4xMXhNdlZv?=
 =?utf-8?B?UE1KMFJUYkRwRVNyOWpsbVNtbFFzbXZxTDV2R3JyU0xtWldrVCt5NFBROWhr?=
 =?utf-8?B?MnpOd0Y2ZTZWdTVuS1dkeHd4SktjeFM0a1VTSE9MbWpYb05qNXBDNHVkSVIz?=
 =?utf-8?B?NkhyT3hRQnpsTCsyY1VyYVJSZ2hQTnZGUjU1ditWVStpQ24vQ1lkRnJsZDN5?=
 =?utf-8?B?allUN0Vnb1RsWXY3WjRFMDB4Z0NzcUhYQVZ6UGk1aXVLOEordU1EYkR2R2FL?=
 =?utf-8?B?d3A2RHZPcGdkZW1WSXhKZW5IUHJLTnBkZlIvL1hXaVBQdGVlMUNuZXZYTVNs?=
 =?utf-8?B?VjhUV2FaUmFNeXhWMnlpcW1lN2VKaThzWU1jeXZ3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b14d32-64e7-4d1a-d91d-08d8c69f5e3b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 10:51:45.8365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpSqazUth7XuwdEYdB+XdjL8ikaKfAaPb9Zea9RpGDsw4VaGu5p1+VHRrvTSKcH4ysfcIM3Ir2yN8ROzAd36NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Sat, Jan 30, 2021 at 02:58:44AM +0000, Andrew Cooper wrote:
> From: Michał Leszczyński <michal.leszczynski@cert.pl>
> 
> To use vmtrace, buffers of a suitable size need allocating, and different
> tasks will want different sizes.
> 
> Add a domain creation parameter, and audit it appropriately in the
> {arch_,}sanitise_domain_config() functions.
> 
> For now, the x86 specific auditing is tuned to Processor Trace running in
> Single Output mode, which requires a single contiguous range of memory.
> 
> The size is given an arbitrary limit of 64M which is expected to be enough for
> anticipated usecases, but not large enough to get into long-running-hypercall
> problems.
> 
> Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index d1e94d88cf..491b32812e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -132,6 +132,71 @@ static void vcpu_info_reset(struct vcpu *v)
>      v->vcpu_info_mfn = INVALID_MFN;
>  }
>  
> +static void vmtrace_free_buffer(struct vcpu *v)
> +{
> +    const struct domain *d = v->domain;
> +    struct page_info *pg = v->vmtrace.pg;
> +    unsigned int i;
> +
> +    if ( !pg )
> +        return;
> +
> +    v->vmtrace.pg = NULL;
> +
> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
> +    {
> +        put_page_alloc_ref(&pg[i]);
> +        put_page_and_type(&pg[i]);
> +    }
> +}
> +
> +static int vmtrace_alloc_buffer(struct vcpu *v)

You might as well make this return true/false, as the error code is
ignored by the caller (at least in this patch).

Thanks, Roger.

