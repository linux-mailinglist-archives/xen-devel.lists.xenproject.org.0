Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7295235A5
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326983.549675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonQp-0007BW-Oo; Wed, 11 May 2022 14:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326983.549675; Wed, 11 May 2022 14:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonQp-000792-Kh; Wed, 11 May 2022 14:35:15 +0000
Received: by outflank-mailman (input) for mailman id 326983;
 Wed, 11 May 2022 14:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxTu=VT=citrix.com=prvs=123190e77=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nonQn-00078s-TL
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:35:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fedbcfc-d137-11ec-a406-831a346695d4;
 Wed, 11 May 2022 16:35:12 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 10:35:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5762.namprd03.prod.outlook.com (2603:10b6:303:90::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 14:35:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:35:05 +0000
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
X-Inumbo-ID: 8fedbcfc-d137-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652279712;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rJdxi7CrMvEhLOBOVcaSvEGwAoBAWypsoYAVt6Q+ipk=;
  b=AxTt8mLW1LSJJMYbBLInfNdBJj5Gh4YwShThH/I0SFgM6r80fXIj+Uzl
   FeskSPxt1VWltM/3N+3+oo/agzkaWZX6S0AMGhqWwN/8z7qFgIg+NxVPw
   yc71tiHxsoSc0cwHlmEQt4YPyGceGznJz1i6by3R2aAsRVc7gGfTTQc7I
   E=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 70946513
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:R1h7lKg7W9/wjMmkTQ1zyaADX161WhEKZh0ujC45NGQN5FlHY01je
 htvCmDUbKvYMWrwf9BxPY61o08BvcTSzdJmT1Q5qig0Fygb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlrU4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YRkEAPPWlesRaQsbHjpaH7RG0bziB0Hq5KR/z2WeG5ft69NHKRhveKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI8ehWlh7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJouzmPklEoi9ABNvLZY9ikFdQOmH+pp
 1zc8WOmWg0jOt+mnG/tHnWEw7WncTnAcIcbDrix7PNpqFyV2G0ICRcSWEe7oP+2kUq3UZRUL
 El80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL84QyUG2wFRT5pc8E9uYk9QjlC/
 l2Um9LkAxR/vbvTTmiSnp+Pti+7MyURKW4EZAcHQBED7t2lp5s85jrQSv5zHajzicf6cQwc2
 BiPpSk6wr8V3cgC0vzi+Uid2mz94J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1WdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:De8HjKF3ysnM5DUXpLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.91,217,1647316800"; 
   d="scan'208";a="70946513"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oe1WjfQEyADumebeHtuUidJRUAQcJPLxPDkQai7OnqxVY/dKCcugOtayqIP6a25XDK3prL6M77PXr0l8+XRWbT6TOIM2jTkxKfAuAdQOSGu7/rAgUvDWhSMR1BONIh4gAuX0IPB25B5uL+dDpTTS+l0y79afXML3vzNFCfrxLcIvY+1IVzLC/ERvju6IZtCvKUQg/+AFB76yGkRfL21CBPmk/JP9BtpXix0Y7UHQAler+kUUNLe2R26NQsIOTqGVP1a01jrsrEt3vT+ddl8qVJOb0W3+SVft2HgaHKXYF+dfl4m/Q8qn7ww1fBsOC63HpL510ud3AQOBdrlANfVIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJdxi7CrMvEhLOBOVcaSvEGwAoBAWypsoYAVt6Q+ipk=;
 b=B9Jf6xvwcjL8ub3SUnqyxQ3YBv3vfv9N4N+uXFZJNMt6ySAUAuG4gNe6QNhQdACgrKAXS3UtLfVuuDS00y2ELBiILQLEzrGG4DY81xJQOrHBUzhXzr31iut4sOu5gKmSx2H2DEI+3h04WUPBkEc7Gqj4PVC4WE9WOaYunNPAapr6qZ5VhyNHloQOpSjL9iaYGRtlAYQFYjR0aTZXH2OvnXAfvz3YLqARz6Y9T4lJToD7bPPjgHk3TJVef6BXcWSicnzV1lhM3f44Gff8GWJ7zWaP/8wY3xMP2XoLhN0uORY54cZcCrj8g6dwM0ClCmHUIvx+/Sidgm/O/h5KLXtWNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJdxi7CrMvEhLOBOVcaSvEGwAoBAWypsoYAVt6Q+ipk=;
 b=rw1T+hcRJaGWTYp0PsB1M4gAKVJY/hjXA0CQJ6FR84HR1s439Y78PFMPwdG3k8c8MUIGVS0MGBz+5VwZB8ijCNcgGO31m8yAxYlBlH9rgu19N17zB0hzYFAd9MRDxWesLq9Q/54duh21jjE/0S71PiYGDC50OvGvNe5Ayky1bfY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v4 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Thread-Topic: [PATCH v4 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Thread-Index: AQHYZT9h/psFFcQ9ZUSTli2D9MFhrq0ZuLuAgAAFYoA=
Date: Wed, 11 May 2022 14:35:05 +0000
Message-ID: <9e087a55-8384-b25a-fb94-1ef421c7fcdf@citrix.com>
References: <20220511135929.1823116-1-marmarek@invisiblethingslab.com>
 <YnvFFdBR1tgbOMkQ@Air-de-Roger>
In-Reply-To: <YnvFFdBR1tgbOMkQ@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53d35e0d-eabb-484b-a9ae-08da335b70dd
x-ms-traffictypediagnostic: CO1PR03MB5762:EE_
x-microsoft-antispam-prvs:
 <CO1PR03MB5762E0AFAFC29944F9DCA655BAC89@CO1PR03MB5762.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0CpGsSDab/gvo38dNVwt1sewurDHSQAju0/ber8V+ecg4gTOvqma9qMUEECW109iItYMhAHhVzLGwqf3odpgNmWjVhxVlk2j+a8UXoVoNLQi1obZJSI6zRVBXb1le69DtLYcSuUAKHxpvUF7jt8u7nrwN6USsUdFWsDevw7duZSKxd0tDApBfa50YEVve0FC/WcBfaiTsm4x/qdI5UetVPUMPolAi5P3OtFhPDUjD+RsK30EwrgjtrgS24NCigeXLLhXvLcCPs2E6tSUzzSjZDBO8ATu5ceddzlWkj/+S+Ietkdp23SzbL9cEsm283aOB3IMhjxqxnK0R/My50+t6Zz85HecVaks5GvbQLnexuuGXrOTexAMGlaEvVrLWE/mNRSj0cMQDq/ALmpyii4izp0Adh3Axv3OcnIQ8tOqfwuxWnWN5ZdHZ3vkz0JOPpo0DfQ9ErqJrnTeUZeZE56Eq9tQpbgCDXZd8qxbA7Rfy7Z/RnOyFVVjqzEaHiszP6VjIkRGAHNDYM9mLs8Pg8lHlqmqGBnMeGbsOAze0OIWfIser01i5in7rCwlt3SRU0IlbrNLIPizXzYy/VcLTlC3XwUPLTz4T6KSXr4qN5rAlA6eHk+TnzCJtbJ84xPLdB57rjIyHv5TN2vEUDl36607TTArjodLxOJVigsP0QOn+GFNFBJGbeFX7DlyjZkjQ1EU2N43aEgpqcxP17tXd00bPwx0isCgtHNw8ovqyxPakyAAh01qxbW2NhA8ReD8qORdD1UMjPX1rhEizFyhB60J4g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(186003)(66574015)(38100700002)(110136005)(6506007)(53546011)(6486002)(508600001)(86362001)(31696002)(71200400001)(91956017)(54906003)(4326008)(8936002)(2616005)(66556008)(76116006)(66946007)(8676002)(66476007)(316002)(6512007)(64756008)(66446008)(26005)(31686004)(36756003)(82960400001)(83380400001)(122000001)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZC90dElkMG1PeEdNWjVlTmhyZXlNQi9PekdwdFZnYTZlL2g4ZE9GVGI2NzdL?=
 =?utf-8?B?VnpOdXNjRTVSSGRDY2tCL2QvZUVncHE4S1dmU3g0alFlQW5PVzRKempTN3Bx?=
 =?utf-8?B?TWlBY3RYY21mbjdUUEhTWTJFdGtnWWVjZkMrVEJqb3V0S2M0eWFhV0YvOXNX?=
 =?utf-8?B?eFhmeExUV21zRytOcmFWR3ZFcFhoYTZMUU85Y01lcHMxNG1HVmxxQmhScEJk?=
 =?utf-8?B?c242N1RpRFM5Ti9GeDlzZC9FQmtUS08xVko3YzZIVEpvZnQwa1hqd2dWSnk3?=
 =?utf-8?B?T0EwVDNQUHBSTloxZDNRTVlpSGlRR0RlSGsreWdSUko4aXhnNW1wbkhScjVR?=
 =?utf-8?B?K000TjFxSXpnV3FEZzMwNENKSGJQQndwdCs4MG9lRHFKZHU1ZVZSTGdOV2Fp?=
 =?utf-8?B?aWlqUnlidGJEV3JXVWpzUjBjMXpYM2JjSTBEQ2tIcEc3QXBhQkU1VUxacnhn?=
 =?utf-8?B?QTI1N0FQU214ZGViVUYyVW85eEcrd2d1NW40UjJpTFYvckU4aHlpSGU5d2xk?=
 =?utf-8?B?eEk5UDdOY1FoRFF5RVV2b3JFeGJibDNhdU5GTyt4cVFORDFTamExZTZ3QmdY?=
 =?utf-8?B?b29FcldTOFhoUGxld3VqSGgxN3RWSmIxeDVLUjVHTkR6K2o4TG81N0ZQZVdC?=
 =?utf-8?B?N0FzY3poTW5MbDd3NXdCVEE1azRHR0E3b3M3bjNLUFowVzFkWDRHcDZLWWND?=
 =?utf-8?B?RlNPeXNTMDV6SC9HenJOZ3NGTUlZRUluc1RpaXBmUTdDazJnY1VTYVF4ZUFl?=
 =?utf-8?B?bVZSOWNQYmxGdUZFakxTNE5xUFgwdm5FOHhBUVJWQ3oyaEtTQURkZWwxRGEw?=
 =?utf-8?B?SWpEUThqWC9PWXU0dXJIWjBJR3ptNC9VNlFuTWdEeGcrYzBtQXpYd3AyWVpX?=
 =?utf-8?B?NCtYdUN6Y3BqNkJvZDRNVWdmV0RoV3ZPUjI2TGgvK3NObFk3eWJ2bFBIN0RL?=
 =?utf-8?B?bkU3TDBrQzZDdnhtK1k4S3plNmVWeEFmMjBIZUFsT3ZYMlI0NmpGZDJKaWto?=
 =?utf-8?B?bUliTWNUMUxLVmY3VTlwQWo2QnhVbGJjWnZ4aSsveWRzUlEzQUMrQkRQcy9z?=
 =?utf-8?B?Z25iejUvL2NXUUptemZtZW1xaGZ2Qk5QOU82MEx0YjRwMXFzdVhqZDZsWUZG?=
 =?utf-8?B?d29YMnlYdkdOU0djajEzalVPYWp1b3dVU2paK1JLLzFGNDhYWjhzYUVDTUh5?=
 =?utf-8?B?ZEh2Qi9vM2JDTFdOWGlXL2I3Z2FTaFJhbU43K2pDOGZybjFqaW5kOFZRRTQ0?=
 =?utf-8?B?WndtcVBIV2dmU0xoYWt4YnFWS0tlU1VyNXhrYXhUYWxwTFZnUlA2OW42bUx4?=
 =?utf-8?B?MGtYclhydHFRbGtkRWhQTzkwaTRYdUI4bHordHJ6NFk1bm83LzBJRzlpbVVr?=
 =?utf-8?B?a3JoQmIycUpDL3Q5U01CTzRvLzc0WE8zSkR5Y3gra1FFcmtldThRaHZxUC9J?=
 =?utf-8?B?empqK2RGSEEzWjNJNm9kYlJNUlRzenB4ZWQ2ZHE3eHBhQWkwbFlDbG5WdW03?=
 =?utf-8?B?Uk9qNDhoMXlsbDl3a1VxK1RsOVZOTkJqYWpFRHNBdUlpd25hNkprWVZwcjFz?=
 =?utf-8?B?UytWMHN4VnVKYy9HLzRrTnhoeVk1ZkNIU084UGdsM1Q3NHlMK2loWnA4OG9n?=
 =?utf-8?B?UFZHc3BYUWNJamo0dEZWT1BsdVArd0JMSEhXaXMwRUh4ZzZiYklBQjQxdTFR?=
 =?utf-8?B?azNvZEtqbUloc1hMWFhDdUxWSmtqMERWeSs0Mjd0V2duYXJhVU5mN1h0NEJv?=
 =?utf-8?B?NDJrd0VYSDVTQ0dUQjF6M1lkVzhLZjNSZkFWbE53dm1iVlVNby84RXBRV05x?=
 =?utf-8?B?b3prVHVHaU8yUlNFN1d1bXkyZGNPdDh0RTF3dmp2Yk15cldqdld1c3dzN0xm?=
 =?utf-8?B?TEE5ZlhMRE1EZG5RdnFZeUJyT1ZObzlYSjhKRDFqMjNmYzJGeGRyaDI2K1pK?=
 =?utf-8?B?c1lqakgwTTc1c3hGWngwc2d5VXpDVmhxUnRRVk1xUkJ5Z09ERDZISjhESVFw?=
 =?utf-8?B?bk1YZzBzYnAyWG1Kc1dQQUpmQkpPSFNPZlBDTTFCZmVhNWlUb292U3dkd3hq?=
 =?utf-8?B?RTQ3Wmg0WC9iOGx6MmxSU2N4bWFSelhVTzJhMFZDUUZFVzBRY0RITm43c1px?=
 =?utf-8?B?Vkw2MjNOVCt6ZnFuYTBQSFBkVFlxZlNPZjhlYkY4NFE2ZDZ3cjdnUGovQlds?=
 =?utf-8?B?MnIrSzVDQlJBNXY3dFAybXRIRTFSZlNUdW1IUjNvOUN6eWN0SnJubm8zams5?=
 =?utf-8?B?b3VGci9YbWtPM09aN3Z3NWdPWW1zWExUNDhBN2J6WHpCRDdUcTNKbUErN09O?=
 =?utf-8?B?SkNqd01SUzVXUlRUdENGODBFKzhLSUdkYzNGdVo5VnBxcUlaZVlaZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2A82D2E739F05479B0318638FC67BE9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d35e0d-eabb-484b-a9ae-08da335b70dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 14:35:05.4805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPs1yqZydGhvv2pNJ1b45OMxkap7nkRzXZd+0I1qojpSCqwNfju1O4C7YjSzbSsZjZV9Z0C3oROdi8zAD16hfnZoDOXR5TEBlY5yBylTE1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5762

T24gMTEvMDUvMjAyMiAxNToxNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gV2VkLCBN
YXkgMTEsIDIwMjIgYXQgMDM6NTk6MjhQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpIHdyb3RlOg0KPj4gSW50ZWwgTFBTUyBoYXMgSU5URVJSVVBUX0xJTkUgc2V0IHRvIDB4ZmYg
YnkgZGVmYXVsdCwgdGhhdCBpcyBkZWNsYXJlZA0KPj4gYnkgdGhlIFBDSSBMb2NhbCBCdXMgU3Bl
Y2lmaWNhdGlvbiBSZXZpc2lvbiAzLjAgKGZyb20gMjAwNCkgYXMNCj4+ICJ1bmtub3duIi8ibm8g
Y29ubmVjdGlvbiIuIEZhbGxiYWNrIHRvIHBvbGwgbW9kZSBpbiB0aGlzIGNhc2UuDQo+PiBUaGUg
MHhmZiBoYW5kbGluZyBpcyB4ODYtc3BlY2lmaWMsIHRoZSBzdXJyb3VuZGluZyBjb2RlIGlzIGd1
YXJkZWQgd2l0aA0KPj4gQ09ORklHX1g4NiBhbnl3YXkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIu
Y29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHY0Og0KPj4gIC0gYWRqdXN0IGxvZyBtZXNzYWdl
LCBjaGFuZ2UgaXQgZnJvbSBXQVJOSU5HIHRvIElORk8NCj4+ICAtIHJlLWFkZCB4ODYgcmVmZXJl
bmNlIGluIHRoZSBjb21taXQgbWVzc2FnZQ0KPj4gQ2hhbmdlcyBpbiB2MzoNCj4+ICAtIGNoYW5n
ZSBiYWNrIHRvIGNoZWNraW5nIDB4ZmYgZXhwbGljaXRseQ0KPj4gIC0gYWRqdXN0IGNvbW1pdCBt
ZXNzYWdlLCBpbmNsdWRlIHNwZWMgcmVmZXJlbmNlDQo+PiAgLSBjaGFuZ2Ugd2FybmluZyB0byBt
YXRjaCB0aGUgYWJvdmUNCj4+IENoYW5nZXMgaW4gdjI6DQo+PiAgLSBhZGQgbG9nIG1lc3NhZ2UN
Cj4+ICAtIGV4dGVuZCBjb21taXQgbWVzc2FnZQ0KPj4gIC0gY29kZSBzdHlsZSBmaXgNCj4+IC0t
LQ0KPj4gIHhlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jIHwgNyArKysrKysrDQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9jaGFyL25zMTY1NTAuYyBiL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jDQo+PiBpbmRleCBm
Yjc1Y2VlNGExM2EuLmMwZDY1Y2ZmNjJmZSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL2No
YXIvbnMxNjU1MC5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYw0KPj4gQEAg
LTEyMzgsNiArMTIzOCwxMyBAQCBwY2lfdWFydF9jb25maWcoc3RydWN0IG5zMTY1NTAgKnVhcnQs
IGJvb2xfdCBza2lwX2FtdCwgdW5zaWduZWQgaW50IGlkeCkNCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGNpX2NvbmZfcmVhZDgoUENJX1NCREYoMCwgYiwgZCwgZiksDQo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9JTlRFUlJVUFRfTElO
RSkgOiAwOw0KPj4gIA0KPj4gKyAgICAgICAgICAgICAgICBpZiAoIHVhcnQtPmlycSA9PSAweGZm
ICkNCj4+ICsgICAgICAgICAgICAgICAgICAgIHVhcnQtPmlycSA9IDA7DQo+PiArICAgICAgICAg
ICAgICAgIGlmICggIXVhcnQtPmlycSApDQo+PiArICAgICAgICAgICAgICAgICAgICBwcmludGso
WEVOTE9HX0lORk8NCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAibnMxNjU1MDogJXBw
IG5vIGxlZ2FjeSBJUlEgJWQsIHVzaW5nIHBvbGwgbW9kZVxuIiwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmUENJX1NCREYoMCwgYiwgZCwgZiksIHVhcnQtPmlycSk7DQo+IFRoZXJl
J3Mgbm8gcG9pbnQgaW4gcHJpbnRpbmcgLT5pcnEgYXMgaXQgd2lsbCBiZSAwIG9yIGVsc2UgdGhl
IG1lc3NhZ2UNCj4gd29uJ3QgYmUgcHJpbnRlZC4NCj4NCj4gV2l0aCB0aGF0IGZpeGVkOg0KPg0K
PiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoN
ClRCSCwgY2FuIGJlIGZpeGVkIG9uIGNvbW1pdCwgc2F2ZSBhbm90aGVyIHJvdW5kIG9mIHBhdGNo
aW5nLg0KDQp+QW5kcmV3DQo=

