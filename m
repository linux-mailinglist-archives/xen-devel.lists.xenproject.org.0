Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3E350B10A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 09:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310701.527624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhnLe-0001G2-MF; Fri, 22 Apr 2022 07:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310701.527624; Fri, 22 Apr 2022 07:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhnLe-0001ED-J4; Fri, 22 Apr 2022 07:04:58 +0000
Received: by outflank-mailman (input) for mailman id 310701;
 Fri, 22 Apr 2022 07:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhnLd-0001E7-0r
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 07:04:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83892692-c20a-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 09:04:55 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-BlNjzlMIOiqa5TkW_rwQhw-1; Fri, 22 Apr 2022 09:04:54 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4323.eurprd04.prod.outlook.com (2603:10a6:208:58::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 07:04:52 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 07:04:52 +0000
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
X-Inumbo-ID: 83892692-c20a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650611095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yax3tILkwXc8VPvBbFmXqqs5HeYzHB4zMFLmBxlChQQ=;
	b=UXq4WLkDjkvEDQf+Vdto/MqkBZTvKMMJlL7GH+1njxj04C+TwA2/413TW+xAnkHTeYgbrT
	0ZUjvFsNVC2fL1B6waim4N2Dy7L0kkFEFk1jwuSBYRBUFDOHnUNi49o6kqwagcuRyPM6ZG
	B07b9S1l4JnM1SLNy8nPdELtQCklwW8=
X-MC-Unique: BlNjzlMIOiqa5TkW_rwQhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUE3rls7LnoAAWDLC5pa/zhnUYNl8qKQcvIa9NCEj8mtKZ4h7E+g4WQ0+1uBmdbSs3PAJ7UrL94uieR/T0KvZ3MgVuvIOhGJJinebuLUV4R1wABpJPCOUORmVvUAV62cvGa2+7I+w+LEl0m2xyLMvgXszZiezDUVg48h5+zVVKaS6MGULHsqHcPFTFKOPdjxJrwNolWH4B2QEIefMU423VhgkUyx1Q/lpnFHKosoSco1OCFKA/asioyOUbw4eyByxstF1fKIwfL5oaYwjMgXbn7pFu4IonLckRx5fxDeBN73eFnct4mtcWMJO6jug+PFbeSlIchsDnVeWIIWlaQRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hmD/s1ez1XCcUlh9effmB5B4jmOpv8hHy1p5xn2eW8=;
 b=j9EfyFQ0mY2d5gb1gN5HTo92RxW+jVLcTRw/LrIYYbgCMxipiuwbKho/70vAMdaOhkqmluIcI6V1mY79858h54avOr9S09iF/cgGpSXkZTWlw53JMlZGSmwQvd6GrDE3EebWvVtILPJAs28fxMcOjjiTjSWvK89fZbvKTZdjEpfxhfPilLP9521B2fgCCmDdKfK+4lFFRSNGo33wCbQBiwXvdQRPvtJKe3Tu4kfjFBzvZINIVytc11eJqbbQLqw8DbUwamom8jVOdupBnPT6jAP00uVmCIWPFAdS9QzX57L51OfPIsyPU0Xn+TgWW8i+89MkOQ6Lq5L0ZEbmZDzdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <335fcc84-ea0e-b250-11d7-a07e4bdeefeb@suse.com>
Date: Fri, 22 Apr 2022 09:04:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/build: Fix MAP rule when called in isolation
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220421160039.24564-1-andrew.cooper3@citrix.com>
 <b03098dd-7fd4-ed91-cc94-35fd24c46126@suse.com>
 <e563c62a-622c-15dd-34f7-57997132649d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e563c62a-622c-15dd-34f7-57997132649d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0045.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d80991f1-e574-4ab9-1570-08da242e65dc
X-MS-TrafficTypeDiagnostic: AM0PR04MB4323:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB43235DF36B22C7D23E9AD237B3F79@AM0PR04MB4323.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p9znMFzoa0sLFHvLM0Stos7jhBFbj/mBP/0D5NybC9OUqbv15JwzLBNxe9dNt35E5LhA7uOFN97c7knWHoUzyeTClLe3Jl/NfFRlokhijISK+C1FYpbzIDxC1yDRSHuM5TB7SoUJFyCPe0phfO1Pzq9T447m3CfZfp14oQLtOQRoRuBUodLy1P6su8tATiiIGKN2KGlCvK4ITNf2+JnY6Q9Q5dmLoCMq+Bn/wHZPf2vqotkD/u0dwEKRVKDvwBREuQOWBf5S59Y/D+96i3DN9t3En7EYQojacrd17NFsXcde184zIr1EgDjyuwACANlFh47fyNW0452bfCNk0GWlYLVP4eAM9GSTfiwGFYSTUdpMp8gCMHJhuTMaNbHB7ZpDHUcRntMIGST1KPoPXAZQsNKuyl+JntnSUvmPGrY1RdRwTjJrMbGI9/rXvWPs/L0L62927hw7qtYBpJZHv6MeV4XKib6UEJvbfLlhdZNpNTTbio3uIUsMiF1Zp3t2r64Eai05EaYfZBNxwWrcXi2z38zEwUUpzXbQTyXZK0uD9WzkdtaY9RiVbKIVAAScAqXxFQfjmDlG7P9ReME+Rpzn3wGVAa7tyFOHrdCf49Ch8pCEMMvErIezivJHtgkEJLksEMagMmgokyqUxy5tW6V/dF+4nZ2A6B5CfzhZirpXz4Q+M/7yArKNRATX0zypH5/MEEj4suVst2ItRoqknq+hWeq3BiwBkH1uX/VfRba7CfBJljuXcERiwv56oM7l7Jf+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(53546011)(6512007)(26005)(38100700002)(6506007)(5660300002)(2906002)(83380400001)(508600001)(86362001)(2616005)(31696002)(186003)(31686004)(316002)(66476007)(54906003)(36756003)(66946007)(6916009)(66556008)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0gLiBl2EHLm5H+9LgoytnfcnG6JYCvLXL/dYtRk6oQzk8+73Ntp85vgEjSuE?=
 =?us-ascii?Q?TVFdWMuzBUIxoL7GDBA70cyLbyn4GC8nG4xDIDFd6Bv1ErqVsYgndPXX8lIV?=
 =?us-ascii?Q?J7J7hYNe1s03dg3LQHPUIEBgosB4yPhKNSUgvmZow9Oq+4FxFMrQP4aycmxF?=
 =?us-ascii?Q?VW9RGaCuoZ0YHqKtkYOLaTE+XdQ0PUMPF/hyXug0ll1Nu1ojl8ZvsxqA50G0?=
 =?us-ascii?Q?g9bT97nnRygOBO+n59fezHzCa6PdHDp+u9hafmu4u/W+or30K3To3ECcSOWV?=
 =?us-ascii?Q?29iAwC6AHzoVGKNkNHW2l65AtHNAK5LTPi2a5r7AEZ0W0Z3xc5v6KcDO9Z/O?=
 =?us-ascii?Q?OOsDKf+qKZG4MD7dQ+1te3ot48MVlruKjVwyUXQm6dHQTsdWAY6UVgMS30AB?=
 =?us-ascii?Q?uzLC+csy9raBD4iipYTisrlOWsJqTb1PN+UBKyoSP+d8RbfPiztrgpwBzo6O?=
 =?us-ascii?Q?uTwG0MSCL4j9LwexA8BsiP9QqZcrEVTffAU31nsIMna78yLEzT4wJmGlx0KV?=
 =?us-ascii?Q?8A+Wam2yn3Rx6FjHNgNRfWvxVulhfZ/x2C6IvhpkPvUDdnlWntyRUSkHKZK5?=
 =?us-ascii?Q?QDOIeusJJ44X/z7R+7PqoAfmn77Ih17l1DdoQRPF06uTM0VdMhuuVjgnjylo?=
 =?us-ascii?Q?R5CN1JPBzArWx+uiz950N+Jgej2+pvEwAbzv5nYMVDEWvBL1o1A8G/XkxoSu?=
 =?us-ascii?Q?E0e1QYJDYHnYXWouksSOXt4XMovvMoeEs9OE7Ff/NxfEyKsTb25Cjr1zOVF4?=
 =?us-ascii?Q?KYBOSR4XQQVdyL4LiUaw99+65sAf3HACosEQPVWdUIWzx8djuzQsmlq57nk3?=
 =?us-ascii?Q?v0k1scvSr8jImM9/B9LDooCrtCsE8/v0FoGB68C/wtl1SLznhA0bk+4E8gOw?=
 =?us-ascii?Q?of3yF3Nd4QREvV44zu6FMopB4zX8EFWWY3ZWlb3Uf8CFqTnf86rqAQLUrijh?=
 =?us-ascii?Q?7le5VKIqod7Zhj++oU3qHOSXdY46aj315URxZfd2zZu0pVmIlQsPpHM9jNI/?=
 =?us-ascii?Q?7B2hTkoQ3BY/wdMipuTvQlSqApKoZXxAtktR/E7RCXogSc5hzPml3TkQYeZz?=
 =?us-ascii?Q?12ENTohvBpRPZNm0/dfLw/qKm5lEnZPWp4rVs1eWcATxoRHKVOAX9DKCeiBf?=
 =?us-ascii?Q?w6THywt9AoyNkyssU542sdSP/WPza4VIe7PDi9fgq5PcrcTGRwqNZGoT+ZnO?=
 =?us-ascii?Q?K3ymQCaCdTd3emKvoUb9WPw11/xbmCuTkaG/HoacNaDoKn2PZZPUO7/13kQz?=
 =?us-ascii?Q?v3lddTpmGrBphAk2TIN1XEmViLrR+zD9ONsWBMY/ly0vK6acsFSkG90eayww?=
 =?us-ascii?Q?r4Ey3n3OVzQ52jbgOYpLNzy5yAW6QSbi6OAcDax7kQdCaopMMFOZ9cB4B3E5?=
 =?us-ascii?Q?mULazxJ0SELuAf/6Qd0EpCAzQk62giIC1EVpotMg4aelbByft1Skw3qDkn1M?=
 =?us-ascii?Q?yVrC1n+kIN2dGqwkCYVzHKBl1bbTQUY3t5n1T/CgCB1H/bCPM5ZCMshR9E7X?=
 =?us-ascii?Q?d2EvJS1YJUPq6eNovo0/t8kfkd+z5cfaBVIBy2FUAqh5LUqweVdN1uvMgte/?=
 =?us-ascii?Q?OzN6mRwI8SHB3El1OpiNegPwq1mC0itKEIt/KR4U3cxjW6SZyV3r9v39sJoA?=
 =?us-ascii?Q?E0UwIhEmKyyB+7Gfh7fZj9p2bq4RqxipcuokwboOMF5r5/7bDB1JK8scUP3e?=
 =?us-ascii?Q?H+T7W4C9hm/4ewr5c64wojTfRt/u9jC5UyLRDrhQMAPXtB/GLmAbC/ED8gO0?=
 =?us-ascii?Q?F3W622zjwg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80991f1-e574-4ab9-1570-08da242e65dc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 07:04:52.3926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVq1OxrF0xqYI/M3qzSYwInAoAlkJy42rYYCJpdoDo9n3cMAP3XVoauBGHPTeeYPsF2QpArcTO6kzHu/1RCpeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4323

On 21.04.2022 18:42, Andrew Cooper wrote:
> On 21/04/2022 17:09, Jan Beulich wrote:
>> On 21.04.2022 18:00, Andrew Cooper wrote:
>>> Now that `make MAP` might rebuild $(TARGET), it needs removing from
>>> no-dot-config-targets.
>> Which raises the question whether the MAP target originally was
>> meant to be used only on an already built tree, which would
>> explain the missing dependency that you added in the earlier
>> commit.
>=20
> I can't comment on the previous expectation, but the fact you couldn't
> previously do `make -j4 build MAP` was simply broken.
>=20
> There are also several other breakages in Xen's build system which it
> turns out is forcing all downstreams to bodge around in ways that range
> from gross to dangerous, and which need fixing for everyone's benefit.=C2=
=A0
> (Emails will be appearing for those shortly)

Right - at least tests and cloc look to have a similar issue.

> The current debug target (just runs objdump -d) is similar to MAP,
> except I don't find it a credible target to use and was planning to
> delete it.

Well, yes. I wasn't even aware of this mis-named goal.

>>> Otherwise the build eventually fails with:
>>>
>>>     CPP     arch/x86/asm-macros.i
>>>   arch/x86/asm-macros.c:1:10: fatal error: asm/asm-defns.h: No such fil=
e or
>>>   directory
>>>       1 | #include <asm/asm-defns.h>
>>>         |          ^~~~~~~~~~~~~~~~~
>> Why would this be? asm/ isn't a symlink anymore, so should always
>> exist. I would have expected an error about .config or
>> autoconf.h not existing, ...
>>
>>> Fixes: e1e72198213b ("xen/build: Fix dependency for the MAP rule")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Anthony PERARD <anthony.perard@citrix.com>
>>>
>>> Backporting notes.  The original, e1e72198213b, wants backporting as fa=
r as we
>>> can go.  This patch is only relevant from 6c122d3984a5e onwards, so 4.1=
4,
>>> which is why my main developing/testing on 4.13 didn't spot it.
>> ... and the commit you reference seems to support that expectation.
>=20
> I haven't spent very long investigating exactly how it breaks.=C2=A0 I do=
n't
> think it's important, because the purpose of no-dot-config-targets is to
> skip large swathes of the logic.

I find it generally helpful to understand breakage when it looks odd how
exactly things break, but anyway
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


