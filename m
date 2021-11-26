Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8C445E8FF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 09:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232356.402809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqWGH-0004vg-5h; Fri, 26 Nov 2021 08:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232356.402809; Fri, 26 Nov 2021 08:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqWGH-0004tb-2c; Fri, 26 Nov 2021 08:07:13 +0000
Received: by outflank-mailman (input) for mailman id 232356;
 Fri, 26 Nov 2021 08:07:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqWGG-0004tV-7X
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 08:07:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db02b0aa-4e8f-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 09:07:10 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-Yj_RkDSmMraKVujRQeRfYQ-2; Fri, 26 Nov 2021 09:07:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Fri, 26 Nov
 2021 08:07:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 08:07:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0020.eurprd08.prod.outlook.com (2603:10a6:20b:b2::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 08:07:06 +0000
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
X-Inumbo-ID: db02b0aa-4e8f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637914030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fObQzg7vV+qGsSkTeaEDu3xAdXwegYP7bqT4/fGJMKE=;
	b=OVY6TznvfdzIFhn3zlj7fNhJjwIMXcTrufWe0iuvlbVMD+UcQntmX1fVBr3akSdj6gBenu
	SYDzrKhafiC5hYKF3Iweyf1gNM4KoHjpdNa7HydGhtyp0sN2YgkH3iv3pl0+v54clKeMkn
	YcQc7LrVEh+xQjYPQrZ5NOBVKR3iML0=
X-MC-Unique: Yj_RkDSmMraKVujRQeRfYQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZqTDVjFdpbEW64XeAUFRsMOqTQjfnbuvoEUc4PRJS/eE5UtEqJlIBecaYdMW0s8lPH2oD5ZVeNxXj7BTBDmhbJsNlmID+PyMESrawbZLLK/BXED09MjRkshpFeF4ExglFRjyQ+Ueo6PmkIV85RmfxVr6i3otNe5L8jySACM9N/zdfLovdaCffX1ESgMCQ4YqJUEzK2dFHseuNhwGPH+H6uuhVeDetyYcB9LV6UXxwZBd80V74nm2RABIFjA/HH5R+l2OdIs8cB9CFm99Kz3Ibln0h3f4ezUKGWG/3/IHG9Po3pxMi7GulZcmbleoKpX2xVBDaKlYFkxK+q/fUwAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fObQzg7vV+qGsSkTeaEDu3xAdXwegYP7bqT4/fGJMKE=;
 b=BsRGQYGLbN5cbHAx1QgLZf+uL7j6eRoOka6ozy+9WWr9KLGGBTv7oEAvljgcIjtRG83Ci7Q79R328M8g6RHZVVXZK+dRqOa9Q50Q7iahRQlSGVecqLo1ZbLv4bwaCoTJwOR3TF5+xg7v9WWPgF8R4VjKzuT9RWOGyRaA9hb3ytDnNbFnvaTOWyMbgcEPLIqXE38KI3igSkS8/0y29dk713H0zfOi4Z1gGyeOWB76qkIHosGkk/nrt0GZRVpBqEGUJIw5S14o5Nl2izrBrx8dBFr+/RFgcmeiqBZT3cjwVP1PZgVG1LKdsKcreexgJILToLd+zxo+8a9ANJyv0aJIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a01c4d48-0a87-65bb-0593-efa9826e0e4e@suse.com>
Date: Fri, 26 Nov 2021 09:07:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <da172ad3-47b8-8e60-c70a-4275aeb9efd7@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <da172ad3-47b8-8e60-c70a-4275aeb9efd7@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0020.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 217c210b-9bdd-42f4-67e4-08d9b0b3bd12
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4847FE647E0A9A71CA8FBBA1B3639@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CD17snTn9SqYR3GBV+y+i9qgypaly6LYl8KR1RFUujsPAXhA5RPTfF7q3Ser5+z6D7KCeT4WOwuLmfv/yy9seUsi1+vcr5utOxpOdy8+Fld9z//juraMfNf5t1pjpnefjOoRwPV0KOjWLBXDkCOx57e0c1sGtAR1jal5lWCCfwVDXo6HUjG8za8EbWQK92crDhGrU5uU3IEiD1uSiSUGFX/Jb05CcucbdNhTrND3WKPkLf04wOfmsunQ8MttmkWuWhyM4zEI1Im5abnfGAosr9mcq4N3q1pOEHfhykcgvuLoc9UxW7Suo4kfM7fqSgsav18bwuJhzbRnDRTy6iJrWXFXH+fRvC2BlcDLdpIwL/3eo03v13pzdXEkBUxtRH8LqP8wdMp/6G7TKMHbvlwN6pWrhAc6lIL3kXtVRaruWqJm9CTQkarEP8SIKzMJ067lVm+DykYwZ0bax0dC5Nw0i3/BkfgjhW4Qb5iQ7YiqpR7KIGObRIR4J0QzifevkN86dS7Aggz8GKvU4bW2vkaqhHiDBT+9cIN9OAYnr9ddmp70zlpOOdQM1bOzycVloF8izmELNZGDB6m9J6qDrSkS9O+lHkLGX6P1BcZ+WMcWS3lLUnZhzg2gCzyAmPmsZlai79MzG7lFn4/SdtwZpAi1de22KHA0xUDnFECjWNcZ7N8CqZxSg9Ik+tAT8pnFNW+DPx+4pdWstxbA/bv+9gn+ZRzo6u8kSrbNAvgEPaqEP9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(66946007)(16576012)(5660300002)(6486002)(8936002)(2616005)(53546011)(26005)(36756003)(8676002)(66556008)(4326008)(54906003)(186003)(31696002)(316002)(38100700002)(31686004)(83380400001)(66476007)(6916009)(956004)(2906002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVNRM2ZrV2M0RXY4WFJpVVV2L1E1bFNUbDdEYlJXdkpJcWVwdDgxdG1zdDNI?=
 =?utf-8?B?ZkNTNzlJNWsvUkhhWWRvb0w4enZtSTdQZmE5MUdFTndtVTF3Z0oybzZQME9Z?=
 =?utf-8?B?bkEvUUdzaXlGRmZ5a2Q5NEVnM3JSVFN3eS9jL2gzRGZoQmNldjcwakFxbmR2?=
 =?utf-8?B?Y1p0VktCcmVOeXZjdHJsRjk2Mk5xZlFIZTBBckFMTk44WXN3cUtuTkxvTDJO?=
 =?utf-8?B?R2MvTUw0SE11enQ1c0JsczlNOTBEWlpFZVdXV0xGa2VyK3U3enBPVW5OQTd1?=
 =?utf-8?B?ZzdtL0xIS3dXOEFWai9kcGxJdW43YlJpV1hlSmJMUEVOUHp0YU5iY1dONnda?=
 =?utf-8?B?UGhmaXd5MThxS2ZwNnVBTXBxOCtZSUhxQXVUSEo2Rys0cDhZVWNxMVNwaWtR?=
 =?utf-8?B?Z0JmRXhCSHBwYlFHUjA2VlRjaXJmenN2VlFXOGc5dGxLbE9oeFB5R0Y3UUZR?=
 =?utf-8?B?c1p3UXE1dzcyY2xTQWtKRlhIT0lrcVhPcks4WkNycmtvRmxuVi82NUtQcFpK?=
 =?utf-8?B?M204b2l0c05USVZKbm5xRzR5NGpkV3BBUTFEditVUThXbkgrWGg5b2pmaGFX?=
 =?utf-8?B?YXhrd1FGNGRUcngxZk5jdGNUWGxUSWZYNEFYTHBpYXhyK2p5R0xvL3AzNUYy?=
 =?utf-8?B?d0txYm9BR2svTCtxRm0xNHZIVVZKTWdoRFBZU1pZaDFtYWZ4RG52dGRxWUFT?=
 =?utf-8?B?Mk0xSlFVV2xLN1JuMkpsaG4zWGkrS3VPbk5SM3BzWnRwV2pFS1l5R0pHUjFr?=
 =?utf-8?B?VnRrSnFOd0hnWk9HLzB5ME1sei93WWNROHBjTmQ1dkQ2Qm9HcnphQmxCWFdm?=
 =?utf-8?B?THV0Mnk2MWk1V1Rac3BoQ1FobTgzSzUzQnJMK3J0YjlTMnlMeFdHeUtkd3ox?=
 =?utf-8?B?MHUrUDVra0cxc3hWMW9QTHFKNGZ0cEtDUnRONnRWSHV3cWhTVGlQTUtBeC84?=
 =?utf-8?B?VnFEdjA5b0x3TW5mak45djQyd1oyalhVbW9zamhZWm5Xcnd5aTJ5dDMxUDMv?=
 =?utf-8?B?RTVPOERETUtvdWFYMVBocDM3Rk9pdEs5NWgrQXpSOXR1dzN1Tm9rQngyYmdZ?=
 =?utf-8?B?QWhhcXVhM1M5WG9ydnoydzZuU0FNaXR3N2JpUzdtYmh3dnhCM1hPUkxwNlFz?=
 =?utf-8?B?ZXMxcEc4S3QrbENEZHpBcG43ZHRjZGR4TW9VY2dDVHFpanljRU4xYmJyMVZZ?=
 =?utf-8?B?Q0xqMzJSZWt6UjlrMDE3cnhwUXhBQzl4eStHUEVhczV3MnErS3hpMTBnZ1ZK?=
 =?utf-8?B?MTc5bW1Cd1ZDQW5KdDdLcDV1NE53MndJV28zVzQ4VVIwYXNUU0FZQ0RBbDNO?=
 =?utf-8?B?QmkyYnJnZ1NkL1h6QUNpYVpJV3kyaERBN2lRbHY2THU1QytDUm80dW9kMjFj?=
 =?utf-8?B?QVV5bC90SHlCVzh2K3Q5YWIrYUxPeFd5WWhrbk9vYlVLVmxIVFhLUWJKNlJs?=
 =?utf-8?B?TlR0aHFyTVp0Mnp0RG9mbkRxVFJ2ekpDbzREbkFORmZrajRpMmFzSDlzNllK?=
 =?utf-8?B?NXN0d1NzRE5sbW56aGcwYk9YYUYzcC9YTGMzVThFaUpVT0xFTlFEQmVqMlgw?=
 =?utf-8?B?ZFh6MVFZTmVMQ0h5T0FxbEc2ZlVocFhRSWRZNVBNa293VGxyMUxQc0lweEQy?=
 =?utf-8?B?UHk3bnJIeE4ya2crVS8yaG5yVXZnZWc5WmlNNUJHeC9rMUhnL21wODJLdTcy?=
 =?utf-8?B?bEVLL3ArN0I5VXVjdWYzNTgraTZrZVpEUDRFcW4rL0c2dWVyTVpPTG5KTmYw?=
 =?utf-8?B?SDlaMWFURFp5ZmNRKzZ1S3BtZXgwa1U2OHMzRDU4cWdzYVVPQ2tGcXRXM1Ev?=
 =?utf-8?B?Q3VScnMybURrSTliVEdGNnNKRkYvb0hmYlZEYXFSWWdYbnprcGtVMHlTTUJE?=
 =?utf-8?B?YnZHRUVTMjJMRjA5S3o4eUxpY0YwN2diVUVPYnpmUDZicXdNdzR2QTIwaVBp?=
 =?utf-8?B?dzdvTGFEMmpnYVNzQWY3UGpWUkNKOHBHVXRNemJ3Q1kwUE5BazU1M0RWb3Bp?=
 =?utf-8?B?L1lxdE9JNlkvcnM4WW1maUxHdldHejVpdlNPQTJkeVE5U1g3OXMwOFlnZXJX?=
 =?utf-8?B?TUxOalpmMElIQUhiY1NhTWhsNm1RSG9pSlljbmNsaVV2dWdZWTJBc3BjZ1J2?=
 =?utf-8?B?VExvVStkS29pclZ3ckhLOXRHU2FwaVFvUEhjMUV1bGdodWxOa09BTGxMbzdC?=
 =?utf-8?Q?50TenaznWe4ptfoWHIZXPMo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217c210b-9bdd-42f4-67e4-08d9b0b3bd12
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 08:07:06.9249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ja4wzwxWysI14uXAtXX4NPogMRO+Bx76hvrgjXfpNczIDNaPW+mqgj0bZkYzZHDIKBjTs+iOLb0Yig8n8+7ZKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 25.11.2021 17:37, Julien Grall wrote:
> On 13/09/2021 07:41, Jan Beulich wrote:
>> Without holding appropriate locks, attempting to remove a prior mapping
>> of the underlying page is pointless, as the same (or another) mapping
>> could be re-established by a parallel request on another vCPU. Move the
>> code to Arm's gnttab_set_frame_gfn(). Of course this new placement
>> doesn't improve things in any way as far as the security of grant status
>> frame mappings goes (see XSA-379). Proper locking would be needed here
>> to allow status frames to be mapped securely.
>>
>> In turn this then requires replacing the other use in
>> gnttab_unpopulate_status_frames(), which yet in turn requires adjusting
>> x86's gnttab_set_frame_gfn(). Note that with proper locking inside
>> guest_physmap_remove_page() combined with checking the GFN's mapping
>> there against the passed in MFN, there then is no issue with the
>> involved multiple gnttab_set_frame_gfn()-s potentially returning varying
> 
> Do you mean gnttab_get_frame_gfn()?

No, I don't think so; I do mean gnttab_set_frame_gfn(). Its return value
directs the caller to do (or not) certain things.

>> --- a/xen/include/asm-arm/grant_table.h
>> +++ b/xen/include/asm-arm/grant_table.h
>> @@ -71,11 +71,17 @@ int replace_grant_host_mapping(unsigned
>>           XFREE((gt)->arch.status_gfn);                                    \
>>       } while ( 0 )
>>   
>> -#define gnttab_set_frame_gfn(gt, st, idx, gfn)                           \
>> -    do {                                                                 \
>> -        ((st) ? (gt)->arch.status_gfn : (gt)->arch.shared_gfn)[idx] =    \
>> -            (gfn);                                                       \
>> -    } while ( 0 )
>> +#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
>> +    ({                                                                   \
>> +        int rc_ = 0;                                                     \
>> +        gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \
>> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
>> +             (rc_ = guest_physmap_remove_page((gt)->domain, ogfn, mfn,   \
>> +                                              0)) == 0 )                 \
>> +            ((st) ? (gt)->arch.status_gfn                                \
>> +                  : (gt)->arch.shared_gfn)[idx] = (gfn);                 \
>> +        rc_;                                                             \
>> +    })
> 
> I think using a function would make it a bit easier to understand what 
> it does.

I can convert it, but it's not very likely that it would be possible
to make it an inline one. Not sure whether that's then still desirable.

> However... The naming of the function is now quite confusing. The more 
> on x86...
> 
>>   
>>   #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
>>      (st) ? gnttab_status_gfn(NULL, gt, idx)                               \
>> --- a/xen/include/asm-x86/grant_table.h
>> +++ b/xen/include/asm-x86/grant_table.h
>> @@ -37,7 +37,12 @@ static inline int replace_grant_host_map
>>   
>>   #define gnttab_init_arch(gt) 0
>>   #define gnttab_destroy_arch(gt) do {} while ( 0 )
>> -#define gnttab_set_frame_gfn(gt, st, idx, gfn) do {} while ( 0 )
>> +#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
>> +    (gfn_eq(gfn, INVALID_GFN)                                            \
>> +     ? guest_physmap_remove_page((gt)->domain,                           \
>> +                                 gnttab_get_frame_gfn(gt, st, idx),      \
>> +                                 mfn, 0)                                 \
>> +     : 0 /* Handled in add_to_physmap_one(). */)
> 
> ... it will end up to remove the mapping. I don't have a better name at 
> the moment. However I think this would deserve some documentation in the 
> code so one can understand how to implement it for another arch.

Hmm, perhaps. But wouldn't we better document the final behavior (i.e.
once the remaining Arm issue got addressed)? That may then also lead
to overall simpler code, ideally with more suitable names (if the
present ones are deemed unsuitable, which I'm not convinced of).

Jan


