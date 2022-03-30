Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C494EBF33
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 12:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296247.504233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVuX-0000h2-Ay; Wed, 30 Mar 2022 10:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296247.504233; Wed, 30 Mar 2022 10:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVuX-0000dV-7e; Wed, 30 Mar 2022 10:50:45 +0000
Received: by outflank-mailman (input) for mailman id 296247;
 Wed, 30 Mar 2022 10:50:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZVuV-0000dP-BL
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 10:50:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e1e4f70-b017-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 12:50:41 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-K-hirX4vMPCSIdfNSA9omQ-1; Wed, 30 Mar 2022 12:50:33 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB3976.eurprd04.prod.outlook.com (2603:10a6:209:3f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 10:50:31 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 10:50:31 +0000
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
X-Inumbo-ID: 3e1e4f70-b017-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648637441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BB5MNNLumtrb6LGtvevIkfshKvGQ6Q6Jd36jMbWwlEg=;
	b=UIA3wzrP/zt7ah9WVhrPcoe+++sjUNLp+k9YM/FTOET1o1jg/N78E2Pn5HbHTKg6u3u2w9
	cq8jfUGsf//LiEPQAdq4v3srdUi6EbXtLyGaOvDmYcsn8qdFzeeAsc89QC1sO01vFmllof
	X0Cw74YnbjgwEvjPuLrc94uP0+LW2MA=
X-MC-Unique: K-hirX4vMPCSIdfNSA9omQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKd+rQL8S2EItBYLcRlfjwIzpHT9GIaxcwWdxbPy2lArT5lmd1hjUMMnpShnbQKch6KeXNA/+qkbRmhQtz2cdoOHcd8hPewq3Y8QLP35XoL7UicijxR2AyyiF48iMfKHZFf984k0DCxuAeyOKbUSVCQT1+76hCHHmsWBjMTbVfvB3wJI9qaxj39P7TiyA6v+YlkCx32QumB1NFbpHqZlT9ersq3jjrUIM+1OGLbs04vaRlyAiYoLRxuZJlgsGC/6jhup7j4o/OIMaav7bxG5fo2J9BnNejzs0KKpvj6OzkhCj0nbj5gVBSsRxq1QdMPwo/+rplERdIqzPDPNeoUVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll6w83opmguGPFOBBKn2y1kp7iPDLZg905WJqgfStcc=;
 b=En25RqL5c2D9Yi/zbGq1YACWfT13mAXwFSMLToc/RiXeC9gaLM0AFSJLtbf6g/mZjZHAZ0eKPTgFTGAXFgnCKDx5e+K9lrXcJ6fSYH0S7KsEzDfWAJAYIREJm7HqUPBRl5hZpHc5sjzom6LVJJ2eXB8GOuLaZOlW38ktZeQ6oRyKlXoQqxVeRveQu7c7qA0gfBbl9AszPtw5zSLXzv4OlbN1e3rt2mP4B5PYqKHB+YtWtRSFJrF9zuJ97ALH6+l7JeEcIbt2bWvSCORCxpYO3bUFeSprGYiAU8Ody/pDYElXMDIvS3h5gxKkMJaKOxCuEFsVBXVT3Fpj6F2zeGBMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48863de3-1ee6-bc90-0fe4-466f9608b435@suse.com>
Date: Wed, 30 Mar 2022 12:50:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] livepatch: account for patch offset when applying NOP
 patch
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <2df6d890-9d91-62cc-8057-3d50f1501ad5@suse.com>
 <YkQusCcbe++iMGnH@Air-de-Roger>
 <ab0e2c42-fb22-43ca-261b-4f8d1d9a542f@suse.com>
In-Reply-To: <ab0e2c42-fb22-43ca-261b-4f8d1d9a542f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::46) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a748549-eed1-4940-7c03-08da123b1c63
X-MS-TrafficTypeDiagnostic: AM6PR04MB3976:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB3976277998235FD9105AE359B31F9@AM6PR04MB3976.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZBTuxXS9+dk5feVO6uSTUo+pQ+GNPo1zc53gzSyyfevZzqZMK7iIbonpeyrjvm+wzBDcP/MNgl+UMgr/1YbJC7buVMYWcriO0JndiG7BPaMxzKVeSOPHtPZsJYS/EIVs88B6fyuiSqESF0a68k/CBl6ZRKq+0jSLQM3UYIudvNNHn9fQAv2TOIv8o8wBs2QMIUWaHOved2KwrXHMNQEy2MGaO+VtJNusF20HHrppTrppAgabx47ftfNCBgqjk5EpjY1KqWw/2oX8GCl7X8IiS/khp9klnL1G94BEvsnudljjX07y3tEkm4qb8+Xl6lWEnMoeZqlsBalnyTJVbsY3U+IqVYbxX7KRb663fMS+IGSMCLmjJWwjIvpZBwSWRV0zif1L2fgflSGtx1BxZmznehJLG9fqbXoaFZ9ILaZ4TZQKZQUXBueyKSIba2E+Uz7zL+gWwFtMBe+S8AVhFZ0bWoheJTFOXK6ngjkGKJKyX0Ak20vNBAbdbxZwfQyXN/y1aVFizMqME0/uXStTU6kqvBzKYIq/EDRQ4cKDoqHJuGt7OgH7iaVkvwDmesuKSpiYXHSBQOUmnHJtJ2m+9lSeFx5xRzYOuYvQDtnE0tlMY4CRGNYlh2vH6xhtbh9zdkxhRp7DkYEakzVXsDQc/dgl3fZkxoNPMbWbwcIY3WrhqL5TIZuX7kRy/+Mm5qISQk1mlQcCrhHGsOfvIYrJg85A05gDg06AViGFHx10Aqwlco4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66946007)(2616005)(186003)(66476007)(26005)(83380400001)(5660300002)(8676002)(38100700002)(53546011)(316002)(36756003)(6916009)(8936002)(86362001)(31696002)(6512007)(4326008)(2906002)(31686004)(6506007)(6486002)(15650500001)(508600001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jFciE7XdI/EwLADfx9h3OlX3CPvqoK+cTpJEBNtg5I4SkBZij5voqKFd2Ngf?=
 =?us-ascii?Q?st0QrXrlNqFSWVY5rXIVcLb9lgoTqFfWP0JaqQBRQTcTzmrALhIrcs/NpyFr?=
 =?us-ascii?Q?lK9tywIT9Bmos7L1sH4zzmZS1Uq0Z+2rZXNHw87aMOvt79bhIqwM23RwfUyK?=
 =?us-ascii?Q?Hs8EWDV4KZeJcohF0xcc/NQ8glCrJyaC9dtPP/EPgBtebZqxWt2ijP+xtsyv?=
 =?us-ascii?Q?Zz8ZMmIoZbx36tq3uneBZhtl50lrm87qaB4Uh/BIi0FfwjpjdK4kCR6w2Jgo?=
 =?us-ascii?Q?y7z6Eb3h7bcFsoOC80L7cLGYHH0fD3nyD1ic+DH5lzSbZZGCWB10WOxyAX4m?=
 =?us-ascii?Q?xy6Kzw0QNdUjeUJNz2uWF/sGIyj71xHkTi2irjQtgB9yejU1YXODwUrKHfDB?=
 =?us-ascii?Q?JscL894AvjlEPoTrT1sujhS9aXAlK0n5yELW7yDHM3gApCzRQEItkdb4dQ9P?=
 =?us-ascii?Q?S+T1DLiNX+94iTPgy6/LcFm4A/0ufIKY3Un38MjLPFF3c6qTMb1m2ZpglA2j?=
 =?us-ascii?Q?i3NXZhpslK5TEY/eY0UZNddQ53L3LtU35YPOqBqmRco18WkA3KtzC8NM/Luc?=
 =?us-ascii?Q?NVvHcw2nn+uFLRGbol84ZiR42RljJCgV3NDNoM0MsVvBE9Lm9SZ3YrY8oBt5?=
 =?us-ascii?Q?JeF6a6dPpJxvML5EIzNdxmEem66IcQYwIiqmkryThdKhxW35KWOSPRapC9sf?=
 =?us-ascii?Q?iKuXmhWHDU12doLyINwvNTirIf1DrxrBUl4q68xizftBFOEw4E7BWMOZrz9i?=
 =?us-ascii?Q?u0VEKK+XOTVa2PYYyNcOYG4hM84uxrxuFM2Qu3R9wxECDPmHbCKlDH5TiAjD?=
 =?us-ascii?Q?rcJ4VO7hQPj9BvS360XC9uajng0ciy7dybuyfeegFAdDlsYEzMyxcXQImzGY?=
 =?us-ascii?Q?zBiJ3duQIEW3FhhXOVYzevl9055nXuEyQTccPgScPanpqpGA+0XqXRjo6No4?=
 =?us-ascii?Q?kS6Zh0UZV+hDRKycpKPX8g/92kcXwEH7NLo4SrRdil2KvAOZPHXzNlpUv9kM?=
 =?us-ascii?Q?ouBsShQz+5gYd6Ctu1szZlyOV7pkbQULTfZ53KMReak8oMCeR8RJbbLxdhdG?=
 =?us-ascii?Q?l3zPIcqrh1ffNmZvDBvV8m9oO4db2m+yKk4I5s6BoSmvi92OeMrSMh5gomZx?=
 =?us-ascii?Q?7RxVV/YYjxHsURxsugex3GcwSojKaf6Y/PtktbmnVIHK+5hCgBJt56ia9N3W?=
 =?us-ascii?Q?3Wi49VQP2D/a4jsQYMv99/TRwnT9MI7a9iduYe+rhrBc9oX8QrVvmFG2rRZZ?=
 =?us-ascii?Q?PuVPpj066VL/3CK0Y9KNhWrKR7kRewQ6vMR92ciIle7PXnHGtKlOzBTRhMAt?=
 =?us-ascii?Q?ULXyn7Akr1wEkZWPG9CAl7lMI2O8wiIOfIJry9fa01KBJ7USFQRrj1hzeUvV?=
 =?us-ascii?Q?31ECgkX1XxEuFj9pd2uyNJ8uBJrvgW65BcTfU6PbI+AQB0xufV6DkRdz3gnA?=
 =?us-ascii?Q?FXlEW9L9AbmCE8sX/M2vujcu+ZCA9JGxF5+wVWZEHBmtx1UFz+9lv2NMbYNY?=
 =?us-ascii?Q?yBzuiW8PSTeonFoPkr3LdHJEpGMF8PANE4dcrQUr00xTom16WHq9ebeZQhwo?=
 =?us-ascii?Q?pRu26JAuSDDRZWFKUyWd+N+DqtrvkT1v7o1Y2AtQ2OuIGAfOsxJ/A978+6nm?=
 =?us-ascii?Q?hzKuyPtHRlwGhrvzbB60r4iTlv1++OcspPFGKb8Fk1bXWDAtQKSMbwiWcTD1?=
 =?us-ascii?Q?7ZAAPKdZPzofuFzvvuK3A1rgVxgWzqwSxVFL9GKCqRTPzNO1oZ1qxUBiAUnM?=
 =?us-ascii?Q?0xIZLm5kcQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a748549-eed1-4940-7c03-08da123b1c63
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 10:50:31.6248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esKPknFkwCc/FTTZjjoRNw32Z994vTnaTdEt3YR3ziI0WWnHh23IsnfI+DlT6f6tNPm29vjhd/XnvzpbTAKPJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB3976

On 30.03.2022 12:43, Jan Beulich wrote:
> On 30.03.2022 12:19, Roger Pau Monn=C3=A9 wrote:
>> On Wed, Mar 30, 2022 at 10:03:11AM +0200, Jan Beulich wrote:
>>> While not triggered by the trivial xen_nop in-tree patch on
>>> staging/master, that patch exposes a problem on the stable trees, where
>>> all functions have ENDBR inserted. When NOP-ing out a range, we need to
>>> account for this. Handle this right in livepatch_insn_len().
>>>
>>> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced=
 functions")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Only build tested, as I don't have a live patching environment availabl=
e.
>>>
>>> For Arm this assumes that the patch_offset field starts out as zero; I
>>> think we can make such an assumption, yet otoh on x86 explicit
>>> initialization was added by the cited commit.
>>>
>>> --- a/xen/include/xen/livepatch.h
>>> +++ b/xen/include/xen/livepatch.h
>>> @@ -90,7 +90,7 @@ static inline
>>>  unsigned int livepatch_insn_len(const struct livepatch_func *func)
>>>  {
>>>      if ( !func->new_addr )
>>> -        return func->new_size;
>>> +        return func->new_size - func->patch_offset;
>>> =20
>>>      return ARCH_PATCH_INSN_SIZE;
>>>  }
>>
>> Don't you also need to move the call to livepatch_insn_len() in
>> arch_livepatch_apply() after func->patch_offset has been adjusted to
>> account for ENDBR presence?
>=20
> Oh, yes, I definitely need to.

Actually - not quite. I need to call the function a 2nd time. And
this then also points out that is_endbr64() and is_endbr64_poison()
may overrun the range pointed to by old_ptr (which I'll take care
of at the same time).

Jan


