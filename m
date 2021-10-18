Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C325E4312AE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 11:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211875.369559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcOXO-000313-O5; Mon, 18 Oct 2021 09:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211875.369559; Mon, 18 Oct 2021 09:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcOXO-0002zG-L2; Mon, 18 Oct 2021 09:02:30 +0000
Received: by outflank-mailman (input) for mailman id 211875;
 Mon, 18 Oct 2021 09:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcOXN-0002zA-08
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 09:02:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1da9047a-2ff2-11ec-82d0-12813bfff9fa;
 Mon, 18 Oct 2021 09:02:27 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-xS3c89VvN4CKy2YhQOT7eA-1;
 Mon, 18 Oct 2021 11:02:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 09:02:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 09:02:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.11 via Frontend Transport; Mon, 18 Oct 2021 09:02:22 +0000
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
X-Inumbo-ID: 1da9047a-2ff2-11ec-82d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634547746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OGfZqQzLIgGlCIYuRToZYjeRdyBXa7Bk1f5CBu2G0o0=;
	b=b77X49Vw2Vpj5SN8yYfkA4poG6KkfGmoPKkzbwVYAp1wmJKUTmSbARBZu8BcG18DgwxurC
	H2V/zlog/Sf7Gv992flqn2XPPdqw+RQrFbRJyWAmkgF0C+DvgoekQ7iLopFnTaOHf629iZ
	+DfAzl7QicGy93n4zL9i16k5RXsQJNQ=
X-MC-Unique: xS3c89VvN4CKy2YhQOT7eA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcvAF6HOFDuMUShQDRYclZ/Cx/lh4kH50qU31zBd1KToYH0IbpIrTi1wWX5A83IuPYC/QUQ6wNhrDyBe8MsQ8Gsx+n0VbYw1RSYL7hvUCW4z3TOnriRFPPzs0RbGLaPalS43/AIF4qsodL7lVHqUs0iIavLK542dP0xEnt0HuibZmjX8C8nLnOzMU6tkgM6MRR8Vh2g3ZP3MvROzb/7Ub4Kjkaecfp6QqjoRE//WqywGs9DYFqXJMfAwgSZkVXiiCnWTaudsLrl20sq7kOKWFgaluivhtJVAzeonTTVYQQkol1b86VafieBfKGMxUMVvmMrNg4mz56cajxL/HpEnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGfZqQzLIgGlCIYuRToZYjeRdyBXa7Bk1f5CBu2G0o0=;
 b=CEC2cHe71yDqpEF0F1ChNKLTVma4kvHNj/mSaGtedpMwMVFSMlh4Tpwa39Zsb2ZBGDI8INefCVmtBuqP1yrZhubTvsAvREVMv0I59C/o6D6YmCrLEXQSKDJtJY/rLHeiqkzOGO6Dc6wLwmnIX3rU8rVuI+24BUkeB0q7WHQxM36Rg6+4Zks/yvGRrY6ZUlkZWkZh+f6tbEf/BpN2HSVOBt3q91IXmaNwQS0ghmKklLEGINwq4w4W2TdZH7FX2d5Wg/x3r26UIWmgv+KFJHZ1NBGMBQyUIHnuhgsND8P0I4TSvyc8ONXTD1UVdPOu+PKmzA6pEYm8ynidJTtDGO3ojg==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com>
Date: Mon, 18 Oct 2021 11:02:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWmzSkLdH5wtQ77V@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7af3cfd-c152-461f-6209-08d99215ff8a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3295987C70494DBFF14F5B83B3BC9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0HDPvve6kd5XwfGrEKTORUFfwt9tfjM375qYrOBNXEh+VTIxJdLcQ/tWsdhMiJhf0tmzsZUIZ7HV1wbFZtgOso224+44gjfwMPKH4ULCvGcl9M55sAHzI9DBtMiuGaydSiu0vuZiuMiHfxHwdQebM8CDJHbo5kHlXUSYYUNatLo7ESdK1CZI+C0QXIfK1EXMS9EQmfKqCFgTSMY/lmhl/Vdh7f+w94SYEgFZvzBcp5JEFsYRANOhaCNoxNihEHUOLwOAd75M+6rXvvLI1R+ONuAdtCc5Y3x+iKTc02Sn0DPlXhj26i56dGg7pTkn5tqJ5F4scc0pkE6+yOlg+qZV58vmvcFHuYpVx6tmU2+qbOIG16ak8c82OYiYRq+pHfzP4F+g/MuyCh9wv2JheHRVBGW5vJ4IBGa0nDc8fHffmEERrrErAyNpVVumWqpF7MrFw9bbZzM5CSKht45GdmHEI9I+ADBBJQycEn1fufiuY39XgnOrRfyZpaczGuDPBMEr8rSfaIOGHlDQcpEP06715dYGzqg/LNEa4kuQrppBMJt/QF6uK6EZQJbFOlT+D4VQ1+J0SgDyzK/+iUJ0ckTKs8aX8yl8yHn6h1OTNNPKbeMJ8ggVZc7Ha0s+upG39mmbS4nkQNPatE0sAHjxA7YCNFvxk/K14pZKIyk3BfBuTg7VAGeW+cmKsAJSm5rHf/WlmfCxOYFo9Ls4iAhbSXZMrDnDpZsxCCoigKzJzd0rfZI+gFZtsDN10isgDZdjRrdS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(956004)(2906002)(5660300002)(6916009)(66556008)(66946007)(16576012)(53546011)(83380400001)(54906003)(8676002)(186003)(38100700002)(86362001)(8936002)(36756003)(2616005)(31686004)(7416002)(26005)(316002)(508600001)(6486002)(4326008)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1drL0lLa3h5ODBDeGRjejVST1Q4NkNmQWlpVFQxZnpMNURiTWxYQVg1QllL?=
 =?utf-8?B?RjdFOW96cXZCak5MOWs2b3htNllnZ3pMOGRwYUM2Kzk2QmJ1NzNpR1UwZmto?=
 =?utf-8?B?T2RnRWlOb3RLMk9PUSszcWtZK0dIbGpjY3MxRFl2UDRkbUdTTU9wQUl2WDRG?=
 =?utf-8?B?OUtvcXR0alM1RGxHdDhVY21McVJyZk1nRVJldnRRaWxueG8xeklHNWsyVTBi?=
 =?utf-8?B?WmhvTUY3MG8xUHpQc1plUTJ1dzI4NCtJSE5GNzhabHNGVS9vR3hVOTdmRVRM?=
 =?utf-8?B?OTl2MWh2YUsxeUo3azVoWWUzV3FaR2tENGYxNjBrNGRtL1FZVFlJQU9lZ3hm?=
 =?utf-8?B?OXZWSnRLdktHaHNoM1Nuc00wclZZcW9YNUowZ0ZvSEZ6VHZmNFFWOFJ2OUlo?=
 =?utf-8?B?OE00MjNITk5wbEVYQWoyeklXcFhvK1Z1VW8vOTNKYnpiNXVXQ1BOSnVzRk42?=
 =?utf-8?B?dk8yQW0vZjdXMGNFeTJaZnJ3RGdCVGUxK1V1ZnlPNXY0RU56KzM5MmZFQXp1?=
 =?utf-8?B?bnkyUzBqaWRvcTB6aVl6c1VYRzFadUpQK0tYaE9jQnBxVkxqNURyRFh6QXg0?=
 =?utf-8?B?NU1vZE5aOFExcEZCbmRvbDM1dHFvSzY1N0gxeFB5cS9kVGFOUDN6b0VvYlha?=
 =?utf-8?B?c1l3UHh2dVhLelFXa2xzQ2xvTzErTFZraUF2N2J6S2F2bDJyeTZGcFU4a3NB?=
 =?utf-8?B?bGdyVXQrWVg3RWhSR1VoQjFxdE9MU29uTG03SzZPYUFZazBXWU1XUGJyejAv?=
 =?utf-8?B?d2ozZWhPdXdpajlMVzFEQVhxZ2RWejVCM2k3LzdMVm9iUVFDUEpndWpqMEE5?=
 =?utf-8?B?QXZoVjg3MzNyRmRJYnYzWmFJbjhRb0U5bTlSYVdIV2Iyd0ppTlR2QjBhSG1S?=
 =?utf-8?B?T0VwbWNMc1lGbDNVcC9pVjRJTjFkZnJoVm9FcElMUE9mRlpNaDNRSTdiNHZC?=
 =?utf-8?B?N29tcld3ajk3cTVaYkFUNFhvVk9rNHR0M0dQRWFvVmdBMVFmQWNkTnYzTzlH?=
 =?utf-8?B?U2xVbjgvcTZuSFlnMVdqdGlGWVJtM2VpRHhrRnd0c2EvL2hWUnJheFpVelZp?=
 =?utf-8?B?L09wTWJJd1VZdWxtU1FOeUd0cE1sb3d5NG40MUdMeTltSVZxYXp1N2dLRVVs?=
 =?utf-8?B?ZFRXK3VYeUh4YTNIOVh0YXdHdFdvMVhmL2cxcTRzRTFwbmxBVW51aGV3RDUr?=
 =?utf-8?B?dXVWV1pySzU1VzBBeTlqSnhQOFVUR1MxbzU1dEtQa3VmQjFQdUJaazRmNjRX?=
 =?utf-8?B?UVpVcW1ReXVjSFplZ1hNaFBrMExTQmRkNkErZExIR1V1dTVxc1VZQ1YwdTY3?=
 =?utf-8?B?TnNlbFFUWGxiUHkwdEEzQmZNZjlZMElxNVIwSk82eGFJVWxpWDUxbm80dk9T?=
 =?utf-8?B?ekVtQTJrT0lrMWpvZld5WGFmQ0hOeUx2LzJidW1MV0d6VEVFN0d0NGJCUDNj?=
 =?utf-8?B?LzRYZFpUdDB6SENzUjFPZ2lHVHRSZXlNQ3oycHo2ZkVwbjJmaDN1cGQzeEZG?=
 =?utf-8?B?OTVGM1REdkhyeXlZdnVrMU1CSlREdkdCWjFSSmFteGltUUlTWnhxbDlScE1T?=
 =?utf-8?B?QjdRQlZXdjlManA5ejhkcHlOb1gzOTRiRlVzWkJjRHFtZHd6eE5wbWhxNDhW?=
 =?utf-8?B?aTlFcERTWWdKWmw3Si9WQnRJWFFvUXNMajdXczZQcFZkbFNKYm9PVlFWRDBN?=
 =?utf-8?B?WnY2cEdKdEFENWprNGdlZnROOHF4VUo2dENLZjBObzArbTRBVUozeEhxSlFG?=
 =?utf-8?Q?UKdF0UHi+qOfc9BfRgawI0W8Qa8/g4TmS4P3e5N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7af3cfd-c152-461f-6209-08d99215ff8a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 09:02:23.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4FNVOBGZuDpNLtzq52IsjpVgy8oTKFXccbKc/w7PewnZVv1xhxUIX5EJcLoq5GwBSPRAQHgZNRHO6yLUJIduA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 15.10.2021 18:58, Anthony PERARD wrote:
> On Thu, Oct 14, 2021 at 12:14:29PM +0200, Jan Beulich wrote:
>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>> --- a/xen/Rules.mk
>>> +++ b/xen/Rules.mk
>>> @@ -38,7 +38,7 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>>>                           $(foreach r,rel rel.ro,data.$(r).local)
>>>  
>>>  # The filename build.mk has precedence over Makefile
>>> -mk-dir := $(src)
>>> +mk-dir := $(srctree)/$(src)
>>>  include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(mk-dir)/Makefile)
>>
>> Perhaps already when it was changed to $(src) the name has become
>> slightly misleading, at least imo: I would rather expect a variable
>> with this name to refer to the build dir/tree. Maybe "srcdir" or
>> even shorted "sd" right from the start? (Reaching here I can finally
>> see why having a shorthand is helpful.)
> 
> I have to think about that. I've made some further progress in order to
> be able to build the Xen pvhshim without a link farm and notice that
> nearly every source file needs to use "$(srctree)/$(src)"

Oh, now I'm curious as to the why here. I thought use of $(srctree)
ought to be the exception.

> and I'm not
> sure "$(src)" could be use alone. So having a single variable which have
> both would be useful.
> 
> "srcdir" might be to close to "srctree" and one might mistake it for the
> other, so "sd" might be better.

While I did suggest "sd" as an option, already when writing this I
wasn't convinced this would be descriptive enough. Personally I think
"dir" and "tree" are sufficiently different names. I would suggest
"srcroot" for what is now "srctree", but that would have the
disadvantage of getting us out of sync with Linux.

>>> --- a/xen/xsm/flask/ss/Makefile
>>> +++ b/xen/xsm/flask/ss/Makefile
>>> @@ -9,3 +9,6 @@ obj-y += conditional.o
>>>  obj-y += mls.o
>>>  
>>>  CFLAGS-y += -I$(srctree)/xsm/flask/include
>>> +ifdef building_out_of_srctree
>>> +    CFLAGS-y += -I$(objtree)/xsm/flask/include
>>
>> There's no header in $(srctree)/xsm/flask/include in this case, so if you
>> use "ifdef" here, shouldn't that other part move into an "else"?
> 
> Actually, there are headers in the source, like "security.h", and `git
> ls-files xen/xsm/flask/include` shows plenty other headers.

Hmm, I'm not sure now how I came to make that comment. I must have
mentally discarded the trailing "/include", looking at
xen/xsm/flask/Makefile generating a couple of headers, and then
blindly assumed these headers would land in xen/xsm/flask/. I'm
sorry for the noise.

Jan


