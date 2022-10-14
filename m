Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FFE5FECAC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422737.668972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojICV-0001Wq-7v; Fri, 14 Oct 2022 10:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422737.668972; Fri, 14 Oct 2022 10:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojICV-0001Up-3v; Fri, 14 Oct 2022 10:45:59 +0000
Received: by outflank-mailman (input) for mailman id 422737;
 Fri, 14 Oct 2022 10:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojICU-0001Ui-GR
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:45:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62807c5c-4bad-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 12:45:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8546.eurprd04.prod.outlook.com (2603:10a6:20b:421::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 10:45:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 10:45:56 +0000
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
X-Inumbo-ID: 62807c5c-4bad-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGpxUOIA0iu0Xv+YdQlPtRNT1OBNf+qiW9uT3PZbws+GtmqFr5pTHo+eQlA7qSI+TvGOA/zUjpZYg0jru2Mf4vrXL1PTjJb1SBGFp7XGuKNIq0mHWrHEg0TUR2VsNAvHhkh292llIT774B0DfUSIr/IkVgmrDARQp5P20X1oDjA8SjC442z5E+c0PADS+i5r2vramzcZ9CzXtFyK3eCOUrBCL8pVkl+QNtbHkH9Da06A7Wf8ikYqWqr0CFJVMEIKh7Ek0bWEm6bMtSAvjH9ao81pPswbVPOl17wuv4bID2sVbINjVXDHU0GE3NFdH1pm4oOE4TNE/qIE+C+HO1uZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgQ2wrU8Ch7wfwAdiTSrgmW0AQveNp6rsVxf8bjn4AQ=;
 b=P7OUddb60iGfnzdKqCn4mJ87WnX+SzqbLRjpMKu+nkVKJbaq3V1YjKC16F9hkaWYK5dd3GwqfqgLFLIwH+nP2PoRT9eJfEu6EKe8OSCTFCXpbuiENh22O/1JXJb5m0lx63/uHGVnysRJH/Z6HTVHJH5oxKRGVV+7+/dL5VxOnlS79BNkDW8ZTKYZrTubJ7kI9pvN8Miih9uwvM0H9RXNM3aULZDEzPjUbMU5796P5x7gBDPtOthtmwEg8Movo0SdTGNsh1RE+Xo2Mvi6B12j5M4u7EQhrXeZrVoyDvwSEoWbVnkJb+W9uPkZnWrHbj/hdS9MNEg0pr6Fh49iC2fEOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgQ2wrU8Ch7wfwAdiTSrgmW0AQveNp6rsVxf8bjn4AQ=;
 b=5Rt1m4/+acOh2IcyB1mMUuLFRZc/EN7K5kksaohDzRJP2FOUmE0Tudk5wATk/s6NFa03KTggFkcf/uRWnomiEIjqHWlJU1JflJW33q8bXAWTGkiMFpaYi2lCdb4qsww4Uhm1CiXVrzohAsNin9JTedYeCtEEOy0P+z8feMBeBZgZ429hkP4AlZAzs9gOKxQcYKeZ8ZmocpCczTKRA1EiRet7KZrhL4PqF4JYFBy/gMj1Q/fbFeZ8YdA6b1to7Ykcv61Cy9c5gJgvYM2QEIqhOOPch2iLQGnMKwnERITetKFyGxRRy9ZU6Gqbt8FUbuarX7HBDy6Aniu71iZp0ifINg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db3e4568-edf4-c5c6-4f99-3444a38cc40a@suse.com>
Date: Fri, 14 Oct 2022 12:45:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
 <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7e24a21-1ebb-ede0-efed-275bbf503021@xen.org>
 <AS8PR08MB7991B0B2400B1B9D0E6B1C4592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991B0B2400B1B9D0E6B1C4592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: 685be64d-f821-4495-6916-08daadd14606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WO0BMzbcR6Mp15+kmQ87MH762CAWLIKaEyBt4BpTs2z49sfT9QKmXVMf2gB8aJJtut3YHZh0KWo7is9+AAmt+G6iY/7XbID8H4f8jvodGEMh/PA5YVEHrQ2NjzH8LopdsiSNrB1G64jrX1Xg5EV0BKw06ItIr+3kfbnY13Ox3JxEk1UmYJJYrcHZgXoGWOI4RQSroYbFtTtRXbeZ9JHEZc7OkWT69atmpm4bHp4Xb36sSxfCRlHr/2K4/k79IAL7GJWA1GiudGiHK1m8lWfErDSWxfN5DCbo8a+XP2+xeZewipwlTC0GtXoX56O7H1JRY9SR2WKohsqUB2iXJ/PBOOy6A6q7IxdIOme0oXkH3065xGyUctc6CNwOWb8jTIOFRGcGh2uv+7T4LcDkYgHpEX7yymo3zoBCvIapeFoUV57T/13PouiDSWxP3hLauOLUeyblP011UK6pKNotLh6T/2dCs9+oZyZwPnyRG8hCZIMfLaWQ2v68xQBTwB2/r+ejazu6z6M3ZoYIbs7zRUnlTmDNMFq7iMJVYqahNuUJP6eiNn0OTKp0ibzy6jMrRcNbK+WYydoZ2sHQ3sB16Xcbn3KKSovaV7RlyjYbKCb+JjsIzepgXMEAE4vhv+mn1WwAX2C/6PfzptBU0Cez33XXE3SYyiNfDMr/16ip4eek19MI5PoMrQKXRjNojggRHx6ERCVOnSOl1iDX8X6hj4/3HY7KLgW2yL0HXM68+lzJnmbvXCQI12uDDCggrtc+7xRUwbl/0Uf/cnNoTJ+8EBo7QPdX2iG0ZMVn568bYdwye8k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199015)(31686004)(36756003)(53546011)(2616005)(41300700001)(26005)(6506007)(6512007)(478600001)(6486002)(66556008)(66476007)(8676002)(4326008)(66946007)(186003)(38100700002)(86362001)(31696002)(316002)(83380400001)(8936002)(5660300002)(4744005)(54906003)(6916009)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnNrclNhN3Y5U0FFTm5JSm15Ny91bkpsQXVUTlZhQkxIMkRSVDQraVZLa0ow?=
 =?utf-8?B?aDJOQTdlRGhHTlNETW5nbmJxcG5VSjB0NkJmZ3J2N1VKVThLRENUcGxSMSs4?=
 =?utf-8?B?MG9DL1NxcTIxdngveXFQQlk1eHNFRGhsY2grVzBMMSszcFA3OG8yT01qT1h6?=
 =?utf-8?B?dXA4RkdsN3hzNmZDa2Z6WFo3Q3VmMkViN0N1K3JpNWF5R3o1WE1wWEN6N3ds?=
 =?utf-8?B?K3FQa3ArTW9uVGU0cjU4aWdCVWFvTHIrcnlIUkNvSkRHQ0dLelZXdjA3ZHNx?=
 =?utf-8?B?S1E1ejdIQ1RPcng5bmVia3hmWkVaUmM0aVFSVGwxZzVZK2FwZlREQVEyTHBF?=
 =?utf-8?B?aXc1YjBYTHpqUlFOMlZUMDBob3ZmSlZmd3F6YlhJMzZqVzJQTEpCQ3U2ejNo?=
 =?utf-8?B?dzI1M0x1dnJzZTREeU1sOGIydFhQbGZndEtDV0tOMWJObEdJVVNqR1E2blFV?=
 =?utf-8?B?VFFtenplSEwydG1qbjl2TG5hWmlnSlpySk9wRDVVaHFENTQxL3I1VitGbzFW?=
 =?utf-8?B?MTI3bXRPdVkrY0ZxZW5uRmxCcWYzYXA3MWthTE9kcVd0Z0Yzc0liNTZmYjdp?=
 =?utf-8?B?aXZYOEs1STJ4VHcyT3k0UnB0N2ZqYlZCS3lyT1RvaEJjNDl5ZkNjQzVZTTgv?=
 =?utf-8?B?KzFkMUw0WUJOaFZ2dlZraEt1TGxaZzF5cWNscTlMWGNiNDlUNHc3SFU3QTlv?=
 =?utf-8?B?WjdvM1Qrd1B6RlVMMHIvVlAzeTFtK2hGaTRHdDVpc281OFZOOTVUcGlaQWdP?=
 =?utf-8?B?TlorSlk0UTl4TTlUUm9aVzV2Y1Bib3gxaUk2OC80NGhzYlNWdGlLczFlb09X?=
 =?utf-8?B?SVkxcE5IbzVvSzY4d1psd1kzNytQc3BHbDBWdFpJZGZMcU0xVWFveUVrM1FS?=
 =?utf-8?B?MzUwK3F2OUJwT0NLcGJ1bHN3N3dTQ0VJL0tNTVNpQ0h2NSt1bHZBUzFQL0ds?=
 =?utf-8?B?bjhNZkJGT1EzVTdDQ21HTzZMRjU1WUJRcmFiQ1RuK2l2Ky9LYmgzMXhrV2ZF?=
 =?utf-8?B?OXdOUEZGWll5T3ZNS0QzVDdsQ29hV0FGTy9sd1owZkpEOXJodkVKTkhyMXBQ?=
 =?utf-8?B?RzRvamE3bnA5WDZoMS9tNGw1eWF4TmF1Qit6NDJvSHFjRDl2Zi9xclNiNnFW?=
 =?utf-8?B?c1Fpdk9jeUJnSUdaSHVCakFndjQ5dFhyOHY5WEk5Q2FnQVJ5b1E4TmhKODU5?=
 =?utf-8?B?KzFlTzVBVi80QmhMRjM1ZHl3WDhTR29BNXFnaWNKcG1TbGtKTXRTZjM2dEM1?=
 =?utf-8?B?MEl0dGpMWmVFTDlJWWFFUmxnK0IxSFBrSXQxZWREWnpJY3lOc1ZzM2xEaXhT?=
 =?utf-8?B?VGxCQ2tqck40eDhzNzVMNVpoN0swb2FmNy8zcm40ejEzeXZGL0RHREgzRk1n?=
 =?utf-8?B?VnRNR2x5U1J3cTBKcGpueGV5SEpZSE1kenovUDUraFZxZXVYU3h5V21aaFVq?=
 =?utf-8?B?eUp0YVZPQjJJMndzZUFoSzBIUmM2cldOYnIvaGkzRHlRVWNuWFB5V3pFMGsx?=
 =?utf-8?B?a2VFK0d4R0R2cG1mVU1KTHVwaVFueHZYNWpiSVJwUmhGNFNySlhZU01RZEUz?=
 =?utf-8?B?dW05dzI1Sit4QW13YmZCM2VXMHNYRzRhS0xlcDMxK1JmZDA3b2F5NTl2T2xQ?=
 =?utf-8?B?c3RWNUoweUdNbUM1VGJjMURkSTFCdDBVZ1Y4M0Z5OW10dGUyN1huZTdROXVj?=
 =?utf-8?B?VHFjOGpDTmovcTRzOFc4K1d2SDMrd0V4Z05mSVhwbExtYlRuMGlyQklwZ0dC?=
 =?utf-8?B?bytYZWtHOHZDU2lrbE9oZ2VSSXZhb2hHMkw4TlVxa01Gd3ozVzBNTERDRkor?=
 =?utf-8?B?T05RNWNzV2F0d1dCTUlrWmQra2VYb3o1RjQzZUNJbU55Vy8rTExtNjZHMktO?=
 =?utf-8?B?Z0dkOFlmZ2xWOFh5UDJXVmZuM3VLQUlzM3duNWo3aHdOeE5sdU83VHVleEQ2?=
 =?utf-8?B?RHdIbExIWlBIOU4rcUJ3UXltS3ZLdUJtVnFmU0FlSFRLc2lxZkJFT1lsUWpp?=
 =?utf-8?B?d3JpT0VNVXVXZWNnbzc5eWdhUE9NS0NJQ0ZlaHArbEtqYmpSS0hQdnJCd3M5?=
 =?utf-8?B?RjgyRHpKcnBLVTdKc1lMcmIvdDk1aE55OGZlN1hPMW9RU0paaWRaL3VQY3dO?=
 =?utf-8?Q?Ot53CPVhjJ0SZV3qC/FDfErj4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685be64d-f821-4495-6916-08daadd14606
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:45:56.2348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGqasZqM8vzBkakyJPrrMHUeHfNvqzMd4vt8WkZnyoscd3ozHXy+tcdyWt0yMOrw9b90epdM9Ka819JPn7xqGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8546

On 14.10.2022 12:38, Henry Wang wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>>>>> +    if ( d->arch.paging.p2m_total_pages != 0 )
>>>>> +    {
>>>>> +        spin_lock(&d->arch.paging.lock);
>>>>> +        p2m_set_allocation(d, 0, NULL);
>>>>> +        spin_unlock(&d->arch.paging.lock);
>>>>> +        ASSERT(d->arch.paging.p2m_total_pages == 0);
>>>>> +    }
>>>>
>>>> Is it intentional to largely open-code p2m_teardown_allocation() here?
>>>
>>> Yes, AFAICT p2m_teardown_allocation() is preemptible and we don't want
>>> any preemption here.
>>
>> Like Jan, I would prefer if we can avoid the duplication. The loop
>> suggested by Jan should work.
> 
> I am a little bit worried about the -ENOMEM, if -ENOMEM is
> returned from p2m_teardown_allocation(d), I think we are in
> the infinite loop, or did I miss understood the loop that Jan referred
> to?

Where would -ENOMEM come from? We're firmly freeing memory here. -ENOMEM
can only occur for a non-zero 2nd argument.

Jan

