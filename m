Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2CE47BB3C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 08:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250133.430759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzZlp-0000fD-8w; Tue, 21 Dec 2021 07:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250133.430759; Tue, 21 Dec 2021 07:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzZlp-0000dP-5v; Tue, 21 Dec 2021 07:41:13 +0000
Received: by outflank-mailman (input) for mailman id 250133;
 Tue, 21 Dec 2021 07:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzZlo-0000dJ-46
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 07:41:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c7b4ae5-6231-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 08:41:08 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-ZIxtStJ0O-iJtLXIoYYv7g-1; Tue, 21 Dec 2021 08:41:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Tue, 21 Dec
 2021 07:41:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 07:41:05 +0000
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
X-Inumbo-ID: 5c7b4ae5-6231-11ec-8d39-b1a4ed000e3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640072468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9usykdRoXQO1uGSbny9xdOwUTo/Tr4jC9nKhpHf9XXg=;
	b=PzUlij7fyYgykjjMExd+zBrk4rMTZ5iCo+kDxAdnqu7E22lTss7CATirww6v3LC9A2ord3
	LXXAcky+7/LeSxxcNOxe/aNF7Fjirn9Y/AdFGRW3vizYiJNlHqVZBrFRZm9DrYEbwzCY0u
	rshi60Hyxvc9r/o4fqyRAOTjU7FqgaU=
X-MC-Unique: ZIxtStJ0O-iJtLXIoYYv7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjyzTD/Nj/7jYvo0D22sBa/j9wC4Zeh84fARWx5Nd0u6Y6yRATeas3L+goA2qcZ9Y/QREA5ktMl2iYUPesaqe+yKXfEzmRmvZrc0YryegDN5pdMIHOO9tanX9TVu+68dI5QmGFGRXD2V9hQWGiwDsMmk20zflIYcx++uYYWL/ntSoOKdiPxzL0jLenN8uTQbhJ+UncmqC4ZSLfYzTI+uVQEV11ano7ShMurGz4Y22PXbljwvbXUcSDhqfMIMor26j4lhjz5JI04ZFR4oM3rAaM6O5R13VDQNPGGBzBGDzNeFgXaIWbPbibPAbHMwvtfnHYZy530ASjeS02o2AH474w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K4UkWZnKmr9KTc31uN5UUJeW/WCYCCoenL8wr4Yyfg=;
 b=lmidurWeC9nYn6MXik3eyyt+rbeh2dDp6FikH2xL+fyfSBvQyVLOXGIdI6hOEigqksLl+hwW4D/700vU+5QAFqYjlx1zJF6d8jQsigz4vdPRSt/6vA4HoNMoDSmxSZEYdNloEkpU9+4cQX0obLH1HU9S6tX0Dh5qUWhyAZiDkP+WTlqU02xcquWA5stZhYoo4rnDRv9b+OPUtnJL5nYXhVeMqane8QV9cmYejR0AB0+m2UiHnmZnJQjEVZnc8z782ZSm0ZQVG7dqLELu1rUBtmU5OmrSLnYU2cyM+TwHnBw1zIYF3yZRn4DrH5VLysX7832CZVRrFu6TvEwecE1zJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26968841-9b8a-757a-b9af-ba34a20fe576@suse.com>
Date: Tue, 21 Dec 2021 08:41:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
 <YbiP7YlpY22llB5Y@Air-de-Roger>
 <621259B5-E5EB-4ED9-A836-B6E17C0D6E36@arm.com>
 <YbscoZG/NRP6lMof@Air-de-Roger>
 <b3488523-489e-abb7-59f1-74c86e842060@suse.com>
 <5270d46a-a1ce-e361-dfeb-54408e9ba6f0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5270d46a-a1ce-e361-dfeb-54408e9ba6f0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1879cfe-32e7-4339-b66f-08d9c4553eb4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5327840B76E0E4EC6548E3CBB37C9@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sehk1LHYz3Dqa71GNS/AGGjZrhma9yIdnIz6ww5GavvDGAuO21clkBZ09WknxUiHsKIqeWHZn5h9MmSltN26F9xgwRnsVRFacOvTSer93Qw+TAdCuxx8D//iNr6kn8YYzUcWJ4sQyMqYkJIUV6LxT5pSvvukdptGLiHZvie3HUHmmcW3ql+xzs8zqS4+D9t828ACc/1hvZ9Mw1vjKm3VsUKtkqv7eulBGHEDLyzWEVxlgeKgzJSYqlv2u7ZgCAgS0FoQ7bcMUqgi5TQ6dvrDTvjXj0mqEJTzRIQOG5AjjV5V1CCrvpXd5dP6cFue+mHbJ7zsX5q0deoRLqISS0xoYCIStijpRZlwGunjj45BQEbx+vcta6SvwC58/Fj/cl8I4I1YD7uD8A2Epws0r1bjBCB0hpZSlYNEucSGg9m9nl0I7s2HcwxotX1PTVjG+FNxNBwYTYTNR2m4aPlS+vIZuruhUhc6Bs7kpbF7O8J4Ce6fw1wUntPnZkXpHhfNX/pxY9DyuFiRPYEskzYy9GLXXHtp/BNV1Ci65w0BlLintHySMj1B7NjVnmDVIkcInV7ZFFpDCffrCFs5b06cw1b6fZwCvYHqBL4dRcwUUK+X0or7+sjfxFgnMjfLYDG5S4Cg3rXQZee/osA0WkltCRUAfrAT9vhQQ9HYLhGP/jrNqzdyZPXtE7yutu2GjnnW4/igjPYUvDH+vUVKZAcoxOsrErmVJxEw3bkiSbSMkE7P4YnZ69i2iTKl0yj1laN7RxVR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(66946007)(8936002)(36756003)(6512007)(53546011)(86362001)(508600001)(31686004)(5660300002)(6506007)(110136005)(2906002)(316002)(6486002)(8676002)(38100700002)(186003)(54906003)(83380400001)(26005)(2616005)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iaiJGbuw0zrZ+n/0Cd+7TgQYVmW969KkHnyvr2yVoRFDfLN1F8QWGoItPsmx?=
 =?us-ascii?Q?9UYBAzMCvxclKPoUL2r9ncAHvWFe4yRfqKs6ELDYp/HvXkoQ/UKgkvxDZUWV?=
 =?us-ascii?Q?fkT57YUO+APV8BJ/8ymjI2/KVrjBb6bg0zs3XDTrigNkrCuANW8bFS5Cf19X?=
 =?us-ascii?Q?wcFqabCX9ILg/wTwwVyIqJ6NiIP11yPNZstUcy9IpSp/MxDV0xHbnkNCkEL/?=
 =?us-ascii?Q?bDb/5iv5JEKad7aLnaBSUBeLXLIkv2CzlUGg6rolmgitZfoeT0a9XZxmPwek?=
 =?us-ascii?Q?Ml+m2RLf6Pv0XxoidiRx1/K4/pwRxEnvBqQ1ogf2IqnmWwcGMBKdZz/PvQEv?=
 =?us-ascii?Q?/hqFJIvBsZH0Vu3vKLbCe49oMMoxBcn18XEL88GfAD6mMISKePQ8V8W1zCvH?=
 =?us-ascii?Q?6B/eMl9ljvMAq91x1JXaaSMJMadNOooNiTVu3skM7ysBFVfE7KBHAfEykZMv?=
 =?us-ascii?Q?mar1uBailf6etxXYa7CmPUTJoqTWiceNBgWz1ernRf75eYU2ntIqMfiwHRGo?=
 =?us-ascii?Q?pPiRPh/09o3tHwyomyc2XbdrHCaGtFMulaqZWiHNJKBB4ucxSCf3HWsdeeCe?=
 =?us-ascii?Q?Ig9qcS8z1YPxfvjAyZFWIbFoIouMEYqOfk8lLdQd2O8MY+vyh8STHrFB4EKj?=
 =?us-ascii?Q?L8nD0wYtv6VoXY4FL/7mGVKXNBuDczJKifeqrme4XenTm9rIFSZIp9cq/IrT?=
 =?us-ascii?Q?liI1K8AsCUvt0ROskwbZqp0NvduukiWbEG2PhrwX9vmW9Gu/cxMH8KSExQl5?=
 =?us-ascii?Q?3RCexRMOlKH6QhMxGDOWtGjDnW1NCTbAcQ9BDH2+4YbfOMSVMU4BMUGGX2La?=
 =?us-ascii?Q?hpFwQtWv+jewIELfXEAUR8kQZ/c3Snym055iEU0nkmzNMmYRsO4T/6x6PCTw?=
 =?us-ascii?Q?VgwB50DlJI45KS0FUKlvoRcwO7I3ZLXGxgubVS7uYcEDuHLKXlPZkr6UPkG7?=
 =?us-ascii?Q?XMWQAObFXoVwa+0OgrOJVlLucdbLgfr6JbV982YDhBqa+qIseG5N93vleGI4?=
 =?us-ascii?Q?BBb7LnGugXOoOoRfoTBMKBfzm90cA9LGpAfcZcmu6qvrfeC2ZfswxRZoQjJY?=
 =?us-ascii?Q?LuKA990AMad8ox+mK4luk3jXHd34lLkMmsPheUBhus4ue2PLkIedKwTU4AZ/?=
 =?us-ascii?Q?kBD4oOsljbyQbulNHPiwt/pYUsSXeYWqfP0ifAtfnkULmQMJFUVf843m1M3r?=
 =?us-ascii?Q?onYKxT6GreWDX3wlYd64rrNwMxBmMZZPkaFm687//j446IKZZ2eAcbtxOPDB?=
 =?us-ascii?Q?bw90ahIey2MGIJElejCWtDoMo4+q+BzY/M23MVvVXlIeWQYTmiYMehhQO3Xm?=
 =?us-ascii?Q?nw245dSNfxnVYa0T+QprZKSxJxksQuOp7y1hkvKZeOIcYWPCTPMJml+0V+AT?=
 =?us-ascii?Q?qPvuHawGU8Zh4GgFc44vfVAosDE1vCvAJ46cq6TF2bDnIaC2GY9nZ+btnK2f?=
 =?us-ascii?Q?KZyXMmIy/wrrdVe4u7qLIGROXrc1k4xRTyqqZC5FFRJNC4EbLWbsytriyfA9?=
 =?us-ascii?Q?HqjMWr/BVYNil0cv1H8NjIMkH7aU4BQ/cVEkXRyugxeou7IFw0CNR6yfEfg3?=
 =?us-ascii?Q?whz/9jH2LZCjAdLjNod0AsXBmNS4Uc/uHOGTiIXdTHbKc5SkCd+va5dgXr1W?=
 =?us-ascii?Q?cvEeGVUjMSTKHS3l9ddPo4g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1879cfe-32e7-4339-b66f-08d9c4553eb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 07:41:05.4519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeZDns/3Q0XcrMoGsRJ2BXRP49zNKxiqAyd/R3JhQv98fHUj06Io4EfGKwa3NCIqegHov+5zUPwmaxkCSb8ZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

On 17.12.2021 15:32, Julien Grall wrote:
> On 16/12/2021 13:37, Jan Beulich wrote:
>> On 16.12.2021 12:01, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Dec 16, 2021 at 10:18:32AM +0000, Rahul Singh wrote:
>>>>> On 14 Dec 2021, at 12:37 pm, Roger Pau Monn=C3=A9 <roger.pau@citrix.c=
om> wrote:
>>>>> On Tue, Dec 14, 2021 at 10:45:17AM +0000, Rahul Singh wrote:
>>>>>> +              unsigned long *data)
>>>>>> {
>>>>>> -    const struct domain *d =3D v->domain;
>>>>>> -    struct vpci_msix *msix =3D msix_find(d, addr);
>>>>>>      const struct vpci_msix_entry *entry;
>>>>>>      unsigned int offset;
>>>>>>
>>>>>>      *data =3D ~0ul;
>>>>>>
>>>>>>      if ( !msix )
>>>>>> -        return X86EMUL_RETRY;
>>>>>> +        return VPCI_EMUL_RETRY;
>>>>>>
>>>>>>      if ( !access_allowed(msix->pdev, addr, len) )
>>>>>> -        return X86EMUL_OKAY;
>>>>>> +        return VPCI_EMUL_OKAY;
>>>>>>
>>>>>>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA)=
 )
>>>>>>      {
>>>>>> @@ -210,11 +194,11 @@ static int msix_read(struct vcpu *v, unsigned =
long addr, unsigned int len,
>>>>>>          switch ( len )
>>>>>>          {
>>>>>>          case 4:
>>>>>> -            *data =3D readl(addr);
>>>>>> +            *data =3D vpci_arch_readl(addr);
>>>>>
>>>>> Why do you need a vpci wrapper around the read/write handlers? AFAICT
>>>>> arm64 also has {read,write}{l,q}. And you likely want to protect the
>>>>> 64bit read with CONFIG_64BIT if this code is to be made available to
>>>>> arm32.
>>>>
>>>> I need the wrapper because {read,write}{l,q} function argument is diff=
erent for ARM and x86.
>>>> ARM {read,wrie}(l,q}  function argument is pointer to the address wher=
eas X86  {read,wrie}(l,q}
>>>> function argument is address itself.
>>>
>>> Oh, that's a shame. I don't think there's a need to tag those helpers
>>> with the vpci_ prefix though. Could we maybe introduce
>>> bus_{read,write}{b,w,l,q} helpers that take the same parameters on all
>>> arches?
>>>
>>> It would be even better to fix the current ones so they take the same
>>> parameters on x86 and Arm, but that would mean changing all the call
>>> places in one of the arches.
>>
>> Yet still: +1 for removing the extra level of indirection. Imo these
>> trivial helpers should never have diverged between arches; I have
>> always been under the impression that on Linux they can be used by
>> arch-independent code (or else drivers would be quite hard to write).
>=20
> So technically both helpers are able to cope with pointer. The x86 one=20
> is also allowing to pass an address.
>=20
>  From a brief look at the x86, it looks like most of the users are using=
=20
> a pointer. However, the vPCI msix code is one example where addresses=20
> are passed.

Okay, first of all I need to clean up some confusion cause by Rahul
saying "pointer to the address": That's where my "extra level of
indirection" came from. I would really wish one wouldn't need to go
to the code and verify such basic statements. There's no "pointer
to the address" here. The question is whether the argument has to
be a pointer (Arm) or is convertable to a pointer (x86). Therefore
...

> AFAICT, the read*/write* helpers on Linux only works with pointers. So I=
=20
> think the actions should be:
>     1) Modify the vPCI MSIx code to use pointer
>     2) Modify the x86 read*/write* helpers to forbid any access other=20
> than pointer.

... I'd suggest to go with 1), to avoid impacting other x86 code.
Longer term I wouldn't mind switching to 2) (unless vPCI really is
the only place using non-pointer arguments, in which case doing
the 2nd step right away [but still in a separate patch] would seem
quite reasonable).

Jan


