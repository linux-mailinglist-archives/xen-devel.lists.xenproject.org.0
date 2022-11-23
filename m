Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDC763625E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 15:50:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447607.704031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxr56-0000k3-Rh; Wed, 23 Nov 2022 14:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447607.704031; Wed, 23 Nov 2022 14:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxr56-0000gb-OX; Wed, 23 Nov 2022 14:50:32 +0000
Received: by outflank-mailman (input) for mailman id 447607;
 Wed, 23 Nov 2022 14:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuiL=3X=citrix.com=prvs=31995ac12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxr55-0000gV-Eq
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 14:50:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2af1eeaa-6b3e-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 15:50:29 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Nov 2022 09:50:14 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5270.namprd03.prod.outlook.com (2603:10b6:610:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 14:50:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.018; Wed, 23 Nov 2022
 14:50:12 +0000
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
X-Inumbo-ID: 2af1eeaa-6b3e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669215029;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aaXdZiB9F/9O4yXuauqr9q4CaJgFdfOSj3tYLWiJoGI=;
  b=h86hm8NGFMTPA5vQJ4ty6oexCmtvN7OVVPhdP+5RgTMnsUfCcqKwoirk
   wSOeiTM5qIfdDOBhE7wu6t4Mkwi7uACitdAeRC39zqR/+85Rp52hZYYji
   Bz3J1VvRS5OFP3Vyr1e8no+ZEUpP6jcRYK3E9v06ojVX9MStswad5HoxW
   A=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 84477350
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lSWyr638cAjf49ZMQ/bD5cxwkn2cJEfYwER7XKvMYLTBsI5bp2QFn
 GMZWWzQPqmJZGXzet0iYIu0908O6MOBnNJjSQY5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVkPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfL0Je0
 cQUcTcxdxWhwO+40fXkd7FwmZF2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KklwZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOnBN1NT+DgnhJsqHqD3DcPODwmb2qUg8e7lkCyd4gBK
 FNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQqvdE7bSYn3
 ViIm5XuHzMHjVGOYXeU97PRpzXiPyEQdDYGfXVdE1tD5MT/qoYuiB6JVsxkDKO+ktzyH3f33
 iyOqy89wb4UiKbnypmGwLwOuBr0zrChc+L/zlyGNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:pIjF16g5CYoN1oN+sL9ohIUvEnBQX/J23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboXgTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp9KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wXh4SqbpXVd
 WGPvuso8q+QmnqKUwxeVMfmeBEa05DWituhHJy4vB9nQImx0yRhHFoufD31k1wiK7VDaM0p9
 gse54Y6o2nBKUtHN1ALfZETs2tBmPXRxXQdGqUPFT8DakCf2nAspjt/dwOlaiXkbEzvewPca
 76ISVlnH93f1irBdyF3ZVN/ByISGKhXS71wsUb45RioLXzSLfiLCXGETkV4oCdiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7X5VJM3ERXMAcp95+UVOTpcDALJHsq4XgAb7uDauoFSxhVnL0A3
 MFUjS2LMJc7lqzUnu9mxTVU2OFQD2KwXuxKtmuwwE+8vl/CmQXiHlltb2Q3LD6FRRS9qorYU
 B5PLTr1qumuGjexxe701lU
X-IronPort-AV: E=Sophos;i="5.96,187,1665460800"; 
   d="scan'208";a="84477350"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2MKZEuJD7tDBnlhW6Ago/jlLE7y2ydB01YN7DKdMy1iAeax40lrYt9TY39H887HhbN4vcgMxkT+xcjLD1oM0vc/dqRBpj24ISYswqg5wMgx9Xcpfm9FDwsQ8YCzWJlTmiEM6auyNR8vgPQZ2rqyTAJMIwoSqOMtxkuG3QFJ40Ti7Bf/nf9lWeXddwVVXS7HS0bo61xkLhNvh313DfZRuArt8x7v5LM3jYY5p1qNtHvuIk8SQSbwBTDLOtb56Gi5KMqzuyEMbtR+waUMZXcwWcyXZsgiFj1oiDJ6mott57eNYt8Bez2PcAUayGhoO8Evm5NpS+1FYisBjrAOJWtPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaXdZiB9F/9O4yXuauqr9q4CaJgFdfOSj3tYLWiJoGI=;
 b=dYsw3Qd0k74GAUoyjJqZFAqZ93D+CQSZMd800MlXiILUZ9iuyfie+JV1k/VyrPo+wPy0OG/4En6lAgjrqxDehWR7mh8UOUhp2f+tnS+FDJgi+GMMC1+7ULD6uHpH3DpVveHKuOZqaLWPIdFzrc0VJ2eQavice0ckx1iR6SX09sTdNEf02WmzHaFg7VoNzHcqlP/1kMSvEEhhVJzBFBS2irikpBJ3KqalZ55fqH0HdM+jV2Vc+t4aky4WFoiwTqsZL12/F98gExhuFnr2hz+88tUsZWbaE1Nz2qzRcrYeiAxXWrzeuTRn6FRf3jufe4u7Z7AmFP/HBS599k7qZCELRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaXdZiB9F/9O4yXuauqr9q4CaJgFdfOSj3tYLWiJoGI=;
 b=Mm7yd4sgF4nDT1VJK+kgvyh9l/gLZsTpi73hM23fHBRAhRpDukJPvFtBwyo7dSZp2LgkUBB0M8HPm09MU053+Pm8FYAoHl8OkKaVr4sd7/AA0afdKCkC5zkFyYT6ykZbt0SQ6S3TjWuHXtDZqfhJuHq7vcjsugFwcsJrpLqNZIQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 1/8] tools/oxenstored: Fix incorrect scope after an if
 statement
Thread-Topic: [PATCH 1/8] tools/oxenstored: Fix incorrect scope after an if
 statement
Thread-Index: AQHY/oYHeahpJxrT+UW3puGtv+tGG65MmLsA
Date: Wed, 23 Nov 2022 14:50:12 +0000
Message-ID: <a361d45f-9dbe-16b0-7bff-0d949b9a6af2@citrix.com>
References: <20221122152043.8518-1-andrew.cooper3@citrix.com>
 <20221122152043.8518-2-andrew.cooper3@citrix.com>
In-Reply-To: <20221122152043.8518-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5270:EE_
x-ms-office365-filtering-correlation-id: 8d6fef59-84cd-4664-4c85-08dacd6206a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZJQg8v0NTaBIcQ5sxlRnWFbguAS3uSwHginuINR1FccGKxna+Uvj7TydKSvHmhCNvG8Gab3Jk0JAMwzHNCn0za5Jffz4U+JLHiQz1JzZvNUEBxYoCIhzjMsGehUFnkK3dphRsdthMTv3+8jyCATPOkZ65VXhs8dvfD1WIJ8vPUxfhxYXHSDo5f3TcwJeDJhKieaN+tE+iFLwMTCQzEirnFIl4ZNn3hBe93hSXUNOw1Bk3AS9HkQ+ojZA/aRAvsaI8Q6jiM2NKfk39GPftkTNOWeFFi2vT53fYQ4YZHU3kay49HMOukv+IeZw8I3e/xXSORaBMoFJ9AFts4/ZxSn33E129He5XO340kXRhjxr9kZB9bQzhRU147v3FHxP/34VqD2dp7ShAB7BK+AS18jANT6OEhpx3Ek6A2v9VG9Ayyng4PGQLkLXJuvypYY+wOHHUlBXw+H4uRRTc4uiUnzQgxfK7jCV8RDbGem50yGTKjkzLeRtkO9Ej79GMwp4JpMGyuNK9ynpowRfUo0Zv+NOtWK1F/XxDsqV9e35++aPwBjnbIMxc07fnuzsLA8LVZwr10TDOWIrpgv3ZsUuxRoQKL6QrayZIMVsqsd5lpYZ1FdU6cjRCBeP5Hwx+/noFL3SdUU1DFniv35fFuWcitoiBOxChG8yPn38se8kgftyukjBWLHMisaUJCTEyhkaoYmyZDmqB3iw8KcW/89OzIIxt+FVUkSAo78BxoGmW7q3YR+OGm52EP1MKENGSwLBMrST+7HpM7eUG4badQXxBEtChQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199015)(26005)(107886003)(31686004)(71200400001)(38070700005)(6486002)(53546011)(6506007)(478600001)(82960400001)(6512007)(31696002)(86362001)(54906003)(6916009)(83380400001)(2906002)(316002)(38100700002)(41300700001)(66946007)(4326008)(8676002)(91956017)(76116006)(66556008)(64756008)(66476007)(66446008)(122000001)(36756003)(186003)(8936002)(2616005)(5660300002)(66574015)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFdhUW9LYWYvNXgyYmtRRWNSNTNPMWVNWDlBUjB3VklMUEljQ01pS0FrTzg4?=
 =?utf-8?B?NmNjZzNkU21lYlB6NTV3dXdVOGxkWjJZOGNISlBvWkIwcHBXRU5hSlZoZE9Y?=
 =?utf-8?B?bEpDYVJjMkc3b1E3Z1FpSnpwbGpqSFBlWUtpM0tubGZCWFdZUTN4ems5ckJp?=
 =?utf-8?B?UUV3TXZrcklUSWZkZnBaeFQ0dWNmZDlrWkZxM25nNWMxczN2K01zUU1PSWVm?=
 =?utf-8?B?RlNNMFZ0MXFCbFB6Qkd1K0ZDUlRwVVBDcm8wSnV0UzVXd3Nwcnp0MUF2REt0?=
 =?utf-8?B?Qkd1UktTViswc3NtS1Zoc2ZNTUlyZUUxcnVWVzAzV1FHTkJOQkhiUmVmL2hw?=
 =?utf-8?B?Q2Z0Tk9zMElBR3VUR1ZTSDJ2TzlKODh3dXBzT0lVeHgrUGxMU1JUOGdKdGJH?=
 =?utf-8?B?K2VZNFEydllkUCtmVFdZaFd1MEJJazVIbXppS01iQWl1VldrMG0xazB3N3Qz?=
 =?utf-8?B?Y2hXQWx4a3gzd3hpUlNrcms1a1FLYm5rcHVpWVpFcVYwekxUY0hLTlFCVFpR?=
 =?utf-8?B?MitGeWgxYXFTdm91RHdYbTlWT0h3UGRWbC9HRUlreU1adEdjZXpPTWluZFQy?=
 =?utf-8?B?ODlQVVIzNWRUQmJlL0FnOUw2QlVXVTV1Y1BHWDN3eCs4OERTNU1EZVY2Sm1w?=
 =?utf-8?B?ZDg3dzF3dnFCRGh0Z0ZzOTA3b29SNUd6UHdLclhMVW1PaGd1MWR1WFlkbFlO?=
 =?utf-8?B?UXJmNHVtYTJ4ekhKbmJhZXEzZjRXcjJDejRqcCtlT1IyRzEvUkJtUVZ3aWMz?=
 =?utf-8?B?aWZLc2R4SWJST3M5Q0ZZVkxlTTNheXVyMGpkdzhXV0lBUG4vamRyVkNkOE9j?=
 =?utf-8?B?MmFzMEtEak5IL3dMMktTUkVxVGVhcEdyTE94QzUydG9RN3hsZXc5UytCT2V2?=
 =?utf-8?B?M1BjZHB1WDhNS0c0cGVadFN6Qm5aKytkRlNXQXNIZm9wZXdBc2VER3FNWHBv?=
 =?utf-8?B?QmtJckNEQWpnNC8zaHNYVnZLaUFLMk5CeXNhU1BGOFNLWDBsR25SMEluaGp3?=
 =?utf-8?B?Q1YyVGpTUzYwN2hjaUdMbHR2TGNnVzE2RzN5cDRRSllRSlpwclU0SjJsK3hm?=
 =?utf-8?B?UWg2aWlEWXQ3b1VRZm9kTFZjSXZLY2dLQzIxZW9BWjFYR3lCOVRPNFhhcmxB?=
 =?utf-8?B?VVJEMXNEMEhZSC84cnllTGljazNFdnE2a0VuQ3N5Zk16SHhwcFBUL1h2cW0v?=
 =?utf-8?B?WUExSzh5RHMvUFBmSVl4bm5SZlJ3dDZKeVlUNTNQakxicjNmRmZjckk0amhG?=
 =?utf-8?B?UXFCMEpaUlJpN2VQTmtNMnAyb2x1ZjNnU20wbkdCWDRoRjhkRkxTeUlIdzZl?=
 =?utf-8?B?RU9mZ1ZFeCsydG00MjhyOGVHV09IZDFlT3dLem14UWpZRHNTbEF6M1liUEl5?=
 =?utf-8?B?Y0Z2MDB1RkpGLzVScU1ZcENHRXJyamMwd0hCSCt1YnlYaDg4Q0F5UCticW9Y?=
 =?utf-8?B?SWNyZ2EwWU5aZk9OOVhVLy9WN09xUGJ4ZEZJWnhJQWZOTHdZMzhRb1VuRGtV?=
 =?utf-8?B?c3g5MHdMUjgwQkhVSlN1VGFKemxLc1JnSjBLdVhnTCs1UG9ieVlMWmRpcDg1?=
 =?utf-8?B?ZllyZWJhalk0bFVNWUlmRDFsTk9mV1I0T080WUpVaUxpVjRGNEE2UzBtREhD?=
 =?utf-8?B?NlBIVlllMmdWV3JLVmZISkJaK3IyUXI0elpGTWxqRlFaR3ZCSXdraEVCcUtV?=
 =?utf-8?B?MWpXVHBMSjhnRjhibGt2TkpldVV0QkJVWW9VNHhUYjJtaUdpQldDK1lBYS9D?=
 =?utf-8?B?aEpBS3NmN3RyTVMrWHprenFtcGVUemJRendFL1c3Z3Q5d0tua3VrM3RBOUlN?=
 =?utf-8?B?SHIvL25uQmttTTM2Y1ZCU0dVV1gzYm13dStmb0cwYXRzZWxUSkZaT3FlWUw1?=
 =?utf-8?B?ZCt5UFN0UFQ1Rk9xb1JSUzFkY21VMWVPYzZUTm80TEdQQlF6SWNjQkFlZkcw?=
 =?utf-8?B?cWpGV25KdzlHYjVMUUFkTmI4STlaQ2FBTUdNck5DUXJSTnBKcXpSRnNFcHZh?=
 =?utf-8?B?YXVGSzdTQVBoV0xhUm5XcThRbnVBU2tVNVFBQ3FPWW1yTm5obUVCT01ZUXAw?=
 =?utf-8?B?QUtQV2t4R0Y3Q1JrZU02NzRML2RNcmk5YUplU3dsRDlzcFdPSWNiY3BTS2hR?=
 =?utf-8?Q?B6yd1LH1OaKTsrPvlSWp3ZXtJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1A1A57CA4DD8547BD588F2F59DECAF9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6LghKOL0sF3uWzNyqh00XudQtbe++kfIO2CrQ7kW53gux1Te/VOqQroktoizCArCvb3sVdkKAtNYgIaXyOWxyPVSP+9p/tFidTFEIBfT1he7P2StU2SLiUQvcmXOkCtZ8flRL+DuKlA88hlCtoPM2fF9FJZYpq5SNbAo3IP7A2uGBGDg8fNxODrK3eDL4n+INhxBP1/R2XJqdMXab7qWYSgw0/Fxiy8t31HIfQUurraR+SSC2Um9ZSTtyV0OyUfuaVeUqpu7urAgMIa5G+Rphhc24JIp3hIhsnMJSJlJbMJ8JFNjZwhRIirRhxLRFmdfqSSBbtR38t2oKbdGPzsu4gEdZzdsZsOvdkS2d8gxasXzfIbLyS6Kdg2gi0sHTSGOp1zhHWTNL5ivoLHh9WFnDjBHazvKYkT4IgZfO6lJfV00NPpv5udD3cN7SUPs8DoEaKue/L0ryIgnpsXDf6hx+ecXHYzqcMuhIQfUZR/vh5SYEA1SgosF6534N5LtebyTTBpuURAhObEconGwSEkk3nKZ5kRah9voWHigppyKngteZLPLnjEzHr/0ErIN0ppuHPbcCWIQnwKf8KjO9Y7+Dh0cAsJVQD9XbA3D6vRqzFAuVauZzHdRxDIbzXpUmNKKYhyjKRB1Ye5P5wJC15kDF0ILSjCBMH88F2GNYbunwx0/GHuddMqu/h9CQPFlN7ezCl9uQaSlM84f1BGxJfPHDPqpCJv/qh7XbvIN4WeNQ1xysrqwy46cwV6AFLlGJjiKyTt/JDRHlepqZmJHrU+q9i+EcBOXWyQGdmy/EyRi5d9A0YakmC1t9eGswrr9Vyx5
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6fef59-84cd-4664-4c85-08dacd6206a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 14:50:12.7706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3gyJNShkuXQsuWxZ9e6vQj9fXAic92x4S5ruWT/0emSpADcs1nnGlMUsq0Vojb3T2TDvwkpetz6bgTpoDmjyhh29H2p/P5W49Vr4Efp3EMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5270

T24gMjIvMTEvMjAyMiAxNToyMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gQSBkZWJ1ZyBzdGF0
ZW1lbnQgZ290IGluc2VydGVkIGludG8gYSBzaW5nbGUtZXhwcmVzc2lvbiBpZiBzdGF0ZW1lbnQu
DQo+DQo+IEluc2VydCBicmFja2V0cyB0byBnaXZlIHRoZSBpbnRlbmRlZCBtZWFuaW5nLCByYXRo
ZXIgdGhhbiB0aGUgYWN0dWFsIG1lYW5pbmcNCj4gd2hlcmUgdGhlICJsZXQgY29uID0gQ29ubmVj
dGlvbnMuLi4iIGlzIG91dHNpZGUgYW5kIGV4ZWN1dGVkIHVuY29uZGl0aW9uYWxseS4NCj4NCj4g
VGhpcyByZXN1bHRzIGluIHNvbWUgdW5uZWNlc3NhcnkgcmluZyBjaGVja3MgZm9yIGRvbWFpbnMg
d2hpY2ggb3RoZXJ3aXNlIGhhdmUNCj4gSU8gY3JlZGl0Lg0KPg0KPiBGaXhlczogNDJmMDU4MWE5
MWQ0ICgidG9vbHMvb3hlbnN0b3JlZDogSW1wbGVtZW50IGxpdmUgdXBkYXRlIGZvciBzb2NrZXQg
Y29ubmVjdGlvbnMiKQ0KPiBSZXBvcnRlZC1ieTogRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tA
Y2l0cml4LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENDOiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4u
bGluZGlnQGNpdHJpeC5jb20+DQo+IENDOiBEYXZpZCBTY290dCA8ZGF2ZUByZWNvaWwub3JnPg0K
PiBDQzogRWR3aW4gVG9yb2sgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQo+IENDOiBSb2IgSG9l
cyA8Um9iLkhvZXNAY2l0cml4LmNvbT4NCg0KQ2hyaXN0aWFuIGRvZXNuJ3QgaGF2ZSB0aGlzIGVt
YWlsIGZvciBzb21lIHJlYXNvbiwgYnV0IGhhcyBnaXZlbiBtZSBoaXMNCmFjayBpbiBwcml2YXRl
Lg0KDQp+QW5kcmV3DQo=

