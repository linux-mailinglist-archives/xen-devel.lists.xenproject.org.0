Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64594F631C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299998.511430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7d7-0003xp-Hs; Wed, 06 Apr 2022 15:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299998.511430; Wed, 06 Apr 2022 15:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7d7-0003vU-Dp; Wed, 06 Apr 2022 15:31:33 +0000
Received: by outflank-mailman (input) for mailman id 299998;
 Wed, 06 Apr 2022 15:31:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc7d6-0003vO-6q
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:31:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2105ff0-b5be-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 17:31:31 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-4931haeeNx-4OmVM12yX3w-1; Wed, 06 Apr 2022 17:31:26 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5191.eurprd04.prod.outlook.com (2603:10a6:20b:1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 15:31:25 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 15:31:25 +0000
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
X-Inumbo-ID: a2105ff0-b5be-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649259090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ny27UbdDTxOh416l+xnnH3q4ps1yqQg+XobhjMdOicM=;
	b=LD5Jp9+Y9G5hp/MP7SaH6SadyoUAfhIUjaXJ3ZyPeHD0ZfNLtrssekRABOrk74Xf4t86sl
	tGGuE/OSqa2QyamxDPJTO73CkcNChJOSV7YumdmbkRsLuOiX0wjpDlRGeS5JnCLoq9RtCf
	7B29V1Yqim9urUySjqsm7iKyv21opgY=
X-MC-Unique: 4931haeeNx-4OmVM12yX3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Azttpu6zgY9wXy9kSRBAV34A4ClI4Dj9iof7q1GboaJigWwC0yZaL65Y478VDXXOY3QvGsW3JFGmigMZ7xVaXNyoKN83Dly0QNrVWihJEWmiLcqdXbr4uYCYRobJuD9y2r3lC0ZTDOrFsQuXbm/OnkI8IDxd6HheI2Hd2t4r3lVStJsxsrA8BB0yYWbterzj+Vjp7oZL5sxitPjbOPT54drs6f206TEEqhAEBYz979f9/W5MM3hLuojDRSgCB20+VrP+nMVGk4O28WCq1sQFCk88DdavOrBep2qFPiOR94PV+lhm6oP/PZbGsvkzVHgog9qSil5yuRw50BL0+Yq5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQdpJ0VMc9SRfY2HnOWzylGnWbVgiwJi8Dx+yrakyaQ=;
 b=KfUAKDJ07GSCiSPDCTDGAyT28yUZAr9x0El8tZLkCopEVBhI5Cw9cEZPfncVEmHS0QzQ7yiThgSa3sZIZXTvaF55EHqFPE1UY+F9YjrcIvswKHRTkAcUKmGr9XkrWWmlwc/og8KrwyRAvqCzDKa8A786/c626WYZT2OoWt8dqSCjDvt/dOQrYBp/KXsfGHGyKfhtLbDyPNkL0C9jKWTp9aCXlQhgF8E/VE9iIT3CTLCclMssVN0FgSZrhDONnubj/cqtV8NegE2/u9Fxx7XoKS/4y5TLY+YJSO+sBDMvutkfq9ijv6vSZ8EJGoXQnite0ynVrm/2kPsV90RY7oWHAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ebd90da-f7f7-fb14-4809-25202f200d77@suse.com>
Date: Wed, 6 Apr 2022 17:31:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] platform/cpufreq: add public defines for
 CPUFREQ_SHARED_TYPE_
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220406151645.32827-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220406151645.32827-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0003.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 042586b1-b32b-479c-95a0-08da17e282d2
X-MS-TrafficTypeDiagnostic: AM6PR04MB5191:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB51916FBB3E2DEEB1DA9D1781B3E79@AM6PR04MB5191.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+zWvWgiGGC1pk0yVW4V+GyJ/88w9/JYD+05AiQTl9BIGeqqWqtOyMSLEqSdDJqIbdogRN1+2HGpNebp3i0NEwHMEZPGql8Mr/exKCLE74w27pSNqw6xgZRJCVqYfpfvNsgghcXrE9XG90r1AJ3tA2xFp+ce9T5sVSJ3fg+8SKTGBp2aU0Bcs8v3kXsWSpb0y8wcRyxoNyep5MYtDontHkO5if97CGaxieyWN2UY/R0wLc0QqR7N9NTp8M7E+b29EHbWv32dDvflAbiLTPqCfmNockrvfQ9focZG+FZSqaC4c6U14WIdTLeL0Wpt8tbNG8O0hBlBd8viMfp82fqxyD5rg/O+RKD8icyT1AtHiXNnLHBbVPgm9VvNfAqA9kyQrbSJwVU4vnAhPC6tVhjvZWErtZkU00UIELl9LMPYTITAR/cA21wUXD+7gL4cOqiT4nwjKYP6m2dWnFD7rpGgkq22Ukk7vMrLZrWxhOmoWNsT+54+saEnNj6QKZs319i2OZKBbc+8n5lNF/5Nh75WC+bewcRzVRqGFcL7IY1Zn6z1gUbYNaAmRgNrYAhB2dem9XF5qLyaBbfvxtbrugLoXr8TK1kN9ne4j3coAGeXew9i2NtpjQGuCSlRs5bj/Nlg3n+OkFOl0aul7XlUw6GiGN3TwvRu5iU4ekjrnRtdAlB5P2+TSy5N2v2Fr09j6RXiNzT+/YoDZmzbcMsNGbM/1ee6bgbDXgRkdlhVIC2tbgkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66476007)(66946007)(5660300002)(6666004)(8676002)(2616005)(6512007)(6506007)(4326008)(38100700002)(53546011)(508600001)(83380400001)(86362001)(31696002)(316002)(26005)(186003)(6486002)(36756003)(6916009)(31686004)(54906003)(8936002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ehyWHwt2xy0lPe1B3UkcKqsK6H0YRSYo1cKLAI8hboCCi7OWRl7Fi40R+1cx?=
 =?us-ascii?Q?4ru16l2LCsYZw0L6guh0BIaOCBrhbdt7uR1gOZGiuB9Uh+FQVaiXdaIj13eo?=
 =?us-ascii?Q?FcFcUZ9aK8dZPEUwTTDbycK2+XM5P3ASCEeot1f6Wf+63ylwOTon80tdJXXh?=
 =?us-ascii?Q?WiF7CiknmGOcq0P/qNof6Z6ujNchSxxzoDD3vcyPi6Y+RRBNRioanSyX/e/o?=
 =?us-ascii?Q?1X1oZ1NxLzDHV+H3xb0bTaTMqW6VbJKCHCP5NOyKJ8V3OhA/EtJdhGYPtRiA?=
 =?us-ascii?Q?2N8B3Po0HwNFMtmmUnKdSK5xlq3I7ig6/iK8wffa2H5szH9Qw60jPJ+Ig6bj?=
 =?us-ascii?Q?g4rtBS1QYK7XPWjRPjmT7rCKagPcv88y1qDKBUnqkBAo3SXS7YQIChgGCExA?=
 =?us-ascii?Q?NE/yFs7ZyV6f04OwSXz7ZFAel/tXqs7GjEL1Ik/fiGqvtniEVj7kzzM3Lhkd?=
 =?us-ascii?Q?DODhk6lAGjxmvRMNy+VVngw2kik46NhOBASOIOqsGxfp2TM8zwEkVNPeolHg?=
 =?us-ascii?Q?OYjgiea8FsiQsQ03Jtz2PYdMCQ/idL/lIC8hcfd+1efZhO/pX8cxNNhE3jEo?=
 =?us-ascii?Q?tQ0DUOb92DnMVtEmnlndKLTrUQX2TrNO++CPw6roYyxZi4fFmgZuRPLA1D8c?=
 =?us-ascii?Q?IvrcZPmdbuDsLMq8zQEUClUJLrRZUTaL13do23akDfJ9MAIRLi6W6qABTjwY?=
 =?us-ascii?Q?UMFI/LtOpBlPnr0VJcaOPpLnPrtVcSrCmXmYRYlK62NmZnwoCWJyfDrEqGAw?=
 =?us-ascii?Q?i7aazmoVLJPtGOOYbFm+ZsxUOfvFhFt6xuy8zdbXigVa4MJJkxj0EB5rWMpy?=
 =?us-ascii?Q?2K8zLepfCg422HqYsLm02f7+jraF+OyLjhpR8EagLPPjRHhP85Ogtmeq15uQ?=
 =?us-ascii?Q?nVrbIvwTLxdfAkhFk2WR/6xYEDfMUh5iaPoJazfeNarRCDtUqFBUeNYCOzyj?=
 =?us-ascii?Q?4UofWNJCtRR+/1wr/ef+Ezed7b3/wPPtrqVih9epbAMAGeyjz8SbQhBRQYMG?=
 =?us-ascii?Q?IAuqFRPuIN8MW2QZjzEr+/pXNZlHJ41fAw3NwIfxIV4DRTlr9xujE1XehdX0?=
 =?us-ascii?Q?U3NBWFwTYtBJOmtX9gyT318XFaJX8m6/cFCDtJxsPuObeq/I1vSU9SxZE08p?=
 =?us-ascii?Q?0hWugUtM78jrc+iXNmMGXKYuDQXnKhgyAB5R7Bcfmzxw8sbxgBHdi/GOYDcy?=
 =?us-ascii?Q?/DWpmLRjmIunIJw8lp/pW9C7O5TRXjSUNLLlgGUxvyltpmnEbQxqdu+KZMLR?=
 =?us-ascii?Q?tWvKb2xrNar2ifBNoGaeOztCG4I1quFzyyn59JYAZGgoKL9h5D/g60SgMv8v?=
 =?us-ascii?Q?rYKqLXpZJnJToP7jQUvnWQL6I40jR3b7op+rv/Km4ZTA/A5AVYTZcP3ePMRE?=
 =?us-ascii?Q?URDezQJVsxn0lFyFP0DmibAHsM/9yGCWtXP7ZTwIgMQ6ku6RbmB55k9BnXan?=
 =?us-ascii?Q?4aWEBbiLFYosAiT8gztanHaNbU32qJQWbDlP5whVTRfw2kJRKlyBDeq0Nen4?=
 =?us-ascii?Q?xBodCi5ok5Y/PzCzg6bQTSLkkjK2y39UVsHJF3GugoUnAClCVIJwKi4PAndZ?=
 =?us-ascii?Q?KyfRybVR2ULkywzQ/9HaDcrSLEVLQsKPIX5pLFl85vAvD+SIbmjLq7ScSTyF?=
 =?us-ascii?Q?HMdgaumKCVlWlKwRWf9GEpCdNYrGVfsyCCwE6w78RGezU3XJxg1dUUeaHpa8?=
 =?us-ascii?Q?D21JUrihJKmEYzSMCYmueG46iXRI44Wm4qVGkqnqUKB4C3LMaRPHDtETZM50?=
 =?us-ascii?Q?yAAhEZps6g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042586b1-b32b-479c-95a0-08da17e282d2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:31:25.2326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEN2uFpKUhQCe4MsumTF83ekq7FIbVerK0evakr1WETjiF/YMpOGK7OnwP4yk0947dMvKx4tNCkcp9pPAsjwYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5191

On 06.04.2022 17:16, Roger Pau Monne wrote:
> The values set in the shared_type field of xen_processor_performance
> have so far relied on Xen and Linux having the same
> CPUFREQ_SHARED_TYPE_ defines, as those have never been part of the
> public interface.
>=20
> Formalize by adding the defines for the allowed values in the public
> header, while renaming them to use the XEN_PERF_SHARED_TYPE_ prefix
> for clarity.
>=20
> Fixes: 2fa7bee0a0 ('Get ACPI Px from dom0 and choose Px controller')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> I wonder if we want to keep the CPUFREQ_SHARED_TYPE_ defines for
> internal usage (and define them based on XEN_PERF_SHARED_TYPE_) in
> case we need to pick up changes from Linux.

I think that would be desirable, also to limit code churn by this change.

> --- a/xen/include/public/platform.h
> +++ b/xen/include/public/platform.h
> @@ -465,7 +465,11 @@ struct xen_processor_performance {
>      uint32_t state_count;     /* total available performance states */
>      XEN_GUEST_HANDLE(xen_processor_px_t) states;
>      struct xen_psd_package domain_info;
> -    uint32_t shared_type;     /* coordination type of this processor */
> +    /* Coordination type of this processor */
> +#define XEN_PERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
> +#define XEN_PERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set fre=
q */
> +#define XEN_PERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependen=
t CPU */

While the names may then become a little long, I think it would be
relevant to have "processor" (or maybe "CPU") in the names, to have
a better match with struct xen_processor_performance. Also I'm not
sure you want to define these inside the struct - they're
supposedly suitable for Px, Cx, and Tx aiui (just like the underlying
ACPI constants are).

Jan


