Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1214CD0E9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 10:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284078.483218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ441-0001cL-SD; Fri, 04 Mar 2022 09:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284078.483218; Fri, 04 Mar 2022 09:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ441-0001bW-OZ; Fri, 04 Mar 2022 09:17:29 +0000
Received: by outflank-mailman (input) for mailman id 284078;
 Fri, 04 Mar 2022 09:17:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nQ440-0001bQ-Vr
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 09:17:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c5395b-9b9b-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 10:17:27 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-umCPsN4mMXWarl0EZc7KOQ-1; Fri, 04 Mar 2022 10:17:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB9096.eurprd04.prod.outlook.com (2603:10a6:20b:447::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 4 Mar
 2022 09:17:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 09:17:24 +0000
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
X-Inumbo-ID: e8c5395b-9b9b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646385446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJ8tnRqPXCfHENriotdltI7jRTtWka+LQz2JvM2P6RA=;
	b=V2Dkr1/ACHPmU62K1B2kbeaCWJChqoo3KtFPRg7ML9ccfWvzun415f/W/XOEV4TUI0zCS/
	Nh7Tbv6LS2t2D7JGd6HeB2mhLdBTQ3p/O2nMhI2BF1CNHDjC10EzWOEwbHiF4I3vLDGkkZ
	h6GRKlE9gJuVJU/4a7YsxGpkdK/ftj4=
X-MC-Unique: umCPsN4mMXWarl0EZc7KOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYnok4SAwBz+K43JsKsx3TBdjJft4fSdIYfwYW++Dum/aa6zlpO7D4B/i90DlIjA8l7Ma0iVW970oSoOYQjcX0/GU+pR2pf4/mUtsgFEcR7HJye9I3LGwsjzpMlw+AZ4Biq/95U0SNcauR1Pcfq03t6Ms/HvlGIISAsa5VwXXbaeiPS3PgN5QPQGdy6EbcHNMphM2K3DxENRMKm8ltnRd/yF1PHgWQ2Cxckn+o9nkAcoG/pP/maXn2mL4qd9wGsmfWf2wKP3/o3Fq35CR/JSCWP8eBWv3qAImBsCQ1DlPZ1veErO21x/OSN363U0t8G8/Rw1kbKRC52x+bw0P0sZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prXitb9VmFyu1Stn09SlA17CbeW+6mCPB+vTer0PBZY=;
 b=XPoJxsSRwyRNo5IdrNmZQsMw/Gpa2k4QBdlp7LowJzNH0q02OlB+lnD9XoNjsoXQmNnCR9w7Pit/bAVPFekPRzfgk58HrGw1SUzS9CmDLQg+iCTsxQdcmuEdFbHGtZi0xd3ErpiYl/8nNQJTLRW18UE3csmRn1qXvB7GQWfqQjjQerzvq365nSJbvIOe+IMCwoc0n1IJoQott7BcgLFykxyBOvp98l1d6ZIg2ze0FjMW+VPdLc5ZAPkzsG7KBdaIKf90aFSJo3kj9Nv1lZJAln2GpBR5v/2O2LEArw+7k/pvCKkgmvJiKUBpngyS1GC4flM4UJ6I65qgJ9PHrmLRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4bbfb15-1771-3083-74e2-141c219666ba@suse.com>
Date: Fri, 4 Mar 2022 10:17:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86: also discard .fini_array in linker script
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <2a9061de-3d68-20f7-75b9-b1b9491342f8@suse.com>
 <YiHUgkdkp4NFW4Lz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiHUgkdkp4NFW4Lz@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0066.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de681b05-176f-4f16-2d46-08d9fdbfcb24
X-MS-TrafficTypeDiagnostic: AS8PR04MB9096:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB90969845A13AE6C7F59C65D5B3059@AS8PR04MB9096.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/X5c4ev+ocqAyuZPK6LqVJLv4EgmRx6kMD/nU4yi1AP2g9ZFUsn6ZHMBZtkSmJ08I5awy3HpLefsbl8WydtXGupfvitAyTb06Ic/Kc/piJqUkyzB+a9X/jb4BFKC4+vm9mOkySDOlW1/NCotR+YrSEXKBIJB5jrJF4MLobt7vMTPgBw6nRI46Vp1495jjdwFkFKTPU2KUDLfwNIf21+N0ean9INAhXVGqKqQN+rVzz5RZbA1aHiLJvMYNmo128U2EJTHv0SttyNJp+Vez0qjx/z7xfT7uWD5606xQmLjj71+0kipkx2twgcATKYZaEYLa09SOUCIzLkorLS8srnEvzhEdslkvLklgbYMPEjYlRLskPD6QbLMG3ZbMDZXXGu+2z30/ZjGCWY+xgvfDvENMdo6SjVt1Ipf1X70IKfFu57F5xbswPiKsy+ti9A0u+W88d45L/BFKhJdMdtNhus3GBPk2LyRSLWmnBEa8GNEg4odyEQc0JeCvP8Q6+PC318WzTFSEJG35+oC5JixxRBNuzq0U/7l6sSz9KdiZLsiJYl7VJzQlyoYbxBemedvbQHfa3Z5AFGVDXfV5kxB0HmsYXub8yxfHOSdMCHc6Si3iIZcwySlNcW9H1RpPnfjNqorGKgbgW/P6S9Eqx1LdQ0eY5RweLbTaVzftUb39hk3Sd7WIZmnftFZYGU3o7GKaC1IOgBicdT1MSlmMVPNe9eQhM1Z/uYFPbUYhpXLdWLJOeS4Xff6zGLGJ6J6QjX60bkwag8nYellmvZGS6vX5XQ0eg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6916009)(31686004)(4744005)(54906003)(2616005)(6512007)(66476007)(66556008)(316002)(36756003)(186003)(26005)(5660300002)(66946007)(38100700002)(53546011)(6506007)(2906002)(8676002)(4326008)(6486002)(508600001)(31696002)(86362001)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2xY46n+vA/pIxoQnznBXIM8ATEcSthPZ7LNJewKiqs+1Ekn6YB9PraCxTChp?=
 =?us-ascii?Q?tRJdMlPXsNF76hqeNcCn75wnOgndGtZvqPb7y9aZPhu40oOCMJU86RZWpPMB?=
 =?us-ascii?Q?4+GGPqKuZV1Y9c23E9EFp/Y7tXJOmxdFQEPAdyurhr6AmqB9W+d2rVqbbIvg?=
 =?us-ascii?Q?bdQwKAD0E3iIS+9oTMXAmEKcaf3qoWRB7zXPSRf57VlQNE7FHCjWzDe1Y+y1?=
 =?us-ascii?Q?KggA0QcCmPEYJohYIUTqtTNLQh6ke/kRNuUxOavBUhh4czgXcKHS1EL62V4f?=
 =?us-ascii?Q?1EuapqlVWhUGnTCPaCGMSJsLug7pYCRTTon9ltlu6HgFZXA6KyAeLUGqEq14?=
 =?us-ascii?Q?fHaekY8F93MgA1cmhuDr+EpDlie9qmXSnTiYio2Nez92bh1kEO8bHAF1egbU?=
 =?us-ascii?Q?dgeKwER7A8eKppiJIJftucg5AnAcKqtBVRnbpvbrbSsLaScjk61MrXDwGeTS?=
 =?us-ascii?Q?k4FxxWtWehr7bLIQ00qrIKGznuADieyV1sjAbhhPUunQtbsBwwd7GjYBF+mV?=
 =?us-ascii?Q?hbs+SveqQU0oOTlR6jewMaYWnyB0u3cmHG4H5WVQhRj9p3FaeeOkBaXeUo0E?=
 =?us-ascii?Q?nspE48mkwN2QivZTnUJ3nw58YeounnEEXbF2G+mhT7o/YDxd4c83InFRd97Y?=
 =?us-ascii?Q?JYdJfkvyodlIwmqdL3sJQKN5SZMGh/vbdZ0ywcmxOZ8/VtCn7KvW1/QxkjZ6?=
 =?us-ascii?Q?qKaEaLSxhWRaaavUWWcA0/Kp6WpZoERHGoLof8ypm6hF1CKVvS3ElMHZ07rK?=
 =?us-ascii?Q?cBh2joDrrDDnpoAAda5RoEKOP8hIcHmRqNmbewWmDl0RXTsc5tcItBkIp/k3?=
 =?us-ascii?Q?0k4K+eFwWNPwBqid3+Vnkbw+UdbXVepqD2TjVPQ1FcTcD2FsRLffIg8tMIWL?=
 =?us-ascii?Q?DH61aq6kV1TpCVwDfWZ030wDLeBlgP7N/5TluLP/ISzbVrX4ZuKxrudodSOB?=
 =?us-ascii?Q?Tp/rm1oLmu+CbBPLLIuE12NqgDnA0p6PH+2EsKMtHD9J6N1aitv3Tj5RGrxM?=
 =?us-ascii?Q?1qLM8R7M8fRHFeoLWClN4rsu8vqEcaRPsNwiDX65P7XlyCctVWdE55lg60lX?=
 =?us-ascii?Q?bFht0jCP0Z8LMo3+BekahKnb2noWr1zEaEzrYlG6iV5y1nRBfBCzJVFOSHqz?=
 =?us-ascii?Q?mko3Er7j1fEG9uHIRqs6WY64ttStFk+vH8tW67Nj4zZHw8Nzj0QdRCfHEgsi?=
 =?us-ascii?Q?ceKNM8veRPU0HWi3XrHRRaFqdpvML3+1tYGWuy0VKNNEdsCoB50e8+/OHfy5?=
 =?us-ascii?Q?9Q+r0cyhCbAZKZyv9oHebbL8N6G/5AJ0/r1by58rcvVun/DEBLhqlLGAxLxS?=
 =?us-ascii?Q?Gficl46IJzQkED6vDKnkFPFIGnVA6c3ipNU6nI/9J5cCbb2l2HxhyULNeNlN?=
 =?us-ascii?Q?1FDQkRYA989HMbn97he67/9WohkbvZJtJ5Wvto6zETvyyOOayAnZXJT/HsX/?=
 =?us-ascii?Q?A+qrDey5J6PpZ45X7J54srpDn6Q6MJsP110Qt/Jov1vBMTY7AVHg3W8pTRj4?=
 =?us-ascii?Q?Q6KsmwurUYYRVHVl2AAWeSIXih96ia4nSBps389GpW/kKiyxbAnwjC3Qokf0?=
 =?us-ascii?Q?LKdozTHDPtD9zHOoJhs5fdd5mdaoYKwPaDg7GTwSUQOzPxV9sNmaezEa9Ijk?=
 =?us-ascii?Q?VT2AwTs9Af0d7lCQEKTXCuE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de681b05-176f-4f16-2d46-08d9fdbfcb24
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 09:17:24.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMurdEDNMmuMJNkpHA5O91fRF3P0Ms+grwiaKxLHFvYN0xjpwqG5+Am4TAMPpIwlZhiO/vnJGiK/aHanQfMnLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9096

On 04.03.2022 09:57, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 04, 2022 at 08:49:39AM +0100, Jan Beulich wrote:
>> This simply parallels .dtors. Both section types can reference
>> .text.exit, which requires them to be discarded together with that one.
>> Compilers, depending on their findings during the configure phase, may
>> elect to use either model. While .{init,fini}_array look to be
>> preferred, cross compilers apparently have this guessed, likely
>> resulting in a fallback to .{c,d}tors. Hence we need to support both
>> sets.
>=20
> Do we also need to consider discarding .fini? Or that's guaranteed to
> not be used by the compiler?

I'm not aware of it being used anymore; if it was used, we'd also need
to deal with .init (which - logically, but not technically - would
conflict with our own section of this same name in xen.efi).

Jan


