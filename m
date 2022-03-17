Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C064DC829
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291584.494972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqgA-0000Kd-31; Thu, 17 Mar 2022 14:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291584.494972; Thu, 17 Mar 2022 14:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqg9-0000If-Vv; Thu, 17 Mar 2022 14:00:37 +0000
Received: by outflank-mailman (input) for mailman id 291584;
 Thu, 17 Mar 2022 14:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hAZZ=T4=citrix.com=prvs=068f51ced=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUqg8-0000IZ-J2
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:00:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c9ac977-a5fa-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 15:00:35 +0100 (CET)
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
X-Inumbo-ID: 9c9ac977-a5fa-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647525635;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eGgiwjSdFnXMpx1fH9IxZVdLpg2wRThgHIiNSW6D59Y=;
  b=YdUWGmUb7zI/zMznb22OXxYjELjnS41xJ+NecRQ3lPqHwzJmIAge97be
   QZcnC6eYA+/o0XV8GrgJyO/nO+/BMafbI7oOFgfO3vm2kENESLoCvWM8b
   m7JSDFhLvTZkEuTqR/pFJ1cTUS67Nw7i2OZF0OPdKh9E/XKBa20QTh9ty
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68871149
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JqYG56AvIpWNkBVW/z3jw5YqxClBgxIJ4kV8jS/XYbTApGxz0TFRz
 WoeCG2BPf6KYWf8e4p2boi+8xxUvpPSydBmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vg3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh99
 +dvjL6eZzwbL/OQwv8ibBdBPiNXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4eTamHP
 pZIAdZpRCjOcxx2H3dUNLYVuMu3jyLnNGJ89mvA8MLb5ECMlVcsgdABKuH9eduMX8xZ2FmZo
 mHu+H7wCRUXcteYzFKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTW0n0ymhzwydeFiArNmshqy9aTNzgSwUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb1Eqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzrNAuBRPtfNi2mUBb7zt6oowGGxFAXpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpCL+ItkKvmkheS+F1/ronxezP
 Cc/XisLuPdu0IaCN/crM+pd9ex3pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4EbprUkUoDCLOiCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnnBye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:Oy+TDqPibUerGMBcT2/155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE9Qr4WBkb6LW90DHpewKSyXcH2/hsAV7EZniphILIFvAv0WKG+VPd8kLFh5dgPM
 tbAstD4ZjLfCJHZKXBkUiF+rQbsaG6GcmT7I+0pRYMcegpUdAa0+4QMHfBLqQcfngjOXNNLu
 v72iMxnUvGRZ14VLXYOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LPErXoBerR8bMRiA0HkAgMbzaFBOO
 gg5RPpi7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4bkWUzxjIdLH47JlOz1GnnKp
 gbMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Tol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+83JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9NllVnQ6dvf22y6IJyIEUHoCbQhFrYGpe5vednw==
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="68871149"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+6zHQDs/Lmy+vY4jI4QtSrdT3sP7C3S8cPADXyvNCodkBVvE7Q6a6wD+JwVM5BjUtLQzxuwQKT3mPfX7CMPU7TZpXfiBLXQYA80XOOh/exrd4xwsICRNZRITsEwhN7YVlXtyrDV+c6A97xzPa3s+LssOMSx+GnSHzaJYfJRWNalvs5ibRsPM9wqZvI18m4DMWGkwQ2kXPXkfsDO62/wgmmt24e/wR7r5ZM/mM+8Z0w6gmCg37IfSo4gx8gVDXqPm2ZvC4jxsekEnPtvRhuJAkkiMgeJG55TVsBNvQiwtEKFvNfjS5UHhvmivuuSH8VJieH5WmuafLnh1PobAzrwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGgiwjSdFnXMpx1fH9IxZVdLpg2wRThgHIiNSW6D59Y=;
 b=TIqO84lpLJGGI2DWHKyuXmzDUUfyO+oSrLYHgZpLsRmyjyfDsRjXSG3fvD/9yBnz4E0GKUDBIVq3aXtkBrO7KIojI4ORHoURnbv6B0vyQ74wp1X3c538oxhDhvIgNi4jBllsDFOIdsDnWH8zETKk+Oz5ME/HH/AGttdeeTr//OxqvQv3TsyAwiVEJUaqaWpsIWvHILGAHk7tT08YX/qCyARo1hsiRSmJLROchJOiUuQa9F9gqqccMnhF89f2PjqMpA5uXFTOo28rSfOI+oNwyg0NCy0A2UWzbceV6K/WllQk0PFFg27fLilmIqhRd6e7KT5qn2qz+OuOdgLeBWEfww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGgiwjSdFnXMpx1fH9IxZVdLpg2wRThgHIiNSW6D59Y=;
 b=eQJoFirgqsn2N/ebZhAaKPTq3DRz6Wz93aNTprr8r5ZZWeE9+pw1b0zlfCvN+x1RensbeC8TpDRnH2rRRpL3ka3jxoCXJqp4V9K5G2xZB64mTfciaNkfMK4EiAYvsbtuKVowuWkEjlbRINTblmSr9MPuwraiy6YXQElt6qqfjy4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: Re: [PATCH 1/2] livepatch: do not ignore sections with 0 size
Thread-Topic: [PATCH 1/2] livepatch: do not ignore sections with 0 size
Thread-Index: AQHYOe+gjdXCu7EMK0+5Er/7E5QfQ6zDmssA
Date: Thu, 17 Mar 2022 14:00:19 +0000
Message-ID: <7443a703-6215-1b8f-a6c7-bab606ad016a@citrix.com>
References: <20220317110854.39050-1-roger.pau@citrix.com>
 <20220317110854.39050-2-roger.pau@citrix.com>
In-Reply-To: <20220317110854.39050-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 959d9bc9-3a9d-45c8-863c-08da081e78b5
x-ms-traffictypediagnostic: SN6PR03MB3773:EE_
x-microsoft-antispam-prvs: <SN6PR03MB37734BFFF253385F61572363BA129@SN6PR03MB3773.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7TrtH6F76nGQyy7FjZnd7J2D5TrGL6HhLt+BirwrLp9J+HOalcviJUilVsSVPxVCuRv4rMU10tl1GJyJR3N0k7I4JK6DJoZQRknxiY1iSbUX2M2JWpU+KwZofT2z01cGVRGPFNQIRiuo9H1A96yUdJFspnsYB28ZtKlpX6BWJGYcRQdMTS35EQq7RpgyuvB3fPxBXNke0CZttX/mrOuGvVJMV7poivN7ZSHQWddxOelQijr9pr8uJVV4tK6B+eUUBfpNuccHIBklnotxiX6q/FzZC0cCUkfCvB/zWf5aaLoCip4IwPUIqElxo4VGEywjaffPKpwBlCEsZlTA6qxNzAZ8WcAbYmZh5Nm8Lf3rr53mC9HoIZwR3CN05t8Rx3+C32lAci5f4deEmWh1xU+c0NQz5PqwUdldx1ciaPxpGrsyP15gH5KwY8J1okIy2M3u1xzp3dcfNt5eI0yPAWrmkxrEqhcwMPjwyrjc+Iwvnd9XAegp1WI97+X78efk3RXf+UBjpNSRlMGoCoCSaGsIK17AOxDFIOsJ2BPKKSrF+n1Xm8Q27ti5fGBvneD6ztS384UBpwxx8yB0puteyboi9u+6wYrv+V1wpcXK/5/Flo/jODK4P8Ys4dfYIxH2PLFuYi41sOuPZA7od0j/OIaRDMpRq1VnX2Mot9ggGORGQivV8R80Q903b8ogeNjZg8m4QkabCcai3nsNkYzDkg7+a/RituHZJ6FkfUilK4UMFTu4neqpkSpsWIu8Xlo89LTCvqwJr/xxyRGgXJluuYaMhA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(53546011)(2616005)(6506007)(6486002)(508600001)(71200400001)(38100700002)(5660300002)(2906002)(4744005)(82960400001)(122000001)(31686004)(31696002)(316002)(38070700005)(110136005)(86362001)(54906003)(66476007)(8936002)(66446008)(64756008)(66556008)(8676002)(4326008)(66946007)(76116006)(91956017)(36756003)(107886003)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R051OXZRZGRDU2trdEpYalRIcmF4RXgyQmhMZnJLMm9yQzlVRVp1eGFNbFZ1?=
 =?utf-8?B?YWdQY0lBWFd5ZTBHeThnL3JxVXJDQXRjajZZNFFXN0pvc1JZMlpoN0s5RlFN?=
 =?utf-8?B?b1QzZW5LZXFSaUZrT0pBOU93MVFNaE9ZaUgrUjhSRWxtMDB1bnpxT3dHSUph?=
 =?utf-8?B?UkdqU3Budm4wN09zRDBkeDhqcVB4V0xaaHZuMDVsY3o5S3dVRmdmb2Y1dlNT?=
 =?utf-8?B?a2IxQUZpYldPZDNXMkI5UnBVeDFDcDY3aytkdk5KR3l3THlwQVl0MlRGdDZV?=
 =?utf-8?B?UkdZWmZlMmJyVW9YRXZ0ZjZsUkFZRVlMYmtTbEN2NS9rTDVDcHR6WTVOZkVT?=
 =?utf-8?B?NFhNbFo2cFBhL3hKcCtnTzVtRnpyUHA4clNmRFFUSU9JNFgxNnBGTlBCL0lz?=
 =?utf-8?B?Z3VnREJLRmo4RHNOWFdUS2ZzNnF3ZDl0dktWUWV6dUhsSFRTd2xTQ0NYMHVl?=
 =?utf-8?B?NWlqZHlEYmR0UHZiZkdhYjFNRG9zTG1zQlBZdldjdk1idXo3T3ExZ0YxQXhP?=
 =?utf-8?B?K1hUZjJwZFVUU1o0THFJR3VBRHNwYUhkWVNCbVZwSVRtZDdTZ0ZqOFBGMnd5?=
 =?utf-8?B?anZDWVNKNk5scG11aXNJQUxhOVp2dkVtUGJUc2JJa2l3V3M1WUVJa2ZWQzR4?=
 =?utf-8?B?RUJOREFWbzUrVTJOc3NJWUd4SEw2Q2lZdWkyenFZa25sdVRoNzR3N2c0WUdu?=
 =?utf-8?B?SjZGZG1CTWFFSnQ0NDllUzN5ZklFU0xmV2g2WWxRQ2tQVDR4VVZncGZaTTVB?=
 =?utf-8?B?Q3lsTVByVjVyTUFDVzU4eThwSlg4VHcxVUo3aVY2bzBtblJZZGhJVTl4bkE3?=
 =?utf-8?B?NTJLWnFmaUNScHN1YVdlck1PeGZnd3A0L0VJaXFVWlgvcEo0OFBuMENqQi9S?=
 =?utf-8?B?SW9iUmwvcG4rcUJjYnVYMjA3MzBIYWhsRzVDdk5GSjBEVW5NQ1NZeDMyZzR3?=
 =?utf-8?B?K2k0dkJkZG55TmtpTmZEajVyZC9ad2dJUmRGNnBKUGVoZFBMVmg0bmgvRzRh?=
 =?utf-8?B?YTNRWkU3b09oMHdGR2hIU0x0Njlpd0JWVHV3SDdoUXZHMDlnRzNOc2Mvd3dQ?=
 =?utf-8?B?ejY2YU1JOEViSncrUW9oOFdscUdvZFhYRHlXem5TUTFrYnV1UXpQNHJ3a3ZC?=
 =?utf-8?B?QVo2STFLRDY2ak1LMXpWODAwS3djQWgybXg3NDdWNGlpeTlpMjlNWmFaWndr?=
 =?utf-8?B?MUFQckZMRXhQeXNySkgyTXQrVHhqWm1JZkNCeEhLbURyR04wVjFubmU5bWNC?=
 =?utf-8?B?Rmc3Qkppd1F5NEFITitUQWRRZWxicWk4QjZzbzdXNUVHMkRpbFRPcUtKRzMz?=
 =?utf-8?B?dEEycXdqaFNUQUtSQ2JlTStIallvMkRIYmtXYTBlejlXb1VaaFordHAxZEIv?=
 =?utf-8?B?emFIa3p6eFhGdThiaWVSNEdZNldBTURERkVCbEx0RnhXMEJ4TCtnd0hEcjRQ?=
 =?utf-8?B?NFlhVnVpcGg3RE9HTS9qZERYN3NzR25XcFlaSUxsVFAyMnh3WUI5STZrbGVN?=
 =?utf-8?B?S2FKYTdqblJlK2lGU2UwN25oVTl5NEFGMFE5UEVlbEtGN0lFajRlbWI3a1pH?=
 =?utf-8?B?WmpFaTE2d0pub2VWbjRoUjJlTndTSkozUmQ2U2pmNURVZ2tJeGhoU0d5S0pv?=
 =?utf-8?B?c0lrVFRldGtuYW9rSmRxMHpnczNReWZodlM1UHVVYnk5d0Q5azNmSU93Q0hU?=
 =?utf-8?B?cmJjZEJiZk9nVmxnVEp1dkwyd1hGN3FxMVN6V09VdWRvbUwzYVdCOFBFbnVW?=
 =?utf-8?B?NXh5TnhRZXhhRkh5V1l1QmczUzgzSmo2Vis1WDhTNkFhNTAxa3VhYkpzaXpM?=
 =?utf-8?B?UnUvZm9BNGtKNWpmKzZLQm1oRzlic1BuR1J0TWs0WW9DU3dlQ25ZcEx2SEJY?=
 =?utf-8?B?U1RjdlE3MjFSTDNEUmdXMFg1cXZZTXNUUUJHOGZHTTdCQnJlbzFzYlIxeEdM?=
 =?utf-8?Q?fvC874ECVqUINZDfpzfjhFFA8gfZf8fk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E38FB8DD642CF4FBCC7733719D77222@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959d9bc9-3a9d-45c8-863c-08da081e78b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 14:00:19.2612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUrwjeWgm7UBaJGyvP2PbYXzC5VWXKeCgezv++DhofZslGKEtH4iPNR1wBgLQPgnbPmlxSIA9oRAXM0KgD/2i2A4L6cGuVcQLtY567rGmYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3773
X-OriginatorOrg: citrix.com

T24gMTcvMDMvMjAyMiAxMTowOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBBIHNpZGUgZWZm
ZWN0IG9mIGlnbm9yaW5nIHN1Y2ggc2VjdGlvbnMgaXMgdGhhdCBzeW1ib2xzIGJlbG9uZ2luZyB0
bw0KPiB0aGVtIHdvbid0IGJlIHJlc29sdmVkLCBhbmQgdGhhdCBjb3VsZCBtYWtlIHJlbG9jYXRp
b25zIGJlbG9uZ2luZyB0bw0KPiBvdGhlciBzZWN0aW9ucyB0aGF0IHJlZmVyZW5jZSB0aG9zZSBz
eW1ib2xzIGZhaWwuDQo+DQo+IEZvciBleGFtcGxlIGl0J3MgbGlrZWx5IHRvIGhhdmUgYW4gZW1w
dHkgLmFsdGluc3RyX3JlcGxhY2VtZW50IHdpdGgNCj4gc3ltYm9scyBwb2ludGluZyB0byBpdCwg
YW5kIG1hcmtpbmcgdGhlIHNlY3Rpb24gYXMgaWdub3JlZCB3aWxsDQo+IHByZXZlbnQgdGhlIHN5
bWJvbHMgZnJvbSBiZWluZyByZXNvbHZlZCwgd2hpY2ggaW4gdHVybiB3aWxsIGNhdXNlIGFueQ0K
PiByZWxvY2F0aW9ucyBhZ2FpbnN0IHRoZW0gdG8gZmFpbC4NCg0KSSBhZ3JlZSB0aGlzIGlzIGEg
YnVnIGluIGxpdmVwYXRjaCBoYW5kbGluZywgYnV0IGl0J3MgYWxzbyBhbiBlcnJvciBpbg0KdGhl
IGdlbmVyYXRlZCBsaXZlcGF0Y2guwqAgV2Ugc2hvdWxkIG5vdCBoYXZlIHJlbG9jYXRpb25zIHRv
IGFuIGVtcHR5DQphbHRpbnN0cl9yZXBsYWNlbWVudCBzZWN0aW9uIGluIHRoZSBmaXJzdCBwbGFj
ZS4NCg0KVGhpcyB3aWxsIHByb2JhYmx5IGJlIGZyb20gdGhlIGxmZW5jZXMsIHdoZXJlIHRoZSBy
ZXBsYWNlbWVudCBpbiBhIG5vcA0KYW5kIHRha2VzIG5vIHNwYWNlLsKgIEkgdGhpbmsgSSBrbm93
IGhvdyB0byBmaXggdGhpcyBjYXNlLg0KDQp+QW5kcmV3DQo=

