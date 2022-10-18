Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC174602FBE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 17:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425281.673003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okoXR-0007LS-Ut; Tue, 18 Oct 2022 15:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425281.673003; Tue, 18 Oct 2022 15:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okoXR-0007Iw-RX; Tue, 18 Oct 2022 15:29:53 +0000
Received: by outflank-mailman (input) for mailman id 425281;
 Tue, 18 Oct 2022 15:29:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okoXQ-0007Iq-3R
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 15:29:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4b9b0ad-4ef9-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 17:29:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9632.eurprd04.prod.outlook.com (2603:10a6:20b:477::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 15:29:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 15:29:49 +0000
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
X-Inumbo-ID: b4b9b0ad-4ef9-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9qQkJe2UIwQ/KegLOe2+GahhLNfvqrLNboAieSRjdtsAMjZJRPg+jwvJndpkP+zJ97QSfniriCs/FcqkGc8qgqEb6uI4aXDV1dFVuJo+OQlzU5/GABWlTkSTsl+Gk6AL5rsTAf/gAC+aGx8UTFfGnleJh6c3KxXFaUkM+3Y1n3PQ8zqNwWYwl03HawglxDHtqJ6MtGKPhGl0C1/5+JK5XobyOZgNpbW/+RkYy7bbmoY82I74gi2MHuXzZpuYtZzpUbXxQg25hMyk7c47DTfRYbuQ6ItqKxs5W4eJOGZxFyM9FAlSydDRIvGlCfgsvLPryGA5G5bUU746MROgTHplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fE68tToyp7Mszp30JJOgnvGyztmkwmTz2hlbTeYo8iY=;
 b=LZQ2YmPnNsXFo0qi4yKNcXjencw2al1miJ8XU6wewrIwZv3PFpvbv8mvcOc8GHqQAcewHNHCOiX7ngTMkCVlGCM6RvQXtoGTKKAZ0Rcl0sJ3XLDwJ5W05ADdzEy9jVTTCA85KEv8Nl4guLEUpFXqT1H9jLSYJTRB6AxcApo1HWSSAcZAfPgLzXx0Ggzxq4W5lIRUEIXW5U0OHE/2whSJu2rfO6PvQDeubulgtqRaieEAwwruKYNOSv7zqckEVlz5/9ZFi4ldr13nMwNkRgRkOJ7s81yPdQEtKynHkrlVw7YUn25gCpc7jhANJQucNA4BGbyYZqY53zszC1aJVuQ48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE68tToyp7Mszp30JJOgnvGyztmkwmTz2hlbTeYo8iY=;
 b=XT7W0PNyBt5g2RwwNsgL7COoI5FjBr7Hx72TcKeI0VlzK680n/DUkhGLF12QVL+kRC8GbAq2Y6P0VVbvtRES1oe7OAOkz1VVY9VdzE+HLYVlmewyiXTx3tOIwrAT2XXEQkB52UE5zqORrHKnTVPRE693AVSZOx2nzf8u0ukh5QSyI0qNjpq/CQ5WExCnLQJalTEdJS9GH7RGCUGO40A7PSfGJe3y6iowqU+OYJuUdQm/81UH/uVrbiaw/bq9V7jtBZDLz8MjiSTl3IUY33K1SK0aVMyX+gKn7TRFOaAs8/F/ZU03QomEJNHhf9zEMQZzvS10f0FNQdEkOmrL1TgJBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <233a9356-b64f-37f7-d7ee-3d6223224497@suse.com>
Date: Tue, 18 Oct 2022 17:29:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Proposal for deviations in static analyser findings
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
 <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
 <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
 <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
 <E00E3AE4-7863-4231-9DB7-A7B66C8F6791@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <E00E3AE4-7863-4231-9DB7-A7B66C8F6791@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: c194b288-857f-4191-2cee-08dab11d97f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6dauYnTJiTyQyaispNQZkN+ukdpis94yhieAsRFl1bXGhK94LJ238OqspYcBeg6a5VHjs2vXOSPdw3mA373BBhzk0g6QzXgNwlLqscZHEIM7ZrRUz1qtOL07DlK+PaaDbBA3aouShULMKHsmBy5e0GWOqul/Wa7kO0pm0cb/UHDQvOwQSzDR19yw2porrrZuC8uWhGWqq16suq6sGbe8Qf7HVuXMxFshHaPu0nqRit8yK0X4rIITaAhz5qXNudq4F1aX7DnXKHEAcc8dy07s5TpAecGPnvt1FSAj60f7EmOpInwWD8PlRHq8Q5w2kTYJMjNlO6eo0dhsAriJ+RDYULjWLAijwRSPVU1cMe6io6RctaBGJgMD2uAtUM1dP/daosD8L71r7p0RWy3zcZwc7wBTcFJ8PO85ePdGcaf97uyrmo90x0AbxkgtR/RgYxf3YqEq/3NeT9iiyNWNolTR+Mc/Qgf7jiEF3VeJ/QlYVNkHiRWRDNuadD3msYliJy5L2dqW/JLaCoejDYu0CpjNNtacQbfTzAQi2b/m1O4GFe7dkgzMSh3t9gok/qO029/2sjfQuKL6DFH48TQt94Ok3YtcuEHXHqaLD3r/KE67lv3SHiruWYtNNMxBbrO3ehL+cCK0PlUeNB4VV9pqWXumCeJlr511qfiu+f43tY2yDVATBohGnzSxJXIZcDyNF3NzT/nhVobhwm3CH+W9Zq64rAArG3DRMjTSGK1QU3ELxFxxYZgbJFoKvi2nRpKYlUz1swsjrD/ALkRDe8kLjDACwiK5QtDrsGi3qcnSWz1p11A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199015)(5660300002)(8936002)(2906002)(66476007)(8676002)(4326008)(38100700002)(66556008)(41300700001)(36756003)(31696002)(86362001)(6512007)(26005)(6506007)(53546011)(2616005)(6916009)(186003)(54906003)(6486002)(478600001)(66946007)(316002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3BOUGxyMmx4WGJzb1pWUE12T1RpNHNRbk5XQVcyaERvelVJV21INTBGSGVq?=
 =?utf-8?B?MDNDSnR1UGozclZBRGMrNlJHUlJVY0grQVdiZitOVGsvTFNmOFB3V0dGa0dm?=
 =?utf-8?B?REpsU2ExSmxMdmEwZE56c2tyY09sRmJCbUQ3L2xGT1pWQUdKc01sZTBCcFpm?=
 =?utf-8?B?a1BvZDZBNzQvRDNOc1Vpc0lkUHU0Ky90WHBiOE9NNyttWjRjeWhxeFppNWR0?=
 =?utf-8?B?czNTMHFWSjc3WHYzd09SRkljOTY4aU9NMVplcmcwTnNPUTlibkZKNzFHVWdI?=
 =?utf-8?B?bFlVT1F1Nng4TnFGZTdPMWIwV1BWbkd4dzJqS3p1MUtxbGJaSkUyRVU0U09E?=
 =?utf-8?B?bklGV2NQMjRzbXB3aGcrZWZDMStUazZpT3hNeCtIUUttR1I4RnRTYlA3SGFT?=
 =?utf-8?B?Mzczb251US9nNDdSUG5MaHY4OXlPQXpHQmVTQlhJOVdyR0c3UHp0cGpQNHJo?=
 =?utf-8?B?a1pwL3RWbnBoL2ZHNWhYY3B3eUMvOHBSK2NkZGE3TDBMOC8vN2xWZlRtU0lp?=
 =?utf-8?B?QkNMcGkrSmphYXdTS3lUdjFydXZTTEk1c2Q1ZnVSdlY2NW4ya2wwaXl6Wmtu?=
 =?utf-8?B?V1VZQzk3RGx1cWFKSnFIL1MxZ3VpRWJMM2lxdnZnMUQzdHIxZEVWdnc2RWJz?=
 =?utf-8?B?SU1GeTk0eW1vaWFaZUVSL1Zmai96NVZiNEpWTUhKbjhjcmJCb2t3Q0RnZUd2?=
 =?utf-8?B?UlFId0JzMGZ5elVCWDRZRURVZzluQ2M3R1BaZWtQc2MwQ1N3cTBUUTRVNEZn?=
 =?utf-8?B?RGhFNWFWN3hqa0NEbDEyNnI5eTczbGY1UmFCQWdsc1luVURyOVdFMUFlRnIz?=
 =?utf-8?B?TGViRlhmOGZqL0E5OEVLY2YrTitQcHBOZDEzdGhtd1BpRzZUSWUxajZVNEJ2?=
 =?utf-8?B?SGVqcEE3NUxRZkhKQUM5eTZGVXJGc3ZBSVhMeVZiUWZvQ1hqd3dicDVKcjk3?=
 =?utf-8?B?NjRrRzBuS2hSbm53MUJCRnhIL0k2MGNKdU1hNi9odmkvT01ueGdFWGQ3ZHVp?=
 =?utf-8?B?Slk3SVoxYVRXRWNjb0FpWERJbFZNVkVVaUlWaDdCdWI0NzVHczBWcXlSdmVB?=
 =?utf-8?B?N0YyUmNxOGRxZ0hkWVVVSXF0dWtDYmsrM2lkZTBlYW9OQzdqUUphc3RuRkVJ?=
 =?utf-8?B?YjVhTm16YUllRi81T0xhWGxBeWZWZG9vcjhKMFljaFBYeXdhSlZhS202YWZx?=
 =?utf-8?B?SlV6dXl2R0s3bU15WlBEQ3d2bHQ0TG9sOEdGc213Mm9PVHBwMXovYXFKODNU?=
 =?utf-8?B?Y1orUWZkT1BqYmdaakFjbU56TnNmbjJxT3JSeFUxK3hNZXFTT29GcnZNMXBD?=
 =?utf-8?B?azlRTjRZNEdwUEhyTDR5aFJ6R09ub1ZNQURxZEdESHRCTnNSNzV6T1YydGdw?=
 =?utf-8?B?VnNLUWVQbkswRmVnbXpTMXJvRDBSUGV6R21WY2NGS0U5SzF5Y3ZDQTFmM3do?=
 =?utf-8?B?cFpaWVFZQzB6dXFFTERkaVVjbmhhSXlGMjg5ekRqK0ZEOXZYVEg1R20wVmhY?=
 =?utf-8?B?WGZsbmN2UURrVncxRFZTWkRCQUphN2RXdGcwa1Bnak1HTG9EdmZndDRaQTZi?=
 =?utf-8?B?OTVuajB4UkJUdDcwOVhRR0ZzKzVMVWpmSkpqakFpSHJhdzhLTmwxTDNSTHpX?=
 =?utf-8?B?RXJ1LzBpcGU3ek1kMmhEU0QvM09rVHVpWEx0RWN3eVFaN2oyaGZXQWN6dGlF?=
 =?utf-8?B?bC9MdU1BRU9CbWl0Qk4xa0xyZ2tRc01QMDNkUXk1WFYvRm8zWDRYaHpmdU5r?=
 =?utf-8?B?dDVkQUhZUU10akh4L2FtUHRrcEJOTmFEaVZRVktaaGt4czkxUVBaeDFOVHRK?=
 =?utf-8?B?eVdOTGlnM1VOWHhCRktmUUdGSFcybnVxTFNaSmh0d0pUTUFEdDB3Z3ZEdWU1?=
 =?utf-8?B?MlREdTF3ZmlKRm54TzVZRnc2RElDVTFJaDgyL3VFa3ZTS2RYRHhQRXdVR3Jk?=
 =?utf-8?B?Q3dtWmU0QmJ2Zmp5SktIdy9VN2hKWFBFUEVENmpnVnFvTFgxQzMySVFKeng2?=
 =?utf-8?B?WlZvK0F0NDB0a3dmbzI4RS9ZL3VRTm1nZWFWNXRjaWZ0T3pvbTJ0ZUxRZkZ0?=
 =?utf-8?B?Y0duWEpuNzYxUjRxV2h0Q3VpbDFKdlV0R29reEh1RXNUdzFralJId0dLQU50?=
 =?utf-8?Q?04Zb6riDix4xLLr7O4dDkkYlk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c194b288-857f-4191-2cee-08dab11d97f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 15:29:48.9085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gExaNIzYQdZ4FF643mMfIjEvLKuslRbmne60VF9+Bt0F59yBgqFR9zYoCYxuszaH96eeSHJ00cioNrFY6OvPNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9632

On 18.10.2022 17:17, Luca Fancellu wrote:
>> On 13 Oct 2022, at 12:34, Jan Beulich <jbeulich@suse.com> wrote:
>> On 13.10.2022 12:11, Luca Fancellu wrote:
>>>> On 13 Oct 2022, at 08:50, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 12.10.2022 18:00, Luca Fancellu wrote:
>>>>> Entries in the database should never be removed, even if they are not used
>>>>> anymore in the code (if a patch is removing or modifying the faulty line).
>>>>> This is to make sure that numbers are not reused which could lead to conflicts
>>>>> with old branches or misleading justifications.
>>>>
>>>> Can we add provisions for shrinking such entries to e.g. just their "id"
>>>> line? Or is the intention to be able to re-use such an entry if a matching
>>>> instance appears again later?
>>>
>>> I prefer to don’t shrink it, the name itself is not very long, even using many digits of the incremental
>>> number, it removes also the dependency on the file name.
>>
>> Name length isn't relevant here, and I have no idea what dependency on a
>> file name you're thinking of. My question is a scalability one: Over time
>> the table will grow large. If all entries remain there in full forever,
>> table size may become unwieldy.
> 
> Ok I misunderstood your question, now I understand what you are asking, we could remove the content
> of the “analyser” dictionary for sure, because if there is not anymore a link with the current code.
> 
> Regarding removing the “name” and “text”, could it be that at some point we can introduce in the code
> a violation that requires the same justification provided by the “orphan” entry?
> In that case we could reuse that entry without creating a new one that will only waste space.
> What is the opinion on this?

Well, yes, this is the one case that I, too, was wondering about. It's not
clear to me whether it wouldn't be better to allocate a fresh ID in such a
case.

>>>>> Here a brief explanation of the field inside an object of the "content" array:
>>>>> - id: it is a unique string that is used to refer to the finding, many finding
>>>>> can be tagged with the same id, if the justification holds for any applied
>>>>> case.
>>>>> It tells the tool to substitute a Xen in-code comment having this structure:
>>>>> /* SAF-0-safe [...] \*/
>>>>> - analyser: it is an object containing pair of key-value strings, the key is
>>>>> the analyser, so it can be cppcheck, coverity or eclair. The value is the
>>>>> proprietary id corresponding on the finding, for example when coverity is
>>>>> used as analyser, the tool will translate the Xen in-code coment in this way:
>>>>> /* SAF-0-safe [...] \*/ -> /* coverity[coverity-id] \*/
>>>>
>>>> In here, where would coverity-id come from? And how does the transformation
>>>> here match up with the value of the "coverity": field in the table?
>>>
>>> I can put an example of that, as you pointed out it could be difficult to get where
>>> this proprietary tool ID comes from.
>>>
>>> The proprietary ID (Coverity in this case) comes from the report it produces:
>>>
>>> […]
>>> <file path>:<line number>:
>>>  1. proprietary_ID: […]
>>> […]
>>>
>>> after we see the finding, we take that ID, we put it in the “analyser” dictionary as:
>>>
>>> […]
>>> "id":”SAF-2-safe",
>>> “analyser”: {
>>> 	“coverity”: “proprietary_ID"
>>> },
>>> […]
>>>
>>> So in the source code we will have:
>>>
>>> /* SAF-2-safe [optional text] */
>>> C code affected line;
>>>
>>> And when the analysis will be performed, the tool (coverity for example) will run on this source code:
>>>
>>> /* coverity[proprietary_ID] */
>>> C code affected line;
>>>
>>> The tool will write a report and will suppress the finding with “proprietary_ID” that comes in the C code
>>> line after the comment.
>>
>> Let me add some background to my earlier comment:
>>
>> If we wanted to add such IDs to the table, then I guess this would result in
>> a proliferation of entries. If my observations haven't misguided me,
>> Coverity might re-use the same ID for multiple similar new issues found in a
>> single run, but it would not re-use them across runs. Hence irrespective of
>> their similarity, multiple table entries would be needed just because of the
>> different Coverity IDs.
> 
> Coverity will use every run the same id for the same class of violation, for example
> misra_c_2012_rule_8_6_violation for violation of rule 8.6.

Hmm, I've never seen such. I always saw it use numeric IDs, and we've
actually been putting these in commits when addressing their findings.

>>> After the analysis, the source code will return as the original (with the SAF-* tag).
>>
>> While you mention something similar also as step 3 in the original document
>> near the top, I'm afraid I don't understand what this "return as the original"
>> means. If you want to run the tool on an altered (comments modified) source
>> tree, what I'd expect you to do is clone the sources into a throw-away tree,
>> massage the comments, run the tool, and delete the massaged tree.
>>>>> if the object doesn't have a key-value, then the corresponding in-code
>>>>> comment won't be translated.
>>>>
>>>> Iirc at least Coverity ignores certain instances of what it might consider
>>>> violations (fall-through in switch() statements in particular) in case
>>>> _any_ comment is present. Therefore may I suggest that such comments be
>>>> deleted (really: replaced by a blank line, to maintain correct line
>>>> numbering) if there's no matching key-value pair?
>>>
>>> Yes the line won’t be altered if there is no match. This to ensure the correct line
>>> numbering is not affected.
>>
>> "won't be altered" is the opposite of what I've been asking to consider:
>> Observing that comments _regardless_ of their contents may silence findings,
>> the suggestion is to remove comments (leaving a blank line) when there's no
>> entry for the targeted tool in the table entry.
> 
> Why? The tag comment won’t do anything, it would act as a blank line from the analyser
> perspective.

The _tag_ won't do anything, but as said any _comment_ may have an effect.

Jan

