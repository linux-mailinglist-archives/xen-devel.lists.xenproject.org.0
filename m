Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF924EAC72
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 13:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295813.503538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZAB4-0001SF-62; Tue, 29 Mar 2022 11:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295813.503538; Tue, 29 Mar 2022 11:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZAB4-0001Oo-28; Tue, 29 Mar 2022 11:38:22 +0000
Received: by outflank-mailman (input) for mailman id 295813;
 Tue, 29 Mar 2022 11:38:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZAB1-0001Oi-N5
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 11:38:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba5d563a-af54-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 13:38:18 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-5-p8YpPtPJ-IXaif0ImZuA-1; Tue, 29 Mar 2022 13:38:15 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8301.eurprd04.prod.outlook.com (2603:10a6:102:1c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Tue, 29 Mar
 2022 11:38:14 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 11:38:14 +0000
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
X-Inumbo-ID: ba5d563a-af54-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648553897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GEIPtuA3lEWF3YPBruq1BErenQb0eNex0P5BL5QxXJ0=;
	b=GvL6eZypWMEpcB0KxTZ8ilUlIIsyzg1CVBoCg8ojZKB6dFvbU/bDiCSIhdygOp9CCi+/B0
	wez5GjsvDcAkjr/oF2E8SVzdB4p5HkLTd4T9PneJGL7Y9bK0VjO+mjSOV+NcBJGMd+ywik
	eDYE/SkAA8A4pkWOKCwdUBdTJacuPqE=
X-MC-Unique: 5-p8YpPtPJ-IXaif0ImZuA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlEoE4K8Jrj/AYGAYDWxaORT/v8yTXeg7MhzHSqSu5U+Sd6OJ2bvawDzOuXA7ZAH1rlI83OjnFTypcaDodW7VFy1WcQKChJmWkhW+l+NxrsKve2iRAJRdBm2SIgxrCxQyJhBKf57ixFvp12AyW0oWXxseyalq7Wmj1PivPSrPYx/seq3acGm5mzY4iUmRaaRSHCurDAnaBMjJ9LZ2hiHHVSdVtbo13IM6Z5b5gpNzfzUuLezhJ07Ie/tJDD1iE0+BzZShY1hLcghejtoPM1S1Ub89U+SL4uLO7Niz0piWGxsufO7Okq9R6/Ag45CnagsGo1PCD1rMePi8KDBcguHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEIPtuA3lEWF3YPBruq1BErenQb0eNex0P5BL5QxXJ0=;
 b=YFUq8PyNR8ycWnAFbxwV4R+j3eHx7X5xNkQZwV+REMhJSoKCihgjpU4PvS3nqID5kBMjn8SGuPrexI8x3TlnI/IChrtyquUA6CK8owFU2DipOJR3iMRPxpCwpMYTzsyabKJmaBAJJdsK4aBFIkfZEy2GwWKPhcsnP91PG1tShgLR+BSB5KDbuc1cqVk4VUVZZemOhr2cIaa4MLFPO6wO9nm2l5VjamDgk/5ioLPYo2aixMKhHcrl8hmRJE9FXp4rUnjFYT2Qb2SEA+iIWqBitLK2OGvxpjS3XUuexVH6M3AyrLqdrLT015LDyQRV/+1EOu+d3deDYAHJjMhDuddDQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2de92d9-0699-5669-5b2d-b94216bf9dec@suse.com>
Date: Tue, 29 Mar 2022 13:38:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <293aa4e4-ac6b-2446-ea78-986014993e89@suse.com>
 <c2c936be-5f11-393b-3bcc-82a42fa964af@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c2c936be-5f11-393b-3bcc-82a42fa964af@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::42) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7518f333-32b0-4d2a-bd60-08da11789c4c
X-MS-TrafficTypeDiagnostic: PAXPR04MB8301:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB83011D954ED25BF8C6353CB3B31E9@PAXPR04MB8301.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5DsdAvhd0ERJyTZUPw9fd3+HEs6fNBH2lnegOYR4bv++qFQXaqgGscIQWLXTJQmauboXrRQ8DiUB/eBXUKzDlw56/yXr88xiPqZyOZS5hAqbxYd7w8A2jdHitYR7l3AZxFAFnxcoQ8pDr6IcYV0BmHB+4TVHryUP6E2SACc/H4jMFXwM2O15DERC3tP2ETVt1D/VH2F0WF3b0ztMh4AcdRgSVlP+EKNbBk86uNw6sj+ecDFykLi9r9eiE73LoMxf94izZK0lnhEh98QNpTh0UjMtkk0fOoyDZ/XI25ux1+EJV/PgZk5NzSPpXLaFPgn6g1abwNJXtb36bQABySwuPGHlYd1kPHJt+gcTjlDdignHB50LTOm1Bu3RhG07R2VqbW7wPtDvGpN017Bh/t1JqWFnyaw5hr+e+pJ/l2wbHTLaVANUc687AcK/g12CSgjMtrfUqa+S/i/zTalxNOPjm96PTyHp4PI01eD+FPa48outq75V+rTH70Tj2+wW+cmJAnE1B48oRHNfV/AfUmk3A6bUX65xvdsHi7IeHKGkl8v0uKHUufboaZ/uxG4WWM/y10vfHKA3eWUwhg0GDl5k96IS1whXqDCO9rvjRFbfxUr6CptYVHjMQ8IZLTZ1Irn9flubUTl2Z/hj2JOVjScelv2BfCUjh3RvlGHKtEDgYHB6X0MRC+51/3ebGW4EZ+Jmf/pRdMh/mAeAuDeTZ/oo78dVz1ZxPn3rIStjFY6TzWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(36756003)(26005)(186003)(53546011)(6666004)(83380400001)(5660300002)(6506007)(7416002)(38100700002)(508600001)(86362001)(31686004)(6916009)(8936002)(2616005)(66946007)(66556008)(66476007)(54906003)(6512007)(316002)(8676002)(2906002)(4326008)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTkyVjMvSU1JTGNscmFDcmV5bndwdUkvcHoraFV0Q0tMdnV2NlV4cEpMNUdR?=
 =?utf-8?B?enplaEhxaUJmWTNXWTZCZ09aSERUdzJsMy9YNW9SbEowT2RKbnpScFAxOWgy?=
 =?utf-8?B?UDRsTGNKZHdWZUp1Z0Y1bkdKVitjRTZPTzFrUFVWTWFPL0pUWWJoNmpwcXBy?=
 =?utf-8?B?TDFuNHQ2ZStBcFUwa29LWnU3L3hqYnRHRUtDNkpxa0ZvT3dyaHhQMVd5ZkNl?=
 =?utf-8?B?TlE1d3hISmtxRlRtV2lEY3krVXpsUXVHczhEL2pEMmZNdEh2WTZFdUVWNGFq?=
 =?utf-8?B?K0NuN3Jub3FxendMajU4V2dnL0JZRkxtYS9nVkhKUEFGVFIvOFJOOEFYZE02?=
 =?utf-8?B?VXV5aW1LQ0FVSU1tWlhjZWFVS3V3MlBETCtHT3V0b0piN3FSczhqTTlSTHJi?=
 =?utf-8?B?VFgwL1J3VHJOM0hWU3k4YTJLd1N2RmxEUUsvT2hLN2QvaUx2UTZDclo0OUxx?=
 =?utf-8?B?YnBQSXFQVnFUelZWemVxenc5MVFFcHY0TXh3YVpEZnpIMTh2c0NmdWR3R2py?=
 =?utf-8?B?dnUydmd6R1pOanJKalZreStJcDlGNHAyYXNMd0tsclVOV2ZtS0xUWit4QWU4?=
 =?utf-8?B?WmFWb2Y5TXgxUUJJVnlFVWtRaGZ6akRqQllKOXlTZmlENE5sUFFUSDIxSldk?=
 =?utf-8?B?RWwrS0tJdU1jUXp3T3luZDRsdktCOVlmUk90SU8zeEtyYkxJRDZIZGtPS05j?=
 =?utf-8?B?OTNZQUU1WG9ZdlNITFpMOXAzeHlOZFRnVjlBeTR1RlloSk8reWRqYUF4T1ZV?=
 =?utf-8?B?bm1CRjVhbnBJZ2FiYzFiYXFLbFhlek1mSW9aU0F0bUd0b25EMFU2WldoMW0y?=
 =?utf-8?B?RXRqMDNZL2R2a2IrV2RhK3pocE1wR24zUjhjd3hySUoxc1lDSldvdkpBR2Fp?=
 =?utf-8?B?QXZ1UUIwNElzcjNrYVB4Q3E3QVI2SDhPZ2p0N1lZM0h0RXpBT3FVaGhxakJB?=
 =?utf-8?B?TUhUMkVXL2hSSHFadmZZNmJvV1U3WllzWTVFcTc4SjlVWm9CeG9TMkpZTTZy?=
 =?utf-8?B?anFpYkFsdVNrZkZvd1JZZk9VWUYrK0dRYk9BSlBkOW5MNTh4a3Fra2FXcWE4?=
 =?utf-8?B?TnNNNlRMdGV1cnFRbFpnUUpCVUNIWHRpVnJkMjhEN1RFRzNKMGpPTUxpSEZD?=
 =?utf-8?B?Q0JJcnB3ZFYxTGVSOVUwY2tudkpvOXZRbFJ4R3FEQjkxWkNpM0FkQnFPazZu?=
 =?utf-8?B?MVdhcCtjTFNnSXNMWnozZmNucnp0b3NVOU5vOHdmM3V4T0xaaklpR3MrZkhN?=
 =?utf-8?B?aXVmM1hUSUVBa3VqcXR5U0Y0WGl1SGRpTHI0ellGbkw2dmthSTY1ZE9MNXVx?=
 =?utf-8?B?L2RKa29xWlVrWDZXNzNJRE5mc1RIbXp5bVVWMGdJK2wwQkFMcFFjYmJ2SWx1?=
 =?utf-8?B?eTM3VzRERG52QkgwbDByNUhkYUYrbXZNTHJSUDJtc0dMVnk4RnFWZ3g5cEo4?=
 =?utf-8?B?TzVYZjhMcXJSNmVkYjd5ODNzanMwRmlKQ0NyZ2lSeVluYkpXUDRiaWFjUEFo?=
 =?utf-8?B?S2lhTVpJSUhlNDl0cXZSRmd3bGo4UkdmNVUzWUZwemIvWUlEam1FSDh3Slgv?=
 =?utf-8?B?aE00VXRDUkFMYW96aTVwenpzOEl0SU0rM2U5bFhyelFhMnRaUm5XSGlJZERu?=
 =?utf-8?B?N1FHYm9CWWR4QjhtNTlIblF2YWNGL0VxTmswSjQ2S0JWY2RNQmR4bDdWV0s1?=
 =?utf-8?B?QWVPU2V3RUprYi9rZTFjM0dNOXdrbmFLM05kOWh1dldmYmV5Vmlvbk5zQXpq?=
 =?utf-8?B?WFZ1UkdFenIyeFZ5bk9oV21FWE1kWnBwdlJtZGNDZjFORUF1eG9ERWg2OExn?=
 =?utf-8?B?M3hXdjF6MnA0SzNHelhtVG1rZzJYR01xMnZyRmZsSXFFOGFoeGFXSld3RElH?=
 =?utf-8?B?dzZ1eTM3ZWpvYStDRURnWHg3T0J2Tk42Z3U0V2Q1WVUvUTJ5L21kMXd3QUdx?=
 =?utf-8?B?N0d2M0NFUHdQZ3hHNG4rd2x3WGYxUURveEp0SDZpdEdrUmg0eVZOQ21YQnJS?=
 =?utf-8?B?azJKM0RDWHozRTNXQjl2bGg0ckh6bFpqMVhiSExyWEpQQ01IUm9ZZmFNZ09Z?=
 =?utf-8?B?cGprWnQ5UHBTeWRHMUZKQUZQbittTzEwemV1dDUzUjJYdHZQS1lhR0JRVnd0?=
 =?utf-8?B?aVpCOWJYVlRacmZFQkRpdXBJZUhNQllkN2cxb0k3aVZDWmR4WkE0SkxGaWdT?=
 =?utf-8?B?a0tiMzMwQzBXOENzdUdzVjNOd3RRL0hQMzcyKy9BQmJnN2QwV0orNm9ZM0k0?=
 =?utf-8?B?TDJNVDVsYzJVNGxJSHZmOXNiRC9Jc2NxakhDM0xFQjRoc0pHUjhzMTFCRldZ?=
 =?utf-8?B?ODF0K2cyTGROZzMvdDVyLzMvdUx6Yjh0ZjkwQWpHV29xTFY5djBzZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7518f333-32b0-4d2a-bd60-08da11789c4c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:38:14.4087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilAATutzdC2ATJSewHjRI2l90JteBzDnVx2N9OZbjqFRjymITDvTRjY8FPO9pVsAVPAzgbqVBjEWZBHngkEqKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8301

On 29.03.2022 13:07, Julien Grall wrote:
> On 29/03/2022 11:37, Jan Beulich wrote:
>> On 29.03.2022 11:54, Julien Grall wrote:
>>> On 22/03/2022 08:02, Michal Orzel wrote:
>>>> --- a/xen/include/xen/xen.lds.h
>>>> +++ b/xen/include/xen/xen.lds.h
>>>> @@ -5,4 +5,104 @@
>>>>     * Common macros to be used in architecture specific linker scripts.
>>>>     */
>>>>    
>>>> +/* Macros to declare debug sections. */
>>>> +#ifdef EFI
>>>
>>> AFAIK, we don't define EFI on Arm (just CONFIG_EFI). Yet we do support
>>> EFI on arm64.
>>>
>>> As this #ifdef is now in generic code, can you explain how this is meant
>>> to be used?
>>
>> The identifier may now be somewhat misleading, yes - it has always meant
>> "linking a native EFI (i.e. PE/COFF) binary". The equivalence "EFI binary"
>> == "EFI support" has long been lost.
> On Arm, we will be generating a EFI binary (or better a Image/EFI). So 
> IIUC the description, we should in theory set EFI.

Well, no - you're mixing up "generating" and "linking". What's of interest
here is what the linker is told to produce, not what may involved further
processing steps. We're talking about a linker script here, after all.

> But I think it would do the wrong thing on Arm. Would you be able to 
> explain why you need to differentiate it on x86?

The differences aren't unique to x86; they all are related to how ELF and
PE/COFF differ from one another.

>>>> +/*
>>>> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
>>>> + * for PE output, in order to record that we'd prefer these sections to not
>>>> + * be loaded into memory.
>>>> + */
>>>> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
>>>> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
>>>> +#else
>>>> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
>>>> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
>>>> +#endif
>>>> +
>>>> +/* DWARF debug sections. */
>>>> +#define DWARF_DEBUG_SECTIONS                      \
>>>> +  DECL_DEBUG(.debug_abbrev, 1)                    \
>>>> +  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
>>>> +  DECL_DEBUG(.debug_types, 1)                     \
>>>> +  DECL_DEBUG(.debug_str, 1)                       \
>>>> +  DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
>>>> +  DECL_DEBUG(.debug_line_str, 1)                  \
>>>> +  DECL_DEBUG(.debug_names, 4)                     \
>>>> +  DECL_DEBUG(.debug_frame, 4)                     \
>>>> +  DECL_DEBUG(.debug_loc, 1)                       \
>>>> +  DECL_DEBUG(.debug_loclists, 4)                  \
>>>> +  DECL_DEBUG(.debug_macinfo, 1)                   \
>>>> +  DECL_DEBUG(.debug_macro, 1)                     \
>>>> +  DECL_DEBUG(.debug_ranges, 8)                    \
>>>> +  DECL_DEBUG(.debug_rnglists, 4)                  \
>>>> +  DECL_DEBUG(.debug_addr, 8)                      \
>>>> +  DECL_DEBUG(.debug_aranges, 1)                   \
>>>> +  DECL_DEBUG(.debug_pubnames, 1)                  \
>>>> +  DECL_DEBUG(.debug_pubtypes, 1)
>>>> +
>>>> +/* Stabs debug sections. */
>>>> +#define STABS_DEBUG_SECTIONS                 \
>>>> +  .stab 0 : { *(.stab) }                     \
>>>> +  .stabstr 0 : { *(.stabstr) }               \
>>>> +  .stab.excl 0 : { *(.stab.excl) }           \
>>>> +  .stab.exclstr 0 : { *(.stab.exclstr) }     \
>>>> +  .stab.index 0 : { *(.stab.index) }         \
>>>> +  .stab.indexstr 0 : { *(.stab.indexstr) }
>>>> +
>>>> +/*
>>>> + * Required sections not related to debugging.
>>>> + *
>>>> + * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
>>>> + * be benign to GNU ld, so we can have them here unconditionally.
>>>> + */
>>>> +#define ELF_DETAILS_SECTIONS     \
>>>> +  .comment 0 : { *(.comment) }   \
>>>
>>> This is a bit confusing. Here you seem to use the section .comment. But...
>>>
>>>> +  .symtab 0 : { *(.symtab) }     \
>>>> +  .strtab 0 : { *(.strtab) }     \
>>>> +  .shstrtab 0 : { *(.shstrtab) }
>>>> +
>>>> +#ifdef EFI
>>>> +#define DISCARD_EFI_SECTIONS \
>>>> +       *(.comment)   \
>>>
>>> ... here you will discard it if EFI is set. Which one take precedence if
>>> the caller use both ELF_DETAILS_SECTIONS and DISCARD_EFI_SECTION?
>>
>> Given the above explanation I think it's clear that only one of the
>> two may be used at a time: ELF_DETAILS_SECTIONS when linking an ELF
>> binary and DISCARD_EFI_SECTIONS when linking a PE/COFF binary.
> 
> I guess this may be obvious on x86. But for Arm, we are generating the 
> ELF first and then extracting the information to generate the binary. 
> The end result will be a binary that is PE/COFF compatible.
> 
> So to me, it would make sense to include DISCARD_EFI_SECTIONS because we 
> going to create an EFI binary and also include EFI_DETAILS_SECTIONS 
> because we are building an ELF.

No - as per above, all we should be concerned about in the linker script
are requirements by the linker for linking a file in the request output
format.

Jan


