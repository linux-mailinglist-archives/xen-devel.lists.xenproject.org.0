Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED09372E0C
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 18:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122584.231204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxuI-0005qB-Af; Tue, 04 May 2021 16:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122584.231204; Tue, 04 May 2021 16:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxuI-0005pm-7M; Tue, 04 May 2021 16:28:22 +0000
Received: by outflank-mailman (input) for mailman id 122584;
 Tue, 04 May 2021 16:28:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldxuG-0005ph-Js
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 16:28:20 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dda30a9e-cb7e-42ea-90e3-50d9c4f82914;
 Tue, 04 May 2021 16:28:19 +0000 (UTC)
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
X-Inumbo-ID: dda30a9e-cb7e-42ea-90e3-50d9c4f82914
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620145699;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EgX4mHnTit9xAveOYeTu8DwYj7toK0IV/tcZ0arXh88=;
  b=Lmgb6JWJWrEjFw/aa8Dt65sz3Q6JEOip8WijYLG6+pD/YmmaOa2r7TM6
   jFxXiKR5YZOV2kNglLLLIArPYC1sy0pYmE3Y+x0sGUl6J7xVKPcKTvxXk
   +CD7sAqtJQw48lfMYN/NaphYvmFnmr33o5iWYUTgBasxwXylcZrYGMoHb
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cIrjpFa1y/Z8oGQuFburUWR+ftTj17yzvQ/yWkfXkmBTk6vnFPDuH0HjB47Vhp4f8nfVn6IX8j
 LxqsqFPZDEkzwtWPBQBwbi1ZOfxaU3sDA93gvI0Q2ekhL87OLQKIhNlb85uP0bfmoWu3UuZse1
 KDRBVF9qQg1tej9KXHc3vObaMAvLuCGNfDSNTZEbN9P72OYihtgfA//quemnzLgSSpGk0NuEMi
 y8xSpPZ7xD+b/uavevBYC98swvBtEgbs0hhb8xRb5oFV7Qr0EUyQRR8zEjsGCFueKuwDD59R1S
 Nik=
X-SBRS: 5.1
X-MesageID: 43430130
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bX5dM60qt/vMbJPbbyecrAqjBR13eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/BIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmdJ1/Z
 xLN5JzANiYNzRHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcFdxi1SYzzrdXFebg9AGJY/Cd
 647s1IuzKvdR0sH7qGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnm4j41VTRTzbA+tV
 XUigCR3NTej9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+32VTat7XbnqhkFNnMiO7xIQnM
 DIs1McOa1Img7sV0WUhTeo5AX6yjYp7BbZuC2lqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VDAzuPFWB1wmk2/rWBKq590s1VlXZYDc7gUlIQD/SpuYeQ9NRjn44MqGv
 QGNrC42N9qdzqhHhTkl1V0zMfpdno+GQrueDl5huWllxJSnHx/0nICwt0eknoq5PsGOul5zt
 WBHaJymL5USMgKKYp7GecaWMOyTlfAWBTWLQupUBraPZBCH0iIh4/84b0z6u3vUJsUzKEqkJ
 CEdF9Dr2Y9d2/nFMXm5uwLzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQ2GKTgKr
 SOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+c06So/jMNpbhuoXgAbXuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUdGjqfmD54JJsAInX9+Ue0+E2R8lxmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz3Wug1RQvBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmF+OJhp1SdLqAB
 dSzm4Hv56fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPDdo4nCI0lHIh8Dx/CGRAwuQsCkh
 YCVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7VTFtUudoskrbmABXyGnVPOWhQpGfUsQun
 RBt4skxJaQkzemLmUyxM4iNkdXVWiRCLVaSDieaJ5sgbDtcgFoRWKsjTiX4itDI1bCxgE3vC
 jMPCeUcfbEDh54tmpD2qjnyl9ya16QZll9cHx8rI17G1nXo3ob657/WoODl0+qLncSyOAUNz
 /IJQEfJQ5j3Pib/h+YkjTqLwRq+rweesjmSJgzebDa3X2gbLCSnaYdBvlO4dJOL9b1qNIGVu
 qZZi6YJD71EPkSxgSQv3opURME8EUMoLfN4lnI/WK41HkwDb7uO1xgXagcOMzZwG7+RfqEua
 8Jxe4djK+VCCHWZdGHw62MMGIGBRPXvGKsT+Yn7bpTprk/sbNvH5/dFRvEvUs3qikWHYPRrg
 c5Rq8+3ZXqfqlIVOYWczhC/lUomM+URXFb+DDeM6sbRxUVk3TfP9m1+LLGprokP12ZqGLLSC
 6i2hwY282AYjCK2rEbAZ8hOGh6aEAz73J54eOJHregQTmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 IS2aDFo8anMw750hvXpz11P+Zn9HumW9q7BEapFfRT+9K3fXSKja3C2r/9sB7HDR+6YV8fn4
 tLaAg5adlCkCAriMkP6ReJI5aH6X4Noh95+jFollnkx4ig7iP6JCh9QHzkq6QTeyJSPHiOhd
 nC6s6C2h3GkWN45aU=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43430130"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAARShNSfEFnNFbWOZT4VUviM0sjsaKC/yYsx43qAdSV35TZcorHQjCyn5ZMwzxsmsQISiGxC1ushLRMsPbsoqsHV2lhZ9oxNeSHiiI/K4114XzS1glOH5oFCEyUdsy/yXHqEjLS5giCYhPO7V75ljJ/WNI/tvWpOg1mO0hkcWavsdWKt/hGqns01QsJyT2Q2LYAKx5289xpFxKNLq+WFsefYLihzNhjTunFJ3NqAB92Ukp6abStwxKuqErgl552GO9ugUbPe7VlnEv4mvq4LMcGIyXoBHquD9OHXYJcHuiaeqI5cldnAufI6NxlLMCWv8h8aCtra4Tib0RIpanDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgX4mHnTit9xAveOYeTu8DwYj7toK0IV/tcZ0arXh88=;
 b=dxqRjS9XfSONej3imebt/YiwY2xDaanY9dIO0F+zJDQm9e8ZYBX1pjM/7XXIsEo47f4LRCNQw8R5cGSEStXF2tdQrRtSmvv7JYdTp29XcCLHuG3l+i3LmNNtUqnRcDhqoB/wUIdZBV0Y8eForDFdEWeCIkAnmjuOmb3mTdQhR/gTwi5MhqAUbl6J3phWKXoJhfa4n2DqmOn7sLo2XcP+oSpiLfIBTjLvg8xV4wb4ipxLi6MgEpoQRN8ukhSNHegl17YaDU/ABp6EOKhTH8Vtom9IyEFlsGqZjLFS34/nlSI6txrFCDf7pf5ENQsWy5vOYbb3eBwcA10YBkvzumlMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgX4mHnTit9xAveOYeTu8DwYj7toK0IV/tcZ0arXh88=;
 b=ZpKgcAs161eKlJLfNRBSnZ6k2f7vReNLe2kXmUHroziklU4J2kRHGSMdGs+kd3p5b5v9Ir5/zPuZ1eRxUedyrkfXvNstAkmmNQOIBx1Jse1c9NaYW948D0UgVkin5LfOCELBpQsXa/J8wvII6MWSnTeuLqyPzjo9NV6t8M5Mrd0=
Subject: Re: [PATCH v3 06/13] libs/guest: introduce helper to check cpu policy
 compatibility
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-7-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4a476df7-8038-01a8-a957-2de669609cf4@citrix.com>
Date: Tue, 4 May 2021 17:27:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210430155211.3709-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0315.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0f75a4f-483c-4952-ff8e-08d90f19940f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4806C1469F5D92185874DE85BA5A9@BYAPR03MB4806.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sF8PjUeTVMx1d0xTcqquxjumksjVCKkikGy5qxg1qcUOVgthhEznXHWyMaXO+9dJrVudx1z7051cG/4CamJCZWuJteYH14vLHqONcK7Oxlqykm7/a4T1BdzAbkuUJPLOqYO+sbmd9PPvF1tDGi0sccWu0TQ70/kWefjT5/cI5S4sgDxOBYfb4zMHyhwXF9cg1DA6hR4sl2T16gWl8wXob5XZNWS8MeiugqMc9lRv0ArX/D0WM9/UbreaTNkJJBZWiuDRNlfbA0jMl3syqzOMkPIaWCaGrdQnunUDKjn4YCUlry1H09ZruPJ6WD7pvJv/Q4/ovfmCPJiyKnkwuhh3FLQKOvxPurhayIeitnlfRsOL1qxTF4ur0wP/q3zfKTY+ZSLjublJXp8Rg4Y3477kQQW5I+7o2OUmuMK8oEXqgsjTcp7thr2NsT7jgzSJE7qS4bw18bgdew2C33CVDTA34KilJ/AHDKOExwYGFpPfDTmf3UEZ14Om3aqHFxGiWZ6dJHtbuMLFVOYbOIIE8eqdbaik6rMVukIMLqT+40W8FQizL4kXBegBcGBD0kqygDi7YZEkfVL9FViT3AE0kykBGtcOlloaaPCVLF+wpkKKDAEOdNcNSQj/JJZyLDyZxGNIp7U5kNKW2ZF5SLg1awviOZVx+sQ5MxFIoPhluDwPSQaOXkNqT5mIaKPKCQerxLIO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(38100700002)(6486002)(8676002)(4326008)(31696002)(36756003)(6666004)(53546011)(66946007)(2616005)(956004)(478600001)(2906002)(31686004)(16526019)(4744005)(316002)(16576012)(66476007)(66556008)(26005)(186003)(5660300002)(8936002)(54906003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VWNYQXZKVlpjaG1ldTRtK3J5b1YxMTNCbEw4amJpRmxaM3pPOGFvUEh4dVA5?=
 =?utf-8?B?dHdrSmovbnpJZUo2RHRXb0Zic0I2eE9hM1Aza0VhdFhaVER3MmpmVW1RYS84?=
 =?utf-8?B?eEIxWUl5cjI5S0NGT3BLa1dWTm9OeFBta0tzTEhmcjNtSzNlOHA5VnJ4RlBR?=
 =?utf-8?B?Tml5UUxzL3d6Z2ZQWkk5ZGF1Z2hNNFBsZ0ZDbW5xYUtUV1dFZWhGOTdYRWF4?=
 =?utf-8?B?Z1F1SlZhUTI0ZWpmejQzQm5ENjRMZWtqTW5Zc0RjN3prNUtMREw4V28xYlpW?=
 =?utf-8?B?R0RpelJrc0JRT3JjQnNhMEFUOE10N0dMc1RET2dtWnZ0K0c5YS9ZSVBCQStn?=
 =?utf-8?B?RS8zUDBNMmlQMXhWOXN5dWduSkZQSWRMRHQxeUg2VmdoUk5IM1p1N1Zoam54?=
 =?utf-8?B?bFZubXVrQzl3dGVhMmRES01rclJLSG1rUnJpZ3hQQUI4alVXNXRYbkxFWGJs?=
 =?utf-8?B?QXdnU2FyeVlSblJ1ZU5qUmtybTN4NU5IbTVuRXNTY3VKNkNOTStYb2Q0U3RH?=
 =?utf-8?B?amJnd0hGWnpteUlvUlZZWlZQT3ZSVGR0bCtKWlV5WXliNkIwSk5sOVdGeEx4?=
 =?utf-8?B?ZmUvdERFTGtzcURQVkJQcUQ3MGJjcG1DUzJvUlYrMThGQmlnOUlONWdUZVlZ?=
 =?utf-8?B?NHQ1Y2gwa0hoTFZWL2VYZzZBRmQxelZyM3BpMnZKaVBNM2NKQWlUWXNCTHZt?=
 =?utf-8?B?VXRjRTNyZW4vdUZSWTdHWWx6QXBoL1IyZGlQa3JxKzVNakN4d0dLZGlCNGxy?=
 =?utf-8?B?UXFMSlpHT1poRktKYzBBNFFsQzZoWWprRFVzaGhJbDlHeGpRQmxBQXVJZkMz?=
 =?utf-8?B?M2c1U2VJbWE3MS9ZYUtBcFp3U0NNVTYvNGlURnV5Ly8waVpqbjJPdVRGR04z?=
 =?utf-8?B?UFJXWDV0dEt2QmZWYkhwWHFkdHR0UW8wZnNkYitkOGpMMzRZZmZTcm9HQk9U?=
 =?utf-8?B?WStzWi9STUdkNzVJTTN0RXI4VTdsQmNMNEFiT3J4TStLS1ZuWmowaERjVkt2?=
 =?utf-8?B?U1drdHdRY3pzQ3paRnhWM0QwZ1Z2eWxabGd6cFdlN1k3WTM2Z2pKTGlUMUEv?=
 =?utf-8?B?aVpORXlWZWJIMURmdFpNY3dpcjBFQzRIVmRRVzlicVBlZnpTbEtvb0R6L01k?=
 =?utf-8?B?VVh1dmZGK0FDL3NwaDVaZlBDemtmOFV0clQ0VnlIcHFQVFUrTkQyY0JVcEZp?=
 =?utf-8?B?TFl2dWhCTDRYeWtlOE1UZ2ZiNzJPRklwdzNtY2hJTjdvdmxQTU9QYjVST0wx?=
 =?utf-8?B?bWo3bVJ3MGhZN2pnbGRYU3M4RTFjQloveDZZcjc2YWorcmVjeTRPVjBPT3RO?=
 =?utf-8?B?elczTTkyQ2I4cE40MFlnTTRRTVhGc3cxYm1iQlBWUDFkeTc1RE1VakRXUjhP?=
 =?utf-8?B?cDVJT0x6SWtoa1gwbTJqYWNlaUFqNVMwLzhGSnhRaCttS2hBS3Y2d3FJV21X?=
 =?utf-8?B?YmxkcWVWcEI5d2M5eWJYdlNSWUw5c3R3Q216cjJUSXBldCt1eXp5YTJWbjZx?=
 =?utf-8?B?WkNIbDd0Q0piOFVnM1dCY3JJcE9QU29EWUdYZFpVQVVDV1B1cnJ0Q2FZcGhi?=
 =?utf-8?B?WGVMUGYwU1ZldkE0K1pVcm41S0IxZXRGcjAyTmNPcGNEYklRb0VUbmFUNTBx?=
 =?utf-8?B?RFJFcFpkdHFnMmtGK3FDaDlOMnk4VEI1b0E4enI4Mnd0b1Nkc3k0SlZ3MWpw?=
 =?utf-8?B?RThEUy9yUHZ6VTQxb2hLMTNWQVZUUW54cU9UZ1B0K0lBMVRaN1dDSktzcUhX?=
 =?utf-8?Q?i+wsX81wilgbWOjLZtiL5tsGN5KfSAj1hsu0EUo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f75a4f-483c-4952-ff8e-08d90f19940f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 16:27:58.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbqJAnWezA3Ak0XwdJoLpgJJLg5jK7X9Tkt+P3tv2C7WtYbA6HDOgkw145HFb7sLlSELwWTaqKFATHmXDPs26Q3rPC4kZyfrRj090k7CqMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4806
X-OriginatorOrg: citrix.com

On 30/04/2021 16:52, Roger Pau Monne wrote:
> Such helpers is just a wrapper to the existing
> x86_cpu_policies_are_compatible function. This requires building
> policy.c from libx86 on user land also.
>
> No user of the interface introduced.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

