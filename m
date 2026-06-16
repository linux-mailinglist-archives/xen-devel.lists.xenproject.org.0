Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QTX4Ae8PMWoEbAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 10:57:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB3D68D55E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 10:57:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=MFrdSsLh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338813.1599867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPbP-0005nM-8v; Tue, 16 Jun 2026 08:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338813.1599867; Tue, 16 Jun 2026 08:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPbP-0005kG-5y; Tue, 16 Jun 2026 08:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1338813;
 Tue, 16 Jun 2026 08:56:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZPbN-0005k9-Rd
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:56:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPbM-00FtTC-P8
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:56:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a310fc5-5cb7-0a2a0a5109dd-0a2a4507dd20-22
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:56:56 +0200
Received: from [40.93.198.40]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a310fd7-229c-0a2a45070019-285dc6285d19-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:56:56 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN9PR03MB5980.namprd03.prod.outlook.com (2603:10b6:408:135::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 08:56:52 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:56:52 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzviwhUik65yPIauuBtlJ71WC4DjhUMKM2TWS9DGPx4Pws6pg7pgj5ICtcOMi2aLdo1KnetTh/Pk2VzPaugOeFJlOVIHXPtdTfyF5y7Rh9TJ/aH8YObEmMxiNxl++7GZTn1MkdVzxusK4tQflelvU26lHDuRfcgjNCkjS1RVQm2HRgWcx5hGVh1gOjBGIrmASd1/6AKbn9cNvGKSaAi5xqWDqABbXK+L/F1dcMVii3OIbInPMu/jsf4YXMrFd3499TDlyNtT8fXPB2Dp/VXdLU1ejWTO9eHETf+qbJfRt2GBXUeYDhxYHRreNgcwuP0ZOxE3qk9J/hanCZTrK0nHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+TSV25DALnz94oXS6n5Wi7qRMedJIKxHFC4W9wf72Y=;
 b=sJFhw1rS3uCbc0hD2+NWX255qkc/F97Aus52SJRwWfFrNW5b0rcw1N+aoTi6jBTQilhd8uqVMuGhnbBBRl6IWeddnO3lsWgdQ6qef9qdbs6xbR+QxtkTIgHNE4d6Z6F6KGPxO05D4P8JO6a51pViV6AM7WD/E60Fos1GRypHQlY72g5KUY4G/XVVhd8IAVDsW4rHXvWzIbEETydDmkB1Xgc0pAwNpNrhao6srghk2rDxk/9dWu7ShHS9oQVDo2lrfOSB3Ir1lPVOhoS1h7qHqXLoYN840Lgv9Wv3dOJxVoq5LWVGKdpZDEZczQUZ+PFCOY2ZcpDlH0jyrH/SvrR2ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+TSV25DALnz94oXS6n5Wi7qRMedJIKxHFC4W9wf72Y=;
 b=MFrdSsLhn0F1f68PoiRpzzStjTeBkW7X6cw6CcZK3aQp4ZfB9jWjURix1YjXiQkyC1pQkgenrZTG2+JWr3n3K9+XiU8agAb8H0WfwEKJeV0Wx/ly9xT2F7vmyO7zojMS0iTZ/+nDWq9dXZzj7k6eZVxvVUepqt2B6UEpLSUVjsI=
Date: Tue, 16 Jun 2026 10:56:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22? 6/9] domctl: handle XEN_DOMCTL_getvcpuinfo
 without acquiring domctl lock
Message-ID: <ajEP0N9_VYAnPxKH@macbook.local>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <0e38793c-e201-4cbe-8cee-6cd26996173a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e38793c-e201-4cbe-8cee-6cd26996173a@suse.com>
X-ClientProxiedBy: MA2P292CA0021.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::13)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN9PR03MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 60738360-c616-4274-2c9a-08decb853553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	cAbGQtOuJlQrb88wwPz+bn/xPzU2Fa2LVdPT1ExeuMN23yy0IsZwR4g3h9bGfx7ziYZIY7RPp8ikbeL4zLJzc4nJ2N7R6OL92FRehvnke/9fNWtY2mkEHiRHA/iGnA34Wx5Q9eKL7pihogNnkze7JPqDnaL4UZTNggwTa4cEFW9k3K2UgZQPLvzWRZvjrDBtqNmUpQxLIYm7o4TIZQnCIgjfjhQZ8n0X63xQGdyL0+ow/wIw2cGK76caMB6LJ87SjXkqWaYheUUZX7hf1T9r3O5uL28iYmyylMHk4njflXZwuBmvqCvNLop8BBZdGCeew2yHeVar6DD/p4xZTtKgUUW8BCSJqzKM/FVYI3nZ66NgxjZ5PVaFtZbW4tDUG6nrGRY6rD+lay56Ak7EgzCbl8f/xcYkIPfQ5tsJg2IPldGxwx9KO5aufcM1MJrLUg04oPwjxTmacs7Pq3uNSjuqXpwHdPtPgwIJOCytOpRsS4eRGiKTeI67qmTQ9MJFgjVF6UNwFS3D8Y+2H13POfWjDIB0aG39ZFs92sr4ogW8es0V8If04FSAvW7GuG1fes0YS96lLkm6L1fzAJSBk5tQ9ECL6axetzvRQZ0SNiX1CZfS4jT4d1lcCHnyOpGMNEB3MJBaTUpL1znDnraK9D9pMwUnVLHFDD8L4nnWqZf3phpAuG1RkK7b1fljzx9BDvYf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1o0RTY2akxLM0NOR1AybWJic3gwbEdlVnBEYmZzTWRkR081S0haRUcrTnhU?=
 =?utf-8?B?QlJzUDU4amM1eEpoKzgwZEFCR2R2NHoyZFJpR215aFVPZmZ4UEhOQlJVak1s?=
 =?utf-8?B?UjJ0ZkoraEw0amczZStEcG0ySlFESUpZYkhFSHZWVThaV3lLTk9GL0ZtanRD?=
 =?utf-8?B?WW9Md1U0UDlsN2RicU4xMXhocjg4RjNEQkRKSDhRRC93NzZKVlQ3ekd3Tndq?=
 =?utf-8?B?RGdSMGFiTEgzYTBIVy9KUW1Id0NPY1YyWlRlOHRYTmpGelJHR3MxcnpuYzhX?=
 =?utf-8?B?R1JVeDd2b2QvSnlqejB2eG4xazA0dlZxdW9yZXJzVHN2aWZUblJXUjdNQzFn?=
 =?utf-8?B?bmcxVmY5YjA4ZmQyeEdtajdXSnJFcU1XNW52YjdOMldtOGowZ2NBRFc4dU12?=
 =?utf-8?B?dzR6Y3RzenhKayt6aDdFMDl2MGNkVVk4cVdzQnhUdHBJQmlrazNOWHVjR0R5?=
 =?utf-8?B?MEh0R0ZKK1dWYmhxeU9SaFd6VWxSWDdBL25FaVZOTmdFRWMyMlk0Z25xc1dr?=
 =?utf-8?B?QzE5cWRlMlFhY2c3QUMxYVBBalQ4Vys1K0tHY0RDSlYvS01sbWNVaTlhdmt3?=
 =?utf-8?B?cVZKQnRwMDduOW02cmJ3V01SdVZqbmJ1S0Z4QzRDYmF0ZE5RT09OYVppMG9v?=
 =?utf-8?B?MnBFTnpKZllCN1QvL0hublFiY01jZTlZaW5BYk5FOE95UlFrWG5BcndsR05p?=
 =?utf-8?B?ZVJBQ2wxMks3SmxhaVRycFlHQm53Q1Q3MkxlaWx6Ym5lUmlhTXdGZkkxUlZI?=
 =?utf-8?B?Q1NCOFBDMGVZRWdDb1lKWDZSMUhVb0FueWhMWWRYbjlhTnZmYXlTY3VZNjNv?=
 =?utf-8?B?R0RmZ0tXM3JPaG9EU2ZrQ1Y4cHoxanAvMHg2WGZLdW5EbTNJWENwUVBrTTNz?=
 =?utf-8?B?Q1VpYkVEaWwxQ1ZiZ25MVWs4RysraURpSGRGN1gwVGl3Z0FqNFlZUkVCVVkw?=
 =?utf-8?B?SEsrY2dscGFpVkg4MTQ5UVVwL0NEN013WktOOGRPck5Dc04zOFA4cDdiVTdW?=
 =?utf-8?B?TXk2dFpFM2Y3WjcvUGs4cFppVVlvNjBhdnk4THluOVJwVy84ZmdqSVp5THMz?=
 =?utf-8?B?VTBxUnZOYTdlMzhuUEMvRVRtN0xnbUQxMiswTXpBQmM0WCsxdWRTT2IxSGt5?=
 =?utf-8?B?MkNkRUtnMFhmMmc4dnYzRUVMc0crRGVTU2lHMTBVY0hXSy9KVU5FeUk4UnZC?=
 =?utf-8?B?a1EyU1kzaVZYWUZ3UVBQQ1JiU0ZIWForTWxmWVV6eU5CamxjV2Y0M1hKdHlu?=
 =?utf-8?B?V1k5NXBxZy9kTzFnTE5EbkNjRTdVQ1JmNmc2S3VnTGxnaTBMVTIxU1FnL21J?=
 =?utf-8?B?d3R6dUtRbk5JZS9PcEF3ejNQeVZqc1luQWF0cUk1aFRmQkNWRkFUNmwwS1Rr?=
 =?utf-8?B?RERkSHBRdHZvZUIrT0hudU9KdjdyWFJjMWpFNTJEeTdNeUVrU2tOcDRITWtB?=
 =?utf-8?B?dTAxVEt5aTFtR2FBQkptS0U1bW1ZSDloSWNWRFFzS3pXT2NjUjlzY2ppOEpz?=
 =?utf-8?B?VGdCanN3N1FUdCtRMVNsZEliUWNwSi9qRXpzMTNxTE45SE9DcTd3L2UvSVBH?=
 =?utf-8?B?VTBJWVY4SkUybERLWDBkOHlhYlVvY2dyN01RS0NyVjBGcUdwZldZdCtUbUJ0?=
 =?utf-8?B?WTV5NTNDZHNJa3lMclhoVWVzQVdpdHRrUHBWYk16WjlvZEVFOWYwWHpETEgv?=
 =?utf-8?B?cEU0OXYvdWZ4RUxLLzRGT1FmRFVlTkhEMS90Rk5oUlNLMFRBa2U3MzlBRlAx?=
 =?utf-8?B?VjBGTUdHN2FUd3k5Q3ladUV4NjV1c0YxTEplV3ZjTXJ4aTFHdGxvczhIWWR3?=
 =?utf-8?B?ZXQvSkpsSUhMbml4ZFlNYlJ0TlI0ZWhJUEFIcGp0YUJTbnljSjAwRW5JcUlH?=
 =?utf-8?B?bE1iZmNKTmc1WjhwMjBxZkRsS1VaeWx6VG5IdU1Hb0x3M1JUMDdjSXZLV0Jt?=
 =?utf-8?B?alEwZXE0ZVpPNkRJd1pvY0NESEthdHAzZnZpcWZmNWRqK0hySG9jZmRSMXJs?=
 =?utf-8?B?Tk9TL2taTmJXb1ZZUDVFenUyNVliNUxhYkh5bW5EWkk2aFltTjBmdjN1cXQv?=
 =?utf-8?B?cDlUY204NHVyY1NkdDlpQlRzV2t4M0dQajFWUlFLWll3eWtnYXhEaFdCaTlM?=
 =?utf-8?B?R0Y5MGNzZTJqQkk4RzIvT21DWWI3Yll0Y1dKUzhDOUI5VDJsTXFyY2V3Zktq?=
 =?utf-8?B?V00yejYzdExWcHJhdlFNN3BmdllrQW9USTM0MElCUEFXTlhaclhXalBQZ1J0?=
 =?utf-8?B?RnppaDQ5VFlwbnorU0FDMjVpcHBUV2N6VUErUUdXbFFpdXlTc3RhMXdBRjRO?=
 =?utf-8?B?bVNvR0VUTURYR0VxSStOaHFpcGY1MG9lbm4zNmhXbVkwVkJ4WTRwdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60738360-c616-4274-2c9a-08decb853553
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:56:52.0652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzJs9FNYXoEtEa41IEb9hFQaLs/y+0cS5fETtAlUSh5YsTgo2jLWyh0a6pDAYREqi4nOnT6aHnoCCf0I3K8rGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5980
X-purgate-ID: tlsNG-ef75cf/1781600216-21364C48-5D515B43/0/0
X-purgate-type: clean
X-purgate-size: 1841
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,suse.com:email];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DB3D68D55E

On Mon, Jun 15, 2026 at 04:15:12PM +0200, Jan Beulich wrote:
> Like for XEN_DOMCTL_getdomaininfo there's no need to hold the domctl
> lock for XEN_DOMCTL_getvcpuinfo. While moving the code also switch to
> using domain_vcpu().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tentatively-acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Some suggestions below.

> 
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -546,6 +546,33 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>      if ( ret )
>          goto domctl_out_unlock_rcuonly;
>  
> +    switch ( op->cmd )
> +    {
> +    case XEN_DOMCTL_getvcpuinfo:
> +    {
> +        const struct vcpu *v;
> +
> +        if ( (v = domain_vcpu(d, op->u.getvcpuinfo.vcpu)) == NULL )

Since you are moving the code anyway, I would rather do:

        const struct vcpu *v = domain_vcpu(d, op->u.getvcpuinfo.vcpu);

        if ( !v )
            ...

> +        {
> +            ret = -ENOENT;
> +            goto domctl_out_unlock_rcuonly;
> +        }
> +
> +        op->u.getvcpuinfo.online   = !(v->pause_flags & VPF_down);
> +        op->u.getvcpuinfo.blocked  = !!(v->pause_flags & VPF_blocked);
> +        op->u.getvcpuinfo.running  = v->is_running;
> +        op->u.getvcpuinfo.cpu_time = vcpu_runstate_get_running(v);
> +        op->u.getvcpuinfo.cpu      = v->processor;
> +
> +        copyback = true;
> +        goto domctl_out_unlock_rcuonly;
> +    }
> +
> +    default:
> +        /* Everything else handled further up or further down. */
> +        break;
> +    }

As you are introducing this here, we might want to also move
XEN_DOMCTL_shadow_op handling into this new switch block: with the RCU
taken and after the xsm_domctl() call.

Thanks, Roger.

