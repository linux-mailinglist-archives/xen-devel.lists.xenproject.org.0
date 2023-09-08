Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F761798226
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 08:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597773.932118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeUjp-0008M5-6r; Fri, 08 Sep 2023 06:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597773.932118; Fri, 08 Sep 2023 06:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeUjp-0008Jd-2R; Fri, 08 Sep 2023 06:13:05 +0000
Received: by outflank-mailman (input) for mailman id 597773;
 Fri, 08 Sep 2023 06:13:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeUjn-0008JX-JO
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 06:13:03 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe13::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c402fb30-4e0e-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 08:13:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7483.eurprd04.prod.outlook.com (2603:10a6:102:86::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 06:13:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 06:13:00 +0000
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
X-Inumbo-ID: c402fb30-4e0e-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUks1Prq7zzZQNqtzgroJkd1fC2C7rqIqvGrcEiW8NSDOgPaz570NXZt48o7W8+E35127jKnEYvVVXFTDIX+VKZlja5JpcqE/QCAsTZ8rdmn5sW8FwxWL4omRV451mGfNT1OC5OyapYG9t9R0SjN4FPadOOdE41UTAzC77sD6cFk1+tmlrmNAjLRvaWFLcFF8M4F5tDgNL6W6C4VA/RLtaYBo4LBl9aTcGnxuOI4Dy0iLb11x+MNCVqAZ3Vild92cYkzP2bnNkPKhF3gYmw8PJLD3NmuGs8CcIJwijHW3aTUIxX4QpkI2eDtuOCMSiMK52uZ+zfAHhl14NUpAPrv6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfvkDfrchQ2tT4bjQb3qTeiSLZgpLCr4UssIjUqVRqM=;
 b=b8lsAgixdzySfDiwRAiwZWex4qo11mlOT8iCrL7PPPM24McBPMs+KaTuXqCwRQEt+WFgfCvY/rcveWQh8ikDLdLGH0ErztCHu7fAv5p99tXkqCwmsXjXhZXKCgeGmc7JUgu0uvYPUkmecF6GYIoD2pcyiha3BesQ8Y2Ycrv8NdtWYEP5tz3KaFimTMhQGPI4t+kO5hVlQZ7oofNhA0hxLwn6kWaUZZAGm1gq7dh0vmPEFOVKeNc/HH1H0NXOlaIjMEpPRFaYAY6+fo/xkLpr6JHsFsJlksTZ+PvaGYQUSdfIiSPUQ0N2jQjvwWQoEljwN4Dce0sHPXkGvNRJFCMH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfvkDfrchQ2tT4bjQb3qTeiSLZgpLCr4UssIjUqVRqM=;
 b=WMzwcyKx8Y5GKEHEiVvZB/JwrZm2KL/w3vrD/ro/mUxuGHsxKL4IsqV+AOviadNeTu7PUQzZ9dK2lPXRq381xjxHKo21WdPwkKTvfX3h1svtq4Qx9Ka9gDxvjTq0XwGRdtcJzsqIAEIy/hx6Gth36Mir7qfDMD1Zi3pbndxEew0XPCk0vWFheARFoNWoYaiK/JREC96oZi710BXpvuJ1oz2J/ptd6FBaLMPmfe8uR69dIK/megrP6/yW5eBhXsNweVHI0owHv8wkuL4XFj6YNHh2KZ8glnC48SGzsnXz3FjFXANbLMlvNbBlk74hLvOUm2CbUyYNI7Obaa+hxP2QRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f865f65-9c3d-94c5-e3d4-86365feeeb65@suse.com>
Date: Fri, 8 Sep 2023 08:12:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] docs/misra: add 14.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 roberto.bagnara@bugseng.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230907012203.1238090-1-sstabellini@kernel.org>
 <36b888b2-e7e3-bf70-f599-d22ca34e2dfe@suse.com>
 <alpine.DEB.2.22.394.2309071441400.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309071441400.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ea35d8-a010-4121-e4fc-08dbb032a6df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/cjFlDbWZsDuwsOaqL6z7EWRjqMJk7xlNKioFpqNzln0KPUFyvfXNSDkxIZn1PlS6gG4BS4d66ZIgRNOrHnSe6/GLRViVAo7OFhntQSfvuSDI7nGOy/rTqdsnThH7b7QjaB+IJ9GCTLjDf2BZG1swDj7RP2BfyqC+Z/PtITzg8Bx4KsItJTJcJ/YGWoDdQk/YbhOj6Wnd1ffcW+wieM7CIucy9YyBfkGpHt/PLMtjquxMDJ1PDCYEBuAkw7jK18D33GjVyT+FqIRRZxCtu1G56LZeCu6pQWEfV/e8qrY30riNAlSV49V2ZFjRGI0By1hM58K/y3M0SdbkLXbQxigYmE0aDqrAo7aB2z4J4iS7EuJUes1Nfwp/TOMKtwJRD5mfBmzcqDBbIEag9E8Y/iF4EkhJfUZFqeZeHTPkbP6kgJ8/dLxs7hWXdf4mwIwQcUTUlVTzwL91OjtovnfziZ9xuUaTNdi++V6U86F8CSWq5CVzi0OGaNzZhTIC4HjaNMs6YD21SDw3EJ/g/QcoAqJmUN2CPkX7F/k3XXVGCZk6UUFPEgcg8yDTxDRl5S3nnygJvmBPqdyAfbsmdHa6rOaLkqiR64Y73iSa0g8g9qUQhhIy4C2REEXocW34lqfpSpsm9yPVHolCAx22MQCCUhZ0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(451199024)(186009)(31686004)(66899024)(53546011)(6666004)(6506007)(6486002)(31696002)(86362001)(36756003)(38100700002)(2616005)(26005)(6512007)(83380400001)(478600001)(41300700001)(8936002)(8676002)(4326008)(5660300002)(2906002)(7416002)(6916009)(316002)(66946007)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDB2QlpQaXBoUzR0ZlpYTXRmaW1XSXY2aWtqbFZ2WEsrbWpaeGRQQ3l0c3Z1?=
 =?utf-8?B?ejhBRGlKNU9KUEIyWU9wdFJzdzREcEVzQy9hYStMTUhwRmpTRm93SGJFc0FI?=
 =?utf-8?B?cWxadnpLdjBhellES08yUlVBU1pWd3FWTkppM0FqVVo4dWorSEVqUjdwcXF6?=
 =?utf-8?B?QXVQNStpMVVFYUNraHgvWXcvV1g4RVZnbE9xUzFlWHFlbzh4SlNna3lEQ1gy?=
 =?utf-8?B?amJNOGdJNkZXbGlXUlp1eW51ZWYzQmI1eDgzT3VjTHBhRG0zdjZWeEd5Mkhl?=
 =?utf-8?B?WmQyZExoc3FXN1o3dFVYd2E3VU9SNDRsQzQ0YndyaDRZVUNHWm9uaWVmam50?=
 =?utf-8?B?UTRzd1BDMHdiSnNyVnYwTlVncGR4UkhuWXdBaENwb094b0VZOXpNblhLVGUz?=
 =?utf-8?B?QVB2NjdOb3lNeG1hb3dWeXJqTzZTZ3hyL0VrV0FoSzVBRWg0QmFKVUJTQVpO?=
 =?utf-8?B?WkJjUFVIN2FkTjIra3czZTJXdTN1aW5VZk5YZGplbTlWbWQybjlTRUE0ay9N?=
 =?utf-8?B?VHI4aUN5NDNVNS9FWDJqY2F6eUZIZWFSekFtL1NLSXl4b0JyWkdSemw3dU1x?=
 =?utf-8?B?N25Hck9rcmV3cEdKVElKOE10S21hM0p0aFJTTkNNY2FXdWNaSFR0dlVmenc2?=
 =?utf-8?B?cHB6WEhZZ1lJZVVvemdJNDBJWXF4QndKN1lWbFVtN29UaDYyRHZ2VnJjYXA5?=
 =?utf-8?B?SXZlREhMN09YQmFLZy9uZWF1NWJ1OTdiVlk5RkFNKysyUE9RbllrdVBuQmIr?=
 =?utf-8?B?M3dVS0p6QlJOQnUyNUgvTkJQTzNZWVhzc0dWSWExMGg1VWpydGFyQnBOZE5T?=
 =?utf-8?B?Rk1aUGhsbExrcDludVRFUmxLT0xkckc3VldJdGJTTi9KWmZTQnNBU2dyVnQv?=
 =?utf-8?B?eE5PU2h5bFJBdENveXhkQVBtbWxPWTRlNVErREV2aDRnYU1yc0xkNU96VTRj?=
 =?utf-8?B?bUFDNEN6NXI2OERXZTVtcVkyaTJyUlhudnpGYVJ2WkRHZTZyUmVqQjljZE1t?=
 =?utf-8?B?RFlhY2Z0V2xQVVhwTWVuOEU0Y1R0L0FhbnpCajFjTzYwM3BLdGdaVm91WExJ?=
 =?utf-8?B?a2RMb0dtVlFGRXY5OVdodTJaaU9LWjlCK09GYmRwL0M2N2E2Y2IxbzVmR2tE?=
 =?utf-8?B?Qkl6TXpKaHJIZ3FielhWbW9CU21lTjZJVTJCN0svQm9scHhvQm1sWXNZeW41?=
 =?utf-8?B?NXptRmJBaXljdktTeGpYSFhSR0RrZzZSeGJLdU43VmRUY244VGQyUHc5eWNE?=
 =?utf-8?B?azNFZEF0V29jejZmcEVFaU5WTkRpZmx5NHorYjJxVmRZUlZoWFZaRHBCSEJl?=
 =?utf-8?B?UzBsYTFOU3FjRmxZK0EvdGZqSTFNSlFScjBIbmV0MzIxL0FlN3VXU0NsdERB?=
 =?utf-8?B?UzhpM2s2eXN4M1hZNXNacnoxNTJ0TDRxT21LOXljYjRXSHlwOGhCSzd4NW81?=
 =?utf-8?B?bkI5NCszc2tZSGJMQlZyMEFIaHJDQWhIeTUyTm9XcEVpU2xBNGgyUWpReHZp?=
 =?utf-8?B?Y3pVbDlWZnVPdVlGU0RqaXNlSVl2WWVISXN0MzFBUEVRK2ViL09UMW9GQndU?=
 =?utf-8?B?cnEydnJQYlh2RlpRNGU4ZkYvTnp6UVRVWWlMNi9DWlRTY1N2elJhOEFOcStz?=
 =?utf-8?B?dERQZm83TTBPUVB3cnMzeFgzcHlyUDMrREZicms1TTFrZjA0R0pFMDQ5a1pQ?=
 =?utf-8?B?OVphR1VsM1dRRmtGSXc0emRpUGtMekwxK2FhQ0M2c1FNVE5JRk9TamxDVDBC?=
 =?utf-8?B?Rk90ZC8xam9CNDZZbml2ZkgzZlJKSmVHNlpjWnRzeGlaSTZKSDh0NCtaTHhU?=
 =?utf-8?B?VlBYRGw3RDhFMmRNWWtScEF1aHQ3TVlYb0VoWjM1OWd2dFlxRjNVNWxoM3Q4?=
 =?utf-8?B?eENvd1dwdExWQ044bDZ1cXhlYjJkYzVzL2V4cDFaNzgvVExYbm0rQ0JHbzgz?=
 =?utf-8?B?MGw4S1J5SnF6dG1hR01vd2JBeTFyeFhyOGh5U0JuZGk3NC9iVnV2UTJxNmw3?=
 =?utf-8?B?TnVKOGtTam4zb0lpMTMzc25Ld1dKSmhZelhWVldNYkVpNEpvZ3hYN2I2V1FI?=
 =?utf-8?B?aXJmbmUveFFwQmczaENsUE0yNmlmak1WM0psMEdPSEQ2cTU3Y0g0ZGJZcUVG?=
 =?utf-8?Q?p2jJvKluxN4fAZy8d4BovNXOs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ea35d8-a010-4121-e4fc-08dbb032a6df
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 06:13:00.2160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcgcO/orl9maXzZvF28UlKH7xMh0gc6vEUXzSem016fZIJbf37iLX8PEyQOqWoT/a3KtlrFC20au/3wBEB6JTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7483

On 07.09.2023 23:45, Stefano Stabellini wrote:
> On Thu, 7 Sep 2023, Jan Beulich wrote:
>> On 07.09.2023 03:22, Stefano Stabellini wrote:
>>> @@ -385,6 +386,17 @@ maintainers if you want to suggest a change.
>>>       - A loop counter shall not have essentially floating type
>>>       -
>>>  
>>> +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
>>> +     - Required
>>> +     - Controlling expressions shall not be invariant
>>> +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
>>> +       checks, and other constructs that are detected as errors by MISRA
>>> +       C scanners, managing the configuration of a MISRA C scanner for
>>> +       this rule would be unmanageable. Thus, this rule is adopted with
>>> +       a project-wide deviation on if ?: and switch statements.
>>
>> Do we want to go as far as permitting this uniformly for all switch()? In
>> my earlier reply I had included sizeof() for a reason.
>  
> I agree with you that it would be better to restrict it to only some
> switch uses, rather than all of them.
> 
> But if we are going to restrict the deviation to switch(sizeof()), which
> I think is a good idea and I am in favor, wouldn't it be better to
> handle these cases as individual deviations? E.g. docs/misra/safe.json?
> I am assuming there are only few cases like that and adding it here
> makes the rule more complicated.

Personally I think it wants to be both anyway. For one, anything written
here still needs respective SAF annotations for scanners to be uniformly
aware (dealing with deviations in just the Eclair configuration is imo
dubious). And then my general view is that by stating patterns here we
make clear that we tolerate new instances of such constructs, whereas in
other cases we'd be aiming at no deviations in new code.

Jan

