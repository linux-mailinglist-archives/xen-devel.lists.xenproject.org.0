Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C5F4F7A40
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 10:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300531.512667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNp3-0006z1-Ez; Thu, 07 Apr 2022 08:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300531.512667; Thu, 07 Apr 2022 08:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNp3-0006wg-AR; Thu, 07 Apr 2022 08:48:57 +0000
Received: by outflank-mailman (input) for mailman id 300531;
 Thu, 07 Apr 2022 08:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncNp1-0006wa-RV
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 08:48:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e33d50e-b64f-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 10:48:54 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-Gc9rv6lSOmOKvtRbTMFJSQ-1; Thu, 07 Apr 2022 10:48:53 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 08:48:52 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 08:48:52 +0000
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
X-Inumbo-ID: 8e33d50e-b64f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649321334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbsBrv7YATuJa9XVFRtUNuu/TqIuZ4vHMNX4wjJyXMU=;
	b=mpNeSyyv0ZiYDu53BsQsbvYgDV2bcDuG00wCEG8cmLK7pzN9wo+IeFYGka1QK+Ne1ATrMi
	5oKGSodn/mWfP0GwkANWWKO1iLTtTnb6ziclMFH1lsk2EchapHaVapx4mViog5ko7JNbel
	HvpdtfJVLNfIni8eS945MLf6wxNLfOo=
X-MC-Unique: Gc9rv6lSOmOKvtRbTMFJSQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh8LrjGgeGzZhSH2YDxvoDkvDCm7IsJoK49OgIKeF5Q3JBrI88pbznsRX5vP5ARG5vYYiPb2Yv3B59PLCIS5It0AqlmCCKtSRybGM6QhAFlL4MMW7rwkO5opTlRH1/BFJF0L89/sSMzJdKhKzzW2zHJI7il00uWuLP8eKUkwdnEfK79+RdB/2980uaGvMT8wptIxM303CGc3ncUSAmC9RMPOagzkxPk6cQAO8bgaAoUj6zkqtzlEf31RLEJiLQ3qMw8+IKe0fcEDSOSVTLDIZtIFSueAkKe4J8wfWrjBLoeXE4jU2SciZzD57zeNMd8jF5sfU33tq6cIPN3KTZ1CUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNz4rY8TQQ7ymti0pAQe70QDxUDiKhQhvx6bvBnXNRw=;
 b=WimmknB5p984O7vBD4m/kbxupTeCPk6HJmdSCm2BneUtKWm4d5n55oK/FZvzuideu0qS5AFm1bH1LjyKYkbVwpL0Oe/vvUqymKxtfGr2nG6uQ4QWvtIZiKSRfrlG+ZliA3pMUBqAxoH78QBQv/FHEkNGyqLks0Np4jH3n7/qNsYzlGn47Yb1gArt+wIG7VEbYMFGYaVyBbH8KeLd+/yZKHyW8+NuqW/GLGeFWbmB0X7Q5dA9lo1iZL1Cu76hDoyei+Sc2O+9Jid1OO8P4s4ZYKNaxAm/WSWYebFUxjT1yJs1GoQtWtecV0JzWNVN0bIgxw5BfGCTtDYuz0nHmXsDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d05e311-d466-b729-ebd6-178554f67872@suse.com>
Date: Thu, 7 Apr 2022 10:48:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] platform/cpufreq: add public defines for
 CPUFREQ_SHARED_TYPE_
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220407081828.38747-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220407081828.38747-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0182.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50873b2c-933a-4472-ea65-08da18737105
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB846570DBD42142331B35B646B3E69@AS8PR04MB8465.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EPnPF76wi6ZuGiKtTONTIR8zjMOx+fJCxOLvLBJMTvpKNQnpkw03oqOwnNJMJR7+GrH8arLK6wZjaYzRqIhmTD2xXG61bgrt2AOE1QbxoCNMmP2x1hkmtSMXrb1cThTS5nefyfJBLXYgzq8xjN/6lCA/4ayabgcRXI4uD7yuuHu0bcbjUkXViybWB4kA2uJnQrtLxhnHrTBxs1Asz1DXUmA3ulxny8vFSwof8ZSdunZr2CnzaNiHWvr0YuiHU2pEEKvVeKCOCnlwSo5+oWLIwwdDNT2QMgsy4hM9ikUTKT7W4RgXF9QczzODfg6zR3nMQRqPekRiXOkhcsWXjBp29pM5mJC06JKNZydb8vhBHoDhrTYI3vzgemz2EKWmK4kB14BgWrT1cjzGTT7duOhvDxOnUwKn0SwXVFn49KtSQ1QdDEZqL1AyeyshsWVGTgNQeg1EvjxreeMWvHF28MS45EbwN8+dZH/8ZIOnd/mN5q54D6LfvS865U2Jmqppn3X88GLjTZM1YJeTNIN0YbmL2LmvmemBy0ByP5V7/sUjRNoWT8rbXqaGZp4qvqWvwK8FzWwnYFPG8McVS/E/c0ZGxGpSNI6GwIQ7wJrhBlZZhyUxTx2iYQZkavqRbhhn+VbCKRdrRvsvdDRwmagIQwNgTSglLWpY9KXV6i6N8FkxBMVai66/BiShbmG/IbN7aku6qlBG/QK1prvT3JfMHGqofaxu55bbkU4lvRZbIIXXtNNrfFTNwBDcUCKnegdOAIIv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2616005)(6916009)(54906003)(6506007)(53546011)(316002)(186003)(26005)(31686004)(36756003)(31696002)(8676002)(4326008)(83380400001)(38100700002)(508600001)(5660300002)(2906002)(86362001)(8936002)(6486002)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VdBSsM6Zt6TNvsRmaH478qb4cyxC+IjwjE3ymcA7+vNiB846QWiHdy4VCwBi?=
 =?us-ascii?Q?qDvAjvlOQQ+aDhZb9zVKuaZ4b/6L2epzIHVo/ma4TT4K8EErFs4m1Ay1D+84?=
 =?us-ascii?Q?pnxPKoHYBiYiK74dbWgED/G9x7fBpiHQteGpT0XRYV3Pn3hcgpI697lB5cyq?=
 =?us-ascii?Q?IcgRh314Fc1GNU+NGCO0xISBJLeIYG1OckKwVM7Wxo3EeokgyVQ4WT3jjgBf?=
 =?us-ascii?Q?SdVBWUpN/C8A0MBA1mS+1mTjy6uAZTliWxrAMShtEeJALHeo0AdzcSsr2xF1?=
 =?us-ascii?Q?NWFGzS9qCgYBts/Eyjv8ZqBh54ASLe3BqW6Kpw2zjz7W7JFQl6Nfw/Bp+qnl?=
 =?us-ascii?Q?hq6q1xj/RyRVziZOk0gUDicKmVD9q72tpjE0Qf3OVFBPMfUKGXdryul6ohM4?=
 =?us-ascii?Q?pbZ7B2uRwFvWvJ3CSkuxOmFIE1wF21di9zyblfmu02Y7TknPKEm8MUGwfSWD?=
 =?us-ascii?Q?NiEXiZHoqxITZVt0bhtIiLQnRlVEt8atAIJBk8rM3vUh3cFuG7s0jfUXMuXH?=
 =?us-ascii?Q?u8f9u/GpEhtyWF+Z29fGe52p+aDwjgQdyt+UJDkCnzyt0tnKLyaWXAvLR9Ti?=
 =?us-ascii?Q?wQVrJoiWJAnRl/1Tt1MFhwBeUfKGy8yh/pDKind4hyGiF527URB2m4b+ZCLw?=
 =?us-ascii?Q?L0SsigWVrbaEtFGmteg1jEj4bpfrDnMNWDXsYIOrJZMi5XPGALJ+WTPcEigb?=
 =?us-ascii?Q?/eJrfpX7deU1OZ2N7YiHQd+QcMIM8SdZ8xjHn8X7/5JxbqV4QVsDY5j8jVko?=
 =?us-ascii?Q?pt5mKtIS/2eLoZAzw9/l9BWRa9hM4QZuSfO4gAqifhrwJUGzPWE4s2EdEZU3?=
 =?us-ascii?Q?kqmvjInWLGJ1xVYTLUIvS4F4kUeMC0OLoWcmVLslAsrO5T+pGQoA3NjjLTHm?=
 =?us-ascii?Q?dVYFON/vmqaGPA3WrwtJGYT4lkSsywlRK/7B4I0ksHabSY7LRKG/ZK8P1gBB?=
 =?us-ascii?Q?xabTHuYKAg/2jd/KEN1xiRfd591NtV8Z07w+sTsiiRAwRaTl17MWhSECCaGq?=
 =?us-ascii?Q?Ay5prT/ehIYgNx3Wi1M4paML0vuTOBBP8rfzMi4/hNNKLbW8e/O8u08wQaXd?=
 =?us-ascii?Q?BzZYfuat92pkknH8XWRnQQzfwXTlvKvXFECRyZpMMBdjZHnzr7xPuQhu6xPz?=
 =?us-ascii?Q?kpXYNbv3oGU+fRXHBBPoUMeMnqXmGuvbEaQqkzNmY+vKlq6SmPeWMWhGlxcu?=
 =?us-ascii?Q?Q+aGhLvdJca2jjFfMBCEodIDWZpAyCh25QYvt8ibGWtFOtEDJUbJX5a5/iCG?=
 =?us-ascii?Q?6i78hi8/EWrLBnSWrEk/UfmnRpSru/44oLmSjiKISaabTcmJ42+RREHEYV4/?=
 =?us-ascii?Q?Ex3fCJo+D/UOMpW5ypvgYlZKWFcJleU+Y9d1hGOOR9pieVqlswLPWVg3ZkdL?=
 =?us-ascii?Q?HEMfV8Er0PZBPbxMlhklUN+KrPM4JS6Q4SlTH1cLWuyAlWeN2o/2Kb378nCD?=
 =?us-ascii?Q?aq5X16f/FGeQ7aMS4cMDlOERJrII3CIW0dnYuflB7B8f/GfolDwkLPJ5KYvO?=
 =?us-ascii?Q?9YuAv0tULlDQaeueijXa4Q3j4/34DjJoF0gIqj0YjtDz8pSShr4l1XTeQkX2?=
 =?us-ascii?Q?sRxOuorTO9iXUcm+j1t/oFGs/XQFEaQK2QF6f4+3JNXbgmP8vINtuZJWYwTn?=
 =?us-ascii?Q?kmV60ZeOd6QqyPWON1xBPokGCdwJR9UnWqdDfmXq+uCe7ObtG3zReXnMdeQm?=
 =?us-ascii?Q?iwF5JbnbA84dnBDQsN+yb6dNBfu+TejSGRXJi0By2B5OOmnk/j2LtZP3XM8p?=
 =?us-ascii?Q?tvOh3qDgPg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50873b2c-933a-4472-ea65-08da18737105
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 08:48:52.3958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ywYV9iXyANpX4+azlYtqxgQmCmcLCT6zdmwX2nUJXvVqIWPewzVea8G0ncQ5v4C2peW5IXk4Ey6GHeo8wL25A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8465

On 07.04.2022 10:18, Roger Pau Monne wrote:
> The values set in the shared_type field of xen_processor_performance
> have so far relied on Xen and Linux having the same
> CPUFREQ_SHARED_TYPE_ defines, as those have never been part of the
> public interface.
>=20
> Formalize by adding the defines for the allowed values in the public
> header, while renaming them to use the XEN_CPUPERF_SHARED_TYPE_ prefix
> for clarity.
>=20
> Set the Xen internal defines for CPUFREQ_SHARED_TYPE_ using the newly
> introduced XEN_CPUPERF_SHARED_TYPE_ public defines in order to avoid
> unnecessary code churn.  While there also drop
> CPUFREQ_SHARED_TYPE_NONE as it's unused.
>=20
> Fixes: 2fa7bee0a0 ('Get ACPI Px from dom0 and choose Px controller')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark:

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -78,10 +78,9 @@ DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_p=
olicy);
>  extern int __cpufreq_set_policy(struct cpufreq_policy *data,
>                                  struct cpufreq_policy *policy);
> =20
> -#define CPUFREQ_SHARED_TYPE_NONE (0) /* None */

I realize this is unused, but do we really want/need to drop this?
I think it is used implicitly right now by assuming the value would
be zero; this could do with making explicit, in which case we'd
need the #define.

Jan


