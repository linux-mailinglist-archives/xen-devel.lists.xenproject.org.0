Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329F4EBF11
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 12:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296239.504221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVnu-0007aV-EW; Wed, 30 Mar 2022 10:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296239.504221; Wed, 30 Mar 2022 10:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVnu-0007Xb-Aw; Wed, 30 Mar 2022 10:43:54 +0000
Received: by outflank-mailman (input) for mailman id 296239;
 Wed, 30 Mar 2022 10:43:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZVnt-0007XS-05
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 10:43:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49a9a496-b016-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 12:43:51 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-_p6YEKb0Of6uAk4zSOn16A-1; Wed, 30 Mar 2022 12:43:50 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB7542.eurprd04.prod.outlook.com (2603:10a6:20b:299::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 10:43:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 10:43:49 +0000
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
X-Inumbo-ID: 49a9a496-b016-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648637031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GMp6Bw5+2YKFKmbUnpPxdW3hKBQw7aSQDhYgU7rZSQA=;
	b=Ado4B1at2FQ1ggXLqaxonMRXYX0Mph6lyJOyhba+dokQKlHTXsCL/pmB2hk1VJBOHn+wb1
	XWlI+FR/higjGChs6quEWOV7Hfzg437OKH+yFKJUy6+lFrUn7vmw0qftQiZTmWCr6ik39q
	aZUXxD4flCNVGzQht5XWDNfVbUWNZig=
X-MC-Unique: _p6YEKb0Of6uAk4zSOn16A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1/hZcttWNrpoyZ1egoMUIzbyk5YuUrNIivIuGVtscPiOsVyJccE4Dz0G5WAfMKjjXarfIRyBC1zkfxfY7WK8SYjSvewBMEuAlcHaJoBihkqNQVeibE3MOeMYfBDHxExvHFoQYWkysDX/SFMQKTjBn75Tnoz/jnbtK2498EgN2AJqJgXsyiqK7KuRtgXsMN7ttdRSTy7/U6J0WRWgoA6zzwA4wa4syaBQABz3uUKMsGzKiEwyhX/4SMhhWYI3S6SBrrJVIHjw8XlsjuvDLngwSi6JxMwCqPUQ6F33+K9Ke0I7fJ/qyldHBOwHAogafQvsXNiNoh+a93D4doPDy69Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6G8ov2OQZezSXYL4zu8Fe5J/pEDAfYS//mEASkyFCE=;
 b=EIrBKf9nQsdVWjuBy8TsqJ9ytHUX89NVS//8Jo1PqCvjpFucnG/H0vArlmE0zeYCVQ6iLhlduHdzxKYaTZ2k4ZTUGlKJkwqyX4z0YF1YPTvSi/r97xpBZq6UCF15Jbby6ys2Owzb2tPrJadviN9xn5YbTit8EDORfAxGF1LaZO/SaH+yMrBNAkPZdNygaG7IQixruFL5vmYdKQCDN6vp2n20nIYOTd69WDrT0R/yv7rcXIWioi8NBo7H8R/m8o9YMKSRfsIMY5p0LiV2So62wB1kZlqdDQXO/bGQPcDzbteMhm4ZTHI2FKL3oWmu3m/dbEzgg2rS06f2P4MnPyromQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab0e2c42-fb22-43ca-261b-4f8d1d9a542f@suse.com>
Date: Wed, 30 Mar 2022 12:43:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] livepatch: account for patch offset when applying NOP
 patch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <2df6d890-9d91-62cc-8057-3d50f1501ad5@suse.com>
 <YkQusCcbe++iMGnH@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkQusCcbe++iMGnH@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0128.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a16ce2d4-c4a5-45a6-52a9-08da123a2cc5
X-MS-TrafficTypeDiagnostic: AS8PR04MB7542:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7542D2E7EF10BEF12FF385C8B31F9@AS8PR04MB7542.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6OR4wlVlp86KvzP7nUMNL62n+skIaRid4ANzEB8m74RaYbiz9g7fEC/6sPpWVx/3pDgEVU6JTvgafU2vSHBOnpjSVVrC1zTbmb/W31dD961ZNhFucQFr8P82SYMiADxdHSRXFtXuIZx96+CC4zOCu04uQMLGFY36U5n0K3FJ2dfxvkO7MXq973g9e5IvNn1RE2MBaAwfwAlK0KfZK3erU1LP3UDUqh3kHweRsccD6svfIq/FMIbxbp3bCrKJuUxPPGyZzjYAPXMIHxDbEEvZtxksYdCkdrEnxYsXAPfn0wdsN4XGNGuHs+m2pvSETTv2bvzi1pm1/C42Wv8PaETqUCHuRXSFAGXT28eNPAI0zg/oZoxe29zSgalub8KmdBO3tSvcfvRPp9keSJWoMnl4nTM0Mg858EZh4w6MB9ea8OBO+Al0TzknOXoAwRrwXHVe8vCfRNE0Xjc8wCDy1ct5vJibQEYdF3uswpVjycH9xTO9VarQJCNc/Kr1lMxS+VCvZYo8Bpf0m9FTxrX/OHif86nMCxuon9I48wbPpDRlsgU9/fA44dYfUbj64kV5gvLqykn87vx1g69lmlL9AOyaqpdaTbDDxKhxSvGdfuiPKshK+R6xYXRptVmZm7XrwIu4gYg1fFx8m43nk8iMKye+Wkqgy6GLeyRh4U9rGlKh61mSA+tX278EGYapLzeF5BF7ts1fiMmVuwL+7GNHoZkj9jMf/DoXFRDFEzGe5WZjrhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(4326008)(5660300002)(316002)(8676002)(53546011)(6506007)(26005)(2906002)(36756003)(186003)(8936002)(66476007)(66556008)(6916009)(15650500001)(508600001)(83380400001)(2616005)(6512007)(38100700002)(54906003)(6486002)(66946007)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?97MJeVQGU8rtFIm4MKw/iZ5OHU6vmh2SRGEKa+3jylXC7yANZrcP5hoVffYx?=
 =?us-ascii?Q?S4O+nZSK20SvsKm/HP2klx51wC9P710RTRmKkl3rhNhfer4p6KKcPN1esnhG?=
 =?us-ascii?Q?ZSe63q+NC2sUNrIPdy/p9TGD5QHI4hGE0AqslNoy5vwpz5lhLUPaLVfkAc6N?=
 =?us-ascii?Q?a9hvJt0C0g0Q9vHEHqeEgFGdSLZczi99zAAUBhnn5BMjdSHV+h9aFToKq5ch?=
 =?us-ascii?Q?VftGKXyudwoklXVmvX+gXEPEqHhrsCfo/Kg1g1zslZwt2FjpYKFwR6q9bx4R?=
 =?us-ascii?Q?VIAjrBzSjSEkhoWKOXPgpxnK1QPDmftx8nX1WcCbZHl/Nys1eFAOsYeIFKU9?=
 =?us-ascii?Q?eaLSTbZp16GD5lhX9bCOI+r24d2ETEQEV23Q/rK3wL5uU5IMyref5wH/KamP?=
 =?us-ascii?Q?IpRqH+sY82fpIKlryE5URy0pIHXSJXnzqvA26Jrh0L7WQm063FS4xC/V91Jn?=
 =?us-ascii?Q?XSDGceEP7J+FyjoW+tEPR5elsU0tXl+ttrynu+2ob1Db6ppvkjyXyxJ+Xc02?=
 =?us-ascii?Q?E7lYJ2vY3vcXlnzFqRi/Gj5WEiVQj8RfuoNyzPT+FHgpRr+m+dBmzXvIk5RB?=
 =?us-ascii?Q?akLF6X1TUIVmIkonGEQOKslZE9Q8ESnLktf59REEfXF8Gd6495CyBEsLOCv+?=
 =?us-ascii?Q?FSUbz0thSzVuQNjNwTzZyvBZy/FTkzNKpDf9Xd6TtPu9Q/t9HjkCAWJAbUn6?=
 =?us-ascii?Q?1xkXYXTvIJ+1n0Nros9bxKZjWep9tob1BEETwkaQbJuQ3P85MbxncAJrGmN1?=
 =?us-ascii?Q?14JaxxdzUz70z7QbwTnpTiayjFaJCRf8yq3zTAjDR01ftCvXkcyMMOB6MmbE?=
 =?us-ascii?Q?rte+AvT8LcL2NINQftymqEtrPOs27jqWeecJ3jCdTkA5gHJoQp8J6ES7ZIz4?=
 =?us-ascii?Q?POxTlHu6zPJCFF7INycgZmos24pEZptEHesbEul2++fRX6vmfN5DsX0+yXst?=
 =?us-ascii?Q?qdnvDroDEBi6nslDKjzpLv7kc2buWSCFM1FzFTuSOdEOBfD48GREv7sJhGEV?=
 =?us-ascii?Q?IVELPN41DRfIeWyjCHCrVHywUW+Qgz3/a3L634KlQLi3teP++GU2wSSjOlQv?=
 =?us-ascii?Q?WgJKYMoW0poq6HXbCF6nozy5CFTueJmu2WfLn+mumM+UWLYT3s0OieXVeZke?=
 =?us-ascii?Q?xAulW8OEa5lv67dgy13CX1OYBI388bYfsuGAuZ89/FxJQbGWH5tjcHQkdCM3?=
 =?us-ascii?Q?/zxCSn0KLJUS+nS3DPn5P8SjQ4Y8c5vLYXkB5TkZ9vbEraXhMR5wRNPW5HyA?=
 =?us-ascii?Q?XB0I3HDOyYsKNVOxk9OhSbrmh4IPM+vJVRxogVh64DT1kJl+p7z9q3YOKRzG?=
 =?us-ascii?Q?eSKMVQbvctUKAylAJ04GSud8+7ZzD8ot5/C3/v3vXRMcj8DjDHMZ/LjeEeLb?=
 =?us-ascii?Q?FKLxh8BeawjZTXBbS01gxQ9QB/SbDKIcwwGxHNRl8MGOlOcmA7EV0/9VP4DC?=
 =?us-ascii?Q?cOg41oMPmJ69NleFaepiWZH0A1mpwDBA6E3jaN8y5QH3XMuU08q4aZmHUxqv?=
 =?us-ascii?Q?eMftngfXwtlg69J4iTfdKhkSZvax3as4sV7DYYcTKL8HBt6/7DzrRnZIolUq?=
 =?us-ascii?Q?jD4ugVyGiK10MRqsmaBvYJQWtotovvrjAHVbqKOtXp/pgz4tQZ9MsQwAM2j3?=
 =?us-ascii?Q?lRAhB5ZZ+0oK9HqGj1G7Poc//eEBLgl62vXgB62kFu/oQ3nUDtYeoh6y0SmH?=
 =?us-ascii?Q?9qw0+uy0eOX0SB8AGdsi02Et2HHul9d7apD/NpyymJEiAlfMP97IctUzQtr3?=
 =?us-ascii?Q?MtBAwqaRlQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16ce2d4-c4a5-45a6-52a9-08da123a2cc5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 10:43:49.5816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFqg6G6KELe0ynZq/cmkwD/5NAO8aifndNXYsNuDMR3c0Pzajl6U+1lmGwu+cyPm7j1Nz6WtEhSlLNnOc/oiAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7542

On 30.03.2022 12:19, Roger Pau Monn=C3=A9 wrote:
> On Wed, Mar 30, 2022 at 10:03:11AM +0200, Jan Beulich wrote:
>> While not triggered by the trivial xen_nop in-tree patch on
>> staging/master, that patch exposes a problem on the stable trees, where
>> all functions have ENDBR inserted. When NOP-ing out a range, we need to
>> account for this. Handle this right in livepatch_insn_len().
>>
>> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced =
functions")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Only build tested, as I don't have a live patching environment available=
.
>>
>> For Arm this assumes that the patch_offset field starts out as zero; I
>> think we can make such an assumption, yet otoh on x86 explicit
>> initialization was added by the cited commit.
>>
>> --- a/xen/include/xen/livepatch.h
>> +++ b/xen/include/xen/livepatch.h
>> @@ -90,7 +90,7 @@ static inline
>>  unsigned int livepatch_insn_len(const struct livepatch_func *func)
>>  {
>>      if ( !func->new_addr )
>> -        return func->new_size;
>> +        return func->new_size - func->patch_offset;
>> =20
>>      return ARCH_PATCH_INSN_SIZE;
>>  }
>=20
> Don't you also need to move the call to livepatch_insn_len() in
> arch_livepatch_apply() after func->patch_offset has been adjusted to
> account for ENDBR presence?

Oh, yes, I definitely need to.

Jan


