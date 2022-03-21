Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE24E2B62
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 15:59:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293041.497735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWJUY-0008Ho-Hr; Mon, 21 Mar 2022 14:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293041.497735; Mon, 21 Mar 2022 14:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWJUY-0008FX-Du; Mon, 21 Mar 2022 14:58:42 +0000
Received: by outflank-mailman (input) for mailman id 293041;
 Mon, 21 Mar 2022 14:58:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWJUW-0008FR-Dk
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 14:58:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62aa1dd4-a927-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 15:58:37 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-578Lj---OZGoLRsBGWQU3Q-1; Mon, 21 Mar 2022 15:58:35 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0401MB2604.eurprd04.prod.outlook.com (2603:10a6:3:83::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 14:58:33 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 14:58:33 +0000
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
X-Inumbo-ID: 62aa1dd4-a927-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647874716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9r+U0XApU4WbDqM9gwZ0V+Z3ubX3aUJQu9n9vtYWtgs=;
	b=JZQOvAG4ivjHtPmzxp78QXHMpqppk2d1QzJ1SlG+DYlmGDA3KWz/J2h5CVFAUCC3zHfjsg
	zCe/WZowmXSmlbISkifQTCFux/goQ0DF7wtUOzUtH48TyEAMPCXdJUpbaO3EgiAM87w0cp
	V8FNV5jx9XqtZ6y4o8BWwefzkfbnLlc=
X-MC-Unique: 578Lj---OZGoLRsBGWQU3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkaAdAIo+DXfu4rNtmG2/assHgJu5w4LLY3BBU97t5PZH/98H39+GHV0eVcCfFNGOM2Gl8qZwmZQfESim+be5bjx6yKcX/QfPZZ4gCfHJxQkAq/AWrp5jyNKI5PasHcAGSqZ3HIj4Zebi+F/blf8UJmrVo5gwuuA6ZZczzMYfI7e9PlGSwAWuHCu41e2TnCH0ZAAdUMxKnblsich2IsHWktTKbbWCn335KltrKTSvtK0DJAqftsvVk6/yPIXGVSOFoJmu8sbC7TpyBHGLbPQl/cw1zzZnkjxMDyjNn/9tm8wOm2qV1innwXJdT3SsbAg3jgYhN36Fs2f5I1deqyfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9r+U0XApU4WbDqM9gwZ0V+Z3ubX3aUJQu9n9vtYWtgs=;
 b=Udm4EkcyD78o5ZPqrVsXLESJVOq0fqHyjq6rX7/im8s9IcBIdTqZ3kRoBMDhc/oVMxDkSMOP9PVeUwd4cZKbrr/dDhvbzy7a8LR3wVzpHFGOh4ImlTWl6J8BnTQr7TYDnR1ILNZbcZDljR7DCiaE3AlcYEQG66oCnc+HFq/LOWhHzBk2Ys/b47TGiXO3GOZWsEaQ/L5rBfGjqq4UfycYbN5xxey7rn4B6/EwtR5gMTWblnloA8G6xYN9fkn06vgJR1OrLqhdpjIAPZ/EKVtdb6u7hhJDpmSTrPvDpDu3KAczMhdVfJM8uNp8DWrcIC2Y3+WeoE0uv6/6lNYmfIxZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc3cc4f9-e1ba-b73e-9527-7a3a85043505@suse.com>
Date: Mon, 21 Mar 2022 15:58:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] x86/vmx: save guest non-register state in hvm_hw_cpu
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <e79bd13acfd73c105ee1399295c99cec153258c2.1647532323.git.tamas.lengyel@intel.com>
 <ca8f13e5-5e3e-e64f-2711-4730883a24fc@suse.com>
 <CABfawhn3-zRJ+m9nJsOGBL=8gkVmzOyE_ttuWJcSLd4UseLzXQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhn3-zRJ+m9nJsOGBL=8gkVmzOyE_ttuWJcSLd4UseLzXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0074.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a214663-d902-4445-db67-08da0b4b44cc
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2604:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2604688B38C3F460C87C2D53B3169@HE1PR0401MB2604.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hRhOB+zHIGowCgs8pFBXvSOoV3Nq+9cMHJZBxPCKzefiY8HJ12dwkx/S6CnckQuFRe6AT2793GjtF97QKFurNkh7Xqqy4Yv1d7rENDZt7lcXrW+mB8nAAX8sA6WRS0hgzORtGYmgek6o7sOrdA7t+3KZBb90o7oVjzzNq4xEE+qJxowGelZv+8/hsKggIwoZ/Xs+WFmdGdEu/kWTeFDB1H/2UkPsXTuWb4JE1UHNCa7R3Aez0hBBDDNFgeskJO4sV8N50HG5f7aoFCSNv79dJvkOgqm2nWPHdxPmlypvMm9XtuTamuwajNgvAoFa4NDXEe7Bdgmnf0PlqsV/ruazhU9Jw6VrL+BnkjcYvBaXfIyV/oun19S7cTJHCdmvhByUH0DMlIa7Y8ciF2AjxYBptxFqEAW80KbS04VA7xgKGdxifNpBJN8tOD2vLOo0gdtbo/4Ojin0EDaPNUV+zfblVI95iz1imowT+tg4fvWTq+SckiieUM8saX95S4zn7aTK4HgSJyPR9e769sITexlm/C/gViQrNLK5vakEyZR1mEMTInA0WOWTuz3WiofZ5GJf+xrtFUwLsx3olDwoJIiWDrup1kZJ4X0Z+uXYcpKzZYRN0al4OFQWIrNHFbn6w5ryOvrHyhkFhnhW1k3VnwTUhwRU0NxmdSHrVuijuit9R1wrcGY+zREzShKQL0ThK5dXuTreXkQfu+xidVPolV1a3ODfkA/djSMGnQoguDUSFLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66476007)(2616005)(66556008)(4326008)(38100700002)(508600001)(8676002)(83380400001)(186003)(36756003)(26005)(31686004)(2906002)(316002)(8936002)(6512007)(5660300002)(53546011)(31696002)(86362001)(6506007)(6916009)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXA1SUpaVUVnV215VEJJWElaS3EweDg4MkEwcG5pVHQycmV4czlXLy9VbVVV?=
 =?utf-8?B?QUhZaHpNREU0TmhMcmo5RFRXTXRodEJ3YWd2K28xRjg1bFA1NWRjWGRHY3p5?=
 =?utf-8?B?VkVhaVU5R2FRREpUTlNKYWVuN1pMbGNSYy9mNW10UlY5dmdvMHRldWtFeGFJ?=
 =?utf-8?B?eVhlV090dzNOSVFkdXNLQ3NFWmRRZE1TY1ZVbEJVa2tPYU5nOXRIajJsM2h4?=
 =?utf-8?B?VHZMaWhwZlV2eFVWZXBBWjREc1V3T0ROai9vMHNGaDJyK2hUOEc5cm53Y2xo?=
 =?utf-8?B?dzFJUTVYMjJ1TVdVdFRzamVzU2hocHE4TFZGOGt2TVJrM1FKL29XUDV0dFJl?=
 =?utf-8?B?bG9DTzF2Ky9uQUx6SDNsZkZLOXJwU0JqTDRLcWZWTTlDZkFnelFTd3hsYWlD?=
 =?utf-8?B?RlJyeGhPT2lmdkxGTW9CNDFiSldJUGx6RUN3dHRYQlg2UHIvTkZZZTZ4WlRK?=
 =?utf-8?B?d1FFbW1wOUV1bjJUWWVLVG9Ha0tsa09ZdFhVRktOS0VndXoxVWFXdUEzQmNL?=
 =?utf-8?B?alBJMUU4Vk95Q0EvUk5RR1JsajArdis1NjNaY2htbGdRMWdQenFzM3R1bEJo?=
 =?utf-8?B?TkpLOWRBZXo4NEpvUTdHY3o3bFZlcDV3K1NMSFhMSGZGL3lGSmdXeGxlZ0to?=
 =?utf-8?B?em9YZDVTeTlRM2dSUzI4WjFDbVFQTWRxbW5XYTV1SkcyZlZIb0VTQndSV3dv?=
 =?utf-8?B?dlhWMlFYTU4yd1lTSjZxSlVBSnl1KytlWVFqRDFBdzFGWk01bS9CSWpWSnpo?=
 =?utf-8?B?YUxaSHZBUUVObWI1eXlqN1hISHNnNnNlOUp1KzlEWW5vczNyd0xMSTlSREhM?=
 =?utf-8?B?SkJLQW4wbzJPN3hCamdjNzdvQ2lSVFJQSE1ESmFsajlhUTNsZXlGQjVDOU5y?=
 =?utf-8?B?d3FnUHdCcUtBSldGbWkyS1FFSmlKQ0dncTdBZnZVME5DdGszblp3RFNjQnI0?=
 =?utf-8?B?algwNVNmdWJSc0Y0czdKaUF0VTB6Y3MvbU5odXJqbk9FNWtQbDZtd2pVTUta?=
 =?utf-8?B?dFE2SUFZdmR6Nm4vV09jcnVId1RQTzhLZkhMZXpQVjBlcjEvYUs0aTN0dEpz?=
 =?utf-8?B?L01oTDhJYTJpZDgwQ2dMdjlRekw2ZXY5ZmN2T3BzQ2pNcDFOUk5TRHlVR2tY?=
 =?utf-8?B?T0kxTllpa1FRN3p4ZDNkRkNuWTFXNW1WU2d1YVpITERSdUZYb2NlbE9KQkNU?=
 =?utf-8?B?bEk3ZzJBK2NibmFKaVhZdW9aR3FwM2RmZW5WcjczVDBOTnJXNHpGZkVmOUxa?=
 =?utf-8?B?YzRKZzdBUGdoRTh1cEphZDdxVmRxTUFGYW95ZXo0YzFBUnJNRnkySUl2YmdH?=
 =?utf-8?B?WU9UdEpzcDl0akJ4Zm9ZTDZIWGFVZ3gwWlVOSUtEdmxZUkc1V1RFNHVabE5Z?=
 =?utf-8?B?RWdKejdzektHRFZSZENYUWhhZlB6MTB0eW1uK2ZiMUkxaDdtVVFEOGY4VG1Q?=
 =?utf-8?B?WVZBS1JWMkJlVkNTUk1odndjL1hLckZZZC9WYU1LWk9rUHNpTjNXbzdObEJp?=
 =?utf-8?B?cGFjclk1S3JsRmZ0RmtKQVUrWXEvZmRNR3RtTHZpYmZYZmtGYm52ZVNiTUow?=
 =?utf-8?B?c0tRNFUrN2lvanMweXNHWVdpMkRkN3RsL2wzY3MwV2VSbEtiUDhXZVRkMmZz?=
 =?utf-8?B?WjQzWW1ia2dwN2JpNkdKVDdHWHB5RUF3TG12Y0NIUzAxZUhhM29KcC9KdWpy?=
 =?utf-8?B?RU5neGt1REhkWDJDbGMyakVKYzh5MHlmaVZnRHUxUE5HQWF2eEsrTFJVZTV1?=
 =?utf-8?B?elZWWElpYjJJcGFDNFVwWjFhbGtZWkV3VWNCa3pXdkZOdDJXVHpQUkJCNWcv?=
 =?utf-8?B?OUNWQVlNaFFkZnNXNUx4WU81dDZoYXB4emNLQUhkdXUvVlMwK1RzYUVtNGZx?=
 =?utf-8?B?ci9YMFNnS2JWNW5ydTZESTV1Tm96OWRaeGFud0JDejB2V2VLUHUvUWVlS3Nt?=
 =?utf-8?Q?8ziXfIjn28eyMRoDXxu1PyWYVk1ok1js?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a214663-d902-4445-db67-08da0b4b44cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 14:58:33.2481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fq0ke0BTZYFJy2XJPMbm9zVqgGPyJgAPZ19jlSCz03Z9E8pyTy1NBadkWHy6KPz/B9A6PDFYCD3ky6Rveu/F8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2604

On 21.03.2022 15:39, Tamas K Lengyel wrote:
> On Mon, Mar 21, 2022 at 8:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 17.03.2022 16:57, Tamas K Lengyel wrote:
>>> @@ -166,6 +167,11 @@ struct hvm_hw_cpu {
>>>  #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
>>>      uint32_t flags;
>>>      uint32_t pad0;
>>> +
>>> +    /* non-register state */
>>> +    uint32_t activity_state;
>>> +    uint32_t interruptibility_state;
>>> +    uint64_t pending_dbg;
>>>  };
>>
>> ... these fields now represent vendor state in a supposedly vendor
>> independent structure. Besides my wish to see this represented in
>> field naming (thus at least making provisions for SVM to gain
>> similar support; perhaps easiest would be to include these in a
>> sub-structure with a field name of "vmx"), I wonder in how far cross-
>> vendor migration was taken into consideration. As long as the fields
>> are zero / ignored, things wouldn't be worse than before your
>> change, but I think it wants spelling out that the SVM counterpart(s)
>> may not be added by way of making a VMX/SVM union.
> 
> I wasn't aware cross-vendor migration is even a thing.

It used to be a thing long ago; it may not work right now for no-one
testing it.

> But adding a
> vmx sub-structure seems to me a workable route, we would perhaps just
> need an extra field that specifies where the fields were taken
> (vmx/svm) and ignore them if the place where the restore is taking
> place doesn't match where the save happened. That would be equivalent
> to how migration works today. Thoughts?

I don't think such a field is needed, at least not right away, as
long as the respectively other vendor's fields are left zero when
storing the data. These fields being zero matches current behavior
of not communicating the values at all. A separate flag might be
needed if the receiving side would want to "emulate" settings from
incoming values from the respectively other vendor. Yet even then
only one of the two sets of fields could potentially be non-zero
(both being non-zero is an error imo); both fields being zero
would be compatible both ways. Hence it would be possible to
determine the source vendor without an extra field even then, I
would think.

A separate flag would of course be needed if we meant to overlay
the vendors' data in a union. But as per my earlier reply I think
we're better off not using a union in this case.

Jan


