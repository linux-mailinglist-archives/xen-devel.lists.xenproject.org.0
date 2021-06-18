Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA313AC7E2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 11:44:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144378.265743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luB2P-0008Gd-F1; Fri, 18 Jun 2021 09:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144378.265743; Fri, 18 Jun 2021 09:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luB2P-0008DQ-B9; Fri, 18 Jun 2021 09:43:45 +0000
Received: by outflank-mailman (input) for mailman id 144378;
 Fri, 18 Jun 2021 09:43:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luB2O-0008DK-7d
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 09:43:44 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c7ce48e-2f52-43dc-afc3-f33542252964;
 Fri, 18 Jun 2021 09:43:43 +0000 (UTC)
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
X-Inumbo-ID: 1c7ce48e-2f52-43dc-afc3-f33542252964
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624009423;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=txFXkZG6O0/GF3INfaD1B/qA4c2KXhus6XLruhKVUrI=;
  b=iaGnlduriAvrevEnSZ9TVuAql7DVTqu3F0RPRWgmZbTcGEFodrQX+60z
   CkYi09JMKC98LUoNHPXH1XJS1w2H8FqzRqq/UosXhY6lGxcej6sULn1Ar
   R/rPsA1qQthfuw3lLH7iWeQGdOa9B19RA6hljGkhm1cHDfmFNRzn8QNiG
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oncb+Wn1/dOoe/B0nfG/7a+nenUrdYna3xBuA/hFsW/sBnZvCf46BOiRFptlgjBi2xBxTu4oH2
 ZG6xqFNhG9kq+FTzucpcjDglBghZpE2jSKXePbEbBxJAv/i2SrFEpd8PRI19Ol62Bmxqv/By5M
 fnlLOFVkM8USOSYpUu8QufbSLjPhHDexJXxDw44ObJ6is9Aiem+FHaWY3114Z7YCS7Kl7wQGdJ
 jNOt/R+07y0GEZqgUnldLZFzHDTiZlydboim9k/2wRRn3lt01GxiT32gG7X/rGUCbbFql8fQ6o
 o2A=
X-SBRS: 5.1
X-MesageID: 46172715
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Pe+iIK8BF9xVsyqaWVVuk+E1db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc69qADnhOBICO4qTMiftWjdyReVxeRZjLcKrAeQYBEWmtQtrJ
 uINpIOdeEYbmIK//oSgjPIa+rIqePvmMvD6Ja8vhUdOT2CKZsQiTuRYjzrYXGeLzM2YKbReq
 Dsgvav6wDQA0j+Oa+Adwk4tqX41pL2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTopOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpMCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvErf2UIUh6bD3wXklV6vpREnBmcYa+a
 hVfYHhDc9tABanhyuzhBg3/DTENU5DaytvQSA5y4aoOnZt7ShEJnAjtboid0E7hdkAoql/lp
 P525tT5fhzp+8tHO9A7bQ6MIeK4lKke2OFDIvEGyWXKEhAAQOXl6LK
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46172715"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WudSoL8EhibUTnuLNxzMzeugsd1IY/3Lhs++nVtigPfq7XD9weCpymnK4gBQ1wXzm611/hDy8CJFfr4QNy4l5w+MeYcOovzIuDw+NCwRUi65KDVfqr6kHOrS8ocUKzkVoNwFyfJtAvmoxrmqLe4bqAqmzcGsZsGBYbnqFVSyFGghxLQ7deHrnlqOauL19s11j3AGJHmcdjQDWstI3m/Ilm5MRCJthe2+LZknViM+4kmtxX9HFVZlwlQ4whkiVUvi6SEZrDG8BVY/W0VgUOMhFbJ0FqSxkETXVXr+oDUyYmUiKA53I3qFaeM+v/a7P374KaXl+1FbF9P9Ue5qyNVokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sHJWJblTrr0lGRfGH6HlE2YX+loeCDTYTkU0KU8Rgo=;
 b=PvmbtxR/Fdn5ZXAo05UUSJdwK4WAcX6FeOGyNBrCBPJt2Megn863m/e/q/vm049y9FPH1jYUR438RMGnuXme4nshiEEmC66WocqlbdFQlry6sM+VIEiJ1hTbVbDZsh8lZVJzSBW8Y9zzxcGpmKVOC2LJ5Hhf+PryQH3++eS3s1MpP1v+Apr3LbEsz2Pf+JQ1IEJzqAEvqDD6ZMutyPfdqBgH4WfIrQ2HWw3EvU45GnGcQxRyITAjM7V0XBE0y3w4aZEde7DBzltYtVjhkPX+lcMTkWEx398HfeIy1/YjZZGfjG7m/5g5EovLj2KiG0EZI0QKlmrlaLIU03GIAFIuEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sHJWJblTrr0lGRfGH6HlE2YX+loeCDTYTkU0KU8Rgo=;
 b=oM/spAMwQJ6ZTtw7NOkzYFBQraqjEK4yaDanr4vkdVG3o7wgs98QlrNMQCRWKw2SxA4EeRg/+u6zQskqEHDdiAtY/9sUAvV4m5/jtNjKRXq+kTQQIpNz00aXyMD3kRolhcYzaXPq81VYQt1PiEaiAg7zBo4AffyZCNCoyqu0SDo=
Subject: Re: [PATCH v1] tools: use integer division in convert-legacy-stream
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
References: <20210618093114.1640-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8a9be55a-ad6a-d06d-9ddd-0f2d656e4fac@citrix.com>
Date: Fri, 18 Jun 2021 10:42:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210618093114.1640-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0475.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::31) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbe93d56-700e-433e-ec74-08d9323d78ff
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5584:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB558445F9A3BF4D7FF7B5B75FBA0D9@SJ0PR03MB5584.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rzn9GFuWEjsIEh1+ADggTDAuyKlDmjhwG1n9vajsMGTF7AWZ4eMo1g/gW5mkkVttfESp+4jF25Bzngj3big7sq0iMUwsC+pMbxibsi/+xxmaA7nH/28wzsUcSXU1uNQs9yRyitb0oF3+uhiw29HUUZfBXgWBrtE2BAYeS6HcTf+SE811z350HwqKYR468/SgDpaAsLfoM4p4F6qF0ms87f6tjMXTUJBFRaV1LMdgImMJ8gjYCoX/ibImqQn/DOWNF8q9+SClAUKZ1135HlSYY6xcr2npxlBUGsnw8vaBBABAIUmam3hBedLL3RS3rkjSkTz0Om0J7gTi3/GJq8IryuDPuUmpsAH+uJon6iRygccMZCxedTbxmndczuR60d/w2MPjV+dikbc+PZBzKsYzExsPqUXko0ZeVE6PxDWX7DxHCP+YeDb5pyD2Y9rqv3P/dGdGC9FcvRa4zpS3MSpxw/AK5fQPb407ZooCrlszAtF+IE+HNMc7KbTrLoayejA/vUvV9UbvLkcSq4og6Mb7smUg5lF3WVJzHKIVRuP3JsIoOqhMTwXJ9YePyKs+4ZOHm219t3/ySvpk9zL2i3C5/h5+k7N5PziIWX1JbdSvC92ZG4/Y5c2rXACaRz9JYFjw0zwDvsKRC4jL3j+m4bkVkb6DZHEMEAvsOTqgGzZI1tNmd9TrHCpaJT9vmpYqBsj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(53546011)(86362001)(478600001)(26005)(16526019)(2906002)(31696002)(186003)(36756003)(6486002)(8676002)(38100700002)(83380400001)(16576012)(316002)(5660300002)(31686004)(66556008)(66476007)(66946007)(2616005)(54906003)(956004)(6666004)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWtiS05KTnZIbkhZc1d6OXVUY0wxdCtSWHZ6b0JLQXd2T25yWWgzUTVNam5h?=
 =?utf-8?B?UThMSXg2RWdGZUpTNWJVRE9laUc4UVZTbEliRUxkUVlneWN2RkNodHJEeXcv?=
 =?utf-8?B?LytzZzk1REVzd3NrZ0hTM1IvZE45Y3pnMU55QWtnV2xQcE5IYm52bFM0MzVp?=
 =?utf-8?B?OWl3MW9nbTlyNDBTTXRyenQyT0ZDZ3pWZmh0cE9QTGRTaWN0eUlra3VMam5i?=
 =?utf-8?B?N2hmYXFzeE1OUEdJOU0zNVFiYXhrNkZCNEMvd3V1M0FMR3JCU09EUGZRV3dC?=
 =?utf-8?B?Tk9wSEVzaUJjNWo5d3ltQk52NkFUMkU1dzQyZm5XTnJSOSs5YlJwWU9lcXZY?=
 =?utf-8?B?ZFZUNnVOSmJVWXg3SWZHaERJSHNZc0tJSkxKNkh0bS9aSnBMTXB4bnNuMHd6?=
 =?utf-8?B?RXJKUHV6a0xMR08wWkJLcmRXTS9JVnBwVFVxZkRFc0o2UVpvZXcvcytpekhG?=
 =?utf-8?B?a1dTWW1zWE5pRlZwdEJqOWVwbVhEMEFuREFYN2NQdnNDRlQwZjdSdFlyaUVO?=
 =?utf-8?B?M1ZLN2pOc3lqUmcyL2VISmZTVjFQcUpWd21TazdmRnRQb3BWbTB3aEk0cG5R?=
 =?utf-8?B?UUZRcFQybzNJK05sVC9DejlaeUxuY29sRWxQSXFEdHVTak5mbklxbUtEenpr?=
 =?utf-8?B?ZC9kTG04bXFqeUthclNEOS9rYlA1R04vNVpxcllvbE81bnVCblI0dEJnZHlT?=
 =?utf-8?B?ajVuZkVVc1RGZy9JaDJNQk54MTE3bXFyVy95V1NvdDFTdjR1VU9rZkNCbzNq?=
 =?utf-8?B?NzI2dkFSd1hkM2JUTlY1TkRkMUFQWlhtSHN1Q2JHRXpiRThSRGtuS1Y4bGM1?=
 =?utf-8?B?ajArV3o0ZzhiZmdZQlE3Y0Vpekd6a3RiYUNSSzVsZURjeWorVnRRT3N2MjM5?=
 =?utf-8?B?ZmFVdlF0em52T3phOEFncnEydnl5VlBzd09TclVBaGJna3RjQ0o0MmJ5YkNa?=
 =?utf-8?B?VFoydnlzN0NVVkFqclMwdjhCOEJoRzNWTVdxeEdZMUloM25pUURHUkZtNWt0?=
 =?utf-8?B?K3VPUm5ua2tUdXJWRkRiQVJJR3c2TGhuWWZZdWN0UXlBMHlaL25aSGZWa1J3?=
 =?utf-8?B?VXZtS0JCazRZRFYxNFh3bVlSOTNua2FOQitpMnExcDBMN0ZOeW02Ykk4em12?=
 =?utf-8?B?RVpmLy9JUStFdWxyTUdOanpxd0xaNDBadU5qanBzeCs0cDlrVm15MTNIYXh5?=
 =?utf-8?B?L2lCc0FaUXRTYzc4ZHMyUW5aRTNTT005aXQzSXUxWkloVkFMY1ZKa1dUL29W?=
 =?utf-8?B?Q2NNOHFGd0Z0T1J6Z05RUVNueEhDSHNSdENHZi9zT1dROEI5cU9wS3BVdzFw?=
 =?utf-8?B?RHVFemhMQzFqOThzcUdwMVFwcXZWOTFWc0YwSUFFRld0bXlWcDM4SlJoSVhE?=
 =?utf-8?B?MVhLdWxpMmsxWHpaWS9tRUpiQ0h2b0FNRDZlRkNRYTErL3dJaWZYSDNPV0Z3?=
 =?utf-8?B?KzV5V0lLZXJsTHJBV3RuMnFQbGp4THNMTXRubGxEc1B0RDJiR3pEZVdxSmRi?=
 =?utf-8?B?V3FwaGlWU25FdHVFNXdiSnpIWFI4RUUwTStIMXprengwUjJ6NjdWUlVoeW1j?=
 =?utf-8?B?Z2N2MUladktkUytOK29vSkNrQWZPcWhnZkZsWVhXVW43TExKTFpNQXZXY09T?=
 =?utf-8?B?a2Q3eFZza0w2eGQwUHhyMWpoUkQ4MEJzY0dvUElFazhNU1p3M3RtYVYrWEZy?=
 =?utf-8?B?RUt2MmFqOU0rUjRSczBrZFlsR3dIOFFyb2dNVXFXM0liZG9MbFAyZzM0eGZU?=
 =?utf-8?Q?8P08CzQwockLK7mAzfrxz4GZ+8u1kCt54pXOopr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe93d56-700e-433e-ec74-08d9323d78ff
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 09:43:05.7096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QP7oXxGUlNrESUdvfKm6di+hsF8irE+kFkfbebo549XVFz6w2jBnMwekxIQKBKJct97PrfJ/zzgUg1XgypL/DSqaFKc77HALu1WzVXELx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5584
X-OriginatorOrg: citrix.com

On 18/06/2021 10:31, Olaf Hering wrote:
> A single slash gives a float, a double slash gives an int.
>
>     bitmap = unpack_exact("Q" * ((max_id/64) + 1))
> TypeError: can't multiply sequence by non-int of type 'float'
>
> This is broken for unknown reasons since 4.14.

:(

This is a Py2 vs Py3 difference.

To not break Py2.7, we need "from __future__ import division" at the top
of the script, but I doubt this is the only script impacted.

>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/python/scripts/convert-legacy-stream | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
>
> diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
> index ca93a93848..a04c6e4165 100755
> --- a/tools/python/scripts/convert-legacy-stream
> +++ b/tools/python/scripts/convert-legacy-stream
> @@ -163,7 +163,7 @@ def write_libxc_hvm_params(params):
>          raise RuntimeError("Expected even length list of hvm parameters")
>  
>      write_record(libxc.REC_TYPE_hvm_params,
> -                 pack(libxc.HVM_PARAMS_FORMAT, len(params) / 2, 0),
> +                 pack(libxc.HVM_PARAMS_FORMAT, len(params) // 2, 0),
>                   pack("Q" * len(params), *params))
>  
>  def write_libxc_static_data_end():
> @@ -264,8 +264,8 @@ def read_pv_extended_info(vm):
>                            (so_far - total_length, ))
>  
>  def read_pv_p2m_frames(vm):
> -    fpp = 4096 / vm.width
> -    p2m_frame_len = (vm.p2m_size - 1) / fpp + 1
> +    fpp = 4096 // vm.width
> +    p2m_frame_len = (vm.p2m_size - 1) // fpp + 1
>  
>      info("P2M frames: fpp %d, p2m_frame_len %d" % (fpp, p2m_frame_len))
>      write_libxc_pv_p2m_frames(vm, unpack_ulongs(p2m_frame_len))
> @@ -405,7 +405,7 @@ def read_chunks(vm):
>                                    (max_id, legacy.MAX_VCPU_ID))
>  
>              vm.max_vcpu_id = max_id
> -            bitmap = unpack_exact("Q" * ((max_id/64) + 1))
> +            bitmap = unpack_exact("Q" * ((max_id//64) + 1))

While you're changing this, could we make it (max_id // 64) to fix the
style (which I clearly messed up first time around).

~Andrew

>  
>              for idx, word in enumerate(bitmap):
>                  bit_idx = 0
>


