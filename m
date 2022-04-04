Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF274F16A9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 16:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298362.508255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbNG1-0003k1-3p; Mon, 04 Apr 2022 14:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298362.508255; Mon, 04 Apr 2022 14:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbNG1-0003hZ-0O; Mon, 04 Apr 2022 14:00:37 +0000
Received: by outflank-mailman (input) for mailman id 298362;
 Mon, 04 Apr 2022 14:00:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0DB=UO=citrix.com=prvs=0868b7840=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nbNFz-0003hR-90
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 14:00:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f022935-b41f-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 16:00:19 +0200 (CEST)
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
X-Inumbo-ID: 8f022935-b41f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649080833;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oXPkygFoJY55e+SWucnOmDTiQ0SNIKUmYAAayH0bJjc=;
  b=DqMkVAq+DDgFMYpcySioEtcI8gveAVmLVR3Z9+88wcBCQ8yC5N55JYA4
   LQB105r42WiandC82Eq//RZ/HCzYnvQjPDvFir17lQ81Ujy9yaSC35vaC
   xk8/btMEfvDa795GRX7FoDSJuCgkk3wp8NAJ7KS2C17lUCtV3siNaEJON
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67843415
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UPB8UqMt7QUBOYrvrR2fl8FynXyQoLVcMsEvi/4bfWQNrUpxgjIEy
 jMfXmjVOPrfN2Sgc9x1PN7koB5Sv8KHxt9kTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tIw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 cRuq7eAFzgQII7ywsMvVTV6LQ19IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQqaCP
 JZANFKDajzgRQEfZ0w3Fqk+nb6Uu3ruMDZFqBGs8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW73XcPARcbUV+6p/iRiUOkXd9bb
 UsO9UIGr6I/6UiqRdnVRACjrTiPuRt0c9hNF+w37imdx6yS5ByWblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpW8WFGD3YfKkgqsGhZPCl0ESQ06YQgatoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWa0bb1HRcBJG9GRF5iLJ904DNZWfhoBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66IP4IUOsQsKFTboEmCgHJ8OUi3zSDAdollZ
 /+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwOzbiYp
 ijtAxAAoLc97FWeQTi3hrlYQOqHdb50rG4hPDxqOlCt2nM5Zp2o4rtZfJwyFYTLPsQ8pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:XAgVQK97p/eWyO/YoYtuk+F4db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYW4qKQ0dcdDpAtjlfZtFnaQFr7X5To3SIzUO31HYbb2KjLGSjAEIfheeygcz79
 YZT0ETMqyTMbE+t7eG3ODaKadh/DDkytHSuQ629R4EJmsGC9AC0+46MHfgLqQffngdOXNTLu
 v62iMznUvYRZ1hVLXcOpBqZZmnm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k/Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXIISaCUmRMXee
 v30lAd1vdImjXsl6aO0ELQMjzboXITArnZuAelaDXY0JfErXkBerR8bMpiA2rkAgwbzYxBOe
 twrhGkX9A8N2KxoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIeLH4sJlOz1GkcKp
 gkMCgc3ocgTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dg/22J6IJzIEUaICbRBFrEmpe4fdIi89vdvHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67843415"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKb+eHiTZ/B/VGdXsbj4Ks7zQ9uOpEDaQqweB5seCC0FZwGOffUUpiP4IY6KZamnsRpjD1WFGEQBfKUc+zHREzN0JmnENo2HQpiDqjeAgDNFKQwaLXiJECja3y0pX3ZQ9WqWm7K5jTzcgPct+zepxRewryxVlrNnr1E2edb6rZevgZxKskknnqdOvjjF/R7TipFDg7gzgpe8N1wpvIq6lzAZDd4/u0yrK6nHHOQT8Syddix43kW0UCCxbELxlXPYtUQv8tEpZ0thvuY6PThwC5ZHJAhwRAwt7MS08oVaGh/8zch/QBCTXdPSXJYk7wXUfmjzni2NtNbqyofuj/xQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXPkygFoJY55e+SWucnOmDTiQ0SNIKUmYAAayH0bJjc=;
 b=dEEEexJFFFqiV9mHjo3lOnzKlftE8kSfufuWsRrlkJk5UcULj6wcTs4py57L4PLx2sChI8kKxOn4X3iAKmfPPx+A+8NmYzIGFniml806SL1/jGL9gpZWFU4JbyfFV5ItcL0qqWoSiNvi6kaev2DE4XNM00KjYswVgf1uKxobkA8IuhtmY3ZBE5aJGfVRQ3X6jeBZPrTz4j8KrmQ/kJ299yfF7Nk43zyW0YLQmoRseTzrkyvP4y78XSKpU9TmPC0it/qxKWTqcxuyOAJTXms9i2jfrgRikoZVV4HumBi49aRldLkxtGygcg3uGKjYYpdpe4Zeqx3bpxakGADyrt0djQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXPkygFoJY55e+SWucnOmDTiQ0SNIKUmYAAayH0bJjc=;
 b=CDdck0Bv4BGr6cV6X0/cGmqjzM4elyp97XLn5bAIH/gOY+J2ANVIGHNKQzzSBomnufLsOvS1LH4XjzkYFVdBZ6X4GrhQDPw9FUhnYWnIzTJTXoZXRVh91s2msNZCQjtWBeGg7+l845Cmm57HV391C2wg/d3Jx2P0Liv5xgo8H3Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] tools/firmware: do not add a .note.gnu.property
 section
Thread-Topic: [PATCH v2 2/2] tools/firmware: do not add a .note.gnu.property
 section
Thread-Index: AQHYSBCQ6RH62CeSa0GAvBWgl8BYdazfs3yAgAAVD4A=
Date: Mon, 4 Apr 2022 14:00:27 +0000
Message-ID: <2faf7cac-84c2-230e-c320-ada578748f0c@citrix.com>
References: <20220404104044.37652-1-roger.pau@citrix.com>
 <20220404104044.37652-3-roger.pau@citrix.com>
 <aba2f53d-0790-d337-ce9f-76546201bcdf@suse.com>
In-Reply-To: <aba2f53d-0790-d337-ce9f-76546201bcdf@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5936132-9a32-4e21-e2a2-08da16437911
x-ms-traffictypediagnostic: MN2PR03MB4733:EE_
x-microsoft-antispam-prvs: <MN2PR03MB4733179B2C2869C1A64F8475BAE59@MN2PR03MB4733.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 15NCScb66x0g/BKKm8YLXIbilSc4C9MZvdoZmot0vbvOFyuSwUu5qGGd0BDx3b8vZzUMt+YUik6N9i4NWv+4vJq31DEybwMtUWdxkU1FCXn58jpHhyPfQ0jyuKOEXmiSAgdbw5om1ZZcAVP40s6jpLz1KoXAINBKSa9C0DSOF+ouLxZ76H3+RLVLiuHA0NmVe3fPm6OJg9bdrm7W8z7HHagnVF5M9g/G8YX1LvV6lJHbVffPPFxYCdKAylfWm/FPrgklTi7MYXjoLeE4AZGm+WW3PSYkHaivLGFJCGUPqVzYhWcrFd7pfQ+EsicAWomjT2LD2XF3bVwYuw14zMgIQgm9r0CGmq7jIq84DXzDGtqrNYA8DlMH6xfMC2HITiqq17+zndftqXLAfHY8HEDKEdeE/Hp2VJ7tw6g1D0507ceJtoF8ZSuKGB0FBSoRLbbXlQPrhtwmgv3Vekdjdn+IpXE0XJC2relF5MLME+oQr1lo7dncKZGQpp3ZapJaczDsoGna+47TSNCuyJolb4izEysjWI+8j8FPqSjlC5/4t52ldzA47CrJ4slQ16jWa3iRMKv9+ONNUzQH2TW+vFj1zT5GWIG7ZgGdnCVdaQQ7spm0Av4DYDWbW+ucZkDOWmXKwRYcFrlKkbS3xxe6Fu77VxzZIcEaTE0S6tfMf7Z2R916XzE6WxqdYN4pX9+cslVCU/VvjkvYXA1tutPvIH5bmjOEO6LIdlRD6LNnszQaEgZ/pgvCKnLM4AwZija5Y+to5cVUysdZggpWfuVzXAdjjrqzjSB6ro/yYH82NvOk8os=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(122000001)(5660300002)(8936002)(6486002)(508600001)(107886003)(38100700002)(2616005)(38070700005)(26005)(186003)(83380400001)(54906003)(6506007)(66556008)(66446008)(2906002)(86362001)(31696002)(6512007)(55236004)(53546011)(8676002)(316002)(4326008)(76116006)(66946007)(91956017)(66476007)(36756003)(31686004)(71200400001)(6916009)(64756008)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEs4UGdzYlAwZW40eXMweFJwejJaM2dSMldETEZRQ2NjUjVZU0JwU3RTdXBa?=
 =?utf-8?B?ZVZpMEdtRHNnQlJ6V3NqM1hRY3VRNWN6RlZRQXdGYnNVbVZBck10dWlFWnV0?=
 =?utf-8?B?Z2wzNC9WaktwQmlmV2IxYzZ0M3BLdnZXeGtKeDZDRmVYNjlmblY1ZURHTlYx?=
 =?utf-8?B?MlZUUktza055RHBJZWg3YW55YnVwU3BsTUZ5MEpBWTNBU0gwWHkwSmdzQnRJ?=
 =?utf-8?B?TnhLdWhWVno5aml6akc0OEpObjN2OFBWM1l6MlI5VzJhQ1loR3BJNVVKREFR?=
 =?utf-8?B?ajRRWEU0NkJJbFBLQW93bkswc082QktIU3lpVWlTcDVBMWVPOGlZdVRTeHhx?=
 =?utf-8?B?Nks3SnpOM1hXZkh6VWsvOTd4dnVhOW1TK2VaTG9kNE5qaGVWMHBlTGlITGFi?=
 =?utf-8?B?Tk1zSU42NjVFY0w1Skx0UW9TbkNUVC9mcm5XS05kTXYyM0E0Nmcrc1RydGVl?=
 =?utf-8?B?cmdWb2VjQlozdkE3L2ZLd25GRDgxeERCeVBPengxLzRMUGtKeTRWUm5MN3k5?=
 =?utf-8?B?YytLdExzUkNIbHo5alRhZllLRStZbUJjbEJLdHIzN0tsZUdFdU1GbHVqc3RY?=
 =?utf-8?B?VzBlS2JjSE5XUXlQSGR1b0tmWTVJbTBVSFJWcU42dWJTMk5BTkhJTEVMSVl4?=
 =?utf-8?B?dVBiNnFUNDZXcDdqQWt5YlA3OHFTWVc4eEhpRmNpVFZzY3dmNm5XSnpIQmk0?=
 =?utf-8?B?bi9hK3pWME54c2JkbmJOVEIrZk1iVVdicFhIb0VTa3JlOStXa3lXejIwMWxq?=
 =?utf-8?B?bEpJS3gvbzZqRWN0cUQrZmJXSjN0REFYWUQyRU9VSWJUbStBNVJWUk9QLzZD?=
 =?utf-8?B?akMzTHF3VktvVit4T0pxV2EzWG53M2twa2k3VUFUeUtQUXo4dG5COXBwL2Yw?=
 =?utf-8?B?YnlPSmMybk5EZ2N3ZXRobVhDM3pkcUxaYVVOUjhjcU5uUEJ1K3pWV0FLVjIv?=
 =?utf-8?B?SzkxK2dTbzRSQzhzRkdOMDZFbjduT1NlVHZNME1SMGVqWlhTdnNkemFMcVJy?=
 =?utf-8?B?VHhMUGlteVNqbVIramsyWVc3NVlOK3lFbFhuTDROMG9WZ1c0QzNDUTVGRlF5?=
 =?utf-8?B?MVpFMWFsejI4d1BkSkVoWVpmU0twQ0FiNmRacENnbUNhUG1raDh3K3pxWEM4?=
 =?utf-8?B?V2VRT2VjTkhCeWk0YXRBUFFkOCtJdC9rZ3NPb084b25hQnYzdTlEQXNxV28w?=
 =?utf-8?B?QkNOalZFU2FFdnRIcGsxQm1GODBlUXZyUGZiSHZ1QzZNWTNNUHlwMFVrSFpC?=
 =?utf-8?B?VTZxUURzeC81ZU5ZTE5UOGo0WjhLK3d6QWJwa0kyeUdja2d0ODZ5ZHZWN2tm?=
 =?utf-8?B?ZFl3cHd6dytJRU43dXRpY1JUYkxlUkdZV2RZdUhHWlNmM3FYeDRId0ZSaTQv?=
 =?utf-8?B?aWMxYW5XRFZCWjNuMERmcEFVWkczb0haWlNTNkwrMEZhV3J5RjB5YXRYUUtT?=
 =?utf-8?B?dlRLNlUwY1EyWUVJeEtYV09UL0xDZko4a0xuV1FVYndtMUY0T2xKTWhMWGEv?=
 =?utf-8?B?a3lGbkNZLzBuM0VmSXpDMERkRVp4dkNPMi9oRWlpbHVJeVZpYTFTb0NFbEFr?=
 =?utf-8?B?U1FUMEJYbU9rU2wvRHRkN3FaMFhNaWNJQS9rZFhKMzQ4U2hXRnVaRW1mdUxJ?=
 =?utf-8?B?c3NGaEFiMmFEZXNtOUpoMWxqOUx3RnpNdFNLZm0zb3ZHY2k5ZFpjWk1acjFo?=
 =?utf-8?B?R1VsZFNXK1dwWVpRL3pmZGppK3NHb3crUUtTckhIY0dSdllsUE16OURzWVlz?=
 =?utf-8?B?QWcrbm1ncWV0V3JleEtHRmFpeHRpVERpbENCWVR0WnFKQnlyVDRzczkwU3hw?=
 =?utf-8?B?Tno1YzVWZnEyajVIbkVOdVk0Yk9sUklEOURlY1pLSFlxQzRIb2FxOXM0Zmpi?=
 =?utf-8?B?NGV3RDlxcThhTUZCSnh6STl4cFQ1MTVyUDU5d3UxSGpvbmYvamNxc3htYzRG?=
 =?utf-8?B?MUFORWN6S09GeUVmMHlaOGwxZnFZT2o2cWxDakFCeGt1MmRVaGxuc0pSMlQ3?=
 =?utf-8?B?VUJjam5QU0JxOGQxY0NSeCtTS2NBSWljbXVweUd5MnlmSE82RWU1TXg1Mmla?=
 =?utf-8?B?b0J0UXR0R2JuSG13Smo1QlNmL0RqOFUzdHhnS0YwRWE1UzlSNlVUT3hxRk0y?=
 =?utf-8?B?VGd1VHBVSjZMN3VJdUVjWjh3NEdYWlRybXVNUWExOUs2Z0Y5REkvWDlIazh2?=
 =?utf-8?B?bDNxeXI0aFQxS2EzQzluS0hDZ1Y0WHI5ZGhjWXBwV1phRXJyUjZ1ZTQ0QXdP?=
 =?utf-8?B?MW9NTEs0azIvZk0rdmRuZFpPRGFhVm1zL1hNSllaY0o3YXFIN2hySjlhVmRW?=
 =?utf-8?B?SkN5OHlQajhreXEyZjlGRGRIblNhWWZoSC95QkdUeGNWMjNwV3p0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5712E328BF5CD146AF493964011A5FA9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5936132-9a32-4e21-e2a2-08da16437911
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 14:00:27.5088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLfspjkU9nQH5+4XYYeRPSsZpeh1MRAMJuNhQ6AGvG2JXzggHcU1+RgLtwH3RT53CcZtIstQHM30ktnG/AkAah/bwOrT6Nx2qdQ3kDHziyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4733
X-OriginatorOrg: citrix.com

T24gMDQvMDQvMjAyMiAxMzo0NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA0LjA0LjIwMjIg
MTI6NDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4+IFByZXZlbnQgdGhlIGFzc2VtYmxlciBm
cm9tIGNyZWF0aW5nIGEgLm5vdGUuZ251LnByb3BlcnR5IHNlY3Rpb24gb24NCj4+IHRoZSBvdXRw
dXQgb2JqZWN0cywgYXMgaXQncyBub3QgdXNlZnVsIGZvciBmaXJtd2FyZSByZWxhdGVkIGJpbmFy
aWVzLA0KPj4gYW5kIGJyZWFrcyB0aGUgcmVzdWx0aW5nIHJvbWJpb3MgaW1hZ2UuDQo+Pg0KPj4g
VGhpcyByZXF1aXJlcyBtb2RpZnlpbmcgdGhlIGNjLW9wdGlvbiBNYWtlZmlsZSBtYWNybyBzbyBp
dCBjYW4gdGVzdA0KPj4gYXNzZW1ibGVyIG9wdGlvbnMgKGJ5IHJlcGxhY2luZyB0aGUgdXNhZ2Ug
b2YgdGhlIC1TIGZsYWcgd2l0aCAtYykgYW5kDQo+PiBhbHNvIHN0cmlwcGluZyB0aGUgLVdhLCBw
cmVmaXggaWYgcHJlc2VudCB3aGVuIGNoZWNraW5nIGZvciB0aGUgdGVzdA0KPj4gb3V0cHV0Lg0K
PiBJIG5vdGljZSB5b3UndmUgYWNrLWVkIGFuZCBjb21taXR0ZWQgdGhpcyBwYXRjaCwgd2hpY2gg
SSdtIGhhcHB5IHRvDQo+IHNlZS4gSG93ZXZlciwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3Ug
Z2F2ZSB5b3VyIGFjayBoZXJlLCB3aGVuIHlvdQ0KPiBkaWQgcmVmdXNlZCB0byBhY2sgKGFuZCB0
byBleHBsYWluIHlvdXJzZWxmISkgZm9yICJ4ODZlbXVsOiBmaXggdGVzdA0KPiBoYXJuZXNzIGJ1
aWxkIGZvciBnYXMgMi4zNiIuIFdoeSBpcyB0aGlzIG5vdGUgc2VjdGlvbiB1c2VmdWwgdGhlcmUN
Cj4gYnV0IG5vdCBzaW1pbGFybHkgdXNlZnVsIGhlcmUgKG9yLCB0aGUgb3RoZXIgd2F5IGFyb3Vu
ZCwgdXNlbGVzcyk/DQoNClRCSCwgSSdkIGZvcmdvdHRlbiB0aGF0IHBhdGNoLg0KDQpUaGlzIHdv
cmsgb2YgUm9nZXIncyBjYW1lIGZyb20gYSByZWFsIFhlblNlcnZlciByZWdyZXNzaW9uIHdoaWNo
IGNhdXNlcw0KUm9tQklPUyB0byBleHBsb2RlLsKgIEl0IG5lZWRzIGJhY2twb3J0aW5nLg0KDQpJ
biB0aGUgbG9uZ3Rlcm0sIEkgd291bGQgbGlrZSB0byBzZWUgdXMgdXNlIHJlYWwgbGlua2VyIHNj
cmlwdHMgZm9yIHRoZQ0KYXJ0ZWZhY3RzIHdoaWNoIGhhdmUgY3VzdG9tIGxpbmsgcmVxdWlyZW1l
bnRzLCBiZWNhdXNlIHRoaXMgaXMgc3RpbGwgYQ0KYm9kZ2UuDQoNCn5BbmRyZXcNCg==

