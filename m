Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77395BAA602
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133281.1471463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IqB-0002vh-TW; Mon, 29 Sep 2025 18:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133281.1471463; Mon, 29 Sep 2025 18:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IqB-0002t1-O6; Mon, 29 Sep 2025 18:43:15 +0000
Received: by outflank-mailman (input) for mailman id 1133281;
 Mon, 29 Sep 2025 18:43:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6YU8=4I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v3IqA-0002RY-5C
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:43:14 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 276a20b5-9d64-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:43:13 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI1PR03MB6591.eurprd03.prod.outlook.com (2603:10a6:800:19f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 18:43:11 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 18:43:11 +0000
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
X-Inumbo-ID: 276a20b5-9d64-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1VpH4Qm+FEb5QOr7cUjFDh3Pk0CPB9V1zXCNEeGNrAACs9V7SO7ZvuvUTWwnanyGD8r8qdlmCWL9GjNtBPg819W/f1N2VO899Ik4D7x7BZ1QnuroN8xaeqjMrqFHNYdLAk/Bq8R20+A/mDEGD4++0GcGJVeUPvPwJKbCRAt6fpQqcEInTt55j37QlUDscjxHJcWLCdx+8422z/y7oyyQVBYjSuabuaFeb6mqqEi0S0LSUONtvIii2VFWjDwaoCxOCeDs3AhMyhOelmUnvRrEoUPMTNp7cAMdjB03f91i71qKuInNnR2OQk7se/+gs6kWmOxJlPAs4ieCMb6O0z2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x3ib5+D29JOj///4+abaLXCnrAt2rgzaFpirzRaK68=;
 b=VHVcXgkplPS2WCM6KJ17Neuqxm9Iq4WocYvpF+ANwBSC3n63HLTVvkarysPmHCeV5tndigrzm00kEBo3TQ7JxYCZfPzmKQKLIsgpJJdTIhil6z1R1Op8sv/JGpKrdGVJrj70rwC1fDgBoN79tc2XX+c3cEZtNNDwo6mAPIHlQjM7uNzW3I0/XYNgv3OJWo845L19L0vYfmnrWRkExatUbUw6rlZX9NvGl0Xc1z/j1NWF80V3V7kpUf6Bdc3Sj7o1FyBzi5zMG6Kc353hmm1+V0qJ8+44grj99/ZZ8Id0UZdjq1H2pVB13HVw0kBOwCeryCUp+0i5rh6gfjMta9hqeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x3ib5+D29JOj///4+abaLXCnrAt2rgzaFpirzRaK68=;
 b=t8BtFzcNuC2V4oAPDnbltYzZzqcGraJBiobXYENbHqY3tWi2MLMtdSK30AaFD6mo+60yQhX4ol/bLGNt9cjDoi0l4Si0A1ajlifKyIkoRZhEhoGWfnd9eiq4/z9gqscbUDxIxI/QRXpaxT2Y/tzkV4rvaWTjVauaSclcI1a4+xtWaoEJNr/Pgl5InoQ3rI0vA8yQKLbEysXQC/01EcmRApfQZ+Bj7y8YNybz8crydq0WlG1jq/vx57LtYlirZ32nq31657wwhDSG5nrjNxshL6vZV5HEjUFRlvq72c1wWmqySASvPPNIR2csMeuym/Fezy2DZt5QRaLIwuSUuBoFcg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/2] arm/gic_v3: address violations of MISRA C Rule 2.1
Thread-Topic: [PATCH v4 2/2] arm/gic_v3: address violations of MISRA C Rule
 2.1
Thread-Index: AQHcMXDoriceWLTjBkO+YV17n/oK0w==
Date: Mon, 29 Sep 2025 18:43:11 +0000
Message-ID:
 <54fd67f0f993aca28d1447502f29cec6fde8816f.1759168391.git.dmytro_prokopchuk1@epam.com>
References: <cover.1759168391.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1759168391.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI1PR03MB6591:EE_
x-ms-office365-filtering-correlation-id: c9bd9a01-893c-46e9-7e8f-08ddff880aca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?o3hxlwVNd3bdGevRKfeNLkw5gVmxXXOv32D0QwtnD/oIkJg3H1zvN+99+V?=
 =?iso-8859-1?Q?JYGOfAln7OLRqSoIWSOFjI6U7NsUjfdCOEe1ui+3+DCvr0hfhZbxT2RI0Z?=
 =?iso-8859-1?Q?wFpxtroarDo/vK385eaDhTMMuceBppVGNbHrKkgPPpeZzyVYf/f0exfxw3?=
 =?iso-8859-1?Q?CoWUW4PMYIEnw5ZFW5SYxtd8zqFzpgQKT34iOcXVrI1lajaQe6ofq7VDwH?=
 =?iso-8859-1?Q?QdJeGH4NLevzD16rMXmVwxEoz5NreKAv6fSSmjjCNKFTAUeK/IDkkTfo4I?=
 =?iso-8859-1?Q?j9kxBQ3D4BO5ccuC78SJfFfqpqN0jyrCIgsaaCO8+uaStxi4Ck0gSQSXIn?=
 =?iso-8859-1?Q?6Xbu+x4C2QMkQr6EaONQK3eMC+yHX0q1EqybkZ620EU4x7G/CXXGtzwHJ3?=
 =?iso-8859-1?Q?ztDixrtM+s0bi+M8p4EzjiXzfVTPBGg1dN9axnocnRY2j7ktpEYbWYlN1o?=
 =?iso-8859-1?Q?GIYwHAhkBdRU3qpmlZn0BDr0RUIWjc8ftp6YoBQtbgdawBkoR0SRScASAD?=
 =?iso-8859-1?Q?Db1Ki+XtDaQKcqxMV/OTmsTZWasLkduIIsvo4lhmRs9p2DbpIwdOaBqUOY?=
 =?iso-8859-1?Q?w85b3Lcbydvo6KnNwMLVoCS6AuIANkgl42d8LmMPJgtW2vAzFJK9fML7HT?=
 =?iso-8859-1?Q?dZCpZlgG7GqmrRylDPsQIZEjzJSSff8Svps2Kah4KdQ/R4Wi66BrLSH0jw?=
 =?iso-8859-1?Q?LiGxHWSuqP92UVoSZ4B4KRzkDDWZKEunRNuGfpduYNY5wUBBdyJM8LhKFl?=
 =?iso-8859-1?Q?cH3XqIib0vbZc3cFAmwZfz+YMqFO68MX9canVxlGEq5LpPUT6LbwqSFGfl?=
 =?iso-8859-1?Q?fjOVxbkSKQyPUpIlm8b6a5ukinzC/6duq7iR/TCveW+QWRP+YTDd5+dOvL?=
 =?iso-8859-1?Q?irv2bRMwoxDT+kqqcVCh3ZB98WoVgn36Xy9VtMHh9NVzFpYpuKxlsCTBDc?=
 =?iso-8859-1?Q?idW4tSJ/VJWU4OCGjCLgDPiz4blZJuHrBx2YFtlW/72h0EePg/elb0oTTL?=
 =?iso-8859-1?Q?Y8oue2UoRrg1IesSXEE05cGRHYEamlXySE7+fa2TuPbtp7YdrfAMfRHkzz?=
 =?iso-8859-1?Q?SHQbCBAtpjpNQyRWz3VB8aqNovCOvmxgezzLruhvlpwTsGZrI1LWPzNZUY?=
 =?iso-8859-1?Q?2nRv3GjD3A2wWpxgZ0JIqUo9Q3ExowtdjTgBP/HfFPVwT4meywBRlr9ZLp?=
 =?iso-8859-1?Q?T3oshw8pZTEdPyWW9/ywOW8n5bAhtUWRVHs5CFao4U00ywq837CenNvWFJ?=
 =?iso-8859-1?Q?vkx1T0IhP3oCBZ3rgWN9s+eIdDCmN3Nkq6moku7c9tN04JLj4ejkpPjYCF?=
 =?iso-8859-1?Q?531cNp5LD4ActkV0aUh52/QvM5cGNqHqmG7HZq4xPzvbZMVCAAO2b4ANJd?=
 =?iso-8859-1?Q?egVmJ8LfqLN6mxyiVWfklnkIdkvA501ADuL/HRA9WocWGgF3Ylg8RdBnKo?=
 =?iso-8859-1?Q?3So15EnciSN6i2942qZxHCH/EeiQ4BJquYnU/+YCAwTVHCMmjCmU5+CrWO?=
 =?iso-8859-1?Q?yIWvCOV+vM/0mEu4Pu498nh/+H+FKhasd7Hp2FXCzyNcig1jJHeIfm8RV9?=
 =?iso-8859-1?Q?B2blL+nvFdW1/ku7s4XbMg8AyzUg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FwGBflgsTYBLRPPYp2pgGdCfWolT0Pod0serOejYOjoYsfdqMLp9A0Irkt?=
 =?iso-8859-1?Q?tifL5lgrVZd3B6l/X37QUagzvysCQpmfICuY+kNTwAwR1SWrkQMJT9z8qA?=
 =?iso-8859-1?Q?6G3VE5mF84lr2EWi27Adk3VNiE4GLjI1vXOh2I0BqYn2S1/qdWFnnWpP39?=
 =?iso-8859-1?Q?x2styyJDSETkKEIV2NSdBmc8nA2lAhoL4svPjWlM71tO5rrCvpIvQysJFn?=
 =?iso-8859-1?Q?/DGPCnS+jlCLZvQBJBSVA486sFookDEG5gHAhCSjBTgBo+aiI8wTLlQvi2?=
 =?iso-8859-1?Q?y0sFfXqJjQcKQ+mKqdkZtray9Z2AQHKqQ3ar781Am0DZmHOUbiZWO5aMQ9?=
 =?iso-8859-1?Q?xO1iZRzN0gDfTxOMnbDg8cqWgr3JPGu9OmJcsAWElLh8u0l8NnvXA6/im0?=
 =?iso-8859-1?Q?+4KsXNVBvCGzAE9TN/r1JpD1Ri5ju7C5rbKE779ZrJ8mqEkt0AWuLfXKY1?=
 =?iso-8859-1?Q?zIgpPubU2WxBQTXsv4ZBWHgG/lwBV7TQHN8Ou02pJkSJ04SBjZxYfYFIQ4?=
 =?iso-8859-1?Q?jBnzZ+VSjGqicS8W6t9WmGYi5rchijAADC/asuLF9df0ca7jPvxj4G23a/?=
 =?iso-8859-1?Q?QZhmJBYct90SmaJhdj2xvsPzrqd2Un/UeyTNy2GElfpxF54yrIlApDtisS?=
 =?iso-8859-1?Q?+FyOzUUZo05bScbSohWGr2I/rU4kHIKuD92xs9e4Alus0QOH7Dwq88u/wD?=
 =?iso-8859-1?Q?Zxa76Mx/W36rGKaljDGIe2FZEMFUXDaZiEF8GaSKjWkO7divYtggJOImGy?=
 =?iso-8859-1?Q?7ajQnKSbGNkx2IamLNYgo2HdMRzeGbpjJQX/vchdIRPguyQ8KuxTjBdhFM?=
 =?iso-8859-1?Q?t5PLSAl/0TfHaAKoJSbKIUl4XPd2qDNxNMxcnWEmeU/7hUCl0cgkHO4e3e?=
 =?iso-8859-1?Q?rc72XVhNM1tVdc9K14B/YZ+KshRjKyu8Mgc9TaHVrRdkvyTv1BUCB8Ar9b?=
 =?iso-8859-1?Q?BBU8n9YlS0bh/7ug57UhRJ9fTupMg0tNfhw5225LtzbHH3/94YGuxYu2xT?=
 =?iso-8859-1?Q?OBHETA7I+T5lnIQdBYD9ZfOqvTU1QPm1qCLjTOQC/IhacxG4JkIhqoe/Pu?=
 =?iso-8859-1?Q?XvUfYpnEQe0Cf3mIbLrbbR+dg0DP6RcJ5tXQOO+2+MkMSY+QIznOxAjx9Z?=
 =?iso-8859-1?Q?A25PsSOfCYKzGPNrUzm2FI3CgbX6e5C4RQa9tIM6Xh8pTvCVpxuzdd4wMz?=
 =?iso-8859-1?Q?H2EcCbvq5WsBGeaOROckuCFW0rpaH8CtEeEGmofgCVZGsBaJikeGyfAHv0?=
 =?iso-8859-1?Q?6h34TovGppz/RY3cP9sNdUdbgycEoQpzb9e14q+Ynv8pvCxtqha93sFyN2?=
 =?iso-8859-1?Q?950gKPWQNsWtpDBffOfI9AfKICRO1UJH7GSiwYR0t3Zcu5e2Bvm4uRceFs?=
 =?iso-8859-1?Q?wt8o7pwZG0218JlgcwOfUmNsv1A8wzC0GXlr1g8+aizBzmQr1PkR1S1Ycf?=
 =?iso-8859-1?Q?kNHTqBpwT6e0Wqs8Yd3Px1aNucuBnTngqDk4v+twaXMGU+/82igrRjxe0+?=
 =?iso-8859-1?Q?bmeRAGYfi6T5XIWRZfFVks4cb5hhVFZzmgHJmyheyqMqaKHI9K9RWnjN3U?=
 =?iso-8859-1?Q?J1VxPyeg+LRPRvsKPjE+yCwkI3zGx08n9U+VvPrViBmxvwy9/Ez2Kcy13f?=
 =?iso-8859-1?Q?OANFG74xRcfRLAE87lFqNNic9Tna986CAq1Rr3AaeQvw8NvZ/ZpooCkw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bd9a01-893c-46e9-7e8f-08ddff880aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 18:43:11.7610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ofs8By1ykWQPb8OI+53c0Erd37Ai12AtHKQe8KiaWvND30/mtKj4N6rLf9reybSMgFKEBwxQfRgUESjJgYtVGjMhffwcBNI6CGcfQZkfSpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6591

MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
In certain build configuration the following 'gicv3_its_setup_collection()'
function is defined as inline and contains the macro 'BUG()'. This resulted
in violation due to the function became non-returning.

To ensure compliance with MISRA C Rule 2.1 remove inline function and its
'BUG()'-based unreachable code. Provide unconditional function declaration
for 'gicv3_its_setup_collection()'. Rely on the compiler's DCE to remove
unused function calls, and use the 'gicv3_its_host_has_its()' predicate,
which always returns false when 'CONFIG_HAS_ITS' is disabled, to statically
resolve conditional branches:
    if ( gicv3_its_host_has_its() )
    {
        ...
        ret =3D gicv3_its_setup_collection(smp_processor_id());
        if ( ret )
            return ret;
    }

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/arm/include/asm/gic_v3_its.h | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index 0737e67aa6..fc5a84892c 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -131,6 +131,8 @@ struct host_its {
     unsigned int flags;
 };
=20
+/* Map a collection for this host CPU to each host ITS. */
+int gicv3_its_setup_collection(unsigned int cpu);
=20
 #ifdef CONFIG_HAS_ITS
=20
@@ -160,9 +162,6 @@ int gicv3_its_init(void);
 void gicv3_set_redist_address(paddr_t address, unsigned int redist_id);
 uint64_t gicv3_get_redist_address(unsigned int cpu, bool use_pta);
=20
-/* Map a collection for this host CPU to each host ITS. */
-int gicv3_its_setup_collection(unsigned int cpu);
-
 /* Initialize and destroy the per-domain parts of the virtual ITS support.=
 */
 int vgic_v3_its_init_domain(struct domain *d);
 void vgic_v3_its_free_domain(struct domain *d);
@@ -256,12 +255,6 @@ static inline void gicv3_set_redist_address(paddr_t ad=
dress,
 {
 }
=20
-static inline int gicv3_its_setup_collection(unsigned int cpu)
-{
-    /* We should never get here without an ITS. */
-    BUG();
-}
-
 static inline int vgic_v3_its_init_domain(struct domain *d)
 {
     return 0;
--=20
2.43.0

