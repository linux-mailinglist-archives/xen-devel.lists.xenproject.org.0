Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B6539CE9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 08:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340209.565180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwHSr-0005jR-DS; Wed, 01 Jun 2022 06:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340209.565180; Wed, 01 Jun 2022 06:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwHSr-0005gx-9w; Wed, 01 Jun 2022 06:04:17 +0000
Received: by outflank-mailman (input) for mailman id 340209;
 Wed, 01 Jun 2022 06:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwHSp-0005gr-KD
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 06:04:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a92e1e7a-e170-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 08:04:13 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-RGKeoqWGPwu3UKswl-_Eyg-1; Wed, 01 Jun 2022 08:04:11 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 06:04:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 06:04:10 +0000
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
X-Inumbo-ID: a92e1e7a-e170-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654063453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05k4mje6QfRWLhMHFWF/guLKIpRIrLgBZQocG3RvjF0=;
	b=AJ9+J8vuVauA1LKiKLlg0upIQ695nPn9sJU7TnOhB7VcRDdszVCZcVvt3J9MTP6oaNbUN7
	mMP66WUUtj3Kl7mLGmmv8XLhqGLtgIrQwq7b2b+feA4MSErxRCxESkU/AXtVGiXvGv5Vol
	spV0wF8AOfPcl8LvJ/S3QX/5w04BkPM=
X-MC-Unique: RGKeoqWGPwu3UKswl-_Eyg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5qynFxRnXmNoGyDa3upXqCrTgGLH+6NVJYxvxvZxZ3fBmox8Cxscun1959cvFa2D3vCAhPUGlyVqu6ZS4rkD7oQuKNV4iSxIazEDat1LTDrJpRfK4xqYjKZvvdESF3rqqmcmYnlGjW91JNfuI/xVvEDKqiKI4vt71BGGHtGvl28pIYYQsWgGXnjuCjuPCXY0QitoLY0TdIYt4wbAqepo/LVQuBYWtXuQO6TGTEu6hxQJp49a4c6t8gjvxcXP6zq7YsRnzKG7GF0bIlNBAHYm5Oi98qjbg8fHODLjkZDKzFmp4rZx9/q2necl3tBKyj8HQ2iRpdpzDC+dZsgTx1eiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05k4mje6QfRWLhMHFWF/guLKIpRIrLgBZQocG3RvjF0=;
 b=KCs5a0N7dbuyIESh7oUlMf6pw3k+RsAVwSWNhe5k4DpmMSEuckwjYxA2TcAOD3LMK6BSYhOs6ivSvs0jdUFtwI76Q3JdF4fJmhR7/Cfwo0LO7T7PlzUeNjCc6oN7tsq4/PEWvzb7RFljF6+QHum5BNfqHWpUJ27Ed4GLrDUt3/A6xz9ow6dHHf1vY+ZoLCcdpG3MtS7gPOgNcy6HZep5t3OuRXXDDUafrznMA4U8app0GCQvJNVfeWL45UA9gRb8Zt8gt8Hd11FIuBuWv13lJI6cU9VykkAbwt/udQp0pjNsD8dLjAjsSMTtQDaZxXppXd9uZkRKQwEHu/Gk5NFRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7716ff49-a306-9938-0e91-aad45deef313@suse.com>
Date: Wed, 1 Jun 2022 08:04:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/3] xsm: only search for a policy file when needed
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
 <20220531150857.19727-2-dpsmith@apertussolutions.com>
 <1358771f-32ae-8a6b-9894-980014d7112c@suse.com>
 <604e79d6-d07f-1a28-83a0-55fede499e12@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <604e79d6-d07f-1a28-83a0-55fede499e12@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0015.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daaf34cf-b884-4d87-bb1a-08da43948b80
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4424FD9B2D4589CB0BA98CC7B3DF9@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r55VAwPBNzUAhsCSf1j+9lF3R3wAiAiFML1oyhlq7esRemx22QNwckmGL1zzG+sUwr6KPGZyEqjZThEitQUGNkOCjzrGEHDEFdACMHkAFwdk8xWYAUI+oi4I5y+iSOz2bSQUWgdGjvR+J6UUKGUt7GZA63MiGIHHfRcR1pfzz3osI4gSJ6hSW064+xZvHe9b1ilEHewhlKWNyj6DJEl+K8EJdh3jt7oFyZ0DF1MKPz07W/HDFAqaXi1PjJn7TmUOd445upQ6I57b3poToeSLrJ2a88kLLihDrJKhnWQN6uZuSdtk9lJXGk6x0kbd7i5oQZXtLJBCJjX/p9mdm779RvCIYBua9oKdrYF7NxWtDtBDIno74LtzJj0TiQYy4A4p4PRZYa7we3HTSQNID07tgBqu0g68AJu1zfsyvK3ja5VyUzVmnsx+pjH0HDsKOEe7UVkGKU5E+u1d0lImgGtahSbf3j06zQetc0v3bdg0Z/wnH+8w7JY76ANl4RYza1x3B0tZd6trPG+6pi4TN7vmQGe/xZw2JOgBszmh/tVGUMBWnCNnOY8hzTWL97wPqRXFuEfoGwZKowZeuLRgs2KPm0vEo0OeOurMTeCRfLbwwkXkuIrDOaq1G7JH9uvRw/J6fSWPSxd0kZkTHstl5nUixm488QLeYqO3dUNVXEBjfWUCjPhQbobwDqNC7QuxYKH0F28Mmbb9coAiArVhMxJ8DHPnGdmTc3c5asOvdzEGqdjp1vNnOjp1fqZLgGv4hENA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(31696002)(86362001)(8936002)(186003)(38100700002)(508600001)(5660300002)(6486002)(2616005)(53546011)(6506007)(6512007)(26005)(31686004)(66946007)(66556008)(66476007)(4326008)(8676002)(36756003)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXI1MFp1VkxsOTZCaEZKQlZKcjhNKzlyK1FaTHVSOVlkbzcwNEVPdCtyN0VJ?=
 =?utf-8?B?U2cvU1grZ3VNMnNUa3IrSCsrbjlLV1B3WkM1R29FMTE0TjVMbXVtLzdqWmhn?=
 =?utf-8?B?YklHei9oS2xodE5HYTBDRGYyT0dFdndxMlREVXBrTi9jTHlDbUx4dE5XcFdC?=
 =?utf-8?B?SlhmYlovVTNvMjRwcnNoVnRxUGpadnE1OS85ZWNJaXg5dmxNeXFQd3djam5M?=
 =?utf-8?B?TDZjTWxmVUM1UkVydTVjaHhla2hHamtTYlY5NTl5ZnM0aHE4YUl5MTZDQUE2?=
 =?utf-8?B?ZUtJQWp1ZTlWRkJmY0Y3aDNpM25CeXVLeGZ3ZStWNWtHMENHNGFqK0djQTdP?=
 =?utf-8?B?cTBQU1l0WTQvUzdUUkp2YnFQN3YyakttaTNyTGEzRm1hR3hzMWcvTzFKQU0r?=
 =?utf-8?B?OEhia3BjUkhVenZaQVhaM2pHb1Zvd1JvRlgxNlRxQWVrZkkySGxWQlRSTnQy?=
 =?utf-8?B?RUdFKzFqeE54ZnZITk1FMTI0RXpXTWZLSGNMUGlQc3ozRytMY1kvczR1aW1z?=
 =?utf-8?B?cGl0a2ZrclllSEdocFhLdXpHdEpVSnpMeE93dUd2RmtFRnNRa1lOZmZFVVVq?=
 =?utf-8?B?dUJOUkEwSjFYL1VlTElFZERPcktrUnVoanR1OGxLdXBteVYvcjdLSy96TU5E?=
 =?utf-8?B?Sk9BR05kZXdIVTZET212bHFSd2l2OWdhQ2ZnQWdrb2poMXBKS21MSm9ENDJR?=
 =?utf-8?B?TUxabkJ3R1o2Sjl2YkdDVEdvMVRldkxXMjR0LzZaWWFlb2pmMHVIeUxVTmk4?=
 =?utf-8?B?Mk1KckVPcW1GeFZyMkp3UStydk1QS2xGSUI3MEpsYktwSmN1OTFxR2c0QmhL?=
 =?utf-8?B?WmVHc3FDTGxPQUh6eVQ1dVkrcmxEaDFZZWtNNGFIa3pnNS9XSUx0a3p0SWZl?=
 =?utf-8?B?NDJ5ZkdoU2diZUVkL1BEVk1IMkp6clh5QlVURGhyU2ZieUQ3N2Zaa0ZlaEpm?=
 =?utf-8?B?UmZQUGhMQm1UWkdmUFdORUJld2NERDVCNW9iM1JUc0JsYmdKcVF5VmJjaGc0?=
 =?utf-8?B?L0xIM2x1VEtSQmFrZGpsVlVsNVkwS2tTR0JKR0dhamNGZFlmNVZlV3l2cDVE?=
 =?utf-8?B?OEQvNkkvUW9XUHQ1c0cyQWhWTmJpU3dRaUJISDlKblVRWWx3M3JsZmRTSHRp?=
 =?utf-8?B?b05rUGZxSXpHSUxzbUFsQUlqSUNwTG9FMFdwQy9jTmtzbnpMa0tISTR6R1dI?=
 =?utf-8?B?TzhqV3lPUVBoVyt5Um5ucnlBU09tcGdsSVN1SzRKN0RrK0IxdVMxSDkyT2hi?=
 =?utf-8?B?ZStVNXRLcnphY2pCU21VanNidUJrSVNHajluUjZ2RlFPd3RrWnhlZlpPeHNo?=
 =?utf-8?B?VUR4ZUY4Rzd2cjhqZVkvRGt3Sm9MSEUzaGgzUTVuV21EMW5NZmpSYmVxeWs2?=
 =?utf-8?B?emZhVFR5QUxPK1l2ZVlkZ3JOL2NRTjM5YWdHcWN0S2ZTWTFjOUtaRGFsTVpr?=
 =?utf-8?B?R3E2Z3N0cFBTMEh3QVZmWk9lUjBtRlplTVRpRy8xeDVHdzg3UHBWRlN0MjJv?=
 =?utf-8?B?YmZRQ1ZIMTZwWjhIRndSZG5LMUplVVVoUnRVQWpJU2k1TEpNSjRGT0ZmekZ2?=
 =?utf-8?B?d3A0T2U5NUozYkJWK3c1dE5xOHBCZFkrcUtlVGExZm1IL05ndFJZdFRCSjNo?=
 =?utf-8?B?QWE0MUpoWGh1MXZTOG5wd0p6UlhLVmF5RXJuM2JPRzVrMlkzREo0UnNxdUF6?=
 =?utf-8?B?TDZMUGcwTWc4MkFuVkpoZ0U0VjVONmZ4My92U1dRa0t1azhqQVpZMlpIcWJ5?=
 =?utf-8?B?NEdYRmxpcUZ6UStVSXdtbHZQQUJlSFBGSUlhY1ZoeHlIMGVXQ3FxR0dmZmd6?=
 =?utf-8?B?bVBWMGNwc1YrTUlhbmt3dXIyWHladng5cWM1ZFFRSEErZlhDL1lYdXZTZzd6?=
 =?utf-8?B?MEpZYWwvNTVXOEFtN3AwZ3RRcWJvTk1Femd4UEFSYlM5QzYvTVpaRmlBTGVh?=
 =?utf-8?B?dlRGeE0wckhId0tpUVFiVUdWamVxRWdWcCtSZXoyd282MEVTS0xLUkJXR0hq?=
 =?utf-8?B?WkFqNDdiS1phWk5aSEpQOEFZU0xyMEIxUFpjbHVyNWhDeDNCQ01Bd0h4aDNq?=
 =?utf-8?B?NkVEamZqZlNWTEszajJLaTRrUk95dU5RbzdLZzlpV3N1THF5b0NjUms5YWxj?=
 =?utf-8?B?a21MbG1xTEU5TGVoajVXc0Y1ZW5BUWhabVhEbmtCelZPNkpzK2FFVExQcWRt?=
 =?utf-8?B?NUNKM1BwLzN5L2wvckRxakdNVE1RZE1vUDVwQ01Bc3BJNWc1OVNkTGR3Z0Vy?=
 =?utf-8?B?ODJZSEtWTXFBR0g4dVdMNDZ4a3BleGN3QTVOS2g0WXdDWkR6WVNhQ1J4V3ky?=
 =?utf-8?B?YzhicXlnTHhzNnlZN1VBQTNxbERVdlpJNHRQMzMrYnhjWUkrOEFuZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daaf34cf-b884-4d87-bb1a-08da43948b80
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 06:04:10.3067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsG/CF0LMIx5aK7TpsgBl9iugGgFiuY4kT1BkVDBfJVbBOOsC7aVP1zK1kFPf3aVCLb+mHa02sLguaIGrOQIBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424

On 31.05.2022 18:15, Daniel P. Smith wrote:
> 
> On 5/31/22 11:51, Jan Beulich wrote:
>> On 31.05.2022 17:08, Daniel P. Smith wrote:
>>> It is possible to select a few different build configurations that results in
>>> the unnecessary walking of the boot module list looking for a policy module.
>>> This specifically occurs when the flask policy is enabled but either the dummy
>>> or the SILO policy is selected as the enforcing policy. This is not ideal for
>>> configurations like hyperlaunch and dom0less when there could be a number of
>>> modules to be walked or doing an unnecessary device tree lookup.
>>>
>>> This patch introduces the policy_file_required flag for tracking when an XSM
>>> policy module requires a policy file. Only when the policy_file_required flag
>>> is set to true, will XSM search the boot modules for a policy file.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>
>> Looks technically okay, so
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> but couldn't you ...
>>
>>> @@ -148,7 +160,7 @@ int __init xsm_multiboot_init(
>>>  
>>>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>>>  
>>> -    if ( XSM_MAGIC )
>>> +    if ( policy_file_required && XSM_MAGIC )
>>>      {
>>>          ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
>>>                                          &policy_size);
>>> @@ -176,7 +188,7 @@ int __init xsm_dt_init(void)
>>>  
>>>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>>>  
>>> -    if ( XSM_MAGIC )
>>> +    if ( policy_file_required && XSM_MAGIC )
>>>      {
>>>          ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
>>>          if ( ret )
>>
>> ... drop the two "&& XSM_MAGIC" here at this time? Afaict policy_file_required
>> cannot be true when XSM_MAGIC is zero.
> 
> I was on the fence about this, as it should be rendered as redundant as
> you point out. I am good with dropping on next spin.

I'd also be okay dropping this while committing, unless a v4 appears
first ...

Jan


