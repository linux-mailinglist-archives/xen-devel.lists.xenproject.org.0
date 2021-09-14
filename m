Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D93540B71D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 20:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186994.335734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQDOM-0002Y6-Pe; Tue, 14 Sep 2021 18:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186994.335734; Tue, 14 Sep 2021 18:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQDOM-0002Ur-MV; Tue, 14 Sep 2021 18:42:50 +0000
Received: by outflank-mailman (input) for mailman id 186994;
 Tue, 14 Sep 2021 18:42:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5lM=OE=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mQDOL-0002Ul-4Y
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 18:42:49 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8dfd0770-158b-11ec-b46a-12813bfff9fa;
 Tue, 14 Sep 2021 18:42:47 +0000 (UTC)
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
X-Inumbo-ID: 8dfd0770-158b-11ec-b46a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631644967;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0VXfCH/cdwJgEQKo0+jzzSzMuUH2pcOWCTzTFLRlO/A=;
  b=DpEiu69cx5dH6I35m7tdg7ezDA4pUjpt7gP5s0Qtuqq/o/v+Bs285Z4Y
   2mgvK8CF1HKu0feKhBKEhgo7ul4TeFdZCJsi8rTCpE1KVeOQsMutw8wcr
   8easfDlDsIWn+Je7OcMi3kXsRjUZTzdDaRziZrv4gvzh4dzBIs3hP/8FZ
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6sjF8AzFtevgUfDVSvNxXKIcVYvBzHgsclBvj4RQ0Jde8Q0e5GotGtXyX7k431i++OzU76r2Og
 Rq5lfb9fuPdR7V5bIUtimGn2P3FKRcPoY5ocU7Yb2EYzUwR9H4JSBjXtV1BTv6SPY8hvz9wbxj
 hFzqnH3n0TdyLNFLVsF0aLC+chjizymVYKVcVN3iYJihImHsZxUsNHtn+hiBdxvfQJmtis7S29
 WdUatjU5y7TaQLUHMPf5JLtIh4rRz02SCTZJoq8QOc2cdsGG8G7/RxiG/xR3XjTlqiC84d4MV8
 Q0R/gaFmP8xE3KDPMYiStYqd
X-SBRS: 5.1
X-MesageID: 52729877
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pmlzuKJr0Fbgj5+4FE+R6JMlxSXFcZb7ZxGr2PjKsXjdYENS1TEAz
 mYcXjjQPKuPYDfxett/YY+w9xkF7JKBmtZjS1NlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM6x7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2lgflr0
 88cr6eLFwoqLLXOp+MZeiBxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpq2ZofTamBD
 yYfQRdgPCrdPxFmBlQ4IpZ9juXyo1T/cyIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wv
 H/d4yHnBxQyMN2E1SHD9WqhgOPCg2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGpKw/5AqhQ9/7UhCQpH+CtwQbHd1KHIUS7QiRyqvZ/kCBAWkeTzNbQNgnssYsQnotz
 FDht83oHzF0sPuWVHeU7J+QrDW7Iy9TKnUNDQcPRBEJ5NTLq4gpghXCCN1kFcadgtDwGBnxx
 S6Ltyk0g7gPjc8N2L6/9FqBiDWpzrDMRxQw7x/aXUqk6B14f4+vY4G06Vnd4u1EJYzfRV6E1
 FAfh9KX8OcVSJ2AigSKWKAJHaq1/LCBMTvVm1kpGIMunxyq/3OgZpxB+zFWK0JgM8JCcjjsC
 GfIpQ5f7ZlUemC2ZKV6Z4awDcUC3ankFNL1EPvTa7JzjoNZLVHduns0PAjJgj6rwBNEfbwD1
 YmzXdiFF20AWL5c92S7RPUF04AswgkH7DaGLXzk9ChLwYZydVbMF+xcbQrRMb5ghE+XiF6Kq
 IcEbqNm3z0aCbenM3eNqeb/OHhXdSBTOHzglyBAmgdvyCJdEWc9Arf6xbo7cuSJdIwEy7+Vo
 hlRtqJeoWcTZEEryy3RMRiPi5u1BP6TSE7X2wR2Yz5EPFB5Pe6SAF83LcdfQFXe3LULIQRIo
 xw5lyOoWKUnptPvoG91UHUAhNY6KETDafymZnL4CNTAQ3KQb1OQoYK1Fuce3AIPEjC2paMDT
 06Ij1iAKafvsz9KVZ6MANr2lgvZlSFExIpaAhuZSvEOKR6E2NU7dETMYgoffphkxePrnWDBi
 W57wH4w+IHwnmPC2IKV3PvV89jwSLIW84gzNzCz0Ita/BLypwKL6YRBTPyJbXbaUmb187+lf
 uJb07f3N/hvobqAm9MU/29Dwf1s6t3xiaVdywg4TnzHY07yUuFrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoPraZyPUZujjO9vBpck/00zB6oeicWkJIMhjS1CEEdOlpMJkoy
 PsKsdIN71DtkQIjN9uL13gG92mFInEafb8gs5UWXN3ihgYxkwkQap3AEC7mppqIbowUYEUtJ
 zaVgovEhqhdmRWeIyZiSyCV0LME15oUuR1MwFsTHHizm4LI1q0twRlc0TUrVQAJnB9J5P1+Z
 zpwPEpvKKTQozox3JpfX3qhEh1qDQGC/hCj0EMAkWDUQhX6VmHJK2Fha++B8FpArjBZdzlfu
 rqZ1HzkQXDhe8Sohnk+XktsqvrCS91t91KdxJD7TprdR5RqMyD4hqKOZHYTr0q1CMw8s0TLu
 O128bsicqb8LyMR//U2BoTyOW78k/xYyLiumc1cwZ4=
IronPort-HdrOrdr: A9a23:VHadHaHOfrlqKWIlpLqFeJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HkBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pas854ud3APV0gJ1XYJNu/xKDwReOApP+taKH
 PR3Ls9m9L2Ek5nEPhTS0N1EtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqZmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87ysIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXoHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1nackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMG9yV0qp/FWH/ebcG0jaRny9Mww/U42uonZrdUlCvgglLJd1pAZGyHo/I6M0rt
 gsfJ4Y0o2mdfVmGJ6VMt1xN/dfOla9My4kD1jiVWgPNJt3cE4l+KSHqonc2omRCes1Jd0J6c
 38bG8=
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52729877"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKeA8jGULhnI/BfzO0c5rLLIVneHty2Ep2ofAZeUBvLoEhbKvWOAOEYmiLuM7dFuzlldQtraAt5axHlKpsUaGiHRjoMT6vOCN6CAQDqcIX4HF4AzOLEpvBevC+Btrw2BusQZU5XJ6WJ38/H4mdIZCMHUC9de9m3QVQY0iP+BkVCFYq5SH1rKNlseYzkeuIpRz1S/hG7LUYQzaAbw9DUNtEdTn3wNDWf8qUJlzP1GnhYeZDRG1n2jfyjLe1yjbUhBJo7twuzAXN2M3IFG3ScWBfAJ7+W0rp3UfM4zVjnlKA/+yGsGKJBlGGjh1ZeKaMLFzLrQTdfPOKUdYg5Q/Ahbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/jvNcSqAoSjgZPWvDVhXor5ok7D0z6pQ9NRd4aZj5tI=;
 b=kuz1NkkdOQf8BQGV6mjrztFNw0zX5BTeKejcw1XJeggOtUnenZazI3R0Gseo3pIgHp2bl8sAqm1bV/HsfxQHzyDl+lBfLMkN3WYh1Ym7YhCfIRgZKQRdcApUIK4qk2z3gO3qohG6xfxF4VTpW2v1L8TY90ThioxDBnr0a06VuZ2juUaexwEId8OiTEhHHBdBgfclNnm6ZKgbqFLqN2Ob7F0OevPDz+3IFyeNwdz5V6sf1O5iOkGdeSo16SJouyAtdgoU1eGDALihuMJ1vsv9CrGfotjM2Q57Y40IL029YxWFg39ugkT+gIYQAxf87a9KoT4BHiEWWUGuVuFGeMrWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jvNcSqAoSjgZPWvDVhXor5ok7D0z6pQ9NRd4aZj5tI=;
 b=Y5PuBUbA8NxiKG2zFrvyUadmiGVDAXm5wKsKTskvetTI8iSzLrauJt/tKU/4p1eqZoOz51WyNqfLqPuFrx2AY9yeDnnLTUAhc/q8IEK0i94ClH6kThSe7aHjyIgg85Gb7+8OHuR3Zt6zvnALS8t0TT1SotOeweVzJa1DDYatr2E=
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Wei Liu <wl@xen.org>, "rust-vmm@lists.opendev.org"
	<rust-vmm@lists.opendev.org>, <xen-devel@lists.xenproject.org>, Stratos
 Mailing List <stratos-dev@op-lists.linaro.org>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Doug Goldstein <cardoe@cardoe.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>
References: <87lf40vay1.fsf@linaro.org>
 <abfa4f44-8c56-af3f-485e-41b58e790d92@citrix.com> <874kanus97.fsf@linaro.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Is it time to start implementing Xen bindings for rust-vmm?
Message-ID: <188afb35-54c1-9a52-19f1-867cea4487ea@citrix.com>
Date: Tue, 14 Sep 2021 19:42:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <874kanus97.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0410.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11120564-d092-4927-70d8-08d977af6f96
X-MS-TrafficTypeDiagnostic: BYAPR03MB3431:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3431F3E8A65E70245183E3E7BADA9@BYAPR03MB3431.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IlNDNrt83RbE/nu4YpUaSfKUHgOXchsqBMSL3V0gYeXPuFBuRAPhoJaGdpVgPe823m+6qB4KyLQXPJnvtgpDHIhtVkKGw64KSVW6mJ5I4k05Y3k5x6y1SDh9pvJzd/Cp8Q0IA1hrszscfuctkOlz+7KbtkQ7WUuSokVanBuhv3NAK5v8yBHj49GP1nPaRe/UxEgogqAseSnOrH62+TEgqS+YABruO3SDk4naWtxnSLV3DYJImUv7OXWN/Gu2aeAdN7b5Wn9Fu6PK9QgyEZNz2mDDvZ42+VbpO80IYsY9aENOupvvKJn59aPz8vexct3VG+oGAM7qy3vpV1OtAXz1l5o6JQOggKv/8g2gsbQqDrhoUbpc8c+m8ylgdbFNvQZuW4pR/Rh4k8H28d5e9pxoukDkV5k52aFuGM5Qsa1ZsU6tjfKo0g3PMuEplU7JGFqaovnGN/cKmkKqbBmp8e/DRwUblCWJQ/8e+29p5a105C325aG4ilaE4Bw8qsNwbJOmlipj2ha1brNbb2BevAI3mN2aabGTXnoVcINAwQ97GmHQi38Xf9rpVH+SXKC/SA0mPVYgJQgAZlzv4wjUiJyBum9gjcVtieFttnkUauejfHDNz2i8ew7O0HlYMMbqzn1nTAKf6xz5rUpIiorJWax4pL44CwPAptvpOMRPqgVIql0EeaF968ke/URRbmQWchKk+xjJJzsOEvjnEmtD7fp3EetkKbz3L1kyGySN23OfgRdgsp2YSE3PmkMbrv7HcJcASa/Q5i7jy9Wv7zYj1YNU5PgaTqaGI7IsaR8gYL5vqrZ/oNjrh7EUz0D8sA2YSpzlP1cysGbJ/581c3CvnrUmvtgZQ4yOnJnDDbJJ2D5PVwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(186003)(38100700002)(31686004)(316002)(5660300002)(26005)(36756003)(45080400002)(6916009)(966005)(86362001)(55236004)(66946007)(2906002)(53546011)(8676002)(478600001)(66556008)(54906003)(66476007)(66574015)(16576012)(31696002)(2616005)(956004)(7416002)(6486002)(4326008)(8936002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzVxM2dWdkl4cjhvOHhpcnY1V1NOR0hRVDNoMHJpRkFXanV3b0FYYTV6dEdu?=
 =?utf-8?B?M1ZYZk5WT3IzdlQ2VXRDQVdadk14UlpUdS9HRTZOdCsvNlNIekU5WDhrUWtk?=
 =?utf-8?B?UzhiWElsaVkxaEFjVW8vcVRLMDJzUXRBVXd4QVJxUnYxV2NEMWhWYUZQaTBX?=
 =?utf-8?B?UGJPTmNpMXVhaHZtZG12anVjdDQvcmpROE5yRW1qcGcyWElBMWFpcFpBNjE5?=
 =?utf-8?B?ZGpiNEdOb1JzeEtMOXZNYlBQMExlTjFGVVV5Q0pWZUphUXZsM0JYTWV5UHMy?=
 =?utf-8?B?N0tsOWorTG8zeUc0QU5JSUZKVFNXRzBZTmpDZm9JVUI0bzRybW1XNXFEZXZ4?=
 =?utf-8?B?RnNDQzhWcTFJbkVjUC9veVVnaVg0VzJWdHRGcnB1czE0dktGN3VtTk5KSWZB?=
 =?utf-8?B?aDMxQ1p5U2VoQ05hWGtqdnN1TGxXamNVZXdqc0k0K2RGT2FqSFk4RHBBM0JX?=
 =?utf-8?B?eS96bTE3RVNyUmpWNE9MUnBlMWh6L2hZTzBLb25MUjFHTHRlaHZSdVI4amJT?=
 =?utf-8?B?Q0d3MEVtWjU3OGMxV05SS2R4U1d6MUR2ZGpYWWFMVG5sdVRiOGhlNXoxMGlC?=
 =?utf-8?B?U1Y5aEFFOFRFOUNBcTZsY2MxK0RWWEhzQUJaTW1FN2Jja2IrR0x6N2poZm10?=
 =?utf-8?B?VTRLK2FmZjZHK1NoMEljbTZEaVNjSFNHc2FXT2VEUkZPVVA3MExEVFJZZi9z?=
 =?utf-8?B?SDBqSFQ5Q2QrUVQ3Q1RCVUtWeTExbzExUFpDSlpaWHRLaTdtVk5TUU5NWlcx?=
 =?utf-8?B?V1dJZGFUK0h3eGxnT3NqYnYyUERYaGQrbkxUSUxVVU1jeDc3WDdINFl4ZjU1?=
 =?utf-8?B?LzZtelM0TGNldms4NHRxamY4NUE4anpTTHQ3YnhkZHY0MHNxQVh5SnozVFJ3?=
 =?utf-8?B?WUxSVDI4NXl1Q0NoUDBRcjhhWHNGa05ZaDFmdGc4d0d1U2dKaS8vU1VrL0JE?=
 =?utf-8?B?UmQ2Ym9pR2FYQ1p6c1MyNXZqNnM5RVloNTg0M3EzMy91TCtidjdxSFRVaXVD?=
 =?utf-8?B?U2hVNkY3VVZwM3hFay9VZzk0UFhOY3NRY1JDSnlvSnYyM3pPd093VHBWclA5?=
 =?utf-8?B?WU45Vk95S3JtQzE4alI5cHJCVGJod1ZNYllQMEZFWTZKNHZmU2Fta0g5cmRk?=
 =?utf-8?B?OGQwWVdMM3NLbGVUeEVkdElMUUxEd3dlaVJaYWxmRUl6NVN3OU1YSWc5bHk1?=
 =?utf-8?B?OGVVczlxNFNIb1d2d1kzQWcvQ2txcTJXN0JpRXo4RVlrQmYyUmNpZ2ZpaHRM?=
 =?utf-8?B?TlgwajR5TWU4S25jeHhwMVoyNU9UTlVKMTBUcGtyQng0RU9mQTd0c3B4R21w?=
 =?utf-8?B?TkFYMURFSHdaaFppKzZ3YjluV0F4RW1BT1lybzdscWtYK3Z1SG5MR2ZLY3JR?=
 =?utf-8?B?aHdLOTA4UXo5OXVad0h0YUFpVmxmNllHa1NWZ1ZQOEtxSWlKWnVibjR2SGxn?=
 =?utf-8?B?YjNZS2FUL2JjbVg0eTFSWmtINzRNUXpTbEtpM1NSSVlKcDRFVVdQMk8wVjVL?=
 =?utf-8?B?OENTbXlTcm94RHdxLzdPVFA3Tit0V3JBUHpLbFhlZTBudE1vdm1ncW1QTnFT?=
 =?utf-8?B?ZENWWitQVkpOa0FlUFJYc1FTazQrQkxpYzJ5cVlNNlMwR3ZVNmZRbmFPTDE4?=
 =?utf-8?B?d21NdVhZOHZ4T1JVdmF5TUFsY3dwSkhoVXNDdUV4V2t4YzhwVEdZR0xCNG9E?=
 =?utf-8?B?dG5XOHVpK3ZleXFlVFBWNjlMZ3E5cFA4T3kzeVFlTWdLdWREbjBhL2cwRWcz?=
 =?utf-8?Q?n+GogUBE+m7SDAGBsUEGgJ5Pja6Zdv/MrYSgU9l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11120564-d092-4927-70d8-08d977af6f96
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 18:42:42.6357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AB6/z1f+Xb4EgpgzI4omzWeJ4BF/FSt3hYZfwllzczX/0b9mlsrBD4LpwGLTYWStO77zM78K5fQArNDY7Ivt/F/xYt4AIIyjqK9ANacYQ2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3431
X-OriginatorOrg: citrix.com

On 14/09/2021 15:44, Alex Benn=C3=A9e wrote:
> Andrew Cooper <andrew.cooper3@citrix.com> writes:
>
>> On 13/09/2021 13:44, Alex Benn=C3=A9e wrote:
>>> Hi,
>>>
>>> As we consider the next cycle for Project Stratos I would like to make
>>> some more progress on hypervisor agnosticism for our virtio backends.
>>> While we have implemented a number of virtio vhost-user backends using =
C
>>> we've rapidly switched to using rust-vmm based ones for virtio-i2c,
>>> virtio-rng and virtio-gpio. Given the interest in Rust for implementing
>>> backends does it make sense to do some enabling work in rust-vmm to
>>> support Xen?
>>>
>>> There are two chunks of work I can think of:
>>>
>>>   1. Enough of libxl/hypervisor interface to implement an IOREQ end poi=
nt.
>> No libxl here at all.
>>
>> As of Xen 4.15, there are enough stable interfaces to implement simple
>> IOERQ servers.
>>
>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fxapi-project%2Fvarstored%2Fcommit%2Ffde707c59f7a189e1d4e97c1a4ee1a=
2d0c378ad1&amp;data=3D04%7C01%7CAndrew.Cooper3%40citrix.com%7C08a3fe14704a4=
d6888cf08d9778ee5b2%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C6376722779=
05441489%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D%2B1pKhIuqzCGkgYD4snd6jnxjoEJzr=
CgUdol%2FfA2kwOk%3D&amp;reserved=3D0
>> was the commit where I removed the final unstable interface from
>> varstored (terrible name) which is a dom0 backend for UEFI secure
>> variable handling.=C2=A0 As such, it also serves as a (not totally simpl=
e)
>> reference of an IOERQ server.
>>
>>
>> There are a few bits and pieces of rust going on within Xen, and a whole
>> load of plans.=C2=A0 Also, there is a lot of interest from other downstr=
eams
>> in being able to write Rust backends.
>>
>> We've got a placeholder xen and xen-sys crates, and placeholder work for
>> supporting cross-compile as x86 PV and PVH stubdomains.
> Are these in the rust-vmm project is elsewhere?

https://crates.io/crates/xen-sys

When I say placeholder, I really do mean placeholder.

To start this work meaningfully, we'd want to make a repo (or several)
in the xen-project organisation on github or gitlab (we have both, for
reasons), and set these as the upstream of the xen and xen-sys crates.

>> The want to have a simple IOREQ server compiled either as a dom0
>> backend, or as a PV or PVH stubdomains influences some of the design
>> decisions early on, but they're all no-brainers for the longevity of the
>> work.
> Just to clarify nomenclature is a PVH stubdomain what I'm referring to
> as a bare metal backend, i.e: a unikernel or RTOS image that implements
> the backend without having to transition between some sort of userspace
> and it's supporting kernel?

I think so, yes, although calling it "bare metal" seems misleading for
something which is a VM targetted at a specific hypervisor...


>> I started work on trying to reimplement varstored entirely in Rust as a
>> hackathon project, although ran out of time trying to make hypercall
>> buffers work (there is a bug with Box and non-global allocators causing
>> rustc to hit an assert().=C2=A0 In the short term, we'll have to impleme=
nt
>> hypercall buffers in a slightly more irritating way).
>>
>> Furthermore, stick to the stable hypercalls only.=C2=A0 Xen's C librarie=
s are
>> disaster for cross-version compatibility, and you absolutely do not want
>> to recompile your rust program just to run it against a different
>> version of the hypervisor.=C2=A0 The plan is to start with simple IOREQ
>> servers, which are on fully stable interfaces, then stabilise further
>> hypercalls as necessary to expand functionality.
> Are the hypercalls mediated by a kernel layer or are you making direct
> HVC calls (on ARM) to the hypervisor from userspace?

For a dom0 backends irrespective of architecture, you need to issue
ioctl()'s on the appropriate kernel device.

For a PV/PVH stubdom, you should make a call into the hypercall_page
https://xenbits.xen.org/docs/latest/guest-guide/x86/hypercall-abi.html
because Intel and AMD used different instructions for their equivalent
of HVC.

ARM doesn't have the hypercall page ABI, so I'd expect the hypercall
implementation to expand to HVC directly.


In terms of rust APIs, we'd want a crate which has target-specific
implementations so the caller need not worry about the implementation
details in the common case.

>
> Where would I look in the Xen code to find the hypercalls that are
> considered stable and won't change between versions?

I'm afraid that's mostly in developers heads right now.

For a first pass, you can look for __XEN_TOOLS__=C2=A0 (This is mis-named,
and ought to be called __XEN_UNSTABLE_INTERFACE__, because...) but be
aware that some things currently tagged __XEN_TOOLS__ are incorrect and
are in fact stable.

As a first pass, assume everything is unstable.=C2=A0 The things contained
within libxendevicemodel and libxenforeignmem are stable and were
specifically made so to try and get simple IOREQ server functionality
done and stable.

Almost everything else, particularly concerning the toolstack
operations, is unstable.=C2=A0 There is 15 years of organic growth and
dubious decisions here, and they need unpicking carefully.=C2=A0 We've got
some hypercalls which look like they're unstable, but are actually
stable (as they were exposed to guests), and therefore have ridiculous
interfaces.

The "ABI v2" work is massive and complicated, and picking at some of the
corners based on "what is needed to make new $FOO work" is a good way to
make some inroads.

>> It's high time the Xen Rust working group (which has been talked about
>> for several years now) actually forms...
> Indeed part of the purpose of this email was to smoke out those who are
> interested in the intersection of Xen, Rust and VirtIO ;-)

The conversation has come up quite a few times in the past, but mostly
by people who are also busy with other things.

~Andrew


