Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3C34CBD54
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 13:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283260.482229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkBR-0005Sq-Rh; Thu, 03 Mar 2022 12:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283260.482229; Thu, 03 Mar 2022 12:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkBR-0005QX-OP; Thu, 03 Mar 2022 12:03:49 +0000
Received: by outflank-mailman (input) for mailman id 283260;
 Thu, 03 Mar 2022 12:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPkBP-0005QO-F0
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 12:03:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa87021d-9ae9-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 13:03:46 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-yszJ_8DxMVeGTkue4jdZMw-1; Thu, 03 Mar 2022 13:03:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0401MB2643.eurprd04.prod.outlook.com (2603:10a6:203:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 3 Mar
 2022 12:03:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 12:03:43 +0000
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
X-Inumbo-ID: fa87021d-9ae9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646309026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f5c8wifocakWfoeiBYAtyleYLFOSYBjoeqa0zzoIY3k=;
	b=ePn50OvvmZBpTN/FSOFOjM6MySpNych72aF+HMaIR4qZCcLcFdQfF3ZTbYAMckm6k0/NGV
	x2OfLBXqswDrvZ9N1LV1HNLELwviYAFW0jW2UlE3S5YMFK2PCsQuFAjSIka7qFx3QBbS7/
	PNG3/snb7qHBI4+WBglvRFlGosQ4Zxs=
X-MC-Unique: yszJ_8DxMVeGTkue4jdZMw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdniJOAQa7kRTej4QRfoBGD+XtOLpx0CfRWoc7nWpdyeSOswbpJLc+frjZmrI1iCwn7yyLEV4oIp2mP74sQDaxVTb/obCmFXuqPAHlnXlcO9+TVE8VgQxml0aKUhEN2qpdSlsfpusaykedc+8Q7M4v5a2bnYhzSuHb23eWtCLNEOmSO/YGCZ/dmgAnfxMfpi+tRCYZVYMDNIEpjAPNgP+wLzSEohQJTCYyQx+C1u05JhinTQuNGHFZu8i8Oxxid1E4Jos43ZPvh9WC5eq5fEskdmpO2oM6G4COY8HYyE2B3Ak2/g00nJvr3vNDtZGB9rDLrqZvg9HKFzr9OiUGCRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5c8wifocakWfoeiBYAtyleYLFOSYBjoeqa0zzoIY3k=;
 b=IJoiUJl0o2N7rN4/jTzmvIZakSUy/lLibPyzW9uicy1M8eYXI2P/FA00OjqWi9MquSx2dOyO9f5d9me8H0zol3/1j0opqFS8ZZTJ7OZ0eG9BAW2XQvYflsKBOPz3xS5hm2uEZKlDklRNeUdvCfa7eBvEf1fGUFs5geLn9vSiADGAFt0sG3TuCt0FYhcK6RIuzGoFLrlD2s4z7HajFjG4OXIKmB7acZLZAfX13HqDm2eFVc6BTev7fVm8RRzo46XWuAukEUWRdY+qUxzEisBp3aCAVYa1LSyxRAkHbzlTunnEIQSCB0Z/r74U0pRrK7D3Uwr5vXJW38B84lIXUHDFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d57dc89-779b-aa91-519d-3e4cfc05ef94@suse.com>
Date: Thu, 3 Mar 2022 13:03:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/tboot: adjust Kconfig default
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>
References: <fae0a082-8b39-9bd1-0ed3-35a660d704e8@suse.com>
 <18472660-3438-5c77-05c6-148b97bf4725@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18472660-3438-5c77-05c6-148b97bf4725@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0013.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d526078-55e9-4739-8cdb-08d9fd0ddd24
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2643:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB2643B277B41C62CE98382542B3049@AM5PR0401MB2643.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4fqiL/rtasUuIXwdNve4z9SqP4XaxA8PXa9SHEA3XbI3S30pmQ36jtRMvpH8lyPIM2toI7puaBgs/9pNlrztn9mlhFhzjXl1DXsKKS8ChPElHcS+D79BM1QDtmamDYplUzV0yC3zeu8ssU69kn9tk17LyDqKFn9FW5wf+G/Dwev8eNzlNpjh/kgxoCbG4T6OqNW1Ko/W5ciFFmF7x9wVCwYR74bV8QE8iVWftLn3UGblkwQR58zdQ2oJTdMcHHiwBylSHAvWxEvfzsfkVUNX7kn2gX8n1JYgOG3Ww4IxFGJcb/XY98QOuF5IVpALaD1QYdbZx2WrjMGZ6A0WqB0NurgPn4s20WwqOMuIkO2yXBvbnY9oZONShlCf4VqXW7X5ZiI0XbMl0Mnjg17KiBtz2VTv4CkSWhbt8tbkbmkVOnpeRuayzBpJAwg1jmBwWBD9YNZC0KobSufYzs8IgbRHVgTKuIU4Z6hA/eBnSc67xGyq7V9tHBc1iwSEszGXvxVcgQDRq2WmXDNI/kB4Y93+9BUo5cWeAvm9fp5q5A3NNUFHbOs6GFF9oAfaxuc9omHofAcAd3Il7Sd5C3WVRwNMaNr9rjrC5dHiaYd4FSZ6uNfhsnYDCuJBx7G0O3Zo+knQ1ib2tEj3fITujnzTGlnU/ynjEl0LfxvBABpXQtz43OyXYNicXyIuUbkPRZ6IlYzf+/bNHyNyvnzPJ0BKbEJfNqF85DBTnnkVPCRQ27m7/mU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(31686004)(5660300002)(2906002)(36756003)(2616005)(54906003)(26005)(53546011)(186003)(6506007)(6512007)(8936002)(66556008)(66476007)(316002)(38100700002)(86362001)(31696002)(508600001)(6486002)(66946007)(8676002)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDJtdXBpRzRiVFlLTlFBRWN0eGNWWnNjUHdHYkJ1N0E5WDdTUlZDYmxlNk90?=
 =?utf-8?B?OHd5c2hRMWdBSFp5OXZ0UjVDZWNubVVqdGlXWTNWSWpmUWZIeklsT0t6Y1JO?=
 =?utf-8?B?ZHBUdFVTdEU3MTBlbmpsdmdmYldxS2tncHh6dEhjZFI0YVhuODcrYmdUTlpt?=
 =?utf-8?B?ZlhYenhFQnNOQTJPSldCL3JMNU16TnlLNFlrKzNxZE1NRXZ4OFlYUmMrZ1p4?=
 =?utf-8?B?MWx6UHRwNHNTb1Q4TzRNM2QwaHFDSFl0UWhURTMxOVpNcldkczRyRWxHZDVE?=
 =?utf-8?B?RW1xSDhuUHBQK25Yd0tkbW9BUWNGemVaemVUb1JiL0QvTFR1Q2pJa25UUzM3?=
 =?utf-8?B?QW9meFBYK0NFSTV5by9jMG1EVVhwVmtkMDJ1M0RFZE5WM3JzSk5sUGk1d1Iz?=
 =?utf-8?B?QzlucWVsRkhpUHVWNWtNZGpxVzRaNUdhY0dhTlhFb1k2QVJxMTlsTkpReERj?=
 =?utf-8?B?MkFabzBwY0VXOS9xOFFEMGQzOHJLbjI4bUNQSmNoakNuNFRSUHNtVXV5ZkFB?=
 =?utf-8?B?R1VYd3VVNDVUZlpoeHBrOGVJRWErOWJQaDlNSnRGRUVQYVAycENYSjVqOE4z?=
 =?utf-8?B?Wjh3R3VYVHlOMVhSMDZvc0lLOS9NZTFlSDVBSnZzc0Judm1qcVNJU2Y1MG80?=
 =?utf-8?B?MExGWHM1V0RMdkN3S1dJd3NUT2hmVlZpL3Q5aUJEOVBtWG5wOXNCZ0J1NGlF?=
 =?utf-8?B?VStSMnQrT0dXRTVjY0kxSnZnb2NHVm5wampqV3VOam9ycUtid2ZNUE1Lbmxy?=
 =?utf-8?B?QnhUdk5jeGV1QXMyVXdzWjlxMnNpVVhldWZUMzJmb3ZKSzBQdTJWTm1wdG1K?=
 =?utf-8?B?VFJCTXAwdW9nSkE2NC8rSTVBZnRwU3A3Y2x5Zjl3d1pEQ1o4TjJQMDVMRFBK?=
 =?utf-8?B?T041T3d0VmJUTTY2dkxLSjdXczA0bFl2VlRGSDVtbldnaDZCVXhIN0FQbWNK?=
 =?utf-8?B?SWZUaTFnc1VoTXZoU2U1MjNaZ3RIVFVvaGtxNW1GcjNsU0ZXZTI1UjZ2SUpX?=
 =?utf-8?B?OWF2dktnSkxicmtyMFh6eG9HZG1QUWVQY0lxM2NqU0VocmN0UVZ5Q1U2TUdL?=
 =?utf-8?B?VmphWDBobTdIeUVYbzk1M3BoYWYzMnp4eWJnOWV4RVlTYmV3UmJVbE53ZkNt?=
 =?utf-8?B?aVhhUmJTNHcwMW56djJhdGhBQjFiMi9ySjdrN3JWQTE5N2dQd01leVg2aGlt?=
 =?utf-8?B?alBoWkRPb3NZTk5UQXg1MGk1L3FRUHpHb2hiZWN6NkhZODNvTnJmYUJ6enVx?=
 =?utf-8?B?eVoyWEdWTjhvTmFkczlIa3N0YS9hRDJtODBWM1JrTmpjUnAwTnJMREVlcmN4?=
 =?utf-8?B?SzQwTTZ4clkxTzNtb0hLS2VGUGMrT2FaUzAyNGsxcHpjSnZITk1qN2tVNjZU?=
 =?utf-8?B?U2NoeGF1WlRVaTkzRSs3VGNzQTdsTitpQ2dHcTNGSXY4SlVoM05ZUGlwZTQz?=
 =?utf-8?B?MGdZb3dsQ05PYVNpUVZpTUFDV0hlWUlNWkN3SmErUjhDemlsY1FaWEwweGta?=
 =?utf-8?B?VzVueTRaMVJDM05pRGVjK0xUc3ZUTFg2WHhGM2lYK2xGa0pmYVFYMmdIdUFp?=
 =?utf-8?B?STV1ai80VXpxUExVMS83U0ZJTkNWcUl6QWZkVWRrRWJzSjF0Zks4dWNJS0gw?=
 =?utf-8?B?WWE4WlpPb1hHNm13L0EwSHJIZ1VSQzZUbnhqcjZmMjF5MjltNW43UGxVK2VT?=
 =?utf-8?B?TUszVzFTd3U3UlpTclg0SFRoRmNINzhyaGkrUWtVR1VlaUFRUlVlM2FrdEUw?=
 =?utf-8?B?M2NuYmRwbWxxdEErTmxGd1YrbWZCWmYrODdWUTZZOXpoVytoeDc3aXlZZ0Ex?=
 =?utf-8?B?T3Q5V21ra1dXY1lMRE9URWNyZVpRWlVwQXFZbVlmSUhkMkNRYkdiam1ieWNm?=
 =?utf-8?B?MlE2NTBmckhOMldSZ051VTg4V1RHSFl5elZ5QzFRd01ocVJzZkFLU3JXTFdX?=
 =?utf-8?B?ZnRKd1hmZi8yTDEvdVF2bnlVU2Y0Zk9RT2FWRGtvWUREWFE4aktQOGpRTDF0?=
 =?utf-8?B?UWlVaEJZMDNvdXVBb2NNK0dRY3hvZnExaXZYZWhjSnpGRi9qVFo5S2ljSm5R?=
 =?utf-8?B?dS9JZzEzam44cUJ1VmNBRlRxWGdiNDRoZ2RLS3pQS1NRMlJmeDVTTU4yY1NP?=
 =?utf-8?B?VTlmZGFReVdQMjhRaGlWbmNTTGZTbG5tOUUycVZMSGZpL2tnV2lCWENoMnJI?=
 =?utf-8?Q?eZmil6DyEw9cBX6oxvNbzk4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d526078-55e9-4739-8cdb-08d9fd0ddd24
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 12:03:43.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgZ/L9hvPTjgMphM0aI1L716PlD7Oq8yzYARKs+YOaghzUM56LrNXkOgNeY20gOi5clfvJ6Hv52GnGs4qQa2WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2643

On 03.03.2022 12:50, Daniel P. Smith wrote:
> On 3/3/22 04:49, Jan Beulich wrote:
>> We shouldn't include unsupported code by default, with not even a means
>> for its building to be disabled. Convert the dependency from merely
>> affecting the prompt's visibility to a real one.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> We could of course go further and make the default also account for
>> DEBUG, as is done elsewhere.
> 
> As in you would like to adjust the default based on whether DEBUG is on 
> or not? I guess my question is what motivation is there to adjust this 
> selection if DEBUG is enabled or disabled?

This is to have functionality enabled unless overridden in debug builds.

>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -193,14 +193,15 @@ config HVM_FEP
>>   	  If unsure, say N.
>>   
>>   config TBOOT
>> -	bool "Xen tboot support (UNSUPPORTED)" if UNSUPPORTED
>> -	default y if !PV_SHIM_EXCLUSIVE
>> +	bool "Xen tboot support (UNSUPPORTED)"
>> +	depends on UNSUPPORTED
>> +	default !PV_SHIM_EXCLUSIVE
>>   	select CRYPTO
>>   	---help---
>>   	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
>>   	  Technology (TXT)
>>   
>> -	  If unsure, say Y.
>> +	  If unsure, stay with the default.
>>   
>>   choice
>>   	prompt "Alignment of Xen image"
>>
> 
> Outside of the debug question, I think the proposed change is good.
> 
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.cm>

Thanks. I guess there's an 'o' missing though in the email address?

Jan


