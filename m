Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B0A464A56
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235695.408841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLZx-0002PQ-R3; Wed, 01 Dec 2021 09:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235695.408841; Wed, 01 Dec 2021 09:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLZx-0002N8-Nr; Wed, 01 Dec 2021 09:07:05 +0000
Received: by outflank-mailman (input) for mailman id 235695;
 Wed, 01 Dec 2021 09:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msLZv-0002N2-Tm
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:07:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f08ccfc4-5285-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 10:06:43 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-2R6LeN07PM2j4GPiFr6NBg-1; Wed, 01 Dec 2021 10:06:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 09:06:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:06:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Wed, 1 Dec 2021 09:06:12 +0000
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
X-Inumbo-ID: f08ccfc4-5285-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638349576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JzykYq9yBJpib5T7M8qY600NqYi+0y6+g9wtRI87EyU=;
	b=QUzvG+qwbf0C8tEOZtJxJTXL243idDlRHnvefkIYq5odUSI/AW9zQdJtseEABk6wXWmjjz
	iOG0lAVTUNcMrR6QiKK0u25WXkPf7kfWzr5EB3sgZwkymKycEPHMMbtnV2G3S45tqPyNJe
	zI0n5lHZcNBAS21DTDh6vXy1NqdN8O4=
X-MC-Unique: 2R6LeN07PM2j4GPiFr6NBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLQQ1wdfhLEe/49ecejm4Uao8az4Ngfg4BzN6Szg8squE3DurmWlKn+t9PaoHqPwftS807NG4JB/jUU7nPHZUHOaTasmrKR5qbWXZbdYoTBEOb8oonRDznWOsmokZXzbRL640li0XS31M543HbA6itDnWRg7KZnAUcaE+pu+GHFq15+jRW98TPIHZfDKXjwzfOmUfhoE1BfcAS0xMyzyhF1ZYcb5gJLOxrcuCDuRcjhKBFOLXD1zIIdh1ESC3deMflnkCEPqkqwaQY56kifNcuyey8kSlCIKbU7+4rO+KXRAH07xVv3SKA/m/UlC6Wpwff1XhC5u+RZrpkwuojaNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzykYq9yBJpib5T7M8qY600NqYi+0y6+g9wtRI87EyU=;
 b=K6Zu3WFcm0Cab/P61rth1b2XEITVSgg6cXe0iG5QxVWZPonEboBNbaZ3UULODX2J7DWPC/vaF380pHyJHirDVEFUyrbtuv0QR2iI2HwGflReHR39CUJkBl5wGlGflfBdQV7KzSdcsPggBW9dEoyzxsFN2UKjH064F618L6F2iYwc1roQt3T20K5EzZzinR58SGAf/OyhZgnkC+QB2fDtf5aLV0KX3zGaG9HPimtslE7PN/R65vu/16tsDN57w+N3uUDXr7kaZSke4xKFiaCyt2O6AoB35tEBlsMm3Op0nyQKFyJuHVnXvQUpb7rMfAZstUsOgBGNmYWcAKlDORT40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f27ddcc-5486-fd2f-ac58-98ca713d4fd6@suse.com>
Date: Wed, 1 Dec 2021 10:06:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] x86/hvm: Simplify hvm_enable_msr_interception()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130181139.14398-1-andrew.cooper3@citrix.com>
 <20211130181139.14398-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130181139.14398-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c88a9ea-10b5-4653-fd67-08d9b4a9d2e3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68639F52264A1C339E8DFCCFB3689@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ottn17bDeXSu9L6q+Cpd28a8aENBhYGHucAb44uunAmk6Pq0IDC2dNLKFavn6S0UF7B1vjHAxZAJHojUZGxrL+tB1cC3X5XFr2h81wDFeEga9s+G3Jtbuqpc+UtuRa5k1Ws7AWVMp4+3os6Liig0C1FgHlkM/mPjA3NHzyl1V//XrqEEfZCUxBnOqhrbZ/6ZbjeXj32R9O3ublgMXgiJx7A4RAhwOMfIGVDfctY0FiWgClQ5dJpi13h/bndzzw5eABtvpfqDU7eTkkFdfR+W9bYgahchryp35xm8CXO6YnjkTBNoPj8il49ry1iCqASy+TB1JcfyYT1FIJR2d+Ur7fmd6NbBr5xF/RM/cbDvwb+jW8dr7IE3n/8Bn7Xe0C/B/Zg3XjRkAd5Chg6AjdNX5Nsw2ljX8NQjh+ck77z65fG3PQ0qQCJQ+aX5bVIhX/NtIBev1+he0RDHkf+A6pQaBrwdkuqzIQbAbyt2O1LQqpx1iUIaH/MoqTxDzB28O5R0NWHxoVNvc4EDRvT2sqG3VyJh5ifZs2Zs89Y9Es84jr694k8fn84AxoxxIAy3SCXcdXoAPAjIzL/2SRo9fKRGYwCMb8SMzk544o0+xdU1NM2GIDxyAwazeW+S1K+WbL6RGQDC5MbJO9I56MmOHImfcwYkYx/F/1ghISmkY0A7E8/nMkNCGUj4ot8jjYSK1WT4RwtXwkdeUkjxK2Du3nNHKzG3kNzb00Aodzn9hGl419fZGwxCP0y2KZf6NSJd6TPc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(6486002)(2906002)(8676002)(36756003)(38100700002)(956004)(508600001)(26005)(8936002)(2616005)(558084003)(54906003)(66556008)(5660300002)(6916009)(316002)(31696002)(66476007)(31686004)(4326008)(66946007)(16576012)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0pLTkc2US9hUGswUGFTK2QvenhRbFRXU1p1Z3h2MlhJRVk2RHhPSUUvNXQr?=
 =?utf-8?B?ZDI0TzU1cmg0NFdXNjNWNDRXRCtzc1N0a0lESFhVV0VZWS9ucUhVWTZSRmdE?=
 =?utf-8?B?QWJjT3o1bkZrZUJTZ1c4cW9KSXdoSUVza3pxcHFNT1FnWWZXVVVPRnRHS0Vx?=
 =?utf-8?B?NmRYMERkYzA0NHJzSWJQZmFOUk8xeVd2MzF0YXJZdEp5Ymxpdm9SV2w2RStI?=
 =?utf-8?B?dUQ5dkJZZVRJMTU4bENqS3N1U2hOQUVob21VRDhZbDhsYXhKR2ZCZzIvQXJL?=
 =?utf-8?B?YnVqeGl1bjNxdGJMYkV2UmxyR1FubnpVUWVnM1FWTnp6L0NrN3NxcCtKZklL?=
 =?utf-8?B?Lzh3YlJqaCtnY0xVcUZHeVFETmZ0dUFzajU1R2tRNWF1TThsUW8rOW1veGNz?=
 =?utf-8?B?c3QrM3lFQnhXUXc0SnRqYVFVdE1ibTJMZUZncmZnYU9FS0RZVEZraC9tMHNI?=
 =?utf-8?B?OEJMaG00N2t6NVUzeUFuN0FrZnBVcVBsdWpCY0Ztak1aajA1US9oNERobC8v?=
 =?utf-8?B?bFdRekhidS9QVjFiM3lOcS9FTmRQS2R0aVd4eE9BN2dkR244K2xRcE5adFZh?=
 =?utf-8?B?Q2VIeTExN2wzdnczU3JicStpdG5kMkRTakhlaWt5UkJrVXhYM2xYUHRLWTZR?=
 =?utf-8?B?RlVGRjVkazZTNFNEMXpZemhZUUNXQ1VlRnNlcjlTOTd6QmhaWUJpd3UvYTY4?=
 =?utf-8?B?ZFFmb3hLL1hlTFAwYldFTGVNUDhoMG95QVR4VktGeUE5Mk1uWTR4ZEk5SWIw?=
 =?utf-8?B?UWwwUU5wQkNwa3VSRFdYbXZSbzJNOEdIYU1MdGZ0bFF1eWlTUFRZb2o4OGZD?=
 =?utf-8?B?d0Y1QUg3QTF6U3F3TUxyQ0ZOK3E1VFVqSTM1NzRHKzZCQkNkMjJQdkJUSUF2?=
 =?utf-8?B?T2s1VUZ1UlcvRzJvYVdWQkxMUVc3c1FBSVJIU1FVdG81d0pYUW1rZjdrdlpi?=
 =?utf-8?B?eXJXVS9uWWFNWDl0SFhtczU2UENYMzBIdTlGeWhMQ0ZPTm1aVENDd2JXUEFC?=
 =?utf-8?B?ZmtoK2ZTVHQvQmpMTmtBN0RSbWpwWGx6UXNTNFFHcUdTeXZkbU1pY3VOYy94?=
 =?utf-8?B?Mzc3K0htRFJXZC9XZHhhRDR2VDRPUWFHVXZZa0R4VThCN2Q4VEFIUUF5NkEr?=
 =?utf-8?B?c0dscGN6ZUZid0E0ek1ZdVlzTk93Z1hHc2dTSFNOVU0rMjBDMFdxYWlZWE5t?=
 =?utf-8?B?a3ZBQXpLcFdIWnlVTGMxREV0QmltMXZva3NuZWJ2WG5EUlZOQ0xiVm0zOHll?=
 =?utf-8?B?UlpnVVJXRFB0d1VZNVRyQmU2L29HOGFmdDljR2JZM0xyWG9ac1FCWXA4WEFU?=
 =?utf-8?B?RzJVMERuUFJYUFRlQ2dmdWRPL2lWUktzV3RwWDZ2eTZxeDRVZzJOajh1Nnhq?=
 =?utf-8?B?N0dCTm4rS1N1aE8rMVJRaXh3WjlxV2dTTUFDWFpNTHhrQVpkWHY0Zys5YTEy?=
 =?utf-8?B?Ym1sb0hQc0RIa3F6MUc1NUNIM0V4MTFRdnlxUVU2NFExWnRFQlh3S0tZd0dt?=
 =?utf-8?B?Z08wSGd6V2oxbUZsK0dFZGdDQ1JpMlBvenhGYVVETG80VThUd2NVNHlPYWNB?=
 =?utf-8?B?d1lLbysyQTVGTFRYeWRzQ0xlYUJ5YW1ybFgvNUpVSTJNamtNMDRMRnlTUUNx?=
 =?utf-8?B?ajU1NzErYXB1cGluRjV4c0ZFSmZlTTUrMm95U2Z2djJQcytmZVFjZk8yMnRs?=
 =?utf-8?B?R3pjbHhHV0FGYUsyUGt1d20wQVdsUFhJNTJRWndIcTc4cTJnT1c3cmZ1Z2VH?=
 =?utf-8?B?QVRLZmJHbjdkbnNvWTA3dWZLdHE0cldRZWZWMHIwS05zZkNlVlNOSzYrVmd0?=
 =?utf-8?B?MysvOXNDSTdKWk9IUDF1QWlWRU5IMzNRbzlHeE4xR294MGJzRys4ZjJUUjR4?=
 =?utf-8?B?dUJ0dVhudHhNbWZHcm01K2VVa1lMdkVWM3J4aCtmZEQyUHY0cThUNnpmODFa?=
 =?utf-8?B?Q210OUxsbCt1aHJuajZBeGhVZCsyMFFBVjIxRFZCc3gvRmI2Z3lZZENMbkRE?=
 =?utf-8?B?ZHdjWTdwYXhsTXM2YkhXNW5CRUI5MDBFbHpkTG5rcWpuWEJzY3JpdGEwWXFp?=
 =?utf-8?B?WXFndlBhanBUVkRYU0RKR3hBNGlya1VraU5kK3lsaVB4Z2s5cEZEZlhnWlda?=
 =?utf-8?B?dFJTQjlzWUluQVFFWVlNRjNoSzdmODdxZlcxQkVxUWZyemd5a1loamlHaXVr?=
 =?utf-8?Q?5RItt6iauhjO3Xm1W58tOc8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c88a9ea-10b5-4653-fd67-08d9b4a9d2e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:06:13.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVJkbMzf89VKHFi0LbW2QogaagND40ovwnmZ/oF3e2l2LgMpc1LzST8Ru27EnGJ3nJBtMIH2bgGkSE9BMraiyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 30.11.2021 19:11, Andrew Cooper wrote:
> The sole caller doesn't check the return value, and both vendors implement the
> hook.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


