Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DED06BAA83
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 09:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509930.786696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcMEU-0007gD-5N; Wed, 15 Mar 2023 08:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509930.786696; Wed, 15 Mar 2023 08:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcMEU-0007da-2a; Wed, 15 Mar 2023 08:11:38 +0000
Received: by outflank-mailman (input) for mailman id 509930;
 Wed, 15 Mar 2023 08:11:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcMET-0007dU-76
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 08:11:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00ecfc9d-c309-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 09:11:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7455.eurprd04.prod.outlook.com (2603:10a6:800:1a1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 08:11:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 08:11:32 +0000
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
X-Inumbo-ID: 00ecfc9d-c309-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpQO1AmBSDetmXfFkQrwy0het9kE2eq2yJgOUcakKp7uL1VZJlgDDUnSBPFYWSC9pjwV7o4V6zZeMbPh8kLb3LkH1jEjuYki+ncGIjTutQ6RaKLcNHajRxMJvruzOconoTkTs5UPl6tP1+bFuys9KsnqTD07AvyrG8ca5n+L6dJGF3JP6jRUGeKuKOMiWfrZw5y4VOgOuD08oBn/911Yv5LpxxfNdfZUZp61N8ABOzfKo4W/de3kf1hQ5hhhQ60ljWuMOMPgS1Az0OaylSYV/y41nZKb/ta8m4MYCegKVRBeApBTiRQB4ImLxI4QW2A12FxCIfzbAYISN/SC1PxkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NQ1s6Vz6UyvbjRa9SUulgb5pGoJNY8djioTW0ji07g=;
 b=DjbekNmydAuD/WfHo5gVkWXIwJ3dadzIQ/6IkOIxjCP9e8t36aFDCMbwujQ12FTChFpWSp6qsjzTPYXdFIY0TGBNJZPKRW13P5z8S9GfhMWUol1VwNN325mtan3+5+qDQyiXVCFTKc9yV9UC+0wmr9KoXsgPoxHNlUu+Bum9WJItPc6VLAtYIGhLzZIJfd4jnt/y7eej3E8darZa4kry6dKHeX9dOYIM3Ve6TiJcWoGWrmN2Bb8n3a20hHvsxrOgl/fX31nInC5pWg9epP+YQlet2PPsPAUQCvVANxDt2VYXfiEKrAm06M7brJsJqRA2ucFjUQrF2FurZi4e0GOrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NQ1s6Vz6UyvbjRa9SUulgb5pGoJNY8djioTW0ji07g=;
 b=CmaFzPg8/OquwMRF6hcF1iZcDwgl2X5be3cAWX+xrj5BxtkXL5RxmXIz+CwLy5SKdjWHXKVXHEGYb6haoA6N6g+nNxTSAJAMOQuSz7dRqo8txIfg+q4kRp2NO3zlS4TG0dBY1gg0LmOU5/tSXYsiLugvV/POBsGMX+QvtZcYY+DLafXc0UioRldRtW11R10QlNzKL8b8qbbvgM2zJ26b17ng6MvS7B1foKEM9b3vygMhNW/IO56WSydGVi7PGc/VConOy0L672a9aaXE6/ekGj9YZOVvRkb63zvWYwYH9hm8+962St3y80uII2cIBIfsuAJrzjC1vZXV2yuUE3pInA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4413b647-2721-4b1d-2fa9-afbdc163abbf@suse.com>
Date: Wed, 15 Mar 2023 09:11:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Aw: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from
 Xen 4.0.1
Content-Language: en-US
To: Denis <tachyon_gun@web.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <40da0146-21fa-d5a9-7ae1-4ed2cf4a5785@suse.com>
 <trinity-720cf1eb-48bc-4eba-9e14-e9eb570b1e7f-1678812331526@3c-app-webde-bap40>
 <805f8cbd-e6ce-85bb-7ad6-3c461fc41c07@suse.com>
 <trinity-4a07ad86-ea5d-415b-b8cc-e9f0289e1a10-1678820997547@3c-app-webde-bap40>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <trinity-4a07ad86-ea5d-415b-b8cc-e9f0289e1a10-1678820997547@3c-app-webde-bap40>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b58004-bb14-4a5f-4af2-08db252ce302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aFDCmVpHBTXB2PY9X/c3Rxs1TSKhxc8O/pxJn9fvKhCFZRxJC9aWM5NK70rPSecrSujoFowjiY01OEGKldXEqJTQUGcAuSQkvZghx98jzh716l5x5PRSNgvmO0yi26fUCnYJusex5dN6AR38/vvLVcPY4+m5jI4T0C/T2XRJbPaB7cwPaOkXf9a/hXn7nWSdrwanyMccCSnBSeVtbTfVhYXQn0naccJkEs+khEfYD3HkWELOXvUGRXHRw8zUGWMJ7DoESD5j3poiPOGHvC781hf47Vqcl2XTLZow7TF03BeiEBbX2juiMj6ZZACr3gs8WEdtwULdSsSa8MwVQHpNlFbw9E+pjiKGIo8oX+P4GL0rSaGZy8aAEH3BE4WHGSpqJ73f6D3m3b4cSmTLTOl+iwKDKNYdjwUbr6JtLSq/YL9RBQqrtniSoCvmQZmhVbkNpTkuUiyxTmFyxIqrm7BdkS6zCUeK0TBcdbVVrLn6wTugPPNa2M2EWT45w+AN4JpCgnsq8J8HE1b6M4Z1zFW4spBRODkvWvsjKKU2hyN5ejJscapxww420OlfEEqQ2VrrrRuMRbdHzRWAls42YBPIF8wMy54ebISopx+dSpfYOillFl+fgQzbSaShIL313kWjqXxpszIUCxg65pWDzJNg7All5Xtcl3g59EiXBHa0gndpgQQTh9Bl23VBITpIbU67TFEGjmS7Z85Wwxx+i9L7EiD3u5FPZoRwyIBw1tUAQsw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39850400004)(366004)(136003)(346002)(396003)(451199018)(2906002)(83380400001)(31686004)(5660300002)(6486002)(6512007)(36756003)(26005)(6506007)(2616005)(53546011)(316002)(186003)(31696002)(86362001)(41300700001)(8936002)(54906003)(66556008)(66946007)(38100700002)(478600001)(4326008)(6916009)(66476007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFJrY0J1UWpObExSTU1tRUp6LytzM1JPUk1SU0FQNklXTlJXbHkwZmRGREpu?=
 =?utf-8?B?UXJKdi9KNkgydWF6UGMycFZyenEwRzdNZmZsdDZDeDliMm11T1Q4ZjkvTW0w?=
 =?utf-8?B?Z2dMQ1FkOHB5eWNxeGxUaXdzQmdVcWc4aHlQNHdxbWI3M09EVVNnaG9jM2ZL?=
 =?utf-8?B?a003UEdieG96ZnAwS2V1QXNwcmF0aktvOTRkYVZrUmxVT08zQk9YRGp2WFdP?=
 =?utf-8?B?WU83bXMzWmk3MnlMQVQ3Sms1cGxWUHN6VStiREVNTlFhMnhQamMrL2prQVln?=
 =?utf-8?B?dXZZTUpoTnFtWUp3TGFEQlFaTHZjZ1dBZVVGa29maU1ERnpDZ3BvcUhrK04y?=
 =?utf-8?B?VkhndjFVQm5KL21Gd1poaSt4MkdXSzJyVXJSZElQUnk0dTZ5S1l6dy9ad3Bn?=
 =?utf-8?B?TVJzV1pOcEh5VnIyTUQ2L0dzUkEwUTdvYmtVVWowTWF5dWFBdm8wekJ3eC9v?=
 =?utf-8?B?NlRXRlI4L2djUnNsbGhObjMxb3puUlRzYVEyT3lua2hkUTJPbmRncEphSUg1?=
 =?utf-8?B?bFpHWVI3eDlYVCt5cXNDUng0TjZicytSTU5sRVhKNDNTNHpZRkNnMGFnK3Fp?=
 =?utf-8?B?YWs4L3ZaTkhZNUxvNWJ3bFJtN2ZrNGtXenhySUZLdGhldkhhU3R1NWxwdkk3?=
 =?utf-8?B?dS9PWHU2T2tpTFB0RXFscEpodzQ1ZVE5bFRwY2dxcEtRU1dQN1RUdWxjMHVV?=
 =?utf-8?B?VG5tVCtjWXhLV2grYlZPS3dlQng5ZDNaWWNaTTBSVnNCUDBFVFpwemI5L1Ev?=
 =?utf-8?B?MlRseWpRRTZBc3ZheGI3bm5hWmdLWUFhb1J1d3F5RWl6RFNlbzVSZjFWS2Z5?=
 =?utf-8?B?U3d6b3NVS1F4RXF3WDBZRlE1N2d1b3VEbDFIQkFhUUtmVVFtL3R2REJXL0dU?=
 =?utf-8?B?ODBtSnQ5WlNwekp0eUFHUkg3bmV4RE1xZkFmNUR3MWg0NFV0RS92Sk9seDhj?=
 =?utf-8?B?SmRSNWpyRFgvZ0tPS3hDcnB2TFVseFl3TjRoNEhqNjRya3RWZWRLU2svZ3U4?=
 =?utf-8?B?OFluZGNEc1ZSd2VXbHRpWjk4Vkp1MUVUTk9DcDNUa0JJcFRsQWEvcEUzbWlR?=
 =?utf-8?B?RktRN2tXRGMySWFkOXNpVnVWcmtTdzFFVU02MVp1RVV0cms2Zms0WSs2a24z?=
 =?utf-8?B?ZjFvWmVtOXVwaW1SL255TkdFTmlNRzc3amZpNkowZFhHTjBMRW5JNUZRSVFr?=
 =?utf-8?B?cFdFamtTYnlHaFE1c1pkb2ZIYjU1bFVZR3RUZGxPZDA0UVNkS2l1WmE0QVEz?=
 =?utf-8?B?R1RpdUREaGg4T1Z3MWFZVHhtMlNLMjFTVU14U0I4ZU9IaFlGdVRaSjB0WjlC?=
 =?utf-8?B?cWl6RW9BaENkKzlDUGpRK3VGK29uS1Z3NTAvYnlLZFhCWElWTUtiVzN6bEkz?=
 =?utf-8?B?WGpnYlJaYTllZzFteWVDTlpmcjg5OGhXbU1SL0lTUXhJMFREdk1SdDV6YmNG?=
 =?utf-8?B?L1FFZFdJc05oOVNPdzBlSSs1Si9FWERyS0V5cU1SRWZRTXkybXhmWmc5MHM0?=
 =?utf-8?B?QmNMbG51S1hqS3JNOU9LSTdicVFORnJHN3BhclNWWkRWbG9qNW9SSy9kQnhl?=
 =?utf-8?B?cGYrcktad09CWENHS3BXbGNISjZSRnVGMHVYSmQzelFMU1RMdHE2dGFTbmxX?=
 =?utf-8?B?RndXQ0VlRm9sbTVzU3V1RnJpbXhWNys1c2hvc0xCdmQ3alhMQzN3dmR0YXhn?=
 =?utf-8?B?VDVGRWpRRXVBRVR3Uko3UW9nd3prWlJsQjQxcU9OYURKZTlRUzVFVG54UkIx?=
 =?utf-8?B?RUprc3lHN25iSDg3L3BrU3hYcXNkU3FOWmlwWUhGWTdhNTdyQ1hRQS9laFJx?=
 =?utf-8?B?V3pWNC84aS82eXo3SXd3Q2NaRnZ0YlJJRVIwUnozSnpjbks0c0NjendRek1K?=
 =?utf-8?B?Y1EzNTZRLzNCM202ZEtuTzJXb2w2bUFsd3FHckpOSVNLN0xvbkFrcGNOSjFM?=
 =?utf-8?B?Ym1ScXB0UWhteUVpUkJySitTSVBpRFVHM201WlF5b3BiOHVXR3FHd3YxTkI5?=
 =?utf-8?B?WmVocnpDcDFqQm0yS3Z3eWdIazZvNTR6dFpjTFNic0J5d2x4dVFiK1VpdDRX?=
 =?utf-8?B?QXlwQ2dmN1U0V0g1ck0yR0F1UXhvSURhWS8rbG9HRnhaWHFnVFoxM0ZLSG5R?=
 =?utf-8?Q?hA6bjcKyBj0bCwrtJtFHRTtZU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b58004-bb14-4a5f-4af2-08db252ce302
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 08:11:32.1830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cjc70G/eQJTsDhQ7vxeL2bOsRcp+OQxw6d1udn25n0pgDh3GoRnUWc7RDkWGv/6dqKkpRy/fpARwnUrBPPoCIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7455

On 14.03.2023 20:09, Denis wrote:
> On 14.03.2023 17:59, Jan Beulich wrote:
>> On 14.03.2023 17:45, Denis wrote:
>>> On 14.03.2023 16:37, Jan Beulich wrote:
>>>> On 14.03.2023 15:53, Denis wrote:
>>>>> What tests could I do or what info should I provide to help?
>>>>
>>>> Boot plain Linux (no Xen underneath) and collect the full set of kernel
>>>> boot messages (some distros store this at /var/log/boot.msg); "full"
>>>> meaning we want to be able to see all output regardless of log-level.
>>>
>>> I'll attach some files from /var/log.
>>
>> Thanks, and there we go:
>>
>> [    0.121463] AMD-Vi: [Firmware Bug]: : No southbridge IOAPIC found
>> [    0.121495] AMD-Vi: Disabling interrupt remapping
>>
>> It's 5.10, so somewhat old already, but from looking at the code I wouldn't
>> expect anything else with a newer kernel.
> 
> So older versions (be it Kerenel or Xen) didn't look for a secondary Southbridge IOAPIC?
> If so, was that a change made due to the vulnerabilities in Xen due to passed-through
> devices?

No, both Xen's and Linux'es commits clearly say that one of the things
observed non-working in such cases was the timer interrupt (which in
turn would prevent Xen [or Linux] from booting successfully).

> Just asking because age-old distros worked as it seems...

Except on certain systems.

Jan


