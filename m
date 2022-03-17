Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFFD4DC8CA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291627.495104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUr8P-000100-Ka; Thu, 17 Mar 2022 14:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291627.495104; Thu, 17 Mar 2022 14:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUr8P-0000xF-Gn; Thu, 17 Mar 2022 14:29:49 +0000
Received: by outflank-mailman (input) for mailman id 291627;
 Thu, 17 Mar 2022 14:29:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hAZZ=T4=citrix.com=prvs=068f51ced=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUr8O-0000x9-N9
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:29:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adf41947-a5fe-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 15:29:41 +0100 (CET)
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
X-Inumbo-ID: adf41947-a5fe-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647527387;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/Irteg4vs7a8bVWVjDNFHYCbuAIWQmyd5je9a7ZzyXs=;
  b=hCtmz9ixG0AAc7xxPsctBEWq1zc/bqQQB6G+U77MLffQp8GcnDkmPbM1
   dJCm4vhy6KOK2k57lYxTnRJHQtGV8uYdqpBytIC83jkpAws/gge4znc/g
   H05tx1957zwJ4lfVuG55s9+YI70/ii3wKBorrXu5rhqMknZQbc31EIPmG
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66908837
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:X42eWaut+AcChFGUY9SATbe31OfnVJ9eMUV32f8akzHdYApBsoF/q
 tZmKT+HPqyMZGKhc911OYTl8hxSvJbcmoUxQFRorygwFHxD+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jU5
 ouoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8JD7DXveEAWiMALA9TL4xZ1ebXA16g5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQxPUyQM0YQUrsRIMMFre2wjHrNSABzp2uooKMY4WbrxwMkhdABN/KKI4fXFK25hH2wo
 2Hb1238CwMdMpqTxFKt92qrhuvGliDTUYcbBrq+sPJn6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZNb9EsucseTDkjx
 FiP2d/kbQGDq5XMFyjbrO3N62rvZ25FdgfueBPoUyMl0sT4hYQuhyiXcfhOAo+qo4TlOxfvl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp5
 iBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWeR8B3iUsI2aBj
 KrvVeV5vsM70JyCN/MfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZwzv1iZ
 s7BL57zUB727JiLKhLsG4/xNpdxmkgDKZ77H8inn3xLL5LDDJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3C4XDjt3s2ddLdzgidCFjbbiv8pA/XrPTc2JORTB6Y9eMkOxJRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg4MeKxB8kj9SxnVcHuVH7xs0UejU+UxP53X7M8fKU99fwlyvhxT
 vIffN6HDOgJQTPCkwnxp7GkxGC+XHxHXT6zAhc=
IronPort-HdrOrdr: A9a23:/z69xKvJJhj6ReSLlugKZgnI7skDT9V00zEX/kB9WHVpm5Sj5q
 OTdYcgpH3JYVcqKRcdcL+7WZVoLUm3yXcX2/hpAV7BZmnbUQKTRekI0WKI+VHd8ljFmNK1op
 0OT0ERMrDN5BNB/KPHCUGDYrIdKfe8gceVuds=
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="66908837"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E96+/A7BLp7RLp7UYW49qUDVxqQC+JhspMrWa5U5HBax70h3u+dpw9CgvA8l31bHAn/F/2bOXvV1gbxRt/rKAuS/qyQKNPb12sNJBAGS8bmQwfLbKTKfHWueuqp0uXonYgmP0Ovn28Y9jvB/x8BCZ9vrCfDrUpYOLaW5lSWlNh113ygxLMlJAegZWxvTVg97jhiKHF81/VfwBYaleVD0QlW5lluKodSgLRaqZ/MKA0rL5MtoQLgRhYPR2K1zegUKwe5FZue+lAD5JeLQaKBmFOSARVr3xdrtDH55k9GNMlCvhhSlrmsvHtysYC3PocveoZlYfbh1czf/HmjyIkYVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Irteg4vs7a8bVWVjDNFHYCbuAIWQmyd5je9a7ZzyXs=;
 b=Af4lXlvVM9HjEv5BNla1RmkZylfj1UZ09BFKgmBZWrF9J8APKpt+X8X7ffxdsMmy+Qhb/hmoACLsgY9S9qgCd9VKM5me6PjLekMZxE9HuUPSecS2XVUZYRLyrfrqTVdBwhywAwswTwyk/u/cw6mGeep7oM3L4R9RKM4Xa+SeWknkPOmouvSV6pO4s79v0n3tnX4Dc6/KjUV6IbKRXr9SGx+2Ghe1qJRdBW1x6jRaMx4urD8Dht2g1Ota3QyJ29y2jlKKA2WghNL/Isia5ZSCDi3MuS6jCxiFva6XpYC2mGZze4VoVo6TDAkKpCSOxZGlmJ2XqNbIrGjU7Mye+1kD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Irteg4vs7a8bVWVjDNFHYCbuAIWQmyd5je9a7ZzyXs=;
 b=pQ58F/lBJ+7U3GUE5lBESt2hFSof0Y3FGhLbgPe+AdTrQ4En1404KlQuJuJJglqgiCa24kclFB6zrJQPUmuxXyGE5+OhmlnmbeaywCtWo6sK3vrFnodzGxfi5EHiMIXUO4LmnBhUV55iPI6gtrOpY1hUhC6lnsujjRxZj4XVtmc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Bjoern
 Doebel" <doebel@amazon.de>, Michael Kurth <mku@amazon.de>, Martin Pohlack
	<mpohlack@amazon.de>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] x86/cet: Use dedicated NOP4 for cf_clobber
Thread-Topic: [PATCH v3] x86/cet: Use dedicated NOP4 for cf_clobber
Thread-Index: AQHYOghShtEsT1aba0eWFJLpGnMDLazDoKGAgAACLoA=
Date: Thu, 17 Mar 2022 14:29:42 +0000
Message-ID: <87c16705-59b9-450a-6664-1aceec0b0cbb@citrix.com>
References: <20220317140624.4258-1-andrew.cooper3@citrix.com>
 <3cb4767e-4ea8-8a66-0e12-b5b5fa6bb1dc@suse.com>
In-Reply-To: <3cb4767e-4ea8-8a66-0e12-b5b5fa6bb1dc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9058eeb0-fa16-48bd-c2d7-08da08229384
x-ms-traffictypediagnostic: DM6PR03MB5162:EE_
x-microsoft-antispam-prvs: <DM6PR03MB5162C4749E6E8CABE3034E2ABA129@DM6PR03MB5162.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jCwmODMR9RqFvRf07W1TXbMq5ADD+UBIXVhQJzyce7N2tqKVJKzBkG/4GvO0CLKsTKNdRvv9/D9YGxwShaC1J7xI5nEroxQCfozHcHfGmEyfHBVLjeiySUwOauQ/uSZ6jR0doH2rhtd70qTSbT4uzhgiHsBy6OTJO12/f3hrFchqKKkapZn6x0J+xufnRY/C8Ghg5jqc5CbQw6FZD8NOcVfGbOJppIKfxGZYke0KsVw3Yu6P5UELJxXC/+ZTi/+CgexGTbcxN2EFNYgy6cSydmGjoBsS5vNWarsNwH7fsO0szkFe8rxUjkLgYouKtoFTxnU3P6qL8pK9GTIfZkBkVbzFLLWY64P1/uUPwUAmorKvUmhclkMzl39hrZ9VjKHCfDkYM+2KGFL5f0sduvFmWdjPxB7GL7dTZxWPbfpmfLdZ0ekGQg9msHGxMk2MYCGru744GzcSlejD0xb+81Zyp2fGlrXfPSV3uSx00LYswa+HdQdMhi7sZKePxNudegHgurYxsIUG+6vslCuVIuRxOSKZ998qjTWulZIVh3n3d1397IXbGFS6u7WbFM57QTlCI/V68BC9qPIwRS3XsVhvO5yLHVVYEZxr+4TfQRqM48lud2wIlRw2ghdoh2RU1D74eIFlaVkEkbEpafEG4D2AY5FIEI7qrC7lXj5HXTCkFgl0hPvL3ngxmy2igN8LrpzzLIfZ5dv1KoZoZ4Ej6j3GXSf1lW94MpJuKJUSOwtdQshiPnhYLclQFywbEBo9RUxNlL0yqxzdqu7jYOidNyvxUA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(186003)(26005)(31686004)(2616005)(2906002)(82960400001)(122000001)(6512007)(86362001)(54906003)(31696002)(71200400001)(8936002)(38100700002)(5660300002)(6916009)(316002)(4326008)(91956017)(53546011)(8676002)(76116006)(66476007)(66446008)(66556008)(66946007)(64756008)(508600001)(6506007)(38070700005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bk1qcHE0RUNFR1JtWWNlbUc5VTBjaWY0V1hPSFhDNFZWVTJtMGNYdnkwcGpI?=
 =?utf-8?B?d0lxZnBGNXlFY2VpWTRGejJPOFVRT1pjOHZheGJMZ25RRHhIM3FwVkhkbmVB?=
 =?utf-8?B?cDhFSW5nWGlGVTg0UGVzU2pNdFpKMEFaaEI1dlA0NUh2VzVSS0J1SzZkeVFv?=
 =?utf-8?B?RytUVDFtOTVDekQ0WFMzVzdpZDVudzBkb3p3emVsYkNidFBqSzl2SXJ0cEI1?=
 =?utf-8?B?Q05GRGtLUGlTeFNwVnJQbGEwQ2hnZXdwU2lPUk5XZ000c3Q5ZkVhSlU2aDZv?=
 =?utf-8?B?SW9PeFVjYzVsRStqWFplUTl0d2JkY1plLzFYSmEvWWVHdXh2VFVQd2NlcEtK?=
 =?utf-8?B?SExQVnRTR29DU2djZ2pCNk8zVVRJbTFIbG5OZ3QwdDdkckdFcllUVFBRTXJL?=
 =?utf-8?B?WlJiNmV4T2xPOTBwbEJVYnVMYmtsaEpxMW1PYzBTdVpFeTBsMlE5MVpEZnQ1?=
 =?utf-8?B?NklTdC9zNXczK3dRdW5PUDdWbWFmdlQxaFczZDM2clhLM1JNMVVtK2MxdzhT?=
 =?utf-8?B?bTVjY05Fd2liYndWOUMwUDhBK2tVQlpmTXNMTVN0UHNBSmNhRDJjV0c2K1Qx?=
 =?utf-8?B?RzYzUDdaeFpPYVpNdDZPaUlqVEVxb2Y1Tk52WmtBeHkvRmdLbE91blRjUjJr?=
 =?utf-8?B?RkYwWVZvcHcrZVcxSFYvbmExVzQrcGxjQVdoN1pmZ0FYVXB3WVBYSzFVWCsy?=
 =?utf-8?B?bEVrZUJlVXE1eW9wUHRHYzZxZ3NybHdGYjJFUzgxVnV1L1BibW03Zkw3cFlK?=
 =?utf-8?B?Q0x5aWxEWVZQZTk1clJja1l4ZHF0MkFFYmVFV3BIb1JEUTd5cGdkREpPWjV5?=
 =?utf-8?B?L2VwTERjM2Y0YzNCeGE0dHFQeHJxZGZpNGpOdVNwUmFDZEwxV0RJZzNXQ2NJ?=
 =?utf-8?B?M2I1bjk3dFFSOFZ4VmY0cEJ0UmdjZHJJTllRODFpY0pEZ0VPY0cweTV5ZUJ3?=
 =?utf-8?B?WTNlOEEvZ1RTUi8ydnJyeHNUZUhRaW00Y0NNdDNTdm9pcmVrS2Q3aGI5ZWlP?=
 =?utf-8?B?S2oycW5mY1NrT1RKTm9sbHdIRUIvMFloanNWUTloMGJycWNaKzY3MTRGaVdH?=
 =?utf-8?B?TXA0T2FEVlY0Z0ZPaG4yQi9Mdm1reGgvaE1EbTh1RzNZdTFzbDJRMXptQ0Vr?=
 =?utf-8?B?Y2tJeVpMa2FSUFRuYlY3c1BHS2ZsSnNsaXVSUTYzRVVBTzFaVmpxb2tkemQz?=
 =?utf-8?B?cGlibVpTODNoRGp6OUNTaVFyZSszQTRqUis5a1JhTTNFSVdIL2d4Q1ZheEds?=
 =?utf-8?B?NWNTckpGbElHREhLLzBsb2d4dFFDSUpXNjNDdVJIeisxNDlOeUI2K1N5UFgy?=
 =?utf-8?B?ZlFGMXhOS3dtWk1qblUyVXV4dldEOXFZMkcvVGdTWG9rL1FNcVNHRlR3aVI2?=
 =?utf-8?B?ZnlvVzY1dUhXMUJyRmNleUh5ZnN3U3FrNnhWZk5Sc2w1SEtxSGdya1hEZ1lr?=
 =?utf-8?B?akhPTGwxUGx4dUxSVVV1NnBRR1ZneS9mMitXOUM0Q0FIQzkzcm1QQXM0L1pO?=
 =?utf-8?B?WE5jMno5SzVaS1lPS0g0YjhKZno2NEZzOFVYOG8rK3ZpMlJQZnNSVElLRGFn?=
 =?utf-8?B?UjBEUEp5RE1IVkhSenE5cjJUVzlpOHVRZWJiYmdTWkJFZUJKMXg5UzNaZERS?=
 =?utf-8?B?TjNBMUFNM0dVdWdOcENiVnpaaGh2a1FYYnhrY2p2cGtFeTB3VHQ4VlEvaWRU?=
 =?utf-8?B?K2dGN3VXTldiL3NzN0V6alJHSTJoeFYycVpCdVdGT1c0WTZ5cjFmbVFaUGE3?=
 =?utf-8?B?Tk1IVXluQUhhV1J3dzdIUDBGeExCa1RnMnl3Y2VOZ0ErcWxVL1R3TUJWUGt2?=
 =?utf-8?B?NDFJZ2JEVzF4YklUR1NFUlQ4bWlhU2V3SlpxcFpVQjk5VjJqVktuMGtEcHZm?=
 =?utf-8?B?aVNNWHI5VlM3a3lMRmU2TWk5bVp3RlB2Y284VU40TVRSWmdkeHBCRkxsaThS?=
 =?utf-8?Q?GpE4vnWrhItyNogzaiMf72gHMQwhfP1d?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D9D7BD64B45D34C970030DF16AC6167@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9058eeb0-fa16-48bd-c2d7-08da08229384
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 14:29:42.2426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q94BYFohs1LMEZ3F+Tr1CRgfpqLUT+TmGzdQ1V5gUHrKI+UH/8shMJNr1Dlcslrtw1775uV8UrHqe+VimPyc1ntlbGI/dBhQw2t91e0aB3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5162
X-OriginatorOrg: citrix.com

T24gMTcvMDMvMjAyMiAxNDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE3LjAzLjIwMjIg
MTU6MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBGb3IgbGl2ZXBhdGNoaW5nLCB3ZSBuZWVk
IHRvIGxvb2sgYXQgYSBwb3RlbnRpYWxseSBjbG9iYmVyZWQgZnVuY3Rpb24gYW5kDQo+PiBkZXRl
cm1pbmUgd2hldGhlciBpdCB1c2VkIHRvIGhhdmUgYW4gRU5EQlI2NCBpbnN0cnVjdGlvbi4NCj4+
DQo+PiBVc2UgYSBub24tZGVmYXVsdCA0LWJ5dGUgUDYgbG9uZyBub3AsIG5vdCBlbWl0dGVkIGJ5
IHRvb2xjaGFpbnMsIGFuZCBleHRlbmQNCj4+IGNoZWNrLWVuZGJyLnNoIHRvIGxvb2sgZm9yIGl0
LiAgVGhlIHNhbWUgbG9naWMgY2FuIGNoZWNrIGZvciB0aGUgYWJzZW5jZSBvZg0KPj4gYW55IGVu
ZGJyMzIgaW5zdHJ1Y3Rpb25zLCBzbyBpbmNsdWRlIGEgY2hlY2sgZm9yIHRob3NlIHRvby4NCj4+
DQo+PiBUaGUgY2hvaWNlIG9mIG5vcCBoYXMgc29tZSBjb21wbGljYXRlZCBjb25zZXF1ZW5jZXMu
ICBub3B3ICglcmF4KSBoYXMgYSBNb2RSTQ0KPj4gYnl0ZSBvZiAwLCB3aGljaCB0aGUgQm91cm5l
IGNvbXBhdGlibGUgc2hlbGxzIHVuY29uZGl0aW9uYWxseSBzdHJpcCBmcm9tDQo+PiBwYXJhbWV0
ZXJzLCBtZWFuaW5nIHRoYXQgd2UgY2FuJ3QgcGFzcyBpdCB0byBgZ3JlcCAtYW9iYC4NCj4+DQo+
PiBUaGVyZWZvcmUsIHVzZSBub3B3ICglcmN4KSBzbyB0aGUgTW9kUk0gYnl0ZSBiZWNvbWVzIDEu
DQo+Pg0KPj4gVGhpcyB0aGVuIGRlbW9uc3RyYXRlcyBhbm90aGVyIGJ1Zy4gIFVuZGVyIHBlcmwg
cmVnZXhlcywgXDEgdGhydSBcOSBhcmUNCj4+IHN1YnBhdHRlcm4gbWF0Y2hlcywgYW5kIG5vdCBv
Y3RhbCBlc2NhcGVzLCB3aGlsZSB0aGUgYmVoYXZpb3VyIG9mIFwxMCBhbmQNCj4+IGhpZ2hlciBk
ZXBlbmQgb24gdGhlIG51bWJlciBvZiBjYXB0dXJlIGdyb3Vwcy4gIFN3aXRjaCB0aGUgYGdyZXAg
LVBgIHJ1bmVzIHRvDQo+PiB1c2UgaGV4IGVzY2FwZXMgaW5zdGVhZCwgd2hpY2ggYXJlIHVuYW1i
aWd1b3VzDQo+Pg0KPj4gVGhlIGJ1aWxkIHRpbWUgY2hlY2sgdGhlbiByZXF1aXJlcyB0aGF0IHRo
ZSBlbmRicjY0IHBvaXNvbiBoYXZlIHRoZSBzYW1lDQo+PiB0cmVhdG1lbnQgYXMgZW5kYnI2NCB0
byBhdm9pZCBwbGFjaW5nIHRoZSBieXRlIHBhdHRlcm4gaW4gaW1tZWRpYXRlIG9wZXJhbmRzLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoN
ClRoYW5rcy4NCg0KPiB3aXRoIG9uZSBuaXQgKHdoaWNoIGxpa2VseSBJIHNob3VsZCBoYXZlIHNw
b3R0ZWQgYmVmb3JlKToNCg0KVW5saWtlbHksIHNlZWluZyBhcyB0aGF0IHdhcyBwYXJ0IHRoYXQg
SSByZXdyb3RlIGJldHdlZW4gdjIgYW5kIHYzLg0KDQpXaWxsIGZpeC4NCg0KfkFuZHJldw0K

