Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03A2387E32
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 19:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129502.243064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj39z-0002em-Nr; Tue, 18 May 2021 17:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129502.243064; Tue, 18 May 2021 17:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj39z-0002ba-KL; Tue, 18 May 2021 17:05:35 +0000
Received: by outflank-mailman (input) for mailman id 129502;
 Tue, 18 May 2021 17:05:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZUbH=KN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lj39x-0002bU-EO
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 17:05:33 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b790591-ac42-436d-aebf-a30301176381;
 Tue, 18 May 2021 17:05:32 +0000 (UTC)
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
X-Inumbo-ID: 9b790591-ac42-436d-aebf-a30301176381
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621357532;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OJlvLfAk82M2YX33XbcmWR+kJiIBCEtJlB5wXHetciM=;
  b=HADsnl+TYpdw8+rg0eidYQgs4Pa3vHTZ6W1KTCtKfaZFpmSuFeZk1grX
   sVumU8Y7ldMx8+ZcbKWTS4J3uQ9NC9k4F0LHMffxw/1YeBc9QZBpanOE2
   nDwTuFiBGlorxLpSstr/TMm4PepcCsc8yy56cvBADjQZAXHXDvfJSzK4B
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7Kbi1QLlQtzngWwhMSkt5sSsH8fJRLwHf4JLwhnKIYfsY3pGJs6UOd93xcjl6jqCEfbnhgr6ax
 Cbmq4ear9ACtoKanH0i3kHcZgoDt94gQKySsIBnOGacn0aAcNfARVGApY/zex3vX/nY4k8AIAK
 4e2tDxlwHmWQKtWzdqmPd+0kL++v5R0cphcuv2KFY60nBk53UpZdq7Ld7elp8zcYO6TP5nuwiH
 ZMBp/t35K+HDhcjqucaRE42ePxLP93B73qIctsZh2JXg7vb1vMQ7lkTkX//TchQNFhGjXyC7R3
 1kw=
X-SBRS: 5.1
X-MesageID: 44167109
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:72aP6aENXTHmcGvupLqEw8eALOsnbusQ8zAXPiFKOHlom6mj/a
 2TdZsguSMc5Ax/ZJhYo6H4BEDiewK/yXcW2+ks1N6ZNWHbUQ2TQr2KhrGSoAEIdReeygdr79
 YFT0EvMrbN5IBB/L3HCdODYrAdKQS8gceVbDvlvg9QpN9RGttd0zs=
X-IronPort-AV: E=Sophos;i="5.82,310,1613451600"; 
   d="scan'208";a="44167109"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gN8rbMcmv2St3Oi4PpzpbOXLaq7bCOsTUZITXDGeh735IlJf6ahGNbvbFiJ9Nvb2xj4WRr0TF00U2DSw1EZSN3wDBSUZxb5M4QT3q/+Blj5Q8aPs3087HGhAaf22YgJaxlx46EjvvhkhFZex2Of3fU9bf350HB7rriU2+7y6fyV3XzK5Q+2c6nOE5rvlyxzRJJ79yPJM2J7BPGe1NcHSli/OQnat93uLwkQeWmfbWsg1vwTnIYUmdUTeOKgGlp4DFp2n/1tOOBgdlYFgLGKoqGqSGdYXBYTJU96vbn3J6VH6o9aQq30qOJg7z6XX3wnwKunaQf1XKapPmbg/mXyCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ez8T/bRyCzQguqJlaEIIOTkIwuzhj9Syc9PpMALLdAE=;
 b=aYxOocdWsyMSeuxqlhcVBL/6dshbBhmiLIG4T9tigWLFvUQ/cJ3qvr4+WSqOPeg6Ewy8rsrC41M0KWrc8VviI2qYXPNTCYb7fd1UBJA7TYsRvUHdfVRYHs1kaLZyfovuXs7Hdtb9H21TwSrl33CVDyB+3xgoJp1aBu4FgYLXeQ1G2ebaHX/R0WG2IOA7Waj8pmDxv2AmXn8Jdg7nMgMKiLVZZbS3ru807O2h60Rp5/mkH2cVKAB29n4Py5wf47GEQv5tdM+JxKAhYM/ZIEVk3a6gWsg68DHSLf11/dxlLgTkJxLkG7NAkIcpmNbNs32mvxGtSgxFIq1iY5M+7ZOuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ez8T/bRyCzQguqJlaEIIOTkIwuzhj9Syc9PpMALLdAE=;
 b=vSdLTo2bQ0t4s47Vt3PR4So+vSJZmkdsDXhGjEncG0cWzWIyNgo4w1H31Sop28bfayEDBkqGdi3x+phYsuqrCBeRoU51/EBpGGgw6pHjTnztf7wh7RoLXv48VWp6AfMaIyGg7gm50VgMr2igNgtduYscxzYMlzkm8ulAs97BDRA=
Subject: Re: [PATCH] tools/libs: guest: Fix Arm build after 8fc4916daf2a
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
References: <20210518170339.29706-1-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6d77f58a-06d6-aadf-0451-b46020169004@citrix.com>
Date: Tue, 18 May 2021 18:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210518170339.29706-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0325.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e679f782-42cc-41f4-156b-08d91a1f22ce
X-MS-TrafficTypeDiagnostic: BYAPR03MB4679:
X-Microsoft-Antispam-PRVS: <BYAPR03MB46793138D3FA9141C2F750ABBA2C9@BYAPR03MB4679.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56C1J0V5Ded9AUADELTN4uGDX3+iVPM3UaZwZYs64yQcDK2yIsC7OYPlse2BxcB0uFXTIqqzfpmjUfCp/GKDC+G2PfUDqVNzRnMYjVgeMu2z0qX8DTcdYGLqBz9OgQ3KAXgsMhxPWe9zQm1um5ulf3+VCoaf+UxNIKZCm0p9kdGmCshvG/JIgM9+12QCGjwRPGuFyZ2EC3+30YPfZIAsuQpGbxb4XUQVptYI7bwH8HHov4JuhNB0G740OULMNovqp7VzQSzfG+Oi2xr97dSwZ0gBrQZ0pUieWT6+g7B/ny/+wCxSPdzIn++N3FEogvLR9QvEyatOnAQQv5VXrq103OzRl4sFWl86U1ZWpl1bID3SZ3wwH6OKEADYgi1D6kJ0ZkmWQeo5ZactGlr2S8zhDu1lsv4PzTEhyL5VCsAl+5DSsid0++azGB4ZUxj+xdh/c3hHth/SqAZlXmefsqRpwIxNaYLtDePczxK4uXxSt7pd8A/Js5qIBIaYvW7Kun5yksvQgwtaa07kfT178nu0XU1rkB5s9D1cPKXF/3Fb3XTh1U8JuhaTfzw3XvmWA2oLYQcw1mCVhqzLXpp7voGkG5MZgwRij6m8xOV9zu2nvLRJn158vgbK4zSS3+lBVr10shw/UE2nkv8G9rVni2qpAc8fgd2COhNLhRQ8QbBAEp0wUlow3Ghu/6kgUI89Cf8h
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(6666004)(8936002)(4326008)(186003)(6486002)(16526019)(31696002)(478600001)(8676002)(316002)(16576012)(54906003)(66946007)(956004)(2616005)(66556008)(66476007)(2906002)(5660300002)(31686004)(86362001)(36756003)(53546011)(38100700002)(26005)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVhMWXkwdGNpSUhycGU3SHFsUThFem9BZzRWVUxDUldGaEdsb0lzMkNwTmtn?=
 =?utf-8?B?eWVJeGlZYUt4UUFZTzBleHd4NlA2L1I4V3l6VE93UGtodklRN1p1MjFXMVU4?=
 =?utf-8?B?OUdqNW1qR1M2UmVWMXRvaFpyUWg3THVMbUpMQU16VTBlMkFxS1RGZ20zSXhL?=
 =?utf-8?B?bmxvaG42WUh2NXZEMHc3SEphT2F5S1RIaHFJUjNPUHl5RWd2bFFuRUJveDdQ?=
 =?utf-8?B?ckdRdmpPbzJaWjNReGd6Y2dqTUVkcHhJTjIyc2NuKzU2UStWeUNCTGZxZzZD?=
 =?utf-8?B?N25WQmJocElMTmdLVTFBVklBL214L3did2dtK1hEZ1RtdEZPUkgzT2VKaVZ5?=
 =?utf-8?B?R1VlKzJRbmhDRTdjNkJPVkpDVWo4TS9ubVdoQ3RUK0hCWE81TnBIeEdxZFVz?=
 =?utf-8?B?R29NdjBscXVTZkdmK2tuRUVKb0RVNFNGRVdwY3QzcWt0WC9CNklHQTdsWjNV?=
 =?utf-8?B?Y1pGNlBneFpBTm9VdlJFM1pLSllZanprazVQN0RwWk1mUnVnRTI3SnhWSEIv?=
 =?utf-8?B?cU05a1g1emxmUGZBckxjWmsyaFl0SFlYSU9ROGQ1QmxMNVhaTGMvUVVIRHpR?=
 =?utf-8?B?SGt4UWN6VEVVdWgwRDZPMFpEeng2cXJxQzg3ejRkb1VtSWFUY1V0L3B0VTBL?=
 =?utf-8?B?SStwNVlzYUhlTzZoQ0h4eVhlQnB2NGM4OHZ1OUwxaktRRjU3TXBreGpvSlhB?=
 =?utf-8?B?NmJ4bm5PTmpENHpiQ0pqbEg0ZUtwSlZoTENHRzNsaldyQ2txTHFqUWpiaUFV?=
 =?utf-8?B?NmdSWEU1MXdjOTZPNlpOcmFzTVQzOU5KWVozdnFaK0NsdTl4MjF5RVVnbFVP?=
 =?utf-8?B?TEtSVjI0MHREb0NQRnFYZ3hYUjlVSE03MEdJNzFLVXozM0M1YW5ISXpENjVo?=
 =?utf-8?B?SlB2TkFxMzZVd1M3SUg2VVpUdElDdkpRR3BGRTNlNjgxQmkybWZHVmxlc2wx?=
 =?utf-8?B?ZHFZbitwYjU1a1hERmpUNGU1eExobWxaNEZQQS94dkU4S2x6ZlRreE5meHJo?=
 =?utf-8?B?L1dLS3FhbEkvWTRuVzJtUlEwbjJvRDZKelk2SFFZTG1ULzk3L1JVNTJjY3Z0?=
 =?utf-8?B?Vkx6Z3kxeDNNZy8rdmg0eFVvUGFCOVYwZ0FhbzB4Sm42REVGUTEyaXJxb2hj?=
 =?utf-8?B?cjdKVmFMOUFZQkZKWVJNSzQxNFh4K2NiTkdocG1GMDd4WEtHOEJ2RWw4TDBY?=
 =?utf-8?B?TDlFQ1V2QzMxSjNDSlBsMUFVQnR2azhiUXVxbXdOQUQrTFFQNXcreGN6dWU0?=
 =?utf-8?B?Q29sUXlGY2lPVjFuUnJEa3dpZnFwUWtMZUpWekxSb0dIanEyRVNZSGthSk4y?=
 =?utf-8?B?WTk5WVlPMHpTaTdDZkwvbFhIVnQrcjNqTWozUDZ6U2s4UnYxRmpCNytUZ1ND?=
 =?utf-8?B?cjdhcXc5OUxqdG56MVpBaFQ0Vjc2Tzh0NHdIZE9jaHpGMDNJRHlVMHBMcGtF?=
 =?utf-8?B?ZFRhaU1EYzZ0OHlNSnBiQnlsWTlRbjVQbmpMMHZOS1BCN1gxd0R6b3NKaVY2?=
 =?utf-8?B?akZhMzZ6cUdsUFdPQ0p2c0VPWTdlcWtmVW93QjdzWkJvcW8vbXBKeU8wWjNo?=
 =?utf-8?B?ZkhRT0FLOWRCMU85dkk3SHp0Nk5ERXlrbFhvdmt0OUpnY1ZIT0Q1cURvWWFW?=
 =?utf-8?B?SVNpYXFIZ2RtdUZWQ1R6bmtJdnVZb1JuTnlvQ0EwZnovOXkrMFlFVEVLL1Z2?=
 =?utf-8?B?YUE0dm5WNWZuTG42amxYSkUrV1Vuby9GNjdBbUlaVHA5Yi94azV0eDlXM0VH?=
 =?utf-8?Q?HpK2axBHOPhIHG0WZwjYikaBdezt3gLEVQ9nzKY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e679f782-42cc-41f4-156b-08d91a1f22ce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 17:05:28.3103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SGFaCFLmJuTwUfIn+8rhwRh4/Of018NvuVlEzeEl1zOSbRErmdfyoJRFKTbusNDIjsRXlsboMVqkWmaNEWlKsEOdJuDW0de/b+fMIu70Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4679
X-OriginatorOrg: citrix.com

On 18/05/2021 18:03, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> Gitlab CI spotted an issue when building the tools Arm:
>
> xg_dom_arm.c: In function 'meminit':
> xg_dom_arm.c:401:50: error: passing argument 3 of 'set_mode' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>   401 |     rc = set_mode(dom->xch, dom->guest_domid, dom->guest_type);
>       |                                               ~~~^~~~~~~~~~~~
>
> This is because the const was not propagated in the Arm code. Fix it
> by constifying the 3rd parameter of set_mode().
>
> Fixes: 8fc4916daf2a ("tools/libs: guest: Use const whenever we point to literal strings")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

