Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639E4A98822
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964354.1355179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Xxc-0002Ga-Ne; Wed, 23 Apr 2025 11:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964354.1355179; Wed, 23 Apr 2025 11:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Xxc-0002DS-Jc; Wed, 23 Apr 2025 11:08:12 +0000
Received: by outflank-mailman (input) for mailman id 964354;
 Wed, 23 Apr 2025 11:08:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoPD=XJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u7Xxa-0001zZ-VE
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:08:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2612::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d7de099-2033-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 13:08:09 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBAPR03MB6677.eurprd03.prod.outlook.com
 (2603:10a6:10:197::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 11:08:07 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 11:08:07 +0000
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
X-Inumbo-ID: 3d7de099-2033-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqn2cClShMX2Ev2JNKzkeXIQ0qk1rg8G5WUa6hCHeO/EhQzhF97M90duyR2MiGOebdHzHYt0dfOtiVWCRFyv+HjON5yZaWY1FB92NTTCQstf8MVFKSNLL7WSDQnnlFyGaAYGq8QLzE9mdPjnPKB49Af6uW+9+/APUfTiFv7i/yWqLB5CkONNkxIvvsivftx9I1ALCB7kMBkKQvp2+TP2F48jE6kSBMMSUkJvyQyvEcBTNPEcZL00dPzTy/EU4PI8Thw9bwzmiY9sM7I/nUAWGFrp6rbHP+XufEEfL/C13w56J1tzOoeMgbWbtxIGE7ylrXpnrJ1CU/dnxI1UjRqjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6fLdSFIZN2wJFEJsXs4ew4B8GUIRBViLvwx0Og+CaU=;
 b=L8vM2UmyE44eyTTcByLRdVHmXxakhypxSlX0ushNLprtZFE5N1h4m0jPMrIX0S6BlKHgn2B/1Xe+HVvP27Zk2IUrxnMIaPWb73a1INhwER6+t1HlOcMZPC+KJ9endT45QhlqBxHYbt8uHVheH43eerwqYrhb4QF+DuMjSCVgUcr2r5vn/A5BzWtunPWbRILCKF28KIojldyzIF3jFaCRr5WrXmwTocQPAlaqEkUveQXsdvefeuDYGZlPPiGfrIdQvgXefuLr53ZmlnhG+nnQLwFFYsBdqZPKNesIbGwxZPsyBuHeASo/LFHZk3zLr7G/tMZqK1jXVovaR2S9KSW38Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6fLdSFIZN2wJFEJsXs4ew4B8GUIRBViLvwx0Og+CaU=;
 b=KXnRea2jQm4KNJREVKiUL7ofkrq9L08nA/pdy50zRqjS782t6bT3GtEZjHUn6wowX3DqztMXpGgBVeHVuiD0yNlRWgOXQKpQhtPmjTqQoUCWZWByovEyDhBFNuXokTa5UlrgEvrXNWNtrI6mkpd16igK0MbbDBSDV1QXAHMBPUw2yZRsnzv0zlH062UMAw+z6j1d59flRRDr0RS4Bjwyins7J56ZOqegILY8L/fbapYKCpKG6BSoipKwjyCQXzvDMwoEcpuwiriAboXYEtdj9DTPu3xbpvuNy8A/wUoYsxPLedOrKOWMfxdEl1frcLxHjjILZQRKKtcYd0gY9PmqRQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v4 1/4] xen/arm: allow PCI host bridge to have private data
Thread-Topic: [PATCH v4 1/4] xen/arm: allow PCI host bridge to have private
 data
Thread-Index: AQHbtD/95pRG14vO602uhsMByi23ZA==
Date: Wed, 23 Apr 2025 11:08:06 +0000
Message-ID:
 <960fdc040bf621a60d494fa44f99c344ced33770.1745402473.git.mykyta_poturai@epam.com>
References: <cover.1745402473.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1745402473.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBAPR03MB6677:EE_
x-ms-office365-filtering-correlation-id: 3341df75-dcfc-4fce-1eb6-08dd8257203a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?D6GC4ZESaJk/fn9kRp/joolPajBJupgL6AjTy+ikZlfQtFo1F9VIt4O5/2?=
 =?iso-8859-1?Q?azoPU0rvlZzWRboLwtTht0127fJQWg7v6A8Ngrr/zW1OOvOQptsXNh5V/q?=
 =?iso-8859-1?Q?Q7N/ReyhKn2jfJKk9q0v6qYq+8Qo9gjO/H2gzNAAXasRt1VFR6rKrKmVb4?=
 =?iso-8859-1?Q?MSVpsmtdA1vOc1iWGi9ThOqZZPZMQ5kC6pjIO8x6ySx3qYqDIusdCyBH9b?=
 =?iso-8859-1?Q?fqsJ5TwehPj9F922Zd0TyZ6z3JDnbNUpe5ymSCbdgZ8wwD4z83T8tOxRmV?=
 =?iso-8859-1?Q?ZZ28Hf0wNvGMlqe5XnEWsJgyq3tV/9TRfSvL37KJX19yuYJRXavKpfZjRy?=
 =?iso-8859-1?Q?9gDcvUjDgj5iW+KTOYlf/CKVUECYFy0AizQpOxsLm8JHqJqcjnq3ZXyR0e?=
 =?iso-8859-1?Q?3i27IOSgBOeu4ptiX/B46lp35IdZmh8DvId1N+fVhTGmZB43e92cwgOzpJ?=
 =?iso-8859-1?Q?lahlyUiUaOb/6ap/oIiUBwk5UhyQGEJpFbZPM6W8BxWDbfh6Wzbf93dz1P?=
 =?iso-8859-1?Q?7AOrBmSkySFtqcVWrsAuRb4xXXC1+K99/G23mq6qb1NoDMJtNf9ZB8kWrk?=
 =?iso-8859-1?Q?vXbqoeudLBcCsnppqD3VhERoS94Iof7sTV4F4djNNhWTgnKWuQQa5wGVnw?=
 =?iso-8859-1?Q?hLW67BvTZySA/I4T5CiewcPxWfMU3qG2omxLqM5Is2Wp1jjZ+Zlu8r3Me5?=
 =?iso-8859-1?Q?E5TkQizq9h/4QORFNiLrHMhDwjb/In9xsU2DFduDfo/1SJfwp9a1yvvrDY?=
 =?iso-8859-1?Q?gN1K657oaiRuRBHV47aGX6TV0uleP+qRMJSNaaqtUbdClSOws++G9Qovav?=
 =?iso-8859-1?Q?V1LD7QlmpHNZBn6l4ySDkVM1q6eQZrclA71zeMjoWK+1yz+cvbJjamBbY0?=
 =?iso-8859-1?Q?mo1xljGYXWvwtXJyFuh1+vFkmmW1fMwYeLY4cucN7KpMhtRuPJAg9yV6X5?=
 =?iso-8859-1?Q?R+AfivbwAkySQh6OmqkN773m4RfcafaxN5ki3nLBqRK3zJmt6sJbQb4dmx?=
 =?iso-8859-1?Q?CcWN9V3pkxBy67WmqIMqFwuQT6qpQ4LmtDbchd3Tp19vP3DnGru6cGvAVz?=
 =?iso-8859-1?Q?85lk2a+98QmOselxogaqUjGs7uHxnKP5hBiwlrUxInllzxjCdBQUSd2HO5?=
 =?iso-8859-1?Q?4TrT5S6yqW8ybkFRd53CWc4IXwxCcFYSNL/0Y/8b1DB7ECXkbAegV6WDyg?=
 =?iso-8859-1?Q?cqXd/1/byF0jElGy1lNlQY56Wx6sSfgyyIuVw7eDHvnpYmiqKkl0qFcLbB?=
 =?iso-8859-1?Q?4Ep2D63hc+f337Z/spqOxCHbLC208IjwgxheDYyMqOEI69Fs8/B1JEQo2X?=
 =?iso-8859-1?Q?QYSZyDknFpk15F4rugaqDiaPHAPzabgP7j09NesY1E/2yy/5euTHdKjtrK?=
 =?iso-8859-1?Q?zztVy0wIoarYVZBuNAx04NaI1HINIvPUWxU0nvSX1V1Xi2oz6+COa06OGc?=
 =?iso-8859-1?Q?PmZJL6oTiBN/ru9+sZ9cj4p9LVJDLxWgbJvmBu2ZndKRcUpw9giAaHfSiv?=
 =?iso-8859-1?Q?PNdva1pIablS4dskhJspxR55xUE2lKViKn0uStK1OmUw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2x2BA9lxQsQBzz3WYPXpZ/khY3OT75+teU+B6IvPMQSGCG/ZvkIOI4uJGX?=
 =?iso-8859-1?Q?4H5tF/L5A9UruE/6odS5BpFFSXHg4yL5+l8qqoFwzZ8ZKnBq+rb82L5Hba?=
 =?iso-8859-1?Q?WfIjdv9TPk2A2e/SyLwZ9z5+DLZPVOhD/7iC/PSNctycArF9YBCPo8hY2f?=
 =?iso-8859-1?Q?xJGsqVOjsKgM7+V99HUFrIc0zcMypR2vYuxx1tvUAWhKL+D9ux1/aAlyd0?=
 =?iso-8859-1?Q?YRmbPj9Yqx27xnnISPkknl8KIPcgZFaBJOJrVjk6pUOAGmQTB9Pzt70Ji+?=
 =?iso-8859-1?Q?RnmBLaIyN69xLUgxWIysl6dgOYQ2EN2ZTlkpiE7OJ8JZlSZXhN6/zL/7p8?=
 =?iso-8859-1?Q?aGjZJPrT9IGh4jeFHwt8taOlTsRJm/WoHllAUA8gfH+ssiUiHBSq99/d2q?=
 =?iso-8859-1?Q?6L5REEJajq/+lEp0LozZhsBMaSyfWsR/eSqj+bBsO1lwYgZzjYPZADj2/0?=
 =?iso-8859-1?Q?w6+B9Z/yEgJzSTz94EWk4uW3x0Hbx8yAy6+9lH00O3IWPPERqzlZHnGhvE?=
 =?iso-8859-1?Q?c/jMnpB9CmAEduM5IjmLPzSLFoiVB5F07VXsLmxxFEn1oFhjqo35oRFnB7?=
 =?iso-8859-1?Q?lbctchJaYbctb+8HDUvZovv8Sow2WP8P53VUf4GXMYjOwZADTZQ/vsBdh1?=
 =?iso-8859-1?Q?raP6P9jvQLx1Dpcg+78UTHwIviISa0vjrSYvgZ+CMZ0vgF586e3k88uXKP?=
 =?iso-8859-1?Q?0SngodqWjnDYu+qpfbP2z/2ucWcOT5rl1dtEYaSh5v+rN2kHHPMffe29da?=
 =?iso-8859-1?Q?v/smhrp/ScKEbxhEkX5ltDGjdoRIVui6j3atNUSFVWtX8OQcAVKmwYa+Sg?=
 =?iso-8859-1?Q?MwVsXE0HRfU1bT8fb2wF4uH5DROEGJ5ynuKjwxjDzakh5sbWm0yxtpQsLx?=
 =?iso-8859-1?Q?QSW559TRdx9eJL8IHmnsyf2jfQO13M15o/K9fE75ui9vz3y5KSKdctX8s2?=
 =?iso-8859-1?Q?X+yrhfKrF8uc8lJB5Zf/E5JKLCuinULrwQ22yG37a9D7a0TiMDy+PzI7hV?=
 =?iso-8859-1?Q?at1HoH2TMC0nMWOdUGq6wosNhCB1dH8BEhFj0ZxJbTlnRhtjYMaWs/Hqer?=
 =?iso-8859-1?Q?j79IBE64S5SrKh7aSqBSjXON9vXt9wTgn826utG4pPCz5D3+MGBive/44I?=
 =?iso-8859-1?Q?kX/7cPjVNSkZ5bxiB+1qq9yiYLdE9O5R1mBKRXaXHt3ShenYKLGnLXzkEb?=
 =?iso-8859-1?Q?RJzlKGRHOlcqiRpgsxbQtanVG1juizX98MSGl7TdGsA5pCQqomH3BIRg1c?=
 =?iso-8859-1?Q?Lb/VjpwUqoowckbWcrsI/m406N47Bq1CEKrBJ6C+0S/3FJBFWmolkHG3cN?=
 =?iso-8859-1?Q?u9uDum4pfK3lyiG5yuGO/jiE/Pj3Sl2jLl27nA0oVkkr0qIQzsMJg4BMVD?=
 =?iso-8859-1?Q?MgYK1wS45aFkF33hIsiDdeMUX0z0ns/HSQduocq45Cu6bkcmsXQ1+kKii7?=
 =?iso-8859-1?Q?KEiOaMUkpjcYdSnHQJCGO+86qexvsjZIJwO9T7C6CSMoFCKFD5xLo1uqYl?=
 =?iso-8859-1?Q?V+L9UCZrRyHulLypvB2JfpD0n+Oi1ud51z7904ZooTKZF0VEp35oQ/cMFq?=
 =?iso-8859-1?Q?S1LCITFsneNoKSNZadqKsJg7pQXlQZ9T0P3Zga8JT6+cuIreofZIiU/H7C?=
 =?iso-8859-1?Q?ev6QNiPtdfdtX7PwkpZbAx7vYCUsSJ6ZwSFt9IyFVCPA/+ZDPiUSTJtQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3341df75-dcfc-4fce-1eb6-08dd8257203a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 11:08:06.9778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nE5QwPuA4qUlnHfadMfODTXRnFoljbFeWvyabXSojAFtIZDgiMT+oHz772Hobd2yxDPzct9oCDQ5ZDlYYsX1mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6677

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require private data. Add priv field
to struct pci_host_bridge, so such bridges may populate it with
their private data.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3->v4:
* Added Stefano's RB

v2->v3:
* removed priv allocation from common code

v1->v2:
* no change
---
 xen/arch/arm/include/asm/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7f77226c9b..a87672d834 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -66,6 +66,7 @@ struct pci_host_bridge {
     uint16_t segment;                /* Segment number */
     struct pci_config_window* cfg;   /* Pointer to the bridge config windo=
w */
     const struct pci_ops *ops;
+    void *priv;                      /* Private data of the bridge. */
 };
=20
 struct pci_ops {
--=20
2.34.1

