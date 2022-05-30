Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E539D5383CD
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 17:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338607.563400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvgsu-0005Ba-Vq; Mon, 30 May 2022 15:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338607.563400; Mon, 30 May 2022 15:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvgsu-00059o-Rj; Mon, 30 May 2022 15:00:44 +0000
Received: by outflank-mailman (input) for mailman id 338607;
 Mon, 30 May 2022 15:00:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvgss-00059i-Rb
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 15:00:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44c6193c-e029-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 17:00:41 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-0rfaCbR2MTGTPkQr9F_vLQ-1; Mon, 30 May 2022 17:00:37 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7887.eurprd04.prod.outlook.com (2603:10a6:102:c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 15:00:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 15:00:36 +0000
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
X-Inumbo-ID: 44c6193c-e029-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653922839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eMOcavInhpZ/aGuDRQaMmU0mk+yxn+z1BP4TPQ6TJo=;
	b=VmYhykWvINVgqxFB9QH8nUxquBFXZVC5NcXhsQooRjckkHN83Ffotih6vADm1EmkYIi4H5
	91AKhCmFXEqoRXCtMzLfM0bZSUQ/BNVPOZnzVAPP+3pX8UtLPkednudjhNO49W/QR9NdnZ
	EQll48im+IsskEhRLS58Pp29tAdmQhY=
X-MC-Unique: 0rfaCbR2MTGTPkQr9F_vLQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcpCnT1E0/yQqr2ozRJ4kbzszNjb75JUZCia/c70rFHO5DBJgzbQUbjwkWt6eUBd3+ggDZQKlcgugfz0sDxZtCn0h42ypB4HX6GyZgIK/hiNXEKPRTqq0wyjqttpfFijScS2yHmoZTOuE0X5JJNm89E0CfHwcFD0eCCyvGiMh2HDchhw8L3OKS+IkQUJ4uC6APBI2S2XywF2WtbKDw3W/x+R+APWt8H3l3Iy54HTeUkuq2gfYKlMsGQqUUlaat07qcdnT5ZesBKU3rTKRjBEbEIq50ItGALAYfLczzyAwE2sVdNy5HRLQJmHonvktKa/g1BRMWXjeafJMJqsxFJGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFZnTIPSQmrjSCAVP9r3zLYtol5eD79EffaNGwY4bp4=;
 b=hjLJ8J1y103P83PI9N2Joizyo8cFEougGtWoqDs+w+l5r4oISHrFX+7pdAOo2J+7M734bX45rHpW5clPgFYnHo8S9mE7pPHkB3nzbGYD8aMA0S35ES+fPsFaHogoxBI6yTcaTlX7ePn9ZHiLhKL5LSfeyMqxQYK9enAfYVdA0IMhvd7oI0cbMOdS0x602D0qwhmg3lpd+Xz6OgVs79FC4g9PCE9JpUTm+K0RlguPhVYrdmJZxy81dv8t6851FTvzYKdhDjGL0cWUYfZtP3rKXM9TrtmJcYNIkcvlR/DlocShapprx4VGYbvcJ9CzeKUzP18monKVBG9DK/t2xd0cWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1763216-e05c-1f3d-8aa0-d5ea9573b4d1@suse.com>
Date: Mon, 30 May 2022 17:00:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] x86/ler: use feature flag to check if option is
 enabled
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220520133746.66142-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0034.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::47) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3edb94e-0947-404c-d513-08da424d2711
X-MS-TrafficTypeDiagnostic: PA4PR04MB7887:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7887B6E3F051DE10B28EBDF7B3DD9@PA4PR04MB7887.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W+Z4hBDWA75YLdjxM04Ux4+j6q3ZTc3sUOQbnKV+hrCHjaYC69lr9rF3r7Ley7M2Mi8dwulXMxNHbJ4Xd9V5vYEphU7mu+nNrn08UEBltt1O7pxrlGTJnT9kXpMvzgXxucV/SLRng6HX6DcypsGhZL+VjTAm7B5yozyHEro7AXQO3ZEt1gPk0RbJY87B7c3AIN3oSN3snpnIUVm/0bjIg5iIOpxFXnCsMXsQOVm2g782DuD7yB/UzXmKdLYjrlwegBsuUeSKgiXPAvu97ez84wxjbjesFXAvXXH/ud5u+IsAvUFWddYn29cJyKM2Dj4NurHunozlTyTsKG+K6TImQpj4hymo8kRNxTxTiang/+XcuAGJMGmt/VYfA2xKIZfnI0oc2Yny+RK1Dm/c2x6HIZ5kc+cRn+5F4XTA93Bql8xYMthqJ44Iy5QI9vkL3vUVyis8VD7eKW3IVfPkJc0cZwx+QUoy/XHlCV3Z1CNqc9sWk7NhHT4rEm/sYaiH8e8Ax9mPBzoZw0oj0B0ZmXwanyxoaSaxEW9oUO9muk4T2XTTCe8FNMe0pANdAQ0XxoEObfpRkGHJR9thAFPqa7Nq+ZooP0bHZ9j+HmSjYZwfoy6yiX1gFv4syKrAwFx9FYVZFz4glQQ4gWqIa7S8rEyPg8Htv+2Nwet7WwteC9/XqzAw+0q3Ckt3RSWZp1oG3e5D0w5AKLFBKYBxfOgCLUafGuIyBW3CuHv3H2EOHp2Vpf43YXA/Mt1buAzh/KGedBh5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(4744005)(5660300002)(53546011)(6486002)(66556008)(66946007)(8936002)(6506007)(86362001)(31696002)(26005)(6512007)(2906002)(38100700002)(2616005)(186003)(31686004)(54906003)(4326008)(36756003)(8676002)(6916009)(316002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rfLpqYMJGKOpk8WSPhV2X3w/MvAg0d/eBZRXINqkrNXQcmQLPjtKccC/krlZ?=
 =?us-ascii?Q?m4TitewloEQYGsCj84KPJZ1ucr9jQRuDJXUjJFPg1rMCH44r6LJb4dU7a+Vf?=
 =?us-ascii?Q?/dSVALSoyLlft0QfHfBLMQ4ayI+7NncTEa3LBH8/n+kXGOlRqrKv66RzRHSA?=
 =?us-ascii?Q?pakypjcrZIzo5Xo4/x/0stgLlyCZb2vuQIIZxh5EAsU5rEnRtXphJfH64Eb6?=
 =?us-ascii?Q?PBjrMsiFYG5/ubxhNHkSZRSQCJT/mysCOwSwrgKCjyRhVDhomNISOMvE4QEI?=
 =?us-ascii?Q?MtU3CR0DhMCGOKhF57MT7XSsrIGIDjk1lKvYK5890O+ao6fZjjrbvqd5WTQ2?=
 =?us-ascii?Q?WjIo+EhUDbxdWiPgiZnGa80Q6hzfgHjwpdDDm8PzPZ39mKi/Kf9ub4SDJ5AD?=
 =?us-ascii?Q?R/CeP0zftmMYdfkt2XlDcrS9qsVirwKj10l+RqRlySvNnVpB4cLdWSIJdBZn?=
 =?us-ascii?Q?obQeMIH8Hnz83xDABN1U9YjJs9i+V8APmT1XUlVXTrAbI0XA5ewlgiH08jtZ?=
 =?us-ascii?Q?HdbidQ38pY8/b3BkQHUTaenaBE6thIK4adab5pmUBzaKXe5LArgrA7ud2Oyt?=
 =?us-ascii?Q?L7q2NjD2ys8uesj6uyVDwzV2s7Svn0xFuGHDe9iv/+jEfxshmUhEW9sZaFcA?=
 =?us-ascii?Q?yYnUi6Dr6oQ3uK6BhZsUOpd/haVnwTgoD9XGpq8ijkHtuTZ9wzppuI6xJU4f?=
 =?us-ascii?Q?RH7+DCMddnF59LEZMmCwNAzC9CT8pM+omfCQYN/cSGkKOOEHA5L0N2TkYOop?=
 =?us-ascii?Q?j9GWduN62F9xh+2eri2VqH5m3xRQZmCcwEbdTDEFY89mUstDfvjCz0NAFa3y?=
 =?us-ascii?Q?opW5gzO2O6rpXrKCUqzGAbG28IKm4YFGIQGJLN4bB7k2+l1tjWyvxkCH4HMe?=
 =?us-ascii?Q?L2zc3y91kk9QyQ0M2Ik3WuilKSwSo28ovx2DxzZ82xJI39FSKneFgInQ5CKI?=
 =?us-ascii?Q?FLpL8885Z0FTy5UwWlD9iurthN3YR4fcDhD6IxlIvfmWhTSaT+ARqWogZ+M2?=
 =?us-ascii?Q?BBSvNLVlHkDXOBhtFgsbryqG3zD3UocBR4djJmIDZg1JjzH0mGC8HU6k/Wt8?=
 =?us-ascii?Q?2DWzfYM250KBvsC0LyZcfhb6H+lHTt5mqgFXOYDQXxCS/ZClUrfvoeQu0QLL?=
 =?us-ascii?Q?e3ig30TFKmAkNYjTbdMgPTXO7G8OdeOCX/YkEERR1jtePkxWJ6Z24SV2EG7B?=
 =?us-ascii?Q?NqrrSLSHT4GpRLlblZcG447x+69l+FkXOITpbPS2mm9dVODX5lnOIKzmdDpo?=
 =?us-ascii?Q?hvdPtwJQ14w/BDRGTLhzwNt8qPCvwgWhtXSdLpHtQIkWj3W5mDe1FlNzljNF?=
 =?us-ascii?Q?7AlgfkwYoOz+JHgB5KklEtoX7fW5SjvBZcj+oRIRd0S2ixR0jZVUW9WSwiIf?=
 =?us-ascii?Q?0bGmq4zhHle9bASzA1ntwOKWGiZtOGE+8k+eST6p922KwxaeHushYZum/SpC?=
 =?us-ascii?Q?DOtK4It0/1E1w154hiEPyxZP8TX7JD1CoD7+DRFNBgfwDcXXyR5EpxkRf8B0?=
 =?us-ascii?Q?WYRocGrL3kRcZrNoXbS6+V/5ZC7YnaGs2ml6U/PTQVjxbE8niMvB+SQSnsaq?=
 =?us-ascii?Q?YJeEKqu6j5DNfBWU5hiuR+/W46c1iT4345eR/P+eh4mjAF1S0LNWVWLBvxBL?=
 =?us-ascii?Q?8gSC22C/RpD+AeuDGdKyX3TzFvG3mrTYMq8z6ypxYLC1+T4b1kUMRolmrfpS?=
 =?us-ascii?Q?lO1IXdat0Fz0yTi7wAJyjtx4MWWnn5/+xnzzCfSUAeR1fExgI5+qQCOvmmp2?=
 =?us-ascii?Q?qhDpfybVvA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3edb94e-0947-404c-d513-08da424d2711
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 15:00:36.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+IiBSNSDdBdRUikaFTHRi55WnfANY/Ucodt5L7F5mq9Z1xnv4JjISiFDM0YmknCdwiGYsgIxbeDyBHujh46Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7887

On 20.05.2022 15:37, Roger Pau Monne wrote:
> It's more consistent with the rest of the usages of cpu_has_xen_lbr.
>=20
> No functional change intended.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I wonder though whether the use as a conditional in percpu_traps_init()
wouldn't then better also be replaced, for being consistent.

Jan


