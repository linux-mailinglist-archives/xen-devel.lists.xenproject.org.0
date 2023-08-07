Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C519C77291E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578664.906278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT28D-00068B-3Z; Mon, 07 Aug 2023 15:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578664.906278; Mon, 07 Aug 2023 15:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT28D-00065Z-06; Mon, 07 Aug 2023 15:26:53 +0000
Received: by outflank-mailman (input) for mailman id 578664;
 Mon, 07 Aug 2023 15:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT28B-00065P-1y
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:26:51 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe16::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d386ed33-3536-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 17:26:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 15:26:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 15:26:47 +0000
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
X-Inumbo-ID: d386ed33-3536-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4Tx4je0EZBLvgL0ogTRMdvtVrAQWqgzkYTnuRaeuGkZyD5DXBXDMysPx1vzdJ4PrGuoIa2ThK1BMeMhKWINvPPdOb6Dzkcbq9U+hoiYiIMQ7QKwelqLyQOApzOV2pcOnb4D4sviUIVOuQgm+GwNFOGqLiMsGTiI2jTU7om2nYgwJBqI4/xI99kiDTAEqDzQun9iG7qhzhbevmU0N5FIbT8wwnWi547tHTZ4mTWUQjsqi/hdSI2tJtmo5JhYQXxTwNsqhPndqI7w0FxPiz6kmyRYpprEapxOzEghjJByAcnm3K9L/aCjFnF3TK0XqWptD8MvTJZdOcketew3Vh05pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM/7S9W+t50LzVxhH4a+l1AKY6Fduweh3gg82cmjdH0=;
 b=Q3fLu6oUhYR6m/YxabjQ4nYTK5eFuPt4KvEbUzgO8akhJ/YojDPclpHB6jNCnzzBuywq8u1f8BgVxZNhWj7+9J94In7z47AjgAVL32U2OY7LPz+6/qGmM/94O+7izemYOiPB8GVHr9aIC80BAz7Q4h+OeEwh/f0VjT7+s+FY6ZSA0sVgxHl80y7jYonPK6IMozWlFVxspXxVibpfxn6Oq92RJGm7sFDdJdBId7bItBc4jsa93eHb5TkGcDP6jjNYopTk13TDbBsDdwSd6fBLPsdRmM3xCxOp7HSkoX3/dEtgy8v5tOWvq/vl/BjWwcxhdkArM58F5JMeh5THEF93YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM/7S9W+t50LzVxhH4a+l1AKY6Fduweh3gg82cmjdH0=;
 b=BM7MDwxtDx1+a7odiUF5rxZHOBLURh4HFHB/JUCmNh2bupbAZ+b6qYdjXDqJnQwCmyUtQn7PARnL+ZjLN0dVCrwZmUot0R8oEMahUSInydO4bhaVyJDGmoqmERpUzHn4vsY0HqxzM/+4OMFX8S4ri5LkSSglWQG6tNZQz4kxTxhrPbJB+n+2ayisjK113DN4I2ch0rt2JJxVN85bb/MU7JD3w8GlGTUNHG3KaKoLjS9RoaNthAxjnUg4yZe+qrQh4SYETzLQbAu6ZTobYDU2nTGnI8Ozu99DVIM3e8paAYrJRYuiTwK92BwKPvQSdGQhacA67b3L1wIlAkc1ESIbWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b95baec-b46c-4862-6d16-b4e6dd38b114@suse.com>
Date: Mon, 7 Aug 2023 17:26:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86/cpu: Address a violation of MISRA C:2012 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <163937bc59c7a8a5b2f292466090f97b7ec8f623.1691421539.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <163937bc59c7a8a5b2f292466090f97b7ec8f623.1691421539.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db40283-82ee-4c8d-7099-08db975ab69b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8+Ar4el3ZHJ76Oniq+vlkYLy2ywReLXL1Om3GkWMSSI/9QooGxU7BP+VGQWXvxd6ftzzKJ/xn7OyDqwYN3fiAi4VOESmPztuAzFCB+ppCFgfTB7IWtws2psGNyk7ekWicjBGdG4lWeyWQh5b73ejqGQDz7l0yoPfzi+wWQu4LNNNgoR6B0cJdLYPLNk6MTZ1bTjKxCdI3e3m1psCueE9akiWMfiXBub8A5XDR9fqY9ZRUvZZcOtEVJXOpqVyaq6Tu0A+iQArBMwdH0M99vvWzJXxiZl4mJdqd6q139md6uBO6CyIwuSy151h0lQ6oZcrY8lk6LymFJ4Rz7OW/cEAzRh7jwkku/1BQjbwya3bYGFMcAkGfja+goFAefJzjNf+LIcPNz5ApbpuzevqO7TgtxpfWNyS+nk0cqJ0+eIyrVAE9VS4ecKasxlLWF6BzAfzh5pJ3Ksdy3hi4MmtGiOgfioLKHKhwO0gdIUFGa9wWeNOkiIewrI89K9HMN+KshK7nRVArn6aEyUnWjqNkRwRGRBcltioeJbJxC7L7HgGLGSxI1C6rpe9i4FYPEPH7sP7bOfvKBgZ57xuN4DPcsqKaba/iK1vtSydiyRBEAB/p91kGdLcp+1yN70UVMqG2T1Lvjy5WLY0n4tHNw2O0UeycA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(39860400002)(376002)(136003)(186006)(1800799003)(451199021)(2616005)(478600001)(31686004)(6486002)(6512007)(53546011)(26005)(6506007)(41300700001)(66556008)(66476007)(66946007)(8936002)(8676002)(316002)(4744005)(31696002)(4326008)(6916009)(2906002)(6666004)(36756003)(54906003)(38100700002)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnNNdk5HWjlGeUE1L2JaaExtaFBlQTVBWERCT2NUS1FBNmpYMElwWnN1VjEx?=
 =?utf-8?B?QWZXdkdRb3V5ZWRVNmVGUWRwc1JHZi9VakFJZUFTRnRVdDBmOXJzZkJoYTRr?=
 =?utf-8?B?WUNkMHFsUkdOSmR2aSs2Ym1zem8zaWJtU2Ntbm9NZjM2YkVkREd6endVaFhn?=
 =?utf-8?B?YjJlekNjWEQ3c3B5b1Z5dEx1WUc5dWtzT3dlcXdmNHpFd1RGQTlrbHA2SDVJ?=
 =?utf-8?B?RW0yYUVaUS8rK1pKeGRlMEpNZ1JtRlhnWGE2M3k3TXE1ZzNFUmdvTlhoMGRP?=
 =?utf-8?B?WWRUTmxGQ0t6ajVXQmhEMFg1WHU4NERtbVBZMnRmYWZ5ZXpFZFhDczZOK2s3?=
 =?utf-8?B?QXhWOGhwcGtQQzhmQzlGa0QxZS9HajBwQ3NSN2NRNHFjRUtlSFAyZC9WYkZn?=
 =?utf-8?B?UU9hQnhlSGpiZFNGRTlzOXF6VU9kMHplWlpCVUdXVzMvR2F6bnlod0pEYnJM?=
 =?utf-8?B?MG1sLzVSWTVkdTNvdDJTQmpRZm5wM21KVjRGbStqQ2VaTU4rOWVZVEFIai90?=
 =?utf-8?B?ZjlsRlh5SmNjdVNtTmhMaGljTXdHZlZMMFYzRlh1MHFIaGVESjAwRlFud2VU?=
 =?utf-8?B?QktpdGcwRjRkRmo5T3ZHUkNaZnlTc0VRY29jMmQzQlo2NmNEMlRvdlBEUkUz?=
 =?utf-8?B?ekplYm5kMElxOFIvbXMvUmRrU3RhcjNWcVNPUmI5ZXNpdExRVUUwODFHbmFo?=
 =?utf-8?B?VHZFdXcxbTExVzd1bDlEczNnalIvMFZzQzFqSzVidGZoTlRHU1o3MkhDK0RD?=
 =?utf-8?B?S3hTc1VXTFRnRW9GV0Jwd1BESWFrMTE4ZnppYkl3M2RyL3c0aVd3TWJvT3Fl?=
 =?utf-8?B?L1hsdWFHV1hCYWVEVkxObkgrRkM0Q1pPMXYrdFMvU2JyZVlmOWRYdGRnNFd4?=
 =?utf-8?B?dEExbDdSRkdHdmx1bFAvRVVYQnZtNWRmdFlidm5FdEEzN25ybWlkRTVLaG8z?=
 =?utf-8?B?cTFLMlU1V2xYU3Z0bjl3SWJqWStGLzNqVXZNekNQWHNScTVLODQzWmlMOFg1?=
 =?utf-8?B?Z25VakV5d0ZheXpwOHI3cmM0SkFlaldlWHpoT3JuOGY2clBsY21NeXQrMjV2?=
 =?utf-8?B?WENlU0dVU2hoUmt6TWZ2MndhVE5YdEdJeHNSWGsvbElVbDQ2WkZ5elRKbFJF?=
 =?utf-8?B?Z0JrOFp5MjJNSSt2ZTl4Si9qcEJDQ3JuRWozY3NzS3N0eDYvNkdINE0vZ0k5?=
 =?utf-8?B?ZnVxRzRFOWY2c2hRYk9tR1NzN2h2WjNjaXpySmcyWG5UdERhaTIyZ3VOQ2li?=
 =?utf-8?B?RnArZ3cyK28vV2xKaUhrdzdqMEwxcVNWbmluWllnd3ZsakNON0N4em1XVTRm?=
 =?utf-8?B?MERQUmJxMVgxYU1raGxmQTM0a05lQUc1Q2pKUlhNdnVVL3dsK1I4TkdKcThj?=
 =?utf-8?B?TExwYXhaMjdBbHQydjBuK0YzZG5memt5eUZpYVV1aVV5YmNxbytWbmR5aXRT?=
 =?utf-8?B?T3dodnJCUGFCWHRkYWxJMFcyMmREczNMaW9hTTNzQ3VrQlB0TGsxcUxKbktJ?=
 =?utf-8?B?UDFPd2kxOXZMejdHSjNJbmtOZ0tENTJSRkRqOWlFbWQ4QlRRd0kwNE9iVDJB?=
 =?utf-8?B?cENKbGFGL3VyZU0yU05oTGkvRktkWUNBR3l5bDBrUUp1UCtVdHV4d1lZRlhD?=
 =?utf-8?B?c3QrUGp0L3hqK05vc2RtVzRicFBWVHMxckUwNmRWMU1wVGdYU0JFUnJ4RmhR?=
 =?utf-8?B?TWVwNmx5Z0hTTVVSMm92Q1htb2hTQXFIRnV0K2lieEhRYUFJcE1sQVRvU2hB?=
 =?utf-8?B?amtQYkFtbmkrQVpYWUdlWmZFNzFGYVZ2R0ZVWDhJbzZrbW4rbWtxSXlYUGtV?=
 =?utf-8?B?T29rdUlnaDlTd045RkdWS01tLzlwblZzV2xqbXlDM2duYlVIcSt1ZnRlN0M1?=
 =?utf-8?B?NDNaVzVOVkYyKzZCNUVnY2xLTnBxMU1JcWd3Q1dxNEdmeE5IY2FZaWsyejU3?=
 =?utf-8?B?RzEyZ0Z0ZERBbXUrNlp5RmFDZS9EYk1sMWN3RzA3SHlPcXV1SDJMZElBTGlB?=
 =?utf-8?B?QWtYRVpQRTdzS2k5SEhHaXMvbGV2OHYwczh6RDR1OWVmcGRMYW9BK3ZJMnRK?=
 =?utf-8?B?Njg0VTFKVHNKUkhtckxYU0xkSFlucGlEcFJCSncybk0zUXdUMVRHVHpYbk5P?=
 =?utf-8?Q?t1xy+3yf8eb+ZkbV4zcsiQg/+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db40283-82ee-4c8d-7099-08db975ab69b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:26:47.0997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhBrkEhS5p+Bsml4ch5uEABGlr5F/yBYIQENPADCd16LOrAF9TNaHS9i9XeCJpIeQrUzYnn9JlsiT0SnYOhUtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7308

On 07.08.2023 17:24, Federico Serafini wrote:
> Keep consistency between object declarations to address a violation
> of MISRA C:2012 Rule 8.3 ("All declarations of an object or function
> shall use the same names and type qualifiers").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

I think this wants both a Reported-by: and a Fixes: tag. The
description would likely also better not follow the boilerplate you
use elsewhere, but instead describe what has happened and hence why
the further change is wanted.

Jan

