Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D89E3F2712
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 08:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169256.309187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGyO3-0007le-M3; Fri, 20 Aug 2021 06:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169256.309187; Fri, 20 Aug 2021 06:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGyO3-0007j1-Iv; Fri, 20 Aug 2021 06:52:19 +0000
Received: by outflank-mailman (input) for mailman id 169256;
 Fri, 20 Aug 2021 06:52:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGyO2-0007in-40
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 06:52:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68a90b56-de6c-47cb-bc9c-953b8f2fc61d;
 Fri, 20 Aug 2021 06:52:16 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-qYTbzMzWPK6hNiXIbp036Q-1; Fri, 20 Aug 2021 08:52:14 +0200
Received: from DB8PR04MB5594.eurprd04.prod.outlook.com (2603:10a6:10:a3::31)
 by DB7PR04MB5483.eurprd04.prod.outlook.com (2603:10a6:10:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 06:52:13 +0000
Received: from DB8PR04MB5594.eurprd04.prod.outlook.com
 ([fe80::2c99:6a5b:2940:533b]) by DB8PR04MB5594.eurprd04.prod.outlook.com
 ([fe80::2c99:6a5b:2940:533b%4]) with mapi id 15.20.4415.024; Fri, 20 Aug 2021
 06:52:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Fri, 20 Aug 2021 06:52:12 +0000
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
X-Inumbo-ID: 68a90b56-de6c-47cb-bc9c-953b8f2fc61d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629442335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mym+fMmQfndhl+XUBQrpKVWUwx/9VGfl1IMhRZJc1Jw=;
	b=BrdCTSbEtoAM7+l1BRgIdwz8WSKReTC2j6vAmbqfZNJJ42n4SyLusP9fkapJhshqfzlMmn
	jIbqQCULu5hIXmFGjYAAIA9IvyyZUxUXdcFRvCe+q9/9JKGoIbIOl2pOKulFv2zUyvTIoQ
	bM0vASlC7eqgpOlrCeouXpywaVYDw58=
X-MC-Unique: qYTbzMzWPK6hNiXIbp036Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiq/bE7IgnrGoSTcAYegdLAxG+KOepUIW0Vd592wyiuxelFwG1nIWZxF3KOSxQPMlU6OJ0VsDPLUr+L1y5r5+pjTbYvowg8iM4ocpND/8knqAMVxuRxu8WaAFfQcrpuy1bf3o2aElYscT/Qo0lKWV1+jU/R+80dD+0lhM58YOhTcToPyLz09qdXlgNZ07gVFKZZcMwKY7IDYkWpufRzLGgXDV6xeUIvj7PHo5mxP1hm9MvehX1Lu7zs0lw5EkHqvlV4D4facUqLjTutJ3dTQ7Lh0I422B5qgozsTbLSMCBkOjCOPlWfZF9zNp4lbE24j+PI2/ZpvQ1sxqlM5QZJCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mym+fMmQfndhl+XUBQrpKVWUwx/9VGfl1IMhRZJc1Jw=;
 b=P03R0lzIKP0CaKr1zJIUovaiGnXp8Zb8YAkGE+D3K4QNX97W2cYQkpkR7oy6D7fOykeE8DwwmQLzj0YnYmUqINO+lJWvhAZKwiWK5TGB+7XKZ5zF/EGjsg3AgSf3vArKHtBIprmQlrgLYrFzA4XAmUnNKeuCOMcXiaHiKwhXmd5K1d+YNqvhKMLWMUo4qwe5bGANTnSpNi3GwNyiQruBJ3X4Ve3rwCHzhG581Yhyxfd6QuHinjXHpdnmUCBgEvruEnhpfMSFqK65EmuoUh8cpk/+B38GGdEdfQlZjTmNXUOKiv7v4viuwST7/LZ3jVqR1e2i7+f1YNFjepHJcDyi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 1/4] public: Add page related definitions for accessing
 guests memory
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
 <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69747133-3d42-4179-2606-12b1d1a9c8a6@suse.com>
Date: Fri, 20 Aug 2021 08:52:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::13) To DB8PR04MB5594.eurprd04.prod.outlook.com
 (2603:10a6:10:a3::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79631f90-44d6-4985-9788-08d963a70a2b
X-MS-TrafficTypeDiagnostic: DB7PR04MB5483:
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5483F79940853C99D3924918B3C19@DB7PR04MB5483.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YG4n6wPoOTa0B+ILV+krB3/70JfefvUu3nb8NjwKUPmwF0BKPfgCp4ptHiS4nZPALAzQF9mHaX06RpnnIBZf5KCpE+pqWQL+S1MHqpqr0U1jpTyj/edgZHPmhy614VuV4CadavM38xPYJreb2udQe9t1xFlh/bMG2uj9DyPGlNQ5MgfbEgHFGpcjxvLjzYruoUSV63w+2NE1lV+Aw41g9kem7npvke+g0gVhf+hC81nmo1zjR6I5oIxoFeGo3w0XnpT4DmhINpSyfXZ2XVyQA/IH5L0t84mpn/WC8iSWzpT/sB2L3ubWuTlO/ibQ1CYaJNzCGoMAszghTRCCjkmy52sK/F/2ojcoCqqP2ZqJRoaIroD7kOeKgQjcs35SBwG44oqvoh3bex6jNfSOMPheH1h11z3mNrKgSgpprZ2Eaoc6kJTiluh6WV+IZ9e9mcvTfOP6dMor71I0kLqSVcKEPN8Y0yDZs90mLls/gTOXDE6FYDW1oIzYzMvo1Mttwn6Z19UswpU5IBIEc6Mrb4sdBsr9PKigcRtuZrBEoDvdew1IxUaQWi/CTtB2DXx6U+nyMUvXYYF2maBOxWRSbUPDrzNCNYTqpOO+lxjkEAuyfx1a5SkAYdJi0dutAAajJV4BgexY6Bc5Nwvi0SN3K2uc5Fsvcs0LRaVbZnJ6TzfU/MfCOcnM/F7VHf0+0r+K/cMnV+v7Gt9q5goZcHNQqNMi7bckaTEpRmmdPgBssvyj7ok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB5594.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(6916009)(83380400001)(31686004)(16576012)(5660300002)(31696002)(8676002)(6486002)(2906002)(36756003)(956004)(66476007)(54906003)(2616005)(4326008)(66556008)(86362001)(66946007)(508600001)(316002)(38100700002)(53546011)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ry83bkdiQW1RNmozT3g3M0t3RUhZc2hEd1VVRnFvaUhKanlUSmZtNUhHVVkx?=
 =?utf-8?B?TVhuYW1EdklIeHZGYVR6M2xCYmswbnlWamgreGp0Y1U2ZFlqc05HbU5JM1Aw?=
 =?utf-8?B?OHM2UEZVelRDbVVYSHpBNDVLeC81MklQUVBYQS9nbGZoZzBaOHhuV1ZCQkhQ?=
 =?utf-8?B?SVBrQ0lFcjQ3cXhodG1YY2o0NEtmYVhpQWdyU3FUT1dFOVBhczIxMGRwbkJQ?=
 =?utf-8?B?bUliVExWMStERlpldzBqVElmV0JBb3VxY2FQdldRWnlLeGl5YkJXSWlMVTRx?=
 =?utf-8?B?LzZpaWRIbE4zWVFYR21PbkRybjJKeXVsSE5tNUhYNk9RZnV6RkRmVWhpaGFM?=
 =?utf-8?B?UUx6YWhaQksvMXVXVmlJM2FpRDdaeXlFM2lXdDgyWGpzdHpkVVlzZEVjTW8z?=
 =?utf-8?B?ZHRFWktzdkd2OEw3WU1TM2dXZ1B6MlkzSHJmVWllbFdWTXRwRlUvcEg5S2dK?=
 =?utf-8?B?MGE4TllxZ2liZkFPcnFyWU1rV3NBSklzVXUzZ3JuSjliS3prZU1zT3RQQjJY?=
 =?utf-8?B?LzFSVWxSTFR3K0kydnViRjE3elhCZXJFOFc4b2VmRGhzRkZManZxQ20xemRr?=
 =?utf-8?B?UXg3SncrNXBwU2FzcmJQYzJQNC9hRHg0WlUzUjVKSWJqRHRQb1ErWEdYdUVo?=
 =?utf-8?B?WVd0SlQ1L1RJU042QTNKdldaN0JLMmhIRWxtcW9Uc2ZaTWFuaHEybFcveWk0?=
 =?utf-8?B?cy9BcVAvd3VYcTJnNy9meUo3YjdrY2RIM2ZBa3E5dVpTWkQ0Z05URHhZZ0Z4?=
 =?utf-8?B?MmxCUVJFTXgwYk1Zc08wS2hMenZMYVo4ZUpFNVk0K0RuV1p2ZGx4cGoxU0FM?=
 =?utf-8?B?SUFzT1FqekcybU9mQzduNCtqWXlrc1V2Z08yUW5Senk3YkxJb2xlOFBRZGFE?=
 =?utf-8?B?K3diVzRSTmQyU0VBSFJLUDZ5ZkpFTVRFYURjSWxzalpNRE5TZWZBMi8wZHpK?=
 =?utf-8?B?L3JkZW9GTlFXL3dLU3oyTWk3QVJNTEQ0Vld4aUJtODFWMWV0U290VjQ4MkRZ?=
 =?utf-8?B?dDNBTUJ1d1dESzZEeUtGdmJjY1o3SFJkak1VZmNxcndtU2owZ0l5VEt4WlNF?=
 =?utf-8?B?bTNFZnBwd3JHT25FN0hoZjhDUDV6eUFLNzZ5WUlsZkJ1UVp5YU1PNWtGRWNi?=
 =?utf-8?B?Q0lmdHVvUU9Fa294VlhKanNvOVdIUkpHRFQvdDROSURuZVI2L0tiQ1NCMWNS?=
 =?utf-8?B?T0FxTmY1OTExNDRUMmtKSHhtUm5vV2ZZYVhoTVcySmJTMEN5dlJJQk5KZENE?=
 =?utf-8?B?QnNXekNuQXpDNXhHRTdiZUJWcXd0UlNmSHZXNUp1ZFpvbmVGOTM1ekFCbUF6?=
 =?utf-8?B?cjg4dEJRM1doVldhN2srUHc3eERaeW5HREZoYWpVNHpkN2w2enZGaHhBVGRj?=
 =?utf-8?B?bndDdGpZZ2tNbEt5MkUxdCtzZWJSNVB5Sy8xWGtTVVFPbkgyRWxuV0tXRm00?=
 =?utf-8?B?L1d6b0x3RXo3MlU1dnJXSWlNdVZjTUNnM2NUaC9hVnpqaWJuOEduL2ErV3ho?=
 =?utf-8?B?anhYMXNSSWRyRnJrQzZXekpRejZoMUIyUjhVRksxelRaTElhUnF5d2l0bDlY?=
 =?utf-8?B?UTNETWVBYzlOejFnYWR6YVdJQ1AvbmswQmFvMkgzVXc2bWVoZFBKaGNFRzFJ?=
 =?utf-8?B?MWg4QjBBZWFDYVRHNXpHeUd6Y1Y4SXB2Q1F3dGVXL0JHSUxOSDZpNG1lTDdP?=
 =?utf-8?B?eG5vR29NbzJKSEJQWFFrWkRvQzdLa3FDcGM0SU5sbEdRSGtQMkhkQnFHb01I?=
 =?utf-8?Q?sbmOGs51tWUWA8qNxvVzPksRz1D3hxYKZoeySS8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79631f90-44d6-4985-9788-08d963a70a2b
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB5594.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 06:52:13.2262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+6OGb2ue4++hppU7nQUMzQoR65KqDtmYyxcLWx4TIiUCeZXETGWJAtUJsekoX0r82E4X+YIBcZMCWCepb+eFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5483

On 19.08.2021 19:50, Costin Lupu wrote:
> These changes introduce the page related definitions needed for mapping and
> accessing guests memory. These values are intended to be used by any toolstack
> component that needs to map guests memory. Until now, the values were defined
> by the xenctrl.h header, therefore whenever a component had to use them it also
> had to add a dependency for the xenctrl library.
> 
> This patch also introduces xen_mk_long() macrodefinition for defining long
> constants both for C and assembler code.

I'm still missing justification for the addition of a new header, especially
as I don't see that header to gain much more contents down the road.

> --- /dev/null
> +++ b/xen/include/public/page.h
> @@ -0,0 +1,36 @@
> +/******************************************************************************
> + * page.h
> + *
> + * Page definitions for accessing guests memory
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + * Copyright (c) 2021, Costin Lupu
> + */
> +
> +#ifndef __XEN_PUBLIC_PAGE_H__
> +#define __XEN_PUBLIC_PAGE_H__
> +
> +#include "xen.h"
> +
> +#define XEN_PAGE_SHIFT           12
> +#define XEN_PAGE_SIZE            (xen_mk_long(1) << XEN_PAGE_SHIFT)
> +#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))

You went too far here, I'm afraid: In reply to v1 I did say "The latter
two, being identical ..." - XEN_PAGE_SHIFT ought to continue to be a
per-arch constant, even if right now it is the same for Arm and x86.

Thinking of which - with exposing this as a stable ABI (not just the
abstraction, but the specific values and the fact that they're
invariable become part of the stable ABI this way), what is the plan
for supporting 64k(?) page size on Arm in the future? At that point
you _cannot_ simply remove or replace the #define you add here. As
the immediate need is by the tool stack, enclosing in 

#if defined(__XEN__) || defined(__XEN_TOOLS__)

might be an option, with the downside of having stable libraries
(foreignmemory and gnttab) depend on an unstable hypervisor interface
(again). I can't seem to be able to think of anything better ...

Jan


