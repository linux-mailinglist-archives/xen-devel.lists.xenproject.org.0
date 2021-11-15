Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233F450159
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 10:27:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225693.389778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYGs-00051S-9e; Mon, 15 Nov 2021 09:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225693.389778; Mon, 15 Nov 2021 09:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYGs-0004z9-6U; Mon, 15 Nov 2021 09:27:26 +0000
Received: by outflank-mailman (input) for mailman id 225693;
 Mon, 15 Nov 2021 09:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmYGq-0004z1-Dd
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 09:27:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bf1b98c-45f6-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 10:27:22 +0100 (CET)
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
X-Inumbo-ID: 3bf1b98c-45f6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636968442;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=d/TVxLxm2SvccpoosbeFIkT6kMsCGZZI+xX1tZZ5GqE=;
  b=W0amNG0Gd9nTNeRxZHW6iZITW1LeZVeZmbD7TUkUdM0+HPShckstYSvY
   RexGlLpF2GKr88j7oLaUH8luMjWK2hO/N1SX9B4NEyK+a2HOsrzMDaHvS
   tflyVmJ3G6o0KsfF69aUbAwh1UfJVnDg0ylHGzaH5rN+KEyE0oUmZO/Ap
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NpEGXB/rX/yWRBv+l7j7N/OgQ0xQ1hB1IDvuYTnPzvDfJsSVXwaaqkKwkDgEXEHSYgRWtCsUqb
 UZi0p2P0wxZ7e/pDhTo9B4tKDf4jqIg0UkHVvXBhcTA+uSQEiiyCOZa881kIdBNtIl3h4uoPhQ
 8O0FoiXuOYZqERepbu1fkSjx/NPKftwvBgOTKyWOYvxjPiQBdWLrkOZPlEMHfpFiv6f2KFCzto
 3jnBUWPbp+vnN2DkLgCiYuDgpajBu/bC9ybY+jQhFcbNv7kLDlefgKAJK6E1uG+0Q/wtSTxyxm
 LHvfLlGgLtQj9roPw3IGHung
X-SBRS: 5.1
X-MesageID: 57774110
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PcDk76CfGy4tpRVW//jkw5YqxClBgxIJ4kV8jS/XYbTApG8hhGMAm
 jBKCGiPOK2MYzehe48lb4XioxwGsZSBn4JmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540E87wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/zGyousJv2
 eh2sd+xWzUFDq/jyPUtTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvqVuoMBhW9YasZmAKqPP
 OQBWyJWazuaTAZiHg8oEak1pbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSob8hImkeTp
 krd4n/0RBodMbS32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPG6BjydsmCVgyUYGNtCIcEK6i7d25rLtlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL+dlr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2KBgpJDSsjPeZJgrBEDnCBsp59wH6xFAXpg
 ZT9s5H2ABoyJZ+MjjeRZ+4GAauk4f2IWBWF3wUxTsB9qWnxpSL/FWy13N2YDB0zWirjUWW2C
 HI/RCsLvMMDVJdURfIfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPQ2pBLrFrx1+eJ6mUgDKZb7GMmTI+KPiuHFOhZ4iN4tbTOzUwzOxP/e/ViOr
 Y8Ab5DiJtc2eLSWXxQ7OLU7dDgiBXM6GYr3u4pQcOuCKRBhA2YvF7naxrZJRmCvt/09ej7g8
 i7vV0lG5kD4gHGbewyGZmo6MOHkXIplrGJ9NispZA76138maIepzaEea5poIuV3qL09laZ5H
 6sfZsGNIvVTUTCbqT4TWobw8d55fxOxiAPQYyf8OGojf4RtThDi88P/ele97zEHCye67JNso
 7Cp2g7Bb4AEQgBuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 l/PUxkCpOTLr4sky/XzhPiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxHuo5za864Nez9bZWwh49QSfOZlWvTLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd1PP6e0fw0myXJ6aVnKUr30yZ74b6bXBgAJBKLkiFccON4PY5NL
 T3NYyLKB9hTUiYXD+s=
IronPort-HdrOrdr: A9a23:ITlECa3oI1OZp6lJLn+NPAqjBShyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhQdPT2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72xeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlBXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbhrmGuhHjPkV1RUsZ6RtixZJGbCfqFCgL3b79FupgE486NCr/Zv2kvp9/oGOu95Dq
 r/Q+NVfYp1P70rhJRGdZA8qPuMex/wqC33QRevyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="57774110"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZ4SmuAddvNms+TYQJu5zZUPcmAGhHv8f6zFEHOKbY7i9bBc97AtHbghQM15WlLocX/dGZjSZN6zrhxs5EviTbsbLBtW814OiBDlOqFjYVq677Ch3LPJ+TDWXhS+xh3twCsccJ4NqBH3Hy+4zy+RnvhC/EL+4uWftF4b1H4HkP6g86729NVuZfeO6Ae8tosA9IVE2YHX2ODNvmvpf0PDxdoJ8qPs6sIZ8XV4CZ6h7oKYKBx49xzB3Koe26y05sXL1hMTRYOGYzwvbYg/Adjr2RovHn6qUGLI6fQdfDpOOwJg8k+FH35qrXMsVK/0VObUwXGItIZFbR44dHyE1V/76A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmS1lMnLnUdt7WXPvc818TlVi0YYLZq2TWXqSjbGlSk=;
 b=cVSV0D/ENIo3QAPQ+P9Zoz1PzuUHlwagTPkEkRM5OBs2JgAzPDao4S1B4vl4y1pNMBH7G/B64kIzrmUnTlyxNJaCkhvC3CCvY0mzpaA31QKcyIscu5Ww29aUK2kaHqpoah5dMbJo0tI7FtP9jHOWOqDJDdCLsEVebp61WSxuF/dMvIsIxSPxYdHEBlh2VhKR0juSJXHcu2G1y8nzvi2hYyWG/cI+sA+BTXwd31P5w6QHwkLyw6LmYAP0tMTREdW4v292YqOawKxIn++Q+RL3R3YJC42awZgyBHWpsu+nKULw8Vvpq7kC+XYCOInXefwfOF0AeqcSVpsucTRHX8gabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmS1lMnLnUdt7WXPvc818TlVi0YYLZq2TWXqSjbGlSk=;
 b=a21U0ZnH0KbSP4Y0QwfjSvkaOTuSB3UhEEIwQuiQVaXc98eWdGibN/Dfw+TlChMV9kYKI/FjmYDXRW0LdXO+3UYs/lj0gYIteU5zG8iqdq5JIZEqUYC50lzC1SmncQg4DkldmT/ZqLiHK6YWxEUKPbWT+O5xyzP1Uuw4IgA0/As=
Date: Mon, 15 Nov 2021 10:27:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] x86/cpufreq: Clean up powernow registration
Message-ID: <YZIn78EzYjI7YXC4@Air-de-Roger>
References: <20211112182818.30223-1-andrew.cooper3@citrix.com>
 <20211112182818.30223-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211112182818.30223-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::27)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1125ec18-e58a-4a19-1e8e-08d9a81a1d89
X-MS-TrafficTypeDiagnostic: DM5PR03MB2778:
X-Microsoft-Antispam-PRVS: <DM5PR03MB27789CF4D85DF3A23A30AD6D8F989@DM5PR03MB2778.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gZtiZtD5VIaBdq4q+8q39vomXORRrAV3j9uzpQK0HC4hIdv0bAGSNfueSMHkegSuPfdaHyAl+meJ9BJPHvh4VV5vWfCk9Pb0Br+/UPkz5BlgB3SSp/pckLyaAyzWZUYy8Gt3tNqm7K8z/49JvMreN7KJW9TALeg97muga3wXCeqri6xAa5w/FhpeKvIrRMzlThuj8CUgGfLlOCGUejuA2JtA7VtBYn0sbzrC105Tvi/NjUj0TqfpiR6+J7WevMfjMubtN+mk35G6iBk6BVlm4Y69R5LqfZBnPXoQgy0Qt5KGP/khz9Ezh/+7YZBWFZgd12WB5/rNd7v32CBS9Oog1VTa23P80YH3AghUhSmHJKnlQ8lfpSzYKtFGBGRctekay23XxlSfpBWHAExlA4lX3f5ACut5m8LbggsyubTXRqnbDCxa3FE4QL31CGx09cSV2qyIC/Vn4q9MMof5PErQa/eXs3tbDKUy9isVGA38Xelgi20Qs0RgXmBH8gaZ8vTLn+YDzwtMIX1ZKNyfaG9rT5Oc65puf9c/g9SdqYi1eJ2LI3+gxmeLHFOsO9rpGsKeH6zOnWv6Rk6XggyxkOoGAiEE2Wp/c7ENiE+R95NEkdC9UnDdCApmxl6Tz2+cyxT1JkzpfiLVUOGnTrgsggp+Ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(508600001)(316002)(6486002)(956004)(54906003)(86362001)(2906002)(66556008)(4326008)(6496006)(5660300002)(6636002)(6862004)(83380400001)(66476007)(26005)(9686003)(82960400001)(66946007)(8676002)(6666004)(85182001)(33716001)(8936002)(38100700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXdISEdwTkZ3eDRRMGtLTFJuSTFmY0pZQ05kWXpzRVBJblZWejk0elZqQ0Yx?=
 =?utf-8?B?OGtpQmRxSmgvQWZXTy94UE9HTFU5SFFFdVIvVEc2cHRvRUxaTXozeTlaYW5P?=
 =?utf-8?B?M3FjVjR1eXBNcEJOV2pDNmhMcUIvNWZQQWFHc3pYZjZDaVRnVnNCcHlaY05x?=
 =?utf-8?B?aE5XYWF1WS9KWFNuUzR5QnZ4Sys4Zk1xQ0c4eEFyMFpqSEVCelc5S2Y0cGRC?=
 =?utf-8?B?VGtJRnRoN3ZDeUU0NjNYOFQxQVM3aENCUk5OV3V3Zi93TC9LZ29HdzdhMGVO?=
 =?utf-8?B?UitROXl2Qkw1VVFkTFEveWFTYk1tYWgza05mQkNUT3FrOGUwbzdBVFhNK3hV?=
 =?utf-8?B?ZSs3Qk9vRjhXYkFLNCtvWEZaQ1BzSGU3eENidFRkN05jL2hsZlJvUG1qWjR4?=
 =?utf-8?B?Q2RoZjduaTBhdUdzbW9kbmNDUm8vVGRVMUV2WjM1dDlnSVVYMVhKdXJPcDBY?=
 =?utf-8?B?Qm9Id3U4MEhwVUR6R3Y1S2YwN1p2V20xUlFWbnNjbXJoTkU0YnVRY2U5d0Y1?=
 =?utf-8?B?ZFlydDBRd3BxMysrRHVzSDVBTS9Pb2VNdWZPUWVNSTcxSEtuSWE5bkV0YlZL?=
 =?utf-8?B?Y0xmMmlkRUI2NjFkNjlvbXNOWHBZaFNuQUpQcFVhWnlCakNLRzRLWDhpeWho?=
 =?utf-8?B?R2lueFl5RDdEa1hRT1lXcEVTNTNIKzVIOXp6SzE1a1E5aWRuYzdrbnlMZ0dL?=
 =?utf-8?B?TG8yZWRwd1EzYlRHWHJsLy80WFAwSGo5dFlPRnJ6c2pKeXRSQUNIV1U1Unlz?=
 =?utf-8?B?THFYdk15NHBGdXJRSUREb3I2a0RTZnlQd3NXZ1VTSE9vK01zenRHOWxOR01B?=
 =?utf-8?B?YnkyOTB1V0pCamRLR3l4ejBNQlllUC9PL3ZJWDdrRzVER0hoSDhlVGtGV3M4?=
 =?utf-8?B?dkNSWVZFVTZ5OFhmRDlVUmI2bnZnRGs5ZWdWYkVoMWdNc04yTkZqOVpMVUpS?=
 =?utf-8?B?aTdnNTNFSG1qWW1FampOaTNVWE05cjRlZ3dGU1F6Y0Q4Rm92MFBQcTlyZDAw?=
 =?utf-8?B?b3BCRnlUUWc1YkRuMXNzWG92VWF1cm0wcHk0S0hWN2xiTWFrbWxaYktPNm5l?=
 =?utf-8?B?S0QwNWtWT3N0dndwc1J6c2VwQzFxVVVTZ0xycEdweWhrekJCWE1qRDNzMEZu?=
 =?utf-8?B?WlprWWs5YW5uV2hsWXBzYTJsOU55bThISjliQVpFZEJ1WFE4K1VOUGFPV3dm?=
 =?utf-8?B?cldvS2pENnJUZy9mL2lPL3BTMnVwYVB2TUQ5ekxWaTc1bzFFY0ZsYVVNT2cr?=
 =?utf-8?B?WTMxaXRRTE9xc084RGpYaHdkSFhwU1JUOTF1ZTRWY00vZXBCUTVFSkF4aEZk?=
 =?utf-8?B?WmRwV29mcjV0ZCtadEtRQnpkTlhtcTdEM3FnejJFcnVQZzAyUXJCOEpIcmxY?=
 =?utf-8?B?aEIwbUhSZ01tN3BmMkp1S0E5dGxUTlJOaE9yVndOWWMrUTRab0grb1B3eU1x?=
 =?utf-8?B?TTlXTXc3V3VPZFN5NDBGWGJSSytyM1dvaElsSEV6VzVKZG4zT2d0RUdzYXBF?=
 =?utf-8?B?Y3pTUkVHdGRaVlRJYnRzMGxRWmNBSWcxa3dTTU9QZHgwUzMrRlE2VnF5Yy8r?=
 =?utf-8?B?TlliN0U5MHVhNXcyRnpBSkQrUE9UY0dZZXYvTzN3RzB6TEVWRWxlazdIMmVn?=
 =?utf-8?B?RjdTVXVybVhkT2xVK1daRHhLU3U5UG0weElBUEhJcTdHMmRJUVdYU2NaczZz?=
 =?utf-8?B?WitLZi9MT3FaUlg0dWUxeDN1eDB5bFBTbW8wWWRLRmdxM3BxMVBNWlM0UUg5?=
 =?utf-8?B?ckhuMDZhUGYrbzc5ZVlYUW4vQXFYaEp2eUgwT1d4a1k4V3VwdlVkL2gweFAw?=
 =?utf-8?B?VXhpTmhVdFV5c21nY2RoRGFqQmtuM3VpSjduUGV0QWVMOFdMQzFZYnR6Y3ZD?=
 =?utf-8?B?cC9EajZkbm0vR096QnBxWnAvdXJiS0Y2RWkzYmlJVC9kSHEyRFJrU3NQSlY5?=
 =?utf-8?B?RllJdGkxNStmemxUT20wWG9ZUm9CNFdlb203UEtuWTAvaGdiZGlvV0UrNkxp?=
 =?utf-8?B?QTNFQ1RnS0JreDFEQUlJM29ZNXNPOXUrU1RYcHl5Y3pZNEJtTGY4Vm5mUzl6?=
 =?utf-8?B?Qm44NlJPeGoxSFprb0tVLys1K05penlwUjk0bGFERGU4YnArU2NndmNxNk5X?=
 =?utf-8?B?WjZlY0kwMmpKSzI0WkMyZHowaVhFcDZ6QjVWNGtpRHlkZStaOGRYUUVPM2Fj?=
 =?utf-8?Q?1hI7caHIkGrpWbRd13djTSE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1125ec18-e58a-4a19-1e8e-08d9a81a1d89
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 09:27:16.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzwvsdOW+lCL1LV6IGo7a03+IXdp/vAfXlE3qr5E3p3zzNHevJQDMnphOMe+XvUba6B/rVXDjfxOdItm0mNtuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2778
X-OriginatorOrg: citrix.com

On Fri, Nov 12, 2021 at 06:28:16PM +0000, Andrew Cooper wrote:
> powernow_register_driver() is currently written with a K&R type definition;
> I'm surprised that compilers don't object to a mismatch with its declaration,
> which is written in an ANSI-C compatible way.
> 
> Furthermore, its sole caller is cpufreq_driver_init() which is a pre-smp
> initcall.  There are no other online CPUs, and even if there were, checking
> the BSP's CPUID data $N times is pointless.  Simplify registration to only
> look at the BSP.

I guess an extra safety would be to add some check for the cpuid bit
in the AP boot path if the cpufreq driver is enabled.

> 
> While at it, drop obviously unused includes.  Also rewrite the expression in
> cpufreq_driver_init() for clarity.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/acpi/cpufreq/cpufreq.c  | 20 +++++++++++++-------
>  xen/arch/x86/acpi/cpufreq/powernow.c | 28 ++++++----------------------
>  2 files changed, 19 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> index f1f3c6923fb3..2251c87f9e42 100644
> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -640,13 +640,19 @@ static int __init cpufreq_driver_init(void)
>  {
>      int ret = 0;
>  
> -    if ((cpufreq_controller == FREQCTL_xen) &&
> -        (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL))
> -        ret = cpufreq_register_driver(&acpi_cpufreq_driver);
> -    else if ((cpufreq_controller == FREQCTL_xen) &&
> -        (boot_cpu_data.x86_vendor &
> -         (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
> -        ret = powernow_register_driver();
> +    if ( cpufreq_controller == FREQCTL_xen )
> +    {
> +        switch ( boot_cpu_data.x86_vendor )
> +        {
> +        case X86_VENDOR_INTEL:
> +            ret = cpufreq_register_driver(&acpi_cpufreq_driver);
> +            break;
> +
> +        case X86_VENDOR_AMD | X86_VENDOR_HYGON:

This should be two separate case statements.

With this fixed:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

One rant below about getting rid of powernow_register_driver.

> +            ret = powernow_register_driver();
> +            break;
> +        }
> +    }
>  
>      return ret;
>  }
> diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
> index f620bebc7e91..80095dfd14b4 100644
> --- a/xen/arch/x86/acpi/cpufreq/powernow.c
> +++ b/xen/arch/x86/acpi/cpufreq/powernow.c
> @@ -24,13 +24,9 @@
>  #include <xen/types.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
> -#include <xen/delay.h>
>  #include <xen/cpumask.h>
> -#include <xen/timer.h>
>  #include <xen/xmalloc.h>
> -#include <asm/bug.h>
>  #include <asm/msr.h>
> -#include <asm/io.h>
>  #include <asm/processor.h>
>  #include <asm/cpufeature.h>
>  #include <acpi/acpi.h>
> @@ -353,25 +349,13 @@ static const struct cpufreq_driver __initconstrel powernow_cpufreq_driver = {
>      .update = powernow_cpufreq_update
>  };
>  
> -unsigned int __init powernow_register_driver()
> +unsigned int __init powernow_register_driver(void)
>  {
> -    unsigned int i, ret = 0;
> +    if ( !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +        return -ENODEV;
>  
> -    for_each_online_cpu(i) {
> -        struct cpuinfo_x86 *c = &cpu_data[i];
> -        if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
> -            ret = -ENODEV;
> -        else
> -        {
> -            u32 eax, ebx, ecx, edx;
> -            cpuid(CPUID_FREQ_VOLT_CAPABILITIES, &eax, &ebx, &ecx, &edx);
> -            if ((edx & USE_HW_PSTATE) != USE_HW_PSTATE)
> -                ret = -ENODEV;
> -        }
> -        if (ret)
> -            return ret;
> -    }
> +    if ( !(cpuid_edx(CPUID_FREQ_VOLT_CAPABILITIES) & USE_HW_PSTATE) )
> +        return -ENODEV;

I wonder if we could move this check into cpufreq_driver_init and get
rid of powernow_register_driver.

Thanks, Roger.

