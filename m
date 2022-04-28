Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7403251329C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 13:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316468.535402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk2Ub-0005KE-BX; Thu, 28 Apr 2022 11:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316468.535402; Thu, 28 Apr 2022 11:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk2Ub-0005IP-7y; Thu, 28 Apr 2022 11:39:29 +0000
Received: by outflank-mailman (input) for mailman id 316468;
 Thu, 28 Apr 2022 11:39:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nk2UZ-0005IJ-Dw
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 11:39:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db4340e8-c6e7-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 13:39:26 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-c_HwlbJ1NoSLqIeaJzva5Q-1; Thu, 28 Apr 2022 13:39:24 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8968.eurprd04.prod.outlook.com (2603:10a6:10:2e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23; Thu, 28 Apr
 2022 11:39:23 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 11:39:23 +0000
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
X-Inumbo-ID: db4340e8-c6e7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651145965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JDiPNos+68/9J4493kepJtR+PFwigh4PUSUR13yHyVI=;
	b=FeRGHM+IdGN8fegHx5bdQRMOaTH/07Iaj9pAe/kQ6Kn3S6ulNqRYOcAsVG7t/B3CuO1qum
	n0VkGE3t/HeJzne38Ij3ljc4XIp2iPhp6H5VPXQNH2gIKj1XvBYszdxoAr07W2Uc2i/se3
	3Q7F+WI7fGJ+bqLgfsNFS/m0xNUBtx4=
X-MC-Unique: c_HwlbJ1NoSLqIeaJzva5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QokDpTDAwlrAIyUOIyNszEioRRRW8NS8CKo2Bka8ljK/eKvs1mSdwbP6Cb5O5WID8Vq/iP75kCQTYDL13Ma17Mq2yQroAujVBny/SbN586HTWx4rZAKXGbFnXtucqBvSZhHo9wnnKRiq1YnngdFyqEHhXtcZjXiy1K1G0hr86HdF0UIdmJuzCXm7OX0PwM3lqIwZydXNIyJYpPVLXcUu7Q1LsgsJ+pNIECshcTf7NJedWsi1yTwgZQO2s+2QKKAkxDH0ykYLzvjMRnlguocY6Ng9dapNXjrCv31plBWEG6WoC5ZdR3QgEmIyPnMrQr2xRmo1SHLu++9REgL8zuwkmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALl+eZdq6+PE9Lary6hVHXdG015SneK6tZ0GF3LsgOk=;
 b=GigG5yzrF6RYJg1nX0rd1RYOsa3uDzy00ttMxPumVKQchNzxcHktH2buJfMSAJzK/q/0P3S4g1tcInPJDllxdcempLp6Ft0ohvT8J+QyHQGSWwRI0iZUi+RyuCDDloUt0Rk+SLanUG6dNecBpOUYt0hTqS2CKRntD/Rxm7JOa0Mk5X/qRkUkcqDgfsAEnI/yAyFzWNHyznfCCGyrqRbvBVazAP2lie70OMyP7OPQhahMhH3YDRYBKFp3BlwxxmbKaSGXLfPpFdqg+N8W+v8+ocY0G87XwXWRmKOrW23Tf84UXO1ePkPyirnmllmgb6SZC6Otlf4BMmCn85mMa4rGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3aef3bfd-f873-ef44-9503-46ed89eb587f@suse.com>
Date: Thu, 28 Apr 2022 13:39:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] x86/msr: handle reads to MSR_P5_MC_{ADDR,TYPE}
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Steffen Einsle <einsle@phptrix.de>, xen-devel@lists.xenproject.org
References: <20220428112023.93195-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220428112023.93195-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0012.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0fac28a-ec03-439e-1909-08da290bbde4
X-MS-TrafficTypeDiagnostic: DU2PR04MB8968:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8968889A974D8225380158A4B3FD9@DU2PR04MB8968.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	od0v6P/qhdyAjcyM5zuegylecafaAJXN+vZPF5y8kWUUbvr/NS+eIypN5TRScp3qID2cIxHAWarDjINgnL25u3YfPa94puY2LVcq56PUGcCTjmRTyU7415hiyrQG0v+89kLWhtHUqcAoz2CPoVUCPkBD/4V8WGC7MfyT9536/L5/SChUGgYFnpu4vec5CulACofoF1aVoaK31y/f/3qnB/5OfNnjIDX8FEAEKM/CRUgYF4HKt5K0hDKmw4nvNTDHKQO3I5Rc+NlTQPwV0SkJXM567QigIEeu/nUu0B9LnkUg447wfJ2f8CjIzBinldrtUiI/78I9WCHbhN4Y1IHVf/s95e3Aks29W9r4TBxQUjQ0fNpK2Rr+3++QpqFi4IvLZ2eB2AXU1sKjxiZ5i6m9xQpKxgb9mFJQMvbLuCxgU5fVns/yzKEmeWs9Wy2OMUBYbv6LY8wvZ6xKoiCQ2Igj7FjfxSDafllgbgXeybZim/ci4YCdy5nSMqXKv8gTD8s/Sh84caZtp2OWY6+Ru/huO2E61HB15Yq4G0/PLXk/n3TcBT2eVIovPw6LaWOI+DC4dWXrEBOk4wVOX6AudVcCD4CX3+BJ0ACzYCYV0Zs0lEAEGi0+/Q+KHqISRFFKwh6OiEh+cGJFWrmSUm3IA7WPnAFzfstoKsMwoHqD7bfgJaz6bfdOAIqO3j1Vc2wZs81iYHnKSRS9ZfRwXx+aT+z0bQzfz0IS5NwLlSCHK+AuyUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(36756003)(186003)(6512007)(8676002)(66476007)(66556008)(66946007)(6506007)(2906002)(5660300002)(2616005)(53546011)(31686004)(508600001)(54906003)(6916009)(6486002)(31696002)(4744005)(86362001)(316002)(38100700002)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YiQF9/pC/6OsXNuTrFd8E7WIwAnHGTxrDP0FCGMBDKVucUjwrtHkB7y0iRAR?=
 =?us-ascii?Q?dxEXOidAwOphBKp9KuHm0GQu69Wxx6aFmoP7PKUzbr0C770O84gp+e5dA94U?=
 =?us-ascii?Q?AGOlxVe9cfvXZBABGWnjDjzix2v7I8R589joHt3laY44NYfTgD6utT8E0UlY?=
 =?us-ascii?Q?ZKAfsGtU2rssanNc+8lIKdk6N+Ydg5sYx+y8PpB0AzjNz70pcIKFkMI+kfEV?=
 =?us-ascii?Q?qM3cm2K/c/m8ul+1+y/TMPbxjQQ3NOjnEGMIFt9nnC6kyq9N2d1WnbyKnPN3?=
 =?us-ascii?Q?qnRGucFxUweI0z5wsELxMEcOdjqYjVVprIuQE/MJsOflIeS3j+vqinCryQf+?=
 =?us-ascii?Q?rIVynaIzVVjWdlp7OvqA9FyqQF850vLlzndBgMt5gTwSr3Pj7e4NqVZ6bexJ?=
 =?us-ascii?Q?D7kn71tzweLWhehfpXRs+lBub0KwElynCaSWNd0yl3qpLHi6+au7L7q9frqS?=
 =?us-ascii?Q?ZojrTr484dOthZ8xAv6saby2St8MB5+o603cLerAXj5sspeuM/LHIZSbXNBB?=
 =?us-ascii?Q?Zp5lE+YPJVoBOJPbB+IcVdbUydA59yxPtOc8YnmiUepXrA80gr1xT9JTyB5R?=
 =?us-ascii?Q?MzLTG4qD1WVuCbMwgi3hmLHQV1/ZpSKHkBigvJGpwKiiWLi9b5x1417U073P?=
 =?us-ascii?Q?j3M49jLO/VT7B6uQgHrQCQiLRJBZ9KjTLtQzqo9Y4gk/FgY+mBYNd+5M81Q7?=
 =?us-ascii?Q?BBFx813SBKrgmvEcEqMj2mKzySsyh4aCtkmM7SZHgj6lIGSqqX6fp6nDKxNd?=
 =?us-ascii?Q?cHOfsNmV0AZx6jKWW12T9q5qVWsAeh4/b6M0B51mGyAjQehjge2eZzE6iHli?=
 =?us-ascii?Q?QIDKZXO/2oJH7nislb7I1HFhuqrakadjVijeD0IbStPCrEWJR7PyskAw3Ec/?=
 =?us-ascii?Q?zIAi8pP4aM3RwvUuDHCAQZG0r34MVtIh5sLKbKAxutTg0N5ENfcYSzG+iTb9?=
 =?us-ascii?Q?uHi/p7vnu2nxemI0U/LLLB5O9E3iV1ECH5bcJpB3jnpPfRA7BsoHMZCzpf9X?=
 =?us-ascii?Q?BYysYI2cRWlUmCpF9+qa8Q+8nqCR02Z86ZRD+/IZ7B8M8Zv7WA4h18liE3Gi?=
 =?us-ascii?Q?OAxIW5cM5JG+Me/s+n03OMkxeorkMi3cYe+utAAJLjTtEWwmcqwSuJXk8w/R?=
 =?us-ascii?Q?0H0Vswj1dWU+wmmGzqGaQ8CAcCb0rS3xc4SYULBJoW4J/0ZFnUSBKNvNwKg+?=
 =?us-ascii?Q?KQ4hGyAt+gI9M+dLqBuTs8q+iplchoSKKm17JsVLdRq7B2rFd0+CqzFwRXrF?=
 =?us-ascii?Q?iBJg9vYJmIzzgq4I8gHVMnaLgdazXiJLVI7I0+ciUmo6/FahsczR4Z/pCWBc?=
 =?us-ascii?Q?ZvGSDEEDWUJCgAoMzH8NdR/pZo/ljWXi/F7UNdfjp1+hl9rhSUZpqgscpwkL?=
 =?us-ascii?Q?2pDxq/33xxs81+TEL5RUGCjGZWSgKcJZyPKFbwZPHHNVCQu+ZSKHK9HzZg1A?=
 =?us-ascii?Q?HonfmJEuPfMoqIWS0iM3Zc9ZFE08c7YFJVtjeNMSEFqrDgFv/xurfiMYeNOy?=
 =?us-ascii?Q?A4n8Mq3itCRwXPxKDkZrYfBM5GG6lsCh7q7vXFZ+S7wwi/kcpwDjClVMVIWL?=
 =?us-ascii?Q?XmrtNQX6u/h4q+xL8+P5RUiMnuNN5q55pclirVhDur6uGmcdiUXKnZUD4geb?=
 =?us-ascii?Q?I3TyH9dkh2h2K0Yix40YApBlQnL1RJpv1N4XWXtKac3h5HVR+u05JJLzvhUH?=
 =?us-ascii?Q?67giWW5412srwecq+7L+uo3QpWjSMikSXHwmwqaCo4IMAWaWq4ziTgs6Fakx?=
 =?us-ascii?Q?jLOIiekJBA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fac28a-ec03-439e-1909-08da290bbde4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 11:39:23.5130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3M6SXc90T+q/xNYv0HKMIlt9NlflNj+AgGlP64SW/E2Ioo479LPD0dAgUBZF5h6r1FlnLwCuVHOCJGRFI7o+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8968

On 28.04.2022 13:20, Roger Pau Monne wrote:
> Windows Server 2019 Essentials will unconditionally attempt to read
> P5_MC_ADDR MSR at boot and throw a BSOD if injected a #GP.
>=20
> Fix this by mapping MSR_P5_MC_{ADDR,TYPE} to
> MSR_IA32_MCi_{ADDR,STATUS}, as reported also done by hardware in Intel
> SDM "Mapping of the Pentium Processor Machine-Check Errors to the
> Machine-Check Architecture" section.
>=20
> Reported-by: Steffen Einsle <einsle@phptrix.de>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


