Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E2F42936F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 17:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206214.361723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxGl-0000Tc-EW; Mon, 11 Oct 2021 15:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206214.361723; Mon, 11 Oct 2021 15:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxGl-0000Rh-B7; Mon, 11 Oct 2021 15:31:15 +0000
Received: by outflank-mailman (input) for mailman id 206214;
 Mon, 11 Oct 2021 15:31:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZxGk-0000Rb-A3
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 15:31:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bb5d66f-ea60-458f-b9e9-09d1a96bc2fa;
 Mon, 11 Oct 2021 15:31:13 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-hjt-Cs9kPqCEHB5w-X5dDw-1; Mon, 11 Oct 2021 17:31:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 15:31:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:31:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:20b:462::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 15:31:09 +0000
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
X-Inumbo-ID: 8bb5d66f-ea60-458f-b9e9-09d1a96bc2fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633966272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaRNu7+69PTiO7gE10xosCtXQezRnKHdumziS0PclSA=;
	b=D139grD987Fkz81mCYtmMT8GsyYOzMJuDfmUiJjONdp+pvttXMmJw72JUSacCy35YDK3yo
	F9fNn029BtKjcS9gNRrUZ6wC5F5hKmPj185WhP8eoskQhipw6ynIb4RMzpxgkQNtO31+3f
	sqM3qpu56cnT6skvzOlC/GDnyvIDnZI=
X-MC-Unique: hjt-Cs9kPqCEHB5w-X5dDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW/CJyHKlgH8VLii/eFgweSdxXx1Qcb+qwS7pWh6d8AMsVXB373XX6zSpZmbWzNvPqJAkzBiBhtrTcGB7IAu1QgSNZI1Fo0eHtEA/mdxlUsXks7g8RXUAWuYfEhsSPXs3XGKi42CbwxZDHw6gz4OAn5IcIUY0HenHPCcm4UHthURxefSKf/6ZyOqTkTW/UpmxkgF/Ifk8YQ68YnvqFST7B/y1u2yhBInrpXL7o2HTCJ2OEQeddG/gfGHsSdzBUZnsAVGMFBewtIw+TLe4FXALh7ZQIat368zlytv3L5omwHsoN8vbPQvnavnK+BHDYA+I9NE55RUQDuIWu28C+9grA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaRNu7+69PTiO7gE10xosCtXQezRnKHdumziS0PclSA=;
 b=QZdMjC5s3ZLZEIi1oJ+WGEzyVqoGNnO8UiM3LScfRAodLsLlgSPrv0cvUmUsmLiTdkoG6FzazqxzOBjIDiY6MYBGtTxcU2ArZLVYMjQetRdwDJ99iGLCt35FmlstI3tTfRd2FSsi0DpMlrHPNs69ystT3n9YmGyYS3W6HeDdpXYMI3/w0rWgHClIzdeYWVmhR9+NexAZFMd3WmFLWi9FVAm0MiPOsLWfdDj5t9lqh6FvvAjQAvVyI49zaxwyGxdIrHaJPOztOG/E4F31L+IqkE3KAoRlRZH1tKgd0e5sKaHSfqHqYr64qKFv1V5IoQsg224Pi84/4nH3NF4pfgabuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 20/51] build: avoid re-executing the main Makefile
 by introducing build.mk
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-21-anthony.perard@citrix.com>
 <87036d63-b5d4-55bf-0bb3-9b981a147f15@suse.com> <YWRRFxlvmDMu8nRZ@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b30bff47-226c-6f82-5f59-81d17b191ab4@suse.com>
Date: Mon, 11 Oct 2021 17:31:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWRRFxlvmDMu8nRZ@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0010.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faa08ebe-1618-4034-647a-08d98ccc26d1
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150637AAC08D8DECB7187A6B3B59@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x9sxCo8wGC+/fUxGPwV/RhqzghsXUSk3puUXuHtfD/D9OUSQMvhCKGs6hz1zUh13O/o3Pz0Y1H+L8AbPcvsFgeAATnlVwEYQcYiizBBIxf2ZZoc8RVpg6L2HDiYJldt9II45LVgbQm2x0xhWoY46R7D/GYAPMacznTddS9EpTrv7sA+u8omJTpheBzB6XSYDsaSHGYraf+4ElGc3er807OvafbU6s67krsXzsfswiBvcyerM/gaM5jjTehBDXWwpJL6a/pQZnv1f/RHWRiOj0GIVG1Z461LBLMK90K33oFCjyCVhkbqqSgDo6Sbb7q+QQ2QUkfRFgsA3QiIxg0P9w2lJi9oUDcVI5WdZrU7Od3UipDn8JBeLeaozp5Y/zexLkDQ4vU6hXz8XkjAx5cqeVVml51uQPHVHjJDQhEZbfkUePl9wPufb4EHVVq3nAaDRsuQZPZTHzGrM7JTpIwBDq1MlH5eGN3X9LjMbocFBwQeQi+62Ray+mvO4G/WRJhJ5iUdmSVzTCPsJE5/BWRCE7jVv5k/W7EEGOsR5Us2pqsguHVVDuxGZWOJOoEmWVGQTD1DESaby/dUheWQq8sbKIjSg3noO4Qr5aEqb4cqk5luyr8aeWmgQ8ok+l8jkyOdl8EMzRkn+7l0aXId8MyWK9e0k/LqA3g/fhKS2/v6TZbtHI0YPX7GObrGZWHE5aJCnm+uv9bamrTC3rmS2JqCmjdw6T5015f6UdJvWUxcRNq4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8936002)(26005)(508600001)(2906002)(36756003)(53546011)(8676002)(86362001)(5660300002)(31686004)(6486002)(4326008)(83380400001)(66946007)(54906003)(16576012)(6916009)(956004)(38100700002)(31696002)(2616005)(66556008)(66476007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUpKbmRKMWR4djVQS24yYktlcDlsa1RSYW9XQ3BIa2syVTdqL1BCNDEyZXYy?=
 =?utf-8?B?MS8wS20zWDBMVjRVelo0ejdzQUE2MkkxY2VrN0xZK25pZGJkTUZNZEhhTWQv?=
 =?utf-8?B?QzNsYnZYOXVYMll3NDFQRURBeTRST0ZNZVNyOWZmUFphRm9FMkV1SkZyNFp2?=
 =?utf-8?B?VUE5c09wcmVzNTBPOHY3KzNOcDF0SHQyWWliRzAxdEIvYTlLUUxuTkg1RVZE?=
 =?utf-8?B?MzE1K1B0VnliTnJxa2kxeVR3N3AxMzEyWng2WnFyU0h3UTFTOFhBRC9LY29Q?=
 =?utf-8?B?MFF3UDY5RVBWcmYwYVFtUnpidUM3SjNCM3FtMTRXM2pOdGtvejNXYWNvTkl5?=
 =?utf-8?B?T2hqbHF1ZDRSMVA4b2hMbGswalVVWk0wOFkrZlgzNUhRdWRGSGNJcVVnQy9q?=
 =?utf-8?B?eGt4eFJPTEdkT2duSy9iZlRhUnUxenh6Z0JkemhVME5xUDZQU2NQdlpYQUpL?=
 =?utf-8?B?YmxxWTlGcTBvWExERFBGM0hxRW8vSzBDSGVabkdBMXZyaGFxTG1oRWlybjNh?=
 =?utf-8?B?MU1sWVpBQTFldk9ncVFoWmtMMTYzMWNySTE2ZTJ5ZGVwcWNVUTMwVFJzOEIz?=
 =?utf-8?B?Z0tOdCsxd1dsL3ZQNDNFeW1HSy9VN3pKY0FZc1pwWTNqRG9pdjJZZGx5bjR3?=
 =?utf-8?B?RFhDRTZydmFzV29hTjl1dWRkYU4wYkcrYVZIdXBaTmZ2WXpjcldhU2NHdVFj?=
 =?utf-8?B?RUZzVU9HcmV1cjF5Qjh5S3hpY1pXQXErT052Q2JlUFJJYXRSVytDWFZpazBJ?=
 =?utf-8?B?Sm03eGg4YnVCSzFVWFBvVFZCSFdHZURDV0dOa3B3WWZ1NU1Ja05pY0E0elRJ?=
 =?utf-8?B?dTMrWndNVFhsaGpyWkYxejBaMXp0N3ZHN3NqWk5xSkVjM1BmV2tabm9PeDVi?=
 =?utf-8?B?aDNJa0tkV3VZdEVybzFVMXFTaEFVSVVKRlFFd1RhL3IvWFZGMzZYdWI1eXI0?=
 =?utf-8?B?YlkvbHJUNG9Vb0JBU0FwZ0JjSU41SnpMSGZTeWxObVBXOGNMdUw0b2lyRk1K?=
 =?utf-8?B?V25YS2RxbTVTU1hmdUppbVdpQ3JmVnY4S0Nrdmd3VXphNE5BWk9QeEdaQXVo?=
 =?utf-8?B?RFJWRWVxakNkbm5SYXlLZ1RRV2oxMG9mQ0dwaklFTzBzb2hnNVZkNGFLSUh2?=
 =?utf-8?B?dlNEMG05VFV0STNqTW43L1lKM2pXUDJWZCs1VWcxeTU5UHFRQXZkVDl1Z0h1?=
 =?utf-8?B?ZjVZUHVlNmw4MldyV3pLUzF1ZjJFWVBjc3NkOEhpcXZSeUwvTWZWNnR5Z2hm?=
 =?utf-8?B?R3RkVm9RNUJXb293emZJZ0xwejZTTWhMRGswWDVDdkZqcnVrSXRpSTAwNW1n?=
 =?utf-8?B?cXpwNkFydzlJYzY1SXN3bDB4L3ZBSVFLbU1wdXlqcEtLVUpuVTZIM2R0SVFh?=
 =?utf-8?B?K1d1bFFnUjFGUTVuOVpST1QzUWNaUVFROGI1OG1EVUdjaWwzT2lYc29IZ3Z1?=
 =?utf-8?B?MGZHZkVkWVVWd082aDRHZmQ3U0hmUnZ4ejFCdHdWS2JWcCtjTmhZejdNOUZs?=
 =?utf-8?B?RjdXd1FYbjlQOUpjVldxcXFxQW5hYlVSODdtRmtsMDhkWGpLL0ExWm9reGZG?=
 =?utf-8?B?ZlJQVC9rcjhRNitybHhxSnhJSkY4b2FJWkhaRG9mMFk1dkY1dGtWZ0JEbFRr?=
 =?utf-8?B?Qll3M3FQNTR4MGN6TWtKeUQ3ZGZ2T2VnK2d4Y3pnRUZIRjgxejBsaVhiYlJ0?=
 =?utf-8?B?WTdyWVR2ZFFVMVcyWFc3N2k1cHc4M0lGa2NHZEZ0VEFlM1ozTEl0TWU3S2JU?=
 =?utf-8?Q?0HLsDWeIIFeI6JnVac8LvMqes+E9RrY7YMYTf6g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa08ebe-1618-4034-647a-08d98ccc26d1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:31:10.3708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtTMKq7i0aY6O5ujSttFJs7CKZqOa0t7gd1vD1hO2LoL8AqbMD+fFVg2UnJy2phxgHxd6UhcHbAPnglNtAJACg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 11.10.2021 16:58, Anthony PERARD wrote:
> On Mon, Oct 11, 2021 at 12:56:54PM +0200, Jan Beulich wrote:
>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>> Currently, the xen/Makefile is re-parsed several times: once to start
>>> the build process, and several more time with Rules.mk including it.
>>> This makes it difficult to reason with a Makefile used for several
>>> purpose, and it actually slow down the build process.
>>
>> I'm struggling some with what you want to express here. What does
>> "to reason" refer to?
> 
> I guess "to reason with something" isn't an expression. I mean that the
> main Makefile is difficult to work with as it setup the build process
> for the rest of the build. And it is difficult to understand what is
> happening when it recursed into itself, and thus possibly re-executing
> part of the build process setup.
> 
>>> So this patch introduce "build.mk" which Rules.mk will use when
>>> present instead of the "Makefile" of a directory. (Linux's Kbuild
>>> named that file "Kbuild".)
>>>
>>> We have a few targets to move to "build.mk" identified by them been
>>> build via "make -f Rules.mk" without changing directory.
>>>
>>> As for the main targets like "build", we can have them depends on
>>> there underscore-prefix targets like "_build" without having to use
>>> "Rules.mk" while still retaining the check for unsupported
>>> architecture. (Those main rules are changed to be single-colon as
>>> there should only be a single recipe for them.)
>>>
>>> With nearly everything needed to move to "build.mk" moved, there is a
>>> single dependency left from "Rules.mk": $(TARGET), which is moved to
>>> the main Makefile.
>>
>> I'm having trouble identifying what this describes. Searching for
>> $(TARGET) in the patch doesn't yield any obvious match. Thinking
>> about it, do you perhaps mean the setting of that variable? Is
>> moving that guaranteed to not leave the variable undefined? Or in
>> other words is there no scenario at all where xen/Makefile might
>> get bypassed? (Aiui building an individual .o, .i, or .s would
>> continue to be fine, but it feels like something along these lines
>> might get broken.)
> 
> I mean that "xen/Rules.mk" will never "include" "xen/Makefile" after
> this patch, but the variable "TARGET" is only set in "xen/Rules.mk". But
> "xen/Makefile" still needs "TARGET" to be set so I moved the assignment
> of the variable from "xen/Rules.mk" into "xen/Makefile".

Okay, thanks, this confirms the understanding I had developed; maybe
you try to reword this some. What your reply doesn't address is my
question, though.

Jan


