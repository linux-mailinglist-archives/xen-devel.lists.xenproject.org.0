Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580086B7016
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 08:26:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509135.784381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbcZd-0005wY-Pb; Mon, 13 Mar 2023 07:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509135.784381; Mon, 13 Mar 2023 07:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbcZd-0005up-MM; Mon, 13 Mar 2023 07:26:25 +0000
Received: by outflank-mailman (input) for mailman id 509135;
 Mon, 13 Mar 2023 07:26:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DKDe=7F=amd.com=Christian.Koenig@srs-se1.protection.inumbo.net>)
 id 1pbcZc-0005uh-71
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 07:26:24 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5acfb899-c170-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 08:26:23 +0100 (CET)
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 07:26:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 07:26:19 +0000
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
X-Inumbo-ID: 5acfb899-c170-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG41vwSdLUTtCMDGO5WY4spgRDN8aqaqnmEQMv426ubUwTqTR+WdExruW8EJ7wdsZi/r57DiwMEmVZqCyhalkIsx7fgWY7MURbBljViG06e9YNNIj3BEU0u05BJUS+WDM8VYp7dVToNCTNJPqNxqC3ZjLkbzcqwW7f3gX7vCsAt3JEYuqVYb6R1ESwbS8bNb4dzrX7gK1e+5VOIzZBYT2Ud3ocz5sapAFgCKZaNs067OPlYWlTiEK5SC9xUbgRuyTseFelyuGXct8eFs0TRBfG2WZ9dLAIbDpmarbFeZ+HJTa385UPLh8oe8G3hlv7S4nb+e2GvbRplHqp0SCr30IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6E92zahT1FpEoqbvvrR9GBHNWdssWJ6+NBMhFJyT4s=;
 b=EcUW7mmhB/zRoLhQO0K2diT+HQ862Wx+KcjGdUpFc6/WUAICGQ10T+kX3cqbzDS+h6YmT83FmxtmX0JuG9WFf/e1EgkIO1RwQP6yhji57v2BNESifbEo5Y0ljYmLeUJDCH25wjA5U77o+6+i5vusmYVqqyr/1fAVTdHYXUC+u1IXq/t6LE52Wd0pNKgW9eve7E633gH5QbrDgNn6QzPE+mF7YAGlBXYsfYoG85x+XHInwIjQdKc2l6mcLUyiXqMkNxxKRosbTxfG/krEXGHlml2TYNvI1coN3JbtAEHa8LITLd88Eal/h1kQMzg+3eR+WtojmdZGyDXxChhAW8gPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6E92zahT1FpEoqbvvrR9GBHNWdssWJ6+NBMhFJyT4s=;
 b=iQ3bqucz4QXLrjEpn0AE5vwIvZslfq09sfeAvfbeTLC+jmwxVRdUsm2LX3kzj84+23Wi199XdNGyhWdD89i3R0fYtau0drPeP7Fl7Tk9Rg2ZdHLPa4xFl35/xQBjSPRP7/Oc3YoSgh51SkoGGGeSdu9rxcMTmkouKwQuBKBwHbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e292ea24-606f-24c7-ee44-34d55f7147f9@amd.com>
Date: Mon, 13 Mar 2023 08:26:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <d0fb38b8-455e-1210-0f26-9ee7c4335e69@amd.com>
In-Reply-To: <d0fb38b8-455e-1210-0f26-9ee7c4335e69@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d871c2-85a5-4934-71b1-08db23943d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P5tGLGbWygvm2+FYdL7BSiMv6RBN49qdJbuYVZf+wkz5bJP2oWVUqWfatEntYyC7com4ecAkR7gPcXLTgDGfFGFqoBB2506lGKMSgwEMV7h5poCE4GMHflgUIBfZL8Wz+FLaCiC0u9lUTlnoDg5XW0Q1/AN5yAwm9BDr/8+i9AVuejqpqP1AFVK/joYg/BkwF1zqz4iToa8ZnhYEPn+iJIaU2zXCJQxcZVevbOzmV4TFLy1BfWsEaK/C6+ZUNg9JaGNAph8CCFOD8calhRqTwnbSlvPpcsC1534Tf10I2auZAWzZLyWM4uQMWD9QjeVMvxOyiLxRleyHOyAbfkGbKqoUBfZDyckB1rUiclwR79X4yabGW1NxYwGwz4wKmJsBxmSMEVshNWuG/UGHeuoaPLToxFVtC8oxG3AydJYWwNc2fBUH8mWS5Nut7S+roDllMxO/6dhtd30poRszQm7Z4/GN38Obaf2kZXzD2S7UAd6EqK6sZwLp/6yYB9TLnYMioeKG0RnOH5Y1gCQHq0jDaH86qfiZF2OgF72Z1JvoyLSnzRjdWTD/5T8Sj2NTLIGAmOIhfYy6fIRxFytSyXRKLx+dlhkxJulEyQVoE3tywBg9QRv6otM49RJXyHEaL7EEcGN8pzXDwbVzokqj/9zrvLPwWrlYxPnI+/I18CEOJcTyQZZd1oMxjmvtkzV+Ik14mMQpYMsujthSXfYRr8fQtbmvU71L9Yktyjb9AA8LdA8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3587.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199018)(36756003)(86362001)(31696002)(41300700001)(186003)(26005)(6506007)(6512007)(5660300002)(4326008)(2616005)(8936002)(316002)(110136005)(54906003)(478600001)(8676002)(66476007)(6666004)(66556008)(66946007)(6486002)(38100700002)(2906002)(83380400001)(66574015)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkxnVkxwUXY3UFdkNVVrTVlMTFd6SUUxOHBLMVdyYjQ0REtvenMvdDRrSWlZ?=
 =?utf-8?B?YzVpMlBIM1Y2anlqRHpRTi92Q25zUmh2QncrdGViNkk0VXBEc292OCsvdGlM?=
 =?utf-8?B?VlkvdE1VbUhNZU9MYjZQZHZMUzV5c3ErREh1cnBuRlA2WTlMVGdTM2l2c1Rj?=
 =?utf-8?B?ZU1aeUtybXFrNGpzYzFjQk1tNVJXNTFReHdZSEZORGxkazZ0N2Y0MlN2dzEz?=
 =?utf-8?B?WFBlOVZVZ05nRHhmUHRXaG8xYVlwSVFIUy9zU1FTdER6MitFNFhjK3NqT3ln?=
 =?utf-8?B?dXhmRlZxOHF5ckNTTkZjWDE4WkF5QlRsb3Z3cjNCRHlZRFZqR1RReFFXRjRH?=
 =?utf-8?B?Tk55RDV5Rmx2VG1Ed1hickRQTDhLYlZGVkxwRGNuRk5ERm1kckRvSjFnSGxI?=
 =?utf-8?B?cDRRQTFFbnMxNno2N2hzYjZqUDNETEdEa1RtcHN6c3FQOFlHVlIyVFhPU2Nn?=
 =?utf-8?B?UGpuTTVubFdpWHo2MUNZbkUvcEZHcUV6emEzaUNISUNrN056UTVWY3QzWEVG?=
 =?utf-8?B?QjYwRXlYSC9pOWVGaEJYcG1zYVR6K3V1OXFKY0RoZDhOSnNVMWZHUXBNMlBV?=
 =?utf-8?B?SlRKNjlWY1pISG8yaFdXaE9IQzk4V0pDaHE3b2xnMWVQNTE5YnRkTWlOZXF5?=
 =?utf-8?B?WlY3aFBzSFFaNDRyZlpua3paNXdha2g1T1RtVStOY292K1UzYmlabWlqK0s4?=
 =?utf-8?B?b0NhZkY2cVgzUHZIZFVlN0Z1MGhHdUduV09VaGpLbUJtRVVVbmRhMi9Tbytw?=
 =?utf-8?B?aVYxQlB1QURhSEFGVUNScmtONERRaDZHM0ExdkhrK1VXUE5aR3NnZ3Rmc1dX?=
 =?utf-8?B?RzgrOHl5Ylg4OFlucnZRaWVRUjREbG05Uk1EWXU5NllZYjZ1VEF0cTRJN1BS?=
 =?utf-8?B?aE4xU2d6SC8wbDVhT0pYdWRYOUpIYmpIS2F1WHdFUmc5TzhzMDdRYUgyUXRH?=
 =?utf-8?B?dWQ4aDJKSWF1ZnJ1dEduMWNFVGJzT0hkaDEvdm1rRk9Xd3FLaUg3Qkw2bkdk?=
 =?utf-8?B?dWg2UzkwaFZjKzltcG9HR2VwdTdOOSt1NnR5QVYydzN5N2hIV2NaWlBNd2hZ?=
 =?utf-8?B?Mm9QK3RmSHNvMmtrMWZETkVXbHBXYU5USUhQRDd0SU1BalhzSXNWUm5BQ0E5?=
 =?utf-8?B?UWhzL1NzOTF5ZDRwNjZaOWZ3djZjd1JzcTNIQ3lFcmlsTGpJaURobHRtc1Bu?=
 =?utf-8?B?QzdHU3JnM3E0bTBiWXZrVjlWeWJuZmNFRUxabDgzQWVMVGM5b2RVcEYydHJk?=
 =?utf-8?B?dFZiUU9nKzM1dmlYRkJ0UHdhTmJwMWFQa3JreW5Pc2pWY3hsdzBsdjdVWW5N?=
 =?utf-8?B?TlMwNGk3Ukdod0d3VWxQYmtxR1Q2dDh3WjdMc2svdDNaWHhxVnNXVUZIYllY?=
 =?utf-8?B?RVlCd1RudW5oRlRsbWtjYUJuUDd5eEZ4WHVsTVF3MHRBbVF1WnhYczNQQlV3?=
 =?utf-8?B?Q050bENsYXU2MU1ZYlhPR0pWYkVLcE9oK0JPbElxREo1b0Uxb3NUSEVDTU5J?=
 =?utf-8?B?ZWxVRkR0V3VOT3N2Mkw4YTNsQ3ErbDcxOElzSGExd2VST3NvMGVzTCtiNU1Z?=
 =?utf-8?B?a2ZiQ21CYUFzQXE2U0dXVmwrQldRQzhRSDZwZjdvTE1sTndYU012VlFCaVJ0?=
 =?utf-8?B?cDNIdEdacW9xbEx1VXpySm5qWFZQSW1QT1JJOEFSelh2eG9nb2psR01LSldG?=
 =?utf-8?B?emRua09EUjJEQ1RUOFUyemljWng2c2RWeDNQT1kvNzMzbFN0SW5LeVN0My9Q?=
 =?utf-8?B?TGF1L3R1dVpaaEVVbStLc0RzVnQ5V0twd25iK2lFQjQ0bmxTRTJYWkFxVG1L?=
 =?utf-8?B?NVAwdnhEVXZKeGs5ekdqaUh4OURnOW5DUE9Wb2VGUEdYN3QrNWdSeW1UVGgr?=
 =?utf-8?B?Uk5RUGFIaW5sRWM1Ri9OaDlQTFZ3WFN2ckFZRnVsU2diRytPMHNwcFJZdVBO?=
 =?utf-8?B?RWdCSUhTSzczbisybW9aaVlmanowSnRRa2UvSHFuVWcxamZHeFZvbWFJb2dh?=
 =?utf-8?B?dW90dWlIcEYyMkh1MEdtSzJrUUZuUTFTRlUxK2ZWVk93d0VpNVZ3UEREeW8v?=
 =?utf-8?B?UzE4MXhtcTU0TTZOeFFJVWtNdkQ0TG12M1JycjRmOXBaTWh4bUxnS1BZVVo4?=
 =?utf-8?Q?ehQ/qXo6DcYoxQLTfUw26YLFm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d871c2-85a5-4934-71b1-08db23943d75
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 07:26:19.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7q7M71tAwQ3usmD2Y/JEUuXvEBnfPwhRniLa7eBxKdkQF7PvSZBxV8bMSozId6GA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236

Am 13.03.23 um 08:23 schrieb Christian König:
>
>
> Am 12.03.23 um 08:54 schrieb Huang Rui:
>> From: Chen Jiqian <Jiqian.Chen@amd.com>
>>
>> When dom0 is PVH and we want to passthrough gpu to guest,
>> we should allow BAR writes even through BAR is mapped. If
>> not, the value of BARs are not initialized when guest firstly
>> start.
>>
>> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>> ---
>>   xen/drivers/vpci/header.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index ec2e978a4e..918d11fbce 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -392,7 +392,7 @@ static void cf_check bar_write(
>>        * Xen only cares whether the BAR is mapped into the p2m, so 
>> allow BAR
>>        * writes as long as the BAR is not mapped into the p2m.
>>        */
>> -    if ( bar->enabled )
>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & 
>> PCI_COMMAND_MEMORY )
>
> Checkpath.pl gives here:
>
> ERROR: space prohibited after that open parenthesis '('
> #115: FILE: xen/drivers/vpci/header.c:395:
> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )

But I should probably mention that I'm not 100% sure if this code base 
uses kernel coding style!

Christian.

>
> Christian.
>
>
>>       {
>>           /* If the value written is the current one avoid printing a 
>> warning. */
>>           if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>


