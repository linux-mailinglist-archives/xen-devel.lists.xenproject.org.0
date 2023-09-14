Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76F57A07F3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602342.938854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnim-0000NE-5o; Thu, 14 Sep 2023 14:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602342.938854; Thu, 14 Sep 2023 14:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnim-0000Kq-39; Thu, 14 Sep 2023 14:53:32 +0000
Received: by outflank-mailman (input) for mailman id 602342;
 Thu, 14 Sep 2023 14:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgnik-0000Kj-U5
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:53:30 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe12::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7776cf67-530e-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:53:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9514.eurprd04.prod.outlook.com (2603:10a6:150:20::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 14:53:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 14:53:27 +0000
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
X-Inumbo-ID: 7776cf67-530e-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnlX5wTuUXqG1bUwRRhSSWl8tYjpfsUoYAFss34tzUpVgCfc4cn5EJPxvUuLG2AvuTifnaVvcCLa73YTqPrFOkEsGn+M+1d58sjQP/9bWfeqFHcO0EGIRUb70/J6Ro1WCftuY4VI3FhDs6QtPsubb/+8Z+KIIX1zuy8A9X4O0psgybqPeN6k4c4KdzM5cru33NOOaaJ6L1amjbeGoy68mUt3w2pQ9BzZcgHPysTwdWOSqNppgK2My9C6eWHeCtRXTwU8F63bBTmkS1ssJY3ZRpfUgLotmDlY4nquTkG0qS7gAbRQC4DlIYNlID3NFi3xPWp2Dxa/tg8VyExgwJMJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUF9RqSdud9m6HpQbFYzRwOa7FnYCIHateaqBJr+Cws=;
 b=l6puYfUrRuJ1ujJ9pnCmOlZriGh/wd06wkjXzVLJIRdsvsfTLQ6JTNuRUsraq3yUIgQ6M4DljbkfEpa2NMq/+DjZiSGiA0RImhtJn/DyGCTvUBuQsg/ayvrr9Hq4TJX5emTjtIRiXBFPNLfNI0ztFWaCLCzgx//U9KP0tJiG4CqNb+rzXViubcFVGQZpAIBmyoZ1YhSDkB8qVCYUID7udtgdmPOUso/xe8ylrVfKiyIs+HoHNt0+R5HL42tdDCuOmhgx56YvAqai7xWp4BUQsnQpg49WLwRDBp9IX1784rB8FR4qDIJrARQLh+jcxB73mQWslCe60qu/L5N+S/tdVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUF9RqSdud9m6HpQbFYzRwOa7FnYCIHateaqBJr+Cws=;
 b=myTtR7KMdZIFCpMdmE3jy1nyXlAwMAzfcFfONidPZgwr3Lg++bMDbuHudOxyP31zb5mH6qkEtoZ+YsG5hqCpsuXx/ahwnI8nFs+r5ZyUfoD6unmgiVqfoYhhaM68p/d1d71HWW4UBGjCsYmqPa/b9XdlpJ+IDkoUPrQiL5BLXySpfMp6d94+L2eghIQiqjfcCnRPgov4DGobh4UVYqYwSIyowm9DvmXHw2mdKAMTqdvtsShp0rblt5H5QFWM7ZNstAPvmZU+6JupM1wmEgPjE166lNlsvv8g9zwmcxDtpxATHNE2EOJLNVPAPTanjmQr4I8f7uxh4MgB2ICzsdquJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <126020f0-3054-11d5-c7f9-1f02750cf815@suse.com>
Date: Thu, 14 Sep 2023 16:53:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/5] x86: Introduce x86_merge_dr6()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230912232113.402347-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f282521-06ec-4e33-a5cd-08dbb5325a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sDxw4xuI7B7AsYt4JNxbhQnKA+ggQeuPmYZFl5I8iqk/VIFrxpPtvl4BcvVL4piYPK7rO5dcZHTIm4lTVqrKd0gzOX/XHCK1weoYGh+Bq5KcAZ/m6eJRiEbQU8dfhmWWuSUCy9gwTltX5LnlE3aW46tWtgRTqCTRBJ2JwGllCpFIfLWnuXs/FJ/Zmj9qz6MT+NHt+k8mHnLD+8jTnzT82a7fkGIROboxNJklUzfE4muzYHDxnwvElXfjmuN7yjsCW/OEJt+LUfyLuJjaSnDmRHF1RR0zLMxECle9Mz9rEz+jHY2tlzxAA2MkneepLLesaoP37sTb3gP7ht9RF3kYxR7xfpPvSqy8K3QOl/v0HvDfyyTal+AVnpcBmjf/wY3gxTEWB77jv9NBI3CXN93+j8LAzHbnXqhWHwAsUYpeWE5n7XRWe8UxBp4utlLW0bNyP4kEttd8hJwkGMHYZ+4GV/6jPYWT2M2qpPvFYHTaRTt816YxbE2OTqJKavxJ3j/jbKEz4UN6xRw3kjmAGvcQ5ejlVYNbCMNJ56NXTyE4wKADHbOR4J67gLaJva4wvduHYiAVlaCYBOmDk0Lq5m+AeqqHhOEgWWsV8tHvvDt8g/OJ93BcfajiUwOTTU/CGq0Laf7cSm4NUeV1E/+WhodOBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(1800799009)(186009)(451199024)(6916009)(316002)(54906003)(66556008)(41300700001)(66476007)(66946007)(478600001)(38100700002)(31696002)(36756003)(86362001)(2906002)(4744005)(5660300002)(8936002)(8676002)(4326008)(2616005)(31686004)(83380400001)(26005)(6486002)(6506007)(6666004)(53546011)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmR6RHlHUVg0RWRON3dlVlFoZ1lteGMwcHRQZVhYd1ROdnRXL3JkTnhBUy81?=
 =?utf-8?B?OXE4OTBhVURwdXNoUUFtVWpENVUxc2I2N0s3RElVRktQY2hUR0tXWGRvZDFy?=
 =?utf-8?B?Q3N1M2hzUW1wK2lXbUpqQmdaRHRpME52MUJZa25wMUR1QkFnTXVqbzAxSjY1?=
 =?utf-8?B?T0kzQ2lleS9yZXkwWXJhMVVFSWNPWDFMdGhDWTB3dEFwbzFNRHd1c2lONGRa?=
 =?utf-8?B?aTB0aVJqc1NzeSs2RXpzUDRXaFR2QldwN1VxYnV0RkhSQ1ovMGxBTWhnZjlp?=
 =?utf-8?B?UmFhWldqQ0tNSEhOSitNSFFxa296dTZ6cVVjRTRvYXhINFRERWdiZFJTWWh0?=
 =?utf-8?B?RjFVbFNZbHdLWlYyallIMi9CcjJXdFNUVERtYzQ2S3gzbEZ1NGNRZEdqby8w?=
 =?utf-8?B?YXhvQ05HWkhjRE1ab2RiQWk1dG1qd3gvUWhadkZFKzNXL2dPY1EwU0dCWUFK?=
 =?utf-8?B?WUNIYm5PNGZMQ3AvWlp2a0ZCakFiMFRidHU3dGhObTNqVDFFVnZpV256ZStQ?=
 =?utf-8?B?UUtZd2dZc2RFUm1mWXgvUGxCSzd4SVhhRGdJa0ZmNVN2V0NQQW03UXBDV1NK?=
 =?utf-8?B?NExzT29KZGtnV3IzeEFWZStlaUQyMGpKakVYVFdKTHNFUi9TY0d6YUNWQkdZ?=
 =?utf-8?B?V1d2MTNrMXphdXlFMllJRUVKa3RXZTRoUE5uaEF4RFF3aUlyREVXN1dzTUZ6?=
 =?utf-8?B?a2RENlZ6bEk3TjNqUjNTWlBBeGJZaHRVUGN3Zm9wVGlrTktYaWc2TzlNRHY1?=
 =?utf-8?B?WTB5MnNGU00xTzQ2WEtwSEwrV3ZLMGx3Y1JmUWdQRFluVTB6c0x3NlcyY05h?=
 =?utf-8?B?U0VvMnhobGtQZFI3L2k2Y2NLNURLRjVCekV2ZUIzTXFxZFlBOHBmeWExTk1X?=
 =?utf-8?B?cDR3MVB3akRVajBqRlVuaS9wc1JxcVpZcUY2QnltU3dGYVlaRkEzOGx0SzRK?=
 =?utf-8?B?L0p2RkR0S29Ga2pNQWRkbnlPejYvTjRwdExlNmsyZko4bmhXWWEzd3A2QUdI?=
 =?utf-8?B?N3dseHZ4VHNtcnU0bDNHMlU0OG9sdGw1UG5uZG9iYlJXZTdzWStpMlFQb1Qr?=
 =?utf-8?B?dzJ4TUEzN0xLZkNENlhlbnVRMTN4elRSQ1NHdjVDQVpzWSttcGg1YWhJb3Jy?=
 =?utf-8?B?R3RadU1Vc0wwSFg5eWVuNElMTUlIQTdTWFoxdEVpck9KaXRGcXY0R3R4UFZ5?=
 =?utf-8?B?K2g0citKZVNEZzBaL1p6TFBEM25UV010MGxnZHEyL0M3Tm5VTHQzYzZVMzZw?=
 =?utf-8?B?ajRXaGZOTWNGcU9URHpsTnpZc1MwVnhPMVRRazlRZU9HMUp3aWNUTzcyRzVz?=
 =?utf-8?B?VEJCUElqbVhPTW43VnhHRkowZ2Zqa08yZ1ZVd043bTZ5NkRUNmlJd0d1R29k?=
 =?utf-8?B?V2tUTVRPWStMTzQ2Zk9FaTQ4bHdhTXNxemhkOXU3Q0J6cDM5QW1tV3dPU0lV?=
 =?utf-8?B?NDF3Q0NnQzRPR3c0LzVhUThBQUkxdklsZlNXcnRYRmt3d2QvdXpNRk5Bd3pV?=
 =?utf-8?B?aURoTDlHcDVWdVZldTVjd1p4ZVU5Rkh6VjNISit3SXB4KzdXMTJDWTZOWm9Y?=
 =?utf-8?B?TTlRUXEvYVVrSDlyeHBXSlZ1QXhXVDZiTjZuVVduSWFqL0l1eU5pM2tBbHRp?=
 =?utf-8?B?RWZUMWhlNjYvNDdRbHpzbG93emdwYzVxY2VkNnl5ZklNdE5GUGE0ajIzRnNB?=
 =?utf-8?B?dWd6dTRVZEZid1JiYUZwWHJRcFRHK2krMFN5UDhHK05ESXdEblZTWC94SUFG?=
 =?utf-8?B?T1dzblZkUDhGQTI3U0FKY3FzLzZRaDcvWVR6Z1RndDV4bUo1WUNxNmd5RUll?=
 =?utf-8?B?TTNrMHhqOW1mWisycEpBL01NVHVsci9vQmFVU05QNnoyOEZyMk9pbndBZGY3?=
 =?utf-8?B?Q0R4aDgyd0Y4ZlJVUmFZMmZ0bEJrZys4RGRqSGQ5eUVBOUxWUXV3dUNhdHE3?=
 =?utf-8?B?ZGk5Z0h4NlhsUmEwVGl4RVd4MmUrV040UnVsRVlqeEFKVmdNemlDMXByc3Mv?=
 =?utf-8?B?OEVyRllPY2gxeHhwV3hyY3BxUGlmVmRrajNza3dRS3lmTVVoWjFCZ3FjUXg3?=
 =?utf-8?B?clFZdURpVkh6cDVLR1JFTlNyK0dVaUFnSS9JWjh2c3NWcjBRVnBaS3J4M2pO?=
 =?utf-8?Q?RY0EBhhejlDtNgWvI2k0VnsBx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f282521-06ec-4e33-a5cd-08dbb5325a64
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 14:53:27.4128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXNF713XfdmuVrw/iz9dxX/TMtoj4cTaDLga/WTs/JG8XHGzRFdzVoLIhNMSa9sqoFZ11bdX3P8m15ZB15/MvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9514

On 13.09.2023 01:21, Andrew Cooper wrote:
> The current logic used to update %dr6 when injecting #DB is buggy.  The
> architectural behaviour is to overwrite B{0..3} and accumulate all other bits.

While I consider this behavior plausible, forever since the introduction of
debug registers in i386 I have been missing a description in the manuals of
how %dr6 updating works. Can you point me at where the above is actually
spelled out?

Jan

