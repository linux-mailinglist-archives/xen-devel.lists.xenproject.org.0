Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C318A408ED8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 15:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185680.334360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPm96-0007Jh-It; Mon, 13 Sep 2021 13:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185680.334360; Mon, 13 Sep 2021 13:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPm96-0007HE-Fc; Mon, 13 Sep 2021 13:37:16 +0000
Received: by outflank-mailman (input) for mailman id 185680;
 Mon, 13 Sep 2021 13:37:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hZsy=OD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mPm94-0007H7-TH
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 13:37:15 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5ab43a1-0c96-4bf6-a39a-28d172b00132;
 Mon, 13 Sep 2021 13:37:13 +0000 (UTC)
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
X-Inumbo-ID: f5ab43a1-0c96-4bf6-a39a-28d172b00132
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631540233;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=A+FreUrlW+pyuDniqI775xFPQ9xesUP7rjMDdEVgdEs=;
  b=I82pZCwuRtkxpilMqbLYy/V6BRaUPNvFVU4NjMXiVug7CGjVhj0A4qoC
   etZjrRzqSp3lgfN4YMa1CLPH6rLs08XJ6yIdRZqymc0+RU6bHAI/G/rvQ
   FD32VeHAQWBGDlg9EEpYQBHLaGw3DxlBS+4HIkTxqpbp2ehaPscjRUbnI
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KcVVgRw+8sBPkarTPr/I0O2TS92Kyj4JrknxGUSma8H0kUdWMz/eLg5Icnm/a6puOwFUkhoD/8
 DXwS5DFlFhPkAJbcZ6zwUUxa3S8G7k92uOcGWhV66VB/6SJTHzdN4eVKzLLDbAv4b23u7oBC99
 gJJikBt9hQmFqxiwnI+NLWj0RycoCqjgcKDdlv+ViR0Aa5w2+79xk95zOOhs1ofYExjXLuQfLL
 s3P0gwG8bA8+VqcJacB+AV3O8d2j1j/qxl0JX/EfkaI7eP13DOKmRky0ZA63XuXWJdREA0oZbX
 q+qiyair41kUf/1nhDtlRrh+
X-SBRS: 5.1
X-MesageID: 52599778
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Rx5M3qocUl//bMAVBQCs1HAJX5BeBmIGYhIvgKrLsJaIsI4StFCzt
 garIBmFOP7fM2v0KNh3b4yx8EkAvcKAytFqQANqryA3En5D85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncw0IHiW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZj3RFoEYpLQpP1HCRUGSHw5FJ0W9KCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0UQKePO
 JVJAdZpRDfjbzlBGlY8M5gvmOGMvljBVzZfrF3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0X51dTsBm1x2x0/CO71jCWy8tfm5Nd4lz3CMpfgDGx
 mNljvuwW2c26ubIGC7CnluHhWjtYnlOdAfucQdBFFFcsoe5+OnfmzqSFo4LLUKjsjHi9dgcK
 RixpS4ijv04iccR3s1XFniW3mrx+vAlouMzjzg7v15JDCsiP+ZJhKTysDA3CMqsy67DEjG8U
 IAswZT20Qz3JcjleNaxrAAxIV1Uz6zdbG20baFT82kJqG32pi/LkXF4yzBiPkZ5Wvs5lcvSS
 BaL42t5vcYLVFPzNPMfS9/hWqwCkPm7ffy4B6+8Uza7SsUoHONx1Ho1PhD4MqGEuBVErJzTz
 r/CIZj1UidLVv09pNd0Ls9EuYIWKukF7Tq7bbjwzgi90KrYY3iQSLwfN0CJYPx/56SByDg5O
 f4FXydT4xkAAuD4fAfN9osfcQIDIXQhXMikoM1LbO+TZAFhHTh5WfPWxLogfa1jnrhUybiUr
 i3sBBcAxQqtn2DDJCWLdmtnNOHlU6FgoC9pJicrJ1uphSQuON798KcFepIrVrA77+g/n+VsR
 vwIdpzYUPRCQzjK4RoHapz5oNAwfRinn1vWbSGkfCI+b9hrQAmQoo3oeQ7m9S8vCCurtJRh/
 +38h12DGZdaHlZsFsfbbv6r3midh3lFlbIgRVbML/lSZF7orNpgJRvug6JlOMoLMxjCmGeXj
 l7EHRcCqODRiIYp692V17ucpoKkHuYiTEpXG27XseS/OSXApzfxxIZBVKCDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi9+1A0wBpPHTXdFD6WLpvL06P0dRLqqAQlKRSvhG7W
 x7X99RXUVlT1BgJzLLFyNIZU9m+
IronPort-HdrOrdr: A9a23:gkVGz63bTZplzaRg9HY27gqjBIgkLtp133Aq2lEZdPUzSL3/qy
 nOpoV96faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rfKlPbakjD398Y+a
 B8c7VvTP3cZGIK6foSOTPIcOrIFuP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.85,290,1624334400"; 
   d="scan'208";a="52599778"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VF5oiJ6R5sijX4YDGm28IYTBz83U/nNUL8BVN8FBVUtQtBokBuDUfzMigWK+6/Pm4YrCB2VSfrWuGc1zGBrJyGkOeVqVO7orj8ZcqQjj4g1lsB1YJAh8UuIaCxpUC34P3PYPFu+25bhs+68M+Ouu2IZ08f/URtRjLWwq2uZhcxDTb74JBiQC3L3vQbUrZT+llWw0sgBr9AXS7k4NN+aIcl3dLgiuEzx4XxrfEcXfBaPKFnaTzw3rKQLdjf8c/eZFf6PdEr59SN/XPgZ56SzH7EU8aH5tfvJ7PMaLrI9gJNNfrLQu0w58r9UrsMY4mKP06hxT95wvTfgNlxUR9JD/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LZ2FW8Iaupoo8E88XIF+kizmAFZvLvu+996YnALcNfw=;
 b=GTgYQJsRmxd2LQRglQM6DSvDDTLAD06CJaCFMdRIJnXHK5sDNErtbtfPSwxPocGlG4AzfmhtQODKpe9V68OBlr0A4sjYKJgrhdEBdBTXTP9m6bn4DzaqBmlekGv2EWn5jBLhgDUi8kmd7sNd3QifvPoSbDlAq4+s3ke3PTYWDl9bfgSpWYgAijfu8co07Gv5KKE+sX7kU/bv4bD36p3HbzyIC6K9teCPAKXk/4TzBZLn/kaplOrbNDM3Zm96NDa8x2cDF3yKGfo3r5OFOqp6VKmeDpHzOcSduLyqokJmw/cS9txCzXQI9XfQbvIuulClxoqdzkfiBS3V1XPANh2nnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ2FW8Iaupoo8E88XIF+kizmAFZvLvu+996YnALcNfw=;
 b=sCJZJJohIyM0DT1Q7cZ1iPoKeXSEBtvBl3F2O9lCPjPrurnlmZp4tnE3CG2c+U+eSn01zEAE1xO2bDJtkY7V0pQlxUdH4qap9GfPbrh+4p25mvAPBZJYMUZS3S0xZyZnEPyEuHg/Pt1IZL97THAqtyR6jycJdNdasA9NeH0TLGQ=
Date: Mon, 13 Sep 2021 15:37:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: conditionalize workaround for build issue with GNU
 ld 2.37
Message-ID: <YT9UADtkz00JJkuB@MacBook-Air-de-Roger.local>
References: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
X-ClientProxiedBy: LO4P123CA0343.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9998ee2c-384e-4e45-d7a8-08d976bb9640
X-MS-TrafficTypeDiagnostic: DM6PR03MB3579:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3579E93BEB6A18A84443AEAD8FD99@DM6PR03MB3579.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YRKl6L/JK+nDIdeEwC4kwTMZdS+O7nuCdOShdGqeoErF2CzoeRDJt4RvBC8g+Txv4EoYTqBxb6wWEH3IEhDQo904XH4oReXUSKZmqTjZRVbM7GSUo3+wcHiJ8ud6zc9hVAa9H8X2U6MKRvu6gedUMncqPLlfArjgwxCSsx3ZW2mjEOjKvdO9Az0HlLwoquJ1Of7XtX3vM+Xp+LRIEtwZtw0sJmaBqAZWwEfCFHNpgrkw03H5htTg5sHvzY1DvfYT4u7UpXBhthUgNifNh0vjNwa/9vKs3YNmaRXtlawU9x3xlbeZcl/aFMpnUoslCp2YdnaqbAQIqLsdofsSpHbSZvMWhqqprtMnfC6zQAqineU40O1D3Mq8NTY16XcYVmuZlhDV/qbBrh4pP5PbBijSDwF2kejfxh5lVgO6ccUwkpYxig2ZBqmstYhvkNrFShY+kPWnQocVUpBKxoXDzsvkJVmDK3lRkHGL1FiQ0+tPuZ37a+rIr2AdEKBVrUs97ady7p6X5X9rhmTkWJIyt3rlpP8Jh+CxS6pMdmANRDa6cXZWDeUDW5dCdY2VKR30LyXYYFQ7LhuWgf/e9ZxA+1EHlwEp3lWpgKQa0g0eXK0hATJmrvHD0e+68tcKHNufAz6NZROuCawVirMvRFYTSJHMscNqsUYyWiNjXaOh+wDKfpkGhqO7R8qY1LgdkU+c0xCIv7n1F5DBugP8WMv2+htWa0BuMrg5RRZO3K54TtOp7ek=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(2906002)(38100700002)(4326008)(66946007)(6916009)(54906003)(66556008)(956004)(66476007)(186003)(8936002)(8676002)(966005)(6496006)(478600001)(6486002)(6666004)(45080400002)(5660300002)(85182001)(9686003)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UC9vdTBoYWJKbm9iSmVQQlB1T3I4aDZpSGt3SGRzRzdSQ2RmcEM2TThtU3or?=
 =?utf-8?B?SU5kSXZpalNQazFqOERPYzArSS9UaG1TN01XbG4wSUY4Q051Q3ZXT2FBRDNa?=
 =?utf-8?B?VnovOEZuWjBxaFVKdWJDVjZEUytOU3BaLy9YbHh0ZjVVU0RackNyeFhCNEcr?=
 =?utf-8?B?Y3UzdVpZSmNzS0J4Q21lVUdXNUEzWENKNlNQdmd3NjdybHNRTW5NL0cyckxj?=
 =?utf-8?B?Mlk4ZEZER0R1eHExS3hXRjlEajl0S3pTRTlLRU5GM2JlOVFUQWlLbVF1M09K?=
 =?utf-8?B?UG15Z3hHQTU1b3U0OERVQjNsemwzYjdTZWZaU0xkd203dmUrSUJyWWMxa04y?=
 =?utf-8?B?RFdBc2paaVJONk13UkU2djFMempRcFA1RE5nVkVVUGhUdE4wZ3VONkcxOHlO?=
 =?utf-8?B?YkNUYllrY3pMbFFRMmlvSDBBbGpQV3RLd3NJclV1ZjJiOVN0djdhaUFWc1JB?=
 =?utf-8?B?eThLTnpvajJweXA2dTFLNHNFZmZhb2JTSVNYZWtjY2g0Y2lraFBKM1FzS1Vu?=
 =?utf-8?B?MytJdzhWMitUbW02ZE1peXhlVENjclVvTnN1ejdzdEh3NlNDLzJPd3N5VGVK?=
 =?utf-8?B?clZ4eEwyS1NMR3Juc1JYOTBjUUdLczZhS1FCcmo0N2xlQ3puM2JPYXZQR0Y4?=
 =?utf-8?B?a2JRVlpKbVpWVGQxT0FJcldXSTBTYkdjQ1UrMUVoaXJ3MkRJdkl5ODBqbzVa?=
 =?utf-8?B?ZC8xZlQyOW9wZytxYllZUDl5M2EvWG5rb3ZKRDJobjFVOG5GdGJRWlBCbmZZ?=
 =?utf-8?B?SDFuZE84cGN3dTJ5QmFHM25XSmpVaU0zeDRBQ2FsVHh2cDVGdTZLZ25sQSs3?=
 =?utf-8?B?MHV2V2JaMkZXbm10ZG8zTXp2RjFKVG5IMHFhd2lMWjZBK2pGUFNJNzY4dVUr?=
 =?utf-8?B?NVBmN29aT3VqOGlQOU9XT05RUzl5MTVNUmNlZ20vcjNWbFlnSDZ5Z2t2QXgz?=
 =?utf-8?B?UXJxRGwwcW9nOGVsSU5wYXNNNXZQT2ZCZjhCejhXeFcvRGUwZFovTWtBL0tD?=
 =?utf-8?B?ODJrdk0rTE1tTVhjNE5GN2tIa0NHcUIzNFRITFJReUhyN0ZQWDdsWGFOMFNt?=
 =?utf-8?B?NC9YQXBKbWRmUlFWREpvVVlpcjAxMSt1TXJVYW4vaWhnMlIxYkpYQ3MrTFVC?=
 =?utf-8?B?N0FEWXFuZWt4LzlvcHdRNWNpaU1xaUNBY2NmQnVhMGxYOEpYZWlIWWJRK092?=
 =?utf-8?B?WmtyWTRNd1dpWmVuaTNIS2x1aGdaZFdua296WkZEKytuTXpyczdaSVRNTEI2?=
 =?utf-8?B?L0k3NE0rdXo1UTVTZ0FUQ3c1a2dMUS96N1NLdmRVb3diS2Vpa0JuZ3gzQkNr?=
 =?utf-8?B?TXRHWEV2NWZDTkdXczl6Qkk4U1Jodko5dmdsNzlWYWlaRnNVbnZ5NlJ1RVZv?=
 =?utf-8?B?Rm1LZHpma29uYk05bWhSSkcrSmNLRXBpWDd5alYzcjNzdlhoNmZUWnpFZHZy?=
 =?utf-8?B?aWpkOWRxeHhPcVVSWHg5Vkx1MFRNUklxRTdpMHdhUzNPSE9WbmM5VGVDODJK?=
 =?utf-8?B?b3ovVk5VdEtpTlRIL1hEQU9FZDJXK1JuUEJzVm1OQURxVVFaeEhMejhVc0ZH?=
 =?utf-8?B?aWx1ZzhnR3Q0TEJkTm1ZelRoNHNTYkNCamMxbHlGZ29GL3orZURLOXBydlVO?=
 =?utf-8?B?bkJtTGgwSk51NUVoaDJVSVF1L0Q2NzU4b0tpbEFkMXRWcjVuUGEveUN1OWov?=
 =?utf-8?B?Qythbkg0Y0tSOHcrWWNlTlBHVHlHVzlRUkZOMXd0MUs1dUtmSTl4NmdkTzF6?=
 =?utf-8?Q?UHh7aakqcjndjAcyiwRTwc4BLvzkaEcdX/1ALv0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9998ee2c-384e-4e45-d7a8-08d976bb9640
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 13:37:10.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1Un0Fz0+10Kkc8jHb3X5RrLZ6K6E4iw9spRFbmKtDUpPb1iyzVjwlOiQiIMkvjZTk15VnX3eSUb2Whe+0Z1rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3579
X-OriginatorOrg: citrix.com

On Thu, Sep 09, 2021 at 04:35:49PM +0200, Jan Beulich wrote:
> While LLVM's lld is supposed to be a drop-in replacement for GNU ld [1],
> it appears to not understand quoted section names as operands to e.g.
> ADDR(). Therefore the original workaround broke the build in
> environments where ld is actually LLVM's, like on FreeBSD.
> 
> Fixes: 58ad654ebce7 ("x86: work around build issue with GNU ld 2.37")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> [1] https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flld.llvm.org%2F&amp;data=04%7C01%7Croger.pau%40citrix.com%7C07abc3240fc14a3f095408d9739f3eb3%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637667950073151096%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Sa0BBWP2cWOhWsB3b4FQIZ1J3KvfWP%2BnINiqyXdChD0%3D&amp;reserved=0
> ---
> I haven't been able to find an environment where I could actually try
> with lld (ld.lld); all testing was with GNU ld (ld.bfd).

Thanks for fixing this. I've been able to test with LLVM ld and the
workaround is fine.

> --- a/.gitignore
> +++ b/.gitignore
> @@ -306,6 +306,7 @@
>  xen/.config.old
>  xen/.xen.elf32
>  xen/System.map
> +xen/arch/x86/.check.*
>  xen/arch/x86/asm-macros.i
>  xen/arch/x86/boot/mkelf32
>  xen/arch/x86/boot/cmdline.S
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -92,10 +92,16 @@ efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=
>  
>  ifneq ($(build_id_linker),)
>  notes_phdrs = --notes
> +# Determine whether to engage a workaround for GNU ld 2.37.
> +build-id-ld-good = $(shell echo 'void test(void) {}' \
> +                           | $(CC) $(XEN_CFLAGS) -o .check.o -c -x c - 2>.check.err \
> +                           && $(LD) -T check.lds -o .check.elf .check.o 2>>.check.err \
> +                           && echo y)

Do we want to make this a Kconfig option (ie: LD_UNQUOTED_DASH) and
then use is here?

We already have compiler and assembler checks in x86/Kconfig, so it
would seem more natural to place it there.

>  else
>  ifeq ($(CONFIG_PVH_GUEST),y)
>  notes_phdrs = --notes
>  endif
> +build-id-ld-good := y
>  endif

I also wonder whether we need to make the quoting tied to the usage of
build-id. I guess we don't add sections with dashes and instead
use underscores, but it might be prudent to always quote to be on the
safe side if dashes are not supported.

>  
>  ifdef CONFIG_LIVEPATCH
> @@ -291,6 +297,10 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
>  	$(call move-if-changed,$@.new,$@)
>  
>  efi.lds: AFLAGS-y += -DEFI
> +xen.lds: Makefile
> +ifneq ($(build-id-ld-good),y)
> +xen.lds: CFLAGS-y += -DQUOTE_SECTION_NAMES
> +endif
>  xen.lds efi.lds: xen.lds.S
>  	$(CPP) -P $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
>  
> @@ -302,7 +312,7 @@ hweight.o: CFLAGS-y += $(foreach reg,cx
>  
>  .PHONY: clean
>  clean::
> -	rm -f *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
> +	rm -f ???.lds *.new .check.* boot/*.o boot/*~ boot/core boot/mkelf32
>  	rm -f asm-macros.i $(BASEDIR)/include/asm-x86/asm-macros.*
>  	rm -f $(BASEDIR)/.xen-syms.[0-9]* boot/.*.d $(BASEDIR)/.xen.elf32
>  	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
> --- /dev/null
> +++ b/xen/arch/x86/check.lds

I would maybe name this check-dash.lds, in case we need to add more ld
build tests.

Thanks, Roger.

