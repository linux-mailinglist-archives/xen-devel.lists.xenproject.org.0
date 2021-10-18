Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49A431645
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211981.369695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQ0n-0001fn-Hl; Mon, 18 Oct 2021 10:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211981.369695; Mon, 18 Oct 2021 10:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQ0n-0001dM-Dm; Mon, 18 Oct 2021 10:36:57 +0000
Received: by outflank-mailman (input) for mailman id 211981;
 Mon, 18 Oct 2021 10:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcQ0l-0001dG-NI
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:36:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d4014ac-fc49-41c4-932b-94f40dbcea2b;
 Mon, 18 Oct 2021 10:36:54 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-Ld5LBfB5NSqBeSmf-snoRA-1;
 Mon, 18 Oct 2021 12:36:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Mon, 18 Oct
 2021 10:36:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 10:36:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0402CA0021.eurprd04.prod.outlook.com (2603:10a6:203:90::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Mon, 18 Oct 2021 10:36:46 +0000
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
X-Inumbo-ID: 8d4014ac-fc49-41c4-932b-94f40dbcea2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634553413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54lMYIRfOMQZrvi614eNrvR+1q6NDOVTcxW4tIPAaYI=;
	b=dS0csK8mTLNsjTpLLna2V2b5R8/vAQdtuzhFma+b7oPJouEijHsrhtfCEzTK7uHHq2Rv0I
	xd0e0WchkoXqdBDKF+M73joHjGV2x3hGhRZJpT8Rx05yFGPE+nXo7kiA6WjBlBzWsLe+Cu
	R4UI7lcQmO3zu+MiHMjj1vRhzdSi0vw=
X-MC-Unique: Ld5LBfB5NSqBeSmf-snoRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jh2Vt5w4RqAEFXftAiT+2IZa7Chvh8wg/ADsbhj78BaqHEnEWWN1IPbq6ITozdJb49TCjE1p5QIO6rnfrsxMcvW4IxnLtE8aHDI8c1ScXY3sol8/764in2x2Yfos4ZJY+CIdxfrVqnCryidxcBmFOkHmKRiwxnigINrC805OPJY9LEvlKA6FCb4NI/LDu1zLL5etOMG0yZpAWf4U9k6Go7J8ptrjiTQ+CKlqsck17X30Z7/PPJxKr8+P9hsYWegvbfeAYHk3U8y46HbTY/YlFGn6odNSFw/40xCxqZCtWhIQM0QU/NGb4eBxguW+gFU+I1tUrswyEQuTY9BIiW5zUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54lMYIRfOMQZrvi614eNrvR+1q6NDOVTcxW4tIPAaYI=;
 b=hoFopHIWUgt7AOS5yC62C0RqmZGdOT3+ssdc0T734ZS8jAjM2MUpUa4203V0CMKh/gWlEanxu4VnmlJArKYA7/1TXkcrdbJzRJ2lzo8KWYVQ/AS0tAxgAV0Ztuylf9mkKWamJ/R9W39qmY1pw9uauWqNkdK25A1BQwbd99WLaP63XnxlJ7GiQIdJ4kgioLEvUzGjTbdLTdfBhZGIaG+BpIN0CRkW4nCcc0X3AVgYQNX1VQK0ry7hSMhLAl0F4bXniJsJdJaSm08sbHxunqGL6ZfCDeDFwM2DGMHUKf4K4U0xTBriVz3gZ6sVK3weklyZySMbc+mgiVJaRPuo68j5Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen
 build
To: Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
 <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com> <YWmzSkLdH5wtQ77V@perard>
 <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com> <YW1Dhn+oEwvKgj04@perard>
 <70b8f320-bcd8-b864-f9de-a7ea35d53928@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a4df707-5b12-a471-e957-1a1c43340bff@suse.com>
Date: Mon, 18 Oct 2021 12:36:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <70b8f320-bcd8-b864-f9de-a7ea35d53928@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0021.eurprd04.prod.outlook.com
 (2603:10a6:203:90::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89173da7-799e-4e63-374d-08d992233000
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB56009BFA319FD00789B08D66B3BC9@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rqePQiNSfqT6TQb4i/mknXgJhTDCEzmOheOYv0yW2aXUaZAo9LzXtFamHkLCnqDd5zqo2gy330OoxOmZprZvQLxJC1gd2kCosiZsT1JiN22p2oHH4drcFQCPJtSzW6B0Bdg4Gtq5Nn6bWXDQ5jX7Ey9yPzWgDPOM3zbGQz5g+h/dRHmpJGiDGNCNvPo+FUEreD+UQr2Mb85rrncA8fWBCu3VOLzmNtOWxU3Auby0a331JvibuBdCIw+jAnvk+l5Z5JrMk5Y4Bl044w1WhxQzBFdwlIGhhbCek1IjwhLaEG018rAwBo9HtASDAgeoRYkEsYofF+fLuH50YHY4JFZ0gUcRFKigKnaRX/P0ju1ZJB0V3sj22lnSbzL/01QtLULCluFwIUn29GpwRQd80/htPQT7Q7sw5URa8zgllTZHdBlI15159f9z/srApC2WwmlC5/wBKQuSSjgmkvN1KWqkBMEZVc24Gx9WrL61IXojMTZcHtH7eu0K71YafK4kFcY8sBegtvCw3j4QXcRBN8LxRgRqarzdGo9UonkAQUJl7ZyeV/k2MsFJBT1I0xPXyVrf42BPQ50mhCahYAxYaJvmluBlJv9uGdT6fEH7V67xKRjjVqUBdUrKVqOdoxgjHj9VkDTccMEVOFuEQSbmjBDcVAZ3F1BrOV1O2ENiWyXeGWCAlSVpZ4kGp3rpBk7WloIaIhk+jRbeakSGdsBbuQ9VubL8JKRlEK5Qouzw/wJCDUR2q2TE2kKxOjaQwf78aJ9l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(31686004)(508600001)(6486002)(53546011)(38100700002)(4326008)(26005)(5660300002)(36756003)(2616005)(7416002)(66556008)(8676002)(66946007)(83380400001)(316002)(186003)(110136005)(66476007)(956004)(16576012)(31696002)(54906003)(2906002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEVYcEdOcGpqK2JwclI5WFZZYzRSYmR4YTJvVXhPZXdsL2VqbDdndG5NeFpT?=
 =?utf-8?B?QVNEZ1BzQ3pyNVkwTTl3WHNSNXN6L3ZEUFJyWVVGTXR3TDlQc2JWS3FvZWQ5?=
 =?utf-8?B?QmlxSEhCQ2Q3M3p5ZG9nMXJWOVdTZ2s2bHBNMTZTMm9tZGhkQnFkaFIzNmlR?=
 =?utf-8?B?em9YOG15aDJDb0U1MGQxUjdIalRkbmNsZzUxdHVVNHM2TzAvU25Qc3RnVi9x?=
 =?utf-8?B?TkxIOFJDVUtRMUtLL1N0cVhQVTZCVWVVVFlzUnRJb0pudTA2aFFRTGFuM0ps?=
 =?utf-8?B?bzROZVVyUVpyRG9haEV6aVZJZlkwbGYzRk1BT1lSUzYxbGxqY1NUbmJoU1V6?=
 =?utf-8?B?K1BDK29hYmE1Y1piQUVwZWhnS2lMYktXYmxnQnJhSExtbU13MG1JMzVEZlFE?=
 =?utf-8?B?bmYrOUhyalVVODRQKzJwNGJrSDFiNjVsTC9UbXpGZDZ4VVZiSGYyQVBDbEUz?=
 =?utf-8?B?UUpGK0c3Q3VlUkJQK0c3L1lIWFBRelIySHBIZENrUDRIV3FUWlE0R1JwcHhW?=
 =?utf-8?B?Ym9tTmN4UU1ySlBnT3pVbEpLby9UUGJlSUV4NUZMcU5KN2hROXZlQldGQTd3?=
 =?utf-8?B?SEVpb0lqVXlkSmJaQUhFZXpKcDBBTFVGT2ZiVXc3ZE9IZnkzbHY1YStEc2VL?=
 =?utf-8?B?T29FbHQ4RGhkU1VXbWRicjRwM0g0Tld6NzBUNEhEVGxQNGYrd2xvdlpCcFZY?=
 =?utf-8?B?N04zdFZiOW02RXFyWkhIUm5ZVENqS3FMVHBkd3h5R0tLZFh0YmtiYnRJaHNI?=
 =?utf-8?B?TUlPRWJzVkFheWhrZ2ltQ29NRCsweDl5b0k1dnBSenJQMTVNcHh1TUY3QmhF?=
 =?utf-8?B?UDVXUGRZVFQxYUMyQkFPcjBTVzNtZU03eEZYektjL0QyTHBPLy8yUGJLRldY?=
 =?utf-8?B?NFo1Rmo2V0crWThJUUVURWNHUlJkOFB4d2JJaCtsTDR0R2xMdW55T2tOamZn?=
 =?utf-8?B?WHl6U1NpQ3JDc1JxYVgwaWdlUmxKTGdtS0FRYTBia1k5cHQxWnNSeWJick5P?=
 =?utf-8?B?VFFiNzlHSDVLK3hUODcwZ0Z5cVhCSk45OHlXNDNGS0VTd3VwKy9sOG9jdlpk?=
 =?utf-8?B?dCttRVZscm5sNjJJdTdkMkpEOEs5STNqZzhNZVN1NjFWT0FiSjFIY3g3bmxB?=
 =?utf-8?B?Undqb1Y4QWc4Y3N5WTA0U2xjeVJWY252azhyZkxQQUgzTXZMV24xaDNQU2NQ?=
 =?utf-8?B?VWlISFJvcklZeXAzaVRhWEJsNGlOWkN2dmZJQ0N5dHBMT0g0RnhwZEtaYXRQ?=
 =?utf-8?B?NmVSdlZjNmI5UjdEVDh4bVBBOUo3SUE1NEhYR2V5LzM2c09KVlBHQUpiM1dQ?=
 =?utf-8?B?V2V4WDdUb0kxdWNXZ09tenZyZGJLS1dhVE1mMitnZ0xJTkgzYXZlSk1RazN2?=
 =?utf-8?B?ZlRQY0QvNEJxTkJGNjkyR0RKSjFrTEIydXVTVjF0QzFsRXlUeGxrQnlrY2JX?=
 =?utf-8?B?aWJQeGxISWpzMmFHbE05WkY2RGxXY0NnVnpQcFZOMlNqZ0R3MlBaUHppMEdW?=
 =?utf-8?B?K0lxN0NLZ3RtZWpPbnpPVjQ3am1YUytYWXRncWFoUGFPWGw1bFZTTDBsKzZI?=
 =?utf-8?B?MlJhanV6dVUvSjExK0tScGlWd0ZKNEQ0d1YzZy9DdUR3c3hQamVydzdhL0o1?=
 =?utf-8?B?MTYzK0xudE90RzBlLzNBWk1sak95WlZIdzhmSnRKbjdtU0Zici9lWFlpSVdE?=
 =?utf-8?B?SVEvMmM0QU9QY0hwcGZjUW52VFNoUEVYUzhMREtKeFlRaFZHQjF4bmJYMlB3?=
 =?utf-8?Q?BHyC+WSOSqKenaosojJNZazAU5Ff9AdAXX317uH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89173da7-799e-4e63-374d-08d992233000
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 10:36:47.7776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +f4wq4GvlBfwfRw0rmIjJBXBgtaByBuBm1JW3AfN1HDmC8SuVxaR0+N9apNjOt3mkdx8tke3fSEA+n/p0mZ6nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

On 18.10.2021 12:28, Juergen Gross wrote:
> On 18.10.21 11:51, Anthony PERARD wrote:
>> On Mon, Oct 18, 2021 at 11:02:20AM +0200, Jan Beulich wrote:
>>> On 15.10.2021 18:58, Anthony PERARD wrote:
>>>> On Thu, Oct 14, 2021 at 12:14:29PM +0200, Jan Beulich wrote:
>>>>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>>>>> --- a/xen/Rules.mk
>>>>>> +++ b/xen/Rules.mk
>>>>>> @@ -38,7 +38,7 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>>>>>>                            $(foreach r,rel rel.ro,data.$(r).local)
>>>>>>   
>>>>>>   # The filename build.mk has precedence over Makefile
>>>>>> -mk-dir := $(src)
>>>>>> +mk-dir := $(srctree)/$(src)
>>>>>>   include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(mk-dir)/Makefile)
>>>>>
>>>>> Perhaps already when it was changed to $(src) the name has become
>>>>> slightly misleading, at least imo: I would rather expect a variable
>>>>> with this name to refer to the build dir/tree. Maybe "srcdir" or
>>>>> even shorted "sd" right from the start? (Reaching here I can finally
>>>>> see why having a shorthand is helpful.)
>>>>
>>>> I have to think about that. I've made some further progress in order to
>>>> be able to build the Xen pvhshim without a link farm and notice that
>>>> nearly every source file needs to use "$(srctree)/$(src)"
>>>
>>> Oh, now I'm curious as to the why here. I thought use of $(srctree)
>>> ought to be the exception.
>>
>> In Linux, the use of $(srctree) is indeed the exception. This is because
>> we have VPATH=$(srctree), so when `make` look for a prerequisite or a
>> target it will look first in the current directory and then in
>> $(srctree). That works fine as long as the source tree only have sources
>> and no built files.
>>
>> But if we want to be able to build the pv-shim without the linkfarm and
>> thus using out-of-tree build, we are going to need the ability to build
>> from a non-clean source tree. I don't think another way is possible.
> 
> Is there any reason (apart from historical ones) to build the hypervisor
> in $(srctree)?
> 
> I could see several advantages to build it in another directory as soon
> as the build system has this capability:
> 
> - possibility to have a simple build target for building multiple archs
>    (assuming the cross-tools are available), leading to probably less
>    problems with breaking the build of "the other" architecture we are
>    normally not working with (and in future with e.g. Risc-V being added
>    this will be even more important)
> 
> - possibility to have a debug and a non-debug build in parallel (in fact
>    at least at SUSE we are working around that by building those with an
>    intermediate "make clean" for being able to package both variants)
> 
> - make clean for the hypervisor part would be just a "rm -r"

I fully agree, yet ...

> Yes, this would require us (the developers) to maybe change some habits,
> but I think this would be better than working around the issues by
> adding $(srctree) all over the build system.

... developers' habits would only be my second concern here (and if that
had been the only one, then I would not see this as a reason speaking
against the change, but as said I've never been building from the root,
and I've also been building sort of out-of-tree all the time). Yet while
writing this reply I came to realize that my primary concern was wrong:
People would not need to adjust their spec files (or alike), at least
not as long as they consume only files living under dist/.

So, Anthony - thoughts about making the default in-tree Xen build
actually build into, say, build/xen/?

Jan


