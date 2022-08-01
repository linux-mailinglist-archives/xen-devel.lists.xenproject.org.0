Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346758667D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 10:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378578.611822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQzq-0000Z8-LK; Mon, 01 Aug 2022 08:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378578.611822; Mon, 01 Aug 2022 08:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQzq-0000Wp-Ib; Mon, 01 Aug 2022 08:41:54 +0000
Received: by outflank-mailman (input) for mailman id 378578;
 Mon, 01 Aug 2022 08:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIQzo-0000WQ-EA
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 08:41:52 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50070.outbound.protection.outlook.com [40.107.5.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c96dd485-1175-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 10:41:51 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB4079.eurprd04.prod.outlook.com (2603:10a6:803:48::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Mon, 1 Aug
 2022 08:41:47 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a%4]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 08:41:46 +0000
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
X-Inumbo-ID: c96dd485-1175-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ybv4tRi6V8ARLWCglPLJaiLv6BETxkuLf9At/kOK2+rPkVp18xfljwq0cIXcU/RpCV5nBzZinvZoHatgQZin9y+Vyz2v+1XzUn8ADzhQJaPDgH2NczIbV25jFFq8TsHDfBwfW069fYHQ79q+TizLN8qTqC7F8EnjOdRBG0mQPN+hIR8cRxLE6WjbTvicXFoyeU3sMHTqlO4UGWhppaUcjVUFPeCW+TCzUtQMSa6a9l7xQ04HGZnk3u1FmBqsbCtAoA9aTlv+nzU7Q9Q+yUUWa607XzHXt3zfKkbB3twDdWgwdzrYNl2IDHqcIEgD/fMOciJ4dsAAKpnsH7JhF4IlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqgKCYljuqimkIK/KZKu2ZAsOfEoC4UdLFlgBJ4AZ/w=;
 b=fuQ30MwGkW7QNj+PvVyFa5+nQ25hteF9r+QZHXpeCAgwAtINYjPh4N1DK77PIsXOtnNrLD4mYuR7o496PJgV9mIpmXmAEqLmq4RmMRNx1uQu5drnc7+N6/0pkeb9cM37eMXR4idU55vIjg4JEv8pfoG7hKceoBrpyXD5cCLAj34mu9zvAgOdmzpcZFO9eHDaDEtt0N4e07CjUVD/2o0Xm9w9PxX/MZkpV+MUxLgqMhrPRdn7zeMs8wbBGlYJxKdxcDpgl21D/MhURJZGeg99iwWbeWAS3iir0FDnVU9Wr8O2laGHU0n8M2C2Pn59JAWwPx3V4Gsr7XkzHBi0r1CZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqgKCYljuqimkIK/KZKu2ZAsOfEoC4UdLFlgBJ4AZ/w=;
 b=RYW5HE4fioKxEB/1EA9uVX95ALEQk8qFPejz/SgSd/1REE7kulZ0r7U7Ns+zuePpyO4hh5k2W+OUwkri6VNayXAVd2YBRTAf/SD7W2eV+o581z6n4po9YaUQd1hRc7om+kpoy/UDrr1Z+yHvqd5hkRh3TVUcr1kgEwC3nwijEr88XVWKhoLayfDQyuQ8FySK/WFvrUJIW2XbTFRwHLewLMHnM5juTYNlJLdaXF+E5wg6JU4es/vNkk4eFl0PaWbd5UWJPot/6W3/MPFmwXpt2cZ2zgUvDBfh2MlYfaNn8Zma5AzEUKOfV6fcquSb/WBG8Evxsim5A8XNfoJjarODOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <389cd355-908f-cb5e-0fb3-38d76a42e4e7@suse.com>
Date: Mon, 1 Aug 2022 10:41:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: cpupool / credit2 misuse of xfree() (was: Re: [BUG] Xen causes a
 host hang by using xen-hptool cpu-offline)
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, "Gao, Ruifeng" <ruifeng.gao@intel.com>
References: <BL1PR11MB546193E001A425E0B9B7848EEC979@BL1PR11MB5461.namprd11.prod.outlook.com>
 <bfba43a2-951c-4770-7bb9-3559f1bc69d2@suse.com>
 <ac3b6d9a-ab63-6d09-e9f1-2f6391c4aa0c@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ac3b6d9a-ab63-6d09-e9f1-2f6391c4aa0c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4abcb098-6267-4c11-8a04-08da7399ab51
X-MS-TrafficTypeDiagnostic: VI1PR04MB4079:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	koGE+mx7z0a+e4dk8nQJArk5+rm/3gq3AKFIVcRGkq0YpE0RJFpcDy83op5pndsYdviFwtRIoMOkdFIYNlY7QEU1TP5/rwJlcGQ838Zz2fHCq0pxobvMWHCCN0xlgVXoxDdGjhrI6ok3vZXCWqB4wLt852nHupvwmx5bjTYkHvi6R3IcHQ5r3cfDGGM4l+eLxFJJmtkO/GsIQsnLz89vZZQtdSTQEI1zohTsBxrbUHCw5r7K2qatKWc2hlVaM6dVsEOCxJTNveAQwxJgwxMm/DvGorpDrX+z8QDOhVxbs4a8/Iz4YO6RUbHMpOz6BwOurn4S095DMFTiqj0TFrJY8RB2g20jGvCC9vOtjX05FE0lgt266BHuTBsz0ZZR4X9SV2v+nwU8BipkkpGkjmDv1wsjtZO8W/rY1p8jjf9wdXZSwhOVWiHLMcifWoCSANDf5JdyZk3S81fnZ5bUqHXcNe84PUWzQAqo5Kn28tlWWMdng27wrg+u3rr036+tO6bSg4pRcPub159Rg84sPuVMKe+pGURC3XPgOnZ1YpuSIC48ehuptjiYBwUEDLhP7IEsdMl4xkjBnhDnWSs9/WhxF5DkrPVgsA6IbFCrDips0bXsLKYKXwH/wJNa7XKCwgeOaHuvRNhTAevYpaBh8fWYTTaP85hQXCl/4IUIRznEMZX/LPF5nGy7YaSyciob+81L5SNaZHlY39X9KU6sx/c3lEGhYS8p8DxspLNLjj3DyNKYY391GvP9WBnN2AoxabqkO2k5aI3rJbXOLHK2pMNEwHwOMFgJBFotUjz5ZHQat7gnvJxuPPqi+/DKbYAemlzmmuBvev/SAOW4JWCqkUdgAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(39850400004)(366004)(396003)(2616005)(8936002)(6862004)(83380400001)(186003)(8676002)(4326008)(66476007)(66556008)(66574015)(478600001)(6486002)(5660300002)(66946007)(53546011)(38100700002)(2906002)(6636002)(37006003)(54906003)(31686004)(86362001)(31696002)(316002)(6506007)(36756003)(26005)(41300700001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1ArUVN0MEwzbzVpcTBCRXlzR0RXVTEweGJGUktCUkxNa1RzcVY4TUlhb1Fi?=
 =?utf-8?B?ZzRkQlVFMGtsTVF2TWJUM0prMnZhMTBpWEdNSEFsY2E1Z0VZOTNhNy9FYmp2?=
 =?utf-8?B?dGxBb3ZKdXltRFJsMEhEVXJ3QUVFNWF6U2t3MTVwc25OWXVESGxZR0NhQkJE?=
 =?utf-8?B?NEhYaHhGZlNqaWd4WHBYdklEZzAycmRaYldrT1RMbFhQNkhtUW4xK3AxRjNx?=
 =?utf-8?B?U1V1eWFHUTliWjJ2R1I1TVUxOUdGZjVxZE14Ym03K0F4SnJsS2RNWVN6TmtR?=
 =?utf-8?B?bDlMNi8vRC9yeTlmcGc1YW1vSDZ1dWd2WS93ZGQyRmtlQmt6VXovbjdtZnZO?=
 =?utf-8?B?a244RzdET01EUW52OTJ6ZmxibW5GRUZGSGxIVStlOHp0c3l2dWZSMU0zS2Q1?=
 =?utf-8?B?cnh4bndBaWluRXVhZXhaa2lIWVFJVUYzaWtNSCttN3RhNU5PRGhDNTN3SWxB?=
 =?utf-8?B?Y2IzSXlUcmFYdWpjYUxOSHdkMTVyMlFmZVN1cG44UE5ucngrZVlNSnV4dGVE?=
 =?utf-8?B?eXN2N3pmVDNhbWk4QmhJUGsvRTBUYUlzaHFYVGFmbTFnNDhuSlBiSTZUdFBL?=
 =?utf-8?B?VHdkOGtjOHRoV0E5WWJWRUdJVlBqN2RITmhyOFIrbndWL1NNMk5lUUh2L2la?=
 =?utf-8?B?K1EybUgxRG13QlY0WFlCUExSQ1NDUmxOUnhyOFkzS2J1ZzVoNXVsM3V6a1hQ?=
 =?utf-8?B?ZlU5RWJZU1NGVTQ0ZTdiYU1zcUo0YzBqNHNwNi9jaEVRN3VmSEF5cUNTR0ow?=
 =?utf-8?B?YW5vdFExbU95aHIwQk01bmt3UlFnSmVCUmhUNFZUYjNwNGo3MDJBZzdIUmVr?=
 =?utf-8?B?YmhqK2c3VjRSTHYzdm1wRGo5K2xnYjYvbG55TTRNcFpNWWMyOE1sWE40alk4?=
 =?utf-8?B?WnNya3VnOTJQSVV1bG8wYnpxS25YL2M4aTh5aEJyUWdZM0lDdnI5dHFXV3JE?=
 =?utf-8?B?OFNDajVmYllhMnlQbm1veWlwd0dSUnBHZmNpcnhXb084THE4SGd4U0lRa1Rk?=
 =?utf-8?B?cjlKVTcybXNHcXpFTmJySjU2QWtuUHFmM050bVpuNzBsMnpvWVk5dWxRQzln?=
 =?utf-8?B?MG1HTE4wVW4vY2lDWElack1SdUVJYUtMZ2FUMXl3M1FkTnNpYjZDOEJ4VEdj?=
 =?utf-8?B?eWZjeVhmb05YdUxBVmd2T0hmN0hmVHhZWEZpZjRmYmlJRWhONFAvcDdCbENh?=
 =?utf-8?B?ZkswenhsUjRyamVlZDlsRXlDajNaOWN1NHZXNVUvb2FlSFVlWnBPZnJEbnJi?=
 =?utf-8?B?V081eHdnUFBVYlZ5cDU2L2tybnBNL0YxMm9LVEF0N1UyMGJFbWZzQU5uS2l6?=
 =?utf-8?B?RllnK3duRkcvTllKTDUvNEFQZ3NZcTluZnNWMkh3NzFwcnBFTXNYTUF1Y1l1?=
 =?utf-8?B?QlZ3Nk5kZDlJUHZnekhPeU8yaGt3RmlNdmVJM2IveGl6OWJlRGVDekN2aUZk?=
 =?utf-8?B?K0lrWjRCRnhxSFI0bVFMdUMreDR6cUsrYyt4ZjRBV3RSUTFkcTVuMGpyallZ?=
 =?utf-8?B?SWtUamRpa2w5NUhSemJhYkpFb25CeU5MaVU0aVNjT2I0NU03R3U3Q3JyZ1RO?=
 =?utf-8?B?anVzUWk3Y3VvUVZaOG9lRDdUSTBHTkFycXoyOVpNZEVzUEpSZ2tFRUt1SmVh?=
 =?utf-8?B?dXYvM2dFdDNRNE1EMXhNT0ZieFdmVXhtdndUNk1QemRJbWd2Uy84QUJaMDJk?=
 =?utf-8?B?ay9xdWNnakZaZkM3TnQ4MlNaalpMK004SWNmSDg3M0JOVGk0R2o2cHdXaVlI?=
 =?utf-8?B?VExvOVd0ZDJQcnkxQWZlSWlGTk1XZGtmbEF4ak1UV082SjNrZGlpYVpjS0hX?=
 =?utf-8?B?VWlQTjRXWWNJVEh5WG1rY2w2RUdaaW9zaFlLWVhHVCszQTdpWldWU2p5cG1w?=
 =?utf-8?B?bXUxYS9hdUdDd1pFKzVkLzJQOUF4SWh3MFVjdGpFT2FUaUkyQzFHRHNrU01C?=
 =?utf-8?B?SFZXTlhTRVd1bysrZS94VjBXTVBrOEIxeTZldmJqVEs3SHAvWENCVlVudWM3?=
 =?utf-8?B?eEVHVE53M1lyeWdRYjNpUG9LZVJLS21NODNSQkhQaFR2VEZ1SDNVV2JMVWNq?=
 =?utf-8?B?T292bnptUFVoUUZ4aGtuTWNvblZiZUsxTWNUanhJVC9CZVNacHZYRGJqaHRq?=
 =?utf-8?Q?dqqyYlhDZrM2cVQB8qFwL1dns?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abcb098-6267-4c11-8a04-08da7399ab51
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 08:41:46.8878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gt3Vct6Og5fjuVIUteHfLB9WamSNU7QKDcSI+iUrG2EXi18I/wmPrapAL6kEr/7RU1q3OOjmNCnvPYgt5UyPRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4079

On 01.08.2022 09:38, Juergen Gross wrote:
> On 27.07.22 08:32, Jan Beulich wrote:
>> On 27.07.2022 03:19, Gao, Ruifeng wrote:
>>> Problem Description:
>>> Trying to execute "/usr/local/sbin/xen-hptool cpu-offline <cpuid>", the host will hang immediately.
>>>
>>> Version-Release and System Details:
>>> Platform: Ice Lake Server
>>> Host OS: Red Hat Enterprise Linux 8.3 (Ootpa)
>>> Kernel: 5.19.0-rc6
>>> HW: Intel(R) Xeon(R) Gold 6336Y CPU @ 2.40GHz
>>> Xen Version: 4.17-unstable(ab2977b027-dirty)
>>>
>>> Reproduce Steps:
>>> 1. Boot from Xen and check the information:
>>> [root@icx-2s1 ~]# xl info
>>> host                   : icx-2s1
>>> release                : 5.19.0-rc6
>>> xen_version            : 4.17-unstable
>>> xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
>>> platform_params        : virt_start=0xffff800000000000
>>> xen_changeset          : Thu Jul 14 19:45:36 2022 +0100 git:ab2977b027-dirty
>>> 2. Execute the cpu-offline command, here cpuid is 48 as an example:
>>> [root@icx-2s1 ~]# /usr/local/sbin/xen-hptool cpu-offline 48
>>>
>>> Actual Results:
>>> The host will hang immediately.
>>
>> Well, it crashes (which is an important difference). Also you've hidden
>> the important details (allowing to easily identify what area the issue
>> is in) quite well in the attachment.
>>
>> Jürgen (and possibly George / Dario),
>>
>> this
>>
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d04023be76>] R xfree+0x150/0x1f7
>> (XEN)    [<ffff82d040248795>] F common/sched/credit2.c#csched2_free_udata+0xc/0xe
>> (XEN)    [<ffff82d040259169>] F schedule_cpu_rm+0x38d/0x4b3
>> (XEN)    [<ffff82d0402430ca>] F common/sched/cpupool.c#cpupool_unassign_cpu_finish+0x17e/0x22c
>> (XEN)    [<ffff82d04021d402>] F common/sched/cpupool.c#cpu_callback+0x3fb/0x4dc
>> (XEN)    [<ffff82d040229fc3>] F notifier_call_chain+0x6b/0x96
>> (XEN)    [<ffff82d040204df7>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x33
>> (XEN)    [<ffff82d040204e33>] F common/cpu.c#_take_cpu_down+0x24/0x2b
>> (XEN)    [<ffff82d040204e43>] F common/cpu.c#take_cpu_down+0x9/0x10
>> (XEN)    [<ffff82d040231517>] F common/stop_machine.c#stopmachine_action+0x86/0x96
>> (XEN)    [<ffff82d040231cc5>] F common/tasklet.c#do_tasklet_work+0x72/0xa5
>> (XEN)    [<ffff82d040231f42>] F do_tasklet+0x58/0x8a
>> (XEN)    [<ffff82d040320b60>] F arch/x86/domain.c#idle_loop+0x8d/0xee
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 48:
>> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:704
>> (XEN) ****************************************
>>
>> is pointing at the problem quite clearly. Conceptually I think it
>> has always been wrong to call xfree() from stop-machine context. It
>> just so happened that we got away with that so far, because the CPU
>> being brought down was the only one using respective functions (and
>> hence there was no other risk of locking issues).
>>
>> Question is whether we want to continue building upon this (and
>> hence the involved assertion would need to "learn" to ignore
>> stop-machine context) or whether instead the freeing of the memory
>> here can be deferred, e.g. to be taken care of by the CPU driving
>> the offlining process.
> 
> This is even more complicated.
> 
> I think ASSERT_ALLOC_CONTEXT() will trigger more often, especially
> with core scheduling enabled. In fact I think this is the reason why
> I've seen very rare strange failures with core scheduling when trying
> cpu hotplug operations, as there are even xmalloc() calls in stop
> machine context.
> 
> I'm seeing the following possibilities:
> 
> 1) Pre-allocating the needed data and deferring freeing of no longer
>     needed data when taking a cpu down. Apart form some refactoring
>     in common/sched/cpupool.c and common/sched/core.c this should be
>     doable.
> 
> 2) In case stop_machine() is called for action on only one cpu allow
>     memory allocations and freeing with interrupts off and flush the
>     TLBs locally when enabling interrupts again. This would require
>     rather limited changes, but wouldn't be as clean as the other
>     approach.
> 
> Any preferences? I'd be fine with both variants and could write the
> patches.

I'd prefer 1 over 2, but in the unlikely event that 1 ends up unwieldy
I could live with an extensively commented form of 2.

Jan

