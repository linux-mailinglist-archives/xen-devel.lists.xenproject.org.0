Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KWRDWqNiWnP+gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 08:31:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C710C761
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 08:31:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1224968.1531421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpLkF-0002mh-Og; Mon, 09 Feb 2026 07:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1224968.1531421; Mon, 09 Feb 2026 07:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpLkF-0002lE-La; Mon, 09 Feb 2026 07:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1224968;
 Mon, 09 Feb 2026 07:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpLkD-0002l6-MC
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 07:31:41 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ff51acc-0589-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 08:31:40 +0100 (CET)
Received: from CWLP265CA0299.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::23)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 07:31:35 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:401:5d:cafe::c5) by CWLP265CA0299.outlook.office365.com
 (2603:10a6:401:5d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 07:31:34 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 07:31:35 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA6PR08MB10815.eurprd08.prod.outlook.com (2603:10a6:102:3d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 07:30:30 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 07:30:30 +0000
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
X-Inumbo-ID: 5ff51acc-0589-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XR1QfRRJC44LogJaiM3yo9q5+EQMk4oDlYRupNG+e2a+znV4DXT6a+1BwwhH8N5xTrWfLg17vWkhMWfEdVsA0FVw5f4FMy3KKPltxUhcHQxOxbZ6JcPkvcvXy3H96Ta5xKLeFl27aYW+KIRSnh5cGxWMnsAg6ZGPlpeIwS7JVnBenBOIuJBGm9KHjCihFFXhyAup1EQ4J6SZQFXvK4PSuUEwbk0c4FzVJdzTLJjyyAW+KrV1Uw4tQeVZ2GeO9p8EBNLQXtWuVXQkAWNNfQvtXxb87Y/aiNTJvUcwX2FI0FfmN/kSXnO4S7Uk7M7foCEmbzeXy839iW3sdR0Hz3AaIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZeh32cjtA7Z/DVMmDgLKTy6TX5NTpb69mniU+/NRE8=;
 b=AhqR15i9GSSMmqRTfiwNi8GfabDOgeqHfnpOTmSfryUgj2To16OZJWCKufTspOh3zI5lps+0PhAKGTA2QPXTTSL+m/f9fIKQnEptPSKwgAFMNWP/FZj5pWVYm8/udg34KNvXNFRCvnsXfOEzMtOFQsWf/YtW2kL5V+JDVQHU5gPKal5d2W4msdfw9RP9ZPT+/ulQMDOIJKzQOqexzspAxDynQ1o0hYFD1uZnnVStX0Fv3Qvh2dD861TZoaQjJEDP3WhygUn16b2dTbxye+tWORTyNLecHA1JEYE07ppJ+L4ZbUSDf7ikZ2nSZyi0Jv4B99QV4ZTVR56EFMkJ5NCHnA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZeh32cjtA7Z/DVMmDgLKTy6TX5NTpb69mniU+/NRE8=;
 b=MigYVwo3hRK03N34KZtwociK0APfHulve54pJcVm0rbxssqB+o+qv/o74WTG7vQ20bcgMffpn0IMV2remEkcpk1yA4wcGPsvr7wRdamCWdsbXKN1cXKQZ6A/9/UpXGFu3YJFy+l3WCVoPx2yhbcWwn1j4v8FS09NVvJxafKlQsw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjFTUxR+78npPvX/inyAnlPgi7zLjFwQaz5ze1XV3wozpVtkwKE7r2JDybzv3p6grOiQM+QsomYvg+6fhHaylc32FiHpWrLlxAW90K2OKbMnp9htbYxTtZO7C6P8UOWN9EQ3K3RvwZ1k1UWub5tQKB3UHgNzrZSlY/4cSwZ21FOQzMfczvieqEjkW3rcV9IxAyRFJR/gDRDqoIi/3/Lqhos+yIr/s39g5s7kbBL1f0uNDXQCvMsVKUWMS0G+4oviNNl4j5a6WwzpXNXLt63CEYfpcsB0EvMGc/qJCnkcK3NW5Cn65vp55XRKq5ZOIWR3yPQDci3vm5fGZGUQKDR+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZeh32cjtA7Z/DVMmDgLKTy6TX5NTpb69mniU+/NRE8=;
 b=My0vPPp92rgSiDc2OEfTZmasEZEQjjZUe/9FQMDe9jVVj4kOAOAzWjRbfBGkYOKB8QSBE/2+dIitgh1lxgB0D8CBQ5VbWkLSibk7ijSmFbvpxRPQYp0dvLDsTTM40pZEI/toJps+407V9YXwJMUT6qiJzjOU7G82/2SpOIIEExt0HZ9I+j/ZPuzQ4HgIihKMITWHMm1k8enUO3SgWLY5alL8dBoppG257H4u9hQh0BToYGUAgAMb8nAVClrcp7W2ZCxdUV3dIWd3AdvhsLYf+XlhbIylOmFfpN6xzKAGjq9IndppwDNQSrHnJgspj1HXOgwMMjip11QxQR2CeHj3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZeh32cjtA7Z/DVMmDgLKTy6TX5NTpb69mniU+/NRE8=;
 b=MigYVwo3hRK03N34KZtwociK0APfHulve54pJcVm0rbxssqB+o+qv/o74WTG7vQ20bcgMffpn0IMV2remEkcpk1yA4wcGPsvr7wRdamCWdsbXKN1cXKQZ6A/9/UpXGFu3YJFy+l3WCVoPx2yhbcWwn1j4v8FS09NVvJxafKlQsw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
Thread-Topic: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
Thread-Index: AQHcl4TDvkxax6jik0exjnZrMlGqw7V17BsAgAQQvwA=
Date: Mon, 9 Feb 2026 07:30:30 +0000
Message-ID: <28DF7F1E-BAA3-49AC-8A53-75100BAE74B5@arm.com>
References:
 <ff14a313c6ec9b487263e8f823c96533bb70fe1d.1770394705.git.bertrand.marquis@arm.com>
 <aYYkAvGQygf2eNI7@Mac.lan>
In-Reply-To: <aYYkAvGQygf2eNI7@Mac.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA6PR08MB10815:EE_|AM2PEPF0001C713:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: f94115b4-04b8-4199-297d-08de67ad4114
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MWE5alVHTFJTeGt3ZzAxaDJueDhkU2JDNkpTbXZEeHhUZjVwK1BtUVdMRDRa?=
 =?utf-8?B?K2R3RGxhYkVWUW9oRktqV3NYZzFkQnVHTnVVK3NpRTM1cTM4UmdUUnBHYVBn?=
 =?utf-8?B?UzdxOE42bFdZL1dmWUgraTFQbnZGWHlHcmthV1dTcHRVdkIwRHVGa0xadm5w?=
 =?utf-8?B?bEovK1R2b1FZRDdGSTEwNjVjQ3dIYnVwYkhWM3kxdkZxeWxkSGZQUXB5KzQ5?=
 =?utf-8?B?Mk5VRjNYWVN1MUJEUVVGb3lRT1JHTlB0Z2dUZG9Xc21hZE84UE5KVGx4RU5W?=
 =?utf-8?B?NXZiMWZDK2ZCWGRwbmJKWUU4RW9TL3MzczRTTzdCVXRVcWxTUklGZjNDTzRO?=
 =?utf-8?B?N1A1Tmwzd2JRY3lWanM0ZEVLK3Bsa1FSSUtwR0tNenluN1k2Tm9WV215ejF4?=
 =?utf-8?B?bU96V293eEh3MExXZkc0cGRxMlQ5N3JQRUR3NkRLUEx5THRtazFBNTVrcEls?=
 =?utf-8?B?VFZCSFVFV3NmbDlBTnhEdHYrVUhjcjMyNlVuYjFnWnVLNDVMS05pODJtL1R3?=
 =?utf-8?B?SzdPNStBUHUreWl4K0xDb3JUMkk3YUZrb05RUktaUWlGb1k5bENpZFB3ZWND?=
 =?utf-8?B?elFBa0NtK2tKbkd6cFhQQ2ZSM25mOWtlNHMyRGU2YTBDamd4K09yemluQlNU?=
 =?utf-8?B?SG1ITnZ3NEhyYUVxdjZlYmxpcHg5VUZpYVA5ZllxS2hGeXI5UXh5T3NNZXlK?=
 =?utf-8?B?UXRicWRmMjVRZmdDdi9DbURjLzRNOTJ3bU9IQUtvZzViNmJGWjR3Qm04SmRh?=
 =?utf-8?B?eFFPcHFnWjRaVUxQYnhJdHhsUUN1ZVVudWVaUjBNbzhxSm1yc3Y2M3prUFRP?=
 =?utf-8?B?RjdFZ3ZDU2Q4eE43MVZQTmI0RTdXb2FXU2krVVVMdDVmcG5xZzFzUTZjTGd6?=
 =?utf-8?B?eCtUTDhHUDdVTTdxR040azdDY21tTksrcmdHVklLaVZ6OGFXemFIR1NTUVFN?=
 =?utf-8?B?amplQzhTZjFqdjZqaGpxL1Y3NlQ0QmVCdmQwZ05VQ25KcS8xS05GVjR6VEpV?=
 =?utf-8?B?bHpKOUxnU21RVk50REVYenBUaHN6SnN1UUtxSFNWUnY4dE5JcnpSaWNPYVpD?=
 =?utf-8?B?SVNGUjZ1Y0dSalJ3UE9WSXpEYi9kbjdBanJya05GZXhJZjBSaWZJcXBUR1kr?=
 =?utf-8?B?eVBjdW9vZk5Id2RnWWE1ZWR2N2VUNWxrOHk4ZFJDUTNMOUhUZFkvRmFPbTd4?=
 =?utf-8?B?aXJQekprN3QvdnlibmtWMGJQelhZcnUwdGl3NE1kSnlsYnVNWWVIdmFLNERn?=
 =?utf-8?B?dUtiRkprZDNudEtQajFOZUFYOVpyN0JVZXVpNzhaMTh1TmppZUZLOTY4alh0?=
 =?utf-8?B?cUtteGd6Q3htNkpiVm5sZW5vcWVNQ2tudDFTL3Mrbmc4KzlmQVJGbkVsRDRj?=
 =?utf-8?B?S3l5RzZTSGVGWURpTnkrN05QZEFzQm10ZVhwZ3FmZlRrUUhlZFlCd1VSdVRo?=
 =?utf-8?B?N1hUOFMzaUovYjJMOHZvdU1xOGVqdW1HMitNTlh2YmJka2diMS9BNHlQc0tK?=
 =?utf-8?B?UnRlU0FPSnJHUkgzTkV1dUtsY29WenRXSDFyWmlKd1BQekhSUnRJb3dzaE9U?=
 =?utf-8?B?Wi9vWE4rdzFoQmtzTml2MkJnSkRPSlVLMGY0U1dSa3EzWkR5Z2Q2VzlQNVVG?=
 =?utf-8?B?b3JCUXh3MDRJenlFakk4dE0vS2xYTkxJaW5OSmFuVjU4dE1uVnVRdDdpdzJ0?=
 =?utf-8?B?dXdSY0s2UlJwUVlLY3NsSFN0dU43ZWtMQ3kwREk0R2JsVWdWQ1FndkdtS0s3?=
 =?utf-8?B?Q0l1MDAwdjZaNUU4WHRZUklQazc2TU1oVUtmVW1vNWRsSUxuUCszR2VueEpM?=
 =?utf-8?B?clpUVFJMQy9tV0NSNktwUzE4NW01U2wzd2FSQUpZZUR6cDlqSk9yb3lHbWVt?=
 =?utf-8?B?TGh4bEhNOHRDQ1gzV0lySWhxM1ZvdkwyTDNERGxmUEJLWG1XczlQUzZqSk4x?=
 =?utf-8?B?WnN6SEV2eHJNOGZCam9GbzZrQ0Y3R0Y5akV2OWE0YzFhRzVidC9qYW8xZXdY?=
 =?utf-8?B?RldFNkN4RmpGTDMzNkVXQ3VVOTN0TWE2UVp3Q2l2OWROaGo1TEFIZE1saGEz?=
 =?utf-8?B?NFR1STRLeG5xcVhqSnF0RGI3Z0YwcXBMV0h4MUtER2M3R09SRGM1cFljUFJV?=
 =?utf-8?B?a25hRlZpclEzRGRWNnVrSExUTFMxU1VSSFhxK2lQQjRlZVFDZHBhSXkxMW9k?=
 =?utf-8?Q?CsQ5H4MyXmbYZWbyXtexLE8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <738AC16F97FB9B4580AEEEEB86DD8539@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10815
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14ce41f4-4fca-4ecd-3648-08de67ad1a86
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|35042699022|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWdKeWlTWDY1emdwNUJYT1ZiK29oV3MvZERkZlp2elExZkJQK3VpV09WQ1Rt?=
 =?utf-8?B?UmtHRnowMkxqRWVvRFJ5VjRiOXpmRm91N1NiZ2tQT28wUlJ5dXFKU3JXV3RK?=
 =?utf-8?B?NXl6T0p6VlE5Njg0aTBVL3krbXdMa3ZuZFhoUko3SEFLNjBkRmtCUWg5a055?=
 =?utf-8?B?Q1NoUW5zMi9WSWgxbDFaT3RFZVgwaDRsNTdRVllaR0FZNHlRVUN6SHJXK3FF?=
 =?utf-8?B?R0lDQ2pPWEhYOGNUQ1ptNjI3K1krblhTTEZEM25sbnM3U3FYK2k0eURvNGRv?=
 =?utf-8?B?M0UzSEtUblRNMTFMMWpFa0JPOGE1djFFaUo5bGRjYkIyVU0xemVYSVkwbUM2?=
 =?utf-8?B?Q2wwNzk2dEhZUUZ4NEtVU2plQ0JBeEJaelN3MUdTSFhLeFI2K3VEeEQyV3dR?=
 =?utf-8?B?NzdlbVg2ZmNweFp3eUVQZUF0bG8rRS9INENkY1hTdjgyQytKWUdML0IyQmRK?=
 =?utf-8?B?djIxMWthR0VFT0xDcms5ZkxXYndlOHNXbE9XOWxRK1pMdXFwY2hBdVJZeTFR?=
 =?utf-8?B?VWtQb2ZuY05kQmdlb0JtRG9Cd2JaYU1RTjlSZHpYeS8vYmRsQUh6Ti9IQzdO?=
 =?utf-8?B?dWtKK090SUVNaElCME9rZTU2Q2YzSllsYm54T3F2cEJYMzB5VS9xVmY4TWxB?=
 =?utf-8?B?dm5rZ3V5Q2FSdFF3MDdrK2hZNERBRHladmdOREc1Wkc4cmd5S0FNNkRVaVVj?=
 =?utf-8?B?Smd5dWR2d3FKUVh3T3NMZUxNZVFLRkxEUlljZGhacGFtL3BuZWdkQ0kwWk5Z?=
 =?utf-8?B?UjNZWnQzamM3OGFXL1pIR3lrMFIwS0ZJV0ZsTzl6Y1BsYzdsRCttbC93Wi9C?=
 =?utf-8?B?ZnpNOVl5NUxXenlHZTl5ZGpUckFHWUVuS3o2MU5RQVZEZ0RuZGxlRXgrcTAw?=
 =?utf-8?B?ZGRaTEk3dmZwNjNxNHVvWmdkbURGMnpTTFZvdXIweWZOcU1vUmtZK2RiQndG?=
 =?utf-8?B?N3JJano2T28yNW5ocVE4QjJmTTRGTmtMbDN3bU5vRDh5SmI1akp0Smd4RVRj?=
 =?utf-8?B?bi8yUmV3RVJ2UGRpemVyc1ZnMUdZYXBwemZoWlFCNkFRZXJ3Z25pT3JHZDhm?=
 =?utf-8?B?aDFoYWNwYU5EZmVxc0VYUHovRjVLMjB3UmxiOTdOT0FTeWs0UHZlUEF2RkYr?=
 =?utf-8?B?SWo4dEN2SHBmVjFyVUZ4OW1OdkY4UUhqZlBzclNhelljenUxQndSa25GMDZu?=
 =?utf-8?B?d2RRaVhhb2JPQUx3dHZoSkxBVi9uTkVjUVJUR2NURHQvVnBnT2l3Tmdqakk1?=
 =?utf-8?B?REFoUHN6OUJ4UDJvUHAxMkdsakhodkhCMGpiN1ZXWGs5eEgxWlNSRDdWVURi?=
 =?utf-8?B?WmVuNVZMMUdsYTRtQ24zSTQ0N0M1cXlXeHpwOE9nY1laaEg5cDQ1K0N0a1F5?=
 =?utf-8?B?MTQwaStNTkxObzRFZVNkQjBud2lURzJFUEhYQWlFU3BMeFpkYlVsRG02NXBh?=
 =?utf-8?B?c2xCM0FuWkpHSzBCYjdkOHk4NGI5TGtRNWVQdnpLd295ak9nanJiQUdhM1Jp?=
 =?utf-8?B?K0ltSVIwZ3M5eHZBeWg5eW1Gd0pYbXRDZ1lPanZEbDcwVFVISTBtSkFMUWt3?=
 =?utf-8?B?RHRPTnBjK1BVenBDRENSZ3lSa01mU0FsZVU4NDZyRC9tRHhHMWVSNUZSdTJX?=
 =?utf-8?B?NTJ2V2l5ckZFTlI5cDBIMjByNFJjYi84VFlON0NYRlJIK0JvTkJVZTFPYzhM?=
 =?utf-8?B?Rm9yQ2h6VVNrU1M0TWpOZVAvS2p4QXRTdWliNjE0SnRuYUZ1SFdqb09JZzNa?=
 =?utf-8?B?cmlva1p5UUVvMERwZEhWSm1ncndMaE14NUtUMlJjZVMxVXBoRkJHazhjTFdZ?=
 =?utf-8?B?aWJyNkVQbDlydkNCRUU2M2RidFFONFN0ZkQ0QTA2VVpyZUR2NjBNQ1RRR09S?=
 =?utf-8?B?c0VLSjZBQ08yVjNFYnRBbk9MWmdJcW5mZkhNUGlGbGlNdWpnSHpMN2k1WVc3?=
 =?utf-8?B?S0pBZmRxTXpFSExQdVJ4N1V0Mlhlc3dyWUlMclhobEEwbitzZjgzT05oWjhP?=
 =?utf-8?B?RkF0NnJ1eVUzRkUxRnJnUjZkVVI0c3BZTDdpcEJWdGRxMjc0Z1hJOWZraCs0?=
 =?utf-8?B?TGJPbkRVYlI2aTNjU2xmWUFKaTVWemhGbDFGU0JSZXFCNkJMbjhzeTdNanEv?=
 =?utf-8?B?YVBJdE9RRTIzZGtyTSttemRRYzJBZnJmSXA5Ny8yZ0NvR3V2Kzk4SWhvOG1J?=
 =?utf-8?B?V0FoelVoTGYvbWlEaTN4cjNDSHRYcHNaMkU0V2xZaC8yTUs2YjZ3MDFxbWgy?=
 =?utf-8?B?Yjk0OW5jV3U3NUdmOGU3SGFnc01RPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(35042699022)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EivjJekCLzibcKVV8bC3mh25USLWwk8tJLps3Hobga74Xr6e3ajzKQ3Wa3Sy5BADlQkhAGhLLTBNvwhjOKx9sEFMtDI9a/HAFZQKdnHEsuLUgNyr/LuuIDboC1H+UraS+ho/Ly3QBfU+MqRQ6/iZ8RGKPd669DbxRsU6m4Saz5Zi2A25m2bs1sZgbNQWAKGBaQCh19v/kRADdvLxtZq3rh0IqfjufoQYydaEfEI0qFIO9/oTNxU03fX68W1rw6Ks0MMFYK3PiAozEXBaGkTDQzWLZb+kEmGQaM6t/SCqFdrON9j2XNUjGDCVWIZjNG2R7n4J2zl8EFrT2X6Pavow3yNC3m17lX74lAKQmnst5jbQYrRWqNv+5AeP+EcCHejS8NBt0klDYR5Bkw1t9xPb0MwqlDjFQoMnWvs5XfD8KmufqiANUQexpbScjsVEqwlN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 07:31:35.1083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f94115b4-04b8-4199-297d-08de67ad4114
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[darwin.mk:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 6C8C710C761
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNCj4gT24gNiBGZWIgMjAyNiwgYXQgMTg6MjUsIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgRmViIDA2LCAyMDI2
IGF0IDA1OjIxOjQ0UE0gKzAxMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBYZW4gZG9l
cyBub3QgcHJvdmlkZSBhIERhcndpbiBidWlsZCBjb25maWd1cmF0aW9uIGZvciBzZWxlY3RpbmcN
Cj4+IEdOVSB0b29sIGRlZmluaXRpb25zLiBPbiBtYWNPUywgdGhlIHRvb2xzIHdlIHVzZSBhcmUg
ZWl0aGVyIEdOVQ0KPj4gY29tcGF0aWJsZSBvciB3ZSBvbmx5IHJlbHkgb24gZmVhdHVyZXMgc3Vw
cG9ydGVkIGJ5IE1hYyBPUywgc28NCj4+IHVzaW5nIHRoZSBHTlUgdG9vbCBkZWZpbml0aW9ucyBp
cyBhcHByb3ByaWF0ZS4NCj4+IA0KPj4gQWRkIGNvbmZpZy9EYXJ3aW4ubWsgdG8gaW5jbHVkZSBT
dGRHTlUubWsgYW5kIGZvcmNlDQo+PiBYRU5fQ09NUElMRV9BUkNIPXVua25vd24sIGVuc3VyaW5n
IERhcndpbiBidWlsZHMgYWx3YXlzIGZvbGxvdw0KPj4gdGhlIGNyb3NzLWNvbXBpbGUgcGF0aCBh
cyB3ZSBkZXBlbmQgb24gdGhlIExpbnV4IEFCSSBzbyBjb21waWxpbmcNCj4+IG9uIE1hYyBPUyBp
cyBhbHdheXMgYSBjcm9zcyBjb21waWxhdGlvbiBjYXNlLg0KPj4gDQo+PiBBbiBleGFtcGxlIG9m
IGhvdyB0byBidWlsZCB0aGUgaHlwZXJ2aXNvciBmb3IgYXJtNjQgb24gTWFjIE9TDQo+PiAodG9v
bHMgY2Fubm90IGJlIGJ1aWxkIGZvciBub3cpIHVzaW5nIGEgdG9vbGNoYWluIGZyb20gYnJldzoN
Cj4+IC0gYnJldyBpbnN0YWxsIGFhcmNoNjQtZWxmLWdjYyBhYXJjaDY0LWVsZi1iaW51dGlscw0K
Pj4gLSBjZCB4ZW4NCj4+IC0gbWFrZSBYRU5fVEFSR0VUX0FSQ0g9YXJtNjQgQ1JPU1NfQ09NUElM
RT1hYXJjaDY0LWVsZi0gSE9TVENDPWNsYW5nDQo+IA0KPiBJbnN0ZWFkIG9mIGBjZCB4ZW5gIEkg
d291bGQgdXNlIGBtYWtlIHhlbiAuLi5gLg0KDQpBY2sgdGhlICdjZCB4ZW4nIGxpbmUgaXMgdXNl
bGVzcyBhbmQgc2hvdWxkIGJlIHJlbW92ZWQuDQoNCj4gDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6
IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4gDQo+IEFja2Vk
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gDQo+IE9uZSBj
b21tZW50IGJlbG93Lg0KPiANCj4+IC0tLQ0KPj4gQ2hhbmdlcyBzaW5jZSB2MzoNCj4+IC0gc2V0
IFhFTl9DT01QSUxFX0FSQ0ggdG8gdW5rbm93biBpbnN0ZWFkIG9mIERhcndpbg0KPj4gLSBsaXN0
IGJpbnV0aWxzIGFzIGEgZGVwZW5kZW5jeSB0byBpbnN0YWxsIGluIGJyZXcgaW4gY29tbWl0IG1l
c3NhZ2UNCj4+IA0KPj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4+IC0gU3ViamVjdCB3YXMgInhlbjog
QWRkIG1hY09TIGh5cGVydmlzb3IgYnVpbGQgY29uZmlndXJhdGlvbiINCj4+IC0gVXBkYXRlIERh
cndpbi5tayBjb21tZW50cyB0byBtb3JlIGFjY3VyYXRlIHZlcnNpb25zIChKYW4pDQo+PiAtIFJl
bW92ZSB0aGUgYnVpbGQtb24tbWFjb3MgaGVscCBhcyB3ZSBoYXZlIG5vIGRlcGVuZGVuY3kgb24g
YW55dGhpbmcNCj4+ICBjb21pbmcgZnJvbSBicmV3IGFueW1vcmUgYW5kIHRoZSB0b29sY2hhaW4g
Y2FuIGJlIHJldHJpZXZlZCBieSBsb3RzIG9mDQo+PiAgb3RoZXIgc29sdXRpb25zIHRoYW4gYnJl
dyBvbiBtYWMgb3MuIFN3aXRjaCB0byBhIHNpbXBsZSBkb2MgaW4gdGhlDQo+PiAgY29tbWl0IG1l
c3NhZ2UgaW5zdGVhZA0KPj4gLS0tDQo+PiBjb25maWcvRGFyd2luLm1rIHwgNyArKysrKysrDQo+
PiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQg
Y29uZmlnL0Rhcndpbi5taw0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvY29uZmlnL0Rhcndpbi5tayBi
L2NvbmZpZy9EYXJ3aW4ubWsNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLjE3NmIyN2VhYzY3Ng0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvY29uZmln
L0Rhcndpbi5taw0KPj4gQEAgLTAsMCArMSw3IEBADQo+PiArIyBVc2UgR05VIHRvb2wgZGVmaW5p
dGlvbnMgYXMgdGhlIHRvb2xzIHdlIGFyZSB1c2luZyBhcmUgZWl0aGVyIEdOVSBjb21wYXRpYmxl
DQo+PiArIyBvciB3ZSBvbmx5IHVzZSBmZWF0dXJlcyB3aGljaCBhcmUgc3VwcG9ydGVkIG9uIE1h
YyBPUy4NCj4+ICtpbmNsdWRlICQoWEVOX1JPT1QpL2NvbmZpZy9TdGRHTlUubWsNCj4+ICsNCj4+
ICsjIFhlbiB1c2VzIExpbnV4J2VzIEFCSSBzbyB3ZSBhcmUgY3Jvc3MgY29tcGlsaW5nIG9uIE1h
YyBPUy4NCj4gDQo+IEhtLCBpcyB0aGlzIGFjdHVhbGx5IGZ1bGx5IHRydWU/ICBXaGF0J3MgdGhl
IExpbnV4IEFCSSBleGFjdGx5IGhlcmU/DQo+IA0KPiBGcmVlQlNEIGJ1aWxkcyBYZW4gbmF0aXZl
bHksIGFuZCBpdCdzIG5vdCB1c2luZyB0aGUgTGludXggQUJJLg0KPiBGcmVlQlNEIHVzZXMgbm8g
c3BlY2lmaWMgLXRhcmdldCB0byB0aGUgY29tcGlsZXIgaW52b2NhdGlvbnMsIGFuZCB0aGUNCj4g
bGlua2VyIGVtdWxhdGlvbiBpcyBzZXQgdG8gZWxmX3g4Nl82NF9mYnNkLg0KPiANCj4gSSB0aGlu
ayB0aGUgcG9pbnQgaGVyZSBpcyB0aGF0IHRoZSB0b29sY2hhaW4gbXVzdCBzdXBwb3J0IGJ1aWxk
aW5nIEVMRg0KPiBvYmplY3RzIC8gaW1hZ2VzLCBiZWNhdXNlIHRoYXQncyB0aGUgYmluYXJ5IGZv
cm1hdCBzdXBwb3J0ZWQgYnkgWGVuLg0KPiBXaGV0aGVyIGl0J3MgTGludXggRUxGIG9yIEZyZWVC
U0QgRUxGIGRvZXNuJ3QgbWFrZSBhIGRpZmZlcmVuY2UgZm9yDQo+IHN0YW5kYWxvbmUgZW52aXJv
bm1lbnRzIGxpa2UgdGhlIFhlbiBrZXJuZWwuDQoNClRoaXMgZmlsZSBpcyBhbHNvIHVzZSB3aGls
ZSBjb21waWxpbmcgdGhlIHRvb2xzIGFuZCBmb3IgdGhvc2UgeW91IGRlZmluaXRlbHkNCnRvIGNy
b3NzIGNvbXBpbGUgYXMgdGhleSBkZXBlbmQgb24gTGludXggQUJJLiBNYXliZSB0aGF0IHdvcmtz
IG9uIEJTRA0KYnV0IGkgZG91YnQgdGhpcyB3b3VsZCBiZSB0aGUgY2FzZSBvbiBtYWMgb3MuDQoN
Ck1heWJlIHdlIGNvdWxkIHNpbXBsaWZ5IHRoZSBzZW50ZW5jZSB0byBub3Qgc2F5IGFueXRoaW5n
IHdlIGFyZSB1bnN1cmU6DQoNCiMgQ3Jvc3MgY29tcGlsZSBvbiBNYWMgT1MNCg0KVGVsbCBtZSBp
ZiB0aGF0IHdvcmtzIGZvciB5b3UgYW5kIGkgY2FuIHN1Ym1pdCBhIHY1IG9yIHRoaXMgbWlnaHQg
YmUgcG9zc2libGUgdG8NCmZpeCBvbiBjb21taXQuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiAN
Cj4gVGhhbmtzLCBSb2dlci4NCg0KDQo=

