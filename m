Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPn9LP7wAmrpywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 11:21:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC0951D8BF
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 11:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306647.1578487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMjI4-0002OO-Bx; Tue, 12 May 2026 09:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306647.1578487; Tue, 12 May 2026 09:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMjI4-0002MX-8e; Tue, 12 May 2026 09:20:36 +0000
Received: by outflank-mailman (input) for mailman id 1306647;
 Tue, 12 May 2026 09:20:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMjI3-0002MR-KP
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 09:20:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMjI2-005tO6-0r
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 11:20:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a02f0e1-5cb7-0a2a0a5109dd-0a2a450bb04a-0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 11:20:33 +0200
Received: from [52.101.48.64]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a02f0e0-212f-0a2a450b0019-346530404aef-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 11:20:33 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7500.namprd03.prod.outlook.com (2603:10b6:a03:559::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 09:20:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 09:20:27 +0000
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
 b=yJSuPQ7/6u+LsvjNqB41FHLsMYDpD3M/jQYjg0CT9AWBKSjsN92lwMQvmMpXw2EVMk14mzH1pCiZvuyHgB+QwCGgIBGwz/MTr6tAS2rlJoSwpK+uq+ojMTyxHnpkkYiKzYOtxSBkOu2+Y3O/a/3fhC3s8DJAPnjTahZcY/zQKI2XKZIrDXe9EWFNG3V7bao2BGfd8gAv8Te1VYsjdxnUBN/zVF+mG5bsRbCfwv1ug1afNPYqpRGDIItBlJgFlFsi7eNWqOuKi3CD6G36X4/GW+AaGtT1P4+AQrqD+NNSA+uLnKxkWmVG6nmOx1rIGGyGlXl8fiobhn9ALSSeZeP6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWM+ag0W9mhABysx3tzXRLWlPkiACGfWHmZFRB1ABz8=;
 b=qnU9E2PvIBlN8blnHyF2crqBoR7kfz2Z6/F9ZGoUgjpXBWvyeirQRgmiOpLtqWGBzdySYv//Z5YUimzGnonzMnBaI/e9hbKeAcCQs1BJFX9V7WiN/Khh1TH8CA3kHzBrF60Of3LwKiEctFGs/MoWY92aWXjaUGO/4zqEtkDG71h1GNFBhqbI7D4d5DxytR686SKbQpM/4aFAIevCTdsE3VJL5sg79zjpbnGiF02kLAFeDpCG6oleerTvpluKA/qgISekh6oB29HaUee0qIHXfeVYpz9EIbwmFl9R+a1gVZpxVM8F3tcOxlMrpKkA51H8wvBzaO4XfU6c+RwAGYY/Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWM+ag0W9mhABysx3tzXRLWlPkiACGfWHmZFRB1ABz8=;
 b=h7Y6pCBwoOutBiV57UcaKXx3tQAzqxuuX/hkpDIFuWOOlibdQ89mDLmonPkEIcN69zAc1p00c/63lrXOqWf8R2zynY8oQ5gEhChwTB97vQf8EJHb3Rd5a9mun0+O6KtE+/wXiCIw+XRMuxS60prac6pnh5pmdRimXQgQilhyNtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 12 May 2026 11:20:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] symbols: explicitly specify source file name for symtab
Message-ID: <agLw10IR1KO3tNKX@macbook.local>
References: <f921abc1-1f1a-4ef1-b21b-a65b5d50eafd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f921abc1-1f1a-4ef1-b21b-a65b5d50eafd@suse.com>
X-ClientProxiedBy: MR1P264CA0219.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 635d0b21-7901-4faf-5e42-08deb007b4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	j/XJ81Bj8InSWfsUOHY5658Z1DDjcIHiuNTWR8yg1uDVQRgNvJPndhlCkFzmbITVlgO/tKWNa/jDIvIBjJc0MfQ7+7buKvIys3L3ibBba7pykSob0tJevgGvu2Kpi8KzBrJ9X3F8m/PIK7UW3SJYhlqnkxtpYtiebbtUd4UC4kxs91UyGyHeXE8bODgQijp8tonu1w2AGNDQkSYazku/hJqnv6QwFC08+buBStlEbuMi6aiN4hSY1KKeOmD+CXyBaj2HfrCSsv3LiylIz9jlx8ijuA+1LvJpm3XSaDibi1/Ht3fHIB6dea1O1ZwDMQ9qjtavoJegJKzW60z6dhdxL4za46xEpQ2XKt3rzAZA+sY3Zoikksw67+p3KPCT5/E9aRZsKtgvZFz7/O/ErBLeq3PJM1SKmoNqmAgAijc8yNn+9/QDRt5FEY83tVtRzHxk96+oaGTKaphBLQd9IXOk/igM1F8PNHsPqPR239VdBeHyaL2vVnSzc5/w/G3gS3e5VOiq9q6kZ0QmwAkiy2BXYL/1LncLrpaca2mpTjYCz97ZY3AEC7RBPz1P02UtV9ZevZ9WYtYcDIBngmEEFRLVZzFA30qc7e+eJnkFnOZMZsHN8hjwuljpiOG3GUWnRexkgt0Oe9GO0GStBvBCmk8LXTTGMHPMqZbwZJ2Xr1U51+YnLzjJ45hn2uBJ4yvP7TlL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1pEdVpqaVZKQWlWbnZqK1g0K0VOTllIODZCZzVLSjJoSGFkZVN3TDcydG1Z?=
 =?utf-8?B?Z1JRQVNkS2Uzczl1Rzk1UDAySEowbkJSbTlaNHA5Sjg3c09EQ21STm1pMXFX?=
 =?utf-8?B?SEhlczhuc2lFY2FnaCtyNFNvU3JHQzFmUkpSRzhkVVk2dTR5RlZzSisrMUZC?=
 =?utf-8?B?eElEQkhiMW1rMzZCUTErTFQ4UXU2Z0FzWFJvQW1qbWxVcnMvSU05L3BVdG95?=
 =?utf-8?B?UzhheVZQK00yb01DTFFSRnoxd3JZVkRraklrRzZKOGU0ZFRpTEZvcmNMa0lQ?=
 =?utf-8?B?SXFCOHRwNEV4ZVlQM3NibmxPbFpJb3dWa2FVM1BnVkNLSUQ0NXNncU9KaXdT?=
 =?utf-8?B?YmVBdnkrYjJ1aHhKbEhIVFozRWttU3dmWTFxdVpnVEI2bk1zckVidXEyM2th?=
 =?utf-8?B?YThycGI1NFdLcXpObDQ1SzhmeWZQKzYwKzF4dEdKZWFSajVnWmo5Y2U1Z1Rw?=
 =?utf-8?B?bXJiZ1Z4R2dLZDI3VHFGaXU2RDV2VEQvQnEzTEc3VnkycHR1bkxveW51di9i?=
 =?utf-8?B?Ty9ySlZKeVVFM0MwNjNUN1Ryam1kYStWSFBZQmpYYjI1RVIvMDNIM2puelM3?=
 =?utf-8?B?ZCtZc1JtaE4vcDFVVkZMd0tOR3JkWnFGTkp1dCtxMmYySzY5YkNRZXBsN2pu?=
 =?utf-8?B?b0hmd2l1QkErK0dwYWd6TVl2bTE0Yk9WOVVkcTdGVHNxLzJrMFBYLzN1TDZ1?=
 =?utf-8?B?WUM3S1Y1b1pYWGpuVHVpZXpDSkkxNDhWS1VZVE16aEJvWC93djVHNjArd1ZO?=
 =?utf-8?B?T3ZaWkhFeDNIOWhibjhlcENTazQwVmFPc0pBWURxVjhiS1owWU9DUFYvTlZa?=
 =?utf-8?B?cWJEcmRkSnlqY2sxYVZYRi9TMmJET21Yb1lvdVUxTjl6SlA5RDd4MW5Ta2E4?=
 =?utf-8?B?cE1FNU5nVTVVN0R5SEFncHM1TDNiYURrc3hpQUdnQ1lFdkYxOUxYTUdnVnVI?=
 =?utf-8?B?bE1VcVBvMVZSSmxsbHdXT0hwVHd6S3lUcmM2K2xCTDhsVmhxcmdOcWJJOGho?=
 =?utf-8?B?Y25ORUdBRTROZXdrdDRzZHpiTDZNbkNvUEhxOC9kT3p3SEFvUng1aFdvZHNu?=
 =?utf-8?B?K0VzS3YveHVBVGlZOUxHZ2Y4aUdVNjlBamRoYnpSUkRDdU5haUlVbFF1NENz?=
 =?utf-8?B?U0hmcWVPdkNUT1J3c1M0c2JYRHhDVFJTNUhaNUNweWlJL2kyaThSY2NOcjNt?=
 =?utf-8?B?UUlWc1hzUGI3a21mUnA3dHZnSVlIWXFBRmRReXk2dHBFOVFVQWxpMCtrRHpx?=
 =?utf-8?B?REpISXJOb0cwa3Zkc1FGcGNQbmV6L09kSVY1aFZ2T1hDLzVsNUdITmoyeEwz?=
 =?utf-8?B?bG5yNlJWaWFvVzFURlhBaW8vREJDNjY3QjNWWGVMMjhxNkxSeFUraGJXZTJz?=
 =?utf-8?B?M3VpS1VSb1poTmN6K0hUVVQ2OTRkNkEwaWpqTEJBR0VoRDRpT1MyZE14ZEF0?=
 =?utf-8?B?Vlh0WGVNVEdDZFJKOWhUUHBOMU1PcW10MHNQT3R5RTdKeGZ2cFk4TW1sSTdZ?=
 =?utf-8?B?SUs4NWl5YzZKZUxyT2x0VFNFd0pDYXJXTVRSK3BScjJFTnFRcDh4ZmYxZU9j?=
 =?utf-8?B?VHdSd3RvU0RwME94Qks0bTBkNkdLK1YzTWZxbGZDODV1aDZOVERvcmp5UXlX?=
 =?utf-8?B?RTI3ZHV1dkQyQkZRRmhaamw0TG91ZGZJTWcyNFN1TkNQZkZTbHBIRWhNeHc2?=
 =?utf-8?B?QVNVeWtqTWVXY3hnL1Z1TWdmL2NuZmU2Z0N5YkdnUVhTVzdObDlTODdjNUxh?=
 =?utf-8?B?WElLbWVYazh1ZDJ0bHhwTE00Nm1pZXNZbEJuR2RWWXlQY1VFYUZ0Nk5JYzZk?=
 =?utf-8?B?QkROc25mTFJVUlJ2RWNPYVgzSlZ2aDltNUNmVHhZK3E4NmhDbzQ4VUhNUmFR?=
 =?utf-8?B?WCtMaHR3ZWJhemNZMjEvNkZiVGxYeFRaajl1cjJYVmJ0OHRadEhmTlQ4T0tI?=
 =?utf-8?B?K2pnMkJ0ME1sckhaOU1hRkpCMWhOMUllSmdyS2cyaVoycXBTbHk1SGsySFBB?=
 =?utf-8?B?c2lLK1ZlWlN4eWJSL2hYTXdhWUdXZ2g4NlRSYXdnaSt5ZENIRTBhZm82UWtR?=
 =?utf-8?B?V3FlRzN3cFcwK3dXWlM1QjNsbHErb3BoR1d1K2VHcVlQSzRhdWM1SDd0NXdt?=
 =?utf-8?B?TmNnbzVqcU95ZmhZbTdkanZhUmhoU2VORWVyMkpqeFQxYk9GL0dpc2NnQzlM?=
 =?utf-8?B?K1hLWlJDK1BFVUQyNjlIMWJuMGsyWFRXK3VXNC85RW1VQ3NlWFFCZjdyVUFB?=
 =?utf-8?B?bkhOZ01LcEZBVElSeWYvYmtFTXRpOS94aGptODR1NXJqQ2ZJeHh2eUZmM2hv?=
 =?utf-8?B?QThJNXlTYWFOTDM0V0UyM0o4YnlGMHZjYWlZTVZYMHEyd01zczc2Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635d0b21-7901-4faf-5e42-08deb007b4b4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:20:27.8256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NU9S8kSXCxCY7V4GyrmOQLLmkbNm1hA+5BoAAkPoZZUMywNEv0Rf5E0pTQbapH+fmQFQYGFZDs7I4XyuW/ZIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7500
X-purgate-ID: tlsNG-42698a/1778577633-13D7FF3B-C46EDBE5/10/73395122804
X-purgate-type: spam
X-purgate-size: 2760
X-Rspamd-Queue-Id: 1DC0951D8BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sourceware.org:url,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 12:00:03PM +0200, Jan Beulich wrote:
> If there are any local symbols in an object file, GNU ld will create an
> STT_FILE symbol derived from the object file name if there is none in the
> incoming symbol table. The object file name, however, varies between
> linking passes. As a result, symbol name compression can yield different
> results if any of those local symbols need retaining (Arm [and RISC-V]
> mapping symbols are omitted, for example). If that difference in
> compression would yield a difference in the sizes of symbol_names[] or
> symbols_token_table[], the compare-symbol-tables sanity check will fail.
> 
> Fixes: d37d63d4b548 ("symbols: prefix static symbols with their source file names")
> Reported-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> The observed problem was with a stub generated as Arm64 erratum 843419
> workaround. Such stubs' symbols (imo wrongly) are associated with the last
> input object, rather than the input object they belong to. Also for other
> kinds of stubs, afaict. See
> https://sourceware.org/bugzilla/show_bug.cgi?id=34140.
> 
> As per the above, having a Fixes: tag here is questionable.
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -200,7 +200,8 @@ $(TARGET).efi: $(objtree)/prelink.o $(no
>  ifeq ($(CONFIG_DEBUG_INFO),y)
>  	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
>  endif
> -	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0s.S
> +	$(objtree)/tools/symbols $(all_symbols) --source-name=$(@F).S --empty \
> +		> $(dot-target).0s.S
>  	$(MAKE) $(build)=$(@D) .$(@F).0s.o
>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>  	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< $(relocs-dummy) \
> @@ -210,6 +211,7 @@ endif
>  		> $(dot-target).1r.S
>  	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).0 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +                  --source-name=$(@F).S \
>  		> $(dot-target).1s.S
>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
> @@ -220,6 +222,7 @@ endif
>  		> $(dot-target).2r.S
>  	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).1 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +                  --source-name=$(@F).S \
>  		> $(dot-target).2s.S

Wouldn't it be more accurate to use $(dot-target) as the source name?

Maybe $(notdir $(dot-target)).S?

I see the default is already set to the target filename for other
arches, so not a big deal IMO.

Thanks, Roger.

