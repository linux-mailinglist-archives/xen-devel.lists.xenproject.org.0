Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD13A6745
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141443.261265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmCy-0001n0-F9; Mon, 14 Jun 2021 13:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141443.261265; Mon, 14 Jun 2021 13:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmCy-0001kD-Bd; Mon, 14 Jun 2021 13:00:52 +0000
Received: by outflank-mailman (input) for mailman id 141443;
 Mon, 14 Jun 2021 13:00:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsmCx-0001k7-Ac
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:00:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0da18d7-8e4f-4398-8ec9-f674d39d56f8;
 Mon, 14 Jun 2021 13:00:49 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-SHsC5XotOue2vDPVfAlQew-1; Mon, 14 Jun 2021 15:00:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 13:00:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 13:00:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Mon, 14 Jun 2021 13:00:45 +0000
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
X-Inumbo-ID: b0da18d7-8e4f-4398-8ec9-f674d39d56f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623675649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+OheBH9cKJlYpGZrszMCo07i6IKzpXkQmFnGftDV4eU=;
	b=HRtcee215JWlKHHJwDGBWdyAvR5K6dC/qXq1PSdN826zHMHzRsfwvx8pac1mFXtBMkMzJb
	30rCACqBzLX5AgCsQqAM19YQNHoQcVJtOqfBXJgr7G2eW7eX1fgUmOPr1HVmZaPF+egDa1
	twsSkW7RPb7x4mbtOYxewX55tS29jok=
X-MC-Unique: SHsC5XotOue2vDPVfAlQew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihgAd1ARe1ryqBOLwBgEW9oxaqD4Jpv42J7EfhgOm1z+RR8YFQu5xF2bnhzh7NwVAmuxrYE4Y79X4rtDrOWYFVM9ZhhBMfPKFXlJ2f+0Td2W2qa0r2YspleVeO6dYA+qej49YIvf5qc64IKWLgIVICRXIZfPb4a+W4wqUSWEMQS8aljhDPwJji+dQDtJuYAp27cgtMGPVXMWV8glEIWPyqGVCTvXRBv99JLM6gnow9xc0j6d612VtkpctH4xp5jjP0RtaWVRKeAEtkXU+hnulT+pk1BNJFZLWs4Q7uodkWILto/vZKlAWK22mM+tW8f3JCrSnhPLv6iVRilsTcACfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OheBH9cKJlYpGZrszMCo07i6IKzpXkQmFnGftDV4eU=;
 b=Py4aLMMDi/+/R7xr3HxSHO747JfDANxOWOsTs1c2xVl61zuZEW2gabTUug+RJCUEYskpt3OSQbF+IYJ982+6Q8+VF74wfVvy105jhRngwq202ENlakjqaeXUJ2hd5rvNrk7rT96wI1ExpBzAprKX+2gq/U+wLFjSrza2V6YN/ou0sfCv8z9XzcWKxbmchyMB0esrZf6Ber7aOSkGmWH3RfAd7NLkZq8gFQQH2aFLYXUTn8lktPRpsXSwKYYE/DfED+uogbbO+KWzJdVsaG14iTaerFvMQ8cMeZit6907ghlCTiCuHrBk78C1TaCLuJUfp3MBweFCPqPS3/25ZaTGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 4/5] libs/guest: Move struct xc_cpu_policy into
 xg_private.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Edwin Torok <edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
 <20210611163627.4878-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb85a8ea-c78f-1b94-6d83-224137f21500@suse.com>
Date: Mon, 14 Jun 2021 15:00:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210611163627.4878-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e780695-b3f8-49c1-df69-08d92f346ca7
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66692A7E4B12DF6105BBA663B3319@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cfBFWe7lzUbZgGdl21ZDBHruRj9LE8AMJ4zkqo0vYyI9NVyh8EkQBmg7C7y7T1jldXqJ2FT2LxqswIjrXM1pnHBSA8Kfpq7d9N/JX9sqT/Kqj6V/jRxZ7qagVPKTm4tmLzPnN1v/BepsOvl3LDTCzZ406xspNfJeGH+6GKlPHkHG2KLHMnpdYlB+RxHl6HK7n3Ksmbxghw7G6kqysv+Kf1H0cxbAIx1tDh1N/nXf2RqUwgrgnWJ7MijjCObkhj54goK0zy1Vx1s4xcZhlbWBTQWAXujHl6+1a1bwOu8kKC008tD19HC4hs0CDm27ivVGR5K/bof4oGZLh9KXdT6IgneNUWuwEY9OL3tlK+oVAUYGBwdteVISzZ5acSdAMF+knVMCso8AeCcvylFtduEJHMqJSvJn5hRcVbo3vEfURovsTFi90/EU4Cwk0G2hZpl9aPnwK99hHMeKxJg+d6BPhnfid9sa18H6RNkxaHQ1yOCe8OfDXUllM8+cW6D7OInM1Ytx/8hI+oyji+15ndKwtmu7zh0TuC8J3TkQUb5XriJXIzcCjf1RD/M38W8fPFIoRY7TUFzjZuAcv3ETLoqwqbref9djjxbww8Nip8uDp6pRIX/bcfovoOcY9Q0J+GzSV0uueir2FckGuNQKamT1OgjV9ZQCHiXe/JEY70m8tyGkd/HFEImYBh9EVGrmDzlX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(396003)(346002)(39830400003)(2616005)(2906002)(66556008)(16576012)(956004)(8936002)(31696002)(316002)(86362001)(4744005)(6486002)(66946007)(4326008)(66476007)(36756003)(38100700002)(31686004)(8676002)(26005)(5660300002)(186003)(16526019)(54906003)(6916009)(53546011)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1dQK3ZpK3hLL2FzV29VRGU2U2pCZisrRFM5RmpZbXhjYWdHN0RvNFp3UUNw?=
 =?utf-8?B?UkIyZmpDSFIwN2FOSnZ4L044TlRhemtjcmVXdk1NN3RCTEdvdk5kc0pPaVQw?=
 =?utf-8?B?TmRlbHphNU9lQ3pCOGdKS0pGT084Ym5LQkZXWDJRTlBQbUJvNldjc3h1Y0I2?=
 =?utf-8?B?YzBWUm8xN1hFZnRVNTVNZmVvNzFXRHU5SytqOHh0bWNSQ2lJQVJZdTZ1cmEy?=
 =?utf-8?B?V0xOQWUwaVZwelkxeGwrWGZiY0ZHRnByOVZkMmNreS9uWmpPTFFrelFvdEx1?=
 =?utf-8?B?MVVreFowamlUcUE2ZUtrQStGN2tDTnJkWUszOUR0V1M3NlE3VnlxYnZwOFVW?=
 =?utf-8?B?R0JBSkszMEtKb0FxblJxTWk0NXUvVkNSL3dYNjZOWm5HV3pjc0lWRmUrMEtl?=
 =?utf-8?B?aTFQM0JrNGtsU2swMUN6OWZmc2xCMnZnSnpobXVsUlFrQkhlN3BtcFNSUml3?=
 =?utf-8?B?NzdSTStHeHl1UTg5VzkrNHVHK1gzMDM4VStjUTVWUTBPYVo5T2o2NU43NGtG?=
 =?utf-8?B?cUxvRGdjZTRrTVVHK015YXU3VnlBaXljS29sS1MrdW53YXJ5TVFFcVAwSzl4?=
 =?utf-8?B?aUhnRStPbGJOL0hNUXJjbDdRbkVxczk5dmNpMGZzNENHTWZlWng1Rm4wRGpB?=
 =?utf-8?B?UnpOejAvNXZRRzlyaHl4MDlDa0V6RDBMejRFTmRnbjV4OTV3RnlXUDFVUEh3?=
 =?utf-8?B?VmlSUDhCL0RVSXhKS0NjdDB4ekVTNDJJNGxzTHZFdXJkdFJRN2ZEOEdpYWlT?=
 =?utf-8?B?NS9aeXYyRnlRM1BaQjVjdWZVV1k1ZkZySHVnSDlsTkNpMnBIZ2J6YUhvNDZX?=
 =?utf-8?B?OWFpNS9kdUFPZHZ1TDZGRXU0YmViVUxZOWlTUjJ0UmoxdHNvMC9tUFY2b2wr?=
 =?utf-8?B?aUNyU3dySlJqVWtVTXN6NXpXQkw1Mi9XRFNXQ0NYZFF3M3pYWWk0MG5XVDhh?=
 =?utf-8?B?WEFmOE1SWUJYc3gzWEx1UmRld0lLdzdLU25RVklSbHpYUkYvdDFwVnJiLzVO?=
 =?utf-8?B?WUxpMzF2cDVvV1FhMzZpNk11OGQ2T1l5WWtzb0pqejBodkhBUEJUSHN3d3dR?=
 =?utf-8?B?YXdFTGttdms5aERJUnl3VjcwMklPWk95SXRicmJOKzlVT2VKeS9xUWNoWFJD?=
 =?utf-8?B?b2VWR1JNbUxIOWdDTDlOeXFQZUMxQnB4ZVJ1NDR3YlR1RHFBTEVxVGV4Q0F3?=
 =?utf-8?B?ekZBUjhDWjNoVGNRZ05PVmsrbm5jQ0hnMlJSelozWXBkcjUvSmVNdWs5Rk03?=
 =?utf-8?B?eGlXWGxXaU9INFFZaGZPMVcxeWllQW5qM1V2NDgycXBIRllxYXQ3MERPd29Z?=
 =?utf-8?B?WjNIMTM2R01jZytOQVpSQWRqZnQ0c2lzS3U3Q21sK2JSUkRZMTAraDN2c0lS?=
 =?utf-8?B?TzQ4UDdQcHJHcWUvRmJmYzcraTc4TFZGSnQzNXB2eCt0VkZUQ1JiYjlzVWtG?=
 =?utf-8?B?Mi9mOU9LRnNBVDB3d0k4Z0RzbHNtOU90cTh4QkxQWm9qUnFtbXRmc3liRmp4?=
 =?utf-8?B?MURPMFFnTnErSnplQXpTYVRiVGU2ZW5yc0tDUVVRaERidERXK1lJTEk0elBP?=
 =?utf-8?B?cnlPaTRxNGdaMFlGV1RTRkIxSHZZVXdXTTF5RGpkTjBKRkR6TmFKSVd2N1JW?=
 =?utf-8?B?VGY3QVVKdU5XOWR1Zm1TUGoxZWtUQlgwUm9iRlZaWE83MGhpZlJwZWhYTEdO?=
 =?utf-8?B?MmlURExFcGVHWUpMRGtPMkl5THFJai8yWExHdFEyK1haUDU1TlQ3bXFzTUs5?=
 =?utf-8?Q?GvFgeBli0fH3QQAWYX3/B2kLNFT/sbikjNt1ZXD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e780695-b3f8-49c1-df69-08d92f346ca7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 13:00:45.9211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +r7AAajFJIDvIA7ISnGisS3VetTab20pychMq5l+Ip1U8VSvHL1+PgLXpjbcZFRVG5V5/OA+MPcMuzhE226DnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

On 11.06.2021 18:36, Andrew Cooper wrote:
> ... so tests can peek at the internals, without the structure being generally
> available to users of the library.

I'm not sure whether this slight over-exposure is tolerable in the tools code,
so I'd prefer leaving the ack-ing of this change to the tools folks.

Jan


