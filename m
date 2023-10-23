Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B0D7D2C2D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 10:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621049.967051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupvL-0000fO-Ht; Mon, 23 Oct 2023 08:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621049.967051; Mon, 23 Oct 2023 08:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupvL-0000cm-FH; Mon, 23 Oct 2023 08:04:31 +0000
Received: by outflank-mailman (input) for mailman id 621049;
 Mon, 23 Oct 2023 08:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qupvJ-0000a6-W4
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 08:04:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe13::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9825a6b-717a-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 10:04:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 08:04:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 08:04:23 +0000
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
X-Inumbo-ID: c9825a6b-717a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQVqD7MTXVBJdDcZtJkQaSe8uLINgs6p43m+CMRMfhtR0hdlnDdgvgo5fi8Dnmt/RMBsNo6J+AivP2UJTEduZf+yNxIaWuBeRy63NcpLn1G2hX9M4VAl9fZoHkW42EkJB6Io4nQWExeaHgflCEYjsihqzooUSpDqp8T4K8ZWv1rwjPCfay/4vGhFp+qjKXRjW/O6HI5IFepNe2pkrAHG72+5yr/Yyek1O/HFrl2EI+KsjugrBqErWxLz2MYencQpy1c56vInZ5jaVWtVcTb3YyKXPAVcN/nA0E/nFdslvXzIIIloibTC4idtoMkLm0i5fnmRqwoRO4yQzSjm7YimFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxr1Y0Ek7NMXkZbUJ9ZbNY9A3+I9X2NdghD2Lsn9j/0=;
 b=AM1BgdgAnYxTo2c2qFfbcATcVfSOPtJKRLqyHMFoUHrC91JPJ1BsYmSJy3jNu1nuyPQcqWx0tpu3stnrzeL1gPHyO7Ps+hVAndnOoFHhz/yAi6dZ+IBnFWJzJnwCfuuAHK8lNUtWO8C/K7Vwh7g2izGMAgIA5TV0OpvOr5UIC9Z+22g/mGRYxc14TOODgxfT6Ud5zvFfJp8pYGuSfmAHrdhM8n1nXRt9VAmOeu45rOoh9S0CBYyulclWualMOKPGinNHjqyMw8iUz+yORo0TlVb0ydsRj3VBrFnzhpDsW5pAFjcQkfWQJ7y7ye+lti47kLC4jH3OnknVk4zm9gtDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxr1Y0Ek7NMXkZbUJ9ZbNY9A3+I9X2NdghD2Lsn9j/0=;
 b=HmD+sN0sSNkMNlj3jO+7+8AceulKFcSm0c1DlCNnqDrd7tKob4wP3W/sBjZtRHc8aqCnc1AZOPVIOLP2zN+VHagtmUloTpNqfBOBBJZM94LTtN1xYYnPcaWVae1uJAgHyoTcgcmE9NfJwBYwIlWj/l2RHICuqfq2ukrgPMmq5ZzCyrbEyWJhuQWmzh9d95SNeICoN/IWZxdBv1OPhGkdTsNUenEbYtpITzS550AwVDX4sOkfIWbSK8u5AX4WXkVDvbmxP5XDneBWzcWYib/avC+DIYfZm5KlL9C8EbWxs+B0cEw93Ol2M3n5tq54GTYYpKyAZASacI6APv3ZnDLKDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2902d6cc-169b-a70f-ce10-10925e837fb6@suse.com>
Date: Mon, 23 Oct 2023 10:04:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.19] xen/xmalloc: XMEM_POOL_POISON improvements
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231020202649.1802700-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231020202649.1802700-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0354.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: da267507-9253-4a31-015a-08dbd39eab53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3RiLljxRztG/Tbjiu5Go/LwFcQ3FNeevmweR42MEPbk/bRO9cycfLtXmYVt14TX97STt6zEJWFrDvxaH5EPak4MAEK9vQRib1K9vgmsA6oxZms3amI/7Ls0FXZbMV2tgqDBAjDVsN20DlLt0tTMVYH/Bg/l9RxKTyGKkE8gbOoKl4lshs3m9/xpqF2sYheQ3KAcLtbjC2E4pLXnsfeBtZjTi33QTb+r+eqIaaPW6YBfu1e77bcWcb894Ep+ZvtaoL72u142TeISOSZrjhUcK33ATJ50AQCLwP+4VRfBRSv6sWFQv/ZSW6dXCD7Q5ZhwCfgsHmPsHq1q+zsadpUbevdR5fMQ4GzCu7LFLORvqgpD6M6eu2EnqBCq5Jt/OBbVZObH0mHN5YyAhPNh3uZ0L+rPgWJXEXA7Z5y8eVJb5waNG/CDM+KReMMvxcdxAg5Ckf4KnR8A1U7T/LBzOlzuFE0q4Sp+yC2jisKRB1jqDxueD9JG7iRrhUfHu/aBSU0fGuOhf/oF6kFmFB6g0zgTX0a+xV9HDer3RWdyKFsx+TnjvFxtmoUnEZo0EyY+bza8htye2I1WfcYxO9+FXFHfuQAce1vLlvIf6AxIbDqbOXWWVZ4fU7WuLgpVaVQ2JGPaVndWr7MZC4d6lk+yZLLbNlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(366004)(136003)(346002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(31686004)(4326008)(8936002)(8676002)(5660300002)(2906002)(41300700001)(26005)(83380400001)(53546011)(6506007)(38100700002)(6512007)(2616005)(86362001)(36756003)(31696002)(54906003)(66476007)(66556008)(478600001)(6486002)(966005)(66946007)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGdlaWRKcWlWM0pQMGJidTY5T0oyTXV4UWN2TU8wcTN5Yk5MQk9sRTJnc0Ir?=
 =?utf-8?B?R2tKMS9KVStUb3BabFc2a2k5RlBZWGhMc01MZS9ZU3Y5Z05oYTdIQlIwM2xo?=
 =?utf-8?B?YkJiR3ZGcjZtdGE0bUdQWHdCWnk1MXg2WHNNVGtKWkV2QkNZUWVOV1cvQ25a?=
 =?utf-8?B?MS9MeTRVZ1BmK3dqM210eTZvam1JZ2pSVHNUMUQyOEZzWjF3VmNEd2Q0ZENk?=
 =?utf-8?B?ZDV2WFR4cThtRlZGK0hhdk5MbDBvNFcveFJEdU8yQ3NENzZMV3lxREZTd0tw?=
 =?utf-8?B?djR4S2lCeEFXQlZYaERJRjBsWUdGa3AzUmUrT1NlSzQ1cUNRTWoyaTc4MXZZ?=
 =?utf-8?B?WkxQcHZCVUNSVk9IMzdZa0JLNWxhVHRxWWs4RjhIOTlrVE15ejNwS2VET1BO?=
 =?utf-8?B?MnlkRmY3eEdQSlkweGMxREkwNjNxYU5jTVN4aUNaYXlnaDFPS1BzT2hXMUht?=
 =?utf-8?B?RkhyVFJNY1Z2b0N0MWtUQVl2U3VOaHVDMEs5bHlERCs0c3dVYzdHVkc1QXdm?=
 =?utf-8?B?OUFaOUwzclRhdEFISm1CT2k2ZnYyV1FuZVVSUVk3c3NFQkhubncxWGl2RVJJ?=
 =?utf-8?B?MWRyV2xPOFVLb0hjMjNyYXJSR2MvQnUxSWhhNkI1YVFnMDN3RG5JOEtlV2pJ?=
 =?utf-8?B?WEsydUxVUXd2bDNKeitlZDFpR3JJSTJwY0VPNUhsbzNLeDQxQ1RUSmJXdUIz?=
 =?utf-8?B?SGk1S25keFJqcEZaUi95MzlmR2ZyWGhSV2lPRVB3N25hSVRKeUpJWXJmdE5u?=
 =?utf-8?B?TXpUR3Y3WHNyQ0FsRjJyTWVWU1I4NlhBak1sbkMzd2E2SWNRcnpJSDZ1MDNT?=
 =?utf-8?B?NWdDM0FyNEsvaVJYL2x1RGZna0tUMWI4Q1RyM2NEbzVmRmg1eVdORW1nMVlX?=
 =?utf-8?B?UGJVS0JnUjBrVmtqN2ZEVk1SSFpxbUpUMkQySjUySnREZ3Z4cVBMY2NDSjk2?=
 =?utf-8?B?cWNEYzZ4QUx2TGJ0U2VLb3NaS3pNRFVieGdDUWxmQ2FtbS9weDVhYlJFTHJ1?=
 =?utf-8?B?UlplU3RKTkhnTUg1QVU0ekI4VnI5dTkxY3pRYzBTWmlZaGJtWXFtRGRiOFVP?=
 =?utf-8?B?V1RjcFFaTTB2MDhMNUFYMFQzUm5xSThvd3haSi9SdmRBRXEwcFRtWS9WSHdz?=
 =?utf-8?B?QXZwaWFYZHZDVmZoTm8zWXlEbk9PQVdDTlhYTTdQK3FEWnNBaGRFUVR2QUhM?=
 =?utf-8?B?aHNxR3ZEV0VLNmMvVnowbVBtYW9SM3BwQ0tTTHkyb29oSGQyNUhpdDBYckVF?=
 =?utf-8?B?T3E4ejZySzlLQ3BQckpXRzZ2UGc5WGU0dFR2MjlDSDYzV3Q4UWtPallSTFJQ?=
 =?utf-8?B?VmVFU2lONUhGY1VkT3k2ZXNjRU5heEs4aGlwRGhVOC9NVTJXYUFyaXdZc0Rs?=
 =?utf-8?B?UHd1R0dlVUZQMnJKMVBjZ1Rqai8yUWVZY0NrWW9IOVJiV1k0eEVVK1VPWGZY?=
 =?utf-8?B?czYrc3MvVjRtOFFLNk1uWGFLLzlYV25QZ2JWY2Roa3hxZERHck9FUHdmdEZt?=
 =?utf-8?B?VUcwT3AyWnpVV1YwQUYyL3pNME94ZlhyZDF0eGRmNTJ2TTRiUjZTUktQeFpz?=
 =?utf-8?B?VW9uN2pvZlNzdVFGSWtESktJV3F4RTFGRi9CNkpYQnpJb3pBOWtNajZ1Y2Fo?=
 =?utf-8?B?Y0k0Zkh4MVdCZTNFVTNRaFovdFNqUTNrVGlGYWRLQzZJdkVLaFlJaTYzU0F3?=
 =?utf-8?B?R3p2eThGdlliZVZPMS9ZcHRialpRWFlDUURnM1dMUmR5WlByVVJ6VTZidFl2?=
 =?utf-8?B?eHplQmVCT1dXa1RmeTZXRHVDZFN5T2ZRVlZwYkRrU0JWQ1QweExzTndaMUxv?=
 =?utf-8?B?WXkvd0FKVGo4ODFKdmdaQWZ5V1ZvMFBocitxVTArNWZtM0ZHaWp6YWJqNDNR?=
 =?utf-8?B?OFNzWXI0ZjV5S1QxdUVDRTRDU3lFWWI0NFVFd3ZFM2Z0bk0vMVNGQnBSTGxn?=
 =?utf-8?B?RU9lellHRVJlRkx5OWExYUVsaTY1M0d6WGVGU3Zra0MrMG93M2RIb2ZYRmNa?=
 =?utf-8?B?SE1PU2JGbmxWY2NKanhBaWllVFRFTVc0eElaUnRRSklrUXhLR0JyckFLc2lN?=
 =?utf-8?B?bzJNRkdXOHAvYzJrT2Zjb2NIUTFvL01mWHM2S3pSbFh3RXVOZFhXdkN1YWxI?=
 =?utf-8?Q?V/m5eU4me2d0usTZy2Y+W9tau?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da267507-9253-4a31-015a-08dbd39eab53
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 08:04:23.7239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pORMEhTI/+FpgW4EMHr1JtquNu0EYzNYZ1Cl7NbeXm73dW3Q7sfCzNTE0wg4r0luD3rlZNcI5mrEnbieXadcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

On 20.10.2023 22:26, Andrew Cooper wrote:
> When in use, the spew:
> 
>   (XEN) Assertion '!memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE, (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE)' failed at common/xmalloc_tlsf.c:246
> 
> is unweidly and meaningless to non-Xen developers.

Just to mention it (no objection to the changes done): While I agree with
unwieldy (and I'd add "of limited use"), an assertion message not necessarily
being meaningful to non-Xen developers is imo not really a criteria - that's
to be expected in various cases.

>  Therefore:
> 
>  * Switch to IS_ENABLED().  There's no need for full #ifdef-ary.
>  * Pull memchr_inv() out into the if(), and provide a better error message.

Thing is - this "better" error message now ends up being less specific, and
hence could mean also other kinds of corruption.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Observations from the debugging of:
>   https://github.com/Dasharo/dasharo-issues/issues/488
> 
> There's a further bug.  XMEM_POOL_POISON can be enabled in release builds,
> where the ASSERT() gets dropped.

Just to mention it - this limits usefulness, but doesn't make the option
entirely useless. The poisoning itself also allows certain cases of use-
after-free to be caught. The assertion really is "only" about write-after-
free. (Maybe the improved error message could indicate so?)

> However, upping to a BUG() can't provide any helpful message out to the user.
> 
> I tried modifying BUG() to take an optional message, but xen/bug.h needs
> untangling substantially before that will work, and I don't have time right now.

I agree with Julien's suggestion of using panic() in the meantime, as a
possible alternative. Question though is whether it's better to halt the
system right away, as opposed to e.g. permitting orderly shutdown to cover
the case where the corruption ends up not being "deadly".

Jan

