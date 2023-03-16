Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293186BD5AF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:32:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510716.788943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqWx-0007hl-Nd; Thu, 16 Mar 2023 16:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510716.788943; Thu, 16 Mar 2023 16:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqWx-0007fD-KW; Thu, 16 Mar 2023 16:32:43 +0000
Received: by outflank-mailman (input) for mailman id 510716;
 Thu, 16 Mar 2023 16:32:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcqWw-0007Pa-BU
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:32:42 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c24d166-c418-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 17:32:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9131.eurprd04.prod.outlook.com (2603:10a6:10:2f6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 16:32:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 16:32:40 +0000
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
X-Inumbo-ID: 2c24d166-c418-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu2+0z//gFUQXWvfpTMgksh8yZEhbHz6Yk02d+8K6I9paqk3UdF6xH641vgvKPhPwFf+flb0+tGs286VuxYgb5DaYY4iLN0ScCxAs7E3w4jMyQ7Ju6IQxfWzSXLF2OTV2Xp3Dol5ruO+mVEEKO4IU7JTLwWeXaDQGtFPLcedCbbn6iJL79x4YWRxzLBnGGS/fkV5nVXpwOPnw+s7gaW6OQg1tSkaK4kPqb1fckNPj/f6N/Mg3twx+/HO/mtD3+1A2fyVMutIbzFJi9LqmxO1AKvmoWgVGlnxkpxxFY7TKUwWLXNsv8jVt8+GWTfqcsdGEFnNcJWuflsd4eVKYxcKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5A5UClfPp3pJqednDcydShOlj0zF6zB+PI1wCzxjUo=;
 b=GW+ywiY7uJzi3hPe5q/O2rhi1VfCCWQ53ewqr0gbWHYKHpBYpeu4hR8CXZzOS6Fq9iYCE8czDF7Q69q0hpATUM4+5eJhqFUKvwwbAmjpcyGgCIAkFzI+ET31JAAMoFP7tWjW/ZYLwzNRTbW8inspdeX0/rGxNA8AIGS9U/kBPC5z9TmiNwjq1y8GGpQri47bQ63GZ1B12Wnoz24SSG6NL6Z0w0EcZ4UmQrzF8pX8I49xIA9B5wsVLn9Q5PUFG8TmSMzvkxWAocg0cwIEMWeckLI3KEivKbOnEYw2GC7sZTtWIzoNkeSDkXmDDhKsz/FGMGdGYWh/PFxo4BaIyyUTkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5A5UClfPp3pJqednDcydShOlj0zF6zB+PI1wCzxjUo=;
 b=O1AMC3t0YZ5itiWDXJZD2iAlxicE0Hg2eQyxOar8StOOhh/yaw5AM6UyvHgDB2mlXw7as8nJrcut4Ex9e/wq4C1Jrx5AZZb0IWo2BpDQB9TN2rNA4pkXmyfVhGgV/HDhSk3wyN6XdzuxODRWhUOMCYt4jpZfTtawmseOacPyYwIcTgqsWNLaN0V+IqeY8KGWcuMF7SgmCNiWFubB89aN4jaGFJ4MIwEXvZFzACTWmKtAHNmnYkM+1dxZqt54oj6rc6hjrPPHlcJNcSAL8jZQVIBSp6uhoQhIckfoCnGSOm6HwTk5xAiHY0h+LBgfp79ADcGqTGuFmsaDdFCLMT7UJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc31ee54-b6ce-3251-ab0d-487d9a9bfd35@suse.com>
Date: Thu, 16 Mar 2023 17:32:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBNBhS2I4XWkwXr0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBNBhS2I4XWkwXr0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9131:EE_
X-MS-Office365-Filtering-Correlation-Id: f139d23d-05b2-4db7-0f80-08db263c0f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gL0zfCLsGyFvorTz2u6k5yYTzy564KmP+lfEvjsyj988unaNSvEmX+IFIGwEuy53QX9RJjgdTVxRJlgB+QfX+0Lc3iYfNZFGluT0Ztmg6Vr22JFOXbOxxHu0cBdWs5OyHvdpB3fuXeuBQ5QsE98xwqyDpArv+92vn7kIuHS1QZe9Nw9IHxeCcRMCCEK6NGwqkWbyJGDvIq2p1ZBmVHqPeQI7RDhiOKydvtGnHq39TmJYT9vs+6NVxgqzpKGFk/OhJ/lgQhh609GRcfpderSpZ6hC2PwwpwUIs20er3Ft3xQMY0g+B1zrbMHp+Sfrxf3px2HygTE2i987gjAALHqw9h1aZW7xoEZNwsZbj0MJXj/BJf05zLUNk7cAy7FE4Zu0O2g21Z0nR0+pujigHOmZth+u9Wo+ItgWQNyTJZ3rP7jfl46GTTBo2dV/tL4C2D6jreM39C/8Hv20Bx9P9F3GsBKkdUcBeX/RTwMzPbQSrNT0/CZ7huSubeM2BEhtM5mvxF1OlwtXxhUEEjD77rWzJy4zzhF2XiBTeVylG+7LFMmjFCc28v96Na0qA1Jx5J3ovhuzDWB28y+VG10JAWC/RA686PsMBtrTYGMC9/nhd0vJ9B9Q0/QLBvblK9M7xaT4x6z+7veYOJunBpH/SWwpxAZOXqClYQBGdj1HiSE12i0GwZrxoVyN+5VteLgu3oM+bunalBbaXU/cCIQIuMOJEx/YLXmI6kyhHXTsWvcF0AY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199018)(4744005)(186003)(5660300002)(66556008)(66476007)(66946007)(8676002)(6486002)(6916009)(478600001)(31696002)(4326008)(54906003)(316002)(86362001)(41300700001)(38100700002)(26005)(8936002)(6512007)(36756003)(6506007)(53546011)(2906002)(2616005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmN6Q0ozM3NSbTVpZm5sTit6bGozQUlYKzA5VHNlODM4M0ZtSyt6NmR1enpW?=
 =?utf-8?B?ZnhOaUJRRDJ3MUk0OUFYNVBpUTlScXBNTy9PYkxubkE1TFdhVmR0bVJLVVVo?=
 =?utf-8?B?ckZsZ0ZRRHFibk04bFhUQWgrMWxIZVJVNjlpbDRhMCtjYkMrSUwvQ3VuU0pq?=
 =?utf-8?B?WmxyMk52c0NudUU2L2VWbEpwTUFlTkNxQ3ZzM0JoMjNjb2RVanFld1V1Tkhi?=
 =?utf-8?B?cW5wV1M0ZlFuMEtWeStpOUYxbEt0dnRvbENpck5XcnRsQlZzRjk0aldyUllM?=
 =?utf-8?B?bitIRTNNbGZobFM2RldneXk0UDRUNm44a1hqRHo2OVdDSlJ0Ykk1bjN1Sk5Y?=
 =?utf-8?B?Q3hGTnZ2Y2dPSVhxeVhYUndWaExxKzdMUVFDQnBXZUZlQS95Y1IzbUhQWk5j?=
 =?utf-8?B?SXRpaWtjazc5NUNjWGtpemFPdlNsRVdJOGs0UG80VmhhWTlsYUcvNTFHVkhs?=
 =?utf-8?B?d2Q2Q0x2RWpEZEhoV1ZNWGg5MG00VkhGQWpValpDVE01L21iZFlxWGpSSG1k?=
 =?utf-8?B?dlVNeGRPcFdYcU5sOU4xeXE4RDhNcXF1NzVkb2RBQTg5eFBFVlY1NjNOeFdy?=
 =?utf-8?B?Zm8vakJkS2h3bFlBd2tyUFRCcjVXRFpKM2QvQUtOSFJaMDBHRGJBTURibGcx?=
 =?utf-8?B?QnB4OGpUeXRKcHJpRkJzdjFOZURHVVZUVUdCcFpRNUNnS3l4RGZhcE9yV085?=
 =?utf-8?B?SURkbGJMTXBxd0hVQk5iV09SRjZhYm9WQ1NwcTJZSzE4QlpCVWJqMUpuV0lh?=
 =?utf-8?B?VVR3VXhqMG5IbHFOZEhQTTVPVGdDNjcwYTRtK2l1Vi80aU96ODVKUWRjbE9N?=
 =?utf-8?B?TGExR3pBQXowZ0RoWWF0dS9PUU5tam9wUC9OeXZqU1FvWUlYV0R2UFVoVWUx?=
 =?utf-8?B?ckFwZDV5UFVSK3lzWGVuZDFPdDZhdkJuUVdRSGVmell5NUZpalVsQUVaalpN?=
 =?utf-8?B?ZnZtRE5nOUgrcitQbUtjaE1PZTJ3RXJ2YkN5dCtpOGVjbkZIZFhpVjJDb1Ux?=
 =?utf-8?B?MVd2emZid1JQNVFZSnpRUWhuK2RGOXorREpCWjlSN0c0Z3A4VkRlcktBNHh0?=
 =?utf-8?B?Q2l5S2lycWFtWllFMHpTdVpUc2ZiS1VyclcrSzZNMHU2TFdVZzJOeDBQRzly?=
 =?utf-8?B?SG9VeHZvTXl2dTl3OG5CUFF6SnozL2VMZEFWb0tjaHg2ejNDUnVlUmtBYTJB?=
 =?utf-8?B?M0o4ZEhLdThNWmwrbTV3QzVEd2M5RjhCUGUzaktxUFRhT1dFSS9FLzdsYVdB?=
 =?utf-8?B?SHhPOG8wdWd5d002UlNoV3pSV3BaVmxCZWJuWUo4Z3JFQ2lhVnFiV0VraXFL?=
 =?utf-8?B?dGFabk44MDJzOUZ1ODA5VVpDeHhEVjV4WFNrNnZ6OGpuenZrVy9UaFFNK05j?=
 =?utf-8?B?MW1BRFFBRFlONjZyV0VNNmp2RmlZcnF5aGdrbUp5NVMvZGc5NytSK3VvSlYv?=
 =?utf-8?B?WGxRWnVQaXloWlJIZHVoU3lOSHcxRXNPT3oyT1dkWXF0a3NoaU9EMGYzZDRU?=
 =?utf-8?B?bC81UmJob1RtVG5aL1lrS3ZWNUdjcjYyK3d6WFpHQXZFTVVJNUhmNk5ZdHBH?=
 =?utf-8?B?cWVyRWVmWmlHT1d5bjZlV0lpZzdydENHOEorcWtnZFBTUFl1aW5MYUE0RWE2?=
 =?utf-8?B?R014dUhUcnRBV21DaHorQnlsNmllaThzMGdNT3U0ek05K25UWEhVUjB4L3li?=
 =?utf-8?B?VlBFQ00wQUFmTDRqbHoxNmZxQVg0SHBzbnRJQWoxUi9qbFdEcWpQRUxYZVNU?=
 =?utf-8?B?K3h3QjBTc055cEV4NXBJeDNlWWFydUtpUVVIbjVseU11NWtRTDBKTHh2K3k4?=
 =?utf-8?B?dUJUalU3ei91UnFJNVJVSW9VTVkwdlVuMzRKNDlkODZhb1lveUdzSFR5MmE0?=
 =?utf-8?B?UlJ1UjZTK2NEMHliM08vLzQ5Wm9zLzk3NG1ZOVcrWVhsdTBwbDJQYjh5VnlF?=
 =?utf-8?B?UStQZkhNV0pmRDhqeGRycmJEZUFvbWQwV0QwRU5tNjV5OVl0T3M5TmhHRlZP?=
 =?utf-8?B?YlZRWGR3Mjdra2Zpbjh0YVZObFMzUm9pZG9IbmRVTVhvbFhmNkJwY3NZejU3?=
 =?utf-8?B?ZkxLSE9GVW9ERXY5aDNnMC9VVWtFZXVJeXRaT0xXR0ZMUmNlYktGTXZqaCtw?=
 =?utf-8?Q?HIF1xs/6Eqc4wLv/21pJp2inp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f139d23d-05b2-4db7-0f80-08db263c0f65
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:32:40.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mbBnrsLh7h4DY9/2jWs+HvREN3EYulc2i/5hKzhUf+ZcfaOafTgIyJjTmM9GcmWGkwOYJLlYaQF2bvCBrswMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9131

On 16.03.2023 17:19, Roger Pau Monné wrote:
> On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
>> +static inline void refcnt_get(refcnt_t *refcnt)
>> +{
>> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);
> 
> Occurred to me while looking at the next patch:
> 
> Don't you also need to print a warning (and saturate the counter
> maybe?) if old == 0, as that would imply the caller is attempting
> to take a reference of an object that should be destroyed? IOW: it
> would point to some kind of memory leak.

Hmm, I notice the function presently returns void. I think what to do
when the counter is zero needs leaving to the caller. See e.g.
get_page() which will simply indicate failure to the caller in case
the refcnt is zero. (There overflow handling also is left to the
caller ... All that matters is whether a ref can be acquired.)

Jan

