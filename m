Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B254ADB23
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 15:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268425.462256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHRTt-0007t2-Nq; Tue, 08 Feb 2022 14:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268425.462256; Tue, 08 Feb 2022 14:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHRTt-0007qm-KA; Tue, 08 Feb 2022 14:28:33 +0000
Received: by outflank-mailman (input) for mailman id 268425;
 Tue, 08 Feb 2022 14:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHRTr-0007qc-Dq
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 14:28:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62c29320-88eb-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 15:28:30 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-DiX8Hq2TPyios9Xl34jTWg-1; Tue, 08 Feb 2022 15:28:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB3385.eurprd04.prod.outlook.com (2603:10a6:7:8a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 14:28:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 14:28:26 +0000
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
X-Inumbo-ID: 62c29320-88eb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644330509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhDj55AlNHV0+UKqZ0MVptSZaX0fauKFRY9W+1xyYPc=;
	b=LluN0xG/F4bG7EbTDB/sUlkmFF1TKlKB7A3DiaBYMHNoXrnE6yT8AofndDRGvVewtFMzQb
	5BGnopMXoIjpaq4i3cWd6d63ji9PCQzqavrf+qP3gubi1NKaGsK0/R2w/1mrgmErxMZb3T
	v6G/wot3/+qX7y7PEYmDpo8CEk4nvCI=
X-MC-Unique: DiX8Hq2TPyios9Xl34jTWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfcInbTUOJjTdsYDgBiqcplGuyalV0iDq8egay90EFSlg85sK+dqvQm3TV4Ph1x5zA8k6KWwHbBZbztnJvznKxVWvydyX4lYM/ta9kt5+np1W/KeRjqzU0nLmeTMX+ZeAGsVDyl7vcL3rsgOG0QAjHRq7BvQqvdO7+KUWDNATRkAdCXcdsA+e7cF1eB/umshUXz/xU7lKkQKcmFQGifbcUdtfesEnUFe093HG8fT+LfKJCv/DLwwQT9PW6EXrcAvF4rL6owPe4pVOeK3Y2Ea2L+1RxUerWEDQ0N3n0SaVO9hBBzjsjCJRil1CnOI/Qo3v4XzkZXgR536BvKB45KQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqlfddC0LxNgCVanUDmcWyOj30plxW2gUXjwoC4VDbU=;
 b=E9OQXLn8PGWmlSvVZ1oKrpSs2EXKp4+ueqZJSc4bICdd6n3hvhZzJtZk5yvBLwqBcNuoUgucvWpbn6G9JUyryGAUuAiToeo2lNmsGtVkbLjKm/X5LIk7ifkELIIDyH5+WQfNoVCsESEYoS367Q9gC1iY25yM+kmb24J8dWoE0ud5A8wN/XzTG74LAtO6osjNYFo3aiisSgS1SnmUM6AzKJNNx7AGAFVLAxny4hXtKWfbbtgnA3bOCutOkXKK1gJbLpxaERfR3/X29ANPytnTc2ZO4olkaNSxHV/ua1Pa9nMavPZsoBe+h9xkf6x+MVyOxgEC+yFC6IrN2BVleOhArw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ff6d1b4-e096-90c9-1329-eb5dfecde94c@suse.com>
Date: Tue, 8 Feb 2022 15:28:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/Intel: don't log bogus frequency range on Core/Core2
 processors
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <419db65a-a6f2-f812-d51e-7a23d065d460@suse.com>
 <YgIv3O8ojoDK+wiR@Air-de-Roger>
 <1680d537-fb6d-c589-66bd-f845b8280308@suse.com>
 <YgJ8REZepbp7WKnv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgJ8REZepbp7WKnv@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0404.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0618bf8b-ca59-4b03-5b8f-08d9eb0f44a1
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3385:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3385F5EEDF3BC6CA276B4300B32D9@HE1PR0402MB3385.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9KGnPW5m2lyxtCfxew4NKnAFbUUXokRUuOq782hTBc3OFxJdhR5UgI0C01duURUgk/i+5bJiH82/Ep3I/kFb7Rn06gV1KjQRFxn9EznbB2I3BC3xpbmVAESRk/GkrfLrnXeE1INaSF+1KxNrSN1KwkqR9c163Ur23JdomjZpO/EkIlzVW9E6s5QVRwrL1lUmhAej9KTm1wVR26xd60nz4t0gs38wHi3sdZoJR2x5fHI3dLpq/NWKuvJoKzd3CSvMrYUUWVir8VOfPYJqfcPiYwxKmMQeVJWlmKg5JXORnRh4arThU+S9F0sEdpj8JGZdOYWM4rbvuIZm+JxNFvDpDnAVmkwJxMEo+xq5B/aDWuSnlRmS3eYDYA68je6ss6uUNGbkYVXrQyXAMFGyd2Y0M5PINI9Z/a63G4r5WHdmuKfhG3hhsYSvNRra2bKnAwwgUZOOSqgeufDYd6webIO6yesIa8hIcGbdjEgSLLHuJBP/P5c4M+6JvnqyL4tFm6oWvoge+gYuDDeh9Yzs0Y22+jueHZ8OpFaiI++n9eyjOqhKvAI/1cMcJiFn0Eb7NvwSKX3jeLfPLWUR3L2tRVZPYSYIChxFZqPLMOUsP3JI4ehYHOWIOQ/iORPxYUdmj+h1zTpe6ASq3On+EqVH1VIRNOEkbQxCfN4r5W2E/dcmZ2cjdwh0BFUiARRvyzrCBBlIo5cHXLtCNbCxYbOU70fWVmyApy8PTlyNlJIgHPieWU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(66556008)(4326008)(8936002)(66476007)(6916009)(31686004)(8676002)(36756003)(26005)(6486002)(66946007)(6506007)(86362001)(31696002)(53546011)(5660300002)(6512007)(316002)(38100700002)(6666004)(508600001)(54906003)(186003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q1gRbiKQxLwKqyqpwqOZXskowiSAQ2KCZwulEckmtOltwn4QgH13fFsSbgx8?=
 =?us-ascii?Q?9nKZOWTXom9/MB+DFXUBwOBu++LPwwkwNZtIuSKq93ZsUkRPUe10KzfOvl6l?=
 =?us-ascii?Q?U+SjiR9IZ6buR/D5K3QD30uAj1z0oSnpvPoQEWO/afFbGWQwzpIgONi0Vvv9?=
 =?us-ascii?Q?htiEj9GPetrh+DXWjmChyFXz6VOSpABj/m3b352LPttDbOh+fdtKjTJr7z/g?=
 =?us-ascii?Q?fw4Lg7L+ob+hc+ruPMlHbRhhclZbJVDeGLvsTLlOsQc2mEIbA8XPSbKrb2rO?=
 =?us-ascii?Q?GCqNy7EhT6WImh7/eXURDMN1b/u0X/Dm/XiUyLa7wQgr6oF1D408vf8ITzQ9?=
 =?us-ascii?Q?jYVXrnKhxZW2YuwhuS/t8net1PAk1n9CitP/9SLGCm1ZZXnx8tw2fUKZG1dq?=
 =?us-ascii?Q?EpYKWDRZ2SuSXQ3ilnWI1PcJ7Ut4C8jRH4IYyEID6qi0nkKcpCw9kdcmsaX7?=
 =?us-ascii?Q?f+4+XVI9RqLF5zfFA0hX75TWIltZf0RDCyKlHNAY4cRwxTPOPEicxDFADKHU?=
 =?us-ascii?Q?tRPlFLLzIeikibfj7iItC7xqv3ZUnJNgf+Yky04rX+tzKZc5Z1H02csK2N6U?=
 =?us-ascii?Q?nCnGJfVpXWgSrXKnvfX7UK5uD9gjYquVS/uFyFTT+7oEvLfCN1djuNKRPglF?=
 =?us-ascii?Q?hfv3NzWIWeaxWnvWl9w0a3C8dpEJ2Wyj1W+Uadvv8Qlk1RfOxftr6gvFcTlm?=
 =?us-ascii?Q?JF02r+q3tbUlhmTiIU0JY8a5ygQta/gShoRUBHS5Tm1GxhkiuStboA0k7DHs?=
 =?us-ascii?Q?hu3sNK+RpUO4OSxdMgIFd7CyV0+llzdpNXrlvBP6BP/TGZbuqwok8BBD7s6m?=
 =?us-ascii?Q?+abLVxK8mdWb/VLs+GOqWIs+3IkdnntMJX48lFNwEWRua+gVBo4peuLqyddd?=
 =?us-ascii?Q?VNvj0DkMtWWDgLaJzYs4f4XhOuqwylq9QcSQYhU0atx+m9YBsWkq5zh9q97O?=
 =?us-ascii?Q?VrHBbHm1e7VtpCAu9+e494UxWxPfkgAvbc1cM4bMhnBi9kqB4910pPSaSwc8?=
 =?us-ascii?Q?zkkIq1GOyHXZgAA+4POHT9hj4+Xz/tn34YC98gFetyXNUTVWvhwLOdjLYJbV?=
 =?us-ascii?Q?lpICGhWbrtLOxJIujdJGvWxd4ZtGYxJbBn2xRMAiBXsWdcmThezkoPclQmw3?=
 =?us-ascii?Q?mEwqflFCGYvC+/+fHXAtpFy54kNt3Z5GCD4eXDgL5ApJ8lO0fMyyM94vi8Se?=
 =?us-ascii?Q?AovaYqgVio0L/u7fL6B3Shqb88OXJiNODlh/xCc5jETMqfLuFC285NZuKT6U?=
 =?us-ascii?Q?1bTVKhg0NeCexDIVrQsKy95bjXZHYZ0/sEk9EvAHLanHBD47sliy+lT14AH2?=
 =?us-ascii?Q?uCcDSEV4AVHxRONsL+GDGjxy4Nj6k2H3qf5gA1WotgijMkA+LInTMqaUaE1w?=
 =?us-ascii?Q?d0C3unslRhCp5JPq29useR6T5TVC0DzcrkqoIVc9graEG0x9zjr/CKToebtT?=
 =?us-ascii?Q?G00BYrXzAZu//w7IGJNITVjv3tfRZXD5sZz/G3qnrd0xQc88/W+050XRKrEM?=
 =?us-ascii?Q?ff41B9Pje97OGx902SXvRi7AVPKCbuIhZk3XglK+0alkKNLYZQEVhZMSfokQ?=
 =?us-ascii?Q?GLh7R90UTMYXjVjetNlmhZT9c76EslLGdQXxLXeorB8Kz5xvdwwawmvgsDkz?=
 =?us-ascii?Q?2EW1Njnc1JnF/QeSEDtnxzg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0618bf8b-ca59-4b03-5b8f-08d9eb0f44a1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 14:28:25.9816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZqxKBEneKCAu64KRdEr5QtRQ4EF/HxlmRbRwmfIJE3rY0LVobecUAYrVqBNejYCIsVL74v2YzghSfeVRdo7IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3385

On 08.02.2022 15:20, Roger Pau Monn=C3=A9 wrote:
> On Tue, Feb 08, 2022 at 11:51:03AM +0100, Jan Beulich wrote:
>> On 08.02.2022 09:54, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Feb 04, 2022 at 02:56:43PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/cpu/intel.c
>>>> +++ b/xen/arch/x86/cpu/intel.c
>>>> @@ -435,6 +435,26 @@ static void intel_log_freq(const struct
>>>>          if ( c->x86 =3D=3D 6 )
>>>>              switch ( c->x86_model )
>>>>              {
>>>> +                static const unsigned short core_factors[] =3D
>>>> +                    { 26667, 13333, 20000, 16667, 33333, 10000, 40000=
 };
>>>> +
>>>> +            case 0x0e: /* Core */
>>>> +            case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
>>>> +                /*
>>>> +                 * PLATFORM_INFO, while not documented for these, app=
ears to
>>>> +                 * exist in at least some cases, but what it holds do=
esn't
>>>> +                 * match the scheme used by newer CPUs.  At a guess, =
the min
>>>> +                 * and max fields look to be reversed, while the scal=
ing
>>>> +                 * factor is encoded in FSB_FREQ.
>>>> +                 */
>>>> +                if ( min_ratio > max_ratio )
>>>> +                    SWAP(min_ratio, max_ratio);
>>>> +                if ( rdmsr_safe(MSR_FSB_FREQ, msrval) ||
>>>> +                     (msrval &=3D 7) >=3D ARRAY_SIZE(core_factors) )
>>>> +                    return;
>>>> +                factor =3D core_factors[msrval];
>>>> +                break;
>>>> +
>>>>              case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
>>>>              case 0x25: case 0x2c: case 0x2f: /* Westmere */
>>>>                  factor =3D 13333;
>>>
>>> Seeing that the MSR is present on non documented models and has
>>> unknown behavior we might want to further sanity check that min < max
>>> before printing anything?
>>
>> But I'm already swapping the two in the opposite case?
>=20
> You are only doing the swapping for Core/Core2.
>=20
> What I mean is that given the possible availability of
> MSR_INTEL_PLATFORM_INFO on undocumented platforms and the different
> semantics we should unconditionally check that the frequencies we are
> going to print are sane, and one easy check would be that min < max
> before printing.

Oh, I see. Yes, I did consider this, but decided against because it
would hide cases where we're not in line with reality. I might not
have spotted the issue here if we would have had such a check in
place already (maybe the too low number would have caught my
attention, but the <high> ... <low> range logged was far more
obviously wrong). (In any event, if such a change was to be made, I
think it should be a separate patch.)

Jan


