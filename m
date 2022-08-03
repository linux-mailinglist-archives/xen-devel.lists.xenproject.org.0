Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF234588743
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 08:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379564.613106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7j9-0000Gj-1A; Wed, 03 Aug 2022 06:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379564.613106; Wed, 03 Aug 2022 06:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7j8-0000DA-TB; Wed, 03 Aug 2022 06:19:30 +0000
Received: by outflank-mailman (input) for mailman id 379564;
 Wed, 03 Aug 2022 06:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ7j7-0000D4-HU
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 06:19:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130057.outbound.protection.outlook.com [40.107.13.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aa51895-12f4-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 08:19:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3090.eurprd04.prod.outlook.com (2603:10a6:206:4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 3 Aug
 2022 06:19:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 06:19:25 +0000
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
X-Inumbo-ID: 3aa51895-12f4-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HX1txld0schNHl0FD5NAiBNzj0aYzZ002dH/yoXIcJvvQ8JrMuwmSRBUVKReTJXDqHbXEWDykWAz89GGxOnurkmKLnpVw/iIb9X+9m4dlaHTtHJuszb086JAhtvBIWy+yKVwu5ExIVNfigiEofoIAbovM4grQgQg0UlUtglNlZJsOcstA0dFP2UhOB5etkvzw4A6Tk+sMfah85NxHnTf1p69OXkJ4kxUNnRH3ajeOHedbI02cYVS+ragV0Tn8y9bdXEqYm4USFN3mGBjpqSlje+NR4i0CDiHL3UNLo8fihDqQ9LTDBMEp00VzN7Yq4J+mNSQgA9UcG8Z52YV+oomkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhaMqdyunHIce9EhlgnKx+Hh+XsGM/GBZO2n6H+JrjY=;
 b=Xjv8O7e2xTdHTDMMr1Z2fcrycwqdyL1LMOHgYMVR67scbUEYFfp0VO9wmg2fN+xNABtxBTqA2FLFfhyPv6Y0JxK06ioKImoXE6ZaYI4YIN1m+m9HdqQzJ3ANG8hZSVzpzKX/vZ1Mvg0GJeBrJuC6HPXwiAdl6ZJVQy6WljjXC8niBa6xAsYg31qV9v+0dBr897l3m4IYlQ+N6pz0w8OHkL5764E5wQT0PmgZcRMW+syzmmsMTBN1pHZygYlzSWzBxnlh0yFiezYzWU5JQ8xxlc03SI4VNDhW1u/nxpzrGT6sZjCO5fzubaMzFeBH0K1K4sz3Kkd5Nd7vWG2dRo6iPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhaMqdyunHIce9EhlgnKx+Hh+XsGM/GBZO2n6H+JrjY=;
 b=RFEgGxkRpt23gwv2wku8FmL6KBQewV5CtzWNg2d5Imct9v47PGlzb2pLrJVKkCEnHEBuVQVrMx+uBvMR0L237VyNVO1Gd4OiKbtwr7U6tWPN0NfrWs03LUcZTmtbIkDVuf/4w1rdHaIAywM+uigB4SgNBUEHpfMTvy1nO+kc2Yfu5couXw2NHmuUqvEyYihg/ZfDe5ikMSQhsx5SSRie/tGCYn9wV9p3B7WaHV6uncKcvtFh6lbKTlkBNb/SIzhy7+lEFrAnPsQVUbT6KiOlYac66cHR1pYrvGx18+rg8yUXNRo4KTAzGPKQOTXr4yhaMfurVuiAqPBoKTJrn3yOjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6ecebb5-5056-d4b6-c2f6-7d2cebec13dd@suse.com>
Date: Wed, 3 Aug 2022 08:19:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] xen: sched: dom0_vcpus_pin should only affect dom0
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
Cc: "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <165944775952.3531.14547627248752689801.stgit@tumbleweed.Wayrath>
 <165944829054.3531.818489021551433260.stgit@tumbleweed.Wayrath>
 <473a337f-3211-c588-9398-b9f9a18926e5@suse.com>
 <228c70b853a8d790f1e1cafc2bbef00b5f845606.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <228c70b853a8d790f1e1cafc2bbef00b5f845606.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be4518c2-1668-4c6b-986b-08da75181cb6
X-MS-TrafficTypeDiagnostic: AM5PR04MB3090:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UoSnLIcdMYamy5JYlQrP5ZggEjnTVCJHKezdI952QpxGBnrH/dSV5B3PPUebm6hMX2MZWuxSTvFIiqKJnTVmzIbNrN9t/S5jtgPshHCq0e9ogbpuF/U7Fy/6I2a67ADYqd1WMED1UwGaj5iV50CnPgOZRdM9BzrjlZzI+mqhMtt2ZbE8npv4uN6OjnfRnH3iemxNKBNjlY6jgmHQSqOKYMIfVqWCLgerypXvzraEC4xpo2rnT/VOlUMWxSUTucLfpT5sXCgVeHf7NJ+28lONtEobhDy4wqYuUVdcU93H7KyKx2s61QruS5b+NrE5QBujTCXNsa/stU5hkOxJyGQBA9cMRkwlWeCrdPa3yXEB56Cyi7SRKWs0Q+CAlamwA1serpF3UncKQimP1n4reo+jGrDlMK0Lti/uFTODtKq4LCGoKRymvV3G/srrp+Fq53JcTP6Kj4+FBC7hNGKUULYbmZM42kCd+k7XwdoVCTziEG4tLTmaMXm1ZOSRPbPKgux6Gax7hKz/ECfc6sUWQNqkp8jT/O489zZuxtpyfCY+Xe60uQy4AFxKgOGMh2yYP+B+zUC1+WSNy+0nOUUrJYLEpQyMDOn3MtBuBVdDMSgLwXciFLa+bOlUvKAMTFx3dEGPa5jxZrki7LxWmeC9SjiuD+EtvZzQ5B06YK8XvPnv3phrRvbQ6Zuz4eBEzjhyxdtwG/oO5owtOvmsEgWWxdQLF52Fg4i5AX4GZP6cj46dL5eQ5Ap7RUJCCwNYyqcVtbra3DHHXH2bISQHG2XFufbWXkGIYsPQhJxEDrv1fHBU2vTAu/KhOgeFaDtv7012MKPO8OfhxP3AuQGoGs/P47m0kA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(346002)(376002)(136003)(6666004)(53546011)(6506007)(54906003)(6636002)(37006003)(316002)(2906002)(5660300002)(66946007)(66556008)(86362001)(8676002)(83380400001)(66476007)(4326008)(8936002)(31696002)(6862004)(41300700001)(38100700002)(478600001)(36756003)(6486002)(186003)(6512007)(26005)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEEzSkxVeUNjL0t1RFQxVkVNQmh4WVkzMzNPUUI3Vjc5eVY0Um9rOE05RWxY?=
 =?utf-8?B?M1docCsxMzJZc0plY3k4Mm51SGJiT3Y4NmRGNEVremR4cHVwN05URTBlSzM5?=
 =?utf-8?B?dFR5eU9BdVdLZUZvU2g0TFZBT3A4NG16QTdIYmhOanFLT051ZWNRS3lzMjdJ?=
 =?utf-8?B?M1ozRHZxLzhyV21YeWVpVHFxdG41N0tnYU9KUXR5RGZyelFRd3YvYlRkdmFP?=
 =?utf-8?B?RTk3V1QybUNZYVd2aFF2RUFYMjlRNWJzUUdOakZIQlN4bjBDNFIwTmUwS0Ey?=
 =?utf-8?B?TjN2N3R6VU4wWEM5MDl3R1Z0bVY4NE5mbFkyZTFSQ055ckppbEVjRTB3SFNF?=
 =?utf-8?B?bTlLTkVEVExOZEh2VStkYlFsZmNhU2t5STQrR0dkSENaU01WeHFjbW84N0dH?=
 =?utf-8?B?ZVk0YlVOZ3FNZEZ2aWloTk05ZVFJV2RsMW9KRmE4eFFHMUZYU1JwUXBQZ3Yr?=
 =?utf-8?B?cU85U09zTUZjTkRkVWtac3BsUmdnMlhlbitJdWJSbjZMdE1DN1p4N1VGN3N2?=
 =?utf-8?B?d3A2bkZSS3R4V0pQREtyTnlQRG5NUi9PMGdIVzRFNmp1Tlp4M0Y4aGNBTzdD?=
 =?utf-8?B?Y3prRzhYU3JJY0ZTMXdhb250OFJSWGlBVFh3MTIzclNmZllzdFcrRmwrN3kr?=
 =?utf-8?B?VzNkVVprUUlKYUdNTWJuZHlHUWJUVmJHYnZwMEcyM3JOYlZnQ0M3dXRBa0Fo?=
 =?utf-8?B?bDNZd3hiUk00Y2tZNGE1Z3VQbkZjSGdtQjVKOHh4eXVtWGlZMHcyWkZBWlMv?=
 =?utf-8?B?Q0tuVUlzNFdLc0ZwcXY2UVVTb2NSL0FEZmYvbEdrQW5PZFNHdTQzeG9nQkJi?=
 =?utf-8?B?N3pHK1dJVnd1aEhzVWg3djl1ejhZcnoyZU5JQkJnemN2cGFyOXpIV2d2UjdL?=
 =?utf-8?B?UGZoQjZPeERRb1VGaVRzZDNycXgxMWY1ZzZvS1dyeE1YSGFGNXdFMi9PTHBU?=
 =?utf-8?B?RUQyQTVOMFhjUTJ6WFJPWjEvcE55dkJMYzZIRnhwbkRnVEc0Qkw4dVlpREZm?=
 =?utf-8?B?bk01aHZkNVExR3B2R2dHdHpFOEFDS3hnWENZQXJaaUNvTHE0cHlBU1VjQm0x?=
 =?utf-8?B?QkFpVnhiclNPdUFET3J0cno2ZGFRSmt6NzQ4K1RETVVEc0pPSEo3YWJOdWg0?=
 =?utf-8?B?MHdjUjRvOTRFNWxZT2E4MkRsRnFnRXlSVDZvNHp4SGNzMERMMFZjQW4yNzUx?=
 =?utf-8?B?cXNWSUxjOTFtZTBvSFd0R25oc3czRVh3YlFCMlJmU3NuVzJjaXZ1a3JSZWRm?=
 =?utf-8?B?eGVwbGlZWjBFSXlmdE42WFVQcnIrRTlmM2djaU03TXVPcmhWV2k2ZzEzb08v?=
 =?utf-8?B?cldoM3BtYmZubk01NVo1SExsMTJJZm1DYWl4eEVUMTVSMExIQjA1QVZVRnlF?=
 =?utf-8?B?eHVZT2tXS0J2Y2pZZzZGMFhKT1BOTmkyeXdicXpuVmFjQlFtV2RURTFQNGJE?=
 =?utf-8?B?N3c5QjJ4bUh0S2VnRmd5SmlMQnNaYmJZNjN0TmR6bXdOUXBBdUdEdEkvYkov?=
 =?utf-8?B?UFpDdDkwR0NtVXJsNGNxUTdnM2FYd3Q3LzA5WE1uK1hqdVJGNnJFbDFqTVlv?=
 =?utf-8?B?SUtlb3locjRIRFBpZXd2RFJjZEFvRE56RkxHTFhNL01uSlM5K1NJdEZaSC8y?=
 =?utf-8?B?Qm5BSzZWMkowUUdGTU1URlJHNXNnZG1ScVJqaHVjY0ZlMnFyNlkxNnhxV2FF?=
 =?utf-8?B?Q2p4UTlpbExhL0gwb0h1bnpqVW90V3YyTEYvTE1WaTVQQTJCb0pqb0ZlK3dx?=
 =?utf-8?B?QllaQ0R5U1kwUHZkN0J3OTRyZzF4aitWUFNzSWlNcGt1bnJvN09obGtzbVk3?=
 =?utf-8?B?NjFYWllmTElKZnJzaGlYc3dlVHAyOWJraFlES3A2RENpekxERUNnR3ZrSXdK?=
 =?utf-8?B?S21naWhFK1VNazM1d3luT1h0M3pHL1BLUmlZRGhHc2JTandyclF2MmM3eUJv?=
 =?utf-8?B?T1N4c2IydlRTL1VYclJUaGZncE11ZnBrbFFEYVNXUXhqWllRekJPZFVYZWNp?=
 =?utf-8?B?ZHlPM2VucS9WL2lRZ3haMS9DV1NrMDlYQ1FTaUJJYkFtdUdnRHhBa1B3L2M2?=
 =?utf-8?B?OWpROUJ1UDVMQ1A3RmR4aHk5NndJd3VVU2psTSt3Rkkwckt4L3RkVGN4TlBy?=
 =?utf-8?Q?yXPCa+l0q0gLI4Wz3QKhJESUZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be4518c2-1668-4c6b-986b-08da75181cb6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 06:19:24.9458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCrqRA12AoMbsw7RwG7SQAAQRVOqQi6kCxGtzM0jq3bylgEeeGXUiJNOm0cwIwsyngIIDLb9MtIjLxsbuY/DNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3090

On 02.08.2022 18:08, Dario Faggioli wrote:
> On Tue, 2022-08-02 at 16:56 +0200, Jan Beulich wrote:
>> On 02.08.2022 15:51, Dario Faggioli wrote:
>>> If dom0_vcpus_pin is used, make sure the pinning is only done for
>>> dom0 vcpus, instead of for the hardware domain (which might not be
>>> dom0 at all!).
>>
>> Hmm, but the control domain may not be either, as it's derived from
>> d->is_privileged. I think ...
>>
> Mmm... Right.
> 
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -575,7 +575,7 @@ int sched_init_vcpu(struct vcpu *v)
>>>       * Initialize affinity settings. The idler, and potentially
>>>       * domain-0 VCPUs, are pinned onto their respective physical
>>> CPUs.
>>>       */
>>> -    if ( is_idle_domain(d) || (is_hardware_domain(d) &&
>>> opt_dom0_vcpus_pin) )
>>> +    if ( is_idle_domain(d) || (is_control_domain(d) &&
>>> opt_dom0_vcpus_pin) )
>>
>> ... for it to be strictly only Dom0, you want to check d->domain_id
>> here.
>>
> Ok, I'll send an update that does that.

Well - if you agree, I'd be happy to make the change while committing
and then adding
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

