Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863CD623E3B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 10:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441546.695677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot3S9-0005WP-9U; Thu, 10 Nov 2022 09:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441546.695677; Thu, 10 Nov 2022 09:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot3S9-0005TS-6K; Thu, 10 Nov 2022 09:02:29 +0000
Received: by outflank-mailman (input) for mailman id 441546;
 Thu, 10 Nov 2022 09:02:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PT5E=3K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ot3S7-0005TM-Io
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 09:02:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65193812-60d6-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 10:02:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8446.eurprd04.prod.outlook.com (2603:10a6:10:2ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 10 Nov
 2022 09:02:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 09:02:24 +0000
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
X-Inumbo-ID: 65193812-60d6-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQGdzcvJ5yeA1fA0mrcR2j1eVdY/QUnrDk86EqcP58gbbQrpb49LtYPSbDveWnvrsM0ncRtx4XKYW1rovrAZiiTJm30LKSOuqDmfciLLqBMdkTBmhxS9BufdHU7TdbClUzQjtTuMy8SopQMx/3vD8ETLCKJtSJv+Nt5qxT6NOJMKGnHT1GVBObZnaEQCipgM6qC7+HYwCh+cgw4upf3TGRPwaXa7PiV0WXOwrJuAD75B55e9SA8y2IdtCK5yQ8a4rcUqSfT/ROMyBNZcBtUDHR30knRcsjBHXsHLywxIMA154q8q4AYbklrHC67+tDzi8Qg1RqteevBYjQT8WK4rKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGEUzAM/tBuNXyuGwpAuLIPgwCVJ81LMNT9tzp4hLaQ=;
 b=GDSyebhnA6TJyNfmkTy/896b2qyBKmP6IiHTf+rgvbi9Vik8YPvrkIh3yOGaqzQ0YU3kFRY70IG/AYbgl9LdWouQIQVfTFatGV3miNSu/oyuz+0tLA4cQkPG7OsNtBkRAKG/9zLiMcKrw/TH+835E1OuaOjXqngXQ5bnENbn6HJr25GiNn0IuOck+U36x1hsT7tSp/jOIuMOxUTNBFKVPD9EPZp6kQAaI5SgAQNt3MDuyrpyQJjucUU64Jf0lcbcAVBNo3NewM/akmvU5JEt0tExCak/MJdulmLF3WfkamKxj+lWWfQq6XjzPBoo7zFQWQB4qe5f/bvY3bY4ITlxGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGEUzAM/tBuNXyuGwpAuLIPgwCVJ81LMNT9tzp4hLaQ=;
 b=boLd260Xb1EfpGPtkLy+5N7E5V8aD4F3MUojpKGapPJxxBOj0bRHz1WcRLydWzWI99nTpU+JT4frmPBFwYLDYgKCPENSN/LDIW3KuQPlzROekVSUAoVv8VOznSZa31bgBVPXzepOyhwrM+K38q7N0mu4v+5NVafRVW5POSMS/0O4lX7k6NXtuX7SVhB1TIpdYJa7VpjS2gp5EUQrAEeR9a8BEQYzqf5jWPR9V2lKRXgW5YIveggg3pRrax6duesXhTzIKxn4raJcgS6sLitk0pk1a/zhV3cGcZS3ucO5i/WPS0+qt61K6NAUVIF02uYB+c+aEvag3xNxUap6BbssPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b97cfcd-e741-c89b-8063-e3f977ab7ef0@suse.com>
Date: Thu, 10 Nov 2022 10:02:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Edwin Torok <edvin.torok@citrix.com>, Roger Pau Monne
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <de5c9f07-90f5-a460-f1f7-a6732bbab1df@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <de5c9f07-90f5-a460-f1f7-a6732bbab1df@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: df2e952d-31ad-4869-a2d1-08dac2fa4899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rEaNeA/e5VhaF2M8+mkW3RvLPoTSXl1OVASmV3UaV5xTYulzrE34e2tVCDrpnCAiKmrG5EFQpeyODxnMZw+V8SCRliHRfphAMA1rTtF8Ip00nwsjqokqYT6VrFt7JWqN+U14pyGNWRYQitaRtxFGJNFGyJjprcSoN9vjOvJ9nYzGKstqhVXyqURmzn0W8NXm3jR6Sjj48toTMoVZuegcTq+SIpTLpICLr30Z6nABoA+3RlbJIa5yzFbdbYFjPg35WuQn4zJpbtnBE8OEZ+1JQRiTJPFfNVfPxMumrfL9wUIIiv73PmOVUAa29Hh+a6n1K4hIyyiSmniMeZG0FbxUtHY5eO4Ht/fJ2Uyzs+ZJ4szXv1w7vdZ5q81sd/995mmP1snla6wamL/PvQS0Lbgl4RcJD5wsBHBilMExd7WhD/ikjEMg8Vax7+tWPNjd3uXsspfLTJ37uFT0TsavNYXcjS6xhrTlZxmwsxsZepjQFtuEbDXfVzbdTKA9D7JeQDLmwpjt1Gxn/Rg4gai5Yf1vFO1mVZvBVNMqhKNcQX/bwSyLcVhJx/5jvcO9e8IN3vHFksncc2kfB/ZKMeKI0KXZa9cAyBqptLqBENkKaPofHSVTy8Ow/tqNTYavsC34xeZuSx9QrnAM+r4fNIznZn2BspJB0uTfDptmPf2qMa4tN1G7kH6OT5iodAVNnR1AN6gGbpjCqnC2BnUSXobsUfepfEP5HYnMidm3sJa/8W0gFH6/NlSmLUEh0kisgmDLZSqR0nZT2LtK6bgpycd0bwRx5SlSVTtqfhvRikGRoxBZWzU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199015)(8936002)(66946007)(36756003)(186003)(66476007)(8676002)(4326008)(2906002)(53546011)(2616005)(5660300002)(6512007)(478600001)(86362001)(66556008)(31696002)(6666004)(6486002)(316002)(26005)(6506007)(54906003)(6916009)(4744005)(31686004)(41300700001)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzdTRzRpNFNtUGxZTURtVHZrM2VQMGpTaVlPUlc2Q004V3J4OEQ0TjRlbUli?=
 =?utf-8?B?dmVJQlZsZVF5UUZ2M2w2a05aeWxJUzltbUR0MkJnTExsa1VtUnM0cWFlVjdr?=
 =?utf-8?B?dGxiNzh1SkxGOFJXRFduOGhPa2Y4OE8zSGtqZUYvdmJCanhVTytKT055S2tV?=
 =?utf-8?B?eHpoVDFVMEw0ZHhsek5PZDhxSWg3aTF6OHJCK3d4bmdkNGFDOXBsMEtrTVRx?=
 =?utf-8?B?SjlCRzNxU2lxa3BLK2tJT0YxRlJOQlJFNFNqdzdiZ01laGw1UzRMNG1oV2I3?=
 =?utf-8?B?cGxnZXdKbkE2dmNSM0tUdGdUYnN3RkdTdnFKdm5DdnBDU3BBbGVoZHNwd0VZ?=
 =?utf-8?B?cGhaM1Zvem1tazJTZHI3VHFJNDRjWnVvR3FYOFoycmVieG0xNW1DcGt1TWZM?=
 =?utf-8?B?QWMzSjdHdk1GT3MvMnB1dlM4cmdBQXVwZC90eWJmZTBjTlZLWFdEclZXSWIw?=
 =?utf-8?B?dTVkT2xvM0w0THpYRmw5dVNZcnVQcGR4b3lDcnVRbWh6SGZ5NkVoREJNKzRU?=
 =?utf-8?B?aXRXak5PYVFqeXgrakNyOW44cGEza3RGN3djU3J6UUFZTzZyYnh2NmRwNkRz?=
 =?utf-8?B?L2duK0dvWW9JOWJMVi9IUmROS29rYXM1eWFhQXFCazJXMkJ3MFpxZVVNNk4x?=
 =?utf-8?B?NGYyS3NwWWUvL2lhekhTZ1VOUzk4MlBDZmtveXZkcTJCSnhYQ0IyMVdLb0ZD?=
 =?utf-8?B?OUNXRXYvUVJjYVQ1RWpPOElDL2g2VWJTTEF1STdGaTNJNGY1SThyT0Q3aUFC?=
 =?utf-8?B?Y3AyTWFJWkhaVFJIUHhHNEhIUENkMUJWRnVXbnFYbTZnaE5wdWxWOTFkSlY1?=
 =?utf-8?B?NzFaRnl6aUgzSmhUMWk0ZENIUzM2NFRQMXM2YTFuV21hRmdJSjl4VDhqdCtk?=
 =?utf-8?B?NkpvRkJiWXhIZ0RjTCt3TGtLMGk3UjJSTXFkdStadmRDb25DazBXQkorQVBh?=
 =?utf-8?B?VDJZMVdiNXZ0V1lrZHVRY0h5Z1JpZGRDdGlIUmNTbGtnTHFqbWRmU2NvOUR6?=
 =?utf-8?B?UjBSSWZNTHllMVE2VENhbllvNmxFejU2a3ZHWnZ0T1pjL1Q2YVJjWlMwSEI1?=
 =?utf-8?B?QVJUWVNnTkdBOWVlMFdpVDFaNUdoWkVPN2xSTXFCT0wzcThwS243bnYrVUhm?=
 =?utf-8?B?aTJlWE5aMXorMElwWVhwRmJTSEtkanhlajUybFRIZjJjdUU4TlFmM1VubFNZ?=
 =?utf-8?B?VXFVbFk3VGNhVXVFSGZ3WU5NUWUvRjZLTm9vcmhyMmJwWDQ1djl0OUloKytX?=
 =?utf-8?B?R2Q1T3J5eDI0M2ZXK1NhZFIrcE5YR25teU9yR3I5TC9abWxCNzNRZFNGOU52?=
 =?utf-8?B?R1YzVEZGa1JWYjJCc0FjRm95YkRJQyt1RHpLKzY5RXovTXBmUVBodzlSOHRv?=
 =?utf-8?B?cDhSLy8zM0hvcjJSU2oxVGNsSE5YOU1ESDlOeDJZSDhaRzdYMGNHMnhhMlFm?=
 =?utf-8?B?UkZTM0s4MnNIR3hmaFpLQUJic3pndjh1Um1MTDRwVTFOUlYrZ29vZU8wUWYr?=
 =?utf-8?B?ZWRVWitFZGpvSkgxNTdGcVNBNmFzb3ZLRXBtL3JzMDNKK0poc2xxZ0loSzNj?=
 =?utf-8?B?cGR2Tm9RQlhnNUhtM0hTRElhNkZnejV2dE9iVjBsTmJBa2NPMkhpSnJva2Ft?=
 =?utf-8?B?dnl6cXlEQkZjcGFtTWxpQS8yY3lXM2RpM2lxVFNBVFVwMVpIQ21oM2gzMCtM?=
 =?utf-8?B?dFh5eGFJNVhRSzNvWTc5WVEzQjRVTWpoai9hS21TelJ3c1EzM28weEE5eGRI?=
 =?utf-8?B?OXBmbHV2S25nYVpLSVdiY1RUUzJ2UkdIWkVMMVVHakRJVGFhaE5LbEtmaXEy?=
 =?utf-8?B?WHBmVzdjL2JqSWtMWkhFbHJZazNKV2FhQnRwRGZvcVRmOW1mWjF2OGEwajhP?=
 =?utf-8?B?dnhCdWpVRjRIcXRxNzNpZ0E5TzY3L3oza3R6SWErZ1N6YnY1VkcwcEFHVVVF?=
 =?utf-8?B?U0hUTDcxMzNHbW8zMXFUeTVkODN6di9QWmZzUkhRUVNOZDdKbXlDcW5TUDMz?=
 =?utf-8?B?QWhpQ0N2R1JFNHdqSW1hbkJ1b3ZpMWNlK2MzdEdjRlZWbDd0SGpIVzhDZkQw?=
 =?utf-8?B?aTE5UDlCRmVFdzhHazVBUVRGejlrVVg1S3ZVVVZXaHU5aHRlYmpaaVNFVmFS?=
 =?utf-8?Q?SNNl5IusTLJ2uakUys5zG9vj5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2e952d-31ad-4869-a2d1-08dac2fa4899
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 09:02:24.3393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QASkbXrib9g1XGVqU/3Wpt8x7SkMlLiRoK6Z2eUyWlEE+yYDspQnwLp78Mu4G/x5gopVNqIpyIfXy+6tH30ADg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8446

On 09.11.2022 17:11, Andrew Cooper wrote:
> On 08/11/2022 11:38, Roger Pau Monne wrote:
>> Like on the Arm side, return -EINVAL when attempting to do a p2m
>> operation on dying domains.
> 
> Honestly, I'd drop the comment about ARM.  "the Arm side" has existed
> for of all of a couple of weeks.
> 
> A far better justification is because almost all other DOMCTLs are
> rejected with -EINVAL against dying domains.

Would you mind supplying data to prove this statement? When looking
at just x86'es arch_do_domctl() I can't see this being the case for
ioport_permission, getpageframeinfo3, hypercall_init, set_address_size,
get_address_size, sendtrigger, bind_pt_irq, unbind_pt_irq,
ioport_mapping, set_ext_vcpucontext, and get_ext_vcpucontext. At which
point I stopped checking further because in the order they appear in
the file these are _all_ except shadow_op and [gs]ethvmcontext*. Am I
overlooking hidden checks of ->is_dying?

Jan

