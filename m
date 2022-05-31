Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81055538CBB
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339224.564049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvx8z-0006Tz-49; Tue, 31 May 2022 08:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339224.564049; Tue, 31 May 2022 08:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvx8z-0006R7-0D; Tue, 31 May 2022 08:22:25 +0000
Received: by outflank-mailman (input) for mailman id 339224;
 Tue, 31 May 2022 08:22:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvx8x-0006Qj-SJ
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:22:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cadd93ad-e0ba-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 10:22:22 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-zzBRJ-5kPQ-xEZEzF10PcA-1; Tue, 31 May 2022 10:22:20 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4773.eurprd04.prod.outlook.com (2603:10a6:20b:10::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 08:22:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 08:22:19 +0000
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
X-Inumbo-ID: cadd93ad-e0ba-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653985341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4mGml9iN/Ky/RiMOrdboD8kbCJsxPinu45pIM4N7ZUQ=;
	b=FXuqMrK1PBal3uVQdW2AtGA9hpS1tC9BTbx8kAZY4ZSBYG1uox4NqUdCtFFmsk+C1Y24qN
	t3/r5PHpzcjVLLnjdFX+XbwMwaH58zabyDXZ5O+at6gvmjolmk0j3hMlnQglPctyPxg6e8
	rCf9T15cYWIVhw6SwEO9XKeZSQtd7sA=
X-MC-Unique: zzBRJ-5kPQ-xEZEzF10PcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiWyUQt4M2PHCaVwG11YnRU9IEcu0fuwWqV7axrmrY2tdLxN4uQEhTdy4Y0vWdZnW3p2udoZXDPmftzdW/bu7S1cKc+K8wpA1BfaLs9IxWoDacY9hoWQ0Y0/kVi3UhITReHg/LYaEATHiodgA5oXEd08pda0qmQIeALqa9hkImXhW3D1IvKnmJuqe8xaJv+MknXO/SrhuNIZhoikd7jmdvN6DUXLXT71kykzghbzvIwMSmH/T7y/Bjd7/a+OUP7fgc55HbDvMo8igvgFfFtHQw60QRPObdTbY3ndjEaVkelJ57dLvzMtsBgDz/NjCKCAStqdMxE9z+zb7tjTk+RO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mGml9iN/Ky/RiMOrdboD8kbCJsxPinu45pIM4N7ZUQ=;
 b=X6XQjAR5SkEaiJQIy4DCMcOYfyjeztU2KqGAhPpNuKD41Wty3sivnEUsbyxYEflLMGz1NDOQtjztEO6y2Q7PWuRN6Yx5jmfaEJFvgqXBteuW3rgkIrVsHuKN7FD7f5oUXerrcFxU34hdH4hJ6nFkkPijqGZr3YP5ShHHk2IH4RHCIbKxJOPrOllhnwWio0eYg3Pi+Jy0g1jamTT5FTEOrbmn0ikGL9+GD8FDBanpGDAp3KFfR0Lo8uLaofj7rP4l5zhqAaBb3Q/5lpidbMIGKrvv9mEbmlUS7OBxich74o2YH9k4d4mx4T4/rCCQDYcNajnLgsVGgZ4lpd0Q6Ivp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18765793-1fdb-34e8-a669-5c799df94345@suse.com>
Date: Tue, 31 May 2022 10:22:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: PING: [PATCH v7 0/2] Adds starting the idle domain privileged
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 xen-devel@lists.xenproject.org
References: <20220511113035.27070-1-dpsmith@apertussolutions.com>
 <0c894277-85c1-faa7-a360-a82531733f12@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0c894277-85c1-faa7-a360-a82531733f12@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0080.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad272b2e-de6d-4c48-dd76-08da42dead7b
X-MS-TrafficTypeDiagnostic: AM6PR04MB4773:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB477313F3409A8879A877B16DB3DC9@AM6PR04MB4773.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MRhFtov83UxwWgOdrzsXY6M9qbneqnjUO6WRT14EfKJsHdNkombQBz0J6HzhsqN0FxxSRyuWX2enzVUg2jqnSFjykFNEcQeHpB9Hs2UZDSOKPaatv0pzrCpLXvDqAxDflJo+4RoyHSluPPBQDAweiuoW11XFZz/gmkd+9m1Ot0ylBGl0RQitLQaUoy2G41F7qNTmhpyYKu5LrI2Y56erzhT14d6rk/onymaBCkOFwot4ahXjSZcvDPWftEzd//q2WVKvE2cMqe6E4Y8wJyleq0UCI5wfZJwE5K5eSymdQPVL7gHaptMs4q9/OxRPhe7xtaRVLH69FFnrxIGLz4+NV0FFCZWhyCVtzhhKYqvnkxUxN0TYdfreRBnOnECDExC23iXadAW3BaKruPMABBLnKzbgDC2q35n1RdaxU23SPlIQFRHybtUeGD/eGRgweNXEMmnFHA0eaLilPFcyzMGlXUVhfQKH7yPhyeBmUAuY87+I28krHT07V0roFszef4XFUlKuLH2EG2ZcRHHlvQYPXX09Z0v2eTfibHnzhIATJKyYqqRLpCCiMrA1bXlXg0NqfFQCXS9+JCpcJvJOPYAi6+a0v4crx67gOncJLWx4W5yaTghgB2DeCxloBssuShNzidyA8mC55liP7m3jYjWKL4Zfdw1rsNbpTILOY+AV6BO+SQiHML8iQxPaiqXyq6+/fQhbBb1OEpdaYjXAlM0mNSD2+FE0BcOI+iP/SoorIUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(38100700002)(86362001)(31686004)(5660300002)(66556008)(66946007)(66476007)(4326008)(83380400001)(8936002)(36756003)(8676002)(2906002)(6916009)(316002)(2616005)(4744005)(6512007)(6506007)(26005)(53546011)(508600001)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2JpY0F3Ym1Ud0hYdnFGc003M29SSzI0bXlycE0zQnI1d2dFM2xLOE5SOFd2?=
 =?utf-8?B?dy96cXI3NXNvTzAvZDBiT2prT0hUL0s3MG1rUjR6VEhkazFzWmVyTEZGMURT?=
 =?utf-8?B?U0ppbFZUenhNdmxYRmJ6RldtTHVwMDBnV0FsUlcyM1Jna203eG5QYWcxdWhO?=
 =?utf-8?B?RUdTaTR3SFEyWnVaZkV6QjRFUUNhOGhhZzNOZ2YxaVVrZkNlUWdKRUpkUWlZ?=
 =?utf-8?B?NnM3UXV1MFFFM1BzOU9kWFBxa21aSjlEcmtObnl2cmRiODU4YjZqVllNTzdr?=
 =?utf-8?B?NXdtaEsvY1pndElHMHdvYTNZT3IwUkxhMGRsUnNZK3JDMnFkSmhNWVA4U29h?=
 =?utf-8?B?cUNxZE1aK3RVclJ6WFhiSHlzWlY1R21EMkxCV2U0L2Rpak5kWFp5alRPS3hs?=
 =?utf-8?B?aStxZnhFZHVxYWdqaHArMUgvaGszMnZVVkpvZE1FM25ZUSthelZFdkNBWnZC?=
 =?utf-8?B?MW9PakswUTRDRjRZTW1DaEZyNlZ0emd4ZXd2aklEK0JsMHNjeldBdWpJbjQy?=
 =?utf-8?B?TjVHRENRSkh5K0JLRmk4R0VCY053eFJycDY1Q2VPNWd3b1BKUGxlS2ZJc1dj?=
 =?utf-8?B?aFJtMXNDaW5pem82a0lMNDAyaytoQkp5c1pBMWtTRjJ2Z1VwZWVHOFM5cjhE?=
 =?utf-8?B?T0NRSGp3UGdtZ2xCZXJvbkRuOVhqbGp3SDdlV0laZXN2bDJ0M01LYmt2Umt2?=
 =?utf-8?B?dGRyK1gyTE5LRmhQYUEzMGFldFlHdXBuWVFmSTlnQUQ5Nzc2U2l3enJlOXZI?=
 =?utf-8?B?ZlRkSmFVT1hzY0xLUUZ1S1NKTkIvc21zZmRxM29SeXJUSHFKYW1Dc1lIejB5?=
 =?utf-8?B?VTc3ODNmSFBORUFwRmlOd3BKaWN4SWo1RUZ2TEFieHY1SWFQWnhUQ1U5N1Jm?=
 =?utf-8?B?UTA4cDd1SnpSdnVsdFJRUGRFQVE0SUo3VFFRRFdreHJxSk1GZ1dwSGF0ZW5X?=
 =?utf-8?B?YXQyRmNrZk1BUGdJbGphU0NOeDZtVTZ3Yk5OcElDQnp2RWJaZEdNdmVTUmIy?=
 =?utf-8?B?VVp1c0VscURuck1PWEZ6RkgrZXl6U0lBdkNLQjFrVTlGSVZyaXkxNE9Fd0Za?=
 =?utf-8?B?U3ltK21mK1pHRnJyQlF5dlp4S3A2cHo2bmMwWTJoUG9BL0xWU01GZitzdWU5?=
 =?utf-8?B?UVFRelJqRVBMeWk1OTVEdUxmelFHejRNTEVxdmxKdFZaY05ORGgyekxMVkZz?=
 =?utf-8?B?enJiM2pJaXVUOU03UFlWQ3FKdHFvNFMreVFReU1obVY2T1kvcC83QTJIcERk?=
 =?utf-8?B?MzhlL1o1cmV5QUdURVQyNWc4OEIvMVI3V3JMTzM3anF5TGJJTjVZenlHR1V1?=
 =?utf-8?B?Wk9EM25uV2NlM3prUUZRV1ZZQVlkeFBCNDF3bllBYzVmejNqcXFqMHY1dEpr?=
 =?utf-8?B?NDhROXloTnVMdXBXektjdVhONVloQ3htZk95NGpaRkZtK041SlNvOFR1aFJ5?=
 =?utf-8?B?M2RGd3ZCbW9tbkFNdjV4ZUp6cFVScHBQRE5LOCtaem1uTzFIdlgvSjQwSFg3?=
 =?utf-8?B?eTVYSDExUWd3ekdXY3YrNkRLRTFEa0J2eXdlWGJGVnN5b2tXZmdBUFFvdFpZ?=
 =?utf-8?B?WHlQNnNPTWh5R1REQWZPWERDVnhRU1hVUDJlQzYzWFRZRkxrdVpLMWJQV09K?=
 =?utf-8?B?TmttMS9YcmhJblphNDhjcW5CRjJRWXdYRkJYcGp0alE5SXJ5bmtNZC9OUWl2?=
 =?utf-8?B?b3ZYZUg2bmw1T3Z5RnY0ejJpY0FQeTIwV0w4NUMvRGVQc0lhZlA1czNwVnpv?=
 =?utf-8?B?L1ZEcHk0MFlSWFpTVFU5eUU4SVlscFFKd084ZElGOFNYTEJpcmFnQnB0aTVT?=
 =?utf-8?B?b2tIZnpOSkJOVC9IT0V6SCtLaktoQVJZUVlad2VRL1NEcEZqR0Y5clh6N0sy?=
 =?utf-8?B?QkgrRHNmV3NZcUgvMUtUOEF6WitBNkRCWTErM0pDUEtyZGZSM25mL2V0Vzhy?=
 =?utf-8?B?alp2dmRJYk1LOXdNMmlFTUFMR0J6eC9PbXgwazE3enh0NG5kYnNVNlVvaFpo?=
 =?utf-8?B?d05MbDNmRkc2d3R3RUxjTWRIbCt3cnpZNi9mcHpuMWJFY0lJb013VDJxTmlM?=
 =?utf-8?B?V3VjV2FEcDRWanpKb2hqSnBJb1cwaklMaCtqQlRSVHNKNmQvRThHZEJ4VUYz?=
 =?utf-8?B?QmhiM3FwWUh1SktyYTF3Qy9yNGhaaVVLQTdlNDYwdFFnV25hQUxVRXBxbDA5?=
 =?utf-8?B?c2dyaE05OEEvSTA0WEhZYTFnVDkzc0txMTN6RnQ4bkxCSmdRSUJucitSclBa?=
 =?utf-8?B?VWg0cUNhM2gyRENTRDBjVGEwZHYvTU55TG9RUVJQREpjbW11bTJzZ3BpMStP?=
 =?utf-8?B?USszczhxZVE5RDJqUzhoK1YwQ1l5Z0xZTENJcUZRUUliS25LTEsxUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad272b2e-de6d-4c48-dd76-08da42dead7b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:22:18.9439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wk8xPeS8cVVOnGazcx6r0Ys6wF8u9X0wyyO5vN/6vN3hizYkzEIvLoIE3wbcvKMbe894Qbi+FIO6Y/4Y8sEC+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4773

On 30.05.2022 19:15, Daniel P. Smith wrote:
> 
> On 5/11/22 07:30, Daniel P. Smith wrote:
>> This series makes it so that the idle domain is started privileged under the
>> default policy, which the SILO policy inherits, and under the flask policy. It
>> then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
>> by an XSM policy to transition the idle domain to its running privilege level.
>>
>> Changes in v7:
>> - adjusted error message in default and flask xsm_set_system_active hooks
>> - merged panic messages in arm and x86 setup.c to a single line
>>
> 
> Pinging to see if there are open issues I need to address or is the
> series acceptable? IIU I am missing an ACK on patch 1 of the series from
> x86 and sched maintainers.

And a REST maintainer ack (to stand in for the designated maintainer continuing
to play dead).

Also I notice your ping did include neither x86 nor sched maintainers as (at
least) Cc.

Jan


