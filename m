Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8FA7806F1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 10:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585836.917028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWucx-0004ZB-5z; Fri, 18 Aug 2023 08:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585836.917028; Fri, 18 Aug 2023 08:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWucx-0004XP-1w; Fri, 18 Aug 2023 08:14:39 +0000
Received: by outflank-mailman (input) for mailman id 585836;
 Fri, 18 Aug 2023 08:14:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWucv-0004XJ-TA
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 08:14:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4488e8f7-3d9f-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 10:14:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8068.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 08:14:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 08:14:33 +0000
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
X-Inumbo-ID: 4488e8f7-3d9f-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYS4jZvIoU9IDeZy3I+ipLeq5rFU8RcRzS34R7DG0Y16ygtntARz/JLFwpekQQFVKhHAjHQvxTlq5EgnFIypbja5Gra4R4wcRwy7B+KKQClzRMmuCDvKN31jhk2Y+TgWTP2yW5/bMSPeqf/F3X9/NSnxDXXRyiz5tw8aGY9CoiT1CRP84GiSQVwQ+/m8keCcmXF7LWp3uCX5KDBX/aBc+u1PbInVm6bRhFGIT8ATDKLIaaqlJY+TNrsIzOXws2Kco6A9Hh1erZCWZaKvDuepWV6oiXMLNwuAuZ+xlC6Mq/V7xKMhI/IHn84pzdPOmmqjCxfO6BHkcbprPIaBsfb2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX5yTIMKl0OSHj4hqeC/htkQOguWaynh/od218oFkNk=;
 b=OocsnsmS+a0TbglNP8mWcEZzydG93+52KgreeHCf8fcfIU6W+A9eZPg1XkFZxqxg0quV4Auza5kiqFofBpRM7qV09NyAaP5df+ayv7ZA9VSJmJpb2+bXw77bOvOJh2D//Us/hvwPSkh7sf7d5XrdbQlsq+cKQ3eURv5cCvy7VVmphPdFaw/pzTlglj2/vPCE+ZH9Ioa3y/15JKwvMfFIIJLCS0pdYDBiW/bCPScpN4Ieg6XoBFWvA+KeE1glGDNNy8Jn72FY0CiVI60zSnj9vT0i9VX2b7+680d10DYfxc73xQVs9s+UglczwH3r/XDciHljnKQnhiPQb2CKS7tKKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX5yTIMKl0OSHj4hqeC/htkQOguWaynh/od218oFkNk=;
 b=eHpJp5pLSC362yUhrEHi7e8pnorKRcUhNBnFKyzFWPPCqmB0KMIsU8zfutPJSlNH7I7U9eo2OSMtEC8juPLVUw4fPukw7+R1tGFSBc/SfVYF/6Wwq1uD94jTGW6mFLulYbS52+lfQk8l33htw4k0rXyUhl9hft+M4uCxgh07n7XfyJwYWrX/4A33F17bOx/uQgibMFKXG6HKPOtFyv07FTXR+5q8FopdaMDXt1f68HhkQ/daf8h0t9BjAMK1LFlL9pDRDaXl3TSuwafb1B+z1pu4rztOkj6TZF3AMTrPNExMRfbs81HT1tkri2q2WJDr6kIYMMkOGB2yGcuFNJFEdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58ecfdf4-c0ce-be56-8686-d6fcf06f9609@suse.com>
Date: Fri, 18 Aug 2023 10:14:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-4-julien@xen.org>
 <93ccb2c0-fa2c-3e84-35bf-3d86aef7a2bd@suse.com>
 <2b86f83a-6352-4b43-835b-6c56ad8260ba@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2b86f83a-6352-4b43-835b-6c56ad8260ba@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b32d801-466f-43a7-f57d-08db9fc32778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+2yrflGcGZahfVA83pWQWOG/reP8MiRwCS4kCZtD9DGJjXEFrU0TU2LDjUG2PwHAxD5DwT0IGyHHgpccOarf+O9iZKGywKw+Q80Lh5gQV/iTOn42xj/FoLgzIrlQiW7UHTqoSuMUAhrKkUnZR52gB7a23pBMxZYd8JqD0Qq7Q8bly+RjhcPVfAGIZBaJ6zz29XqJJbM5fPvdnHkEA3zijQ7mbDfcxfn5EX6Ertsx8JwUQVmVGTCo70yk0KB588O+TfofOHoMaL23OMj8NBVFyj036tTfYklY0dn3QJiTEaiRlLCo8+fOC7KdLJxNp6MFujxbSCyisHiFqHV4Jipn3XUd61oDVs8GxzKZSCGqsH1boPRRgPFfO3dGJlw3gKKEcxMV+N1khGgHMzuyW/MNWc7SefDVqmzOod7GjmZhRIHuyoTAo2uOJwylaky6HBiqvMgeSLT2s/F7rUi1fqdGuYkveuVajOGcs6KdtBQ9sE+HBMbBMVi4dhccWP5m8ygIeHbteLcKACR4WlPBHnhmPUvfC2OiKOT+iIl8StKEjIPxWa4RDqO/dDd0+u/4YlgdwDLom7FEPqkqk+Wgzd+GBnehTSkKyivdKjbkKJAiON7GHyZZ7cFo53b8Z9EWmhcrYt1k3BZTm4bLf/2/W9CKqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(376002)(396003)(186009)(1800799009)(451199024)(6486002)(6506007)(38100700002)(6512007)(53546011)(86362001)(31696002)(26005)(83380400001)(36756003)(2616005)(2906002)(54906003)(66946007)(66476007)(66556008)(316002)(6916009)(41300700001)(5660300002)(31686004)(8676002)(4326008)(8936002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1lrcSsrbndBaEZheEQ0d1pTRlIxYkJHVnh4b255VGNjVkFtU25BNUVJdVVI?=
 =?utf-8?B?QlRmZjNJaGcrSXFzQk5jekFFUkpBN3NhTnBIbkJsNmFSUGw2TW5Edk4yT0E0?=
 =?utf-8?B?OVkwRDduTWpSVmRtVEFiMXhQby9wWTRVWm13ZmhQT1pTYVovbitTZWJxM09j?=
 =?utf-8?B?V3JNMVNuOTd0SWlXbUVyTHBibXZXYkdKYURxaS9QR1ZiNVZOWDlUWGxSQjZl?=
 =?utf-8?B?OXF5ejBqYSsvenNsblE1MTIyZ2pBS2EwNjhHUEE1NzBuY0pldDFTMVF0OWZ4?=
 =?utf-8?B?M0xNejBtRjdHZExtKzJjcEtvYTJpc2xkb3ZneEhGR1Bud09VQjkyV3BEdzdN?=
 =?utf-8?B?cUx4ODAyc0d3Si9MSTZlell5NGFpMnBtTEEwdExKWTFXVTdvcEFUY0RkNGpk?=
 =?utf-8?B?cnF3dVRhRU9aVHgrYld3MXNndm1wd0w0d2FCWjQ2THlaZGRwMzZqVzZVWU8y?=
 =?utf-8?B?c0xQQTdVSnhMb2s5dFlndjdKNHhzcGJ3Sk5QenlrdWdWZWU2azhsbWxxVkZz?=
 =?utf-8?B?RlZwZ1hTa0JScXNyTE1lQ2FWSnQwdjZWWFdGazNXc2JnSFprVkhlR3FFVnNN?=
 =?utf-8?B?NndQcFVwMFM4TEZuSSs0K3dpdlpGaXFFK1ZYU3RtM0xEOVpVRzVCWTFIMTdU?=
 =?utf-8?B?S1pSaXllTS9pcWFMa1JjMUlud0pjMk94NXpZS0ZPM3RLSWhybmxsNkVsVkpK?=
 =?utf-8?B?T1kyeW9LTjdhMkZOZWU2bTlsTzdnQXRpTjJSclNoeXc1ZnM4RnRKaEhESGJ6?=
 =?utf-8?B?U25iLzBhRUNpaTJjS2xDWnBoRDgwMnVDQ1g4cjR0dW5GZlZpaDVmeSt5M1pM?=
 =?utf-8?B?RDJ2TS9WNndFQUkrYjZHb0MwV0NacU41OUordzVuKzRyNURoVTlkV0F2VDZ3?=
 =?utf-8?B?SVdDV3dGKzNHdFRKeEd2S3VCRG5ST0xxUXE1b0RBNWVrY3crV0J3M1Y5ZDVa?=
 =?utf-8?B?elV0TEhYM05ldHJoc3RFTGVzS0Exb0pxd3QxdytJeG1mY3I4U3p0WEFJWWs0?=
 =?utf-8?B?K1doYW1oK2JaMjlOVjF1enE5ZGtSSEhCRVJxb2dYMVJxU3VXOHNDK1lhYnRy?=
 =?utf-8?B?Y2Ywbjhvamtpek5nV1BPVnZ2RDNlWGF4SG9DeXNyS25vbS9qS20vV3paZlJO?=
 =?utf-8?B?NzdjRGxKK010VnRHUWRUdzdJWkVTOHpaTU96dm5EYVFZS09zaVc2TXZqdzBB?=
 =?utf-8?B?c2VnakkybE8yaWFHTVF5RlBqemZvZERRR1dTOGtSazJqS3MzZlcwaE5rZzZx?=
 =?utf-8?B?VWdFdGJHRGwzNHRnWEErRUxVa3YwUmM1VkRIWUhrTEVFU3BRa2V4NEZwZ3VO?=
 =?utf-8?B?bXUzMzZRREZ6TjZCYkNNK1FmdFR1eHl5bVh3L2gzeU1tc2FsSlFOSzBRQnhP?=
 =?utf-8?B?d1d4eDlvK2tPdzV6UWJOSk12eGczODRrRlVneTdyY2RveisvK1NkNk51eldL?=
 =?utf-8?B?UC9TRnhTODIrR0RvSlJQQ3V6YTE3L3BoRHl1b1o0Y0VYdEhRbXBGbFphWEE5?=
 =?utf-8?B?WjAxL2RLaDduVEc4YnZubCthSy95WE02TkZkY0JuK054ckl3cWc0QUhLaVV2?=
 =?utf-8?B?SE53YnhWNXZFaXM0RUtIWURWRWNDQi96SEIwdXJid2oraUNoNGxoTnIwa1l0?=
 =?utf-8?B?RXRHcjVrcSt1Z3RBNkdsajNxYkhmSjliajZQemtYdUdIS3hRK2MrSDJ0UVlq?=
 =?utf-8?B?VDR4eEpXZGphSE1wVEJhbW52Q0FMNEFRcTVWZWxjTVpZd3d6TUhtM2F2RS9M?=
 =?utf-8?B?ZEZFQTRtd0tXS0t3T3FabnNXSXh2eTNsVmJLLzZIak9DRWdNM3JuTW1OVjhp?=
 =?utf-8?B?YWtUblJ1Mk5WRVFIR3ZacXk1TmNtdlBPSEdHbzNLcXZVRUptb1Y0NmVOOXNT?=
 =?utf-8?B?d2llY0gwVUFZVTJGOU8zcGlWOE10RnVuSTZNamRrWUNyUndENzh0dmJXS05E?=
 =?utf-8?B?bXB3WGpORmJuNWwyOVdyTmZrV0J6dVlGdUxWbmN5UTdPc0FjanlyYVVWUUVh?=
 =?utf-8?B?dSs0a0pwdk4yOW1vTS9WQi9iY0ROdU5LMkxPVWpRQllHWnVnWXBCbThOSkdn?=
 =?utf-8?B?KzFSbXJlT2lHMTJaREZpR2w4aDNqOHMvbmdFRmtwZ1czdTIrdVNrK2drWDJE?=
 =?utf-8?Q?2LOJI7FbC82jZBsGIdZ/clFcj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b32d801-466f-43a7-f57d-08db9fc32778
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 08:14:33.4746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxT/TsBytk32t6XEw9DjsZhAl9KeL3ywNC4eS2kLAmftGELuJKZb87rBi9qulFfghFDQChXlZdnt44aaOKuMKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8068

On 18.08.2023 09:39, Julien Grall wrote:
> On 18/08/2023 07:33, Jan Beulich wrote:
>> As an aside I wonder why they're here: They look like definitions of
>> processor registers, which aren't under our (Xen's) control.
> 
> I agree they are not under Xen's control. However, they are used by the 
> toolstack and IIRC back then they were not available in any other headers.
> 
> Note that they are only available by the tools and the hypervisor (see 
> #ifdef above).

Yes, I did notice that (or else I would have used stronger wording).

>> I ask in
>> part because the presence of such constants may then be taken as
>> justification to add similar things in new ports. Yet such definitions
>> shouldn't be put here.
> 
>  From my understanding we are using the public headers to provide 
> macros/defines that are used by both the toolstack and the hypervisor. 
> If they are not meant to be exposed to the guest, then they will be 
> protected with "#if defined(__XEN__) || defined(__XEN_TOOLS__)".
> 
> I think we are in a similar situation here. So it is not clear where 
> they should be put if we need to share them between the hypervisor and 
> the toolstack.

On x86 we simply arrange for certain hypervisor headers to be re-usable
from the toolstack. See in particular arch/x86/include/asm/x86-*.h. And
of course everything under include/xen/lib/x86/, but those are our own
definitions, not ones meant to solely express relevant hw spec aspects.

Jan

