Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C765C6BCD3C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 11:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510495.788233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclAv-0004MQ-DV; Thu, 16 Mar 2023 10:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510495.788233; Thu, 16 Mar 2023 10:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclAv-0004JN-AJ; Thu, 16 Mar 2023 10:49:37 +0000
Received: by outflank-mailman (input) for mailman id 510495;
 Thu, 16 Mar 2023 10:49:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pclAu-0004JF-BD
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 10:49:36 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d963a98-c3e8-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 11:49:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7411.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 10:49:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 10:49:33 +0000
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
X-Inumbo-ID: 3d963a98-c3e8-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXN6e3wdEBLLew8DOIgAVJLe/v8j64DBV1TV+aGf1O6rrtpj9TT0YfjT/FYM+iZrrtdtRUEyprj0gzjHvlDproEhsG1R54ERw6WVcEG7gWn+TgpY7EcfWbLhye8Ze6eznGQASV12BsaSoTWSl52q8do/SmU15EP/yUN6QyAteg/m4zIu1d3gvnXJRyukiqWdqsfWiStQZa2VusJ6q5LItZcMcxkdueoqMjDpibJDJkIwV6X2VKjpSo3pUtn3zEvTa8+Cok2rdf/5nmtMgN7N9AJEWKHNxiYQG3s7yWG8gbe9Su357m5Phxrd17+f80toafkWGcmDW/vh4KxwLHYoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLL56g339PAMvvMKhErnGA5ozcoKvyEsNy0lBIUZR3E=;
 b=nw+Jmu/ljYs1YIK9CrFbSwSeQ94mH/PLzrh3dK+zV5DDcnv9pUA/Y5LvXGlJZiStSShBnxS8YBqLN80nwqqzzjTtcJ32Jh9u0gaFnRWmqjallfZzAi4/K9A9+3XlYusJejmCVs+5EAvrOD4IAuaZlWJj5TdGR6X64TnjQ7jIF9JXXfxtFkGGJGIoUXEict/tsMzA1eJ7gmpFSDVo33MQfQzm5LfWvosNhlSsfxLNSxXlSJYG/T/m0p/cpSwuBHSdV3k2FCywyzGg2SSD+G1ikVUDGde3ZKAUYkjRMGJA7xbrFLaRmWFg6Vys93QTG7epw3fwKN0HbnwkPHwulaw1Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLL56g339PAMvvMKhErnGA5ozcoKvyEsNy0lBIUZR3E=;
 b=sY6b733xPxXuyJ16rdEOlMWbp471gxXlqFrvREa7lmVxRswYNdJzepld3O/3ekOUnj37x0Kz+fSZ3DGGxKbBPjyanbTi6ReJ3s8NxKOGRjAYwD9QCTSJG8OUdUGUnEyv/XGNkySKP4r453rQJ1/hjHKuR1kms3yClQxFvgCzDK/ROpQYUsWep6dVJ77liljrugp+5HGTul+WYPtXe+zZZVkbq+Jk03r4ldvtYzUN1Sn1P2NCYxX7ibcvHiO3Tx34J2UwdZvlgNmPHm8nXhe0bObvOGNBsNuwNIJBc+9JnZKrISGVkSSpJNGkxph2biwBYotY5CRYiqrYXYLSuXktXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <982a04b2-032c-566c-f742-aefb631aa24a@suse.com>
Date: Thu, 16 Mar 2023 11:49:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/svm: Provide EXITINFO decodes for IO intercetps
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230315221003.733913-1-andrew.cooper3@citrix.com>
 <fd55257e-3604-e09b-fba7-bc95d39ce723@suse.com>
 <d6c4b2ee-2215-a741-a293-36ece4c3dc78@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d6c4b2ee-2215-a741-a293-36ece4c3dc78@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: eab67883-d550-420e-39c9-08db260c20e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kcweW0RrNwzqfvLisZxA/1uw7godaMtu2HmuYeHeWi2QTaOnQQAZBBYbRyxWpZ6kBCYZkfah1fxbTD/ecQt4q/SlQYuvN0QumvkZnuF8GtWmgQFESybPP690nqLAP0s6OnmmDb7Q9dFF3MSmunbse//jrqhozk+IEGMgxEgvv+lbKA7FQBN7jTPO/dMhCJhuHS/tlZIqPmDAN+sUA32bf6hctnqSlXIBU0VhTTwBR5r/vSWJPrcQ6WdK9YkZ7X2g3k9uo+OLoglApucemcOZMm5smD8+Vje6MGulmStRUQ59jZDILrnE7ixr35T8S0k4nolhE4Axr/My+NAQnRt2dH5rtduwfNNY3QOqDYIu2KQb8dtQAnba5FmG1kS8I3zhpLRhG04d9mpmdSQRBvh6Q+DZ23Zv9+b0Gm2yUvLyts4DMJRV5NDkCCjIM8ePlW19c7KomIJ0QSC+MWoYbwXey37HIMpoUUBL7ocZGTY9Xku4IooteOCixh9iGc4Dy+g2t7oqBxEHc+dCCfC/0WX2b0DWcm4DK7Qi4CB/XkzpUri+8vOPE6uZbV5Uajb6BUW0K3SIrRNQVcnCpKV70fOV0AtjbT46jpSBXjUamF+PthwEx3q7DRIW8CTvNBHmziF2757QW9pBKk6m0VcN150EfG//EafLuYAKUw0pHjq7WZgACmxsTkc3SkLWjzE9+4A3y9hgDLePsQbzjZZvNdERnJC7R9kgTD3jV5qXpp9i72s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199018)(66899018)(31686004)(36756003)(5660300002)(41300700001)(8936002)(2906002)(31696002)(38100700002)(86362001)(478600001)(66556008)(6486002)(66476007)(6916009)(8676002)(66946007)(4326008)(6506007)(2616005)(54906003)(316002)(83380400001)(186003)(6512007)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzdXSHV5dHAyUnI1QjlNcXBqbFpVYVpCVHRCbEtUNGdhbXRLQXRMWnpZRzFk?=
 =?utf-8?B?VVhEWGRJQTZMR3JuQjJhTnlnZEUrbWhDWGt1WjZ3MUdIZ21aL255K29XTXdY?=
 =?utf-8?B?MlVBdkRNejh5dEpCTFBqS3V2UFYwTUFHaWpuTytLVmg2M21za0ZmZHFJK1hU?=
 =?utf-8?B?NzY2K2hYNmREWkdrZFZvakFLN1BxMUlmUndNOVhzdWZJcjB2MnF0dGErdGNS?=
 =?utf-8?B?cTV2TjlScExmTktiQzNOVktodEdVZDlZRENKZDR3Yng0Q0dxVktpSjUxdGpK?=
 =?utf-8?B?MTFnZXF3NWlvYnM0c21yODJJZ1ZmSjhqOUhOaFJHVjl6ZFo2MzlyTmExVjdk?=
 =?utf-8?B?dlg0bTZmUmRTY0NINXlKYVlWRDRvNERKSDh0NG0zZWoxN0xVZjF6OElPRDhp?=
 =?utf-8?B?OEs5eldVRFdWcUdRS0o0MGVIWUtGa2t4TTZURDFLT1VML3lPemFFckZKVnFN?=
 =?utf-8?B?cFJ4RnFFWkZ5NEw2S2l5UGo1L3FVRG90MEN6NUJpNUVTR3F3cWQxS2tUc1RY?=
 =?utf-8?B?bzg0YnNQQURRQ3hlYXYvQm1vY0labVM5djhqeTlUT0daT2tBT1FMcVZ2L01P?=
 =?utf-8?B?ajFUaXh1VCtTckpYYkE0bGUxaDNaTWxSK2pydWhnNlN6NWhpaTBMWFRjTitw?=
 =?utf-8?B?bE5RVm5xUER5ZndJbFFzQlM3ZDcrc08rN1pYL09RUDRjTDNCMzYrMjFVQmEy?=
 =?utf-8?B?VWVxTVRucXVacVBMM0loRHUzOG1jdDhjL2ZVYkkrdHBpMS9OblQ0Vk52clRB?=
 =?utf-8?B?OU5MN2NkWmcycUpIVXFUcVZ0cVE1aVRFNjZpTUxGalY1RW90L3BxbG5IZHJx?=
 =?utf-8?B?SzI0bkdDZ2szcGljTFNyM2lmZzJkUGQ2OERNV21tSG95d3JCSWgxYys0QnpH?=
 =?utf-8?B?VzlDT3ZzRUN4VnBUT3ZjZjhMMC8zNlZWV3o3THVxRWtQNVNPMEVHZUMvcUpH?=
 =?utf-8?B?cjBrdGhPMzlmNnVGdEVSaHYyeCtRMTdYdXBWODhXWmxmZ1dPbCs4YjFETXNz?=
 =?utf-8?B?dUl6MXR1L0lxdkkwTTdVZ0R6WWFqSkJXVW1VdXFuelU0WDFwVENxdXNKV3dP?=
 =?utf-8?B?aGJraTk0a2N4b0MwLzlEcTFlUWd5OUtzWnFVYmg0UUhhREhkWlZuTkprSlFZ?=
 =?utf-8?B?Wnhkd0V1Vkl1REFCemIzZEhNbXR3UDZwemdqZllwUWV4RXNYbTdRS0ZxMUww?=
 =?utf-8?B?ZWNYZDl0N0FSQVUxQXdjcWsxMGlXeEV6Wm1Dd3QzUXgyMXllTzdqMzJrQ0Zt?=
 =?utf-8?B?ZW9IM2JYckF6VWxJcGJkdGNvSXh4VXZkOVNheWhlTDg2dG0xNkF6WHNtdVBC?=
 =?utf-8?B?a0F5emxJSGVQeDlwNWE5ZjhjM2ErT0ovWFhVR2dnUWtOamJBZzdGYS9Pdk80?=
 =?utf-8?B?UjdMRjZmalVENXJ2MmN3cmNCZ25IeW9jMkUzeENSNGcveGs3N1hCZ3Y0WFdY?=
 =?utf-8?B?anBIbFZOT2tzU1J0MkorSDBjTFg0bEJ5NTUvTWxNVXZRMUllN2J3ZWlWWW5v?=
 =?utf-8?B?MndPcEMydzlrci9xV2t3bW9DcEExOGgwSmx2SittTFIwcDFvY0I4L01ycWF6?=
 =?utf-8?B?bXJjYjRyZ3N5eUtHenVMR0FiTHVwRjhWdTVTcEt2NGtCOTJqb2hDakhEWkdI?=
 =?utf-8?B?V0IxQ054T2NmVkVWVU1YS3NYdzlheS8za0gveGtzTndSNXdVM0JlUEtQU21a?=
 =?utf-8?B?MTExdE90VzUyT0pVbDYxVmt5Z3gzcUVtcnZSK2hSS3QyM3dyMkNiMmk4MWxK?=
 =?utf-8?B?dlBLRWkzczk5RXZtckpDMXNBZWZJNGFlR1ltMFl6ZlZLTFkxaFBGSjVPWU5T?=
 =?utf-8?B?TVU2RmRsQms5N01EVXRpak9IQW45ZElmK1pDZ1pySGFJYk1RQVFkMzdDeHNZ?=
 =?utf-8?B?anQyek0veitQZHc4TjV5Umc3Qmd4UUI2bXkwd1BEU1c1VExtNE53QnNnK2Qw?=
 =?utf-8?B?Wll5RS9WMU5jaGYyU010VncxRVMwUzBEanYrSW83T01GbVZ4VHVqOURaZ3Rw?=
 =?utf-8?B?ek1ZbEJqYzd6UTZkM1RVUTMyV1h5cVpMdFBia3MvVzgvd3FKelZjNmQvTnF5?=
 =?utf-8?B?M0NWWHBacVE0eWpzdmZaOTNNbC8vUE80cHRpdEx5UWw5Mll0Y1QwM3Bram1I?=
 =?utf-8?Q?M0ZRfIYJm8+debSqvoEhDJPK0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab67883-d550-420e-39c9-08db260c20e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 10:49:33.8016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4PYvk+BEl9OFrt/zllifwNsups/03FE8iWX1NinnyNpTLl6miNgPtf7W1950PykyRR+Nm7TFdYaRO6iqLxEGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7411

On 16.03.2023 11:27, Andrew Cooper wrote:
> On 16/03/2023 10:19 am, Jan Beulich wrote:
>> On 15.03.2023 23:10, Andrew Cooper wrote:
>>> This removes raw number manipulation, and makes the logic easier to follow.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
> Although looking through the emails on list, apparently the vmx side of
> this got missed.

I was wondering, but then expected it would be a separate patch at some
other time.

>>> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>> @@ -436,6 +436,20 @@ struct vmcb_struct {
>>>              uint64_t exitinfo2; /* offset 0x80 */
>>>          };
>>>          union {
>>> +            struct {
>>> +                bool     in:1;
>>> +                bool     :1;
>>> +                bool     str:1;
>>> +                bool     /* rep */:1;
>>> +                uint16_t bytes:3;
>>> +                uint16_t /* asz */:3;
>>> +                uint16_t /* seg */:3;
>> Is there a particular reason you comment out some of the field names? I
>> can see that "asz" might be a little odd to use, but both "rep" and "seg"
>> are imo fine to have a name even if currently there's nothing accessing
>> these fields.
> 
> There's not currently used, and in particular asz looks hard to use as
> it doesn't appear to translate nicely.  Also, I don't that seg matches
> Xen's x86_segment_* encoding.
> 
> I can uncomment them if you'd prefer, but I thought this was marginally
> safer.  I suppose it doesn't really matter.

I would appreciate if you uncommented rep and seg; leaving asz commented
is ...

> As for asz, I previously had osz to match before renaming to bytes. 
> Suggestions welcome.

... perhaps better, as the name would be misleading, and half_asz isn't
very nice either.

Jan

