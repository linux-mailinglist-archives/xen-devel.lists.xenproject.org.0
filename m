Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0043EB350
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 11:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166696.304258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mETQz-0006ry-Vn; Fri, 13 Aug 2021 09:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166696.304258; Fri, 13 Aug 2021 09:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mETQz-0006pE-RM; Fri, 13 Aug 2021 09:25:01 +0000
Received: by outflank-mailman (input) for mailman id 166696;
 Fri, 13 Aug 2021 09:25:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ewIu=NE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mETQy-0006p8-03
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 09:25:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53da0728-fc18-11eb-a269-12813bfff9fa;
 Fri, 13 Aug 2021 09:24:58 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25--mMEewZ1PSeiXYQEO8fu-Q-2; Fri, 13 Aug 2021 11:24:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 13 Aug
 2021 09:24:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 09:24:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0240.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Fri, 13 Aug 2021 09:24:52 +0000
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
X-Inumbo-ID: 53da0728-fc18-11eb-a269-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628846697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGQKct7tizpFHXxACTjP3YHEf7m8sWOe8Y9pm4LfNfY=;
	b=ODuteRkRuuW6ZcG/n3E6ziGCAbrFTLyMubmSZaQWpkBrgjl4ESCSsqbTJXAhTm1Z477tdf
	GKt9bLIT+HtVEZUJweLyEvyfslxiEqXI3muG/jrlcmpGrdM72Lcq48oPDK1F3UbYeL589v
	lckAvMiwnI4KKEG1yY/G//Dx2ivrnQA=
X-MC-Unique: -mMEewZ1PSeiXYQEO8fu-Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lc5iqOqQ0Xy0Z0TIaYQiZiKLjwqVBjV6oQAzvpj5dqwJ/6dWCgvMEZYT/zRFlf7agiCVU6oquVKkQBH2ndJyQXh7o1/Wh0dguv9UnzYpqasob6ZBr2Oi/+BWXbEYXV+TTxpNzSuGJQuFzAe/5Go0x2kp61UcMREfjPYiQhCpLiwjjcHHLrIHFLCr4rkZdJO2J1+GVAXDREF+YeW2YeVY90jubHGvZK5BrWdwP/mlx5CYj7Xe+pYjJZF4SFhUPnRNLR2IjBmdfJjGuo4o3kLUkKgM9+EKQVkW194GI7nZMiAWY8YSBcR5FIKtvGlRF8NVIFF7jQOdwFlotjH4NLe6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGQKct7tizpFHXxACTjP3YHEf7m8sWOe8Y9pm4LfNfY=;
 b=N069IAfZ4ik7IH/UzJharBCo6CSTH6nb4cFjgqGlRPjrzt3HHxR3DRPwOT6yeoIGHGoqHQkJS/mCGl1JyQisMyo80+xV5wj6PhmTFY1t2Rqp3mI90XRBodIraU4I2zgpcCaL0+as8DbpZ3oNIxzyxLxFAXbYi5eJA8r71RSOPfQ5C8DAfnBRpNm694gi8WnLNK6o3aR0nqe7azwL9W76ExmvgmB+rdVtAfRHog7dRL3gaLP+KEGt8HiHy7WZwK7kbsD5zSrn9UxKkUAbwJxsAdkMgJPO1pgO9Nt3+Gk0hIIBWZVI/CkwHSZrwawRtpyVnizSDzVsC7pJZHd21t8BLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Ping: [PATCH v2 00/13] x86: more or less log-dirty related
 improvements
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, George Dunlap
 <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <b77e536e-1113-6fc2-55b0-b6b4f7b91b18@suse.com>
Message-ID: <37066499-a50d-d0fc-6443-f122ba08bf72@suse.com>
Date: Fri, 13 Aug 2021 11:24:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <b77e536e-1113-6fc2-55b0-b6b4f7b91b18@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0240.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42f0b1ad-4df7-4b3b-d053-08d95e3c34e8
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6863631C8F32EBBA23CB33C5B3FA9@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZGb0Qm8D33ac47yNGdTB775hvo1e60FTWB1cJ99fXk7tAIeAxuZW0YwzSJDRdfD6kzThPUnpENKzgNvsXTlUuHIutSE5BdJcA2zsAnm7bbmAzsKNW61Pn8vSZ4YAgLuoRHhzWABfpUw37kOZtA4zSWseeZH1kVQJJJlO0zxWvwDZB0olzmJB3wEIH1FO0fnloKJgVlg+K+RhY16C1rZ917E0OAga77qAuh+fP4djwAfWGXWZuX2MIOYrX/9MkUAhzOekQlVraMmm0aiXajLBOdQUJkBO9j0u8H11A0It7N8P+yfW3oIIipw9L0SdAcM8neTkCeP34+z2gMFrihIoKbUkICdtiX2vd0WsvAEpkb3quLgE8w6YXjXLm3EvV+KQt6/f2UsJDlIOVdsmmN2aU70fmNMTn2FmIJwNaL0NkW6hB3QbAwd9lC58rhZl44qXcbYjI15qZMDeC1I9mX/ElifCUf5c6S3Accs2xQ+D6JSDcL7Q3fqAwX9I1ZxN5mVm44yfEfiJ7EbgYajLe6qBGE1ljImvmlr90Bpy+/1ZmqGypc6BG/DMLY01jKpWBagbbRR1AN4ZZ0z4uNrxu6eamGN11BY2XOU9ZkA+1rSbXxAVBfDvsnaQTpGE7Cxr7fMscLaH26ia4+Q91WXaW743Wo9qnKbXgUj0IksRg9fbE8/aCzxNd6WbhXS1GGeNPGe4mDxa+cpU2UTBzYbt6d+nJvd6WZBBXckcD9/MZOa4DB//Uc5zHZb11XQlpTX9zK16
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(396003)(39850400004)(346002)(31696002)(36756003)(66946007)(6486002)(26005)(38100700002)(8936002)(8676002)(186003)(66556008)(2906002)(66476007)(83380400001)(86362001)(110136005)(316002)(54906003)(16576012)(31686004)(4326008)(956004)(478600001)(5660300002)(2616005)(53546011)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEVkQ1FPd2M4RmJjcnFFYlRKQ09aeEZLOGp2MEx2S3JJdUwvUWtYclRubTFK?=
 =?utf-8?B?a2EvK3BVUGFwMml4enZQR09EOFFSY2JoOWN4UTZCQlJVWDg1YWYxeGZpQmMw?=
 =?utf-8?B?WEwxOXRIdFBHSTJlK0lJdCtmSnQxK1hnMG9SV1Jhb2pDc213K1lsQTBNMEdJ?=
 =?utf-8?B?MmJ2YnpvdHcyOHBPRC9Ed2NWb0VlaXBLYWxnU2o0cGFML05DQkZjUkxKMTZV?=
 =?utf-8?B?RXVCOGM5eml5QnpFZlZBanQxUzg3SkFEcEdqMlZHbXZURXMybWFXd1lZUXds?=
 =?utf-8?B?YUdIOXJkK29DYVdxVjdDcmhERW1TK3dZakp0cFN6Z2VIaUZ2TGlKMHZOMHJt?=
 =?utf-8?B?SVlZcVZMRnFNOFZRUVVZeFM5cXRoZ08wL3M3Z1FOdXB3R0tOemtuN1hGNXJR?=
 =?utf-8?B?Zzk4OXpOQk1iNXdoNnNOS1d4ckFIN3pmd2lYUlk0RFJHRjFsN3dlQmNPZG9o?=
 =?utf-8?B?YnV4KzhqZnRjak5WNGVwWWNURnBObnhadGtvWHhRQkRRVkhndHBtOVFjajRt?=
 =?utf-8?B?bThQN1M3RjNoL3FENmFVVjVXNytaQkEwT2lKOVZpanZSckNrazltVjBKdFFi?=
 =?utf-8?B?N2tmUFhTZ1cvK28xRkZrVlpZRUhSZ1FmMmFpNk82RjQvWUFlSXpiUFdxSkU2?=
 =?utf-8?B?emwvNERtaHhsdm9YODd1QzZlRmpGayt1TnBXYXhFbWRPTVVVbEhES1o5QTZh?=
 =?utf-8?B?NGNNUHZLUTdHMUpOaEdDSlpwN0xad0ZJUGN5NUlKQko4T1dXVHRUUy9tYi9l?=
 =?utf-8?B?cW9uOFFZYmErZ0VxNDJhOTVtMGlYYjliRWFrY2tJZ0wyVTREZ2FnejMwY21v?=
 =?utf-8?B?UENxaUY0RXgvbXNsMjEyVS95SFAzMFZFRXNVY3grTUVFRnBtV0VoRnF1dGQx?=
 =?utf-8?B?QytHeGxRamFGUkh0MVp4WkNiUGhWTlVKYkk2YVRsSThvOXVFQ2tmUzBSSDVS?=
 =?utf-8?B?ZHVXU3R1RjFkdUlLdnJPOVo2Zkg2bHlUMXhybmw2TTQ4Q0drZFBiaEJ4aXNy?=
 =?utf-8?B?SU1kWFFDdW9yeXkzajZvZmttVW9VVDYwSDVnQjJrMTkrcHRxZk81QTk0QUpF?=
 =?utf-8?B?NmVpYVVWdzQ0WU5pVFVwakhoM0FTYjRzTFE1R2F6bW9qYUZpMWVzNVdnZnZN?=
 =?utf-8?B?eG8rQXRNQVFWQkpLQThNRGhzNWJjL0dKOGNOWHh2ZkF2a2s1ZmZiNzU2d3I1?=
 =?utf-8?B?anhXb2QzNHJZQ1h2QjM5dlZOemRaNEJOeGJ0S1l4MUw5L2I1Z0lJSEV5TmtG?=
 =?utf-8?B?Kzl6T2p0djI0VXIyYzA1dkpnTjlLMWd1Qk5ONVkrUEhiOGNJdU1MczEyY1BL?=
 =?utf-8?B?VThpVHUwWGlKNUh1NFRXYnczMmtFN0pSSWZUQWtDdys3MjU3MUttRU16bC8x?=
 =?utf-8?B?K3FvZjlaU3RnSWg2MDVOOHVPQUNqR1RzRVdiZkNjU2xxc2tJVkNlME5JRFdq?=
 =?utf-8?B?eDkzUkhrbDJlVjVGMFJOSmdQbWEzYllpSmNRUENXWlNRYmZkRkRxT25sK05K?=
 =?utf-8?B?aSt6YUlOUGJPdFRoUTJmOFZEV2l1VW5xamhISkV5NXlsdFA3WC9pNGZZNEZa?=
 =?utf-8?B?MjdDczlpbkdJNGMrRmpJWDV6RmlqcFAycnMydndVVGNLZFk2OVFQeEwySmJP?=
 =?utf-8?B?M2c1OFVUWEVzMGkyU2kzTmEweWo2L3ZmUlJBb1pDYldLS1cxUHdWVGo2MFVW?=
 =?utf-8?B?TWpHSk4xdDBMazdFNUExZVdUWk84TVVnMXMwRVFad1NRemlvUUpNRzlKUkZM?=
 =?utf-8?Q?j4LEx/EGCAAXTJa5gKzssMW2t5Xo1OdOWkjJZ3n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f0b1ad-4df7-4b3b-d053-08d95e3c34e8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 09:24:53.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mo4rrJXuCmhy1Ltsy5JZwm9iS+ynsBFZBqISpi3lwq+xlsVlroXu9w6VYs29f9o9AIFgJvDyfdSuSp/WaHf4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 19.07.2021 09:46, Jan Beulich wrote:
> On 05.07.2021 17:09, Jan Beulich wrote:
>> ... or so I hope. This series continues the attempt to deal with
>> the ovmf change putting the shared info page at a very high address
>> (which is now planned to get reverted there, but the general
>> problem doesn't go away by them doing so). There are further issues
>> with truncated value, which are being dealt with here. But there
>> are also not directly related changes, when I simply spotted things
>> that aren't very likely to be right the way they are. And then
>> there are also adjustments to the underlying hypervisor
>> implementation, with the goal of making the returned data more
>> useful to the consumers.
>>
>> With these changes in place, a 1Gb guest which has "inflated"
>> itself by putting a page right below the 16Tb boundary migrates
>> successfully, albeit the process takes from some 20 minutes to over
>> half an hour on my test system.
>>
>> In v2, besides integrating 2 patches that were previously sent,
>> there's one new patch and otherwise review feedback addressed
>> (albeit there wasn't any for a number of patches).
>>
>> 01: libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION domctl
> 
> while I did get an R-b from Anthony on this one, but ...
> 
>> 02: libxc: split xc_logdirty_control() from xc_shadow_control()
>> 03: libxenguest: deal with log-dirty op stats overflow
>> 04: libxenguest: short-circuit "all-dirty" handling
>> 05: libxenguest: avoid allocating unused deferred-pages bitmap
>> 06: libxenguest: complete loops in xc_map_domain_meminfo()
>> 07: libxenguest: guard against overflow from too large p2m when checkpointing
>> 08: libxenguest: fix off-by-1 in colo-secondary-bitmap merging
>> 09: libxenguest: restrict PV guest size
>> 10: libxc: simplify HYPERCALL_BUFFER()
>> 11: x86/paging: supply more useful log-dirty page count
>> 12: x86/mm: update log-dirty bitmap when manipulating P2M
> 
> ... all of these are still in needed of suitable acks (patches 8
> and 10 have an R-b though, and are independent of earlier parts of
> this series).

Since I've not had any feedback since the ping, I'm intending to
commit the patches that have acks / R-b by Andrew (which actually
also includes patch 6), on the basis that informally (iirc
mentioned on irc more than once, in other but similar contexts)
this was indicated to be okay by the maintainers.

For all other patches here I'd like to renew the ping. I have to
admit that I'm unclear about what else I can do to progress this
series.

Jan

> Patches 3 and 5 have objections pending by Andrew,
> which I did reply to verbally without it having become clear
> whether these replies were addressing the concerns, or what exactly
> the misunderstanding on either side is (and hence which, if any,
> changes I should make).
> 
> Thanks, Jan


