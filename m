Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74EA64ECDB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 15:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464748.723234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Bgp-0007bf-CW; Fri, 16 Dec 2022 14:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464748.723234; Fri, 16 Dec 2022 14:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Bgp-0007YE-98; Fri, 16 Dec 2022 14:27:55 +0000
Received: by outflank-mailman (input) for mailman id 464748;
 Fri, 16 Dec 2022 14:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Zr/=4O=citrix.com=prvs=342bb51ac=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p6Bgn-0007Y8-KY
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 14:27:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d18a4b7b-7d4d-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 15:27:51 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Dec 2022 09:27:42 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6997.namprd03.prod.outlook.com (2603:10b6:8:42::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Fri, 16 Dec
 2022 14:27:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Fri, 16 Dec 2022
 14:27:39 +0000
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
X-Inumbo-ID: d18a4b7b-7d4d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671200871;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VoQyCTuolKRfIzY1yBnNYiLiFuXiSaC81CbBoa+3PzU=;
  b=GuPolbHM0hHZwPcvUmA/V/2+4uPdGQE7+bYwM182ZHGtwCjy3oBd2Csz
   eaWYfIY+gzaVjUJTED8nILBR9wq2yuNBBj97oheakLYYWO5dNm+tlSv7x
   p7APk7UlEW85TMxgeLlTHPK68vOh/Dyp6emF3HjVeUk62cNNkzMD0j6sh
   4=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 87725399
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Cz7WnaL5p+uijqxRFE+RUZQlxSXFcZb7ZxGr2PjKsXjdYENShmRSm
 DNODTjUOa6CMzP1ct1/Oo/g8EIH68LcmoBnSlZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5AVgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5bGDgJ3
 N07FwsBf0uAicXmyri1RO1V05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzXykAt9JRezQGvhCmEy/+GBJCzYqWwWn/sO3qXCuBvsHN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97WmlyLfQ4gufLngJSHhGctNOnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8hSy2ETgYKykFfyBsZQEI+cX5qYc/yBfGVM9+EbWdh8fwXzr3x
 liisi86gLkCiN8R4K+y91vHnjGEq4DAS0g+4QC/dnKo6EZ1aZCoY6Ss6EPH9rBQIYCBVF6Ds
 XMY3c+E44gz4YqlkSWMRKAHGuGv7vPcaTnE2wcxTt8m6iin/GOlccZI+jZiKUx1M8ECPzj0f
 EvUvgAX75hWVJe3UZJKj0uKI5xC5cDd+R7ND5g4svImjkBNSTK6
IronPort-HdrOrdr: A9a23:52vZNKDNuPZ0CjzlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="87725399"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrwF2LvjSxce7PqdWFSwlAaF98xVLBaKG4FCCFNBuSzBYU+52fj8kFcaQOCuQ6aWCsPR+dXWmy1z4rvHX1/oCajFoxhH8JQ4ezOj+g3gLOV0yPJN5WCn505qLbvLpZixCuneYqT6Rz085m49uwWmX/+xZDfBBhGRemKXpdKZ3lKAqDob6iqexqWCqw9IS/DJ5Oc4qCCqZxOMagyDfS0CSaCnw+GAZIsotZ4PKGN6hWesGvMuaYXSc04ll0WUAhPuiYppg3nntUzaiiyT7wbByIJclQnioHtaN+V7p0JmLiTcxcLnHf5KTVMtZUTJsLmm4b1wtJFvj9P4aFwComRZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoQyCTuolKRfIzY1yBnNYiLiFuXiSaC81CbBoa+3PzU=;
 b=iuvRizHXx93y9+IXV3kfgbukydQHZWV9oLZkP8NkhQnlKYSyoXjYoeed2DVABOTFzHVbDSfEmbFtMuit7eT3GkcxjA1Pkoz4OOjCc2iohMZu8brkyzbKFQF9+F5yu/QDNm2SNaoB0DWblH/cEJhoOU3URkxM5IpILNc1DwagaidxN67CiNiHYmfLQZE0zfkPyYEoB5TSjpgbiuMTwewagoXOcdsK1eqchAm4C8G8SQg3yjxDN60kBvyF/g8Iy4j0PrfmgTyjyUPEweav7V0CceHh7yRaFhzP1WjIx881MhK/D1jPSpNYhGAEi3G+qgHMwYJy8lkKHohfmYfkuKmlIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoQyCTuolKRfIzY1yBnNYiLiFuXiSaC81CbBoa+3PzU=;
 b=xbwUdsZQgKXWJ7j2f9ZEbT7TODYu9fNWMIq1dio3M7JyprlmVSDgVekj6QH1BLXf3+PsrkZXNBu+Ghy4zA40VlBuw1pE3sRLa/PV9hU5F0pfR5qmKh4xM23kN0OiXSoLqBAUtfxRRX9i3crjnhj0Z3PIJZRWX4BwPO4xGbUg/2U=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] NUMA: replace phys_to_nid()
Thread-Topic: [PATCH 2/2] NUMA: replace phys_to_nid()
Thread-Index: AQHZDudxkldNMZdm+EWY9M6n0vcTdK5wawGAgAAC8ACAAClZgA==
Date: Fri, 16 Dec 2022 14:27:39 +0000
Message-ID: <7516b054-08e2-edac-eb6d-bf98d115077c@citrix.com>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <670b7017-4a6e-fa9e-9d65-65013bd4ad80@suse.com>
 <3a776bac-08d1-7772-b069-8a11583a4720@citrix.com>
 <3efbf38f-4b78-7c3b-bd91-a17ff6028841@suse.com>
In-Reply-To: <3efbf38f-4b78-7c3b-bd91-a17ff6028841@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM4PR03MB6997:EE_
x-ms-office365-filtering-correlation-id: f84a90d2-9999-4de6-7341-08dadf71afa3
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 StUr4uDu9sEkAQ7zDwmScWEuNCuyYSgSla5EQ2e1iMCnpF5RWG2BcwtZ0EJ/pcy4/HvtzQPCyGHQ8xh8S2av3n3tAMrQdLiwE5XCglcEl02Vl7woO0hGKMMr693GYVrDmMvzSqQdIvP+3D4RF3P1zmfIwA2PxzF1y5hNG7sUZEJ1PL8QQlTQgOIT9d9kMANu0WVtgrIFsiWx0AIA0m9YSoD+o8fLjgPJqYicheY+Z8KYM7UF4jNAQ18wFzBgNj88JgZ7Jg1jjUY8/0KMa+Fa/QY2WDSJ79BG2/W/C5nFwonCpEqyEh9AnQasFEUIi/HZTGdCUl7HjUmB6srSKyVn8ziqx0kSMZ41sqtSafA3RtV1eqxNElp0tHxEcqkDrr+NHlSRuironuzN0ntiQUy5iNkmit464qL6W3iOYAOICgCHlpt81Ogj6mMUSOCfcVCWgtxPpK4/AXhvhDK1mR6iPak0dVgxDi257DgE368bovjT+gvJj6e+twmvC54c15lxI37/BESUeFIWArk6zL9omsMBPaeA7wmLZPcBeOYLCbuuyzUbJ0nrGfXEKjWUjYTMjTrP44HUSFVcUThocOh1LHq3j1uRfCsEduPs/i5Cfk8//V5Qepe3UyQ/cDoqaG1zwX68tm3IroEcvNbu2Zfss+ZV6XMH5jD8Ttie2T69oCn3fLf6yiRg2nlqeOOgWKMu+Xb0c7wLNhy9QAetL/2F8+wv976Ir/fmfDzz6nSMCg/tHrjqhJ/3VlyE+7F3bEIvs7CXBkzIpvm9vTbwPioUuA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199015)(2616005)(76116006)(91956017)(478600001)(66556008)(66446008)(66946007)(122000001)(64756008)(38100700002)(82960400001)(66476007)(2906002)(316002)(36756003)(38070700005)(41300700001)(71200400001)(6506007)(4326008)(86362001)(31696002)(31686004)(6486002)(8676002)(186003)(8936002)(83380400001)(5660300002)(26005)(6916009)(54906003)(53546011)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHU0WjkxMHlmVkFsN1FNQUxrRitNaG1MdU1qSVZ2bmhodWFiUDh0SWpSUzZY?=
 =?utf-8?B?eExRSGxjcDdlV0hKOWR6RGxpYXJvT2p5ZDhtbUFpLzkrNGcxeTdpVERjUmxT?=
 =?utf-8?B?WDVvSE04WFdRYm9OWmUzbS84Q2t0cHFwK3ZhNGdON091VEpSM09VN2xMR0hZ?=
 =?utf-8?B?YUJYblVvRXNLV1FxUzdIR2RRMFEra1V5cElLR1M3TUxCTUhRYytSV2EzUG9M?=
 =?utf-8?B?QnYwN2gvZHhLSEloQVZOb250SEducXkzV1UyUURFTnNDL3ZRVEJ3aVVkSHdY?=
 =?utf-8?B?cGNwTXQvckhVTmFrcm5JYXVNejJEVGZyS0tmTDIvRTJ5cXZ2cmFFWU1tK0Fo?=
 =?utf-8?B?dmN1M3U1VDlSRVdHT3BjM2swdy9ja2ZOZWxjemlaTGVPeEJsOFg3NE11WDlm?=
 =?utf-8?B?Yi9hMitOa3l2d3RGeVY5YU1WRERLZDNaNlMyeVgxSExuY09mRElEUzl6eFgx?=
 =?utf-8?B?QzVDSm5CZEdMeWdTRDIrWXB3TXFhSU00ZFJ6a2wybEdUQkxDa1crbDl1V214?=
 =?utf-8?B?T0dvVTFjS1JHQ3ZReWorVisvVnZZRnIxMG9hZjQyYjYvaGJQeFhvZmc2amcr?=
 =?utf-8?B?eVZrTUh5NURZSWFkbWZHMjIyRmt3WkNrUWFBM2tJUzhxQnNZaTU3bkVZbXNT?=
 =?utf-8?B?NmhjZWxjR1NobUJBQ1c2d0FxQ3kycjNSSGRXS0p6UEk1VnVRT1VFVWFWZ05y?=
 =?utf-8?B?WVVhQW4wRi9teEpaL21mRy9XS21ncTRUMzNENHE4SnkxZzJYWHF4M0g5Y1JT?=
 =?utf-8?B?c0FvL0NtaHkvTnJTS1dHRjlMQXJ5YTdpd2hkV1RIWjhoTWFDZG5kTXE2Y21I?=
 =?utf-8?B?N1VVWXpXNjRtbExJWUR3bm8yMlFrc2tTT2oydThTb2I0WHZpdFVPODlSeW5v?=
 =?utf-8?B?Rnloc1VmSmlLT1FLSkhoOVllM0VJK3V1N2xxVXhrVng1clQvSTJVcDdlVitF?=
 =?utf-8?B?QUdRT2NyZVNKUUtubjF5TmxLcTJ3VDVoekN4WTRJcDI5NDlNbVJVVHQwYnZM?=
 =?utf-8?B?UFRxaW5hcUhPbnV3d3YwL0daNWtIVkN6WGFlSmRuRTZNSTBBMm9jMDVVY2tT?=
 =?utf-8?B?QmhlREg5R0FtNmt5aldTQ2Vna2llSXM4aHFoWm9TYlFNaGJVZ2g3UTVoTFkz?=
 =?utf-8?B?ZHhUUkFTOTNVWS83NFpZTXcxeHY0QUhCcC9ZbmkwQVNEL3lpNnorWFNCalA0?=
 =?utf-8?B?OVVHQW1nZTRFUEJsRWpPV1dYN2tXMEVLcWVLNWRVcGl1RXlaZlZoUXQ1OUdx?=
 =?utf-8?B?bENsSHFXWWVrb0JCNEhjbkl2eG9GckFGNHh6SThOZ0NySnJhTTNrUnZONzZw?=
 =?utf-8?B?dURySkUwdm1QdUl2NUd3Um5OWm9JaEw2LzB6VnpkUlMyMDFoREZkQUd5dDdU?=
 =?utf-8?B?ejV0OEd0Nkd0dGdCNzNGQ05HQi9PSDFXM1I4cFBFK1BCYzZyNng3ZkFuWXVi?=
 =?utf-8?B?c2hWZGpLS3J6V1pITDViNlRQYkpVeUp1d1R4SGJMcmp1TnNKbnE2d2sxNTdx?=
 =?utf-8?B?bWpxc0t0dzEzendneko5ZGJtNjE4WU5FTVFxTmlYZ0ZnV0pwODVwT2RVS1du?=
 =?utf-8?B?Wmk0NGVPL2VpZFRPaGg3bDV6MnB0eVFpZ1gxWktTNHdjNG5mV2J6NHZGYmx4?=
 =?utf-8?B?KzN3ekR1cVRQdlJxbFpYUU1uckluZnRtZGpIZ0wzek4rM1hhekRFU0tka0ts?=
 =?utf-8?B?WkpJK1o2RUVTVVl5dVJVanJPbHBJU3NqOVlqbWxENGQ3QTJEaUVNNlhMQ1hP?=
 =?utf-8?B?eXprdDFrT1lMQWVtSWFPZFVreGJ3eHFCV3A1VEFwSCtrUmVNSEMzVkV5STcr?=
 =?utf-8?B?eEsrempnZXd6N1NZb1dLRGZ6RTc0M2daYWpyeTY0NlgxVG15MlBSRGE2RnVD?=
 =?utf-8?B?MXJNWi9LWEVsdjBKdDJoS3VVa2plRWlHYUJRaDFNOHZLZE5nSmxLcE9peUVm?=
 =?utf-8?B?elJxcUs0U3NTazBWLzB5bjBqRHZ3anpWZ0t0NTNrbXd3OGtiODI2NWRYOW0r?=
 =?utf-8?B?ZEZNcGdsQktvcFN3clNrdkxkSlYzZmlFdUdVQ2oxRFVST1c5NWZxK3daQXAz?=
 =?utf-8?B?SVpQVElTNisrajFWV3RtcWpkNnp0V3hHUlpLY0hKbk9UK1FrZks2eUdOT2tP?=
 =?utf-8?B?NFA3TjE3LzhBTEVCdFJUMitFR20xekljRzFNWVp0dVpRR2ZlVGd4b1FpYm4z?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <273350ED9450B64182345BEC51A15698@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84a90d2-9999-4de6-7341-08dadf71afa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 14:27:39.6900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yYsdO9RNRmjUzDKEiE8IpgF/IuVJZP8j1qMnJZ7U7+nYleWR2lf7F+nJOKSY6fEyLI9Wie0wKnv+6GsPWHqE1q7AFxsRyjXqAp0KIl2SVsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6997

T24gMTYvMTIvMjAyMiAxMTo1OSBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjEyLjIw
MjIgMTI6NDksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxMy8xMi8yMDIyIDExOjM4IGFt
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBBbGwgY2FsbGVycyBjb252ZXJ0IGZyYW1lIG51bWJl
cnMgKHBlcmhhcHMgaW4gdHVybiBkZXJpdmVkIGZyb20gc3RydWN0DQo+Pj4gcGFnZV9pbmZvIHBv
aW50ZXJzKSB0byBhbiBhZGRyZXNzLCBqdXN0IGZvciB0aGUgZnVuY3Rpb24gdG8gY29udmVydCBp
dA0KPj4+IGJhY2sgdG8gYSBmcmFtZSBudW1iZXIgKGFzIHRoZSBmaXJzdCBzdGVwIG9mIHBhZGRy
X3RvX3BkeCgpKS4gUmVwbGFjZQ0KPj4+IHRoZSBmdW5jdGlvbiBieSBtZm5fdG9fbmlkKCkgcGx1
cyBhIHBhZ2VfdG9fbmlkKCkgd3JhcHBlciBtYWNyby4gUmVwbGFjZQ0KPj4+IGNhbGwgc2l0ZXMg
YnkgdGhlIHJlc3BlY3RpdmVseSBtb3N0IHN1aXRhYmxlIG9uZS4NCj4+Pg0KPj4+IFdoaWxlIHRo
ZXJlIGFsc28gaW50cm9kdWNlIGEgIU5VTUEgc3R1YiwgZWxpbWluYXRpbmcgdGhlIG5lZWQgZm9y
IEFybQ0KPj4+IChhbmQgcG90ZW50aWFsbHkgb3RoZXIgcG9ydHMpIHRvIGNhcnJ5IG9uZSBpbmRp
dmlkdWFsbHkuDQo+PiBUaGFua3MuwqAgVGhpcyB3aWxsIGhlbHAgUklTQy1WIHRvby4NCj4+DQo+
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+LA0KPiBUaGFu
a3MuIFlvdSByZWFsaXplIHRob3VnaCB0aGF0IHRoZSBwYXRjaCBtYXkgY2hhbmdlIGRlcGVuZGlu
ZyBvbiB0aGUNCj4gdmVyZGljdCBvbiBwYXRjaCAxIChhbmQsIGlmIHRoYXQgb25lJ3MgdG8gY2hh
bmdlLCB0aGUgdHdvIGxpa2VseQ0KPiBmbGlwcGVkIHdpdGggdGhlIGFjdHVhbCBmaXggbW92aW5n
IGhlcmUgaW4gdGhlIGZvcm0gb2YgbW9yZSByZWxheGVkDQo+IGFzc2VydGlvbnMsIG9uZSB3YXkg
b3IgYW5vdGhlcik/DQoNClllYWgsIHRoZSB0d2VhayBzb3VuZGVkIGVudGlyZWx5IHJlYXNvbmFi
bGUuDQoNCj4NCj4+IGFsYmVpdCB3aXRoIG9uZSBkZWxldGlvbi4NCj4+DQo+Pj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL251bWEuaA0KPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4+
PiBAQCAtMSw2ICsxLDcgQEANCj4+PiAgI2lmbmRlZiBfWEVOX05VTUFfSA0KPj4+ICAjZGVmaW5l
IF9YRU5fTlVNQV9IDQo+Pj4gIA0KPj4+ICsjaW5jbHVkZSA8eGVuL21tLWZyYW1lLmg+DQo+Pj4g
ICNpbmNsdWRlIDxhc20vbnVtYS5oPg0KPj4+ICANCj4+PiAgI2RlZmluZSBOVU1BX05PX05PREUg
ICAgIDB4RkYNCj4+PiBAQCAtNjgsMTIgKzY5LDE1IEBAIHN0cnVjdCBub2RlX2RhdGEgew0KPj4+
ICANCj4+PiAgZXh0ZXJuIHN0cnVjdCBub2RlX2RhdGEgbm9kZV9kYXRhW107DQo+Pj4gIA0KPj4+
IC1zdGF0aWMgaW5saW5lIG5vZGVpZF90IF9fYXR0cmlidXRlX3B1cmVfXyBwaHlzX3RvX25pZChw
YWRkcl90IGFkZHIpDQo+Pj4gK3N0YXRpYyBpbmxpbmUgbm9kZWlkX3QgX19hdHRyaWJ1dGVfcHVy
ZV9fIG1mbl90b19uaWQobWZuX3QgbWZuKQ0KPj4+ICB7DQo+Pj4gICAgICBub2RlaWRfdCBuaWQ7
DQo+Pj4gLSAgICBBU1NFUlQoKHBhZGRyX3RvX3BkeChhZGRyKSA+PiBtZW1ub2RlX3NoaWZ0KSA8
IG1lbW5vZGVtYXBzaXplKTsNCj4+PiAtICAgIG5pZCA9IG1lbW5vZGVtYXBbcGFkZHJfdG9fcGR4
KGFkZHIpID4+IG1lbW5vZGVfc2hpZnRdOw0KPj4+ICsgICAgdW5zaWduZWQgbG9uZyBwZHggPSBt
Zm5fdG9fcGR4KG1mbik7DQo+Pj4gKw0KPj4+ICsgICAgQVNTRVJUKChwZHggPj4gbWVtbm9kZV9z
aGlmdCkgPCBtZW1ub2RlbWFwc2l6ZSk7DQo+Pj4gKyAgICBuaWQgPSBtZW1ub2RlbWFwW3BkeCA+
PiBtZW1ub2RlX3NoaWZ0XTsNCj4+PiAgICAgIEFTU0VSVChuaWQgPCBNQVhfTlVNTk9ERVMgJiYg
bm9kZV9kYXRhW25pZF0ubm9kZV9zcGFubmVkX3BhZ2VzKTsNCj4+PiArDQo+Pj4gICAgICByZXR1
cm4gbmlkOw0KPj4+ICB9DQo+Pj4gIA0KPj4+IEBAIC0xMDIsNiArMTA2LDE1IEBAIGV4dGVybiBi
b29sIG51bWFfdXBkYXRlX25vZGVfbWVtYmxrcyhub2QNCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhZGRyX3Qgc3RhcnQsIHBhZGRyX3Qgc2l6ZSwgYm9vbCBob3Rw
bHVnKTsNCj4+PiAgZXh0ZXJuIHZvaWQgbnVtYV9zZXRfcHJvY2Vzc29yX25vZGVzX3BhcnNlZChu
b2RlaWRfdCBub2RlKTsNCj4+PiAgDQo+Pj4gKyNlbHNlDQo+Pj4gKw0KPj4+ICtzdGF0aWMgaW5s
aW5lIG5vZGVpZF90IF9fYXR0cmlidXRlX3B1cmVfXyBtZm5fdG9fbmlkKG1mbl90IG1mbikNCj4+
PiArew0KPj4+ICsgICAgcmV0dXJuIDA7DQo+Pj4gK30NCj4+IHB1cmUgaXMgdXNlbGVzcyBvbiBh
IHN0dWIgbGlrZSB0aGlzLCB3aGVyZWFzIGl0cyBmYWxzZSBvbiB0aGUgbm9uLXN0dWINCj4+IGZv
cm0gKHVzZXMgc2V2ZXJhbCBub24tY29uc3QgdmFyaWFibGVzKSBpbiBhIHdheSB0aGF0IHRoZSBj
b21waWxlciBjYW4NCj4+IHByb3ZlIChiZWNhdXNlIGl0J3Mgc3RhdGljIGlubGluZSksIGFuZCB3
aWxsIGRpc2NhcmQuDQo+Pg0KPj4gQXMgeW91J3JlIG1vZGlmeWluZyBib3RoIGxpbmVzIGFueXdh
eSwganVzdCBkcm9wIHRoZSBhdHRyaWJ1dGUuDQo+IEhtbSwgeWVzLCBJIGFncmVlIGZvciB0aGUg
c3R1Yiwgc28gSSd2ZSBkcm9wcGVkIGl0IHRoZXJlLiAiU2V2ZXJhbCBub24tDQo+IGNvbnN0IHZh
cmlhYmxlcyIsIGhvd2V2ZXIsIGlzIG9ubHkgcGFydGx5IHRydWUuIFRoZXNlIGFyZSBfX3JvX2Fm
dGVyX2luaXQNCj4gYW5kIG5vdCB3cml0dGVuIGFueW1vcmUgb25jZSBzZXQuDQoNClRoZXkncmUg
c3RpbGwgcmVhZC13cml0ZSBhcyBmYXIgYXMgQyBpcyBjb25jZXJuZWQsIGFuZCBzb21lIG9mIHRo
ZXNlDQp1c2VzIGFyZSBiZWZvcmUgbW9kaWZpY2F0aW9ucyBmaW5pc2guDQoNCj4gIEFyZSB5b3Ug
c3VyZSB0aGUgY29tcGlsZXIgd2lsbCBpZ25vcmUNCj4gYSAicHVyZSIgYXR0cmlidXRlIGlmIGl0
IGZpbmRzIGl0IChmb3JtYWxseSkgdmlvbGF0ZWQ/DQoNClllcywgdmVyeSBzdXJlLsKgIEl0IGdv
dCBkaXNjdXNzZWQgYXQgbGVuZ3RoIG9uIG9uZSBvZiB0aGUgc3BlY3VsYXRpb24gbGlzdHMuDQoN
CldoZW4gdGhlIGNvbXBpbGVyIGNhbiBwcm92ZSB0aGF0IHRoZSBwcm9ncmFtbWVyIGRvZXNuJ3Qg
a25vdyB0aGUgcnVsZXMNCmNvbmNlcm5pbmcgcHVyZS9jb25zdCwgdGhlIGF0dHJpYnV0ZXMgd2ls
bCBiZSBkaXNjYXJkZWQuDQoNClRvIGFidXNlIHRoZSBydWxlcywgeW91IHJlYWxseSBkbyBuZWVk
IHRoZSBvcGVyYXRpb24gaGlkZGVuIGluIGEgcGxhY2UNCnRoYXQgR0NDIGNhbid0IHNlZSwgc28g
ZWl0aGVyIGEgc2VwYXJhdGUgdHJhbnNsYXRpb24gdW5pdCwgb3IgaW4gaW5saW5lDQphc3NlbWJs
eS4NCg0KfkFuZHJldw0K

