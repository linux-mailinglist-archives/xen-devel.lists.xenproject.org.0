Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190CC347E4F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:56:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101120.193173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6o8-0002hB-16; Wed, 24 Mar 2021 16:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101120.193173; Wed, 24 Mar 2021 16:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6o7-0002gm-TS; Wed, 24 Mar 2021 16:56:35 +0000
Received: by outflank-mailman (input) for mailman id 101120;
 Wed, 24 Mar 2021 16:56:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1/+=IW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lP6o6-0002gh-CO
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:56:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80ba966c-384f-4e93-82da-48e6014adf8f;
 Wed, 24 Mar 2021 16:56:33 +0000 (UTC)
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
X-Inumbo-ID: 80ba966c-384f-4e93-82da-48e6014adf8f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616604993;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=f0zDlUB07BELHZiqmOHgD17Re/pPjdjty+q0GQc01Hk=;
  b=ECIpvPcbL4XfxRRV4CxUVGUY88LKd0mvtJF0cNZb9oXOqIPLke7G3IS+
   GOTqF/zNfar0m+BvmbxMOq3u8WKDfqy/K+atXsYOnuM+ud/Im2P3waE8x
   c604jf+JMrpHud5x7QmpQsbZYrJHDy5Ml0BDUJ+8O5Jo62ftyf5xxZ4Cm
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Yutt9LcTB7wAQMjoslpKkb3EF4rqlGhddL0aHgEDu8rIQwUrfsvQ7Qg39dNaxXctOq3jLj867o
 PssZyU9AUfKbeWDEJ1H6OxpBn6gVPE4RDIPBwKeRhWJX29BzbH1F635h4SNYn314+yeSA+IDbu
 iUtEEsrQ3o+DeNInO9EOcLPj3SqtFz5zCEfbLHdAkc8g3AR/6uOzdmh53igZtn9Z1Y1m9duL/V
 k2qiluAA+05E2M2aVdm5MoOxv/hNGllhPWdS315SuV0AkqxG09wxoPhZgF36GoMgyf6tSPBuey
 OC8=
X-SBRS: 5.2
X-MesageID: 39918200
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:C6em9KH+IUwrWGvXpLqFR5TXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLT1CQYsI1XYfNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQB0g/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcHHOjKf2QoTVC4K/Kc6/Q
 H+4nDEz4iAk9X+8B/T0GfP849b8eGB9vJvDNGB4/JlUQnEpR2vYO1aKsS/lRAz5Nqi8VM71O
 TLyi1QQvhbz1P0UiWLrQD22w/muQxemUPK7VODm3PsrYjYaVsBerJ8rLlUeBfY9EYs1esUuM
 kgshP7xvgneS/opyjz68PFUBtnjCOP0BwfuNUekmBFVs8mYKJRxLZvj399KosKHy7x9ekcYY
 xTJfzbjcwmFW+yU2rUpS1GztCqQx0Ib227a3lHkMmU3z9KpWt+3ksVyecO901whK4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8fl66EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIyz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQPHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9dDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjLQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCH1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Ym31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EZXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EMTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03CtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywNO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xu/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd8BABE7F0f1d/40hzs62a1mEMlCf3JOVJ8WvU1Jcqf42WMfYfB7L
 xJyfYO+c2+PWX6ZoTYleX5bztfJgjSpmDzZecyspxQtb8zsrw2P5Sza0q/6Fh3mDEFaOHznw
 ciZY4+xpbrEIpmZdYTdCJU5UBBrqXEEGIb9ijNRtYjdlQshULBN9yH47D0uaMia3fx0zfYCB
 26yWlh5P/LUCuI6K4CB48xKWpQblIg6H4KxpLKS6TgTCGrffpE5ly0LzuUd6JcUrGMHdwr31
 pHyuDNu++cbCzj3g/M+RN9P6JV6m6iBee/GhiFF+IN09u0Pz238+SXyf/2qDf8Uj2gbUsEwa
 VDaEwLd8xGzgAYs7df6Fn4doXH5mQ/k1Vf5jl7llninqieiV2rbH1uAEn+mZVZXT5aL36Sq9
 /KmNLoj0jA3A==
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="39918200"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl7yrmtN1TQWmQcCg/D0LlQeOrolAiaczI+7LcqKnEM4M+exUbv+uCL73qgYlqm7VPlc4ob36B5tm5OtL3/BbNz8v6T9IWqAWiHav0YHgsayiFr+0HHXP8JAGMm8rb8GRqxGqhpFUHj2rqb+1jyh0do90wBl0Fw6g1gZJ5uIv2PbHHQ9FsdX/NCsIw+11jxOgqNKbNOzyC4JlCZLSSPFzWmpkExtwTQ3v+sUJiqoPbeigpimEXi+3nIjCkwwHNoq6MXW0ahAHf6zOwuxH7CxfmbzVY1d5XUY4bY8LQVSH7KouyVBzZWYUD6pjiODtNEI5mkrWkc1uj6Rzplfah5ScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jZzgQh+z562pkuD6somkr/WUuyuhExMTOPLQPrQ6gQ=;
 b=LkdsXVNRXTcmafv3lUCA5J53PXkbjSdNxpFcnceP5R2tEUhDOuTd84K/lWWIjqEq7GsugVgsLDaghx0uqQE/bOLoMBC/s72OTT4Wk0RMWihHV2POX8J0jY1ZmqJlekebZRWBCInV1/aO1h9mdlvMcwIKabsoA5zW20YNwuDgI8TG1D8Kc8p16iHER6qfpKL++1F4SXZQe20+xH+UJ+IRAxqeY1sUCMQWDf3NpE9Cu761kZ1UsricHyP57oCfbkY/jL1ktcb3RceTtiszc3PBTAzzj+7CbzmjFI3tdsHtNPn5pq0U4N82LQEWU8lrhfc7ipRXXmJ8jkiBiPDiEE2rNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jZzgQh+z562pkuD6somkr/WUuyuhExMTOPLQPrQ6gQ=;
 b=valu5rn5QmzgjTvvc+zzLaeb6pu97v/HB11+/3rOguBgu8m+DabFsxY/y2tPsw4jO9iGdWWb1Ps6VwumWoVJkaAxXwHaoJ3Og8261SR7mGxxaKIemdNn2yebKI0E1Y2UITPjgo2E45o5QpvcO6PAFIMlNySoW5R2XEVNIPcKwNE=
Subject: Re: [PATCH 3/6] CHANGELOG.md: Add dom0 zstd compression support
To: George Dunlap <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-3-george.dunlap@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1b2710e7-6491-2000-c4b3-e29e8ab5ffd2@citrix.com>
Date: Wed, 24 Mar 2021 16:56:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210324164407.302062-3-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0216.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::23) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d56197c-719d-4161-53a0-08d8eee5c485
X-MS-TrafficTypeDiagnostic: BN7PR03MB4387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB43873093F23560B6D4F480FEBA639@BN7PR03MB4387.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5z9Mw4jBgN7Nvo2oCLH6dFZsAZIbHPiDqpDh8O8kJqHSW+dE7F1/NI/RdJCQAA0vDfKQMCt43IyxaUPiK4iC/vEAjz0Pp7IizBEoXIjmzfg4C5W60B4mlr7xC4yFMnDzICFh9IdqxsfC8Ju7Pi7j0ux3xKSk4WTJyLrQ+64KZ1HAydZ3pcs7WO8AJki/b2HyfgQzK29QFk9Y5yUWCqar7ZLAoUwOTZUIW4Sjxxfv7B7BTxb18gQArdpKSOm8mL7r3xQsJBumbzqMt4aK/CG3JvKebCOO1T6tvZXo8oTQgBqpSOIh4anIJ2RWGn7WsyVrXsgEcUCm+cbG2W9bEQDNLY2KsUs5bsWY0wW0ldkisAeV5PUj76WrHBSToXo9hDX4WGWSUQlykrU/dcu6OgmZSOp4jN1hBVSIPv/8ymBSUSSMVN/alJKpR4lcOz433Q3EYY5NiLvNxT+Pz5xrXqTNeFiUU8Fe15HY6qEMNmMhYhKydkMFuEDqVNbg8wDW31j3tmaODTS66hQO2q0LO9qD3y8PSv8ewj/eOk6+tfo1jh8hG4ZT4FvoSsLJXSYZ3IQ15YdORtbRLVIrH4CRVvSpHbx8mA3aSU6iEQsV1Fevy3esRCapmLDysI9AZ4XP7sRaPftbclHavhSXrl5+EjzFElPQBbye3C2X8iJyVJ26MFhFz20kYCBz1SNMRZqePOf1zHB5JssjKtK2X/sMVM3wFEJlL/vNKhsmllOGMLjqgEpdFeVouyo9dtC98y1EmfulEXwyFDApRA9YXfVhjL758H1a9jouE2vftHIn19yozhP6CpA7rdF5EYW23WvuC8IrDM4eGWX9WnAwqIXAlH5Z+rwallM61/RKXVX5JSVDSTKM86fyL02jMEqaGd6CQrjy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(956004)(53546011)(2616005)(66556008)(66476007)(66946007)(86362001)(31686004)(38100700001)(6666004)(36756003)(4326008)(31696002)(8676002)(5660300002)(2906002)(107886003)(4744005)(8936002)(316002)(16576012)(478600001)(6486002)(186003)(26005)(16526019)(54906003)(59356011)(207903002)(219803003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eFVSTlgwckZlVVFTdUZYV0pVY25JK1dudUU5QUZjTnBreU94SENabGgzZno4?=
 =?utf-8?B?T2lCSURRMU1NdzlYSTI4TFJFV29Ob1Rmc2pjbnREOTFpQ0dHNFdJUkR5eEhO?=
 =?utf-8?B?MU9xVGVzNjJqZGJhY0pEaVpwZVppaDJOUHVWTkpsbzdKRUZBenNPR0VQR0dk?=
 =?utf-8?B?aC9kRmNJWWhwbVhXVWN1OXFweFVMaHZhZjl1aVlsUEVrUzhBaFd2QkdQdHAw?=
 =?utf-8?B?dGVlOUpabTUwSmVET2ZYUTFpenY5NEpSbzJReW5EeDRLOGtuS3RIUjBRUCs5?=
 =?utf-8?B?WjcyMmN5V1VyUE9hVmJPOUJRcnRxZFZjRDh5TTdXZ0wzVXdCQzRiUXN0ejdI?=
 =?utf-8?B?RXZJSm5ma1NjOStRTXdqTVVHZ0JLMkxmcm1rK2RRNjQ5cGxFc1RKU3JyOTlJ?=
 =?utf-8?B?R0x2R1o2RVBHdjdoUmM1TFZXdGI1dzNMMG5EM015a2xJOHYrQ0JHRW5uYWZj?=
 =?utf-8?B?NmdxWG5YemM2SGlLeXBxSjlIdU9uWXBHYURrOUJyS0V0bVRxcWd4NXNieU93?=
 =?utf-8?B?Zi9DbVcyMFJKWktNQWlkWk5TQ1hUcEFUZnRZQndUdVEzNGszU0F1ck55b2Jl?=
 =?utf-8?B?SngvMDhzV2pQMG5ibXhiTW56UmhtTk5JOTdmdUY5ZHc0d2I1NTVqOVdHZWFo?=
 =?utf-8?B?VVY3RURTdWZDeEdDemFvUit0dGp1eGhxUGpsMDBUcGFFNnNJdWJtbkNaY1Uz?=
 =?utf-8?B?R2ZEVkdoQ3ZNUExwV0pnT1pLaXZ1SVcrYnh4eVU1K2t1clBpaEdqYzZZRmJY?=
 =?utf-8?B?MWtOdzUrV1RHZEdTb3RXQ0JHMVUyR2REQy83NlV5Rk40eXFJNStRcWorVTM4?=
 =?utf-8?B?R0xJcnZWdVFrMCtmTzhSODVxSWlQT3RvcU9GRFhDVmJJNUhRUFNqa1N5ZElU?=
 =?utf-8?B?ekY3TVZ3TktMQWwxWmhPbXVOS3ZDMUVXM2Vady9McUVhL0pRemV5WjdaL3o2?=
 =?utf-8?B?YlNjQ2NsM2pYUjFadGlIZ2ZOTU9YbDczd2RMd3NGWlVFamlscVhMdFhyYmhR?=
 =?utf-8?B?dUxUQWtHZDhhaE8rL1VPZ09peWtUZ2twd1VLNVlYZ1VXcmUxeFptUDdRMVpx?=
 =?utf-8?B?UkhHS1FnSEZtVlZKQlhZejlKSHZNM2IzTGlabW43Q2tNZE1TcGF1VmNpSkZq?=
 =?utf-8?B?b2dIWExEYkNYVkZCQlJjcEtNc284Sm1ZcmlsWFN0RFI4YS9nNHRJWklncFRV?=
 =?utf-8?B?aE0wVEVNay9IM1lDb29mOGg4aG11UTVnZ3IvRHFIeU51aXlDUzdNeE9ycm9C?=
 =?utf-8?B?SVh1STRpVE9OWDhQTldzb3BLd2JnOTdEVFpJazhSVmRuR2dLOGdLWE1YaEpX?=
 =?utf-8?B?SHRYQ0QrNW54dGc3dzdDREZRUjdtamdIQ2M5YWdtSG1oek9TczRLdDU3MWE5?=
 =?utf-8?B?b0wwYktqUGpoNmpzdWFlWlR0WHpGdjVTSHY4b0dwWGNZc0oxZWp6RzFaMjdx?=
 =?utf-8?B?VXVCbHQ5ZDJXWmlhbmljSFducnNqYWprTDdHdno4bFlaRFlOeitTVWJDbjhs?=
 =?utf-8?B?NXkyYlBaUTkzcU5lMVVRdUtIRERsWWRHQUpaeDBCdWVKU0grajRaeXlndHNx?=
 =?utf-8?B?QnI2UTlOekpkbVg5M21SMGJqRTNuQXYxei84TWFyb2VKVkNPYzlOTlVBZDYy?=
 =?utf-8?B?Kzkrb1dISkMyVXJBd0FLWmF5a0ZPNWJtZTZlOElSdW02cFZnemNuUWREV0ti?=
 =?utf-8?B?SVZJdjdROTBGZnZTejloc3JtVXBkc2M2TG9GZElqWUpJa0hmYWtGTDVlUVNr?=
 =?utf-8?Q?VgF1BowQeerfxu1VLL8kG8u08HM2BhwAFbyUHJb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d56197c-719d-4161-53a0-08d8eee5c485
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 16:56:28.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +g0c5IgCZY8PpNULJU6YCE0iEmBsM+Zgq/AlJ4wg+8RhmSoJup+sFmJexQle4VVJP2oAR7gAm9mwKF5IXJpxHnwgZe8FGRI9FSUMkCgptQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4387
X-OriginatorOrg: citrix.com

On 24/03/2021 16:44, George Dunlap wrote:
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> ---
>  CHANGELOG.md | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8c89212f14..354f213e81 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - ARM SMMUv3 (Tech Preview)
>   - Intel Processor Trace support (Tech Preview)
>   - Named PCI devices for xl/libxl
> + - Support for zstd-compressed dom0 kernels

All kernels, I think?

The support for domU went in separately to support for dom0, but both
are present now.

Talking of, I don't recall a patch to the README package list or to the
CI containers, so I bet domU support is untested right now...

~Andrew

