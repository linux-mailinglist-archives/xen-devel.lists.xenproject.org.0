Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9433B72A4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 14:54:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148028.273373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyDEs-0001dM-5I; Tue, 29 Jun 2021 12:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148028.273373; Tue, 29 Jun 2021 12:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyDEs-0001ac-26; Tue, 29 Jun 2021 12:53:18 +0000
Received: by outflank-mailman (input) for mailman id 148028;
 Tue, 29 Jun 2021 12:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lyDEq-0001aW-3t
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 12:53:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3c1c072-a12b-47bc-9065-53c7a815e0ad;
 Tue, 29 Jun 2021 12:53:15 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-sJhavAyaPuyF0q4E5pCF5A-1; Tue, 29 Jun 2021 14:53:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 12:53:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 12:53:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0019.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 12:53:06 +0000
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
X-Inumbo-ID: a3c1c072-a12b-47bc-9065-53c7a815e0ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624971194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cxpZ3l0gqQ68qpFOsfCAiYiKficY6f+LCgmpcbadpUY=;
	b=buAo52fPH8Qr/kr1aSH5axdM9bsj22iUPrWyxrL7pbCjkCUlJlB6dkPX0pU4f5n5rcBr3F
	ukoGfyOQJncFNwkmNVLt6+GD7SZM3IlJvql7z8VuEovnapndk5IMtuWI4e5C9H3NenoTf2
	9oPYkAW6FiFazQmYejqb+Ve47wci7WM=
X-MC-Unique: sJhavAyaPuyF0q4E5pCF5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLh3ebardeqOfgoKxHj+Gy3mDZvM939PyuwcxPN9xAwXSEdafEYlUkcEC0GELttAX51Shjazy++n5pujc0Lyw3GbhLvXRtQ+pL9DqmK12HSr6UyfdVbSzWyoUIbZg47jHdOURqX88monU13DqL737JHufKUMuc6eVL4zvvrW4ZSdG01YBENddddaEGZFkY1dXeCXlRiL8OhJ/+heo8IkGcocuUxIAgBPKbb/Qz7MnPk9HIHugHIn2Zc1gy2M+SWJERNcnkQ0tPtCgDfSS+8rU3Gk1re7cJijw8pReGMNjr9fbGXRPwxBBM6++exappTeHRrZswBETHChm/pKTg6grQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxpZ3l0gqQ68qpFOsfCAiYiKficY6f+LCgmpcbadpUY=;
 b=RYiq3jSAmDt6NzqVfQR7ST+EnO0RawQyTwQKRGIOjWPwDikyvr+qO9UQOc7Knb4nHl9SQdV7MwmpVZq3KmPTB/ITb0DXk6H2k4KPF1v8aqy0/mt9gSG3TTOpLwG5FNkdJvAKGXo4Qm44KKEau61xUkEgOxhCy9vhgxmLFjVGAOajZ8l8AWsTrNsNgEyhf8jxj1/dB06p/+t8B5XMibPQlA5kXda2SV33l0Dr5KQLkePsElz6DEtEqYrExxT3/pc6mBGvTeHncxXVOdF7XBP1XcLlYdTlgWfyvK5XtzvDTKQd7Ex4hlbzG3zn4wlWNgqx+X9egSNhYnM1oa0FNiYqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/mem-sharing: a fix and some cleanup
Message-ID: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com>
Date: Tue, 29 Jun 2021 14:53:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P193CA0019.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 999aba0d-12cc-48bf-f209-08d93afcd76a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3390AC050851DA0559084CC6B3029@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	80FAWAJT/7WwGsOJ6bAAy2D2cWOVHcjb9nzAfmBw07lE0Nj7uHY0inqCqGJXBQbGEOvZR1l6+E6evyDgC1SD1FbUd9xsfwxJEc8OmxVMLUy96u5vPpU/pYbs7CXLLhez4nLxeqXRXv0gBXkm033pC0fiAWTu0cmoIEBi2GbjM2ZwLWFEVL0bZZ4y1gyW/ATh1JyfROo36C9guuF6NM4NXqUSFbuDMf/kKyXsjch3DtaGqIk/fhsjyFmi2kMLOCWQZ/7m/Zxv2tqIBaELGysPGmNS5MYbz6VRKgtWpUr+KioUnQbQeHozYxvIqU9ZqkN/Nfkm3Pgl0YvK/kloND+0wTpMGI49/v7Z5W/LdNJJZ4qhwejQQil1Nb5M1A3YKJJkHAj1AlZnyhmfTQgTb/wCxPnGt8ME+2CTExRB1GNG5J1IdVDMQiIQhT2mv2VpDywf98EtItcQ6YWTUq0i4JEo1L5U7I76c5u2f96CJorlGL8XBf1Yu9g6qvOZFnJB5XlRUGmH314Ce+Y4xHXn81gsfeM8qHM7Khqw2m+xaYcb3nt8nqbtkfAMPKbB8oZRalPzjrDPpS2XmTR//FeNx+jeQty2bsVuPb3IpzaEymALXOTquL1xX6yTr7gt5r8YukS45OyZcjhvrZUygsLlGTeJHLC+U0/KbJQEM3AegzlhggGUgFu2qTkL+P8qv9TNDQmNG5/54Y5GYoAQXkbkdyrHHcaXtDIAl80x9Gl0Xd/OXic=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(366004)(396003)(39850400004)(6486002)(16576012)(6916009)(4326008)(66946007)(31686004)(66556008)(66476007)(478600001)(956004)(316002)(5660300002)(86362001)(31696002)(8676002)(16526019)(83380400001)(558084003)(186003)(2906002)(2616005)(54906003)(8936002)(26005)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTg1d2ZpeExqOTlUcHZUSDdhaXkxRHB5K0VqbGZsMXJXbGNHeCt0ZHVvNHJU?=
 =?utf-8?B?WmNYM2dNQzRGR08rR0YzcTFGMHpPRlErdG1EbjdBc29MSEdXdzl1OEpwb3RC?=
 =?utf-8?B?R0FMZkFzY3cyK2RKZDFFUDRLM0pCZG5jbXNKeWl6NW1vZ3lkN0g5Qm5WVnc2?=
 =?utf-8?B?MGxEYmRoZHlzRkExTXg4WDIzVFc4aVFYcEVnRE54cXM3ODNBNmFFbmNvL2ZY?=
 =?utf-8?B?djUrSm9oanR2Z2lCL0lMT2c4bWEyRjRkMnc5YjdoSUxrK1Nzdng1QXJnQStq?=
 =?utf-8?B?V1RmaVlHRGlZOXFpa2ZXbEU4Wi8yRnZzeXgrZEhPQXdpQ1RZTGVZTHV2cE1W?=
 =?utf-8?B?Y2lNdngwQkpsV0Q4bDl4ZnZsdHVsVkcwNkNuZUhuOTlqaGJjOUR6MlhqdUxm?=
 =?utf-8?B?MTVaUWoxa281MEZ6T3lPQXBaUDRqZGliQlpiZDlqcXBkWCsrbHhLQ1BjbUZM?=
 =?utf-8?B?MFluVTVMUW9Tb1dsQnAybmRNbVJSZ3llRWdmaWZqQ0pYR2srb1kxLzUwVzdT?=
 =?utf-8?B?eTI0eUtRaXhwWUo5Yjl2RGtSbzBoRXdLcE1DZ3k3RS9xSjlFNmd6Q21Obm01?=
 =?utf-8?B?YnArRWRxRTZMNGVLMFlCUGd3eStUdzdqYnpsK2hvQjE0U2F4WlNXbDh4aGRi?=
 =?utf-8?B?RG4zYkI5ZXBCSDBWeUlqVXYzMndSeTBPaG9zTnpMYk8zTVdUKy9lbm9pTFZu?=
 =?utf-8?B?UE5DMUcwNUN6Z0UxWHNEODRwSW5OZmVGd1N5UTdrTTBhS0prVjVqY0llb1dG?=
 =?utf-8?B?R0VsblB2K0NtK3VtYXFzUCtZaU1MZHNUTXUybTN3S2xWaHBtVnJUN3hCNnQ3?=
 =?utf-8?B?Ti95bGpZN2tHakxHN2lyR0FFQjR5dHhlMlA2SnhxQnhSN0FiaGcrazlPR1ZS?=
 =?utf-8?B?cGRqOHlNVk1rSVlUS2kwYkZIUU52SnArTTQ0aGxORG1aSThScG1jSk9PTk1B?=
 =?utf-8?B?RW94NXVCT0VHcXlPbVVCR0NjUW5raGNPWnE2SFBLMTAzK0xxY1Bwd1pjdnFF?=
 =?utf-8?B?N2s4VGZDTHhoSlRMbEREVjZmaEEwWCsyNHRtOHIzZ0hTaFc0MXFnV2tyTXhl?=
 =?utf-8?B?a1RQNExPMUg2cTlhU3ZWYmpYU2FJMmY5UG5EbS9sblUyZXFWMzJrUDAwTTdt?=
 =?utf-8?B?Zi83ZFFVUFA1Vi8vQWlTRHAwUVVZVjlwNHlINXhzbTlkSEtGYnI4Tnd0aG90?=
 =?utf-8?B?NjM0YkNhWDN3VmU3ZTVJbkYybVl1TTF6VUd0UXNvd3pzcitHdE9obEtRa3cr?=
 =?utf-8?B?ZVZZTmdhZ3h4dm83V3NQK1h0c3JWaEwxdjBza2dTOU9QTFRsODJiWTBxaVlt?=
 =?utf-8?B?bjAwVFd1U1FyZEdPVUR2NlhhaXJrWkZwaVpobXVZZXNlQ2N0UTJOVHlic2VS?=
 =?utf-8?B?NEJhYVdKOXpkeGlJM1NlM0d2ZklPTGFvbitsVHAvUmNmUGV6NFpGRWxqOWFN?=
 =?utf-8?B?U0RnZG1CdXdnelhESmRxMURtTzVDN0ljNTR5SFg3UEl1MlhmUEl0SUFCR09V?=
 =?utf-8?B?czF5bDY1TW5ZWDZRWEh0Sm1zUmFnWjB0QlNYU25zUm54Z1dQZzhEaDlMSitZ?=
 =?utf-8?B?WVlxUXFGM1VDR2NXUVUvWTl6OFVBaURlbGQ4L0ovTHFPT3dsRlYyTTYyMmRE?=
 =?utf-8?B?MWVMMnFUWG9Bbmlmb0huVjhZUVB6TkNyVmFTcU5ZWkxWTmErR3IzVU85V2FC?=
 =?utf-8?B?a3hNTTdBYXdIaFlBazViVk4vMklsU0ZyRjk1VXA5RHBQNHNSUnQvVHFhVWJV?=
 =?utf-8?Q?uOhoaNi6h2bw8VhIofgqQFyRqOuPlTshKLHwyBL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999aba0d-12cc-48bf-f209-08d93afcd76a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 12:53:07.1544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6X8ikSYLIQC9vWDB3X/YHZWGrFqOHQe4Tc5cBXk9UQZT1hTaRXfKRHT2OkiwITizIN42a580eyjKs1Z6fzw+sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

1: guarantee consistent lock order in get_two_gfns()
2: mov {get,put}_two_gfns()

Jan


