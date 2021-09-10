Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3AF406CD7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 15:23:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184391.333011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgUa-0005a1-Mh; Fri, 10 Sep 2021 13:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184391.333011; Fri, 10 Sep 2021 13:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgUa-0005Xr-Jh; Fri, 10 Sep 2021 13:22:56 +0000
Received: by outflank-mailman (input) for mailman id 184391;
 Fri, 10 Sep 2021 13:22:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOgUZ-0005Xl-2x
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 13:22:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b25ffb4-c141-4374-ac28-b233c2df4476;
 Fri, 10 Sep 2021 13:22:54 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-TCh-We65NYSj-URFog50YQ-1; Fri, 10 Sep 2021 15:22:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4606.eurprd04.prod.outlook.com (2603:10a6:803:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.23; Fri, 10 Sep
 2021 13:22:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 13:22:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0158.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 13:22:48 +0000
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
X-Inumbo-ID: 1b25ffb4-c141-4374-ac28-b233c2df4476
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631280173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oiFVKQIxRWxLlX3K6tsHaH0EGKjhQ4+KcCSrfELvS60=;
	b=RRxFzjd58ZjYgdNcnIJnvt8rNRaMueDap/U5NPCty2V2vEP66L3bDDMKwS9RUqVizxoN/q
	uuPtdEdIi9QMDUqeq5CKg1hZMWmDD5EWnMHXT4OZ+aqzMmN1+K3snb2JvtqJzUlBkjBdr2
	HGHpZRCgf/gQjDzRjZ+EZBrgUjiUUdA=
X-MC-Unique: TCh-We65NYSj-URFog50YQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTAoj5ne5WynUrGqiKgxtqoJoatjjYrbM080Fw4wwIqkSuK6ycNI5q4lZp6k0f4u7jfbqInMr/DlcbACEiMWSTyMKz1q2g7Uo+jk9l2BUz6gnDiEsbh6628kGsg89Pv+9hMOWiU8UQKBbdoz3yepv/MRGsmoJ8vSFFtKt4VQKmlGR24nHiB3i4WvdKZTRLJVbaqF8j0JOpl0iNlsNXA4bW/3rh6Xw9vEvxdXtU0VbEJwTSA9VBZzuz//nYLoAuVlYfPFyL/0o8GPcyvv2I+rNnAZCICfJ6xs507NZTI/mSwyeuaCuwJDddxIRwLexQggAYABvbIeODpAapBurIHfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oiFVKQIxRWxLlX3K6tsHaH0EGKjhQ4+KcCSrfELvS60=;
 b=RbKFTyxBHbBVqB3MImGuaoCYl0OIUC0gPy8yGOTIMST6ASG58lYi6vYCduWeOeCr0d/kLnodmC0oKJ1yBzy8huZ1c/BZiLl4IIP4vu+cu1DDx1kQ3mzsd2n3ihHMJDNlaZHUwoAYdOm7qO49wuR0wyWpQYyjaAhzFt4zXXp9EP0ky8Zv17wQQSBHnKpaobwAdilS75EyEw0UNxW3dhs1r5DJfeRp0XolEl6Bb7/Ha10nKVflUCYGPCfU0zRYEOAgbDJtrNdPRmjOo8J6evy0ogTdYUAoFgfCA49w0r1RVR/d4vVY3HN2c73wfnBGLfz01ZqLuxNlQaoAdL1lpoz28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Introduction of stable interface between Xenstore and hypervisor
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7c54683-75d1-ded1-54d6-823dd76db030@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a192a226-bdfe-6db2-c501-5e5e17c74de0@suse.com>
Date: Fri, 10 Sep 2021 15:22:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f7c54683-75d1-ded1-54d6-823dd76db030@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0158.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8278f10-15a3-4d6e-9f8a-08d9745e1590
X-MS-TrafficTypeDiagnostic: VI1PR04MB4606:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46060558A3FB7A84DDC67DBFB3D69@VI1PR04MB4606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0IZYz2zhqzaq2V4Y4j6gSB16i/DP0ZwzE2x3QQX9dr/9s3w7nqD0xjfDVsa0nQe1o9yN6YSXB7Z3GsWvwGt81KoQjzCqtNKObHF41k4nh+jxU1HUU4JArnN3wTkkByqIdsLHUaKHqRw8NpJN6an+YN7qVjGXRD0sYjf6DnPp2jGhaRvHubj+KsvpiqF0D2RXgpkzgvFdT9/MwM+a3Tv6YSnVRnlfYIcfRyoLDLvg5aZ09w62slcsmmnaXyg4RhCaKKgSWDakGTy+ux3ochTEUercAQ5N5XoCI4TCAZchsOOiEqfcgR10q2zKTDbxI5O4mxGQePrHgiQrdnRSurXx+pjeTg1S7Xe+cgKGRRsEpZL/9sPNVeH1t7APP26iAUpU1nUzjwvHi+ToUV9rEqKIN5orlGAIYqGcLRM9zhV4+r4jQq94xZDdf0/TnfVbXzKY5/UQRckX6xQuUaSvC4ZhwSwmuKFERwW6LeJUxuuDih+5316Eib/RAO5YAYx1WfU+H1GRs/yQ82XWcamxaHQqqvlUAbAJYUi4iU7T4JmK71ebCxbGgUsoMDFkm5/1pMRCe7e/p8VMTpN94Z/PTCyTMuLT2GOYPzihkCzBwq2LOuk4pY0wcs/E9RjMoCL2ScAWpABt/LXP3M+fWmqZ85zvZXKpVUqwFzcts5RwO3fN/d2EjKcsaT1SYOdDvrEtDiKfut8QB+PpJsOX0r0FdMcZvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39860400002)(376002)(396003)(366004)(31696002)(6862004)(54906003)(36756003)(5660300002)(186003)(2616005)(38100700002)(26005)(86362001)(66946007)(8936002)(6486002)(53546011)(16576012)(2906002)(8676002)(316002)(31686004)(6636002)(83380400001)(37006003)(478600001)(66556008)(66476007)(4326008)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmE0QXo3OFVSSkRCWGFTMHJpbmhhOFlhRm1aZWY4WGNVOXp2Rk5pS01wV3dt?=
 =?utf-8?B?d2l0Tlo1Z0NaMkF3alRZWEZGNWFUKzFvZEVrempnaEJpeFRUSmErcHdWUEh4?=
 =?utf-8?B?V0Z6dnNtNk9UVnpWb0dmTFREaitoUU1nOUNKK3lPUVY1R3JxYTVEanBTdEhz?=
 =?utf-8?B?a2lCbjF5aHUzZDZIb2dLdnNpcHJaeTJ1NHAySjV6ZGJtM3c0bHNzbkdUUHFD?=
 =?utf-8?B?SWV2VVZBQnY2aXNUSS9QSUJQbU1sUGh6dWp4Y01iWjdCOWwrazlYOEZtWUk2?=
 =?utf-8?B?TDl3N0l4VENrOHJpTy92ZXhESXdvQTNiS3hYZVF1NUliTkRQekN0bjl0YVBx?=
 =?utf-8?B?YzVTRmhvK1JIc29Tb3ZadE0vZTNkajg5T2wxd2pQa09EM2xBS2JmaDVZQmZZ?=
 =?utf-8?B?c25uRVY1VVVmajBaeXBsTDFYM0IzR1d4eHFpYTJ4VDBLWVg5K0lxRmJ6bGYv?=
 =?utf-8?B?cDhYbjE3Y3NmN04zM01Fa2dlZXBzSUlDb0RabUFtUVJBdkpOUEJiRll6NWJn?=
 =?utf-8?B?TXk1anowTm5UWVBWWE9ZekZodFdFYll1ZENCaHpoc0FEbTNFSmpHSFdqSnhw?=
 =?utf-8?B?ZXhaK2J4MkNnaHVJSHFGY2E2YWxtdVpWVldJQmlSbVh5Sm14SGU2UTZiM01X?=
 =?utf-8?B?NXRYSlljVHBKTGlpczY2TEdaT0ttYXdVUzBVYUhzaXBKSEgzY2pZZE1OVkU2?=
 =?utf-8?B?b3NsSXNIN3FOSEZHaEd1ZmRZK0JhbWlVbGdUaW85Qk9LeWF6cUJGWEs1aEo2?=
 =?utf-8?B?aHI2NHRncG1pUE1BUjVKSHp4TmNtSE5XNE5Ib3VFZEFQTHVvbzNGM3gxcFY0?=
 =?utf-8?B?OHd6a0VRekU4RUtmd25BellsNTEyUk9QSUl5OTNBR3RQNmlGc1ZmNXc1U00y?=
 =?utf-8?B?eEZQeitLaUNmbGVHay92emVFbGxubzE5aDRjQVNtSWFSQ21ZczNzL2hGODhj?=
 =?utf-8?B?Vm8zNkd3d0s3VC9EMFFZMXl0a0xXV2cxRWdhcDZ1Wm9zVHlZQi9SWjR2bFNp?=
 =?utf-8?B?OGE1dU1VeStLWlhIVHB2NDFYQ2ZGVlhEbG9yOC9QUm9QRktKRHZNVlVvT1Ft?=
 =?utf-8?B?RzhtMEV1VnJsTzludjJWWitleVNvYWNaL0ExaGVDWndRMVNqRmpHSWgxajA1?=
 =?utf-8?B?ckxQd2krU1BSbUdCbDNsYzlkaG1aZ2ptTlppTkdPV1QyS2tkaU1GV0VxRXBw?=
 =?utf-8?B?Vjh1bXFlNVNQZzNTK1FvVWF3a0Fwa1dmT0NFL1pLN3BzelZxNmVubXAzam9x?=
 =?utf-8?B?WGxkT3JlOVdabVU1YklIV25zbytEOEhQVlc5VU0xSUlwdldpaDQwT0NweVRZ?=
 =?utf-8?B?am52OC96Z01KVTVNNlJVd0xBRk40K2NpVU85TzB5MFRLRTRVYVZrOTdmL3FV?=
 =?utf-8?B?S3NwYlo0cm8yVWwrVnc4RmFKbzVBMXp0MWJ5Q3pFMFI5N3FWU3ExRVNtTW9E?=
 =?utf-8?B?WGdvbWZtaUtnSTVlT25WL0hJL2FEaWc4dVhFL1VMNmNKMGdjbVZrWGh1VUE5?=
 =?utf-8?B?anR4YjAySDZES1JabVo5MWNPSENZV3ViVGhCTGRCTHVjWG1aZTdXRHVtVVhK?=
 =?utf-8?B?RTdVQlB1TEtINEhGditGTlF4MzcyMlBqeFBQK21TbDhqWGRJc2tFMVozNnZH?=
 =?utf-8?B?d204NGxJd2pZamVVTHdIbXBIVmVTZnh4K0trcjIyNC9lRmtlSmFEWC9IY2g1?=
 =?utf-8?B?a3ZScWlBcURuVHo5WlNnU1lIb29zcWNPU2ZRRWY2WWRxdGVMREZkRTl2dEJB?=
 =?utf-8?Q?csW3FS2QZKFK9/pzCISQXKzC0lRMGd1dQrluquw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8278f10-15a3-4d6e-9f8a-08d9745e1590
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 13:22:48.8362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3xxOn6GdvsOQDRs7Zwf8vefC3HgAu74XhPaMuw0ddS+t0B3tN7w2xnB4v11yAlciehyL1EuWpD+1m4sJKVeEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4606

On 09.09.2021 08:27, Juergen Gross wrote:
> Today Xenstore is using one unstable interface to retrieve the state
> of a domain (existing, dying).
> 
> In order to decouple Xenstore further from the hypervisor, a stable
> interface should be established. This new interface should cover the
> following functionality:
> 
> - get the needed state of a domain (existing, dying)
> - get a unique identifier per domain telling Xenstore that a domid
>    has been reused (today Xenstore could in theory miss this)
> - provide a way to avoid having to get the state of all domains when
>    a state change of a domain has been signaled (there is only an event
>    "some domain has changed state" today: VIRQ_DOM_EXC)
> 
> I'm suggesting the following hypervisor modifications:
> 
> - Addition of a global 64 bit domain sequence counter. This counter
>    will be incremented each time a new domain is created.
> - Addition of a sequence count to struct domain. It will be set to
>    the value of the new global domain sequence counter when the domain
>    is being created.

This looks like an "extended domain ID", which I think we want to
avoid unless exposure is extremely limited. Since we can't easily
predict what future usage this may have, I would suggest to seed the
global with a 15-bit (or wider) random value. I'd like to further
suggest considering to not have this be maintained by simply
incrementing, to make very clear to consumers that the actual value
has no other meaning. This could be done by multiplying by a random
odd number larger than 1 (determined at build or boot time). All we
want to guarantee is that numbers don't repeat (earlier than a 64-bit
value would wrap when linearly incremented).

> - Addition of a global bitmap with one bit for each possible domid
>    (resulting in a 4 kB page). Each time the state of a domain is changed
>    (domain creation, shutdown, deletion) the related bit is set.
>    When the VIRQ_DOM_EXC event is being registered the bitmap is reset to
>    have the bits set for all existing domains.

This page, as I understand from the subsequent item, is not intended
to be exposed to the domain running xenstored (or any other one)?

> - Addition of a new stable hypercall ("get domain state") returning the
>    following information:
>    + domid of a domain having the bit set in above bitmap
>    + state of that domain (existing, dying)
>    + sequence count of that domain
>    The related bit is reset in the bitmap as a side effect of the call.

What I'd like us to consider up front is whether xenstored is going
to remain only entity interested in this kind of information. The
entire design looks to leverage that there's only a single consumer
in the system.

I understand the caller would iterate over this hypercall. Is there
concern about this iteration never finishing, if e.g. a guest gets
rebooted quickly enough?

Jan


