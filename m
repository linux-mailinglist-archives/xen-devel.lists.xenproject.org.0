Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B07690DF6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 17:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492757.762449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9T9-0006wF-7u; Thu, 09 Feb 2023 16:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492757.762449; Thu, 09 Feb 2023 16:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9T9-0006u1-4k; Thu, 09 Feb 2023 16:08:19 +0000
Received: by outflank-mailman (input) for mailman id 492757;
 Thu, 09 Feb 2023 16:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ9T7-0006tv-NB
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 16:08:17 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe16::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5d983b6-a893-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 17:08:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9470.eurprd04.prod.outlook.com (2603:10a6:102:2b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 16:08:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 16:08:13 +0000
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
X-Inumbo-ID: f5d983b6-a893-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZ7iO6umQarhhhPleMCifPLodKr2A+So/lt46PzTn5Hr2sgMyitfxEM68N0ui1fTJHrsdjRAUV0uvEPOKnxSwqATCp1ZlomwXEnuLsW+neGzHusSrsFJ/Lht2IcZoDVTCGen8OFveyj4TR8fiFPwCZDMMm6TMEmtsqC8S61YygDWBLzEA5X+oG4iZl8Kt8WKsdpAbYzacoIpMvcVa1TONmU+xVrT2vhUbZbG0I110UOMznJ84rEV+6G21rG0M5Z3MS3/KlFscbyXbIVauGTZEuQC/IIKJ6kQn4GeSrCFxTJFvsxsv8iz/x2tnWlmu/yThOt5q0DuIfJlWhandLOPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79wRkhAenkox8Qp/Szgxrxgo1rm9npoc8+2/CpWSrRU=;
 b=eHNX6LZYdapjOYoIQ0wxr767IWFu4s2t1nmp14ZRbPVr7QeWbDKoOBhb2uAlFEgh+na3/DZ0eDvuh1DPgJIzz3I5ZQVnsnMc4HlHZVMUFHyAJEEOZnzqxMxFExmqcVPRai3n9dpVH2MM9CKNB7lRHQip2xLOE49l7L/DjQJdINCLGtR2OR+FcAJ4BnmwItqK+mq2i5CnVFCjP+Tnb7JkmQQ5UhveRbnIch0PMXgJ4u5Hq7SV/3mqiUTy7cLhqTJC413sglIZ8671xtkdKezxzvSsH9PYNsa8SuOAJVgzVDdpcu90H//B2stFcVL+8U1+Oagdas5dQgEW8sp4uA4lAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79wRkhAenkox8Qp/Szgxrxgo1rm9npoc8+2/CpWSrRU=;
 b=K3bRE+w6gn4ROoWVyWhBi8WqKfxDxNfGyAmkyCTNV7vwh1eAIrloisiIKSFh3iD4lxLB9lLmW7XynhuPfa3FOoma0iiQPs4inIWrjCxq0w6oc77VkEKUOwd+rC1oNjCpb4wcZwGNXx1Gd+pSQPFPfmh1Bf1NZWW/P+5Ru2BZrepycJ3z40MVYMgtj8vuZBy4LeKtRA+Kt1DZnctDOg2OZTA/hKJUIAagf+UToNORVX8AunqfifUDvRSK06pb20Qbn7CqmLaUXG5JpLhk9nR/FJJATnL1PBdeNeZw4CGOvqHtv1mm3MBvUHSIPKztZE590yaKEjjqnUT9MWEw/Cc3+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <383dfffe-ed1b-7539-d601-c9e7caee22ee@suse.com>
Date: Thu, 9 Feb 2023 17:08:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Proposal for consistent Kconfig usage by the hypervisor build
 system
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <d77c1a7a-9d15-491d-38fa-99739f20bebd@suse.com>
 <906028ef-b9cd-93bd-8ee2-f263851496f5@citrix.com>
 <b899223d-6e13-af64-2359-76d0c30ec46e@suse.com>
 <CA+zSX=Z+y5CkSR-xBpgeLx_gouuGbbNd3c2z12OKeSODsKimDA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=Z+y5CkSR-xBpgeLx_gouuGbbNd3c2z12OKeSODsKimDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a06015-dd70-4e37-2da1-08db0ab7d8a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g0bTCcnHd+WKfcCIE3RZAgZ5RWkG92gyBv0QqwEPMNHI+CpeUG8wnVQ5/qbImuCpHMSmEC24mNt5NOiue/CoH9w6+l3VJC9zAaP4VbPDVTfxtpG4wF3FPzMBloYRVlfI+LwLgmdZij3d49yYhbrad2Ulgo+OAXtQDorVajVIv38vg3CWJwno4v0u23Yah+jhtKTIB6boYOCK7jWvN1xz8/Qx6zZonoayxSCUs9YmWcqTb1U5x8hf+gJQjGE6zA/Byge+fJTktQmWPvMmdQYMnu69AIFe0PQwtUwh82saMT3qfMM3aDzJ8gAtuBOqNvtcW+4SGebv6XVn0JVtQgPPx8QDYwKXMmJ5haeeoe3oyQojMzJ0bTzW0Xv0Nq6H1t8iSopa7tR8D8EI0RM4Wr8+8LfiJqpENM3g+9EbqsWfty3CQQr8RHgNYY+JBmjd7OUEMFMAd5zDO+oAtGZdRS6d0B9ejdNKJPnG6iFNKLMrpufbPgQsX0HeMxWZtv93z3Iz3WqRGwBH8x1LNvpwZYJE2KqaWyjn1R/pCIeio4HCALaAUfP0x0OdNnRrLKnPZztox5MZU8FP3ogSfbOuNpavo2qAxrMqW1/ubFxMnp7SVv0renb4ErfCELa/POK9IyDEmER3eZVx4kj+r4jNqDLfONhputrPqfQG0j11k5J7L8DRugPTs9jZkffh6nc8UPaQRkzAD8PVghLQYdG2KeFWdsAsvlGtmDanHeAULsFdbVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199018)(2616005)(2906002)(41300700001)(36756003)(66476007)(66556008)(66946007)(6916009)(4326008)(8676002)(478600001)(53546011)(6506007)(38100700002)(6512007)(186003)(26005)(54906003)(86362001)(6486002)(31696002)(66899018)(31686004)(316002)(4744005)(83380400001)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXZlaUh6VENzWTMzeDNWMlVVZG9ROEllZXhNdmZ5OERUMnZKdW5mc1ZVUitu?=
 =?utf-8?B?S2t1Q2lGb1FzNHd3cXZ2c1NCYnA3U0ZJZm5YNGduM0Y0cTVLcFBwQUNJQ2FL?=
 =?utf-8?B?RStQdDh5OHRlMlNBN0hRU2ZrOUJCemI0N2lyNFFVRW5PaHFuazFOc1hJWmZY?=
 =?utf-8?B?VTlWNFdMZlVxTXhTRVJXZjJEbkNnTmcrZlN4WmIvZ2p0dFNZMnoyejlOZzFW?=
 =?utf-8?B?Y25zU0JCa01reVloTTRvcDd1OHFOclpVR1liSjN4QmlzRW1RY0tkRmlRQXJm?=
 =?utf-8?B?WHl3alNadG11aDJaMVdxRllQeUM3akJMZlpQOEk5ZG15VG5yU1Z2aGt0Um11?=
 =?utf-8?B?MDM3azdzYUt6OTVyL2ZUa0M5RmlFUUlPcklpenVJdVhRQWIvOUhLUGtOd2R0?=
 =?utf-8?B?MW1KTkcrK1Q2emdHdzFndWpYcGh2blJKdWwxYk1xNFNKY3lmYUFyN0VMMXla?=
 =?utf-8?B?dlhxYVh4KzRrclI3cjFtbGVjYXh6Mkk2b2M4SFNwbWU1dDhmN3JuUXl3TTU2?=
 =?utf-8?B?NGQ3RllJMWp6Z1QzNXlycFhVallYNW1KMkRsaGp3a0oxbS9kdlV0NXBjMlV5?=
 =?utf-8?B?RDBSeUE3VFMreVpxaWltZ3RqbVNwOG8wR3lRS1hPRDM2SGp0OFhKMklod0M5?=
 =?utf-8?B?ZXFaMm9VdTF4RFV0TllabXlJRStGUzQ1OWRmNDJYT2poWmJYRTJWK2hlcUda?=
 =?utf-8?B?VVIzcEdGTXU3b3hUOGFZeUxkaDkrbWFIazdvR0kzSW52Ym13MmRiZTNXYlE0?=
 =?utf-8?B?MkQ0YVNUQ2NZOE9MZXMwMTlkdTlMYWphSUVuU0xvcVNrR0EyQVBONkJ5ZFNv?=
 =?utf-8?B?RzJjNytxc21yYWZmOEhsZUNzbk1nOHVWUGJUbWlmR0pSUitUWDNVSFBSZTFK?=
 =?utf-8?B?NzJlOUxXT2JoaEdOazZMVG1VaThLa01ka2FOSkFhMFY2MWVNQWFCM0JZM0ZU?=
 =?utf-8?B?K2xZL0tBSHdrUGxiSUNYTExrcTYwdFEzV2ppZnVxdWRtemlOQjZkTGt4eXJ0?=
 =?utf-8?B?anpxVWhXMlhad3VPY3FaRlVkTnFQZ0paV2o4U1c3dGl6dXdaakUzSFkrZXZm?=
 =?utf-8?B?NzB0cjNvaVhEQkRQL3pSaGtVTWQydUlMN0ZTS0ZYVENwTWZLZmR2VGdYYUdR?=
 =?utf-8?B?Ni9kcUt2ZnlNamJ3L0NCTVVWcGxBeEF4ajRZU0xYeVFOU00vUzdjMm01Vkht?=
 =?utf-8?B?Wmh0aGJlOEN0cGxTZUNqSzh3NW9pMmxUMFBzWEVQOWN5U3lhRk1FMDB5RzY2?=
 =?utf-8?B?OWRXdjZDTjVmUXk0dEZKcGl4U3JVd1ZrcDd0RytFNjJkL0ZYL3ZLM2hTQVND?=
 =?utf-8?B?bEU2K3VkNUJsN2xYUGd5YUVZOWQyWEdMU2FoczFxaHN4cTRrVVRTK21SQTJT?=
 =?utf-8?B?SEgxSlg4Y2NvWG9NWXFCU2o0VUJDREhJajBUSC9TSllmVzZ6WVNkUDdRUVFZ?=
 =?utf-8?B?K3BZT3RNQXNFbXVmbzcrK045Q3FuRkZPbTZVSDV5OE5ES0JubndiV1BUOEVu?=
 =?utf-8?B?VVhUd2x0VkpjOENFRGtQbytCcnB6NFBtTE1qSGZuUnNpSFBwMk9tZ3dtT2ty?=
 =?utf-8?B?RDh5Wnc2bkNUWStkRmVuZ2gzNkdQZFFId3owVDJwV1pEcXpSd3VScUQrNWRo?=
 =?utf-8?B?aVlQUmt3OVRVanVITmRjSDRycHNVZEQxZmVmN2FoRGFYN0thbklnQmZpM205?=
 =?utf-8?B?WHBVaXlWZ1dOMlRNQ1BZSC9BU3hvSmViTVRKMDV5S29RSHFxbFExNHBhMUJE?=
 =?utf-8?B?TDh2SEpwMGpVbExrSGNPOHFITlV1eDNSbi9UZ3Vqbzd5Q00vbUVTZ2dRNVRa?=
 =?utf-8?B?Z0RhMk5rS3dlZlI3c1V2ZUZlOEZidGd2bVZJb3ltRUQ3NVhTWTdDQi9kSVhM?=
 =?utf-8?B?K3g3b1pWMEljSjFtTUVCUlNDQkZwRlo4eWIxY0NMQWdQMmRhOUlwazZNUGtF?=
 =?utf-8?B?bjNFZmlQQ2l0UUhCSi9haVFKV3BhM29hRlFJMzIwVGxoWUtkUmVYOUFWMnVV?=
 =?utf-8?B?N0tnZGFWMkJYWitnakNQaHF4MnJQR08rMXhwYnQzWWhZeDkzUEJFa1RSa0F4?=
 =?utf-8?B?SG1VQnRaNTAyN2VHSTYyam44OW52TGR3eWs2Z3oyQllEd1BDZVRVKzFUVmEx?=
 =?utf-8?Q?3XV+FH/X87aVp5M652YVH5eBF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a06015-dd70-4e37-2da1-08db0ab7d8a3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 16:08:13.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9oLxIHCyMsYh7vv7OMWVtAnu8wuTaYs1SJB7a66xGoydwUyFKFjn5TbmqLJGEA61Yb3Zqmf55uCBvRCNNWzZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9470

On 09.02.2023 17:02, George Dunlap wrote:
> On Thu, Feb 9, 2023 at 1:43 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 02.02.2023 16:51, Andrew Cooper wrote:
>>> On 12/01/2023 4:52 pm, Jan Beulich wrote:
>>
>> Anyway, I have a prototype for the two CET controls mostly ready now, so
>> I guess we'll continue the discussion there once I've submitted that one.
>>
> 
> One thing that it occured to me will be important: `make randconfig` must
> continue to work somehow.

Hmm, good point. For now I've merely added a TBD to the patch I've already
sent. Right now I can't see how that might be possible without the user
specifying which options cannot be turned on due to tool chain dependencies
(by way of a seeding .config, I suppose).

>  I'm not sure how Anthony's patch to deal with `checkpolicy` deals with that.

Given his remark on the community call I did actually try to locate it,
assuming that it had at least "policy" in the title. But I couldn't find
anything in my mailbox.

Jan

