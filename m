Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032963BBB71
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 12:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150081.277550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0M5l-0001jx-BM; Mon, 05 Jul 2021 10:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150081.277550; Mon, 05 Jul 2021 10:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0M5l-0001gm-7N; Mon, 05 Jul 2021 10:44:45 +0000
Received: by outflank-mailman (input) for mailman id 150081;
 Mon, 05 Jul 2021 10:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0M5j-0001gg-6O
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 10:44:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00a3a1dc-dd7e-11eb-8443-12813bfff9fa;
 Mon, 05 Jul 2021 10:44:41 +0000 (UTC)
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
X-Inumbo-ID: 00a3a1dc-dd7e-11eb-8443-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625481881;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WZgoO/N88GXBS4EXddYYKtNt5r8CubHfiMkmIG34IQY=;
  b=SaWXqiEL28e7a/+9ak4td8Ro4K62K+cyS6h4aP/+WryIxolDTIhnNlQ0
   aFcrjhilXcXP6kZO2iZDEjmIcpOINAeF7BaBE9vCAthXDPhHLVJclROUv
   ha9hOcnp3SWJbYZjodQRRoRPTiwlf2S5vvQsvR9lj5Ly1RH1nkaJ7O9TQ
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aZGOkHAP65Z7TLCZ3y+92o3HukE3WNTpIBNfCSoUw6t4JPqkbXpXj+Sh7L2/Po50EsxSlkfn/V
 FXOM1GvEbbv2pX53raBYmzIiVXKuYktWfD29DxG1zE+jai+rQCivSgeiIgZJ6LPmyAuZRWudU1
 ADGIVz8P0+MNQH5R1yyHY2RVNX/eVkNkQuwbPrO37FIpk2MEcQMbfZOhtxbivIxB2Ihluet55G
 kwGOJPhllk+VLEqR34mfasj2I6n31WVyeIaQ2ghu+/J7soiFsLxSIc9d0GGdGKV440sFpv2tSa
 fPY=
X-SBRS: 5.1
X-MesageID: 47574651
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YYfz4a4to6hCpMw4nQPXwSOBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXZVoMkmsiqKdhrNhQYtKPTOWxVdASbsN0WKM+UyZJ8STzJ876U
 4kSdkFNDSSNykIsS+Z2njALz9I+rDum8rJ9ISuukuFDzsaD52Ihz0JejpzeXcGIjWua6BJdq
 Z0qvA33AZJLh8sH7WG7zQ+LqT+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+uemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lgdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxxr5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjz0C3abFuLYO5kLZvuH+8SPw7bWXHAcEcYa
 hT5fjnlbRrmQjwVQGegoEHq+bcLEjaHX+9MwM/U4KuomFrdUtCvjwlLfok7z89HaIGOu15Dt
 v/Q9JVfZF1P4UrhPFGdao8qfXeMB2FffuaChPtHb2gLtBeB07w
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47574651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqsGZoKNrtJELy6wMxAjFx4GZm3e1vwXRuVHc/Ouz6u8RhfXbfI5fsEidk209of5Dg+lsFhrRqdPi1XvZqviHzGkk56DXy0ELXpDQkcXIDv7D7lxDtqpuRqte8UnfBmWp+k2vPhk4lCq9f75UNAcY0JhL5oEaXJxUVa0/0koUIfPK2ElyKcxB2F8m1d5xeSIeJoMz3Ljwo7TRXsyoO3/yn6rrb6r0NmlxnWMvHJ5vWc0MzNkaJdLg/+xd3yapgx8HVJOe4hIY4XTtkyZhkFgawXACkLfUMlx2PWbL155Jc1454nj4XpzmB52+ZxrIRHksxgRo1WxolW/2IACFZBG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZgoO/N88GXBS4EXddYYKtNt5r8CubHfiMkmIG34IQY=;
 b=TA0auydDUJTXLmMaGS4kSlxN+kgf5164FH3TPFDvNyzXohjVMPgI4Gk2L+hdwQ01TW5AZu1HgxbTHct4u7lhZi+aqbfEjduRQ3VUOZHPE2GoHycrOAuHdPN+3RBIC0k+rDJm6wbdnQXkL9IehhfzJojLK3WxDjr5BIJcuZSfr9LeB30xo4AqFiwdqLneE5cbvaWz9bjLqtwvFhRzTPZKtGOR0/oh3aesHqw6htWhR1JDAvyWQaHzAz1rfx5CyKuEdOWRLdQ+3xhD2sKgfYaXAcEN8H2a9XfZoHxMEz7tHnO1yDbK0GxhYKNjEixhrroBEuOLSN5irihBRCYBEYuPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZgoO/N88GXBS4EXddYYKtNt5r8CubHfiMkmIG34IQY=;
 b=Uwp9rmKeAJUGnTBTckYrKyVyi29D1aaCIaUc3N0GOLOlVZnQsjlSo4W4TPCf8rZtIBtuDIdtClwWb5sR5FSft5uz7ayF71dvyfYIntHndc4giVGZcmvhBjS8UcF9Bi2zDGYPwLwZRhKGppz1QE5/SyR6lSMi40XOUeVSITsqDAo=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-16-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v20210701 15/40] tools: prepare to allocate saverestore
 arrays once
Message-ID: <644a7a4c-4fab-07be-2e69-2637254de859@citrix.com>
Date: Mon, 5 Jul 2021 11:44:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701095635.15648-16-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0376.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c8151df-3452-4295-17fb-08d93fa1e250
X-MS-TrafficTypeDiagnostic: BY5PR03MB4999:
X-Microsoft-Antispam-PRVS: <BY5PR03MB4999712C2938A9C029098406BA1C9@BY5PR03MB4999.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VK59J1gdmUNYuqZ6grJJ9qufdllN7yyGqBzQYXJdNHoK/Kno47F1O5YSatg4aFKiJZRfY4Hn5QoqAocHnvKkH9/bE+4bAf8nsVecEyPADYYlT7oAocGgw5QNZNK4a9RaBALR/RvQM+/2V9mjkAbF30B9Ebdvy62s6siq1c+L6fVwAd2oKds0Fku2SoGzqa/RqvVFNFrjevZO7JEuydsrzaUzKkcSEWqoCOdpmY8NggZe1Oqx/6npn5K6i2OBOFR5SIUjHqbFm67mrtJf7jYsjIUl3tcDSFc477p734niM8JaIQ+84yLhALKjwMC6mITJtCi2xjCAofP7j6b19jT6qWApKc3jhxk0vBhnQdKl/auedzSu+IYrQ4g5My3Jvnrumae2z5YLUtw+wzH+JuKx7vTi5652+bIqkoeXpG6X2hoeCxym/Su+33irOU78M1y6LlYlXTiK06tMUNiCz4GwX3cvk4lEkikD2ZwrSWtVSsIgA+E9acKcB+YZ7SKytFHCYu929UbHgtr4EhA1YhsWV+Ve/X7/SBm5paYdNr/YZ2Seeux2HB7nQj56PRPC1KfU5gstfe69IZLQbNWaLipZTgc7pT8VaSYInWQq72JkUdMLPdhxx0dFvkWiRxPb53bZF6gKJC+zGW1a2xu++WbtiBJz5rOGps4a6wyI/GzWPUBD1WrLM9AdS9fQryQLiGPhKh/3lg3lDv4YujGEn0wA8wFGyB5rB4vzT7De0zdC8Zw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(16576012)(31696002)(2616005)(8676002)(86362001)(2906002)(16526019)(36756003)(4326008)(54906003)(8936002)(956004)(53546011)(31686004)(83380400001)(38100700002)(186003)(66946007)(5660300002)(66556008)(66476007)(26005)(478600001)(6666004)(316002)(4001150100001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czVCQUdRSkFaSFl4UHhlTzJVMWI4dnh2UGJqeHFHTUZDN1pNQlVicmZ0K2RC?=
 =?utf-8?B?ZVg3cHh2cjh2cUY3bUN1TTFrN1pQZHFzRFFaWkZDcUxxazNwcW1oRDBBWW9m?=
 =?utf-8?B?R1MvaEJqb2tXdENEaDZKcjZERXNkMTdCMUlBQ20yblpIYmUzaGV5MTJTdXVl?=
 =?utf-8?B?L1hlUGN2TXIxakI5RlJyNzZCT283UlEwR0g4dFIvamVOaGYzdHZ3UTFuTDFj?=
 =?utf-8?B?ZVV0d2xET2lScVZKakZaM001cmxqOHpKRFcxWXgzV2xTdHpMVCs4ZzhmSjlq?=
 =?utf-8?B?NlN3bkVNVE02QWF6KzBvTDJPNUkycURETWdhODRuSEdWcW8rc09VRjF0bEdL?=
 =?utf-8?B?NTIwQVlxdFErUjV0dkxHd3EwSTdjSStldEdOSlVxelh0eml2ZTJOaHJQbC80?=
 =?utf-8?B?L0pwVjd6UFdCaWJEYmhzSHdCZG1POVM0SVQ0RG5ydGZUNFV1bUJzRjB4ckRO?=
 =?utf-8?B?OE82RFcwUmFpbTRZOHhZS1VCa2grM3VQOTZkR3kxKzE5SEc4MTV1NmVUN3NU?=
 =?utf-8?B?bjJNZDJGaDB2SUM4c1pEV2NYMXRNcHYxd1VWOEs5Nzg3ZWc4ZTZKcWdQaGUz?=
 =?utf-8?B?RVBqTVJnU09NOTkycHIzSmtWSE9LUlVvZWVpT2p5OEx0VitLWU5BYm9SZzNy?=
 =?utf-8?B?eWNobW94clVQblBTTll5b0FoMjJ1cFhUTDFjSzF6QnBJcDlnNGIrVnhSdWxl?=
 =?utf-8?B?bEVTODUvY2xSbVhsN3NDay9JN0lZMUM5NGRyU0dRM0gzeGxTSmZrVmpHZWg3?=
 =?utf-8?B?aitzL3ljby8zQ2dTT2cxY2ZINmhlS0xyYXAzam9uYmFPMVBDZzBPLzVNYlZz?=
 =?utf-8?B?NG9jNW8rWUhtRUV3a0VCZndQa3NZR2VHN3dFeTBNUmZScHdwa05XNEJOVlJw?=
 =?utf-8?B?ck9BeHNpalkxb1hPcUx3Skx6Skd4akRabm9UZUlUckorNG11M25TejJvaURx?=
 =?utf-8?B?QllGS1NEM2FFdzRhYTQ2a2NIU3pXbmpKRm5tMTJheVVaS0ZZOG9aS2hLWW5v?=
 =?utf-8?B?dVR4Ky9BeVRPQ2tLU1VtRktSMTg3aGRzMmFJN1N3K3FDamZpTk5xZHpNbjBZ?=
 =?utf-8?B?UXhxa2Q5cmxMcmo2Qk9kZGVrd1FSdDdoR1NlMW5CVmxSVmFOVXVlZHBSZ1pr?=
 =?utf-8?B?QkhKUHMxTkxiRUNIK1AyZ2N0NU9zTDNxTG1qdDVQazdJTGx2MFBxdVVrQ3R2?=
 =?utf-8?B?d2x1MS9YZU1Oa0pPTGVUYzFiUEk5M1VseGdZRXo2MllvU2ttaWZQQUIzVUZM?=
 =?utf-8?B?TTNyMExTV2cwbXBWUFNWRWVyLzVFbGJCWTUxbmsya3k4d2d1VDBOSkwyN05h?=
 =?utf-8?B?ZW1JNlZtZnVRYlFYMnJ5bERUcFJIZDlnVXI0TldPRFJiN0swSHJ1YjhwSjdI?=
 =?utf-8?B?MlVoRVl4a3pRMElTMzcwYmVxazByeWU0YWkzcFdMSG05bHhNK0dzMXFvZXhB?=
 =?utf-8?B?TUNJaFN4aTFYbWlQc3BCUGxBUHhvRys5cWFuNjlZOWEwcUNwWTkwRUFDTUMx?=
 =?utf-8?B?b3hrZDVUUXlTaEIrbnRXdk05QWo0UElvay8vdk83Uk5BcEs1ZVpkakdia0p6?=
 =?utf-8?B?QmM1aGs1K0xGVlNNZkRzaUgxM2orb0xTQ1RLeGtrZDF0cVVINlFWVmV6dGhD?=
 =?utf-8?B?bVY4S3prK1BOVThlcWRydjZlSmRaeTJTOXBRQUR2c3RKb3VQVVFlM1kvUThN?=
 =?utf-8?B?MytqYlhDbU9zNFIwWm4vWXIyclc5WHpnWEtKcU0rVjB1SzNaL1R1bnVHcnE1?=
 =?utf-8?Q?ykTs3epoS7MFISICitlhljIzEVPxZCnwqjMwsL3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8151df-3452-4295-17fb-08d93fa1e250
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 10:44:37.0739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQfLL0Qr7+PU3GC3+KoiKMlSbohfAyy1AODzKxVU6zaxYvUyKBlIwnG4M+yGUZ80ry36Cxqf9CteEHVhWRtp9arhZ6Dpd8+qcD3maDCj4Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4999
X-OriginatorOrg: citrix.com

On 01/07/2021 10:56, Olaf Hering wrote:
> The hotpath 'send_dirty_pages' is supposed to do just one thing: sending.
> The other end 'handle_page_data' is supposed to do just receiving.
>
> But instead both do other costly work like memory allocations and data mo=
ving.
> Do the allocations once, the array sizes are a compiletime constant.
> Avoid unneeded copying of data by receiving data directly into mapped gue=
st memory.

There is a reason why the logic was written that way, which was good at
the time.=C2=A0 It was so valgrind could spot bugs with the memory handling
in these functions (And it did indeed find many bugs during development).

These days, its ASAN is perhaps the preferred tool, but both depend on
dynamic allocations to figure out the actual size of various objects.


I agree that the repeated alloc/free of same-sized memory regions on
each iteration is a waste.=C2=A0 However, if we are going to fix this by
using one-off allocations, then we want to compensate with logic such as
the call to VALGRIND_MAKE_MEM_UNDEFINED() in flush_batch(), and I think
we still need individual allocations to let the tools work properly.

>
> This patch is just prepartion, subsequent changes will populate the array=
s.
>
> Once all changes are applied, migration of a busy HVM domU changes like t=
hat:
>
> Without this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a209=
63b3 xen_testing):
> 2020-10-29 10:23:10.711+0000: xc: show_transfer_rate: 23663128 bytes + 28=
79563 pages in 55.324905335 sec, 203 MiB/sec: Internal error
> 2020-10-29 10:23:35.115+0000: xc: show_transfer_rate: 16829632 bytes + 20=
97552 pages in 24.401179720 sec, 335 MiB/sec: Internal error
> 2020-10-29 10:23:59.436+0000: xc: show_transfer_rate: 16829032 bytes + 20=
97478 pages in 24.319025928 sec, 336 MiB/sec: Internal error
> 2020-10-29 10:24:23.844+0000: xc: show_transfer_rate: 16829024 bytes + 20=
97477 pages in 24.406992500 sec, 335 MiB/sec: Internal error
> 2020-10-29 10:24:48.292+0000: xc: show_transfer_rate: 16828912 bytes + 20=
97463 pages in 24.446489027 sec, 335 MiB/sec: Internal error
> 2020-10-29 10:25:01.816+0000: xc: show_transfer_rate: 16836080 bytes + 20=
98356 pages in 13.447091818 sec, 609 MiB/sec: Internal error
>
> With this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a20963b=
3 xen_unstable):
> 2020-10-28 21:26:05.074+0000: xc: show_transfer_rate: 23663128 bytes + 28=
79563 pages in 52.564054368 sec, 213 MiB/sec: Internal error
> 2020-10-28 21:26:23.527+0000: xc: show_transfer_rate: 16830040 bytes + 20=
97603 pages in 18.450592015 sec, 444 MiB/sec: Internal error
> 2020-10-28 21:26:41.926+0000: xc: show_transfer_rate: 16830944 bytes + 20=
97717 pages in 18.397862306 sec, 445 MiB/sec: Internal error
> 2020-10-28 21:27:00.339+0000: xc: show_transfer_rate: 16829176 bytes + 20=
97498 pages in 18.411973339 sec, 445 MiB/sec: Internal error
> 2020-10-28 21:27:18.643+0000: xc: show_transfer_rate: 16828592 bytes + 20=
97425 pages in 18.303326695 sec, 447 MiB/sec: Internal error
> 2020-10-28 21:27:26.289+0000: xc: show_transfer_rate: 16835952 bytes + 20=
98342 pages in 7.579846749 sec, 1081 MiB/sec: Internal error

These are good numbers, and clearly show that there is some value here,
but shouldn't they be in the series header?=C2=A0 They're not terribly
relevant to this patch specifically.

Also, while I can believe that the first sample is slower than the later
ones (in particular, during the first round, we've got to deal with the
non-RAM regions too and therefore spend more time making hypercalls),
I'm not sure I believe the final sample.=C2=A0 Given the byte/page count, t=
he
substantially smaller elapsed time looks suspicious.

> Note: the performance improvement depends on the used network cards,
> wirespeed and the host:
> - No improvement is expected with a 1G link.
> - Improvement can be seen as shown above on a 10G link.
> - Just a slight improvment can be seen on a 100G link.

Are these observations with an otherwise idle dom0?

Even if CPU time in dom0 wasn't the bottlekneck with a 1G link, the
reduction in CPU time you observe at higher link speeds will still be
making a difference at 1G, and will probably be visible if you perform
multiple concurrent migrations.

~Andrew


