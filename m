Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19722431159
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 09:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211720.369361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMxe-0007w2-Ah; Mon, 18 Oct 2021 07:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211720.369361; Mon, 18 Oct 2021 07:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMxe-0007tX-7S; Mon, 18 Oct 2021 07:21:30 +0000
Received: by outflank-mailman (input) for mailman id 211720;
 Mon, 18 Oct 2021 07:21:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJnW=PG=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mcMxc-0007tR-Ur
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 07:21:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0199de2a-2fe4-11ec-82cb-12813bfff9fa;
 Mon, 18 Oct 2021 07:21:27 +0000 (UTC)
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
X-Inumbo-ID: 0199de2a-2fe4-11ec-82cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634541686;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YAuQIayE3t3dABNES/1XDbBZ1R6MaeFa9BxG7v1wPGk=;
  b=apMjE7QBNdPy0Tu9f8dACi1yeV/mDuaMKZgcmIFC80WuAs61MZCPmHMf
   YwwBIBMaAQYogdASAv235UX4i9RriWO2bWYfxsKmT3hKdgTybYGDCcm6e
   D1gUkzNmfJjugTjz7EgB3Trh2cqWVXiyYUo2nVV0gO4VqxNKotS1gL8dx
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: surCThefBP1a+6d97AieNTFaD+YFgYr7t4pzW82IWeSD8G609S9IL2DMNUDRPWa48o1rABwehC
 lOC7gZLAO0kkTVYF7uNulvsGs5pa1cpUGQiXtYDE6uUWClxLh138jPnzK/Pd5Me5pj9ikn2NlX
 aS3o84KM40lbYd1Z5jHyVU1MbOPvdo87CIBLwuraVtCrD03XgGx+x2B2QIV3fXe3X6rM3T5NXx
 lOmnSlP8RjROtHyE1IbgAlP8ALckGkYbKGGgSFKcijRx2ORXAztF/Dn8alkrylL6RubbpIFVFs
 37bToz7ovHIWsP2nALt0mkno
X-SBRS: 5.1
X-MesageID: 55439562
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lZJ0Uq1JHzthnj1UQfbD5VJ2kn2cJEfYwER7XKvMYLTBsI5bp2MDx
 zAaXTvXP/iNZjOnc4wlbo+19RlX75CAztZrHVE/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Es7wr5h2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhpvFsl
 8tSkqWJdAJ3MKTdsd06dQBYOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t25wVTKuAP
 aL1bxJEQE7OW01uPm0mL5MVrr7yi0H6Uhth/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfnnyn2RYYTH72Q7eNxjRuYwWl7IAISfUu2p7++kEHWc85eL
 mQE9yxoqrI9nGSqUdvVTxC+uGSDvBMXR5xXCeJS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 maogoz3GhtWiYCQF3yU556tihWrOQFAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJszHlJd3j6
 2vV9HZm1t3/meZOjv/hpQmW3FpAs7CQFlZtjjg7SF5J+e+QiGSNXIev9UTApchJKIKUXzFtV
 1BVxpDAsoji4XyL/RFhodnh/pn0v55p0xWG2DaD+qXNERz3qhZPmqgLuFlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4+5CqGJP4ASPsIgHONiwM2ITRTBt4wKuBN0+ZzTx
 L/BKZr8ZZrkIfUPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9c5xvsIyrqRo
 yjVt40x4AOXuEAr4D6iMxhLQLjuQYx+vTQ8OyktNkyvwH8tfcCk66J3Snf9VeBPGDVLwaEmQ
 v8bVd+HB/gTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK65Zkkv
 rmt9gLHWp5fFQ5sO9nbNaC0xFSrsHlDxO8rBxnUIsNecVnH+ZRxL3Cjlec+JswBcE2RxjaT2
 wuMLw0foO3B/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fz7N
 +tPzvz6PPkWp3pwstJxQ+Rx0KYzx9rzvLsGnA5qK2rGMgawAbR6L3jYgcQW7v9RxqVUsBedU
 16U/oUIIq2APc7oHQJDJAchaejfh/gYliOLsKYwKUT+oiR24KCGQQNZOBzV0H5RK758MYUEx
 +Y9uZFJt1zj20RyatvW3DpJ82msL2AbV/R1v54XN4bnlw43xwwQepfbECL3vMmCZtgk3pPG+
 dNIaH4uX4hh+3c=
IronPort-HdrOrdr: A9a23:ap/QvK2i/UP9gokSP67jHAqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.85,381,1624334400"; 
   d="scan'208";a="55439562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nilTrGyfsCVkm0/Oyvdqq9FaFQA1apIwXT7KcETTRvoMnBnOCSAAULW8++TU8+OB5dxhGV6CJTeiez/ScRHK1mg0PZsDK/f1RUlOlaYJIQh7g0KUVyxdSvvIqfGksMqUDg7i2Vu1J9/zViSrNARhw4FQ0exo72k/HKiRyd+sb+dxWuWfYsr6k7SPBPgZzRk6mAwwQ8Y7h8d4TnSx5CXYMp6nOjzt56WDLmv3rBKubABsTSH+OVtJCLyG9QxGjRATiFioHS8r0EAPSuSQWY/Yh0vxho8Vky8FEYbF/LKLCgoAHtJXNPOybCQfNBaRx8vhVGpOH02NrDYk0yzMkztlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAuQIayE3t3dABNES/1XDbBZ1R6MaeFa9BxG7v1wPGk=;
 b=FAaFG67AbCz3U7tjuxuQ1zpXS4PMWEWOiG/ORxZoHxUGcgyGD0sIYpPL1YUeWsTsVWo11XxLr92wZYCJSmhW3fhNqITm43s2ggcrcUgX1sqe4NkigHwdPBqoTNULfLUnqoaS642y4Hs2L4L7JEU4YHU3ls0k229kwmF/UUsCTw7tfnXRhccvcnsMOMBaE/bgxcPcpQ96GbnzOa6r7H4XiTyhVprnb6vJ5A743tRe+Idh7ukFZ1/LyKWr2G6zoR9KwKSCtGWImVkxtSGHt48Mb4Fgb/r53HVBMsYnk9HmueR0BzA9maCxM4nfa4UMv9G25pAw/2W+uX86CtBBoWsufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAuQIayE3t3dABNES/1XDbBZ1R6MaeFa9BxG7v1wPGk=;
 b=l2Nn+5D2xDfm/ZWNxq1cRHHTDwN4x9uWKYl1us1x50y8ATX9dhrCZ2riEhmYiql5xjBtNYKmxcTZRmq+Y98EdrDqvB47WpXAuldhVUvp5gzGgZqqq5pG4lpNH8lE6MslicIWjnuzOdHCGl5on8z8/PtGSXgbnp8dv+RZFu4/1p4=
Subject: Re: [PATCH] x86/shadow: make a local variable in sh_page_fault()
 HVM-only
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <e469f3d3-ec0b-fce9-5fdb-5939970fdc6e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9d7753f3-726d-06e1-7e42-1fcd83330000@citrix.com>
Date: Mon, 18 Oct 2021 08:21:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e469f3d3-ec0b-fce9-5fdb-5939970fdc6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09df3434-6121-4df1-c72f-08d99207dbe4
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5776:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB57760EE4AB8FD936C015F608BABC9@SJ0PR03MB5776.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8iLhVo+OPqjUxLc0YYIsR7vKIboKga1742YHqSOXF4+E7gjOd13yyFPnKyXksfidc+9GEuqto0vs65cVZDualg25nF40EJP52yEfrOC626wK+nr3DYXjZuYaxw0Eto+kp+XNGB2rvsmN28wepLHPNpgsVdKHylQWOEbYlvtDV7pi2v3IllNj6w0QOWMdTKVgP5uxWJ7Ril+tpgeRVPMHXypXhaR4kwLG9UXRdYjltzMdfB2330vltlOV6zf+Qo1D/ng+iMZa4pWmuufVz50Q0F+NO1qV+F+s3lbi3ikFg+Mz9NFrz9TomqvJ7zopTBP+LjJB1Bi13pVTXoOJsGRazfN8+35wpdtarso3JIkAiLZotThs36sf6crlEcSrJ37VJxSaWcnUrTHqEmVCLuRJGA/1SQZBnBVQja95G1c/HM+LT+VPWt4+t9rivWwxqUXnSho72U7bwkmK90Q6KyZ7T6fdCBLIJFjXOQy3Fs7sZWyxnhJ1jD3pR7Vo7oL3Fh/u28hwof6LFj4mp/tLtpYVPAnvE7v9Dqzco0niPbD81i74E+I6lvqTqy/FF5yRpeP+kEW7YOqFCrEsHS4MRxMwW4TWuThrB4YYU3cCb/++hLPBanBW2WHR79BM7PlxbEaLYewC5gW5IwDgXYZhqhUISxJzaH+y15CWB/WQh2/oVzstdNh5sc/aZRA+o3jj5d4yVnLggCeVUCu84UGO+Djulmu4FnMO9VvUdmNJCjOrp+5OX5VuwDcxt2XP3QXOjNz2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(82960400001)(508600001)(316002)(956004)(2616005)(26005)(8676002)(31686004)(4744005)(36756003)(110136005)(8936002)(31696002)(54906003)(107886003)(186003)(86362001)(66946007)(6666004)(53546011)(16576012)(2906002)(4326008)(6486002)(38100700002)(66556008)(66476007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmkzWXBXb3cxQ0h0YVpwRHV6Y0JCRzNKRk5XdjVJdnBSMnFyeXhUQ29YVFV4?=
 =?utf-8?B?NDhxWUVabStjYmxZRm4yVmNnNTdGZk1tK0RqV2xwMGNoZ1FxZXI0SWVxa2Rw?=
 =?utf-8?B?ZXM4UytneVMrdzRzM0E0Skc2NDQxNFZmVS9FTHRhWHBETnBqMCtrLzRscUdh?=
 =?utf-8?B?UlV6TlNkY3lsZmtWSHN0SDA3ZzFDQVQvT0MvR0l5Q3B6ZTFMR1ZqNVRWTTZU?=
 =?utf-8?B?TEd6WUMyTDQxQy91MkpreXB1NURWZUc3SDhiUk84akFkM2MzNmxIelF4bHZp?=
 =?utf-8?B?YUYzS0orczhyWGNYRnZQY2IycFR3UDBCM1l2VTBMMTBxdEZScFl3N1VWUDdw?=
 =?utf-8?B?bEFxb3p3RFhwT25OSEVvU2I5b2N1N2ErdVJpZ2hYc1lUMVZmWXZjb3k0OXAx?=
 =?utf-8?B?UjMxQzE5RzdSSlR4MWk1WFAwck9RYzRHNzBxSWZHMlpkaEJnLzdzajJqWkww?=
 =?utf-8?B?OWtCdmp5ZmoyKzFUc0N6cEpkWDNURDJoK0RPbTVnSFRhTXBpZURuVHY0VklW?=
 =?utf-8?B?bkRuNXRPWWk5TkN0c0pKdTF5R0Q4N0xQRC91eFBLZXBLMUV4dDlCV0hEYXdX?=
 =?utf-8?B?bUtZVTFaL3A4ZzB5NlRINEQvQmRua0xESS9TZ09LMDF4OFhEOHFkazFHWThB?=
 =?utf-8?B?VGxRZHkyNlNYUTIwYlR3R29YWG4xcHlmcXp0SWM5cjFibWQ3cjZpRXhvOWJL?=
 =?utf-8?B?bXYvMUJaam5FaFVJSzl0eEtnSGVtUUNidmxZbGNqdUlwcmFBckVMQmJaMERC?=
 =?utf-8?B?Y0JVd1FNek9jc084RE41VkJoMkVCYkpZUnZEQTFpYTE0RWNjMTZNeHYrSXUy?=
 =?utf-8?B?UmtlcDJRL2RvRG9iSldvNWZENlJjOWdLWU40cW5BRUQ1MmsxNXJjOTBJU3A3?=
 =?utf-8?B?aEYwOFhJZ2tWL25ablNwK0haeXdaemdWV0hiTUZUc2NwV3pmWDdGTEE4aFJQ?=
 =?utf-8?B?TjBLMnNLWGVLN0xxWHMxVFcyOEtubGo5aW1pOUNDdWk2c3B2bXhIeFBlR3Mv?=
 =?utf-8?B?ZkxRaHd3M1lMd1dvOC8xRE9oeVM3QjU0Y3NBUktHVWRVeXRaZVMyY0VVNHhN?=
 =?utf-8?B?TFJybThzS1hpRW9xT2xKcS8rNThuQWVGOHNxcGtpeWpGSlNkZTJtRWJYbWx3?=
 =?utf-8?B?YWY2b3ZwZklqYUNtSUtjMklmaGhZcStZS3VoNlozK29BcjhuWklkUnl4dU9X?=
 =?utf-8?B?WGM5TnVMZzdyVDBhRGJ4Z2cyNFZOa1pHRTNhK3ZXVnZjSzZobTlLWTRCZ01F?=
 =?utf-8?B?bjV3Ylp6TkR3ajBKR0lFVVRSejBhcDBDbWpNZ0pOd1d4VkpnZmd2RWU3ckt3?=
 =?utf-8?B?RXhSQlNWcTdWQ3BtSXp2UnJXeVpsS1RYa1dvSk02NWxhYldNZmI5M0sxcHMw?=
 =?utf-8?B?Lzl4eGMzdURzcUtwemF3QVVjdHFGbXpFZUllRUd1bUVFbzI4NzJtc2QwbG9F?=
 =?utf-8?B?NWMxeGdZajIvRlJ0WjRpREgvbkJTSVZxT3JITExUT1JpTzMwcElqSWpQQTlv?=
 =?utf-8?B?NGlMTkpmaW1DdXhNMEpVQXJmUFJkbFJWNXV1c29aMGd5WkdBa3VoU2JsYStK?=
 =?utf-8?B?SUU3YW0xYzZWbmFzU1NjRXFhbzZtODZobU1nTUE3eG5MNHZDeW1nWEhOWmln?=
 =?utf-8?B?Um9tZjRzRjk5emtPRzNXZFdHV3dDWGJUT01xd1dBQVVNSjhpMHhLMVJSMGNl?=
 =?utf-8?B?YlFQNTRrL1FPVTVOZ3JhcHl5NitFZjlQYXJKdUNXc21nZEN4eHFEVnRPemVH?=
 =?utf-8?Q?NU93SUx7f23609EG9GIFedbDBXPdzUs3Lv2kCZr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09df3434-6121-4df1-c72f-08d99207dbe4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 07:21:10.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4SfCnswNhUVSLQ8xbJ8sK7x2UmQFEkVUNQVWJz84jEmF40oFOWocCDaiKXop/KrRi2XDTh/EBhHuDg0pl3xli90CUfJSDDIJFe+GRntHus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5776
X-OriginatorOrg: citrix.com

On 18/10/2021 07:44, Jan Beulich wrote:
> I recall checking that "r" would still have a user, but when doing so I
> failed to recognize that all uses are inside a CONFIG_HVM conditional
> section.
>
> Fixes: 9f4f20b27b07 ("x86/shadow: adjust some shadow_set_l<N>e() callers")
> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

