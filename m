Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0803AA0C9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 18:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143465.264417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltY1V-0004S4-3H; Wed, 16 Jun 2021 16:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143465.264417; Wed, 16 Jun 2021 16:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltY1V-0004Pm-0I; Wed, 16 Jun 2021 16:04:13 +0000
Received: by outflank-mailman (input) for mailman id 143465;
 Wed, 16 Jun 2021 16:04:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltY1S-0004Pf-UR
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 16:04:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4453dd97-5b39-42fd-99ae-29fb14628536;
 Wed, 16 Jun 2021 16:04:10 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-YVSoROo_OjervzgSEg-58A-2; Wed, 16 Jun 2021 18:04:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Wed, 16 Jun
 2021 16:04:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 16:04:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0200.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Wed, 16 Jun 2021 16:04:04 +0000
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
X-Inumbo-ID: 4453dd97-5b39-42fd-99ae-29fb14628536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623859449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lo7dWu124mDXCjniLtxKg5FLgByRQJ2w3dohpW4Ret8=;
	b=d5uatcXmEd0GXlarOuwmcuHVP4vb7KOLMp+s3UXCk9Qu5ve74UDyvDm9uwkq7qF3jLqAMM
	On9bn76TipE8Xg3+svbmNehU8ngcHYehqqAJlFe/bRDH2wnfuHw3MD11K4yjIR8pQSY360
	p9s07ZI62wznBqjMHfNGhs5tbWjddxg=
X-MC-Unique: YVSoROo_OjervzgSEg-58A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpGySNvHjPKNWPuBFQWVtTCJTyfpGR8lZC+hqZq0at2dyVUoYWbBP0FHrDTpvDRTQefvzQxZ7+fu96g3jteVRCAS05CBkPyax8tmo5sEPaVa2SpTM/dDS4cEa5pDtjfT9nJDq3p51JyA8ZT6AIyHL/xaFGliblGQj+Llzt2JOT7Zy+Hm4mwRZMWC9J69FHnn/bIErhIAgYq6wRaP+v1viABy+Lq34b9APMyyMDI/szt3D7rO++srxTqd2DqnNMuw1ISs782YY7Yz91OcrXr9J81hiDSGGqCk0kk8mywY3WMihAUNmNYNv6P9FSqNFLeHuKnx4si6uGI/pZ3AtPVMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lo7dWu124mDXCjniLtxKg5FLgByRQJ2w3dohpW4Ret8=;
 b=YG2LMNID6lR7wG3sIx9ii4y/uJycwWUkdoqWcDf0pzTK9OukqiHUMh8ikN5UFLfvoI2HMz/LdXgkvdCuoMvBttcceja7snWcLfzCMj+6CQBTOAR421oE9/okZQUJLSqsm6S/b91a1pMWBYiELZt3MKIMx4cXwYJnj0uVKSOrfaDg4sHToUf0X9+XULWo/8bl5YVzwQVSnsQ3EHJFNDpb6Uf/OJ/Dhg6FTET/68T3I1IcY4O3ig7ASApWQgWV9+i/zjuoy3SkyerV9p4+xtrztAJihhSsiF/+9MDmoEpKqjU/1+2qbDlyGO65DA3cQhqQ++3wDQHkZhe4DL5cyCL8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: hypercalls with 64-bit results
Message-ID: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
Date: Wed, 16 Jun 2021 18:04:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0200.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9c6e6f2-d3fc-4a67-7f07-08d930e05dc0
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445542FB23E933425D2A296B30F9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7SJr3HhC29cU2BBXrT1R19NCJ+4uyt5YtObJtlDBE85IsJt22jlzEjCXqS7Tawo8m6A2et5MUOYJzcK68Hyi4I1rCkDYpEkwtCZDgSX/t7No2rqUHR3olXeikbMtl6zfm5NpWMFfCtBivDz+V7O6kzbKl4yUpKf1RTbqGt27ebUpBL5w18M1gP2ANGCyEkdFtOx3ClsKJrvUlB3nYJT+XGuQu/T/+4bhJnBdQbhNc0GmLgU0HyrANLcpaDaUM7uiUStFBkvoLEfr4thCbiWWAA4fdQ3JiGQ0eIHUJNBa+WPRqAhvwcc6ykJ7v+bEDu3oMcW68YmAwWln7WSqOFAugiGGvxIZ5mh78cRz+7Awh2Cxtz2qwdaNmmsJ3hBCaMMkHcX2Dj1SaNlKTTCiGLgwbMBBR8E+IQatY8l16/NiinO9K0Dpj7Did5N05JVERFuVr5gXMSXgMtjUU1Nao5Yugkj0RlKBqqXrgLlaqZpoZUbVI+Fv7GfhASJqQXyjuh8Dud+1ht/0a7cIe48rFq6lE4oaO0WeLRpy1D5QZIVcYQsgQ8LJC7CizwzPHnaE/wEgZosf9sVY9QshyMQOkHrbQ9v6JrLIDPW1gMO9OXrFL6rNMPy0vOHS93qhj7IeCeS3KkLXkobz5oMYhKygGrMCx25GPTHczsU0bZQY5iPi5v5/7qa9d8lBJTkZGEYP8YaS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(136003)(346002)(366004)(376002)(316002)(8676002)(16576012)(7416002)(38100700002)(83380400001)(5660300002)(110136005)(36756003)(86362001)(2906002)(31696002)(54906003)(4326008)(26005)(6486002)(8936002)(186003)(31686004)(16526019)(66946007)(956004)(66556008)(478600001)(2616005)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlZRR1N5WGJwc1dOYzJaSzQ2cDFrKzQxdStHSEgxR3A1Mng5U3pOTFRHaHlH?=
 =?utf-8?B?SEF5dmFmM2NHUm5IK3p1WkpjRVI4R1VVZDJmc0lGWnBVTDViMFdubmxJVGd0?=
 =?utf-8?B?UjM4d2dYMjFQeGVrek9hZEJHMUpNbmU5SkdwNzcvbVB4ZnZRd1JZVlNLeVpn?=
 =?utf-8?B?ZXFlWEdVeitPSW95WW54UkJ2V3pKTGRldXhpa205WUtjaTJhcHFQUDNDUk5F?=
 =?utf-8?B?OUdieE5hTUE0YWo4RklVL2VhSmE5RDBvUWJPcXBGWG9SeTNlaGZzVmJxUlF6?=
 =?utf-8?B?eGVmWENkTDBQREZWQi9pcTVMYnpadzQzTU9vMWpvWGxkNUJ6V0NmeDRvaEpl?=
 =?utf-8?B?RTJpRmwvOTRiaE56bFdjM0tqTFAzeVVlNGRLT0ZtQitGUGY0UjRNdC9MWXl6?=
 =?utf-8?B?bWxNY1pnMFpvYjFGNVBaeVhhcVd5VjRWTHVRVm1jU2ExTmNDQ1YxcGdGS2NZ?=
 =?utf-8?B?cGJjNTAyUDZTQ1cvdmRpNXFWbnNyNVJGdTBZV3ZQMmxFeXMvenRCK01qMWxF?=
 =?utf-8?B?REc1K2RRUWRZNGxad0FqMWdRb2xELzBCazI1emFKM0pXTnZvcllZbktQY0Jk?=
 =?utf-8?B?QUR1aThYek9ub1BlYW4xTEtPTFJVL1NOL3RXZXE2dTVKbmdocjZobWQ3ZGJB?=
 =?utf-8?B?bGtmU1M1aldmM2cxUElJQVN3Tncxa2FEdGFBVVY0Z3p4WmxFSFRhekRjMWlO?=
 =?utf-8?B?Ykt2OU55cW5jd09JSjdrRUcrYU5DWGU1TW1PRE1ZTkJyZWlhd1czUGFRY010?=
 =?utf-8?B?aVMrT1FKUDl4aXpRZXlSOWFXK2ZmQ0hiODhyZ1pKQzZNR1JGc05pRzkra1ZH?=
 =?utf-8?B?WjgrVWhYa1ZpOEo0ZEN4QmprMFZrTENQeHM4YU40K1ZiOENXaEFTQ3BOd2Ra?=
 =?utf-8?B?ZnhpNEhzZHlKaFBTTS82WEh1QkJ2UTlaSDVGcWQ5T0hxWjBUMCtjVWVTY1Nq?=
 =?utf-8?B?NFhaSHNwV1h0am82TjhERkVpTC9rcVhLYlJSR2RBWjcvK1lxNytvMkhHdG40?=
 =?utf-8?B?czZQM3dKQmMrb0JrRVhyMWxyZktIajFwOUJrc2VhZzlRN2JNWnYrWnlRdElV?=
 =?utf-8?B?aTBqclNNZ05tVkhzbEtDMjAxSGdDb3ZoMDJIVE9ocXV0VDhYTHlTU0ZVeGJo?=
 =?utf-8?B?Q05aYnRxbDJNVWl0OE8rZnJDVXR4Z1ZuNlQyNUVXekpxNExCZGpKbzdiOEd2?=
 =?utf-8?B?WFhIU05yeVp6eVpiN3NiU0pNVzVMK3JjS0lmNExDQ1U2djNQdGNOK09MZEpy?=
 =?utf-8?B?QTNpd0xCT0dKY2M3QzBZTU8wcVpxbUxlK3c5NkRqQW5kei9KYi9IMXdFNUNB?=
 =?utf-8?B?UHB6Nk1ablJFVHR6c0JzbS9CclVmdkl0L0Q4TmVVZUNBVUphc21TcnhRa3NR?=
 =?utf-8?B?aWF1SmFFbjIzcTNVcEk0elo3T2VaOGZYRHJudXJEWHRtTUdDT29SdmVaSnpF?=
 =?utf-8?B?bVI4czFqVU5NaWtpTkhOTFhJNHlHMXJVcnUrbGpManlRTGhRd2swbGM2MGdu?=
 =?utf-8?B?dmJPYi9VT2ExSkROK3NXQ1RuZkNKTGNKZS9IdnhwQm4vNjBzd1BKYW1hZWli?=
 =?utf-8?B?RE9ZMW13VG9uNXRrMGpyc3psV29ta3JaL25kYmlVWUlOT2hnUFFNellWb29j?=
 =?utf-8?B?N29Yd1N1RmppanM5dEdTcWFZelJqZGN2QjlubDNBT0d2SEMvRkI2dzdhMzZP?=
 =?utf-8?B?c1VEVlU4Qk5WWVlKdFhXRXBrZTJEK3p2ME5UNU95Y3BKREQ2YzhTMnNMTlVT?=
 =?utf-8?Q?Ib9tLmPrQUQynSI730/qzISOVuXxcnEl6umzQQ9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c6e6f2-d3fc-4a67-7f07-08d930e05dc0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 16:04:05.4819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEf79sirBh4C6LIimBdsdZvewZEyNkdYpe4CoY93yum0b8KsXouiPiEIQaaVQsTx7f9yQ5VB4Sx0fgjXKgkesQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

All,

several years back do_memory_op() in libxc was changed to have "long"
return type. This is because some of the sub-ops return potentially
large values as the hypercall return value (i.e. not in an argument
structure field). This change, however, didn't have the intended
effect from all I can tell, which apparently manifests in the present
two remaining ovmf failures in the staging osstest flights. Anthony
tells me that ovmf as of not very long ago puts the shared info page
at a really high address, thus making the p2m of the guest very large.
Its size gets returned by XENMEM_maximum_gpfn, as function return
value.

Since hypercalls from the tool stack are based on ioctl(), and since
ioctl() has a return type of "int", I'm afraid there's no way we can
deal with this by adjusting function return types in the libraries.
Instead we appear to need either a new privcmd ioctl or new XENMEM_*
subops (for those cases where potentially large values get returned).

Until we manage to deal with this I wonder whether we should suggest
to the ovmf folks to undo that change. I'm anyway not really
convinced this aggressive enlarging of the p2m is a good idea. There
are a number of cases in the hypervisor where we try to reduce GFN
ranges based on this upper bound, and there in particular is a loop
in mem-sharing code going all the way up to that limit. EPT P2M
dumping also has such a loop.

Jan


