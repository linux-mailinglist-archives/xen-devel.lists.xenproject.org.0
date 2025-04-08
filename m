Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFCEA8103C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942441.1341595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2B22-00068P-04; Tue, 08 Apr 2025 15:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942441.1341595; Tue, 08 Apr 2025 15:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2B21-00065w-Tl; Tue, 08 Apr 2025 15:38:33 +0000
Received: by outflank-mailman (input) for mailman id 942441;
 Tue, 08 Apr 2025 15:38:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpS5=W2=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u2B20-00065p-Ef
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:38:32 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8584dd4e-148f-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:38:30 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB7469.eurprd03.prod.outlook.com
 (2603:10a6:102:105::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 15:38:25 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 15:38:24 +0000
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
X-Inumbo-ID: 8584dd4e-148f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IR8wM8Wa87nrD8Ek0gEU8yq3habFvj8rOzQm2Xhv4ht2wH3gBlkF85NNxZuo5Y4+mQfFR8EEebCZyqRsYmBOAQ7ah6UJ4lXp5vkTLkG4tzPk+eNoD9lAEZKjj0yTf4xkeD+uV2atscny8Zh3u8ax+tJl4PGIYHyHr4Ocnjjx43jrLuciSQIzggUfQNsN2dIgDgebpmT/UYrw/Dhv98zykUOmlxxU3Q7gcN9xJKWXhLdcMZacSn0ubVK8JlrLhtQ73yJ+7e0hzjX1tkQv2op7py5z7/EIWJ31kyLLL87WekEWUCytKxsGtCP16CfKFbKCjn6pouqBFagrISfqhKpz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7urgFuUcv9ekelw8kTvRAD/6Qy+f/RzS8svHaMji6CM=;
 b=lU34akrX/jE4CmSz+uSz6p/F3T/+yw9w4oE0QUwm/DEgtih9qDDrcnDrXsdpA/W5OD7UView80LSXfWtm04Av6dfFgoYYqy2Eh/2H1aEhGlZjSp2QDUzaL6fhP0sAzJ/jdJfpFsUBjsn7J3/iSZpsG/mbZqK5U2tAFWivDnTiWV6YlT8kqjiBDnpW8r6BvIDus3H0NEqcY2vf2B9qkqQUvUqLYssW3A668zZjbbkCCu9Cw2qFwlle3fdxHlHKUD8R9pdCzIGiEsKb5rPEpM5q2Fxxul0Tl/nZ6zu9YBcSmLTaViMne8Ex3P3OVSDQwPqFSDA7c4s0fBBLTFU+5ea8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7urgFuUcv9ekelw8kTvRAD/6Qy+f/RzS8svHaMji6CM=;
 b=Z1hNR7CXou49EIZPDAoq0biTPnYR/OrL09CCFejACvRgWPT9uEIajxIlxUUVh2QFB3gqBAe69D8oAk+hKOeElplWGvnJOC+HERmSrlro9VM4JMfifVA0Lx5TmTQDxSzsVi7yzan/+eZhvqOOmfIDJr2Ucjq6seBHfHC37xtk82v9i2cUwwNifM7cwdBuYaJvbtXY5kq3+NW0yZKxT75E158JHk7Tobvr0B2cYYbasZHsUUJB/K7+vfoobt+kAO6+pLWJ/liHDbb34Z8BPC8crhRwPG66112BdLzMBtg38XTJ/XWGKRh0C7xLFWn4A5g/7kh1gUCFutnP1cQngsOeYw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 2/2] xen: debug: gcov: add condition coverage support
Thread-Topic: [PATCH v4 2/2] xen: debug: gcov: add condition coverage support
Thread-Index: AQHbp9yW2b5GBLlgDka417bnQFIpfQ==
Date: Tue, 8 Apr 2025 15:38:24 +0000
Message-ID: <8734eifyts.fsf@epam.com>
References: <20250407164608.2558071-1-volodymyr_babchuk@epam.com>
	<20250407164608.2558071-3-volodymyr_babchuk@epam.com>
	<abf11b31-0bf0-4add-a49a-17d7723c74f2@suse.com>
In-Reply-To: <abf11b31-0bf0-4add-a49a-17d7723c74f2@suse.com> (Jan Beulich's
	message of "Tue, 8 Apr 2025 08:34:44 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB7469:EE_
x-ms-office365-filtering-correlation-id: 4579a674-47c4-40c6-d919-08dd76b36677
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0KimHD/adE5LpCIzxKfdO+bny5IB8q/Iqf8wbOaj/KtwwyVIjWL7SlFCY6?=
 =?iso-8859-1?Q?MCaJecEmMCHry4QXLwepEOJLLjzbbzaDT8lSG2mbyHJyV8jQq5e3Xo4x8O?=
 =?iso-8859-1?Q?wSH3NUKxxbS55LyQlQkh6ACDuKRFxtED9KVaj6LrGiaFVti0+9iRk63yfW?=
 =?iso-8859-1?Q?vTW5Sw23TDY6arzjdz2R6fhQRVBRW3WRkN9AcVdgFHRjjnhtG2+yD7z69v?=
 =?iso-8859-1?Q?ZQxFsu2Vl8dQlgZDehqS700qaCgk2SQsGL84gs8fEivLMljzmpmR2JjrJL?=
 =?iso-8859-1?Q?AdgKn15bTpI2BEY5W/HiKZa23vlZP6n8wMmU9k6EN5sK9SRDEsy2nAbevG?=
 =?iso-8859-1?Q?g3oVibnR96zUNRslyskyqcNzHGPhqrGzkRAMouHL4aMJq52m0AuPPyTnQr?=
 =?iso-8859-1?Q?F39CHNQWJK3fHKHbBl1wG2hXLaPnDbBag7V1FjkKjkc1GxtMgvGxetDs66?=
 =?iso-8859-1?Q?dFAGYlzRmS9fNzTYaW0DoGiNdQ2Rvr5hirt30SOvV6WjuZfq1kgBO/d/9Y?=
 =?iso-8859-1?Q?m4mZvEtgOfjF7IBUTjqWD6V92QnCaVDQCtTHNY481hobuzttwTCrx4pCwy?=
 =?iso-8859-1?Q?k5jb14JNzUpCi6TMT4wMTSfsEycv/YAu8YXRRYvVJ/LvscWcdc2VW52txC?=
 =?iso-8859-1?Q?Wowh+LRmnu1dJ67BgT+kd+R4U7k/t7JLt5RrRKmN1I0ScQxCOJuY3CKXih?=
 =?iso-8859-1?Q?ATb+3M/O2Z682v4pyZhg5MvtTFNK4aGuEc46kuJnSsDuM20lRVQpGqU9lr?=
 =?iso-8859-1?Q?88ervNYudnKNblwWm3Yec4wwEUuioyl0b0eSDCSORsmgGZcn3/9x8NkzJ5?=
 =?iso-8859-1?Q?jfc7eJnY7ECveIV9kH0txT+lBKn1kokSYGMFusjb+/4CqbCJzUY8hCiw5W?=
 =?iso-8859-1?Q?Rk0hfL4YJo5K539LbXUZIVEQ7z7PtA/dhJaM7YtyDnIAQGzq7cwpFw+q16?=
 =?iso-8859-1?Q?GrtQJR60+IxHGCm8mEZyDKdzDfg2lbCqIav1RY1JW07kWofMjVhUOrBrTN?=
 =?iso-8859-1?Q?b+ZJvPCIfEaCgF+Wqa++0Fq7dzoPMCHgNxaFr1D7vqxd66bPENWTJuefqW?=
 =?iso-8859-1?Q?sHdR24FNfwvc7MvAqRBQOX6Z1lMWC8Xmq6VBmfU1Bp4GBLp8sVeTs1cxyf?=
 =?iso-8859-1?Q?98L/bYuIPtq2WuluTkBUe9hFQtFQbNz98Di9tGHeYVo4q1d+MRT0pHHcbX?=
 =?iso-8859-1?Q?m/Vg0ZlLVFtBn2TzfEBoJBrVHKn36Dsct3upcGXen5/BL17/8OilOx5D37?=
 =?iso-8859-1?Q?73copU9TXwz8PqvoApKaWERI+DumW3rAkPTEgpX8GOGuR5dZ19rklGyC4B?=
 =?iso-8859-1?Q?Bc+oEB4zmEJrnfS41kfKPbH8UJFq1VyDQRbjMQkzj7+fNEve3POXAoRWqi?=
 =?iso-8859-1?Q?G5KJHrh2TAN8xarCICH3UFqRgX4hBDr383PYGlCr87eqKKNJ7c1KKOcl6D?=
 =?iso-8859-1?Q?d/zbR9A8SVoGmTlGDNlmRHrBtXYIX52AduURgkHs2EtE+IRk/IFlRW+48Z?=
 =?iso-8859-1?Q?oKRALYubBp8h0JlLinqJsT/+f6wZY68YFN9/1v6nFZ+Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?leoacIC/bOEQjL/h7LjGUtIqFwIMRiMmhJNCDa9pdYpFhSKPMMqbcGEu+w?=
 =?iso-8859-1?Q?+su+naDXRSZdq7m2J3gAe0kkwPZmIfGFOsTpiwO1jbQqDwi8UGBucQsGju?=
 =?iso-8859-1?Q?GG55ICA4+Ceunz4aGtjasO0KUNVoDUR+08Va/ay0Og8bN7eFLX4nsj/Feg?=
 =?iso-8859-1?Q?LZH5yeTpurfR1GZUQvdrIGN1e0gvV00WX/Xf7XtnfLHGXvZ8mGJu8NoONM?=
 =?iso-8859-1?Q?gVPvydu3GwmJti9qZgYRH3IcFFVgYC2CuTDwjhKxT/kM8BL364FAhjcbcp?=
 =?iso-8859-1?Q?7pDi68p3eWBzGddhw+cMTzsS07QHfUlTTg+sYd5Eo/xneMowTFts+ImqjL?=
 =?iso-8859-1?Q?I0RkWAOO4aK5IksKzWCN1Y69QNqecF4YZ3XfBsW0Kh0aUj4U19CxzVMjGP?=
 =?iso-8859-1?Q?uGtHInUop3R7SaEtD7C50Pun033T8/mpU0G/oTTXFtb4Nz3y6YByBNPQYE?=
 =?iso-8859-1?Q?wO1zlpv7nt5RAer9FxXodwWBaV0A47cKEr2UuLe1E7VOo7m3aZm3QXvpLk?=
 =?iso-8859-1?Q?v1KYDhQPHojB6y0Gl5MCg1weCAEzk5KGheVuWOlLA8E6yUp4W6bDIXlBJc?=
 =?iso-8859-1?Q?sBLUw6o4ubQKwNXYDPKyddo/l01MyAskGveWJE+N5wRtdIyS+hlN8bi7zZ?=
 =?iso-8859-1?Q?KeNh273eRTqid1Z3mQn0XpPfl5i6dMzD91gwOSO3SUcSpFFOw27f5r63YV?=
 =?iso-8859-1?Q?xV29FDEkUgNR0cEFvRADdFn//d61ov0EvpWta5g10Exf3ht/0abpYOPdKr?=
 =?iso-8859-1?Q?Dq3sDbPDBk33xzw8FEmFTOHUFsWsRVABLk0CAL+sHIJJFM255AnuSQ1OpN?=
 =?iso-8859-1?Q?UifwNwfwbT4OHrhBPrMQtGEH0Lf9lrNYT9olTkhQ51dWbMT6g+JheG7pqi?=
 =?iso-8859-1?Q?bPAsF7QfYu2cGYS3YAztbzLlLgta035aF0f3JrKiCgATVwpd4543OJ/bQO?=
 =?iso-8859-1?Q?dal9fYCO59J9IEEZboeYbgm2NHR37LEvWdkbdXmosHOh6JU1mjIC9HrXri?=
 =?iso-8859-1?Q?r4hsz0casV9MIMV7BTVzO50nIkXnLMcZTgJb9vkGvw1CEtkvSwxH4EpLof?=
 =?iso-8859-1?Q?48vK4K7f7yEltFRv89movypfFJNrohGtbrdQRrZFCns8sYCGuAZsHP7v+H?=
 =?iso-8859-1?Q?XN/slVOSQ2zZTAJN4c7HWGER8FNhI6lBVhtqpa6Bb11/GfF4P6018zqN+j?=
 =?iso-8859-1?Q?62n101NH6Ok0qzF2NoKlaVHiJ0x/WF1y/ngxUJcGFufdEFfZQVWqIbensc?=
 =?iso-8859-1?Q?6PwcrEGgiTOff5ui40DiqFHeP1YffF+WnWZxRjQyl0EP0Fta0iNNw5z/ae?=
 =?iso-8859-1?Q?60v00RcAEWkeip7VCtmoz1Mq1LW+N2bLeFpKPeJd8Fwjhbfu2m7+xPv+zt?=
 =?iso-8859-1?Q?wezfZ/gVk90Ww5j1z/G8uAkUNS8lQVLiib7P6BZsMYFJbKWRiLSzQUENry?=
 =?iso-8859-1?Q?/Qa7um3T093IW/T95CJ7OiYi91tvxIbSoXXv1vLKeJUha471rdivUxZkMK?=
 =?iso-8859-1?Q?/ck5DJdEiK0NrRDq9BtTXdu/NDu7rtUvexDpW5jN46xvHEWiTof//sDnBQ?=
 =?iso-8859-1?Q?VP12syS8Okv2tvTvQpTTbfxpVMjZTcNAPBKNX/5RsjQryGCl8jM29YT8hx?=
 =?iso-8859-1?Q?xN7U6qvKTjf8GVV+UHHIBGOtOicH+n8lwT5GN9pxttV41PNJmB+gsFfA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4579a674-47c4-40c6-d919-08dd76b36677
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 15:38:24.6705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X6lcYCI4NtByTrdROdvxTklO6stQFr56b+3VNpRylLP0VcZqcn/1cef5rlFKxIWe4P5THYYYPvGoO2R5KQeM/eN4x736HyUs124PViDU49A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7469


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 07.04.2025 18:46, Volodymyr Babchuk wrote:
>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -31,6 +31,7 @@ CFLAGS-y :=3D
>>  AFLAGS-y :=3D
>>  nocov-y :=3D
>>  noubsan-y :=3D
>> +cov-flags-y :=3D
>
> Personally I would have put this slightly higher up, at least ahead of th=
e two
> no*-y. Thinking of it only now (sorry), also maybe cov-cflags-y might be
> slightly better a name?

Okay, I'll do this in the next version.

>
>> @@ -133,19 +134,18 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)=
): CFLAGS-y +=3D -DINIT_SECTIONS
>> =20
>>  non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(ext=
ra-y))
>> =20
>> -ifeq ($(CONFIG_COVERAGE),y)
>>  ifeq ($(CONFIG_CC_IS_CLANG),y)
>> -    COV_FLAGS :=3D -fprofile-instr-generate -fcoverage-mapping
>> +    cov-flags-$(CONFIG_COVERAGE) :=3D -fprofile-instr-generate -fcovera=
ge-mapping
>>  else
>> -    COV_FLAGS :=3D -fprofile-arcs -ftest-coverage
>> +    cov-flags-$(CONFIG_COVERAGE) :=3D -fprofile-arcs -ftest-coverage
>> +    cov-flags-$(CONFIG_CONDITION_COVERAGE) +=3D -fcondition-coverage
>
> Why's this inside the remaining ifeq(,)? Surely there's at least a chance=
 for
> Clang to also support the option at some point?

Yes, but Clang uses different option: -fcoverage-mcdc. I see no sense in
adding it right now, as Xen does not support version 10 of llvm
profiling format, in which they added MC/DC support.

--=20
WBR, Volodymyr=

