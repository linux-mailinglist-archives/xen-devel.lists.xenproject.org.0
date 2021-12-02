Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA5E465F11
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 09:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236354.409995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msh1p-0001oh-HW; Thu, 02 Dec 2021 08:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236354.409995; Thu, 02 Dec 2021 08:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msh1p-0001lv-EI; Thu, 02 Dec 2021 08:01:17 +0000
Received: by outflank-mailman (input) for mailman id 236354;
 Thu, 02 Dec 2021 08:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msh1o-0001lp-4o
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 08:01:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05481177-5346-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 09:01:14 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-JZsyXgqTMxCRZu00Lf26DQ-1; Thu, 02 Dec 2021 09:01:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6303.eurprd04.prod.outlook.com (2603:10a6:803:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 2 Dec
 2021 08:01:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 08:01:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0089.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Thu, 2 Dec 2021 08:01:10 +0000
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
X-Inumbo-ID: 05481177-5346-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638432074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HP3jcaKvbHL7Zxs5uAF+yfMGJmr7CJY35reZ6wqXHEI=;
	b=Zb7JVBi7SEVWD71eNQbDL+Aktc+PmQ2sopA2lGMHA2kec6osf4Cmu2+JUQMBB13F+JXYTw
	0nzR23Mw8h5+sl+UJhEBexYatc1SGuA60ChoU+zsrs634BTJ7E3P/aSpu6PWxn3KSBcldy
	1p+sv4YN6L3ATC+a0mJBXKZcjFpi6ao=
X-MC-Unique: JZsyXgqTMxCRZu00Lf26DQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdtG+UeLXCmxJHlnafGht0FyrI/sUyrbCuWR5m6a4k07F+e9GikHip55klFyknm/aOMnaWpWgvj0cJyZyk02Bsqgx/Z+URnEXq+C35f77bBoudiYWAl0+YYVGNa/OTG5Oo0xrFMEQOq0xRbRev+lMvOwQxyi3vrNDrm5iJAdh7U9paVdcGYbhMlKwAq6t6MaWxJBglMDhdssEyK8Elce2RpWahzS1Nq93VfKspE0HXIuQbNSwLFwCC00R9+HLYvGRTE7JjKHz5DeTgx6vukyZY6FvNfD/KE8FjvXU5rtIEkueTRXKY0Rha0SGrNIbXhxll5fZrHYp8pxppWwssXBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNUmxyTqdS4N4Sv475DClV/JoGIohZGgSoqCoXGyot4=;
 b=YqKJeI3hq3bR8MOrJ1/qewDeQoF6y475PpMXJuJLcOGDk4s2N6FvOBF7hrKNQaflEp2bvQ5p5QWdp3XpC+j1tCATzOgiZKuK6PdbfXMckoMQFV35iVyiugI/1ncOSXhgjOFYi3D5ODB25dBy7LAbz3AwCHlsJkfiY0zoYnPZjjt3zmSeXUcZ7KGAZKqQM8P46nkv/hrmNnbhlN8CD92ym//v8hmxIMvOBcftQha6srsiSaTx9ttpLxa5jySpAPrI4z9dBuO6APRV3AG+yo6tdUA7zdaTQsH0uqZ0xsSOy07rCeMaaI8ll4VQEampknTw7EsSzbQ+Hr1rhBVYhh38kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33d466b3-338b-d2dc-f993-c5fac22072e0@suse.com>
Date: Thu, 2 Dec 2021 09:01:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/4] x86/altcall: Optimise away endbr64 instruction where
 possible
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
 <20211126212258.7550-3-andrew.cooper3@citrix.com>
 <3ca82514-2adf-2445-04d1-0020dde16019@suse.com>
 <4ee538d8-5063-1bf6-025a-62474be7ab0c@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4ee538d8-5063-1bf6-025a-62474be7ab0c@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0089.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46185755-4cf0-4764-0503-08d9b569e7c0
X-MS-TrafficTypeDiagnostic: VI1PR04MB6303:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630382046E90723F6CBD5543B3699@VI1PR04MB6303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hRizbNrcaVW6JMftyoqpaQGxScG/cEnLE1wHOuQVN67e1G9wzDoEWIBhj3O1+ZpiNK2EaRAxJGiYrJ7Mr0lAnELcPaQtjN+hrd2gI6+Kc8y1txHmssmbdm/eexBCcM1O4BXBLsB1ntorHtMxvlXZ9cpQDFANjVKvbuJdzZN/di9OW4qtwPx9QlGIb0vJCIN33kopnIkdmHuQKymy8vwyIjnxZRcvD+EoAyhOKRiHY8erwZGja3gxv/EpIUh3gVSSuHFAJWRG9sEsiqajAlQaFreioYDgBJzBBsmz/leknKcfv2BOM+uQixOc3GKiswtv88VSRVAlmBqi2/IYnWNfhozASc6wHto0Ma9nD4FUNdtXLoxU5iilG/oqX9maqEKZH2Xuy5zL0Fjz3Y6N8krTnpDCmG0x7jROzmPEyGs/0a2mcoGsr+BizdYmHgKU6ohSlCjlrs9tWOH1RChMkZiiUmw4PFVN07hQBYS4iU0pI5UIGwUb+ycktAWY5p2hopA2clJ0wdx1k+LZR3TRPblWLqGlaCYgn27Tez6drshbTL0ihGAtsLtShbLlbJS+hug/LOqBI7X/kN4uex2zPh2ZERmDB4kZ30aOk523qapbtXHg+o8uFHnzXkVYKAUReYAN26i7ahBJbLS+g+4tZX+XqwK3c0wt1Zc/RbdfoJJa/GFRGaVpsbYinijCCQjDTWLAhE62/1ePcsl+Z9V3P1TH/Snnh9+hKN+Ad/IhjD0FPhI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(110136005)(956004)(66556008)(31696002)(2906002)(316002)(6486002)(5660300002)(54906003)(66476007)(16576012)(8936002)(186003)(66946007)(36756003)(2616005)(31686004)(4326008)(26005)(86362001)(38100700002)(508600001)(53546011)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZIFsaeeTjx6LxL3aotwItz34+lJ5P1y6w8q+fOgYtRixipVoZBr614jSmiz?=
 =?us-ascii?Q?D+93kbHfhgiJiHzFMf1REgqmFnOT0ymt0u/BAlvES4uKpbAL573ONtaHpYis?=
 =?us-ascii?Q?cOHUhU5dbaEZer97/pU2YxCw3n6TwrC1kUFhgUgbMTK+eL+AhwUjK8ydSnj+?=
 =?us-ascii?Q?65DzwI9TqsDlhouiJxSqeEy6Jcr4hWNPX3Dda6ftcHzdB4egmtmRqLKA1yqL?=
 =?us-ascii?Q?Ig2ZVKST3/8vLUlh1pLndJDTaqs/l/+ydHnOzU28B2VT7RCjHMF0YlsFRAhG?=
 =?us-ascii?Q?LsHDfrgRA6qXmBPyAstONMG+GidzDIQrXyeYVo/wJuiXql3X23r2/Xtgl9Cu?=
 =?us-ascii?Q?rAzIYkmDDsG5uX06eMl1eoClpssR8wBxr0TTqr2Vlkh5EVwYRq99jbQ0eIQb?=
 =?us-ascii?Q?mXUQvmtD4luDwZ9IlGL4KlR3kO2h+0iJLKcdzbniElf5eOT/fMbSmvhJLQ65?=
 =?us-ascii?Q?+iOxMN3z5JNqVjb0reub6j5UdtsLTM49ImycsIi1DsDHAGk0wwwW297XD8po?=
 =?us-ascii?Q?roHQQh8PE2CvKsRqIelNiJpJkPRA/To4OR0VlSjHnhP3ADFa2M1RrkjQPMMo?=
 =?us-ascii?Q?3QHJy6RgCJ3zzyuQfOrArtKr3GuwmeIMKiXFk9gHtRF4QydVHmkJ7vzFkA/k?=
 =?us-ascii?Q?S1IFh8YxP1/TOBVR98BVjZ9sFHuf7u2jQNo0UabBsFDKoQ92LEX3N94tLpYR?=
 =?us-ascii?Q?fhbK0cUgTJG/q/5DpAlP+vbfelpo3sTASUcUcfqe2IycHecOyyAwwoigAp3q?=
 =?us-ascii?Q?4bjI4CkA6FxoFNtLUvfiN1qCIpttMSyLa4vRX2AUEsXF6uGfY5vBh+JmFtU6?=
 =?us-ascii?Q?7tFtZjJ3xZr/4Z09fGJCfC1X+FIAXBb16PfSoXs4fI/vUgP3wos4A3xgmLX1?=
 =?us-ascii?Q?MqeYD45qa178qw6OC47Ybq662AHsJsxWtRw063BeRaCL3gfU1PRA7RZEe4mF?=
 =?us-ascii?Q?0HtM6HxrL2IsTPFiWgbsnKK5F+INtmz9O50w6Fww4vdI3x9GMmzXobKTX3v9?=
 =?us-ascii?Q?uwJ9avC0IaXddqF+a9rtbvXWtFHXRAgN3YLj8h50aaoNIJCUHzYiFe0rQnNr?=
 =?us-ascii?Q?8SeS0HqoCjrDUi4iuG9iuc0+LzCc2ZJ2ey+X/thaU7HoKTpShS9G5qb3E1wb?=
 =?us-ascii?Q?w7+PLb8w8VxapLrNy0QI+xDeI+fulqoaz9cP7SFgDEeERyh867F96Vl4Av1D?=
 =?us-ascii?Q?bov8ezfCHxYKn/hxUddCR7YWKySSAybPXcW/rhkBo29vJqObkqdbuYiPHozg?=
 =?us-ascii?Q?qiTh7ol3Q5RHqIG9YWEtJdrqMJBS15ByAg8qtPufgnSNFCzb0TuYZFWWDD/y?=
 =?us-ascii?Q?bKBOSj3KHAat5wkBVAWCNC5hR4vRtEHphQez5G11IFkJfG/TvVrqhdu+SKGY?=
 =?us-ascii?Q?YaBzJ5AgHVZEn4VKLnWoFsJqLTohXA5e8CFI4Mguf80cZb83NAx2c7JslsEP?=
 =?us-ascii?Q?6FKMtMOqBS9p+DFdOs37DT63IwPhVOWAvJoCG5b88kwTgMDvRk0kl8DElYKq?=
 =?us-ascii?Q?mfeoQyrG8DzEO3Rq5kf7O8CD2gSuTHPSYUVQSGxVQymlbnzE3yJ9i7issm2/?=
 =?us-ascii?Q?2ISgvqGHkUYur83JrwfQq6ZscDpxMlrKTTFhxUfDJ7NS2giI1Z1lehpqX6uJ?=
 =?us-ascii?Q?1+8lf4Zg4olPMOGcekfA8VM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46185755-4cf0-4764-0503-08d9b569e7c0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 08:01:11.5039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwrjBJQdIyiPSxpqyghHRfDlh89YVjxDdaKSqwpVSgBbBBN9MI4hKIWuGO7nZkY6Gb+D52B01NKT0OZMPURB3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6303

On 01.12.2021 20:07, Andrew Cooper wrote:
> On 01/12/2021 08:20, Jan Beulich wrote:
>> On 26.11.2021 22:22, Andrew Cooper wrote:
>>> With altcall, we convert indirect branches into direct ones.  With that
>>> complete, none of the potential targets need an endbr64 instruction.
>> Assuming that no other hooks remain which re-use the same function. I
>> think this constraint wants at least mentioning explicitly.
>=20
> Fair point, but I think it is entirely reasonable to expect logic not to
> mix and match altcall on the same hook.

Take XSM's silo_xsm_ops and dummy_ops as an example. With what
xsm_fixup_ops() does it should be entirely benign if silo_xsm_ops
set any or all of the hooks which are currently unset to what
dummy_ops has.

>>> Furthermore, removing the endbr64 instructions is a security defence-in=
-depth
>>> improvement, because it limits the options available to an attacker who=
 has
>>> managed to hijack a function pointer.
>>>
>>> Introduce a new .init.data.cf_clobber section.  Have _apply_alternative=
s()
>>> walk over the entire section, looking for any pointers into .text, and =
clobber
>>> an endbr64 instruction if found.  This is some minor structure (ab)use =
but it
>>> works alarmingly well.
>> Iirc you've said more than once that non-function-pointer data in
>> those structures is fine; I'm not convinced. What if a sequence of
>> sub-pointer-size fields has a value looking like a pointer into
>> .text? This may not be very likely, but would result in corruption
>> that may be hard to associate with anything. Of course, with the
>> is_endbr64() check and with a build time check of there not being
>> any stray ENDBR64 patterns in .text, that issue would disappear.
>> But we aren't quite there yet.
>=20
> I disagree with "not very likely" and put it firmly in the "not
> plausible" category.
>=20
> To cause a problem, you need an aligned something which isn't actually a
> function pointer with a bit pattern forming [0xffff82d040200000,
> ffff82d04039e1ba) which hits an ENDBR64 pattern.=C2=A0 Removing the stray
> ENDBR64's doesn't prevent such a bit pattern pointing at a real (wrong)
> function.

Why "aligned" in "aligned something"? And I also don't see what you're
trying to tell me with the last sentence. It's still .text corruption
that would result if such a pattern (crossing an insn boundary)
happened to be pointed at.

> These structures are almost exclusively compile time generated.
>=20
> So yes - it's not impossible, but it's also not going to happen
> accidentally.

I wonder how you mean to exclude such accidents. It occurs to me that
checking the linked binary for the pattern isn't going to be enough.
Such a patter could also form with alternatives patching. (It's all
quite unlikely, yes, but imo we need to fully exclude the possibility.)

>>> --- a/xen/arch/x86/alternative.c
>>> +++ b/xen/arch/x86/alternative.c
>>> @@ -173,6 +173,9 @@ text_poke(void *addr, const void *opcode, size_t le=
n)
>>>      return memcpy(addr, opcode, len);
>>>  }
>>> =20
>>> +extern unsigned long __initdata_cf_clobber_start[];
>>> +extern unsigned long __initdata_cf_clobber_end[];
>> const please. I also would find it quite a bit better if these
>> were suitably typed such that ...
>>
>>> @@ -329,6 +332,41 @@ static void init_or_livepatch _apply_alternatives(=
struct alt_instr *start,
>>>          add_nops(buf + a->repl_len, total_len - a->repl_len);
>>>          text_poke(orig, buf, total_len);
>>>      }
>>> +
>>> +    /*
>>> +     * Clobber endbr64 instructions now that altcall has finished opti=
mised
>>> +     * all indirect branches to direct ones.
>>> +     */
>>> +    if ( force && cpu_has_xen_ibt )
>>> +    {
>>> +        unsigned long *val;
>>> +        unsigned int clobbered =3D 0;
>>> +
>>> +        /*
>>> +         * This is some minor structure (ab)use.  We walk the entire c=
ontents
>>> +         * of .init.data.cf_clobber as if it were an array of pointers=
.
>>> +         *
>>> +         * If the pointer points into .text, and has an endbr64 instru=
ction,
>>> +         * nop out the endbr64.  This causes the pointer to no longer =
be a
>>> +         * legal indirect branch target under CET-IBT.  This is a
>>> +         * defence-in-depth measure, to reduce the options available t=
o an
>>> +         * adversary who has managed to hijack a function pointer.
>>> +         */
>>> +        for ( val =3D __initdata_cf_clobber_start;
>>> +              val < __initdata_cf_clobber_end;
>>> +              val++ )
>>> +        {
>>> +            void *ptr =3D (void *)*val;
>> ... no cast was needed here.
>=20
> Unless you know what this type is, I already tried and am stuck.=C2=A0
> Everything else requires more horrible casts on val.

It's as simple as I thought is would be; proposed respective patch
at the end of the mail (the two //temp-marked #define-s were needed so
I could build-test this without needing to pull in further patches of
yours). No new casts at all, and the one gone that I wanted to see
eliminated.

>>> --- a/xen/include/xen/init.h
>>> +++ b/xen/include/xen/init.h
>>> @@ -18,6 +18,8 @@
>>>  #define __init_call(lvl)  __used_section(".initcall" lvl ".init")
>>>  #define __exit_call       __used_section(".exitcall.exit")
>>> =20
>>> +#define __initdata_cf_clobber __section(".init.data.cf_clobber")
>> Just to repeat what I've said elsewhere: I think we want a const
>> version of this as well.
>=20
> I can, but does it really matter?=C2=A0 initconst is merged into initdata=
 and
> not actually read-only to begin with.

My remark wasn't about the actual mapping properties at all. What I'm
after is the compiler being able to spot modifications. If I see a
struct instance marked "const" and if I know the thing builds okay, I
know I don't need to go hunt for possible writes to this struct
instance. When it's non-const, to be sure there's no possible conflict
with the patching (yours or just the altcall part), I'd need to find
and verify all instances where the object gets written to.

Jan

**********************************************************************

--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -28,6 +28,9 @@
 #include <asm/nops.h>
 #include <xen/livepatch.h>
=20
+#define cpu_has_xen_ibt true//temp
+#define is_endbr64(p) false//temp
+
 #define MAX_PATCH_LEN (255-1)
=20
 extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
@@ -174,6 +177,9 @@ text_poke(void *addr, const void *opcode
     cpuid_eax(0);
 }
=20
+extern void *const __initdata_cf_clobber_start[];
+extern void *const __initdata_cf_clobber_end[];
+
 /*
  * Replace instructions with better alternatives for this CPU type.
  * This runs before SMP is initialized to avoid SMP problems with
@@ -309,6 +315,41 @@ static void init_or_livepatch _apply_alt
         add_nops(buf + a->repl_len, total_len - a->repl_len);
         text_poke(orig, buf, total_len);
     }
+
+    /*
+     * Clobber endbr64 instructions now that altcall has finished optimise=
d
+     * all indirect branches to direct ones.
+     */
+    if ( force && cpu_has_xen_ibt )
+    {
+        void *const *val;
+        unsigned int clobbered =3D 0;
+
+        /*
+         * This is some minor structure (ab)use.  We walk the entire conte=
nts
+         * of .init.data.cf_clobber as if it were an array of pointers.
+         *
+         * If the pointer points into .text, and has an endbr64 instructio=
n,
+         * nop out the endbr64.  This causes the pointer to no longer be a
+         * legal indirect branch target under CET-IBT.  This is a
+         * defence-in-depth measure, to reduce the options available to an
+         * adversary who has managed to hijack a function pointer.
+         */
+        for ( val =3D __initdata_cf_clobber_start;
+              val < __initdata_cf_clobber_end;
+              val++ )
+        {
+            void *ptr =3D *val;
+
+            if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
+                continue;
+
+            add_nops(ptr, 4);
+            clobbered++;
+        }
+
+        printk("altcall: Optimised away %u endbr64 instructions\n", clobbe=
red);
+    }
 }
=20
 void init_or_livepatch apply_alternatives(struct alt_instr *start,
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -217,6 +217,11 @@ SECTIONS
        *(.initcall1.init)
        __initcall_end =3D .;
=20
+       . =3D ALIGN(POINTER_ALIGN);
+        __initdata_cf_clobber_start =3D .;
+       *(.init.data.cf_clobber)
+        __initdata_cf_clobber_end =3D .;
+
        *(.init.data)
        *(.init.data.rel)
        *(.init.data.rel.*)
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -18,6 +18,8 @@
 #define __init_call(lvl)  __used_section(".initcall" lvl ".init")
 #define __exit_call       __used_section(".exitcall.exit")
=20
+#define __initdata_cf_clobber __section(".init.data.cf_clobber")
+
 /* These macros are used to mark some functions or=20
  * initialized data (doesn't apply to uninitialized data)
  * as `initialization' functions. The kernel can take this


