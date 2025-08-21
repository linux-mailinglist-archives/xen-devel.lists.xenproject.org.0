Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4F6B2FEA0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088929.1446634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Nn-00054E-VH; Thu, 21 Aug 2025 15:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088929.1446634; Thu, 21 Aug 2025 15:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Nn-00051x-RS; Thu, 21 Aug 2025 15:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1088929;
 Thu, 21 Aug 2025 15:39:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up7Nl-00051o-Qy
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:39:17 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fec18277-7ea4-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 17:39:16 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM7PR03MB6388.eurprd03.prod.outlook.com
 (2603:10a6:20b:1bb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 15:39:14 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 15:39:14 +0000
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
X-Inumbo-ID: fec18277-7ea4-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TghoyxL80ruRUhXRAMXyAwsJ3CecPf08NT5xxobhvGu4oBII3NfqaL2LXlGBfkKZd6l1OdA/B8tLFfFQWhwqs+YEukhX93UFWcDDqCXVZGWTpQogd37T8M8GWPygnnBVZ3B4M44z0am/BoIJ3DJIoOyYNyxRPnBin9lfR97V7ui4sz5lfr4blUxNLN42EhgXa0SWNbj/8mxVSxbPRplOA8aJoIcF3skZJGlWt1+Iisww4YEYnCjV2kILZJRgSGNwldVUOw7ZcE5x8eOOY86Wx0Ul4vKv46n4N71aa+jhbkieWPI2mUrh3ABnDUyDbRN+haGz+9WfcKby7bMfPpEbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OatQn6DMrJkZl2qUDT5uXi2BRusKkpkoxdhyNtqTNtk=;
 b=KaEuxiFsP0vUt6cZfp/7E+lBV3zyFB6gQwsm80FoHd60BRU5Xod4rjgOX5GYum8OdFIbeoUh9eQuVYLxEAY1vKMmgcMwmM6DOyF6J0FI5yxOmxPl8nsoWK0MrFtOoZbmP5zAhdvsO0/cZiz0ehbBjuyNHqRpr/CwrQO9mf1H7rKOSvlD8F7B2VhWUSfd4EkzIf+lS7bPJjKJJhu9OJQ3gXgdDhM4ODqbyGY4IlMzDaSZt9scyKELe6Y1O37IIoQC3UXE6/SXMPM3Xbx2LUt9s+IgoIHwCwcPLQko/2LNjZqXxSIt6cYuP6hpJGTOFNmm+XYHua0vTCvhtmrnoYlA7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OatQn6DMrJkZl2qUDT5uXi2BRusKkpkoxdhyNtqTNtk=;
 b=ZamSic4J/VOOJ1bZcKc1qHsYMFAfrgl20biiKNGQdByyxtNBHntOkGUZQAWv/l1NBgmr843E9r+OP69FPZArWCB2sCTAe/3K2LPRhrDXHOP+Vi/al1bb+o7irTuH9OizSrvUNOuhTck7UZogBSFLMipgagnlnDAAe9j9NfoFJkaOEMWGAQAYg/HVTX3YyDUKpMwmEYcaW6WqQSmBRxaEmJ7cM5BBhkpMIDR99fiR4zOIRKyikAHqUcr3qsLoG0f1GnzPwcL6Xb9pZ3vDJFC9KHB28cTL9WR7/ofWLJroWkZP1bzZR9ryL3eKrEf8asHNco0Q+2LfPjQIHTA/gzgbcQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 02/10] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Topic: [PATCH v2 02/10] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcB5d7oc7jtkgiGki3l7l8xwTnbg==
Date: Thu, 21 Aug 2025 15:39:13 +0000
Message-ID: <877bywfzvj.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<51a017aeab39af14ba40ab76b56f317270c7afaa.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <51a017aeab39af14ba40ab76b56f317270c7afaa.1754568795.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 7 Aug 2025 12:33:30 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM7PR03MB6388:EE_
x-ms-office365-filtering-correlation-id: 9e6aa30e-09d0-4249-fa13-08dde0c8e197
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OydozJiQgJccNa3wSg/5M3Xl6VOSs624FNBpyLwdxVYl2fhiq9B81bYwL7?=
 =?iso-8859-1?Q?AOtVhn7dHnOwWHsePmFomcXPn6QbP3CKdCc1LZffg72ILUYZalBXK+s0M8?=
 =?iso-8859-1?Q?GyntaEk5XzG3t60PBeLJoFZv5k3vE7vj/VbmtfAdA72NpJ2CNY9ii7j/q6?=
 =?iso-8859-1?Q?Od+U6e5kBwVxWZhB6ELWYEjePm/FbRMQL1FKCIdS2a6Ssfjzw6YpRk+cu9?=
 =?iso-8859-1?Q?6DEnZOTm3HVKke2AorOYP0ECCduCc55uG+38OItWIconj5L9zPGUEnePQW?=
 =?iso-8859-1?Q?TJrOQm78VWSArEq0gT63Ap2Nj3AyiXo/Hl2X99VXV9NFwdDVK2xUDRtcXp?=
 =?iso-8859-1?Q?HTyrKEytf9Cd97BbgLSbgVwsirXWdzs8Er/QA+bQYRLA+M+OFH/emoTcWV?=
 =?iso-8859-1?Q?aIltsMEGAabHTPGnjnIMwH7+9lZO5R1zz3RKfsa8+KJ2b8WetVAhU/TasT?=
 =?iso-8859-1?Q?wtypOPqD/mjLbDmBXIuJGGx5tRp424l4UddKpyblUGYlIilDgsr5rOPjrN?=
 =?iso-8859-1?Q?mZg8oRX5wr1G7ZWFmZO4GEzcA43cTagXjnYICiCfKAOsY19rt/ewUthIHG?=
 =?iso-8859-1?Q?EzTAwrZ4bmsdD62Q+ia4e6/i6Z66kZ8DnFpLLxpU5JNXVeKdn3zhPwZ6JC?=
 =?iso-8859-1?Q?0r1no9AUWYgrvvrqiiMb85PYl5ObZQuFpYy37hyO8JLE7sf9crdRXKsPhy?=
 =?iso-8859-1?Q?TEH1kLSLgWEiweB175j+foLCG71IKh0aI+xYUJZ9rB3uWlUOFCr5Blxk9v?=
 =?iso-8859-1?Q?1KZwlYTwkOhx9p7Saz1HzQF5l2hIJmv07PwxRwwSzdGCI79DixgMpfHkfv?=
 =?iso-8859-1?Q?aafClZ1iad6BzOl1FqQmSbaKlmiD27wVN36drqKUpQwOPXwUCXaz+OBCEY?=
 =?iso-8859-1?Q?uADJKgovwjMzObJlvijIRcvHhtxSMAf5zH9i5G5LKR7TK1GyAo32Fs5f7d?=
 =?iso-8859-1?Q?D7NlxD30svMnFnjzoLtikRyRcnZ9NLxCvIjs5ie0guakZO8a4/6kw5AGqc?=
 =?iso-8859-1?Q?umWZbnWZFx22xesMPqOY5ENQtKa3F7pSKHrNetziiS19D7BQ++ByaB0CfN?=
 =?iso-8859-1?Q?NSCFpmqedHn1fkNILAK+n4GyUSO9AJmq5GdGtpNR3CovsQE1VEeJnBROrH?=
 =?iso-8859-1?Q?Zim8mAgxG1ODgrHxeU9edIsYZs9pvPgcS6u7BOVQnckb27iGa+BSPh2Ckc?=
 =?iso-8859-1?Q?SravhgLRLYEIMX0TRUlDia8NFaJq/uVa1qBj/Xfqj2ZJvaCzLdcXDVd18B?=
 =?iso-8859-1?Q?Q046N1xppZ8OFXO8kEHZvDbL2plZ/PB9Mz8SjvB0lU1X9KjwWiMeIP4oG2?=
 =?iso-8859-1?Q?RJeNrtalnb6rEehsdRJsUeioat4CQuCbBAwX82ZmgIBxQkThWt/YvKYkWW?=
 =?iso-8859-1?Q?Y7+IgRsOoXudFjecWCwntDtjPDlTOTuvx37w0WncSk7W1dN6zGD8CHPS4K?=
 =?iso-8859-1?Q?rNIlPTKB/VAwqRueVQcOhSDpY6YpEm5pK9zbiJFxYQSCps3lVXYnBumDVD?=
 =?iso-8859-1?Q?uxJjIxW8Iy8J0Wo0qeBtTm76BED13hmYH0+Ey7+XYRog=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UWc5KojatYNw/d8lLvmi4O7PElCEyuLx/RZoXJOBgFM0257lgU7+jDMZjK?=
 =?iso-8859-1?Q?D3MM8caUx1OG0BsCyWg9Z6d+AuNEK/RPwS7OWqPK3AjjTtOQH2pL8ofF3Q?=
 =?iso-8859-1?Q?jYwAVQMLGzC7CRSZR2nTSCAbIhQO8Y7ZFbwH0EkDz7MajsNblvlPt0DWuN?=
 =?iso-8859-1?Q?meUwUqAQ7JxoWU6H5t/B4wMQlaNLqPNTm6QSsyj6WnwenlIXp955zsG+xo?=
 =?iso-8859-1?Q?q0m4GwRA98vZW1dMhFMxV05GD4epxotWDGBFDMAak+ANI1DPV4DaI6Wp9x?=
 =?iso-8859-1?Q?fPXnc5bfOt7Xb8b2BZepC08wl1vrTveXU7x353I2gk4qwDNa1byYcR5pHJ?=
 =?iso-8859-1?Q?BbHQN2hsOunEnaEBvsaACcwLyh69T6rCjjuTfb7KkDgM5TTO/8OIbT6/nc?=
 =?iso-8859-1?Q?ac9OjF+vcUokrlNunQl0pgF2o87rhNKbE82hVH7qXyrMQCPMJNiHpPqI/3?=
 =?iso-8859-1?Q?ughCtQQqk36R/WY2prkoZs9/MhU7NqdsCezKCrpHFRq/iqdZDxPcZ3d2/B?=
 =?iso-8859-1?Q?7HwPMcRCApp3Wi0Ztiz9Dt8OUVIJCKdKqyssXJP352VHwz5Ea9L4XQ57ZH?=
 =?iso-8859-1?Q?/zucDSo+mlTC7rz93EnUsx5jyho+mmgpQ2j7Ud67cHCIUlYTBJDyf6xJju?=
 =?iso-8859-1?Q?AX08Vy1blYjXBUh+CsGpgqgERhEkVLPCLg7zZFuaWavAi+HQ2cP+Pj0dSG?=
 =?iso-8859-1?Q?NQD15h7VJB1InmxH0WCbiOD/NVoGLG+QujTOV86Ro9vDc3jYvyWmgfgFJH?=
 =?iso-8859-1?Q?oGQz/Ek0g10ypFyeQeo1Z4AiY+X9Kzc41WL1kuBhwPZI5dXMFhtJwidQrn?=
 =?iso-8859-1?Q?qSOOthbm8wzIE5TNpvNcXepF4vnKwrNY6fHQXcpgVU7g8iDdngSfqdXFkM?=
 =?iso-8859-1?Q?XZmXGZFWZRvQWJ6sjc80+YamQiTUZOXmS8eyNAgcKawwLIwfdtiEHJTjLX?=
 =?iso-8859-1?Q?ijWXIBJY9369FzIxtdH2u8fW2fW3v1VPg2WnbBeylZNIEZR3qpMCaSb+IQ?=
 =?iso-8859-1?Q?iT3Pdv7wCtPpSs2L3Yvsl1ocwiTA0kWmZvu88r5UHEheLQ3OCW2Ckdi3ZZ?=
 =?iso-8859-1?Q?uJKYe/iKAbOedQ/dnBv/CzU/M+ZHLSBmf1z6Y3kX2IpkXmD7gukpJAc3fM?=
 =?iso-8859-1?Q?bwwWOKg0TEimkIrXwbx7bGRWAFhGIwLbFCW5LXhetBXTwPOlp/aJiT73ef?=
 =?iso-8859-1?Q?bLJOlZqyRzF8CL4ebhrvckBi9uevSqKXNrQIPuz0fvkun40Bvse9Y0oAW7?=
 =?iso-8859-1?Q?ej1siBtsvPjCj65/ISLnOffKfOJYMDCHDVw549JNA4ZsAwEoAu5FZQbpNN?=
 =?iso-8859-1?Q?8ZTr916i8mFMDLiM+sVrraRrN8C8bKIqu/ENtDue10esiW1UQ9MjG9Qthm?=
 =?iso-8859-1?Q?vnV9RVrODOACSbALxzKvEIztdC2LJkyGHDSViIIZ5oo/IyDK7hrzFa+qlE?=
 =?iso-8859-1?Q?CGUMa1QgCu3G5SpP6rCVBToH8pfkJZSjcOyjPSHJDhLWTcbcDPIYJ5mjc/?=
 =?iso-8859-1?Q?mTx+PGBNtKrZ6+lDVMjEZ10ht3JcB6li+ZCTqICp0yV7kuaeGgoTwhevsU?=
 =?iso-8859-1?Q?4wmuXdCa/x3LIVF6J4qV3KGct2S7o3CsKeNUb7iz5EDmQ+ZpCw8OzLVz4I?=
 =?iso-8859-1?Q?r5Bh+O7O6422wh6LRuJghI/kTQ8RZh9MDjFVpm+LnijsYXMeuTTRwuXg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6aa30e-09d0-4249-fa13-08dde0c8e197
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 15:39:13.9263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QNvBoVAaelmX8ZDMmBB0KAmurQPXb8yCcozfF+OuZMBdhM5LQqWR5mBG2jukdFex5pfo7jyacjxV7kNG0eoNaAg6A+otr09b2ilYPJrPREA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6388


Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Introduced two new helper functions: gic_is_valid_irq and
> gic_is_shared_irq. The first function helps determine whether an IRQ
> number is less than the number of lines supported by hardware. The
> second function additionally checks if the IRQ number falls within the
> SPI range. Also, updated the appropriate checks to use these new helper
> functions.
>
> The current checks for the real GIC are very similar to those for the
> vGIC but serve a different purpose. For GIC-related code, the interrupt
> numbers should be validated based on whether the hardware can operate
> with such interrupts. On the other hand, for the vGIC, the indexes must
> also be verified to ensure they are available for a specific domain. The
> first reason for introducing these helper functions is to avoid
> potential confusion with vGIC-related checks. The second reason is to
> consolidate similar code into separate functions, which can be more
> easily extended by additional conditions, e.g., when implementing
> extended SPI interrupts.
>
> The changes, which replace open-coded checks with the use of the new
> helper functions, do not introduce any functional changes, as the helper
> functions follow the current IRQ index verification logic.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V2:
> - introduced this patch
> ---
>  xen/arch/arm/gic.c             | 2 +-
>  xen/arch/arm/include/asm/gic.h | 9 +++++++++
>  xen/arch/arm/irq.c             | 2 +-
>  3 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index e80fe0ca24..eb0346a898 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -111,7 +111,7 @@ static void gic_set_irq_priority(struct irq_desc *des=
c, unsigned int priority)
>  void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>  {
>      ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
> -    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts tha=
t don't exist */
> +    ASSERT(gic_is_valid_irq(desc->irq));/* Can't route interrupts that d=
on't exist */
>      ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
>      ASSERT(spin_is_locked(&desc->lock));
> =20
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index 541f0eeb80..ac0b7b783e 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
> =20
>  /* Number of interrupt lines */
>  extern unsigned int gic_number_lines(void);
> +static inline bool gic_is_valid_irq(unsigned int irq)

We need to do something about naming, because this function completely
ignores presence of LPIs. What I mean, that it will return "false" for
any LPI, while you can't argue that LPI is a valid interrupt :)
I understand that this is expected behavior by current callers, but the
function name is misleading.

Name like "gic_is_valid_non_lpi()" seems to mouthful, but it is the best
I can come up with.

> +{
> +    return irq < gic_number_lines();
> +}
> +
> +static inline bool gic_is_shared_irq(unsigned int irq)
> +{
> +    return (irq >=3D NR_LOCAL_IRQS && gic_is_valid_irq(irq));

Again, because of misleading name of gic_is_valid_irq() it may seem that
this function will return "true" for LPIs as well...

> +}
> =20
>  /* IRQ translation function for the device tree */
>  int gic_irq_xlate(const u32 *intspec, unsigned int intsize,
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 03fbb90c6c..12c70d02cc 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -415,7 +415,7 @@ err:
>  bool is_assignable_irq(unsigned int irq)
>  {
>      /* For now, we can only route SPIs to the guest */
> -    return (irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines());
> +    return gic_is_shared_irq(irq);
>  }
> =20
>  /*

--=20
WBR, Volodymyr=

