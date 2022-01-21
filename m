Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E7495E17
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 12:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259312.447473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nArhL-00037h-1P; Fri, 21 Jan 2022 11:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259312.447473; Fri, 21 Jan 2022 11:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nArhK-00034z-Uf; Fri, 21 Jan 2022 11:03:14 +0000
Received: by outflank-mailman (input) for mailman id 259312;
 Fri, 21 Jan 2022 11:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nArhJ-00034t-Cd
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 11:03:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9898966-7aa9-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 12:03:12 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-aLK3LIwNPg6sJzSi5mS5yw-1; Fri, 21 Jan 2022 12:03:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5717.eurprd04.prod.outlook.com (2603:10a6:20b:a6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 11:03:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 11:03:10 +0000
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
X-Inumbo-ID: b9898966-7aa9-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642762992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fADn9GlWOerDlTAiYeA8/pCPTqEWlEGsluBmxSqEpH8=;
	b=ePKfchtGSCm5JzoXdzJB0dJZoBzF6s52kNmsWiovKsFjtDAw9DRBNghXc2x/AMS0i+NC9m
	FT4TbW2ysRZd/tSEXwzdFflPcg/cpr82f9ewGrXNYorEvG6uA8npfxeWcXNcuMLjHxMHK3
	zg56o+uOCVXK7GmWX+KPKr0gia5ixhE=
X-MC-Unique: aLK3LIwNPg6sJzSi5mS5yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WP9ohjwgjirhCQD4+/QX6jBkvIBz8KYc7xz+jTKfB8SEyuyOI2lKzqINyNItQ5Vk3Y/7yad3vVkIrupIKMWxLRkxKps9/eCmYRhIx+GBwOcS/G144fBQsF7qnnaI+Uo8eLt6FGtJtZcmCPBzi68YSsJ4Q+l33uwW2k933xOEQfeGA8uZ4/XREUy1p9RaksW5SAejGOF080BovbNNz6Sa4pka4PMzvFWLIG9kEXGRm96hxqDmdKvKpa3tK+ZNmfi2F9GYwXUnV87hsDTROYEq7ZdGPncrO8PAiDzl8h4eqSD5vz56eBY8OhwGBzJmYEb9YRg0Ah1fmRy9qw9oOiaCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fADn9GlWOerDlTAiYeA8/pCPTqEWlEGsluBmxSqEpH8=;
 b=RkyugARhyB3VVnG+xYS/U1Izz7hj3DdjVLBCUlpbdjTkYEHByZNXS/T9VFTfjOWKRtTVRlyfe54UTd+VDIMDVcv5xFRDrOLffqtTMPOrTeFEDJ18nqrb8tpg7DdUCqinkz3mQW+NsfHKQgJGAIky7KR+tfTqJA4uWfzWceYCzxF0+Xv/6yDb/o5rsOa3gsbh3kNePg+pbuWlIKiPBH79mvLVllA4wFKDhVBUhYJHAnGS47r63J2Q+FUWLLVN+caDkZW3Db9c55OFZ5XiUzDSfJQZ1JGtorem1fBMuehWJcKIPcaoDZFvnbXpK+2GDfJ2aOfxELLkAPo3foky/HpyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e3a51eb-a04a-f471-201b-8aa27aca4224@suse.com>
Date: Fri, 21 Jan 2022 12:03:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86: Fix build with the get/set_reg() infrastructure
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220121104901.22702-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220121104901.22702-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4138f078-f6d8-45e1-22d6-08d9dccd9c46
X-MS-TrafficTypeDiagnostic: AM6PR04MB5717:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5717C3F16E75B16620A58ABCB35B9@AM6PR04MB5717.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DEQ8Olk9XdXFaxA5WlDlECZGRcy/eKgML0VpPXNbxmtX/EbExmcyNOQvQEeG953hP3x6alBeeYaqpCB32hw2s05ixdjjPwukE464cHVLNd8HFmnwXQpFN+elicVsWAs00o1gGGHmCQsi7jfkn6P8C2o0zgqsoXXLmPoa3BYlFfbpDGVjV3kTQkdDM7Zwxt8J3Tsvf/Rs8BIpZgvb5p+VUMNQrWPTSg9zs8O3T98Kia6Z/VpcxGer0r7g3TJE3quermVg11L9/fw+ZWtkh8zx5/+EaZMZdT5XDcUQ688u+cgpLshyZ4ruP/QGvlYBcGTdutYa1EVhOmjZP5xRkg8O3S0ljoa9SjioMBSHYu36zzkVAaE8lnW37Qb0PQjWQFBP7IatnPJX+OBZG9OdbeasLNtx2Ii6zzp2VceLbziq3Ry/iW/N1RPIJXC0mTYc7vbrTUmD00wKulwUS3Mlkecsg5MgKz8n7XUb3pDFjtuvZjMANarTfA/39EPCKfRg/SfIFiVxn2HH71cmBWB+3REtbg9N1TmIUYZSo9ZtN7eBq3nU2aY22+VFBcJhMyEY5RDtLNmvTmbK2+uHfvqX6OR2vOIDlCjiLrFyZ61XeLXGL1Ge6YkXNAYVkwujkClq5hVasCHah384g9GqWQ/pK5rVOK+5/1dSuQqyk5SEz7QkIWj/KTBy+xWcCH6mHwsidc0CLd2kfIcQ2BODMcSkM9aeeuT1FS+PILkn/Mli6Y7+2FIO+An4/EEi15P9HFZzXItT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(86362001)(6486002)(4744005)(66946007)(66476007)(31696002)(66556008)(2616005)(5660300002)(8676002)(316002)(6512007)(36756003)(53546011)(38100700002)(26005)(186003)(6916009)(31686004)(6506007)(4326008)(2906002)(54906003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzZXQ1F0MUI1eHl4SFJ4NDJtZFFFK25WUlhacTdldlorNGVpYmIrZU5VWVQr?=
 =?utf-8?B?T3ZBL2RLM3pUQkRnNUdJZnVMaEZ4WGxYaWlSYkJ4eEpWME1xMmhYeTg3Z1dP?=
 =?utf-8?B?RHFxNE91REJVRmR1Q1VWbmtRQklib0ZhZnlNNkFZSE41L3g2UWUzOFBSMXhM?=
 =?utf-8?B?OFQxTldLL2EydGd1SHBBWWFZMGZSeUtNSHpKVyswVFNkMjk3Qlp6U2RNd0tt?=
 =?utf-8?B?dUVidmd0RElPTkpqS1pFUngwdnVXS25HajJJU3h2aDdiRHVEalFqdXhaYzRl?=
 =?utf-8?B?V2JnL0xxY25seFZGRFZLYTl2NytvdnlZTmQreTZabno2empZMmlMekFBMVhT?=
 =?utf-8?B?K3JvL0hLb1A4bXRITFVKOEs3UVF1dngyenJUVlRNSXZzenZpZ3RtWGR4ZmN1?=
 =?utf-8?B?SFp6dlBTend5WkRMVVdSOHN1djJuSGZCSmtmK2dyL1BNUkFBMmZ4RkwvTlk1?=
 =?utf-8?B?dStTV09GTzU4Nk1hcDJITzBsa0F6NHU4bE82cWtxaDhwZ1QrdUhQd0U2Tm1F?=
 =?utf-8?B?enN5ZmJkNzdVaDBNODhvc1NzMDB3ZXJjQ1VldlF1NGlTYmRZNUdUc25YdW9i?=
 =?utf-8?B?M0paTkdIcnJyRlBzR2NlNTZCU0pxOHdpeEJkODZpT3Z4RGV1R0c1aW1odk5a?=
 =?utf-8?B?N1VMT2tYczRBODg3dWJoMit2eFRjWitXVFhuTklnL1UyNTBFZTZxK0xTYjR5?=
 =?utf-8?B?Z1RJMnBxdFJBNWZWSk8zOUlsVnE3S1l4U1lVOUlCaWRVRFE0OFlTUDB4TCtu?=
 =?utf-8?B?TlA2Sk5nRVJyWEJUaXkvb3RaZGpBZXpOemVuYU0vNVYraENST09lUTFjMHln?=
 =?utf-8?B?ZDh6eXRyRGJCelY0Q2E5T3VQZWtJQVd5WTZrdWxhVkk5WEpmemh4d0V2QmxP?=
 =?utf-8?B?MkdBL0Mwb2Jibm5qaFFmcFlOSlZrNlplbkVyNUs1bWI0aW5iRWRmRHJwYk1o?=
 =?utf-8?B?aE9YV2QrL0g0ZDRTZVV1eFkvUmVJbnczZDlBblE3TXBYZ2tOQmxDUWR4SFJF?=
 =?utf-8?B?dUpOSk1ySU5XcmhrWTZ5ZHAya2VMT1ZERm1yL3Z6UnhCSkp3WVl3SXZYaHZw?=
 =?utf-8?B?a1RFaVNhUTBkYmo0SlVrdkJCcS9lNGZiT2dZTk5ZYjR2ZEVGUWQ4NXMvRkIz?=
 =?utf-8?B?c3orYjB3bVhVSDBKRXJUUHBiT2Z3Vm9Zc05rQUx0a3hPUGs5Z21nY3FqdXhO?=
 =?utf-8?B?QjlHajhtSEhPWVVRbEFNN3JJTlU0dHFEYU9OU1dzS3VlcUt6Mlo2cHpIMlFl?=
 =?utf-8?B?MVRnRGlIZzk1WERmU0lza3luNTVhVjNFbnNxU1NMV2NTakFoZVJaVU43b2dW?=
 =?utf-8?B?SmhiUm9hdGQxYjM4aGJtSEhRdEdDY3pXcXpZMzZybTA5bUIrelJCdUwzbUJz?=
 =?utf-8?B?VG5WVGN2a0hjZDd2ekExcVIwYnhjbUxRRkVsbnNhc0RKZjc0Z3hMWFZlUXFI?=
 =?utf-8?B?bjkyWFhvR1E2bjdQWkxtRUlIdmQydlZYWkpDR2RpQ2V6NHRsQnJJMEhNa3R5?=
 =?utf-8?B?UW5PaVAwLy9oTGNpM2E3RnlWeGNpNG1nMmRHSVg2YVZiRDlDOHEzMzJBdVhN?=
 =?utf-8?B?YVVhalpyZSt4WEIrNjYrV0tYK0JsSW5LZTQ0Mkdjc2pvWFdDQTJxYncvMzQ4?=
 =?utf-8?B?UGZFMnVtV2VyeTZtM0UvS0xiSEdtckt0Znp5UEU3cWhveXgwa3g4Q0MyN0hy?=
 =?utf-8?B?NkliSlBXbVYwV2pvamtUUWV5L1JsRDdQYzdZd2lnSnVCZTJKN2FlVmttVyth?=
 =?utf-8?B?bHRSRnpzOEVJL2xIVmxKVkZDblcydllRSkluV3VHdmhPSG9iQ1NBMFFIem80?=
 =?utf-8?B?MkxnUWFjMUw0dEVrNW81L2Rhc1hJZmJwekx3cnNFRm5iZ1FOckYzbjNjdURy?=
 =?utf-8?B?K0xGcDBieEtGSFhJUGJwL3p1RDhYZ05FRGp1d1ZXNEkzeWU1L0JIMzN1Q1Nz?=
 =?utf-8?B?RzUxaCs2VXFqa0pNakJWTEFBd3ZURmU2SGo2TVBRbmNBTjZVS25vbzJsNjZB?=
 =?utf-8?B?aXF5b3RrZUhzSitscEczS042SEJqYXRVZDhDcU5aemExL00zbDZaQ1VYK0wy?=
 =?utf-8?B?NStxWG5qVWxqMGFRM2NieGRKUmZzekNDVzExK1VKbnVBMllqOEdISE9XaFJQ?=
 =?utf-8?B?VEg0Nkc2YzkydmVQbXhHOHlMdExiakFtZFdTMTZsSlpjWTNDbDgzdFpYWkls?=
 =?utf-8?Q?QuONLn0QWPwFNUUDNAMlWBU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4138f078-f6d8-45e1-22d6-08d9dccd9c46
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 11:03:09.9503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MIc2uwgXuf4uRNbHl9efot2IPKnHEiGvKAroPBgiDrvcvR//qClBB5pXpZvZGxNQ+XHP2tsn+Pi+asRGwuICg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5717

On 21.01.2022 11:49, Andrew Cooper wrote:
> I clearly messed up concluding that the stubs were safe to drop.
> 
> The is_{pv,hvm}_domain() predicates are not symmetrical with both CONFIG_PV
> and CONFIG_HVM.  As a result logic of the form `if ( pv/hvm ) ... else ...`
> will always have one side which can't be DCE'd.
> 
> While technically only the hvm stubs are needed, due to the use of the
> is_pv_domain() predicate in guest_{rd,wr}msr(), sort out the pv stubs too to
> avoid leaving a bear trap for future users.

Well, as said on irc - only the PV stubs ought to be needed if the
conditionals always used "if ( is_hvm_...() )" / "if ( !is_hvm_...() )".
Despite us making use of this property elsewhere, you appear to dislike
that though ...

Hence / nevertheless:

> Fixes: 88d3ff7ab15d ("x86/guest: Introduce {get,set}_reg() infrastructure")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


