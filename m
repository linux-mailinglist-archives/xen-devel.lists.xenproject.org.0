Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B33052B24D
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 08:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331649.555196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrD8P-0008Ex-Se; Wed, 18 May 2022 06:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331649.555196; Wed, 18 May 2022 06:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrD8P-0008Cf-Pi; Wed, 18 May 2022 06:26:13 +0000
Received: by outflank-mailman (input) for mailman id 331649;
 Wed, 18 May 2022 06:26:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrD8O-0008CZ-D1
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 06:26:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 680c70c4-d673-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 08:26:10 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-QdaMWq4UMVikErmKxS3qgA-1; Wed, 18 May 2022 08:26:08 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7812.eurprd04.prod.outlook.com (2603:10a6:20b:245::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 06:26:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 06:26:06 +0000
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
X-Inumbo-ID: 680c70c4-d673-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652855169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=udtt9DZaHliwyybm45+TNCq+fZwZ5FXpsEEgrQuDyuc=;
	b=glz0lsvjPzEV6keGfs78k5AfMXvLh6M4G0pRQk42QcXmoHUepEJgz+9X8BEGJr1vo3enFd
	Gieiu0RxMUtQas3jk97RSAX8qHauft5Ci75A7S7rjUR6bDAiqehFLQeFV6zQmKJX/5UOlr
	1IqaCh6Qx+K6vIgV24YowZITpSz03Mc=
X-MC-Unique: QdaMWq4UMVikErmKxS3qgA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzZnXAfwYteEGdGsk+MHOv/Lh5RBtzxYn66BWSi2sW20ID7OMmzGMH18PaauAuy+6g8r5vY9jHSig7uVmmCxKBjfqhpzm4bnX4n0hOC69sZ6GeeBIAqaATizHJk+48aWA1wtIiMQ2kYrQxEN7oY+oCdiHFNrKhhMUObUy2svakNuGu1F3XFxFe3Yf4azPfgsOUIljL7kPZpsKKPXV1LK5aMfpaTEfKY8By+cwIR6ujyfUTBaiOQmfRdArOv4g9kcGCH0FH283QP2H6ndxovDtnwVp5bCZFdjvcwrNpe702617zzGxw6jxHA81hYqfNlW4/CG4/QzxDr6baxLuQIM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6DU8D9HB3drtRuuSaHOegBjamoMEXyE7bavKOxLjNM=;
 b=ZhjvuW1p76mcCJkvhlV8fVoLrJutgvfszFihGWHNNdPGiDzmWoMbL8k9C3WyXdASjP9ZXWI76e9VZaRdSsNQx32Z2CuDBp5b6aoOo1IkIfrMHZb3dIqfISaW+Wo4lYJSp5QVlYRMfz9HPhgPM3D6pxBsABlwB2trtfBSIdREdysd/IWdR3fJc8Rv2/x7YfFC+lHzV6EXYxXZO7IwAhhY0L2nTpu6dQvKCAdIQQ6+2VWGYeNDWQNrUYqgtK2mLPVtlkFmacog+EvFLApyF7JIPTn1EDBaWG8NlYOY1S6dsc1rhfuaU1V0W7qab3lmwMIc8FkBg6oVmguxgMDEZhFjEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c655c9c1-2d16-6358-38cc-df860341cee9@suse.com>
Date: Wed, 18 May 2022 08:26:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] x86/p2m.h: Add include guards
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-2-andrew.cooper3@citrix.com>
 <000745e7-0b0e-386e-861e-901319defde3@suse.com>
 <e6e6c211-3915-af72-d077-0bf77b6a6a9e@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e6e6c211-3915-af72-d077-0bf77b6a6a9e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0033.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12c1ca5f-a9c2-4d89-84ff-08da38974a3f
X-MS-TrafficTypeDiagnostic: AM8PR04MB7812:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB78123D7E379C2F4C1ED2DC34B3D19@AM8PR04MB7812.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yOkOWqGTAycltA2qPeBNBdPrPZ4B81AK1V/5v4IXF1kxEzRzRUt6z2jN6vc+H7JpPDFoJucpJg+6729AYAW2ItgTqZXeDVn9A6rbJ9iNnGlm0WSYarecadHn4/Ljh0M3iyCGWsB58MRb1LroMYOkvwuOxIgvOWEl+F92KnQp2AlEYMYxMp8+2yiFJP1Z4CA6NIIPM381SuOY/umS02KGWChem1maGEv0H5nu+7x7DKZ84iJ/K0pwOvpfbnXIijG55HTY6xLlab3lnyfyTengbZ04y0/vj8tWWBVu+XgbxuAhW8ipY6Fk2V3R/7rYipHxRce0lpq+EJ+OzkPkp00hThsLR+gFiS24R/bz8wzeyl17JkU5poAFgld4vaXv90wBb9970iI4N4QKQju4WqaTonhiVZKFVxQugeE8RZ2YHdxS5reydUufsyPY7er3kGN5/Zh06o97NPz+ov7YQyxpXTBkLS/M04ABjWHkI2IztZAV3EIc7UzKEnOsALwCOZA5w76XTLzqy06axK4YhjcKLoUehGy7Z7s3tWrcGlWgBr+RfsK4v3jhN/or2JCUTqlxzbJXHDk2vLdkYW9zQWDNrqZ2zmCVsZvHb3aKEx6rPBnjf7oY+vIBsnVhpPRuE2xL0BW1/Qj+LMhO+rzKBUmX1QKhCm2gzUecrei20JAxJE1vWhs4zUA8lcF3pvPioAv+HY+Wz7nYMdIG6VDGDE5W1vQC66Hx0n+B42vYCvz1H6ag7zHdcloa78tqCNkO9zbZi82STv2mduJWqpyVS3eEjy0KWNu38fKoxWHX615dwPM9HBiOoKAhYMqof9XUAyk9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(83380400001)(508600001)(8936002)(54906003)(316002)(6916009)(38100700002)(186003)(2616005)(53546011)(86362001)(4326008)(66476007)(8676002)(66556008)(31696002)(66946007)(6506007)(5660300002)(6512007)(36756003)(2906002)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bngt/BHii0u+9VsPybepiUBNDNX+h/6klP0SBVg1CnANecp0vW6ukudoiQrs?=
 =?us-ascii?Q?cAfb9yh8EWWHOl6MspAm9TNLZn4rVXaleQ+wpWNFbq0+A0aGj5c7obL+tirr?=
 =?us-ascii?Q?jr28W8U0LQZ31akKJFOJVxnztdDJwIBPl+KirFfAqmzJ8el+T+/FPIBAOcwV?=
 =?us-ascii?Q?vXBsBnYg7L5Ss3bIiAAEmbLZVAGQs3kVfhKpVeomi+gDJuDc//io6RJwWIPT?=
 =?us-ascii?Q?2mnBsXTqjUpBl0N0zoWdGrfM57BGTfs/LCxsvXmq8b3fRuQM7bitbU1uqdhw?=
 =?us-ascii?Q?D0+X+wRY5GnL3ycJQKb8NdSv1o2K+U68Pc2DJrC9jZr0JKMRlCPo5yz0O/0e?=
 =?us-ascii?Q?puuTY6Yt0v6oNlw412xnvMgb9nAbVBDGdvX1Z8Ti5cZ58nJjzuE39FtFQQDh?=
 =?us-ascii?Q?kbpKYC5qbQ/WBLLmDJAniD5bq1obw/EW5pUTQJ3VCOzfjFIM8wdxYjKW4yH4?=
 =?us-ascii?Q?7b4+XboRuGeYWriYl31HYrDhS5cLkBTN1AZ4mnccqeuQAlx0i8I4r6uzTskM?=
 =?us-ascii?Q?VItqSnLo4+PYooXGsdcTjR2gUCoEY7FyzkYQwRt9SSdmv/b+E5u92ao46Cl/?=
 =?us-ascii?Q?Hai8ebpJRrE75K6VzJ5K1PSUgIctdb95XuKKwME8UEKMcU4Ni2zvk7K33Lsz?=
 =?us-ascii?Q?/R36hQkO3VCF83crPoADX/KiC6o1CpgzsbW/XpUAq/eh7S2DlG2hCL9a/xuQ?=
 =?us-ascii?Q?LKk6DfDU+9eKzyhqkfPQiXLJg2MTxWH1YcZzDTnZChi7T8yUo6ZK51Trf7i5?=
 =?us-ascii?Q?oWOWSobrwwf9FR3hH0UUo0moYHQoACdBDKdC8BTvsX9MJTSkBqqsJ3eTEL4A?=
 =?us-ascii?Q?md1B/AntxQsTqI6X5zjPOq2C1oh5xmBGlFwM55WsD7AOnirxu5eu6+ugPuDB?=
 =?us-ascii?Q?uprYeew8EOdCdQgav3wTADse2cK1qzwxvZOuvbKlP6gDewycFPZolVKrOeeT?=
 =?us-ascii?Q?md9L81Du7WxRWO1JkgPjKakL7Mf9WNhzMUTXs15raKYvRtj3a0FjVAyjdkwN?=
 =?us-ascii?Q?JboeE6yoKmbz5vzbLS5bQUhFbkE+a6P7HGxEiEVt3lSYAEci80/xqD0OK09A?=
 =?us-ascii?Q?vRoEmxfml4d9q6xwHxZPIVDR6aMa950zwcXtjFCoHyApVoDYHn2zs/CqYL6C?=
 =?us-ascii?Q?rjAJtsPL37FMN5fY/Yl3Wyt5nm5cYv1cwkCcqsANbCNqb4NGaaia+mNrbilN?=
 =?us-ascii?Q?I9B2bHCQimCoFotTpq2zEEpzkY6yhs7vsNiUDmWy0RYHOAaZz1joI/ZZ9HdV?=
 =?us-ascii?Q?wCvQDkJluu/vmt/mEFvtZm2PN1OzjZ4DnFmI8AP3RB7a33G0nIcpRZMq/CtI?=
 =?us-ascii?Q?c2Qt384A5Yqcny1Tz9dwWTakWmVe+9fwXIeVWmj1Hgn8Sq+uBQr7+eKEPVz1?=
 =?us-ascii?Q?A28EEV2SQxJ8FohOqFS+tV0Ki1WdxUv1USJ7HFuR0dOAOWwfZvW1dqRb1CFC?=
 =?us-ascii?Q?5mxzB2tS4Reo0IwvcbWnqoO/r2X0ov54bX9cfzVFfuqREsX0Jl1X+e29asqD?=
 =?us-ascii?Q?Y9WDCVx61cOH0qCQFWrW4EzzRoLCyD5N8yvl8B6u7NFA29EHHH6gZPMxzFrC?=
 =?us-ascii?Q?5pd5pysQE0gr2kT3VtG8vUZiAqjULXYYUVtp+REUdvdGH9xynM5+HR4UIOP6?=
 =?us-ascii?Q?+vinyIMott+7wc2kftjRCB3UJ08ZxFPjt7IkdKqHeeXNw2hAhTeTrbgC3SB0?=
 =?us-ascii?Q?Fok3M/O8IsmVJOYKVxnbHs5abK1b6xAJrWfCK+R9J7ts+Wl2ALaEN0gPgDRH?=
 =?us-ascii?Q?p0Z3CC8AAA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c1ca5f-a9c2-4d89-84ff-08da38974a3f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 06:26:06.4802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZt5MUOnbTdom+AJawMK60Tah6vbninG64r2b9KfkcueynhZOwCEFRTlkRiw5z9+b8B/unyIsO9GyZ3M+dn1pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7812

On 17.05.2022 20:42, Roberto Bagnara wrote:
> On 17/05/22 17:38, Jan Beulich wrote:
>> On 09.05.2022 14:24, Andrew Cooper wrote:
>>> Spotted by Eclair MISRA scanner.
>>
>> I'm sorry, but what exactly was it that the scanner spotted? It was
>> actually deliberate to introduce this file without guards. I'm of
>> the general opinion that (private) headers not to be included by
>> other headers (but only by .c files) are not in need of guards. If
>> it is project-wide consensus that _all_ header files should have
>> guards, then I'll try to keep this in mind (in "x86emul: a few
>> small steps towards disintegration" for example I introduce
>> another such instance), but then it should also be put down in
>> ./CODING_STYLE.
>=20
> The rationale of this rule is as follows:
>=20
> - With a complex hierarchy of nested header files, it is possible
>    for a header file to be included more than once.
>=20
> - This can bring to circular references of header files, which
>    can result in undefined behavior and/or be difficult to debug.

This, in particular, is known to happen in our and other source
bases despite the use of guards, hence I view this point as at
best partly related. Nevertheless I agree with and understand the
reasons for using guards _where they are needed_. I do not agree
that guards need to be there for no specific reason.

Jan

> - If multiple inclusion leads to multiple or conflicting definitions,
>    then this can result in undefined or erroneous behavior.
>=20
> - Compilation and analysis time is needlessly increased.
>=20
> There has been a period (which lasted until the end of the '70s
> or the beginning of the '80s, I would have to dig up to be
> more precise) when the solution was thought to be "headers
> shall not to be included by other headers but only by .c files."
> Experience then showed that, in medium to large projects,
> each .c file had to begin with a long list of #include
> directives;  such lists needed to be ordered to accommodate
> the dependencies between header files;  in some cases the
> lists were so long that:
>=20
> a) it was a kind of black magic to find out the right
>     inclusion order, one that would work in any of
>     possibly many project configurations;
> b) the lists of #include directives often contained duplicates,
>     possibly because the desperate programmers where trying
>     to find the right order.
>=20
> In the end, the software engineering community converged
> on the idea that guards against multiple inclusion are
> a much better alternative.
>=20
> Of course there are valid reasons to deviate the rule:
> some header files might be conceived to be included
> multiple times.  A one-line configuration for ECLAIR
> will do the trick to make sure such header files are
> not reported.
>=20
> Kind regards,
>=20
>     Roberto
>=20
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>>   xen/arch/x86/mm/p2m.h | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
>>> index cc0f6766e4df..dc706b8e4799 100644
>>> --- a/xen/arch/x86/mm/p2m.h
>>> +++ b/xen/arch/x86/mm/p2m.h
>>> @@ -15,6 +15,9 @@
>>>    * along with this program; If not, see <http://www.gnu.org/licenses/=
>.
>>>    */
>>>  =20
>>> +#ifndef __ARCH_MM_P2M_H__
>>> +#define __ARCH_MM_P2M_H__
>>> +
>>>   struct p2m_domain *p2m_init_one(struct domain *d);
>>>   void p2m_free_one(struct p2m_domain *p2m);
>>>  =20
>>> @@ -39,6 +42,8 @@ int ept_p2m_init(struct p2m_domain *p2m);
>>>   void ept_p2m_uninit(struct p2m_domain *p2m);
>>>   void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
>>>  =20
>>> +#endif /* __ARCH_MM_P2M_H__ */
>>> +
>>>   /*
>>>    * Local variables:
>>>    * mode: C
>>
>>
>=20


