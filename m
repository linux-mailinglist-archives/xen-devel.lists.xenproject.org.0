Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65216428ADD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 12:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205715.361094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsh0-00071O-Hk; Mon, 11 Oct 2021 10:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205715.361094; Mon, 11 Oct 2021 10:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsh0-0006yB-E5; Mon, 11 Oct 2021 10:38:02 +0000
Received: by outflank-mailman (input) for mailman id 205715;
 Mon, 11 Oct 2021 10:38:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZsgz-0006y5-3O
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:38:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 564934b7-7671-4c4e-b8fa-115140013972;
 Mon, 11 Oct 2021 10:38:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-esNhiVesP8i1qOe4r_RVjA-1; Mon, 11 Oct 2021 12:37:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 11 Oct
 2021 10:37:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 10:37:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.5 via Frontend Transport; Mon, 11 Oct 2021 10:37:56 +0000
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
X-Inumbo-ID: 564934b7-7671-4c4e-b8fa-115140013972
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633948679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRU5NP45ghwB2g9kg5C3+SBfvLmDbJnrJva+gkxj/q8=;
	b=ehxubGsyGluo6Kx3r/tsvyFULMUlowQA1JIEkKdlYAS8uo70Tv39VyR0sJvWX1jvkeQL/P
	DUDD2CpJV+LqOXsmZ9BeVzChi5WzqHb6sU+rRVV3yikYbBIpVDLY/ZucX2XFbPWkA70MZT
	M8ob3xtDGLIsb5Sv7bHawM0frnbfz9c=
X-MC-Unique: esNhiVesP8i1qOe4r_RVjA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XegyAf1TPmLorPL7EMVKgJCBLCp9kPmLOENGi9nYBjSpWrwyqoYtB9VeJEny1oOpG2xqVPGKYl6HmICXJxzRisv+uQlQhyo9KjpzEKqnBu5eWjv4jsSVEsKMZzeMz/QXH1E2mdC4UZxA24rYGhEcuyhQ/kO9dkG7LsymtGjgK10+K2RWE1ph6v8Hs0M/DlhZv6VhGKyfYrermCgAtBbbX7LasemhcQ1Ndz0mRp8UwyPEb8L7vINe5iapzvkKw63g7LTRLTgS6SRbzdeqWrrZeycexWSkhukhumhJT5FNfrPN8etJBi3PiH4c52cCmJbHiFmY7Zdq9ve/sp0pzzZBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRU5NP45ghwB2g9kg5C3+SBfvLmDbJnrJva+gkxj/q8=;
 b=TNwXmVhdLgFw8rMVWNjYYyIQaMmp9Igmo/31lSPeZLN77VLt/qRDzj3ou5cTVqhMkP30OvprC2kLOsWPaJjtovnidf3y5ME6vC4SM5+O+ZGWdcFzcrltNPzErAZuM02PD39lNOHWh8GVl5XqudciGYBZONRO78oNtT7wJQrtoqgtPd3gQfAn0vS1arCZkRgh2JsPc5hYZd4g5VEzCMA/UCF/yAcSrCkcQ46vL3Km9bbYxESkdHYpcyP8B7cc/GP6STL+HT7FZY4CJ1gMxj/TgtBpJwl5sjVwdLCgFkd/dWDcBxthVFWXGwnxhwXDgxzRKaqdLlNdgb9ZFFAvlaVCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 18/51] build: fix $(TARGET).efi creation in
 arch/arm
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-19-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34b274ae-fb02-10df-85ed-8d5231d49750@suse.com>
Date: Mon, 11 Oct 2021 12:37:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-19-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c006da8-6f19-4612-d41a-08d98ca33041
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3533F8243C1C029CD8689ECDB3B59@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+2wom/8iKYR3BdajQ95TwVjDA0pKvxZ3S8slR5Hq4ZSGoZ6KbIf/TO/D9AKdQe75FUVBauaolRLt4y89QB3vZN35tIXAKhnv/VDtQSht52YNSsW63rp1DoW6Q8iLGOM8XskdJMz+ongk2G0HofkwZCf8l5zk2UKMfHoeZtxxkMwE8ZAQMoldHqiu86yAoME3AcA/A6MNw11Gz9CIe0PmxNLq+KF5U1Gc8T/f5arGeE9dxoKDLFs/iirmPt5U2nOeMww9pZkW6QWRtXHlo0j6cd79/pfP4gZ986URt9PemlhXiEze/lbx75TNlgDYS9aNmWSmK3NLJu/Vi6fns9y+x0MIPYivz7MlQ03MJmFiUEH0qbxIASSBnu4fxEwZXgTS7kl8cNW3h2Bu619M7t4qXZebIyhRAGBMOXbkRuRAg9MLaMwW5HUIq/czNrzeLuTKvITARWd3tDBXWRcCl6V80OX2vRfAguVdlitKERGqmlcxJQQ4dI/VXknNBBAsA85fNTUoMag8FazZYGsvgERlgABL12e0+WOrz5tHIlCBdycBTN544cS8HPKUDN3zeMwtu2gTs93zTZ02UC0+S4/v2DJ3z5wcs+6ILUY2aqH5BdNux5+YTp4T+cQRlI9y+/zbvSfek17ex9s22RjrLo1zoyOI7u9X0EF246napSrRG28lEklNa6G/zI11NJa4lDs8grYRpfJ4iu91UMggv1AJkNYsLCIhFTruxG9wQHjqBg0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(2906002)(31686004)(53546011)(38100700002)(26005)(186003)(6486002)(54906003)(316002)(16576012)(4744005)(66556008)(86362001)(66476007)(66946007)(956004)(5660300002)(508600001)(36756003)(2616005)(31696002)(8936002)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZThEaG5XTS9xaUNQTkFoenJFb3JIMmRIaDlNU1ROeXB6S1pUcVc4eGtmN0Jm?=
 =?utf-8?B?K0FYbkp4Sk5ySEhiS1dSZ2lYS1k5RHorOU5FNlo0SFl2NG0vVHk2ODNDS2xP?=
 =?utf-8?B?cWlZU2d5MTBKV3oybzNCWENGbTJxZ2l2azFqKzY1NEtjVXNEaERQamI0bXNr?=
 =?utf-8?B?V3VaTWZaU21ybGdFSlFPNVhqL2dVdHczQkQxd3k0bkFlQnpDNi8rdG9rZUtw?=
 =?utf-8?B?QUUwVHZFaUJFR05nemVWc05Dc1M5M2Vkc0JEQmdiN21kRGg4Z21URXphaTNJ?=
 =?utf-8?B?UnFQR08wdVhocGZNRTJyYTVraXVxWDRiVkhrQU9sNWFuSHJsVmVncDhRNi96?=
 =?utf-8?B?Q21HeVdxbnBsaFQ0em0yaVhwcDdRdXd1MXJ0Sis2UHNYNzgyazZzVy9NbFJO?=
 =?utf-8?B?ZG81aHRjalJvMUp5NU41SEhRRFpWQUlrRnR4eUlnQzk0TVFKZkNwQjAwbUhh?=
 =?utf-8?B?aUl4N0RwaEtxb1BVSnRtenVyVTlxeHFOYWJDWHJ6WnJFNHhoSkhVMnNXQTJE?=
 =?utf-8?B?bm03aER1ME0xNWdNTDdoN1BNREZnQk4xTVd6Ykk2WisreWxJYkRWUGk5cEZx?=
 =?utf-8?B?ZklhMmhjdkVTT2VtNEpTQWJmMmtDV0toaVR0YzN1QVIzNW4zMWNFSkJia1ZM?=
 =?utf-8?B?US9UdjRZeHlNaDNyM1Z3V21ibnhlK3IxTFFrTUtGQ2s5RnpUL0JFOWRvUHNY?=
 =?utf-8?B?Wlc2RTRwOElHcDZLZURaUDg2Y3dVeUxpN2RGa0czM25kVHNoODhPa3JhWkFR?=
 =?utf-8?B?NmZuYlB0Q3kvZEN3dGpoTUhnOE5jT2xLbHlabUE1ZmRpTzh1TGNNTzlQU1lE?=
 =?utf-8?B?M1NrM1YxNWNMeXpOZ2ZDclFRMUFrSDRzREZ0c1IwWHlEN2NnbVBVZXBPSnZm?=
 =?utf-8?B?alBVeThjSS9oeG9Yb1hiVnpKMng1Y0E4QkVSK2Jic1d2TUkyQlF1Y2NKamdD?=
 =?utf-8?B?STFiSnNtczVScml1M0E1aElvQngyYnh3aUIyRWZYUmlhMlhsSXZVcUhEV2hH?=
 =?utf-8?B?dXVHZmZTRGhxeHQ3dEFDZHY0Z2QyMEZRZXViazhaZk8reXRuR1JTQ3J3S3Ry?=
 =?utf-8?B?SEJkVHNGU05GbVJXbjRFcjl5cFk2ZjlLK0xWeEljbnV4SUpyaitPVkRkL1Zu?=
 =?utf-8?B?b1I4b095SXB3VUFLWDNXSmd2SDkyZGV5dngycGU2eW5BZjdMQ0l0N21OTU05?=
 =?utf-8?B?VndkOU1XTEl3NDZTNUx4WVU2d1VZMG82RnVzdFA3dHljSWo3K001Q01EZ2FQ?=
 =?utf-8?B?cHRvYUxmNnhLWVZkcFpkU2tsbXVzYWxuU2FpeWJxRGVWdzJ3dUVtNWxRc2g2?=
 =?utf-8?B?NWpOdCszNjdFWFZSdzB3N3JXNm9SeEg3U1FTK3krVnl2eW1xNTlzK1o5SHc1?=
 =?utf-8?B?K0UzL0txeE54UEJCVUp5d2tjZ2VRK2FEMWltT3JjMEh0ZmpwbHZDTmowZjFa?=
 =?utf-8?B?OWZSMDdUcWQ1NitzWUhVRVFrOEthS1oxdmhpVW84c25XL0hYUlN2R0VpTGRi?=
 =?utf-8?B?aERVdldEek5yanlmakJHdWpSSmtSTzlWVnJFU1l3bGt3bWh2UTVwbENOdzdY?=
 =?utf-8?B?Wk1SR2lSN0NuUzBxLzlic3ltV21WRUI5VVJtNE5TNWZPby8vbHEvMHZuNTgw?=
 =?utf-8?B?Wk12NWRtODZjRGkyZjFUOURmdi9RRUZZaDJBbDlSMUx0OStiZHRhQS9hZEZJ?=
 =?utf-8?B?eU1wM2NZRVRnWElFSXgyN2I3RDRXUnJUQVlQNkRBYjlxR1M4NXIwcW13UFNy?=
 =?utf-8?Q?znU0ZlK67MrKEFXJ7+xRbnvfPZrFDqq0vcJJYZV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c006da8-6f19-4612-d41a-08d98ca33041
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 10:37:56.8683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86hCQMkWZpUtAC/xNt1N4yz09JziqaTCRJ+XDGW0zHpxexOZX4DV0ZVvE3JgSi9XkF+iYpdhfEeWMvK0+Mt/qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

On 24.08.2021 12:50, Anthony PERARD wrote:
> There is no need to try to guess a relative path to the "xen.efi" file,
> we can simply use $@. Also, there's no need to use `notdir`, make
> already do that work via $(@F).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

As to the subject, I don't think "fix" is appropriate. How about "adjust"
or "simplify" or some such?

Jan


