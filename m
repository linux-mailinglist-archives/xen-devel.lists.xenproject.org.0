Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5675F5E9B3F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 09:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411450.654389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocivv-0007pQ-8b; Mon, 26 Sep 2022 07:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411450.654389; Mon, 26 Sep 2022 07:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocivv-0007mI-4q; Mon, 26 Sep 2022 07:53:43 +0000
Received: by outflank-mailman (input) for mailman id 411450;
 Mon, 26 Sep 2022 07:53:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocivu-0007mC-0Q
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 07:53:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55df8309-3d70-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 09:53:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7697.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 07:53:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 07:53:39 +0000
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
X-Inumbo-ID: 55df8309-3d70-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJAtT5SoD9oYPQI7n1C2OSnKeR8l2yRpHEKM7xkCQDlktfKy3H5n6OiMFo8FxWos1IzoRX0e7SaiLbYZI+eKEdysE3rOoIkC9KXXfK3Wy3zy/4h2C2jngX6rJyzwKciR58vl4XJIk8faObM1Ra+Tx3yUJHCQm1COZgGJB76u0Fz/Zi4r3voD6+VYJt5uBiKZSs96gmfwBuBEN53sZN17q+G1ky30lXtdJj9f1CdofV54OJmtB2mp5/oNu6pwoVvh0QvrFq8WoHCtMy/rI0NtVXjFiC7YbuWO0HECtKalhtAjDTOZnc1NHvOA0Wbmu043/Gn3y8Wo/yUoiSzSqwVkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k62p6jkfsfC26hBs62SH/S2bFQ0x7b7VQkMJ0Tz02ZU=;
 b=OlnRVNWH2XVMzLdDNGySYQY5Cvuu1ksHOo/AhLdO5BD+aY3M9oMuQkRsDS6wiLN3Tjry/KP0L/NZaGxDfS1P70QysIfAjj4KRSg0S5NOvk3bqMJwvlt4gG24zFreGqMdnBvoBw8TLYlO948mfQ11utoSrAw66bTs122/QvkeP6Juq8NYKwsZdkVREt8sX1wk2Fnw6H27wBrL2C0XKgQkSpKTkCvKiB+3HHhIcPCPH4tuJGZSmbmDOkJi7C6vKKc/eqcWg0r/N70hB3U29VZYt4oxqTSJZRRnY+HBMmlOz48be3lRexdJFHdIvNpf7MZhgtIKm4ssqxewnXgzlUsw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k62p6jkfsfC26hBs62SH/S2bFQ0x7b7VQkMJ0Tz02ZU=;
 b=1KPkJCcyHrNsGlkR25DS89VxLvguNMdD8xi4lybJYgj13IJUSu/fOtY0Kjn9U1O6QQDh9uU9/G74sNXbkq9VTt2jy56dxBXO8ppC+OgsdRtVdX+8+7OvUYSvb7MMcOerwTszv2cH2jMqU3hGftIjHW+qh0lt56V4E7rUWrEk3eY84rfec3mqOVfFH4x/yv1qMm5ZrBmPACVJCUgeEe5C26da6JqtCb/b9VYrj0ElvA/7ZAluCbJqjuT1bMASkvgs7dnP+J8bu59784HZ6Kh9IncDPUxaxRRNj3UtHN8MJRFJu5RPVzSX8nwh9w01B56Kwnk20IC5SIhSI/KLCRFYVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>
Date: Mon, 26 Sep 2022 09:53:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Design session PVH dom0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <YyszY+qHOVkCTe92@mail-itl>
 <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
In-Reply-To: <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e37afc7-6ea2-4ef5-0ea5-08da9f943917
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	woudAyEdQEZzHOK4uy8WLxJtx1zw1C3zJKM1L++oZqr434t/5UQCSYbp7PsK8VTVLtMifRndn/zh4uSvwbHZMkkqNeFw9lmudJNeerPZjOgs8/pM3460SYlV2299xwszB8n2GQ5saklUXEj7Y6ADzG/7jUseYTOpTBQ8cAVbywHcCP4uTXtVg2n5AWyk4LF9i9hK4VMQo997hoC0MjNPAbF6NWLfpESrGg35QmzEgnIJJ3MLfMvpb+pBQ++Tl8S64vh1kpUaFtasyWL887a/W3KUfWkbqjdmoqE7Rhksq03jNTlc2Onusq0UeaY+zn5GbZf2vfX8MhMZ+dNAf/0eKqiPtvL1W8IQ2J4tFRKGv4naVzbwHyHqDeqlCiGzsuClF9wRo5gHzDq6U8f+3IQVSBPPyxamLa2LETmN94Pd9Ok/a/sLwro6lC5pARwxr2Uie51CeO5yO9bjXeB0Wun9V2UR0Ozi+nMKNlPzX2CsNsXPYZOCSkCzL5LcZZjoqMTyJvbwuzDHCgguWmsu69qSU43cP4IL+Gg6o6rzYsKDa76sIvR1QC8CSKNlK+RNJC5FGJYth6ylHZd6qY2Ips/adKsHSs7XWbd2xymWWxYXuYjuSmrwmV1tW+bxPfvJxBMRLbiy/ogi8GGL74ivx1WDujSUqj71vIVa3RP2mxdpWv4teUA3VViPoWsuz9SNl4kX7+VLPoH9UO+oJLaN6Cja2K0vsyhpHonjWMeF4a6AORyz8KyvIVpDKl/uIoD8KBu78FjC3PH13ELLfne/aW/EQtW3qtUmMfnlBTS9rB9u9Xo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199015)(2616005)(66574015)(186003)(38100700002)(86362001)(31696002)(5660300002)(83380400001)(66556008)(66476007)(66946007)(6862004)(4326008)(8676002)(2906002)(41300700001)(26005)(6512007)(6506007)(6666004)(37006003)(54906003)(53546011)(316002)(6636002)(8936002)(478600001)(6486002)(36756003)(66899012)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFJYbVJiVjFTRjlpM2lzeXV3Z0tlNHVYVEtDZ0EybWR3bVcxTDd1ZXo1UDhQ?=
 =?utf-8?B?dzFSV0RpcTdYcDFEWStrNU9LUjZDOXZmTVR1V3lGSnNzbjdIOENGTjREZGly?=
 =?utf-8?B?V3ZPWkNhWG8xL2NXTUR1V1ZnRURxSHBuRklhSnhjV2ZTQlB0WlVZTFZ0c01O?=
 =?utf-8?B?UFd3YUdySXFtdUVHSlI4WlVESHhpSC9wVzdaMlk2bFRsUnh1YjVxOHI0Mm43?=
 =?utf-8?B?Uk5BUW40V0VDMk9ac2lTUmxnaC9ZdzRZUTBBN0pmbThQUmtyOGJka01TNVA3?=
 =?utf-8?B?ampZd1BhVldkS2MwS0ExYVNuSFBIL2d6cHdYaHExd0ppdGc5SHZ3aUZSOHlM?=
 =?utf-8?B?UWkyNWdaQUt5UCtocm5zeHhIalhXYXFETlJ2dDhlNkFpYWV0UXFySU5sVW9v?=
 =?utf-8?B?SGtpWFFVdExWQ1ZLRW5OK3BpME9lU1ptV1hKZTlnSWVQSmpvZVUvb2dtSGZF?=
 =?utf-8?B?ZU1ZR0txbFEwVHJMUnJIWFZGZ1pIM08renJBSFVRRlc3RVdIbUMwYmZuSTZl?=
 =?utf-8?B?ZUhpZWJFYkwyeXY0SXQ3bjlLUzRuZUQrcSt4dXF5QTRzQWtBS3hMend5Ym04?=
 =?utf-8?B?Q09GNHVUZ1NDVHJyNWN6QVlCZWJaRmV2Yjh4dkl3OHJ6QmwydE0zRzhiZ0Zn?=
 =?utf-8?B?UWE0Y29YdFo4LzRkL0ZJSm5ZY21ST0VyNm1hTTk3bXdVNzdUOHd4Mi9CM2VY?=
 =?utf-8?B?bnNVTnVzOUJXb056akg1QWdyVVVhY3dhTlVLamdCUmt3Q29kdngyN1B2ZW1I?=
 =?utf-8?B?a0MyWWRBQWJSOUFVcVpmeU0vOXZVeVl0OEJHZFRpZWNaTUhhUVdxWDg2VGdo?=
 =?utf-8?B?L2pzd3l6TDM3RVpUbklXUGRScFc4SFIwdGdBTk1wdFVnTTZobVpLbWpzNTR2?=
 =?utf-8?B?ZnUyd056V2Qva2NOeFZOM0cyVkFZNEhia0plMDc4ZWVOLzlSOUZkcTNiOWpp?=
 =?utf-8?B?YU05aGduS2tod3NVZTduZmVrVWJ5SVY5eDNVTFNkb3NJYzFjVFRFS0FMVzVO?=
 =?utf-8?B?ajhNbndxcXRtck02T0M0QnBrcTdBcWdsRmppU1QrR2hPYmdCMEJYOFZYcE1x?=
 =?utf-8?B?eGE1UlZsdFZGSG1HS2J1Nk85TFQ0Q0VPaEJjZi9YQXVIZk9qayt6Q3F0SGdu?=
 =?utf-8?B?M3p3Z3Y2OGQzNEdWZ2RVRVBTRkp2OEFoOTlieHVBRnZEZHJmd2Z4ZFJUMndV?=
 =?utf-8?B?SGo2b0lRZGgrVXMwRlJpYmlFbk1hS09FUW1GWmdCWlZBaGRvb0hIYXg0MnRW?=
 =?utf-8?B?R092bDFsRTU1M3M5WUV3OTdnY3hRQ3hCaGZCL3pHZnpUV2thaU0wb0dMWXk4?=
 =?utf-8?B?N3JVQ3hzSmxyRktGcVRNV0lnSmdVZFFpYVYyUHZ3dXpYS2piSGNIRDBTZ1lu?=
 =?utf-8?B?TEY2OUpXbTlrT253NUh1a2t4NlhzcVZ2TG9LVmRJcGhpM0JTMEJETTVhcUZs?=
 =?utf-8?B?cWFURFRWdzZUcVFXY3BaNld2M2VxWnlhTHBkRU8rMTVmTXJkNnZGZnBVQXNP?=
 =?utf-8?B?ZWtkaEtoRlZzdzNqeDM2TDZadmVLTmhvMTlIbDA4SkJZVFVNaFo5WlFSY1o3?=
 =?utf-8?B?QXhSNE1YWHdCSng5bVI4amFzaHJrTzdKUDZIV05FZncvSkhubkMzMHFKcEg0?=
 =?utf-8?B?K1JJejFnMHQ4Y1o5ZzNhM0lCS1AzTy9ndkU5ekhkbDJTUWZBQ1NzeXFWOUNz?=
 =?utf-8?B?RDIxVDg3Nnl4bTNrZSs2bEVkWXE1RC9wNTFEVXdRMEpiS0I0azJCckxRYUJy?=
 =?utf-8?B?Rkg0eFB5bW1qbnNVMnlyWHRiaUxlZHBTSzh4Skx6VmYwcmcrcGFQV1UrMXVR?=
 =?utf-8?B?aFVQdFJZRlRzMGhvYVBkSEVVRkpINHhEMStkdmJldFJSd1lmVDB2ZXlLSkF4?=
 =?utf-8?B?T1hHYzFjV056Z3FuUTlKN1FLWkZkdVphdUFRMnpBOGtwa3ZSZGM3c1Z0YUlx?=
 =?utf-8?B?akNoS2JvT3lLVC80Qm83RExhOXhhNXhTV0pZV2NkekFoZWw4ZUtsTThRazJq?=
 =?utf-8?B?VGYwWDJDcFZMdjhBdG5ISGtSeDVzUUkvNndZZkM3VlpUY245SGtpTTdMc1BP?=
 =?utf-8?B?ZFhacEZTVUgzVElYbHVvMWx6WWFIZXB6MVBJWmo0NjNlNnE0T2FCMnpER0Nw?=
 =?utf-8?Q?E400Cwf35smt5wAhIuqaGaiqw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e37afc7-6ea2-4ef5-0ea5-08da9f943917
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 07:53:38.9228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXcoOcTC5gvVIb3A504voBto3HS4DXlwDJhv/guJhcvpVyf2iobH1JEb1aP6rV7cmXSC71rRSym8UX4wZ2a6cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7697

On 23.09.2022 10:20, Juergen Gross wrote:
> On 21.09.22 17:53, Marek Marczykowski-Górecki wrote:
>> Session description (by Jan):
>> In the course of working on an XSA I had to finally get PVH Dom0 work on at least one of my systems, in a minimal fashion. This had turned up a number of issues, some of which have since remained pending. Therefore I’d like to gain understanding on whether there is any future to this mode of Dom0 operation, and if so when it can be expected to be better than tech preview or even just experimental.
> 
> ...
> 
>> Jürgen: PVH dom0 performance?
>>
>> Roger: it's bad; mostly relevant is qemu interfaces
>>
>> George: only for safety certifications? performance penalty may be okay
>>
>> Jürgen: hypercalls can be improved (virtual buffers?)
> 
> Some more thoughts on this topic: Having hypercall variants with physically
> addressed buffers will help, but there is an additional complexity: what
> about hypercalls with really large buffers (e.g. the bitmap for modified
> pages for guest migration). In order to avoid having to allocate huge
> physically contiguous buffers for those purposes we'd probably need
> something like scatter/gather lists for hypercall buffers.

Not sure. I'd rather see us add new (sub)hypercalls for such non-standard
cases. E.g. the bitmap example you give would be amended by a new flavor
having the caller pass in an array of GFNs (perhaps, as you say, with
further indirection to deal with that array also growing large). I'd
really like to keep the common case simple.

> And those might
> want to be supported in a generic way. Additionally: what if such a SG-list
> would exceed the size of a page? The dirty bitmap of a guest with 64 GB of
> RAM would already need 512 pages, so the SG-list for that bitmap would already
> fill a complete page assuming only 8 byte for one SG-entry (which would limit
> the general usability already).
> 
> My favorite solution would be some kind of buffer address qualifier for each
> buffer (e.g. virtual, physical, SG-list, maybe nested SG-list). So the new
> hypercalls would not mean "physical buffer addresses", but "qualified buffer
> addresses". By requiring a minimum of 4-byte alignment for each buffer (can we
> do that, at least for the new hypercalls?) this would leave the 2 lowest bits
> of a buffer address for the new qualifier. If by any means an unaligned buffer
> is needed sometimes, it could still be achieved via a single-entry SG-list.

While this might be an option, I'm not sure I'd be really happy with such
re-use of the low address bits, nor with the implied further restriction
on buffer alignment (most struct-s we use are 4-byte aligned at least,
but I don't think it's all of them, plus we also have guest handles to
e.g. arrays of char).

Jan

