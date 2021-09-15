Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C25740C417
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 13:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187496.336375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSjB-0002ME-Qj; Wed, 15 Sep 2021 11:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187496.336375; Wed, 15 Sep 2021 11:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSjB-0002KO-NW; Wed, 15 Sep 2021 11:05:21 +0000
Received: by outflank-mailman (input) for mailman id 187496;
 Wed, 15 Sep 2021 11:05:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FsSg=OF=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mQSjA-0002KH-CT
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 11:05:20 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e4d5784-787e-4d0c-80b7-682dde088413;
 Wed, 15 Sep 2021 11:05:19 +0000 (UTC)
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
X-Inumbo-ID: 4e4d5784-787e-4d0c-80b7-682dde088413
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631703918;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PSimCOqPBV3WkzV1SpJJGf/2wNBZRc8NQJZZe89DJIA=;
  b=FVCUWYDuKHmN+NmL6J8oI0h5OMWuYl/Fs7fyA590ukwxYUVEqJAXXiY6
   N3EP5ahgFzMm/pUQn3NTFozmKWur48fhSjmBIXxLuu5/a4Ss3Ydi7LO3s
   /X63diR2QE+vYCmAG42Fv8od4ldM/SsvfpO609iFgnUWFVrcNbFio9bDg
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bPfa+JX68P+FQ2i+8rREjHkiLeAGj/D0W/9qsgX/O4jKf8u8jZ9boBcJT53wnlyPeI6h8TUQ9Q
 FAedE4oj1iyR6vIbLZ6Bteqijxq25QBVKpHP4LnYVYzBfqqIr6GFJZZV2Tgvo8JWkwgisWuU0X
 0OsDjrFgvZpWi6lJwK20vKNsIQlho4ToytJWzin7nKt9JhyHEpv0WA8NMKjQqzwhBw4HQMG6it
 PaP8IHmgrppdTz5ts2Xxr/8f1L4+BAAQGR2DM65RuYg73d9P/Ih1oOvXdFs6dxMs2dOvRr8cDP
 QqsGrZTSqiWgwMnJru8IsWXf
X-SBRS: 5.1
X-MesageID: 54540432
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YnX5561TGKDvjAMT/vbD5QJ2kn2cJEfYwER7XKvMYLTBsI5bpzxTy
 jBLXzuFO6veMGejedFwOouz8RhS7MfTn9I2SwNppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywrNh2eaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhueh01
 P9vsbiJZywEZYnsh9YGdUl4HHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t2p0SRaqFP
 aL1bxJ3TxH8cjBMO20vGc0Fpe6nuHr8XQRh/Qf9Sa0fvDGIkV0ZPKLWGNvKePSaSMNNhEGaq
 2nauWPjDXkyNtaS1D6E+XKEnfLUkGXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGsqwa5EGtCN7nUHWFTGWs50BGHYAKSqtjtV/LmvG8Dxul6nYsaAZEdPYEsOsPaxcHj
 XupgOHyI2xPv+jAIZ6CzYt4vQ9eKABMczRbOH5bElVcizXwiNps1UOUF76PBIbw14esSG+qm
 1hmuQBj3+17sCId60msEbkraRqXr57VR0Ye4gzNVwpJBSsoOdb4O+REBbXdhMuszbp1rHHa5
 xDoeODEtYji6K1hcgTXHo3h+5nzu5643MX02wIHInXY323FF4SfkWVsDNdWfhYB3iEsImSBX
 aMukVkJuM870IWCNPcqC25ONyja5fe5Tom0PhwlRvFPfoJwZGe6ENJGPBXLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgvuqWXTkk3PPUy2PyXOF9/o8TKmM4gE0U9ziF6Jq
 o0Oa5TTkEw3vS+XSnC/zLP/5GsidBATLZv3t9ZWZqiEJA9nE3smEPjf3fUqfIkNokifvrugE
 qiVVhAKxVzhq2fALAnWOHlvZKm2BcR0rG4hPDxqNlGtgiBxbYGq5aYZVp02Ybh4q7Azka8qF
 6EIK5eaH/BCajXb4DBBP5Pzm5NvKUawjgWUMiv7PDVmJ8x8RxbE88PPdxf08HVcFTK+sMYz+
 uXy1g7STZcZaR5lCcLaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODE5B9+fXooIz/N3Yvoy+rt+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmwP5s59broLMGnA1oEG+SMgauA7JkZHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBSo7SB6y7OLTEFOMkTekydaNrZ0bNsoz
 OpJVBT6MOBjZs7G6uq7sx0=
IronPort-HdrOrdr: A9a23:aM3cfKytOG+1TWofyA9kKrPxMegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBTpTlEAtj3fZquz+8B3WBxB8bhYOCCggeVxe5ZnPXf6hHbMxTk8ORQz7
 1tfsFFeYbN5DRB/L3HCUyDYqUdKbq8geWVbIXlvgZQpGhRAskOgXYbe2TrazwPeORfP/oE/d
 inl7p6TlKbCDMqh6+AdwQ4tp341qL2feXdEGI77nAcmXOzZAeTmfjHOind8gYVVjtOxbs40G
 7ejgD13KWstPmn1gTRzSv2445NkNXs88BEDsCXkMQZQw+c7zqAVcBMSreGtDAwrPqO7E8wkN
 7Qix08P8J1gkmhGF2dkF/AygPk2DYr52TDzUaCgXz/hMTlSDUxG6N69OVkWyqcx1srudl91K
 5R5nmepopzBQ7Nmy7sjuK4My2C23DE/UbLXoYo/jxieLpbTIUUgZ0U/UtTHptFNCXm6Lo/GO
 0rN83Y7OY+SyLUU5iM1FMP/PWcGlAIWjuWSEkLvcKYlxJMmmpi8kcezMsD2l8d6ZMUUfB/lr
 H5G5UtsIsLYt4dbKp7CutEa9CwEHbxTRXFN3/XCUj7FZsAJ2nGp/fMkecIDdmRCcg1JaYJ6c
 T8uRJjxD8PknvVeJOzNUhwg0PwqGbUZ0Wg9igR3ek8y+rBrHyCC1zbdLlkqbrVnxwlOLySZx
 5oUKgmW8MLZVGebrqh/zeOAaW6ekNuDfH8TL4AKhOzSvyiEPyhigQtGMyjaoYFVwxUBV8XJ0
 FzHwQbFf8wo3xDAEWIySQ5c0mdMXDCwQ==
X-IronPort-AV: E=Sophos;i="5.85,295,1624334400"; 
   d="scan'208";a="54540432"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWMVBjbAbJZS3ZN+bq/y5Ae9tRp9TUMySIsBeDe8GCPKPToz505yNU7zmMlUXYhGGwLTIjrifND/YmlaF/szM1O5SL3qdKVmSCpW7gMH1V4NfzIGwzE4fYV5D2BoOeDGFlXbcTibZx6Epcr6/piOSK91SzJVEH8345nWTAnE7iT9xzufZz5pnCUbgBcS5/9h1onOSotYKBK+Q9tx5cBKW6hZQDMijicw1Pu2qe1r/1QnGRaYa2Kqdmdbzqg12eX/s12Gp7WbZYgueOZ8anhhK6t/TW8HxOtGMGLOhyQDTbCQUbPkIfC50/00A28hiBLhWrHqOYryY2BYSTrrg7xs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/8NYyk/vjXp+GbEJC9szBDZ+NqHZduKItzBrrbkmeJo=;
 b=GQgfk3EPRVwDfgbEVAdT9QCoBzk1tSs2pyDUZF38r36CN/J7k7pRFkZQqI1qqhruOgVO7kmjjTP6dZ/LivJMO0uIrwZ1Ahp5/SoF50H9wRVT5T+mYLa+7pfpz9gHzPcjAJR3qKR7WAYdK52HC+MD1kJ0poToLP3CsInEa41wR3lt4+x5BU81QUtTjC4hzHh3s3l5gX2TLE3r148JH7X8oH+sMuqNfzIAUdZtpQewFpc/5VkfN8L/0UeNydtc/2zpN+secfAl1E0OdMdxwnp9z2FPk3LxbojTOwkTpzDLPSAgC1Kd8/JWcmrb6Ht5kXEHkdVkLYO+sSb/Grao1+wH7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8NYyk/vjXp+GbEJC9szBDZ+NqHZduKItzBrrbkmeJo=;
 b=Jari9oYXafIBMr0UF9QlF9vYcS3zBxTASORD7t998iza0+tGxYEG9TjqvWcpJb079RbbfGInsCmUWQnj+vcXEIFjoqxFnumk00PGvhShhtVQTP3e3++iIzBpfixJJjLhBya69bSfU4JbIf8DJf5LjfRs/Hcaj+xr/w2D3n6imD8=
To: Jan Beulich <jbeulich@suse.com>, Kevin Stefanov
	<kevin.stefanov@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210914164323.14904-1-kevin.stefanov@citrix.com>
 <f5a68380-16f1-5383-5cfa-85a9e02ccf8d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] tools/libxl: Correctly align the ACPI tables
Message-ID: <fb7c68c5-3fe0-7e61-fc9e-829345d471b3@citrix.com>
Date: Wed, 15 Sep 2021 12:05:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f5a68380-16f1-5383-5cfa-85a9e02ccf8d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84c8ec89-653b-45a3-9e63-08d97838b182
X-MS-TrafficTypeDiagnostic: BY5PR03MB5345:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB53452BCDD4D984277A851A7EBADB9@BY5PR03MB5345.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 57RREdzM6Zeg/nzp0/34hmey2XbdeBFB2oXC3bNcaI7v0+3SN5tDdvq7nu07Pa/mILSrzb4jCveX5TrC9+MBmit/oAAEswYWZcQ2sD6vWQxNdpz989iO5kYPKh0XuE8g/H1nMXOj7IaNEka7rw7XExdqskUqWi9LdSFF/O76zwbUCgQ6LKhfQf7upogjhinccw+CVueNAxUNBNjHR1LwLcsf4OemLvQ9CNq8tUqIEu/pIKQBDwX/CRalxDA6Pe+TaXkOxWY5OzCqRAqWaqSZ3BacVF09GrqHsp3ffpdvDOUPAnKej7W3AsI9ILIFDwRMPojxbM/Opc8ITVBpN39gFoaxJd1P0Fn8ip89QRBiYBRvyP805OTXFFA4oM44Gajtb3Hp4AlrNt2yMpWVZz3GzZwRDhPoOk9yLCaUV2B2bPebzz/vYs6xf4Ev49/Cs60hxh786xUrJlyGp4qv/YvNaddzA41FdrVDdOMSgtCALOiT6eaAz8RGZ/1Y+uxGFyVuMOisTdSN4vM/d3DUFqc8k2Cw54JHWah7PTx3qf5e9mQTx4++zWAulX1Jxu+DRHebbnkdQYAuCi51OSlHS2ddkKolS+u7cUh7e9q8jxNXfKLeVOOqQzFDcExM9g2Gmx9M3f/ij/yVp4tCeGh3KS/TgOcXXydMxY1P4GC8NTrJNqm4DFbRVzPglIb1y60//XtpXrLXebVG0yNaV2MvJTbW9k6AWwK+wtKa+7AlCvAcaHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(16576012)(316002)(31686004)(36756003)(54906003)(110136005)(31696002)(4326008)(86362001)(5660300002)(478600001)(6636002)(6666004)(2906002)(66476007)(55236004)(4744005)(66946007)(66556008)(6486002)(956004)(2616005)(26005)(8676002)(186003)(8936002)(38100700002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHh2VXNmVlhBK3Z0dCtFMDV6YXdjelRwMlN1VW0zVm9salpwVlJsOE1RUmlW?=
 =?utf-8?B?bEh4Lzk5c0VGSXV1WHpaY2lVK2JxM1FDa1NGQjNPOWpsTks2d1ZNWkV6bGlF?=
 =?utf-8?B?ZGFGQlVERERQQ1pTbGIvZ1dpNm05YlpDQXhFb0Q3Y25FYXZHSjlQOC9scklv?=
 =?utf-8?B?L0JaYjhGYS9EN3NMUXBHeHN5TDVyQjg0bXNTL3NKNXVwQkNxSGJUWFJTb001?=
 =?utf-8?B?VGtBUUErT2RPVlRTWHhUbC9YWGh6dmtwWUJkNU1sZFFmTmZQM0RYYm1BMTA5?=
 =?utf-8?B?Snc0aFlGVHFtSkZXcVU2L1paMFliTXhvN0RMMS9rcVBTTDBrck8yTDd1ZGNu?=
 =?utf-8?B?cEFCL0FhaFFuaVpzeDg4TkU4Zy80aTNLMGhWVTlrQko2NDNtMm13SWIxTmlY?=
 =?utf-8?B?R0Vmd0FzS0dUKzJ4QnpYZ2V2Wi9xcFpkbnhCNFdUTjJ2OVlGRWd5VnQ0Z3dy?=
 =?utf-8?B?VUhkdnhJaHFaNEQzVVE5d2d5MUZGQWVFWkQ0QngxM0Y4dmhFakhBOUtiY2Ju?=
 =?utf-8?B?TWVQWVNjcWxQVDRDQ0RwSmx6Um1vWE9HbHVibEEyUE1MVHdUbjdMK0hmWmJz?=
 =?utf-8?B?WERrejh0KzRnZmRucFVEREJreVMvQ0luM2NZVGRPRHBXRnFrV3RBV1BhV0ZV?=
 =?utf-8?B?NGN3UUd5cHZhYkcwTXJab29SOUZ1MVRrQlZHeHFtMUo5SE1aR2h0TTVwdlli?=
 =?utf-8?B?ZFJPUTFxaVZ6bzZYbDBLMzdVeFVyZEtjTEF4OWU5LzVlaFNLeUtyL3RaRnM2?=
 =?utf-8?B?cUNPajhhRGFiSEltYmJpemRCOEF0eUJhY25IM0hsaVN3UzRob3B5bVN1dmo4?=
 =?utf-8?B?MVBVTm5JNnFNLytCcVRzUTF1eEJLNysxd2k0VWFDR1F4ZU5QUjZsc2kyZFdq?=
 =?utf-8?B?VFJvSlhyZlE0RXJrNW8wS3docEkrcHU2Ykp3Z3BiSzIwc29QZGxmbFJPanRU?=
 =?utf-8?B?SWFQV2FWMDcycmVYN2JLTUhRcHFudmNYT2ZKT0RkeUhiRjh2UHFsVHBJQjho?=
 =?utf-8?B?N1NZWFltcWFFbWJJQnlRRjJvRzBaQnNsV1pVamV0UjBybTR4Vk5tT1NDRUUz?=
 =?utf-8?B?QkZCUEVkVVRZRmZsSkZ4SE5hU1JsZE9VRVB2eTJXRXZDaSsxdEMyRnRJSkJB?=
 =?utf-8?B?ZHRGbWNBMytCcEFsdHArUUNqRmlCT2hDZFlIejJBcFBpeFdMTnFOcjJEMmo3?=
 =?utf-8?B?eFRHQTJ0QVJicFQrRkl3ejFRL1Y1RTFMME5OTHNUeEFGaXZBNjBlWVAvaXdP?=
 =?utf-8?B?ZEZ5UEJCMHZzNzhtWk8welBjTXFXMjRWTXl1Qko0Y1RDeVIyalg5Tk54Vzla?=
 =?utf-8?B?R0lWNjVtMENQeTZ6aXBGZm9aTFNWSmxHdWZ5dExWRkJ2N1RnemFqdVk4c0xz?=
 =?utf-8?B?SkRMNnFZemhEcm9YQlozZ0V3RXFmelNBaVd0QXdNc1FaZzRtb2FBMURPUkY2?=
 =?utf-8?B?WTZ3UU1EVWZUQUVDMmZMUEU0ZnUzMlU2UVdrUXFtSXhQcC9IVER5OTVubVk1?=
 =?utf-8?B?SEs2bjAyUlBVZVJSNERqNjRhOEtvTGc2TXJpWlE5c3B4eEZraFVDS3F4Q2lm?=
 =?utf-8?B?cmJxZlVNdDVZM0ZXZFo0bHk2RDRNcm56VC9RWEhXZDk4R1lKR3ZLMXh2azZq?=
 =?utf-8?B?cDc1dHJkUDBCQjdCd2JMNVlBTXUyMWl6dFprbTZNYW01K0JGK2g2ckhHV0NJ?=
 =?utf-8?B?MzhpUnZuSzJaUUxWd3VxbGpqdC9CbEg0b3JUVGY1M210WWY4RXNrbFZCam1Q?=
 =?utf-8?Q?2l701FE8p5NzXSnCqAOv71sbuW0bDRVEfKvWc8j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c8ec89-653b-45a3-9e63-08d97838b182
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 11:05:14.2544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3Dxidzncesm9H6JV58QfKMaHqGKaBqEerXvFLPmy+ss4Pn50/1F0yw0K/eeykBPqA03c8a8D1Pi+cURE+tmJ7ia3rDlU6Bf4eUMg9CvKMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5345
X-OriginatorOrg: citrix.com

On 15/09/2021 10:30, Jan Beulich wrote:
> On 14.09.2021 18:43, Kevin Stefanov wrote:
>> --- a/tools/libs/light/libxl_x86_acpi.c
>> +++ b/tools/libs/light/libxl_x86_acpi.c
>> @@ -20,6 +20,7 @@
>> =20
>>   /* Number of pages holding ACPI tables */
>>  #define NUM_ACPI_PAGES 16
>> +#define ALIGN(p, a) (((p) + ((a) - 1)) & ~((a) - 1))
> Wouldn't this better live in xen-tools/libs.h?

In this case, not really.=C2=A0 That file doesn't exist on all versions thi=
s
bugfix needs backporting to, and there is an unknown chance of collision
in older trees.

This would be a whole lot easier if ROUNDUP() wasn't in a dubious state...

~Andrew


