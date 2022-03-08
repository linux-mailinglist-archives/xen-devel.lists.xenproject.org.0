Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D24D1DCB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287232.487128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRd5J-0006Y1-Dg; Tue, 08 Mar 2022 16:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287232.487128; Tue, 08 Mar 2022 16:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRd5J-0006Vm-Ab; Tue, 08 Mar 2022 16:53:17 +0000
Received: by outflank-mailman (input) for mailman id 287232;
 Tue, 08 Mar 2022 16:53:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRd5I-0006Vg-Pu
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:53:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f8bd68e-9f00-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 17:53:15 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-W9PLVU0EP1ecIuuhKrcu2A-2; Tue, 08 Mar 2022 17:53:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3603.eurprd04.prod.outlook.com (2603:10a6:208:26::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 16:53:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 16:53:13 +0000
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
X-Inumbo-ID: 3f8bd68e-9f00-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646758395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZPpb1l88JCp3Kq6/UAR63UxqDeOO39F/yVuML7gkHM=;
	b=Ii0u3Cyxu07RHSLxf9m1YfpraDwpHLQBvSXzqDlTOOh9aUjFwx1p/CdC4DWKMpPFBQkFMw
	xRfoYt4uuEXKn6KXb3ACwf9UvrqJM4cdHH0m1cmNZ5cvR19KzJjjuS+nup3MT3wMzOhE+h
	qouCgiAtOAS74N6IXAI2LlHSqIr8Rck=
X-MC-Unique: W9PLVU0EP1ecIuuhKrcu2A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntuCSXI+b+C6Mp8vGGsUYBoQF4omQzJnz1fhHstYjKapppnzah9qp4QhEAnJd3bwOxGMDAPeLhpHuUm2iVIRVNzmu3e+fGP35BuFMz69HmzFbHUEmzixjqZeEQxSCrLxCJwPPXu0gJHd8qOY5NuEn8h92h8ITsJBd22tDr7x5BuusZ+6JSDewLqzl1WLPNyb2qmi+cEJJjuHun/2C5TbcFBIiERkm8oz3W6lVG/ShkWWC+NiXAXcXwqYv4Qke+PUadVcr4oYABrQuI8JfW4w4T9YxLlFrA9YgskxWPRuslwVI3cta0A+PTGB6VPaQMCwBfFy88U7aZvXPsmMQeSGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+2Ls0OgjiwbyRerevIP0KKIiPnSbGETld3+mPdUBRU=;
 b=B3Iey5BPDCJW40hsyF3DdLAZIbnq2b2o8HaQxm3szDY9jdoqsMNqhob1YPjdb7a7P/VKyjEMSn0BcAVZpsLDpWX6QV1GiBtz5eb5v40NDEMTDTrYkoTgNcFKs5M5/q4U1joSCLgAplb1/SHYjG7BZdGcLK4GGHUENRrccQPztKipnP3mIbG0rMxuf88JQSmzSs6BNhnpkesP0u3q2v6TQyDHlyWHDmvrOLqzC1LBrU/OJjWKXY5r7GRP7qc3J5Q/ksd0E34oFshFtWIjzTG1VP8IH7YYZzyNwWnb4X9CNq1VqNOctyn3Aw6U2Clb1ITeAt4BOUNhA7BH8mU4I5nGTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be4b48a8-fadc-4f6e-4493-51e9376a2028@suse.com>
Date: Tue, 8 Mar 2022 17:53:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH v1] arch/x86: Livepatch: fix overflow check when
 computing ELF relocations
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org,
 Bjoern Doebel <doebel@amazon.de>
References: <b74a68b038c31df4bb94a5b5e87453f5a249cfe2.1646753657.git.doebel@amazon.de>
 <c625d90c-ec0b-a2c3-cf93-08c99cc2f3ce@suse.com>
 <YieBJTHJBiUUqMCU@Air-de-Roger> <YieDtMqn+z5Aydkp@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YieDtMqn+z5Aydkp@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fd429e2-babc-41b7-990a-08da01242268
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3603:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB36038BEF21B3546052AEFA0EB3099@AM0PR0402MB3603.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	esqYWMfZfJiwCMqlybawLzXk4LgtJI4ZtN1aPrulw3l/RSSw3czzpb2RD1ESJM+toqv1RpMimVmFMfC0TLRy0nFU2KWXmWKC7gmYXkVDicKqg7U+R9sxp+Frng++dd4qgsjTFK2QQDX4I3VaTJNOF0XQvg4rQ1WivqEuoPU4iFT+RxRu8/PJ47ip81lDar+W2z/fe5Bc22jQwPbpuHZz+ZVN++CLLL+YRHy7wFtZMhLZ8hZaSgyeDQqu0NFsibTD4/eYHPj4qJ/VY7GMbNtRY7d7yPM/uigGCNJMBDwRYMNPEYPAo8aDYHjvS8osOCfRRmmXOHQ7kMZw55eeDRBguKJD0rxRY+xJorDVbplUUzgwbdEPCvhvE/tf+6KkOMSOr0t87jPhftJmtVaB7hmhwgkaXf4ImEOhL5z5VQdeAVZPvTBH68TDM5E+I3fTSYB2JNrkeTL6ArwFQuIrGtj9PmJA3SS8X3UfxBUiss3HsxivG0l6tZpBaQzxEDNSbRoG/VdWVZU017kxCcqZFfnEK6F3PwcUq06Ut2ab7j7wwnDqmGiFKUI2ZCxlWb/4N6G0wt35Qj/lVOYjP8yDbHnsXiaQD08UTXM2R68Z/WoTgxhvjs1OPMp8VLCMDAdZ9AhR9ZXb3qSOiUCd47fJtWbJyRYTzoV0OY0Z0SUUaicX/sYGc6dNHRIjBgXzpEyXflIAjPPFkPx0wz84xs0Ia3XXTNOCj3kA721SSJtZfB2cfKfp1nxlwE9Pb0ak4AdM3qG3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(54906003)(8676002)(66556008)(66476007)(66946007)(31686004)(186003)(26005)(4326008)(316002)(6916009)(31696002)(36756003)(2616005)(8936002)(6506007)(53546011)(6512007)(86362001)(2906002)(38100700002)(5660300002)(6486002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kEa9O9Mo+jVyVBQIQtN4Vr/w8b4SH3yXlQG3gIMwVVEmgEg7EaWe/hLIajAm?=
 =?us-ascii?Q?UYzeE3e7AF6UdmIpux9I/C4l9olM63hf83qwzi+y7BuOc6KvllCagp4nbT91?=
 =?us-ascii?Q?wXQdxfkg2FRW72Uqie8c1Uj66yuRzT80F3GaXFhlnpy+DIMePB2D+O3McBJ9?=
 =?us-ascii?Q?XGhxFrxt+rxg0R3EdrVID0oWvThby58cJE8NRoaHDThS7bPPko6V2JJqIoDD?=
 =?us-ascii?Q?lzf4L4w9NefLr5n8jM4b7SRyswi/b34H7AG/B8jdanJ0NPvOvjmI/k+u07Dn?=
 =?us-ascii?Q?CYzoZKZNkA/Ri+zB1B/L0QDAv2naNVISREi12gB1lnEPifo3KT+xXp9lYRpj?=
 =?us-ascii?Q?Mv2ZhdKmbtpj4+jg2T0qm98mAevK35y78hyrxHEh7ZjY7qIvM+OZMkNy0zN+?=
 =?us-ascii?Q?s1neGYDCCeT4+0YEUzAb0ze6gr7rVUKiT0RZ0BWQjBfFVDhHvDWmXmAVp4eZ?=
 =?us-ascii?Q?5furUAjZXe2Q7OD2wb4pQdXOBznibq9JvK5jE+CIwQJf7M4mv37deIEDV0w4?=
 =?us-ascii?Q?4p5YHqZJab9bNn2d/3an0C9oXkNficTPejkQVlnLVxQd7+NnwU3xEqn8NhYs?=
 =?us-ascii?Q?XGQ3laJa1BbYI7xegoT6gpm42z6Z4dHFbnDDQtt/ab/o+5+8JiwwxZYFpF3X?=
 =?us-ascii?Q?ymNKMq4Q1apQxXReK8zIxCCyZtcT+n8agnMgXnmAL8fDTR6XuAoTaQ7SQZLG?=
 =?us-ascii?Q?LgAmLTEAGULapEUqfCnfzMNf+dc4pTnq6Tn1CgtUekVNhJE2+7wDhFWU/OBQ?=
 =?us-ascii?Q?3LPl1WI/lJ8JD9vBaQTpu80CriuRd0At1VA7q7UZgEponPpWEd93CyALLmxk?=
 =?us-ascii?Q?ftYcusnBe6ZkiY/feO4H2prW7STRyaNOEuTIbhkeCf9KcVYQp8tcAyQm8yYg?=
 =?us-ascii?Q?OmsYr6whm5Zo3uHnb1/yN28JDXNfsF/k8avwOKYR+xFr5lndT+4SvVf88xcI?=
 =?us-ascii?Q?jZeAoEdzi8uQWXUMKMuJS/JKwa8Ls1Ls46Jot6QkX6mY9Xztn/0Dj38DjBaN?=
 =?us-ascii?Q?Lp+pyjy6oj1eewIglgnd8Jr654sacRJtVcaOKrlDnfm1/VZF7cDiDM5GL4Xx?=
 =?us-ascii?Q?Fci6/tp3K24xcqevrZCTVavsqVPCqQ+KhR/4NNrMqbFQS19eqzJGscHKos8e?=
 =?us-ascii?Q?IECt6maZlLbf5ciSjm6Jdy2sNIaarcIt6nG2AxmX8mTiUy89Zl3Ri4dNC4Vj?=
 =?us-ascii?Q?sMrIGWrMhY1DP/HJpPN6XAc3ZalJRIgzuwQ79X2rlNmI1Xhe3bxPQAHRXYei?=
 =?us-ascii?Q?tKRVH433dvOicnKtIcc3HGguSiaxPm7QAkQG376sDMg4tv/3Iri+Hrl0hLWB?=
 =?us-ascii?Q?f+lOhGzIxwMe0I+hsFTQLItj3HP2H/h/gKdCI5ZN7zj13ep6qUUWpPSEIGS3?=
 =?us-ascii?Q?99IAu+WOjRysOaPtZEuUld3ylk4H6vTr/wK0x8YDUFVTr5JcTTzI84RAFvsr?=
 =?us-ascii?Q?Ar2VM7I0QekVXpHurKZc1nfWwq09IUnM2YDtAmt14H6Xru9Og4yMI+yeVoXI?=
 =?us-ascii?Q?GMiY1IPRI6kSjqjP50UhM4gh2qmuoZbJ7KPkrSJENzsDnfuA2cjs9XdKlwJr?=
 =?us-ascii?Q?2RBFLkXX/Xl6kiuKEqVoto7TuhAR9AvmqkYtppjNsSnXyfmgWq7HPawkIA7f?=
 =?us-ascii?Q?xVkUG+IO7knUnaGjSLuUir4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd429e2-babc-41b7-990a-08da01242268
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:53:13.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnhIA4gSY2gEHc0yK/jENUh0lTiS3+0wVMZwchOdceHrzxe3Ny4R29hYCl2IJLd1yKlGnMX4vlIxtEWc6k40hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3603

On 08.03.2022 17:26, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 08, 2022 at 05:15:33PM +0100, Roger Pau Monn=C3=A9 wrote:
>> On Tue, Mar 08, 2022 at 04:45:34PM +0100, Jan Beulich wrote:
>>> On 08.03.2022 16:36, Bjoern Doebel wrote:
>>>> --- a/xen/arch/x86/livepatch.c
>>>> +++ b/xen/arch/x86/livepatch.c
>>>> @@ -339,7 +339,7 @@ int arch_livepatch_perform_rela(struct livepatch_e=
lf *elf,
>>>> =20
>>>>              val -=3D (uint64_t)dest;
>>>>              *(int32_t *)dest =3D val;
>>>
>>> Afaict after this assignment ...
>>>
>>>> -            if ( (int64_t)val !=3D *(int32_t *)dest )
>>>> +            if ( (int32_t)val !=3D *(int32_t *)dest )
>>>
>>> ... this condition can never be false. The cast really wants to be
>>> to int64_t, and the overflow you saw being reported is quite likely
>>> for a different reason. But from the sole message you did quote
>>> it's not really possible to figure what else is wrong.
>>
>> It seems Linux has that check ifdef'ed [0], but there's no reference
>> as to why it's that way (I've tracked it back to the x86-64 import on
>> the historical tree, f3081f5b66a06175ff2dabfe885a53fb04e71076).
>>
>> It's a 64bit relocation using a 32bit value, but it's unclear to me
>> that modifying the top 32bits is not allowed/intended.
>=20
> Urg, I've worded this very badly. It's a 64bit relocation using a
> 32bit value, but it's unclear to me that modifying the top 32bits is
> not allowed/intended and fine to be dropped.

I'm still confused: Afaics this is in the handling of R_X86_64_PC32,
which is a 32-bit relocation. Only a 32-bit field in memory is to be
modified, and the resulting value needs to fit such that when the
CPU fetches it and sign-extends it to 64 bits, the original value is
re-established. Hence the check, aiui.

Jan


