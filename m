Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7AC431410
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211914.369604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPWY-0002TT-BH; Mon, 18 Oct 2021 10:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211914.369604; Mon, 18 Oct 2021 10:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPWY-0002RF-6t; Mon, 18 Oct 2021 10:05:42 +0000
Received: by outflank-mailman (input) for mailman id 211914;
 Mon, 18 Oct 2021 10:05:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcPWW-0002R9-Ar
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:05:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70ab5db1-b36b-4c71-a0f8-90594bb98fa0;
 Mon, 18 Oct 2021 10:05:39 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-yUx8K1_rN9OVpeb_DTNfSg-1; Mon, 18 Oct 2021 12:05:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 10:05:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 10:05:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0008.eurprd06.prod.outlook.com (2603:10a6:20b:462::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 10:05:32 +0000
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
X-Inumbo-ID: 70ab5db1-b36b-4c71-a0f8-90594bb98fa0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634551538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aSXbxzvs8zpBem+PLCV7fg/9RgUqsDun3ZepPvgOWY4=;
	b=HcnH71aBGMnTooCcinMjsC7cfk3eihMF83PsfTl6FCV1Dx3qMsHf8kKFpuzMoIKUAivlMK
	g3EAcdiVfiaeKQS9qVEO+RtRcjpAq5BV6gpSCVCRp5KcnjJd9NKI2aQJR5LChhkqRz2Ptn
	bucdo9xe1+FloZa0HgfpA/MJaqfnB+g=
X-MC-Unique: yUx8K1_rN9OVpeb_DTNfSg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc8dYR9mcgUh1pBVIzfk+mQUBSptFbQkc9DZDIWq57j4fgJKn5BCJC4VIJcNibafoSFjNm3ghaTvBcRzYuP/1knTy8MkenyGFFBypZtYJQSHujIhVv34rCjN0SY7Hm7NNl+jcv9IUwDAL6koYShl5KcB0ys1iubFq9bgvGLqalA459mZUeqjxZbQS2Cb7p8MQRByZBkQYzgY/PQz+pFtGzztu0EqJ/Ab9L6KX5gFiBuQqSJwM/NEW30cOwKENxxew0stWOYW9m4vHmqvKj8lipaMQRYBoO9P3nvN8fAbEkBlNsQq/+8/BnawesIxzN+uLkmwlpnZ9FjD9mPjMs3A8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSXbxzvs8zpBem+PLCV7fg/9RgUqsDun3ZepPvgOWY4=;
 b=akCDQDLW8rMIQ/pN11IoFsV2FFTmJpK3AUxTO7N4Xp6l0uBXX0ydnCIDfHimL9WBbdLpjMLPRuOF49eI+Z/hbfiiRKmmSM3r4xD1UEbod2Fh2cssRYJXXJhFqf0I9z1/owKnClX1S49KF6dMIKV4uTciWNIASQUFSc/QpqlXE1m2pOKmugMvX2NJB4pEbicyYZpIkJ776Ls1G9S3RQB1bRcRfxHtwcljUTslyWzRds3RaCVRCMSMCm8t1iAV/BoaTy30JjUs4nC66f3YPkoi+p9tF1himXBRLraSXL2LujsQSe+FGugAcFA/PqrHyIGuNM0WYr/vuoVWHlGlh/C4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen
 build
To: Anthony PERARD <anthony.perard@citrix.com>
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1220e343-3082-9f1d-a788-c4369f2944f6@suse.com>
Date: Mon, 18 Oct 2021 12:05:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW1Dhn+oEwvKgj04@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0008.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b330c19e-4da9-46a3-42f7-08d9921ed313
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352346AE642247F04F1C328B3BC9@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1kiP1MOEZipR4A+fhtV06T1lEQB8ZS+ZOHCiutFNu4z82QeX6TBP+/FzIwLpP9+NHzxvZvhAHM3Qh48KXOT39+quiafKwzDS6SMMlYNrjt9FQhP1TeGIC60RbrbNueO0XH6YRaqOFysGPO1tEpJtpOYFeiQP3yUcsGc/Bf8yj8t2svMJWPpVYxc12dhoa2HcxM7kKMzF/l85zJet39xuYjwaQVxqAm2f9HkvhrojU8OLz3Tryd9pKPD3R98ziotOMeO0cn0/uS9+5ZCKXL5Oe4n7owk6erSSGHldZ4hXEawRzOq7NfTECuxUqAK0Wvkgvkr5sq2Af0E/TiKEs/5Ng+dqN7KSnilEAyV9mcmuKn+0DxvpJDL4UP4SIdktZK0IpnN21mTrdFBokt45EwTCxkKJ3r35QbFxIOyjLCdXlzussnLKfbJtz80pNqDc5oQmGyZO8hZnCJeJ/vQ2NPgrKVBN8p+181YCE8R1AA1IG4c+bE59oCVgVD9qP0TLSk+EDJ+wRCEGuTPwxrp5ATHZE3kaeTBgBJieHkA0MlwGfKbvh6HcUtEa+/EJqOw0zi+kbeoxcBMANn9FkG0WCnEV4SWlLfIha8hW3wjdW3EfpH3S2M9n55LMH5LggXaSfmL4BHJhROJuRtJvAWgEIrriMuVPTjZoTCXKYKhN6RqZ+7yQ7sXHhFXGhc6MzdMIvD4EYTmrfGjWoNTMWoHkTEBThAcsiIu51xILLLnuvPE51kjJBEA5nDRn/e7ZtXy7K2oL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(38100700002)(2906002)(6486002)(66476007)(83380400001)(5660300002)(36756003)(66556008)(66946007)(2616005)(186003)(8936002)(956004)(6916009)(7416002)(16576012)(54906003)(316002)(4326008)(53546011)(31696002)(86362001)(8676002)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck9zTVh5M2pwWkxZLzJlWmxOUjdwbUova1hSRG55QkErc2hXOCtYZ0NDUmZs?=
 =?utf-8?B?ZVZKdHM4d3JWcFltRndyODRHQmREQXNKc3lDNy9EOEFDSHlOeXl1OGRWYWpT?=
 =?utf-8?B?UG5NTXRTL2FXbFpYNmpScUJlTk15aDJzK0Jpd3ZKOFAzM2NNYTlRVVhKZmhP?=
 =?utf-8?B?OWlYdElvL1JHWStveTVYQVBDbTBSUE9obldjNnczNlowKzFEWEJmRzcxbExz?=
 =?utf-8?B?VHJnb2pKMXBtTE5PL2IvVURYUVlpeDNZLzF6bnd1NVk4Q21JRkdweVpLQ2pD?=
 =?utf-8?B?VklEbmFUZzV6dDUwaWwvcWtjbHB1OWpBUUFmckJuamN4SnFaT0gzVVJnMWtE?=
 =?utf-8?B?Z3lURjJ4ZjZqc0N6Tktvc3hmNjQ3bnhPZlYzTG5KNFJQMkRBVVJ6WGdLaDVF?=
 =?utf-8?B?SVd2WkdHdEt5b2RRS3dXRkdId2hONnBweTlTNVVtUzh1Z0pGQjd3QVZmWVlV?=
 =?utf-8?B?WENNcm5tbVQyT2ZBdW5qLzZNd1Rzbktxd25mTlZINU81c2R2TERQZlJCekdC?=
 =?utf-8?B?ZlM2WkNhU0FQaVJhY2NpRkVoMTI3b0hVQ2VEUXlwRXlzMFE1UmppM3QxNFha?=
 =?utf-8?B?c0grcGs0Q1lXYUxka0JQaURDSnBDVTI1YXhCenplcXYyTm96eGxhaCtLT2gy?=
 =?utf-8?B?OEFhU211eXdHUzVWQ0h4ajJOWXI0N0Y4TnZmVnZsYnlNS3pZdW0rcjB4K2xt?=
 =?utf-8?B?UjhIYUJSYUFqVVhVSzRsZEg2THhHMDd6dCs0K01ielBsZCtlL2s3SytEVFQy?=
 =?utf-8?B?ZUovdXM3Q0tYcVNXUGlnRkpUcytKQnZWSmRtTnN3WUtucEU4SFhYUUF3NDlj?=
 =?utf-8?B?c2h1L2lBaFFjQ3phZEhnczB5UVNvTjhZYndhNnZSNGNDMU1vWVp5akZTL3RC?=
 =?utf-8?B?MmpQSDNJQmRrRVUwbnFlc3ZRUU9HY24wZUh1QThHaWFPbzdmeDRKWDR1ZEUz?=
 =?utf-8?B?Unc3RTJ2T2FrY0RZd0MzT0lzcnB2WllPMjhkOXJQblM3UTYwUUIwNUhlakNt?=
 =?utf-8?B?YVBQQkNKTzdPU202bnRTWTZuSlNjU1NjeHdMQXlXVWJHOVNvRmR4WGc2Nmt3?=
 =?utf-8?B?U3V6T2xReThkVGRIazQ0YzJVbnlETGZYNkNRSEtFNlZ0ZTY5U0dKTTExcTBY?=
 =?utf-8?B?SE5CZTFpaFNMNUl2NEpXMW1waFArMjVhMDVzYjYzTG5wSkJZZU9ua0RZVXFI?=
 =?utf-8?B?WUNRZVRxVFRxcHVzWFMzaGNkaG5YMVJpRkNndGZoYjlOMDFJUmRKcnRVR29K?=
 =?utf-8?B?RmU3bm9MRENjR2VaQ3RHRjFsbTNURlFOeE9NOFVML1IrMWxVTFJFRGo5WTE2?=
 =?utf-8?B?UXBZaDVuNGZiWG5nZ2p6WEh4ZHZUVVhjcWVBVjZPRzljeFJzaHZqcm9vNlNN?=
 =?utf-8?B?dkFWdmd0RDhMbFRXUXlxVzFKQ21BMmR0Tm9BSVhzNFN5S2ZrRzEyYkRLS0RR?=
 =?utf-8?B?TUZaRDNOS08vd1JzTzF3U3d3USswTXpVR0VPTytLN01UYXZEZnFnWmIyd1ph?=
 =?utf-8?B?WWdERzZiLzZrK20xQXFTZnFFZlRrRDhraHpTV3JiVkFPZjk2NWM1N0ZMZHUv?=
 =?utf-8?B?aVhkUWlzck0ycXkydzUzcmh0WityUXNTNW5RVW85bXFhcnMzdFkrNWQ0UjY1?=
 =?utf-8?B?eGVnQ2JCSXZHdmxOM2ZEZXVRVWk1QWR0K2lQcjk5Uk15d2MxeTZFMWRLbnlv?=
 =?utf-8?B?NHR2bG9lM3lxeHI0Y0FQbWJWKzNUdTJrR05tMSt0MjZPWEVoL0F3eExndzNL?=
 =?utf-8?Q?mfzp9Dj5cuqx3CvJ3zNAJLljGGpFcXOz58bmnRU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b330c19e-4da9-46a3-42f7-08d9921ed313
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 10:05:33.8814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AA5bMBD4SNPeWp3Qz7qA25YBP/hXnOiaGJOSuZuZH3cB+fOopbp8QTThDheATFqcUtL/TGaESrNrWcEnUrDtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

On 18.10.2021 11:51, Anthony PERARD wrote:
> On Mon, Oct 18, 2021 at 11:02:20AM +0200, Jan Beulich wrote:
>> On 15.10.2021 18:58, Anthony PERARD wrote:
>>> On Thu, Oct 14, 2021 at 12:14:29PM +0200, Jan Beulich wrote:
>>>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>>>> --- a/xen/Rules.mk
>>>>> +++ b/xen/Rules.mk
>>>>> @@ -38,7 +38,7 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>>>>>                           $(foreach r,rel rel.ro,data.$(r).local)
>>>>>  
>>>>>  # The filename build.mk has precedence over Makefile
>>>>> -mk-dir := $(src)
>>>>> +mk-dir := $(srctree)/$(src)
>>>>>  include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(mk-dir)/Makefile)
>>>>
>>>> Perhaps already when it was changed to $(src) the name has become
>>>> slightly misleading, at least imo: I would rather expect a variable
>>>> with this name to refer to the build dir/tree. Maybe "srcdir" or
>>>> even shorted "sd" right from the start? (Reaching here I can finally
>>>> see why having a shorthand is helpful.)
>>>
>>> I have to think about that. I've made some further progress in order to
>>> be able to build the Xen pvhshim without a link farm and notice that
>>> nearly every source file needs to use "$(srctree)/$(src)"
>>
>> Oh, now I'm curious as to the why here. I thought use of $(srctree)
>> ought to be the exception.
> 
> In Linux, the use of $(srctree) is indeed the exception. This is because
> we have VPATH=$(srctree), so when `make` look for a prerequisite or a
> target it will look first in the current directory and then in
> $(srctree). That works fine as long as the source tree only have sources
> and no built files.
> 
> But if we want to be able to build the pv-shim without the linkfarm and
> thus using out-of-tree build, we are going to need the ability to build
> from a non-clean source tree. I don't think another way is possible.
> 
> This can be done by teaching make to only look for source file in
> $(srctree), and to look for generated/built file only in $(objtree).
> That's mostly done by not using VPATH and making few other adjustments.

Oh, I see. That's ugly. Just like in Linux I was expecting that we'd
do/support only in-tree or only out-of-tree builds, but not a mix of
both within the same tree. But I can see how this would get in the
way of a build of everything from tree root (something I personally
have never made use of).

Jan


