Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B526A1B47
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:18:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500904.772451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVW5W-0000t9-AY; Fri, 24 Feb 2023 11:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500904.772451; Fri, 24 Feb 2023 11:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVW5W-0000rI-7G; Fri, 24 Feb 2023 11:18:06 +0000
Received: by outflank-mailman (input) for mailman id 500904;
 Fri, 24 Feb 2023 11:18:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cKFb=6U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVW5V-0000rC-D5
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:18:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e747b34f-b434-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 12:18:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9208.eurprd04.prod.outlook.com (2603:10a6:20b:44f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 11:18:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 11:18:00 +0000
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
X-Inumbo-ID: e747b34f-b434-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVopxcYGVyWDyOzRKR6+fCRnqTUv7WabRF8JeyjyqUu20pkjAKjkl/+x6W7QM4lJQwCVZ/Sv5JKuPg2XoVw1vx3tykMVtKHk4zAPyENEq0SmQy0E42zRuiaacypEGdqAr6WhlVjPKSDo8FHiYiOqDyPfnTMP1HAO9zmGt5DrsGnM/CZ7+adABCnRhuazMqs+UWDC9HJ+pEpqNJ+giO4CHWxVSwQH0pt3WMAdiypOg1mwKLYFj43Fet/oXlolre1ncigE8HWNe9Zvl6VeB4nLJc1a6k4CedGCid6r6gWIMImyFYVb4i4kihutZNV8IYnKycwqFm/3nXB7sv2Ykmdh7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQe7NUCwpXPD6Tur/KcP0YWIbGixxBBFMoamjTuI6a4=;
 b=RMmDiAHq8Zk13HqQZ1Q2HJe6cZwfjgnvLlQKJUeoWgTOKUfos8eAnpiV7apm05vLHYIhP76L/zzC26yhUGyrF8ffzY0bTaFAF/Bt2BCCYx8O0KpsxfUDeJXtlsobsuaKljznqgsMAwB9cUeN90Wjbz+iPITtjn0cOP/VS12AopVBOc+TICYC4mT+fYhOUwd+QDtiV67doVxQ1gDaMpYL950v74RsLbl3ELLGmrn0Osg66s7UB0BjsJ+nBpSOKihifpIEp9jx/Vn9uAbUEcAQ02CzSNqqBaRotB3qPUaQukqvDzTd7kmLaIu7DlncCAonW4wS2QhtbKhK+bPAX908SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQe7NUCwpXPD6Tur/KcP0YWIbGixxBBFMoamjTuI6a4=;
 b=XfZAgtA9MigkMHiNfeT5jRHmi5ieeZifF7SXxpXl2EjIZ4V9E+v1ZD/+GdYG7FCAj4SgebxB8BMErSvfFw01SLqxt32pHCG7tlmjWPLVLxRnB8r2PnWa4N0mIazQ2l1u+eaePXtigFG21IVaheH2oPhQlWOQi9iIJXZvbqTJO419cKO/xYQMrT8BU6vMU1kVTEN1RKu4EUc9SSNSnJb3GbpcHwVVy1lktHnhkuQ0CiCNsHBXgMoIO6n9QQ1XgzHvJ35PyD1Z5Vr/AQ3H7Tf+OqXxShOI/JNCJjpcYcWuJ1e+61C2eBg8tLrCCb4hyGMYINeKWL43mNYy8Ca3mbo7PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <372e227d-a18b-fa76-d62a-4321493d8a24@suse.com>
Date: Fri, 24 Feb 2023 12:17:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen: Work around Clang -E vs -Wunicode bug
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230223220358.2611252-1-andrew.cooper3@citrix.com>
 <f35274a1-1669-345c-2436-0eddcba558af@suse.com>
 <de4b7eab-7ae1-d444-6cfa-dc782277e355@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <de4b7eab-7ae1-d444-6cfa-dc782277e355@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f36b24-7051-4bb2-3f24-08db1658c99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yCN4hVlJRlS0STAcFFJzf4O49sA8Saie8loF501t95e0GwbToTeo1j2EZeTzcxC+pigCkFndcmPwE/Yk5XvZunChuK52bO2GaA5wB8RWE4Ictp7yP+YU8czGJHNMc5Vj2MELOpCF81lNr2QWTqPxS8K21rmYjkk1BKDqL2SFCrFPKqtEnpCfpoOa4rfYQAptFvDKSa/NTQhnqMhn8XAjxxzDulNgrt08iyG/9rHhYqIu6MdHjjv3Z8E3wBkvkdnhKI3AHaVegqONgwF2btwmi2KOlziv0p37jau0PQyZrwLwg9Q8+C1Df0aMN+ZudNJ0AxSNb+eYNPZE7O7GWOicN+igzCIRY2sK2yNX+psFxdYgS6iAfXP7M+VWaBxzQnKMAaKOsXlP/B6AQCwt7vqCnBLIxgW3ywOxCi4FguQERKQrvJ8Z0e2iaUbhOBFSV/26HHTfv5K1qb881+g8+Ru2CH+SFLRg4n9qsNny+/mYTYm58NR8/bD/MymAzLxF15vDZxDkWYC8jPZuDGsf5b/l9Ah8Xi/xaBXLSLFvltPQoPi9mGGnSEWF/Hf0HXQ5Tt9eHQke2bngjcfW3mxyubF0aeQGmna7DWq/nvgMXspQ1AwunGdeKmRQ+uvwneGkHO0RhKjFFYoprcJQW29jfrCiF7kyVCuK8jYTiR5vBoL117187gNB2qiXV7E/QNjTVW5RL6eo/XjReZNwnnui/BS7ElFKLVP13Jj9Ne1h20sUZzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199018)(26005)(54906003)(316002)(36756003)(6486002)(966005)(6512007)(6666004)(6506007)(53546011)(2616005)(186003)(478600001)(8936002)(38100700002)(86362001)(5660300002)(2906002)(31696002)(31686004)(66556008)(41300700001)(4326008)(8676002)(6916009)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0laQ3FxclpQdE1Idk1zQXRuSHFGcmtiSjZIdlppTFREWXU2RG4wZmJGbnc5?=
 =?utf-8?B?YjFyYm9lNUptR0cwaU9RZmI2VFQ5cmFSbmR6SktUVHc5Qkw5eVlCanBhdkd1?=
 =?utf-8?B?dGdoc2tnSXhiRGVpL2loY0tWcmlEQXpjTXNoK2pBMmxXL0xaNzRPdXJIOEpJ?=
 =?utf-8?B?YzFtTE9rUTJ6K1FoMk1zeHJ6ODFHYytBOTRVMHl0ZXJqbzVOUDJSL0tNWDli?=
 =?utf-8?B?L3hJUlc4c2w0YWZLMlVFaGhYV00zdXc1VTdvMXVXN3UzMys4OUd6TFZKUEFG?=
 =?utf-8?B?ZkV1d3VDNmV2Z2pWOEdPb2crcjZlSjdOYk1JTkV1cWU5OVVPYTNsTTJKbjBM?=
 =?utf-8?B?NjE5SVB5ei96MURUblhWK3FvNlBFWUtqL0ZFNWVwTzcxY0t5Qk5VdmdaN3BY?=
 =?utf-8?B?cHVNZWluWXNsOEZoNXkwSXg4UjE3N0Z0WFFjRGFKbUhadUNTT0RlTzQrMHND?=
 =?utf-8?B?YzROQi9vZlMva2VicXM4QSs1cGhIMlkyMG5VQ0tvN1R1bFdScEUvMmpNNFZV?=
 =?utf-8?B?Mk5DV0xqNnAvdjM4b3FiTmRSSUZzN3NZK25sVHRubXQwWnJhbUdJNHp5MjJj?=
 =?utf-8?B?TjdWZmV6OWpjdXJQR0JuZys1Vi9OYlpGaDlyQ2Z6WkozSStVeHRVeDBUZmEz?=
 =?utf-8?B?MlpGQlVPVG5WVWs5elVadVdzazA5SU9pRzdjWVlGSzlXTmhnN1lPb3ZRS2hP?=
 =?utf-8?B?eFNtekt2ODJBSzBqZGx5MFl6emlpSXBNb0ZqQlZBTjdjeFRjL1hLUVdhK1J4?=
 =?utf-8?B?V2dtSHZOQzV0K2gxV2JoVFFjUWN3ZUFOTkNlN0w5dnRPUDVsVEs0aVg5NEdi?=
 =?utf-8?B?cXFTa0RvYVliTnF2aXh4ZkpoK2JmaTNpRlFUUDVyTk5aU21xVGZzU2hSRWN0?=
 =?utf-8?B?Y0U3YlNteDdvaEhYa0w3U3ZYUmV6VElkTitOcE9XazlSODNvYUFIK3Era2hI?=
 =?utf-8?B?cHN0VXMyZW12RE1Jb0ppTVQvekE1c0RWR3duVERTbXhJdlphdHJ0R2ljVUgv?=
 =?utf-8?B?RnFjeEF0WWRpQjJBNllEU0pTcTRKck9jVTVQMitmMGovTGpyVE03bndvK1Zm?=
 =?utf-8?B?TXNlRXFwaWZ6SHR1RUZQSFRreDR1LzRrU2VIUlNTR1pza3YyaEJwVGdJbmZC?=
 =?utf-8?B?NnRvcURsS3RwSllmdGNFTHp4V2tMZS9qQ0MvSXc3M05GT1pETGZWbVZ1R0cw?=
 =?utf-8?B?eGFiZ2J1bnl3UklRSVRhNllmK0dmcWV2Y2RMczIybmUwTlo4bjFDUk42alJD?=
 =?utf-8?B?QXRhWG5jMlBnNWNTS0ZYcXp6MFdaMkI4Q0xrLzBCbFI1ZVNIdlBCazViMEVZ?=
 =?utf-8?B?N3FJMi9iemNZSDM3MEpORlIwRTkrc0Z6eCsyaS9ROXlVTXljbEovaW1ORGov?=
 =?utf-8?B?TExYaTNwNThVS0pxTEVnTzFjd0YzWTNoV3VBc1JYMVlEUFdHU0oxVmVxQjNR?=
 =?utf-8?B?OEh3Y2YrYVQzR2JnbVZMUlo2N1AxMkVUbGFEaDJKSDhPU3JlbkpRZ2ZLcUpy?=
 =?utf-8?B?RXRkZGhjdDdlbFMzcEh2ZEhsQTM2NWhRS3dYcWNCU3dwRitabWs0SnZIQUQ0?=
 =?utf-8?B?YTZDUWdqVDdWTEkvdjRQWWp1ck1QcEoyU2ZORWhvaWRjcFNJbmdieUtHQWtU?=
 =?utf-8?B?WVJERlN4elhXYlBDUUFQNVRsR1dxaXhReHhxQ3phdUV3bmIwZWhMYzc2bW1Z?=
 =?utf-8?B?OUJSV1RtbzF4S1UwczJNZERGdXV0cEdlYW95S2h2ZmVLQ1JiOFVGOEZ3TEtC?=
 =?utf-8?B?bnV3VHJZWUpqT3J0T1NzUklLTzByY2oramIxZHg0WWZ3NDV1WXY2Nkl4WEhh?=
 =?utf-8?B?RUZla2RUVEV6L001K0p1OW5ibGRWbVZSc0YrbXdLemhWMTBjdWliTlFsVDZG?=
 =?utf-8?B?NEhkQlJVUjByQ2tEcENqaTgxYzFXZWpZQXU4Z3cwQWxaR21LMXJuOVNLQlF5?=
 =?utf-8?B?RnFlVDNoOVhvVFg1L3lVanl4QXFSaUpBUWtxZHcvZjNZa0ptTU5IWHlkUWdi?=
 =?utf-8?B?S3JrUGpmY00xQ2lkamthdXBDSVc1aUFObVM2QXorSmtOa2dwL3hIVXFKd3FY?=
 =?utf-8?B?Z1NwK2NHaFRoWkFTTlRCWkJXeUdSeVQxRjN6SXZnMFkzQUhMWXBGR3RUeUpV?=
 =?utf-8?Q?y5uM0kDDWKor3Kw+7Qre/LOQR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f36b24-7051-4bb2-3f24-08db1658c99d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 11:18:00.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQWW+m18KP2TEe2RhQ54Zxdug7MJcODIKiZwyJwEarchGBmeg+u6dcFNWwsHZQitH9hxvPW/GoNpAr9ekZtdow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208

On 24.02.2023 11:50, Andrew Cooper wrote:
> On 24/02/2023 7:27 am, Jan Beulich wrote:
>> On 23.02.2023 23:03, Andrew Cooper wrote:
>>> https://github.com/llvm/llvm-project/issues/60958
>>>
>>> While trying to work around a different Clang-IAS bug, I stubled onto
>>>
>>>   In file included from arch/x86/asm-macros.c:3:
>>>   ./arch/x86/include/asm/spec_ctrl_asm.h:144:19: error: \u used with
>>>   no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
>>>   .L\@_fill_rsb_loop\uniq:
>>>                     ^
>>>
>>> It turns out that Clang -E is sensitive to the file extension of the source
>>> file it is processing.
>> I'm inclined to say there's no bug there in Clang. Gcc, while not affected
>> in this specific regard, also treats .c and .S differently in some perhaps
>> subtle ways.
> 
> This part was just an observation.
> 
> Whether .c and .S should be treated the same or not, this -Wunicode
> diagnostic is given against something which isn't in a char/string
> literal, and that is a bug.

Why are you thinking of only string literals? Gcc is quite okay with

void test\u0024ä\u00F6ü(void) {}

yielding "test$äöü" in the object file (I haven't understood yet why it
dislikes \u0040, i.e. @.)

Jan

