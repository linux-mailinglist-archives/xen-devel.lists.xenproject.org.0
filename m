Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A815D4721F9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 08:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245864.424135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwg8A-0000aX-7g; Mon, 13 Dec 2021 07:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245864.424135; Mon, 13 Dec 2021 07:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwg8A-0000Yk-3s; Mon, 13 Dec 2021 07:52:18 +0000
Received: by outflank-mailman (input) for mailman id 245864;
 Mon, 13 Dec 2021 07:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwg88-0000Ye-J5
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 07:52:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9640b38f-5be9-11ec-a74f-db008197e53d;
 Mon, 13 Dec 2021 08:52:15 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-6iwzA9ysPA6uf1t8Z9psJQ-1; Mon, 13 Dec 2021 08:52:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Mon, 13 Dec
 2021 07:52:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 07:52:11 +0000
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
X-Inumbo-ID: 9640b38f-5be9-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639381934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+Wgo2w+TDt+VI0k0EBU73PrKMstWCKSjkUbFME0o8c=;
	b=OSQXMn0EIymvx0YihUkzl4s27hGzbvAExZuU6wKFAqx4E/xH/oull67zUWcFJXoRT4iDZV
	h5YtsDdrODW5zRdTRRzdog+mtrWLe5c68hjYRRl2TDZc9e7xDWzy4jzsl1VnpzBvO0VRKV
	Ne8HM2/GgHyiSdl3rQ2FDdx0Jj+GJXA=
X-MC-Unique: 6iwzA9ysPA6uf1t8Z9psJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOS4V29HxAF9tPjIfsVgpJoyzcVCtkH5xatrugzQ3GVxLnnD6diURe+pF7vpAwoGK21rxWFBts46DB6g8Zsqc+R9NtDHk+5pjiXOREoDSllL1S0EYfx7WT52Na11Z/WsoZ8r7ZV12uxIuUob3Vzznxdehg8KBMTPlsYv4o0ogngVFPlqBn/R8D3qU3i7hRbvVRgAOLGN8Wj/OKDTfFEVh027QlW2arOPr9FssO9NFLeTgYziwTuHQgSMnsMxdvdq8cYpFs3SewopCVQphPwuNoPkSLAwxcGhzBNFHuRTo90V3p3eLnAxBGtMp5avBU/nciDy07AjGldqahY0I+YfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnZU/btKpWAQYmo2KWzc9dqlh89wmA+eJZrp4gFS5sY=;
 b=LOAWoU8qPZNu58zuis4G5E5QOcVSi4NgUQf7YrhxsB2JfCr1Vry7RGCclufHV+VMw50bgak+bIpVEHFVH/Z2o2G0GHAT4v0K/qo4TYyDZiOUSQRLOTVW4j3js4n74t13a+N63vDXzoKEeG2kZXaQCAlSoy7SIoE2ZDOl466r1eh7Ikrn69saX9SYamUoyZ7Zblu7MOZNiBQXMpcpBDrXZpGvxJQbyQbPfUtQH1h5G/9nxGT/ttzAaskDuiHtlWJTT8a9wJEEaOqf84zIpo2P71UxxYZdkLXSsT7buOvhQZsznk6ogDZJU+NSESANlHHHCz8wBcqyOz80rxZSPRKg8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7b416346-1c78-2a93-9eb3-9dd81101de06@suse.com>
Date: Mon, 13 Dec 2021 08:52:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1.1 64/65] x86/efi: Disable CET-IBT around Runtime
 Services calls
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126163830.30151-1-andrew.cooper3@citrix.com>
 <f3a94e22-5136-8cb8-6df5-58899a8bc4a7@suse.com>
 <23feef0d-2913-69cf-1a1f-59b1e933ad37@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <23feef0d-2913-69cf-1a1f-59b1e933ad37@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0038.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc743f0b-a3a6-4bbe-94ef-08d9be0d7847
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71491FD07165806551361CC5B3749@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pW6dsLOxC3+26Bxki3TCwvVg3FIGkXxRuqDYwZpk12e4a7eHSrI5y1BaRiFl1DDzLoDXhJVkCwAnyepneknDOMBuz5JhoGA9Xg5bI8rhOkeLuhP5zEfQhQ6VYU6pjs8Ai0HZPCzzz2yFiPXulljkMAVPSTRkTQ6um6i7sYfkqnEwPXjIlV92gfGMFEH9OJKP0QhmD3BprReU99QBhMOklj06z7oNiSrj66uKCAvZkG2e36/gSS4ck1nasmxCgY8xGACW6koRByjtmHQIbkgR3zK04x6IlFF89PFNFztUDcqZeRVOAKSNbR49KKsjDWLmM8YIOrG4rE/+x2CI+aMRiWSAYJW4lOB8oBn4HUD0j32TWm0Kakw5Gd9hgz2T6jxauAVSwaMPT5vQjXxaBfbQvD9RmIelUSI2G4i+L+Sqq/86xq+6rS7uBVIGP/ZnkQCBNlC6eS8Wbkf1xvazPUMnng+tQFMaIO2pqwe4vLqNvSoyY0YUzX7HO2LaGnXVwoHQlRZtn/pybUBu1lF5DrTqxQhHxmq5LVFdRPGk2Jf7elqcyvn+GfOyX/5gRQkRaFY/ahV/ygwsHQde31WEvpO8plChfW1LlEeNk/3sD5YWqH4/rJjv5+o0kOr6QzPAAetdyZwX4Ndh5PRZuZqr3rRz/ANmZjEPCR+FPYXAOyd+SfFWNqBKZWGt7v68BqFx7YvSB9//Ou21ONyxl3R708qFalfEzf4mJrpihnOfNtjs33JwMbrUhn7pWSj3mG2yRmdWH9S5QHX5TYHv58Hm1EqdmlLkqabw4Cz/hc6hoVFML1HeLYZ2OdH4q8ebzANQUv0R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(966005)(2616005)(8936002)(31686004)(36756003)(6486002)(66476007)(31696002)(508600001)(4326008)(38100700002)(53546011)(54906003)(316002)(186003)(2906002)(110136005)(66556008)(26005)(8676002)(6512007)(66946007)(6506007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vSUn8CZ16vau8dI86PHCkUIf6QkrenqigMme2VRe3RE+rdT2r/z82Snk97Mq?=
 =?us-ascii?Q?rdNlVlVBr2pH7oDb+jLx43ac9zRUTYqioHArcoEGq4uNxKKu/Ur1cUTOIm/y?=
 =?us-ascii?Q?r9kdQzQu9qzyfiv6LqCzk210PmgTbxs9em7879ECsdw7iWPBmLOsuULw5DFN?=
 =?us-ascii?Q?LZPGfyk58O5cYb8E26Uj1JzfgrIzdeCbRl0I+rYAeQFmDiwu2ZvveDg1l/Zv?=
 =?us-ascii?Q?KyH48vzQgyR2zb97AyZgAtwXvr06nP6jZqk0zzN3nSAGmEeL1j3yT3zfiNW3?=
 =?us-ascii?Q?YN1+KSa3ar9mrBXfjAHQVb4ORoRJoX4Z4YkusgdNNFp3QjCiMDrC2Y133Fvs?=
 =?us-ascii?Q?9RHrgCoGEqlwhP0+9i9v0iCyDY93kAEXrF+w8C5tsG5ooIJgISwcSB3bgF8S?=
 =?us-ascii?Q?vTyLirBInQLlSa22auQ7YO8E03FiIv33o7h6L/M1a68Tu51IZ9Tb4k8uAnyQ?=
 =?us-ascii?Q?gLdcuKP/JndOLx8vPZLuOEGErvfyRZXGi/poJZ/i/BdYUqmgUHJGzFvMqqsj?=
 =?us-ascii?Q?5sWndLxnM0KvmNnc0So70FDhEQw39SRj9MxocLKJ6pn7hcWw290QRsjZ7v2A?=
 =?us-ascii?Q?SkizTbGlke6kv5a42PloFVDtUZqLhpVQsCHYxFGlBvI/x8dhi4TMhni+NXEx?=
 =?us-ascii?Q?c3LxR12uJ3dxulXXVg+fs9PNZwh5BOQW00go3Ugyvdzkrzbpey0Q9zWQGVLH?=
 =?us-ascii?Q?lq8wyqStNVH7QbOZBq/47oLViFoRFUdbbYQptBMhQMJHUzcieny2PWmUhCiq?=
 =?us-ascii?Q?Epem5C1jVvtP/fCtJ7gev/5KXzt1WmBWD9oGADUhhEOGlPuvyq59Vh4UP8l4?=
 =?us-ascii?Q?pVw1+MKG0n6p+Ed4tc9t6hNq8Tgw7luQ9dvPR9MuGHDxrPab+ooeK2T/2OrR?=
 =?us-ascii?Q?+WiHOpWMQr9TJh1inrhVgomeMEAOfG+++Jxl8SOg0yN2Z9jXPYpELV1Vwh9k?=
 =?us-ascii?Q?5a4gl2XwTmRgIdNezOpX1pqIxnbyllAKv6waR2h9BqxqX1KKbe4zTykce0AD?=
 =?us-ascii?Q?0qsjyZS4r1Bpk8lxKLf8I5VX57p8euraX+bt2wopi6u1CIgXzY1+XJhsnANi?=
 =?us-ascii?Q?7YhP2n4Xj19QMxSPQ8byLh0fgh3jhS95N5XmYCk+mKgdn4URH0FE/9ZFkTwG?=
 =?us-ascii?Q?mxAep8dEejruWIL4HhfHB7wRy82eS8kogaca/wwA7rCUO3S34g7V+7F38/XU?=
 =?us-ascii?Q?CYnYLKUKYxRXznycFyf+3POonVr8zpSrEzUD5X5Av3C/3ton67UiHdRXhs2B?=
 =?us-ascii?Q?5VApfYcPF4yawIB6R4zyK9typQwcN+Kkk6pzsNlZ5wVnt3SRiIvCt3d2cxXD?=
 =?us-ascii?Q?M/Lq95TVkHVITs5Y4juVvdWQFfnJRh20Nqsy8EarCOiyf8f2bzJc5EhfTo+Z?=
 =?us-ascii?Q?FJM2TZKZYEnKT8MYx3CiGGA5EhW36bIKdYxii2KtSKadx33J9Vpl51fxT4ao?=
 =?us-ascii?Q?qet5BZPRynEe2UCJvAKlkd3GNDW82OyAhfhlPuDzuu/PGU6ABaosZ48LZZ2z?=
 =?us-ascii?Q?tWKkbv3c6134RXXUz3u0ge9wBFGfrk0Idyyi8nfqMPe/VElysJybRLl1cDSA?=
 =?us-ascii?Q?X0y9r9AGpauskokMH8PddK7nLkI6Y4Zkygqo06EOTMbwEz//Yrprz+qqiXzn?=
 =?us-ascii?Q?smLwPnvwFTyIGfqAkmsnqkA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc743f0b-a3a6-4bbe-94ef-08d9be0d7847
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 07:52:11.2914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9IHXeoDo55im/7D/GGeFiI3SDMKIKA+r/8Kr9to1oA/LTF6wSoZqewqjVl+G7hBU/zQz+EivhfJ/rCXkKSdqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 10.12.2021 18:16, Andrew Cooper wrote:
> On 06/12/2021 11:06, Jan Beulich wrote:
>> On 26.11.2021 17:38, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/efi/stub.c
>>> +++ b/xen/arch/x86/efi/stub.c
>>> @@ -11,6 +11,8 @@
>>>  #include <efi/efidevp.h>
>>>  #include <efi/efiapi.h>
>>> =20
>>> +bool __initdata efi_no_cet_ibt;
>> I'm having trouble seeing what this is needed for - when this file gets
>> built, neither boot.c nor runtime.c will get compiled, and hence there
>> should not be any reference to the symbol that needs satisfying.
>>
>>> @@ -735,6 +736,14 @@ static void __init efi_init(EFI_HANDLE ImageHandle=
, EFI_SYSTEM_TABLE *SystemTabl
>>> =20
>>>      StdOut =3D SystemTable->ConOut;
>>>      StdErr =3D SystemTable->StdErr ?: StdOut;
>>> +
>>> +#ifdef CONFIG_X86
>> CONFIG_XEN_IBT?
>>
>>> +    /*
>>> +     * Heuristic.  Look under an arbitrary function pointer to see if =
UEFI was
>>> +     * compiled with CET-IBT support.  Experimentally some are not.
>>> +     */
>>> +    efi_no_cet_ibt =3D !is_endbr64(efi_rs->GetTime);
>> I'm afraid I consider this insufficient. Even if the core EFI was built
>> with IBT support, some driver may not have been.
>=20
> That's not an issue.=C2=A0 Everything is built together in practice.

I'd be willing to take your word on this for everything that comes right
with the firmware. I'd further be willing to accept that there are no
add-in card BIOSes which may get involved. But I highly doubt that what
you say applies to all software which may get loaded ahead of starting
Xen. Such software may very well register hooks with core EFI.

>>  Hence I think there
>> needs to be a command line control to force turning off IBT. The only
>> question is whether we want to also honor its positive form - that
>> would, afaict, be a recipe for a guaranteed crash if used wrongly (and
>> it would be meaningless when used on IBT-aware firmware).
>=20
> It turns out that IBT support is lacking from tianocore, so nothing is
> going to support IBT for a good while yet.
>=20
> https://bugzilla.tianocore.org/show_bug.cgi?id=3D3726 is the proposed
> change to the spec to support this.
>=20
> In the meantime, I'm just going to blanket disable IBT for RS calls.

Yeah, that's going to be okay for the time being.

Jan


