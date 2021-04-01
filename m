Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E653516B1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 18:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104648.200437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS099-0001BH-4G; Thu, 01 Apr 2021 16:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104648.200437; Thu, 01 Apr 2021 16:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS099-0001Ar-0i; Thu, 01 Apr 2021 16:26:15 +0000
Received: by outflank-mailman (input) for mailman id 104648;
 Thu, 01 Apr 2021 16:26:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lS098-0001Am-4o
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 16:26:14 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2301e438-3160-4975-af43-1ebefbb07aec;
 Thu, 01 Apr 2021 16:26:12 +0000 (UTC)
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
X-Inumbo-ID: 2301e438-3160-4975-af43-1ebefbb07aec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617294372;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gmd06rszaos66SwKUdTiuscoqRXiPX4bsyvnbVAgmlA=;
  b=fWHMXDrva/CH8SH4R4JKZVL3ztCE+piAc/RHxyGDxiXIKtcZMdPblIRX
   Te2FQrW16ffAwvuxljffl/DArqZ2/TTzuEg+9+xcoiCs6WrGsMu+CJpXf
   xNuaGsZys7ymNHxN12mYeHu+yxsG+weyYK50QEXYXNgdwkKEVXC0Bw0wP
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Lvmv5ILm1I3SOHhi9i8pbEIFJUjJqrGIAT1jPjGtKUjwr2vmLn8tMVIoPeCF6LSCn/n7A9doc+
 XmBwKws5/Km+B4YNgrgrz4HcrwPa1vjfzoD3RdJpqt9KYk7K+WdsMn9dxUQKNyOBc3c+Bv1RxT
 C57SZInRTRS5y1TDm+jR2nSJneF+0IgJGnWPjzTRz+ODKEjNS2bIWXE9GlSeQDZiF9uoacssTk
 fp4GY90bsqK9xXUBHSFhazn/AbtXKtS2F6nq96woFCk7sVo7GQabbWb7xlh1FrVmQ/vucJanei
 wZE=
X-SBRS: 5.2
X-MesageID: 41095869
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DcgKqKPX6EE/pMBcT3Hw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZqQHIMxbVstRQ3a
 IIScNDIfX7B1RikILe6A63D94vzLC8gdiVrM3ZyGpgShwvTqlm4RtwBArzKDwMeCBtA50lGJ
 2Aovddrz27dngNKui9DH8JX+/Mzue73q7OSxgAGhIh9U2ynSqlgYSKWCSw8zU/d3d0wbkk+X
 XYiACR3Mmemtyy1xO07R620714g93ko+EjOOWtjYwvJizomkKUYu1aKsS/lRQUhM3q11owit
 nLpH4bTolOwlfcZHu8rxeo+ySI6kdI11bYxVWVgWTurKXCLVpUZfZpvo5XfgDU7EAtprhHoc
 R29liEvJlaBw6oplWf2/H0VgpnnkfxgX0unf97tQ07baIiaaRcpYFawUVNEJ1oJlOZ1KkbFo
 BVbP301bJzSxe3fnrZtm5gzJiHRXIoBCqLRUAEp4i8zyVWtGoR9TpW+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqMDHDXSx6kChPdHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHRVqHA1YECrLcGVxpVE/lTsTQyGLHXQ4/Abw6I8lqz3RbLtPyHGYkspidGcr/IWBdCeVO
 20PJ5QHv//PWrjEYtExGTFKtpvAEhbdPdQlscwWlqIrM6OAJbtrPbnfPHaI6eoETtMYBK8Pl
 IzGBzIYOlQ5EGiXXH1xDLLXWn2R0D59ZVsVKzT/+0ZzpkRJpRB2zJlzGiR14WuE3lvo6Y2dE
 xxLPfMiaWgv1S7+m7O8iFuIRpSDkFc5b36SHNUrQoWM0f5GIxz++m3SCR35j+qNxV/R8TZHE
 p0vFJs45+6KJSW2GQ/Ed69K3mbiHESvXqOSJ8ZlsS4lIPYU6J9KqxjdL16FA3NGRAwpB1jr3
 1bbhQYAmXFECn1tKmjhJsIJe3WetVmmj23KcpMpX+3jzTamegfAl8gGx+nS4q+nBsnTTs8vC
 wKz4YvxJ673QuJBUR6quIiK1FIYHmQG9t9fXm4TbQRvKvqdgF2RXqNnhqAhXgICybX3k0Pm2
 3sKjCVc/nXAlxb/mtVyLru7UkcTBTgQ2tgLn99qoFzDmLApzJ61vKKfLO61y+LZkIF2fx1Ck
 CyXRICZgdvzcuwzhibhXKLEmgn3IwnOoXmfcAeWqCW3nOmM4uTk64aW/dS4ZZ+Ldjr9usGS/
 iWdQPQLDT2DYoSqnuoj2dgPCl/s38/l/z0nBXj8WijxXY6RePIP04OfcBpH/iMq2z/A/qY2p
 Rwitw4+eO2L2Xqc9aDjaXadSRKJB/fqXO/JttY4Kx8rOY3rv9+DpPbWTzH2DVc0BIyINz9mU
 keTK54iYqxT7NHbogXYWZU71ApnNOAIA83qQTwGPY5ZkxogHnBPd+FioC44YYHEwmEvk/3Nl
 ae+SEGoKuAUCuHyLIAC6U/ZW5Rc1Mx7Xx+/OWEM43cYT/aBt1r7R6/KDu6drQYVa2OXbMXpR
 x+68uTn+CWezHjsTqgzwdTM+ZL6SK/Xci2AAiQAuZG/NyxJESUjsKRkbCOpSayTSH+dl8Rio
 JEf1EBd8hPijEti4sszyi5I5aH0n4Ngh9Z+jFollnkx4ig7iPaBCh9QHLkvqk=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="41095869"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmR8a8zhWxHJ0XXCL6gN5fIyHVyxa9DHR6UNOtAnK/zhv+jg5uuAdct4Zrzkmsd3i1x3vxlD5O9YnX6Sb/0zsFBZT2IxjzlbG+iHldD3W7d0Yd5Xk+l9mRixqbXyTkI3hdm0sFJJQ/OkdafYmvl37Nad35UcYxTVuwHlQHugKMdrz0gVxUf3KXJ0YiJoUWKq3R7RLVEdRQk3bEkCdFeCPp1W7VHgIo6pQWalIIlQCDy7F2QXSe5jZhObKTCMZsBnbDN0oOrcMs/yy6NyYqvsRNDBSFNb5oA21Q/YdujGT2eFMYnwnTKGugD/YbA6EvrUEjH6Lp6DM3+MHSgpXq98qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmd06rszaos66SwKUdTiuscoqRXiPX4bsyvnbVAgmlA=;
 b=N+7RHLs8EYm9Gmk5HBC9bPO357Tusl1U1DhQE+aFRjqs7hshpXAMTgRRi9uFJntNFctGq5LoTO4RrUWcR/Q/c0HKzGHRr2+rfKuYtz8kHvlya9hDuPhoRvdASTQQlMcynlV1sWknpnyVF3umEMSR9Xa7CmV2mOyC4GEfLfTZZPPduHsISDKNoa/FZPYEYNlnMKR1DR691QJ8vtpng0zENERBgcb6xK4kHU2RGnKfPK1cZHreeSwaaIYFW6yfIA3QNu+5XvtfX8nkB5yZ0XAsUxOL/oSkXsCdPwdJABEu3+6Ri6f7k4lVH6eIXfR5dOuTuyBTY3dMRIiPxIv3hnXCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmd06rszaos66SwKUdTiuscoqRXiPX4bsyvnbVAgmlA=;
 b=n8/lQMkQcS792jeJAtPip3mtrN6A8V9MHbaQWjRCnPimfsZ2Q9bqR4oAaX1KhxKG27iVHDvMjCGjXGj1d/4b9ul0gVG0ytPYsNF+r3hW1Zm5W/A/aAfRHGaEe/fA3JtF3FfqgecSmER4wXbunF7OeUDriIThM75SHlxXLHmmSUs=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-16-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 15/21] libs/guest: obtain a compatible cpu policy from two
 input ones
Message-ID: <d24e9172-3939-44c3-e5f8-08b76ab23c17@citrix.com>
Date: Thu, 1 Apr 2021 17:26:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-16-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0498.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::17) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 743c7773-c844-4f44-e715-08d8f52adb0e
X-MS-TrafficTypeDiagnostic: BN8PR03MB5140:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB5140F8F74747B2B8B3E26278BA7B9@BN8PR03MB5140.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wMb4XbMwZCN3LDdaYBxHZ7rPG+U1FPpk23XKbcb+3JD/5dwO7cajk5j3TvAncurVXQRjvnS2+UnGwfeF2U+rIUG8dGjcGxKY9P9tJqGoxbnpEt8Ko5thAMvu2eXbVL45kGg8Z1hSQPWMDBX+EYYXO1P3vyEjcVaru7o/agsFVwVm2MjT2DVpG3UvhumngMY2xHRBVuSP/2l5Am272mGZ3KenHewfENDy7bq6CeWmV5nXKxprXk+5WTEUHFmpCW5ydgjjErSe5ei8OVN//M/pydl8HNKtkpGMBYvrik9OBaIlGkhRXRqCI+5r2mSF3yqJCuQVYN2yXxytTowZMehV47WruTBzDKE7kshgX1w7ORoG8eQ/oExu4ntmETeVJMkc/7ryBh7oVLfQEejYgO9xbxcRW9xy3K708pMKwApgI3SB0KY69aBfgcW1yxcTD2fGqom6jQDcwdzmRwb5uab5TUevUqcRMAlsNjj3szLgckAhm1dghTxQOI+KzD25po799N4r5Qey2ujsivBsaDxLpur/uz6WbxjJUrg5CU1xRCx/2lnYDwFlKMngYAa/bXVt33OtuRcQM29fN4kT68mHNwQ5q9hjbg7rEQpcQbzJZa8Js06JjKs6nzbX3Q7K5M4eXMQGG6uh0kE5Mhz5l9asPABZSHDp/+n9p+qtE5sVYn49+ATizVZMRo9PDiya0ygR4Q+8ajnlZ5Qd77tx7T9GNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(8676002)(31686004)(8936002)(31696002)(6666004)(2616005)(186003)(956004)(54906003)(107886003)(4744005)(16526019)(26005)(83380400001)(6486002)(36756003)(86362001)(66946007)(316002)(478600001)(4326008)(16576012)(38100700001)(53546011)(66556008)(66476007)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WWJaeG53VEQ0dUdybXRTbEFhRDM4eW42SGFXcDg1bmR5RUNlckc1QUJGdTRN?=
 =?utf-8?B?SEdCOFJKZ0R2NlBGSVlKN3phb3l5VDlmaTdkQ01RMWhYcGowWCtSbC9WWFRx?=
 =?utf-8?B?VmlTMFlHZk9GVFRVeEtjWFlFV1plRUQzUnNCTGV3L2F1UFZpVWhrVXZtam1j?=
 =?utf-8?B?b1YvbXdwT0taSHdSamZNU2NYaVdyUWNLZVliNlh3WWFpeWpuVXB3M1FqZzhS?=
 =?utf-8?B?LytwbmdkZ0VIZUVrTTZDRkFNNEZRR0xsNmVlYzBmVXBxek95a1lDT090dStu?=
 =?utf-8?B?WmRNSk5Sc1NKb3dYKytJZ1lUYTcwS25aSVg0ZStNTEJJK3A4VGhUZytkNnZP?=
 =?utf-8?B?NG01Q0ZZRXkxWm5qc0ppdGE2ejZWQmVxUWJNVkI0TXgxRUJ5WDN1Y21CUlRC?=
 =?utf-8?B?bi9kV3AzZFFVYW5FaDIzU3hTZHlOMkhCN1dHaUxmQ21WQVZYaHZ2Y2ZKbUZn?=
 =?utf-8?B?cFNFWEhMbEh6VWttd2xQdnpxd1lINHZtc01WNkJ1bUgxaUNJQ0FVNkVwaU1l?=
 =?utf-8?B?VUlrY2MrdXBCd0hmVTFHSkJhNlJWMURLYkhicTEwZENpcHNTZmFIdFZGdEpz?=
 =?utf-8?B?MU1oc1EwSG9HSm55YWY2ckVzN0k1bnFHNHY0TWMzeUFxM0JKT0pXVjk5WWtn?=
 =?utf-8?B?Umo5a0hBbGdmZzIyU2tWejBkeGpsY25pdnYzZW5iTUwyVGlqTWp2aDRCeTZ2?=
 =?utf-8?B?Y3pUaW9DcWFaVFlObnc2VUhpSWtOdWFGN2M0UXZHWFZJMnZkMTlManZ0bUt0?=
 =?utf-8?B?eDhFbU5yYVNpSUxoRUNqeWRUZXVhZDFuL29SalpmK2IxRThxOE5POEtNYkU1?=
 =?utf-8?B?QlkwbjlDL2pTSjhmbSszTklnTFVLMDdDRXZETno3akhCZG03RzBadmhBQ0Ry?=
 =?utf-8?B?d0ppalBpOGtqMTdZVjMrUmx6amN5Q2ZZUTJrbVZ2N05Oa1RKdTNDb2hUL2JR?=
 =?utf-8?B?ZFpkZjRNbmxnREpGV29xaHZkNnFhdjJOVWZWSzVqeFFuRVVRM0UzU3ZIaFRU?=
 =?utf-8?B?c3VnbFJhZ1ROb3BkendIMFVVMzRobEtUUjNBM0h6Ymp5aW1JemJFOGUrT2Ja?=
 =?utf-8?B?ZkNZbHh0ZFpKQ0hHc3VrNTdUcjdVT2V5aUZwNVlvMlF0VWNiUGtVM3RETms1?=
 =?utf-8?B?Z2poUjVXRjFyWWNWa0VwMXFVdC95YTVWQ25YM1Z2UU5hTWVwaHhiQ01wSUNU?=
 =?utf-8?B?QlJJcUtIcUxzajA1WFA5UzBQMmpRRHN6eTAweGwvOUFWUmZLOG16ZmRJalQ1?=
 =?utf-8?B?T1Y0dHVkU0VnbU5DS0tYOHlxUnMyblBTZktDOUZLZ1VSdFlReDVnQnNsZ0Fj?=
 =?utf-8?B?a1lvalFGMVh6RmRIUjdHa0gxdml2d0xPMzl2OElnUlF5TDIzQzFlU29BazVr?=
 =?utf-8?B?R1d6U1hjK2p3S29RalZLSDh1ZHFMRFV4VXNRODBHVkR2RWpqcHJRdlp2UVBv?=
 =?utf-8?B?Sy8zNzlaWWMxVmxxODVSbk1sbThOalpwMGFvaDJhZHQxMnVuS2pMOXVkenhE?=
 =?utf-8?B?dHVhVi81RlhuSXBUd3d0VG04eks5Z0RkclVCQTdFU0pKamNvaHpUYnFNRDlS?=
 =?utf-8?B?QnpIVFdlRzhSNXpRVExFZ1Z3YXFLdlB5d04rMVZTQjRwa2lDRWhCUmV3WGc5?=
 =?utf-8?B?SHEySHhBejJwNFNFTU5CWGEyYWJkZVNyZFcvM0xaMkJwUlNFNE1EOU9OMWcw?=
 =?utf-8?B?S1Y2SXFTbHBTS2k4Z2Z5RUdkemcvQ3dmbkIvc0xJNjZwTXQ3Mm9CRzU2UXpk?=
 =?utf-8?Q?806qh9OykyzlXjUI8LqComU9DpcDRU5FKlrg1uA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 743c7773-c844-4f44-e715-08d8f52adb0e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 16:26:08.7202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VP0kBBxXqOEA1vSMJBTq/QlxcOyqyzzR8H8K1QfT0K4e3jNoxwDn4sQxVJ0ERTilNUFhwmF1jZfuvY9tQ+RRBIiNP6ilA+O30TBIQe7//ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5140
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> Introduce a helper to obtain a compatible cpu policy based on two
> input cpu policies. Currently this is done by and'ing all CPUID leaves
> and MSR entries, except for MSR_ARCH_CAPABILITIES which has the RSBA
> bit or'ed.
>
> The _AC macro is pulled from libxl_internal.h into xen-tools/libs.h
> since it's required in order to use the msr-index.h header.
>
> Note there's no need to place this helper in libx86, since the
> calculation of a compatible policy shouldn't be done from the
> hypervisor.
>
> No callers of the interface introduced.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

I think this wants to be in libx86, because we'll want it to replace the
opencoded derivation logic in init_cpuid()

Also, we absolutely want to unit test it.=C2=A0 (I could have sworn I alrea=
dy
started some work there - maybe its hidden in one of my WIP branches).

~Andrew


