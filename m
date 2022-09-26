Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E55EA97F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411922.655054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpeJ-0007DJ-6c; Mon, 26 Sep 2022 15:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411922.655054; Mon, 26 Sep 2022 15:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpeJ-00079s-37; Mon, 26 Sep 2022 15:03:59 +0000
Received: by outflank-mailman (input) for mailman id 411922;
 Mon, 26 Sep 2022 15:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0pF=Z5=citrix.com=prvs=2617546cc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ocpeI-00079m-D9
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 15:03:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6efed4e8-3dac-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 17:03:54 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 11:03:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5125.namprd03.prod.outlook.com (2603:10b6:a03:1ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Mon, 26 Sep
 2022 15:03:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028%6]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 15:03:48 +0000
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
X-Inumbo-ID: 6efed4e8-3dac-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664204634;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5SSxavPw4xWYJetbat/VS+AdMCPlzzJjW644APJlZMw=;
  b=euy97bLjzwYMjY5YiqVHK3AGqOx9zPLVWAq83DkQaDhWAyepr4OHSidv
   Jb7zzAP6BYe2S3LI2HjHepqYSHo0jjn0Z0F4JQIaLt7+n93dc36I2gBMk
   DSVxtFLVQPcNPZzQY+ef+4w98woHs7jrxUmvlCFauA5/w5utEjcR0UPs2
   M=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 81789166
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ADJIRK+Hzdp2U+XeLP7XDrUDQH+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zAbUG2DO62DN2X1ed9yad+18UlUvsLVmIdrQFRprC88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EI14qyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGHEcVL64q6u9OHkZc5
 6MnbzI8SQ+PrrfjqF67YrEEasULCuDOZdtakFc/iDbTALAhXIzJRLjM6ZlAxjAsi8tSHPHYI
 c0EdT5oaxeGaBpKUrsVIMtmwKH02T+gK3sB8Av9SakfugA/yCRY1rT3PcWTUduNXchPxW6Tp
 37c/nS/CRYfXDCa4WrcrSL937GR9c/9cLMOFIeY599Nu2ew+Cs3DDkpdgOUj/bs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c99ZCegz8gyO4qvS/QeCB2IAQyJBadopr8s/T3oh0
 Vrht/PkAyZ+9oKcT321/62R6zi1PEA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 w1mtwA7jrQXyMQNiKOy+Amfhyr2/8CQCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnwjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:TFEmMqG23eKMyO8ppLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; 
   d="scan'208";a="81789166"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lczosvXNm0f2zVXBNTohLAsEMG3eA8MkW3qwvjPUaoALmT8THuIL4Xo5gnimh3R1yBQII2+crW1MMgvK94Xjd6nxO0BlqksfvXLRlOCYQEMwYUHKpNZBt7ogW4ZndBcFVAy8011Dk5DX0+S/uPta14c3rzx1ZuM+BYaGyzh0ts9ICasfBJ9KZ66Fslmq9Q7kIhDCxpBU/jUS+SAEeS15fJ7xkx/CUr2LDueBn0PiRmTbIAUvcbii1P4gTSmJ1ovkoqQP+r1KkDiJPcRGu93EUQM3i3LFrps2jlGUAGPf7FRzO7Pb1F0yKBgzbUF6agQBXjIpCn2zYYj3YFdVFNBY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SSxavPw4xWYJetbat/VS+AdMCPlzzJjW644APJlZMw=;
 b=af521yfhI/kip2i4Edt2KRLpSTl2+kUYCExvzPhLXa/34Y/9WmlZYzfKfGg5w0CqjcTxAPPxI6FwVeavdpLG0tZTkyl4BkSa5/GqH+J9BGBo4jTXaoXVEVLqP+Lvri4FSB7+7VWV1ZvXtVT6/xCYCaMThdQPCRIj0qy84dl5kds8MT3ZGNE8vhjHSHEG1YaeBK/WmZc55C9fsyN1GunMZmhZqgANG5c3Vp5g4q1WsHx3hw+kmXIFSvGYjl0eVjJOug9PshwnMRBrUcYwtKnUTJIflh+i7cpS/uc0MUox14NnZVvfItTfTb0TBYhboBFGL+AtYpCqqV75Uuu8PtSSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SSxavPw4xWYJetbat/VS+AdMCPlzzJjW644APJlZMw=;
 b=FXFk0YYaUeD1qbxLnFGCNARk/c363mgW2JwFpphPiyyfR7Ju6Edb+Gdaj54I1Q9ZewWxs5zKsp7+IwtYsHLyV76qC3nQMaHLRwDjenHiFFHKXPv6qzroHm8hDJslP29+XTgJ1DQNQPJNScZ1c8fs9Yf7XwRfFWUJXyXGbjNaJUE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] drivers/char: Fix build when CET-IBT is enabled
Thread-Topic: [PATCH] drivers/char: Fix build when CET-IBT is enabled
Thread-Index: AQHY0ZgJqCa/HgBJ80OfcMoFcfGuLq3xog2AgAAtHYA=
Date: Mon, 26 Sep 2022 15:03:48 +0000
Message-ID: <838577ad-dc00-d440-ce96-56a85ff7cb83@citrix.com>
References: <20220926110547.21287-1-andrew.cooper3@citrix.com>
 <b2bfe781-58dc-06f7-aa7c-0a2ef6af7e03@suse.com>
In-Reply-To: <b2bfe781-58dc-06f7-aa7c-0a2ef6af7e03@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5125:EE_
x-ms-office365-filtering-correlation-id: 198d4c66-52f5-40e3-27ba-08da9fd050e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mAfQ0FMahnA3PK39BNhdSgfRW/IGulRaidyooNgeSBieIUIxgMTFv7FR9Pef2DWCtFYkrMi5WMUZjKkJ+c7/ynQdWsak8+TZfmBsovTHCPk/R1jfwwViS28G0aRR7yQhRMc4nNQ6g/Nr/nr3kbUKbGLc+ZOREwHqi9hwPuiPoDaq4fIvLs7BiS8vFE0hLE560VQqWYZg1ermV/U9uSvb0/v5JkzdpOpuPUxHub3Jf2GEpqXjzGoSbrsKSGxlTNOK7WQMkSP3YAhlEEFqUd+FJchfBSII9Lmvkw2DHqcoi/OZ4QKB/jo33lcE+8rDBp+2tHU4CKlkZdKm0H1yg47GeQEQKWKU7JL33l9Bl3XnHVdNjz43HUtutykR2ZauJtpzKAjVd18hiD172OH73oA3MdhhPEi7YGT4o6v0UlwKclXVVPSJFDvnUjrTQsNFXktVWiuZSZYr0GBrn2D3a9KGaxqPy5IqUxwWFvW8gew/AGOM82vBedGa3x0y3HayLmYk4ZMdBCWVatHMlKJricUKEEcHpMCNSX8isIhXiM5wcgVkd5wQ4Y4gLicNkmpmnAmmp+T7SRmhEoxhSvvXippS9h42zFr+JpFRSir6IWANEPJu9LPiv+f+ZmIJRv4kt4qPrHY4nKKb140du9cB8K9PIEuwKWrlkv2jgKZAvrfQZ35DxAQH6yXM7I5dRJ1QH0Pts1zCbPp6mdppA6btvQgaQQvHPiuES19yhHfUHhBzqLy0XSbMnniMMuwlFm3FrlpAjRDFaSAG7r3N7U5h23Nce5e2ty0hqPHOlviHQ6cLO7w2RI5n68vlPyPBMpICcsXsBcXe335C9Tgxex19djh95qEjOjUA981d8mYQpQXfpMY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(136003)(346002)(39850400004)(451199015)(36756003)(38070700005)(82960400001)(31696002)(86362001)(38100700002)(122000001)(2906002)(5660300002)(4744005)(6486002)(478600001)(71200400001)(91956017)(4326008)(66446008)(8676002)(76116006)(64756008)(66946007)(66476007)(66556008)(6916009)(54906003)(316002)(8936002)(186003)(83380400001)(41300700001)(966005)(2616005)(6506007)(26005)(6512007)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0ZJVjU2T2p4ckhmbHVWbXBXa2ZxNVRDTDcreUpIMlNrU2NVVjBmSTRSbVdG?=
 =?utf-8?B?cWExdXE0Q05NeFRnTTY3Z0hTa1hhdk1sc0VvRTBNMFhuUk93dmxoMFBtKzZh?=
 =?utf-8?B?YkpNNUE5OUlOQUdnaTdZSm9TckJYNmJyR1ZLSStjRnFlZW14WUlYcURnZlFI?=
 =?utf-8?B?R1QxdEFoVVJTTVRick4wK2xvblNWdWY2eXh4NVN0cnNWY05qQndNWUUrMytq?=
 =?utf-8?B?dzFkbWcycklUYVBKVHAyQlZaQU9La0hRS0c0blVjZEpZNi9ZUEN6ZmxraXpi?=
 =?utf-8?B?NUNQOUJpdzRlcUxHcWJKNThGS3d5NXBsZ0V4eXBTczBPN1RaQVVWQjZtUnZo?=
 =?utf-8?B?UUxKZ2R6T1JEVHFkM3poK2xTNVdtaS96QXl1NEhDS1IwM0x3QnFKdmxtNFN3?=
 =?utf-8?B?c0QyUkJDYVJZWXRrTEw0YkNQWVhYWjRFVkU5Z0RWR1VSRmNNNGc1ZGMybmhP?=
 =?utf-8?B?MzZ4UkxrQU1oT3NPWUZDRTBFd0QybUIzdEYzRnBJRzJBTmp4QXVvUkYvOUVB?=
 =?utf-8?B?RGJRUGZkcDdKQlBSRDZhSlk4ZG9MbjNxT3M4WVl2VytYZW5xeDBzbnpaaHVR?=
 =?utf-8?B?cndzS2x0K0FKd3VDTVQ2Slp5T1F4TTdjekVzdzJWZUltSGtoM0FJb3MrL1Az?=
 =?utf-8?B?UUlXV1lhditoWXZHNTZPUW1YS0wrYlc5Z3Fwb056K2p6RE1zWDNabW4vc2tI?=
 =?utf-8?B?VFNodkgrekVkZzJtaHNYRWw1OFdKWlpWWHRKZi9Od1dUMmVkZEZsR25nT05H?=
 =?utf-8?B?VVptNE41YWdEWThGbGtQbFBJVkcySXU0Q3J6OWI4L3NzUEhjOFdiQ1RycmtC?=
 =?utf-8?B?YUZCTXA2VldxMWlRMEF5a1BueTdOeFdMajltUDNBcmJFenQ5TjFBNXFvNlgv?=
 =?utf-8?B?aGRvT09yaVNrZlNDdHFFeUpVTVFtYXdta1o0NmRxazhGaVZ5ODFISEhrRTVj?=
 =?utf-8?B?RFVQRzJpSVdhZTN3L1dlS09ZRzcwaGhrOEV2Z05mV2pqVDZ0RFpiaXU2MWlv?=
 =?utf-8?B?aGtyRXUvNGtHNlRRRG9RaGExL1B6U0ZvK2JoTkg5bXZVQk9oM0NZSTNLUmo1?=
 =?utf-8?B?TmZyRTlDSlpvdHBHZjF5ZWt5cXJ4VkNyVU9aQ3lESlpCWFl5UlZ6a0I3TTEy?=
 =?utf-8?B?MlRsTWJJRkRVWFhObTI5YlQ5ZWQ3YUdvT0V3bjJlTDRVcHREVHpNeVYrcWZ3?=
 =?utf-8?B?Sk5iRG0yZUZRckg4RDhvVGNTYUwyTU9Bbkw1eG5YM1hSMVQzb1dkNjIwK0J6?=
 =?utf-8?B?QVN5aTN6NytleUZDNHc0OUk2cVZPeWJBNGJoQlk0M2YrRTVJYWg1dGxaaHRk?=
 =?utf-8?B?RTAvTDZEWVArT2U2cGpxUk5rV1NoeVpiR21PcWNqVXdKN29WcTU1TUVtUWRT?=
 =?utf-8?B?aElER1NmY2t2aSsvdEU5VGRKS3d2eHRlVUhvVGU3SWJScSs1eXhBNEN0djZq?=
 =?utf-8?B?UUZhRTJtTmV4TGhuM2VaaURnR252SDByK21BTmdwZmpGckFZeXZCM2g1Q28r?=
 =?utf-8?B?dEh3MDJpYTIyeURyZzVPMUVpbU9FbXd2Q256VEpJMk1Ed0NPWEtERHphK1dK?=
 =?utf-8?B?UFNnMTNIK21FbC9pWE9EVmk3NGlXZ1B6WDVwYko1T0U0czhFU0dOcitiVzRT?=
 =?utf-8?B?VlJ2VkVVOU1yYms5SjZhSjlpcUZHYVFoUlBaRVV5UENldXcwZUZxU2w1Y0lh?=
 =?utf-8?B?VVhCNXhHTFplOUlUSFZxUURkNjM5Q2UrQ245ZitLdndWeHMrdklJdXNLc3Zn?=
 =?utf-8?B?YkRLQlJld0o1VkkrQXRRUTltMFhqbS9WZUhVaEVESi9JeEM3T3NyMjJsd2xH?=
 =?utf-8?B?TldQWVRIMy81SVBHcVNBb3g5V05VY1BKT1FYNlk1b01zSWUwSDhrR3NXVjVt?=
 =?utf-8?B?WHRyMTRJeU1nQ0o5cUZlWFY4aGh5WkVlanRVdjNlM3RVV3BVMGRHdWVYUGJa?=
 =?utf-8?B?ZEs0ZVQ1ZVc4WHVCbUd6VnNiQXhOT3psM2hBeTRPZ1RDaUYzOHFMdlpRTkZQ?=
 =?utf-8?B?ZGtpMnUrTWZNckhNYVdrcFBiNS84eGFZWUVHa2JKdXJ5emlINUlRN3NTS3Q2?=
 =?utf-8?B?azQ1K3Fadkk2YnRzWGxkY0RpOHNzWmtDNGp3R214cUVMUUtRVUZMMnZhMTgx?=
 =?utf-8?Q?kZDEQOMCgxqllEsyS7OXN0yOn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D68412884DA84438DBF460152607E70@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198d4c66-52f5-40e3-27ba-08da9fd050e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 15:03:48.4799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IS0vtDDtl5lRWpJcc0NlQkefC+utGbhkGZdEtkR9dHgJpHaB9YnabFRw9fjc1EXs/oCO9to9aM48OVELkr6cx52p8tLyolji3Ylku9ER980=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5125

T24gMjYvMDkvMjAyMiAxMzoyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjA5LjIwMjIg
MTM6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBodHRwczovL2dpdGxhYi5jb20veGVuLXBy
b2plY3QveGVuLy0vam9icy8zMDgzMDY4OTUwI0wxNzYzDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+IEZpeGVzOiAwMjJl
NDBlZGQ0ZGMgKCJkcml2ZXJzL2NoYXI6IGFsbG93IHVzaW5nIGJvdGggZGJncD14aGNpIGFuZCBk
YmdwPWVoY2kiKQ0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KDQpUaGFua3MuDQoNCj4NCj4gSSdtIHNvcnJ5IGZvciBoYXZpbmcgbWlzc2VkIHRoaXMgZHVy
aW5nIHJldmlldyAtIHdlIHdlcmUgd2VsbCBhd2FyZSB0aGlzDQo+IGlzIGxpa2VseSB0byBiZSBo
YXBwZW5pbmcgKGFuZCBJJ20gcXVpdGUgY2VydGFpbiBpdCdsbCBoYXBwZW4gYWdhaW4pLg0KPiBB
bnkgbmV3cyBvbiB0aGUgc3RhdHVzIG9mIHRoZSBjb21waWxlciBzaWRlIHBhdGNoPw0KDQpOb3Ro
aW5nIHlldC7CoCBUaGVyZSBhcmUgb3RoZXIgbW9yZSB1cmdlbnQgZml4ZXMsIGFuZCBvdXRzdGFu
ZGluZyBpc3N1ZXMNCndpdGggdGhpcyBvbmUgKGhhcyBmYWxzZSBuZWdhdGl2ZXMgdGhyb3VnaCBm
dW5jdGlvbiBwb2ludGVyIGNhc3RzKSwgYW5kDQphbGwgYm91bmRlZCBieSBubyB0aW1lLg0KDQp+
QW5kcmV3DQo=

