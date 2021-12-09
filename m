Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B132F46E61E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 11:05:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242861.419992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGIA-0006TL-LB; Thu, 09 Dec 2021 10:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242861.419992; Thu, 09 Dec 2021 10:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGIA-0006RG-Gc; Thu, 09 Dec 2021 10:04:46 +0000
Received: by outflank-mailman (input) for mailman id 242861;
 Thu, 09 Dec 2021 10:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvGI9-0006RA-Dt
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 10:04:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6db65c8e-58d7-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 11:04:44 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-awWb22AFO3yfmADZZ-IWcg-1; Thu, 09 Dec 2021 11:04:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 10:04:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 10:04:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0034.eurprd07.prod.outlook.com (2603:10a6:20b:459::19) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 10:04:38 +0000
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
X-Inumbo-ID: 6db65c8e-58d7-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639044282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQJolgPx58vBCP3gruV/auBd7uHNx7OWlDec7UmJ8v8=;
	b=Opa5aTov3Cwfdtx1aOzsUfrGfYp67IwvSqwW7dKy13IYzv8chBROIN3t2Ak9Sg8ilMulsE
	VKG2R8iS9Qd0beLCzAw4sJASl+99N8pcBGMg+030puwZ06xHBCvQl6pjCLIywQgB6DO8iA
	byeaFqzrzBmCjmdDguf81Yp1XBT8YYI=
X-MC-Unique: awWb22AFO3yfmADZZ-IWcg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuVTTgQwCF7OIjZrYAbQR2mQweMVkKIZj6w+IcNcf2E7xnu1jd4hzbIpj4fxcaOZrIEDbzb0nKooC7Hq3gTe7AyQkTeVFo0jWnuFIt1olq/XjqNbRAiNyT3okYYyCjuOQRJt9UyUz0BB5BkdkHfShkUfyWhTOLLpMaH0TK5ILK0Z/tJ5aKuj9vsBM5TgHTQvfH6brJsIKOy53aqWR8Pu3psquYim0DdVFyiGMv0UovtvKkBRtCKV9uU4UEiPQM3QD830LURy/Zfc7KBS0QxyW0bRUXWK6TFV+GnlxehVAn/6bIcRC2nAqrs0+1V+wREqE9UroPPPb+6UBsmQvxv4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQJolgPx58vBCP3gruV/auBd7uHNx7OWlDec7UmJ8v8=;
 b=n8eibC8MytqlfFN9SrGYe9tdvLAy/XUxgDllxb6Os1FrHGukiaE/hvhyeBKl66FH/p15UzPAW3y1NwfdiluQ90prwP9GCWgoEKGCB5K9zVVYx+glqsyaMnDXrjKWfpnyjA/LNSHJ2IL6q8deiHVLGIAcE0wAEKKpNUmkFHpS9fnYgBnnY//oBI0lQTUKnrHpfWWIjFc3Zcp/7NfkFVI2lvRoZ2FqiKlXxEu0fTvJ+kej/FDJXfRbh38Fp9Qcqf/SeFU7Cxx00nLAKOj0i/AawyZGxiABCqzotfOXRzfNm8dJ7EFY2S/b3ORKKlDtRYYuFkG/SFZrqogdPvxVBTLtPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e664c33-a340-bc97-d561-d96f19afb42a@suse.com>
Date: Thu, 9 Dec 2021 11:04:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 1/2] IOMMU/x86: disallow device assignment to PoD
 guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <8bb92e3f-38b4-16a1-0a45-5f393081f230@suse.com>
 <81a27b5a-99f7-d929-987a-1dcf2433144b@suse.com>
In-Reply-To: <81a27b5a-99f7-d929-987a-1dcf2433144b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0034.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc36f57f-782e-452c-7dd8-08d9bafb5027
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68648B78C76CF1948E703DBFB3709@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fO7VFwlxVEODAU5o5aP82JxR8qHZtpOoXb0ibJu48+g5MhFtBDZRnimXpPuF5IPTCaDj3lH/maxRbceZ3XgbHq6yNUn54IBY5FQ7PDQzNw9ZI3d5nsGXGeBISV1FwMX3FAGsaz6frFWYMxPkDswyDadSwHnluIhfpO+uzKo9SedLhZmHi+Zw58gh+W8sUQV0qshqTZlA4Gyj/j2/0YqdkOJWS5ODgNpoXdkCpzrp5T71fPfKQYM/XB9tkrO3Xwk6JxAieEDV9uxp+/jXc5AzCauxfVL7lwW5Xo+59k1OzpNV3MYLH01Uc+Uq1ymYTvYEsFiZ2UWCKxTdbny8FmRQkoXqt6/1icRXdCxxDQqkU7uR/3sqQcEkllbnQ0uTSXPvFqvLL8k2EyeK+jn2lk1+0x5EoNUB4KquV0tzTzb5YkihejJQqq1DiKK7h7kwd1QSsc5N/BVxkzyretk6orTV8Op7+KHdUCz1+bS6sKgKJ84gXTSKIpc7zTnjB7pWAcTQ5ovpiAK7Gc8DxT2LucR8ToA9+slt5v9xWjkpH8+IDqmAJYMia8xNT82DKb8MxvhlvHB080Op8IeaIPDWOGwVaLUdjg6msMp/ibYJu4rO3v6PPG14k6EgOLaxzyA8KJFu5NEQ+eV7kUHfGDkbfu25M1oy+kUDMYXkfovtIjWvdY6ed8pHKO0V2527qizpGE3XDcgL/eHaUmMzMT00I8fx8zly+SNj+EvJeawewDTAeLo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(316002)(16576012)(6916009)(6486002)(4744005)(31696002)(54906003)(5660300002)(4326008)(66556008)(36756003)(2906002)(186003)(53546011)(8936002)(86362001)(26005)(8676002)(956004)(2616005)(66946007)(31686004)(66476007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1lwTnFZSGJhL2swMWlaRmlJNW5TMUxRQVdiVTA1aDFRYlRZcDRYVGtpWlZx?=
 =?utf-8?B?ZDFITGtQdjBmc0h0eFlhQTdWRUhtSjZaOExRNHZ6c2hhS1BZdGRQVTVKV0Qv?=
 =?utf-8?B?L1g0YmozY2lOUjhoMVBtVHg1UVVTamYyaUFnTlY0a2trbnNVcWVtTGNvVUZx?=
 =?utf-8?B?L1BJOHYxdWFKNnM2ME9ZazdlYlBKWDdBanM5UWhIUTUxc1dzS014K29EK0tL?=
 =?utf-8?B?RGtXUGl4Q2VreTBnWHhkenZJU25KQitTTm16N1U1VVcxcDBlbGltSFpUdVZF?=
 =?utf-8?B?Kzh2UDFjKy9ScklnMzJnSDdxNEtSL2hMWUV4YlB2a0ZzWUx0Y3R1ckluWG50?=
 =?utf-8?B?akZJaS9RekxlcFJrUUh0djFFeldDNVE3b3hSZHBVWVFoVFlYN2Frc1RjeG1n?=
 =?utf-8?B?Y21vQnFpd1Rsb0JyVzlkdng3YVZxUWJKemVjZ01rU2NQdXBycEs2bzJsdDZ4?=
 =?utf-8?B?eHhPNXpMbGNhK2ZNa3Y3T2xUVmY4NUdPT2NlMG10VkxKZHhlamdCU1B2K3Qz?=
 =?utf-8?B?ZUorMGNmR2NkNFFiUHdIZjNzSUVqUGwxT2JrOHJoTlNkTkx0NVZ2Tmxsa3lN?=
 =?utf-8?B?KzhwVE1jemw2SXlhZFo0eCtKTTdscUE2Z3dFbEU4NkE1YTFQU2JxTWdrU0hT?=
 =?utf-8?B?R0d1TzcyTy9saGJjMG10ZVVJSG1TQmlSRnFOd0RDWHBNK3VRbk4zYjNweWQr?=
 =?utf-8?B?UzFRQklGZFBXbExjZTduTW45RkJsQ0o0NFlWWmJJZVh3eWVPdllDeWZQSU03?=
 =?utf-8?B?QitKVVRiRnRSUGpIUWF4RVgrQnM2elBNZEpRN0VWMkFPT0lhNVJaSFFVeThu?=
 =?utf-8?B?bnNVWXZ4MDdZaEVWWlRrRXpRem5PRlYxYk96T0JMcmxORlFFTXZOS1NIa1oy?=
 =?utf-8?B?M1JQZU9NcWtXUmxaT3BhbEdia09qYUw5UVBHVEV0VHppSi9vejhwRHI4RDgy?=
 =?utf-8?B?dUJYZDAyV0ZsRU9VdnlRb2FYd1NuZXNoeDY4bjQ4NE94V3REZEowZUNWakZI?=
 =?utf-8?B?M0d5NmpoZDY3T0VuTVkwSXVOVENDam83Z2lIc0kvWmwvY29qSHV0SXlqbXZE?=
 =?utf-8?B?U1JsTmd3OTBNay81SUQ1dHE1SXY1eWlFUGV3aDVna3dGZ1FWQzFzaHUxQ0xs?=
 =?utf-8?B?aGhlMVFYRVhPZk1xelFFcmNaMTdzNlFqTlRPeEo4Q3J6eTBRaEU3VjRyUnhn?=
 =?utf-8?B?ZmtQcUVwM3pDdENOK3dNNGVFRzhVZEJnM3pseXZPOVl1WUFGQ3pYWWl6SDFR?=
 =?utf-8?B?TTRvcTY5MkhBdG9pRXBINkRaTjZNenRlYTE3UVYzcGsxT2hjU0t0NDVtT3Z5?=
 =?utf-8?B?bGdWT3pKOGoveS9oaWpHOVo1NlFuanRpRXk4WUsrVVJiVFo4alJjTnp2YWFJ?=
 =?utf-8?B?NEMwd1dYc2ZhalhxNWpJeUxSeGY3VHVuYUVEU2xxUmNtMWVVYnZ3N0tYYjJ3?=
 =?utf-8?B?Z2NaT3lLZ2JrZTNRMFdxZ1BqN3V1YUtpcCtDSHhzSXhVSVA3bk82MHRaeXpW?=
 =?utf-8?B?L0F0NWJyWVEzS1FtYUVxSFF0T3l6UGtwemR6QnE4Z2tsMkQrRHlxU2pMdGFB?=
 =?utf-8?B?L1VDRmlYc3dkc092a3BtL1AybzMxbTdpNS9KOWdOMnZhYllzckw0N1ZmZTdR?=
 =?utf-8?B?dWFLazhLOERPekY3TUJOTmNOVE9IUzNIYzlaWDQ1bTNya21NWmY3UFA1bDhJ?=
 =?utf-8?B?cjBpY2xUa2JzNTNjNm1QVkNkcU05UDNGTG5vNFgyVFI3VlRMRFhMNDNQdmZt?=
 =?utf-8?B?akdUZkNSdXYvZlVLR2hSOEVMTzdldHpxMXRkdTdLR1JJSURQbC9qNk9KbXMz?=
 =?utf-8?B?MGVqRndWTWJzdFAwakFlRXBSY0dvTlhOZFhMVkRPQWpSTXBYMU1nZUlQWk5F?=
 =?utf-8?B?dDhVcTA3WEJWelNTNjJMb2s0OEFNQ25WUHZVa2J0eFM5cXdpem9Mc3IwR3BO?=
 =?utf-8?B?TWFUaUd0VnZOdFpFUXdsNjhibE1WZVBrNnFidEpCcEg0dklYdkdETXZuaGtr?=
 =?utf-8?B?dFp4Um15S3RtbzZRQUtPZzhmeCtYeE0wTTRFazB1ZStBSmFzeVN5c3NIU1FS?=
 =?utf-8?B?ZEV3SkJQY3djQ0dDVTF5REdkVys0MFJ5VUZKWlJnQXFPbmNpMzBEbHM0ZEFk?=
 =?utf-8?B?UFBickFFOTFnSGc4VzZpeXk2WXRvSytZQ1paSDlBdkdHU3o1SWphU3NCOVVj?=
 =?utf-8?Q?dIuDpw/tyg4jDXlJco3QOlg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc36f57f-782e-452c-7dd8-08d9bafb5027
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 10:04:39.5967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPG84+qRQaLVW7t85INq0kmezhmBobVNdY3tzrbzkjNWSEQD1zNdKd0G2FwRcmCZr2XUfvuAAkAf3DuEbHh7iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 01.12.2021 12:20, Jan Beulich wrote:
> @@ -333,6 +334,9 @@ p2m_pod_set_mem_target(struct domain *d,
>      int ret = 0;
>      unsigned long populated, pod_target;
>  
> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
> +        return -ENOTEMPTY;

This breaks toolstack based ballooning of PVH Dom0. While I question
the invocation of set_pod_target in that case, for v3 I'm moving the
check down to near the end of the function.

Jan


