Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DE14E5131
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 12:20:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293852.499334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWz25-0005tu-Dm; Wed, 23 Mar 2022 11:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293852.499334; Wed, 23 Mar 2022 11:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWz25-0005pP-9V; Wed, 23 Mar 2022 11:20:05 +0000
Received: by outflank-mailman (input) for mailman id 293852;
 Wed, 23 Mar 2022 11:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFSt=UC=citrix.com=prvs=074729667=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nWz23-0005Tu-3V
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 11:20:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cf2aa84-aa9b-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 12:20:01 +0100 (CET)
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
X-Inumbo-ID: 2cf2aa84-aa9b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648034401;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=A+pvQvl/u1V7KFqoDn1xIwi6dQmf93EtZuy4aB8o3kE=;
  b=NsKECLYq43XbL8vL4b/vLGMTAWU0zfscPu0vT2KyEHIRRPk2n2eLTPSy
   eu9QDhJ1ucWOycIT6aAAxP1IXjbk5B0miIAJT/PFshki1jIWna0fWSLHT
   /ZJ0z8K+SgS6nrxC52G4QYVfG4arq3DRwEk+zgKZEm1+m9IQu8EC4ZZ7P
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69325009
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9idita8jEcEaYHhd0eABDrUDun6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2VNXDqEOv7ba2qmet8kYNvj/E0P7MfXm9M3SQo/ri08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oLiW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYHoahh1P/L1o+UAaTsINBt0BZVbyrCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZtCM2c3NEWojxtnHGVNOokjzMWUiWTdTBMH8U2sgrAa2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkYKdiexDyt4n+qwOjVkkvTQ5kOHbe18vprhly7xWEJDhASE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy16++3sm+zZhEuLHI4R38jdwE928TRr9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNT9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM3d3XC3270k5JGQWy2yGgvTKuOGpxYEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPscgK1TWrHwyPhH4M4XRfK4Ey/xX1
 XCzK5vEMJrnIf4/kGreqxk1j9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 SjsBBUHlAKh2RUq62yiMxheVV8mZr4mxVoTNi0wJ1e4nX8lZIek9qAEcJUrO7Ig8YReITRcF
 JHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:pc78RK1FH3/XDVBUmNwMOAqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.90,204,1643691600"; 
   d="scan'208";a="69325009"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCKYLMBP6NibLX89BIO+mj+rWhMClrHDtmtmQGH+ZjAAxeLiMASoThC/uIbGfos1ZnEJZRIDD7iEKnEyOBmlcykEgzyMiiKQgtNwt3YKjWJr2PsKDCplVWGeAW4xzFNsOnd+y7Wpd0+eKc5Ir3ZvbJOfqABkR871ig+Nob5zufVzrNSJZ8alYeN8HOX9hJcfVbRlrGr0zyOqDnOPW0X1fhpdX1OsvLLEd3YsgaiRRieq7FPAfvX5HaB1rjqAWfRRAz0LWR7ojiQ3ij6UA+Qm1CS+vkrhBt6RoBq/LvBK8EnHSGAqaU1xgKYHrRoSbpjlfowMegcKsBL1LgyR9oCQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+pvQvl/u1V7KFqoDn1xIwi6dQmf93EtZuy4aB8o3kE=;
 b=dC1/BOuHAZNaU4MYHa/Ps/y3fyP6gfAksbdcAiDRKiBDGXMYzd+QJaKNFGrvILg1z9uwnWxsE1kfkN0Nk1SKMQB7sLY40ujsq9i17KCJe6nF7SDTLeN63DZ45jIx3fgzC7AECPYWaxRw3VrbeXDU39MItR0cDuN47KF1/JnA9AcofQXDDMzu/lGYFQOcLXUtqJAEGryDeAh7gUbnf2UyRzZQteK5t4HY4GE/k67ukHx27cETv0UmvWOO28yvIHpqNZFTwBRfiTyDskQ8huXmxSB0jejQJUEF7C06QLmVdOta12NHc2lXg0wZ8kQFqv7V/OVYOKz9YT83OytHIY6Jhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+pvQvl/u1V7KFqoDn1xIwi6dQmf93EtZuy4aB8o3kE=;
 b=ZNjttdXW28W8CfU8UqdVLTW+jiJJc8dXQvgVMqWxD+tLpYdzUfzxgpC/MI8xxJs6ufwUY5JAY+MGrs5li8V5uHcMRzlYpTXfqav8WftTuPKlWrvNSNRn3eyF8290wZBvmfHpKcqu3d32KSmeKTR5ECrVCdccL/hPzamI/KuQwvI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH] CI: Don't run Coverity on forks
Thread-Topic: [PATCH] CI: Don't run Coverity on forks
Thread-Index: AQHYPSvcWrGNYMcnAkWJCvNqV4tZeqzJ76qAgALlz4A=
Date: Wed, 23 Mar 2022 11:19:50 +0000
Message-ID: <10b64b72-dd9a-a2af-83f2-c42dad5adc9b@citrix.com>
References: <20220321135828.3158-1-andrew.cooper3@citrix.com>
 <YjiUDyTDuq5KQT3W@Air-de-Roger>
In-Reply-To: <YjiUDyTDuq5KQT3W@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c73ca8c3-2fcd-4c87-3dd3-08da0cbf0bd3
x-ms-traffictypediagnostic: BN7PR03MB4467:EE_
x-microsoft-antispam-prvs: <BN7PR03MB446771C869C1388355140995BA189@BN7PR03MB4467.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UyyeC0hKCe8Ytzm6ECP0vhDTOVNqtay/pUfkqZnG29NYTNOBrx14gJH4gO1T/72zBBNouKTatMV0sE8f8sO7nBLOsUkkFr7vifSONTgVkQ43ENgIbPauOQidAC+k5r6sxEw+aX7lTz9GBdh0GIqb5jhWkHP0MwebyCx7Qlcw6o5XgZ4eemrZf6hCa9rXSxikZhQF47fJYSat0q7/WUOvXSa3A0Pj+v2IMSKhPaRUTgzk4yBM/Xt1wI/jAdq7ap5Dx5wR0QVbp66UmdQ1PzkyDUvupAK3dPTHmBQ/1PASr6GiEq3YdBvlQ7ZO+cdp4SJqCkfKvHOFM8xFvE66PWsixrkLzon7CucFNRKpFBmMLDWPrfUy0vG1Ai9P7FDALtb817p/FR7dNjLYmi/fJltUPZ/8cdCu+aaxc+sTGgUxx8DtLWfnzbGWhTMvFk0Y7CfFzxr5Nwc/LzjlReu/olPD0M9X9LX2p3J+M0j8eStImYRfRKk3uqULCZOvqIrw438bvuOTladMt+0XPoSP/ulLseCFA9ZPUr7Qy3tbHCbCLdLrcxnBemuLeppMOU6VIz9HNHsBxqdDQ+YJ6fhFPRr2mx5SIFTpBLIYUQa3+z5PhBFlziekE1OgatZq9Ffdbg+jPvwu7uVUYlw/8sky2I8AtzRv/vL08xf61KTBbjfivfWQsyDAIkkR4ChlTjkpt5hW3L0hq44ZJUFXZbMLvQf46a9v5njHZV3RspcNNmC7WF94XT5bPDSe1yGiAk5iMeavWLJAEz/G8vr1wYyNrqB8NA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(4326008)(66476007)(54906003)(26005)(8676002)(5660300002)(6862004)(66446008)(37006003)(64756008)(6486002)(6636002)(71200400001)(508600001)(76116006)(66556008)(316002)(86362001)(91956017)(31696002)(66946007)(53546011)(55236004)(31686004)(38100700002)(6512007)(36756003)(2906002)(8936002)(2616005)(6506007)(122000001)(38070700005)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eG9qejFVVCtaZTdlQmdVUk0xdFBON3daS0pEcUV5NnpVU0orS3FQYTRhVGh3?=
 =?utf-8?B?a0E4aWNQcFU2N2VrZkdpTzBFT2ZNUFkrbTlHdnIvVUtrS2FOL245RkxIU2VT?=
 =?utf-8?B?dzZUbklBNTRaNW4vdTdLakhOeEt2MDl3c3JsdHFGTlU1dXl2Z3Vsc01MZFFF?=
 =?utf-8?B?MnlGZEZPTTVKbjRzVGJ4bDN3b3lVVndzTWJrTVh3MGQvTjA4WkFIZG83L3ls?=
 =?utf-8?B?V2NFSCtiZ05zNDgrNzJLb09OdzY4RGFGRUcrK3ZkZUVlMmNqM1pzM2hkNTNP?=
 =?utf-8?B?TmJpcGFpM0lyNTUwL1lka1Z5ZzNjRnNkU3l1UTl5Y1lHQjJUMVRlR2ZFNTA5?=
 =?utf-8?B?bjA2MWVVOFg5ZmErbGErMGRtNjZDSTNPT1I1MkltZ0FZNndpTUFoTlJWUFdU?=
 =?utf-8?B?VmhpVDducSt4ZVp4a0xkdXN2ZWF3ZlRkNE1qSWVDdVM4TWIxOHhud2JUV3Zt?=
 =?utf-8?B?bWI2aGNicHIxbkQxMGtZUzdOTUs3eHYzdTVZOG5XeCtYeGl3cGJaQ1YxVm1G?=
 =?utf-8?B?RTdsNXlWc2JCRlA0d0xQYjlxZFdiTlVsR0pXbHRaSlhDZXBzZFlYSlliNURN?=
 =?utf-8?B?TlU4UmRkaHdvc1RaQkhRVzlLQ011N3FjWGp4UmJ1Ym5uM21RcTRTcGMyNTZr?=
 =?utf-8?B?RVd3WFY1c2FJUHg0UVlSdUZMZjFHbDhLY1IrejU1a2x6SW1Tb0NERWVjNTFq?=
 =?utf-8?B?Sy85UXhHaCtrYU82NGNud0J5aDM3WEFMMlp2emh5MDlzNW1CbFdhL1VjMG0z?=
 =?utf-8?B?ajBRMU5xUDVkU2oyMllsalN5VEE4c1VnL2UxbjJCY1IzamZlUEFMTTQzRFNw?=
 =?utf-8?B?eW1tSTVCd3R6M3U3T2FFa3l0ckIza1NHTHBVMFZiYnB6U3ptSHNMM2RZcDY0?=
 =?utf-8?B?UlI0WTd1RmFzakZvUkQwOHhBTE5Pd0RDMzNZRllhK0U5ZUFYcGowQUpCQTNX?=
 =?utf-8?B?anF4TStscmhOaFE1T2R2REV6UjFMRXdNM0h3RDlKVHk1NFIvZkhxZWl5SkhC?=
 =?utf-8?B?cXdHOU5xamszWUI4WGM5dy9VZ2VucFMzVCttUlhiZ3BoL0hsVTk4TWtKb2ph?=
 =?utf-8?B?ekFEcWJrbVhtTjFnTU8wazdnbm9WWTZEa21tQWp3eWlrSlBMK05vMjBNRXBE?=
 =?utf-8?B?Vzd4Y3FLVXdDWGVXTi9CMVByVWVZV0lxeG9CbXlGcTlweWw1aXIzSDF4VURR?=
 =?utf-8?B?VWJlcmkyZTBtSHR1LzRMUUlTWjE3UkthRHJuVzVGajlaVEF0MURsc3NNL3di?=
 =?utf-8?B?K1EwNUYwQk1xaGVhck0rQTNuQVZVYnZ0QmNwMEJYR3g5dlJMQk10WGY1dDdz?=
 =?utf-8?B?cWlJQlF2RUhVemdUOHl6NjhmR3RjaTlpSUJ4QTNRQnlUOTV2a1RmVjMwd2My?=
 =?utf-8?B?ZWl5OUJvV1FWb0ovVmJCSjFqaXprbTVCMEMxRi9KZGhqQzlXRWdTeHhpcFRH?=
 =?utf-8?B?aFRQUml5Mllxek14bUVJVS9sNG53SXVDOFhiVjNwazhTOFhmNkhUNzhYMEdn?=
 =?utf-8?B?dld3ZmxnSG44SnVZREhuVE91OERBOE8rL3NTV0VaREljQ3FHODEvTWczNkFt?=
 =?utf-8?B?VUxVRE1rUXBNYlFCY0lkeUovbElDUGdYM1F3QWZpNTBIL1AxM2F1eTVnMXgx?=
 =?utf-8?B?SkZTMDk4TTFnbFBOMVFubUwrVTFucHVTYnRkTWFpWHFpbVJQcjB1YzRRVGFs?=
 =?utf-8?B?WFhMK08rclEwWnZVS2Zrb1VtR3BJd2xpcWU4Qm5rb2grSExoV0w3N3N5Q01N?=
 =?utf-8?B?aUhBZFowT1FsNTUyUUlPNytDeFhMUEJoZWFXU2NORVlIcXlXZXowdENXaHB5?=
 =?utf-8?B?ZVgxbmlGSjN2T0Y1b1d3TW9lbGVvbzJUS1dENERnUGpQTGhHWWg3Q3ZiY291?=
 =?utf-8?B?K1d0bEkzbnRsbnQvZlprS2d0cVJ5Z1FDcVdraGhkNE4xdGdDMXo1QmZJdVda?=
 =?utf-8?Q?6TOmFG4I0JHntK8JVLIlNETmp1xn2amY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A8429817F611B4987413BDB59FA6A63@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73ca8c3-2fcd-4c87-3dd3-08da0cbf0bd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2022 11:19:50.1932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +GxN/5/mQKGkWmb5CAtstQwoU7d0N7CYMCvCW/IU036Ly1JRLS7Ai31CPzrKjYRG0vWX/02obGyGU8qnxHmGpRr2XJa1BOKH0GmOJZl57kM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4467
X-OriginatorOrg: citrix.com

T24gMjEvMDMvMjAyMiAxNTowNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBN
YXIgMjEsIDIwMjIgYXQgMDE6NTg6MjhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+
IEJ5IGRlZmF1bHQsIHdvcmtmbG93cyBydW4gaW4gYWxsIGZvcmtzLCBidXQgdGhlIENvdmVyaXR5
IHRva2VuIGlzIHNwZWNpZmljIHRvDQo+PiB1cywgY2F1c2luZyBhbGwgb3RoZXIgcnVucyB0byBm
YWlsLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo+IEFja2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCj4NCj4gQWxiZWl0IEkgaGF2ZSBhIHN1Z2dlc3Rpb24gdG8gbWFrZSB0aGlzIG1v
cmUgdXNlZnVsIEkgdGhpbmsNCj4NCj4+IC0tLQ0KPj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPj4gQ0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
ZXUuY2l0cml4LmNvbT4NCj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+
PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4gQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4NCj4+IC0tLQ0KPj4gIC5naXRodWIvd29ya2Zsb3dzL2NvdmVyaXR5LnltbCB8IDEgKw0KPj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS8uZ2l0
aHViL3dvcmtmbG93cy9jb3Zlcml0eS55bWwgYi8uZ2l0aHViL3dvcmtmbG93cy9jb3Zlcml0eS55
bWwNCj4+IGluZGV4IDQyN2ZiODZmOTQ3Zi4uZjYxM2Y5ZWQzNjUyIDEwMDY0NA0KPj4gLS0tIGEv
LmdpdGh1Yi93b3JrZmxvd3MvY292ZXJpdHkueW1sDQo+PiArKysgYi8uZ2l0aHViL3dvcmtmbG93
cy9jb3Zlcml0eS55bWwNCj4+IEBAIC04LDYgKzgsNyBAQCBvbjoNCj4+ICANCj4+ICBqb2JzOg0K
Pj4gICAgY292ZXJpdHk6DQo+PiArICAgIGlmOiBnaXRodWIucmVwb3NpdG9yeV9vd25lciA9PSAn
eGVuLXByb2plY3QnDQo+IFNpbmNlIEkgZG9uJ3Qga25vdyBhbnl0aGluZyBlbHNlIHNpbWlsYXIs
IHdoeSBub3QgbWFrZSB0aGlzIGEgc2VjcmV0LA0KPiBpZTogJHt7IHNlY3JldHMuUlVOX0NPVkVS
SVRZX1NDQU4gfX0/IFNvIHRoYXQgcGVvcGxlIGNvdWxkIGRlY2lkZSB0bw0KPiBlbmFibGUgY292
ZXJpdHkgb24gdGhlaXIgb3duIHJlcG9zIGlmIGRlc2lyZWQuDQo+DQo+IFdlIHdvdWxkIGFsc28g
bmVlZCB0byBpbnRyb2R1Y2UgYSAke3sgc2VjcmV0cy5DT1ZFUklUWV9TQ0FOX1BST0pFQ1QgfX0N
Cj4NCj4gVG8gYWxsb3cgc2V0dGluZyBhIGRpZmZlcmVudCBwcm9qZWN0IG5hbWUuDQoNCldlIHdv
dWxkbid0IG5lZWQgYSBzZWNyZXQgaGVyZS7CoCBXZSBjb3VsZCBkbyBpdCBvbiBvbiB0aGUgZXhp
c3RlbmNlIG9mDQp0aGUgUFJPSkVDVCBmaWVsZC4NCg0KQnV0IGlmIHdlJ3JlIGRvaW5nIHRoaXMs
IHRoZW4gd2UgYWxzbyBuZWVkIHRvIG1ha2UgdGhlIGJyYW5jaCBzZWxlY3RhYmxlDQp0b28gdmlh
IHRoZSBzYW1lIG1lY2hhbmlzbS4NCg0KfkFuZHJldw0K

