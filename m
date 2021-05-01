Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03790370844
	for <lists+xen-devel@lfdr.de>; Sat,  1 May 2021 19:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120979.228692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lctWl-0006xW-LC; Sat, 01 May 2021 17:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120979.228692; Sat, 01 May 2021 17:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lctWl-0006x7-I6; Sat, 01 May 2021 17:35:39 +0000
Received: by outflank-mailman (input) for mailman id 120979;
 Sat, 01 May 2021 17:35:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glZs=J4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lctWj-0006x1-OR
 for xen-devel@lists.xenproject.org; Sat, 01 May 2021 17:35:37 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5452c6a-0fc6-4cc3-ab1e-2d1692657f60;
 Sat, 01 May 2021 17:35:36 +0000 (UTC)
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
X-Inumbo-ID: e5452c6a-0fc6-4cc3-ab1e-2d1692657f60
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619890536;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=X1bpTG260/WsTCQMfuL5R72l9rNdOIn7KJjpKzfclxc=;
  b=fOIxYr+3q1uYsu0o/aJ1zNFw0PdQLcPvA8WnaJJht8PV7oG5o31o0ytF
   rfo/bP1mBzOi851yIqsCQjpzEctWz9ydurvR2+avuZAU1GzkxN+Z3khb6
   Nvf7uRdKqyMB7JLqlEpeHpTCIUg2G5ymxmlia0iHPssEPXay3udqhmRbj
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: K26K9yjlZmgN1Ui2Y+NlLpMjSfAfahAYpxM4H81xzw9ZL3/O3EUj1jP4grsYyihwj6sVaP/Sw/
 ztYqxGkeXAGlyu/FVKZkxUfExgzYoTEEuGMRaZpHD1wuKbUaqgCUeKZC5rzCcLYZyVSLT2U9qb
 bmETza3qiW04+l8Fzv7sQi9kEjgS+uYNAZvlyWJ7zdPHS1N4Ui35Hu6brgsjzr2e96pCY432pH
 NiIK+Gh+ucHhKTV0Wx/NPZO7QibdBuvzTzzitP5aEJdISBa8O4O3JEDbsAsJroai+58apYtCgp
 snM=
X-SBRS: 5.1
X-MesageID: 44386249
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RPjf0ag09XVyN21wyEc4Uy1Ui3BQX0tw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyycFVB7QxQDIJI/Go
 aV6MYvnUvdRV08aMOnCn4ZG9XZr9rQm578JTIADRgr6A6B5AnYlYLSOR6ewxsYTndz0a4vmF
 K16TDRy4eCl7WAyhHa33LO9Jg+orXc4/ZKGcDksLltFhzCkQCtDb4RP4GqnDdwm+237UZvrd
 +kmWZaA+1Wy1f8Ol64ugHs3Q6I6kdf11bHxUWDiXXu5ezVLQhKbfZpvo5SfhvH50dIhrgVu8
 gqrgHpxaZ/Nh/OkD/w4NLFTXhR5y+JiEEvjPIJiDhnWZYeAYUh3LA3xl9fE5sLAUvBmecaOd
 RpZfushsp+TUmXdDTwsGVp3bWXLwwONybDaE0DtsuJ6iNRjXB0wmAJrfZv4EsoxdYTTYJJ6P
 /DNbktvLZSTtUOZaY4P+sZR9CrY1a9DC7kASa3GxDKBasHM3XCp9re56g03vijfNgtwIEpkJ
 rMfVtEvQcJCg7TIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euGTGfSXg1+vHQ4sk3M4n+Yb
 KeKZhWC/jsIS/FAoBSxTDzXJFUND03TNAVgNAmQFiDy/i7ZLHCh6j+SrL+NbDtGTErVifUGX
 0YRgX+I81G8wSFQXn9rB/NW278W0D28J5qeZKqvNQ7+cwoDMlhowIVgVO26oWgMjtZqJE7e0
 N4PffGn8qA1CuL1FeNy18sFgtWD05T7rmleWhNvxU2P0T9dqtGn92efGtVzUaWPxMXdbKSLC
 dv43BMvY6nJZ2Zwi4vT/i9NHiBsncVrHWWC7ARh7OE/sWgXp8jFJ4pVOhQGGzwZlNIsDcvjF
 0GRB4PR0fZGD+ro76iloYoCObWcMQ5phyqL85SoXf2rl6duskre3seU1eVII6qqDdrYwARqk
 x68qcZjrbFsy2oM3EDjOMxN0AJVH6aG4tcDAOOZJxdn5fifA0YdxbPuRWqzzUIPkb6/UQbgW
 LsaQmZY+vCDFZmtndE6ary619vemKBf0V/V2BiveRGZBf7k0c29dXOSru40mOXZFdH+O0bPT
 3fSRY5Iw9lxbmMpVaosQfHMU9j6oQlP+TbArhmTqra3Wm1LpaU0YscGeVPwZpjPNfyk+MCXO
 6FYTWJJDfgB+5B4X3Tml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NAgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso7I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmArhD3I1
 +R7ml0+OrERTKK0dcheukNCFUTTEg383J5+uyeM6XWFQWxbulGuH63KGW0frMYaK+LH9wr31
 xHyuDNu++cbCzj3g/M+RN9P6JV6m6iBfqIPzjkI58/z/WKfXKWgqWr58avjDD4DRuDAn5o+r
 FtRAg3dcRMij4rkYst9DO9I5aH5H4Yrw==
X-IronPort-AV: E=Sophos;i="5.82,266,1613451600"; 
   d="scan'208";a="44386249"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jh+lbZbQpSV53Wn/QYyxw6kJBGFNiGxKEr3F8C49PIIaS/aRByjp8DqgDFiYjZ35s7c+U9jv0c6i2w34/Q7iarjSqK3y4DQ+9UqHnLPoOUNQMsQlp3Rmu1nb5qfPDxo7WKbAaxNgP5qUmNsminKRfyD7k1qltYgULVkOObQ10ZAbIHctPU8D1pEzzxHOwZhGYCA1kTmYsxWVvrH3SxwirzgWdXmGzNdnrhFG5TCxREEumbCCoTOa2uCH89o2Ec8gJ09N8zjTku7Hx0DVUOz3zuvfBiHqdUwB2eD0wZT90/ZolF23FL3b3bTh4hJ6Ij6KJE3b2jXkIIKv5rbLpwjxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/NoANt+taqccTC45DALsn9ApX51yqV1E6cW+kH/+jQ=;
 b=SDuYgtJQvNATio6x905kbwLYsFdqdN0KKiixBzVTgE3OqFbw4fPdQrHb+c6rxHNnv2BqTaZd24PsFM38ci8YOSfDaHGkJe3WGgCC9RP0eeTO7IXfxg9RXMmOr5BjeYrXONJkIsUy0fdctmA/s+g1HXSs1duR/Q9evax5Qp8QCSSQyQmI2HOel05kn9rszRBjsLv5B+BxswJnuxnvwH3ncGAzuNSIqhRIQ1UyoRi4jbCgmWa9xO8/WUtFrwb6/M47b+nhU8UepC9OjLgiUx9SJzKxhedXABkHWtEkCqOPDkpOGQqEK+vxhaIjHwGL1zc/j/SSaakVVebnHNIL9JV9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/NoANt+taqccTC45DALsn9ApX51yqV1E6cW+kH/+jQ=;
 b=om8Nk8SDDbIXWOCwz3XD8i9LUatHV4QL8UxZHFonGbSOHQNP9gICLlm8HiuFV1oaHcuTEZ8Qbiv6L6V1UdxnYtfHtaefXaKoDRbSFO3oWXHDJesZckXFxN+1K9dSTOhGrmH0cDlE1ifSWw5jB/RXd5IYNqxaio+95/OIugDeHrU=
To: Andy Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, David Kaplan <David.Kaplan@amd.com>, David
 Woodhouse <dwmw2@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees
 Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>, xen-devel
	<xen-devel@lists.xenproject.org>
References: <CALCETrXRvhqw0fibE6qom3sDJ+nOa_aEJQeuAjPofh=8h1Cujg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: =?UTF-8?Q?Re=3a_Do_we_need_to_do_anything_about_=22dead_=c2=b5ops?=
 =?UTF-8?B?PyI=?=
Message-ID: <9d70fd98-ca47-47af-b5b1-064435ba77f1@citrix.com>
Date: Sat, 1 May 2021 18:35:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CALCETrXRvhqw0fibE6qom3sDJ+nOa_aEJQeuAjPofh=8h1Cujg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0293.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d35f3e5-1ed3-481d-be04-08d90cc78433
X-MS-TrafficTypeDiagnostic: BYAPR03MB4421:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4421FD466441288E23B070FFBA5D9@BYAPR03MB4421.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pWlSsmCef/o9RZ+LMzcPwNeOrQ1I8CrjXdkTo7tHbOtPhmtdrvn/02RET3785YkmtI+bDjULaWBeuKgerV95ABTwP7Pa/U8rt0yd8b6+tjjNVOgeJ8aJB4pZC6OeG9AwimUv/Y+5Wl5gy6ouHQx6Ok9umUqbmXWUOjYLI8jxMtZezEK7oUDkmgt2r3EHYGgGQV3h2hGOwQwp40kioLmSFP+IPaHjacVO0i1N66MSFkrXyluibM1crrPSn6I5NnDnh5EixaxPNUAEulSBW4r8RNWSofKWyxWDsnMXxrtHTffOs0QSB4Xr45XylHwFEiOA99b+oxph+xERJracEP2uOAn2N8Ta9NcwkHXQA4+WUYpA4gdAGcqSvJJ7MMi6lGMehDcG9bgFIlZ0wfn5gnm5Coz9jGw9XUuBftzwNEjtSZzx1UsX+M3S+ysSxc1TDblsMMMgLb7pf0mJidXB5tl28HNERWIeENgPiASZuZ5fKKjWfYfNDUwkfm164iV7HDOSjMu7mM9Bk7V9xDXfNG0m33gPQJXF4PPrCvdcAb4hZh2ab5RFB20ddr3hfYxt7dhCr4prI2dHFDf5scX10RwMV3NB6aQkyd5vU1AERd3xvGbNmGwIzG+GkG2SpnKENkmogITvZCoSPJdKTVPJ0yLNVRR0E8BFkF1sYzwijeBq+nWZkrcXgWZLwtmIZWFfz9bozDw5zOblvX44/v1NwCRKZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(136003)(346002)(396003)(66476007)(478600001)(31696002)(66574015)(2906002)(2616005)(956004)(66946007)(110136005)(316002)(16576012)(86362001)(66556008)(5660300002)(6486002)(83380400001)(38100700002)(8936002)(16526019)(224303003)(53546011)(36756003)(6666004)(186003)(26005)(31686004)(14023001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UG1IaWVxUi82dTJwbmxUaFJ4ZHlTODBGYTlIcGlhZkorMkUvV1dHbnRKNGx1?=
 =?utf-8?B?OWh3NUpkSklubmFKekZZNUdxQ0oxeHZYL1d4cVQvN2hEM0JnSlQzT0V3MlN1?=
 =?utf-8?B?MWF0cUU3Q0gzM3Y2TFNZUFd5UkJwd3BxK3U4MkYweHdrNDdrSThjSTJwNzQy?=
 =?utf-8?B?U0Y5M0lxR0xYWkpRTmdEVm9ndkZvNnUxZFRCSERNTC9TV3hJZE56N010ME5o?=
 =?utf-8?B?dERKWENEbmhIeEZDc1dUQWxLUDBYSzN4TnhldmNsaDY1Y0ZEODNVVWZhR2py?=
 =?utf-8?B?bmhnekdIWHpkTytjaGplVElJZ0xobnpOZXdDMjkwMlk0MmF6eDRZdGtteUI0?=
 =?utf-8?B?QlJoTWxxYTFOOVhLQ3FDeHpSc2YwaE95UXdmU3krajBHUG9FMUZhalpiU282?=
 =?utf-8?B?dVNnSTloZTRmaS9rSVZ0UDJ1RHVDbUQ0YXBERHpISUw1bkRBdGNjT0g5MjRE?=
 =?utf-8?B?V1RoempVN2VINHREZVA3cWhIYVdwTlVBc1EwekZkUmV0TWE5MUlBK3kxOTJZ?=
 =?utf-8?B?MENqWFE1MzdWTkF4NWRRcnFsYmwvWnlPVCtvZTdrUVVhNGxzRVVGUDJqaXFS?=
 =?utf-8?B?U2M4RXlEc01QN0g5dExXeHFHNjhuSzdKUXJTa2hKSUtnaTN4U1NxaEJUUjhF?=
 =?utf-8?B?dDY0YWpNS091SmZyM1hxa2czdDR0MGZ4YzRhNVJkNVRaeE80eHRacHlQajB5?=
 =?utf-8?B?dVlqaXdWNitYYXRVUFZyT1ROMHNjaWRYTGJDeThNbGtua0I2ejcwZTZDTllR?=
 =?utf-8?B?aUJWUFNJRzBLT1ZoVTM1aHd6U0xzZHJ1RWlHY1M5MGI5UW9kSTJPNnZueVAv?=
 =?utf-8?B?MysyUjlzcFRvSVVZMkpBMm5MNkM4TWdNdm02b0hxMEtNZFRtYklObU03QTZa?=
 =?utf-8?B?c1FCd3BOb2ZMZ0d1ajE5U2ZUL3VJZXJtTVRMZzRzMVREb3pLRmRiTHZLRW5m?=
 =?utf-8?B?cTFEdW1SMk41OFl4Z2tmeUFTQUZCY1NKZ0FkaHVOTWNaS0Fnc0lTYitaZGx3?=
 =?utf-8?B?dWNTSS91R3lHcmZkQ0FkQkFnRU5FZjd4YUV6bXpFNzNYdnBvKytPS205U0Jr?=
 =?utf-8?B?K1pnbzdxZ3Rzd0s2bXhmYnphRUZFc2FOT1VuME1OaEM4cEJjaWE3UjdXQVlQ?=
 =?utf-8?B?SFhoQlRsWkVNSU9hMjh6RHhjV05ocVVJblNNNVVPY0JaTkdXQUtwN1Vvbytr?=
 =?utf-8?B?NTR3bk95TTFONGxqczdmc2JwZlhCa21TQnFhTkl1QnFmTnoyakVnTXhQalFU?=
 =?utf-8?B?QXRrVFFJbStjMVZ0cUt4WjB3cmM5NGluODU2UElzS2dGeUhNVjhDWEJvdEtJ?=
 =?utf-8?B?eUZlZ0xyaUlyWG9Cemx6U0JEQlg2UFovL3kzMlZHemdjZUNUSlpsTHp3QlpX?=
 =?utf-8?B?dk1MZ2o3V2RNVGJKdm56WHVQakJlaTZZRXFuNzBqVGJPYTZGaXdIUlVnbHpE?=
 =?utf-8?B?WlBmVGZlbUtiTE1pWnNycnJPaCtQVG90NGxucnpWWUJIamVUbWJDeVBsVStL?=
 =?utf-8?B?MnZraW9uK1ljczg3b3RPWW40QmdYUDk4UEU0cFJGc1Roczh1bGVBOE5YQXNT?=
 =?utf-8?B?MjJYZU5oaGQ5MDBuK0kvNUt5a0VrSm1iRzdvYVBoVCtQbFIrOUs3dU5GaFla?=
 =?utf-8?B?WW9BaE5EeXl3L242OTBBMkUwb1FOOEZlSlYvaFZKYkQySUp6elVVOXlRdjlG?=
 =?utf-8?B?VktiMkV4aDEvMy9UWXhhZHBhZkViMDJ1MTcrQVZrRDY5Smp1ZmtJSjdOemt3?=
 =?utf-8?Q?0A1Pxh71QHrk+4qwlUtfmMuiktWAPHTaHfCgkaV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d35f3e5-1ed3-481d-be04-08d90cc78433
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 17:35:30.7293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: He9rlxEyrauodPqsq84OxxKOIi9ReIY1nNaYelGjGmMeXpeLQaDxWKYgRg715WRXF9NAr4xgJpMppNEtfBUnbRkr8RbBziJ+/trGEX6oJVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4421
X-OriginatorOrg: citrix.com

On 01/05/2021 17:26, Andy Lutomirski wrote:
> Hi all-
>
> The "I See Dead =C2=B5ops" paper that is all over the Internet right now =
is
> interesting, and I think we should discuss the extent to which we
> should do anything about it.  I think there are two separate issues:
>
> First, should we (try to) flush the =C2=B5op cache across privilege
> boundaries?  I suspect we could find ways to do this, but I don't
> really see the point.  A sufficiently capable attacker (i.e. one who
> can execute their own code in the dangerous speculative window or one
> who can find a capable enough string of gadgets) can put secrets into
> the TLB, various cache levels, etc.  The =C2=B5op cache is a nice piece o=
f
> analysis, but I don't think it's qualitatively different from anything
> else that we don't flush.  Am I wrong?
>
> Second, the authors claim that their attack works across LFENCE.  I
> think that this is what's happening:
>
> load secret into %rax
> lfence
> call/jmp *%rax
>
> As I understand it, on CPUs from all major vendors, the call/jmp will
> gladly fetch before lfence retires, but the address from which it
> fetches will come from the branch predictors, not from the
> speculatively computed value in %rax.

The vendor-provided literature on pipelines (primarily, the optimisation
guides) has the register file down by the execute units, and not near
the frontend.=C2=A0 Letting the frontend have access to the register value =
is
distinctly non-trivial.

> So this is nothing new.  If the
> kernel leaks a secret into the branch predictors, we have already
> mostly lost, although we have a degree of protection from the various
> flushes we do.  In other words, if we do:
>
> load secret into %rax
> <-- non-speculative control flow actually gets here
> lfence
> call/jmp *%rax
>
> then we will train our secret into the predictors but also leak it
> into icache, TLB, etc, and we already lose.  We shouldn't be doing
> this in a way that matters.  But, if we do:
>
> mispredicted branch
> load secret into %rax
> <-- this won't retire because the branch was mispredicted
> lfence
> <-- here we're fetching but not dispatching
> call/jmp *%rax
>
> then the leak does not actually occur unless we already did the
> problematic scenario above.
>
> So my tentative analysis is that no action on Linux's part is required.
>
> What do you all think?

Everything here seems to boil down to managing to encode the secret in
the branch predictor state, then managing to recover it via the uop
cache sidechannel.

It is well known and generally understood that once your secret is in
the branch predictor, YHAL.=C2=A0 Code with that property was broken before
this paper, is still broken after this paper, and needs fixing irrespective=
.

Viewed in these terms, I don't see what security improvement is gained
from trying to flush the uop cache.

I tentatively agree with your conclusion, that no specific action
concerning the uop cache is required.

~Andrew


