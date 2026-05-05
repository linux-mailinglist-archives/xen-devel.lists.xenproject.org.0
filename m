Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L1LGBH++WkqFwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 16:26:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB384CF5D4
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 16:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300732.1575233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKGir-00015S-Im; Tue, 05 May 2026 14:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300732.1575233; Tue, 05 May 2026 14:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKGir-00012m-G0; Tue, 05 May 2026 14:26:05 +0000
Received: by outflank-mailman (input) for mailman id 1300732;
 Tue, 05 May 2026 14:26:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKGiq-00012g-5e
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 14:26:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKGip-00A5QV-IL
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 16:26:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f9fdf3-e002-0a2a0a5209dd-0a2a45098d12-32
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 16:26:03 +0200
Received: from [52.101.53.43]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f9fdfa-2497-0a2a45090019-3465352b61dd-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 16:26:03 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH4PR03MB8019.namprd03.prod.outlook.com (2603:10b6:610:242::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 14:25:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Tue, 5 May 2026
 14:25:59 +0000
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
 b=rDdR37g1ehbSae5RQSt2XfDM7KraNYqeZACPJFxGKObLDnmnCO+cR/XTOY6vIh2sq749IpMoHaoeki1yGK+rH/YqtJEau8a8uWs24jEnX9XhgXr0I4sbpXfNgIqQUAE2oJzBQSdCv9T3sPnkMMdDyfrSteQUJxDalpGcfU7gN9C9zmyB/BSOp1DMuGyujhRaRMNnebfU61X83UrU0T1fGci0Dby2EF33TUQ8wXwna4LAmdnqc+PeTv4B3Cds+kIINOhrh7y2Eb7XoAyD2vhKSERI9lEAD3voVkNv/09B6ef6NKDfFhjsYKqYi/CKtHbBZmy0vflIAly5oK/vS1aaAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS6iL4GPi2V7a4pSVK06PY2KwK0Yxn4Q413oDigm/1o=;
 b=IEKeMsSiauSCv/J2ecCax3186ZNoB1N3dWfyahAv6gZYhw/OR+AHznP6ptYOPid/6icP4Oo1yACq4utqFpzBY/54uldTbvxK6OmcMTI/gV2zUUE9wbQQz4ZXjybwojrFdVNXT3yWuKPzPAH4bJHjwMNWZovXr0pJ0i0GJqQvS7CE2kMMZ2lFfZZPZ5XTNWd6t3haniEyoe2YLICkp7PoLn57cYA18VW9iPqRWRDedOlU4ykp5CMGOYpdNn165A9FiKKjfJ7u3rmUBkOsUHmnxUymT4Bg6bU5SgnaXs6WyywN1vJIKFu6iZ2WmNWSkv1LLTlO98TDoUPjk9k/ieS1pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS6iL4GPi2V7a4pSVK06PY2KwK0Yxn4Q413oDigm/1o=;
 b=nsUW2N6gYNitN9LVZPbF3955FbyeUv3j4zCB9TvkPbbJom9FaC0R9YP2+wXAEt7pYoGQrF0aobOACojl+lS9eTP98yVNX17Jck3xv5EpeB47EJYQlAWUK92FzP59wvp2ZJC8boGEKyElW4i/VyRJ2T5TFeBX17a6uV4pZs7K328=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 5 May 2026 16:25:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alexey G <x1917x@gmail.com>
Cc: Thierry Escande <thierry.escande@vates.tech>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 04/17] hvmloader: add ACPI enabling for Q35
Message-ID: <afn99CqdQcuN4pfh@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-5-thierry.escande@vates.tech>
 <afCQd2rTmiGpR_bk@macbook.local>
 <20260505155816.0f8ad76d@LinuxLaptop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505155816.0f8ad76d@LinuxLaptop>
X-ClientProxiedBy: MA3P292CA0047.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH4PR03MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d4a065-fb7d-4803-906b-08deaab23a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Q61XJouJC/AKRKG+XvAjKHkMe+AZfQgmsanpM9C87CFC2/oPxaPB3OFhOqd0QMK3WICuhG8+udkh5vVKI5HwPcPKUEWjVIwJFEsq2eiiGlDWJVKHxP4Zg2CC7SdqGK8v19T+fd23BB5KLKBXk4uOSWYIpV6kCU61M5ZrKubtqSDwJnCLlmVc0Z/nDJlG1DQ+QNtMayTnjGxkyYkbXbX52zn2ZyXT5HStCHbFCN629Gl08Na6If7WpHfmQyjgZjTzNW/aDBJ4LQDKJsMqYYL4FkvQJ+GxM/1TUhsrp/aqOHW3jurrsdviRuf2cAzpGPfSLopuvdBO+vLKuumDqe8NReuvySD3d7+32Czxa65ng680ahy5d+8ykkdmgIbqKorNyMiVgyqXizuKlt0YIr5G206lKi+DgWzWi0B5xxWIAgUo1o86pMIv06+pccV3Qm9vZUs5Utdse9sPbrwXGXrwpKZffgApTe0tE+DLjtPF3rBnZHt781buBhfIo0tgKEXFKnZyQOsP4NPvwSetqersRClcMVrWAKtV+fi20d1m99RvUkPBUs35UR/ZVn+0IrVgROwFqXV8D0juEydrH7Y57ZXtbpPmZft658Wn6odD1WLGlyQYj/syDqsEgvT0rVVgGIw1t2g6FU0nozwyltFhqbn1FczvX2HNjmHyf0eoTsSGKDI1MxVSzRxFPJQRs2Pl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjBlaVZBeEVKQkRFbHFLL2ErclVubHZZRyt4S2pmUWVFSk1Zb3l0dFdEMXZR?=
 =?utf-8?B?dDdiNmVrVUdLdThwVVV5OG1TMUhuWlFrYUZQcnRLTWI0Mm1OSTAveGsvZUIr?=
 =?utf-8?B?MHJkMnBybmVvTi95T1dILzdhcSs1SHpHRStsaFJ6SGwrcHBRU2lkR2FkSFcr?=
 =?utf-8?B?dUZGZkw3QVpTY3BNbUJHdE9Tb3d2NllrU1orQzRXQnZCcnhKbmw2OFMyUHZo?=
 =?utf-8?B?NldEbFErQmx3eFVVbGFNTkJqK0EzMEllKzdLV2dXUlNkY1FnL0F1cnFoWEl1?=
 =?utf-8?B?Q24rajdjaXJOQ2RYZ1lEU2dFZjE0U21uVjBWa1dOeUdHYU1lM2xkYkpRN0dX?=
 =?utf-8?B?R0RCWERRZFFDczg4RHNLYjdlR2JDZ1ZKbXlSNEFzNUZPcUhZNDc1NkF2dHZN?=
 =?utf-8?B?MzdlZmRPcWJzMzNjbnEySzdqc1NJWVNvSzNsV3RMb0piUnhYY3NxY015bjIv?=
 =?utf-8?B?TTRJbzZ1SVNFdEdQZnRKNzRTS293UDc3Y2d3Skpya1BOSjRCQW1lSUc0Wi9k?=
 =?utf-8?B?OE1qem1uU2JicWxOVll1bStickFMQUVzS1dsVmZoTnd5VUp4bk5jNzgreVF3?=
 =?utf-8?B?c3RXdzhkUlVHRjltaW9mOFI4MGdZZGhYRTF0cVhMZzVmdzdwQ0JBSlc3RjFG?=
 =?utf-8?B?cTlFc1JpUkk1V3ZpUzNBZUtSa1BPd2poZEZsc05jbFgyZnV4NzQvb3BnVnhE?=
 =?utf-8?B?RXRiNkN1aW83V2YvSVoxb0lIQiszNHhUZDBBMGhjaEhZaHZNYitpeGR0bVNE?=
 =?utf-8?B?K1ZBUjROSDNHTFNLSjZmT2hFTXBPRlpWNDVybWFlTitXY0xIUERna3BpaW1S?=
 =?utf-8?B?ai9jay9JR1VEYnZ4UG5idjFnM0YxTGRreXZQbGVUVHJINnQycXFYS0kxTzJ0?=
 =?utf-8?B?OVZkaHlock1xRjZvbGFZUXVXN1REZkxFdnBEK3BJZzNsZEp4MkhxaldnUVc2?=
 =?utf-8?B?WVNGVjZ1QU5xMlEzazhYblVxNnFRa1Y3NXlZQnk5Y0RQeXBzd29zcGNzcWha?=
 =?utf-8?B?cTlTcVpDRnlDeGJEaTU1UzFFcEJWdFRuOTVEVDZ0QWFYakhuckZ4Kzk2TkxT?=
 =?utf-8?B?c0lpWm9VZmdWNkVmUFpDdTI3T1Jzb2dTNXRSeEl1QkNKMmJOc2xWbnd4Nm5x?=
 =?utf-8?B?UmV2SHEyS3FnSzFnaWdDbXZHbE1ITExDNXpza20xUEtUc01NUEpOTHpVTFJX?=
 =?utf-8?B?aG1nU3o5VTFyTENIQnBrQ0xYRWxGWmtUN0V3MGhWaHYrVFA0UXpPWlZaNFVr?=
 =?utf-8?B?Sm1NTUZrS1ZnRmQ2VHdsNzVWRi9uekZiK2lsd0VySXdJV2VJRlJudzcwRFFt?=
 =?utf-8?B?elZJUHp6N2tGQVIrWU5yRndlUFE2bWozSzQrbm1lZnpTdXAxYzhNRXJTSG90?=
 =?utf-8?B?R1k2eWtsSWRzVEtRTzR2TjVub1ByQmhIbzNwd2FhVjFXSHN2ODc2R1JnZWQ0?=
 =?utf-8?B?UTBqd2pUaUZGbE9aazUrZTJmaWtkWDdKY21QaUR3UE9yZmdwVlgyU1dPSHc0?=
 =?utf-8?B?eXFPZFY5RDR0d0c5SGZSOTREM3hOOEdZbEpRNmgrQis5bW5vS0tEWjAzK0p1?=
 =?utf-8?B?Y0JGZUU1VjE1SzdZY1JFaVZoTHZFVFhOTWZ3ZEFkZlM0elpsSmRtLzNiYWI1?=
 =?utf-8?B?OXdmdTNiWVRIeE5NeW8wMzZtdWsrQi91UERnbG4vd01qVlYzb05aL2NmZGt4?=
 =?utf-8?B?YVcvZkZKRHpNcUo4cVkvdzlSaFZhSndWWDhtdGlBekEyYkxuazFEM1dRMmhu?=
 =?utf-8?B?UWI0Wm8yb21yZ3JCaUczUGp4YllLVVlSZjllSklaTkhybHVsbE5FZW9la1ZB?=
 =?utf-8?B?eEN1STRNOUtLV045eU1Wa3MwQjlNOVIxak1GSHpRYS85T1hNZ01GdWgrZ1BK?=
 =?utf-8?B?V2xQZmJoNHNNbk5jWUQ5WlUvOFlFY21Hb2hIVVo4OWpwN3FJTVNVZTA3Q3dy?=
 =?utf-8?B?WlhpUUl2QXdVZlpsSFBVeUw3R216ZStpcC9BSUdkV2tOR2t3M0xlSzhabXo0?=
 =?utf-8?B?NXVwK0tTeHlQNDlYb0lWQ2FWalFrWjcyQ3JKcjgxMFNMak85eGJWYUNZeEdu?=
 =?utf-8?B?clFyQXgzUzhxZFd6Rk45TStsdHo5VzFLekxkZXBsQkdvWkk5dWtOcVFxZ1Fk?=
 =?utf-8?B?dkUwa0JoRjdxUTJTdjJ1dThJdk9yeHEyRFNXU1piQlNTUWNuVXJoQ3BGdmd2?=
 =?utf-8?B?QnZCMnFNemxVTE80Q1V0aVpwWVhwOGZic2dGVDJpRzZWNEVoSWhpQnVQeUth?=
 =?utf-8?B?TUtBanFvVGxlRGJlWHg0VWY4aGk0eVAvMXRLTU1rek1xK0s2QTNhNlladXdJ?=
 =?utf-8?B?NGZIc3dML3FqWWU1cjRDRmR1NEFxbnYwdGhTRXdPVENCVExtUWc1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d4a065-fb7d-4803-906b-08deaab23a13
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:25:59.1055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMVgkpsQ3QihwU4eUI1YRVtzeF/6d87qy9ks2WnqVsoadyBizvAANFkRM78dh7mC923UZ7rslW1rpA+eGngj2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB8019
X-purgate-ID: tlsNG-bad1c0/1777991163-4216DA53-0C367687/0/0
X-purgate-type: clean
X-purgate-size: 3334
X-Rspamd-Queue-Id: BBB384CF5D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:x1917x@gmail.com,m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,citrix.com:dkim,citrix.com:email,macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, May 05, 2026 at 03:58:16PM +0200, Alexey G wrote:
> On Tue, 28 Apr 2026 12:48:23 +0200
> Roger Pau Monné <roger.pau@citrix.com> wrote:
> >On Fri, Mar 13, 2026 at 04:35:05PM +0000, Thierry Escande wrote:
> >> In order to turn on ACPI for OS, we need to write a chipset-specific
> >> value to SMI_CMD register (sort of imitation of the APM->ACPI switch
> >> on real systems). Modify acpi_enable_sci() function to support both
> >> i440 and Q35 emulation.
> >> 
> >> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> >> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> >
> >Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> >
> >It's not great to add more stuff into hvmloader when we want to move
> >out of it, but it's also not helpful to tie the Q35 addition to the
> >removal of hvmloader.
> 
> I'm afraid the only option to get rid of hvmloader is to move its
> responsibilities back into the firmware (SeaBIOS/OVMF). But if I
> understand it right, the whole idea of introducing hvmloader originally
> was to delegate Xen-specific parts of HVM guest initialization from
> firmware to a component managed by Xen itself.

Maybe originally?  We then ended up having to add all sorts of Xen
specific logic into both SeaBIOS and OVMF, so much to OVMF that
there's a Xen-specific target/platform in OVMF.

> So, to some extent hvmloader can be considered as a part of the firmware
> itself as it does things like PCI BAR allocation etc which are normally
> done by the guest firmware, but with more knowledge of Xen specifics.
> 
> I guess this hvmloader/firmware split model was introduced to have more
> freedom/maintainability/control - I suppose it's much faster and easier
> to integrate Xen-specific changes to hvmloader directly then to
> upstream them to SeaBIOS/OVMF codebases.

Faster to integrate possibly, but then we end up with IMO a lot of
duplication between what hvmloader does vs what we could offload to
OVMF.

> But other than moving hvmloader's responsibilities to the firmware we
> can't do much I think - HVM guests expect to have full freedom over the
> emulated platform. Among problems are non-standard (chipset-specific)
> devices which also need to have assigned resources like MMIO ranges -
> and Xen doesn't know anything about these devices and their resource
> requirements (left alone how to configure them), yet they still need to
> have correct BARs assigned with no conflicts with other PCI devices and
> to contribute to MMIO hole sizing. This is something which cannot be
> solved on the toolstack level unless Xen emulates the whole chipset and
> knows about all emulated chipset devices - we limit ourselves to
> MMCONFIG now but there are more configurable ranges like this.

I think we do want to move a lot of hvmloader responsibilities into
OVMF (maybe SeaBIOS if possible also, albeit that's a legacy firmware
by today standards anyway).  Whether we would need to partially
offload some of what hvmloader does into the toolstack remains to be
seen.

Chipset initialization would possibly need to be done by OVMF, at
which point we might require PVH guests that want to use PCI
passthrough to also rely on OVMF instead of direct kernel boot.
Anyway, this is quite distant future.

Thanks, Roger.

