Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72F4DC866
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:09:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291609.495049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqob-0004dA-Qa; Thu, 17 Mar 2022 14:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291609.495049; Thu, 17 Mar 2022 14:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqob-0004aX-NM; Thu, 17 Mar 2022 14:09:21 +0000
Received: by outflank-mailman (input) for mailman id 291609;
 Thu, 17 Mar 2022 14:09:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUqoa-0004aP-Bj
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:09:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d633b998-a5fb-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 15:09:19 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-g1V0TEzKPIaXSyiX7MfO-g-1; Thu, 17 Mar 2022 15:09:18 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB3PR0402MB3644.eurprd04.prod.outlook.com (2603:10a6:8:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Thu, 17 Mar
 2022 14:09:16 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 14:09:16 +0000
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
X-Inumbo-ID: d633b998-a5fb-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647526159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B722Wt3NiRr6LWFowwZW08JNNpZta/n6YosI8oQ4MU8=;
	b=bUBb79kY8gig0MM+9ERiuaU3K0+iUp/BukTLHm6Ty+tp94Z+y5wNIy5x8feghi7ReewIZk
	h7R861D+QcDgwXQyTQ7FNmOYd/rOoRZOXTRszDVm8e6EFsNXrvf3v/bqS+s0Z+rhKMs13A
	waq3OLNbXq3AUkWOyojwUWE6y+3Lxt0=
X-MC-Unique: g1V0TEzKPIaXSyiX7MfO-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IubrONwdD95SJ6RKR3SnqHLWT+jFFi2Nwh1VzZPnqguUBUhdFFweCt6hTTNO8lYL7L88KbI0Puk883MbeR/MeQlNBVIMidi71YuAlxQp9/NWuGJ7L0AY5L8fs9zftxIcxLwfdaW8xXRUN6afOQ3ePPZzgkBz8ErwXE24+8X7dJt/ywTC7mCjktCr17fMktxiGBusJE7dpqmpd03vStFvjvHsC/6gBdfiWkl6CrivLXED6uEfUloSiTVG1617YVx7obLAVO+8J5BRvDB107jUgm+o0rIs4Sbm5k7gadeAIuDjdrtpzxA/s37xLqlnJ6ktZtccgcl5qB5gN7OF0eGCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC6wo68JnROZLE5tnSqHf0oA8LW1WnCccPpKJLGbbao=;
 b=SmNpd5jLPnI1pTcqMYw5wsMO2Wgjd3vLYcIan1MDA+10u0tUaBup32RDIsMKzoVFpnwBh+WptHsxfH4uN2+bV2b88a6rcXlM4lbdyag5otLDir6dYsaJrWXgZNU2fV5MjNyDEZGykN3kA8L75LQZtm25TErLo6q+JC1CZcA66lAO/jwBrtc4wpNU5zt8qz6KaJkzY5pQdraeR4FAvCHMYE4vJcSaTa9pRBni1K0C6rX0qaPuGrkM32bEpKzrIxhxuAheoLOL+bIU+8JIfnJpEEZ4oJLP8KTrswtZp0RpU4BfqW6nKgRPzxB9yyj4GouWw3K26WCmnYbqdh/bSiInPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a911e9b1-d1ea-34d3-df82-cfbfd840a339@suse.com>
Date: Thu, 17 Mar 2022 15:09:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] livepatch: do not ignore sections with 0 size
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220317110854.39050-1-roger.pau@citrix.com>
 <20220317110854.39050-2-roger.pau@citrix.com>
 <7443a703-6215-1b8f-a6c7-bab606ad016a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7443a703-6215-1b8f-a6c7-bab606ad016a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0073.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39ab89c3-f8dc-4bf4-4cfb-08da081fb89f
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3644:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB36447FC7F9497209CD0A54BDB3129@DB3PR0402MB3644.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	owom1VtMPfHcqktwGx8u1MzO6vQVHHe7bdLpy8lRHTEetcvks4L4kx/wKNBx9LO5w08Ub2FHNgZmrKm+pFaLZZC5gBGd/f1KSLudA2n2i1YFFtAq0eFai+damVKHy0nD+tlj0XU9RvhiAYkmSMB7JwqpdL7b5D9NFQYJIStWtyjdYjWQhlhjIifKP4PPQi21e7nf/PMXUdidGdIXtjMwmGg6ZPSXmTxAYDZFxikyPMiD0TgARBc1gaR3wd/msl6b5t2jtEHQmn7vD3RgNe6oaJ0XefHRNd2jY+ETw1hHS59oZDLC9MuO42GahX1E6V2G41iDJyrLOG6nsC6c+AGHqXqRrh3JZO7o/80AnTVPOcK7NWgos9+COgC8Ma/PhVuRIth8ikDPjzhUvIq7FSn4f4s5Blb3haZonxGmnppeCA/FRKG04Pciy4ydiXDFerSSwcxi/iwpeQvLtZo5yfLZivK9o1upcjnSr/YaG5deziFi1S1QM7AZ1qRFksVCVexEmbP+qlwaGLdBQNeYnnqjPUf8CtYzfkfquZA39nw+p9m/nRKAV06tJOvP9BYdcJqmqgnE7seIcZoYm29ny5dxTvo2Sf/BWqdlNRPMVI4t4B7xq2spWN+JWlLIsR+Uq62zrlH4bA5D6tbB7IRttjVnNJZtfArOLHDN8g9i3IpGXUoNojp2qmDG+aqhAT2DH7GN27wKYWV6svlK0GIyMiTyF4CGou3EEjW2GctCEwRvlqU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(6916009)(54906003)(316002)(36756003)(2906002)(6512007)(31686004)(186003)(26005)(2616005)(8676002)(66946007)(86362001)(66476007)(66556008)(31696002)(38100700002)(8936002)(4326008)(5660300002)(508600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o1yYVwZ8CkLhwHYc4ycQ6xtfpQNcgNysRGI0xKlKareYfHcnMUGTaG98XPGM?=
 =?us-ascii?Q?5fJQB1Oaxyjne/qnvcT4ftidKrSEL1FQG09abRWoj9e5ShX5SfdRQkQKCw7Q?=
 =?us-ascii?Q?hq04rAilwKpTrWx15lLwD7QTtoAu7CdTKbITvyjVSOa5lcIoIutHSOsAYDp4?=
 =?us-ascii?Q?+HXIeQh9oF/dyCufQcKpJ0ma25fYgQFt7zCdc9Zdbc4vFAHqp15lHczmr96K?=
 =?us-ascii?Q?WB2IIpViudtbf2NAljhT4O+tHrcSZ0+NkYL7XNOepS3A4tZ/WxlRkUlAt/jV?=
 =?us-ascii?Q?wPLlZehcF11gX8jJydQS3wZW0vVP+8AYLucbnCmDezsTFfyRmsAC5j7wPp6L?=
 =?us-ascii?Q?fy9nNCeFzAvTn2/9hAFEfNnOs0jUA7JEY7Of6ePQmnQzwA/oW79MwyyyHqwY?=
 =?us-ascii?Q?LdrEjOSrI+0gi/fFoaoriKHprAEDqPE1YwNPSJLj2CsS354yQU3/rclacdY3?=
 =?us-ascii?Q?Kq5uPTWP0W4E70+/CPO9NsyzezrJPtlm0wGD7Ipc27eK8Kqsovxo3Lg/E2HV?=
 =?us-ascii?Q?B2UCr9G6jyzHZ9am8jVHUlkP8T+HEnywQ2IqW7JkAnhfardap4dYl/x0KhJ5?=
 =?us-ascii?Q?Hyy5s2yNMJldzDb5xjJgK+HBuC2kLj30IqCZQ+Kqy32Z4AP7R0+6K8S3q8S+?=
 =?us-ascii?Q?R/4IHRWfqin/vc0mDTrEzivo0jKdiUsSY74TWMq7NUlB5gSyqz1R0STzkeKe?=
 =?us-ascii?Q?ITqfz2oK75Dx/K8CplIeMIhweDBXZBya598V+OQugbXOWkYA0rIuZM9IfYhy?=
 =?us-ascii?Q?NRgRYI6ngj9iiT4CBYnEyihllKuVlsqagXmBaIn56bbLTItj5IV99ZSqavgG?=
 =?us-ascii?Q?/DRR0offmxLRx6qtIj5JzTJESLCy3h8iTweng4aAExAvmFt8gXDsSqoxJAN2?=
 =?us-ascii?Q?SMfPHiYpYBzP3xtirQXBy6X0B951qT74JDW9ZG99tUm2cdp14Nm75xqN7GCJ?=
 =?us-ascii?Q?XRSoGB7XtGLLSJQFBNxVGhAfJdNOvWVsNcxwCKumBbJmXzPg9sH06PNDVXeB?=
 =?us-ascii?Q?0T6Crtvu2IdV3UEbOUoT9Pbbf2WR008Xyb14d6HfdkV6tM6rdbEdAVIPGQv9?=
 =?us-ascii?Q?gciMEyziMx4EL+1Kmz5g2ZYKg9k9yyhiQw0+zCvFxN0IQgWH0ysd7PEUUuLo?=
 =?us-ascii?Q?2ZDtzxhnP598bmsGmIjXH7dif4hTuuHhaQO/p9ZB1c8B7paBO3kmtcVpvUzl?=
 =?us-ascii?Q?3pnSQF2lQCo5DDSAgxCfr5j4YLRnjp9WZdpgW/K/iWqyL9UcEwD0s/Kxc5u6?=
 =?us-ascii?Q?9AGkepWZ+OkiRaJxpBwcDiOBIW/PRqvuKTiGEoOeGa6oXXcRQvcmLWArYu3b?=
 =?us-ascii?Q?O5YZVfZn21PjeXrnqAY/KizMkJiQ28rrcD1ND0kyjDZ7c7Cbitl7Ga8NSRk1?=
 =?us-ascii?Q?FVyMyMOD1pvgysn2GL/IEeeQWZFrUrLhmOjKXWBLeXf4MugastwfxCY/MHyo?=
 =?us-ascii?Q?HbYRzCHTwMTU8OI11PkfrtDz7YSJpegz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ab89c3-f8dc-4bf4-4cfb-08da081fb89f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 14:09:16.2520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdlQ7avQEjNgpg+33QGpswIfpbdjuvLlYg8TqeZ1g+dcNM/BDUTtAEhXRtJHmn9WRjPbvIinmns7GSPunmnueA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3644

On 17.03.2022 15:00, Andrew Cooper wrote:
> On 17/03/2022 11:08, Roger Pau Monne wrote:
>> A side effect of ignoring such sections is that symbols belonging to
>> them won't be resolved, and that could make relocations belonging to
>> other sections that reference those symbols fail.
>>
>> For example it's likely to have an empty .altinstr_replacement with
>> symbols pointing to it, and marking the section as ignored will
>> prevent the symbols from being resolved, which in turn will cause any
>> relocations against them to fail.
>=20
> I agree this is a bug in livepatch handling, but it's also an error in
> the generated livepatch.=C2=A0 We should not have relocations to an empty
> altinstr_replacement section in the first place.

I think having such relocations is quite natural, but ...

> This will probably be from the lfences, where the replacement in a nop
> and takes no space.=C2=A0 I think I know how to fix this case.

... of course it's possible to eliminate them. Whether that's worthwhile
to add logic for I'm not sure.

Jan


