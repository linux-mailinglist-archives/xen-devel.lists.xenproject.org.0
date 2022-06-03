Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B19153C9D2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 14:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341465.566688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx6Ec-0005A3-S2; Fri, 03 Jun 2022 12:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341465.566688; Fri, 03 Jun 2022 12:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx6Ec-00055q-Ly; Fri, 03 Jun 2022 12:16:58 +0000
Received: by outflank-mailman (input) for mailman id 341465;
 Fri, 03 Jun 2022 12:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MD4n=WK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nx6Eb-00052x-Er
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 12:16:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d988743-e337-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 14:16:53 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-gUUoVrmrOGaCS5rgYj74NQ-1; Fri, 03 Jun 2022 14:16:51 +0200
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by HE1PR0401MB2476.eurprd04.prod.outlook.com (2603:10a6:3:83::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 12:16:48 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b%5]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 12:16:48 +0000
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
X-Inumbo-ID: 0d988743-e337-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654258613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxsgk26JM3in7Nysx3+bpk7Ig2JWyenQGGQ3AfVU7Gs=;
	b=nt0kvTCKecQ9wzdoHnLQazQPPYKeiKyFO0igk3Gk3eDI44JhD3qXh9Bo4ZHnJGdWZoILeI
	u7cb0T5wqHFtMkJSW124zEl1bkyfdISc9ozZWbGJrNn9D6jmz2C1nLiQivU8dczoI4sBNl
	fd28NdhAuS5oO0GTY914fNA4O7PaJm0=
X-MC-Unique: gUUoVrmrOGaCS5rgYj74NQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdONdbR6q8J45G6QkVpXOrjMOpGi5K6CCyf6ubupRiHQj4MtTkJu5nGOXCrc3zy+76xknuG7GYkWzvy9etp7PJQFhTUY5xbbuaaZ8G/CX6kMyKnSqL7V8Ya3Xc5iK+WrNcO1+BjHdtWhkuSNBWUADcuo1eyFKJgQrKy7z/85tiRmq85HTwRZeTQxVgz/ihs7edAWl7EvaEIAHjZtaQnRO4O3xl7frx/a7574R5uhnSaNFbwmhUhZbBze9OfvhFFbR2n+FN47zn09WnlA6/KX1nvi90VlrIHAiaeH6C+Oan/kaD2X8Kq9NZUlYsHoajTnpgb2FBTf+2Tu9UkM2sCprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNnp1I8kCYNAff1ldvLNKBRhqqbKFNQtfE0RFdOvTMY=;
 b=hTtuoxuG/f9at2A/tuogpVskMHvN5s/qQwQPSvX85Mhhz7LEGv2hgBP49D4ctNj51OqatpTl0jp4+3A5sNuUnTgAmh8L8KUSbq8wFfnyT06tk039MKgtgliyCe6z4OdvyuhrkzihXCtDX5KPxLyZV8LGl9n9EG7XbGBGNgBd3Zb/xmzhWC7qmnW6jeUw+66bVZMnnhIFwgZeCONPmQLoPK7I+9i5//v3QvrZA+uXVcEAmczKXz8oTFoB8G6oEC2AawTtPuiXtsbDEGY9SGWZKLnAJp1gXAevvPW9CKgyOmyAyvsN4cJ2TqzlNoSEe25MFEqwLlD5gWRNpfcZ8hnMag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3165a99b-3a91-2ca3-80a0-af88d87e9bb0@suse.com>
Date: Fri, 3 Jun 2022 14:16:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] x86/vmx: implement Bus Lock detection
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220526111157.24479-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0287.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::21) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73cc333f-4dfc-4f68-1686-08da455aeefa
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2476:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2476D56E1BAA2EC5D7935536B3A19@HE1PR0401MB2476.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UMu5HSnDlkzdqM/yZ5APoOZvEQbD116bzTUBEpHI12/FTkxh/KF64W+lWzg2zbBOo5guvh0G3Yck4IZVMoSZdEk14x3GgZe4ow+LPcrR3x+JaVfaE8a5n+okMkqB71oy2mzrT7zjqBg6ambmpa/GuHBADenoBivEwX93786D8JPHx8jMoQLPuSkhJPFKAZz7oXKm3jLakaaInGHDvwk+vZFI6y4uhC7DCxtKpy4bAxfs+SJVT3hN3w50Eveb9h6Mf9x61JmGNs8L+Zqa4+tMKr9BXFepZdfvj1r+VjoA+6LL9scV5TinZUgyOulOBxLpeOuzSf3qRrZjGcULA+p27BqiyVrYH4Q67we2SrKPtckJvXJ8OkCTrkvFqCTwx+6d7EIL2+f1ssyCtGWoe3c/ktH9OMP5gTcFJUg1LA8y+HnTJPXoSB2xFrhs2BBpqOmJ7k9HvwloELUYyr3cGkkBNC2m0BEsBFryY6SzRo53s7PqF3WJ7g3AERwfGj+gCepAZ9lQG/Ct4/8VbZ7P+6W+O9bqmNGSvmYwHktwtAqEXDQv2yw8tw8SvbbegnYcAXg5HYm2/NB/MB6OuUtMnedXUF4AAC8P9FqHxhUjuqHHEYGqmvaJUI5dAfHztr5CsmnBBMQ3tnwwpl5xw+Yp9lSBsJuh/CWsAJtiJUAHxAFUqkBRT8DbhP00lcCN0BxE1CfoUeYP2/PwFi2Zj+5rqD6Rx9s5DHnjkr17CXLDkQV2HOc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(8936002)(86362001)(2906002)(38100700002)(5660300002)(508600001)(31696002)(4744005)(6486002)(6506007)(2616005)(53546011)(316002)(186003)(31686004)(66556008)(4326008)(66946007)(8676002)(66476007)(36756003)(54906003)(6916009)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kGB1yTqoxCvGJd3ueNC+Fb39lLKS95/2c0zaUKSFJA5o42RPTiYI5zIcLy4e?=
 =?us-ascii?Q?YyWK6jWdBeheIaFwr5H28/Ck52mtmT6ODM8PcQgroIEHIkCGRZjtlbbLYlrr?=
 =?us-ascii?Q?pTfk/PzTT84aJhuT8OuKkRk7qE8vrvJXO+IGSkBBKaAm3snI3mN+2r0eKv3m?=
 =?us-ascii?Q?fnvC6uHXb2lxJc4hoUcHcSd5uf2Bq0frOBTzTZtjRuoBl5TqWlos09zIt3NU?=
 =?us-ascii?Q?qQh0K2Lziu6RYLgz2xUn9dbokVnVUlxpfV3VRxUhM9rq/kf1fvDnzlO4ws/P?=
 =?us-ascii?Q?gMX+lETIn2QfKljEySfFiWX6AATwcf6GRssreQsCGkz3NXxb+MawKT9ggtoG?=
 =?us-ascii?Q?uKC+Y4VCvcqai+fkcAWPb0ihr1ICWv+CS1XtUOOU0VDka7zzg5Za7ktX+zCE?=
 =?us-ascii?Q?awYgizdPfxAREp7I0XXLv4UOZQkKpLc+mA/77h1+34v7dR0S8VGjEGNGhmjJ?=
 =?us-ascii?Q?wVEoFLGboBDmss2/t84m4Ys0TyfqFLZQOyWZcjeEZVUGtVOXUFRTkxvCEsiB?=
 =?us-ascii?Q?eSXdG1Zib5kDHyTkt58mWb7yrVWgrqnbVL2z1vEOaP/k2spvPm2+HB8mIKdt?=
 =?us-ascii?Q?IVOxgcbRZxy6szyispVBAW4BvHUI9O0Rnzfu7C9GzeG5DweNF3x6v4mJwN0L?=
 =?us-ascii?Q?GCWaNDCyAgFDuDgZZDak3np7l2zXCNxXkGeZDVCxuJed1Tv+KtlcPi6kWQLN?=
 =?us-ascii?Q?NEzfcP6lQFe6yBtOjyGCtpE4vc3/kKcOtH5gL78iweEwvCxcGiZQLmxImHFx?=
 =?us-ascii?Q?/ixGt3+lL+g/lPyUqhLNKwxpbpfYlE+HbGBj2fxieHUazGDInur7oH1lIAqJ?=
 =?us-ascii?Q?mw5agKSvDCFa/RVU5aazq9Qf0dTRMFW5ZtDJfwwyXNiuk6S3EqoSJLtgIxTV?=
 =?us-ascii?Q?LdhYJEmgpjI31T6aPROYXlSHGOR+RLWeQHcIevSLVHNkFF0AuVAVi1AfrGzY?=
 =?us-ascii?Q?Mjw6j7GSsY1h2Q4v9sHmV6HsdwkgSHNFhwj0glyDbZqAu74Ja88h/zxeXXBN?=
 =?us-ascii?Q?icxJI8Cb2eYdSouzP/SKYJI2MDBOYvAfkQWspgRaqSDfMyV8ZYq3vp8rqCRs?=
 =?us-ascii?Q?pwys/XRcOKksjJprNikwR7VKDGSU+7U7DGtVjfcNGxs877r9ANnUXswdnaxU?=
 =?us-ascii?Q?b/eeb9472U4ZWUOBFMG6t0gqy8eAYuTJ0nolvZ7IArY60MsTAiweYFzW814B?=
 =?us-ascii?Q?Q00ZfCZ1nNYXeTFh8u0JRJLDSosmqeGm+hB4ACYKctU/vZf8RVXDXU0AHk+I?=
 =?us-ascii?Q?j2bAPyij0sdncDa4skGu++m4edSqmhVX83nA6aPvqJ5p2wHA86uWg0GWDb3d?=
 =?us-ascii?Q?pTAO2TIQSqRr+ypj6mI8oQuvsM4allAW+3v2NhA9xNhHkm5oLJ02IDh8X5de?=
 =?us-ascii?Q?mIhSXeEBZ8pjSqrTthyhMI/8CSlZzaSvwy/ASNPPf9LKSAKaFJZbfxXgiN/6?=
 =?us-ascii?Q?yWmlsX9jApEA3x7wfl8w8xrbph2UyF25laOTe7VjJm+UMB3aBt26SyU1hNt+?=
 =?us-ascii?Q?T0aistnyTK7El4TdTdqLv0s0x0qJ6Wo4JEeZ0cszM9uwaQR34Rqs+Nya7qlt?=
 =?us-ascii?Q?t2/szDrLJAJMOqUikB70Be9ec371Y466zHA4iNwQ7xuRNRVAq2KbkTtW0tj3?=
 =?us-ascii?Q?RBu4h+3xpmL7XajgfAvGJCBp/Y0ZnMwAf8iFHbmlbKfCV05FvVwQEoo2Yaxt?=
 =?us-ascii?Q?Q1AvbjOpBUROdne+PzB2ppDi4DP5hEUBYjPGteUnx31xek/yst45UWHu6rQ7?=
 =?us-ascii?Q?f/Q3eQPKFQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cc333f-4dfc-4f68-1686-08da455aeefa
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 12:16:48.6180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcrtjuQ+XJDmMiuBhpvI4K/WZfjc/bNvheGEKEwMfmlLjJYV0nqogXnO/OsF+0j8KdAldIwRvDsn+p5px+L1IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2476

On 26.05.2022 13:11, Roger Pau Monne wrote:
> Add support for enabling Bus Lock Detection on Intel systems.  Such
> detection works by triggering a vmexit, which ought to be enough of a
> pause to prevent a guest from abusing of the Bus Lock.
>=20
> Add an extra Xen perf counter to track the number of Bus Locks detected.
> This is done because Bus Locks can also be reported by setting the bit
> 26 in the exit reason field, so also account for those.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

This implements just the VMexit part of the feature - maybe the
title wants to reflect that? The vmx: tag could also mean there
is exposure to guests included for the #DB part of the feature.

Jan


