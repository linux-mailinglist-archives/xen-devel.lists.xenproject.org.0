Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B3589DEE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380502.614682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcEG-0008BI-5J; Thu, 04 Aug 2022 14:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380502.614682; Thu, 04 Aug 2022 14:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcEG-00088h-2C; Thu, 04 Aug 2022 14:53:40 +0000
Received: by outflank-mailman (input) for mailman id 380502;
 Thu, 04 Aug 2022 14:53:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJcEE-00088b-Ce
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:53:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38613149-1405-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 16:53:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6361.eurprd04.prod.outlook.com (2603:10a6:10:107::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 14:53:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:53:36 +0000
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
X-Inumbo-ID: 38613149-1405-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JomFwIJx+Te7bx6Ir90S6taIW9rfpV0ynVAzE/B+iM+tjTaBI584BgfKY+O/QmUaesJuXkdmcobFQqptpjpJYMXWWPpygW5BEfoFpZlJ5h779a2tnFLITsTDKeRbQ/Ei8dCVkOEbDVUzM3HEvQuk/3MMxapr4AXB9vF/D/QysC52mMjX1bmI7fwyoq26JtD5RKHK2XQHS/bUHEHP56vMxCZqGdhoz1cL8hgM7i4gA6yZFAb7pkyvfJBXPJd//kGwuknF/soO1S9Zu0avyfClouFl0ep5f6Bt/G0cAbcUziR4RdVjTItQZhlIHkNaK6rLNVt/8Xc4vamqps0+HAp5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5/5ebLjSqLJ2ns5/I4C2Bpb9+t6UidRDhwRglsmZBI=;
 b=fz9rst3v34A8DvjAvKu5Mx4YBVWCwgzr1gI68/RxGP1RuDK7lJZ/EReGSX7WpRjevQsq44AYegmFHG8WH+hnS+Zvmc2h/9Z8wY+MzcOtNOTOujOYXL3VYbcd0C71qBqrFfF565qoBJTNG2BZu0WQskXWlAJ9PzCYcQQz9mixg0jZGNHGeJwSAWmO0ODTDMTyFDP/UGqZUuMvUkARwSGobMCjiFb8Ae5SMuJCtGSI30mLzDIibvn6xobEB0LQGb1xb7vFgBggQsiAiPoBwNWlRLK8qD5FLoGADHpyQNOqFZoYcQrWfXRnBOJKR1pNmD/ksOc+a+XF2ZsBNWfe/7OtDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5/5ebLjSqLJ2ns5/I4C2Bpb9+t6UidRDhwRglsmZBI=;
 b=i0uyjrX/USqbwneTMiwlR6sVuPeN6pZ2fz8nESUSDiPMjQtUBNmDw0z2YPz5tHH0QMpT0to2a1WKhiPZCnq9BGmtkj7McxYK/mhAC8y5OlhE5jQ+PPoikh/C82WpPB1EXjjLXafixDgXOWbpF45wC9YxSOquB0Nkrnql6k5bGOhM7oUKrJugz6qUn9gEZ54oVZp/3C805kLT/Xz4R2ptMMgI8MJNmCOGUilQffn/2dXVggw2n+fTSzn070263pUwhrxHq1WPnbS4T3JK/PH0d+7dEqBLBUKNXn4ZkxWMMCHuY41rWTqLZHIzYXrXCP+pF0WRxutY8yk3v6XWu3WO/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ed7f652-bedf-c1b7-6e66-5ddac4fb224e@suse.com>
Date: Thu, 4 Aug 2022 16:53:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 07/10] IOMMU/AMD: wire common device reserved memory
 API
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <68b7a172fcdad2495fb928e47f33ebe5bafcf953.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <68b7a172fcdad2495fb928e47f33ebe5bafcf953.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b483cc23-1db8-4aa8-eb5e-08da76291bba
X-MS-TrafficTypeDiagnostic: DB8PR04MB6361:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u0fiLxH97pMlkLHp4kZ+Bok02uANk/U6BiT6QqBVAa7rRnFwro6chxb8zNq/L2CQJWb3l+0EBi3LAJ8Je13JJMGiY3LvpKa+QJ16tjIjaEFAoKbUG5MmhU4//Ff2zfGwt6Qg/J9l8gsm2cmCPlK4YzsVwbSHmnYt+/mophhmv9pYWtGG3R2lZlADYeYL6RwoPtom3L01uDsoTq8H/DNKsucY5YctJsemSO0j6NFArRybxBoq+fShAWq6ykrq6BVQgqqHbK2rQ+v3DnH8+s1c6rGYGK5WhFcN1tDELbAb9OGcHD9HCh/8PHBz+URijfeuChZfAWCm/5XwRxrd1MML9swTwnv6/eMZyHXHQOO+p1Pr1Kqg1hhgQCM0txUF1U4T+nyhasEioH+0oEAOaDlrq90rx0Pk1ixWSnohaXolPbd2gkP5Bu67qwCujNTzlB6b64byFkTjvZJ5qtMZPRAWt0qBzjczSINz/DnOmHORdcqzJx028QbxiGVhkgsRpPSNnm5VSqcbQ8Gxn+CCnevgRCyj1HfKRUxxTOSgttKvdnwfIXveL5h04qE3BqIrBDYGmWlHViZ7fUL+auJuf+UHL7lCWjOkHhAzrwJPXURCm+ZWRf601ELP1FtCorf8juwoB5m81mwU1KumveHjCWql/PmB+luoqwUEz6pbO77vdHKh+RFjRtWQbmUavKbPavXuYxzAFglFMoW19W0SFhhRQ52y7wBGaq5o2Y3jiWKJp/yoYTEFh8W6ms3WyEkLMO/B62SkceYCkI49TE31Ft4SVQ1VKgzQ+w8NlkBgU85LtsLjh50o6lQ46mPKEL8RMHFBzK6O16Y/zXJiAoXBEfZxvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(366004)(346002)(376002)(6506007)(66946007)(66556008)(66476007)(8676002)(478600001)(6486002)(31696002)(31686004)(4326008)(36756003)(558084003)(86362001)(2616005)(186003)(2906002)(5660300002)(38100700002)(8936002)(6916009)(6512007)(6666004)(26005)(316002)(41300700001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0tjL1pPa1k2S1JZeUNxQUJNZXNDVURkdVZSQmVDVUFER2hadWE2djlyQk5Z?=
 =?utf-8?B?OW9NWXAyZ2dEc1FKMzZlQlRnVk5zMmR5K09tSUlzQjRNK3BwQ2kvNFJmZE9C?=
 =?utf-8?B?OG5LT3ZlYzYwSUhiWml0RFQ0enBreFBhUDlSOHZBY1I3b29heCtISXV5U01F?=
 =?utf-8?B?YjhxbmZ6dnlKQ202UklzTmhKaWgwd2tVR2VCQTh3SlZVdGRBT0pHYm9GR1J0?=
 =?utf-8?B?Nk85L3FhbFp6bHphN253ZGpoSU5aaFg1RC9XdGgrcFI1UU9rUmRQMkFqYzNj?=
 =?utf-8?B?M0Iyd2JxdExPN21QbVo0MGxsVXp3Njd0ZDVCVEcvVkl3NHBNdnlXTER2Rkla?=
 =?utf-8?B?dmN5ZmkwRERlUkh6bk9WN0xYTGcwL292NEhidnNSdGx5UmtwTFJGbG8xdE1E?=
 =?utf-8?B?cjg2dzl0bnZaY1k3VDhHWWJWZy9kMnYvNDlSMWJDWTNuVktnYjZVMnkzTlJU?=
 =?utf-8?B?VUxOMHRSUzRzYllVNy9DU2lUWmJoTjgrN21HQS90VVl3Y0dxOHZ1eHQ0SG9x?=
 =?utf-8?B?MWRKZW5xQkNYUUZpcnYvZGdVVGJzWlM5ZWxnVGFFb29DQ3ZTRElHTlowaE1z?=
 =?utf-8?B?aXFMaE4wWjdGd2ZTSStHQ2xUQ3NFOE5NM2IrU2xkZ0ozVWJqSlRnbkc2TklU?=
 =?utf-8?B?RzZ1NHVqdW55K29uRFhtM2V3enBsNzdNK2Q1U1Y0WDg1VWZSOEJnc0w5UkI5?=
 =?utf-8?B?TUc0ZzRtWDRoODhMRGt1ZUUvbHpJbTIrcGE1RGF5dVBGYU8zWDZwRVhQNWJ3?=
 =?utf-8?B?dmZMcmx0WWFKY0R1Q29KTXd6bVp0MlQwR0pjMUVzN1FEajF0elRzZTJEbkRx?=
 =?utf-8?B?Skprb2p1eHB4UGlwakJ2TUlmQTVkZW9OYUdJK0FqNzZ6NVZPMVpVWUtTMWlM?=
 =?utf-8?B?TDJlRjQyRlI2aStOK0ZnMDFBbGdCS2ZadHg5ckpPbm9xMDdVRXZ5ZzNFdElt?=
 =?utf-8?B?RzFhZjdMaWNoWG4vMVhKWWNVTm9VVnplaFBBN05DckJoT1IyTW84QS91ME1R?=
 =?utf-8?B?YkFIM1Y2WlFNb2xlTGFzSGZMUFd2Vm1peWxzbUdRb1JoWWJabW1XYzZCVmlZ?=
 =?utf-8?B?TjdyWlVCZ3E0RUtQdGNNbjZFREFFOXM0NUd6T2dVYUNsdVlubjRuSTZkMnVT?=
 =?utf-8?B?OXlsaUNuNzNPVWFKWXV2QzJOYnZ1S0VRcTFPSG9XVlQ2S2ZJSVgzT0pnT0hW?=
 =?utf-8?B?WmIvbmxuQ1pRU3BRUzIvKzNWeWgwSHJ2Wm9xa0d1RmI2dUlHZGJkdyszR1dP?=
 =?utf-8?B?QUt4bmtTLy9qMFUzZWJuTzE4Q283L1lhL2w3Mk9aZHpad2U1S1RLV0Z6aFpo?=
 =?utf-8?B?YXVOM2VtSG9xQXN2NC9iWWN0RXhJTjB4YmNZbk1IaERQSjZ4bFBFOTMwbEhi?=
 =?utf-8?B?TWRDVHNXQzQydjhMRFFyNmlVV1ZHa1pnWHJHWnNESmJhU1dhWDV6QTJxRk15?=
 =?utf-8?B?NjFGY2FlTE5lYTlNTEFMaFl6OHpCRHVLOGlGbHFrdkZab0prYXZ1QmFYM3JL?=
 =?utf-8?B?WFZoUWl0OVVyL0J0cnZWMHh0dkxVUjJETkJqbXJEMk5ZNGJ2bklxdE9aaDNK?=
 =?utf-8?B?eDJRS3NkNmRaOGtobjJxSXFTa3A1VFY3S0YvSmhZTmh3azBOU2FkYlF5MXha?=
 =?utf-8?B?a05xTWc3L0VKYVhCbGpNK3ZUVThMWHhIdTVJREthMm5ZTEFQdHkzTFhubjd5?=
 =?utf-8?B?bGpXVkM3bk5jUjRRZEh5TENSS1ZJWUUzRFhmQjdTQ2VlQ2RTbnZ4ZGt3VDh0?=
 =?utf-8?B?T2x2ZlNZdDRqbDlwNUdmSjA5aUJmR1M1NVNMWW4wRlhoV3lMUGUxaG1icDYr?=
 =?utf-8?B?bTJUdHN5VllIVXdxVk50N3NoMSs2a1gwSXcyeHlUWnFYYUw5SDc5YTR6RUZU?=
 =?utf-8?B?Q2lEL2VSVTVwaXdWWWNUN2U0ZGgyUm1GRlBhZ0hhYjVTWjJhVisySkpPMUJ6?=
 =?utf-8?B?U2RydDkvaXo4d3M5dXdNQjFiS1ladkFpMEk5cVJvMkt0K0pEVi9RMys0RVF0?=
 =?utf-8?B?UXlSMC9lMjErSzlwNFI1TENYUDFpaWxHSk5iS2w5VWNPZG1CTXd6UjdoVGFH?=
 =?utf-8?B?Mk90ZVlIeWl2ajdRc3JJOW5WZUZ6d1U4VDlCS09zdGdQTTNGQlNBN2xkUjlJ?=
 =?utf-8?Q?2NYO3uP1V2rlSuzpa1fUGWudz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b483cc23-1db8-4aa8-eb5e-08da76291bba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:53:36.0130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9R3Z+A3yKINgQ2xAAyVg0zqjV3kqJyJhLqqthj00KiSJufgix0J31dboARZwNKJpzeZ99UiNJPv6IjqQ9muwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6361

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> Register common device reserved memory similar to how ivmd= parameter is
> handled.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


