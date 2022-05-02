Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF79516B5C
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 09:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318687.538569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlQcq-0007HG-LL; Mon, 02 May 2022 07:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318687.538569; Mon, 02 May 2022 07:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlQcq-0007EG-I4; Mon, 02 May 2022 07:37:44 +0000
Received: by outflank-mailman (input) for mailman id 318687;
 Mon, 02 May 2022 07:37:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlQcp-0007EA-Ni
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 07:37:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c01922ce-c9ea-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 09:37:42 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-4HEFWyyRNDeAl62HJ0Fcaw-1; Mon, 02 May 2022 09:37:39 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB9487.eurprd04.prod.outlook.com (2603:10a6:102:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 2 May
 2022 07:37:38 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 07:37:38 +0000
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
X-Inumbo-ID: c01922ce-c9ea-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651477062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9U80lYDRJxrrSIoI2s6OuL5i+2UezngJMNv3lyNou9E=;
	b=ez/KPtsJPf6GoOos3PpxYhen7S2EGYg9/brfevv5XojuLxSYP429DxSeJ2mTNM2XglhsLf
	5hW0qQJp0aC5KfyMogPgcVc8fYk/tOXj3gtMwiH7jULA4l4AyR3KMiex3IFjyJ+RwxsiGt
	nWTostjqc3MvQBWJ7Xz2SXTHzyQ3vis=
X-MC-Unique: 4HEFWyyRNDeAl62HJ0Fcaw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCndXWO3vXR2kbWjpnu6GNde8XR/r6g0qr6YTdIxmWP39mT373zLCPQ0KJu9cYM1xiw8Uws+5E0M5BTAbrziswLXUlN+4aDQ1aGHmpbt4YiQ7S2KQOvITDsEhKQUPpOuzkVEzZk3mLMZFC0xiRasqFk+ofMNlaEraJC425TNKtMHh50ThNj2J3odBx8EcLbwo+0aBSLzGowsGFLh5pz+QfIg0EizGidREz8y9kQe452u6qZ5NeKJpIg5hfCAKQ6VprD7g+ZuAIbKJzZuXB+MAP4+Wz/0zbbBNtOjsCZ9OU47t1i3xHfHSsgNsywW4EdfFgS9dbF1mANWr1S536LQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9lO1qkyybnjDj9mtZrOKLsdIU1hr3VAD53KczCI1W4=;
 b=ZIi4FkFA8Qn11ZgCnxODqoo+JIpKweSCa7LAxscAD7fSEF6fdbUm3fVhr9RHJpnXE/+UNxLQpCam27JvBK3x2inQLtMSq383lqx2RWQuC2wzfrWU39Ih9vSfbojoA0RYuxeAQfcCZDJaymO6zY7Uk1kEcOYhoTe/o4mDCFux9d2S9oiejz2ox2ieb8RrR5SYVEoVRtAcqrIYQo6ZZIIjmXSW73I2uKcKpL6mmZOQoFAbdsafORgvlPqBSZCEofvLaEcft4hsuyvq8q/pmd4uJAYeoZ1Y5a5SRp0KVFjcOgLxvkmicy34kVixk/h0oml0j00OEn8tGxnf6YLmcEW2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d619c450-e1c3-90d8-05c7-2896ab6320bb@suse.com>
Date: Mon, 2 May 2022 09:37:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <Yl7aC2a+TtOaFtqZ@itl-email>
 <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com> <YmmUtiBkhEYvXHUB@itl-email>
 <901c11d6-92f0-89b9-8500-4947bbdcd504@suse.com> <YmsbD9ktQqB4U33o@itl-email>
 <c9a57c65-05f4-b566-10cb-92ce9ffe9e0d@suse.com> <YmwbKwJh1Fft2F1H@itl-email>
 <7ad22939-1096-3d81-f998-4eaf1d9a1d8e@suse.com> <Ym+ETr34j8JC55hK@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ym+ETr34j8JC55hK@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0406.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74e1dbdd-5aea-469a-ab5e-08da2c0ea1bc
X-MS-TrafficTypeDiagnostic: PA4PR04MB9487:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB9487CB055848B18F4CA4E1D8B3C19@PA4PR04MB9487.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jZmfp2jRoXKdlFENwZ94U2khWJKXDhweXsgA4s/6gBH48B4/+s5I1nK1YiIHY5aPNlAJC3dXBWoLjCp5M6OU2CeBUzfNW93axVfofZOb2De31sZ8IDSSTiNv57/00UmV6O9w5VTYydQos3vmCya7yGWLpvcbdykQQrXgJ8UArXllP27s+WReoJ4IZo/0vDvF33lDXwg6H+JWNaQ/5i4rD6r3esIpWaEjZ/Ej1dH+1+MBpP/MMvC52XH8Qtt42M9a+wHnQzvFg7m2ItxFN0YMfOB5RJebiBjMlFDE54zTMiJEWTvbrOioMqx8CN75tuUmuwNrFzTw26IeWjOx3JIDb218m45BQz8inJO++1vPl4mnyhshWZkjuius5W4wdRCJlrDH5+EN7ORBVdVFVAh3jLr9ew1QGwRfnMIxKRbkVyT5GWdF+5S1+qthw8uw6OFs3Xr83wmHekvUBS7i8mP+m6GslJt3rZu47+Tjt8AL+qa1DNzBgqtILDENwIGWiSUNEHmaCLYhZUHbMOIasmcr7IuYGChjSvD17gsZnPySGN5ZKNOr7IxYCxbG3hr9mJPiFnLCZmG41KdY1o2GSy4SUEprUZrByN88PZhNEio6JwSrrgNtVxpcTDr9HDr9mqKU5EtRaEdn3LU41HaTql1qtet9ZwWB6JC70sgrmRaBQ6hKT9k8SvHQpNH8Gc6ABHl6EZpUUsFNxSePqNpMatJpmJqyy4CbuMOK+5IqJQsYjq6LH0BOzSHlkH+FAeLP0G1olyOlobolWlWiLhTcuQCb7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(53546011)(508600001)(31696002)(186003)(38100700002)(316002)(66556008)(66476007)(8676002)(66946007)(31686004)(4326008)(83380400001)(26005)(6506007)(2616005)(6512007)(36756003)(2906002)(86362001)(8936002)(5660300002)(6486002)(15583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phBzqM5A8hoSBBJY/89VYnTjqa+Rq5MvQXowvt4pZJ2KGUXlT1iWuaQmFoyQ?=
 =?us-ascii?Q?S+fIbEVlb0Ycw+x3az6wk6FBtx2/M8zmGl9bkQ0TZKcqgrFHTGaOboj7TzM5?=
 =?us-ascii?Q?ioSgXNL0032cq0WGWVby957UMZH1vxF+aKpZEpwX6H97a55FWUGAI+R+F34r?=
 =?us-ascii?Q?kMvRYqBQ45eNUs/8yVCiFR+q3gxgNkrQuRnCwklyZTU16d5cbgbks1NAJpNK?=
 =?us-ascii?Q?ZRMOW2LPIaqgPCRM2SRR/A9mpocxG3bSLv4UuiS5ItNtwlCumpema54KJ+lL?=
 =?us-ascii?Q?Z1WqGCFFaUKZiiNtjbtTyPZ1jZsUevOFt32zMGKg1+IWSyMYsrQvpTaHJej0?=
 =?us-ascii?Q?tFW/vHS0QmhSOdTGJTIMPwpjWpTfPIcX6j9TbZ96GTyVUDZxo0AoF4O8uOVB?=
 =?us-ascii?Q?eYWBEXsJLdiWBi2KDSd1FdVu8Fpu8cRy/u9GoZruyhC6KCxCvJZHm6v+NyYD?=
 =?us-ascii?Q?hxk3/hfi+k+mcoSgSmm0NE06WuW381x18R5rDdxDykxX5AcXEECXgCRA5lFX?=
 =?us-ascii?Q?fuR7yIMi6prR398QTv+leb8BR2oNGgeDixkOTiVvRBCreWTN5Pm54nBkWz9l?=
 =?us-ascii?Q?LRhUlce2GH1+Aefzu/oOCUpcDhRp2kzfbNbr0kbM06m9IN8Y3g8G0QE3rvC0?=
 =?us-ascii?Q?z603W2SI85RxAySnqp4MMH7drV/1TcyocPZLuQzKNQFFMMoutSmJZQo4zDCE?=
 =?us-ascii?Q?0PNlUXnG+MNQfE7DCYPi96DCusuSn6wTQA7xNd3hyDATSbJKFoAzJx+DAk+C?=
 =?us-ascii?Q?gplic3glUUCVdTP54V1gdi4nN2aJaNkLn11iAVH+//BJR6rjJfSqwlo7Y+Su?=
 =?us-ascii?Q?Gj47jPoEHm7ItXoSlvtjZVjJLJHGBlOk8KM/gU3JlBm0rxch+VRvh13rL+yV?=
 =?us-ascii?Q?n8J1PWVQsan0hSpjX7EPkq5O9pL7h3a4nBNnJS0RXIq3gDIsJCuI6npvzkrd?=
 =?us-ascii?Q?1N8NXI9z1ee/lKfQ8VBFOAcGEEmRscd9+GOTR81kfRsg7Rdu238qy/i4GMGS?=
 =?us-ascii?Q?ZMDLi54foJH49sAtEocr7XvI7JBqj8ycA2dOtypEI71V3TjQOk8z1OlmIKg4?=
 =?us-ascii?Q?CVDEPdfnWYrq7yLW3V2DqmwaJmyXQVko4WGLwvy3wX7IGDRd4bvGgeFmQunN?=
 =?us-ascii?Q?h2HO+LOU7bXkQ1z6n7RqrTtjGQeGJOyUpIvg8/XhqoBSrgbQ6gzWsKg3PhML?=
 =?us-ascii?Q?pCPYV5m2C4FHYJmCPPm70Gj+HOybu8Y2a2eVYJAU1Elp2wsDPt9cEcA+x+VB?=
 =?us-ascii?Q?vA7ZbJZfW0j4PvJWIbCvS8UvBKTpgITTR5tdGAPiRhlOy4jz2RL1B7CddBgt?=
 =?us-ascii?Q?RFx7ntGYGwEOkK8KzVGDGCsrYa37xtf1FK3VBrj18vSCNzSuJ55TBeSBIZ6b?=
 =?us-ascii?Q?RlKpsty2Onu3W+Ac9zOIRhjo8sXmIV5VwxyBPFxTlGfQxI2dgeArOHMpogfo?=
 =?us-ascii?Q?xvObhD0Txu+RjEplu1np6CrPslLKxZd39bDcnnqS1SDpmGmGF3WRrUN0jupY?=
 =?us-ascii?Q?rud98eGcxFoONNpTeIQ50FZ4AiS8DwTER9X5Wxw/+uln9RpUkVci9HbHDmUG?=
 =?us-ascii?Q?iUGFezFFe3T3qArCDsHdB1udMCZS8c4pSef15cCHy7x8QpjrQArM+ZEGIl8V?=
 =?us-ascii?Q?3zrK/bmtxiyxGDJ9NbcK2dXeD6QETafKN3LUGOcgDBx2RIwU1Pqqi1ebTl7P?=
 =?us-ascii?Q?dAQE7egntzjiCcoK//jopnqhPgVUuEEMqapeX7IHzEW7i1S4WifZn/7R2eVU?=
 =?us-ascii?Q?7kN3al1NBw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e1dbdd-5aea-469a-ab5e-08da2c0ea1bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 07:37:38.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvhBbLOLOHPQhnbqi7CCtexUXiLP2fyc+VV0lI/SbdisH1xxUZgxOXF7mWhcINzOV5AcjiMHGSCib6j85sKDQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9487

On 02.05.2022 09:11, Demi Marie Obenour wrote:
> On Mon, May 02, 2022 at 08:24:30AM +0200, Jan Beulich wrote:
>> On 29.04.2022 19:06, Demi Marie Obenour wrote:
>>> On Fri, Apr 29, 2022 at 10:40:42AM +0200, Jan Beulich wrote:
>>>> On 29.04.2022 00:54, Demi Marie Obenour wrote:
>>>>> On Thu, Apr 28, 2022 at 08:47:49AM +0200, Jan Beulich wrote:
>>>>>> On 27.04.2022 21:08, Demi Marie Obenour wrote:
>>>>>>> On further thought, I think the hypercall approach is actually bett=
er
>>>>>>> than reserving the ESRT.  I really do not want XEN_FW_EFI_MEM_INFO =
to
>>>>>>> return anything other than the actual firmware-provided memory
>>>>>>> information, and the current approach seems to require more and mor=
e
>>>>>>> special-casing of the ESRT, not to mention potentially wasting memo=
ry
>>>>>>> and splitting a potentially large memory region into two smaller on=
es.
>>>>>>> By copying the entire ESRT into memory owned by Xen, the logic beco=
mes
>>>>>>> significantly simpler on both the Xen and dom0 sides.
>>>>>>
>>>>>> I actually did consider the option of making a private copy when you=
 did
>>>>>> send the initial version of this, but I'm not convinced this simplif=
ies
>>>>>> things from a kernel perspective: They'd now need to discover the ta=
ble
>>>>>> by some entirely different means. In Linux at least such divergence
>>>>>> "just for Xen" hasn't been liked in the past.
>>>>>>
>>>>>> There's also the question of how to propagate the information across
>>>>>> kexec. But I guess that question exists even outside of Xen, with th=
e
>>>>>> area living in memory which the OS is expected to recycle.
>>>>>
>>>>> Indeed it does.  A simple rule might be, =E2=80=9COnly trust the ESRT=
 if it is
>>>>> in memory of type EfiRuntimeServicesData.=E2=80=9D  That is easy to a=
chieve by
>>>>> monkeypatching the config table as you suggested below.
>>>>>
>>>>> I *am* worried that the config table might be mapped read-only on som=
e
>>>>> systems, in which case the overwrite would cause a fatal page fault. =
 Is
>>>>> there a way for Xen to check for this?
>>>>
>>>> While in boot mode, aiui page tables aren't supposed to be enforcing
>>>> access restrictions. Recall that on other architectures EFI even runs
>>>> with paging disabled; this simply is not possible for x86-64.
>>>
>>> Yikes!  No wonder firmware has nonexistent exploit mitigations.  They
>>> really ought to start porting UEFI to Rust, with ASLR, NX, stack
>>> canaries, a hardened allocator, and support for de-priviliged services
>>> that run in user mode.
>>>
>>> That reminds me: Can Xen itself run from ROM?
>>
>> I guess that could be possible in principle, but would certainly require
>> some work.
>>
>>>  Xen is being ported to
>>> POWER for use in Qubes OS, and one approach under consideration is to
>>> have Xen and a mini-dom0 be part of the firmware.  Personally, I really
>>> like this approach, as it makes untrusted storage domains much simpler.
>>> If this should be a separate email thread, let me know.
>>
>> It probably should be.
>=20
> I will make one at some point.
>=20
>>>> So
>>>> portable firmware shouldn't map anything r/o. In principle the pointer
>>>> could still be in ROM; I consider this unlikely, but we could check
>>>> for that (just like we could do a page table walk to figure out
>>>> whether a r/o mapping would prevent us from updating the field).
>>>
>>> Is there a utility function that could be used for this?
>>
>> I don't think there is.
>=20
> Then it is good that none is necessary :)
>=20
> Also, should the various bug checks I added be replaced by ASSERT()?

You mean those in the earlier patch(es)? Not sure - depends on what you
would be doing for release builds. In the cases where you simply re-
check what was checked earlier on, ASSERT() would probably indeed be
preferable over BUG_ON() (and there I wouldn't even see a strong need
to consider alternatives for release builds).

Jan


