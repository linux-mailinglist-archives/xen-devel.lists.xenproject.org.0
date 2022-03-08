Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6474D1DB9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287225.487118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRd0c-000564-PC; Tue, 08 Mar 2022 16:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287225.487118; Tue, 08 Mar 2022 16:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRd0c-00054C-Kq; Tue, 08 Mar 2022 16:48:26 +0000
Received: by outflank-mailman (input) for mailman id 287225;
 Tue, 08 Mar 2022 16:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRd0b-000546-6J
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:48:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9154a96e-9eff-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 17:48:23 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-tCKCkwzANDyED-vt4bzypA-1; Tue, 08 Mar 2022 17:48:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3603.eurprd04.prod.outlook.com (2603:10a6:208:26::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 16:48:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 16:48:20 +0000
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
X-Inumbo-ID: 9154a96e-9eff-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646758103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RN1IwbWPZceqhd2HFBYkWltsZcbgxVL2260vwu1Q87s=;
	b=JAVRJKKSxIGAaxY4LXIEzlAOjJUS1mCBFeVqFoKDZ8cPGELpZw5bbN3CTSDEeCxL64APAQ
	BaOT0hqfoiEiZmeAEYpjEa5WzluP9XmkiJZSNT8N9OMy7B6L5pJruVqaZuNeSSGJZ8PyDt
	tTVDov2hwbo89vFiwz/F/YqAXfeyxSQ=
X-MC-Unique: tCKCkwzANDyED-vt4bzypA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjraGMx8suFMv4N25FYFBD6lWv1YLBejdaKISdEy14ggfpDFyQJIQo8pr8Nq3daOLwTO8rSDla2+ImbBIcubIvMBBNdUN1FLouvSVftX0lJmSvSmeNYQ47lmxmCp5ERMFLDiXz7qeIPbWHn8xWZ3DBJXSNCh70AyMOD3MNGgm7T3llnq7j8AoQ+Lh1N5BlEcDbde4LNMdmcYxKGFxuiuRQlbGFbL+xg15NJnwaNUKKR6sAuAYObQIfee8mFMaNaRJ3ojp16zpA/VD2vlrKlnNh3FD9m2vr8sR/OTmbjIgspqN+BZwDHeNtdiwuZs/Ck8alhRGggrkGP+jC5+R7PVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3CUNcJZnIcenVxqE9hGpM55RqJyLk7VV5qHTzznDBY=;
 b=IoNhsawZSWcU9aQvVBYNbm023QLo0BciPuhGyoODzzrJ1gZBBzCO7DuRvI2fXO2U61XRnYsqhgkBwYQuYnzbhH/o0txE1Dl4bfuau0MxU2kBkMKwIAmUkGQvQtF/3nbRXQDJeLEJoowjXz1qfqxm1+dwEHJRAU2PEajs9VXIvbK1kbboTFjpqZiW6HZ+bty5uv/knsXrTEYVz4CS3df9tuvijv6wM9ICSz78KP8Rt4F8uCEWpWt5WNw5bYl3KKC+UOsJvRLqypl6juWcINST5UGNFO+nFSJIL28HxWWLiLX9HkKHi9lLDTiUH3LcFVgeodsF9wJjcIx3ZbpGl/setg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85db9418-0452-d07f-b8bd-3713cb94dbbf@suse.com>
Date: Tue, 8 Mar 2022 17:48:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] x86/kexec: Fix kexec-reboot with CET active
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@cantab.net>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220307205313.31247-1-andrew.cooper3@citrix.com>
 <c3d9a1db-bda0-22f4-6733-11dfbb1bebfb@suse.com>
 <d6112602-b488-0b63-0131-fedd39c05eae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d6112602-b488-0b63-0131-fedd39c05eae@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 963aa1b1-6796-407d-f914-08da012373a0
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3603:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3603CBBF926F069CE96B4118B3099@AM0PR0402MB3603.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LALbnf6bE4n9do2/NWK1/jg0OPuZkvXVClFDoffcWKYsKO8+3QolSHmycz3Ll7pcGZqVTOq72H59qJJoEuZ9JiNtnh+q2AZ8o+EJMOdesGb+zoJG1Nj5xY7G1919rsxcZoZxSSO5u/iOd9mQnvIlzcMR9Em6sP80tPlVw0Ndly4knPxf8BidxMcgtJVNC4zogX6lK3Ude+lPjnBXHr56j5cam0vginOKdRxtZsxG732hEv/80J02PSh/hMjPiKaLKy9iKM4aDniAZ/qfYMuRB4hG3Y++alL8YqKDGY9GZzh2OjPwdum13BQxzBGPufT4MRUSZh0OLpxyAJAyU6Es2kBBZaZJix/fsPL+P3sIBpmvkEt1mNrVVAM+X3JQH042DK2y1VvjOUdxwTO7XqsqfWFuDGA+gUyOOYSAqA4eW43chSfAwibMzEyr+omaw36wBiJ84vZwOULntoZzx27N3U19pbtJZXAdFtWCzSNE2b88Cx0YSBAaG9t/QMj/QMyK9RcF4xuksVej4oGhbaBcVzBBC9tCh21rJjObuwYY8gL0VdAsQWgjhIFNrb89QUoBD6AHHrEh7K3aEGrLJHi/qBlAio1S7ta0aEcmURbeS7iab9nWnWpREsijfqqHTa+GPQsCu0jc9plc6KHN26uO/aZ1c58eV6pDW8cruFA/da9tZjfYvyCXtA0T+ywGDIUlNqxzIBfaGH+U7avrIxuBHOFs0OQ4krh8DP4u5lS7wdQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(54906003)(8676002)(66556008)(66476007)(66946007)(31686004)(186003)(26005)(4326008)(316002)(6916009)(31696002)(36756003)(2616005)(8936002)(6506007)(53546011)(6512007)(86362001)(2906002)(38100700002)(5660300002)(6486002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V5bRVTRlAafNnkoMgFReMiKdNiWQS0FkKwmUrnvvU/RytOe47SkGIJU5Um+z?=
 =?us-ascii?Q?5ktqfexGAsLrV0AZPhcQ2BM05dSG0lHnLWFOFP2VO5GTB05ftWYxkU1PfcFo?=
 =?us-ascii?Q?wekTGy7vKj+92xPwwEzrIBYgg+HGzmiAdZszKGOMccEWox7drcHMvMPVwr3+?=
 =?us-ascii?Q?Y7xtm0jvQgwrx8uXTgKreB0FxqqsC3AUhAetTWRMxN5fiOt1oxwokOOk5GmY?=
 =?us-ascii?Q?jgopQO6e80PD/thbz0ITqhQnGaLwgL590By4SFy/TAoPCx+p0ZZnpHdtx5GK?=
 =?us-ascii?Q?U5Gg43gw9swwy6ogFkngI0fiqpCXghohu6pBgPWyQBSpOTMRL5cJpPu/DLWK?=
 =?us-ascii?Q?7nPo8SVyce6TuLgL2rHFJvq08M69CWRploHapm1DPZmJhUq5+HRULTSD6GXX?=
 =?us-ascii?Q?WPmuiDE7MDUCeZADwNWho1tLwRcPEd6m4P1QTdX+cYVr7EJD76iIOWNln1bL?=
 =?us-ascii?Q?z8r7vD9cu8mWFcbwQJrIsdj6aMCny5nc8ypSqy3ywKN/z82F6DrMElq2tgjI?=
 =?us-ascii?Q?xSGSfgEIBL941chYaLB4qKQPNraCkLtQqQEonHrUT6+0idGoCQSlFtsu2Oyc?=
 =?us-ascii?Q?p2n/fE5aSxK+42mZ9a4oF0IKwUEw+lDs5r8jDl1B/HhfwRXv7nGv8MNafWRs?=
 =?us-ascii?Q?svgyDv5C1B9B8XbMqJt1P80r3l81sA9q3LDTBOwulRiRuyqPD0H1XviA3e2z?=
 =?us-ascii?Q?SCc0yPSbQ/C48Y/ZdoLTGYBOmZbHCwT7RpUNoX0LXSNF0Khex5eO3uadIS5i?=
 =?us-ascii?Q?TAcTjeSKyEdKhtz3+FvHiJ4KOgEPSXw+0B2GFDGzeZpJCtNJP+dsSqFpG1Re?=
 =?us-ascii?Q?uBHYSxyvbcbal0mg9ISL0cYIBCEoNDwCDx8KxWHM9q/fRMw9vhPvSTEJll3x?=
 =?us-ascii?Q?T04BLLUlrxlvRDUvFvHO9HAmzQle5164rtO630depea4oQ0VN9sDcDoW3kqD?=
 =?us-ascii?Q?cS239+XCZiRpjWf3chSDXCCZaeLsFIigjfn1y5z3+GDM2ByLCZsXMC6uTu3M?=
 =?us-ascii?Q?DPTiky711v6lp1FuUV0cA9hEpvJCR6N5nmFreXcKF8l8K3+izFMKTiliY79J?=
 =?us-ascii?Q?9IaHdYnejARK5+WHbs8qxUystiqsonqv23Ijhli7yVSwCrZTXSxlHYQr5rK/?=
 =?us-ascii?Q?716ykSBbsMuN1cbuoooIYbNJFQ7WeJ2m0vm2YNV9XzujftntHWBA9gWNVKod?=
 =?us-ascii?Q?HSM1uoQ/5ybqBSuvDcG/8Avi81vTaSU0SYohA7dWgL466UeK280bWOK1cOo4?=
 =?us-ascii?Q?0N0HYhgVPFhXOWGezVrclyIz+ObN2/nF9yZVvaPVAQqU81dAU/xhwluWg7PY?=
 =?us-ascii?Q?ewd4a0K0dK1WvZ5NgSQRPqoFNubtTgTeInW+Q7RQ4o2AScCEguCxOJSgQmda?=
 =?us-ascii?Q?LqsUMMskqRNGNcGWtDOTUeB0Ztu36Qo2jEqwni6b5UKvYs9Cn1AlRVR1NoQO?=
 =?us-ascii?Q?G38eQ/bCAqtIq+GJdfBJ68R9zBaeDmoZe7wm+jlEnhGbixPtSkbLUIeMN1zI?=
 =?us-ascii?Q?cpNuiEat3SHbtqe4QPABxDxOVq8eozgjb8EjgEEcNRiDNb/mUHajRGYROssw?=
 =?us-ascii?Q?JPlUBGQKDvd5VCm3M6yTZTO/vc1w1OeNzeiSkd5iT+DwMOt8VeCwWPaX49Nz?=
 =?us-ascii?Q?JUT0HWpmxv7IbR7zC5VrYmE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963aa1b1-6796-407d-f914-08da012373a0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:48:20.6914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wq6/tJxO7e0ANztSSQ88oVPYOW7K8xab80W9AA1I+Jo9t5Vd/heuB0KO9Dh1arheGCjeGNDHTFZPyBiVSy3gKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3603

On 08.03.2022 17:22, Andrew Cooper wrote:
> On 08/03/2022 08:15, Jan Beulich wrote:
>> On 07.03.2022 21:53, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/machine_kexec.c
>>> +++ b/xen/arch/x86/machine_kexec.c
>>> @@ -156,6 +156,16 @@ void machine_kexec(struct kexec_image *image)
>>>       */
>>>      local_irq_disable();
>>> =20
>>> +    /* Reset CPUID masking and faulting to the host's default. */
>>> +    ctxt_switch_levelling(NULL);
>>> +
>>> +    /* Disable CET. */
>>> +    if ( read_cr4() & X86_CR4_CET )
>>> +    {
>>> +        wrmsrl(MSR_S_CET, 0);
>>> +        write_cr4(read_cr4() & ~X86_CR4_CET);
>>> +    }
>>> +
>>>      /* Now regular interrupts are disabled, we need to reduce the impa=
ct
>>>       * of interrupts not disabled by 'cli'.
>>>       *
>> Besides introducing somewhat of a disconnect between the comment in
>> context here and the earlier local_irq_disable(), is it really
>> necessary to do both actions with IRQs off?
>=20
> We are a handful of instructions away from discarding Xen's context
> entirely.=C2=A0 IRQs are not a relevant concern.

Well, as said - the comment was what caught my eye. But as you appear to
think that slight disconnect is not an issue: I don't mean my remark to
be an objection. Feel free to commit with David's R-b.

Jan


