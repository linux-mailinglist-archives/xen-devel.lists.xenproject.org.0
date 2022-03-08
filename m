Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB694D1BD4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:36:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287100.486920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbso-0002jP-KY; Tue, 08 Mar 2022 15:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287100.486920; Tue, 08 Mar 2022 15:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbso-0002g4-Gd; Tue, 08 Mar 2022 15:36:18 +0000
Received: by outflank-mailman (input) for mailman id 287100;
 Tue, 08 Mar 2022 15:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRbsn-0002fy-QW
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:36:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e407a8a-9ef5-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 16:36:16 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-QTYAuUePOI26YyWgtL5rdw-1; Tue, 08 Mar 2022 16:36:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5118.eurprd04.prod.outlook.com (2603:10a6:803:5f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.20; Tue, 8 Mar
 2022 15:36:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 15:36:12 +0000
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
X-Inumbo-ID: 7e407a8a-9ef5-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646753776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rA65agIqEQQtH8bhn/O1o4MT5ndy2KkYpXVr0KSF/cs=;
	b=XmFQOTW+Ot/IA1SZVgsu5BXEFsp7bo8dDoEkeHIPmySp0awvLh47ATy7lZSRfYipgJxIGs
	rmcrZ3rifvbfbHhXQ8NydekgQoji+MW1XDkJOM10ESeUNTrP56VVCP+oT6tZyZN+f6yRnk
	GDV5j+LoH7HeukKGsPNqXxtzp+MOd9o=
X-MC-Unique: QTYAuUePOI26YyWgtL5rdw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1XcL4Row74TJnIJarQ8KcpOm6IW4VPfNky/o6WUcdv/tmrfdh2jalCsq9qkMPhBZJRZh8NdkvBNNs6pro0tUyO/0btWO4cijjI63UF63mgO1e925m5HMj6wm7WF/UwrAAzcaMm11SLlP5g6CfJ7bl6+rMor1LMQG+lGOxe0kNLfB/nMuONGBGJTA9ys1hGRV6actWvia9mdpvGO5yPgGlaFOHd6PK1x992pfGREIntZLw3d3SGXzIQRdKaz8oMhEK3oEk2ocHZocNzpMelJ5N2sCNCc0rm6tI+7y4SmdcOj+XeFqoP/MiSWrUdrB65e4z2GAt9XRe1nyCTiICMztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w2AOTn8uytV+d9I02LqePSIlCotZTPrQqFmUBd59kc=;
 b=A8w+vn47VrD7fMIO6g7MOUrGwkh6kNTU7kdkEWK6znXntSRc65QuDcNRI/lqVKEY/oh5tBVB9dTmjkZ341sUhbQ8pv86myR48fmN2joaWMwxVvrJeAfXFTgSQFRcyc6tPw3QAAiFT/wi2T+Nb+AlM/VYm9KaR+sqhQOvtWi6qJCOUKDdFZZWMhgR02/ddxWVcEbikTrN4bSd3IMg8iOmkGR4FFm0zMXFkT1SLn8EXhBTQHcCq7YK/fGyKVdxW9hrF+DCAOthybmL5TESrZ9ppQSxzrr4VhkJeV/0QWMShEipK88frMdxKsd123/frk7WjS0bxDA3ba+BG6eBh3aqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83fa28ce-f2db-2451-356f-0dc0266834f2@suse.com>
Date: Tue, 8 Mar 2022 16:36:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Bjoern Doebel <doebel@amazon.de>, Michael Kurth <mku@amazon.de>,
 Martin Pohlack <mpohlack@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220308140126.8815-1-andrew.cooper3@citrix.com>
 <18fb4115-94d8-16c2-e39b-1be895e254f4@suse.com>
 <476a25f8-86eb-0df5-b481-fc4cd5ecbb18@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <476a25f8-86eb-0df5-b481-fc4cd5ecbb18@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0051.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a67136b-db8b-46d2-9a6c-08da01196038
X-MS-TrafficTypeDiagnostic: VI1PR04MB5118:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51182CE932A6C7A91402EE2BB3099@VI1PR04MB5118.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ev0bnpAzTNnXa1zFvLGhTvsD5BLpfcyFssgtk0Y6BB5M8Jk1ejd7XI+xtU8Q2/npXR64dg/zO/jWc2At/KtOkk1wxY/Omck/elL2meclUgmTAGZNrwNMmtsH7vISyFZgFD7XYkOBDCptwpA9Wh6RZKwqfEV0BNGyVCIFTUC5kwy76mBdehzOre07UYcldiWzESNEvHyq53kdasDA6FZCavKPTlShxwk/+EAWYNdJgdJTTlwIkKGEnKTSb5zETRqyQl+287eavv5HzyFmcyJ3khJK0mt6+gk9Ohb8oLiJpNhyliD3kClPZqEnrjU0ZlYhXq4QuISKb7Y31Lr5MX9vhzYDONU+ZnRQiCE+8ZF5QXqjnQv9dxLbp4oN8opYEUQiZ/YIgKcuAfFrIN2oI4yAneHo0jPIMzFVNhJsUSwi5c2Bzv2QmjQt2OhvKSHW/OEhDCENGGMvyf1rKpDLRMhF3pt3+sigCMQN8akn+H2pB7bRT1PDfAZ45NutYqR6CW3bbu1IMmRGkPFMdTxtmQuSDQE9+1NSjgDmfj8a6Yvy8toKO9FSbHptkmyZbY7c8TpfvQW1yM8B3MIani67g+b2HkHBnMy+66s23p42ALztX9FwKPwDPaVVaYqOQvVU8oJaB7gncs3Miuy/FuoIC9EfYtxSJ8CfFEaWZBaT1Gjfn6MnF9PYpHkYtoSZRH0BbMkznsWUd5q9iTMEZ3zOOdrox5r/988lwfjN3aPPk3OtCdU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6486002)(31686004)(6512007)(6506007)(36756003)(53546011)(66574015)(83380400001)(5660300002)(508600001)(31696002)(54906003)(26005)(8936002)(6916009)(186003)(86362001)(2906002)(38100700002)(8676002)(66556008)(66476007)(66946007)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/q8tM19xW+v5iz3OvGYzNzP2dBOhGMUTVQcgxzKAUcCgDk8qxqWxPoY0tDwf?=
 =?us-ascii?Q?OKhZY88TqQOqKisZRzTfXVDV/f6LMA6nI9qDazsNlPT7cNHO5oYKDvptx8MH?=
 =?us-ascii?Q?oEr2kpnPAgYDiUTR01Id3KVT5D5VDfqHcaocVH8v/ypaHlNXci/iCwA3FaOk?=
 =?us-ascii?Q?RwKnBPqLfKtFOSdgB0nXxeSUE5YSQGGW1E4gNwsjB2wQQ3BZTDSb8QZW/IQF?=
 =?us-ascii?Q?vQFTPBJgg3g5lU/wcslsbxkgrfvot1yeP/MFsGGDcfhj4C9LeQk4pPlrqo2Z?=
 =?us-ascii?Q?xW4Y1VhX9TPIIa/8QRX2W4sJXUVgkZTRhzXBukkCkYtoBinMatfkl4u5YAyr?=
 =?us-ascii?Q?SxCJSVGbrwlgBIcOFWf7PvfLM2jIy0439HC1I/TFxKAm1yr7dF7vq1mZwd7T?=
 =?us-ascii?Q?yER8PgJWklwEfHupaq4iH5D79DCIvPZa4MJJO3DossCVdM0JAIEdkFqbqSoo?=
 =?us-ascii?Q?6LotNvwHY3n7Nh6CJKapTgvA4xwSwJXQqxZU20eec9uc3SLNDL7X/yDe1LiL?=
 =?us-ascii?Q?NKVY9wsYGMcrcrO4QdzBpdAdt1znZppQB+T0TIH4AFcUmi/UzrIwgPWtP2bR?=
 =?us-ascii?Q?CFoxXqBdF1qkgDDljdDe22bgjoSfrGDTNdPJAuTLi3Fwe74Gaf86bWRWFAUV?=
 =?us-ascii?Q?w9ZA/YElveL4CNCrJBNqbapZZhNLjjqfwAnRiNwJoDAmneX9GSMbKBSBFuOQ?=
 =?us-ascii?Q?FBhuV8gBkGkmUmn3xGIDliyODaRMhY3HXV7w/fMvbFKOn77BWFyJ+aXwdWDW?=
 =?us-ascii?Q?5HCTF1dhxcfAGa8dxs97H1XRbXEISUV91CsvYysWEouG2SnJTQhD7Zz+gQyf?=
 =?us-ascii?Q?l6mQBSY1YDTylcQpoZnc329dalezDjDt6A8YfvKVQJPsIMZKR2ZrsllAfxZ2?=
 =?us-ascii?Q?WEmMYp6FYC437sVu5aO+iQEmWU+Jw9o9qlsXHOzRrw+v49m4iB+b/bkjtAO+?=
 =?us-ascii?Q?30jZAwURRUQ9bbR/pIKmPp4RT1umXQo2kH9PNQ6deYBm5IJlgoObwsmyRxwK?=
 =?us-ascii?Q?K/z6LELRRb2/gGTCDQtJPouGT34nVWdQ7B07AZWZwbY3aA8v89VhhT+QT1G3?=
 =?us-ascii?Q?efOC/QXdicHY6jnmuMBhg9to4JYHMoKu6m9sBVAU/70bG4HPTj5OBIslbwWV?=
 =?us-ascii?Q?7kX7CmX7rV8aok50BzEiOzgQShrCmI3t2eNtTEmOtwtq0PHOwsIotsBibvtv?=
 =?us-ascii?Q?LEZg4R7/5qiZ5Ao89Faqe6631GQ+ePtjp+ndjFv8rGZl5P3i5nYntpvV415S?=
 =?us-ascii?Q?ZXu5pqP5YIkNDQXFX791UbBk3UNgUWztF1RsTPq1QwGbCgAThGjYEShFqju6?=
 =?us-ascii?Q?h8B7q3+RCU8k6eTG+MWah6FJ8LBTDvvUcEZmHHSKHZm5G9ZazVvVvIp54kQy?=
 =?us-ascii?Q?Sy6OkfighiX0b+dQZaGcDDM5lsdcxbCKpJfcn5VdbPPOeqynmRutji8ywvRm?=
 =?us-ascii?Q?qZC297csUo+C43g8bex9EOUIpQ0DNeoE/l1JB4lwXS0D35P29oyb8APynd/c?=
 =?us-ascii?Q?10HtsUAdGsA1d93pH4YyMqrVz5WyQMc3jWZcsCnRF21ieS4c7cuZPocBQLmh?=
 =?us-ascii?Q?/IbZ0aJLRlSncrvmrObBpwR7t7spB5Mhqnrv7wUIxJBqu9HTVR3JqTvePKgG?=
 =?us-ascii?Q?9LSg+Z47K8cW6ZBERRzcOcE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a67136b-db8b-46d2-9a6c-08da01196038
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:36:12.7572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmF7exZoN7Lm4IZwQFNfjFz+cwOtLhttjhlmKfDAL3LiWR02QS2/YTQnhEXHRFlZgoF4ZA77jK8veZlosO3FZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5118

On 08.03.2022 16:19, Andrew Cooper wrote:
> On 08/03/2022 14:37, Jan Beulich wrote:
>> On 08.03.2022 15:01, Andrew Cooper wrote:
>>> For livepatching, we need to look at a potentially clobbered function a=
nd
>>> determine whether it used to have an ENDBR64 instruction.
>>>
>>> Use a non-default 4-byte P6 long nop, not emitted by toolchains, and in=
troduce
>>> the was_endbr64() predicate.
>> Did you consider using ENDBR32 for this purpose?
>=20
> No, and no because that's very short sighted.=C2=A0 Even 4 non-nops would=
 be
> better than ENDBR32, because they wouldn't create actually-usable
> codepaths in corner cases we care to exclude.

Well - I thought of ENDBR32 because elsewhere you said we don't
need to be worried about any byte sequence resembling that insn,
since for it to become "usable" an attacker would first need to
have managed to manufacture a 32-bit ring0 code segment. Now you
say effectively the opposite.

>> I'm worried that
>> the pattern you picked is still too close to what might be used
>> (down the road) by a tool chain.
>=20
> This is what Linux are doing too, but no - I'm not worried.=C2=A0 The
> encoding isn't the only protection; toolchains also have no reason to
> put a nop4 at the head of functions; nop5 is the common one to find.

Well, okay - let's hope for the best then.

>>> Bjoern: For the livepatching code, I think you want:
>>>
>>>   if ( is_endbr64(...) || was_endbr64(...) )
>>>       needed +=3D ENDBR64_LEN;
>> Looks like I didn't fully understand the problem then from your
>> initial description. The adjustment here (and the one needed in
>> Bj=C3=B6rn's patch) is to compensate for the advancing of the
>> targets of altcalls past the ENDBR?
>=20
> No.=C2=A0 Consider this scenario:
>=20
> callee:
> =C2=A0=C2=A0=C2=A0 endbr64
> =C2=A0=C2=A0=C2=A0 ...
>=20
> altcall:
> =C2=A0=C2=A0=C2=A0 call *foo(%rip)
>=20
> During boot, we rewrite altcall to be `call callee+4` and turn endbr64
> into nops, so it now looks like:
>=20
> callee:
> =C2=A0=C2=A0=C2=A0 nop4
> =C2=A0=C2=A0=C2=A0 ...
>=20
> altcall:
> =C2=A0=C2=A0=C2=A0 call callee+4
>=20
> Then we want to livepatch callee to callee_new, so we get
>=20
> callee_new:
> =C2=A0=C2=A0=C2=A0 endbr64
> =C2=A0=C2=A0=C2=A0 ...
>=20
> in the livepatch itself.
>=20
> Now, to actually patch, we need to memcpy(callee+4, "jmp callee_new", 5).
>=20
> The livepatch logic calling is_endbr(callee) doesn't work because it's
> now a nop4, which is why it needs a was_endbr64(callee) too.

Sounds like exactly what I was thinking of. Perhaps my description
wasn't sufficiently clear / unambiguous then.

>>> --- a/xen/arch/x86/include/asm/endbr.h
>>> +++ b/xen/arch/x86/include/asm/endbr.h
>>> @@ -52,4 +52,16 @@ static inline void place_endbr64(void *ptr)
>>>      *(uint32_t *)ptr =3D gen_endbr64();
>>>  }
>>> =20
>>> +/*
>>> + * After clobbering ENDBR64, we may need to confirm that the site used=
 to
>>> + * contain an ENDBR64 instruction.  Use an encoding which isn't the de=
fault
>>> + * P6_NOP4.
>>> + */
>>> +#define ENDBR64_POISON "\x66\x0f\x1f\x00" /* osp nopl (%rax) */
>> In case this remains as is - did you mean "opsz" instead of "osp"?
>> But this really is "nopw (%rax)" anyway.
>=20
> Oh, osp is the nasm name.=C2=A0 I'll switch to nopw.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


