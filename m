Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134E7CDDDE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 15:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618586.962404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt6xu-0007oV-8f; Wed, 18 Oct 2023 13:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618586.962404; Wed, 18 Oct 2023 13:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt6xu-0007lc-5q; Wed, 18 Oct 2023 13:52:02 +0000
Received: by outflank-mailman (input) for mailman id 618586;
 Wed, 18 Oct 2023 13:52:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt6xs-0007lW-HS
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 13:52:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81bb4786-6dbd-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 15:51:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Wed, 18 Oct
 2023 13:51:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 13:51:56 +0000
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
X-Inumbo-ID: 81bb4786-6dbd-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiJcoeweKB1S8R1gCeLbQmjf1ZjWXcsEHJ37IfnrNcpRKdzyQgI/AIrD5+OKKVZcQGWhD13aZydUwpYOCcpOpwZeV1k2uzYFpDPgbw93yBn8DeYgwNPiJWQu8avyZp6vEWm0ikGUsml/iELrgm2YAGAIuQ6ZPziW8RzsBVXRB998VDGvrzeZH30h+mcTwOqjkl6eHnQ16Am1aYEnOuJvkAGKSSrv8HNk7QMklFWfLqytjn+YKMeFiZzyvFtBplG97Fp5FXomjRvgh9vsrmoAEIE4xRUIkehpVxGMAIO3zhqiJwhyVdbqD6zbmISSOvHOoClscDaWAciuBnT2uErdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkNEBhG7rcEnDVwA1niXvg2PwbH6SuF1n2O2ilgP6HU=;
 b=bBj3Oih2ap+WnM3+6UN83U1W/U1PkHL3jiordLH6r+dWYb36xuzvEwygxXPhnrgdrn/zJqKufEnCkpfqhpo83m5KsumQAG59jUx5aEyCu3iwdVS1/KXZYLrWL/8AfinTCl6fBx2gkQzIWVbxouQolMxrKDMjUT8vd6zp2pPxn8jYAW99P2+fFey3kZIv07cdN5C6i0aFZVfAbLEUxlh9zOJHeOLQQ3962wPSRaN01TaRI6Riz4hmRenw8bFV6OcnG+qyS4Z5qUhW72/R4cXWomb2AFCimAzjtX1huDIohfuW825ltaaaCaLFv2iUVa+KWwGtmK/vIsAttNrw3IUT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkNEBhG7rcEnDVwA1niXvg2PwbH6SuF1n2O2ilgP6HU=;
 b=qmPrnbTrrYe5DQmh8QC9ce4/Qoa6WaPfdH2fHUwsQ7XnWKYO4gMto9R2b7uMG6yLckHgyVhUkdqx6VS0+mWOpcFap3FQSi2fhNgdAu40RTYZY/l+83b8w7GKdBc+VEOZE5RCLENa/Xmqhd6iFdZXztwVV42774JYIWLGMWUVrs/4LCCrh/+RsWJ+ST4DYK8z9pwFoPd24e4VBHN+wnalf2Em8J22sBPFw202/Ae9SXGogaj/+IQN4I1msGrTCoMoyzwcmtsloAotNiHpSUjzSLTzGcUZlo1kYqOhBHwhfnG2WxmufWiGDcFW/iDvyXSR1ge5BDo0O/JvaZWpaNI0FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc203e52-73a8-bc23-6106-15c925c80bc8@suse.com>
Date: Wed, 18 Oct 2023 15:51:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Xen 4.18 pvshim console issue (with patch)
Content-Language: en-US
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
 <c86df0f1-c89c-4702-9b12-c0faf61b2de9@citrix.com>
 <ZS-_lcYqqDgEZdFi@mail.soc.lip6.fr>
 <b4f888eb-f49c-c77e-93ea-6d41041d39e5@suse.com>
 <ZS_fZg7AkBItN8fM@mail.soc.lip6.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZS_fZg7AkBItN8fM@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: e78b12d7-d75b-4a99-8073-08dbcfe16498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vsHAx/jLB45Vh428t+eN8N59k0CM4ABXBY2oCbjsWknBAllgVW1nv3FKvhFQV4F7jqCVCjV+AOOrNHWEcOflUovqx5JykrAzFct1dm8mmA4H4ZX5+9eh1d7m3noYdLbWpcldFNCUUNHYDvZLvOYAtIPlfNn/Nb+33OP93+mwlxiLLSA5Fs7oNJD/tWzhLpTTNYb39haullhi0opntXQgOud8ScBWxWwUoukXkbQS52rZ9SWXHnHmaq+LQbO8oJOsnIcrKAQOblRcEfBpavXJN0tlr/gl+hoQzv0FGR8Nr8ZwTNB2te2is3NGqVLE0mjjWjvavHskS43BbnToJkQ9HQlllS2KdNxuoLsSHp9coQBwrChz5LNxM4h9jLdTmGpjY/pihoAbu54eUonUKy0s0GDTmWx9RVPtmfTiL9VjrZHTaWdG93E0SPzhXC29XjnrOFGrAQ1/a6Xmh0O11yr/37z0fgUUH6aFD+2gA2beq+Yv9NCyM7KOxV2fW84lisQyjP+RLcH9YH6/COwcI97E+VrwnxOT17203iEBVVJG+zjnmu+EcDDILxsaspQ/11U2i5OpHRiazxJFpTJIrHfxMvCIypYAQSqmYYQE8fbm4yq12F6Ae7YzM+R/GCyMpnXNyhx0yo1OCFlTeoTiDIuNnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(346002)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(2616005)(53546011)(6506007)(478600001)(6512007)(83380400001)(4326008)(2906002)(8936002)(54906003)(6486002)(66556008)(66946007)(66476007)(8676002)(41300700001)(316002)(6916009)(5660300002)(38100700002)(36756003)(86362001)(31696002)(31686004)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1hqM09Uc2lGUlBwSTdVUm1rTFM0MjFFOXhJY1IwMTRjRHAyelM2ZmFuZG53?=
 =?utf-8?B?ZnhhWHVHTVN3ZUs4cGpzWjN5SVBPUEU0K3FMOThDbURBWnRpYnhTMlUzYW05?=
 =?utf-8?B?MnE2dHFhTDF1ZVdpcFB0SlVtelgwTzFQWms1cS9mL25UbkVHdTFrU0JUV0U3?=
 =?utf-8?B?QS9tU2h4RXN3YjhxUXJyRU02L0xqeUJVUDM4Vnh5WEdOZThvb09WUXlncStk?=
 =?utf-8?B?Q1A5bmxPNWlXeUdoaE1RVWRabVpEVnZGbnJoTnBVWkFmSlhwL3dUa3pyekE0?=
 =?utf-8?B?T2hBM05zWTgrL29HWnYwU2NobEt0ZkpBeEJPdkxxWXAwR2NoWVFDTU03c0lh?=
 =?utf-8?B?QVZJbDBFRFJiR0xpVXlzbEY0RWFxY3pubTBlTlZGVUVmTjBBMVMrQzVORHN3?=
 =?utf-8?B?SE1kdmY0UlBiUUpVOTlpNFUwYkhiaHdSdzRqdWFwTUVlZ1I0cVhwZTUwK3lt?=
 =?utf-8?B?cHI1aTdKSDY0b0hNWDBhdzBpLzVIWEF1eWFCdktjSkxlUmtLUjZ4aUdWREth?=
 =?utf-8?B?Q2R0TUVUYTEvVzJkTGdOeThMbEp6YWUrZ0VDejBwclUyRnFLVUQ5SjR1Y1RT?=
 =?utf-8?B?Rk83dThQbHhaR21hN0pMK2EvVUNwSmxUa1pjNUVhcFRhUnQwdGxVaDhBUlU1?=
 =?utf-8?B?OFBjUXdWUlJMNCthMExEeE1ZekQ1ekUyaWUvbHN4aUhCY3NLQXdGa09kNVhz?=
 =?utf-8?B?V1FaMkNHeTNXTDFBdkJXNDBqeVFRNmo4NzBLYTFyRCtmeVFQaG5aM242U0VQ?=
 =?utf-8?B?elB2YW1YdGJseERiQW5HWFAwTmZhMjNlSmR5TFpXaHpGbFpycXpmVWNHYTVB?=
 =?utf-8?B?MGtiUkNERzNqWmVadDM2ZE42TEQxOXN6STVBUjhhMlR1RTk3aDdxUnNhOFlQ?=
 =?utf-8?B?eS9qTzQwSE5kK3NXcE1sUXkwSkJyUnNyWmt6ejI5WFJLclhqUG9zNzJrWCt2?=
 =?utf-8?B?NHh1b216MktUeWJpSzVtUTBFUFZ4aUh5cUh4MVpvcE1FUjRtNkRpSnZGYytT?=
 =?utf-8?B?L25JSC9ldFFhOTB2SlpMVXFXZVQza0JmWmYzeDhXclhvUGRrTE1IZHZtWWpI?=
 =?utf-8?B?dzFuYnczMTV5dHZCNFJBWjhNN0FTOVJveER1QlQrYW5vSmtSRjFnb0ZVeGow?=
 =?utf-8?B?SUx1d0JBWGgwMEpUWjYreVpyUit3M2FvWlVnUERUdGZoYzRhOXFhNitmLzBV?=
 =?utf-8?B?dVRLY29aZ3lmQ3JPMnVDRUhnL1hrNytTNU5zL1prWWNQQUJVbGxIMlh3YmpC?=
 =?utf-8?B?cTVBbFlhK0J4SzljNDJ1WG5IWTY2YUY5d2VhakRRTGNTamY5WlBGR09iWmVR?=
 =?utf-8?B?RHRyRUdwLzVVU0dCTDJ5NkVGcXpKL0FIRkp0VHdSK0psV01JdUVPMk8wOEp6?=
 =?utf-8?B?WGUwREZRTzZUWGVZQVJPMUtEcGtISGYvSFhZV0FidS9sRTlyTTNHNXpmczAr?=
 =?utf-8?B?ajZSRmhwYy9ZNU5hMTg5TW1tL3MwV3NsYkdGMnkyM205dDhSNUtQVGZ5aUpo?=
 =?utf-8?B?dUtoZE13ekdGeHc1U3B4cVEwL2lIVVFMcWE2eUhld29HUG1TMzQwS3BNNDFh?=
 =?utf-8?B?dU1zTndtdGFtRjFGYnhhLzRKU3BqSGp5UHB0SUo1S3VlRmJtSTBIZ1NSV05C?=
 =?utf-8?B?TjBIVk05OXNJME1PUnVtU00xb0N5WmNNcS9LZGp4cmN5TE1Rbmpzc1Z0cmhS?=
 =?utf-8?B?ZWd4dmpyZTd6SVFRbDZSRWhpd3duYXBJWUJyWmZPbWlqaEJFcVJkUnlXNnpy?=
 =?utf-8?B?QjFQRXEwUGRwaWlIYkk5YWVmRzl4RFBJWlVNeWxIbU9Ec3VMbmVNRkNnVmJo?=
 =?utf-8?B?N0JxRkMrM055MUhhYmZwWXdTOVJZQjZVbVpNTWdTQjU3eldMS1FQUlBnaGkv?=
 =?utf-8?B?STUxTUVBSnU3U25saWRqSTRzTS80S2Q4Wnppck1xWTVxYTgvSVlsSkE1NkFF?=
 =?utf-8?B?TEVrNTM5TG9OVmNOUmwvZklQR3luR3h3K2dWVjB6UExUeFNjTkQ5RjFqaDBa?=
 =?utf-8?B?M2dxTHYyVm9td1A0STdkbnloWXpjYzkydmZVTDRyVjVlZ2xKTUtEZUl0NFF0?=
 =?utf-8?B?K1BZV2k2cCtFVDBOVHZDRVo4RFhOaGlhK1F3M2ZyTmpqZGNQWEhUcm1qWmZk?=
 =?utf-8?Q?pR7LgZm/ABLkdAzNn198VHQ8e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e78b12d7-d75b-4a99-8073-08dbcfe16498
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 13:51:56.6862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlF5y62+1xwxe3CIwyj6gwE1ODg8p/lfiGy8iTf6Q8mH8o9h1cZtSSDCd3ikFCamCTJom6U6joTdvn6YY0G4pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7874

On 18.10.2023 15:36, Manuel Bouyer wrote:
> On Wed, Oct 18, 2023 at 03:24:22PM +0200, Jan Beulich wrote:
>> On 18.10.2023 13:20, Manuel Bouyer wrote:
>>> On Wed, Oct 18, 2023 at 11:44:22AM +0100, Andrew Cooper wrote:
>>>> On 18/10/2023 11:38 am, Manuel Bouyer wrote:
>>>>> Hello,
>>>>> With Xen 4.18, a PV domain running under pvshim doesn't get console input.
>>>>> This is because the domain id in pvshim isn't 0 (and on x86 max_init_domid is
>>>>> hardwired to 0), so console_input_domain() will never select that domain
>>>>> as input.
>>>>>
>>>>> The attached patch fixes it by translating 0 to the real domain id for
>>>>> pvshim, but there may be a better way to do this.
>>>>>
>>>>
>>>> Thankyou for the report.
>>>>
>>>> First, CC'ing Henry as 4.18 release manager.
>>>>
>>>> There have been changes in how this works recently in 4.18, notably c/s
>>>> c2581c58bec96.
>>>
>>> Yes, it looks like this one introduced the problem.
>>> Before this, we would switch console_rx to 1 without checking if
>>> domain (console_rx - 1) exists, and console_rx == 1 is a special case
>>> in __serial_rx()
>>>
>>>>
>>>> However, it's not obvious whether this worked in 4.17 or not.  i.e.
>>>> whether it's a regression in 4.18, or whether it's been broken since PV
>>>> Shim was introduced.
>>>
>>> I don't know for 4.16 or 4.17 but I can tell that it's working in 4.15
>>
>> >From looking at the code, it doesn't look like it would: There
>> switch_serial_input() toggles console_rx between 0 and 1 afaict, and
>> console_input_domain() handles value 0 as "Xen" (like in 4.18), while
>> otherwise it calls rcu_lock_domain_by_id(console_rx - 1) (i.e. trying
>> to get hold of Dom0's domain structure, not Dom1's).
> 
> Well, I have a 4.15.5 installation in production and I can tell you that
> with PV+PVSHIM, the console is working, for sure.
> 
> AFAIK console_input_domain() is called only on ARM, from
> vpl011_write_data_xen(). It's never called for x86.

Oh, indeed. I took your patch touching the function as meaning it's used
on x86. This then means my earlier suggestion won't work, as we need
console_rx to have the value 1 for input to be accepted from Dom1. Which
in turn means your change to switch_serial_input(), suitably cleaned up,
is then likely the best we can do, despite me not really liking the shim
special casing.

As to cleaning up - besides the build, indentation, and style issues I
think you want to drop the "&& pv_shim" part of the condition (as
get_initial_domain_id() takes care of that already), and ideally you'd
also move the new "domid" variable into the more narrow scope. If you
don't feel like providing a proper (updated) patch, I'm happy to take
over, but to retain indication of your initial work I'd need you to
permit me to add your S-o-b (alongside mine).

Jan

