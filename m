Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C653BC754
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 09:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150841.278860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fe2-0000Sq-Ku; Tue, 06 Jul 2021 07:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150841.278860; Tue, 06 Jul 2021 07:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fe2-0000QT-HD; Tue, 06 Jul 2021 07:37:26 +0000
Received: by outflank-mailman (input) for mailman id 150841;
 Tue, 06 Jul 2021 07:37:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0fe1-0000QJ-BZ
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 07:37:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbd11006-f199-4e3e-817d-b6c60ccc035e;
 Tue, 06 Jul 2021 07:37:24 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-V-wAzcdhMQunqJ_fD-lkmw-1; Tue, 06 Jul 2021 09:37:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 07:37:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 07:37:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0101CA0078.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 6 Jul 2021 07:37:20 +0000
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
X-Inumbo-ID: dbd11006-f199-4e3e-817d-b6c60ccc035e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625557043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fC8tvz9K5QTmqAfOBdH/A5HhYPvREcEq76jcwFwI4gg=;
	b=iVlQA43lN5952ij8Z6sj3fsAawI2PyPsToiMp9tZnqv4bDAe6wQNoQplIIU3YdchhWa0Nm
	vDmDZ4+e55ejBYJZZdZDaUcOprJoDY5wR1uC+q4h4nrUKX9Eq0Ekq4Yqkdfu3hcxjcg8+q
	1Zw1ZtViTOBD2L4tEwqWprAjzZKHfdA=
X-MC-Unique: V-wAzcdhMQunqJ_fD-lkmw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYDT4qLGln34UxnkIpGAjc5TC8pPalhVdJ6aKJF7/A4lb943DCzXiQg1JJsXmq4JAcFykHHWrdKdBvi1igpVMEQ6GvKzAr794EomURvomRzkhG2Dq6EoQg/E1X45CfPo1YN+h9BssSSXdpML5f12a9JfcXde2VMbrZt70G6O5dkUX6IBc8NIlBLVwV2JobfXWuiiPzlRhNmhWK4nMPOZM2rfM8d4nuZ84DBmDWq0Xybjq0Za0WHiDikjKMpR8rvG1c3cwh7qyp9wlgZAQDqXCwDm9b5ci7HqJPyCb5yZw3F0G+Eu7Tzz0yXSDwutgkaFYtu2L+du4upIGpr5gP6YzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fC8tvz9K5QTmqAfOBdH/A5HhYPvREcEq76jcwFwI4gg=;
 b=bwzFhzHvack+BHcHIcvKunQH3YZ7ZeaFGp1eRrIBqtl/kOy/DVhfhtflykLow7sWeNBxCJkC9KAcAuO7S1KGCp7A/CdWO/VI+s9uNvrOPNowSaOZrEdirelQ9ALw84FjRqX0Cu156CziuGW2wkSKTlXuWe1IpI+mQya14YC0kVoqDDIG3xlxN8EgJ75ZZgo0aog4p1L3EWRLjVXEymVkAQXoUL0QFn6yVB64mtV4WZiPHOEGj76gsWYwOzzd6CtUPZvZSGrOuShpBWVY7ilHNvb9xOgTMHxg7Hwf1uZ2OCWau5EU8T2K5D8nCInxGoscCni/rtzDcjU4NHBr5Rc/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH] x86: drop a bogus SHARED_M2P() check from Dom0 building
 code
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <47deb99d-3ffc-61e4-26e6-7e7ab186a79a@suse.com>
Message-ID: <0accd732-71a2-b122-6c7b-bb8fc8b0f3cf@suse.com>
Date: Tue, 6 Jul 2021 09:37:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <47deb99d-3ffc-61e4-26e6-7e7ab186a79a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR0101CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b099e42-7280-457c-630f-08d94050e351
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333861349B3938750830B12B31B9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NA3avWv+vQ5+1gXgmkG1oKhCkBjNaYQIpAOx/Jqbfqf8M1XdnhNXMPFNpVEg8E9LA5Bgoe7h2rCVtuPdg17wWk2BROj4KOzBmohZIVDIfNURq/uHgVCR4DJPeAfmr30rfgHtUWzxESEUy04nPqkaPzyrf/rbLeUvapiNtgi+ALEJwGFo657zR6GjIaVPj8yWEMKMeFSsAxoyDIOMZi+PH5pxmQCpqzfMhPE09t/8j7Sq0RGX5mRFOfIP8bNRJpuFN2OeTimSVNBb0GwaAD5d/x4NSLhEx2XjJZ9CJl1WUadlJPrrXZHhfXvHsMURJVGxOYbNxvvuzFPOIG22b7kvWvEPQYckaS67w1qkvG88TRVlzKaOEU0oYPMc5Fe8U2D7Iiv5KvnLnE3BK2E11g4VtjWnCwDZBE43W6aqCkBAxc/4cjfGUS3S035x7N5A4mynWFaZuCIIY1e2q/C0wIHOnULCUDvqNSt+Kzmm0FR3tXQC2Q3ivK0Mak2/wfpKzmlS8QYqz6ZoX5FADdcf6Vr0iGbOi4Wrgxu/UZdFoa1R6FRnxTdDRf943yLLvbrPBBPf1PA9vhE2ApXriFoc8mg34SkPvnOfIGEPQHe3jJjC13oL3DV/HJ4/Onh8x1szmAMVDUKoa+c7B+Ww6mtG487wxeI6uODCHMLmiUjtz70dlSQbKgqW9lBWPnb759b71SmR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(396003)(376002)(366004)(346002)(53546011)(6486002)(31686004)(5660300002)(4744005)(86362001)(478600001)(8676002)(110136005)(36756003)(2616005)(66476007)(66556008)(956004)(4326008)(26005)(8936002)(66946007)(316002)(16526019)(2906002)(31696002)(16576012)(186003)(38100700002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGUzUlB6UU9JUXlWNG42UDVvd1JHUTZFcGNMUUZ6ZmtWb2Q5OWlGQTlGeDc0?=
 =?utf-8?B?MDZIOXFFaHRzaDlRRGdncmY2ZU4zS0YrRWgxdzA5aU1Tdlk4MTNIMERnQTZJ?=
 =?utf-8?B?ZElBdklReERnOCtYaHYvOGRlZTVJZVJDcWIybS9VTVBDWDZjaVFmc3QzaEp0?=
 =?utf-8?B?Ti9DaDh2YmVHMjBPNDllY0NXZW14SUJlQW9GT1Q5eHUxMEFtVVJuV05LNWNT?=
 =?utf-8?B?VkdETVM4YTRaZS90Nkx5dFNyOXpDSEJ4TWNrT3MrcWU0VWNVeU5PYkFTRHgw?=
 =?utf-8?B?bkNoSGdncEtiYXVaUk42UnJIUXBHWWNuUi93bU5uMnBZUjdiQmtDQ0xHUnVn?=
 =?utf-8?B?WDlFdk51RndCU0tMRGtzU0lQWTZVMGVGNVFHdUVjOG9oTDNWUzlTYzcwNVVL?=
 =?utf-8?B?TE1LY0ZURFAyNGxFK3d5bVFJVk9FQ2FiM0RzNng4TnVQd2JMTVFLMTQ5WGg2?=
 =?utf-8?B?VllOdGtTam9OOEZqR2F0K01PUnduRXNFZ05LSHJ0Sk5GaFFkUWVvSFF6NUky?=
 =?utf-8?B?SEFMNncrNXNwQ1VYUCt0WUhyMnlKcUtXbGljOXFMTDZHOTVPa0xEbkpFK1Er?=
 =?utf-8?B?MzNxb0ptMWhHMDdOeVZXSE1QaXFkaWI1R0lRMW1OMnJLbjNGMFUvUUlzV0RB?=
 =?utf-8?B?Y29KQ2NzL1RpdSszL0hsTTRKWE1DTjlpTlRsRUphMm1sNzYwemd6YUpxcE5p?=
 =?utf-8?B?QkwwMG1hcUt4WW82RmJUWjhrdlR3TE5FUi9hOG43b0FFOVJtQ2NQWEcwd0Rl?=
 =?utf-8?B?Q2FNR1EvR2lCL29aWGZqa3RGdGtVNnEvTk1ZZHJDWDZETExKUDFOTEt0QkRa?=
 =?utf-8?B?dFhGNFV2REJ0b2ZMOTFOQWx0ekJQNUk4RUZEL2dFRUJvelp2Y1BsK09mekFG?=
 =?utf-8?B?N1dwSHFKN3o2ZngzNUFPRkJadXBIVzVlYWJiNTZqWVFsMUVndVJ3TUE5YkRF?=
 =?utf-8?B?dDhlWTlXQzNFanNPanVTYUY3NHhqZDRGQjlRUkpQMjBMUFdrQk5XTGRlbEZq?=
 =?utf-8?B?Y3M3bFhhQW9PVnFlR0ZrekVGZDJHU2xqOUdzRUJZZGZYbjhQUHM1QTJSeFBl?=
 =?utf-8?B?UjliT3JXb0RRbmQyYlR1WTZDb2RudlNDSFNkL3lnNkhGNUdUeURlZ2pDN0Yx?=
 =?utf-8?B?NEt6bXdHWGpoSVhNREN6RjE4NWhoTEZ4ZzZwR0FUZGFhenh4TWgyNlJPbGRD?=
 =?utf-8?B?Q241UCt1WDNpZVA3ZktaYytibitPMkhHWWdxMHhocmQvTnEzeUFoUmFpSzdI?=
 =?utf-8?B?QUh3MjFvWElLZHZsQkh1SThCVjZTL1JnRkdjOUp3azNGZURFWnJDSGUvTS9J?=
 =?utf-8?B?QlR2aDhmbWVmNGNxYXRHV29UcmwyREg0WmdUL0FUTHcyS3pNSXYrdGZ3M1NK?=
 =?utf-8?B?OFBSVDd3QzZpZWRRRlJBeEp0MlJUREFQRDZrNkJSV0dMdVhQVDlYd1NlQ0V3?=
 =?utf-8?B?WEJRbnUwelUveVF2Y0xLdEUxV0ZiRVFDazlsNXZzbDl5WGxUdmlTVmFZdVN1?=
 =?utf-8?B?SjdkUjJpV0Z6aUwrMk9pclI4cGNsbHpXcUhBM1Zob1JGR1JzdS9KaElJVFBH?=
 =?utf-8?B?OUFuY3p4UmVwL2dLdVNxM1dIOE8wZXJybklocjFPdjFmRFEzUjRaalV6MjBj?=
 =?utf-8?B?UzRLVmhSOXdHYktvRUVDQVhab3FxNkZuZU1JdE5hNE81d3NjK3dlclBMUHZ1?=
 =?utf-8?B?NWduNDRtLzlYZC9CalhYSloyUERQbVhURFdWVXEwUXQ3VXB1S1YyS1dDYjdp?=
 =?utf-8?Q?WVZIYdPu4rlFpZJk0pvQA3qZ+OIrZ/jhnONvR56?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b099e42-7280-457c-630f-08d94050e351
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 07:37:20.6188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBcLjFKZ6bgf+qwez27/chrQXVHCID4vWfQ5b2q1QiQ40TTXMlJG8gzNp78zORKFTJDF+vtuU7TmVQ/VTHyjQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 28.06.2021 13:52, Jan Beulich wrote:
> If anything, a check covering a wider range of invalid M2P entries ought
> to be used (e.g. VALID_M2P()). But since everything is fully under Xen's
> control at this stage, simply remove the BUG_ON().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I didn't expect this to be controversial, so may I please ask for an ack
(or otherwise)?

Thanks, Jan

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -815,7 +815,6 @@ int __init dom0_construct_pv(struct doma
>      page_list_for_each ( page, &d->page_list )
>      {
>          mfn = mfn_x(page_to_mfn(page));
> -        BUG_ON(SHARED_M2P(get_gpfn_from_mfn(mfn)));
>          if ( get_gpfn_from_mfn(mfn) >= count )
>          {
>              BUG_ON(compat);
> 


