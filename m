Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625C6469764
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:44:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238986.414217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEI5-0003oE-KT; Mon, 06 Dec 2021 13:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238986.414217; Mon, 06 Dec 2021 13:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEI5-0003mE-HJ; Mon, 06 Dec 2021 13:44:25 +0000
Received: by outflank-mailman (input) for mailman id 238986;
 Mon, 06 Dec 2021 13:44:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEI4-0003m8-RU
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:44:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f1158ba-569a-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:44:23 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-Gy1gicE4MD2T2FoWTTZijw-1; Mon, 06 Dec 2021 14:44:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.28; Mon, 6 Dec
 2021 13:44:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:44:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0082.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Mon, 6 Dec 2021 13:44:19 +0000
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
X-Inumbo-ID: 9f1158ba-569a-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638798263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJFCJ+Hmy/dkB/YXnNr1iTVUpk9yYd3VJjNm55eawj0=;
	b=gNzmHkrHptFMb/HKoEFDew2qfWFLjUXSz13JpMMrmDAyJ+mpjl7Wk9j3aKY09UxhAe5WZV
	002+MQQoU/kwi+4wk/q/DXAz9+HHW7IXhm5Wmc5aOVBfi1/oLDZuPPfJleShJbr6IEjYa9
	sHnzenq2jFQIBJUf4vwTNEjJ7K5+AAc=
X-MC-Unique: Gy1gicE4MD2T2FoWTTZijw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BteJ8c849aEBVZebx0yqy/FO+s1TvAYTK7xJ6c5khE2xS/87qlHn7xBZRg2tnuhQANvrCvvNumw23/CmMry3ood826waBM7eecBmdKl9DwfLKVsfK/BNOleOh2xzZmu2aU9+4INyxWx+NPg2B0bE6q4UPga2gGu/XVmyGL0eHFd9xqvpHrW7YL2WFVb9R3YSgZt8mrlBNllPGQJvsmBM3E2LD+R1srvPKI+5LUcwWPGCCt2ql5W1NmyVXFKqYmeb67z7mGmnkBMPSluVC8FqdSFmxahv4XL5JUXzWasJf/szYaz5ZufUL/o0PeCpS9aRw2rKlaumdolNSHxK6qohhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJFCJ+Hmy/dkB/YXnNr1iTVUpk9yYd3VJjNm55eawj0=;
 b=c4KTLORYW97xsuabWyadkMUQPEOJZtjnuHujf+NBfaBxFFqSPbDENsl6mDvSFvHmhrmtA3fAXerudA8Mv/Z86zQJnXH4rmK0pWkZ5TRkUrJRD9DkygcrQesDhdRSwbi9obdyy+2oYEDBUJZtM2p+wBuJCZECxHqr2e5FxU76U4K6Mb9tK8EYX/oP2ZvOFQze7K7fs/P4upBWuhFidCAX/hyXlcqt/Bf7ipj0J9Ig5f2aFcGIFHsZx9plaKv9OboYXc3ihRU8y4d0Q9r2s6jEdxOtudFMaGW3OTb93TqoCHSZmQyeqZ8c8tlTVmQr070idMXM0ik9yFhM0ftL4CXDhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
Date: Mon, 6 Dec 2021 14:44:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
 <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
 <24992.55453.893877.246946@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24992.55453.893877.246946@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0082.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c47d6114-6942-4c9c-7aed-08d9b8be8178
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590273026E7A885776D7799AB36D9@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iwO/dhOQYikzIpndVzqr1vl3Gw2I9/KecSzB9m0UTlFbBSdO7jqNJZhuTbakpcPcjuirlTxxcZfzdhxiZd5+0O6qK7h86Jg5NPGkKhGINKh2HKBetMeJpADlY9D77hwy4N4+vVk9JJNpPXdktqavNirlgssgR6aCCIB+FSkpVQpKLSbtV12Xqr/NtQrlTfpIq3sO6O0uILCBCVUAWHdwE2hDypLO1S5z6S7khlzx1WOVIX4V7TfnFznT5zBiXEDmJWikmXaFvVWys/63XWXYNH4LJ3iyqicm7mcUCUl13jra5Skk4EC0Ojw6sFE15BcR+CrtXdHlrHb9mEOYe2HmBrdLINsBOkjmcbfnOBN9oDNYJmRvY4GsoEA9mCvo2noPCMuKa6n4NaimsBkMWJbbR50FE6LwjbPOnY196nSGSY8hu79o1Kz5XJ/HuUE7gcq41t99ktZ4OVCL+37g+j8dlECmij3wgq5sq/8Biy6JzLHYvjrmslWrM+YfbVi1diWfJt0/Y8PcuSbJ6Qpf7zCMx2A5yPoR0HlUxdi3xsR6AqcKQuD2neo8wSLMpvG2IVd329w6WckaMw83byqLMqq93U9bLv9x2ZuxfwGA5Bd7H8ZqsYUIFF5RgGv4C31hioSK/+cJnh85rr1HIIJvivO61jsV4TLagoCEQdFx/oykUWIstioRb5UH49QywofittfOH0ZthR/wo1cMSihhmrTGQiMWw8z49BxQozq8jgIjo2Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(66476007)(8936002)(6916009)(66946007)(8676002)(53546011)(956004)(2616005)(4326008)(186003)(66556008)(26005)(6486002)(5660300002)(54906003)(2906002)(316002)(16576012)(36756003)(508600001)(31696002)(86362001)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzEvVzFVUGh4eFVEckhQL0JUek9aQVVFeHhpQlN6SGFLa0VaL1JkUmhBUzlW?=
 =?utf-8?B?eWJYUndraXh1SFRTeGgyUU9XUWM5TUlORWphTERHZDFrUXgxVTFJUnFPRTk2?=
 =?utf-8?B?bmptVEFyR0NkUFViUU4yYkd4cGFpL3kzKzRtbFF4S0xDd1J6N2p1TzdsZzdC?=
 =?utf-8?B?b2Z0T2pqNDM3emlDWU14Q09VVk5yWXZzTkZrV1lHK1pBS1dCbG5lWmZSdHpY?=
 =?utf-8?B?SytXcW9zMnMzNmtnZ2hpdVJ6YnYyQUxRTHVlbWtpckZ3aU5UMzZIbXFwS1hn?=
 =?utf-8?B?RXRwZlVmWkxSQ1pRdWpUR1F5aU95K2tzVDBtdkRwakVPVnVWbFdkSXFNNGxj?=
 =?utf-8?B?dW5uVmRERnF5dUtSTFoxL2N6N01mMTZDK3B1RDRoTy91b291WnVzeCtjQ0lC?=
 =?utf-8?B?bU1Wa3JCMHBxSnRqQ2xJbEJyRGs2WDNJZFllSkh5ckkxVXovMGNuQ3NQVkht?=
 =?utf-8?B?TnA1T1dTd2I3ZUJKaFZmRDdlazJQSjVNZTcvL2ZNWk41QXk2a29rVVZ0Yjda?=
 =?utf-8?B?M1ZJRGF5c0Z3Rk1Mak9MWW04SDdqa3F4dUFYNFV5K2l1YlRSeU9IRDRvN2Jy?=
 =?utf-8?B?QVZ1RjlnTDA5RmhYUzVvM0lZM0ppS2tadDJjNmUvNHAvWlViZVgyZGQxRFFW?=
 =?utf-8?B?Q0JjOXVCZDB0NkRCeXdDWDZhK3lLUmN1V0dOaDZaMFRSVjBEWW9iSFlnMFBL?=
 =?utf-8?B?RlBmajlPbk56cHVTMW1aY3AzV0V2aUdRZ3hCNm9Rck1YSUJxVUFmTEx3clhj?=
 =?utf-8?B?TDlqdGllQVR4cE1GdG1nRm9MLzlYbmJUZlJkUEVRUm1KUjJTTElmZmxkVmc2?=
 =?utf-8?B?QWR5WHBtRzdzNlhNRGJHdmYzZjJBZkJZNEtDVFhTU3ZrdjF3cjdLUlNZUDBV?=
 =?utf-8?B?YVl1SC9oSis3czZlaERyQ0JkTFBEZlBnYklJSUxqUzR5UmdLT0o4WkZqWlRU?=
 =?utf-8?B?OXpNNHd5RVRHUklWTytvdWZSK0lVNC81WU1KMDFvTGg3elhmYkdFdTJWbC83?=
 =?utf-8?B?NzhRK0l1Y3lOemtzVUNrbEtET20zL2lKejlydmxPdVovbUQ3VGNtZy9ZS3Jj?=
 =?utf-8?B?bnZSaWpyUkVWTVBobmpvUkxiMlArcTA0SlRnRnMrejZzYU5kRGdiQ0FUN0VC?=
 =?utf-8?B?TWNZSW9vZ3dMOVVkWnRtWFR0WnFvczZuSWtxSUhYd1h0a2g1T1paZzd5eHNh?=
 =?utf-8?B?eXRMY09nQkdubGtkeUY3cUljUFVmK092OXZJRVJYTzh6azNkclVhSG1xUFB3?=
 =?utf-8?B?Ulh4UDZ0cFFpbSs1R2dESXBBbHFQM0Qyam5OK0xqbjhvMnhZaG5qMldFL1Ur?=
 =?utf-8?B?N1NzdHA5ajBkNWphVlNielJoUDd6R1gzRHZjMmpleTNjbWQrZFo2NDN0MDJW?=
 =?utf-8?B?T3VlY3c5ZHQ5b0UyMm14NGxZRlZhdTc0MXpZa3VIWjFlQjc4UmZxRklJSG5q?=
 =?utf-8?B?SHdoMGRwNTlRQjgvNWIxRElZYkI5Nk5valdCSVhyWEFtbW15WkpuZHpTalJk?=
 =?utf-8?B?RG91NTB5eW5DNUVEa1ExbllMVHozYXZKS2JDZVNYdVJtaEpGM3hubzB3NGVY?=
 =?utf-8?B?UnBGSis2UUZ1a3AvNXE3Q3ExVWFKdVUxWTkyd3VYakR4OWJQRVFPeWtDVkNG?=
 =?utf-8?B?T0RnUk5KWHRJQ3hLaGYvVnFoNWNtRHowSGJKbzVSL0ZsTzhKcWErWjhySkdP?=
 =?utf-8?B?RnBwTVhydloxN2Exa0NkbXIzUXJEcXk2ZUVyMHYrdThJQmlSczhwdkhkaXZz?=
 =?utf-8?B?aXJUc2wzMzF2bjdjVGFPNTNTcXV3Wk0wcTAzZFFtVm5sY2tETE1nTUdrbVZL?=
 =?utf-8?B?bjlENFFlM2w0TGtwRndnS0o4SVcxNUZSSE5Ydk5TSGdmcDE0YjdFMVJOUXFB?=
 =?utf-8?B?TEE2TzYxVkR3USsvRlN1QjBFdC8vbGc5SmpaWGdlbXlsTHhYeGEyOFdaYnRU?=
 =?utf-8?B?Yy9xdkNnb0JUM05tY09hdFA4cWlic1RpQmEzUGNTdjlPTmZFckhESW53bDcy?=
 =?utf-8?B?RkVFWURTdnAwQ3FKTGVhU3RaK1JBNmFlYm94Szl4UW16ODUvcEczTnVKa1ZX?=
 =?utf-8?B?TlNkY3hHaDhuRktYWTdqZktNWW1ZcEx3QmE2WGZzcU1yNE9yMmRJSzdpTGhu?=
 =?utf-8?B?R2ZWMCtkUmw1b2FBbWNyc3hYM2Ixc0FNVjlCcE54dEhqbVZaREU3b0wxTG40?=
 =?utf-8?Q?vQ2HgQOHGbKVIf2sx+mei0k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47d6114-6942-4c9c-7aed-08d9b8be8178
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:44:20.6468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgOzgV6LtX7WoEpoimapFYamDW2Y/P4bMmv+81Pc1DG1p6G6ALRCqrr5G+PWHT5Z6RDjkHnoVVO/TxQSMPaR5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 26.11.2021 13:52, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH 1/7] xz: add fall-through comments to a switch statement"):
>> On 26.11.2021 11:04, Julien Grall wrote:
>>> For this case, you provided some sort of an explanation but so far, I am 
>>> still waiting for a link to confirm that the signed-off-by match the one 
>>> on the ML.
>>
>> I haven't been able to easily find a mail archive holding this patch.
> 
> I 100% agree with Julien on all points in this thread.
> 
> Please can we keep the Linux S-o-b.
> 
> Note that S-o-b is not a chain of *approval* (whose relevance to us is
> debateable) but but a chain of *custody and transmission* for
> copyright/licence/gdpr purposes.  That latter chain is hightly
> relevant to us.
> 
> All such S-o-b should be retained.
> 
> Of course if you got the patch somewhere other than the Linux commit,
> then the chain of custody doesn't pass through the Linux commit.  But
> in that case I expect you to be able to say where you got it.

I've submitted v2 with S-o-b restored as far as necessary to meet this
requirement. I did not restore all of them, because I continue to not
see the value of retaining them. You saying "is highly relevant to us"
is a statement, but not an explanation of why tags beyond those in the
original submissions need retaining.

Without me seeing the need / value, I'm afraid I see only two ways
forward: Either things are acceptable as they are now (and will be for
future similar imports), or it needs to be someone else to put time
into spotting and then pulling in such changes.

Jan


