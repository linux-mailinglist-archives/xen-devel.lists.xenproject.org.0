Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E74CA9E6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 17:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282439.481146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRb9-0000Ow-PM; Wed, 02 Mar 2022 16:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282439.481146; Wed, 02 Mar 2022 16:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRb9-0000Mr-Lk; Wed, 02 Mar 2022 16:13:07 +0000
Received: by outflank-mailman (input) for mailman id 282439;
 Wed, 02 Mar 2022 16:13:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPRb8-0000Ml-Kr
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 16:13:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a45dfb53-9a43-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 17:13:05 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-JtyBaiPVO9-E1eUDdsuP0g-1; Wed, 02 Mar 2022 17:13:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5713.eurprd04.prod.outlook.com (2603:10a6:208:125::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 16:13:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 16:13:02 +0000
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
X-Inumbo-ID: a45dfb53-9a43-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646237585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqoLkMoWyHeuz/lWQmvZFCNhfMIrDkR3sLW0gFYsbNo=;
	b=ZDbe13pb7cbEw8PT5u3NbhvWG+HGf5Ma096yVgQTI5nLvI5oQgqJnNNFL2rz6HiBhX6g5B
	LIg5bWmI2VcJBkSTUVVfY3WgomtOdi2gPKEiLwxBhrfIpNsB75xYZf2ataFI1jrlnJUroj
	XMAKJ5+THyHv9H0r/wx0HH2jngSaPR0=
X-MC-Unique: JtyBaiPVO9-E1eUDdsuP0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2UGXSyUYanDtn+lR8+rfwf0f6d08nvCmC66zvmQvoNkyyombixfmE83I8aWw52AJgaHGNxs4zqmyWQo1zIgHBZNAJwUfrrLZNpO3Gb0SCfWot7kkJgVg6v3sf8ShMGk0F3AhFJR+waFi6ZCZfnxoXH0d2++ulXyaNjzYJJ+NWpCjXmTIItF/JvfvMrVY7x/zShhGYmmwVzX0dLlYrtgTY9/EK9+TqqQzRwdR+IE1T3e9ROWj2SS0iadeKCtsThUaEj0ztfJjyZE+c9/lwKd06XPY38YzQ89uDhoLvv72VHMOY+0DN5a4d1Ta9XeFPVZdKt6eXYzsSe55ps1vJmGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqoLkMoWyHeuz/lWQmvZFCNhfMIrDkR3sLW0gFYsbNo=;
 b=nCxYQMnkKA+yv9jZYmlVjyvd09db2mAQY+g7p5Pjf+gq0MAEEMIHvIkPqfJsT42PfswCFEfO8rHWq/bqqceEcgj/uBdaaD0J5g+oJa5P5Roa3lnGvHAsmJdWUPeqhcEAZ60gqQjnEplwUYlknKP62ozhke5zB87tYWFLa8s3n1HoBlJC4mhvKsWXYIz27olgd0e481gBAzTg4NewocLhjJHBJsaJTvEO8S0KkOnJ1RnD70+nVU5xEPFraIKZ36ani/8BM8/xe9xRQJvvNZio0G8ViWFN6CSOA8nI59Uu4YKDSAEyUH43m+qnS0xHZDNF6JQKF2RLnPsC9o42OROiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6188a3b-7ea1-48b0-c17e-9cd6ee645db8@suse.com>
Date: Wed, 2 Mar 2022 17:13:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] livepatch: set -f{function,data}-sections compiler option
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220302134425.38465-1-roger.pau@citrix.com>
 <f67e599d-4dfc-c98e-75ee-8510237cd527@suse.com>
In-Reply-To: <f67e599d-4dfc-c98e-75ee-8510237cd527@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0018.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8023d84-6795-449a-0dde-08d9fc6786da
X-MS-TrafficTypeDiagnostic: AM0PR04MB5713:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5713E0B6B97F16EF19793585B3039@AM0PR04MB5713.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7XZUePl9WPKh+QLjhuzSK6c9Z7XQHg4SY8UWCJ0Hj52BCdy4TVleOmWN25vwrtDneOgqcMzUn8Hf8PAn24p48X52KGqTKr2AAJnsxbuuAmrv+NUILxcc9r1bX7+gz0ckTVDuLA846xBxyBt5ZiIxdojwizX7p6jzuQnppAP8rPSaJqWxBUG865tKAQ/zD/GZRX9cq1diwGWmwBpVIc2dyiiFTjHD+MkEvwA/0oeKE57oISzUcfVZwt7j6TVO8T9CHoIc8lkN5dp2yNU0B6e8V3AqvaIp/ACX8wfytMd9T+TJ8iet2PHz+ASozSTpF2N1hicOintYtXdwxC3ELBkFF1uUljDDPXLeBK3BnNxLJCp9s+mhqOXyQnNLOfe5AbaNBQkMWyS9oRWdu+v6W4jUeriLXJfanqJGfSQkC1q4wQdsgaJjFvxAFBkt7yLpQVcZUfQ3uS2Gn0mziHylXn/oMOtmBXZINoobvoQuBFSgNL9j8Qvi2xYVIiu5pVUl0m3ILK8Ea0FKYkM9lc15eOcMFMC3OLMCndTl6oaGlOu2615/Q651y2HvXVeo45SbzF1Smz9rOenBMIESs1zJtxxg7M9JrUsCcIQtExSeNGUUGdRnrIOGIDM2LUmQGHeTcbCXF9TFETU3+B0z2KWqhNu7OFjkKatfD+UHT5aXMUkLIkFX64lCJek8W90lcXC/f8bOFI+T4nWEhtuYlgf+ta1UdYAmXZpZvDjpk3H3gEYGjIsnZOjOVSNdtNC2rLxkKFZJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31686004)(8936002)(31696002)(66476007)(66556008)(66946007)(8676002)(4326008)(6916009)(54906003)(316002)(53546011)(508600001)(86362001)(6486002)(6512007)(6506007)(2616005)(26005)(186003)(38100700002)(4744005)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0o4ZkczRFU0dWVOTzRRZ1pJaDZ3NW4xS1J3RlRrbVpCVFltRHBGdWQyOXBj?=
 =?utf-8?B?NFdVYXJaeU9NcnVkWFNKOHlPMHhPMUV1elRWM2dsVzJUdHA4ei80RjArOUFI?=
 =?utf-8?B?cXN3SnE4T3k2Zkt0K1VKTm84c2Q2eFJ3U3lzL3NtV2xrdU9iWlRjRmlwcE5S?=
 =?utf-8?B?disvRmFPSHo4dHJUaVd4ZXFoajJReC9ydDZXYzRWMW5tdTRvL1E1RlI0aXYw?=
 =?utf-8?B?UUVsK0liaXdQMHpLOEF1Qkk5bkx4S2d3Q2R0czluR0ZmTnlGbkNkZ1FPeFFt?=
 =?utf-8?B?UmRFbEg2RnJUR1BUa0wvU0dVckNPZkJySzcrZEI4OTh6SytWa0JaTnl6N3c3?=
 =?utf-8?B?YWdOVThYeVZPVktzeENKREh6eEFYYnE0MjU5L1hobUliY3BvTjJGT3hlNjFr?=
 =?utf-8?B?d0NZalYvY1lDMUJ1bnUvSTlJa254VVJBYyt5VnpUVjNMRDlGcFhkblJIQzI3?=
 =?utf-8?B?YWRMUDJpY2RhN09KdjJxMmRUa2hZMCs5RGhJd3g3aGxXRDBJMHg0K25XRUFo?=
 =?utf-8?B?eXhIdkV0TXJUVDM3YkJvaDZXTkgxMGV4WWxZY0hGcTZydC96bmRUQmJWdURk?=
 =?utf-8?B?Uk1rZXBncGtKL3dRZHNyZVkvZTFvUUlPNDI4bXJhcE5mdEprcVVWalNVWlBW?=
 =?utf-8?B?VUNEVzN4eHEzc3dJcE93eTAxNlRNOGUvMVl0dnJ4Y3doTjQ4bVFhUDkzakFw?=
 =?utf-8?B?YldFOXQ1b05DcGhYYXdRVmhQZExuSlF3QXBjTHNzM09JUUtjTXJQK2dBbmxC?=
 =?utf-8?B?T0dpR2hyWDh1UEcvSWxGRU0wc29kR0NXL0VDM1F3NnZrWWRJOGYyaEU5SXIv?=
 =?utf-8?B?MWJXS1ZZUEl5RlU0bnJWcjJFZUxtVkVZNDVhdlUxbGI1L2VVUjFhcmh2Q1c3?=
 =?utf-8?B?blpvTmszazhybzFhNlhlYUhuTTZIa0N6cS94VEJsUlBFYjRGV25kb2dweWRF?=
 =?utf-8?B?U3czRXNjaTBYbXlzRlN4UDJvVFJibzFZYTYyMUZEUlY4L2piaHIvQlFvMytC?=
 =?utf-8?B?R09XU3ovYThlcTJOaDJVZXFQZTVGTkdRTUZlbzc1NDlOQ3E4ZW9pdEJmdlVm?=
 =?utf-8?B?Y3NMR2kxRmJtR2FWUjFvRWFHc1J3WG9Yc1hWYzQxRHl4Y01CN1l6S2VXaVRw?=
 =?utf-8?B?bzAxOVNET0ZPbWtQbC9MNXF3Q0ZuSUc3a0pERXZ3TEg4bU11WjVPV0puYXUv?=
 =?utf-8?B?d3hmVmRsNmcxNnJJV0ZteDJrTEpDZDEyOWhORDJ6anRES0QyMlV6UXk5TTZE?=
 =?utf-8?B?TW9lYXBzWlUvbFo5Z2JSL3NZS1pyRkxvYThMWG9jQUZBeWQwVkNjdVh5eWo1?=
 =?utf-8?B?dHN1Q21aT3lFZlYyQzdyUzYzMVhCbFR5QnAvYWNmcVFwaWkwTHN5RS9CdWlh?=
 =?utf-8?B?TU1vR3BtOXUwWW1VMmhnNTJXVEZDNXdVQWdtaGRJNThacnd5TVUzczc3Vmxz?=
 =?utf-8?B?Y3oyOEdPRUxzZVUzMVZxeVAwaU5kalBmK1JQZWRPSmVvNWRDYUdzTDM5OUFY?=
 =?utf-8?B?bERuMWRnY0pjSHdKTVBhUXRKTlB6a0R4UmdrUHZHakt0OEI0NVZSd3ZCM3Zz?=
 =?utf-8?B?TWZkdW10ZzZVNFBUa0g4VXgwQjR5djV2QmxSM0hIOFJKQk1QcGMwUFNiblF6?=
 =?utf-8?B?M1FjcDU3QXlob0t3blk0Yi91bEJpbUdiZ3lWU3hMVFJadm9pZTM0Y2hzM2N4?=
 =?utf-8?B?enQzTDFEelFoVEhWU2p0dVFYNzVEbEhoVHE0NzM2RUx3a3FheFVoMHluVGpG?=
 =?utf-8?B?NFp1NExMdWc3ZzhCN0hVSHpVYUthT3l2SFdQdmxhNXI0Q1dUUkxaakY4a0xZ?=
 =?utf-8?B?TjR4dDZyMWpMZVVoQ3NHU3NEUWdNTkxWUzFoeHhTYnY0cE5xZlRpVVdnZkdW?=
 =?utf-8?B?ZlhoNkVJaEs0bEhJRyswbTl1dzhTT203M2RKc0JUbm1UUmFjbFRFRnFrMjBa?=
 =?utf-8?B?MXU4eHNTbnI0c1NUc1g2YXovQWZOa3FrSkVnYXpOdXVxM0hhNkJERTlaMDhR?=
 =?utf-8?B?MGRTdXFXRFlLWFBlcGc0U2lQTVJIT3JGOXFyQk1IQTJJQStmYUhicnhtSmVu?=
 =?utf-8?B?Nk4yRGN5d0NjNVJQblBVSnhNOGVIUmV2N2RIZGFPTTRscjdRalVuUTZLWlpn?=
 =?utf-8?B?MHJBUVlFM05ZakdHeG5xS3dpRmQ1MDNHUUNwL2ZzVHZHaTFBR01RT3l0bVRB?=
 =?utf-8?Q?1FITbm7T1sWjgDXK0qyiDw0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8023d84-6795-449a-0dde-08d9fc6786da
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:13:02.5154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DIpVxkL/k+YmMUU7N+8LhFQ9OzhlPwYH/2BE33Pui/+dT/0DD4+Re6MljIAXxqdcb/IOI7TyP9he6p5isSKdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5713

On 02.03.2022 15:41, Jan Beulich wrote:
> On 02.03.2022 14:44, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -88,6 +88,9 @@ SECTIONS
>>  
>>         *(.text.cold)
>>         *(.text.unlikely)
>> +#ifdef CONFIG_LIVEPATCH
>> +       *(.text.*)
>> +#endif
> 
> This coming after the "cold" and "unlikely" special sections and
> ahead of .fixup isn't very nice. Also from looking at the linker
> scripts ld supplies I'm getting the impression that there could/
> would then also be e.g. .text.cold.* and .text.unlikely.* which
> you'd want to separate.

Thinking about it, with -ffunction-sections startup code cannot
reasonably be placed in .text.startup, or else there would be
confusion with code originating from a function named startup().
But of course .text.startup.* is similarly difficult to arrange
for not ending up in the output's main .text, so adding
.text.startup.* and .text.exit.* later in the script wouldn't
gain us anything.

Jan


