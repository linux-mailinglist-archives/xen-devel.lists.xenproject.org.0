Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E0620CE8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 11:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439838.693918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osLYW-0003eE-Iz; Tue, 08 Nov 2022 10:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439838.693918; Tue, 08 Nov 2022 10:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osLYW-0003bP-Fz; Tue, 08 Nov 2022 10:10:08 +0000
Received: by outflank-mailman (input) for mailman id 439838;
 Tue, 08 Nov 2022 10:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5nK=3I=citrix.com=prvs=3047eb21c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osLYV-0003bJ-6U
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 10:10:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 829dbebc-5f4d-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 11:10:04 +0100 (CET)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 05:09:58 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6337.namprd03.prod.outlook.com (2603:10b6:806:1b4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 10:09:55 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 10:09:55 +0000
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
X-Inumbo-ID: 829dbebc-5f4d-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667902205;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AKYgFrdr+0C6OO/Q/bue8XbDqbxQBk2IkrKzkp6BtKY=;
  b=fOi6V4u8SY1ZY/+f2T7LW4xAMWpFr1smc/DcdJexr/p7gbiuRDMJewBr
   /uvgSnKqkz2eEOSU8YuUFJsK5P2D528vj5QQglO6vUVd6X4nZvW4irKLV
   nZs0tf4UyhpEz2lnKxtypWBJeGNNz/pDOM8XfokdVFZ2el9aZ3kL3kXg1
   E=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 83454007
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uiNMSaJi86GhAOSXFE+RJZQlxSXFcZb7ZxGr2PjKsXjdYENS1jdTz
 DcXXTqPP/mCYWrwft8ja4vkp04E6MKGztM2TABlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRuPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5FUGFK8
 6dfBgoTNBubxMS8/ra4a7BV05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSJpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toinw27OXxXyTtIQ6Pq3pq8NphlSv9jIWOhQISX+GmqiosxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4M+A88hDL9aPS7C6QHG1CRTlEAPQ+vdIybSwn0
 BmOhdyBLSNrmK2YTzSa7Lj8hTGvP24TJGwLZy4BRCME5cXupMc4iRenZtVuDq+zyMH0EDfYw
 jaWoSx4jLIW5eYb2qP+8V3ZjjaEopnSUhVz9gjRRnii7A5yeMiifYPA1LTAxfNJLYLcS0bbu
 nEBwpKa9LpWUcvLkzGRSuIQGr3v/+yCLDDXnV9oGd8m6iip/HmgO4tX5VmSOXtUDyrNQhexC
 Ge7hO+bzMY70KeCBUOvX7+MNg==
IronPort-HdrOrdr: A9a23:+NObfqFDpMDBOrGVpLqFdJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHP9OkPAs1NKZMDUO11HJEGgP1/qA/9SkIVyEygc/79
 YdT0EdMqyWMbESt6+TjmiF+pQbsb+6GciT9JrjJhxWPGVXgs9bnmVE4lHxKDwNeOAKP+tOKH
 LajfA31waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0lt
 gsAp4Y642mcfVmE56VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.96,147,1665460800"; 
   d="scan'208";a="83454007"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IE0W3aA+uRYLB1uCPh47PmNCW/zTa3TO8op8em8iFY8wjLGO9FBslq8OJIJUHE151kWDg25Y70mAkK7wI8N+u2UbW1P3jzW73kDoXiYLa6d6AJ98lQKyYvGMQfU2Rkf7eueRcklDk+aZDuIyP+shj9RIIburYSlhY/xIzGPpyommfCNK8n56Gr7hT8kHC4HQKG8+IHBFvFQxyKwm6tjM9CqvN839hEU3RmFfKHnMC5UYhiffgJg4A0oFNGGscUmfUlkhILH003rCH7PU4p8cm+gDXv8MxPSiYP8f8sArsV7iC2AFst/WePsoKDtKZSDnXSpTlGl+p2tqqQGcL+HwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8dfr0cQ9lxR1JEPd63sydxGV52vKF8HcJSRQfh3Czw=;
 b=bvaDEYl/5b2TJG9c1jt7mWrVGMWKYxC7x9ETWWsme2LYMpYqbfUYKuJ4AGUdmBoZp2WwX8vECLcA/9zp6iUh9T8c8AgUseQaNqSfS0+iWAOh0dILYqu19ExnRd52Ncp1s4IFuA2PeAAyi7Ezf5MkvD/wrwEUYokYFafNXOc76KGjkk8TJjsLYr6uBJbgPitHai2655K9yYLil6ABCNelIA9BcWiLm9A41wNNW4VqlW0dIowLwdOdsW66JQPRtQoYwkpIlurJta+3wJhTIF4K97/YQopobGFk9J+mGK5tfIEay2sgR+w6iJq3OKllxajIJ6cP0Lhyo+vLON6IxiGH2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8dfr0cQ9lxR1JEPd63sydxGV52vKF8HcJSRQfh3Czw=;
 b=KGOjURwl1B5/lgbbYwy70m6aV1St37qIYNfzX7VE2h/F9BfNQ3/BBWwqKVuE3cwp9ZgfpKMs2rlZ3vbUt/Y6lkeq75XO9lnyzbJlrnSAgDAbJ5t1rv2YVrfNcEgDYhdRsBpY9RBseQ4i1R3k3XzBDPjMqleQCoga2l3J2o5rN0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 8 Nov 2022 11:09:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the
 APIC assist options
Message-ID: <Y2oq7Tc8YDixvk2K@Air-de-Roger>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <4c8d31de-539a-4252-f0a1-617b220eadc2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c8d31de-539a-4252-f0a1-617b220eadc2@suse.com>
X-ClientProxiedBy: LO4P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: f7cb5ace-bdaa-423c-03ef-08dac1716252
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pnFe//+WZ9Oz5oKOFbOO4o0lxGrskkHdB6+8kOksF3u9MGpXNSemQpV23iPc7HArqLjeBZ50cWE418/bYsBQskg7KJMBhmrrwFQlaTCieSU1tqVQX2WEmu8uz/lnpgm6DM0nrMc3LLti0D5Q5OTTapL7Mm/Jxc1XFneEJDeLRiR6jFncJ7A3CQrCyuzhwKxm4n6jJ7wJ14QGsqT2fT4nXcy6E4HxEOX/q8be2W8gScdgamPtYf2wNJ3AgT+868KPaRSN7BYbcPCQCUzzsNYRNTAW66nyNWrjKkubHB0bWUBAIihlFWpWetRBxVT1Z2oNVQyL/92BcSQDq4PMtZjsTUYcmk0QwqoGHEVmK7cgBZzBTDj8P6Zk4L0/AMv03haWmehiID7WGXN81fjkIkVtF5QmLduFU2/cvyYtZnyaq2LM91zhXty62BYlfPByWJSGBHqYsWinHAHCuXeQbFobJNHcKa/3evQcQPSki3ysVzFWOf116cSqiEg1DCHIMvKQg42jpBu2GDOkWBprZOLQk0w2ecGB81zqaKCT/C1fJpqAzZxeqzf4T6gcdfWk+fKnGCA4aFFX2E5XL/6/CgNUvonIrm/eQ67HwwV9J6ew3T0YIs6RkLcdk2kvOr5YbN12S6RMMWymc/P5I9M/++u2lwTEKoGWZtGWG/fViCJlRJahreBj7Hd6BENbbE3G7+WE0p4GqZ+/WO3EvHD/ntm/GA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(86362001)(85182001)(2906002)(186003)(53546011)(26005)(6506007)(6512007)(9686003)(83380400001)(82960400001)(38100700002)(5660300002)(66476007)(66946007)(66556008)(316002)(33716001)(6486002)(6916009)(54906003)(478600001)(8936002)(41300700001)(4326008)(8676002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzF4ZTdMakZwdnJ3cUpyNkl1ZUVVNE9MTnBDdlVZZkw2VDUwYnpmejQvRUFE?=
 =?utf-8?B?RThGakVPWWJ5eENROXc1T3dZcWRHclZnU0JXdzRiNHlOTHNWVEJqcUFvSjNK?=
 =?utf-8?B?M3RacmdmMWM5UFgyNllMQVMxK2U5aTd4YXRzNVRWY0pibGJSR05LTGFORmVt?=
 =?utf-8?B?MElPYUVQRk4xcHdEV1FTalBSOEF6V2RZQWttT1Q0OHBmL0lqMmwwKzVUTlQw?=
 =?utf-8?B?MERMYWZ1UHJhbWVYT2RRWDNpNkgxZzIyVU9GZlZnY21BQVgwVUQxbkVkNWRh?=
 =?utf-8?B?L2JSUGZrZG1wVzJKdk1WQVVMQmtRZTMrRzhmdkhIVlhDTGM2cTJPcW52Q0FS?=
 =?utf-8?B?RUZUcURNN1VRTFMrbDJKSEg2VkwrOWJ5Vk4wVjhOL0YzVGVaUDVmWTQ1eG1o?=
 =?utf-8?B?YW5LYU55WExvRHBuZUZZNFFOeVlKZGZtL2VBRjVSQi82ak51Z0llVFBVQ0xS?=
 =?utf-8?B?dE85Q2R3a0hpdWRZZlFaazBROFkxc202dlhOWkpkK1JlVUhrZm1WVmdwV0VQ?=
 =?utf-8?B?UFhTVlR6bWJjV0pLakFOTjFLLzg5ZEpDems5SDNDbTQrT09lU2UrN0hEQ3FI?=
 =?utf-8?B?ekhDZFIwWCtRa3c0MXhDREk5N3RhNlhtb1l6cGdOcVVuaGJzN3UzL3VaQzRl?=
 =?utf-8?B?ZHhsQXlKY0VncUo1RkZPclpvaktzWm5TTzZpZDhmSXpLbEcreXJFZVdXNE5D?=
 =?utf-8?B?RXUydzNCeUpXb0Vzcks5ZkJoeSt3TVJIM0RiNVl6MkhLRENTL2RoT1N4WGN0?=
 =?utf-8?B?QzNQdExXOU9lS2tDSFllZ2NHZW45WWg1SW1rMEZ2VDNteDRxSWRkakpIck9W?=
 =?utf-8?B?WDNyOS9KdGxPU1BkZVhLc0l4MHZLTkJ1WXFyNUw4WGZDVzcwMXozeXdmSmdk?=
 =?utf-8?B?bkRZOTRaMDA1Zys0OXVKdlVOQXVrS3lpUDAxSEtHK3BuMktkbm9od21nelBZ?=
 =?utf-8?B?a2hVMU1pMGVxd1Erd3dGWUlYR2NmVUtKKzhld0VlOE9mRHR5R1h6bUNZWlhx?=
 =?utf-8?B?MGxLcmNWQnA2YjkzS0VzOFovS1pwRGIvRjZhbTROYXVRVzl5S2pFcERDWGJy?=
 =?utf-8?B?RWNBWEQ1ZDgrMEhaNnZYazNsaElnN3JrU09PcFNKeVZZL2pNaTlyZ1FIdjJK?=
 =?utf-8?B?eUE4cTZtNDM3TjF2MGMvOW4yWHZpTW8xMnhNWmZ1UENWOUlmT0JXMWxoZ0Yr?=
 =?utf-8?B?Ti9NT2k5TWd0d3U0WEZiRGl2WlpsRVc4VlFhZnRmSmNja1RXU3R5RjVyTklR?=
 =?utf-8?B?dGthemU5amZqZ25qcmJKZFZGV0FFdzJlcjVaeU5kV09EM0kvTlE1bXRvU1Vh?=
 =?utf-8?B?MDZTL0xDaDJxUlYwSWhLVHZTQzdIUkhFUmhuN3lqVHJmQlJCc1VyVFBRckZP?=
 =?utf-8?B?a0E1OXhXV3g3R2RLYmhnWlQ4bVQ1M0ZrREE5dHgwN0pObXQxcjQ1ZWNUTjVU?=
 =?utf-8?B?UlFqN2xCUFRzNUM4aHE2amd6WVFRZXFvZ1UvQ3dBc09oNmlXTUN1WlNOcVFN?=
 =?utf-8?B?N1ZPVGFTVFBablZxNTRSL3hzUlBhMTdYQ1prWjl4WmdBN1ppcGQ2cVh4bVYr?=
 =?utf-8?B?NWxxUjJDc3llSStUdG5uQ1AxTWZLMURCQmVOZUVLMk4vbjNTT0FWR0hpMnpm?=
 =?utf-8?B?VW12Q04zUWRSakIzYkNFYkVhVHhPM1B4bWZDMUt5aGVMRWtoN3hNbnNXSFJC?=
 =?utf-8?B?NzIySEJScXUzNWFOa05ra0dlWmM4T2pqT3c4QnFvWUIrSGpUUzdvWUp1Mlp4?=
 =?utf-8?B?VFpuUW5HVDlDd21TTjVFYVNneGgvYmtzR2ZqZGxhMk5Ielg1aUJ5aExIWnJi?=
 =?utf-8?B?elRIL0JqVjBzeGNoNG9BU0JvdHIyUytqU011VnFYdE5YRjJ3QWV2Y2dmdTNz?=
 =?utf-8?B?TDMrWlYwTktLUndyZEpKTnpsTFdaa09aMjdKL2Y1c2J6ZHlnbG01NGxYZWI3?=
 =?utf-8?B?SkZvRkl4SnlwVVFURzJKdkZVRDMyT2FXYUxzaUJsbDZ6dStYVkhJdHVXZjJQ?=
 =?utf-8?B?aTdQaFBQR0JoRlVSemZQSVA4bDRySEExL3UzK0RyVTNKZ1pMNFl5L2FRVWov?=
 =?utf-8?B?dnpCdnpjVlpndWZVM1FCSUEzTmNsNE9mY0puZGVLd2N5eGVwYkhLaTVGZFdi?=
 =?utf-8?Q?tVCq22YUoyLUrEzLOFgkfPJV7?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cb5ace-bdaa-423c-03ef-08dac1716252
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 10:09:55.4478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/mkDQZefiFdUMBj5pmdPahqravA34LW4cO9zmWokD8qtMDQntt418cM8gE37tSovMfmX5m0mxszEfRTHmP+SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6337

On Mon, Nov 07, 2022 at 05:58:04PM +0100, Jan Beulich wrote:
> On 04.11.2022 17:18, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -197,7 +197,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
> >          res->a = CPUID4A_RELAX_TIMER_INT;
> >          if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
> >              res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
> > -        if ( !cpu_has_vmx_apic_reg_virt )
> > +        if ( !has_assisted_xapic(d) )
> >              res->a |= CPUID4A_MSR_BASED_APIC;
> 
> Isn't this too restrictive when considering x2APIC? IOW is there anything
> wrong with leaving this as is?

Using cpu_has_vmx_apic_reg_virt won't be correct, as a domain can have
it disabled now after this change.

When using x2APIC accesses will already be done using MSRs, so the
hint is not useful in that mode.

> > @@ -3432,6 +3436,10 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
> >                  vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
> >                  vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, VMX_MSR_R);
> >                  vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, VMX_MSR_R);
> > +
> > +                v->arch.hvm.vmx.secondary_exec_control |=
> > +                    SECONDARY_EXEC_APIC_REGISTER_VIRT;
> > +
> >              }
> 
> Nit: stray trailing blank line inside the block.

Oh, thanks.  I will wait for Andrews feedback then, I think the extra
blank can likely be removed at commit if we agree this is OK.

> Everything else looks plausible to me, but from prior discussion I
> wonder whether the result isn't still going to be too coarse grained
> for Andrew's taste.

Ack, thanks, I think this is the best that we can do given the status
of the release, but would likely need to be quick or else it's gonna
be too late.

Roger.

