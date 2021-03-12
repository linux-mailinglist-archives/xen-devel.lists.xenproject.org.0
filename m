Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18157338EA8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 14:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97107.184269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhjA-0001zi-MM; Fri, 12 Mar 2021 13:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97107.184269; Fri, 12 Mar 2021 13:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhjA-0001zJ-J9; Fri, 12 Mar 2021 13:21:16 +0000
Received: by outflank-mailman (input) for mailman id 97107;
 Fri, 12 Mar 2021 13:21:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qc+n=IK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKhj8-0001zE-B5
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 13:21:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6122797a-ac98-4b88-a168-4377befb6328;
 Fri, 12 Mar 2021 13:21:13 +0000 (UTC)
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
X-Inumbo-ID: 6122797a-ac98-4b88-a168-4377befb6328
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615555273;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OnlCNOh5rRjeah5vtIARS6VgM4v1vqKyOYJaMmmBVIM=;
  b=Hmi7kI6qmgyaxp+MM9XKy599jOyLwqRa15V3t16QHu6u/6ULynM4DuWZ
   LUI8D3gFKXIvC9LL0tJ5DYINWbSyb7pm8LcI2no5KDriJkJkbZRSwxxag
   IXTs5r1glp47BTdrDl1MHzIbJ4r7GaYOKzQhdRNCrXYssGf/mEvaMOBXj
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7RMJFpVsHvucT/6Xk4Jj+cdF4vBWx4Br0IQi4XmV5IbgYEiPnlIwkyvz65BQQz1kZAYVUCnlE2
 2TZ7BlBt4vXfsweUYe2/GjFkA8zCQqAZMGTlLu600vmxqyweruynrgSHgAu55WGTaiWgSECL6T
 Bv43Hmu8K+G6fKEJG0ulLOYHWhW72mE7CQkcfLKoX59/lY8GglGX9/W4QYvyIb0wk1gk5yRTxA
 X/4XSPpixulV/2L8oAIGSmmQ0DkLqxDF+ZmzJRj3uG+XY5a0gA/Z6RJP2M17N8eNh+uI2H2zZH
 dAw=
X-SBRS: 5.2
X-MesageID: 39327003
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/34Uy6uvbI8rSIm9qG7Ie6il7skC24Yji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwTeCBtA50lGJ
 2Aou9OoDS9cXoaB/7LeUUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2sjehlIxqov9n
 WArhzh6syYwoyG4zL/90uW1ZRZn9P91sBObfbjtuE5Iijh4zzYHLhJdKaFuFkO0YeSwXYs1O
 LBuhIxe/l0gkmhBF2dhTvI903e3C0163nkoGXo8kfLhcDiXjo1B45gqOtiA2LkwnEttt19z6
 5Htljx3/E8bWKi7VHAzuPFWB1wmk2/rWBKq591s1VlXZYDc7gUlIQD/SpuYec9NRjn44MqGv
 QGNrC/2N9qdzqhHhXkl1V0zMfpdno+GQrueDl4huWllxJSnHx/0nICwt0eknoq5PsGOuh5zt
 WBHaJymL5USMgKKYp7GecaWMOyTlfAWBTWLQupUBvaPZBCH0iIh4/84b0z6u3vUJsUzKEqkJ
 CEdF9Dr2Y9d2/nFMXm5uwEzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQ2GKTgKr
 WOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+c06So/jMNpbhuoXgAbbuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUdGjqfmD54JJsAInX9+Ue0+E2R8hxmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz3Wug1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmF+OJhp1SdLqAB
 dSzm4Hvp6fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPDdo4nCI0lHIh8Dx/CGRAwuQsCkh
 YDVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7VTFtUudoskrbmABXyGnVPOWhQpGfUsXun
 RBt4skxJaQkzemLmUyxM4iNkdXVWiRCLVaSDieaJ5sgbDtcgFoRWKsjTiX4itDPFbCxgE3vC
 jMPCeUcfbEDh54tmpD2qjnyl9ya16QZll9cHx8rI17G1nXo3ob6574WoODl0+qLncSyOAUNz
 /IJQEfJQ5j3Pib/h+YkjTqLwRt+rweesjmSJgzebDa3X2gbLCSnaYdBvlO4dJOL9b1qNIGVu
 qZZi6YJD71EPkSxgSQv3opURME8UUMoLfN4lnI/WK41HkwDb7uO1xgXagcOMzZwG7+RfqEua
 8JxO4djK+VCCHWZdGHw62MMGIGBRPXvGKsT+Yn7bpTprk/sbNvH5/dFRvEvUs3qykWHYPRrg
 c5Rq8+3ZXqfqlIVOYWczhC/lUomM+URXFb+TDeM6sbRxUVk3TfP9m1+LLGprokP12ZqGLLSC
 2i2hwY282AYjCK2rEbAZ8hOGh6aEAz73J54eOJHregfjmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 IS2aDEo8anMw750hvXpz11P+Zn9HumW9q7BEapFfRT+9K3fXSKja3C2r/+sB7HDR+6YV8fn4
 tLaAg5adlCkCAriMkP6ReJI5aH6n4Noh95+jFollnkx4ig7iP6JCh9QHPkq6QTeyJSPHiOhd
 nC6s6C2h3GkWB45aU=
X-IronPort-AV: E=Sophos;i="5.81,243,1610427600"; 
   d="scan'208";a="39327003"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L63/USCGu03GhYYyBmrLiTeyyCi9fhBREVDdSSa91da0V7KK9XTw50UU3cAznR6jV5Gd60KjYbUdNKCGAf7Xng1QTmNAFnwXTqx9aaL+LAhE0VtgXBOe6YRkUrHgUSS4NlpH3BV3d8Rzp7cqAqj5tYSvq38HEuvJJ2fCYbDeUQc+TDj0NVUGdL99eeDqVuvT7NJGIEaloYknYzIwX3LWKML1HeQf52yHruWypNww0Sh3BtRHIwsbgndlQACMwzC/6H64z3m4fNnWdBg3dPgiBIEFD4jxXqXKhjekPONdD2lT7DZikYiFFx3UYPSDFgfx1zk/VmFfoHEmVsmSrvyLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id1/jmjuQ3je8H9gAGA8ub9JYFHGZHZSJXpkrhIrzFM=;
 b=IFrUGshd+OTx9pDptlF0qPtO0XfXuCTKfRytKzGz/urncSQ1cAvUlZXtbtzV6gw80eVGf+QAXV84dk5+doLGhlBm4cAZYK4Mas3lyEVbFZHHDX1GX0Dg21YUju9Rl0GPGj2wBqIIWU3oweewLj9Soau12Tq7pgex4XbQxloLu/u59W6vCa7C5hUudJLKex8iVABSOzIk+41R47XiecEPMGU2g91X/P9j5zx9sR6Zk7H2hqp10ImCS5DcadlqWfnGNRxXUIS7piLYdapkWU6yH3C4zTjIGjQK3eHInze//QlS6XuPRxhzPkFmCevsm02zM7DYvBfkJlWoP1/jXu5O1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id1/jmjuQ3je8H9gAGA8ub9JYFHGZHZSJXpkrhIrzFM=;
 b=dQv/qmNBomXSGdUUqMecrbAt4zwAFCxDKGIshijSdyexwvLsxryqEipfN6GmeG4xFzD7Kx/cLLLhxxeANp5onB4ph9GhsVjaohOituA6XgoROTB6C4zD3aF+obw7QxS4b+8XPGJ/eO6K5frP3jE86ML8LCijxd/zJEznRtA1CwE=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <1642726c-0134-fb90-164a-e49672f613ff@citrix.com>
 <81539e7d-6b3c-8261-6959-67ef1dc136bf@suse.com>
 <24c07e5f-4ca4-95cd-503d-2dd87579ee5c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f333ac38-5867-7c24-c7a2-dd8a6ca69c11@citrix.com>
Date: Fri, 12 Mar 2021 13:20:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <24c07e5f-4ca4-95cd-503d-2dd87579ee5c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::27) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d37b705-f673-4e96-7141-08d8e559ab58
X-MS-TrafficTypeDiagnostic: BN9PR03MB6187:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR03MB61874CAB9991EBE21226EFD3BA6F9@BN9PR03MB6187.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owZvFfS+AC+VcLCalj/8Y/87/+9joQP83Bup4djwASX2qAPi/gzvYvlojYQCf41AWLiVinYGy9AjnMob2wl1pa7a7OBNWn6p9BGqHYcmxVPX25QgwHC3OpeESsY9xe6S1scps6HnF4QoxnDjV5yH5ZrfmNGiTJ6yfKEuAczZBnwK7d09MgeoIOvW1y5Z4mNQmUNsmuR54acD+//B3ZLd4FSJi55PLyhUsnz8ovAkZRKC7UWi6NHW0tg2GwhAssAmfM3tMuNS6D1fzWWyZzmpl13B5MPtUhSgQK5dMVXUU9uxXjrEtDBQKcOJC7d7LaP0p5WslR4kenAQ0bo2r/ZfZy8O0wXpxy7+V1uaygT3HxkkpQ2WupqfZiTU+cJ9JVXjWdkri5Y62KKnP/N6spa/Qib2Wu04sSUF5VVYVSkV1kTMH08sd5NMWgYrjMaBycyOE2CS5/d61xJSHSOe/8xxNcVSo1LVUQ5RagWM7JRx7w8rfdbEVesBgo/rshxgJ2r1WvmwakttEwjD1d3038NECcAr4+qMUaViU2sM417OmSU1OfM7ZLf+bN8uKD+U7fPLToPQ2+3u1Y0AQRfdZ0iQd23edY+ewa30xkvwk2CMCY0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(66476007)(6486002)(26005)(66556008)(66946007)(53546011)(36756003)(86362001)(956004)(16526019)(316002)(31696002)(54906003)(16576012)(5660300002)(4326008)(186003)(6916009)(8936002)(31686004)(2906002)(478600001)(8676002)(2616005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dlpKMFFkYUVZeGo0ZTdyRmxZZHY0dXFsRzlSQkFxQmlGMm5vQ0lyTFQwMWU1?=
 =?utf-8?B?b2x3cFVoS3pRa0pqOGx0R1JFQ3RSSW1odXVod1ErVkhLNW8vY0dxeC81VGc4?=
 =?utf-8?B?QTkzYTlBTWxvbmY5dlNXMGQ0OGlWaUZxK2tnQ3dDY3VaTjVyNmVJK0dXdFVJ?=
 =?utf-8?B?ZDJ0YkRKRUFkNkxsT1YrWDVDTVowdE5BY1BUVmk2aE9nanZ3OXQ5T2tobW02?=
 =?utf-8?B?aU0zbjdYbWhTYkpDUXdKM0xvbEVVcmNGOHV2Vkxicm1Xd0QvT1Jvci9GUnRV?=
 =?utf-8?B?NDRTM0J1K0tTREtHa0xxQWU0TnpXcld4VXd3clpkUXF5MnBlaXMvSVVoUGRN?=
 =?utf-8?B?N3Rac1ROU1pBMUd1ZmhHakNzVk5va1ozZU5OQWNhVm1sVHpvUmlTa0UrN25R?=
 =?utf-8?B?WDJJVjRKV29RY1NyMTJEcUdKM0ErbGN5bDBvN2hFOEd5MkVEZEJjZTEyYU5O?=
 =?utf-8?B?UThzUFZQeHVQZkpXTUNVNkNYL1o0VlNDUDdreEJRTTYyOE4wTFpUQzVNRkda?=
 =?utf-8?B?WC85eU5YdHFkdm5xWHNJb1F4RW1vbm9ZRU5LazM3WUJZVFJWTHlVb2l0aHgy?=
 =?utf-8?B?UW5UNWw5STRYVEl6dURCQkZOMUdnbjF2TTNEcXg2czFlVWErSXNrZm1Oa3BO?=
 =?utf-8?B?Z3FCOEZUdUgwekRiZkllTEM4NGhqK1BON0VoWlhpNGl4M0orK1huMnZqb1Zp?=
 =?utf-8?B?OGhBWjZVSEx5dWcwWURic25sL0FUZVRIQjg4VUQxc1VyeEIxK2ttNnE3TGE3?=
 =?utf-8?B?L21KKzltUTdabWhlNzBWRkVraFlUNTQ3bzdnZzF1bWxtdCsxRHJUcGc2Q1J3?=
 =?utf-8?B?OE1velg3T0RhNnpIeXVqeUhWRVBKUzQ5ZFlFenk3NU5Kd2xWZk5RNG52VVpx?=
 =?utf-8?B?QjFOWWs1YkhxclkvUDhmZ3hrelovVU9tb0JaaEFyblFjT1hZSTl3bEpvMkEw?=
 =?utf-8?B?c0NpZVcwdk9kUi9MOUllRjJUZjhWbVJVM1Q2TDhnMnVpaGxpa1pMZForZUNV?=
 =?utf-8?B?QWdHeGhkdFBSM2hmUGxoendGY0lqcHMwV1BJbXFLZjR1elc3NmJUdVgvWHlq?=
 =?utf-8?B?UEpzQjhBcHBZdXZQWDlPUzhRN3FTaEhPbmNXN0UxL1IzREJiT2ZPMEtRSkRo?=
 =?utf-8?B?VHJiWkRORHlER3lzRXI4eUFiTzFmZXpzeFF1Zmh0NWZiQW5lY08yTGYrWHJw?=
 =?utf-8?B?VFJlUG5ueTVvMjN0R2FiNVBoS1RvRXVOTFN5RlZkS0d4ZjdiYkdET1RXMWJE?=
 =?utf-8?B?LzBtaTRGc3hTUWFQcjNJZW9BbXNSZXJJMm1DZE5RMEhRcDk1SUYxSlh1OXRp?=
 =?utf-8?B?Z3JkSG9WWmNtclZDbXE3a25UcWZYdnk3Q2hRSHptRndsTkxRSlM0OXFqdktn?=
 =?utf-8?B?RllxTVNXblhZUGxMT0NubDFaK21mQ2hDM0U1UHRxRmZhRm9tUm5idXBTTGlN?=
 =?utf-8?B?SnBrTyt2TnpoZDRuTVB0Ui9SLzFUN2RUUWJtd3U2NVVCZDN2d0ZwbTQwNWJS?=
 =?utf-8?B?NVVPSXJKQnFjZldZK0pvanFwMm14UGZPMEo0eDUxSG9leUJnaW1aVEFzdkd6?=
 =?utf-8?B?MFNxTXVNUTBvT1hnaUhqVi8xcCtqWmxST3NGc3N3ZEhoSm5JNGpVQ2NrSWFH?=
 =?utf-8?B?T3ZxbjVNbDk0bTNCNWwrVWQwZVFJdHI5bEpZT3BOWnJ2WG1nNDVJdHAyM1BD?=
 =?utf-8?B?TmVWa0ZzdW0wM2dDTzU3VGUyS2NQK3hJWk56UlVsb1pJak5McVhCR2NGZEVZ?=
 =?utf-8?Q?bh/YzJzAC5BjJvtA5GgXNligoFP2SmPhSiuotPB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d37b705-f673-4e96-7141-08d8e559ab58
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 13:20:56.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z92gpcFw5G8Y4IWLOx208KKv75IrwpWreFq9LCIi7oGuVRfb4bSncKhWu5SZBpXMa5xk18kFpzNYbZbGnJfj1EE3kdNNCE9zqkNaWW6GMrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6187
X-OriginatorOrg: citrix.com

On 12/03/2021 13:18, Jan Beulich wrote:
> On 12.03.2021 14:08, Jan Beulich wrote:
>> On 12.03.2021 12:32, Andrew Cooper wrote:
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -4059,6 +4059,16 @@ int gnttab_acquire_resource(
>>>      if ( rc )
>>>          goto out;
>>>  
>>> +    /*
>>> +     * Some older toolchains can't spot that vaddrs is non-NULL on
>>> non-error
>>> +     * paths.  Leave some runtime safety.
>>> +     */
>>> +    if ( !vaddrs )
>>> +    {
>>> +        ASSERT_UNREACHABLE();
>>> +        goto out;
>>> +    }
>>> +
>>>      for ( i = 0; i < nr_frames; ++i )
>>>          mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
>> Oh, I didn't realize this. Will add, but did you really mean to
>> have the function return success in this case (on a release
>> build)? I'd be inclined to put it ahead of if "if ( rc )" and
>> set rc (to e.g. -ENODATA) in this case.
> But I think the comment isn't really correct - the problem isn't
> NULL or not, but uninitialized without setting it to NULL. How
> about
>
>     /*
>      * Some older toolchains can't spot that vaddrs won't remain uninitialized
>      * on non-error paths, and hence it needs setting to NULL at the top of the
>      * function.  Leave some runtime safety.
>      */
>
> ?

Yes - that's fine.

~Andrew

