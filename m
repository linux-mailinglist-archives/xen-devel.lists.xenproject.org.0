Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAEC3F26AF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 08:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169225.309133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGxjd-0000Uh-6G; Fri, 20 Aug 2021 06:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169225.309133; Fri, 20 Aug 2021 06:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGxjd-0000Rh-29; Fri, 20 Aug 2021 06:10:33 +0000
Received: by outflank-mailman (input) for mailman id 169225;
 Fri, 20 Aug 2021 06:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGxjb-0000Rb-SZ
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 06:10:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e647925-b0e1-4ab6-874b-70dfd5e43d13;
 Fri, 20 Aug 2021 06:10:30 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-gbiQMUgCODCMro4vMLaWCw-1; Fri, 20 Aug 2021 08:10:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 06:10:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 06:10:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0078.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 06:10:25 +0000
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
X-Inumbo-ID: 9e647925-b0e1-4ab6-874b-70dfd5e43d13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629439829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTP848jVkT638Pv/M5YGcucEZxggey6e3CBMggT8o20=;
	b=nIQZHqVNsjmVtQ3eoXHp6Ym0wqmAB6SlnXxMaphgEedsOLSZlAlvQIYfebtYQdMhcfZDZi
	/M0uoZZcGWTJQ1bKzpQloDM8enCiUgsaAUcqQm6ZIkQGbR55EHeQ/Mn/sQpdjISlyfVM/B
	bqFz+QEHImzQLuA7k10fUHNyI0aAuDs=
X-MC-Unique: gbiQMUgCODCMro4vMLaWCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mu8ZEMfSTUxMZHF7GeeyNg5Tgf5WvB0hwjPGYZrF6cogvKx1Zfe8WePbIBQpL104C5cof/SrQ0FsLbggtS/F6pjN/TIGsGg7Y2vo5bD+wkco6vmQXv4AG9LtJUfI2/twVBqAQnDqy3Udc4sjliIsy1L3VwBjHZGuMTIByFfHiDha5o1p8I2gqRC9CyaKE2+1c1NCNYb48gKLtbCWOqXGX7cJKFApKMOP2rNQ5FAREnkC23Z7whrLXPI7AlnTu+nVtYTEkOa65fMKwUOy1etuKKXtsbmSc+9wWVeo7OJRloHSJTsoOVbdPbWDq06hOPEenZKbCujHoYqLTMvos4bQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTP848jVkT638Pv/M5YGcucEZxggey6e3CBMggT8o20=;
 b=mkhqbcDY/rE7SkFPbcDM2EDEpeWUViQO5dKcLsUJM0k4mikNVbx7QB5NjnUNZI/6te6d/WZCo578H5Da7d0DEnrkUOEkrQqMAi2g4CC5OC6WCJn0S17lBHGnJ5jMPrtSQ/jb3Soq6dZeoF/8bjQB8BGG4+atpJsYCS4TGBkzF6NlRwCEtuvH93vtM6R3i5csAe9Bux6AViIer28zUbj2B7LVXzJGvnAWyJtpzA7iJhlLdeugQmUw8jD/bI9cGTfQGGq6/+mQVY4wqWX2RE9ijR7Jf2yYlPDb2gwEQ4DwTVyXeOVP6xr3Lp0ZCF/5qrSVHYNVoANpyXmwO3FQ5PJA6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: preparations for 4.15.1 and 4.13.4 [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
 <8324f959-924b-d196-149d-2fdad95da8fa@citrix.com>
 <24862.35359.95257.223452@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6cf59a2a-71bb-834d-1f34-7de050d5991d@suse.com>
Date: Fri, 20 Aug 2021 08:10:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <24862.35359.95257.223452@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef9628be-ebcc-4c49-251d-08d963a1338c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51650C2666BDC8217002E1E3B3C19@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ztPfN0tYs7X14We2ZSFgsZB1C+Tn3KTeqy4wv5XyqR9wdShluoI5V3aht909VTW84hhCxJJ59oPuqCl9Tv1LZ1OVzurR1tvz3XjH5jkhe3gkzFIO41A9fOzvDMYdRKDvxMe8wF4X8bxzdXPuYLd/Sj5n3sS8e5hOftAFY4Un+yyfXlPaxakE8QAuL6nrMbhzq5JSVKwWG1pOqNYRO/n6Cra1DbfQMAC3hFIx8DIeaWNJ9VupAliUaPOIXIVaxgzv29Y739+tPy5J2Hm2wkmfvYVfn9JZ6NlJFKnFhbI1B6sGKsT0pQnUjSgjzyyrrUfaUMhkazfePPmNOK0kA408hBbzFoTPyG8P1l/w3HB/c3fNuJen9QM6FjH1we6Xc7qPrUkPOuihgKrtX6V2HrflJCMapC8+7j39LJ3ONNca6zP/DqpqaJobz+5CsiZdgVvRF2S1/oHQ/ilBUDsDgtnpjrHS4wajKp4mG1Iy1PC4tC1iCQ5EbSSTY4CyUIydNziYhvekBPl5YUITO4gO7dIAezQSkiLrUayfss/fspf3qZ76hp1lYRyyW99S9jknsbAwcCTn//h4HvQUCmmAkDSVO8k2A3OFsfmdF85qNN6oxhPcs/+NqYGELmqjL+EfkTeQkcH2p8OukjMm5BgmEMUnClkC0EofFCdxDVUSlJd6M1P+exAjiPkLR+EiwMAwLYg8UmgYFvsPhmlQzuk5SUHUoGPB9/Iqyy6CeU0/+7ZSATo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(39850400004)(396003)(366004)(478600001)(54906003)(110136005)(6486002)(316002)(2616005)(16576012)(4326008)(86362001)(31696002)(956004)(36756003)(31686004)(2906002)(38100700002)(186003)(53546011)(4744005)(5660300002)(8936002)(8676002)(6666004)(26005)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0pucTREN1FiM1dxVnVsYng1ZHR3WmtyWWJyaHV3RTFlUDRrK0dUQ25xMkpH?=
 =?utf-8?B?LzQzUzZCR3I3WTFpckFuTllzbUxZWk8zS0hZOVNVZkR6RXFBLyt5Y0R3dXNS?=
 =?utf-8?B?SzZWK0EvdnRXVFpVZWJjVXk2L3p1QnZDcWl5V245S01EV0x2TjQ5OTh0Rmlu?=
 =?utf-8?B?ZFJkcFVjOGk2SC80aThrUU5nRExUTmpTcEZwRjZORWRtUDhlTGR1eWxIT2Z1?=
 =?utf-8?B?K2gzU2g3V2VROE13ZjdjSTF6ZmpFYUNXYXlBbjVGM0szbmFoVlEyRmhocXhC?=
 =?utf-8?B?N0dPcU5tMjRab1d3UloyYW1RRG9DNTEwU0g4SDQ1R2hnMGRwT2xQRFBVRjNw?=
 =?utf-8?B?U2JaSzd2N2dRU2dkNDVBRVArQkFYQ1RUWkRjdUNKVkZLOW15UVFyN1BpVlB1?=
 =?utf-8?B?RGRxTXNxM1NQcnpkRktMUDZBOCtIc0g1WkN2bElaQ2xmOUhKSGMvQit0dzFD?=
 =?utf-8?B?WktjZWpSTU9xNGxucjlHa3ROMXh0eUlwYUFxSkVJeG5PclFWaEdCZnF2b1dN?=
 =?utf-8?B?QVhEQTdBZ3g0eUdSODlXZklaaVo1ZkVZNXFuR0RXbmFqbWRQWnBBdDNYVVRS?=
 =?utf-8?B?MTJFdzZjWmF0UDRJdFlkd3ZJM2tLUkpXMTE5VXl4RGFCYXFJMm1heTQ0R0Zs?=
 =?utf-8?B?SzYyMlM4Y0dsc285WkpsaEcybFRONmg1ZnA0UW5DeXNkQnZmTTZMYkZLV3lK?=
 =?utf-8?B?ZUcyaU9uZHY0a21mTmxiZnQvSUQ5S0hQa2xiNVNJYTJZNHNoZy9GRjBEQzh6?=
 =?utf-8?B?R1pvck01Mktoek9jTmFYQUxtNjkvZzA1d0dUWmRFZkx6NWxpMHRldU1TUCtn?=
 =?utf-8?B?bHFEa3RlNW04WTN1cytaNU9ZMGhXc1hkaENuYzAxMHlKVnJxeUpFbGRyc012?=
 =?utf-8?B?SFlUQmh0NW5OMjM5cmdwekhvOGxHNGJ5RnRBNDRpVzJFSWg0TkkxMlZRMGlz?=
 =?utf-8?B?MlFuSnJsZzgzbzBnM09XNGdvWHJ0aWRVZVB5alJ5eGR0NjJXNHMvM04rUEYr?=
 =?utf-8?B?T3lNcDJQMFVCeGJWNkYyMEtRbUpDaGY3VysrYzdaaU11bEhKUHdjeFhKQkll?=
 =?utf-8?B?K3RJa3FJdW5ZcHdxUnJ3ek1nYnlnRXlwTksxNnd2Q1lwdnVDazcwbFZHeVVI?=
 =?utf-8?B?OWNJVXhlQ1VGbytzNWlHUGJhRDVrYWFQbEMvMkV0UWM2UkNncmlnbHFkL01p?=
 =?utf-8?B?dTFEdDdLdG94bU1ERlN5VUl4bWpLVkZGaTltY2ZJRjdQbW1LL0lKbFRkVkJB?=
 =?utf-8?B?QU9zVE1DQ1Jrc0FhUnRVcVc2bE5VZlZMTFUrUllDRVhhZHhIK1Q3czg2R1lU?=
 =?utf-8?B?bENLcGE2aEpqVG1KZGVPTkdqdUFyY29xTG11YXZ2VTU4cFh4OXZRdGFkTU1X?=
 =?utf-8?B?bEpGdDc0NGh2RGQ4blNobWlVbjJJYk9aQi9DOEpESGliWENrcEtGUWU2UlhT?=
 =?utf-8?B?TGZIdk5sMEZjOG5JcFRyZFNVbDcraGtUZGVyS2dsc3BYbEdubTRBcGVlMSs5?=
 =?utf-8?B?d0thdXBtOUN3WnNUbEs3NjZ2eGIrNW9DMHEyRnNpdFNtdXNPK0lnVjVkWm9p?=
 =?utf-8?B?L3NWVlV3eG9lbUZuekpETzA3RXlHOXp0ZmpTUlFCeHFOWURkZVFyNms2U2M2?=
 =?utf-8?B?MFpDaHBQMjVaRmV2enFsNnhiQlFXV1I0SVdnOHFqWGFZMFU4U2MwZ25iL3VR?=
 =?utf-8?B?ZHVjQm1qaUZnZnRkZjlwMHZHczVqa2luVm0rM0ZEckxSaDZiSEQ5R282M2U2?=
 =?utf-8?Q?vw6HMj7Ir44ZbOkNe8qCaiFlCT8GmyfLA7mNRmb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9628be-ebcc-4c49-251d-08d963a1338c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 06:10:25.6852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTN0BEEkofM5m9fQkvLLduHCY2jxfWwAGoPqA48M+4NxkFUh+bmDqszQU6ZIwd3i5GnbLtVxPODmKWIfqJJt/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 19.08.2021 18:43, Ian Jackson wrote:
> Jan Beulich writes ("preparations for 4.15.1 and 4.13.4"):
>> Ian: I did take the liberty to backport Anthony's
>>
>> 5d3e4ebb5c71 libs/foreignmemory: Fix osdep_xenforeignmemory_map prototype
> 
> Thanks.
> 
>> Beyond this I'd like the following to be considered:
>>
>> 6409210a5f51 libxencall: osdep_hypercall() should return long
>> bef64f2c0019 libxencall: introduce variant of xencall2() returning long
>> 01a2d001dea2 libxencall: Bump SONAME following new functionality
>> 6f02d1ea4a10 libxc: use multicall for memory-op on Linux (and Solaris)
> 
> I agree these are needed.
> 
> Don't we need these, or something like them in 4.14 and earlier too ?

Well, yes, I think so. Did I give the wrong impression of asking
for 4.15 only?

Jan


