Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC05737D9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 15:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366618.597569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBckR-00066w-GI; Wed, 13 Jul 2022 13:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366618.597569; Wed, 13 Jul 2022 13:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBckR-00063n-CS; Wed, 13 Jul 2022 13:49:51 +0000
Received: by outflank-mailman (input) for mailman id 366618;
 Wed, 13 Jul 2022 13:49:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBckQ-00063d-Lg
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 13:49:50 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20074.outbound.protection.outlook.com [40.107.2.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9a2d51d-02b2-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 15:49:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB3296.eurprd04.prod.outlook.com (2603:10a6:802:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 13:49:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 13:49:47 +0000
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
X-Inumbo-ID: a9a2d51d-02b2-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiU/gbsZiGy8TECf490Y2K0kmGihnR3vtORpQ2h085lCCYriJclyhzIBeUQd53xQVg5sNv2T8vphMx4eerHQ9RkylO98L1eEgJx0gYL322s4cuRtFj7rjtb1cWD1fbrBey+zX7+8qUCAEKOWLBlqw5FPbBmz5cqwcJnWWCbNI5fmeoshUwsGgxXXPQVMaMyAkNR3cXOjFkJ5A2qc6RyBK53kC26c3CwK8cZzx12C7cKNENU/Zm1q6OdZ22ZIAayp7j68Akubn3NICXHI3RTCZaGoUo6XH1SBOkheuneiqlKoSnB2zFUjxzILFrmHHvislE39BVQI0BBJ9eATSxhjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pt6GCQqUndHrZSAZoPpQIvL3exh5ep4oFxyEKMw/vWE=;
 b=DUrIcLtPm251Mm91m9L5mqzFn+9TsW+GBoUHlZ5HQsDh+RXsI1sja8umlNft00DmnZMoO+P2jpLVkfO4nxVSp/7GxnqwZYu77xDo8tjLVCj9wVFMiqT4sKlOew4VqjrOcFCKvEK2UkGrERnNwMNY6rAd5fnVRWj9WPsGj4wg5fnoJl9xKsvwrGAmlhwH5D81JmEQNqCClsfbCFnci2MHQUio22xOW1AQIW/8KCj1pB9EMpQYE6vkJalLJABtrtOh5uCrCSFumlK9uzgyCx9Wl82umROO6Uv0WLFZZfgOCq002Nwax6KzLJoS5337zQcXvc3TURKQNXl6wJYdvBlwDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pt6GCQqUndHrZSAZoPpQIvL3exh5ep4oFxyEKMw/vWE=;
 b=f1iosO5DOeIPAT9x4Yn5CgGvmKVAzthFgHO5Rv/T/nhay4Mi3etU2YAi2O8gNt8EPcYfjnfi2yk5sxcvjqC/lXdKSNOhbeZGRrTdjwkiCiqw/cwuUwwUdsNo2BF2vc/o9KEtiR3blB6rGlkkcMbXPDrlvKwEHrk4dGk3dCxc+w8IL81wvuNSfwaZx9o/3gaAQkdSZyKXLvXQoptcp4igi8/4r3KslSVzJOLoQ9tO7PYyzTmAzjOWLVrYaQXvsDvuEAxN4c6SFA004+g+qtnnyCMs0vTmQUpkHzPFBh64A92D3YwyR+qv3xVwDg7CVdzSUBLpgi8dJjhFZHrI3bGQkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6512f594-e16f-b280-f480-d7b51e32fc74@suse.com>
Date: Wed, 13 Jul 2022 15:49:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/9] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-7-wei.chen@arm.com>
 <357fc6ee-3014-4be9-9bf4-60669a4ca914@suse.com>
 <PAXPR08MB74202A2BA8E612AC355A8D199E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74202A2BA8E612AC355A8D199E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0045.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92c1ce5d-e340-425a-97d9-08da64d68c98
X-MS-TrafficTypeDiagnostic: VI1PR04MB3296:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xNM3gm2hD1qTHek+lfeevukHJ1WHAJaDKYW99DkZMDGX+rKDdbJX1eQEtl4HQ8t/RGA/rj80bNcQfZn/kiaThSTY7B1RSf4rfYbfiKK1yWFsLeo/tStNaq8wroUZ7fnIZIqRyT3i6uazFZhmQe1ZLXo6IlijGHZLMMxmcVOXj3D4iZP+MsUn1/97mj5njVmqexaJxSEuWGbnP26ROMP9vsCYaG0/d27E5QvI3voiGIzy8hNFNeV51QMeYyCSLGWX/uYsj9ytiNEtIviZ1MBqOK5KFKEXXj4qULncAT6x8i44jkZFcGCbCMhl9udWIKHbBIFAI7z+bANKQPhNMkXHEo93auI3N/yRlR3vljJI69p5e7iBY3fk4wjtnK8CtlwazsoaGeXAs6VN9R9Erw0AhbWy3ZK8ymGomd2QxVNxccGgGHFkyhV1cd8YTQ7jjXvDmRpWamLVeZ7gorII7kTWrtoruWxfK2RpC+G5oFys/iEY3EDYi0V+hECB68AhyApiKozqvP8q5XLgai0HnEE7V06prIOK0tbRTFyxugHC+gAUA1rtwXqukEMM+wJ/SIYzrSfe+4qS00XENIyhvtW9KTrW5ABW8YD/eQSU8pQkkIQcXq1TykhDq8HGKmxUqVzyFex1up2gpzAhucVn4/axd557mJOpToX9hvGzuwCWIY+O7Rehak7iIVBh4jlrPRo6feMsR4De/dz2GfAmtCZkBUDFNZGc6f5bcxcXqcU9hlTdRQP/23z9HCQtjfXO+dJpb9zAiBoMigQXyB7X6C6TWB0S9eRvURyKnuM22QrXJWDatGFpkMehlZI5Rdtt9qZv/QeIcpry1N+G9Dr1L53GWXyKJPDt/MCymNxHJBiq+Ew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(346002)(376002)(39860400002)(186003)(83380400001)(2616005)(36756003)(54906003)(66556008)(66946007)(316002)(66476007)(4326008)(8676002)(6862004)(8936002)(6512007)(478600001)(31686004)(41300700001)(53546011)(86362001)(6486002)(26005)(5660300002)(31696002)(2906002)(6506007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0ppK3NhUHVtSFZzeEl3dFc3WitEOFJiVmlsbWM1QTVKVDdwVGpXTlZBV0ls?=
 =?utf-8?B?MDFuNGF0dG13UExxdXZzcS9EUEY1eGlWdFlSemt2NEhvWFBtMythaXlBbUpE?=
 =?utf-8?B?VVVKeFJQQkFXd1l4bW1ySDE3NFVycDdHQVVkL3UwZk5DTG1ISm5Nb1hsdDFW?=
 =?utf-8?B?TWZEalRBaHBWbG11MTJMRmZjd2xkQmZwNVJacmFqNk9INGQ1b1ozclo0d254?=
 =?utf-8?B?NjVNQVZveFdSTmpMVVpkSVNFUHc3MmxFZGIzUDkxcEhibExPa3VlR2o1MTJl?=
 =?utf-8?B?ekdSN01lK3N1eWJLMDRXM0JEWS9MSkg5R250VlNWRHZNTS9vcmQ5NXNtdm5k?=
 =?utf-8?B?VG1sQ1pqbmwrR3JGait5ZnZHc0FLVkZscEJJa0lyeFlRVEhjVTl0YUE2WHg3?=
 =?utf-8?B?S3hjYmNlcnBMeDlLNWFKU0h0Q3MyWDhJK2I4S0MrdUFhMFFhYXpUTHo3Z0Np?=
 =?utf-8?B?WGVIM1NRSmR2b0dBNEpxdlhjUDlWMm1heitwZjZJNWwxNk5qNURVYXByVEpU?=
 =?utf-8?B?TFJqUXMrTVJJOE5nbC9OOEFvYkpzcWdvL00vU0pQU3NnVTkraEh0TktBcm5z?=
 =?utf-8?B?Q3JYRkNEK1VNLzBUcW5aSVhuSCtvWDQ3Y3I4bWNnOVJGZGFIUmxZMGlXTDlJ?=
 =?utf-8?B?MXphQXRBdmYrcDFnQnpta01uRWZSeHFWVjlUbnQ4YTJudXlRbWJoZ25oOHJR?=
 =?utf-8?B?REMrZnhqa1JJYjJKc3BFSmVwMHpMSytLbHRzcHl5Y0NkVjk1bXhQSWdVejlw?=
 =?utf-8?B?Mnh1aGRsaTFtbHNZUnMvQ1FHZkI1Qkk2TFhjbzN0MVZnNEpCcTNZTUhkN3o3?=
 =?utf-8?B?eEZCUzl4VDN1VTdNeEUrcWJiNy9ETXBEeWlORFhHdXBhNlJCd2VYUUhEYkJo?=
 =?utf-8?B?S0Z0cTBvaTIvbnh1eWxNYUNVSVNlWTRmYzg0YVl6bjlObXJqZ0FOMzU1bnlU?=
 =?utf-8?B?OE5VRk5lZWs5SHRwMFJHeDNMU0FoemF4WVlaUkQxdkF1WG5tQ1FSY0ZFbGNj?=
 =?utf-8?B?a1BHamw3WnNwczVMSlhPL0xNd0x3LzUrdW83ZHBqeUc3WmpEU1hPWHhlOVU3?=
 =?utf-8?B?QjJUSXpRRzdLL25qRG8vOGxxckZtSlJmdVRXNjlGSEdoZVluYWtoMmZjcHE5?=
 =?utf-8?B?OE0wRHVjSWxJb0ZLakZSa2JYOTY1V0NGOGVJRElLYkpLOFpTZGUza0ZKSHRk?=
 =?utf-8?B?emlsdTNOVUdoeHRwUGtyOStyOU9ySGNiOXpuYWhJNUZRbGMxT0ROYmJUN3JK?=
 =?utf-8?B?ZTJkd29MekhKV0Y0UDFSZjZoOFBtcDE5WmY3bk5CNWVuNU5nZTZQRFRRTnVK?=
 =?utf-8?B?VjJGZXlDKzF0K3J0czRabHd0R0d4am9CU0dZQTVLTVd6V0pyS29KanRYT2Jq?=
 =?utf-8?B?bDNTcm1TNkFwVzM2c2hzODdkcE1LOXF3U3NuR3dBeVRGdEJmcGF3MENFSHlH?=
 =?utf-8?B?SlVXYXMzTnpJTmsxcjNUd21kWS9zTlNsVXJyeDR4NnpmNWE1TFE0NXBGSkdH?=
 =?utf-8?B?TUVMQXluMGY3M281YlBpRFlROHREaVBkSkZUOEZRdEoxcmpWZUlwazkxMTlZ?=
 =?utf-8?B?ZEZWaXdkMitzcUhHSWdyaVBOWmVDZEErYXVQSVc4UnF0M1p2SGlYMUQrZmlR?=
 =?utf-8?B?UTZMdTlSMVY3VnZrN2tpYXB3NjVvYVRnWU04MmxWNGdwbkMyRndlVGplMUti?=
 =?utf-8?B?bDhkZGJSVzE5MXJ5M3liaXl4RGp4azkzRDFGMTBVTXcrSFdsZE1xYmYrbVkv?=
 =?utf-8?B?M05lWFVUL3BINDViMnpUbVhsZlVYaUNBNjA5OUpzTEUxRTVVSmR5WHRicm9C?=
 =?utf-8?B?aG9qT2E5Q2lOeUs4Um5UejdBUDB0TG1mQi84YVExN2NhZEJERWtOQ0xsL1k5?=
 =?utf-8?B?ckUycklOb1F0TTZmQTZLcFVvNmIrWUdoVkNYcW5jekJrMEhWWUF0OGxtNFFl?=
 =?utf-8?B?alZTUnZxM0MvbTJNVGcxaThQRUI2aVE0RE9KalpjTHB1azhiNW9ScVdRUENx?=
 =?utf-8?B?citsL2x3bytSNGc2VTd2MDVidllicHZRcGhQdEZ6NTNvZVZNdGpZbEtLMzJO?=
 =?utf-8?B?NHZQcDQveForWGxJbEJDQVpiYmFhWUh4NEZlcElLd3NQS0VMbXN6c3BhQXlR?=
 =?utf-8?Q?trRH2Wg5cZzl7Z3dAQxcMvBWx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c1ce5d-e340-425a-97d9-08da64d68c98
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 13:49:47.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZ1Z6mFebcRMM4SQjd0SvIw0LbfzjDQjgoeb9/RIbGIv+j9SZc141H8CnbCsPXBaGxmf+vkp+wXql6iYY+ihoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3296

On 13.07.2022 12:57, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月12日 22:21
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau
>> Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap
>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 6/9] xen/x86: move NUMA scan nodes codes from x86
>> to common
>>
>> On 08.07.2022 16:54, Wei Chen wrote:
>>> x86 has implemented a set of codes to scan NUMA nodes. These
>>> codes will parse NUMA memory and processor information from
>>> ACPI SRAT table. But except some ACPI specific codes, most
>>> of the scan codes like memory blocks validation, node memory
>>> range updates and some sanity check can be reused by other
>>> NUMA implementation.
>>>
>>> So in this patch, we move some variables and related functions
>>> for NUMA memory and processor to common code. At the same time,
>>> numa_set_processor_nodes_parsed has been introduced for ACPI
>>> specific code to update processor parsing results. With this
>>> helper, we can move most of NUMA memory affinity init code from
>>> ACPI. And bad_srat and node_to_pxm functions have been exported
>>> for common code to do architectural fallback and node to proximity
>>> converting.
>>
>> I consider it wrong for generic (ACPI-independent) code to use
>> terms like "srat" or "pxm". This wants abstracting in some way,
>> albeit I have to admit I lack a good idea for a suggestion right
>> now.
>>
> 
> Maybe we can use fw_rsc_table or rsc_table to replace srat, because
> srat is one kind of NUMA resource description table of ACPI?

Is "rsc" meant to stand for "resource"? Would be a somewhat unusual
abbreviation. I could see use using e.g. numa_fw_ as a prefix, as in
e.g. numa_fw_bad() (replacing bad_srat()).

> For PXM, I had tried to keep PXM in x86 ACPI implementation. But the
> cost is that, we have to move some common code to architectural code,
> because some messages use pxm for info, and they have different meanings
> for each platform, we cannot simply remove them.

Well, for functions wanting to emit log messages, suitable abstractions
can likely be made without needing the retain a lot of per-arch code.
E.g. the arch could pass in "PXM" and format strings then would use %s
together with it. Similarly the translation (if any is necessary) could
likely be abstracted by, in the worst case, passing in a function
pointer.

Jan

