Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E753A6892
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141565.261449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsn4c-0007oZ-4u; Mon, 14 Jun 2021 13:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141565.261449; Mon, 14 Jun 2021 13:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsn4c-0007lW-1D; Mon, 14 Jun 2021 13:56:18 +0000
Received: by outflank-mailman (input) for mailman id 141565;
 Mon, 14 Jun 2021 13:56:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsn4a-0007lQ-Ui
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:56:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c708129e-2d91-463c-ad09-e0518637bb9f;
 Mon, 14 Jun 2021 13:56:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-alet17oxN_SYiDmNPNYKzg-1; Mon, 14 Jun 2021 15:56:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 13:56:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 13:56:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0078.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 13:56:11 +0000
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
X-Inumbo-ID: c708129e-2d91-463c-ad09-e0518637bb9f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623678975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xsCjtvTCIbMdR4RMF9+oPSu85gzSIhR7OD1ao9vaiw=;
	b=mnIj+XaR2POCzfpDKr2Xvb4ucslauCPGoa6YMDyUf9sv9qMeas3++nKLc0Yw7Xrj1lYkUw
	rvDdetZ9ddgfpqnA1YY1i2NJsZsOPzlA2+evBOLtHHUjFHj72k3ClTAtdphwQdIcIxvSqN
	rFvQAZ5n0SUTWHRYzqFpfJT1+5IxWng=
X-MC-Unique: alet17oxN_SYiDmNPNYKzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1KGc5iJIPp+UAWZxnLEp19SNq4KbwlPIIQ4z46mjLTfvWGcTK1lY36sxbpXLaOgJ1P728skRVuRFcD1LizkkqlDwz4olHPblbmj2N6DvOyCUFSExa72eNy5wK5BknBjjeZNbP/eeFivKW3UHOpB45wT597DUzc+5s38kcV5HIbRdGcjbmR9W0jnKwvzeYLGoo8OnZsZo87lkrz0euvsts2lz0kMDjsAzIF0k3M4R8DvAzzzHCsDJRXY2+vu6PXz9WoS+gXQEiwJiHBKjutLYTP6pfwVYyAWIE33Bo6iRL4u8OuEgmHvGYTPhdutb/F2z+Kw3SU3bTPgcaTF997Zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xsCjtvTCIbMdR4RMF9+oPSu85gzSIhR7OD1ao9vaiw=;
 b=F2g3k4MC0IkyualppfF6ENPPMLC5RUWEDxGuPS64S4hzWBUMhR1rkrhGNV3IX0ZQIYyZ/tZWWuyRkF5owmfQUuVng6TNerCpM291vPhf1WrcOAc8Ffh2beGACgZwFfyToeDsx3i5cYQ/bsS2WPWM9r0goE8eUEevjIR/gQwqQ1CHpYPcxV+k0Jn8GnnVWMahdqdHDCO8n+aebAEd8BOewEKZ3R7tmPzZceymsENgZfKrBdVlKT5FL5ln1g6NmnrG51TEoO6yDt/8vweufL4R3EK/4zrlfTv23jTjPiRKNIa76S87a6YfSPPGnTApfJf9ddJjLRcGHgPA5+lkbHfCXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/5] libs/guest: Move struct xc_cpu_policy into
 xg_private.h
To: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Edwin Torok <edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
 <20210611163627.4878-5-andrew.cooper3@citrix.com>
 <bb85a8ea-c78f-1b94-6d83-224137f21500@suse.com>
 <24775.24180.199869.133786@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4e35d57-2a61-6faf-71cf-c82da7499488@suse.com>
Date: Mon, 14 Jun 2021 15:56:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <24775.24180.199869.133786@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0078.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54e19ac4-b2ec-40c8-6fd9-08d92f3c2b28
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2958F07EA51FD2472AD38048B3319@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4rwshWWSz1OZjXOrGcI56g/vsZ1r6PS0b0ql9RNQrNhX1yYFbE0Za3cCJ+qf2uGfXvAWs0sFvf6qyzecsmAxkHSUh3kF6EV4TJgj0yBBw4vQW7ggjkNUL7R9O2SYinM3I9Purskv7OxVTDUhjvWBL4TXa5NDNow8IsqRLWz0A8LLeZMieSxGIqaAT22p17Z7jCwWIj7KSLRvKuu0LmOcQNueI/uS0Tl9/Ya3W10uSEFujX4931p96MxTmRbS2ZpDgIyYhbDvzEOXDR/j3Y77Wtbjrc0LC/ac5IWVS3i+4up624vq98g+xt6qYSb2UU1iXMbFhF/z+aq79Lo+FtKxoiNW9yoLBpAV3O8wtlxU6E1sFiHJVJ4rRIs5/gBKf8C2mWowAllZ1HENPINlBnEpiC3urRqZCBsnBf3phwttTkJDTN4qUGRWOJQ7ATaNiq80CkEEknBssO1YuhfkC6xS09xPeFoCrxcsAMf0I7NexbLq1yfPVRg3sXnk+jo4WZbycqekvP5Nkl//cY6I6DjxNDRF9erkyLE95MtAhjHV9z0pygDgpxR/RNRCHonrRUXXfKH1zloGyf228rcYcd3gSk8hyZwUjfTTWanh/Fho7WaR6IaylhDVs/g9PdF+BpyUsctseiKOdvclr+5AFBs+SRpGSg7SJ8WheKWr9WazIPpqfZf9CkeFCJ7baHnq6HuQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(396003)(376002)(366004)(346002)(86362001)(8676002)(2616005)(26005)(6486002)(6666004)(956004)(478600001)(16526019)(186003)(38100700002)(316002)(31696002)(4744005)(66556008)(4326008)(54906003)(110136005)(16576012)(5660300002)(2906002)(31686004)(66946007)(66476007)(36756003)(53546011)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tis5c2lHNWFEcHM3RXV5VDBGc1BXRzlwYkZwK202Y1JLQjZTVEVGc0w1MTNa?=
 =?utf-8?B?b0hBaTRQRmR6c0htRldrV0ZLbklqTlVwTW13aHQ0WklRN0ZFbGN1djhVMnVK?=
 =?utf-8?B?ZnUyckFjSzhBNnNqdkpZNzZKbHBQK01teW5YNjl5WEF0Zkxka0c4RzM2b0pD?=
 =?utf-8?B?RUxQeThoUWV6VGVxSkxRYUx3WklKcmVkRkNueGtuQk04R1hHZE1WQXY5NnZY?=
 =?utf-8?B?WkVkOWk1d0w0UFlOZmNQSEhQTUtSL2tJZzFUZDZYODh6VCtPOVg3UTJqWDhH?=
 =?utf-8?B?dGJhdS84ODlhOVd0Y0VUQklvcS9kSFprcVJ1NXpnRTlORHQ5KzhBUVpUUmRp?=
 =?utf-8?B?c3FLZitCakdRWTJ3RjhIenhobmZjaUMrQlQveVlJbGQ4RUJPRFVtQU1xbkg3?=
 =?utf-8?B?RnMrOUhIcCs5eGVBYWRKWTJQY1JOMEF0WlVBVjNYUE1XcG81K1BINjk5WHE4?=
 =?utf-8?B?T2w1RmgrVytJQ2hSSWtlMGZEUnBEM01rVGsydEFhWHl1TVVkNE5pNXNsTVFS?=
 =?utf-8?B?ejJwNGV2S1dtY2FtMDNHUWpVbDh2bFBpZXpWN1RoUHkydEYwU0didEdpQ1NR?=
 =?utf-8?B?UkNPaUI5aVVGR0dWb2lWODZiM1JYb1FhNTBQT05EQXBjUjlwYmZZdmpnRzFa?=
 =?utf-8?B?c3FPcXp3b1ZwWjIrYlRMNnMrUkhjcFg3YkFSbDY1cC9qeUVKRUJrVUpRYjFa?=
 =?utf-8?B?d0ZuSmN4c0orS1JCcDlVM3pjeU1ndENWcmhnbkhnemlValJLaXpFNEp2bGQv?=
 =?utf-8?B?eC9qVUgyV2hMUGRFQ3l5NlpQRXNDVU9udmwxbkZqbkNJUVlPYzYrem5ZeU1u?=
 =?utf-8?B?STkyQjcwbTg2bFNEMzQ2SlJnOWdobHFzUjdWWkVjZkJpemVEOVFuZW5LbjBY?=
 =?utf-8?B?dEhGbDJ3bWpNT1JYYnRiVFZhNjhVenEvUlh5Tzd3b24yTWMwRjNEM1RxN3pp?=
 =?utf-8?B?c0JNM1h6L0dDZThHV1d1QnpuNExqZktWaWZhOGU3MlBweTlMZy9oeXJiNDZF?=
 =?utf-8?B?b3NUNXM4UGczVjM3NlFKRjNiMGJBbmxWM3I3UDhOSXh5c1ZFYzNRRHA1L2xa?=
 =?utf-8?B?VlBBUWNQTzlrRmhyLzRXTEZLdFhZK25pL2YxZlhTaDhqRllldjRaSE1QQm5x?=
 =?utf-8?B?cVhMdFlMS0gwbCs4c3AzZTJlMGJISFBxeXpPVExHbUJhbGs3UzdLMDQ4OUs0?=
 =?utf-8?B?ak5FTkNqU1NaMGxrS2lyOXo2NEhPeEpWUFh3czZ1L3BxZTlPWlpkVVROY0pV?=
 =?utf-8?B?MDdjRlFSQlo1NllKTFI4T2EvU0Y1ZVVyUGhyd1ZuVGFldnhVYmhybG9YUWJD?=
 =?utf-8?B?VDhLSFBUY0haRzVVREExNVJYRUFubmlKcDlNK20wbWpRTHZNOUwvUjdKLzZB?=
 =?utf-8?B?d3VRVmt2dzBlUGJKU2hoQW5rOEwrWVVMZk1GQjhMNlhNY1lZMTFuZi8wcjFs?=
 =?utf-8?B?dzZ6bXFIc01KelVSUlhJa2dBd3h5cER2dWVqTTlldDQzZklDSHhWRXRRTENr?=
 =?utf-8?B?Qjl4S0hpcGk3Q3hWSm9lQmhyOXIrbVdIUlRCdysvMkZxSTZGZlVvdUZzQlRt?=
 =?utf-8?B?NWtYOXZDOSs1L2JBdWpRN0pPUUlJM2RYNjcyYkc5a3dncDZ1cExneFk2aUxK?=
 =?utf-8?B?eTFkSlVBb1U2bExvNDNHWXJqWEI5M3ViR2t5dWtUQkNuWm9lcVNOVWI1bDV4?=
 =?utf-8?B?RmpTdkhkWkQ2NlZDcjdZTEJyaHNTRDlmR09Nc0cwQmNBODR6b2trWWhaNkp0?=
 =?utf-8?Q?JmFdEhpxm896BMlr1DBbtFz1bOu9m7SGtEv4/6K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e19ac4-b2ec-40c8-6fd9-08d92f3c2b28
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 13:56:11.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ss3Nb4zM1g0BuuEeqFWLOP+LvsqQNe3sbKIhJzHjlhmqY8DHHV9w7m3q0IsDysF7TADqP4f1JcWab/A7W6DUHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 14.06.2021 15:49, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH 4/5] libs/guest: Move struct xc_cpu_policy into xg_private.h"):
>> On 11.06.2021 18:36, Andrew Cooper wrote: ... so tests can peek at
>>> the internals, without the structure being generally available to
>>> users of the library.
>>
>> I'm not sure whether this slight over-exposure is tolerable in the tools code,
>> so I'd prefer leaving the ack-ing of this change to the tools folks.
> 
> I am fine with the change described in the Subject.

In which case I'm happy to give
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


