Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C15694310
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 11:42:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494335.764370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWHQ-0005jP-LK; Mon, 13 Feb 2023 10:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494335.764370; Mon, 13 Feb 2023 10:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWHQ-0005gs-HI; Mon, 13 Feb 2023 10:41:52 +0000
Received: by outflank-mailman (input) for mailman id 494335;
 Mon, 13 Feb 2023 10:41:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRWHP-0005gj-LG
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 10:41:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05dfdbfe-ab8b-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 11:41:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 10:41:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 10:41:48 +0000
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
X-Inumbo-ID: 05dfdbfe-ab8b-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVnMwudzifh3qrS8PT+nZ6ldhHBCd77ruMZercGpkupxX8peduDyA86gGSbG1ZZca/TPJm+rxbM4rqKXA2yB3JiDQZnlTTz3NcdaVq6b35DusgoWenSHnADXP7xGwD4blePN0RvbD500VfarA1NsKz+0vOjYIdEAy+jRWFSnpe20ktoUG+Fe78F/VeP0IyVoDy2bvznZBDlG8rlgAnwQwZmTEM9uGO7GLzdWMdQPLQmC5EFmPR07FyaCW4KUsFaxGwfqKXVh0Q943z6hquzrk4QqBX6yyEWWxKq2IIMX7OFufErsZ0VrkYRB40kv9jO/Rp8o/obREK6/kKBqAnsjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpJK4eE/EBvGTE5bNTsY4VYJC3L1bXoChiUA8fT0EGA=;
 b=MVwclZYXOtG53jVZWTkOolJLTUmcZFBxzB+jD7vO4gmpcsHTBQwQ34IzejunKwzuvOS+4uKtDiKIu1SKykWH/0qQk0i2nKcguPyEZlxYBtffrwpBnXRoAT4cckXM+CVff8/DXNM2lACAxQ2Iy+Oqz4tJ2qRKbvm3y/yyYTM3Eoj4CzQ+kdwwImuM+oe1R9A/AOKydfZHuzmL8G+SNe1x37HT1uROoekA9O1PFXzvqtlq+N0kIRsxKEXv2ocHcdHdxPZGnXPvf14z7nzt+PS6YBYKKFxmYUlMeu0CGFxq5nc7OaVYxFbbFaFavpQddjGIGCgyn41Q4W3WpN7tdxJWaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpJK4eE/EBvGTE5bNTsY4VYJC3L1bXoChiUA8fT0EGA=;
 b=fOreX5PA1XMnsrNDO0Q3THphp9w/jS4CcogZlkmJtt6Zw+soRadkastiBQFnx+DJcOtIAJ+haeMdLEeeBCWkYQJqh0Vn9zJn4d+IKgMuzw2nr6Fr+HWAe7Up+tUYHqRZ7trL+Z4e/4ZDAt0jz2E/oOilWyahf23+2ckCusD2cD+wiVEGoCZ+38oDGCbkgecWY76OuCawmDeIJ7VbyxGgXvprHYBSN3oweu8ApSEMGVMe2ZXDEIuxiHsYVqPuoHeWabXxv8hUOkTQfj+YkP5jQEpK+5lgMwNbe0VPXPPLzlHTfxY79qaZYOwDmTcNxytAJB+lzZUwyP6XzJ5dqT0MIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb0a4263-3168-1aa1-48d2-d3d20deec02a@suse.com>
Date: Mon, 13 Feb 2023 11:41:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH_v2=5d_xen=3a_credit2=3a_respect_cr?=
 =?UTF-8?Q?edit2=5frunqueue=3dall_when_arranging_runqueues?=
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20221003162158.2042-1-marmarek@invisiblethingslab.com>
 <7f453f08-0bc5-04f8-02aa-0beb0f0f3b5f@suse.com>
In-Reply-To: <7f453f08-0bc5-04f8-02aa-0beb0f0f3b5f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0074.eurprd03.prod.outlook.com
 (2603:10a6:208:69::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: d5428da2-1c60-41e0-a250-08db0daee8c4
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bqjp/tNm6qj2TkZeMugth1y7+EiIkFcPnruCtElUmyl0BNozU7x8Ymw07hNPHAhxfby5XiaZKL8r8UZ5uyc42xlGRnnOWGPH7RIYEiYFPZ2DkyF0WZkidBDhCtSnOVW4ysPQVlX3RUx+MqNk7nJSqfVoGwINIbb4Vbh9jLWTVhLjXfBvW6mpXSRHJZeJhX970knyBtyFHTAhUlUbpkyvSjSi8XUqRcGtRdzpMNwzFDNsaLjtK6nWbyH3oWZQDL4h7Hl8QhjykDYRWDP5U39U/+ZJhPu4rruVkhQGl8u3rYbFwqqc1bUknFwU9IAIFnlRJ+O/qpszJl4VvjyIzWl8+yPcdLgr3YrQpO2xpLkNg73ZZ2ibWMqFLlGJn+9eRqa3a0bBbXqtT4WI65gFFWgBTkdnfGd69j3Ko6QvaKeLsqQyysRavfYbY2O5A8HsPsCdcOzPCyr2SEqNEZd+IDPuvLu9hQ9IUnwVlkMbH6JG6igaYekz3mMnjQTSsKnRgLep3kfT9KUbHZxOQhRQ2TCLbA4WEr6/l8DBPLyr1BNFOHLvIlUNRNsTiyADJY9kDea/HTQHqAFqkk7tcRsiUzS4LmFKuYSkRqR58kpLEyc7dxlQcDxwDEdHZ4PJVAmTYW5Rj9SsGxw7pYNtPb9KUiZXSjPFhlJXDfCoDzDB8I6uexQFpwV4N2UNL45D510ojgJraXRD/N57humXE4cjGOpn1gRnyoud+tOZ9U9RMmRcNAc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199018)(31686004)(6512007)(66574015)(83380400001)(26005)(186003)(36756003)(5660300002)(2906002)(53546011)(31696002)(110136005)(6506007)(86362001)(41300700001)(478600001)(6486002)(2616005)(54906003)(66556008)(8936002)(66476007)(316002)(38100700002)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2licmtiV2k0K2ZqN0phYnZtcUlkV3RGMmhYUE15UFYvQy9aV3o0SGtqaVFo?=
 =?utf-8?B?QUJNamxiSDVhVUxRTGZSYWg3ZjBHUXpEemxtOUFIYnhOdFFRS0pCMVVjeTd2?=
 =?utf-8?B?UVVaNnZIUXpMbEp0cXVoNjg3SzkvWTVvVEMvVWZVWEJGMS9LVmtraXJTNi9u?=
 =?utf-8?B?VDJKeE5QbW1NUU1nMHVjWGpldE9Bc2h4ci9XcmNSSkhQY1F6TjdNZnoweFZj?=
 =?utf-8?B?UWZ0WWNaY3BzZFZ0U1NMaWtZNlhFWmFuTUQ1QVlGRWJpNTFzbElDWlh3dERB?=
 =?utf-8?B?WkhxaGZ1Q1Fsa3NuaU03SXE0ZnBiWDdOODJ5bzFzaVF3cVhyNmd5TUNIZGNB?=
 =?utf-8?B?ZVhwY2tFVlFmYzdjTlRibGUzMFRXNGZyKzYwaENVOUZNN2YvdkZjZGh0Tlhk?=
 =?utf-8?B?ZGFQdVJ2dll6bzYzYnJLYW1FWEk5TCtCWVB5RHRZSjlxMStQNHVDWXAxSjhk?=
 =?utf-8?B?ak9VVkJFZFFGRjRIdjRpOGpSeU42Skw2OVlmRGc2WExhcEZ5TUNDZ0VUcmJS?=
 =?utf-8?B?L2FTMEN4ZmZWc1I4YU5hUUloMEdHRWlaNm5yQlNnL1NITHc3ejZJa0kyVlJC?=
 =?utf-8?B?VVA5WDh3MDRGcU9scy9icXd3c0xWOTZCSE5tWTQxWCtFVk4wN3V5US9zbzV5?=
 =?utf-8?B?VHJoS2RoZmNFNTZMbmJHQlBWaFdaNnlSV01Uc3hMa2Jzc0E1eXJWVTFUOC9q?=
 =?utf-8?B?YTYvYmF6blRJUjh6RWtkUXJzaGJMNjZmNlNTQysybm5DU1kyaU5LODhiNlJj?=
 =?utf-8?B?dzR5MTJzcmNRekwrbjYwMW1LR1FhcTRUVEFlTzk0Zzl3NEUwdWdRTUF4TURJ?=
 =?utf-8?B?WTFwbmNSMUx1dlN0QXdnVDhtU1ZuZmIxZTVMSDBXNnNkK3J2Tm1OUW5YZUtE?=
 =?utf-8?B?Tm1jZE9vWEpEQ1NVbnRlVzA5QjBaS1BOU2FqUHFQVm5UNytiaE1HSlU3NTZG?=
 =?utf-8?B?dEQyWkMxRmtDeExNbUFRRmJpbk1JMUpCeXJ5UmptU2RTVVRKdDdiL1R2OGJm?=
 =?utf-8?B?aWszd0F3SXpUYWhWZG4veVY4QWh0YThBOHZabnl3Q2tiOWpPd1FMOVZrU2RU?=
 =?utf-8?B?dFRNYWZkVkFPQm9KMm1KN0R4b1dwM1dmcDJIMWRnaURnZmt1WHh1cklVd2dM?=
 =?utf-8?B?ZXFsVVpLK0RhL2RQNDVaQnR3T0hOM05tR1dqbmQ2ckdFTFFWSFc0SllJY0Jy?=
 =?utf-8?B?WnZoaWlib21pOGlMd0dUdmhLQzViSlRnYlFNeXNMOXllQUV1SmR2SStESjBz?=
 =?utf-8?B?ejQ5ai80NFU5Z0pQZk13bklLeFhLc1VjNElaK0NRQ0xhMU41N3BvQUhPSG5v?=
 =?utf-8?B?bjdGcy9NSCtSQlVLQkVnYmZRUmRwci9XbkFUZjY4aDBwTDh0Q1pGVklrQ2lv?=
 =?utf-8?B?Z1pLY1pXTTkzWGlrRGhnRFJBNVl4Y1ROM0IzT2k3dzIwUWFCV2tHYkQ5OUFi?=
 =?utf-8?B?WVNBNForUWN4VUc4bUI3NkdDb1RDZVcxOGJ5eFUxaUNRTFJwRHEvejJqZGlk?=
 =?utf-8?B?a00zZm1xVnB5ZGg0bVpBanZudkZ0WnNXbW1TcmJYMTE0VDVCTXVXUy9OT2dZ?=
 =?utf-8?B?YytzK01sZGhvcFUwNGNUQUd4aEdVR0lqQ0xOSDZ2U21veDFaenpPQmNXa0NN?=
 =?utf-8?B?cWhBZEtxMXo0SFpRZjEvQUFOY0VJMkdsQzMrbVM0b1doME51VUdqaDR6b1dl?=
 =?utf-8?B?dzROeXRnZXJmNWp4UXI4M2ZLNVBBUmZHUkdPeE9TU215Z0V1WHFEeDliT09P?=
 =?utf-8?B?b1BYSXZmdTQrZDBWSFptdyswakxCTFovNWNjSTFSWW5PZ29INm1lbmRlNTJw?=
 =?utf-8?B?QkgvWlZYdEpnKzNPNW51RU5pR0Z6WEs1SERpWnY5RzBkREFOdDB1am81dmtO?=
 =?utf-8?B?UjUvUmJzQWZ4SWR1aksyN0owb1VNTG1RTk8vUkNqdzE3RlZoUEt6V3dSUnVB?=
 =?utf-8?B?YnRTWTN3Uzl6YUJSajlOU2hzOUQ3dnl5MGgxUWwvUWRQQk81VXg1VXJOZk4w?=
 =?utf-8?B?YTljeEhpVXNtZW5LVFc4NFU5cEwxdHpIb2hLc3VINE16TGJrNjdDTVpoQ3Zj?=
 =?utf-8?B?Y3pCZGxESjlDV2FEUjUyQnpvaTNiQ2xYRVdhbVlzVENqOGw4MWhTZml3NUgz?=
 =?utf-8?Q?v5a0opsWUBZkOBEjxxAceOZB5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5428da2-1c60-41e0-a250-08db0daee8c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 10:41:48.5915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIiXSA8NXyIHyeZDFac8aAdtJLQCbszhXOjDOrHginwwmtdvay4xF/BIiY2IqKFM1Vf/AABF6G2ytszxP6XLww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790

On 07.12.2022 12:41, Jan Beulich wrote:
> On 03.10.2022 18:21, Marek Marczykowski-Górecki wrote:
>> Documentation for credit2_runqueue=all says it should create one queue
>> for all pCPUs on the host. But since introduction
>> sched_credit2_max_cpus_runqueue, it actually created separate runqueue
>> per socket, even if the CPUs count is below
>> sched_credit2_max_cpus_runqueue.
>>
>> Adjust the condition to skip syblink check in case of
>> credit2_runqueue=all.
>>
>> Fixes: 8e2aa76dc167 ("xen: credit2: limit the max number of CPUs in a runqueue")
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>> ---
>> Changes in v2:
>>  - fix indentation
>>  - adjust doc
>>
>> The whole thing is under cpu_runqueue_match() already, so maybe
>> cpu_runqueue_siblings_match() isn't needed at all?
>> ---
>>  docs/misc/xen-command-line.pandoc | 5 +++++
>>  xen/common/sched/credit2.c        | 9 +++++++--
>>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> George, Dario - any chance of an ack (or reasons not to)?

Another two months later I'm inclined to commit this with just Jürgen's R-b
(assuming it still applies cleanly). I'll give it a day or two more ...

Jan

