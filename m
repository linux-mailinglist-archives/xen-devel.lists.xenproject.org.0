Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16F4F63FD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300008.511452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7w9-0007AM-GR; Wed, 06 Apr 2022 15:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300008.511452; Wed, 06 Apr 2022 15:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7w9-00077k-Cn; Wed, 06 Apr 2022 15:51:13 +0000
Received: by outflank-mailman (input) for mailman id 300008;
 Wed, 06 Apr 2022 15:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc7w7-00077e-ME
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:51:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60bbe1e3-b5c1-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 17:51:10 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-TAOPm7TWNzSSN1mBKMUA3Q-1; Wed, 06 Apr 2022 17:51:08 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4876.eurprd04.prod.outlook.com (2603:10a6:10:14::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 15:51:07 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 15:51:07 +0000
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
X-Inumbo-ID: 60bbe1e3-b5c1-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649260269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mz91w+myVt0gaNT0IunyzfoAUic4JpyT6OrDsybj9E=;
	b=kb066cRXMhea3o2hQA6qgvrPLu+NTLJwvLdkriKK6G9LZLa7ofxpX9jXMnrSqrbu2cpHgQ
	69x46QtU1ySbiiOdEim+iNq+EHMJYqdGWpnsRsKFtbXVK6iR/EO/Eu4yUuosnt/G17PJNB
	hmxu/oZqCLOHZti62JaUytV1Rk/UOGs=
X-MC-Unique: TAOPm7TWNzSSN1mBKMUA3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDiwBRSKsjc/kAsiX9u+d4G7UeKmdEkijrtv88facy50StITSpqjQ2LJMxdT5T1My8a4ghE+B7K/w6sH2lDWYlP8VvYE7GMpO08VtMoWldXaFbj8XESwMtemkwnJy360/EE1daZztiOBM9BLSwmkNn5eTWXG+cmnMbQaHGidYsY3CzAShjYQxn1Bzfo9Y1onIsU3IxzbiC12zHBO80P5Jv+7EVBe61fDjSdKdXDghNVdmleICfpIdMVca/WlgFAvCzsW+MAznxqbcMebTKeGFu5ts4r/GqhlvHLCUGNDpQLScaXBcP73IdLK79s6yObP6/XIC+uJztbsaLZRwDiLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zM/8Ht9g451vNUxbqUffphuNhcG96RV9F4qN3Gg5vfY=;
 b=UGBf+LZ6XVCV0KB59CGPwGYyT82AiKfm7pI7ztL0BbP+lKR4a8WVLHslFi3jBG6DogGaJ5wZUDN2FeB/wRVReABFGC3uuXZZug1bjjG2r+7dfAdkWvJITsOOOsGkfGwLhCSKO4hKpF0POZutIHkiZsHmA0BoPGSGRFxY5Gkvbx4F2cry3DAktOtPxLrwnH/LpmsRy/tgZjbwkQMIHiXFj1IvixwQkpVcC9LFZ68e4Pk36Rzo4nKYCwporHBJ9Kgeq6aJnBc344+KraldfkCL8XtSXc2SqLAzCjcEtAy2mQbv9okjPaHKYufiSQSh/bfEH7JyWA2qaPb00a0A+xuTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <373308d5-044f-e7c2-4830-b3fbf5539767@suse.com>
Date: Wed, 6 Apr 2022 17:51:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Questions about Cx and Px state uploading from dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <YjrgQOYbsaYOV08H@Air-de-Roger>
 <6a029529-fcbe-3923-26a6-58a58926762f@suse.com>
 <Yk1tvf7oqOf3jySX@Air-de-Roger>
 <333e5dad-5a8d-a8b5-99b5-5d349c784b88@suse.com>
 <Yk2tN5h3nB+ijMoN@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk2tN5h3nB+ijMoN@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0649ed1b-a851-4a86-9f4e-08da17e5439a
X-MS-TrafficTypeDiagnostic: DB7PR04MB4876:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB487635D50E5F1EC39136484EB3E79@DB7PR04MB4876.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	doEUvikOdiZ7PRHh66P2xBZBv6/I4CioNuSCEijdNtzFqjoccGBW0YfuIXSrdlrI7z1I7TIq4J0TyWNei2xqVw/vDjoTIpd4uojon14YHVErWsOVakAXfCZemjkZg1XCovpzqrLR2w8+nvYMg6f64an4wsz/nHIZiUB8ReiKvfiNl2wRYEMTzJh8gAdTMeudy3Bw0s49RHJD0HecW4GXiXwP4xSZDc8d0I38aAoVwjQOjwiSCQoFfjpEJGwAVM1mYtqwNtag6/w/OvzQKdfk9BhktMIGrMB8PFHrfkvAyYk48PkEkK6cExEMrRfAFmhLwwC2f6Q1DmBgbbYSIzU7OUgD4esjI8jV/m8ArjopKmGP5hXME917Zemqntlbq1YEdYeDAEIT1S+rQaAYRALyCyqYhiiyZZQlgc5nwmYUKUZBsSfPTF3rAVG2Xcv2HCwpr/9ZRG339upq+fZiPq6Wc0AsgdllTRga9pl/iaTfsrD7TjpcU8xqUc7GFaz9DWTHyzaCYK0dQbDLwC86q6NI0U8XuVzlHoYieRe/pMjAZ9wmg/Q8y+eOj25AkCl7o87Jtg3OZBWf0wWlcUkpAIJVP1UbYDgoZWP1JZfrtheI1QEkv8OTVWmJZCkrVF4pinD7QzD9zFjlijZYGGtuKaJLfzegYaQNoXjVVgHFZ9UHKx7rpsxH0fVBAZK92jh8jKE0neRijTV4HU0H3IYFvPtIHVs0CKTSYJrhbC4JPKsrZso=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(508600001)(54906003)(53546011)(26005)(6916009)(8936002)(31686004)(36756003)(6486002)(5660300002)(31696002)(66476007)(2616005)(316002)(38100700002)(6512007)(86362001)(8676002)(4326008)(83380400001)(66556008)(66946007)(6506007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VYbjrxiJDuqyZxnI+3S6uJFswOUCHyh9AkOaPMMkCLbiQpZiHK2lflC6dg61?=
 =?us-ascii?Q?4sRAF0RQ/ALwZbjZIk649yy/MGoIsF8ydSP5LLEft/CK8wu3k3RMFd3LZkOp?=
 =?us-ascii?Q?wcnbnt322FqjA5rsvgGSSDBYVnV1+OvmESsK1dxSNR9zgrhNjZ7B7GAWaVDq?=
 =?us-ascii?Q?FrUwwURNTexj60j3YxLj1kT7gqJGnKldxeZCSHcZ6S8MFhKUhlIINYsOGmgW?=
 =?us-ascii?Q?2GSoAjbpt5mmKMTjp7ZFL/ij3H2hswufVfhEUxSW3OvmpLKSlGubtYItC8c1?=
 =?us-ascii?Q?Up0tBlvvsZTHFLEp6rGVsrvEAqN2AOnLBG/iLXVoIorNERkCwA2pSJHTlyVA?=
 =?us-ascii?Q?/iGXRdwgnKCw2tN9O8FIMSlG8p1EUm8pQSXAm2zD+yNr9mcovp2B9d5Ui0R3?=
 =?us-ascii?Q?W28LM4b6vEbudC8ASbnc4TwucRVeUlEEWdMjjpYO8l/LLapgu8jahQHkpPpM?=
 =?us-ascii?Q?CHtSZMZQC7XLSq5cbd8AABk/YoT4uRmRZ8kEcPC7DsoveowmFZniQlsiAEIY?=
 =?us-ascii?Q?ROKJ/VQme6rfbpd/mdSwQairmkETLsPyMyvqC0pZQTrbstymZfsnWY/MaKyY?=
 =?us-ascii?Q?Z5mK3alXrhcfUZBGPGIRuYzK+MLmD03iv4fB2+Jdod/8raouLVti2mfMB2Rk?=
 =?us-ascii?Q?+38wUCSpstZM8cOftZ0pMXqGaOnt9X+N1jSK+Xanx7HkIEr6j0ulpCbNE95f?=
 =?us-ascii?Q?z+gFvO9tEIVb8Rfo9grf3svlaLddc64QZUVjBsyA1bScP+EiLGjZGmzgzGVa?=
 =?us-ascii?Q?R0Ys6OdZP9odz81EzpbhrXnylDhjBZ7ltxs+nhcCzks9F2yuRQ5BCb6+32Ny?=
 =?us-ascii?Q?ymO2Ff2dCU54ti7hFa2X1SsCypxB/Q36O+tyIFoW0wecyL+LPOn5/fx6E/u8?=
 =?us-ascii?Q?CmM/VzYTZYca4R6FffWxhDsq7je8O/iq6A8HmlkzB/q5+vGKxoIFfysu0EYy?=
 =?us-ascii?Q?QCBEaHut3a9jdCShIh7k1c6TkaJ0oscyPtXiGdNSI7VoGk5CcHm+uqlMwgPc?=
 =?us-ascii?Q?1BOCUXomesjlLXGJPeURXHO1N5HQiL5JjpjaxSqohNA1glrieir7JgxMXheL?=
 =?us-ascii?Q?dhvjXrAMYiNyK/FL4YpsaeEP7YdqRYLjy0LFnwihZBLdxn1AsPTxGLpshoS7?=
 =?us-ascii?Q?1NyHcfF4bViY5fD5a4ZOURHIJBQrjA0EfxomcVAv+AYZSFSxuK3R4asbahLD?=
 =?us-ascii?Q?VcLA3W9BEb117uEk2ukX1Omjkibx17EE6yO5uNx9z84kCBRtTM63ps/+kBzj?=
 =?us-ascii?Q?pzkE6jSsuW252C7LunvrZZ61rEalrc+hVuRUWwcPGiUqUBYUixvdeR0gCdtJ?=
 =?us-ascii?Q?57bNhCFZjWFFEFtIaN/qg9WcCUKUyVTLwq0Iih55rM9kjKfJF94iKFFiWDfr?=
 =?us-ascii?Q?ssj4rcHn3k3mY/nDXLv1MeQBOE+WSJyIjImcEn059/kwux9HH6UwC1JrXNY2?=
 =?us-ascii?Q?TYEadTJk5PDKK68CNVLwVrkk3jGAhpbmDwyUBvexcRRW+PasHj+VeRIf+jXI?=
 =?us-ascii?Q?eS4/z6unN90OHW6roNFyXBCtE75kX8/aoKDq7PJQc/LSKwjVIh136kkvo23r?=
 =?us-ascii?Q?rxDkf/7S5SfOUuc5iHILqhfAmQGYzIDr48g0sgLo9gcYW6XOs1g6Rlo4SsbS?=
 =?us-ascii?Q?I0aW+aXWnIvADHu4exPBGWEc001HfP6oTpNETDgHwLwqwtTSAOTDmUlqxD7G?=
 =?us-ascii?Q?yBYd/xztFQEQ55+eoZQmgDXYhs098AIzcY8GOFD4DjM14v5lJjfrdlrULWlR?=
 =?us-ascii?Q?oPCBhSSjEQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0649ed1b-a851-4a86-9f4e-08da17e5439a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:51:07.6753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTA1CWAvDB4S1M3y94c5UH+RmBU7psgLxa+9hiC/nL9YTSVD6kTf8Aly1UfThZpqrbTO9wPYuzLb7WJ/icO4ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4876

On 06.04.2022 17:09, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 06, 2022 at 02:47:38PM +0200, Jan Beulich wrote:
>> On 06.04.2022 12:38, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Apr 06, 2022 at 10:13:41AM +0200, Jan Beulich wrote:
>>>> On 23.03.2022 09:54, Roger Pau Monn=C3=A9 wrote:
>>>>> Hello,
>>>>>
>>>>> I was looking at implementing ACPI Cx and Px state uploading from
>>>>> FreeBSD dom0, as my main test box is considerably slower without Xen
>>>>> knowing about the Px states.  That has raised a couple of questions.
>>>>>
>>>>> 1. How to figure out what features to report available by OSPM when
>>>>> calling the _PDC (or _OSC) ACPI method.  I'm confused by the usage of
>>>>> this from Linux: it seems to be used to detect mwait support in
>>>>> xen_check_mwait but not when calling _PDC (ie: in
>>>>> acpi_processor_set_pdc).  I'm also not sure what the hypercall expect=
s
>>>>> the caller to provide.  Should buf[2] be set to all the possible
>>>>> features supported by the OS and Xen will trim those as required?
>>>>
>>>> I'm afraid upstream Linux doesn't quite use this as originally
>>>> intended. Consulting my most recent (but meanwhile quite old) forward
>>>> port tree of XenoLinux that I still have readily available, I find in
>>>> drivers/acpi/processor_pdc.c:
>>>>
>>>> static acpi_status
>>>> acpi_processor_eval_pdc(acpi_handle handle, struct acpi_object_list *p=
dc_in)
>>>> {
>>>> 	acpi_status status =3D AE_OK;
>>>>
>>>> #ifndef CONFIG_XEN
>>>> 	if (boot_option_idle_override =3D=3D IDLE_NOMWAIT) {
>>>> 		/*
>>>> 		 * If mwait is disabled for CPU C-states, the C2C3_FFH access
>>>> 		 * mode will be disabled in the parameter of _PDC object.
>>>> 		 * Of course C1_FFH access mode will also be disabled.
>>>> 		 */
>>>> #else
>>>> 	{
>>>> 		struct xen_platform_op op;
>>>> #endif
>>>> 		union acpi_object *obj;
>>>> 		u32 *buffer =3D NULL;
>>>>
>>>> 		obj =3D pdc_in->pointer;
>>>> 		buffer =3D (u32 *)(obj->buffer.pointer);
>>>> #ifndef CONFIG_XEN
>>>> 		buffer[2] &=3D ~(ACPI_PDC_C_C2C3_FFH | ACPI_PDC_C_C1_FFH);
>>>> #else
>>>> 		op.cmd =3D XENPF_set_processor_pminfo;
>>>> 		op.u.set_pminfo.id =3D -1;
>>>> 		op.u.set_pminfo.type =3D XEN_PM_PDC;
>>>> 		set_xen_guest_handle(op.u.set_pminfo.u.pdc, buffer);
>>>> 		VOID(HYPERVISOR_platform_op(&op));
>>>> #endif
>>>> 	}
>>>> 	status =3D acpi_evaluate_object(handle, "_PDC", pdc_in, NULL);
>>>>
>>>> 	if (ACPI_FAILURE(status))
>>>> 		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
>>>> 		    "Could not evaluate _PDC, using legacy perf. control.\n"));
>>>>
>>>> 	return status;
>>>> }
>>>>
>>>> (This is a 4.4-based tree, for reference.)
>>>>
>>>> IOW the buffer is passed to Xen for massaging before invoking _PDC.
>>>
>>> Indeed.  I'm however confused by what should be pre-filled into the
>>> buffer by the OS.  _PDC is about the processor driver power management
>>> support, and none of this power management is done by the OS (I don't
>>> plan to let FreeBSD do CPU power management when running as hardware
>>> domain), so IMO passing an empty buffer and letting Xen fill it is the
>>> correct thing to do, at least for the use-case in FreeBSD.
>>
>> I don't think that would work: Xen doesn't "fill in" the buffer, but
>> merely alters individual bits. The buffer really is IN/OUT here for
>> Xen.
>=20
> Hm, but I have no idea what to put here from FreeBSD PoV, as said
> FreeBSD will only use the processor object to upload the required data
> to Xen, but won't attach any driver itself.
>=20
> I've so far been providing an empty buffer to Xen and it does seem to
> set the right flags so that the Cx and Px states can be fetched
> afterwards.

Hmm, an empty buffer should result in -EINVAL from the hypercall.
The first of the three uint32_t-s should be 1 (ACPI_PDC_REVISION_ID)
and the 2nd (size) is supposed to be non-zero.

> arch_acpi_set_pdc_bits() does explicitly set some feature bits, so
> there's not only cleanup done there.

Well, yes, I did say "alter", not "clear", for that reason.

Jan


