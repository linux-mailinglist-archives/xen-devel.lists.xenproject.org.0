Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E33A4B9C91
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 10:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274573.470083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKdWW-00023M-Uw; Thu, 17 Feb 2022 09:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274573.470083; Thu, 17 Feb 2022 09:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKdWW-000213-Rl; Thu, 17 Feb 2022 09:56:28 +0000
Received: by outflank-mailman (input) for mailman id 274573;
 Thu, 17 Feb 2022 09:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKdWU-00020x-RH
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 09:56:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de779bdf-8fd7-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 10:56:25 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-3eJVzCu3PzG-0gDMCGJo_A-1; Thu, 17 Feb 2022 10:56:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5336.eurprd04.prod.outlook.com (2603:10a6:209:4f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Thu, 17 Feb
 2022 09:56:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 09:56:22 +0000
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
X-Inumbo-ID: de779bdf-8fd7-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645091785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=65MJJRs7UlTXYknN+AoWyVdia8q/yC54n+4Kph5kFC4=;
	b=KuaW5IXuK4tgJNk+kbmN86Qrbbv4/eME0dZXpjKE6/fYSFyzHuasaMRDpp4g0L8sXBnXXl
	zxrkjx1YCkaD3bw3DzD5KrNZJkmtNadr2Jrn+SrudhON+dQiOKB8OjytBo+56w+IKuNI/P
	ck1Pt91mwLYhqF5xpBzxj1TjALpRlnU=
X-MC-Unique: 3eJVzCu3PzG-0gDMCGJo_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWrGjO52+3uC5JELaXbpamcvAmBqVT3CZxB+ulO0qxaLJ7UH9z2BWroxQZY7OrvXq33ooeWPUUxnVHevQQGKinJf/M/w+r7KRbBL32fPAV+17FoX3dt5MsZp3oXHqSVHsk6AnXAWlpDQ7Y2ueBIlP47oDj/jXwWj3yZey86VSUqVDt8q7Uf5PC4pDPIKe7FzikOwLhl2f8zRdce40X5AlQlPMUCBLThPNYvC6TfxTOsHCIqVndmpkBNXmYszra+S/31258GGs20acYdFlP23pkcFWiIS+2hS7Sc85yIL6gkXM+IYTlofkDRNQ0EApaGe04B86M3AaBnYlgPdjIOODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gekqWGqOBjPGU1p+uQpZXjt//QFLg7yP/cvraATeqBs=;
 b=e4miC+LMli3S9BIUbNjGmPBJwMrdcRiwghT6pKViohNSxydwuRVIXiyg0MiUveF5teT2k0rlDuPXb/yzMxJED3orLvIb72CAxZrzVUxn+Azx4e3cIFQ5u6+1STqJ/s8QRiBF56qXwokxXMeoBhf8GLDW0U7kKwNULugKkoB0FyEgdCtCKA7AijC8xEiVLy0HXCkkMAb5ahsLfNbrZm57l5ZOUZFTX+2434Gv+iqWL3PHakhfBeNb9nDRJiaZq0ocjKlxWWjTbleE6f8BCj2xkHT9aYcAVfZPAHTtFA0fplI9r5RuGK/49+i/JapOYoB/1KRIfMSEo4GW3GuGPRZ83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53c10ff6-ca7d-e332-72b5-593203a5303d@suse.com>
Date: Thu, 17 Feb 2022 10:56:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 00/70] x86: Support for CET Indirect Branch Tracking
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <c471dcc2-8a91-60b8-ba5d-58874752e4d7@citrix.com>
 <218de2dc-6dd8-4e13-3288-36448e47de7f@suse.com>
 <8c6dd7d0-11e6-9b8a-66fc-f1a4998c074b@citrix.com>
 <83e15c5d-f48b-a6f2-ebca-e416bdef1093@suse.com>
 <9bcbd2f9-f713-cb56-abdd-baef5180a964@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9bcbd2f9-f713-cb56-abdd-baef5180a964@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 685c0fde-0dfd-4b93-3066-08d9f1fbc0fd
X-MS-TrafficTypeDiagnostic: AM6PR04MB5336:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5336B8E18FFFC9047B0C3065B3369@AM6PR04MB5336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y8w2fHGvo3YKIKdUd7VOos16GYb459Fx2Tv4c6FeYzeQD2cxOn6f/CiB1cEwksOF30wkrbj7HOoeh8cyqOLJiaUvbSEJrNRrld4uAgpAgmiGlyRzPLWNUTJiWQ48L9piX6tT3c5YL1CsqVDa88axrcme6ItEGcbdAixnrY6kLrd/r6OyCctqVly5qrWvly78XBj10F6imMHHtVp+0jvMyApR8t82iJncMFO77xKrsJ6Tz4hHu7Z3s9US7tDl1bW2y+kpo32sRGnc0NDeJd3IolNpX98KTyMx26F/N/ymz3o0qchdWS1NED8+9CVgkgRYdj5hgGewnkTizoULkypw97rRlAOQELXxNsyC1BBpxr/D7cY8dgjKuM3sphK0Gy4z8r3ewrWxpDLYZT/k6vF0a4sxnx+2FRK52OEgKKvzJIAen6F43uIPbV41on9G5rm+ht8b8bUvMY7y+gssCxk1139eiBui9dCI/CPxJt4o5ScWL7FcFXXbcFioH/o8IZ5JCGOzbglxuvVizKMpcwW2HVEifssqeG0487JtDA4fBekhX9vyFAhmlUIpJ1wotf4aBnIH+CpxkxgBlJlEmCrJiR/YlNFl17TcfS6co6jGgbhq1CUc9YM92EedIPUOxJc9gtkTpGR6j1Cmxa5XHIu+JyD7xaPGG6U6iAo5v45b1myqAYV6mUja8COkfIltIRsjC6Y1Cv9hXFUbV/LzYOix11H1wlxQxglflQz2QT1B1pAgpRNG/OZX6RFzCp2OhxgTLENWhtpy7nn2cR5l7RFGZfdaV5IakkZOqivAOTsSPK3FJfsdGZQK/L7LZ2OOd5hSS19Pp7R58svhOB5QP1wT0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(508600001)(6486002)(186003)(26005)(966005)(6916009)(86362001)(6512007)(6506007)(53546011)(2616005)(31686004)(4326008)(36756003)(316002)(5660300002)(8936002)(2906002)(66946007)(66556008)(66476007)(8676002)(38100700002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YxkYVgluruXAmbTm4TCX4xoPfyiVYfwypG8HcmZH0Ss1DJxjfOgjzlJCP3+t?=
 =?us-ascii?Q?aA8oWvanUwwA9AC+EWSM5shVIyZcFkvt9vxI/JU8ZnapLasiMvudml+8eBwq?=
 =?us-ascii?Q?3w0NSJqG5+Py8PorCjDS0PTWYRAnlX+2ILk+iYE6cNFzhFE16aR3g/Slrf7d?=
 =?us-ascii?Q?Aki6j2Z1A2MMWd4//9MIeXhLKJPblE8+UMdpesFwDnF8NMyh2sZA2OtX+IJ4?=
 =?us-ascii?Q?sKWnEiRDLXlNEzCsk+zuflef8IJoT4fq6OaY7+ASLz1dDSaA1sIDs8aH7mug?=
 =?us-ascii?Q?ulg2GQlypxqsktO6GD2h3HsM9jkzApgRBz/7b/uJzSQnTlJTg+FdnkwFvlLV?=
 =?us-ascii?Q?GdKSUsxbnSuTbpTjY3GiM9sTyYeWF0RzrpK2gjRFBY7J/SCw72OvI1F+Zf71?=
 =?us-ascii?Q?QUnvpkL6UzV4HDu2B3RlNDHkFHMkOvHYtpaDh9cENLqmV9ZtLGZpDcQwEGrm?=
 =?us-ascii?Q?ClydQPlLeGPKFu72EsSGxvQ0S9va6A6YFGScAXhhH26dwB/j+7ff1+UDLzPF?=
 =?us-ascii?Q?QsU/CNQyz/rIO6Gul4pWubYSxqkwDreWObM9whuNhj6LeflWbsIT2H1mTbRA?=
 =?us-ascii?Q?9s0QNqakpLmMtGz5zHC2iDLKCrYo29XLy7D/DqPW2e1KTQmsZRQAC7dsHy09?=
 =?us-ascii?Q?tcn3WCnDEcb2T4Y+SwSNl+3t70phtcaXqIpfcyQ4KmyG1+7yzz22v7XYEJai?=
 =?us-ascii?Q?YUPNm6ksDZ8bcMybfPMlfixUlYD9FIrBxFKoGVXMlu4j1VC7THZC/48ZXjLU?=
 =?us-ascii?Q?M0xroUt65hqwlBxR8efdovcdMadKPm/Ryb61k0fjGnJwUvunIvNC5AoqqQ8Y?=
 =?us-ascii?Q?HXHh4k3tjmsJFl8EXc6jtcHB0apra9mxF2SaNX59FII7OLK0chvsFAGuXkxG?=
 =?us-ascii?Q?OEoa9nqgxPu9yCtFxTW8M3n7v05spbvbfTxdZipeN31CtskMbvQ/hJSxSis2?=
 =?us-ascii?Q?iwppEk/dKFKE+YQSyqLl+AhZPmhZkezyEpjI576ROIvmCdsRuJmognpqpx2N?=
 =?us-ascii?Q?Vw1VXMPTRXGkKHlUDgaaKDoy1eEoXkf5KUfZBfXwnAiP9y3KK/rU/9XlEffo?=
 =?us-ascii?Q?UMwvGfdBP2iBRby7vVnDpQwbdYu8gFoMjZ49H96lGNGlqdU+uPBCNfsr/V5V?=
 =?us-ascii?Q?hCcaAC0ut4Arx1o1O+VTkWoBxiSt4lDENlzDBQNLnAwy3eLV7OHeh8YCfr3d?=
 =?us-ascii?Q?abWjyRTgG+C7aoC0+udwhYlPmg8AuJSwNoiUssb6G4JcqTbyNcE4M+yGlfN/?=
 =?us-ascii?Q?CJSsqe+Au7EoyGzAOTlXwICx8+CxjM0og2RaNvtjtyjS/9A8gkD4tx8Vqfw6?=
 =?us-ascii?Q?THvKgtgMqBLDjVRDVpewf0VsZlD4aCrqAa28aPuymhPdEy3+33Kwwm+aL18Y?=
 =?us-ascii?Q?Z1B8R0yiwgT29/myO0T0ziP1LzG2vGZ1kb4+OhUNLeKcjbAw/wpJM6Lhxt1d?=
 =?us-ascii?Q?aOi3kkQPgJ32/uOEUljhxHxyO7FMkpj7R/Hn0Vv6+6bWPwUP7sQOddJ3ouxr?=
 =?us-ascii?Q?0+L56A/UFqrX+LcPHmLKXnCGcwuQeXmTqK2LUI/qLUS/TXvAMswD5WFMPXqJ?=
 =?us-ascii?Q?4FXQFRO3h9afHzUj7x5gNfimoZ1o5UV/uZvW9RevK3VlAU6tNLdXUv9stZrW?=
 =?us-ascii?Q?NzuA5y1Mvfa0JJ30FX2zwIw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685c0fde-0dfd-4b93-3066-08d9f1fbc0fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 09:56:22.8102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6dt6YzTJWbwo2qj/yixmbS+4W9lMrcqNprD3LnhGsgEixwxyPEyRZ8JldiAPXjFVw9mX6fopukK8P2cBAf0BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5336

On 16.02.2022 22:59, Andrew Cooper wrote:
> On 14/02/2022 14:38, Jan Beulich wrote:
>> On 14.02.2022 15:15, Andrew Cooper wrote:
>>> On 14/02/2022 13:43, Jan Beulich wrote:
>>>> On 14.02.2022 14:10, Andrew Cooper wrote:
>>>>> On 14/02/2022 12:50, Andrew Cooper wrote:
>>>>>> CET Indirect Branch Tracking is a hardware feature designed to prote=
ct against
>>>>>> forward-edge control flow hijacking (Call/Jump oriented programming)=
, and is a
>>>>>> companion feature to CET Shadow Stacks added in Xen 4.14.
>>>>>>
>>>>>> Patches 1 thru 5 are prerequisites.  Patches 6 thru 60 are fairly me=
chanical
>>>>>> annotations of function pointer targets.  Patches 61 thru 70 are the=
 final
>>>>>> enablement of CET-IBT.
>>>>>>
>>>>>> This series functions correctly with GCC 9 and later, although an ex=
perimental
>>>>>> GCC patch is required to get more helpful typechecking at build time=
.
>>>>>>
>>>>>> Tested on a TigerLake NUC.
>>>>>>
>>>>>> CI pipelines:
>>>>>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/4704=
53652
>>>>>>   https://cirrus-ci.com/build/4962308362338304
>>>>>>
>>>>>> Major changes from v1:
>>>>>>  * Boilerplate for mechanical commits
>>>>>>  * UEFI runtime services unconditionally disable IBT
>>>>>>  * Comprehensive build time check for embedded endbr's
>>>>> There's one thing I considered, and wanted to discuss.
>>>>>
>>>>> I'm tempted to rename cf_check to cfi for the function annotation, as
>>>>> it's shorter without reducing clarity.
>>>> What would the 'i' stand for in this acronym?
>>> The class of techniques is called Control Flow Integrity.
>>>
>>>>  Irrespective of the answer
>>>> I'd like to point out the name collision with the CFI directives at
>>>> assembler level. This isn't necessarily an objection (I'm certainly fo=
r
>>>> shortening), but we want to avoid introducing confusion.
>>> I doubt there is confusion to be had here.=C2=A0 One is entirely a comp=
iler
>>> construct which turns into ENDBR64 instructions in the assembler, and
>>> one is a general toolchain construct we explicitly disable.
>> Hmm. I'm still at best half convinced. Plus we generally have been
>> naming our shorthands after the actual attribute names. By using
>> "cfi" such a connection would also be largely lost. Roger, Wei,
>> others - do you opinions either way?
>=20
> My point is this.=C2=A0 Doing nothing is my easiest option.
>=20
> But if anyone has length/alternative suggestions, dealing with them now
> is going to be infinitely easier than once this series is committed.

Understood. My personal preference then is to stick with cf_check.

Jan


