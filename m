Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7EE5B0403
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401572.643424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuGF-0000ep-GC; Wed, 07 Sep 2022 12:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401572.643424; Wed, 07 Sep 2022 12:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuGF-0000cZ-DR; Wed, 07 Sep 2022 12:34:31 +0000
Received: by outflank-mailman (input) for mailman id 401572;
 Wed, 07 Sep 2022 12:34:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVuGE-0000Zd-HJ
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:34:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80084.outbound.protection.outlook.com [40.107.8.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a809aa6-2ea9-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 14:34:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6329.eurprd04.prod.outlook.com (2603:10a6:10:c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 12:34:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 12:34:27 +0000
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
X-Inumbo-ID: 6a809aa6-2ea9-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLCe7habJrb8QdXj8N6HSUU9MLr7uUlRzeXY+Dyx8pNWhw1svqtoMvnogTsXAlpfdvYhThUT3KL8FJLAwQ1GfiUSQA3nyc9v4GYUTAQ0K014kCiZIYx2YznuspnSq3QK6xW2gVzYwxwn0XVdn0Egu1ZsYpWBbWSBqO9a3Cr7Cry5DnHnWsQ42ax5lZdZAKe6xpdaRVcvXtmOKSZYo0U2M+/ULSR3+uCKH+c4A6254LE8rOqVMi/zrO7B2dYXJu7HsRDB1qMj2BLFHtDNRS16aTF9EdQPLOlagztLrfeHqF03Tu2mzWaM7qoFRFVZv5RlW27v5JhijDk6L2grss6x2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiHQ9mFULkwOLRK7OMpRZAgpherdOO2XDetbhouZLnY=;
 b=JCeLh83EsCKq5Nb+sGpjSsRo/DSWyHEDmgbxbud3yXWBJDyQvxK/iiGKgPJSUDyVwDYvN6VM1lu2rxpwxs6LG5p8kMJ7KeRbqqSFEg/t233BGlHpLvlVQX+T7pOY2YwSCumFufgaWElHB4nOQkB//En3BwcnaV0oQrpET2onTTvCmEzYsS2rreUfVLIgeF8DrXWsQXIHdV66S++m9isodWVCOby5IvDLS/5bP483QfbQdV1IOlcNeEpoGczH5BHceTFNY9EIDygKdUlinOwE1AunDJemYYOwjlMVkWUZDbBnL67vn/rUWQSa3oQKghijlT7LIrbZjKRPhXBSHFM2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiHQ9mFULkwOLRK7OMpRZAgpherdOO2XDetbhouZLnY=;
 b=yA2X/3jz9VeKkbk7L3anRHDYnbpj21BSrq96lPf+5DeuJ86tthycpPHwBJBxJeYWxQmQL9PVDFlgLvbaYZK4nn8vi/0tCXRua4bh1SkBmLCzRtWsmLhA0FhPsSjR8hyJe7b7UwrBS9QbKvjIHYvQDkhPdxYwsdWahsU250dy5qTPGz7nGAHp65eXhCBboCmwZLxD25gzya3PbHft/Ag/MZWN8MibvhsX//KzFqfJvr0fq7fNtk5tSk6Uzh/b100uXyR/2sGz/Vt/kFTg7ltTJHZFtBmnmDtly1nJ01ZFGN92fvw2LDRz2VTDus636dpwKKT8lv0NODdKsEfjrGdfSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19658a68-573f-9d27-ead3-fd0c57dcf68a@suse.com>
Date: Wed, 7 Sep 2022 14:34:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xen: Add macro for version number string
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "leo.yan@linaro.org" <leo.yan@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220907120420.387771-1-leo.yan@linaro.org>
 <4A5E6FC5-1716-4D7E-95EB-83CA6451D88A@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4A5E6FC5-1716-4D7E-95EB-83CA6451D88A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:458::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8fe7b1-5fae-4fb2-973e-08da90cd4dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LSe5G3QX9mXyS3l/uNqnBwtwARTGrAm/z2/CcD5DNzIpUBy52O1EFrJQLY8Qm4Rc66Q6P/px6BemYJlzps8MOJCZu1RV6pnuOY6Ilo+26iFbvgJh65T5dfmLRRHXE/RYpY0qeLC+hC4ktgO+rV9fI3tkM0dzX+gQD+DtAPZxz7uu6k6kiQsQRQ2BD34068rGVwyggXRPmadq8f1v90n/mgMXr9vh9fgKf2oCLXIDzkFC/7Fu4I0UrxmsiZfVSyphsVAsIMByxhxFkiwt6EpDo6uAxRZ6Bz1OISLH47tJkNThuv/saMEXTSNHZnEC5FPPexQFwoO1LGSrZ0yG4qkF5LJUUrQYLEOX5tLje+d5kKUNS30k5xR0OPeHzC7aQKfWJdmT4TP8cz2UE0ZgWXACoINpLdo4tTJoKy/3/D+yWxUgaPxNWcx3glOx+fhrx3h/YAe1FWDE/kZfj27jL3VJ3UJg/r6PeQDRLiORHzKb1dBzTYZHGbQZsC0/I7E/TOY80xLSthSdagHGk+TkvBtpeR/ayvVCPXGxVrYPIQbt7nHEdBF4UlnZZMkspIX4Rfs98HTySpiUcPbleCpE99QhMac1PKpXrptt6JbPzv0Jy5zGAf3NAdVdnkyE9RjViKHYRE8WhVF4YMel3Ybd1VfqEzCPjQBNxwi0kRd+hGOE0HjBuqa3TCfPUpqSkQakz+LcBUyZgA0/Jum0lGXZW1WRQzpQwQtNcyV3IobLwfY8LU3RjqGdDveVNYdU9k9vDlU0Tfc8Lbrr9zbDaA++ExzhRk3EJ0oK60azuqZvz2lX+Ko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(396003)(39860400002)(376002)(316002)(5660300002)(66556008)(110136005)(4326008)(54906003)(66476007)(8676002)(66946007)(36756003)(8936002)(31686004)(2906002)(31696002)(6486002)(6512007)(26005)(41300700001)(478600001)(86362001)(2616005)(186003)(53546011)(6506007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1cyTkRwNFFwNHR4Zkg5MVE5Y1h4N2pjcXRWU25RSkpmazdBQ0Z0QnVoZW95?=
 =?utf-8?B?dVhHaXBRaXBiNmVpMUxjaU1POFVLODcvV0JtUFBwRHJra1k3SG5zNVFWUkhP?=
 =?utf-8?B?R0lDZEJ6c0ZlLzAxRTBXd1BROWxhR0FPWUhzeVpoMERzN0FmK1ZFYU9XbUtC?=
 =?utf-8?B?aWkrNm9GWEhnNWlCTlAyZkhRYngreWw3RFJ3QU5UdDBVamFFL25xRWJ1YWJT?=
 =?utf-8?B?MG1wSW5GRmt1cy95cXJXS3ZwNnhzaVNiT0MxVHhiL1g0RWpZcDFwYmlqYkFw?=
 =?utf-8?B?My9XMlgrbzd2Y3FMcS83bXdVVTNQTkVwU05oeWtIQ3lpV0VObytYaE1mVm00?=
 =?utf-8?B?QUFrNUNVMzVpV2RuRmdXaDhoWlNVTm5iRjZFanhHU3ZJRk9ndDNWR2FmcDF4?=
 =?utf-8?B?dDdsKzlaZTdqMDBBL0IycmN0ck5GM2ZKT2k1aVViSkRpdnQ4ZTFoNE10WkdL?=
 =?utf-8?B?OVd2MWhxNWxtd1ZOQTRMSFRvb1E0YXVLdVg3WGRMMW0vMi9HYnBDTnNMeHlU?=
 =?utf-8?B?bkZrMkR3ZkU3WUJXUHpOSjhTdFpFM2gvYWZHdzJrd05ROVNVdVdKM0pZYmVZ?=
 =?utf-8?B?ekUyWGhXamppMWMxNG91ZWpXV2VaYlhsdmd6OEpmOUE4bTN5VUFNaVFqRDQx?=
 =?utf-8?B?SEt2TmE3cEpSNWVjV3huTmFUamQ5YnBpMTNtbEZ5Zk5BQmxGOUZYTERuQTJz?=
 =?utf-8?B?NkFQSE5NOEJNV2EyVFZFOHYzSk4rZzN0cFZTTDcyQmlMaTlRbGZkRWJrbitB?=
 =?utf-8?B?SEo5Yld4SzRSSlNkN0RvSFV1SHpHS29OMFVIUmpvNkFHM0JyNDZFVmlyUDIr?=
 =?utf-8?B?VVJxUFhieTh4QWFzZmVoNWF6dUJwQjAxYmhpZnRDS0NpTkJXenBOSWRPTGlS?=
 =?utf-8?B?NUtPc3d1VHBWWndDS0FyejdMWXFCU3p5VnE2dy9wTmdja3ZPTFBpU3B3TEdm?=
 =?utf-8?B?dlNTUGllRE9Gd0JCT1ZCRWdYbi82b0FxSlNaM2JBWkFtbWtGNm0ycW9LS2J5?=
 =?utf-8?B?d0lkV1ZxODhYejBvSTFMZTYvbEcyREtsa1ppSmZsbFVWbnFiRVNDckxzemNn?=
 =?utf-8?B?Q3Faa3lXOTQ4Z203SDN4SU1oYlNBcnpaZ3Q4SkxUYnFTVDhvSmFZcC9LZjh0?=
 =?utf-8?B?bjVuT0JiSExKK1hpdXlMNkZqMzcrRy95MWhMOEpibnVjR1hWQmx4MmdZVE1B?=
 =?utf-8?B?OHVmN3hjcTRWNHo1UTIvWjhXN0JUOFQ4bTVGbU1JcjhpNzRwS1NzZWRCZnVJ?=
 =?utf-8?B?VHEwcnJvbytNYWEzZ1AydzQ1bUtIbzlXQjk4WklubkhtRkFSUncxQStESDRW?=
 =?utf-8?B?b29RRkRqcGNORGE1TWtlVVMvUDJETUxhMDlKeWwrR3V5TFZOQyszYURHMm9H?=
 =?utf-8?B?aytydkl3VVQzUCtLb256VUVtVjd6ckdYR2JOYUVHM1JEemQwTXJqRm5BRzR5?=
 =?utf-8?B?QWhoRnBIMkR6YWZQNXV6bndxMmRJTFVKNTk5SmVsczBCRG1ZSjZlRTAzanA5?=
 =?utf-8?B?YUViTm02aG0yOS84b0xvOWNpc1ZYaktaVWxNelgwYnJ6cERPZlFDdlNnNE50?=
 =?utf-8?B?bE9YbTNTWnErZERncDRObnpnOFhoSWg5MytzaE5aMGlsSUJCWUwwM29uaW1K?=
 =?utf-8?B?cFVlbksvMzBrMkNmc0lnT2J5TlJkQTgxcHJJckRMZ3hEdUJUZk5ITFBSTkZl?=
 =?utf-8?B?eTh1ZU9WMGNxSk1iUDZmWkl5WGYwSFdITVRacUlnVE5udlZWTUFtSkdFMGxs?=
 =?utf-8?B?L1hvUVdFNFhCV3FTcWtvTGJKK1UwemxQZFRYaU0ra0hFN3R4bG93MWlvNmRk?=
 =?utf-8?B?UzQ3bHMxWk1Md0NzL3BHamhONG5GRThCNUFxT1VtaTY2KzNoVTZoWG40cjZD?=
 =?utf-8?B?VG5pRUlrcjNMK1M0QWhXRDVFczNWcE1URTBaYlRZU3E4MzZab1RVbzI3b0p2?=
 =?utf-8?B?RmxoVDM3cUc2bFVTSEJzSytMK1gvTytZQXB4QUp5a2Y5ckUzRGpOWGhZUUp0?=
 =?utf-8?B?bGdQZVdMM3hsSXppVnVPRFg2dVFzays3clZCT2lXMFFzdWp1NmdkUnlJa3BN?=
 =?utf-8?B?WE9QLzVKZDNiR3RPcW9ISnB2amVDV2xHcmVINCtYSE1oemROK0JNeTFZQWFP?=
 =?utf-8?Q?C6aJOtbk8mRyHrbIikwKjVMiR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8fe7b1-5fae-4fb2-973e-08da90cd4dcb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 12:34:27.5480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9T2jRwPzweoanHseVqXPB7NwicwkiZgsv3Xf95o4Q8ewt5OJBSibo83nsLnhXpw9JcVvT10dpBt1cCEH6Q+ZXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6329

On 07.09.2022 14:20, Bertrand Marquis wrote:
> Hi Leo,
> 
> Thanks a lot for the quick handling here.
> 
>> On 7 Sep 2022, at 13:04, Leo Yan <leo.yan@linaro.org> wrote:
>>
>> On Arm64 Linux kernel prints log for Xen version number:
>>
>>  Xen XEN_VERSION.XEN_SUBVERSION support found
>>
>> The header file "xen/compile.h" is missed so that XEN_VERSION and
>> XEN_SUBVERSION are not defined, __stringify() wrongly converts them as
>> strings and concatenate to string "XEN_VERSION.XEN_SUBVERSION".
>>
>> This patch introduces a string macro XEN_VERSION_STRING, we can directly
>> use it as version number string, as a result it drops to use of
>> __stringify() to make the code more readable.
>>
>> The change has been tested on Ampere AVA Arm64 platform.
>>
>> Fixes: 5d797ee199b3 ("xen/arm: split domain_build.c")
>> Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Regarding the change suggested by Jan to add spaces, I think it is a
> good idea so if the commiter agrees to do on it on commit please do,
> otherwise we can keep this as is.

If I end up committing this, I'd be happy to add the blanks, and therefore
I'm inclined to say no need for a re-send.

Jan

