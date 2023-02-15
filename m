Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60314697953
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 10:56:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495816.766240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSEVS-0007Hw-Vj; Wed, 15 Feb 2023 09:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495816.766240; Wed, 15 Feb 2023 09:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSEVS-0007H8-Su; Wed, 15 Feb 2023 09:55:18 +0000
Received: by outflank-mailman (input) for mailman id 495816;
 Wed, 15 Feb 2023 09:55:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSEVR-0007Gs-1C
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 09:55:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8ae91dd-ad16-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 10:55:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7518.eurprd04.prod.outlook.com (2603:10a6:102:e4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 09:55:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 09:55:13 +0000
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
X-Inumbo-ID: d8ae91dd-ad16-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtXJ2mPCRzWj6bWU8xcsLrg1valq+mUr/uZCO47D6jSFXSVjOK06YD0mQv/Jo5egx+UtSJlbSKVg2fraV2l0f2oxGdVqWJuSiyRIUk38lqAmsuCLEtd84OCJnbaB8bDv+cLmGyLj1E/BllpPwWKS02L6lkoSDcd+1a5VfiiJM6X0igi4lemx96zaGDMuyEcWJsjkFyDJ94VQOUZ9S9do4IvDyuLAwump9YEDB+50nwFYlbEfhQqyx/pqcjTsMESOE0BmtKOh/Wh08hQ5LwcZ80HJieHj9ylC0r6wjgx+ICS44HC9nmFP6c193bz6tW6jAicr9Sd7V1u16xaTXuOjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91Bht+PFAiL3+dnjnzHNZY9YouHjXxh9o1B48Sjr7tE=;
 b=Dw+baUHFfw0lzbNOb8qTwvXJURkQspxICj2KxmqdORq9oiwZF6PRN9RA0z3nXmJudwYKgeufLffemlCbgcYiOheqmfGLB21R5ABpbTDSewu5XFkVziLIdK6JBv5XBEDNs4Wmr+zW5t5Zx7jGWg6pQC+DEUIhqoul6mgbdYT6fH2cZ4xrBbROOPv9knCPDg22+FDng5Rpq2gOcSGVydestwUw0Xd4Rb9wobpbM+E7H9JH2jsD3KSLo7NEq1xuulVseYkv0emt9RLZY/Adq01Pl98QdF/IThhn621mhsaF/unq/J3vHG2VLfRjoIMbOnH4jokTsGmz60DVXEgLoLt94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91Bht+PFAiL3+dnjnzHNZY9YouHjXxh9o1B48Sjr7tE=;
 b=lpOc6HbiI5bIuy3Etq5eXXAG4//5as06QsSXsZkCl8lHc1OigFxYDo0SPCFX6kPGfec8dUJp47yEhTrRJW9YhoJ0VFqkkxZDMcp78Ly5u+8OPI7yA1tAPAQNlQIhpQTnbdwsuv3sCi6R7ggoyPO0/JXBd/EJVv0UkBcgiRTRUPdKEZiQy/jvwRmycKK8sWhxC+KOyo7PBe0NptmIHBeN5xR9F6dLtAirfsLek9+aUgt7wFlSEg+RmgK41k2LjopmEADt63+XO7xPDiRMGMhX8m8pMf5mzLDZ5jAFBE8PqEzvhMi3L9oJjOek7SW/Lp0dDaeQKt1Eo3Q6JmKjbietvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <220e39a2-9fc8-251e-9b9a-997469ab201b@suse.com>
Date: Wed, 15 Feb 2023 10:55:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2] build: Make FILE symbol paths consistent
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230213165539.3257260-1-ross.lagerwall@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230213165539.3257260-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 5846f36e-b90c-42aa-ac35-08db0f3abba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	usC1E6rDLcWzpfNsjW3vptHQUpVoNWWhGvANW985CPn2CPKYDQKgfJAYJgKHasCS+HpBHtIDXUK/iZ4FYww9CbRAY79nmxgxsyp4DYRw4zNi+wULA0p3Gv3C6Wokq4Q+SEp3lsDf58RFH+JQk0Ikl3huXpyJJxLsLUfIRwSgSDYfO2dU/ur3TK3M2kUA4tQXObkqWTFzA6+yLFyFrcDmwll9tGWJlIl1bHYT0SB3AvGDipVDnmOPVQCfCUBQDpq+XL9AwuIBpgysHrthcXQry7aAXlepUfHrhU1XK3zMTt3OLhHMjkdlftQvcGTfOiyPJzK9Y9SnrinReFRQnmt/g0aoWVVCTJ/CQHXg4y8/+L5LlL0CPcADOAnsFPTXcB0Qf42gK2KeXN+M+M/r4DboBNX+FRCu8VBbhg4vDt+zW0NtrB6m3gj74UVjBU0TiMi7BPWr8fgIevf/s4r/IbyB7Dlu1hdo8hH5eqcONC2yijx1m+vzVUqcar17eW2ILylVHTe17sI/4oc0WOx+jvIDCp9qyUVGJ0iN6bBQVfp4vyV8rGk7bLaYb6F59c2eh6KJ/LkHf8hoOh6nQNLheFmLARsVQIMfSy6uSNNKW71jaYsQSKDqm1HAQEF7wRwqaEAEjMCh5Kq9ysiMoO0u1saD4Wa/q/lMcXhTU+btFKwQyMPbYdvriPixb3nKalea3NqyGS8xwM0sbzp6Bkb202dGvmBhu/TmO4QAz0oTQ6sy5sw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199018)(478600001)(66946007)(38100700002)(66476007)(5660300002)(4326008)(2616005)(6486002)(36756003)(41300700001)(6916009)(66556008)(8936002)(8676002)(2906002)(54906003)(31696002)(316002)(26005)(186003)(31686004)(86362001)(6512007)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE9PVXJzenJIUFdtSzUzQUFZVUJsOGFxN3BGMDVBWjVDQmw2Y3V1Vm9ZMktX?=
 =?utf-8?B?VDdPdjBCUE5mZGhHeTdBN2l0RHV3eEdUL3pmdmdsY1JsTG1EYk1Xc0lvTHph?=
 =?utf-8?B?UzFVUUFseWttU1grM1ZzNjdhOFYvcjhxTndUaDU1Mmp2UEdBbU1NaHJHNFhp?=
 =?utf-8?B?QmxOZ3Z5SHlzUUxDeGtBcFltQmVUa2VKSkp0RFdGRWw1SzlmR3FhdSsxVlJG?=
 =?utf-8?B?eUhMb3lvQy9hRlB4dVBkTEJpVFB3RzZWdnR2b09IdVVkdW5MOHlkRitiaUVm?=
 =?utf-8?B?VUJSUlRReVZxZWFwVW5OY1dQdnF2Ymt5dlY4elB0RTQxWnBlajNvYkZtZUV5?=
 =?utf-8?B?VWpLQTFmYXpPdXY5Z0ZGY29iWHpYemFCVXRoUjNNUVdQTDhONmNzQUZWVzRr?=
 =?utf-8?B?OXo5aTVKYXhlTUlyY1ZwcEo3L3B2OXVKc2taOTN3SkljUFlHcEM4Y2JJanM4?=
 =?utf-8?B?U3FPcXNOcGtFejNqbERuRENncW1zMkF1L3pKdmoxTDE1U0draXVKays4aGdZ?=
 =?utf-8?B?anhWbjNVTEtTK20yelYwYjJCVnZRQ0pzYXVMRlM3Yk0zL3FhMGpOektkRlBI?=
 =?utf-8?B?NTJHd3hBYnUzdkhycTVldGhNemRCWFlvUVZvU0xmc0Z5d2h6U0VYZEVzR2hH?=
 =?utf-8?B?TUdCTm9VNWpxNkpkUDhtNU5QdG50QlBseXBqNWtMRUlPa1dkaFJ0cnp3WUZl?=
 =?utf-8?B?bHVJa0R6TUV5QnJRZGJKQ0owbVdPUUg3US9peFN4Smh1Q0g3VU1xZlFKYml1?=
 =?utf-8?B?ZW9xV2d5U01Tdk1xUUFjdkVZbXZ5YVVuMEZFckFkMVZsaDQxQ0o3bERPTmdI?=
 =?utf-8?B?VFdOSFQ0RkhyTEdyY1Z5d3I4TWJzallZU2x4WFN6azl0TXpPUnArOXNZYXd5?=
 =?utf-8?B?NDdZQ0MrZkpJZCtZQ21HNnVKSHhTYlRQdURSMGZmbGtGNUFkNjd6K2dzTUtk?=
 =?utf-8?B?YS9ndmlEWU1VNHJoZU9leFNzS2w5YUw3NXNmS1dtSVdaSkg5UFVrOHY3T3gy?=
 =?utf-8?B?SUllZENHZzZxcXJrK1k1T1RydHZNMTJzQi9Sd1ZSQjJaZlpwSmZUcXdjNTFj?=
 =?utf-8?B?UnhPVG1vRHFxenhiSFVOanExNUV4dmdsMWZyMWp6Q29oQ0NaWTNCZ1NPS0Y1?=
 =?utf-8?B?ZWp0bkZoQVNyOUNoVXZvQUorYTdFaXo5OWNHWFczbDlFYTVocFo0ZHBJbVJu?=
 =?utf-8?B?Z0NkYTlsWXl0V041Q3ZPQlo4RTNzcVF0WkVxQ1dKL0ZDNDdXUkx5OUFjTERt?=
 =?utf-8?B?clFSS0VCNjBLWFpOa044TDBTVUwxRHNCYnhIcWVNWGJmaC9BczdtbW1kKzZ1?=
 =?utf-8?B?TWIrT1pNZG5GYjhSYWhmcnhTaXVPd3JCYTFmSEtYOE1rY0N6Q0hrbUxkQzlD?=
 =?utf-8?B?dGNZT0xpbVBsZjVSMFB0N0NpL3B3T2tEajNVRHpoa2dPbms4OUpNaU85YWxV?=
 =?utf-8?B?a1YvWGh4aHZYdVpUMktKamRiWWg1ejdqN1I0NnJ4b1R5NUlBWlh4VnR4ZEZw?=
 =?utf-8?B?NlZvaTZ2eE1ya2tZZzAwQjRsTi9pNDVjdkhYYkhPMXlUanpCV1p6WWJZK2Zq?=
 =?utf-8?B?SWU3NTM2M1RqcDQvaS9tMzNaUmxwOFR2K1dCd3ZmdGh2a2Qxb0xoOUpzNEJW?=
 =?utf-8?B?NjYxK0h4SDFqa2htYis0OVREQjAraXFtOEpzQ1VKTElBYm8xMmdibXFSU3NM?=
 =?utf-8?B?RmlqVlRWZnA5bzY5RyttYWN5ME04SHJuZWkvcTVkMHdHYjZ6NkZLbGJsNTZv?=
 =?utf-8?B?Wi90bFlJTTlyN3U4R3pZMUl6a3RZb09LOU4vWDNqZ2Q1QUZoYm9CL3A2eUQ0?=
 =?utf-8?B?d0NlQWV1NVBYb3NtSjJ5VEhWUEQwbWcvR0VQTitSQkM0dmJyYmRQZmh6WWpW?=
 =?utf-8?B?dzdwZnZCdDRmQjExR245cG55Ums0TzZrV2xoYStVcVhmM0tDRUxiK1RDendz?=
 =?utf-8?B?cXdtN0xha3ZpWTZtWWNEVi9VODI5MmRuQ1N2Uno4dUMyREozYzZnYzFKVmF6?=
 =?utf-8?B?RXk5L2lBU0xUN1ltbE9JZk5xOS9JMjQ2aThNVjZvOTZ1ejJ6NER3OXEyM1lQ?=
 =?utf-8?B?blBpK1UwcldCaStNOXRYcUFaQlQ5K2VHS0UwMmJBTDd1RHRPbVFrRExyN2x5?=
 =?utf-8?Q?8EF3cmcxcIP9hxnNLfwBaCjqV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5846f36e-b90c-42aa-ac35-08db0f3abba5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 09:55:13.5648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2EdsgqVTbuvyo9aHAwKOv1av6FCyzmqDWDIQXERKs1mae4fvW55mqWecYJKRdJCxosGjm6lQM8zadUd21JdTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7518

On 13.02.2023 17:55, Ross Lagerwall wrote:
> The FILE symbols in out-of-tree builds may be either a relative path to
> the object dir or an absolute path depending on how the build is
> invoked. Fix the paths for C files so that they are consistent with
> in-tree builds - the path is relative to the "xen" directory (e.g.
> common/irq.c).
> 
> This fixes livepatch builds when the original Xen build was out-of-tree
> since livepatch-build always does in-tree builds. Note that this doesn't
> fix the behaviour for Clang < 6 which always embeds full paths.

Is "fix" here actually correct? I.e. is there anything to fix in that
case? It looks to me as if "always absolute paths" is as good as
"always relative paths". In which case s/fix/alter/?

> Fixes: 7115fa562fe7 ("build: adding out-of-tree support to the xen build")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

With the above clarified (a possible adjustment could be done while
committing):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

