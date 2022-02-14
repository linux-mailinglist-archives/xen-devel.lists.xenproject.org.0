Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ED04B5148
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:14:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271898.466624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbBU-0000AI-Dr; Mon, 14 Feb 2022 13:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271898.466624; Mon, 14 Feb 2022 13:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbBU-00007y-AU; Mon, 14 Feb 2022 13:14:28 +0000
Received: by outflank-mailman (input) for mailman id 271898;
 Mon, 14 Feb 2022 13:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJbBT-0006t9-2m
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:14:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 082cdb82-8d98-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:14:25 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-bTiu4oxGPgukD7KFJgJSwg-1; Mon, 14 Feb 2022 14:14:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3406.eurprd04.prod.outlook.com (2603:10a6:803:c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 13:14:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:14:24 +0000
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
X-Inumbo-ID: 082cdb82-8d98-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644844466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSNiNRPDAp4FbHjWk5BNk2LUmOvr0nLZzbpMWULfGLw=;
	b=gaW7YzwwCAGN7YVcHue4UfcoRHVLvQYc45kFocSgr1dgOYC2boNPdbx/a4qguNqYEIIGiU
	IB5DU6Wp9vNRx7Ns/FjwaNr7XnVHRZktgnaFrcSOm6EVpWSbRBqB2YaKlAdec6e4BUpYy4
	ZTPjFLH3FjBXs2rox/TqO1a6iKcvmjI=
X-MC-Unique: bTiu4oxGPgukD7KFJgJSwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjoPKIdxdU4wuyPMO4kEKye09SD9iXgaoGtqTahWQ4TKKo27+9EluxNPMvvVSdH06vvlA3Y/ry2LLuze4NqwOVBe9lQxZbUiBULqUhjJNIizR13J9N4m/SejVkGtHO/0NDjevJz1kObMpTkoKRlW2QWMNj3SQ7dog03YOx2nNsjTA+ACbBDmfNOtzTicWC/5el0cTc149PXVYCsWWNiR+3DEsiMCcXBom5syDY0dA5cwmBFYlpCo/TOJACaMTw8YOG2QEdzEgjuBDZ1gnHQLNZZoI/yXkhGd21b++nhNb90+7P0+NwI9svyQFmM1GGiwAEBzQSHn3rBbiCCg9aYfTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSNiNRPDAp4FbHjWk5BNk2LUmOvr0nLZzbpMWULfGLw=;
 b=RSYE58E2ag+OB9FnTf6JwU7kwIOt7ykUS2g889Itxea3UvkkXFeiPvYIztv9faDIJsiUDLuqQzBE4HTVJetR2apmLQqsgzF/pRyMjc1x3HOqIB/3JFYd6o0d1qUPkZ6+hm3N7Y59714AC+ruP6/kBA46MwC1idGRLOnIAjgAB0QzNfxaPxVt3XPAZmzF3cLhiTiMem+g5VgE2eDCatKyfsO0grNkn6Ic41397roNTlhIh9sJfXuvSiVPRJFXn3B1/3SVQt46octu8FAMNoBp6OojSeG4Q60K/buoBkQlH0L8E2v1hCRBik9XDCGkkiqbmYxMnFPotuD/4evlJ9cxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <adccce7c-d697-20a4-ce23-5c6571e7290d@suse.com>
Date: Mon, 14 Feb 2022 14:14:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 7/7] x86/vpmu: Harden indirect branches
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125632.24563-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0277.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 683565f8-52b4-4e21-cc6d-08d9efbbebad
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3406:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3406B430AA0B7BA189A4A392B3339@VI1PR0402MB3406.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jKEKiLz49MAkh8H9tyCMVzYEDN3q7YgQVDiPT3k4wP9dbkb5aAGX788gwf9t6xC+7is/RRTxfINuIFQZ50c9jLpBjGaEM2eWqm/s+D62V1YhgK9EE/TeL2TYwc0CbVtHFarGYQsF3te7zznuN1XzQB4+M4tPLfM3gttQFBqcIj9EiqotYiS61clcKAJAGSoamqc1x4y4xTGAq7mNgtgk/brpfCZHePQpRWI6nwGYfHHuM+Z6er7AXbejdXDVIAnDWNP2ALv14MobpOM51kzWfJldirPJSBn/UUcta+4riafBzBCb5Q1eHL61SIMbyBN7AKC11rI0qYZGf3wDUuq/x8/gfog0Ky/roclmdROiVYeiVg9cOhMo+tBLUuNN87Pd3BXAVwwqd+ZJzQoN2/EjDtnKckDzpx7Vvp1Gl9px3Y1TG4iz+GIJNf/NJu1Xwyoxks2OZgKo66kQjS5TLEl4TTlbn+SvuzeZ1QBQapiaNv+FZDBj9HVy7MOGUhWMT7WqX2Pt6I9ib0WGTCw4mCXw7bo9foYzH7xp4UQduAYOGurLB/c1V6dJBgTEi+i4PCqbxtd2WI9IM4NNVZRz3MFnrHcDo/l0gLiyNdkI+g5KfOVn/vegGg3NMua3P7FJBSFCCMYG+VRBAhqRHwerWLxtBdb7RVTQel2Aq/M4fHmFrQhhIvkBoyibg5DUGGNxJbHOTfNJ0SBighyfp9vGvsp7Mz8ACLgDdDs2z10mgyN6FGR+5VEPWKqQ5Ux9PaJ5Icq0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(5660300002)(53546011)(508600001)(36756003)(6916009)(316002)(38100700002)(54906003)(31686004)(31696002)(66476007)(66556008)(26005)(186003)(2616005)(6486002)(8936002)(8676002)(66946007)(2906002)(4744005)(6512007)(86362001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFBBN3hlc3NENlVpQS9PeGExdGxpT3lXOEFlVGM0aWNvenBreWlsQjU0eTZa?=
 =?utf-8?B?UzdQUjJZWW51QWFwQmJUUE5ucUVsNW53ZXFVeXlCQ2R3WW1UWVVodnA3TEVE?=
 =?utf-8?B?WEZ6LzI4RjVGQjA4amU0MjREYjlPUTNtR3ZnT3djY2l0aWRMeWVRYVdKc3JM?=
 =?utf-8?B?eVBYeTBHSmVwZTRMaVpodHFaOWJIdWRmVjhIRmF6TktzQ2hYRTl1WVE5WW5m?=
 =?utf-8?B?OEFZRlZqek1EcU9ZeGhKbC9Cb2NuU08rb3JyeXNNZUhZT21wd1JyNEJLVG4z?=
 =?utf-8?B?VVkxS2ZtQWN0eG1vQmt5YUFNaEIzMjVWd1Aycy92WCtpYWpCZWJRVWJVV0FC?=
 =?utf-8?B?UW4rZGo4SVhNcXlwOTlDWHpNUERpVjlJZ2puRGJ5eDl5dHJPUElkL1VIQ0sw?=
 =?utf-8?B?N2c0dzNuTW14OUJSWGpFWWdaSnBwZzQ1bG1FTzRFeXVlR3JXTHhNR1VJWmI0?=
 =?utf-8?B?WEw3Rk9pOVhBM21hbVQ4Qko3WGF1UkhlV2hYbWpsKytRQ2ZaNWliMTVJRko4?=
 =?utf-8?B?RFlJTHZsNGNMNGc2ak9VSjNzUmgvMnVPaWRTNGxKK0NJYUxyRDBiOHY3S2wr?=
 =?utf-8?B?T1MxaXBkSXZLd291SGx2cGpQZmIyUnZnV3RBM1VsT2xIaVgwSndET0lMN3VB?=
 =?utf-8?B?Q2VXTE9tTk9UQ1EyT3VJZCtETjdhUG5XMHhlKy9FZWxCZHJQUnlFNktxN3ZI?=
 =?utf-8?B?eGxHOHhwMmpDQ3k3QS9XdWVqUCsyRzlnd0FjT3BGSHMzZnFzMVZIM1NteTZS?=
 =?utf-8?B?dEZqZUNvMVczNkY5NnVSeW0yUlp5L0xOTXBKaVczQVRFVWwzTHF3STlwTkJ1?=
 =?utf-8?B?U3Qvck1zYXVtdjRXdFQyMHVqSmd2TngrMi9WR1hnK2FpSnZEU1BCSHByRHRO?=
 =?utf-8?B?a0VjSHdGczJkcDFvUndxcTh2d1hpUU5PT2xLVVpZK1lBWThzZ0JVcDk5WnVs?=
 =?utf-8?B?R2o4YU84YlJHTVZPbnFuNkN1WmJZTGlGR2FxQzNPWVV3c0ZCb0ZRNk9JUVJ4?=
 =?utf-8?B?QWY2NGNGa1dRcnRSSEltbTJnOTQ3S0llZjQ4Mmw3OFMyb2tyRTlmNHJmSVVo?=
 =?utf-8?B?dVNFWDJScjNRVHhxTGpsMlo5cFpLejkrcWJudE95LzZvQnlSZkxaamc5NmVo?=
 =?utf-8?B?UEtMcnFYeWk3RnFVRGFFakNDeDd0UmlnWmlwTE5qZzFsNW9zT3p4ZUdjVVlL?=
 =?utf-8?B?MDdLTkdmb0lYYklHekZLeE1NS2QyK2xIU0JCbzRMOGJZUnR3aGlYbkN3aTdS?=
 =?utf-8?B?ek9YOTNPVGVlNFVmNVRoQzZBZzNVdGVFSVlvUnJkWlUvbERiV1EzaWw1cEpl?=
 =?utf-8?B?T3B6b2wrSjhNS2xmREJ0akFDOHN0bTVWZEFyd1M3UzJ3c0FUbkcwRFUwUVhr?=
 =?utf-8?B?ZE5GMEZTc2dCT0VWdXNqZE9aR1BiVjFhMlVKdXAvSmJyWlBsbEMyMkYveitl?=
 =?utf-8?B?YmRaQ0ZaT3JkRzB4NjVCdEV4WGUxZ29CWXQ2LzEwL3pTUi9JTHF0L054OTc4?=
 =?utf-8?B?dFQ1ME5HQ0U2YkpzbnYxUGo2b2lZVWNvWkI0UTZ0enJCa2NtOHAza1BzcDhT?=
 =?utf-8?B?d1dKYlg3a3ZxRkhpWEs1cEM1VDhoOVA0elZCdGlHbHBkb3VzSGxEQjlQNVdW?=
 =?utf-8?B?SlM4UFBndFhvNXJXaDdUQVNIZ3dSOGV2N1FPck81NnMwb1J1OHpLWXZTUTdZ?=
 =?utf-8?B?OXdBVEZ4Y0NUS3dSbnpuelB3SHhIN2NhVHhyY2x5OElzcEdvWmpPR3ZMZnV0?=
 =?utf-8?B?R09mY1JRaFVYSTV1Q2JPTmhoVXhqL3JlcTdzbjlLdUtsb0RpdFgrZ3FyY1hm?=
 =?utf-8?B?Tk83T3F5TXVuYlVqU1JYL3VWNm52Q2FhUlJSVzE5NllldFpqWUxmRlN2V1Fs?=
 =?utf-8?B?ajFQVGZBNDZndEYrUktRWE1WaWI3dUxHcXJacGtCQk83QXQzVGtPTnZFaEgw?=
 =?utf-8?B?ZmVyMWtXMkJNZGRyVHQvM25iYlkrS0k5ZDBLdXpIKzZ4dW8xakhnZXBrSHMr?=
 =?utf-8?B?Z1hoK2xsQnBiYllSclEwRS80bEU4MC9qWVEyMnJhTXVwc0h6T1h4NTZzRkdt?=
 =?utf-8?B?TzI0TzBXMXZQcDJRanFZRnBvZ0tYZWFUYzdEUkxhS1lsZzVkLzNBdW9nb3BX?=
 =?utf-8?B?N3lLTlUzeFd4NjEwenpoSkV5WVVSNkYvdFBUblo0aHBvUVBJdU8rTlFnMk5U?=
 =?utf-8?Q?6SNoj3v4aE1IGG6Xgs7iPts=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683565f8-52b4-4e21-cc6d-08d9efbbebad
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:14:24.3469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MQmX1et3rxOtmrtOPGgcOwi434ohN7OVZWU2OVwWGlKHmyoCC8eMLFuPplHfvpI6vnyNsXXMmDuWILcEtoAeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3406

On 14.02.2022 13:56, Andrew Cooper wrote:
> As all function pointer calls are resoved to direct calls on boot, clobber the
> endbr64 instructions too to make life harder for an attacker which has managed
> to hijack a function pointer.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


