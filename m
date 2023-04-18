Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744796E5D97
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 11:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522706.812235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohna-0005q7-AC; Tue, 18 Apr 2023 09:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522706.812235; Tue, 18 Apr 2023 09:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohna-0005oP-7N; Tue, 18 Apr 2023 09:38:54 +0000
Received: by outflank-mailman (input) for mailman id 522706;
 Tue, 18 Apr 2023 09:38:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pohnY-0005oJ-U3
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 09:38:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4063bc7-ddcc-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 11:38:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 09:38:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 09:38:50 +0000
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
X-Inumbo-ID: d4063bc7-ddcc-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Io/nFooOfPPrvrhKn907vYbM3DzY7PrjLYC0NU6ib35DWduhBUh9BsPSStxndLEVTBj+1OgkwXTEOD99xWKh66M4H31e+hJnvxUrWvkOFOQ3G0GXq1V3XWV9kryH1WtJWTY+fng5YCR/Xj4iVjgy8NYroNjN0Noo+Bi99iWK89DPM+2z7OHMVeKYHdMQfM+EcY+i/7+gTcLDnMXY20E8Pl12XUf1zpDsfE0wAPIfJ1EK3MgbSz+Vn4Lev1qfi5b5cXkzZYDu4DQjYuKU3A9eyyCm9//+kLV1cCfjVa4WneE0iuEl2g4VN83MhNW5sVLGITMeLk12MRDteLnejWG0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogWMwPoSbDuqivXYfjPwTOM1RRjb8h/Lr4C9H5qDfA0=;
 b=YtqnNDnvSYCc4i4G7b1i0vUCv/HlX1ImVn9C/Tj/4ey2fRrYM6OSqa1xeF9hylGEFqnBi75yVGc5BgG3CkH5azAVbP6N1e9jX/dvQOqV3BTlZEoUKFraPNqNuKeCjsoARWQEbPl6mN+z/YFQehckogAKVvK+MAh5uzr+DpqVprr4e8B+lVXW+fbA8EhIGUsCM03pxBn8Neih2FrJOZ29kjtLX8UHko5fzYmoRLjcoF7SgAk//WO1/u1Xh0/aJebmfiXlWxCB21HLNZTPHj6vZePW3abeLDUvGmmzX72TX/ZK06QHYK1QfCtTEimRKoI/TL0bqHtMqBqxzSr1vQLX9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogWMwPoSbDuqivXYfjPwTOM1RRjb8h/Lr4C9H5qDfA0=;
 b=pH2jGpWc1MZjegMpe50yFWP0sKCizr4ZXEeNpgCCTqFL9St0rM3EDEx8CyPRjJJgL/45tXyN5gxzanhpF6iVJpsJSgV2TKUtF9/txYMymI8vukqU/EcUiE/g9jEnNzRgJnzD/s/OexLq5ge7ghHd18OpgeQDvXglNy1+E+nvHKWpaD5sR5Adf/pcsVVjAHExetXMzzyRu0fbHZ0KSFS0//M7PdKNUizBQ1QutRz2ME/zl+0E5U+1M1w44799VE3DEqlrE0tL3eV6sQ0NHW68ATaETNr5METOCBQ7wyvc+zljjkXsUFzdvipWr48iOfWmtgfb9JMqncnOc5MleAgh6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <963ede97-efd2-e63c-429d-32426386c3d8@suse.com>
Date: Tue, 18 Apr 2023 11:38:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] tests/cpu-policy: fix "run" goal
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <80a02af5-9154-8289-4e92-6016c0948a61@suse.com>
 <ZD5jT/F8b82ZkGxo@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD5jT/F8b82ZkGxo@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 31809f27-4b60-4bbe-3501-08db3ff0b757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kdQFGt8x7w8/lLhAW2OJQZlPYjk9pf07wZKNsB4C8v7dQmChjls1Y4sPeZtWRlw88loTx0FDBHTbrXDuZ/At+SdAPpap9fPwxqhFt6hXU/yRmtHx88cr/wIFAYquxCC7XOf6d/N3yqkwfAmdNLY7btPaId6vcG7z9dIQjsk0n6+K+zvS+JRV8XzG+xEcoFf0HhOaxQ07wsm9XBl6VWXrY8G+RzXnJJ/iKfWxTd9qQHjvN09li7vt7taRvzwmMuuSv6PCcRxt4sYq7bg3Dmv/atgpKV9M1U/J+a608FRILicnQB4wXuCzrCNUpEZ4H/BJg9fKIEkIUfW1Tk588xl3WjRRuqxmWStAwHfz0jM0lrfH9opNthPPX4q6Frg+ljOdf0ic9jo/tcdKBh1u9XfY9JNPFSTd3WQeANcSzkBRNaz2U6Zw9yRAnlSX0Ztvx/R1MCpxMkwTQsFxSwn50Z4+g7DgZFjON8mvJ3TdHy4mr1VpbvcXPQqMfuFJW2oQraiJ3D4/gBQjaF3SVGfOZ0frHms7AtTUCLt2Qm7HBLIOlR96xIO+dWW7ktYRJ2aKyP3SuMA9gSrzYti3lJxJUMhMP12Za29HjAi7wd69SpOX5fLBenf9NNaOYWw9PyTI6Hr8QwcyFKSEoC0j8vwnEtmX2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(36756003)(38100700002)(8936002)(8676002)(5660300002)(2906002)(4744005)(86362001)(31696002)(478600001)(6486002)(54906003)(31686004)(186003)(2616005)(6512007)(66946007)(53546011)(6506007)(66476007)(26005)(41300700001)(316002)(6916009)(4326008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2VCVVVMWUtRaUZiRW1PY2hLSm42a05CTm9RTmkxVUJLYUlkLytkSzNzc3o1?=
 =?utf-8?B?aWlndnloTW1HNDV6K0txb0w5ZDNYQkd4N3ZtNks1MzhKeHh0OExxcHF1QTRK?=
 =?utf-8?B?ZDE0a2JJYnI4eHJDTWJad1hPd29lTnV5bmhsRTFvVTVFbEFhNnhJdmxEOTd3?=
 =?utf-8?B?VGVBUDh0eUtQeFlOSEwycXljUStkVWVENjZCQ1J2QkhyQjZkMk8zR2NxNEI0?=
 =?utf-8?B?a2pFaERyZi9yWkJSTUpscEtRemM3RDhIL0hiUUJZcmdyV0dOOTQvQVNrRlBj?=
 =?utf-8?B?RU5nS1ZhUitURHg4SmRyNnEwOXJuMHFKMmpGTEVUZlRidjZKcmpHdFdWZDQw?=
 =?utf-8?B?RGVQQ2w2b1g4RzlDRnM2R1RRTDYzazVwYnFiemNDQmg0b08wYXA0V1RVWnlQ?=
 =?utf-8?B?ZnB1QURlTVhyUGVNcHp5VnduaG5mRzBLTzVyQnZhcEw1YjU3VXFxRFZSdllZ?=
 =?utf-8?B?eXJXTS9BQ1c4bWdwUlZDS0xZNjIvK2xFTjBDU2tXZ0RRKzRheXJWcjFMMld2?=
 =?utf-8?B?dy9uWXQ5ZnZxdENkeVA1akVEdEI2SEVWbFJQbDNTS24xM1c1dGdqc2pzQzRG?=
 =?utf-8?B?SURva0hUZDF4a0VVb3FuQUhRemxBdzVOVmJSNWtMRGcvSmtzVkU2NHVkQmVJ?=
 =?utf-8?B?cStTNWhXM1Y2dUkvVWJHQjdzV3Vnc05XeG9ZbzB6UDIraFFpWk5uUFRxQUts?=
 =?utf-8?B?QVpUeEM4SllLeU5vQzg2MHovSVZiUHhzcThyWDFtSXNqWGUzNVQ2WjJ0ZG44?=
 =?utf-8?B?clZ4SzMyV0dSNVdxZWMwTnVxSlR5Y3dnUDdLV0NOVzFWMEJBZXUrLzU3czE2?=
 =?utf-8?B?U0VCV0l1NDBwYjBRcFZoU29wMk5UTXo0L1FKdmkydlpraEJoZ0RVN244NlY1?=
 =?utf-8?B?czFuQncrS3cydW13ZURKemloenhjL1BobENoREsvZDl1eks1UU9BOEh4RnU5?=
 =?utf-8?B?bHdLZUhCYlI3Mk9RMjRqQTRkajNHN0YvYmptK25pbldINXhVSUdSYm1mWDJ1?=
 =?utf-8?B?T2FFUTV4TEhPWmZXYUROSXUwb2Q3UVQ4NEYzbjk1aTUrcFFKblNvUE9RSHFO?=
 =?utf-8?B?NlArdDZDQjlYbDdHbzlRckQ2Q3pGVjhhSnF1WHMxSW5LMDZubmQ0dzVFZ1RI?=
 =?utf-8?B?eVVpTXFtYTFsOFJ1N0RLZzVFMGZyaGV4OXJsK2FqTzFscEVFTXIxWFJhMDRy?=
 =?utf-8?B?SWVBVmdNbWZjUWlWWTd1NDMxL25kdXFhajJnL2plZGNncTFnSGFJeHM3K05k?=
 =?utf-8?B?Z1M5djRvVXJXMnBkNjRoMXBGU3ZpYzVSQVZlZ2twcHVGNFY1cHhJOWkvR3dV?=
 =?utf-8?B?cWNKRkdocWQ2OG1tak9MODl0QVB3SnRRWlRMd05NVWpSemptTDVEa25XcjY4?=
 =?utf-8?B?ck1GMWkrYjB1VURsTUpuWGtndFQ0eDAxdHZzbWJIR1NMOFBOSWdSVEdSUlBC?=
 =?utf-8?B?NHpvVnl6Z1J4d3hBRHl1Q1AyVHBhTngrTHJvMExDdzk3eCthZjR5V1JDby81?=
 =?utf-8?B?djVacTF1WEdHby96OXRiRUtMelBEeDYyVThOdS9tNGk1UGg1bCt6V000d2R1?=
 =?utf-8?B?OEhMd1ZZUllaYlFOUEFoK1NmdnB2eHJiamxLWFU0L2hwOWNjb2hSSHljWFNE?=
 =?utf-8?B?M0VOaktrdlVVU2gxZm9FQmxaOVpuNTQwZ2ZoUjlNK2JWSXo5L1N0SHV5NGtp?=
 =?utf-8?B?dEg3VkhTQWFFUEhmNjNrOG9MUFhPWTRNMEMwRXFpdFJDcklwMHIzK3o5d2Qx?=
 =?utf-8?B?dHZwWWI1TDFoS1oxTDZlc29EMmdxU1BnT2xhV0EzRU5JRzF2QlcxUmIzMEtU?=
 =?utf-8?B?THNaNzVpd0NFdEFFRWRvcjh6a2FYU1lqWEdZcTZqUFRYSzcwbVp5ckVnRWd4?=
 =?utf-8?B?dHBsS0JhOVVKWVRQOS9CbjRlVWhNMHR1YWpKKzRrNEd1aGhiYUlVRlRDZ2Nx?=
 =?utf-8?B?SElQdzhNUFd0VHZRb2YxMTYxU0JUWnVKdHhmR1dMWVpuMU1nS3VnWnNuYVp3?=
 =?utf-8?B?QWxhdFh1SGcybkY0L0N1d2ZHZ1pmZ3RzUjJRV0FSQzlQZEpxd1hmZHNQUDY3?=
 =?utf-8?B?RWpOQXF6RzQwTm00aFM1THpxWmVlYjNaaEFCV0FNamRrU0JsYVBsdFdSOXo1?=
 =?utf-8?Q?XCd2IZpiYNdtuR+fIPM6S4sDi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31809f27-4b60-4bbe-3501-08db3ff0b757
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 09:38:50.5682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMY2LdhwxxAXgVGJE7GAvAbC6KjWm6Gl5Ny7leV0HZrH3lU+0uvtvm0R6ptDtf7sr32eWLiVfcsyAOzzbi67HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624

On 18.04.2023 11:30, Roger Pau Monné wrote:
> On Tue, Apr 18, 2023 at 11:01:56AM +0200, Jan Beulich wrote:
>> An earlier change converted TARGET-y to TARGETS, but failed to replace
>> all references. Convert run's dependency, but use $< in the command to
>> avoid the leading blank that += inserts.
>>
>> Fixes: 6a9f5477637a ("tests/cpu-policy: Rework Makefile")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/tools/tests/cpu-policy/Makefile
>> +++ b/tools/tests/cpu-policy/Makefile
>> @@ -16,8 +16,8 @@ endif
>>  all: $(TARGETS)
>>  
>>  .PHONY: run
>> -run: $(TARGET-y)
>> -	./$(TARGET-y)
>> +run: $(TARGETS)
>> +	./$<
> 
> Since it seems like TARGETS can contain multiple outputs, do we want
> to have a for loop here?

Imo TARGETS is just the conventional name, even if it expand to only
a single target. I'd prefer to stick with the simple rule until such
time that there really are multiple executables here.

Jan

