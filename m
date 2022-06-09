Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F335448D7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344990.570627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFNV-0001Zj-2p; Thu, 09 Jun 2022 10:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344990.570627; Thu, 09 Jun 2022 10:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFNU-0001WU-V3; Thu, 09 Jun 2022 10:27:00 +0000
Received: by outflank-mailman (input) for mailman id 344990;
 Thu, 09 Jun 2022 10:26:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFNT-0001WI-QO
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:26:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b12cd6e7-e7de-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 12:26:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9120.eurprd04.prod.outlook.com (2603:10a6:150:27::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Thu, 9 Jun
 2022 10:26:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:26:56 +0000
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
X-Inumbo-ID: b12cd6e7-e7de-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLl1GzD6lA9Yjg0wLBtrRKbXcsD+P2zAg4fChgFRIq3Vngz7uxOS/8d/AxPAEhF8tOP8qrs0z0tvzO4kAoSQ5cWmSqQ9B4Xiaf8LXLUZ8brJcoOQt268ydvZmNRg+3vRh2/bntLG/akmN+zAkcs5+5sAoYCxQXcvhLiGbW8AYrB8P8pXnXDq+sKW2MewDzbQvLOpjOTChltzxdNVgKEhitRXAorV0lW3gPec1by+K9ElgE79Gv/RF7ET0bWDJQLB6LwXXsDGscqzyQRonp63Itm/7xZd1mmm3E9vJuUaLjWMAh2PUJ1k2sqmHeihUcLZc696Ir8dCmIE8AEaiTiQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjjTI/ZsScrAkFB9KLCX3EUQq6oFWziO74v5KgCOXmI=;
 b=RpYYQZqtDpjidbWYwefjgVbMoJ/YbsYFbqkfoOYypFtahEkKshbpoqyFyRRODIZPPt6WU+APnVvlmblS4JDURIq4ASQfSZM4qGaxxw2gqn8tNxT5FujAzJiuv1vgRVzGIV2qd/rvtMy3y0nUCUSznTuooiVAAhuNiCWxK1OcPplDGDxeR3mvZRxZ0tfvaXHSUT20Um7GXpnaVbI5qesr7ku/Y5YHq+w+sf++tftFqmOCD/pGNf1CDMgk6Z0j7dQKRb5tbjoNsQqSOpFhH5sXQaSpF3ohnCUHLqN5hC8e9xn1RG90zxxAeC3IpPiRfV5uXSa5uVie3FFwjXJgekb17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjjTI/ZsScrAkFB9KLCX3EUQq6oFWziO74v5KgCOXmI=;
 b=mD4ukK5U6XYXMm3RLpjjftNSpJKIlvEj0ONDZgDKjJCYVxfvZCz+5SfogGkJsOtuAoVjysGA+ypaZjczSDJZEXvF7NA2rHW+HnwM3HBpk4OX3F2aqnvOy+oB4+xicnlqa3zSubQGcxb3lKMay7YYRXI+EPUIpVk4Ya0WB8oSgY9uaL98ae1TYCvGmcsuEeTXpqeRMLuJkMQHYW2sAEJmNtCc8Sn9mvgJebPwa58J9idzWSz48wv+n7Ul1kpT/cmezE0Q/qtDTy3EenHH+TN3ZVR64c9GLVnHiiPaMhGE/qnbdSCYyk1t1/j5GpKWbYiCLmwVy9b0pVJWmthqQG2kjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d85ad23-a232-eac3-416f-fff4d5ec1a93@suse.com>
Date: Thu, 9 Jun 2022 12:26:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
 <6EE2C13C-7218-4063-8C73-88695C6BF4CE@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6EE2C13C-7218-4063-8C73-88695C6BF4CE@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0001.eurprd04.prod.outlook.com
 (2603:10a6:203:90::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6315980-8c7b-44d5-c361-08da4a029442
X-MS-TrafficTypeDiagnostic: GV1PR04MB9120:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR04MB91201DD5CF0D389055D84E95B3A79@GV1PR04MB9120.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lk2Fdb+9oDfkw8bNNOtlfpsiDnF24APQ4tYDThcU03qre9ZBjAMjO0CRICg9ak8hXBWWXFRLu0Y3ThxddKGGuKk2Rw2mDJtfK0y96SBg+La/Bm1qUwfODthxE7VqXK/6LKgPgtMJH3tusrJ3DB8VivNSjF/zFrz2ivgBlOKG5QeROcVlK6okbrbH3gJsx2ePBXkekf1juCJ/aUd7JzsI+1tNCuBDtPQeHziJJLeh6CejBnCPF//en+hivxZszzXIu8U0VRLXLOyUcL2UAL3OoaOmk0ITcDZ+DEVokutWC/qeOariNIjF/kFsVEm3M2IfFUzCrNJs0ZyeUfJIAh9XpVo6y/itwuAXV60+gYzMnOvDuB+mhdOgV6iO2Y0FhoAmNcaJn+mITnGJwA5B2gpG77kBqL9PhYaF7BakptwJJiOrX+sVF5HJXTOQ3VIVdlmoNAuiVctnSUAh5J8MXuXz0Ef8Ejk/3dsI63GDnEqNxKFIL6Czid7osG0iBzZ6Z0YeruyOel7Q/TxmqG0COHTNnHVw0+6IUbEvE77eS/atU3AMvtnOZSO5L4B1zTR4c8vXyDReuSRgX67BT/RjBKyghtZfo8socCEdOX57fkt9nDg84poEkJrvQ4BUsJESQiUefy/jPSiv4F8EcbPHEoS3dCqeB+4lrynkZGHlmZ4Dd7XlhwKcxlfwessL5bUPyCssgDzOmzQ2Ly8sC3peBuw2TJ4le2bXXVCblJvfImrBd3yIJGEtGtvfvfIPNXio8nFR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(66476007)(31696002)(4326008)(8676002)(66946007)(6506007)(5660300002)(66556008)(31686004)(6486002)(6512007)(186003)(86362001)(53546011)(2616005)(54906003)(2906002)(6916009)(316002)(26005)(83380400001)(36756003)(38100700002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmJma0ttQmVMc0RPS0w3UlNFeFZFRndoa2hIYlEvckt5RjNieWFPcVEybGZG?=
 =?utf-8?B?ZTRQYzc3K1hlTFFHNzdCSGdtVGo4S1cveWxzRjdwOUZUU1R1R0RNNnR6eEtN?=
 =?utf-8?B?d0FqOURKcGQrYTh5QVFYeU9MMjlRTjZ4SVZBQW02dUVsdGRpS2tsdWhNUDdh?=
 =?utf-8?B?dElGOUc3UFlMbXpMNTd4aUpXeU9YcGpkWXVHdGdwdng4U0RSWVNmeE10c2hQ?=
 =?utf-8?B?cE50RW8vWHE4M2VLTTAreXB3WEhwZmlOeENwWS9kRktlTkF6a21UQ0JCT1li?=
 =?utf-8?B?RWJjT2FmZFNzSkJuSzY0cmJFKzY0K3RKbEZwUW14YzJFY2ZqM0RDTFB2ZjJV?=
 =?utf-8?B?ZnVwRjBuNHNLR3BNQ0hGeUdYRENvM3VTOVNocmFTcXRBZXprRWlTUlNjSzlE?=
 =?utf-8?B?YStpYzB5NU5VVDdlR2NIMTI3YzZ0ZG5QdHpScXFxeCt5bW5QYlE3TzN4UjZT?=
 =?utf-8?B?VWZOUHBuR0k4Vkd4ZmRwd1FYcFhhelBnWk1KOEFsbjd3U0hrREtyNWdOWGtD?=
 =?utf-8?B?ajhkQjFwYW40a1BQVEs0VHZvdHc1Rk9KN0swc3VJSGpjNGkyM2lqLzZ3anhz?=
 =?utf-8?B?MnV5ZzFJVCtnV2JTRWZCUUVwemxCdnBLbGRXc2c0M090a2ZZeTJIK2trcXdT?=
 =?utf-8?B?alFsd044bTRzNWtPR213dDlWZGJXbU9mWGoxdjZwdXpPZkwvcVA2dzVab255?=
 =?utf-8?B?a21wVGFnanEwREtMazRzUnpKSHJSMFdrc0pyY2creG9HRGVTYnkrTEVVOTN5?=
 =?utf-8?B?cTJST1RLRWFTajVsYmxzdVFYWGw2V2ZQVUMzUXpPYVhpNkpnVzY5bytkcU1C?=
 =?utf-8?B?NjgxdFFQQTJKRDFZR2hVSWp3VzVOWWhmVkcvUWpmdGxBRWlGclQ3bDZCcnlJ?=
 =?utf-8?B?UjFEOXk2UU43QjdzcEh4UUxPd2VwTUVpZjA2NVE3OTZnaWlvSm9OVzU0Ui85?=
 =?utf-8?B?Qm1xci9ZdVlpNTh4UkV1WEJwVm5ha09FTDJWbnc3dHJHQ3FqM0hxVUZ0azFT?=
 =?utf-8?B?NFA4a2VXdXFiYTJ1cU1IODFUeVFtTU1SZW5OL2FNZ3hDQWUra0lTdHVWTm1h?=
 =?utf-8?B?dkZMY1NFMC9aU3lsNDNqc1loVGtjMmRRQzgyQzBkOWwzOTJRR3VvRjIxMjFX?=
 =?utf-8?B?TU5HQ1BRaFdaU1Q0cUpJb2xQSWZrSU1RUk1QSWFRRnhRbE1GdnVFUnExb1o5?=
 =?utf-8?B?TkpiMjUwajVZSThkYXlZUHJVQ3JIRG5laXppZjAvbVQ0UHdIbmxyZTRPM0ly?=
 =?utf-8?B?b3Q0elk2TTl1ZUc4cWp3dDNhbjdNRTJ0MW9HQ2c0OGNPTTRkWGVQVFRSSWk3?=
 =?utf-8?B?MW01NzBQVzM4VTRyeFU4N0hiMHQrM285WTZRSXUxcER3NXlXYWx1QWtRK2p3?=
 =?utf-8?B?QjByTkxlaGxyNndqSXo3RENaTDFYcW8vcjZYWllGSUw3bm4vdlF0S1ZJc2dm?=
 =?utf-8?B?TnRGaXpuSCtDMFpOdllKNDdaanp0eG9KSDZObGFZbGMrWFA3cG9YRHJNc2ow?=
 =?utf-8?B?OVdqQVM1Zm5WU2VBd3k4R0VmdVhEbHBFZkQyNVdSU1pLd2EzUjBybmVLaC9K?=
 =?utf-8?B?bU50cmx0TEY5aExHSlBBbnpYM2NydjNBb3I1M2pQaHNaV0tQc1NFTWxUT01R?=
 =?utf-8?B?R2xIVkZtK3VaUW5kb3RyZ09RMC9nV2FTL2R3N0R5Vm1hdWlPaXhKMW9mSXpX?=
 =?utf-8?B?TTdRVFVoVjd2dDhuMi8yb0hkTXd3a1ltZHk2R2JRZHhFdVZDMW0rK1RJMGFq?=
 =?utf-8?B?SmFOYUdpMHBjUkZaQ3dDZ09WOWRSSjVZOWZpbEgwdmlwZks4Ym4vcWtxSnEr?=
 =?utf-8?B?TUEzUjBFb1VOaGg5a3dQM2xNVTBNb0k0eTVaTnlIeVZnVFArajJ5N3RmQXIr?=
 =?utf-8?B?WEVGbzFMbGlmbDA0cXBXeDVtbDR2WWdrWHdZMncwOFNFd3U0QzRzaEplZ2c0?=
 =?utf-8?B?T2E0REtJTzVKZWxKc2JoQklzSVJ0cHZxZlRRSExwTmdJclNTTUo0WENYbS9S?=
 =?utf-8?B?Z1E4bEdTYWRscVVCVklCZjNPaytGejFVNVk2YVFFREkwNGJhZkdYWWVZaEt6?=
 =?utf-8?B?QklORDRIM0s4YzZMbDA5ajltV2xuL1N0NFJEYkpTbGdXQjNKUUdVNmhNcjRJ?=
 =?utf-8?B?akFpd090Ly9xRXBmTnk3RmFDODcwektKajA4ejJoTHFicEsvTUVpUGtSRkRv?=
 =?utf-8?B?bUFyNGNDUDU2eFVsM1VjU1hwUnZLdmlWLy9rbWNmYXpUU0FNeS95TWdVUUo4?=
 =?utf-8?B?NFhlR2RFcVpDcHIwMVBmRUE2T0tlblIzQVlKelVjR3FsMEliVXJzejkxUlg0?=
 =?utf-8?B?c3pFT2VySE55cEVtVWlNQ3cvNWw4UW56T0xKc1lHTzlrNlp0ZUhJUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6315980-8c7b-44d5-c361-08da4a029442
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:26:56.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Gvpz2BUYcU0Q4fPlFYMjxd3MLFGAGXjMzX8OAa7IuDXlMN8VJR0HBKPaadCXchp357TsZLHMUYEAgCPxuI/ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9120

On 09.06.2022 12:16, Bertrand Marquis wrote:
>> On 1 Jun 2022, at 17:59, Anthony PERARD <anthony.perard@citrix.com> wrote:
>>
>> Use "define" for the headers*_chk commands as otherwise the "#"
>> is interpreted as a comment and make can't find the end of
>> $(foreach,).
>>
>> Adding several .PRECIOUS as without them `make` deletes the
>> intermediate targets. This is an issue because the macro $(if_changed,)
>> check if the target exist in order to decide whether to recreate the
>> target.
>>
>> Removing the call to `mkdir` from the commands. Those aren't needed
>> anymore because a rune in Rules.mk creates the directory for each
>> $(targets).
>>
>> Remove "export PYTHON" as it is already exported.
> 
> With this change, compiling for x86 is now ending up in:
> CHK     include/headers99.chk
> make[9]: execvp: /bin/sh: Argument list too long
> make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
> 
> Not quite sure yet why but I wanted to signal it early as other might be impacted.
> 
> Arm and arm64 builds are not impacted.

Hmm, that patch has passed the smoke push gate already, so there likely is
more to it than there being an unconditional issue. I did build-test this
before pushing, and I've just re-tested on a 2nd system without seeing an
issue.

Also please remember to trim your replies.

Jan

