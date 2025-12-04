Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8ACA360F
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 12:04:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177548.1501805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR78P-0001iA-5R; Thu, 04 Dec 2025 11:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177548.1501805; Thu, 04 Dec 2025 11:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR78P-0001f2-1T; Thu, 04 Dec 2025 11:04:29 +0000
Received: by outflank-mailman (input) for mailman id 1177548;
 Thu, 04 Dec 2025 11:04:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Aad=6K=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vR78N-0001ew-Bw
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 11:04:27 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe4b0129-d100-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 12:04:25 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB8035.namprd03.prod.outlook.com (2603:10b6:8:251::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 11:04:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 11:04:21 +0000
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
X-Inumbo-ID: fe4b0129-d100-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPxDfVnmnDc7apefS2SiALy6Kod52qSvVOFQr9gfkc5MW6ZLDViE8z81sdpgoMLtg0bwhOoz2SeqW2PE68JgRAdPoem/TO0iWUcjaqav6jSWpxnZPpSabRkDrh+mLpWOfORCS8R1ypat39hiaTge5AoHYwQggGU82z2tHAgOKnwktb4UuniK7lMIMJoD4H4mNSYITxeEIEQuEnHuRh1OpNiFZ0ba3tlpRjJiMkBUA7e7lm+kG+5uH/LauTfUTgONZ0cauQrNUNJQmDEBCbIxhmwovx7wNNTQfIHFR9XUpPtsIixctojr+F9+doG34k9WyaKrgArt4SWbpaCqQ9XqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0FAfFcfBdNIzlPoaVvY/jhhnCGlO+Zj8XqHcuF2AbY=;
 b=nq8RNg6UpRh42a5EsGshsYF8qkB0D4UKkP1HGjTkhAS0ZP/cfmaH4TBdFy6mZi7+XfBadFXVS0K306vU9ETrAZxvoMTDn6xaM1fZxOBatcTy92NiQEdnzVy+2QsrmUyPS2t/IKim3GBF99quVEMmxRt8mLHuCWiwE8WMZvWn34AevwhhMKtjbhGyJHiCBKVBAJli8485hOiITptRvn4dEOl49IpfxexFe8gOueeAC+RUnAmVB6+Ynxr3iJuqM/2Wti6VlR5d1AouqIeMYC6jsf8AYspCMF3XMKEJAX7b9sCNnAx/pcuTBQMcy3fFkaK46rHSNHlK/7QaIx8XPBZ7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0FAfFcfBdNIzlPoaVvY/jhhnCGlO+Zj8XqHcuF2AbY=;
 b=CQOH0edsq+eYM+/evJ3pcxADS36cYpvAWO8UXIWNHxFY7gUlihAiBWE+k3eWjEwbqAxZ0sW53mGipymLQrqRIqUDVlkNsJZ7cVbqLM2ABUtfaT/H3CBDbRAgVnQVPWFnSMrCURimyH00LYH3mHmRgp6fysO9bhISyBTLmG0rTiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 4 Dec 2025 12:04:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <jgrall@amazon.com>,
	Elias El Yandouzi <eliasely@amazon.com>
Subject: Re: [PATCH v5 11/15] x86/setup: Do not create valid mappings when
 directmap=no
Message-ID: <aTFqsYBsI5WheTX4@Mac.lan>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
 <20250108151822.16030-12-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108151822.16030-12-alejandro.vallejo@cloud.com>
X-ClientProxiedBy: PA7P264CA0190.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:376::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 385a976f-6b4f-4778-d8a4-08de3324e090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFlRdHNyNENJazhNbitZbVRBVXZFWDlMaWpaSU5JUmE5Z1FnM21JZ3k4WHph?=
 =?utf-8?B?LzBhWU03czVjbGpQdUxNQitrdm5rOTdNNVpwRmNxY2dpTHlmZTdZdVc3QzdE?=
 =?utf-8?B?cFp1cllXRlh2d2o3N3pEM25QUDZYbERlTzJrWlNiMk5DUEx5QjRldFJuSGNX?=
 =?utf-8?B?MHRxdk11eENTZWpicHpvay84RnVqN214YU5MUHBkYW5Kc3g3aTA3WFlhU2x5?=
 =?utf-8?B?UCs5dWtpY01nbHhZRzFIL2JHdjlFOTNCemdYRHdGS0NDaEpjaE9ma3ZNWmdK?=
 =?utf-8?B?VjU5V0JkNmpaSHB4WXhpVDBGQWlRZXJUb2x4T1VicjI2R2ZXMTRIbnliQ0hC?=
 =?utf-8?B?c0JSbTQvbXFlSUdHU3M1aUdYTXFUWGM4WjN0SVVNWUxUQ1drdU9hL1ZtcmIx?=
 =?utf-8?B?QkVpbzJkV21FaDkrN2grbTY4L0twZTBoYWY2Z3BzeWlTTndCRGx6WlF3c2Nk?=
 =?utf-8?B?TUNieEEwa25hVDBGWTBJRWJJelNLMHBJTytXSWpXTkw1K1ZYN09FVGVnT1BI?=
 =?utf-8?B?YXBWNk1tVityNkJaYjdQajhlWCtRckQwbjVKb1NXdnVHKzlxQlgvWlFNRm5N?=
 =?utf-8?B?bXBDeUZMak5ZTVZuQlAyQ3NIVUJ1ellKQ0JXVGV2aEFWSUY5d1VlV1ZyNEVJ?=
 =?utf-8?B?WGNzQTF3TStpcGFiY3RVU1QvUkhBaXp1Skc4QU9PQ3Nob2Y5VXRmZ0lSdzBY?=
 =?utf-8?B?UlI0ZmxmZmFLVnhMa0ZFVVlVTUptVTRkbVlFU3JwNldyWEdGbzZxdGlESHU2?=
 =?utf-8?B?Z1g0VThudVprMjJZVkUzMTdvb2lCcTE2Wm9wMUU5cHFNUmJlT1pld1lpRCtu?=
 =?utf-8?B?ZUZLemJla3pDNWo4WEdSSGFFVkh4L0x1YTFWK0RWRTVaWlQ1T0dUeFZtTlli?=
 =?utf-8?B?MWxsbC83Q3N5K242ZlJWb2lMWjRHN01kZ3pqNE03ZXNmRHRNMnhKNkhVUDVi?=
 =?utf-8?B?dzVwV1lsYTdSQjVVZmYxcHVzYmxUSkYxZWV6aktOVi90RjJRdXNBYlpRN296?=
 =?utf-8?B?Wkgyb0JjU0ZvSE41dExvMTY5ZG5yZmdibnZvKzl1M1NBWk5ONmpPcHh5eEJT?=
 =?utf-8?B?SHBQdWJOdUk3bTIzekp6ckRQUDNMYlZWTVJWU1RFZXJFcG1TL3BxaUcxQmFj?=
 =?utf-8?B?S3hVOHZ1ZGpaUlVIM0Y4Ty9hc1RlSVpGbFg4SlhTYU5kZnlnWGMvYm5JSGdl?=
 =?utf-8?B?SlRjc2hZaUVleVJWSHg2RUpMRzZxT00zcGtjcEJaeDR0V284SzhJYmdGdm84?=
 =?utf-8?B?UWcwb2UyNGV6d0tTeG5OeGU3bXIrZER6STdnVzRnR2hCcWVyTit5VTNYQVlJ?=
 =?utf-8?B?clYrVFZGWkRuTG9iTVNqZDRMR2wwL0hUS3VnaUlVYXBJZnJRMmpQdnZldkpv?=
 =?utf-8?B?ZEU1N1BBTjFkUGhQV1hYVWNpR0ViaktVYVByWXN2ZktYSkV3NUQ1N21SeEtT?=
 =?utf-8?B?aHZFeXJvSkRhZ3dVamNkTlg0UDIvZVBsL3BrRC9TNDAvMmt5Rm5ZenN3ODZ5?=
 =?utf-8?B?RC8vRWRtb3hWYkhUV1k1NUZDMVhxZUF2bkdHYUpaZWRLVzZYd0VwTmo3dUhl?=
 =?utf-8?B?WnZIWmZpUDA0M05XeHNDZFZmT1pEcEdSY3dxSWhlZExJcklMT3IrWTduQ3l3?=
 =?utf-8?B?Q05oaC9nVlVYZjV6enlKNU8zMytwMW5yeWIzRmFMRXIrNTdXb1dJaXNHWUZY?=
 =?utf-8?B?OWx1MTlGb3Q4WnpnV2ljV3ZBZ0ppUlh6VjJrZ25lek42ZFkvZ012VnA2a0kx?=
 =?utf-8?B?OGVPTW1aZUZyS21pQllkejZxZmxKSGhubGFWcktmRDJ0Yk9weUx2Z05CVlVw?=
 =?utf-8?B?Y3hjaFp0bHgxY0dINnpHd1JFM3VkaTVmRmlrRzFZdDFTWWpGQWsyREJVSzVX?=
 =?utf-8?B?RWZaaDdsekVXQW1wVi8yVS9qeTJZMUl3cUtmblJsYlVMTG02dFNsaHh5VlFi?=
 =?utf-8?Q?lbsfruYZ9WvqQmhqVPVrMz+AW6A3eX9f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjhDZFYvejJNdEJiYW1ib0xRWnZ6WmQwZEgySVg1R0xUd3F3dVh2T0hNMmJD?=
 =?utf-8?B?clh2dFMwRHpaU2VmMllIWVBIOXRvVWZlZFJia21rUzNFMTkrbmV6aWNYamts?=
 =?utf-8?B?Q0JMUjNrMUZVbzREYWp5NXR1WUlrS25VRnFOY0lIVitBZ0xzOFVSd0pydDJT?=
 =?utf-8?B?Vmc4cWIzbUN6Y2s4cENHdUJadElwcStYL3JidHpQWCt2MXlVMjYzV1FYRzJI?=
 =?utf-8?B?ZmJ0S1BXa0ovM2pxSncxVzFJTUZhaXUvUVlLcVFGeUd0Z25pTTh0Skk2RUNk?=
 =?utf-8?B?RkM1R29YZ3g3cFdoT2cyUHlvZDhDalNsM0FSczNobXUyOFNCdXBUUjdBMFYz?=
 =?utf-8?B?bjhqNXdyRnpJZ0g0YVpjUy9URG9RNWFJOGxPRUtwWitMakd3bHZvcnl0SVY4?=
 =?utf-8?B?WG40dkplM285VEFVU1JGUWQvZlpKUm1WelZWS2tBQjZ6bC9LY1h1NmdFeDN6?=
 =?utf-8?B?dk9JaUthRTYzOFRiTWhmWG5XUXFyaDVueGtEak53R2UzbG5nVkd6dEtWZWtJ?=
 =?utf-8?B?dGJmQ29SdTZPNDhaZTRpUWJNRFljc3JEVy9uNzc1bTlxUUxpM1VIeHFxYkJ6?=
 =?utf-8?B?Tks0MmNzazRzLzhnb3ZpbTFKckpPRWZJaTh5MCszNkpJekJvYXlySEZyM2U5?=
 =?utf-8?B?ZzJKd3FmcjBId2dZM1ZVUENLRUp2YWsxQ3RUOENJWmFJci9TdDFMKzF4cEpT?=
 =?utf-8?B?Rm5ueXRrMndOeFA3WlkwQnJ4bkRtWDFWMjNLa1ZWQllRb2xWaW1kTExwT3JF?=
 =?utf-8?B?RzFJd09zRk5iVHlFOU9wU2tYcDNZMUFtSXA0SWVNUFV6dW5yVTErZGxjU2NI?=
 =?utf-8?B?M2dpSXZOMGwwUXhUNkQ1aFVLQS9XWDhPVTNoQVJiSU9MT2NmdlUxd1lZaDZV?=
 =?utf-8?B?SXlwS0JxSTF0V1J6d0hPcHBjakViZFNicjh1QlJRNlpnWGNpZW1nMk9vb1N2?=
 =?utf-8?B?aVhDUjdKRzM5aU96MW9RdkorWkpYd25mek9xUnVUSGMxT1pSb3BRY0QzdXZY?=
 =?utf-8?B?Z2hEQ1pMMks5VmptR1FLUW5nRHE0NFJ6K25LZFBDeGl3WnY2Snp2Rk9DSDFP?=
 =?utf-8?B?K3ZPUVdDZjFVS1FxVnI4eklUL0h0NDZNNERyR1dVek5NVU1XWW92UFhrbGht?=
 =?utf-8?B?WC90cVI4RWhiZlpzN2F3NGVZaldUMktEc2dFS05IMndiQ0FrY2JicUR6MGll?=
 =?utf-8?B?OXNtUlJwMjdDNHRWcmU0WnhGWHNNUzZzZVZtVG1Gb3Zobnh0VngxUkhremtD?=
 =?utf-8?B?dFFhUDQyT2hHZWJLQUpVZ29obElSNGE1cFgzbGtFRDF1Y0NpdTVyRVFLcVQz?=
 =?utf-8?B?UG1WL2R4UmZjbXpsWEE4cncwYkNCQk1Odi94OHZtcGN1Wi9BOXJFUEhBcWk3?=
 =?utf-8?B?c3hGazVhZzh0WjAvUzBTQjhFRjE1UUZ6Q2tVOUtldmVaY3JtaEpEUjZ3RXBy?=
 =?utf-8?B?dkhJU3NnTXQzc0RGZlErN0o1TFFkSkFlM2dFdTJaMndOcTdVR29MVkt1WkRD?=
 =?utf-8?B?YUJxeDNUelU4TUI5am01SGRwenh4QzZrMjFobjhIMlFwUk12OUV0dXlzOHB6?=
 =?utf-8?B?TXo5eEp0UkJOV2h5M3I3YjhseXVZR1V4TkJxK2R0eWk5R0ZaNGpLcnErQ2pN?=
 =?utf-8?B?WlQweWQvYVBpeUlaRFpGait4dGU1QXorYnRDWU9QaytNVS9PeDhxcm5qaEhQ?=
 =?utf-8?B?aXhtQndPSDEwK2pUdng1WmxhZUIyN3VBQUFpeEs2OXFuWlZTRnJQOVN0S0s2?=
 =?utf-8?B?ckFzb1pJV3FKUTMrTC9vRGMyeDB0dkl1TS85WUpFOUdjdGxQbFRrVlJESGh4?=
 =?utf-8?B?eVpnSkltYkxaN1JZMkxjK3cvQzBpSjFnRWpKbDd3UFEvM2VTVXcyUElMbUo3?=
 =?utf-8?B?SnZKMTZIWUNVWk1XcTNQK0M1WjlhOXFNTGJBWUxURHBDNkUyYmpEZ3l3T2tw?=
 =?utf-8?B?WXRFRmpWcmNsdk5XR2ZSM3A2VG5ZU2k0RFhmTVdGVGtiRzZQZ1RDZ0VTeXhm?=
 =?utf-8?B?NHFUYnBYR3htWmtxaUZPRWo5L080WjZ1YUxiZ2g4N1lkTEExVFFqbThTQjFp?=
 =?utf-8?B?OWQ1bnljN0M3VUtjMWRuME4vRlpkTVRBV3p1cys4L1lpUGZuWTB3QkNzUENv?=
 =?utf-8?Q?R3xNN2qurF9Vhc3113Vpka9FS?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 385a976f-6b4f-4778-d8a4-08de3324e090
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 11:04:21.4841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQSNjS6P8N6PnUThNNwN/dEy4gjgxKL9SLfyd3vyPCBNfVY0DW9f33z4QHgo4miJ1IZ2JCGJ3MDpZ8RUZAhyeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8035

On Wed, Jan 08, 2025 at 03:18:18PM +0000, Alejandro Vallejo wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Create empty mappings in the second e820 pass. Also, destroy existing
> direct map mappings created in the first pass.
> 
> To make xenheap pages visible in guests, it is necessary to create empty
> L3 tables in the direct map even when directmap=no, since guest cr3s
> copy idle domain's L4 entries, which means they will share mappings in
> the direct map if we pre-populate idle domain's L4 entries and L3
> tables. A helper is introduced for this.
> 
> Also, after the direct map is actually gone, we need to stop updating
> the direct map in update_xen_mappings().
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v4->v5:
>   * No changes.
> ---
>  xen/arch/x86/setup.c | 73 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 66 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 609ec4cf07f2..23b77f13bc10 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1060,6 +1060,56 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      return d;
>  }
>  
> +/*
> + * This either populates a valid direct map, or allocates empty L3 tables and
> + * creates the L4 entries for virtual address between [start, end) in the
> + * direct map depending on has_directmap();
> + *
> + * When directmap=no, we still need to populate empty L3 tables in the
> + * direct map region. The reason is that on-demand xenheap mappings are
> + * created in the idle domain's page table but must be seen by
> + * everyone. Since all domains share the direct map L4 entries, they
> + * will share xenheap mappings if we pre-populate the L4 entries and L3
> + * tables in the direct map region for all RAM. We also rely on the fact
> + * that L3 tables are never freed.
> + */
> +static void __init populate_directmap(paddr_t pstart, paddr_t pend,
> +                                      unsigned int flags)
> +{
> +    unsigned long vstart = (unsigned long)__va(pstart);
> +    unsigned long vend = (unsigned long)__va(pend);
> +
> +    if ( pstart >= pend )
> +        return;
> +
> +    BUG_ON(vstart < DIRECTMAP_VIRT_START);
> +    BUG_ON(vend > DIRECTMAP_VIRT_END);
> +
> +    if ( has_directmap() )
> +        /* Populate valid direct map. */
> +        BUG_ON(map_pages_to_xen(vstart, maddr_to_mfn(pstart),
> +                                PFN_DOWN(pend - pstart), flags));
> +    else
> +    {
> +        /* Create empty L3 tables. */
> +        unsigned long vaddr = vstart & ~((1UL << L4_PAGETABLE_SHIFT) - 1);
> +
> +        for ( unsigned long idx = l4_table_offset(vaddr);
> +              idx <= l4_table_offset(vend); idx++ )
> +        {
> +            l4_pgentry_t *pl4e = &idle_pg_table[l4_table_offset(idx)];

As we are attempting to integrate this series with the per-CPU
mappings work, there's an issue here.  l4_table_offset() call is
duplicated, as idx is already the L4 table index:

        for ( unsigned long idx = l4_table_offset(vaddr);
              idx <= l4_table_offset(vend); idx++ )
        {
            l4_pgentry_t *pl4e = &idle_pg_table[idx];

This probably went unnoticed in small systems that can fit all the
directmap in a single L4 entry, but does explode on bigger ones.

Leaving a note here in case anyone else picks this up before a new
version is sent.

Regards, Roger.

