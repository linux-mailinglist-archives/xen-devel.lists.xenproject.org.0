Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GKgSN+BXIWqKEQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 12:48:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4911E63F2DC
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 12:48:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Hcs07fL5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327671.1592488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5bx-0002Qn-5a; Thu, 04 Jun 2026 10:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327671.1592488; Thu, 04 Jun 2026 10:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5bx-0002OY-2q; Thu, 04 Jun 2026 10:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1327671;
 Thu, 04 Jun 2026 10:47:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wV5bv-0002NH-NV
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 10:47:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV5bv-00EvYc-44
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 12:47:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2157c8-5cb7-0a2a0a5109dd-0a2a450c9a82-8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:47:39 +0200
Received: from [52.101.46.51]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2157c9-62f1-0a2a450c0019-34652e33c66f-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:47:38 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5407.namprd03.prod.outlook.com (2603:10b6:a03:28f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 10:47:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 10:47:35 +0000
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
 b=DCVYbZacVMADkLigfgQLXNJbmyi4kaFd3xEGKsJlL1wK36x8XU9O+erSUYj0NCl6qXNYBKkceOjqARIIs9UVJR7+jaQy6wuCTkqgD2lj876YJygyu3pw5UoJ2rlsBQcRDa2XIobH+Iq17lH+JDHu5FiuoCM5zLCyvdQ5z5FMC1AZ+mBcWP7CRfNstYZjLP9hrcgX17YzLBdGOFK0p3e0A7W8mf8rB7Gcyjude3OzV9DDUK/vajRhaDS87sFy1zrYubrrNZCC7enKjDx3/zUDI3PtzGvu6ITIFoenMOwPWwxk8N69ABQrdt/PRR0gBppwnKtSbX6IT5Z3qVrZ8faVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woSKu80EsA67nBBpL1iqFS7xKUeNOKVajEQOU21DGac=;
 b=bCoHrydC3KV5zi3Yt/v4BqcUDtRXq0WBoYvlaSNBhYJCD/lBLs2x4oK0VLhMkVh4l+rEMbNLPYeZ3E5ZYdnNvrGYmGFsv7NST/e/UVm2MFQrQw/12YyjOcpMtWdV1AMjwebhI8+YLXjE8dKooENwO+tyzOjip+e9rMCgE1AgRjZXeFz5IBvIyE4tam8CP9Vd6YYREIB28ef5sLY+uhPNiY/xchLDLaJWFkGEjw4GHJzzBUH+fC56nSdNptJKmien7gMEf/CaCpNcNTDkytzlCIYWZMoAJ1TX0CuUOyF1pAhkm3iONgiYCBzAlH7UK2CxWLKMpWpMU56CTUoSY0vl3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woSKu80EsA67nBBpL1iqFS7xKUeNOKVajEQOU21DGac=;
 b=Hcs07fL5tR64AC+4cC3mjF8hUThbi7c5HRFA04cwdqriEIAB11UCR1fK4fS0DR5WI15P5fjF/FHe47xadHLRlJ6rV+eGv6V6NGuvZo2ECA73zMeD3WaGodhLjN8PfJXXFW+1bAJEF0qMxg0VZcvgPYC4iDFoLUFMfRgj4UDUgAE=
Message-ID: <553b62c5-7d01-4402-af75-cf3150e7b0e9@citrix.com>
Date: Thu, 4 Jun 2026 11:47:31 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH for-4.22 1/2] x86/mcfg: sort header includes
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260604104605.92516-1-roger.pau@citrix.com>
 <20260604104605.92516-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260604104605.92516-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0447.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5407:EE_
X-MS-Office365-Filtering-Correlation-Id: 427d0382-84de-4675-625d-08dec226afe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aQ8XmqW6hJRyP+cBphKI+5VePuOAVzk2n4jG0M4uI6dEwHnEGoKEnWqF/N6Ye9KKVh8PMtbW5EgPWCFx80g59XqnEyJQhL+KYWfYS6q3nCT2AVtlFiMbW0ZkKQ5T027gGbfD50fADwxPVltWaGjJ1axA+KTEJsiJulpqOUNP3DH/4iX5mbL/IYjxzuAxyAch5Km7W2DRwQAIG+C08C7TKFIJea0BidB3UK5nApkIAZL/YYoMT/APjSLPcMesktQDOmWMnytq872aFWNVnSG+4/GK4MjIWgf9xwh9InCY3K7B1oS76jPJTs91AYpDJWI2PFG1wFZYVcw3GwGZ7teUd2H7GqTAeUhbW/igEs/iMm3xSAYiHbntupCpM2yPGJ1nk6o+PT4L8Q5apauiTWR88GyVdP/18cGoo098CLYhoIW/OuAP1AI7/jW5+l6Zgalap1PRD65NJkavHIjlH3kHfEmSDvfInjCCkp2G4KQiE9uFQatHe/gQMYvpPFBzIqfdSJDMnyO8o9XuQ8dcmV27L4aaTbrTRx1YbEl9gfBwYVzGos07IPSMjcJL6Q0cV39X/k3nQ9P30Iboe6+5gAFKw7bV+AOIijiiGbNAwlASZKnZ0TorxIYgJb8Zte10zMNGMvyr0jQ0MB8wWe+626xFSuDairatA3J6TX/93+hqg2tKLdEAdJM/UrFvvVtORz6S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWVWR2djMXZiWDRoM2hQRzd6UWhnRTVzQU9jejBtaXF6TTM5dnJZME8rYmZK?=
 =?utf-8?B?S1NpQ0Q2SDA0eVZLQUxrZ3V3eG5CQ1pwUVpWVm82VXd2Y2V6bEljQmx6UW1U?=
 =?utf-8?B?L3ZuQU0vdzJnQjdrUWVpcFZHMThrSVFQK1k2Y2xNV0cvTHZpTTg4Q1lSZGpx?=
 =?utf-8?B?MHlhWHdPZ1hLUlp6VFlscjdZOGh5YmREam9WZEd0ek5NZ0NjTTZVcUdSR2Jh?=
 =?utf-8?B?cGY3YTJXNVpEYiszdXdmbm9CcFlOdmNvYzFtbVFXNzd3M1k5UnpmVnl4WGVj?=
 =?utf-8?B?djNZc0tLL3N4Tk1MODg1QU1EMFVWVW9YR1huYXhPb1dEZnRRNWM0K29JdUEw?=
 =?utf-8?B?aVFyKy9UQWdsRGhYYlNtUm1rZ3pHdkx2V0o0Y3BKZjdLTE5Qcnp3Zk9qU1VP?=
 =?utf-8?B?ZVdsY2s2Z3NUbkIwNGZOMG1DWjRCQnQ0SDhBL1hMMWF5d3ZmSFROenlRSWZx?=
 =?utf-8?B?S0FFTEo4WU9zTWxVNTlNTDdlTTZDQ2ZYbFJLeUowUlZleTc4S25GMEJWdW1h?=
 =?utf-8?B?TDlJZkF0WFZrYVA1OUUxMGJVdzRKbFBRSTdCVEQ2d2ZIcXprU3VKVnJhckdT?=
 =?utf-8?B?NmNtQy9RbUhIMURxeVdwQVp4K1hieUJIOXZ2ZlFCb1dIU2JTZk5uV3BoU2FH?=
 =?utf-8?B?UGxtTHRGQmpLL0tXTG91dEpPUUlYOVZIMG1CYWVrR1NEUm43Q2thMGVrUWlk?=
 =?utf-8?B?cXVEa29JSldvNTZFRnluRk5oK0g1OFdqcHV5d00rUkt3TmtrR1QyY3hmU2Vw?=
 =?utf-8?B?OVpnSTJxWFNqemswdGl0VGJSYzJ1dmpkSkFwc1psdFJNOWQwTGFma3VsWHJx?=
 =?utf-8?B?MExrSGx0akpXQlBYRWZ6bDRUU0p1dUZOYUVmaTNzcFJyMitsY1FWTzJwUnVK?=
 =?utf-8?B?UUlKQnIzeUdMdlo5aDBuQ2FYRFlMR1hQdnJaNWh6RzAzcTQ1RFVvR0ZXekt1?=
 =?utf-8?B?TElpQjkzZzFqTDJFN2pOZ3ZoTFFIdjlNV0t1dWFmbWxnN1hkVVM4NU55Q3JJ?=
 =?utf-8?B?UlY5NHBlU3Y4OU05YzhKTUxpTzZzaDRQUVpZRm14eDkzVThZT0hFYkJ0RGY5?=
 =?utf-8?B?OUR5QVc2aFZWTmZuNVRZWWdDVFlLU1I1b3dKTW1HeStpY0psSFVTSHYvM1l4?=
 =?utf-8?B?bkJJWkJRRERFa2VxdTgrdE41RXpmcCtXZ0Z4YlkwK0dPQmlRckJ0eHpaWmpt?=
 =?utf-8?B?Z2J3UERtaWwwL3B1N0wvZzdUTUtORnF2WnVVbGFWUlFCeVEvN3VuNENPM3FY?=
 =?utf-8?B?OFFpcHdrMGk4TTlLZXIzalpRZWY3dTRGeGZvaXF5Z3djSllhNHd1V3pmN0FD?=
 =?utf-8?B?RDRBTGRqOWpJQXJPeGluYTlqM211YXppZmc0V3UvZUJOZ2xLVlNaWGk4MjVq?=
 =?utf-8?B?SXNQWnNRRUs2TldqYUpxVnNyVDJyUEtpQ2tkLzhrTm1yRFN5LzFGMjFlVjRs?=
 =?utf-8?B?Vnd2R2h0cnducU1zSElDREJSSkxrQWhmZXFGUWk1RFlRWkZGRkFtUldFQVNu?=
 =?utf-8?B?TWZTd1FQcUpPWGp6QzlVTFYxTHJJbXNLdDZRRWY3WFZtbUtXeDRjOGxrOU1C?=
 =?utf-8?B?REpQS3FwRGJhVDJjU3c3dEExOWYvclRNMG5oekpoRU0raHBOZDYvVUJHTzlk?=
 =?utf-8?B?NTdERVc4blhMZmNid1FzSGFqQVY1V1NtU1JXNVN4eEU5TjdHWFllTklGNjdH?=
 =?utf-8?B?RU01b1FadnFOTFlYWXAwZEJkeFNqUStmTFk0NUdTcWFnRTYzMm81SGgxV3Jm?=
 =?utf-8?B?andxSHJ6OUE5emhySUlrb1o1OUJKVzhwNjFubmF5MnhuWEJaRFlRRUJHWVpC?=
 =?utf-8?B?aVVJUVZNZjhaSXVXR1NGWU5JVmU2RHlxTndEMitBV1JqblFwTlB4TmppTW9Z?=
 =?utf-8?B?b1lteG9pdDVRdUZDSDFCbXUxYWFmTEwwczNwbGgrVUJQakU0R3EzemhSS0cv?=
 =?utf-8?B?eEpQT0hkOHp3TG95NXI2M2IyUVdBNzkwczgyUjJPNmhDYm96cUg5RHhOc3cz?=
 =?utf-8?B?UzdZc0lIRFRWbHJKYXVTMzFQREV1U3kyeGFBbHM0MDdVZ0ROTkJGZFlGczhD?=
 =?utf-8?B?dURCdVUzbW1BeGp2VStsMFZGZlJEM1ArZmNkaGNERERlN2pmYkVXSmZvaUJn?=
 =?utf-8?B?VU94djFjOHMyeVBPendOYmg1RGREMFNiTEtOSDNPYVFZOXBqQnhwUGEyS01i?=
 =?utf-8?B?NlJmVVppSnlvY2tTU2tYclNYU0JTOWxzYWQ1Z1RJOXlWZWFFbjFTU2NpUUI0?=
 =?utf-8?B?NGttVFd0NVBYRHhaY01tem5GTnJrTE5WWnV6SUIxUzU3bFF6MzJMNEdlL3Ns?=
 =?utf-8?B?TUJLaE54M0RXTUVBTy9pYkFVaUN0ZWI0NjROM3FBYnhRK3RkSjNPTzNwbzRO?=
 =?utf-8?Q?WniAS15X5RVzICLU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427d0382-84de-4675-625d-08dec226afe6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 10:47:34.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkqxXnBow1G/WQwjnrgsdjPX2DU22vV4STP8sAKCT+zw9tMXprMzIap8TKsJlJR8EUlTBNhLi+8HsAj8PTJKJI4nF8dv26c4Cbvy4PsEaMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5407
X-purgate-ID: tlsNG-d25034/1780570059-E0D63CF5-02C4CF59/0/0
X-purgate-type: clean
X-purgate-size: 198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,suse.com,vates.tech];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4911E63F2DC

On 04/06/2026 11:46 am, Roger Pau Monne wrote:
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

