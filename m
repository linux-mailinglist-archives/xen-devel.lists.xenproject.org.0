Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DAD4B5757
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 17:45:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272538.467427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJeTq-0005zF-JR; Mon, 14 Feb 2022 16:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272538.467427; Mon, 14 Feb 2022 16:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJeTq-0005vw-GL; Mon, 14 Feb 2022 16:45:38 +0000
Received: by outflank-mailman (input) for mailman id 272538;
 Mon, 14 Feb 2022 16:45:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJeTp-0005vh-6h
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 16:45:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 887d9cea-8db5-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 17:45:36 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-EmjGsry6PCexD-izzAX-ow-1; Mon, 14 Feb 2022 17:45:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3571.eurprd04.prod.outlook.com (2603:10a6:208:18::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 16:45:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 16:45:33 +0000
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
X-Inumbo-ID: 887d9cea-8db5-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644857135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6A1OdROMUr8kxckkn35la8FSnSTj74Db9nH6B3R9g0o=;
	b=LTUUb7K1GI+BhV7C3zzPfUrmtTq53F7Dp5+BK3jby4bOkPsb6m82dvhc0EAaLHJ99unY0y
	vREiM3Aet/BlzmzuCuzElzJbusyJFYN7VN7eerH7BIeE3Y01Pk00rCefj0Ld5RJoN3ZLKF
	7s4T8TGcMtL0hiepe8vnH0L1Zm1jg2s=
X-MC-Unique: EmjGsry6PCexD-izzAX-ow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDnye8mkd8dCGit6DGGxeLD/4j/RW3BgxVvusionCnWIOBA3lb2I48WlT/ERTDTbT2dpfHjR1YTShHZzpnQHtKjkFvIDeBWgLxRPVHEgUz9UGxflok8WEwqkualXQYOz7p6hWDJacO4gi1RIIx2zv606o2KhUKwbTeJwkvPlnyYwL1zbVE15nYA+ukJgPHM4CcjnxNEWe10iI03eYRBkxxxSeiI6nCBuY0wzY1Fb+cxGK1xBEHkHnaDKs3dmmxhvBtOicTaat+I2SryvSkZCYzKK1WRtBSWGqwInBXROniR8j6hkpZD8GDfvVifqVT/S3Qwfg5h/tm7OEzBB+yqrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBqG0o0ccUoGoRUSVbm/1h4dLPQ0BEQ75PV3ykVZmd4=;
 b=GtsZzgt9R+op3u1H08UDEnUQYlDEb+dGFnv2LLnAPPXM2tSvFYHP8HGV41+SW7mp/6JEAQljEwD3ffF0I1I9Eu9yCIgOAOA1/t0ebHYXqq9rTRoQrj0cuOsMZMePV7Ndl0/NwVxWA/IYVzxFMh3tDkIBx+WlMP/LvrMrns7dIkLWzzplhmo4mf4pNqeBgFqXhrBo2CJznUBVUlDlwXPBgqSHLBHcn6GDq80iEeKnOhS4G7Xua7G+LWIufQyIFZesIk+D9UlUH63JIvp0+m7qAtwIcdyDJNXqd52watCo8eElQhTVi5Wad1nEmhQ0yAiaLDyvZ5ZC1PylGbkIVB9OhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b391202c-7746-5549-6b49-1f38eb2721c4@suse.com>
Date: Mon, 14 Feb 2022 17:45:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/7] x86/hvm: Use __initdata_cf_clobber for hvm_funcs
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-6-andrew.cooper3@citrix.com>
 <785653bd-db3a-df22-f2a0-c20b3f3bf8c1@suse.com>
 <2e28c474-6778-431a-9e40-8cc0668224c5@citrix.com>
 <73208a54-0271-9abe-9042-500d3d5d51b4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <73208a54-0271-9abe-9042-500d3d5d51b4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0100.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 929856db-6107-4442-0069-08d9efd96b09
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3571:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB35714E344AA8AAF30532F97EB3339@AM0PR0402MB3571.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2F5sQ2UXe3OpOSgV31p5Oi7cYiKXOXncpdpS7F0rzzhncBupIZBN5gfrwB3pTdc67Mgjz1dz/SnHiKEMunj3OS5JWx0ReApk8DxFQZ/grUePmYRrmPGhFEHo+sSaWIi744oEYXKdx8UMyYRWKSwoIrzZwJtWz+gM800dcuXLOffqu5QPo/+v+dPcSI8hLVglbARpFPxpXCbUfdmJ0IK+xj/n63H0u1p+/ASuhuC4igzPOZxPaI1OQAKC8be69LH0ICuSW3ny+0+Kb0lMScNJBLIfgJEr3gPAlb1THQyKtrZRhTuRWawpVTQAvSP4tQxLKKdGz1J4o5s5mqkQtpWOJfWDnRD3nebDGyhepADxa0KUtJ+ZoOh+i1fWCt0fInYVfJIauge6K5A3sgk53S0DH5qjS1z7jRrda3r+1SFY9wgtDjwTl9QxXavNczFBGm1OJz0VL8Pd/T8bVYCpT26GOcqMOZEgQcxKPwECMpOIClSlnnpbO9hYz/iVJaCQuN9267noIUMFMnhv6yclyjaFcc3Os0fNuyRDIjJEsLvHKmDtLUUDDV4l7pmYVxjQHh5LHbN1dGmJSEn2KtM9D5vPqMUdicvslAxkErfyTNxpwCWiBYgmXzdEGQ8WvFJ823PxSBw8roi2J6LarBL5zFVxhDrFIO2ssdlVg6VDhQmOTTeVOpWBcZ+Gyl+hEpcZECIPNTPCEYbWn1TvwFK/S/RYvpAnHRcOAPzLDiV6h26M+xK7YWDiT+pXej/2AQcr1gOx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(8936002)(83380400001)(31686004)(86362001)(36756003)(5660300002)(31696002)(2616005)(66556008)(8676002)(66946007)(6486002)(26005)(186003)(6916009)(54906003)(316002)(4326008)(6512007)(2906002)(38100700002)(508600001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DYbOJZY2b0yVdrd+eM+r/rw19gQs1kRw3QMqA9Zjbbg03AjyitZbbl8azErN?=
 =?us-ascii?Q?DLxM/c8C3zxiHMsjzMcpRPD8Kiqvlcma1Yx5J33j7aAmKeEndqlf6hAQ8Cg/?=
 =?us-ascii?Q?EUYeUViZODHlTBXCvFbgmY5Vz6zFgqNZ9ibOCYf4HAZxEMPQpvWr1GIaB7AZ?=
 =?us-ascii?Q?NHgz/HjBH/wjroEMuO8nxA8JCHQ1jCPBdSaHl+xPs9m+sTHQk7gHla7k4Wp0?=
 =?us-ascii?Q?FCHn9WivTODZsbuI+5MqlkT3UiCWWryhq8L4bC3rSrbgzL1QOk7oWRg1+X5b?=
 =?us-ascii?Q?VMZwvKOD/a6Z0ICmJYpgnTfP+PPraJQb67xuD2C04Zhj2Q2Pk7S3l+IZkQ3n?=
 =?us-ascii?Q?wXG0y3JP1iCQjZwIlTE8WU4V/iLXnTlYNzI60FVEl0QtdBr1OS+eDonLbBeF?=
 =?us-ascii?Q?sZu/1bkgm3og5ijtac1CkDKXi0lvs/zIelgiu3VWXlHp3C1mXMnVdtqj3vQB?=
 =?us-ascii?Q?hQDbmmuWXem0nzokpLcAlxDu+HRwEgZ88xbs718WsJrbnhPx5IKZxJnX9IvB?=
 =?us-ascii?Q?Xlg9FSSdeXNBzDCpLZfIlj2QaxZVToQnX5FitZPfx1/E3AuGVACsl2lAz5tS?=
 =?us-ascii?Q?1e6C0Eu7oYkWUoc9Clxq3BWgCSfkP0kaVIfQ70r+vH48B17ZPF5aeLDAUbmI?=
 =?us-ascii?Q?DBETFcY94uvO1mXDza2w2yimrmw0SPXfj80UgrwxJPKzkykwh7tO4kOv2jp+?=
 =?us-ascii?Q?FM+R/UkjNXpYa68V83UOAFjO5zs/Fy5/7qUWYBcazU4llfxJdIn5+i4l2VvL?=
 =?us-ascii?Q?UNfE1mysN8TnRhEtI3Ch435IdFT9r6EFDBgibw1P56Ff7mA1TxOSS7ObD3+F?=
 =?us-ascii?Q?/qyfvEceNVltE2xtrK9YwUH/4XNZRdXVPASVgt6cyWMabE3SxlyMJoBq3ekq?=
 =?us-ascii?Q?qpAZ6kO0DwWGxe/6zNFzFpQ6sVQtqWDDU3ekD+1DY7GiRtTjELRlWN/cIzcj?=
 =?us-ascii?Q?NdibKFn0KCB/anFraECVBZSzUVa5+hucKsRwNWneQdTR+UKqFobJxBKV/9FW?=
 =?us-ascii?Q?UK6JvhdNX0tlIqvmogXgfdmUUW+WkhAWG7CYN/+7V8bNgl+nN+La+PncYIjF?=
 =?us-ascii?Q?8gU9y+40Vsw2sJzxjjFHGCKDmkir7wmTU/MQbkB1wy4AJ2GpdwSJgcDuoUt4?=
 =?us-ascii?Q?Gi/ggf8mTxLzqVrEvMd5rj652djqAMdWq7bDNq7Lw5UMyk0qfnAn7MDeIlws?=
 =?us-ascii?Q?dxvOEpqtW1Y0ySdjAWEkgTsHbmhGZgKzMnxSc2qZqVoGR38Q89pBwbphYx6T?=
 =?us-ascii?Q?pDTYf1NyQiSV+ZGyOx3jigmpweaXefa0NMxhqlsmN2aWgzOQtlSqb9LqD125?=
 =?us-ascii?Q?xtb+EwHLKlnG0++7ccSxnJ8reyovD145tKnEz7Pw/OdRlxMzOih0ccEgBQBi?=
 =?us-ascii?Q?J+1k7BaiLQ0E2xhM80ER1+ZGz6O1ZzrXv0IaQPEfzzITID1tm2Vydc563ZQX?=
 =?us-ascii?Q?VunrlrY4VUX8nhd76GKrJipFjl1ACmHNAV8lJ+7y5K0bqFhFAsFIVTnECI8t?=
 =?us-ascii?Q?6OQWB81dfDM63MlDsGv+zKZKLjtNSERCjJA1c3IAFDQmNvFytzWGgb+MOP6S?=
 =?us-ascii?Q?SPMYLI1hW8oH5zHnQlYuI5BnxdZ++Jzhs9PEFaEMAkcfFj8BVf3hbAuFKNkt?=
 =?us-ascii?Q?aJnKIojSeXKD94tcJ5UNRuw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929856db-6107-4442-0069-08d9efd96b09
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 16:45:33.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEik8C4zVO+yvaQRVm5C2/GcTjiSjyDka/PpGYw4URdM7bo4ccDWbhf72l/BZ4/BWE6cJn2QBcb0zPyIYgCuDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3571

On 14.02.2022 17:39, Andrew Cooper wrote:
> On 14/02/2022 13:35, Andrew Cooper wrote:
>> On 14/02/2022 13:10, Jan Beulich wrote:
>>> On 14.02.2022 13:56, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>> @@ -88,7 +88,7 @@ unsigned int opt_hvm_debug_level __read_mostly;
>>>>  integer_param("hvm_debug", opt_hvm_debug_level);
>>>>  #endif
>>>> =20
>>>> -struct hvm_function_table hvm_funcs __read_mostly;
>>>> +struct hvm_function_table __ro_after_init hvm_funcs;
>>> Strictly speaking this is an unrelated change. I'm fine with it living =
here,
>>> but half a sentence would be nice in the description.
>> I could split it out, but we could probably make 200 patches of
>> "sprinkle some __ro_after_init around, now that it exists".
>>
>>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>>> @@ -2513,7 +2513,7 @@ static void cf_check svm_set_reg(struct vcpu *v,=
 unsigned int reg, uint64_t val)
>>>>      }
>>>>  }
>>>> =20
>>>> -static struct hvm_function_table __initdata svm_function_table =3D {
>>>> +static struct hvm_function_table __initdata_cf_clobber svm_function_t=
able =3D {
>>>>      .name                 =3D "SVM",
>>>>      .cpu_up_prepare       =3D svm_cpu_up_prepare,
>>>>      .cpu_dead             =3D svm_cpu_dead,
>>>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>>>> index 41db538a9e3d..758df3321884 100644
>>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>>> @@ -2473,7 +2473,7 @@ static void cf_check vmx_set_reg(struct vcpu *v,=
 unsigned int reg, uint64_t val)
>>>>      vmx_vmcs_exit(v);
>>>>  }
>>>> =20
>>>> -static struct hvm_function_table __initdata vmx_function_table =3D {
>>>> +static struct hvm_function_table __initdata_cf_clobber vmx_function_t=
able =3D {
>>>>      .name                 =3D "VMX",
>>>>      .cpu_up_prepare       =3D vmx_cpu_up_prepare,
>>>>      .cpu_dead             =3D vmx_cpu_dead,
>>> While I'd like to re-raise my concern regarding the non-pointer fields
>>> in these structure instances (just consider a sequence of enough bool
>>> bitfields, which effectively can express any value, including ones
>>> which would appear like pointers into .text), since for now all is okay
>>> afaict:
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> I should probably put something in the commit message too.=C2=A0 It is a
>> theoretical risk, but not (IMO) a practical one.
>=20
> Updated commit message:
>=20
> x86/hvm: Use __initdata_cf_clobber for hvm_funcs
>=20
> Now that all calls through hvm_funcs are fully altcall'd, harden all the =
svm
> and vmx function pointer targets.=C2=A0 This drops 106 endbr64 instructio=
ns.
>=20
> Clobbering does come with a theoretical risk.=C2=A0 The non-pointer field=
s of
> {svm,vmx}_function_table can in theory happen to form a bit pattern
> matching a
> pointer into .text at a legal endbr64 instruction, but this is expected
> to be
> implausible for anything liable to pass code review.
>=20
> While at it, move hvm_funcs into __ro_after_init now that this exists.

SGTM, thanks.

Jan


