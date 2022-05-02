Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4A5171F7
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 16:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318942.538954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlXNf-0005GX-9n; Mon, 02 May 2022 14:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318942.538954; Mon, 02 May 2022 14:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlXNf-0005DQ-5h; Mon, 02 May 2022 14:50:31 +0000
Received: by outflank-mailman (input) for mailman id 318942;
 Mon, 02 May 2022 14:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlXNe-0005DK-57
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 14:50:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3540ed31-ca27-11ec-a405-831a346695d4;
 Mon, 02 May 2022 16:50:29 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-WO2FxpqlNAilTZ16bgm4PQ-1; Mon, 02 May 2022 16:50:26 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR04MB3208.eurprd04.prod.outlook.com (2603:10a6:6:3::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Mon, 2 May 2022 14:50:25 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 14:50:25 +0000
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
X-Inumbo-ID: 3540ed31-ca27-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651503028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJrJbHnR5IvjWVQmiVA+rkI1XMQdg7N6W4+aC//8XL4=;
	b=hcrZ0KKSAuDV2FEGrTLbw+Op1fp8nB6iqB5RFgjvTwnGNoJiY2awS9piO5K/sr5396etUq
	ZLMBOZVVYuGP1S0cH3WSqqgj6w5cArFAn08/GkpukdgOlJiT0HgC+iy9BLN3jgEBKtAGnR
	pn1glC9vQqLt2GTzHr/8AavFrrBPtQg=
X-MC-Unique: WO2FxpqlNAilTZ16bgm4PQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQE6WzOn6VFs3C3pVAKoldrFg0cFLJ1org+zARJVBWt0h7Lb4Rgh3mJ7FAfxCZ25Qe0AKdkqtx7mYAk+cBLE2XtApHUN6sifKQ7NTotbUdurgPu7UIZuOvigwRMafh2J/DW3SVqvXK4QXtYSxWVTabCU06nNH3+SvN6nVnFP6RP1n2yVpPgvvltYJv1VeQvA/+6aB7aEtjDhe6QAtbkgxeoU8HmSSghaq/PeK0zM0R9X8RX9f0ea/hb9mAMcm2dbmBtPN1zZcUlzv5Q8ZPHY/ksmZoQuUQKzi+7dSTfn91UYMyMMRRulHmL+xlUUPQORzlEQ78MlvZpLcnpor2ER/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJrJbHnR5IvjWVQmiVA+rkI1XMQdg7N6W4+aC//8XL4=;
 b=Vr9Y6WY4j1r0dL5hT2+W9WymTo5OLJ0Fh4kvZFUpdAZ12tF3sMSIM6s7ZCD8FT+drPluC2I0T45aPWR44NpGCLzn4z9Kh2J4D47xChd6MZ5WLZVET5Y9QDIZlCFtbOj4tjqd6Fp3rDxk1e3zpPIG7Pi0CtK0Q1UcX69hNTtGbQNkuIlHaiXwsTfgaN/mU+yzz5y93vtscr4KycAO0pisZS6h3ItHPsp7d8ORYjElKw6MZyyZanwVaJU0RGgIBR4AVneUiWJa5Go3YNIcXAPvyJrOk2YX9VRaDOIYeNFBqFeX9L/U14ooC+U80Ue5iiFsvNWDsQd9ZDMsY63G/AgITA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e2e5bf7-860f-5777-ea18-2025a9bcf2e9@suse.com>
Date: Mon, 2 May 2022 16:50:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: x86/PV: (lack of) MTRR exposure
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
 <YmubOeYPqW5mBNy4@Air-de-Roger>
 <2a229df5-c341-9ff0-ae5c-cc0d848d7cea@suse.com>
 <YmvDjI4hmmhZ90fi@Air-de-Roger>
 <c4ce882d-dbbd-7633-22cc-1c014b328ca2@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c4ce882d-dbbd-7633-22cc-1c014b328ca2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0151.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87c3540c-5df1-4fec-ffe3-08da2c4b1759
X-MS-TrafficTypeDiagnostic: DB6PR04MB3208:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB32083587259A299AAB8EF10AB3C19@DB6PR04MB3208.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PzIPLZPaKzQfjVcSpp6g2nGZnVlpdGU/bLWSzMz/fh5xmoUgB9czBM9OyGrp6ut/WTfSZNHnPi/7UVnz7P2/vL75TQjPGWCOeGSC9rEbBwpcfSHYD2Zrdc2waPNiN1XBMZN6GFQJqqYluZUSgqsCN3XYIMrlP3l4bo7whKibrMBzJnJnmWW0xVhcRpTN8gMDiyx0gfH+rHB6jkBM5y5QT1LGtMO+sCFaBeU01PGebHPCRzl4YuZX+Qz4RwEF6/XTbko13fxlmyOGJ2EqqQXk6PkYjt76VfZRPCDz8kzSOjntB4ZwwTbkBZFlFxMEB6HP9fTujkSGvNbhX0PSHWAswUYKZ+J993Z3Zn1kd1T5YsTptjOgY3V+Ub2Rc7R0j0afxMKiLSUOcYGlj9/9J7hTLNUcQgcqg7aEVifHZkgawFvMs+2ylAgQtIN0b4ZVwMP0FdryDBWX1KvUvstyGA8XrYiGtvsvZ4IvP/22esS7yVWATYtPjVOtts/QFAE0hRWA/3IvgfIFRUeN3+Ym2/jjkFyzujITeUOShDjfzR4YcJvV9uMlVRVne2S8+muHWurFmnYz+fSWek5em8vYdoqoh5TfEfmQkPt0ZsjxWvLoOya3I1zOJZvFOgrI/s9K1ca4PiWUSnCIdabO5NNRQf3pE4749gJz6dkVj4Iz7GV/LE49kuoJkVv1n6EdkrzFasvKtNdgmIOA0kJRDHKjcdtAyjZLn0oHwcDDxirG3gwJW+ETslHkMraToZ2oJ0RDM2tb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(8936002)(4326008)(6862004)(6486002)(66946007)(66476007)(66556008)(5660300002)(508600001)(6512007)(2616005)(6636002)(316002)(37006003)(26005)(6506007)(186003)(54906003)(31686004)(2906002)(38100700002)(31696002)(558084003)(53546011)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlRSR0FDcTFWTUNTS0lSNXMyTTR4dUFWVFFxKy9oVDVDNGNEdk1EK0hKM0VD?=
 =?utf-8?B?Zm1sNG9ZRENYRUMwcDJBSDZDOWdHZWJEN3dPKzVUcitvamI2RktHcFg4bnpx?=
 =?utf-8?B?eFFLZ2p4ck5RQ3J3YkREYUxzNllsNTFxSzNoQk5rZnV4Wmc3cnN2K3pISmRY?=
 =?utf-8?B?MWtnT2N3alB4RkhlQitiNEJIMThsOXg3N2lXNjNXZmI2WWVtN0p5d2ZqZGU0?=
 =?utf-8?B?TnRuVDhwMExleWFSZzRudXg1NWJoUUY3SUZ5RzhHRDhiTDF1eWlyNTVkcnVN?=
 =?utf-8?B?ZGhidDR1U21BQUtnWU0wc3hsVzhqNWxyTWNUcnJ3SWIwMjA1OC84VzFjZWRw?=
 =?utf-8?B?cVdjVjNWU3UzcVZ3cXJzb0pUd0xyVHM0L0pVajFFLzNJVk9EdFQ0UTVwRzhU?=
 =?utf-8?B?bHRoWnBMbmNNQUJkZFluamVCN1hVTDNWMlU3eEppdDkyMDlOWHhMSEN6bzVP?=
 =?utf-8?B?RDkvM3FzakdxdUcwN1lTVlIxVmlZbkdBeXlaRE12Rkk4MXdXVzZEVkNadkoz?=
 =?utf-8?B?c1oxa1FDemZEdnh5THdELzZ3QUhZNndkZ1dWS3NrbHVndFppSUlubHZsSjB0?=
 =?utf-8?B?enN1S0pzdXR2WEFuV0tlTEVuSzZObWpzeGxjTFJsdWVoVlJzcmFmc2Jhem1R?=
 =?utf-8?B?M01WNURIOUlRWlExYnUzRS9YT0U4MWt2Qjl6d3JjZ3FYd1VnRy81b2UvN1Zq?=
 =?utf-8?B?SGxhczFlbmxtajBXaHpKQ1hFV1kvL2JBRGV4MjRVbm9Ud2JLTjE3R3NuMzVZ?=
 =?utf-8?B?dmNuVG16c0tzUmVzUlhYKytXbDNiOFVZTTFzMjV4UnVkbE9xODVtY2JSVkZx?=
 =?utf-8?B?aTlBZEJnSFE0MFFnSk5tejROUVR6NGgxeWNyT2p3ODJsWiszK3FIc2xXNmlM?=
 =?utf-8?B?Y1BvZ1FKb3hZSi9CUnZDY1JseW80YjhnZUFRRGx4L01USlgvSFIzcnV1ZmVw?=
 =?utf-8?B?Sk81UkZkVnhTMXBpN1lLMWpqbkhRbW9aMzA2aTdydUR6SXNKckhSOWZaTnV0?=
 =?utf-8?B?andnb1NBRnBUMWpNWHk1bkR6MDVNS3h3OVhlcUxmUGNSQ2pEb3d3Q3VscG0x?=
 =?utf-8?B?alZzeENhcGZGT3FiaGVFTWtjenVGTEdORjIvMlg2dno0eXVYc0ZlWGNWQXhk?=
 =?utf-8?B?d1VtbU1tMFl1RkJRR1oxNkU1ZmdGNUhuUlp3TWNBejlEZktuVlF3amVEb1lB?=
 =?utf-8?B?UlFjSzBJWmphaGRGM00wZWh5akRYY0szZ0xIdGl3QzlialJHT3JUc0d0eWdo?=
 =?utf-8?B?dENVWEpzcnBBbXJvNDgrd0ZndThGTDNMaGZNU3h1SWdoNEZUMjJkdFE0U0Uz?=
 =?utf-8?B?eEJjS0VoSnVYVytTTVdVelBIUWVUTGFUV2kwRldiTTFwTU1uSGp6bHpJaXpW?=
 =?utf-8?B?L3VCZUlHYklhOUxyQzBNaHNjZUJIRWFYdDhacElKMHczRFIzcjU5N2ZpKytT?=
 =?utf-8?B?TTl0S3BaTWNySHJvM3dJRU9HZ2FSbE03QmZFQ2N6bHdhaEROSW52cXQrOTR5?=
 =?utf-8?B?RXB6eVJjWkFMdno4dEwrUnJHSHROTlV5cnBDaWNHNE9wamR1UmFqWGIyMi9j?=
 =?utf-8?B?M1RMUHg2bGtVRHNUWnZ4VmI0RGd6SWVCYkRWQ2JVb1pPNWJGR0hxQkdJSDVm?=
 =?utf-8?B?a2JDMldYaXJpS2lUTmdIbkttcDcyT2NFTDd2L2FCK0g5dTZ4SGI1VG9zL05M?=
 =?utf-8?B?VC9Wa0dEWTlwL3liY1VVcWEwU0hwWmV3S2tQNmRBZVZEQ1RUcW5wZGZwc1NB?=
 =?utf-8?B?a1I0cXFobjExT2EvZDFFWlpHKytEd0pBNXNjU1o3M1N1ck43TTByM1BRdUpE?=
 =?utf-8?B?YXphVUdDUUlEWnFkRWNxZS93NjlMbXhRdkFva2dBMWFlR2Q3ZkQrbmJUYXdk?=
 =?utf-8?B?VkZhOXIxYzFyaXZhMkNWWlIzam5idlRGNHRPYUFxRHF0cVVQQ3g5dHFPcERL?=
 =?utf-8?B?YVhndUtGWG5YdUZqa3pTL042ZWxhVU1QRmRDNFMzdlpWQUhSUWt4YzQ4NlNF?=
 =?utf-8?B?dFJhUWlDRWt5eGNDYndoSWZhN3ZlQWdrU2FuMEY1MTlHaytOS3IxYzR3UlJw?=
 =?utf-8?B?SDBVVUNQVngrOEZva1ZmSDdzUzNtclhrU1BPU2MwNzFMeXlXVGsvS1ZYb1pX?=
 =?utf-8?B?REt3U1haUkJNZzhOb2FKTS8vaHYrMWhzd09qc1lZaXpZNnJOYUFCSzRPQTE1?=
 =?utf-8?B?dXQzYlNhdk1wY1dRdFYzd2dOeFNHYWozbkYyYW5BVkF0cWdxbU9EYlRXM0Mx?=
 =?utf-8?B?K2pVa29mS2QyL3IwQlphV3FRcmE2ZDBPK2laMWJHaVR0SUVxeHIzNUVjTkZk?=
 =?utf-8?B?dWZQeVpwWTNXRnV1aHlQNnVraGxvZkhocjJ0N05CbUtPcHhEYnFvdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c3540c-5df1-4fec-ffe3-08da2c4b1759
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 14:50:25.4479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mVMj+i0OnBgJ5Ojl1+3jn/QTo+OxjDJuKuTqVKf2OW8VirCWTAPRYVVh/H800y2+PuKT4YH9jGOtn3ntsqESw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3208

On 02.05.2022 16:25, Juergen Gross wrote:
> PAT MSR writes can be handled by special casing in xen_write_msr_safe().

You can squash the write attempt there, but that'll still confuse the caller
assuming the write actually took effect.

Jan


