Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3FC424E03
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 09:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203314.358413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYNhw-00069t-4c; Thu, 07 Oct 2021 07:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203314.358413; Thu, 07 Oct 2021 07:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYNhw-00066g-1Z; Thu, 07 Oct 2021 07:20:48 +0000
Received: by outflank-mailman (input) for mailman id 203314;
 Thu, 07 Oct 2021 07:20:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYNhu-00066a-OO
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 07:20:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 160c7d2a-273f-11ec-bfc1-12813bfff9fa;
 Thu, 07 Oct 2021 07:20:45 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-WsM9yLtSMv-HhV8vOwKfcA-1; Thu, 07 Oct 2021 09:20:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 07:20:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 07:20:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0082.eurprd06.prod.outlook.com (2603:10a6:20b:464::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Thu, 7 Oct 2021 07:20:41 +0000
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
X-Inumbo-ID: 160c7d2a-273f-11ec-bfc1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633591244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=byc+tgw1tLGHxbylyZSxzsls1fSUa2vD/hgJzfCpBLo=;
	b=QJeGZzTY3VAXbjAq+H5mtYwa/4zlbmANevXic69kPqnqX3S3DcovzODdgwf3DsHEkfpJSL
	XKvOPlcjYVdhQmS11Z6X5jHxFXrgpviDR440iMrD8etDqLCOuPqZJhLphd7V3V4skX31rm
	donoq5ZSVLrcth7pRGjgY28b47x0qyY=
X-MC-Unique: WsM9yLtSMv-HhV8vOwKfcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lhunqay0bOLQdzF2lXGFBIV0f2FkweUcobjJ+dLaP/Lx0Siz0JaToOi57zN7RApat0ODFpdX88Stw9iov2DF1SWWHXjSrPZdkiFlDtcO1/tV/CO00VnV+++Q+2/GRyLx8sRicQN2LioNsUU+hwz4l/EayBqx3IEdRy42J5SNjcLXlDFEsZdkRjRF4AFvR3DpKiziHHTMYikOC/mdsNIcbAQDNXEaElRg9DMD6ShBAhAYld9sz7lj7/+ek/1TOSeAWi+TWLGAQU0Nyi3wGbMWgbRI6jR3GE//xBbBZwyTlOKZbrxrqS0X3QXB3DtI+9YVSADz8zToXuCdbgqCyBhFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byc+tgw1tLGHxbylyZSxzsls1fSUa2vD/hgJzfCpBLo=;
 b=f0X2z3vrWNhuQ/65AWOHmk5jBOAy+QG8zo3+Dc4E4t0cX70KnYH+oP4jDjeyRG8m5crTPGjXKskUKQHsjJ+eFQc6pRSxmlufAga5PU2TrtPEZBBfRxgfDV4igAjh3OmbLHiPe7aV0z8EVLB90fCvA2GRJifYzn392FECIEi+yVt9XAn81+16+SQddxdQrNTftFNJpUqiPpIQGrfDSKttX9NiMOdpooLcx4XNFIcQpM92WVilAb3euiYIi3XPscEmjPBO/NwwAB29v8L7HE2gxTWCUg7ZR7y2Db25Z4hyXIzoDNSZYv5E/fZOfTt/gh9iI/FBch6i2xC2EbI+0lal1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: HVM/PVH Balloon crash
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
 <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
 <YUFdIPLo1AfM5BT2@mattapan.m5p.com>
 <3efe115b-1ff7-dcf1-8198-37bd7d7fb52f@suse.com>
 <YVD59QVbmdVwzYQI@mattapan.m5p.com>
 <033cc499-34de-d27a-7b1b-2a0a7ce38672@suse.com>
 <YVSGvGZc67ZLMdKm@mattapan.m5p.com>
 <03052a89-cb51-250d-4fcd-b9d8ceb93e39@suse.com>
 <YVfFZKRIPTYi/9bH@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4cb11d0c-8149-d248-583b-abd8fc103c1d@suse.com>
Date: Thu, 7 Oct 2021 09:20:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YVfFZKRIPTYi/9bH@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0082.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0829bc59-81d6-4c24-b4be-08d98962f8a9
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703922E3E0F2C6436DD5F539B3B19@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zoRWSAanWtLjAL5m0iAtjL5yqhTNS+1WcOAkzgiCXGMXjFAwH7jEGaBs7HtZ8j1UBgc6DNfJMOpqeVLLyAvo/0z4TJqIQwdBTASaTYME5MNcXFSMlZ/SiSvDS2bQhQxTjaP15X6elzkvKbjgFyP4mxtuykvVcfubniE4cKW5NE1Gkt+CyWk9EF/pCDpcho+zdLANFz/zS9/5lgR9xMmVZDY/Br5OPFpCIgDzyTeEj0m9kNDgAwpJ4FS83ntPy+mJdMgd8oVpMJU/XwgJSDIEtqURCTX5dnIqtPl+M6rP+VfTjphO2EsdnYWOKmlCud5au97BNLpkYAOQZQkOGfbes5hIYHZKSns91Jr0h8QksKWYHginDsLLEv+8bQdPQQsksyqWSsQf9efqwWgx2Xm7nmH8Kzob5rUaLOXWXijLZyie5pgT6YS/9ad5M+GClyI/kmwjo52LguvpUTd64dr4DgGrsoD9GBSt+Gg28i42Es/ojsLbQYKBFQuylvLjEJLu10g878px69myWGAYyTR4atZRW8qA9AmA2hzHxkHSpzmFyuMAoLs/oE06oJ2e9pna9VLNpxFWbvCBG1lNOcLyp2OEsp9hSjUofPoan3F7c3FRwGUYCRRWUxgJ/eISbpsWGVyLjYDw3iYPQ6lOL1tLhSYQ2TGo8pg+Jre6e41ihfJ8WLhtCdeqBaPdjiBdUfYOPIMjHAuVOBVBK1jZ5lhX/b+Kp6T/4gAmXduZOxOhtUNOHGI3+/YuIxjmtU8MJdfA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(4326008)(8676002)(31686004)(8936002)(6486002)(5660300002)(38100700002)(956004)(2616005)(16576012)(66476007)(53546011)(83380400001)(316002)(36756003)(66556008)(31696002)(2906002)(86362001)(3480700007)(186003)(508600001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bytsWXErNjQ5V1VKR0F0bGUxUytFS1pMckxQT0luWVRnZ05tclcrSXRPK2xh?=
 =?utf-8?B?N1BoMDBHRzR6eitpaU0vLzg5b1hxNk1vRlVzYVJIUjVzOEtMYUk0KzJ0SGNT?=
 =?utf-8?B?d3ZQdUhLUzlrR3hOdEZ0R1FVcGYvSVpwNWVFMmVPYThqVmgzL0dUUFdsZlJm?=
 =?utf-8?B?dlBRSjZuZ2YrckRSV0tFeTdGUnZrbkY2Q2pHMmR2N2MrQnZjZVFvRXRMbk9h?=
 =?utf-8?B?bnNhT1VsSCtVQ2Fkbk9ua3BGcVE3YzlXcnFKNnU2QXlCWjJqdThLdGt1Zysx?=
 =?utf-8?B?TnlMODBOZVg5U3hRZStxbGh0WGZub09MSm1QN2ZmblhEWGhIcFkybHhjNkl2?=
 =?utf-8?B?UTNTNSt0UG5CVnd1ZFg3VHFwbG1welZsQWQraTQwaHp2YTU5QVNRVkUyRGlQ?=
 =?utf-8?B?ZWllRVM3NHV6cXY2SGovMHMxczAyQWZURXNGaDhKNzJudFlNcmhMLzc3VGcy?=
 =?utf-8?B?TzZPK0swcVEyNEd5ckx3K2xONTh4VVN3aUtvMnFMRytKVHpIdkZ5N0VMSXhh?=
 =?utf-8?B?ZnFzZnI5dUxhc1NiOTEweFhKVmFCdGFzb0ZRTHlWTFRNMEdwcnRvTGE2U0sz?=
 =?utf-8?B?MGdQd2lZTWh4bmlESS9OQm5hZldSN2VwbGxVVUd2WDgxVnRMSU1IMEwrRDdI?=
 =?utf-8?B?ZFhkOXNrQ3QrTE1zZjRRZWdza3VKckxBQ0ZEdHp1UHdzbEpHT3Y5RGVmVWs3?=
 =?utf-8?B?R1lOQmhVTUlYQVB3NDh6TEF2OUhFa1MwdHJVcFJCOGxpZHVCbUZKa0czUUlO?=
 =?utf-8?B?eldGOGFvVmVFSHZGcGV3NWsvQXZPWmp4L1pFQmJ6STlid2lxQzN5N1g0Z2Ry?=
 =?utf-8?B?RWFXNnkzZWlNUjlSYUsyOXFkbE81aTBUMnZDZVVwWGYxUWV1UVNGMU1zQUVt?=
 =?utf-8?B?RlY3QWxYdFAwZ1FBRkRWM1pLMmF6akxsUEhlbTU3VHAwdzhmT3ZyMXJza012?=
 =?utf-8?B?WkRYdno0ZEI0MHF6REFyNEVvaWMzcGVLbDJCczU5WmRFMHdPdUJFb2dnTU1v?=
 =?utf-8?B?Q1dPSVExVm5GeURaZmEydHNwUWl4TGlkandEUFZUMUtBdTU2MnpVRjVyb1lV?=
 =?utf-8?B?dTNXajNJSkhneDZwMTY1ZU4zK0YwMThsY0NBSVV5K1NHcTNQZ1pNZE5EeHho?=
 =?utf-8?B?RlhRSGIrUzVlMTBLTFBWVGhFQU02RW1JYzVRNnpNZ056NjZOSXhTb3FHY3da?=
 =?utf-8?B?eW5IVUYvY1hpQUdwWUUrMzNJckhTWnlLQU9QV2UyTHFyd2VnRkVDVzNwUGdS?=
 =?utf-8?B?TVV5S1JxZ0lOdU95amUzQ0RMYmZUSzhET3dZaWc5WE12dWJJRExPQ3QxZm5z?=
 =?utf-8?B?WVd2SklDY2pXVGkxR1pMOEZrbC9mVzdvUEM4bDIrcW9XRVlwTENsK3o2Rmo4?=
 =?utf-8?B?WkNkSGQxR3FsbHIyVUozNkc0L0FkQlNRZ2Y3RW1meUpORm9aWXhmcW9DUElQ?=
 =?utf-8?B?c3ZBN1g4eXlDOWJHZUpaSXZRRDVQSmJSQWZQS1pIRjJaWXhuQXdVTkFUbTRT?=
 =?utf-8?B?Smt2dlhMamJKODNTSEpLRXpJVzdUWldBM2NzZUxEbVVPeWpYNHRLYjIwMnhp?=
 =?utf-8?B?bE5SNS8rNnZaWEFGSmxvV2V2d0I5cFRLK3Z4b2g0Z2pSYXZwRVdheEdlbXpu?=
 =?utf-8?B?YmFOZFhFaUNqQnJnSVdMUW92YTVVRUZtUllLOExiMTBaR3lybGVhSTh5TEJG?=
 =?utf-8?B?OWpyTUtBRXFjNlFHY0tlbXRRSGxZQlJzT2xFVDZHVW9McmhFcis0VU82cWZu?=
 =?utf-8?Q?DXUPWVyOHEH3TCSl//k5olsDgCceLUDVDDhv81o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0829bc59-81d6-4c24-b4be-08d98962f8a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 07:20:42.2436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaI7FeiUWSigIwwbdcq7qFIVHsrNf9uO7bSbdZ0oUyunKm313lH1cBtXOf+aOoXZwsCiwIS1/c1vYvXN83tglQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 02.10.2021 04:35, Elliott Mitchell wrote:
> On Thu, Sep 30, 2021 at 09:08:34AM +0200, Jan Beulich wrote:
>> On 29.09.2021 17:31, Elliott Mitchell wrote:
>>>
>>> Copy and paste from the xl.cfg man page:
>>>
>>>        nestedhvm=BOOLEAN
>>>            Enable or disables guest access to hardware virtualisation
>>>            features, e.g. it allows a guest Operating System to also function
>>>            as a hypervisor. You may want this option if you want to run
>>>            another hypervisor (including another copy of Xen) within a Xen
>>>            guest or to support a guest Operating System which uses hardware
>>>            virtualisation extensions (e.g. Windows XP compatibility mode on
>>>            more modern Windows OS).  This option is disabled by default.
>>>
>>> "This option is disabled by default." doesn't mean "this is an
>>> experimental feature with no security support and is likely to crash the
>>> hypervisor".
>>
>> Correct, but this isn't the only place to look at. Quoting
>> SUPPORT.md:
> 
> You expect everyone to memorize SUPPORT.md (almost 1000 lines) before
> trying to use Xen?

I don't see why you say "memorize". When the file was introduced, it was
(aiui) indeed the intention for _it_ to become the main reference. Feel
free to propose alternatives.

> Your statement amounts to saying you really expect that.  People who want
> to get work done will look at `man xl.cfg` when needed, and follow
> instructions.
> 
> Mentioning something in `man xl.cfg` amounts to a statment "this is
> supported".  Experimental/unsupported options need to be marked
> "EXPERIMENTAL: DO NOT ENABLE IN PRODUCTION ENVIRONMENTS".
> 
> 
>> Yet that's still a configuration error (of the guest), not a bug in
>> Xen.
> 
> Documentation that poor amounts to a security vulnerability.

I disagree.

> I would suggest this needs 2 extra enablers.
> 
> First, this has potential to panic the hypervisor.  As such there needs
> to be an "enable_experimental=" option for the Xen command-line.  The
> argument would be a list of features to enable ("nestedhvm" for this
> case).  If this is absent, the hypervisor should ideally disable as much
> of the code related to the unsupported/experimental features as possible.
> 
> Second, since this needs to be enabled per-domain, there should be a
> similar "enable_experimental" setting for xl.cfg options.
> 
> 
> 
> I think this really is bad enough to warrant a security vulnerability
> and updates to all branches.

As above, I don't think I agree. But please feel free to propose patches.

What I'm personally more curious about is whether the patch I did send
you actually made a difference.

Jan


