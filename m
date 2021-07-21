Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4563D0C9F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 12:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159289.293009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m69wd-0001GJ-2t; Wed, 21 Jul 2021 10:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159289.293009; Wed, 21 Jul 2021 10:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m69wc-0001DF-Vo; Wed, 21 Jul 2021 10:59:18 +0000
Received: by outflank-mailman (input) for mailman id 159289;
 Wed, 21 Jul 2021 10:59:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NGKG=MN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m69wb-0001D9-Dk
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 10:59:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15dc2d3c-f7c4-49f8-b70e-d8ef9e6936bf;
 Wed, 21 Jul 2021 10:59:16 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-Do36xDM4PoOlDYB_VSui4g-2; Wed, 21 Jul 2021 12:59:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 10:59:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:59:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0066.eurprd07.prod.outlook.com (2603:10a6:207:4::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.10 via Frontend Transport; Wed, 21 Jul 2021 10:59:12 +0000
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
X-Inumbo-ID: 15dc2d3c-f7c4-49f8-b70e-d8ef9e6936bf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626865155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZcS6qNTmj+1KFX+YXV+uvS1LceQ36s3bsqn1RaEGSc=;
	b=jKU4ebGCOY28i8WbluWsfgL3zCZ/xRZslv4UvRmyXM1PzFzrdg+Hi4+lKMNDaThrfJwGV8
	I8I6EmTGy9rGVnXyyeegHfejharNUYwzV15zjDNPsMDmOc7qpWWHxk50tIj2thULciVMJG
	miWqWtVkfU8bqMBn6jJo5XmTkQ4C56w=
X-MC-Unique: Do36xDM4PoOlDYB_VSui4g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwEuX/hvTNQTEoW7io1neYJWAI2c1tZP6rSgNUM4yKwJqh+tqjAi3Px0LKZtRSswAqrFQdKhTmMWUm1uAk01W7XtrirRxnl+iVH1Tr4ws1wWdPoVQ59qpfwFc54iiFY3gG59MKsaTBYGp0QbHgWkZiAU+0+Bjm1HOrBRUFcn44LQd665/T+lqc0O9xjStRSZXg6Pnc/Zu56kkz56wjIyOq0SpJIhiEKcpbhBIYX251osmWziaRw2he2YjYQR3nhp7ANr6dLj5fVtP0+PK6aKveZ4/ckFRP7sWguHHndBzSOWT7TbyCKw6/SJl+0DdWgaxhqlJACPsEoTVF0JqYaDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZcS6qNTmj+1KFX+YXV+uvS1LceQ36s3bsqn1RaEGSc=;
 b=adlbtrkwfIWSTHJEc2eYlsOxr4d10AXe97bRU4VcU/DIvWrj3p6lk4RSDm/PpNc+wJKzp9rpazMYkT4W5M/rRv8kFR6Nb2mk48UCNxamtUV7JsuQstSka8grDf6t+oZQLkqRt5x0LMW8e4bvfmHuOQOtEEnb02vCUwSYu4RW+U39vT2VmMD3pyzHQgJc/UvhbpijcC1+TUUZrA9UJs4Ln2r6uaOZ9uepdnQtx8+SbDMKkFhYnQ7Gf9itrIy3Mnr4Ktsb6jEGxV9rER7IKy4WGCYhrCk0rLZGBnjeM1uT3IP9TZb+gxiSx7z8SqM+chLDnxO1QDZ+UF9XjeXKhwULdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: xen 4.11.4 incorrect (~3x) cpu frequency reported
To: James Dingwall <james-xen@dingwall.me.uk>
References: <20210721092958.GA2502468@dingwall.me.uk>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
Date: Wed, 21 Jul 2021 12:59:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210721092958.GA2502468@dingwall.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0066.eurprd07.prod.outlook.com
 (2603:10a6:207:4::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5464e0fd-82ce-41ef-ca60-08d94c369330
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532563CDE4CAC52075E39C7CB3E39@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LKv82UoyHvEGugzyj330FuTXjJFnGZ2SxCxjKkMNIyKEce4wNyiP9BhpLgJ065WM784mkFbUUshPGAy0/DQbJsPOz1CicT9PIGmxaIPLuZR+7cW3UtBfvo/GpoO+nez6UKCTvwXCcoPoNBYYZ/PRtOsNAQrH90/9vNUOuRRNE3e/F8C/sP4IHCNKyAuWswy9NpSzz3SUsPUKb16JLuQxd6irrjXcb0vgvLrMPZgOAoUY89MMLcGA5CDH4ysxtC2r/kjxM7W5/dd9sWe0Y2Up8ELfFnZ1UjqQwmZyG4BWFXjmsxylCiGu6MIf9MqEcGZY1JU+5QgvqQYzM1t1aN8pxNzHap1rgBqmuAbRz6UIrVAy7Ol5vKvgg+1nBIOsFozUCURjwvzKPUOa3iPgIQlUqF+bBW60563lXYlby5bDwrYsYZDY0T+Eze27UZ53M3WvJwhOw62kYocHv16zQHoGuZx/WfXmIVPwpowqvsRpRDMhGoLWYyJ1lkClQ/oiHZKPBkuvzGZrPQgipwk6IKXLw0V0Q16DKiPIvARaTKMUpFkDVJpZ3LdX0aKE9YfMLrLgj/vt0MTIqeYoPYUZvyp9tP684vbnTz2Ur1hHPpI29s6/oc7MYhre4NzSMq0wG1yMHidJ+mN9q95LHj+4raVh0cfC78kuR2m7xgobqKV2teyEFCdA8goSAYFJ7W+iblBQlsFV0awkhAXX/PtAH3YP1kntvIZNx2uVvtgN7oSqupU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(346002)(376002)(366004)(4326008)(8676002)(8936002)(5660300002)(31686004)(26005)(186003)(53546011)(956004)(2616005)(478600001)(36756003)(6486002)(31696002)(66946007)(66476007)(66556008)(6916009)(86362001)(83380400001)(16576012)(316002)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2diSUorK0hnaFRtcWxablRDWU02UW1TeGU4bHpqdkNHL2tTNUorbHZ6cmxR?=
 =?utf-8?B?WWZMcjJrVmJweWY0ckhIZXJPWFlHRVJ1MGhnd20xZHV5NUZ0QjNIcGhweTA1?=
 =?utf-8?B?UlBobTBiemQrM0M4Q2hKdlBXcnpaWktSeCtwUHk5MjQyRFU0S3R5YzliaC85?=
 =?utf-8?B?M2x6YWhDMHozeWV5bWJ5bUpZTGV0cTZ3b3BvNDBuRVlxUTQvZ0Q1ajRSWTRi?=
 =?utf-8?B?ZUZ6ckliNE43Ui9pNVdFUTExc0V0TFczVUpVeFltWWdCQWNmaHNSRzdHbWxM?=
 =?utf-8?B?UUg0Z0Z0L2Rsb0VSQ1VzVGtkRlRjd0JGeFVGeHZvTndaSUtkSjAxa21FSWVE?=
 =?utf-8?B?QlpOUUkzQ1lvakhKemZJNTQ0OVJiSnA5WlVIazU3M3RJTmVNOENJV1Z5YUdU?=
 =?utf-8?B?VGd3bFdwc05kdG1SaWhrSlJ0aG4wOGUxdmRhUXBUMkRrUHNXY3FaMC9nUU9s?=
 =?utf-8?B?dUVIOWVXbTA0WVNsMlQzb2dxWlVGbW9pU3VUaDBXS2M5V1NYWVZBMmg3TzBC?=
 =?utf-8?B?THRWUGZGZy9RRjhyOWV5QStPUndUUzNWQUxBNG1qUm1GREVyWmsva04wdjFo?=
 =?utf-8?B?OFlNU1lLWVJLNGE0UlVkM1h4UDcveWlYaEQvNXhYblNhN3hCbHIrdEpTQmZZ?=
 =?utf-8?B?VFhuenVBNzIvRGFlb1kvbzRJUDBBdVZuUWRmcmlVWGc3UFdYSUx0VVFadjZv?=
 =?utf-8?B?Q0Vud0RiREhNcmM2MzRpbEo5YmMrdm5xUVcyRldUMllybjdaeE43aGd3L3lv?=
 =?utf-8?B?R0Z6eW1Gc25ybGtNMmZKNU5nOEZSelRkL1lMSEY0THB4RnE1WGZ1ZG8wYnZs?=
 =?utf-8?B?K2lYUjhkYTFTU2poZk5uMHVsTUFxbTZBRGxSaXloTlJGbXhkSVpqckVIVDZo?=
 =?utf-8?B?SHIrV1NsVVZ4dzJlbmtKTFFUTk1GZkR2ZGx5bHlvaW45MWF1K0xISlJoZk40?=
 =?utf-8?B?OW5KWHJvTWt4U3BtT2tWdXJEUU1ub3RORk0rTHZvcGVUci9HQzBUYkNkWnJ4?=
 =?utf-8?B?UFVsQXJYQnRPK2F4Q1ZsV1ExZzRpN3lIWUQvWDJBN1lxT1hQaElDOGg0c1J2?=
 =?utf-8?B?SEU4QVdHUDJYbHlEUlBacnBaa1ZveDVmWW1HWFBCSlhPRXJnbzVROE5RMXFI?=
 =?utf-8?B?RG1USjFlK1E0QVZ4eTRINWVZUWZpZWRxNkozLzAvcGY3NEV4QWgxUmJvREVY?=
 =?utf-8?B?M2pkdVdCL2lCbi9oL2J2SE9kcm1NbnFWMkpLUVJRZGNXRVFLRzNVNTR0eEVN?=
 =?utf-8?B?WXVNYXdJNENrMWp1QkNmQTlDZ3VDSWlSbE5hdk9lcXZ3ekNHenhBMHU5U0l0?=
 =?utf-8?B?NzhtZExFWTRmVHZXN3NTYU5jWGtHN2dHc2ZUaGVOU1IyV0tvY1hFKzJIckUr?=
 =?utf-8?B?cWRoYjFsZXE3dHRFcS9vZnZEcVk5N2xpbFhJZkV4a3Zpcm9mWHBydW9jRncr?=
 =?utf-8?B?SS8xRE5Nb1VIUEo5b2V3eG5NOFFSZmhad1B6NTlrM3FtVEV3ajRPaTgvWENo?=
 =?utf-8?B?WVdMSWhyaEtVL1Z0bkpFMjNVd1IyWGVZS0s1emQ2eHk3SVlCYkc1ODNQS1Q3?=
 =?utf-8?B?alhSdFVqQlRZQXBTMFVibjRIYlB4SGFKRHZXbUlJcXpTODY1WnhjbVpvVzIy?=
 =?utf-8?B?SlRGVjU0WmI0L1BzZUM5WlJjeWZKc1BGQ3dXNlVGZnhrQnRNdnhuSTh1dnRr?=
 =?utf-8?B?OWI3MEd1R2pheXBabS85WXoxTWZwU2RRcndXUExBUGFlUnMwSzBORjYwL25G?=
 =?utf-8?Q?VuGR9mdP9qN904OXBnAHxYSYvTVGdTiCamyyip6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5464e0fd-82ce-41ef-ca60-08d94c369330
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:59:13.2388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEf0LQWsYHQzzQqzt+AIs2RGUevIiRox+fs5ZuvqvZ4vS08v3jGQR2aJSAvnavSIjJfkO+2sRXltYNdjtWO/xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 21.07.2021 11:29, James Dingwall wrote:
> We have a system which intermittently starts up and reports an incorrect cpu frequency:
> 
> # grep -i mhz /var/log/kern.log 
> Jul 14 17:47:47 dom0 kernel: [    0.000475] tsc: Detected 2194.846 MHz processor
> Jul 14 22:03:37 dom0 kernel: [    0.000476] tsc: Detected 2194.878 MHz processor
> Jul 14 23:05:13 dom0 kernel: [    0.000478] tsc: Detected 2194.848 MHz processor
> Jul 14 23:20:47 dom0 kernel: [    0.000474] tsc: Detected 2194.856 MHz processor
> Jul 14 23:57:39 dom0 kernel: [    0.000476] tsc: Detected 2194.906 MHz processor
> Jul 15 01:04:09 dom0 kernel: [    0.000476] tsc: Detected 2194.858 MHz processor
> Jul 15 01:27:15 dom0 kernel: [    0.000482] tsc: Detected 2194.870 MHz processor
> Jul 15 02:00:13 dom0 kernel: [    0.000481] tsc: Detected 2194.924 MHz processor
> Jul 15 03:09:23 dom0 kernel: [    0.000475] tsc: Detected 2194.892 MHz processor
> Jul 15 03:32:50 dom0 kernel: [    0.000482] tsc: Detected 2194.856 MHz processor
> Jul 15 04:05:27 dom0 kernel: [    0.000480] tsc: Detected 2194.886 MHz processor
> Jul 15 05:00:38 dom0 kernel: [    0.000473] tsc: Detected 2194.914 MHz processor
> Jul 15 05:59:33 dom0 kernel: [    0.000480] tsc: Detected 2194.924 MHz processor
> Jul 15 06:22:31 dom0 kernel: [    0.000474] tsc: Detected 2194.910 MHz processor
> Jul 15 17:52:57 dom0 kernel: [    0.000474] tsc: Detected 2194.854 MHz processor
> Jul 15 18:51:36 dom0 kernel: [    0.000474] tsc: Detected 2194.900 MHz processor
> Jul 15 19:07:26 dom0 kernel: [    0.000478] tsc: Detected 2194.902 MHz processor
> Jul 15 19:43:56 dom0 kernel: [    0.000154] tsc: Detected 6895.384 MHz processor

Well, this is output from Dom0. What we'd need to see (in addition)
is the corresponding hypervisor log at maximum verbosity (loglvl=all).

> The xen 's' debug output:
> 
> (XEN) TSC marked as reliable, warp = 0 (count=4)
> (XEN) dom1: mode=0,ofs=0x1d1ac8bf8e,khz=6895385,inc=1
> (XEN) dom2: mode=0,ofs=0x28bc24c746,khz=6895385,inc=1
> (XEN) dom3: mode=0,ofs=0x345696b138,khz=6895385,inc=1
> (XEN) dom4: mode=0,ofs=0x34f2635f31,khz=6895385,inc=1
> (XEN) dom5: mode=0,ofs=0x3581618a7d,khz=6895385,inc=1
> (XEN) dom6: mode=0,ofs=0x3627ca68b2,khz=6895385,inc=1
> (XEN) dom7: mode=0,ofs=0x36dd491860,khz=6895385,inc=1
> (XEN) dom8: mode=0,ofs=0x377a57ea1a,khz=6895385,inc=1
> (XEN) dom9: mode=0,ofs=0x381eb175ce,khz=6895385,inc=1
> (XEN) dom10: mode=0,ofs=0x38cab2e260,khz=6895385,inc=1
> (XEN) dom11: mode=0,ofs=0x397fc47387,khz=6895385,inc=1
> (XEN) dom12: mode=0,ofs=0x3a552762a0,khz=6895385,inc=1
> 
> A processor from /proc/cpuinfo in dom0:
> 
> processor       : 3
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 85
> model name      : Intel(R) Xeon(R) D-2123IT CPU @ 2.20GHz
> stepping        : 4
> microcode       : 0x2000065
> cpu MHz         : 6895.384
> [...]
> 
> Xen has been built at 310ab79875cb705cc2c7daddff412b5a4899f8c9 from the stable-4.12 branch.

While this contradicts the title, both 4.11 and 4.12 are out of general
support. Hence it would be more helpful if you could obtain respective
logs with a more modern version of Xen - ideally from the master branch,
or else the most recent stable one (4.15). Provided of course the issue
continues to exist there in the first place.

Jan


