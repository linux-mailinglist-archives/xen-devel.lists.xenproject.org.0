Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F43762AF1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 07:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570039.891293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOXLO-00075K-3g; Wed, 26 Jul 2023 05:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570039.891293; Wed, 26 Jul 2023 05:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOXLO-000726-0Q; Wed, 26 Jul 2023 05:45:54 +0000
Received: by outflank-mailman (input) for mailman id 570039;
 Wed, 26 Jul 2023 05:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOXLM-000720-Ac
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 05:45:52 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac1e7dd8-2b77-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 07:45:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9844.eurprd04.prod.outlook.com (2603:10a6:10:4c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 05:45:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 05:45:46 +0000
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
X-Inumbo-ID: ac1e7dd8-2b77-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRX15/tuN08dF3JzQz0ehevupaeLcvzbnDE/qKSjanLQQX0zDCqjG9L1geZYfZUDWUW3UtOX7NhyHQeGQa+xbem8atkvyOfjou8X0cDITNnKKciaRIECiF5adzeAIB1xfTnBKNrrCJW8jGnFPC7FxAoniXnnsimePn9lS/Y0n2YoMa86H695NdxmmSy+Quspb5eY7E5eXJ/ncOSnyJwig7o/Gipd0vlHoLKAvLNlBuTTLO4dC/3hlT2rHDAdpWO5jhYn/DYD9kecBMmvqxjArRi5AguuSYO5+kjz8yhhaKQtqkMN3ZoqUkC0z8ZhyZFD6E02dk21M0vhvCVmgZKXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfTJgB1Z47UjsQD6hvXl+p7JOl1JmNINLAZ7kgUbkUY=;
 b=O+DNvludD8Kyes25c/6R8+7P2gLmFktVInzZZR2mwvTOgav1U4br2ItQnPgzd39OsKiXPvwTwLvGc+MGioTXGUQgFIH73aXGlXXSLmvm1Hwbnz70Ak99EQcn/0C69iGzl0fgIE29phwKVn4mFh8OGNBcVrSRr+qBnG3yUn6RKBbdZdw8W9PYtNpOnAB/+n3hrGKR8JJrk0nANNOPPRJdVCeFhiBJllpUho415X8dqr4XcuRDvp4UtueYeQPaDshw2lbAOth/l/Ur4PsuTkxCUG4hAF8dSxy7MT6TM00SoRutVmZ0DesqA7h0TNFsw3yXBu5a6NnQ6uqPjz13UqvAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfTJgB1Z47UjsQD6hvXl+p7JOl1JmNINLAZ7kgUbkUY=;
 b=vLr6wrmTNKCcW2OFRXoFkYFmuXUn1k4pf2JcxviqpuUfKEz0+8UHxBZ+UIoQvlyoXyMMBAHH+kKpjQR4m0rw1iATYivKiZg5gv8PORHvPD5yqNYBkdKKEJRj3rht2wo5wUKISGB809VFxCOnJHge/bs9qLP5s+EUD1Y0rY/zUzZtaxsC2rfl4Q4Qr2/P3qwhPeI0XqPt3erZqOkW1fB9cOPLDV4YDkznCOwjSu7BDGVaD9KB/+i3lKsA2rD/cPMq+PDs75vmGlzddn8BrY442TQcNUWgBNtYq0voxFOFnfFdb2abEEywBNUp9VbWHZj/7q1SVxnr7iF6/VdkdhX52w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a7742a3-7f94-de37-cab7-ef54ffcef8ac@suse.com>
Date: Wed, 26 Jul 2023 07:45:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] xen/spinlock: mechanically rename parameter name
 'debug'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <87c0f41e43a1c95ef7d8923c77a2072eb9baee96.1690276551.git.nicola.vetrini@bugseng.com>
 <120ed841-5e0f-e27b-9937-5599dc75d84a@suse.com>
 <alpine.DEB.2.22.394.2307251235090.3118466@ubuntu-linux-20-04-desktop>
 <5332da19-a9d8-f9fb-62b3-b1dbdf7982dc@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5332da19-a9d8-f9fb-62b3-b1dbdf7982dc@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9844:EE_
X-MS-Office365-Filtering-Correlation-Id: b38e46bd-4815-4987-8cc3-08db8d9b8f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	03DLNUNLKQ/WX3wc+YrQUQb7hlI1Ve6Px86jr7UaMVb1bpd7BSNN9op1X6Zfr3pJ6vNTCrJgzbWf222H7hruvZKgyJwdrQi4TKh/NY3mGwxDRfjKq3O1rvARBL6Sw9Kb9dAz9m9ZF0eotjOrD3kRz0cjrE+l5TL1c3wj+kPNbBy2KE1yerguUlz9GdysVDPN5RglTRSjwxFpW8F1/IA4GgAqO3QcCephTA82YJcyxOEm0qTP16yjIeJ9abWkjLB7O3THHb50/KG+8JO43sqGZngnoQo1q3AG0stIGUwmoKRQacsVcPcmzq3XDPixuQWh3t9zKixud1HpTypWuAu/ywvEXEWrsNFBqLvqG8txC0AhTDSav0mml3zC5quG1vdm9Fhj2fM4EScET8Dw+sOCzIcua+6NtrEA1PgEag59ashzh3RZp1ZgFWuKNOPnlizO0hV2DEM3FgyCxtkvWpubIBCDB/0CLwi0/8gvpgJYINaQd2AMPPzalnixVy9Jru89M051WoYS7KG9FsFIlTOQRoQnJQUJmvUYqDgl/0WZEOpNUAOrWSVmEbFvp0fLEtGl26tqzf5add+gKTiL3CIp3PRtZeSqnL3PZTDh1IMgn7FLy12UQdV1kiZNGoXjmQSjWq5li/Nd2M8NOyL65yywhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(186003)(26005)(2616005)(6506007)(53546011)(4326008)(83380400001)(66476007)(8676002)(316002)(8936002)(66946007)(66556008)(41300700001)(5660300002)(6512007)(7416002)(6486002)(54906003)(2906002)(478600001)(110136005)(38100700002)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE1rZkI5QlMzNlFYMDB0VWJuQnlVOHIvUnBNZzRnN3NzTjFxTG1TZHdxSkNZ?=
 =?utf-8?B?N0lzTmxIZUFMUE9JSWxBVHBrL3hXaEZ3ejlDQVRGZkZLOXhqOGUyUmsxQXB4?=
 =?utf-8?B?ZUo5UmN6Y2R0NkRCdW53VXBEbFd6UGtYTjNyZXI4L3JVM2RGanZ5WFIrUWNx?=
 =?utf-8?B?S2psRlFjOWgxR2Z5ekxIcktuVkxUTE5mZG52SWJyQmJQemFrYk05K1ZRRkxW?=
 =?utf-8?B?cWJRZDFPdFgzODZLRGdrRVF6c1pvV0k3YkQ4RnJ3ckNoOVZYNzFMMkwzSEIz?=
 =?utf-8?B?WVZkZnZNVm5IY2wxUXdIVi9DY1EvMjNRTlpsUE5pc0huMmtBV1lEV0dtZlp4?=
 =?utf-8?B?V0t4dGgxUjhBSjU3N2d6M05Hdzg1NStaUUNzMU9IUFZaczdQYmovVWtuSWI1?=
 =?utf-8?B?aXR3TEhHMEFXa3djSTJZR1RmVmtMZUJaQVdIL3d0OTFVaW9kWDU1TW54cEhv?=
 =?utf-8?B?dWRDbFFkZUN2a2xKNXRqVGd1eEUyMGkwSUtMazR1RS95NWU1RFY5RW1kNG5J?=
 =?utf-8?B?VTFjazUxM0RrWjU0elo3cTlkd1pPaGIvbGliUEs2T3BOcUhqRUlweWZSNVFN?=
 =?utf-8?B?TzhSRTFVeUsvd2hwRWdZR3ZkdzJwWFhOZ0x5TzNHMUhSeHA4S0RDc0xnWi8v?=
 =?utf-8?B?d2wvdGY0WktUdWJCWS81ZXNNUnFna1BjdWJGWUtEZVd6L2FhV0Q5amx5cEx2?=
 =?utf-8?B?S1ZxNlBwUWNCTEVmMEVtY05meU93QkhEQ2t5ZXpPbklxN000Z2daSkxZelVT?=
 =?utf-8?B?L0ZJdjcvSWErYk1HNVI1REwvU0kxYmJiY1R5eXJBWExtUVdaU1B3SUhFVjFY?=
 =?utf-8?B?U2hqcitGSk9QZ1h0bGlhYTdEeGJORHRhN09sZUdrS0JVSFc3cnY1NWt1OGVq?=
 =?utf-8?B?djZkVUlWUkxaTnRtL3BEdkxDZnoxRXhvS3lFMU00bzJRSk1VbGdTcjQ1RTgv?=
 =?utf-8?B?K3k1bUlzMWVtSTdiZUhyTVN1ZkxjMTkxdlFhOWRJVGlnVlFkWU1ENVp2Mmta?=
 =?utf-8?B?aC9UbXlkL2U2RnVQN1hDRFQrWXNmTUZpTlAza25MNXlwU1hMRHd6QWptY2g5?=
 =?utf-8?B?QndNYkNOQXBMRlRaek5qcUltbkxXVmsvTmFmVXZZcXZ2ejBaSlc1VlhadTds?=
 =?utf-8?B?bHA4L2NzNnlqUHJndWQvOFRjdTB3Uk9WYjVqbXRKYVZ3U25CMndlempVd3hK?=
 =?utf-8?B?YjA3ZWdlRXIxV2ZTYytGK2xacUhhUXVmYytsMTRCQlpjYUV4VFhzTURvZlh6?=
 =?utf-8?B?TUhBTVBYRVlETndxZ3BEZTk1bEtZZDlad0FPYWNremJGWU5zZU15VW40Mk5I?=
 =?utf-8?B?YW5JNzRmZGwwRTNySzc4Ly9pWWhHNGk5ZTB1SEd0ZS9pUnI4dDlnYXNQNXVI?=
 =?utf-8?B?b3plcndIVzNnaUY4emsvQTVoWjhqWUgzSVVVbmRmYi8yM0pzY1JDemxHaWFx?=
 =?utf-8?B?bk4rR3lsSkxIa1MyMjRpc0lvVzJSeExTMWFobDRGOWpLOTcvUjAxa1ZZNkNU?=
 =?utf-8?B?OEdadHhsWEhTTE1kcThMeGxkVFovdWxGeENoR2c1R1NIQVd0M0dkYVQyREpW?=
 =?utf-8?B?ZERVeHRpc3NzY2FkbWl1b0ZCOW1Cakd1L3BHVHR6bW9wU0I3dEcrNDd4WEFt?=
 =?utf-8?B?RmNTN3M4QVgrWmEyaEUwc1RLNGtZNlhOQytBRTlqa2FUL3oxOGExVjYrM254?=
 =?utf-8?B?WHhMdEFab1J2WTF4WjlyV1MxSHU4VGxYSWtBbUgzMk1DK1MzMkdKZ2tkaG9C?=
 =?utf-8?B?TnhMdnpzUXBEQXpIc1JSRS9BeHZBUG1JVi9wRUFOZzN0MkwvUjQ2UlgzWWxp?=
 =?utf-8?B?NUtLSWdaVzNUNlRRZGRnNXJkNU5ZMTFCeC9Ba3luaGpuallVK1pwckNGdlls?=
 =?utf-8?B?Vm5tSVpDL3RkNXlNQzdmTTJUUEdsaDJjSzFCRTFrcGpWZUNjNEZXSFVzd0NN?=
 =?utf-8?B?bEw5bHROcmxuY1RmNmI4ZlhxcldZN2RPMXZFN2pRNDgrOVVlWlRScXRCcGVJ?=
 =?utf-8?B?NWFTT3JnWWowb2tja21wdnlsVmRKRE52NWc3dy9ieGNyeEhqRnpYNk82VGJ2?=
 =?utf-8?B?UUlEWnlJYjlJWFFjQWJzbTJ2dUh6TlZ3cFlUVmFZQXFoYXVPUmQrb2E2TXB4?=
 =?utf-8?Q?W/BUfhHfLcClvpUqaFjKiOu2r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38e46bd-4815-4987-8cc3-08db8d9b8f1d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 05:45:46.5390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijeT6SArPVE67VxfZDuc4bQNsZpSuEy7lavvmE8WmKKPM8rR19l2AE8UakDj8H5SJK5kQdiOfCgCNQzEHfehgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9844

On 25.07.2023 22:28, Nicola Vetrini wrote:
> 
> 
> On 25/07/23 21:37, Stefano Stabellini wrote:
>> On Tue, 25 Jul 2023, Jan Beulich wrote:
>>> On 25.07.2023 11:17, Nicola Vetrini wrote:
>>>> Rule 5.3 has the following headline:
>>>> "An identifier declared in an inner scope shall not hide an
>>>> identifier declared in an outer scope"
>>>>
>>>> To avoid any confusion resulting from the parameter 'debug'
>>>> hiding the homonymous function declared at
>>>> 'xen/arch/x86/include/asm/processor.h:428'
>>>> the rename of parameters s/debug/lkdbg/ is performed.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>> Changes in v2:
>>>> - s/dbg/lkdbg/
>>>
>>> But only in some of the cases. E.g. ...
>>>
>>>> -static void check_barrier(union lock_debug *debug)
>>>> +static void check_barrier(union lock_debug *dbg)
>>>
>>> ... not here (there are a few more).
>>
>> I agree with Jan: these are all union lock_debug parameters, so it would
>> make sense to me to use lkdbg everywhere in this patch.
> 
> Yes, indeed, that's unintentional. Can this be done on commit or should 
> I send a v3?

This wants to be a v3, but I'd suggest to wait a little with this until
we've decided whether to go the alternative route and rename the entry
point symbol that's colliding here. I would prefer this in general, but
even more so if sooner or later we'd rename most of them anyway.

Jan

