Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D46D36C45F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 12:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118295.224363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbLI9-0007i4-UP; Tue, 27 Apr 2021 10:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118295.224363; Tue, 27 Apr 2021 10:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbLI9-0007hf-R1; Tue, 27 Apr 2021 10:50:09 +0000
Received: by outflank-mailman (input) for mailman id 118295;
 Tue, 27 Apr 2021 10:50:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mD=JY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbLI8-0007ha-Pj
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 10:50:08 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54278c6c-d795-4c94-b156-bfc73b0b2271;
 Tue, 27 Apr 2021 10:50:08 +0000 (UTC)
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
X-Inumbo-ID: 54278c6c-d795-4c94-b156-bfc73b0b2271
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619520608;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Zj2aJDOtNI/nXqo2vEdc3df4arHwa9FAPQdH2O9GCVs=;
  b=FJOMeqCklQqYRM+LNW6N7HK8biToz4X+AI0bZNVXDuYta+TI4CFK6LbI
   pKiUAlJhVv1FcVAH7FRuVjTFNCIu/+yArkjEF3EucW83a/5xZVdin1M70
   /7H8C93x0hnQ+z2V4vlxl+Qtw1NNGncrrhJp/pxvwvBmjwCiPXpczTkLW
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nUtMqLxo/97i1MIzknHRnIx7oyQxGpoknKeypjTgQG0iw9ILNfCRd9gKxa0aUkB5Ys7k552v66
 pE4NzXXkj7Nn/kqhJEES0+T7Li8tUxfkD+1DsT5/HoD6Z9ECQXAZUG0QX59T93lLWjCMLnPEju
 CVlLu2mwDSacDQRH42ghWINW07pvARqBlTjM3vMvAEa/zThOVjMYhRN+Ajdagm2txuqir6xF/5
 A/ei8XTvqMXSNa9QmstHyOjdZOQwt+hDzRJ5w2R7XU4mFvn1BwtisrsKHKq/M8TCwfyC3R5t4e
 gfo=
X-SBRS: 5.1
X-MesageID: 42878000
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LPKnMKCDrkHbccXlHegctMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmBEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVsUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbiSw9BEYTj9J3PMe4X
 HI+jaJnZmLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESPti+Gf4JkMofy2QwdgObq01oylc
 mJnhFIBbUO11r0XkWY5STgwBPh1jFG0Q6T9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvknfy/opyjz68PFUBtnjCOP0AIfuNUekmBFVs8mYKJRxLZvjX99KosKHy7x9ekcYY
 9TJfzbjcwmFW+yXjTyu2lix8GURXIjHhuKaVhqgL3q7xFm2F9+1EcW38oZgzMp8488UYBN46
 D+Pr1vj6wmdL5bUYtNQMM6BeenAG3ERhzBdEqUPFTcDakCf1bAsYT+7rkZ7PyjEaZ4g6caqd
 Dkahd1pGQyc0XhBYmlx5tQ6C3AR227QHDE1txez4IRgMy9eJPbdQm4DHw+mcqppPsSRufBXe
 yoBZ5QC/j/aUPzBIdy2RHkUZU6EwhebOQl/vIAH36eqMPCLYPn8sbBduzIGbbrGTE4HkzlBH
 8uWyXyOdVg4kinVmSQummSZ1rdPmjEub5gGqnT+OYejKIXMJdXjwQTgVOlouGHQAcy95AeTQ
 9bGvfKg6m7rW658SLj9GNyICdQCU5T/fHFW3NOrgkaDlPsfd84ypGiUFEX+EHCCg50TsvQHg
 IajU9w47iLI5uZwj1nLN67LGSAjT82qGiRR5kR3o2PjP2VNK8QP9IDYuhcBA/LHxt6lUJBs2
 FYcjIJQUfZC3fJkqWqjJsdAcnFbNliiAKXIcpZwEiv9nm0lIUKfD82TjSuWcmYjUIFXDxPnG
 B89KcZnf69gzq1EHA+h+45KVVIT2ySDNt9fUO4TbQRvoquVBB7TG+MizDfrx0oYGLl+38fgX
 HbITSOdevGBUdcvX5kwr/nmWkEBVm1TgZVUDRXoId9HWPJtjJI3eiHarGa/kGRZlEBq9ttew
 3tUH83GEdD1tq33BmalHK+Dn0g3IwpJfGYJq8kaavv1nSkL5ComakKE+RPxotsMMnjv4YwIK
 SiUj7QCAm9J/Ii2gSTqHpgBTJ9r2M8l+j0nDLi92q10RcEcIzvCWUjY4teBd6S72LpHanVlL
 p4iM84puu2PCHabMWcxaTecj5ELVfyrAeNPpUVgKERmZh3kr15W6T/e3/v8lps2R0lNsf6lE
 8EWs1Akfj8E74qW/ZXQj5T+1oiqc+GI0QquDHnG+NWRyBZs1bre/eyp4fSobUhAke9tBL9FF
 mW/Spa5erEVUK4pMknIpN1BWRdc04n7nt+uMuEao3LEQ2vHtsztmaSAzuYcLVHTrKCFqhVhh
 Fm48uQl+vSUybjwgjfsX9aJa1JmlzXDP+aMUapGeRS9ca9NknJqqy24NSrhDOycACFUS0j9M
 R4XH1VSN9ChDkkhJA21Sb3apWfmDNbr3JupRd9llDs3YC65nz8Bk8uC3yBvqlr
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42878000"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIqxdvL5fHtwsZLg+eLkqaE0WhPXdUxHafRbhJUvvgUR1ynbSDvoE7x+xmyk0Og2W3ypmDvPJumZBQHly0O4sQBd6cPiNz9XrCZFzbOlcb51/vtxvt5BuUXnbeXw5R7fsr1QRwPQuzsf+N1Jd+Yo4nOg+ACVeByK8A9wZHOFWBOxG2Xnnh9LrlAwk+S2rMf6Ek5FhkrXd1vypGv1XLV1kiGWRhgR5L7H6ZWShn98VtNVx0ggMYeFqfglrbfRm1D2jDi2Bs4wrVgaeks+KOYhfXgbGxsAQ/5OjQY8Bap4PGXRoZ8dzjgTxIJ+CwAdV38zuPcp/orQA+J9l5CswtjBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khLL002hRBXd9WKfica/99bJXhH5ZJ+qh+xZdE2rdSs=;
 b=YN6oZR8sEHXtr6kIymcGKohoYMMiVQiJYZA21Sh7TBG/TjgELw9RSRVgk+9l5cy7oVDN76+W674rOo4wLKqxkKOvz3+nE8PUtKnACDpEuDgVg3a+otTJUvoBitcRs/rcR+uJ+hItR0n0fLg70qOo6W7RLnwZfvgNZyBupWAV29G6Fu2wUjqOzCWlTZfmmrm8sf8szXsLoCrDhQMPcsFO+asBY0KyQp+oabKH2azTMfRpqR9RRTsUnNrmETldpT+CUCMxCmAQF+0WWW8pKpIfxK7PzxdasWkjzZZgCLZPZcXF/4PzF0hF6woxVv9GBfT8KQksOKVs7Xk4OagJuhL0DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khLL002hRBXd9WKfica/99bJXhH5ZJ+qh+xZdE2rdSs=;
 b=WYFDgjNp55b4yIOBQL+ThnAbiUlrJJmQuTxjuUh9PJuTaWQPK0kCwAlvve3AfMXUpYxGgXFr41MW7vKNU9ZOkS1hz2f28UATBVSJ1UaiAEfS8XqgyOOIV/YQkUok08MfLwalb9VwPXvISKmJIn5Rs3x7v+v+Y05dxIL0U5oDyBg=
Date: Tue, 27 Apr 2021 12:49:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/shadow: fix build without PV or HVM
Message-ID: <YIfsSsoAnCJX4V4D@Air-de-Roger>
References: <20210427104003.28075-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210427104003.28075-1-roger.pau@citrix.com>
X-ClientProxiedBy: MRXP264CA0036.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::24) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85edd391-5081-45fb-2fb9-08d9096a3027
X-MS-TrafficTypeDiagnostic: SN6PR03MB3759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB375974B9023AE6E4F64E6AE28F419@SN6PR03MB3759.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7HckLIuUSmunhe2xnqMEJoEO3bF2F3W7zUaHWTe1Ko25fOYOxZcyS3v3f8rKXzpFH8ziGHiy0uM5ceHMl25vEFHT/DhfPvwj7zjGJreb5pgzkR+70FqtJ0MG21+mzOSqYqk+DHWzzg32qSjcOB/66NxRt7GeU0UV7D0VY2TIMHj89RNgFyW4lPRuB+UHL7zHoMyNEYwvhxmw9/Sy16C+eubad7qQpPMfdAxGXtexhwlyH8cwlw1uKwgJOFbZcHlLRQ+y7NmTJkbqFNXQvtstnlxtfjzNSC0wD1WycgGwuJj/dGbIuj/Sa+rqCbnQrS6i1DsbaBv28e/2hPCubEDN78uDAsjrqFk9Jt/YFRLc4eu4JUnXBQqet2Y/yD2FzYbV6sqXRO7qBEZNbgzmK7h8sQGVZwIEaJkgXt/Wmbpww9cN3Pvrwf3tWA4+KjObBcBQyuF/eMXRVlEZ2EpXY2OakcGVWNRKGXglRcJ81/WFSLpKAewL2Iw2P5Z1bRtZukpexaKhJASW+x0bsoVSHDG3aAaZwC3cs+1zTvd9qwvmQqQSl8zufwP65UfY+EXKdQt8CanvZfqatgSGczRscEG4bEovCEiqYQ/NiH6EYVZ2GKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(366004)(396003)(346002)(39850400004)(956004)(66556008)(83380400001)(478600001)(33716001)(4326008)(8936002)(6916009)(2906002)(86362001)(6666004)(38100700002)(6486002)(8676002)(9686003)(5660300002)(66476007)(16526019)(186003)(85182001)(6496006)(66946007)(316002)(54906003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nlh1cDFQRjNwUTQzM0p0bHFHdkFvQmp5TlVrODRQQitKTHFXSTMxNVNlMnQ3?=
 =?utf-8?B?RkVZbXYxSVIyQVVHSFR2VzgvZ21yaDF4T3NuMnNFamNvcGwrTW9IZDlYalpL?=
 =?utf-8?B?aVlpK1E5QmhNSEpIWVBYZWNGZHV5d0RGa1ltV2I1NGcxVEZVb1ZZTTdySDNT?=
 =?utf-8?B?VjR6VmdndlJBeG8vN05yRE42eFBEd2I5b1VlNkJzUXdkVUVCLy9aWWQyN2hL?=
 =?utf-8?B?S2NjTXpub1Foc1J6aFpyZTN3cDUzMHA5bHZydnNFK3VQb2lNaFkzZnFEclAz?=
 =?utf-8?B?YXZncUxGLyswbXF6ZFF3Ui9lNVNIcmRXY0JlcTdPVzMwbzRxOU16Mzd4dDg3?=
 =?utf-8?B?VnhyQ2ZWUmF4b1ovOWxSQ1crRXFTUGxnVlB5WEpWQTVXN3Q4cjRPME5veUN4?=
 =?utf-8?B?WnN2RU1hbHU0MlRIeXVHQVVET3VVeFk5M0NVWXNBTUlyazZHWGtUUzFWeTlk?=
 =?utf-8?B?aHI2OVhnaGsxSU52ckEyOXk0ajYreFEwdEY1VWlFa1dYOVI1ZDF2czBCZDU3?=
 =?utf-8?B?M0xGQ1ZBT1dldVpwSHcxUHh0V1RjaGFib3Nlbk9HcFpIL0hia2gwaWJMeUJK?=
 =?utf-8?B?c2ZqbzZDWGdBSzFxZGkrRThTNXR5N2FYYmlwMWhFc2xJQ1RBb0J5MTJRVUdr?=
 =?utf-8?B?UHB4a2tEMSt1d2loejFJN2VNOC91aXNxZjdIbUoxdFVhelEyRXhSOEcvczdF?=
 =?utf-8?B?SFFGSjY5SHI4SitUOTVzSU0yVDl6ZXNGMWJST0E4V0szWlNPVm9VaGJIRE1q?=
 =?utf-8?B?TE56MXJvQml1UlpqS1U5ZFo0MmdFaWRLRUpnR29QUGdzYS9jSk9NM0hhK0dh?=
 =?utf-8?B?S1l5VWlEc1V0NmxBY3h4U1RUNkUxUWxWUVBRUHdHVldqbHJ5MHhhZDBlM2dE?=
 =?utf-8?B?R1lHbC9UR1UrVDVJcHpYRU9wTG5nb3ErdTVTT2JONjFxM1lITjNyVWc1cGdv?=
 =?utf-8?B?NXk0bW1LRlVtT0YxWnp1Um1FUFpiM3lJcnMydEVOeEE1ME04N2ZYYi8wUFM3?=
 =?utf-8?B?bmJIdlU0L1ZGSzFZNDNuOGJxb0JiOVk4L2hKc2U0WlZWTVhoZnc5Tjh2QWxJ?=
 =?utf-8?B?U0hNUVRJU3hvcDY1K0E1ajJWcTlRaldpRzFQZmJXNy9XYTZjRHRKQkY1LzU5?=
 =?utf-8?B?RzB6eGFJc3hMR1dURytiYVhyN09hSHpacGVEczJEakx2eE9FSlB4WlJ0dGs2?=
 =?utf-8?B?aFRkazdIcERZR05ZZ0RVVnBhSUdhRFN2VVBEVk8wMjNQYzRINEFiKy80VG9P?=
 =?utf-8?B?ZlB2NzZpUXVHa3dvVzN6WnRMMDBid3E3OG9qa2ZLV1o2ZWIxbTJwTDJMUmpS?=
 =?utf-8?B?S2JQcHJta3RSY0h4T0ZGa3RvL0pNak9CeHZPNHhxL28wcmRKQ1AxSVViSE0y?=
 =?utf-8?B?Y29FVEJhYlhDME9yMFUrZ2xXT3N4bXoxSWZpN2kwNHVPbXliNVc0c3BMZ1Zr?=
 =?utf-8?B?MDZucU1QcDYzK0JaK0hJUUlTZjlQWDZacjI0eEhTeC8yN2Z3QnBPdlQ4MGJK?=
 =?utf-8?B?L1EvNXMxNEtXQTNFdTJMRjVzWkxmSVJsY3ZoZTg1aWlOY0VNaU9Hc1drNCt2?=
 =?utf-8?B?YWtjbVpnVkliTlJhWGpFTytHbHhYWEg5SUh3Q2RaSTUvOElhUDVuVkZxQjlw?=
 =?utf-8?B?MWc2MXhTZDlIY3FmQUhYNURTbFExN29sRUkvbldmOFVTUXJ3TzdjdkM5Tnpy?=
 =?utf-8?B?RlpsaGxsSjYzRTZHajNOMThKWER1QlNYK1dqU0dLVm5SdWZwN1lsbmRtL2tp?=
 =?utf-8?Q?e6X+VjVrr7xUXrksUqvBvTuDxS3+nVYuZRtFiHl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85edd391-5081-45fb-2fb9-08d9096a3027
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 10:49:53.0167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAc9FgNW9xwDz6NnwaVJaAqI8EeIxVRblXgVeHj5i2CyCPHR2J2wXMHu+nqjw4iN37KPSx8mAd1bl0zVCxL/8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3759
X-OriginatorOrg: citrix.com

On Tue, Apr 27, 2021 at 12:40:03PM +0200, Roger Pau Monne wrote:
> When trying to build an hypervisor without PV or HVM (ie: using
> automation/configs/x86/no_hvm_pv_config) it fails to link with:
> 
> prelink.o: In function `sh_remove_write_access_from_sl1p':
> arch/x86/mm/shadow/common.c:(.text+0x72b4c): undefined reference to `sh_rm_write_access_from_sl1p__guest_4'
> arch/x86/mm/shadow/common.c:(.text+0x72b4c): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_rm_write_access_from_sl1p__guest_4'
> prelink.o: In function `sh_remove_shadow_via_pointer':
> arch/x86/mm/shadow/common.c:(.text+0x72bfa): undefined reference to `sh_clear_shadow_entry__guest_4'
> arch/x86/mm/shadow/common.c:(.text+0x72bfa): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_clear_shadow_entry__guest_4'
> prelink.o: In function `_sh_resync':
> arch/x86/mm/shadow/common.c:(.text+0x72e4a): undefined reference to `sh_resync_l1__guest_4'
> arch/x86/mm/shadow/common.c:(.text+0x72e4a): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_resync_l1__guest_4'
> prelink.o: In function `shadow_vcpu_init':
> (.text+0x72eeb): undefined reference to `sh_paging_mode__guest_4'
> prelink.o: In function `shadow_vcpu_init':
> (.text+0x72eeb): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_paging_mode__guest_4'
> prelink.o: In function `sh_resync_all':
> (.text+0x73315): undefined reference to `sh_safe_not_to_sync__guest_4'
> prelink.o: In function `sh_resync_all':
> (.text+0x73315): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_safe_not_to_sync__guest_4'
> prelink.o: In function `sh_resync_all':
> (.text+0x7336a): undefined reference to `sh_resync_l1__guest_4'
> prelink.o: In function `sh_resync_all':
> (.text+0x7336a): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_resync_l1__guest_4'
> prelink.o: In function `sh_validate_guest_entry':
> (.text+0x736bd): undefined reference to `sh_map_and_validate_gl4e__guest_4'
> prelink.o: In function `sh_validate_guest_entry':
> (.text+0x736bd): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_map_and_validate_gl4e__guest_4'
> prelink.o: In function `sh_validate_guest_entry':
> (.text+0x736dd): undefined reference to `sh_map_and_validate_gl1e__guest_4'
> prelink.o: In function `sh_validate_guest_entry':
> (.text+0x736dd): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_map_and_validate_gl1e__guest_4'
> prelink.o: In function `sh_validate_guest_entry':
> (.text+0x736fd): undefined reference to `sh_map_and_validate_gl2e__guest_4'
> prelink.o: In function `sh_validate_guest_entry':
> (.text+0x736fd): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_map_and_validate_gl2e__guest_4'
> prelink.o: In function `sh_validate_guest_entry':
> (.text+0x7371d): undefined reference to `sh_map_and_validate_gl2he__guest_4'
> prelink.o: In function `sh_validate_guest_entry':
> (.text+0x7371d): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_map_and_validate_gl2he__guest_4'
> prelink.o: In function `sh_validate_guest_entry':
> (.text+0x7373d): undefined reference to `sh_map_and_validate_gl3e__guest_4'
> prelink.o: In function `sh_validate_guest_entry':
> (.text+0x7373d): additional relocation overflows omitted from the output
> prelink.o: In function `shadow_unhook_mappings':
> (.text+0x7379b): undefined reference to `sh_unhook_64b_mappings__guest_4'
> prelink.o: In function `sh_destroy_shadow':
> (.text+0x74183): undefined reference to `sh_destroy_l1_shadow__guest_4'
> prelink.o: In function `sh_destroy_shadow':
> (.text+0x74199): undefined reference to `sh_destroy_l4_shadow__guest_4'
> prelink.o: In function `sh_destroy_shadow':
> (.text+0x741a1): undefined reference to `sh_destroy_l3_shadow__guest_4'
> prelink.o: In function `sh_destroy_shadow':
> (.text+0x741a9): undefined reference to `sh_destroy_l2_shadow__guest_4'
> prelink.o:(.data.rel.ro.local+0x1018): undefined reference to `sh_remove_l1_shadow__guest_4'
> prelink.o:(.data.rel.ro.local+0x1020): undefined reference to `sh_remove_l1_shadow__guest_4'
> prelink.o:(.data.rel.ro.local+0x1028): undefined reference to `sh_remove_l2_shadow__guest_4'
> prelink.o:(.data.rel.ro.local+0x1030): undefined reference to `sh_remove_l3_shadow__guest_4'
> prelink.o:(.data.rel.ro.local+0x1068): undefined reference to `sh_rm_mappings_from_l1__guest_4'
> prelink.o:(.data.rel.ro.local+0x1070): undefined reference to `sh_rm_mappings_from_l1__guest_4'
> ld: /root/src/xen/xen/.xen-syms.0: hidden symbol `sh_destroy_l2_shadow__guest_4' isn't defined
> ld: final link failed: Bad value
> 
> Fix this by making shadow depend on either PV or HVM being selected in
> Kconfig.
> 
> Fixes: aff8bf94ce6 ('x86/shadow: only 4-level guest code needs building when !HVM')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Urg, I see this has already been fixed. Not sure why my rebase didn't
clear the patch.

Sorry for the noise.

