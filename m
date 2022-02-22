Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8F4BF3DB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 09:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276545.472728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMQjy-0006T8-NV; Tue, 22 Feb 2022 08:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276545.472728; Tue, 22 Feb 2022 08:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMQjy-0006R9-K3; Tue, 22 Feb 2022 08:41:46 +0000
Received: by outflank-mailman (input) for mailman id 276545;
 Tue, 22 Feb 2022 08:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMQjw-0006R3-LR
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 08:41:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 408c0029-93bb-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 09:41:39 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-9t1qKKhQMoOpJ8zaCSnxXw-1; Tue, 22 Feb 2022 09:41:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB9217.eurprd04.prod.outlook.com (2603:10a6:102:232::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.18; Tue, 22 Feb
 2022 08:41:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 08:41:38 +0000
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
X-Inumbo-ID: 408c0029-93bb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645519302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CgZuVubWEYEkDiOQemGZNR53gEvIZpNrmDGouexPZXY=;
	b=D3vdTBh2zADnmRnzeWIjff58qPOmsGlRk39NSdUpJqoOWPi/5uMT/NkaEA5i+sC0QcqgmG
	UR8mnZOa/HbHrB6MpOrlO2PGMwbsM+MjQ2eThXFYhXd4kaaI1lxph83lhRhQlJV1ZCLx+v
	XwKnQdnlxxdL19R9llazV6Hgtaj18BI=
X-MC-Unique: 9t1qKKhQMoOpJ8zaCSnxXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axgG9mgdXXK10gGSimzF0EDIfTwQEy2pAlJWIJWUxAp6D8s8BcSIhR8VhY/9MRmYZNF5FTc0xGiqtfykgHvf2mUcQ5/fbKzSh3KppVQGmAsQqfBAh52gOfAZUgmRGO4WNWTAbrDEKYm23gVEfrN0gS31ZYOvEvCYeyjk7hCeHnEsNapyujg4GuuOncUevCQi21nhLhkx/0GcyvK6tSACI0sk1zX6eeZ5QLmvtUy/Jah+2qLUek7GHlc1R+0v7N2OXw9rNQSqmdWnslAxR/piw1iDpfLo/EpG6btzQCIJpPrw5SB1Nb7jcsVthEGz53WlUoyaUuKHgsJV9ulJfA51AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyXx9UiAUGvels75721wCQ27S6D1TgkSnQqjevlwwMg=;
 b=QkHVAiNO9GRRZETe9Rrk5cE6bvg3+LaxHPh375pHMDXczvpsFIK/DzBX8qYxUkd0gjDLp9X1T4VuAadvRsQ7orgk6DLDylczHA2L0UzkOcgiX3bweWzs0no+LtPg2gPMmzhOF7fTutphQupy0oYht8i04P2FkoqbcQVveKbz0yrkpuT56axpABwg2GMM1bb/vWumVlAlY7k40jUdejcFzC7ALoeysXgcjD5bcFoOADuorZmeoP8h+07R6IMqshiEyWfOwGMKV8EpUjG3UINDhSkracgLspkkb4ILXzyWHh7n8eNDYX5bnsVwkyT6GEbzi6SPmUKaFnI4TZqNaRIK5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2fd2f479-575f-34db-ddd2-89df8eac81d7@suse.com>
Date: Tue, 22 Feb 2022 09:41:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-5-andrew.cooper3@citrix.com>
 <4d8ab414-caf4-5a12-4cb7-a88c633cfd66@suse.com>
 <e18c0c5a-d00b-adf9-d4b0-28e702a18241@srcf.net>
 <6566bf52-58da-f804-f5c2-fca64c1f150c@suse.com>
 <f0889e93-aec0-443e-b3fc-081892edaf2b@citrix.com>
 <44e0ab16-e807-c8f5-deef-7094b7aecdeb@suse.com>
 <f1a3e319-4810-49eb-7ae0-a044499e85a1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1a3e319-4810-49eb-7ae0-a044499e85a1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0099.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd76fe86-a5a2-4861-8d5f-08d9f5df2445
X-MS-TrafficTypeDiagnostic: PAXPR04MB9217:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB92177B5B3D50EB8E2E1C056FB33B9@PAXPR04MB9217.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B2yvx5Y0P+VyTSp/UHF3S6pIbL1OUE4qAEW2SOJxDvHN2FQjkii7DgJrBImmCibYeaytx9gDJg5dkFyFYJGySPGNyxKLT+KpvfrtPDrzJ3nq44C3JgK1unqRhgyJixLzsvc6doW7PqJFETrwtxs7LtuDbnPYD2ZMfthezg/uJBTyq7bc61bpStwg9DU23l056rTF2lfQtjOC1x2ZC1IHD2RDA1N/m0hnlf7l6phyNFpEyCekjYIKvmH/PmS4YVGXsgmhqohLwS+fdDdne2/OVtO67I+2+oV4oTmSdyx6ztT0fKrhP+GPIor44gj73vAA1RcwdHmirocRodOpOIQVBajlM2kTarac0oTFHY4CxyGpfWLq8PETTKZUDPeaqw1/rR62W31upR83sAwSvt/4qK4gsrV400tBFhMnwTPFzqQjuFEMMq6GMs2371bqcDiXTuOtLYkMyfW8ROn/KfuA7unhd7P+/17NKE3sMvbQ6AVJ7MXmhgXLfL2+d91cF3oXj8WegvQlcYi9BECuj5OKAXrDOuW/HdlmtPT5fq06Ra4srjLvH+JktpIA1IEzBACLRe7IeCNWZV1D8x4C58SYbzuPqFTABf+03R4C6G2mIXRSL59uyRi3ciIlaLODtgYZeVXWfMD0GkLuk3ekq/xsAyuN+1WGIF+PHdwb0wEsCQ5K+/ujrAEeN7KPRUVd3O1j8k7fBwnLz3Q3oIFiUEVjAaPyOREeICY6Ze05OWMW67Ux7t4t0TdEfqiAvfmxvDWW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(83380400001)(5660300002)(54906003)(6916009)(66476007)(316002)(66946007)(4326008)(66556008)(2906002)(6486002)(86362001)(36756003)(8676002)(186003)(26005)(2616005)(508600001)(6512007)(53546011)(31696002)(6506007)(66574015)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t4wuhFmnnx5YsUeotALLlZvRneYs/yZ2WtvfXwNWt3AY/naju5BBaCCvXs0E?=
 =?us-ascii?Q?bKdh0V3/5OLS19FpDAma8PMVw2MaaC0gQR95uC20RuUISEvPY/5uj+pJB1OG?=
 =?us-ascii?Q?puNQI2T2aW5hSoRIhsrFG4znkiMSaiSURwr3Rde81GwY8KTFegvrAqow0zF2?=
 =?us-ascii?Q?v5V+Mz69XRZjOk6BrnxIarVV9G59mXvKxgn3kOxJijUAoLY+P/bNXobNL/C8?=
 =?us-ascii?Q?oL0ZAUGW35skWinvyRxjo6l0dmgHbY0uP7EGxguOgUmvsQLroTN5mVdD0ppD?=
 =?us-ascii?Q?tLjYPIP2nSehgw/J87BCRKDAwfCYpytWEThXZmRApQhMuVM47hPFceE3KKTy?=
 =?us-ascii?Q?pXuKOiNw+fo7C1YqZRxqi0Zes90jXzmRDma386Gs2XOoyoDLZC+VoIKFoBz5?=
 =?us-ascii?Q?Plpz58bDYrC9Z9/kpV3IjoqrJ7QI2exbtUTK+JSyjGhK4zPKD3CC9xi9rnwu?=
 =?us-ascii?Q?N/inRC7+c9NvTr2XCnd91MRRak10jMsfM3CQdsuokLXMo8krqcQN1frgdttw?=
 =?us-ascii?Q?opgPuPdHmKrX+FmWrfgIIo2XL5dtbFq0PZzHbfdo5JsoP6hhHtJ+3CB4sPZ6?=
 =?us-ascii?Q?l9cd54iE1eDfzCewCGgHw7YTybs8ZdSZwBoFCPRcXlxRdYke2hmp6KLw2uhx?=
 =?us-ascii?Q?Rxt1To3+Md6Xs3LnobiMilktZX5Mx2OpMoCr5aSHoW+tkI0ChzVSeHg5dqdD?=
 =?us-ascii?Q?vb9BaBqYeNDlYFhy+oHZpajwStjWOJgH1G1zVX/isGstTklbL8TYVzkp7hwi?=
 =?us-ascii?Q?er8G/SuchlZWSyjaPGzQCGF79OuEI9q45nQF3u8vwcW1aV2VG5Eg2/ozJpHm?=
 =?us-ascii?Q?tYBysxJAs2TCd6D5EsXC5YUIJaloQ+ew5qeIg0YGsiYolg8LujIt/FQFPhji?=
 =?us-ascii?Q?A95R7G1THJyO/8LS7jPqLNI1KK0Z//bAMt5OsAnZ1I+uwQBwhhqFpdQQ7CB3?=
 =?us-ascii?Q?9FcQ4VeVZng3GiwmDjgGrnupLMqes03KTwcEgmftk0UGgJWRqRqyZ5yELi5G?=
 =?us-ascii?Q?ojt0Iicd4OAzXUjcG32uJEOPP++fp6M65SFc5n1DhRKS3FGN+s+B4MIj3Wy9?=
 =?us-ascii?Q?S/Lr/CzKaZKrwW3i6gDzE3Ol3ksRbNaN7sOSKMMeOKmyOP1kAu85A/MovH8I?=
 =?us-ascii?Q?dgxaeomURmwibe/MEwrLujvuUT9Grao+cmpT0bI0E8TbsOIv2OMg2vTeslA3?=
 =?us-ascii?Q?0eXysfijZ/AREQlRjLRCnXULM+0Hf27+9b++0WC+HqNmXPzH78urmjuwMhxc?=
 =?us-ascii?Q?hJq5hJCemAZpQP4bXoFafpzQdVv/J2tDN657MsNYtLhl2ti8V4jZBuYSpbF+?=
 =?us-ascii?Q?/8intHxmjGZ6wpqfdwWafZSQnHAYU8zv6k3H8ohvC4v3VTMe8IrmQhqZ+RaE?=
 =?us-ascii?Q?A+p3ZrVzNVub6kvmznTTMlxeKWIHkzWKq3hmu/Zv+szZRPtx7GHfBfUxWmBR?=
 =?us-ascii?Q?QJAq7HgPheBkJqp4/5/wStBW+6VbTlRMW+VgxfglpqbOSd0XqEHcOEgIFxBP?=
 =?us-ascii?Q?wvLWznqLSH6r5OqN2HKuz5E+MRrypZaRjIWfmguWhCXj2Ihfbk4rjDLruU5d?=
 =?us-ascii?Q?PjRBpUFEYhSX2OaOuJpUb/S0xlQoi0UIN9lmStcimRsERopX5ycHN+EnZoXK?=
 =?us-ascii?Q?1eVbRBlUK6yZ7TgyLI4SVGI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd76fe86-a5a2-4861-8d5f-08d9f5df2445
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 08:41:38.5779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQsu/glOZGEHUkPQtW/rs3mi583gRr99Yl7NQFcze+fJqhdNv6gJOzrJpjxwWun+74Ctn0oAiiK2BiMKzUyd+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9217

On 21.02.2022 20:21, Andrew Cooper wrote:
> On 17/02/2022 10:20, Jan Beulich wrote:
>> On 16.02.2022 23:17, Andrew Cooper wrote:
>>> On 14/02/2022 13:56, Jan Beulich wrote:
>>>> On 14.02.2022 14:50, Andrew Cooper wrote:
>>>>> On 14/02/2022 13:33, Jan Beulich wrote:
>>>>>> On 14.02.2022 13:50, Andrew Cooper wrote:
>>>>>>> From: Juergen Gross <jgross@suse.com>
>>>>>>>
>>>>>>> When running as pv-shim the hypercall is modified today in order to
>>>>>>> replace the functions for __HYPERVISOR_event_channel_op and
>>>>>>> __HYPERVISOR_grant_table_op hypercalls.
>>>>>>>
>>>>>>> Change this to call the related functions from the normal handlers
>>>>>>> instead when running as shim. The performance implications are not
>>>>>>> really relevant, as a normal production hypervisor will not be
>>>>>>> configured to support shim mode, so the related calls will be dropp=
ed
>>>>>>> due to optimization of the compiler.
>>>>>>>
>>>>>>> Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
>>>>>>> wrapper do_grant_table_op() needed, as in this case grant_table.c
>>>>>>> isn't being built.
>>>>>>>
>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> I don't think you sync-ed this with J=C3=BCrgen's v3. There were onl=
y minor
>>>>>> changes but having a stale version sent two months later isn't very
>>>>>> nice.
>>>>> I did resync.=C2=A0 What do you think is missing?
>>>> A few likely() / unlikely() as far as I could see.
>>> Oh those two.=C2=A0 I appear to have forgot to email.
>>>
>>> They're wrong - observe they're in an ifndef block, not an ifdef block.=
=C2=A0
>> I don't see how the (unrelated) #ifndef matters here: The #ifndef
>> is about grant table availability. The two likely() are about
>> running as shim. I'm of the firm opinion that a binary built
>> without PV_SHIM_EXCLUSIVE is far more likely to be used as a bare
>> metal hypervisor. And for a PV_SHIM_EXCLUSIVE hypervisor the
>> conditions are constant anyway, and hence the unlikely() has no
>> effect.
>>
>> And if your way should really be followed, why did you deem the two
>> unlikely() in do_event_channel_op() and do_grant_table_op() okay?
>=20
> Because those are at least not incorrect.=C2=A0 (I still think we have fa=
r
> too many annotations, and I doubt they're all helpful.)

I'm afraid I'm completely lost then as to the (consistent) model you
want to see used. When putting them side by side:

@@ -3543,6 +3547,11 @@ do_grant_table_op(
     long rc;
     unsigned int opaque_in =3D cmd & GNTTABOP_ARG_MASK, opaque_out =3D 0;
=20
+#ifdef CONFIG_PV_SHIM
+    if ( unlikely(pv_shim) )
+        return pv_shim_grant_table_op(cmd, uop, count);
+#endif
+
     if ( (int)count < 0 )
         return -EINVAL;

and

long do_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
                       unsigned int count)
{
    if ( likely(!pv_shim) )
        return -ENOSYS;

    return pv_shim_grant_table_op(cmd, uop, count);
}

it is (to me at least) quite obvious that the unlikely() and likely()
both express _exactly_ the same thing.

> The gnttab stubs in the !GNTTAB case exist strictly for compile tests
> (there's no such thing as a production build of Xen without grant
> tables) and PV_SHIM_EXCLUSIVE builds.

If certain options (or combinations thereof) are not supposed to be
used in practice, why would we allow them in the first place? Sadly
the commit introducing the GRANT_TABLE option supplies no justification
at all as to _why_ this control is/was wanted.

> Code layout only matters for cases where we're executing code, which is
> the PV Shim case, at which point the condition is constant and doesn't
> generate a branch.
>=20
> A compiler ought to raise a warning on finding that __builtin_expect()
> has a constant parameter, because it's a nop in one case, and
> demonstrably false in the other.

Such a warning would imo be as appropriate (or not) as one for e.g.
"if ( 1 )".

> As for the function in question, the compiled result is an unconditional
> tailcall to pv_shim_grant_table_op.

For the "#define pv_shim true" case, I suppose. And then yes, as expected
for this particular case.

Anyway - once again in the interest of not blocking progress of the full
series, and once again contrary to my intention to not ever again do so
in situations like this one:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
(with at least half a sentence said on the seemingly unrelated changes)

Jan


