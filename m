Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448074696D5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238880.413987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDwF-0007B1-6o; Mon, 06 Dec 2021 13:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238880.413987; Mon, 06 Dec 2021 13:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDwF-000788-2o; Mon, 06 Dec 2021 13:21:51 +0000
Received: by outflank-mailman (input) for mailman id 238880;
 Mon, 06 Dec 2021 13:21:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muDwD-000782-Ri
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:21:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 776b7c7a-5697-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 14:21:48 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-LSzbM9kXNj6cXoqInMGpiw-1; Mon, 06 Dec 2021 14:21:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:21:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:21:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR07CA0018.eurprd07.prod.outlook.com (2603:10a6:20b:46c::24) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 13:21:45 +0000
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
X-Inumbo-ID: 776b7c7a-5697-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638796908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sq+Uv+r1URWNwJMKVE9OH314VncJ4FseKCufvyP/8Dw=;
	b=TaaBmm8iR6189N4JpXK8Z1twZal4aIwRNWnoaZP6KdxrcY4YVDhus6GR05fBbC02IOj1rg
	bkPvDcEXBfDnip0lJTwvSE1cJH1irh4kjDMN8Gwkuh1O7SpQpI2dY6Vaihi0gsf0VhBlXV
	IupW5McLdqgVzn84PPkN8pSsQkTU3eU=
X-MC-Unique: LSzbM9kXNj6cXoqInMGpiw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDzMCYMlxayglk9bxiKQADY1j86y/v/+uuLN94TK//mkuI1N2K/9UwBgQRtbkOw66A2ScFPn2wgx4HaIZ0Bc45iM0Bj2Kl1qg9apj2k2Ox6MTeP7DwP40QBkuxvoqyN84o1cx9MutYsQfLyAkBQAaXKnItNLVYT+R6pVYHf10WJapRCJ16eNz6TwSHbBN7A4uBN2a2mbs7CxdpEsjmrhRDjJXf5HwPBh/dgD1/m+FcAoyr19pC9R98lHylaAoukRY39YqrgtUNofv14T+CdxGUVAWS+2w7QGojega3TBI4WwYT+BHKK8BNA+8+KPqEJtj9r36o3DD4fZ7fL9hPyAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sq+Uv+r1URWNwJMKVE9OH314VncJ4FseKCufvyP/8Dw=;
 b=Ml8mO+PdXkOOZq4I6EGaZ9dnzM3h/q7H28QSkIsukw/LuFviVE05UfaGZ6J1HCBkeT/dJhf9ArvDnihVVOcVO12E1sid2UsfEHLyhRo5DFngVVQzxzmu1vc7ME3xY6n6lL5VpRJ3MnBFNMWl7RLI3aJ47tJvLf5QsjoCWRS4VsIblMNh91WPPWSZFhSec8njxxc8LpMzULm3Tl802MURXra7ewmcWCeabs0MV0aRgdL0b1SJfweo+6/Ar8bs+USQk3pIqWfsB5iVbCiwDlO4za9Nc6M0dC8SzTLbz2JyL1ySlYRUbJW/YmjLDbqSR3lONupgAeyLgqLK/23LKaxZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61c1d38c-65a6-e150-ed53-b565d30c18c9@suse.com>
Date: Mon, 6 Dec 2021 14:21:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86/paging: address observation made while working on
 XSA-387
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0018.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78869865-6d93-487c-affc-08d9b8bb5a31
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70240267E268727E2A958F5AB36D9@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J6g7MKGDVMzFRnQi56FveLCREhLKMWQIGYO8dxJW9YpG8YARIuVB+X2MaN4WfmfNg3Sm+Ml7EfxF3nreZtNCDsOhXeUFIEH2QOdb3yeMbCGfk1i+kzUr7L4SwuyJDonptBhC24PF1HV+xQ7mOcZFsH/qhZOBsRubzR0Q8X0Yby2JGqzxTV2D+Uw2VwbR6u9MLqk67+R3YcW29iXshCyD3w+ZSMpKH3niBvNY7Q5K2eUPtMM/vPAH2DMxDj5dREkqXj9I1FAbW7Ki7C8hcchzB2++lko011YoK1m0tgx+PHRXnT2R8hx+EIDtB3XjfNBlEPc49wi+zrQ8m7gv/de1riroPHe2aW1TIduq75IKprd1R657luBeIXYsCas1/XK9eO0CVnCBY3RBzXQKCv/E+bidncD8tOOIe/IA5XsnVgRqdNB9n742VUtO8/Nch3uEmWOBO7s8LgRSYRZQCf6NmYTk4jONYQRpkztDM7xBoncumGGlwxOeCG6VYnaZ6BFU6QBmsA6eHjs53gqVDtTujF7nhMwco/hp1g6WL7DrfbymnathiP6vNcJfl63OBEi3hV+4uLWZl3mt8JsF5TghOsaaSmUAIc6VmDgPM1MRS5xtV9n67XrQAStwXOTj3WJ5YubOYbGYbqJKjbWFLbjCoHeQhEZXg2oxl804RFzmVC862ZBWZSfJ4fGjdjlxhCUIm4AFUa/F++P6keDDnACE53wAozPg3BFrmtBlpsifCFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(6486002)(2906002)(86362001)(31686004)(186003)(36756003)(4326008)(31696002)(54906003)(16576012)(316002)(66946007)(66556008)(38100700002)(66476007)(558084003)(8676002)(6916009)(508600001)(8936002)(26005)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0tCOXl2UWp0UFNodVFuVFF1SjB2eEJZSHMxcUYrL0NrZk0vb08rRzZFVnl2?=
 =?utf-8?B?VitpSlR0UFZjUE82K0NENWY0MkFQdmZkQUlKa296UGZMdE1lMGtJU2VmNUZB?=
 =?utf-8?B?cDZhbHA3eVE4Sk01NXZmWWJJaWxOWlloc1VFR3JwOGFhM245WXVydFdlUnRi?=
 =?utf-8?B?aXNpKzlMME9YdFhTaHRQcjJCeSt4TXpHL2RJZHpOZUFyNUM3djhZdFBjbG90?=
 =?utf-8?B?aERKNzdzOEQ5amgyVXFHamVVbkh3aXlnWHVRUW1rb0RVeUhGY0RTSkp5WFB0?=
 =?utf-8?B?akU0UWlJeHR1M3I0bnNQbmt0V3FGcUVsK0lTbGJ3bHVuaUsrdUJTY0x2a3o3?=
 =?utf-8?B?aE9ocVV4UndLSC9FbmVtdy9vYStiR2N3Q2J2cUlrOThJam4xWjBCMTA4RWk5?=
 =?utf-8?B?bnRRb3FubU81dmZYOE04Z1dCcG5HUE9XN2wzOU1UcjNXMHozZ0N0ZHNkM3NH?=
 =?utf-8?B?d0FhalZHUFBqTElVd3RGODk2ZmFYMWhGWkFSZDFkdW9NblJXSDBjWVZhUCtM?=
 =?utf-8?B?ZEtMNkI1NTh0UnBXdTBLcG5sc0tmVm5EZCtLdWQxeHd6ZG1ncW9Zc1BIa2VZ?=
 =?utf-8?B?UFZGZU92NTk5SjZ1ZEM1VnQzRnlBVHQ2Y3ZDT0JzUjhjMHRPN0haa2NlUU5R?=
 =?utf-8?B?bzNsZVRyY0lQRG5qUUE1OVUxT2w0cnNRdVJtbjNsYkhTbG1vRFYvcmZwOEo1?=
 =?utf-8?B?SmFzNGRGbkh3a1JpS2RsdTFiOFh6SzJMRFVNTk5qSTlPTi9OM1NwNjFVbUY1?=
 =?utf-8?B?WTY3RUltalVQR1ZLcWpybkc4UzlxVlhmaXpWSmtzRkYyLzB1QklzVWhhcTdC?=
 =?utf-8?B?SFF4K2J4aWJvVXhSWWFnVUtzZ1BJR1NqWkdDU2hDd3FoeUxlb2dYNWRETml3?=
 =?utf-8?B?UnZQT042dzhQSDZHQ0UxZ1pjcnlKK0FnT2tkTXJ4T1psT2wvYXhCMnRaaGwr?=
 =?utf-8?B?b1huVHNPK1pvUUVLMUdETllGVkdmRTl2anRYWkxVaHNNekc5VDJQYzdUemp5?=
 =?utf-8?B?QnFFRmRpZ2tlZEVmZ2ZOb1pRYmcyWHJmK2RNSjBQeEJwR3gwQ1Z1Z1dTZzV6?=
 =?utf-8?B?bVBxa0RKOEhjdzB2bzZaV0gyK0YzY2puOVFUQ3ZBRVNpTGhsREE0cU5maUFF?=
 =?utf-8?B?cnFDb3NKb0p2clpNL0x2dGd4LzJzMkgzcmxiYW5Od2JBYVR2aHErWTNmbkM2?=
 =?utf-8?B?Sk1GRXRNSnFaVnhUSXhnMW5QekV5YWl1VWp1dEJJRHVaVWhrd1V6N2ZWUDBj?=
 =?utf-8?B?T281K1Qwc0tlZUdSaGtMQmNGK3lKTWpOditVaTdnd0lTZm1mSmRNd2hvQjhI?=
 =?utf-8?B?T05za1lvb0hrNmxKMnRYV0ZHQTg3akdsVThwZzdaaXlnaGtSYVpFdVFYU1cy?=
 =?utf-8?B?NUFraGRWam9CR2tEQXdZcFJBdHNvRDYxZ3gzMjNDSG93aktJSE4xMnQ5UHRo?=
 =?utf-8?B?MS9kOU1heG9FeU80V0JhSGtxNDNycmNwOERYOGtBVjVZS0FJdlA1Um9Gd1FU?=
 =?utf-8?B?MUNPb1pwQXpnV21oU2dOM3JPL1BkVGZJUHZTMUpuRXZDWTk3WWl2S2M1NHpW?=
 =?utf-8?B?YnUzY0dqU1pxWTdyVlZuNFBXL3JHOElJb0ppdDN3dFZiQWhBbVZnclRiQytK?=
 =?utf-8?B?bmRxTVBjdytjWUxmQWdiU0RwdUw4KzFaWThGZWtXTzlGZmlSNFluSkYyM3Vt?=
 =?utf-8?B?b0FGMGFZRStRRThVY2s2cm05YmFmV1RmcGpOUEhPUVBpREJTd3pXQU1CYTZy?=
 =?utf-8?B?MzRRSW5PQks1OHZTa1FxRDNtR0lyU1dZTENJV1BOczZId1FOOFJGZDkyeisr?=
 =?utf-8?B?SExaOXRqZWs2ajVCV2t6elErY3lPaUJUb2UxOXJZTXVTVXFwWmJWQkwrM1gy?=
 =?utf-8?B?OFFuT25oaklsRy9iK3F5ckJiTktzRHp3NW5NZHdkYUxqVGtXTHpCZk1rTkNx?=
 =?utf-8?B?RWNCazdyemdSQ2VEcTdzOGlHOXp6WnlLSVdWTXJpZFZGV1g4RWtscW1ocnV6?=
 =?utf-8?B?WDRPZ0FMdGI1YXp3aUtPdEppa1hJazhUYTcwc0dRcU4yWW9lL3ZQQ1JTZ2U5?=
 =?utf-8?B?TkVQVGlyVmYyWm12TWZDazlUVEw0Nm9hS0c3VktuNGY1bFM4MjVNZDRkT1FZ?=
 =?utf-8?B?WksyQ3grQ0ZmRUprMkkrSkJJdFYxSmRVMis0RlFhQ2MrS0FXbGdCblU5dHdt?=
 =?utf-8?Q?sBCnEcRBZIbnMRAG12Mzfbs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78869865-6d93-487c-affc-08d9b8bb5a31
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:21:46.2995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxiw9JIRNn2J6st9JykPxv4pcUygCJ15jphYgnl6DLzmm7mblMfCcvKTmvZADtulNJ7zCQOFDZJNtJYrv/iVQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

1: tidy paging_mfn_is_dirty()
2: replace most mfn_valid() in log-dirty handling

Jan


