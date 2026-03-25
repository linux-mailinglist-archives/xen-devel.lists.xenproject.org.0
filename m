Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDi3FdUMxGk+vgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 17:27:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A301C328F77
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 17:27:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262743.1555143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5R3a-0001T0-OX; Wed, 25 Mar 2026 16:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262743.1555143; Wed, 25 Mar 2026 16:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5R3a-0001RN-Lg; Wed, 25 Mar 2026 16:26:10 +0000
Received: by outflank-mailman (input) for mailman id 1262743;
 Wed, 25 Mar 2026 16:26:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5R3Z-0001RH-Tf
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:26:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5R3Z-00HPYk-5W
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 17:26:09 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c40c8d-e002-0a2a0a5209dd-0a2a45039ae4-44
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 17:26:09 +0100
Received: from [40.93.196.69]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c40c9f-1947-0a2a45030019-285dc445d95e-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 17:26:08 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB8084.namprd03.prod.outlook.com (2603:10b6:806:45a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 25 Mar
 2026 16:25:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 16:26:04 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZOI9rsADKKeNl1q1ZepXYELgTn4C1MgFBMY/QgPKWeD3recIt2WLzjgW7EvDbbAL/g0sXZj5MhWSKCXgmWVH/5IhpB2+CxF3ZJvIoBdZMFpRT/V2/esruMf6L9CiEQZD1T9WrdfZFcaEz/gdZ6Vo6LzjOOYzth37EwFmi38BufIasLr/GFd9LnLIljul6prgpKwMwOEQ3FQvmnhVh1Shjg2TOOge6szhlkXFikIEcPtjHHGIUBm3p/OOTsAj2ZnbxqnXQTeufBI/sEfC8X7FzZKadm6qb3tbfcI0XjNlsd2GjtMtm/KCbgkwtSjRhEKtQFO27M6rpS+Zi9djcI4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxRHVU4Ie4B2eNaBFNdJ9gSoN4f0appxL4CDJDX7deQ=;
 b=Ypa0xvqAcg1WJqnPTOdWHE+gd1Apm/TchzFu0pXGas2kKVYBfaxcGOV0jB1zqGEoA38ym9DjTakdpVOSln5rGXM9pe1UWH1hvGlt8S5mUZtpDbHUb8DpJPkhobPKhb3EVndzqguqEkAwJ0CAPFcsM6QmcGf7PZiFMsu1GVk11OfTVArue1/a15xClWMHLLawq9n8gkd4YMSzcsPe7j5eH0OIsqGxUemAYPEMDk2VnjbV08sstotl/OtR2NKxccvwCZ/EMT/GPf+EIiAxuaDNbmWKvOy8GKMmI2E793Cc6h0G8u9r/+2Tkwe9SH8PL+Nf6BQBBSv9b1knE5ieEdq5Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxRHVU4Ie4B2eNaBFNdJ9gSoN4f0appxL4CDJDX7deQ=;
 b=oYHHv+KI5jXIgwkLnnokS0qea1NcWx/cdK0LOOnkQ9dX+78GqH9rBVJDykI83QEBAPZzfBLycyKWRW5mVjBuoiPc/p4CsCffEjBenFoTV99/r/g7wAPoNqKPiYA0NJw3E47Nii2iRXbN664SgarsCcyPUzVjiJQlomFbQ3LpXxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Mar 2026 17:26:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/mm: do not assign pages to a domain until they
 are scrubbed
Message-ID: <acQMmXyOGFe5AN2i@macbook.local>
References: <20260325100803.6640-1-roger.pau@citrix.com>
 <20260325100803.6640-3-roger.pau@citrix.com>
 <73c705eb-95f9-456c-ba0b-c6e0f7730ef1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <73c705eb-95f9-456c-ba0b-c6e0f7730ef1@suse.com>
X-ClientProxiedBy: MA4P292CA0013.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: b1944c5e-168d-4cc3-cde2-08de8a8b35ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6QF4se3Re0+foaRwLqiwnhehmCge21ntxm7PQI7eYFchns/erU5NZ1YxQkNss7HLjN/rTIFolKMOktjCMGeqLYKO9bunxV82J86aGmivRO9JH53E9UEA9ZQCsOihetSE5oK4jW92H5qKMPA39P3sU617NxkCGL9j2E75hxDbZIrQluJNdXO5ODhTdPBqd6Z9rsY9WVgjsfByNpfLNCRQw9GsX0aBGnPTjjmcI3Ck3e2JotTmAGQNMJyMEtSg/jGAqxTlytUKNP2welz7m5mb+eueZraLFMkxhrxoHREvh6c1LdCLTUWCu16+4KB1aYBqchoh+aK6udQGnqhRIIylLPEXIGtIzNhHQP+Z1VUmZ+jLGuUkLgocj9X+6CvRzR6BuqFMoziQZqG1gM7od0dq2tMb9Ijh/S3S6dE0bbMfCAZAVoKdJjhLNhp8cc7Zdh0AvWzVaW7STJqMjyPof+eHYcEfhg7AzgXtCiboYl7p93cvkbW9trs9EnhgrKuEcAuAuHAHtcJmEb8UeqUE7CkDKE/hs6wHO9AGaH8zU9Jbp8U3agHLaq0h4kBGBkRzw7Q9TMsIYFxciF1ieCb4D5T7tWw7Bay2JTEyf6HUCWWcxJvNdmp9Gj7nC+BmADaLrnSkQowR+lj/s4efN3PmMacgg3S7J+kRq9NY+g6eaG75EOJW2JK5VNkP8biAErAmz0cKSxQtM47X7YlecMpvRW3H5HSiZt8/jxOVPBKxeoCpaws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzdBdlJZTUkvL3VGWmJSdkZ4NjdZa28xQURrVzlVcFp0YW01UGRQSkdXeDI0?=
 =?utf-8?B?NXpJQTF3YW8xTmJlbGN6MjRXYU93cUR5ODlOclVtSE10YjZ0V3FLdnNmOU9U?=
 =?utf-8?B?dFE2MHJZQzBuVURIa3RlTDVEWDlsQ3pCZlBGdzRtMVoyNzFySUd4RElScXRB?=
 =?utf-8?B?dFpZUGJoUFh1Z2RsWXA4Ui9zT1NzTE1hdkt1UnlncmtmeEROMEhDb0JCdnFD?=
 =?utf-8?B?dHl5eWFaeFNLcnJkZkNubVlIQmI5U3M1eFN3YVpLbXBZUnFNVWJzTFZkeVNS?=
 =?utf-8?B?UURuTmg2VFF1MHBVOUtmdEpZK01yY3B4TzgrcWdUOU1jT1o0WDU3WVdqZkky?=
 =?utf-8?B?R2tra0t0SGUybXBnOVlCWTErVGxSUUZvdmZCM1A5emIweFNTS2xXUXNsQlNk?=
 =?utf-8?B?b2w1SWprY3pOQmpxTlNvT0dXd0VZSVk5UWxzN1FpNDRWOHlEZTA1WTNvak1H?=
 =?utf-8?B?ZWFsOURJRm1EWEs0bTcwTGhkUXhNcGtYZ0JFWUZvbU1kdlpMSkZaWFRtNDV2?=
 =?utf-8?B?cDRTM3VsbG9CZjBXT1FXRnR5M2hrQlBWV2pUVHdFU0tMMkRIK0t2Z2JQRVUw?=
 =?utf-8?B?QmlXd1ovcDEzS3ZsQm4yeWZnQmZYdXp2cWlKSkhNc3lPakh0T1FLSTdTRFRR?=
 =?utf-8?B?YzFkN2xWY0pkcEh3ekcwQmxFc0psRFE3b0xiMHJuMjZOZWxQODg1RFpMd0Ns?=
 =?utf-8?B?QnlZK2ErNzFQS3FXU1hwNjAxZzR2VE5seC9DUjY1QnFhU3loTXhGWWhvd0pY?=
 =?utf-8?B?eUkyeGdERm9Sd3F3VUVLY2FWM3FpSzZmTVBYMHQxTy9GRldrbVFQRFRQbVF0?=
 =?utf-8?B?WVM1ZUtVWmQwWmZqRmtBcEdsZUlrdy9xMk1sbFI3U1BvTXgzd0JMZ2haUlNZ?=
 =?utf-8?B?dWNEZHdveUcreUxmK29YZThVTUVqcFBLUi9ZdlA3a1dBd1RvODVjMWtCZUpY?=
 =?utf-8?B?d2x6Q3E4TExGeDV4WEhKK051OUxEbmVvcWxkZDdwcDkzaWpKem5BUXh4UVds?=
 =?utf-8?B?MGlVZitxRklQYkl4MnNZUDRRR3N5TUJMSGlGQktKY2dGbG5LTFh4NENUNmFT?=
 =?utf-8?B?d2FaTzhoVkZubHZ1dDJwbEVaTUZwblBWa2lOMkpWb2xRc2lURWZRMFU2SmND?=
 =?utf-8?B?bVgyamk1MEh3cjlVeUE4clNoOVdnZWd2UkdUTllvT3VLMkN3ZUJhTVFYb3Vm?=
 =?utf-8?B?YVBsOGhRanRMcVRxdzVXVUl1aEpQdHplVFlRRHdUUWhGOG8wcStpT00ycGth?=
 =?utf-8?B?NjhVcHBQVVRnK0tKMDg5NzNaRlo1V0JpK2JoY3JOYitFM3Ezdi9WMTI2Z3dD?=
 =?utf-8?B?eWtKSUV5b05Cb2RGUHpSQ0s4RFk2OGNyMzJWY0hIWHNndDBodzBRdEJDeE43?=
 =?utf-8?B?MEI0Q1NVZW5KRGVySjhZdkhOejM2cHpIbzBOMjJiN2daUGQ5SjJIR0ZvY1lM?=
 =?utf-8?B?MTZmNE5Nc2VQZG9xa2F0TlFjR3BMMXd6REF0ZlQxZEtMYXhVenRnOHQyaUtj?=
 =?utf-8?B?WHg1UEcxT29ZRTlHTThqQXdETEFxZFYzVm80UHlNbUFIQVZVN3N4dk5DOGV1?=
 =?utf-8?B?V1kwS3hKcHREQjFqL2M1RHZNK0pKYW9qVGJsbVdxNmJOQXgvUFEwalllZnJR?=
 =?utf-8?B?YWh6eUxyVW1YQ2lvNTVBaCtpOHRxbGFPRVk2QUNWSCs5TlNxK2tDMzFGUm5z?=
 =?utf-8?B?dUtrOXM3cWR5Q1hwQmp3SXJWb3IveGRVdkwwcUlUZTV4OHUyYXptbG8veEpF?=
 =?utf-8?B?bzJCbXpBeFAzMmFzVm4yanVMSzBmUWNqU2s5Y1VsdnE2aUgwa0R5N3hxa2lC?=
 =?utf-8?B?VVNBeDhMcVkwUUM0bTVURHJSbFNYZFRSWWxPMzhyQkpPM2t3eHZZWDd1VlB0?=
 =?utf-8?B?ZERLUkhPaU1sQVJxOEtsVnV5OHQ5TDJKNWtxajBXTnNYdGwxS1RKcHVpK28y?=
 =?utf-8?B?d2w4UVQ4OWNJK200OUFJdWxlSzdKVlJWbzRxWENzb1RxV1FNbXhpdFlKL25S?=
 =?utf-8?B?TDYwVDVmdGNhUlhLalJ0MnVrTldvb2FaUWxYZU1nbWpxNW0yMWM4cjM0Y0Fl?=
 =?utf-8?B?ZkxDeE5KSHlqdUZyM0laSUc1Ykx6QUR2UE85bUo5UG5NYWp4ZzlzNmIwVWVT?=
 =?utf-8?B?UXNvVVBKWEI3MVZsODdLWGtsSWlJd01yQy9DZHBHbVFaN1hNNUxNa0JWbWtG?=
 =?utf-8?B?WGhnSjVVQjN3bUNYM1BpVXE1dHFLT25UQThqQVJGOWE5ajNXcXo0RnJBQ0hQ?=
 =?utf-8?B?TGZlaDlBKzlGaS9BU0ZkTTlYMHBZYVNGZmRiZ2lIa2l1a1c4SDlVSEVLZktw?=
 =?utf-8?B?clN1MGQvQmxFUGJ3OGNLNzRsbUlXU3prbGowZUZpUkJSVWlPd3hDdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1944c5e-168d-4cc3-cde2-08de8a8b35ee
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 16:26:04.5544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XN+xnjtTpoCl84duPdbEOd9lcUkG3D2nWIt9Xanm9EOBwmByWSzo8k3kTe1KJTsWwtyy6687CxRlsxcMikV9CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB8084
X-purgate-ID: tlsNG-33051d/1774455969-4A45E72C-C2AE650D/0/0
X-purgate-type: clean
X-purgate-size: 4172
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A301C328F77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 03:56:05PM +0100, Jan Beulich wrote:
> On 25.03.2026 11:08, Roger Pau Monne wrote:
> > ---
> > I've attempted various different ways to solve this, but they all ended up
> > being impossible.
> > 
> >  * Prevent non-scrubbed pages from getting extra refcounts (iow: make
> >    get_page() fail for them).  This seemed nice, but the cleanup using
> >    put_page_alloc_ref() was impossible as non-scrubbed pages would return
> >    failure in get_page(), and so I couldn't take the extra reference ahead
> >    of calling put_page_alloc_ref().
> 
> A special-case variant of get_page() could be introduced, but maybe that
> would still be overly fragile.

It seemed too much complexity (and risk), just to deal with this
scenario.

> When we discussed this, what I had proposed didn't require use of get_page()
> though. assign_pages() would install two general references (plus one type
> ref for PGT_writable) in this special case. To free, you'd call
> put_page_alloc_ref() followed by put_page_and_type().

Doesn't that risk under flowing the page counter if there's a parallel
call to decrease_reservation() against this MFN before?

How would the freeing done in populate_physmap() (in case of
concurrent calls) know whether already scrubbed pages have had it's
PGC_allocated bit dropped?

> That said, the patch here is still less intrusive than I feared, so I'm not
> asking to re-work this again.

Thanks.

> >  * Disallow XENMEM_decrease_reservation until the domain has finished
> >    creation would fix the issue of pages being freed while pending scrub,
> >    but it's not clear there might be other usages that would be problematic,
> >    as get_page() on non-scrubbed pages would still return success.
> 
> I agree this is of concern.
> 
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -388,6 +388,12 @@ static void populate_physmap(struct memop_args *a)
> >                              goto out;
> >                          }
> >                      }
> > +
> > +                    if ( assign_page(page, a->extent_order, d, memflags) )
> > +                    {
> > +                        free_domheap_pages(page, a->extent_order);
> 
> The pages don't have an owner set yet, so that function will go straight
> to free_heap_pages(), needlessly passing "true" as last argument. Correct,
> but (for large pages, which the stashing is about) highly inefficient.

My bad, I was sure I was using the same freeing function as
alloc_domheap_pages() on failure to assign, but I clearly wasn't.  I
will switch to using free_heap_pages().

> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -2699,7 +2699,13 @@ struct page_info *alloc_domheap_pages(
> >                                    memflags, d)) == NULL)) )
> >           return NULL;
> >  
> > -    if ( d && !(memflags & MEMF_no_owner) )
> > +    /*
> > +     * Don't add pages with the PGC_need_scrub bit set to the domain, the
> > +     * caller must clean the bit and then manually call assign_pages().
> > +     * Otherwise pages with the PGC_need_scrub would be reachable using
> > +     * get_page().
> > +     */
> 
> How about replacing the latter "with the PGC_need_scrub" by "still subject
> to scrubbing"?

Sure.

> > +    if ( d && !(memflags & MEMF_no_owner) && !(memflags & MEMF_keep_scrub) )
> >      {
> >          if ( memflags & MEMF_no_refcount )
> >          {
> 
> This no-refcount code isn't repeated at the new call site of assign_page().
> It's not needed there, yes, but wouldn't we better allow this to be taken
> care of right here, moving the MEMF_keep_scrub check immediately ahead of
> the call to assign_page()?
> 
> Otherwise should we reject (much earlier) MEMF_no_refcount used together
> with MEMF_keep_scrub?

hm, I was likely too focus on the specific use-case of
populate_physmap(), which is the only user of MEMF_keep_scrub.  I've
noticed the MEMF_no_refcount bits here, but since populate_physmap()
never uses that flag I just left it as-is.

Will see about adjusting it.

Thanks, Roger.

