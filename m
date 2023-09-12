Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911A79C6DB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 08:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599927.935547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfwmQ-0002SA-HJ; Tue, 12 Sep 2023 06:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599927.935547; Tue, 12 Sep 2023 06:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfwmQ-0002PP-E3; Tue, 12 Sep 2023 06:21:46 +0000
Received: by outflank-mailman (input) for mailman id 599927;
 Tue, 12 Sep 2023 06:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfwmP-0002P5-4m
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 06:21:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20628.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4e343ac-5134-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 08:21:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7478.eurprd04.prod.outlook.com (2603:10a6:10:1b3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 06:21:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 06:21:42 +0000
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
X-Inumbo-ID: a4e343ac-5134-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kk3FVni5ifJJowh8I/zRT97nhJQLrNaG+HwLTyv2TrjXQmcTlWiCgvpgx/Mezo0UqXW5VCFB6ONfeOuvtYBjdrToUI58maZvdG6a+9Y5Fs6GryU0IWVV1d+teDUoT4KKiE75mv3rT0vNG1iYgcXd1v4FBy9O+OQJgy/Hsnw+W0SbMqsqg+F+OkG3JvRRrsK77QFGu2Cf5vZQXgjMusD8GMSErkS0DtwJTiBVsTvaLA/8eD6wflFQC73X/omNrrehh3RZD+kF8kKK4MLDQWk6r4W8gsbtHMbCz3JmROnokXQT2qOa+/T7zbu3zecI8EeOpHQkZKI6c7qzNVKw2r82Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3SFTE221xjv1D1TwK+mR9sF/EsW1NJXRqOKIVnDpto=;
 b=EdfeB3+GaCE98je45a4iiN7xxYNZqRZlcw5Xru359WtKd6805GRSs1lpbCj/3BhamADK+Z6QyA9yWTzfqYmSRh4UYvORhI1Gr5XQkuMm5hGcVT19zvNgMKK4VAIwi+Uz6bUuMS7uS19gUQRTSJ+YR/l499krZGDEpAH7/WT8Oog8bXu14OAdOhvQ5+JXTACSyc/ZdE6PLylbD/XZjUfHPxwVrgLzPCcmNfc0noQ3HbFLKqs49jxKHziymlUjjpoYbUsqYE8tTqzLIi8dP+BVt1Dqi+hwQ7fjQHKl89StGuEAGwj8j0J/4Ukpl0FrdokP/RC5/1HfOuYEaVAFhkZsEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3SFTE221xjv1D1TwK+mR9sF/EsW1NJXRqOKIVnDpto=;
 b=RQhgQV8monbNuBkaG5F0sO+XcDyeOFv7YwWMTxOU54N2SYo33+bluOcIsLcln8z9jNDXsqupsfGn0C+fObqP8DVVezgGd6fvpJ36GLhwB1J6bUiCVxVV7spQ4y5/b7XDM9OWK0KkejlT4DrJXSvrANuo/EFkTSFD+HqpcPUK9rWjn9WazMRTXiU07eAh9zkTnxep+dVT+6e+klTiJ3G1Q4SivNE7/iHgmmrgU3S98tjGjC6EMEQfwh0Jp9T2OvpXSS+4c8psRFN4E5csCthDhaCIwIsJtGsC9MF358Xh9iDO+pb3V7d/Nn5SM/wXQQTBhk7LnjiEO9rODdditvA/gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <497c7d09-e5ef-96dc-5740-9163a94a79bf@suse.com>
Date: Tue, 12 Sep 2023 08:21:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
 <29A9BF11-7ECF-4C3E-9D5E-9D44E63A297A@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <29A9BF11-7ECF-4C3E-9D5E-9D44E63A297A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: f58cccec-51d6-45e8-87de-08dbb35887c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0sBw6g8UvbyD83HiumeQQjmCu6Oa/d+4zjI5RzZSyZDg0QgOSTZsMjFOHKyfOew9Nj9Uodl7H0FxfSlHbydnTgwwtYww+D5ckaiAOdJrQ/gYxRqZuJCqvEJd/vjeXgkkr5yFCTUHNtLgmb89LhI9a2l8Xnm4Poz0BfZHr7egH1JTl/MXC0F4qVOIRxrsx0825z6X/pyUUFstE81IyM2m/zHRYpPyguBd0iC3E91rqldu91vVRRi+9wLl8CcFKHw2AF4yFA+a1eYXOa7Brr7fjCdkiA9mgOIDbSeT2eYM57iuXe6yIS8HA/0wB9mzVS81OdvlwmpsAqqWxrScu45EQLVdmgb85AqCnbwwWE2fHf4PKMxlZM6EuPIvigtrOXWe7JB0a8HJZjxH6XgggjaYg9JtGG9K431Jhiz8JvxzF12Qec3wLUzChHAfP/WiOPMx19vmK/Cl/tOFpjCMDfRElWO0s8lHm1zuUE77QOaBEJybEm0TwxmkJx8kZxzuYmvjSYeAYpUjnbBrpmOiRX7Qrn7hT+xvOE6djCi+44hy6936n1Cq0K3CzoPjUhHL0bc8pZBS3HJBLKzB+e2m6AhB0Gd1GypN7EHVSyvoJe2Q53H5cFVQpd2T1gKZT1IzE6+U0Azn/fB/+2U5S/+tVCtwLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199024)(1800799009)(186009)(2906002)(26005)(41300700001)(66946007)(316002)(6916009)(54906003)(8676002)(66556008)(4744005)(66476007)(478600001)(4326008)(5660300002)(8936002)(31686004)(6666004)(6512007)(6506007)(53546011)(6486002)(36756003)(2616005)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1BGTlBQbVgyTFFWNVQxaTFoVlNrR1pCUFNINVp5N3pPN0J4a2VQeUZieDBp?=
 =?utf-8?B?MWZ2VVRNaVh4R2llbVNJSTh2UWRCSFlaRkVUNkY5dG5RY3FLSlRPdFZKWXFo?=
 =?utf-8?B?b3NmNXd3bXJzdzBmcU4zdXBrZ2pPamtiZjlsT3hKWjgzakxNdHJhcjkxQzVx?=
 =?utf-8?B?VG1EUE5jSDNSTCtmMlhCVWF3M0YzcXNaMStUMVVnNzNxOTNtUHJVWUI3WXBY?=
 =?utf-8?B?RmM4UldPL1hQRUF6U2JoektvR3hmcE9lMXVBZHVTT1krQUVZeEF5K0s0aWZw?=
 =?utf-8?B?eDFGZUhreXZuZXVSTWlqSk9FUmwwOFo3Mkh5RCszcTZsajYrcnF5NDdsL1NI?=
 =?utf-8?B?WDZGS2JMbjZzVThNUDZvNHVNNTRid2d4SG5hVTB1Zm51VzZCWjk1REs2Ujh4?=
 =?utf-8?B?anB3QUltRUVYTGlFdDJwdjhJZ0lWZWU0WWU0S1hYSDFFbUFUKy9NSXYvMGh6?=
 =?utf-8?B?eENKbk1Yd2pZRmVodzQyaFp3dDRmZ3NjeXVYUlZNUGltUVZnWEpGK3dDZXA1?=
 =?utf-8?B?SnpEN1I4Y285d1JUbGsxNTVhSW5CaDNGUm5NeXBIVFdteTNGcE05Ti9xcVlP?=
 =?utf-8?B?SnZUM2duNEs3eUFsd0krMDVCN1hSaDJGOXZKY2JXQmhrZjQ5YjJGZjNIME16?=
 =?utf-8?B?cjRkMVhvMWM2aFY4cDZQbWUzWnlJMlB5dzhubmpEbDBzbHJmNCs2Mk9WYnha?=
 =?utf-8?B?NHlETHdyc3dNeGpVempidmNnUGtWZXR1TGVabldXbFdkVTJSWDQxNXJNbTIx?=
 =?utf-8?B?R01XSlRrVTBNcTN0b012bWxHNSt1d3lTeVhVc1F5cld3QThBbnY2VjgxVm1O?=
 =?utf-8?B?czlOTUdaWVRMTUlLZUhoZ0VON3ZUelhVeGVEM2laK2JnakJUalB6VSt3RWc2?=
 =?utf-8?B?b1dDdHM1czVIVWlkNkVaQm1IRzhVOFUxRnE1Y3lXWVJNNFFQRFJBa0t2UWd4?=
 =?utf-8?B?MlNKL0lGeXArN25hbmVlTzVocnpMSFZ0ZEg2VVp2VWI3NkhiQStwSkVYUjdV?=
 =?utf-8?B?RjgrLzVYVkNLazJ1YjNmNEZmUFNIcWdrRUZrK3NzbFRSb01ZbEovTkpsMjFE?=
 =?utf-8?B?V0V5UElJV1dBTjRFRzJTaDRFOC93c3FCUk9yRVZEbnNuQ0gyTXUyMjhIZlM5?=
 =?utf-8?B?ejgwbEtXbkdwTStkZWkrV1JQdy9xUFhaL21lZHJOZGtocWV1ZzZyL2NWQkl1?=
 =?utf-8?B?anR2bmdGTkNvS3lSR0lvWjBzTzlLU2lYVTVaZVJjN1ovR1FwbWV4NTZtZHlS?=
 =?utf-8?B?d3RlemRmdU9mRUsxZCtLYjZNMTdSdWlEY3IyR0V0eHF5TkhuSlpWbGwzWWtp?=
 =?utf-8?B?U3k5bGhEMXBCaE9JTUhZWitpQU5ZS2tyT25qRm1zVzNDeVE0ODJVVDd2Sk9l?=
 =?utf-8?B?YjduVW5ucUdWZXc0YlNPREZUdEVGZVBxak5TZDFWUHMySzVKSW9MYWo4ZlR4?=
 =?utf-8?B?Q0RBZXpsL1VZaEpVU1VmanE0aWxMUmdZOXVvbmFIYURIU3Y1VkNKUTlhT2lm?=
 =?utf-8?B?RXB5SlFhVWJWemQzTFM5S3dFa0VkSC9PSENpeENScGFuWnZSSzZHVGloSGtn?=
 =?utf-8?B?RGhCNit6cjI3cEZ0b0NRUElOK0tKMGZxY2NvOHdKMG4yU2ZCUHZxYVViK2pX?=
 =?utf-8?B?OXVxZUNrTmtySmlsejRKcHVjU2s0UTFLbURHZWhMMVVtUVhQK2dQYnE3VjlB?=
 =?utf-8?B?YVl2RUpnUTg3U1JmVnlmaVFZNk5FUXV2em9MZ2toMU1WVnh0UUhLNWxLUE1Z?=
 =?utf-8?B?eG5RYUxkZUNoMlRPcTlrS1lrZU92aU1DVy9KYTVZTnQ2dThuRjZVcmd3bXVG?=
 =?utf-8?B?MFlOV28zc3hPeFZxK3cwZW9LalJBK1RFRDhSN2RhaGthTXlPMmtsQ1AvU2cy?=
 =?utf-8?B?eTNRSEJrUWdmVFdwYVVCdnN5NW51UVIvTkNmeEFNeGpkWjViNVJDb1o2RFM0?=
 =?utf-8?B?T1NNVVBaWGlVVFNwMlZHMCtPVXZwUGNFQkcvQ21jRmdDUytNeHNUZG9DdFNh?=
 =?utf-8?B?WnFKMFFiVjZjUHY4b0VmNDdDVWlOYkpZbWJxalp6dWY0Z1NqNUY3Zng4ZExD?=
 =?utf-8?B?Qldrd2Mrb1dnSk8xWkpGMjNob3VjbzZjcVJ3SHRwangxYnpRbnBNTkljS1Rp?=
 =?utf-8?Q?53CvCZsZNBhIamN7lZ7bxLJQX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58cccec-51d6-45e8-87de-08dbb35887c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 06:21:42.1079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onW9dSwroe8AZGVMb7w8mSqSq0Amsj/5wItWoNYUTC7p+b/ywUCdkZBZfUPgJiEFx0A32yeUGGnMdK3VTC6lFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7478

On 12.09.2023 02:48, Henry Wang wrote:
>> On Sep 11, 2023, at 23:01, Jan Beulich <jbeulich@suse.com> wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -788,6 +788,14 @@ Specify the size of the console debug tr
>> additionally a trace buffer of the specified size is allocated per cpu.
>> The debug trace feature is only enabled in debugging builds of Xen.
>>
>> +### dit (x86)
>> +> `= <boolean>`
>> +
>> +> Default: `CONFIG_DIT_DEFAULT`
>> +
>> +Specify whether Xen and guests should operate in Data Independent Timing
>> +mode.
>> +
> 
> Since a new cmdline interface is added, I am wondering would such
> addtion deserves a CHANGELOG entry?

I'm open to opinions, albeit not so much because of the added command line
option.

Jan

