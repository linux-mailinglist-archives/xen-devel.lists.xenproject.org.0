Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B09579814
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 13:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370580.602417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDkxC-00067S-MH; Tue, 19 Jul 2022 10:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370580.602417; Tue, 19 Jul 2022 10:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDkxC-00065N-JX; Tue, 19 Jul 2022 10:59:50 +0000
Received: by outflank-mailman (input) for mailman id 370580;
 Tue, 19 Jul 2022 10:59:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDkxB-00065G-8X
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 10:59:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e772f049-0751-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 12:59:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6893.eurprd04.prod.outlook.com (2603:10a6:803:133::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 10:59:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 10:59:46 +0000
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
X-Inumbo-ID: e772f049-0751-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKvWosZVXhDZPrnF0Obpd3r3hGz0dT98O5cJs9Qa4RB9gQePXWTcuzUlL8q9A0xY02TVgN4vUhNhfRB2WldCy3bBFdQha861yBYjayaFCSCExYtFaOZh+YoVQLVOVNNyfE0aEzJmQqoNu5a6weyxLUaJbzAAOARyc1HezmwPBHm2crlOfLNDQ3uTRnEdRUwXLqOkawkxg2xqEO7P6Ky/3LE5qqqfUI4EsyqTamw2fFbHcQTM22D82auOKNtEKiryijpn/GCe589TkF6Kj8/ylocaz7iqPMl8449WkA6QAjaRoy57B0yb7i9R9JShZKrYpU6GIy0UeEObFAJK07G4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DjIkfJbELGULg0dWJW8CLfI71F+vgNdui0vFWfUSN8=;
 b=gFjRx8ha52UMi6U8GWIVyvy7rhn63bwda0L/8Vnj65w7PHWkxJol9ecqbCkreSp/LdlydOBj/je609PXoRl2/o15C6K2Jzl17mOUAcgFttTnsgzojUo/5T4eUmVXQlD88QgKqaa5obYE0kYEyusRp8F8Rirep9c3hm9bLx4hjI4mrELl7FYtn8m6DxtNZs1jlxv3bTxuHnODZ72hE+paO2tVNwvQhN/4LnwEUVm2kfld8d7frvHBY10Z8auzj8rgLj+XnkWIVeKdSh/0RDw0vJsRRRUsXJXtOYTrpoRiIFJAqRzOMJF0222R/lpJanDNe2FoFnqlzmMoVnCd7DO2KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DjIkfJbELGULg0dWJW8CLfI71F+vgNdui0vFWfUSN8=;
 b=4YSzfBR4m4MxiHyaBFly8Yiv8drf1+HLHE6ycnTg2UUyu4+s5NKJaZJPBu1MTUQO37ZJRk2ItsNaIH/ZzG7Qle+13uJ3fbwayuBQmSs4ZGX+ijiQt+OlQfnenoR38+O8Doa6q/HBsdgFKUQqY8+9Cs8avGGx4QtJ7r7v6GJ/P0N/SgrB3dcpAzQTFkUJdjDQIVDIHw8rgbHY+jYQ+cpP6kUeVWu8YcmAUt9h9fIzsRS6Yo+SBWXMmJcGy3dvNXCgnN0nImoFThweosifXWBlrrQU8AJXeV3KWxTcLWAYU2jCWkB8YkQYkuZvNlSrwEQmAaUksmUg+2xSvX9TmAp8OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a8d4fe8-de96-06cd-adc7-073bf746d5e2@suse.com>
Date: Tue, 19 Jul 2022 12:59:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?Q?Fwd=3a_Ping=c2=b2=3a_=5bPATCH=5d_x86=3a_enable_interrupts?=
 =?UTF-8?Q?_around_dump=5fexecstate=28=29?=
Content-Language: en-US
References: <3a5a1efc-e610-e151-fa58-25cfd9177f26@suse.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3a5a1efc-e610-e151-fa58-25cfd9177f26@suse.com>
X-Forwarded-Message-Id: <3a5a1efc-e610-e151-fa58-25cfd9177f26@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0045.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4e6d2c1-a51a-4a0b-b3b1-08da6975cab6
X-MS-TrafficTypeDiagnostic: VI1PR04MB6893:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/87Tu8PlIO2ae2UHO5StVuKTfNL3N3m6+96KVUjXfklYtgNyzv4LMmbK8/Wa46K2sM7SDiSbuybBbE4Ra3vakgOTwl4jOg+pB5hBPAexFnUeSGE2A8Fizs+DPVQJNCzXp1rIlfsWGgL1HspKT7W/eCUdoRysiyhWGWDKqJEkFKUfhz01ups1pG3qLgWDlLDCKWejLvOLL0+Gt1N2UBP6ToLuY1+LniLMWvGv5YSvptu13HF3dUT+tPh6PBvn+GWuYArRuwb0Lt8wxXfusYVmrLLeq2C/yEXbkkbrGqJYczF9Xq1gjcArizMIVUoj72hyCamlfKs4HcfZA+xjTw6H5fL1bf51TlFwZFWoF5rKgLU95wZGGMxumTP3dnke8oq6nYXgrDllZlgvomxO+LqmJSLxAWK6nX+PIRjdtX1ZEBb+aSHMNh7JnUcQiUBUj74bsPuwoZ0PrmLre9ats+B3zTY/3ie4xifX+uDCQVdhGjh6vmb3ga2y3eCXwhACjZp+NqWD6bVZWvFbBjuhSeNc/XYhF2+BAtdBvlXXP0ASFwxmTmAJat+xhAb3ThI8aKQ/iWSBML/Bvk+uGzta9g6yZhK6DYzkuaodISRQ62m/sjYz5Tr6z35PZgLMxvHCaeGwykdxZ3lMU++06AY+jpgTm1yLlsKD1iIKWKNNB451r4UPafevRMMYRNZ8MGnvkB8g/kOMITN0FR1v6PzrvkV/9dFmImxPR4V5GhJUz/hM62oGuOO8OIELdxveyDTQBkVqS1PHTK3+sj+uvfhh7GnBYCLgVX3y7VpLpcDEY52l3swjnp3VDBA210a6tP/z9+/ad0buKJPws3C9aXcmb/KSeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(346002)(396003)(376002)(8936002)(66946007)(5660300002)(66476007)(66556008)(26005)(38100700002)(4326008)(2906002)(186003)(36756003)(316002)(6916009)(6486002)(478600001)(41300700001)(6506007)(31686004)(86362001)(53546011)(2616005)(83380400001)(6512007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjFCaUF5WnRMZHhhajNvakNYMUQ2R2NHSlZqWUoxZkhMdUpJbFhvT1UraHFS?=
 =?utf-8?B?Mkx0ejNtTm1yTzUrOUhCcDNTdWs3R1pWbDd0d3VPa2NMT0FxYXNoYldBQmxD?=
 =?utf-8?B?a3UyNEZHNW5CbnlUZndWMHFpNjJFbGlyZnJSY2VtT1FueHVxQUV2bWM0NXRR?=
 =?utf-8?B?SWNmczBzY24zQWV1dG55RE0wMlVkT00yMjFWYStDOXNmdWFaZ0tmRnVrWUNC?=
 =?utf-8?B?RnpwQmR5Si8xWUswMHFhRUJmSXBzeGFOeGxJd1phcEh0Ujl1QlFIcnV2eFVN?=
 =?utf-8?B?WWk5d1lEYUhrKzlZK3Z5K1NyaVVqR09QRk5PempFZmE5WXRFajVvRVE1dk56?=
 =?utf-8?B?cm1FWndKckhxNHVxY1JsQytxaGN0WGtIY29VamdqTnFId0tXSVZIalY5T2Ns?=
 =?utf-8?B?WjlQendoMEZ6ZDMyemZqakZjbisxWWJIOTZPQVRYUm1lZGpiZzVvK2FkZXQv?=
 =?utf-8?B?UEFsdVAvc1BKUS9maTk4Znhta0F5cUlxNWdCbVpCdGt3M0xuT05KMXZLUmxM?=
 =?utf-8?B?M0VQbHNzQTd1TnBmNWs1Q0gxNk53RDlRenNiMjBvUmMvNzN3ZEpIVHN2T051?=
 =?utf-8?B?UG9kYWdKdDZTYXF5Z2EwYTZrMDd2VlFSOEl5TzRhWHB3SmI4UE5tUThXM0xz?=
 =?utf-8?B?SmptazNYODVHa2ZBenJXa2gxZVl6bUNXYVpBUHZvdHBFbWswTkhOQWZrdFJk?=
 =?utf-8?B?MHg2ZFltUkswR3RwZG1yZU16SkFXdVk0N1hLVFNNT2svSDF1UjNQNWlZM2o5?=
 =?utf-8?B?cTVIUDd4VW5HZVZTYVRCV3JlUHdhSUtuUEltUkdQNmdIME5HZ0x1QmR6bEFi?=
 =?utf-8?B?ZW85cXVCUDUzV21oU1BWNXUzRUVOSDJNUk9QMVZZS3dCS0RIRGVnQlBuMXRl?=
 =?utf-8?B?YjR4UFFXUzVGQ2xZTVVJM0ZjSU5Oclg4bStqbitxMVd1V2JqVVRXb2RqSTVx?=
 =?utf-8?B?RVNtM2p6MnYrMFFySEkyUlVqWDJ2S3dFdVpvbHVLYU01WGkyd0k1eml1a2s4?=
 =?utf-8?B?b2FhVVE5a2tLeHZ4WkNRWjdqWmNzbmtxOVFNdzlHdmMzc0J1T1E0ZTdUNU1S?=
 =?utf-8?B?d0d3c1VMTG82OGR4YWFqZGQyT1VuTVZhcjMrcXptTHNlS1pUUnpjRkN1ZzFq?=
 =?utf-8?B?TjQ3WnBlN2tjYlRxNmw5MFAxRXlhb3RnTWI5M2JEbzhXY3U4ZmRuTjZYMFRp?=
 =?utf-8?B?R3NoeFQwR25CSW5uem13blZrb2xIUUxzZHVTUWJtL3kvWmJrbW9pYm1HdmdR?=
 =?utf-8?B?Zk51elVpbkFIdUZEVHQ3NUYvV2FWZ3RoeEwxci9LUHhpd2FCa0txU2svMFg0?=
 =?utf-8?B?eWZFWm95WWNIbDd4MmM5TFhpd1djZ2JreS9EajN4Uy9BZ2tlNHgzWHE1WDJh?=
 =?utf-8?B?dDh6bWpFWmQwVVQ0NGo4ZHNra2RJS3RpWDN3N2tROURlNkpXdG4rM3Evekd5?=
 =?utf-8?B?K2Z0dXcvRjhjMktZK3ROZnlyMHJJalk0QitWSjBGN0xHN1JPcXhldVlHbmxm?=
 =?utf-8?B?c0JuYlJocENidVVVSjQwYi80ZHdXRlB6UEozaUEvckhoYlpsd3JBVXh5Ky8v?=
 =?utf-8?B?Q29rQjRYNkFPeTEwNThDS3dvMmpLaXFiUmkvbno3SWVsa2VzSjNCMWxWaGdF?=
 =?utf-8?B?UFVaQmh2ckFVZWdUWFVOVzBRc3JHUkNGZEh3SG43KzlFMjNEY1IycVM4Yklz?=
 =?utf-8?B?bkxNWS9kWVgwY2FkalFRTWdmNG1CUWtlWktVS2VCTjJ1b0ZhVDRjcmVmMDV5?=
 =?utf-8?B?VzVUNUtCVmw5K0hQWE1tMGtWL3ppa1c1VGFSU1FmN2ZpQmdYYnRyK1N2Z25N?=
 =?utf-8?B?NlVQV2p3cW45Y0phNlVEdjlDSDFTbjFSVTZjeGtwLzhKR3QvanNmbVVVYWZK?=
 =?utf-8?B?c2kyS2JtYThmTzN3OTJlcU1aNUNJbFpjbUdzUWZmRHYxUzd5ZVZRZ1BpSXE5?=
 =?utf-8?B?MG1aNlBiWUNKRERkRjVHdkRadWFSZzRUM3NTREFtek5wSzgreWtXanhrN0d1?=
 =?utf-8?B?d0ZFVCttT3FkMkpvTlRBT015d0R1SXlvYUNkNVU2YVQ1b2VmbnpaNDNpWUZH?=
 =?utf-8?B?UlUyVmNieXpvcmx5Nk9yYkhBaUZLN0x1U2VvcFh3THZRVDFNS3lvdy9FZEtj?=
 =?utf-8?Q?eCoh1UQdZq5/NSMaAFwn0cSzk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e6d2c1-a51a-4a0b-b3b1-08da6975cab6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 10:59:46.1126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0R3+h7b+uXBh5MOUCxpeP4E8OGRuc6/ii/VlxMEeQRAHWw6MAgfxsM+7GO2zPPT9CqlQ+fGA1jeo/Qusmx9o+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6893

Henry,

-------- Forwarded Message --------
Subject: Ping²: [PATCH] x86: enable interrupts around dump_execstate()
Date: Tue, 5 Jul 2022 18:19:38 +0200
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>

>On 11.01.2022 11:08, Jan Beulich wrote:
>> On 16.12.2021 14:33, Jan Beulich wrote:
>>> On 16.12.2021 12:54, Andrew Cooper wrote:
>>>> On 13/12/2021 15:12, Jan Beulich wrote:
>>>>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
>>>>> the consistency check in check_lock() for the p2m lock. To do so in
>>>>> spurious_interrupt() requires adding reentrancy protection / handling
>>>>> there.
>>>>>
>>>>> Fixes: adb715db698b ("x86/HVM: also dump stacks from show_execution_state()")
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> 
>> There's a bug here which we need to deal with one way or another.
>> May I please ask for a response to the issues pointed out with
>> what you said in your earlier reply?
>
>I sincerely hope we won't ship another major version with this
>issue unfixed. The only option beyond applying this patch that I'm
>aware of is to revert the commit pointed at by Fixes:, which imo
>would be a shame (moving us further away from proper PVH support,
>including Dom0).

perhaps another item for the list of things needing resolution for
the release.

Jan

