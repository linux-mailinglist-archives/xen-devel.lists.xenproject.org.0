Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48570373C6C
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 15:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123125.232252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leHbH-00034g-SA; Wed, 05 May 2021 13:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123125.232252; Wed, 05 May 2021 13:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leHbH-00030Y-Oy; Wed, 05 May 2021 13:30:03 +0000
Received: by outflank-mailman (input) for mailman id 123125;
 Wed, 05 May 2021 13:30:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTpK=KA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leHbG-0002oA-DA
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 13:30:02 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e02a03ac-5093-4c2c-b0e3-61fc45255c85;
 Wed, 05 May 2021 13:30:01 +0000 (UTC)
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
X-Inumbo-ID: e02a03ac-5093-4c2c-b0e3-61fc45255c85
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620221401;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CWvRM8pIDjGGelT2UwSsCVBCUwgSLbypiGB+15qMNcE=;
  b=Gu8VRFlqpyNyJZ3k1Fo3n50QhqaEK7Zs/3u4EQp5J1Q7lvFSNYeyiDYL
   VVNCsjsTSDT5B5KNeTlsPXxmazdzlta2ivtViGpNRVY4pOIEkDm1M60wK
   ZrPYhcF+gIN0LczLUaTEbeQRlIgXccd9Z98UQ1BiNPu/AWbALCutA3y67
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LL7KiPS478o7yMgdr+B9WztXe56x5hpWKDLRcsqG9dUsoVBXRhCmoXnLRsCxW6n1igV29kJrKC
 Zxm1W566x4BT3Z+WXhc4y2jXn2eeTnd0/N3rHW3CeiRvFmXw0prbLEh2YaxAXuaeT4bz5bgXQn
 4R6CeTgoOINcifMU/CCNCNw8gyJqZUyjtGcIA7iF5iSrcN3twhZnAhpho4uSvDh4YcN/6r/69p
 ClX/m3tTiS7ut5Xgt3f1lQ42Q7PUhjyzoW4CtLFGwqhRwFQXDvTWuHo5zx3uVYM+8ANra3ibSn
 UjE=
X-SBRS: 5.1
X-MesageID: 43109044
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ie9EGay1RHvynQiWl3zrKrPxnu4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnm6JdybI6eZOvRhPvtmftFoFt6oP+3ybtcheQysd07o
 0lSaR3DbTLYWRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRC51IxS0RMHf8LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7Le0Utde7FutHNidbaehYAHREq802jijmv5b78HXGjr2sjehlIxqov9n
 WArhzh6syYwouG4zL/90uW1ZRZn9P91sBObfbstuE5Iijh4zzYAbhJdKaFuFkO0YWSwXYs1O
 LBuhIxe/l0gkmhAV2dhTvI903e3C0163nkoGXo8kfLhcDiXjo1B45gqOtiA2PkwnEttt19z6
 5Htljx3/E8YGKi7UaNkuTgbB1kmlG5pnAvi4co/gdieLATdaNLqsgn9F5Vea1wbB7S0pwtE+
 VlEajnlY9rWG6dBkqp2VVH8ZiHW3Q+GQq+WU4SusCZ+Cg+pgEJ82IogOMYhXsO75Q7Vt1t4P
 nFKL1hkPV0QtYRdr8VPpZPfeKHTkj2BT7cOmObJlrqUIkBJnL2spbypJE4/vujdpAkxIY78a
 6xHm9whCoXQQbDGMeO1JpE/lTmW2OmRwngzclY+txQpqD8bKCDC1zBdHke1++b59kPCMzSXP
 i+fLhMBeX4EGfoEYFVmyXjRphpL2UEWsF9gKd6Z3u+5ubwbqH6vO3Sd/jeYJD3Fyw/Z2/5Cn
 wfGBfpIsFt6V2qR2/YjBDdV2iFQD27wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9ow6FX
 EOZI/Po+eeny2b7GzI52JmNl52FUBO+ojtVHtMuEsvO0PwerAThsWHdQlprTy6Dy46a/mTPB
 9Uplxx967yBYeX3zoeB9WuNX/fqHcPunSQTdM5lreY7cnoPrM0Z6xWGZBZJEHuLVhYiAxqoG
 BMZEsvXUnEDA7jjq2jkdgzH+HQd951hS+xOs5KoXfjtUGRzPtfBEczbnqLa4q6kAwuTz1bih
 la6KkEmoeNnj6pNC8CmugiCUZNb26WGbpCKwyAaOxv6/bWUTA1aV3PqS2Rihk1dGav00kJnG
 TuIReZfuzxDkNHtmpV1bvr911IZnyQFngAGExSgMlYLyDrq3xz2eiEau6I32ydZkAr78sdPD
 vGCAFiaD9G9pSS7lq4iTyCHXIpytESJeTbFq0kaKyW8GiqMpe0maYPGOJ08J5pOMv1iPICVf
 uSdmauXWrFItJs/zbQimcuOSFypnVhrOjh3wf96nOkmFE4GvjfLT1dNvgmCuDZy1KhYfmG0J
 90141o+cSxN3j8cd6Ax+X8aSVZJhbavG6xSKUJpPlvzNUPnYo2O6Oedz3CkExj9lEZCuzfkU
 sFWqR14LzbIOZUDocvUhMc2mBsrciFKUsgjxf/DeA/d2w8lnOzBaL835P47Z4URnCbrAT+OV
 Oj4zRQ0vfMUSyEz6MbAcsLUBJrQXl5zHRp5+WZcYLMTC2sauFY5VK/W0XNPYN1eeygGb8KqA
 x97MzNt+iLdzDg0ASVmTdgOKpB/yKGRsy1aTj8VdJgwpifOV6WhLGt79P2pDDrSSGjY0BdvL
 Z7TyUrH4x+owhnqpY23Ci0QrH2pUxgs2I220AYqnfdnq684GnaGklaNxb+mZs+Z0gKDkS1
X-IronPort-AV: E=Sophos;i="5.82,275,1613451600"; 
   d="scan'208";a="43109044"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgKQs+gFhFAaMPf/WXar2aaKhPIL2N/019Nkg/V7YhYf4Mhe98vRWVI9AMt5z8yb2aX166VzN5FzXNeBbEaCGdIr8SuSxU96nJsmKRUYJxEYDJymJh9TRfVzQcv/D4nst4xzLkvvI114r1UwwVJ2dXGiRSIDVbxtbVFyqEs0EryEBg5WNfBf758HGaCt/8HzJHN/OpCbClq+rG/pdi2egFXdKZV66V+10wdlGvcBd0ykKBZ3ir6uONDZP8LmvxuEv1ehEfggSdPdvDv2/6HezcZGa8gxfCCqhLpVplynKFvgJZ89JmsOgVTM7MxR8GSgHo/NMRMN8t7cVOg+rkeWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbNoFC7wcabU0RgraDtfdWkpYQWL5yMMi520N5NoKmg=;
 b=dZ70f1m1Mf8of1p/P3jvgf+vkvi21ht8Sd6L3MbJvCNiDaTsXOpaTdoy5whEU0Co6WapKUq7QnC990ldFGcdFDLzWUfwJOICQx6MEWh/k6ZLCXMY//P9yB7bhA1l7WjodfBRRox1s1KpN6n3stXavl6ijtnSRhN60L3+VHs8pm+++tt1Y/3G0/vej0byOygPUlPkWWtEWrBeezosV9H0g6Qa0vwLwBBlgRnWXOMyBIfVeZUw9nVg4KADRyoc68VB3p0qd6sAGmpbZZ7vF77r9wWcd5ejN0/D2V1bPgK/A399rMZk0ND/+ZMSOvZYi1J/b9WaW/PiMVVzK08/ecCEHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbNoFC7wcabU0RgraDtfdWkpYQWL5yMMi520N5NoKmg=;
 b=kuGQKKJtxf5IYifK2F2n5zlWc98POhoL8ARFCm8BsqCurmzFEI0SGZBU2hUfqdNqX5Y0DkA7XmU3sIgl6ME+9GFK7TrJL4KrFnGUUXw7xou+SZVSxXZgosPY+jZcvg0VjTXiUR7PrOCOfYMTYuow7dlIZN+JUuMdFugzFuW6p0U=
Date: Wed, 5 May 2021 15:29:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 02/22] x86/xstate: use xvzalloc() for save area
 allocation
Message-ID: <YJKdz1irxJq8Yckn@Air-de-Roger>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <1fec148f-a5b2-5102-a790-e908d6f040c9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fec148f-a5b2-5102-a790-e908d6f040c9@suse.com>
X-ClientProxiedBy: AM3PR03CA0069.eurprd03.prod.outlook.com
 (2603:10a6:207:5::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6deeb56-c279-48ae-8675-08d90fc9df81
X-MS-TrafficTypeDiagnostic: DM6PR03MB4538:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB45387370104499FE55A91B248F599@DM6PR03MB4538.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qbHLGRjE2nV3ifrB0IPWfx5SWOwuzir+HVQwGuPQh9Lj8T7smmsDpHaOhC5TspIhen7WtYJuZ33oxqJrDgdJVfAIxBrcT5Dw9E+fZ2Tppx1Bh2PyfJe+6GwfX3PEcX+pxhY3uK2E+bZEPv5okk1G2L5togdLK4VmWlKrKrXk07WYaDSpu5KG4soSOLRBfp/LdSm4dOHvmIEor7VatEiQsXXmZiy7kg4vJq2IVGRyNW+juScHxs8zJEczlqG8+41uV5x4bZtb7LrF7VyvAV32kNyu7aZ2FyOalT9iy/LOhQ9dydsPkK2bY8I6Vo9hYDnEL5NxpsOT9cEYmSQmznqh5rdzkl9OgCBT1o6z9ovQ9yj9K9zXSZbV5n4HGBRD0sMG/MEJNpiuZpiJElYiRA+1FNzOhdrYW0jgJ3jDpPzu9GA0jYChd8/tc7aMsSUWxDnj9YQ8gFFbg0qHJy4wljbjYcgbhwmSX7jyjq8DwWP5qmnokfXyBQlNmbcVBYNMaOcEw4pK4ftv1/2/yFcII7y2A2L9JheOvAL42f0XamLtMpCQ14ZvlR9lVmaeMgLcVHq2i8qOEJTY1XTQh7KbX07343DnRUGt1m8KyQCDyJ8jOV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(478600001)(8936002)(54906003)(5660300002)(6486002)(26005)(85182001)(4744005)(83380400001)(956004)(8676002)(9686003)(33716001)(316002)(186003)(66946007)(6496006)(6916009)(4326008)(66476007)(66556008)(16526019)(86362001)(6666004)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S2d2TVRLYkNXQzlKMkVtTVJZSEF2SDErZXBnNXBZck9hWFhxYWtzb3gxTG9D?=
 =?utf-8?B?b3JYUWJYcGpmZkRZNlVWNEFwTHhBZ2k0WlVnNDU2KzJpMEtPZndqVm9uTE9J?=
 =?utf-8?B?bUZOWXpqNUtybzkxYjFPM1cvcW1CWXRmVXhFakhZcS80bjFvY1VNTDBCUEh5?=
 =?utf-8?B?Y0Zvc2hsL0trbGFvQ2pTSGhFUGRma0kvWlNMTUNJZG10dHRrNVk1WGgzZFpB?=
 =?utf-8?B?c2tmNEJLUmpZWWFtT0diQ2lIU3hweVFYRm4vUFhJWis3MWxNSlB1V1l3aTlJ?=
 =?utf-8?B?SzN1MXpSOVVCU3F2bkIwek1ERll1bG9CaFVCYStZaVk2dXFWYVZQVWNPQmor?=
 =?utf-8?B?SkV4a3AySGJvUkZpWUw5ZzM4bk01K0lMVG1VZ2tseFYyRUZSaHVtYi9qRjJS?=
 =?utf-8?B?RUQrV0ZkTDVrbFFGdXI5aGNyTEgrTlAvZHdxdEIvNTQ2cE1HWWV6MVpVN3lx?=
 =?utf-8?B?eWRzeGl3Zk5PN053YXVvNDQyN0xnVUg3ZEtsZU05TUZ0TUZxd2tQYW9Jd3J4?=
 =?utf-8?B?L2RTSGt0SllvdzZQUnVOZGMzRUV2c1VjNnJPWVZ4c1NMOWYvNkQxYWxnVFo4?=
 =?utf-8?B?RzZEQjcwZElnbG5tRWRma1M0QWhqSHpyN2Jyd3RCRm5Fbkp5dWhIQkhta3Yw?=
 =?utf-8?B?eEdoY2lBTytUSlFzNy9uaS9YbXlUTEl1Rjk5OXZ2YTYxL1M3YVNVQ3htV1ZV?=
 =?utf-8?B?WnByUGphRzA2aDJtQ0ttMzJLMEdHcXlPaHNZTWtGS202L2l6dUtuUWpMcWNz?=
 =?utf-8?B?emNQSW9HUlpnR0FGNGpSK0J1NmpZdGdVeHo1eDh6aWRudk5NTlQ1dSt4V2Rt?=
 =?utf-8?B?ZCs5bG50a3RLTmd2MzFsZWVpNnN1RmwyTDNnY2pHZEE1LzlyTk0xTWZ0ekNJ?=
 =?utf-8?B?ZEZpeW9LRjFUMnQvYXhXcHFvM2JmMllTbTRoTFJTWVBnQ3lENms2bEhvWHh5?=
 =?utf-8?B?VFM2VWlHVTBhOUpPdXZjbDh3RnB2M1Fza2NZOHczWmRDUVpkZmpLT2NjRWM3?=
 =?utf-8?B?aTZPOGdTenJsSVAyM2hadzFjZWlXL0Q4SVVRNHdXSGdzc2JwbEtCNjJNYzRH?=
 =?utf-8?B?V0NYSWdkd1RReXA0cHpPdm1CRFNnRG5VK2NjbzlMc1lNOXpMaWFqak1OL1I0?=
 =?utf-8?B?WGZmNS9VNG1LcE1jSm1SREdRbzdyUGhOaFBuTW1CNnM3L2orRHpmRzFIVnhZ?=
 =?utf-8?B?S1hoOXd4ekJFSXhGMGZRUlh5cjVDZWVHWXZrQTVJbFdNOTRqeTFjd3NNYU01?=
 =?utf-8?B?WlhqV2hoWkR2OVdUdjh0dlRqaTBxRS9QWmxjYkxCM3hMZmo2OTVkMlo1aW1O?=
 =?utf-8?B?WTVYSWJXMWI1RVJUK0ZUUWZ2RGlnY1hjS0ZidGlqS2V6YmZrc3NYaFVESHVu?=
 =?utf-8?B?QUIxTjBHZUFuU0lCNnI3Q2JRMlJyTGI4WFVhZUxkUkMwbVlodXpTV1huZkdI?=
 =?utf-8?B?K2h3SU1BSHFCL3dFVk5iZktHZHYzWWozR0RUSCtuWEpDQzdDTS9pU2R2NHNV?=
 =?utf-8?B?Z0NIaHNKbDdWVW8zK3gvM0hMeXdOczVZQVNSaklGYU9SNmxycm5Hendlc2Y0?=
 =?utf-8?B?ZDJ1eDdXbVdxNWhxaURhRUhVK0VhOVpZb2VnV2xrSUp3WlhVamZubE1DMkpz?=
 =?utf-8?B?dmh1S0sva2JjY2RJMnJvRzM1YTdiVTlKbWJQTkVXZ0Y3THhNem1PZmhmQWtM?=
 =?utf-8?B?S0RHWXZLYUgxbSt1VnRRRGlYcyt0V3ZTK0RlaDJsUDBnVkZMK3JHTUwyb3p5?=
 =?utf-8?Q?6IslM/PiBZdJ0ehYgMzje82JFrVBORQ3mTW+Ekc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6deeb56-c279-48ae-8675-08d90fc9df81
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 13:29:56.3481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0FWykxC0pvlTTf8qmmlk5sQTVjOnOFmAJihB7OxCd8NwXlvMqVnHqptv7pOg3KRm61iwazlosL073H3d8mCkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4538
X-OriginatorOrg: citrix.com

On Thu, Apr 22, 2021 at 04:44:36PM +0200, Jan Beulich wrote:
> This is in preparation for the area size exceeding a page's worth of
> space, as will happen with AMX as well as Architectural LBR.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Even if the naming of the new helpers (_xvzalloc) is changed.

Thanks, Roger.

