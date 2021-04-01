Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2577735172A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 19:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104692.200521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS11T-00070k-5R; Thu, 01 Apr 2021 17:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104692.200521; Thu, 01 Apr 2021 17:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS11T-00070L-2D; Thu, 01 Apr 2021 17:22:23 +0000
Received: by outflank-mailman (input) for mailman id 104692;
 Thu, 01 Apr 2021 17:22:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lS11Q-00070G-C0
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 17:22:20 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4893c945-cb8e-4d37-a463-e7ca09be095f;
 Thu, 01 Apr 2021 17:22:19 +0000 (UTC)
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
X-Inumbo-ID: 4893c945-cb8e-4d37-a463-e7ca09be095f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617297738;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3Kiz4JFIKM6c/kx/VCnk1VOA6QYDvbWSCcgOD8hCqQs=;
  b=H6bsYjMp0QE4tLjU37ps5nZJPb72AJIF/xf52Q2MNMWwq66omR9uFqGz
   TJcEu2jCXVkCnMj1yxMSqZSYmMtllQdoUMHKDkUuYUwoKBzSDG0F7qV/m
   nRh3ZS2S8Mz8F8CebLNa639wVZAA8cIuvYVdih1/AiQjJHaUJsEnR7NtM
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dwTyhiCEtVrUGv2P9u7V1L5Cp+o/kLzRHnJ52XNjxw0zwYl3tiQa10x73TrqHBs8GcapBSvBUB
 C3g9hp7BAJH6wbuYNlYXUUPijUSXxk34q6RIlYkNMVevOh0p4OpA7jITA9Vktwd2ThBnzk5c7e
 y4jntoV6Ss1X9TU2kDzrOvSvlC2VjhYBEwLuy22uXBLt0LkyoFfOU20PTv8vsd05rpnHiShoo2
 5PAVmt0ODuDQrboUAA/DL5acCQEsB1KyizuQstKmi0W1pytfbvhUwrq+qGPV0Cku2PquodpNbx
 gs4=
X-SBRS: 5.2
X-MesageID: 40709502
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aYU4X6p/Edtu6DJJ8kP2AfgaV5vYL9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyHJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFbQYvUK146hc8NwDzKDwVeCBjJb4UUK
 WR/dBGoT3IQwVxUu2eCmMeV+bO4/3n/aiWAiIuPBIs5AmQgT7A0teTfySw5RsQXyhCxr0v6w
 H+4mnEz56uru2hzVvk33LThq48pPLa1tBBCMaQ4/JlTgnEtwDAXuVccozHhh8ZiqWF6FEmkN
 7Dyi1QQPhb2jfqUUye5Tfo0wnk+j4y53Hl0k/wuwqcneXJAAgUJuAEqYVFcgbIy0dIhqAM7I
 t7m1i3mrASLRTckD/z79LFPisa5nackD4ZvsM4y1l8OLFuEYN5nMgk025+VKokJmbc7rsqFe
 F/Zfusmcp+QBehQF3y+lV0zMfEZAVKIj62BnIsl+ayyDZskHVw3yIjtbAit0ZFzp47RpVejt
 60SZhApfVLRs8SW6p3GP0Md8uxEnDMWhLBKgupUC7aKJ0=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40709502"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1go8m33G9lXdSVZdnODiF9LjE7z67ilqa2z2S78LHsBBj1IHJjp0tHhWB3LKtxqcVWOmoSBuhhWqymVfBoGNSSGtFj5XSnCojRRrBipaeoVaooHUQcpS6XMO5FNbEDNmBJZU/JGerluqB6WZxON+vERN1UJmkPxq7t5rZwfJUm3Okb2RJtmiQon6srRVRZv7Uo1owTqpXznmVaKbBf4Yj1Mpwwz9BE0tGZ9NsBuNuDnizE1ulsyhrmupSpSizyxXXGdNUwBpqCEmfwALfZsDR9jKC3cz4RJ5FqtmHK5lOJ4osqVla/oZFZO6Qa8Uqo3DNbiXlXgL85KEq5334sULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3YUm9V+BOHV9ZbU3NeP5q+b1SrtN2hvM18XgsGk8dE=;
 b=aPL/0MIr/vlotLlKfae4MMqbgF9VduEyQaIe1rdtfZOhqDvoTewSNuAhaAq+4+MU1tPD44zUlipfZG36HrhVYVFk9bZaG8cR0RwyUtIHMT/keljis7/RQu5V2AKVgfXoQB7D1ITV6/8zK3wIkixxyGVRHoQMLUYIcNTrTRuXHD6uj6hV1LE/V+u6d1PQ0zzIEJ610i7TTuntz+fqUl69EQSgv3ev2+ECUTtH80Oj0y8o9Ck4iFY3IG0nlAOvomvqdq4ovOL+epftzlXHY2RMZUHbKWwp3twxPOYKz5JJWZ1xvR8wl2QPau8i3xLWGDjvQJcaQqCJ4OsTuIxPXIvKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3YUm9V+BOHV9ZbU3NeP5q+b1SrtN2hvM18XgsGk8dE=;
 b=YXnobHSbjpLEb2PyH8uLVdfKDEc/1sOGPJ8Q6A4Zks5c8sae84JICruCp8VdU5fPg/CQejyIsRMBpmGoO4o9X5KqaqFiYFyS2PGHcbHdnLbohfg/cuRdrQ7P23FznyLisAOtyN1i9F1MhXbjGKMVPK8StzzizoZyLJrr8DjKb+w=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-18-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 17/21] libs/guest: introduce helper set cpu topology in
 cpu policy
Message-ID: <e8f10adf-0b48-8a0e-45d0-f2130face900@citrix.com>
Date: Thu, 1 Apr 2021 18:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-18-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0434.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::7) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2596c444-303a-4b20-e340-08d8f532b08f
X-MS-TrafficTypeDiagnostic: BN8PR03MB5137:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB5137B7417B3E6D91DEE529A2BA7B9@BN8PR03MB5137.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/Anlcn1MXOw5EQ/X10KtgUcsIXU9zlGcJHU4bWvOmelhYwbXl4ECmvTV4kVtRIxsIeC+vx8dnRd+jGTUBmfb0PSa9RV0zQz0wiWMSSoAdOr5VVEo6ZQYupOyqH6/+DiAh8rG4GiqlaHb0w2eTsPbMjMQtcrfwe7/6X8FJoqxBRiwGJicwJEjZNa/oTYiLCagQTrDQiBg0asF53/6/xknQsK8D020nzvA5tp1X8Lt2AYxBIzqRfx//mbF8lKjRo83zEZu34h/+XeGypuH/izKYa108csBSnOO3269ji34zdpxVb0fpQKprLhcYgRMYIsmucBBahIFWYHOmL3GosuITmXn4aKL1yxsl0rqO6DdMRn3SMri16CG5LbBoFRFv4GftI74t6JNrXk1Jzu60CgfncKQbP8hL6ArWbgD2oNF/++/q1GkZDXUTfEr0iug6z8lVUuHmpjCwJWTlxlwCiFEW3eltM4ZEdTEyIULuQf9n2+YvTlJAkjVjNPLIQHFj/1U7zwM5zRPWuQ96y6b/9A6aIA/bmKIjYoOXjfxN+oBr+QubFTNRIzJTWQM5jdj+17M/gGPnqxNPb5AchUYs28GLPjXtHGQAaVZwZ6pxGGYwtWl6mh2u5gI3z4aflOCcCj9hhFWseduW9UcjikVkVMnH1z0JHgrJE2br3szI/qnp5Itm+jxRZlEYhHJIhAM0pJ6tb+PYSyoHB05QUkRXg1kShyOXqWEVoWyL7ECZiBqBw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(36756003)(8936002)(16526019)(31686004)(186003)(8676002)(5660300002)(6486002)(6666004)(16576012)(2616005)(86362001)(66946007)(66476007)(66556008)(956004)(83380400001)(31696002)(53546011)(4326008)(54906003)(2906002)(26005)(316002)(38100700001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Uis0b2l4U0huV0Zrcm9LS01mQlgvWUloazl0dGw3bjRRQXova1ZNMXA3VWlE?=
 =?utf-8?B?WlIyNXpZcWY5L3MrQ3c3YzRYcitoWldXcUVlWjJtdUVKam9xajZhQVRJMy9T?=
 =?utf-8?B?clE4cFFqYWpLcVdaOFpxZzE1TkJtMWFBbnViZ3dZL1Z2cG1DS3lFVVkzZlBs?=
 =?utf-8?B?SGVzTG0wb0p3eUphZDNDWmc3aCs2b3FDaUtLK0NsdUNheUc1dzZHdTF6cDV2?=
 =?utf-8?B?QUNKaGNzb2dIR3NTNS9MOU9QckxZcTlzSTJFOVkySXRqUWNBekZZcjIrUWRN?=
 =?utf-8?B?U2RBTnRaZUNQajFqNU5oWFhhTEdENGpoaC8xL2NwSXZmQytDYzNqSndKN3kv?=
 =?utf-8?B?eTBGV2hJVFUvNktiTE91TDF2K0d4VU5NUVhQSGN3RlA3djkxTVZXQjVRZDFm?=
 =?utf-8?B?RDRGRTRSWUY4UWdheFlpMG1YZThjNWY5RUxoL1cvS0FtU3hJbkdzUGdwTm92?=
 =?utf-8?B?emJHenN1RkFZYjcvbmZaaDl5dDBBTUs3Mm1sMlNGYXhiUDRRSXUvZjlaK2RR?=
 =?utf-8?B?N3RFcGxjKzlwdXJmcndJWkNVYmJRT0Uxcm1mUm1RR0sydm5MK2xGUnhPc0hs?=
 =?utf-8?B?bWFPTm5CaTNhb1dHcUhxemp2elBVcnJQdjFaSDNmRmtDVmhDdExvSHl0OTZZ?=
 =?utf-8?B?RTJPclovMGtsMFUvSXFWOUdhOXlFNTlGYjZhS2svWHQrWGFKSFgvb3p5NFMw?=
 =?utf-8?B?bjE4UDd0WTJXSmNFZWpMRmY5YkZuckVzMWd5d2VpYVoxS2orSTV1dHNBTC96?=
 =?utf-8?B?MmUveWZQbVlwdFV4c1ExaGtSUm1ZNkIxd25JVTk5NHNmeE0wVDVBZXJ0Q29V?=
 =?utf-8?B?ZG9iN0Q1bm81YVJUdGptakFPem9nNytZSDBmRHFzUVQyc1BVSEJmWVVReUxn?=
 =?utf-8?B?dzl6dGUyODk3N3h6VXNMdkNYMUswYk1WMThQTEExSnhoVGtsbmMxaUtWeUN5?=
 =?utf-8?B?dWtPaWRnTEd3Qzc1L0FURm5uS00yMGtqV09wdUt6SGxFaXVKWmZPNE9SdFBi?=
 =?utf-8?B?YXhyYlNuYm8wM1AxcC83TnhCOTVyZ0RONmtMZkF3VUxWQnVvcWpkTnlLeXl1?=
 =?utf-8?B?azI1eXhpMFN5RmVROWdmZGIzMmFXa1YyeStrTzNFTjNlZ29hYmpXczkrZVov?=
 =?utf-8?B?SXRRR3d0dGsxWklyWVVsRlNyL0I4L01GekpJUHJjM3ZRZ3lkd3YxaldaNStF?=
 =?utf-8?B?V3Q2NFJuRENPK3VXelBYNk5MOUdOcGhtWTlvT2cxdjNoazVpZnB1R1d2bk9N?=
 =?utf-8?B?aVlIT2xTcVJBK1d0Withbkg4aDArdmZVM0dmblV0NVAwT3Z4bUlDYks4Y2Z1?=
 =?utf-8?B?T25mV0E1aG9vWHVlTzRuV3AvK1pHRGdlQ05HYXVTQnZXVU5hQS9kN0lBMjF2?=
 =?utf-8?B?RVIwM0l4cHFJcG1oYVVPejhpdjVDU3lLKzQ2RHpHeDYwQ1I4enlMVG5IbE5u?=
 =?utf-8?B?N2NyOE9ia2txRzNWY3NZaFFWK1orZlRsbDl1WGNXYXNDRzcyN1FtaTF6SVV4?=
 =?utf-8?B?TnlmSDFXZDl2MlFXVjF1cEJ4Qi9SWmJGZlR5K2MySjlVVjJOaVR3b2NvdlRF?=
 =?utf-8?B?SnFWdmtTazVKbGU3bjFmS0Jid291VXExUjZnTHl6KzNtWHhDeTkyRHpKWUky?=
 =?utf-8?B?UDE3RU9sODY0QzNwc2R6UmFVQ2pzc3g5cVJlMUU1bGRXMU9zbHY1L0FlZUY2?=
 =?utf-8?B?NkQzZVhGSVowYldVS1VqSFgvYmdmYTFnQTdCMi8weERsMXBnZEtmaTdmNmFj?=
 =?utf-8?Q?/cPKQwsyIZcNqCwhtebYgG2cS5VHwrM3M4HdgaO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2596c444-303a-4b20-e340-08d8f532b08f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 17:22:13.4333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbJq5xtprhw648Htfry3/IOxPfHk1xZ1rUFWcrhA7/ShZF32ksDOJwjGFmjOg4Xf/o02vRz7dx+82nVxWpoHJiHoz4QLtB2wGADyEEuG0wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5137
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> This logic is pulled out from xc_cpuid_apply_policy and placed into a
> separate helper.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  tools/include/xenctrl.h         |   4 +
>  tools/libs/guest/xg_cpuid_x86.c | 181 +++++++++++++++++---------------
>  2 files changed, 102 insertions(+), 83 deletions(-)
>
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 6f7158156fa..9f94e61523e 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2631,6 +2631,10 @@ int xc_cpu_policy_calc_compatible(xc_interface *xc=
h,
>  int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t pol=
icy,
>                                    bool hvm);
> =20
> +/* Setup the policy topology. */
> +int xc_cpu_policy_topology(xc_interface *xch, xc_cpu_policy_t policy,
> +                           bool hvm);

I'm not sure how I feel about this.=C2=A0 It's repeating the mistake we've
currently got with topology handling.

One part of it needs to be part of "compatible".=C2=A0 We need to run the
below logic, *in this form* as part of magic-ing a policy out of thin
air for the incoming VM with no data.

However, for any non-broken logic, the caller needs to specify the
topology which wishes to be expressed.

Do we want SMT at all?=C2=A0 Do we want 1, 2, 4 or other threads/core.
How many cores per socket?=C2=A0 Its very common these days for
non-power-of-2 numbers.=C2=A0 Our default case ought to be to match the hos=
t
topology.

Do we want to support 3 threads/core?=C2=A0 Sure - its weird to think about=
,
but its semantically equivalent to using non-power-of-2 numbers at other
levels, and would certainly be useful to express for testing purposes.

What about Intel's leaf 0x1f with the SMT > Core > Module > Tile > Die
topology layout?

The answers to these questions also need to fix Xen so that APIC_ID
isn't vcpu_id * 2 (which is horribly broken on non-Intel or Intel
Knight* hardware).=C2=A0 It also needs to change how the MADT is written fo=
r
guests, and how the IO-APIC IDs are assigned (matters for the AMD
topology algorithms).

There are further implications.=C2=A0 Should we prohibit creating a 4-vcpu =
VM
with cores/socket=3D128?=C2=A0 A regular kernel will demand an IOMMU for th=
is
configuration as we end up with APIC IDs above 255.=C2=A0 OTOH, there are
also virtualisation schemes now to support 32k vcpus without an IOMMU,
which KVM and HyperV now speak.

Fixing our topology problems is a monumental can of worms.=C2=A0 While we
should keep it in mind, we should try not to conflate it with "make
libxl/libxc's CPUID logic more sane, and include MSRs", which is large
enough task on its own.

What I suspect we want in the short term is
xc_cpu_policy_legacy_adjust() or equivalent, which is very clear that it
is a transitional API only, which for now can be used everywhere where
xc_cpuid_apply_policy() is used.=C2=A0 As we pull various logical areas out
of this, we'll adjust the callers appropriately, and eventually delete
this function.

~Andrew


