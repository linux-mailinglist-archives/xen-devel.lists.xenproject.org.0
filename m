Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831CB459053
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:37:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228922.396171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpARa-0006me-11; Mon, 22 Nov 2021 14:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228922.396171; Mon, 22 Nov 2021 14:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpARZ-0006ja-Ty; Mon, 22 Nov 2021 14:37:17 +0000
Received: by outflank-mailman (input) for mailman id 228922;
 Mon, 22 Nov 2021 14:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpARY-0006jQ-VH
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:37:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afede7ae-4ba1-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 15:37:15 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-BRikKsM1N7GRdJgRiPWD5g-1; Mon, 22 Nov 2021 15:37:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 14:37:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 14:37:11 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AS9PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:20b:464::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Mon, 22 Nov 2021 14:37:10 +0000
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
X-Inumbo-ID: afede7ae-4ba1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637591835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZQtEdeFnrRzKNK+jpUwnjJMd/3NzSthUqApZ6j8juI=;
	b=RP998RJsYn9LZ5qxIT156/o96pnX2oWl56nNAhACWwS5ivRl5ixzBni7fAlw14+AEP7Ta+
	VyoSfhyTo4qpRaC24rX+nijMveUs2aDyW6DlMgXtrslZ9+f9mbjf3nhYcac48tqa2IqrbX
	0XAzvrCmNZUNfV7PNjM24iYX29qBAgo=
X-MC-Unique: BRikKsM1N7GRdJgRiPWD5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Skq8LwG2xzrB/fHOvQsqrHaYlPQP1yfuxUA+HnNXPvaR8yTmR+HoJhXqJ1Gw0iAUnJw7JpudFge8eCeVvxRThhf/TpFGAyIfcB2MMAJZdw/BwyjygC2m/xQCV2n3ALVco4bxQgiHFfrhKCbYHKTtA75cy1tMdJeLiU/ZVYZE02AiF7C8PelLYLQ3R+xXkahbaRvHmCIkB/0PaKCj6pujVY5ywr2ILfCYXxUUGz865aC5IysXrYQZZrAF1a5dkVJ2o6e2JZEOgobCSXvrYUQSmDNZQU7CUxBX7pSI0L0+Ya1vgQZk53tl4zHP+Hzgp0rNvB/+PtwM5RSw1egcqr6gpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/ElNERL9/eNR4JIdUzQrfBw4It/aqNqcg11BYPz5JI=;
 b=Z+uSu9s7qUp0cRTpaNOLCcyGAz+Ypzh545KezpNvhal8f7UZJ7PYXpTFYYnJfWxW4M7Ob02DbJ4aMVOBLUt4qmZjmBBYlUfE+PdmuVX+SjUVD5fMaR9fT987WsQaYWE6346bk3EvWUSFzIUtMNsXswlu6oAQ5+ZQ5bmA1BT2GWr/ib3cPpbrpJTJjKEroHekBk5ySxE3K24zduj++EKGI1sr3gWM1pniwuXkIF/XIBFiawQvODC3wmaK83pbDbdsqfDi/Q7lleIwsPzna5mnbwmIyYGM7+ADiFVGPX5TZpRX7nuocJQhz1a5exYQ2IqHAg6XV0WHjY0jZgnYq2cW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2363af0e-6435-485e-8906-16a6fca7885c@suse.com>
Date: Mon, 22 Nov 2021 15:37:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "julien@xen.org" <julien@xen.org>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
 <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
 <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
 <ac0cc710-05b9-bdae-c31c-d159b4de0105@suse.com>
 <00e78d11-8e7b-84d2-5aa0-0a7f82f13af6@epam.com>
 <7dd919b8-0e3d-30dc-302a-9964f9d94ad2@suse.com>
 <fec02ac4-1ecf-18e1-7ed6-3b1094d60890@epam.com>
 <126a2864-e7e3-b887-43ff-55b1e59151b4@suse.com>
 <5baf1199-e12d-cc41-4520-e32ed29a0436@epam.com>
 <fbc8a807-ea73-760f-8c75-df0930a5139e@suse.com>
 <4e74d5e1-f54e-3888-ada2-a38545571744@epam.com>
 <6be4e6c0-5b54-606e-1278-e97e143e23af@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6be4e6c0-5b54-606e-1278-e97e143e23af@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0061.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6cf1036-b3b2-41c3-d5df-08d9adc591a2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325BD31C7A8DA881F0A85B5B39F9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NTrxG4g9+0upaqFbhLbXadJl6HZwtMQoVGxl5K9Krj50qvB/gbS7WcSzx4gkw6NMZmbul+uC+hyK1Hq/anApRVMT4vAMFXYKV9HAzkjPKx3ZIGlEGzBMER91X8n1sPUvGoDaUw0bMjeB6rageh1uIroPiyEDkrxN7JcqD7S9+xt9edbkw5dlXZybpt8YACZcGG/xEt/NGZj4p1uw/mtASS6dBSnFgj3hEz4m2RH6cT7UdVxODY8lZSrnxh+0VVfpoa7gwig71hFL7cZ20lmI3dqoSdgvtmocvQRM0GtiBaLpdOTY6Anxr+dyAzx63s9eQ4XqkCjNvo4T012YIfUSRdQaeBfAlDRZZRMEkQiBiX464R+QVdGUvJ/3TxGKZBq6RignaWNH6DBXWhM0oScTxo0C8PgfaKGrgN2/b9oYV56ZKoZ0tUhfFyS7e7OR0AXqUKDVa9FsEdqfjMH3o9mE/f705tB0ZvDZl0Mgd4wUhS9acL0Jdo3bKKuV8Hhp9CubBe/ke6CmwmTTgxh+wOnDXDjl5rfUhnFOKfTZ+6KWrEWCSz/nJqo52T+ncPwA8CAdXVbVvh4eyqABq+h/1e6FcnM54X/5dpx/JtWQ0QolsFSEgyBaXJOIkOtjlzGMSv5XeqVn9PtKRF+oxy+cxoZfcowha+LaP+DRlNJdPuG6b/fqTxl17J8/t75DWrTcob7y8or1E/KxMURxRE5JzAnFPDGFpeRcpGcELmDPbgy9NY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(5660300002)(8936002)(7416002)(508600001)(66556008)(31696002)(38100700002)(8676002)(66946007)(53546011)(54906003)(6916009)(86362001)(36756003)(2906002)(2616005)(186003)(316002)(83380400001)(66476007)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8CTi9oa0CKhXcxnYzD4WGHh6zQwkpPMbCOsvvNVbhYSKNHMXB9wTuRBMVcXC?=
 =?us-ascii?Q?Q4IcBd2yHR7ApZIz5OctI5PebLvpAEG+HsRsaP62EXSsTNIWLNfC9LBi4hoM?=
 =?us-ascii?Q?2wYlW/7rmwaO5/GXH9YWYQjF9E50VwnU+YRDKaUZJOoqWoePGKCwlrEIblXf?=
 =?us-ascii?Q?BY7icasQc7jqltBqX/s/sb+aTS+Qmj+CFEKtAka4tRxyvfkgrOnc9Sd3+snP?=
 =?us-ascii?Q?Es6bYdFZVdd13dxNVQZKTvmrZAGAmqfTL2yl2VPMKPiCI5TKDbZ9JLbXDLLX?=
 =?us-ascii?Q?/oyPHvasg4RyWmyQApNWNUw6WdZDWHgKSgKr4WoPMZOJqBCs53m8Lg2ZrP5I?=
 =?us-ascii?Q?dTh7nAvVfiJkQo4F8R4cubwVLGXnLY8K8mMQ0yo34qS8ntpQoz8gKgrNoh3L?=
 =?us-ascii?Q?pRD20jMV8bmOPTpkfIeYGOwlRYDlTRe2BdvG+Z7jiOFUJklXcnVnjxNJA4JA?=
 =?us-ascii?Q?A7WsfFIQ+ozKATG/jvkGTlknLgEqCNTeLWxgx13dM+EzZgW1g4p2m2cenHJD?=
 =?us-ascii?Q?BgPN5cR+cjoLSdMa2moq6HoFrYJMmxpseTgceZC3jxyzkA/fyHq363DkmONO?=
 =?us-ascii?Q?avQDV83AkVfh+EAxPNhqPVRnqKc4K4mzP7fuTuPUjdHmoxTJKupppgTxYsOr?=
 =?us-ascii?Q?h9x8iSbfa12yTmrjyV5j0v9j60PkzXbg+SGp0vrOYALXgq54Iyk94itMRbNq?=
 =?us-ascii?Q?5vAGgY9AZ1BhiIXpH+c/rms4zJb/oLtKvsEdgpc1WvWyBULQpeXdmK+gQ+NG?=
 =?us-ascii?Q?A3MWIFwL6wAxSS7i+lItR3ZJKVHbwG2YulE/oQ3sGxgSsx+mXuVfl7JKiqlM?=
 =?us-ascii?Q?wK3WsgTOlw0jnp4dz9JTRO6sswct36FHhAf2+h2wfMT9XRGUOeHtU6hW35y4?=
 =?us-ascii?Q?x2jIS9RrznLrfQEu569XTZoOqM4qlFX7b7k69bDhu5FhFEmw0l13U7+oLNF+?=
 =?us-ascii?Q?YEAbreIArXKiCINdowquzEvPDdAkHtXzGWeXUAWIsEF7NmTDo3tPPknjLBRA?=
 =?us-ascii?Q?oq4v/mKWUDLTv5tMzNocOHXPyddsw6nLXqAaQjemLdlIwZFzIyLsa/n1xksn?=
 =?us-ascii?Q?YgM5EAVq45xDdQ0Wec40a6P43PP8IRKEKPE36KrMv/lheDzsHNjgfrLOsp3/?=
 =?us-ascii?Q?V27hBlfYzdxXe1LSW15rZlXYtOjHp/o5FJvFF1gtmW8EF1Yq0RaB2FwPiXA0?=
 =?us-ascii?Q?m3H05iHstx9h6gMRi0c2okzmT6CIXJNR60iycbpa2OlxvJjWIRsk6BjJRsl4?=
 =?us-ascii?Q?tWLetnlZkJqfLqu4EVTm8NJdSDKctWr24U5ZYhPT09I1kbESD+OzXDW+el/c?=
 =?us-ascii?Q?s4p9uD59xbf9CeibrIVvDCE3GIv8ddyVOkICrQqKm/FtOKsbyC2lYxLsrwCC?=
 =?us-ascii?Q?ps+q0ektBSjgT4+x8Jg/31P9gV/g1z4JF/BGGoIsjT7cqJXkrdbjwFYFu1L5?=
 =?us-ascii?Q?9zXDZ2xjR2REWrKJ1t5gxrObOeBKY/CaxhO3UCyindogaqAaB5171J5oljdf?=
 =?us-ascii?Q?lkS/VxBiXJ1it6CejS+Wx57IGLWEbnsdJl6Ntkx8yB2h1ilEKvl7Hqmk0eTT?=
 =?us-ascii?Q?i2OEl21zYM+b17/kZZEsFJtLRG7r5DKtYAF/o1Bf5AYIDo0t/qSUQGbXBkSg?=
 =?us-ascii?Q?dma+z1p/s0HNqfe3Z7E/qLGXPCgrewEc0TEu8FYxz1arADH44fRyds4fZgxt?=
 =?us-ascii?Q?FIMiRFhX3G2hrMDevpPpK7wx/uw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cf1036-b3b2-41c3-d5df-08d9adc591a2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 14:37:11.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz0BPwtYCgOINSCxigPGLTUXcJCuw68JqZuKBxy84Jm+zYx9bBi7CXPm3O6YaE4PFuz0qJ+tWApFkAGb13F7hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 22.11.2021 15:21, Oleksandr Andrushchenko wrote:
> On 19.11.21 15:34, Oleksandr Andrushchenko wrote:
>> On 19.11.21 15:25, Jan Beulich wrote:
>>> On 19.11.2021 14:16, Oleksandr Andrushchenko wrote:
>>>> On 19.11.21 15:00, Jan Beulich wrote:
>>>>> On 19.11.2021 13:34, Oleksandr Andrushchenko wrote:
>>>>>> Possible locking and other work needed:
>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>
>>>>>> 1. pcidevs_{lock|unlock} is too heavy and is per-host
>>>>>> 2. pdev->vpci->lock cannot be used as vpci is freed by vpci_remove_d=
evice
>>>>>> 3. We may want a dedicated per-domain rw lock to be implemented:
>>>>>>
>>>>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>>>>> index 28146ee404e6..ebf071893b21 100644
>>>>>> --- a/xen/include/xen/sched.h
>>>>>> +++ b/xen/include/xen/sched.h
>>>>>> @@ -444,6 +444,7 @@ struct domain
>>>>>>
>>>>>>     =C2=A0#ifdef CONFIG_HAS_PCI
>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0 struct list_head pdev_list;
>>>>>> +=C2=A0=C2=A0=C2=A0 rwlock_t vpci_rwlock;
>>>>>> +=C2=A0=C2=A0=C2=A0 bool vpci_terminating; <- atomic?
>>>>>>     =C2=A0#endif
>>>>>> then vpci_remove_device is a writer (cold path) and vpci_process_pen=
ding and
>>>>>> vpci_mmio_{read|write} are readers (hot path).
>>>>> Right - you need such a lock for other purposes anyway, as per the
>>>>> discussion with Julien.
>>>> What about bool vpci_terminating? Do you see it as an atomic type or j=
ust bool?
>>> Having seen only ...
>>>
>>>>>> do_physdev_op(PHYSDEVOP_pci_device_remove) will need hypercall_creat=
e_continuation
>>>>>> to be implemented, so when re-start removal if need be:
>>>>>>
>>>>>> vpci_remove_device()
>>>>>> {
>>>>>>     =C2=A0 d->vpci_terminating =3D true;
>>> ... this use so far, I can't tell yet. But at a first glance a boolean
>>> looks to be what you need.
>>>
>>>>>>     =C2=A0 remove vPCI register handlers <- this will cut off PCI_CO=
MMAND emulation among others
>>>>>>     =C2=A0 if ( !write_trylock(d->vpci_rwlock) )
>>>>>>     =C2=A0=C2=A0=C2=A0 return -ERESTART;
>>>>>>     =C2=A0 xfree(pdev->vpci);
>>>>>>     =C2=A0 pdev->vpci =3D NULL;
>>>>>> }
>>>>>>
>>>>>> Then this d->vpci_rwlock becomes a dedicated vpci per-domain lock fo=
r
>>>>>> other operations which may require it, e.g. virtual bus topology can
>>>>>> use it when assigning vSBDF etc.
>>>>>>
>>>>>> 4. vpci_remove_device needs to be removed from vpci_process_pending
>>>>>> and do nothing for Dom0 and crash DomU otherwise:
>>>>> Why is this? I'm not outright opposed, but I don't immediately see wh=
y
>>>>> trying to remove the problematic device wouldn't be a reasonable cour=
se
>>>>> of action anymore. vpci_remove_device() may need to become more caref=
ul
>>>>> as to not crashing,
>>>> vpci_remove_device does not crash, vpci_process_pending does
>>>>>     though.
>>>> Assume we are in an error state in vpci_process_pending *on one of the=
 vCPUs*
>>>> and we call vpci_remove_device. vpci_remove_device tries to acquire th=
e
>>>> lock and it can't just because there are some other vpci code is runni=
ng on other vCPU.
>>>> Then what do we do here? We are in SoftIRQ context now and we can't sp=
in
>>>> trying to acquire d->vpci_rwlock forever. Neither we can blindly free =
vpci
>>>> structure because it is seen by all vCPUs and may crash them.
>>>>
>>>> If vpci_remove_device is in hypercall context it just returns -ERESTAR=
T and
>>>> hypercall continuation helps here. But not in SoftIRQ context.
>>> Maybe then you want to invoke this cleanup from RCU context (whether
>>> vpci_remove_device() itself or a suitable clone there of is TBD)? (I
>>> will admit though that I didn't check whether that would satisfy all
>>> constraints.)
>>>
>>> Then again it also hasn't become clear to me why you use write_trylock(=
)
>>> there. The lock contention you describe doesn't, on the surface, look
>>> any different from situations elsewhere.
>> I use write_trylock in vpci_remove_device because if we can't
>> acquire the lock then we defer device removal. This would work
>> well if called from a hypercall which will employ hypercall continuation=
.
>> But SoftIRQ getting -ERESTART is something that we can't probably
>> handle by restarting as hypercall can, thus I only see that vpci_process=
_pending
>> will need to spin and wait until vpci_remove_device succeeds.
> Does anybody have any better solution for preventing SoftIRQ from
> spinning on vpci_remove_device and -ERESTART?

Well, at this point I can suggest only a marginal improvement: Instead of
spinning inside the softirq handler, you want to re-raise the softirq and
exit the handler. That way at least higher "priority" softirqs won't be
starved.

Beyond that - maybe the guest (or just a vcpu of it) needs pausing in such
an event, with the work deferred to a tasklet?

Yet I don't think my earlier question regarding the use of write_trylock()
was really answered. What you said in reply doesn't explain (to me at
least) why write_lock() is not an option.

Jan


