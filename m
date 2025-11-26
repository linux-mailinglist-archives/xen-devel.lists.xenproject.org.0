Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECADFC889E9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 09:25:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172373.1497448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOApf-0007eM-Kr; Wed, 26 Nov 2025 08:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172373.1497448; Wed, 26 Nov 2025 08:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOApf-0007bh-HQ; Wed, 26 Nov 2025 08:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1172373;
 Wed, 26 Nov 2025 08:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wUbM=6C=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vOApd-0007bY-M4
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 08:24:57 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62eda140-caa1-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 09:24:55 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by DS0PR03MB7629.namprd03.prod.outlook.com (2603:10b6:8:1f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.20; Wed, 26 Nov
 2025 08:24:52 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 08:24:52 +0000
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
X-Inumbo-ID: 62eda140-caa1-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQTFk5m8aRiT0g+ReGp2ksuVlwR9jvgVKqkEib/+kFvMNZ83O70pOGk44ocuqcHJaDRerSJ3+6ncyJBrlEV/J2FpE0waKvRAaytc42zuVoDwr6VrcoKCSIckb9Ya5wP036XMICntLv3TUubfXXH+sSeyWEqfXyxV6DfY5PiVouP4OMMawuYt9y2OZ9dzThp+Y1FbZ8x5UAeagvDXZoym797jVCpPF3nAv2lkZj3ozqgdCZRMM72emWrY2dPu67DcD9gB6PfdViZGrmUUqF/0k1WlUFGXPmyoclNckUlSYa8q1SyOqB7Wimtvsxj0vAEb3Nn51A4uU+wbsxAun/lmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eupPBkUMRbSsxUj1BjojkW4iyUEmlpMAJsfZgniDz1s=;
 b=XA6DXA4VGhHCVOYyXH4+S/51MJUQtJIN57AWBopZzzsf5P/8bFxCaXJ1qvhu2sWC31v69+VWtusTSmCRF4FdZcpMnIEV7RomVospA5LDQ7eVUYS1B3q7R8GJZERbjgje2dW6o4qfqzAzvAD9oOpeN4A2c4UsV2+SMiQHPsWh3dAHZAA16JAnGisi852v2nhX/jgCUsitPOr5z62yEO0qwnIT153oNOFWX3ciED39KsMaucXFPVA9yctHPHYnXFNP1G1i7+fQ+cTObbWesOxsZ6N58yOw/N0Sqk4LW/s+mXkvQNDS0OO2H3ru523rfoLpRENsLn+6IRMdGXoA/OHlJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eupPBkUMRbSsxUj1BjojkW4iyUEmlpMAJsfZgniDz1s=;
 b=U8dhiFGqQ3zoNrlEjvEfXdVgV55sJNWs37Pe4QPf4sy/oKADnsdlOHqUlFKKxGkd5PiuJ/J3nbOJmwOd1CNVP/y6MaaaBXGBLprKXMbvnE2hYL1XqEHSZbg+t1MVSNmcJ209xuI602kUdt3BbfGZaevdbT9gQ89bLhGo0e3MwYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/msix: fix incorrect refcount decrease in msixtlb
Date: Wed, 26 Nov 2025 09:24:44 +0100
Message-ID: <20251126082444.45617-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|DS0PR03MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: b11b2a7b-94b1-4757-8144-08de2cc5452e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmszM1k3MHZhTkMzTS9NV1Q5RExyQy83UlRjbkt4TUgxby9uNlg5QkpRU3k1?=
 =?utf-8?B?MzAxN1N0aW9CcTY0Z3BGQUs5d1JwNFZVU0V4Sy8rVHZIejNEY1E5VjY5dFFk?=
 =?utf-8?B?azhENHNqbDdrTDZRVWdjeURpeCtDV21pRFBjdVh2ZHdpekUyUFdjaUd6V2hi?=
 =?utf-8?B?aGhRSnh6Mzdtd3k0d2ZkbVJDREZ1NmVuMjVHNFFSTlI3djR0ZzFxSmR6K285?=
 =?utf-8?B?bzJDbm91YldlS002M3d3ZE5CSi9DdU1FUjB4Z1ZzN2dJdzBRY2pRNXRmNSs1?=
 =?utf-8?B?cU1kTjJMNzJkRzExNnJpTHpEQndXWjIzNGk0SHl5d2o1eFlSRkpEampENFpB?=
 =?utf-8?B?eWx0YWtMTkt0cTBZa0RhN3JyNm9sQnBNd1kvOUg5UjNzbWdrMk1RcVRQYWlz?=
 =?utf-8?B?c2pPWjFZY0hEQjRvNzRTOHBVOFdRazgwL2hVQllHZnNFdW1BVkxnQ1lNc1Fo?=
 =?utf-8?B?VGNMblpiQVFSTGxzTVBLTlhMbGNjRWI0c292cWZoUHhiL2w2MnRaTGZkc3J6?=
 =?utf-8?B?bTlLMXdiTHdFMGRENTRMZWtvaW5ab1JVcU9tYnU1ak1xbGZzL0RhZWRXd1Vv?=
 =?utf-8?B?WTJOU084azJoTm9weTlmVDhHNmwyckV0NzRHQ3BTcUJtZFZ0b0w1VDdjTytp?=
 =?utf-8?B?RjBmNlAwUFhIYUFLNGN0bGhmYTk0bHRud09Zb0xKY1Z4RXlPdXBOemtXTW51?=
 =?utf-8?B?Y0c3OUFzYzhOdXlDTHZ0Q3lMeWtBYTNUbnBjZjZObkZIUVVYNUhaTk5EWkpH?=
 =?utf-8?B?ZkV0bGpzTjVaVDRWZ3JsME1TejRmbWsvYU5kMFVtYlBtcEdtM0tKc0ZNVDYv?=
 =?utf-8?B?Ync4ZDJ5OThZVWFCdmRWeVdycm8rSDV1VllsQnA3S1hTdDJNTjNGR2hHaTNt?=
 =?utf-8?B?eGNxazQxcE1YVUkyQ0ljdXloQlNmWFd2WXhTbG16Y0V3UDRZZUFoSmdHR3Fh?=
 =?utf-8?B?ei9Sc0dTMG5JV2hDUTFTTWhoVWlEWXFJL2pEb0hYbUtrS0VBTUFzWWFMK20z?=
 =?utf-8?B?RHdHbmZidnJsZE95NlFkM3V4R20vaCs4VW9zTXJsU0VvaFd1RTFxeVNVVkdo?=
 =?utf-8?B?QUdyVzdxdUE3S0p5MHZRSGdDS2NrWmhwc2dxUlRNeW9STG9pM0dieHBPaGlP?=
 =?utf-8?B?K2FmVXhlLzBPY2RmL294enJHaVZyR0NCMG5lVXc2QWRNL2pXM0ZockRpTWVG?=
 =?utf-8?B?MjBJWmt2ejVZUXlPK0VFM21NZitLTjVYRmlFOG1VVmdvMjNqTkRWZVhrR2Zj?=
 =?utf-8?B?azZmZC9jdnpsdktVS3Ryck9xYk1iWkZCa3llQTNYNGNRTXFrWUxGREpnWGRw?=
 =?utf-8?B?Q3piUE1Pcnd0TVNseTBvZkMyazhMci9FNGlrSXp1R0ZMTmllZnVyM2JvNnRs?=
 =?utf-8?B?S1Y5TFZUdERBWDhxSHY4WlVpcmZ0TzBUTm1hOEFOckFQQmtjK2syK2YxYmN4?=
 =?utf-8?B?eGZYMWdsamlSS3hNODJ0N2xKK0sxSkUyRHhxZGRCekVRMEhQM2hNSnFKNWQ2?=
 =?utf-8?B?RkVtQnZuZG9NZUJ5Z0pnZXl5OUlhQlFrdDk2ZUhxRWFPNG9FbnpGK016c1lZ?=
 =?utf-8?B?YVNUTEVsalZabnM2Zi9XK2VNOTFWMlBIaXVwYmxlbWtNSzh4ZVh0MHc1YXRk?=
 =?utf-8?B?N3BiQTJUenBsYjFWeDhpMTgwZTFEOVRZRlFxeHlzdzVyRkFHY1RneHl2RjQ0?=
 =?utf-8?B?dzlEZ1BYY1ZobXROZkZRWkFuenQ1ZlBRM0dQYjVKOHpJWUJDS09iYnhSWEZx?=
 =?utf-8?B?Vkg5U1I4Ri9Ka2hWQXp4S0tza3NaZVdvVnVZeHYyMU1LWEEzY29xdHFyT1dn?=
 =?utf-8?B?YXpvWjcvc2pkMUdkbXVJSG5mN1NVVnBSWTlSK0dUTk1nQjNZZWdVTEMvbzBo?=
 =?utf-8?B?L1BnUThPNjJGRGloTjltb1dkenc2NjBMWWtrOUs3MGFBTFRScG9iMnZzVzdG?=
 =?utf-8?Q?csggOkcjG4cGyhXGnjdPpqhdwOp70jw8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2dGcTRFaDlXaE16dTRrZEYzRlYvNmR5U3pueWZuVDRybHNFaU9SY2JkMHEy?=
 =?utf-8?B?OHNnN2lWNmRyc0RmczRSTXM5blN4RWJNanJndDNMWmFlUDQ5dTFtYWRma25a?=
 =?utf-8?B?Z2J6cGR1bUNSYXkxd1RDb3dQcHdhNTRGZzJyVXlTS3dVL0xOOVFIbGtTNUd5?=
 =?utf-8?B?a045OTQ1dGQ4LzZjQ2crQnZRbk5nengxcnlXRTRxb2FURGpXOXkxU01mVWRo?=
 =?utf-8?B?TU5qVXV2NXdMeTRONWZEaVF6RzA0eVVvWlBFSVRnVlV1WVZoNW5xTFBmaTNC?=
 =?utf-8?B?bU9YY3oyVUVMcXNIaTdOVmxFQWZjVmFLbVQxY2s5b0h1eHV1NG1wZ1k5U3JN?=
 =?utf-8?B?ajArb0MyMnErWHU4ejEyd1V0amhZZXE1S0RsNEg4aFY2a0ZLNUJ6a1BNTUxH?=
 =?utf-8?B?clRpUFc1MnNiZDd0VDNCY1B2QmxLT0pCdkdWWno0TFhYWnl0aHNFK2lqQlRF?=
 =?utf-8?B?WnErMGtRZm9YUjdLa3RYb2J4VVhaNVVmUDdPOWFMZ295ajE3cjRCN1JDbENo?=
 =?utf-8?B?TEY2UHlSN3RSNnBNK1h2bk9kVGFTSUZuTE5BMFlvNUlPeUJqNzNoZ0xqdnRE?=
 =?utf-8?B?WGN3STJGY3VqRlBxSTl2b2g2dkJzQjNVT1o5WDlaZDg4SFN4bm9SRm1MeDBk?=
 =?utf-8?B?TzJSTXhjTDFueEtjVUtVYmhZSHEvOVFPNE5SQVJTSkt6RFpjNkVodlBnMG0w?=
 =?utf-8?B?MTFaTnhuNXRMT1NMVmJuK0FvKy90ajNzRm9NSktMcmJReDhRZFAvUVdSSU82?=
 =?utf-8?B?TkExSVYyKzk2NUE0blNxOHI4aXEwdEQ2eHc5TFlkejNLclk5UERyNTMwRllG?=
 =?utf-8?B?WDQxdExjMHdKR0tzck1GeGZIS3E0S2ZnbUFtZ1hxeDF5U1hGNkRablIvU0d0?=
 =?utf-8?B?TkVoS3ZQQmhoYXcrSEZQQUY0Tmt0eXdhYnhzRFcrTnNhZnAvTmlSemhDK3BO?=
 =?utf-8?B?ZWJrbmFqVE5sQkMrdTJUTEc2MWdGSTJNclNHdGJSTWFDc0NVRlRLTWFxdXd1?=
 =?utf-8?B?VGhBcU1QOHM0UUszbTlMQTRsdkFRNUVLOUpBakt2eGw5MFNtMzE4eVVKblJX?=
 =?utf-8?B?SHZiVDhLeENKYW1JeTB3SjIxQkJtMEttelEwWlRjNjRQTVVOOFdEZXVBYmVq?=
 =?utf-8?B?Mlh5K29pR1ZzYm8vYmxWY1crbko2NytCRzdMc1JaYllCbkhuY0lCZ0daTDFJ?=
 =?utf-8?B?Q3haSDFiYjEwdXE4MGVENVNjaXliK09XSndJOXRNLzdJSGhkc3Uvck9taUhi?=
 =?utf-8?B?WkdyRzFOK3R0MVpEMi9lWmVTcHpYM09OSlNFdjQ1S2UrRkVzd2N6V0EySkFo?=
 =?utf-8?B?UGtrVWl0bnM3QkFSZHQzU2IzMnZJOVNuMFFHMDRUdHhlb1BhcW0zTGpjWmtU?=
 =?utf-8?B?YWdERUN5dWFVeW10b1h5ZDhGcVpCbkJnd0RsMUJOS1dQZ2hkWmt0cGZYNGRK?=
 =?utf-8?B?cWJES2RLODZPOVVUZmxnTWJ6bnpZbjdIa1hYV3RQZXpJckxtYjFLOHZkMjM2?=
 =?utf-8?B?YzhYb2lHYkNzVVNPdzlRbkJHUkc5dDRUeTI4bFZla3dIa2E1TDlNV09QK012?=
 =?utf-8?B?UzRHMFViUnY4bHVnYmFJR0hsL1licTBPMEZvM2RkL2ZXTGdkMG9JOFdFSXRk?=
 =?utf-8?B?MGVOZW5YV1dkZCtFRysycXFJZjFlYWtxZmJzRlpabHdsRWNoemo2M0l0alA0?=
 =?utf-8?B?YUI3eHcrWGsraTBzelJqaTJ0RzZoaVNBKzZCM0U5TGJYNjZheUVDdk56Y2RM?=
 =?utf-8?B?bW9raUd2Z0xiek52ZnhBdEhZQTNGZUdYUmY0OXdKd3hnamxUaWJ6UVdXRTZI?=
 =?utf-8?B?SVRLa01uUjRoeVNpbkpBaGIvRWJHMFFON09PU0taMlZIMG9IQml2cy8vR1Jl?=
 =?utf-8?B?UGIxclhMVG9ESzQrMXpxeldOSFRRTUpaUjhUQWJCYlNST1ZTZEtGTzdJcWxU?=
 =?utf-8?B?VjBnSVdIV2VnTVVpc0J0ek4vK0Qrek8yNS9RcG9FemZIWHRGWUJvT1l3NmNa?=
 =?utf-8?B?UzJ4bkdldUQwazY5SXFQT1U5K1NHeFNtRWlWSkxWclVtd3VaZk1aSEVmRzZi?=
 =?utf-8?B?U0dBTWdiVjE5MW9Edk1RYnBLdFllSWc4K0QraGJlczg2WWtqT3h4dkEvQ0Fp?=
 =?utf-8?Q?Hkc+6iBKRLoxOJZkBmMlZiwvM?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11b2a7b-94b1-4757-8144-08de2cc5452e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:24:52.2952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZuHhTBuAprvX0u5/hrrJRTuIkETuvf8wM3UnZZA/dMjhPsX4mUPczovXDOuk0E5w689pWPpq8rEULhhsRFzEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7629

The usage of atomic_dec_and_test() in msixtbl_pt_unregister() is inverted:
the function will return true when the refcount reaches 0.  The current
code does the opposite and calls del_msixtbl_entry() when there are still
refcounts held on the object.

However all callers of msixtbl_pt_unregister() are serialized on the domctl
lock, and hence there cannot be parallel calls to msixtbl_pt_unregister()
that could lead to double freeing of the same object.

The incorrect freeing with active msixtlb entries will result in a possible
guest visible malfunction, but no internal Xen state corruption.

While entries are leaked once the last pIRQ is unbound, the same entry
would get re-used if the device has pIRQs bound again.  The guest cannot
exploit this incorrect refcount check to leak arbitrary amounts of memory
by repeatedly enabling and disabling (binding and unbinding) MSI-X entries.

Fixes: 34097f0d3080 ('hvm: passthrough MSI-X mask bit acceleration')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/vmsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 32e417bc1592..27b1f089e20b 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -716,7 +716,7 @@ out:
     return;
 
 found:
-    if ( !atomic_dec_and_test(&entry->refcnt) )
+    if ( atomic_dec_and_test(&entry->refcnt) )
         del_msixtbl_entry(entry);
 
     spin_unlock_irq(&irqd->lock);
-- 
2.51.0


