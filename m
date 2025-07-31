Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC45B16EDF
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065255.1430673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoG-0002Tu-2P; Thu, 31 Jul 2025 09:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065255.1430673; Thu, 31 Jul 2025 09:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoF-0002KY-T0; Thu, 31 Jul 2025 09:42:47 +0000
Received: by outflank-mailman (input) for mailman id 1065255;
 Thu, 31 Jul 2025 09:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhPoE-00025l-AQ
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:42:46 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b378d0c8-6df2-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:42:41 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU5PR03MB10524.eurprd03.prod.outlook.com (2603:10a6:10:526::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Thu, 31 Jul
 2025 09:42:37 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 09:42:37 +0000
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
X-Inumbo-ID: b378d0c8-6df2-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbhOQEeS/eOuOxupDbGjwwXb8G0xuWaOWdaCdStR0qrKDRR/9ean55chEannUQeWwpCePpsD29zIUi2sy0rq3gLPmIgi1/2ygLCfJg2s/teN2/76DFMaJCUaZDmE1H0/UdJP+JHl3MFgbIIaAdCXDHGsDeO9Kz+OxMi01wV0WmrSsQSKXlRzRNDNFJxDt2FOmEhjnWu7KfBwLFtyeFEtm7dv0ms9GOFH50JfjtXfNH7cfIerVTBMCTJD8/G2EksRd2KojHKNFT9EMSuaAWbJcbkhuNBaNvEsQT3VEc0N8rY/wxWC2bNQ5CySBMuUGu5m4QTDZqXzHJk5OW7/V+/4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=varaSl3ygyWeHM6LonbFKpzQUi14AOo2w1XwY4u9tho=;
 b=ZoBI0Cw9fIw4T1bBH+f3zIjHnkbIbGmeIZS1k5pRfPRUbiY6MDCl2CJwxKwPv6ZULljJMjsy1/rDXXcFvV81RTdgRd9injmPy7rPpbHqGk92agfZVn3ptH/2IMpZHWCzvcGqIVnJhbD8gdzaD9dYNY5ioquQtBPYQHf1N/Dr0ReD12zhFyKep4iwEVP0KET0bHzV50z5/OP5mbPGiZ7jJWo06pBtIG19pMXBhDN1r9aBaFIpw3bWoXOL2sI2X7C1wlPPApIXhD373uFfmC8HuNk+p6eKr88buIRQIjfKMBp6IW/52DFPbk4PUiV63hpMSnrKcuwfzjo/skHLl8vgdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=varaSl3ygyWeHM6LonbFKpzQUi14AOo2w1XwY4u9tho=;
 b=DqY3F8rCYLf/6RjZR1UFEMmblf/5e0hPhiZwehviDuxLHoCamyLEcNN4Qyiya9EVSn+3TdjVzOrylyo4q4RjCA9tMBi2xxgVb8jOS3Ab4AR36HCFI7x5ZB+zdd4Z9Oy3X52uoHHLoIDkoFUAF5Ax8DZEhz2CJj0cVogWCMm7o9jon0EXrK0ozElF4sit1i9NuhpW8KfoXf3qtUZRXDH1ZEClOzBGxGXFr8rcoQYeL7tZEeBdW9sojNqNF+K91C8IhZ+7SZcZpFtRgBjRQkytYA4Qnr5QkMZkroXx0ezWGpFLmoVnNuhZK9MuXBzNBO4SL60GvfzxPdfHkFMs/+FBXA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH 2/7] xen/domctl: introduce XEN_DOMCTL_CDF_is_32bits
Thread-Topic: [XEN][PATCH 2/7] xen/domctl: introduce XEN_DOMCTL_CDF_is_32bits
Thread-Index: AQHcAf9zO/LbbljFAE+E9k7UcfPv7Q==
Date: Thu, 31 Jul 2025 09:42:37 +0000
Message-ID: <20250731094234.996684-3-grygorii_strashko@epam.com>
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
In-Reply-To: <20250731094234.996684-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU5PR03MB10524:EE_
x-ms-office365-filtering-correlation-id: a635c127-a834-4b71-694e-08ddd01695d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1Ja+ORSQoevgbnkN6n4T9Fnc87qFSgLO5bdJKZxL2GnK357xMt4N0BEsWR?=
 =?iso-8859-1?Q?SR1Tx4XU3FSzNrS5PhoLtjkgsWtRWFf/VYgVxdWDSALRyI5qE0e/H0L7Yu?=
 =?iso-8859-1?Q?PZLhw8FRoO7ELqFxpA7l4DLHzDhQPnI1Mk/AqtUvt5JJzhhzfQDTndGV2f?=
 =?iso-8859-1?Q?xEJp4HmC2TO9cDPncYFuTotCCra90ZpFtSH/cfaocgHSVPlTXDxi0HmJUv?=
 =?iso-8859-1?Q?0heuG+GWDz46pFEt7iKFt1FU15rZam1Nb72gFKL4ID2SrR8g3Cdu1fP6ka?=
 =?iso-8859-1?Q?F/KckRZQqJ+RCWsmHUGz4R3MBnAY5cYvf4F7Aa73tLzJHrtASwB5II8bCk?=
 =?iso-8859-1?Q?tU4RSKsVNeZl1/wCpFbFTTmElmsYwK3xkISf5htWEvy4QtMbC3HYzyIWpA?=
 =?iso-8859-1?Q?aYKe00LI1lM76bZUAJ/tHRByla7OilTEWDplZy5ARMTG1VI4O1YDmafSY7?=
 =?iso-8859-1?Q?6EfGbnPeeC55TzZIw98RMvoPQpk4n/0ULajLxN0wRxkiAyH2gmBaeYB6UZ?=
 =?iso-8859-1?Q?Ai1WvLI4FkD5y+VsadGajQxfoBXxaUluXXtGX7sC53NVIy1bZbvhGy30Rv?=
 =?iso-8859-1?Q?fkBv7uFoBXl/3P6+i6rcBPMGcRPhuWam+Ldhn+pQzQkOXpaymnUrVqLph0?=
 =?iso-8859-1?Q?ZtT/Tt0LYNx8OlTomk56lcDPzxDfETPYGMxAcI1w8JLzxppzgZW/+EK+v2?=
 =?iso-8859-1?Q?E+5OxvYnLTiqe0nkws5oLaJGNDB7TX1DfEKtD81kgKGTie86DbjYJTaY9C?=
 =?iso-8859-1?Q?RvehK6FSlerNG+BtmNsgzYy1t/JLiD/kDd3ez1MgPj5hPjDGgUNWh60hKJ?=
 =?iso-8859-1?Q?U6Hbxn0iJg6z+cBP4F3VxyqpD2RNCrymtWtp6aFEymdkYTWvbpOxKKpDlJ?=
 =?iso-8859-1?Q?1khtPA/0APGrdgdoJFPBQFXDYiBJ3tVH9lkAXcmUiTpB1UjHz8/5wR7eot?=
 =?iso-8859-1?Q?Tf/t3HT3Zurlhbh63pcoERnxaSDai15UyxmEh8zTKIWcaE4AVv3+4XJP67?=
 =?iso-8859-1?Q?cx1VZtYmLmSOenUTSmpPKcRU7Y8fBhewWx+4yCoC4F/EwjVHI+rR14BKP5?=
 =?iso-8859-1?Q?4cZVoUbTGL4kwoPvqOHxq3IPZwSQ6b9LhgMk6nM95rDePUfvymSaEmOblx?=
 =?iso-8859-1?Q?wBbMMXozvW6tGj+5xiSJTdtVRsALG5SSRH9Io4G9XAGimXcn1110q0FhNc?=
 =?iso-8859-1?Q?gHTqWOGVrsR/sQ47JZxqv0ZcpkeY45pPMcTvvbLJV+qLS5dARjyLVurrw7?=
 =?iso-8859-1?Q?bKUZUXOT9rbPh0DFHjHIQQe+rQOY3mf62InxvpfeK3++G9348ff4kGZdMc?=
 =?iso-8859-1?Q?Fr68F9UesbxZx3fAX4bDRqHHS9cAVrWxjQPj+/fDNOoYLiMZabXsGpgpxb?=
 =?iso-8859-1?Q?QYtvreqoqZtt+ZkHdWRH0YzGYiZfiChs08r+5PyEo6d46ICiJcBovVrgE1?=
 =?iso-8859-1?Q?GP8Zd1hc5Q1pQTf3i0mkf/d6F4gF9Mf1nxJk5EbwKTAzizxDLauzNNwiGA?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LTs7LBf3KNIg5q9tdt3ndCRVMBA6NWJCjftGkVM2K6G9THTh1XSNrQgVA6?=
 =?iso-8859-1?Q?WmJax7U84YvjLgj0JOGR3Oy6dMRg7voeg/ZPKUwC47we0b03cdPlAfK6dp?=
 =?iso-8859-1?Q?wyPpm3MNjWmvSlAKibcgLqTsyVcuLAvDT/o4uukxINLFF/B+dw41l9m3Mm?=
 =?iso-8859-1?Q?d5OAEZ3Y98DpBKEhxdsS8rvLDJ7oryIQ7t/IzRQJTktzKH2/MrRDCjvS2o?=
 =?iso-8859-1?Q?6xztLn+ssuEvw4urx907XUWx8Shx2/Eglalc3zgSzuUPACkWPRoECrcwTU?=
 =?iso-8859-1?Q?SeQaBxCKIsrZWYkBBBDGntyiMxz4MASf7oTVUAI5X1/CzylbRo7ONeq2wq?=
 =?iso-8859-1?Q?tIs9Jn3S2uc2rRSPDy7Uu7IlITEs8G+P3HFRjZ7sSzPcts2EO4qnKFzkiV?=
 =?iso-8859-1?Q?1m3T6l5YRbJsxeZ+/hJc5V7Qe4wRSroEM5VrxhTfZ15Z5/su9zh6k8heHa?=
 =?iso-8859-1?Q?Mxca1jYrlL6QTeZzG19Pe8GEF0BqmDHvXvK2qgEMg8iVv4lzeWKyw8hIwH?=
 =?iso-8859-1?Q?GQAtA+uZMCLBhIlbVrOhYajyetliyOlIMtC+mR3uB4z//4SXqsAnuw4Ka9?=
 =?iso-8859-1?Q?BuSD+Wo9TkkBMS/FrJ48ZLe/UqO1sd50AsiRCPNPAjXjKnYjINgFh7qJgS?=
 =?iso-8859-1?Q?UUJiNEI3pbXgIkfH5dTzhpzSsbihh2hnopm8GAR5nLYy+4veA7bgLqtZex?=
 =?iso-8859-1?Q?2sij9L4PpbbuWSsOFl1bXMJXNsQU8SibuaFhxS+Vbca51A7f630KrZPrRD?=
 =?iso-8859-1?Q?tRmu9mIE9d/YMHCrY/UuVMbCIr3a7s3zzEuh/uLPd4wlecA6rYvVILbu47?=
 =?iso-8859-1?Q?9aupJesFakguIQGYlQPc4s7Q0keBfKXtvw0Xe/eCHTSe1iOey7sz938km5?=
 =?iso-8859-1?Q?Rmm5szNnDhgjBheLNLixJbStHzbatwtw8Z9ZE2/2PlVuxtSDeQK3KA6wA4?=
 =?iso-8859-1?Q?hCPJmGM5fnlrlUYx+5Cmdcxj3SspXehQMr3XghzsG0z1s1s75uqPKEbtAD?=
 =?iso-8859-1?Q?xLUiOuJfTJOwUOj8bIeCZu7dzinqSe5zNV13ZGEUiu7RVHPVEqA2Gp6jVx?=
 =?iso-8859-1?Q?mtPbO1Vp5u1EQMPxbhjaHYEBJvObO57v7txzKgDlQkdWz0d9JOaIuY2k6L?=
 =?iso-8859-1?Q?bA2cCfiHFguK9155MoxCeXXql/54nA1zi0ckl+kY0n1mLF3nRTIMgslpe0?=
 =?iso-8859-1?Q?MFkZPhs7BM0owbkiTfA8vQPNwTZE7MuU3CTYxbdMKSwd02v4p0vtshcMkw?=
 =?iso-8859-1?Q?o6cgIc/3jmZOEaZkeTKnt0cU5Lm71LQXivcQrHqo2iFIiFEmp3Mc38yQWM?=
 =?iso-8859-1?Q?6pEyVpQF5YlYXRI2VW4oYKN3wRK8D+Lj+LtV8Co5LA7buUXHKp6KnWYex6?=
 =?iso-8859-1?Q?GS+ToGEM27d62ZDrdCLfHVv1ZaC1I60mCd5fPzcf/EclDwK3oVxeBtmpXh?=
 =?iso-8859-1?Q?meY+grDkIFCWy1bPnw4V5jCe7+Sh8eMuU0gM9165Q2prt1C6McA0hDYWMu?=
 =?iso-8859-1?Q?bDQzzTXJj6L/38N4V4NTg4nUAIogS7vvWULDproHs93m5+1XxYrUwiteZ4?=
 =?iso-8859-1?Q?bUyX+PIjojUYdvRDM05s3Go1PFawIpQG5XP4cI4ewHucF/QCJvUN88vWFV?=
 =?iso-8859-1?Q?38ze1vCwWN4LzqlH3yjROF31Ty7Y8mcK9j+jcBfAwUAORs0YIvSEddsA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a635c127-a834-4b71-694e-08ddd01695d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 09:42:37.6656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uGt5C3h+kR4Yn8/PHNszLCO7D2bB7cLK6mA18zfzbMOzk/8f1IxhObAmXva5pofdvr4dkNuNDEkf0Vv8YBUp9xV2fPnldVXPZ+0r6UVuxms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10524

From: Grygorii Strashko <grygorii_strashko@epam.com>

This patch follows discussion [1][2] which is pointed to "historical" issue
present in Xen and related to creating domains sequence on 64bit Arches
which allows running both 64/32bit guests (like AArch64):

Now, during Xen boot or by toolstack, the domain is always created before
knowing the guest type (32/64bit). For example, on ARM64 during Xen boot:
- dom0 is created with default type 32bit
- vcpu[0] is created
- kernel binary probed and guest type is determined (for example 64bit)
- dom0 type changed according to guest type causing vcpu[0] reconfiguration
  (with restriction applied that domain type have to be properly set before
  allocating domain'a memory)

The same domain creation sequence is executed for dom0less boot and for
creating domains by toolstack (The toolstack uses
XEN_DOMCTL_set_address_size hypercall to reconfigure domain type).

As indicated by Julien Grall and Andrew Cooper, above domain creation
sequence is not robust and fragile, so it was proposed to introduce extra
flags to XEN_DOMCTL_createdomain to allow configuring domain type properly
at domain creation time and perform further rework of domain creation
sequence to probe guest type before creating domain.

Hence, this patch introduces extra "XEN_DOMCTL_CDF_is_32bits" flag which is
intended to be used by 64bit Arches for proper configuration of domain type
when domain is created.

Now it adds initial support for this flag for Arm64 arch only. The default
Arm64 domain type is changed to 64bit:
- the Arm Xen boot code is handling this case properly already;
- for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
updated to forcibly configure domain type regardless of current domain type
configuration. Hence toolstack configures vcpus and memory after
configuring domain type it allows to start with domain default AArch64 type
and then switch to requested domain type and ensures all required domain
settings applied.

For Arm32 this flag is ignored.

Note. For Arm64, Once toolstack is updated to probe guest binary before
creating domain the XEN_DOMCTL_set_address_size will become obsolete.

[1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01647.html
[2] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01648.html

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/arm64/domctl.c | 13 +++++++++----
 xen/arch/arm/domain.c       | 10 +++++++++-
 xen/common/domain.c         |  3 ++-
 xen/include/public/domctl.h |  7 ++++++-
 4 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
index 82eff26fb0d1..5346a533d888 100644
--- a/xen/arch/arm/arm64/domctl.c
+++ b/xen/arch/arm/arm64/domctl.c
@@ -26,6 +26,11 @@ static bool vcpus_check_initialised(struct domain *d)
     return false;
 }
=20
+static void vcpu_switch_to_aarch32_mode(struct vcpu *v)
+{
+    v->arch.hcr_el2 &=3D ~HCR_RW;
+}
+
 static long switch_mode(struct domain *d, enum domain_type type)
 {
     struct vcpu *v;
@@ -36,14 +41,14 @@ static long switch_mode(struct domain *d, enum domain_t=
ype type)
         return -EBUSY;
     if ( vcpus_check_initialised(d) )
         return -EBUSY;
-    if ( d->arch.type =3D=3D type )
-        return 0;
=20
     d->arch.type =3D type;
=20
-    if ( is_64bit_domain(d) )
-        for_each_vcpu(d, v)
+    for_each_vcpu(d, v)
+        if ( is_64bit_domain(d) )
             vcpu_switch_to_aarch64_mode(v);
+        else
+            vcpu_switch_to_aarch32_mode(v);
=20
     return 0;
 }
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 79a144e61be9..078002f964ba 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -613,7 +613,8 @@ int arch_sanitise_domain_config(struct xen_domctl_creat=
edomain *config)
     unsigned int flags_required =3D (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_h=
ap);
     unsigned int flags_optional =3D (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF=
_vpmu |
                                    XEN_DOMCTL_CDF_xs_domain |
-                                   XEN_DOMCTL_CDF_trap_unmapped_accesses )=
;
+                                   XEN_DOMCTL_CDF_trap_unmapped_accesses |
+                                   XEN_DOMCTL_CDF_is_32bits );
     unsigned int sve_vl_bits =3D sve_decode_vl(config->arch.sve_vl);
=20
     if ( (config->flags & ~flags_optional) !=3D flags_required )
@@ -711,6 +712,13 @@ int arch_domain_create(struct domain *d,
=20
     BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
=20
+#ifdef CONFIG_ARM_64
+    if ( d->options & XEN_DOMCTL_CDF_is_32bits )
+        d->arch.type =3D DOMAIN_32BIT;
+    else
+        d->arch.type =3D DOMAIN_64BIT;
+#endif
+
 #ifdef CONFIG_IOREQ_SERVER
     ioreq_domain_init(d);
 #endif
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef293..3193deb9c6bd 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -722,7 +722,8 @@ static int sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
            XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
-           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
+           XEN_DOMCTL_CDF_trap_unmapped_accesses |
+           XEN_DOMCTL_CDF_is_32bits) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a69dd960840a..ca59995f6c4d 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -68,9 +68,14 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
 /* Should we trap guest accesses to unmapped addresses? */
 #define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
+/*
+ * Is this domain running 32bit guest?
+ * Used for 64bits arches.
+ */
+#define XEN_DOMCTL_CDF_is_32bits (1U << 9)
=20
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_is_32bits
=20
     uint32_t flags;
=20
--=20
2.34.1

