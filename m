Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B607143187C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 14:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212144.369907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRSN-0004tK-T0; Mon, 18 Oct 2021 12:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212144.369907; Mon, 18 Oct 2021 12:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRSN-0004qP-Pe; Mon, 18 Oct 2021 12:09:31 +0000
Received: by outflank-mailman (input) for mailman id 212144;
 Mon, 18 Oct 2021 12:09:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcRSM-0004qG-Mx
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 12:09:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e7fb102-300c-11ec-82d4-12813bfff9fa;
 Mon, 18 Oct 2021 12:09:29 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-URF_OSD6MwGCYdozWwYw4g-1; Mon, 18 Oct 2021 14:09:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 12:09:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 12:09:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0347.eurprd06.prod.outlook.com (2603:10a6:20b:466::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 12:09:25 +0000
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
X-Inumbo-ID: 3e7fb102-300c-11ec-82d4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634558968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fcsVj3Su770zv5cpGsP6o9y7SvTJ6VgbQejuJgTL818=;
	b=nbCeDaNP/N2vDfu8R03h6oAnXIcI6HtApbNbPZgXBqy26Kg4ss3fJSL1OUXxgD8MnGvH1I
	8ReEm282SXluZsT5fn6vfCo7uTA2WCRVu3NUpEYP3P4AQfPdCR5CBJSG9HEoAqSmTaxJAw
	tBH56d26YSoZT5Feh0c5j7bTZkZFwjA=
X-MC-Unique: URF_OSD6MwGCYdozWwYw4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJUCz301ofHHv45y6zOhwHgyxmJIksUYJ/q7Mp584x/xRTYFCLrqZKfUpiKW0oaJzTCc5pK6tHcRoeUIHZ8uadSBnYlQFgzfnFjhy7ynt7s24roGxUcGo+B9jlEgm5OYP4yqjAKFF1wX1jktlK5ah4f4MuDHRDE4ywDP4YlQkHi/nFAlwhPlfqQYgZuC/0PaIjAxNX73l8rNPt82e2bbq+df7Gh2Qo/Nalb7Mo0P7mKGXAQM6u0K181tl97YAHU6AUvRFKZg60rtO4779IxrnsWb409zn3udo8rk0+56Vz7shxgQPbFqPED49vcBLC0cN55Q3qiyFdGL1/Pw7UQavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLWj5tMXlfRChWV9sYQaDGrsPtFEhU0wkmDjqZ+8xdg=;
 b=oR2dd9Ma0CoMkA4TFeOKivyXXFAjgPLyXA6QHW9ItoreDmPyWo6E0VJLJ3/FFJKAzpIMIe0C6xArpPv5qQXg2yHd4JNoR6iz4sXyc7zimo3L8H9CQUSPKs4xel90c1pWMPchgKcnBOFwNjny9ArDX/A2AXWSk3w5IBdw+zBl6vVk0iEqqED/pJ1PqWpVG2aHz+TWYL4YDKvxrYHY1daAujDSuvNjNZNs6uV+oHCBeA6WgwpjJKuwkJVb3V2U7VpKPTUdXWA/ZEWFKLqVOlF8UFSrp+Uw/kkVcOnCUqxzCLwoe05I5zIsf19M3x2w1CfvSplYmOmSfbleByfWJicp5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/CPUID: don't shrink hypervisor leaves
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <0f5fe8d3-4c43-e60f-c585-67b2f23383ab@suse.com>
 <YW1eWeFls5igZcHu@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5278ee08-c171-4dfb-43dd-1309be2796c4@suse.com>
Date: Mon, 18 Oct 2021 14:09:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW1eWeFls5igZcHu@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0347.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4619b5a-93dc-4bcf-3ddb-08d9923020f4
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63047EC41376BFAF6D5A928CB3BC9@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xyQPVn8noOfmHP/ylKHVhfWt/MX96gkUhZloR3ekVrO5lCH+5kFi5PLijjPjN1r5cpX9xe/OA4tdKhQg6fRXqUIuthDYPgVJm+pWUYnAksHOWp1QNtMcGzujzoBAzDC9X3cdUiN+7cwdvIbTpG6rbhunHUtxJCUa0JTJOrZucapQXYYrGrLOkf1nKML7mYx3Wit9RUy0tM4aPX49nkOXzNq17Yyg9jYQPOxPr08c/q2J5mXyGHrozffDWXRBVSjOHgCE9OIGsSUtL5qmGnOBdsGGMRmRrEVJnyoxgTG6sGBS+qrpY/1EbUZCp01hWqoSiDE66HK8mOWH8GgfNqA5s73OK0wOtj7J/l+ASWXb2xb/FQkZ2q7wD5ZcZc3a2dQTn9HGNr9VTYgfrXsTKy1I5KqGnJg1Tih7j7hHI9JGviDhhnDq5YMWhCqnlwAq4ICAiJXILFtoTLPr/WcrNc2Eg3YAhSdRnKlKSWjKGAtJdDBSByvmRUzcZdkX/hp8WLu/4nzNY5OZmcMnbBtkySviZklcMcNBkpSvbse18VYKaLKfm3pzOIuiQshY+qmVDf9UP14hFD7E2Mh6zbxR0HoJYNIiNm5AdIBEJkgRYC3UXlaCOz4GB8U3SGfe1DDh7BirmhiPyJMJWB7EkOyDg2Jy95tu6VSYcpUicrb82283G48qHpipKRCFzPMuZo843sgGrCGvBaDpsAcscGMeLNrlgaEDdgEcHoqsP4c9a/zcutfwQcj8fObzlBwgjhXbptY6isowMYz0lTlJOW+sks5SEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(53546011)(38100700002)(110136005)(508600001)(6486002)(26005)(54906003)(86362001)(36756003)(186003)(31696002)(8936002)(66946007)(66476007)(66556008)(2906002)(5660300002)(2616005)(956004)(8676002)(16576012)(83380400001)(4326008)(316002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zsv3OvgqHY+tbrPRAxVaXCHbK+/U8zOnu2uj++W0GuLlOXRG5X6Vmc1B/oRl?=
 =?us-ascii?Q?YpMERn6qdL2CfCy4S7Pg0coNXzWdkpTNti9oNnrA/2gT73/VgB+ppw5uL2nh?=
 =?us-ascii?Q?3+kU+kw+wKdh1VSV39/zvSSoFmdy7mlfdkwZ5hX9eFAq/cndyJSaHN1DIJQs?=
 =?us-ascii?Q?hUiaPko8rJtyh6I301Lfgp/s/5/gWDQiSypeDZ7x/D60RM1zBbkq3Hr/7rK2?=
 =?us-ascii?Q?n2t+UO7AsyPDKYu61vzIJe9+2YJEdaIy4I7NAyEOL201/IhLSsanNtR1MQiB?=
 =?us-ascii?Q?3HCup9bACMNATp0EjtqKZmx+qwC3GR9bfKDV6UMT4bwkDIsmSW/6HB5vSbym?=
 =?us-ascii?Q?Es6c7310vzfAepRUpazUdLRuVbajjP0LsEat3Na2h8JYlfYYbEBGfcPBqlB7?=
 =?us-ascii?Q?CjdiweuaeseCj29A+FaUbSbjR8Ajg0TiDPQ5kQi1xZ1A9zwMfPaMh400KTqZ?=
 =?us-ascii?Q?4RVKmNB/Wu3IjWD5occHZ72XPpab9nQJV8Lunb7jz+9JV3wDgy9t7m3q6IRZ?=
 =?us-ascii?Q?LRpOvojphF6NVG5mCzpcrUxctjeuEgydv82N+7OLi9UzC0vHGQvvzotQhfcA?=
 =?us-ascii?Q?y7p4jF2fF77cIhLkE7omqJ8rPQ4IZwOZRrWka7hjden6oN6Cy/euB9X22n3a?=
 =?us-ascii?Q?3F/fEISJFItF6ccMgK9ONjQDNj9hnH/4krdmdRoFbShmoEz7pDtllb4zshh8?=
 =?us-ascii?Q?7PGotzg/jW8AVVa2K5KWx3o+yOxbB+9MQuU+ciqqAMBNtYcmx1qVZfDib0QQ?=
 =?us-ascii?Q?SW6owo3vgrwbQ4V0O05NYw4Dmnp1zgOjSYyfXcopa3MQ8metNC1glMQ23PZ8?=
 =?us-ascii?Q?FbqkDdLMA7Du3m7wj6Cr+qFdzIOpM77n1GyFZcUmMDGQXOcGKz4fgMGYVj7O?=
 =?us-ascii?Q?FFmFjfzlkUwa5Jq734Wi/D1cl83LK+G21/+W1IgvSbf55PP6kW9qP6xYstPa?=
 =?us-ascii?Q?EVFf/97vGz55adMTD5+CYR2k3WhyG2BXl4TtiOMmrC9vKSaBJAwTxzr2Aq2A?=
 =?us-ascii?Q?nDYEeFt/+tpqCGSnjIUTeOtmA611nSlT3CLJBs9e4Bpu12J5O3mTvI3QdakR?=
 =?us-ascii?Q?y9qABnru27yobMzwq3u21+TQPhFQ/QwZJ2CEFroVNCA6TYDZiIA1Mu/fWchK?=
 =?us-ascii?Q?7owSZ5sSddDcuZbzyzzuD2swey/VmwGDZd3qFbEGJeDLqd8sOBoZT3egkxJV?=
 =?us-ascii?Q?dorzXhBveW+om2r3Ebtl9wQVYz6S+aCbeEth+8+47QfpOtSAKDzgKht7RJ2Q?=
 =?us-ascii?Q?54dUSHj2Y4bIEZCVKbyU89Gh3mVABl25+tsYVGox+tU6oibIFXJrOhS4EWik?=
 =?us-ascii?Q?V4eZuWCUNwuwfamczpIXAF9j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4619b5a-93dc-4bcf-3ddb-08d9923020f4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 12:09:25.9588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGs3uocubAbYT3J1ZUcli65w1fvX6GFJz9bBubuBHu9kfXtVxE8Z8+pww1PHr9xUo0mXt09oLUqzbHoNbKkBCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 18.10.2021 13:45, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 07, 2021 at 10:40:34AM +0200, Jan Beulich wrote:
>> This is a partial revert of 540d911c2813 ("x86/CPUID: shrink
>> max_{,sub}leaf fields according to actual leaf contents"). Andrew points
>> out that XXX.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Obviously the XXX wants filling in. So far I did not really understand
>> what bad consequences there might be, but I can agree with the undoing
>> of this part of the original change along the lines of why the Viridian
>> side adjustment was also requested to be dropped (before the patch went
>> in).
>=20
> I have to admit I'm confused about this. Here the maximum leaf
> reported only changes between PV and HVM, but never as a result of the
> features exposed, which I think should be fine?
>=20
> Ie: I recall the problem being the maximum leaf possibly shrinking
> when migrating, but that's not the case.

I assume that's a question to Andrew? Because if I knew the answer,
I could probably have written a proper / complete description.

Jan


