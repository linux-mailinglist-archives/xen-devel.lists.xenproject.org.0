Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC63690C7
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 13:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116204.221863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtcC-00067f-9G; Fri, 23 Apr 2021 11:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116204.221863; Fri, 23 Apr 2021 11:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtcC-00067D-5Y; Fri, 23 Apr 2021 11:04:52 +0000
Received: by outflank-mailman (input) for mailman id 116204;
 Fri, 23 Apr 2021 11:04:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/M9=JU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZtcA-00066q-OH
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 11:04:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f75a8a5e-e70e-4e96-8856-5a626b665a76;
 Fri, 23 Apr 2021 11:04:50 +0000 (UTC)
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
X-Inumbo-ID: f75a8a5e-e70e-4e96-8856-5a626b665a76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619175889;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OXqLpIbnf5tM3+5vBoS6G+K5GpMa2OPCuFGwySeg2F4=;
  b=Ka8G/WGpZFF9puWMa0gB592yv9YQ+xGzxVFinL1YBmiEJ9+G8UtPliS/
   tiexS6ACR7Pzh6vuz0DXlpWaIFcX1wH5uf3CHd5NDvu7NkvJZ9cunv38g
   SUJPHvw5J0m9yqHUiVd8+ljQTtwAkZ9XJDfb5u4vCD9NMNDHpOFg5sUUx
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YWMay7GGKDGmW9ZIruIP9yXyAGdUZBLl6fiAX74/eHGuoDqJ5fq4rg3dLxp1Qe5oVduQwUUEaz
 NE8W4xj2DPcV81oRzpBM2rK6mtyy/TAupM+srprriDKwcCsJD+te7Yjq+juuzpRL+JekukVfNP
 s9KAPu/waExP97wruv5XQy3aseielZeRrmrFAhfU4VpChKtWnlE0LM9gC2gVca1RSVIWiM4Kug
 JmxUhEohcyQM5eBwaqVikH0KH6wdpCv+w9pKP/dGyPAxh+UU6T6pHvZoNbdZZ+jlM0Am4B580G
 1Gc=
X-SBRS: 5.2
X-MesageID: 43760595
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Zcan7aj7COt0np0XrUG9SUZnlHBQX3Vw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIzVuL5w/CZ
 aa+45jrz2vZXwYYq2Adwc4dsLEoMDGk4+jXAUPAAQp5BLLoTSj7rP7FBbw5GZgbxpkx7A+/W
 /Z1zHo/6nLiYDG9jbw9U/2q65Xltzo18dZCKW36/Q9Bz3whm+TFf9ccpKYujRdmpDX1H8Ll5
 32rw4kL4BP7RrqDxyIiD/M/yWl7zo08X/lzjaj8AneiOj0XigzBcYEpa8xSGqg12MasNtx0L
 1G0gui3vI9Z36w/1Welqz1fipnmUaurX0pnfR7tQ04baIkZKJMtotaxUtJEf47bVHHwbo6G+
 pjBty03ocyTXqmaRnizw1S6eC3Um92NhmLRVVqgL3u7xFm2Fp9z0ce2fUFmGYB+J8XW/B/lp
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
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="43760595"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWvV6GkdJxNpRlheTOCUoaJPR2Sh60DpIFH5VYjd6H95x3fUYOFerfjBD/hIlJNe0CQHOnMGKRz45RNmhlBPf3mlM2CER4ETzGsgcNobCBwWmajITe8fVdhepOya7Sk24YUn7L5A8N9RsZDNSVr4zWh7zkdcYz5/tKjBY4WH+X/vaYWpF4Pws5iMk3hDiYq652i5cLnApT2gRnKbfKG8JL6B4vhrdxBQPP2bceiM+PYwg0m1BhtFOlzebC2lOpHtT/yChAez4YUsYFoSqSF68FR+lvlorD6FGwNy4qD/+Oz7c3R0yWisMBg2xObISZ0TPOns3MLbRW5TUoV7Ya4TLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tluXybjjDoHMux5mWdbQRg/qCP4s7UImVaAgTk8Cm3c=;
 b=b7YWQhs/oiCIHEeOGI58NnOqGWLmNQsbm2i0bTCnfY7ABEsdec1XNb47k+tGgK2UVtHR66cYZNT18l4Ke1hyQREY+85cuMiuQl3xUTlWVIozJ1cW90ro/JlaYNn2u2QWj8WL3qJnSFrc7nFVRziIke+Bc5VVOy1p9o/k+escKuJ0biBaw8jClTogJ34L6wcmU/kvoRU1SCOYr8PCWekm6G3yu7xr/1rtTEkuuS+9ykdeUf6tvKAXTz4JTVHseoOb9DAPWJ/eMphZJ0uAidZjUcwlgDgJ1qT0Ga7ltXmBITynQ88+ibkW9jYdVtHlK42lAylnFmRy5of3Dbro8x5mWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tluXybjjDoHMux5mWdbQRg/qCP4s7UImVaAgTk8Cm3c=;
 b=so/LalkCucD0MKaH9O6XAKzlbY7YWWZl4mXNiUK1ZBQ0BAZK1xHCUHRlYt9vjK1PHJ3IG7TaO77VAILmSHptKBd+ZJtTN5AYNjP34D+rpKUZTJBLwZNzYhrAZ4rANj311k2eU6iu0zR9tmVlWMT4VmBbjNsj6NxLILtKgzXyeDM=
Subject: Re: [PATCH] x86/oprof: fix !HVM && !PV32 build
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <694c9c98-1197-3378-cc43-235e2609c1dd@suse.com>
 <eaed70b7-c387-1ae1-28bf-7d52a4b650ae@citrix.com>
 <caab96a2-3949-9ddb-e6ab-9a95c958e4d6@suse.com>
 <YIKYaCr13TiwxqRq@Air-de-Roger>
 <98d0b627-de38-f7a0-7487-cbf83864c82f@citrix.com>
 <135f8bc2-d07c-c531-e498-9f0e15207cca@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e386f7eb-8ae8-2f18-b9e8-30a319354ec0@citrix.com>
Date: Fri, 23 Apr 2021 12:04:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <135f8bc2-d07c-c531-e498-9f0e15207cca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28705590-32f3-4540-5410-08d906479ad1
X-MS-TrafficTypeDiagnostic: BYAPR03MB4167:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4167204613F234734B4E276CBA459@BYAPR03MB4167.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o14S0wpC3VJYlgH9PoJsqn9OMCCdHVBoUNWOrHG14nv9NkWoS9ojkCYLiR+u9QAQFApk8xhL+krNeH9p2X1nfLcgXxoRq2/QNdc3gV9rRf+ACt8hWj9NN9wfMCLZomzcjYvA36LcHCDdo5nx8dZl4jCdOTbWgzuGevi4m1LVqzZD6E29GjtQX4XxscTA3tIMnBoWvs2VxQX6EPMDBnkCgvBDDcD+01UmXlWpz0OwjrAwhDrwz/+iJQWZU07T7D+5OgHscSed5RwLC9MqI652o6g/6RUReHKzDbfJ3WMBlHiQdffEq5K6LljObTJV3rpKu85PmHR6ZTaLsD0EDOmEhUyJZl4aBZvzD4I8eVwu8y94tvt3xCuz2j0i/K/nHWH1H85Yy5H0/N7Uz71RSWeU/TQFkH/hNsx7IC8x3iCzEmDn6hSbpf8SuF8fVIEgDHvtA9HfRF1lKdVbT3DbiuJ5/EEo1t4VhrMQfpx51Lb8+u3Xcw9EIp4uxit5DIyZdhMlfKJJygo6A/rXwpBMvURl4qCnSBR4T7awrMdxc25RDAywmrE+lNTdN18VVImUCKoclaHGftijEIeK/Kyn5koVHuQiYBDrK4GAfSHUVRbsX29W4xGmrhO7qCsJS7Wn3a40WIuQRJElGr+5883/yjoG+cFLYJPpOrTQ1voqhKbM5wGB6CdApJ9ZYuCYC+Eryxj9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(956004)(2906002)(4326008)(26005)(31696002)(5660300002)(2616005)(38100700002)(53546011)(83380400001)(36756003)(31686004)(186003)(6486002)(478600001)(316002)(54906003)(66556008)(66946007)(66476007)(16526019)(16576012)(6666004)(6916009)(86362001)(8676002)(107886003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dTRGSXA1cmdxMmRiU0lSckhMUHliUDVKZjdJNlBrQ05JcXVONnNQUnJUNUNU?=
 =?utf-8?B?Z3VCdjgvenpTOWU4clNabHBaM1hjN3NwQUtpb1doUmVTRytXMVlpUG1mZHlL?=
 =?utf-8?B?MTEwMVBPL3BTWXA4NVhVOExRUUV5TDZNK0ZxdU93YW54b2J6akp0SjlVdStk?=
 =?utf-8?B?YnBUNUthc21ZWGdPVUFKMGNoMUs3RXdtN1AzaDM4QURhTnRlNzh6d3BGZUR0?=
 =?utf-8?B?N1prOE5SVmVIamwrendqbTd0TzhrUTU0cy9OU1BRc3hIS1hlaWRQZkt3RDh6?=
 =?utf-8?B?enNUdVIwNE9NV25ZV01YRlV3OEpPRGFwN0JBUTRhaG9vQXZvVmM3WlROZDV5?=
 =?utf-8?B?K2ZhVFFLVlQrMU5vK0VzS1dnU1RjRGRhMUtNZDRMeGh2cUt5a2F5ODV0enRV?=
 =?utf-8?B?MmdmNEhsQ0RUUUprVnFYcWFXNjhIS2ZtRld1M1ZLS0toMU5LYWtyNEZxZTg3?=
 =?utf-8?B?azdsczVtbWkrUmtJUzcySW1DZzR5MjRpT3pQZXlPRXloZS93cTdyUHMzalc0?=
 =?utf-8?B?QXNUYkQvZ21ibWxIRWVLbXhIV0RpNjJLdmFLM3VjTDdsK085c1AwU0oyMDhz?=
 =?utf-8?B?UE0vMkFubTA4UmRZOTRhTkxJeUR5YWJpM3VmRWkwTE15bjBqZ1dzSjJ3ZVBk?=
 =?utf-8?B?Rm1wRWtyM0d0VmZVakhmOTJUaXc2ZncrK2V0a1dXY2o3ci9peXk2dTRXdmE1?=
 =?utf-8?B?dXNLd2hBNCtpc0grNGs5Q1RZVk82amJRRjJ0VFlkdzlzeGMyYjNxRGpCU0pT?=
 =?utf-8?B?cG42Y2FJdnJQVnF1WURKbnhlREJXWGY2U1ZySEhva3RaL01wNWd6bTVYdXlZ?=
 =?utf-8?B?M0VuVXVaTDZJWmcxOFJBWDZ1ai9ldHVWR0FZNGtDMzZOaG9rNmsvQWhQV2FR?=
 =?utf-8?B?b0tqZkQxLzFteGc3Yy94T2tONUpMYUNZNUd4OVdZOGl3NCtSNlE5K20rdzJs?=
 =?utf-8?B?Qk5pNDE2NjBpOVY4VGxmRDF0STMzdDJiM0tTV3ljRXVIdzFiZjg1dGwweGlB?=
 =?utf-8?B?MVBGQ3R1em15R2RUSkJXZDZDcVBmaDdBZ2RpcFVCOTBDZnBFMVVpc3pYelV4?=
 =?utf-8?B?R3B6dkdXaUxXVU9mc0FlQkFOTnA2MGtEaUxVQUs2VW1RdXR4THZLWmtacEZS?=
 =?utf-8?B?YXQyR1E5Y0srNTJwa3dyZ3NpcVJLcmc3UzZidDhQQkVyakdrM0ZKckJFS0NN?=
 =?utf-8?B?eHR5cThtZnBpS3cweExFVlh4RzZsRFNYdEJVd05Pd2QzbXdwa0hHL3ZHTG9B?=
 =?utf-8?B?YmlJSWxta3I0RUtMS2xQRzBhN21HUUlIaFdEUnVQUmZPOE5IcHlJTTdtWDZW?=
 =?utf-8?B?N084UzFtVUpZUGkzMXdJZ2FmRDh5azNVOGxWdmU2KytEQVNiQmJ4NWN0NThK?=
 =?utf-8?B?emk3b3J6V2RYMlFXMWRScWtST1Z1bnlPeGdsSXVQZzNqY0Noc2Q2a0dlK2Vh?=
 =?utf-8?B?bEExY3FRb3JaQkVmRDN2U3FDRkNSOXM5aGQ3b0RKaXAzVUU3RmxHWmFXVmtx?=
 =?utf-8?B?SkZkVnA4Z1MxeUJEdnZUYzVlSkdFZlZybzh1MmhZYStoUDdzUnB5QkM2OHdk?=
 =?utf-8?B?OVp4bkt2ajE1dEtKS0R6dTZTeDN6NkVHa1RKNXViWTBSYk5LOVdDY0pGNGlu?=
 =?utf-8?B?M1FIRzI5MWhRRTdtY0U5bXNBbnFxLzZaUTFTcUhrcjM4eWRHZC80SEVQM2t6?=
 =?utf-8?B?SzRqekgyMjQrQTV3ak82TDJPdnVEM2l0cU43RlFydmtGbVpvbzhySyszSDFs?=
 =?utf-8?Q?YtgwLovsV4aACpAcK86eqGeUCzzfqb6bosLf8ZE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28705590-32f3-4540-5410-08d906479ad1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 11:04:46.1119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYSqRXJtrBL6DeoY3v4WIENbCp0TYS7Y2STWx4ie9Zg9i0v9/xbAsKTvLLwOCKudyhsX782SSIffmeP2oKTaoYJ/cXlkzeEcUh4iQk7QICE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4167
X-OriginatorOrg: citrix.com

On 23/04/2021 11:58, Jan Beulich wrote:
> On 23.04.2021 12:51, Andrew Cooper wrote:
>> On 23/04/2021 10:50, Roger Pau Monné wrote:
>>> On Fri, Apr 16, 2021 at 04:20:59PM +0200, Jan Beulich wrote:
>>>> On 16.04.2021 15:41, Andrew Cooper wrote:
>>>>> On 16/04/2021 09:16, Jan Beulich wrote:
>>>>>> clang, at the very least, doesn't like unused inline functions, unless
>>>>>> their definitions live in a header.
>>>>>>
>>>>>> Fixes: d23d792478 ("x86: avoid building COMPAT code when !HVM && !PV32")
>>>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> I agree this will fix the build.  However, looking at the code, I'm not
>>>>> sure the original CONFIG_COMPAT was correct.  In particular, ...
>>>>>
>>>>>> --- a/xen/arch/x86/oprofile/backtrace.c
>>>>>> +++ b/xen/arch/x86/oprofile/backtrace.c
>>>>>> @@ -43,6 +43,7 @@ dump_hypervisor_backtrace(struct vcpu *v
>>>>>>      return head->ebp;
>>>>>>  }
>>>>>>  
>>>>>> +#ifdef CONFIG_COMPAT
>>>>>>  static inline int is_32bit_vcpu(struct vcpu *vcpu)
>>>>>>  {
>>>>>>      if (is_hvm_vcpu(vcpu))
>>>>> ... this chunk of logic demonstrates that what oprofile is doing isn't
>>>>> related to the Xen ABI in the slightest.
>>>>>
>>>>> I think OProfile is misusing the guest handle infrastructure, and
>>>>> shouldn't be using it for this task.
>>>> I'm afraid I consider this something for another day. Both the
>>>> original #ifdef and the one getting added here are merely
>>>> measures to get things to build.
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Without entering on the debate whether CONFIG_COMPAT is the correct
>>> conditional to use it's not making the issue any worse, and it will
>>> allow to unblock the build. We can discuss about the CONFIG_COMPAT
>>> stuff later.
>> I disagree.  Fixing this less effort than the time wasted arguing about
>> fixing it.
>>
>> But if you are going to insist on not fixing it, and putting in a patch
>> like this, then at a minimum, it needs to include a TODO comment stating
>> that the use of CONFIG_COMPAT is bogus and needs fixing.
> I disagree: It is (for now) just you saying this is bogus. The (ab)use
> of the handle infrastructure was there before. You could have sent a
> fix long ago, therefore, if you were thinking this needs fixing.

I only know it needed fixing because you didn't build test your change
in CI.  Don't make it out to be my fault I didn't spot this 6 months ago.

> I can
> see that you have good intentions, but orthogonal issues shouldn't be
> used to block necessary adjustments (and this applies to other pending
> build fixes as well).

You genuinely regressed things for 32bit HVM guests, with the
CONFIG_COMPAT change.

The code may have been using inappropriate interfaces to perform its job
before, but its actually broken now.

~Andrew

