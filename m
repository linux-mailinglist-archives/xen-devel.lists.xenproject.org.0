Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKRmK0HOgGkuBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F7CED32
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218897.1527809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcf-0007w8-65; Mon, 02 Feb 2026 16:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218897.1527809; Mon, 02 Feb 2026 16:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwce-0007rW-MR; Mon, 02 Feb 2026 16:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1218897;
 Mon, 02 Feb 2026 16:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZf-0000fY-2J
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:51 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 499c134f-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:44 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:41 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:41 +0000
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
X-Inumbo-ID: 499c134f-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0673Q9MTmiXXfpRNi/WdDz7uMw5aGbiFgS/4twnzt53AYJjsJ23lHkKlVUwk1MDyosnRIpUhCgy/R4lwaV0Ag/FEZedGS+n1OmG4ea52u/YrE/iaQXvQbFRNZNmr+BPwHQW9aK6+sAtYAESbyn4Ea3jv2lFhEf9OUMcIdrEuFn8sVlxJX+QnFKkNY3pA6bm1bXOlkg4fbbB9WpI20uLCcFJ77FkO+gW6+MU7RBp/BYfRoi3yLpD2QwogiW2PuvDEVAwqoyKCWGR176RBarpTbF/wxdTG8en2msnLJtVrJLvri8Bmr344RymM+CUUY+pVDyxczmKQK+inkRMDlPBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiKSNne18UWCuoczCD+vbXEKSctptfC3w3ZIUBjkJqc=;
 b=gQEAXDgW4g5uqz200kuP4hvCeJrNnpeOkAKJxpVmgshbi0eEQSBJ+PsSF6VkvKav/CXmpA/BNW5CrID8RsL4ZjwTYUNAWf8YuBS6NGh8LsNdsjPqnYRHJsotUdD/AXRrVOL4NDhq+xVGh2FeRhCswCJMB+8y779cVKXwUSobBfJeOHWY8dL3CXqRxk1SXkh2PM1cvzp6Pt43f4KWECqZxJU+IIUsxaJOQzyKdbZkVFzWHqzKRhCT/vh3LK/yeNyn+jYYqA8VNjjq9TswzVhHpfx92ir1BXuXiUDXTTHNochXlmBPDxhriuovaIFJUK3Gz9YuRKZges1YLjYjyAW4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiKSNne18UWCuoczCD+vbXEKSctptfC3w3ZIUBjkJqc=;
 b=FXYZ+vd7pXkKRBMnnIbD47GfnVa0e2zqAXXlJsynMMR9cCEKL9IFkCKURwD9HH1JUBmTGya4YlELs7tfJAFA9VkpCwgcDrH/W+v2K5SF1mvBmlOn2Tp/3Od0U/nWI9tsw8uxPXbvQPe81+1FmiF8jBxKnbmpdp0sGjsftjRt3RpKccA9nOh1kUQ1tDjaIzXUHpSg5WXyHl1hbg7NKpgFes7K0Y7KRBLEzDxsSdLjZiVSRqvhiA3ok6wV9cUWiObHAjThUQDmjc71hO6gdqpPmhmSo9LB5XbzaR2YCj/92JSOCn3vFbtGxyZ4ZUSUC223XcICBX9ewWItZQrUJiQVtw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 11/19] arm/its: Add ITS VM and VPE allocation/teardown
Thread-Topic: [RFC PATCH 11/19] arm/its: Add ITS VM and VPE
 allocation/teardown
Thread-Index: AQHclF8JuufVuCvm00eonduwsvAd6g==
Date: Mon, 2 Feb 2026 16:14:41 +0000
Message-ID:
 <1e37aecc73c38669c1f3d41a4a829a5a5b54f836.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11643:EE_
x-ms-office365-filtering-correlation-id: 075950dc-5880-4d24-e1ce-08de62762c00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?apyP8ifJKHpoFZuyuJFQ9rf9KdbTsh0jc2/xV1E+OOcTIAqSWuyk5yXc3f?=
 =?iso-8859-1?Q?BmcjhLfg3y8AuOO1joh82SNXFeu66eLCIVUUYIyoDkfLYAfLVz61sZKuEg?=
 =?iso-8859-1?Q?qDynrGIY7TFlaQrcQkzFNkWnTcNH3nky5MqNYsXHK9X45bywQ+XIKIX2OQ?=
 =?iso-8859-1?Q?QBSbBzeORgF/hz90QJOWWTZDpx/PWb655QSX5kXCXPmeO2Edb2ENpLqFAR?=
 =?iso-8859-1?Q?BZYEB5LmVJeloN1SGnKjUlm5SDhUIJ+ZRq0WvyJoKWowL/ZTI1jWeKYZvP?=
 =?iso-8859-1?Q?/RRPo0dDn/4e6WPpZJwzdF8LnUYfVrJCbZhJc2nO59IECKONZw6VJd9Bue?=
 =?iso-8859-1?Q?gjUhRwWj29KJsKm2HBpxIN2XS1EglQsVOX61MWx+OY4xKP0do8trU87G/w?=
 =?iso-8859-1?Q?rVPpQ6m0kMfdRBE15F6+eMJOpD4sA9hd8rvduezp7S55KXQzARlFN2O2Sv?=
 =?iso-8859-1?Q?UEPcVG9FFU0zUrgCnmdchCfNRUfMSFStj+S2MNyPuosPE+WVHR9QTWTJQM?=
 =?iso-8859-1?Q?RDsEYkqagbN1A+FTIk7/WPVqIQkBDR2est2Pwnal9SaARLP2LNhJpoY7xA?=
 =?iso-8859-1?Q?uRdCiaPcPIauiX4tkkynxrHADyyl3cRkXjFQQhHiwmSquZU0CHhnTchbBL?=
 =?iso-8859-1?Q?ok0sG/LFJZJDWLow+EzT9b2mHq26xkH1jL4RwwGLwenbMgGHqrFkBdPAMs?=
 =?iso-8859-1?Q?IYXtLtw6pG7kerr8kIZta1JCB44ZQBVrmVZrmDZiOUsSQDbF7rdZlDSndS?=
 =?iso-8859-1?Q?3bsO9pkX0XbOkXY0nLwY3d21cyJ3K6uLfv6oYu+OlquSpdAEi89P77/LxE?=
 =?iso-8859-1?Q?XngzrUE8hfEBY4YUygKXGtMvWibrYPv3uP61cDChlOmgh97yY8asdY1m75?=
 =?iso-8859-1?Q?OR4YncyrKa++mhCMODidElE0SbCSvkoSYxRvcJ1MhXJQzN3pTxI6DuXtK4?=
 =?iso-8859-1?Q?QR71mdNzc9Iqg/9/Enn42gc48qmWAaF0asC9+dUhU4D7yKwWoI8hxRtcpN?=
 =?iso-8859-1?Q?G8LUM7jCzqs8JiPMGnTodOyI4JJOgO+cjBwhSasECefmBkQTWlAoPzZ0wb?=
 =?iso-8859-1?Q?3vs6HJg1xk+AcREK1I2UJeXZQ7jEhL+AxY+tV2t4TVMriDh17/w7lZMfmC?=
 =?iso-8859-1?Q?ljrYj1MaWclZBawsxO3wKPBli0CLfaz0jTlc/0WDdg+yaaJdTs6nJqGlHc?=
 =?iso-8859-1?Q?/DTMMCwAFB9YyEJYPvmkrI6ErMcgaCFjqh8wYwWHcIPEY/Y7qQVNxyTZT5?=
 =?iso-8859-1?Q?GdIqObzOOvt5bgLO002e8l7mPpJi7y8QINinsQAYXqo9yOgFh0TbyOgZxk?=
 =?iso-8859-1?Q?64cFziItp8UlfPDs8TXKP20iYsw/1sXMCE5zAGwS2QI2SXcUZjqYioUYNS?=
 =?iso-8859-1?Q?fUrew9Exw9IQcG3TEpT4R/oAIEKZyb6ug6zcAoguXIVeIlGJbu9u9Lhd0+?=
 =?iso-8859-1?Q?9e1f2us231yDjhD9yy3BfNtnzJBfVetQiq99BCbgeMkFpYvjMdnFNycJsZ?=
 =?iso-8859-1?Q?gy2epFSURjOzIy64DAyVxq2FoUOL6DVBBq5QtKJr7waev6MxIlgoKR93ID?=
 =?iso-8859-1?Q?TBFp/CyZpI4QLJDQL0k9nM7Pl+UrBmGR0Aklh+uj54CMiv2imGiFJ/Zcuz?=
 =?iso-8859-1?Q?aiNZVAM4FICaYwkWJ6RoRp3UCgdhqQbcCOfpEvzTTKEHDiRsaWWj8u+9ro?=
 =?iso-8859-1?Q?xRWhwy6Fe/MaUR9bSS8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6W+lyePzZevrleYjf5ye+6fFTikxtpVxoMUT8Sy8ozEq9hZE7pmQwRJZ+C?=
 =?iso-8859-1?Q?2/kNA5yPGt9T8u48Mf+v5Vk35DXcdVpbCt8+kBy0urTVO0M2jA4bD14F2v?=
 =?iso-8859-1?Q?p9yaZohR99esFhfqHDS7e6oCQeKW97OofZDAh4ZCOR+GCcyKfgGpAa4zzR?=
 =?iso-8859-1?Q?K16FGcGeKrWWAXQzD0cExREWjAAqFNVQg6t1nCT5bl2AEv6slvu6iBTWKW?=
 =?iso-8859-1?Q?nc/ukt7UiH8/CzMe7KPjxnB4zFYIHUWT2erSNdKIaRbwJ93/ZgnS3/pCqx?=
 =?iso-8859-1?Q?T6zxuaEOcmc+TvjArzta1QB56HTTdO/GpJceRRwmEZGcc9IwB7/0PWZrGu?=
 =?iso-8859-1?Q?QWLfH0s5KMop+8E5prstKaTpvxD4ObsB6YQSLXh6SFeCfY58k0Hu8hULik?=
 =?iso-8859-1?Q?AyG4xQ0nKk4bP2COXHNFGrECtPVAaQvGCS/k4lXNIm7JIDkwzMsXWBIE5Y?=
 =?iso-8859-1?Q?+3mpNMMKuotDA2gpArf0AEABOonc3v1p+Ra4nnPlzsewD1SsCDCXxp/K6E?=
 =?iso-8859-1?Q?GVo2OQXyTnousOV+uuUEqtnU65q4P0Pd8j6GU/7n/5XgoymAzNDqOeKEKP?=
 =?iso-8859-1?Q?4fawjUITsHayqrZaZFvNTn9PyRDFWc/WSI/1Z9oMD04Fxb9Nni+FQREnUT?=
 =?iso-8859-1?Q?1IQ5zrZB+uErWP1Oj/R76Gg7NsbGcNKwC74QDxmkBlAhqmP6eiQyFPn2OF?=
 =?iso-8859-1?Q?KgIAawpsqBz57w1U3niQ3S19p6xo9vyYsSSOkNGgnOvypgvNBJwiEmAXc1?=
 =?iso-8859-1?Q?XKMxI1dE5QYas2rGk8x5C3ahH+j4WhGpjuKQufOEbzp3xztougXyqC90cN?=
 =?iso-8859-1?Q?h4Xoix1ZDiA4gXkhuR9I5AuNpbp01j28jASpf8zkE3PfjML2zezinZIWVn?=
 =?iso-8859-1?Q?M8n5ET8h+kY95E/zs44Tgbay92E2ECOLXfL47ngUDu6NT1+ihcoZ5rcYTH?=
 =?iso-8859-1?Q?PtjcWRVyy/j9/q06awROzX5rNTx2TW9SxLRD4WUqchp1eQsr9Ku+gO9RoM?=
 =?iso-8859-1?Q?+5PLoDDsqtGeVKpvN3t8FxrFqkOMqSSJUuscNlIViUHW1mVra3lIGcG9XH?=
 =?iso-8859-1?Q?hLU52L0BHjFs7ORQLdlB6w86radmP5UDwm8jnxZvw0nq6IjIm+/ns5Hor3?=
 =?iso-8859-1?Q?C4g0Q2LEI+CVUFPEJezr7jp7sfrAQBl3m6FLllzrZ5/yHug3dLHj4G2C0G?=
 =?iso-8859-1?Q?HuGrH5tNRYnqDLNp8ZNdf+6MazXmSQySy7nseGVbNTbXp1xBFj+7yBnCmt?=
 =?iso-8859-1?Q?/zaXdVFL4yX5Q77DrSGePmVyuird9Rbnvx+FvUf7tNxRAXnRrpXFF0B29w?=
 =?iso-8859-1?Q?IUZpWZVTrolwpnrn0P1k2prG8Q/+fl3OWScQGcANKDgKvujuf5PWjutgv8?=
 =?iso-8859-1?Q?upqyTV1GTjBjz0Sp83EkZjLP/UN2pSOB1uNSYQtfQ5xnL69PwXrTduKhAR?=
 =?iso-8859-1?Q?bBhPaXMIAx1TmrFmdA01CY5gVzpofDUxO3vTQ/CNBcX+2UXEbr0qhsjnep?=
 =?iso-8859-1?Q?70/cnrANOvfwidOfyZPdzAzGft9cGCmsiZjk/zxe3QzCv+no0VoWdhbi0b?=
 =?iso-8859-1?Q?ZFj4xEMCiDf4hbhYC/AnsfWRBhi81vNWTp61+Mi2PlqHmEZHHpwU0VOSz3?=
 =?iso-8859-1?Q?qyG1LjbotH504B5L7mcf6/XUdHR6OqV9aa3j6kbJEEr/1jPCX2M3GCo09X?=
 =?iso-8859-1?Q?fuofnaikFIwiO9Cw6CEpB0LEkZMJs8tt5jlYUCUCS2cxrIgqOrcGIgr0yf?=
 =?iso-8859-1?Q?jNWoxwM9nbX1+HbdT0f3HrVyibM7hEzXtFY7mZpEZFpyfwl1++wBRSnTzG?=
 =?iso-8859-1?Q?3KrxL3Xo/V2H5iLo+gum3Lac4W00Rrk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075950dc-5880-4d24-e1ce-08de62762c00
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:41.6618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7u24g0Ke3qQoGWBInZ4xP5waUsn/dG/0q2QQBMhra+iFQtcTiGyIUe2dmQgP49LKy/JPqVPl989KEvE5bwung==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11643
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 113F7CED32
X-Rspamd-Action: no action

Do necessary allocations for GICv4 VLPI injection.
When creating a domain allocate its_vm and property tables.
For each VCPU allocate a VPe with a unique vpe id and separate pending tabl=
e.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3-its.c             | 157 ++++++++++++----
 xen/arch/arm/gic-v3-lpi.c             |  61 +++++-
 xen/arch/arm/gic-v3.c                 |  18 ++
 xen/arch/arm/gic-v4-its.c             | 259 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic_v3_its.h |  17 ++
 xen/arch/arm/include/asm/gic_v4_its.h |   1 +
 xen/arch/arm/include/asm/vgic.h       |   3 +
 xen/arch/arm/vgic.c                   |  25 ++-
 8 files changed, 496 insertions(+), 45 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 2328595a85..fb1d2709be 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -31,6 +31,8 @@
 LIST_HEAD(host_its_list);
=20
=20
+unsigned int nvpeid =3D 16;
+
 /*
  * It is unlikely that a platform implements ITSes with different quirks,
  * so assume they all share the same.
@@ -228,7 +230,7 @@ int gicv3_its_wait_commands(struct host_its *hw_its)
     return -ETIMEDOUT;
 }
=20
-static uint64_t encode_rdbase(struct host_its *hw_its, unsigned int cpu,
+uint64_t encode_rdbase(struct host_its *hw_its, unsigned int cpu,
                               uint64_t reg)
 {
     reg &=3D ~GENMASK(51, 16);
@@ -443,6 +445,54 @@ struct its_baser *its_get_baser(struct host_its *hw_it=
s, uint32_t type)
     return NULL;
 }
=20
+bool its_alloc_table_entry(struct its_baser *baser, uint32_t id)
+{
+    uint64_t reg =3D baser->val;
+    bool indirect =3D reg & GITS_BASER_INDIRECT;
+    unsigned int idx;
+    __le64 *table;
+    unsigned int entry_size =3D GITS_BASER_ENTRY_SIZE(reg);
+
+    /* Don't allow id that exceeds single, flat table limit */
+    if ( !indirect )
+        return (id < (baser->table_size / entry_size));
+
+    /* Compute 1st level table index & check if that exceeds table limit *=
/
+    idx =3D id / (baser->pagesz / entry_size);
+    if ( idx >=3D (baser->pagesz / GITS_LVL1_ENTRY_SIZE) )
+        return false;
+
+    table =3D baser->base;
+
+    /* Allocate memory for 2nd level table */
+    if (!table[idx])
+    {
+        unsigned int page_size =3D baser->pagesz;
+        void *buffer;
+
+        buffer =3D alloc_xenheap_pages(get_order_from_bytes(page_size),
+                                     gicv3_its_get_memflags());
+        if ( !buffer )
+            return -ENOMEM;
+
+        /* Flush Lvl2 table to PoC if hw doesn't support coherency */
+        if ( gicv3_its_get_cacheability() <=3D GIC_BASER_CACHE_nC )
+            clean_and_invalidate_dcache_va_range(buffer, page_size);
+
+        table[idx] =3D cpu_to_le64(virt_to_maddr(buffer) | GITS_VALID_BIT)=
;
+
+        /* Flush Lvl1 entry to PoC if hw doesn't support coherency */
+        if ( gicv3_its_get_cacheability() <=3D GIC_BASER_CACHE_nC )
+            clean_and_invalidate_dcache_va_range(table + idx,
+                                                 GITS_LVL1_ENTRY_SIZE);
+
+        /* Ensure updated table contents are visible to ITS hardware */
+        dsb(sy);
+    }
+
+    return true;
+}
+
 static int its_map_baser(void __iomem *basereg, uint64_t regc,
                          unsigned int nr_items, struct its_baser *baser)
 {
@@ -737,13 +787,75 @@ static int gicv3_its_map_host_events(struct host_its =
*its,
             return ret;
     }
=20
-    /* TODO: Consider using INVALL here. Didn't work on the model, though.=
 */
+    return 0;
+}
+
+static bool its_alloc_device_table(struct host_its *hw_its, uint32_t dev_i=
d)
+{
+    struct its_baser *baser;
+
+    baser =3D its_get_baser(hw_its, GITS_BASER_TYPE_DEVICE);
+    if ( !baser )
+        return false;
+
+    return its_alloc_table_entry(baser, dev_id);
+}
+
+struct its_device *its_create_device(struct host_its *hw_its,
+                                     uint32_t host_devid, uint64_t nr_even=
ts)
+{
+    void *itt_addr =3D NULL;
+    struct its_device *dev =3D NULL;
+    int ret;
+
+    /* Sanitise the provided hardware values against the host ITS. */
+    if ( host_devid >=3D BIT(hw_its->devid_bits, UL) )
+        return NULL;
+
+    dev =3D xzalloc(struct its_device);
+    if ( !dev )
+        return NULL;
+
+    /* An Interrupt Translation Table needs to be 256-byte aligned. */
+    dev->itt_order =3D get_order_from_bytes(nr_events * hw_its->itte_size)=
;
+    itt_addr =3D alloc_xenheap_pages(dev->itt_order, gicv3_its_get_memflag=
s());
+    if ( !itt_addr )
+        goto fail_dev;
+
+    clean_and_invalidate_dcache_va_range(itt_addr,
+                                         nr_events * hw_its->itte_size);
+
=20
-    ret =3D its_send_cmd_sync(its, 0);
+    if ( !its_alloc_device_table(hw_its, host_devid) )
+        goto fail_itt;
+
+    ret =3D its_send_cmd_mapd(hw_its, host_devid, max(fls(nr_events - 1), =
1U),
+                            virt_to_maddr(itt_addr), true);
     if ( ret )
-        return ret;
+        goto fail_itt;
=20
-    return gicv3_its_wait_commands(its);
+    dev->itt_addr =3D itt_addr;
+    dev->hw_its =3D hw_its;
+    dev->host_devid =3D host_devid;
+    dev->eventids =3D nr_events;
+
+    return dev;
+
+fail_itt:
+    free_xenheap_pages(itt_addr, dev->itt_order);
+fail_dev:
+    xfree(dev);
+
+    return NULL;
+}
+
+static void its_free_device(struct its_device *dev)
+{
+    xfree(dev->host_lpi_blocks);
+    xfree(dev->itt_addr);
+    if ( dev->pend_irqs )
+        xfree(dev->pend_irqs);
+    xfree(dev);
 }
=20
 /*
@@ -758,12 +870,10 @@ int gicv3_its_map_guest_device(struct domain *d,
                                paddr_t guest_doorbell, uint32_t guest_devi=
d,
                                uint64_t nr_events, bool valid)
 {
-    void *itt_addr =3D NULL;
     struct host_its *hw_its;
     struct its_device *dev =3D NULL;
     struct rb_node **new =3D &d->arch.vgic.its_devices.rb_node, *parent =
=3D NULL;
     int i, ret =3D -ENOENT;      /* "i" must be signed to check for >=3D 0=
 below. */
-    unsigned int order;
=20
     hw_its =3D gicv3_its_find_by_doorbell(host_doorbell);
     if ( !hw_its )
@@ -823,23 +933,12 @@ int gicv3_its_map_guest_device(struct domain *d,
     if ( !valid )
         goto out_unlock;
=20
-    ret =3D -ENOMEM;
-
-    /* An Interrupt Translation Table needs to be 256-byte aligned. */
-    order =3D get_order_from_bytes(max(nr_events * hw_its->itte_size, 256U=
L));
-    itt_addr =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
-    if ( !itt_addr )
-        goto out_unlock;
-
-    memset(itt_addr, 0, PAGE_SIZE << order);
-
-    clean_and_invalidate_dcache_va_range(itt_addr,
-                                         nr_events * hw_its->itte_size);
-
-    dev =3D xzalloc(struct its_device);
+    dev =3D its_create_device(hw_its, host_devid, nr_events);
     if ( !dev )
         goto out_unlock;
=20
+    ret =3D -ENOMEM;
+
     /*
      * Allocate the pending_irqs for each virtual LPI. They will be put
      * into the domain's radix tree upon the guest's MAPTI command.
@@ -860,14 +959,6 @@ int gicv3_its_map_guest_device(struct domain *d,
     if ( !dev->host_lpi_blocks )
         goto out_unlock;
=20
-    ret =3D its_send_cmd_mapd(hw_its, host_devid, fls(nr_events - 1),
-                            virt_to_maddr(itt_addr), true);
-    if ( ret )
-        goto out_unlock;
-
-    dev->itt_addr =3D itt_addr;
-    dev->itt_order =3D order;
-    dev->hw_its =3D hw_its;
     dev->guest_doorbell =3D guest_doorbell;
     dev->guest_devid =3D guest_devid;
     dev->host_devid =3D host_devid;
@@ -920,13 +1011,7 @@ out_unlock:
=20
 out:
     if ( dev )
-    {
-        xfree(dev->pend_irqs);
-        xfree(dev->host_lpi_blocks);
-    }
-    if ( itt_addr )
-        free_xenheap_pages(itt_addr, order);
-    xfree(dev);
+        its_free_device(dev);
=20
     return ret;
 }
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index c029d5d7a4..3c2649b695 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -58,6 +58,7 @@ static DEFINE_PER_CPU(struct lpi_redist_data, lpi_redist)=
;
=20
 #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
 #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
+uint32_t lpi_id_bits;
=20
 static union host_lpi *gic_get_host_lpi(uint32_t plpi)
 {
@@ -202,14 +203,11 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi, i=
nt domain_id,
     write_u64_atomic(&hlpip->data, hlpi.data);
 }
=20
-static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
+struct page_info *lpi_allocate_pendtable(void)
 {
     void *pendtable;
     unsigned int order;
=20
-    if ( per_cpu(lpi_redist, cpu).pending_table )
-        return -EBUSY;
-
     /*
      * The pending table holds one bit per LPI and even covers bits for
      * interrupt IDs below 8192, so we allocate the full range.
@@ -219,20 +217,34 @@ static int gicv3_lpi_allocate_pendtable(unsigned int =
cpu)
     order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (uns=
igned long)SZ_64K));
     pendtable =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
     if ( !pendtable )
-        return -ENOMEM;
+        return NULL;
=20
     memset(pendtable, 0, PAGE_SIZE << order);
     /* Make sure the physical address can be encoded in the register. */
     if ( virt_to_maddr(pendtable) & ~GENMASK(51, 16) )
     {
         free_xenheap_pages(pendtable, order);
-        return -ERANGE;
+        return NULL;
     }
     clean_and_invalidate_dcache_va_range(pendtable,
                                          lpi_data.max_host_lpi_ids / 8);
=20
-    per_cpu(lpi_redist, cpu).pending_table =3D pendtable;
+    return virt_to_page(pendtable);
+}
+
+static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
+{
+    struct page_info *pendtable;
+
+    if ( per_cpu(lpi_redist, cpu).pending_table )
+        return -EBUSY;
+
+    pendtable =3D lpi_allocate_pendtable();
+    if ( !pendtable )
+        return -EINVAL;
=20
+    per_cpu(lpi_redist, cpu).pending_table =3D page_to_virt(pendtable);
+=20
     return 0;
 }
=20
@@ -274,6 +286,38 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist=
_base)
     return 0;
 }
=20
+void *lpi_allocate_proptable(void)
+{
+    void *table;
+    int order;
+
+    /* The property table holds one byte per LPI. */
+    order =3D get_order_from_bytes(lpi_data.max_host_lpi_ids);
+    table =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    if ( !table )
+        return NULL;
+
+    /* Make sure the physical address can be encoded in the register. */
+    if ( (virt_to_maddr(table) & ~GENMASK(51, 12)) )
+    {
+        free_xenheap_pages(table, order);
+        return NULL;
+    }
+    memset(table, GIC_PRI_IRQ | LPI_PROP_RES1, MAX_NR_HOST_LPIS);
+    clean_and_invalidate_dcache_va_range(table, MAX_NR_HOST_LPIS);
+
+    return table;
+}
+
+void lpi_free_proptable(void *vproptable)
+{
+    int order;
+
+    /* The property table holds one byte per LPI. */
+    order =3D get_order_from_bytes(lpi_data.max_host_lpi_ids);
+    free_xenheap_pages(vproptable, order);
+}
+
 /*
  * Tell a redistributor about the (shared) property table, allocating one
  * if not already done.
@@ -314,7 +358,8 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist=
_base)
     }
=20
     /* Encode the number of bits needed, minus one */
-    reg |=3D fls(lpi_data.max_host_lpi_ids - 1) - 1;
+    lpi_id_bits =3D fls(lpi_data.max_host_lpi_ids - 1);
+    reg |=3D lpi_id_bits - 1;
=20
     reg |=3D virt_to_maddr(lpi_data.lpi_property);
=20
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 14852d18c2..d4af332b0e 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -2083,6 +2083,22 @@ static bool gic_dist_supports_lpis(void)
     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
 }
=20
+#ifdef CONFIG_GICV4
+static void __init gicv4_init(void)
+{
+        gicv3_info.hw_version =3D GIC_V4;
+
+
+    gicv4_its_vpeid_allocator_init();
+
+}
+#else
+static void __init gicv4_init(void)
+{
+    ASSERT_UNREACHABLE();
+}
+#endif
+
 /* Set up the GIC */
 static int __init gicv3_init(void)
 {
@@ -2157,6 +2173,8 @@ static int __init gicv3_init(void)
=20
     gicv3_hyp_init();
=20
+    if ( gic_is_gicv4() )
+        gicv4_init();
 out:
     spin_unlock(&gicv3.lock);
=20
diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
index 358d0bffb9..fac3b44a94 100644
--- a/xen/arch/arm/gic-v4-its.c
+++ b/xen/arch/arm/gic-v4-its.c
@@ -27,6 +27,83 @@
 #include <asm/vgic.h>
=20
=20
+/*
+ * VPE ID is at most 16 bits.
+ * Using a bitmap here limits us to 65536 concurrent VPEs.
+ */
+static unsigned long *vpeid_mask;
+
+static spinlock_t vpeid_alloc_lock =3D SPIN_LOCK_UNLOCKED;
+
+void __init gicv4_its_vpeid_allocator_init(void)
+{
+    /* Allocate space for vpeid_mask based on MAX_VPEID */
+    vpeid_mask =3D xzalloc_array(unsigned long, BITS_TO_LONGS(MAX_VPEID));
+
+    if ( !vpeid_mask )
+        panic("Could not allocate VPEID bitmap space\n");
+}
+
+static int __init its_alloc_vpeid(struct its_vpe *vpe)
+{
+    int id;
+
+    spin_lock(&vpeid_alloc_lock);
+
+    id =3D find_first_zero_bit(vpeid_mask, MAX_VPEID);
+
+    if ( id =3D=3D MAX_VPEID )
+    {
+        id =3D -EBUSY;
+        printk(XENLOG_ERR "VPEID pool exhausted\n");
+        goto out;
+    }
+
+    set_bit(id, vpeid_mask);
+
+out:
+    spin_unlock(&vpeid_alloc_lock);
+
+    return id;
+}
+
+static void __init its_free_vpeid(uint32_t vpe_id)
+{
+    spin_lock(&vpeid_alloc_lock);
+
+    clear_bit(vpe_id, vpeid_mask);
+
+    spin_unlock(&vpeid_alloc_lock);
+}
+
+static bool __init its_alloc_vpe_entry(uint32_t vpe_id)
+{
+    struct host_its *hw_its;
+
+    /*
+     * Make sure the L2 tables are allocated on *all* v4 ITSs. We
+     * could try and only do it on ITSs corresponding to devices
+     * that have interrupts targeted at this VPE, but the
+     * complexity becomes crazy.
+     */
+    list_for_each_entry(hw_its, &host_its_list, entry)
+    {
+        struct its_baser *baser;
+
+        if ( !hw_its->is_v4 )
+            continue;
+
+        baser =3D its_get_baser(hw_its, GITS_BASER_TYPE_VCPU);
+        if ( !baser )
+            return false;
+
+        if ( !its_alloc_table_entry(baser, vpe_id) )
+            return false;
+    }
+
+    return true;
+}
+
 static int its_send_cmd_vsync(struct host_its *its, uint16_t vpeid)
 {
     uint64_t cmd[4];
@@ -39,6 +116,188 @@ static int its_send_cmd_vsync(struct host_its *its, ui=
nt16_t vpeid)
     return its_send_command(its, cmd);
 }
=20
+static int its_send_cmd_vmapp(struct host_its *its, struct its_vpe *vpe,
+                              bool valid)
+{
+    uint64_t cmd[4];
+    uint16_t vpeid =3D vpe->vpe_id;
+    uint64_t vpt_addr;
+    int ret;
+
+    cmd[0] =3D GITS_CMD_VMAPP;
+    cmd[1] =3D (uint64_t)vpeid << 32;
+    cmd[2] =3D valid ? GITS_VALID_BIT : 0;
+
+    /* Unmap command */
+    if ( !valid )
+        goto out;
+
+    /* Target redistributor */
+    cmd[2] |=3D encode_rdbase(its, vpe->col_idx, 0x0);
+    vpt_addr =3D virt_to_maddr(vpe->vpendtable);
+    cmd[3] =3D (vpt_addr & GENMASK(51, 16)) |
+             ((HOST_LPIS_NRBITS - 1) & GENMASK(4, 0));
+
+ out:
+    ret =3D its_send_command(its, cmd);
+
+    return ret;
+}
+
+static int its_send_cmd_vinvall(struct host_its *its, struct its_vpe *vpe)
+{
+    uint64_t cmd[4];
+    uint16_t vpeid =3D vpe->vpe_id;
+
+    cmd[0] =3D GITS_CMD_VINVALL;
+    cmd[1] =3D (uint64_t)vpeid << 32;
+    cmd[2] =3D 0x00;
+    cmd[3] =3D 0x00;
+
+    return its_send_command(its, cmd);
+}
+
+static int its_map_vpe(struct host_its *its, struct its_vpe *vpe)
+{
+    int ret;
+
+    /*
+     * VMAPP command maps the vPE to the target RDbase, including an
+     * associated virtual LPI Pending table.
+     */
+    ret =3D its_send_cmd_vmapp(its, vpe, true);
+    if ( ret )
+        return ret;
+
+    ret =3D its_send_cmd_vinvall(its, vpe);
+    if ( ret )
+        return ret;
+
+    ret =3D its_send_cmd_vsync(its, vpe->vpe_id);
+    if ( ret )
+        return ret;
+
+    return 0;
+}
+static int __init its_vpe_init(struct its_vpe *vpe)
+{
+    int vpe_id, rc =3D -ENOMEM;
+    struct page_info *vpendtable;
+    struct host_its *hw_its;
+
+    /* Allocate vpe id */
+    vpe_id =3D its_alloc_vpeid(vpe);
+    if ( vpe_id < 0 )
+        return rc;
+
+    /* Allocate VPT */
+    vpendtable =3D lpi_allocate_pendtable();
+
+    if ( !vpendtable )
+        goto fail_vpt;
+
+    if ( !its_alloc_vpe_entry(vpe_id) )
+        goto fail_entry;
+
+    rwlock_init(&vpe->lock);
+    vpe->vpe_id =3D vpe_id;
+    vpe->vpendtable =3D page_to_virt(vpendtable);
+    /*
+     * We eagerly inform all the v4 ITS and map vPE to the first
+     * possible CPU
+     */
+    vpe->col_idx =3D cpumask_first(&cpu_online_map);
+    list_for_each_entry(hw_its, &host_its_list, entry)
+    {
+        if ( !hw_its->is_v4 )
+            continue;
+
+        if ( its_map_vpe(hw_its, vpe) )
+            goto fail_entry;
+    }
+
+    return 0;
+
+ fail_entry:
+    xfree(page_to_virt(vpendtable));
+ fail_vpt:
+    its_free_vpeid(vpe_id);
+
+    return rc;
+}
+
+static void __init its_vpe_teardown(struct its_vpe *vpe)
+{
+    unsigned int order;
+
+    order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (uns=
igned long)SZ_64K));
+    its_free_vpeid(vpe->vpe_id);
+    free_xenheap_pages(vpe->vpendtable, order);
+    xfree(vpe);
+}
+
+int vgic_v4_its_vm_init(struct domain *d)
+{
+    unsigned int nr_vcpus =3D d->max_vcpus;
+    int ret =3D -ENOMEM;
+
+    if ( !gicv3_its_host_has_its() )
+        return 0;
+
+    d->arch.vgic.its_vm =3D xzalloc(struct its_vm);
+    if ( !d->arch.vgic.its_vm )
+        return ret;
+
+    d->arch.vgic.its_vm->vpes =3D xzalloc_array(struct its_vpe *, nr_vcpus=
);
+    if ( !d->arch.vgic.its_vm->vpes )
+        goto fail_vpes;
+    d->arch.vgic.its_vm->nr_vpes =3D nr_vcpus;
+
+    d->arch.vgic.its_vm->vproptable =3D lpi_allocate_proptable();
+    if ( !d->arch.vgic.its_vm->vproptable )
+        goto fail_vprop;
+
+    return 0;
+
+fail_vprop:
+    xfree(d->arch.vgic.its_vm->vpes);
+ fail_vpes:
+    xfree(d->arch.vgic.its_vm);
+
+    return ret;
+}
+
+void vgic_v4_free_its_vm(struct domain *d)
+{
+    struct its_vm *its_vm =3D d->arch.vgic.its_vm;
+    if ( its_vm->vpes )
+        xfree(its_vm->vpes);
+    if ( its_vm->vproptable )
+        lpi_free_proptable(its_vm);
+}
+
+int vgic_v4_its_vpe_init(struct vcpu *vcpu)
+{
+    int ret;
+    struct its_vm *its_vm =3D vcpu->domain->arch.vgic.its_vm;
+    unsigned int vcpuid =3D vcpu->vcpu_id;
+
+    vcpu->arch.vgic.its_vpe =3D xzalloc(struct its_vpe);
+    if ( !vcpu->arch.vgic.its_vpe )
+        return -ENOMEM;
+
+    its_vm->vpes[vcpuid] =3D vcpu->arch.vgic.its_vpe;
+    vcpu->arch.vgic.its_vpe->its_vm =3D its_vm;
+
+    ret =3D its_vpe_init(vcpu->arch.vgic.its_vpe);
+    if ( ret )
+    {
+        its_vpe_teardown(vcpu->arch.vgic.its_vpe);
+        return ret;
+    }
+    return 0;
+}
+
 static int its_send_cmd_vmapti(struct host_its *its, struct its_device *de=
v,
                                uint32_t eventid)
 {
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index bd2696f354..411beb81c8 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -77,6 +77,7 @@
 #define GITS_BASER_ENTRY_SIZE_SHIFT     48
 #define GITS_BASER_ENTRY_SIZE(reg)                                       \
                         ((((reg) >> GITS_BASER_ENTRY_SIZE_SHIFT) & 0x1f) +=
 1)
+#define GITS_LVL1_ENTRY_SIZE            8UL
 #define GITS_BASER_SHAREABILITY_SHIFT   10
 #define GITS_BASER_PAGE_SIZE_SHIFT      8
 #define GITS_BASER_SIZE_MASK            0xff
@@ -117,9 +118,19 @@
 /* We allocate LPIs on the hosts in chunks of 32 to reduce handling overhe=
ad. */
 #define LPI_BLOCK                       32U
=20
+extern unsigned int nvpeid;
+/* The maximum number of VPEID bits supported by VLPI commands */
+#define ITS_MAX_VPEID_BITS      nvpeid
+#define MAX_VPEID               (1UL << ITS_MAX_VPEID_BITS)
+
 #ifdef CONFIG_GICV4
 #include <asm/gic_v4_its.h>
 #endif
+
+extern uint32_t lpi_id_bits;
+#define HOST_LPIS_NRBITS   lpi_id_bits
+#define MAX_HOST_LPIS      BIT(lpi_id_bits, UL)
+
 /*
  * Describes a device which is using the ITS and is used by a guest.
  * Since device IDs are per ITS (in contrast to vLPIs, which are per
@@ -169,6 +180,7 @@ struct host_its {
     void *cmd_buf;
     unsigned int flags;
     struct its_baser tables[GITS_BASER_NR_REGS];
+    bool is_v4;
 };
=20
 /* Map a collection for this host CPU to each host ITS. */
@@ -273,8 +285,13 @@ struct pending_irq *gicv3_assign_guest_event(struct do=
main *d,
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
 struct its_baser *its_get_baser(struct host_its *hw_its, uint32_t type);
+bool its_alloc_table_entry(struct its_baser *baser, uint32_t id);
+struct page_info *lpi_allocate_pendtable(void);
+void *lpi_allocate_proptable(void);
+void lpi_free_proptable(void *vproptable);
 void lpi_write_config(uint8_t *prop_table, uint32_t lpi, uint8_t clr,
                       uint8_t set);
+uint64_t encode_rdbase(struct host_its *hw_its, unsigned int cpu, uint64_t=
 reg);
 int its_send_command(struct host_its *hw_its, const void *its_cmd);
=20
 struct its_device *get_its_device(struct domain *d, paddr_t vdoorbell,
diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include/a=
sm/gic_v4_its.h
index 722247ec60..fb0ef37bbe 100644
--- a/xen/arch/arm/include/asm/gic_v4_its.h
+++ b/xen/arch/arm/include/asm/gic_v4_its.h
@@ -49,6 +49,7 @@ struct event_vlpi_map {
     unsigned int            nr_vlpis;
 };
=20
+void gicv4_its_vpeid_allocator_init(void);
 #endif
=20
 /*
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index f12d736808..580310fec4 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -414,6 +414,9 @@ bool gic_is_gicv4(void);
 #define gic_is_gicv4() (false)
 #endif
=20
+int vgic_v4_its_vm_init(struct domain *d);
+void vgic_v4_free_its_vm(struct domain *d);
+int vgic_v4_its_vpe_init(struct vcpu *vcpu);
 #endif /* !CONFIG_NEW_VGIC */
=20
 /*** Common VGIC functions used by Xen arch code ****/
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 0da8c1a425..6baf870ad5 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -22,6 +22,7 @@
=20
 #include <asm/mmio.h>
 #include <asm/gic.h>
+#include <asm/gic_v3_its.h>
 #include <asm/vgic.h>
=20
=20
@@ -329,6 +330,15 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
     for ( i =3D 0; i < NR_GIC_SGI; i++ )
         set_bit(i, d->arch.vgic.allocated_irqs);
=20
+    if ( gic_is_gicv4() )
+    {
+        ret =3D vgic_v4_its_vm_init(d);
+        if ( ret )
+        {
+            printk(XENLOG_ERR "GICv4 its vm allocation failed\n");
+            return ret;
+        }
+    }
     return 0;
 }
=20
@@ -366,11 +376,14 @@ void domain_vgic_free(struct domain *d)
 #endif
     xfree(d->arch.vgic.pending_irqs);
     xfree(d->arch.vgic.allocated_irqs);
+
+    if ( gic_is_gicv4() )
+        vgic_v4_free_its_vm(d);
 }
=20
 int vcpu_vgic_init(struct vcpu *v)
 {
-    int i;
+    int i, ret;
=20
     v->arch.vgic.private_irqs =3D xzalloc(struct vgic_irq_rank);
     if ( v->arch.vgic.private_irqs =3D=3D NULL )
@@ -389,6 +402,16 @@ int vcpu_vgic_init(struct vcpu *v)
     INIT_LIST_HEAD(&v->arch.vgic.lr_pending);
     spin_lock_init(&v->arch.vgic.lock);
=20
+    if ( gic_is_gicv4() && gicv3_its_host_has_its())
+    {
+        ret =3D vgic_v4_its_vpe_init(v);
+        if ( ret )
+        {
+            printk(XENLOG_ERR "GICv4 its vpe allocation failed\n");
+            return ret;
+        }
+    }
+
     return 0;
 }
=20
--=20
2.51.2

