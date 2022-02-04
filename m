Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104AC4A9A0E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 14:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265539.458932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyju-0007zp-Bj; Fri, 04 Feb 2022 13:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265539.458932; Fri, 04 Feb 2022 13:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyju-0007x3-7J; Fri, 04 Feb 2022 13:35:02 +0000
Received: by outflank-mailman (input) for mailman id 265539;
 Fri, 04 Feb 2022 13:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTBG=ST=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nFyjt-0007wx-6o
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 13:35:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e40c8de-85bf-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 14:34:58 +0100 (CET)
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
X-Inumbo-ID: 3e40c8de-85bf-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643981698;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=N+xP3oaBWnSLB+9ZIZjG6LWMDdhaKkmifppjDyNId54=;
  b=WhKakJtwtFGA85pTgG1HCRrcERxtDeec+5MZRg6FfSm7SGwzRpAR5K7n
   xzkHrs5biMvCyXqEFCmDv96EMbCKJIUm1/KaTxJ89g8pl40tsVpeXKMwd
   yG81Y4svtMzYhn2HwoZSvyY+AE3X8d94xd+/Gw+ESaPtitSHz+rP2VcJT
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kDA+gylL1+8UyRG/76Glu7ct8DT0dp6MguNI/G5Khdnk6wVqk5XFX9L0UNk230xevU55ILSG9F
 P5lRV73EcQCgTgRmLtGxtDlWxGgUojGivpnUgCMmdjd0Ica48zPxSEeFvRDPmxyeoh9kljvmeP
 /ZGN6GItVMB1BNqC4e7FB8xKrjciMfoVn3jfZsyVk3EPnb5xkA+iWpcGvk55svrMgJvm7mm6wZ
 GIpnxKpJjuF8MV9AwxQ7J+kLQLkuMqBI0hf2SuWYEcLOWkUZCYyt8PNxFjYEgbgIMLlay6S48E
 LXjfI+jO6t/Wxk+n70vqTGhE
X-SBRS: 5.1
X-MesageID: 65708420
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JPbMNaK2YvdtuT5yFE+RO5IlxSXFcZb7ZxGr2PjKsXjdYENS1D1Ty
 mpMXjiHO/aINjbxKN8jaNnk/RhU6MPdmIM1HgBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7x7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Xs4t60
 9h2m6C7SFZzF47JhOYlSgZhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glt2ZgeQayGD
 yYfQQtLPDXuJBRlA3MeVa0Ah+ejgVSuSjIN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 2QL/gI+oK5081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S7HKjMPVTN6RuAttZ5sbB8vy
 l2xhszQUGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lo0EuRE48L/Lqdy4SsRGqum
 2ziQD0W2u1L5fPnwZlX6rwub9iEgpHSBjA46QzMNo5OxlMoPdX1D2BEBLWy0BqhEGp7ZgTZ1
 JTns5LHhAzrMX1rvHbWKAnqNOrxj8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5VgBv8INYSrxMvQfj2eN5yICl/OI+TPNDai8UzazSsIpKF/vEN9GOSZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7x17FPf/QhnnTm7bcmil3yPiOPCDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TXsGr8pEHK7LYf2KL2ggJUpfs/F/oQKQ894x9nebU5
 HCtHEhezVv0n3rcLguWLHtkbdvSsVxX9BrX5AQgYgSl3WYNe4Gq4PtNfpc7Z+B/pudi0eR1X
 78OfMDZWqZDTTHO+jI8a5jhrdM9KET31FzWZyf1MiIie5NARhDS/oO2dAXY6yRTXDG8stEzo
 uP821qDE4YDXQlrEO3fdOmrkwGqpXEYle8rBxnIL9BfdV/C6o9vLyCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWtO/kOzPb82yvxZ57fNyJJT2NBnnp/KiCZ
 PlOy62uOvMwg1sX4ZF3FKxmzPxi6oK39aNa1AltAF7Cc0+vVuF7OnCD0MRC6v9Ny7tetVfkU
 06D4IAHa7CAOcejG18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXwPNqZxPaMk3
 fwl6Zwf5AGIgxY3NsqL03JP/GOWI31cC6gqu/n22mMwZtbHHr2aXaHhNw==
IronPort-HdrOrdr: A9a23:4uNjeasCWXhVxwp6+sVqoKpy7skC0oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPmftXrdyReVxeZZnMrfKlzbamLDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sJxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMAE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJpZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF4t1HqWxa1e
 UkkS1QePib2EmhOF1dZiGdgjUI5Qxer0MKD2Xo2UcL7/aJHw7SQPAx+r6xOiGplXbI+usMjZ
 6jlljpx6a+R3n77VXAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYd099Q/Bmcga+d
 NVfYrhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtV5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdE15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAW23G4gMyLeFPGC1zwdLkeqbrWnxxEOLypZx
 +aAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.88,342,1635220800"; 
   d="scan'208";a="65708420"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHhiYTyvGUWL2dPmYXqCzUSw/+CzBoJfKEpwgrp7hUn8QntekfBLW7igkAbc69KMugbfhjS2osuFyXh7QQfDT4ipi8HulN6pOYv9dI6DVFs04SD7U0C+9ttSNjOwA6Ud9uFgsyS7xPTGInMPuXPwDwN/0z2eSJzEeUr3LphJwMfUh9mcdafqJopjP3vy/iuDPWCDATWVjppbO6ic/6HZDitbbptUZwoLSf1wOkeabzrshIcuor0CYGbQ3sLeUK6f6TP5thmsq/tXwuocPkIoHQ48z4QPl95BIFPKSzx+jADwewuYBPw0dGlMMnZfdd0BAlOp/B8mBuJ9xIRmNOIUxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+xP3oaBWnSLB+9ZIZjG6LWMDdhaKkmifppjDyNId54=;
 b=F7BM4Bk05jcWlcFMnnAySUVugMmRMiXbdjm78uG8Hlf5W9Gc/JMUjR7Jz6NFJiPcXQCnoSTUtlP6TuiCIqgMlvhG1Ysfw8kADo6cIY71UqsG1lni/1R9ZS3VR/6/jb2DIh5TBS5Yz9gwr2SUfFaeSMHG1dkbSgLaA8fdqJGy3xQ9jCYWHke1Q27NhAHX/Z0iwqbuVtRYoaLzrQz5foC+ndSduU8guCwMQKqVdwLqkrW8GwR/TZ1aXbNIWURCFFGLnehOGhPryyb3KldgiI84RuiFmheiNbgDV6SHTwZTxCdKaAIqOKormmKCI0ZOC0YUjReI2hI7skD2mHaRZqV18Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+xP3oaBWnSLB+9ZIZjG6LWMDdhaKkmifppjDyNId54=;
 b=WFfRgjTgZ4hlqfoXU4nNRnuv2NQ34ZGsq6WZ9R3cDX3gK9fpCMNQWbtYu5uR1mtaAOTNDEz26k5dl2GURrIpM/QydZKron/qaDRPrcQQ/5/kKgWeyuXl/yfxMc+zQ2pI0WvZwISCvq7QxMurSTkYrNVflBsyyXfZhi9HQRPtz0c=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, "Roger
 Pau Monne" <roger.pau@citrix.com>
Subject: Re: [PATCH] tools/guest: Fix comment regarding CPUID compatibility
Thread-Topic: [PATCH] tools/guest: Fix comment regarding CPUID compatibility
Thread-Index: AQHYGSl3cICfrTH0c0a6DCprlMhYPKyDEOqAgAA9p4CAABAQAIAABwUA
Date: Fri, 4 Feb 2022 13:34:53 +0000
Message-ID: <a28ff9e8-c022-6384-ee04-c21b69a4fdd2@citrix.com>
References: <20220203181023.1554-1-andrew.cooper3@citrix.com>
 <53b98995-8cef-48b4-7728-3bfbc236af5f@suse.com>
 <f2ce80ee-f30c-dc6f-e4b7-5d8eddb5b3d5@citrix.com>
 <1333696d-d3c2-15a8-1dd5-7cb0a17ef023@suse.com>
In-Reply-To: <1333696d-d3c2-15a8-1dd5-7cb0a17ef023@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9551e2b5-a4bb-4120-4598-08d9e7e3209c
x-ms-traffictypediagnostic: MN2PR03MB4685:EE_
x-microsoft-antispam-prvs: <MN2PR03MB4685BD42E4044FBA42F22588BA299@MN2PR03MB4685.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Zoj93rV9kqmVW+9/t/x6KkfmnqJdUZ/h3M0thGU/clKHoLoGmwAOfWY2w1jyfdB4WhaIz/bNRLmlyGKymGoLLjKBfGgV6xSe7zLYINmoz/zmYowLzhNQSfwmSLks/ODdP0HSBGLvTLcJmkD//LfchV6PzQ1zD0peWiZE6FGA3G6bsEzgdl392S/d5jCZ09tRF8kA0btO2GDlVILAWXVbwdHGbJ47NQnqsdD7QS8QpUV50SCkBuI/+RFluokbwi1IR4Qi8M1bzcJrQ4LCshS3qOI2AjHgtTtZujsZp7rKRQ9rcvQdvncb31kWYax3wea+du2r+hdYwgdbuXOnBoydpeFr+4fQHz0Kp+lWXWBGXNCCBwxFAx/u1KJ8Lvekw2Zv4bi5SEyH183IDOk1h1Wo/VIursYg+wuN8/a6gb/en7T1B3pi9ViaNDhS2Mb5G5Q/GDF7GsC9D1MjAAfHQx7GQ+qtA5hBN5wQC3ZM93/LYdyA0ZzNTpr47FijQ5sg8yGgxTvPkPRsbH9UIqjpRJtRhPGVRRghLvmwc3ovzq1flw8sLYNwVTMydY+ry+QEUshHsPH63tYV2q8KwREx5+4DCfHgwRMrK9yhaCiq7n9pByIVnX+i/+3Cu7BhUIrktHY0BdAuDmS3rUVrwPMk/nzPemC9/IelAZ2kgJU/S4voQNTDy1ppxy9h0Cjn33jbW3Tf4uJ4eRbQObdzre4y7sB42wpYHjMh71RF9lwmxyqg45mOjoYyYFM3NfJN/eBmiLhkCl4SxjFfPbZfxp/yl0jsw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(38100700002)(64756008)(66946007)(66556008)(4326008)(66446008)(8936002)(66476007)(83380400001)(76116006)(508600001)(31696002)(6486002)(38070700005)(8676002)(6506007)(53546011)(316002)(107886003)(2616005)(54906003)(6916009)(6512007)(82960400001)(86362001)(71200400001)(26005)(36756003)(2906002)(31686004)(122000001)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmRCVDQ3ZldVU1FvYmdaQXNxZDF0d2pPTXBUQ0F0V3FDdmJ3NVdXSjAzQklE?=
 =?utf-8?B?QTM5eTVGdXBSbTRFR1pFZVkrQTZiMmUreXN4eDhvamdodTh0a0Vlbm54TnNW?=
 =?utf-8?B?S0hnaEFnMlQ3VzJ4aGpxNDlPMDUraGhqaVgrSExONU1pbEtkaFdzek12YWhK?=
 =?utf-8?B?c1RMaWZFZUZZYXAreFRNZGlXTS9Kc3J2cDRDQ1NRd3J3TDRRVGtHZloyNFN5?=
 =?utf-8?B?SmJkcGN3QnlOVDJRdndjR3p4TFBJRTZ1ZjJXc0ZEUWp6OVl0RkN1ZFRJejYv?=
 =?utf-8?B?TEY0UGl3MHlmZ3FQM2hEUkh5bVo1cE1OWkV5YWo3N2YwQXVVaHRGMG1kYkxk?=
 =?utf-8?B?Lytndk9IWk41REtUNjJlU2lya2Mrd043R3Z0Y2lXQ2tRVEhtK3pWcVJtUFFT?=
 =?utf-8?B?WHF1Tkl1REN1czBoTVFNb0xzZ2RCTXVnSytzTDQ5U0owTk9VTzVIYVhsdUZX?=
 =?utf-8?B?aElDVEV1Mm0xSytJM2N1eXdzd3R2WDU5OWJwb3BDZVo3K0w0L0NlT0crK2kx?=
 =?utf-8?B?eU1SNldDZkxLTStNdmJsVjR6enZEVXhIc0F0Q2lXN2N0a1pDNTlpRkE2empN?=
 =?utf-8?B?eHYxeFN6akRpS0VleEFReXVmSFpFNWNxajVjdlpIeWNJaUdzZzBpUEkyS3RF?=
 =?utf-8?B?RW5zTHhxZ0tzNHpUbWQzL2JZU3hyemhFT0JlbzZoSWtLVEkyNDhSUFVhbWl1?=
 =?utf-8?B?WlRQeE4vV0poQS9Xc3kyZzdIUk1MRk5pNzU1S0ZwRnoydDVveThRVC9pSWJ5?=
 =?utf-8?B?NTg4RHZuaHBCcytNeDR1TW1vVit6Q3FCVkg0UW5reDg5aW5LRFd3a1dxTElB?=
 =?utf-8?B?VHVZc1N4NUVNYUhnRTdDVkdncTl5aWc1eldVNzEzZEU3Uk9zZ3RuZUxiMEcv?=
 =?utf-8?B?LzNOQm5aTy9mK3FBVDI0WGtuWkZCU2gwOVFSaEhSbXVXNUpIMjdzR1Z1c0V5?=
 =?utf-8?B?aTBoRUFOYlpHakxvWUNTU3lBWFVIRE1qWjNWSEprb2psT2NLQ1BFVGJ1UDVJ?=
 =?utf-8?B?d3FyQXUzRGRmWktXN2tiV2Z5WGJKOUpZNmdWV2d4Ykp3SEZNQU95L3RaVjJZ?=
 =?utf-8?B?UzRYRGZvcCtBSk5CMis5eE13Nzd5OEZRMFBBQ2RsQVlQazhHRklWTU5WeDFo?=
 =?utf-8?B?SlovMy95eHl0dUZkTEtJWkRKbzJTUXQ4bWV0VzRMUWROL0t1eVdjVHZBeXZQ?=
 =?utf-8?B?cFJHUVFNZi9XbDBnSFdseFNlR3hIY1JncmU1aTRBdDlnRHpaa0w5NXpMY0JJ?=
 =?utf-8?B?ZkR1SXQzRTMzeE91bEVCRGNDZWl3cVQwV0dsMjhwU2xVaUtZVWFpL0dETnQ2?=
 =?utf-8?B?dkg3L2UyTm1mSEQzYjdBRjZjak1yRVBPQkRCZ3N1OFl5TXJLclRQWVJ0dEVq?=
 =?utf-8?B?RlFna0hBbStoL3NwUGVNZnFiK001alRyTG5DV3ZnMkN6cTFzR3VoMVZSRzV5?=
 =?utf-8?B?RUFhVFJpd29kM0tEK24raDN4Y1Y2QXBJL1dzbVJXS21qcGVSVWdPdGJkVUF5?=
 =?utf-8?B?RVc2TEFHcUl0RDE5cTBpenZqcDdsN1ZvbmRja0VpdGtyQzNkcnBCVXF3bEs1?=
 =?utf-8?B?eEthaVJMSitzU2ZENWhocXhFYVFpVGxVWXMwNHhqTHBhN0hIT0F1ZGhyNE9y?=
 =?utf-8?B?TmkzZFZzOU5XQnlwOHpMeUN0eUJIODdwT1Y1UmcyUzhlTmY1UXBFT1Fzazcx?=
 =?utf-8?B?SWZ1Sk1odDVhenFhQm52cmpodDkvakhVdEZ3QkhLS2ZOQTV5YXVnNVBHQ0dT?=
 =?utf-8?B?dVlISUlXM3BIQXhrVkxmQjA5R3BLYlpZNVp1dWoreURxTnNDTUZ1VEkzREw1?=
 =?utf-8?B?TEZJc3QxeHBpTSt6Z0t2YkFLUDNORGtKc2lYa0pDNHl4TExYcDVoVHZOc3Nq?=
 =?utf-8?B?RUFVN3AyZXBvdWFpSCtVLzRFQk44WE9WV203L2NnQzMxRzFDL2gyWnErV2t4?=
 =?utf-8?B?WEFvMlVYVHMydklrQ3BEeVErbEtuODNzWlhveHNSWVZPRElBUWNjS0prc2Q4?=
 =?utf-8?B?Zk1YdlRtcUpGNGZhOGNZV1R0M1M2ZklodkxoaGYwbHRZMCtyY2tjend2cEM1?=
 =?utf-8?B?OHNOOVo3RnRmUExBeFd1czVZeXRYOHZEakNjVlVuaGtHZDNWaVRPVnJHMDlO?=
 =?utf-8?B?N2xvczVzZlAwMi9pb2gyeWR2T3VYYmJ6SnkrRkliR0xBaFdST0NxdDloS3Z0?=
 =?utf-8?B?MjZ0V1BhOWlndzJhTmNWU2FtV1hSek5uRlEwcE9zREwzTStzM1lwVS9qVHBh?=
 =?utf-8?B?a0RObG1ldnMxNjlFZGdjNCtnKzN3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04C3A3361E4D1C4290EA2A2F4DC6115B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9551e2b5-a4bb-4120-4598-08d9e7e3209c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 13:34:53.5965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jWICgYgPFv1tINfB522/yU4/6L1Dd3X9WAuaRl+d8FF89AqFEM7E2TLqw5PFFcZdw+IevnLY5sOqK0cL/yrdRZjQnR+Gd7lcqYq6v1/3iJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4685
X-OriginatorOrg: citrix.com

T24gMDQvMDIvMjAyMiAxMzowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA0LjAyLjIwMjIg
MTM6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwNC8wMi8yMDIyIDA4OjMxLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAwMy4wMi4yMDIyIDE5OjEwLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBJdCB3YXMgWGVuIDQuMTQgd2hlcmUgQ1BVSUQgZGF0YSB3YXMgYWRkZWQgdG8g
dGhlIG1pZ3JhdGlvbiBzdHJlYW0sIGFuZCA0LjEzDQo+Pj4+IHRoYXQgd2UgbmVlZCB0byB3b3Jy
eSBhYm91dCB3aXRoIHJlZ2FyZHMgdG8gY29tcGF0aWJpbGl0eS4gIFhlbiA0LjEyIGlzbid0DQo+
Pj4+IHJlbGV2YW50Lg0KPj4+Pg0KPj4+PiBFeHBhbmQgYW5kIGNvcnJlY3QgdGhlIGNvbW1lbnRh
cnkuDQo+Pj4+DQo+Pj4+IEZpeGVzOiAxMTFjOGMzM2E4YTEgKCJ4ODYvY3B1aWQ6IGRvIG5vdCBl
eHBhbmQgbWF4IGxlYXZlcyBvbiByZXN0b3JlIikNCj4+PiBCdXQgZG9lc24ndCB0aGlzIGNvbW1p
dCBhbWVuZCA2ODVlOTIyZDZmMzAgKCJ0b29scy9saWJ4YzogUmV3b3JrDQo+Pj4geGNfY3B1aWRf
YXBwbHlfcG9saWN5KCkgdG8gdXNlIHtnZXQsc2V0fV9jcHVfcG9saWN5KCkiKSwgd2hpY2ggaXMN
Cj4+PiB3aGVyZSBERUZfTUFYXyogZGlzYXBwZWFyZWQ/DQo+PiBOby4gQWxsIHRoYXQgaGFwcGVu
ZWQgaW4gdGhhdCBjaGFuZ2Ugd2FzIHRoYXQgd2Ugc3dpdGNoZWQgdG8gdXNpbmcNCj4+DQo+PiBj
cHVpZC5oOjg5OiNkZWZpbmUgQ1BVSURfR1VFU1RfTlJfRVhURF9BTUQNCj4+DQo+PiBpbnN0ZWFk
LCB3aGljaCByZW1haW5lZCB0aGUgc2FtZSBzaXplIHVudGlsIFhlbiA0LjE1IHdoZW4gZTliNGZl
MjYzNjQNCj4+IGJ1bXBlZCBpdC4NCj4gT2gsIHJpZ2h0LiBJIGRpZCB0cnkgdG8gbG9vayBmb3Ig
YSByZXBsYWNlbWVudCwgYnV0IG1hbmFnZWQgdG8gbWlzcw0KPiB0aGlzLiBCdXQgdGhlbiwgYXMg
bXVjaCBhcyA0LjEyIGlzbid0IHJlbGV2YW50LCBpc24ndCBpdCB0aGUgY2FzZQ0KPiB0aGF0IHRo
ZSBmYWN0IHRoYXQgQ1BVSUQgZGF0YSB3YXMgYWRkZWQgdG8gdGhlIHN0cmVhbSBpbiA0LjE0IGlz
bid0DQo+IHJlbGV2YW50IGhlcmUgZWl0aGVyLCBhbmQgaXQncyBpbnN0ZWFkIHRoZSBidW1waW5n
IGluIDQuMTUgd2hpY2ggaXM/DQoNClRoZSBmYWN0IHRoYXQgdGhlIGJ1bXAgaGFwcGVuZWQgaXMg
cmVsZXZhbnQsIGJ5IHZpcnR1ZSBvZiB0aGUgZmFjdCB0aGVyZQ0KbG9naWMgYWRkZWQgdG8gY29w
ZS7CoCBUaGUgZmFjdCBpdCB3YXMgaW4gNC4xNSBpcyBub3QgcmVsZXZhbnQgLSB0aGlzDQppc24n
dCBhIGxpc3Qgb2YgZXZlcnkgQUJJLXJlbGV2YW50IGNoYW5nZS4NCg0KQ1BVSUQgZGF0YSBiZWlu
ZyBhZGRlZCB0byB0aGUgc3RyZWFtIGlzIGNyaXRpY2FsbHkgaW1wb3J0YW50LCBiZWNhdXNlDQp0
aGF0J3MgdGhlIHBvaW50IGFmdGVyIHdoaWNoIHdlIG5ldmVyIGVudGVyIHRoaXMgY29tcGF0aWJp
bGl0eSBwYXRoLg0KDQp+QW5kcmV3DQo=

