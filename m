Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E367CAAF2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617635.960418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOD2-0004TN-Vv; Mon, 16 Oct 2023 14:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617635.960418; Mon, 16 Oct 2023 14:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOD2-0004Qd-St; Mon, 16 Oct 2023 14:04:40 +0000
Received: by outflank-mailman (input) for mailman id 617635;
 Mon, 16 Oct 2023 14:04:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsOD1-0004QV-HH
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:04:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f11509ea-6c2c-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:04:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7221.eurprd04.prod.outlook.com (2603:10a6:10:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 14:04:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:04:35 +0000
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
X-Inumbo-ID: f11509ea-6c2c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI1bBuy17/7EwTuW2XXlIY3z+WW1g5bDAW4KFgXoumHmwbLuqt0SGvppnEIAsgk5jgai2QdLWzgJerQdCu4jM4lDpa7uaAi1xabD2Dk3IvmKkEu/kFyFU3jcJTQY4z6xDZ5V9oDDCZioRzyAA5oW1q1KYRzdab9BEW8+lRXYQSOYUnZCfA5/0vwVqEGKGHXyiTSI1A7N7lhMGumrPgsipOX5hh6SLgoYPVNncs622riCEPw9YvJnFhhG41GJXWChFPsbymCZoOssKG5+Fi51WZ1sfhjr4jTG7vAm1zLztvw5+1+NK8ZbAgogHUlmNVSWAU/kMIyx2C1iR2oE5WiI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=896e5e+8rUBXODkOEmQWwo6Ms7TNzLX0CaqBiFR7UTw=;
 b=QRWZqYbeBbslT124q3WiLLhLcnP5c+krfC4rCi3WNfG9MR5Ieh0xcBqXLdSj05YpwsqSTvFPUITYpY5NUjCzhlKDGZTloM0Lk842zQCKi7ESK+pYCn6T3/75uOO0kTsiobECzHfp/+nvKsdyQjEIGnApo+IY7WlOs7SlaUfmkIhkBnlSMtKf1O5TDvROofszgzpDlpOMScKpyFSEYqWclSh20mVor+rFI/UvGUGPLTujT7YzLRAlnbXysNl6KK4wwToL1xi6kAbFHXqUzWcKg/pyjgF7CYW/JXRtPUpSD4NMQ2cdckqDVMqdqXfDpAXIAhy91EqdkZCbkuVdwbVG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=896e5e+8rUBXODkOEmQWwo6Ms7TNzLX0CaqBiFR7UTw=;
 b=LxzONI4YwoMnEfSO1HoJnJC0uUB2JOKnFyX0r9tnPK+HXa250qe488UrGS4iLo/JnumUyo+MSDSsYw1jtHYhTmZe1pl2IK1qCaB7VIjguGbDQucRIAgs1s7uN6FoS3BklSUsm+d6GEbVmzc0ibT8NpJNVtNBnwGJ1cSZ55jjras4hmMjLGdsR0nUzxs7KjVuSrZAs29d5Ov9PqR52UJrAoI6MjD2heVM+Enuqz5vaGsVX1l8oLVar6t0FMYPVDgPwryP9WvYuXDQRg8+acglbZyg6DS+FsqK5CI01ISfI/F2z/B9S+rGdBMlQqIvGb6U5ql7uxUGNCKC1i6wfbLuyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de39a4a1-bcb4-b0fd-e18f-2892c428c8f6@suse.com>
Date: Mon, 16 Oct 2023 16:04:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-3-roger.pau@citrix.com>
 <b8c03b77-d4bf-3be7-2090-e76e6849b085@suse.com> <ZS0z89xtFzkmK8_d@macbook>
 <2cd47d7f-00de-3409-c21c-561c92a5c42c@suse.com> <ZS1CIFA1FoeGHONZ@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZS1CIFA1FoeGHONZ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: f80d8c4c-6ed2-4eb0-7d00-08dbce50d42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nI8DH3W1VCn9Qtcn4cZIkmh5Y/d9SLGHXvKCRXhyAsnhCSa3rVhWfbR4erSl5AqxLmQSeKeRWNA+QS1x/duO6TeF9KlJLfazjIhfVPVVdeOAj3oEh6bHZRYH6cMwdvXHgnbTEgjouEBqMfNeQXJzHeH03gMwOH9+1pOo1frmVlS03Er+prWrCTLrxSJEIXgUsq+2uQl7Bl9bNq8eiROnhWWOs84TF8uG+uzoZYJqLAUnzkOsY22ZjJHGLah/vRj3Ram7wU98Bf3eP15tZvG1UsspdUu7FZ4T8MY+fuccU4Uk6fjtDwFQIly15S65EkrJy05h0bRT1NV8MvQkP0fGOqkkFCRIprxAj2cm+JwRj6xEAM9g9x20xUjtHIS4VUkUjlkFTkmcdXtGs9RvGtebUOpX9DBHwAGXRE8fLLa68gVpxI9hyqzS7QBm6bcvC7W+J8G6pDm/OfvIREVijlZYZxbaNBSL9FzqdN62XHR2rExqqcjvvWNlDsydmjgd04T/WpZL9HTqemKFBZcfmahSsDAQWbi6P2x+IuodX57VsDmyhwev7x8IyHK3mar8X9pJgL4D/0dlFmlLD5VVIU0RaTUQ4/mOds9TrjPr4yY6bgFDWg4/PP6FadBm+39Mxrgp2eIVDyTP+S4PzlPlw1g8RQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39850400004)(136003)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(2616005)(8676002)(8936002)(4326008)(5660300002)(38100700002)(31686004)(41300700001)(478600001)(31696002)(86362001)(6486002)(2906002)(316002)(6506007)(6512007)(53546011)(66946007)(36756003)(66556008)(66476007)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDdOY0lYWFczYm1oZ2M2bkhmU3J5MW9neHJ2b3hrY1o2SWR2RzhDdVFlVmxl?=
 =?utf-8?B?TnlLaGUrdjNjbDk3Tlp0c3BMZjY0aWFmemNMYlJQK3FhZlozUm1YR3NwRkJa?=
 =?utf-8?B?Ymx0V3ViSXVFWW1HcnVCTVJyVGtwQm5mNjVRMnUvT3ZNNnpKclFQMFMzMjdv?=
 =?utf-8?B?akN4OHE0cHZNQjJEZmJKZk8zY2VaV1dNNHVUUGpjMTZnL255SjNEZlowM0NW?=
 =?utf-8?B?alg0NEUvUmlMdE1aeTBzWjcvZ3U1MXcyckJSY2dsSHpPVm5IVWtxeFJyeVZM?=
 =?utf-8?B?clJIbzRTOEE4YlFjYWcxbmV1UkltdC90N3ZoTjBEN0JHQlVmOXhISUdaVmRI?=
 =?utf-8?B?Tll1eFM1VVdaVDgyVzdXNTZDZUN4dEM4ZHc4RitBVnJ1S2xweXAxMlU1Sk9F?=
 =?utf-8?B?NkZvRFV0SXZKTldlQlNPVGdrdjBBTDNsTzczaE8xK2g1T090ZnlnNkhTajJZ?=
 =?utf-8?B?bkxmSW1qZmRIcHMreUpOenc3UVVhdSt5bkc0cjF6ZVpGSXpTMFBNVkVFZUFt?=
 =?utf-8?B?eERTanVsaFJKWHBOblNKV1FBZ2hoMllQU0Rzb3JLV05veWhhdW0vR0lBZ24r?=
 =?utf-8?B?N0phQ2ZwUm52clZqUDh4Qk42SzRtY0h4b256V0YxK3lCcU9jbW1EZ0hXZlFt?=
 =?utf-8?B?UmtZNkl4dVNMclBjZWF2ZTdaK3hrb1RBZUVHUzJMY21CWFFIQlRZU3NISjV3?=
 =?utf-8?B?WHpheFI4R3ZNUDlLWVo0T3F4TWpTRWxBNGVuWDdzQjRLcUJDdG5xQnNpSlkr?=
 =?utf-8?B?QThxTy82NW1GdUVKRjlHVkx1Q3pqQVRRaGdzYWZBY0RXQmVUdFBRYTR5MHRq?=
 =?utf-8?B?bXV3aEMzVHhRU0hXSnFKZ0EzVyswMUxMUC9wV2xDUnZTeXdTRllFU0VhZ3Yx?=
 =?utf-8?B?cEpIOEdNaGQvZXR5R1pCR3F5Z0RTc2pTeVFOSjZtaWpOMEg0MEM5NmFNcEpK?=
 =?utf-8?B?UXFKNHJPTVo3YTNKZW52Q0NRS0VrRXJZWG5DRVNidjNXYUllMFBGWEJySk84?=
 =?utf-8?B?S3RGVUY2VFljNDJ4OHg0aVRDWnhZb2VXKzhLODZ6N3pMMElmMEVWcWlIZmVK?=
 =?utf-8?B?NExVRGQxbHJ2L05zamlVUWpORUtCbW9ndkNxcVFuT0xBYXpPQzlZRWxsNjU3?=
 =?utf-8?B?eEpocEdRanJjQU5JQ2YwTmFtTi9yQVBXTFQwU3dsRUljWXV5alVoeVRwZmFL?=
 =?utf-8?B?VFVnaDlEMUQ4R1BacFJSRUU3K3RSMGsxdGtPalBBVDRKdjlvcTZIRldHbm5m?=
 =?utf-8?B?VjNsUlNjU1NyRmxaa3NiZEljYlkvdEg5d0xEVmU2ckFjY0Rnd3lMY1A0VGpT?=
 =?utf-8?B?QTgrVG9KZTBEU015dWhwQXA0dldHNkptbm9WQW1NMVlEQVdkTGFqWDh3cFZ5?=
 =?utf-8?B?WHhDR1phZGVFNVpxZDl3RnNMNkp1V2hTWkhLbmV0UEhxbzRMR2dYNWhSNXZN?=
 =?utf-8?B?SVVBVE1CZkdUanVZc3d3M3RmTE1FRVRJRElZRGJSeDl1bjliVTNaZmhtYVpm?=
 =?utf-8?B?T1A4bHV5ckltb2drWjJSTjFNa2Z0YmVQREVOUmxVeWYxN3dNalZ6ZlB0clB5?=
 =?utf-8?B?MGU3OXlzQlBkSHVudHByWFFNT0dtc3hid2YyU01YZHlFai9Oc2lKQWh5UnlK?=
 =?utf-8?B?bXRXYU9MWkp6SC9nREUraFpHc0p1anExYnhHK2ZsNDFMMkdZQk11NktkZERV?=
 =?utf-8?B?dUlVVmJtK2hEZkNwQ2FJSmhqaGRsM1RZc25Edmg4b05tSHhGQlcyZmJnTXF6?=
 =?utf-8?B?c2pvSkc0bFhveFlQQmozYmdlQkhYSkdNTkRYZmNEeWt1NjVCNFlEcXNFak41?=
 =?utf-8?B?ZCtWMkJxUEJtdHNMUjhHTWN6R2REU2x6ZE1vWVJZSTN2WituWmxQMUhrM285?=
 =?utf-8?B?dS9tTGNub1hzd21IcWNmYzdsamtld3FXbTVEc2JKaXJJOUJ4ZWJObXU5Z2RL?=
 =?utf-8?B?MUdadVk5QTNKNG92M2hzdlBZQjBZS0xVeDBYSEZvTVYyamZ1RmplUW1HNHpq?=
 =?utf-8?B?aDJCRHA1VW1qQUxCTnErZ1pudDh4VTJCYTNDd0JMYnFIMW9CVU96cVBrUUg0?=
 =?utf-8?B?STk4NGRVU1ZyVHdJbVRMc1JocEVoUFRjSjJDclg4ZkswVkROZzF3TWFaZEFB?=
 =?utf-8?Q?6Et5Q/qqGmDgJAjJk0ipYv4Zr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80d8c4c-6ed2-4eb0-7d00-08dbce50d42f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:04:35.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5x6coFbYgRlwsfH/Lll4j8UfOKqCmHGJurLrriboN2fhulYqw4yD3z9srkKJFFx7BRpPw3PWoSUKchhl7/kbPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7221

On 16.10.2023 16:01, Roger Pau Monné wrote:
> On Mon, Oct 16, 2023 at 03:58:22PM +0200, Jan Beulich wrote:
>> On 16.10.2023 15:00, Roger Pau Monné wrote:
>>> On Mon, Oct 16, 2023 at 02:35:44PM +0200, Jan Beulich wrote:
>>>> On 06.10.2023 15:00, Roger Pau Monne wrote:
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>      {
>>>>>          struct vcpu_register_runstate_memory_area area;
>>>>>  
>>>>> +        rc = -ENOSYS;
>>>>> +        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
>>>>> +            break;
>>>>> +
>>>>>          rc = -EFAULT;
>>>>>          if ( copy_from_guest(&area.addr.p, arg, 1) )
>>>>>              break;
>>>>
>>>> ENOSYS is not correct here. EPERM, EACCES, or EOPNOTSUPP would all be more
>>>> correct.
>>>
>>> I don't think so, common_vcpu_op() default case does return -ENOSYS,
>>> and the point of this path is to mimic the behavior of an hypervisor
>>> that doesn't have the hypercalls implemented, hence -ENOSYS is the
>>> correct behavior.
>>
>> Besides that other ENOSYS being wrong too, I question such "mimic-ing".
>> Imo error codes should be the best representation of the real reason,
>> not be arbitrarily "made up".
> 
> The point is for the guest to not take any action that it won't take
> on an hypervisor that doesn't have the hypercalls implemented, and the
> only way to be sure about that is to return the same exact error code.

I don't follow this kind of reasoning. Why would a guest, whose code to
use the new sub-functions has to be newly written, key its decision to
the specific error code it gets, when at the same time you expose
feature bits that it can use to decide whether to invoke the hypercall
in the first place.

Jan

