Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD344D5121
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 19:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288588.489425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSN6q-0008Hk-Lz; Thu, 10 Mar 2022 18:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288588.489425; Thu, 10 Mar 2022 18:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSN6q-0008Ft-Hg; Thu, 10 Mar 2022 18:01:56 +0000
Received: by outflank-mailman (input) for mailman id 288588;
 Thu, 10 Mar 2022 18:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XE96=TV=citrix.com=prvs=0613c794d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nSN6o-0008Fn-BD
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 18:01:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29792092-a09c-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 19:01:52 +0100 (CET)
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
X-Inumbo-ID: 29792092-a09c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646935312;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dutXrCMyPCT3EF4xQMJwBzi2O1s157h9DnmoUvOyd7o=;
  b=TxabfpyuPgg3y2O6jYd1KniuYAhXYldTOh9pdj4x+SPtSsu4zOhMbu8K
   WRpL4OAJLif87KzREj4TjV5tgvKSQYuUfOlLL2ohDxcuetHOHGYCenS3P
   +62jTLJStSJVY5ZSnmhc6WAo3FG2xaqxG32ot1+y/l1QwZQX9oxBt4nx4
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65951792
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/ra2DK/u2it8Cx4nlOPfDrUDtn6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TEWCmyAaanfZGrwL9okPdnk80wHuZGDzt8wHgI6+yg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oHhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnay+UgsMEKCWobQyAgV3S3lzHo1kw6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZdINGMwPU6ojxtneRAYLJ83kdqToXThMCN/pmKSroYo7D2GpOB2+Oe0a4eEEjCQfu1ZmUuSq
 2bu9mHwEBYcctCSoRKH73ati+nnjS79HoUIG9WQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxYAx80qxR9W7QBy8o1aDpBcXX9cWGOo/gDxh0YKNvVzfXDJdCGccNpp276faWADGy
 He5kcjlIBJi6oTFZiOB2e/MoBCSGxMKeDpqiTA/cSMJ5NzqoYcWhx3JT8p+HKPdsuAZCQ0c0
 BjR8nFg2ux7YdojkvzioAuZ227ESo3hE1Ztjjg7SF5J+e+QiGSNQ4WzoWbW4v9bRGpyZgnQ5
 SNU8yRyAQ1nMH1sqMBvaLhVdF1Kz6zcWNE5vbKJN8N/n9hK0yT/Fb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kfawSI2+DaiKPoQmjn1NmOmvpnEGiam4hTyFraTRuftnZ
 cfznTiEUR729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eH2WZJhcp9caAHmRrlgtMus+VyJm
 /4CZ5ri40gOC4XWP3iImbP/2HhXdBDX87it8JcJHgNCSyI7cFwc5wj5mupwJdY6w/wLyo8lP
 BiVAydl9bY2vlWeQS2iYXF/crL/G5F5qHMwJys3Oli0nXMkZO6SAG03LfPboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:OWwx3aq0dt8+/AGJXeZF1hwaV5txLNV00zEX/kB9WHVpm5Oj5q
 KTdaUgpHzJYWgqOE3IwerwRpVoMkmshKKdgLNhf4tKMzOWwldAQLsSircKhgeQZBEWldQtkJ
 uIEZIOdeEYZGIS5auXj2fYYrNQpOVvsprY+ds2p00dEj2CAJsQljuRfzzraXGeMzM2fabReq
 DsgPav4ADKRZ0QVK6GL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/hYsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYI7iJGofy+gzdktvfsGrCo+
 O8+CvI+P4DsU85S1vF+CcFHTOQjQrGpUWSlWNwykGT0fARDAhKePapw7gpLCcxonBQy+2VCM
 9wrhCkX0E7N2K0oMwmiuK4Iy1Chw66p2EvnvUUiGEaWYwCaKVJpYha509NFowcdRiKqbzPv9
 MeR/00ycwmPm9yVUqp8FWHAebcFEgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuAw/Ys+DfM+fOZ4HqMMUMG3AmvCTVbFN3+TO03uEOUCN2jWo5D67b0p7KWheYAOzpE1hJ
 PdOWko9VIaagbrE4mDzZdL+hfCTCG0Wins0NhX49xjtrj1VNPQQGG+oZAV4oadStkkc4Tmsq
 yISeRr6tfYXCPTJbo=
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="65951792"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFAb8lapqIwu5xEZYQPrNOxkNZwypVvDfG9s4a59SrdLZktIAEZE910Ivm0upUl27UV97brZLZMUtp94B8+C5WDoEl+epO+oUcVwCUFhT2BP0aABOLuRiCfpWUQfw/zzAZUuVDOTkFdKOSdY27aw1KKob/YT86Gh7ix28rrgB9CWgvN5bta6hXh3ZdeXgANyhGYKwAbU33CvINZh76qD+PDFL1qKO1i7kC0BCghHCabX5Ts1rsO0YL5rYjWk/JE9HStiUduykf6SlWSCP2MNeN79ViuTyM/6cgApoKoNBB6aoOWbdG+uTkqYoVAwdUm6m2siGjDDDzJeu3o2lnMDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dutXrCMyPCT3EF4xQMJwBzi2O1s157h9DnmoUvOyd7o=;
 b=hRFmy6YCzdutdgcdtlvhtAnbltcvSH7wuypivjicnSuzvU8bNEV/B2VRzO5ijb1DseNQdWKHJ/NvxL/tsRl7Ds0KZyrSSJgYPOFSdRbzy4/z/6gM5aZzIE7bLBmc1EerSfXIRCmL3NrR0wN4+EabT3rq8cFdRjUGrfAFUUYG+5jx+7Y1KwwM4S/3i1gK2vXjDzklj85WSbOvqapzrwHnmhuVQ6SsT8/ZGH/+FqiKg60LP6DR86MSD6tvjYYR/rsNGoIGfJDkBoOG2xm0LRc83Oofha/JNMBA4BeRw7sM4d671SJ3BovvGmSS3ewrfAmbYlz2CxZngUx/5yJrI5wb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dutXrCMyPCT3EF4xQMJwBzi2O1s157h9DnmoUvOyd7o=;
 b=aSQKJu5nXfjf7mplHr5R/hTu8LzfXAFspQA9YARZ+aqezeYK+6piNj/J4ZxrbgLKP9oUIte6kW/2m9uO7Qct2AvXYZveIcZKuhg6ch1xIwvZMOtYAuMMaaozwxTWEbOMhbmGYJ2eHQgety8xmmGymkCdcP1cbJzuw+NEYTmFE24=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, "konrad.wilk@oracle.com"
	<konrad.wilk@oracle.com>, "doebel@amazon.de" <doebel@amazon.de>,
	"julien@xen.org" <julien@xen.org>
Subject: Re: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Thread-Topic: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Thread-Index: AQHYLkHgSrb/iAL0mEi291/GjB3zE6y1l+sAgAAD5ACAA1l+gA==
Date: Thu, 10 Mar 2022 18:01:48 +0000
Message-ID: <3e285745-9cc3-4f9a-ec27-fe917faa4547@citrix.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-5-roger.pau@citrix.com>
 <32b098c1-963f-2e03-84bb-c8db410c8554@citrix.com>
 <Yidtuq8YUq+SbY7C@Air-de-Roger>
In-Reply-To: <Yidtuq8YUq+SbY7C@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 339f64c0-2c27-40bb-9577-08da02c00bcb
x-ms-traffictypediagnostic: CY4PR03MB2712:EE_
x-microsoft-antispam-prvs: <CY4PR03MB27125FDEE8B29E6FB703430ABA0B9@CY4PR03MB2712.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5/LwH7IrEBtDjKK1Lg4130+1VNfVVXxqqJvQy4bKbupynDWxwF4fIw0hfx3xmPAbG94yqXnm5KPUEQdIt+eLwoPWbHXX37rqJIgnq9f9d0rziivrig3/mK2bm6g+QD29pdUpzsdnjQobUxkiIvuDiTKTdB8Dv30YvOQ27sc0t0UJ2ZlGRjc7RHlt/8wS9vSKcZgGuuYzKmNwF4oUgfot1B1kzLV9wqFrijjOnkAld2YgVnNlFIZJP6owsLBd7acYm6AknLuyYvwQUH25Czapw8Ir8VarrSlEIgHY57DT5G5Dwmdy3KCqygVm1WDgTX+0yKkkadCL5R/Lvqo41BE8dY7+kj6tORsnC4fdnJzpV2f5CuHe6TIbFK2TpfzJzwiV1AT2AVST0+Sps6ettLViwAUMHgyRcBlSle7f3+r7RnXH6pOjWuCcUOeRkFE/b/0fMMju4S2SPwu1WSCo2FofWc0qf/BRHMHxdr39J3GTUXd3i30IdofRPW0ENP3umHlHvwpkNc9BPcYB7xom2owLKtr80OqbNJMW7esbXImKWeidwWywol8uIn5rUn1qImzLysoFCESWIs+HQ1sB6k9t5OWNuGn+p8f/rrrOVqhxLMn6nMGDZPHJujr2G3uvJNA5sgbv+ly/uaCX18oJqQKtbhYVIaOjac73422LKNY+Y9BRAAMyyTyPZl5+i0Sw6owduceVTEonBFwxSwnilkPuvZ6OSzhxAfi+nAT1TJIFuNUvIAg0sGhdC6Spm0cAqFr24Kg/epxMR8aYl07a3JtvLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(8936002)(71200400001)(6512007)(2616005)(316002)(83380400001)(26005)(186003)(53546011)(36756003)(6636002)(37006003)(6506007)(38070700005)(54906003)(2906002)(6486002)(86362001)(31696002)(8676002)(6862004)(4326008)(5660300002)(508600001)(66476007)(76116006)(66556008)(82960400001)(122000001)(38100700002)(66946007)(66446008)(64756008)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1FSeEZ2MVJFVTBBS3IwTmc1bE1iNjBSTjZ6TjN2TUdtVkRhVytkWjU3NHRB?=
 =?utf-8?B?NDRPc0M4WmtwaDZ2UW9mK1BWQUpRdEhRb0tTbTBDZ3ZadDlZRTJZalpaelN2?=
 =?utf-8?B?Q0R6NjRON0VTMTVPbHl1VEFvMUJoSGtMOWwxWjZzRGppU01tTkVvVUpYZjdU?=
 =?utf-8?B?N2cwblZCZUhrR0VtemFvcEpPaGtTQklHUUFIdldFVHJ6R3paZkhPSzBpZkNr?=
 =?utf-8?B?NUFIdUNQOE40ZFgwclVzTEh1a1Yzb1E0Y0VLS3J1bW1pVnBXdWQ1RjhGcSs0?=
 =?utf-8?B?MW8wd2FrQUVwWHFKODVmU1FPQ2lWY2xBUlZOdHoza0RZb2h4WEhQS2dEc0Zq?=
 =?utf-8?B?TEhJcWdvWDN1OHhPclUwclhxaUZuclozV0ZYZ2ViUThUVnRBaEJhcEliYzln?=
 =?utf-8?B?dy9DWWtieEFxVXF5QjhHQUp1d2RYR21NTHpBeU8rcFM0amR4QlcwUit1azVY?=
 =?utf-8?B?Ym5zbDROWFJOTkF6WkdqOFVZQzhFMnk0YVlHemVvUUcvZ1hJMGk2eVptYXRQ?=
 =?utf-8?B?Rk9jMFU1Ti96dkxURzh3bjRNSEpMVDJqWFVhVEtPd2NyWmQ2ejFHZnh3ZCtY?=
 =?utf-8?B?TXkwQmEybmZieHk4aVdDYXNSWmFySXlJRm1MaUJhRnNiZzIvQnYrdkJqcUpo?=
 =?utf-8?B?QitQUEFTc0dTSCtMakE4bnIrTjc5NnBxa0ZEQnBaTVB2UjRha0t3eDRrTHZp?=
 =?utf-8?B?aTVBaUkzcitjY3FmQWZOK2J6c1A3NjBWNmFPcDYxZEJMUTRqaTI0QklVR3VU?=
 =?utf-8?B?eXZhOVdnNXZkcUhqRGMvRlNmcmlJWStZSlJ1UE0vakU0a1NONmxRZXVFYlBO?=
 =?utf-8?B?L1MrS0tDWTljRkErRUgyTEFSOGw3bFlRNXU4VlRETENDWHMyVkgvWGs5OGY0?=
 =?utf-8?B?dzhvNzlpTGViUitreEptRGlEZjJpMFd1TGMxSjJUTVo2Z0dmLzJuUzBVMEdh?=
 =?utf-8?B?YUszVS9SM0FnMGhCNHVuSjZ6czdyemo0d2cySzUxNStxVStMRm1DMHN4V2Ex?=
 =?utf-8?B?bS9pNGp6UDBtWnIrc2RaOXJXVFg2NWhBV2pkR3E3UXV4V2ZLS1ZkQ2l6VkZ2?=
 =?utf-8?B?N21XNjdQRE9wQ3lWRmh1V0tENHF5WURuc2RzSktIWFRyZ1VxdDRuMUNIYnpw?=
 =?utf-8?B?dktDL243VWJPeWhGKzQweGlUL0hkMTlUSmJjQTh3a1lSZkVvZmlvbDl4VEdN?=
 =?utf-8?B?aGlDT2c5Zlg5TTcwUHQ0anhiVzhpWnRmNFBrL3VtblpjTnErb1YyZTFOZ3Q4?=
 =?utf-8?B?R1NvdkJDKzc1RVluZ1FpakJaZDZZMngrdHFDekFXNnFaZTJJQVlxamZxQlNs?=
 =?utf-8?B?QnRqenJwZWJzdytncGZZQ0FTZm5pamgyVVRPc0FxejNzVEpkdS95UWVOQWNx?=
 =?utf-8?B?dVk3RDR3aTh2RE9vbzFVZUp2VGNNbUNhanpIaTlzYkFkV2xKR0s5cXdhb1hM?=
 =?utf-8?B?WHFhencyZ1gza0xkQUlyRlZFbm81T0VrRUNBRkFvbVRLaHMrb0xJUm9mMlM4?=
 =?utf-8?B?ZDBIQlpqU0dzVFVISU9ySHhDQ1BSOEYyS291L2RMTGZmNHlJd09Qd0EraXY1?=
 =?utf-8?B?b28zcFVlTFcvUjFwVW1pZFUxWWcvQWxVNXpWaUNacERJN2djczk5RkpNTjhL?=
 =?utf-8?B?MDFDMEtSWDJqdnhKZEkvTFlkdEtOeWJZNUtTUk1Ec29FREptSjA1U09rYURB?=
 =?utf-8?B?Rk5XWU1XaFZzZEVYa1EvRFp4enJ0bnAyMmQvZlQrRGVXbUZjVmN0RUxQVGQz?=
 =?utf-8?B?SFd6dEhvam1iQy9KTmdPN3gyMjNpcWYwdVRsUXV5NzF5MnBUdlBZVmVvdi9z?=
 =?utf-8?B?NWk1ei84NURaRU5RZ3dwaFdLL0NCNmhTYnFRRW1WK0RBRU1GcE16YTVHeVBU?=
 =?utf-8?B?NWJKTE5OUEhCSVRBTVhHWXdCdjJDRW9PS0dHSGlLV254T0diUmxCd1ZjeTlH?=
 =?utf-8?Q?frOSgI/jPMRMa7cWO84ik3TcSC/zqE7X?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <939BF42D7B03C1438E668EEE03B45C6D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339f64c0-2c27-40bb-9577-08da02c00bcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 18:01:48.0589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t++6ODWtNsGnHnoKwNcr+KfgjLMEkprQsoGnwdp8zyMH2gCwOhGwCj85fgYvifzI/8ZCSSDqGjhJV4PkH2ytWbDVWMUfjRAbZ/6NCTjuWJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2712
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAxNDo1MiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBPbiBUdWUsIE1h
ciAwOCwgMjAyMiBhdCAwMjozODo0N1BNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4g
T24gMDIvMDMvMjAyMiAxNDoyNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4+IGRpZmYgLS1n
aXQgYS9saXZlcGF0Y2gtYnVpbGQgYi9saXZlcGF0Y2gtYnVpbGQNCj4+PiBpbmRleCAzOGE5MmJl
Li42NTZjZGFjIDEwMDc1NQ0KPj4+IC0tLSBhL2xpdmVwYXRjaC1idWlsZA0KPj4+ICsrKyBiL2xp
dmVwYXRjaC1idWlsZA0KPj4+IEBAIC05OCwxNCArOTgsMjAgQEAgZnVuY3Rpb24gYnVpbGRfc3Bl
Y2lhbCgpDQo+Pj4gIA0KPj4+ICAgICAgIyBCdWlsZCB3aXRoIHNwZWNpYWwgR0NDIGZsYWdzDQo+
Pj4gICAgICBjZCAiJHtTUkNESVJ9L3hlbiIgfHwgZGllDQo+Pj4gLSAgICBzZWQgLWkgJ3MvQ0ZM
QUdTICs9IC1ub3N0ZGluYy9DRkxBR1MgKz0gLW5vc3RkaW5jIC1mZnVuY3Rpb24tc2VjdGlvbnMg
LWZkYXRhLXNlY3Rpb25zLycgUnVsZXMubWsNCj4+PiAtICAgIGNwIC1wIGFyY2gveDg2L01ha2Vm
aWxlIGFyY2gveDg2L01ha2VmaWxlLmJhaw0KPj4+IC0gICAgc2VkIC1pICdzLy0tc2VjdGlvbi1h
bGlnbm1lbnQ9MHgyMDAwMDAvLS1zZWN0aW9uLWFsaWdubWVudD0weDEwMDAvJyBhcmNoL3g4Ni9N
YWtlZmlsZQ0KPj4+IC0gICAgIyBSZXN0b3JlIHRpbWVzdGFtcHMgdG8gcHJldmVudCBzcHVyaW91
cyByZWJ1aWxkaW5nDQo+Pj4gLSAgICB0b3VjaCAtLXJlZmVyZW5jZT1hcmNoL3g4Ni9NYWtlZmls
ZS5iYWsgYXJjaC94ODYvTWFrZWZpbGUNCj4+PiAtICAgIG1ha2UgIi1qJENQVVMiICRYRU5fREVC
VUcgJj4gIiR7T1VUUFVUfS9idWlsZF8ke25hbWV9X2NvbXBpbGUubG9nIiB8fCBkaWUNCj4+PiAt
ICAgIHNlZCAtaSAncy9DRkxBR1MgKz0gLW5vc3RkaW5jIC1mZnVuY3Rpb24tc2VjdGlvbnMgLWZk
YXRhLXNlY3Rpb25zL0NGTEFHUyArPSAtbm9zdGRpbmMvJyBSdWxlcy5taw0KPj4+IC0gICAgbXYg
LWYgYXJjaC94ODYvTWFrZWZpbGUuYmFrIGFyY2gveDg2L01ha2VmaWxlDQo+Pj4gKyAgICBpZiBn
cmVwIC1xICdub3N0ZGluYycgUnVsZXMubWs7IHRoZW4NCj4+PiArICAgICAgICAgIyBTdXBwb3J0
IGZvciBvbGQgYnVpbGQgc3lzdGVtLCBhdHRlbXB0IHRvIHNldCAtZntmdW5jdGlvbixkYXRhfS1z
ZWN0aW9ucyBhbmQgcmVidWlsZA0KPj4+ICsgICAgICAgIHNlZCAtaSAncy9DRkxBR1MgKz0gLW5v
c3RkaW5jL0NGTEFHUyArPSAtbm9zdGRpbmMgLWZmdW5jdGlvbi1zZWN0aW9ucyAtZmRhdGEtc2Vj
dGlvbnMvJyBSdWxlcy5taw0KPj4+ICsgICAgICAgIGNwIC1wIGFyY2gveDg2L01ha2VmaWxlIGFy
Y2gveDg2L01ha2VmaWxlLmJhaw0KPj4+ICsgICAgICAgIHNlZCAtaSAncy8tLXNlY3Rpb24tYWxp
Z25tZW50PTB4MjAwMDAwLy0tc2VjdGlvbi1hbGlnbm1lbnQ9MHgxMDAwLycgYXJjaC94ODYvTWFr
ZWZpbGUNCj4+PiArICAgICAgICAjIFJlc3RvcmUgdGltZXN0YW1wcyB0byBwcmV2ZW50IHNwdXJp
b3VzIHJlYnVpbGRpbmcNCj4+PiArICAgICAgICB0b3VjaCAtLXJlZmVyZW5jZT1hcmNoL3g4Ni9N
YWtlZmlsZS5iYWsgYXJjaC94ODYvTWFrZWZpbGUNCj4+PiArICAgICAgICBtYWtlICItaiRDUFVT
IiAkWEVOX0RFQlVHICY+ICIke09VVFBVVH0vYnVpbGRfJHtuYW1lfV9jb21waWxlLmxvZyIgfHwg
ZGllDQo+Pj4gKyAgICAgICAgc2VkIC1pICdzL0NGTEFHUyArPSAtbm9zdGRpbmMgLWZmdW5jdGlv
bi1zZWN0aW9ucyAtZmRhdGEtc2VjdGlvbnMvQ0ZMQUdTICs9IC1ub3N0ZGluYy8nIFJ1bGVzLm1r
DQo+Pj4gKyAgICAgICAgbXYgLWYgYXJjaC94ODYvTWFrZWZpbGUuYmFrIGFyY2gveDg2L01ha2Vm
aWxlDQo+Pj4gKyAgICBlbHNlDQo+Pj4gKyAgICAgICAgIyAtZntmdW5jdGlvbixkYXRhfS1zZWN0
aW9ucyBzZXQgYnkgQ09ORklHX0xJVkVQQVRDSA0KPj4+ICsgICAgICAgIG1ha2UgIi1qJENQVVMi
ICRYRU5fREVCVUcgJj4gIiR7T1VUUFVUfS9idWlsZF8ke25hbWV9X2NvbXBpbGUubG9nIiB8fCBk
aWUNCj4+PiArICAgIGZpDQo+PiBUaGlzIHJlYWxseSBvdWdodCB0byBiZSB0aGUgb3RoZXIgd2F5
IGFyb3VuZCwgYnkgc3BvdHRpbmcgdGhlIHRoaW5nIHdlDQo+PiBrbm93IGlzIGdvb2QsIGFuZCB0
aGVuIGZhbGxpbmcgYmFjayB0byB0aGUgaGV1cmlzdGljcy7CoCBJbiBsaWdodCBvZiB0aGUNCj4+
IHVwZGF0ZXMgdG8gdGhlIFhlbiBzaWRlLCBzb21ldGhpbmcgbGlrZToNCj4gSSdtIG5vdCBzdXJl
IEkgYWdyZWUuIEkgZG8gcHJlZmVyIHRvIHNwb3QgdGhlICdiYWQnIG9uZSwgYW5kIGp1c3QNCj4g
ZmFsbGJhY2sgdG8gZXhwZWN0aW5nIFhlbiB0byBjb3JyZWN0bHkgc2V0IC1me2Z1bmN0aW9uLGRh
dGF9LXNlY3Rpb25zDQo+IG90aGVyd2lzZS4NCj4NCj4+IGlmIGdyZXAgLXEgQ0NfU1BMSVRfU0VD
VElPTlMgS2NvbmZpZzsgdGhlbg0KPiBCZWNhdXNlIHRoaXMgbG9naWMgdGllcyB1cyB0byBub3Qg
bW92aW5nIENDX1NQTElUX1NFQ1RJT05TIGZyb20gYmVpbmcNCj4gZGVmaW5lZCBpbiB4ZW4vS2Nv
bmZpZyAob3IgZXZlbiBjaGFuZ2luZyBpdCdzIG5hbWUpLCBhbmQgZ2FpbiB0aWVzIHRoZQ0KPiBs
aXZlcGF0Y2ggdG9vbHMgdG8gaW50ZXJuYWwgZGV0YWlscyBhYm91dCB0aGUgWGVuIGJ1aWxkIHN5
c3RlbS4NCg0KSXQgZG9lc24ndCBwYXJ0aWN1bGFybHkgbWF0dGVyIHdoaWNoIHdheSBhcm91bmQg
dGhlIGlmL2Vsc2UgaXMuwqAgSXQgZG9lcw0KbWF0dGVyIHRoYXQgd2UncmUgY2hvb3NpbmcgYmFz
ZWQgb24gc29tZXRoaW5nIHJlbGV2YW50Lg0KDQpub3N0ZGluYyBpbiBSdWxlcy5tayBoYXMgZXhh
Y3RseSB0aGUgc2FtZSBhbW91bnQgb2YgIm1hZ2ljIHN0cmluZyBpbg0KbWFnaWMgZmlsZSIgYXMg
Q0NfU1BMSVRfU0VDVElPTlMgaW4gS2NvbmZpZywgYnV0IGhhcyBhYnNvbHV0ZWx5IG5vdGhpbmcN
CnRvIGRvIHdpdGggdGhlIHByb3BlcnR5IHdlIGFjdHVhbGx5IGNhcmUgYWJvdXQuDQoNClJlYWxs
eSB3aGF0IHlvdSBhY3R1YWxseSB3YW50IGlzDQoNCmlmIGdyZXAgLXEgQ0NfU1BMSVRfU0VDVElP
TlMgS2NvbmZpZzsgdGhlbg0KwqDCoMKgICMgWGVuIGJlaGF2ZXMgc2Vuc2libHkNCmVsaWYgZ3Jl
cCAtcSAnbm9zdGRpbmMnIFJ1bGVzLm1rOyB0aGVuDQrCoMKgwqAgIyBMZWdhY3kgbWVzcyB3aXRo
IFJ1bGVzLm1rDQplbHNlDQrCoMKgwqAgZGllICJIZWxwIHdpdGggYnVpbGQgc3lzdGVtIGRpdmlu
YXRpb24iDQpmaQ0KDQpUaGUgImJlaGF2ZXMgc2Vuc2libHkiIGNhc2UgaXMgdW5saWtlbHkgdG8g
Y2hhbmdlIG5hbWUgYW5kIHVubGlrZWx5IHRvDQptb3ZlIGxvY2F0aW9ucywgYnV0IGVhY2ggYXJl
IGVhc3kgdG8gY29wZSB3aXRoIHZpYSBgZ3JlcCAtZSBGT08gLWUgQkFSDQpmaWxlMSBmaWxlMmAs
IGFuZCB0aGlzIGFwcHJvYWNoIGF2b2lkcyB0aGUgcHJvYmxlbSBvZiBibGluZGx5IChhbmQNCmZh
bHNlbHkpIGFzc3VtaW5nIHRoYXQgYW55dGhpbmcgd2hpY2ggaXMgNC4xNCBhbmQgbGF0ZXIgc3Bs
aXRzIHNlY3Rpb25zDQpjb3JyZWN0bHksIGFuZCB0aGF0IHRoaXMgd2lsbCByZW1haW4gdHJ1ZSBl
dmVuIHdoZW4gc29tZW9uZSBhZGRzICIjIHVzZQ0KdG8gaGF2ZSAtbm9zdGRpbmMgaGVyZSIgdG8g
UnVsZXMubWsuDQoNCn5BbmRyZXcNCg==

