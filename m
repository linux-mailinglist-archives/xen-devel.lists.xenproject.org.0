Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDCF5544FE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 11:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353665.580623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3x7q-0001L5-7O; Wed, 22 Jun 2022 09:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353665.580623; Wed, 22 Jun 2022 09:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3x7q-0001J0-48; Wed, 22 Jun 2022 09:58:18 +0000
Received: by outflank-mailman (input) for mailman id 353665;
 Wed, 22 Jun 2022 09:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3x7o-0001Iu-PP
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 09:58:16 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50089.outbound.protection.outlook.com [40.107.5.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d57bb5b6-f211-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 11:58:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7098.eurprd04.prod.outlook.com (2603:10a6:10:fd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 09:58:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 09:58:12 +0000
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
X-Inumbo-ID: d57bb5b6-f211-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fB0axncoFDciVTYpHWcBLdQF9c6iN1nR1jq9NzqoQowzqUUd6BPkoQwef61DKfN1qs6jNt9D/p2Iv83AAlPpofwkKXAOom2dvCCzXdo/OJkMgcQ9TGhODO3uAF4B0eSXKWpOinxB4kdSFrqKvoWf2V5v7OCzhpyzhvOgIF8M0jc9N2jSytYI5IXdHLpJU5VJKpeyF1BXYPahD5260sgf2VOKXmpfeKUCsMa22XnX1tZICTuVzX+9JPwD13MfD4Epa44SMscxxOJ0sipjNdJrLQVzl0q1XFSkzs7/bJBZBHvZjnHKQx+4/EuZOejhRTa/alEyq6J7gbWCDEjJuYH+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9XvSjWts0tVBpj71IZMlvk5FpDg77U4Xa8DuTdlaKI=;
 b=M3XBMTxkvl5yqxt0tD+ck0SJvoTbzkPkh2ZdN8Be+N/KUt6hBOciXOQD/YR7Se/VBqgHKpSh/5iS9HxfpGAFXrHEqIAOPs7zVGlCJt4yMPcEoMk2SewRnzhqqeKXL+7HO8i3rTbTE2bGqrvpQfLo+dK0eqHJExMICe4QGfj4FLLIP76VEKjnvbySAT96uwdhm28+Z8Wk5zGFDhZMqFka372uSyAef2D7mo+Hv6UIZwBZr+OyqRCzuL9RI1aUWpwmPZIWQ2olJafVt5jM7RHqri5GLwakMN/b+8rKhJrqhCOFg83jSi0UXDHgODb9VS9osfUFOPc0XlijjwYxLKYgDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9XvSjWts0tVBpj71IZMlvk5FpDg77U4Xa8DuTdlaKI=;
 b=N75O4KSckeyLZxsiIQVfwPNFQipFZVDVIBQ2WfhqmJrvdTlf55cu8Jctdn4UN9X5PyhmmcQIFeBP8yuS42JlJKbi8NbM/io923XzWL+Mkj57mjfex4yK0YQqZ/AJTS8zE/3gQ1AaaX7C+Nu2aZA6oE0ISLYBSTUeJgMoY7s6wLGGpAL4axa41R34cwv+fKO96+L/4NAuazHGrQCmbObNkcwYeXrsQoGJjz9j8sLfx0qorM2LnqH1ESsDilNE0eCtM8vBvwX+7vfIbnfuwzLlX1kMNdBsjrFpOagHQ438S5ky/QWF5eCoUZ1dvP5fNtNK/plx4dA4pDbkMsBO+1fpww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3066680f-6213-7190-3f2d-d05edae723c1@suse.com>
Date: Wed, 22 Jun 2022 11:58:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] x86/mm: Add an early PGT_validated exit in
 _get_page_type()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220617104739.7861-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220617104739.7861-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0054.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68df0b5c-0249-4dfc-144e-08da5435b7eb
X-MS-TrafficTypeDiagnostic: DB8PR04MB7098:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB7098C543474C46D3C942A3F2B3B29@DB8PR04MB7098.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VqF1BwZG/wgJtnLMn8p3jXH+ww57UsrkcexLUfHgn05FzzKMpdpgGEX3Ii5s3FoeBPbJmtUUfkcuJp2fkU4cBXnrkIym0nfMkBpxU2a5IkXD93lfNPcW/6FsXYaCRUPkg6eH4VDONYtqyKiz9UImWLmpRVISn8hmZKjt57Q6rreo0D0UzW/j3BPIg2fgfa8W8Us39ooxmQN6IQI9QeVH4Qw8hGKMTLCknLcksKNA94uwywv4hEQt2+W1gsvRi3QwAZ37SrjHsdvNQKMaLdh+ZYxjSGK/c4EPo0ayJblLampoO3WxS7v/gKm8Pkdw0LOxjT8sO+sb/doVme5e1AtE5MbT4qA3ixkuwzfCupBuKw7m+FffV4HhHxSP2ngkMVvMt7j0OKDDpkBqcmPt0aGSbaU1rBZiNvIb7xgIWHnn3dqjGJMAr3AeirjG2UZk1yhvGRKxlKhM0bweJpAkNp01W1D4Bi2WZL1hbEFU7D0q3S1JKiIr1zixP+YWgPOr0lJeQdBWt8gZdjCGQkSAlSiSmlAulcg5bLs3Zz6eqKEvztj/tC+Co2HNTz6N8tXm1PLGzFDdd4rtvOhOpJO86CdaJy21HnORr9TnBe5SqMPxI9P9wdypIZ+SlARjGzU4ESDy6gzB35BwjXBzaHOmeqXPAGnEryXEbjlRW5ERO0fXjbixFnqlU5V0tjL9VpW2RPi8vKfPEmMnL45cl3o05kzDUzFSOG26QALJ2Xp/yNe8OZ5R4VTUU9SFpZi8xMJy0czqvYScvhQ5FgzTiMb4Gb1KHbgX1dcXbvrquG1b57+Uzx4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(366004)(346002)(376002)(6506007)(2616005)(6512007)(186003)(86362001)(41300700001)(38100700002)(26005)(31696002)(53546011)(66476007)(66946007)(4326008)(83380400001)(5660300002)(31686004)(8676002)(8936002)(36756003)(2906002)(6916009)(6486002)(66556008)(54906003)(478600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d25CRCt6djllQS9EOElFaVJEcHN6bTIwZDBZekhLeWY4QlhDZEkrSW9nZVkx?=
 =?utf-8?B?M2NYT1Q0Um5LUm4xSytvR01IMmZNS2FTR1RlZWpRYUhZVmFJZURteEQxYzFM?=
 =?utf-8?B?OU5ESlNXNDkxMjJzQ3ZoejlDSG9zNnRLQU1rcWE4dHVSazV2QXQyQ3hjVFJL?=
 =?utf-8?B?bmdSSFNIWS9FU1ZBMlc2elE1TmMzcDZsaGg0cGl1b3dEL2h6a0JVdGxrSDJK?=
 =?utf-8?B?L1lzaVF5dDlkOFdPdExhaWg3aHpDWk9Ra1lsU0NjdUUwYTQ0bU56eDJyNitG?=
 =?utf-8?B?a0NtYjYyaXJqNHZXZFJrOTJyakxBdzM2QlM4MFNpbmFJRnFnRThWbkREQi80?=
 =?utf-8?B?RlUvYkRZOUJnc0hwV1EzdG5KUlR4MDMvMjh6UmxXVThCR3lqM3ZTRnF3Qno0?=
 =?utf-8?B?cE5wUFN5bHJZOW1GL1hDUWJiRmdKOFlkYzUrcmtkK050STA0cUdXc2tHWURy?=
 =?utf-8?B?U0ZSek4rQ0RoTGJPdzVrQnhRRFVwdWtKRWYyKzcxb1c2RTBhaUZrWGpTOW9R?=
 =?utf-8?B?ZThoc0lwbm04RFpNTGtNaWs2dTEzT1BuaUpFSzl0TnRxZEgwRVl2VkE1NlRH?=
 =?utf-8?B?ZjhzR3hMekltWkx3L05JY0VlaFNBWDRTTXorZWFVTUJyU01IMG5xV05pcUJq?=
 =?utf-8?B?c2g1Ni9PVllHQVcycVFmNEFvdDZFcG1pSmhPMmV3TnlGbC9qQnRiUzd3d1Er?=
 =?utf-8?B?STR5bEpQdDk1YnRPTk41VXRnRjJOdlRaejlqdnk5SEppVVZqSVRMSXFQY2p3?=
 =?utf-8?B?UnQxckFJQTdBL2hRclFldmRlZ3dzM0tydWRFNHM5VDFFQW1ZNStWY1hDUFpr?=
 =?utf-8?B?MWZkcUdxRWNaOGI0ZGN1OFhpTU5WNThyWGMxYzNrMmdMUDBOaENFMXBtRHhN?=
 =?utf-8?B?OVgrcVJCMUJQTm9JQU5PWGNhdHBxQlpaeXFidFFkWVhRbExiRE4xdStOSjNr?=
 =?utf-8?B?TjJ4TEt2S0x2T1hiYWhjRENwUmpNY2FManVvcWp3VDByWTM4aWNtb1cweFd6?=
 =?utf-8?B?OU1pLzBhWnR4SnlmRDUyQnhqUUlGM21QaHpBL2lNZXFqaUU3WlhrQ1FoTzVQ?=
 =?utf-8?B?ZnQyM0VpTlVmNExuZFlocDJ4c24wbWFnU204R0drVkVOWnh4cWdJNjdUTkN2?=
 =?utf-8?B?aGdUNmlqdmZjMDlCZzh3WnpXZzRtam9CM29qL2NMRkVJcnllejllME1RYlEr?=
 =?utf-8?B?dUZXTVpmY0ltU0VSNXNNWG0vVCtqZlA1N0dsMitDVGNYOGFDUjk5SjV3ZnlN?=
 =?utf-8?B?TXpFTlk1dGVNY0pLQXRIOXhnUGlESVErWFl0ekpkeHczQXU3MzJBUnAxMFB4?=
 =?utf-8?B?VjJ3Z0FuMmpaNkNWT3U2N2xQNTNGR1pCTTBYSHVKclVsS3V6K0dMNTEzRy9w?=
 =?utf-8?B?ZVdHSURLeW44OUJtcnFUcnFJYloxWURHZXl0OUxjNzJQOUVjeXJlbGxtWWZ4?=
 =?utf-8?B?RjcxTHRaL1JUeXN1a2tyN2cyeGd3Ulp4aG1vTnVGOTAyWEU2eDRVclNSdkZV?=
 =?utf-8?B?ZnMwTnJiekJKVGlSY3JsTzNTaWpUL05OSUpVcEh1Tzh5bDdENEpnZGZwa2ph?=
 =?utf-8?B?L2w3QVkybUFrYjlSNFlWN0pkNjRpMjFrU2NkQVl3aDNXK2tLVzhGdFpYUFVL?=
 =?utf-8?B?OFFlUXF4M3VRZGlSVzloL25WTithNTMwK1VVV3J6bzhYSmNmVGoxZHdSWjZs?=
 =?utf-8?B?MCtWYjFpMWFWNHFqZWg4bktiaGVOcEw3aG92cVJMWmc0L2dnTHlXQmJ5d3Ni?=
 =?utf-8?B?UVFJa2tTKzJXNElIZHBtU3pJZTRnV3JibXZoME5WSVBEb2hRYUlxOTVFbWo5?=
 =?utf-8?B?M0VFekM5QmZPcFdYS2lRTmJCcnpwRUx4WFNLOE1JTEVyZWNSaUNKTnZZT1Ar?=
 =?utf-8?B?RXlGVDdqTlAxNThKUEJlcnpjZnpWQ054aVVUenI1bW1lbmJHbUI0djY3T1VN?=
 =?utf-8?B?VlZYNVEyKzhFdDRHOGUvcmEzRmpmZVJ3c1hkK01mM1d5UEtDODZHUjRWcEsz?=
 =?utf-8?B?YzdKZ0RyWks2YkxwOE9mbHV2U1ZlZC8ydGlmVlpIVVd5TGF2RFNkU05UVmJM?=
 =?utf-8?B?enJSK0trSUl2bzMxK0lBd2R3aUpEWlBuRjFwb2JvUEJ6UGZraExQVHhJNFVV?=
 =?utf-8?B?K3RLM3FWUXNlQlQzZFB5NmtFYlpWQVZrZTQyUWg5R29GMzZaRVMrKzZuU0FU?=
 =?utf-8?B?eVVvK1B4V0tOb0hBWHFRMUt0eUdMQmdxWWZhQ2IvQU5ac3dJSVoxYzZSUlR4?=
 =?utf-8?B?a1dPTUxxc0xpaDVWTnJHcE9URXd0bFJNNFNaNGU2TDhxVVMyNUZvRUVRcnBC?=
 =?utf-8?B?MnI1U0NWQ0VSOHQ2MlJYM1lNQ0NKbGI4OS9pRFcxUFN3cUg3eFM1UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68df0b5c-0249-4dfc-144e-08da5435b7eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 09:58:12.3701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGllCBzVFR1l39sfCeHAlETE8w7ToKpbGbHP5a42ZupvOZlbaiqJa8+Wl/n/xzq4vUsE+zwDfNKsEQh4mosE4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7098

On 17.06.2022 12:47, Andrew Cooper wrote:
> This is a continuation of the cleanup and commenting in:
>   9186e96b199e ("x86/pv: Clean up _get_page_type()")
>   8cc5036bc385 ("x86/pv: Fix ABAC cmpxchg() race in _get_page_type()")
> 
> With the re-arranged and newly commented logic, it's far more clear that the
> second half of _get_page_type() only has work to do for page validation.

To be honest "far more clear" reads misleading to me: Part of the re-
arrangement was to move later the early setting of PGT_validated for
PGT_writable pages, without which the stated fact wasn't entirely true
prior to the re-arrangement. How about s/far more/now/ ?

> Introduce an early exit for PGT_validated.  This makes the fastpath marginally
> faster, and simplifies the subsequent logic as it no longer needs to exclude
> the fully validated case.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Preferably with the wording above adjusted:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Not that it's relevant, but bloat-o-meter says:
> 
>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-300 (-300)
>   Function                                     old     new   delta
>   _get_page_type                              6618    6318    -300
> 
> which is more impressive than I was expecting.

And I have to admit I'm having trouble seeing why that would be.

Jan

