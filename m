Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8852542ED75
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 11:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210005.366662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJNu-0008P1-W0; Fri, 15 Oct 2021 09:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210005.366662; Fri, 15 Oct 2021 09:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJNu-0008NF-Qz; Fri, 15 Oct 2021 09:20:14 +0000
Received: by outflank-mailman (input) for mailman id 210005;
 Fri, 15 Oct 2021 09:20:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=doKy=PD=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mbJNt-0008N9-Ol
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:20:13 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1940f790-2d99-11ec-8229-12813bfff9fa;
 Fri, 15 Oct 2021 09:20:12 +0000 (UTC)
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
X-Inumbo-ID: 1940f790-2d99-11ec-8229-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634289612;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8k7tCjyo4Qq2kUKLUP653B/CUYHYrYdovKTWpM/QmDs=;
  b=WsNARm6j66zz6zZ+lITs8ulZjyg6PuBB4CfJxJWZ79K4sqLpn3debG25
   4b0jx9xsdWhDM9igPuQaGM+wp0Rt6PiiULkTJv/4hi/wk0p2LdoyQ+00y
   5s3Q3wpGyqUUomVEY64zx9vuhMDUvQ/eEJnn5gfgFmZnvkYgBWP9Vm4RU
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XQuiyKc6J94Zx/VxcgzlIyC50Xi4lTUznjPo3Qp1q/KcZXO30R6r1qx7b6lvc9lYsFVsvKLAVd
 y4DAFS+Baz+lX6d12DtVireQQaSGYbNSwQhigtiygh2HajZeG8zfEoVpAlLIlEKaUb2QNmCWT/
 LHoJ5Ft6rVi9EMhWBVID5zsU0Zs23Ym7yZI4DcTckHBmTsMrDq7Qlg+AN9MNQiDB/L3AGCaMN1
 RlJWph945m45YuNgI2kr9QwOL3oTU82ihqhw94OHBFZ3UCgPTl7q8QFDvE92xtAE8y0TIrKuRF
 zhEaandxlnSSRUFLo83WS9F3
X-SBRS: 5.1
X-MesageID: 57158146
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DT6TDKIn4yW6xL2RFE+RJJIlxSXFcZb7ZxGr2PjKsXjdYENShDZWz
 DZMWG6HOvzZZGOjedt0OYrk9h9TuZXXzoVgQQplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140Eo6xrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB22goxL9
 dJupaaIWDsiFYnJoLQxUUBxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpv350eRKqAD
 yYfQSZlQDHYQQRvBnsoF60slcaFvEjuVDIN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfNly7mXIMZFJWj6+VnxlaUwwQ7FBwTfUu2p7++kEHWc81bA
 1wZ/Gwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4pXJvzykAUsUdAZQVNcNkMoOFRAoj
 3bcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K8+N9r33ojWv4mSfTv1oSkRlkc1
 hjT9HBm74j/m/LnwElSEbrvuDmruoTSBjA84gHaTwpJBSsoOdb7OeREBbXdhMuszbp1rHHd4
 xDoeODEtYji6K1hcgTWHY3h+5nztp643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK51gNvsQJZybzPfUpC25UNyjM5fO9fTgCfquMBuein7ArLFPXlM2QTR/4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLcuo9pINL7Xdf1MO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hS9T0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:A48PqKpzzIkh6RlIctiK0KoaV5ulL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFZSWTeeAd2SS7vyKkDVQcexQueVvmZrA7Yy1rwYPPHJXguNbnmBE426gYzxLrWJ9dPgE/f
 Snl696TnabCA8qhpPRPAh6YwGPnayFqHqgCiR2cCIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwluEvlWjrqh+qZ/E8J9uFcaMgs8aJnHFjRupXp1oX/mnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF7yfF6k3F6nID+nXiwViXjT/KptH4fiszD457iYdQYnLimgAdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kMYI5kYvE7c2Wft0l8gy7UlVGJAPEGbR84Y8Ct
 RjC8na+bJ/bU6aVXbEpWNiqebcHUjbJi32BnTqh/bllAS/xBtCvg0lLY0k7zc9HasGOtx5D7
 +uCNUwqFlMJvVmJp6VSt1xGfdepwT2MGTx2VmpUCHa/Zc8SjrwQq7MkccIDd6RCeg1JbsJ6d
 n8uQBjxCIPk3yHM7zG4HQMyGGXfFmA
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="57158146"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gvz0FIWT/lFTGxTba6VCGihe4py1vt9KlFRSE7nibuUtY4qNFkVwOKhF+okAevjTVk1XImFxzXqn9bNV50eATiQBWXBIN+sf1NeZJK1d0P7mLXkxL9p0aFJdYr3UXsEL3B9be+NzDWqeQ2FlQBIIiVFI2EiXR9PEPv+EOFaN/FzeBO3u903D5wbyUfjabjblrgfO2uIRM7PtYK+V3EunlKO3lSTSLAeaXspjf4Ce1jI1e6vk7XuYPxa8H6JbCTCDr0H2TSdPY6h3p//bLbtTlLh/hTmdQ7U0oOW+sRpdB8eJzgXW/Io37xdNP3BQjkT0bDUlbvmrRjFG9H9PYzfeNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8k7tCjyo4Qq2kUKLUP653B/CUYHYrYdovKTWpM/QmDs=;
 b=HV58XUNzjhK4jXbOCNRb8QVoiKRUe9rOlGOvcueHcja7/nLmCjcXxbbP778fYhhai0BIEdEXrz1pHrieGWin37L74Jb269eEhRoMyS8NPpdvXkXBfPIcLmPHSN0Ok+oQez1NHQge4FNvRl2GICYz1edQp48Nzt8OoNw8aF9M1lx1zOxgks2TvX1fwvXSnSrJ87besunOD+o9PEk6vkqN8cV4u9X5cBoNqRdTyNXkR+rEt64xQUHrczKNcGsPYJrNnYP2H6K0rkrpUsEPMoG+e/Is4kXsiWiotmAFqw0k3bR9yRILmFxnBDVuWJnFTiuiFg9BvgJziQr8rFWw0DhbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8k7tCjyo4Qq2kUKLUP653B/CUYHYrYdovKTWpM/QmDs=;
 b=ZdPUaXqSLWl8TQiqqzOOFn6TpPQ6sSH5w+RmrltOyfSXRcJ72uYeZnDLxMjxn0fRk5XWyq0SYANIMYztwfWIQaiXe9F1xyoPZnf4kcibfTrALcKOzT3koC0CtSrT4/PdT8yfbhjMuVkCdb7uMUIVHYKulfnH9IhzihGXK8Nzspg=
Subject: Re: [PATCH 1/2] x86/shadow: adjust some shadow_set_l<N>e() callers
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
References: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
 <298846aa-f93f-4564-dbf4-4f893df8f328@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0ccccb9e-6d99-f3c4-68ac-b6af88be8335@citrix.com>
Date: Fri, 15 Oct 2021 10:19:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <298846aa-f93f-4564-dbf4-4f893df8f328@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0193.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d198ae-9dd5-4709-8e89-08d98fbcf919
X-MS-TrafficTypeDiagnostic: BYAPR03MB4680:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4680759B21A1DA513B25996BBAB99@BYAPR03MB4680.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OW3fvBBD7I0+/KpXTj6VthrOKnciCXDMO4+SEO/JTJ3evDGjeVc5sgnyeH83mmI7AARrJuHYQlS7Ci4VIYfniCRnmgy9LlZdVbzomyVgCdq2zzX2WCGn5Zpe6gUHLa7km4ltTKhUVMLodmXOSJnYdcTMLryc9UtUMxZWsQ4eFoo+llm3pIOzi9ia4Gh5/alWyr1qnTWD+ceHfSXklrvsvsA/eCkNw2dJEsLpqW2KyJN8o/BvB8h/ll75nzWT9VQyi0VAcciy5OoIk5qjxs9LuWEFd/JcxSJufiFME+s2ULL2k/eyi8//VpQ+1iP+7SMcBH6pNVawyZIYdwvv/X0VOa8ott8cMv4dK5UnJs+NkQ+07LqicUr2O8Skkd9OTyb9QXWFDvG5Ejgicj5sQMaDrZ3hi8wiVml4M/lrdnX8mGt3IiXfWPRzczdGhBPSAVEVAbrUzdQwNIPklaxB08gqd7g2XHj5rwzOnigiMEXrraOetrMn9AE+Vn+lstn9mzw+O3x2NoQzz8R74nR5Od03hdpJfcgV2yqi2IwIZJBEgw+wq5MYRG/jGRmbuCstozTuWHylAjmlkBF/Y2sEdeF3f86rO3gRoddz1L/FC8KcHgx0WEFTm84V3Y7Ggz3HUHEQXqz5H9+wo+VBlzmJxqon7pVcSrTVqXerBC++kdi8tO6/H964QNOvg/wblqsVHSagPz5SeoJI1yW26X4pqfakoDt05BOg2GY2hw+kACLnzzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(16576012)(26005)(316002)(82960400001)(66946007)(54906003)(4326008)(5660300002)(86362001)(110136005)(53546011)(31696002)(4744005)(36756003)(508600001)(2906002)(31686004)(186003)(8936002)(6666004)(8676002)(6486002)(107886003)(38100700002)(2616005)(956004)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGZwVjhVWWczaVVqTXZDWW84WHI1WXhiZkJwclNxZ1c2MEI4SmVQL0RtdzF4?=
 =?utf-8?B?cVVsNUtad1hvd3NzQ2ZSdWR1THVGazBPeGtCd1Q0MGJYU2RlWmxHeDFNUWFI?=
 =?utf-8?B?YVpybGZtcVFSMFpYUXdBbXVGakMzQ3hFODF4VFdxRXlKRUlkaVZQWUkzRktV?=
 =?utf-8?B?ZVoyYVRoRktMTVpMSEpCNW9SaDFuSWhEbDZCbW1ac3Zjd2ZRSTl5SnJrWEgw?=
 =?utf-8?B?dXFhMXBxQ20vaW0weGwyYktwWGpzWkR3dXFmQmxvU1dCbjdhTWgxS1BHU0xx?=
 =?utf-8?B?eGRXYncvb01ydUxEVno5MGFmeWxwalNNdTdXM2IrZFUrWDdCZmVOK2duT2RQ?=
 =?utf-8?B?a0I5R28rMnJ3UmNUUXh2amdDVmtkNUhDRVVDcUtncEpydUdQSkFUTXBOT0w0?=
 =?utf-8?B?M0pFQlpzdjdwblBqajJzV3VtMlk2RXl4ZWhCRGtHbC9xcnl2cnZiM2s2ZlFp?=
 =?utf-8?B?dU5vRStSVHdJTG9CS0hPSFU1elZSUTdYUUVBM2Qzek13TXdLb3VKb0J6M2FF?=
 =?utf-8?B?NGtqUEx6R2k2R3h4YVEzK2w1V3c3SXQwTFlUQmo4WjhINmt4NnJRclhkak1M?=
 =?utf-8?B?N2JJZjJMUHlPSmorci8xcjM5SVVIc0NXRjMxbTlSenc3eTM1amtxazJWZlpt?=
 =?utf-8?B?UHR4UEc5NWFXazYzNnJPcTkrK1QrWkQ5Y2NDaHhHRE4wMjA2OW9NUzZ6ZGQw?=
 =?utf-8?B?QlhON05qSTFQd1AxVkpTYTFmYmtPTGdlaVZpUEd3a25aUmIxTzBwaU1zMVV0?=
 =?utf-8?B?RFIrZlo2Q3FwRGFva3Iydmk3WWhnaFBKNkJ2NVJFYW52eVhHc202ZEExU2VP?=
 =?utf-8?B?Z1hQeTZqT2ZRUnNzcmlwcW9zek5UTExCdExzZUVLMmlHcXdIRXNjQjZwTG9E?=
 =?utf-8?B?dk1PT3QwZGRRLzhPZHozQzNld29GMnJjcS84anR1NzBYQ2J1Zm91cXRIM3Bh?=
 =?utf-8?B?TlUrZlh3V0RHR1Z0bTVEYTlaSG4wQWxBeGdLc2s2aDUxTDhPN216RFl0Z1NQ?=
 =?utf-8?B?V0xEOXBQODdhTnozcWlmQlEybEdHU1NvRTFldThJTWtvNnlFRFNISlRManYz?=
 =?utf-8?B?bjRYNG1zUlJYVFk4TXZTcTNYMnp6VTF2VFN4bG1DOUhIdW5QUmpIMXgwUW1E?=
 =?utf-8?B?Wmw4c0lTVTZ1SXFCVUJZRzUrcHduNVp3dDkrNVQxemhRb1hBVHRLYVJOckdu?=
 =?utf-8?B?SXlSREdUN3dmVFUxTmxiMk1pWFRrMkJwR2FzcmFib1Y3LzJGU0UzV0hmLzNP?=
 =?utf-8?B?ako1M1EzRjl2NkJTRzRNM2NQTFVLZTh0QW4vZytTQjlhY1RxcmJ3MFdHU21Z?=
 =?utf-8?B?ZzRhRHZYNG5UbjlucXllRnA5VWpmanUyV05mdUxOUFBMYytMK0MrNzJWVjl1?=
 =?utf-8?B?em5qMVIrMWlCMFlGbDJ2eElWMjIwUVVFOGxqVTlGM0lPZkpnUVVNVzkwRXl5?=
 =?utf-8?B?dERyZDVSSjV1RjBzamRiY2JWRDIwQjJRUVV1V0pZaTdsa0xzN2dURFdraUIr?=
 =?utf-8?B?VDQ0Lzh3REM5Zk5EQXBuYVBXc3lCRmVPYVVBbzl5RDlUMHVTeExGTTNUK3M1?=
 =?utf-8?B?aWdZM3FVbDByTXRPTEZiQ3c4czJmOXBLV0E4VlBGZnBiRjd0dzNwai9NYk1a?=
 =?utf-8?B?cDArWjFLNUlBN0QwbWFJbHpJWnlDb0lIMEZyb0lycUsveFg4bE9yTnJCWGJP?=
 =?utf-8?B?SUNBdmZUQ3RobU0xYlhialp1QTVxNE5EeUhQTDdBK0NFRHBGYnA3WXduSHht?=
 =?utf-8?Q?aRf6cANzQtSeSjiWdT4iD6aWwMNoSKx9qcUeat3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d198ae-9dd5-4709-8e89-08d98fbcf919
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 09:20:04.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THdvF1y3D0qVDG2qLYZZvIzVnN4/eC9UvrSjyF/bP39kS3s1gpxk5TExwNrz76LqJ3qPxjNhVfFKO1cnczhelxRuH+YljzRjz7Ckf0/kEAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4680
X-OriginatorOrg: citrix.com

On 13/10/2021 16:37, Jan Beulich wrote:
> Coverity dislikes sh_page_fault() storing the return value into a local
> variable but then never using the value (and oddly enough spots this in
> the 2- and 3-level cases, but not in the 4-level one). Instead of adding
> yet another cast to void as replacement, take the opportunity and drop a
> bunch of such casts at the same time - not using function return values
> is a common thing to do. (It of course is an independent question
> whether ignoring errors like this is a good idea.)
>
> Coverity-ID: 1492856
> Coverity-ID: 1492858
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

