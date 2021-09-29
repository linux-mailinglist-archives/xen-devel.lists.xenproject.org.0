Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C5D41C1CE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198950.352709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVW4w-0002nA-Ja; Wed, 29 Sep 2021 09:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198950.352709; Wed, 29 Sep 2021 09:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVW4w-0002kj-FU; Wed, 29 Sep 2021 09:40:42 +0000
Received: by outflank-mailman (input) for mailman id 198950;
 Wed, 29 Sep 2021 09:40:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVW4v-0002kd-DA
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:40:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ed13f0b-ce7d-44dd-9d0a-b6f766762e18;
 Wed, 29 Sep 2021 09:40:40 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-OOKK9Rb4MO-cYcBH1pjSJQ-1;
 Wed, 29 Sep 2021 11:40:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 09:40:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 09:40:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0012.eurprd03.prod.outlook.com (2603:10a6:206:14::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 09:40:36 +0000
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
X-Inumbo-ID: 1ed13f0b-ce7d-44dd-9d0a-b6f766762e18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632908439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yjRuo993pVi6TU0drSbNhT2mOgdyCXG9oveYnvgv3tc=;
	b=SZvFLkybAtlwTPJX9/ZiZtefiFGpnnwcrpjyuY/Gfv7Lj7L2LSl7am2OwZHTAUIUKTDcOj
	ID9qT0+tOHaeXy3SVe1Moagr53znEU6G8lf3fFReI+o2lm1uYTaJanhZhObCDhE1mCV0CW
	Ef2WKou1RJCD+AiB/Nc39yw+aeDtRtU=
X-MC-Unique: OOKK9Rb4MO-cYcBH1pjSJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiMmfDRk+Fc+KyxSlAfp4LVDeqY8ip6ttkO5+4MKMmrBtdOhTo9CQ0rBX5oyy+W049cS92xVj1z9uz70Hz9KleXi8l6ZmoAGhK2GJoqiwO/nlHQ9o37HUPo2O2E10fTu18lE2R3qT9M3AISg18WVz8z7OufUpbIvQajv9HM0rdxMo4MDyC8LY7ryZWbj1lsal0TDXOBjNYxT5w3aYvhndgqh3ucGpkOd+KbYbMH+rrEEoN05rcKVpmOO55os3FiJBxzfocN7jq/u/JFsWi6teS2ai53kWJVGG1zGKEHe4DjI3L5DEX4ypWJbAmsbyZB205SlXOVWZO1+JLp4DmUFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=yjRuo993pVi6TU0drSbNhT2mOgdyCXG9oveYnvgv3tc=;
 b=ah4rnQjB899Lg1CmKKzriCSGlPLFAYvLOMAQFhP5qQwn5mKn/gYFGC+I9XG3AM69FIQitBFDoIV6zsLkLrHo2FgXtgIhWaLicjx8gIvXWqhMH3AN9NZK49mBNnD1oKjf3eQtQNXqT0dvJcI2I0wFA+TwpkHy04hylOywiTfwRyKIHP4QtJfja+5xs6fkukhVgEr9My3RCBNajcxhLlmkqGpbuYObAidJV6XyM96ZTLUdf4bUctqMr5PLrkG7qf+glklTLlB4vyOlHW+qdVwUxRHI4biNIfzePqM7/tnAmTkIMbNvcEmCTFinsnM2JqLITaFwQxO2Aq3Q3Vuvhx4yBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86/PV: '0' debug key stack dumping adjustments
Message-ID: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
Date: Wed, 29 Sep 2021 11:40:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0012.eurprd03.prod.outlook.com
 (2603:10a6:206:14::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a8f3b91-8dad-4437-a197-08d9832d3109
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31200503FC525AE521FA1A4FB3A99@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yPYyGHNCISvv7GWOhztpIYdtEwouOPyJsOyU4ftN/6i+pfu4kt/8Lz/2wjWu02luvOHx189u8ans1YwsIYtiWpAbN2rUPc8oGwAcpz/5rHtu2VfkQpiiEWhKsoTTkrjxNPB74JchGzT/Xvp+1e5z14OiDWiai2rZCY9wgxhxyVMqnVSq95VxMuaN+pzbX8duUch9A/9rg5g4Swi9dOCS+g7lVsWzu2ycPDtH3Q7KxZB8po9bGAh2j61ZgQ9H7pKGkH6yY3jHobGlfx4dFchmcfsDCilLn1EiwEfJzrrTgtiwWaA+hmYqy8ec/x4l6GTG2Ph9BbVGqWqOjRBS7ANhuhYedNb/sMfelfy5DdG/PgmSkpo2IA3NArrUcf4CZ0edY1yqhOqQGZbPoO3QvRTt89q+b9urOsIayCuDSO7ZHHtmU7KIrWJcp1S0n0pDNp7lXlnFwU7vJ87sCJKii3ZNzUTt+DTD5liAH8Rwo2FFHu2DObUq4fbkK42KPDUGOXdzVXPEUrCyfVvkuFV16/y905au4eOfk3gamIQrQ+YPO29CsOeUmCVEHygiMOcO4GcomPwk7RTV7GliQsKn77gC3bK3uH2Q5zngTqDDaXEAKpqnADN3n01Uz3VzEzCB39wmCfooV63LuXT4mRQox1um8TCfioxZ1Ef3iJCtd3X/REaiQb2aiTwP36upmOKqML8MtRVGDXIO1da8mL/xUe4FY6OtDT8+VjdtaCjE6n55KVe8LsbzhaRzxNoGYQsdeNYi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(38100700002)(5660300002)(8676002)(26005)(8936002)(186003)(316002)(31686004)(508600001)(6916009)(54906003)(66946007)(66556008)(16576012)(4744005)(2616005)(956004)(36756003)(66476007)(86362001)(2906002)(31696002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFVSSlV6M1IvcEIvTW5wOVRZSUhBeDVxeUVuTDJCYTk2MldHT1I4TG1FVmkv?=
 =?utf-8?B?TnNpWEZNeElPSENMY1FWdlYwaFZmUC9TbEorZGpyUlVqanlRVEdGSXYxT1py?=
 =?utf-8?B?MHA0bGd4NlNMUjRqN3lkL2diOENVVDRaME1KaWxDeVNFRUxrVEVDQjdIdnNy?=
 =?utf-8?B?RTd2RVRDa0xOekMzdzJ2ai9GL201NjA4b1A4NzRoenhqTXZiV20wTWlWQ2Rq?=
 =?utf-8?B?S0Q4UFJ0SElYVzFnZ240Yk1XRXFtNm80MWNCbEpyTzNSY0FJc1k4ZTJLdjUx?=
 =?utf-8?B?NytPYnR4cnBBckx5YW82ZkoyR25sMnREZGczdmtqWnRuQmwzZjFVY2tsS2U1?=
 =?utf-8?B?azc5WU1RZHVqT1loamFiMThBY005d29yMm5sZnBDcnFzd3FFVjBEUjZBU0R6?=
 =?utf-8?B?UEVMbWRqOWtLOW1kOTgwTGhLRjhGTmp2ZjlDK1JiWTlKR2Y5YWo3N1hQcGZ5?=
 =?utf-8?B?c1FPNVNrQVhnc25jZkh6SXh5Zi82b3VGUjJta00vMFhTRUZQOVV1UzM2UEM1?=
 =?utf-8?B?eHAxdGVzNE10Z0xaUld6MXh4U01xejdOeTU0ZUhRV1V5L3JwczJaemFXMm1w?=
 =?utf-8?B?Y2tVRWVId1JSczZxc1VuS25Hc3M1WW11M0dVUmxNemhmdW1Mc24yM0tidmc0?=
 =?utf-8?B?bU5DU2twUCtJaEFrWEc5M2VGVVVSMEdMMXR2MGZZVXBrK1FPMVZJYUZzU1pl?=
 =?utf-8?B?WThDRDVqdWhhOXhsZ3FSbWUweFU2ZER6YUxYRUZXN3dJVmdBRGFpUFBjd0dM?=
 =?utf-8?B?bURveVpjM2Y5YnZ3VndWajdBTjJmYi8vMG5kR0NvMURzOVhQTjkwd2p6UkVr?=
 =?utf-8?B?Ykw2Q3JSb3ZzYy9oQkRGTjh3VHQ2VUhzRTR5NE9zTlV6b2JJM3U4Mm1JVHFC?=
 =?utf-8?B?L1NuTk1kQjhreFdpMDFxZU9VUlRHZG1zR1ROVnQ0b1c2c3hhdUFRUmkvYmdz?=
 =?utf-8?B?aFNIVktBNUg2SVNhV2xXb3NiTkVZRTZiSkIzV3pCVnRvRDQrd29GbTFmRlBt?=
 =?utf-8?B?V1ZXODM0K2FxTEVFN21IQUdGZndSQkpjWWVOdkNHUXlaQ2kyVnYyQlFJeGZ3?=
 =?utf-8?B?MllqL2NpU1FIdGw2Mmlram5uQW5iS0I3UFVOUmw2emhGWlBZWjgyZlphck42?=
 =?utf-8?B?NEU1SEMzejVOQTVBa1E2SHlSamIxV2s0cS9VeHl6OXBHa2pEbkxQL08zQm1D?=
 =?utf-8?B?MzJnSjNLck9wdHhRckh2ZFdzeVI2alZzWkUzMEx4VWxkV1BRb0pORGdGcTNX?=
 =?utf-8?B?SmRZVFZnMFpKSEVLT3JnRU9iSmNJekVPY1h1SnJIMlMzMkk1RXJmQmNoVWtI?=
 =?utf-8?B?cml4SjNhbzkra2FOeTNvOXVrQmlPaTdUMGt6dUtHNXI0WHZ1UkRlVjV4ZTdj?=
 =?utf-8?B?V056U3pXMXJIN2NGZVB1Y0VMN3ZMcU42Z1hhaS8zUDFLejl1QWJxL2Z6MGhh?=
 =?utf-8?B?NThETzMzV08zak0rNjhyclorK0xheGJIYllTVzN4V01KZE1BUjBlWWlBSXg1?=
 =?utf-8?B?RDlmaTlzZ01zV01kNzI5TE1iRHBYcTR4VzhXMDZpcFBFTElQRmprMXQ5THhY?=
 =?utf-8?B?TzZIdEQ5SVJrbzFTSlY3NzQ3cEkxNytObHNmSG5FRk1vMnNXOU92OUZYR0lh?=
 =?utf-8?B?SU5YVjA0aEtYL0xoK1pYR2lyeVY5elBMbWRpRkpldDNxV2pWaHB6WnNkcUVU?=
 =?utf-8?B?bjFVZ3o2b2swUm54WUlENDN2VWs2NU5KUVVvQ1dwcEJKY0RFdUZhMDgvc1NU?=
 =?utf-8?Q?98XfQxwS8txFB/mxGnvv8OFg/CAaUrDSK3HJZOi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8f3b91-8dad-4437-a197-08d9832d3109
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 09:40:36.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wGuTMc5q+qMlTVbVIR3gZ1G6+lK41IYu593dsYRgAY2gTZQnxnNDSNzSenu5jfsjUGX7Olkc0iFK0RfBDCG9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

Having played with '0' for PVH quite a bit lately, it just so happened
that I also tried it with PV, finding that it has been broken for quite
some time.

1: make '0' debug key dump Dom0's stacks again
2: replace assertions in '0' debug key stack dumping
3: drop "vcpu" local variable from show_guest_stack()

Jan


