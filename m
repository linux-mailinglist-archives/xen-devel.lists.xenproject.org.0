Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7A342A3A4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 13:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207134.362875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maGHf-0002tA-DM; Tue, 12 Oct 2021 11:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207134.362875; Tue, 12 Oct 2021 11:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maGHf-0002pr-9n; Tue, 12 Oct 2021 11:49:27 +0000
Received: by outflank-mailman (input) for mailman id 207134;
 Tue, 12 Oct 2021 11:49:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maGHd-0002pl-Lw
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 11:49:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71431674-2b52-11ec-8120-12813bfff9fa;
 Tue, 12 Oct 2021 11:49:23 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-c4SuMLFbO42Jbk3DLWZJfg-1; Tue, 12 Oct 2021 13:49:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 11:49:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 11:49:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:20b:462::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.21 via Frontend Transport; Tue, 12 Oct 2021 11:49:18 +0000
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
X-Inumbo-ID: 71431674-2b52-11ec-8120-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634039362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KcOYGgvuC1t8g3J76ShE2Z9Zi2E2a2o6MV71wjUpiZc=;
	b=OHu8Lo1i7he/qDMzEasGUWpG52m2orGj/NxwS6eJzIUEXw+8c89a+wsM1A6j7BtJCUig9z
	o3vqV7j27VEH6FpQG7IloevF2Urau3SgmhrUROibU7ycP7O2BLjz8VQCjyAUXv0TWT+Do9
	mVJmZOXH34IYHrMuJc6bdplZX9TRo8A=
X-MC-Unique: c4SuMLFbO42Jbk3DLWZJfg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MC8PTaVet+9UB850fQ259X3+mgSZGZ60J7G8KOiIoIuRnCKBpPmy2x8byzuzdG3IWGXb43f4tWy0JHwrjxa6EAQyDWRFl54M3WgXLcR5XMRN3NRWD9uz3Gr1dd6FQTQ1943KJMWCk7TJQnjjYiGk23oJO7fP0bUWKwTBiE2BqSYPGmNLjuVSmFSVgZxm4UkMcIIrxw7uDXJOZTn32UkkyBw40afrooOAgJpkKItZ0ASzWiHvqaiwAewif8iBX3PQIa+AQiZWfLm9h0lTSrXKZT+MSijrOi18MoIxO45qIhl/bbdeCOg3I7DHYCzbRdU3XcpeATpfxiK6B3i9MMdcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrXYyPsZMP3IyLVpP4WPdYGaL6Pi4ZtvbWuubEvrdTw=;
 b=V3HJ0TYN8OqM6cwdMT3LQgyFuMTn4a7Z1VPWgupP9duzG8m1hJqiXbmhwKbibY5FpJYQRxUPonqF1a9MEh9pB5zVddFzvyupKEooSXJmIjdQaLw+J5GkYWN09WruqKD4YVg0Igm7Sh90GaNwjCprsMG4kSBZs+PXuetWnC/7anL5e2GdO4FzAOmVruipKMbaqOXwYBiMSLCHXpq4u6Yg6EgOtfYQDvJip/qhy9JG3+DCNbc1eho7aUOqyxbfEzFHEgWk5U+9c6sC47Iq0l2OMcJ601EpOhRgEYXc2UE+BeS91Bg6wkAv7bxuIqiMlX7J+S7iLK8Y5btX5l9+e487RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Oleksandr <olekstysh@gmail.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
 <1466e946-d247-2380-6d7d-cda405a2f255@suse.com>
 <68213f79-2cbc-e0cf-3181-bc487f0a5eff@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e03fe6e-8236-fc7d-669f-98107f40e014@suse.com>
Date: Tue, 12 Oct 2021 13:49:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <68213f79-2cbc-e0cf-3181-bc487f0a5eff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0015.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30c08992-a9d5-4b94-ef28-08d98d765356
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53288AE73DE0D79BD8CC0FAEB3B69@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WcgmsnDQ84bYfdO6bZhJqA0eAkMZrVEU5vWFXmdg3sZ8uL/Bv3GSoA7IrUn7iKnHNXNHdZOi9OMNk52/IHVUQ2lDTQ/BOovVqP7zjADmkqsbVJymvC0Oefr3KMQ7sxTyQReBhu827Ni+wOqDZ74R6UnEYXBtt0aW9jKg5UBqVFzNjvmIYc8f/8hMsUNJiDrleT7amQaQvD/+EL1MUYdMS9DC2LWVeEX1T8Uze0+jBsBZgiP6BoULknRXv0YtEp5+X9EthcknLVAZAZx876DYjoBqBDCqq4YQc8k57vDjMxYcShxXC3gXVSa4ZYxuNNNu4ioC1J4mUnz4Kw+1PYFeuChm3ZdyJ5bwMq+6mOiK8EYKmhRf3TltHqwWZVBYXaFu6LQ006W3ZYPNkoAWW0fxY4Uj1IBhghl2aKxM86+5/nAZ1qwchjGgv5mSVc7nItcT9hP22ROPY3If6zVEdfo1bn1uXt7H085OrGkg7SfGoI4dqhOW46G9p76o+dTjQDrw+TTp1uqJkp38cfgnqg0lM1hPCh4TCGLYhdyHx0mhr1i6+yVcIkQU0a8xkXSL8wwdIAubvezk3d1UafK2R6nxy/L0i/+ngGSGPRHbaRGbRK3d5mR8775BkTToEIg0BSMjJibRvXjXM3jURcFmXBE/7WLirp624W99HfrzcQKgWDJm385R64fDNXdp4e+wGI3BQvvF42ewSFj0jKhU5TLp61TF6sp3tjA1a+gYDGQ919YmKb0HTtez/BOJSxc4qvX4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(186003)(6916009)(31686004)(36756003)(8676002)(7416002)(54906003)(508600001)(26005)(8936002)(316002)(4326008)(5660300002)(16576012)(83380400001)(66946007)(66476007)(53546011)(38100700002)(31696002)(956004)(2616005)(86362001)(66556008)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UqWNmKloLx2eBZlzYjKnmmHpu35Z3q0d6eqzdin9KeAclmUmtJER40vFpupi?=
 =?us-ascii?Q?Filos1zVpae/7SulDCfGvucmN8fLYnOMHZLHwYzgqy5V/vHpfxAp3UNKk4zQ?=
 =?us-ascii?Q?LpjrUaMTBcnwHWQOi1zpwLpevOFx39fwp0STEH4Ddx3UBiQhdgoFvXfy9rDR?=
 =?us-ascii?Q?UxKTNpnkcESzb2M3r/R0CEFZtvIR6eDqIGrh8ByWJaA7OIzSc5lr8dPdXtem?=
 =?us-ascii?Q?gdeBMtz2Aw1lJT5rSraHgDd4mqEOyo440/AjD85np7roP9IcxQK5eac+UcpH?=
 =?us-ascii?Q?emuBc72AGnP9RJSGCGy+5T1Zu+LtL36nBdDLtIVI6Ahvc5yvU7PClQg2MIAZ?=
 =?us-ascii?Q?ZHkL6BKz/D0yMFotni/Q0Q5FlDfQ5CZWZ/gqEKTNL4lnCddgN7tjSd9K/aVk?=
 =?us-ascii?Q?mL04nPrcpf8giEl4x8njJhSpY1+XAc58bBp5ls37SjzXY6iuEI3TeULUBCRb?=
 =?us-ascii?Q?gsWpVmvQbHWo4uv1MXHrZvSus0ufGUSQxpsefnUAjts2dWgMEusBkgsQ2GrQ?=
 =?us-ascii?Q?eYgoHCHtFw9M0QNohva1qLEFk5yUmdDbtCKs3gjl82/4LHJdv1tDDnAZZiru?=
 =?us-ascii?Q?bIXcjC3M9NboQUOtrqnNSYvD9GyVJs9sWznXiqSqGom0VE1Y1tb2feQK03Aw?=
 =?us-ascii?Q?FK7zy14nJrx8ObUGkCcYSq3ZOi4oXoi/WoA0e96DVYNHJ78Ueol5I7ihtWBi?=
 =?us-ascii?Q?6/lR5+dRzPIoVnGvk7sb7lAMjQEjYGIB7pUjpS2+mBkEeA52ncdp7hZq/TNw?=
 =?us-ascii?Q?7YnEK0UjZSf3N7JFh+iOvhSegagEAe6Y/M8ByZsIacqd6uMf+9ymS9aUBmvr?=
 =?us-ascii?Q?oCtHxruRihrklBgPenfkPZoGGT6rfhfAHRv6Pe8gcQVh9z2G9zwjOJIOuYwr?=
 =?us-ascii?Q?UpQt6udhKsvMH8QN/zKY/LmQEV/ClCtTvMG92WnoLbjRvMoSg8j92Z+EfvLK?=
 =?us-ascii?Q?PDi+Drl6Liv6xszdedqobZ5eKIJu6MXjXzfjL48lSHNLhxUGgQ9rVKzHKXQ7?=
 =?us-ascii?Q?Xame8XpCROMSTFdMd0BgQPQmskahLLvP33t4aJkliyOr5Jg56auPTZuuvmO3?=
 =?us-ascii?Q?IipZLedDleWYIUlvuYkUGgqHXgwCQ4EjXk9dfU126zSfzOnm2uuvIyx/QcJc?=
 =?us-ascii?Q?g9yxKqBPDMcQuMwJ1hwhZKdLqsjKuWWCcchb5kV45oMMQNqQvx+fBJqvWGvo?=
 =?us-ascii?Q?wNhaUsTZCmzgdX348t7I1xPQKK9FHTAFsnwnTVq8t85Y9ErEI322u7ilRJyb?=
 =?us-ascii?Q?Hbv3HHrF/j5vv3LhexqzCmkMDuVkZTMbE6ZC5m54yFgIoSYfLQoMyaOS8FF1?=
 =?us-ascii?Q?yr3KTFte99UbmUqKNp+IhJDR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c08992-a9d5-4b94-ef28-08d98d765356
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 11:49:19.4358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEJVmAQtFH8xhtYV/QYlsS+TCHhQH0XYsHVFKWrXBJq9q0nByDsgkUr2qi/vrGQIRFRE8a2mNdAvd5E7hFBkOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

On 12.10.2021 13:28, Oleksandr wrote:
> On 12.10.21 12:24, Jan Beulich wrote:
>> On 11.10.2021 19:48, Oleksandr Tyshchenko wrote:
>>> @@ -150,6 +150,7 @@ struct xen_domctl_getdomaininfo {
>>>       uint32_t ssidref;
>>>       xen_domain_handle_t handle;
>>>       uint32_t cpupool;
>>> +    uint8_t gpaddr_bits; /* Guest physical address space size. */
>>>       struct xen_arch_domainconfig arch_config;
>> On the basis of the above, please add uint8_t pad[3] (or perhaps
>> better pad[7] to be independent of the present
>> alignof(struct xen_arch_domainconfig) =3D=3D 4) and make sure the
>> array will always be zero-filled, such that the padding space can
>> subsequently be assigned a purpose without needing to bump the
>> interface version(s) again.
>=20
> ok, will do.
>=20
>=20
>>
>> Right now the sysctl caller of getdomaininfo() clears the full
>> structure (albeit only once, so stale / inapplicable data might get
>> reported for higher numbered domains if any field was filled only
>> in certain cases), while the domctl one doesn't. Maybe it would be
>> best looking forward if the domctl path also cleared the full buffer
>> up front, or if the clearing was moved into the function. (In the
>> latter case some writes of zeros into the struct could be eliminated
>> in return.)
>=20
> Well, I would be OK either way, with a little preference for the latter.
>=20
> Is it close to what you meant?

Yes, just that ...

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -69,10 +69,10 @@ void getdomaininfo(struct domain *d, struct=20
> xen_domctl_getdomaininfo *info)
>  =C2=A0=C2=A0=C2=A0=C2=A0 int flags =3D XEN_DOMINF_blocked;
>  =C2=A0=C2=A0=C2=A0=C2=A0 struct vcpu_runstate_info runstate;
>=20
> +=C2=A0=C2=A0=C2=A0 memset(info, 0, sizeof(*info));
> +
>  =C2=A0=C2=A0=C2=A0=C2=A0 info->domain =3D d->domain_id;
>  =C2=A0=C2=A0=C2=A0=C2=A0 info->max_vcpu_id =3D XEN_INVALID_MAX_VCPU_ID;
> -=C2=A0=C2=A0=C2=A0 info->nr_online_vcpus =3D 0;
> -=C2=A0=C2=A0=C2=A0 info->ssidref =3D 0;

... there are a few more "... =3D 0" further down iirc.

>> Perhaps, once properly first zero-filling the struct in all cases,
>> the padding field near the start should also be made explicit,
>> clarifying visually that it is an option to use the space there for
>> something that makes sense to live early in the struct (i.e. I
>> wouldn't necessarily recommend putting there the new field you add,
>> albeit - as mentioned near the top - that's certainly an option).
>=20
> I read this as a request to also add uint16_t pad after "domid_t domain"=
=20
> at least. Correct?

I guess I should really leave this up to you - that's largely a cosmetic
thing after all once clearing the whole struct up front.

Jan


