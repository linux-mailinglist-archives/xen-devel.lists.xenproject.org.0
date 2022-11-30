Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B6763CFC2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 08:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449748.706672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Hgm-0000Gf-7t; Wed, 30 Nov 2022 07:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449748.706672; Wed, 30 Nov 2022 07:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Hgm-0000Dz-4y; Wed, 30 Nov 2022 07:39:28 +0000
Received: by outflank-mailman (input) for mailman id 449748;
 Wed, 30 Nov 2022 07:39:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0Hgk-0000Dt-Ny
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 07:39:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d0e8f90-7082-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 08:39:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6782.eurprd04.prod.outlook.com (2603:10a6:803:139::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Wed, 30 Nov
 2022 07:39:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 07:39:23 +0000
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
X-Inumbo-ID: 1d0e8f90-7082-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDgnuEn8WwwnKFMQjf7zNSX6ccaz6Z1PSP7j/WcUdwvFXRYHE/QO+W1S4dZwLYg2+lmpSSz6G3p2ARvcItIcGeEqZWRHpvGmyakJS+a4lWLcgaug5WDksKPT0235rsf4tnD6vfV2hx7JA+Em0xFizaenBnL9K6wUOXZBmrdMkc6FWI36OsZtgU8Om06qQuCDT/7JvASwxEWQkdfiUteauT+YajZj/SekMcOv7jWb+A6Mgs1tFNb8slF67PVEh1tfVWoCH4LDJ28XEnm+4IYG67DZcdKgd1gwijFkdl8mVuZb9pmxzasPeHRYf+VWlN6JFODMDUXsBHW1O8mII9VkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/iYO3t+Q/vFu0QfApUI8gLnIPZc/JYavzXO2OLqJlY=;
 b=VzsEVg13pju5uFGw/U73enNg7uSSJad14boejVXAwHmqMKbw9wymXUM1f/wU1PUFX2FtJvYLhDrs+g8bUrOXr42TAfQ/QutgCWhtrR8Z1bj3yu7s+/YCBz60Mwn2ecajKOW/CXmav/2gp9SbRkliGIP3VHywOlErUPjC/xgdEH8RzKAe4Xisl4ASOySEZJ3zGhXdtOLrw3nEkP5LKU6mHYvReSu9OZmwadX+dyR/cwWVrisREmpyRMu/VgEcEoWxTmii5Sfb9vyNixnv4lw4B+d/ScS0pknFznXmzUndTYcP/CyRvMVOShw02bSot8kt2ARxGDllJpm1IPTMpz6cuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/iYO3t+Q/vFu0QfApUI8gLnIPZc/JYavzXO2OLqJlY=;
 b=iZFeTU0dKHiSEtAyL0HpogUrl91SSMBbEwM4QZKlFSx7LWhvnk+ChP+jkWEjKiYgBywziGK0qgUju4S27hHFnmSI1qx5F0+sjjG8rnbx/y5tw6XHRQCbu8yknm7ZMijLT72tJnJP4LTErzjzXTmq606T5wDeAWoqv3CVXpaJ7hSyJVDnHjCOSfFlR2pbICCtBqmEXQepS6GIGSyQ7jb8HD7tUszkcMAxfcyJFxu90Yj3+5mV288TU9WpC/u3uaunIRdS48juAYoyvqCEJBcId8UV9kAsBP8JGAnozN1DbYqy+0/t55MEl0fL07VxjwnnOdbdpcpriJZTjwvbAIJFdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dac803c0-45c6-4277-20e9-8a45781735b4@suse.com>
Date: Wed, 30 Nov 2022 08:39:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: drop stale check from hvm_load_cpu_msrs()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a1cacbe0-2bfb-e365-77ac-e4814067ce6f@suse.com>
 <48ace255-8b9f-84e0-cdbe-00c4fba309bd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <48ace255-8b9f-84e0-cdbe-00c4fba309bd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: ff467525-cf5e-4188-f631-08dad2a60001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZR9EF5XDw2IytNMVDU75u/mGAnjpHpXW0zD4ZDA27n5HnzZtTtzJiwtXNMTTlhBDB2kV13kaEk3B7y9gz6y4KZi+bZbD6+fI01OQ0OBHvVw/fs7LrYPI5Wu+G26sqEes5lDY98UtvGgPF1UHyCtMk6+DO0XhQ+6yvzni03iEinN+9Chv0jnJhyzBQnAkxR3hzplAn8xrwLZKS6RL/o3HdEUhHOe8CFY6RHb5VlfVUVb5mHHML1UFigHtjL2vaUB4EQl83rG9+4De1kofGzwMJvORGtgg2XZJuqGnIYceu8Rt7ntJ7jrHU3HkI/GYMQdctMLJ5jHUsuhs1mqXTXWAtp2cBjd62hD5DhgM2WZPJYzJVLcOWs8CE894TWmstO+tLj3ftCHxOXMkEh2lR7oNdxaEPXbA/1DNAwh8ULiI/obtGZhwXo2kUFXRk1yxGY0Rj5CShcn7OMYKh7xKIsOhX2VN5xNEoyScWbssf+T4s3hqA8hjEeFRmVWjSgAi6ElR4XKCS7aQM79fymcckzHit6Q78IF7funnpzhcvdNEU8jcY3A60FXLL3N6oMgMr59XdS5oQGgZWLV5QqEoJfz8nc2u8i8vMPEDZ0J7SIKawpgBG625WQbLJp/1zKTeV0vS4gypag+/VitgVGQQNBggF/r4pLTPRpk/hV19R0QUDVlHJkSOpP/j23D5lOMtDdhAB+DFLil6vr7ACzltT8Z78+30gsTpdu5PauJBPH828c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(31686004)(316002)(8676002)(36756003)(4326008)(83380400001)(66556008)(66476007)(66946007)(2616005)(86362001)(31696002)(54906003)(6916009)(186003)(8936002)(5660300002)(2906002)(41300700001)(38100700002)(6486002)(478600001)(53546011)(6512007)(26005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1B2QWRZRTYvK093WUdobCtnSmxIOXFQMitZZmlyUG5aNWJnQWNDMmc4Vldn?=
 =?utf-8?B?SERCWnk1K3hHbzBNanoxWlgyaUtMT0dYOSt6N0gxZmNqcWlodC9kZ1FMTGNE?=
 =?utf-8?B?V0pZelRObkovTEVmaGNISS9WaDh5VkdjWUZNUVFTQ2dQMnl6ZElGdXhUdFRW?=
 =?utf-8?B?MzBxc2ZsRjFvaHY5YVJXMklZMEhNdXNiYk41WExVUkZXanJpZW5xTzVIR01T?=
 =?utf-8?B?Qi9NaVRVMTQyN0xFQ3BGejlIbjRaVy92Z1NCZDNLaEVocWVMN09BR2xZM1FV?=
 =?utf-8?B?endCeFNCMjUwSnJLUXBBUVBTemU1YzI3WXU3SW1pTU0rN0hvd3dFMWRqaFV5?=
 =?utf-8?B?V1oya011SUt6dktGOWVVaVN2YlZRQUJXNmpXMTBDcEdXQTd4OHA3ek9ES1Q0?=
 =?utf-8?B?NGRVNjl6U0FWOGdyc1U3YmZlV2pnVXFSR1ZHVzlySXE0bmcrZm04azdHQkpy?=
 =?utf-8?B?REJYQmNaa09XTE0vYUxaU2c0anB6STlHN2JEQUg1amsyWVNteDljdGlieEpt?=
 =?utf-8?B?b3pzTkorS0o5alplWnQvekh2R2ZTWkRMc0RFRk9jUTErMW1heWRGZ0tZRkww?=
 =?utf-8?B?aUhqRFNHNDNrVjNIc2dCZkllVWhmUnpDQlpFY3lVdFluT0lxUFVyU2EzTnZo?=
 =?utf-8?B?VmQvaGZzYTYxeW5uTzd3d2dldWlsT2xJM21RblM3cjNLcEVCa3Baa0FnUlJw?=
 =?utf-8?B?N1dQb2JIczVYZ0h3R3ZQcGhON0ZWTXFTMVEzckxlRW95ZEtGaWFnd01FVHlF?=
 =?utf-8?B?UDhuWDRGNVVuM2o4RVJpczZaSDJvTTVKQVI2SDlkUGMwejJNTEhEVHBuSzM0?=
 =?utf-8?B?YWgrTE9QVFV0MVJ5S3Q4d25tWnpYYldQcms0Q2xHa2V5Z0M3SVdiYkZKdmEy?=
 =?utf-8?B?bmZzZEhsMHlBdlF0UXlvWmFLbFk1YXBLZ2c5WkVDVDhrSjIvU0J4UWFwMWNi?=
 =?utf-8?B?QTc0b2FLMGpnc2ZDZ09YU1l6aU4vY1hieVlXZm92N2oxai9rOXNQV2taSnJH?=
 =?utf-8?B?ZENULzdRYTZ5ZUF3RHloVE1TOFhwaWhhN0hTZWYvaXRMSTZhb2t1alA2cVBD?=
 =?utf-8?B?ZHErWTJqUXJjNWxCYXRXeXB3UEVwbzVYL0VBQ2pFeHUxNlBKREYxOUVKYmN4?=
 =?utf-8?B?S3ZVVU56bnRpR2xhT05xWFZaRHVOUkhvek5iYmFKaW1DTVBUVjJXZlhkNnI3?=
 =?utf-8?B?STNmVThiZFpIUGxNb1ZaQTd6Q0t4NExFQkczdXcybVpCbWhtR01OY0NTV1l3?=
 =?utf-8?B?b1AzM2EyaStOVkZWSCtJZjBScnlkWWdOSzM0UjE1Sm9HL0cwb25DTFNiNkNt?=
 =?utf-8?B?RXlSNDQwMGpXMXQ3RkdKN3RXNzI1RFRDNGR0MXNTRTB0SEViZ3VIREFLRmpl?=
 =?utf-8?B?NVA2cGVwdmxCNHlmdEJsU2h2SFdnaW1DblhjQ0xlb3JROHFYK1VQZmFlZEpX?=
 =?utf-8?B?aTB0UVQxQW9yWitoMXdub1B2dVF5R2Ztekh1NVdnSWlLeE5BRWwydkl5T2wz?=
 =?utf-8?B?Y2tnQnQ0RzZ0N29rREIyZFpNSzRLQVhxbFJKaHoxRUpGb2NiQktJbDVOWnRT?=
 =?utf-8?B?SjVrQVVaemlabWR2UlZSNjQ0QzlNMUN4NlVTOXBvZ096Yjc3Y1JvK0FZUjMy?=
 =?utf-8?B?ZlZ3M1N0RGNNb0hKVmxMMmliY2xzaStSb1Q2cFluNlYvcDNJWFNocGlBT0du?=
 =?utf-8?B?djlFWHFNbXRHRVJheitlMENoU3Z6U3VSUEM5bFBiZ2NZbk5LN0JWR2VJUVpn?=
 =?utf-8?B?SEJoZWpha3BydldVcXNXV2RoLzZOUytnN2c5QTVhNHNPanlod0dpcVI5cUV6?=
 =?utf-8?B?dUwzQW9ZS1dxU1pCaVNFUEFtNEM2bkc2OXlPMlJaRUNEcHNGNnIrTVcya2RZ?=
 =?utf-8?B?SmR4UmFQZXkwd0tFcHJpNGM0YUhQc1g5SE1xT2JmcUdRdjFCUXFhdnlqSFhj?=
 =?utf-8?B?UTYyUU5JcUN1OVFWSjFaM3luS0IxS0ZEK0xWNWx1blRCbWlPQncrRlo3cjYr?=
 =?utf-8?B?NE5xcTBCNWFkWW95bTJDb054VXJIUlJ1dkljNEQvUit5dUxmSjB6WFlaYkpZ?=
 =?utf-8?B?MjlIeE85a2p2cnFHSDNsR3NJcmdwQ05VVEN0dlIwM1I2WDdqbFRrTyttb1Jm?=
 =?utf-8?Q?Nusq/QvbAc4pXhdTObweKcRBg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff467525-cf5e-4188-f631-08dad2a60001
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 07:39:23.4285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyc11uoEH39XVXqWMmY+rysEt8xjdF8Nhn4ulfnG6sExeQOi8Rvm3lU4LGw8gI9z91J+SGv905Xjsz7WEsh9qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6782

On 29.11.2022 21:36, Andrew Cooper wrote:
> On 29/11/2022 14:51, Jan Beulich wrote:
>> Up until f61685a66903 ("x86: remove defunct init/load/save_msr()
>> hvm_funcs") the check of the _rsvd field served as an error check for
>> the earlier hvm_funcs.save_msr() invocation. With that invocation gone
>> the check makes no sense anymore. While dropping it also merge the two
>> paths setting "err" to -ENXIO.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> We could go further here, removing the local "err" variable altogether,
>> by using "return -ENXIO". Thoughts.
> 
> 'err' is a non-standard variable name, so yeah, why not.

Okay, I'll make a v2 for this.

> That said, the current code has a split loop checking the incoming _rsvd
> fields in a first pass, and then calling guest_wrmsr() on the second
> pass.  This was also made pointless by the identified changeset, so the
> two loops ought to be merged.

Not really, no - it would violate the "Checking finished" comment (but
of course we could also delete that one), but I'd also prefer to keep
checking for all errors we can check for early _before_ starting to
make any changes to the guest. Therefore if you really wanted that, I
guess you'd need to make a follow-on change yourself, with a convincing
justification (I wouldn't outright object to such a change, but I
probably also wouldn't ack it, leaving that to someone else).

Jan

