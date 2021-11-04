Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5C445648
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 16:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221629.383431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miebB-000720-6h; Thu, 04 Nov 2021 15:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221629.383431; Thu, 04 Nov 2021 15:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miebB-0006zM-3F; Thu, 04 Nov 2021 15:24:17 +0000
Received: by outflank-mailman (input) for mailman id 221629;
 Thu, 04 Nov 2021 15:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6ik=PX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mieb9-0006yx-Bf
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 15:24:15 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42988a4c-3d83-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 16:24:13 +0100 (CET)
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
X-Inumbo-ID: 42988a4c-3d83-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636039452;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=scTOo4RUYtaECrO4Oku0vJDwnaiUtc5U26pKcmNJNhI=;
  b=HXbufmBfvF4H1SwWbhIv/qRfAdLFQMh3iCqx/oNCvxLL6RMZ4YhUadiq
   p0LO4hyggKDXi77ZHKtPlm2aVqILznJgFGFO6GToX0vysdHuIKTZlzo/J
   xgQUzYhVCVyMM5LUIJ+Kt4lre1kY90IbUG+a5HjG8Oq/g5s9Jf5z2pOHJ
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jZ65L+xUk/df7csQKVPS1bZZ7FIiXT8egvUqpsuSJ20DZZK8z6tSe5CzZxasT+EdUT+/9Zs5zj
 Hw+EDKnt8QrJCKXNKX4fCjonnw49ZLRMggEL6Gg/3CFZGlCE5Y4kUMAvWCuws0yHHdyvfFP2TF
 vyFM0PRQPaEaEk/lyK0qVHgp23pw/3Sk6jDWmBjgAAM+mQ2Xy413O4FHjLxgkZts/3PNsGjpHt
 i2ilvPK+GOYV10qyKgg36evTLIsfFdkvjpVUP3f7kg56nQcQ2cs93YfF+3gHhlrMnau5uq35+r
 0EEjo+zHGK4Zb/bcar5NdUD+
X-SBRS: 5.1
X-MesageID: 57060988
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BhtVgqyCANd0PYqjGOx6t+fdwSrEfRIJ4+MujC+fZmUNrF6WrkVVz
 mMdWmCOa/6JNGCjfNpybY7j9kwE6p7Rx4NlQANtpCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrZl2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+x89
 NtRrMPrcgtqEKDJiuAXfz9DFz4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIHhGlo15AedRrYT
 +cwThxocQrGWUYMFFQsMKwdo8jxjFCqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGRi1G8c8JSL
 VQO/SgjprR081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S6lC1QKUiceM+cq9+E7QC4u3
 HOvhNf2UGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lo0EuRE48L/Lqdy4SsRGqum
 2ziQD0W3u1L1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHd4
 xDoeODEtYji6K1hcgTXEI3h+5nztp643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK51gMtcEOZCL6N/cmC25UNyjM5fKwfTgCfqqFBuein7ArLFPXlM2QTRfIt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8ris9JAHKLXee1U7cIzjYteIqY4cl0Vet/09vs/D/
 22nW18ez1z6hHbdLh6NZGwlY7TqNauTZ1pgVcD1FVr3iXUlf6i166ITK8k+cbU9rbQxxv9oV
 fgVPc6HB60XGDjA/j0ca7j7rZBjK0v31V7fYXL9bWhtZYNkSizI5sTgIlnl+h4RA3flrsA5u
 bChiF/WGMJRWwR4Ac/KQ/uz1Fft72MFked/UhKQcNlecUnh6qZwLCn1gqNlKs0AM0yblDCby
 xyXEVETouyU+90599zAhKalqYa1ErQhQhoGTjeDtbvvbHvU5Guux4NEQd2kRzGFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu6ARlL9UvQy6B
 hCG9tVAYOjbPcrkFBgaJRY/b/TF3vYRw2GA4fMwKUT8xSl24LvYDhkCY0jS0HRQfOlvLYco4
 eY9o8pHuQWwhy0jPsuCki0JpX+HKWYNUvl/u5wXaGMxZtHHFr2WjUTgNxLL
IronPort-HdrOrdr: A9a23:hFnyyaF4edxzC7lQpLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-IronPort-AV: E=Sophos;i="5.87,209,1631592000"; 
   d="scan'208";a="57060988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4EwORgvxkopVGKaI33XNFwu1n7xm1EFIkAJw7tm1lakseGBTm1zFPG93AUYoxnr81DVKiEttDCGomIqP9L/0yFMw+jOMLufUcezZuXDXpnTDOkXs0L/G023D8GOI0nw/Dry7wI/UILLiakTqPgyjyDx/S94ICdnJxwr0g74Z1W9ojKPo9yhrf/9iuG1GXOwjNS4ov5k/K4dHErXKE30+IAXgE9YbrtxXSFunWcQW3iNeM2EuAgFnSIEOFVwDFYTqGjmmhVHkKNu5jij+I8QqccwC00/nXPPGoRwM++EnrkL9qff2A7ilJfnK8r7gu/4Atvd+jxEhVE823L/K+LiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiKl2ChBbwozG+wJlw9dtbCio05pstTvIJjKNhROzDo=;
 b=Nqt8vwGabb6mtu/NPqTvzJHViFyEJehEr6eEYVsJ3URpcPJNo3XYbX6Zo2Hij4fRxfMyo9ePzIfndWGAOmG2X4ALoVCuBVPZYBkQJfLTLqVrHecu3Iel3T56AHpkajb1RfxYFV5dCujkpX0GCet/E2aXiJvuyr9aelS47vygQHkEvZ5kohuHw2mhSjEgj8/fVac7jyE3pdcVaCZIiePUNFUqIt4DwQamYFUv1rGXgjcNaIZqCkMBdF707F0zH1hWXQcmDjDuyuW4VfSiAGzdvtp/+fiLta5cb7FVXSiOly8bm3SLHmeRWOWmnVrAgwm9Kyatb1To58YzJTkYipr7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiKl2ChBbwozG+wJlw9dtbCio05pstTvIJjKNhROzDo=;
 b=k3LbVIzslPrZD/X5Ux3qSJpKHI4dEnXWotlxaRKCthj+/bAbnBdoowb1uwaUbF3v94uP57epQ6M1YmogOWbGHRi02YIqw54tGi8jR6tQkO+tVKmECVt89Yb2nMWQaic347twlYI2uO7A0iKqRV/W5wh/5k98qBrLMBYQzRn4xtg=
Date: Thu, 4 Nov 2021 16:24:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with
 GCC 12
Message-ID: <YYP7EkWGdvlDzZE8@Air-de-Roger>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
 <24962.46376.136195.463274@mariner.uk.xensource.com>
 <1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
 <67d7cf93-2860-f8f1-9de7-932da7f537e0@citrix.com>
 <2051641d-17f4-07ee-9db2-0234e6ce4c70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2051641d-17f4-07ee-9db2-0234e6ce4c70@suse.com>
X-ClientProxiedBy: MRXP264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7338121-669a-4c65-acd0-08d99fa7249b
X-MS-TrafficTypeDiagnostic: DM6PR03MB3738:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3738E01C99FBAB86D439283E8F8D9@DM6PR03MB3738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9tc0ALXbkAtbdvi3tXFgTD43w0Ql3we6WCF5mTht9vZLGQKDNz28WDsAeF97rEqVyOba7A4/OECaxCjgqcfk8VswEDm5RmNw3NGw7cRXMyfnL8qhpxCIAT4+cc9HP0eeB5x7+SJrf8PKu7S/pBnbaqVqe4Y0Lho4vafoCPBrP9k73OPAyow1SqIimxIJlSc9h97RCJC0H0khR081ziCV+W6HU7OR0o/IpZyu4y6Vg+Lsl9X7CzSmCqwnLu/0j2wy778qH/n8cKhiGueosdJcDNzB75XyIqWnDgYBw/UG9A1Nno2UDYI7u3+dzWZFp8oM2JRp2cSNCrevTFUTYIuGCKrEz2VIw+XXUSYx5mDjioI4RK02UFYBTe5VrsyuOHRXSW2jJIPrSTS3U5WMd/Mx3AOukxz3/SjkGkONMwotCZiglmxCH6xv2cA+Kr4aYTc9EDpBhBy9XEYqJggpLerxCx+VGmPA/N8LbIyh2AyiQtjlx8v2RIa0bEvZNiXhthGez3YsWQz+axV6giA+uWUieI904aak+B+FRipwjSR4qwzGFxvbNm+4ugm3sdVM/3Q8oh+CUIZ3y8hpJPYuHzTmLAVHTIGlCuk6xKUPcxs+KY5Cn7uWKawwUZ0eVi3F+/BMClR3MkOagz8oiOPZ6f03g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(4326008)(5660300002)(85182001)(508600001)(110136005)(316002)(6486002)(54906003)(9686003)(66946007)(2906002)(956004)(66476007)(66556008)(33716001)(38100700002)(82960400001)(26005)(186003)(8936002)(6666004)(8676002)(53546011)(83380400001)(86362001)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2xmdGErbXVVUGZaOXZ2Ym1FSEdEdzBqckhFaEtrTE1TQVp6MDhUQWRscGV1?=
 =?utf-8?B?dml3QmJpdGREcjVMejJXaWgrMHB6R1pPS3dETzJKcnVDY2FaeUlWWHNXOWdE?=
 =?utf-8?B?emg2MUNjby9qazZlNjUxZU9Od1BMRHArbWpDVTNUZnNMdzM5UE9NVm1HeVNa?=
 =?utf-8?B?Q3AyY0E5WTdaSTJjZHZJa09vVDVTcHdLdDgzZjFOaXVQam91OWlFQWxKaVN5?=
 =?utf-8?B?VUY5WER4Y3VtbnhkV29EVjBNWVdPazV4bUpvOGJLd2d3M1laL2RHRnlrbHdG?=
 =?utf-8?B?V3ZEdTkzU1dsb2ZheDN6TG55aWpzelNhOWN3UFVNRmMvNUNTTi9JcDhESE9K?=
 =?utf-8?B?cnljQWZ6eDIxQml2Y05mbk1jeFk4VkJaOWRudmkwVmZ1bmhHYWEzc1FZNThZ?=
 =?utf-8?B?Ui8yLzdSM09uM0o0b3orK05CRk9ybWdBVUhYam5HRXA0eGZwMU9YWmkxNXk2?=
 =?utf-8?B?Lzg2WDdlSmF6ZnM1VFpTd1BvM1cyaTBGZnVtdFF0K1lJNTBDV29jSlVyejNE?=
 =?utf-8?B?Y3FnOFJtZUlCOWt5dmdqbWpnVXJWRjZ4ZFNZci9qQVN0RzBFV3JrUnU5THFV?=
 =?utf-8?B?SmV1enE3VlRLMitJS0tGODB6S1QzUElCN2xEdTFLemt4WDVLTlY4SmFMN1cw?=
 =?utf-8?B?dlVLbWN4Y00xaFpyaG1sL01GUDJsR0dCcVo1RTVlNk1Ea0FPK2lvQ3ZlenNQ?=
 =?utf-8?B?RGVuRVRJek5vYllQazZ6K1pTWmg4RGNESHptdzgrNjVZWGlLVGJkNWhrTldQ?=
 =?utf-8?B?L0k2VEFOb1FzcWV4a1dtTWZVMTdzeitNdUtNUlNuNVI2YllOVVhQdkJrU0RG?=
 =?utf-8?B?YTF1dHk3VHgwS0YxZk9KZDcrMW9oRmkzQjBzMnc0Q0NYVW5BVGdTb2lzNEtT?=
 =?utf-8?B?YlBZMnN4bVF5S1VpeTFKWkdORVVpZTFWaytGM1FRL3U1dU9UenhoQkVzZXVE?=
 =?utf-8?B?VE5PTHNtaFc4UHljOEs5ZjdYNG5qcW4yaHBtdTVNTDhSNnpObmZhaXRuNFlY?=
 =?utf-8?B?MzFubUZRZGthZ25rTGpHTGc3cXRwWFN4MzNGMEJ1c2VITnhBSVRUNkdwb0F4?=
 =?utf-8?B?TmU4Z3VOWjB5YTdreUdQOThnU2J4TWdzMHlyN0FzVmJDODVhajFzU25PbGh3?=
 =?utf-8?B?ZFZvRVRnNy9MTWJGMUVBS2FkdE5Mb3ZRdGd5dXJ1NWEvbTdlNEJzQjdjcDM3?=
 =?utf-8?B?bGxTc2g4M1lVT21OV0dGaXloandjbXlrbW1VV0lEcU9iS0lvK1ZsaE1EbVV3?=
 =?utf-8?B?dlg5bWpVVFZLSHlFZWRSWnFBRGZrU1A0dTh2ZTFuQTBlaDQrNkJOTFp5RG9W?=
 =?utf-8?B?SXRXaDIxUGwzVWpoaE9wMTBXS1ZLWG9RTElZRDRiaG1YcTNkbGtEY3ZvMXlW?=
 =?utf-8?B?MTBwL28rRk1SWVN4Y3ZKL1IydkJCQ0xjbE54cXpYL0hFR1ZVK3dhVHVFNDBm?=
 =?utf-8?B?TEcvdVRCQjI4V2ZzeGFRY0o2MnZvNWJtcEtOR3Fabm5iVGhuNTQ3aURUQUVX?=
 =?utf-8?B?RGZCalNSZjdrNGZNbmlPUUQ0OGJFN3RqTm5VVXQrK0xzdklNanVwRUlOTUc3?=
 =?utf-8?B?RG0yVVN5aThJb3JTbVpTMFhwUks0cVJCckJlWDRHek5RYklWZjJzS0FjNXBp?=
 =?utf-8?B?M0VoNHNwbzFzOHR1UjhBUVR6eXE3YmVRcHNOS1NEKzdqZHpOYXF1T2pKZW1Q?=
 =?utf-8?B?V3h1Ly9GRzJEWHI0MlZHZ2xTZXo2enE1MVdIeVUvLytoWFhubnQ0Q3VJOHBE?=
 =?utf-8?B?eW1FOTk3cjBmRU1yNFpra2xNWDRNS2RYWTRMbGlGRjF4MVQ1bVAyNEh3YjRn?=
 =?utf-8?B?V1lkZXVVYmxJdEdKTFJWWS9yWml2N0VpV0VFcFZNNmM0SzFTSi9vaGpIRUkz?=
 =?utf-8?B?aWpYOHRpWHV6alpBNTFoWExwbmxSTTQ1ZVZOcW45ZStvaFRrc1Z4QS93Vy9k?=
 =?utf-8?B?akhwV2VRYS9OWldzTk9WczAzT1Zucjh6NXRucmpSVmNVMEtGRVZoaWhEY0Zy?=
 =?utf-8?B?SWdRTGgzRlZKN2hsSS9SYllwVFJvY25tbm5ONE5la3NLL1ZBQ3ZaUU5OcTlk?=
 =?utf-8?B?MlVIVFlKK3Z0cEhQVElWSWY0NndDVENqU1hkbE1haUtvNEJIdXZLT2RCeWlQ?=
 =?utf-8?B?UVpRRnpydStIeWFpL2tJR0xkUUJkVHBaaFprNXZjSWx6a2loRXFCVTc3dnJS?=
 =?utf-8?Q?yCEHQMe9r0nAp08rpstVM1g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7338121-669a-4c65-acd0-08d99fa7249b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 15:24:07.3397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itYKbzCZk+N1nQG6srnJKYkZO2UfuayOZtYHBjcao9Bw/Ejmmef6TcDdNKlI+QKLL1rQSa3eW1bq5gxelFb1uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3738
X-OriginatorOrg: citrix.com

On Thu, Nov 04, 2021 at 01:17:53PM +0100, Jan Beulich wrote:
> On 04.11.2021 11:48, Andrew Cooper wrote:
> > On 04/11/2021 08:07, Jan Beulich wrote:
> >> On 03.11.2021 17:13, Ian Jackson wrote:
> >>> Jan Beulich writes ("Re: [PATCH] x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12"):
> >>>> On 27.10.2021 22:07, Andrew Cooper wrote:
> >>>>>   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
> >>>> I disagree with the compiler's analysis: While &(pirq)->arch.hvm.dpci
> >>>> indeed can't be NULL, that's not the operand of !. The operand of !
> >>>> can very well be NULL, when pirq is.
> >>>>
> >>>>> which is a hint that the code is should be simplified to just:
> >>>>>
> >>>>>   if ( !pirq )
> >>>>>
> >>>>> Do so.
> >>>> And I further agree with Roger's original reply (despite you
> >>>> apparently having managed to convince him): You shouldn't be open-
> >>>> coding pirq_dpci(). Your observation that the construct's result
> >>>> isn't otherwise used in the function is only one half of it. The
> >>>> other half is that hvm_pirq_eoi() gets called from here, and that
> >>>> one does require the result to be non-NULL.
> >>> Can you (collectively) please come to some agreement here ?
> >>> I think this is mostly a question of taste or style.
> >> Personally I don't think open-coding of constructs is merely a style /
> >> taste issue. The supposed construct changing and the open-coded
> >> instance then being forgotten (likely not even noticed) can lead to
> >> actual bugs. I guess the issue should at least be raised as one against
> >> gcc12, such that the compiler folks can provide their view on whether
> >> the warning is actually appropriate in that case (and if so, what their
> >> take is on a general approach towards silencing such warnings when
> >> they're identified as false positives).
> > 
> > This isn't opencoding anything.
> > 
> > The compiler has pointed out that the logic, as currently expressed, is
> > junk and doesn't do what you think it does.
> > 
> > And based on the, IMO dubious, argument that both you and Roger have
> > used to try and defend the current code, I agree with the compiler.
> > 
> > pirq_dpci() does not have the property that you seem expect of it,
> 
> Which property is that, exactly?

I honestly don't think we expect any property of pirq_dpci, it just
tells whether a pirq has a dpci associated with it or not. As I said
on my previous replies I think GCC is not correct in doing the check
after expanding the macro.

The relation between a pirq and it's dpci is an implementation detail
that could change at any point, and hence the complain by GCC would no
longer be true. That's exactly why we use a macro to get the dpci out
of a pirq, because how that's obtained is opaque to the caller.

So while it's true that a NULL pirq will always result in a NULL dpci,
a non-NULL pirq should not be assumed to result in a non-NULL dpci,
which is inferred by GCC by expanding the macro.

In this specific case I think the change is fine for two reasons:

 * The pirq is obtained from the domain struct.
 * The domain is known to be HVM because the only caller of
   hvm_gsi_eoi is hvm_dpci_eoi which in
   turn is only called by the vIO-APIC and the vPIC emulation code.

I dislike of GCC doing those checks to expanded macros. In this case I
think the change is fine due to my reasoning above.

It might be appropriate to switch pirq_dpci to:

#define pirq_dpci(d, pirq) \
    ((is_hvm_domain(d) && (pirq)) ? &(pirq)->arch.hvm.dpci : NULL)

Or to an inline helper.

Regards, Roger.

