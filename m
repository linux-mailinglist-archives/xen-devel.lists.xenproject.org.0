Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EE94D03D2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286264.485715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRG1i-0001z4-Pd; Mon, 07 Mar 2022 16:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286264.485715; Mon, 07 Mar 2022 16:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRG1i-0001xH-Mb; Mon, 07 Mar 2022 16:16:02 +0000
Received: by outflank-mailman (input) for mailman id 286264;
 Mon, 07 Mar 2022 16:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRG1g-0001jB-QO
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:16:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e00a5348-9e31-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 17:15:59 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-TszvJ_t_MA-aVcGAPBn17w-2; Mon, 07 Mar 2022 17:15:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5860.eurprd04.prod.outlook.com (2603:10a6:208:133::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.18; Mon, 7 Mar
 2022 16:15:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:15:57 +0000
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
X-Inumbo-ID: e00a5348-9e31-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646669759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nEjYlXt1zDan7oLayGVR7OxAzU5uQFkZuknePAOxufI=;
	b=RYe+oevauSbdcrZhp2ZjjduabO8XIWCbBF4CunpW1s/LwDsPk1+Vo536OnID1avISflcNM
	zMDnJlMijyQTpPR+Kl2DX1HTjyobfg1SjdgXOo/5Cy//Bm7nb+hVwENQnHD4r+V3wkSHY1
	SUppQWoa0JFqb33TAlAEO06rC+GwR2w=
X-MC-Unique: TszvJ_t_MA-aVcGAPBn17w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLhnta1FwQmemKYv8mKXC5ygkqFmTgEZ/avjONdxBuPxHlFM50sMRLfrM672Pxk3J+L5iHKRdAERQbx2eOxckbSqun7MlcKJZ4IYMjVsEKJoX3CRJ7ZKT6KCI64zmLJtdsToBKH2Gf9++aODguqynW+LSK5PO3yNdz1C8KHIasX1CDat3b4ubpgLghEYCg0MiWcCzIEJfwi1aV3yJz9veuc4mcTJXKj1wCHZ601V7ldvl7J6c4WpphiN0joNgndj6CGJBBskrh6rGuKJPtR/NsD6rm/b8ekOGvVP88FOJnzmCdeakdgQu4aeiwl3dAp2zuxd1buJdVGDTHqp/8yB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBGHdI3enb7inDsl/3vmPPVxzYsTe6TEN595EWw/u2o=;
 b=kahwW6MbO1+7T1+bdeTMHEDC21xlCQ81QpnMLQIf86OadEjaAE9rFYYPziUKsU/y7xg5QKQjp7d9KKI1HH5fPn6c/f2ya0uGo9juWgaT5r9TOks0sDa3vfey6pftpOfdFeaKFWWzdnBIa4YgdH3Xv71B3KO9ZNFfO3bKwzh44hdXcr61IlNir3pJ0Mqiq+bUDGm4Uc8deUwX5DJOIZ0bauUS/cl5NHKBOQOXzsutMhVSMhKJrR7DfA56FOHI3NeVn8ihr5F6XHD/CWlztpBAfX8eqZI0Hpleq7uCwvOUEMfq+QhYJ+aHJeMsQjd3R7vKNTm1GWfH8NQCtpSroyNbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f0b8b0a-7f0a-13b7-4839-94f30aaecfeb@suse.com>
Date: Mon, 7 Mar 2022 17:15:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <8b982bab-9b16-61e7-620f-5a5b2be39588@suse.com>
 <YiYfVmW3iQ4wA5k/@Air-de-Roger>
 <ca144758-da48-00a1-1e76-872c3455c335@suse.com>
 <YiYqLtozm4/2Ibu0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiYqLtozm4/2Ibu0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03f8e10c-105d-49f8-c883-08da0055c2df
X-MS-TrafficTypeDiagnostic: AM0PR04MB5860:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB58600215C943EB836FDE5AB6B3089@AM0PR04MB5860.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mO0ynthp5ff0JHZNEDtck9N5ZLK6vwWWHPAxPEKqTY6jvcAnnPxtwpjL9rNw9gCKLGBlIwLKbN3inxf1Xr93590rz3vDKbXL0j0jXvldZOGjaDE5ldALFWAVqpurAGU+D8uPCCTreLBohwrakj53nACYFTImuvQJY+EsweRDPiDZrfNsx6xy7k/c5WXEVtBywaZNVtD8MOyWyjc2Rnb6yP2K5ie39qO8+s65q6KOpvqUSNjFicOhPMMcpnEnF5FNHFVRKg1uIZrGfJa0/mN+7moZW+gD7lxy9afmV7pt9Du0Z5Etey9/dFBmqczP7fw8OerMVs8WZf0zHfm23VQ1rze4BAcb0lWqL4QAVdnAP/yXlxZ+VuPG2pDMVHp2061V6uxCRhoSMYpifid4m7wowd05gXU8lx+THya/sgbeceFT1k8X8Au7xnZe2Q1HyggXLBQ+Kb6enb8T2h+5FjJvGovI1Cp1/KN5lc+27kVYb0ptHQWB2isCtWDbp5Ahg5kjv02/PED14rL+vMoGG4PYPoEUgnfKLmcLSpXecqKRldl19Wetbj1eBpv3vAaNjiNHCs1xlnOAHETkYl6C/PXj3RlSnlizQoOVUVdPk9ZsgILNS55XoEMZyENnjMhC62JcJReqWJYf/rMocW7YzWSFwkXp0O+SLNfzN8VaSyAj//V2egLWLcz2faQzHPZUasVnbEXemXdyrLMFzqniyj++u0/orQBcrpxCdUtl8MBhtum3gBvxZhPKqVgDUHVa3swG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(8936002)(2906002)(4326008)(36756003)(8676002)(66946007)(66476007)(66556008)(5660300002)(54906003)(6916009)(31696002)(31686004)(316002)(6486002)(53546011)(6512007)(6506007)(508600001)(38100700002)(26005)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Fq6XbwsUFrDvl30qQeeIWUfiaps7wBlc5VXMzBNbvzpC3yp61uKk2fEWcaa?=
 =?us-ascii?Q?4SRldHNkQaK5cMiUUO4gDdC5zegnxz+iZuZETX3MsrfaLt5hjGzIEfyGqe1A?=
 =?us-ascii?Q?at8TzssEMULUq/tfqwAuTp0UsPisLZEgA+GXd8VXCAeZDqf+l2qpigr5QdYR?=
 =?us-ascii?Q?PQarvmB0YmrsuMkjqm7Nz7CrYzCWn74MKb2Za1MHIdgRjd5TDm4r8v6w2ity?=
 =?us-ascii?Q?0/Wr147y40D3MWzuYDtZkuf91Z3fR42KEuuG4ogGvn0xLVyz+4M/D5tQEpHp?=
 =?us-ascii?Q?Gxd2S5hQ8HJVEmrjYpi05FTg2xYQ4IIbTyQw1OnRj0/4XW6ed4+jO4e+5Ln+?=
 =?us-ascii?Q?b9YOJ3doiEB9kKDYezWm/4v2dMPf9H/HZKWOZyfp2ITJxuZSSecvyR0bB7l0?=
 =?us-ascii?Q?sDNs1WCMUih6FhrTj02B3jtADpAt8lkkOEcqoMB3HdzO+3fne/RJOdmP4vr+?=
 =?us-ascii?Q?SClWQTskZhE8aJz9IhD59uBsTWne8ClYB7Vv+fx+4gnJfHGZsdtDYK+19hoX?=
 =?us-ascii?Q?/DTyfhRrBUAU0jOYkvbPuVF8zxkFjTLXTMvjFvjtD//QlAp0bh4gGRYErTLb?=
 =?us-ascii?Q?pf3rkZ9dMnCMtP2mfSwRJjayPU1LpMCMY09ORD/tQWSPX1M8LexptnlyMRRt?=
 =?us-ascii?Q?yxuvbyo+BoJuq+2DFEjxkygO47bKsURm/fE0QVVW300bRk+ufC36HkK6jyu7?=
 =?us-ascii?Q?EIC+56KhHp8eF2qUUYD28KetabvkIgFBXhQJrxpiT17X5DiFHhVjp5n8fJoG?=
 =?us-ascii?Q?xyTZwLdyuPE9+H2u7PKV8IJoHPAMtl4FGWPe11ZGB0hoyeV+fzSU+fvNhLPL?=
 =?us-ascii?Q?y/ubKLZu2G98aYgbqUPH+DmgUHNq5QLdR197p3gYR+A/S1YE/fAmDT/t2Fyx?=
 =?us-ascii?Q?HdE3ylVqZM8LqSa1SkCOnQMNCIahIhjVFvaHBuKggWD+h6jCU/bJumljamWU?=
 =?us-ascii?Q?is5ieig0KdfIUpteVT3FCGOnWIWiuyr/DwX4p8zDohGwWcTYnZhXiw0MBnHL?=
 =?us-ascii?Q?gSiKzIoXKSmEtiwRBsFPytGW+99LfDfDTtKHPjX4ht3rVtvhF/fnVlSnT3fj?=
 =?us-ascii?Q?718NDDb5MDhdI0jLsCX0e8OH1Kfdmj2k/mc3jPKFs8cYT3eTjwbIRfTzVy7N?=
 =?us-ascii?Q?FBSKnCM+tdcX2/w4Fifhl44LnNrmfTZrrp49Ny6nf//Y7+w3AC/qPNxf2isI?=
 =?us-ascii?Q?4e7CEnUU4VOU6Zw2A0nnGsyPKf1cUqZjOEdPwONm/8JEyoH9ONnBuO0R/tXo?=
 =?us-ascii?Q?povWEwrsyXEuqoLP/ofdi3nSXQcQRi5e/1GurCfBnrMnLblPWD1W5RrRXE8X?=
 =?us-ascii?Q?d4AHTUIye07H2ez+OjlP44XiYlcOp1VYHERSkyjJpBdJA2y3SzVhY91gWmXA?=
 =?us-ascii?Q?JW61oMHSbs7pA15Az1fyXBZy6kdAEvkZ8Tp35ZMUeDxFrUbb8Ehwrh3jm+CZ?=
 =?us-ascii?Q?2new2hJxiFf6J0+VdLD4O+wH0SqUfW2Yl0fD2lpZPuO8EG89rdiXHwO+bHLK?=
 =?us-ascii?Q?lmDWzpYTNBh1aBmwJ+jBF9ZqKzlQ8/6UfW5oAc8ItvUGLrcDo6j6+uvbkJiE?=
 =?us-ascii?Q?fni8s/8frZmG8rB6tTSpyoUwc0nWJze48rEOK5JHDqY296SuHrFh/RUlz91E?=
 =?us-ascii?Q?fIyHdkWBxctHgBk+5CPWEVQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f8e10c-105d-49f8-c883-08da0055c2df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:15:56.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrFsRFQ6qKKWtxULJWmOfi14V8DZOZFRzrI+oS2GtMOqowl3f+XdCMUN9UpTDCeUJy9ePfSQVbkAsVnd2GIfEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5860

On 07.03.2022 16:52, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 07, 2022 at 04:29:22PM +0100, Jan Beulich wrote:
>> On 07.03.2022 16:05, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Mar 07, 2022 at 02:49:32PM +0100, Jan Beulich wrote:
>>>> Support for this construct was added in 2.22 only. Avoid the need to
>>>> introduce logic to probe for linker script capabilities by (ab)using t=
he
>>>> probe for a command line option having appeared at about the same time=
.
>>>>
>>>> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Obviously this doesn't take care of old LLVM ld yet, if any care is
>>>> needed there in the first place.
>>>>
>>>> --- a/xen/arch/x86/arch.mk
>>>> +++ b/xen/arch/x86/arch.mk
>>>> @@ -70,6 +70,11 @@ ifeq ($(CONFIG_UBSAN),y)
>>>>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=3Dalignment)
>>>>  endif
>>>> =20
>>>> +# While not much better than going by raw GNU ld version, utilize tha=
t the
>>>> +# feature we're after has appeared in the same release as the
>>>> +# --print-output-format command line option.
>>>> +AFLAGS-$(call ld-option,--print-output-format) +=3D -DHAVE_LD_SORT_BY=
_INIT_PRIORITY
>>>
>>> LLVM ld doesn't have --print-output-format:
>>>
>>> % ld --print-output-format
>>> ld: error: unknown argument '--print-output-format'
>>>
>>> So it would be always defaulting to SORT. I'm not sure what to
>>> recommend.
>>
>> Do you know if all versions we support know of SORT_BY_INIT_PRIORITY?
>=20
> Hm, I don't think we can assume that we support LLVM LD in 3.5. I'm
> not even sure if LLVM 3.5 had LLD in the first place.
>=20
> The first version that we care about and that we test is LLVM LD 6,
> anything below that version is of unknown state.
>=20
> I've tested you change with SORT_BY_INIT_PRIORITY on it and it seems
> to be fine. This was on FreeBSD 12.3 version of LLD, not sure how
> many changes have been backported from newer versions there.

I'm inclined to suggest then that we unconditionally enable use of
this, in the hope that we'll never see a bug report. But of course
this then again gets me into the business of needing to determine
the which ld variant we're working with. Looks like I won't be able
to escape this anymore ...

Jan


