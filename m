Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC71712094
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 09:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539975.841369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RUY-0000dr-17; Fri, 26 May 2023 07:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539975.841369; Fri, 26 May 2023 07:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RUX-0000cE-Tt; Fri, 26 May 2023 07:04:01 +0000
Received: by outflank-mailman (input) for mailman id 539975;
 Fri, 26 May 2023 07:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2RUW-0000c8-IH
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 07:04:00 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe16::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ce32203-fb93-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 09:03:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7606.eurprd04.prod.outlook.com (2603:10a6:20b:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Fri, 26 May
 2023 07:03:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 07:03:57 +0000
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
X-Inumbo-ID: 7ce32203-fb93-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe5paRYqS0CjEzBmXzIAog+9OPWjuUY6UPLRklSI0q08rBQ2UBsiYA0PJ85k6cbkOTGoQsAbBM0vX6DD3YE9UB1mkh+cLzXhiMz7Yb8CiVDFI3UHQ2p1tbhxn185PGbtBYiVNFzsLKSpEiHK75Trd6/lbdU4W4YbR1CGI1zeg07V/ZheJzCYaX6g3GAepghme3npG1qpv+sB0DPsahUyCV1j0nPolg6HYrbFkof/Qd19PywFUNGwZ5BQ+GLqrYHiPh2Xzf3S52resybSwf78uXT4+aLpmsvQlkBQKN3Z0r970RZQAJG7rSdJhdkdQecAORCxIFKQBNpgsvgLfXmO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZS4E3RE0DPANCemp9MMAnYN7VeL3U/TsArg9jnn23o=;
 b=LAhNLJ+IQfjRbS1NuXV0lwQqfra0uPwCXUjKy9V86FJS98hgGghJPge7MTfDrTh0DRmRWvlueD4iaV66efaja0GXKelYco9MgJm59zqo4a1WOYwEL9TZDZaaYYdrZYDileh8ZaDivnUev5mBwktasaKgPYdnbuwRHOsvT4srzpHeAOStyjzFAZpAe2quy7/32jWMzGsGTAs4iSSH5saqDoxNG8wvxo0uSUJ8lVzNHLa/1XN5ajM1gt+Oi5firg7D8v158Wkmjk/Qbwkq7p4ITpnt3HxrPJqDJfTU/wxWpUkCNCzrwpDPy2DSGpYGTdG9joQR2daM1/Tox2s6dX4Faw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZS4E3RE0DPANCemp9MMAnYN7VeL3U/TsArg9jnn23o=;
 b=EtDWtWpMLLVPXbiopkn20meFSgP6P9q9uX2/K+ZUsUVEdplX27mX5TCICCFhEas/z+YNBZARhwmnmDTaYlR3OEwTY9v7bPHzvZyhlFz2CQf49SABzT9KN6/paYSktqn+pt0J/AkKq5nhvVeEp39PClLL9VzvJTp36b82wPjsq5s3SN4BX5CpOoSbWSUu+3nrQPwFTZuFZV8McmqxCANp6zWa+rdsFCF89gLJ56qFWyJJRngqfrG/YIb6nZSFHGo4jTtW3NEns4xYlwnbl/jY5/627ahMufiRBAsj8KvVcFAsOuA4mETkzdSmOyu94FvatafZk1YBm3npFCTmGF5ACQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c143dc69-20bd-da87-3d01-d405c358fc67@suse.com>
Date: Fri, 26 May 2023 09:03:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC] Xen crashes on ASSERT on suspend/resume, suggested fix
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 xenia.ragiadakou@amd.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop>
 <ZGzFnE2w/YqYT35c@Air-de-Roger> <ZGzSnu8m/IqjmyHx@Air-de-Roger>
 <alpine.DEB.2.22.394.2305241646520.44000@ubuntu-linux-20-04-desktop>
 <6790d5ae-9742-f5f3-bd8c-62602ee9cb1d@suse.com>
 <alpine.DEB.2.22.394.2305251248000.44000@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305251248000.44000@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3910d8-0915-4b64-fcac-08db5db75f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kNaDQs2UNg6NSmt0vKQnUl+sobJ4WuvXIxgSA5ZuCV0kcCfzoTQDGgk+C1z6y+dCbF0wCWVzSFMf8y5nK2n931KYNR4eVthHsRHhej4jUeP2fInicH/g7RFQwm3E/F9v0bCtny3T7ENzWbRnxvHJMD7Ys29yWiuPzXzu52FBzXWsD9Tow1HIdwq5nNyijVxZo81GSwWWevc11FTYQw4E9f4UCiIHg5nHZ0M7zEygoR2FfIJZtkHSQ7J0KYebnP4ROXfT9BJF43DxoZVwZliKo5eDmEbhEF8Jc03jQhyvl/9Y+g/fzXJZQ3WmawkJzKXMOvdmYKPY1GHPf1/S7NsIWg4pP/RuObrxowCZ1TTJQutiTssEPBU7v4dT84Zo+s4Mjl8YyrF+QjXWxqxi14DZPe0qmQ+uO+ipao/wMqUlVvc8G+tMlnggI3xr/jh6RqOGXsDRnMZ6rka0DelkhqcxlNKYaykY1/XpfLQEew0qQ+CIvnrQ3sD1xrY6q/j2XplsWoKuy7qu4GRuyuyB0UhD05kDNS9dSZC5yyh7YluMOaDdOp96zec+H77apHpmgh2QPf/zkdEfp2yw3O6dDbdp0iSs3M2h2KVv2G8J7MR3bpltfTm2fMZOxC9c2+zWVAjKOkB0s1g6zQ+ycymQee/9AA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(31686004)(4326008)(54906003)(66946007)(66556008)(66476007)(478600001)(316002)(6916009)(6666004)(6486002)(41300700001)(5660300002)(26005)(186003)(8676002)(8936002)(53546011)(6512007)(6506007)(2616005)(36756003)(2906002)(83380400001)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHNRSlJ3ZGs4UUVwYnFHd1NhNGVYQzRlZWMrR3ZuV1ZYTmVUa0VaUDBydFZL?=
 =?utf-8?B?SUR2QlNZRXhiOUVscmlud1hpRFNaTUlzR3o0ZDFuRkhuVHJpKzY4K3hqU1Vp?=
 =?utf-8?B?Sk55dHhlakV4T08xK3F2eXRrTER5WFFpMHBRZU01NzF5dnpUZEtLcHBwZ0sz?=
 =?utf-8?B?UkdzVG1zN0JmZ0tzNEhoOVN4KzgyZlQ5MzBOV1J2Sld2enovTVNOZkVLRzAx?=
 =?utf-8?B?K1pPcmVnbnpvZ1NEQ29lV1ByNDhENlZEdXZOaGhGUHhxUFFXK0RtUmhVQTQx?=
 =?utf-8?B?d0pKT3BLc3pHQmluai9DNFp0ZEdhWkVuLy9Yb3RFeUN6bkd2NTlSUWQxdEw1?=
 =?utf-8?B?aEdaK2hoR1VKZ0I2ZmloNmFmMG5CQXozNjV6UWtKa0NYV1dPaTlSbk4vL2Jt?=
 =?utf-8?B?aTVTdUZNUkpndGtOejhQWS9DVnZNYTlRamFLcTJMNnRiTXBVVlhEU1NYSDNM?=
 =?utf-8?B?S3VpRUxjcXVzWDNkc3RYQi8wUkdvWnEwc0ZDTVh5cWhVQmRmOURET1Q2U0dy?=
 =?utf-8?B?MituQ0Z2dXgyVXJ0NVFKTWthWUh0aW41Q1NBLytRZVl3aVJ6OHYrWW5TNi9q?=
 =?utf-8?B?ejZMUmNjdC9La09hMG1sVHZ0Q25WUnFEeHFqSno2WEVuYXI1L0JlNkhSeVly?=
 =?utf-8?B?Vk5yWWt6UEwrM3BHYVYxS3ZreWFNU2J0V2lZTktNMVM3cjBvbGRpS29hTXB0?=
 =?utf-8?B?b05Qa0tFQnFFYlFFRFdDTHlYdjkwQkNKeHBQZFhReVJjNlpUaDMwcWhhaUpC?=
 =?utf-8?B?WExxU0pROVM0MkNYZXhlMXo5OHdoZkF0T1czVWFwZkdvVVM2c0tlSGJIcC92?=
 =?utf-8?B?YUdtNXlPVlF0eVgxTDIzbkZpTExtQmtoWTkzZlgvOU5LamhzSzYxbWRnVmt0?=
 =?utf-8?B?R1Y2V3dyS0dkZEhSSU9DTURoRzlRUWl2WnBjWENvYzRhS0VBV2lJMVZ4TUQ3?=
 =?utf-8?B?OWRWWHVKWnNha3BFb0xSeVNTUUpaWk82TjkrVGR5VStiZUw5UUxyeGNRbTBJ?=
 =?utf-8?B?TG83dkx0Z1RRQXlsK0Nyd2xkOEs4WUJZK2QzQ2hQQzl3Q2JLZHRHTUE0enJr?=
 =?utf-8?B?c0hsMi80eHZOalBzdkVOaDc3SDhkR0ZuSk5jWmEvNzFWL0d4MUVMZGxlNnBB?=
 =?utf-8?B?WXAxUklWN1VwcVVEYjN4Mm4zWExROVJ5aU9hdk9nNEpMN0lQcGkyZFMwSjY3?=
 =?utf-8?B?R1lzckxPb2xLTmZrYTduNXdxWVVlaWFFOWJEbStsVWVnQWpsK3loU1NFRUpm?=
 =?utf-8?B?aUF3YUZWNmllTys5U1lqdFNLTUk0TGdKNXhIMThQMnczc1o3Slp0bERIeDl0?=
 =?utf-8?B?eFAyWmxsMU5oYlI5OXk4RTRyL0VMa0Fsd3RWTHNSRTl5V1d1WkJob0FjYnhh?=
 =?utf-8?B?d1hRODJDY3lmeUJJUzJ3dUxPSlRsNFU2dTQ0bDdMMXlNZ01FWkpTb3NoOFNZ?=
 =?utf-8?B?Tmt2TENWcHJzWXhpMGZyak03dVpqZkphQ1FMMitFNTdVLzF3N0ExV1FtWm0w?=
 =?utf-8?B?QkEyWTd1V3NLUmZrYkxmazFxWWluRDJobTZnNUtaVFNPMi8xN2VrSGFxanRX?=
 =?utf-8?B?N2hTNkdJSVZILzAvNUFXNlplQ3QvMEF5LzJyeVF1L2IzOCtNZW1tVk1FNnM3?=
 =?utf-8?B?OURGOXd3SjA1YnA1bFd0QUYwQkJ6WTVCRjNxejZVQVVib1l6ci8xTTRQbFVK?=
 =?utf-8?B?VXNQOG82NkhsN3AvSERQQ3gwbks1WExNVnZTdUpqUmpNdjE0SHc4bTRuN3lD?=
 =?utf-8?B?WjZ1djBya3ZNa05pc0NoOWxMQ1ZXdmsxM1kvTnBON21MRWNndm8xV0pVM2tF?=
 =?utf-8?B?Qkx0L20zUDBrc1VpSUpiVDJ0ejFiM1d3MTBudnRkS0UwUFJReW5BMmJDWDdo?=
 =?utf-8?B?NUNDeFdpRGJvdWhMdjR4L1ZSMk1BWTV5Vks0NmxTVXBnV0Q5dGtURUdmWjNz?=
 =?utf-8?B?UHJmeUlqVUE1cG8wSkQxaUpGOC80R1JPTXFyTXRKS0R0bzdFa3hKV3BHVzhC?=
 =?utf-8?B?VjZzTGVFVVllcU5NY2R0eVI3UCtmNXJVTkVnWDh1bGI5RnR6UVRUbTdwV3ox?=
 =?utf-8?B?MzRFS1NUelFsUGdvWVorR1NPbzFiNkgyT0tCVmZoV1k1d1FWU2RIRm5SQmdF?=
 =?utf-8?Q?A84tCcxDOIkzjVYyehuLeGCL6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3910d8-0915-4b64-fcac-08db5db75f93
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 07:03:56.9734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvPXFKkVVL0yJAO8b7YKGQt5ZhRmthu6K9632KPuV0O1fjupEbqOyibKEUvuRBPl2kyhimfmmyUew+lLVNCZNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7606

On 25.05.2023 21:54, Stefano Stabellini wrote:
> On Thu, 25 May 2023, Jan Beulich wrote:
>> On 25.05.2023 01:51, Stefano Stabellini wrote:
>>> xen/irq: fix races between send_cleanup_vector and _clear_irq_vector
>>
>> This title is, I'm afraid, already misleading. No such race can occur
>> afaict, as both callers of _clear_irq_vector() acquire the IRQ
>> descriptor lock first, and irq_complete_move() (the sole caller of
>> send_cleanup_vector()) is only ever invoked as or by an ->ack()
>> hook, which in turn is only invoked with, again, the descriptor lock
>> held.
> 
> Yes I see that you are right about the locking, and thank you for taking
> the time to look into it.
> 
> One last question: could it be that a second interrupt arrives while
> ->ack() is being handled?  do_IRQ() is running with interrupts disabled?

It is, at least as far as the invocation of ->ack() is concerned. Else
the locking scheme would be broken. You may not that around ->handler()
invocation we enable interrupts.

Jan

