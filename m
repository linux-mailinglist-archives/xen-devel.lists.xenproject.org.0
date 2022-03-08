Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22CD4D1308
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 10:06:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286648.486251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVmY-0001Ke-Bi; Tue, 08 Mar 2022 09:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286648.486251; Tue, 08 Mar 2022 09:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVmY-0001HE-8A; Tue, 08 Mar 2022 09:05:26 +0000
Received: by outflank-mailman (input) for mailman id 286648;
 Tue, 08 Mar 2022 09:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRVmX-0001H8-0w
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 09:05:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1bf699b-9ebe-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 10:05:23 +0100 (CET)
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
X-Inumbo-ID: e1bf699b-9ebe-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646730322;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Gw8B0zsr1ciZQ8qzMk8LOZmk29LT/7Z/wjnsOSgryiE=;
  b=WY4QuyRaDDATA5XbfNsOtBofycs5kSrAC9uyAOf7xMhpbCx1s7m1yRw0
   QPlHRaUkpM6ryH/Ml2+hZSjha1lSZitjuA1oI4evs4tzqvCw90oL5T4AU
   9V9ryZ4YASOjyCvZwMmWjfnryu0UlFZJE4+sjUE/vfGfBjHXo5SZcmixi
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65163526
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:S24Frqmk4c10ChBSm/0Q0JXo5gylJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCjvVP/vZNGPxf9slO4nn8xsBvcCGm99kTVdoqyw2FyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1PV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYFD8Rfer0ouokYxxRSiF7Z6JIp+bWLi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6uHO
 ZFEM2QHgBLoSkUfPVALGq0F39zx3CL/bRIHmkKwuv9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcJ4SFab+9+UsiQWX3WsVIBITXFq/5/K+jyaWWdhSN
 kgV8SoGtrUp+QqgSdyVYvGjiCfa5FhGAYMWSrBkrlHWokbJ3+qHLjU8dn0GUOYojf8zTGUq0
 wWGkYywFDM65dV5Vkmh3ruTqDqzPw0cImkDeTIIQGM53jXznG0gpkmRF4g+ScZZmvWwQGitm
 G7S8EDSkp1O1ZZj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 SBsdyu2trlm4XSxeMqlGr1l8FaBvartDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0NusEMbCbxNP8qOOpd7vjGK4C6TrwJsdiOMrJzjmVZLlfbrEmCm2bKt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8riq85wHLLDSeFE6cIzjYteIqY4cl0Vet/09vs/D/
 22nW18ez1z6hHbdLh6NZGwlY7TqNauTZ1piVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:DVgvtKPR/p0JzMBcTyP155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W2Dk1ZrsA/ciYoV9MOOA4ge7rANoWfe2OEDIqtSW6XYZ3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.90,164,1643691600"; 
   d="scan'208";a="65163526"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE/dUvw0Ws1HbN/eLLk7Qs84bs3Ghnzl8FkCNwKz8jSSktpte06XvtTIRcxkOWVlYXLmw9U+ta8vlhHJnM9lr1uA3UHVlBfdZYQtUw2JmxINh1QAnbIKuOVApxt6Brgvz0eEYpfUok98/VpaQSKoWd1JKnjPh8nLBqPA+6rGOHMZjipOwROT3xHBuZDjY3OKwGUtwqJDHyYGclb35bEhZxjEN8MPLK41Dsi/mS1w+htVXxX/8zXj7p8cYkfqtJFugZfFkNo3W8LSZoNypvXLJcMxIeE8jc3lLfZOhziEZBjCEQ5seachNOWWoMRaEQcEq+b1I85xh2es5lKe07iz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNnwGePBMn/RtJGeSRzZsxRbI8wWIAT9UcWf2v/fO+M=;
 b=IVF8AIo2s2CBry98y1/hQJsvHvpjk7juTZq8iMf7/v70YdXl+LDL0z73ulEF6FPzwI/Jje6YYayyJE7RxvfgP5zwHjJWgupKr+1JveopHTHvOnB6YfERboDOCwL1chDLTDBo8lcp+L2wciZ6wBNfz9TYotd3YObnHcOfu/j6GvIY3qbm8RfeZtw19JlcFJ5Cd8e1hHau1+se6RFru/krY3BLDIlg7oPccmLe7HGze0oWJi/yuZaANTzBOnBGYqm0WcEhoY9H/7KUC+GScxeyiZlTHDQLm43C+6eRJpf3egl+yb9aYys3yb+fCsa2y3Th7elGLB1mGzZklhXSz/12sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNnwGePBMn/RtJGeSRzZsxRbI8wWIAT9UcWf2v/fO+M=;
 b=d9UUigGrYxFGc9Tz+8uikxQtU/as6QdXREBF7knFtC9YbNCjadid9rGOX914aaYJg1aCY76f0CXCONxqtRoZw+0SSqAKq9fF8q3QFyPwxmc+VqAwxBSX77P1x1VA0R0mcVi3daC3tnOmFr99AYzJVe8uNK/tI05F4pmRCx4cFcI=
Date: Tue, 8 Mar 2022 10:05:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] vpci/msix: fix PBA accesses
Message-ID: <YiccSMWbV2StPFB1@Air-de-Roger>
References: <20220307163744.74030-1-roger.pau@citrix.com>
 <fbc1388e-8211-f498-b134-4df5b1ccd003@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbc1388e-8211-f498-b134-4df5b1ccd003@suse.com>
X-ClientProxiedBy: LO2P265CA0264.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28aefa5a-3a74-48dd-ae6a-08da00e2c3cb
X-MS-TrafficTypeDiagnostic: SA0PR03MB5611:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB5611C06BA5E9C4FE4F3D535F8F099@SA0PR03MB5611.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iqs6wbHYTrmwlMJ+ZcjUj1rHhRevKAYkfKLi0PRaOIrvh4F7qsPbJTd3FJ0F5/SV8BTh5Ic8ZFomymJtue25X4UOxKiQGD2NR0vz4nN3uryf8dXHfgW692+E66mi+IVCbumdl95YI3/SQC/GeMxn1bwnf5y7eqaHNnE5hOKELAn3o1vHzMr0pU/0ErQGK2XTydFkCDJORzjhGkAz2uJ7TRAUUj8B7zhkLPVEv5h7gWA7Uai6xtreUvGwHb4VXxdFiGzMzUhfWLT3jKOP6XjOaejm3pnTz49kX2nif1IpOwe1D6CNb7Bv+kcBsENODDsEYwqZ/kGMU54aphvWuYkgYpshDAZn6Y/hh/XlItuviOQRjcUyboZVR1FGAcNx4zdzmjB9mEx0k83UtacKsp/4IBNebFJGVda+fTNeRCVB7Gs8upTbnhobiHxCio3nuz0GSywlza4OB75jx0s55A7SI29AgxyjoeZoJUb6Tq57xDLU5ltcnfpCXUeO4Lj+mUAAF0opCAetwd6HpYKF3YsvWjOfZpABvg+4/z7shjZLJ74aUyPyCPF6aIR8gPfjkB6EBcHExOCCMl2wNkmj70SokGSLOEgxQegRqnQRsNiGbO7UaT0at5ju69Mg7lutzNCU4+1Ul310XWZdLqzoVOct4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(53546011)(6666004)(66946007)(6486002)(6512007)(26005)(38100700002)(9686003)(6506007)(5660300002)(2906002)(8936002)(508600001)(66556008)(66476007)(33716001)(83380400001)(186003)(316002)(82960400001)(4326008)(85182001)(6916009)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHBpRFYxZEhwVFpnWFp0dG9yV0RQWGtLRkQzYXZ2QmdndmJQd21Yd0NHTU9Y?=
 =?utf-8?B?Y0Y2MlE2V0VlSlRNSUY4aW9nbTFmUFVPVURWNWJIQkhLR1o2enlUMnNVMWJY?=
 =?utf-8?B?OWpIVzdpaVE1bVhwbGZsWllBT0lybmVKVm9xZ05NS3hyZTgxS0R2RFAwUEZz?=
 =?utf-8?B?USt6NnZDdTczVU5pWXNVT3cwUGVleUxUbUE1ZGRvNG1DUmRhQlZkcW1taDdN?=
 =?utf-8?B?bjNqbk1YQTMvaFBKOWF6Sm1xbWF4UTY4UzJleWl2bGZ1VU5JdDhnNUd6NXZJ?=
 =?utf-8?B?MUFnMDR3VTU1R0RKdzJMOEJYeDNYeDM2SzhjUEFTdjBtakRLR280RUZFRUF3?=
 =?utf-8?B?Vko2T01ESE51RHJxbEtXand5SkljbHk0bURFQVdhdEV4c2VSMzRqZEtVa3Bp?=
 =?utf-8?B?NmlmdW1zWk1IS1R0Z3piMkh5NTFBdnJ4VE5SWjU5OVZ6ZXlXRm5sMURoTzJm?=
 =?utf-8?B?aEoxK1hZR3ZNOWdtMG16WXY5S2FMRDJHS2tZcHR0ZHhYeS94WS9DWUpIMXMw?=
 =?utf-8?B?VStWdjdvQm5nczB2TExwSVFoZEwwUHRxZWg0blhidnY0TW1IYlU5YXpOV0RO?=
 =?utf-8?B?czQ1RFpDazVuRlFYNHBrSzZ5ZXlYWmxNQzBEVWsvSTAycWdLNm1zVTJJNVh3?=
 =?utf-8?B?YnBLUUZKWGdsU2Y4K1pFcVFTZ0JITHcxeENwTElOMUJsRTFOekN2UWJaMXFn?=
 =?utf-8?B?Y1RxNTQrazVxWk01dG13WThyYWxZdlJQS004UjVxbjBGUnIydHViRnJoL1li?=
 =?utf-8?B?RXlHVEZLM3Qyby9mUEZwTW16dkhIeHI1akMxOHdlT0JySDBHWUFYSmlLS0k3?=
 =?utf-8?B?UVFPbHJvREVnY1FkQXg3ZEZmNWo4Z21PSWdjZGY4UmxRdWdlc25rSzZZTmNw?=
 =?utf-8?B?TzNaM09BMmNZVjMzdFpwNnV4Z2Y1anJwUjN6eFlhWjYrUUl6N1ZibFFZdzRP?=
 =?utf-8?B?enhiZlBrQzAzSmhkc3B3a1BCS0JIR01FV2lTek03YjJNWXh5TjJWVnQ0enZa?=
 =?utf-8?B?QTY3N3RSNHZvNjZPOG1tZ2R0dDZZY0R6aXBVS2hDS0djMXQyMHA2MXMvblRr?=
 =?utf-8?B?SDJIaFlNOWlma3BPSXJZTDJ0WXZMem8xNHRjQUs4MVRtejluMG5uOGJHUkF1?=
 =?utf-8?B?SDdua0p2d3krdUl6djRQbzFXb3lSd1dnM0txQzhaakE3bTdHRUYzM0hUNDEv?=
 =?utf-8?B?c1VFQ05QM3VrNHVvT2ZIZjJPQlBNN21GWWZ1R1ZVTVpuSUpzbWpFRnVUZm91?=
 =?utf-8?B?cHBlVXdZQXR6YnpZaFk4cmxqWHN3NHNMTyt6akZXbSttVmpSZWRFampOZmEz?=
 =?utf-8?B?a09sc3Z6ajB2M0w4NnFTek16UUl6SENVZE9DZmVlcXZlV2VZaE5xa0JUSlk3?=
 =?utf-8?B?YnRhRnVQRGVSOUl6RVVXZyt3OSthUU5qQ0JmU0hSK3hlS2FOMGF3eDJyWHZL?=
 =?utf-8?B?aGVZb1BqdWFWMzJ6R2JTSTMwT2JibFlMVGsrQnc4aFJNdkNGZE82NWtONVh3?=
 =?utf-8?B?aHJEc0ZSTGh2ekFVY0hQZ1d2N3J3QVQ3NVhHYmVCSjM1ejB1VTlnV3hFTFI5?=
 =?utf-8?B?dlRWNm55NVlMZ0tMWHhmeWlCaFJaOWc4SWZncS9NVmVWTVE1bkYrRzVrWTZq?=
 =?utf-8?B?bytYU2NOOTJyODlKM0RLdlVTdVlrSDhMS1loYXMzSTZ6Z0JieFJrYlNYZE4r?=
 =?utf-8?B?Q2pubm1kQ0d0Zy9HSDRrYjZmNHdmcndsUm1Cb0Flb0dXV3ZJcWU2VVVVS0tT?=
 =?utf-8?B?MGxsaS9QSmNMaXJ6aWdKN0ZBakhZNHFsZU8zWVF6cjBvQkIyUFhUbEo3V2lr?=
 =?utf-8?B?R0xrWmRNWWFzelNPNDlQY0F5QlZidTB5c0pyS1ZmSVR1YUZTL3p1Tjl3MkRW?=
 =?utf-8?B?bExCdERod1FFZ2x2RnN1K29mMTQ4am9MUXpGMnlJV3daeldtOHNZMmNHclNi?=
 =?utf-8?B?Vk45bEZvVU5VdUFXaysrb25QRTl0cTVPRjdrV3pINkpZa3dkTEpGUFg3OEFl?=
 =?utf-8?B?aDRDL3hHVm5hRkh0OTE4a1lTK2FQZWJLak5pRUFrUVBvRDhSajlSTVA1Ky90?=
 =?utf-8?B?a3NDcjd4YnhhTHdxUk1mNzZmcEZLdDd3ajZodmcwcG9ONDdzZy9Na0JJYUFZ?=
 =?utf-8?B?a0NSVDBIRmErVGNydkZTOTJ1N3RpN3NoY2FaTTYyQzVuSkE0YjZkMFpzVFpJ?=
 =?utf-8?Q?NsrSo3Aff8fYEguGZ1j080I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28aefa5a-3a74-48dd-ae6a-08da00e2c3cb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 09:05:17.5735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVrdjKwHl5gQmICvF6I6oSQ30WvFiaYPv+QiqeomvP4IK/Fure9zdjQtwT9a5dOc36VCAP8b0QI0exQOpaIH/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5611
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 09:31:34AM +0100, Jan Beulich wrote:
> On 07.03.2022 17:37, Roger Pau Monne wrote:
> > Map the PBA in order to access it from the MSI-X read and write
> > handlers. Note that previously the handlers would pass the physical
> > host address into the {read,write}{l,q} handlers, which is wrong as
> > those expect a linear address.
> > 
> > Map the PBA using ioremap when the first access is performed. Note
> > that 32bit arches might want to abstract the call to ioremap into a
> > vPCI arch handler, so they can use a fixmap range to map the PBA.
> > 
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > Cc: Alex Olson <this.is.a0lson@gmail.com>
> 
> I'll wait a little with committing, in the hope for Alex to re-provide
> a Tested-by.
> 
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -182,6 +182,38 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
> >      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
> >  }
> >  
> > +static void __iomem *get_pba(struct vpci *vpci)
> > +{
> > +    struct vpci_msix *msix = vpci->msix;
> > +    /*
> > +     * PBA will only be unmapped when the device is deassigned, so access it
> > +     * without holding the vpci lock.
> > +     */
> > +    void __iomem *pba = read_atomic(&msix->pba);
> > +
> > +    if ( likely(pba) )
> > +        return pba;
> > +
> > +    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
> > +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
> > +    if ( !pba )
> > +        return read_atomic(&msix->pba);
> > +
> > +    spin_lock(&vpci->lock);
> > +    if ( !msix->pba )
> > +    {
> > +        write_atomic(&msix->pba, pba);
> > +        spin_unlock(&vpci->lock);
> > +    }
> > +    else
> > +    {
> > +        spin_unlock(&vpci->lock);
> > +        iounmap(pba);
> > +    }
> 
> TBH I had been hoping for just a single spin_unlock(), but you're
> the maintainer of this code ...

Would you prefer something like:

spin_lock(&vpci->lock);
if ( !msix->pba )
    write_atomic(&msix->pba, pba);
spin_unlock(&vpci->lock);

if ( read_atomic(&msix->pba) != pba )
    iounmap(pba);

?

Thanks, Roger.

