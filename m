Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272B8366F32
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 17:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114853.218959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEoF-0004aH-6C; Wed, 21 Apr 2021 15:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114853.218959; Wed, 21 Apr 2021 15:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEoF-0004Zs-30; Wed, 21 Apr 2021 15:30:35 +0000
Received: by outflank-mailman (input) for mailman id 114853;
 Wed, 21 Apr 2021 15:30:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZEoD-0004Zn-5U
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 15:30:33 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36198815-4bbc-4182-b7af-f19da829ed54;
 Wed, 21 Apr 2021 15:30:32 +0000 (UTC)
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
X-Inumbo-ID: 36198815-4bbc-4182-b7af-f19da829ed54
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619019032;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7GTFvmj5tiOPMSvBHBZfo+yqUbhTF+or9i3lEmFYoNk=;
  b=JScbOerhZ+Mgq5H7o1PHHU+/ity9CTCbKN040yGUrPFq5XAbUz4i+HvJ
   H4FwhC3EuPBZdjhL9c6D6sZc/VpbHniFInH/MCw4pzc5+YIwdmLJGGR0l
   x1UoA4MrY7jVTolrH5VwfFJb8GGvYdW+N+lDMvjB4uXAD++SD0gCotcfW
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nrGl7Tc2OPjYsOc9A0cWjD8yx6V2rSgnr670QhqnWCtnx4ECoxrQyQHU0PXd/JGChJ6jOR/zta
 /TBL18RtHZPEku89ZCEdtaeOaxyPno8SfOCaUIi4+FmwdjTAS8+rS550VwAs9exf2qBb+J/bgV
 OtZLV4gQFpakwcCUY5mfGhfgGJ8yZDDKtB3Zl0EW3pyhyFzs3zGN3mZMQt/TAui+zDIrb11OJx
 38cK3fnJ0+1p5MqG/llRzKq41V4gf2mhq3uBCy18w3uuMFPQNfKCK+3aj/TUMXQKUCZ1pKZcdC
 9Z0=
X-SBRS: 5.2
X-MesageID: 42220237
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Tkun/6830l22zNtjU8Nuk+FJcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUfD38Zn/+
 Nbf6B6YeeaMXFTh8z3+RT9Nt4mzsWO/qzAv5an815GSwZ2Z6Z8qyJwDQiGGkN7LTM2fqYRPp
 ya+8ZBun6caW0aB/7LTUUtcsrig5nwlJzgaQMbHBJP0mWzpB6h9bKSKWn94j4wSDVKqI1CzU
 HklEjD6ryno7WHzHbnphbuxrB3vPek9ddZHsyLjaEuW3/RoyKlfp5oVbHHnB1dmpDJ1H8QnN
 PBowgtMq1Ighu/EF2dmhfj1xLt1zwj8RbZuDmlqEH+qs/0Ti9SMbsjuatlcwDU40dlnNZw3L
 Mj5RP9i7NrDAjNlCm42t7QVxsCrDvXnVMel4co70B3YM87Uvt8vIYf9ERaHNMrByTh8r0qF+
 FoEYX1+OtWWUnyVQGUgkBfhPiXGlgjFBaPRUYP/uaP1SJNoXx/x0wEgOQCg3Y78o4nQZUs3Z
 WKDo1Y0JV1CuMGZ6N0A+kMBeGtDHbWfB7KOGWOZXPqCb8AIHCIj5Ls+r066KWLdfUzvdUPsa
 WEdGkdmX85ekroB8HL9oZM6ArxTGK0WimoxdpZ45R/p73gVLvmOSCOUzkV4oudisRaJveed+
 e4OZpQDfOmB3DpA5x10wr3XIQXKXR2arxXhv8LH3a15u7bIIzjseLWNNzJIqD2LDoiUmTjRn
 8KXD35ItRc/lmmM0WIwiT5ajfIQAjS7JhwGK/V86w4044WLLBBtQATlBC+/cGEKTpLt6QsZ0
 tgKLb7kqe2zFPGvFrg3iFMAF5wH0xV6LLvXzdhvgkRKX75dr4FppGCY2xIxWCGIRV+VsvSFw
 Zaqz1MiOeKBq3V4RpnJ8OsM2qcgXdWmWmDSI0EnLafoe3/fIkjM5ogUKttNAnCGhBvgzx2oG
 NbZAJsfD6aKhrezYGeyL0dHqX2asR1igbDG78vlVvv8WGn4fwJalRedTi0SsKTiRspXFNv9y
 BM2p5apqGBlzapIXY4m8IiPjR3GSmqKbpbEQWIY5hVkLj3eAd2CXyHnyCelgtbQBuXy2wCwm
 PmNiGaYvfNHx5UvW1ZyL/j9BduenyaZF8YUAENjaRtUWDHsG10y+mFe+661HaQcEILxogmQU
 X4SCpXJgNl3Nas0hGJ3D6ECHU9350reujQFq4qfb2W2nSjLuSz5NY7Nu4R+JZuL9b1tOAXFe
 qZZg+ONTv9T/ozxBb9nAdXBABk7H0/1f/40hzs62a1mHY5HPrJOVxjA7UWOcuV4WToT+uBua
 8JxO4drK+1KCH8e9SGwabYY3pYJhTfrXW/QusopZpX1JhCwYdbDt3eS3/FxXtH1BIxIIPoj0
 sYWr18+62ENYl1fcAeEhgptmYBhZCKNg8svQP3CONlIg1ogH/fIt+T473H7bAoGVaMoQPsOV
 +Zty1Rls21LherxPofEeY3J28TdU03rHJl9+mGf5fLCAqre/pYlWDKQEOVYftYUuydBb4Urh
 xm+NmGkO+cajrg1GnrzEVGC7ML93ziXNi7Dw2NE/NZ6tC2OVyDha2x/c645Q2HOQeTegAfno
 1KdUsZc8RFhH0jleQMo1ePdpA=
X-IronPort-AV: E=Sophos;i="5.82,240,1613451600"; 
   d="scan'208";a="42220237"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLY5Ic5z5roKtEpzKgu51grfAoa0omCWNu8brzBOeIIW/03VQJNmRda/QIvRUmtbwJNwQP8CdbNQAicRDJQi4BoyZXjBCoBmWo5lDajJ1ciLIGlA9ZPlXQ6BRntp1eDgSZfL1J6hr+YkTEmH+VTgDX5x0QaoxQexp24R1UMo6Xo+QPbmV8Ydq3Pkt2WVsDECDT0eMEjIe8nVDKyX/nckVP+wfgJy7KVyoijSArwKVcovvVwEhHo0HtJZAy01ky/xQuj8EWivGPtNCutblSw/j/ZojdCk7LE9SX7xShNn5LdTaDk83VdG6LTDu3qk5im2oo7d0I8nfcoVvb9bDrn5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7seD1LasRbHT6lD7acTtdbEuctuqErrVk90P996TXho=;
 b=iN0MYZqa2/DM9lCfG9U3NCQ0H1XBMfm9caCOwVXJG9OZrSzFJuhyNlF+95T9EO3MhLyHdQtAOTdzvhdyBU3R2yhn0X+JsWvZAVtsKEcX4EKjgB/XG3qzV4aJm6OIUeVgRLIS5wjNIiOR225rssDCc7MkIcWVfwigVRTFq+6YOm6CsZLZh7SG+fBPRxEitYnt82awTG12BsEs3CJblO56fj4QjoVaH4tExYSHNtZ3GdBvuPdaoz3aMXVs2WDwtAJWGPXWFKKwiFqfJdkw7fhVllEvJKK8LSZEqSzgp/87VPW9pHZ0BjuNVCN88aVo575NbntmkI3caPiPGX2cP94b6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7seD1LasRbHT6lD7acTtdbEuctuqErrVk90P996TXho=;
 b=xTlXZ8fCCV9C0cTGX26ArLO7ABXZc7/BF+MmCwIwHb2IX8GCAZcS0p2s+fi/m0ZcEWa4AVNQ1kJnTjVTAvqkmuwKjmDo10qa7gtuTezkH9nW2tYIOFbfAQ4yCclfeK4RA/FuAs3X7G2/OjB6ruK3h5Ji8tFl+4Cwcausl96tvgk=
Date: Wed, 21 Apr 2021 17:30:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
Message-ID: <YIBFD4i6bLaeaXdE@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <96cb4039-5f43-8eac-d855-c9f1587ed2d0@suse.com>
 <YIAJP0SCq0nOKZVL@Air-de-Roger>
 <6023c1d3-4f50-d207-1ea1-30dd1d5f68d2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6023c1d3-4f50-d207-1ea1-30dd1d5f68d2@suse.com>
X-ClientProxiedBy: MRXP264CA0047.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e6d86c1-ab98-4c88-21df-08d904da64c0
X-MS-TrafficTypeDiagnostic: DM6PR03MB5289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5289AD34949F73BFFEFAF0A48F479@DM6PR03MB5289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bE3oa9LeWNKFOKxNqVJgYwrXThyGjDSs9JDDk4sqkhU+OyoCbSM5nI5glr4rDZP/4gm6ngqGWzrFK2ZcJoR2/T1StUie+HQCQ+v/Khlsw63itlAeq3/Bp5VQZP3v6ZfwnBh2jZ5xBom4VLw10Z/gnfCRZQxAuJaZ5rDWrIgzde5big88QLOOmOHHHvPT3WDJr4oHv4oI57NjOSg8Mw/+/b2ewMIGzhlPN4ib60CDwMbt749gi3Hl1rwuoxCajpWkK0jie5tydm6KJ4AJDcKf/usqCaFpeICQ9/T8jNlLzdyurAHwhqL/ktHQSpnfk1wDqgBpbT6Od0iljaaOLXgpE4ypR6QvpMJ6c3bXre9cHbV468LB48v1TxhSn+n1P0Jzgmz3JVhP7Kf8jAhmGvQ5D3P+MjBuhUpqkyVCTOb5RPFDK2kazLxwthllsC8yTgBw80yzsxtZlLApmJBL67N5X7djizgP2G+LHLUqdvGEUwWQdQQYIWVXuJC5GtUsnT5Wlfsb61NuXPTzZjTROQr9sptOvBv+g9LeJ/bxapS08hxfbEVv27QODAjIbCVx5Mlg9QbKS4FMdGMYK/Yv42yO8rcn2X17BPwjx62titQWhqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(39860400002)(396003)(366004)(136003)(346002)(186003)(16526019)(66946007)(26005)(8936002)(478600001)(316002)(33716001)(86362001)(38100700002)(6666004)(83380400001)(6496006)(53546011)(66556008)(6486002)(8676002)(54906003)(66476007)(2906002)(9686003)(4326008)(6916009)(956004)(5660300002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZEZ3OE1oMEtEL1JERlJCTEdaMDdQU3hpYUtjMXB3OVFZRXBkMUFsRjNzSVhp?=
 =?utf-8?B?T1B2c0NVbzNPN3BGYzBhOTZ0SUd0UVhOeEF3NGUvWXFWODJxMVFBdXBueHUr?=
 =?utf-8?B?MTBNczJwTXFrcnY1OU5IaFljWlA3TjZQRklhRmNIT1JRcnRxU2VTc1BqWElq?=
 =?utf-8?B?a254cmMrTEJDZ3FTUkY3TTJIdURuZG1HUjBYNHFkMThoaG9jZ1BPLy9TSmo4?=
 =?utf-8?B?N09NdjRyQ012Qlhqdi90R25OelhWUXJNaW5HVzBGRnAyYXJOT2cvaWd0WUY0?=
 =?utf-8?B?RXd3cTV5WDhkaWZNNjZTbGZ4VCtua05KeHRpTWM0TldTZDQzMkR2L1lsSmpU?=
 =?utf-8?B?alRxcE5nbElwc042UUNIbXc2TDNvczRLalVtL1VGWFRqc2NoU3BXWFJtdGRY?=
 =?utf-8?B?Y0ROemEwU1RJazk4V0dzMGFQcFVib0NYOEVNMEtsYjZaRitlamYxM1cvQS8x?=
 =?utf-8?B?MlR6SFpMWndYd0lib0Z3NkY5VVpNbDRoVDR4UDE1S2UwK0ppTnJ5Z2lMczgr?=
 =?utf-8?B?b21WMnNyY2l1bnVwdGNSeG92K1lWbGVyRGdqRC9lZm5wZ01HS3RIem5qakNs?=
 =?utf-8?B?Snh2ZnhSc3k2MTRqSUI2MXBCajdBb09TazVVaDZzODJ5SmtrWCs3TWY5MVpj?=
 =?utf-8?B?MUF2SHNZMWdKVUc2MEkweUlBeSsxRk9mTnVFcG1pWDg3azdjdmVoOGFGMnpB?=
 =?utf-8?B?YVl1R2djODRQZlNna2drL1MrV2ZBMUNLeGZXZDkxTCtRZ1pvWGk4b201MlVR?=
 =?utf-8?B?dHRjWWFGVExpSCs1cjRPcWdHQzExNmxZSnZaQTYxT2lFam9BTnpmd1dPZ1M2?=
 =?utf-8?B?Q0p6S2NpZS9BeGZrSUxxclZUeWw1TXJKRitJSXd4UEVKeHFYc2NOMStadGZK?=
 =?utf-8?B?WWNUb2gwKzJEQndQUzhvNkpsUW1uNTZXc1lCUUs1d2FtM3lpcmN4cVhIYkVy?=
 =?utf-8?B?L1J1eThkR1N1ZG1xblhnbjJCbWY4V2xoZXd0aGtpNW9DK2NMTkpsRThXNDVy?=
 =?utf-8?B?K1VsWXQ2cTZuanJiaEFZUnE2R1BsS2NNOTZJNlJuZytDZ3dySW5YaHZ6bmw4?=
 =?utf-8?B?NGRkNEFncGtnUVUvMDRwWlpRLytpakRVbG8zdkozNHlSelhKWnFTb21JRHlq?=
 =?utf-8?B?SGkrOVJKWWF2TkdtRElRMjczeGI3VStyTWtHaDlZSDJxekdORGhZbm50V2lY?=
 =?utf-8?B?SkxNUVg3b2pGSi8rQ0x6UFRqSklOM2Q3U3dhbm4rdzc5VW1Bc01mM2xLS2Zk?=
 =?utf-8?B?UVZNWHlUY2M1NEhBbjBZV2VOWE9aalVwTU5DUWZRT1BhWXk1dWFqc0hsUG94?=
 =?utf-8?B?Y2lZa0JoRFl1Y081ZS9iSHBuNm1WdjhpMTIwZnE2eDFIeXNzaHQ3RUdFeXZj?=
 =?utf-8?B?K3RoZGxjcnV1aDlBdXdXNWQyUjFVVVlGL1BVVXo4U1VLN0RjeEU1NkM5ZjZw?=
 =?utf-8?B?SlVYekl6ZHp2c3ZzcjRTY1E2R2pGNnhXTENBZ0srdXQ2UjVtT3luMTZkT0tN?=
 =?utf-8?B?SWxnUFY4QmdtUU95KzdBL1UxZ21pcUJYWHpMcUMyaUxTSlFuK2Y0cklhZm15?=
 =?utf-8?B?SXRnMWdWODhjclNMWjFPWENOMHJETU54Zk5mMFF0WU5GZXlOQXJ3V3IxM0V0?=
 =?utf-8?B?UGhaQWRyeHBaNG0rY2ZuOEc4cDAySXJDU1ZpdTA4aVp3ZmVzaVpVdXVDY3ky?=
 =?utf-8?B?dkN4NkhCbjV1K1FnN0RGNEh0TFUvUm95elJUVEpWVE0wVnU4c2lqSXR0UnEx?=
 =?utf-8?Q?lDiIV/QGS+7N52XJqBEU91IzyfYKKe56I7pCE8C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6d86c1-ab98-4c88-21df-08d904da64c0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 15:30:29.0585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DrNx7IP6Fxi0n9R+G4jHBXtsHWbjLDUkq8+gVIOBQsYASfCiTKdf9i5AdfEnRUnFzQtWyVw3ERl9dnq+81fAkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 03:06:36PM +0200, Jan Beulich wrote:
> On 21.04.2021 13:15, Roger Pau Monné wrote:
> > On Thu, Apr 01, 2021 at 11:47:03AM +0200, Jan Beulich wrote:
> >> ... provided the linker supports it (which it does as of commit
> >> 2dfa8341e079 ["ELF DWARF in PE output"]).
> >>
> >> Without mentioning debugging sections, the linker would put them at
> >> VA 0, thus making them unreachable by 32-bit (relative or absolute)
> >> relocations. If relocations were resolvable (or absent) the resulting
> >> binary would have invalid section RVAs (0 - __image_base__, truncated to
> >> 32 bits). Mentioning debugging sections without specifying an address
> >> will result in the linker putting them all on the same RVA. A loader is,
> >> afaict, free to reject loading such an image, as sections shouldn't
> >> overlap. (The above describes GNU ld 2.36 behavior, which - if deemed
> >> buggy - could change.)
> > 
> > Isn't just using (NOLOAD) to signal those sections shouldn't be
> > loaded enough, and thus don't care about it's RVA?
> 
> As said in a reply earlier on another sub-thread, (NOLOAD) is meaningless
> for PE. The fact that I add them nevertheless is just for docs purposes
> (or if, in the future, the item gains significance).
> 
> The main problem though isn't "load" vs "no-load" but, as I thought I
> have expressed in the description, that there's no "don't care about it's
> RVA" in PE. All sections have to have a non-zero VA above the image base.
> This is the only way via which sane RVA values can result. If sections
> get placed at VA 0 (which is perfectly fine for ELF), the RVA would be a
> huge negative number truncated to 32 bits. (Again, prior to binutils 2.37
> this will go all silently.) Plus the respective sections would come first
> (rather than last) in the binary (which by itself may or may not be a
> problem for the EFI loader, but I wouldn't want to chance it).

Thanks for the explanation.

> >> --- a/xen/arch/x86/xen.lds.S
> >> +++ b/xen/arch/x86/xen.lds.S
> >> @@ -312,10 +312,60 @@ SECTIONS
> >>      *(.reloc)
> >>      __base_relocs_end = .;
> >>    }
> >> -  /* Trick the linker into setting the image size to exactly 16Mb. */
> >> -  . = ALIGN(__section_alignment__);
> >> -  DECL_SECTION(.pad) {
> >> -    . = ALIGN(MB(16));
> >> +  .debug_abbrev ALIGN(1) (NOLOAD) : {
> >> +     *(.debug_abbrev)
> >> +  }
> >> +  .debug_info ALIGN(1) (NOLOAD) : {
> >> +    *(.debug_info)
> >> +    *(.gnu.linkonce.wi.*)
> >> +  }
> >> +  .debug_types ALIGN(1) (NOLOAD) : {
> >> +    *(.debug_types)
> >> +  }
> >> +  .debug_str ALIGN(1) (NOLOAD) : {
> >> +    *(.debug_str)
> >> +  }
> >> +  .debug_line ALIGN(1) (NOLOAD) : {
> >> +    *(.debug_line)
> >> +    *(.debug_line.*)
> >> +  }
> >> +  .debug_line_str ALIGN(1) (NOLOAD) : {
> >> +    *(.debug_line_str)
> >> +  }
> >> +  .debug_names ALIGN(4) (NOLOAD) : {
> >> +    *(.debug_names)
> >> +  }
> >> +  .debug_frame ALIGN(4) (NOLOAD) : {
> >> +    *(.debug_frame)
> >> +  }
> >> +  .debug_loc ALIGN(1) (NOLOAD) : {
> >> +    *(.debug_loc)
> >> +  }
> >> +  .debug_loclists ALIGN(4) (NOLOAD) : {
> >> +    *(.debug_loclists)
> >> +  }
> >> +  .debug_ranges ALIGN(8) (NOLOAD) : {
> >> +    *(.debug_ranges)
> >> +  }
> >> +  .debug_rnglists ALIGN(4) (NOLOAD) : {
> >> +    *(.debug_rnglists)
> >> +  }
> >> +  .debug_addr ALIGN(8) (NOLOAD) : {
> >> +    *(.debug_addr)
> >> +  }
> >> +  .debug_aranges ALIGN(1) (NOLOAD) : {
> >> +    *(.debug_aranges)
> >> +  }
> >> +  .debug_pubnames ALIGN(1) (NOLOAD) : {
> >> +    *(.debug_pubnames)
> >> +  }
> >> +  .debug_pubtypes ALIGN(1) (NOLOAD) : {
> >> +    *(.debug_pubtypes)
> >> +  }
> >> +  /* Trick the linker into setting the image size to no less than 16Mb. */
> >> +  __image_end__ = .;
> >> +  .pad ALIGN(__section_alignment__) : {
> >> +    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
> > 
> > I think this is inside an ifdef EFI region, since this is DWARF info
> > couldn't it also be present when building with EFI disabled?
> 
> Of course (and it's not just "could" but "will"), yet the linker will
> do fine (and perhaps even better) without when building ELF. Also
> note that we'll be responsible for keeping the list of sections up-to-
> date. The linker will recognize Dwarf sections by looking for a
> .debug_ prefix. We can't use such here (or at least I'm not aware of
> a suitable mechanism); .debug_* would mean munging together all the
> different kinds of Dwarf sections. Hence by limiting the explicit
> enumeration to PE, I'm trying to avoid anomalies in ELF down the road.

Right, so we will have to keep this list of debug_ sections updated
manually if/when more of those appear as part of DWARF updates?

Do we have a way to get some kind of warning or error when a new
section not explicitly handled here appears?

Instead of adding DWARF debug info to the xen.efi binary, is there a
way to translate the DWARF from the ELF build into the native debug
format for PE/COFF?

Thanks, Roger.

