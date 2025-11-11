Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86FBC4F545
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 18:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159200.1487600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZT-0000zl-LN; Tue, 11 Nov 2025 17:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159200.1487600; Tue, 11 Nov 2025 17:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZT-0000uo-Fv; Tue, 11 Nov 2025 17:54:23 +0000
Received: by outflank-mailman (input) for mailman id 1159200;
 Tue, 11 Nov 2025 17:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIsZS-0000bw-1l
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 17:54:22 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 730c5f5a-bf27-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 18:54:20 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by PAXPR03MB8249.eurprd03.prod.outlook.com
 (2603:10a6:102:24f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 17:54:17 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:54:17 +0000
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
X-Inumbo-ID: 730c5f5a-bf27-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFPtKbmi7JJYxK7YwS2R30fAyHljV0dkNqxC93VgatUqgGo7txOXGGkQuZ/Uv4gz+8zEdvltXpGpIyfzAYRu2O0F+BlXZpWQKYq1Whe2akQcr1ah8tdV23MxUtir+pYQ8yH4kjJ5PJoeAawi0qmOR0eIbV937WlI+ENcJYQtYS/sJs/7kFYNI821naumm3z/UAgCq3YX3Aza4ENHoZV+vfZXSlvl+N08kC1cPQLcfkKFNY5zDfRWTq0u9AJsn7IkTIIa6V5XLYF3OI3vNBUrEYmYbzRNdoT2sZMBr15PJOd89KSBt7xWgPFlYRLY8hltWf3Qrz53VhTiO3yz6HvLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdG5tINzAGu7lVrXunYrDCL0aGs+duhAEMHzUb/OBiM=;
 b=j0R0P6h4HknIMVLJhxBjrbQANYlPv4treFBwoEGaxBUPFJ7bKomJzoR9r4nHVMKZHxBpK8H9a7VbFnteRqw+vX2SBiHHw2vir6Z7jFTDjDp/qvB6AcooFFZZWjy2HHyC7RIMjqCeF3GGMnfeHokJmI5UdvBPfNRPnbY6Suvv/BOSqb+dlss+IQVdi/m0tP6HWWm6DEdTNdzdU+lbHA3EttkmmYI4ksUEldC2+9Bo3H5qyZFEjwyTYy6CtjIxlQQVDS3rhCY9od+INWcslmmC2oFbxtn4saTr4hosz6iuuxVtC+IE4k7szpKWQPacof/cQ3AZAkH3gf8L7n/ME2fUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdG5tINzAGu7lVrXunYrDCL0aGs+duhAEMHzUb/OBiM=;
 b=SIGccxnLzWVgDmMpMoBEkyCXAYWqGQ1x06TC/VxtqWEYcS1h0Mh5jt5nz0mLIEFd04VwlVWL/Vqp3k3sO8znyU9dOBQSQj4f0+4KoGOIo+jTbraLhyo2gv6IB6Ddjpq++yUbDlFPwQBMXvtUFzNwsV6v8N/AnJXSfrOFDYjG34I5jHJg5ytGCZwA/kV0OKBAEVs1aJpe6yUcNkz62baY5qfM60hxrRzEcAFpmWWtzPFF3LRcqFyyeePeG1y4GZUsRRMm/U6kg1RBooPG6Ma9F1Ht/FhSJmNr6u9wwpkL/a217nk82UVIAihNpBqmQy4yuail9kO9x4rD0vO6MsBaVQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [XEN][PATCH 2/5] x86: hvm: compat: introduce vcpu_is_hcall_compat()
 helper
Thread-Topic: [XEN][PATCH 2/5] x86: hvm: compat: introduce
 vcpu_is_hcall_compat() helper
Thread-Index: AQHcUzQySuWq07a/80u5KWcUyXBJ9A==
Date: Tue, 11 Nov 2025 17:54:17 +0000
Message-ID: <20251111175413.3540690-3-grygorii_strashko@epam.com>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111175413.3540690-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|PAXPR03MB8249:EE_
x-ms-office365-filtering-correlation-id: a8417112-8fad-4da8-15e0-08de214b5575
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rnJ0ZStlNkhp4poySRxiXI+Yb5t7EBDLb01E1pIgTI2TDYdFomcRlJdTLR?=
 =?iso-8859-1?Q?9waWe+O13ZCasYqPAexSYK0VBbEjjLXfLWspb3HRINfSC2Yc+K0SqXA0Zu?=
 =?iso-8859-1?Q?yEgyBXYwtSqfdQuFqzpXEy7ZoUL8pvw8CVS1F9WUyqx0T6uO7I5wRmCqlc?=
 =?iso-8859-1?Q?7nMo8xVz2fnR9f4fjQcprC5in+T0uNRBNKSfPhiLltT2MBhnUpfIfyiYjT?=
 =?iso-8859-1?Q?yAV9Un6Ok9wCf9/JvDStFp6ClTHiYQ91ZZTJLsUDMSLa/Ub+7Y1RZdKrrj?=
 =?iso-8859-1?Q?i+Nje/bmDhnnr21V8fCojKgD+cXEiVoOL/7lv8ZoDdt1xeCr1BDlp17hZM?=
 =?iso-8859-1?Q?n3k7pXT3NwNcgz4RycfbzEm2YOoHWDcApwgh+KjahH3rbFFvo2C6NCyFaG?=
 =?iso-8859-1?Q?4H4GXr0ofXJQmWvc4MAFXwDs5BSfOnFXEoWPrXjmNP7pkrksUX1JSZ8tjS?=
 =?iso-8859-1?Q?3GkMbhfVfr17NfCvLaq8xy9c5mApDbEf+1hvsgXlOa6zH/Ikv2dhpnR+7s?=
 =?iso-8859-1?Q?eQqRh+bdDNUStQVhEnhRgUKlHtDwQQ12JQbQTbtmoU4IoumyD1wGffKqt7?=
 =?iso-8859-1?Q?L+YOm5aLoZe7hNFdNv9BjOwaoESZIx5apQjYwcN758BahlBf8wGAOacC6g?=
 =?iso-8859-1?Q?2c48UL0z2NIuQLSAF35RF4UnlFlbFeQxnYIX2TyqgqDcZWkWiEk7j4xTzX?=
 =?iso-8859-1?Q?lnekGhvFAgfzjsQtXNSmNmp/7I5N2kJadw8yF7Xzf6Dl63e3Lqvpdwuo4M?=
 =?iso-8859-1?Q?eCue3V9iIv9p1EDFQxa2TIv/juU77eLeZT/e0+EfJqtdM03aHxMb1zA/P3?=
 =?iso-8859-1?Q?pWtAw4wfk+yYR7lOPSeb3kMolPWv3KOJqQN+FcaLgzGa9a93bVNkm3sFHa?=
 =?iso-8859-1?Q?Qwb/syGcUGt/WEDlZ+hbCNezwjkxBTecMcy6QQ7TEUcu7hbPsczVtkyFsl?=
 =?iso-8859-1?Q?u+qEaYvvftOtRarBRex+8FU31EpLRmkWknS8X1n5QCdOjXaLrFx4jYXp8j?=
 =?iso-8859-1?Q?KZaCs4F7581z0xZOcHk+KtwjiYuFxHq3K6I+qn8iC5w+9pjNLauBrCvmFT?=
 =?iso-8859-1?Q?ysSjCxRxViLlkVAD+xjpbZEE31pJ1YlMzy78UcgzNKb39oz33QB0Dsrxlj?=
 =?iso-8859-1?Q?znH7ETRgFGnLQIMY6EXlKZepkRrsuK81oZbHJLlo14I0ebqCCsfNJ/DQab?=
 =?iso-8859-1?Q?u7rQ0aAtOCvolRQps/sLbsivRjwQ3uIkQzZ72G/6Tc38NFIfVHO/oT4NNk?=
 =?iso-8859-1?Q?IlWpOGtBed/kBJghJiu9AlMWpulKrpgi7w4FA51D8D3TS3Lkoj3xzw6E52?=
 =?iso-8859-1?Q?+3jXUSMOh9dNhW0beWHPH2k/7DuBHiH5V/+jb7O/YHxTe8hlFdh4eQBjYj?=
 =?iso-8859-1?Q?xYnE9YRcKDDTgaKe9T39yA1X3zBM0WBJlRL701qEGLqu2zh1vW9aXCbVlJ?=
 =?iso-8859-1?Q?9WqlMFsqbk4eSU6h2tGHecOFGwyNaJaOZbIpUo9nxPhN4E8iBE3TXf9QlE?=
 =?iso-8859-1?Q?rueUlqRW5XLQD6NiQWfccKjFtTd2z/EfPDJAvDqZ5bNdqqPsrYTg+Mw+uE?=
 =?iso-8859-1?Q?k9vyjIouy1wj0Ty/xsqVXiLP28+p?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?j5N6Rbz6nGBd7M7DpghJe5H9eYlZCI/0wPLhaKEJ83OUA80E22eb6yZLLK?=
 =?iso-8859-1?Q?btRS2cRv0EKN8ZF0+81xjUVSpd5BzXnpF4PIZHSIVvEJlkrFjR7Axx7aQw?=
 =?iso-8859-1?Q?4AscyOCIpXB7Unkd1qHcm6/CtuB6HdBOHadwqs3XnP5xZyjdBnLv5MLXe5?=
 =?iso-8859-1?Q?8GFqWI2NzpVXxfo1FswvQHbyhxsadFCpDDa6+uEg9Xc0GOanaHf4gcNqoB?=
 =?iso-8859-1?Q?XE0rT162K++EuShmBVlwGxxsxp4zTw0AAFo4Tfa0ebAzxuG+peS7gBYbpg?=
 =?iso-8859-1?Q?mMolg8GWZlsD+PnoDJkrfGjL597JPx7JIQ2Jw8x5D6K2elErtFiHCW4nuz?=
 =?iso-8859-1?Q?bwYwHU0jrHxZllIS7cME4deSr/zHbTz+JSP5elfu+PFF7aYxy/qYMjCKHI?=
 =?iso-8859-1?Q?8/jqmfQg5BftVDOXMzivr4kB3Ad3GJmM4yFp/1lGtO8UpL446yY+SaJvqR?=
 =?iso-8859-1?Q?OHfJukxxidf0qB1Pee3PEF3rUbDTP+4Se5JpP9rRLTXwVB9gFY/w+KTHl+?=
 =?iso-8859-1?Q?N2c/ZHLENv73JWTYry2iYEYhr3V65OSdIJFCtyVAp2o/qi6T3APRWL3TX+?=
 =?iso-8859-1?Q?KY48PFEDlpNNZcNdYHFwE/MJLISVMONZsW/biRBJmo6rFmdJptygpTYo8J?=
 =?iso-8859-1?Q?JQEy0VHs52ucY0v3PHTbG8QsSjoCgtATCoQlGHZSz5KGU0vpXRdmEuRsZC?=
 =?iso-8859-1?Q?TkWYLVUgWyfkr26DBWyrj3d77G/MrYh+MVD1Q+bP2BwFG5dfDHGeemT0AQ?=
 =?iso-8859-1?Q?twJt4hQ9iEwSbUhURepXCk+bmAAe7RLdpbRBm1seH0RUKX/RJOhEQnWcP5?=
 =?iso-8859-1?Q?0byRJJAD5YUZHkac1yhj8TzYkJjJYrfmbSNpie/wMjuZe8lChNQSYYM3RL?=
 =?iso-8859-1?Q?IKnMaZikFGYDXS5k5uiYLU4eSrnKMCI4LQOLZGOC7CjRiGbxOLeVbtQ8mV?=
 =?iso-8859-1?Q?yOBLYwi4WtQ+xsuOSneipdojgIT72CvncOK9PfPyeBemKyritLX/ZQx+uD?=
 =?iso-8859-1?Q?mPOObzD1JbKOAcNZA0L4VtZFzcz9W/9WMX7lNwr6EVm3DnlmNgAcm8sCMP?=
 =?iso-8859-1?Q?wZCzGUjKlW3BwngN5coCUD9TUdtmvVHsy1frQWV/avTZ3lkX7DYKqklMNn?=
 =?iso-8859-1?Q?W28FjfQWHz9WgAPdR7N6D/OttiZP49R1BZ9lvp0xedK8zyvxD/dQNtf5Mb?=
 =?iso-8859-1?Q?g88ksx4oJysGzql+xiH5KGVmarxEcsCG7uWrw5UiesF/BPBWmp3oeGZBwU?=
 =?iso-8859-1?Q?dC1BO/MZxUawft29rw8eKNDaaszDc3ISdOkuI/jfyP8LblM4DxWT1q9HI0?=
 =?iso-8859-1?Q?gz8TZylcXXllp15Xc7P0VuJEs/UZVnAKsSyyL3Mr9I80VJPLK2hiVjrGZe?=
 =?iso-8859-1?Q?8R5BwUbjp3KipS+cKBvZyo8cB0/BDcJEWqhC3dgii+4YcayB1PEfhvxbQU?=
 =?iso-8859-1?Q?SpBmQhK4JhxjUs8gHU+JF8HoSilEG+r9XZz1ZfDbah9Vq1sX3oC5s99sFd?=
 =?iso-8859-1?Q?e2pyLhMi5UEBiPW4On0brfClnyNMBxxyOdRyesD3hGgQj/yBNKH2MG84SO?=
 =?iso-8859-1?Q?/FmRSt2zqH4pdz3SoBYG0yUyRmFHc27hrYUIZiZ3mZOtX/QtZxgkMtLo7k?=
 =?iso-8859-1?Q?OM09PyDwF7ITRzv3XDEvbzAVWrUorvDCqL6NX0fs0lqzljaRIfBnZxaQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8417112-8fad-4da8-15e0-08de214b5575
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 17:54:17.2643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPux3sg9r4VhicU51LWh+A3tbypdqcbY8VhD5t+pk/WdP6OD5jBp22qdwslOgN0XshqV0oTGlZY0psZrLIE+X7wf6Y4Hu8HzYcWA/cAkcuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8249

From: Grygorii Strashko <grygorii_strashko@epam.com>

Introduce vcpu_is_hcall_compat() helper and use it instead of direct access
to struct vcpu->hcall_compat field in preparation for making HVM COMPAT
code optional.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/hvm.c       | 9 +++++----
 xen/arch/x86/hvm/hypercall.c | 6 +++---
 xen/arch/x86/hypercall.c     | 6 +-----
 xen/common/kernel.c          | 2 +-
 xen/include/xen/sched.h      | 9 +++++++++
 5 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0c60faa39d7b..2e47a71714fd 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3500,7 +3500,7 @@ unsigned int copy_to_user_hvm(void *to, const void *f=
rom, unsigned int len)
 {
     int rc;
=20
-    if ( current->hcall_compat && is_compat_arg_xlat_range(to, len) )
+    if ( vcpu_is_hcall_compat(current) && is_compat_arg_xlat_range(to, len=
) )
     {
         memcpy(to, from, len);
         return 0;
@@ -3514,7 +3514,7 @@ unsigned int clear_user_hvm(void *to, unsigned int le=
n)
 {
     int rc;
=20
-    if ( current->hcall_compat && is_compat_arg_xlat_range(to, len) )
+    if ( vcpu_is_hcall_compat(current) && is_compat_arg_xlat_range(to, len=
) )
     {
         memset(to, 0x00, len);
         return 0;
@@ -3529,7 +3529,7 @@ unsigned int copy_from_user_hvm(void *to, const void =
*from, unsigned int len)
 {
     int rc;
=20
-    if ( current->hcall_compat && is_compat_arg_xlat_range(from, len) )
+    if ( vcpu_is_hcall_compat(current) && is_compat_arg_xlat_range(from, l=
en) )
     {
         memcpy(to, from, len);
         return 0;
@@ -5214,7 +5214,8 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PAR=
AM(void) arg)
         break;
=20
     case HVMOP_altp2m:
-        rc =3D current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_o=
p(arg);
+        rc =3D vcpu_is_hcall_compat(current) ? compat_altp2m_op(arg)
+                                           : do_altp2m_op(arg);
         break;
=20
     default:
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index b254b3e2f7d6..549e25445e67 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -29,7 +29,7 @@ long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PA=
RAM(void) arg)
         return -ENOSYS;
     }
=20
-    if ( !current->hcall_compat )
+    if ( !vcpu_is_hcall_compat(current) )
         rc =3D do_memory_op(cmd, arg);
     else
         rc =3D compat_memory_op(cmd, arg);
@@ -57,7 +57,7 @@ long hvm_grant_table_op(
         return -ENOSYS;
     }
=20
-    if ( !current->hcall_compat )
+    if ( !vcpu_is_hcall_compat(current) )
         return do_grant_table_op(cmd, uop, count);
     else
         return compat_grant_table_op(cmd, uop, count);
@@ -96,7 +96,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void)=
 arg)
         return -ENOSYS;
     }
=20
-    if ( !curr->hcall_compat )
+    if ( !vcpu_is_hcall_compat(curr) )
         return do_physdev_op(cmd, arg);
     else
         return compat_physdev_op(cmd, arg);
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index dc0a90ca0915..3a1a363d8648 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -53,11 +53,7 @@ unsigned long hypercall_create_continuation(
=20
         regs->rax =3D op;
=20
-#ifdef CONFIG_COMPAT
-        if ( !curr->hcall_compat )
-#else
-        if ( true )
-#endif
+        if ( !vcpu_is_hcall_compat(curr) )
         {
             for ( i =3D 0; *p !=3D '\0'; i++ )
             {
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index e6979352e100..99be0fbb9d90 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -615,7 +615,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         const struct vcpu *curr =3D current;
=20
 #ifdef CONFIG_COMPAT
-        if ( curr->hcall_compat )
+        if ( vcpu_is_hcall_compat(curr) )
         {
             compat_platform_parameters_t params =3D {
                 .virt_start =3D is_pv_vcpu(curr)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 02bdc256ce37..e3ce427f0bd9 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -311,6 +311,15 @@ struct vcpu
 #endif
 };
=20
+static inline bool vcpu_is_hcall_compat(const struct vcpu *v)
+{
+#ifdef CONFIG_COMPAT
+    return v->hcall_compat;
+#else
+    return false;
+#endif /* CONFIG_COMPAT */
+}
+
 struct sched_unit {
     struct domain         *domain;
     struct vcpu           *vcpu_list;
--=20
2.34.1

