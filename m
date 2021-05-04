Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18916372D3B
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 17:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122536.231104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxGF-0000Zm-1E; Tue, 04 May 2021 15:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122536.231104; Tue, 04 May 2021 15:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxGE-0000ZQ-Tr; Tue, 04 May 2021 15:46:58 +0000
Received: by outflank-mailman (input) for mailman id 122536;
 Tue, 04 May 2021 15:46:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldxGC-0000ZL-Sp
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 15:46:56 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b636abbc-61c9-4747-adca-f6747d3d3dea;
 Tue, 04 May 2021 15:46:55 +0000 (UTC)
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
X-Inumbo-ID: b636abbc-61c9-4747-adca-f6747d3d3dea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620143215;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M6PFSTrjgqNJdq9owZ72io/TAheugEl8jOXv4IzmTFo=;
  b=QQjxRObs+f/zXkA/nSrWvIZ2jQvbKY+maSnP91Sla2dM/KqOGNrxRNoT
   czFlk4aWq/CtoskZYjkoyt3bWZBSX5SEP7isgsKbmKw5VkiLeZSH7Dkee
   RXk8cuHqQxJzau0dfbhIDA/3BVRd3ff0f15JpcRnHdP2Y8cT3wqyYOiKy
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g0/BzL5FSflj8ZfbIuwr2QfkuH45RpPUjIhx2MAL0xDY3OXam98NkoItVt2XQrPieYMTJWc1OD
 6CNw2XxijDrtGh6riZUgN6Jv9IGYBUXYY6av1KhwGRXuDtQ68uFfXH9TvGKQPRwKUnD3in2a4d
 7ElH30RO+klEPCDrWcWY0Fpwg82uel0DrAIdMRUSs0IFjUxT5198Z0za5Az/3gIniE+eYmBgLJ
 mP8KCR4+ZCRjHiJ+DiCms92C5JxHIfG60agiazogIV3exEdBK50trniANIKJCIe4zr5XFA5PJH
 WOU=
X-SBRS: 5.1
X-MesageID: 43151386
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:B9c4Jale298zJ4A7JxzkB4fXgyHpDfMCj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRGdwt2cTC1aiui/vXwXsFd3ARV4hLxW5Ce2SmO2dxQxRLAod8MZ
 Ka6NZOqTbIQwVrUu2QAH4ZU+/f4+DajZ6OW29KOzcL4BSD5AnYjoLSPAOf2n4lMw9n4bBnym
 Tdlhy826PLiYDB9jb590v+q6tbg8HgzNwrPr3BtuEwJi/3ggilIKRNMofyxQwdm+2k5FY0nN
 SkmX5JVK4cik/5RW27rQDg3APtyl8Vmgff4GSVnGf5pojBTC86YvAxwb5xSAfT6EYrobhHoc
 d29l+ZrJZeAFfhmynw9rHzJnZXv3e0unYrnKoviWVeW+IlGdtshLEYlXklc6soLWbf0sQKAe
 NuBMbT6LJ9alWBdU3UuWFp3ZiFQmkzNg3ueDlMhuWllxxt2FxpxUoRw8IS2l0a8ogmdpVC7+
 PYdox1ibB1SNMMZ64VPpZOfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoManZYIP15l3vJ
 jaSltXuSoTdivVeIyz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGR0spl8emvvUDEszWU/
 u+I/ttcrzeBFqrPbwM8xz1WpFUJ3VbetYSoMwHV1WHpd+OKoCCjJ2YTN/jYJ7WVRo0UGL2BX
 UOGBLpIt9b00ytUnjkxB7LW33sfUT79YlqELfT+vUSzIRlDPwNjiElzXCCou2bIzxLtaI7OH
 ZkKLT8i6WhuC2d5mDT9VhkPRJbE2dY6LjtSGlxuAcPKk/4GIxz/um3SCR35j+nLgU6Z97KGA
 Rfzm4HhZ6fHti1/2QeLP6JdkidlGAeoXqWSYx0oNz92e7VPrUiDpgnX6RtEx7sDBIdo3cslE
 5KdBIESkjDFjnnlKWii9gOCPvCcsRn6T3bX/J8uDbRs16RqtooQWZeVzmyUdSPiQJrXDZMgE
 ZtmpVvyIaoiHKqKWElhv4/P0AJYGOLAKheBADtXvQjppn7PAVxR3yNnzqUllU6fXfr7Vwbgi
 jkITePcf/GRlpbtXYw6NeizHpkMmGcdVl3cHZ0rMl0EnnHoG961auTfbWoulHhH2cq06UYKn
 XIcDESKgRhy5S+0wOUgi+LETEjyo81NuLQAbw/e9joqziQAZzNkbtDE+5f/Z5jOtyrqOMNXO
 6FcwKeLT/zCYoSqnuoj2dgPDMxpGgvkPvu1hGg8XOx22QnB+HOZFthXLMWLrinniLZbufN1I
 88i907veG9aDqsLtGHzLzadD5FJFfYp3WsQ+QhtJBTuuYzudJIburmeCqN0GsC2hM0aNrwng
 cZRq9w5bjaII9hf8AIYUtijy4UvcXKKFFuqxD8B+81YEokgHDaNc6Y+ragk8tePmSR4A/rfU
 SF+yJT//3ZTzKO2L4TBaU3O3lXYiEHmQZf1fLHcZbRBgWsf/xC+1T/MmbVSs4tdJS4
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43151386"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=am4fYg7iI+FM/tnmciYHS4o/APfSbmZXDw51u57Y1UM48seEvIb8Nag1TPVFZZPMFhCvrq7kqHqxnNz+rDhyeREQoTz2imxXQeEmDg11qlXrVntGbtceOWzAsJ5tcfL0ZnBGBN6yD3+TftxvFcvz3TNBRN6eNytj9WyRVygeEljbMVNHfsgi9hvvl8VXGOmX9FMBTXH+h2/2rTJKrxCICKyCDDX0PF9ySp7gF8NI0JFqJI/SBtr+uqhP1zabBpiAD+A4A6TGTPEYFGum8UnofJ1EJQSMWvJJqD5hcPQYzVzhEG+Pd+JRKZlW0pPOVtBXJVPJ/+J4/SvGmnioYd0uqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y57z0yiUGcehdRjLSs/lStDkTVoQTegtPk6MNSkBBTA=;
 b=hgbKYYooSyvCWfdhLzl/b3IDb33GBWQxv6eQOoDcjtEi3+/p/m/dq+2wqsBfgUAEm28Fx/uMjMqYLWe7+1Izd+LQ0M+aG2TFZKOrHxb/kvxs3ZPXw3ltq5SZmLl6ZA2lTBFBXclmr06I7ByOs05qJtuN7uqPZ2FvB/3IxCVIv2BxzSAYMwVDifyAWhnebEkTXxtcZgW9S6wQc4I+3aU/Og1e17XlhRQ3kEluIUyy5xA5OmlUaZaZRqQ3F0pLqI9s2/JWlw2dfYoI1ZhRaXEniWQ73Klguj3NgvMW8PNIgY0CqyHQqCtQQ2/CKiE+6iN/3t0a2qy0UjmtaDekW6NZ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y57z0yiUGcehdRjLSs/lStDkTVoQTegtPk6MNSkBBTA=;
 b=INct4NQcKDdMZNU3Q3HdG1ZGWuQPBu7ZIlXnP6EPHM8kl1k1qtEhWSMO2tIBmPpIT7O0/S84Q9WXuPzPJU/t6ztjfRqDLyScOZ+sCplO4q6zzCX+LUv1lsjuldaNG7vz+WT5P5np6VD8OYlBDud522wLpdcEtRgJaBljnRR7nik=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-3-roger.pau@citrix.com>
 <76e5e596-24bc-9d91-e654-cef1115e5139@citrix.com>
 <YJFQifk/0nXCuMJT@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 02/13] libs/guest: allow fetching a specific CPUID leaf
 from a cpu policy
Message-ID: <73c52a4c-b801-59f3-eba6-e00d7200bdd5@citrix.com>
Date: Tue, 4 May 2021 16:46:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YJFQifk/0nXCuMJT@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61234598-3f56-417a-860b-08d90f13d59e
X-MS-TrafficTypeDiagnostic: BY5PR03MB5345:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5345388746B49F5B8ED4D854BA5A9@BY5PR03MB5345.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w+j38FPzjQbbH/1GjiX7voV+rbc0aWxHnGSKAsiJGAKchqEPU735NXeMWV4tC/FKPcgGmny1sNkfifg5abTrTe5tVVvdl1AVB7Mj/XAdSlqUWvVVkba5/VebEn1zt0VSd5z5NdSQMjK4PUEnxVLruquJ2NU5pmuXieqq9m4m9qDelERcI/fvznVJh1zX5OKOClXavSOOarN2p4HBlq+4oPl1gOoOFr62aKdlDEk636KciajLy/GFuCLqAu53aA3Y9WR1E2m/6JuBiiwvBI02dzgaKwjtfsTkexMBgOc1cSZZ8oBZ9P/Zod0CgR+MLDSrq6jVUKSgj7bEq/4x2N+wmCZZY1C+Xbrsc/mPVIr3bfFCa8hBP9KjSq6EFgS+e+Gy/0CnE8uiFFK8MQfQxZJct4rBs75FksL9S2D6gu881c9HWc/q5kVyKLIlc5wFGzJp0rc+Vw34XNGZgW6eLyNsltoFvyL5zsguKwvY9hdWDYK2PQBxFZL+woJcNmnFm33gE+1v7Gl0iCJQlNcVF5UYaxwBi4SO6uBwFu8EuV7Zg0rSHPJawtsZZhRobaBz77EDx0hFY1EXDQLG4f9n33T+iAaW+yCw8II+2i11a2J30XcmisMiVwcWe0KUk/4tc/V+l5jAQUq+0W0EeAfAoCOvlSMTKCeQAEEWsHzQokc4aeMVw0Aie77EQJ8bX7BJeaVZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(5660300002)(4326008)(26005)(6862004)(66946007)(956004)(38100700002)(53546011)(37006003)(66476007)(16526019)(6486002)(16576012)(8936002)(83380400001)(316002)(478600001)(2616005)(66556008)(186003)(31696002)(2906002)(86362001)(6636002)(54906003)(6666004)(31686004)(36756003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rzh4YXYvVHcvSU9oS2JzZVZZQ3JnQmo4Wjd5MlhGc1VVWTZPbTVpTWdBWFov?=
 =?utf-8?B?V3JsR1NTeWpONVRtczFrS2x2b3NRTERMeDZuVCtLbWoxcnUyM290TGVmdVhi?=
 =?utf-8?B?MGt3RituSzdSdDRha0xEeEhWQUlhbUpOM0xtM0UxWkN2TENSblI5L0ltYW1y?=
 =?utf-8?B?VW02STJtVDQzU011NWtoay9zdTZoRWM3U3E5VWVxUHIvM2VESFA2WG83Zk5C?=
 =?utf-8?B?TTl6QldMNDBzUUF0VmIwMXRjeWIrMmZWNlhXVldZWDY3RS9SQVFxeUhBbGZD?=
 =?utf-8?B?UmczaXJWSTl1OVFxRGtvbzFobEY4MHlWREtqTzlZVEw0cVV3Nms1TUxKcWxK?=
 =?utf-8?B?Vkd3TXZ4UzdHM1VJZy93RXo2Wm53aVlWSXpnREx2Y1pWNnA3ZXRUMjNxdnhI?=
 =?utf-8?B?U2JsNEpXL2pHenl0WXA2VWk1bWUxeXJDMDhPU0dlK3p1dXJxTHQvT1hHVmNO?=
 =?utf-8?B?UFlweVl3ZmNqM3pZNm1CSW9jSWUxM1NXTHFMUkNJZDN0QlhBTVllaWVRQUs1?=
 =?utf-8?B?a0JOZUR5d3pPZ0VSa3krbzlmYWxRNkhYNFBjLzFnMkpTbWJsT0lMVWxMeEJi?=
 =?utf-8?B?L2hlQ0lxcDVXWkZLdit6TlBESFp2ZUdjNkN6MFZ3WTFDSG5mWS84N21Oc0tI?=
 =?utf-8?B?QXloTXVWTDRxSFZNdzNwbi9wMDFZMWRaTkdMbnRIY21EamJuNGQwd3JBNmc2?=
 =?utf-8?B?NnlncWwyOUx2RUJ2NHJOWTNRNmlEM2VueDdhRnBJZnlmWllaNXJnRytWQnBW?=
 =?utf-8?B?SjNFeGJkSlRySXNFaXRNb1dXQWRvbHFkaGpjS3FVaHI0d3RrbWZsUG1XOHBs?=
 =?utf-8?B?Z1ErTXUzYUpTQStvNTNiWEROUHVHREtmeHY3ZXd1Wmd0Nk9TeUVySlNNdWZV?=
 =?utf-8?B?ZE52SmZmNlE4V1g1ZUQ2UllJcVJ3N25VSTJyQVo5aHI2blUrdGFBN2xhbmNN?=
 =?utf-8?B?bkxsUmhLdEIvcFFIOXZyRWU2eCtOOUpHelRkRkVjd2RLZFEyKzRzcnhrQ3ZM?=
 =?utf-8?B?czdpRUludURDZG9EOUZqUUdlOGM1cWRnbVRNNWFRUTd2UlZMK045bS91R280?=
 =?utf-8?B?UEQ5L0UvMWt1QkZYVzRTdGtNV0xIZHNNalhGMUliUnpzVy83KzAyd2c1UHRa?=
 =?utf-8?B?b3Fxejg4MWR3NTV4MGVUcFFBbytNUkgxSGd6dVpKQ3VObXdYQk1HZkZ5VTR5?=
 =?utf-8?B?dmh6RGhkc2tJR3Naak5sSU9UU1YzNVg2aTZMZ29oT3ZVOEFxcWJWSGhTZjd2?=
 =?utf-8?B?VExaSjFjbjk2UDh4bkhwaTJUdlBlNXIrK0IwWUltTGt2bk82NlMyUXMyZDEv?=
 =?utf-8?B?a2ViVVVaaGdPUHBuUUM0U2tXRWxzbDduRnZqUTdHcWk3aDl1S2gva3lROG1V?=
 =?utf-8?B?TGcxdE01ckYyeXZGVmdnZDB3Tko0Nnh4djZEZkFMK0pnd0JsdTdRcEJWQ2VN?=
 =?utf-8?B?blg5M1QvZFdJdmlKTXh5SXVlR2tsS1QxcVl0cGwwSVV3aC9kTUxHelJuUTFn?=
 =?utf-8?B?Y21ZVFViOW9rc3gvMnRMT3VkZDh2cFdSMFIzQTREVTZwdnVwYXR2SitESmtM?=
 =?utf-8?B?eXY2UmpIMExoV0xIbys3aDM1UTkzNU5mRWY2MzZ1aTQrQjFPR0ZBQTRuWnUx?=
 =?utf-8?B?aUQ1RU5ZckxPVmppeGRLeEZKU2s2QkhpQ29YZ2I5cnpJbjRWVnN5WHNOdEdB?=
 =?utf-8?B?SFVib1lmL0M0NkdJSkdnRVN5dlc0VHdaV0hZRTN3NzZjMTJOVGZudjg5Zjh1?=
 =?utf-8?Q?dHCo2FaeYogB1QeOAeDOrzoytgo1bR04Y4Ykc8q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61234598-3f56-417a-860b-08d90f13d59e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:46:51.5075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T/PHhWZwZNW+lrW435f1N9wKpPW5D1JG97FOvM0SD6z1w2VXVLkFfO4OTvt0yVDl89f19jgrTA4FUPVg5HbCDwwi39+ZgZdJtIMhnrGA1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5345
X-OriginatorOrg: citrix.com

On 04/05/2021 14:47, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 04, 2021 at 12:59:43PM +0100, Andrew Cooper wrote:
>> On 30/04/2021 16:52, Roger Pau Monne wrote:
>>> @@ -822,3 +825,28 @@ int xc_cpu_policy_serialise(xc_interface *xch, con=
st xc_cpu_policy_t p,
>>>      errno =3D 0;
>>>      return 0;
>>>  }
>>> +
>>> +int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t p=
olicy,
>>> +                            uint32_t leaf, uint32_t subleaf,
>>> +                            xen_cpuid_leaf_t *out)
>>> +{
>>> +    unsigned int nr_leaves =3D ARRAY_SIZE(policy->leaves);
>>> +    xen_cpuid_leaf_t *tmp;
>>> +    int rc;
>>> +
>>> +    rc =3D xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_le=
aves,
>>> +                                 NULL, 0);
>>> +    if ( rc )
>>> +        return rc;
>> Sorry for not spotting this last time.
>>
>> You don't need to serialise.=C2=A0 You can look up leaf/subleaf in O(1) =
time
>> from cpuid_policy, which was a design goal of the structure originally.
>>
>> It is probably best to adapt most of the first switch statement in
>> guest_cpuid() to be a libx86 function.=C2=A0 The asserts aren't massivel=
y
>> interesting to keep, and instead of messing around with nospec, just
>> have the function return a pointer into the cpuid_policy (or NULL), and
>> have a single block_speculation() in Xen.
> libx86 already has array_access_nospec, so I think it's fine to just
> leave the code as-is instead of adding a block_speculation in Xen and
> dropping the array_access_nospec accessors?

The same libx86 function should be used to simplify
x86_cpuid_copy_from_buffer(), which has a similar opencoded construct
for looking up the leaf/subleaf.

You might need some macro trickery to make a const and non-const
versions, or have the main version non-const, and a const-qualified
inline helper which casts away constness on the input but replaces it on
the output.

The new code can't use array_access_nospec() because it is no longer
accessing the array - merely returning a pointer.=C2=A0 array_index_nospec(=
)
might be an acceptable alternative.

>> We'll also want a unit test
>> to go with this new function to check that out-of-range leaves don't
>> result in out-of-bounds reads.
> Sure.
>
> Also, whats your opinion regarding xc_cpu_policy_get_msr, should I
> also split part of guest_rdmsr and place it in libx86 in order to
> fetch the MSRs present in msr_policy?

That's harder to say.=C2=A0 I'd like to avoid the serialise call, but the
current msr_policy structure currently uses uint32_t for space reasons,
so you can't just create a uint64_t pointer to it.

Perhaps we should bite the bullet and use uint64_t unilaterally, so we
can create a lookup_msr_by_index() or equiv.=C2=A0 The next big block of MS=
Rs
going into the policy are the VT-x ones, and they'll need to be 64 bits
wide.

~Andrew


