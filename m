Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE15EF026
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 10:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413512.657194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odoiU-0007rY-0R; Thu, 29 Sep 2022 08:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413512.657194; Thu, 29 Sep 2022 08:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odoiT-0007oZ-T5; Thu, 29 Sep 2022 08:16:21 +0000
Received: by outflank-mailman (input) for mailman id 413512;
 Thu, 29 Sep 2022 08:16:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odoiR-0007oT-Ir
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 08:16:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdf7b41b-3fce-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 10:16:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 08:16:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 08:16:16 +0000
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
X-Inumbo-ID: fdf7b41b-3fce-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ygd3aHVOj266XAvXYzAQ2VXPvW05jiW9UuU4wpWVj6PgwsRuhMR9dprAw5Q9OtUnHN70IoJovYWI7psmDyEn/XDSa6OG9ER5T9cwyLX0R3AAXTHQmwDhIjpglwgdXgYd46RkHAM8nbvBawtQs7GstNmAHKC5JPUyLNkzV3FL5Fr7gaVEE5RGGR5QhgPmIq82cqNlQz8Fsig5n6juG9CIGEJKj4SmdR0r5VowbH9znhIaK6ua/gY3ag5zm1gDBY6GQ1WMKhK1i4DhGXgTGFd/qEqDhUprnAY0dlozdR8fciuvebsPcJN+ZsRValI9B4tnB1743E4XaPtbVuV8heQB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGv5fb0NBktJ6dJZ7eghENme7t2EHi0tAiN0dfWnS0I=;
 b=FaFrFlSwu9rcjSJjibwVLtZUKAtTYXmVtOhUCsEqk+TKG4kTTwbgL9mh1eEpd9VrcknL71RGQAgW1SVB012N9n77dkiGxIrWhYtYcpWR8YFJuVDZOisJmSox+r0CqV14miFfoICPrplRd9mWso6akvR5oNhNzH4Db7F2qxXsWLHB01FghaN9yX3i92Qc8eYmESTKQPiTPnu7nvJUFbhKiy1J2oGGvRCVnDFR5uQIeX3D8mCacZP5tJyn6jQSH0p2/ifxwac69bdKUBW9VkDHMcu7w+hNTiTl6rpM5PvgkeY0Vb23BSnn+3BWf9h+KaB7QwLFD1HLs0rp5oLb0Vkhgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGv5fb0NBktJ6dJZ7eghENme7t2EHi0tAiN0dfWnS0I=;
 b=dC5ld7iIrNUJCLLD2E2QHs0IbMIlGgnNnGWbtCil6dloN0Dx60GIvF2MF4YkGYN+Q1OiqolJRIOORaji82TWmJxCYCHAzo74tpXVTa59BY0rF7NVpqsWT/9hPOUk4+yZ3uRaSggZgYk88rpORxwdxgwXwbSkId+G38Ksiw0ho/CDPLkT8VJM07w2K0Wc6ruOY19yUXweZglWcqWGI6QTkmIKOw9LvV/RffXxuD6ndb0VqXzwpXVei0fUzByQ5INln9+MdJl274XW9vlihITeSutN+mHaEagSYlbgY5nq8bHqFrG2afIE106C2/ZL25tFEjTz/R5R+mew+SC5IWoZSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72674ba2-bc76-9e4c-7591-5588ff0c1f77@suse.com>
Date: Thu, 29 Sep 2022 10:16:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Proposal for physical address based hypercalls
Content-Language: en-US
To: "dpsmith.dev" <dpsmith.dev@gmail.com>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <9340769a-d3cf-a7bb-f8f4-dc9bde463c02@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9340769a-d3cf-a7bb-f8f4-dc9bde463c02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0265.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 87093102-a3a5-462f-17b0-08daa1f2e137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ne9uNHyj7TEJf7HlXj3u48aqMeIqEjSqct86nUuN7xVkfmZf2II+CM84/8rM1vIUHGQQPL085Ydy2pfwuwvGKcnhMly4nSrKgCPRzVHUaDYWtLSk5a5JaP4xjX/3NfWJSA69rMbNsJfX+C5AUq01yOyJPePZWuxtZ9nlWLAVfo/FYiyN3Z2Gg2rp+Y2NBP1CCcu15rRT1rQKM78QXgCppBMYsLtWEZE1/fvZGqo76eDAqLnkp0CwlOtQfClR9hV0XQNuP/Pblpz7Mi4Kk+9NcRdlIgF6HC/s4b4XM6Xo+WKDHcNs2KM5iSTU52NZZ0JiT0YzD0QWoOzehLZWVI4UrI3EgevR2s2va9g+R0GSF7HEAQidOBcpbM6pU5+c8+HevdYWARU1ZPlgxpxxJv+tV4Hw72p3n2kDz0AX2Zwk32pOVALdmfJmk2CulFWliki0YDgZHW1U1vEc1T13o9qP0Nu4V4XxjhwJe7TUJuooIWWR+aYW++ics8gcCydRr+RHFZZbu/+GYmCbKbhDwlOxaUADK/d5ARK56PiCKxB5C/LDH5kaWLlFLhVwYP3GAHhd0tfJqs49P9R8Y1jzBMPc9W/s93orgtiiUOQ13eDuBiFtl+KwgnfoGS+wZMu4IBqhl1R5RItwYgYJW9tWmoUys3WCkhShGcM5i+DbB9BATi0KyMhYYGTya8vACkWUVg/EVu5iEbvCe9moNS7H/cg+96bSDaHISvXaHs4qHmGneZ8kd7Bo4oY3kM9ZWHfTzRMDiHt0crgfW2p3lHg8//p1Jsjvl8kPrbgYNZ02rRbs46I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199015)(26005)(316002)(6916009)(6486002)(8676002)(478600001)(36756003)(4326008)(38100700002)(5660300002)(66556008)(66476007)(41300700001)(8936002)(66946007)(83380400001)(2616005)(6506007)(53546011)(86362001)(186003)(6512007)(31696002)(31686004)(2906002)(66899015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVo1eTlMbkFPZkpDazZ3b0hjRzN5M0dONm5DenV1dnpvd2ovc3VOSVJpZHRk?=
 =?utf-8?B?OVN4bVNmQUVXblVGK3RzR3JWbkg2WVo1NWJoUVh3aTFKNnhvcVZvbTBIRjR2?=
 =?utf-8?B?b3lqQzVhVHhtS1IvNFR5eXJVNTRQYmdjaVRKRkV3TGo1SUpqWTk2aThVams3?=
 =?utf-8?B?bDVoOFdDeUJlM0pLNC84NkxpY3U0NFQyL2RwV3VjOG9ua1IrUGtuRGJOM0pO?=
 =?utf-8?B?cThtSkhQd3EzRVFxSFNqUlA0Rk1zZGh4UnlJWC9hN2NiRFVQWkhjQ2l3dFlP?=
 =?utf-8?B?S3BOaEhXQ09DS0Y3cW5GK0E4R0c3aGdNdjFOd3pZUkxnVTB6VXFaanU0N1pS?=
 =?utf-8?B?aVdMQVF3NUszdjNSQkR2OUhIQmh5OTl2V2RtOG9sTG1wM3BEZC9hVmkzMkNt?=
 =?utf-8?B?NGdMN0RTQTVNSmtrTVc3OXg1MTl5OHlIbVJYSDV2OWlEaXFlSHFSTG1jSVkz?=
 =?utf-8?B?U3lTTFhScEsxcVFyUjl2V2kzVGwrYUdsU09sb0FJbVNXUXA0LzRUMkxQSDJI?=
 =?utf-8?B?SkZtcW1xOGdQZ1FZdldRRGFiTXRIYUE0cUxiaGZZeWRQbnF0QmUzaGVPQkhu?=
 =?utf-8?B?ZUw4ZkZkLzVCVmdRVStSL3QxWGR3eE1jNXBZb0JMQUd2bTNrRDFhR294c3or?=
 =?utf-8?B?SG9YOSszcHYyNllEcXcxcUtRTHYxeTZZZENGQTJYSWZEWUZUVDFqVXNWMk44?=
 =?utf-8?B?d1VzamJsV0pmN3NibWNNSFpWU3hoTVBpbDhsVFJvZVIxbUpUUjBPNkxPcGRv?=
 =?utf-8?B?ZGVlaVI4MEg3b0ZyRlBBOXkrMzI1bGxCMDlySC9kamlRNjNnZ1QybFA5R2lK?=
 =?utf-8?B?czhNeE1vMUd2TUp3aSttaGhhY0phNUYweFZVZkhNWEl3RGd4QVBIYmROL3dR?=
 =?utf-8?B?anpFR2JGSVAwcDRkK2U4VEpaWU9rS0Y0V1F4eEpCTy9aWWtucmx3Mm1VUVh2?=
 =?utf-8?B?WEd4YTNMcERjaGNWL2E3OUN6QUdwOGoxZC90Z1phdlZHMldMdXpXTW4zaGNk?=
 =?utf-8?B?MWtGZkl0UFVVWWh5TE5yUHZ6QVpibTh1TlhvYm1iKzhYbzhKSTkzRWR0R0RU?=
 =?utf-8?B?eHJyMGxXZ0JhUFJsc0RvaEZVNmR6bmEvZzdUeWVzcExmMTNZbXluUUxaMHhU?=
 =?utf-8?B?Y2VDbHljMDgvRWxycGNWWFZwS25uMGZuZjZ6RkQrUlZnVEZQWGhpY3VSbmxI?=
 =?utf-8?B?U2lGaGZTTzlSQ3QyTlpkbEtvaHNoNWVFQnRDV01zdHBUc1FpWXM4VnRJcUEr?=
 =?utf-8?B?bGZCVGpQL3JoR0xzdUlpTUVVYXNRS280bmZZVjlnSXFtK1BhYjVVazZqbWZJ?=
 =?utf-8?B?dHBoQjRLRXVnTUovbkluQ21reDZ0NUlhRUJ2UExwWWZaYTVkMlJudjlGUzV3?=
 =?utf-8?B?d0Y1V2hjcFFlTFNQK0xLV3FtSHNPTDJoWlF4ZUNrdG9PQ1NiQ0NLSElVK1BR?=
 =?utf-8?B?YXRxN3E5YWZBamdyY0kweDMrSzA2UWZQWG5NaFFIRHRYTjFUSW42QlpnaVdP?=
 =?utf-8?B?b01nNWpXVU5HZDdleEcvaVp6N2ltUm1ldC9EaVR3bnJMblgrYVJyVTByYWp1?=
 =?utf-8?B?Y043VEg5VkU0Ujk5dUhQOWdhTWpyOGdnbEd1TWhiTWhXVmZkQzM0Qk9uWmlj?=
 =?utf-8?B?cUF4YUxFUFlJRGdRcXdrSUkzRDU0MVV2YVp6cDBrODIzR2NkcTFodjJOR0M4?=
 =?utf-8?B?VHNHUGNxS3UyNkNnQlVVY3NzL1VtKzlSUTczc3JSNHJCSlpYUmJJT0hobk9G?=
 =?utf-8?B?emJxWWVLSVpObUVtZFBDd05LbHZTUnl1TzJSZkkvb2xRQXNFbGN2RlpXR1VJ?=
 =?utf-8?B?OU1pa054cENieVZzQ3dFYlVlQlJMdW40VXk0YW90TVppRGJWK3NTRkdGUG9U?=
 =?utf-8?B?R1JiYmZuSnlsRUhxRk5JdDNVbWtTRmE4R3RwNnFoWmNFbThtRER1ZDVqd1lC?=
 =?utf-8?B?bU9neFYxOXdGM2M2VlplMnJUcXJhUVJ3Z09abU5neVRDS1RDeHZSU2ZpOHA1?=
 =?utf-8?B?WDBqZTVvZTd4M3VPMXpCQ2x0VWVIaDhNWG1rWXdNL3g0bUJ4Y2xaZDNyQ1d5?=
 =?utf-8?B?VTExTTRjeDlOTThzN3pDcEFZaURWQm5nWWpuVnB4UzhuTFdXcnE4dnZPbDJa?=
 =?utf-8?Q?QTAW/n6SOvseOWHkyPKF1CQoE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87093102-a3a5-462f-17b0-08daa1f2e137
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 08:16:16.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyaq4yvDtwVc54ua3QNxrKE6ZY76RdITlm4phjUBiSFlvo2KXm8pky9S0mkTapKNPYQ0yTDDAYa6eO8Y1zvqMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640

On 28.09.2022 15:32, dpsmith.dev wrote:
> On 9/28/22 06:38, Jan Beulich wrote:
>> For quite some time we've been talking about replacing the present virtual
>> address based hypercall interface with one using physical addresses.  This is in
>> particular a prerequisite to being able to support guests with encrypted
>> memory, as for such guests we cannot perform the page table walks necessary to
>> translate virtual to (guest-)physical addresses.  But using (guest) physical
>> addresses is also expected to help performance of non-PV guests (i.e. all Arm
>> ones plus HVM/PVH on x86), because of the no longer necessary address
>> translation.
> 
> Greetings Jan,
> 
> I think there are multiple issues in play here, but the two major ones 
> are 1.) eliminating the use of guest virtual addresses and 2.) handling 
> the change in the security model for hypercalls from encrypted VMs. As 
> Andy was pointing out, attempting to address (1) in a backwards 
> compatible approach will likely not arrive at a solution that can 
> address issue (2).

It may not be sufficient, but it is (can be) a prereq.

> IMHO, the only result from teaching the existing ABI 
> to speak GPAs instead of VAs will be to break current and new kernels of 
> the habit of using VAs. Beyond that I do not see how it will do anything 
> to prepare current OS kernels for running as encrypted VMs, at least for 
> AMD since that is the specification I have been focused on studying the 
> last couple of months.

Plus we'd have code in the hypervisor then which deals with physical
address based hypercall buffers. One less prereq to take care of for
the (huge) rest of the work needed.

> As for ABIv2, I understand and can appreciate Andy's desired approach. 
> Recently, especially with the hardware changes being introduced by SEV, 
> I would like to have considered a naive and more radical approach. 
> Currently hypercalls function using a more ioctl style. I would like to 
> suggest that a packet style interface similar to netlink be considered. 
> There are many benefits to adopting this type of interface that could be 
> covered in a larger RFC if there was any sense of willingness to 
> consider it. As a glimpse, a few benefits would be that arbitrary 
> buffers, continuations/asynchronous calls, and multi-call are all 
> natural consequence. It would also allow advanced extensions, such as an 
> optional PF_RING-like interface for zero-copy messaging from guest 
> user-space to hypervisor. While a packet interface could easily co-exist 
> with the existing ioctl-style interface, it would be a paradigm shift 
> from the past, though I feel ABIv2 was already going to be such a shift. 
> Anyway, just my 2¢.

I'm sorry for my ignorance, but I have no knowledge of how netlink
works.

Jan

