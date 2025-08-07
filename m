Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E620B1D7F3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072929.1435886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoS-0002Io-Ur; Thu, 07 Aug 2025 12:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072929.1435886; Thu, 07 Aug 2025 12:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoS-0002G4-OE; Thu, 07 Aug 2025 12:33:40 +0000
Received: by outflank-mailman (input) for mailman id 1072929;
 Thu, 07 Aug 2025 12:33:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoR-0001m4-70
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:39 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdbf2dd4-738a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 14:33:37 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PR3PR03MB6425.eurprd03.prod.outlook.com (2603:10a6:102:75::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 12:33:30 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:29 +0000
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
X-Inumbo-ID: bdbf2dd4-738a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwcD7Q2mwfU0oM/1pdF4QiyoicOVh05me23AMjfedGzHAk4Xl+SqspjF922LLiq+EF4lNEVLlK6HWU9UZQtvRafnaQ+3NpW+SCmlxCmTNX6cqTeFPMc/rUH3SRM5FEZAKD0Gxy8rAEjYW74s7gOeAxxKjLWB/cP4W1qzFXvrYjL8nAmFiZDl6ukiSJBXzXXpgkCBC2QY3GUlaBYgBUn36qT8jKw6+a4t+6f1HP6akF6C2WyHmibXLarddYefQQvfCiw+hZxsqwRE4X8di8qQF9Nu56mq77NLxgdE3Eyce5fmdqQz/IClvmkBYCni2Wk0ZdHq/WgGmTFyIlubV0ORjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prOPaxQ1KI/MEP6EmYuzOl8MUvJOaT8mOcqtzyhSl64=;
 b=XKmA5a8bAWdVFeBU4cvdagEeVWBTrE+mZcy10rT+p0CVKcWotkaud2veS5BBIqFO/kTQe+LijPToXQQCaWKn1l/hA9gJoemID4zQUIu0RhSPNZHTmbqdDO+xMZ2fsauNgneHzRAtYDYBVSxRUT3lhWwl+4/3J5EiJmA5lnpMvzHHqDi6JFEc7oiRsFiOIsDcFi+yTqJm54AHrGsNnTuRUlzr+V+yoFxP4/qjBP6fkmd+tw3PZivgpwoOSlG/XmKT0DtY9GhpaY3xj/mwMcTYofDuKF1DjUomibeiZ1lOvBkcUpV481CtyfjI0NOGkGsRaKNNcWzzLV/H08blY2c6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prOPaxQ1KI/MEP6EmYuzOl8MUvJOaT8mOcqtzyhSl64=;
 b=K6d/VAWb9UBmYD4gZ6LYPxO2xKeKleynR4wv2MaQfcK3l8vkg8W/6HL1tnmaWcnJ0j50NT7O2Fiw7xI9yJe64YNt4QvCspTrGBbevNn8BGqCwg53ZysJBOLz+j9dPvPMwpaLGeD6wvbY1u87gWEpHz2QYdgOxl+ggVf2+krkFSJKBS6p9jIZRG8bEMuaBE/cx+XMyAKtcvmM2bKsHEGW2gwciQ+OlPXATZfeQF6V8gLpxywbe9SQemNG0MtJ1GfGpeXWtNGS3BSxJpdpeES0IW6QO2dhC6nyiuWCckQ9lAtKlz7VUyRYBMGjQcBhV5JqY7hOu+6ewZZmR8ydfBcOTg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 00/10] Introduce eSPI support
Thread-Topic: [PATCH v2 00/10] Introduce eSPI support
Thread-Index: AQHcB5d6CNAyJbck6EKQNoQgtljZhg==
Date: Thu, 7 Aug 2025 12:33:29 +0000
Message-ID: <cover.1754514206.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PR3PR03MB6425:EE_
x-ms-office365-filtering-correlation-id: 82b3690b-5224-4805-d896-08ddd5ae9d44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?q0vRKGmVqKdfcbfGdjBoFK/GU5fFd+LbyZIlWHk08/WBW0kDiPWqMUb1cV?=
 =?iso-8859-1?Q?XrGTn65tHE+/zA6MuuRAkvk+IbLvjMoSFIza3DVM0obo0YLgv7Ff+hiLCf?=
 =?iso-8859-1?Q?txuIhr23i6lX2/vOEnUnh9HVwI0SU5q5VJReLVz9MokKH+6HJjsnxa9gZ3?=
 =?iso-8859-1?Q?EJlsGd/glTFCGYj9OQX5ZDenxlS777yebq2XfLQzAYRxqsH0lZkFrDNfVg?=
 =?iso-8859-1?Q?+y0ABTe815xInpK0GB4g7bIbp9Nr/IUjKjvGSQQYKZPHfNzdEgznGbfGMX?=
 =?iso-8859-1?Q?qXjAD5Xu4DhJF+pKtsCQ3G8DBtN4611hE5/AlWFsImrWyAC/WP1leSDWx4?=
 =?iso-8859-1?Q?G/99l3MoJdYeg9RxSy3lP6HVI0OwfP1Z5mgyqWGaKyTToljvk3GUq2ZFCM?=
 =?iso-8859-1?Q?SPzt8QvZqdFoZ2I2kWd06RrC/yX5QKIQHL/UQvOtypHOxyl/4tjBmiL6dd?=
 =?iso-8859-1?Q?0dZYj6T4mEBTo950zXYjMjhgNSSULIIzuajo7sFPxJh6z8/uVk5+dsiC7J?=
 =?iso-8859-1?Q?VhP0UW9s58P2KBimXl2Nm2xfqSowsmNbLx6szItwEoyDxlxhEKpxqsMjuQ?=
 =?iso-8859-1?Q?Sdy0dWNjbLgcLBBjx9Cos7P/W10dm6+u3plt6Zzs0BMUsFzoLOa6vFN+Sg?=
 =?iso-8859-1?Q?kYouhvFXdrxFQFwmRLeeJfEGBTMFQsissKY/xdgA7T01zLb9/xpuJbdhLZ?=
 =?iso-8859-1?Q?I0YnQ8Im33cZKH1M+etIBasLZlaVEuRR5Juao3ZB/fzCoJ5nIptfs6JuDW?=
 =?iso-8859-1?Q?CE3g4thnyGw4f7m8b9d13+rWGD9auZjS4NW6lcw7MV5XZ4H16sfPaeNmsI?=
 =?iso-8859-1?Q?9nyTOcgkf6twvj9eQusq05m0thkaxNa+cjCOM0p09RvpnQ/7KN26lHwEkD?=
 =?iso-8859-1?Q?aW57kSHRGGLOWGFWVzpQlJ7tsVBEBataw0aEb+BjJCJmavtEYFrjoB1j4P?=
 =?iso-8859-1?Q?4l1RjrBoOC/7YO0mNTNOb/u3fKAyR5vbAkfYtlLzlJrY4A31YBH2Am5g5n?=
 =?iso-8859-1?Q?1nVMhbh4EPrXg7qAyO75jRdPmqbX7QmWgyeH+uRWwzGcOucTkVy2T3IkbU?=
 =?iso-8859-1?Q?TTve/8tCyRdvjPwMHbfLdvnL+p1Gz5e5uzJtcmZami0yPLhMTkt0CFQQNC?=
 =?iso-8859-1?Q?c7su72G1JR0ZWm1jXYWB/XhRSKWJVVZRbsYh0OHJkb/XXcMDcZuwcJfuU4?=
 =?iso-8859-1?Q?d781fv3CTmM8H7avr61+DNPvjjdoFazlySUiYyBAOBpFSvpGbYXWftb5av?=
 =?iso-8859-1?Q?bPBxgCjCtnor0g5mFug/fMqSnGShQTPOzjtj30VjtuqRr1rcrVr+vR3uK0?=
 =?iso-8859-1?Q?Ex/sknDt0rb9xVIpLpvBTRu/qSpM+DymJZU4yObbd2Gbnb1KmWA3RtPy2y?=
 =?iso-8859-1?Q?+Pm/veDwWtgFzxesS4QyAkSVGs9kPVEpbkWUnrJ4NlvkoTp1+QAyaMJ8zy?=
 =?iso-8859-1?Q?MdYcaN+8gipuvlLPx71xIHMgW4B5S33jSMBRNNFUzWRF+Q2LY8I6tVJO3p?=
 =?iso-8859-1?Q?I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4z2xBtDBHUtnmEhVxRlFRY/kR/dL9BsGK0Amg6aa4LPcQNYrf1THqPzwJO?=
 =?iso-8859-1?Q?6VlvteCh0CRpaWSmPi+yl6y0DjTDImWpQzH7RvvQf8GcNduGRO/YlJW5zd?=
 =?iso-8859-1?Q?MUo+U6XaSVQsxEx6IRUk5B5HgQTHuY32hXld7w80Z+f5t4zhskJfdlUZB/?=
 =?iso-8859-1?Q?bg951N8EeLjyEt8OjAyE1JrfiWOLEpFExuqUrEvDmm3hUwiD/vFRF89aa6?=
 =?iso-8859-1?Q?QQ0IgqD57saDKEs3UaDTKFc15chKfRGzk8NXvAY1ReOpMuZSLtTLMmKust?=
 =?iso-8859-1?Q?JriAsYWt+Jt3lMQbmuR2L7MDWeNx7pP9h8QDaHVsKGZheNdepSc9JJZZtQ?=
 =?iso-8859-1?Q?2vw5u0C1mmdE7tEYYbHg6RIU/WcSGbD2N2vn+S1VD2I1IZ1WJieRCkzI8O?=
 =?iso-8859-1?Q?K1t3TgBvjp3v6VumawD6xuMHumMy+EWQ7l7UhDkB333PWnblZjQ5adTacC?=
 =?iso-8859-1?Q?EbCtY6BVXOL6WKAwHMcTRILSHWtHTkqGAkHshRZdTPdhYLVjMO85yqPTLM?=
 =?iso-8859-1?Q?oeS5mPVKKgPzn86tSXkbjE14TwDTpPWIwQmR3GTL52rYt9sf7995aZtWwd?=
 =?iso-8859-1?Q?gcOoV+BFXcYLtZgKPubiy0ddYQCYrfsPU+nGsBkGFAo6oAGieMvJUEVLMK?=
 =?iso-8859-1?Q?LgAmW+6sqNiASZQbEUsG2rlS1jrtQLOqEZcNXraEsC3eTOGzFiyDVYHmDH?=
 =?iso-8859-1?Q?J1OktcWK5JIpRVOIbHIPhtjHuydcUV8dMoXorGtgqtIRdKtR5GtJQ8+Un6?=
 =?iso-8859-1?Q?GcRrWnxTy13I8+ZpmkF7NZopCDlfH7fzKOTED39+p47PqWH0+HugJQk5Qn?=
 =?iso-8859-1?Q?+hglZ9hiWwRqbE52PR3ltEUyOOvetm+qIr+b8v6W4oOwLmDyCherQqpB93?=
 =?iso-8859-1?Q?8okid+n9LhgxROb1Hyf/HPgi44QXx/SqZetX6WAycoMZBUmDx0mS2/sRa3?=
 =?iso-8859-1?Q?iRukSSLQ4ZFQ3SiZw9FcfuWRzK8HJfpCT1NKnJWAy2HDIYVNuHT0H8zc40?=
 =?iso-8859-1?Q?qZfkARyHCSP/sMqG4jNhTJJpQzu7ibAOimz4BhkRWqnjmMMBlWypBEEREQ?=
 =?iso-8859-1?Q?nGnXUyHGO5Dba7XFMLrpjZ0PJnbp1KqPdC5j8le2pNPiTfD/0l7JNZ6UQw?=
 =?iso-8859-1?Q?u2WTa7mpzeZoyszRT5rBtiIh3J1LG/RkZoAauzCGUOatvcZHLFROVMEHn6?=
 =?iso-8859-1?Q?KaIXX7HORRGUc4b5h14po0JVuewgoE+PepnKcmo5/UFSzmUBPR6R8YPL5d?=
 =?iso-8859-1?Q?JaqEQMHU8v0f6KOJIm0GYrdQraKtnSEZ31pyzM7TVCuW8HmuV2wxuth5dU?=
 =?iso-8859-1?Q?7SRBF9nUB1Iqdw2s25dq04GKnJTE42Ug98Cn1SIlRdR68NxWsqjAbNMbXx?=
 =?iso-8859-1?Q?n/pYq+223spsH09Mys7DC5swyY5oRQLpc2tb9HcA7cIDwKLOkEWgbJtHqy?=
 =?iso-8859-1?Q?2AGg2ZeMYB04g+u8BLfQmMQpC9Vuo8YgVYFhx5CVbrstzDCLi3dRBc3Gw6?=
 =?iso-8859-1?Q?23IWyguyFDDvF4KND9EkdaNWKN7a2rAWNHIho3LwROQxetm9hru/2ueeic?=
 =?iso-8859-1?Q?Ch6dmUnB3i3XOEVXc2Unmqr/1mlxxQSA/0PHxx/yxy/ZIwQ8eHpQ7TrfFc?=
 =?iso-8859-1?Q?0fNwNv5T7myoP7HuogYchmyUMsT1CtUrYG/L3i48S1y/WTqD2TRmOZx7QI?=
 =?iso-8859-1?Q?LCjCKVJA6ujwoprLleQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b3690b-5224-4805-d896-08ddd5ae9d44
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:29.5581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zy4XVbDQZT+Gu0WGnj1mA1Shdi36jTywUOOKIm2lV+6FxNEFGy+LG51dAp6YqATIrUKrHXwmw92bSGdL9vdI6r3pQvQEpgGTJJAAme3iIGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6425

Hello everyone!

### Background
Unlike the Linux kernel, which has supported extended shared peripheral
interrupts (eSPIs) since 2019 [1], Xen currently lacks support for this
interrupt range. For SoCs with GICv3.1+, this feature may be essential
because critical devices, such as consoles required for booting Xen
itself, may rely on eSPIs. Additionally, these platforms require eSPI
support for fully functional domains, as any device using eSPIs cannot
currently be used with Xen setups. Without eSPI support, Xen cannot run
properly on these platforms, significantly limiting its usability on
modern ARM hardware.

This patch series adds support for the extended shared peripheral
interrupt (eSPI) range (INTIDs 4096-5119 [2](ranges of INTIDs)) for Xen
and guest domains. The implementation uses a generic approach to handle
eSPIs, similar to regular SPIs, while maintaining compatibility with the
existing SPI range. Functionality remains unchanged for setups that do
not require eSPIs.

The series includes:
1) General refactoring of common IRQ operations with GIC registers to
improve code readability, simplify further maintenance and prepare the
key functions for eSPI implementation.
2) Introducing a new Kconfig option (default y) to enable or disable
eSPI support. Disabling this option prevents unnecessary resource
allocation for setups that do not require eSPIs.
3) Adding additional resources to store required information and operate
with up to 1024 interrupts from eSPI range.
4) Adjusting assertions and checks to pass verification for INTIDs in
the eSPI range.
5) Configuration of eSPI-specific registers during GIC initialization
for systems with GICv3.1+ hardware.
6) Enables eSPI MMIO emulation for vGIC, allowing guest domains to
access and operate within the eSPI's INTIDs.

[1] https://github.com/torvalds/linux/commit/211bddd210a6746e4fdfa9b6cdfbdb=
15026530a7
[2] https://developer.arm.com/documentation/198123/0302/Arm-GIC-fundamental=
s?lang=3Den

Changes in V2:
- added 2 more patches to implement helper
  functions for gic/vgic:
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
- removed 2 patches:
  xen/arm/irq: allow assignment/releasing of eSPI interrupts
  xen/arm: gic/irq: permit routing of eSPI interrupts to Xen and domains
  since their functionality can be moved to appropriate patches after
  introducing patches with helper functions
- individual changes in patches

Link on V1:
- https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01809.htm=
l

Leonid Komarianskyi (10):
  xen/arm: gicv3: refactor obtaining GIC addresses for common operations
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
  xen/arm/irq: add handling for IRQs in the eSPI range
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
  xen/arm/irq: allow eSPI processing in the do_IRQ function
  xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processing
  xen/arm: vgic: add resource management for extended SPIs
  xen/arm: domain_build: adjust Dom0 IRQ handling to support eSPIs
  xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers

 xen/arch/arm/Kconfig                   |   9 +
 xen/arch/arm/domain_build.c            |  10 +
 xen/arch/arm/gic-v3.c                  | 172 +++++++++++++----
 xen/arch/arm/gic.c                     |   7 +-
 xen/arch/arm/include/asm/gic.h         |  26 +++
 xen/arch/arm/include/asm/gic_v3_defs.h |  35 +++-
 xen/arch/arm/include/asm/irq.h         |  26 +++
 xen/arch/arm/include/asm/vgic.h        |  36 ++++
 xen/arch/arm/irq.c                     |  34 +++-
 xen/arch/arm/vgic-v3.c                 | 248 ++++++++++++++++++++++++-
 xen/arch/arm/vgic.c                    | 155 +++++++++++++++-
 11 files changed, 711 insertions(+), 47 deletions(-)

--=20
2.34.1

