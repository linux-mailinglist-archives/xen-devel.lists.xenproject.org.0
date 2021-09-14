Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E340B5DC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 19:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186968.335708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQC9b-000250-Qp; Tue, 14 Sep 2021 17:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186968.335708; Tue, 14 Sep 2021 17:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQC9b-00022y-Mv; Tue, 14 Sep 2021 17:23:31 +0000
Received: by outflank-mailman (input) for mailman id 186968;
 Tue, 14 Sep 2021 17:23:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5lM=OE=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mQC9a-00022s-EK
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 17:23:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f18c24c1-9f0b-4d65-a525-6b9d5abda0ec;
 Tue, 14 Sep 2021 17:23:28 +0000 (UTC)
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
X-Inumbo-ID: f18c24c1-9f0b-4d65-a525-6b9d5abda0ec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631640208;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Iqz4ShWtEm+izaVvkJ/yoQ+XF0ghWvDCZvP5xa0LC3k=;
  b=fwZqpmEflNSD2RqV+3NKe5fayyTpO9nrcts5MjhzcLIWJCBxNPTYr9ld
   xoQ+VjJzgoXZ8scWROR4EcRFlL2eVWYTVpXMxPypIlTvvbRQNPaoXDMow
   L4qwCs/PBSUOOJSjqTu4C7VXvvms+ESeNwrQGxbfsXhNui9FDabiC8+6L
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: j15wnaleKkOGmh2IjJOYOPSnnww2v0J44Pj/DoL3zsyrETbWGvcd813HssyJMQ3/HK/6ugYRWM
 s5WZ/MIo0OjvJGX2WyS2JeGRFcGZs4CW+DOo49xCIIiYgQsBS4qXeSgdsily26/fcVobR7UAq7
 /hhpcCEBeij2YrFqbWS7AlSRmoDbcvn5yJXOTz9SPDaYdAfmTfFAj1OW8DlZvRrDH8iQGfp9m5
 3Zgb0rdcgCgYQ64RMQGI4Uu9MeGQAOK/b3JKlwHsrwJMqVJJRBvEEAAHUlM8h6KZcIc94BEhaX
 davOt3cy5Z7TVLVSzYYTf5l6
X-SBRS: 5.1
X-MesageID: 52301933
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7r+Z0Km423y4SNhGpAabSpjo5gxQIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNUWzXbv2MZzf0Ktl2YYW/oEgBv57WyoQ2G1dv+CthECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09c02YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I9Gr66xSyAoBK7JueoXXR5JSAtEbJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKyFP
 5NIMmEHgBLofzcXZHslNakCrcT1tnn4fGxTuQK8qv9ii4TU5FMoi+W8WDbPQfSLWsd9jkuev
 njB/WnyHlcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3FOvZsnwWVu/unHsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQIYtrv03Rxsr7
 FyMvt3jCzt+65evGEvIo994sgiO1TgpwX4qPHFfFFZUvIa9+enfnTqUEY0yS/fdYsndXGiqm
 mHU9nBWa6A70JZTv5hX62wrlN5FSnLhdQcz+gyfdWas9AoRiGWNNtHwtASzARqtKu+kori9U
 JoswJP2AAMmV8jleMmxrAMlRu/BCxGtamG0vLKXN8N9nwlBAlb6FWyq3N2bGKuPGpxVEdMOS
 BSI0T69GbcJZCf6BUOJS9vpVqzGMpQM5fy6D6uJP7Kik7BadROd/TEGWKJj9zm2yyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ea5LRmkkACbanCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnkMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:k1zRfqwscXDG6XdgXDu1KrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52301933"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEpLDkPqHRiAd2p0V/W1yHPZSaeP+o+5MdJ77WtjleKV2LYeqf2yxWaYX8Yxc+RYQPO5v5GQvNtwYGAQ26hJj9d8HadAxdwc+Ifebp9qKVOq8pl3wA5/AyD3p4IbNZ4SvhJpbie1uF+O4V2rfhZFXYMgdxWaw0fRPrtuyqQzKs9QP6jcVTnaXeks5UsRYyoUhEw2r9poILYKOWO+oGIbTZmKFkWwmB9h+y7T2k4WDlVVuLRrekK4WTa97J9xzuo0Hrtz65ShkTLqWAi6ZydqruP364AkoWI3+qESEkm3FIgefMiz0WICS5BK/7YifZuT/EU24JuFhOuxI64+E5ROfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kWgIW2qbylxRzv9ou/AJZm+kYnZkcCza3B6+Wu8228Y=;
 b=I2OIIV0KJuoAckAYCP3RLtYMAEDcTW5gMMqKUICg9ljqn6hvXcNCCmVxBTpGJtXxUDkkjDAtKzD8P7VFZBRaREwEFWPxcL1UQP81f7mzytotWmH8sZ6Y9MGmUZBcYBrXmiD88/3pTme5lq0CsbsZVMFyNU+fjhF9yI6qbPTaWza/nFfp99Hn6iYbW6QeZGQeUfLxe0y7vKvCz8QI1nc0Ok8mmtMONxY1nk6DW/JVp4gLGL6Lc26EUndcvIwxmNzBz4MMaLOe8AL6tsxuin6uRXjKXJ+Y6faukJrLn8OKVUBy3lw6Lt64StZLDfBTCPHyz1DaSSNfE5KyOk+p/F1aVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWgIW2qbylxRzv9ou/AJZm+kYnZkcCza3B6+Wu8228Y=;
 b=FpqSsa/4OPM7ofrLHtGJLy+kLbsFy61O2YKdbwQXUGIVHSvkQyiINu4rmL5/uuydBFJTqhT2y+naF6hu7fqlZZpgW2EDCWNd01sb7fTCPmH1kD0U/IQXF/5tYam3WiQ/PAk1X1mrQI9v2hLVGQoe+GNAThqz2VVq28asoRPvtjQ=
To: Kevin Stefanov <kevin.stefanov@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20210914164323.14904-1-kevin.stefanov@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] tools/libxl: Correctly align the ACPI tables
Message-ID: <3ac67acd-3c37-4e82-341a-99d499d84350@citrix.com>
Date: Tue, 14 Sep 2021 18:23:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210914164323.14904-1-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0234.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 174f5a6b-77b1-4ea4-9a75-08d977a45bb0
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB558457250925E2323211E204BADA9@SJ0PR03MB5584.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TC1V0pPMnst/fr4tD7fGU1JlUvgMGqZIlMCobr+iR5pNSYUO8QP6HOvEWjwU/R+2xrN1/X12WP+Y/r8ESDIkJMpekShInP0Fokdk+E8fC+oAPnfhd6YpzZUuK+aGhJ6sSGEQJ2/iLmTQxNbB/nUeZ/X5uzjPk7TTAYj8qNGD3Q1IzUh5M7MEvHZEWV6yrO5/oAuyqZR8eml0lU+hNRM/BcCs9OGQMsOAfVJiFM6rny4WQzmnlBLlsomItQA1v4J6tQ5qpemsxfiD5vU0kmeB2/CslK3Z/LfoBBh5fuwJw/A3x8NL6MYmg/3Jlgz33oZhjgBYfKoDHqonvmIxdF9GYV5+9+e9b1lAnF2GiwF28hxVPmg7XCTsyrfIGHJ3/EwNZesWC0cgbPqta3sboJd4GKf5KwiYQwKu8bN9iH+Wcrsafo/+zYzcHykEvsqNieXmWwUzpZirSdw9KgPU4GoPKCLZXYVUJUcWx7Ggg0vanD8pc4K0xT8muuSVWKFxnYHXdWjvIpFCRrEZysd4FTK3LM5XuUsz9te+VaJFLBBqX/J5DG2T2sUr6MBxxSq4sOFADYaQwL2/USMS8kRMeOXAgoqd4v4RX40UELGEA63nShWPWeOQPTGQjUKTXqBZ9JQi54NBQebCwa7uqte3PXnE631yYs0ckKoVNYjnn5pSjJwDRIL1QsUCwWC2xQOYA+BYYDDCxd+ZbL7u9gEzRw+h0VCKAdplY3L+46Q2sa893Q0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(6486002)(956004)(2616005)(6666004)(8676002)(54906003)(110136005)(83380400001)(16576012)(55236004)(4326008)(66556008)(26005)(31686004)(38100700002)(36756003)(86362001)(5660300002)(53546011)(31696002)(8936002)(2906002)(186003)(478600001)(316002)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDgzZ29SZ3ZOb1dRR2l5Ui9yaDhrNWk5Q0xMYnVZb0Q5QzJpWmdDOWpLdlds?=
 =?utf-8?B?K0xWclRua0pwY01qQWlmaWFSKytDV1RKNURwUVlYZWFMWmk3SWhiOHFSZ0Vq?=
 =?utf-8?B?di9KT1d0bnF1empRNE4wZUFiUkF2NWZqZUgyS3NOQk5hNHpUOXliczNHdWEw?=
 =?utf-8?B?cDBwUGprb0hoUTk0YmhGaCszSVRNNFI5ak5zRnZkVGxvSmF0L1p6SlVjbEg2?=
 =?utf-8?B?NkdzMWM3UTVjR1c0QWMzcUlWK2o4Z3BRZ3EySUdNMHMxOVI1K3FEN1p1U25B?=
 =?utf-8?B?M28xM010K3MvalJENW12enNlK0dYc0c3akVMYkN4SXlpM1Fpd0toSEtKMDI0?=
 =?utf-8?B?cGorNWMzRmRhNXNVTEswVXNDajlINmI1VHFFSURXamJpek9QVUl4eEFmT0xJ?=
 =?utf-8?B?V01QZTEyVVBSYWRQT3NWT0VaY2NtYmhmTVZnTE9ScWdxcGZIakRUVU1DcGVM?=
 =?utf-8?B?c2ErenBqRDFLVjI4S1Z5dWdQOEhKcjhSYlQwV2dxZ1QxVFNZNjBsdkdYcDhW?=
 =?utf-8?B?b0VYcmJJbWh0MGNaZUdWK1hLSGpEc0ZxTDdxTnhuKzdIUXRnZXM2Tnlrcm43?=
 =?utf-8?B?V2xSUVVkNGJCcDR5Z3c0TkpRaGJPWGF3aTlDd0lXb2Qrc1dXWE1LL0l4eUcw?=
 =?utf-8?B?alZDV0tRc2xuTVVyMXJUNnJUdUUxWnREOEV0U2MvcmNSMFRQc0NTVVFwS01a?=
 =?utf-8?B?Yng1Ry8xTlJFVjRhMjJLK1Exc2pyVlRqYmNJOVhiSHc5TU8weWR4OElSVDRt?=
 =?utf-8?B?K1B2N01rSzFzVUw5MmxUaFppaFdNTG53NDM5UjJ3WVZlUTh2WE4wd3dKNGxy?=
 =?utf-8?B?K3pCUFlVZU1IY3VJcW1tQTRtOTkwLzk3SEdZRmYrZlk2RUZOdWNYb3pwMEI3?=
 =?utf-8?B?c2hialROeVRJNkNzVmhGeXMrV0lBc1JOQmV0YjJaVUtXeG91NTJDMjY1RDc0?=
 =?utf-8?B?NEZmOWRXMDFaRk9pSVlPVkg4LytjTjdWWkZUMVBjN0podUNRSUVxSWsvTVpW?=
 =?utf-8?B?TEZDL0wxa2RXeC9VMklwWHdpaUdYV05XdXhMWUtyZ1hjekJsS0lBR3RKQTdH?=
 =?utf-8?B?VnVsVm5hL0lJNC9yVDZFTlZKcmRudlBsODdFSitPdENNNENUd1R5Ni8rV2c5?=
 =?utf-8?B?Y1Q4NDFzOGdJS0lsVjdCNDNCcE9FRzBHT0VTQ1c0Y2hNaFBuaFV3aElHZUdk?=
 =?utf-8?B?UVlXK3NOL3JVcVV2K3ZldlpJekpsRm9KOFZtOFQ1NlAwSzNVYytTTGZ1NTYr?=
 =?utf-8?B?TDdybDZaTnNlUVZLbFU4RzF6dXVEb2lWMmlpM1BGOFgwUjl4UUdjYTlFRjc3?=
 =?utf-8?B?U3B5YXQzTnNmM0lTYnlQNlBVQXkzd3lMMG13YkxvUUhVUG9Ub3FIMVBUdTBq?=
 =?utf-8?B?VitVc1Uva0tOTU93RCtSUmdQbnJkeVZtdFlEaTVVUTI4YmYxZllkSjhRcjJx?=
 =?utf-8?B?TGxZVHN4dzFGaXFtdmVEaENrd2lPWjJYc29ycFJnTGpKNXVUTi9wbGtwVjZk?=
 =?utf-8?B?RUJkTGFTNi9kZmN0QXV2VHUxT0tjMVY3TUdQVGg0TWNlMlh2dkR4clBUZG9y?=
 =?utf-8?B?a1hOMnRXMHozMHZXeGk3V0JMR3VRUXZRb004Q1BLLzI1OXpjZnJkaWRKWjU1?=
 =?utf-8?B?YTdJaEVoaU1icmh1MjFTU3B6WXhlcVo4aVpaLzVGdHpySEVWWmFrWnhsTnhv?=
 =?utf-8?B?cmVkS1dkdU5FeTdmNDFITjJ0Y0kvZlFjY0FySHFkQTRxZ0o4L2dEUEo4RGdG?=
 =?utf-8?Q?GUB3OiNStTMAWzGtoeY/ngTTHuSp71RpYuvCa+C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 174f5a6b-77b1-4ea4-9a75-08d977a45bb0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 17:23:24.8007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /322zbDwGVhk1hu/NXLuwORMWXE4jZ6UWJj0N4Quu3fUoCe3kGnIyggo0Rm1FmOfuod9jUflv/HUrrq5UiHet8O3gHe1w9gZNTFjgXkJWd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5584
X-OriginatorOrg: citrix.com

On 14/09/2021 17:43, Kevin Stefanov wrote:
> The memory allocator currently calculates alignment in libxl's virtual
> address space, rather than guest physical address space. This results
> in the FACS being commonly misaligned.
>
> Furthermore, the allocator has several other bugs.
>
> The opencoded align-up calculation is currently susceptible to a bug
> that occurs in the corner case that the buffer is already aligned to
> begin with. In that case, an align-sized memory hole is introduced.
>
> The while loop is dead logic because its effects are entirely and
> unconditionally overwritten immediately after it.
>
> Rework the memory allocator to align in guest physical address space
> instead of libxl's virtual memory and improve the calculation, drop
> errant extra page in allocated buffer for ACPI tables, and give some
> of the variables better names/types.
>
> Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
> Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
> ---
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
>
> v2: Rewrite completely, to align in guest physical address space

It appears that patchew isn't running properly right now, but ...

> diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x=
86_acpi.c
> index 3eca1c7a9f..8b6dee2e05 100644
> --- a/tools/libs/light/libxl_x86_acpi.c
> +++ b/tools/libs/light/libxl_x86_acpi.c
> @@ -208,10 +201,8 @@ int libxl__dom_load_acpi(libxl__gc *gc,
>      }
> =20
>      /* Calculate how many pages are needed for the tables. */
> -    acpi_pages_num =3D
> -        ((libxl_ctxt.alloc_currp - (unsigned long)acpi_pages)
> -         >> libxl_ctxt.page_shift) +
> -        ((libxl_ctxt.alloc_currp & page_mask) ? 1 : 0);
> +    acpi_pages_num =3D (ALIGN(libxl_ctxt.guest_curr, libxl_ctxt.page_siz=
e) -
> +                      libxl_ctxt.guest_start) >> libxl_ctxt.page_shift;


... this hunk means page_mask lost its only user, and is now a
written-but-not-used variable, which some compilers will warn about.

The fix is easy, and just to drop that local variable too, which is
another 2 lines deleted in the resulting patch.

~Andrew


