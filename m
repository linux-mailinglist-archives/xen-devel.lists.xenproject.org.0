Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5E465F1F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 09:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236362.410007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msh7H-0002hT-Az; Thu, 02 Dec 2021 08:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236362.410007; Thu, 02 Dec 2021 08:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msh7H-0002ea-7a; Thu, 02 Dec 2021 08:06:55 +0000
Received: by outflank-mailman (input) for mailman id 236362;
 Thu, 02 Dec 2021 08:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msh7F-0002To-C0
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 08:06:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce99ba35-5346-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 09:06:52 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-6zYgef_fMLyGRft9B71tzA-1; Thu, 02 Dec 2021 09:06:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 08:06:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 08:06:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0045.eurprd05.prod.outlook.com (2603:10a6:20b:56::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 2 Dec 2021 08:06:48 +0000
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
X-Inumbo-ID: ce99ba35-5346-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638432412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5h/pZ+suWHtByPakmuZtoYKi4AvRHIyvzD7adZghw0=;
	b=K3lZQG7qbF0bmKgM1mEo5++wO8CrBs81plmts9ZYCTFbFY1Oc902Pq8LPjFtqAOJf6XXqq
	Agxm4TkysnA5ff76qn+xQL2aYMGKjSR6SB+b5gVv/yiarfUInjZWfbDDGJ6pomwrQC+oR4
	xKG92YUBBq4MMUcWTOC2yXdxVgqSRV8=
X-MC-Unique: 6zYgef_fMLyGRft9B71tzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fk7jWQiE/jktbYd/5t39+JfXWw4aE0Al7o3iOpvWXVKWFAfv2aqrTXTtjVjxD+ityQTSBu9QLhY6O9OYxaDSz95tzo0EnHv+BIZeaYd0REJNRuIp/JUEW13Wee0FYv0BDb3jZ4dE3blWgprEXwdjngpkIaf20FClWbtRBZjDZfWihtGhPqjE5u6oezb4Mis8w/MNij1SMjhAUqKnGXdQcuFeB0XvyP1UEQPSlb/dDTy7I3+fKPkyUzdTlkiXXFDRLFhDYqmEFivKKGOTdMHFfNpME67OIGVUj3feMo2IK5KrQ89hP8XX7jB65bDJzg3wxgA1St7LKYnKBE4+quRNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jg/nohhn9niZ11G4oPwBwbPMDTh20ap9Lt0wxAEh1x4=;
 b=GycWv2Me/1HFSniPd7H+oiMFGkaLYErjjSduvMJGS2vnN7C9nDw0g/t28y9epnIeA/1tVOv6gcWLcr3eoIs4HlbFhhi/aNqxz9oLDZD+5XcjvSZd+MbGaQegnFuWh6NfQqL+a+OpawOgSlFTv5Be/IS71Y+HL7oGCxBgGjdhthptC9YbOn2alDI2CnTZ8jn3xl0ksZJTOgLayBfwTMhB+F8nYcpFGRU3y+O4dTyFfYF0s5fQUSZcyQhzyB3+iZdaxFoSaXtRE9LciFJpsiJsXR6dpbnppjJBf8MVknYHZ8nXfyb963IM7XFFeg4wodwRxdsdpbX7S6AA70A/FRw7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c366dee-a3a0-040b-234c-0f877894ceb2@suse.com>
Date: Thu, 2 Dec 2021 09:06:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] x86/hvm: Rework nested hap functions to reduce
 parameters
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130181139.14398-1-andrew.cooper3@citrix.com>
 <20211130181139.14398-3-andrew.cooper3@citrix.com>
 <037802f4-d28b-62bc-e830-78149f1cc2ff@suse.com>
 <5a1c0ba9-7583-39c0-87ce-dcb62ea4c7b9@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5a1c0ba9-7583-39c0-87ce-dcb62ea4c7b9@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0045.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 473158ae-66b5-45e2-c7e3-08d9b56ab162
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7149C8005D6ED391D66169AEB3699@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kc2esXn/0fUyvmBBrzDME5yIMgwBe657N4FQzKC8iAI8vgv/bPpGqr79RLp3dzGFfkeJZCqxT8wPnUOsAwcOI9GuAfJvAws7g02EIjaJVgbXhl1W9nsSlEwizjZeUGfIXgjfw6H2hhkjQMTE+NLv3qxF8imRs6EIQHYnnb90si/R/J6+KVfQquuIyxRN3LMn4XC3H6KiI3HKtq1Gb/xTngr2Qp0fLbgr/LkNW+HeT39JMnYzxq24kQ/zK3SfE4M6+KqvdXf8NAQpQBW1uuf9+3jDHI717ALC1jEPAof0aMfmlYnL+W+AF6gd3myFKeaE0bsaiOeeuOA98XpSUY6Ujflz6ykiiWcFLZcF1xWRO+8qt0FAOFs9iQW+FkuF7cYrD8NTjLz3eQupHFqP2eIT6Z1Sxtx/VSZdtk6xatl/yuXkHMUe7IGgKD0sUY0d09Q59BdIwddhmcEkWp5SYad7GvKXq3JEiySNIKThSTC2pFJv0lJviSdXI+b7jK7fBkbAKUC5tylgUGf66HdNbh+Y5/bqWvHbLpCSDBUbi87b/vyl8zesoHSan6S73xmSqM6PCczmzVQ+QJLohbk83sNpEKnH9Mzv/QYjMYLOb6WcPWL69Fe9teGAOKdSa3xIGFG3F+dfm57TBfMlyHGJNVrMuAsi2YxbxObTC/n8/EGvsBYw3lZgK479l3Dz/SDMiMbkEkJL+5sFDSndEj2UsSX3N8LDarxMz3G56OXahO0c58OEDvtczrzm02JH4mV7U3xd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(6486002)(2616005)(66556008)(956004)(186003)(86362001)(66476007)(110136005)(83380400001)(26005)(38100700002)(2906002)(8936002)(36756003)(16576012)(8676002)(508600001)(54906003)(316002)(31696002)(5660300002)(4326008)(31686004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7gqNivTwqgZS2zgxlaurfx39EeTkaDgl3IbN2VmUN1tR/pBazyNZ+Mz6pEr+?=
 =?us-ascii?Q?HhOjsbQpJrt6hrpLkY7y1cgtMn/OAmtFoZhE1b0uI5iLjZvXrfFiQ/4GGeRy?=
 =?us-ascii?Q?LvGHdAlyfURULvzRNCwTVuZHP6EOl0skouCPDsdzV2Fp3zZBKt7O4NUGoued?=
 =?us-ascii?Q?JtOVT/o5oFiUjNHNRcN+tA3IldJ/GC7chrb6b+SOvfzYixEwZqjZrN9EbpQ8?=
 =?us-ascii?Q?3ezFrRtCvqJGFtoJB8VJUnFRjmwAiEmv2hZGXqq15iIYBpAoaQkkLOpstGd8?=
 =?us-ascii?Q?ycYxLcsDFhInGY23OZIy7NlPRG/Ci8OetRd7DNrG5wcst+LgQkRfYDfTwC2m?=
 =?us-ascii?Q?N0hNYwuQflYgLLXb5b2lCuSpI2XODVbqBFmi4KRSNTzv+yiFg2b7reqdo3aa?=
 =?us-ascii?Q?Jh1gj/ae01ObIVc+qLiBcmFUAkwPo+VWtoqNtUeHEHUxP34IjDey4/ojcKl1?=
 =?us-ascii?Q?ZLEzMQB4f6p5lSO1VxoTiN8Q72aSiLk2Lc9Z2DPjYiQcihlINneyF+9SFGTa?=
 =?us-ascii?Q?UtOyvWVkh1MNKVoR2h70mtFCVjMfNkgZpUgv9wF5LXH0NUrGUb32CijGp9VD?=
 =?us-ascii?Q?VJVAoA9oDJOCq0tzHdux+1GvYnlNn/qlUchUZ7rKPA51wCwEZ3IOkiATPEcg?=
 =?us-ascii?Q?b0jzWPGSZOR2MKLySbYhsfs62+Z8eeAI+jrBXEx19cOoV83AM9c2tT2V2LGB?=
 =?us-ascii?Q?joP3VNASPEpJh5VKHsWs9Q8YwN4psG0GtAetkF6yc0qKH0snia2wKBD6zPcW?=
 =?us-ascii?Q?8hnKutxecJWaRJ1iw3T4QRbVseWJdvYYylQeCTeEXMy89aZxBk1Nyjt4VdzG?=
 =?us-ascii?Q?D0xTXCBMVKGy/0ghLWsrTXkbRMeH1MKIV3YZlpkN6ZdTkYDtAbHQIXi4gFjn?=
 =?us-ascii?Q?Id1ANzIxGNhZAAQmBBOYTwR669C7l1cSEyJLvKtwm1d5nscJx3tuhvp7O11Z?=
 =?us-ascii?Q?QdhOvfZXeN7P5F83qaaCTRQmFvC39xa5YxrpuK/EK0c0NhOzCtXWgA3s8xze?=
 =?us-ascii?Q?yAEL8Z/rZKKF9Y1wuOeqFFQTuDROijwhT/M2MOhi65tIrgXFejLEZbke6CWV?=
 =?us-ascii?Q?6M5nCXKKhJbhHWSiSBTd4UIPHGxOf6KOqqe5M/anM5mqLqL4e45trEPCc/ZG?=
 =?us-ascii?Q?Wb+wrZGpsuC3PKWlYUhmtKdKEQHMd/ewWAFanNeCbrRLlE+olDuTl9xv+/X3?=
 =?us-ascii?Q?vMClMFj9BoTeIq+IVUC7iE2HkhZiHRRF0CaTs6iKppwZNnfkiPaKX14aZGQn?=
 =?us-ascii?Q?58V5ENosTRHUAHmx3Ci/GnYi+vn3YOrvoqplEVyNR2IlP1fnixSxQ1y6R3ex?=
 =?us-ascii?Q?8IY5pK5mwBx8WxjFzmH+30k/2S3bS1j9C6ClX6pITS94pK3pp4Ruw9n7VUGq?=
 =?us-ascii?Q?++/S0iI4NOfbMBQhjcjFMhqnZv5mp67Gg1CaJIlhS/FmDYKuCmgfwlGOiSLJ?=
 =?us-ascii?Q?9UNzyNL73jqzrr1B/enuIZy8bybWu/NqX6aVmTZULCgL82euzmeF6uu90C7F?=
 =?us-ascii?Q?DCHt4oSR6+q6H1DthMJ35ZtTsnaOSH96r+CMksiHfzNJuaz3VBk+RnDt11oz?=
 =?us-ascii?Q?83nwe6J2PBWVSZKpY3xFyj+PmnmL58iOCFx0fs8tp2s6OYYz040T/RT8mOSn?=
 =?us-ascii?Q?OVF4UvfDQWYGWF4K4nBOqys=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473158ae-66b5-45e2-c7e3-08d9b56ab162
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 08:06:49.8116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIdTtAGrTCCywekcfoEl7nrow1DmWBQTN0kqdedTJWf4KSLNtJCfoxTExqAfFVc85F5NF3Lz6TDVed5PNrOlHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 01.12.2021 21:13, Andrew Cooper wrote:
> On 01/12/2021 09:14, Jan Beulich wrote:
>> On 30.11.2021 19:11, Andrew Cooper wrote:
>>> Most functions in this call chain have 8 parameters, meaning that the f=
inal
>>> two booleans are spilled to the stack for for calls.
>>>
>>> First, delete nestedhap_walk_L1_p2m and introduce nhvm_hap_walk_L1_p2m(=
) as a
>>> thin wrapper around hvm_funcs just like all the other nhvm_*() hooks.  =
This
>>> involves including xen/mm.h as the forward declaration of struct npfec =
is no
>>> longer enough.
>>>
>>> Next, replace the triple of booleans with struct npfec, which contains =
the
>>> same information in the bottom 3 bits.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Tamas K Lengyel <tamas@tklengyel.com>
>>> CC: Alexandru Isaila <aisaila@bitdefender.com>
>>> CC: Petre Pircalabu <ppircalabu@bitdefender.com>
>>>
>>> I don't much like this, but I think it's the least bad option in the sh=
ort
>>> term.  npfec is horribly mis-named/mis-used (at best, it should be cons=
idered
>>> npf_info, and probably inherits from the same API/ABI mistakes our regu=
lar
>>> pagewalk functions have) and is going to have to be untangled to make n=
ested
>>> virt a maintainable option.
>> So why use struct npfec here then in the first place? It could as well
>> be "unsigned int" with constants defined for X, R, and W, couldn't it?
>=20
> I started prototyping that first, but substantially ups the work
> required to support XU/XS down the line, and that's far more likely to
> happen before getting around to cleaning up the API/ABI.

Well, okay then.

>>> --- a/xen/include/asm-x86/hvm/hvm.h
>>> +++ b/xen/include/asm-x86/hvm/hvm.h
>>> @@ -25,6 +25,7 @@
>>>  #include <asm/current.h>
>>>  #include <asm/x86_emulate.h>
>>>  #include <asm/hvm/asid.h>
>>> +#include <xen/mm.h>
>> Nit: Typically we have xen/ includes ahead of asm/ ones.
>=20
> Fixed.
>=20
>>
>>> @@ -631,6 +630,14 @@ static inline enum hvm_intblk nhvm_interrupt_block=
ed(struct vcpu *v)
>>>      return hvm_funcs.nhvm_intr_blocked(v);
>>>  }
>>> =20
>>> +static inline int nhvm_hap_walk_L1_p2m(
>>> +    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *pag=
e_order,
>>> +    uint8_t *p2m_acc, struct npfec npfec)
>>> +{
>>> +    return hvm_funcs.nhvm_hap_walk_L1_p2m(
>>> +        v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
>>> +}
>> Is there a specific reason you don't switch to altcall right in
>> this patch, making a follow-on change unnecessary?
>=20
> I was still hoping to keep the altcall stuff in one patch.=C2=A0 I'm happ=
y to
> do the rebase.

I'm not worried about the (trivial) rebase. Yet both patches will be needed
anyway once we consider possible backporting of all of this work.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


