Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F0FCF835B
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 13:04:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196062.1513922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd5nT-0000Sj-Ql; Tue, 06 Jan 2026 12:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196062.1513922; Tue, 06 Jan 2026 12:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd5nT-0000QV-Ny; Tue, 06 Jan 2026 12:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1196062;
 Tue, 06 Jan 2026 12:04:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vd5nS-0000QP-2W
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 12:04:22 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d190c7c8-eaf7-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 13:04:15 +0100 (CET)
Received: from AS8PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:20b:312::14)
 by AM8PR08MB5588.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 12:04:10 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:312:cafe::65) by AS8PR04CA0039.outlook.office365.com
 (2603:10a6:20b:312::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.6 via Frontend Transport; Tue, 6
 Jan 2026 12:04:07 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Tue, 6 Jan 2026 12:04:09 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 by AS8PR08MB8221.eurprd08.prod.outlook.com (2603:10a6:20b:524::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 12:03:04 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b]) by DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 12:03:03 +0000
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
X-Inumbo-ID: d190c7c8-eaf7-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eXEBGZ2eGIvlo0f7TNX+vysPxEmtLA7VQoXzUP9Ndo8Q1rSC2SLJuoJkcty+A3Ut1jL/XtIiF/g/W2idVVn3vG09j1MiKuKrcUiMaW0R2wUt/wtZGFfC/VbS3JMMmPrMbiveIzvv7u364jGQZB+A+FXiH/tsr9GynrwlGYkOm6w88+3ev+SHP12ybvlJazmm2LmoLhIvmKykkGP413XCUNnUis05buJLGM4a6lQsjxLKZW5iVW0yjZdw6pMRFg0Q3kCi+1Bx2lCT3HlbvsXk8EnTUEEj2PQkddLa56CsDcCiFJfQUW8WiR8w+ySdvykAY7JgkHXOhfcvU1vOkyLz4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLDwNF5wRePAW3G3MXfAr7V6jc585+UVl/pYwIObaSk=;
 b=rNd/ojOxcffYFPwFAZG0RSMJ/d50z2T/sbIb2cUCJtX+z6A9p8eZuE3IiDo7BKg3RacikvEHcz4Xj/zwJF9D+3XX16vik7XA5TdESlAsCHKjpq0xFy6vrSafoDOOUelI/tyIULSX8oWQMIYGI2prvOHOf2Pn/4q41kvgoJ1QAGYH0GCuXC6rnLUfAFCcOn9kyq3KNEUDmO05MYqG6H7hEvbmVspLgqkuz9y5tQt5h48soW86pOp6A+awS4vxHvcOiaGDBLM9sJtgRZ8xoVNw64jrqlvtEbw3QadT6vBpbS+YqJhcP7+eb5T8LbpvND5VWndsohy1ChLcPVWV4KB47w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLDwNF5wRePAW3G3MXfAr7V6jc585+UVl/pYwIObaSk=;
 b=U0BzgJE2Syj5rDa6VWxnL1NcohZBr3BycX/kpY0N2CT1D/1swALDhHhmAdne8VHRlgZs4hLSxH1zlI4VKRfr8uwXBOGTJAdZOr0W7T57WK2UclsCGs3HvRU4M5YY+FU+DpYenojNroR43aWIImPKVjefrs1tlaRf9L0y/8Jbrwo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAripRtdM7P03gfJ3L8FHbg50+4JWWllELFaVh5k+opIiGpYiHLabsB/zISQ0jOI1h7VeG7ExR3V8hHK/8m8xRBkr3uwy8mYRsCvcnevK0EOfM7h0dwjY7Ah0+bKZj4RuCMQLcTOvWAH0EJpd1jQmUrFixhi20r3iSiF3C5uqZNFgCOCNsZ4yVuKJY5nYxZabMPNrBN698JDR+OScAaXKMczXknM4+f5WJNwxZ8h3WMLQzVP4HzHzw/J/LCPFCdmcEyxMuorrWa0P5XXCdu5bN984pR4n+QA+IZ3OqJPjzW6nAdjjxNVE8sAiyRafO3bLFkIdVr+r9sokduNUC3RkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLDwNF5wRePAW3G3MXfAr7V6jc585+UVl/pYwIObaSk=;
 b=iDcGE+vfDWbSX2sWbOrZSYh4IbU+zlPpPw8/iiMT+TeKa90blm+l5VXCM1A7B+lLf+ndX8X5BSDr4Ip44eHc2IP6YhEJNsiSHHgbFAymRGl83OSzJA7YJKvOs59xQXpZv7YMZtwz65RBeLYTpPgEszWoz4+YYT66LRKVMfZwmAQx9Ja9XHzIqVfYlb/52lkC9EL8J0Q0zuXsZV0bov2DiKBtI3Z8l9P+szvoPq1UIQpuHyh1xOUb+hgI7n++FJrMRd+CEpgSreuril29hU4oq06ZIuMMgCNviRY5D4alKpEIhR3tME0AO+O0s1HYNQnS+n897GtRyS4H6qipkgwcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLDwNF5wRePAW3G3MXfAr7V6jc585+UVl/pYwIObaSk=;
 b=U0BzgJE2Syj5rDa6VWxnL1NcohZBr3BycX/kpY0N2CT1D/1swALDhHhmAdne8VHRlgZs4hLSxH1zlI4VKRfr8uwXBOGTJAdZOr0W7T57WK2UclsCGs3HvRU4M5YY+FU+DpYenojNroR43aWIImPKVjefrs1tlaRf9L0y/8Jbrwo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan
 Beulich <JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable as
 much as possible
Thread-Topic: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable
 as much as possible
Thread-Index: AQHcfj5G7fNp7PSkb0GiHPxZx0yorLVD4eGAgADfJYCAAAEpAIAAPk4AgAALzIA=
Date: Tue, 6 Jan 2026 12:03:03 +0000
Message-ID: <9FC8579A-066D-488D-960F-737FDFCD1005@arm.com>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
 <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
 <FBDD1B8D-F686-47C5-8117-BFEF8C8FD3FB@arm.com>
 <DBA9942D-FF7E-4ECB-BE2B-3C8814A4B4A6@arm.com>
 <0e1e877a-a8fa-42aa-8546-ee66f9287e18@citrix.com>
In-Reply-To: <0e1e877a-a8fa-42aa-8546-ee66f9287e18@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5590:EE_|AS8PR08MB8221:EE_|AMS0EPF000001A0:EE_|AM8PR08MB5588:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c8d57e-2573-4128-1477-08de4d1bb323
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?f8tqyyw05Em2ZligjZXWRE1UuEwAyxSGh0RPE/zcbao4N1EcEH4PEbIjvA?=
 =?iso-8859-1?Q?5A2edoJELByr7CHgKKdrK/HozripYlE3Pv4maMbepUqOUnNeDcFyyhO7oT?=
 =?iso-8859-1?Q?ayvtkOTUhC2nev8vuGJ+JeqGCrSkf1DtuEb4ddj+wtuh+G+VW5njf7CmhK?=
 =?iso-8859-1?Q?9SzvXiwAl7CWFexhA2xUPDH8V8KUIygBb49OOcDKFV5Wx/+CGJaENMvFOf?=
 =?iso-8859-1?Q?aXgA6eSw8GMMQD6SesZ2svDQzJe2uhSV8rsa+tcT18TFt3iq3+uAdGIygA?=
 =?iso-8859-1?Q?9USoxpHg0nL2KFnZbrzKDB0hp2VqwgYDt1LRwoVTR605KblTrhpywFALGm?=
 =?iso-8859-1?Q?3Cr1dcOlaxtx/J7n4ZFx7oANpBYyPt90s8d4CV2+FCgqWd48vBIrJGYbwo?=
 =?iso-8859-1?Q?QyS8fdrD2y819wwjdgJwLZi1vY1C2FQ5q11tvw0KeSXEguukqArpabQNWC?=
 =?iso-8859-1?Q?9KJfHDXkQwVSw/9mrXIDbnLHlGoQ1CnzWxXZn9Iodyf77G1OAzn221+UOC?=
 =?iso-8859-1?Q?1qLIBHA/0pQFOfAwpRjV7XyfJln2xcOqWeyRxZRku9I0f2y9l6riVWOIYW?=
 =?iso-8859-1?Q?tCHbGrAzxiErUYSxyBpk8GeiWrSMfJhUccPxMzhchfZLe0JB1UybTl6BI6?=
 =?iso-8859-1?Q?pUKnoZc1aO9bebdl7EpC4envyx4U6UCkXuRab+1IlIakb/zJKw3LAP0LsA?=
 =?iso-8859-1?Q?Cu2pBK6A7rZkfiAaaP7kLmZJMjzeK+R//xiY6mFxk68MeIz5Df6pSCujeT?=
 =?iso-8859-1?Q?zWVb3rH29aSDAk9wNQpgduT+XyiJtaXEHrjiGuv3m3s2eDp7GF5DGwUsLB?=
 =?iso-8859-1?Q?oQutbCrJRBYXqTdXALrymSLCnLTCIwIaKD70AYM0LOHjwvgrkT1mrV5Lpt?=
 =?iso-8859-1?Q?ACFCb1yqgLzbvuW9a3gTTQCrtz/YjpjEvmLDYk/BdluiirmyvEiV9dEZwQ?=
 =?iso-8859-1?Q?ej6rU3yP2iwoGr8NcB/RiPnpV5qw2UizqEXMmW4n4RVilgtRDNxwOZ/D5y?=
 =?iso-8859-1?Q?1OBbLxVcVsSuOSCCXxBRHG0PqhqzO1I6MOh6c5e1hO8GeTYdGsAFHf8ck2?=
 =?iso-8859-1?Q?onWygA9Fx9+G2aeGcTaiY/6Meqzk78rn8gX3c0LZOpMCVBZf8FzzGZYulM?=
 =?iso-8859-1?Q?OezNKQ1CjN+R8eYBa15xSpX4KhO2EACWnjXt8+b8kpiafVr0FXCg5MXjY4?=
 =?iso-8859-1?Q?brthFpZdlxC7H8mr0tXIHby+g9p+u2swHFGI41JYRwjET6YAhSFph0CXA+?=
 =?iso-8859-1?Q?LpnSZJsE+lWXy0edENLlzG0wTWVy1hFVFs1X640mGk4KNtpOyJ1VxZwsO8?=
 =?iso-8859-1?Q?TJzOTgNKET4/jmqOb3EB8OP45dzBYoQUuXG3l4ZVBoVryCX6Vt5oHmd+y1?=
 =?iso-8859-1?Q?MWm3Ih/wXAHfTEwqugD60roGC0T8OBuxDjsaPPouM2bWzUht0zzL2E2cmx?=
 =?iso-8859-1?Q?e98ok4yExBpWd7hO0n996UFl1zhL4fcXoVKiSrEgtom/8oe2ehOGrSInw3?=
 =?iso-8859-1?Q?0+RAgE4jJlgOopNx1O7nut/3BfvHKdefIku+dXJbnfHRbft2BFdbE/VKe4?=
 =?iso-8859-1?Q?nXKZZaLaEOajIyh/Q7HGa3YzVQRw?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5590.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <42149D0448CF494E83F7AF4CA3A93A5F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8221
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0476ff7-4c14-4533-6d7e-08de4d1b8bd6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|376014|7416014|82310400026|36860700013|14060799003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?JBAJsH0F7nJSCpgWYG6cEklBdCIa39a6oKW7/LN3TIArQq23hW+rLfANNV?=
 =?iso-8859-1?Q?XIQY5Jm+jWoXnPtrBiGcw2nX0S+3Vo280KTS19MeIETVqAn4RzkjdgBcY7?=
 =?iso-8859-1?Q?SAYvymaAQlRQ4Iaa2haz/XPA3mCG2bm3t+72RL+/LRNETNLi7l4pGjNH64?=
 =?iso-8859-1?Q?X9hm30KKoO7TEknvqgq54mPg3ebd0/wuntPTxNKS4nK7VuxvmFHnCRadm8?=
 =?iso-8859-1?Q?uUGy/6xs7y6nf3hA8r3FPx0D1nA5UGEM1lWblgb5nD+RnQrknHT92VWVs9?=
 =?iso-8859-1?Q?e1/FDX9RWm+NROu/3RbyoC/J0NKDiVmrRTGPnfu6xhElUPXtwvsebtqCtY?=
 =?iso-8859-1?Q?JTA5FFyU0qWpR3h1kRvnsH+bI3HOD3mwgUBsIdwYYOLLzPfSP7hMgF9HJs?=
 =?iso-8859-1?Q?uRa6MC0C1sqK1/uoLwHh+L57AET51sAOnduY9orf/Mv3aAHTFKI+Ky98L1?=
 =?iso-8859-1?Q?9ctKGVLdL3Ep0/35UlzIpE5c+p4REsUBDyqZwSu0Xyyw2jkU3kMN2ktgD8?=
 =?iso-8859-1?Q?oi3rz3UJRJsHUJsdpIcj3n/fo+tsHbp0XDGVOXczRbEFtx6rmoBXZJ3hfp?=
 =?iso-8859-1?Q?ku2h0uvPZJ8hvquelAl0uisE9iNPyxD2Y3X15AEyKvw/9/KDIHZnnU/KGk?=
 =?iso-8859-1?Q?CKR98a7NJrCKB8mOeNmUuerYjfOENy5wSLnblnV5YO8TrmJG4QreYxrIpy?=
 =?iso-8859-1?Q?kstKkCsHjayMLVf9HUSthjQ8PuXuMtt35mU7eV8+vkVM/7dy8Qol5G2fYC?=
 =?iso-8859-1?Q?lWIUr14ZLL4iAsNIjz9IaTpdh/DNQy2k1G5UZSsGr8D2+pu/ZIwIYl5Ggk?=
 =?iso-8859-1?Q?Isqi2PqcNthXAt+aOpcuN3FzbMg4m5FZeCJYQHah6n/scT+mKffRFsXaFq?=
 =?iso-8859-1?Q?Co89rfTERg6UbuipJ0je0SEfUJOLD906iJe0Y2jB++l0v1dcfBHzt5akRf?=
 =?iso-8859-1?Q?S0iEqTP78xa5Ct5asizfiAVaPJIYJ/YuOuIzm48IjNzSoMKXai9oSzUxAl?=
 =?iso-8859-1?Q?AlqwpXEjQbNhW5D0ia/ajbuYW+uAD/EHBeRtQUxgPK6teeHAqSEQ5TWHjB?=
 =?iso-8859-1?Q?5qTxRg80hl5nVxCDbX18Uuf1nKg4gpvMkBp7GfyxGtLtBkmMYyDlue2t1J?=
 =?iso-8859-1?Q?xd3W/Kn7Du44StIbpFJ5BEFL/zvL2VGL5yYBzByk7SwRfcPjldRRnM9Zmj?=
 =?iso-8859-1?Q?1EnkHPhzRXZfDwdc8OecaDHC0t/3KAo9ZHk9sdmij5aBO0xwbgq3kg7EmH?=
 =?iso-8859-1?Q?lhhqtUxB8sE5Fvckd9xhdO0HV5yfvn7vzFdkxoRXjMjwYiX7DBiDD4252U?=
 =?iso-8859-1?Q?p8OxUsMhF6v3X6eLC98FAN6+py326wSIEprMoUWOHQweEcyok4UNa8lXrW?=
 =?iso-8859-1?Q?f30VfufkJ+1jZORIpJ3VQE/SUSCgnid4YouMC+J1jaluLWme4ZmeCPIr3i?=
 =?iso-8859-1?Q?QjaOqFjzX4MSYJxc3jZAeaWH0pawEpWrIn8DPQh9vP4cb6Bi8rUZSr47Og?=
 =?iso-8859-1?Q?zMN42db1upWHx3xKC41OdVrza+OZDtKfXBRDa6CpitdubfynxcfZHWjTe9?=
 =?iso-8859-1?Q?+8aFIRLEW+dbJ5od5BIMKlkksM6yPennQ8rDGV3HBHsT5aU66hRYNEUrGl?=
 =?iso-8859-1?Q?V1FvHUNBymsvk=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(7416014)(82310400026)(36860700013)(14060799003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 12:04:09.7057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c8d57e-2573-4128-1477-08de4d1bb323
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5588

Hi Andrew,

> On 6 Jan 2026, at 12:20, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> On 06/01/2026 7:37 am, Bertrand Marquis wrote:
>>=20
>>> On 6 Jan 2026, at 08:33, Bertrand Marquis <Bertrand.Marquis@arm.com> wr=
ote:
>>>=20
>>> Hi Andrew,
>>>=20
>>>> On 5 Jan 2026, at 19:14, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>>>>=20
>>>> On 05/01/2026 12:24 pm, Andrew Cooper wrote:
>>>>> eclair-x86_64-testing:
>>>>> @@ -104,6 +122,33 @@ eclair-ARM64-allcode:
>>>>>   LOGFILE: "eclair-ARM64.log"
>>>>>   VARIANT: "ARM64"
>>>>>   RULESET: "monitored"
>>>>> +    EXTRA_XEN_CONFIG: |
>>>>> +      CONFIG_ACPI=3Dy
>>>>> +      CONFIG_ARGO=3Dy
>>>>> +      CONFIG_ARM64_SVE=3Dy
>>>>> +      CONFIG_ARM_SMMU_V3=3Dy
>>>>> +      CONFIG_BOOT_TIME_CPUPOOLS=3Dy
>>>>> +      CONFIG_DEBUG_LOCK_PROFILE=3Dy
>>>>> +      CONFIG_DEBUG_TRACE=3Dy
>>>>> +      CONFIG_DEVICE_TREE_DEBUG=3Dy
>>>>> +      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=3Dy
>>>>> +      CONFIG_EXPERT=3Dy
>>>>> +      CONFIG_FFA=3Dy
>>>>> +      CONFIG_FFA_VM_TO_VM=3Dy
>>>>> +      CONFIG_GICV3_ESPI=3Dy
>>>>> +      CONFIG_HAS_ITS=3Dy
>>>>> +      CONFIG_IOREQ_SERVER=3Dy
>>>>> +      CONFIG_IPMMU_VMSA=3Dy
>>>>> +      CONFIG_LIVEPATCH=3Dy
>>>>> +      CONFIG_LLC_COLORING=3Dy
>>>>> +      CONFIG_OPTEE=3Dy
>>>>> +      CONFIG_OVERLAY_DTB=3Dy
>>>>> +      CONFIG_PCI_PASSTHROUGH=3Dy
>>>>> +      CONFIG_PERF_ARRAYS=3Dy
>>>>> +      CONFIG_PERF_COUNTERS=3Dy
>>>>> +      CONFIG_STACK_PROTECTOR=3Dy
>>>>> +      CONFIG_UNSUPPORTED=3Dy
>>>>> +      CONFIG_VM_EVENT=3Dy
>>>>> allow_failure: true
>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/12604499722
>>>> shows 122 failures in otherwise-clean guidelines.  Some observations:
>>>>=20
>>>> llc-colouring.c uses binary literals.  These are safe to use now since
>>>> 4.21 with the updated toolchain baseline, but the Eclair config wants
>>>> updating to allow this language extension.
>>>>=20
>>>> ipmmu-vmsa.c has a git:// url inside a block comment, which is
>>>> considered to be a Rule 3.1 violation.  In principle this ought to fix=
 it:
>>>>=20
>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automa=
tion/eclair_analysis/ECLAIR/deviations.ecl
>>>> index 7dee4a488d45..8f5fc6c93bc5 100644
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -60,7 +60,7 @@ removed by the compiler, the resulting slowdown is n=
egligible."
>>>>=20
>>>> -doc_begin=3D"Comments starting with '/*' and containing hyperlinks ar=
e safe as
>>>> they are not instances of commented-out code."
>>>> --config=3DMC3A2.R3.1,reports+=3D{safe, "first_area(text(^.*https?://.=
*$))"}
>>>> +-config=3DMC3A2.R3.1,reports+=3D{safe, "first_area(text(^.*(https?|gi=
t)://.*$))"}
>>>> -doc_end
>>>>=20
>>>> #
>>>>=20
>>>>=20
>>>> but I've not tried it yet.
>>>>=20
>>>> There's a R8.4 violation against __stack_chk_guard.  I think this want=
s
>>>> deviating locally, because it's a fairly magic construct.
>>>>=20
>>>> Other than that, there's a smattering of violations.  Some will be fix=
ed
>>>> by some work I've got pending for the x86 side of things, but most are
>>>> specific to arch/arm/.
>>>>=20
>>> They are quite a lot of violations coming from ffa.
>>> I have a pending serie on FF-A waiting to be reviewed/committed.
>>> I can push something to fix the findings after it, if that is ok for yo=
u ?
>>>=20
>>> I will retrigger the CI from the branch corresponding to my serie and w=
ork
>>> from there.
>>>=20
>>> In any case, very good thing to activate all those and check with the C=
I, thanks a lot :-)
>> There are also a bunch of optee ones that i can handle in a patch.
>=20
> These failures are non-blocking in Gitlab CI right now.  Therefore,
> fixes can come independently of this patch.
>=20
> Once all the code is being actively scanned, I'd like to see about
> creating a new blocking ruleset so the rules we've cleaned fully across
> the codebase are enforced.
>=20
>=20
> One point that was only in the cover letter of the original email and
> needs discussing.
>=20
> In ARM, MPU and MMU are mutually exclusive, as are VGIC and NEW_VGIC, so
> I can't find a way of getting ARM64-allcode to really match up with its
> name.
>=20
> I strongly recommend deleting NEW_VGIC.  It's had 0 development on it
> since it's introduction in 2018, is causing problems that Oleksii has
> had to work around to improve domain/vcpu allocation in common code
> (done now, series pending), and it has corruption problems when
> destroying domains (noticed during the review of Oleksii's series).
>=20
> MMU vs MPU is harder.  I'm not sure if it's even feasible to make a
> build that contains both.

MMU and MPU are definitely not possible to select together and will never
be. The allcode should definitely select GIC and MMU, for the new vgic
I think there was some people still using that for some reason a while ago
but not sure this is still the case, Julien is a lot more aware.

For MPU, at some point we will need to validate the code but I think we
can do something like a virtual "arm64-mpu" allcode config when that
is needed. At this stage, development is still in process so we do not need
to check that part of the code.

Cheers
Bertrand

>=20
> ~Andrew



