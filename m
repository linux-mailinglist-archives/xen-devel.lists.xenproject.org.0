Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A847C163
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 15:24:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250467.431418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzg3W-0006a1-UZ; Tue, 21 Dec 2021 14:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250467.431418; Tue, 21 Dec 2021 14:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzg3W-0006XX-RC; Tue, 21 Dec 2021 14:23:54 +0000
Received: by outflank-mailman (input) for mailman id 250467;
 Tue, 21 Dec 2021 14:23:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzg3V-0006XR-OH
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 14:23:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f567b4c-6269-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 15:23:52 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-jBYjiI2QMz-stEuPgAuImw-1; Tue, 21 Dec 2021 15:23:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Tue, 21 Dec
 2021 14:23:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 14:23:50 +0000
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
X-Inumbo-ID: 9f567b4c-6269-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640096632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KpW7mlHnACVTvdBKx6GQsws3vioDdHC1jJmTk4QqMPM=;
	b=gdO1lgiWy8qjiCeChnOMll7oIuqBZKH75spg/sHdfanuOSfY4jYlUA82aUtECV8XT2wQ+i
	3okgqHitMU2B6vwkW7xZNHEJJEeFawM/Nay4JDui2h1kuJO+31N1Uy5UcoETR5AOtyMzTY
	xjn1N6Axe3v33ZzQd/Q+yUWbFVZjFZM=
X-MC-Unique: jBYjiI2QMz-stEuPgAuImw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq3EH7DOukvRCyjkW3NQj6nVHEWT8Iqy7ttxQ0vgekQJo9y457kJsvM0dgn5jiJ4U2pSk8dnsklN8O3uSVkyv1ZjI5skg0u20e8RumNxFyGF7OFRP+fcV40jzpeS6V5nclQO3wsao8kGLdzbGDkn6OdVh/VskJbShj12qKdNEveCRZoGWHXbz5xjFixHdHRkit9s2zx3y9HV8FEj6dq3rIt8Mdpne9DVQ32/Zlx3EcJ0jVpV/GM8EmOVwRsZpua9gvPRsey+Z2Eujx7ksN+k9x3S25BroQlwAjIFZ34mnrI+rvgm7VPxORKX4ExQAeD13dsGcJ0Ka19DCoUQmoKq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpW7mlHnACVTvdBKx6GQsws3vioDdHC1jJmTk4QqMPM=;
 b=adX/KZcgp0ktK0fXdW+LFg1iIqxHsrVCg51Pd6oVjMa2GagUwkB/CeHmNewqU6MmVLgwUgQro0fBh1eTIeVUGwlrDJKSWVaO46K5+Iy8nwKeWxRQvdCoyqW35DdvP6tao0YJna0dFcRV1x9aI+Co5dkLyJhXdNL7WdmF+2lbSt+LlsGKxCaefWXz3fiLcvWZhnH4OAiN057tQgc1g6FT9YbPwT9TKwS16TvhAr8DzT5G5qSUjR7h1TgDDbXpXlM+ShkqFhkh9zg+zJP0h84WXYesQ4kFdxIVODDRtjBZZqnxzkvq0kNSZy/yqUDr4TDXRoU0GcPjXz1Cu7UGy0QwDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcaba25d-180f-a1f5-671a-61ea4b2804cb@suse.com>
Date: Tue, 21 Dec 2021 15:23:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 36/47] RFC, no-VPATH: Kconfig: only ready auto.conf
 from objtree
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-37-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-37-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee8e088e-5439-4000-58d8-08d9c48d81de
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB295976B55D03B8FA211EB6B3B37C9@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x6SWvMsyghxqn6iuUb0V2IbU5YhR92PrTpjqnyzXsT89ebypAqwOvxLno/PP/284TPBKPZTclR6uza0tE1dOLU3RK4offcoOideArr4E9AEWj1HZ4zM6joNJLCuK8X3JDFzvH40y4819iIG7BRfNsIK8uNVWYr60sVi527ki4nWAq2CGFLishjcb4vakX8eWO/EOt3SadAGtIT6JjpvYOrnyeEELiDIjMtamACp8Kg0IbUnctWuZGXFONKrA/k/ZNY/uC8Rfy9B8WK1ka4n7Z8CsAEwTvXwoejswpbDRB4/blmCtdBlyYuUiFQ7thxya27PjfbPlKwPELs9EeS5NmHrd8f4/aIX1XAo/sWFt1ygjXanh8k1tAGcZvwzNzDJsiCIyEmAC8N8noapO1RHLfsB0YDFGheNMzGHWXx2jRjH/Ig2Uxw4MpbcNqXQSEWoH0KO03/6q17l670O+k1szSMwOODayCplDcf4mhvHK5e/6zba/aJR48c8N0OjmPnbu38ilYWeYhO5cpzJfDfQGGvBaxPuQpp0SaTI14Ddu1mG1fefLLN9iRBXJacuPtwaXfA2H1CIJx8nk84ABUl8lmJGcYyBDyaMTiElVFbldU4X4zvBUAV+m/+xA6D10+t3Dxo5a03jpgueYF29UWz04wYWeFu/lHSJuR2IYtFnHcWxRFBYTV+LGR0opqLUTfCoUKgqf+zc6BNsk1M+Ibp0j7csdPk1errp4GPSbgB5Ts7GNkijZIteQV350T375iPPn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(186003)(5660300002)(6506007)(8676002)(31686004)(53546011)(26005)(86362001)(316002)(54906003)(6916009)(508600001)(36756003)(66946007)(66476007)(38100700002)(66556008)(6486002)(4744005)(31696002)(6512007)(8936002)(4326008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHpRME5RajlIRldRMk0yd3ZTK050NEJ5NmlQeUExakRRcStTR2c4QjZLbUpo?=
 =?utf-8?B?RUhpRGZTcXFFOE1vYkQ1WXlYNVpYaEJqcDlONDFaR0xxRUc4cDJQMy93Tlhx?=
 =?utf-8?B?Q3NvN0xSUHdsQVMvSWloQUd5UkcweDhvVmkvTlV3U3ZBaUxvMlhuQVNvV3gy?=
 =?utf-8?B?QjBtWnpicWZCZzhQUEhXbmVQMG1zVzM4R1ZsVGJ6V1g1SUpBN2d4Nk5PZlZQ?=
 =?utf-8?B?YzRhK0M0M1hCeTdDZjdpV0VvWitsTG0wRW1aWmpPNHR4MHFBY2pPZUhHQUR1?=
 =?utf-8?B?L09ncmhvYjB5RFpnT2RhOWNsbXJQSHkvUW9wTmhwaUhVS3NNdHFoOFlybmxh?=
 =?utf-8?B?QzhLUzViUEJxM0V4eFNtZGE2UVh5N2NLRCtOd3QwWWJQUzZqeG9XZGxsTEtG?=
 =?utf-8?B?dHdBZjFHZHkzN0lRTlZyUEtzeW1ReWUzdjlQY0Nha0lIU3gyYU9zc2I5Mzhh?=
 =?utf-8?B?YUx5L3RaWXFoclFiY01aa0MzK3RJeGhiU2FZcHAvM3BUWmx4b1puaXZpbEdK?=
 =?utf-8?B?TDRNVlZQSW1Ia1hkV05aSHl0OXpNcVF3MHNSMm9pNmkvUnhLYWhPaEJSK1ZL?=
 =?utf-8?B?WVlxNTdDYTB2MDNTNC9xMHNqUkpiQWZKWVRIY21GQUR5UG5WQ3Y2UzJ0U3c1?=
 =?utf-8?B?SGV1WkJrdVlKTDQ2NTNJcnpYdndEYnpKT2xDQnV0VXlkVWJNeFd0RUNGMm11?=
 =?utf-8?B?MyttcS85YmNYd2dMWU0wSFJYV2gwb2tkR0JRL2ZlZ3BQSkhqbmFYdTdPdTBt?=
 =?utf-8?B?Qm93T0Nnd25uYjN3MG9FZ2kxVXJnYmZCMGdsekxYWFliaVFJOHJSOFhMRlFl?=
 =?utf-8?B?TWlZOEpid3NKdXBZSWEyejJzSlFSMG8vOHluME81SUxyRWVucEVPSHN2aVpm?=
 =?utf-8?B?V2xXNzA4TmRyNlhKMFpyOUN3U3B6WWRSdW0reUQwNnl6eGJsVklJQ2UxQnNk?=
 =?utf-8?B?TEhydG85dGRXZ0RwWDVnMkNISVc4TUlNZWxhT3hzTG80cEN0OTY4YU00K1ZQ?=
 =?utf-8?B?YzBZSlhvOWJKeTFaZDhPRG1aVTYxUVNxaXNLS1J5M3BORWdaS2JIaC9kaTZE?=
 =?utf-8?B?aDdNWVNTS3M4bHpoK2o1MS80S2EyS0Vtbnk3STBDV0JpVmdraXp0RFdOSkpL?=
 =?utf-8?B?YjEyN3JDbTY5SzBjcUpuOXR3eEh3azBQK1d6Z2p4c0ZYTzVhOU16eDBwTkFJ?=
 =?utf-8?B?VFo1THVrVkRaaFhxb3M2OXpjNFdVWGhXc1pLTDZVY0RJQVpwcmt1b3Jsamtx?=
 =?utf-8?B?WS9sZW9NQ0h6VllTNS9mWHg0UEdPd21vakhjRnJkVXpkdUhCdDAwdldVdksx?=
 =?utf-8?B?cit5Q0U1ZDg0Qks3eWVNRlYwejlVbEt4UVdNZ016amRZeFRzZWNBcDNQMFE3?=
 =?utf-8?B?U3I5YThIQk9VYUNwOUR0RVUzcTB3UG9pRGRHaHVjY2JadTNPQXM2aCtOay8x?=
 =?utf-8?B?WDNjNUpydGtCaEYyYVlCSG1KV2graDdnN1o1ZWtENmFuczhYNmk3ZTVJVkxK?=
 =?utf-8?B?eURPSTZNRlNZM1FFczNTdC9oNXVmQlpORktBQi9POXFVZFZiNGVYSWNuQWpE?=
 =?utf-8?B?dEJiWUZQelk4ZjViYzcxYkY0QlFyUFNLNzRiYTkxdWIxK2p2MGpZS1ZTOTll?=
 =?utf-8?B?YWxDUnVNVkFDa2k0SHRvZVhnOTFuOEdoWllxMHJTYVp2Sk9xNXJjcDVEV3hC?=
 =?utf-8?B?d2NlWXIxL1NqVlFnUS9HNlA3ZVpmc2gwcGNQd08rcEx3aUtxTW43dmJSSGxD?=
 =?utf-8?B?R2FucFNpdmpnSXBuYmRlb21YaFhTeXQ2YkNPQUZoQUtNdHEvS205emRsMURt?=
 =?utf-8?B?eit5dzFheW5ITE0yVkV2bFV3UVhtQUw2OXVvTlNsOGlUeWxYMkxPNSs4b1dE?=
 =?utf-8?B?L3lJb1ZkK0lGdnhoc3M0aFVsWnRvUXM1ODFlSXgrK3FrbitTbVlDeTNyZmJT?=
 =?utf-8?B?eC9NWi9ITCtxeCtLZXhxUXlSVjN1cnd4VFQzWE5iQ0FqRUpCUCthUWFwVUV0?=
 =?utf-8?B?K2s5SEpTdDlKZUZVeHlEc21jOXpvTGtNUHdQOU5VRlpSdjRRbmdxU3NlQjBT?=
 =?utf-8?B?djJ4aUtETU9vcUFoWDNtQ0drSGp3cEZVTmNKb3BNenI5emM1aEhZUDh6TWZI?=
 =?utf-8?B?K2FDdi8wTlBLVUM4OTNCNHNZNzUwQXQrRGVPZjJiU0kzT3REcXF3bVErZkJ2?=
 =?utf-8?Q?Z3NxYQs7WLGdFQASy/GLmhA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8e088e-5439-4000-58d8-08d9c48d81de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 14:23:49.9840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpMddmh5dFA2uGsbyi06/z+GZLBsk4S1tWUJOytDENUQ1Y2/S3a4iH8X73gGz2NjAO6HNpfl/Bijg9bE7gQM1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 25.11.2021 14:39, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@gmail.com>
> 
> zconf_fopen() will open file in $srctree if the file isn't in
> $objtree. This is an issue for "auto.conf" as it could be in the
> source tree if it is dirty. With "auto.conf" read from the source
> tree, kconfig will not properly set the file associated with a
> CONFIG_* properly in "include/config/" and instead only touch the
> files that correspond to new CONFIG_* option that were not set in the
> "auto.conf" found in the source tree.

Do we really mean to support mixing in-tree and out-of-tree builds
from one source tree? Without such mixing, iiuc there would be no
such problem.

Jan


