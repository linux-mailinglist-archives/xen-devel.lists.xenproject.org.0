Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221BB644554
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:09:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454928.712516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Yd5-0001sT-5e; Tue, 06 Dec 2022 14:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454928.712516; Tue, 06 Dec 2022 14:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Yd5-0001q9-2d; Tue, 06 Dec 2022 14:09:03 +0000
Received: by outflank-mailman (input) for mailman id 454928;
 Tue, 06 Dec 2022 14:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkKw=4E=citrix.com=prvs=332b12f58=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2Yd3-0001q1-Hb
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 14:09:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86ca096d-756f-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 15:08:59 +0100 (CET)
Received: from mail-sn1nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 09:08:23 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5326.namprd03.prod.outlook.com (2603:10b6:208:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 14:08:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 14:08:19 +0000
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
X-Inumbo-ID: 86ca096d-756f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670335739;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dar9TCF7YOt3nmlXKnGyINH4asMo4QDeYVUuUx8s4ow=;
  b=HFqujGbnD+73TwcSRKQg0wq3ebE3l3lK7QZpAEEEZvPL6yvp9P8oJaYM
   ceE/ab+oKrbSJYx02+vQY4uCA42pBtS/LEy0/9EdwVxy4ZS8IszAiBK0E
   LK+kZOAOavz+V8R0SKPbW7lI3pYKzkMDbWHeaAAz9aMNz33guueiizyqd
   Y=;
X-IronPort-RemoteIP: 104.47.57.48
X-IronPort-MID: 89347222
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6tSZm6y4zAeeAqnhzLR6t+caxyrEfRIJ4+MujC+fZmUNrF6WrkUOn
 TRNCjyGOqqJamP0KNl+bd+3o0kF7cTXytJrTAM/+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPa4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVlT1
 vgdGXccVBaeg/unzemqRthRlO12eaEHPKtH0p1h5RfwKK58BKvlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVkFwZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOqA95NTufinhJsqAWYxF5QCwAoaQTliqKbknLiUugHE
 GVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4e5YDlqYRr1BbXFI4/QOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsAGFhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:4vZFaqhpp9YAu0D0zuVJsPKzI3BQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.96,222,1665460800"; 
   d="scan'208";a="89347222"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d59hEJSJwWya66AIaBvV5GjRCDxzAGHgwBGJ7Pd5YM6+Egt7Ry7/sC+cpyP05fLUuyAb7jYDJQBCvZ4LQ2owMY/n90LcavukxPpBqfn5oQ8cL8rNVB5p64fku9hMWE92GOT/zea+KkUTPRGH3SIoJrYTxNrI91eDDa7vBtNItLSn9+mFO9yuDEYzfxA54pLx1q0qOta89LFkmAZa4XV+YjO6WuRreRztQnUbxoXHuCD2cEosFjc95eK8Vk2AleKnrUjInlg1beX/JLhdo7dZc+NEScyMpSk2Im3Ye91kK4ADER6Jm1IObLioPDh+AOt+GjmykxBFGbdWxc7vLjdg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dar9TCF7YOt3nmlXKnGyINH4asMo4QDeYVUuUx8s4ow=;
 b=Tvd1aQpQYw8sZyHCBO/QnByYqoFthtwjnhxYfdaZ208jyv6/WrkfCHt1G0KPO3QiS/k+SPRDTsjWk37lLoMnBzLyIKwULe9BXvujW0geouzmqL5JVM+BUUQWlGsjaFiFugZO5Cb++6+/xgk+QfXBljeSYDfXEIlOkgjvZgkwjPvv+9QFsjjK5Qd7bBUTWjNLPwvq/cuM28arunw8tGH2nmv5qWmlhL4fajIztmDgFWt0HfvNrOQzlnJ+D7pCN34IWx92esKys1ioStXMt3mpSE02Eu+vaKeF1oF1EQg1sA2khGhmMKMKC3W96GyhHNbo54f2O0QTVl/3slB2xcnPPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dar9TCF7YOt3nmlXKnGyINH4asMo4QDeYVUuUx8s4ow=;
 b=KI7egetlTgLZvFTGphrn4XnHkN/HEOxM7jn/XqfgKUFyem/aSaHqvjPzu++f9FKRGoYSkkbY2DxDFxtZPpf4YiQN9y7/AjTAZ6Ln22wKp8s6345MhpXpjJCeAmzDuAk6kPNvwXc5PvEFLLpIDV/ziO2g81vyBuUEvyGvYE+PUs8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 2/5] x86/mm: rename PGC_page_table to PGC_shadowed_pt
Thread-Topic: [PATCH 2/5] x86/mm: rename PGC_page_table to PGC_shadowed_pt
Thread-Index: AQHZCXoxJf3WjWoKeUi55I26RpBTwq5g5W2A
Date: Tue, 6 Dec 2022 14:08:19 +0000
Message-ID: <12e07d49-b8ec-1c8c-0560-a34cbe895642@citrix.com>
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
 <cb8f6cad-99bf-1656-4a2f-12a281481a65@suse.com>
In-Reply-To: <cb8f6cad-99bf-1656-4a2f-12a281481a65@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5326:EE_
x-ms-office365-filtering-correlation-id: 606c88ee-98dd-4b35-3f0b-08dad793540f
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bKtMe2rLLmpciJw10+EBCCKOpyLFZ6CtuXmDRRxekg/YNFUAIssDwBbyQlt46X5Z+gzxhMwHyD1jIY9SVCsuJce6lmVx9AMvuohpWDYSuGVsYnsh14jrVuijbL7nRP9HznbSHFH9godYDHWjGV4AJPt61h2awPdSRzEuR2XOgcnoGh/pDLh1LGtk7X6hoon1NU6lcIesP2tRvP3VyVyk8hHtlUCbD5AFiCUVxjVakx6vp3XNUmXJ9vraBGZjqDoK3EllYyfXEtyNvlF0kQgjLrg5Ug+xKm4WRUCtLrH1o4Mg8XF3T6RmYjqr20qpKFRkgKGQUkTBDXFVH/bp0lBhmYs8qA85yoRPWnny1/ChQBRO1Iz779yfTSjHieZWOj1PHsadGyh1OOcmW8y8xI27k5MC2tqHyW5qhcdRY0OCB4n186rZk8EI1W9uDezLURBypMiUm01jPNAVlo10zIXhfOBd4WKN+P72gtVuG0CnskrrB2v7U8OHvGKy/UCD77yUiE2ZnNnlWrc2G4z7AGwYDSgBGJnt6vt19WhWECVb6gX5HazrQarBP9EusoNha4R7Lg9C4E88/FJJ6R4KHFrcaJY1wF/m/EC2i/ztjuBq0KN1CkDwYFT+9e0HRM6hwaCWIC1DrFvwJIQXj6Jk+N9GWckL0OqxY7CiWTT+eirVeo1Rjg8L4I6B6+BbzK9P/Dp/ltRbDKB4CdvMs9Ptgk84Ea2XbCFeLLZPcXWuq2XQ2yta12ovFQ3h6PaD/m03OqvKz5V4ThMk1Ier2UsMhkSLCg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199015)(66946007)(71200400001)(6486002)(53546011)(31686004)(6506007)(91956017)(6512007)(26005)(316002)(110136005)(54906003)(4326008)(31696002)(86362001)(66556008)(76116006)(8676002)(64756008)(66476007)(66446008)(38070700005)(82960400001)(2906002)(38100700002)(41300700001)(2616005)(4744005)(186003)(478600001)(107886003)(83380400001)(8936002)(36756003)(122000001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0liamovcUQrYUI2RFlOK1RiZTBzRVdYcFFVZm1wSmVnRldXcWpzeHNRZE8z?=
 =?utf-8?B?QTV4NlpEN3JqdU52bVkwWE1NR0V6SGl6UG9WUWR0OXc0L1J4bXdxTDNVRWJV?=
 =?utf-8?B?Rk5aWFZGdFUzQUxjY0hYNUh6Z3JoOGcyU2lsZ3BZSkVTNCs2d2llWEIzNTZv?=
 =?utf-8?B?YVdzNW9LMFp4c3pZK0U4dXFXcmt4UUpYeGtxWmc3Z1N2WUZRbVdLMFpZYndL?=
 =?utf-8?B?TUMrWXg1aUVJbytITUozTHA3dklMVzQvNTFFNWRhaVFZcmZ4Z2tlYjhZUE9U?=
 =?utf-8?B?RTlxd3huWndXak00MFlIMjdzNmhueFJiaDRHSENMQ0VuRUFHYlZ0MDVHTmZx?=
 =?utf-8?B?VTAyVkt2em9nbDBnLzNhc1BNYUI0bEFsWGpFUkVpazQvT3NKTlM0aHJHQXgr?=
 =?utf-8?B?Qmk0NmxqVzNZaDYyd212TXUvODN5NTBLRWs4a0ZIM1FSakxCbGZwaUNzL0ZE?=
 =?utf-8?B?UldqZDJqcGxxVmJISGx5ckd4L3k1VXVsYjVKb1ZNM1VVU3RBbGljT2dnb1pO?=
 =?utf-8?B?UUYwV2NTT09RYldzK2ZwRVpnNmV3RkdsNHplczVRYXQ3cUw0Mmk5cnNMZjBY?=
 =?utf-8?B?T0ZPK2RrcCtraUpCVFdJWGJHL3dqbTVLU1BRWXh1OVFxa09JYWpSYUFtMldt?=
 =?utf-8?B?S3kvaWhZMTBBaHpib1NmdHlNV0M0ZVU3clhVV2dDT1ljZ0ZyVTNkU3o3TzlJ?=
 =?utf-8?B?RTdpOEU2bGxBbk5FcTBna3BGMkpERmZ3WllwOXFoWmFCd1RqRmpFYS9BVDdH?=
 =?utf-8?B?SVJZMUx5VDdLZEE1anlneEViZDFnRUx6M0VwYitGa0JWWDVVU2I0dVpTMnBJ?=
 =?utf-8?B?YW9aeUtoMGdhYVJGVWNJYXZxeDFMQjNnOW1DaU9kS1BGeWlZWjRhYTgycVBp?=
 =?utf-8?B?ckFiallybFZONGVrVFpobGhKYkF5T0FmNlpHZXlMZHN1YlRQbGxhajV4Szhj?=
 =?utf-8?B?MUlrZ3JPd09YdHh2MmdQazlxYitxdW8xVHFiR284eFU4TGNVQkFNS1MvM01a?=
 =?utf-8?B?QnNQbG5PRS9COWd4ZlR5YkVnMGVzL0V1NytJSzdSMnlMTFV6NHdLNGFLVkZh?=
 =?utf-8?B?NVpVN0NRdDdRUW5mTWpGbzl2ZWxLN29zTlc1SGhmT1NHajdVVDFFZ0NBUi96?=
 =?utf-8?B?UjdUMXJpWWpERUEzVlR2U2F1akhuWGRFNkZSZnZmaGx4K1BDNGdod1psRmtQ?=
 =?utf-8?B?NmFlOXkxM0huQVhSc2dyd2p6OEhSUjkzL2VuN0pSQjhBWDN3WnRmM3ZBTmdY?=
 =?utf-8?B?SWt6cUVvRGpJSTZ0UDYzSTVaMTdRYnlYQ3RSa0gxOG1pRUJxdVFTa1RRLzJF?=
 =?utf-8?B?cnJuaE5lcENsU1lzbjBmMTZONEJzUmkxTkdsaDFWVHNKVGNRdHhzK1lMSEhW?=
 =?utf-8?B?L2NxMVI3S01PTTl6RjBTa3Vub3AzVHkxZG9QRUYyUkhZSHc2alpENU44SFBP?=
 =?utf-8?B?L3d6SUpMazBwOUF6bHhUWmdGMlN2T20xNVhlaHV3dUZwMmQwSFVSZG9uc1hn?=
 =?utf-8?B?QU9NaU83VTNhb2djeGN6MlJGcUsweDRXRzduTGNnejJKc0FxemVLUnhrbVIx?=
 =?utf-8?B?VGV2VDNMdjNvL1lyY1FVeEc5dGt6dmxRN2h0K21nQTJxc1J0SjlRTHlnaGlr?=
 =?utf-8?B?Ty9GSHJxRk9HcGxZRWVDNmM4dVVKeFpRc3Y4cU9aQW53L2h4elVQL3NtWTFV?=
 =?utf-8?B?Nm00QmMvN0FPaUhEbmRXZFpLZEQzR2Fndml0Wk5Bb2dxMzFnRGRvTFdWTFp0?=
 =?utf-8?B?ZXZ6TmFpd3U4dzNMQmNpQ3ZuTXpzd1BtM0IzdXRYUjVCUXRldnE5eTIzL0da?=
 =?utf-8?B?Qmo5bDNCRVlqZnR2WkZITjA2d3RKbU52Tk9tRWdBaDdpcjhwWWVmQk1HelBI?=
 =?utf-8?B?NnI1ZGxTV3QyZWhrZndXdm5tc1VaWXFNdy94VWZkanJwNlZOOEVLRXE4V2tZ?=
 =?utf-8?B?ZHJsdlU2ekpCZUZlcEtLQk0xTW1PUDYzcncrNzAwUFB0eFp5cTNBaUphR1Y5?=
 =?utf-8?B?NnprR2lPMUtzbno0VnR3R1dveldOdnl2c2RTeTdxSHRhdWhjT3doV3FFVGtq?=
 =?utf-8?B?V2haYnVVSVRuSlkzUnVVUmx3UUJZdE9zQlRQOGNLb09jdjU3RVB6amhYTkg1?=
 =?utf-8?Q?Ndp6fF/phJvC5gyT/69uiePqD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1228DF2BD1A0A47B88A0C4F8E188F0D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0ndskARl8G25PZfEmCvj4nt8fWhnU45LTwMC3DEeuk7iTLisr77g9ZsCKOlIwpA2jBTGBadyrDez2/AbiFel2WsjF3OElEJeGTxwaRIuWU0te0z2GHkhlKHFku/oIwILuSn4CcPVnMByDoqoT96MB1qOW+aXfJEJFqM33Dh9NPpZ8zZJmFoDnlBRTpzSgpkskDYF5tp2FKchtyteVFTK2onJw5c5/SwTVtL27L/NhHgctml6HNnkSomj1N6F8nRNCWzu1Ln+CUPNRPUi2bD7WIOrCzXkgnig7QdMkONpW3/oAht5VRhU3qVoKc5yPSOr7Ea4cserEhgOIYSBoOhSfkHSe7m50mqFE0S/ViEj2qhW+bYBqPaITI1WHgqZdispJj//8ChZOhRSAzD+ewJj4RL8lPYpLJTD03Zza5rZoWKy5tcPE3/Va+4fAa7wA06uaHnMvtoHNFPDnbJGG1ffwEkEPNnfB/LmggPw5fCn2olxmnjUB0ntfN2Wz0iMfmcTgTlPQGNlvjOwzwZeSVvzKg3CWOngQXzscOZWD3Hng9FTuDwgN2GPrAFVhvSILKYAo992CncDULJ4BWzgqCIRkpSPyIfyVmocApvFicWYPEHvaF9LCrAHqPyevzPu6sUdEKt5i1aek9KZ7/5VacT9Zrip59kuBKSn3mizKp2v/5S02rbXalaCZKtNb2NY5wNxU7VzD0iglRZlF3HidZFJK24GgTS0yjKKNUmNBzjrW1xUO35CM9VV1Y//b8S4gXqMIaYZBvNWU6Pg2sesL6nnd/Z4JrNVD19KN1fqbCVDesnL+rar6Rjc3Nw9NHgRe33s
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606c88ee-98dd-4b35-3f0b-08dad793540f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 14:08:19.6483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nhGMGOsguenzFRjCTvXNfXMAvERfwH55u1Yr4GfNOW2oefZ5BQhXGSyDZugJpNHOlwzU2mxDPr+MVW89WIQ5DftOt1/QMPCh2hvgvvuc/5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5326

T24gMDYvMTIvMjAyMiAxMzo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZSBvcmlnaW5hbCBu
YW1lIGRpZG4ndCBleHByZXNzIHRoZSBwdXJwb3NlIG9mIHRoZSBmbGFnOiBJdCBpcyBiZWluZw0K
PiBzZXQgb25jZSBhIHBhZ2UgdGFibGUgcGFnZSBvYnRhaW5zIGEgc2hhZG93LCBhbmQgaXQgaXMg
cmVtb3ZlZCB3aGVuIHRoZQ0KPiBsYXN0IHNoYWRvdyBvZiBhIHBhZ2Ugd2FzIGRlc3Ryb3llZC4N
Cj4NCj4gSW4gc2V0X3RsYmZsdXNoX3RpbWVzdGFtcCgpIGFsc28gcmVtb3ZlIHRoZSAybmQgaGFs
ZiBvZiB0aGUgY29uZGl0aW9uIGFzDQo+IGJlaW5nIHJlZHVuZGFudCAoUEdDX3NoYWRvd2VkX3B0
IGNhbid0IGJlIHNldCBvbiBhIHBhZ2Ugd2l0aG91dCBzaGFkb3cNCj4gbW9kZSBiZWluZyBlbmFi
bGVkIG9uIHRoZSBvd25pbmcgZG9tYWluKS4NCj4NCj4gUmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

