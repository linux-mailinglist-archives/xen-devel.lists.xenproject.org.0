Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A98745E88C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 08:38:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232323.402747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqVo9-0008Mj-Ph; Fri, 26 Nov 2021 07:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232323.402747; Fri, 26 Nov 2021 07:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqVo9-0008JD-JV; Fri, 26 Nov 2021 07:38:09 +0000
Received: by outflank-mailman (input) for mailman id 232323;
 Fri, 26 Nov 2021 07:38:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqVo7-0008J1-Fc
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 07:38:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb2f9118-4e8b-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 08:38:06 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-zuKuSu6EO4qSMVNaNoXFSA-1; Fri, 26 Nov 2021 08:38:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 26 Nov
 2021 07:38:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 07:38:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0070.eurprd06.prod.outlook.com (2603:10a6:20b:464::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Fri, 26 Nov 2021 07:38:00 +0000
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
X-Inumbo-ID: cb2f9118-4e8b-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637912285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jbMDIm8r/E/Dx5ukXSVlralAVqlm8TXP7b9TxtnTxo8=;
	b=ZRtDc02sGuZ3L1R+nsAWFC/9fU+F1qL6qgGH61j3UV9zPBtrOJSaoChtmHjcXNJ95VmZPP
	HCPzlkLiXfJMAlupT3uWAd9As9aAiKR1xCQH74fv6AFXki2ozOL0lfxiWhl/2DpwgLb2Wm
	B3oICypG0ZtIVPUiiYOLoXnbMOv87zM=
X-MC-Unique: zuKuSu6EO4qSMVNaNoXFSA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePI1aFNFn7aWEaBCvCO+9HXO8nOHPXBdWafUzXuEnI4Bcj22X+v6wYfpUtPhG9md7m0kiIFhySUM0B4Bth76AYo9TgD+yF/MkmGJoMPqJ5zCKV50gOsSIJ03y1fntNC18kWUz+arhehJW/k5Io7FEznHtvNq9jhkI8n60UkJLusV5AkFQCKWK41PDa1BV/o8gnSveMF7tH2tZ/12dR0xgAtbkiKyC+KXNOSBivMjKxtQbou0wqfW5IpeTDUjKwYa3VxWbbb01W4arZVLnU/49VGeGQqEHAEaTQ4gV+qwuhYmvxWG5lgxJ5ZADT63J707Ip9+gBl//ytpMOgE610rAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbMDIm8r/E/Dx5ukXSVlralAVqlm8TXP7b9TxtnTxo8=;
 b=EY7EpBZj9YEpZB39ttRYqfclFPjpMAAUnekW4Izn5+GazizRJPXiaJpN7tKxiI46ltlUFgIiJ8dlTDaQgrHaDQz0IRsOa1ude0eNXIrCD7hOcLXVJ/qx9PAWYVuL+6nNtCjq2pJoPLJEXAx6PF6/Dt9nUXhsRS+68VGxJ7uGBxev8oqhgUcdvZGe3pPZo3iDFyd+R3nQFgC8omFgx5elP012aeJIUhDns9R1ZvwPiFUOljgqaP9l9jXAWwDqEk3U2EWc99+zfX/ghjzNZ3N/FNLRD0iM6pIJHyJ7b8uPw+vOqH0qGsPRTUbsNho1y1rS+vRYmnjxYZ76jomIoTinJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
Date: Fri, 26 Nov 2021 08:37:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0070.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9f01b7a-f05f-40d2-febb-08d9b0afacac
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23369AA62F514EF34938597DB3639@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OGTyJ32rHcnUyuOdF8fV63Hpib4BCLdrh2sJ6PvoLDQO4vAOFPFySuvErliOnkiMZgKbLjzIvBY0fUC6ERUOu5gmcorg7umbX+cB2sLFEOfYQRWgcGvSzrdmJd/4oiN0iu99T8t8WV06g0XMqxkLfBMHRPCCAYcS8F4g16Pwlm0Hhk/yL+ys9tsklb3EuyKNokUAlIeuejBTbtSNcluA5IEnDBWV5RMDG8dpCUmTwAZZ0R5JswFY8jpnBBTVqfNsyY3iQrzFTHsqy2f2Q72NFYSBYaE64bWAF29Grdh68I77hGkwVmE2E/VjSRC9hshmC5aDwqEJRH+Y9tnn+uGlHpHxhqzDfETvjr6XbVx+Vf4RYlJZYrp9iUM0AcGLoYUTMhFjJcbOUnZ2hG7BHC3+H0HaVIuXydDrd4DLsx+HEy6jio6gXi8oloKqCCjxktV448UF+1SQ3OTC3YReHiX3BktU4kdKrL3FZiVdrlbCx/hFXNnOsBInb3KKDK7ZrHv6R5Tt4SWzmqrUBHJKx+JpDUj8B5103c3fz8GLgZHQyueS9+Q8RYgCIJQfUFCzw3zxzRRCcOti3beqUhYLAo1zlEl5TiCpQxbL3laLt4Lyt1qHfAcnOJ3SnUHDwR5u+bsYau3bOfK9b4vs+mnL5ORpls+s4MmU8FGrXRKh7LIuJaXVEzWrnzyavUNOg00AwZUqoKsw8o9GzvymeYYgcfp6V2KaJO63F428F6GUY/7bHKU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(508600001)(54906003)(31686004)(2616005)(956004)(38100700002)(26005)(186003)(53546011)(316002)(66556008)(31696002)(66476007)(16576012)(2906002)(8936002)(5660300002)(36756003)(8676002)(4326008)(66946007)(86362001)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjUzR2J1Mm5OTWc0Z043M2FJVzhLbUdFTjdIcTlQWW5ydjdtdkVZQ09NNlc3?=
 =?utf-8?B?M3I1N3FEWGQxZ09zV1BwYkU4MUhiVUFvOFNzQzlXSCtpY1hRVTVpbHBad0J6?=
 =?utf-8?B?cW82UzVuejNKUkxwUEVSa25pUHBzR096RTdsNnorcGRVOTRMYndyb3Q4OWxp?=
 =?utf-8?B?MkpYVU44dVZmcVZidm5mb2d1RitZQjFYVEtwYUVKcjR0ZG5BZ3VYVlNJWFEw?=
 =?utf-8?B?V1k1cHNSaWZ1OG44ZFMrbFVpelppOEJVMmJET3B4TGw2bFBzblRBNjBXQ3lr?=
 =?utf-8?B?b1M2UzBKL1cwcFBSUmIyMUxzNVA3dHpaVHpiSVhudVR3TFBqWVVBUXZObVpV?=
 =?utf-8?B?b0ltQkU4STBzSVhXRVFzWk12dWdZT09WOFYwNndKZVFsTGNhWjMybVlsVE54?=
 =?utf-8?B?RWNGL3o0YUVpTGNCb2ZkMUhYd0hrR2RmaGkzVi9mM1Y2VmtxZzI3OUJoMU5F?=
 =?utf-8?B?dmZONDJTYWU3bGdPRXdWTU9DY3ZuZmQrQXNoUE5Fb2dsaGtLdUNvSXMrMmRj?=
 =?utf-8?B?K2Y2cHFJcWpjSkVzVFNydCtEazVrdy8yd0hWM2NaaTJKT3k3QlB2LzNuTDEz?=
 =?utf-8?B?L2VjWVhZQkNXQjFMUzZIK2hXVWpRQ3g2U3lScjIvRkpUajJCd3JESjgxNlZW?=
 =?utf-8?B?KzdoeTg4SGdvNE9tTkNKNlMzUnU0bnFZb1U4Z1pJVlVzaVlGWllzbGJtd2pI?=
 =?utf-8?B?WXJTWm1LK29aZnRqQWZSU2lQWGJHVnVkOVBtTUlzUjBsQW8zQW5kZkxwTUxU?=
 =?utf-8?B?QWRKa29WNE4wWVNyVDF1MmJvalQ2K3owWHhUbzI2Y0tMcnorbnVVdTFiOHZI?=
 =?utf-8?B?UE0yTXpNdDZ4cUFCNUhrV2w3b3l4Q0tQR0VGSjVMMU9oSFRYZ0ZreUhQV0w4?=
 =?utf-8?B?M0ZENi9KcmMwR3JsaDdXYmFxa0VuSlA2LytCRFdteDJRS3A5VXNDNm9FSkVY?=
 =?utf-8?B?TmRoOHdnenhTNzU1YnFFZUxuYUI1ZUltbGVieUU1VjBPQnM5VUppZWhnUi9W?=
 =?utf-8?B?byttYW9iS3hsR0MwSnpLK1BjQ0RBWHR3d2gvYmQ3Szc3Z2RWN3FPT1JCM2xm?=
 =?utf-8?B?UmUwM2hJc1FMYWk2NVpvNDhaWldrWmNXdmN5YXR6S3VjNDAvaFhFK1RwdnJO?=
 =?utf-8?B?OWFJL2loL3c0eTloamgyTmpFRUtWRnJkV3pYM3B0Z3R4U0UwZGdmajI0dGdI?=
 =?utf-8?B?Qi9kQXVwSHpwcllCc2pUS3h3ZTZZZHVWcUdXQXY4ODJNWFh4NUV5RXR5R2c4?=
 =?utf-8?B?QmdUb3BDQnVudmVxSTI2VnEweTcyTHdhNnozbE9PbjNRQ0pTTHpyNmFGWEFu?=
 =?utf-8?B?cU1FSW90S2tFSzBuaGJxWDcya2I0aTVnTGJ4eW1TWHk5ZFJWdWNmR2NKd0hP?=
 =?utf-8?B?K09LdkRzRUpLRGpSbWFIU2F3cnZjMTU3NFdpL3hpRlBlUUl2T0J0K2tyWUVv?=
 =?utf-8?B?SXpOOUsvVVNpRkUzNFdLSHJPSnVucjY4azNvNUJMa0Nyb3FHYmxsK2wvL01R?=
 =?utf-8?B?WDMycnRCa2ptYWk5VjZEeGJtTHBqcG1WUGh2eGZib1V2MUVZRTJQYWZTRllJ?=
 =?utf-8?B?V2lpaHJNVWt4QmhTS20xMXMwSjZFUDlEdDVHTkM4Tzh4MXoyNnZzcVNSNy9u?=
 =?utf-8?B?T3A1V1JlTUxlWWlsOUJKMXRhaStncGZrZGZlQ0NyKzFweDEyTmhudDIzMnRH?=
 =?utf-8?B?L3VnQzFOY2Y0QmRkalJtVmNrbE9CSVZHYTAxcE5JSE90N2NlK0dFN3ROMkNN?=
 =?utf-8?B?YkRNSEgyeXJPQm9SQjl3L0F4cC9nam9tQjZyeTYxUWlRTGpETUc4K2lDb09l?=
 =?utf-8?B?YlB3cEJxNWZ6OHJXQ2JQZTErUW1zVEpZK2Q2U3NOVmk0UFNiVThZWmtYSlBJ?=
 =?utf-8?B?SHNUckVoZmVMSE5EREpBbGlxTmNTcHpkU2tYUXB3dVlVbEt3ejRiRFBwOEZ0?=
 =?utf-8?B?LzNjUnFoMi9BK0tvR29peHJrYmdLWVBuSTZRNzZ6UlN5VUt3d2MvdXpNak9l?=
 =?utf-8?B?bHM5WXBURlpkSnhNMEhsY09LSFJGeFErQnBSYWZXZXpEQWIxMFkzOThDZkRV?=
 =?utf-8?B?aDlnSG80NjFGY3JGdFNoL3p6dkZQTjhXVG41eHpMQ2h0RGdDYXlLY2hWY2Jl?=
 =?utf-8?B?YmtseGZKS2gxTmIyajRmWkhMTllxTEpMYWJGWDFFMjJZa1FjZTZJYUNQSWEy?=
 =?utf-8?Q?9bvceLA/g5IsI3chmixtlCA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f01b7a-f05f-40d2-febb-08d9b0afacac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:38:01.4298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2V/jMBhVO19LOkscAGPFSeUpa4eHkfbkRTH1Cx9S07045rBTBxtK1Qy/W3tQtYEArPnE08hK+7/dDmd7PwyhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 25.11.2021 18:13, Julien Grall wrote:
> Hi,
> 
> On 25/11/2021 17:03, Jan Beulich wrote:
>> On 25.11.2021 17:54, Julien Grall wrote:
>>> On 25/11/2021 16:49, Julien Grall wrote:
>>>> On 19/11/2021 10:21, Jan Beulich wrote:
>>>>> From: Lasse Collin <lasse.collin@tukaani.org>
>>>>>
>>>>> It's good style. I was also told that GCC 7 is more strict and might
>>>>> give a warning when such comments are missing.
>>>>>
>>>>> Suggested-by: Andrei Borzenkov <arvidjaar@gmail.com>
>>>>> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
>>>
>>> Actually, any reason why there are some signed-off-by missing?
>>
>> I often keep the author's, but drop ones which clearly got there only
>> because of the path a patch has taken through trees.
> 
> This might be clear for you. For me, as a reviewer, I have to do extra 
> work to check whether you keeped the relevant signed-off-by.
> 
>> These aren't
>> relevant imo when pulling over the change;
> 
> They are technically part of the "chain of approval".

But the Linux chain of approval is precisely what is of no interest to
us. We need to approve the change ourselves; Linux having had it
approved is merely a data point.

>> I could as well take the
>> email submission as my basis, after all, where just the single S-o-b
>> would be there.
> 
> That's a fair point. That said, you took the commit-as-is from linus.git 

How would you be able to tell?

> so I think we ought to keep them.

I disagree. And I'd like to remain consistent with what I've been doing
in the past.

Jan


