Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D65B1200F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057928.1425608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLh-0006m8-7d; Fri, 25 Jul 2025 14:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057928.1425608; Fri, 25 Jul 2025 14:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLh-0006kI-4a; Fri, 25 Jul 2025 14:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1057928;
 Fri, 25 Jul 2025 14:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGu/=2G=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ufJLg-0006kC-Dp
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:24:36 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16252acd-6963-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 16:24:34 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB7421.eurprd03.prod.outlook.com
 (2603:10a6:102:103::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:24:32 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 14:24:31 +0000
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
X-Inumbo-ID: 16252acd-6963-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDuJ3lbCaosxNBZDsLdqj8DImY9SdV9NmB48NGhJcjBkMDPdDbH4b4zklIe5Kfk1e6zuM96miKqRqeVbzfrZUB8pfhWmLur3segHMD0/d0/9Z/opa54DEcZWwrU1fhCqder5Cm55kOAm3i7VVsJB5WIJneB8gT8Psx5u1LBlDHjIXyUVscdkydqEgKqO/Vwy0CSUKK0/fVZKw+vNK3gg9Azjo5RSkKBkQCdGy5nfo0bfLGAa99MiGcSWEopWCLucZgXKljbnNODeq4v/5liBDhLuJKegfuZRgnW+UW+Gx4nwZOuNrR5v7nCnBSenaUYeMMfmKWng4wmYeJEtIIK+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6+yXbolg5CM9+QqGJhBrictSKWAKQCyApQ9UxebH0U=;
 b=hVHi0Pv6M3fe5mz99LN+Q/4rN2UWDD0QZI3nOQoFrauZYSUtvBNJylCun/mknH4cUrvvbYE8gNKaiEUt4E8z7YknAGTQM+HJOd7tW8tqTGEQ/ZQVIZi1N39e/yUgk9Jq1H443GxeVVbXURbtNa8hRWsvLqlKCRaSjAqwuTSuPobYEEYuV7/a/tcpnPdqFY+8DWfqJxvTx0D4NTf7k1GElsjYRRUKu/SoyHXu3aIS1n8xH/SUvrFsch/qh8/N4SotDAvKar1e/uoyicMkl20t7weLWrcMz1zXkcu4jElk3oVyAdMTNUh/zbUOSuoUm3e1d1NuNh1PQvo3jDwDXNzP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6+yXbolg5CM9+QqGJhBrictSKWAKQCyApQ9UxebH0U=;
 b=V+8bV663Jhxe1noBOlk1EJG/u0OGlaYmiKYeTEgspQuU4tDzY3/9Hz8q5qSze2wYv6VPuxKYYqV3T5A5kZkbCeZVPoGYG4vqmHpiweqO2gNjX1QqD+/wqdF0UF4YxBjO09wwBZPA/azQIr4Yq3lJQuP3WJpI/ScTayc0ZO5w5I/djjoYLHJCRWJM39+FaeVj40+WjRUwFwUi8DeJ3wfA3ho2EalpI2GQ3zIwhMll1X2Ix46joyRRaB/118JoxYewZXVsmgVd7GdMJYeGfUl61KKrH94cUXPVYUFsEFir8M26ungRjpMid3VVvfOExLEqlJVpXJz2K1LMKeZ3rWkDOA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 0/6] Implement SR-IOV support for PVH
Thread-Topic: [PATCH v1 0/6] Implement SR-IOV support for PVH
Thread-Index: AQHb/W/WjOB7p4rlgUWQTCDi5B6RiQ==
Date: Fri, 25 Jul 2025 14:24:31 +0000
Message-ID: <cover.1753450965.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB7421:EE_
x-ms-office365-filtering-correlation-id: ba13ccd7-c737-4360-c5be-08ddcb86f8df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HqAOjTUCqtHecmzRBOzkIjw0Rgvw89dJVExayIntQS8rMavXTeYrERFg2F?=
 =?iso-8859-1?Q?bPlda2gz736jfOmqksqzMLcxnzrWcVbg5zr0fPjuJjDszkllK8ZX+qi3HE?=
 =?iso-8859-1?Q?qKg7uLnPQ1QjbFnNxW2JHhfCX3ULohnt2PcWULMBmNVZdjxrLPpBS7O489?=
 =?iso-8859-1?Q?AMpzVVS9PPanyJ2d9ct6/9UKMT7RlFQ24oUPGutXRbaU5bONZXrA+IHAJt?=
 =?iso-8859-1?Q?YLOycwwX7ybnAHunUbs3UvuiPtJPSIX/9O0m3yUqLNUg8cfSrMrXFLRSWb?=
 =?iso-8859-1?Q?ldexTFY+2UFIbXEdQ7dJL5o5alWxjzEMZr5o+lwO6IxSi6WVSb42V6Bdg2?=
 =?iso-8859-1?Q?Hlw7B4Ld4fpCWz+5aoqCIghhwLisg4xhmP38yYLL0kaGLtZNG8wTDpgcf+?=
 =?iso-8859-1?Q?9kIFfag0cVMXhgZa9EhLTPziOonIgZ3mHbdsBy7+apoC/Z6yVAnYLW0W2M?=
 =?iso-8859-1?Q?qbZaR0dETo7msX7LuGKYQbQ8DL+gAfJaudB9zkDRGGRz8viztIwR08LjIn?=
 =?iso-8859-1?Q?BWMMaLi6fkF9P1HEBb5EUKHLzqxLqTxztUnnDdS13nmKLyVyHzWvAePnmB?=
 =?iso-8859-1?Q?f3qFVhZBcGs/cLLBPd0qp+VoRWD706EVe2J5+J5asGEJK0h4mKVdUhkX4B?=
 =?iso-8859-1?Q?9l+WUshVaKkyzQEgf4K3UNoUHP+ngD1JrcMQqvSr3Nn/Rj1N1byg/XGb2J?=
 =?iso-8859-1?Q?1Vd1NSLf/8PHewEHYL1u2QdekXnqhb2dzRcZDoC5vDxQh6ZXJlaEgfUTiN?=
 =?iso-8859-1?Q?SEroxYmK8Pc0OBCNqwfHadPzNBfgcDgDY0PXuzY1zUzobBGArnmjQMoOo2?=
 =?iso-8859-1?Q?Tk29Mj/qinKcxQ6mIC5xzeb8BeuYGzDwS5Vs6kasxfFmXOtsig8Ae5WO5Z?=
 =?iso-8859-1?Q?AogxhzmMv9Y+cQqGKQppY3Id9oFTlVzADlUZjbTK7f+KezQ4mj7aN4HsL2?=
 =?iso-8859-1?Q?kFNATM0oWV6X9YKZfD4xs+RaiMxSyiC7hhEw8cPQay60eBdIKT+lLMb/ri?=
 =?iso-8859-1?Q?p8xtxUh52ZPk0AdRvL7TXC0njgamqNZjgKOdHjqLHhXkl0GGWXOvn33BYF?=
 =?iso-8859-1?Q?J0C+bstdDzm377FHAK0gsiOyVBrWbYRE2SwrjeaT6WIFhBLv+VX980KYS4?=
 =?iso-8859-1?Q?l8aqiXYOyGJTR5erlWpo5m9fY1qxOoSddf8GXomO4mrIaWU2zVUuH7otkm?=
 =?iso-8859-1?Q?lMDIxW2tLpiALV89FUXdwOP9aVfs9FlF3HI+kG7ToN3/4iDtP267i+/Pzb?=
 =?iso-8859-1?Q?Q6I7MGBf5ISJXOX7Ke/8FQQmy1hIY8ZgsbWBDdwoLCFt/TfVWRx1fp+7yJ?=
 =?iso-8859-1?Q?2UN5EX6yPI+QNOBJsLUHYgKNojPq60hS76ZIAc6XZXE2iEhnGszQLt62Pf?=
 =?iso-8859-1?Q?8b3N+x4rlm8zX5hWzKelpSB3mzSs4t+wNqLTELT7fob0r1UfWlVTMHGqed?=
 =?iso-8859-1?Q?/8YRrwd+3h83JgeYmJ3619MaGWq2BVcNx1G4sbccUBP+US0IWrIY+MdwnU?=
 =?iso-8859-1?Q?8YTh1jUkAtgz9D7m1HUMG0JtV+0fuYXruKHKK29T/NrQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ppLtLHUru+ojfiTwSvruT00CeBQBW2lwBvqVjsMX9qG1eQEVd6OldJvcWz?=
 =?iso-8859-1?Q?vW4zyNIEujHWlEIPOu1KcSvay6a7moDSv86aQzsaIYPpypeGmpvUNq5/vP?=
 =?iso-8859-1?Q?cYEY8R9F9KL2drCTqm6JGHAHEXEkFXnDea2LWDhYtCZCrdq4g2LBlHPMGd?=
 =?iso-8859-1?Q?qhJZg5V964ktpQbE5N5WF02x4NEs67+SjqHL0HVCQIG0k/O8cPJbhBNiFo?=
 =?iso-8859-1?Q?FoDX8hsBeDABITNPdEhpAA61nKXM+oIb2uut2YzwsGI04yOVkB+zPh0Ju+?=
 =?iso-8859-1?Q?wnO+VG5gS/RMyK6+hElZawbaXOQpJlfAuBGty6qJr/N6k23xiBSsuTS4OM?=
 =?iso-8859-1?Q?33hx2iE7kj3YnltQIMA7RpJK44k4qKTGgNc1dtqq3/puTdum/szUP0hsxR?=
 =?iso-8859-1?Q?KLOz9fqocAWF3CDBDEcWil245XvyCbEg9HkaQcbx6PHiI6lD1rWjHafH3/?=
 =?iso-8859-1?Q?E8UwMmRkVNyfroSrLYFCtS4W3nUlcdQelsnBpCVX5aO2veV7A3LTMv8faN?=
 =?iso-8859-1?Q?rI2LpO/OBhKuaHTG6SmQTX/H9H0t1yrCNS9sCF+8WiO/7cEvnC4Ihl2AVj?=
 =?iso-8859-1?Q?yzQBSnxgTQ+uaKP3rtXAaXkLIfL8hKxrtf2A44pSSGNMSeoHxN9hd2l2eS?=
 =?iso-8859-1?Q?58IlC1UXHUsk3Tzt4O0+csGtpQ0/HU2ClbCcd5USRWJN3O1sPGnvyYUtIk?=
 =?iso-8859-1?Q?LFGsnU3loiKfy1Dsyc4e63CyCf1WcustT5kgHGJVSUG+qirvXbuFJjK+ys?=
 =?iso-8859-1?Q?qIsXaMveCib9u6LAEIKgzI3Nhmcnv3IkuAcweaDUCxYBQDxDuZoNm3ri5g?=
 =?iso-8859-1?Q?4fItaQe8+iQlW1lVzEIwQ4T8wJH13qvyyQz2OCdjlYI2c3/BqnyuORAF9o?=
 =?iso-8859-1?Q?5wisiMZwT+qny16bScSQQRaCjAQ3XUxKOZ8t7OEiSwjdrvP+cKJQT07ITp?=
 =?iso-8859-1?Q?1lgN3NmP2uQSNp3XGmFrF2F+fO5YYDtBjh4AtDjjvvagFUK1Vm8PKebHKe?=
 =?iso-8859-1?Q?XkeCnyG6kKJVCdmQK3IMBX9m8QIR7630M+8oDSldgnAWof0Ho26hqdOuFR?=
 =?iso-8859-1?Q?MEHgAWFbapPCHcD7JmraUEbSDDCDaBh/VuLDHio97fmwuVucFrDP4VNKdt?=
 =?iso-8859-1?Q?BNl5q/d4Lw07PaQC+UNwTJMbbx9rcvCIV2ax2O71q2w9ySL1z0JSk1AGxJ?=
 =?iso-8859-1?Q?a49Td0kwAX1F7icKOtzMw37tfVFH5y0mxJOlrwhD9ol96RTtvuSHdV4oZc?=
 =?iso-8859-1?Q?xUWXznO18wu5aM67gPHgecgU0MwxPV9oLcyFAritdRn7BniyYgzg1G1aIm?=
 =?iso-8859-1?Q?zWcoWCvcMDAQ14Kpnk9Y0w1iZLQPWrVjvUdWQfcDhVUOcNk6Zw/UoMMRvx?=
 =?iso-8859-1?Q?i/I5KmB8roXpGYsTQmZsovi1L8JAdQLLePEfK8UtIGZAjGa1L1T/QSFKMd?=
 =?iso-8859-1?Q?bPNeNniJpqWBZs4mHDXahEJJ1tUF2rHbb6zpAwN57LKEpY/prH4ECe1KC/?=
 =?iso-8859-1?Q?dYochWWHCSAABtoSVet92zypO55Nst0EX9Oi1kAg3jfI1Kfmkr1YiKidgY?=
 =?iso-8859-1?Q?i4RSziMxFavxw+wKD1id3FM+Kwgj1HoUG3xy62K23HKbNvYbt4jmzq5P3D?=
 =?iso-8859-1?Q?IOBuhue+q2EBD+D1GxYEekjYqG9wBV4HCW5wx+23J3USDL9nPwvcaeMQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba13ccd7-c737-4360-c5be-08ddcb86f8df
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 14:24:31.7705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ha/kIA/EgX/YWGAzUqgFGhbH5Sxe5VbhBVZuccLoDUpfxX9eLg1bZ5q13n10xQ4GSFzlJFzlmLuIXED1RsCxmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7421

This series enables support for PCI SR-IOV capabilty for PVH domains.
It allows Dom0 to enable and use SR-IOV virtual functions and for this
functions to be passed to guests.

To achieve this, handlers for SRIOV_CONTROL register and simplified handler=
s
for VFs header were implemented.

Core functionality is based on previous works [1] and [2].

Xen relies on dom0 to enable SR-IOV and call PHYSDEVOP_pci_device_* to info=
rm
about addition/removal of VFs.

Tested on R-Car Spider board with Samsung NVMe SSD Controller 980 and Intel
X550T ethernet card.

Mykyta Poturai (1):
  vpci: rename and export vpci_bar_add_rangeset

Stewart Hildebrand (5):
  vpci: rename and export vpci_modify_bars
  vpci: rename and export vpci_guest_mem_bar_{read,write}
  vpci: add SR-IOV support for PVH Dom0
  vpci: export vpci_init_capability_list()
  vpci: add SR-IOV support for DomUs

 CHANGELOG.md              |   3 +-
 SUPPORT.md                |   2 -
 xen/drivers/vpci/Makefile |   2 +-
 xen/drivers/vpci/header.c |  49 +++---
 xen/drivers/vpci/sriov.c  | 352 ++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c   |   1 +
 xen/include/xen/vpci.h    |  20 ++-
 7 files changed, 402 insertions(+), 27 deletions(-)
 create mode 100644 xen/drivers/vpci/sriov.c

--=20
2.34.1

