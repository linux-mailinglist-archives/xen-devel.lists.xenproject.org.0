Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B99EDCB5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 01:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855408.1268331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLXMm-00008J-FP; Thu, 12 Dec 2024 00:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855408.1268331; Thu, 12 Dec 2024 00:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLXMm-000065-Bs; Thu, 12 Dec 2024 00:47:44 +0000
Received: by outflank-mailman (input) for mailman id 855408;
 Thu, 12 Dec 2024 00:47:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiJC=TF=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tLXMl-00005z-6Q
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 00:47:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2612::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0e02588-b822-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 01:47:41 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS2PR03MB9124.eurprd03.prod.outlook.com
 (2603:10a6:20b:5fb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 12 Dec
 2024 00:47:38 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 00:47:38 +0000
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
X-Inumbo-ID: b0e02588-b822-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDLxj2907HmOQ68MNalQH52JU3Y0FKX/pXdWA1uY2QGeQ2DQUHjBs22HjhqmqhA5M8B3AbDLM6wzRsKddcHUlwo6MQl/r+5oa5nU5nCYWmirre1zOWs0dUIIEoCGeTEQgMGthifGOKwIkMtVp4Ioe8Hr/8mMdGLNe9yG+qdDZmp1tYQzJu4/VGkSnER5gnGQGsWobbXZdMg/neUkvYNcM6znW9qRFAYpc/Dsx7+kjcNTmcP9G1IU+59DE4CalLdyKbZpjws0jLz8Zi1SihKqN5pkDej8HHAdF/VRXOPW/a4nSexPvPC7QDSpC8kLkaY8VgFizzJ7XWySg95G4HMK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR7AGxsyUZtscQ6lFuY5AQqMJBIqZNkWAJ1amwqw3ag=;
 b=rPTxwG++KQhMwkL1b5cpMZ0p/kZYj79LazdF4UYwtdpYUb8LrNYLdfPeBB4UsP4aR6COM39KAGOv+lv+GR1dGeWub+X3tMNqJpFlXKxKHx1ndpE7swE5xrdVAdhRwy1Oc3DL4VNAoH6CXHZCNdWutmBpvWWwSFeh9azFtFR4d0SlOtUTAyYZkkDTEjK330fDuB/N3mzTDX8vmD1k6I2TIkfSJheaLvoc6fNXzupbadB3HVNLj7BNnLzgjNa5CN2mjxMvvAe0W+jZMB5R0ZLHXwlY36Opg4kxfM1IPUJPBpt2chRwyiHdRrVBxg5k3L9WMDIgqiaqSWvQj2e+3ys0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR7AGxsyUZtscQ6lFuY5AQqMJBIqZNkWAJ1amwqw3ag=;
 b=bdYKG2/AJMZV1zAhcOPCUoXQFADnsapd4Do7OhUO8htrUJHUdyqVjsNhLZkf+FUWAWPFspLbO/6kU8GeAY0LgBErfIGUlp83fgTr+1LEbSGohiH3dBpRvDa76G0tYxGVEssSzTP0JoEROlvUkqzPLjxdBJFJzllvjudzLSa2/g2IsM3t5mJrdSyCRqQiyzAtRQKSpTkTq+n+RAtVYUE3XyZnlppU7n0712Oqxo4UrmsZcWz5w/h9/d1Fe45Gosh6aVNEshwDrlgXb58KAnuLHdmYXLFoEPN3oRoCKC10qWTsrYMJmr4u/gYyDSw+cErAOJk144gRahFhTn1lBtFuSA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/3] xen: common: add ability to enable stack protector
Thread-Topic: [PATCH v3 2/3] xen: common: add ability to enable stack
 protector
Thread-Index: AQHbS3ED5ZENsqu4Z0+AIfWfHmGdmQ==
Date: Thu, 12 Dec 2024 00:47:38 +0000
Message-ID: <87bjxh3exi.fsf@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
	<20241211020424.401614-3-volodymyr_babchuk@epam.com>
	<0d04abb1-dae1-47d1-93e3-23d88399fa64@suse.com>
In-Reply-To: <0d04abb1-dae1-47d1-93e3-23d88399fa64@suse.com> (Jan Beulich's
	message of "Wed, 11 Dec 2024 09:16:47 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS2PR03MB9124:EE_
x-ms-office365-filtering-correlation-id: 0447eeff-13d7-4b4e-4445-08dd1a4693a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?C3S1JExESxDxd0eCH7PKZIXB+tP2WKw6Jagv4So3GGXGhGUV6AWBIy8GrL?=
 =?iso-8859-1?Q?I6thaN3rWZRsHdjgiM3WCCrk5e4Lsx60fLewAcAZVCOrvSZad/E+5VaqH+?=
 =?iso-8859-1?Q?V3/HMv093n7Gde218ttsDk9+OUU52EeMVuXyUxIVm9ZtjgQeKFcIUKAlzu?=
 =?iso-8859-1?Q?68bJGCaPsVFYtKbX6yDKuADF5oCVspETmcfOuX/uE4agKAaW5l/gGhTUFZ?=
 =?iso-8859-1?Q?LY2NmTl56myIVeoH54d+fXtmOiTBIU07tzHgbAAYRpsnUJBkwa/FXTSQpG?=
 =?iso-8859-1?Q?eUua8vxfmfCUROBY269bW7vdCG+bKXpDkytPMFMWQ5/wFdSOxwVUQYu0IC?=
 =?iso-8859-1?Q?zvz/r+LuRrVb6SNFAB1laGKWCBAzUykJFxSlhvs0VYC18hWC3sNuJGTMZD?=
 =?iso-8859-1?Q?tQLVarevFMGaDlAnn8NsurU9U+YgpZao8CCeZP7upFFrbOGREnCQwAD14R?=
 =?iso-8859-1?Q?pEvlEO58fZ8NTqQZxC0YeFffE7Svv2xVYbd0dBjtOziHnyrnhNNZnMG/aq?=
 =?iso-8859-1?Q?QOSSbmz5xexYVODQetERKmlc+S090PHByBqOFnfupWfqmYrHFS3Jd7XOx4?=
 =?iso-8859-1?Q?vCWp2V50t4NQUO2EU42dxP2uvWq+pRq4xybsvTpmZp437CCf3K/ABsh6AF?=
 =?iso-8859-1?Q?cEtFXLko4QczOpMTDHDQZklDTTp98ViPlgRMjZGWx3tC2qa5c4aOXtmpT2?=
 =?iso-8859-1?Q?2ul3mhHbG4hbX2cNgQBEKyvwQQfkruXU/KN4v8HfbAIRvoiGPqMiL4yeVQ?=
 =?iso-8859-1?Q?Aour/vwvPyZzTesWTul7xGUliUlJzauSI/+bgN+Kjirfko+tZmsoeFj98b?=
 =?iso-8859-1?Q?u4ESL6jlARL+QHLp9qHLnRCtdse6fd7Ln+yOGhrhbi6zulhpcDaP/CJ3/+?=
 =?iso-8859-1?Q?JqYQV0YGFJaURgslWgIki1ftx/cXWSp518xpXbweeglYyRP1lGwWRUKPg5?=
 =?iso-8859-1?Q?f2Jqtf16GV8rpct118lXNVO2XHc4OdtOUwrcFrRkwBbVExhEbe9Et2Gk9N?=
 =?iso-8859-1?Q?belYWjuek8AkttSeSirNmbGF+3JjF479B+IJka168MPxAfIXy7ZRVnEbHx?=
 =?iso-8859-1?Q?jldmlu4/ZNq3CZor/FYHIe46jGRXoh26kn+XTAjID5s8w07G2LrmdIFNqf?=
 =?iso-8859-1?Q?Jb9LtcT5HWfwgoel6oMRBAGaM9BhqcFSlyQ2GqGK1nsPrOvgPgvTcpgpek?=
 =?iso-8859-1?Q?elTOwxBgRyJMjEKiNVH2ZVaxi2AR6X4GGID7hjYoPUe+e6ipT8KHeKJdOF?=
 =?iso-8859-1?Q?kizYllS91BUAhMlk3Q1VVSoueMT5A9qZ9eprwL5j0/cjCcr5bSFzbIUQvT?=
 =?iso-8859-1?Q?LMZy39YEwIlCVxPKC9a583KEeYpiO+dAVPBZ3sjQ4eK2v8CB5n6PvRGNvN?=
 =?iso-8859-1?Q?XGDRkR/kZeBqnbE+tXXJ8ZP8Fl0QFWrYPJPTrCuSHid30l498UNY/yaFLN?=
 =?iso-8859-1?Q?GTTKVBTfEHGuVxPt/HHhvmy5woqNbAkmtAQqng=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Fk4WDSyFMq2n67h5HQZc1vfgOj4aLRzxho1MGSH7IVJljvQu5DcXzcY2mM?=
 =?iso-8859-1?Q?V+YIphmCsi1+ZiiL0d3FNWLqOxaDlDgMcioZsi/Kip+PutcgNJuDunfLVh?=
 =?iso-8859-1?Q?agqBHAOiQzeZ6rLSX2KFPfyIUWoFqr/ilxZQWSJ62YDfkLUUp9pVpw28o9?=
 =?iso-8859-1?Q?wrheklnY2dCdnycSCia8hfB4B5jFAJvDMcv1DqE4Opu+ni4mEFpwl2s/mJ?=
 =?iso-8859-1?Q?3vNYD7ZiyEp0VVxahLdQ4RCXcyUFrqWW1kqnSg2FmYqxizMPrfLuNZ5WCE?=
 =?iso-8859-1?Q?3Ijjik7Gv8ef70k1szCkvETgwPhf/nmL/xKl8IPZHAXFgyCnfnMYwwDodl?=
 =?iso-8859-1?Q?tGT5n7VFxr+gWzYQSbFcBl34jroxVVy9ZZmHx4CkLQNTWn+82ZlLfaluaa?=
 =?iso-8859-1?Q?D9u6SOF99zFu17FvEPGVELqDCaLsefcYsXjOJhjBOKgMFQw/GnrwYYdXJN?=
 =?iso-8859-1?Q?nY8nee0auG74B3NK+fXVyia9qZ1Z5z5NCVi6rKFzsu8cLcHS6xIRw6XTFn?=
 =?iso-8859-1?Q?ABxCk8aUYaSaV3rQwRQMzMtkQ888K60J7DINrXX/qcArKBaj4kEDaR5iyH?=
 =?iso-8859-1?Q?Qdr89IH/Mfew4IsIwvxvkId6ReR0AHpK12PTkBQkimP1ZDH6acIzXuinH7?=
 =?iso-8859-1?Q?mLo/G7IQNpUlpFF768LNKBFEN3H0DjnYrQdxVIInuF5oYrwwP9rVVdihx+?=
 =?iso-8859-1?Q?oeUwH5sz+ZfygI1fztVgGp0ovkHVueW8Dk8DG9RFZv1R9Q1PO/52RyyEWY?=
 =?iso-8859-1?Q?P4DXW3NRijtSTVmKw/6gap1Fb4HOD/J8XtdOFGlTqVdTKYFM5xTQ27G9Es?=
 =?iso-8859-1?Q?A033bj9XVYhtgCXSquNdCPuxn6kBxFif6/ezwbV6Xcaj6N2rf2hf1+vQOE?=
 =?iso-8859-1?Q?0//PEL/K2rTnNcAmjjyf7TxaJltBQnAROfiHuREyUWnvcpZ7Gc2mNkb7+F?=
 =?iso-8859-1?Q?D7nNiJZQ9yZNozcCEctkRmtEYPwBfwwJShlTU9bnAtOYBkKVy9k3Q96y+y?=
 =?iso-8859-1?Q?KmFF4I3R06U5yLkPPfD6YqW1ZkqBLFZjajHMTkUjL8FDV1nq5obljCK/kg?=
 =?iso-8859-1?Q?04UhBH5PoB1iWUsBR2QomHuhlaZGOxPWHlJ3dWKFBXamh4OkSMLbTzm3GK?=
 =?iso-8859-1?Q?B9wu4gP/Gp7kqXFXWlAxuWqJFie8r44mJbstRtuREFwD0XhlCglrEExZJJ?=
 =?iso-8859-1?Q?6GAaQiPPsIigwx6h3uyiLGp9gpT9qZ6GouAqCMdhfJcjdV/ehvC6h06y41?=
 =?iso-8859-1?Q?9l7ESI+jU3WYkCDaculvM/BzHBeaL1XFOk2Dtod5FkB9NmVed+Fa8EtHE+?=
 =?iso-8859-1?Q?UGBLwC/eXlb9OnPzRdqwBldbtuBc7eEEyaDKaEoQRMKpXsPBlWkiyG+n/y?=
 =?iso-8859-1?Q?OGwujT3SrGF/72r1K7yYYzOz0RZe2sZrzZ+P4X57Mr36W6liEwO9GfdRuX?=
 =?iso-8859-1?Q?RfnoQvXLb+DQ7YDpPRA+bkc5RlC4HIQMwjdcQyCB99ZlkZcfSEg4DWN1j/?=
 =?iso-8859-1?Q?YYFIU1WExjERnqRRASwhdxvbjza0VzNOKwjo5zh/OdQb2FppMGkC/CvY1q?=
 =?iso-8859-1?Q?XrwoJhCMoJfVI7zq9auOR4GMZ+//EGQz8f7aHAsPbNEBcKXI0/HBtC4a0k?=
 =?iso-8859-1?Q?pOX68Od6FTnklrYD3IyISNndTFDGNl5gR140Kj5FsaNWbJgXEyAaZ9Yw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0447eeff-13d7-4b4e-4445-08dd1a4693a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 00:47:38.3408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rq07u/adudQdcCd5SrLCan5XWRS66WiLhe6bq+YcPlNHgVHmRW8RHXz9yymoCXyKHNpvR7H8TiGdMmXLUK3nzNpyzrnO94THwACr4VUFd5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9124


Hello Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 11.12.2024 03:04, Volodymyr Babchuk wrote:

[...]

>
>> @@ -213,6 +216,18 @@ config SPECULATIVE_HARDEN_LOCK
>> =20
>>  endmenu
>> =20
>> +menu "Compiler options"
>> +
>> +config STACK_PROTECTOR
>> +	bool "Stack protector"
>> +	depends on HAS_STACK_PROTECTOR
>> +	help
>> +	  Enable the Stack Protector compiler hardening option. This inserts a
>> +	  canary value in the stack frame of functions, and performs an integr=
ity
>> +	  check on exit.
>> +
>> +endmenu
>
> "Compiler options" reads a little odd to me as a menu title. The precedin=
g one
> is "Speculative hardening"; how about making this one "Other hardening" o=
r some
> such?

It was on of the Andrew's suggestion. Other was "Hardening". So yes, I
can rename it to "Other hardening", hope Andrew will be okay with this.

[...]

>> +/* This function should be called from ASM only */
>
> And with no (stack-protector enabled) C functions up the call stack. This
> may be as easy to express in the comment as by simply adding "early".

Like "This function should be called from early ASM only" ?

> However, considering the so far hypothetical case of offering the feature
> also on x86: What about xen.efi, which from the very start uses C code?
>

It depends on what other services are available. If RNG can be used
already, we don't need to call this function at all and can use
boot_stack_chk_guard_setup() right away.

>> +void __init asmlinkage boot_stack_chk_guard_setup_early(void)
>> +{

[...]

>> +void asmlinkage __stack_chk_fail(void)
>> +{
>> +    panic("Stack Protector integrity violation identified in %ps\n",
>> +	  __builtin_return_address(0));
>
> Again.
>
> Is panic() really the right construct to use here, though?
> __builtin_return_address() will merely identify the immediate caller. A
> full stack trace (from BUG()) would likely be more useful in identifying
> the offender.

Okay, I'll put just plain BUG(); here.

>
>> --- a/xen/include/asm-generic/random.h
>> +++ b/xen/include/asm-generic/random.h
>> @@ -2,6 +2,11 @@
>>  #ifndef __ASM_GENERIC_RANDOM_H__
>>  #define __ASM_GENERIC_RANDOM_H__
>> =20
>> +/*
>> + * When implementing arch_get_random(), please make sure that
>> + * it can provide random data before stack protector is initialized
>> + * (i.e. before boot_stack_chk_guard_setup() is called).
>> + */
>>  static inline unsigned int arch_get_random(void)
>>  {
>>      return 0;
>
> What exactly will go (entirely) wrong if the comment isn't followed?

This will not cause immediate harm, but it will give false confidence to
anyone who enables stack protector.

I'd prefer more substantial protection, but we can't even check if
random generator is available in runtime. Taking into account that we
potential can get 0 as result of RNG, we can't even put
WARN_ON(!arch_get_random()) check.

> (I'm afraid anyway that the comment living here is easy to miss.)

I didn't found a better place for it. Maybe you can suggest one?


[...]

Thank you for the review. I'll address all your other comments.

--=20
WBR, Volodymyr=

