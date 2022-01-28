Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E549F7A8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 11:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261939.453835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDOtX-0006t4-V7; Fri, 28 Jan 2022 10:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261939.453835; Fri, 28 Jan 2022 10:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDOtX-0006qA-RE; Fri, 28 Jan 2022 10:54:19 +0000
Received: by outflank-mailman (input) for mailman id 261939;
 Fri, 28 Jan 2022 10:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDOtW-0006q4-Mj
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 10:54:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1cba937-8028-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 11:54:16 +0100 (CET)
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
X-Inumbo-ID: a1cba937-8028-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643367256;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TQckBNnbN2DjuIhUYz7tdGviOCUcVXp9z8pxSHh+1yE=;
  b=AiENMe2czMVXTQtyfGVhOQ1khwl0hv4QfQFZoT+/TwuK4mcw76WrFuSo
   lH2KLTb9rGcIHmuVXKRfxgBIGKaUJ24d3kIW+agHGciV278r34tzSFOvf
   JKK00ill4gh9VqmNIzEOdzCweXbwR9+hrjsS8RT6qHOEAA9uwt/BW6VOW
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hSuW8XG5L9RHa+42azXpKZcoC+5BLi4wI+8zLGLsnv/i5P8ZGIAM7vzmwHhh3KjBsywPiowSA4
 D7EULPf1HFTQblN5Jjcc2phTzBAb6pdJ8nt/Zh8n7T8qnh36CIPUi+aRV3w9hqzMQbCWcCQPu7
 STTKRpNb0CtZAH/QTu95+vKc6+LK7N7d1g1uBJZ07a2zdugocCFBI6uz57SWh4vHW+Cj5yOMFK
 XKlDzoKggtx2wOY13poPT7x2jSqEWAB6WoRBUj9hOyWBi9bq+Z4La2mmn3GSTnElwUs/R8xlci
 aG0AgNMJEZsymHPs0jlCjSni
X-SBRS: 5.2
X-MesageID: 62972548
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rKooJKnoEjcqkKTAncOwe1ro5gxuIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcUWCAaPrbMGX0LY1+aom/9U0P6pfTnN5mHgpur3gyRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q42YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PlMkIyPaz8ABZHNwrgQSxpaHTBzMoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6yPO
 JBENWoHgBLoTixTN3coL6kChuKlmUfCKwEGp2KMqv9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcJobCbmQ5vNsxlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8E7zRGy6JL92DqYXDQJVj1DZs0ru+ZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZX2AAcmVsnlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1aZxfIWS3P
 ReO6Gu9AaO/2lPwM8ebhKrqU6wXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2lk3yPjOTPDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbaNmPT0FDr2nCsQWmKZORW03wY8TXMCv9JcPJ7fde2KL2ggJUpfs/F/oQKQ894x9nebU5
 HCtHEhezVv0n3rcLguWLHtkbdvSsVxX9hrX5AQgYgSl3WYNe4Gq4PtNfpc7Z+B/pudi0eR1X
 78OfMDZWqZDTTHO+jI8a5jhrdM9KET31FzWZyf1MiIie5NARhDS/oO2dAXY6yRTXDG8stEzo
 uP821qDE4YDXQlrEO3fdOmrkwGqpXEYle8rBxnIL9BfdV/C6o9vLyCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWtO/kOzPb82yvxZ57fNyJJT2NBnnp/KiCZ
 PlOy62uOvMwg1sX4ZF3FKxmzPxi6oK39aNa1AltAF7Cc0+vVuF7OnCD0MRC6v9Ny7tetVfkU
 06D4IAHa7CAOcejG18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXwPNqZxPaMk3
 fwl6Zwf5AGIgxY3NsqL03JP/GOWI31cC6gqu/n22mMwZtbHHr2aXaHhNw==
IronPort-HdrOrdr: A9a23:iZUP36McGr8sDMBcTv2jsMiBIKoaSvp037BN7TEUdfU1SL38qy
 nApoV56faZslcssRIb9+xoWpPwJk80nKQdieN9AV7LZniBhILCFvAB0WKN+V3d8gTFh5dgPf
 gKScND4afLYmSSJ/yKmDVQaOxN/OW6
X-IronPort-AV: E=Sophos;i="5.88,323,1635220800"; 
   d="scan'208";a="62972548"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0WMKI2GvHL2fAkCA4Wc+gCEV0+vLoVweYx1tlS1QVRiJx2l4utwKoOT4bmbThIrwggaFgA4fi2MphSTRe17PiUsnWv7eHqe+uydSFWYUJtpnkd7J2PSBcUh3xzl0LotCgDuhnhmaOJjx5TBB2t003zEcRk34v8XgRrfsWGzL2+r+Sdv8CGUTBdE9cLz/4+qZolSYks6jdlOLThORwFoy4g9Wt6eSz5qV2z4TNMkMP0UtzRL4jizekwpHiW/jMROawZBYKGuIkzEGL7aATrsTs2/cElSL8YqcSJrbXHAG3c732nxmdgmED5AJxuXFGlDaXc2KLrq7tHjHmVZ6gerQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQckBNnbN2DjuIhUYz7tdGviOCUcVXp9z8pxSHh+1yE=;
 b=JlWPos8mApt0iovst+m8Xf2AL/KYcGV7L88c2mApSWFb0JETT7o3vJwRrOUFntHZ5PAUMBSFychM51ZQNuZYNNPEQanES41P7W5WDe1IqT/ucjv/Hf8c2lEi5rhnJKYLCH/q9kbR1GFaW6pB0QhAvKvVDQo7PN6NunQ5BtWD0QQLEJwDqYp/V5QLhRMkeP7cazIylFbHST1k9UfwiAii9ogE2PMYVX44lUHosOP2fwVlK0FHA52OB6bTz5DWKtFrtSVgLfGPjMV91kJMvexbLtZ9A01Bzmv8K9rkyM2uCHoUPK5tqvG0chp7SymFELGr7vP8JO1rbmWRbbkVKBMzvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQckBNnbN2DjuIhUYz7tdGviOCUcVXp9z8pxSHh+1yE=;
 b=mCDxkmpvluvYmTagEt+CsQDw8+m5DcLqvDbkbQyublYB/PWHx2nAg6AUWT/UHPDacWP1Yfupxeo3/aO/LrwGIP9A4HFaYjrp5N1MZ7gfdehANXDfdsnAuA2ijtGqvpU0RmFmvhNcNcmsOCYhZMtrz7P+tZXIx5mkSB5ZSMaoF9c=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "paul@xen.org" <paul@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] IOMMU/x86: switch to alternatives-call patching in
 further instances
Thread-Topic: [PATCH v2 1/4] IOMMU/x86: switch to alternatives-call patching
 in further instances
Thread-Index: AQHYE4zoXz+e/Oq3aUuTOSXG/tztY6x4K5QAgAATQwCAAATRAA==
Date: Fri, 28 Jan 2022 10:54:10 +0000
Message-ID: <06b427ba-e353-cd54-a212-c0b82c78632f@citrix.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
 <9f6e1b13-d53f-05d3-0f88-a05bd0da03f9@suse.com>
 <d5734fe5-4743-8034-57e8-afbc2ce2c624@gmail.com>
 <ecaf1c37-0d70-77e6-2343-68bb25c167b8@suse.com>
In-Reply-To: <ecaf1c37-0d70-77e6-2343-68bb25c167b8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28b4ad03-51c9-4209-348f-08d9e24c8407
x-ms-traffictypediagnostic: PH0PR03MB6493:EE_
x-microsoft-antispam-prvs: <PH0PR03MB649332D2BF3D3FD13D0858EFBA229@PH0PR03MB6493.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tV3Md+V43pOB9ZxPk/XHWCVZ8RZmir5NtvNw3xuOEKwKVNouTtSTYBZ8M7qS7eup1xVkXNLLwvt+2AHMsnelrO4bfxjLUYgh2rkL7D7GDxToBYUtYpPPmXvB1Kb2V+OhvnUs1eT/dVWDp4ENRMLz/7mLTu/3HJvpNyBvE7QDCZfKZPB4KgzL5sFyI/3uJKuC99rTS7wnmyUUrKlqgQbenDIoM01S2bLJCmIoI6NQ4FNbC7xS206/8GjCw2k5cJny27KRTp87hSI4yCwIX4Tl7QVOJYd7N9FTRmbKDOPThzIb0LyIaHVRB5mKZhZ9gwjNcQRzWriVgrc0IO0k4wD5WQzcu3PYDlInNdktfdSEe/QOVKxWwO4CIGu3AjOxKkF9TaN2sK5BISR2yGIsR2VHxUmAZi3MBFBI2YE4lWvbRLk3+tKhWgelnypVXAubRlbgdtC2k+5ZNgQ1d7wNuMjkULP9u1Mv3oCIlHJH2/2rFj7ECQYBctLa6Viu604717Dm1wYVoOKxmeZvYf6pIfbewFCRYJSQ5vtD1htYuGM+PuIXtXFpr8HF2iEx7rC3RWA3nrRiZHw3taZfkaKdli6o3iKB2kaV/im2ljqn9+3RE3lVQ3EoUsgu1hBfRLIcBChSvW3OqEh9gzi7HUTThh4cXgnsji4tznH8aMpKHmFI9qVVMBpgdewYty6DOU52DkWUFQ5AiTFkU7jKFajxQTEM+yT2qpKxEFmkNLNtuR2jvLVbLzlMziuNNSbPC4QXwBT1qA5WNDShMAt6AqXu8Z39rg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(38100700002)(31686004)(110136005)(316002)(508600001)(2906002)(2616005)(6486002)(38070700005)(36756003)(122000001)(66556008)(66446008)(8936002)(91956017)(66946007)(6512007)(64756008)(8676002)(31696002)(76116006)(4326008)(6506007)(186003)(5660300002)(71200400001)(83380400001)(26005)(53546011)(86362001)(66476007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjVmYXBnWmNuL25iVlRBb1l3Q01VaUlnbXVqM0s4aUFGRUZhM05hdUpndXdq?=
 =?utf-8?B?aXVkay82RytBL2NnUEtobFlvY28zSk5keVNDOHIwN0NiNDk2VHByZHIzM0pu?=
 =?utf-8?B?ODNRa3VlTlRiaC9GUlhMSnlQMUNJL1d2V053Ykx5WTdheXB3QVhxc2J5LzJM?=
 =?utf-8?B?NXI3ckpQOUw2UlhKa0t6TXM2SEZkSDBNYWZqc1RWQWt2NTdtQUV1S3gyNUFl?=
 =?utf-8?B?UkkvK0s5NS9aU0R2MDNLVi83NWdwd3EwUlU5S1FuOTZDOGJIb0hoWVdjUWZ6?=
 =?utf-8?B?T0NNdUJuSmhmMTJ4cVhYNEcrM0p3WHdnL240OXl4Sml2RmY3aTlvU2ZHMGFx?=
 =?utf-8?B?M042bzczNExMTWxJc3NnQnZUcHJrSlFreGp0eGxGL1BST09CbXlXeFlLZys3?=
 =?utf-8?B?R3FUZEgydEhLOVhuaEdSeEpiaUZGV0lwdm5NQmRlOFFrSStWM2dnb09KSSs5?=
 =?utf-8?B?allOTmlBVVZSSlpvZkhLWTcxU2ZWSnNRbnh2aTJHUFRSTHgyMEwyQjFJQzdj?=
 =?utf-8?B?YkFhVG1uYzJVNGR6Tm1vRFA1Q2QyUEdTVWV3K2VNMG9mUW5lS2VET1dtSG9v?=
 =?utf-8?B?dUlsVFZ4SG5TLzEybDl6eE9wcXVMN1J5MmZHYi82VmpYODhiYm14Vm1HTWJt?=
 =?utf-8?B?TmEwWHFMeUNBUFpOSVYvdHE0K0JOcEF0ZHN0V3Y5MDFHTzJwaGFZbFg1QklU?=
 =?utf-8?B?cnI3MmFiWDB4TjIvUjEyK2toY3hvUXNTQnkxT0NsK09PRkF3T1ZnMzB5K0Vs?=
 =?utf-8?B?NkFXOFlSbmVEL3JSV05LVGZsSVE3YXluL0VZb1E4S2lsclZYWXZOb1RBREZT?=
 =?utf-8?B?MlJqSEQ3ZXoxMHZmS3VodWszalZ2dzgvRDBrNFpMUXpnNGlMNjhMSHZkOS9x?=
 =?utf-8?B?YldoaFdwMFIrQ0swdDNDOElaYktxWkRSQ0pEUU9ndFgwelAvV2IyTksyTkFZ?=
 =?utf-8?B?OUZjRzg1aWowYTlXQmpmNGZBOGtjcndWMnczTHAzdkRHc0o1TjNaS20rU0cr?=
 =?utf-8?B?SEIxTW9YQVI0OVdURGVIem5DSjUxNTNLUDVrR3JSNnBHNlJLWktaaVh6UXho?=
 =?utf-8?B?WkU5NUJ6cnk3WmMzVTh5QzJ5TkRtdksvMHZDV1FFMDZKSWJFVU9CN25IcEFi?=
 =?utf-8?B?WEhnZ1NSWlA5eHBScTFDTDdmajljS2l1SVdPL2NCY01pekZJb2NjV3BUK0hw?=
 =?utf-8?B?RHNYekZHYnQxZ0JWbEFyeHI3bGpRMVk4c1NZQ0ErZFMzN1h5WlZaeVVHOERs?=
 =?utf-8?B?M3c2QldwcW9paWVnVWMvU29ydk5oOXlseWpaeVhzTDc5VEtDODRjZWtpTkhP?=
 =?utf-8?B?QUh3QkJXVmFBVklCbTVvRjlLaVQzS2R3VzhQdzR4MzVhemE3T1N5RGN3QmlM?=
 =?utf-8?B?WWZFZWR5UFNEYmU1bFM5RkFUUDhITXdFb0pTYVhsWE1CUmZkZHNIVVpMeG1R?=
 =?utf-8?B?M0Q1aEJhVmRSVk9lNHNNVnVKTTF1TlZhK3VrUkZzYU5UcWJiV3g3cVFsS0xL?=
 =?utf-8?B?Y3QyUFl5bnJKL3lBVzdUNlE4emlFR1BMTEdvaElGalhEYzU1VHFYRkNEVTEr?=
 =?utf-8?B?SW12U1lSajhBZ3V2NzFzb0psbDNSd1BxejQ3bUxOUkJuaktMZi9FZ2NjRTh2?=
 =?utf-8?B?YUhLckJWejF4Unp1cmNZc0tQWHp3d21BVk9TZjNtd0xIWFFDbjFuU0R0Yk8w?=
 =?utf-8?B?UFlQWTYxak9PTFZWYWdLMEd3NVBHWjVqdjA0SGtjOWxuaEU3c3VvRFU0Y0Nw?=
 =?utf-8?B?RkdvVWFCVjE1azRkNWNrc3p6OGJsdUZSNVlsNjU3S1VReWU1RDhyM1k2UGNn?=
 =?utf-8?B?TFF3SVNwWlNoOE1SRkRISSs2cUR6cmp0UERGSzI3MldoSVdNaTBLK2ZnMVI5?=
 =?utf-8?B?NUthb0kvVC9pblhoTDR1bU5iRDJmaWFNenkwUmZhOHNEZnBScVA0cS9ZNHFP?=
 =?utf-8?B?SUtrUzA2dVVVZlNqT3N4ZTJ0RXZ6M2w5TlZ1Q0hnRVo2MHRNZ0dJeG84ZmpD?=
 =?utf-8?B?bHgzVDJVdVdNQ0svbC8xZFVtb1F4eVEwdDNiVk5PRVJjbHR3QU5VK0lHckFy?=
 =?utf-8?B?THdldktlUGUydUNHbWpxUmRBeFVBMk5qVzg0anhzT25ONXN0bFNVdEtxakNS?=
 =?utf-8?B?Rzk1eDB4TmpEcGhGczBIUThKK1lsK1F2Y3V4RmwvK28xbE5pWEF3Z2NoU2dh?=
 =?utf-8?B?UWdIcUtsM0FPZThRQmowVjl1dWtaZlRhVzdFZUg0NCt3QkRlOS9FQUZjQ1gw?=
 =?utf-8?B?QVJKNDdvUVJ6RjlkMGNXT20xQWFnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4700A23A4A6D0343B80AA8D8A40F73C9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b4ad03-51c9-4209-348f-08d9e24c8407
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 10:54:10.8686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jiZ3AidATCywXzGycewYsY33o1+Bk4MQSkBLBWODGGATcvKJB+yHrWOSTEfw4hYOg7xbSPOzKL3iDXSjLurXdlIuUG3tGOiYkRpAzmoaIg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6493
X-OriginatorOrg: citrix.com

T24gMjgvMDEvMjAyMiAxMDozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI4LjAxLjIwMjIg
MTA6MjgsIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+PiBPbiAyNy8wMS8yMDIyIDE0OjQ3LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBAQCAtMTQ1NywyNCArMTQ2MiwyNCBAQCBzdGF0aWMgaW50IGlv
bW11X2dldF9kZXZpY2VfZ3JvdXAoDQo+Pj4gICAgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChk
KSB8fCAhb3BzLT5nZXRfZGV2aWNlX2dyb3VwX2lkICkNCj4+PiAgICAgICAgICAgcmV0dXJuIDA7
DQo+Pj4gICANCj4+PiAtICAgIGdyb3VwX2lkID0gb3BzLT5nZXRfZGV2aWNlX2dyb3VwX2lkKHNl
ZywgYnVzLCBkZXZmbik7DQo+Pj4gKyAgICBncm91cF9pZCA9IGlvbW11X2NhbGwob3BzLCBnZXRf
ZGV2aWNlX2dyb3VwX2lkLCBzZWcsIGJ1cywgZGV2Zm4pOw0KPj4+ICAgDQo+Pj4gICAgICAgcGNp
ZGV2c19sb2NrKCk7DQo+Pj4gICAgICAgZm9yX2VhY2hfcGRldiggZCwgcGRldiApDQo+Pj4gICAg
ICAgew0KPj4+IC0gICAgICAgIGlmICggKHBkZXYtPnNlZyAhPSBzZWcpIHx8DQo+Pj4gLSAgICAg
ICAgICAgICAoKHBkZXYtPmJ1cyA9PSBidXMpICYmIChwZGV2LT5kZXZmbiA9PSBkZXZmbikpICkN
Cj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgYiA9IHBkZXYtPmJ1czsNCj4+PiArICAgICAgICB1
bnNpZ25lZCBpbnQgZGYgPSBwZGV2LT5kZXZmbjsNCj4+PiArDQo+Pj4gKyAgICAgICAgaWYgKCAo
cGRldi0+c2VnICE9IHNlZykgfHwgKChiID09IGJ1cykgJiYgKGRmID09IGRldmZuKSkgKQ0KPj4+
ICAgICAgICAgICAgICAgY29udGludWU7DQo+Pj4gICANCj4+PiAtICAgICAgICBpZiAoIHhzbV9n
ZXRfZGV2aWNlX2dyb3VwKFhTTV9IT09LLCAoc2VnIDw8IDE2KSB8IChwZGV2LT5idXMgPDwgOCkg
fCBwZGV2LT5kZXZmbikgKQ0KPj4+ICsgICAgICAgIGlmICggeHNtX2dldF9kZXZpY2VfZ3JvdXAo
WFNNX0hPT0ssIChzZWcgPDwgMTYpIHwgKGIgPDwgOCkgfCBkZikgKQ0KPj4+ICAgICAgICAgICAg
ICAgY29udGludWU7DQo+Pj4gICANCj4+PiAtICAgICAgICBzZGV2X2lkID0gb3BzLT5nZXRfZGV2
aWNlX2dyb3VwX2lkKHNlZywgcGRldi0+YnVzLCBwZGV2LT5kZXZmbik7DQo+Pj4gKyAgICAgICAg
c2Rldl9pZCA9IGlvbW11X2NhbGwob3BzLCBnZXRfZGV2aWNlX2dyb3VwX2lkLCBzZWcsIGIsIGRm
KTsNCj4+PiAgICAgICAgICAgaWYgKCAoc2Rldl9pZCA9PSBncm91cF9pZCkgJiYgKGkgPCBtYXhf
c2RldnMpICkNCj4+PiAgICAgICAgICAgew0KPj4+IC0gICAgICAgICAgICBiZGYgPSAwOw0KPj4+
IC0gICAgICAgICAgICBiZGYgfD0gKHBkZXYtPmJ1cyAmIDB4ZmYpIDw8IDE2Ow0KPj4+IC0gICAg
ICAgICAgICBiZGYgfD0gKHBkZXYtPmRldmZuICYgMHhmZikgPDwgODsNCj4+PiArICAgICAgICAg
ICAgYmRmID0gKGIgPDwgMTYpIHwgKGRmIDw8IDgpOw0KPj4gRG9uJ3Qgd2UgaGF2ZSBhIG1hY3Jv
IGZvciB0aGlzIG5vdz8gUHJvYmFibHkgYmVzdCB0byBzdGFydCB1c2luZyBpdCANCj4+IHdoaWxz
dCBtb2RpZnlpbmcgdGhlIGNvZGUuDQo+IFdlIGRvbid0LiBBbmQgaXQgd291bGQgZmVlbCBzb21l
d2hhdCBtaXNsZWFkaW5nIHRvIHVzZSBQQ0lfQkRGMihiLCBkZikgPDwgOA0KPiBoZXJlLiBUaGUg
c2l0dWF0aW9uIGlzIGV2ZW4gd29yc2UgaW1vOiBCZXNpZGVzIHRoZXJlIG5vdCBiZWluZyBhIG1h
Y3JvLCBJDQo+IGFsc28gY2Fubm90IHNlZW0gdG8gZmluZCBhbnkgZG9jdW1lbnRhdGlvbiBvbiB0
aGlzIG5vbi1zdGFuZGFyZCBsYXlvdXQgKEJERg0KPiBzaGlmdGVkIGxlZnQgYnkgOCkuIFlldCB0
aGVuIGFnYWluIEkgYWxzbyBjYW4ndCBzcG90IGFueSBjYWxsZXIgb2YNCj4geGNfZ2V0X2Rldmlj
ZV9ncm91cCgpIC4uLg0KDQpJJ20gc3VyZSBJIGFscmVhZHkgZGlkIHRoZSBhcmNoYWVvbG9neS4N
Cg0KZGV2aWNlIGdyb3VwcyB3ZXJlIGJyb2tlbiBieSBhIGh5cGVyY2FsbCBib3VuY2UgYnVmZmVy
aW5nIGNoYW5nZSAyIHllYXJzDQpiZWZvcmUgdGhlIG9ubHkgY2FsbGVyIHdhcyBkcm9wcGVkIHdp
dGggWGVuZC4NCg0KVGhpcyBtZXNzIG9mIGEgaHlwZXJjYWxsIGhhcyBkZW1vbnN0cmFibHkgbm90
IGJlZW4gdXNlZCBpbiBhIGRlY2FkZS7CoCBJDQpmaXJtbHkgc3VnZ2VzdCBkcm9wcGluZyBpdCwg
cmF0aGVyIHRoYW4gd2FzdGluZyBlZmZvcnQgdHJ5aW5nIHRvIHVuYnJlYWsNCmFuIGludGVyZmFj
ZSB3aGljaCBuZWVkcyBkZWxldGluZyBhbnl3YXkgYXMgdGhlIGZpcnN0IHN0ZXAgdG8gZG9pbmcN
CklPTU1VIGdyb3Vwcy4NCg0KfkFuZHJldw0K

