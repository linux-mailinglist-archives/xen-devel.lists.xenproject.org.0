Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CC5458ABB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228660.395726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp51b-0003JX-VB; Mon, 22 Nov 2021 08:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228660.395726; Mon, 22 Nov 2021 08:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp51b-0003HG-RK; Mon, 22 Nov 2021 08:50:07 +0000
Received: by outflank-mailman (input) for mailman id 228660;
 Mon, 22 Nov 2021 08:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp51a-0003DA-JN
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:50:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 300a55d9-4b71-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 09:50:05 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-MMOpLgeHPFaeFlExR5yLSw-1; Mon, 22 Nov 2021 09:50:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 08:50:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 08:50:02 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AS8PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:20b:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Mon, 22 Nov 2021 08:50:01 +0000
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
X-Inumbo-ID: 300a55d9-4b71-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637571005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLXDG116UV6WCFcGXVD88fa0nuwa1Bf9Q9aGqMySgco=;
	b=dwtCXBR0jHQBSZ7bo4OmLmaJAH3wiKaTKqn6Jz4esC8B5i5ydhpTq6BA8wAlElvBk8kl13
	QfKeqdYmT3v14mUWPmZt33QM1uCwNVJxVBYmBPW1o/d71CM3iYS73yorO0OXRtblkhyrOI
	w51nhgm5YLhtLV2SGVpuDbQ7TmvpNSo=
X-MC-Unique: MMOpLgeHPFaeFlExR5yLSw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvSVnLZD7cIpJsCmV8lnbs1UNn3O7fZTaY2gUtU16Wpw6WfpDIvZpXMxExi/2Xk9mvBhGNZdjOF9d46Fo0GFU86hpJMEByNHDOdoO1kXmjROxOQzUnGspIOw4pfZTzg6U7/Z2wkG5bJqSpvcDWWDOaCBqzENhOtetHCoqzHSDysaSGMszdTjX0LHP7D5JGfskknHp97Nf5A1yVrAvypm+hg5JRkVk4iwPA24TDWQGjgPIrTEzWI/AIrYCwYGIUeDYoNNIPQqW0vgyNJ8SAV0wPJpywsxISmDhWLAC9WpNu1L7hu5rGBGgDyjkFehhAvODS4xukY/sPmTIdFN/V7Q9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLXDG116UV6WCFcGXVD88fa0nuwa1Bf9Q9aGqMySgco=;
 b=gURK0C4rtYyntiJQX8aEAXDGD02fHyr8S6YdTU/AWXfskVQgpHkZ9M2jOgbJLrtKaMFiAGUSHU1QkVve3RB7lPomL/s7RYNP6eQbSX5M6zGa45wueCVg2UifYQWHzG1NONeS3pAqE+K2qjrqfOlG0zDysWm4tPlZXUF+da9kzmOH66aqJVeLrCl+W96djOamST+rTR7qyGvO8J/GGhqkqQ6cLvbfNyjhnQKXL9de33nthIEq3rxWV+xR6Ts7qCxkIfn/+glg/egqhB0jAgrv2w7Nj90F+gaWUl9cUNrH7Tw3o4Wb8DOqy3J6U3rquyeGpcR1izyrQEn7uOBZ4IlC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ccaf7ad-25b4-ff6e-7999-5c7838b4e77b@suse.com>
Date: Mon, 22 Nov 2021 09:50:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/5] x86/traps: Collect PERFC_exceptions stats for IST
 vectors too
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211119182106.14868-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd565bc2-98da-4581-90a9-08d9ad951275
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB435140E01C1A8369A6A6449DB39F9@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mI9vbIqtlDhHuxgG82wGZni/KIZzRyVctT7LoJJ8mp0E0qIolgDbfxUeOICNi5kGW4Hhh6nBnVJDHgwEKBBLo3jaSsR/QWFdaK15OsDlrg4eP9GaqDQJyP1y7p0tARMnq64TKUBGPqmiouh3W66cj4K1lTNmb3ioRDaTWayFPE3bjhrxaNh1EELos2qTUcov1l67w1WLfzxgmCQ6q8oKrYx+NrMqvL4YXENuqf+S5YsztHDVHsfowPipgMgLcv91gXck6ILvCc7GItHIpRcB84mfdF52dgrUm6j0mAFpEu5UVmWN9iKzblyWj9eo0e63DoHyY03M37m4U8NsHk3Apj2gFe6WwMU1h6HN3sA1ukson5hpJlJ4Qu67KQVtPoBvJpMCAj7j0wD82QSeZ/JKWTJSWcrdn2BtxhP+Yu3YivKOp3diEGgYtGpYxD10v3fesHb9irW/eBN6I+egyOSD22gydJiNakblRtF0SpVGIU9WKuMh2zi2S3bZc4fyrlnA9VpAqSoCj0p7t2uRaLEmBC81ApVhxo/6FCpWjxeV8y2e/6pSutUaCB5YQHIw6GQVWXbTN+/BtSFoIre4fGS9efGvIyW1Obolz5GRnuUOqK6vjiMbgntjgQZeUO5sY6xYqza9a3+kgfiZxzv7bhRP8YPg08RiXv4oKbqYnP3sJPINCexZKzPNLVKexKAcBfv8kJXcAD536hRmo9/EqyTBt/dkKdHNSk8c7JWL2/z/8qA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(31696002)(8936002)(2906002)(6486002)(66556008)(31686004)(66946007)(66476007)(38100700002)(53546011)(5660300002)(2616005)(4326008)(186003)(6916009)(86362001)(8676002)(316002)(508600001)(36756003)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlZZL28zTDU1ZVhNS3NmUmRyeW95b1RHWStUNkZOTHRxUFM0cE1jUW9xdjhU?=
 =?utf-8?B?ZERneDZLNWxmTytUZlJmQmlXU0V1eDQxcE13QVNLN0xsVEVBSUh1OWZ5RDYr?=
 =?utf-8?B?NXpxZWQwc2Vnc1A0NjFCcWJXeXpOaGo4L2d5VlRNai9xeDY4cW5ZUUxJWE5O?=
 =?utf-8?B?ZVppZnhnY1BmVHhwZndmcGxoUzFxdUk5MlREWFJlY2gxdVdWVnFCUjk2d0w0?=
 =?utf-8?B?SkE3MlpKNENJTU91bzB1NE0yelRDVUNzak9GZ081REJLRVVzV0wwMDlRRDdG?=
 =?utf-8?B?Rnl3dktPWnVKbEhNcVhKekRIcnFRQmxnV1FzdklpTWt1M3QzYXRGdy90TUpw?=
 =?utf-8?B?ZG5TN0hMQ05Ya1BNK3ViYUZBcVpOVXkrbWsveHlYSmUyZVBzZHFObHkvNDZa?=
 =?utf-8?B?ZnF2OU53aTJlbHhuclNXZHJobVV3QVlDVmJ0MytQNXlkYjR0SnJTUXp2WEpt?=
 =?utf-8?B?ZzU0UWVSazZQb2pXaGlvTWlMa21scnBuc2VJdlVQalFHdit4d1J6aS96cXRL?=
 =?utf-8?B?bThFSTcvSjRRZlFNOHE2dUVNTjhzL3A1M283OXVHZExmS1E5ZnBLVkRBM3pF?=
 =?utf-8?B?N05od2pneHdhNXlLQ21hMkh5VFF0SmUxM2xmQTBRbTNHdDFTNnNwRHdCMjZK?=
 =?utf-8?B?MzYySW90SmF3T3NaU3UrK21BdWRXZnkyTGd4djVucWVqQWFUYTlkN0paZlBN?=
 =?utf-8?B?MnlKYjRxOHFNRitNYUVkNG5FVFpNNHErYkFpWjZrMWNNM2NOUUNhaThYbDRH?=
 =?utf-8?B?Ni9FajE0YkRaK3hKTnRYMHlmbGpDQWNsMWlzYkl1QVgrNTR3ZXRXNUVDU0tz?=
 =?utf-8?B?bWFPQnJ4SFlmd0VYOXFaN1VvUzMwWVNNK2U3NVJ5KzU4OFFHTmx5Qmw1V2FT?=
 =?utf-8?B?ZlpNVyt2ZldyVHFWS1Y2Y0NMbS9yeEFZTDRGZVlMN1RKWnBhT0graGN6SFZL?=
 =?utf-8?B?b1NBSG5VQ3ZCNXZIeWVJSVl5REFoM2NOdTVvNlNMSEJJQTkzOFEyaDU5NnVN?=
 =?utf-8?B?RHJhU3R4M0tHUmYwVFRnWUtaUVBGTUpCNVRSVnpsYmtySVJzdGFJUHQ1VjBU?=
 =?utf-8?B?SjhMRjRZUFp2WHpxem1PajVvdmdMM255Mk83TDEyZkdnTmFRQTR4NmlsanNG?=
 =?utf-8?B?bGRrZzZJK05iUVFXMlR4cWVqaERuN3ZvNlZtalhXdlh5aUlHREVxNFVCOEcw?=
 =?utf-8?B?ZWRtYXVCdHFuTmpjT1ZpWThwVXZZakJ5VmdKU2toSm4zd200aGRIcFdYNVBL?=
 =?utf-8?B?UEVieDdwV0hSOUN3YnVob0dOVjlHcjkwaXdPd1FTUzViSXh5THdObkVvNk1V?=
 =?utf-8?B?UFpQWUN2ek93SU1sdjhoeGNFMlFScW84QzVzaXgxM3BvTVZSMVpjRGNFZ1dH?=
 =?utf-8?B?YkQ3aCtpUitxOENTSCtvdUQ2aGtlcjUzT2cza3FkMjhvVG8xU0p5WTErRjlm?=
 =?utf-8?B?U2wrYmNQKzlUWGR1aUNtZWZ0TGVSaXk4NDBPN3F5dW51TmJkYTI0ZHB4VkNF?=
 =?utf-8?B?TlhNaU05UmF6a3htc0ZaZzRjQzV6UkRIMGVya2FKUkRvM2xpRFJ1YlBIRVU3?=
 =?utf-8?B?UEFtdVNXMjRDS2dTMDBmSVR2Lzh0aTJzOHJIckhsNy8vTUZBVGJwR0w0ZzB3?=
 =?utf-8?B?MzhKcWludm9RUHE3NDgvT2lLSzZtdnZOUTFCdkdBd2ErWmhHUm5URzlIV0Ux?=
 =?utf-8?B?Sm5PY0pMYXJnZTZGTHlCd2NiWjhtenlnam9qTm9iQ3MyU1FvTVZDNzFUSnVN?=
 =?utf-8?B?SndzZ0g1Umt0R3V0VFpvMDJBQlE2VUVmTTVuQmljYlJ3VzQ2ZHUwWnQrK09G?=
 =?utf-8?B?VFR0Y3lDenN2Rkk5UlZPRjhHSkM1ZllzUXZ6dzk0T05tcVJwQ1hFL1VRdE5U?=
 =?utf-8?B?bFVHQmk2TnY5dFRaa0Rra21lSDlCYllyT0xIL2FSQmFnb00vYlRoMFJTcDdV?=
 =?utf-8?B?U2VqeFJTeHVrWkNISDhwOXo1Smg1RlR1RUhiRU9aODdhYUxyaTVScVZiZU1o?=
 =?utf-8?B?b3Iwd0ZnQUxnSW03ZWw3QXlFZ01PVDRGN0psTnY4OHhOT1h5RHZaaG45a3ZP?=
 =?utf-8?B?anlVSDRwL2duRmptUGdUdmo5TE03Vk5kUE9HcWcwbFJUVnlPN0Z5VnNmS29I?=
 =?utf-8?B?em9YYTY5aEdGSFhjbitHbXBGV2VMcjVIb05VMDhuNzF4V3hQYzVGRHY5dStZ?=
 =?utf-8?B?NGpaa2dOK3M0VExNUG1WMUtkZjhtVDNJUnRZT0ozcWhFejhoVmJXVVlxQk9u?=
 =?utf-8?Q?Hl/qDgyKiaShy2yEITsfZTAx2mD6R68khc9MPrW8ZI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd565bc2-98da-4581-90a9-08d9ad951275
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 08:50:02.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVh7yxXWRAbG2zBMUpbgy/xv9+S7P3Fr4uWaz/r6xnGu0PG1VOGX5mbV3O+D7jk5x8wZLpYgmDtOST/HJzYrog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 19.11.2021 19:21, Andrew Cooper wrote:
> This causes NMIs, #DB and #MC to be counted, rather than being reported as 0.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


