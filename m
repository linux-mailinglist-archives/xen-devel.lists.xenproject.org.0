Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B34C62E67C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 22:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445372.700508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovm9q-0005sD-3E; Thu, 17 Nov 2022 21:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445372.700508; Thu, 17 Nov 2022 21:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovm9q-0005pQ-0Q; Thu, 17 Nov 2022 21:10:50 +0000
Received: by outflank-mailman (input) for mailman id 445372;
 Thu, 17 Nov 2022 21:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BOBv=3R=citrix.com=prvs=31353e2df=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovm9o-0005pK-Hp
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 21:10:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c3eac72-66bc-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 22:10:45 +0100 (CET)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Nov 2022 16:10:42 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6156.namprd03.prod.outlook.com (2603:10b6:408:101::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 21:10:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%5]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 21:10:39 +0000
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
X-Inumbo-ID: 4c3eac72-66bc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668719446;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mMgjMMPXSq4VaDnBKjB8rA5B1BQ/8FfFZmXBNw1LA4I=;
  b=MDpzx05WrNJeK0HLL8e07J0DzTYErwwzQQpjyPrNkfSQekiJtF4NBEcH
   6BvLCFdxU5so8yFBhp/ipBFNpRjDUG8Bhg9hnghrIx6f4gTWtJUk2k5xB
   4dsA0WhqBVUeUYmuu+kIK8KQ0P/+o+loL4PO30sQfSIwWuuasy7yGyIWB
   M=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 85089702
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZLGAfKpfM3A0i6okvXxzdwafllJeBmImZBIvgKrLsJaIsI4StFCzt
 garIBnSbvvYYmD9eIt0bYi/oUNX68WBydQ3QQM/+CE2E3hA9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHziZNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGEwZSyTisaH/IiYbfU3ncQcKeLIH5xK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWJEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXoq6Y60QLLnAT/DjUuSEaLp8eBtXeEUvhZd
 R0++3MfsqotoRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC9
 HWEgtfoDjxHq6CORDSW8bL8hSy2ETgYKykFfyBsZSsI5cPy5r46iB3nR8xmVqWyi7XI9SrYx
 jmLqG01gOwVhMtSjqGjpwmY33Sru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalG43hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:VQaoK64CUfQhH1NSQgPXweCCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FXQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMk5
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvvn+9Ua1wWR4S2rpXV9
 WGP/usosq+tmnqNkwxi1MfhOBEmE5DRituDHJy4fB9mAIm4UyRh3FouPD32E1wtK7VAqM0md
 gteM5T5c5zZ95TYqRnCOgbR8yrTmTLXBLXKWqXZU/qDacdJhv22tfKCZgOlZaXkaYzve0PsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4WTj20MlR65Vwp7W5HdPQQGa+YUFrl9Hlr+QUA8XdVf
 r2MJVKA+X7JW+rHYpSxQXxV5RbNHFbWswIvdQwXU6Iv6vwW8XXn/2edOyWKKvmED4iVG+6Cn
 wfXCLrLMEF9UyvUm+QummkZ5osQD2LwXtdKtmowwFI8vl9CmRliHlktX2poseWNDZFrqs6OE
 NjPbKPqNLImVWL
X-IronPort-AV: E=Sophos;i="5.96,172,1665460800"; 
   d="scan'208";a="85089702"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYUaEoTHZMwJETwnMAFIsildNTOmNmBeTyvbahIx9fmXwCgFh9Yt3+GgeZCfpFdC0BiJV9BSewqPY6li7vhEpxQojhpjocy6cSOfKnB9d+IxdAiiT3PgfbkUfLzSxsWd8hxEugOjWo5Dzn221Wo6T8ClMKZ5S1kxheSAJoW6Q+T2+YTMZAorsrNYPOnlWbkNUt09Rl7dJOEv0im66udwKigWQbFtrSSwcEYq2KinFjxIlwXacHZ7Uduhhux1tN/3KGZ0YeOvCLbbWkL4nVb5VeIFoCyeBIytUglK4BthRca3BWYOPWDBrKERvngc6AdodW8CQKhReVEJqPcOZd9xXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMgjMMPXSq4VaDnBKjB8rA5B1BQ/8FfFZmXBNw1LA4I=;
 b=m155e77oY3f3pDlflOCBn7BCWF4J0CNQxeeKgEXV38DZ1o72RAS74lq+/UcdWiIVb31U3f7z0d8DSlRolf2qSeRwa8m2qNRoCo9VY4RSkXxT6mA+ZmrMWgRaJAkXE3uZSV7e1N4zmb8Y0HWbYttmN+DYlYMtWZryT85pveUGdAjAGyQZtyvUTS0c7K65sdu6Jfd0vItt+wTl7H0sBw2mpGplPNun4c8UpClDAGFuoFzohpHAVf+qI294UbSujGj4eqzBuhV48r37IvPdd8YUkYTGCIkAgO7UoH5yHQY9cQ2DslqprP+1z4gMfDbpm6NTv4uh36RpUf2tqM1tTZ3/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMgjMMPXSq4VaDnBKjB8rA5B1BQ/8FfFZmXBNw1LA4I=;
 b=aUy0H4JRHAUvrf9Q7sTs0YTD07nDZ6zVS2lpamn3hoIPb8dGwPbsRnGKH18TeE6b1RV/YE79LbTTbwBJTq4EP6Xx9Jv9mF6KlmEFlfOt83CA1zQMR5pypIte/uXGNv+tYa6TYdaehaNqasoLu4IXRUCWpTFBVw5YxWMWXgMUf10=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17] x86/hvm: Revert per-domain APIC acceleration
 support
Thread-Topic: [PATCH for-4.17] x86/hvm: Revert per-domain APIC acceleration
 support
Thread-Index: AQHY+Io3ygoaE+gKUU+QEYfs8WRTZ65AKPMAgAN4DoA=
Date: Thu, 17 Nov 2022 21:10:39 +0000
Message-ID: <f8b8f8ca-c80d-df59-6940-ad565867fde4@citrix.com>
References: <20221115003539.19502-1-andrew.cooper3@citrix.com>
 <Y3O6WhMtKsFdJAbg@Air-de-Roger>
In-Reply-To: <Y3O6WhMtKsFdJAbg@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN9PR03MB6156:EE_
x-ms-office365-filtering-correlation-id: 44eee01b-f5d0-4268-4514-08dac8e02df6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 p0ocC/XCO/cj1G9MCB0nVKgOk1vmuewzXCO3wdKXF9lRl4HYD+jrHqHSxV2nqmwgZwJc/r5aqfZTKnBlnXRYC1Jv29WNdiib3KQogEr68GfGSfByxjdYQ+TynMQIvfBdFG2HRqF5/db7drfSwLrgtLw5wFiT8ic53DdkwXF2sw7+JBwryFGhLG2t0WZqGiEkwFZ6z6ei66/01QH8o6aJor+EC9S56dwGE4QU6sCiW1sE6xw6dJJJiFm3d4QIjRoavvPBUIgmAB3J8/LaJNoD7ZiMi5f6GCJ6IXzXdGkpT5rh/fTbICbZ2E2Zz1SuyUVj6CzyfjxQKY6toJKnBOOd9NYoSRoC+te4DSy5aOivaAeqCvQb77gGheMO3pPhnuIiygtSvIrSMk44QZNTNqRXW4Ns1x49E7hmfaIOzZsJ3rzL+Fu8HvFJ8H4TQlrN3brGLSX3FpfYnzYRyE9UVh3/be9KRhtn0chVoTi1NpxTXzAZvksAgQtwsAX7j4BSuTt1xhuMSDugxndLQvzzpdcq9Th9CV82IMedja/OOVtI4pGv9Hvtmlz0QKcKzApWMRUumPe6e8qAFyLS9BLpxhglL0L2yQaHZ6p2i4wD83OAT6THzgRIvAApEtHYNajkhA50HzuquthmPPqDJEJgWb7aPZo5SIGG2gnOacEX9m949PR8aMQaeaeQzGp3RuMcAUV1y8J267zMQlB1nv1hJpE4HH7WCi4g78D1KpY3yDgrtHFuuYcnutuB/VF7epsGcNWT22KQfW5SCyhS98l20B9Hwg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(31686004)(71200400001)(66476007)(478600001)(6486002)(83380400001)(38070700005)(86362001)(31696002)(6862004)(8936002)(5660300002)(36756003)(2906002)(8676002)(64756008)(76116006)(6506007)(4326008)(66556008)(66946007)(41300700001)(91956017)(66446008)(53546011)(122000001)(82960400001)(38100700002)(6512007)(54906003)(26005)(6636002)(186003)(316002)(37006003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZnVpRWc4Wk94bERVdGR0aC9QZU9POUF1Vng4bWVJYVN0NW1CMFFYWFZINzJp?=
 =?utf-8?B?ZlZWNGhZMzdwczBLWGF3SUUvNkxCbGFidmljQ29kd0FZRlBrL2ZRblFRSEVl?=
 =?utf-8?B?eTlnd0lUbytjWnQrZlpyRjVyMHhJWEtBMnIxR0RWV0dpMlN5ZnZPSHpRQXhm?=
 =?utf-8?B?UnBkTWRzSExNeDNVZ0pNakZiUXQvbUhia0VXZlJsT0NaK2FzT0V6R2ZFWUNZ?=
 =?utf-8?B?U1BSSkswNytPd1hLd1p3VTZuRkVLejRwUjBuM2FHRmJBaDVUcnBLd3NCK1NU?=
 =?utf-8?B?OFZiRm9FeEtocWUvOTg3bUlvcGs1Tk5SWE9oWS9GeVU2ZFNid1BUL2R6bmho?=
 =?utf-8?B?N1B4THVXZnNDMVNncDBvb2hqTXp1TXNMWVYyMjNVNG1lUFZEeDJyUmhWNHdS?=
 =?utf-8?B?cUJSTEUzUmE5ZDd2T3lYN29lejU1VGRUN0c4RlJFRUd1UFBYKzI3TUVXOHA5?=
 =?utf-8?B?ZU5RYURTNXdneG50bXlMT05qVE05Z2ZYQlI5WFdyd1UxQndxQUFXQTZqUjE2?=
 =?utf-8?B?bnRoa1BTc0dlQXd3VFpVc082aVZlQkQ5ZXl6eklCKzU2UTNEV1NPTGtTOFlE?=
 =?utf-8?B?WGNVM1FNMW5KdDRxSlQyNkgzSXpGRUhOSHYyQmw3UTNBbUNaWkgwYUVzRUo5?=
 =?utf-8?B?TTNKNDRKbkpxbHR1MVRsZlFCNjZQWVpPK1JRSjJWbHNFVDFnUGFNWEtVblVO?=
 =?utf-8?B?eEhQNEFHT2JCQmdEWDc1QjlVWkliRWd6dVB1YlpRNXNmREdvaEdmOWdjTFlO?=
 =?utf-8?B?NUgydTlPamRoa2I2MkNwd2UzMHVwUDdnR2NGb25NMzNUYVludGF2VzdMem8r?=
 =?utf-8?B?Vkw4WHpSeWZPMGtsQ0l1QXJ1ejZjZFN0ZmhKS3VXMlM2QVhpRUZHdEsxTm1N?=
 =?utf-8?B?TnlGZEIwVUZXSXRoQXNiRVdpejd0c1gyS3dYSVdsVnpWUGJ5OVd3TVRhSTE5?=
 =?utf-8?B?TkdVUGNGdlRTTDVNZ0NYeDVRRWtocW9nVUJmcyt2RE1SMXVxdnRXaDArOGxa?=
 =?utf-8?B?bi9MZUxjaEJBMHZYcmYyOXZoUDVxOE9wb2liUm1pa2N1Z09zTnoySldDYnM0?=
 =?utf-8?B?QWs1MTgvVmxaanpMZXBWcXRvQWF3aXdVZTdQaGZYS0p3VDdJUnIvRURMTDdE?=
 =?utf-8?B?Vi9weStsbU9NWThpN1g5a1gzVUZJYjJuWlF2Wm90eGs2eDBMelc3SUF0NnRC?=
 =?utf-8?B?aWhXNlhpRFYzaGNxRldGaVZ1S3dYZk1uZURKaHptcXJ5UkJZNnoxZllwdnhx?=
 =?utf-8?B?dk8zaXRMc1o4R1poZ3U1ZEhiU0kzbG14WFhvT0Z0eXF2VnQ3Q0FOV1FtelBI?=
 =?utf-8?B?Ty9qY3BkM1UrMExncUE0NUVSNDNydnphL3RwNHV0Q1o1aUFybUtoUTdvYWxU?=
 =?utf-8?B?MzRIQ2ZFNkZvYlNpQW42UG4vb0hLa3VHUGY5WTFkdlhCN29qTTZBTHQwUlpV?=
 =?utf-8?B?cG1vektCdXFNOHB5VG9EMUM3VTJQRnQzSlE3cXFpNExmcnRHZFFWMzcrYldl?=
 =?utf-8?B?ODdBcktKb3U2bGxvSjhqTXFyT2swS2lzTjFsek9NSlFKN2J2Wngvd2h0YlRP?=
 =?utf-8?B?TktsQTBtbnhLVVU4T25SdGZDRVhmU1MzQU5abDNieFBiWGQ1cC9OTTVTRFFM?=
 =?utf-8?B?WDExL2tmcHUwb0p2YTJUZzB0Y2hhaG5qUk5yV2xqQ0dxR3FYcTdwcGNRS2Zn?=
 =?utf-8?B?UENrZUkrNVFGZGQrZWhLNjRiZmpnQXpPRTRLVHlzci9aMW9BY1Y3S0VvTnlE?=
 =?utf-8?B?WkVOSlhTTUFucm9DYW9XQXY1Qi9HS2xXNmlKU1ZqMWpGZEZjNFNZQ0ZPNElN?=
 =?utf-8?B?UW9lbGJqVWYvOXNhaFI4MEhJWGtIazgzQStKTUY0U0lIaXlMbUJ2SVZKMWE4?=
 =?utf-8?B?eDVjRWYxcGQxYnh6c2ZjTHZReThOZEhIY3pGQkZTcWdPa0o0MG9Jak5VT0lU?=
 =?utf-8?B?MGh1QkVYak1Md3BzNFZWZXZMWG55WXZuSklBRUlFdDRBT3RXVGp4ZThvOVNj?=
 =?utf-8?B?OThDQ21VL3lPM2dMMUFqTEFFM2tEV05BYTFlU3llZlMzTjhIT0hsbTQvbFMy?=
 =?utf-8?B?b2NPT3UvUEJYckVnajM5RVVRNThNcDJFU1JNLzZxR2hLMFY4NnEwM3JTQkV6?=
 =?utf-8?Q?pAH7UxWOeh8eQrW+Il0frZHKH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89B03C350742B94EA2F83AE30B910398@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZtDGqvqEC5eZY2S6Y0D3cwcp4K2fvlkvlqZ7ijwNxkRtdmsSKo21Bq44GoPDN30agELuH8ncfKjOZQ3JvHv2BwE6vE5R/A1e7koj7jXOotR8LGdmbiQ7YQMFkMDQNex9OnRZ5U7S5gtaXdirrZm74IhMMgWB1hIoYMQ3edLxnCiYmVLuVj9gpu3OZaKfXQyHPkZqYXYt/Dc3F3T0ZxNRhPXrNwBAdbKQadjWSu+5e3gaGFRRcBEwknM5L1ehe1LwXyPDd1+4roDccYvtsgTcLSwnyj3vc96QHVIhH95D6KGJs1VjR91jFABBr8PAHm6yXQkh+Ds3a4I+yugpuROsVDqkk/8c+Qay+OSgfq2Y40W781js3fiL4pmE5j/zUwInWeHh/d5S5MEmlx63mDqOCurvtRrb+HaZ8vaS7BkiqaYzR91PCFAKmyCqIbZ267neR64Uyo+E7+nA/wCKj8Wy0reYgAu7HSXbjzw6GseQHH4wB8Iwnqj8R/w1dxrlBEB5slPn0PQ69zYTRYrV0fdlKn3uB86T6Yz0xpW+6GvQwThy14MwUMQEKtqrUaie+OO6AImc/kVUfv34rCS4sPbv1Sll+8ccI2JuQ21ViBSIrITUEoUhzqxFzfeqlnh4GBA0EbbotGup9hfIXhJ8J7MGo+oCThRLV09MjTfFdYJ3Bi6LBS23WYp6sIB75dlP9dBxB/9/jJYGZ+zkknSHfPqERpyxREltFJHpq411ZgfPFZWjX0LeKNw+nnLqGsilrFvEvyUWPruTQ9O0SD/aKJH+C2rJJCqLymmgntTrA+9KqCAApsxKt48/4VLGJYKxXNQUZQeNCIb9/HXVEIfGDhnbOE76TUh7oyfLBjILz80SBaI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44eee01b-f5d0-4268-4514-08dac8e02df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 21:10:39.5065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b2KpPmi/46UYW5/iaCTcBwTdNof1KKAzqxnQI5WfcyJxAzV3GyRoNaeHbqMN59JCkELQWjrVu4FYFklr+oGBtGWbcg/8W1azTiWswdHmJo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6156

T24gMTUvMTEvMjAyMiAxNjoxMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBPbiBUdWUsIE5v
diAxNSwgMjAyMiBhdCAxMjozNTozOUFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4g
SSB3YXMgcmVhbGx5IGhvcGluZyB0byBhdm9pZCB0aGlzLCBidXQgaXRzIG5vdyB0b28gbGF0ZSBp
biB0aGUgNC4xNyBmcmVlemUgYW5kDQo+PiB3ZSBzdGlsbCBkb24ndCBoYXZlIHdvcmtpbmcgZml4
ZXMuDQo+IFRoZSBmaXggSSBwcm9wb3NlZCBzdGlsbCBoYXMgc29tZSBjb21tZW50cyB0aGF0IGhh
dmUgYmVlbiB1bmFuc3dlcmVkLA0KPiBidXQgYXQgYW55IHJhdGUgdGhpdCBpcyBub3cgZmFyIHRv
byBsYXRlIHRvIHRyeSB0byBnZXQgdGhpcyBmaXhlZC4NCj4NCj4gRldJVyB0aGF0IHNhbWUgZml4
IHdhcyBhbHNvIHBvc3RlZCB0byB0aGUgc2VjdXJpdHkgbGlzdCB3YXkgYmVmb3JlDQo+IGhpdHRp
bmcgeGVuLWRldmVsLg0KPg0KPj4gVGhlIGluLVhlbiBjYWxjdWxhdGlvbnMgZm9yIGFzc2lzdGFu
Y2UgY2FwYWJpbGl0aWVzIGFyZSBidWdneS4gIEZvciB0aGUNCj4+IGF2b2lkYW5jZSBvZiBkb3Vi
dCwgdGhlIG9yaWdpbmFsIGludGVudGlvbiB3YXMgdG8gYmUgYWJsZSB0byBjb250cm9sIGV2ZXJ5
DQo+PiBhc3BlY3Qgb2YgYSBBUElDIGFjY2VsZXJhdGlvbiBzbyB3ZSBjb3VsZCBjb21wcmVoZW5z
aXZlbHkgdGVzdCBYZW4ncyBzdXBwb3J0LA0KPj4gYXMgaXQgaGFzIHByb3ZlZCB0byBiZSBidWdn
eSB0aW1lIGFuZCB0aW1lIGFnYWluLg0KPj4NCj4+IEV2ZW4gYWZ0ZXIgYSBwcm90cmFjdGVkIGRp
c2N1c3Npb24gb24gd2hhdCB0aGUgbmV3IEFQSSBvdWdodCB0byBtZWFuLCBhdHRlbXB0cw0KPj4g
dG8gYXBwbHkgaXQgdG8gdGhlIGV4aXN0aW5nIGxvZ2ljIGhhdmUgYmVlbiB1bnN1Y2Nlc3NmdWws
IHByb3ZpbmcgdGhhdCB0aGUNCj4+IEFQSS9BQkkgaXMgdG9vIGNvbXBsaWNhdGVkIGZvciBtb3N0
IHBlb3BsZSB0byByZWFzb24gYWJvdXQuDQo+IEFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSBWTVgg
aGFyZHdhcmUgaW50ZXJmYWNlIHRvIHNldHVwIHRoZSByZWxhdGVkDQo+IEFQSUMgYXNzaXN0YW5j
ZSBmbGFncywgb3IgdGhlIGh5cGVydmlzb3IgaW50ZXJmYWNlIHRvIGNvbnRyb2wgdGhvc2UNCj4g
ZmVhdHVyZXM/DQo+DQo+PiBUaGlzIHJldmVydHMgbW9zdCBvZjoNCj4+ICAgMmNlMTFjZTI0OWEz
OTgxYmFjNTA5MTRjNmE5MGY2ODFhZDdhNDIyMg0KPj4gICA2YjJiOWIzNDA1MDkyYzNhZDM4ZDcz
NDI5ODhhNTg0YjhlZmE2NzRjDQo+Pg0KPj4gbGVhdmluZyBpbiBwbGFjZSB0aGUgbm9uLUFQSUMg
c3BlY2lmaWMgY2hhbmdlcyAobWluaW1hbCBhcyB0aGV5IGFyZSkuDQo+Pg0KPj4gVGhpcyB0YWtl
cyB1cyBiYWNrIHRvIHRoZSBiZWhhdmlvdXIgb2YgWGVuIDQuMTYgd2hlcmUgQVBJQyBhY2NlbGVy
YXRpb24gaXMNCj4+IGNvbmZpZ3VyZWQgb24gYSBwZXIgc3lzdGVtIGJhc2lzLg0KPj4NCj4+IFRo
aXMgd29yayB3aWxsIGJlIHJldmlzaXRlZCBpbiBkdWUgY291cnNlLg0KPiBJIGNlcnRhaW5seSBy
ZWdyZXQgaGF2aW5nIGJlZW4gaW52b2x2ZWQgaW4gYXR0ZW1wdGluZyB0byBmaXggdGhpcywgYW5k
DQo+IEkgaGF2ZSB0byBhZG1pdCBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBpcyBicm9r
ZW4gd2l0aCB0aGUNCj4gY3VycmVudCBBUEkvQUJJLg0KPg0KPiBEbyB3ZSB3YW50IGEgZmxhZyB0
byBjb250cm9sIHRoZSBzZXR0aW5nIG9mIHRoZSBBUElDIHJlZ2lzdGVyDQo+IHZpcnR1YWxpemF0
aW9uIGZlYXR1cmU/DQo+DQo+IElzIHRoZSBuYW1pbmcgZm9yIHRoZSBmbGFnIHRoYXQgd2UgZXhw
b3NlIGluY29ycmVjdD8NCj4NCj4gSXMgdGhlIGZpZWxkIHdoZXJlIHRoZSBmbGFnIGdldHMgc2V0
IGluY29ycmVjdD8NCj4NCj4gVGhlcmUgaXNuJ3QgdGhhdCBtdWNoIHRvIHRoZSBjdXJyZW50IGlu
dGVyZmFjZS4NCj4NCj4gSW4gdGhlIHByZXZpb3VzIHJlcGx5IHRvIHRoZSBmaXggaG93ZXZlciBJ
IGdvdCB0aGUgKG1heWJlIGluY29ycmVjdCkNCj4gaW1wcmVzc2lvbiB0aGF0IGN1cnJlbnQgYnVn
cyBpbiB0aGUgaW1wbGVtZW50YXRpb24gYXJlIHVzZWQgYXMgYSB3YXkNCj4gdG8ganVzdGlmeSB3
aHkgdGhlIGludGVyZmFjZSBpcyBicm9rZW4sIGFuZCB0aGF0IGlzIG5vdCBhY2N1cmF0ZS4gIFRo
ZQ0KPiBpbnRlcmZhY2UgYW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBhcmUgdHdvIGRpZmZlcmVudCB0
aGluZ3MsIGFuZCBidWdzDQo+IGluIHRoZSBpbXBsZW1lbnRhdGlvbiBzaG91bGRuJ3QgYXV0b21h
dGljYWxseSBpbnZhbGlkYXRlIHRoZQ0KPiBpbnRlcmZhY2Ugd2l0aG91dCBmdXJ0aGVyIHJlYXNv
bmluZy4NCg0KVGhlIGZhY3QgeW91IHN0aWxsIGhhdmUgdGhlc2UgcXVlc3Rpb25zIGRlbW9uc3Ry
YXRlcyB0aGUgcG9pbnQgSSdtDQp0cnlpbmcgdG8gbWFrZS4NCg0KVGhlIGFuc3dlciBpcyBpbiB0
aGUgd3JpdHRlbiBkZXNjcmlwdGlvbiBvZiBob3cgdGhlIGludGVyZmFjZSBpcw0KaW50ZW5kZWQg
dG8gYmVoYXZlLsKgIFRoZSBmYWN0IHRoZXJlIGlzbid0IG9uZSBpcyB0aGUgZmlyc3QgcHJvYmxl
bS4NCg0KDQpUaGlzIGVtYWlsIGhhcyB0YWtlbiBhIGxvbmcgdGltZSB0byB3cml0ZS7CoCBJJ20g
bm90IHRyeWluZyB0byBjcml0aWNpc2U7DQp0aGlzIGlzIHJlYWxseSByZWFsbHkgY29tcGxpY2F0
ZWQgc3R1ZmYsIGJ1dCBJIGZlZWwgYSBjaGFuZ2UgaW4NCmV4cGVjdGF0aW9ucyBpcyBuZWNlc3Nh
cnkuDQoNCg0KVGhlcmUgYXJlIGRlZmluaXRlbHkgaW1wbGVtZW50YXRpb24gaXNzdWVzLsKgIFdl
J3JlIGFsbCBhZ3JlZWQgaGVyZS4NCg0KSWYgdGhlIGltcGxlbWVudGF0aW9uIGlzc3VlcyBjb3Vs
ZCBiZSBmaXhlZCBwZXJmZWN0bHksIHRoZW4gd2UgYXJlIHN0aWxsDQpsZWZ0IHdpdGggYW4gaW50
ZXJmYWNlIHdoaWNoIGlzIGluY29tcGxldGUgKGxhY2tpbmcgYSBUUFIgY29udHJvbCksIGFuZA0K
aW1wcmVjaXNlLg0KDQoiSnVzdCBpbmNvbXBsZXRlIiB3b3VsZCBiZSBlbnRpcmVseSBmaW5lLsKg
IFdvcmsgY291bGQgY29udGludWUgaW4gNC4xOA0KdG8gZmlsbCBpbiB0aGUgbWlzc2luZyBwaWVj
ZXMuDQoNCkJ1dCAiYWNjZWxlcmF0ZWQgeHssMn1hcGljIiBpcyBhbWJpZ3VvdXM7IE5vdGUgaG93
IG11Y2ggdGltZSB3YXMgc3BlbnQNCmJ5IHVzIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoYXQgaXQg
b3VnaHQgdG8gbWVhbiwgYW5kIGRlc3BpdGUgY29taW5nIHRvDQphIHRlbnRhdGl2ZSBhZ3JlZW1l
bnQsIEkgaGF2ZSB0cmllZCBhbmQgZmFpbGVkIHRvIG1ha2UgYSBjb3JyZWN0DQpjb3JyZWN0aW9u
IHRvIHRoZSBpbXBsZW1lbnRhdGlvbiwgYW5kIHNvIGhhdmUgeW91Lg0KDQpXZSBhcmUgdGhlIGV4
cGVydHMgaW4gdGhpcyBhcmVhIGFuZCB3aGVuIHdlLCB3aG8gdGhpbmsgd2UgdW5kZXJzdGFuZCB0
aGUNCmNvbXBsZXhpdHksIGNhbm5vdCBnZXQgaXQgY29ycmVjdCwgaG93IG9uIGVhcnRoIGRvIHlv
dSBleHBlY3QgZW5kIHVzZXJzDQp0byBjb3BlIHdpdGggdGhlIHNhbWUgaW50ZXJmYWNlPw0KDQoN
ClByb2JsZW1zIHBpbGluZyB1cCBpbiB0aGUgd2F5IHRoZXNlIGhhdmUgaXMgYSB0ZWxsLXRhbGUg
c2lnbiB0aGF0DQp0aGVyZSdzIGEgYmlnZ2VyIGlzc3VlIGF0IHBsYXkuwqAgUGFydCBvZiB0aGUg
cmVzcG9uc2liaWxpdGllcyBvZiBiZWluZyBhDQptYWludGFpbmVyIGlzIGtub3dpbmcgd2hlbiB0
byB0YWtlIGEgc3RlcCBiYWNrLCByZS1ldmFsdWF0ZSB0aGluZ3MsDQphc2tpbmcgImlzIHRoaXMg
cmVhbGx5IHRoZSByaWdodCBjb3Vyc2Ugb2YgYWN0aW9uPyIsIGFuZCBzb21ldGltZXMgdGhpcw0K
aW52b2x2ZXMgYWRtaXR0aW5nIGZhaWx1cmUsIGFuZCB0cnlpbmcgdG8gZmlndXJlIG91dCBob3cg
dG8gbWluaW1pc2UgdGhlDQpjb2xsYXRlcmFsIGRhbWFnZS4NCg0KSW4gdGhpcyBjYXNlLCBJJ20g
c3RhdGluZyAtIHVzaW5nIHRoZSBwdWJsaWMgcmVjb3JkIG9mIGNoYW5nZXMgYW5kDQphdHRlbXB0
cyBpbiB0aGlzIGFyZWEgYXMganVzdGlmaWNhdGlvbiAtIHRoYXQgdGhlIGNvbXBsZXhpdHkgaXMg
dGhlDQptYWpvciBwcm9ibGVtLCBidXQgaXQgaXMgYmVpbmcgY29tcG91bmRlZCBieSB0aGUgYW1i
aWd1aXR5IGluIHRoZQ0KaW50ZXJmYWNlLsKgIEkgZGVzcGVyYXRlbHkgZGlkIHdhbnQgdG8gYXZv
aWQgYSBmdWxsIHJldmVyc2lvbiwgYnV0IGl0IGlzDQp0aGUgb25seSByZXNwb25zaWJsZSBjb3Vy
c2Ugb2YgYWN0aW9uIGF0IHRoaXMganVuY3R1cmUuDQoNCg0KWW91IG1heSBvciBtYXkgbm90IGFn
cmVlIHdpdGggbXkgcmVhc29uaW5nIGhlcmUsIGJ1dCB5b3UgaGF2ZSB0byBjb25jZWRlDQp0aGF0
IHRoZXJlIGlzIGEgcHJvYmxlbSBhbmQgdGhhdCBvdXIgY3VycmVudCBhdHRlbXB0cyB0byBhZGRy
ZXNzIGl0IGFyZQ0Kbm90IHdvcmtpbmcuDQoNCkFzIGZhciBhcyBuZXh0IHN0ZXBzIGdvLCBJIGhh
dmUgYSBwbGFuIGFuZCBpdCBpbnZvbHZlcyBkb2luZyBub3RoaW5nDQp1bnRpbCB3ZSBoYXZlIGEg
bmV3IHNwaGlueCBkb2MgYWdyZWVkIHVwb24gYW5kIGNoZWNrZWQgaW50byB0aGUgdHJlZSwNCmZy
b20gd2hpY2ggd2UgY2FuIGJ1aWxkIGEgc2hhcmVkIHVuZGVyc3RhbmRpbmcgb2YgdGhlIGNvbXBs
ZXhpdGllcyBpbnZvbHZlZC4NCg0KfkFuZHJldw0K

