Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB74D456D24
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:21:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227723.393973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo11R-0002Rb-FT; Fri, 19 Nov 2021 10:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227723.393973; Fri, 19 Nov 2021 10:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo11R-0002Pb-Bn; Fri, 19 Nov 2021 10:21:33 +0000
Received: by outflank-mailman (input) for mailman id 227723;
 Fri, 19 Nov 2021 10:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo11P-0002Lq-Un
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:21:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76ae808c-4922-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 11:21:31 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-QvYLr_5vNNaLS5_My8ecOw-1; Fri, 19 Nov 2021 11:21:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 10:21:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 10:21:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0420.eurprd06.prod.outlook.com (2603:10a6:20b:461::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.20 via Frontend Transport; Fri, 19 Nov 2021 10:21:28 +0000
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
X-Inumbo-ID: 76ae808c-4922-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637317291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GS19NKXjFTcuZWiTvSaFRadeqka4sVuIO4lh4DFHodI=;
	b=WDULcfIX7s+s8mfgJmXGMbAPvzGdXbXOz4V8EA/SaZeUWHSX9HHrtOIZ5Rmr5vZkWMTz55
	HMWEpEwCnnPZWYrLJgyit3nwRpIN3xsb2ficzei5I+1jeAvCRnYOSVnuZSaFsjURkqs6ne
	DXxHn6qszt41tglEtLtOIYPMwyK5Uas=
X-MC-Unique: QvYLr_5vNNaLS5_My8ecOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUXb9tLPbIsfNn140TXGHMGqER8liqGI+RmeDyfAHjDJAppJ2KiTyuuwDAF3CR0mjTgoSnU2KNZaglaJPgJmtgE5DFl4O3TlYSM/M0uxgkugGy1zvQWfhuZ6+iQ/w2xPsi9FObyNcYOV+MZ4e/yRTpWPUpCqOx+Lf2m5N10mrLzbS/uWXkxdeDoJPec5Z9VP+Tj9bS8EvEw6iv87O0e+ax9uzQWsLBVsNA5wOdalzrRw3k4vmkhZDgnThJ8nT4Jr4QWJJESh467y2O5MmOZUC3M8gSJVMu6AVIedVNPz1nX+n5E26m1AgeKmZePJ6f8T7ovCYrhZmvJvC8PLFcd8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GS19NKXjFTcuZWiTvSaFRadeqka4sVuIO4lh4DFHodI=;
 b=gLqI3Lz/XnSKvqwCMngZTdz0yCtsBcIkYt2F7K9Prol//aFssdfA8AgR6lcACNfnDAN7n5XU4lOY/J4H95JZjm9e207DQZJUjPZFzC7aLpK0NkoGlSkmLcL/SRYkvRlhz9L+6Ko4nVghfO5Q+5XeLfiXJs7ex4OBBCmwCqQGOL9QmaKWXWCxK7C6o1bytPlE/ZD6ECojqlo93SejvpA7MB2y88HZXwUw8UjYMtLdmbATHipE8fvH1s2dfoRfiADpm3f0jn3BUofx2rNBZQ0oWEPoYpgRaKUrrPX5TTkApVv9y9GGWqNl+6MEBPeyWT20wJBpTi/ipJ7YnK75p0cfwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <196008a7-ce37-52bf-13d3-4a08f203957a@suse.com>
Date: Fri, 19 Nov 2021 11:21:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 2/7] xz: fix XZ_DYNALLOC to avoid useless memory reallocations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
In-Reply-To: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0420.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 632158c3-9aab-4687-a52d-08d9ab46595d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27040A3A725F96C627AD7B41B39C9@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:56;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gwkxk01Ge/bdJr/rCEKnQBx8AkdIrY55WVzlQNN2aDATXV9d6ylbZySjgAhFuVMO+NewmFm5pSjQ9JHUDDfzaILgLVBXZwKHg/XbNujkoZ+VxnYxSSABd76OssXt7toUB83pALFUHWZivHpLvJtHZC/N4+1MWsZ58CQFEU4s0irnmTdBJf9AbBzfZqfYMDqBF++hBNivSAV+qZX2Uh4o+qjkoO2uAEogWyczD8JrPpUQdSlpCsqb3fWl7RAmXfk2r4hVbv8RaJ0/RpH03+dvWJaawhpbPTC7Uf5rbyHcN+mtJsxy950ZjV+CZkX9T2/Rpt4sPwCYA0kkCd15/FZpfIzvo6qN9ApfkI6SBOWigVRDolRRo1StTofnaScuudo9pG+lhSEApP+wbfgMQaYnzJTjjSM22fcyjOu9Fqohw4YxN8XisCeDNtX1fbGBeoWuO8zCxn6xiH4aD5bwB6o2ujI2ElQLmSkQ12zWSYpsvcirWn5WUphpK5Jd4g26EsT8fX0A5K0YoolprypR+qErPKSoGBPeY26TklVkwgPAfvaJjcSR1CaRc89OSDPCcUuNerLvoZTII1VKNCs8/jxQELywDjDgOh9UFKZKc744ahw3OHflN5GKxTzDTZiuEzR1JLg9NXXCK4tcr2OWPnH4XDWDgUSRfTUcoaLuj1O+1N0lrz8o9JkUpIohHt2FEc4uAM4heRis6h6kUrvtQhvLNdy6WvcJ6GFzc4sLCUscs5as9QMYRN6aLXnzopBrdUKh18U1dB3Hmd2k8TzdgyvM3uXa5/3WqkDsJY26FbBIjavyvdoDBgWk+a/DzLj7nSzs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(38100700002)(36756003)(508600001)(2906002)(31686004)(8676002)(66476007)(66556008)(86362001)(956004)(2616005)(4744005)(5660300002)(26005)(8936002)(6486002)(186003)(316002)(966005)(66946007)(54906003)(6916009)(16576012)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukluc1JCUlAzUHcrWE8wbHVsOEZmTVBhbGxicjZzdldzNDVPWXFaVHFYdVlS?=
 =?utf-8?B?ODdjbktrWjc4TFkrQUs1VWFINHNTT3JqY0EraFhsT3gyY3dZWll6WjVUeG5H?=
 =?utf-8?B?dkRVZ0hSMGFXQjJrdzBPbGY3d0hsM3RZdG5LNHAyY2tiV2QyOFZ0d2pIUkI0?=
 =?utf-8?B?ZGRPejE5eFliTjk1VE5Xc2RzcEZiS3VMYk93N3pzNUJqWVVXNGNBRnRoK0N2?=
 =?utf-8?B?cnR6eVVESjBuRE0yeEVyOEQvbkx1dG1SRmdJeksyc1ltMUNsclI3NlBDcFVI?=
 =?utf-8?B?MmVpNWRQUHcvTTVrMzZxSnBSWERxZjRxOVpJSmJLQTFiZ3RORW50QllNM2l0?=
 =?utf-8?B?TUZGaFlCSFNxV0dmV2FvNDBqTStLZjFKSnhvU09mYytMSE1yak5qUmloQi8w?=
 =?utf-8?B?aHZFeXoyQTg0c3RNMDkvUWlYNm1DZkpyelJKVmFvdkN6eHJFZVk4TVhBU29z?=
 =?utf-8?B?OWthZkxLMmExdWhnRVpWWkwxTThwaFJPY2ozN1BuRnJLS2hDb05oSlhxc254?=
 =?utf-8?B?MkpKZGp1Z254N3BPbWEwSDJ6dzhZcGt1MiszcFZQZVAxRmh2S2Ntdm9ZUUR1?=
 =?utf-8?B?N1VWYU5xd05oUy9DTW80Tk1DSmVYMzYwbEFubFo3Q3pzREdWeUU1VzJhN1Qy?=
 =?utf-8?B?QnZ0cStFTkRLUnpDTjhlRVBIU2RLZEJoN0YyNENBek5DVENvMkhKR1JadlVw?=
 =?utf-8?B?dEJraE1DeDFqSE1IODhjRklxMFlXdTlpa01sQUZJdHVFMU9veHUwdHFVb09E?=
 =?utf-8?B?NVZaTm5kb09ROFVpYjZ4bnpQV2FDR0ZvZk80MVg1bGNnVWVadTVhUW5Vazg5?=
 =?utf-8?B?RTZCUDcxd1hMeU03cWlIQXFYdCtpd1hIY0VRaFRtK2hIY0p3L2k4WEFzaUMx?=
 =?utf-8?B?QmNlTWdWSHliV2NiRURYTUhUUWVqUnhKcCtLb05PR0dxOEtJcmRBWHVvcjZT?=
 =?utf-8?B?d3pNVHYvRit6emFIRDFwclkzNG5xcXRDYkVZN2VQM2dIa3lja1Mza0R1YXFz?=
 =?utf-8?B?TlJPUVFGY3RNNVk5K2R0UGJGZ3plVHFjVytQOGJseWUyN1hHZUZuZldwZC9q?=
 =?utf-8?B?N1BjdzhFRU1QSnA1OThvb0lQeGZHcjNBVDhpcFIvbVhJMHRnT2phUDJWU01R?=
 =?utf-8?B?SXhuLzNBSWZhc2lrRE9kQm1ZVjZzZ2hsNWRJQ2dPblRwRGJ0ejJJQ0xraHJH?=
 =?utf-8?B?YVJkUWVQWmNRRWo3alZ4SzVsQVNjU25YZmMzaTVqZklqeU1RUC96Tk56S0hP?=
 =?utf-8?B?OUpYVnczZVVsL1VCQ3l1TXRUa2EvTEUrVjAyQ1lKWnRVZG0zN2FQcENLMHps?=
 =?utf-8?B?Uy9lbnM2bDV2WHQvZlJJWDE5UDh6TzZ2czkwZVNTQVNRbEMzMzRLdGQrd3dR?=
 =?utf-8?B?QTd6dm1FTlRwU2VDcFNDZVI0R1ZBNHFlT0xZTWRib2lNbFdQWlBvSUJESDM3?=
 =?utf-8?B?R2JpK0JXNzBGNThjSWZRSlVjWVJMTmk0WDh4RWJCYm40M3AyN1c0S0l2aklZ?=
 =?utf-8?B?RGFmRHBJLytYU2szOXc3YU1GMmxCc0FnRmhjOXREcEw5RVlQS0hHY1c5ZjFS?=
 =?utf-8?B?YlJDKytMMU0vVFpCV0FQT1JNTDhIRDBtN0YyZUhGRmJFdTR6aXo0ZmZ2akIv?=
 =?utf-8?B?ZTV2ZGpENThGczFWbkZoSWRuZHhKTlBvTWw5T2JWNjNGZlZTM1BaMHZtdmxm?=
 =?utf-8?B?cUE0akN3UlNmRU1aVUF5dkRGV04wSWZOQ3EyOUd5ZGJRVGlxRkUyS01GWFg2?=
 =?utf-8?B?bkZlVnRvUWhwTmsxT0x5eGQ1bTVuUEJockZSOGt0Yk5tWjlqb0IyWXlpYzVu?=
 =?utf-8?B?cWlKTmMyVWhqNXBYR1lmTjlFVXNwTGtZcFhiSDRtdC9zVEM0aWY2b1Q0TzlI?=
 =?utf-8?B?cE4zaTM3RTRxWjB3OSt5emlOdTdLSE9CQWxJeEhhVFFGUmFHL29yWWxQTW9y?=
 =?utf-8?B?K25TUllESnYzWWZLeXBYUWJVVGVtSm9JSFBPKzZ5cGJrYWVkTk9TNjZDWTJN?=
 =?utf-8?B?MEdzYUtuV3JZZnE0Q0NpOU10NDIyVWhnU0l4WnVJWXE4TEVwYU9wV1ZrVmth?=
 =?utf-8?B?U282Y3N5NWZPbFJ5WUFvUDlUM3M5a3ZSb1Q5RFFTZUxYbEQ4UVlmVkFqalN2?=
 =?utf-8?B?UVE1U1kxSW91TDNsWWR3TGNFOXJkeGdPZ29SUnZvbHZYTEdrekZ3a21RV3ZL?=
 =?utf-8?Q?jIFaJj5OK2Q+QIMjeg2zpqg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632158c3-9aab-4687-a52d-08d9ab46595d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 10:21:28.5895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ks5r58P7QlroyeKlAEsnhUqMs6WBR3xJJFvZqdEiGct38Yn1wlmj2GOK9uPdcb3XtgIWYEKgd0wvCsVoTt1+Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

From: Lasse Collin <lasse.collin@tukaani.org>

s->dict.allocated was initialized to 0 but never set after a successful
allocation, thus the code always thought that the dictionary buffer has
to be reallocated.

Link: http://lkml.kernel.org/r/20191104185107.3b6330df@tukaani.org
Reported-by: Yu Sun <yusun2@cisco.com>
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Acked-by: Daniel Walker <danielwa@cisco.com>
[Linux commit: 8e20ba2e53fc6198cbfbcc700e9f884157052a8d]
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -1146,6 +1146,7 @@ XZ_EXTERN enum xz_ret __init xz_dec_lzma
 
 		if (DEC_IS_DYNALLOC(s->dict.mode)) {
 			if (s->dict.allocated < s->dict.size) {
+				s->dict.allocated = s->dict.size;
 				large_free(s->dict.buf);
 				s->dict.buf = large_malloc(s->dict.size);
 				if (s->dict.buf == NULL) {


