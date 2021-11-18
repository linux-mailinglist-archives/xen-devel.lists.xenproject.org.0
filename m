Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FFB455962
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 11:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227332.393165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mneyA-0005b4-VQ; Thu, 18 Nov 2021 10:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227332.393165; Thu, 18 Nov 2021 10:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mneyA-0005Y4-Qv; Thu, 18 Nov 2021 10:48:42 +0000
Received: by outflank-mailman (input) for mailman id 227332;
 Thu, 18 Nov 2021 10:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mney8-0005Xu-LW
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 10:48:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16bb5adc-485d-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 11:48:39 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-DAMTv59fMC-1TVaoFuVKww-1;
 Thu, 18 Nov 2021 11:48:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 10:48:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 10:48:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0086.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 10:48:35 +0000
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
X-Inumbo-ID: 16bb5adc-485d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637232519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pk65xUh0yXRduk2K0070O/Ck3BuVN7sfQOh7LWubgTo=;
	b=fRFb58LD+PQpyVWUp+IKnNvZaRXAPWgtAfPqKSJHjHtlB6fogJDOztB/Rj7b7CnKWDdM+A
	75dSl/UKL+t4FcT16hcoCD1dM8/Emc2Bs4gBWTelta0KLyotDJ8zQUVKXmsfZw7OGYqpAv
	P8o+jyTNOdoHeSQdqsd03ULtr+2Pv+0=
X-MC-Unique: DAMTv59fMC-1TVaoFuVKww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCTarAecHm6R4ygkQbx6xiPM1+zf3/l+PlAgV6qSdj2janJxDan3kGgGb7g1kCCwb3F9t9GSRlMl9KxJM619q4XzZXvMxClqGSJv0RtMpqa6Yhq5lLdq8kC/kRIU0tGwTxPzGG+kPYh+jP5TIW+pNCOMP26QYhcBNlrlXedD7HOrtWua/pGdeJOPVvFMVbYtYe4BuDpRolwu/wllTj1rmO2LnnjDbiL9jGCbeH17WdANb/PkVvuXRVzIfHMgSzUYCdpjcfJwU5gxTlaH53BXh2N5Dhmo4J3D/j97TSBRhK/QMrGHqOCvHADKenjCa0t3ceSMmCn9QDjPTKYxsiGRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZft+WfS+KYGog5BueoSOrodyo8FpxreEnFSpcDLhkw=;
 b=Kj2BH8bCJp2bXWbPFggUlnLwxTfL7kBcRnMC21dZHZ/M9K3q+VLvSSlgNEauSm14MU9mWvYsTKqHMpt+LZGR3zRQDPt6Jm/3nvs76Uwg29DE8zPw/4yAC9ffCN/ihoaHuNo/xqOSOH/tylRe+QZ7k1vxpD5mnUMqm9W7nCHiAW/j3yjY6/xhauzarCfRVCqPX/OWRjPVaI8r+QmvV2OnQhXO+NoDjzQVcWYArhTvRDL3BOpuvpIWKx8eQrbx4bxsbYTUjN5ImKkI8Z7GmoigBpKPJdloxUV/V9gqigHC23ObA+B3Y1VYZuqMWVl3DkvBh2z46V8gjcz/2L1MfbwkBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ba8818a-41c8-ee48-6179-56ccb266d40d@suse.com>
Date: Thu, 18 Nov 2021 11:48:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 v2] efi: fix alignment of function parameters in
 compat mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211118082806.23335-1-roger.pau@citrix.com>
 <1377adb3-e3f5-2865-a2df-e6dd8098645e@suse.com>
 <YZYo9oGq2Bzontjw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZYo9oGq2Bzontjw@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0086.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ada8e50-36a9-4d8e-a9a3-08d9aa80f8de
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6479E1DD1972FB307BE6370CB39B9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+QFBxLaOwGMD1+dy/4EQgYz3TBP4rSYhVhe3d03BQcwfrCJV0zcMoN/GU5bMqFLh9jbm9D1dJTYujAjlYXFnntQi0zkpSvbndy+kKbLO3q+FZbIeXWE9wLdwlZ0bpaIkXThj5L9BlxMuWUPy0bpA4/1VKXP5XRamTYg76B3qR9ivOE5oO+JTUY1wiY7HswLu9OZbs0EbRKvE9VOWJqMxWPKWdDykO8584q69rMWBolGkqKv7xCfxhZW1drF/HenuSd350arFX1SB8fe1H68gj5zECYneVPPjUzEbt3FFp0CHgxdNOiO5N3TP0dedjMMNukKZCZQutViGllUm5aP2SITGpjhQlCQc2fBLVAhInfxZdBGKyNBSUqZe/zoPI0v0UryKYNK+Y76M/gQDWaEzi4xw6upLnQzOKru4JoBMkwDqvXZE8Aaq//oy+9OW4wdh48n9psVZRQs5rb5m/3F6ujIul6kLFswp64zudozZ4jJTNZbKPpXukIhRHe+81rZ3ScMSRKEw9lUYH9qVYYZeGaBXThEqz1oKXJ0wPflFqqoJAzT0EuQLp0Xp+mYKPqvBtxIW+MGa82SkMAe/88ZbARmlboyqZ+ynUAlnZvRBPKPNUV9yc1vvJZr3MwidLDY14IzVEoNZj6bAOFDY/hF1YoCiIaJ9uv/6MD05lJSnJtoau58FRRkYusIOZMz719x/7cXwl6vUZT74vZLUVKQ++iF3LnK3YZ8CxL8UVzAqL+hhi6FFNB6EarlZfuCUxyAq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(316002)(16576012)(2616005)(26005)(66476007)(8936002)(956004)(2906002)(8676002)(66946007)(66556008)(31696002)(508600001)(4326008)(6486002)(83380400001)(38100700002)(31686004)(6916009)(5660300002)(53546011)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fYS+iKp7xa7qS9I9VRe4wAPK29EByCbrm2neiV9dRWVlk/ndNEEYdxDFQCT7?=
 =?us-ascii?Q?jo4PxhqGa1WlDDNLB77JQnDzoPhNgqRdiodzb0NmjZY/nYnkaJ/qYN/PHjLF?=
 =?us-ascii?Q?48vg64hZE4hWAg5osNBrHLMY+F9gP904Dra8DtSNxFZCd/vmol/DYQ/fzvm2?=
 =?us-ascii?Q?8+yyD789mc+x2c9Qogu1T+VNDxYPDBJ2sH9FABLdv/G5d1yVvziDJCsyO+eq?=
 =?us-ascii?Q?1EXBVSEF7oPqeXDpLvrwRkqA813dNNWo/jZNzxeYN5JGcGzx/KDRt81TxLdU?=
 =?us-ascii?Q?uDlEzmvTMGz4RxiTaifISc7p575AJCetcN+YPGWkngOub4BtDVaEiIu7LyTO?=
 =?us-ascii?Q?ZUkxxxKzV3vIRoXss2n9Hq30641VUK9kxTV+dExjB8/yqEqJbUdLl6pXGj8B?=
 =?us-ascii?Q?s/9Q4TNn3ta4gSbb+BykHSVV0EY0vonjcP07ZGz5dO9pZMiM/CJydbRmk9v9?=
 =?us-ascii?Q?6KB+WjMeNSKJfj6jeEsmGeUVk4fVqY2q9KlYSqQPCy4XYRzCJ/2SwG9m0mEo?=
 =?us-ascii?Q?UIUlNW5201WsRtHFOIYFTJlwX3IQKBCfCzCWHDvqmeL4GnXvUXyObE/81BBU?=
 =?us-ascii?Q?Q9EU9bUEM26t5FlLyFV8mUewgayH8PfJV2VZyUldgAtb1qRRVdP/cLWj3YPE?=
 =?us-ascii?Q?bWTi4q+SDYDV6aZXMw/TuW12eRTSkFZfhwJVqtoiyro06ORJaIpT5flDCwW9?=
 =?us-ascii?Q?9D4uJP+gXbwHumQ30RKOr/A3Bqb8z5sjqgOwdpX2lwkSU7RKkK1k0m0yltAE?=
 =?us-ascii?Q?CMxhUqWTmDa15bw970KeSDUucmGf1++S445Ov2qV67WAAqO2xrTrhEG+RnbZ?=
 =?us-ascii?Q?bm7iuf/gHoRuHQr/LUKMCy6uJdGQxuFIO+WkkKbbkFLci30p+m6hk3Srpx9S?=
 =?us-ascii?Q?nDjoBd1Lw69YFPUmPjLxEBJluD3Jyc1ILwGufVYqlJzEL8TyiWJ5lxUgDS7D?=
 =?us-ascii?Q?VW422ZDLiGlj4CLUmkaPU5W8kMvWeFjy4Ry+WB9naKOEn9VssSw7w+rIS4xj?=
 =?us-ascii?Q?aFU9uRX9OIExCZiVM2R1JWGZoPXKMKqT/jX6pI9YL9TpDtr2c1NAAZRH0Rsc?=
 =?us-ascii?Q?HGqBAig6FRSYA9sSozBWZ8to3dozAbntzM4Zdc5ihXJJj0Bipici2TG2r6d8?=
 =?us-ascii?Q?zQ1BhhysM4SfDb++UOP8n0vm/PpG6QdCbS3CoOMj+MUMx2zTY3xZSXFRET9H?=
 =?us-ascii?Q?kkvWnPa0AmnIxTkRYAYIdTiNyRJZ6KFg33bz1g1CToQ/VkMWl1uHChdgDiPP?=
 =?us-ascii?Q?gdvkV7/pUvxH49oKYVyKDXM+lUzBGbHS36qyHPlqJMAfkxZ0nshaVou8MLxQ?=
 =?us-ascii?Q?+hpZ2k2zKOT6NMVItZHyIOBJbrmYHY6QOv79N9tgrULazckDTRpTWXbjpllo?=
 =?us-ascii?Q?Wnwy3ByRhYbqOXMuVeAgCOajRgujlHPLGlEi6t0IbjZi7e3Jjv9WOQVPrqb1?=
 =?us-ascii?Q?WgouR4m0L/UMv2kz4nBRIZyLOYTn/glCh2uaWe+GGQP1nb/w0eOLaUazU3fn?=
 =?us-ascii?Q?5h8h0NpPgYs+afoj3qfrwtq4I+i8hPxcr0Gq8AZ8KevSjDbybyb38E9+w3Q/?=
 =?us-ascii?Q?/g3rIJi9pp9XufvrfQD64jWB/7b23z21XNOG/zMX0Fi9LYEnOkjPLolTIPT6?=
 =?us-ascii?Q?KQI23K3rDZbGlVDZuBCojUw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ada8e50-36a9-4d8e-a9a3-08d9aa80f8de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:48:35.8872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3uV2/3S25HD7/InS5CCjauuZRJCz+jacd9E2hpS6QQW+e2OwBtD5elD8upSdwaJRaaQnBgGgWE3Hfdi90xuSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 18.11.2021 11:20, Roger Pau Monn=C3=A9 wrote:
> On Thu, Nov 18, 2021 at 10:46:32AM +0100, Jan Beulich wrote:
>> On 18.11.2021 09:28, Roger Pau Monne wrote:
>>> Currently the max_store_size, remain_store_size and max_size in
>>> compat_pf_efi_runtime_call are 4 byte aligned, which makes clang
>>> 13.0.0 complain with:
>>>
>>> In file included from compat.c:30:
>>> ./runtime.c:646:13: error: passing 4-byte aligned argument to 8-byte al=
igned parameter 2 of 'QueryVariableInfo' may result in an unaligned pointer=
 access [-Werror,-Walign-mismatch]
>>>             &op->u.query_variable_info.max_store_size,
>>>             ^
>>> ./runtime.c:647:13: error: passing 4-byte aligned argument to 8-byte al=
igned parameter 3 of 'QueryVariableInfo' may result in an unaligned pointer=
 access [-Werror,-Walign-mismatch]
>>>             &op->u.query_variable_info.remain_store_size,
>>>             ^
>>> ./runtime.c:648:13: error: passing 4-byte aligned argument to 8-byte al=
igned parameter 4 of 'QueryVariableInfo' may result in an unaligned pointer=
 access [-Werror,-Walign-mismatch]
>>>             &op->u.query_variable_info.max_size);
>>>             ^
>>> Fix this by bouncing the variables on the stack in order for them to
>>> be 8 byte aligned.
>>>
>>> Note this could be done in a more selective manner to only apply to
>>> compat code calls, but given the overhead of making an EFI call doing
>>> an extra copy of 3 variables doesn't seem to warrant the special
>>> casing.
>>>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>>
>> The code change looks correct to me, so it could have my R-b, but I'd
>> like to ask for some clarification first.
>>
>>> --- a/xen/common/efi/runtime.c
>>> +++ b/xen/common/efi/runtime.c
>>> @@ -607,6 +607,9 @@ int efi_runtime_call(struct xenpf_efi_runtime_call =
*op)
>>>      break;
>>> =20
>>>      case XEN_EFI_query_variable_info:
>>> +    {
>>> +        uint64_t max_store_size, remain_store_size, max_size;
>>> +
>>>          if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
>>>              return -EINVAL;
>>> =20
>>> @@ -638,16 +641,34 @@ int efi_runtime_call(struct xenpf_efi_runtime_cal=
l *op)
>>> =20
>>>          if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 =
)
>>>              return -EOPNOTSUPP;
>>> +
>>> +        /*
>>> +         * Bounce the variables onto the stack to make them 8 byte ali=
gned when
>>> +         * called from the compat handler, as their placement in
>>> +         * compat_pf_efi_runtime_call will make them 4 byte aligned in=
stead and
>>> +         * clang will complain.
>>
>> I expect future gcc would also complain; I'm actually surprised it
>> doesn't already, as I recall work in that direction was done for one
>> of the more recent releases. Hence while I'm fine with referring to
>> clang specifically in the description, I'd prefer the comment here
>> to be more generic. E.g. "... and compilers may validly complain."
>=20
> Sure.
>=20
>>> +         * Note we do this regardless of whether called from the compa=
t handler
>>> +         * or not, as it's not worth the extra logic to differentiate.
>>> +         */
>>> +        max_store_size =3D op->u.query_variable_info.max_store_size;
>>> +        remain_store_size =3D op->u.query_variable_info.remain_store_s=
ize;
>>> +        max_size =3D op->u.query_variable_info.max_size;
>>
>> All three are OUT only as per the EFI spec. I'm not going to insist
>> on dropping these assignments, but their presence wants justifying
>> in the comment if you want to retain them. E.g. "While the function
>> parameters are OUT only, copy the values here anyway just in case."
>> Obviously if the assignments here were dropped, the local variables
>> would need to gain initializers to avoid leaking hypervisor stack
>> data.
>=20
> I think it's important to do the copy in order to prevent changes in
> behavior. Even if explicitly listed as OUT I won't be surprised if
> there where quirks that passed something in.
>=20
> What about replacing the last paragraph with:
>=20
> "Note that while the function parameters are OUT only, copy the values
> here anyway just in case. This is done regardless of whether called
> from the compat handler or not, as it's not worth the extra logic to
> differentiate."

Fine with me, thanks.

Jan


