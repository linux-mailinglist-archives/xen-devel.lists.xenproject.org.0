Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B4446492D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 08:50:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235622.408725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKN0-0004tD-4B; Wed, 01 Dec 2021 07:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235622.408725; Wed, 01 Dec 2021 07:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKN0-0004pm-0v; Wed, 01 Dec 2021 07:49:38 +0000
Received: by outflank-mailman (input) for mailman id 235622;
 Wed, 01 Dec 2021 07:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msKMx-0004pg-Nl
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 07:49:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3954ee2c-527b-11ec-b941-1df2895da90e;
 Wed, 01 Dec 2021 08:49:34 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-DuzYAJR0N7yvO_rUleGaFg-1; Wed, 01 Dec 2021 08:49:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 07:49:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 07:49:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0016.eurprd07.prod.outlook.com (2603:10a6:20b:451::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.8 via Frontend
 Transport; Wed, 1 Dec 2021 07:49:30 +0000
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
X-Inumbo-ID: 3954ee2c-527b-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638344973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGV630vfh15j/xw/z97nBvOgJpDlhqb4jOpQ3HGHa6M=;
	b=SFOF36sqS1A/+tXkJWLfKMQzHBZnE7IFFfjQFOYefx9ik9SqKv2SAf8TSIdN7sNO6JO5FG
	7jCLvPm/u0vZ8412uEtQ5oLrK8WlNSKQWXu3iFHSmURHPUwOtGUY6ijQ6kiQ/gLggExY7U
	9glQasTGV7+hpRJ5/4n2wxQHwTV/FEw=
X-MC-Unique: DuzYAJR0N7yvO_rUleGaFg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VN5Ed2M+u5AZEE/kBhCaSzNGYGSwn0NkrsDqlk6vJnTvzJzPgpf2g4s7Cds+NIMgy17lHOhcP+LWi2XoyazVffidiJf528zUYpyjwk8GDflLcTxyaKaZ/LxYl7FREEsVGHsnyC9iTPFyVjpX8DjOSIxFtDqDMk45vu4CAkIVyaTOyt40PTtu+BX4M+F2StY97/ZFu1199uj0914XJX96iwWBX8Q3Yxx+Ihlybpe6Slbyt2E6BQ93p5p+2U3Ay+8QJbyMaA1xjwMesijeMngasVHtwcl8lOJUxEMqmI4mwSy0JJpLX0TIb4Kx7oAVq+bO2C6+r/alIKGEBtnxVzccTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGV630vfh15j/xw/z97nBvOgJpDlhqb4jOpQ3HGHa6M=;
 b=nRCM6u/7nFmGisU4KNM9aeh50WyadGqZS1+x/LggtjRNLD/z6pYrpkjW4XkZwktB4fLlzeZNvT8wXLLy7stbIqLi+l2yzYw+Zc4FNJoZsG8JmaQRQMFuVfbf2y12kJTbYg0hUFL9ulF62ZOZj/yWPMu78HYsm25GMVtnRyv/cWntxUW1Pq9+4a6n2iKhScqdJ+QEPIpNp/9/msoii9DzDSzwCLkJou3NR9hR+iI30ja+0CaxFph20hr4BgpNRvJJ8a6XpBgb/afbwP0XKX9b03cbUrFB+An2uTvgHP8pPz9od7bhQy5GHJWDimjdIskcuxJcVc8P/QJwj9lCask+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d55a2ecf-5c11-1e6a-cfce-5a51a6ba4988@suse.com>
Date: Wed, 1 Dec 2021 08:49:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 4/3] x86/vPMU: Drop supported parameter from the wrmsr
 path
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
 <20211130220111.23815-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130220111.23815-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa9bee8f-4a33-4ee4-5df6-08d9b49f1bac
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48485676E8400682E371A134B3689@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jq7W/URy0euqEEdHzzAdc15QIxr+S1W7/eFG+RVV7K5KODxRqAdvxJBCA/LuGWOxtqbhJr0OmbQlp9vsKPGqK29S7+W1870jnDrKKZLmpIV0UHktYbE1XP5GNYN0vvIi45A+9vCNzTlMm5YSIzNfzZkQYRVn4t3Di5wqN/+zZ2j0j6Z9iwBp25zoxs3byIp91IAVReJaFEfzJ7XFhRpRXBm9zZDWLNx0J0b/iQhrGFv1vRVTOQ5xxW4OGsQ8rNUG1k4Wuyydq6Go6gNSNIYYJhDJ1++WB3P0Hn2JRwbr9MEp0mLCxQy7TUIVpvHKqCVFvoP2nGEIZSFZAv+LU1dkkuwpCyPKwzkBR/qEY2E8WHOQkMWcLD/jxGnXoGfwpKZKPNpIpJcjandvnYGFAaX5s1B4jXqWgj30pD8jO+dl1FXWLfhfOU/QCz+UjklnGf9iE/Iq7RTc7tFEZ+tidC9xlJDUZC7/b8WfbNanjoQ0MX1lVKzwuvIub9XTn1HwvK28r6EX1Fs6zdZUjCJOjj0fFIDXHWW0lQvMInHAuLpc2slsQp+JoWK0nzpOVGo2OCfB3p3JG9iEXaK7AJSYDQPyzZ2KsO+S/NhDUI8G6CfMCQVKrRPJSUwQJ6NJ6DN7qNb8yaocmH7n5fB06QuIziuXCEvbmG+ErUbzsw8SC+sQ1KSQ4S1DEOzDnp2BBs6Q5swbkSVvOJaseNbD8i+D3mDHfOBN89vpTdjGEcNVsttk35E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(38100700002)(53546011)(66946007)(2906002)(66556008)(36756003)(66476007)(86362001)(8936002)(5660300002)(26005)(31696002)(31686004)(508600001)(4326008)(16576012)(6486002)(54906003)(316002)(956004)(2616005)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHhjZGZ2cklOWitVZ1N0Y3U0NDdPK3ZDQ0lBaFdDMFNUUm5tUDQrSDdIR2hO?=
 =?utf-8?B?MWdYMDVka2JSUjFSWENNbHVlNE9lK1VNM1dZWFVMajkwd3Z4OTVKb29pZjdp?=
 =?utf-8?B?aytSVXFLRTRQR0lyUE5VcmZUK21weGFpRTV4SDRQYytKMzJVWDVwSzZUTU9u?=
 =?utf-8?B?bXpmZ3hCZG1qSVY5dEhwSE9ucE14NVlmUjV2UWJFYjVTZ1RMdkF5R0ZybjVk?=
 =?utf-8?B?ejVXOGhnYXlRRDUyb3ZNN3IxZFZSSU1DamRMZVkxOXhYYVUzWGZpQWQyb1Jl?=
 =?utf-8?B?dDZLU1Vvdnd1MTQveEpkc2Zoc3pWS0J5Q3JvUldPUjNvVjNEb3pyR2hsaTBq?=
 =?utf-8?B?cldBVDh3OXVTOWJHT1ZOY1pxTm5sbzZESkpDUjQzbFlySTBGTHRsMjdaRGZt?=
 =?utf-8?B?OVEvU09VR0ZFNWo2KytpWktpb2QrcW8wQjkvZXNYTnkySUw0b054a1c2anVM?=
 =?utf-8?B?UkcvNmRnVE5WKzU1Q0lpbFpSWmE2aVJxQk1zdThTZEVWRk42YjRLZEpPMXFl?=
 =?utf-8?B?M1BLWkk1SU13L05ocDBleDVmSTJFU0t3Y2daUzZIQzhyQVNuakJBM2ZlTlI2?=
 =?utf-8?B?ZkhJSi90WkVKUm9jdFhndnFtWUF6VVJKWng1cFRoTVQwcm9tRmY2YVYzWmFU?=
 =?utf-8?B?TmMvbTdBMDVQbm9EaXJoRDFBcmcySzdKQ3JNdW9QL1F1QVhWdXBLbG8rWkVN?=
 =?utf-8?B?L2FCd3ZaYzFWekRMNnFqYllxOW5pbzJ0TXlpV2E2ZGVwQkxGNWhTdEpiMDNO?=
 =?utf-8?B?YWliMldqbndCMk5uZU4raWN3YW1jT0ltamhJK2h4QUFJY2x0aisxSjJQbUtW?=
 =?utf-8?B?TGVBOFd5WVR5OXh5NDIvS3JyeWJnWjlOZU85ZHNkYld3THNnRFFsa08yMDNI?=
 =?utf-8?B?VzlQSlFVRWtLMDZvd1hodFN2QU9vQlM0ZkpzaXlSbHQxZlZSbUMxR3B4cEV5?=
 =?utf-8?B?MWNJNWUzeHFpWC9QM1lTdU5XRndGdXorQ21TZTcxZ3BUY3IvM2s4N1pHMSt5?=
 =?utf-8?B?aW9URTV5SWoyNTNIV3VEY3Z6K2FueXBJQWpqaWEvNk1OZyt5Z0MyYi9WM1JK?=
 =?utf-8?B?VENPN2ozNG1iSVhhQmU4NXV2RDc0R1EzMGw4NWxiYTlNUk1FenR6elFEUWth?=
 =?utf-8?B?Q2FwUUVEWkNiOWViYkwxRFdWd0I0TUJTOHB2clJ4cGd6THdNS2MvcVNvelFt?=
 =?utf-8?B?ckNUWWRLemVrTm5pNEdLaWxrYUZ2NGZtK2w1QTZVSk0vUFgwbUhlc2x4YVNE?=
 =?utf-8?B?YXFSZytqLzRaeERHSG1LRnI4YkIyU1pSQTJuTlYxVFZHQmt3MTRQRmFDR3Fz?=
 =?utf-8?B?eisxdkl2UG1sZmNaTTZ4ZG1tR0ZPQnZnQ0pQNUkwQkZ3QlRhYWY2SldZSnFh?=
 =?utf-8?B?djZlQjczN1U1SjV2VTBOckRwdWJtdDRzV3FBRG1zdG9wRmkvT1NLZ2VDMWpl?=
 =?utf-8?B?a0lxOVpMNVY5S0x2Wml5OFM3c0xCdkRpSnMrZTN4V09ySjFTTVd3bXZBQ05I?=
 =?utf-8?B?ZGpJeHVFb0ZvN3dNUVluUFlQUS94ZmdKOUd1WHRHK3hDWkFFMSt1Rnh2Nkhr?=
 =?utf-8?B?WmxCdEVxbzdTRDJ4Qi9sYjZnTGU5UmNva0kwTjF6UXpUZnZSblpnMllVdG5x?=
 =?utf-8?B?cHkrS29Ga1JQd2FNOGxRWWp1SVhZREVnSlNGMnVEUWxnMFM5WnNwMUtKeEg5?=
 =?utf-8?B?TzFjNTBreVlibjFjS3FET0dYREVQSUFWeHlxdUkvMFZ2OC82K2tlKzRlYXhO?=
 =?utf-8?B?TnJJNlQrWXRDK2JYcjlPZVRZbFRSNGU1QzBHOFpEaUhXVXlKMktLMW9Hc211?=
 =?utf-8?B?Nnlza0VXZ3QwYXdwcElLdlYvWlBmVlVLYmszRVQvbCs5OVdOS2ZnMDdnRVR2?=
 =?utf-8?B?dERYWFBKVDRqTktPSjI3QmVyZ2tqYnNOdHNhdFQ5MjV4SlJxSkIrbk80ckM0?=
 =?utf-8?B?eFphZ3dNUkxCRlZvTWhLWTlTV0FYYWV4Q1NCVEdMSnFHS2taOEUxcTBDUXhm?=
 =?utf-8?B?MU5GOWlLZjlTMExkVzhydHlYRFNJaEdKcWxDZlF3MURkNllpMzNVcVFmYVdH?=
 =?utf-8?B?NXlXcGNPNGVGMGladkdjN2tYTkE3OU1DbW5iVHBDcE95R294c2lFU3daNm5L?=
 =?utf-8?B?blMxWkYwZGJhMG42MU1uUmJFeWJtd1ZpUDAxenZoVjFMM0xBK0JDQzhFeVJN?=
 =?utf-8?Q?E0tNQgpqGITt6aoKzuPyPN0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9bee8f-4a33-4ee4-5df6-08d9b49f1bac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 07:49:30.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TORWFPxzkV/fts1j1o90qEAuFjfxSYg1aoV1RUcqcwjlTeIw9G+DRKa8mZczNakw2+lbEFD0u3SiJw+YGydVEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 30.11.2021 23:01, Andrew Cooper wrote:
> The supported parameter was added in 2d9b91f1aeaa ("VMX/vPMU: fix DebugCtl MSR
> handling"), it laid the groundwork for XSA-269, and in the meantime
> 2a8a8e99feb9 ("x86/vtx: Fix the checking for unknown/invalid MSR_DEBUGCTL
> bits") totally rewrote MSR_DEBUGCTL handling.
> 
> Strip out the parameter again.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit please with ...

> @@ -113,14 +111,13 @@ void vpmu_save(struct vcpu *v);
>  int vpmu_load(struct vcpu *v, bool_t from_guest);
>  void vpmu_dump(struct vcpu *v);
>  
> -static inline int vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content,
> -                                uint64_t supported)
> +static inline int vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
>  {
> -    return vpmu_do_msr(msr, &msr_content, supported, 1);
> +    return vpmu_do_msr(msr, &msr_content, 1);

... "true" and ...

>  }
>  static inline int vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
>  {
> -    return vpmu_do_msr(msr, msr_content, 0, 0);
> +    return vpmu_do_msr(msr, msr_content, 0);

... "false" used respectively, as you're touching this anyway.

Jan


