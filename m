Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DB679369F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 09:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596304.930155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdnQ1-0007gm-C8; Wed, 06 Sep 2023 07:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596304.930155; Wed, 06 Sep 2023 07:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdnQ1-0007eq-7V; Wed, 06 Sep 2023 07:57:45 +0000
Received: by outflank-mailman (input) for mailman id 596304;
 Wed, 06 Sep 2023 07:57:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdnQ0-0007Y3-05
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 07:57:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ef7064d-4c8b-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 09:57:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7090.eurprd04.prod.outlook.com (2603:10a6:208:19e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Wed, 6 Sep
 2023 07:57:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 07:57:40 +0000
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
X-Inumbo-ID: 0ef7064d-4c8b-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWjKNUQ1Ib0Q4zLRU8pzTkUD6LaH8CXt9btwO986/SYwKMRtcrCcAzqlwgNy9+gpxU1ohe5ytKk7194WRtKZGts2OPypiej17J05fs7Y2jAC797FtQzbMGc99wpMzpmhvAtFyD3Efs7u++AMW8IdOQ76gjpXyiW3MVXbON6MeKM2Dhc8xF4WXPaaEVwFt5jzkwE1lkhZlve5SPRc8tyqo6YxjqaOI5rF+joIiMGtF+I0rSbSixlEvooTL9DnaSrUqn1ES5JNPobM3wbrKg0hNnM8dXJV6hdC1Ks1629AF/PBxhA03dS0NcFrZE8j3TZdWUfgBPAyl+PTjzldt9BA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmiJC2/D3Lccxlr3AQUOlcFKrxW7piVLIaRarkfX0AE=;
 b=HPbJRRKZYp4ygOBOeVCpTbHz6Xk8EHPckhvaliYsHvXH9gClzCBe+70UHGr9rtZz8Qi7bd0moZ8g3unUz2B3nRRX5b9o9opiJcjYuZXEqJtHYBryMKRle7IYwADycOeot2Q28NMg3fRBh8hXHCMsjxB/M4qIKLfBCkXx4tzlIYMxwtQFZPF5q2tAnZ/xPhPtTjUlVOKeKLjo2RtDnTXxzEztM9+4oBJIxSFxdwU694V43C7wFYIWdYTSs4EEwYnhtWMtK9auLsWI6atSiI2Gwg5Vtq+I87wVy0yGTrYNRETqnj590hbV7GmSw9+hjynggc9izZKR6UuWgCVgdmCXFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmiJC2/D3Lccxlr3AQUOlcFKrxW7piVLIaRarkfX0AE=;
 b=2LD0BiRQOmuytOJuAXEonay1PrPS8dAA5u44CSBSjTHzad4uyO7Ouva4eLQrllP7SBzkeouelufFJ0Ezvrv+58CucGGwAQiAX5H0/HW0aFQh8VKLtdmsxMq3iA8td+e2SDc912iqRQ73D1T5GKeTGli9gDhgs3daNtX/nXYSW30TwUnweYc3UOHU+8WBq2v9VHf4TmaFnRh1QBvPnK6jLN9KqLErz+IoTUxmEo2W7E8AQ7lw9s/UaDTZt2PKgNxSk7WwHmGXFpeEAYxmAwjEorYkV+OAS8iNHLKYfXtaNseTA8lBcH+cfTG40myxAJnKPEq8T2Y8lBjEsBgwpkBuMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd1026ce-8c2b-2198-fc7f-91f7e671e62f@suse.com>
Date: Wed, 6 Sep 2023 09:57:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN][PATCH v12 20/20] tools/xl: Add new xl command overlay for
 device tree overlay support
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Vikram Garhwal <vikram.garhwal@amd.com>
Cc: julien@xen.org, sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
 <20230906011631.30310-21-vikram.garhwal@amd.com>
 <3ee81557-50d2-1ae0-e700-9f20672ef15e@suse.com>
 <6a3bcb64-2416-225e-8a5e-5ea7823d3c29@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a3bcb64-2416-225e-8a5e-5ea7823d3c29@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: b77ede8b-10b5-4445-2110-08dbaeaef16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BPwshETNJsDryG7b6nCEr/UoHi7uODau7i1Se4+78b44ARvn9jdtAlBRqKsYS6FOk0PJS7I6R3XFSfDXZMXIWL0l31HG1ySpgGkB5ElCgSgOdmc19sGG+SMrgxkliqD7mMg8ljjPkmE/Y2/nAqxAKJYYjvErdLjEKtbSaq5vdRL45+XK0mpsUISTG5cOFzP6Badk3hL77q60oF+EYbQxU70Bk2xYkt0eOR5tjpjxJ7jqQQ9HVa7vUYuAP9xXuxT9j4a/g96JpdTKua0idS0d7lHySn4rQpY8wrsLOrM0u4sumhlBuiPC58DhL+fydSc7/Gpm9zGSRQYzFkRKIB3hFIQQXhqICo56G02IqBo4P+P3lZXk4YjLLzvmABVISKiqpBfT26S/V0CHOv6rsVAqote6MTNcsAWamlvly/IJLljRprh0JxnMnC0aKuWH+KHxfFJKsha3fVUkFI+gLOyHYe6nNk3KvPi9v6BsctMYMcBK6d7HBmpGem3WvKliSP6KsWeSd4R72/07Txw/K53Gvf3DuAZeyC5zhgQe2sO7/5qi3Dy3tKYgCQ28RW080LjpZ2NHuE1XIPTkxU4ENjPyyYvXpKqSlAdKWH7oPS4j6f3Y39eoZRPnKF+oEnefKGfO8xDObBO+h7GGJJPM5umD5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199024)(186009)(1800799009)(31686004)(86362001)(83380400001)(36756003)(5660300002)(31696002)(6486002)(41300700001)(38100700002)(66556008)(66946007)(478600001)(26005)(66476007)(2616005)(6666004)(110136005)(53546011)(8676002)(8936002)(4326008)(6512007)(6506007)(2906002)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REtsd2t4UFBnaGd1OWc4clc0RXJBSWpvc1dwOTJsc2R4NDdKWmNkVlBqM0I5?=
 =?utf-8?B?MHBLUHl2a3p5QjYwVnVYWlVrdWZUcnpSRkg2MHZHQVo4N2RyRlEzQWd2aDY2?=
 =?utf-8?B?em1xOHlhYVpLMFd2cFdVNGlFQUx6aDdEb0dvQVd0cThoM1laU0lPdk53Z05S?=
 =?utf-8?B?bVVEQkdyQW1ybWRqU25jclo2K3ZNRWRUNlVrKzZmTHlnMWJLUmVpcTFTaGxU?=
 =?utf-8?B?am5rQlMwa2d3R2Z3Tlh0ZThDTEFJL3dwWFV6aFFsQlRHdm96aXMwYU02eDZB?=
 =?utf-8?B?UWkxc0J5UTFCakkzRHBFNUVwNk1sL2l5bVYrK3R4cXp5Nk9GWlAyVUw4bzdt?=
 =?utf-8?B?TkV4N3FPS2VVTVFHYUxONHdFUDk1bDVyTzR6MWJOWDVPN0xVUHNrckFrNTJo?=
 =?utf-8?B?alBSL3JqdHM1VTJCWFR0VndJYmlkZk1Xak93OUk0TzNJQmdYSkRzbjRHUWlR?=
 =?utf-8?B?Y0xPV25RMkxHTndLNTN5RHlGRVl0czRaNnZmeitKYUo5aWkwTUFVWS9CQ3ZK?=
 =?utf-8?B?ZVJCTTRjQ3ZXL2RNbzdLajRQNjFsbk8xaHRrYzNDanRDci9xRmtWWXE5bVRr?=
 =?utf-8?B?NW10Tm94cDZNa1NQcTIreURZSzNkVFAyZUdybW1NNHNCSHdrSkVOVWIrZHUw?=
 =?utf-8?B?OFNFRU5uSFBKemwzL0FCNzBZVENzSFRaTWtkOFl5bEVrTXJvRmtiQURpU3Vz?=
 =?utf-8?B?ZEI0SHRERWFpZnlwS2txcVRpbDhMU0F6MzNFdnprVktFVW1LbmdKUy9HSFhJ?=
 =?utf-8?B?ZlRvbzFqR2tDN2dXVThucUliWVZ5MVFtUnZlV0FVWVdtcVlpendPcnJVOUQv?=
 =?utf-8?B?TmxCRkcrV3ZZRjFzMnd4NkdTaVhYaGxOZWg5Sk5ETDRIakVheVRhN0kwVWZW?=
 =?utf-8?B?T1Q2Rm5BMjZTWFpmMktCRWZuVXZqR3ZqTUROaFc5bmtKOE9Ld1BoeXhCY0lx?=
 =?utf-8?B?Qk1TNWc3WmxTZ2VocFVSUHFFQzBROUhZNHhYYmIyVHEwWnFzUTRDb1pxMkph?=
 =?utf-8?B?aXJEL0hlRkFSNkNpQnRNU1VyTFE0VmNzbmN5YlBlTXBBRFV0UmZDNGEvS3k3?=
 =?utf-8?B?bVlKNWtRUVBEakhZU0xPSm1iNGZnNG44Q0FUK1YwdnRnSlBLdllDSEhFcEs2?=
 =?utf-8?B?aExpMHpzalVUcE5NYkVYb2NxUi9YL3RPZjRvdVFWWCtEc3VnYzQ1clBiTG1m?=
 =?utf-8?B?RVpLcVdkWHpJSis1NWxXcEpJOHloUmYrdDI3U0tUR0MvSEg3UEYwT1pIUFUy?=
 =?utf-8?B?NWZ6SG9jNS9sWXF6VFJycmRVRytZMmxaNjFycC80WFNmV2FQLzVwUFM4cHJW?=
 =?utf-8?B?Q3FjRHVMNEF6NEM2N0RhK040TjN6L3pLeXh3RzdsMFpwNWtJeVAxekpRcnZE?=
 =?utf-8?B?YTdkR2dCbTNLa3Nic3NTdnR1aXovTVcyUXc4VGNzL0RxRyt0RTQ2TnNCSGN0?=
 =?utf-8?B?M09FSHpTU3Vla3NHQVoxTVIrMWI3Z0lvek5JTldzZ1BnV3ExdDRoVklYT0Jv?=
 =?utf-8?B?ZDhSZjF5a3hrVlVWaU13ejd2dTJuVFFKakVqOHJjNGRGZTVoNWtDMENOUktI?=
 =?utf-8?B?SW1qWU43bDJoSnVwcnFyR3pCTURNanV2cDNzaFpKVjZkSmpndFZJWC9iZWFP?=
 =?utf-8?B?cGFBRVo2MElKa0lzMmpha0VMUThWOWdwL3U2UEU2NE1HS3Y3MXN5NUN4WWVu?=
 =?utf-8?B?eDU4VlFHQktYM0NlVkRpSUFOUHoxRU5Tbm82Q0hUT2RHbGx3L3pBOFB0c2pp?=
 =?utf-8?B?V3grWU5jMUhsUWpwSGFoYXdmQkZTRDNUaHRIS0dJUXFEc2V3YmJTenBFem1P?=
 =?utf-8?B?bENPMmlTbzhldXp1ZFhKbU5XZjJVWWt4TTFlMlB4MzR4dE9WUFpCb3UyTElN?=
 =?utf-8?B?VlZrSnZWcjdqemVZZ1NaQm8xVmFIVldxSGcrMitzV25veHhSUGdxUWhqVktH?=
 =?utf-8?B?TmNmNGNQdDFTU0hLZnpma3c2em9ZRUR0QjJlNjFpeHBha2hLY2pkcGt4MFRp?=
 =?utf-8?B?cm1teFEyK2NLdHAxRW8wVVdLV0VjVGJaQWZhend6aEdoSUd5bm9MWEc3RGFV?=
 =?utf-8?B?RlNacy80dk9CNzhwaTJJclBlRDBJUkc5ZE5CVE5iM3NTY0NTTm81QnpDV3p3?=
 =?utf-8?Q?uS8DG0F1TxsjLN7SFFGd/DHl3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77ede8b-10b5-4445-2110-08dbaeaef16c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:57:40.2244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78daT/jdFoSjz6E1hTFfn3aQ6RC8NaJ6ajjm38fv0wTMW+TEOveYj8la1603q4IsCDLpyu13CmydPGi2CitV7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7090

On 06.09.2023 09:32, Michal Orzel wrote:
> 
> 
> On 06/09/2023 08:55, Jan Beulich wrote:
>>
>>
>> On 06.09.2023 03:16, Vikram Garhwal wrote:
>>> --- a/tools/xl/xl_vmcontrol.c
>>> +++ b/tools/xl/xl_vmcontrol.c
>>> @@ -1265,6 +1265,58 @@ int main_create(int argc, char **argv)
>>>      return 0;
>>>  }
>>>
>>> +int main_dt_overlay(int argc, char **argv)
>>> +{
>>> +    const char *overlay_ops = NULL;
>>> +    const char *overlay_config_file = NULL;
>>> +    void *overlay_dtb = NULL;
>>> +    int rc;
>>> +    uint8_t op;
>>> +    int overlay_dtb_size = 0;
>>> +    const int overlay_add_op = 1;
>>> +    const int overlay_remove_op = 2;
>>> +
>>> +    if (argc < 2) {
>>> +        help("dt_overlay");
>>> +        return EXIT_FAILURE;
>>> +    }
>>> +
>>> +    overlay_ops = argv[1];
>>> +    overlay_config_file = argv[2];
>>> +
>>> +    if (strcmp(overlay_ops, "add") == 0)
>>> +        op = overlay_add_op;
>>> +    else if (strcmp(overlay_ops, "remove") == 0)
>>> +        op = overlay_remove_op;
>>> +    else {
>>> +        fprintf(stderr, "Invalid dt overlay operation\n");
>>> +        return EXIT_FAILURE;
>>> +    }
>>> +
>>> +    if (overlay_config_file) {
>>> +        rc = libxl_read_file_contents(ctx, overlay_config_file,
>>> +                                      &overlay_dtb, &overlay_dtb_size);
>>> +
>>> +        if (rc) {
>>> +            fprintf(stderr, "failed to read the overlay device tree file %s\n",
>>> +                    overlay_config_file);
>>> +            free(overlay_dtb);
>>> +            return ERROR_FAIL;
>>> +        }
>>> +    } else {
>>> +        fprintf(stderr, "overlay dtbo file not provided\n");
>>> +        return ERROR_FAIL;
>>> +    }
>>> +
>>> +    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
>>
>> Because of this being Arm-only (as validly pointed out by osstest), I expect
>> the entire function here as well as its entry in cmd_table[] want to be
>> Arm-specific, too? Of course it would be nice to not key this to __arm__ /
>> __aarch64__, but to something that would not need touching again if the
>> underlying infrastructure was made available to, say, RISC-V as well. But of
>> course - right now the goal needs to be to address the CI and osstest
>> breakage.
> I agree. I would suggest to guard it with LIBXL_HAVE_DT_OVERLAY which is for now
> only defined for arm32/arm64. This way the code will not need to be modified if other
> arch gain support for the feature.

Ah yes, that ought to work. While there perhaps also replace the conditional
around the declaration of the function in libxl.h. (But of course Anthony
may tell me/us that this isn't the way to go.)

> If you agree, I can send a patch to unbreak CI unless you want to do this.

Please do.

Thanks, Jan

