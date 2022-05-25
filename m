Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA4533768
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 09:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336887.561321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlXW-0004vt-6M; Wed, 25 May 2022 07:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336887.561321; Wed, 25 May 2022 07:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlXW-0004tE-2J; Wed, 25 May 2022 07:34:42 +0000
Received: by outflank-mailman (input) for mailman id 336887;
 Wed, 25 May 2022 07:34:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntlXV-0004t8-0Q
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 07:34:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 224e0a3d-dbfd-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 09:34:39 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-xdvVpxnKM1KxJn26HvTb6w-1; Wed, 25 May 2022 09:34:35 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5074.eurprd04.prod.outlook.com (2603:10a6:208:cf::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 07:34:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 07:34:34 +0000
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
X-Inumbo-ID: 224e0a3d-dbfd-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653464078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9XT3BA+4vUTTAX40MIGeXkp8Zfnj6fkA9USR6HPqXE=;
	b=Fh8+yqYa3dCd2uBp2PRho9zyoQ5UMv5GkiQO1pPHsKFbBuYjiD90u2bvO245PtlWavf0az
	yJ0b+RKgdqzYG5xPC3J0Jzf0Q2Q9LRNj1CdHnywYyLwBhzO96zIFGcr9K60rvAsPOi0nBC
	HwHJ0nSwL+V5H1hq4fXpFRJ87bBv720=
X-MC-Unique: xdvVpxnKM1KxJn26HvTb6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2SOm8gBXWh9ai/8orp/H/q/tjjGso0nX7qAt5qcjjPVENLFwJx4O6f2/vCSqqDe4glNdrUnNI0odpbMku/ujIfX1qsQwY3wmrY9zBiRzqhe3UXP2KGe0T722CH06siO1/dsofx6S6DyVwcu0MAUHH7uNLGEPKKTWxopIJQUWfAFNY4G/s17hBHVtbp9WAuiID6ygGidgK3J6ep7ujsxxx7LuF1XuqOBIW0EL0wUoVJWb+Ecp+O9/ZGBB4EHHRdXvam/RJEbgcWEEebEHQLLyi+cb+XBQcEIu3KhjoidryYUFZQaIlIQcdN/C3B9jq3UP8Uel2C1YT+gmzSBNEXbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqW6WifE+JclFIX6Pe5SaWbVsI1V6porN+qdVcQ0erw=;
 b=ANrbHIfxti1JLyA4JXlgKGSwpNM1W+rxN2/NidvePmyhHC5f8/ocuJxg6ybJ1LZSLnyEb80QmN8bGCqR1fK3qLecJb8wnGoYVsFJN3bNC60gvutABVvzYr0+b8JEUsGShykgAEILrUAI4G87eZPbFuJk/vTLKrsfBoXlSrk5yjoUiBh75nVRics5YO0Xhn2eePNCvexYfXwc/O2Edi9VJ5i9lCGrHvlUku4oZ3M8iW3sxRwmJslGSVcvHl4tppVcfkvXfn8EDtt/l6huDgUyA6p6WjuW+phj9sdcnENBWlSXf1HrYR48BF17dASP368MdP96RDFMHQ2zPVy6TE6eiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd186f75-88b1-714d-2c53-951e778fa5d9@suse.com>
Date: Wed, 25 May 2022 09:34:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] x86/flushtlb: remove flush_area check on system state
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220524105052.5210-1-roger.pau@citrix.com>
 <1b0b643b-a906-13ba-d414-feedc98428d3@suse.com>
 <Yo0L+mp5kP1zMU/d@Air-de-Roger>
 <dcbcb8a1-547e-d8d8-6e69-768533d24957@suse.com>
 <Yo3Y4l5ybrJA7VC8@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yo3Y4l5ybrJA7VC8@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0047.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6463d22b-e88e-4fac-e608-08da3e21037c
X-MS-TrafficTypeDiagnostic: AM0PR04MB5074:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB507428A299EB09C8A6E3230BB3D69@AM0PR04MB5074.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9yXRRWN/oTUdOIqN028YIzXGQq1Vw/hPa+dE5AlvYSvczK1cd8DB3GlBnkc0iuuBZAffksjGu/U7RmffvdtTLS1HIcULXChmFwhO8Ln+ewmzORbZc8aigWtH/dsPsPQ12x4QLPgCCghcRfmpk3DsVqU1nUTVrRdCBD2CNDmQK8Lw7x8DmCg8ZIEOen8xAVrQfkmbNyVak+iepZ+GbNztyhCmiwqucVUz3Z5YCgX0W9QO7LwJEHNSyGOPvZeqG0/M7Am9kmafEV0fj//qNzlpL/1yAHoK/5v3AB9DwU+/PaHiX1ETz+hpE1rXWEwRJK+C0pU3v91IU7Gv6719JqRgexEeZaUqKHlUhR6UuwvE2rwLyjlENTeAcKECpm0bp4YEHIdKSXRKPY+tI9kPxk7TzNDzw+FBEXECbEUL4mXBXqUNhlwXJUnQTBYOb9Gc3uvIsApbct15N9Y64Zz1pxq5lk6SSYYNF7f0gkjWih0BKNzIgcTVzmukpxL5OV2r7dGux4S6016dfDwGCDLfBDX5ZFSnVOOpUM8ahpKZCQ484NPLtLSgLbVQI9+VUvK3LqZg7lHmtAUF6csvn5uxcWOLu8XIL08fq/EmOgAefdpnP0046jevqdQbEaSbwD1cBHxc7Jv+UoXUKg76k1tPU+wKrUCzn0kOyqTV3KUIx/HPqcYWXWITd1yIRXfRtEBjWmGYkMUq/OA6Ii5ktJgWpjjT2lfzwg5/wo80ueuutkasiehiUGn0cyEGu63v3+9vMKDX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(36756003)(54906003)(2906002)(53546011)(86362001)(6916009)(186003)(2616005)(31686004)(38100700002)(26005)(8936002)(66946007)(5660300002)(4326008)(66556008)(6512007)(66476007)(8676002)(6506007)(316002)(6486002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FmR70wQn9rlVErGdNELScfq7TAOAmrTWCl5+iYVshTAMmmQnUIlV4VapTQFX?=
 =?us-ascii?Q?L3uAdIE5vkqKtlr9zAjAvYcZQWOJOSroTmEjYH8WFBejgMb070dGn07XkVKj?=
 =?us-ascii?Q?+ykkjBW6icMrL3pxLHIEfYJnzpOviLErcXuZItjF0e1iVbuteplJiVEkqXjb?=
 =?us-ascii?Q?HAhiJE8Zn3MG+oDupvgIQ5UZvvGNrqCpQTLxH4C7Fs6b9tQls1B2enKzf6I4?=
 =?us-ascii?Q?+d2BQDqUNiBBvrUReZMn5wOLnoJi6oHjaKY+wwwvAPhpm0mmpddRAVuEYndJ?=
 =?us-ascii?Q?bMzT+clrDD4XN4N8dTK25zYEiV5tU+7cCdHgAIJOVDp9wt/Otb/u+5gmMp5L?=
 =?us-ascii?Q?DCJj4ynxTBU4X03rCQFwJ4cvRn92dXkd13QyNdFQpYeezqoXxFZmznc5gOEt?=
 =?us-ascii?Q?MnvVgjCA6/eXx3KC+R7XUES3awVX9/qnpXof4EkCs6J3OkX3oBSWSrxm8A+7?=
 =?us-ascii?Q?ZCOnPYieC6dmGNsAMQqZ4Qocl5z/zejOCVy7lIXhoRi6KAPGmhmAluQ8Jyre?=
 =?us-ascii?Q?K3vfepy5Va5d4AbLa8z+TvW+i7MbD5daxt23pATDQesMpJe+V1dwhLJJUlyh?=
 =?us-ascii?Q?4wDrs33ABScLoDjbbljYnxVQc2S8sbqRLhA1mwvoNG35oI4lnbl4Tlo7KO7M?=
 =?us-ascii?Q?O1vz61UIU3GqURS+Qw9QJZTswiA2vI4EX9afM2+i+61iTcRAPBSyx1jBGczq?=
 =?us-ascii?Q?k57Uwkya1CZYDWBH9Qkg2d2irSbnBHzOCKQrGmzBzObDmBi+7WKETfZN2j3n?=
 =?us-ascii?Q?82pQtLrQ0EbwYfAvfLQ5sV0+2wsC3/Sa513YXBpQJHC5VDinNrq4z8W1L2R2?=
 =?us-ascii?Q?dNGHOw3aqm4kDgmEnnh/qCTeZqc6V/e+I+k2reo82JdsR9jJGRq3vi+oQQz/?=
 =?us-ascii?Q?uikLgcqeTTSt0uv8T2TKM4GW/+ONJPm0i4vh8felSeM3OTPxxDIwyS42+9A8?=
 =?us-ascii?Q?3Ijxjs1FSM3s2rAHwW//MYeVHSd2WQApP+rnwBMGsg3cyeOr2g7LGd3VcoPK?=
 =?us-ascii?Q?4HpTRoGPWK4fvC2ilVPOXnjmQJJZ0AeMnqRqhuT3tl7kh5GqLQrSkGxVT7Zv?=
 =?us-ascii?Q?je0bON3WaxQ5/s0PCanObxgcC5pPvs+7yllHBZ5rGTTTLWgzaHckorK+dwFI?=
 =?us-ascii?Q?srExi6VFWHWqNW+gkpdmXWKJtGkpDgTIKsimElPG9F+jkAx+iszmt4vFZRGm?=
 =?us-ascii?Q?DbUDQwtca/j8wF5toTTRRqK3CwL32ffjAESqn7P92RxeJkGJ1irO8uXVmUtZ?=
 =?us-ascii?Q?0PS9WKv/nDQqwpnPQZvzFelmdADImsIgYljCG8Xrv3p9RZ2nWW3Q7QBT6ckz?=
 =?us-ascii?Q?Q5L7Z/b4Y35n3UhP4mwXA63F0qsNiMWFhboy2JoNA8WwJnjvHf+U3Mn8C6Gu?=
 =?us-ascii?Q?IkErTqO+x8AepMR7PeXXUuEbdE67XTPj/EgXlQvlvmQmJkynhhUKMd8BlDkv?=
 =?us-ascii?Q?qsXmkCrXoqp1iRJah/oB+TjU0yFjcGifgdukiZ/jq2Zgi7N6hTHCRleI7EF5?=
 =?us-ascii?Q?fgWdz38fsiBpaEvJa6F68i8Hj2HO+2Lh48k6VXcP0GRZ7yf+q9Ou81HGkjzq?=
 =?us-ascii?Q?JNr1+PgQxDVymn1YmHEJ9emvC1LFUGyft8is2Nk2DV/EGz/0bx+TVPpWxgO7?=
 =?us-ascii?Q?NrMCep0jD0MTCDOxxs7WsHXjDBqrNpsYK2YQsTfHjnNgpLR1oe8B+vsCP23B?=
 =?us-ascii?Q?jmIMGPY64xRYL5LxGtYOhK9BmFGq/qTb94N8S4CHbplDuOSfazKbPEQHVuuf?=
 =?us-ascii?Q?Vk8smlN9PQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6463d22b-e88e-4fac-e608-08da3e21037c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 07:34:34.0800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfD++wMM11t9Ek8Doawj55FzPvK/7ldYjrHBs7KFM1KizMLTm+xfmtB76MlO5uVvp+mrAmQAJ0+WFr+E/AFNGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5074

On 25.05.2022 09:21, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 25, 2022 at 08:02:17AM +0200, Jan Beulich wrote:
>> On 24.05.2022 18:46, Roger Pau Monn=C3=A9 wrote:
>>> Would you be fine with adding:
>>>
>>> Note that FLUSH_FORCE_IPI doesn't need to be handled explicitly, as
>>> it's main purpose is to prevent the usage of the hypervisor assisted
>>> flush if available, not to force the sending of an IPI even for cases
>>> where it won't be sent.
>>
>> Hmm, yes, that's even more verbose than I would have expected it to
>> be. Just one point: I'm not sure about "main" there. Is there really
>> another purpose?
>=20
> Right, I should remove main.
>=20
>> Of course an alternative would be to rename the flag to properly
>> express what it's for (e.g. FLUSH_NO_HV_ASSIST). This would then
>> eliminate the need for a comment, afaic at least.
>=20
> I think it's likely that we also require this flag if we make use of
> hardware assisted flushes in the future, and hence it would better
> stay with the current name to avoid renaming in the future.
>=20
> Whether the avoidance of sending the IPI is due to hardware or
> hypervisor assistance is of no interest to the caller, it only cares
> to force a real IPI to be sent to remote processors.

Well, then it could still be named FLUSH_NO_ASSIST, since as said
(and as you look to agree with) there's no IPI being forced in the
general case.

Jan


