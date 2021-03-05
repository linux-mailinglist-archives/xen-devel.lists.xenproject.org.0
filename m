Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1046B32EC77
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93724.176887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIApS-0001FD-Ic; Fri, 05 Mar 2021 13:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93724.176887; Fri, 05 Mar 2021 13:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIApS-0001Eo-FK; Fri, 05 Mar 2021 13:49:18 +0000
Received: by outflank-mailman (input) for mailman id 93724;
 Fri, 05 Mar 2021 13:49:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lIApQ-0001Eg-GU
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:49:16 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ede6fcd-7556-46bc-9bf6-e6636e77dd9f;
 Fri, 05 Mar 2021 13:49:15 +0000 (UTC)
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
X-Inumbo-ID: 7ede6fcd-7556-46bc-9bf6-e6636e77dd9f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614952155;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k3ZIs3mseuS7LrOwKLH9sP0SqOp+precY0i6rm8p+ks=;
  b=HRgZNimgJF33mzgih9hZn9/yd8D1jNkIVs7t0E4NytFuqJqrY1feJnw7
   Zpre9bZc3d4pT5vgnU6bh9Gxir0VX+TY/SeOtr3ayRBavOid4z+oATJyf
   M5aEYKSslCkwfFpRebnYBDSN5MHxnGVENLWy7tKczj3mShGEt/DNxa9/h
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vPIbbWU41yKwEh3SeL18d52kuTvNNU/y+wXWIm4uTsfqkYwj/4lPFPO1zct03FqEQTuZF2s8fR
 Xd1OS1Mv57QrkjQZXmqDvuCB8aaqI7QZrWiVG4IxkJx/LGXzReOa+Aff0lwrRD88iK7lmHJ5CU
 EHiNjFER7SLT4lGSOzaQXAY3f+rwM/gWoHObua8fhFT+Z3QvtJK9AP4QNu4XHy1DMIY97s+QPO
 fsrc9jinoh0huj+DlmNxB8093TS7cEiEDKiZL/kjaM+n5hjEZflA9aB54t3ktgSg7lBKx9PFRr
 Q0A=
X-SBRS: 5.2
X-MesageID: 38551232
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,224,1610427600"; 
   d="scan'208";a="38551232"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGUyHfKNFSncMRkFTl6v9Fnrh+puBzLAYGxGP+vY5S8WbNyRAVcRpCsxZ2bSqu/AgOwEnbuPTPN/iVUISM6oe5aksOsCSglKxzPk1ZNQV09pH4+8NbBx6A0DbqdshZ/Shw+QdO8skYJBNNSIa0SuRgtidEualc6I+ZKwaHzEWNEvkzatvwwVCh7yIl0cfZwuAZJ1Ebmwg74OEErdmSSHbflYp6aFIVMb6hWoHdaArOQ4oncHGtWyGsIMU9dAoH1yDOMj0HR0qsxBlvwZAFMC2NW0u7BucRk9bjal03GCVTgjAPV2XEaL+R/teF0caMkklkxMfHBbuEEcrTgFI0nQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuTTmgQf0YyiuQJRDFN+U13wsziN6B9FJBfsoWOI+zg=;
 b=OQNwnCVjEH9mJk2TaAcZJk/QgGpPqfXoEQkUW2XEOiGNWNA8QKdAzq/snmuM9zUelcu/9zNp7CAy4JZR8cuRwNb7sVB5JqTdZZCqQ3elOXKZCsRHIN8h2ScVYBOWnjjw5HrS8KYk55faTmjwvE1Yld5fMOsk1MB5WX+a9BUV96N5LMc2RAx02B52fwCHp5f/CDrKQ9absIAzSyLrDqTOX63rstT144MO08MtOrf6CDSF5495ARVHGeFHFOanI/NkFXXrouol/bIBRTEp1pHIXU+aKIf/JnIpTmvogTbuCJUcBFK9of8grBYs2G69M3V4FZqIK9jkT1KpVDGhKTNHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuTTmgQf0YyiuQJRDFN+U13wsziN6B9FJBfsoWOI+zg=;
 b=kLk7/iV8tDyEzuEsPMAhD67J9+YM7Uf6fD29CkLRLrZim0LP2hoS10Dd6PwxPSOtk1WKI7zjOTVbsgn4/DnbtM0KnOegBmW1MR5niZR2UP+/cpmMsJgQn9V1cgUarV5fHHb4TBKccI0kClFMPr+WN9Ax3+g7iCdAFoTtPxA7Fqk=
Subject: Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for
 xprintf() and barf{,_perror}()
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>, Julien Grall <julien@xen.org>
CC: <raphning@amazon.co.uk>, <iwj@xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20210305124003.13582-1-julien@xen.org>
 <20210305124003.13582-3-julien@xen.org>
 <0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
 <74568cd7-143b-48ad-b9be-bf4229655376@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <aff16375-9624-04c7-281b-d93fb38a05fa@citrix.com>
Date: Fri, 5 Mar 2021 13:48:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <74568cd7-143b-48ad-b9be-bf4229655376@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::31) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d39844d-d36c-4618-b405-08d8dfdd5771
X-MS-TrafficTypeDiagnostic: BYAPR03MB3494:
X-Microsoft-Antispam-PRVS: <BYAPR03MB34946ACB1D06374F8736E32EBA969@BYAPR03MB3494.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FarLoOMqnOodN+XhEcJHm7p+V11F2lDcOSUdymMFGDbkjM7dG5kPLFuQsXNVPkHewOBFKBRWyk9zGDJX8AU75Y8jCzj0X9g7AuqezHIogb9r5ZYonDv9D/TdY8lv9/UFb/6QhICO0DNAYtLGvIIXcPtgxr2ZedkDmQSKdvFL+JXb07BdZJNSQJeoDRwyVXVtoI+J5zATfpE/k+irYIfcbodqObN+P1CYB7XGZ75y1PRhUUj1ryb2JlhjYekQQJEtOYh4fllKNUj1P7Ic9qDvVYf5DpFKAXyxt70nGmOxssZCqTKxga6kZL8UOcyc881nUhYWkkB8uH5KtwdlTTIZ/KKSlnpplDJTNhiByyKPR8uczhaU41TyVGwWItp3F51q8u/h5XmmX/OBxBAAkCAmOTRWoHkY0sUMcH521HTjPV5ytl0irHgJiu3Yhaaq6c2ftMPVbs4XzCX0Rf168T/h6WJdyqAj/7TWHJoEw7T9t2PnTVTNL870oiwdPS8isnZ+qoivMfGRwpj5fWWmcnOCcnEwV+jXxUQTbovNFcJGCmK8jPlUAabZPkGc62F4Ga3bZKbO0glgW87/q28/LetsqJeVxaWbO445owQi8l4As44=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(31696002)(6486002)(186003)(110136005)(26005)(5660300002)(8676002)(956004)(316002)(83380400001)(16576012)(478600001)(4326008)(53546011)(16526019)(54906003)(31686004)(66946007)(86362001)(66574015)(2906002)(8936002)(6666004)(66556008)(2616005)(66476007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWRhUm96LzMybkhMRFpTa2d2UXJrdjBHaE9teGhqU2NlYU1lR2tMdGdiMFdS?=
 =?utf-8?B?dk9hbCszVldJMGI5NEZHQTRzV3FaZk5TcnlPdVNWcFhsQnJ0aXYrdXNQMDVM?=
 =?utf-8?B?eE4wT1Z2c3N3dDZCUjVPVVMxSHpYNUJydmpXaVNWQi9hdElpdnJySzdEdVBH?=
 =?utf-8?B?bVhtUkdUQzdzMy95U2hYdmk3WFV6MkxmTUg0OTlkUCtiM3VSSzJWai8wMy9V?=
 =?utf-8?B?TjVEampFL0hSVVJKRVZGcHovcWlIU0RRNjJKZHZKOHRCVE93djFBbWNlTExw?=
 =?utf-8?B?R0xYaVBZOUo3bEVkeGlDVDNzd0VYTFNCOVBrenAyVlM5Y0RKbmdxZW9WZXZr?=
 =?utf-8?B?WTlHdzBSdjhIbVo5MFRWZTNJTzZjMHErK2ppaHpuVVYxOE5GMGVCczFkdGEy?=
 =?utf-8?B?Y1Z4UnZ5QmIxSHZQQTcwT3N2NHRCenNIeFE4ZUNHWm5pTVBUT1NaNThnaUVt?=
 =?utf-8?B?a3RGK2xuU1FlQlhRQU4zUG0rYm5JVm8zZWdYYmRIYklaM0g4RHgwWGoybytK?=
 =?utf-8?B?TGlsc0pMeTlVbzBGNWE5Vm04S3VxTjRqSUtaYms3b2xwUlRIZUJKa1h2QWVV?=
 =?utf-8?B?TzBFeHlCK04yRG9kWEU3eCtXYzBld1ZLM0JHM1FGZHptNUF4VlljSFpwNEJy?=
 =?utf-8?B?TTY4RDg0U1VXYTBtdmpOWE11RUwxaWZTQi9ycStHdFA3aGo2T2F1c2J0VTJE?=
 =?utf-8?B?VitvbEw0aERCamthR1pJckR6dmY0UWhYdWp2VEFVWTlFMDlVMUJHcVh3bWtq?=
 =?utf-8?B?Vjl6NmE4S0tCTUNid1NCdUpneHdlRUsxQkFZWGIzMldleFo5MGNwYVFCWHlN?=
 =?utf-8?B?Z3E3Qno3OTRhcktoalRTTmVpWnVaNXN1WTVWcDM2dmtzcC9xdEpjZUlJVWly?=
 =?utf-8?B?SDRPVjRRRVFsSWhDOEdIb2dUV2ZxVWVoaFFLWmdGZHU5Q0NkQW1idTJLMVFQ?=
 =?utf-8?B?RnA2Qis3R2w5THJSb0pPYXc1UmRLQVFGalFtNWZ3TEZyWHZpc2w0T1AvOTJC?=
 =?utf-8?B?ZEQ3TFlNakZ1R2VUQ0w2S3BGNEx1NFdkTDRLaUFtWjI0RTZ2ZFJmUG5GNy9L?=
 =?utf-8?B?OUF3SmVLd0Nmd2FBU2tORnFpWGZaTEsvUmNUcmVKL09VSHRuT3JKSHBJUTZn?=
 =?utf-8?B?L1FrZ3FrMkhJV25jcEV4NlhXeEladkZxVHY4THJ4ZXM1NVczcVZBcEl0NGZ6?=
 =?utf-8?B?ZldFQUVyc3psOTh6ZEZpaE9Ka01QZStpTllBYVc0bkNlRXVnYnpaTGlNQ2hS?=
 =?utf-8?B?UG52N0FIWGZhWitHblcvNWVMeWlkeE1XQm82eGQyTHkzRnJleXZKMERieFY4?=
 =?utf-8?B?MStzeWNJOTBNRkQ3dEdkSE94SGRvWm1oc2oxeTNUQVkwdWJad0xRR01vam5l?=
 =?utf-8?B?RVJ6UXRJQXlEUVJ5ZmZaMHpvRTdCM2kwRXdCTnc3SmVVeGZwZ1VOVk1CWUF2?=
 =?utf-8?B?MXJKWDJWMVd2OFI1OGFuNXJQNVdNbVJYUUFWdVhxSmlsZXRmVXl1c3g4QTNN?=
 =?utf-8?B?VTFrMWFyOTRLbGdGU3ZKa0dsNW1NQ0ZRNkxhV2hSL0UwbCtKN3IyZEwwMHJk?=
 =?utf-8?B?NjlVZDVCdDY3QzhOVFNnVU55U09rQmZ4cGxKUHRQMUNaUUNtRXJ1QVFzNUhr?=
 =?utf-8?B?L2JENStnSC9PS2puVE5BZ3NseVArTjczd1VLZXZIa1pzMEoveksxam1FaTYy?=
 =?utf-8?B?MzNiWm9WWGhvWjd3dkhGQXV1ZmliN3Vqa0J4NlZDZ3VHcWdsTmRpVHFBbUlO?=
 =?utf-8?Q?U56nVNQjKNcObXA4eHtjx4ZGMiQY6OsEcpKDWue?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d39844d-d36c-4618-b405-08d8dfdd5771
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 13:48:22.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QdJq2Bp7qpYouJZzTqRum+/xuLI48lFHyBRfstgbltIE7GPbQ7zYR5sBzbkpeBZP2GjW54APDdMRdPzYPrJt+Cl/CIGzGpgV6EYhPlKGqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3494
X-OriginatorOrg: citrix.com

On 05/03/2021 13:45, Jan Beulich wrote:
> On 05.03.2021 14:01, Jürgen Groß wrote:
>> On 05.03.21 13:40, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>> --- a/tools/xenstore/utils.h
>>> +++ b/tools/xenstore/utils.h
>>> @@ -29,10 +29,12 @@ const char *dump_state_align(FILE *fp);
>>>   
>>>   #define PRINTF_ATTRIBUTE(a1, a2) __attribute__((format (printf, a1, a2)))
>>>   
>>> -void barf(const char *fmt, ...) __attribute__((noreturn));
>>> -void barf_perror(const char *fmt, ...) __attribute__((noreturn));
>>> +#define __noreturn __attribute__((noreturn))
>>>   
>>> -extern void (*xprintf)(const char *fmt, ...);
>>> +void barf(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
>>> +void barf_perror(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
>>> +
>>> +extern void (*xprintf)(const char *fmt, ...) PRINTF_ATTRIBUTE(1, 2);
>> ... the extern here would be dropped.
> But this isn't a function declaration, but that of a data object.
> With the extern dropped, a common symbol will appear in every CU.

Correct, and some of the containers in Gitlab CI really ought to notice
because GCC 9(? IIRC) defaulted to -fno-common.

~Andrew

