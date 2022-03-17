Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF24DC279
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 10:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291439.494618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUmGH-0007Og-JO; Thu, 17 Mar 2022 09:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291439.494618; Thu, 17 Mar 2022 09:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUmGH-0007MA-FJ; Thu, 17 Mar 2022 09:17:37 +0000
Received: by outflank-mailman (input) for mailman id 291439;
 Thu, 17 Mar 2022 09:17:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUmGF-0006y6-Rb
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 09:17:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14c8c830-a5d3-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 10:17:35 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-rIr4e2BLP3uQaqmrYvZRzA-1; Thu, 17 Mar 2022 10:17:33 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR04MB3299.eurprd04.prod.outlook.com (2603:10a6:206:d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 09:17:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 09:17:31 +0000
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
X-Inumbo-ID: 14c8c830-a5d3-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647508654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0A0DD8xoSN/xSURiI+VTXGfezKsw6/gfLZ4R3L92edE=;
	b=luIKv2prIMP0Xh+VKaBX05wQK7YmmLilA32w4JWCDzQywCHmYQKBlTwJicGHvXy6TvgmR8
	fgHRkO5X/kGMAIhU/LeKhRuRwCXOXOHMAV2HentUWRqymCZNWA6IGgKabjKABmWvjZq78z
	9GhDZzYJSSSn+M+6zBiUo3EsPZ+lCtE=
X-MC-Unique: rIr4e2BLP3uQaqmrYvZRzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASyZrU00ZDty9b4tmNDGuR6Zr2GDlzVY3IOCasrGVtYyIpq1qmeD8Pdj6eOX3Kwu/QK5YDu5RTKW75kGakgJ4EAqYeQJ2+vBeakE4QDaO70ytOgi7Wm53heYr0WfEhbfqoQ6QPsnCWvfVzMzwUpYbSh68kLfWxDqIqMlRlhKE3kpaYDkIsdIrbae4laXF4RrpS1/SiLASbdPi5DPRsp/6iVtduaAvsNZjS/mSLx+x5+a7PSKDPyyP5YlPPlLFoL7l2bF5HbsHVbIXFlMqatkkf0mkaSMyEpECs+rDZYqX/whO0nCx0YhWBhyU2aHyYTbxpqVErqCZP/yrMsN8ywl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYhkLTumvEsULc9IAoj6RJhmvVG9juxDdMNjXQr2V7Y=;
 b=AsUKyPl0lpYvOwrALUIEXtuq7sfGwVHcvf6wHTbmqKjaxwpbrqGqnNm/jpjsr4PMHKYYp/fHQVlalXR7zSFTwcj7Ob2OyHkf/2AFlA9A5b4BFlXEMOA1ArZEitaH5+wVEBrIty5vV7L7xrTa9o2RB1M+XtYW2tNLmMu44o2GQ9WSOpAcXNB2+uwdxwfNiktwqmbuF0qfbA4pkH+6R7hwQGhgSqyZrZbJXsN4ClStiPSQy7GthTmxT+i+20+S0SEe1qqaPz8lhn8TiqekjtslrVPSPBsOhdaE+ysB0g7FC4qwXEXKSGZjb2eW4WBkm3ja0s+rxyiaTzuwcYbgCOozuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2adbd1dc-38f9-21b2-b38a-06835aa164d0@suse.com>
Date: Thu, 17 Mar 2022 10:17:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/cet: Remove writeable mapping of the BSPs shadow
 stack
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220315165340.32144-1-andrew.cooper3@citrix.com>
 <345b2f17-5fba-5dba-f7f5-c1634fc69a6e@suse.com>
 <101d1e70-51c7-036d-c5e2-fd382a2be7a8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <101d1e70-51c7-036d-c5e2-fd382a2be7a8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b88c5de-31f2-40e4-ead3-08da07f6f729
X-MS-TrafficTypeDiagnostic: AM5PR04MB3299:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB329925EA4A718084667CA2CEB3129@AM5PR04MB3299.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8GCAjKQ8FoiJCDKWzvYJuIwCBANHSFs3HF/v0pwkp7nxEvYdF+nxXV+SfyztqFt8hweQUiPxvurUuZbkyWbElvhmd1o0oTyw/PiAi3hwXsmnorxxLtK2iFYYivqUQl6vwjrk5JQ4ZdSMuRh53lPljWBcZJPg+CzwemsYPAkqydQJ6Qj8nvj0zJWZMXcOflufPzs4g6juVYAV25FISP7LOlyL9lIFzNvFCgPx9SwQ4JjANHOUx2+SKCJryMEzt+8jGtemu/MoYPWq5hTsTQK59hVVvSybWqH/tDNd2kwUa54C+nZqG1wz5VtJN6wowvdg9y591eH1lEFR2thOPS0WhralLj9LOoDDAVP2PXCiVP30UJkmvdhjWKxWMvlbCPBMOLYumDCvSYgb/XWn8Z9V60/hqe3LMAKJm65/yzU6+31JQki4sYRY/hoYF0ma9z41cH4XhDrCKGJVEjssQtMGeK/Q2BpHWe8zsens4oS0ZEXxr4L35Bm/SoIKvpYJrr/X5c7dW67iNoFluYKz76Pf6aM3EDSFv7xzcoi1w8AixH9wXZtrBQjN02T5EzggJaMRkCOgCNR4bwnSy391CtPO2gqlJkrwJiskazB8X+S+4AKTRlsGAMc/aZ6BhE4b+FETZZQyQj3LkDhnlP6FvtxerH9D1wOECic8vkyjgzTgXQqJkvWCOtw3xsq37kanGNsx6RffvaPzkpSm3GYAb48uv/xBFU5STrQReDm3ZY9Y9j8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(53546011)(36756003)(86362001)(6506007)(26005)(186003)(2616005)(31696002)(83380400001)(508600001)(6512007)(6486002)(66556008)(316002)(66476007)(8676002)(6916009)(31686004)(4326008)(54906003)(66946007)(8936002)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yFjkSHDqDwNZY/l5OLanK4ps//jD+j8xNQebwMn92MRBPRbd6JvLmZr9Se5H?=
 =?us-ascii?Q?XAPq92CDjyjLP5X2K6NXp+w2EJUqtD8Y3y2gTfV/1c5aaxD05ondVykCiRDx?=
 =?us-ascii?Q?PrfJsdfJ8JNT9Tp19Yc2jTQa8312FuOwpTAd/dbw+afkoacCtEvWi7N0Zaq0?=
 =?us-ascii?Q?w+33i9M6Y2vrQbS1HeuEHBX3k/nr6PeHLN85Q7Jg5deiBA+X/lLD4OvOTCTv?=
 =?us-ascii?Q?KRtwlhWNBKQApwgkaUmMvdet+yN9FIm6YLJAXQY3BtZ7qQ41w+n6EWQVbLlZ?=
 =?us-ascii?Q?Jn56HjDMwgB3Pb1VA9poAdJdwIpKtl5FmNfRm1D2ppSE82iaAdoZwhtub9Te?=
 =?us-ascii?Q?X8jRRIIFUwPAkTtk8YRfQslKrQjF7PRbMWAP4FciCr0evA81sAiU2G/4ZBlJ?=
 =?us-ascii?Q?oALouki/Qqd7l2OnN/Pc4nnDVlj58+c+fLp6ppMN6XDIUUXpq61biLCRwUGr?=
 =?us-ascii?Q?9TL9llAtA63vfPTTVn9VcobAl0QIpdz9AWc6tMFWxxUi/eZiimO0NP8921YT?=
 =?us-ascii?Q?uPzeYr+8amdw/kIvWXlaONmAaT7oGqJnmrr5n/Rh3d83blOF/4iS6bZez8qK?=
 =?us-ascii?Q?IhSetQFtGLdiUj82O9lrKspYCti2q5JBzCcRyupb+ZZs5VZ7UsWK9WOYHsZa?=
 =?us-ascii?Q?BcGMEzSH9RuNvoZe28oWcxOQ1RQ/kMcpUlSRk7LDl6pntJ6iGRaDsqq90clQ?=
 =?us-ascii?Q?tAFV875/HMrA33rCsL5IB6pMFeEdA2C5bJSmuVa5XEAReSlbnjowR7c+8e/p?=
 =?us-ascii?Q?KiCq2k6Zq5YBklI4N2HHAAANrynlERmF8uqY1MocNwLeOhQMRnRTjQkVkK7f?=
 =?us-ascii?Q?V2YnP5JVLtNUVp32ZEDTdIbhYHv8pXmfm3XKSj80/yFk4yXtbHlfOX9bjgoP?=
 =?us-ascii?Q?96QAJZb8xyn8m0qT2MG7W6dqDLGpQR/k1r5cRuMucAN9mPbYMJrCB3zdIOVP?=
 =?us-ascii?Q?SifnnOwHMl/NROkWy50NWBZWRVuSz+ugx1jQWumva0lTzYuJWTfLDAOvA+2M?=
 =?us-ascii?Q?RG1cXmRZHg6Npsziyqlk+iZOsQZhwnlb07gP4RLWXt/W7i9+wXfdehFAkJGv?=
 =?us-ascii?Q?tJWezFi6HXnlSK0sY0fSE4s+yysCTbVuO264k5f4A5Jcm3pYmF32Zn9hZ7a0?=
 =?us-ascii?Q?wvQ2Si6kvwSaH5vjVgDvBJKEnab8TQLSZKrghZu4J4GkBoBleZrzJxyy5EvR?=
 =?us-ascii?Q?mCnRfJ0ZhctbBecPiXmf5HYO4ZhZzCg0HNfqIE+Ir0f/rzSQxMfb4Hc/xgsz?=
 =?us-ascii?Q?Jde2Bh1T7meM2fC57pauZAFIaZK58RvnwplhhjPwcHq1jSc+WbOdZlJygxR7?=
 =?us-ascii?Q?LMQKJmCfUDFjRKW+x3khct2L98IzPQjR8MvwnaVvOrPNrpifN+PAgpQRNI3W?=
 =?us-ascii?Q?fVrr/Qwu9kuSNyoWZiBqYYehbWEVRXeVuak/YMAxrvngsRIN/Md+uM/O5R3C?=
 =?us-ascii?Q?uDIdoSXnZZCHufhl86SWwOGmZm4NvgWG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b88c5de-31f2-40e4-ead3-08da07f6f729
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 09:17:31.7977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpkWLEUV2g498AgayU91ykT3qIf1h5d0wf+X5Y87pBErhveDvSXFbnZdVJlUa4egwgB/3jODeMhGlYSYL4c9gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3299

On 16.03.2022 20:23, Andrew Cooper wrote:
> On 16/03/2022 08:33, Jan Beulich wrote:
>> On 15.03.2022 17:53, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -215,8 +215,9 @@ SECTIONS
>>>    } PHDR(text)
>>>    DECL_SECTION(.init.data) {
>>>  #endif
>>> +       . =3D ALIGN(STACK_SIZE);
>>> +       *(.init.bss.stack_aligned)
>> No real need for the ALIGN() here - it's the contributions to the
>> section which ought to come with proper alignment. Imo ALIGN()
>> should only ever be there ahead of a symbol definition, as otherwise
>> the symbol might not mark what it is intended to mark due to padding
>> which might be inserted. See also 01fe4da6243b ("x86: force suitable
>> alignment in sources rather than in linker script").
>>
>> Really we should consider using
>>
>>     *(SORT_BY_ALIGNMENT(.init.data .init.data.* .init.bss.*))
>>
>> While I can see your point against forcing sorting by alignment
>> globally, this very argument doesn't apply here (at least until
>> there appeared a way for the section attribute and -fdata-sections
>> to actually interact, such that .init.* could also become per-
>> function/object).
>>
>> Then again - this block of zeroes doesn't need to occupy space in
>> the binary.
>=20
> It already occupies space, because of mkelf32.

Hmm, yes, and not just because of mkelf32: Since we munge everything
in a single PT_LOAD segment in the linker script, all of .init.*
necessarily has space allocated.

>>  It could very well live in a @nobits .init.bss in the
>> final ELF binary. But sadly the section isn't @nobits in the object
>> file, and with that there would need to be a way to make the linker
>> convert it to @nobits (and I'm unaware of such). What would work is
>> naming the section .bss.init.stack_aligned (or e.g.
>> .bss..init.stack_aligned to make it easier to separate it from
>> .bss.* in the linker script) - that'll make gcc mark it @nobits.
>=20
> Living in .bss would prevent it from being reclaimed.=C2=A0 We've got sev=
eral
> nasty bugs from shooting holes in the Xen image, and too many special
> cases already.

I didn't suggest to put it in .bss; the suggested name was merely so
that gcc would mark the section @nobits and we could exclude the
section from what makes in into .bss in the final image independent
of .init.* vs .bss.* ordering in the linker script. But anyway - with
the above this aspect is now moot anyway.

Jan


