Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN8eLQgdvWnG6QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 11:10:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286462D881C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 11:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257959.1552190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Wnk-0001fw-JY; Fri, 20 Mar 2026 10:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257959.1552190; Fri, 20 Mar 2026 10:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Wnk-0001e5-GD; Fri, 20 Mar 2026 10:09:56 +0000
Received: by outflank-mailman (input) for mailman id 1257959;
 Fri, 20 Mar 2026 10:09:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fzpp=BU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1w3Wni-0001dg-WE
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 10:09:55 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id effe851f-2444-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 11:09:53 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB4920.namprd03.prod.outlook.com (2603:10b6:a03:1f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 10:09:35 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 10:09:45 +0000
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
X-Inumbo-ID: effe851f-2444-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgR1HysrEL0A8bC6z0XgMzQ0lpVGcgTHrjRDUc2+WiwR8Gnn4vT3WfeFwtcP6R9D2FTaC+U2jB9zSXJjnu1y87Sgnm3PogE32Haz1RwYq4p5FJRBYQosUBAF+PnoNofXNHUhduRshWqjlgJoYY28xQwucRTs7OykRZroE1XaxWQDU+Zw0t40pwMfzWLqVgscbmxjyaqNTxaSdvZWLK2UsnjgOyKXpWU6dM7aNHRD/XLaR5IV5kRBd4qjGNKdYhZxZ8oyOmxAitRQwsJC29otSb8gyKG5lPdZaaO6IFmc7EGIfjsNGL9CQ6Xr3M2TztSeYvWCWIfd0xDbMT0RyoaPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdHj0ollYoHajv2Y7fAO1ASxdmpiobJmo7d9gFQ5HTw=;
 b=fEwP+noxglfePLWmOpQiDAVEduoGPGPRT9kmf7sm1kRw2S68/ZE4Mf5ReHCyy+Md08ydz1FMQg9thhgg2hKCejsH0sNJcVIQyzsVStmxc3dKJiMBhTF5bxutbe0xKaQUVaHH5Yp0XNKKxjHVIfnQ7Fi/16sskAh+b4zyU4fu3zjoK65W3qgIu7zgtbkGG0xWuazcldyd/ADAOcBLRtZLkncy4enr7P+UilcXV0ixAnnIfew2sCAwoO/02SHhpsy7fLvr3LgL3jPgsnoRwke/ZvunsN2OLRfRbYRkpHK1sDfGCDhsSr0SvTVUFPJEuA8goPQ+sFkA8npN+JAOpIVlHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdHj0ollYoHajv2Y7fAO1ASxdmpiobJmo7d9gFQ5HTw=;
 b=sM8xyTgOmOIuZqH0ni42t+/c81Dfxa6wnEgSUCq+802xZp7Jxx80r17i9b4SPMHTT9rHbWyPG8BScrZU8GAooWFa/atStf3qOZEJ5EDctq+sbQjkKN+irc+GWosDWyzynYqyXlQJzrGiNt2A5+RFLLuqfHhgj5OhEMGuZRyGc+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 Mar 2026 11:09:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/hap: Defer NPT P2M TLB flushes
Message-ID: <ab0c6mCL2JqALJF0@macbook.local>
References: <20260319114041.1455593-1-ross.lagerwall@citrix.com>
 <abwCyyhBusfh5Qvu@macbook.local>
 <72944656-cc83-48c8-8cd0-9fc5ccc6f96b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72944656-cc83-48c8-8cd0-9fc5ccc6f96b@citrix.com>
X-ClientProxiedBy: MR2P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d784ef-9de6-4a37-7c62-08de8668cfd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nguFAHDcbJH7nfbAhUk0Nw31dUCqL7bgr+baa9NG+ezmBDhENRmedMpIDtQY3dMoP1woreFFoKRVRwoRoC7x6uurqGf383PYrxyJO15+nbpg9jWANzP2LfX+y5vtZEnvEgjayO4tcKyJGJDMi6xYWlzyjzEYm/tceARnNudW6t1e4pKgqvdYEC6Qn6AYgainWLGdnnQM6lPAdyWU0KmXMCLIM9OFwPoyjRgIWltarxxKpKG76IuT1vXM6LwsGSOCTvkgQEn6s7pRxmwpOLWmnVfJP58aNEetht0RyMWVDnLQ7ifHvoNUfn8vHeB6Gi2c9R0+XAoKq1BenSR+y+CMxtHfrwM33/GmCeqN51HT2WoBGnrIvcOytsLQWK0yONB0F8IyVZxj2Gjp11NtB3ueFI7r9JsCHUpuB10Z9+1aWK4mvEZ8y/73e9095xvzgWx1k1dUHUk1BinZHPtP8r22RisSRfHczYYAe2phKkrbemmGoB6WLd+8KlXB5Lyrs5OD3g+yipii8o6pmZB9B3tT9Ap23ZdosTDlXfGzrzW9PoI1erVLbkz9qCcXPUpJNKozthvAgbiGOiMSA70UkSebdVXcCnLZF3kvwuXEV4AyTvPZwCmm0P7jTKxQ9umVgQrDfba40f7lBKDWRNZVtoMzWeLWbmY177HyH1zXAh82C2NRoAS/Gj7AM8/IbYAVRzu2Tn8dT+PP7Bwdi1kFGb7JkKVFshOqf1x3mTPaTFJXlrI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Smc3Slkxa3RUeW9NVGF6aGVMdnBKRnhnV3J3S09PcHkyZ3IwQTh1MkxXNWt6?=
 =?utf-8?B?Z0I1bE9hTWhiVDFacTF3SUxkVS92TXVhKzRHcytWNENTU1lxUW9JdUJVcEth?=
 =?utf-8?B?d3lYVDNZZWNRL05yV0ZTaWM3MEtKWnFJWVZncVREZi8wejlpNnFMbEIyNHVH?=
 =?utf-8?B?Ti9EeStxMmo5a0RCcVpvckdjS1ZNT3RhVnBoU0RFb3VidmE1RXg4eXZ4SzZo?=
 =?utf-8?B?cWVlRjVvOWprNkRBMG5ENHVrRy9BZGkzT3ZHUjNFaFJPMWxxMTZheXNOZkYx?=
 =?utf-8?B?TUZCd0JjYWpESG52TDZFa1Q4ZFEwZmppUmE5QlB1UkVhbGFqdFJ1TFU3Y1JH?=
 =?utf-8?B?OS90WEVBMTVzVi9iUDd6cTNKVDg4aXkwNVFSbzM2eFQ2T3NUaHJBSXcrUzhv?=
 =?utf-8?B?M2RJZEU4Zk42U3U1Q0Z5SHJOVlRORHBCaSswZ0M1dHlReU45Yld1ZEltb3gv?=
 =?utf-8?B?THB1cjAvWjhrVUhQcHFmUzJ1cUhpb0JSVlNFQkkzWHRGdmdzY2VXT3R1dXN0?=
 =?utf-8?B?RFJ5TTFxNlFKTWltZC9ielRvRkExb0Nidyt4NFNXb3JlYXNBZ283RTZYOTA5?=
 =?utf-8?B?SDJMZ25WZXZqMHdTdVU2bVZGOEVLNHhyQ1o2bnBaU2dSaDU5d29ML2RFYlZw?=
 =?utf-8?B?WWxjK0Q3dkY1bVFWb1U4NEUyTG5OOWVvWEwraFhWY2pLbHVBUTQ4WHRPbUtM?=
 =?utf-8?B?dk92T283dnVjZmtGWTNRd2w3RnU3bUprYUIzYmJWY055SUhINW1FU2dySFZk?=
 =?utf-8?B?ZDZ6NUNzbTdXSkJEdERHWGVEeEdvM0wvdFJZM2w1VDh4S1ZHb3ErTGNEd0dU?=
 =?utf-8?B?Y3JJcUVXU2QrZXVyUHRFMmI2N01GcThFQXlTVWhLeTF2S0NHblFpejNPT1FW?=
 =?utf-8?B?QkJKVk9rVVE5ZEh2Z0FETXpKK0lYdWttQldoTjkvNHgwamV4OUo4dzNGT2Uw?=
 =?utf-8?B?SE9ndHZwMmlYMzBCbkIxeFVmMGRHZmVMUUNOZktQR1l4RUU3RTBJUFd1akw0?=
 =?utf-8?B?VEk2SzNOVUIrVUlEaFBlVXFYdyt2Y3Z0Q3V1S1lZc3I5TXdUQ0ZXQ2VPWlZW?=
 =?utf-8?B?bExtcG9RVFpJZlhacStHTml5SmgrQUY0b3ljaTcwbG1UUmsrajZDK2hQSUJN?=
 =?utf-8?B?NUoraUR3c2pieHoxMzRBMmg2SXRZYmw4TEkyMzJ3Q3ZQbkVqZnB3bUtUTlBG?=
 =?utf-8?B?QjQwcFJkZm9UL0owNHFWc242UWtPTEhsVHRuQ2wyMHpBdnV6R0lSQ0p4NjQy?=
 =?utf-8?B?SndGNUVTd0tZY0Y1bkMzNi84N1JGV2YvemMxZHVoSCt3Wk5uQ0RyemtwcjZB?=
 =?utf-8?B?eHh1UXhFMjFRdlFES09pU01oZ3VxeFRDS0NqRjZEMHFsNmtMeUVNZTZYRjNp?=
 =?utf-8?B?VGxiaEJSaXpkNHVYNmFzS1lxMytOS0NlcTNtQ1haSmxRK2tmbFcwME5nYnJU?=
 =?utf-8?B?MVJDc1hMY0c5UkJFSzB4OVJUS3ZVTUFhamJBUkV0aGxra1NzTVVPNUU0aDZS?=
 =?utf-8?B?WkF5b1JmSWxheGc5clRmYWtVWTkrRStjK2dWektSaWJ4T0RXeEtMcEY0Q0FP?=
 =?utf-8?B?emJnc2NSbGNocW9vM0l6Y0dkaktydWRtSEZseDZjQ2JUVVVvVFlISUIvS0s1?=
 =?utf-8?B?ZU5BcUZlQVI2dktxa0Y3RUZ6SGwxeW5DWXBFeThaaTh3NC9LRFZSc1V6OWVC?=
 =?utf-8?B?V1pwZXI0MURjVG9BQ0xOeHRwb2cvUG9MUG1wNVZka2xDNlEwT3RRL01SMEk4?=
 =?utf-8?B?YjMyWkRraW9EVzAxVWZYbkEyWmxsYmZhaDNCZHVQa0h1UlY2K2IzaS80Z0Iw?=
 =?utf-8?B?cmVvdkd5dDluOFZaYTRkZ3dLemxDajBKQXh6R092VS8wL2hrTG5JOS9hdWRj?=
 =?utf-8?B?SzRMa1VBSGRsSHc5OTE4TWhYUFJKcDVTYk1Mc0xQVHF2YkdvOUtCcUNPSk8v?=
 =?utf-8?B?czYwbVVjZUZlRllUU050UmdsZjVHMHIzR2o0ZXBLM2RlTG9UcFVPVm5SRm5J?=
 =?utf-8?B?M3hJcDJmeEgrSHByVU15NXA2bTRpY1Mvc0lKOFB4Y3lSRDBDY2RrUXp3Y3dK?=
 =?utf-8?B?NzM4S20wQlF6RTFpUVo2MUdmZ1FjU3pZdlRxRG84UUY5SjFaVHdHT0NycmVW?=
 =?utf-8?B?WmRDS0hmTVd4VWdHQW1nb0ltMGpIM29vNloySkhhamJKYVRIS2c0ZXlWY3Nr?=
 =?utf-8?B?L0YvWnYxcm11cW1GVGt2Ym5ueHcxRC8ycnJzOFFJNWZRb0RYcnRFaGh0RFpr?=
 =?utf-8?B?d0dZUHdnKzZ0TlNDTjA2b1lBcXVjMXVXeUhpN0ZZbyt2aHo1RmgwdHdmbVd1?=
 =?utf-8?B?aGg4TmhvZUsydDljOEgyU2VCT24xYkp5bG8ySXhnRkkwYldMV3EzQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d784ef-9de6-4a37-7c62-08de8668cfd4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 10:09:45.6591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQLXPFVZlSDBVp9Y8j7tKBX1LRSWmi395mfnSpIOe2lsRbzsyt5nAmfLSWAdJP/LMx3KXGHlxLQ2Ay8sn+kPsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4920
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 286462D881C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 09:44:39AM +0000, Ross Lagerwall wrote:
> On 3/19/26 2:06 PM, Roger Pau Monné wrote:
> > On Thu, Mar 19, 2026 at 11:40:41AM +0000, Ross Lagerwall wrote:
> > > Like the EPT code, defer TLB flushes for NPT to reduce the number of
> > > flushes and avoid holding the P2M lock while flushing. This can
> > > substantially improve performance in some scenarios.
> > > 
> > > The cases where the TLB needs to be flushed without deferring are
> > > already handled by the call to p2m_tlb_flush_sync() in p2m_free_ptp().
> > > 
> > > Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
> > > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > > ---
> > > In v2:
> > > * Tweak commit message.
> > > * Call guest_flush_tlb_mask() if the assertion fails.
> > > 
> > >   xen/arch/x86/mm/hap/hap.c | 22 ++++++++++++++++++++--
> > >   1 file changed, 20 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> > > index a337752bf488..67137611d9db 100644
> > > --- a/xen/arch/x86/mm/hap/hap.c
> > > +++ b/xen/arch/x86/mm/hap/hap.c
> > > @@ -814,15 +814,33 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
> > >   static void cf_check
> > >   hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
> > >   {
> > > -    struct domain *d = p2m->domain;
> > > +    if ( !(oflags & _PAGE_PRESENT) )
> > > +        return;
> > > +
> > > +    if ( unlikely(!p2m->defer_flush) )
> > > +    {
> > > +        struct domain *d = p2m->domain;
> > 
> > As you are moving this around, and seeing that guest_flush_tlb_mask()
> > takes a const domain parameter, I think you could make this local
> > variable const.  Possibly the same below with the other d local
> > variable.
> > 
> 
> Yes, that makes sense. Can the adjustment be done on commit if there is
> no other feedback?

Sure, I can take care of that at commit time if there are no further
comments.

Thanks, Roger.

