Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D5452BED5
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 17:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332353.556041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrLuZ-0006nE-4J; Wed, 18 May 2022 15:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332353.556041; Wed, 18 May 2022 15:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrLuZ-0006kN-0d; Wed, 18 May 2022 15:48:31 +0000
Received: by outflank-mailman (input) for mailman id 332353;
 Wed, 18 May 2022 15:48:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrLuX-0006kF-Ls
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 15:48:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5f14835-d6c1-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 17:48:28 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-L-sfRauxOGildq7AWMHa-A-1; Wed, 18 May 2022 17:48:25 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 15:48:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 15:48:24 +0000
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
X-Inumbo-ID: f5f14835-d6c1-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652888908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVFyFHQJ+hXNVPzakcJVNOSZWmHIhHRHL54cgecHf0c=;
	b=YZpchhzjtqbkNyaclzKHk4JB+Qb/1j7StJrll9oluxY3kwGqcrAZhrgU9CS/E0/+at8PkG
	BhWBg7jVD+74bpsz3DNsgv6Z4GPj73Q7HzFNCP62MDSlbqbgsa1utpe6nqcE4u49/3ZXZi
	oOVusFM0+z8LPpg9k+1/N9dqaRArsQY=
X-MC-Unique: L-sfRauxOGildq7AWMHa-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTtv54dGdoQ1vp/JnSybRf+m6Sov7wueIgGd/CbrEZ+fLYxDaM5MY0/VLBP8TYY/nlW8Sk8o97Y6coE5WEaK63QsS5Ix6althkjE7AqE+cjUQIjRSoYkqlZMYQ0Pmi6BsSse/+uayk7RyKorwZwUPfBfZioyM1DMFLzHaAUnTM2VFqokCdVMSCQTj0BE96GTMdrtVZI9qZKjsKdq03mBntBO+6dcXuqv0xxfLkLwurNm9CC9Bcd2X/Qg1sPj9SPCNvD3lXANMKNl8nQd06ZzkfOdNKNgNw3ApiAX8oTJLeALBMnsqD/MjtCpk/Vb/G/KJnmnsZUsL7piTSa7ucfSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLlpkTtQDqtchdeTjjGOXc+ziaYovd/iPJhRB3sY04I=;
 b=IMKpC1StFmVsgxnfwEK6f4ynqoqsggJbP3z9aid6rTrvLUXfBkL6zyFdoZshJutNSpujqDVkN6elqQUwP4MJ8VYceY3q+hspZPzhEkML5x6/TIjDvS/5IDWpy6nfuuk/RCZ5uvX7fiVANp02McQfFWFNpFLIlibO2f4dVWDu1ginezv291Wd6kQ8MZ8HuV0qalRgEN+/u013rh1/Fh7GFmQj06+Z865iwYp6ymdmAOxXxCpHr167fDlKNV7sy1s3zpI4FQJk7kFWpI/q21mp1AQSPcFu736ry0wqiATzVmEGHOZxRyaMMkhuaeB71yA03gYEM20L3EtkscM5eM1x7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f15dfd96-f104-7d5e-048a-8a9095520197@suse.com>
Date: Wed, 18 May 2022 17:48:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] tools/libxc: change xc_memshr_fork_reset API to match
 hypervisor
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <f3fdd4e99892549dc68e7511f2d84f51af446e86.1651073086.git.tamas.lengyel@intel.com>
 <YnOIEb9sNfshZwtZ@Air-de-Roger>
 <CABfawh=WnQtGehg2mX4Lnz9y3AyAnaUjUyc4FNxjGvoc_YcOBg@mail.gmail.com>
 <CABfawh=2wHwxGuihNY=ecKcdx8ZapmWnNzx=O6nRxm1ENpr62g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawh=2wHwxGuihNY=ecKcdx8ZapmWnNzx=O6nRxm1ENpr62g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 861c389f-8208-4455-6ee5-08da38e5d773
X-MS-TrafficTypeDiagnostic: AM0PR04MB6881:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6881AB5EAF23461D98FEAE8AB3D19@AM0PR04MB6881.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CxHwg3lXdieaQycelg4NJE5UnMNdw8WkbQc22Xkmy7rG5T5GUOdjQcGUcOh9LBzrswcdIWPCuWN2nS939YL4qPv8IE6LCdfk2KRaytIjngrLXBtUjxFjtW/lO0OyAXUPSiLtLB58vqfnLOKP3fALfzdWBl18f5FuQHdgdPT6SrLKw9xmL72PspaiA0MvLNwanmeDxT9fP/FLwDZ9jt6Sw3fbPc5eNpLWM+FvsUvvwJooE8kqczmnRhcV/Elm4HMDSMLf5V5XmHzBkFRtBR1XHl85oK8YEfJmEUOtV0THjvokxuI4LD6skYh9JCq1fJupnNXAb1DMZO2qQMqUN3QPOWvuR/7S4jcfGsv5fn1w6hwfPKnAySonLihq6r8SHFNYBwTrTfg/LRr3j8ipG4IpGqZDrWIGSQUojwGbdWKk4ueuEhQ/1bStpdC1NwANaeBlTs8a9kK5QtU2o+EiMSH0yKO/jadxT5ddK5ICCL0WmnJitmeJQl1m26SAN08WdxW7Z4yoypDZryyF3FP/MdyYyUBpRv9dnW1xvnDEtXiN9xHWNp7kkZfEwQiNdjx6r7F3D76jTG7RAE+g8GzTup9LuCC+0B6cTqLFmSL7iXfSeyffoGXarXVPIn7nVIM6LY/r0W0k7/W3RbqlxyJyABfDmK74E07IA7Diuk7gv2NxZdrjWXy1fM1Xwt4ErexDLR15FF1JtmMJ656m0k8N4+JP5UaPlToyH1PlET40PrrAq0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6506007)(54906003)(186003)(31686004)(5660300002)(2906002)(4744005)(36756003)(508600001)(6916009)(6512007)(86362001)(38100700002)(4326008)(8676002)(31696002)(66556008)(2616005)(316002)(66946007)(53546011)(66476007)(6486002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lZiFi3/yW+sPpYzAkBsXaExG8wE1LRHi/FAUZS88cJSNh+LWEItyrZkgPF8n?=
 =?us-ascii?Q?BESWliWaB5yyXS5/Ka3u6O7SMjs3kc8+p+8GiEB8fnLG6MWmodmPXFsdArzO?=
 =?us-ascii?Q?QXCjSbjXG1s6ilCEzptacT/icfOKVYrtKRfa9UH+zbc7VQJLGlh27YksMCge?=
 =?us-ascii?Q?3IrS43CnLwPNT0hSYMGTU4ehG6XUNx9Iphm+YFIqmMQuEK62e6qbKiYyUIlc?=
 =?us-ascii?Q?KR8MBUdEAuk2G0XboCWzILZ3q7n/jZolocTAIF1870PCpSYsZ2wtsmrfwQkh?=
 =?us-ascii?Q?SUOuNCJGxOCok1yndjs4x5VgaJYKRnQ+bdTFrbd6CrSgZhwi+7dhgDQfOxrq?=
 =?us-ascii?Q?s2KAUkooDJ5N0PmRz5e+Sv/qxfGCg7V/Y7iZkYRJT8UV8XkCbPYoRlo9M/or?=
 =?us-ascii?Q?S9IKeeK+ZgMcrQPj89+BWlQ6gXDcAquujH83Fyc/VSEhrMbb2r/1qYhendKZ?=
 =?us-ascii?Q?TfagYP66XP14pkY/CzQJ8YDF3Sy86NvAIfxwXFhe1QCa+MhNfCKTgcIo3ui+?=
 =?us-ascii?Q?ppvRFpyKaK5Osq5PPuU2+A+TVAYeC9wJtOVkJSUxGQY9mAcdYOo1g+nkHhd1?=
 =?us-ascii?Q?kSb55IQg8QgmC/0Aja9B6+BSuA/ii3Af5HAevSJwPzwX3CgJwmhTd9vdEQEn?=
 =?us-ascii?Q?MGu1Mg89WwW3pn3eYjeYYHfWyp89TXQ6IZyNZNTgIjA+B1+8tE2glNk0BnPP?=
 =?us-ascii?Q?Zak1ruHCv7i4JtMV9gAVv7yT4Eer7evpQ7/Pf8/2ilV/gEWKCEoY/JOVMldp?=
 =?us-ascii?Q?+kY/vCZ4gBsDeUfa1TtW2TQidpf1TxcGBtgABuZJylpFTZD5GumMeAz37tlC?=
 =?us-ascii?Q?SDfWc75nhGL+esXrKoDtNyA4OR2iZTb4s43BH+GVvaTJ3s712d0Q1y9wbdWc?=
 =?us-ascii?Q?CQjgjxNZ2+8pdyPf3ska+TAvie0Z2fR+zySdS9H38NxSdHyRX7NUBPuPr21S?=
 =?us-ascii?Q?+fd8oYcrDrDmaZAsYEHJCVvzaHAxEH3Fo+7i1FXwbY3Cu2vIN9YnuprmnH8E?=
 =?us-ascii?Q?ks+FZC/I9RUDMd2PiGA5u/3TD5Z1CakBOpyjTy3ni4DoRgF3eaVJOPhb/Cy9?=
 =?us-ascii?Q?dThW0TPvcC450zLqI0YzsKk0uPqSDaB0SwSmd+CHDTyrT6xCfFXN2eZIwVpI?=
 =?us-ascii?Q?mMs5Bigyr555Jvh0q82MlMm2+EIVs1cHBFKVRX476vWSlzCZyXs9qNKd5+2j?=
 =?us-ascii?Q?NYYwsTGt67uOkU5TDwKKMDxCCvu36Kj1IQrmJRgzQXHaNMez+mWGHLwBNpq9?=
 =?us-ascii?Q?7WVcoFjZ54BIqsBqKE91ETwR+7tMNebEM66dpslCtUMnOL6iZfuPW8BhJQky?=
 =?us-ascii?Q?SVcX2fBselpl/hRNWQbUK7aQty+JY93pr6t2JUoc2uCSSBQw3boHARK/jc+K?=
 =?us-ascii?Q?ZvcP5oVW6RnUUcfXaC/XxtHdEzhyqBBh/CX/SfhNy6EkjApCtv3T37oNonQq?=
 =?us-ascii?Q?UeYANvnv3kajoaW2Z9YpEscUw9cMM2+BI7QsaQPH6US61jAtaZj0lUR/qED1?=
 =?us-ascii?Q?aAV7jO556FdA5NY8PaUqsg5z2njPO3Fr5gI0qqdD5ZcdBJJQstakG3QMZsTO?=
 =?us-ascii?Q?zlZyqc4KoRQW2UWaqo2vQrzJU/if0D80A/IEOT6B/RKyHEx8AavHzns6zQSh?=
 =?us-ascii?Q?F//R8CwGjMaV4h05GiOTDtYE/65DdUIIVlemMJxVgIewrmU99u330dAPHr/b?=
 =?us-ascii?Q?7YZhkKfpbkzkHuyXpVSrdsf2GYaLy2UXBzMeW3miuI7OL96k1a//pSCRUAYB?=
 =?us-ascii?Q?TPdwDN6Lbg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861c389f-8208-4455-6ee5-08da38e5d773
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 15:48:24.0929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkbLgEZcRQGAJUd7uSiKxtJB9CbBagxNFK/eaIahk16EJ14u5pmKWNkOxWc+33nzl3hiGJi3l+IHwwdBIlZkBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881

On 18.05.2022 17:01, Tamas K Lengyel wrote:
> On Thu, May 12, 2022 at 9:46 AM Tamas K Lengyel
> <tamas.k.lengyel@gmail.com> wrote:
>>
>> On Thu, May 5, 2022 at 4:27 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.co=
m> wrote:
>>>
>>> On Wed, Apr 27, 2022 at 11:34:19AM -0400, Tamas K Lengyel wrote:
>>>> Need to separately specify if the reset is for the memory or for the V=
M state,
>>>> or both.
>>>>
>>>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>>>
>>> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Patch ping. Can this patch be merged please?
>=20
> Patch ping.

Your mail (and I guess also your earlier one) was _To_ Roger, which
is odd since he already did provide R-b. What you're missing is a
tool stack maintainer ack aiui, so it may help if you send your
pings _To_ the respective people.

Jan


