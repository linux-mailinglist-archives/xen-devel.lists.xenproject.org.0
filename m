Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8649D241F7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 12:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204859.1519419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLO0-0004MI-3X; Thu, 15 Jan 2026 11:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204859.1519419; Thu, 15 Jan 2026 11:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLNz-0004ER-VM; Thu, 15 Jan 2026 11:19:31 +0000
Received: by outflank-mailman (input) for mailman id 1204859;
 Thu, 15 Jan 2026 11:19:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cICa=7U=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vgLNz-0003bC-54
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 11:19:31 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f2361ce-f204-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 12:19:29 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7431.namprd03.prod.outlook.com (2603:10b6:408:194::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 11:19:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 11:19:17 +0000
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
X-Inumbo-ID: 0f2361ce-f204-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpLNlcoW4ZS/4PZdX86LFV4SElXBvYn6qZyvpbWap/HT0iG/p4VXsDO5JqcxRInLmZximCMpxDuB9JW8O6Hzks3boKV83inZMmJwI2xhcJCE2H81xOLZCxJf9iWs0RRPCPByy11seBucIPDz/2MIptMHp/WNNLWNCzQ04DbGrXt2X9yVodimHSKxOrA/M4OfxhjmnmObXISDzbFzr/dZKmKBcwJ/0JISn+FhX9hXhZgvHT/saZFiZrqyiMohebuCd2KrNXHa57ZZc9i89V2RHrigzPVByU0FK4N0wefTJdihMAxKy7II4+0491CmikWPdYW04vO8bKUVMY9OS6SxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYRYoLFH/OVP5b6Hea05RAtPOi9OmM1ZzKogWwOxcy8=;
 b=sraHMv1h8XjJ0TMXDeyzLdU0YFF2FGreysT32lKNpbJ7cO2wux/HrLt3pAXu3ii2CzqoXaaUymLCFIxrnd0Dvnd+r1bRqGOIGxQ6YVEFDTUaLl/7aNfv57sa12YXf1H7LW+ITqXPsaNTWPD0MKu3MZpRC7EfwaDN6e911/BzKreLh8QCM6ezTXyhaHhvIpgvI35zU1stm4UGr/VyhzzqHngKob0b4t3mZOeWTCrfBIWKPp+fgDygWVmJuQHwi0yNiLcyGMfd3UvGewPzUQ/6Ob7OeWzZRBhcTGzjLuNCGYmWx2YIV7hRs+UTxERwrAd6wpowRi4IuHOdtvD+N0Cw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYRYoLFH/OVP5b6Hea05RAtPOi9OmM1ZzKogWwOxcy8=;
 b=arjkhKQS4bbdHaQYk9pWVhf+tZcdB5E+v1doX47iWoT1jNeuAVAVlMCZWF0kEDEE1lKKireneNb7ROI50Ung1z+9UdEPlIVDeLw46aOLrrh6Fgqft/M2RJLjNyLqotbN3kdvHX2jtlb/v8zQnPfGyoqhLoXsblNDWO4w1AZBatI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/3] xen/mm: limit non-scrubbed allocations to a specific order
Date: Thu, 15 Jan 2026 12:18:04 +0100
Message-ID: <20260115111804.40199-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115111804.40199-1-roger.pau@citrix.com>
References: <20260115111804.40199-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:208:32f::25) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c766822-244e-43d2-0faa-08de5427ebff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkxabVFJQXRJeG1WTmtaUHltcE9aa2ZnaklYU3cwK3crU1Z3TjJUd2I0Z3l1?=
 =?utf-8?B?WVNqQjJuVVp4WmNjWnZhVDBiakE1emJpdXNhTnUxb1F4dkNuSHhsY21KN3p3?=
 =?utf-8?B?eGpHK2p2TWxhbitqNzdNa2FGZUk4WDE4L1pQNTZNTXhHTGp3cGp4MGlmZGdj?=
 =?utf-8?B?Z29BZ1pIK2FobmlnOWN3dm92WlZ1TjNkdnZSSW13cGE0L2o0VlBwcUk3Yk05?=
 =?utf-8?B?Z093aTN4WHA3dkJUNnNwNFk3cnlpWDZqZ05BbTFwUlZOajBjdmlWOUU1NGV0?=
 =?utf-8?B?Y0ZCaXVnVC9nTTErUUx5em5JTEdnaE5YRWpYRGYxQXJuNnA2QlIyUG4vZVg2?=
 =?utf-8?B?TEpwbkE4a2g4R1RSbkMzRkUvVU1LNGRGdmxJWFdLNExVc2tSMUw5UytSY1hO?=
 =?utf-8?B?NUhNY2tHUWNucW9pY0VHN3NvRzRVc21LMzg0K29SYzB4WGNkaHo1alFGMjJN?=
 =?utf-8?B?d1ZJSEgraXNGUTdFM3VUdDFsNHE3akFZbGYySXd3UkQ1ZUlURGpHM0RLUE1s?=
 =?utf-8?B?R0k1M29sMzE0eHB4T3lCc1VhUG1uRHZIbzJWUDh6ZmE5WFQ3VEQ0ZmpGNHpi?=
 =?utf-8?B?M3RMcUNzQ083WFhoNXZRQ2V6TXFibFBwRDRZVlFZZldVTWp3aU9WdStQTkF1?=
 =?utf-8?B?RmlyQzhDWXhOZXZFaFNoaFM0R09Dekx3WnhJaVhBTWZIZStrMXNGdkMrbmpI?=
 =?utf-8?B?eE12dGM5cnhWQkJuQnZFOUVvcFAzdHlOeE9IcGtpTW9sRjd1dDBiUUowZmpv?=
 =?utf-8?B?eE5tQ0hoR1dROTNoanJ5RFQrTkd4L05ac2dDVDk0R1p0NEozSDgxcU51TUhq?=
 =?utf-8?B?STd2UmVyMlQzdkJySVBKNVdINS9wU3lVcDZLVk9nT1l5SWtXRjduc2dYVDE4?=
 =?utf-8?B?dzVVbDdlZ0RQRWowN2RiZHM3WTNUYUdudTlTcXdTV1lFYVdtd25BMnp4aDZu?=
 =?utf-8?B?RTZ2RnNtQlJVQ0xUVjZxMUl3bllITEZzcGR3cDNWaFFTeVRVRVZPZWhzUzc2?=
 =?utf-8?B?ak5Fa2FKWXJVZ1hIOEZkNmdvVTdMMkI2eEZkeGN2WFFGQWxQclVSZ1ZTcTg0?=
 =?utf-8?B?dWgzeWxkQ0hkSzZxOEx6Uzh2ZVhISUhmZGVNMHpOek1ZZzloR3ZUVzV6am1u?=
 =?utf-8?B?YklXalRGSTQvZEIyTExNSVlLRDM3ZmoyZDVDZ1JKc3FrSDIyNHNaTlhCbVQw?=
 =?utf-8?B?RUpQVkREaG9TTm1vaHNnUVM3STNHd0pmYjFvSGxyYlJpaDhmZjlrZkh0bTht?=
 =?utf-8?B?NElPTy9PQ3ZvLzlaMUdpYmlrTHVvUm83VVdQTGduS05oa052RXlWZFZMY3ZE?=
 =?utf-8?B?SzlPUXFUQUg1UXBsVnZNcDE0alRlMWRJTnRZN1F0bVZVM2w5TUZSMUdWdTVH?=
 =?utf-8?B?d0xYdGJCdGRzSlgzVmFIYmlkODBiL2cwQVpoVEtQY2c2MEVXUzJBQ25sWkV5?=
 =?utf-8?B?OFA0SG9iUHJoTFF5V2hOTmh0bWl6cmpzckJFM0pnQ0JEYU9SYTZtWVBnYkx6?=
 =?utf-8?B?dS8vOWVRZElGUWYwa2NKTDhoY1BWblVUZlBId0N3S0lSQ0puYnFhcDFISjJs?=
 =?utf-8?B?ZzNpRDR0dWo2TEs4cUM0VVdMWGtOUjdBNklQRmJ4RkhxT1BueW5XOGFCMVQ4?=
 =?utf-8?B?c0hEc3plOEszUk1Vamk3b2cwYmhFWWE5SGIrTHNmSzVHcExQbVIyUC8zUWxX?=
 =?utf-8?B?c1ExZXVlMXZJM0hxbkR5VWJCV1d0L3JPWTJUMjhlL1dOZGxOTlIrVFBUekx4?=
 =?utf-8?B?WnNKOTJZa0JSdWg4U1dVZ2JPamhRdzkyVjhXTTlNWVVWcVhEMDJqRzdKamNQ?=
 =?utf-8?B?bmZyeDhKSFhlL3hrU01vMzBwWHp6WWRyTmdYUm9qbTZoOWp2TllnT1lNKzBp?=
 =?utf-8?B?dFVvb2VIcGVnZGsyLzZzdXc0Wmcxb0dxNytTUVdlaE1EVCtKeUIzaEJ0TURO?=
 =?utf-8?B?L2xya1V2ZHRkcFN5VitWejBScjRhOHBjNGYzTForelJ4dnhnZk84QnJqTzhR?=
 =?utf-8?B?WnBVQXJ5MXBEZzh0U3g5N2hqZi9uYXU0UUo1ZzFZMlRYeGdsLzd1SzF6N1lm?=
 =?utf-8?B?bi9Wcll3QlZSL3VLYUN3SitocXlCNk9OdXVmcVJlaldmRG5YV3BxYW5heHNs?=
 =?utf-8?Q?tveM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU80ZzRKdzIwRTlrdlF4VEdJQkdkM0s0Q0t6bFNsYVlwS3F3cngwRVhIbUh4?=
 =?utf-8?B?cXE3cjZKaXcvY1Y4dmxpVXdFcHlXT2xYM2dLeVVJUG94ckJFT0dUajFhcU5x?=
 =?utf-8?B?RU5HbUJid28rYy9DdnRtVjFiNy9KSk5xNjUzZGlQbk8xN2VwbENkWlQxNTdP?=
 =?utf-8?B?REhhVUE0c0FaOXhTdDZSbDVOUlVqSG83MWdpeER2ZmJWUVB6ZTNXZndBVkh2?=
 =?utf-8?B?RkJFS2JRRE5mR1dIMWhtSTVRUXVWMEo3cmhUaGNuSVZXLzJzYjlLblFzUjRU?=
 =?utf-8?B?S0dMcUhXQjBoVGI5bVZtUzlYQU05Zm9QN1J5VEVkcTcxNXZPaEpPTjlZVFBN?=
 =?utf-8?B?L25TZGoxekRyOC9XYlRQZUUzVEJ2OEd6cEVMQjdJWDU3OTQ1a3Q4bTR3aE5O?=
 =?utf-8?B?TVF5cnpPNTFmMG5Id0xLNGNLOCtvY00yQ1BvTVcyV0NPWkdGeW1sSUUraklH?=
 =?utf-8?B?ZGlURTM2b09yVElEekZpQ1Bna2VQRGt1SW84RXV6V29ucWdNYWwwYmRRaVRU?=
 =?utf-8?B?dGJhRWxXM3Z0djFTbzdXellCT1BXdGJPSEtBWDgxaDBydWpmdFM0QWxLNktl?=
 =?utf-8?B?QkNJTDdlZXpVZUZqdmdvUFdaMEdic1NiS1B6cFpJRVpaajdzQ1lOZHVFKzNn?=
 =?utf-8?B?T1VVYXZnaG5MWitwU3RVLzdCNVhQTHp5eFZwMTBqRlVWYVltVFlEOVh4dDI2?=
 =?utf-8?B?N0FrY0FSYXhLVlYrM21jaUkrcDliSVErNVBpQWRxSU1ZRTdlak9TMHh6a3dP?=
 =?utf-8?B?d2FJUG05RDNmeXJ4L1RJdFFPQytOVDB5SUlaOWgxWWpjd2tQVjA2d3drZ29j?=
 =?utf-8?B?ek5oUjVheU1sN2ZYSEZ3SWZ0SGwwMEtqWlpPOFpKNzNFUXArMFRMSHNxNjJi?=
 =?utf-8?B?Tlp2NDZsSGtlS0R4QS9adHJoNklxR0RRN0t6cWlSY3VVRzM2ZXFqRXBDbHk4?=
 =?utf-8?B?Y0FydHpaWklTbUtvWC9SYVZETVkrVDZvMXRhN0hKM2lydC8vQWJGdFJVNWxX?=
 =?utf-8?B?Tmx1VDB5WHZmS0RLYVE0OTJzRURWOWlVMHBNZHQ4UjBraGJNN2R3K0JtVFBq?=
 =?utf-8?B?SndwTWFwcy8vSWs2UmF4T2MwSlovUm9HelVIUnI3VjdlOXhQbzcyV0cySnJQ?=
 =?utf-8?B?NGhYYUVRNzRqSjM4OWQ4ZHF4R1FYTmJtajJrekpnQk5PZTA1clFFc2NIc0JV?=
 =?utf-8?B?NUZjR3czUXF1RSttbUFRcURRNmNRank1UkpFMm5sMStXZmJwa0VRQ1pad0Uy?=
 =?utf-8?B?Q2pUN2JyVDlhS0c5V29hQ3JsVEVtamxsNmlzcEZHcTZHSFFKQlFGQjhzSWhT?=
 =?utf-8?B?bENOVGNrT0VGcStuZk9kMC9zQ3F1UXVSbWdLdGRsYllNZmtqZHhPTzhIUzli?=
 =?utf-8?B?VWhTUCtnTnBnaXJkMEVNRXp4SVhObGh0RG1RL3ljejJhWVp3aHEvMzJreDcy?=
 =?utf-8?B?VnlpTDBXYzRkdk03bjNOR1padkM0UWRkaTBkWnBndExWNE1YMGkrVHdBZC9J?=
 =?utf-8?B?UTBEZm5pSmVxNWxpdDRGZ3BCS0lLNktiRkF6dTRlMjd2UUxzazhMdVRydlAy?=
 =?utf-8?B?VDl5TkpaNnppaC9VRndNekdVbUQySkdhdGV2YnFHTXU1ZXU3dXA1dS9lZFB6?=
 =?utf-8?B?QUxDSDVmL3FjdXplSFMyanpidUZhcVRWOWZQRDBYTU5LVFVKSUlIdDhIMVJ3?=
 =?utf-8?B?RHBBcGFoQ0RNVkJqMmpUdGpEby9xeTAybzhIRU5xcHJkenplemM2ZGVCMjk2?=
 =?utf-8?B?NGJkcFdwS2hDd0lRY0pBVEhqemUvZmVqaHZWU0hCempDb2gvOWUzc3JqV0JG?=
 =?utf-8?B?bDk1TFJlTzNEd1B2ZWdyMC9PNHcxUFZsaU9VMlR5Y081UVk2MkNHVWgwMjZP?=
 =?utf-8?B?TktUTHVtdnFiNG03V0kxck1EeGl2L2l2MDZKVUFYc0lCNFZ6NTlhdnh1NHps?=
 =?utf-8?B?VmxzOGRGY0VmWFZEWk9uN2dsQ0JUQWR5ckN1MDQ2QzN5bFFvRS9QVlZJTStU?=
 =?utf-8?B?TFZvOHZWc0t2cjczdXhtb3NZK0RyMGhmeU02TzJObEt1eStBeitLNHRkRy9j?=
 =?utf-8?B?ckY0LzFSL2FjVzIwc0JoMHY5RFZtZGVrSmkyUWFTMVdwSGl1ZjJ4aFdycmdW?=
 =?utf-8?B?ZGVaekN1Mk5JQmxFckVDVStHR3hGWUd3OXhGT3c2Qnd1dzVqaUI0Ym9NcktI?=
 =?utf-8?B?UXQvSDcyekE0NnZDdjVVdGtMNDVKUWRyVDRrMVRaS2cvVld1YXJEb3RPbG1B?=
 =?utf-8?B?YmhuSGpuc0NuVlA0d0VhZFhuNFJ1djhxZ2U1WWpueFE1MTcxWnc3TjZjNU9z?=
 =?utf-8?B?aWMvSWRqdnVIdCtFVlpuUUdJalc5NU9rYTFuSGdieGVnUUJxTkExUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c766822-244e-43d2-0faa-08de5427ebff
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:19:17.4639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7bUeytQMKGfayYO+GtGefv2lU2m8PotS+zopPiep/Qq/CaqL3/icEpJplAark2nUvx5RmaClqxVzeefUMCu7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7431

The current logic allows for up to 1G pages to be scrubbed in place, which
can cause the watchdog to trigger in practice.  Reduce the limit for
in-place scrubbed allocations to a newly introduced define:
CONFIG_DIRTY_MAX_ORDER.  This currently defaults to CONFIG_DOMU_MAX_ORDER
on all architectures.  Also introduce a command line option to set the
value.

Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Split from previous patch.
 - Introduce a command line option to set the limit.
---
 docs/misc/xen-command-line.pandoc |  9 +++++++++
 xen/common/page_alloc.c           | 23 ++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 50d7edb2488e..65b4dfc826b5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1822,6 +1822,15 @@ Specify the deepest C-state CPUs are permitted to be placed in, and
 optionally the maximum sub C-state to be used used.  The latter only applies
 to the highest permitted C-state.
 
+### max-order-dirty
+> `= <integer>`
+
+Specify the maximum allocation order allowed when scrubbing allocated pages
+in-place.  The allocation is non-preemptive, and hence the value must be keep
+low enough to avoid hogging the CPU for too long.
+
+Defaults to `CONFIG_DIRTY_MAX_ORDER` or if unset to `CONFIG_DOMU_MAX_ORDER`.
+
 ### max_gsi_irqs (x86)
 > `= <integer>`
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index c9e82fd7ab62..728b4d6c9861 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -267,6 +267,13 @@ static PAGE_LIST_HEAD(page_offlined_list);
 /* Broken page list, protected by heap_lock. */
 static PAGE_LIST_HEAD(page_broken_list);
 
+/* Maximum order allowed for allocations with MEMF_no_scrub. */
+#ifndef CONFIG_DIRTY_MAX_ORDER
+# define CONFIG_DIRTY_MAX_ORDER CONFIG_DOMU_MAX_ORDER
+#endif
+static unsigned int __ro_after_init dirty_max_order = CONFIG_DIRTY_MAX_ORDER;
+integer_param("max-order-dirty", dirty_max_order);
+
 /*************************
  * BOOT-TIME ALLOCATOR
  */
@@ -1008,7 +1015,13 @@ static struct page_info *alloc_heap_pages(
 
     pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
     /* Try getting a dirty buddy if we couldn't get a clean one. */
-    if ( !pg && !(memflags & MEMF_no_scrub) )
+    if ( !pg && !(memflags & MEMF_no_scrub) &&
+         /*
+          * Allow any order unscrubbed allocations during boot time, we
+          * compensate by processing softirqs in the scrubbing loop below once
+          * irqs are enabled.
+          */
+         (order <= dirty_max_order || system_state < SYS_STATE_active) )
         pg = get_free_buddy(zone_lo, zone_hi, order,
                             memflags | MEMF_no_scrub, d);
     if ( !pg )
@@ -1117,6 +1130,14 @@ static struct page_info *alloc_heap_pages(
                     scrub_one_page(&pg[i], cold);
 
                 dirty_cnt++;
+
+                /*
+                 * Use SYS_STATE_smp_boot explicitly; ahead of that state
+                 * interrupts are disabled.
+                 */
+                if ( system_state == SYS_STATE_smp_boot &&
+                     !(dirty_cnt & 0xff) )
+                    process_pending_softirqs();
             }
             else
                 check_one_page(&pg[i]);
-- 
2.51.0


