Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736994921A0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 09:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258402.444940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9kCC-0000qa-F4; Tue, 18 Jan 2022 08:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258402.444940; Tue, 18 Jan 2022 08:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9kCC-0000n7-Bl; Tue, 18 Jan 2022 08:50:28 +0000
Received: by outflank-mailman (input) for mailman id 258402;
 Tue, 18 Jan 2022 08:50:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9kCA-0000mz-PG
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 08:50:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adc3f946-783b-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 09:50:25 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-Hfbj3UlgNAWOmjWqnZM46A-1; Tue, 18 Jan 2022 09:50:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7311.eurprd04.prod.outlook.com (2603:10a6:800:1ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 08:50:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 08:50:22 +0000
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
X-Inumbo-ID: adc3f946-783b-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642495825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=42jnB9CDBgye4KjnlWYZmpwy6JCXdP80FMVvwpSacPs=;
	b=O5vqGnlnghDkyfQ8/xOV/naAgiOjLztLdp6/k0og7u/VWmYT5kRTdzHwSFtxAgpLV7Evrn
	1nkBJalqZCryQksQUm3ezyOcuqjDrQtKz2xhaOKo1w1DXWg4zix29gEcYV+mJnBssZgLrn
	L9ezNdQxtWyowtk0dSGGDA3/oeeJQ1o=
X-MC-Unique: Hfbj3UlgNAWOmjWqnZM46A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHqUsJVANspelGGFnij++cLKJx0Z01jtsoEQYUuQ4K8QXMRoqQTbWJcoREK1qhSIGgCkJoTLidevmIypCi9fvd1ez1ZAw3fgljw++sH6fHLe51t+Nd3R5CsaTRBTp8pBrBd4HBOUQBhjEwoYlM6hworRgjZafUE6k1kGj6jGYJ/UAmt0uUsKyjTGGors4hWvXt6A577FtdjHCese8opFF8c5Qgi6G7WIv88ouaA5Qv5l1X/GDguTCERaqYFYHgksSzEkRlb+iLKNzCDERgOSpBCW6ytPgwpaQA89A9253ttYZgd7uCBxPRQJ2zJEj+JcDazp58348aiYSU5WpbaQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42jnB9CDBgye4KjnlWYZmpwy6JCXdP80FMVvwpSacPs=;
 b=X2C0uy+Ev92NKo/czakNVH11OmdgSRaeOg+UTPJWeVx5hGFt+lwy4XYGb6Df/iiirhN8Xb90SDQp5TwLNfzLCqH0zjnlIUA4gxWT7JJbKCYWHrR85TnzKW68qb9UtTtF+GXqmW2XO7MzHh4ULvLKbUAYzvw9Nhkfw1tVAV1C3E9s/HcqtyLUfUqEy+0J6f/zAngRV5J2wQYX43hy12qlTQmj6LdH5+fFotypOKkj/l+6gT66rEWL7oydg6Jos4D5KPE7h9bD4fnOrxS8tI1zO8fFXMxe67vi3KXxOwl0xm8pd9hozY+8VRmVa4Hq1SDlowEdGyBugN/Kdo04ejukcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d3db5f4-44db-b782-656b-d755fbf4c441@suse.com>
Date: Tue, 18 Jan 2022 09:50:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/time: further improve TSC / CPU freq calibration
 accuracy
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6c50c7b6-e521-e34f-1808-a4e2961b807e@suse.com>
In-Reply-To: <6c50c7b6-e521-e34f-1808-a4e2961b807e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d915778-4dc5-4d7b-70f0-08d9da5f8ff3
X-MS-TrafficTypeDiagnostic: VE1PR04MB7311:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7311B7CE9D7C92AB936DCBBBB3589@VE1PR04MB7311.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M3v0wjacIpdBzd/EGO772SEVCOCwBu5EwhTvqhxd1daVbMG8pW1nCxoos5CX1butXlhl8cWkLKj7Rs5dDQe7xj1GYcZrRIuot1/ki1GhgjwE9hSE/oZ8MSlajeZwBTTrSHpyzscpiBum5wOepp1fqzC8beG6tQL3zxhDoCB277nS8MibzhUiuPPfLZS830N/nNnciVkgxG4OcGhg/KbeTU56yt+ReaxSNOpqEEgMZvYPBd3tfyJnP0ZfoAWtkhWqaJldC1QMVnpY5xAxTwbBGNTLmgd68Y4nveiswjC/Km7WVKHMv0Ogw+EOZHpMnBDfkD0OfoTHHbs7w8KpEnW8tHbZpJXvLxTR7pURvZ8CFPQ1qdN4kcc7eBWhOPUyQSEYW8dj9JeV+Vft7/CNSFIZr7yMoCdTtqDdGl3hB2c0990ucLy4pbeEcCnyterZFT2ThX4ElkT7ECMR8Xee81d4TF+llmz4JqRCwjCiEin8KKYcVg/DdDnuHup1ohXd3aufVvEQliBwMpLou7QT4VS46K2MsbR63D0ALuoV0e6VX5fOZzV7qYMonwtyLfR9v3BSOuSrJZvUfDp2UDJRqbH7qJXPv8JQI6VvWlxEOVfNJKPXgtYI6eYQyYcPh8wwexD5NNBsmlqnCUV5/2bvyUHil0rVR7Lym8t+0H46lAyM/vRA2dvq1BCk2iiT36ul+xemFY4RJHY5pELGwCoNDth1ZUSSNIbSNzHvgJV3ZVq4Mlw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(6506007)(8676002)(83380400001)(2616005)(508600001)(6916009)(316002)(54906003)(4744005)(86362001)(8936002)(5660300002)(4326008)(31686004)(38100700002)(6512007)(26005)(66476007)(2906002)(66946007)(6486002)(66556008)(186003)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekRTY2ZkWm9wTC9oRE5KOHY3aXI1TzlFL2VmTlY2UFF1WTZwR2FPTGRTVFBr?=
 =?utf-8?B?N1FnTGJsZTh2Ry9iZWdpeTNBaExEK0N0UUVnNXpXaWFaMDFNcTlFWUtEZ1ZT?=
 =?utf-8?B?dkREQnZBR0RYTFlvVkQ4RzlPQjNQM09BbUFWWlN5UG1kTjIrS0x0SVFLbno1?=
 =?utf-8?B?d28wOXp3cEpTck9GTUxJNmRLRXFHeE1Na3YwODZlRkt0WmYzVEFTSzVMemFY?=
 =?utf-8?B?U2FMdWRSUkJyN3hhR0hJUmVxenpMVkZWV2RUa0J5NGtsQU5vbGV0T3h5Z2R6?=
 =?utf-8?B?Z1lnbHJGVll2OGs1T1lVdHNrSk5iQllMajFoRS9vamZGZFU3RXBwOHR5dmRV?=
 =?utf-8?B?d3JDWkNFeUpDU3FialJTTnN2N29JVjdoZ05tQlFyWi9ZYlcvaFlSNUNFTy9s?=
 =?utf-8?B?SWlaVHpzcnNyMEY3cU1uRnlrUkhYa3U0YlNRYVkzcGR6cjc4bTJhKzFjYUNP?=
 =?utf-8?B?c1FIaDg2MCtZalg2NUswV2Z4eE5XMW1QUzZaRlREZ1hIb0ZjM0t0SlduYWp6?=
 =?utf-8?B?TzhTYlFrUytteE1LYWpxN3BEc2IrVm5WQmJuSE5iNFVxVitraFVjMjlnbFQ0?=
 =?utf-8?B?a0FiS2pYVTJUZUszM09FVnE3OXBBN0lqWmtCNVlHLzA2RlVQUU1Md2NpM09a?=
 =?utf-8?B?NHg2M0NySkVmbkRWNmRSUEJwRjNIV3FsRDM3cEJYZy9BTHowV2R1amxoZ01l?=
 =?utf-8?B?d3MwV0tBaGZzYkZvRHBEOVAvWlg3a2wvRUoyOG9wYWFZT01Ec2tlc2xSQXBM?=
 =?utf-8?B?VVlTZzNRWUFiakZsdmFNdVVKcEZXSHBZRXVaTVYvbkt2WnlKcWp1L1BRVFcr?=
 =?utf-8?B?QkZ0NVpYZEVwR0hNb3duaUlhTzVGZUs1Ym5hTFdXdWlQdmxDQStVU2t0aCtw?=
 =?utf-8?B?NGd5YVZCWC9FREVUUWlpRVJZb0tMV1BJRmllTkE0YnA2dUc0WWFNWXNlcm1u?=
 =?utf-8?B?VS9hSkJQc0FYLzA2Ry9QZnVxYkM4UlArYkMzdkRIU2hXMzYzcWNWeXJFekZz?=
 =?utf-8?B?WDZ4RExlOHhFdkphWUZPQU9ibU84RHJvZDNzcFA0QUhCVlZYQVhHTW5xRERk?=
 =?utf-8?B?ZHowcCtkbjdDZW5KVFZUcFRTeVdnU1R6NmVoZk5sWWxnZXp2cWl5NzFSZHdv?=
 =?utf-8?B?VmZNcjAwZFlaa3JFOUVXTXJiVUNMSnVPeWdqMFQ1K3B5OHRuMVljektXRWpt?=
 =?utf-8?B?Yjh3SHJzc3dCV013VWZwT2d6dVdhRXNFaVlZWUcwalBpeEYxdjhqZmdudTJm?=
 =?utf-8?B?U2ZGMEdCMDVDbEJ0UzdFby92akdQSnhTVFlQTUpzN3hrb2NHV2VGRW42aVdi?=
 =?utf-8?B?bGluemNkTWhSd2dhbmVzcTg4a2dlMmJEOHhBVTdSdkxZbDVhb2hDSUFReGJE?=
 =?utf-8?B?NExYdXpYdk9icTBlbmhNbDBScFpmbkNjMnlCajBDSXhqak5RK0hkaHlWZjBH?=
 =?utf-8?B?UkIyK2tPYWFsaUJackpKek9odHhqekpUNVo4TmF3M0xkMklyOWprK2gzRGJ5?=
 =?utf-8?B?bXdoNVdqZWYyTXFYTWdCL3UwMU5pUExiY1hkMjQrK3g3YW5sRWQ1TkkzSWl6?=
 =?utf-8?B?L3ZMdExIWnpKWmZTTE8vKzFwV002NnVsekZvblh2alJGb3Q4Y2h3ejhqVHU5?=
 =?utf-8?B?QXN2QUhMWVZoK29uaWVQejZXWHB2UWVrT0o0Mk9qQjk5YTRuSFlPSkMrelhw?=
 =?utf-8?B?MDJSckgzNGlpZjlJMUFlZEFNWFBhMjRxUVVmMkNLVk8vNEtUclpzbG9UWVE4?=
 =?utf-8?B?R0RLdlQ4T3NMUkl6WFVaeEZwZEx4cElaR3ZsT09xcjR4UndSUzVWeUw1cjJt?=
 =?utf-8?B?YnlhN002WW9laUNScmh3TmZMMEVLUmNKcGFwVUp3KzZYdklUblFldCtSV0kr?=
 =?utf-8?B?RlpmTjhadXNBQWRzNzd6WXpobTdWYkVERjVCL0U0QWh0YkZ1ZFlyNjhhTFhG?=
 =?utf-8?B?aEZZNEZ6aHNreTNuSC9pelltdTJ5endCZHd1S1pKeUNLVGQvT2NDVEdPdDVE?=
 =?utf-8?B?NFdZZzRpMTk3aUNBSHM4Y3RtSEpXVGtSak12VmI5T2Vpd2treWd5NXY1OEpZ?=
 =?utf-8?B?NmNaUFphNE96Y0pUZWdsbHQ3M1NnUFVaeFVLalgvNXhYS1FsU3lmVjhtaGtn?=
 =?utf-8?B?dkZza0hEaDNrVk9wTFV2a1JIVDlEK294NlNXL3JyRHNaZUx2Q3ZxUEp6S2RZ?=
 =?utf-8?Q?dxh4FXDjiNfhpdd29dJnUSg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d915778-4dc5-4d7b-70f0-08d9da5f8ff3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 08:50:22.3349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnBdeQisbQzofjw7h5InSmJeW7MySI9IoEdPPoUBB8vMOoYJcJY/wYwMMX4Mmpw0jncnUUDFcZ65KkSbCynN1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7311

On 13.01.2022 14:41, Jan Beulich wrote:
> Calibration logic assumes that the platform timer (HPET or ACPI PM
> timer) and the TSC are read at about the same time. This assumption may
> not hold when a long latency event (e.g. SMI or NMI) occurs between the
> two reads. Reduce the risk of reading uncorrelated values by doing at
> least four pairs of reads, using the tuple where the delta between the
> enclosing TSC reads was smallest. From the fourth iteration onwards bail
> if the new TSC delta isn't better (smaller) than the best earlier one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

When running virtualized, scheduling in the host would also constitute
long latency events. I wonder whether, to compensate for that, we'd want
more than 3 "base" iterations, as I would expect scheduling events to
occur more frequently than e.g. SMI (and with a higher probability of
multiple ones occurring in close succession).

Jan


