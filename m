Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK0QAC8kgmnPPgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:37:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2B1DC133
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:37:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219384.1528264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJO4-0001jp-6l; Tue, 03 Feb 2026 16:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219384.1528264; Tue, 03 Feb 2026 16:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJO4-0001hJ-3y; Tue, 03 Feb 2026 16:36:24 +0000
Received: by outflank-mailman (input) for mailman id 1219384;
 Tue, 03 Feb 2026 16:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vnJO3-0001hD-FN
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 16:36:23 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78f68809-011e-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 17:36:21 +0100 (CET)
Received: from AS9PR06CA0256.eurprd06.prod.outlook.com (2603:10a6:20b:45f::7)
 by GVXPR08MB10812.eurprd08.prod.outlook.com (2603:10a6:150:153::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:36:13 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:45f:cafe::fd) by AS9PR06CA0256.outlook.office365.com
 (2603:10a6:20b:45f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 16:36:10 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Tue, 3 Feb 2026 16:36:13 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB6473.eurprd08.prod.outlook.com (2603:10a6:10:257::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:35:07 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:35:07 +0000
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
X-Inumbo-ID: 78f68809-011e-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uWFc3MevPKsWXbfbSuQwqx+6ivFXsAeJiwSu3DA89jqGUx4gHWTK+EbKCR9mhWPCYQKVQlugXbUmBBbImOLJFSBQFaH4ypaqEzFRyz2E4T3RDm3jl5hV02IkKjJDPNCJpLMo217uMofLVx0OMullhoIOI/eqxkroGvGRIvy7yOXmK5mUHRTBZde24dmq2w4VRQM70Snc/nMohIJjBCbbthvwCQURzxRyvOfndPKMPBg07fX4bfno6tb0YnlJdg1Li7gQC+m/gcuAYXNJVohFQvr+CRFSVRT0VZjmK65z0GBh9KXRlj0xb3HTtHqRyfMmjQtLiWu6m8+7gm2oIOCtkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Dsx8fcTzIpeGLNGtyA/G+vgUB/g184wbUSnT6QPl4c=;
 b=rjeviEIkO3LpFoOhe7n5HIBEUwu2GwvCKDn3jXga9qgmRxYb3Z3g+ymxKj3+KQkgdFwMk9ua+GRjwbtynmOMYCHBRU4sfPEDW3oCU1nalHlrALrY5CNnR1o5zaXkgkxcz4l2dmpCP/44lB7KH0KiFp+F7xCb1tuIK0av6LYEnCuJDohSHLk4FE3umMfw+e3YBaaKAa/JcV5CAfoSN1QjeMksSFwV5i+paf39EZsMmGSdTWGTZjvJlyKdTLH/kNWzHo+qhhCXDuG8m+LCA5/CONQwgMPugwsfoehDaZwD0WN7VbPRTFKiysEi1m+MEo4MNWf9PVE6SIs0mJHlpunMsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dsx8fcTzIpeGLNGtyA/G+vgUB/g184wbUSnT6QPl4c=;
 b=LOB9TP1tsNRyP586FC7oV63RUp8FcTq2vsCVp18+kGWB4pebpbnS7I7VjHUJnakTPhpWMvReMUGf7eZR0/xmE8P5oxjJz9kUZPF5H0CmoHaGbxc2rVF1zrexLh/9x7nQ7DtDWp/qKZTi2mh6Lp4Hunp+l0s/kZpwihNcrI6n+Kg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nO6giaH8NnJDm7bQNx5PN87eQw+2ZtZIBuj9zo9FmeRgKksd6UFGoWDIuk+n2yqJY2IcsDDp5nPB4/OdazDpmhpEBbjFbRe/7771EJrYdaRZYWGRwRSBddyhgqxj3Y4cWycxaDoMHGbj6innM3HTog6WpFt3JhmRaR2g6r4ybumxMD0OfDx0EdIKs8qyjqZkzovvA14L0ys5wxHPYnxG2IJF8z2fRANTM2hs/FhpWKZyJjoyAaFYOukgUM7zMMujFayrBXaBFqxz530LGn1Rx9Uh/47g7o0zDlop8H4+Uf7K7Q7X1Ko9nUubOknfZW5EfZ3nFKqPBxMn4GDYuNX+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Dsx8fcTzIpeGLNGtyA/G+vgUB/g184wbUSnT6QPl4c=;
 b=K/3TO6Zj5Hmv3NcqThYhIVpeqKnHOUN8hqJ6pOkkx+u+FsmGyV8vjg51TGxzx/IK8khZYvo90e/IpR/HPwcbfcxgqGy1rbRJ8lkLt/VDFB1bdYw7xPfIINAGLxd5CTkX6CVZ35OEnlCPj1f1e+S8Xuq8ma8Y509lEz1YKJHZBpK19KodmpaR+LRPmfzdupjIshoduWbxnzT5Za8LV6wS7FP4DpYsUFWxXLoLr5hLIQyJwXHeSUcnbOOcoIH9RdHVV1vwH5BcsOFXKOSIT4wzQFfmW/atYukamTJyL0Ywf8D2Ra5XJYU2VpPB5meKnNtM34pn4BrUuuYE8JZozKd7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dsx8fcTzIpeGLNGtyA/G+vgUB/g184wbUSnT6QPl4c=;
 b=LOB9TP1tsNRyP586FC7oV63RUp8FcTq2vsCVp18+kGWB4pebpbnS7I7VjHUJnakTPhpWMvReMUGf7eZR0/xmE8P5oxjJz9kUZPF5H0CmoHaGbxc2rVF1zrexLh/9x7nQ7DtDWp/qKZTi2mh6Lp4Hunp+l0s/kZpwihNcrI6n+Kg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 0/5] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v5 0/5] Implement CPU hotplug on Arm
Thread-Index: AQHchGj6Bf8iLxj9KkKeGyrpjQwglLVxTT0A
Date: Tue, 3 Feb 2026 16:35:07 +0000
Message-ID: <51B975F5-C0EB-43AE-97FD-CC937DBC593B@arm.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1768293759.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB6473:EE_|AMS1EPF00000043:EE_|GVXPR08MB10812:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0703e7-dc5f-4e69-8584-08de63425826
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?Je4taenCkyMoMQ3RDhgsU0xWNPANXmAM5kQL+d0AAgRXMAHjUum/YVjP6T?=
 =?iso-8859-1?Q?GTxvoCqsmrbRTcLSWbx7NGgh1CfL+5mOIynaxnYFYofskMRmOqP2wUonr3?=
 =?iso-8859-1?Q?OLQ2SgPsoVOwuYhL+fRioydZL8p2gKlaI1c9Qs2Kg0F6r0a/J/4YYSJghk?=
 =?iso-8859-1?Q?ElpNTwWcbOxrga6lHYfpDyfLU4hwRsiI8pmcXJ0M+4dZk75tFXvvtkezmK?=
 =?iso-8859-1?Q?YCHVrNBg/lXuqum4wPTpOewHSAyLMCJJG7HuP+D6gEnupV5n1TT9CRAtS3?=
 =?iso-8859-1?Q?sblEW/l278htSyvJEIXa/JTWSt+Ftbbs35W94KJPnFb207kWT+1HnTFDVr?=
 =?iso-8859-1?Q?rGy5wxeFmhLf3AGUVrubnaPC3I0iD635zr3zZnj0+km+IaSnJWPZgFIlcN?=
 =?iso-8859-1?Q?SP/gFNkysXDFEnDSGH30TwJ5qBQ+WKqp8JF24l/YE4UggM5IhUmby4EhAP?=
 =?iso-8859-1?Q?ifhAYi1/Yc63mTtDVT2a75GU7GHJnNtGI7p3KoE2vDbpsvOPN8MXAsmxLO?=
 =?iso-8859-1?Q?tSyRMasIqxnKw+751guJTS1w7mpXGX82y378JQ8353vtdi/eFHLJ/kGUHT?=
 =?iso-8859-1?Q?+/BOTsqGyMrcnW/19Tf+WC+8XHM3ZUEercpmdvIOuyVKbe/PAwnxZhXUzW?=
 =?iso-8859-1?Q?+BpRgEXti54ZTznKld1fxfuszXxzfvpHNGwPyJcKRqYFgi76YnWZ0NP32H?=
 =?iso-8859-1?Q?cTHuCXGKaaww8ILks75iDHJg1xKq7y5CuqxgKmNnDqCqhdaLshWKt76F1b?=
 =?iso-8859-1?Q?u0jlXN1Wrju0JJbMwakAoYguaKUU01piF0/zgQvA9SLvJ1C3dqgaDaoSba?=
 =?iso-8859-1?Q?fc9K+Ml2C9codY6VrHpCATuflCts8cycbt8eEHpmNlNo6kvvbvWA0J/BNv?=
 =?iso-8859-1?Q?0I3Uckm+si0TfD2lh8Tzxnetgc+FdHrOGN+Mnhld3Ps+e0jjRL3nrpmuHN?=
 =?iso-8859-1?Q?UuR/OpQFEg7lwF5MFSk6l10fzpbt4UL1ERd/Mqnuj6oTF1++yox0damSLz?=
 =?iso-8859-1?Q?/Azfj3L8svF3Sit1zDj5tIwHqY/E8/Em1vx8HogDJ9n960aV8XarPVD9zx?=
 =?iso-8859-1?Q?oHB5RLeW9R4Vm4hA3jfj22WbsmLt8ASCOdO6LAysJMMehRNsyhESeHyjVi?=
 =?iso-8859-1?Q?N0phSXZhEhqx1G6KVUkd7Q4CEhPnJ1cxOjWgqaCXHFQTTfpBsB4tXMd/K1?=
 =?iso-8859-1?Q?vaNHEvNvnStSDP6qwK9GxO/FkMqKUL9scHw0KoziB+FuGcV8bz3dPEBzzJ?=
 =?iso-8859-1?Q?Po0eZ2g+wgYW69ZO/S377Su/eZoxF4M580hs3PCplGXxZwypEpIqy8MlEY?=
 =?iso-8859-1?Q?zAFutW0+mam73xNSW2g+FnHGHVYnW7ZVldzHrG30gZd0kQZ/q3l29M7sgq?=
 =?iso-8859-1?Q?OENG8x7QM3ycF4q44gtwrep/wxYJh121YY1x8+MzOIDH6n7zzPWD61L7Yb?=
 =?iso-8859-1?Q?e8aBhVgDXClO6GAlya78yp9F9QO3VTttycwnYFIwrI7NLjOjoPLR160PlU?=
 =?iso-8859-1?Q?k1jPu1J9TURvFGPxsrwQhwXFnZ+Fyg+Hy88Fuy4YjQBKcKht/P7ZzHmwls?=
 =?iso-8859-1?Q?HlUOOhzZNq0lXmYsIqIRBCUoRgaEk0WYTGcL5tTKf+xWBLjXOlkoRAYkjb?=
 =?iso-8859-1?Q?D8KbrVhskjpNeSjqMdQbg35ESaTh2kD6jBXUXuQVtkNA5web5sCr3zDE0k?=
 =?iso-8859-1?Q?PhntZm2PjwbHUNb3aTE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B12F74642B8D814DAAA2A7560B1E476B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6473
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7034659-03b5-43f3-6837-08de63423118
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|7416014|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?DiUiBMxQBkUlCGLWTS4rJtag0uIjJowar9TQxpJYiPO9pc0p74izB742HG?=
 =?iso-8859-1?Q?8M+SZwIs8i7FOeQVNLbJEiU/7BI8H+QhAwzQ656w1vf5KEJKGFb1T22MK+?=
 =?iso-8859-1?Q?1J0ectaIvmJ4lq4rg2+KCoUf2acqA23gtW8cqiYFE6/egPVXdEMRPdxjqr?=
 =?iso-8859-1?Q?n0N7BvrFNDAkIXr0YnfRb1xa8ZmmfGd4NjLbZ9INNnc8CwIhW65LIKtN2d?=
 =?iso-8859-1?Q?TLzL2nAz+Jb7zjwF2BB4lO1qOFxqurIVVJZt8M3JicWuETlVgmOqoTvKdl?=
 =?iso-8859-1?Q?jPHrdA4kkWUtCGFSbHu1Eah9cop6BwVCaHxchbIxoxK2DrWEoapGAkh++2?=
 =?iso-8859-1?Q?fHLSNot0FH5BgFbn2M8oXOFZWyWS6G0zuX4NMpJ0T+dslVZzUcVA7kfaIS?=
 =?iso-8859-1?Q?jr5kt/tEZtRSXMVW0xgHex3BfzVgUqRTzH+jN+wDImpuIJiBlgM4Zcz+/Z?=
 =?iso-8859-1?Q?p7zTR494k2IExZwIiT3562UdYn0wJR1gJwXvrPYFxXUOm26B+TeeTWKPUp?=
 =?iso-8859-1?Q?wp/ziC5I9kgBMthK7+eZKP/+JTBMB1Zg01jdzQ87GbgLNNsGJYv4/tDHOz?=
 =?iso-8859-1?Q?w7hysqz1hbmNaXFWgAOXsKdCU6YQ8GUQ4cQOCfWvUnzt8CzLRaxarcH+PF?=
 =?iso-8859-1?Q?vacCTw9hX1cyGo9f5X2id4VzsD30whZLKxgsb6OZY1MxZrb7kAvrQe4nFD?=
 =?iso-8859-1?Q?3+xLtahHgdr9kmFrDKTlxwV98MhgAZLGrsvJCo1nYtkRv+hLj4Byy+JvrN?=
 =?iso-8859-1?Q?tMl6EFmhvtVsLZGK3b5L37JFxx+1p0NiIIUpxQslvWPktiWXMnDhewsU3Y?=
 =?iso-8859-1?Q?BsdHkhUrgcGPYZ0ND+cznxRrVfsFuvptW3FK+qOUDDWjWacyXNVh3shz+b?=
 =?iso-8859-1?Q?udkypT8TDB81GWZpZEIlcV2edF7EBDku3VreQjyToDoN6vYxrwuDuzSHSm?=
 =?iso-8859-1?Q?QO/z9zmK+CSvi0hOoAyjbV0m9iruooMpaunlzcc+NS4XC54idrdYL3dlYU?=
 =?iso-8859-1?Q?kfHLKEm2yzRNJPg/tPjdsD0ZYrJ1yMlSsowJHzssMpP7z0L8gEQHTsPXfT?=
 =?iso-8859-1?Q?hki32mqCknORWi2+nrzfZLiHXyqk1CiEQYornb/Wb9ZP2e0JYHDlc2to5T?=
 =?iso-8859-1?Q?sKBvZ7i94ToiNqnYbhkRBIUDjXQLoXfyOyPu9EecbC0Vi7D56HA/s5RnFr?=
 =?iso-8859-1?Q?FuQoj84CRokyCoWI8U1l63Auf+6ioZc93tIEXK7xBUC/r8Vz83fTDcNXvN?=
 =?iso-8859-1?Q?59uGQFkP4+Y0Oty7EIWHZ41A4IA1jI0Oh3xdRmifY+NzX76E4j+ees1UOD?=
 =?iso-8859-1?Q?AMNw0BGbEkJ7rE1szP0znzlpovmQOu85bVHqu4sHj3emJXhtedLHSyTN/m?=
 =?iso-8859-1?Q?3ME3578g0A0Z3jR0kCLbC5slxh/9N1+ILo1FYItY+hV5tCGqkdW1Gu3Wcl?=
 =?iso-8859-1?Q?WRhX6ZJkY4uiII6XPvf1dU/RNJ0NqVQtFBCRp26cK5Lch2lmjF1udxcjzb?=
 =?iso-8859-1?Q?c8M3fzAchApHTeiltgJi3cfzz05yZZACsV87WFstbJwf5fHj5HmaCe5rJV?=
 =?iso-8859-1?Q?lrrKFYbgSl88+5JucqAgI1HmVxKi3elhpmnVD5uE7XKHCaDF1vrEHYg2iu?=
 =?iso-8859-1?Q?xr+7PBx2AHv6ZeicXUlBkGK1lYc8JOwbbSQANGp88FHteZdPp701xCxt8t?=
 =?iso-8859-1?Q?fvNhcrY7u9kR1yIJj+RKsB3GX5hdTvv8BfJiYmiIGF9GjCyvYv3rptqvem?=
 =?iso-8859-1?Q?eg5Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(7416014)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UT90I6fjRJc/0nnYOjgXPQ4MsxyuhtEUy2F7aQSye4Bs8ISzXSZQAKxHvDB/Xo2BaZoHSC1fh0G79GPB9HAKG8diflv/63P47Yl1llC14eiZ+Atjq93Snw0wiob/Ccna9G8RMHOhEnBb2Lil7L/mTR9pkqFCkrK1/ptbMcjqgL34qq0V2ZMZJIYBwXM0eBpTAyHRyzUHj51LmWgmBXkd+erb1x+ODu0lz6wpmFRhrDaEYVWs2Jynhr8onsHTiofQ8jnQ4/8tTak0YNM98TV03cSMfOnLv1rRCCQQVE+3ioLtuIsTxNALCVyHCNvaLu+u1N6PjJTJHoxOMYQPW6wy6paNbpv5Hc3NY/HsnKAfONciMvyhPw/7tVDIonRUhe9/ucdaG2Csvlkf+yb5MEDKjN8ghF//uz4Ocmv/+r9q+cZL9V15Jkv1MKvn7ugDoIFT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:36:13.0247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0703e7-dc5f-4e69-8584-08de63425826
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10812
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xen.org,amd.com,epam.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,support.md:url,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 2C2B1DC133
X-Rspamd-Action: no action

Hi Mykyta,

> On 13 Jan 2026, at 09:45, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
>=20
> This series implements support for CPU hotplug/unplug on Arm. To achieve =
this,
> several things need to be done:
>=20
> 1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented on Arm64.
> 2. Enabled building of xen-hptool.
> 3. Migration of irqs from dying CPUs implemented.
>=20
> Tested on QEMU.

Do you have a way to validate this on real hardware ?
Doing hotplug/unplug might have side effects (caches, coherency, interrupts=
, etc) that
I would not be completely confident to have validated by only testing this =
in qemu.

Could you explain how you validated this (what kind of tests you did).

I would be interested to know how the system behave in the following cases:
- stopping cpu with guests pinned to specific cores
- stopping a cpu with a guest pinned and only running on that one
- checking with passthrough devices (for irq balancing)

Then a general remark i have is that most of this code (if not all) is alwa=
ys in Xen
even if CONFIG_CPU_HOTPLUG is not activated in xen config which will probab=
ly
generate some dead code. Could we protect some of the code not used when
HOTPLUG is not activated with if (is_enabled(CONFIG_CPU_HOTPLUG)) or
equivalent forms ?

Cheers
Bertrand

>=20
> v4->v5:
> * drop merged patches
> * combine "smp: Move cpu_up/down helpers to common code" with=20
>  "arm/sysctl: Implement cpu hotplug ops"
> * see individual patches
>=20
> v3->v4:
> * add irq migration patches
> * see individual patches
>=20
> v2->v3:
> * add docs
>=20
> v1->v2:
> * see individual patches
>=20
> Mykyta Poturai (5):
>  arm/irq: Keep track of irq affinities
>  arm/irq: Migrate IRQs during CPU up/down operations
>  arm/sysctl: Implement cpu hotplug ops
>  tools: Allow building xen-hptool without CONFIG_MIGRATE
>  docs: Document CPU hotplug
>=20
> SUPPORT.md                       |  1 +
> docs/misc/cpu-hotplug.txt        | 50 +++++++++++++++++++++++++
> tools/libs/guest/Makefile.common |  2 +-
> tools/misc/Makefile              |  2 +-
> xen/arch/arm/Kconfig             |  1 +
> xen/arch/arm/gic-vgic.c          |  2 +
> xen/arch/arm/include/asm/irq.h   |  2 +
> xen/arch/arm/irq.c               | 63 +++++++++++++++++++++++++++++++-
> xen/arch/arm/smp.c               |  9 +++++
> xen/arch/arm/smpboot.c           |  6 +++
> xen/arch/arm/vgic.c              | 14 ++++++-
> xen/arch/ppc/stubs.c             |  4 ++
> xen/arch/riscv/stubs.c           |  5 +++
> xen/arch/x86/Kconfig             |  1 +
> xen/arch/x86/include/asm/smp.h   |  3 --
> xen/arch/x86/smp.c               | 33 ++---------------
> xen/arch/x86/sysctl.c            | 12 ++----
> xen/common/Kconfig               |  3 ++
> xen/common/smp.c                 | 34 +++++++++++++++++
> xen/common/sysctl.c              | 45 +++++++++++++++++++++++
> xen/include/xen/smp.h            |  4 ++
> 21 files changed, 248 insertions(+), 48 deletions(-)
> create mode 100644 docs/misc/cpu-hotplug.txt
>=20
> --=20
> 2.51.2


