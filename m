Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E406B816DE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 21:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125523.1467445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyxWN-0004Bd-NN; Wed, 17 Sep 2025 19:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125523.1467445; Wed, 17 Sep 2025 19:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyxWN-00049X-KZ; Wed, 17 Sep 2025 19:08:51 +0000
Received: by outflank-mailman (input) for mailman id 1125523;
 Wed, 17 Sep 2025 19:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZihP=34=citrix.com=alex.brett@srs-se1.protection.inumbo.net>)
 id 1uyxWM-00049R-AY
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 19:08:50 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd2738d6-93f9-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 21:08:49 +0200 (CEST)
Received: from BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 by BY5PR03MB5348.namprd03.prod.outlook.com (2603:10b6:a03:21b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 19:08:44 +0000
Received: from BN9PR03MB6027.namprd03.prod.outlook.com
 ([fe80::1479:e1e0:cc3f:e779]) by BN9PR03MB6027.namprd03.prod.outlook.com
 ([fe80::1479:e1e0:cc3f:e779%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 19:08:44 +0000
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
X-Inumbo-ID: bd2738d6-93f9-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYNpJpnc1dOAn1NXZkPCqMbsu3sb6oj2q2pJEQdvMkrK+AbmD2sC/U4ZATuo46AqRAG02gKljg7DXul61h+/suvJLUgg0P7DVnwoBHPd1VIKjn/wbYmf/sF9UMu71coAIOv47jj5Pz1g7XX+q5h8aZu0Sy6s8EcCMtgFS/fQxf9cENWEgI3XbSOkMYvjLukJ0CJJzuYvvZ89J1czXmnHj0jpyPJAep27Y919BDRkfqPIpW69DryDhc7qHqcH60O/+6txXeQ4cyFTGuGUGMKJGjGeEh1idAStPBoTkf6OZ+BsCSpIrRzYKXZ3qD09syyZIvODeEZIQ5dK9EqPyxk+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfKvfNAc8fLC1ydjV2eD6mMlDM7z/rK57aEeTe5nO+k=;
 b=K7T8XP3g+6JoK7J9JhNfrTYWcnt6f0LV/a9yiOngiPCaSW6LkmgGxldvpCrVqjaEGOTF4kp0QCdF6eKCKsvbepVbKD/uW3S9n7wm/LgHxlPNo5M+gjP9qjjHGrXTl0YR0aEYJMGjlLcuS8Y37fqO8x0D7YO6IhpdeYp/GRD48WvqMplRXjtOQeyIHQt5J+ZhTMjXR2K+ggSc8rSBu+K6Iz32FBgDMtB2oUoiiabmoM9ryvXBAkWVSCduQMVNo49aSE5LEW1iMv8uoZenJIR0bapJCB7TbettrhlcRv8W3UivKUpxM2BJdNeqF0xinXewyraQodEKzcnSyJUQbI4bkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfKvfNAc8fLC1ydjV2eD6mMlDM7z/rK57aEeTe5nO+k=;
 b=ksVnP+7j9dj489UjdyH4lBhk+19yhLIxOdD2zUbFhCaSTi87sdnlA+aYPPtxyo3woD5rf3KZSDTp9B3/bG0T/sl+TFEvWFZgEkwF/5zm8ZYW2QDrKCRJqPNZooXaAteOxGVz4e9tmXoNKMm6aFCGpz+qsCgaL2TvaiW5npMfQek=
From: Alex Brett <alex.brett@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Xen Summit 2025 - "Follow up Xen Toolstack new design proposal"
 design session notes
Thread-Topic: Xen Summit 2025 - "Follow up Xen Toolstack new design proposal"
 design session notes
Thread-Index: AQHcKAYj0uX1loOt8k++R8JgP7PhVw==
Date: Wed, 17 Sep 2025 19:08:44 +0000
Message-ID:
 <BN9PR03MB60275E48D3A7753FAAD5F75FE317A@BN9PR03MB6027.namprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR03MB6027:EE_|BY5PR03MB5348:EE_
x-ms-office365-filtering-correlation-id: a3f8811e-104d-42b6-64f3-08ddf61d9f84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|3613699012|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KmIul7mJRMfyDYTSKxGjkySYwr93hNOFXwY5u4lS+IuMbkMk1/19rXP8xg?=
 =?iso-8859-1?Q?UqxfAAyPT+h76ZD+6SjNEPZWuXCY9Frfsc27+oelmYC2PyLGsOI8iFOR1x?=
 =?iso-8859-1?Q?1+GP/PkLmB7grdUlgq3PEp5xklf2WEwZ+RWwrWdEGjyklZZA54sRSPt22s?=
 =?iso-8859-1?Q?YzOPzY5cmfM1q7EwEDgTHARFp033OUUlSwqWlBDEVYKe7B2SITncM+bGJ7?=
 =?iso-8859-1?Q?A9DYGrY2fac8DGBGgbdPMUnXEg2DXTVviak4yb0nM7pqRgm+xnekfkBjfP?=
 =?iso-8859-1?Q?zviY5oHh9QIPW910gCIC7aocZng4Grz7UDtwjUcKPAJlRde2SBzIYeBVgB?=
 =?iso-8859-1?Q?nnWq3NaZdZlCZEo/HvyWr8tOJETmpgyC7lOGcy0Ke6vXLNj+qILLBXip6V?=
 =?iso-8859-1?Q?fgUMjfjeEssHz55VgenQ8E182M4mfDG5qiBbGpyOINxUYhG6n2tXcN8w4/?=
 =?iso-8859-1?Q?E3v7mCBzQtpAUpYDG+d6eFhyVOVcY0H5O7jFW+YMt7EejLNKtFTKFNXoIP?=
 =?iso-8859-1?Q?RevoUQgcrEDHM//jsw7A4mGQMf62HNW7K3n0nGJA4vyUszxHpowVAqFJZB?=
 =?iso-8859-1?Q?eCr7SrRL3Dr4SgMLVTk6NBxnA2kdV0ElXYNzu5IvR9TFQUeY04EvdYQpER?=
 =?iso-8859-1?Q?sNwD+M+EQJKDhimGKuWbNPbgF22HQB+YrbX6q8XznhDjWz6BGvD47l4maL?=
 =?iso-8859-1?Q?/ceNtOz22Hvosr4D6YR2pq6Smc9G0Rn3r2puxO8CcQhOhHh2Y1ZNGeItqv?=
 =?iso-8859-1?Q?HkSS1t2bAIYD+X3Q4/C2K94SQDvZh/bWvWhUJ8iq3ZrcZ8TzZ5VgJMgkES?=
 =?iso-8859-1?Q?JtIh/8fxJ7U1MbbHnwnD5X/BA4NxWAlBMpgL2kK6mUlZTn4GQvT+lo1PRM?=
 =?iso-8859-1?Q?B4L0nHl6UoDdNNW4fRA7fieRbgrYxs8wx17voDhyDVObCPMmymdAlrTdKa?=
 =?iso-8859-1?Q?U79PrGC8PXmZm9sSO/YSh+eoemAhteZ0V9lxxG1MaDmWKVVjurOL+O/nPv?=
 =?iso-8859-1?Q?ywbKCo40VcNNtmLlRhEZ+w4zhOQmD+DQ6M/iG0kyIkkRmFW66NHGVUv/MC?=
 =?iso-8859-1?Q?fDXOCu+ufdp3cyYA3k551nXYO+i4VRHXI0exFg4jNv9BlYxTpsqpjhoXrF?=
 =?iso-8859-1?Q?RMLL6BI6D3ZzU2/FzLvb08q6+SO9bUM559n89kKi33yeL7OtQEliRvaefP?=
 =?iso-8859-1?Q?fH6/XMNLl+kJDwOlvRA9ibdj5Ness2UxJ22M6NMjbYEfQs5iTXtR0lZKJz?=
 =?iso-8859-1?Q?Cgmd+ONeIs03/sCCw0fb7ZvNovt8jM1YkRGlX34/ttlKQS3VwJYlTrDlcB?=
 =?iso-8859-1?Q?QBLzB0arKDmcbs6rKQrA0Elyx1AmWC6MGh5rC5yOEEvWNJPUduw4tbBObl?=
 =?iso-8859-1?Q?0BRyxfUc2P6Idvw3h0sTZs3+4IUzURlgVpqnDTEerJOjpptT55uTpg9DJk?=
 =?iso-8859-1?Q?zbhRpdoCmbDMeK8dAdg3CYLW/XwoRvjhjD1YgfGqPdIj/ZMFxNgrr1caoU?=
 =?iso-8859-1?Q?RIaue24JDOu71dRziCCo8vsnGJ9CEW8DSoQ+q6+/zLguwCzE4zvU3Qhur+?=
 =?iso-8859-1?Q?jYTZyRPnFmpeU8lM51+smxxnBuRF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6027.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3613699012)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SCOICpi+BSvm0+5We5guQBNhNdt1Cmyf6A7n5zmsPZ/NMWJsz6lGy/Kk1b?=
 =?iso-8859-1?Q?KejB7GIbpoX3NiitMp6CIULcmQZr/ExdNEP3KkiXptp9oDH15vctV02nSt?=
 =?iso-8859-1?Q?M2VHMumEhGqgO/Ke0sap1nTXzKfd2UheAPZmics1Us0S8v5o56+B+ea6nQ?=
 =?iso-8859-1?Q?cf6woNwt0CqVG70FZUZ8JVUefns0VO7GxonMo2trnDpCm5iyixECstof0I?=
 =?iso-8859-1?Q?Vdgh7hodHNdNQWwWonvRlMGi3mUNoG8fqAHFktJKEw/TpDVxFWcRdE/x5D?=
 =?iso-8859-1?Q?4mme4cSKFBIjsTlOuuISvrKfd0A95gwQvIZzH/tXTBHO/0Hrw0C6uQk6Og?=
 =?iso-8859-1?Q?/Kf6vS838XH4ky+yHlhkm3yh0jszVnBpTf07R8C3wWirqf3ZcXZQIm1kH+?=
 =?iso-8859-1?Q?McCJLm0UdAe/z28OX02wGlKUgUbCMS/6f6XsTgJ+pJQMBQFUX1QsNhNNeY?=
 =?iso-8859-1?Q?4yOiRbC9I+a48lancz165kKn1CDWLMtJZQWrcPc6pFqye9UQhAV4DiOM8g?=
 =?iso-8859-1?Q?ymyL6SyFEQ820geywyWGfsUsk2lVW+6XdKMo0jqcLRpz0RHJbpdCOxBeKh?=
 =?iso-8859-1?Q?b9lFCOb7aCgLcYV2+prV0n5NJOM+yX1uy7IlBHMqyergWvCpILVrVJZOls?=
 =?iso-8859-1?Q?evRy6Fe9pRzfEPYAY/8qIqAwDBVHiuZ61qvj9e7r4/HQVXn2s8fvFr9YYq?=
 =?iso-8859-1?Q?JEKWBImbFyYuqq2UMwvR9kKCBFfv6FrZZSJek9w57i/STukHJCaW2DIkUU?=
 =?iso-8859-1?Q?VypKQK+M4ELLkCnLiCOmcEWIN/+clBtz1IHbKPMYtQ8gz8zooA5LP7bB/n?=
 =?iso-8859-1?Q?0Auw2ekMg+NsB0ONG4npZAcB2p+AMFMUluhDuZ6mya0Q9IlxnPH19cA6N6?=
 =?iso-8859-1?Q?dTTTTkCln/XE3cqoX4o2nYFjBsFt+ekkn8al4X+owWNPLlxklm6QcBlP9N?=
 =?iso-8859-1?Q?XVh9PU+SnZbn9y/lA/dujcqZoNDRoKV7DlMjS0QeiPITEOFdK2/coY01Lm?=
 =?iso-8859-1?Q?AIFP0HLDXBacXyq0IEJnSkrD8XUle8hYb+P6zivA9E9vPrsewsTR9fS80q?=
 =?iso-8859-1?Q?gaWpGaw4eR28Rh6btNlucvDTNgLQF3mUC3/e5Eqn+iR4eD14gpwHUMw0p7?=
 =?iso-8859-1?Q?S6xUePesW/Kmq9uZvMCykiriANoTtAek6abEb2ucistBFkW6yUa1okmWKX?=
 =?iso-8859-1?Q?4blkPNunKeoGTtgZAdASFiMaQ5idQaw4LLnnFZ/2AMT+xif85YCetwNF2+?=
 =?iso-8859-1?Q?vrV0hQ9vdMs/telp4hUJazLoCd8y58JHw3lsVeu7zPj477Xv0XXLdvC394?=
 =?iso-8859-1?Q?UJUQlhBSqbLgcL3b27X1/HZU553z/uxlG6KUXFrP5uhvB3u7QYGQ2ujpwx?=
 =?iso-8859-1?Q?UM2A5EObVZRtXnr2/N1j392CO1p7sMa0DEkTr/1+rL4U1kZB3YzpaDdvjT?=
 =?iso-8859-1?Q?CfJHXma0MDnvRrrOhHkV/V3vPgBs0+iMx/R1wyq3iWWCCOqkxuuVp3BG0I?=
 =?iso-8859-1?Q?o/fBbAHKs8mb2iXVMF27r09SCDmHP/gXusaju0lUA6C7p6Kn8bpD4JKHp4?=
 =?iso-8859-1?Q?2nZ/MO2yxJTHRHwtY7N6JR8xaP1y5hW0LGzh6W1PuCGjLvcTv0FhQVjj/m?=
 =?iso-8859-1?Q?h1Mym/cBuHkRayTrkkCZ+lBW1NuNVa2vl0?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6027.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f8811e-104d-42b6-64f3-08ddf61d9f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 19:08:44.6640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cxQUcNeDPcBfpO6sJeCLjA5EPdxKehjU4iaCTkSEdQi/jvH2QTJ3AQSYhIxpJOYf7Zqhziz9vQUyMh+uRxUfrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5348

Using device tree to describe a guest=0A=
=0A=
Stefano Stabellini (SS): We're not stuck to the existing format, we can cha=
nge it if needed. The value is in having a common interface, not the curren=
t implementation.=0A=
=0A=
Daniel Smith (DS): Burden goes on to the toolstack to have to have the libr=
ary.=0A=
Alejandro Vallejo (AV): Don't have to use the library, compilers can do it.=
=0A=
=0A=
SS: Userspace not an issue, plenty of tools existing=0A=
=0A=
Andrew Cooper (AC): At the moment we have a bunch of hypercalls, some long =
running some short running. Xen doesn't have a model where one single threa=
d can run something for a minute (important for things like interrupt deliv=
ery etc). At boot we don't turn on this checking, but reusing hyperlaunch s=
tuff when VMs are already running can't be the same code as used at boot, a=
s you'd need e.g. hypercall check continuation at a minimum.=0A=
=0A=
AC: At the point you have a hypercall with a DTB blob, you can't take a min=
ute of time processing it.=0A=
=0A=
SS/Roger Pau Monne (RPM): Long running part is populating the p2m. Also iss=
ues around PCI reset (spec mandated).=0A=
=0A=
AC: At the moment domain create is reasonably long and can't be continued (=
as continuation needs to hang off a struct domain). Minimum amount which ne=
eds doing before you can start continuations.=0A=
=0A=
AC: Hypercall continuations are holding a vcpu hostage.=0A=
=0A=
SS: Could we have a different continuation? e.g. domain shutdown has a sequ=
ence of ~10 steps, and you remember which step you're in. Could have a sequ=
ence of steps on create that returns 'done step 1' etc.=0A=
=0A=
DS: Can we look at what is the minimal stuff to get to a struct domain, and=
 modify the logic so this is as short/atomic as possible so we can then get=
 to continuations quickly?=0A=
=0A=
AC: Currently lots gets done before you make the domain visible (e.g. max C=
PUs and event channels where Xen will expect structures to exist at the poi=
nt it can enumerate the domain), so we might end up having to make lots of =
other modifications.=0A=
=0A=
SS: Could still do the step thing, just need to make sure the step to get t=
o a struct domain is quick enough to not need a continuation.=0A=
=0A=
DS: Could we put a flag in struct domain that says "I'm in progress".=0A=
AC: Every single code path that enumerates domains would need modifications=
. Or maybe you make lookup return null but you'll still then need a special=
 call for the genuine case.=0A=
RPM: Similar to is_dieing flag. Could we reuse that?=0A=
=0A=
RPM: We should first try the simple way and see how long it takes, it may b=
e fast enough.=0A=
=0A=
AC: In a security issue we were forced to start allocating the p2m (limited=
 to 256 pages). This is allocating and zeroing memory - this is the kind of=
 thing which really needs to be in a continuation (RPM: Or not done there a=
t all).=0A=
=0A=
AC: If we can split it into the minimal set and then a huge bunch of work u=
sing continuations that might be OK.=0A=
SS: We don't need to be religious that it has to be one call, but today we =
have a dozen and it's not clear about the ordering etc, so going down to on=
e or two is still good.=0A=
AC: If you make it two there's a way to screw it up, but if the first set c=
an get to a point it's safe to do continuations, you just keep on continuin=
g until it comes back success or fail.=0A=
=0A=
DS: This would be a new call. What if we want to do it in __init.=0A=
SS: Had a request to trim Xen down for security - started KConfig'ing thing=
s off, but clear we need to do something about __init.=0A=
=0A=
RPM/SS: Clarified there are people who will use dom0less and want to remove=
 the new call. But dom0less people will still want to have __init, so you c=
an't take this code out if it's used in both places.=0A=
=0A=
AC: Works if you have a binary choice if you want to keep it at runtime or =
not, but when you have 2/3 choices it doesn't.=0A=
=0A=
SS: Safety will want the smallest possible amount of code, will want to KCo=
nfig things out. Can't KConfig out this code (as it'll break dom0less), so =
it needs to remain for init. Will still therefore need certifying anyway as=
 stuff in init has to be certified, so not a massive issue.=0A=
=0A=
DS: We're putting a lightweight toolstack inside the hypervisor for hyperla=
unch - currently OK as this is only used at boot, but if you leave it there=
 at runtime some people might get unhappy with this. Could you have a flag =
for adding this domain creation logic that controls it in both places?=0A=
=0A=
AC: Yes, would need to think of a name that's meaningful (similar to init o=
r livepatch).=0A=
=0A=
AC: The argument for doing this was to get rid of the toolstack and not hav=
e duplicate code in the toolstack. The only way you get there eventually is=
 to delete all the other hypercalls (obviously in a phased way). If we do t=
his, the layout of data in DTB is an ABI.=0A=
=0A=
RPM: Can we define extensions to the DTB?=0A=
DS/SS: Sort of already exists, but not defined=0A=
=0A=
< Discussion around API/ABIs that I couldn't keep up with to note sensibly =
>=

