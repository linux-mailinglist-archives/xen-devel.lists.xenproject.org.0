Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C95C53385B
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 10:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337001.561464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntmKc-0000r9-1j; Wed, 25 May 2022 08:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337001.561464; Wed, 25 May 2022 08:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntmKb-0000oS-US; Wed, 25 May 2022 08:25:25 +0000
Received: by outflank-mailman (input) for mailman id 337001;
 Wed, 25 May 2022 08:25:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntmKa-0000oM-Ik
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 08:25:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 385025b1-dc04-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 10:25:22 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-2ZnN6_5-PDWemgx08xxTqQ-2; Wed, 25 May 2022 10:25:21 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4476.eurprd04.prod.outlook.com (2603:10a6:5:36::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Wed, 25 May
 2022 08:25:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 08:25:19 +0000
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
X-Inumbo-ID: 385025b1-dc04-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653467122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2me7tb3mSHiU9YqXajMUu0sxh+Usbk71xw8ljT6BIE=;
	b=g40DBMqRhtIsDbG5JV0TRfdfnBUBL7XUb8/YdfULbYALcvveYzT4zia7pvghk93xWxHveg
	L/phMBvCv67lAu1oUEHGiRuW/X8SZ/gjrjx1QAJR2kfkXZAD6ytlZkc66RHEXWOlseybWN
	Fpgdn5a0zTQRJfCnaXYUX5VqhG50/Rw=
X-MC-Unique: 2ZnN6_5-PDWemgx08xxTqQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhYa+r/Rnmf/pPtfJKgq33JuoGwV4bXL1MCpFG5CvEsPxazyerLUdE4CbDDP+Mzt+Pu6BZRZqrEtATEsoN4GnZsIS35Q4XpnjuYWi077h5VBRbdNnNyAxXby6Qjdi8jTcDvaKP3PChFSKo5ngQ1ictwjgpj/oG02mlMiOQaMwnIsoWTHHJ1Rig+QKHxV+3KniPFrUSoRzd+uqNbTzMWJKvq8BgbVbIRzSgXuD+qs35VOq+jCySc+Ppc7p43Yk92Q39dQlyI62ja5x+Y9N9vaY5vGiyF+LjlCW/LG0ZAfrJFnSNXi1U068oNwj6fFGm38TIrLjyne0tr+fBGqSlpHQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2me7tb3mSHiU9YqXajMUu0sxh+Usbk71xw8ljT6BIE=;
 b=cBYE1193XpQB5LY11/FiS3SjO6Ui89Xem9YtBabJZP0EvT0HXuenTCS5pNIBIY1muy+wazvEAxkIGhVsrYRsTetsePq/UAF13fA2HKlkSrj/FjaBJB+bDy72FYq4QSDqq4Hq08lPxxG2agFX+lPBgeBoqOLD/iuRVzZYUgLzxdeKk/D05/gWyYIVajbfEE2KfFwsIjYTdoZn7Kac6egCHKpPENpVkmlo5MEZf7G1Q5/+Gd1dYkz0BR5K4j6gcz4vA3DH3q5ZLKaQWKy9qswwTzf3VUaPEHo5XahG3Ti+EVTamByf1lBI4eDilxMaYm5uY/duz5vdqVXYOQcboLScyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62f142e3-02c7-22e0-3917-3a29fa2630b1@suse.com>
Date: Wed, 25 May 2022 10:25:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 Bertrand.Marquis@arm.com, George.Dunlap@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220525003505.304617-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0027.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::40) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f4a2303-ef84-4642-45b0-08da3e281a66
X-MS-TrafficTypeDiagnostic: DB7PR04MB4476:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4476CFDE146941D12052F90CB3D69@DB7PR04MB4476.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yO38tytYm7pjRuFfuTPo9Eqv5hsfTW5YM0NnwRvpuk4/TQNY04gTtLsC0Cgk+qRlIS0y/s1pl5yOq9ghp+iCi93mp/Pq2RvgPEil4bEmUL7SjEBqTR3s8Y33PKDGm8jAWz52djQLMtZGhUTW2K+yAVIvn+yfHiEwBK0i9nejP3EamzX67VtOd9UZRhn457PGRBJirdk1dr11gL4sarWDXXtHYacUmzpHos5aq/rLdGOKdYhVC/2GpqgR+RGj7/AcQ70DkahfSYEaum1aNVbMpFLdUoA/3vnU9l6pUHbA0s5M5PwOnQYwkTJurZJHN7H6lo5zpSd47qfTqLfKCkqqaof05plQmqnGtvpdSOKdYqeTNtuhmx/3q1TzPhwQWnyTJT3DThEfHiqZ21PccjXSIYNSGDh231vOcesZ0RyoKs4iWygpajlbkhxu9Lm1d1uoS7Immo2Y3HEycEw8waw5S86wbEWi54nekgBl3Zlr5juhs1qLJalrDoT9/DbdlvrIpRRZJRCnWqHu/C5FTg68aS4ymC1EAa9PeH1HmYO9aSyUYmov8gBw7wMxi1lPq6yweJd5LWm0nka+Cc3v6HJfnmSWQVsdYX4t8nvFh/jiF+kSvNwwz+XYKBwWoBdAG30DbQ7Zh00Q1TeSlUWdOsSK1+HNELMhq8Go7F/jXDAuItW9vyuavrs7RtkowwGbJqPzIvZA+CsJEsJ7VDslMSfPu45J7jsva9SmmGNIbgPw/NUQP5dNoSharuYkK4D0ergBTy+ljihAI+7jTyH0tSezsu1xHyPFmR0nMUxTJ2A0zti63t9n993G+pQcfW9j1T9RN0cxzwfZKFK8t5OFmWYZ4Fyj1JavDg+YiP987PaIfx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(2616005)(31686004)(36756003)(2906002)(66476007)(6506007)(6512007)(26005)(966005)(8936002)(6486002)(5660300002)(53546011)(508600001)(316002)(83380400001)(31696002)(38100700002)(6916009)(186003)(8676002)(4326008)(86362001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2QxY2xBT3lFaW9VNnJYbHA1cThoTEFDUWczSDVjQkJKRlVGNkVXSXVUVERH?=
 =?utf-8?B?ejFVTDMwWm9YMlNCV0UyUXhFOGY5bGlObWoyK09zcXdhdFFndlBwbHRaekE3?=
 =?utf-8?B?bDV1UUNYODBqR290QjBZOUJheHJYMzg5bEEyRXQ1bDAvbGREVWdNWG05eGdZ?=
 =?utf-8?B?MWNFRWIvS0NLd2Jyb2JLQUpnZllYRjVWOUtXZEgzWGZRc1gydnVLTVhvbkZN?=
 =?utf-8?B?YlJ4Q2JsOGcwaTlwSE9OU3RML1ZrM01vZ2lrcnZnellhQThDeTZhdU11akZO?=
 =?utf-8?B?Q2pTYXpPaklwN2FtZHFodG5oK29PNW1UZUxBZlp3MjMwbjBYMmVPNGhvVzF6?=
 =?utf-8?B?RHVsbU9lN1ZhK2ltWHZaQmhlY1ROYkl5L1BocklHT0R0ZXZsOXBaNTcrNXJz?=
 =?utf-8?B?M2tDVGtyc3dJeWFrbGw1QnlrVzFzNVBoeEJoSjRXOXhENUJETkFTREZlSVYz?=
 =?utf-8?B?TG95WlpsRnlxajhIQ0pyMTQ1ZVJ1WlBpaFk1SGVPbkVhMkEvWmhGY3Q4RGxI?=
 =?utf-8?B?ZHZSYXpNbGdnaFB6REJybEVEeDRPcExnMWpoUnpFak9zeG95MTR2Tlp1N1RZ?=
 =?utf-8?B?QlpJWXI3Nzd3NXF4NWRsVmQwWWZaZXRoREV0a3kxZkZubUZyYXFieFlwYXln?=
 =?utf-8?B?azNOTjBNclRYc2lHVzZSbDBsbDVEeUhweWd0cExQNThXK2NSa1EydGhHV3l0?=
 =?utf-8?B?dE5IVzY2K3pYRjR3SjZDYzRQTUlwZVlCTXd0dWNET0E1QW9wNGF3eU14dUdB?=
 =?utf-8?B?Z3ZFZGhGSnlPWUkxelZ4MWt2dkFadStvY2tuVjFUOGtXcDhOM3kzQ2JqYmNW?=
 =?utf-8?B?c0MveU4rTTdIb1pycFJoVWI5R3pualBPY0dWVFZrQkVXRFRhT0NjcHRIOE9D?=
 =?utf-8?B?YU5Qd2FHVzMrZ1pKNWZnR2FEenUvcko4TTlnWUJJRDF5Q1pDVFhWTTZzMGwx?=
 =?utf-8?B?aXR0akhIK3ZNS1dnSHZwRGpvUWhHUW1NNGp0bXMvbDVTYThVbkNvdnpLblYy?=
 =?utf-8?B?MDQ5aEEydndpdUNIazV0Sno2NUJpOVhublQ2TzRnVzIrQXptSGsrSVpKUmNE?=
 =?utf-8?B?bGVhb2xlbFJUaHdXOGg2Vk1Ob2FHWTFDMHNpcUlBRnA5L3dmQnhRVFBNUEg1?=
 =?utf-8?B?RlhaR0NIWkY4eHNMZ1ZEVm92RjFmSU00Q2VmTGRlZlU3VFE5ZGVralBXM29l?=
 =?utf-8?B?Vm9Oamd0OTJVTzZEUEU0YnBvVjI0UGtoVVAyaWwrcHFqR0c3UStQM0IzU0ZU?=
 =?utf-8?B?N0sweStJWUJvWm1mdmp4R3R1TXZhNVNMU3FhTGJPUU45NXBoTWhrWFJVVWUy?=
 =?utf-8?B?YmZHTkpJUFlTZW9mMVVDazlaWDFIcFZ4dmx4S0F0QXQyTnlaVVRjV2NlSFV2?=
 =?utf-8?B?TC9wNjU5QkVLSHNrNGNWWWZJVndnSi9IWHNkMXZtdURrOUhkU3E0WlFDaFEy?=
 =?utf-8?B?SXU1NlhOeWFIWG1EWFJFQXBQZFFDKzZpTkJrYWFTS3Z4QVRFNWZCdWVhSG5B?=
 =?utf-8?B?bmtHUDZwcHV3Zm1jNEM4WTliSGZNc3lmdXdEeTN3alNocnlWYTFTWitKUmN5?=
 =?utf-8?B?b0MxcFBJZkhubFJsOFVYUFJlZExBNnZwNHgxSExMUndSUElNRWx4eHgrYlY3?=
 =?utf-8?B?eGRIK05xalNRY05GZVpqTlJydDMrYjNSQXc5R280VDRXTm1jMEE0RU82L2RP?=
 =?utf-8?B?dHpjWUt0SkMvQmhXekk0K0Z6azgvZFpQcXAybEM3UkhQOExlYitRYURXSE5a?=
 =?utf-8?B?QS9HdXUrcXU5WCs3VDJwVXdGaGRZdEM5Q2QxYnVXR1NzQ1JOemoxVUkxNmFH?=
 =?utf-8?B?Y284S3gzWUMxTTYwcllzYThpMTV4cHB5SE15WjhZcmIwVUhWdkpxTnRFYmlM?=
 =?utf-8?B?ZlBMTjJMczZqSGs4RUNKelpVb3FEMHVMdVp0Sjc2M2dkZzY2bmJSdUkrb3gz?=
 =?utf-8?B?S2N6QjFTRWFKcktIOTcvWThWcmgrOVN6eVZaakxIWjZ0dUcyb05hZzVYaHRQ?=
 =?utf-8?B?cHdQV2FMT09CaDJxYlgvU2pJejdCRjBPN0JpSUU0djVRendDR25lb01yNTFM?=
 =?utf-8?B?dVg2Y0NTSmR5Z1pyUVFkd3Z3MGk2ZzdaRW4rNFNmWGxrSnZ6ZmJVYTRiMk50?=
 =?utf-8?B?UkR6NnJhRFpzZGdIRHFTdVE3NjZidHJUTkhORnFDakFsNWdmQ0xnWk5HNzBl?=
 =?utf-8?B?eUgyVGl5WTEvd1gyeEh3L0dOdVl2dGRlWUZiM2dMZ3hHYUY2MENwTXlNbENk?=
 =?utf-8?B?ZnhKemdLSFJoVmNuKzBqNVlIMzlIUUM0bHloM3RXenZ2ZSthUndSMnMzNmFw?=
 =?utf-8?B?N2d0cVhLL013TE9KbnYrTVh5NTZhOU5WSVc5K0oxYzVKNElLTkFnUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4a2303-ef84-4642-45b0-08da3e281a66
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 08:25:18.9964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/ADdFwQYGrRbJUvWQpsaKTO46axcY4PjcWbyr47+yfwt55gzMWN+3X9JL3h47bV71zwrWpcoyI8vE5JvYWMfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4476

On 25.05.2022 02:35, Stefano Stabellini wrote:
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -235,3 +235,9 @@ callstack between the initial function call and the failure, no error
>  is returned.  Using domain_crash() requires careful inspection and
>  documentation of the code to make sure all callers at the stack handle
>  a newly-dead domain gracefully.
> +
> +MISRA C
> +-------
> +
> +The Xen Project hypervisor follows the MISRA C coding rules and
> +directives listed under docs/misra/rules.rst.

Putting this at the very bottom isn't helpful, I'm afraid. I'd rather
see this go directly after the initial paragraphs, before "Indentation".

> --- /dev/null
> +++ b/docs/misra/rules.rst
> @@ -0,0 +1,65 @@
> +=====================
> +MISRA C rules for Xen
> +=====================
> +
> +**IMPORTANT** All MISRA C rules, text, and examples are copyrighted by the
> +MISRA Consortium Limited and used with permission.
> +
> +Please refer to https://www.misra.org.uk/ to obtain a copy of MISRA C, or for
> +licensing options for other use of the rules.
> +
> +The following is the list of MISRA C rules that apply to the Xen Project
> +hypervisor.
> +
> +- Rule: Dir 2.1
> +  - Severity:  Required
> +  - Summary:  All source files shall compile without any compilation errors
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c
> +- Rule: Dir 4.7
> +  - Severity:  Required
> +  - Summary:  If a function returns error information then that error information shall be tested
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c
> +- Rule: Dir 4.10
> +  - Severity:  Required
> +  - Summary:  Precautions shall be taken in order to prevent the contents of a header file being included more than once
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_10.c

Like Julien has already pointed out for 4.7, this and perhaps other ones
also want clarifying somewhere that we expect certain exceptions. Without
saying so explicitly, someone could come forward with a patch eliminating
some uses (and perhaps crippling the code) just to satisfy such a rule.
This would then be a waste of both their and our time.

> +- Rule: Dir 4.14
> +  - Severity:  Required
> +  - Summary:  The validity of values received from external sources shall be checked
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_14.c
> +- Rule: Rule 1.3
> +  - Severity:  Required
> +  - Summary:  There shall be no occurrence of undefined or critical unspecified behaviour
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_01_03.c
> +- Rule: Rule 3.2
> +  - Severity:  Required
> +  - Summary:  Line-splicing shall not be used in // comments
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c

To aid easily looking up presence of a rule here, I think the table wants
sorting numerically.

> +- Rule: Rule 6.2
> +  - Severity:  Required
> +  - Summary:  Single-bit named bit fields shall not be of a signed type
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c
> +- Rule: Rule 8.1
> +  - Severity:  Required
> +  - Summary:  Types shall be explicitly specified
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_01.c
> +- Rule: Rule 8.4
> +  - Severity:  Required
> +  - Summary:  A compatible declaration shall be visible when an object or function with external linkage is defined
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_04.c
> +- Rule: Rule 8.5
> +  - Severity:  Required
> +  - Summary:  An external object or function shall be declared once in one and only one file
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_05_2.c
> +- Rule: Rule 8.6
> +  - Severity:  Required
> +  - Summary:  An identifier with external linkage shall have exactly one external definition
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_06_2.c

I don't think this was uncontroversial, as we've got a lot of uses of
declarations when we expect DCE to actually take out all uses. There
are also almost a thousand violations, which - imo - by itself speaks
against adoption.

Jan

> +- Rule: Rule 8.8
> +  - Severity:  Required
> +  - Summary:  The static storage class specifier shall be used in all declarations of objects and functions that have internal linkage
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_08.c
> +- Rule: Rule 8.12
> +  - Severity:  Required
> +  - Summary:  Within an enumerator list the value of an implicitly-specified enumeration constant shall be unique
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_12.c


