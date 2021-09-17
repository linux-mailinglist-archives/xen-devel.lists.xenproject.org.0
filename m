Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBBE40F919
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 15:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189415.339109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDtH-0004b1-44; Fri, 17 Sep 2021 13:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189415.339109; Fri, 17 Sep 2021 13:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDtH-0004ZE-0G; Fri, 17 Sep 2021 13:26:55 +0000
Received: by outflank-mailman (input) for mailman id 189415;
 Fri, 17 Sep 2021 13:26:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OQJ=OH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mRDtF-0004Z8-9H
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 13:26:53 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eadff8a4-17ba-11ec-b6a4-12813bfff9fa;
 Fri, 17 Sep 2021 13:26:51 +0000 (UTC)
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
X-Inumbo-ID: eadff8a4-17ba-11ec-b6a4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631885211;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LdVokYFUq6jaaLc4yGIoZkkBwGC7+cLM+1HXYT59Izc=;
  b=Y2pcQGaJXlNd4Te5DE7wKgKsMQRx8glKEjWCoh64pVS7gNrjjikL+fVH
   PLsMnaUbhWQtwFHBrTi7JZw7UaDW6jRP9zVGUnTljAtwH1xM1kQ9mPBEh
   WRXvtv53wcmZBsSdZUCnhlXE4Ioq6GnI8CK2z6PHTLOOuEyy/0m23f48E
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YG5Mi/Q92JDBauIHSxUBmJ/9rE47i0uAK1qTmwdFC8CDb2gpdcunmfLg64rTQrFHoo2j7e4Unw
 g5vWh6Hz6KrgSFehheVFFvP3Fup47JEu0F38Nno1bfuPOLoZ2M2N30A+QMGlyDPXNHU9VpO5Ea
 IF7VMxTJ2K7l6yax8pwR78AoTZYUNBVzOO2XWiRF7fYjkHCnt6P/h5cVXcXq57r/ky/2XZEvu8
 xnXA878jf+Nm0B+6xOtkv0ObhEg+d8aAsuTr4MgpzVASaMbtAJ0SFIjFBG1j+L2GHOegMoWkz4
 QkC1Rs9znEegOA7zj9Gn+Mbs
X-SBRS: 5.1
X-MesageID: 52973140
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:J4c7gKjjr3PMqOZsPCzDJqjFX1614RcKZh0ujC45NGQN5FlHY01je
 htvUWCGP/2MYGrzfdp2at629h8FvMeGnd5qHFE//ng2Fi4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg2t8x3oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0Op6GcFjoMEpaQt84xAid+IgJBfo1ZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauEN
 pVCMGY3BPjGSwFhCk4wE6Ngp+6h2X3aWR129U2sopNitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEh/DNtTP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQ85S4GvaU0skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQqusY5Sj0t0
 l6hhM7yCHpkt7j9YXCA8raZqxuiNC5TKnUNDRLoViNcvYOl+ttqyEuSEJAzS8ZZk+EZBxmz0
 Q2m8xUbq45PouQnhpudzHP4wBKz882hohEO2unHYo60xlonP9f1PN35sQKzAeVod9nCHwLY1
 JQQs43HtrlfU8vV/MCYaLhVRNmUC+C53CowaLKFN6Io8Siks1WndJpZiN2VDBY0aptYEdMFj
 Um6hO+w2HOxFCDxBUOUS9joYyjP8UQHPY6+Ps04lvIUPvBMmPavpUmCn3J8OlwBd2B3yskC1
 WqzK57wXR7294w+lGfeqxghPU8DmXllmDK7qWHT5BW7y7uODEN5up9cawDmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9zbuRp
 SDhBRYDkTISRxTvcG23V5yqU5u2Nb5XpnMnJy08e1Gu3nkoe4G066kDMZAweNEaGCZLl5aYl
 tEJJJeNBOphUDPC92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7DwhBnGRZcjRhh5CJqEYvyY0F7s72MWn/h/XhWUL4ALKlns6oVjNwf4kuQzf5MXMRzGyzbDj
 1SWDB4UqPPjuYgw9NWV16mIo53wS7l1H1ZAHnmd5rGzbHGI8m2myI5GceCJYTGCCz+kpPT8P
 b1YlqiuPucGkVBGt5tHP4xqla9utcHyo7J6zxh/GCmZZVqcFb49cGKN2tNCt/MRy+YB6xe2Q
 E+G5vJTJa6NZJH+CFcUKQcoMraD2PUTlmWA5Pg5Ohyntip+/b7BWkROJRiczidaKeItYo8ix
 O4gvu8Q6hC+1UV2YorX0HgM+jTeNGEEXoUmqooeUd3ihQccw11fZYDRV33t65aVZtQQakQnL
 1d4XkYZa2iwEqYaT0cOKA==
IronPort-HdrOrdr: A9a23:5TPCFqmoZJ/fgjPGUeWZJ5H1QNrpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.85,301,1624334400"; 
   d="scan'208";a="52973140"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wej+XIEDC+j8pfX95/w6gfHQsdKGpOO1ol1WeA5x6MIWve1oJzDM1ef3d7RAJVghK8iv5b1tkIpwuekV/gJph+QOmwmMqhhuRmn87qfT1GfyHefwYA2ybWRaQJTUxnSluCjhu5hOZA7XIFFrJG72qmeBaJHztU/Canudv/z4PgNFOEFZVz+60M90Pg8PM8mYADF2YzHODobChWiV8cXUxWf6v1tsaWiOH4rF8stiBvHM65myWX/ASpPx/cPH5EHOeNLlVtUtQ48KvpjbZ9Nk7cM7j5vDmkH5ATbXuUDpH1Ek8NffOEZT9KQN6msPZTtA1/VZXpFQazPu2ChBGgwhaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HZAdBgS4/6chgWS5jvU7DTQYRfcpq5y/k6AEYNbo5OQ=;
 b=T2kiObiJCtbwxy1pE0zsXvHV7nyLyls1vyzvRsx4SUA3UfKm3w2hLa/EqCnb0/+64mEZvRsUix6jFac6JtZ5aZhe0jW7e2lYB6nv3aD0hH15pT4PeiQZpqsbJ61nRRMK4TxFttny1SZju423BRG0B1cFWfgekpQfpKNgVuKvTZgQOyck+gcyvYfQo4/gvZSr652wq8wWnKVhWU7hT+kGSFUF3ZDDJpMl86sZ60DtMyGkPfNSS5Wficug/RbLHovmz5v2x+rjLMqfw8XEDp5zIM+VBzs6j3WyG1Y8JjnT4uL7TN7EYpZ2gkyznHsAqxg7PaJ8Z4K2i7DROtDgDmSgvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZAdBgS4/6chgWS5jvU7DTQYRfcpq5y/k6AEYNbo5OQ=;
 b=bQSVpsDYHxNci7p+NTARw7C4+VI6a1gjSw7knio3JiNlsHYyAEQMD95dDwHsnb98NMTmJoqZTTCqNXgdzb6AE6ilxMwBo07ns5cRbcNIPluWw7ylIAtwwpdnzNpZf97c8NrzYl7X9Fcb275R271q71/4taOe+7gGBgf8jQ1zTGY=
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-2-andrew.cooper3@citrix.com>
 <ed07d2de-9354-6c6d-b9f6-4b325ca328ce@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] xen/trace: Don't over-read trace objects
Message-ID: <0db4dc68-ccf0-0de6-61ce-7f155431a977@citrix.com>
Date: Fri, 17 Sep 2021 14:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ed07d2de-9354-6c6d-b9f6-4b325ca328ce@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9700348b-18aa-40e4-91d4-08d979dec9eb
X-MS-TrafficTypeDiagnostic: BYAPR03MB3799:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3799B07F71A40E7DF256D7A2BADD9@BYAPR03MB3799.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dNKkkSYXKKOD/AT0/Nc7COfVWGn9knM0zf3LJe1NvqoIw0zvnOeNqaSmcb7BFoSMR6Uq9bcOCYCebiqBGy6yN5MLeLrgD2mabpCDEL4MNbgwoKStkcTMdgQP0cO3MpqTNK7OsW/Tf5PK73tHWG4Qjrr2ufhigVKOAGaRdq2X5Ccicvp4VRGPmXL+mSbG6gaOyvlx1w12Le4Rl3WebC6ggu3rEONdB60yt9G6wOY8BWHxMHwUphobprA2oTk5WAFLKf7mawm/PklKnO7UayPXpAQa/A14GVGSubXrciy/qHAh+46mbOp9YR/S+GxSdtEZPj7pcDiT0ov3TaWpLhgAbLAeB1EAeTXKM5D/tCuMsOIxMUZxJXJZlgDvSgKUlmPDhB6802ijuoEfLOfZtaUMNbNdKrtdGx3zWiD1kVt/c5APgwM91l45/YJGR+BxlPpgg+Ma7Q5GRsXjgvTcoxM9qv/KmiQ8eqzH4LVFgbxY7QzXKucsH3FUJZRGg5jfY/M/z/8RFUdtyth/RZFFTFCOMRogygtIwRchRBXqwukWOUYxR3PN+tMoCHliXoyp3WwvGV37k/WOQ+F7zJS9Dl2g3xa+DxzkxnatD9T2wLyLpdecigElm++K7u9ywHhEENVKM1Q1RRsPif3b9+9YOyInG7rskBWEXOiExBjIQ8/S3bSYnVcIfZq9718xeHzoHb/I95fAYzFWAkoslElLtWep8aZcyPKeLc9E9PDkBNsWhZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(186003)(31686004)(2616005)(508600001)(956004)(53546011)(66556008)(4326008)(54906003)(66476007)(36756003)(8676002)(8936002)(6666004)(83380400001)(2906002)(38100700002)(6486002)(31696002)(6916009)(55236004)(16576012)(5660300002)(316002)(26005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmkxbVo1cDZzWFZMTnp1VlN2Uk93SWI4MDZSYW9QaWlMUFAwSTZoS0l6SHFu?=
 =?utf-8?B?YUNxMDZNakUxY3FXbEtGQlJBYzVkMEtKbkF0NzBXV0RrQnZTY3pyOUwxMHVD?=
 =?utf-8?B?T1g0WVUrNnAxMTA5bzVxMVZsdGlGS0Z4dmk3cjI3SGljWm5LdmJ3c3drYXha?=
 =?utf-8?B?SXdyRjZEamgxbW4xUnFzQlVaUlplSVJyUEI2T1QwaWV6TldlNnVSTmtLUlcz?=
 =?utf-8?B?VnVDTXBhQUpKZjdwTlZPd2QyZlA2TGpiWERLODI1SWViMitMVVkveUVUbXVw?=
 =?utf-8?B?Z2JzTDc4eFUxR2wrTHNlTHR1d1VqNmpCTzg1TUx6L1I0bHBhSTlhdlFBYk5p?=
 =?utf-8?B?emM3Wm16cllna0o4NkxaV2N0b0N2WVp2NlU3RnorOFdNNHJNTXlzTVkwYmxK?=
 =?utf-8?B?OGlYdlNyNVpOTFVmRmdmY0ZaMkUxcTRZMzREc1ZhM3JMUHVKTnNrQndUWWN3?=
 =?utf-8?B?RjJTTzg2OUJqQ2g4ekFETjlSM2x0SFNkckdkYUFvbzd0azQ2V0o1VVUwTzNB?=
 =?utf-8?B?cGNmQTdmOVhmRkhjbVpJT3lWV3B0VnYrRFFWUDRwMlFvWVBZRVJiRlpEcm1n?=
 =?utf-8?B?U2ZvTEFESmVIRTI0VmVFMHVaekNVU2RSNkhyZU13SXk0cXJ5R3dqOFBNc1JW?=
 =?utf-8?B?QXhQN1UzSW1FRE5BVm1Da1FMcWhSQTA5eGY3WEx2UHRCT0hiY0VLTFhpSlY4?=
 =?utf-8?B?UzNIZHgzaitJeFFUWXBRK2o5MnVjelN5TVU2aHFlZlQzSVA0TnZXakpXbDkr?=
 =?utf-8?B?M3VyNUxsbVphZG9vUU8zTXkyL3pxMVRia1FIM1ZlRlNUMFpoNTg5WjlBcnRv?=
 =?utf-8?B?cm5DdllCNTI3bTBrV0FrMmRYVEZ3N1o0bFFXenBKaUpCWERwN3cvZHFQdDFi?=
 =?utf-8?B?TG0rRHBHSmxCNXcvaHNHbDJqb1Z4T3F5Y01tWTZPaVcxUEw5dGhVRlBxdWlJ?=
 =?utf-8?B?WjBCQ1dnclA1dkxtd1I1MWMvQnB6WGk0Ti9qd3c4dkJsOUJxSEl3dFhZeWZV?=
 =?utf-8?B?Q092MG9LdXoxdXM2ZmlINVV1NTNrelFOR1ZVYzh4S3J3dkw3OGdkMHMrTG9w?=
 =?utf-8?B?R3psSEkvMHdQQjY3UEhFSUZSWnB1YXgyOXcwTGEwUi9JSjhlUHFyOXBZSHND?=
 =?utf-8?B?SzMxZVE5R0RCYnhwU2xVZjlzMjlyWE8rRVdFT0pJWjF0RXRKRmp4bmJaNC9K?=
 =?utf-8?B?OG03dmgzeU85UzFod2FNTGkrc3JPcG4rSEwyVXJ5NW8rZ08yRXFuRVRZUEdW?=
 =?utf-8?B?V2x2THZjMXRBbGRNeUNLdlpYWkxMT0pZZU1Sc0hodDF6UjJnQVcxMkxsbzRy?=
 =?utf-8?B?TXdFRm5DaW1FM05tbHdsRFNOSmFqZXlnN0JCN0VwNkZZeUZSTUEvM2gzc3Q2?=
 =?utf-8?B?ZFJ6MFZQNGkwL29yT0JydkZPR3JJVzlDbWQ0OStsbjJEL2F3V2JPNUxIK1Mr?=
 =?utf-8?B?V0QzbGtvQ0ZHY1hGcGVxWHBHclJtbzFXV0IvZGlhWTNGQ3o5bHdHUlFLR2J0?=
 =?utf-8?B?TC9zeVRDSU84UHowZ2taYWJOVm1pYXdpb1AyelQ2aC81WitkZUw5TnJSTkJj?=
 =?utf-8?B?UHF4V3hpMEdUL0VkSUdwVkUvRkdhTndwc0xCZjlGM2xpOXl3UEd4OGh4TklI?=
 =?utf-8?B?RVR0WHBQOGlmZGRLck9XQXdJRWhkUlJweHZnd0VRUXg3V0lNWC95SWtQQ2JJ?=
 =?utf-8?B?OURiQ3FIeElXcGlIMHhjMEx6ckgvbC9rNlIyVXdoOU1kQzUxOXZyNlIxakxV?=
 =?utf-8?Q?x+N+QIi9DMeUITMflxKyPJjI5USvnnfL8cQorsn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9700348b-18aa-40e4-91d4-08d979dec9eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 13:26:43.0133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiW4EGTRfDi68n41ne99Dpwxn7fAHoIAOP/ZzyyodP/58nP0j5wVTbPm3vMhPwvTLQpe1aB5KrH+J1ceyAmF5AxQ9yuZHHKQBRwOdKikQiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3799
X-OriginatorOrg: citrix.com

On 17/09/2021 13:58, Jan Beulich wrote:
> On 17.09.2021 10:45, Andrew Cooper wrote:
>> --- a/xen/common/trace.c
>> +++ b/xen/common/trace.c
>> @@ -686,22 +686,21 @@ void __trace_var(u32 event, bool_t cycles, unsigne=
d int extra,
>>      unsigned long flags;
>>      u32 bytes_to_tail, bytes_to_wrap;
>>      unsigned int rec_size, total_size;
>> -    unsigned int extra_word;
>>      bool_t started_below_highwater;
>> =20
>>      if( !tb_init_done )
>>          return;
>> =20
>> -    /* Convert byte count into word count, rounding up */
>> -    extra_word =3D (extra / sizeof(u32));
>> -    if ( (extra % sizeof(u32)) !=3D 0 )
>> -        extra_word++;
>> -   =20
>> -    ASSERT(extra_word <=3D TRACE_EXTRA_MAX);
>> -    extra_word =3D min_t(int, extra_word, TRACE_EXTRA_MAX);
>> -
>> -    /* Round size up to nearest word */
>> -    extra =3D extra_word * sizeof(u32);
>> +    /*
>> +     * Trace records require extra data which is an exact multiple of
>> +     * uint32_t.  Reject out-of-spec records.  Any failure here is an e=
rror in
>> +     * the caller.
>> +     */
> Hmm, is "require" accurate?

In terms of "what will go wrong if this condition is violated", yes.

>  They may very well come without extra data
> afaics.

0 is fine, and used by plenty of records, and also permitted by the
filtering logic.

>
>> +    if ( extra % sizeof(uint32_t) ||
>> +         extra / sizeof(uint32_t) > TRACE_EXTRA_MAX )
>> +        return printk_once(XENLOG_WARNING
>> +                           "Trace event %#x bad size %u, discarding\n",
>> +                           event, extra);
> Any HVM guest looks to be able to trivially trigger this log message
> (via HVMOP_xentrace), thus pointing out an issue in a guest and hiding
> any other Xen related output. I'd like to suggest to adjust that call
> site in prereq patch (I'm not overly fussed which of the two relatively
> obvious ways).
>
> Further sched/rt.c:burn_budget() has a bool field last in a packed
> struct, yielding a sizeof() that's not a multiple of 4. All the uses of
> __packed there look at best suspicious anyway.

Ugh - I checked the __trace_var() users, but not trace_var().=C2=A0 Luckily=
,
there are far fewer of the latter.

HVMOP_xentrace has no business being a hypercall in the first place.=C2=A0
That can be fixed by also enforcing the multiple-of-4 requirement.

But yes - burn_budget() needs fixing in this patch too, taking it from a
theoretical to real problem.

~Andrew


