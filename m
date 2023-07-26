Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01167632B8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570256.891943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOb8H-0008Sd-86; Wed, 26 Jul 2023 09:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570256.891943; Wed, 26 Jul 2023 09:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOb8H-0008QF-4p; Wed, 26 Jul 2023 09:48:37 +0000
Received: by outflank-mailman (input) for mailman id 570256;
 Wed, 26 Jul 2023 09:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOb8F-0008Pz-4j
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:48:35 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 959cf06b-2b99-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 11:48:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7771.eurprd04.prod.outlook.com (2603:10a6:10:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:48:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:48:32 +0000
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
X-Inumbo-ID: 959cf06b-2b99-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7XQOgIpGjrtyJqcILuwTFyUvAzNdE7PqZ2O8OH1pe/O6C57D+8kGJww1J/3c6yN42qnYh1THRkl+hIdiTH5VWl75COY/n8rB1cX4lISBarzhgMtJdhVheSzzfh2/mM1ziqWJcy0q2/JqtGak6FLfnj6aPIm4Lw25Or/MhDQzn/2q6rxbyCeeui6FGlTxNnMqGIdTncVmz0aGpBjEC8fvOImuxWDGAOh/QYa7km6VoDnrJlatdGsu3gx42NUH190IuvVTMoAvlaGmCcTY6naLS2vwb0Kw5l5LNyWWT8tVsyvmQT25ZRigs7BLdbekZMTIqP8XmKG8f/J+5h5hAu4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrCzlX0qMBt5gC+20+ygP/ys8E1TGMb1XcnnG2jJBrg=;
 b=ahT41bwFGhKF9RRI7VpTn8ugVQEyBLss+mteRsOnSuTG2gOFlpRatdayGF8zTAxNzJskVvtSQnbwsCBw2WtroN669hjvWCyPbMZeGa2P0x3iieTnuy5woQpuBurlzws64178bF+9pIMSa3wAdVevyND7OoCXJ9rRzJ0rn3Aj8HmZ+hqmh+bBt6UPFJn6cMEXtMrXd3cEJZz1pF+IcIeVIUf3TaJ505mjq5dtMaiY0A58lC0qhbhv25mi7QWkJf/wCXXd+hYp1kMe0V9mCT6gqO9N9St4Wim12x8TLrIh+v2sz3djDPI+dcWvs/6CuA4eiup0Jgjb3e+DkVPbd0Ci0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrCzlX0qMBt5gC+20+ygP/ys8E1TGMb1XcnnG2jJBrg=;
 b=SKhFUBn3eYPhhmvex7Re43I4cXGgGumJcFut7fm+P/ac7eF+XDdF/MZC7nrvDwkNHFa00cM0PoE+AjpkoWY039p7EI962P5NNxIBOs8eCruDwu2QaOaC7Th++hAflxHpeC9/bmw0nlyiJYmbwOfP/pV9hmQgULtQh1YF0A8pfIUZQh2VM0mC/nx0WO+OW7y5vkEQ1/cpSURNUAU8gy21quvAegsGuvcViRKFd5D6HtPrpwWM3KW+vToMYXxEHLIB2hr1HGCP8/8VK53zUBYkH//M++g14+XgRopzMpzGmOIQQqJYJGVz9YrDvJJOQoaZOcdqYVzGNC87s7r8tEIqqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95bc8788-fa37-0dd6-8380-6a05ea57a0a4@suse.com>
Date: Wed, 26 Jul 2023 11:48:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] xen: use parameter name 'mcs' in
 arch_do_multicall_call()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <e71bac85a2b7f92a6438f97048cc6cddc917768d.1690362993.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e71bac85a2b7f92a6438f97048cc6cddc917768d.1690362993.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 447e7bce-1107-4639-6bc7-08db8dbd78e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qJnPlGnbdx5ZDvDCuzq/kP0DyQm6fmfdiPp2NAJhzHJrXbg5OumeC3tUnuPVWTGlsHulzx2+pEYjS8UUlP2zF1yzsLQIC2wDTndz1PgsEpHfCoNRnaoh1IvMG2guyGH/LrbwHDWOnnAHHGLUPSdBJjiWWDKsE0+mbeN8Z1034oali46/KubCfEAQUXCwYHI4F9cAYP12UQetD9cE+lVjXrOOFAQItlOQrhawZ4VyMhNw+eQruYxemdy00rYEUMVOAXZNiWvYhMT8ZYjMs+znbt0/yqRa/ixoYZXWWD3u7iKvdX0FHFqY8zUPcFqnODzh+UjcJAb40/vNUkIoOM+HkVlGnC6wU6NdiQCmR6+4aaBUtg444uvLm2JGY3wwjzWr29gXkrEqpamfGtSr8c27OXhdsTGHRQ0DCmRpQp9ioexgiV0PZelGrZtEwcQvenEpCyYEzvaBkK23r2eM7MieIb27kPrCRV29DTMf/ffv6/RkcdPAp3A5hHdLsnFmnbaaTLsNnyaYQvN8ksluMcqKOEJBMcTx3dgjxa5SzAZwb9HBjbJH3Nzw4TEG5onaHg6E0Q73TzKYlUHXgQM9YDRIiBRDMpkjYxLQgHH5mdxztf9nKBPOKQ3241xkSpNn+yYG8P5obgR+sNJOj7/OEw6jIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199021)(31686004)(6512007)(6486002)(54906003)(478600001)(6666004)(36756003)(86362001)(31696002)(4744005)(2906002)(66556008)(2616005)(66476007)(53546011)(186003)(6506007)(26005)(38100700002)(66946007)(6916009)(316002)(4326008)(41300700001)(8936002)(8676002)(7416002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkRqOWpSK0wxTEhpRVViSkErSHh0elhuYXdXak1EbW40Nzhid1l1RWgveUpF?=
 =?utf-8?B?aGZBc0ZFa0tSOUNUQUFYU2JwbTRpS2d1KzZQbXVkTmhlYzlFY0J6S1B3eFpD?=
 =?utf-8?B?ME54TDZUTDlrejV0elUrR1F3M3RKblRIcWliREw2T21oNHB5OVFnbHNZbWE2?=
 =?utf-8?B?aXB0L2s5dzg5QlJ6M2o3MjM1NjI1ZWlhaHNrNERkTGhyRktVdWZRUGZ5enNx?=
 =?utf-8?B?cEdWR0QvQytHb3VjeFMvODhIaEFiNzZoSHRIRjVkNFNSaTRBL3Z1UFBwTEFP?=
 =?utf-8?B?eVBHWVhId0FqNlcvYXRzVkNQUXJ2eVJXOHVBYzd6b1VGa2h2VlZxUGJxY2xm?=
 =?utf-8?B?aUZ6V2ZWWThGTWI2UGduTDR1bGxiQzNrc2prMlpabTVBbllTc3lKQTJiQ29I?=
 =?utf-8?B?amZNdTFvVWNqZkVsMGVqVGJqQlVYcEU4NjRMVGFvNkx6b0w0cFMyN0J4YjFm?=
 =?utf-8?B?SXl0N1gwQS80QzlQbmxPcFdjN3cvWit4OFB5YzNhMlFsdEE5MkNnWStBdkRB?=
 =?utf-8?B?dVZyUXdSTmJDZUl0TFJVbDBCQmVMekdhZGdHT0E5cjlTdlVra1gxc2c5Tkl6?=
 =?utf-8?B?Y2M2OFIwVkhSc241cnRoTkp6clFmYURsYXIzT0pOVlBwVzJ2RjlabFFmWTNi?=
 =?utf-8?B?ekhmbzllZEZnMUZPeVo0SzRsN1UyemhOcVhmUkhvQlhFbUxuL3FoSjZ5L2hv?=
 =?utf-8?B?bWp0ZEYxWmd2L1BiU29kUWZvOHdyOWhsekkyYlZmYmM3VkFDYlFpYTdUV1h2?=
 =?utf-8?B?RzZxbXYyOVVjeE4zbDFCcG9BdTJGTDY1dUFCVThnTysvM0RUS2hVZENoLzhD?=
 =?utf-8?B?TDVUY1U5S3hyeTdZbFRuQXBuYkVoejRRcU5UZ2N0ekxXUXhFRHNQTUZhTjZF?=
 =?utf-8?B?L3JsT05UN1l3U0crZmhPb0tONUN0RHdyREpmTkdOd3ZESDNXc2RNeUU0ZDJi?=
 =?utf-8?B?NHlTek9OQWxabTgxc1FGekZCVlFnbHRORExsVDNlbE1ZL2pMRWZBbVJDcC9N?=
 =?utf-8?B?RzNEZFY0R1lGZENWR0FLY2VPL3Buck9pNkp2MVlpb0s0S2VId25SZU9KWW5R?=
 =?utf-8?B?M1dab3grSlo4enFDRXIvUEFacXZTMVZuVmd0T2wrRFAyTGFGTHpiRHFiY3ZT?=
 =?utf-8?B?eW1aMU1JanByanlsQlhVeHI3ZmpaNnVpZFZna3FTMkNTa1pjMktQcUdPTXhi?=
 =?utf-8?B?MndnNm5kWlEzdlBPWllnSUFBbnRTZ2ltQzVJSm0rZnpLclZWN01PYmFhWmE1?=
 =?utf-8?B?OHRHNTVWSkViajVZYVV5RjIvdjlFajU5aVBzTUtEUks1M1MrNTVsWXplQ1N1?=
 =?utf-8?B?cVR1U3E4ZE9yYUxIbE0xQjNNM2szbUtHM1NuSWkxRVJUY0RQaEgyRXhNb2pP?=
 =?utf-8?B?OGVza0JuMk9tQjR2SXdPcmxLajBwbXcwd1l3bTZKekJ0NXUwbW9jSTBrdDY3?=
 =?utf-8?B?R0hIZEFKUjVLOVpGV2xZSFZWcG53TndDN1orVFNRV09NVFJuWEhFV1hrdmVW?=
 =?utf-8?B?cjhKVHoyVXVLVzhCbDA2NVBGUy82bTVTblFjZkRkU3B5L0xtcVlORlFFWmNH?=
 =?utf-8?B?V0R0OWJBN1F1ekJtbkI3cGl1L0xPU1BTcVh0cUdHZHZFb0lUZFcyN1RzK2tv?=
 =?utf-8?B?N2V5ZHZENVhCL2dMT2d5eVdxNkhoSnh4UFF2N3pmSFhmakNRMWkzZ3Y0MmdV?=
 =?utf-8?B?ZXAwd2taUXlhcXZnNmFoYUhqbWZPWkRKbGlBbzBabHR5bHMzaUlBTVhJRERQ?=
 =?utf-8?B?cFY0ZVhjZkJnR1FqM05qejhHdG9Nakc0Qm4wSk8yTldjNVVXT0QrTmFuM0NB?=
 =?utf-8?B?ZG85KzhzSHMzVzdjcEN5a204bmM0ZWNhV3NFZGdPNUFzUW1ubHo4M20xZDZT?=
 =?utf-8?B?ZkJCZGoxaFJiWjAyeG4yZEJ0Z3NjeWtRbWptSUtjRTdieXFXc2ZaSmthMjhH?=
 =?utf-8?B?amFlSm5hZk45dzlNck1iakJNdk9vcVpMZTA0OG5EVlhmSDZqRVlyT29MRE9w?=
 =?utf-8?B?c1ZzU2dSOGFQNVVpQ0dSaGdjOUZDbnNXOW40enJrQmRkWHVGZ0s2dmFZUGVZ?=
 =?utf-8?B?dS90eUgvakI5ckpxK1RVN2U4R1M0Z09CeXFQWUp5Z2pPbTJGaFJUT1pXMEVR?=
 =?utf-8?Q?QWt/v7LwLIyhKrBxM0m+1s6qq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447e7bce-1107-4639-6bc7-08db8dbd78e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:48:32.0909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8jbiZhETgQt9bpMw6nDQEBQvtR/4sM+x6qcB3+N4Zu/D1PRhWjmlPk+AKJVvPcFcSHlUdIFi8qfxmv/q0OsHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7771

On 26.07.2023 11:34, Federico Serafini wrote:
> Make function declaration and definition consistent using the same
> parameter name ('mcs' do denote a pointer to an 'mc_state').
> This addresses a violation of MISRA C:2012 Rule 8.3: "All declarations
> of an object or function shall use the same names and type qualifiers".
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



