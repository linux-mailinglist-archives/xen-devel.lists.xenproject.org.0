Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4E0A727D6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 01:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928332.1331052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbIz-0002II-Mq; Thu, 27 Mar 2025 00:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928332.1331052; Thu, 27 Mar 2025 00:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbIz-0002Gj-JW; Thu, 27 Mar 2025 00:41:09 +0000
Received: by outflank-mailman (input) for mailman id 928332;
 Thu, 27 Mar 2025 00:41:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKAi=WO=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1txbIy-0002GY-Pt
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 00:41:08 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 246860e6-0aa4-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 01:40:55 +0100 (CET)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by PAXPR03MB7698.eurprd03.prod.outlook.com (2603:10a6:102:204::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 00:40:52 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 00:40:52 +0000
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
X-Inumbo-ID: 246860e6-0aa4-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfk02un9q02B/0bumb1FtN8NhEaRvwUbfW5xeYZkif62bPg7NRJEYRbVncc5RK4dz+S4IZVEE47dloblcnwvnUei8abGD52jRtDe5xn6kjb/v+OcGlmJ2OjJPlkUIsX1YBMW3ohLSOP5rQfR3SblBQU3AqmTNA35EGqkB/5aXuXEbht+Uy1tii06F9J//vTdi3gucnEDOoh8mpe9Cwm6RKtPA6YQmM1qC324yWDZJwiIoMwywYbcO+/nZaXPivNdWuyaYc4BVdmVSK2aQi+GtpZQY499PtW/i3ucurrGirpbTmfpxUQtqnlKMcANcN7dkz9OyK3xUuy09qUWjCm6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgZ4V7ISrw3XQT0QFrJB9/7oXTXJD1n7cCtmvAUHZFA=;
 b=Te1t/vFqL04muuuh3qEQ1hue+n3WDeun5vUlG4AGu0givAww+SJsQHjgpF0qtionKiADqUhLLLSuMMqQB2b+pSxXyVj3koGiD56z1iFkFgRzhKDEQ/DjsB5vSGdrjzKN74xsTDQZXgjz3sZ6ebw7luY34F/hTpKWhtwMi/XRtSPMRJiEu6deU87sZToPQH5sX2ZSlZsR+EMn9zlSoKGTA/sLct4Jf82bNyqhArneYYbEFqMS95fdX7mXsE0VmEqNtziGt8ROkiOYhVcmUkA+Ps3FmvdQpXLVwBt++uS9k209dsLua8ABEjbVgeYa4rCqGmQtHr3+iquhE+rKkXch8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgZ4V7ISrw3XQT0QFrJB9/7oXTXJD1n7cCtmvAUHZFA=;
 b=J3Y0sQJIvoS2QgyVhDAAhgeIAad5uPthb2KyRRZJzp++ckZKQBgXq474c49QxjHFwnbIeTrN3+K/idylP0aurfbrsAK/bVWoA+LTapytGUOmCf9hq044lv0i5/Cwf3rGuSAEp+nDMiJLu4O8ExxPfzxTFs1IwiDgJlsyMpWf1A1LVZkfWHFCEDLP7Zq7MRWQYAMt0oDQSwDRT8E5/Dr7kj0hGc89NBEhmNfP+8ttWlqIcq/A0og2Mj5lYfGA3Rr28KK/KVprMrei2fPXzFxEbQMq1urn/utAM4MyDUkxfKnFfECFuPF2FMM/WhOBtPMoIZPf+mxYWf2E3c9xoluOAQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/3] xen: gcov: add support for gcc 14.1
Thread-Topic: [PATCH v1 1/3] xen: gcov: add support for gcc 14.1
Thread-Index: AQHbnrDjP18EuEhGMUmNMUBtvyYXWw==
Date: Thu, 27 Mar 2025 00:40:50 +0000
Message-ID: <20250327004044.2014048-2-volodymyr_babchuk@epam.com>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|PAXPR03MB7698:EE_
x-ms-office365-filtering-correlation-id: f3434dca-824f-4c8d-83cb-08dd6cc80729
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7SZWFgr11MOvpwUtJJO93+hrhCT1LvGCnWdjp4eaE1KoUiQcxldfiPzOVH?=
 =?iso-8859-1?Q?XDXeCbikZtVvVeAPOlR57ZlMCEE65kyZqY4Q+fQKFAmOVrPBBATgsS1PP0?=
 =?iso-8859-1?Q?Pvd2HmOpqrPFNRHuIRrT59hWTuopBvZmIFoiAUgIRegYYjYvuJBm581Kgl?=
 =?iso-8859-1?Q?qBWrFliP21oKQ7qJgY5zq4ipHTClPLR6oRJ27ybBi+AcAlJSm8JJ9qQouc?=
 =?iso-8859-1?Q?ZDInE3kKcka1M6LUmQ9BAa314De1CH/HWv78/kzG5km/R+p2IxBGRtUwTD?=
 =?iso-8859-1?Q?d0JYLl4cCLbwhQkMnYYnoh2lyCps4gE7+6/vvsOEd4ECRbJg/rgfzKx5SB?=
 =?iso-8859-1?Q?BEliIvkYrgWIch1Rw/k1WLs7i0pnvrBRKUE7/2AvvORri+AalCzFF8wDvo?=
 =?iso-8859-1?Q?9LspZeXfVxJmQzd9TlsNlUNmKVjtdpMAQ1K6qHRq/xVZinhQaKtJ/v7l6K?=
 =?iso-8859-1?Q?B87yVZ1h9hZIp3NqgrNix/14U+lGY918b+chUPinVbRGDsTcf0uiB5sZgt?=
 =?iso-8859-1?Q?2UaNsxRmXcUWitQwioL6MVpej/+wMauOmnDU/yZn5lJk1i53WStO0x91aa?=
 =?iso-8859-1?Q?CrTVA+3sBCJg3HYSUDunvSBB5hom2ISkJ2bqnueCLC4ezmub5zXwfutvkV?=
 =?iso-8859-1?Q?IR4rycV26jLaicFZirRTOowyet2AK/ua6xRD4t0qIl+6XrOp7O81At1fST?=
 =?iso-8859-1?Q?FHT29xlvPsLN7PwVtvMDIzhXJrQJFRVNhV4jqHwElwoBxexuoWV5nmKRXY?=
 =?iso-8859-1?Q?BibqSKKjwkNR8HFVj9JSHxVu2f7tm0ymfvb43rAjnl3GMSqL/KD9KfjUtu?=
 =?iso-8859-1?Q?A0gB+hHGQpku8e3CJmKOh9T0ipBw0YUf5LZFU9WL/SAL9iKyjeJqrF5Jv9?=
 =?iso-8859-1?Q?ObbDTfe14k9/f1/YVSDb9fCml6iY49HpioZGmjIQ42mg0UNrdrH5lMjT6n?=
 =?iso-8859-1?Q?vvdf9N1g06p5ZTLIzmMDx1PRM9BiZYrwOzDwXm3CFFYYOlBeREOF/xlCeO?=
 =?iso-8859-1?Q?1A9q5CU8HYzjsZuIG5WKPNQAKc4x0dQ9NUMp+Y4vMd2HfgE1ojyPC8Fh0X?=
 =?iso-8859-1?Q?prpGeUpLrTtj/e5xlTRjfLyXusU00D2yDTHsBpP/e5kEDhK53ILe1EWWUQ?=
 =?iso-8859-1?Q?iIBd8AdFA2F/xOQ978eH7/wfM6Jmco2DkMDTd7ik2bByG26xReCtGR7TYC?=
 =?iso-8859-1?Q?9dQXswdkselyl6b+QQ3FIHV5bFpNIJ4P0g2QD+vJhR+QbiRR0ta8B3BO3c?=
 =?iso-8859-1?Q?/F9WH35Fye68YgUQlvzESJts3Evu9un1s1LqxPcnpynqxN7yZg3ElEIqBh?=
 =?iso-8859-1?Q?FRW3teDv9R+8PsNp8fJuSPNe54RWr8ej8QI/oV+6JgUMli9MRQIgx095do?=
 =?iso-8859-1?Q?xWQllCFSqdhCcNe7RJOH9+hddw+3sdTJgGswS0Q6tuPHHMn9rHu8V3K109?=
 =?iso-8859-1?Q?ZqmZ94oTHcIJgBw/g0OCgFV+HJHeUUnanUO1Q/JEci5vRHn7DqZd8LILrH?=
 =?iso-8859-1?Q?3vo+CGAVsYJOI6mVk1CQJS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?eDjJpTc/W9EoFkAVqUOoxve5c4H1SqoOE0cOkJBZnHOEok9V58uqqumlMi?=
 =?iso-8859-1?Q?aPz4WboEJ+599oZQkZ+ENID7pH8CNxVYTwXp9jliA4RHZG5wWjEJ0Ibzoa?=
 =?iso-8859-1?Q?isd0Eqvpup2iohAFMO923+l6BrNEf6y90LUa5qA2efz3vkXXueIzy3EpOs?=
 =?iso-8859-1?Q?wMBnwVN4Pg2LtFYPIn0RDJfW5Z66rIYfTzVeB9wRTFRO8n284JwClSHz/a?=
 =?iso-8859-1?Q?jj5AYofrag++xKLcC0u55c0Zgyr/7SWQh4MwxhwRvg2LrXgkJWXLLZEyWb?=
 =?iso-8859-1?Q?wAgYJvVvnCyF/7mCJ7PFlQB8UX/X7838/6ju/d+Yo7puJ05G230KeH+brg?=
 =?iso-8859-1?Q?jSpv86SzqOeOPpOg5Zc2a58zGhnWf75RzPARHlKDryfsrREjFN6G9lvR6+?=
 =?iso-8859-1?Q?c9bCI8Kib5URYx2HVSUsEIKaJTDoZOVCHHxwwOcgNOOlldB/W5VmobECVa?=
 =?iso-8859-1?Q?hbG9ymY2l5DK1Y9V1oeMvHOB9YM0c54yyyiZUT/7o6fNNSFygVHOX3jxqh?=
 =?iso-8859-1?Q?KDj2l9NH7eqg1gIkfTKD2RK9tuX+SN8p3UTN7hUmRvKb8o4EXk5SBzO2ix?=
 =?iso-8859-1?Q?U3Y5w6isbD87kKtzdJZsy5J6QGtW89FFaRIeRC4forzu+DulnWAHv0xvuO?=
 =?iso-8859-1?Q?WPt5o44rw9WBrs89CVlA3tqqvZeU83QpMVxI3aGAI5clrHQ5+uIw7vHvpK?=
 =?iso-8859-1?Q?FiRnddGeNjVNz61oHfoV9/qabar5tzHAPqh9DR0CVnp9x8wD1VnpE6yA0W?=
 =?iso-8859-1?Q?/u5t38GWdKHAVVGj9VT1pRYtdmMiPjGFxkaPnnJXHgIzQA1jfI2S5B8jCN?=
 =?iso-8859-1?Q?4h2RfFH/+dGtdk2072m7fz0Z8DCBnCCy81Iv6rNdsmr5ZEwZytonAWBCS+?=
 =?iso-8859-1?Q?Tmaue3ERYrXw3oTXmzvzGz5J/I/aLjFLSPbSC0QV1MQcGBv/Ekw6K7wYcb?=
 =?iso-8859-1?Q?1UL/F95ZK807Y8WbgrDXpN7Ss7oNiVUuwX9Pcjz6BKv+ldzfthDHNYKGa+?=
 =?iso-8859-1?Q?8cEzgeYpL6ThxuxnawUDpTyjlahw/9XlHhr1paLzN2I4WuALSYqOUpI7bc?=
 =?iso-8859-1?Q?aREWcjJM3YvWM/83rQmKvJK+a372DLc2V8KOsc94suK09dInLlM91jONd6?=
 =?iso-8859-1?Q?wxE3FWFBz6ynR6DN3aStm3Q7yrWiwStGhFGKcwW+Pz/Wwbe3+bJ4xYryTG?=
 =?iso-8859-1?Q?HmO/w25UUe/r+4RISMhbi3FkI1Rpre+hTDgOlNpyXrtlqNgFNMJn7gqDtM?=
 =?iso-8859-1?Q?uB6L16bfSfkAVQP6paaqnyOqpuHnz3D+PHcNH93v2x1+lzIOZq6mVeRECf?=
 =?iso-8859-1?Q?+M5kJMSMIC84RJq9cnZVtX7n24v5zI0WqaRanZMJmVIgYb4R3XnghpyMkx?=
 =?iso-8859-1?Q?Syr7RuM1gvG+7GBTJQ1cwNk0t6qRi5yAiinUBxHaBqDDpjMaT6re207c0e?=
 =?iso-8859-1?Q?JrCpB3ZpD9B67YSaJ63boZB6SODVQbXTErh4nVBpRFOkSGsNbf5wKp1ok7?=
 =?iso-8859-1?Q?VuUSbL+mslnQPfASccSLiKMKVuALv3iP7PSH/F1GvTvf8bn1d9qyusoInW?=
 =?iso-8859-1?Q?Gfcv7Jyug9PswovfdA+BtEPZwceJSqwVwY5oYIBgApG0TpLlxPC6naWjwi?=
 =?iso-8859-1?Q?MsdL47+pmY0UYJBVTjdQKSKNJQheoMHHCipQOkNOcvLuOxmQv7d6bW9A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3434dca-824f-4c8d-83cb-08dd6cc80729
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 00:40:50.8011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZUE4Hb4TvfbNrSKWP+sWGJ84sMLmYR5VzqfVCHXudpm55degvfhpkJLD1HnNR4B8O8FdYU3AiOCWibb9es85m23HYKFEDqer7NJbWaN7IQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7698

GCC 14.1 has 9 gcov counters and also can call new merge function
__gcov_merge_ior(), so we need a new stub for it.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/coverage/gcc_4_7.c   | 4 +++-
 xen/common/coverage/gcov_base.c | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
index 1c20e35ee5..e3ce69dc2e 100644
--- a/xen/common/coverage/gcc_4_7.c
+++ b/xen/common/coverage/gcc_4_7.c
@@ -28,8 +28,10 @@
 #define GCOV_COUNTERS 10
 #elif GCC_VERSION < 100000
 #define GCOV_COUNTERS 9
-#else
+#elif GCC_VERSION < 140100
 #define GCOV_COUNTERS 8
+#else
+#define GCOV_COUNTERS 9
 #endif
=20
 #define GCOV_TAG_FUNCTION_LENGTH        3
diff --git a/xen/common/coverage/gcov_base.c b/xen/common/coverage/gcov_bas=
e.c
index d0c6d0a3f9..742034e039 100644
--- a/xen/common/coverage/gcov_base.c
+++ b/xen/common/coverage/gcov_base.c
@@ -56,6 +56,11 @@ void __gcov_merge_delta(gcov_type *counters, unsigned in=
t n_counters)
     /* Unused. */
 }
=20
+void __gcov_merge_ior(gcov_type *counters, unsigned int n_counters)
+{
+    /* Unused. */
+}
+
 /*
  * Local variables:
  * mode: C
--=20
2.48.1

