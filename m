Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04437599A
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 19:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123664.233296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lei1c-0006g6-6d; Thu, 06 May 2021 17:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123664.233296; Thu, 06 May 2021 17:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lei1c-0006dO-33; Thu, 06 May 2021 17:43:00 +0000
Received: by outflank-mailman (input) for mailman id 123664;
 Thu, 06 May 2021 17:42:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YkD6=KB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lei1a-0006dH-7h
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 17:42:58 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a1d6d50-e5fe-4c22-8764-1cc99a18ffaa;
 Thu, 06 May 2021 17:42:56 +0000 (UTC)
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
X-Inumbo-ID: 5a1d6d50-e5fe-4c22-8764-1cc99a18ffaa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620322976;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=f9RWOyGzduxpQPt3HwpkryFrUOgR0rHocQ9KV7zROqw=;
  b=NedX9teQWs0d2uRn0Uua/lpX6YXf2S0MRSyyuuzxPuKWssuNLSm0bqKX
   J0V8drFl4BgS+I35j1pIJLp0LiLUMcbCK+y3kddGkjq0HLrRie8dOGe0B
   v8F16pX+SBBp/NYuZapKgw/sCALoQPTlI9XkS2HI7v0azAB1wsru98UoE
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: c/vF+ohYXDIAvKFNcvcGEQed8/lB2ob/taLJPi9hxrwMjlj22D6+BHuWCBsUX5YhxWv9sR9ZBT
 XHy7VmV51VM5CaDZG8mNELOZG+JkScuMsku4McVINqQX7NOuY2O2d55W75NsHtI/GqBV/fbdpy
 VQvLkmMoentzkbbrndIOhkcKe6TOjeFBhJTlHeTatzP6+paPjwSNp+fLUPBozAC1WMjFMPlavO
 m7Xfpjf7nPlkcUU07kFIgj51KvPiEv5uhP9/A/TRJI3Zk+kjLySla0ljQjKgoTqfA9RTYAruPw
 LuU=
X-SBRS: 5.1
X-MesageID: 43626351
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IfvvwKmIUO+HuxcYuIRjurwoySTpDfMEimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdG9qADnhOVICO4qTP2ftWjdySCVxeRZgbcKrAeQfxEWmtQ96U
 4kSdkGNDSSNyk2sS+Z2njeLz9I+rDun86VbKXlvhFQpGpRGsJdBnJCe2Om+zpNNWt77PQCdK
 a0145inX6NaH4XZsO0Cj0uRO7YveDGk5rgfFovGwMnwBPmt0Lm1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym7o6YhMkteJ8KoMOCXMsLlVFtzfsHfqWG1TYczBgNnzmpDr1L8eqq
 iNn/7nBbU215qeRBDznfKn4Xib7N9n0Q6e9bbfuwqunSWxfkNHN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3am/a/hGrDvBnZMZq59ls5Wfa/psVFZbl/1XwKqUKuZ0IMve0vFuLA
 BDNrCs2B9mSyLpU5mChBgQ/DWFZAVCIv6peDl8hvCo
X-IronPort-AV: E=Sophos;i="5.82,278,1613451600"; 
   d="scan'208";a="43626351"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2MnDBwxG9EMwTaneE4sNqUq4nfakw8hyNN50Z29JKQ7kLp5ArD7dVpQ1uvelBkj8KuDM7IQoBbgyGKbIDP9mktpmiE9ftEyIY0wxuxCKsK0UmOM7rsi/j3pFOiA9Ju+bNRHbjdeO67Hsgc5TQoK0VNGKIqqX1wxCMupsnxPdoRUfhHV/ZqvgJFbU0zBTYvOLKibxKMOGSrfrenyrlg9rJd2YEv9QG4MFPReRQBsz/sXGOXbKdLD1IDHkBXiDMfS2rovkYVukTESe0SG/IzDDKZhPmR2m5wGg+N+uFXpQ3ZqGxec1pC1tCcOHc9FgGLLeElKl2avZLDRSMk1TvGkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9RWOyGzduxpQPt3HwpkryFrUOgR0rHocQ9KV7zROqw=;
 b=lT22mFLcTwuIpNFd1nU8+DwrCWLAxoTyfkkyvjqdx90NiyEFbJznUtxz3QDNRwF/Xg6a0KoBZedEfNd3J1Kf8w25Dask1hSD9Jvq0/HiQhHfwAwYOnOu2JuK8uQvoHDJ4tibsF0XD/dVD7mg+7QVjn59TkYKjjUVyac9lZr9Y5v/7rAgqpemZgYx/GrRXuTVeffSjkeSMkXT73fsE4qvI+wQCGAZWTiNcHbRKOw6fZr7Cpm3IEtMLbKYMW+MKrw8/mNPvKr3pbO9NkKJaDBVlF3TtjqDCHxUrpaIvAJZTqEQ6zwq1AD+enRhy4HUdflwmpPNjrMGUv3cd/zetx4hQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9RWOyGzduxpQPt3HwpkryFrUOgR0rHocQ9KV7zROqw=;
 b=kiYAKbDWNJxAM1WmwcvgDVY9iOadZSjn6pYnCrM0xm6C4sK/kuayXv272ftyqupr3zM2cWGqJx+CCHM3ug8Gcq6HEeFrdBpalfuTlTb9j2SVjhms2f/1hqY9Tg2+Evn2SJfqx2LrAQJywrK4Na5HqQGIa1N+iQ4arWEO+QOmU94=
Subject: Re: [PATCH v2] tools: fix incorrect suggestions for XENCONSOLED_TRACE
 on BSD
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210506151701.1343-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <77615b8f-6565-beea-4f23-8a2d81619bec@citrix.com>
Date: Thu, 6 May 2021 18:42:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210506151701.1343-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0305.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bee45c31-0c4f-4aa1-6787-08d910b65f01
X-MS-TrafficTypeDiagnostic: BYAPR03MB3861:
X-Microsoft-Antispam-PRVS: <BYAPR03MB38615A4544661CE11068B1E7BA589@BYAPR03MB3861.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U2IKpmRhaFzEad3gPXnsaNSqujCgFXbLflnivjBEdXd8gPogCTVRO1JP5SKInEHv+k47cmUjQ8MPML4fbxioEYrpkWcMOyKxGD27t0DM6hYehXbdwwSJIJu649T0GLLcVKg77kRzHJ/uqCpMHsHv1Rl2ywqHArIag/UqLN8x2Zfx7755G3NXvItdoFwHcwMvw/Cw55btTw4SNyo0oilL36R3GgrTkl2NFHc+KZEX3VJFC4IE/cbKNbVEVd9JzaeIo1fftcR66YYoVQv2Nlt7rGRi+ZMMRXzw+qx6dgxVjE9H9XsZSdBYq/IHAuWVwJRAeTLnpHBMGFaWm3nrb5ZdZw08CKffz2BdWs1SA1Ve4ls7CoifgG7pbAkp1rqd6dFcaoiB3o0chbeCcEwnENHghtdBHx6umSz7rQCgNxv3MG6peXO5QHP7/nMLsbKJWBdsfiegs6Sy9gfUCjg3tO2DrBmbaRM2sSeTrucpt+la165sdl6tvodODMNJFoM+rYi+R0zOlwl48+GEvsleGQL3GKklvFI+5dkT+lIqJwu9XD7FXgnrIKk1xVFemQHAZd/ruNn+SUcItschEXKwyJyC15eIHPPvME/r1AAkbgyqg2DUrx+c5X/FxRm7W1vooAVxNrxbebqpj70Tr4fRP/zwelxrAqRgieXLajPNWoaBc3bVW4DED1WshKItfrdUd+2q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(66556008)(66476007)(66946007)(31686004)(2906002)(86362001)(316002)(4326008)(54906003)(31696002)(36756003)(5660300002)(956004)(2616005)(6666004)(478600001)(8936002)(53546011)(8676002)(16526019)(38100700002)(26005)(6486002)(558084003)(186003)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDJSRUhweVV3ZHJodU5ON0dPMGZ3U1BNQzNDZVNjWjhqeG5PYUMrNURLR0F2?=
 =?utf-8?B?cVVyS0NqSWJEc21ZSVo2K2ZvQTVqb3gzanVPNERBU01UeUZpeHRoQ0w3TFBw?=
 =?utf-8?B?U0pPREpMSUVDdGpEcXliSy9zd3laNDdNTnczVDRXSTl2eENsOGtPRWk1VmVM?=
 =?utf-8?B?SEhUdWowYlA1NmppMHhGciswQkcvaG9tUCs3a2JOWEE4aVRCZ1pNZFhwUDhn?=
 =?utf-8?B?U3REY1IzSEQxM2J2U09La25qeU45YWFlUlZxUGhtOWw2T1JRTmZMbWpEWG1V?=
 =?utf-8?B?WkVvR3NraFA4dmI2TmNKSVBud2JUL2E2MysrSFRZQzZrMlBZRi80bXE0QjM4?=
 =?utf-8?B?L3o3MUp2ODVlMXlVTnA2dlA0VUcvRSt4S2ZwTzk0TFNzcUxzeWJOUjFibm8z?=
 =?utf-8?B?TncyTFpNOEE2K2x4OTMxOE84TTB5NVBrMi8rMUFTVXE5UnJyZzAvOVd2YjRq?=
 =?utf-8?B?cEVvWlVVMllFQnhTdlhOTnRkckJVQnlzOG1XWmt1NWlOTjI5Ykt2S3JMUzll?=
 =?utf-8?B?cU01a2RUY2tVUFlZNzdKSTlNSlVaVThsR0hwZTlDNmE4cy8ycXRXRVJ3ZWdE?=
 =?utf-8?B?emNoSXVzUCt5dVVxZHgwTG5ObHFqVnhld2lZWGR3ZDEra2FyU1ZuVThqZko2?=
 =?utf-8?B?MWpJSlJjeVI0c2JnRldtRWIyN2lqSUtrNDhDTVd1WFR1VjJNVzZMSUV3YVdY?=
 =?utf-8?B?LzBkSkkrQVh4OTV4ZUlFTlNBMTd6UWxBeFQvbzRtMzlPNlZseEkrSlZESmwy?=
 =?utf-8?B?ZkFIbnRQdVNpS2xwbGpRVVVjRCtneGFtam9oRy9qNThDVHROVXFMWXdSQ1pz?=
 =?utf-8?B?Q1ZCRTJsOUF3bzhRZmF2Vjk2cWw2eGY5WXhUTDZ5N1V6WGZLV283ckgrb0xy?=
 =?utf-8?B?eFM5Y2tmOExINWdVQ3hsUjYvYmt5aTQwUlNUQmNhVHJETGxSdkt1Nk9qcVZK?=
 =?utf-8?B?RWxoNzNxYlZTUW5vTGVWbkJHWkUvdXJGZjhNQUcyemZlSjdmYk5wVm5iMXZQ?=
 =?utf-8?B?dWEzcTZCTUpLREwvejZ5VVBQakdNdjR0MTE3VmRpdVlpZ3R2ejN2VElWbFRv?=
 =?utf-8?B?YjR6UThWaGtCSUh4dmwzYU9INCt3WVRFaE96Z2Y4RCsyOFhCWHVIY0pWL3Nh?=
 =?utf-8?B?Yndoa2F3V2Q3cVRXekhhNnVvRlNRUC9QbnhmbmJEd3FrdjcvZFNsdmpFNkJK?=
 =?utf-8?B?aS8vaW0zbDNDOXQ1RGZWek5zNStGamNLZmlhdTIxMzFad3hXemY4aktwV2xJ?=
 =?utf-8?B?S1VVZnZOREZkTklvRU9WRGVYYm9BeTFYZEFGd1J6VUhJVVFKUUJnY1FIRi94?=
 =?utf-8?B?ZTVWMjZQNDhvT21EdE5vMEdsVFo4YWhUQXgvTi9pa0JmUkZnRlRBY0dKVjJm?=
 =?utf-8?B?WlpMZGV0K3gzbG53UjZISU9KYUFzMjI1aVlwZzY0TVVRSHZDcUFJcHZmNGlE?=
 =?utf-8?B?ZW0wQkFvSnE4R0ZCeHlPdlBwUlhNVndRWWhhUUhxeTRObTNZeWVHSlNVUmU4?=
 =?utf-8?B?T0tjYnVmSnVvNksrUDBnS0JleHFybjJwMktucERSemRkZVNJM3UwQ2JNTWxn?=
 =?utf-8?B?djNMSGNpU3MyODd1YUk2UUMwa2IwZC8rKzJnL042b3p4MkZ1TVZkejM3ZlpV?=
 =?utf-8?B?NHloaTZHWnJSaDdQU3ZZclJVdnRtS1JYYVFKNXkyTDI4elBjMDhaTFNDc3Zt?=
 =?utf-8?B?NS8vZ3UxUkRVbzA5SjM5Y1NJTmljSHg2YnUrMmVVQmFKb1Q3ZFZ6MWY3TG5R?=
 =?utf-8?Q?7IU3JxtbEFIbkSgLiI1QiQt9xmn1DxdsLP7Lm3c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bee45c31-0c4f-4aa1-6787-08d910b65f01
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 17:42:52.3240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkBWTUKrOGUYOL7bD2sC68E3pXE8/PHfHGlKk8b8k0DndQKBry7epMTTddvL68UFflQ8UXP+KKJ7hhhjTKXXQJNZwKiSvFwjpC0EfF/3+F4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3861
X-OriginatorOrg: citrix.com

On 06/05/2021 16:17, Olaf Hering wrote:
> --log does not take a file, it specifies what is supposed to be logged.
>
> Also separate the XENSTORED and XENCONSOLED variables by a newline.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

