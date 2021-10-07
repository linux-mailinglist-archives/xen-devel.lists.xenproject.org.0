Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D71424F5E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 10:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203436.358565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOtz-0003qh-DF; Thu, 07 Oct 2021 08:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203436.358565; Thu, 07 Oct 2021 08:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOtz-0003o0-9z; Thu, 07 Oct 2021 08:37:19 +0000
Received: by outflank-mailman (input) for mailman id 203436;
 Thu, 07 Oct 2021 08:37:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYOty-0003nu-FR
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 08:37:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5e06727-cd31-49e7-8600-f244c58dd08d;
 Thu, 07 Oct 2021 08:37:17 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-79fw_mc-MKqoMamdCM8Jxw-1; Thu, 07 Oct 2021 10:37:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 08:37:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 08:37:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0008.eurprd03.prod.outlook.com (2603:10a6:206:14::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 08:37:14 +0000
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
X-Inumbo-ID: b5e06727-cd31-49e7-8600-f244c58dd08d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633595836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PkwmS7Zhv0I0rTaqPmtM6jc93w/HGVw2VW0J1GBWAY=;
	b=JAt2Ats9nuVNIEG76sDE2vI1Dz8wfjylZH7bQqq5Cv7Oz1xw5uedalCnGPZ49B1yKz6/6G
	RfmZmm4kMVe14f9AXeimN5xHH68Fjwk4cHxXq7FvWpYXVuRXVfDaV080qi9NmRDfBbL+LO
	eUGAfRxl0qNmC3g07w/K219y7vUiJAs=
X-MC-Unique: 79fw_mc-MKqoMamdCM8Jxw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR3AoUk5uJqp05+tUyYLpJpc+ZS1JEPRDcGIvVjYw3yeCJpGEzmjObxdz6uC0z1F8B0ObaT5bdxZSb7IzhG+ofSW2VG3A4DY2l/K/7sFrX1OqW/Sjo1m+lVAnC18fEffDNXKlrKvykxfZj/RE1r6zyChXzeBpa7iI80s9pykz7xl2Bam6f5dVjnmb4meXlAmPQCk2arrozcTqklyF9uetYOARKDI91wJsmoAi5X5rZU/Z41eWbqfYpdy1pnKbX9Mnl526uGc6m/5x/oL+ODt1raymtwVbyMhLZ9syaVuz6A/+XtcO+R5ooPza+YBWpGI3Uhsq9vDzIezKuox3GkFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PkwmS7Zhv0I0rTaqPmtM6jc93w/HGVw2VW0J1GBWAY=;
 b=Mp0kiBNjPGH2eGsqYoU57kt4Gb3HERBMTTkWYigMiQvUpfc0TT69VdvfF/Xqf2+64mSsRbvU2hZMvTOenVYLsh0nVC82ME+XN4NWXqo1+qGKw51latbgYyBsusEr9R2krTbXVvnOwwSbSkWCqsJIhcjYUpYcTJDsLujtUs+FOywuTW/+QuT0eZs+93Owm+3bjkKvl9lWh5ih+9mxZSxZigcGCYLuOFc+ijooeNBFPVwj0Eiq7Tn1n+HEVB3f+2FeneDNIc/GFPqGkfDrkv6Vyf4rtL3E/XqHETB/uowmCnDKLk4NP1YVayxIvEqBSJUduzTJM0+gzssORwbk1ADV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/spec-ctrl: Build with BRANCH_HARDEN lfences by
 default
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211005111146.3694-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5877bd75-b4f4-aabe-0a99-c5c29ad25e07@suse.com>
Date: Thu, 7 Oct 2021 10:37:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211005111146.3694-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0008.eurprd03.prod.outlook.com
 (2603:10a6:206:14::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c980b031-5c62-44c5-ce76-08d9896daa17
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150CA486FBC34A502050DF6B3B19@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jLnZRJZS9KEpGrwyofOlcG/6XpBXey+tB9cfPpGyPzodlvjJ06Up4zmF4EHkLZKxGJX3H7QeSEQ0Crja6jABYKHEUDst/Tp/nzQq5dYSt46z2z724uzpujHgBSpRn9FfhBzx49l3ISphMBaZoFfXc89dfMqPgP+fhDlmT0PUWrXTHDGYt1pDfNvg6WGkLQJU/C4UNgcIr41LLeS8cYxjfMoH10t1/vQK6HMDXkXcCsMLP+gd1tEeOME3WVFWvqBMO1ZcaGzIJs+pCFiryztoEe58BgyxZh+quYWeGvT+23s8zCJdD+8J3ZoAv4W4AKmLdhJUQjwvc59c7nW2VbYeugKUrctRSVx9QAvLPgfQst9gqnnWRrakyX5H2yNjknjaBPXt/FMpDyNyaEOPCwazCdGYVSxWdkzkpLisMEBoDJtz9WCEa2JdOVxzNFLFHd5qEL0VhA/t1mIrujHSZLzniFT9dXBjn2R1TsgrZTvpz58fZTSWYY/mLSC5YZIF7eztqmdfOvQOeB3606Xj+QbIv35wWQxvyHAPJQVupH9V9kYlct86u7rJ22ioogJJl2Tp+38s9VtyHGfI+f+UQMySHYyT3EbC0gBOm+hsZ6rJ0F63OuPShYtJRB3mitQn+8juguMwhcRzXz3Y+PAxCBgXVqtYYWmX3xT8T88JXsTBBIIFcAeOBe18hCHjfJuN8w5BYGzKID3yL5GX8VuR8q7M0GWQr4TDgz66SRnMl482s6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(26005)(508600001)(2616005)(6916009)(4326008)(86362001)(956004)(186003)(6486002)(36756003)(316002)(2906002)(38100700002)(16576012)(66476007)(66556008)(66946007)(8936002)(8676002)(31686004)(4744005)(53546011)(5660300002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zkl5YWtGeFBORk95dm0yRmpQN0RSMm5DQzRCWlNjUFFjNnRCYi9GNUVPVW5z?=
 =?utf-8?B?Tk80UDYzVC9iczZ5amVVbURjNXdwbkZ0SU8xUk14N2o0dEZwd2xJTk9BWlQ4?=
 =?utf-8?B?NDh1TU80S1A3TmZrUWpzUHd4b25MWGJFM3lBcW8zWUg0M0k0bytXbTFpNWJ4?=
 =?utf-8?B?NlJ3dUdKb2tpclpoRFZybmszMkJQSVcyWkFXOGZkVW40aWIvc0llYVVTOXBp?=
 =?utf-8?B?c0VRNkVwdkRuNHpKZEZxakhkMVZjb2luWnYyTGxQem5rUG9nMEJ1TFlneWNa?=
 =?utf-8?B?RnFVN0N4dEZGZ2JhRDQ1eUc5RWNLbmxXYXhWTURSNytXRCtsdm5wYVZoYnYx?=
 =?utf-8?B?bm5pTGx4bkpnKzNSaHM5KzR0ZEpaZkVVdVJBM20wZGdScjVaVHJUaWFCL2cr?=
 =?utf-8?B?ekV0a0JRSm9wcy8zcHMzRDlZTkRSZkM2M2JBUGFpUk1KVFUrRFZOZ0k2VlpV?=
 =?utf-8?B?SnlhNElSVFRuWTBSbk05ZWE5R0tnNXl3QVVJN1UrMDJ1cml0bEhpMzRpMFow?=
 =?utf-8?B?V0Q4MCtRNDd0ZVdPdk5jTGZGbFZRdytsS0pTb1NNUXJUOHZEekNiK1l1QWh2?=
 =?utf-8?B?MXpRWDFpNHhOcHp3SjQrZFBqYVlHdHlRai8xME9kb3hEVVM1Z1FVU05xUytz?=
 =?utf-8?B?YVY4MlBtZDdvQmNBUUdBa2ptSDhvNndsSThnb1Nqc1lMRWw5RXFiUHJXUGtT?=
 =?utf-8?B?NGRURkE2TGF4dHBOMFdjeHg3TmRZT3N5eERDWXRqekdjcE1lTTBjbWwzZDUy?=
 =?utf-8?B?Qi9hdmFNSVhNMlBqWWQ5WWNFWUNFczhvbTR2MUQxaWppK2RldnJEbkpjdkwx?=
 =?utf-8?B?T1BwSnRhcldKRHBIVDB6ZDU4TitSMVM1NHF6bFpMRHJKOE4zUUpaQjhuQXk5?=
 =?utf-8?B?bzVGLzBWMXhaUGF0Z2RrM2tTTjRTbFBBcTdmL0o5OU8wV2dzVGlSSjh5Z3Z2?=
 =?utf-8?B?T3M5VVh3M2MyZ2kxTGhYdXg5U241KzhRUkdQQUtLZEd2ZmJSM0tSa252WFFM?=
 =?utf-8?B?ZHJUVnVmTlRjYzc2RXNLbDdueFVkT2F0SGlzMlU0OWVid25GVzQ3UnFNRDcw?=
 =?utf-8?B?azJEbzVuZ1AydTNqT2pPWnV3Z0hERVNxamNhYlM0c05UaUFhMGlpa2NqQkdj?=
 =?utf-8?B?T1ZubHo1aVV4MnpBaU5XYWJoa1Joc1NiRDZtYzRRdzIxQ1JXVjdSOHI1akp2?=
 =?utf-8?B?empMQklTdFdteVZvN1NlOWMzUEdlZ041ZlZmSmFYMkIxcTROa1FpNkpHMjFU?=
 =?utf-8?B?TjJFMVJRLzJFczQwbzZiY0Z1WnFpZG1TRGpYdWhOQXEzOUE0eDJickc2RElK?=
 =?utf-8?B?c2hIVFM3UVJGVGFBKzNGdk5HeUtYY2FTZTlsR2d4UFdTdFdtWkhqV0MvY1Rm?=
 =?utf-8?B?QnExdHVraE8veU1RYnJQRVBXckdDakkyUUxyTUxwZ1ltWUJtcC9hM3VITWpO?=
 =?utf-8?B?YmsvUnRZN3NkV0ZhaFBMU3h6b1ZvZnR6RllOSG10OFlaMG0vRW5BQ2sxaUZ1?=
 =?utf-8?B?b05rV0VrVHI1YmNjbCtuLzE2NFY5SUNQSVUxajUwbGU5dGtmaUxOTGtpU2l3?=
 =?utf-8?B?R2lrcXZHc1RKdXYrV1owZi8wejZLTDAybXQ4cGFsUDZ3YlpDNXA2US9UZC9x?=
 =?utf-8?B?MVVGTVd4ZThCQmk2WnRIaWZUeXpneEU2WWpCUWYzTzFMU0RNQzRKU29XZkJj?=
 =?utf-8?B?S3lRa05mc0hwY2RFQVplTm5od25qVzFMS3dNZEFzMkZzTm82bVBXdUxFZnk0?=
 =?utf-8?Q?vmh0yj8HUeS+3IQk3EQO08z6Sq4LMzj3WurKSgK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c980b031-5c62-44c5-ce76-08d9896daa17
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:37:14.8732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7e1eXppprHdEgCsXhJvyDxBqkA1bjylds4uxKCJG/HkuT6m+G3awhAe93tBFDhqANhhexE3wk7aVW2FIZ2lGCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 05.10.2021 13:11, Andrew Cooper wrote:
> Branch Harden is enabled by default at compile and boot time.  Invert the code
> to compile with lfence by default and nop out in the non-default case.
> 
> This has several advantages.  It removes 3829 patch points (in the random
> build of Xen I have to hand) by default on boot, 70% (!) of the
> .altinstr_replacement section.  For builds of Xen with a non-nops capable tool
> chain, the code after `spec-ctrl=no-branch-harden` is better because Xen can
> write long nops.
> 
> Most importantly however, it means the disassembly actually matches what runs
> in the common case, with the ability to distinguish the lfences from other
> uses of nops.
> 
> Finally, make opt_branch_harden local to spec_ctrl.c and __initdata.  It has
> never been used externally, even at it's introduction in c/s 3860d5534df4
> "spec: add l1tf-barrier".
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


