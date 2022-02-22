Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76864BF4C9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 10:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276596.472806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRYr-0006dU-D4; Tue, 22 Feb 2022 09:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276596.472806; Tue, 22 Feb 2022 09:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRYr-0006bN-8d; Tue, 22 Feb 2022 09:34:21 +0000
Received: by outflank-mailman (input) for mailman id 276596;
 Tue, 22 Feb 2022 09:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMRYq-0006bF-Hx
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 09:34:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bf23f01-93c2-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 10:34:19 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-5e8l2YBZOdO14T_G2GVWWw-1; Tue, 22 Feb 2022 10:34:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB7041.eurprd04.prod.outlook.com (2603:10a6:208:19a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 09:34:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 09:34:16 +0000
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
X-Inumbo-ID: 9bf23f01-93c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645522459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+Ton5Tc/dvlp2Of3R/Rsv2L2KyH2q3eE7zr3IJxprY=;
	b=HX+Y6EJSPX5eImV2o4nHAUGOVQr+H/MbzjOYKxMyfwOGXGm0Xa+3s7xM6vMuRjhOjKm6/j
	3ehADnXgr3/H6MlGrzJUH93/y+L2MdDXRIpw2FNqEBATNaTtt84yAty+v8j64H2Ti2S/7m
	DqmDUuqb5UcgY60bthEk4Bj7zAb1D0M=
X-MC-Unique: 5e8l2YBZOdO14T_G2GVWWw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYxP5x4yYuQA3SMXpwRBVTSwh+T0+6xU0RddGZbrnMULXS12/PNx0LlPBbZxP//zdqGeBxG/+yn+z3nevEueqWFcqVD4gp2yWdl32caHfBFYd0v0Qwcn37nldmtaSotLpPFF7Yrk3DNH4DfGAox9dmuB7zG1pKXdKInvQC1XLAa7DanVIPBOwdLEMT6Tc52l+gQtdotfz8IS/davbaZs+NXf2Y6hxcPimvQouSYS8sY228Ah6bcvH5L6jxk9t2hDV6Nyk38Pb4fDFfXNquIJdnJMRN5HQyt29P8ghGsEpyVzwOOdxXlcBY8Bo+jG0O5K/mesaYZ/jTWyT6xJk15EOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQZFQ0RKooqx+lq1ZG82aYvUdpOr/u/zmOir6qvsIBA=;
 b=BRPXJVwPb+onu52ndEbtNd+RK6PxDS/j/l3kw44hwpe8mgWhEzR7KnVVR6dvoSVZHDrIdInKJK5z4U4rjRru0ZJWHbWoWmkA7EarGCi2ow6YrtihdYgxIrysGzC6C5ASsCTfqmwuLLyne2XDO0ysEvxBPIfY+FFL+wp/u+ibuTfEj24B2hkH64rYH/lNklXyatI9aQefh5f2OoSzxEN/fWAV8VTv5WeulsAY/q0KQtNm7lQx45MGdGjfCI1hA348td7saKUq+W6B/KglVi4m8EZKU4PNUMM5ffLtBadUmAJmJ6NVmfpOK/xciiqXNolG2XQo88BVut+ONLHZTeTO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cce92dbc-8b45-2bce-6a04-3cabf1a19547@suse.com>
Date: Tue, 22 Feb 2022 10:34:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4] x86/mwait-idle: re-order state entry/exit code a
 little
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
 <2db7bc79-4fe4-abf6-9e5a-83055af9a78a@suse.com>
 <YhSn/Nsx6eElXpSU@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YhSn/Nsx6eElXpSU@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0021.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe6bf521-58b4-4f38-8d3a-08d9f5e67e99
X-MS-TrafficTypeDiagnostic: AM0PR04MB7041:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB7041321892BC675FAE8CDE1DB33B9@AM0PR04MB7041.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lzD2CyOxp1XFNhWmfOBDOtSHprEO0Thc7w9pnnqykS71JHpiXG0ZOCBaCheNGVZYDpkGfo3d0PYcRdLh5tojv0littVsUr9D/M6pNarjRQFOxk9Oj7+Dh7jNEaD1N6WjyxMyfqeT8NqNiWqR0nDXytuH54znUU2y1tS4VYwxzkNa8V0YFKudgSyJB5HieeB+nCiWZfASVWHZaPC54pRxM+agTKo0ALlvysQ4eX2TQ8+8cTJD4c6Ukji91VU8oE6JCfZR8tw8N3DsQifxCvWn9bH9eAbtherDuuK0douoQ1qrQZD5sExrJ/ScZO0aYj7pb/7DvTCETfSb5iroef0S2flmD+2p+H+vlP+0B9ho6ApVp4kEKK7O/urSuyD+HEjdLBIC4QDTLgoQUQ+ZWYB2rXZx3MIhpATtRxTfTIjzRu7DnZJLxo6KPTGriBEXwZzJHamNENJsc7z+hWNWlUtegmvhaKgOdKYOaOwoBZKyIC9JLZyIDriX4wGjIiRIUivWK7OfXQgZUgtDZyw7bmnatE0G+2+FWCcoDAq/MbroHvNwS6MxUl4P6S+WQkC/BeBUdghshYNU0S2FBMXPF/eMSaosyHZxY4w291AiUiHbasA9S58DXnP6ahcWQ/v66AKq7IQlmJ1XG51SlC4q1X240cZAbtgITZrk2xyivwhUGavFhcGPcrlzzNSalEheXIKte7EZxdJV7xSOlTJztUr6HfNH36ZF08joCNRa4XX9XcYWEPjxAmttvPhV8l5vYlxCF8uYQPr565rJ75/Paj7bPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(31686004)(8936002)(83380400001)(66556008)(66476007)(6486002)(66946007)(5660300002)(36756003)(4326008)(2906002)(8676002)(6916009)(54906003)(6512007)(508600001)(2616005)(53546011)(186003)(6506007)(26005)(86362001)(38100700002)(31696002)(169823001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vuOyPuMcW6PeahlAzYm2nDONSUEeqhN/8bU3ztwHAUZtYiyUYZ6j8/S8XnSd?=
 =?us-ascii?Q?o1DrBfDx4fgzKdMBU2M0+kOsLUJs8gY8lXHSHxlCncuZYP2FIHSwMeVn7oRB?=
 =?us-ascii?Q?HSk6M47GxBimE7ox1K2yeENDhs854jrGxe+23YM0qpo56KxFRif5Q/89b/bI?=
 =?us-ascii?Q?VAKFGpLcKGeQlV6vkJXRwQ0o+PdblcU36xPLJymXEp7xg1iv76+Ji9vRHfUV?=
 =?us-ascii?Q?NQB4sQr4s9yM7Za/ImQntM2XhKesGAcOCrOZz804LP4fls4RcdVnbQFGHvY3?=
 =?us-ascii?Q?++MJlN5VEoa9w3RrAH3x5ing7obN+jrizHRXeskX8AVVB8Edgbeu+i0rZ8gi?=
 =?us-ascii?Q?Me+DC3vO2XcMBFGwoKLD8ou2lS1Z0Wywgp5jL3vIFrhJY7iHfizwFfHwT6oU?=
 =?us-ascii?Q?n3LAcj+i5FrOdoJ3rk06HUbQCacUPKc1SuenIIveKYqqu6zkJl4c5Mp0TyJu?=
 =?us-ascii?Q?wAEe6uW+pPTGLjb+414x2AhQjUrXVDuTY47nJN97rq7r8YQh49P/fpZn8B48?=
 =?us-ascii?Q?xNDihcf1ROB494UM2z20a4xZJAhEYMYc9QBMGehzrkNC7bte9UoX8Zo8EYfY?=
 =?us-ascii?Q?EPl8luE8H66kl8eTmCVN5b88fhHWteK5eY+jytSFlfBJJ3a4wC7kymAatmnV?=
 =?us-ascii?Q?7du720TWppQUwmIL4c1lazZjInMk4tgbFyrPgPbTuhXdbpsH4J1wCSO3yO5C?=
 =?us-ascii?Q?I77N314Ru5aO83vlyCKedbhMWX0vL+SIsrsn/E1IzackTsXiVnt6rRdZvn/l?=
 =?us-ascii?Q?RVz+a+fopiMkwKyMVujpEIdA+Mp8GJQ63HjEm/yYIYKALEOLKyVt8fxPtMXo?=
 =?us-ascii?Q?IWOM6JIUN+l5pQ/rEmBwlRxWek14T+xQGLa8ymKNSKdHp/YiIWlFL7dkTz7V?=
 =?us-ascii?Q?KCzfxVKpzRLDZkmQG7cy3k7m8RBGZwm+i13AIaO8O69fya7Qmcf5pNYxvs5l?=
 =?us-ascii?Q?KeVvs0igPFXs0mKvu7IMnX8vljAZ0KRjvPb7sVapLLkWYAcxr9KdOja5bghM?=
 =?us-ascii?Q?bymW0KNR119n/C01NmfcdjwSTjeFh51h6oBQc+1LktUyLqeESqbpaJF2Yf6z?=
 =?us-ascii?Q?+pcqcnkg0RUa2TOsauGPaWLdMxor2x+qigH0cVoeiRX0ZzS/T93e6PPsNJAC?=
 =?us-ascii?Q?ZmE4EFRRYCO6x6pvBj0VHIgrrMXi1cu/LCTWIhg0zdzbJSbuSFjnzPgKNEaX?=
 =?us-ascii?Q?Gt1UIdlHKYzvpjlRDeIQ8cpIdpg+KjO7/kiMdscZGpWXnbBYSI/nLgU+pJjO?=
 =?us-ascii?Q?Xr+u2ASP0OuFcWOlAVr7Erd8TyScUiAiP5V0Rdm3fbbUn88C6bLXP9XOgdCx?=
 =?us-ascii?Q?APs/y7qg23ZUiPpVkpDrhGvgrKcp/Vk73hGJS2WQoN0VTdKOj8QO5IBa4uEz?=
 =?us-ascii?Q?xFUR48r27N+JQ0mBJL5wbs82aIX+uiLxtrhg1/VBFRUlNKlrS9GtFnTUPQDt?=
 =?us-ascii?Q?IRFbF1RkumvKlw0Hg7qCjdKjVWjG/eizMOLcSmCc/Y0qHXwAuUn9cR2FuM8o?=
 =?us-ascii?Q?CgDSi0lLLBlHZ1HQ+DuOVBBRq5AjsjKwxwlwOdT8rhrCBSQivf6Cf6LFJBrw?=
 =?us-ascii?Q?NdIymv0MmAaJK4I4Sz3poiw5D9XjWi2mAaYUQGvIgGZ6HnUGVMHK+fry7GA/?=
 =?us-ascii?Q?h3/v8BsoDzSOL7ulj0diE18=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6bf521-58b4-4f38-8d3a-08d9f5e67e99
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 09:34:16.6005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSZKe5TgI+rjQAMjoMNZqFgo+XwjI68jg5gHp02k1UTo+9CQK4ClxPiFjUs2cCr57PL9u/V/gGHns6FLsWAy/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7041

On 22.02.2022 10:08, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 18, 2022 at 09:35:10AM +0100, Jan Beulich wrote:
>> The initial observation is that unlike the original ACPI idle driver we
>> have a 2nd cpu_is_haltable() in here. By making the actual state entry
>> conditional, the emitted trace records as well as the subsequent stats
>> update are at least misleading in case the state wasn't actually entered=
.
>> Hence they would want moving inside the conditional. At which point the
>> cpuidle_get_tick() invocations could (and hence should) move as well.
>> cstate_restore_tsc() also isn't needed if we didn't actually enter the
>> state.
>>
>> This leaves only the errata_c6_workaround() and lapic_timer_off()
>> invocations outside the conditional. As a result it looks easier to
>> drop the conditional (and come back in sync with the other driver again)
>> than to move almost everything into the conditional.
>>
>> While there also move the TRACE_6D() out of the IRQ-disabled region.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/cpu/mwait-idle.c
>> +++ b/xen/arch/x86/cpu/mwait-idle.c
>> @@ -847,26 +847,25 @@ static void mwait_idle(void)
>> =20
>>  	update_last_cx_stat(power, cx, before);
>> =20
>> -	if (cpu_is_haltable(cpu)) {
>> -		if (cx->irq_enable_early)
>> -			local_irq_enable();
>> +	if (cx->irq_enable_early)
>> +		local_irq_enable();
>=20
> Now that I look at this again, we need to be careful with the enabling
> interrupts and the interaction with errata_c6_workaround.  Enabling
> interrupts here could change the result of the check for pending EOIs,
> and thus enter mwait with a condition that could trigger the erratas.
> Hopefully CPUIDLE_FLAG_IRQ_ENABLE is only set for C1.
>=20
> It might be prudent to only allow setting CPUIDLE_FLAG_IRQ_ENABLE for
> states <=3D 2.

Well, the justification for enabling was the low exit time. I don't
expect states > 2 to satisfy this criteria, so I think we're okay
without further precautions added right away.

Jan


