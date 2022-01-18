Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD14749273F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 14:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258488.445204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9oWl-0005l2-Fb; Tue, 18 Jan 2022 13:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258488.445204; Tue, 18 Jan 2022 13:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9oWl-0005iP-CP; Tue, 18 Jan 2022 13:27:59 +0000
Received: by outflank-mailman (input) for mailman id 258488;
 Tue, 18 Jan 2022 13:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9oWj-0005Wh-C1
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 13:27:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 726364cf-7862-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 14:27:56 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-qwh92FpON4Klke4q0aGHNg-1; Tue, 18 Jan 2022 14:27:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4623.eurprd04.prod.outlook.com (2603:10a6:803:70::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 13:27:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 13:27:54 +0000
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
X-Inumbo-ID: 726364cf-7862-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642512476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0x2HS6zU0So9+LsEtyLtK2XgLgm7TSdIHGA5J0yMb0=;
	b=Hx4lRK+oatRfKw0XsQWWHE260dn5jcNgtdZobJd9MtcHv6GHBSACmmB0j7+LrvC8iar2Ev
	33KkrxGTSc4mf924psCK1s73iJqXIEOTQ8MOaN1LgTGVwj6pXTwX0MIFGsYWgbOjIkiEYf
	4a53Z0UTTyFmp7egx9E8boFgt9Jwq1w=
X-MC-Unique: qwh92FpON4Klke4q0aGHNg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUDJOgwAO3VBQ7SPLYG/BWV6FAHXQwPGj2DUqzJs7XfatUkcnPY7ufzTjDNhY0jzYAZTHrnttWiP/2AV+X2G808vfRpf1l19FZ99cdgmFoRHIfHopyMWmUZdDVu/Ykv6NPM1qhw8TfvUMRA62A4qJMqYUMKmP6PXprolGiYgIFMEGrex7cXZGYisuJJm2rB+3uUnLdwpH/4n8UVYpRShhXaNu4Xjm3D4Nm47P64bqMqf8uXSE3HaHvbkTsxr7sDztEO6bRKwVIHvNYW/Oq2vOqiZJidgeIAr+SAigGuZEau4VVkU3NNMeqahDYKv3LekphMKhgC+IL/5mcaczpB32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKa7NzZ3aDrnL+HnhEGCJXWcP3oVhCrE/ec2hBfHROM=;
 b=RbrQHyu9D//J6+xnthjjCbYgYwNN0uZXwZ2PZUBOZajy/8QKY2xmUgFOKjWLRhVHBaOu0O59V7aZDF5xyzeB+nJSS2jnPhjp/cUyz/sHI/55skOvso+2NYnMxoTG0oG2qylPZ9fq0oj/uXjhT1OnIHkcEUENcIA2LJGSkYlbbLaIhIO5f/H3RB3BtQ0/wwmQ1VA9tSdxnTOIRa6Wb6yHc4X2dpA7PyO4dKMTxLwiApO/JMcdxyQi2INgFlU77ACXlf/VM+1hHdFWlWY6qFuJCHTO2gkXzrKMd+6T/05QuMKkWj0abb0J3/TqJ+sZSGVmnRqllGCFbHX/fmvn/S9MVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9712f1e7-4dd8-dded-4d87-b6a31e2eba40@suse.com>
Date: Tue, 18 Jan 2022 14:27:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/Intel: use CPUID bit to determine PPIN availability
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <239d8868-0c8a-b512-a2bf-3e91689a8218@suse.com>
 <5fa523ca-0a14-862b-94f4-3e7a78319496@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5fa523ca-0a14-862b-94f4-3e7a78319496@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0030.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88dda9a6-33bd-45c0-a12b-08d9da86555b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4623:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4623EC63EEF19DA6DA1B5DA5B3589@VI1PR04MB4623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mVedk9qdOstszhHqlSOJEkTyDcJnlRdOb1caF86tPzgS2p5WqO1A7d86FX7Hj5khbgJgUr27UJF4iPNMfpCkBH5K80xq9WedYOzgrJ9D5LTUnczI85SceEtC71IY9wEQpHGp+NGcKBHjlM3O/nGIhmxDaZaA7yN1EQLCqoTFs5DDlgajbT2ROH+xF9Rksrjk/utNEKfVKE5meX8S00ZWxx/64kz671yb4icPraKtNjcMsxDuziQwD1z0ncJfC2pBRvr52XoyTSKS0sBJKYQeW/2lMZZPCrd1o+gTS6X7B7wJEBqJZ7uqweyH2YCTVby+kkRxef1p3M2lYDAN83O9dRqV7eAt5vSTU4MxbiSLuvVMcb/uKWx4/hYJq+zSajgQBU7QoZXPHA+aHIxHxpQTYjKZ6PzTNEfqWNsJP1rlfGP9VWI1dfIGJHTuSW0enrPn+VpMuv9JIH+NSR3huq0EORMdfJb2ZUG39d2Dyvv6qTIzDN/UHMiJNzWa51V5AtpCbefKTrC34Yy6OaA4UHaz+jx4hUmyPbl2c5ZDP0A8mrDqANJybrrxsrVFCxUE+6tRvgCeEnMfWBnIPCKmzfR98lDLJI4fyrB+TxAakVjDzYDuPUbMG/v/nOpH/PG64PB733JfS91AVcT6rMNdOQI3pCqy55J5//7VVbcRW8t2oUCkDvfR6nWnk7Hy8TgLTJ60+eewZfCPif3671qdpRTB13JyRyf1XpFM5wM8dWlKuYHErRVLlBIGnaB7/wwRd2AA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(508600001)(4326008)(86362001)(31686004)(5660300002)(6486002)(54906003)(6512007)(2906002)(316002)(38100700002)(31696002)(8676002)(66476007)(66556008)(26005)(8936002)(2616005)(186003)(6916009)(36756003)(6506007)(53546011)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e4zFyWJqHrM0oxy2iT6W9Fe135SdW+xEOdiL643SdhmnQJu13V1fP4tWeCYj?=
 =?us-ascii?Q?On/TNSFOobuWuoPX3iRVMJJukT50WcuBWTKt4RMuv7yElXQKvWnh6mH0PEif?=
 =?us-ascii?Q?vxqW5lzLuus8BbAmhLOBehj67ty7zsXKSzUTRy8DrzMixce6XuIOxAbZmAf+?=
 =?us-ascii?Q?FQrBAxS2vhL85HAy87ILYspa4evg3h2L83nUlkUf1dWeiE2tl/ge1Ur8cjPW?=
 =?us-ascii?Q?b94zogUCxJp3tGVQwkGfcHuo6ag2yM6ndTYD1QuPQpWZ+pFzz1QvIXE2X8dQ?=
 =?us-ascii?Q?gy1DWrQ0H7zLjCobAaAaTecGiIRNUJT83CaRZc1z/99Z2fwiXZhdNcoHVOip?=
 =?us-ascii?Q?JklQuLJN8X8qebsWZ+LMPOwa/5pPUF88iRqivaKmnaE2SyTQOBGgSbsNN0aE?=
 =?us-ascii?Q?1VNKJf4gs2Bxb9K/f4T+t28toYMbWTkC+kiDFHS7skuUMuqtcm2wJs/dGxzi?=
 =?us-ascii?Q?fZJKa4GqoMHFftTWp6XpVz1Dzb0BInfxGiUnTxNB/A7xyzl+vDOige5RfULg?=
 =?us-ascii?Q?3jyRW2HTG/CoE+SvjwcvBMgyhZxJpfB/kRddf6dKae7b+4yXkFr6C/VSoO0V?=
 =?us-ascii?Q?kRDN9GC1Eqc1BPf4y4QDzloTd9OXSdN3Rl1LOiDy8w4rPa0OtN+0LtdiBhYO?=
 =?us-ascii?Q?YJSSfyxIWtc/iJOSj9pSUZQ6K+xawDC8QDt8xsdk2innGD5Zabic/Q50jH08?=
 =?us-ascii?Q?cEwzHfeZRQo7CdsFyw5Nv/rMv4P37hWcIPKM9RTineE7xSs32komOKcR9Z2k?=
 =?us-ascii?Q?YFpUyQCOi8BnXNMbrAL9v+bQSKcmF6Mma98fwn8E1oAJU3IldpRvpzjp3wRg?=
 =?us-ascii?Q?5OlU+NFiUUAjtl+K86mpz2JG507MW3dqWmCu0FlL124/DWgcUJUbRzb2ybbO?=
 =?us-ascii?Q?UvmAb+4ZC9g010xJ3YLelIRdkPJCzsm02iZaToBqJ4PKS8D05Pf63/kJVaTI?=
 =?us-ascii?Q?BLuYmz3elJDplbqWFA9jLKg8xsqMNcxjoFE+dJCOT2YdzfDenZUAgkvVMZFb?=
 =?us-ascii?Q?2yu4E1mi4sheanFJkPGxXn333S+ujwpopq3TrhvTUvJDBzh0nrgk7eIGxJfY?=
 =?us-ascii?Q?qIW2Rb+/RrwA6D7CyLh4edr4LjX5HUEg5/3TdFB9BkNGGyJDOQe2hj7JEjeX?=
 =?us-ascii?Q?CwKd5+/1uj8bxIOqTN6wF6ypFf3KA7luNyvkOVgDztUjrxrd3Bt/nywzbluL?=
 =?us-ascii?Q?4LpUPbeFg/JCmMw8nZfK2dHZOB0UgjAXEBNVIthgkctyXjHB2BK3Mkum9R4S?=
 =?us-ascii?Q?9zxPy0ZIYET7Tj6fii+rAnec9XX+Kkp4vuYnq0a96B1HVq8UXZjVA0KXfX6U?=
 =?us-ascii?Q?CVb7NlSM7HIAPtXPavdSObt2uT6MMA92mYrz0ZmoUoGq7GhsZe74C75WjISJ?=
 =?us-ascii?Q?L8Egc6EQYac8XzrJivXyY5+ChFySreWMjsH1ffZmcRQ/pltR7TNgNkbh3Jgc?=
 =?us-ascii?Q?ZIMx6zUwe+xRXt7xDBx/DqXwHvSADG2aeNGu8AiHvR29rqqPMZn930Z2Dmi1?=
 =?us-ascii?Q?5uYmYjWGo94I2brx8HE/s5GffiqC8duvJXDO/JcdwFBl1TolbDA7t6PF4GUA?=
 =?us-ascii?Q?+UMPA5HK9r5LgGYkRxluEKmgLx120JsWZxY8LT/28Zsi+jRxT9rpB0old31H?=
 =?us-ascii?Q?Jw+hh4H1QsUj/mjicigFB2A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dda9a6-33bd-45c0-a12b-08d9da86555b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 13:27:54.3466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOPsKpjOLicuxphEPEeli+XSiJIWEcu3CIN6LY7zLNSXKkDo3xcwUmsXKBRvlm35J88QWcFnMzOy2RfStmszug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4623

On 18.01.2022 13:18, Andrew Cooper wrote:
> On 17/01/2022 15:30, Jan Beulich wrote:
>> As of SDM revision 076 there is a CPUID bit for this functionality. Use
>> it to amend the existing model-based logic.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In xen-cpuid.c I wasn't sure whether it's better to put the 7b1 table
>> next to the 7a1 one, or whether tables should continue to be placed by
>> feature set ABI identifier.
>=20
> They're in FEATURESET_* order, which is also chronological order.=C2=A0
> str_7b1 wants to be after str_e21a.

I can see the ordering being necessary for decodes[], but I have a
hard time seeing why there would be any strict need for a particular
ordering model for the str_...[] objects; there it would seem
slightly more natural to me to have adjacent registers / leaves
next to each other. But since I don't care that much, I'll switch.

>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -156,7 +156,7 @@ static const char *const str_e8b[32] =3D
>>      [18] =3D "ibrs-fast",        [19] =3D "ibrs-same-mode",
>> =20
>>      [20] =3D "no-lmsl",
>> -    /* [22] */                 [23] =3D "ppin",
>> +    /* [22] */                 [23] =3D "amd-ppin",
>=20
> We don't retrofit names like this.=C2=A0 If we did, loads of the speculat=
ion
> bits would need to change.
>=20
> The Intel vs AMD split is clear from the leaf index, and the only reason
> we have the distinction is to fit the two bits into the same namespace.

In which case are you also asking to make the new leave simply say
"ppin"?

> Please leave this as was, to match its name in the source code.

By match you mean what? Hardly

XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory N=
umber */

?

>> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
>> @@ -865,6 +865,13 @@ static void intel_init_ppin(const struct
>>      {
>>          uint64_t val;
>> =20
>> +    default:
>=20
> Considering the comment above this switch statement, which you haven't
> edited at all, this wants a note saying that a CPUID bit was added in
> Sapphire Rapids, but older CPUs still require model-specific enumeration.

Oh, yes, I should have paid attention to that comment. Will edit.

Jan


