Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DD3CA6EDF
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 10:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178559.1502316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRSAu-0003mH-VX; Fri, 05 Dec 2025 09:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178559.1502316; Fri, 05 Dec 2025 09:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRSAu-0003jj-Sp; Fri, 05 Dec 2025 09:32:28 +0000
Received: by outflank-mailman (input) for mailman id 1178559;
 Fri, 05 Dec 2025 09:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jrem=6L=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vRSAt-0003jc-6F
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 09:32:27 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c003dbb-d1bd-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 10:32:21 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by BY1PR03MB7849.namprd03.prod.outlook.com (2603:10b6:a03:5b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 09:32:18 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 09:32:18 +0000
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
X-Inumbo-ID: 4c003dbb-d1bd-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meBn9RT2/+V76vF8s4ASXRvYyjqqRbx4qa8Nc1P8l9xO9C1U1fR/Lj9kWQqkk2rQRzxLf0nfmRB3zZlKeYnRdwsjUVV/vYdFi+GIJc0k8MKsPS5CJcswib+SmRgCXyVltL5CWE9MbmSNbwgV9aospyNzmsXG4t5sshUo5MINzE6YSEFDImrPmTPrw+YDtSJLUsfst+nTsT4lUDlXvqVXlPzXz9jFWe8V8InDpYUfHmx89zgXU1a/1BPyzkgPYfvAxxZ5wQjBuH/D1jgrHcjTEOK2Q6ctx1dJMZ23HVYQIC5G6Fjc+cqeOuBXfxFwZXavpUeHwtp6z+RdSJ0cePm8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAe3cOIb2k2ogki3qI/S/r4WjMX1NpVeAP258/DgzPo=;
 b=GsCEBQIaGGll/9eL/7KO4j3fW/TmLtjHf0ACkKRg0DrXNfZOcDo99R/PYfiXojZ85stCo+hKg26uHTECg0PF49OK3tT5Fom8KaoLyrTsDqPQflS0i+upW4PazioXo7On7HhSiwa+vos0rv8HucLeWB8UFiDCWNa/Vq+/jqYA7mx60sIthvtyiZJ+knJuSij8CXkHFFqve7QpyN6cxDJCKbSqalOOE0C6vo8OOBZvV3CyCE1ECNxTXdDmHP2BSEoLe6fB9X9WcxBZnBbo8cRD59K88wg0KuJGAN1cteTbDjLuvgRYPQFkIXkZEv51Y7EDw7H4hOadC+utQuvrg+aMpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAe3cOIb2k2ogki3qI/S/r4WjMX1NpVeAP258/DgzPo=;
 b=ZY/xcjUHqAyVMbfmlMvr9fRUZibX16tQWzVzmLsxkY7f5aQlmGcuLZEziL56DI4dAUpdHKdyxutImmgWG3lP1a2Ywz4tO/fDUKZD9v5jAh/YQtdVKNiZ7FNruP6qHfzg0XI/P570ohWBS0o3f1N+N6J4ejWhEsvkAbTiBPgLyyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/hvm: be more strict with XENMAPSPACE_gmfn source types
Date: Fri,  5 Dec 2025 10:31:51 +0100
Message-ID: <20251205093151.56207-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0331.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::15) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|BY1PR03MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a87fe0-8e8c-4bb7-9ae7-08de33e12ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LytvK053cmZHbktYMlVRRlhpUnhqU3ZwVk9yTVhlK3oyQjRxaGczY0FUc0s3?=
 =?utf-8?B?dmpQNEhYbG5vNDZCdG9XVFdqS3o4TkFyY2xsTi9aU1FBVHpUOVRhTFArYUh4?=
 =?utf-8?B?bndEV1k5SUdlcnhuQzNFQWZRbkRsOHlCSGZTR3RLNEFNaGtBaEhQT3VnUEdz?=
 =?utf-8?B?UnNTVkNGbXcwTWdpUko3MDQwM0dQNHNVd0RiMms5Wm44YnpXZTV1Rm0xalVu?=
 =?utf-8?B?ckxVckJZQVdCclI5bkdkNFVabExuVmtuSk9lTDJHT2lLaVY3RUV0Mjd4UGVJ?=
 =?utf-8?B?OURHVUJ6NzFCQ3pmdUdUS08raFJ1SkYzNmpnblNMc3U5T1BuWWF2OE9kR1R0?=
 =?utf-8?B?ckMvb2IrVjBJSkFyZmJCOEVZQzVuSTFpZWtVcDRodDZNaHQrR0lkRGswa2hh?=
 =?utf-8?B?VFcrcHljSXhMR08vdjVnbGFFVUdLaTlkbFNJaEZaSUM3djNZQ1d4UXNYNjk1?=
 =?utf-8?B?YTY5cmFhTmFZUWc0VjE1VWE5VE1jUkVMU3krSUcvRHFsSnBWMFBKQkFDKzVK?=
 =?utf-8?B?SGRvcVdzRTNmcWR1SHVQSEp1V0R2bVVHd2NBSUtkeks5ZGpTMmVMN2lqOWlo?=
 =?utf-8?B?VDQrSGE1SmNGcWFCa3E2OXhRV3RYSXRHTTBHYWhiVWdQQTdqMUZQRjI4Vldu?=
 =?utf-8?B?Tk8vTjJRbmwzSU95ODhJVmhSY3JXekZIdmFwL2RBR3ZrMlFGb3crdWFPalFm?=
 =?utf-8?B?eEg0K3NBZWl4UElESUMzOHltYjUzY2JkdDYwMEZFcnFHVmRML0FXNEpRWFV0?=
 =?utf-8?B?NU1HM3FGUDlnK0l5ZHlpalpIZ0pvTG1MdHZEV3BLMkkvRXFIZ1VoYVpTTkJN?=
 =?utf-8?B?dEUzV3ZLdDdXVGNoWWl6ditSZVJRSWJ2MFRSUERYVHFjU1NCK0U0UGJiSUhQ?=
 =?utf-8?B?QXdPN1IvYlJFZnN0L1FhOThsaC9JbnV1dEJKNlpIVG5OZDVRZVJCNTJSVng5?=
 =?utf-8?B?YUpBcVZEZlFQeU0rOHpLcktaNUgvZm04SmJBbC9ITHJ3d3docVRhaXNOTVM5?=
 =?utf-8?B?bXRxNjkyMFBscjJYNm1RczRKN1B0RHZiVVVMcVEvVHRvdnFxMzhvdW11b2V4?=
 =?utf-8?B?OEppVE1WdjhNZitNYVVXVzhreW9vRUo3QXJ4cFp3Y29kaXNlK3kreUl6M3Rj?=
 =?utf-8?B?UHRldWR1Y2t2aE1MbktRK3kvMDlST0w2enpkeTdOcTdBQmNTbklxQW5OSEFB?=
 =?utf-8?B?d1BaTUJEdXkyV1JSeGdzN2FScENrWGd5azdQWmIvSnNhN2xoWlJDR3JDQmJ5?=
 =?utf-8?B?ZjdrNFY1WWF0ZWRuNmpMblA1QlB5QitoWkpTSUUybDY1WExOdEVKS2hocGw1?=
 =?utf-8?B?M1ZIb3Y2dm1FRm5zdTBldVd4QnRLM21hcXNFcUlsb0hvLzhEK3VscGpENXNa?=
 =?utf-8?B?VjIrVTljclcrakFUdFhEWVNid3VRenBORlFzbkExR1dkR1Bnbk4wK3dHa3Nl?=
 =?utf-8?B?d2xDdUJWeUNOdktHQkViVnlDcnNCUmM4MnU5SWhLUWNVNjVueUV0UkwrVHpH?=
 =?utf-8?B?Z2U2N05ZQkd0Y3ppZjdXYmRabVBuMkw2UnlVTklIaVQwK1d5bk5RQk5JUXBC?=
 =?utf-8?B?ZzZRUy8ydjJLL1M2TjBCWTNQdzUzTFozU3RWSys5MjZnNHpIcXkxanJPNUVm?=
 =?utf-8?B?MGNlL1lNMVJmRmZCVVAxS2VqZFhwdEdEVnNtUk43TG9WYVpxTk1WQmZTOE8x?=
 =?utf-8?B?Y2FLTDdJYld6L01wdTdBWm03bGxlOXpFRXdrWHdVdzA4VGNxZkVsVWV5U1Ix?=
 =?utf-8?B?T3grc1NpSFFHdFk3cnJqQVcydk9IYjd5NjFlMWlQMHNLYm55QmxzcjdnV1d6?=
 =?utf-8?B?THN6alNVMHhDK1I0TnBxSVR2OTkvNXpMUnBySm1CTWp5TDdKU3pVWlEzV0JP?=
 =?utf-8?B?c3hwUjNZWUhsNnJGWDZ5bHVwNEJCaEFSUXJkNGlmeWRrbnJsZkJUVERPcUNs?=
 =?utf-8?Q?purxiK+6NOJMwwZqdUO19Oi50/G5Sm7y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmUwMTRRRW52QkFoeG84RkQ5by9XejhUWnFBVk5rM1N5ZXRKY09LWTdJT0Vu?=
 =?utf-8?B?NUFLUU9IRkNvWktZdmxSWnU1clVJUnhqOWJRaVp1MWVkaUl0VnZaeHF3TkRV?=
 =?utf-8?B?OFNlbDhWTmRUaHZoVmFjN0crQmdXYnJTZ0ZobFJMZnIxc2FDbytxZTdlU2Vz?=
 =?utf-8?B?NFJMR3pqbml6YS95QjNadGRPS0FFWTZwaTZINzh3YzRDaUkwcHF6b215U2dy?=
 =?utf-8?B?V3o1QjVRZEIrR1NKTWd1Q0xCMC9pSy9VeUlDZ0JwRGIzWjRuQndTMm5JRDRS?=
 =?utf-8?B?RG5id0VxaitCNlZOc0hGQzdkS1V6NVhENVU5SnMwcGkxR09uQnhaMlZDZ2xW?=
 =?utf-8?B?QlpDNVVNcmZua3Z3cHFpdEFXYWFkNTFPZk5qcERrV09MeCtQR0R0VzBSZnlR?=
 =?utf-8?B?WDY0ZXp4aE5Xbm02ZEEwUzJGWHJXOXBHcU1va09HZWN6Y2xjMncwcjFkV0Fz?=
 =?utf-8?B?S2JKSE84czMzZVlCclFLaDMyaHNkSEh1OE1iV3daaGRQbHJCWU45Y2EwZjZD?=
 =?utf-8?B?dklzYW9pL2pickxmcGpxZ1BoUGtIY1Y2cmEzNXZObVEwK3hYajZGUS80U2E0?=
 =?utf-8?B?RWo1ME1vY0R2dzJPMDFrZ2k4OHozeU5wZytxV2xkVkI5a3lOWmpHY001SUpr?=
 =?utf-8?B?Y3J4dDFwYkVSZFBPS1ByS1lPaHBVNXgrOG9XUVNuNkg1NDNxV0x2b1h3R1pR?=
 =?utf-8?B?NXlTUUdQOWVNWWRRbVdxR2MxNitpSlJNb1ZXaXgxV29jL0pKbGRoWXNuQVlS?=
 =?utf-8?B?dGh2MjE5L0tOUmtNWm9JdFRpWUpiNGRpTldXMzB0eXA4b2E2ZEhXcDk0clNO?=
 =?utf-8?B?MGF4MGVRaTA3UWlkWisxeGw3MVR4aFk4RG83eHlNbENrbTNDT0NiZWhHQlkv?=
 =?utf-8?B?Y2p4SDZLVkl1WmZoelIxSVNMa3gyWC9pSDZSekFiNCtNRVhDZ3FRK3QzVHdm?=
 =?utf-8?B?Rm5vYkxqRkxpemFDdG1WdWgycFBicndYQWtZQnhDdEFFMm1hSy9YYWo2R0lJ?=
 =?utf-8?B?SkVINml4Y2FYSGFSOTFxMEpXS2FXVnBscWl1alZwU3BvMTdKVUsrL0pOTEpB?=
 =?utf-8?B?UlMxZGxoU0VyZkNwZ3dsT3NpOEM5WkNGMTlFektBeFdvdWZYK3pZUFk4YlZV?=
 =?utf-8?B?aDdOVTJnWlE1UUJoNU00c2pnWGxWT05TL3I3SnVtVG5ac0xEa1p2QkhZRXVG?=
 =?utf-8?B?WTdxTUZVbUg5MmNyZlN2UDVydnRlQ1M3bi9GeTF4aVFZQTNEQ2FHT0JFYU9q?=
 =?utf-8?B?dis0MSsyMndobTlzWGhBbjdYbmp2UmR0OFNlWUpaSGdKUHVweTN1Ym83WXF2?=
 =?utf-8?B?eWZQK0VYRDAwa1BYbFZ0d0hBZWRpOU02Nk5mSTNpQlYvYTVBWjBqMWtnbVVQ?=
 =?utf-8?B?d0ptbFNQVER6ODdKdlpiczZBRm5LVzJTTWowQUVDS2pzU0lCYjlkSjdSbEF1?=
 =?utf-8?B?TEpBRWlqU2kwUWx2NnVtNVI1VE5TMWd2TlczOCtSNEgzMkQrRjFOVHJuMkk3?=
 =?utf-8?B?TStndFJhbzhvbytBNDZWVHI5SGNnaXJBVWM2SERwTzJqNGs0NkQvSjU1RWZC?=
 =?utf-8?B?czBzbmlsNUViRHFYbmJKM3JUWVpvVXRoWTFweGdzSFVDcis3R2UzekFZRVhN?=
 =?utf-8?B?UmJRMTNKWEgyWkFkajczMjB4V1hQSDBqNlBkRE95ZHhoMHNqdldJSnI1ekRj?=
 =?utf-8?B?QmxaQXUvSnpub0tBVnUveFBBK0IwNjlXSm5EaldjZGVnNWtBUTg3WGNaMnhB?=
 =?utf-8?B?T0JyaGFVdTJiMDJ1S2g4bnJvTHl1c1JSS0RjN0NKY1RKWmpsU0FqY0tRWWRt?=
 =?utf-8?B?UTFuei9zSi9ZRkEyNVRRWHBzUVFHSFErZkxmVUtQLzUzMkU1akJpdW5rL3Q2?=
 =?utf-8?B?R2xxQTFSbWpuK2xua1p3YTlKVVgwV0N2SnZQWHVDanlZS0VVckhlQ0pHM0ov?=
 =?utf-8?B?TXlLSnJWdUR4czRDcnd2N1lNeStHVnVEUDF6TnBtdnplYW5UV3NSb1FaMzNq?=
 =?utf-8?B?SGhwSHhPVEg0QWtIWjlwMktRQjlCbmNKQVlndlRoYitQbVJESmN5OU91WTlp?=
 =?utf-8?B?M2lQN28xUzdBVmVqa2pMaEZYaFV4VVAxZ1hiM0ZyMXQ0VTViR1NROS9CVGk3?=
 =?utf-8?Q?9aC7d+Ju4EKWY8JSsMcB6dBeW?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a87fe0-8e8c-4bb7-9ae7-08de33e12ec5
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:32:18.0905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIxyphNgVvRdjjJpq3e0ZLRgYXTyDzfaD2tGhyUcZwCHn0FQrCJ8JajWiJylTfGuB4ouQ6V+HhtFdTsHJs47cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7849

XENMAPSPACE_gmfn{_range} allows moving gfn around the guest p2m: the mfn
behind the source gfn is zapped from the origin and mapped at the
requested destination gfn.  The destination p2m entries are always created
with type p2m_ram_rw.

With the current checking done in xenmem_add_to_physmap_one() it's possible
to use XENMAPSPACE_gmfn{_range} to change the type of a p2m entry.  The
source gfn is only checked to be not shared, and that the underlying page
is owned by the domain.

Make the source checks more strict, by checking that the source gfn is of
type p2m_ram_rw.  That prevents the operation from inadvertently changing
the type as part of the move.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The change was discussed internally by the security team and deemed not a
security issue.
---
 xen/arch/x86/mm/p2m.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index e2a00a0efd0c..452b2f8f0f10 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2007,11 +2007,15 @@ int xenmem_add_to_physmap_one(
     {
         gmfn = idx;
         mfn = get_gfn_unshare(d, gmfn, &p2mt);
-        /* If the page is still shared, exit early */
-        if ( p2m_is_shared(p2mt) )
+        /*
+         * The entry at the destination gfn will be created as type p2m_ram_rw.
+         * Only allow moving source gfns with p2m_ram_rw type to avoid
+         * unexpected p2m type changes as a result of the operation.
+         */
+        if ( p2mt != p2m_ram_rw )
         {
             put_gfn(d, gmfn);
-            return -ENOMEM;
+            return -EACCES;
         }
         page = get_page_from_mfn(mfn, d);
         if ( unlikely(!page) )
-- 
2.51.0


