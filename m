Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5182588AC1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 12:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379781.613556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBux-0006kN-9G; Wed, 03 Aug 2022 10:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379781.613556; Wed, 03 Aug 2022 10:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBux-0006hu-5k; Wed, 03 Aug 2022 10:47:59 +0000
Received: by outflank-mailman (input) for mailman id 379781;
 Wed, 03 Aug 2022 10:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJBuw-0006hC-2x
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 10:47:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbe98677-1319-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 12:47:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8297.eurprd04.prod.outlook.com (2603:10a6:10:245::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 10:47:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 10:47:55 +0000
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
X-Inumbo-ID: bbe98677-1319-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmNrtkK/BW7IfCR8Z0vvizvAmBSoljMALZqyh6RU64RpH+GfqDc8gcXtBWlsOZJjJCLCe/AvqUGYEZLXpxD8leYsbg1JGrEyKDzTMhVkh3yIyZCrwIAkMmoXBHwtonXAD1LX3DuirVHLLRP/Je4TrofmP2Bge3+hQYauQZzCT0J/COH6mwf8tvwp9B9vDudA4Iroj++NNattaQWOSmLmoexmuZYlWanyCDtVqsyUMqVbWcI8fk94v+70OlHxf7iiPAyUxl3sYscC/mJ+oxJXk1izhDOtaaYZlaHssjEFkmU9Gkntswpu1mq71RBV7wGGN/Kt+eVBSHPg7S2D3YxLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3v1ww8SA9UhU6ZwsSo4QiI6/aUSlf9C4oxLL/kfXzc=;
 b=dCkh5pFUrM4ki2eGq7bahXttl7G7sL6dj+1pskskog6aLNh8YRlOY5CCtxDeff7k6RPxm5JJAZza4Kn3xxduo+VpVGjlPZwraW7/78DBp9y1ThR0sw/yPCn9LemO3cb1UVIJOUoJNpRt62Z6tPKrKBhWi7FpjwgXE4yxeY+YslA2ZPubpI7LO6O/Ijg05AqdHWwvRUpVUSnBWuyW3IXc/LXnGowPFtZX/RYxEk1ztoDxhaMSFpbagKEhVRfM09NhzjKCmCS94cDTEdj+DBjSgaavAm5V99HQhKdbZuIbJkknYFLndsm8G+4jirHA91gx3oVk5HLxSdLX6Wx0cRcSmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3v1ww8SA9UhU6ZwsSo4QiI6/aUSlf9C4oxLL/kfXzc=;
 b=4wHYnUZTq7Yx3ykOIjXxLPF5AntbUiwBbQZKiRahDx73TE6YS1w+zB57grS7p0mHNlU6RCh0qRcDioZegfHYubC0UbZB40xq87RkVYDkeIPoinytB/+jCPi2J6zpqOHI5I7wYnCTLIdrwE0nRzyno/AcpAYJs1kv+CVBrfmkUQz3rlkxQ/2+Q42TjXnYfeOp7sZ9v0ofmRQnOqgAT5AKW/U8zDV95qulo1vFu1NVUbtkuNgGlw9wFhhQ5UgrLXx3O4CXm5OMeOguqrnY0FGQDo72HT2yppkBMWoCInmVPYhqW8TCAH/pLuGPzGDd1TDgFcC5HcU8a0VW/aBWoDTF6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <864b524d-81c0-f8d0-31ce-cefd9fcfc117@suse.com>
Date: Wed, 3 Aug 2022 12:47:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/7] tools/ocaml/Makefile: do not run ocamldep during
 make clean
Content-Language: en-US
To: Edwin Torok <edvin.torok@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <835ba84cf1fb7619fa6672d194aaf279795a5246.1659116941.git.edvin.torok@citrix.com>
 <6b7a9b52-d378-f404-57a9-20b148f2e7a2@suse.com>
 <FEF021F3-739B-4585-82D6-D13CDCBBC24F@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <FEF021F3-739B-4585-82D6-D13CDCBBC24F@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f914804-def5-4527-8465-08da753d9f50
X-MS-TrafficTypeDiagnostic: DB9PR04MB8297:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u/dgvJNEOP7OMhTaw6avRgXIQ+65PWFA2OxaLX0RYK7pIrSZv3pWhRBbxzONhC6oe3eCf6l1bwNc1qG9MBG7xc2RAoJuSdwW7By3HAx5SZid8bXyHDf/KdEeCY6vA1bx+WB69MFlEUW0fAjQ6R+iRQAOfMPU+blJGaS73eQ3/pqUG0nSOTA9Tf3KYYOHLGZxY8slJIaceH8OGPPbINRlC379EpLLTOG7TXVYC432Q1oG4LtL2P11TAxu2pEaSQyldPTO27zn83WAxABKjR7CDGYcYC3F+d51tAnZ4NgQl7CWr1yhi5PsLrnG/JZxw49OL9+mUbUdMxZKk4S/Cx3ps0Njch2G1P25n5bELGKLjmENDxYoEp8BqT9AF1NCEygH91GB9MPX4944qzLQXGEI6tpUwpZlhILtX8a9dkYv8qpOQhuGDzw1OEldmi/I+S37HCkNhF9DL9C0iZ4v8CweDVhwWe924ScNcdDH34NpuT9bX0OL1NiQRHlJTTrStQZjJ83w/ZZ6cAU1loSNe8Ku0pGlKc/mw7YQ13QgrHrsUtAYuu2tCZhTSyEXpLde+Ui7UD9RqoBRCA5qrECx1WxkjICbwmQ0puYCmnc9O3vC63xAM7GTdDgVYRbUBup3s5a6kmcWE2o7Wg2PyPCK7UNLhMMjH4GIrwrd/cj9clbyYcosfBtKwjQ1bj8f6ke40lLdAqrpcwKIgTqpChoSRh7orBFtHMWE9vGqeGW+YNN+2OMucmRDP7soug5RAuL4IZ6F57RfG0Sshb/OFgoV3Inb8mdNDWVSAOUn/CsuUnsLIyW00U6AK/BspUyFmxgtcS9TsbqfkjsD4v8stjB7OHJOMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(396003)(39860400002)(366004)(8936002)(41300700001)(86362001)(31696002)(54906003)(4326008)(316002)(6916009)(478600001)(66946007)(8676002)(66476007)(66556008)(6486002)(38100700002)(2616005)(186003)(31686004)(36756003)(6506007)(6512007)(26005)(5660300002)(53546011)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3oxUStNdk50ZndybUdMREd6QXdlaTUwUm9rYnB5R2ljd1FLSG9OQ0JEczB3?=
 =?utf-8?B?ZkJOaERqMHZneFkxd05sMjZCK0VBamE2V0NqYUUzSHIyTnN3aUM1RHRORGpP?=
 =?utf-8?B?QXRYWkpLNG1BQTF5Z0pnRUJGUnMrMXJudE1oMDhodTlmQ3hLWElKRCtQUkth?=
 =?utf-8?B?L2d5T0tsWlhxY3NCUitjUGpDbnMxL3VCU0hYQnRLcWZ1MlcwTFZrbFZUVDRR?=
 =?utf-8?B?czJiVFZtdFpLT2NxUG1jZTNuR0MzOXhMSXcrVzBLMEtPMzBrQkd2THVwQVBw?=
 =?utf-8?B?a1RtM1BENWtTVHdRQmRTek8wbDBQM3pKTFUxOWdoc3hSS3g5TWlqVFBWZzY1?=
 =?utf-8?B?NFA5ZEJjTnAreVcxYjJhRmRpRCtvZSt2bG5zcGhrQXVjVFhHandjYk1rbGp0?=
 =?utf-8?B?VXpSR3pKak9wRDJiMDlOQjUwZUVzVk5HazdDTU9UN3IyeHNoMElGRi84cmo3?=
 =?utf-8?B?M1dTWVJNMnNuMzZFc0x1cEcrbVVpVmJLcHRLMHpNUGZSNVVENEhMNTcwL0xk?=
 =?utf-8?B?dHpqVTIra0FKdUw4OEJINkc3TW90S2F4UEdNMVRoQ1hYYWd4QlVlWkhTWWVp?=
 =?utf-8?B?RkpySXhmeUw3ODduQ3RzTVR0TS9ZUzlGZUdQKzVaWVpLNnFnMDJNOHpGRFBq?=
 =?utf-8?B?MHRSa2JUd3BaTjJ6Qk8xSGxZWWtJcksxYXAwajJadk1XQ1k2dEhVaG1SUlkw?=
 =?utf-8?B?dHpYbm1NOEduR0lpK1lkeFZqWktDUTZLQ1N2endqMkRVUCsvbmJtdDdIcWtH?=
 =?utf-8?B?bWVGdGFtcCs2WUhxK0dDRjg4M0ZBUUJkTW1sQ1FiYUYrSGZMQTRxNHRFb2hK?=
 =?utf-8?B?WXIrVGxtUEhBS3JlY0IrTk4vbGdWTVdYUnlZeXJ4eTB5T1l5bHkzSEpPaWcy?=
 =?utf-8?B?eVZXVmo1ckh2LzRZeHdpb1U1ajk2Mjg3SXluZjRsMHhNRTZ2RXRTbnpXK1pW?=
 =?utf-8?B?L2sxNUVFK1k4dUwwV1JUdTIvUkJmUWcwcFAvcjM0WXp5dWdnRWo5czFlTElP?=
 =?utf-8?B?S0s4bGVCMVkxNjBtM2NwaEJQODVvb0ZmUHNsUkVXUXM4ZGx3QnJubUp3dmVH?=
 =?utf-8?B?NlhBakFId2taWHE3ZU16V2FhM3VQY0czWk1NTGRlVkZ1RXFCb3ozbVRvbE8z?=
 =?utf-8?B?cVVKRWtZUnZvVHpFNWRacWVHMjRYWVpBRVd0OVlva2hGbEcvRG5VdW96RlJB?=
 =?utf-8?B?dHFEV1YwVkRpaUg0bTZoRjl5WnFBSzZneTh1VWViSFVjUlhnMnAycGMyYjJD?=
 =?utf-8?B?TTZFek5EZXhucG5ZbzgxaWRpYkV0dHQybldFN3crSEkzR1pCNzNab01oNkRr?=
 =?utf-8?B?MFJ2U3h4Qm5RQ3VsUEVoelcvOHN4WkdHVVYyUkFubE9ESzAzWm5zL0xubC93?=
 =?utf-8?B?L3dsUHZaN2VNUFdaaXprTjE2VXg5NXV3OFZWR0Z6UXY1NVFLdHJ2Y1BtVXNV?=
 =?utf-8?B?R1FaU3dnSnp4VW1mN0Z2eCs1R0ZvRWhDd3ZvbzVVZ0dzeTdpSnF3aDZ0Ykxz?=
 =?utf-8?B?WnkvdjNRUEpqYyt1UC9MM1EvTmV0SzlLK1dWWnFUTVJrTlNVUkZGLytwTXpN?=
 =?utf-8?B?UlQyQmQ1amJtbVNaTXdPMGR0cFhBSkRIa2grUERPMjM2dE55SXFHdGxZd2Ev?=
 =?utf-8?B?SlFaL2dPNVR0REVLbHZBNGRMZFRXbzRHN2VWY2k3azltQ0VSL3RPUzBpTDZP?=
 =?utf-8?B?SDFFUmpyWVdZUHNqbVNRR1lBUUhlbjFreG15d1BPdEY2STVrck1JMkQzcFJK?=
 =?utf-8?B?ekNHV0FCTkJHZTV2RytmK0YyOW8vd1RtZjBjR1k3QjA1SGsyNjB3T0JjTllS?=
 =?utf-8?B?WDVjRzU1M0NJbHBSdWpVV0VYZXkwdUlldTI4a3NNaHVLc1Vpd0xRUEFSOWNi?=
 =?utf-8?B?aS80UDJMVlNMS1hUbHJEdXRac3BnYXp4U1ZoaHF2dTZ3cHQ2QTdyeUZhampO?=
 =?utf-8?B?d3RuSGcvcHkwK3h0c29tUGxvZTFIczMwcXdacVdmeUZsb2tVMEFLNnZBNlVi?=
 =?utf-8?B?L200bHo5NTA0Ly93UElORTNYZHdDQUlXZ2NucWJ2a0tiVW5sYk1ySmtvWHJs?=
 =?utf-8?B?RTh0eHVFcGdscjZ3Y09ZczJ6bWgvYXcrSjZCaVVQTDNJN3NMd1oxbnV1MGkz?=
 =?utf-8?Q?4ZbV6ieBS0QMBq/kiTePOPj1s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f914804-def5-4527-8465-08da753d9f50
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 10:47:55.3592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzTM4ecWz99KqIL+Ev/APNpGoZItvUxO8lIUAs2mXzLSiYLwiig9RhdNYTdDWkn3gIWfyJn+bats8pg6eUvc4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8297

On 03.08.2022 12:24, Edwin Torok wrote:
> 
> 
>> On 3 Aug 2022, at 11:16, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 29.07.2022 19:53, Edwin Török wrote:
>>> Trying to include .ocamldep.make will cause it to be generated if it
>>> doesn't exist.
>>> We do not want this during make clean: we would remove it anyway.
>>>
>>> Speeds up make clean.
>>>
>>> Before (measured on f732240fd3bac25116151db5ddeb7203b62e85ce, July 2022):
>>> ```
>>> Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
>>> Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
>>> Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
>>> Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
>>> Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
>>>
>>> Performance counter stats for 'make clean -j8 -s' (5 runs):
>>>
>>>            4.2233 +- 0.0208 seconds time elapsed  ( +-  0.49% )
>>> ```
>>>
>>> After:
>>> ```
>>> perf stat -r 5 --null make clean -j8 -s
>>>
>>> Performance counter stats for 'make clean -j8 -s' (5 runs):
>>>
>>>            2.7325 +- 0.0138 seconds time elapsed  ( +-  0.51% )
>>> ```
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
>>
>> I've committed this as is since it was acked and is an improvement
>> in any event, but ...
>>
>>> --- a/tools/ocaml/Makefile.rules
>>> +++ b/tools/ocaml/Makefile.rules
>>> @@ -44,8 +44,10 @@ META: META.in
>>>
>>> ALL_OCAML_OBJ_SOURCES=$(addsuffix .ml, $(ALL_OCAML_OBJS))
>>>
>>> +ifneq ($(MAKECMDGOALS),clean)
>>> .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
>>> 	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
>>> +endif
>>
>> ... what about the distclean goal?
> 
> 
> Thanks for the suggestion, I see other Makefiles using 'findstring clean', would that be appropriate here?

Hmm, not sure this couldn't end up suppressing the rul when it's
needed. How about "ifeq ($(filter-out %clean,$(MAKECMDGOALS)),)"?
(Off the top of my head I don't recall whether this may additionally
need wrapping in $(strip ...).)

Jan

