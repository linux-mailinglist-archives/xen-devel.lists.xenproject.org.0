Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C453455C0A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 13:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227385.393255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnh0X-0004w9-9U; Thu, 18 Nov 2021 12:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227385.393255; Thu, 18 Nov 2021 12:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnh0X-0004sv-5s; Thu, 18 Nov 2021 12:59:17 +0000
Received: by outflank-mailman (input) for mailman id 227385;
 Thu, 18 Nov 2021 12:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnh0V-0004J0-LI
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 12:59:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54f54e54-486f-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 13:59:14 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-4XYjlQXIOcyqg6JnbSSGJA-1; Thu, 18 Nov 2021 13:59:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 12:59:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 12:59:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:206:1::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 12:59:11 +0000
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
X-Inumbo-ID: 54f54e54-486f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637240354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l41bxwUVcb7yOacAFBOmXw9dFLExFt4wBEhMZrbrawc=;
	b=FAq6xP20ys8urPJ0mAAoAsPyEuz1kdUXHVmDO8BaTtZ4bs56WshFZYnieMP4rlqZE8ENrS
	zGmDtfaVGqcxLuahmXCgbj+LKBaJg0aKB21KILbrx+fpbRncrBXQQoI1gvHnsSR1aKg1Qh
	uYycEmbbccqyL5ygYkOslCIwIWETd5M=
X-MC-Unique: 4XYjlQXIOcyqg6JnbSSGJA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWl887JV+3RS0XafvagLZbcMeLs7DnSvOubJTLt8hRo3v1qFbPVgkmRjumZORImvFpPFdjmAoFxbf5ukHJGAJdN/rTQ836N6XHqwHN475pnno5OJ0HbNlb7oqi/QTpQnj6oiAp8cZvyR5jYohfEzh+ELUt78fuZ1I68oawV+Exu2A7DeOIBGlpZh2aE1YHI/LRxeg16bgickHlPeYK/SRZ3wafdF3cBjYgYqX4Wd+nQCK6tD8HcM4OGV25izQeq5LfsIDX8GudyQIdAh23awiod6rDvWg6vpdErdR6QVGoh9nkhCNNANfS6cVUovD7RHG7V6s7qDV+81h97GAcQQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x896/+HDLB8updnHKtmxVhOZ8ahF8apnlW70H+1+4uw=;
 b=IhVEGQNUpCM+16RAtPpcKnI58k3xZTZCA8iNgDcNb/7bJgkslQ6I/q84oficHzuEuOFVOprdAOrAZZ/W5aQMyTOEtjQwp5y5MGO1atK9WM2yoI2wLwa29CH15lWWlr8a3SObQPWDKfKAr0RsOhIO0hp2XtEobltYOj9vXwkv7GfMin6lXUdMlGDbj+Lx1yHw249UgJ7HV3Vm86BpDCtnXDzh7kS1Xro6W+uqAvjXN8dMonaswvhsBQ11/AYtTZDWkAiSRYL9FnKZOedQQ5j0D2nejbyjQmhK0l/o6nbybjdltrXrRyJaxrDdA//bFjlw/peiTlkycKFcXWu+7c3JeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c8991bf-2c8b-7309-b7e7-0bbb89db6fee@suse.com>
Date: Thu, 18 Nov 2021 13:59:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] xen/xsm: Address hypercall ABI problems
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-6-andrew.cooper3@citrix.com>
 <e8a9d0bf-c9d7-a1ab-f50d-7ebaffbb3f8a@suse.com>
 <ae979a87-41c0-51ec-db41-6bcc1eaa896f@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ae979a87-41c0-51ec-db41-6bcc1eaa896f@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:206:1::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a2dd935-4e15-4b68-4bd8-08d9aa93374f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4382680ADDDA996ED481707FB39B9@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DfriLBg12PgVogIXjwd3r/UyiXOR/qRRnToIwnmcCbTLggbpExmZXwtZErQ0sxqJf6ICTJR7IUjw1EzOaNC1DmseImtHC+5sRwmn5VJUTVnj9nUDcPLJDDSOBNLKFtIlWae/dS5KmoLUiNOwWoJWrxub0CIcct0yX4lXT3WFdKovtTaHgnLtuOGE7PLaaBmLuic2leBVoJCEK/RKH4cBARexMewi1nE9gS+dAiQFtTdFFt/baxn3KnmwXTzervEYfv516dWm0LXSXnNnRzytUOhuHHaBKmqONfA+nv5Y4oxSfAwTWChx5ZCPoSW42SZWTbiOe8P8EA3h/r0ybXlptLoJrMtb/+n+RGkiEZUciUoRp+mMdfJ8DsPJjdML+onSpjlL0v0K+BNmwwR4Dozt9YRxuAPuYPppcXOT6JuObF0xeQmUyr2kcTK8mqR3re+8eRX6kilruHql2OH1V1uMr6EsFVN+IX+I5UWv4+HEGHsrQC/r4mswlztLHcuAExvSfYWQmGgx1/WrLcNUAUyiFyzQ4ddle0zd2hPZKKxh3f4tlYIuxptv8Y19GxPsfwvUV0WDasuacFNRi6SK0F/QrQavTeLSZvFHcn4dwp4KmCgYKanZ93rK1R5KMwyDWa8DkDUqnqstsmW+WKClL+BZo+DNVEDkD7TRBe3z9A0kw6gSAVFFfaEd8KZySMccDE4cmi+/ERm5aJxn0DEpeSYdXELd5tMQKoVSeaO+XareIrQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(4326008)(26005)(2906002)(5660300002)(53546011)(66946007)(66556008)(16576012)(8936002)(6486002)(38100700002)(31686004)(86362001)(2616005)(110136005)(956004)(36756003)(31696002)(8676002)(186003)(316002)(54906003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oBGA+ph1ebI23c1x43Q3M+K9nIakDE481RqD5AufYo/AEdXtO2SLSA5Mfm8+?=
 =?us-ascii?Q?rr9jbWfXW7MW8VloNuTYZF4aHlcu3/Q+NdMgA+fGhjkz1nX+avur4WlFVFub?=
 =?us-ascii?Q?pr2SJg97qmbuTlS+ljY2XA1FDjMuyUoL6dihw/FdsPHDIo0V43TCDSs028Tz?=
 =?us-ascii?Q?NgBhq3/93nO76JfdGCgV8Z26MKgR0mIj2epKj9K9hQjMC0BHxctKplE1Oq4P?=
 =?us-ascii?Q?KRGQ3v1ZwPgtZoVX/9fjELt6KekTomhfTnLsUUGVwyEC8VN+8yxnweR59DDK?=
 =?us-ascii?Q?JKsTZJ1T5LFzZZ5wkbVQNl0Ap16ZJjjK9MWg2UT38Wax8vxHdzno+wIPYOdN?=
 =?us-ascii?Q?wPJmqiE40+f0hmTg7h7RMsv7euh6Z5ywg8M3G6eDhe1ra8GUah0/mW/ASv7E?=
 =?us-ascii?Q?B7DZW9npkOoHUFqvPgeIe9qzP3e5AoE4PDQ3Ik2r65kDOIkyQ0XNIGjPkQP0?=
 =?us-ascii?Q?s/IYjUFqxxGH6NOvKZEOUasDnjUJRRCbe5zJTIs8FhqLltq5KtloaWgUVQNe?=
 =?us-ascii?Q?lVNOgyk3e7/ID397JUtddFyU9eho35z01Dy0Ws0HWx0w1nKC778xEAT0PuKV?=
 =?us-ascii?Q?sJe0D88gTz1pTt9Qrt+0rnEf3PkBYTuQVpESxMPe5ZHG78bV39bEIuvVNIDN?=
 =?us-ascii?Q?+heWiQTXH57iPuAATsxyzfE3W2M5/lhinZHInjXPTHWyCYGwMmAPO7EjBvur?=
 =?us-ascii?Q?D6LPy7FNXbfj0z3Q7UKM2pF+soEm++ww97lFB5ZIlGEvMQg7Qz7HqE5d2aC6?=
 =?us-ascii?Q?Sj8nkEnhM43WxjTP1PFJ+hW1erYXGygmL5Fybxqs9dtEN6crzMDhygaiv6IZ?=
 =?us-ascii?Q?oqEIh005BmdEzaeaPTp/9e1IrNanzDKH7PrNiXxQ9h99gRgwNJib+mNF/PFU?=
 =?us-ascii?Q?/StQiBuCRDoZ0Kcn+OQSvDqIM5OM4SkEnhAmJ4g+0mso+FxKyEnG791LD1Q3?=
 =?us-ascii?Q?3Ld0X85gWrH6Hl1PpPKg6jpOPb7MZDl9jCC6+C6wTHRBglkXnz6m4GrlgVWE?=
 =?us-ascii?Q?zMZ+y1FPtJrgnUI3FSv4kG1/EBylR7Vu3T++tgvtZdO+nnYpmdPeLXDJM1Ng?=
 =?us-ascii?Q?FQQtHFhuoRs//oepdmcakoKDJPMP/Xfa1uNY/oYdLmvQaus2MRsFBo9e2DpB?=
 =?us-ascii?Q?Vyn10EW+UUfQVKPzCsxJfqAQgbX1X39FwH7EqsvkQoCeiMfnnprjEJEGj2i2?=
 =?us-ascii?Q?4myJSQx+M0tmVqdhLlng/C9OmZCOvmha9IjOKjrxhE8HChknVqhKJhf+HPJT?=
 =?us-ascii?Q?WDW9OK1q5U40apxnh2yvwe270k7skAdFHqtjHqrY5LbrvVAVpJmSDzjG7ws0?=
 =?us-ascii?Q?FYVVGvRb0+hWMzWaIw+MiehBKohVXvDWU40dabB+SHySSDnRZvMvSkhfXfke?=
 =?us-ascii?Q?LSZ7tsou1Fy4AETx+XmzZL6bHKl7GFCtnXP2tSo7/2nNYNsJEGL4XzGKsv+Y?=
 =?us-ascii?Q?JPfkHm9uXUW6GuXDduvSHg/XOBsaWh2YvK3vQg5Jh2DiskLts6i7YV8eeiCn?=
 =?us-ascii?Q?EfYIYgUfXzQYkHWNETQ/2tbJtN8qBQu+Akq9sE/vxzbQ4eHu0L9KZ9LzJ43L?=
 =?us-ascii?Q?pWR8AQb0nR6mr6TvvbnbT8AdeON0eMOgesP0XWUnkq0LuW87U2X2fE+06vRu?=
 =?us-ascii?Q?6PXgkdUoKsxKO9nDeo22DbM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2dd935-4e15-4b68-4bd8-08d9aa93374f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 12:59:11.6043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQUJ4MPp+PJl4nTUAYabyP9vfeRqewTyb46PA8DIKboyOzINUyP7FTTOUdA+9NrsEPW0+xuGYdBVmbHUJSnDVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

On 18.11.2021 00:14, Andrew Cooper wrote:
> On 08/11/2021 09:50, Jan Beulich wrote:
>> On 05.11.2021 14:55, Andrew Cooper wrote:
>>> Currently, __HYPERVISOR_xsm_op enters xsm_ops.do_{xsm,compat}_op() whic=
h means
>>> that if any other XSM module registers a handler, we'll break the hyper=
call
>>> ABI totally by having the behaviour depend on the selected XSM module.
>>>
>>> There are 2 options:
>>>   1) Rename __HYPERVISOR_xsm_op to __HYPERVISOR_flask_op.  If another X=
SM
>>>      module wants hypercalls, they'll have to introduce a new top-level
>>>      hypercall.
>>>   2) Make the current flask_op() be common, and require new hypercalls =
to fit
>>>      compatibly with xen_flask_op_t.  This can be done fairly easily by
>>>      subdividing the .cmd space.
>>>
>>> In this patch, we implement option 2.
>>>
>>> Move the stub {do,compat}_xsm_op() implementation into a new xsm_op.c s=
o we
>>> can more easily do multi-inclusion compat magic.  Also add a new privat=
e.h,
>>> because flask/hook.c's local declaration of {do,compat}_flask_op() wasn=
't
>>> remotely safe.
>>>
>>> The top level now dispatches into {do,compat}_flask_op() based on op.cm=
d, and
>>> handles the primary copy in/out.
>> I'm not convinced this is the only reasonable way of implementing 2).
>> I could also see number space to be separated in different ways, ...
>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
>>> CC: Daniel Smith <dpsmith@apertussolutions.com>
>>>
>>> Only lightly tested.  Slightly RFC.  There are several things which are=
n't
>>> great, but probably want addressing in due course.
>>>
>>>   1) The public headers probably want to lose the flask name (in a comp=
atible
>>>      way), now that the hypercall is common.  This probably wants to be
>>>      combined with no longer taking a void handle.
>> ... leaving per-module public headers and perhaps merely adding an
>> abstracting
>>
>> struct xen_xsm_op_t {
>>      uint32_t op;
>>      ... /* placeholder */
>> };
>>
>> or (making explicit one possible variant of number space splitting)
>>
>> union xen_xsm_op_t {
>>      uint32_t op;
>>      struct {
>>          uint16_t cmd;
>>          uint16_t mod;
>>      } u;
>>      ... /* placeholder */
>> };
>>
>> in, say, a new public/xsm.h.
>=20
> That doesn't work.=C2=A0 The ABI is fixed at sizeof(xen_flask_op_t) for a=
ll=20
> other modules, because a caller which doesn't know which module is in=20
> use must not have Xen over-read/write the object passed while it's=20
> trying to figure things out.

Well, imo figuring out which module is in use should be via a sysctl.
Then there would be no restrictions by one module's interface
definitions on other modules.

>> As a result I consider this change either going too far (because of
>> not knowing future needs) or not far enough (by e.g. leaving
>> do_xsm_op() to use xen_flask_op_t.
>=20
> Well - what it does is prevent someone from breaking the ABI with=20
> literally this patch
>=20
> diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
> index 3550dded7b4e..36b82fd3bd3e 100644
> --- a/xen/xsm/silo.c
> +++ b/xen/xsm/silo.c
> @@ -100,6 +100,11 @@ static int silo_argo_send(const struct domain *d1,=20
> const struct domain *d2)
>=20
>  =C2=A0#endif
>=20
> +static long silo_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
> +{
> +=C2=A0=C2=A0=C2=A0 /* ... */
> +}
> +
>  =C2=A0static const struct xsm_ops __initconstrel silo_xsm_ops =3D {
>  =C2=A0=C2=A0=C2=A0=C2=A0 .evtchn_unbound =3D silo_evtchn_unbound,
>  =C2=A0=C2=A0=C2=A0=C2=A0 .evtchn_interdomain =3D silo_evtchn_interdomain=
,
> @@ -110,6 +115,7 @@ static const struct xsm_ops __initconstrel=20
> silo_xsm_ops =3D {
>  =C2=A0=C2=A0=C2=A0=C2=A0 .argo_register_single_source =3D silo_argo_regi=
ster_single_source,
>  =C2=A0=C2=A0=C2=A0=C2=A0 .argo_send =3D silo_argo_send,
>  =C2=A0#endif
> +=C2=A0=C2=A0=C2=A0 .do_xsm_op =3D silo_do_xsm_op,
>  =C2=A0};
>=20
>  =C2=A0const struct xsm_ops *__init silo_init(void)

So I'm afraid I don't see any ABI breakage here. Provided of course
silo_do_xsm_op() avoids the FLASK_* number space and uses a struct
layout compatible with the head of struct xen_flask_op.

Jan


