Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631CF4E96E6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 14:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295420.502695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYojb-0000FL-8W; Mon, 28 Mar 2022 12:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295420.502695; Mon, 28 Mar 2022 12:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYojb-0000Cf-5Q; Mon, 28 Mar 2022 12:44:35 +0000
Received: by outflank-mailman (input) for mailman id 295420;
 Mon, 28 Mar 2022 12:44:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nYoja-0000CZ-DF
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 12:44:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0b631cb-ae94-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 14:44:32 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-hH_X16KdN7CmkxkmDpbWgQ-1; Mon, 28 Mar 2022 14:44:30 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3814.eurprd04.prod.outlook.com (2603:10a6:209:1a::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 12:44:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 12:44:29 +0000
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
X-Inumbo-ID: d0b631cb-ae94-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648471472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hQI0ujUfIbQCoOijmcSmCHhLYqciE6fDrU0wXYGT6lA=;
	b=HmGG7m2oAEoShvppxavtehKH9S/FAWmvKxnbVhT5yMz67QWhShtHawz9Zf0mJ/2jBTTfJm
	koaq+89EEDEE3lYTAbsKtJ/Y8Vj1mB0FfqlkI2YFxSGH0Lu2s2kF61ncMsHzoByIXi2Pqv
	5u6iccOqRgIH0TMJdTz1vFbNqcKR5eA=
X-MC-Unique: hH_X16KdN7CmkxkmDpbWgQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYmEGj+7Gpu1n+q8BqGU8F1735Qwz0gA52ySPyxZTR6MdyfsSnOhVQivVHvvVmjrLOTpmUhO/XU7kGKBiWLgUCJFJfE/H49D9RymXAAo2n2O0VHjPZNBUgv7AaS0uzirmT9jHtRy2RjqubBiQitcexsFaOBcXi43fbZXWzu+dKgylkeXoIoNdqAjKX9SxJrkP4HII90PK64gRTzaTrvWv3h/ioenPwIYVFjdYGsHJ2NtpUlzXHpZUKA7T5QSvVcpDpE5WoazTKCr91G10kICt1NJIfno1Zgm8vYuOh+d5Z6L5N3eqWxuBpIiHRBY/9iBrKlev2LC8vWMWaI61BrH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sSlK5e1tsI7wIMyKgdHvyi34xsx8CI64b5FpxtshK4=;
 b=BOVyAnueg4iDIGvxtuONurFoZRrZMprune3pwFcTuVyEWydW7KnAmi5FLsRqVpJjEpnozvOvz87FiRZu/jVGpbTcg5iQWOnVMOV9gLIL27GRsEqT4x90z8U3dfUHMLHPJPhRV+BQDJ190updiRW6lIHWK3SanxDPboXyEnHU/6Ml+ZnkHq5NYUaghPKB8Wsz2ZjNF03YJ3E3ZlMTfMjfQWFSG3Qoa+b0zfT3xQNgbdQjA2/XUgiIezHcirQNvbpzI3GIiMXSPLtppQdrzy3r2E8muu0vPAargGKJV2l42Nr2ESE2Yj9LD6zTjg7xt6uY7UGaNOb/jmEsx7/tMww3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ee0889c-c9ae-c11f-7308-25e7d5a14815@suse.com>
Date: Mon, 28 Mar 2022 14:44:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/physdev: Call xsm_unmap_domain_irq earlier
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
CC: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "Daniel P. Smith" <dpsmith.dev@gmail.com>
References: <20220325141826.16245-1-jandryuk@gmail.com>
 <YkGevRlIpAlCDox7@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkGevRlIpAlCDox7@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0052.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::10) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 750e7cac-771d-4d38-e597-08da10b8b33e
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3814:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3814FAC114B2A32CBC2EECB5B31D9@AM6PR0402MB3814.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YPo3FhngG/AscEPLX2/iM0UB7lz+eOBDRp7P4vBH5uFA8Dl0vmRRrmfMFkd6Bt3uX8CcdVmazwUwHj4CfqiUhTJ3Efd3MeCWlBbwCArA089cdBdlM5MIvpFF98Z53tKTfMYoJrwz4BRxUvmpboPa6NCNrDi4UsER7PlLnv6g+XpEekpcS0WRSOh0m7xvFSt1Ail95j5LTCltTG9TOBiAVymTWhUBoQhA2IzgCqre8rEG3rf/lZ00tOaAgli4ZrToXoFsRcOuYNCVnTy+wQlEziBj8xglyB/Ct3hASC01I8JzEzHbDxKjeGcxKmC1OR036GQgdUn2ogwVDSTwSgKQttsZ95el2Ug7jv86FXcSLS4o+tw3kRh86MdFW6GTSsfxirryVzyAn6ThLHGTF6i2oHibN5HMSh1F+Yt1qy3Db8UmgU/E+sEkHwTh33q8W/scHtdLobkvINKkO3pkzH/3h0ZW+62A5d0e4I9AU9ZyS/aVPItVLnP/yeJQV2gUpguowctQq/B2zCmFRC7ow0M57ozbOqTa/69DOs6bP/DeiQSLXyWLLQV92xgmHykJSyuURoE9p1lBmh1NFTwnOEZRzcM50cHONjyi5lPyVnMNjt22IP7LyeUeuLLI5QM9saIi1Un0Bv1kGF26na6L5h8MZP6swGt7ra2CqDauOQ8U+gJq+5CrPxGhykPtjPcC3bhNA1RF6MUVlKwHi2pUeemPLI6ZZAGGKeQ1uS71L5EnMvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(38100700002)(31696002)(31686004)(86362001)(53546011)(508600001)(36756003)(6512007)(4326008)(66946007)(8936002)(54906003)(110136005)(316002)(186003)(83380400001)(6486002)(26005)(8676002)(2616005)(6666004)(2906002)(66476007)(6506007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4fWIZ9OzWylQhKQc9K31yV1sB/TI0s+VyDS9hE81JaoRDM68aWg6m01CUhew?=
 =?us-ascii?Q?1Ok0lrp/2SIAQZvfancTnIIgN5HurmqjnKEJOZFVf1XpQS6hCEIlARc1AzzM?=
 =?us-ascii?Q?eRbARR+jf/riMkB+596Go5eMHbU8y6kqZk2XiDkCevPN0vvGMm/F46rCEO3d?=
 =?us-ascii?Q?GVUtfX1c4JXQj9VooeloCs8UzS7tM2hhAepehTtYj+9lCth+4cIxendgq6iR?=
 =?us-ascii?Q?B/Qs/adKTn+Tt0p/yLUNzLivNDmGdLPc0b44xMjVKzWErg9ZfrzXRz8hzCmD?=
 =?us-ascii?Q?x1vCGCJXDCOZ75sd4CLovL7wWjV3caxoCFir5KmMgDzJR1NeFmAJ+YmKdBtc?=
 =?us-ascii?Q?QW49X0yaoAnLBadSigCmAQvNPRAPq50xnK5uXbn/yPPXArwQ/U7l8nLvj6Zd?=
 =?us-ascii?Q?WK29l6rW16x6bvCvCpgKa+B0/VgXk5Krxrc/HydGF4Izq+EAFrs9Ia7xz/Kj?=
 =?us-ascii?Q?+1C4IkA5m3Uwj+/PUW4yKWd9rumcWqITogNznDxfzg/g+2oCr9HMB4hFjs+e?=
 =?us-ascii?Q?OmIuhEZUPTtnnpdUidLCg1+ZKQ6lt3Xo/Hn9eao+QNrmiZiEXbAb49X8yxZo?=
 =?us-ascii?Q?VNYP6FADbmxOn2kTef7mWVPNhE4zK0nW4fbeHhM42BYX3JWxn/xxSwLvohVA?=
 =?us-ascii?Q?lL5zIbqqlyf+Lb1FKHRSNgJZaeZ8bhYPYSeGouMQeDdvZzGkrtn/YbqyE+vR?=
 =?us-ascii?Q?lfF/Fdz2jAv+LeAYw9ocWWUJ7/xFc/5Ob9le573syPqooM3/6gnhJ+EARjSq?=
 =?us-ascii?Q?LPWRKzUKHu0vFm12HFx4hkYKDUac2uTPJOTYaLqWPJgLDD8LaX7ZlVo16ryn?=
 =?us-ascii?Q?RzNrd8XQgJi3z/g4C/4+gxyC3lmrP2pcSeHynNAQnkRM8HqqiC4w79u7QON4?=
 =?us-ascii?Q?0hyazPl9Cp0+cy44y3TuEPTOza20+D0jo29crJeFAZgIcjszUlwLhKzlgDxr?=
 =?us-ascii?Q?jRQKPVwuvnZ4e/mhURpDkwCubjcOrx1k/m8I+veGws0MiCxwNvAkwTByQK34?=
 =?us-ascii?Q?LF0rRIxnKQqaxe6BhbFEd4isWo+7s3YxtnisPvHBmW2syJ3qzwCweJhT0OVV?=
 =?us-ascii?Q?Wmvt4UudkDj2okXECDF45UhKoAygKVsJpbSgBgBNnqKSoxskXqXZ1SPXzINu?=
 =?us-ascii?Q?MSt8qI3+6u07kerxU65yX9WJQXRZhSfXtO0uQpcLiL/hDgySmvF/mx/CO3h6?=
 =?us-ascii?Q?pxT+IwJ5YZueDmDLwJgVm6wX5F9Wsxq8iI2ZBNjh3u45cdyzLbhbGTmsMDFg?=
 =?us-ascii?Q?9P5IVTNfMTbg6rVkhkKt3MfpFHYHN+na7+TGKwsGgV7reOCRMRpscqRcDFR1?=
 =?us-ascii?Q?aKC+1hU0BHeMwcVcbY0GC85PGoL/kj03RD0hAo1l+LtF99iR9gWnTNBSrLKY?=
 =?us-ascii?Q?awDUKhVfn1/RSP2byPBSBudHsIhXMbWYkUNulW+u1TIsVHA/14sYr+V7q5DA?=
 =?us-ascii?Q?e2XfklKPXPGIsqMO5ZkX0cjLtjpNWcwJekScqQAgHOduqkbvEZWQXVXeCSYX?=
 =?us-ascii?Q?N7PbqrQpVHRtXgB4pk5DbwelvMUzoXVpkl+mIy7L4EPgj5kD6VNo1bGxNQP3?=
 =?us-ascii?Q?aq81lL6s9VE+DlCFVBfWUY2OgFM3/uUyMJJkN0sQzclMKReAxcacgKwB2hTF?=
 =?us-ascii?Q?ns7OrwQ7y/+pCZh7RVtiYIYowH6jmvGUG1Ct6mzZr0n0OxUpII7mXIXiilLV?=
 =?us-ascii?Q?d9Ze4A2pdDsysPmS3vH6ptilXEjgaZ2yQdd3dMwTkbeHdkhxlUg8+B2EZR0L?=
 =?us-ascii?Q?0xZkVFuadw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750e7cac-771d-4d38-e597-08da10b8b33e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 12:44:29.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adv0jii13KVV7Eeqi2vW7qNeZSnEj43s1HU/dupXeYUcHyATAudKuwe9D7spQskCMenfWRa90LwcGpyi2KUAOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3814

On 28.03.2022 13:40, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 25, 2022 at 10:18:26AM -0400, Jason Andryuk wrote:
>> Pull the XSM check up out of unmap_domain_pirq into physdev_map_pirq.
>>
>> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
>> complete_domain_destroy as an RCU callback.  The source context was an
>> unexpected, random domain.  Since this is a xen-internal operation,
>> going through the XSM hook is inapproriate.
>>
>> Move the XSM hook up into physdev_unmap_pirq, which is the
>> guest-accessible path.  This requires moving some of the sanity check
>> upwards as well since the hook needs the additional data to make its
>> decision.  Since complete_domain_destroy still calls unmap_domain_pirq,
>> replace the moved runtime checking with assert.  Only valid pirqs should
>> make their way into unmap_domain_pirq from complete_domain_destroy.
>>
>> This is mostly code movement, but one style change is to pull `irq =3D
>> info->arch.irq` out of the if condition.

And why is this better? You now have an extra conditional expression
there.

>> Label done is now unused and removed.
>>
>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>> ---
>> unmap_domain_pirq is also called in vioapic_hwdom_map_gsi and
>> vpci_msi_disable.  vioapic_hwdom_map_gsi is a cleanup path after going
>> through map_domain_pirq, and I don't think the vpci code is directly
>> guest-accessible.  So I think those are okay, but I not familiar with
>> that code.  Hence, I am highlighting it.
>=20
> Hm, for vpci_msi_disable it's not technically correct to drop the XSM
> check. This is a guests accessible path, however the value of PIRQ is
> not settable by the guest, so it's kind of OK just for that reason.

Kind of - perhaps. But better to avoid if possible. Hence I would prefer
the ->is_dying alternative you suggest at the end.

Jan


