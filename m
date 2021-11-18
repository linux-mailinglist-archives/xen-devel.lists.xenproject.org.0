Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F2455837
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 10:47:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227275.393044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mne07-00029v-F0; Thu, 18 Nov 2021 09:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227275.393044; Thu, 18 Nov 2021 09:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mne07-00027W-B2; Thu, 18 Nov 2021 09:46:39 +0000
Received: by outflank-mailman (input) for mailman id 227275;
 Thu, 18 Nov 2021 09:46:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mne06-00027M-13
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 09:46:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ba592c8-4854-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 10:46:36 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-OO0nWliZOammG67bB0AYMQ-1; Thu, 18 Nov 2021 10:46:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3536.eurprd04.prod.outlook.com (2603:10a6:803:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 09:46:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 09:46:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:20b:6e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 09:46:33 +0000
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
X-Inumbo-ID: 6ba592c8-4854-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637228796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fsKZ07ICmB9OOI4AObCcDhM+tT8bisfkbiEKoQ5Wnt0=;
	b=cVDs7DkuU05C3ixJc/ySrQPZv8ss/c2QzSuS80glrSM1r5E3ulR9x8HS0D58thsG/IGW4I
	2JpLs2ZrhXSgsyhi88N+Ybbq1YYVFgYqmyuckeqwdABqlXn6kAunbB3J3uhgH7PmDkhOm0
	InaZdZtQRkAWV7wmCISlPBDoBLzsh14=
X-MC-Unique: OO0nWliZOammG67bB0AYMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaTut3bLwG4xsUu0l5UlkbqAWye4TH1gcoxbfOIbUvysQcAUAXyyWpQ00Ybh3WnQ/iIDxATnkAmcm5Ju/Ot5QC122qCT/kOHDGISWyLlo1njKCfSZvj2HQc9lqLo+yRQSMq5kNRccp7nPTl5ZfBtnTrLOnR9lVo2mrdpOfOJom9qGG1ahWbrPZSVKTWoK7ME56kDDL8MObj1LnLbisjADPrEp0hmOAD5ZG9Hrf6CfRso/jJYKHK2jSxM/bEqAoqTBR6Ws7MyR1BlYNT1GPld5lLTz5ATKM2liDrntloN8+588NYqRLmQuUdyqz8pGTWzIpNW10y87InAyiPFA1OIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tR8fKjXx8JN3iJjhJHNZk6AlLfPw1yZCe7oSXr2gke4=;
 b=TLHZk0SBhDUJhh2AoEAd+5n7LCQlXgRaDtNxA+H+wZ/xylu5wz5y8+mK5tff1qiAsANPJ6r06QsT07I4p9UPMz6OFPvsSiWzvY/nGYsq/x/WVQ0zQJRpiQoqzrGaw6Jdh4nTfoBX9P07CIYPRuNov7eKNlJeJSnigN5PYppqrR9czAIVKha/DnB7Q8yHddpd2T/b0ND6rW/+e6tg4dF2lAof9zHCuGuBjOq+3qUBupT4MwCnhWYSQmjL85rl9u3651qPxZ8MSGz12rZZcZEarf5yjYyd4jMznL2ZydWodz3sYzJKgYDFC3kRVGdvtK8F5Z0xc+7F3a9PaUMc7z1ZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1377adb3-e3f5-2865-a2df-e6dd8098645e@suse.com>
Date: Thu, 18 Nov 2021 10:46:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 v2] efi: fix alignment of function parameters in
 compat mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211118082806.23335-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211118082806.23335-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0018.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40a0dbff-63aa-4313-1d4f-08d9aa784e19
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3536:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3536F2EF2C28CA69E7B2B860B39B9@VI1PR0402MB3536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tJOOj4J06D3KH+MqQLUhpuUv9/Lkrnzytv0ljggBaKjNIm06ZqxvAJtmAxCc2cDHr8qjMnHpPWLOYl/1QF3Pp6szPrDWv05ACeXFaeIzL05L6fXfhQg9ovqvYt9NOIpSzDFIfAKTvN553L1d7/ai8s74KgbiF2HyfhkT7wl3vEPXcbUXqkUOHJ7KaLJLckkic9tTFQPZK+RxHEdV0n5SnuvzNzh+7XeFyGWmsutHCpLzR5+4efcoU8kU8dgE5NA3WCuEaS9ndhnEKCgGbEqIB5XvZAjc6ry6ewTNW9Ig6DgP4BkwIrWsxUjUqupM9tCZsrhY54w1RzUrzod1MRtUX9eZl83XjyQHI7wPbfopFeZAiPZgJViu2qkXjviLhALGZopUoJ1EDV6UWqvngdnT288eOc5xESB1hHd2AQDVuHbpwOvp7irMAjqBDTM+TlS9g7Owby4CDGLj35+Bvalj7zbauTVotHZQhUt3vc9So2ouo27Dnrn8Faf+3yebAd7O9ujfZFYZ2ypl9/m4bUslwOAA/BnisG592CGA30g7MuRgw6ZJJNjoktXU0Nu4UeXvHuFQ0KKxRGg9B9T99/UOLx410MBj6Vfcqxv+NR7za5Ca07vGh3HTrEZ2XUT9vskUAzZUtomt4QQ+yUahRNyCKkRqblJmh0egwkUEA64PaIC56OwQcDsMrnGv0BY0Il3mcGJvurPKNYm85U01S7q8aCSpneEzNbXBggvT7p5jhdo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(83380400001)(2616005)(956004)(5660300002)(16576012)(6486002)(31696002)(86362001)(53546011)(8936002)(4326008)(31686004)(2906002)(66946007)(26005)(36756003)(508600001)(6916009)(66556008)(316002)(66476007)(38100700002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U0b2n0sT7WxIhsAIELTGysezpDa/AGRTuPq4oTFrPadQJSZBlqoJyMPi10xO?=
 =?us-ascii?Q?IN60LrT2RiuDj8c9UD93z0cj1Km1t64/UOeU+QNb5DeG1cJZLxytRX5G8jmq?=
 =?us-ascii?Q?Ce+1rIEr3CGZeknIrikeefESBiy3EGeVlzh5x+DaobDxqU/hBdQLhvXvRi4q?=
 =?us-ascii?Q?KYSPAf4olBd5WeIpgWCf+PARlIIY1hfhSCFhNAQ9wa6VyjngTQ9+xsEEhtE6?=
 =?us-ascii?Q?o9jxjfja89S1T+mKqpzybQ/tphMvCI/BqVlt45LsuH+lrK9ZP3q6EXFLtRQj?=
 =?us-ascii?Q?tW/9WJz8dvBlcjyN2ERUBxhP3NQhlNetse+eeQbJiCgbmPiPIYnUolC0p8R8?=
 =?us-ascii?Q?5ARWnLGPya+5kB/tPStuv70jkuGmDhXjtfwgnDcI3shAGr5M5otuWZeIWJwH?=
 =?us-ascii?Q?9UjItgLmJMlawcQfzONWqCQywlMGupvr35uJi1MaUbxU8r75DDFY7JE2Zg0i?=
 =?us-ascii?Q?zTf1RepFYOnaiBapta12ngbBxeP77QCjElUkIl+bHw6KhW6aCvgy+jrs1XLF?=
 =?us-ascii?Q?nybPuYnb87GrxYtcrB7p641pLACPYC1CVMFBQscntIahvvDJWi2raMiQKhB5?=
 =?us-ascii?Q?oHzD0utt2TRm5NxFqZWxis67knm6kw821o6FwyjXQOFw5xpJf0kpebvSP6aA?=
 =?us-ascii?Q?CCNPaBokP46zw4Bwh6z3NHsRqOyYp3tshLCyhqhVFyJYeh5e4qu3V7ASk277?=
 =?us-ascii?Q?MB9XDQIiwCEEbVOxklXJew19FqSHNaouSGqO69/igPG2HFtoPE1fBkEfD2Nu?=
 =?us-ascii?Q?rpLJIJjOHGSW3I5wWfoESvjOA4A44EX+rZdQM87ayjiqVtIkTkGwlDjSTok4?=
 =?us-ascii?Q?eix4JJP++dtYXb3jLjvoPvCMBN0glEI/EHWFmQqdOASp85Md+cjbjBxAqvwL?=
 =?us-ascii?Q?bdsb71dCHc4Y/HSE9kVoERl/afq+YDzuJ+Q6j+vtMdlwugdmD42oy+m0FL/j?=
 =?us-ascii?Q?/8jYzDwOdMZp1GHTSuuUu/sZe/Kz/kNv5rTWgxjcYO5iyr4wXRcx0vP21ia5?=
 =?us-ascii?Q?fImOfU+JQhXDLHztTBinlt72QSQ881zXZM7Vs7+aq/qW+R8rrTE4d4EqwShb?=
 =?us-ascii?Q?MXALK3nZu+I8FtRqoQVQTCEw/RZb+h0rOB+Wh3NqOW77BlXJWKatxnEAScBZ?=
 =?us-ascii?Q?sFCi+kI71vEyglolATynWgkkfL0W9sQqKtG1tq4JglYxCnEC8KCZ9jAJd35S?=
 =?us-ascii?Q?2CV19bVJSXXKxdvo1ggkbe4JbrZTrVTuG213BgOKovbPcg9D/N/9WAf0SQ21?=
 =?us-ascii?Q?bHIRpybW5pb9EVCfp8uFAfxLMDMKO3XUYwAH9RVeKN+n+fofLHXUQM0pboXv?=
 =?us-ascii?Q?ZtIjW7OdhIHkOzR3Tltn9630mt0UZI2WQyXx8GwcHy1hxTRYBYKa5au4l8kk?=
 =?us-ascii?Q?7OIDyS3Bq/4N8uDi4O5fupGaUlkV9TMZW0pggAMsnl/w3ZM/6GU4/FreXa4Z?=
 =?us-ascii?Q?BjTWyJWQ3KPXE00tPETWGYGu/k0WrfMByUhst8mPxVM0zFT89Av7ww239n7n?=
 =?us-ascii?Q?FUkEgfXvjmg5uOfQrFKIVjkg4e/DKlNXqoukI85byvdLutjR0ydr7GV+4kqN?=
 =?us-ascii?Q?O0MAM242vWZDGz1W7ODYfIKZ+EdLnpGves7zb6+H32l2sFx+jHac6IouSXv6?=
 =?us-ascii?Q?9FYh17/mG2LlguWNsm4c48w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a0dbff-63aa-4313-1d4f-08d9aa784e19
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:46:33.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7wuoo57ZO8rIA6s2c6Y+7XzuQKWcZm5h/ZUidEgZH6JxGr6tDN4gIJHEKn8Gmi2gyQDi0BU55OfvXACUTCgLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536

On 18.11.2021 09:28, Roger Pau Monne wrote:
> Currently the max_store_size, remain_store_size and max_size in
> compat_pf_efi_runtime_call are 4 byte aligned, which makes clang
> 13.0.0 complain with:
>=20
> In file included from compat.c:30:
> ./runtime.c:646:13: error: passing 4-byte aligned argument to 8-byte alig=
ned parameter 2 of 'QueryVariableInfo' may result in an unaligned pointer a=
ccess [-Werror,-Walign-mismatch]
>             &op->u.query_variable_info.max_store_size,
>             ^
> ./runtime.c:647:13: error: passing 4-byte aligned argument to 8-byte alig=
ned parameter 3 of 'QueryVariableInfo' may result in an unaligned pointer a=
ccess [-Werror,-Walign-mismatch]
>             &op->u.query_variable_info.remain_store_size,
>             ^
> ./runtime.c:648:13: error: passing 4-byte aligned argument to 8-byte alig=
ned parameter 4 of 'QueryVariableInfo' may result in an unaligned pointer a=
ccess [-Werror,-Walign-mismatch]
>             &op->u.query_variable_info.max_size);
>             ^
> Fix this by bouncing the variables on the stack in order for them to
> be 8 byte aligned.
>=20
> Note this could be done in a more selective manner to only apply to
> compat code calls, but given the overhead of making an EFI call doing
> an extra copy of 3 variables doesn't seem to warrant the special
> casing.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

The code change looks correct to me, so it could have my R-b, but I'd
like to ask for some clarification first.

> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -607,6 +607,9 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *o=
p)
>      break;
> =20
>      case XEN_EFI_query_variable_info:
> +    {
> +        uint64_t max_store_size, remain_store_size, max_size;
> +
>          if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
>              return -EINVAL;
> =20
> @@ -638,16 +641,34 @@ int efi_runtime_call(struct xenpf_efi_runtime_call =
*op)
> =20
>          if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
>              return -EOPNOTSUPP;
> +
> +        /*
> +         * Bounce the variables onto the stack to make them 8 byte align=
ed when
> +         * called from the compat handler, as their placement in
> +         * compat_pf_efi_runtime_call will make them 4 byte aligned inst=
ead and
> +         * clang will complain.

I expect future gcc would also complain; I'm actually surprised it
doesn't already, as I recall work in that direction was done for one
of the more recent releases. Hence while I'm fine with referring to
clang specifically in the description, I'd prefer the comment here
to be more generic. E.g. "... and compilers may validly complain."

> +         * Note we do this regardless of whether called from the compat =
handler
> +         * or not, as it's not worth the extra logic to differentiate.
> +         */
> +        max_store_size =3D op->u.query_variable_info.max_store_size;
> +        remain_store_size =3D op->u.query_variable_info.remain_store_siz=
e;
> +        max_size =3D op->u.query_variable_info.max_size;

All three are OUT only as per the EFI spec. I'm not going to insist
on dropping these assignments, but their presence wants justifying
in the comment if you want to retain them. E.g. "While the function
parameters are OUT only, copy the values here anyway just in case."
Obviously if the assignments here were dropped, the local variables
would need to gain initializers to avoid leaking hypervisor stack
data.

If you agree with the suggested comment adjustments (and don't want
to e.g. go the route of dropping the assignments), I'd be happy to
make such adjustments while committing alongside adding my R-b. For
anything else I'd like to ask for a v3 submission.

Jan


