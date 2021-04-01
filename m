Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8F35156C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104504.199933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxoW-0000MX-DN; Thu, 01 Apr 2021 13:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104504.199933; Thu, 01 Apr 2021 13:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxoW-0000M8-9u; Thu, 01 Apr 2021 13:56:48 +0000
Received: by outflank-mailman (input) for mailman id 104504;
 Thu, 01 Apr 2021 13:56:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRxoV-0000M3-0V
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:56:47 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79ab37f0-2baf-4b84-b319-adb9cf9b024c;
 Thu, 01 Apr 2021 13:56:45 +0000 (UTC)
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
X-Inumbo-ID: 79ab37f0-2baf-4b84-b319-adb9cf9b024c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617285405;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ppq0oYnJWuRofMlk4/okEP9xt7+iPhYUXOxpxccoH7I=;
  b=ib5oMsaW7SQRtOeSmsH84fUnqbyC9MoQGWVRe3klgcoNIftDnMLteR/W
   mhWmiwXH/M0XPBKFdmWZT6aUcEtflZB5rwFU+hP8jSIMazQ4T7SZLknVs
   pFJlCnnR2tLW7KNr+KOS7GKfcCay2DzPJp+25eW1E6+hvNfLZqynrNybe
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7JS8cJrRJ22H9cNL9IYCiec/zuCz66QRiHfo5/O79ZfNRu/0g6D4Ufz2m56NlLLqr91MIL04WN
 knCbw827tcywRaztZD5IlpWTeh8lROIeg6ztWp2nPB+JTaDb5TGUTsJeyBpf3ApZ1CfPYwrkmj
 Byfgmw0Xhk94nG7tCc+8NJLr6mSBHFw1JXPWrO9WWJEggVuM/bs1lquqczV42KAH/AWt5Ki6XA
 lk2/2/lWq4Ojn0x9bAf1tEXkPAgZGnXbb+mLkp8EgnY9KydbR/3Q3107q8ZM5eKsCLN3K1cQ58
 jlg=
X-SBRS: 5.2
X-MesageID: 42152682
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hVKiUq+jb9UX0jyIBNZuk+FZcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUfD38Zn/+
 Nbf6B6YeeaMXFTh8z3+RT9Nt4mzsWO/qzAv5an815GSwZ2Z6Z8qyJwDQiGGkN7LTM2fqYRPp
 ya+8ZBun6caW0aB/7LTEUtcsrig5nwlJzgaQMbHBJP0mWzpB6h9bKSKWn94j4wSDVKqI1CzU
 HklEjD6ryno7WHzHbnphbuxrB3vPek9ddZHsyLjaEuW3jRoyKlfp5oVbHHnB1dmpDJ1H8QnN
 PBowgtMq1Ighu/EF2dmhfj1xLt1zwj8RbZuDmlqEH+qs/0Ti9SMbsjuatlcwDU40dlnNZw3L
 Mj5RP9i7NrDAjNlCm42t7QVxsCrDvXnVMel4co70B3YM87Uvt8vIYf9ERaHNMrByTh8r0qF+
 FoEYX1+OtWWUnyVQGXgkBfhPiXGlgjFBaPRUYP/uaP1SJNoXx/x0wEgOQCg3Y78o4nQZUs3Z
 WLDo1Y0JV1CuMGZ6N0A+kMBeGtDHbWfB7KOGWOZXPqCb8AIHCIj5Ls+r066KWLdfUzvdoPsa
 WEdGkdmX85ekroB8HL9oZM6ArxTGK0WimoxdpZ45R/p73gVLvmOSCOUzkV4oidisRaJveed+
 e4OZpQDfOmB3DpA5x10wr3XIQXKXR2arxWhv8LH3a15u7bIIzjseLWNNzJIqD2LDoiUmTjRn
 8KXD35ItRc/lmmM0WIxST5ajfIQAjS7JhwGK/V86w4044WLLBBtQATlBC+/cGEKTpLt6QsZ0
 tgKLb7kqe2zFPGvVrg3iFMAF5wH0xV6LLvXzdhvgkRKX75dr4FppGCY2xIxWCGIRV+VsvSFw
 Zaqz1MiOaKBq3V4RpnJ8OsM2qcgXdWmWmDSI0EnLafoe3/fIkjM5ogUKttNAnCGhBvgzx2oG
 NbZAJsfD6ZKhrezYGeyL0dHqX2asR1igbDG78vlVvv8WGn4fwJalRedTi0SsKTiRspXFNv9y
 BM2p5apqGBlzapIXY4m8IiPjR3GSiqKbpbEQWIY5hVkLj3eAd2CXyHnyCelgtbQBuUy2wPnG
 D7aSWbdfbXa2Atxkxww+Lk9kh5eX6aeF81YndmsZdlHWCDoXpr1/SXD5DDmle5ex8HwusHNi
 vCbiZXKgRyx8qv3Br9okf0KVw2gpEvNPfaFrItbvXa3W6sMpSBkeUDE+VP9JhocNDovelja5
 PoRyaFaDf5AfguwQqbuzIsPzR1smAtlbfwwwL+hVLIrkIXEL7XOhBrVrsbK9aT4yztQOuJyo
 xwiZYwsfGrOmv8Z9aawcjsHnZ+AwKWpXTzQ/AjqJhSs653rrd1EpXBWTbD1X1M3nwFXbPJvV
 JbRL4+7KHKO4dpccBXZjlQ+UAxks+TaEQsqQ77D4YFDBoQpm6eO8nM5bXGqbAiWBLc4ATxPE
 SS6C1b8bPOWTCZ2bsTFqI3JiBXZSEHmQRf1fLHc5eVDgOgM/xH9h69NHS2dbdGUqiLGbkKtH
 9BkqS1tv7SczC9wRzauDtwP7lH/GmmS96jGQ7kI584z/WqfVCXxraw6MG9jD3rWSK2ZkQRi4
 pCb1ERZK14+0ofpZxy1DOzRKzxql8klFUb4SgPrC+S5rSb
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="42152682"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6w0BnwO74mTKtkEQNBNIrliss3g77WX6uc9gOcmuUIlsed62w5icEkl5j4pt61Be1a6BNmU/puYLQtlMyG4FhtKHxaWTFFWisRWLuI8r4+r8G3ItDhKmMAzAG2QnDvvaycKeq5bu36GhjpKAo2HcOPARv8AnBWapn6dTSEZOKU+GktFNDeR3LCQ7KReCAgWfa14bgQGw1C3OqDv22PmZaVt/mBgN5jHYjfeyghqplP709IhK/GkKOp889kzB3STFECWZ0vzoEWpatFTFh9+BPAKxY1BJs7B1obJrYVvwy6kle4pOsg1Vii4stxnprU2zto5ewm2JdvGlat2NoZZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5+D+aArvR5hMHffV4e5iFgHgIfMNVyNOY3VbxMJd5w=;
 b=ZW6a39PvHk0MwAgW+JjqA04zbvfTPhKzidL9/5DTFKFEWH1gvFZExlugfqIRevdY44eM+pOfEHYh6iG3d35zVUraatucjG2s3JzL231siwjxcqBA/TfR+zi4zhIj4IwRd5mzarOQQitazvXTvjVrdlTeWiZEMvJMp3VkVSEWX+Iv4986uFDKUhl++DugL7uBaJUUBmIPWbTSMSyVRGluJtRg+61mNaQYb6ehp7znguD4pw13ijVzcuDsMvgMkHrmC9XcWWepTnH4XJPijbG7Sj3JDRhh5ChcdKXaGF+12MqQ7G0OpQ/WleD4c1PytBjcaodq9HUGt9h5WspJ5psRfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5+D+aArvR5hMHffV4e5iFgHgIfMNVyNOY3VbxMJd5w=;
 b=dWxsXcLIrV/lxs+XvN81Uj/7tRm2R8dOntL9PIgFhiomiTemF/BWXZH7SyeujS6oZdEUIA/fAjdIg43oiJAMtFmXW7roLi6WPRpiNhJ7Jb6bxg4XbKVwgWm11lC3YwuYtFdFbI2d4UvLnq84esfDxfXfjKManMtpZqSpQHEKBwc=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-5-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 04/21] libs/guest: introduce helper to fetch a system cpu
 policy
Message-ID: <c9f3c0a5-a570-50c9-534f-9b06cd5d5837@citrix.com>
Date: Thu, 1 Apr 2021 14:56:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::23) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 936b6b9e-56b8-4ee3-1d0c-08d8f515faa8
X-MS-TrafficTypeDiagnostic: BN8PR03MB4882:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB4882C1FB42FF91310491920ABA7B9@BN8PR03MB4882.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SAEp0h+coLl3+USDXgFk3HLZvWdZqyOBCpbfFh9vSVyz9piAldQopDlYdZ+TNyco34bEYgeBGooo9U9Ts6fcHIxNQESXdHGJlf2V22LTdg7VoVpXWsyS/YslGZKd+79yEIUTGh3e7LowWogm/KM/8hque5hLpzigOhDmUx9NfBLJBalcN7qdZgPYr83RhHVZZyOs01mcZel6ML2ZpBcm99hodHYnt8XFbQLPxOligs8Ih0LY3jloASy7rMsCFN++vsw/rNEYmofDVXYdJloVpfsSSklSmklrfmxwfU1MdWezDe86F1VA1rg7aQ9B/ovWiGLJyEV+tcybd/EJytjOve8kMx/CFOsedqdk/T9fa4MqodcWhLJtpPVy+x3VVWMGBEh2WwE6t+wtTSCSPq6vMRq5BJ0M3hKkkJwZqEsTzH9llVr6IjyD4f0hDmiUk2nbVO3ciPAS03xrFcI1/KQSDAxanZ7s92hIw3xXGylxo5hVVea6u1X4PQc2ljTxf8vIQ6IcSwAHSc9sEqoRiqvj4/D77aFmsRAMdwh36R0PdnNhblPssrUMyLZ6pDg11kkb1pl2Gcep7w9kdACiOIiQhzp+jeZAU2krjFpw1+ViONo0U3htkYtv7XfGB6To0Z/8DPj33aj88+GycE87pDpr6u2NVXZbNRiZ8RIL/VfI48KwIIfHYL2A8yWFNIDprrhlrECHfUPVTmjdYa3ZEQrIKn5Y4Im9d5OpgG21KbazAYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(6486002)(2906002)(186003)(956004)(54906003)(16526019)(86362001)(316002)(2616005)(478600001)(31696002)(66946007)(6666004)(8936002)(16576012)(26005)(38100700001)(53546011)(31686004)(4326008)(8676002)(5660300002)(66556008)(66476007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mm5BaDhudWdGYnp5NGZIVU1DNlJSSkE4N2RSaFNtck5Ic05lWFpDQkZGVmhs?=
 =?utf-8?B?L09WdDJ6cTh1cWlkYjlGYTlBc05NYTE1aHozMlpNUG43d1BsVFJsYmFqTmRj?=
 =?utf-8?B?YUdZU3F2NVFjSXNReGJZVi9tcW1LcW1zU0pQelpJcmh4UzVXRGZqemw4Ylgw?=
 =?utf-8?B?TXlsWkR2SDJpYmN5RWJGWTczNWFraSt5R1lTSGk2aHhtb3hzK1NsclZGbEgw?=
 =?utf-8?B?YkY1bm1jRW0xcDIvOW9HMkpWZ1liTXd6eklPLzVndUw3OFk4S1ZhMzg2ekt6?=
 =?utf-8?B?M25PMVNBTmRlaytiWlBoMmdoTHhFM3J5VWJYU3J4aXdEaFM2cVg0dGw2cDdn?=
 =?utf-8?B?THh0aUZtRGNFQ0VJdVU1bDFIWElJd0ordmpwYTZFdXcxOCs3YXVSMzRMVThF?=
 =?utf-8?B?aG5lSkowcGlXdnNTZVk5dDFPSzJ4RkpQRlBBM1gvbHdBNDJGdVlxaVMyZEFB?=
 =?utf-8?B?OW1lVjhBOUtRTmo4M1VmQVV3YThlc1g1ZXBPUVhuVFI1ZzljbHlFTHNFWTVL?=
 =?utf-8?B?emJmSk9HUUFvU2E5WlpZeGVyaU1Ld0JRQXp5YnZwdktJczV0SC8rTTRaR2JK?=
 =?utf-8?B?RmpvdzNnK3E4M1Nxc3IyWXplUFVjeHMyRUhKWnZrVlhQZi9SWHVqV1U3U3o0?=
 =?utf-8?B?K2xWYUJKYXBBdUoyTFlscWtsYjgrd1pOZGJVc254UnZtNzJFS0JzRXRSUEhV?=
 =?utf-8?B?NGJiWEQvbTUyZjJtTDJMUTBQeDcwS2ZpRmtNRDdOQWVEMFlXVkhxYXljVzZ1?=
 =?utf-8?B?Zy9EVjkvWk9zSVNueU1udG9VbVp2MDJHSjd4d3JlMzh2T1gvYlhUSW16N2Zs?=
 =?utf-8?B?T3FHMWsvelVSOE9DZU5kOXpyeDhoZlhqWjhGQ3RCQXkvZnVOY29IZnJNNGRn?=
 =?utf-8?B?Mzk3ZUFDZnFEL1FzMlFKTUVPdGZtUjkyaHYrczlodkplL2ZIRENlSXFvYlBa?=
 =?utf-8?B?VkkzQ3d6K0RYY1dqU01QZ2F3T3BhSlpKRVZ1dUZ1eVhQclZDUHJuek5BZnpW?=
 =?utf-8?B?V1IxajFyT1A0RWlaZzRaRnpoQjg5Y1BVL2NOdklGd0FQOVk4K0NnYmNhZ0Rh?=
 =?utf-8?B?MzVRMFdGNzZKUnZqYkhwTGN6ZTRMbE5EcUR6YTREdkZJejhjT3NzMWJHb0lu?=
 =?utf-8?B?U3A1VGdmOWs0enBqT2htOUFMU1JzN0ordGNldXg5Rzh1WVBPUUVvaC9JSGY0?=
 =?utf-8?B?a1ZEaDY1RkRETmdISjQrNTB3dnY1NkljVjhPQ2xwUFlrRDBEaldlYTZ1ekc5?=
 =?utf-8?B?c1BUVWMzNWZQZExlb1JkNjhNRE5md2dpUXZTWDF3RWRLSy94d0x0WnBZdDAr?=
 =?utf-8?B?aVlacExpYURFV0Fxc2V4Z1NXcjJhNHpTTlR4TXdMbUVaYXEzZ08zUUYrd0VP?=
 =?utf-8?B?K1RkTHJUbWJqcDVtTEIzZzBxcTc3SmZya2ZWNVpjb1psbUhEM2pYSWJUU2VX?=
 =?utf-8?B?NG0yR3R5S0pQUmJDSWVKa25TVks3QlJMTzVZanpGVkJRclFoRWZhZHowQ0dN?=
 =?utf-8?B?bnRGVjVvaGc5YlNOZHRUZktQb1JBSnA0VzAvTmJxREpuMU5WM0VCdWZqSllO?=
 =?utf-8?B?elI4N1lzYzk3OURsMVZMSXBLSGxHTDduNGZobVhxTW9zZW80bUc1WVBwRTNo?=
 =?utf-8?B?Tkh2ZGhDWlpBaEZhdis1bDNEeHhYUmFQZm9INmFsYmt3YXNGZGo0SUE4UnFy?=
 =?utf-8?B?TzVxUXp0bDlLVTBXM3N0VmJBNHJvZjEvUFJFWHlmRGF2S1VRZDBPeU1kNnFK?=
 =?utf-8?Q?vD4MHmU2HerFvHNENfuhFKr0zjU5QVdHsm2DuqT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 936b6b9e-56b8-4ee3-1d0c-08d8f515faa8
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 13:56:42.3163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAD8fNg9nzPwzg/eLF40hYpW+tCN5UivrBHzbh9eTRfFkZ9eQfVUeDRdBeUpN3GL/wbj/lxviq4RXvKtmVZzx/x2tO40/lunwJMxtHoIoGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4882
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> Such helper is based on the existing functions to fetch a CPUID and
> MSR policies, but uses the xc_cpu_policy_t type to return the data to
> the caller.
>
> Note some helper functions are introduced, those are split from
> xc_cpu_policy_get_system because they will be used by other functions
> also.
>
> No user of the interface introduced on the patch.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  tools/include/xenctrl.h         |  4 ++
>  tools/libs/guest/xg_cpuid_x86.c | 90 +++++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index ffb3024bfeb..fc8e4b28781 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2596,6 +2596,10 @@ typedef struct cpu_policy *xc_cpu_policy_t;
>  xc_cpu_policy_t xc_cpu_policy_init(void);
>  void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
> =20
> +/* Retrieve a system policy, or get/set a domains policy. */
> +int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
> +                             xc_cpu_policy_t policy);

I'd recommend "policy_idx" as the parameter name.

> +static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t policy,
> +                              unsigned int nr_leaves,
> +                              const xen_cpuid_leaf_t *leaves,
> +                              unsigned int nr_msrs, const xen_msr_entry_=
t *msrs)
> +{
> +    uint32_t err_leaf =3D -1, err_subleaf =3D -1, err_msr =3D -1;
> +    int rc;
> +
> +    rc =3D x86_cpuid_copy_from_buffer(policy->cpuid, leaves, nr_leaves,
> +                                    &err_leaf, &err_subleaf);
> +    if ( rc )
> +    {
> +        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (=
%d =3D %s)",
> +              err_leaf, err_subleaf, -rc, strerror(-rc));
> +        return rc;
> +    }
> +
> +    rc =3D x86_msr_copy_from_buffer(policy->msr, msrs, nr_msrs, &err_msr=
);
> +    if ( rc )
> +    {
> +        ERROR("Failed to deserialise MSR (err MSR %#x) (%d =3D %s)",
> +              err_msr, -rc, strerror(-rc));

We possibly want to split out helpers to render the error information.=C2=
=A0
For MSRs, it ought to be something like

if ( msr =3D=3D -1 )
=C2=A0=C2=A0=C2=A0 // general -ENOMEM etc
else
=C2=A0=C2=A0=C2=A0 // MSR-specific error.=C2=A0 render index and value.

I think we can probably even depend on MSR-specific errors always being
-EINVAL.

~Andrew


