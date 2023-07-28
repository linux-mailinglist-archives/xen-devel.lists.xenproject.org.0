Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFAD7664AD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 09:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571344.894955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPHTv-0000Xb-53; Fri, 28 Jul 2023 07:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571344.894955; Fri, 28 Jul 2023 07:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPHTv-0000UT-1e; Fri, 28 Jul 2023 07:01:47 +0000
Received: by outflank-mailman (input) for mailman id 571344;
 Fri, 28 Jul 2023 07:01:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wghk=DO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qPHTu-0000UN-3o
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 07:01:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c4ee010-2d14-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 09:01:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9635.eurprd04.prod.outlook.com (2603:10a6:10:31f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 07:01:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 07:01:12 +0000
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
X-Inumbo-ID: 9c4ee010-2d14-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGBAOlWOaaFecAJ5hkAuizRWWzcglMNCisf1LjFe1m7huTVtPNKY9rjFpTCgTxr3mONqUiQWGThZWNRVRwruyOaDnAFQbdzrbz1TMYPn0DNWm/GNfs+2/LNuKPSJzkt6Ybpd/6cHIQu+27fno+7uoCTyB94jsqBEWBMYCHjorH4DF9rjm0ta0IYg7zXYeeE739oLY9l5oGFyIUsQ2SQVavhhRigbBiXUXM9zFU7qfLYx8xHul33yBieTyi8rEgtab8uk5XBs5rFwR9UFFF6mSnDERq0NVjcmk4z51RzLXQsVpCocIqsWo47jNy2jaCq5D/QVjv84LD3dVlK0wNMdmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdZMmWLouFU5D07ZWjcSbQFjaJbJQ5zaxOljeopqhG4=;
 b=lPmrJH5AZ16uz1beSeI1XTT3rT0RanQbTBYBXJFPgU/2l+q7hCGUCd+Vx7maIUP8oCHdMNvWqbypm8Qzhr+HbGlUn/fbU6Rdax+3tsZGb0Zawj2kJ13c5WBUNv5KOV0r2fTZdsg+5kNgE9ReStO45KSlSKvap0Ul2iZMUDWLiH7SeacyAqb43CLYAl2oGSrgh8RCMO9Lou6SDYk42O3/vgAJ1BeTkYQH8Nlv2Y6oXYM1+fLbcPjsqKLF8Znjx56X2sFos0OkULsUcSj1eSL1FZIzMCDgUHlZZTAW8VEp7qUspEKpZcYgsmj0f8POpU92OkKBNtjBox2QIvOHoQlR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdZMmWLouFU5D07ZWjcSbQFjaJbJQ5zaxOljeopqhG4=;
 b=KU1mCa9l6R7JhfO+wO8aHoPv48+r/ibiOBOytGwDGSQp5ZjY93RwyB0w2M8jd8mHnp9RhEPYgXqF4JgZteCsq6rP0WeP+KVXR5DbLthIhcVBVR68o+NOwstx4LXmsPEWpSzV0ROUbfy9pLkOXhdtd8jx/hC37j52sndOfGhTCw59ZBeknxPyOG7lmY9f5ItgQZxPUrQ1tV/mPBaR1Q7lHUDBXrtmGRt+QU/Wyg+4/OdTOg6+n65Y/aDzNfg7y1GBzci6N9URbRyu93d/CKEAd4B8p9iY/DM+lvHjzLXHwacCS9NJpI/PWdL8zIASExBIstwtZlIraeJS+VwrwwT6Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be1bbc0f-3cfc-61d0-ec81-bff00e288377@suse.com>
Date: Fri, 28 Jul 2023 09:01:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 George Dunlap <george.dunlap@cloud.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com>
 <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
 <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
 <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com>
 <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com>
 <2994c9b8-c803-1fd9-20df-0d25d2b66c49@apertussolutions.com>
 <ca85fd2e-45a5-32c3-cb4b-1042be6c6915@suse.com>
 <32a22c57-1333-47b0-c61d-abff8d7df112@apertussolutions.com>
 <7ab3c4ae-3903-29de-ba32-d328b426d104@suse.com>
 <19bb355f-576c-b8d7-b6da-fa2dd8ff2228@apertussolutions.com>
 <63979074-42c3-83dd-cf0a-8f0cd0294a5d@suse.com>
 <CA+zSX=ZFjWWnzx8vt3afywaiJiju1N5hNJqKzVkg956T-t-kwg@mail.gmail.com>
 <alpine.DEB.2.22.394.2307271133180.3118466@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307271133180.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: cceb61d7-194d-4afb-47f7-08db8f386db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8+CiTkFw9BAqhRkOwPgzOr2/jap75DGNnBDttgZuy6eTopRPWBQyHoakltCmUG5K5tgtOatfbxBlGTEFPI4BV1WFQxIcdwqO0OAVscUUFCjRJvXmCEbnt9UJ97px9r1DrDvj9BnY9EDnTp4XNVfbRQXCU2HLIUAk7e3nJc5VmcpLUWTkLaG4ZZWulof6Jz7LGADumm+KqlXoigzKo+ukJpRqkPgNgkZJCMTSAi30kcHpQGjtAfrGIlIMODHyWe+0WP5Bnp+pTPZgGCqoOtFp018Z5qw6J4kM6COd/kHgJC5N3+neZRlHrANTAJzqJiITxbUIvUKNLuG2OLhTuwBOCbkDD0/dL5O38AXmmWMmCPfEIqL6LDMVJrmuOZN7pCOqQ66I/y4/OLQPo9QBNEFITGi1tD8zYpbE0RsrzPEOUDGM1hOK2+9xrAtUJ75zKWJPixVQFntyr6V3SJvNkBxyaFKI135jgHd9gcBSxqkvflgqg9pWTFEGnGsCEmmziSQprCm5P/lBSAn0G7Ou5IV7zgTEm382KYxWYyxX7VAmWbLTcpXJzmKAmc10LYCz8XuNFgnLSwDZdfnR2yxztiXZtXfn4GYZIhQyn0VCD5CB12y9JA68R/GDQ+aJ7GigCr6OPPPqlHdcR/xXKncP3dodxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(6486002)(7416002)(36756003)(2906002)(478600001)(66946007)(6666004)(66476007)(6916009)(66556008)(4326008)(54906003)(38100700002)(316002)(8676002)(186003)(86362001)(53546011)(6506007)(5660300002)(8936002)(31686004)(2616005)(26005)(41300700001)(6512007)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkQxR3pEWW1YaHNvN280L2w5NGh1bzRFZU1yVGJkZ2V4MlBwRi91N3lEZ3Iv?=
 =?utf-8?B?aGlwKzJFZHV1VjhNZ3IxTzVUTXNoSnJydlhEVURXeDFORHEzVExqSGVQUmlK?=
 =?utf-8?B?RnJQbzhUa3h3V2hhM2plTFlPWm9uVCtnWXBxS0RqOXQ0S1BJZ08zdVBVQSs3?=
 =?utf-8?B?ZjduVzJTUUM4WjdwdjVKRFMvelFWeDliZVZZeFVaOUdkM2laZTJMdVRNYm5O?=
 =?utf-8?B?b1EyN01OTXZOSVhaY3A2WkM0R3J5RlpPTWhEVWdVd0YwVEJ6NzY1QmVjSjhv?=
 =?utf-8?B?RE9IQ2orTk92UWJPK0lIdnljSVZZMjdWTjIwMVBDaHNMT0ppbHl0UzBUVGNx?=
 =?utf-8?B?K3VxY3FldnlBZXRUcjlGLzMzREZoMlBYbWxBQTBMMmd5R1Y5eENjMWQ3MXlM?=
 =?utf-8?B?Q2s1Q1UrNUIzOEF4YWNlM01zR2RsQ2N1b3ZwTTJZWkR4V3hiazBJVUh0R0NX?=
 =?utf-8?B?cXZuRHoyalFYYnY5VVdjZ0hwNTF2OXUwS01pWnJzam9BNVdMR014Y3BhZEtW?=
 =?utf-8?B?UFZWMlh4Qlk0b3FLb0VPTEZtUGR5OVErT3lGSXhkcHlCV0Z5VFpZeFZEc1c4?=
 =?utf-8?B?Q0VtQWduZXBZbVJzR1FxRGxZQWpRZWdmVWZGNWJvMlh4SzdxUVVKVmU1Z0Zs?=
 =?utf-8?B?b1dobVpRSDZvR1ZEQTNGUEhrazNwRkRxM3p0ZEZwOXMrdlVxUnZReTA0Qi95?=
 =?utf-8?B?SHZHTUJtdWhXUWQ5RlorTHZmNHVkNVJPUkM4cGdVeVRycXpldmRnenpwR2Qw?=
 =?utf-8?B?M29IMnU5K3kreUZYcWpjNWVwVHZNSk9IMDBFUzQzbkJCNTV4OWQyL2xqTXp0?=
 =?utf-8?B?RjZ5bUdSZVAvcUlxUzBlNFpkYjRwdTl5NWcxdE9QNUJXZkl4ZC9xZzAxNWph?=
 =?utf-8?B?bWMvenhCMW5tR1ExQ2hTanJRUEVFNzhFd3ZMSjlRT2htVzhZT0ZKN2RCRXlu?=
 =?utf-8?B?VVMyM1ZNUm96VlV5bTEwNnM2YUowY1U4dHhBV2xOajFnYmRHb0owOTgyNGNG?=
 =?utf-8?B?U28vSEpJUEZScTNsMDluRUtWckJ0MkJUdVhCazhoZ0dPQ2RCbXhLZFhxbFlw?=
 =?utf-8?B?WVNSRjBPL0hEWGNIRXZxV1JwS3JWN2ZTUyt1c2kvVjVTSGdET2VjQW5ON2ky?=
 =?utf-8?B?dWJENW9jRWYwTkZDUFVkQ0pqcDcvNWFiTitvTlAxalRIM1piWEQ3NFBteVJk?=
 =?utf-8?B?VVdIaFVBL1VzV3BqbDN3bENYT1licWpLSzBZVE1JdWtJZWlUUU9GaDJsZDBP?=
 =?utf-8?B?Q3JmdXNGWXk1QkdnRFpnaVRIVmpxdFhtRG1vVlFnSy9sVUFnTk05eXNBQW1M?=
 =?utf-8?B?bGcxWHFiZzRZcDQwT2hIWGFEMFJWdHBteThGOXpqSWlrOGZKUmRLMnRJZGdW?=
 =?utf-8?B?QWplclZOMU5DMHhrekQvQkU1TWRhcXNwaU9JdWFjOTBCQUdKZWJGTXdWY1BB?=
 =?utf-8?B?Y2w0MUtiTW50TU81dFJFbjhEamVJSm02WVdPbFBESEJJaDErQXU1RGNSU2t2?=
 =?utf-8?B?QnQ3RHpIbmdoRWJQdXF4dXQwV1YyVitMcW8xTHdQZFJDYldEZlVRbzZsN05J?=
 =?utf-8?B?cEJVL1FyZStDMmZ6dEpLSFZweVRFTEtDV3EvTVdPMzE3VzVsMTZPMmhpTVc1?=
 =?utf-8?B?WHdqKzNQS1pyTytOREJ1ZjA5bnllS2VlYVpYK3g5YjVkTDcwMlJQY2hVZCsy?=
 =?utf-8?B?cjJqUnppRUY3UFFJeWJkcWtzSFFMMjRxTTZkRXVqWFFyYkdVT3U3bHdCd0wy?=
 =?utf-8?B?QTdoWkd4eG95c0VEZ0dodU1oVC9WU1dXTWZZeElxakszdnVOT01zblE1WXlY?=
 =?utf-8?B?WVFaekZnZFVWNkljd25LcTF0V1FzZ3NCNmx6alY1cUZTT0YwdkJyM0pjVmlY?=
 =?utf-8?B?eVZXSnlHWG1xRVdhSVRJZ25MeDVDWit4NDl2citoUEZIZktaSzdSek55aklj?=
 =?utf-8?B?dEN4bkhpNmNOTnY3WXJGZ3FoUnViY0Ewb1ZxM3BhR0tOQXVHeTJyTmt1MWNV?=
 =?utf-8?B?QkJVRVJzZmY3b01hZVZFT3NaUHMxTmF4YjZudEhNcU1XcXhFODUrMXlJcGtz?=
 =?utf-8?B?cys4ajhaSkI1ZHk4YnBxS1JvekMrcFN2UFpCZzdSV1FZVGlvYlJpK1J1QzR2?=
 =?utf-8?Q?MXcPgsZipkKkB7BSIDJuF0Kez?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cceb61d7-194d-4afb-47f7-08db8f386db2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 07:01:12.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9g5swOgRO3yFSPfnwHF/F9kf24wxKjybgm1I9Y7BX737I5L0foHXx/zSldMLbmpv35KAGydiaoe7HWXdHgeraA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9635

On 27.07.2023 20:36, Stefano Stabellini wrote:
> On Thu, 27 Jul 2023, George Dunlap wrote:
>> On Thu, Jul 27, 2023 at 3:42 PM Jan Beulich <jbeulich@suse.com> wrote:
>>       On 27.07.2023 15:26, Daniel P. Smith wrote:
>>       > Let's bring this back to the actual implementation instead of the
>>       > theoretical. Your position is that Xen's paddr_t is desired because it
>>       > can store larger values than that of size_t. Now if you look in Xen
>>       > proper (main 64bit code on x86), paddr_t is a typedef for a 64bit
>>       > unsigned integer. And if you look at size_t, it is also a typedef to a
>>       > 64bit unsigned integer, they are literally a couple of lines apart in
>>       > types.h. Thus they are the same size and can only represent the same
>>       > maximum size.
>>
>>       What about 32-bit Arm, or any other 32-bit architecture that we might
>>       see Xen ported to, with wider than 32-bit physical address space?
>>
>>
>> To be more concrete here:
>>
>> Suppose that you had a machine with 32-bit virtual address spaces (i.e., going up to 4GiB), and 36-bit physical address spaces (i.e., going
>> up to 64GiB).  And suppose you had a system with 16GiB of physical ram.  And you wanted to use Hyperlaunch to create VMs using some sort of
>> memory image that was 5GiB (presumably of some kind of static data, not, say, a kernel or initramfs).  You wouldn't be able to do it if the
>> "size" parameter of the boot modules was limited to 4GiB (without some kind of hack where you string multiple boot modules together).
> 
> Yes exactly.
> 
> I would like this code to be common across ARM and x86. On arm32 size_t
> wouldn't work, with size_t as it is defined today. One option is to use
> paddr_t on all arches, or at least on arm32. Another option is to change
> the definition of size_t on arm32.

How can changing size_t be an option? This is determined by the psABI,
and going out of sync with what the compiler assumes size_t is will
bring you all sorts of trouble.

Jan

