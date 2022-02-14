Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7354B51AE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272197.466998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbTw-0006LZ-P9; Mon, 14 Feb 2022 13:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272197.466998; Mon, 14 Feb 2022 13:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbTw-0006JC-LJ; Mon, 14 Feb 2022 13:33:32 +0000
Received: by outflank-mailman (input) for mailman id 272197;
 Mon, 14 Feb 2022 13:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJbTv-0006J6-4C
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:33:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b25852c5-8d9a-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:33:30 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-oQ8TZFAzO4Gwq8Wwil_USQ-1; Mon, 14 Feb 2022 14:33:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6445.eurprd04.prod.outlook.com (2603:10a6:803:11c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 13:33:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:33:26 +0000
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
X-Inumbo-ID: b25852c5-8d9a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644845609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=od79o+m2vjWcSzCbdZuilnVrhrD21+vrhrbvHqz7Pls=;
	b=Ju2jhmZhkJU1nldmXrbL4IJxzjMxwdVdTryRhFoGJPMe7rbirRKlx5M7ppiv1G+CQJDw5h
	nveZtNmTE8SJfaoFdVslB2UPIyNd24DiOezil1/2jyhk5lNmD5P/V48bN8bRKyICTv3Czs
	ji4TL6mxC2lMAPi496+bhoqwXxiz2v0=
X-MC-Unique: oQ8TZFAzO4Gwq8Wwil_USQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjWlX9bFIMAdTG3CaUgt/WfQ6sKkx2sr75xcJGq3WIJfY+ZTLD9CpN+v0VFi5+moSie6GIHmZxy0VIzJ4bx3atDK6Lp5kmi83J9WEnFosHNw1ZqHuxh1a8qwHqIkBxDmzcYS5FVGwFtv1HB3t1Ial47yoSEoCpF7rdHhKs8U+hmHoyqkzxkp8Kr3Aby75/1fFbruBTqDPmlwG8j2lm0SZvabbipwFJpKod/j2MFiO8hnA//SpXy3fPIdhdnkG/GcjRMOsWN+cmtx3vg0EGbeWUmrQD1x+X6vzD0mkJZmX3QYo3BgiK4BUQFptcERNqs3yhcW94jQ/nspxOUsYbHxsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr9WkXqtGYwxIT7piuJg17fN4Mt626Z5W09wOvRyZPo=;
 b=CQxWfOrPXTGLAvM2lX2cZ01px125THIlG728pZpcF2OeNJNYjGsLqThxZDi30TsNV4QAdCzgtNArMCjsFKfXghHNVn2h+6OTs57VJV9eKu9CBonaFW+CdfRr2560f8k3ZZiVfWv9a3SWqx+WZ4HYjLZBlKK9Qn8xwGHd5LDhh7Q4hkDSD7u0iKUSP8KMWEnFiUf7abgoLjhLqKBJqybwfgLtiGnqv1mh6nxVqxi+QbTu+GBZzhfywi8Mcv2Qr3iY5bBNzNPEFyI7C7lR30uBV04dAknhVtmsqoW2qljZ7a5+KWHrc03PodRGj5+poaoMRyuujG5JpsReZPxkNGoXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d8ab414-caf4-5a12-4cb7-a88c633cfd66@suse.com>
Date: Mon, 14 Feb 2022 14:33:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125127.17985-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0031.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34d447ff-af22-444e-d161-08d9efbe9448
X-MS-TrafficTypeDiagnostic: VE1PR04MB6445:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64458AFCEB38B0F76CF178CDB3339@VE1PR04MB6445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VgndDCVaH8Ze++UXgK9QAAKDkHNTjKYWXupQ9Eae6aJUXLULno2fnpkQmqyGUXG66ahfgiuz5GklDn6MG3c+ySpmM/P/sHXiOolDTrF/hf4YudJYd2+VC9qT8Zm6z9jZ/8GoBSPFLvFzZ647ZLDHuRSIe6NgaZ6dW+YFYVA0Trs5HIOd9tt3cM4gzmbP+KeXbPSwtTzmKv2O2C31zp6hGWD5Hj9+BUQhI5XjmqmfJbIoqAlhkI87+6VrgPKiyVTcDp1+eHzj0UygVZAOPu+qK0cRnuH1h8c6rgrpXeP3/p2e0uriqs/mNexhVnUz6xSde2L6yrSuS5QecfX1HeVmSapjX1+MtiW0jLg7/nOpsh3GhGGsh0Q7D1Hh96bQJhC2vFIyGfpPtF9XR1OUOSH5LjKcm2qhBfWKLktv92d9MRgw+egFI9kWWDCBRzuPhMQEh5yAuqXoFEXo5hCqGkZAI50aXncHBrLgSeIO8NXoFxqXZdbXqGHFlBM/JyiBm/CDTH7OMXpMYZgjnwP8AxWnsb9AplyYfa3D0fPc0G7tFw2SD13BChl75MSqf/rN/6WwKD5fZF3OBNkaMNhXqGT1AdvR3RI0YkzR9fD3Iqzi/70EyUCxGPlZSykn3e33UfUFg543mWqEcgu8HJpMd5NCZoruSrapDD01wyYTloe1LqqAH8O8sTzI0uAAgq6mzMznJVNlGx0rJnaZkwI+7gUW/mAjZ6k/BOHOxnPfwd5ErlE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(5660300002)(186003)(83380400001)(4326008)(316002)(6486002)(86362001)(66574015)(8676002)(66556008)(66476007)(66946007)(8936002)(2906002)(54906003)(36756003)(6506007)(6916009)(38100700002)(31696002)(6512007)(508600001)(2616005)(31686004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9XxOwktaaqBZP2Zi+YVLdWD38srbhZ1qiGXuFfcApEGVAYspvOOASrWAZG6R?=
 =?us-ascii?Q?1X4YM1p53UtyLIN/vfkaaetJFzdzZUtdPKQlBmpM6n6MuycV8ffKh58cLjIO?=
 =?us-ascii?Q?J8At5ZiIrUQBZiZngtYo9RN71PNUjf31Pay8vi+ywuR/Jh4/Q/KV4FANYi/1?=
 =?us-ascii?Q?/RP++3aRalDNrgi0EDrLCpMCPWTDrGwbYzJOxKC0649Dr/+U7sP3NDWuyjLe?=
 =?us-ascii?Q?2RyVVagmS3OcBPja81ESjfH8YIjbPDlzKQeVA688lC/ISaOo+SiIuQEfpdOX?=
 =?us-ascii?Q?0hMB2jF8o7F8dP0Li4SMT2HciFwgvk8MWodDaLmY+hPKl1d76d5jH4zuR9Uz?=
 =?us-ascii?Q?DpvlgZvRQTj5QoaeWOELe//oJ8Go03k8UwWAqgC5uP4UEchCB+Rr7t37hJET?=
 =?us-ascii?Q?g31TqSZWnQQ6FbMWqI3ReuOmvAt//IMJEwgdRgeo+rc6IN4oDGJ4gZlHPsnN?=
 =?us-ascii?Q?5O/q75NrYmcKGK5/iUzUeGVYftbieoXmf0bRYvo9gOjlR9a4oWyMnWnVpyAm?=
 =?us-ascii?Q?Wwh60KdUoOo+N7OvAKp9tIz02kBS60etpuwmbDHwmsGZnImfDf3TH9txOjOb?=
 =?us-ascii?Q?tZBoKp8QOOrHdcHvXqwNGPBsCnooc/MKDo8Vk+HbbfIMGQ+DM3pnpK6yQ3Or?=
 =?us-ascii?Q?mqbiFlG+nkdDR966fa8fGo0R2X6MLF/bW3tprI84/YXGbRoxsNZDtXh3N4Mt?=
 =?us-ascii?Q?Ozl2Shc0xNikW1BeTYaqZoPhhuLESoHKBhJnECJ+WNJCPYh7HxPoxjxKYJH4?=
 =?us-ascii?Q?pEIV1+o81sKpxjPxh1HUPaLlMxp/tIZFIHnQEL/LePYr3rQMxUNRSg2u8Tk4?=
 =?us-ascii?Q?ld+QA7QUxrxBZINVMKiqRd7jkoIQiCpPKKNURa98JjuSnb7LNqBpLJTD6IPT?=
 =?us-ascii?Q?w/dl6foUS3Am61z3I4ArF3QSZX2TsZMyGVATtlulMOyHpHPZC8m5MohNZAGd?=
 =?us-ascii?Q?C78Go8yw/5Iwf1Ly+F+RGnp5gz9LzuDvRVe5flxB+IbTGJ9dM696lkC9gJRZ?=
 =?us-ascii?Q?+TZSzH9fD+iFAQLi3SDZjOltck0hvufXXAiEYc+53Z1lWtdDtyujzJUZt1XB?=
 =?us-ascii?Q?HXhEs1+CBP4ye/DYHGyDzs7e26yhua2JdhjnhaERlm5ddviM+4hF6MLq7ZE0?=
 =?us-ascii?Q?v5V0VN9qg7Wuflkn461JtGUVB+5eMXcLk9CWAnnEs8tdu91bJzu47kknt887?=
 =?us-ascii?Q?dOagUBMJabC95CD488KhHDDoznPOS3ZS1BWgBUL4EL8OiHVa2yTKkComcHLI?=
 =?us-ascii?Q?N28tSCbkLkb1CqGRfYIMi9lKYSGkinV24+KBTDZt+kKaj1fNrjuRhu2ZMbkn?=
 =?us-ascii?Q?+070GpC7LjU347pkIdzn/2hZ2o3NL+1S4gzPoB3jfODi71kUM97LwgKcXhWB?=
 =?us-ascii?Q?mQsAAYDuYpU+Mh8tC42MbYcP5qkXSFV+PLaDvsTlD7UH4kE3J51rt+19YDOZ?=
 =?us-ascii?Q?4dcm38KR08ABRTDBBP24VxbgEnMfybQcdVn8LCV0kPEVZuYSKNewOwSmHl1m?=
 =?us-ascii?Q?0/h7JqctOLK/DBCxADDnnopUEMHwfUk52HKc1H2gFTzBnT7aREdCH7p2g9UO?=
 =?us-ascii?Q?52jwHG4GoJcTbKhRh/fpkc4RYdPvfk2MD6P8j/J3ddCoJ/3LDzKlxMFpZxvN?=
 =?us-ascii?Q?mSEnrbhI2v/I6V0S2uF5JgA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d447ff-af22-444e-d161-08d9efbe9448
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:33:26.1510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGd8XNftFDguPPIuw+DOBlRX9BvBYiYaR4szgdRVZXNeidW8wqICd2EH2vy6GYYNwazrx7ZO/D2kczq9ENV+Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6445

On 14.02.2022 13:50, Andrew Cooper wrote:
> From: Juergen Gross <jgross@suse.com>
>=20
> When running as pv-shim the hypercall is modified today in order to
> replace the functions for __HYPERVISOR_event_channel_op and
> __HYPERVISOR_grant_table_op hypercalls.
>=20
> Change this to call the related functions from the normal handlers
> instead when running as shim. The performance implications are not
> really relevant, as a normal production hypervisor will not be
> configured to support shim mode, so the related calls will be dropped
> due to optimization of the compiler.
>=20
> Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
> wrapper do_grant_table_op() needed, as in this case grant_table.c
> isn't being built.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I don't think you sync-ed this with J=C3=BCrgen's v3. There were only minor
changes but having a stale version sent two months later isn't very
nice.

> --- a/xen/common/compat/multicall.c
> +++ b/xen/common/compat/multicall.c
> @@ -5,7 +5,7 @@
>  EMIT_FILE;
> =20
>  #include <xen/types.h>
> -#include <xen/multicall.h>
> +#include <xen/hypercall.h>
>  #include <xen/trace.h>
> =20
>  #define COMPAT
> @@ -19,7 +19,6 @@ static inline void xlat_multicall_entry(struct mc_state=
 *mcs)
>          mcs->compat_call.args[i] =3D mcs->call.args[i];
>  }
> =20
> -DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
>  #define multicall_entry      compat_multicall_entry
>  #define multicall_entry_t    multicall_entry_compat_t
>  #define do_multicall_call    compat_multicall_call

J=C3=BCrgen's patch doesn't have any change to this file, and I'm afraid I
also don't see how these adjustments are related here. The commit
message sadly also doesn't help ...

Jan


