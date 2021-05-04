Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C75C3729C9
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122172.230431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtiU-0008Ov-7u; Tue, 04 May 2021 11:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122172.230431; Tue, 04 May 2021 11:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtiU-0008OW-4L; Tue, 04 May 2021 11:59:54 +0000
Received: by outflank-mailman (input) for mailman id 122172;
 Tue, 04 May 2021 11:59:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldtiT-0008OR-9r
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 11:59:53 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ec4f726-4ca4-486f-9f06-107eee058fab;
 Tue, 04 May 2021 11:59:52 +0000 (UTC)
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
X-Inumbo-ID: 7ec4f726-4ca4-486f-9f06-107eee058fab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620129592;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kYTwRNPQgpB96Vv74KyTFIIkRTEOsQwXIo/pu+As7L4=;
  b=CaeTCbwi64z37La1sHKSVDt6ODOahcH6EiCZWKqUqBEB4zIe9wJAvrUK
   NzvdKtvIfSTPPz9Apx350mn8+oSjHMor/ACt9GDSaRHYIPMqHhqfhxP+x
   lt5HLKViBN8UtMh6EBfEozNGJ++YV3c1qnjmRr3LiryFt0SVy1RvhCMfO
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aBemyGdseHn/8BQ/+MgBkxeqcimSi6Lj7h2/QHPGHN1CWlr5Sh6Fg2dxGScnCqHHtJQNcE68fb
 k4mFkXuHaGUiYlaDtSUgRuOZ3wKCYjku64Th8sTiDmTjXq5pG/eoufSwuSGeyyZDicUDXMFWUH
 k+XoeTfo95tpYNVGdLhVt5nl8uW1PdRdkOOpXgVhIxZBklr7Y4Ekf1H+F6ntU7+7C6iwzQEXmh
 rUBrklm6ebTCJCER5uqYDb5XUUdn5kSWj9vtPUTC1YQGQb4rG4XpYNFEAm5PfsH4hxXIjh3LVU
 Qm0=
X-SBRS: 5.1
X-MesageID: 42822229
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cI2kAqijhrpeZRfGG1kfWzhAwHBQX3Vw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIDVuL5w/CZ
 aa+45jrz2vZXwYYq2Adwc4dsLEoMDGk4+jXAUPAAQp5BLLoTSj7rP7FBbw5GZgbxpkx7A+/W
 /Z1zHo/6nLiYDG9jbw9U/2q65Xltzo18dZCKW36/Q9Bz3whm+TFf9ccpKYujRdmpDI1H8Ll5
 32rw4kL4BP7RrqDxyIiD/M/yWl7zo08X/lzjaj8AneiOj0XigzBcYEpa8xSGqg12MasNtx0L
 1G0gui3vI9Z36w/1Welqz1fipnmUaurX0pnfR7tQ05baIkZKJMtotaxUtJEf47bVHHwbo6G+
 pjBty03ocuTXqmaRnizwxS6eC3Um92NhmLRVVqgL3u7xFm2Fp9z0ce2fUFmGYB+J8XW/B/lp
 T5G5Utu7dUQsAMa6VhQM8HXMusE2TIBSnBKWSIPD3cZe86EkOIj6SyzKQ+5emsdpBN5JwumK
 7ZWFcdkWIpYUrhBeCHwZUjyGGNfEyNGRDWju1O7ZlwvbPxAJDxNzeYdVwom8y8590CH8zyQZ
 +ISdBrKs6mCVGrNZdC3gX4VZUXA2IZStcpttEyXE/Lit7XK7ftqvfQfJ/oVfnQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oVVf4+b52DajG78kewIUALeR3w0wooGX8wvvOBSxJs6Qwck
 c7CqjgiLmHqW6/+nuNz2gBAGsbMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYjt2T8bcFh
 9jt016kJjHaaC49GQHMZaKI2iah3wcqDahVJEHgJCO4s/jZ9ceAos5XrdyUSHGDQZ8lwoviG
 orUn5FembvUhfVzYm1hp0dA+/SM/Nmhh2wHMJSoXXD8WOGpc8uQXMfdyW0UdGehDsvQzY8vC
 w1z4YvxJ673Rq/I2o2h+o1dHdWbn6MPb5ABAOZILlPlqvTYwF2R2eSjTm8gxU+E1Carnk6ty
 jEF2m5aPvLCl1StjR93rzx+F15TGmbYnl9c2t3q4F7CGTAtEtiyOPjXNvH70KhLn85hs0NOj
 DMZjUfZjljwN26zza5sjePH3dO/ORiAsXtSJAYN53D0HKkL4OF0ZwcF/hP5ZB/KZTFqekQS9
 +SfAeTMRL1A+4kwBauu34gISV4wUNUyc/A6VnA1iyVzXQ/Cf3dLBBaXLkdOcib9HWhaPCS0p
 l15OhF9deYAyHUUJqhxq7WZTIYdU+Wjm6yUu0yqZdb+Yg1r6B+GpHHUT3OkFFLtS9OWvvcpQ
 c7euBc5ruEB6pEO+o1UAhd9kAylNuOIFAw2zaGSNMWTBUItTvjI9iN47D0srIhDU2KmRvoNT
 Ckglpg1saAexHG6KUTBK0xK1lHcUQQ6Hxt++WZao3bYT/aPt1rzR6fMnWndqVaR7XAMbIMrg
 xi69XgpZ7aSwPInCTRtyB8OKRA7iKORt6zGhuFHapt/8ahMVqBxous78jbtka5dRKLL2AZj5
 ZCb0oec4BqjSQjlpQ+1myKcZPMy3hV2Gd20HVAjV7i2o+v/WfdEwVnCGTi8+RrdAgWFGOJg8
 TD+fWfz1Ln7lF+qML+KHs=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="42822229"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRcd8yJ1xHLhMSDQLeFk29ISCoJ+BzLpnERzO5MAQUQQofKutW+FijtG3xHEVfr0dhMwBMbnTvu6UEref6hhQUj28NykYRKSvoZA1kPpzS+BSbWdiSO+zB/7a1NI85o2LdUVcntmAMj2LPpQzQr6xoztVJkPPrvbtyRqFy+m/jgya+KozFe4Xi+a4JF3B63DiaqGQGmqTFmRbJHhJJYG8WqDMG6ym+NoBJyYoGj9DVtB0qocu5HWoNgdto16HtvaJ0wuEWTXfxbVwx5rzLHKMEyoP1UBwgvKiINV24s2/XCFL7EwD/3AgzPm0Ycs6AsLMw69hcLNoaUT4u7PDGe15g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4jRvz7DAu+uZjDw20zqbODBVRrh323FvRl2G5GXE3A=;
 b=XcyJMV95ucStiGxL1SrXY4DRSnc2TXZEFn5wqIkx2IfjdfcpFT7wFThPnonJkNCL9xT0ZsT5966KqEW8dKjt/JTiYQNM04GXKoP/Rx5rvNixyr+bU2eCYoDBY0eXDMCuv+6XyZtU0fbYOeLgqqqZqMkdGpJ9M4M06TdLqbiaLK05lq4HwggEIT1G3a9O2S0baiUigXM2rmSjOQ6BYX3NDvYmbJ58OLylQ09679HgvPYITOEyWEoue7DD9mLzZ78XVzjEZO/XrQelWk3SCry0U/lZfkjgqwrJFXIdDJMy7PqgyA0koT5Lx6GWZ84XFtUbBCPD0ck6It3IrVYK1dIsdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4jRvz7DAu+uZjDw20zqbODBVRrh323FvRl2G5GXE3A=;
 b=GBG4vcFSS8oZeMRSpi+5RB+GPobmFS1AU9s5w9KN7wq4k3h8hIGwEUQDYWGvFl3ZOAxgpwce2WNkZS7GJ0QrjUk75NXbW41+q7Gf5A3A5AoioIKzfChE6pyeje26SYC5HuOL7d263FgXDxYmLaHNI4WGN9aJUsta784CqmTHRZY=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 02/13] libs/guest: allow fetching a specific CPUID leaf
 from a cpu policy
Message-ID: <76e5e596-24bc-9d91-e654-cef1115e5139@citrix.com>
Date: Tue, 4 May 2021 12:59:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210430155211.3709-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d00d95d1-77db-4384-0424-08d90ef41de6
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54409643400003AFCC1BD03ABA5A9@SJ0PR03MB5440.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gRw0u+OTixm/SjocT3AhRaiNkk5dzISHvBWm3JsIUrVg2sk1w+mjmKTCzrRZsAPSbfwPSNX42YXLk8ITIoY7z7VQUZkSBhZNuFEVwyrJPWfisT8spHeF+nhG4XS4BU1Haqu0ioTenpFKKczx9fcMnlsayrb4ibwn2ocDATLcti9XN7km0uKhOM7jircfPMDR/cNESl52GWlLIGV4xCt5o5CHQpH39b77pl9u871cAyTkotjwj8nx+NQHgPogV6Oqamt6TdM5POme8+y5wbfn/wfjEhhGEdNPVIXnwpxh60Ibv/PANgIDB9N7wtC4yOLaRSu49+wi8HvT/0rn/sO5mXlqUOh1IuJ/a/PHk6+WFWthUinPnW0ZSM2twxPFJFWffpA2AzVsEjkwMeZ+RDkf5FvC5AfyP2fHHkEs7G1OzMs1c7z+CPRGpeKvX8UC16Z2xboGk6l/gbhTd8HXPvdhqAJmUKH85g3Z324AT0DI3kXmChZZKgK3Zl05sW6EXqp6y2pNuqJxaKcV/xLLl/HStm38+Fqoty25FuXqe29AwxvfC3srSeGhtr7LS3czvOEcvrIB25IctyqgBbvYB+EA/QSwtOpKpfzqXfhda6oJGg/+5j62VLvJwYhn8ok0chKYApfs2GbEyHxgao9C5/HkR2FwH7BnH3vnViJRc0iH6g4B6cwDQwpN+k+NkEFBwf/n
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(6486002)(86362001)(316002)(8676002)(31696002)(478600001)(54906003)(26005)(66946007)(16526019)(83380400001)(956004)(2616005)(36756003)(16576012)(6666004)(38100700002)(4326008)(186003)(2906002)(53546011)(8936002)(31686004)(5660300002)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rm9NT0syWWg1czVEa05PaDFuczdEQktkR0hKOVYzcXFQRWhQcWIwYkhablBL?=
 =?utf-8?B?T0IwUHh6eEZwTFJ5NVk2cGhXNFJLdGVaV21COWJtQ09XblFYd3czR05uL0VY?=
 =?utf-8?B?MHRtaWk4Wnl6MW9JaGJWOStVYWVkR3JiOXUrYzcya2pXQnFWU056TVdXdDFG?=
 =?utf-8?B?SGFyY2Q4aFJsY3VaRmJsbmZoOGpKL2ptTHBqNGdSbUxDZUF3TDRtTHM4V2hX?=
 =?utf-8?B?cUJBRnVRK2tiTTMyY3FNY3pucWplQmVjT2YrUWFweWM5VVV3Mm92VmZXZkxQ?=
 =?utf-8?B?S2V6T2hobEl3d0YyT2dHMlJmcjNYSDQrSUNraWM0UURKRVVVMmh1aUhkWGFH?=
 =?utf-8?B?dDh6OEFVbG9DU0p5US9nTHRaYzJ5L1E4aWoxWjl2a2NRcUZZOWhtQ01GeWx6?=
 =?utf-8?B?aHQ1NUk2NFYzcktVaWx3MnBSczJZY1B0YnFBNXFLN0hEMk5NVUExT1hlVVNy?=
 =?utf-8?B?RzlhVGFQTHQxTDFnaXVPcXhyZmxpWU40Wjd4ZDdZbGRlQ1prb3YzM0s1L3dR?=
 =?utf-8?B?aWVqNjRyL2tRb3MxWFR5emcvNmJlYjZpZDlyeEZtdFZTWU1tT0p2SDlLSUgz?=
 =?utf-8?B?ZDh2RnpYMWdMbzY4dkdGaE1lbGd0VHY1d3NsVnphaVlZai9jSGZReVNaUTRQ?=
 =?utf-8?B?ZzZKR3FvODRzV1hSRVRXNFJyVHlnM2U4WXkrVFg4eFcrejZBQzhaUzd2UUNi?=
 =?utf-8?B?Sk1aZkE2Q3AyOVpxcWZqS0dVc3hyNTQ2ZVdiemZTYnBoYklnQWNFaUJDSTJ3?=
 =?utf-8?B?alRCRlRsYUF1Z0RNd1F0RXE2Z0QrVWt4eWJmM2w3bkdkVEVDSnA2YU5UT2dw?=
 =?utf-8?B?am5QdkNVNUhoN3kvOTVlRG9zYTF2aXowOW11WDZUenFEa0FoaUM3cUMvRUJw?=
 =?utf-8?B?blR2UUFyOW4rNFJnSDgwNXNKL3ZjVTBBN1RwMXduUzdNaDBacDNjc0p0NVpL?=
 =?utf-8?B?eHVEWFhRZ0hsTHBNWmpqUXBCSjlOZHZkQXRmQUhrWU1Jb2lCd01LM3d3bmYr?=
 =?utf-8?B?dzRVVytLcDhzT0lZaTNSTlJnWWJJMXFUalhZL2ZGL1E5SzVFaEZRZGV6K0My?=
 =?utf-8?B?OGRjclQ4YnN2L1lXMEUyQkNWTXpjeXhlc0VhSEIySXZzK0VnZ0NNQm5IYWtM?=
 =?utf-8?B?NytXc0hhTmowdnJUYXlOMmNBU1FodU53VVZMTThGRXRYR1cvMVNUbnA3bzZ5?=
 =?utf-8?B?bnpScG1nREF1MUtHNjhFUlVPSTdsS1lFdVlpbEJVVDZWd2FjNW1SNFo1U0x5?=
 =?utf-8?B?RWtqRGk2OG5QVFByT29LRVVvbGtJQVF2ZUxmVnFqYXJKRnlmMHkrSWpiUnBi?=
 =?utf-8?B?UW1KbU9vTUpYcm9FZU9Hd0xQUWpiVUszcTNENkJDRDh5K1lZMitmZkdydE8x?=
 =?utf-8?B?eEVGUERUQitON2g0SkxBRjFuM0FiV09BUXFiU3RMVFJ4c0ZLbW00OC8zMEJJ?=
 =?utf-8?B?dzRCcit6R2kyTWh4NVlLQ003L2hTR1NtZURWTjVtSFRId3pBYjZFa2ZZcy9G?=
 =?utf-8?B?Ti8yMVJSZGhqazBOMDZNNWlWT093cmV2dG5KMHRyYVRBWWRycHlvSmhJcHR2?=
 =?utf-8?B?cXdQV1lqbDFwSm8rSTBVd0ZKb1hYSTlGUS81TzJSRk1VNjFnWitRL0RtU2Zq?=
 =?utf-8?B?alJ0czFDZXRtditEWjlkSVB1cUJqaGxhK3RjaHBSNlFmNHZqZW9id3BwOGc4?=
 =?utf-8?B?NStOL1NyRTJPaG1pZTR0QmdtZmFFaXQ2U2JMRmF3dlNSRmxUUXNsaVB4Y0Yx?=
 =?utf-8?Q?GrI1ozQz7FL0tiixWTwO+mHSEZXOV//7UxYhuGy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d00d95d1-77db-4384-0424-08d90ef41de6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 11:59:48.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7flI9Z76Xs1lzfe31c8dpZgEX6DFpVQ2Z0liZ5sUBp+7OA28+UB0GoxNHK5xH/cLa3Dm3XJPRe1EtzIpRn+f92VL/KbisscpSFJ1MadryEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5440
X-OriginatorOrg: citrix.com

On 30/04/2021 16:52, Roger Pau Monne wrote:
> @@ -822,3 +825,28 @@ int xc_cpu_policy_serialise(xc_interface *xch, const=
 xc_cpu_policy_t p,
>      errno =3D 0;
>      return 0;
>  }
> +
> +int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t pol=
icy,
> +                            uint32_t leaf, uint32_t subleaf,
> +                            xen_cpuid_leaf_t *out)
> +{
> +    unsigned int nr_leaves =3D ARRAY_SIZE(policy->leaves);
> +    xen_cpuid_leaf_t *tmp;
> +    int rc;
> +
> +    rc =3D xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leav=
es,
> +                                 NULL, 0);
> +    if ( rc )
> +        return rc;

Sorry for not spotting this last time.

You don't need to serialise.=C2=A0 You can look up leaf/subleaf in O(1) tim=
e
from cpuid_policy, which was a design goal of the structure originally.

It is probably best to adapt most of the first switch statement in
guest_cpuid() to be a libx86 function.=C2=A0 The asserts aren't massively
interesting to keep, and instead of messing around with nospec, just
have the function return a pointer into the cpuid_policy (or NULL), and
have a single block_speculation() in Xen.=C2=A0 We'll also want a unit test
to go with this new function to check that out-of-range leaves don't
result in out-of-bounds reads.

~Andrew


