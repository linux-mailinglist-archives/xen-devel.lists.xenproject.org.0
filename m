Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD9D5385D0
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 18:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338674.563477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhqO-0000h2-BH; Mon, 30 May 2022 16:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338674.563477; Mon, 30 May 2022 16:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhqO-0000eV-7Q; Mon, 30 May 2022 16:02:12 +0000
Received: by outflank-mailman (input) for mailman id 338674;
 Mon, 30 May 2022 16:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvhqM-0000eP-D0
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 16:02:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbc41cee-e031-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 18:02:09 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-SXw1-8XJM4GgAodYt57uKw-1; Mon, 30 May 2022 18:02:07 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5719.eurprd04.prod.outlook.com (2603:10a6:20b:a1::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 16:02:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 16:02:05 +0000
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
X-Inumbo-ID: dbc41cee-e031-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653926528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37TxpXbybYBIxNoDM6WFgoDWLtH6YyngDzP+YKk8ZIw=;
	b=XwjkitCScrK6y1i3UL/JXb87Bzr0DUDhb9G+gLUMZXH94HibbuTTTbNcWriirfqwNjRZ8v
	OKo5TPGzqfBeii/Z20AWOtHPrX/D4lUYi53YEddt11pW++bcLGqfWTWuc4HJk9xGUYpDvj
	6dvT19otjXo6qZFU7gTCoce/Zy5NVck=
X-MC-Unique: SXw1-8XJM4GgAodYt57uKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjmW9b5W8Bg7VSap1gLWdMAPUfsxuMH9Q6W84zCBqedHZsv0UUhhkW61pKeIqdk7J24Iiply1M6VUX96weW5q7dxie/JPr1QuejCNas7j/hywfJDBbLPaztXT8M2kA+ID9sDn7dO6K9a15MdVrR4QbJtH6FrJJm2awP/GCfm797vlYuZgOpKlOWKJGWCEI7JLULRPALbLTeWWdc+mLDLdr2rSoj8MKo2NkPQoA+wngXcAFxRCoOre3kfYxBHqkPl86F+u9XTyolhtk5DrJ7RtE4IDMVCYQS0GwV4GPSW5Y0YXT/p0rBsLs55dSbi87ZvIJGkHAuwwQpGUCzWhRGpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37TxpXbybYBIxNoDM6WFgoDWLtH6YyngDzP+YKk8ZIw=;
 b=AuBbPfayWRu8xIeK7UShNw5245j6YFo81ZGhJ/5QwVyQuTetpvDT2GX9eHGmuEg72HPjmhqKeLaLV7+0xK5Ph32lwXiwzR0SzVNSi5z70DT4ryBHr1e6a65Y+MfLVuB9igaZS02vxQuco2c8bSwCL4Ww1moKrOaWhnMBpC7zZy9WYUc2X54aYcxtCvNMUCTfQG0F7DC8tlk8IuKENtNdfOmTrgBF9sm7JzunhSTgxqUEXAVZRa7cdjJ7o4+nRCQBn/6P4kFamBHFQof0XCLh3DjpBTmwXUwa24GTDFzp2BSkWZKzObsPuvDcCMeKvbJe8THwlVWJRAiGrOBgjeJfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <230bb122-de08-3279-29d7-1353449845ae@suse.com>
Date: Mon, 30 May 2022 18:02:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/5] x86/vmx: handle no model-specific LBR presence
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220520133746.66142-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0021.eurprd04.prod.outlook.com
 (2603:10a6:203:90::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e1a4d1c-ed7f-42f9-e915-08da4255be22
X-MS-TrafficTypeDiagnostic: AM6PR04MB5719:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5719E317216A9C2D07C2E054B3DD9@AM6PR04MB5719.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cY1QpWffffoKzJbDAXQ14NLyOQrOVrfOk7N+lnPc/UhOR94I4SpjbXe55ZckTZ3SV8iLY3EdMsOqG36ziHnuN5QQZjZOMBNIdLFEkhAJd8+y3exkKjZsY9K82tuLwrjZ6Dl99ld7I3VxXfWzDlK6ErQTLU5iVezng6rgaaj+zZXznE2OXxgSVHEtRoqy0HsPMBmSaUBFdzm6GsqWSjdP+6mL+n/I0PfiwGy4g4f0/CoDuUZ2yqMpwXfw3PULfNE0vkt3bmYqe9WnpGvkA5XEPp2EdSZkh8zQX3sYMm+BXueolDSpFkCHtSqW7b8ZbImIsed4JLGgifueT7OR/bQvg6oHRFsdgrH65I+bpLA+DV/KWaOo8eQkNpIFqMme34uwx6MpmZ4rkCKltZzcJ+QxUo7v/htdu2eygqHrho9MkTO08AYgIDlihROG0MTrbJ/JCZJjrQZFVdC2G6jct683+qp0YycOcgPEqsLmueoQeUtOmyMV7+DV+tpkM93/ttGXwSjxB9fd+1IWAQpjv6yhRheVnuIix7TgJNlPwKVrtUpZARN9MVo/2bm6f4rKjyGMpJqlpELgDUNAhPGJ/TGq1JvHbxZ7NYN5VSzHeH6X15CtRsfjFDKAxfreXdEtpyvNNokpyeNHYgwLMDcZooMGq3fc+C8r/zEo7Ns+c7rfbNgYGJ1rkP9zCcaLrVki7EVs5rDKmMibvqvSlXkrtzYg/vDaG1MSRxjHLEFkHc60hJgqExU9lhkLrj+O4uOq2fRf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(5660300002)(6486002)(53546011)(66946007)(8936002)(6506007)(86362001)(31696002)(26005)(6512007)(6666004)(2906002)(66556008)(38100700002)(2616005)(186003)(31686004)(54906003)(36756003)(6916009)(8676002)(316002)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEFLZ0gwS2xWRHlnTDUwZTVWanlFR1pTcUx2d0hWa0kyaVVEVFV3QjEvQmZQ?=
 =?utf-8?B?bzJ6NkdkL0JPaHo1alF3Z09SM1hPRWdiRTFYQjFIbXpFci9jN3h6dlNBamZF?=
 =?utf-8?B?SkFuUjRIa2lhUGswN0dpYkErUjFCeDFsc2ZQVXc3T1loR3Ayb3VEZGtNc29u?=
 =?utf-8?B?TW1ZZjg3bEtGWmxBZGh5MXNYTnFTWisyVTRMT1MzVXRPamhxQlB2bnR0VDNQ?=
 =?utf-8?B?dUxsY29rS2ZKMDZ4YjQxRWtGRmlweTNiY1JzTWN4UDlma3ZpYTRjcFF3MDY5?=
 =?utf-8?B?VDkvUEhyTFIwOGpsZ25JYkdUWUtIamhXbnV1c2xvUC9iTVN4MW5wS3Z2UVEz?=
 =?utf-8?B?YWl4Zi9Sb1FyZVdHTHFkYWo2Smp4bitCVzM0NFlCdGk1VnZTc2FBd0FCdmVK?=
 =?utf-8?B?YzBmMDhIdllES0p1VGhnNDZOaFl0QkQ2dmxnQVFLTG55QXNIbTN5Z3pGMmZx?=
 =?utf-8?B?bEdBU1ljaDFtdE5HZnh3UStDMnlxRGRqUWthSkVIWFBuSWFPWEFteFptTEpu?=
 =?utf-8?B?SlFDVnRFamVJdWF6M3RIcG5vVHR1b2R5YWovblRGM05OVzdCaFJNNVVZTGd4?=
 =?utf-8?B?WFQ2WVVuR1UrWXhTQ1MrY2gyTUJtK3FGVlB4NVYwUCs3a1lzWC9lVUpvOTl5?=
 =?utf-8?B?WmdpUzBQM0F2ZXUxcWtNc0NoSEJDNnhVWm1QT2Z0bG0yM3F2S3g2eERMeUF6?=
 =?utf-8?B?am1hTW1CSUMyS2FBbWdFemFvcFk4VytFSCtpQno2MkZ3M1ZRTmlQOURVNFJZ?=
 =?utf-8?B?MnJadWhodk5DU2VYc09LcXN4QjF0aFNSVS9udm1RbjdXT2ROYXEzTFZkUTNp?=
 =?utf-8?B?K1BYaGFENWZjekIwaEl2M3kvZ1JtWmg2TGRnUG1saFovYVIxSGZJTDVDWktR?=
 =?utf-8?B?Q3pZdW0rNFBZNXNCbTVsczFZVjNYYXhuU1hCNVg5REZxRTMvakh2VndTODBH?=
 =?utf-8?B?SVMrZ1BtSCt6MGtKS2lyYlRaQ29sQWRzVEFJcjFtSmxGeDZpMXBHVHBDNDkv?=
 =?utf-8?B?Sk5adUNGVXBPSDY3YVpQc1ozeml6aFhXSHA1QktMa0xFek5BeStxbHYrS1Jj?=
 =?utf-8?B?aTZNaVVWdktQanZjazlvMkxQNW93dmorcFU2blJYbE1rYWs5UHhyYWZ1Qmts?=
 =?utf-8?B?dHlTQi9RdmFFZTU0dHFkdUtvNjdSV0dlMmlCbllnWFpVdlRkWElUY01hSm1k?=
 =?utf-8?B?cXlZeWFSZUZBYkVaTkxsU0JaVHhYUFc2WWMrcFZsUVhIZVhLMHRHN3ZIUlFN?=
 =?utf-8?B?SXZNd1ByUzJtUzNEaDNwL1NxZ1dESjNHWUEyZWRNOXJnR3BtTEhIZkJ5emU4?=
 =?utf-8?B?emY1b2dBN2tHYWZrZi9tcndzaVRpc0QzZklzMUlXN0M0Z3A5ZlhpT3BIUjFx?=
 =?utf-8?B?aHZJY1RZdXNlMGFqMXhMSWJWQ0NZRTlpdzZNTm9xRVVydnQ0NXVyT1BDRmhE?=
 =?utf-8?B?eHRJKzd6a3pBY0Fic0thN0hQMEM5aWxvVWRLaktBejBSZnkvMjNCa2RVS01i?=
 =?utf-8?B?bTgwbWd1QmwzSFFBRGM4L1ZmNHNrcGI2c3h6aWJkbU9rclE5ZWVnTGlyaC9U?=
 =?utf-8?B?Q3hoTXdHNklTWGFhaFcvQzV4c2UrYlM4RkJidkMwSCt0U1NKNk9DaFp6a091?=
 =?utf-8?B?WFlkVDZ6cGZiQ0c3YVFjSHFWaFAwd1ViMG92V09mVkphbmNpb0F6RTVMK2JB?=
 =?utf-8?B?N2JnangzV1NQdlpsUEFVSXVBaVZtdGhETVZSbjl0UnArcHlwczlXa0lmVHVH?=
 =?utf-8?B?N2tMbXVNVXhYemRyQ1BRWVhEdEgwWnNOWmhxSVZGckFCaERhQi9wazVPbHFW?=
 =?utf-8?B?Mk0wdnRSVGw3UnJtSkZCajJXMHl3b3Q5VkRiZitZQnRxRGtzaE1haHZJbGt1?=
 =?utf-8?B?eGxjeUNiVGV1ME5Nam1qclMvZ0RabnhXdmtDSUIwckYxM25pU3d2MUlHckgr?=
 =?utf-8?B?TllIN0xJcWQ3REc3UG8vdmxTTXo2UU9WT1V3OWNxTlM4dzRmYU1uQnhucWth?=
 =?utf-8?B?cndmRFhFN0tqMmsybkF3MC9lYWdTd3ZYR0llT2R5TkFvdkJKcy9uU003RGx1?=
 =?utf-8?B?WlpVWjZibFExSWNINGREeUZETGJZREZmMTBNZ1haaDhqbUc4Y3l6b3h4a1E1?=
 =?utf-8?B?cytJdjQwZVRoV0xzZDdJdzdLVXNKNHczQUFpZGRMUGNPd1p1VHU4WlFoWUdP?=
 =?utf-8?B?S1RDbDRsaVdlVWpJSDBjemVDd2JkN0ZyendPbGh5RWRTZ0RuRExkM25VVHdO?=
 =?utf-8?B?WngzWFpmbWhVNlNVT2NNcWJ2d0FBUy9LTGh0OFZWUzhUNjdFeUJ3dFptN25r?=
 =?utf-8?B?N0xkVGxQTWFudWlQVXU1SkxINHhkRHZmRFFBbUIvSTlLRVorUk1OUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1a4d1c-ed7f-42f9-e915-08da4255be22
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 16:02:05.7208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQefZrzKfZ4kauy5NwKUSGS7An+ccNPozFaVNicFyw5EkvboC4KXjH7bP4iBZc86vYLA0aK3+eaeKuE7IoCwCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5719

On 20.05.2022 15:37, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3007,6 +3007,8 @@ static const struct lbr_info {
>      { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO },
>      { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO },
>      { 0, 0 }
> +}, no_lbr[] = {
> +    {0, 0}
>  };

Instead of introducing this and ...

> @@ -3070,6 +3072,21 @@ static const struct lbr_info *last_branch_msr_get(void)
>          /* Goldmont */
>          case 0x5c: case 0x5f:
>              return gm_lbr;
> +
> +        default:
> +            if ( cpu_has_pdcm )
> +            {
> +                uint64_t cap;
> +
> +                rdmsrl(MSR_IA32_PERF_CAPABILITIES, cap);
> +                if ( (cap & MSR_IA32_PERF_CAP_LBR_FORMAT) == 0x3f )
> +                    /*
> +                     * On processors that do not support model-specific LBRs,
> +                     * PERF_CAPABILITIES.LBR_FMT will have the value 0x3f.
> +                     */
> +                    return no_lbr;

... doing this MSR read every time, can't you store a mask value
once during boot, which you apply to msr_content ...

> @@ -3521,6 +3538,8 @@ static int cf_check vmx_msr_write_intercept(
>                  return X86EMUL_OKAY;
>              }
>  
> +            if ( lbr->count )
> +            {
>              for ( ; lbr->count; lbr++ )
>              {
>                  unsigned int i;

... ahead of the bigger if() enclosing this code (thus also avoiding
the need to re-indent)?

Jan


