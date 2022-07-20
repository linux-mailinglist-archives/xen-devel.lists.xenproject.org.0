Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4064A57B56D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 13:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371502.603454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE7sc-0007tQ-Qk; Wed, 20 Jul 2022 11:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371502.603454; Wed, 20 Jul 2022 11:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE7sc-0007q5-Nz; Wed, 20 Jul 2022 11:28:38 +0000
Received: by outflank-mailman (input) for mailman id 371502;
 Wed, 20 Jul 2022 11:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE7sa-0007pz-RV
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 11:28:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150042.outbound.protection.outlook.com [40.107.15.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 170eeef7-081f-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 13:28:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8088.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 11:28:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 11:28:32 +0000
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
X-Inumbo-ID: 170eeef7-081f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOoRa7c6juElYwa7XnI8EpShQIZ/zSagM2DlMLLEsMMqrlHfThnE3O9L5bidoZCjP1GaqyDWxQTlB3Mi68CX9DC/HcsHbOVfYuLMw/ICJ4yP3AEHogyt3kTdJBusur4Xhz0WV+KX7VyxXkgdD5oBSCmJI+BmzGT0riwEet/B2HLW7Y0ZOx392e8Wn9RNj2jjxbnib+RnRBgjBRY8kXvKds7YS8vmBnrwFkcwG4plZ+loUBs4aibtsLD4I6Yenq0VriSus2UYQqn3NbNwmnsUmW6FMyMbRLy1AeuZOfaCrxYL/PEWf3+SOe7t3WjgVL37y5fQH7TjJcZ+tlN8Mvc7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFivJr+JaY49LLdT/LQ9u4+a0rTu+ultC+v1a5et1uI=;
 b=ij/JK012fE6VLCSlzYc1LOgY6Dj3eerL4V0x/dPSicPI+pdDZKLpNjrBGdQ9gMgCzMkDcGqxd6JmEffgndNgKXhYzS8ZIjlTS/iunoL+JOC7KkfvO0m92eXhCrllOYhsVQHfcBuhGXLW3RuuwqYlB6sSZ72CE6332hZ/0uhDJGEv6LEgqjLZzqptChxlxIO4+UnGH9V3HCR8BFHEGGmBE2V249TRI/GH9upyCyEz45OgRFzn6xLock5f7EmyGiRq9Tj4zWe9O2J7S9r001NOGna3KYrPZ9XHxAMfxjN55FXIdMtiW+8B8HHx9xEn5AzJqEkmojnV/6C9/DKIOYc2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFivJr+JaY49LLdT/LQ9u4+a0rTu+ultC+v1a5et1uI=;
 b=Sv4W6osX4U3yDbEhJJ/f7Jn+bdkgt/4jXAl9XeZbGW/hPqtEXNJ/b9Myy7z0g+qjG3OurmFuIJWJt8fFLE0wAf5gdzteXCoc/agCc/mVZ/RYhL0W+ZIoS/FEfxP/4Zv/Z20bEWfKwJimn0YHJoIboHezQ/B+mbeAAQTeYOCbIWDm1ib6hPHTxvXhysn8CnxvvphbSYOje+IzDkkH4+Q1VMHt8q7NoNv8DUfoR9JRYUzYfuS48zUgP36sJOEzCIZEh1vOiGUn/KGOzO0HjVcGDHxnH20z6zkl4dvV8ZRR404qcxLQ0fKcZ0AnU9Yiy0fyETspzV/XnJb/O/tx2mBUGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bc211ba-96b4-b705-d600-e01e41e936e5@suse.com>
Date: Wed, 20 Jul 2022 13:28:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, ChrisD <chris@dalessio.org>
Cc: Michael Young <m.a.young@durham.ac.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <202207200448.26K4muXc067471@mail116c40.carrierzone.com>
 <49352a0e-89ef-4f73-1c4b-ecfe6e0e49f0@suse.com>
 <d0eeabd2-2158-bfdb-c0fa-634d585c48ac@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0eeabd2-2158-bfdb-c0fa-634d585c48ac@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0018.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8110923a-c50b-4887-1f04-08da6a42f9e0
X-MS-TrafficTypeDiagnostic: AS8PR04MB8088:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jljpLHu/frmWfpsZSJA/18Ptk8naioJPUAgGHW1bhnNUWz2YiXkQFAKGu9ZTKz/Siv2OGMJR8PvGLehc8X529ZEgu1rJjfX9IrZdhss4o0cdsH+VKKOZh5DBuUi+XXWVw/P2imn9/aEPhyQeF3Znej+KIpDGnMJl+eAYRybiPCh2tq9KHe/OaYCGuCzbC0dx/B0n0othbPEHLzcNIwYgDZLtQHTtZxKzvruFSx7z7MV+BowuRZJlcmfheBgjmfqPi78+GS5gbLPMLViy70GWbXOUFH6wq7B0lndcc3nWszwldMf9VovC6goXnGTms0WrAU3Fbki+kULwk9/3VHc+HyUSzV+C4xRmjGRxA7tA33r+hOMs9iKpwQVlYPP8U8eN/4ZdKsqI+imE8Q3gob3tpMaVJ8UX5J1ET7rpJGj7PSpul/PDa2OXZsPfrT0LKHIWUZqtMuDgS6CiX8kTwF8Z9pQaYU0PvPu3RsmDuhv9a0M3nu/719TTeSQrlq0X3RmsEM4u51Pgqx3ztIuGLhOXiftlkcxKMf9eZ4rEClm490eYINemKkIu80P8hcjIxhZdSFS8Excs+iEx4ViBKYgAC9XUVpbvoP7y2WszvABVkW1/V03RKWIIRKjpe9s9cBTWt5WPqIWmljtid8ao7AGnKz0YvRcl/gpkyLxTLFmPNoazW0QEabXzcLxrh4diYoMXOGVujPLTPZi+A2cnWXu3QvMj77cRa9C28Yjlk+KKg76nCSB4LrOJlue/5WCjZIg4d4hn5QobPdIYB6F/KC+yO9j2MItKRUN6GCkMCc+dRx/+xKmuopW1XGKkhkOfaG1MMiE0gW/HlsvEUwrJNUGSZ+ryhm0o5DajsKWq0Ag6wNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(366004)(396003)(346002)(2616005)(316002)(186003)(54906003)(31686004)(110136005)(66946007)(4326008)(8676002)(6506007)(66476007)(66556008)(6512007)(53546011)(26005)(86362001)(31696002)(36756003)(478600001)(2906002)(41300700001)(6486002)(4744005)(38100700002)(8936002)(966005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnVQN0trL3hOd21maE1kZUVKOVNLNXN5TGhDTTVCZW1mdGFSNldSZUdvdTAw?=
 =?utf-8?B?Q043eStab0UzOG9IR2p4SWZtUWJLNWRFQnpnWm8zL1ZkNUJ3bWd5SUxreW1Z?=
 =?utf-8?B?RnFKWDlFaS9SY09OcmhiTURTbmxybFJRMUVRaUlHdUlTN0ZFVXFqUFF3bk9Q?=
 =?utf-8?B?Y0RDNnBLVVkwZVV4ZW1TRUtNeVhtRjJnem1KYlhobnJSZjFwN2FhTkZPSkJH?=
 =?utf-8?B?Ly9HaGFwRkFQKzVvS2dwb0VWbEs0eFpFWFZPQmlXaVZHTDR6RE5ROWJ6aC9h?=
 =?utf-8?B?dndCMVkzWFk0M0VlVmZBRDVhYUoxUHFTdTdPVkxCNlZ5TkJwQXdJQlVoSDV6?=
 =?utf-8?B?VEJSKytoUGpTTU0wQXBsVGN0ZkdFY1JiTHRueXRnbUo2Um13R28xTmc2NnVQ?=
 =?utf-8?B?MFlEVzZ1RUxaeWt3YTE0NmxVbTljOU9KUVZvbzZsR0pJRHphQ0hqRW9hSEIx?=
 =?utf-8?B?eTR4c3hYdGdZNUFFMjZjVlpiQmY0aXkwUHhobjBwcFZva2tGbGNacnF5S0Rv?=
 =?utf-8?B?MmF5RUFOQVoxQ2h3UXk4aUtETWpTQTJuQytLQS9TL1RHZjlOSFBuSDU5bjUx?=
 =?utf-8?B?S3B0MnUxZlRYTGZNRCs1STVvUFJvNWZPYW9BaTlTQTNZaTFQWWNNdDhjTnJM?=
 =?utf-8?B?QWl2L1FtYnRzcGk4UVNySmFXNmF4K205QlJHZ1QyQkl0QXBJRURqUVd4VEow?=
 =?utf-8?B?aUVBVjN1MWgxZlFYa2JtRGs0SUxxOVN6aVBwZjQ3bDMxYzVUNXI4WTRITXZX?=
 =?utf-8?B?TzlIQ2V4aEZROVVYdDJWSjFWUUFra21HbFVVSFpKeHFaak1SMFFxT0VoRkk5?=
 =?utf-8?B?bEZmZFF0U1F4R2N3TXhzZTVCK1lkcE0zaTdyVW1abDRuZktldE5WV2N2V3Y5?=
 =?utf-8?B?cUtxbG8vWHVrUkNBZUo4My9peHNBMDVOQU9HazZTTHg2U2tqT0VLeldpWldI?=
 =?utf-8?B?aEUvTmlSWFdUZTcyNnBJaXVpb2l4Z3pIZWx6dEhPSGMvRlRQbVRRNGgyNmE1?=
 =?utf-8?B?dkE1dHM5VUxvOTBUNFZGeHV5SXdFRk1YVnlaM0tDeXUyT00xQmlMQmIySFQz?=
 =?utf-8?B?VVlOUm1vaXRidlpLaTNVZTh6Z0ltWUlScFJWYmJuVVJtYVN6TEY2WGJ5YkMw?=
 =?utf-8?B?aDk4N281Y0JoSVM2cERUaWw3c3ZhRTZyNUpPODg3dm41U1BkNTd0TktaemZR?=
 =?utf-8?B?TXF4eDJjRFBqNG0wd3pxNEZGS21GQ1N3UFgyYWFsYkp0TjRKV3FEYlNQQlBx?=
 =?utf-8?B?TE5KanFweEhBbE9iU0ozU1hmQXlXTW9pMFNxaGdWZm9EWncrTDVtTGtwbXlz?=
 =?utf-8?B?Ly9RZW5zNkpQb2UzSjJMeFJaYjFHUW52ZGNJZFhITk1CSm5nZXFBeGJ1QVV2?=
 =?utf-8?B?dkRLWDBmRGdOcVdTV2I3WXo0c3VYVjJiQkhrdmV3QS9UaHU4dURtd1h4dmRO?=
 =?utf-8?B?UlREWEt1WTFkSm9xQ1p1U0FVb1F5US9hQzBTZTVIaS9qYk1uNEkrUEZ5NS9I?=
 =?utf-8?B?ZUV0RWIzYzlZWEVPdkdjejA4bXVlc0lnc1pJN2Q3YjdrU1NjcWdZRGRzQkRQ?=
 =?utf-8?B?MkZnT2Y5a2hjM0RqWmwvTG5Pd3pXWG9kRW1rNUhjWHE1aEl4N0JIWFNEUzVn?=
 =?utf-8?B?bUN4WUptVFB3ajBqQ0ZwR0x2amlpR0VSRGlPNllIK3VQVlF5aC9lb2s5dXlD?=
 =?utf-8?B?NnlWbENTYXdOMGhxelpPUE9RU2kybUMvYWE5SzF1UjNsVGxpOG5sMWtiU1A1?=
 =?utf-8?B?QzBxbE5La0dBL2ZvMlF6dGxYTU5oNjI4NDRBbDY2OGxSSlRQeXZienVjK3B1?=
 =?utf-8?B?RXpYdm5rRzMrK085UEVHOUNRUjFSdG16clkwWjhETXFVL29sVFdnWFloYW50?=
 =?utf-8?B?RkpEbW5wVElHL2YzckF3KytNVWNIUXF1Q0pKVWlPYldoZU5TUXZ3aE9Ccnhh?=
 =?utf-8?B?dmJGMUtiL0k4enlObWJGb2xTcklEU0VQV1BNR0tCR0t6N3JnR3JSTm9ReHRz?=
 =?utf-8?B?U0xOdnE3VUd0bHdCWG1lWHROdnpnOFN3QVRzU2gwbFNTWTVBcUk4UzhudGVl?=
 =?utf-8?B?cGlCMi9wV0lDdHZ4ZzlLcTB5TEtwcEJRMHJGRHVWSmI3TFpPb1RvUFVHY3Uv?=
 =?utf-8?Q?wZr57R3F9vfkQCb6gilsCkhOS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8110923a-c50b-4887-1f04-08da6a42f9e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 11:28:32.0978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bszMAswuHKH7FbAeTd7CYHwLlSft6mPM25N0UUrwHWu9J/FhFESc9q5W6OLt0MEdjtD7DNU1kKBfrLcq+drx+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8088

On 20.07.2022 12:02, Andrew Cooper wrote:
> On 20/07/2022 09:19, Jan Beulich wrote:
>> On 20.07.2022 06:48, ChrisD wrote:
>>> So, you think it's a problem with fc36?
>> Well, if that's where the binary came from, then yes.
> 
> So
> https://kojipkgs.fedoraproject.org//packages/xen/4.16.1/4.fc36/data/logs/x86_64/build.log
> is the build log.
> 
> For iommu_init.c I don't see anything overly concerning, although the
> quantity of nonsense on the gcc cmdline is speaks volumes.
> 
> One observation though.  We do pass -mno-sse but not -mno-mmx.

Right, but that should be no problem - the compiler isn't supposed
to enable MMX without -mmmx.

Jan

>  I still
> can't figure out what makes the compiler think there's any SIMD to be
> done in this function.
> 
> ~Andrew


