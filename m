Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C5E5FECAB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422731.668962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIA7-0000ub-Qe; Fri, 14 Oct 2022 10:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422731.668962; Fri, 14 Oct 2022 10:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIA7-0000r8-N6; Fri, 14 Oct 2022 10:43:31 +0000
Received: by outflank-mailman (input) for mailman id 422731;
 Fri, 14 Oct 2022 10:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojIA5-0000qy-7U
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:43:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 092de5b2-4bad-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:43:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8546.eurprd04.prod.outlook.com (2603:10a6:20b:421::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 10:43:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 10:43:25 +0000
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
X-Inumbo-ID: 092de5b2-4bad-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRkQbzGNJv8jQEhzWst8HIWtN5WFPnMjqhf/1WmSt0PINXlIZICx3zuLgz9i8GQ67aB+poDzrJRRRcPrTsgak5shnYgUHoDXKpJlSshspZulQm0EJcHmx260Kl6N+BKQlCpX/ZcrRffmhZ7LqME37UZpovBPAmE9FKPTWUllffJSfhLXhiwYc/oq5CEFbpHG1BeGjSWg6W7f9KRFZHO3JqTACZgmC+txWt4jGVPr1nZhEY1QW4kovDGZb6VLxEtUFQHe7BZ+I9m8/bY8z4zQBgHLzlTSxJ32TqO0LsYtpJSwH1J8Xwtu+XvI8W7JmoxMLAddM02+ZKo7m14fE0RuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLkag60ksws4ZogeaVrwHFNaxn+T1aigRmkyakPW4eo=;
 b=oUKT+/brvy3dPDbqWoGx/4bnIeWYJFhsHkiaDMgFPN6IyxCCV7FAZNgHWSsgdSQ1dxYm0NsgHOFQi/EWGGdZyszxnSIOUBrakDt1uRy1RlpBXBxrUqnkLY9OsAMypgDp1fmRYw28a2S2k3OQXfTtBRxD1anRHnUssTA83a4B5YL5v+1HntyJEMJkUjBPMDier/5mq6fFiwYbFAfQho8NljLPeD3/4zkJCXHqFLElPJJ7FJ+fgomf59cl5dElbw/h/R6Zkqeq+itAk7wBejr+YHKOUKNL+TxMXdr9Jqs4YlCYTpOMQJAjS+G32xyT0jfs41XvhJm1r4FzF/CKFmXDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLkag60ksws4ZogeaVrwHFNaxn+T1aigRmkyakPW4eo=;
 b=zlf0bAJNQhgPSDJoWvf1R4S5Hb6HN9Bq0Tvi8vaSaUIKFRjjNNEx25w2bVw5M22SaH0u8uoZGyyQKY+fVJnGSYm7RTaxD0GSpXMFTpVM1GZLngWQ/k9TcxLKWN2T6sQ3LI7qbX/igNV8gxspVTx2QvCc9lmxdAXTmbM2Fo8nCOEhwngoU/VOL4qBhEFVmQR/RvxBd3IfGh47GkEQszVoO3pvvIm/17TpHM3nruhh3XAWr04hJQlfw8g92emF+77+msYTblgySDopbvuzz4FVEHudeIeoBwsLxyJ5InaaratXkBGSkOKXMN8cAJEOyHRFQwVUeV3WXzntfQrpr+vEng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54c1cfc7-cffd-6d36-6044-1d2e9945a663@suse.com>
Date: Fri, 14 Oct 2022 12:43:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH][4.17] x86/shadow: drop (replace) bogus assertions
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e447da22-23d6-d3db-313d-4e4ca009c3df@suse.com>
 <79dc0e1a-8f8e-a05a-3db1-5163537c66e7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <79dc0e1a-8f8e-a05a-3db1-5163537c66e7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: b4711479-60e4-49ff-ef60-08daadd0ec5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0H77CYLIQ5t//tGjnqrXP6xXLYWucxyczzv+yY+DfqWmlS62xJfJfVTLnCmmaxQ0Fx60tm0MSSWC+pOXo3sPmatE6rT9KFp3LSMD8zapnmetQwAqIGHTBnaCcEvQOvbSU1Kz8Vs8J2P0wPB59tB4zPK8gF7zQhbDq2fweGBtVyk2EFoVC4Q7Cs4pZtaYoYbJd6e5hoJhy3182HxTFwesA4MYEOLlfHIK/NSQo6Ff6TGSfkgdmGMYNlNsD075Qj0QhqK9MGbLKYPWukmmIkWTluDb9ZsWvQ7DsFa4jZtHdIdywQ8NLZ16RDtSuGymkSZMqH96SMJlOuB69UlRmE+zzocpbrcbJnRzcMSBFPO3cxhUoUFVwm7TN9/Gzm5/gTgvj7/KTaEExtq3JnFJ4ASKQj48lVT//naxvfJxoiWI12FXD8E/dxtw0BsDNN8WZy/JYRRKVWt2OXtAWQO9GzHIoX2xhoNq7cAvQfbIpLfIdQwsp/F1stjFAJLTa+0RLfzaKJxGjmUPLYvXspM51zqScpitWQPPUPQ9AixQlE21VqimToUkmNpKfhrkYaddIz5wDbMAQBVVGMz2T73R5bYSK1t0oSU0yFBJxBQclKp21qV1FQEcKxOcygK19JT6sFeFHkoCzHBjXG8+78pSGsvOCoAfeWOmuDmKjTPJxs8YpEJEHRfQsHhnzQXLsc6hbpmDrUnD68K8atBZtXQfvFbQp1r41gCqCHK9Je/Dl0+FcuQk/909s0t1JNt77BM/pNKNr5srkoVhbIAV7fdu0KidZ+7xfsdqxBEwHX1KVBo6U9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199015)(31686004)(66899015)(36756003)(53546011)(2616005)(41300700001)(26005)(6506007)(6512007)(478600001)(6486002)(66556008)(66476007)(8676002)(4326008)(66946007)(186003)(38100700002)(86362001)(31696002)(316002)(83380400001)(8936002)(5660300002)(54906003)(6916009)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDJzR3dQMTBRdjdXVXEybmNacWtwazNGK1c3YjVxcmNPRmdjaDZqTWk3eTJr?=
 =?utf-8?B?OExLdlQwN2orV1g5UHJrenIveTcrcHhMMzJnaGVyS0gxbFVaSDM2d0sxMkJB?=
 =?utf-8?B?N3hRV0ZGeVZsSEZBQ1lKSzUrMmw1bkNvaU1nc3pTR0VmM1hnMnZUK3VXSWdt?=
 =?utf-8?B?YlgwOWUrSU5RbVg0cklSZDNEV1Y4OWN1WFlkZHd2V0xramZHVG14VFpMTFdB?=
 =?utf-8?B?RUZ1SXNLZ05ub0pBK3ovWENQa21hcGhJOVhvalIzYjVkVXZ6bncyYWljaXBr?=
 =?utf-8?B?U1hreXQzbkFaYWl5T2FEdFd4QlgwenhSbHYrTVJCTmRjYWxETUJlWkZrbU5u?=
 =?utf-8?B?ZmI5eHpOd0t6SUNDRGJKTEFrbW9rQkFZMDlRMExESmlqaTJNdmZ2elY4eEQv?=
 =?utf-8?B?MXhhNUtrdWJndHNUNXJQbG8rQzJPR21adXR5RlVsd0JMUmFLQjdCK0lUc3hL?=
 =?utf-8?B?ZmNsclo0SjcrYXNoRFV5TklnSC9abkNjenZ3cU9IejA3WkJLN0tZSmNHKzFq?=
 =?utf-8?B?YXVvcnNGa05acjlLODBzbjZTSHF5NDBjYW5JT3N4dmJwR1hoajdGL28vVjM1?=
 =?utf-8?B?ME42VzhIdFpjTGE2NXFJdWFaNk9xd3RPYmtLVWJRelo1L0liRWZTZVV2V256?=
 =?utf-8?B?QWpqRHF6TW1uL0ovL00zQW9DbkIrbmNQKzZONWc2VkpCY0xsSE5LV1lIVzZP?=
 =?utf-8?B?N25jaXYzQUdDalFBY2ZqZ2tNMVpranF6N2VLNkw0WXNOcXk1aU55NFhTWGZF?=
 =?utf-8?B?eHBhNWI2RWZYTTlYWXBZbUlHY21hR1gzNjJyS3Z3M3JJOWdkQktNTW1FaWpI?=
 =?utf-8?B?OEhYNU5hSk1Sd0o3Zng3RkFqYWVMWUxnLzlRVk5wTlcydlFERUJEVVlPaEx0?=
 =?utf-8?B?dURHT1hPaTB0NDJPaUl3NlJRUVVjL3k3eE9jYmk4RElsVXkzQzcybVUzelkz?=
 =?utf-8?B?MHg1M2hXbnY4djdscTNFRndZYXFOVU5zQTM4RmwzdTBxZUR0elFEL1dUZFI1?=
 =?utf-8?B?NXZKNzcwbDcrdDNva1UzendiWWxHOXZXVUJnMTI3dUt6MHlpZFJ2MlJnMHY3?=
 =?utf-8?B?YmNIT3FTd2FQdWR0ZDkwT1lDTGRGYit4a1dCS0Q4eFpKV1IrakdKTWJKUnlu?=
 =?utf-8?B?b0hlM1NmMnNEWXJsTFlCUkFmWWpkOFQybUxSV3NzOFVrQ3Q5WFdKZjQ1UXVZ?=
 =?utf-8?B?eXVxSXJ2T3UyRzI5UUwydzUyOGJQbXBBK0kyYURNZlFjKzBxQVB3ajA0ZFNI?=
 =?utf-8?B?NDdia3lMRnRKQUZGSWdHallLa2NEbGVkNFJOUW5mbk05MERXNFpkd3l2bkZZ?=
 =?utf-8?B?Z05sTEx6UEdSTEMvOTJFcGg1SnVleml2SzBjRHFRSGg5T2Z1Znl5SlVWTzF1?=
 =?utf-8?B?THR6RSsxeG9WeUx6aVlCU21TWTZ2YlJYbGtUeHBsdk1rc0U0YVZhWWNRM285?=
 =?utf-8?B?L2dndFQxRVh4ejRCZDc2NFJoSHZKTWR1Wkd5clZYTFpKNmFyWkxJNm1VRkk1?=
 =?utf-8?B?ZVlOVmpXTW0yRWhSL2RNRld0Rmd5R3MrT1ZmOGIvNTcvMUhZNXFWNlhtV0J4?=
 =?utf-8?B?eENxSlFtVFQ0S0w0aDFGY2R2YWhXWFFtNC9OUlljYU1MMVFCSXdJN0l4YjEw?=
 =?utf-8?B?N204Y1pjWlM5U2hVazhUa3dYKzdmcWd5dGU4WFNub2g1ajZ0L0I2UzZDbzB6?=
 =?utf-8?B?VWlobjB4d09Ic21sNXpoekVTS3RUamJheHgvWUNGR1V4ZjRZS0FGTjc5R044?=
 =?utf-8?B?Y3V0TmF2R1RnQU9sVXlRcFVvZnkyazJteWFmcnBLRGNSVUF1Umx5djFHZmhY?=
 =?utf-8?B?dVRZQUQzWWlMSFdLRytxSDNZUHU5RWNoeGp1UHdJR3Y4dVJCdWg2aFQ2dStm?=
 =?utf-8?B?d1pqVmgyV0M2SFBZblAvbmxkMWpJcVZRd2ZWVnFsNHVHdzBJUEp5RVBWOCta?=
 =?utf-8?B?UDIvUHRKU1JlbG1uTDgvbzVjWVhhazlLVEdJZVdpQlQvcGZQNkRlZFBmWlFJ?=
 =?utf-8?B?S3JqM2VrcDdaY2xXVzJKdzFrNmk3K2p0WWFueE9yOXEwYVdwWXJ1ZmU3bk5M?=
 =?utf-8?B?UDBLYXgrcjFMeGpqcUZRWVhVTExhVElLMy9sQkd1NDRUS0N4QmRKQ3hxU0NF?=
 =?utf-8?Q?aewG5l3VMO8en4VAYKv3F2Sbw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4711479-60e4-49ff-ef60-08daadd0ec5c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:43:25.7600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88hd3op0LO8oFMj2VC9pLMm397n3amUxJFLv4mQPKjuRZb6/Z9RhcQqGp9ed/A0xscRHw0IWjMrEz7xErbKj8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8546

On 14.10.2022 12:02, Andrew Cooper wrote:
> On 14/10/2022 09:49, Jan Beulich wrote:
>> The addition of a call to shadow_blow_tables() from shadow_teardown()
>> has resulted in the "no vcpus" related assertion becoming triggerable:
>> If domain_create() fails with at least one page successfully allocated
>> in the course of shadow_enable(), or if domain_create() succeeds and
>> the domain is then killed without ever invoking XEN_DOMCTL_max_vcpus.
> 
> It warrants pointing out that are unit tests in the tree which do
> exactly this.

Can do.

>> The assertion's comment was bogus anyway: Shadow mode has been getting
>> enabled before allocation of vCPU-s for quite some time.
> 
> I agree with the principle of what you're saying, but I don't think it's
> accurate.

I'm afraid I can't derive from ...

> Shadow (vs hap) has always been part of domain create.  But we've always
> had a problem where we need to wait for a shadow op to allocate some
> shadow memory before various domain-centric operations can proceed.
> 
> As with the ARM GICv2 issues, we do want to address this and let
> domain_create() (or some continuable version of it) allocate the bare
> minimum shadow pool size, which simplifies a load of other codepaths.

... this why the statement isn't accurate. What both functions are trying
to do is reclaim pages from in-use shadows. None can exist without vCPU-s.
Yet still shadow mode has been getting enabled before vCPU-s are allocated.

>> ---
>> While in shadow_blow_tables() the option exists to simply remove the
>> assertion without adding a new conditional (the two loops simply will
>> do nothing), the same isn't true for _shadow_prealloc(): There we
>> would then trigger the ASSERT_UNREACHABLE() near the end of the
>> function.
> 
> IMO, blow_tables() has no business caring about vcpus.  It should be
> idempotent, and ideally wants to be left in a state where it doesn't
> need modifying when the aformentioned create changes happen.

First: Both the change as done by the patch as well as the alternative
pointed out fulfill this requirement, afaict at least. Hence what you
say doesn't make clear whether you agree with the change as done or
whether you'd prefer the alternative (and if so, why).

Then the two functions do about the same thing, just with prealloc
having an early exit condition (once having reached the intended
count of available pages). Therefore ...

> For prealloc(), I'd argue that it shouldn't care, but as this is a
> bugfix to an XSA, leaving it in this form for now is the safer course of
> action.  Whomever cleans up the create path can do the work to ensure
> that all prealloc() paths are safe before vcpus are allocated.

... I think the two functions want to remain as closely in sync as
possible (I'm afraid I didn't fully have this in mind when writing
the remark - it should have been worded a little differently); really
I think it would be best if the duplicate code was folded. Hence to
me leaving alone that function (which is what I understand you
suggest) is not a good option, yet as explained in the post-commit-
message remark not replacing the assertion by an if() would have an
unwanted consequence.

Jan

