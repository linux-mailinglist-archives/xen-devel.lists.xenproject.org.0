Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F426B976B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:12:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509628.785736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5NY-00041I-7D; Tue, 14 Mar 2023 14:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509628.785736; Tue, 14 Mar 2023 14:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5NY-0003yC-3M; Tue, 14 Mar 2023 14:11:52 +0000
Received: by outflank-mailman (input) for mailman id 509628;
 Tue, 14 Mar 2023 14:11:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc5NW-0003y6-VB
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:11:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29863940-c272-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:11:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8430.eurprd04.prod.outlook.com (2603:10a6:10:24f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 14:11:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 14:11:48 +0000
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
X-Inumbo-ID: 29863940-c272-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDchzvj3U4EVq94Od+U/1ijdcI7p6T42lX5Wf0OQeuVkzCp23+Cui/MOjQmLCbsQYN4wjJlGV7rWJl2D+wRtF4la12mxo2hX3tCHgnnvAUcD4zlTVjMN1QHsBlHLY72Rw53Qc43xQlBcAc1/QWcTTwCAiQjE36yYRgfoa9RuhfmVyawDAP8FqPWTxN3DX2YnpzAhV1bSXGTMxfdBUL2xHPMPrIVlnJdmW71SRKFMWst6km5w484BVzsZruksyeGJTghFL+C79NiZ7UGBWaSXckfZ3go5UfNZ0VeNo+o9DWzZymf8FR4dDQ0mytrlum078O8qe+VjpuduAFZ1wIIdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ig+HAkQNJAiSa5J5MIktdbIUQyno3wocwI6dM2xEXs=;
 b=XENrPe48Nsv6Sb5bHT9Uz1ix8MMI3x0igFmurbSGGFNQOuOz4pO1WIVvQTpucA2BMw8kbjqYn5COmDp2K/8AO/q3piNUQU5zG6foAqDKIpQcCdVpXno0qafIyAh3jq7/u8SYLsEiF0xDivrxQCxUzos6XIC232HUg0xXPk2rlcvZYEhJQK2lA0IJoQyBYF2d6erTCWX5Iq7YslJxDTip043RVBt0XCeusVxHTuiwCeHoPcpzhs071UOvElcb5ttkQfbkCBK4xyN2zsZNxLxEwkVpKVO71sSm7V6HfgBEzeHKwb5B4/Zh97v/giZQCMJRW7PmFlFqZ+fn7iMBwvsiCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ig+HAkQNJAiSa5J5MIktdbIUQyno3wocwI6dM2xEXs=;
 b=URNoMnt72oL/kjFqzAyGzdVsheLzUohqFXk3vKf+MdmKIE6MLbUCiaIn2jkzJy8IdmnCsQOyWx/g/8gcF21awuM3DOBeulQGm0+Cs6jQMdAOCOeqzHPEogMnzXXGgXSH+QNZ0UtfDETWtZ4a0mCyE9luKERSEHsEYfOEnAHhlBsoTn0DT5+zb5AJG0nSxDhG9AL1SIDkVaV0wqyyeAN4DmoJN0POvBaO/odq1Z+RP7ro6yvhUlxx61tIGFnu4hryLerxjaWRSiDsojyNBtw6VXtX/4sXN2w++x4mmksDVfSiEn3X+LHA8hb6h94NGWRAy78Pfmv6UNTrtWC+mRErag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ffc64415-8689-a3c5-ab1e-b1a9b3b397cd@suse.com>
Date: Tue, 14 Mar 2023 15:11:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] flask: label-pci: Allow specifying optional irq label
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: "dpsmith.dev" <dpsmith.dev@gmail.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20230313175047.20719-1-jandryuk@gmail.com>
 <a990fe77-6132-c5df-c149-6255fb13d845@apertussolutions.com>
 <CAKf6xpt02aK7SWNb=xB3kKZB3Dt9UC8mMKMVz5kq96uNJvdzbQ@mail.gmail.com>
 <d17d7b39-28ce-55a6-8d2b-fe2dfd10c38d@gmail.com>
 <52c04d0b-2b30-ffc5-fe5f-72a182abfee7@suse.com>
 <CAKf6xpv7AGqWOcv2hFYzcJLq0c3EyhUiBxvmHeSui661M6HFcQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpv7AGqWOcv2hFYzcJLq0c3EyhUiBxvmHeSui661M6HFcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6f13c0-afdf-4547-82f6-08db24960cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6gxHgpMwhAijYlQuK4+mEUlTqUF8g+LEktJQbuWhyM2XUN4QUnqlBXcWDjRFNnmPkZNrf5mZ/jwd9CYKuAftf2FQdYGge9P6yRtmhp2xv5HabSr5gpJkk6IeyQOfkgvFs2txWLXL3IxWRFS8UXyzdPY7I7pZxXHXskeHeTDmR8gQEwwGUgJcQ6870og5nNgasszxu9oMQoKnG739BDU0yy9Zb7WOQAKmNnaaR01jEJKsFKjYILi90hpWsmjYtNKGCcaOmvfoBTUFkRQRrZmYWBoI/LleeB1n/qweGB0rlrq6itZm/PqrCXDTkPMS6I6AmZ4aPYrd/7lOwZt7qAirf90Sws0rHKstcvzlJsFIoIu6+wp5ABPNet8x/X1TZ9h9mLcyQbWkLk+PhNLoWFmCMb5ykgxQasi/6QSO0uwYPEnj08ni2jQO6ToEC+8a3m4Xo8t9bC2ov7Ifp5cRaplsu0y3KlXdTjIfDrpz2Ya7mVJRQzsir+RUIJDqAfDK01r4nL/EusnbddzXVc3lJ8j1eukE2qoHbOUE8hXlXEsErtiS7hac8pPg3UW0MfjKsoqtz+pejDkEKEcUgxQRbfPGO8TCnCWjfHht7jsFEXToSEVffAzQcYkcWFONnEDCwP+BK8Fj79eh52wVPQ+bDTNkxKfWv9jCTFvHSXVm6mtjfBqd7qGQjoZIfHstd6X6aWa6JPP6lv9Pl3nIBQOu0mFzpOkW2tYOR6dttOmcP0jm+/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199018)(38100700002)(2906002)(31686004)(478600001)(316002)(6512007)(6506007)(2616005)(54906003)(86362001)(31696002)(36756003)(41300700001)(66946007)(6916009)(66556008)(8676002)(186003)(53546011)(4326008)(66476007)(6486002)(8936002)(26005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVRkQSswS2JjWUk3YzZ0MGVNUnZBRURlRzBncUk1UmhJNmh4YXhrTmdtaXBY?=
 =?utf-8?B?L1dyWjdMYnliSmIyM2NXSVJQMEVLZWVXUDJzbE5sZm51QUpUbGZpTzVYTlFj?=
 =?utf-8?B?S0xWZ1FNeEU4VFNQZmplaGRFOEVoUmdYTTkwb1hoT3hIRDNoKzFRUXBFcUE3?=
 =?utf-8?B?SUVTNXRVNUhva0lXMjM2NzJ0SFJuZm5xRU52V1hWUHN2WkRwTEkzVG91SSti?=
 =?utf-8?B?UG1TZjRPK1daZ0FhZEcvWmNtQjFFZU5XUTh3SVp6bmRXSzRhTHNJbkRoUGRR?=
 =?utf-8?B?SlJRZFZuVEhCbTU2WmdDSzFOSU9qbUhNd1pBL1c1eEVKUGNzK3duY0twM3Fv?=
 =?utf-8?B?WjltdThweUVBcFB3d2ZLR1BjMnJiTkNPT3kraW1KaEtmdGZIYlkwRitNeEJE?=
 =?utf-8?B?MTFiQVU1dlJ5d2tVMmVUSVZ5TEpDT3FDQ0gwTlJVcUZXMEZjYWxwVi81RXdL?=
 =?utf-8?B?cCtzMHE1N1h4UG9ld0hhTTM2M2FnbXVRTnA2eTliK2xiY2FScWdVcFdyZUdN?=
 =?utf-8?B?Q2p0WlBqRHA1M2FuSTB1di9QejlNdGZFMDNOY0RHdEJHV015LzJpK3EvMUph?=
 =?utf-8?B?akpqRVp1Y05LTHM0TEFKSjhuWUFZL1kyVW5YSWJyaXlFbXdjSC9GNE1zZFhY?=
 =?utf-8?B?MG8yUW1PblExY2F6ZEJqRlFlUnpzanE2S1FhZjJVTHlwMHBaNlNmbTZ2SGhP?=
 =?utf-8?B?T3ZvVHNLVHJ2bmUxQ1lYS09Lbm94YkRGeHNMazY1UE1GM1hMTFZBUkxadkJx?=
 =?utf-8?B?TlNvMnVYdEozc3hUVExHZTdKdU5tUFFCVGcwcDRMU3pseVJadDFwWmZmRHZy?=
 =?utf-8?B?cURsQWovbU8wd01hV3VHejBpeXpvK2NoV2cxQ0ZwYWhPMjBSTVBTS05Pc0xr?=
 =?utf-8?B?alZBZk9xRHBCWklpdDNqeWw0ZVhpQk5MRXQzbFBhYlhDRnU0Q3NZUUFHNXQz?=
 =?utf-8?B?eEFGV1dRY3MzUW9Qd2JGVW9IRW4vSUlsZmhTQmd3R1FRbkdoTmZ2dGtIQ2dT?=
 =?utf-8?B?YTBLd1ZwaFdTaXErRUlGbHFRNk1KTkt2UnFCdVFOUmVzYmE0UStPb0dmeTF0?=
 =?utf-8?B?MnlBbU5VVEFIcVdIdVR4Z1BNRDdITFhhY0pYaWxzS05JQkU0WnQzemlqTjlW?=
 =?utf-8?B?STczTG9aL3hva0F0dU9XVk0zWFNlRXVoY0VzS0hHc0ErT2JsR2dBeHJKK2F2?=
 =?utf-8?B?Z3BReVNxY0RONjU4VWRvb2syU2tMSXdrTVZzQno2cjMvVzZNMHlIUW9VOXBl?=
 =?utf-8?B?QXdRbVl0WTVQaGtVMWJSV2xWRkg5TUdEaDV6d29PaFJ3eFZYaXM3WXdUQ3NN?=
 =?utf-8?B?M3l5a0g0YlJZSWxGNVJkMVBiMDAzVFBoRWRCdElTRE01UkVHNDU4K2dXNk1X?=
 =?utf-8?B?VWU1cHJ2bWNQVm43bEJGc3pTNnNiayt5b01aOVRMcW9sTmZWYmdnKzdqRW03?=
 =?utf-8?B?REhLRFQwT043OFJiQVluTUhrVk50ZXd4ZGZXUUQzdXF4UXcyWlBLTGVQb3dB?=
 =?utf-8?B?b29nN2JERzNSbk8waWlzVStMaG9ZSVVnWEkvL2gwYVU1MStBdTYxS0FGV0tJ?=
 =?utf-8?B?bEZZaXlMVEw5cm5PeWVHWWFKYjBiMmEzNmtwWnZrZ1hrNmZESDQ5YWYxU2Jw?=
 =?utf-8?B?VDFwcVB2LzUyRlh5VFVZNFFOeFdXVGtIM3dPSWhscytMRWdyMFNzSTUxVlNq?=
 =?utf-8?B?K2RBV1FSa3FzNC9IVU81a28rK29VbE1CUHh3RXB1MnV6d1l6UERGdUJNSW1F?=
 =?utf-8?B?Q1IyTmd0NGhvNDlHZWdyaWFGa0RnT1JSeFFNc1RIY1BJYkRPT2FSTEFpNlIx?=
 =?utf-8?B?ZnhHcHFtZjRmWjUwTit5eExjWmx6SjBNM082Z2dUTXNEZ1YrZHA4RHVncWR4?=
 =?utf-8?B?MXB2MWhEb2ttREFVZUhSTHhnM2hZRDlyNzNnTDhmeVQwQkpLMWRlMFR6TFBP?=
 =?utf-8?B?NUQvaU9YelZoM2twUnV4ei80U09BT04yUVZhMCsrbkVheURaSHpIdzRmd1Ex?=
 =?utf-8?B?amxYckRUelZDcWRtaVFtaU9SRTdYOGhFTCtKbVFwTENJQ29STTRnSVQrR3ZZ?=
 =?utf-8?B?bzBrSEFCWE5KNmdXaU83ZVN2TXE5VEpUNXNTU0tLVXJyZktJVXV2SkUxUWFL?=
 =?utf-8?Q?klVIke/Zgqp9vipAIkh+TuMK0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6f13c0-afdf-4547-82f6-08db24960cf6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 14:11:48.5639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pN3G53NZ8Xs135HXbZoLiWmmtQpBU2TxbWtUAfd7NDA5yYzbMmEpfzj7FPb+L2gmp/+g4bVvJ4BJmuVsz2mKEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8430

On 14.03.2023 14:20, Jason Andryuk wrote:
> On Tue, Mar 14, 2023 at 2:42 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 13.03.2023 22:11, dpsmith.dev wrote:
>>> On 3/13/23 15:14, Jason Andryuk wrote:
>>>> On Mon, Mar 13, 2023 at 2:49 PM Daniel P. Smith
>>>> <dpsmith@apertussolutions.com> wrote:
>>>>> On 3/13/23 13:50, Jason Andryuk wrote:
>>>>>>                usage(argCnt, argv);
>>>>>>
>>>>>> +     if (argCnt == 4) {
>>>>>> +         pirq_label = argv[3];
>>>>>> +     } else {
>>>>>> +         pirq_label = argv[2];
>>>>>> +     }
>>>>>> +
>>>>>
>>>>> style nit: space inside parens and curly brackets could be dropped or
>>>>> should be moved to their own lines.
>>>>
>>>> This file doesn't follow Xen style.  I think dropping the curly braces
>>>> is fine, but the lack of spaces 'if (argCnt == 4)' should stay for
>>>> consistency.  Does that sound okay?
>>>>
>>>
>>> Hmm, I thought there was interest in getting everything in tree consistent, maybe I am mistaken. I am not hard pressed to enforce the style. Unless someone else objects, I am good with your proposal.
>>
>> The rule of thumb is that if a file is (largely) consistent in itself,
>> then that style is preferred over introducing a mix. (I haven't checked
>> this specific file, though.) The same may or may not apply to individual
>> functions within a file; there it's more likely to be considered one way
>> or the other on a case by case basis.
> 
> Thanks, Jan.  The file has 2 functions.  There are two instances of
> spaces within parens, and all the other cases, the majority, omit
> spaces.  The next version will drop curly braces and continue omitting
> spaces.
> 
> This patch should have had v2 in the subject (it has a v2 change log).
> The next one will have v3.

Will it? I've committed it earlier today ...

Jan

