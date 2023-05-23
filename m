Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEBF70DBCF
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 13:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538445.838387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QaM-0001uU-9C; Tue, 23 May 2023 11:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538445.838387; Tue, 23 May 2023 11:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QaM-0001su-65; Tue, 23 May 2023 11:53:50 +0000
Received: by outflank-mailman (input) for mailman id 538445;
 Tue, 23 May 2023 11:53:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1QaK-0001sm-JL
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 11:53:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 797224ac-f960-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 13:53:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7837.eurprd04.prod.outlook.com (2603:10a6:102:ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 11:53:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 11:53:44 +0000
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
X-Inumbo-ID: 797224ac-f960-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXIT+p+J4E81pHA1C/LyVfCnhveF06wmpr4ZCEfdE6621WMKURKdVWAmYK5Q4j6l6Gk7f6JAePzCLqkAqt0jY5DvLHtboTANfSM/XcZ2uavex8/6DDra8wHCfJmUsroiK9rVIDmQVa3LmMV6NgUMQqfcGVweQKhm4AGhc3kzTrTJGsn5ULE8c5tvbOkSczNjxb/bKiltTzykiPgg5BXKyR6iFtsTvg5j7WpD0esFDmQ/IDL7XzJ/QzgAJxEnhxyUuci3g2EEXK3rcCTTf2xjnWwjS5CuYKADzI52BgGqMCk/zqTsp5abV8B3Ntsupq9+nfC8Yj7UmaxlxNcSh2Z8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4R9vTKK29xbkNvEcb/+VwLUjS5BdIwWFLBXFrldruko=;
 b=dVPdvhC7mJ+f7KHEnbplearwIlBx+nV31Ih8nl8Jzv1y+WqE4XiYz9sAc5tWCZb6oj/q4NsZfwn++p4m6tB1sI1258VgB7GWSGYN6YWogzMzKiT8D+ToOqZGuNY1Q13RpluHv5miZqRUtf6GkfyE+zQ0GRBvOidWs25p6EJayFhC8g3c69LTkGfDOws9NkWjGoxWKt6PaoCMZgK0/ttQDILY6BLqTVKRzq57RNv3xA7SeyYfUvOgYhYx7vbstw9/udiygbTKNTaqmEFLJ/2cZViWYKm8FOnjHGxg86LdCHYAGIeUI1TWV7iEBfWj8mtnn9kIMYR3NxcGPOcJBGcDcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4R9vTKK29xbkNvEcb/+VwLUjS5BdIwWFLBXFrldruko=;
 b=zAj2GzM0DjsXSCexXlvMr0jjVJWHFv4tAYoWOlDnowqSHfckOskDuPHsZlVPh6/iRuYX5D0jyCmU4nAEBQHSvjYH82RA4dlPaysNdFmwq6+MmIC6m8xlizu1jwvmJoZL2d2iFO7vRuVVU1Kx/8I2CONzVkVfenIOWWSx6J1cl54Fqf0gc9OmZMeXTVAzbzRCPHWbZN3dkhjC9Gj3VIKqp9b8DBKVqk6qcj9SL3e69lFezOI6/RVKhfDWbpE55emj/dBYnpCeoo2Rbeq02pfNUCRUylw/0f/qsrAGA3fa0T3V9MvBG+i+4hXsZTuBCYyVqqjTwUWYsssiADR6CTHJmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d86d3b6-3ce5-8d25-abb9-4c27b592647f@suse.com>
Date: Tue, 23 May 2023 13:53:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-8-luca.fancellu@arm.com>
 <48722696-ea22-1af9-2a0a-aa78972d118a@suse.com>
 <6DEA0CC3-C3EF-4509-A869-807CE4B21401@arm.com>
 <767b11a1-4d43-9057-1fcc-6516fea64fb3@suse.com>
 <45285215-4528-435A-B203-B770D60FABAA@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <45285215-4528-435A-B203-B770D60FABAA@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 0581ef38-621a-440e-ba35-08db5b845b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	93RFR8TxKzjZ1Te5yEmfvJ7JYFtWKx2pq7ZI9XfzPLTZ6YPz8dISufnZ9uOhhXYKqTNYSiHgCszJ5BD2Geuz+JIdZcdIGoh9/rSQRKgeeWb0mo2wNkXoKg9TpjCNGTqslv8CFtI6wwd/JVG7GnxWKcejw7SWvhMi4LOIpoQv/FwJOp0H7wzOmiz2e4DEI8AEo7z7xtLX+rcM3uoJxNE+pFAQRdWh0f/WRdXhSQIsHjjhswPn15eqGxmU7ORosliKHlUIS+8bHIynbHVberLB5Q/u1LNcybgdoYsHcRQ4aMMBtYYPbZu8VaeLLwAbk4NYN3l+nvGFTZf+PESsVVDLIGRJ1qYnosk7DqCWRQdg4lsrRGu6Z0iTYgaz638B4/V2T678EPsSkwA/MAAZShenopA5bBmSKgigDpSm31lJTPBarV+GKUC1rI2VnTTxBVnvHA1BRimWXWiniucOW5M2vsDw6LAvZjIQo1hHU0j2dGD7PNtsmIaW3OV+9YkxzBIidk6J6lL2jUaW/fDegQt/s+IhfHRQUFZfONXSl6ZJ75cc7NF+deCietG7Mk1uybN5ruwP7Lx+0kqupHJZ9qNXOgTWyyDSAEoSFw0uvJTsOyuAG3bf24lbZeYKhw8pcsVgeicfpKpl53HJwF/J+fPb+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(31696002)(54906003)(38100700002)(41300700001)(6486002)(66476007)(316002)(6916009)(4326008)(66556008)(6666004)(66946007)(5660300002)(8676002)(8936002)(86362001)(478600001)(31686004)(7416002)(83380400001)(6506007)(26005)(6512007)(2906002)(53546011)(186003)(36756003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEVjclRPR3ZYaG9BdzlYaThKOEZMTjIwL3JJRnYwUzBBbkVLUFEwZzhydWRX?=
 =?utf-8?B?S1FVbmVyUHNxNjFpdlZFdk5sVm5FZnV6NHlONlJEaU9XWVNmSVMvTkgvRkdL?=
 =?utf-8?B?TkN3d3Njb1RoQnhKOFRxWE56ekhkZ1NqTjMvM01rOG5FMjVpakZhckt4T2JF?=
 =?utf-8?B?NDd0RXpVOUkySE8vWkw5QWlScTRHei9GaTRteGg5YnlEVmdGaUNzN3h3ekRi?=
 =?utf-8?B?bXRidC9GTVBCU0JwWjN4alovVVVPMlJRQlJrRFF1eFQwcXZNKzdxZ2NPOGN4?=
 =?utf-8?B?Q2Rick5MdnB0ZUdvRC9XZjZsMXdkWjhJWHFxNTBEU2lkbnFybkxCUHpEenlQ?=
 =?utf-8?B?YXhYRHhHSDFXbUMvb0I5TUZSdmlPOVBpVjZHUnBkZXFxbHViZjZmR29JRXkz?=
 =?utf-8?B?aTI1NVZWWE9yZksvQU1hWkhtYjhadEJ3M1FWNkdBZzNDMUpteEdocjJ2TVM5?=
 =?utf-8?B?c3Y2MldtL3dadXRnSlBEWFYyS1FIRWx4bnplelM2TXpzZ0pSRys0Z2pIb2Nq?=
 =?utf-8?B?Zis2MVBoSkFaVEhBR05wZzY1QXd0Vmg4SUJLa2UzcnhVQ1RrdTRFY1l2Ympp?=
 =?utf-8?B?SmEvRThzcERQSVJHcWVINlJhWlRkTVZ3U0tYSmpyWXNsdXNQN3pNbjIrN29m?=
 =?utf-8?B?UTFBUmd0MGFSMjZaVTNDdjRaNmh1UmVmVHlkWGhhcUpBYUtMTEZrSWJ5a1Nu?=
 =?utf-8?B?VGl6SmhJQWJsbURpcDBLVUpTWnRWVXVXV3c1WUM1MkhoQVhIdXZNc2NuUXF3?=
 =?utf-8?B?eFFhTFAvZ3lqNGI4S2ZXazErUG52YzFna2ovUnRSTUhxSk93dzZQVG1EUGF0?=
 =?utf-8?B?YmNKOEFrNkNnTTNrM3RDbHFBSXNrRGtUZ2VpNnBQOEZWMldmVEZwRTRDY0d3?=
 =?utf-8?B?NUZEbmhXYUgvNmlkd3g3Q0J0RzliQ1FSMHFjNHBkQklHKzVDaHU3UldlcTZB?=
 =?utf-8?B?WEEwYjBtZXdPR0l3QWk1VkZwb1ZLZnU2NDhBbXptWUJxQmxDTktRdVE1ZUJG?=
 =?utf-8?B?LzRrdk9JREo1TnoxNTd2WnErWG84dnBwRHpIK1FIV3dncGlMODJxaHNlZGtG?=
 =?utf-8?B?VU1TcnRRRVdjdi9FM085a0pGVjg1NkxkNGc5cnlWNk9OTmsxT2U1QWtvTGla?=
 =?utf-8?B?WU1mSCtYZnNrWUV2UHRiMmMvelBIUXlqOFY5YTJ3RE9sQTZZcHYwbXV1M0pE?=
 =?utf-8?B?VkthZmNsWWZBSm82bGowcEt3WXkrYUoxSjAzNEZmUmp4bmg1c1dLYitoMGpW?=
 =?utf-8?B?cHk2UDlzOExVWDFmWWE3VUpPYzhRbi91eVBSbUUrNTFsTjlxVzR4a0hrcmRT?=
 =?utf-8?B?eHRHYjZXUm5uSHQ3QVlCRmc2emg3UDl2aFI4VEJWNWs1UnBqTm9KNFlCOURT?=
 =?utf-8?B?ZkY2WkFqNnFmaUJPTi9ZTjdRT2Z0Q3U1aGc3a1p0a1Uxb2l0dHVicW9EUmxx?=
 =?utf-8?B?N3A4cGR5ZjVXT01FYmdqZ003bk1HbFA1amI3UnRpY1dRMCtuckprK1R1T3FF?=
 =?utf-8?B?UGV1bXhFQ3h0NEVWMm54ajI0S1YrU3hhRDBIVzFveXlSYUdNSjVZSmlibXRk?=
 =?utf-8?B?cmR1UVJ6K0JHSjBlT1R0dUhRcTR2NlREcWJDakQ0VEJOeFV0S3BicEtuMDI4?=
 =?utf-8?B?U2QrUGNQVVdSeXI1bDU4WStsM2V1cTJYUVRpcWdGK0VhNTRWSWtmblY0bzBY?=
 =?utf-8?B?Z3Jaa0RLandMTFlCczdzNlVXUC9GbFMyakZVUXNYZTFJY0xPQTRybVpFdkFl?=
 =?utf-8?B?dklCOFFIMlVjaysrNnhQcjl5eU5oa1F6bjNMc0s0MEcvQmlxdEhPamlTN3Fa?=
 =?utf-8?B?OW9vVDdGV1YwVmRwZFV3WnJaS0RHZXZpNUN6MEVOd29JNXo5K0N0WHZwYXJQ?=
 =?utf-8?B?andwblJBMTdhVGFMNSt1UGJwNFRRajR6REhmTGtSajg3QjdLSXp0dlNST3R4?=
 =?utf-8?B?TnVlajltamxodFFPOUJ0elk4cnRRbVNWcmZvWFQ0YzZHcnQ3U3JWNUdWbzRt?=
 =?utf-8?B?VjNIQkRHZHByTG9tZXo0cURQNHdjMGlTS0VIalRwUHRkbko0d0RrU2lJQmRO?=
 =?utf-8?B?U21QZWIxc1BYMlFIOWFSQjJLTUx4dlpOYXJRa1hXTjBNZkdJakxCSE5iUVRr?=
 =?utf-8?Q?l58h+ksEArohkyjfSkKhu/2Ca?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0581ef38-621a-440e-ba35-08db5b845b64
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 11:53:44.3918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RL9mtMg2c7CZijh2UJZViq1X2N58WhlK8ZIVF0BG7Wot05C1pjGu3cEwy9h0FzJw0YECcsjdlJCTg6QlwX2WgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7837

On 23.05.2023 13:50, Luca Fancellu wrote:
>> On 23 May 2023, at 11:31, Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.05.2023 12:21, Luca Fancellu wrote:
>>>> On 23 May 2023, at 11:02, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 23.05.2023 09:43, Luca Fancellu wrote:
>>>>> @@ -838,6 +838,22 @@ Controls for how dom0 is constructed on x86 systems.
>>>>>
>>>>>    If using this option is necessary to fix an issue, please report a bug.
>>>>>
>>>>> +Enables features on dom0 on Arm systems.
>>>>> +
>>>>> +*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain and sets
>>>>> +    the maximum SVE vector length, the option is applicable only to AArch64
>>>>> +    guests.
>>>>
>>>> Why "guests"? Does the option affect more than Dom0?
>>>
>>> I used “guests” because in my mind I was referring to all the aarch64 OS that can be used
>>> as control domain, I can change it if it sounds bad.
>>
>> If you means OSes then better also say OSes. But maybe this doesn't need
>> specifically expressing, by saying e.g. "..., the option is applicable
>> only on AArch64"? Or can a Dom0 be 32-bit on Arm64 Xen?
> 
> I think there is no limitation so Dom0 can be 32 bit or 64. Maybe I can say
> “... AArch64 kernel guests.”?

I'd recommend to avoid the term "guest" when you talk about Dom0 alone.
Commonly "guest" means ordinary domains only, i.e. in particular excluding
Dom0. What's wrong with "AArch64 Dom0 kernels"?

>>>>> +    A value equal to 0 disables the feature, this is the default value.
>>>>> +    Values below 0 means the feature uses the maximum SVE vector length
>>>>> +    supported by hardware, if SVE is supported.
>>>>> +    Values above 0 explicitly set the maximum SVE vector length for Dom0,
>>>>> +    allowed values are from 128 to maximum 2048, being multiple of 128.
>>>>> +    Please note that when the user explicitly specifies the value, if that value
>>>>> +    is above the hardware supported maximum SVE vector length, the domain
>>>>> +    creation will fail and the system will stop, the same will occur if the
>>>>> +    option is provided with a non zero value, but the platform doesn't support
>>>>> +    SVE.
>>>>
>>>> Assuming this also covers the -1 case, I wonder if that isn't a little too
>>>> strict. "Maximum supported" imo can very well be 0.
>>>
>>> Maximum supported, when platforms uses SVE, can be at minimum 128 by arm specs.
>>
>> When there is SVE - sure. But when there's no SVE, 0 is kind of the implied
>> length. And I'd view a command line option value of -1 quite okay in that
>> case: They've asked for the maximum supported, so they'll get 0. No reason
>> to crash the system during boot.
> 
> Ok I see what you mean, for example when Kconfig SVE is enabled, but the platform doesn’t
> have SVE feature, requesting sve=-1 will keep the value to 0, and no system will be stopped.
> 
> Maybe I can say: 
> 
> “... the same will occur if the option is provided with a positive non zero value,
> but the platform doesn't support SVE."

Right, provided that matches the implementation.

Jan

