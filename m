Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE5E74865B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559251.874077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3WE-0007Lz-5H; Wed, 05 Jul 2023 14:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559251.874077; Wed, 05 Jul 2023 14:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3WE-0007J6-2V; Wed, 05 Jul 2023 14:30:10 +0000
Received: by outflank-mailman (input) for mailman id 559251;
 Wed, 05 Jul 2023 14:30:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qH3WB-0007IA-UT
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:30:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe12::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6faf8839-1b40-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 16:30:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:30:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 14:30:04 +0000
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
X-Inumbo-ID: 6faf8839-1b40-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/xYbC3teToJlrixCqXHnXLtyRIQHTbm2NmWNaVwvoXkYosJMyKMrCdrd2N5tqZaMIBw7zi3gZcB85Lz00gQWE0IJ+ZA1N/I8wa/fNEFJStbHOCnUv7yqpON86m1rUGlaFnTqcdsBEpWqqSSt+61IkFq6lwM1QsMYX1Y7fgWzl1XGHTcZ/Q02DQsfX009v/Tewbxvs/H9ZOB2AEpEzW+Yan12J1MVsULhioMGGr+7nA5f9FGKAPtTWAgWaWbtv1sysNS8CwCfpiyKKZDavrA97r1DXapQuO6NvRCPgN/iOzn/goymosKGbZ8GmW62pQ6nNCMLB/fEdK/XovzMQ9yZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw9h9wWD64siM8OP/lbu56fim0p2aLIeCIgWWeRwyuw=;
 b=PoSBVchfAjt0lMVEUl+E8cSga4wZnSopnixXyr0xyWUinsWz6IswPa2EcAQWkKPqXe5T0dyQQ8ovBMpiewmdWNrVgNuoQyxvUDLm9szY+y2QDfzqWjk6TadTrhy360Ss9VmU4qDxgr8aoZ+qYsMR/zh65oZzuajaZYN7set6HjR4Be7CqLKTtq8pUeVmnnn+BPAkEZIOR304iWLC6daFmQIVRQH+og4iWYzxZyNfDZLLQD71r0jdLxpGlGDhM2/eQjtHLTMU4w9ZT5VMmhth8M3XWTn33vOQiASdwnw1mUQQBUlr8W8+DseZYA7gR2ByBite15aVh5ToSuM00+/HGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xw9h9wWD64siM8OP/lbu56fim0p2aLIeCIgWWeRwyuw=;
 b=DhqL1FOrPDBivlc8UEihpOllrbx8s8uw8W7voDsRNysojYWzt46acm1O71a35iUEX6Rc48YDM4PgI5ArFfmuHa0o+V5cwi7+WH0UeH3SaMhMsciUx9qX+3oyEhK3yEnz8W85cfYmIqASf1YlSFTBBSZvEROgOnmHmKyWQ2Wh69N/WahFDC1LHoDdLet56OLAl39QJil19UR51njaxImyceiZtBdf+mZ0y37JRJhaxoRI9Mb5v8OSfNNcncbPhZ4HDQ5ykP8ALAhpZV+mARyQpP4L/HurMTXdhZqRRmz0nIV2h3MP7Whyq02bjLceWDp3KoW7B7xcOUw4EU1aMOBRtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5d551ed-6523-0ead-9c83-a7fae10eee67@suse.com>
Date: Wed, 5 Jul 2023 16:30:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 4/4] x86/microcode: Disable microcode update handler if
 DIS_MCU_UPDATE is set
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-5-alejandro.vallejo@cloud.com>
 <1c9fe38e-d8aa-21fb-8dbe-4c54385b5a67@suse.com>
 <64a57820.170a0220.9a035.9a30@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64a57820.170a0220.9a035.9a30@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: f0918c21-7159-41b4-b3ee-08db7d6452ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2SfkxbwO8pefyaalXwtS0lROlQWT9+deaIjeRaNhEkT3Er89quMp2Z4oaYql47kc5G0PZEGO5R5QK/meAWeUiGKkLyszUEFLQJZZi8qWQJmdI73ks6eY6NHP1e5BduLb+C5mHJ3YvPIUX7m9KNl/wGRABUwo9/PN0ZLf53QiF9jeD7nbSwuRvmjomGwdD+wSV8x3mo7grEV86uP/7RZAs3yjdztP8yoTfwzj84VL7ag39PTO4+EfW2hZnQGbLmwl/Va9CYGfwjQUsD/FpFMUVuLc0ibVxuLvCP9toYLoev5kZc4J4OzxPp+K86fwoWsbyo31DhYjk4VnK6rUc7iIyEtj27IxYvfPHn7DO3Uxt81qFi8DYp+ZXc+8qADcf6qq9X4CgbthSkfXvfiZKQo5Kxc4wfdTIqnKSgrLkHACuWAFBTOVYX2A5M1g+1+KPeXGD6Ik4y5fRY3atb1dfGZPsUGEQyzkn3qHp2GCyZpybMbD9ElW7/RjrW7tXaBK5D5+tTU0aheOL//Byl0SNU3NgI0TwvhSqWYHv7yCDigfC4hLQe1/lmISAus7Sowas2jKtniC/PWbK9C/xIOZtVdMWtDZio/1KXsEpXH1Z2YILa+RqUA8Zv4Cny5NAOSHoQmhte5sAJrV2KbZhH7UU0yyBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(5660300002)(186003)(31686004)(6506007)(2616005)(2906002)(8936002)(8676002)(26005)(53546011)(41300700001)(6486002)(6916009)(4326008)(83380400001)(66556008)(36756003)(66946007)(316002)(66476007)(54906003)(478600001)(6512007)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFp5aUl3NFc3MzVReUgwSUJMNDlRaUMvbDZ6U2gweklLblhqa0F4Vm1rVmZr?=
 =?utf-8?B?Tkh5NWt1WlNxVlJNUkNjWmh5ZnI2R1BNbkJvSDcrSVN2eWs5cXlpUVpYMDUx?=
 =?utf-8?B?NjFXblh6YlExWkhQdDJCOVo1VEVsNG9lR0swaExXYUxsOGY2cW5YU21hSGZG?=
 =?utf-8?B?Z1JaZytqOUlrNnEyZ1ZtSCtpcWtxa1RBNE0rdERoSmllWmx2d3RBM3BOVmpC?=
 =?utf-8?B?a1RMOFFuVDNyN2RLQmNDSFM1d2V0SFJCRUM5NDFjeFFYUmh0THFCSU04Znpm?=
 =?utf-8?B?MG5XZE5ZTGcrdmZOUEZmSXMwOGhoY1dGeGdqR2J3NHhoc2IxZzJ1dngrbkVz?=
 =?utf-8?B?V0F5SkJmVXVKYkhiWUF5UnlBUjFUK2VMcm5UbGhpWWdwbEViV0MwaCtRV1Zr?=
 =?utf-8?B?c1FOWjJtT2tDR0NNaTRZUmV4Q2tsbnVZZVN1L1Q2T0NQaVc5WGhOd0ZlR3Qw?=
 =?utf-8?B?M0lHREk2azdNb3Q2UEtrMGkzNFlra0ZEbzBUdlF2b1ExREx2VVFwYW55VEsv?=
 =?utf-8?B?ajN5UGVJcDJHZ1hSTXdidEZueFdYTFpmWlpkQWN5UHMwcmRjQVpiVUlmMWlI?=
 =?utf-8?B?ZDhQSWJuQU9CSEFkV2lmTVZKYVIycWxhcHZ3akNQWGY2NFU5Q3NLY2xyeVNX?=
 =?utf-8?B?bzZZanBKeXBhcElodm1idnJlUmE0ZzlVZ2c0RjNDcGVzd0xWLy85MnFhL2NP?=
 =?utf-8?B?Qm5iT0pBVGxmL3RiVVNmNHBuOUhySUpXUk1jN1VOMU5TaWlQYkUraFNUUUgw?=
 =?utf-8?B?NUo1UjdtVG1lSGJMbCtqNENsUEpQakpMNHhKaVI3cXpRM0xhWVo1OHhLamQ2?=
 =?utf-8?B?NHh4SitGM21xNDJGSjBTcjQzQWFkOWMyeXgydFZ0b254ZTVIenlGcFJpVHZp?=
 =?utf-8?B?MHF4MmN0N2hxQWtqODV2YWNuMHVuSUxSUldFZUZGSWc0b2F1c1d1bEdKWldO?=
 =?utf-8?B?Z2tRSDRSL1dEUGE2SmhrVW40VGY1ajZWUFhaUkZjdUVCUE4wdk5LK3lGemJ6?=
 =?utf-8?B?enJRVjFESVcxdXRMVFdORXBuL1RhSnBBc2ZPYXVpaHJWbnYrNU5IS01Qbnl4?=
 =?utf-8?B?aGdCUUFmRU8wd3AyVjliOVM3OVJpL0ZJZzY5b21QWkZRQVpMb1hCUDhiTGsx?=
 =?utf-8?B?bzJaZm9tMW5PVGFCN3FyUFFNMzBEZTlpOW82ancxdzhVaTl3RW12VitlOHVM?=
 =?utf-8?B?bjlDaDJMNlAzWG96RUdhejRPVHUxU3pVRk1BdEpURjl1Nm9CNzhuRnpqUiti?=
 =?utf-8?B?VlJZTEd4VmJQSlNjQXAvYW03YnFTYnFFYldoRUlKdXFMUzhWcEN0b1hSN1FS?=
 =?utf-8?B?VGs4NWhOanlRQjNIUlNXaDNmSHRITXR4TDJkN3Z0VVJzMHo2eVFwZEp0aGJB?=
 =?utf-8?B?UzFvbGtRUkdEc2JVSXR5SmRjSGJ5d2t4amxkTWU1SVcyRVhVVm5ibUJrYk51?=
 =?utf-8?B?dmFGZkxkUUNlbXNBQVpiNWI1aVljTi9yS2tGRkFTWXBLek5TOERNYkUrQU9u?=
 =?utf-8?B?V29oa3M5Q3o2V21IZExTNWNjZ1VtS05MUlNjWHdCa1dSS0NGa0IxeVhSRWRq?=
 =?utf-8?B?dkx6UVF4R0l5VnU0akM5bWp0UjQrUTRKcitRN3NzTHd5UXRiTDl4am5CVXhI?=
 =?utf-8?B?N2gzZGQzeTZnd2FheDFUdUJ0SjQ4MkZXeWRxaFNwTndBdXcyNlcreE1XZ2RN?=
 =?utf-8?B?TnVjdzZIdTZubDVNV1YybzJWZ2NmbFZSOVM3My9uUSt0S21pVEsyY3k5UlQz?=
 =?utf-8?B?UFFBazFyTDBSelNQN0NNWnBpWkxnMHVkMkF6WHNnbWhEeEg4ZkNsR3ZkNVZ6?=
 =?utf-8?B?cmtBV3JmSk5PNlYySGpLclNZSk96RlJkVjU3ZFROdVVNNWthTko2OTh1NmUv?=
 =?utf-8?B?L2phM3ZaWlk4d2I4amJpK3UxaWFVbDFnbFVHOWNNbXhkeWYxWUxhRnoza3c2?=
 =?utf-8?B?bmU4aTQ5RFBHeFU4RXJpd1NQQlhPQjZSMGNYckxicXk1OXJ5NTYxVVpaMTJn?=
 =?utf-8?B?UVpzMDZWTFhBTWdvMlU4NlY1cEtkY2FramdIWVFYNDdNVHJ3MTRGYmkvQXYz?=
 =?utf-8?B?dHl0TmlrdXBPZFlsalZiWFh0R0p4cGV4U2NTdVNnR2REWTFSVHNKVWRPYnI3?=
 =?utf-8?Q?vBhh10z7pDK7IufcPKMbPdecP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0918c21-7159-41b4-b3ee-08db7d6452ce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:30:04.3467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ct3v1jGVQQVxSdkijE5TCNtQ4qhCS37ZIR3uZ6alDd58y7W4XAWybopKVKLVFoxgGT5JymYNAehbpiFn+ODkFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9338

On 05.07.2023 16:03, Alejandro Vallejo wrote:
> On Wed, Jul 05, 2023 at 12:51:47PM +0200, Jan Beulich wrote:
>>> --- a/xen/arch/x86/cpu/microcode/intel.c
>>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>>> @@ -385,6 +385,19 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>>>      return patch;
>>>  }
>>>  
>>> +bool __init intel_can_load_microcode(void)
>>> +{
>>> +    uint64_t mcu_ctrl;
>>> +
>>> +    if ( !cpu_has_mcu_ctrl )
>>> +        return true;
>>> +
>>> +    rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
>>
>> While one would hope that feature bit and MSR access working come in
>> matched pairs, I still wonder whether - just to be on the safe side -
>> the caller wouldn't better avoid calling here when rev == ~0 (and
>> hence we won't try to load ucode anyway). I would envision can_load's
>> initializer to become this_cpu(cpu_sig).rev != ~0, with other logic
>> adjusted as necessary in early_microcode_init().
>>
> We only know about the ucode revision after the collect_cpu_info() call,
> and we can only make that call after the vendor-specific section that sets
> the function pointers up (and calls intel_can_load_microcode()).

Hmm, right, that wasn't quite visible from looking at patch and
current tree, because of what earlier patches in the series do.

> One could imagine turning can_load into a function pointer so that its
> execution is deferred until after the revision check (and skipped
> altogether if `rev==~0`).

Perhaps not worth going this far, and instead stay with what you
have until we know (if ever) that further tweaking is necessary.

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(maybe with an adjustment to the comment, as mentioned in the
earlier reply)

Jan

