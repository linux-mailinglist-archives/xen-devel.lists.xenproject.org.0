Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FA03A662B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 13:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141359.261135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslEt-0005o8-DC; Mon, 14 Jun 2021 11:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141359.261135; Mon, 14 Jun 2021 11:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslEt-0005lD-A8; Mon, 14 Jun 2021 11:58:47 +0000
Received: by outflank-mailman (input) for mailman id 141359;
 Mon, 14 Jun 2021 11:58:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lslEs-0005l7-KD
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 11:58:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 406a51d7-6879-4a36-8a13-773fd169ffce;
 Mon, 14 Jun 2021 11:58:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-uO0mL1uuNUeRgOYsXpK73Q-2; Mon, 14 Jun 2021 13:58:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3296.eurprd04.prod.outlook.com (2603:10a6:802:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 11:58:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 11:58:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0026.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 11:58:39 +0000
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
X-Inumbo-ID: 406a51d7-6879-4a36-8a13-773fd169ffce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623671924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLUDRLYsIajKK0RYgEbfX6JIhgIHNKKzgzDM+8fsSzU=;
	b=KSPvVWPP9JwwKndq3CfttdFC7xBXSeysBwPZyX2I6wlHydXzMPxY3gH9CvT1rt0VUtjjFS
	ies0EPwqH5pim5Af5O1g2WJOeGPWBJ3V34JEo/dQIPtxrIEqE8vqS6MO8w/EJPCzIsOg5s
	9Aq9SvoCk6bRkz6rgeVYTljzxVlqr94=
X-MC-Unique: uO0mL1uuNUeRgOYsXpK73Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IW1QwQDZDp8Jkt8az0yD5hGZNwF2g6TDQdi1kycnAb1+i++wO5R5kEN4LI6C+NSl2hk1AngeK5l+WWA6mSvJdMMFhcBdePNXwgNnhwhSRp5tE8bL98DAbUmXf3rZVLRWVx8GGr9g+kdhUhdY/qKjip+SVkavD/E5I5wQvbAGCYKRnHzmb9lE7cBmPoMRa8+x6shTdKHoqrnvz4wwqhZMBPi3WZQocqnD3sN3NwjmTdYQTgec3KAu9RIFNeW142MAUOr62iERT3kF+r/G4q5ajuXEmzRIYhBIxphGWwumtnw4R0b8yeRE8V5U5gjBp+eFoZh1Iy7z5UVYP53FWkvR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLUDRLYsIajKK0RYgEbfX6JIhgIHNKKzgzDM+8fsSzU=;
 b=LFkSk6dt7N91eOkhxe2jsYJteNB89BuVBvG1EY1Sp2mL3hcoSxQtSl2Qxbx3+sYwGlEcxjcNTi7m6Wrh9tMCC4fnvfFA88YlJsFYvu0WmzX8QDkxssC3kavtnM8mux2xqSAnoobrNfRI4lLvEEcNdzT5faRSLEfH7oUbU8OvRlPY7GyUS2SCqCZIVbniPRUnlurEwVJePkpEy+wL/m36cAXgWLYuLdMOEFZEj77zWz7HfBTKOxIBqt6n22NoVYXZg9YfheddAmWuvndZdakVbvM8+75KJ1gSUhkHoy8leic7K5kJ6TxVqIpT9W9aaiJUy0p3EiEjCLnibUQ1AEMasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable test] 162771: regressions - FAIL
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-162771-mainreport@xen.org>
 <78aa2d24-3e2a-01cd-4596-e2796b4432a7@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7dd0b271-7904-0316-2b4f-00d5eaa78bf4@suse.com>
Date: Mon, 14 Jun 2021 13:58:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <78aa2d24-3e2a-01cd-4596-e2796b4432a7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P192CA0026.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7e557ef-59c7-4cb9-9dd5-08d92f2bbfd7
X-MS-TrafficTypeDiagnostic: VI1PR04MB3296:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3296BABB795DFF7815130F83B3319@VI1PR04MB3296.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5E7DrIrQE9oZAxJy4Z2oGLvkaBzIqLqD10ZLLMnfmtq8Eqd3byEoEBDrYGe2nsR0X5uItxJN1YZxruAvK+Apf/xiM6FnEnSHt1P5IFcv8exfLGvfqCdZdwJxUTN8/wSwZ3Bes+GoWXCE2YbcX9QaaLIuwpzsiIqan6HWSfLdJZCWxrkmp/ITZnAvFFUFqPE8DjkcFoKLAas4rmJCNbJclMepaJr+4HLxLJN6AEO4GLYglzo8hxVY6wzVMvIX4jDo/IZW/Xe2CBgwNV8+hyDDiPKmhMyw7/RbK16xnnwzvEXgC/XvB8oVg0NeTj2zYouH/SGu9nkV0SMXI0DlsTag6d8I3+Yj3A48gpntfLdyVJVgzQznICmmL0crbKoTo6Kcn+1h0ST7R+8hPIptMLD+qPlvQH2AKo0JhfI6IIz0B8ViWZkegZwMKlTuJu8bpii3+M31CB3++qpPHWeaAEbjqJ1x3cO0VoyvlxwJ+7YqOquO/JXUau2TgdU1Xbw29GqkwBZs+RQZXrIAx1cK6VlaXh4SUMpnyZ0d1929oHmPJqQ0Y1NGzUkwdAUg1WFOQf36i5mG/uH+l7rYKOTr0RAFpDYqm1u8O1OPqRRlM/vC6/RZlf/mO9r/MNaKWQLGcdmI4UfV5owr/QbuI8yX9iYhqyRw+00g7jeo0vmY4L67w0Wx0NTxwYOS7ChYn8cFT9nMlo3NNyZX4VKZ/wYXHPjxBqjdC6VD50LKJL7o3zwR+w5dAE2+VoeH44KV/shPRNqokbLc3Xexl3FUVoVHClsYZxs7iIEb3c9mH6YCQQlfC91i2r+a6Q7Da8HF3yQP/RYz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(39860400002)(346002)(366004)(316002)(16576012)(26005)(37006003)(16526019)(186003)(4326008)(38100700002)(8676002)(54906003)(2616005)(31686004)(956004)(2906002)(53546011)(83380400001)(966005)(31696002)(5660300002)(6636002)(86362001)(6862004)(8936002)(6486002)(478600001)(66476007)(66556008)(66946007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnlyNGUzQzhHUjNIMU5RVlltNHNuaFVHQkJReG9SVE0xczA5TkxWZU1zZXcx?=
 =?utf-8?B?elp2dGN2MURBUnRtT1VFQlgxZlR5NjJWZ05iTlBqRGJINHF1TEJhUlkwd0ZT?=
 =?utf-8?B?TWlzNzVDTU4wOGgwcmpoTTRiNEErbi9yRytkTXpmeWFaSlFhVjJXZUlaL2ht?=
 =?utf-8?B?THg5T2tIZG5udWl4QlphNGhGQUtlK2c1T1pNZThiTkZLZndmTDREUlNPeGJx?=
 =?utf-8?B?WDRqdWxmanZDMlRuL0s2dHNRZ0E2em5Xc2FEOEhOSjBRbUxnQUVyZ3ZlY2F4?=
 =?utf-8?B?WWU4dE5NazhmeXpBdUxXM0dOT1A2dUluSUdGZFc5a2JYSFh5Z2JuR3cwZjFX?=
 =?utf-8?B?KzQ5TmQ0aDZhY2pGVmdOSVpjZ1BtanhlSGRxNERYQkQzTVFJWW4rb00xdks3?=
 =?utf-8?B?TUY4RlpVcE1vYjNkdVJSSXpvNkxKclQvOFpnLzZrRU5OWXF3UEdVdU04UzBM?=
 =?utf-8?B?ZGh3NWQybi9IRWlzYjVHaUs3bXBIVGg5TCt6ZkV0V21pSzNpYjBEc1J2OGQ5?=
 =?utf-8?B?VkM2Q044REZIT2FpMCtMcmM3a0xVUFlyaWFkQjJrZHhYWXNYaFo4YmozdEZV?=
 =?utf-8?B?RUI3WjY3clY2MFBtR0xZMzJlaXdSSWlseURGTU1GZkF5UWtVcCtDOEdTUFZO?=
 =?utf-8?B?R3Z4UTVYWUF6bCtMNWoxekV3Wk4vVnR5aWVOWkl6RTQ3MkZwU1Q3WWtrcE1i?=
 =?utf-8?B?amZ2bjBoV3ZTNUZ3eG5CRlEwUTFMQVA0aWtKSCs4M1pQWkw2MjVlWWhqQzI3?=
 =?utf-8?B?dlVkTGVWaHJLN3VHSHFUTEdtSTVkcVU0dE12U1JBaHYxQlNuZzlSYnRjZGEy?=
 =?utf-8?B?U3JOSEN3Q1B4RFJwMXlMTndkU0JaVnppSm5yRWY3UDFkSFltL3czN1ByK3A5?=
 =?utf-8?B?V3ZyYlp0ZUpLZ0dheE9SangwSTc1N2UvNnhYU3l6dmV3ZThUY2NEdWxYRjVS?=
 =?utf-8?B?OHhKTmdLT0xZY0t6cGR3N0laVWYyMjc5aHowcGFldlJhUFJCSUZQTFIzN2sw?=
 =?utf-8?B?NzRZMElHNG5TdjlIalovUE1KR2F6M3pxODV6OUhlN0h6LzIyK1NpOWI0UVk2?=
 =?utf-8?B?TS82SmpqM20xZG9Fa2RidzBuQnFsZGlJSUlUUC9KTmFFbld5RUpkS0hPUGhm?=
 =?utf-8?B?VVZsOW5RRnNkL3dwQzUzdklIOERid1R4dkRWTzFmVmVEQmFmdzlWbWY1VEx1?=
 =?utf-8?B?OU9iUFVMSUJvSzg5QlA5bDQ0SGl4dGhZekVYNndWak05ZHhFVHRLUVAyc0xD?=
 =?utf-8?B?R3lhb29uRzl6SGRVSHBBd1JDVzY2VlFOdWNVWnR1ZEFnM1BuTGNkK1ZsK01K?=
 =?utf-8?B?eE8yYk9FQ0llVlRwRzFreTh6TituVHduWHkvdUp2MEY2WlhHMkpDZ05HNXFG?=
 =?utf-8?B?dmhyN2xVVE9VU1ExUmZ3aXVRbStDdUxZeENMVVNMRlJ6Zzc5MzVMZEJGZnhu?=
 =?utf-8?B?b3prS2FXNHFiN3JkU2FPdlZxYnh6OGFLek1Ndjllb0N3V3lSQXJXbDlwSUZ5?=
 =?utf-8?B?NGdWYUtkUElQZEM4Z2RnZmtBZGxhTDFlY1NLcC9oUXV1UUNKNmtqWFhuZS9B?=
 =?utf-8?B?Y1lpU0YyZVRMRHRmVXBacmU1MTFrUVY4ZHVwQkh2aXpXZisxYTZLTzV2NVFV?=
 =?utf-8?B?dkkyY0RTdTVmM0U4am5NNCtqbzJFQ2wvcFdjYnlUajh0cFNudzQrZHdwY203?=
 =?utf-8?B?U0FIanhGTVRsajB5UFdRbkdPTDlSZXU3MUp2QUxyakxrWjZxeHdBSzZ0ZmZt?=
 =?utf-8?Q?HpGxeXvkLlGXmS02pNIwsgwoHV8QXpevg7YI8Xs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e557ef-59c7-4cb9-9dd5-08d92f2bbfd7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 11:58:40.0742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xw0pqS/rUVKNgDQboqAoXvDIcJJua9PYO75fw+o2BoEKumwPeUu2iCMzAky813AYeCjCMrsOOvSA8le81Uhtww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3296

On 14.06.2021 08:41, Juergen Gross wrote:
> On 14.06.21 04:21, osstest service owner wrote:
>> flight 162771 xen-unstable real [real]
>> flight 162783 xen-unstable real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/162771/
>> http://logs.test-lab.xenproject.org/osstest/logs/162783/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   test-amd64-amd64-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs. 162533
>>   test-amd64-i386-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs. 162533
>>   test-amd64-amd64-i386-pvgrub 17 guest-localmigrate       fail REGR. vs. 162533
>>   test-amd64-amd64-amd64-pvgrub 17 guest-localmigrate      fail REGR. vs. 162533
> 
> Hmm, this is rather unfortunate.
> 
> Those last 2 tests failed due to commit 7bd8989ab77b6ade3b, but just
> reverting that patch doesn't seem right to me either.
> 
> The Linux kernel has a bug here: it will initially set max_pfn in the
> shared_info page to the size of the p2m_list (so my reasoning for above
> patch was wrong in this case), but when growing the p2m_list (e.g. due
> to ballooning or grant mapping), it will store a real pfn number in
> max_pfn. But even this pfn might be wrong, as only the pfn leading to
> allocation of a new p2m page will be stored in max_pfn, any higher new
> pfn having its p2m entry in the new p2m page won't result in a new
> max_pfn entry.
> 
> As a result I think the only sane handling would be to assume the
> max_pfn value read from the shared_info page is really a pfn.

This would be contrary to the public interface header having

    /*
     * Number of valid entries in the p2m table(s) anchored at
     * pfn_to_mfn_frame_list_list and/or p2m_vaddr.
     */
    unsigned long max_pfn;

IOW the name containing "max" is misleading (should be "num" or
alike), but there's no room imo to change this.

> This
> value should be adjusted to specify the last pfn of the related p2m
> page, and the resulting last p2m page should be tolerated to not be
> valid.
> 
> Another variant would be to just revert above commit and modify the
> semantics of max_pfn in the shared_info page to really mean max_pfn+1.

But that's what it is already, according to the comment. Are you
suggesting there was code prior to the change you've quoted that
already violated this (in Xen or the tool stack, that is, not
the issue you suggest has been present in Linux)?

Jan

> This would result in possible migration failures of ballooned Linux
> systems as today.
> 
> Additionally I'll fix the Linux kernel, of course.
> 
> Any thoughts?
> 
> 
> Juergen
> 


