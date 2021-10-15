Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E142EFF4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 13:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210379.367234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLk9-0005uM-6W; Fri, 15 Oct 2021 11:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210379.367234; Fri, 15 Oct 2021 11:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLk9-0005sL-3T; Fri, 15 Oct 2021 11:51:21 +0000
Received: by outflank-mailman (input) for mailman id 210379;
 Fri, 15 Oct 2021 11:51:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbLk7-0005sF-R6
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 11:51:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 349da191-2dae-11ec-822f-12813bfff9fa;
 Fri, 15 Oct 2021 11:51:18 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-omwxeIjkMaaBY8a6tb5-jg-2; Fri, 15 Oct 2021 13:51:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6381.eurprd04.prod.outlook.com (2603:10a6:803:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 11:51:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 11:51:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0067.eurprd06.prod.outlook.com (2603:10a6:20b:464::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 11:51:11 +0000
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
X-Inumbo-ID: 349da191-2dae-11ec-822f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634298677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJObJvrHkBBtUo8kY0zE7JBZu0xKJo5GoGPZmP9A/+Q=;
	b=glP6EbeQbsd/tJ8/UZbyP9qNm82LTTS47xC56Pl4ZJ+qnBzwFtWa5m01MhYgv2krP/iy6r
	NjLrI5NP2o+zyKUMSGvG9/BrC5AAF3M+gpNGYn4LbkYBnncBzCwoaBqkHU8kSQ4d8R2Lan
	saEYAJNz7smORyhoHO5ik8i8QLAeQPI=
X-MC-Unique: omwxeIjkMaaBY8a6tb5-jg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIlEh5BY5vIjkM2Gx7bk2mEsXqALR+/THJtpb/xXQEJjHeXX/IF0VB0YNClUaTsudkcjgNmvPadioC3WTae3Rt+1GGlZf8wfDf2esqjpgAvDwLbG7vDS59yzqKzMbd3S+yV1H/p7bLT4EoEtr0hbszCPvTa0jfaZfZbYIClCHXwFUqICQtvFOryrXrE14ypb4Cy9GX75afO6uT5DbOs0/sXeQYt4fQsnmw6OOdNCbsUErXJROTFw+8DIkaufyNt7BwrmvKiegrQyFgv+CStppmBdzn6zbiLy9zWKq7njkbyi9+8zWJVvpa67OH5pg2L7DUYyjCJ884+OlsrVZgdh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJObJvrHkBBtUo8kY0zE7JBZu0xKJo5GoGPZmP9A/+Q=;
 b=jK0IoDNrDt+MXSU/A/pqr6Sxyh/2tjRGLvdY+6x+CaXghEXxDLlUEat398aSAB63FsLbniO+tHIT14BZ7h7HkpwYuFDAmEHgMdM+revwNEo+sQFIhwowdVxQidJzaLKdlqKZpV3YW9sY6PhzeTBqLbwleWsUgZBBzHS9CDKkD+So/RbKhgW65W/581b4dHkUVgcYDUwXD4YkACz9zcriJ4Q0atwoTxcQebPf76GX+ZcxTdetwrhWyWz7wNm5LWyzu4jCHeboEqPJd/uBAGMOZuko1rKJfNMy5g8/uqQuiKq9VpgAr6DIndVFGgVsHw+riZM+983uKkyNDhEh7P5bow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 6/6] gnttab: allow disabling grant table per-domain
To: Julien Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-7-roger.pau@citrix.com>
 <b900f179-c6c2-00f5-e531-5110307fa491@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4580f38-763f-e7bc-4982-3eb0cef07d8f@suse.com>
Date: Fri, 15 Oct 2021 13:51:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b900f179-c6c2-00f5-e531-5110307fa491@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0067.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0adfe356-4157-4f3b-cd2b-08d98fd215ca
X-MS-TrafficTypeDiagnostic: VE1PR04MB6381:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6381EE49A22067D7383772D7B3B99@VE1PR04MB6381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I4cgOCDBfS2/xE1nMF9aOPv0ICPc+bg/jgMTHf5KO5SwH0cCzjrMCRPXXG9cWxq8cUSUBcoDyqHgTWFJFtv1e/RI8nFKz0tiUYeN4bdm31/wB/nPgcGKaJN1PMjGKSqM+H76ILzsgPPxPGTeS7zqLI5yLdgMVPboGfN8+rNoziS3POXsdL8IJy81ZWuuYp39Ad8PRJ31hCLgIfF0YhuEe6ORHBvJ+CsFG58x6OBYPag5Rd8wa2ctElrXiNicaS6OCXcOutGlTGNs2coDcnrdJUZ3ds04+ShrmGVe/GKlkwDUA8RTfQhLrLI2KOy5LCE/jwAx2EFlxML/OBj31yOSDIfB07oh40N4qo+japb4Rhb68MQkZc6+OARyYoagZGzFbE/baJivVBCuD8AwUl/VQuQnW7hwc/hi41l1quOOLhQXgv7i/mhMT7f7Ns4K7dVY3tstZHZTue+9lcWYLN4E4my/Wj9Ecotg0YZETDFxMO93LggUhm8aryS64MnRmwqLyNxcgf/QRZk++9AX0kgZl5lXUnv6/6fEms3bay87JthH+/GX7hQftIVfyyLApKMlec+wdCIQLoKUraRE266MiHbtdPl68wdWi0ytzAFXNrQjdywvLc0A2rKK6UcYeRoOn6qMHl6+7GOQpkqgX3eIrsZP35Nt52gVn6EMDTX7xdMmpz7PQ5ph903RolwTb4l5+XATpBLr9bpgLWGBWc4niil1OQOcDAOBho/uSLA5qft0yY8qNoXq2UnCb0kOHxiZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(956004)(2616005)(38100700002)(66476007)(508600001)(66946007)(66556008)(26005)(31696002)(186003)(86362001)(36756003)(16576012)(2906002)(6486002)(316002)(53546011)(54906003)(8676002)(110136005)(5660300002)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmVQSFdVeGtwWVhOc0JUT2NxeE8wT1BCc1FFLy9IV1NhR0tHd1JyUEhRNEEv?=
 =?utf-8?B?dTlKODZPRGdGcVdtTGtRUmJmdktJWUE3Y1VDdTUxNTlQbThKTWJQNmJHalFW?=
 =?utf-8?B?bkpNa0dDMlhad2lCaHZsSWF6UnF5Uk9CaDNqaGxHRkZDTFdDd0N0WU5NR0Fk?=
 =?utf-8?B?VERhdGxNVFM4Q0Y3UFE1ZUlKLzAxNStHQ1B1ZUkrWm14VzNIK2RmRjdNVjFu?=
 =?utf-8?B?WHIwanFINWtBR0hhZy9wWDdZNzVRVjY3MHM1Z2IxQmtMeXlzRkZDcE5oYlNu?=
 =?utf-8?B?MFlzajJtaFpXbVB3T3dTaXlpbzlmUzNEdFR1QmxDQ3RJQnhnY3RoSjBJZTBO?=
 =?utf-8?B?NFJFQ0tzdi84VkFhQjFhNWxPNER5dmhrK3FvVnpTMjk2N2JyQ1o0V3E2OHlQ?=
 =?utf-8?B?UkN0KzFIT042UTBSem9YMlVYNU00V3V5UUxBQUtONnlrUFZFVDNrMUhPK1Y1?=
 =?utf-8?B?MHYwYmlmUFZmRzZHcDRwdjM4VTZlZ1A4QXVndjhXNW8yVEdycEg5UXFPMEVx?=
 =?utf-8?B?R2NNTnNhSHMxZUthbEhzTGJ6dTlQSlJtazJGczVjdkVmN2ZQSWZXbUpsdXpk?=
 =?utf-8?B?SDlWV09jMzFVSk92SzRkeUxTU2l6b3BMTVp0R3RsYUt5MGgvYlFuK25oOVU5?=
 =?utf-8?B?TnF2a05OOHV0dW5UelU5VU9aQ0NPU3dnaE9sVis5Ry9ZSlJ4bHpkTmNUYUNw?=
 =?utf-8?B?am1tRktOcnZ3N3J0NTFwSmlBOE5UR2NVeGc0NTliazlSdkNjT1owcGZZWFBY?=
 =?utf-8?B?MXZGeGl3dUFRZ1JSRCtReDFJSy8yQ1JZTFovdFNsQ25hYXY5T3NRSmJ5dUd4?=
 =?utf-8?B?dkNYSWhsWDJodUhpMStPOWR5OVlTYmYxbU1URG5OWjRsbmNsWjdXYUxYY2hx?=
 =?utf-8?B?ZlFCTlF0RkFJQ2taZlpMaHMzWi8vRU1nSERGUStBNDM3YTJhc1FnN3V1Qm0v?=
 =?utf-8?B?eGhjczMzTnVEVmd1VHpYWXNBZ2gzMCt3QWNPaElHRFl3Q20wb0hucXB5WDRR?=
 =?utf-8?B?SVY1ZzVFZllMWTkxaUVkcmVTUEVPTGxUYXk5NlJkeEdjd3ZxcWJPZjFZS0xt?=
 =?utf-8?B?N1k0S3gvUSttQ2J5MkpEWVpvY2ZKNTg1aTJISWJXQkcvWjZaNUdzenFJMFVF?=
 =?utf-8?B?OG9sbTBiL3BlYjdJb0srZEQrVlIxMzJEOTk4MXNVenZyTmw2SktCbFNqMHVU?=
 =?utf-8?B?MktuQmd4amZSQmcxbm1kT2ZYcDhVK1QrNGFEek1KLzBwV0RYYVR3TnJUUjlo?=
 =?utf-8?B?UjdCUXJqbHRtTmFOUGlCOHdwaG9MSUtuZzR0TmxDazlnWUFLdW9rTDNzU1ZZ?=
 =?utf-8?B?dERSTnpyUzJPcXNYWWx2Sk8vaXl1ZXgyWm51bDc3MnpGZ0NJTGF6Q1ErTUJQ?=
 =?utf-8?B?ZlpDVEN4MVJzVVFaUXVhemFLUm92bWZvVXAySVJPQ3RBSDRucVNGd3lHTFhJ?=
 =?utf-8?B?ZThQWG9MVWgwNVpiSG93ZEpMd3dMeXMrYW4yU3QwSW4wRHRtNmFaQTlkK29i?=
 =?utf-8?B?M2FSTjdCMVJqRDFHK1RmOTQ1Mi9sY0RZTlRWUEtMRWRBMTJnMlIwNHBYdW9L?=
 =?utf-8?B?V3RXQU9UL0puS1NrZTM5TFRKYlpmSzFqaTcyRGpBYWtNK3F6TlMram9aZDR2?=
 =?utf-8?B?OUxlZnhuQ2NhMjdUMDRrbkdhVzRHSWM3U3lnZzhrSkhhVGdvYll3K043a0VD?=
 =?utf-8?B?M2xFYUpRV3QzeHBDYitreGtOWVBoTVNaL0IvQjdqRXczRGlKTmFTSFVZUGZO?=
 =?utf-8?Q?dmA5eM3FXBisXtqKnQ2hFMo6ed4vqqaGRAeS6rF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adfe356-4157-4f3b-cd2b-08d98fd215ca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 11:51:12.2171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8n3g0xfB0fpJy2zn74iSDW/IRI7ku0g51o0d0tSWkrjHPvee7/7PTrN1om29JC5L5acQE2M6/mOJVIlcHXiMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6381

On 22.09.2021 11:19, Julien Grall wrote:
> On 22/09/2021 13:21, Roger Pau Monne wrote:
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -583,8 +583,8 @@ L<xl.conf(5)>.
>>   =item B<max_grant_version=NUMBER>
>>   
>>   Specify the maximum grant table version the domain is allowed to use. Current
>> -supported versions are 1 and 2. The default value is settable via
>> -L<xl.conf(5)>.
>> +supported versions are 1 and 2. Setting to 0 disables the grant table for the
>> +domain. The default value is settable via L<xl.conf(5)>.
> 
> Technically, the version only applies to format of the table for 
> granting page. The mapping itself is version agnostic. So this feels a 
> bit wrong to use max_grant_version to not allocate d->grant_table.
> 
> I also can see use-cases where we may want to allow a domain to grant 
> page but not map grant (for instance, a further hardening of XSA-380). 

Or the other way around: A typical Dom0 may not have a need to grant
anything, but will likely want to be able to map grants.

Nevertheless I think an overall "no grant operations at all" switch
is good; both of the sub-aspects already have controls.

Jan


