Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A0492700
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 14:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258480.445183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9oO0-0003mf-9R; Tue, 18 Jan 2022 13:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258480.445183; Tue, 18 Jan 2022 13:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9oO0-0003kp-5h; Tue, 18 Jan 2022 13:18:56 +0000
Received: by outflank-mailman (input) for mailman id 258480;
 Tue, 18 Jan 2022 13:18:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9oNz-0003kj-47
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 13:18:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eaf0670-7861-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 14:18:53 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-dJlZZHQGOQaqhyckG3fMNw-1; Tue, 18 Jan 2022 14:18:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0401MB2435.eurprd04.prod.outlook.com (2603:10a6:203:36::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 13:18:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 13:18:50 +0000
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
X-Inumbo-ID: 2eaf0670-7861-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642511933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rN/pcYDgKi9S9+FHngAonSfjJ4ZATOReaSHk9xDICYY=;
	b=TRIZszrc35EwDSvJF8Y00egyIqvFvH8Y9r3pzSRakPPK4LPA5NR7/S/etHxPDUiKofIeDX
	4d0xJ7FGwMlmlAQ1+ocDNvzoaASxmMh3is1aVPADYBGyPtlj/07Au/GvS1NApA6Dw7OL/r
	CK11baOkDwbbHHzhhAfXfsQdKVbQ1pA=
X-MC-Unique: dJlZZHQGOQaqhyckG3fMNw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIA0vu6nZGGNgpZpBvbEoM3My/Zc1jUJ/l5yyAOvYhaaC50EyXl43DQMVbajRia0KXsfGmT7pPt9R0VgvQfyAZBFpvIEtMGfIVbhZf6e9sfC28Ci0asroGnEGkJZ+hk6WBXt6SbFhr+sKh0ZY1vGYpSo3mAea7WOwGhsZ7OGZBRvciFpvbi2qQrcWq/J46nqSzuVdUULeS030mF5H/4M5JY6W8Oava44aNPl2ux3wB2Z6yGIaa6qCvqUQX2JDPMmTftJh2jIknkLWWYxX9BbuhFoyppeBMZDCKSqyn3BwzuG0FK6xlJg+fUwR1Xlm0WkbicBTl7FwEjcdEciFjqdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN/pcYDgKi9S9+FHngAonSfjJ4ZATOReaSHk9xDICYY=;
 b=TIgL/RVyYLbffxJMqZL4dMWtyXTeFvf76fUiBcAi+XXWFyN7Q6XLSHO2wmgfel92GuQWHXU4Cg9hq+ndqi1Jcvam0Kp1jNea+jzS6M7wMoyiy5C1nQDORpBdl7WDDioCedDZv6rGD4M7cHFltaH0O7O6j3dXUhH7BRq7G4+IePqUcHdR//hRMNgdHVjVE8sILPPiwK2BIVvJastaLglhHpeoBAvgcYEbv5HWRvSWbEQE2/CUWExqaxfPHCWrc0rf4tSmyXr0lCD7tn4PS5Da90XonC6C3Igtqq7ERvcta3iPuS6byx0WvpyM1f7/zbbATjpcyzAFa1f+PeuemdEvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <954ed59e-7c7d-c8d4-a9e2-d7e4d55c2726@suse.com>
Date: Tue, 18 Jan 2022 14:18:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 02/12] libx86: introduce helper to fetch cpuid leaf
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-3-roger.pau@citrix.com>
 <5a9c0bdc-e996-436d-0b08-b7422f47f694@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5a9c0bdc-e996-436d-0b08-b7422f47f694@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0050.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6530e5e-2fc2-4706-087a-08d9da851118
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2435:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB2435F1EE78E2ED455B09E13AB3589@AM5PR0401MB2435.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:248;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gt1hPsccoVRkm0Y7Uvq7tBst/Nl2fWS8waoZmtioJCPJCeMtMaBtlgxcbLlcpT+z88kedEauYDAbYbWcnhyniVlLbQjqLf3VMUOHVAUAtMnfBBGcbRnmik751jFEKmQ3A8lRN7+PgbVh1R7CxKm0GVijD3unnKR1rM0fK223zDp59gGXwlTL0hDhbsD8siVD/1sKFQzHWkZS7HNeCf4WU6Mg0IB/ixBsyYa1yX5LpROcYOdcihtxsT3I4bA0dPSajduH2uyNYxUePU+bohHn+rKCnvhZDOHeJRAFrSN2WM6B+44Lpcyz12+hIfWgzLB7gSa1JhoNsw6FSZ2Fnyfd3c5dTxL+qxBMA51DPLVFzZZsdMIubraJOVZpVxb0atu4TgQajbXUzmfjJNiIvrFtlWRvHx82FhZyUHgfbF4CdxVbrwyGU3IBrcZCtE+vYjflq8Ea9E/9UK83zR7ih07G2Fi4kM7vv5DCYLmAtsX3z0qOMlnR4yZYzg9QFpU63etnubocusoC3n9BaGq7fqMWF8IrY25QAC5Ij0PiTtTtaH1ajmvZauCEXv71s1+h9QEGqv6FNTmgNPt57qgj8A1tjFW8DrTNtcIFMnH4P/uAe/Gt0dIx3uwCFcGY6h8YyQa6AifDNzuDFKfEcobGp9u/dtXqxHJJmT/wByLwLlOXQB+nI00QnXPgzIyZK8SGp4BF8vJsHns8bwC0SYDCOvJ3fg15YwWFZ/6bD1CURVeQJ/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(54906003)(2906002)(4744005)(6512007)(316002)(66476007)(2616005)(6916009)(31686004)(6506007)(86362001)(36756003)(508600001)(8676002)(8936002)(186003)(5660300002)(26005)(6486002)(31696002)(66556008)(4326008)(66946007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlFHWXorZ1Z4UWlrWVdrT0ZQb1ZBMFV2MHJwUjB6V1k1UTJJY2FmUTdHc1Y4?=
 =?utf-8?B?N0tOYTd4YXNTdXlYN2F3cVR3ZWFSWTk2Z0RvN0owMTFGeGt5QXZFc1NaeDdm?=
 =?utf-8?B?NDQxdTVtbUFiQWU4MzlyZ21UOVNVNVE1NWdYZzVKNzlHRzNybDBIMjQvUzVW?=
 =?utf-8?B?MjEwUE16alV2Lys0bGVzbU1MblNuM25nUEJWNlpLRzRZUVVabitwa0Y0dEJK?=
 =?utf-8?B?U2V0Nk5zaHRHMDkrWS8rdE5BR294Wmhvb3ovVk1tQ2ljWEZncXBIVXN4US9k?=
 =?utf-8?B?M2JmODc5aGIxMWFma3QvenN6WWQzbERmem1ib3ZCQkF6MmtCYlh2M3d2REZp?=
 =?utf-8?B?Nmlkc2NEYmJ6S0pUUVdGTlJ6ejYwT0dNQW1rOVdha0MrYjliWGFRbGg2Mmx3?=
 =?utf-8?B?NkwyT3dTVUNtcjJSaCsreHowZnAveERIb0JtZkJqMGxnYUlPK2hWUGEvcEZk?=
 =?utf-8?B?cnl1SWZnZ0gxNHF4c3kwNkt4RFlLa2JUUnNOT1NwaUZRWGxPRWE2R3hGLyth?=
 =?utf-8?B?UUlRYUJ5ZnNCWmt5WStlZXAxVmR5OXZURGVnMEk4dHVIWGdSQ21Pa25HeXN5?=
 =?utf-8?B?dEJIbjFSdS93VWJsNThNL2ZVcGxpZWVia3NORmJ1NkpjTXZvVm4wd0tjd3FT?=
 =?utf-8?B?UTFRbXFxMUhtZmhrMksvNDFRSGxpN01LeHF0dVZOTGI0RXJNNTgwMXlvY2tF?=
 =?utf-8?B?ak4yZzJVMXlZS1l6M1Jmc2ViaStvbFdUdTMyUVM5aS9zZVRUZG10QngyL1c2?=
 =?utf-8?B?UG9wRC9URituY3hFSXRQU2hQSCt2Mmo5dnloNGd3Q3FSdi9haTVUaU9paW9q?=
 =?utf-8?B?VGl4cWFVNTRVR240ZjFNS0M4TW91VVhWWTVVTjhQblM4UEM5ejZZb29OMkg0?=
 =?utf-8?B?emZaaUUxcnNYVXNLd0xmVXRzdUNoeGIwRFV2VnpJZ0lWS3YwWG4vRDYzL29k?=
 =?utf-8?B?Skt6TnVVSCtOY2VZY1ZxVkUxYU1TZDR2dEpORFlrTTk2aDMrOTQySi9qOXJ4?=
 =?utf-8?B?a1BHRW5Icmwrb0hnQkZOUVNxT1pjanJIdm5BSVU3QzJ0Y2huR0d6ZFM3ai9i?=
 =?utf-8?B?T2FZVFpENGthMjliOWtpc0FSTjQ0ektLOTFRTlpvK3FDZUJwbDNTZUt2MW9Z?=
 =?utf-8?B?WWZNNnpwN3o1d1o0WkVzWEFYdTNxV3hDTTFHVnhEOU9paVE5MjQ3aHlQWUN4?=
 =?utf-8?B?bjhTcDdZVXZSQkxKZm9RY1JDNzhSWks5MnRmcWU1TkdjUW1vSld1ZzlLV3ZU?=
 =?utf-8?B?UmZweU1rL3JZc3hRZUJYWm5ORkRZaDNKWHg0WXJQemwydDZ0cjlmU2VHRHp5?=
 =?utf-8?B?SExBaFB6Tmh4WXVBayszOUZhUjlkTWdNby9MOXRwS3hXRFFIMDEvNHFldEFv?=
 =?utf-8?B?bU9xUEVGMUtIYjVLdGRYZElDTmZySnFSQVV1ZjBLM1kzTDdhT0FnVTRwSk44?=
 =?utf-8?B?Y1JYc0dBeStDQ0VXTGNzK1dYRTJFK2Rua2swVldzRy9Mc0dSWjhXVkdxY2Nn?=
 =?utf-8?B?WDZzSlE2NThLbW5tMDd3LzBnTkN5bE5kdWdqWlBGNDEybzRFdk1qaUF4cGlQ?=
 =?utf-8?B?bDhTRWlUdEFrNWJlT2t4Njc3UzNhcXRJK2NLT2NXdCt0M2J6OHh5YUdUVDFK?=
 =?utf-8?B?NzlKOGM3VVJnaWZDb1ErVXYvWkQ1ajVualFCeGZ5VHhvWkora1lkVEtFSGE4?=
 =?utf-8?B?MXJqTCtoZjVmSENJV1I3ZTcwdkFxQzhVK1NaRGx0L3B4MVlCR04zNHRZbFBC?=
 =?utf-8?B?OGIrWUlKMHJ3S0dSemRyVjRFMDk2K2ZMWCsrQlA5aVc3eitTODNVUlI3cGRS?=
 =?utf-8?B?Q2RSTkpJa3RwczlkRVM5QWM1UGsrUXYvOGE1Q2M5UVFKMk1Pd0wzTDQ4L1Bq?=
 =?utf-8?B?T1EwdlFKc2kza0hrZDVUMEJiUk5lRUd4RGtrVFk3RGgxRCt2cjEyVWw5akd0?=
 =?utf-8?B?ejdNMy8wOGFBTHJRZkptMEM1OXhoYlBZY2V5ZTBZOUJ5QWNtemx0WDA1WC9B?=
 =?utf-8?B?enlQZW5rTGJCWFNuc1NtSDFleG44TldPemtNNUFxNjFPME1lcXhJVVl2Sk4y?=
 =?utf-8?B?Rlp3cWdmZHVvUUg5UHRITzZsWG1zMkNhSytINjB6eUt1cXVUQmwxVTlPNTRC?=
 =?utf-8?B?bDB4RTFNSnpBNUJLUko5c3E2Q0pHanFYblhKYkNaWHVPQXM1TWZVY2tYNzNt?=
 =?utf-8?Q?lUoNIbfkzbJydN1cTOgv5qM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6530e5e-2fc2-4706-087a-08d9da851118
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 13:18:50.5147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wbXepaI4bmgKGU9q5wWHqI9GhNUHH5L+WXBA4/brStMPMpCoAxFaVaRne1CxKmGt/Fw4ucmIb6OJEApL2hJ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2435

On 18.01.2022 13:26, Andrew Cooper wrote:
> On 17/01/2022 09:48, Roger Pau Monne wrote:
>> +#define x86_cpuid_get_leaf(p, l, s) \
>> +    ((__typeof__(&(p)->basic.raw[0]))x86_cpuid_get_leaf_const(p, l, s))
> 
> You can drop the outermost brackets.

How that? While people aren't expected to write
x86_cpuid_get_leaf(p, l, s)[0], such a case shouldn't result in misleading
compiler diagnostics. Afaict omitting outermost parentheses is only ever
safe on postfix expressions.

Jan


