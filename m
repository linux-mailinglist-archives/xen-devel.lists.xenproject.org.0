Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B428B82051
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125557.1467455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz00T-0005Kf-DH; Wed, 17 Sep 2025 21:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125557.1467455; Wed, 17 Sep 2025 21:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz00T-0005Ii-AT; Wed, 17 Sep 2025 21:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1125557;
 Wed, 17 Sep 2025 21:48:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZihP=34=citrix.com=alex.brett@srs-se1.protection.inumbo.net>)
 id 1uz00S-0005Ic-Ce
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:48:04 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbc9d382-940f-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 23:48:03 +0200 (CEST)
Received: from BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 by CH1PR03MB8144.namprd03.prod.outlook.com (2603:10b6:610:2b1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Wed, 17 Sep
 2025 21:47:58 +0000
Received: from BN9PR03MB6027.namprd03.prod.outlook.com
 ([fe80::1479:e1e0:cc3f:e779]) by BN9PR03MB6027.namprd03.prod.outlook.com
 ([fe80::1479:e1e0:cc3f:e779%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 21:47:58 +0000
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
X-Inumbo-ID: fbc9d382-940f-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcFUAHEz6s8hLN51hF8J516cheSUe7aOJ4c6c8PMvR/MysNR7MxWk5+w87/uX05wHvpDanwWGLB1jG1gNVKXkBckyrndQ5msl+PJjk4ssbVD2gkHzd6+3CONGEJgZacIQE51JJR7TuN+JQmDo/MhBgVmVhSEFusYPLHE4ZIcJK5vm8Bbg385fftf1APIyLL/ePH6skCja6F3YteVmNNWc3z4RkJTbTwgwov9BUK9vrPFq7qRvpI1Crm36H8r2bEow6EgiLgA8UTEuchPcw4CPcNKzwLgb4zXghS/dGKcxyyvaiyuqVexDLv3to7JXsukodbCQVZTtx9A5nxIFceh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqlyYNVNhXEp9Fi0bA+1lpK3XT6l3i5r82cA1VrtRwA=;
 b=Q/CTZmrRqk4mzNHcRmRZS4h2IHagdqoqUJ9rf0PpWFO/1yctYSi4JJ940REw0Ksxu/ZeDFJgXHQJVkvB8RuKGoAUyER1wuvYJexr/PA45oIUf3SnxFszlri9atNr6yQVWq9Pwg7o24L+kkRJwSFO1vWavSFbC3VrNaKmq5RKILqaT4SGxHG4za0FGCOhC300ChNDaBIFA178bf/J0+aSV0zk7djaX3/jNhjcGwtFaRQNrKRKI9nCFP4YnbFYH67xuIiIY6TeZgGy06xguBUKBAKWsCvWfb11GeQDa7xBTx4kXOsjEKWoVieV21MrZbPoYa9kUGzYJzX5l70+ULj53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqlyYNVNhXEp9Fi0bA+1lpK3XT6l3i5r82cA1VrtRwA=;
 b=D63X944sfaHsAZLXRBvUhleHs4rNFCzqTsX7lvKCYSsZoE08Mg7HYKMqjYK925UtqDh/sKLNgB/76MnwmhhPt4SZexiI4s17xZIhkXxiEuQrVEmduQFzdQJh1KMILNGbM8eCV5AahhY9C9MQGRq/mr/2LxDpg9DJSubXL5LLlvE=
From: Alex Brett <alex.brett@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Xen Summit 2025 - "Secure boot lockdown" design discussion notes
Thread-Topic: Xen Summit 2025 - "Secure boot lockdown" design discussion notes
Thread-Index: AQHcKBy7JW6IllbzNUi2Us/gVvFCOw==
Date: Wed, 17 Sep 2025 21:47:58 +0000
Message-ID:
 <BN9PR03MB6027EF0F0D5FAB1D3B55AE5EE317A@BN9PR03MB6027.namprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR03MB6027:EE_|CH1PR03MB8144:EE_
x-ms-office365-filtering-correlation-id: ac003adc-5373-4223-94d7-08ddf633de27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?SSbF8I0sfmx8518OgMpTvs2iZxQQjIW90WBC8Jl3tFZk4p9FX/p4g5H9I5?=
 =?iso-8859-1?Q?hjcZPn5yfq1ZA7NDrNhvHnZF2G4buIO/EtRB66p3iJapH9tLOBsr+eSAkC?=
 =?iso-8859-1?Q?zVHUazqhGI+PpUpbICq5hKB5lne4ur4gwL85YmnT55LvjIGGVQy89/rmPi?=
 =?iso-8859-1?Q?Fk7y7QBlnkwSYVBnzi+hCPpD5HWAnQvXnoISkkeaQtrxrs9CAWMvykgmpz?=
 =?iso-8859-1?Q?sjAIyEs+TYvZSrNoEYfpAF156JBraMFch2gcsg5McaZXsdi9CTFg6H5ouG?=
 =?iso-8859-1?Q?8yU9B//aM+3O8EWNQOKpnVUrpiyxiyNA7sJzaCAc9MEov9UgDj/cMufTIK?=
 =?iso-8859-1?Q?dSzGz5lK2DYfBmsjQqr8dN3/F9yrCnEB2/q5530To52foypw7TuGJURHho?=
 =?iso-8859-1?Q?SuMPnzcNcOkGLQj6t9FleHdeWZJlGIjszQFtsF+VWFF0/EWtM1NFabi/YV?=
 =?iso-8859-1?Q?YX3OB6CGmNMoGXlj64bWExdPrqj4p0xjrnZHUOC4LEsVt1Yd0aQDTvUh8X?=
 =?iso-8859-1?Q?ZfZAGAATqkhS1BSJxqyWzfUzF7wBXr6G+Mlybvu9BMCFbbUe87pFlCZc7C?=
 =?iso-8859-1?Q?rVufma+6OdjP5Af4tLONdwewV3Fh4t0nDWg/D1kMt+Qul1obX6c6wSfK1o?=
 =?iso-8859-1?Q?gOeYilSb4rbDh2twfrq/ei60D3e6gUGZOxKZP2ede+HBOVwFKqb/eCj00t?=
 =?iso-8859-1?Q?zOoCVjhxmEzhnSuiVsvq6Ms2m0WioPqcEH4keNCOTf0xnmHrvq0XfWeVTm?=
 =?iso-8859-1?Q?POEYY5wHamP12Hn5IessMEba/qW0oZCxY0YXgev8LG02ZwgtXx5EvL1leA?=
 =?iso-8859-1?Q?upDXAzsz3QS7rdoUHAKrzRq9FxnVfBBCi8sV8JVksms+PxTanfnq5FHRb7?=
 =?iso-8859-1?Q?SHMjh4JogjLyWkE3ab4shnKoyoHApeNAfDUycuWAlI72eOGFeEZ4vu33a6?=
 =?iso-8859-1?Q?G6qapgVlbhcHX5aBTgkUYL0ittVs2U8HyEvz9NykhSc+SHHv56368ugVGR?=
 =?iso-8859-1?Q?UUQG0wayz5Dy9VBqpn0rL1O1H2EzQ49g8G4nDQOjf80uB3ktM2vysyzqOf?=
 =?iso-8859-1?Q?D/5AkkBLZi5XXI6oHuwb2yBj6o+pDdqG7GTWQvtkDaLrfvEDXfPyidJqF1?=
 =?iso-8859-1?Q?NAMKyxBXkdM16EYBka+fMQsoD7ToZnr2SmbIpqseDDcYDfLq8qPKw7g27g?=
 =?iso-8859-1?Q?taiYX39YPtQ4Wpn1/LjftgjM/DCfTGxIua+7EUbadZhNt1rVyyRaUJWeNY?=
 =?iso-8859-1?Q?josd6VE9N5gJLFpD9dC8IdQLQDwh1At6lBvR4OQztUSFMEuQU/wQUReAju?=
 =?iso-8859-1?Q?xUWoxqTQUv9R3MW67po4rxByRJ/NdPGxvTr3O12opSphoQ4yKV2dINHlOP?=
 =?iso-8859-1?Q?Q0rueXSjw/ujaoPh2GWaCj5DeN1eZKe/qWA4dxy0Dae2UfZODkZoiSfWjO?=
 =?iso-8859-1?Q?ZJIl8XMGJnAgniFQNjTWZiqc8FlIf7XkZed9KYtC8/3/syZl1U9X/RVYLO?=
 =?iso-8859-1?Q?7pzqEoq+gf4YdBzdYbJpX3q4VD9dj4iaj1/m5SgynNTQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6027.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hNNDtvBbp/JrnHFNywwhR/iNgGrYoLo/d6pC9/Y4aQB1AmOjqVMW3HWCtY?=
 =?iso-8859-1?Q?0tedHGSLA5cT4dHPL5y+9D3Ks548fPY3vAQWSLd1UoRxzegT4R9Zc7r0Zz?=
 =?iso-8859-1?Q?Lw9mznqEeL6JlMHgcwiQ/xSspqWAosXZNdMy3f8gcg7ZCmepIUVJH/Iyoa?=
 =?iso-8859-1?Q?lLg3NDD/835I8I4oBhSW48n9teslQnxVvZXkCGFd3vZC2eS0Pi3Cx8ay/S?=
 =?iso-8859-1?Q?fNG5CygKPGiq/1nl/zwkl7/yQxtlZ9yg9/UQi5/K3KYaIYwdV4L8LbqhZt?=
 =?iso-8859-1?Q?CPg++jJcm1y0RVX94PWc8+4HHwUyJCb92uFV/5+IvGXWjOinuT9Ocl3ogA?=
 =?iso-8859-1?Q?NA9dGJfaZf8HCrzDOug9Kk2qwxgt8y4LHAUhn5FfScbfAo1QpJT6ulM9/c?=
 =?iso-8859-1?Q?fqrdR/eLgZn3pEIYiQNnmUJ5Ekh1qfZUFQTY8ufwvyNc+6iY8/ROcF0Vc5?=
 =?iso-8859-1?Q?sWsakGJ8ilTAybexjPPP2BPiI/HfWkFfFc5eg3RD3FvgFyfAqtqmbKbGwW?=
 =?iso-8859-1?Q?7NLdNb4vH7UfqMr9TDlmkzrMzwfkeGWikrcGDtNOKbqcXJ8gStyZP39nzL?=
 =?iso-8859-1?Q?bvLELvWYxMdmH0P8EGlpeTRa3AXpjJG0hL2zJETB8Lb8xXPZnyUFPtyPw5?=
 =?iso-8859-1?Q?ZKjLzSmw/8zIM68s9mAztjMln/c8EkFemC0rO0fgUxyBckVMd5o9w1W/GV?=
 =?iso-8859-1?Q?JQBLP585taWPuHC1PTV4STsCXs+TwwgR8FnJhhPZtciLprT7DycXQZZY/N?=
 =?iso-8859-1?Q?zAkX6+r7AaY9/YAP69FHEdGZWz9KDtu8BZV8MI/uf81Qn349WCMfSjJBDP?=
 =?iso-8859-1?Q?itmnyHmyFELQaa2nGO2N1Sp0uBGhPwSUM5JmI2EhD6OmpyqJFlxjMjhJZ7?=
 =?iso-8859-1?Q?A8NVCYlsl0i2dlthw8GGre3fcDhNk3p/kaad7w1jbhwa8k4618FBknInpt?=
 =?iso-8859-1?Q?dc2+ALb4TJBjaDr16IQpVA0+swUWs82dSSLudsV+lTB2ayPZeoxsN0ZsTv?=
 =?iso-8859-1?Q?Dr9cqr4xCvhlnZXIAw2CZiouaTw471GoNKE6hNcDeai7PBKeGj9Rrxl5cE?=
 =?iso-8859-1?Q?qz3dP9svtyPDXJcnCMxz9m9GBRjeld25z+LgREBSLpe5ZurMPDaa7oCG8j?=
 =?iso-8859-1?Q?RJ+IyQ4zUkbwitV6VkHBGsP9zKWkEi1Kw9976qkqjnN/Dt40tWgvbtIZMW?=
 =?iso-8859-1?Q?iKd2++1PHzH1JKCVsvXXW2nalkfFV5s3Cq8u+hsSDZH2GMlWV50ZAsafp7?=
 =?iso-8859-1?Q?2Nnvg+9JBjiXt1F6VW7tsDPSXpsrOfnAmUBQzUqV5k7iBTYuBqYsBYmCkb?=
 =?iso-8859-1?Q?cw/Chy06tgmaCJkav5anj2ER0jJhI9T9l6Er8FmRc5B1qbdjPorR7Gng03?=
 =?iso-8859-1?Q?mTOaUlhLOPhU1V1V/L+PpMm9OzWMq5P75o+wSWnw4fORAbw3aW7Wrcrbeq?=
 =?iso-8859-1?Q?g8tEpydvdctMW5aA0HNpfFpZtrcFoBDbC8VDKCm6Uj+z5+Px7WzKbUT5dF?=
 =?iso-8859-1?Q?RlFDcf2L+Av9KUNcos7HoAudUyNbwoBFK+Zru2MIRF+yILdAY0LElFhcQs?=
 =?iso-8859-1?Q?V1kInT3YrfCi8qugqKpbgqFkaXtXFWhU5CER9WiTBRkWbwe8a6tPdNnzpY?=
 =?iso-8859-1?Q?quER0d5xigdHT+M63TPqdX0a0BMBP1hlMa?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6027.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac003adc-5373-4223-94d7-08ddf633de27
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 21:47:58.7271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JoN0rID8tIKMaXRzbSOdnTZcTHrJm9fQZ6Mzk0DkK03BDyzC8tx4nlx96LPwLlQc9wtBv3QtjdZk/ybTzSNjbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR03MB8144

SBAT summary: Upstream Xen will not maintain a generation number, but will =
publish recommendations as to whether downstreams should bump theirs in XSA=
s etc.=0A=
=0A=
Lockdown: No patches currently merged.=0A=
=0A=
Andrew Cooper (AC): Done initial secure boot policy document, needs refresh=
ing to bring up to date and reposting. *ACTION*=0A=
Jan Beulich (JB): Document should be able to go in even close to the releas=
e.=0A=
Oleksii Kurochko (OK): No issue with that :)=0A=
=0A=
AC: Document is trying to state the security boundary. Get this merged, the=
n patch series will also include moving things from In Progress to now set =
in stone as appropriate. Document is used to define the judgement the secur=
ity team will apply when considering if an issue is security or whether it =
impacts SBAT etc.=0A=
=0A=
AC: With this in place, it feeds in to the design for lockdown in particula=
r. Lockdown named after Linux way of doing it, just a name (though hate it =
but can't think of a better one). Idea is if you boot in secure more it's f=
orced on, but want the ability to turn it on even without secure boot (for =
testing / ensuring you don't introduce things which are relying on it not b=
eing present etc). Framing lockdown mode like this does change quite a few =
of the discussions around e.g. command line parsing order etc.=0A=
=0A=
AC: Can say if a developer is using it for testing purposes, they should un=
derstand command line is parsed L-R and should therefore put lockdown optio=
n early etc.=0A=
Yann Sionneau (YS): Need to ensure we don't allow lockdown mode to be disab=
led when using secure boot (AC: that would be a security issue and need bum=
ping SBAT etc).=0A=
=0A=
JB: Lockdown mode outside of secure boot primarily for developers.=0A=
=0A=
AC: Don't want to worry about having to do multiple scans of command line e=
tc (for outside of secure boot enabled), as command line comes from multipl=
e places etc. Trust developer to put it in the right place.=0A=
=0A=
JB: How do we deal with something on the built in command line that's not p=
ermitted with lockdown?=0A=
AC: Should be allowed=0A=
JB: What about in secure boot mode?=0A=
AC: Good point - might need to pass a flag in=0A=
=0A=
Marek Marczykowski-G=F3recki (MM): In the unified image should the command =
line there be permitted to bypass lockdown options?=0A=
AC: Yes, the command line is part of the signed image etc at that point.=0A=
=0A=
MM: Should add a CI job with lockdown enabled. *ACTION*=0A=
AC: Yes, in the Trixie containers we're now far more amenable to testing th=
ese things. There's an OVMF ROM that has secure boot forced on along with t=
he private key to sign the test image that should enable doing this.=0A=
=0A=
YS: Is there a security issue if a command line in a unified image disables=
 lockdown?=0A=
JB: We wouldn't have an option for lockdown off, only to turn it on=0A=
AC: If as a downstream you sign an image that disables security, that's you=
r fault and you've got a security vulnerability. We can't always prevent pe=
ople shooting themselves in the foot.=0A=
=0A=
AC: In principal any binary that has had a signature check is in principal =
good, even if it does things that wouldn't be allowed in a runtime command =
line argument.=0A=
JB: If someone signs something with a wrong option, that's not Xen's fault =
and not a security bug in Xen.=0A=
YS: Agreed, but could we put code that shouldn't allow things to go in to a=
n insecure mode if secure boot is enabled?=0A=
AC: Gave an example of a HAP superpage option, which wasn't in the list of =
allowed options so was ignored by Xen (but is safe to change) - being able =
to embed that in a built-in command line makes sense.=0A=
=0A=
Daniel Smith (DS): At the end of the day Xen doesn't want to be in the busi=
ness of dictating to its users what's safe or not=0A=
AC: Gave an example of COM port options that are in most cases safe but IO =
base can allow a vulnerability. For some of the more complicated options it=
 will be difficult to know what's safe or not, so giving downstreams the ab=
ility to declare its safe and run with it is needed.=0A=
=0A=
privcmd=0A=
Alex Brett (AB) (on behalf of Ross Lagerwall (RL)): For lockdown of privcmd=
, the only part we think needs fixing is the raw hypercall access (IOCTL_PR=
IVCMD_HYPERCALL). In XenServer, we have done this using an additional filte=
ring layer. This is not something we want to upstream since it binds the ke=
rnel to a specific Xen ABI. Instead, we want to introduce a new stable hype=
rcall ABI that allows the kernel to filter in a generic way (much like dm_o=
p). We haven't scheduled the work to do this.=0A=
=0A=
AC: Explained that it's the guest kernel which needs to decide what userspa=
ce can and can't do to send hypercalls. In Linux secure boot requires you t=
o call access ok on every pointer or memory range etc. The new ABI in Xen w=
ould allow the kernel to do this without having to know about the Xen struc=
ture, by guaranteeing there are no pointers in it.=0A=
=0A=
AC: You have hypercalls that are safe, and ones that are not. With privcmd =
currently userspace can violate all kernel lockdown protections, so need to=
 ensure the unsafe hypercalls can only be issued by the kernel. Fine for th=
e kernel to offer e.g. /dev/xen/eventchn as the kernel is mediating the acc=
ess.=0A=
=0A=
AC: One thing to do in the document is to go through hypercalls and subops =
and classify if they're logically a privileged command or a control plane c=
ommand. This gives the separation of what's strictly kernel only/mediated, =
vs things a kernel wouldn't care about. *ACTION*=0A=
=0A=
AC: Other issues, e.g. toolstack uses eventchn_op targetting a new domain, =
but this would ideally be a domctl op.=0A=
=0A=
AC: Reason we said secure boot v1 will only allow a monolithic dom0 is othe=
rwise one privileged domain could target the other and violate specs. Also =
need to make sure certain operations can't be performed on yourself.=0A=
=0A=
AC: The XenServer filtering code (which will be released, just not upstream=
ed) is a good starting point for what needs looking at. Fits into the wider=
 API/ABI plans.=0A=
AC: The XenServer code is a stop gap to be able to ship (and hopefully get =
through the API/ABI community).=

