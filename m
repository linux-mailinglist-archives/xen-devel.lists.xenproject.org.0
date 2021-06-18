Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B203AD45B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 23:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144992.266803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luLug-00019s-2A; Fri, 18 Jun 2021 21:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144992.266803; Fri, 18 Jun 2021 21:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luLuf-00017C-UB; Fri, 18 Jun 2021 21:20:29 +0000
Received: by outflank-mailman (input) for mailman id 144992;
 Fri, 18 Jun 2021 21:20:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luLud-000171-FQ
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 21:20:27 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eccaab4f-c6d2-4081-8143-e1ec20aedaf6;
 Fri, 18 Jun 2021 21:20:26 +0000 (UTC)
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
X-Inumbo-ID: eccaab4f-c6d2-4081-8143-e1ec20aedaf6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624051225;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ARBXJeOVQw8T8Xec/bmCX5aULsG3S/oNo7tvPb4YRk8=;
  b=G+UG6nTBsC121f/ifB3uuv1wkpEBqcRUUeP/poouP/CqRCTrt3bIx7Af
   9QLt+Y7AtDb+z6nuZI/U7xRUIAPljRWTrUEbZavS+SPr0wi21+leIb1pW
   1vqgGB/iHwK4JjOVpq1dnG+bDDksqR68O5HyHGzeQVb2XGeX2LcfJHQQK
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: b+ETk2dl0f5Ytp4jv7vGIZLl2GUd+XuQXhxgNn7NR8bCbv0UqO8z3mldOXFCJcWxC54WEHteB0
 En0H1f0n0qU6LcvMk+wbZ/qWWdy9LktvbaV/T6L3eJ4JlPXJTJEUbG4SHaYBEfBsSlLP2jN0AX
 c1392C5WCcAY2H2PIEFvQasM+7uNrX0ciHwn+Ad/ptmTjheu3/TSwzt75tSeavb5L3fk6bRCJb
 rgiXVYxjOKRCuCiUlueh0jAqC7XO2cKz8Ger4xiRqKzl80I1RnwarWWeNRUTotGelYZ83zMh29
 Ov4=
X-SBRS: 5.1
X-MesageID: 46494394
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VlQ8X6xO97x3xys/F4uxKrPxteskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjkfZquz+8L3WB3B8bfYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Bdmu1FeafN5DtB/LXHCWuDYq8dKbC8mcjC74eurAYZcegpUdAF0+4QMHfqLqQcfnghOXNWLu
 v/2iMKnUvaRZxBBf7Ld0XtEtKz6eEi0/ndEFc7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+k3bnpi/uxqUTvOGk5spIBcSKhMRQAjLwijywbIAkf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyCIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ+e1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh77D3xHklV6voIRiKrrzOSI
 JVfZjhDbdtABCnhknizy1SKIfGZAVqIv/uKXJyyPB80FBt7T1EJgUjtZcidtppzuN0d3B+3Z
 WyDk1frsAFciYnV9MIOA4/e7rANoXse2OBDIvAGyWpKEk4U0i94KIft49Fmt1CPqZ4lqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46494394"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irf/RhW85TI0KZjdqkFwCKEOwDOJ5pzyjeQDGvsR41ZocYE6/SZaOU1AGcUi1FEoMf5nLOltf79EXQRSsLn+HdQ19/91yVaXeJJ1tXGrFBMhuoH0BsHzXQpiLpDfovcqFVd20KkoY6pRIQybeGrxXuaPyM8/T+kVuxfiOgUs5OR8cm0vNGIiOmq+Dsz1o24sEFrsS+mS5SeVZN7Dn6R8QIoahiZ/3eHLtm1OmkGicpTs7kcyIJUFqNdlSRBV0cc1rU3F6SH2Wy39s9lCmELd1AswkhtXg3v1XUo8VwQrWxaJFcqllpYHm8zo3r8vM4n3aPNfIgblxb9GyJR0GoFZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/oTuQZ2LTig2J7h9rI2ap5PGwt1R20OK25TxbnMrp0=;
 b=hyaZ5d6FrzDp6Nii2qcbGCqrIJYZlqvC+E4AKeHfU+7XiV/KyWMoJ0bF6ZoSB8TCkiLUomDhPiNH9BrfrLX06xEwVygrSB+HMNsbMmudTwk61eqTpLCyZMxyp69Xp3ZCJDq+kO6mPDRBTNDGEKswDsmcztE4Mny3pvaDQ3UUzMloLGASg7plPtJyONrVddm/TcD1XuV6A5OsAS+ryvpSbXxvwz4N5yKKZJZeqwnrKztbQErfw0TD0bFcJJ5ah2DpNDjJYDn2WRa2a27frsM2/wMp0UyJL4KRNwmziwTx3sSnxHcfr3Cu4vtwbNJ7jHsVd3lzpxiAc/LTL3AWfYBZhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/oTuQZ2LTig2J7h9rI2ap5PGwt1R20OK25TxbnMrp0=;
 b=dz5cz6pkVwp7ZWfC2CMET5qgPQW5pCnBygXIGZkCuQha1yd7n+8evJW4b+QlaGrMrIjBscHH5tFaxIg++zAQ4on8R3JbD2cZWNh089/H0toOBV3L3TFLoWx6GqHobf853id+B4T3XUSR2iPgWsx40sWwpqZaebl0fNlYD5TuWSs=
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Tamas
 K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Juergen Gross
	<jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	<persaur@gmail.com>, <christopher.w.clark@gmail.com>,
	<adam.schwalm@starlab.io>, <scott.davis@starlab.io>,
	<xen-devel@lists.xenproject.org>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
 <c8bd347f-cf14-8b86-81f7-51c035c5c972@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
Message-ID: <3a86c791-e508-36a4-a48c-6cdb810f81f9@citrix.com>
Date: Fri, 18 Jun 2021 22:20:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c8bd347f-cf14-8b86-81f7-51c035c5c972@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0036.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::24)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 668c94ed-9d20-49e4-3ae1-08d9329ee0a4
X-MS-TrafficTypeDiagnostic: BY5PR03MB4967:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4967784069E78A1835CF78A1BA0D9@BY5PR03MB4967.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3csH95tpjbSHJ78fyvBnigyvoqf2TFK6wK4tfmCeC+ACp9+k3N1ZMa1kVG8HCzk84wBDA4i0Tcsku0V2YtRtAabFPfy5s3l/6xL/u+WAfcbU+rLO4n0TcBAD8sNpCQWSHBBSgFN7qldQ0jYn2BWI5A/4EA4zl6m8h0Hd4RszctJcDt9p2FHEo7icQ36djJM1KzpBwRpmkVbLCowFLHyGmBAVAUtSt0m6T0rY7S7/xL2MyQBfbuVA16y2+3mC6nf4kHi+qjFqLFNFmI6mILX4iPJ/1yv5aWgYrWM1AgL/473mtEBd9cQf191GF/jTZJL4JAvK0q9vMIFbiDR1T9SdskhqzG2tBF4elZa1foQhqjNRhrzLjNt4Fl0sjfXofYZxvt2MGrMD+ytS0ZCBlNaFczbZNnL1VWkWLJ5k2gwmIYVGd6WHZewwrYywmZ5jcXahZcZvvGBmZq09iazr1TTBed3bUyVQHe0UhOAl4rlFpc5XfGQkhMj+77E0y6ooulDyE2rXi6ah06Ry7mXi19hbyh2cMOa1OBLxCvntMuiNB9foZvYrbhZYkXs4KC6ZMLLaIJWZyM12lc1J8iX73PjkPptzXVWvvMI79oHPV8w7sz/fF1FDUDTzyPOZrp8ORpWuEzWI/H6/d+5Nm3mBhw1RQ7geReUe0a+eQd+dJJ2UB9kMLFW0sdd7+SmpvARI8ku
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(6666004)(66556008)(66476007)(16526019)(16576012)(66946007)(6486002)(31686004)(38100700002)(110136005)(186003)(31696002)(53546011)(26005)(7416002)(5660300002)(316002)(8936002)(2906002)(4326008)(478600001)(54906003)(2616005)(83380400001)(86362001)(8676002)(36756003)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlI2S1ZQOXhod1VGc0p2VDV6TTBVUTdrZnJjdlRBRDlMZXNqRVVNc0NwVXIz?=
 =?utf-8?B?YjJKMW5ONThZcHMreE5WSjhNS1MzMEJ4TlNuZmY5RHplSTRqVDVXZ2VLazBH?=
 =?utf-8?B?bFVOb1QwMzhQT0x3VmxXdXRwMys5OFVVRU40VmppcWJoWGw0MnBOTUtyWXFR?=
 =?utf-8?B?SnRYdkZPV2xYekNQcGRFRlVvL0kxczdKbTk0c1ZtV3lMN0pISWhWV2hTV3FY?=
 =?utf-8?B?VHZjSzdlbWN3SndxZVYxV3RjckNWNVJ6ejFiejdoTjJpMS9SaWs5bjVoMkYr?=
 =?utf-8?B?akR2WlRQVkRxeUQ2dGhxallNc3FVYm1CMTNvU250elo4K0xFL21GWUlsY3d2?=
 =?utf-8?B?d0ZoNkZVWHVhTmEzdCtxQkFWR2xtazFUb1p4VS9tT21vZ1pJNGY0UjYrY2Fz?=
 =?utf-8?B?VHhxTm8zRlhLQjY2anl5NTZ2emZiKzR0b3orZ2lEcFNMdTArbUNrWTRXanky?=
 =?utf-8?B?N3N3WlVtRklsODcvVTNJQ0VMOE9PT1FKcjlKbDVUajFrLzhGb1hNaFFKR3ZG?=
 =?utf-8?B?Sk9VVVhCVmlEajcwWkVVUDRmb21OTXFhSXFDUzlBTWhwaDFPNVEyc2ZHbnJU?=
 =?utf-8?B?ZmtQV3VNSytuSU9NNnh6Z3oxUlg3T2hBSnhmM1FFbndkVEt2KzV3eDh5bTVX?=
 =?utf-8?B?REZ4MHNwRHVCY2dFR2ZDTVoxWFhDZ3pETXMwMDh3ZWtzaTJaOFAxYTA1R3ha?=
 =?utf-8?B?L1p6V1RSMTZXM0U1NHl5QmxZaUx6MTNHZjVNZ2dSTjRBTU91T1g4UkVCazJP?=
 =?utf-8?B?ZUUwdDZta0prbUMzZ1J3eTFnWVRDR09HcWlqaEJxYjJWbTBoUC9zYkR6NzNX?=
 =?utf-8?B?SlN6ekwyM0JBdGdnOWFZOG5Qam1ldkw4MkhIVUNiOFp3YVBLL3hnM0Jtd3Bx?=
 =?utf-8?B?L3dtQjVYbFZ2ZWNNbENYUTZ3TWtIUEM5OFlacGZLVFdXWDQwdWVrZDZibXlH?=
 =?utf-8?B?ZldycU5oNzkyZ2lkM3RIYTloSVBlL2lXenhmWlEvL0RKWkdFYjR0dXJzZlFl?=
 =?utf-8?B?aWUrd2tBdjJwTGFUSzljL0E2WDZyZHFaeHBDMmhnaGZwbDBkdG4yNVdzV05u?=
 =?utf-8?B?MlZMT0daZFRTd2pyOUFVZ3p6QVV5RnpxME5kQStRN0gzd1pNd21jaTBqa1Bo?=
 =?utf-8?B?RFdGaHpkMlRvaVhicHJXcXQ1SnBzdzZzK1R6RHZqengxU3FFTW5BOERiN3pN?=
 =?utf-8?B?UDVLTXRSK3RzcWlaUDE3WURzem5EdTdQU01QVlcwdFBCM0hNMm92K0RKUEc4?=
 =?utf-8?B?b2puaGt4Q0J1ZFZzTDBYSVI5L1hROFpwM0tWL3Y3RmVmRzhhZ2NnekFSazNv?=
 =?utf-8?B?SWUyTWtlT011dU43c2tRUjdXditzOTJieE9wZlVJdmliSEZiOWV6NStTWWFB?=
 =?utf-8?B?d0xsNHNBUEc1cDA5UWREMlIrbEtaaXNxbHpZQlBUa1VGVW1sTWRUOGE4djVa?=
 =?utf-8?B?QnB5cjltbmgwdTcvd2RSTHZ5RUZMQmpHTEhXdVoyTHRNVVl2WUxNcmtIeTVM?=
 =?utf-8?B?VU9qdG5xMlVLZGNYVmJnd0F6aG53bGVDdDdoQWFyZi9uR0lRVUtVVnc3S2My?=
 =?utf-8?B?dTBmYjZUWjJxZHZKbW5mRDB1dXp1R09nS0U4WEFiZW1VcDlQazRBck1VSldJ?=
 =?utf-8?B?ZHdRRndmODU3RnJmU2llNXVtdGdaUGZ0M2dBMEhuSjVtaE52SUN3T2xEYXFh?=
 =?utf-8?B?Njc0cDBtWlNLMmY0VlpUTGEvbVNNbXBxcE5rNlNKWnZHaWsvbmErSXB1NVpH?=
 =?utf-8?Q?CDZGJk3TK3AB566WAELUG7Ah8cL2TvP4VroXUl8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 668c94ed-9d20-49e4-3ae1-08d9329ee0a4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 21:20:20.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWoiuotRVHqw2avn13jC8E+yX13tOdzxAOUtnEaqw54UF2rXtzMXKbOjQgfLk5DgsOl005fmGYL5BMnL3czpWNBFwLpvuBTDpsz/B54CAPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4967
X-OriginatorOrg: citrix.com

On 18/06/2021 13:26, Jan Beulich wrote:
> On 18.06.2021 01:39, Daniel P. Smith wrote:
>> The only difference between !CONFIG_XSM and CONFIG_XSM with !CONFIG_XSM_=
SILO and !CONFIG_XSM_FLASK
>> is whether the XSM hooks in dummy.h are called as static inline function=
s or as function
>> pointers to static functions. As such this commit,
>>  * eliminates CONFIG_XSM
> Following from what Andrew has said (including him mentioning your
> changing of certain Kconfig option defaults), I'm not convinced this is
> a good move. This still ought to serve as the overall XSM-yes-or-no
> setting. If internally you make said two variants match in behavior,
> that's a different thing.

I firmly disagree. There is no such thing as !XSM even in staging right now=
.

All over Xen, we have calls to xsm_*() functions which, even in the !XSM
case, contain a non-trivial security policy.

The fact that under the hood, XSM vs !XSM creates two very different
implementations of "the dom0-all-powerful model" is an error needing
correcting, as it contributes a massive quantity of code complexity.

This series of Daniel's takes steps to make the code match reality, and
getting rid of CONFIG_XSM is absolutely the right thing to do.=C2=A0 XSM is
never actually absent from a build of Xen, even if you choose CONFIG_XSM=3D=
n.


I do think that the thing we currently call XSM_DUMMY wants renaming to
indicate that it is "the dom0-all-powerful" security model, and I think
that wants doing as part of this series.=C2=A0 Name suggestions welcome.

~Andrew


