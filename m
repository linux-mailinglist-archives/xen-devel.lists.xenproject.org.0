Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uVekM6pkMWq0iQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:58:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3918A690B59
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:58:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=0K8c7esH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339361.1600548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVFM-00023y-IU; Tue, 16 Jun 2026 14:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339361.1600548; Tue, 16 Jun 2026 14:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVFM-00022T-F9; Tue, 16 Jun 2026 14:58:36 +0000
Received: by outflank-mailman (input) for mailman id 1339361;
 Tue, 16 Jun 2026 14:58:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZVFK-00022N-Fe
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:58:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZVFJ-00BqrM-29
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:58:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a316495-2eae-0a2a0a5409dd-0a2a4509d02c-4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:58:32 +0200
Received: from [52.101.57.34]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a316497-2497-0a2a45090019-34653922c9af-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:58:32 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PR03MB8306.namprd03.prod.outlook.com (2603:10b6:408:2d9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Tue, 16 Jun
 2026 14:58:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 14:58:30 +0000
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
 b=uniIJTIxZcOlRKJFlMgLhM8HUVrX2n8szdHYdupiK2LwvToz3W0L3PGqnP05uZzLTNYbndmHrSUaYbPdYp4FQJu6E/yk1JypXCVZ39gDKibLPKZezxDnDDG+g62o642v2aw+aXJHJWISnd+QCo3AeNCLUNN0dgMQXBqaga2OHVYq0Fs0AF2fOitf1tsOw5DjKuRz6HBmT2nejRWoPr8+M2vld+HP+UCOdigph1d6EML1D7RE6QBviEVn4TrTfCDMiBfD0oRypS9zGuWLkpjGDU68FhdhYV54tZHrNWVFUO0vJlRBM30ro8oSxpPbc4LcdjLRFRHoQ6bLW4wsFXWzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwngyvZmtyZ4azbr58HrsSoW8jWPPFPahmA3M6WTWwQ=;
 b=SaY5Vf5fN2NuOuIifZxnDzGN8DHeYYdAC0RISKSkwO38Aawo8U/1umXqgubPOZ4Go7wzrGWrdk9JxGhh6J8aCDzLjL0NpHPZ4EapKwlQlHcyHQPdNmptLweU9IPS6ouiQbC5t483ifHhifrR7wzcmlwgfjAfBwAm36x9qQNKe2f2Yb69OZcvk3avr61AQCF8xj4Uz+/DqVPe7AyYOf0n8ttRfXZsYeBSWk/Zao7G7XLNnVTXkiSeDV8QV/oq+WCFcuB0oUs8OrtFXGQRLHzPt1qlEyP0VVFbCPU68iLXEZrCtD3EqO1F5JFlPf8sByQuR9JKLrxqNGaBI+U3b2C3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwngyvZmtyZ4azbr58HrsSoW8jWPPFPahmA3M6WTWwQ=;
 b=0K8c7esHcF2c635FVzO2cgjfo07uyRSbFRbkaFUVBgJ3nEIFCnMIPtPx/Meas+jj5BQF68YuIoE3poGpz2FDTghPSAT2J381ZDMCn+dPx04a9GFuG3M3FrID8ANBtsaq0zcBg8Ysz4S/7N8AG4QXtQJm6mIN6d5Ow1mBkV2HbcE=
Message-ID: <4c577b14-30ed-4fac-84fb-45d248e8feeb@citrix.com>
Date: Tue, 16 Jun 2026 15:58:27 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA memory
 mitigation
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-5-frediano.ziglio@citrix.com>
 <ajExivEwb88pcOxT@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ajExivEwb88pcOxT@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0497.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PR03MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: 9090ad4e-162b-41d2-5e1a-08decbb7baa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5d+pT5KcW/UpQu7o2XHjOTK4MNmSmDF1uKTGAbMnj3lUZIcEIil8XSD1zRM1sU0opnCfKf7YjNQCXv4GfANfmDeDJLU69ohh+gKkzu6TcdoN2MKsYp+vWxdT3G0qmxCP1D2cx/ICREaCQZ/MA5txiFu/i1LFOjSSscJ4zX5YZwZ++ctiFCDUwIp1+6mtbfGm10VVhlKSvPkncpIyQFc0xh+1/lzl8H+3coXVDms1VrMyyZbjPXwHwVLrAOKcEbzYrfa9hUsEMqYaKA8kAQxlHBFAwjy1HPWfGWVDPhOLctaTlQ5NLmtWvdIist4ZbxVNoXGPUqiqQk6uXvIeSAYscaRn6akBWr3/vZ0iethfvA0Dk8vPNNLUN2hsoLnjwB+14POMGImQ+AbnPyrYq9q3V0p3pFCcwoUJ76RMkunT+Fv5A2zbHTHJMI6fVPyzp48gxGeJkWHcNUu5Ehadre8I6+RYvmcxCU7BgaShkXKJlTFd8vJoGFM8fw4qXRmJNe4hK4jCNEeGSzIUiZHeyJe/eqbUcQtM88wfoE0j6dv8Z2L2XV0nrR/ovz6/tVjGoL2kFGOYOygdDDnN7bQDoTZg8x7Zilman1H9qU9FZwpGxVPY7u2tIvG9zIbZFe67x3rhJPjwHD8kU54fX4RYlw6a8+gvHEe7a+Zs0OiY7UF9zt/U8hYTzIN6yMkyU++zGcG3P1ifzUom5qaqIZhfmXzOlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UExydjJuY2x3cElLazZIVVRkZWJ1M1VCVTlFVmx4TEpNeFlJdEV1K0dKOG56?=
 =?utf-8?B?KzBoRmNNaVlUeGNMSXljYUJhWFVrUlNVWDZOWHBQWnVwMHR6cFJTWVdDWUNG?=
 =?utf-8?B?eElCcGNZbE9vRzVDZ0EyTXV3cm8wa3lheEVwb1ZFTFpLM1Y1MFl4d3Mxelp3?=
 =?utf-8?B?UmhuaXhDUTR0d2RQZUdKNTZLRzZldUViNWJkSHRuQWI4MllEbnE4M1N4Z1M4?=
 =?utf-8?B?cWZ2MTBmcFdJUThmcUZjVFQ1TTZYVmpZZ2c2UmJtamF4N3NNL2JqUnlDY2dk?=
 =?utf-8?B?REU5Sm4rSVlCTU1FNU9nM2NoTkxDQVA0eHZiN05GbGkzY1NJcHpON3pPUEda?=
 =?utf-8?B?aUtSNWxyTXBiU0pnRG0rR3RXVkdDSjFTVmIyc0lRSjdwQWRvMVdMVmhXekVr?=
 =?utf-8?B?SlJjc2JHOVc1RWh5ZkplS09BeFhwQzhRWlEzMFowSW55QjdIejFvdk9PYTlO?=
 =?utf-8?B?NWxwc2M4SENTN1pjOWR2UERaTWt2ZFZ4MjlZb2tpemFuZFRKbXhFeWdhcHF6?=
 =?utf-8?B?WHdXQnFSdmplTktDak83SjErbzZ6NlZRNTVIR3F2bUcrK3BmVTNnNTNMcHM1?=
 =?utf-8?B?eVVuVGdMZTNmNTV2ZUxuNjZGT1NYSHB5ZFpkMzZMb25URjVLVVF6ZmxhclN4?=
 =?utf-8?B?YVdOd245dWhwOVlpeGV0cWpXOTJIOHJqWnpLKzNiZTVZM2Z2ZU0rdkUxK25r?=
 =?utf-8?B?UjF5ejdPUWxuR2NRL0VZcVlTcmJEWmxEeWlRYk1QU2NwbytQSXh0dmdjS2NC?=
 =?utf-8?B?RUY1SG5iaDdDeEJ2OURKbk5SakZGNENIREcweWNoWEV2UE5XNWFBdjBFUVJq?=
 =?utf-8?B?Zit6Q0ZlZ1NGVXlmbXVvVXMvbEY3d21PZHN4a2tCN1A3UnlFeDAxQW85dDA3?=
 =?utf-8?B?dnZmMS9rYzQ2ZENwNTJuN3hUSDFjbzlwY2FqZmtGYVdPTW1lc0loejRKZGx3?=
 =?utf-8?B?bFdtUjQwTGgxRy93QUY3dTlBQnJkRlVnYTVjd0FNZlBPL0djVTlmMDhMTjhG?=
 =?utf-8?B?TzdaUEwyMkc5VWhPbllLdUhBME8ra1JBTFhtUFJGbkdVTGp1OUY5eFZFeHVp?=
 =?utf-8?B?K3A2U1VsSzFRRkZOZlM0aVU4eGRQZG14dTFrMjBwOVptc0VGWkp0a3o4c2U3?=
 =?utf-8?B?eG04S0FvTjFGRUlTODRBdStFUjIvNUhYRUdQR3llMEtIRnZ6SU9RRlVUdXB0?=
 =?utf-8?B?WmFkSGVRdVB5SUpnUmdSaEdLdTNEZ1BENTVaUkpEMVJxSVcvVGZCQ3hYZXE2?=
 =?utf-8?B?aWlxOTVXaW9OQ3ZORjhtS3hCN2NHWjF2ZVNhQlc0cElEMDAzcXpzK294YjFD?=
 =?utf-8?B?ZmtoVTIxZnNrMDB4RXhQbCtlaXBZdWdVSDcrY2plK1ZMQ2dqYmUxbjRTdU00?=
 =?utf-8?B?M2t2YW9XZmhlYTJsTmh2SkplcWhJbXpKUnZnVko0YWgyeXFsa1oyMHZPY1lQ?=
 =?utf-8?B?RWQvZVpYMUJ1UURtMUZRTVVVQVk0UzJ5VnVqRk8xY2IrSEdxSnY3Y0U1ZTAy?=
 =?utf-8?B?Slc5UkQyV2FSS08zNmlMZXpMNFZlbnN4WFVxdG5QTFJ1YlpyUUZXM0plK0ow?=
 =?utf-8?B?ZGs2OFphRlNaWmNwN1BqeEZzYkpqUVlDV2d2NC8xNlJHK2lTcUVhVkZ0Z1l4?=
 =?utf-8?B?aUZ2aHZRT1BaVDhVeW5aaHVvQXFFdjhnOFhjSDhuM2psTDlTTjJwQ01ab1dr?=
 =?utf-8?B?RTROeWFSZyt0b0U0SkZZK2hUUDljM3NQNm0rUktTMytidld1cWNXU0pOWVp2?=
 =?utf-8?B?Wm83NmI3aW1nMDZ1enVmc0pjSmhiYUlVZ0U5azhoQ3Q2Sys1akNSMGYxNm5B?=
 =?utf-8?B?eWRXVmF2S0EzSW1FcGsvekZpdWNpd1l2T0VFNkFtNTI0UWMzeklwa0NjeHdG?=
 =?utf-8?B?SnVHN0lUSVIzTlRxdXMvWlltaFh0WTFyVTlrVkZTWEI4WUhvcWErOHlMVVk2?=
 =?utf-8?B?NnM1dkkrK05BbnBWNjl2b2FHb01teW1Bdk9vL0dKNzh4eXQrTk5BMVkreUVT?=
 =?utf-8?B?WFowWHZqT0s2WjFVdEpjcXcveUVNbFV1VUltbXVkc3RKSU9kQi8razZjWVov?=
 =?utf-8?B?MGxvbjh6Yk5CR2JxQnVRVEZUVU91RVU5dHpzRmM3NU04NnczNmFTWHM4dVJu?=
 =?utf-8?B?Qi9xTkEyVnFoWm55NDZVOS80Zm90eExpaUpuMERPam1EeUU2WXFxbmxlUnRS?=
 =?utf-8?B?M0M3MWNjOW5yNFpUZ0ZObWhoNnRsVzBWTnBUNkk2bUJYeE4vN1lGT0NJanJh?=
 =?utf-8?B?RW45NjFHV0lnSG45eVZkZHF1dGxrMTJqTmM5M1BwSHFRa2FlR1loRmtFZ3gr?=
 =?utf-8?B?TFB6M1N2VDUrY25XRXdlamJ2RUkyK290bEUrMVVaWFNjVFRpTmNvSTdmZmVw?=
 =?utf-8?Q?cKnxChJ04bZOLST0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9090ad4e-162b-41d2-5e1a-08decbb7baa7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 14:58:30.5129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ck7GZi9vNt9Gg633f+SeDjD9p0cxVwj4d3QvNzeEtrm9sW0u2WMxnVEJPBH8/86nVI5EKXNeVVfyCZRQmWhbmbaKSo0FQZpkgfZU4LvkL5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8306
X-purgate-ID: tlsNG-bad1c0/1781621912-89775A53-5C08D809/0/0
X-purgate-type: clean
X-purgate-size: 1433
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,m:marmarek@invisiblethingslab.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[invisiblethingslab.com,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3918A690B59

On 16/06/2026 12:20 pm, Marek Marczykowski-Górecki wrote:
> On Tue, Jun 16, 2026 at 11:13:36AM +0100, Frediano Ziglio wrote:
>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> Currently .init section is both writeable and executable, split data and code
>> to have 2 sections satisfying W^X rule.
>>
>> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
>> in the pagetables.
>>
>> NX_COMPAT is a requirement from shim-review,
>> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>
> Is that the last piece necessary to satisfy the NX_COMPAT requirement? If
> so, I suppose a subsequent patch should actually set the
> IMAGE_DLLCHARACTERISTICS_NX_COMPAT bit (IIUC ld --nxcompat option), right?

The manpage says:

       --nxcompat
       --disable-nxcompat
           The image is compatible with the Data Execution Prevention. 
This feature was introduced with MS Windows XP SP2 for i386 PE targets. 
The option is enabled by default.

It turns out that Xen is being marked NX_COMPAT even prior to this
series, which is deeply suspicious as it has an RWX init section.

~Andrew

