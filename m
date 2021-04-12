Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E170B35C56E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 13:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109028.208105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuum-0005j1-Gw; Mon, 12 Apr 2021 11:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109028.208105; Mon, 12 Apr 2021 11:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuum-0005ic-DX; Mon, 12 Apr 2021 11:39:36 +0000
Received: by outflank-mailman (input) for mailman id 109028;
 Mon, 12 Apr 2021 11:39:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFJS=JJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lVuuk-0005iU-VM
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:39:34 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f16a373-c002-439e-acd4-871a5bb67942;
 Mon, 12 Apr 2021 11:39:34 +0000 (UTC)
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
X-Inumbo-ID: 9f16a373-c002-439e-acd4-871a5bb67942
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618227574;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B0+0A5ZKssTSkPZHGxqG1fB+GDN3eeUg3aQ/YkOD2SM=;
  b=Csze3YUvAZQrgEecB5RmDqDgdoQ27GMuKnG/dMWE1aexX/+Jm5XOiIok
   IWThnMjCyfjQA470ICbBcnmEwcarb0qPvcjAXlAFvFhnombGJkc9Qdeeb
   JEIr+FUFvaNfjoa05wV0uDoaN5UWLyQc7eRyDrS6pqRdwcPRsQBpWbiYl
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TPQ1ZAybMK0iEgjwJo5wSRCE7/b3w6W7zODoz+3w7Z1pDOAymT75tV6Utq4nbv7PcpG9hausGl
 Xh/gSXZ9UhdsiURy2WxZtXFr4EfnM/9S8f8TlIS/saT8xpUdwR1GWCu9P8dY2urQEO7IRLb5r2
 /1Sd+N2rGj1ofZe2D/aFGMQJMEdEZ8a4G+qBx0fny2bztBm7Ww0yyWOwJiP1B8dY+xIe4Po0U3
 zCaQFImAzPHtAPf2FIZE3jBXTC7MTxmnC3S+zNG1kxgKE4vTC2d8v05l50HM17RNnP4sqNP0ub
 kTc=
X-SBRS: 5.1
X-MesageID: 42849838
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IYcp+64MMhjW7bDcfQPXwWWEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbzqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAsqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+HLzGz2BACXzRThYoz6G
 StqX2F2oyPkdGejiXd2Wja8ohMlLLapOdrKcSQhqEuW03RoymyYoAJYczkgBkUp6WV5E8ugJ
 3wpX4bTr5OwlfwWk3wnhf3wQnn118Vmgzf4HuVm2Hqr8C8ZB9SMbs5uatjfhHU61UtsbhHuc
 ohtQLp1OsjMTr6kCvw/NTOXR1x/3DExUYKquIPk2dZFbIXdb45l/1uwGpuDJwCECjmgbpXdt
 VGMce03oc1TXqndXzD+kFgzNuwN05DZSuucwwpv8yY1CVuh3Zpz0cU79x3pAZwyLsND7ZD/O
 jKKaJuifVnSdIXd7t0AKM7TdKwEXGle2OCDEuiZXDcUI0XMXPErJD6pJ0z+eGRYZQNiL8/go
 7IXl90vXM7EnieR/Gm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uu9HImYRdPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOUIp9cAXU6UqM6jEPyrisXrNNLoYJb9GzctXW3yRl
 EZWiLoGclG5ke3HlDihhz8XG7sZ1zf8Zp8HLOyxZlX9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71oO3zFPGuVrg3iFMAF5wH0xV6LLvXzdhvgkRKX75dr4FppG6cWBW132XGw9nQ6rtYU
 lijmUy3ZjyA42bxCgkBd7iGHmdlWEvqHWDSIpZvaGf+8H/eNcdAow9UKJ8USXHfiYF2DpCmS
 NmUkspV0XfHjThheGOl5oPHtzScNF6nUOMOs5bqXXWsG2GvsExTn4nXzqjOPTnwzoGdn5xvB
 lc4qUfiL2PlXKEMm0kmtk1N1VKdSCqGr5cNR+EY49Vg7jvXwl1QQ6x9HqnoiB2XlCv21QZh2
 TnIyHRXf3QGFJStkpV1bvQ/Epuen+QeF9xbX5GoZRwfF62yEpb4KuuXO6ewmGRYlwNzqUmPD
 bJbSA7Dyluy9q0vSTl0gqqJDED/NEDL+bdBLMsf/XvwXurMpSPjrxDNeRT5oxZONfntfIrXe
 qTdxSOFi7xD/ok1mWu1y8YERgxjENhveLj2RXj4mT94WU2BuDKJk96A54cONOR4gHfNr+1+a
 Q8qehwm+S+Mm/8MIHbjY7WaiNOMRPVryqdSfoypZVdoKI1s/9SEvDgIEz1/UAC+C97CsH+0H
 46auBcxpvqP4d0Zcwcey5D5DMS5Z+yBXpuljazO/M0eFEmsmTSMNyI6YfZsLZHODz0mCLAfX
 2ktxBH9/jLXyG/xacXJqI5L2NRclU94h1ZjZW/XryVLAWhbOdY+lWmdle7bb9GUaCAcI9g4y
 pS0pWtn+WNcTD/1x2VlTxnIrhW+2LiZc+pGgqDFapp9NO9UG78zpeC0YqWjD3tTyG8ZFldrY
 pZdVYIZsAGswIctuQMo2CPY52yhFkknVtY6SxmkVCo+rHO2hakIWh2dSvDgptXWjFPNGOvls
 qty5nB6EjA
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="42849838"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pj+z7f3iEKeAsDH89MsAWS3L+b6RjY8bzl4BSs3AfD/4YP9f3DUrS99J/IoWwozEYN/oaokRcALN30Z4LoyX+Yk7g6C9jvvTEp72rkUtyWCBpV65gjTlM3SNdQ/ipKCdTtCNSuCi2xnmF65d7uwBhQA7Ymh9TwMqnh9sZt5KVboexCBo1sDBjUG/zP4In92KNp5OYOPVCGgUeSnsvx3hvB4CQTsIKPGy32r1OmHyNCDsCn129TozfiUZZ9hEAnexMZoKJGLjwBhypbXf5s78EMS82CYGzlHu7TmAtDFxgeSThQdZB3o+XtgPE8A8ebLA8mLyjMyrM4Zj1+KQQDRUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42zND1UL/NBrXW80g1QWjY9exX6BxZkRANQwSAZivOE=;
 b=UsYelwvseRLG3WQQeKXDyMS6k7C6WK1nWtuoSXw7x+DHh4NxeO5uYBQZ4QwEnatAcgymDpmsi3qXwMA5JCYR7FS56Eq0x4yDxlwbKy71H782TsMjSe7/yqq21yXMdXq2PV0iaAM2BqWkg1FlNOGuZcfV6zOHI10xkPC8UONEWtfqbgJYCRdQ35CwVPZfnyCy1yqM5DZ+lFyvdCtWVQAj2LT2FCiMv3X7W+SZc8ry6ZoPdztT81PWVWCDAxgdIgSGUiLauqxI2Cbpqs+l1zO2IFXKiucMxN49yQ0nhcnFcYB5wnuPEsvQbqYVD7YTCjtGv8mTO3DSyWQmOrb7FzAc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42zND1UL/NBrXW80g1QWjY9exX6BxZkRANQwSAZivOE=;
 b=XndiwGwiFMovkkZVhrap7Pbr7OO7qQszcFnqsUttUU9IxYTefhTX5dPXbHlaMqEYJO3xi85fwfEAKUC6qbMg0sZCmilB4IKsCeyw+n6OeGdL3dNguZL9IPBsX5LyeoB/qBNJK0WMI/soEbm0QN00cBZccDfwtMm/6y32oPt5m/s=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210412102247.2118-1-andrew.cooper3@citrix.com>
 <fb2a13bc-29aa-d27f-16a5-2ee272a3c122@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/cpuid: Advertise no-lmsle unilaterally to hvm guests
Message-ID: <3e5c2bec-fedd-53af-0a58-d12c8fc13d90@citrix.com>
Date: Mon, 12 Apr 2021 12:39:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <fb2a13bc-29aa-d27f-16a5-2ee272a3c122@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb7f3301-2324-4c12-e1bf-08d8fda7a25e
X-MS-TrafficTypeDiagnostic: BYAPR03MB3432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3432ED14F0F72B559C8C2A6BBA709@BYAPR03MB3432.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAqL1WbskElR8Qpl79jq6mS+HHsiC/ou6Q9Hecg7VQiFFiCX3iOFMoPfFbkK8Tix2Bx5us6xCvbZzs+ceL46TyikLV2+3kAKGN8EHAAYs4vtPdOthP1ttyDDcLTjHqbns5hJt8GN7UGYgeIj3sCp1Mx6NGKBpbWb8JL7bsA5CiJA1AZWq/jITp3PDc4WFdVqf6/MLq9oKpffXL61m98I5xhkFYu8XBD56j5zU0MgxCk8Lp3C108bVbdGV4vBCexBLXHUoAoZm8uITT8u0ROBEyXUDpOgDXS9Clh7VRumynu2u/X4GHe2ofZ90akDAMENXgAwegedKVqOXTKwn5IWGS4AKdObf8PQBLRhCmZdmk7YITSJ1PogdAs3HUT2cvCV76CvkaR2blpUy5XU7Z2v1Kp2T6NFcpsvXcj53WM005DHEGpINzm09cC/FGVTe4MfQNklewCCyIFUWpS6vIinA9wbCrq9/I8bnkp1BBlGaSj252DQpypl/YAi2VG/fytksxAkbEioc5gYNpy894Kh4iltCnD0ag9g8HMK/EhTu4rI79P9PQTEy9ybdonUhUp3xd0CMGmhDwGorUxRMGLZtclq34iQNu4TYo3I6myC47iAYn1MHi/etRXfgSLrPoNOtoLDoRnFuibzaVITWs5hCy0rHe/d8W1iX7q6xoAgD387NZZBb28VhrzEAeD3XAG8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(956004)(66946007)(36756003)(6666004)(26005)(186003)(31686004)(6486002)(16526019)(2616005)(66556008)(2906002)(54906003)(16576012)(6916009)(4326008)(8676002)(5660300002)(31696002)(8936002)(478600001)(4744005)(38100700002)(86362001)(53546011)(316002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q2ZzeEVEMFMvb1VlbCtrWnY3ZUhuZGNRaHBUMUN4bTVlb1g0QzlDcGtNMU9C?=
 =?utf-8?B?QXdjZ0d2ZVVZSndOaDVFWXlPOUw1K0l5Ym1nU1ZjdE5BSDlmbWFrMCtCczJ3?=
 =?utf-8?B?VUsvUTB1UmNYdmk5TjI5eE5jV2xxZEhrdndWM2wzUkdiUlhVV3RqS3NkRFlS?=
 =?utf-8?B?T1hHTS8rQUtYSzNIRmRyR05wbXNWUmJSTlgrdHRJaWlrKzNONFhEbHREblVT?=
 =?utf-8?B?ZjBzYlAyWmN0ZlJOcUtvekpGbmUzYWxQUHNEMGUwOHRidFRiSXd1anBkWGtT?=
 =?utf-8?B?U01BbXJpS2hRdnk4cHJkOW1VOStuTFVlN0VzTjlaQndBSXkvV21WWStBZ2xL?=
 =?utf-8?B?M3Qya0JSVVZVMXA4andDanEyVW5QeVJZamQzVzJ2anVBRWgzaFhONm44VVdZ?=
 =?utf-8?B?azNmcExRd1NqYlEzdlpNekR1UjlNNmVPdVJWSmZER2JZSEs3L0JaNGZXaWxz?=
 =?utf-8?B?Ymg0RHEyUUNoMGgwVllBT2RPSmg5MmwzTzhWYkMzODlyZEo2ekJOd2hzZ05i?=
 =?utf-8?B?dURONmxsTlpUTm13YSsyK1JFVGhaOGVZMU4rMGZ1MnVybHpkbHV3REhvRWg5?=
 =?utf-8?B?T1lxdE9sRHRVVFVDZm5mUWYydnNKR252TDIrdktiUDAzTFd4aDlZbDBZT1VF?=
 =?utf-8?B?OU4xaUl1TVExdGZDQWxUTjZ5Sis4N29yYVl6a1lQeDhoYnJXa3FoNkJwOVM1?=
 =?utf-8?B?WUR4eHZmSzczRDF5cGtFMlZuUjZ1ampYaHdBdDZEZW1sT3lJSnBYay95Qk9U?=
 =?utf-8?B?N3p0cXpTSFlobGRsdzhvOHJhM2FTOGZqUXhUcHFFK3FpNGY5RmhJUlhJeXBV?=
 =?utf-8?B?TVpVQ241MndobE5zSU9jTUVseUJNbDZ3M3IrcXdJTVFEN2tRdUQrNHQwUmkr?=
 =?utf-8?B?R3hiVTNLa1FWcEc3TXEvTnVNNjhEWDNIbkxQUUNsSk85VEJ6TWFoc0t6NUxn?=
 =?utf-8?B?MlF3RmpSS2JweXFxTEszTlBmV0wzRHJFeFI3OWlRWWNValZPcXhnMW1vZDg0?=
 =?utf-8?B?enNkOTEzc2lsbHQzVmduNy9EMDNRSFRpNjdSZ3I0dFdIMVNDNkpoZjE0ZUd6?=
 =?utf-8?B?ZWRLSEU3OWpvekFXTnZpeVkrOUZ2RG50Uy9Qay9oUU81RHFYK25QQW1QV2lF?=
 =?utf-8?B?bWF1VGsxTmhPcGtiOXFwWERHbU5iNnEwMlhONDI5R0dPUlpscWxNWmMxbUZW?=
 =?utf-8?B?U2ZQQU1uQTFiMzZyWlhGOUFlNGFQZ2VkTVcwMjN0VmlBb0g0Y1pNckxUWHoz?=
 =?utf-8?B?cVB3c0JEek1aMkl1U3VDeGR6TGtOQUJrRFp5QjBIWDdueXhKMVFxMTUxYW9p?=
 =?utf-8?B?aEd1UG91N1hzL3liQmI3ckpkcGJNSENpM2ZVak1xamhpYldzZlZDOUZWOHhl?=
 =?utf-8?B?bjBzMm1LR1ZZRis1R3o2NUdFMi8xQjdyT0FvdWZPM0thZXZDdWtCNlhMNmpP?=
 =?utf-8?B?dHlPNktXNGloNGpHNTRhK2FLeHlERUpab3l3QThzMzBVMHdaa1lzMzQyYlNP?=
 =?utf-8?B?VjZ4SVNEV0s3VlRlUlhkeXhJNlljRXBwMG0xUTkxb1NFMU5ITFJTeERmUFlI?=
 =?utf-8?B?eU1yMUhhUm05M1lGRXdDemtmYk1ZNnJ2RHlwMU5STG1mOFFrdno1U1BNV3o5?=
 =?utf-8?B?d2JUb0M1SGNHSkorSHNjd3BEb3BpNG1nWU13UEx1L29ZenBuS0Q3Wkl0OHl4?=
 =?utf-8?B?SDdOSEtiRWJXY0RvQ2o2aXlrVDZidkpucE9TRFhzSzJLUG9QT1Y2TzN5UEVU?=
 =?utf-8?Q?HAYVJBCKWbKh5VxBghTgFdcYRYDsVR1Bq6eyX3+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7f3301-2324-4c12-e1bf-08d8fda7a25e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 11:39:29.9927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bi9Vl/6GQC3iP5SgMrDwESERchS0RyTTgxvL13VmRBtu4cIytqMGe0XOiF6DyEnUZPxaeELKcT+32QRTHD8/kT9shNkh1/xFwMG5mWg6MQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3432
X-OriginatorOrg: citrix.com

On 12/04/2021 11:48, Jan Beulich wrote:
> On 12.04.2021 12:22, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -456,6 +456,12 @@ static void __init calculate_hvm_max_policy(void)
>>      __set_bit(X86_FEATURE_X2APIC, hvm_featureset);
>> =20
>>      /*
>> +     * We don't support EFER.LMSLE at all.  AMD has dropped the feature=
 from
>> +     * hardware and allocated a CPUID bit to indicate its absence.
>> +     */
>> +    __set_bit(X86_FEATURE_NO_LMSLE, hvm_featureset);
> Why only for HVM?

That was discussed.

> And shouldn't the LM: entry in the dependencies
> table be adjusted such that !LM implies this bit clear?

Probably.

~Andrew


