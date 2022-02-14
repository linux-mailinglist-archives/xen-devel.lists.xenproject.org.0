Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994644B50E1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271634.466162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJawv-0006vN-1C; Mon, 14 Feb 2022 12:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271634.466162; Mon, 14 Feb 2022 12:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJawu-0006sZ-Tu; Mon, 14 Feb 2022 12:59:24 +0000
Received: by outflank-mailman (input) for mailman id 271634;
 Mon, 14 Feb 2022 12:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJawt-0006sS-IB
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:59:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed89f031-8d95-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:59:21 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-adn154O8M-ORJoEuBFYa2Q-1; Mon, 14 Feb 2022 13:59:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8512.eurprd04.prod.outlook.com (2603:10a6:102:213::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 12:59:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 12:59:20 +0000
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
X-Inumbo-ID: ed89f031-8d95-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644843562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0wny9rGsDyi/pLZC6T6iOoE4NQKliZ707q0O8m//uU=;
	b=PiAx8z4KTyFbGP7Rf3MamQ5N7aoepA9cyefy9XZuyGxbGYgnpuJFPxrxPMDU312UfMMy1U
	Kv7thJCERZiVj7J43NoMGdsv9su3aF9V2qLFAO4fQ9yz7JEWHz6E+o8eCRSVa+psXSMkMj
	wU4/ayGq4ag85PogHCCiHIkCnAoyOOM=
X-MC-Unique: adn154O8M-ORJoEuBFYa2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lV/AE7EMsslhksehNMaT4gl01t+umjXrk+FnXYyZDRwtXrpftc74Ywjtt0u3YtWBEP3M0YCZnucIEGIM2Q5NBbj+2pvMvUXSQ4Kbpcug6m7Sgw6RxjyuQSZyUPK/lIwAYo0lzZnoRFvE2xaQlHI+6yLITrAjypgAhuLQojsNqy/JxxGYuSBnejxAMwPLScyVlld8vqdMPbXm175EDm2X5dt8MLeHnzd7D3wcyiASxvbKZU3Xp4qpuCMRu9UW3IsEjt2RoowFHmbWUkYSUkaMFFcs350FBU4nzTylGSGxc6V3mjZ/1ntl/MJQdV9Hqdws7zIz/t2Dz8dU8+G3Sg3wfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0wny9rGsDyi/pLZC6T6iOoE4NQKliZ707q0O8m//uU=;
 b=Gz+0zfgmR3CKww46BCFRWsln6Ez2+XxuxulukSsfkDN7mnZltjd7n2nXLW/2Bx0jzeA5Tnr39MrA7c66Xmy4XV1fhH5qc5B4HJLVqdI80hnP1CPILMjemAXHeemW/TgaAQQYr+ZhjueFhElPTSWsaRTsNgPWQn+SBayTHVE8+gTITBa2fdu0PguuAeOiRZQewHP9mFom45yTCxFCZUqCohVXXrgObzBUpUoELz/y4kHDf6Y+KWxY1j6eWIdw8xlTRh43tLa+rvans4in6M60cSWw9HtgkN9MmwEo6q5jvii+xXZSS6N7hGoMR04vCXfz0NcnwPmqfUbskXacmcj1Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cecc3dd4-47cc-6f6e-177c-4e8657d2cd6d@suse.com>
Date: Mon, 14 Feb 2022 13:59:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/7] xen/altcall: Use __ro_after_init now that it
 exists
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125632.24563-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0004.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a15a462-08a0-46ef-5bb8-08d9efb9d09b
X-MS-TrafficTypeDiagnostic: PAXPR04MB8512:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB851236A6AF6E81D3EC96C186B3339@PAXPR04MB8512.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ofYGCBG2vSgQPoUC5WNYpq1vmnpIKd2hwXUtHmnzfEID5jWYSmEoUcONZSuY2WkQZpAXxZ/rWsy8k3eJlREmPJFgYe3mtDAg0+uasF1oFr+Kahk4DSWHpYWJyjB22TntOhYdYl92PQj4BFaSk9Eo3lD5aKTK8if47igpRYxDGE4iDzouXKLfPqTq5tEj3ThGA25GXoY27x+qDw6RBUCmlvqfcAZGavWJEhyqD5hWtOssVP5pVm6f9kAV1yhPshpn82fnIJOrnCTQCsKop587rKVbPhZDNceXT1+pxLGafolQu2qL6Gp16hbFcA5neH8DZ/M9eXy9rahemwgfB06vSmTJVkn9UhSRY6SqxkQsEzHd/N55nVjzvW1J/dyJ22NZymc6Jc6VcuemFu987qVXxSjXuMWX9IHgGvZQUWoZywc9gzLVGEQQZPLLqaSf8Qf7hWp5/PQjwWYrvY9E+Xj+mlb8Hl7qBxBVXTx+oaSPwkk9tp/0gVTMfmsa4zhunZRWv0iYT6CqI9XvKghYx8jWD0CRifThzXqh74FANKWCv0VJoRlquHv//hkG0Ub60rRCjlfwl4l/MYePAAcCWAUOTuaUxis6qszRauqTwOIj25/oQBGhAGdXVzwIHLvLcFtzRFqF7Rejq3VRuhL8+cXTC5v+1x54Y3WS/fB3J7jkFbnEPRl6+z0LQhuPg1XwYQKECv3uyf1WdOV6vQmYUT/sq64Gfn7B4RPd40YfgxWLucq6WZgEf3suzVG0haZT7Xk5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(508600001)(6666004)(5660300002)(4326008)(6486002)(38100700002)(6512007)(8936002)(6506007)(66946007)(66556008)(53546011)(558084003)(66476007)(8676002)(26005)(186003)(54906003)(6916009)(31686004)(86362001)(2616005)(31696002)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFZoTWYwb1RDbnpjOUY5ZlE0aXJvdHRtR3Rrb3B2MUdKSENuTzU3T3UzWjFF?=
 =?utf-8?B?amRYTmNnQzRybXBGR3ovRk01QndtTGtMazZXNDVnbmgxM2hybmwwcWcySkpi?=
 =?utf-8?B?dW5NczZZRkN6OUYxeXVZaVBMOTFwZlR1akc3OHIwRTJ1SEFyb3BKb3lqbnBr?=
 =?utf-8?B?QncyZ2ZjS0tNWVhuMmV6TFphQUVSMWFsM2ZPVHdEU2VJR3ZDMzJFUk1jOEhB?=
 =?utf-8?B?QTUzOHRwVENTMGg2UGJzN0RnOGZ4VFBkRDNVQUk0N2g1RzBxZWFaZk5pQ2J2?=
 =?utf-8?B?bUNJdGJmZFhQejViY01CL2ZsR21ZMFlTSW55RXh3K0JVTzdBYWttRFhreVFY?=
 =?utf-8?B?dE5DZkk5dndtNk4rRG9aYWJtbmJtQ25uTWZDZXN2S2s5Kzd5UHpIclNmeEJw?=
 =?utf-8?B?ZURPOGRqbmNNK05URWpRZDFUR0tvSHpKbmZpTTFtRDd2U3dSaWJOMjF5RXhH?=
 =?utf-8?B?b0ZOYmhVbnFRbXFPNjdraHM4Tk40WUtBcUxibERUcDJtbVNKZVVsbmpxUzJy?=
 =?utf-8?B?YTdDaE5DNm5manRQK2xWdmkzUEk4cEV6RWpINks1c3ZLZ0NlbmJRYkFFWFV2?=
 =?utf-8?B?Uk5lN041TURESXo5Rndrc3cweXpOTjR2emczMzNzSkNlRGhlbm9NVEo4NGUr?=
 =?utf-8?B?UDR3WnMxdXRja2NiSnc2djMvbEdvTUVyYWxURXdkait6T3ZhRzBhbHhubEVW?=
 =?utf-8?B?a3dEQ0s4WG5tWEtsc2t2UUVjczhyekpwSGUyQ1RsdUFJa2tIaVc3UlkzbUV3?=
 =?utf-8?B?YTBzaGJ4dHhZSkE5dGpYSFZXSHFWOGM2bTNMek5kTkR6c0xOMGxUU2Izc2E0?=
 =?utf-8?B?V3pLanBlYWE1a1JtZ1NGQXIwYUVzWmhEQ0NjV2JGU1RLMTV5Tlp5OVNaNXRt?=
 =?utf-8?B?NFNiNlRqcHk5NkQzNWhXMU4rYXhRQzVOVWNYK1lqSzcyM1crZnRNbTlIN2hW?=
 =?utf-8?B?dHpwUmkzWGp2RklHVUJEamhERHF1MzVvYXdLTm96OXFCS2ZXZDhqYzNIMGdD?=
 =?utf-8?B?RkxjOXNNMUJlcSs3ckxESmZ0RHJhZFVXVXhKRzk4ZXR5ZlhaQ0RndjE4Z3N4?=
 =?utf-8?B?c3Brb2JtRk05ZjZKR3ErTGRaaTh6M0hBYjRUTy9uS2lDMFJOMVJEdllrUVVF?=
 =?utf-8?B?OWlMbWVRb2ozcFlONU1KeGZwam5udm5pZVV0dGFsYmxEN0ovTXhVaVQ2UTQw?=
 =?utf-8?B?KzZodFY0allTQnB2SzBaWUoybnl0eU5PV3l2Y21sS0EydWh0UENKaGhaSSto?=
 =?utf-8?B?eFpTUEFtSDJQWHZZay9HVnVnaG52YWQ2NVMxOFUvZHZYcDZuQkFrVGp0OU03?=
 =?utf-8?B?b0QwczFwQnpsTUtJMU9aSnRiVkJLU1E1eTJYY3VWYTA4SGUrQktXcU5ENndJ?=
 =?utf-8?B?TFVBZzZ2cXJKVFF0NFNLVUlhbThMampLRWMvOE9qSG5PNUlzNytLaTdBL3lG?=
 =?utf-8?B?RXQ5TE9hOVpITUVSNU9ZS1p2bGpHVVVxdUUvZlU3UXh1OERpd3VJL1V6dHlB?=
 =?utf-8?B?ZkY3MkQreUlSejMyZSszTjcxSXRjdlJoZUNiNjhHK0Y2NlNYZWdxNXhNWTVS?=
 =?utf-8?B?K2prMTl4WUh1MFM0VERHSUVmZWxTeTBCZkNreVdBZnpFbDV0K1FYREtaeXlh?=
 =?utf-8?B?Q1RsVUxaQnR4MGJkZXVBU3FwMkNIV0ZwTHF3bXRZN3NlOCtYc3NrZUEwUU41?=
 =?utf-8?B?YWJya29hRnlpMURobmxLSHB1NVpKRE5FU094dTlkczZJdlZzdkQ2TTFIVUZY?=
 =?utf-8?B?dCs0dzZEcjFyNXJ1Q2lnQllRNTd0eVFMQ3dqK0M4dmJSZ1pkYkh1RU1yMTBJ?=
 =?utf-8?B?NUFDblZ2U2syUjJDT1NqLzArUFNEa2F5aktVdURNcm1xL3BsdFZjQ3FVcE91?=
 =?utf-8?B?M3RTRnhsVGoydmNPbTh3cWVhNmRlSU9xZTkzcGxrOHI2bGNJSzJRV1o3NjJz?=
 =?utf-8?B?alBQMGt1V2FicFNXZndEOFc0Wm15RTlpaGMweXNkZnN6M3QvMW40SGRPUzFp?=
 =?utf-8?B?b0lMSFFpWDBoSHVEUDUzSk14bk1YTjhod3BHSnZxOHRCUEZkZ1RJRTJuR1lN?=
 =?utf-8?B?Ky9MMEp5YVZIaitlYVZjQWpjUUpFWGdiUzFSQWxlWGsvNktNZmdHdVE3MmRh?=
 =?utf-8?B?OTJvNytGKzU3M2JVSWh0eFF1bHoxVjl2K2JMLzhDSVBrNnJPdDFla0Q0eml4?=
 =?utf-8?Q?Mev2OF4FZNCE8NNJUtgwzA8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a15a462-08a0-46ef-5bb8-08d9efb9d09b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 12:59:19.9341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdkEGYvAhP1xj/yuBwKxgLvvdpwWgAq6J8FCBjldMpws5jr7tYvqsEjy5T/q0J4inunQZtCbn2Infrz2IBw3sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8512

On 14.02.2022 13:56, Andrew Cooper wrote:
> For the !CONFIG_ALTERNATIVE_CALL case, the use of __read_mostly was only a
> stopgap while nothing better existed.  __ro_after_init now does, so it use.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


