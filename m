Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F9C2049C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 14:42:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153717.1484006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vESuk-0001fT-W5; Thu, 30 Oct 2025 13:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153717.1484006; Thu, 30 Oct 2025 13:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vESuk-0001cM-TP; Thu, 30 Oct 2025 13:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1153717;
 Thu, 30 Oct 2025 13:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAXf=5H=siemens.com=haseeb.ashraf@srs-se1.protection.inumbo.net>)
 id 1vESuj-0001cG-6N
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 13:42:05 +0000
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c40f::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3528811b-b596-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 14:42:01 +0100 (CET)
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 (2603:1096:820:87::11) by SI6PR06MB7270.apcprd06.prod.outlook.com
 (2603:1096:4:24a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 13:41:53 +0000
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523]) by KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 13:41:53 +0000
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
X-Inumbo-ID: 3528811b-b596-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQihtHF0AK4sge7v54rGzrySLWQdwm45JstZsEue+QT9VBTpXr1pQhfHU0C2gA/FxApcBGq8I+s+d+6bHj5YlZQO9GlU8F2ttMWnElvwm5HSdbpAY/n49hq2k/WdnhCWazGp0l9GCTOmrpIR9IwF2lQk4MZGw48dYlaubSQVcpiscyeuIMiDFHNFX9ySxzQx3itecxSOV5F0WOjc5l9B9JhZprR09ZjFr2YA2iLZ5rwMYiqKXDUUz5TGi+KP2XGqDplNdz29Bb4Twb/ziOnaAlzPQ7rBTHbe2+VchOBWrcnivkE96QFQwF3yO0WCvOK1DRwZ/qeKPcTC8EADQ9LJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7aWDt8g5z1cxCqCB4c7aoXoSY3AGcKGkqXkPCZxVks=;
 b=tN64sxUjP6XeeljX5Qw+5qT10sGbbderEiD0wwZBRHwGUzptO8yY+700dfG+IOJ2Vw0mMLfoYVOY36pPhj5hIeJnxtO9esU6gKe/Vo03H7U7G4hRIrNjMLKuqc91mgk6IizhE1BPwIk+GJkXGxjgUGUF99WS1XZaFiVPLrYv3Hb9SryJZZT4xXNuGz6bqNeiYmpqL53guBiJ5kyQnP2FXfqWVkPPiDZZ24V15yhzlnfHpyJKE6YcqBbRezARGJ/LUa6tFIv54WYEsCD3A4uqp59rkyb5Ja/oc/4yNH/GgOl7jTRCARidaQdMFQ5zzsDRUFba7XKWgjUgXP50Lmpe3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7aWDt8g5z1cxCqCB4c7aoXoSY3AGcKGkqXkPCZxVks=;
 b=LxsZ3Lvh1QnLILO8FYSmqe7jbi8qx635katQZFovqay1+l5RWpZBZa4EvyuR9VzGd3aHJa4MTltfgicypE8kTU1HSIrZLqgtMunS69EKzvVsUxXqH+4rrwRU8jX57OlkKX41N9qOHlftUr+iTi5mgoQ0rAzIb2ldyjSATz8yvGjvlu/lql46RN14r1YMvqFQiGsqk4wZf6kK016nxm/6gg9ixde6OYG9+i/uJSbSZbi0lph1Ku+yOA+Np3zO3Efqziw2+Hp0YaUQjSvQNOQZVpW8Tw6l5AKzn5fz+LaTWgjrQ2x/ZZFpMBEhZXb4T6cjgt263v1QhwCOLlH6CSmJZw==
From: "haseeb.ashraf@siemens.com" <haseeb.ashraf@siemens.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>
Subject: Re: Limitations for Running Xen on KVM Arm64
Thread-Topic: Limitations for Running Xen on KVM Arm64
Thread-Index: AQHcSVi3paxtnyIgIkOf6jhuJCbvfrTalv6c
Date: Thu, 30 Oct 2025 13:41:53 +0000
Message-ID:
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
References:
 <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
In-Reply-To:
 <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: julien@xen.org
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-30T13:41:53.035Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4588:EE_|SI6PR06MB7270:EE_
x-ms-office365-filtering-correlation-id: a9667c74-12b3-4586-76de-08de17ba162a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|39142699007|31052699007|1800799024|366016|38070700021|7053199007|8096899003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0JE2zOKvu1MsH1UrSCJseMupmv/O0d06yQJ1RLIPUaY5PRsbGO7DM1k6V457?=
 =?us-ascii?Q?+kUth+5Xi3V37cydiaq/bXGJwe/N0GJ7jo1OAMJQhNfSBSJuky4TBgYV0jqx?=
 =?us-ascii?Q?qLubhGbN1MI3wcekvJOTqN44XhQ5waMu7DGKbvAZ2wMv3w92AVj1so5zextQ?=
 =?us-ascii?Q?JBDgKmDo09uDaK+YcT/yDsJeFIeB1Oj+m8KRjaUK1VUopxTSxv5WU+WXB115?=
 =?us-ascii?Q?Iv3+XieIUj/PKoH28MdrloFeiNyn8uJmBx0AQipkBawhuQ7RL1UgERsCPReW?=
 =?us-ascii?Q?y60sMw6UVEbeQc3gn0mSHuXURbm3wgPPy35YndtNGX1bmT/NUCP32XjeTK3E?=
 =?us-ascii?Q?IIUitYkLhm9I7A0Rx7msQGaNyRzgz83ZemzlqyPgo4VV2YgfnHFABZj3oqfH?=
 =?us-ascii?Q?dHeqyXzo0Tbmmhq3UQ1MELPbDoPjO4TnGASmAumqU1P3iHr9vLH4kib6jfgi?=
 =?us-ascii?Q?fcXudboLIu68NA+LuSCqEWfqFfvKcP4YSJ6T4wRMNhm1Bm5z51+xifqUcDM5?=
 =?us-ascii?Q?wSWcl1MBRgvQWDcYdy2tN4UVnwYmO0tYB2n+bUaN3Rjy+m1NKSlzMFFPa/c2?=
 =?us-ascii?Q?a/adjVSY78+BoBPZcrymhr/yHLNEHu1S/uK/O2Y6Lwu16g1yfNEuZV0E53kV?=
 =?us-ascii?Q?0DRekX/eThKeopyZII5fJKuHPeRGR+JlVTK3XFRI/PTNLWp7VTYIgQAvcr1u?=
 =?us-ascii?Q?8F4N1hY67fhiFtR+d7C3a4QCMAPWd59PiTvE0MSxNkh+gcf29KZdGkKvXt2p?=
 =?us-ascii?Q?5Wa4dJu/2MDDHtikVo+ZgP7nejmAhS+Tv3FPYX4t4q8xc/S89hYZZgGlfcaV?=
 =?us-ascii?Q?SP031A+imtnDZA3NBwAsgIeEOcA8qo3uvuSujKmDUxis+jEAqXJcJNryuKlr?=
 =?us-ascii?Q?Crgh4ngZ4DS6s7CqeAUQsVxP/2mHIyeT1Bjr5M5M5UNoIzIXZuZrV+yK134y?=
 =?us-ascii?Q?4DrQYIj7O5CT1zv5BBbecgbyLZnOdN2DGPtWsOYbv+JYuVNlkOlJcExapXDH?=
 =?us-ascii?Q?D+Kq/7p1oiVs8/0ltVT+P3AC7QVteKvtA0tLLFG8xZnd4wu9cLsxasXGGsuP?=
 =?us-ascii?Q?GVJEAWHiUfoDx6u56nMlEvh9wcdg+5SIfos2/XPjJBMq4CvBUEjf3+sZs1Rj?=
 =?us-ascii?Q?qndz1OsZb/5zhDUEdloGCcv24ePT+AI6pGeiSLIPgnPiG5DZTJw7Ngv+N0OU?=
 =?us-ascii?Q?se0EIRpK9lpKtbah/SCsRLsbc0mDUpmLI1nsItcxVfaor+52DT9xaCQGtTGW?=
 =?us-ascii?Q?KheppY3N2YKQOEKM8XkBBqqV18Hd0WtinDE7huCl5NAdBZp1PcIu1WMmPOn5?=
 =?us-ascii?Q?k7R8aGqFbdSd8cxLLALCEaSJQEM76ue1pTBx738XHrUqoSV/llt+DNGPbFiZ?=
 =?us-ascii?Q?6FP12cUsspXD3RKGpfYBhvZRT5QjtOAzwWbow5Ak+FHpXPaaRcB3lRYJ628V?=
 =?us-ascii?Q?4SE40b92JcUnn0MXVjyO3qlGkMf0QRQ7HFIaqzFuQs3u0WorDg5eICwi7qVd?=
 =?us-ascii?Q?ZGEfKspW++BcUYGZ/K/zjxx9lV9K0/xky6NC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4588.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(39142699007)(31052699007)(1800799024)(366016)(38070700021)(7053199007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bmUQmyatudOHl/z7H+4dMQbdt7EdAQrzQf78VuTN4CdO9/8XDdLPxGHfjC6w?=
 =?us-ascii?Q?kihTvq4pXeE3OQzqDdCU2lBLZPNMsBiJcLFvSEqwcjGwt/msefNV7qPU9Y8y?=
 =?us-ascii?Q?jVjlauSTtLQzJdhT5850+dXhYYjdffXOFmckh8EYrFWJwCC6jphLUatNwyX3?=
 =?us-ascii?Q?JKQ4A7YJah2E5H0jTBqKT/0celwFIMsZelexuQNJffxhzHBIu9TfE/+72sFP?=
 =?us-ascii?Q?Qsga8JLOYCAgxA+T1XQPa0hMZ/U/PyoJGtdj1SxmvycmMPrPONdcOX+m1U2N?=
 =?us-ascii?Q?4Xp2KdiwGHjduKobgaN9ao6IZKjXDpk8ZfT5N7AKKdP6GYuwo7S9hgK0FpoS?=
 =?us-ascii?Q?hGpQXTRTLvS+OKPVQnVF/0t5z5elV8nELBhxL3EAke36WQ8CfZCJzN1xX3jN?=
 =?us-ascii?Q?uUAYaWxGWEhgVQAMQQXNVTHZHC10CAyiV3MYXIZRxhIc+g7MpvMpAAJoCj9A?=
 =?us-ascii?Q?ndtweSLamxhVlV9YbtLO5jNW5d+whN0n5GPayQLxgL00hVn6pOncPRVsUFb9?=
 =?us-ascii?Q?8b/RuV+vD5hC97M59aFfDXJW+G9SEMPietNh9o/AXH6XmFjIoZ2iywDR3I0w?=
 =?us-ascii?Q?/By9Jjx096r23eQEyZXTvCPlNxxJIxkUYnCIGAmhW2jhxwh5FXAdrbxoZ848?=
 =?us-ascii?Q?TQW+jInJ2r3De8z5ocH3N+SbFwligtrQHW+Y/gRwKleszzAsa7unJwcwx7AI?=
 =?us-ascii?Q?8d1P3e+IB7eP6plXJ41hPdSr2JHVirTGw0G7SVhH/pHrqxzI86GfD/0EH8le?=
 =?us-ascii?Q?yMPcqoAJTkj/2WSeHATKPtlNBwaaecsN3Pf8PQO6BPtlW7Ann87mUVMdWwTM?=
 =?us-ascii?Q?y2sDGzlkgHCIIF/OBx/0k4V1+K1RkE6rBIB3JR5UhcwckPmVgN/SXKW3HNuf?=
 =?us-ascii?Q?w3LUDMyTsBS+10YbrJTmr1AMJ8Bc0PqjkIlWlSKCXHzO8KCR9mxP2sjJBQTv?=
 =?us-ascii?Q?r1pAg3RcQMGDm5aGZjKEgElNmNr7anH1z5nYlGXJZdY4z0TuRruaITP3XzlH?=
 =?us-ascii?Q?yCqZtl7VkjH0BLP5ykAuh5Sldf4gXjCKEytpgnBtoRDRPoeu7smQ7KGQ/Jd3?=
 =?us-ascii?Q?H4btV1+VhuaM1C5hEU4qurKLIKrgYySc7kOHcdCJjirtJiJY0mKvhwjbBF5p?=
 =?us-ascii?Q?NyGtHUH6pWSGZKLAtlabHpvG/E7JBxdugrwpEKwvbBHPq5ZW9rqV+pIFfhN7?=
 =?us-ascii?Q?Zfk4sjAQpQKkB6nrFNDP3vF2LI3Ok23WaKM7efWMD2UJH5R0c5KIBFL07Cyp?=
 =?us-ascii?Q?V1eDU7g6aCqw1XAVQD7I5xzpYV6bhTJJ14uuIUTEPRgY9fkCGO7tMQJZHeeg?=
 =?us-ascii?Q?ebEjNgGbEc8Kitisno+cqWgO9zPbtU+hqgv0b2BP1tPX0V9up6CfJl3aV7ZY?=
 =?us-ascii?Q?aUtmnukT7Nc7y2T8i7/BjKW4S2EoJu4Kz5KizxzNYJUOR4gcge0V0WKUTK/u?=
 =?us-ascii?Q?Y8FS53tE5z0UDkcAvTIEiY0cWR/lQa/wQ+fq7CQBl27d6UyeseQcyqAOT2ZP?=
 =?us-ascii?Q?/DDVHB5QXsYca3uHqxWFDZdnm1pJQgUVuTJTX5GeT01gSMeXokfMf/0I48fG?=
 =?us-ascii?Q?+k947EnA2n35gSzdF9xopr0UEvIQ6Iz8CgTkE4kj?=
Content-Type: multipart/alternative;
	boundary="_000_KL1PR0601MB45885505ECBBE9262C2B25E0E6FBAKL1PR0601MB4588_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4588.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9667c74-12b3-4586-76de-08de17ba162a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 13:41:53.5901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2AgYdlf1htWSg6cNm+13T2Pcip5OtAXmS88XHm5XFtazrNOe7Fo9uLlLUPwL+5l6sjY4UhVAbKZQVQ2kk6gaUZHIZ6l7GUGqbEMGvZ2dq+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7270

--_000_KL1PR0601MB45885505ECBBE9262C2B25E0E6FBAKL1PR0601MB4588_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Adding @julien@xen.org<mailto:julien@xen.org> and replying to his questions=
 he asked over #XenDevel:matrix.org.

can you add some details why the implementation cannot be optimized in KVM?=
 Asking because I have never seen such issue when running Xen on QEMU (with=
out nested virt enabled).
AFAIK when Xen is run on QEMU without virtualization, then instructions are=
 emulated in QEMU while with KVM, ideally the instruction should run direct=
ly on hardware except in some special cases (those trapped by FGT/CGT). Suc=
h as this one where KVM maintains shadow page tables for each VM. It traps =
these instructions and emulates them with callback such as handle_vmalls12e=
1is(). The way this callback is implemented, it has to iterate over the who=
le address space and clean-up the page tables which is a costly operation. =
Regardless of this, it should still be optimized in Xen as invalidating a s=
elective range would be much better than invalidating a whole range of 48-b=
it address space.
Some details about your platform and use case would be helpful. I am intere=
sted to know whether you are using all the features for nested virt.
I am using AWS G4. My use case is to run Xen as guest hypervisor. Yes, most=
 of the features are enabled except VHE or those which are disabled by KVM.

Regards,
Haseeb Ashraf
________________________________
From: Ashraf, Haseeb (DI SW EDA HAV SLS EPS RTOS LIN)
Sent: Thursday, October 30, 2025 11:12 AM
To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
Subject: Limitations for Running Xen on KVM Arm64

Hello Xen development community,

I wanted to discuss the limitations that I have faced while running Xen on =
KVM on Arm64 machines. I hope I am using the right mailing list.

The biggest limitation is the costly emulation of instruction tlbi vmalls12=
e1is in KVM. The cost is exponentially proportional to the IPA size exposed=
 by KVM for VM hosting Xen. If I reduce the IPA size to 40-bits in KVM, the=
n this issue is not much observable but with the IPA size of 48-bits, it is=
 256x more costly than the former one. Xen uses this instruction too freque=
ntly and this instruction is trapped and emulated by KVM, and performance i=
s not as good as on bare-metal hardware. With 48-bit IPA, it can take up to=
 200 minutes for domu creation with just 128M RAM. I have identified two pl=
aces in Xen which are problematic w.r.t the usage of this instruction and h=
oping to reduce the frequency of this instruction or use a more relevant TL=
BI instruction instead of invalidating whole stage-1 and stage-2 translatio=
ns.


  1.
During the creation of domu, first the domu memory is mapped onto dom0 doma=
in, images are copied into it, and it is then unmapped. During unmapping, t=
he TLB translations are invalidated one by one for each page being unmapped=
 in XENMEM_remove_from_physmap hypercall. Here is the code snippet where th=
e decision to flush TLBs is being made during removal of mapping.

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 7642dbc7c5..e96ff92314 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1103,7 +1103,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,

    if ( removing_mapping )
        /* Flush can be deferred if the entry is removed */
-        p2m->need_flush |=3D !!lpae_is_valid(orig_pte);
+        //p2m->need_flush |=3D !!lpae_is_valid(orig_pte);
+        p2m->need_flush |=3D false;
    else
    {
        lpae_t pte =3D mfn_to_p2m_entry(smfn, t, a);

  1.
This can be optimized by either introducing a batch version of this hyperca=
ll i.e., XENMEM_remove_from_physmap_batch and flushing TLBs only once for a=
ll pages being removed
OR
by using a TLBI instruction that only invalidates the intended range of add=
resses instead of the whole stage-1 and stage-2 translations. I understand =
that a single TLBI instruction does not exist that can perform both stage-1=
 and stage-2 invalidations for a given address range but maybe a combinatio=
n of instructions can be used such as:

; switch to current VMID
tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA for curr=
ent VMID
tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA range for c=
urrent VMID
dsb ish
isb
; switch back the VMID

  1.
This is where I am not quite sure and I was hoping that if someone with Arm=
 expertise could sign off on this so that I can work on its implementation =
in Xen. This will be an optimization not only for virtualized hardware but =
also in general for Xen on arm64 machines.


  1.
The second place in Xen where this is problematic is when multiple vCPUs of=
 the same domain juggle on single pCPU, TLBs are invalidated everytime a di=
fferent vCPU runs on a pCPU. I do not know how this can be optimized. Any s=
upport on this is appreciated.

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 7642dbc7c5..e96ff92314 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -247,7 +247,7 @@ void p2m_restore_state(struct vcpu *n)
      * when running multiple vCPU of the same domain on a single pCPU.
      */
     if ( *last_vcpu_ran !=3D INVALID_VCPU_ID && *last_vcpu_ran !=3D n->vcp=
u_id )
-        flush_guest_tlb_local();
+        ; // flush_guest_tlb_local();

     *last_vcpu_ran =3D n->vcpu_id;
 }

Thanks & Regards,
Haseeb Ashraf

--_000_KL1PR0601MB45885505ECBBE9262C2B25E0E6FBAKL1PR0601MB4588_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Adding <a class=3D"tWKOu mention ms-bgc-nlr ms-fcl-b" id=3D"OWAAM616784" hr=
ef=3D"mailto:julien@xen.org">
@julien@xen.org</a>&nbsp;and replying to his questions he asked over #XenDe=
vel:matrix.org.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<blockquote style=3D"margin-left: 0.8ex; padding-left: 1ex; border-left: 3p=
x solid rgb(200, 200, 200);">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
can you add some details why the implementation cannot be optimized in KVM?=
&nbsp;Asking because I have never seen such issue when running Xen on QEMU =
(without nested virt enabled).</div>
</blockquote>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
AFAIK when Xen is run on QEMU without virtualization, then instructions are=
 emulated in QEMU&nbsp;while with KVM, ideally the instruction should run d=
irectly on hardware except in some special cases (those trapped by FGT/CGT)=
. Such as this one where KVM maintains
 shadow page tables for each VM. It traps these instructions and emulates t=
hem with callback such as handle_vmalls12e1is(). The way this callback is i=
mplemented, it has to iterate over the whole address space and clean-up the=
 page tables which is a costly operation.
 Regardless of this, it should still be optimized in Xen as invalidating a =
selective range would be much better than invalidating a whole range of 48-=
bit address space.</div>
<blockquote style=3D"margin-left: 0.8ex; padding-left: 1ex; border-left: 3p=
x solid rgb(200, 200, 200);">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Some details about your platform and use case would be helpful. I am intere=
sted to know whether you are using all the features for nested virt.</div>
</blockquote>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
I am using AWS G4. My use case is to run Xen as guest hypervisor. Yes, most=
 of the features are enabled except VHE or those which are disabled by KVM.=
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Haseeb Ashraf</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ashraf, Haseeb (DI SW=
 EDA HAV SLS EPS RTOS LIN)<br>
<b>Sent:</b> Thursday, October 30, 2025 11:12 AM<br>
<b>To:</b> xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.or=
g&gt;<br>
<b>Subject:</b> Limitations for Running Xen on KVM Arm64</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
Hello Xen development community,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
I wanted to discuss the limitations that I have faced while running Xen on =
KVM on Arm64 machines. I hope I am using the right mailing list.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
The biggest limitation is the costly emulation of instruction <code>tlbi vm=
alls12e1is</code>&nbsp;in KVM. The cost is exponentially proportional to th=
e IPA size exposed by KVM for VM hosting Xen. If I reduce the IPA size to 4=
0-bits in KVM, then this issue is not
 much observable but with the IPA size of 48-bits, it is 256x more costly t=
han the former one. Xen uses this instruction too frequently and this instr=
uction is trapped and emulated by KVM, and performance is not as good as on=
 bare-metal hardware. With 48-bit
 IPA, it can take up to 200 minutes for domu creation with just 128M RAM. I=
 have identified two places in Xen which are problematic w.r.t the usage of=
 this instruction and hoping to reduce the frequency of this instruction or=
 use a more relevant TLBI instruction
 instead of invalidating whole stage-1 and stage-2 translations.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
<br>
</div>
<ol data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;o=
rderedStyleType&quot;:1}" start=3D"1" style=3D"margin-top:0px; margin-botto=
m:0px; list-style-type:decimal">
<li style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt; color:=
rgb(0,0,0)">
<div role=3D"presentation" class=3D"x_elementToProof">During the creation o=
f domu, first the domu memory is mapped onto dom0 domain, images are copied=
 into it, and it is then unmapped. During unmapping, the TLB translations a=
re invalidated one by one for each page
 being unmapped in <code>XENMEM_remove_from_physmap</code>&nbsp;hypercall. =
Here is the code snippet where the decision to flush TLBs is being made dur=
ing removal of mapping.&nbsp;</div>
</li></ol>
<blockquote style=3D"margin-left:0.8ex; padding-left:1ex; border-left:3px s=
olid rgb(200,200,200)">
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
index 7642dbc7c5..e96ff92314 100644</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
--- a/xen/arch/arm/mmu/p2m.c</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
+++ b/xen/arch/arm/mmu/p2m.c</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
@@ -1103,7 +1103,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,<br=
>
<br>
&nbsp;&nbsp;&nbsp; if ( removing_mapping )<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Flush can be deferred if the =
entry is removed */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p2m-&gt;need_flush |=3D !!lpae_=
is_valid(orig_pte);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //p2m-&gt;need_flush |=3D !!lpa=
e_is_valid(orig_pte);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p2m-&gt;need_flush |=3D false;<=
br>
&nbsp;&nbsp;&nbsp; else<br>
&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lpae_t pte =3D mfn_to_p2m_entry(=
smfn, t, a);</div>
</blockquote>
<ol data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;o=
rderedStyleType&quot;:1}" start=3D"2" style=3D"margin-top:0px; margin-botto=
m:0px; list-style-type:decimal">
<li style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt; color:=
rgb(0,0,0); display:block">
<div role=3D"presentation" class=3D"x_elementToProof">This can be optimized=
 by either introducing a batch version of this hypercall i.e.,
<code>XENMEM_remove_from_physmap_batch</code>&nbsp;and flushing TLBs only o=
nce for all pages being removed</div>
<div role=3D"presentation" class=3D"x_elementToProof">OR<br>
by using a TLBI instruction that only invalidates the intended range of add=
resses instead of the whole stage-1 and stage-2 translations. I understand =
that a single TLBI instruction does not exist that can perform both stage-1=
 and stage-2 invalidations for a
 given address range but maybe a combination of instructions can be used su=
ch as:</div>
</li></ol>
<blockquote style=3D"margin-left:0.8ex; padding-left:1ex; border-left:3px s=
olid rgb(200,200,200)">
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
; switch to current VMID</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA for curr=
ent VMID<br>
tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA range for c=
urrent VMID</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
dsb ish</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
isb</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
; switch back the VMID</div>
</blockquote>
<ol data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;o=
rderedStyleType&quot;:1}" start=3D"3" style=3D"margin-top:0px; margin-botto=
m:0px; list-style-type:decimal">
<li style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt; color:=
rgb(0,0,0); display:block">
<div role=3D"presentation" class=3D"x_elementToProof">This is where I am no=
t quite sure and I was hoping that if someone with Arm expertise could sign=
 off on this so that I can work on its implementation in Xen. This will be =
an optimization not only for virtualized
 hardware but also in general for Xen on arm64 machines.</div>
</li></ol>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
<br>
</div>
<ol data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;o=
rderedStyleType&quot;:1}" start=3D"2" style=3D"margin-top:0px; margin-botto=
m:0px; list-style-type:decimal">
<li style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt; color:=
rgb(0,0,0)">
<div role=3D"presentation" class=3D"x_elementToProof">The second place in X=
en where this is problematic is when multiple vCPUs of the same domain jugg=
le on single pCPU, TLBs are invalidated everytime a different vCPU runs on =
a pCPU. I do not know how this can be
 optimized. Any support on this is appreciated.</div>
</li></ol>
<blockquote style=3D"margin-left:0.8ex; padding-left:1ex; border-left:3px s=
olid rgb(200,200,200)">
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
index 7642dbc7c5..e96ff92314 100644</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
--- a/xen/arch/arm/mmu/p2m.c</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
+++ b/xen/arch/arm/mmu/p2m.c</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
@@ -247,7 +247,7 @@ void p2m_restore_state(struct vcpu *n)</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; * when running multiple vCPU of the same domain on a s=
ingle pCPU.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; */</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp;if ( *last_vcpu_ran !=3D INVALID_VCPU_ID &amp;&amp; *la=
st_vcpu_ran !=3D n-&gt;vcpu_id )</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
- &nbsp; &nbsp; &nbsp; &nbsp;flush_guest_tlb_local();</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
+ &nbsp; &nbsp; &nbsp; &nbsp;; // flush_guest_tlb_local();</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
&nbsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp;*last_vcpu_ran =3D n-&gt;vcpu_id;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
&nbsp;}&nbsp;</div>
</blockquote>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
Thanks &amp; Regards,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
Haseeb Ashraf</div>
</div>
</body>
</html>

--_000_KL1PR0601MB45885505ECBBE9262C2B25E0E6FBAKL1PR0601MB4588_--

