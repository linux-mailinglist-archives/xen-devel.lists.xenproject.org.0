Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D39179CA7F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 10:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600119.935718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfz1r-0006tR-Qc; Tue, 12 Sep 2023 08:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600119.935718; Tue, 12 Sep 2023 08:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfz1r-0006rW-Ny; Tue, 12 Sep 2023 08:45:51 +0000
Received: by outflank-mailman (input) for mailman id 600119;
 Tue, 12 Sep 2023 08:45:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfz1p-0006rQ-Tb
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 08:45:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c55e8e71-5148-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 10:45:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7349.eurprd04.prod.outlook.com (2603:10a6:10:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Tue, 12 Sep
 2023 08:45:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 08:45:47 +0000
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
X-Inumbo-ID: c55e8e71-5148-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vc39y5ZxBtY0qrgDJIWL2cwN59KSlUo2fR56mg0CXFIQB4jwimtU8ribwcNYZUUSIj1gfbLQGqzVhEJbebY72PZj/GNVyKeW0qcN7F3ak/TroBYpRpw9X5uKAVxzsq8G+2HthQAxjj8G3kCWBD8tr2d+ZC66SxVDm/RdvaIhHmkwcnsUoMKqG99DjDoluw+ekDHR3Id05K2Vf3FQL7Ij/uk5KpqibQxlJr7isETaIR16GKxmm2+WKKiaP/+v8Oeq8ZjShTlLO6ACDPEsnyp8r8upTIsmquhC5HAHSuYMq/CjmjGhCeKvMo6tTSwGL0OPErrGAcNOA9M16wJkXUOZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWkRdfk+IPrLOBxE49LOH31J+dIxCYNC+1KTgN3kBS0=;
 b=c5kyEiZalSO6mKKpjkOBPJgSjJRkHOzvKSg96KY+N88arDYtxeHOo8zSFUzkLHM1lKUY+4U/SrE5ikTNWymbuvnJdGreH/F1L9plF9UVXh4tlydYApRRMKuV/KMux6NuaUTmYWD0Y70fkWv1SW2GMcoCWrCRsVoTTPxpap5sbcArfTIoJfvPl+P0N9bo6kUb5e4NaoPK/ld0Kly97AKgpIR35wlO7SmqAZwHR6d15VCw0QV5g0IoqvWwWLF0tJmWOlHas93ffRP770mfgVgKgkVC3Kr7zuDRnAHngcPMpDA/msnPPA8lezZMEg3jpLphtjrM0i1PKlAqw1Sp4SSKSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWkRdfk+IPrLOBxE49LOH31J+dIxCYNC+1KTgN3kBS0=;
 b=pMPAvG63XArmVO5CAsOaJIjSPdc/DuKbdO/VBGqOnR50owxc+wqb5ve9M7bTEBcb85ZVDqwcng8IZu+6RpPl9EeHIwEhKthcHSn1zvsePzTUk1RxuJcCBdIz9Et/SFmcNzEtTT2Q4zAHmX9sDv6jk7xRucnWeuPQ6WxRxuXtty4eweqmC1hkwNjZlnbXomYJNSUWgNaa47qvCs2WHZ8WyAVebVC0bKsOLZxdUZysQUu8kHrtxvedLPwnkE1lCUPy7mZcsOVBCUS3qajpngU3/h39OTcQsPlruV5+HUs8d0/3MLRpXhOZMilKhDyIRpXcjK2NA3eiWu9Bocyn5OC1ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab57c2c3-f527-fa55-0443-270d784a50e2@suse.com>
Date: Tue, 12 Sep 2023 10:45:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
 <89f112fd-70c6-c191-ea52-e2caa6495ac6@invisiblethingslab.com>
 <f780d40e-c828-c57a-b19c-16ee15c1454a@suse.com>
In-Reply-To: <f780d40e-c828-c57a-b19c-16ee15c1454a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d41a65-d2dc-45e7-3524-08dbb36ca892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qNnsMJRR8KI8lAjDTnjN2AQDIqkbLA3YUTcz7TGSJbHHRi3bSTW54Qcx4Pgoiaq0AbfG26t46AlyHJfJM3aezs2aLDY0zHCtG7ol1Tvt4TRmMWHPGXsdl+14faP2meTn0CD/kiJMH6s07oyqAYMgtuswTOOxGsmJ4qCx8vemRlzOinCFFGdeFpR5G6vsBTk1amEV2YoTAdp+B0T44BclFriLlUz3bx0fm2ScQZBINO6e3Z6r3ulWfuC0KUSSewv/4br3uhcRQnSe87bGFOrRTqV0ve4+4oYU6bKxW9JdJCjxKJYYePoY7zAg7HpZDZ6bnpEbjcB6uZxUrBd2Zl2zSko0sOVYnKHENN7IcXVP5ciDUjA5zOp3FgQJ/qWL4Nb4A5rMTRXpBKyAP1b9hCaANoU9uXpnX3QiBDHTpaccWdF2nhHxjWsFxa2E0SMMi8XCnuKZw33CzQH10OwA8oXBQrXrrrqI5jfgkDGl1nmgdRxyhsTCtVnsSoN2l6CIC3IGbUBPw1gs8Xx/OYr2Sd3M7iSaKMYYjSwGt4OVDt+bBvjMRwoPxqrBlCZ5+yTncEjZTImUntOiOpT2VY04CEW+KdKSuZh8k2AY45M6BhUcQ8pFjJ8hJ49wLDfT277rOLUgDuf+BNylWWH2ZBsavYxrWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(186009)(1800799009)(451199024)(53546011)(6506007)(6486002)(6512007)(83380400001)(2906002)(478600001)(66946007)(54906003)(66476007)(6916009)(66556008)(316002)(8676002)(4326008)(41300700001)(5660300002)(2616005)(8936002)(26005)(31696002)(86362001)(36756003)(38100700002)(84970400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDFac0dtR3BLWUhVcS9GcEpHR3NKUHJuUUZoMURvdTdGTEVBUmZ3aUx2VlBM?=
 =?utf-8?B?SlA3anJZZUtvWXVYbkl2Q1dIMFBsemthb3UvVEF0VnJHYzBhd3VHU3ltOW1Q?=
 =?utf-8?B?bmxzb1o1SC9RYzZxTFBWR255MHg4Y2k3dmk5QnNWU2U3TWw0MGZ2ZlpZNVpM?=
 =?utf-8?B?R2VmNnJpNjBOeC84OVdnWGFVejhDcFUyK05hL3NZSWdialFVYllxbXBKY0d0?=
 =?utf-8?B?RGptZHlxQXpncmxoQ2g4aEVGdjcxd3A1NCs3anIzSk43cWRlN1REVUhCZGRi?=
 =?utf-8?B?T2QwNWVhQjhhcHNJMFNvMzhSa2JJelpHRVdFT2liR3FaN0I5NmdadjJRZmhD?=
 =?utf-8?B?Tmtub2JNNVR2Q1BETlpFeTVjM2dSTXBsekczQ1pIMktlRmFkSjJ5NVE4UjRK?=
 =?utf-8?B?RENZQUdvUGhEQm13eDAvSWd1SHl4UU9tTGgxNWFBT2dYUlFTRDJLSnVSU3du?=
 =?utf-8?B?TXFlb1Nyck5rM3JNZ1lRanU3TDgxcW1ZdjJCZGN6ZFpjK3ROZEtXNFhPNmJj?=
 =?utf-8?B?MS9ab011WWtCTG4vRk5nK3kwMEFCblA5aTRHcWNFYVl2N2xqRWdGNlBVUTM4?=
 =?utf-8?B?d1QybXJvUDJKLzBlTENMdDBqbGFzL0RvN2h6RWhrblFPK0R0WnNBQzdrRWkr?=
 =?utf-8?B?TDdZM1pWQm9rZUI5eHc0VExyOVpLT21TOWROSkNKY1p3WWlUU1BwdWFLSEhz?=
 =?utf-8?B?SDZDQUlzN1FVcnhiLzdmNGI2YnNockFkWDJUOGVwd2x4U2FOWkw0QzZ2M0xn?=
 =?utf-8?B?T0QzdVZVaC8vK1NnWHFKMnVIdFhpcC95cDNadnJ6eWdlTTZYcXUxN0p2RVNR?=
 =?utf-8?B?YlE1RnVqVWpUQmxWWW1oQWFHTTd6QXBoQjBrS25Na3Nndm5XVEdFMEtkekhN?=
 =?utf-8?B?dXBWcXV1MWlRVE1qZzd0alcrczhJY1NBUU5EUW1rN055a0JoTlBWRDA5UFli?=
 =?utf-8?B?SWNtSUpTbmFwM05ZOCtzeHZrMVBad0FieTI3L3g4MzN5TDdKK2YrMGVJQjR6?=
 =?utf-8?B?THN4cVEzeDhOdlkwUVF6cWNHSFREWnZuZ3JHd2VsVURqcEg1MzhTV0lPM1l2?=
 =?utf-8?B?TEFBdVJPWFdvMjRJTWVORG9XLzNpamc1cjlDR3NkVXRWaDd1cTdWSnJZSUFx?=
 =?utf-8?B?NlkvVmQyZUZIMHBuMW5sZkJEUkxXbndHSFlYY0hWWHBKM1pmS3phd2Y0L1NK?=
 =?utf-8?B?L1VPZnRhdHdaVmFxelMzam9kRUZ4SlhLNU50VE55MTZ6R1FSQlhMTDAzaDFu?=
 =?utf-8?B?dVB6MUI4OWZpQytVaEZzMXgxMWFGRHVOY0YvWkNoZGRxMXZFVzFDUXZaTFVa?=
 =?utf-8?B?cTljZ3VVZHZkNGpqTCtlLzFCME1nL0ZZZWw2ZHpuS2IxTTkvTUVKUTRiY01m?=
 =?utf-8?B?czVtcFFqTlVzcWxaN2FNWHNqWU5NdEFQZmp6K2lsNDJFK3RSMmRteGlQUytC?=
 =?utf-8?B?dFA0dUdGNll1V010ck1UUXVNYXNhTklUMVpsZFYreUNqd0Q3SnJldlJkRjQr?=
 =?utf-8?B?c29zK1ExTnRIc1RtdVlxWTlKZWIyMFZuSGtXTnNURGVPd1ZYQmRZeFVobkVN?=
 =?utf-8?B?RTRMUmlsc0M4N1JkbUpZSW9EMTRNZ2M3bitLT1VmN2VyTnZIdDdsWTFmSThE?=
 =?utf-8?B?NW5QempxSVJJWldXUlBGNGZNYXY0RlhHUkd2b1VGQitUSkJUdmxsajhvNkl3?=
 =?utf-8?B?ZGhDeTZubmZhdGYyaTIvWXN3cXVtU0ZVYm53SmpoWHQ2Y2tXOWMrNm1aLzVn?=
 =?utf-8?B?UlBoVEdTcmxoT0QvRlJ4NEZMMVdDZ1ZIckthelRWUjJUMXFtZHkzbFg1T3Zo?=
 =?utf-8?B?SHJ0dXk4OHBrRHQ5VUZZS1NSQlNYWkdqNzFQcDNHbWs3ZnRKSEpsMkkvZkRk?=
 =?utf-8?B?WFI1cU5EM2M5WXJpREtOWUtURmltTCsxdm9yb1dhb253SmhQek9OYnRPUGJ4?=
 =?utf-8?B?VjB3Nll6Y1pORllUWlNTNitYQU1mZnJFMXpyVkxmRXJOaW11bHRmNVN0WEM0?=
 =?utf-8?B?WVBWcVJ4MEtsbjJlUEg0UmFtLzVtRS9HLzhjUnFUWXdlcm83NmRiRTR5Q2dC?=
 =?utf-8?B?RytPS3BDYmROMEsvKytsdGN0K0NEQzFFTkxVY2Y1T3FncVQ3K1NTN01HWjZ0?=
 =?utf-8?Q?8yyDhFaEetueaZoZNOmhqqAt4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d41a65-d2dc-45e7-3524-08dbb36ca892
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 08:45:47.0464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmxeT2Gvybz6+pDIWlcqNj/n8v6Pms9gLQGKf4H7SLBnusqxSWWwuToUIasgEhSdtTwDZVxuuV6AbQv9JkQCDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7349

On 12.09.2023 10:41, Jan Beulich wrote:
> On 11.09.2023 20:05, Simon Gaiser wrote:
>> You also commented about not logging the ignored entries. Until it's
>> clear if the change in general is accepted in the end, I considered it
>> pointless to address that detail. If you disagree and want a follow up
>> for that, just let me know.
> 
> I take a different perspective here: The patch shouldn't have been
> committed without this aspect addressed, either verbally or by sending
> a v2. I continue to think that an incremental change is warranted to
> make sure logging of entries, at least with "cpuinfo" in use, remains
> consistent with what we had before. Otherwise debugging of possible
> issues becomes yet more difficult.

Oh, and just to add to this: Because of excess verbosity resulting from
such ambiguous MADT entries, for many years I have been carrying a
private patch (reproduced below, just fyi). But since those entries are
still in line with the spec, it didn't seem appropriate to me to
propose this change for upstream inclusion.

Jan

--- unstable.orig/xen/arch/x86/mpparse.c
+++ unstable/xen/arch/x86/mpparse.c
@@ -809,8 +809,13 @@ int mp_register_lapic(u32 id, bool enabl
 	};
 	
 	if (MAX_APICS <= id) {
-		printk(KERN_WARNING "Processor #%d invalid (max %d)\n",
-			id, MAX_APICS);
+		static uint32_t max_warn = -1;
+
+		if (id <= max_warn) {
+			printk(KERN_WARNING "Processor #%d invalid (max %d)\n",
+			       id, MAX_APICS);
+			max_warn = id - 1;
+		}
 		return -EINVAL;
 	}
 



