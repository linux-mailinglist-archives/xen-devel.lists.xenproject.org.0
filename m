Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202EC58A8EF
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 11:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380943.615402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJtod-0007tb-6a; Fri, 05 Aug 2022 09:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380943.615402; Fri, 05 Aug 2022 09:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJtod-0007rB-3h; Fri, 05 Aug 2022 09:40:23 +0000
Received: by outflank-mailman (input) for mailman id 380943;
 Fri, 05 Aug 2022 09:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJtoc-0007r5-1Y
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 09:40:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f431e94-14a2-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 11:40:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6264.eurprd04.prod.outlook.com (2603:10a6:20b:b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 09:40:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 09:40:19 +0000
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
X-Inumbo-ID: 9f431e94-14a2-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIrMdF494dLDqEnDhO1s28j7kXzmqMP1rOEDYnXgtZgNHpJWS5HW6yo7B9tp/XcFolV7pdRWBCih0MHPU6xNG7yB7yry6Ox09h9cEYzoXH/J9Z456iY6AMGntVGJGjc17WIE2aNPG4uWmkYqTyq/TSTJl9H+E6KcTrNxFdMz7nMCh9VZfzUqueK9rUxrT/QJbTI8DRrBDohBsW4t5GLYwweiiRN7tMb6CVWFPFZUYFX0PdhNJMAhzbVwUirRnuBWpBLPV194CQ6+g0ywm9ETcEN8VV20sps/IGAKHkJSOphjJFbQV7Ru6sbD3KVMTsnuQk9M+//dDkaUKlmmBXeayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQtI/an3OrELNwPmGg3DJboBXFRJixjRkjtOHlz8FZs=;
 b=dwg2+k1kYYcPzHqZMQWakmY6HTVAqlERuk4BCzdyafE+Ol5cisBgY5Dhaiun6VsmYubk640pOiXhsQnQPHJwVOozKO1PQbBxO73A8DNdCG4J+gN4jonVPIJYFdTwAZH4sYFWtmPB6MlwpP9womWFcR2Zl8N6V8/tffp0HJva7gix+EZQP6mqRrJR7Kp0n5TpckivG/apo2tlGjMD8uUcsmqw1+sMFDWqhXRVstXZrjsvnkK2UExXD2xrD+IwJa1+EAy1k1QkW5ohryS7z4xcowPdzN6zWsnL84KZobKX4KGbFRj/KFW+9lOEbrNGJVe4pEpgp2BF0pp14TrT0tPhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQtI/an3OrELNwPmGg3DJboBXFRJixjRkjtOHlz8FZs=;
 b=ndZ3CdY2i2n6VyvfomjzpJwo1Z6OjPBCj5HP1NCdbtRyHut0qQcAUBi1hTArBdxCCWEFFxuTNORH/BrNyU2kj1J6sQa4JhGqWxTB1D7xGIeqBAai3V/qJvkvQNdtI/qmF05iuTKnX3iZJlRLmTDmgnittAfhv6WyLqRV9wqqkVSTYFUB1rJS8fqOL1XQMiXQnPtsEBPYBoVIe4uleN0AKUsGwf+jNP83/MA7nhtReNaezMhkR7QFbJW0RIJBDASjNC29yGiEyxdJ6owZU9v+egV2PaT5rp3kji9gCVoAF4/fQrChGJ3K35aepm66bIHw34ypsGowpEYIJonbIw5NSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a02dce79-5508-542b-903b-1da0b7f63709@suse.com>
Date: Fri, 5 Aug 2022 11:40:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 4/4] x86: Use linkage.h helpers to add tags to symbols
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jane Malalane <Jane.Malalane@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
 <20220804150424.17584-5-jane.malalane@citrix.com>
 <554f0d5b-42a2-2640-32bc-69db1acd759a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <554f0d5b-42a2-2640-32bc-69db1acd759a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56d9e944-5134-45fc-9ee4-08da76c6827b
X-MS-TrafficTypeDiagnostic: AM6PR04MB6264:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tHUBlPn8WruQGF5JogplSsYAgyHQCjZ2RLL1d5JZffJsx//bx9PK9s2ZZ607Dgl6B6jth7IJFM4i9Y+6wkqP72xIJDc2tA36eJw5PgFPeYszPnLAoA0X7OZr/n/1ullzJ6Y6McxdzSMtnRy5Awjn0j5L7BQ1jPobDGm7DJNdut0jSLNQBaewL/hxa0gI6X0xf2YfQtIbMQKLqXZhwQdMVhWxLc8gxSuHeQQ5+amfylHfeay2DA2X7pObH5F/Nu1+rz/oW+dyT/TQjPpNpGFShoDOHeD+tbcEZjM91Tql1AkPuAPe3QxjMdQ/D1635GBawd5dpLz9i3b6TNzSA8Vz1PTjAA0HAcZ+xwHCvRugCMYOHNVkjmfJ2X4QmgSDknS6dNiL0sfH7+j0+FLJ4mf8JO32namgw2yF7x4slbZjEVn9y+KvWNn9XKydJxXP8y3aDlKrmG1sW4E9NSLEI5xfyQEFbP3qwYxGroMDN1F3nYtmaR07eenlDH1R/3bIY5ITnhMcp3BgwNSsVh8iGSmzLUOkD2ZrZHajd/yM2ZMZbfurBGXbcZDV87fketSQQCMOsJEQUvXAYyQlHJ7WeJFuwvIzWkZMKZAvuwXikmmwOLNLRJUldFWLPx2XDVVjmq51CAFAq/pLGyJ8JduJBs2WZt9QzqKh+828yTTQe2PLegp5evD5MfMLCNmUKOKKlBCVXLG21FF+dDZT7SSgWOHRULHqXa9IF9D/m1JMxXNzrZbtx4741Y9fzBR1hAeFQVKYxqpZH8zU4kjKsk5aTwE/EaCxET+p+MJdcwi71DqYaowvotbqYWv8S31M/c3hZ3e0zlc4444F1CF5UlezhZVJog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(346002)(39860400002)(366004)(6506007)(110136005)(66556008)(36756003)(31686004)(66476007)(4326008)(6486002)(54906003)(8936002)(316002)(478600001)(66946007)(5660300002)(8676002)(41300700001)(26005)(6512007)(2906002)(2616005)(186003)(86362001)(53546011)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STEvSDRUVjlkSVZmd0Y4dmpPY2hncExaTXdCaEFXQkhtOWVieTBvSW9ZTll3?=
 =?utf-8?B?K2xzd0kyUVluMjRiQVQ2Q1FrcXNPVXNMakloWFRlSjV4NkFhb2hEVmdHU3ZS?=
 =?utf-8?B?RG5sQXltc0k2YTRMS1dlYUNsR2QwVjNHK2pBYWNyb3JNVEhTS2tPcEFSdDEx?=
 =?utf-8?B?ZDM3ZWU1RkdUcStMcTJrUzlxdDRJNG5wOEVqRnRGY1VSVDQxaWxMKzU0ZnB1?=
 =?utf-8?B?Z2c1ZUVROEcvMkpPLzFkaG1oTzcwMnhxbjVaZllCUmZ5Qk9mVkhvYjN6Vzd0?=
 =?utf-8?B?M3dlMitNLzEvRFN0cnZqVW5BSFBidWl5ak9sd2c2U2R2MldtMG85NGxpWTZG?=
 =?utf-8?B?QmFNVFl0U2FJMjhhTU1DVzNOWTJ0VTIwZkhDODhPTVo3aFBEWUIxQXgzRGlF?=
 =?utf-8?B?ejgwMWRYeWRMS29lMjVvWWV6VWxaT2M5bGUvOWxhZjB0bm1vbGhtb0ZsWEpp?=
 =?utf-8?B?NTBacnJUUUpneU9LSnVycG9HZVdqY3dzNWdSV2Z4VHlrK01TYUVFMHBoZ3Vq?=
 =?utf-8?B?b0lDdDNUeTlDaDhRK2JKVVJLWjJ6OXV5ZEMwZGFUQURiS3h2QzUyT1ZHdmJO?=
 =?utf-8?B?aG5XWkd2S0lJUVhXV3NtZWVUeENjR1cycXBHNWE0WmhYZG9uaWVqWk9pZW13?=
 =?utf-8?B?YkFlMFAxUW9Qb05yZWRMS3l1NmZ4SmlZR000djRiWFlnMmFLekpveTVsbUtn?=
 =?utf-8?B?VGFtZ0Jpb3dEN29lZlZTdHY5d2h5V3FZR0dLK0dWM0pUVkZxQ25GLzhpdGhW?=
 =?utf-8?B?OXBFY0NwckdLSklGdyt0b3FBTnFzWXg5REFuK1lLVC92K2xrNndJRWkyWDgy?=
 =?utf-8?B?cGo5cjMxUEV2WUJ4VkN6YUNXUzlwOHdiMmg1QXFqSjJDbC9Xb3Z6ZFVPYjN0?=
 =?utf-8?B?N2NjNUF1OHJ3ekU5VlFBVXlvdVdOdWx0NDlXSUdmcTZ2Wm1CNzBxcW96MkFu?=
 =?utf-8?B?R1NSVHlUNnlGNVZLMXZjck9UM0VRdmpjUHEzYWNSRXcxNlA2b3FtTmo4d3E1?=
 =?utf-8?B?bWYxeGVZSm5PQnpEcDJXM0s0aGNza3Y3RTlvOGZxZlUwMWp6MU1ERG9RdVp5?=
 =?utf-8?B?SlRiN2RpQktwUWdaSklzZktiVE9sb2Ura3BlMUtwWDArZ2ZGbTJmMG11SGs2?=
 =?utf-8?B?YzhycHBDZ0x4NWNWQ2NqelVCNjZydkRjSFhvb1hEdFdVWDMwQWJOcmxNS2Z5?=
 =?utf-8?B?REROc3dhQ29ZTGlQU2o3RUpRdVhPZDE5OElFNkkwbnZqNEN0THVuSmlRcDVO?=
 =?utf-8?B?dWozY2w5NVo4NkhEenFuMEQzOGhBVDdNbE9zSHFUbm5KTG1iTDdiU0ZIMmRD?=
 =?utf-8?B?Vm96cmMwZ2RiSDM5bEkybER2UkpQQzlZbmZCTEVBVHVuUWgxWXNlc01ZOXVX?=
 =?utf-8?B?aXVFbmNqbTlScEl0aWVzcG54aXV4N2NYNy9YWVl6bVlxMWYrdkZtY1dlY3lQ?=
 =?utf-8?B?WDRNeWhHL2M1VXE3T0xGcUZvaWVuRjZkZHhEL2lqUys2WG1mZmpOeUVrR0FO?=
 =?utf-8?B?MTJZTUMwMGdKRG9CZ1NkSXlPNGxnSlJ1SFlCWm4vMXoveEpVbG9RRG5MOGw0?=
 =?utf-8?B?dXg1RFJLMm1pdlgyQlc0Nld0ZVFhcnR0V2tGdWRWTzkyeE1nUTZQSGYvWkU0?=
 =?utf-8?B?QitUV3MzOEhVQUFsY1FFWlJTNkI2YXlLbGV3czNoM1hYRHZGV3ZFOHNPMllp?=
 =?utf-8?B?QzVaNmNmSGh0MkFIMXdQbE1yUkpQclVBYk12Snp4OGxCTWJDcjl4TmRHb3pF?=
 =?utf-8?B?N3RtYk1OSklybWh4aDQ4ZkRuMGc0NkNReTNzazI1MVhGdTlpRE5pUVZIRXBW?=
 =?utf-8?B?USs4L0hIMVIyVndrdmdNS3h5cUkvYS85M2c2NW5wUHVjT2Jrd1lHWlVhZnha?=
 =?utf-8?B?UW9Sb00yMU9vbmJNQnp1VnYxWk5oWE9TeTdzbnQxdllKbERTSnNYODNtQ2d5?=
 =?utf-8?B?WkJRMFQ5OWkvSklhZUdDVzA3QkdKQk4ydm5ORkJ5a3lHRDhKS0tDTytZbzJX?=
 =?utf-8?B?Rzh5Vzl6OHRhQ2dRMnVod1Q4bk5NbWY5eXFsd1krWDFvb3h0ZXpUY1RNRmdC?=
 =?utf-8?B?eE45WjBtTmh1dmZXeE91ZjVoYTRybHhQSi9yYWpOU3k1SVVCZ2UrTFdDWjhh?=
 =?utf-8?Q?aoJYqFQwarhF+y/L5Lb8xhJZF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d9e944-5134-45fc-9ee4-08da76c6827b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 09:40:19.1869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpI5euIfleC/Qrun8uNQEQiuAAPgBym4OaR1chA5W8F2W1ri2RP2RVubxAFYjk/QOoqcQJeAkk3WECKC602txg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6264

On 04.08.2022 21:46, Andrew Cooper wrote:
> On 04/08/2022 16:04, Jane Malalane wrote:
>> RFC: I'm unsure on where the page_fault symbol should end, i.e. if
>> unlike current code handle_exception_saved should be within page_fault
>> like handle_exception is or not.
> 
> Jan: we've got two examples (page fault, and NMI) which don't form any
> reasonable function layout.  Both of these are fallthrough into
> handle_{ist,}_exception.
> 
> I suggested labelling handle_{ist,}_exception as the main symbol, and
> keeping {page_fault,nmi} as small stubs, because we want backtraces to
> stay the same and not report {page_fault,nmi} for everything.

I.e. the opposite of what the patch currently does. That's fine with me
in principle (sadly there's no STT_THUNK or alike, which might allow
better reflecting the purpose yet still not marking these as STT_FUNC
nor leaving them at STT_NOTYPE), but the small stubs then want an end
annotation, so that their code is covered by some [start,start+size)
pair in the symbol table. IOW I think that as a final result (not
necessarily right after this series) we want all code and data
contributions to be covered by such a range. Which in turn means for
this series that _if_ an area is touched, it should be brought into
that intended shape.

Jan

