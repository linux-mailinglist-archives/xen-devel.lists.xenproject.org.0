Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A203685E2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 19:28:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115760.220898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZd7m-00084H-BL; Thu, 22 Apr 2021 17:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115760.220898; Thu, 22 Apr 2021 17:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZd7m-00083w-7z; Thu, 22 Apr 2021 17:28:22 +0000
Received: by outflank-mailman (input) for mailman id 115760;
 Thu, 22 Apr 2021 17:28:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00C0=JT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZd7k-00083j-Cw
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 17:28:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 964439f8-c84e-41e0-82bb-b6390861267e;
 Thu, 22 Apr 2021 17:28:19 +0000 (UTC)
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
X-Inumbo-ID: 964439f8-c84e-41e0-82bb-b6390861267e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619112499;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k4CDFcugS83MucUPadPale7AoyQg+8qnwnv72C2GdX4=;
  b=WVNAjlCH/jCSD2EK7tNr3CPxqHqzfiohNkb3+JOVnl2Jh3AmFPB9LwgC
   jC1wsa6YcmrLhDk4egPw6FV106FML3U26XTZY8Q65SF7Rp5p3M48OXfQp
   ug6wy806Eg4hD80hgefsVpl87UGLKDm0orTQDbuIQSslDhnfYgdf5Ch81
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GV1fS06GGNW/xoko4W3FxYobXJbSRRrk6ohuPPy+UkaxNJEt9dkO/O3enPTIrCFBcvQ3nxXl5i
 kogFjcP0qj3F2zGtOPKMURRSGvbIydyRBnM5m+VHJ0qrDyQdBQmiMIW/jIcylgbbMOgk3L9+1A
 1jJYD5kKswntRSBjwUfyvc0QjP25/byjq169Se0UbrEUXSjYCOaEaVymw8Q+EMqhvlLXFutDYA
 NOmMhumORy02Qz+Y3vhnBCEz/yNYcqosxSkebJXTPgPLB/p1qihZW798STiTu38k9dWiVGr47M
 MyI=
X-SBRS: 5.2
X-MesageID: 42203943
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WnVvWaFyWJHYbq0epLqFtZHXdLJzesId70hD6mlaTxtJfsuE0+
 CC9c5rrSPcojAXRX0mhJS8KLCNKEmsjKJdzKswGfOZXAfgsHa1N40K1+Df6hDpBiGWzI9g/I
 h6dawWMr3NJHxbqeq/3wWiCdYnx7C8gcWVrMPT1W1kQw0vS4wI1XYcNi+hHkd7RBZLCPMCff
 Ly2uN9qyOkaTAraK2Adxo4dtLerN7Gno+OW29hOzcb7mC1/FGVwY+/ODPd5RsVXypTwbEktU
 LClxX96riu2svQ9jbsk0T31tB5pPvNo+EzY/Cku4w/DwypqiGFWb5fcdS50gwdkaWO0RIOkM
 PQrxAtJK1Ihk/5TyWUmF/I+ySI6loT10M=
X-IronPort-AV: E=Sophos;i="5.82,243,1613451600"; 
   d="scan'208";a="42203943"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEKOuCmUGYk5DYj+mqlPZuDV5Jlo/phVYmotPHGfbbP6onwvJqX3mPlUSDETPTNvGlYG2kodODQOKj1EiEZnjWBei+Z1sH2BDZEpjcrvrHIeA51QuzjlePOJDTfiHFCA3gWMDPJxO1Tf/IT15MOiGYVbjdWKRfOdYsa1md8fQvc7ftP3l9i18hC7gvLTvf77Hh5g03OCItrr29o+sCFEm/bJoDcCzKE4ZA4GRzgFNSFMvS73SnMEmeinAyhFbVjLJTc68LEuuB4h322nWdIukwqfkOV0AXbzxvhP855yY26BwYk7ObfGGxKC8zH0jWQjIjwWto7TGvxb/pqM/Ebcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EovWUtL7Nh59uUREfHZ4XyKAUoEq0RyzXKFwOVzdmOM=;
 b=MSdKZLEJli0C65vMVaXXt7Ng2VSZaz3MKzy8OAkhoHgl3lXo2U/h2umQLAImeEDtvz+8T7FZg1EhcM5l91t8Cedsmlm3l5NhYOk5eKSrS3Buo7Kh7kTHtDeuuYJIlaQOlitAxcVEcWSbyPt8BNjrQqJ/db/9HfOoBxIkbPC+yF5M6cdH4LL4DoAOXfD7au0hLC79bJkUnw3M1TyL3bgnRa5jiqEqpMvsBHC/vOGe0NMIJwSmd2OyfrDqtFdAZdBvHQTvURfNzXzFv61KLQjon5swUym/pPUGknjay96HBAIoN4bpkmyD6sSQ6qJSbQ4Z/WgkKLe3+Y8wvK8wUISS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EovWUtL7Nh59uUREfHZ4XyKAUoEq0RyzXKFwOVzdmOM=;
 b=wpjc45Kv57FNeY1CZD8Xz+8a/egnFAJOfA1nun/GyWdEd6F+yFvklYVyL3M43/GyPn45d2RXRXUAEDJ4RW2zgYAvPZMZzfMXPzibvX83lZ5JlZRLHDmxCIGmNvILpV1T4pSocgrRFyj16ziVItJnZCzP/gMl0YM8tkAjOIEPVno=
Subject: Re: [PATCH v10 00/13] switch to domheap for Xen page tables
To: Hongyan Xia <hx242@xen.org>, <xen-devel@lists.xenproject.org>
CC: <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1619014052.git.hongyxia@amazon.com>
 <ff54b35e-bcf7-3343-4704-417aeb53865a@citrix.com>
 <8aa8fe1b78a50e69ad1bc4afdd315eb254266162.camel@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <248e0b3f-0e05-87c4-876e-5a658daa1492@citrix.com>
Date: Thu, 22 Apr 2021 18:28:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <8aa8fe1b78a50e69ad1bc4afdd315eb254266162.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6adb57b8-5468-4334-a871-08d905b40162
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5854F04039011975C7677CDEBA469@SJ0PR03MB5854.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O6gXAWO0TbN1WF+wFNUc/Q0tRMG1GAPicpdeFhny9sH5CjoFdeTpHOsZ5ZILaiqG3JCf0/ZyR/Hk+rgf51bnpMB8fNpFmvzTn53NsM8dSQ1saZqxyLnf7JeueFTqI09EKxUjqYcSw7BMGycZo+7ls5wJKg+CvCbvmzC2hhuL5Xt62d6qbpNil2HUx+topMb4nnhiwLRqyNsnEago4CHn8xSr0zpNXR4kU0zlgi0j8udkHeyxClHbewrX2VjhnsmcL3FQm7CRVNL3TIhywzrxWi0gwJ3k52qdIDYNNUkmpUOt6HPX81NTWJYM9Zy/CtMSbpno2NBGdeoVQ+sTDEBXlzRR48naaD7eRDcVkyfIN3QG2RPAHrqAGGmjuCNLra9cXWIpsEH/vgjPelRLiPzeNBryvj0+6ND44KdDd6K+z0QklAZzqSo8J3r7YC/E8az0CRYkrbXSyzHIUMnfkGUXg3VTesZUjccKjlijsPgu2M4zmLFgPm0kZoPDmvLEzp21dmqFnb0gLLwHccsCK40p1R6gvSMcqXdMg8/06smsXeA597kcdqLLpNoBneRH1zNaZlH4alx4h/s8Cnzg9dH13DCOS6QzqOFvdpKhl6mbJJGaUu13Vfy8N2UsiR3vKi/7ggFNF1IXgN8ixLS2il3QP9syjiyx9OTV0x4sU9kF3DF+gWsbLvvU98EIm9UiEGh7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(186003)(66556008)(66476007)(5660300002)(6666004)(86362001)(478600001)(6486002)(16526019)(26005)(8936002)(66946007)(2906002)(36756003)(53546011)(4744005)(38100700002)(8676002)(31686004)(54906003)(316002)(83380400001)(2616005)(16576012)(956004)(4326008)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UHVaU0tLL24yRkdzcFpTVHQ5NjJnbVFhTVZXaEJSRXFSSzJtTnNvT0diWVdu?=
 =?utf-8?B?K0t6OXpRK3QxdGluYkExOW4yWHV1SEU1Y0hiTWt1SFVTNEtVNlpqa3h4OWd2?=
 =?utf-8?B?R1c0bkxvZFpaa0diTDVjdkl2ZVRNYmFZbWRyWk5YKzlkK2pVZHp3N1FNQ2Ix?=
 =?utf-8?B?UHFuS2RNTkxTYytFUTZXbngxelJnUVRrYUJFTUFPOGJ3TWl6bXJGVzg0QzJZ?=
 =?utf-8?B?c1BWMjNpNjZha25DNzNPWGRwQi9DY2JLdVN6K3ZnaGZYdG41MG5CUk1rL3dw?=
 =?utf-8?B?dnRLUXQ3WnBqTmpzR3pxYWFMVEFHcTNKVER1bjlRaWg5SjFzQ0hRNU1PYmtN?=
 =?utf-8?B?MWJ3dzBHTWZreUJ5eDZKQ2dtVEtEd1VnNGpyTmNtdHFkbTJlSVZCZlViTkVo?=
 =?utf-8?B?czJOOTJRV29YSVBSL2I4V0tTSHBOT1FTVGdiWmlsZS8wNEVSZVdGZG9BVWl1?=
 =?utf-8?B?SDVjK2NvTzBvNlZYd0tUd0VyQyswVXR5bmlEa3I4S1RXay9tL1RjalZzcVFY?=
 =?utf-8?B?Q0dRVGdOTjE1aVIzenlaclBoTi9XYmdKdWs3SllvMWlUUEpOQitZNDEzKzVJ?=
 =?utf-8?B?MWhiMS9NbDZ0YTdyVDdhRnVIWmcvUjhKTCs1Nk52b1VVUi9lNnZKTnJzMERz?=
 =?utf-8?B?SDdyeHhMOFVQNVRYNFJhaFJEK1ZMc2tDd0N6VjE3OThUN1B2amNPNmFacG1l?=
 =?utf-8?B?MXNUdXkwVE9DMUtEbVdWMmRLeTAwdjBIbG9DNzROekVoei9rNGZFanBLSmdO?=
 =?utf-8?B?cnlXNytQdnZkNWxzenR0VFBDVGM1b1RsUG4vRW5MODlFVnQ4cUNMRmM5MUlE?=
 =?utf-8?B?WVhSSDdGS2lnSS9ZYkh1cERRVTNwVDRrTWpaVTFKYnd6dUtmYlYxVC9FaVhv?=
 =?utf-8?B?SmdKNm1kMkw0M3ZXVjNvWGpCSzZqMjBzdXRjMjlhRmg2RkF1QVlNdHhlL1VN?=
 =?utf-8?B?OXcwZ3R4dFUyaHJaWFBEZWFlenI4TzkxZTR2ZzZpY3ZEeUpFVks2ZjVlTnJ6?=
 =?utf-8?B?QXM0RUphMWhVazArdWdHM3E5a3ViL0JSU2xCRXNJang1QnpPM2tmUlg1YVhE?=
 =?utf-8?B?OUxqRkJVVlpxZmZkU1NYT0wwaXk2TXgvbHE4MGtTRWs0bHltcmQ1SGNEeEdv?=
 =?utf-8?B?c1pwak8xZU5ybUtqV24wdE5tc2VhUUxlcDlUMWx4YkQwK2NXZ1NGY3dKeVl4?=
 =?utf-8?B?VGt1Qm05ZndFbm1jbERDM2k5MWFETGlpZjdLMDF2aGNXcTFFL2NXNE5yRmtm?=
 =?utf-8?B?Tmw3ajRhM0NnYU83aHgxdERtdjlaQ0pOaWZCVWlzRFJzT2diZXdWWGJWT003?=
 =?utf-8?B?bk1rNldCV253Z09mUUhyNTU2RndENzlmT0lsaVZaaXAyTGtlSitvNHRwYVpG?=
 =?utf-8?B?NitFNTdqR1ROQzRsQzVLcFlEZHBwaFhLVjFMa2ZJN2phQ1R6L0dKUjVtaksy?=
 =?utf-8?B?ZlZrMTl0MzYyZGpvTTlCOFZzeVFVZU9sbHByNC8zQU5mbklGSXhNVUNWYmdz?=
 =?utf-8?B?cHZ5aW1iMHk0cGViZExRb2RwZHBvWTZiV2tadjJ0MjJSd3VzaXRhb2hWQWcr?=
 =?utf-8?B?UjE0dDBjK1VkdTBQR3ljM0V1Slc3czRRU2lrRmFabjRjVG9Wd241Y2xJSjho?=
 =?utf-8?B?NE5qcVRIOGxlRGJSUVo4dlE0KzRLOWhkendYSUhYVUpxbk8rNDdGdGJwRGlV?=
 =?utf-8?B?OXl6Ui9GN3l1aFE0cWloZC9aK2NlOVQxMnYySzNRdGtiN05XODkzL251cjVq?=
 =?utf-8?Q?5hioCwAnBy2MSE+1yLmM2yUo8nfLzepE11PMdGW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6adb57b8-5468-4334-a871-08d905b40162
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 17:28:12.9648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPvw1FzoFHz0ueKJdKwgqUwSqTNkRhP8RNwmJegGk2AD3+7G9DDGelh2tEKeGAte0U5DsenZC0o1OvJqTxOuA+K6P8vso8jAfwWh2g/xt4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5854
X-OriginatorOrg: citrix.com

On 22/04/2021 17:35, Hongyan Xia wrote:
> Please see my reply in 03/13. Can you check this diff and see if you
> can still trigger this issue:
>
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 50229e38d384..84e3ccf47e2a 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5532,7 +5532,6 @@ int map_pages_to_xen(
>  
>   out:
>      L3T_UNLOCK(current_l3page);
> -    unmap_domain_page(pl2e);
>      unmap_domain_page(pl3e);
>      unmap_domain_page(pl2e);
>      return rc;
> @@ -5830,6 +5829,7 @@ int modify_xen_mappings(unsigned long s, unsigned
> long e, unsigned int nf)
>   out:
>      L3T_UNLOCK(current_l3page);
>      unmap_domain_page(pl3e);
> +    unmap_domain_page(pl2e);
>      return rc;
>  }

Yup - that seems to fix things.

~Andrew

