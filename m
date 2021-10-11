Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77604293C4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 17:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206237.361755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxWc-0003H5-BW; Mon, 11 Oct 2021 15:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206237.361755; Mon, 11 Oct 2021 15:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxWc-0003Ev-8C; Mon, 11 Oct 2021 15:47:38 +0000
Received: by outflank-mailman (input) for mailman id 206237;
 Mon, 11 Oct 2021 15:47:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZxWa-0003Ep-8w
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 15:47:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ca0345e-2aaa-11ec-80e7-12813bfff9fa;
 Mon, 11 Oct 2021 15:47:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-IfWy4grzPvqB5Se84UecUw-1; Mon, 11 Oct 2021 17:47:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Mon, 11 Oct
 2021 15:47:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:47:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0007.eurprd03.prod.outlook.com (2603:10a6:20b:468::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 15:47:30 +0000
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
X-Inumbo-ID: 8ca0345e-2aaa-11ec-80e7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633967253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2saFgLUAekDxDtzzvDlCgfc9N1FlVHZpPDYHFPiu/oA=;
	b=bvnZZ5RZmp0b0YHXVSzc5t4a7AXKIT/ENAgrFSp9dBSHE7DNSmdytV2wPIMN8XFI3THQ26
	TNk4EBxcq4Xz8jc1vIxQOlrJn0pwmFho/Gon5WY6OwACfvcQ2oeVhBG2LW5PRC6E2CaeUJ
	M6JSnH16g3cQ70/K5N4BhMTHuXpwUBA=
X-MC-Unique: IfWy4grzPvqB5Se84UecUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB7Qd7yaPheOrlB/OriW+ggL5/Ss1O75Tagu8jiGnvcdNcFDJdE3EsKwMKWtUasb5R+z0ayMr7uVkEekl9vqJMY4IbxSvMuJqdY29PCjxe19ieqw4AQDFIpGx9ZRYiORmvJF2XrKFig8G3HkuC8aayRFClNU48ND5MkGp5jzygQ0H2OpQwDuifOeXfoNQJ1leS9kOQ6RkmFDQ6e/fJW2DNAxKp6QbiqQe9fRQYyxLyw9FVTuxtJkn1WT6Vf7tmu/FGdFhlhU3otATOsgA+8rbAjNGF3posgU98M6lvsaSTP7VQKocs3SfeIiMA5Rjch4pqd2GtT9sY7yGBJ1iu4eUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2saFgLUAekDxDtzzvDlCgfc9N1FlVHZpPDYHFPiu/oA=;
 b=YFn8holIeStZbDQM7CnXolD1qu13BugYWfLG7uStnFaQfcQziijE+6v2oZynKfmSvG74yll9psAEXgFOvD+dXHxhblmKg/AMoRnKiZwKLePf5uOQQW+R3qK+AZ/S2pNTmU7c6GZhZiEKsWbWf5lsreH+89eB4RABGqIauPcsuQmJ0zsoQ2bM6/5JlbOqBkR3hgccXaPYY9Jf/9vJWSKQy6cZ7ANruFP02xCRUn4r7DkSjTTVkELOJsc2/Tlrf69FqhnCF70N3fLTNqbWATg3ohNSZgLmXZQkzItxCLKwKkTRmkPER42z7ow7qTHKhlEY0JME62gIVpvtgVhyE+itAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 32/51] build: Remove KBUILD_ specific from
 Makefile.host
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-33-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d61fa6ad-6a05-6ad4-4ce0-711b55e0827c@suse.com>
Date: Mon, 11 Oct 2021 17:47:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-33-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0007.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad4540ef-4de8-4c5b-bc90-08d98cce6f71
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73605C0A70103FE86475219CB3B59@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8TS9uLbgrEUuAqJATA+Nnj5vLF9aalYQk05O2ViVN5uYCYiVh0ZVv8myyq4zhIecU87PG4qB5u5eXeuUt++o0HzagHhWRzU+9673SM5FeXjlOGNMAtxJ3Pma6BMj8rF2+mmmOnBFMo+BZtbLmf6oPOr1lt/LaqnX7Z/WVLyFWQHLI7irYEElwcKrY2VF7yieSojASgNHBvCGAPrFsD3riyTlqs3wwDUXJCKEixRxho7JlOdM8HuHrz3/NQ3GdR4YsOWU5K0rH9SSE15On5z60Qj0UXuUIRhXnF9eCC1g3EYlho95InGxZxGe+UDc9fGpTeMFj+rgwPs0aXRIGWUSQXc8oj3ISXgkamHJriG9xrEihLUhuilsfFR1UHoOltkCQyklljjdRQbOpsZnvvDP8LeTFD6FwV1DllIZm5UCnDfmo0Jiiv0IIZacTeGzIbK/O7fwqEm6vj/gq/3SF8tkQdT3J4dSBPHnjcw7JwKOVEVlwQukwA9+ubjMe0/W0zGVGtR3JHHfLGeQ5aortSxtvtLZI7F0FvTBLX8zBIJR9itYrae/6rt7fPBcal/EXQkSglrINZ3rdptzKoaO1it4qGfaLlOovXK9vuva8/vSzm+Ttk+hbrrX9ywTbwvSGQG8lsB6xJf0hjHeUvR/XfwSCTMznEzQV8T5fPJcu3TN/Yz+Xna0S3RGhfiinG3XMmG16E1XY15J2g8731XLIsQfIwG8phqPqE3LGk6ZWffAw2WbkaVOHlwwjpdCF+fLUYee
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(8676002)(36756003)(31696002)(54906003)(38100700002)(31686004)(508600001)(86362001)(6916009)(5660300002)(4326008)(2906002)(956004)(26005)(6486002)(4744005)(66476007)(2616005)(66556008)(8936002)(66946007)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHdtbGZFV3BxM0Rua0tTbVY0WjQzQVd5ODZpTk94L1pKNjlCV0lMTEJkaWJE?=
 =?utf-8?B?SUdXWmdqYUUxcDROaC9pRDVDb3NKVnR1UnB0VGlsbFV2Z3VkQzYxRnJtaXlx?=
 =?utf-8?B?N1JOVko5QktsdnJhWDNSdjNRK0xTTGJDanpwZVNPREo4cWNPdlpnTlVuaTBK?=
 =?utf-8?B?dUcrZm1McGVnTjNJck83VkF6ZEFSM0lVOWljZnpkdXhWd1RuSVp0OCtlNDJ2?=
 =?utf-8?B?NmFTQ2pYeGl3ZFdUdTJ2ZThBL05SSDZQdmNCRlkyN2ZrWUhhSW1sS0phRStX?=
 =?utf-8?B?bDdZRnI2b2ZEdVJOQVJtRTJBdUc3dkwzVFFNNzlKcFlyemcrWVdscVlmNEl6?=
 =?utf-8?B?VExmMFBBbXhkblBRejd5SHU2b2NZaGtyaEpmV040Y1RXSnlIbTRTamNYWUVU?=
 =?utf-8?B?Zk94OGM2R3cxaGhKSXdiWmUwbnBkaXYyS0dyOGFVSnQ1Tk9yT2VaOE9pVGMy?=
 =?utf-8?B?Nmk1N2hWN2k2U2Q5VXFTcXgrazhwaUhoeHdGRE1LaUhhQ2VPWW1vLzZvK3Yr?=
 =?utf-8?B?SzdrNTMyc2NZQ2lQLzBnaDVGL2pETjRSaS9sbWVSZnZ6aVBKV040V3VZN054?=
 =?utf-8?B?ZHZpeGVGWWtndmQ3aHFRcHBsc245SGFhbHlydGl6OC9sUXhXQ2N3b0ZKMFRa?=
 =?utf-8?B?dU9RdTNlU3lwRUNDOWE0OGxBL243dkVLQmd3TWhPVnZHeHZHR1hJd0V0dmxM?=
 =?utf-8?B?bTZNN29yMXp5cmY3b29FNlhtSG5SeUw3S3ZUWkQ3NG53dTJCblFJMEt4dUpC?=
 =?utf-8?B?MlYvallETFZBVmZqTmNXVmovQ2oxbi9qdmtuSHVWZG5DTnVuZG91VXpOb3NI?=
 =?utf-8?B?RVBHSzJCUmhxZitDd2FsQlhXa1piZ1gyOE1OY3ozSDlKS2ZRaVhHS0Vnb0wv?=
 =?utf-8?B?aFZyMXRqWXRQRXhDUXI3bDRHTStySEFsMXdpZDFMczFhcnZ6Z25GcUcxM3A3?=
 =?utf-8?B?ZjZOalU1d1BZY2gvSUs5ZW9tUDVjVU83VW9OVjNFRHdHZlEyMFlhMk5ZUGVt?=
 =?utf-8?B?UEk4am5UMXZQV1cxZEI4V01KVDBFbkhUbjh2a1pZYWtmV1plNE81Yk5HYXV5?=
 =?utf-8?B?aTR3aHdqbGpYdzVXUkdWT3ZDbXppZTRaUFh3akpaNGFHVzF0RnR0SDdkenV0?=
 =?utf-8?B?QjlBcTNSMy9EU1dDL25lc0lBemw3UHN4VjF6MFczZ3hVbjZxRWVaSjhHVnow?=
 =?utf-8?B?QkFZTkszaHFhWFNndTZIZ1NJRi9SK3I0R3ZUcUFlMHA1WUZWcUNTdFBJZVNC?=
 =?utf-8?B?YmROMWh2T2FkV2ZvbXJFQVBtdHRzellLbTVhWVM1WkNRTUo0aGEzUWZjd2x5?=
 =?utf-8?B?V0wzVjFOVndlT2JGMElOZC9jamRncS9jZ1JoRkozeWJhbXZsYWEzMmlVOGk2?=
 =?utf-8?B?N0p1NVVUdTV4TGorVEo3N0dyc2dtdm5mVHZTSEhKaXZFTzdDYmRlcE5RYTlG?=
 =?utf-8?B?NWZ6VW0xZ0sweTlsdTJqWklaTlRQZzJPSTNoM0gzNkttbWdKZE9NSEU0MjZU?=
 =?utf-8?B?cVNVS0N3Ym9wQ2FRaTFYZnpLWGs0WWlicmNaN0c1ejJyZEdKQVlKK1BrU1RR?=
 =?utf-8?B?NWJyR2s2dXdNL1d3ZzIzbmNQa1dpMFNkblFDMTlpSHJFVmgyQURORWpDaENF?=
 =?utf-8?B?R0pGS01pcVJweW5LRTZYZXdnZTBDU25nOHNFa3didDJEblc2eXZzckhCTGhK?=
 =?utf-8?B?cVRVYjJQa3R0c2FUdlpSdjBSSW9uSzcyR2czLzROM3p4R1hZM3lUUmxPMzMw?=
 =?utf-8?Q?oJPTWka2HXwhmEXWC7x4qSvTeuvCVR3bXJzUGa9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4540ef-4de8-4c5b-bc90-08d98cce6f71
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:47:31.1381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/t4QeOH96bqofES0z195J0YCmC5pt56/0eNWJ2XZTQp8yQmpHUmT8nJcYWtJjZqfvoiKHq+KdwqmBGpflAKKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 24.08.2021 12:50, Anthony PERARD wrote:
> This will allow $(HOSTCFLAGS) to actually be used when building
> programmes for the build-host.
> 
> The other variable don't exist in our build system.
> 
> Also remove $(KBUILD_EXTMOD) since it should always be empty.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I wonder though whether their use of KBUILD_ prefixes doesn't match
our XEN_ ones (e.g. KBUILD_CFLAGS vs XEN_CFLAGS), in which case
replacing rather than stripping might be the way to go.

Jan


