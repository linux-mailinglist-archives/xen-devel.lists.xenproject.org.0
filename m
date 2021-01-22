Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B8300837
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 17:07:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72930.131469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yy3-0006v5-3O; Fri, 22 Jan 2021 16:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72930.131469; Fri, 22 Jan 2021 16:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yy3-0006ug-0B; Fri, 22 Jan 2021 16:07:23 +0000
Received: by outflank-mailman (input) for mailman id 72930;
 Fri, 22 Jan 2021 16:07:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVda=GZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2yy1-0006ub-SB
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:07:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13e92d81-0482-402b-9c3b-155f94af6da6;
 Fri, 22 Jan 2021 16:07:20 +0000 (UTC)
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
X-Inumbo-ID: 13e92d81-0482-402b-9c3b-155f94af6da6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611331640;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wSPopm7cjChAryf34f0F32n9IJrzuGFMjGqy2foWgxs=;
  b=bpuIzvqwZhILOCoTwB1zv+d/rENRR2zUD4kdsceoEhg5rTrCWVTpnBXT
   n22PsC6IOdBW/LCggBLHfBjsXo4HaR2qUPKhDaAj5S79IfyadnFEsL9qz
   me9/epm5gBVM4BC4Jpwq7pwegWYc7KL5FD4vIJs/IGwWdlgQk5xP5kA3n
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1Ip9kWNW+h3LGP/2TFfTzwa/fe1eVCqYHHeBQSmimZTxLlzGp/9zKklhKwYWXHNOHMlvTMk1DZ
 GTKaUJj6MQCW1RQYYM2J8+wVpZAV20nVDlgd0vkrWxpesq1SuzHMtHgE98H/OOtblhQMGR5Jnm
 pI1EGfz/HsfozQRuli+qe+6k0mpZnGCwGpJN0e/zQAXAkf5xnfOkM1RWyvN9WJEnuQk7DD5Wpp
 nMquoASOgPyDq9bXPFbYLC3YYhmZiD2EgeLm7PThs9se/SSM0DhsTT5jO+UAWEghrO9qP0VL/l
 /Po=
X-SBRS: 5.2
X-MesageID: 35641722
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,366,1602561600"; 
   d="scan'208";a="35641722"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwyYvkgOuAhAMCRWYj5crZvMy7X7fI4Tihh0ZkpV4i0QMHdCfgyBXyIDtPVX3v1QX8Fem+tpXb6zEEmeUniSEbGao30cTWEnW8DDz6L4vUJuesl70f8o19Yu5IEr11vGxPP9+DFW+T96dPiFXe5kdCCVm5UgQ4SqxwrFOjdzlkuJy0ICoqZG2mxLbECeSAU2loLaCGnG+HQ0XmcYV1fNLt8BpY8Wj+dzi5608gs/viwmAhqjQBpPvNZ8nRLkJHIlswTMoNodn51Dun0OCCG6pjWcZpkdGP3tUmCxpE5tJ+dqZ3vTaLx33/Maa98/51Ln+MT9m9GowpTa7w/1udvwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0OCkVCXegr1PXcEcsLlm/+VGa59VAHzkqyn0tsFqyU=;
 b=kaudou1/CHq8yzHpOFTvVVi81EUjxxf3P9SBJVu6WxJuOVhonxlYarYVu/o6d92Q//qx32xFE2wFJhBwx6ng/Fz95M3F9qaWOtatlnESHrAk4Prf9teBRk26+AKU1gD0122nS9CWL09uUYn/UOlgp9s9gqBqMbWe1xG3MlR0NP/kLXpBmnUOF++If59UNuYgKpTcCm9EdFoHAUkVt7CK6mZEZSHy+tVQ4sXY/SvmPe/sg1DWX7qpPQ+TY+xXFx8NhM4HwMRqwI1SIRM0xZJ5sXD08GE/6nXtHgGKIzmyviUS7Ss//+Z1o5qUT9tJq+9gAyCdb25VzzB+vfwRUFv5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0OCkVCXegr1PXcEcsLlm/+VGa59VAHzkqyn0tsFqyU=;
 b=h+7eteGm7NPQUu4JAsn5MCYNz24JeaF1UcjxS0ebSq12+SnyxarWcxBbW/52eXsLOmnuXjfNxSFgvfVIeFsLTC4sWH1HMtgo1r+TSxCG6mbWD90CF7nxzaWWwXIoGqyjrlKKM9PU1D+LW03iQ82vbVvFxqD+NeLqLFuxfZW9TkM=
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
To: Ian Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<ian.jackson@eu.citrix.com>
References: <20210122155603.23402-1-iwj@xenproject.org>
 <20210122155603.23402-7-iwj@xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0361ffd5-a640-ac59-c222-4a2d5a9a4727@citrix.com>
Date: Fri, 22 Jan 2021 16:07:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122155603.23402-7-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::35) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4ceba5b-ba4e-455c-e166-08d8beefc9e6
X-MS-TrafficTypeDiagnostic: BYAPR03MB4456:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4456CD99AFFE527249FF30C0BAA09@BYAPR03MB4456.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0oVM7dOwG9J+TT26BQx9UeD542nJkVZE4C52/imwknYRBpgBctX4NJ6ZCuziWXsBR7Q1rlCIMnEwqP//qRCOoWzpyUCWwf0Kbk/QwiEcwiGpJIhderxL/EiteWEXig44CEeufEVh8qEiwsvWBFf7MV2n2YfnbkdVa333Sl8pwx2DhDAJC60WB+Xs6nPj+dwuhRWpOg0Hhqlql+uprfWWW0luhYV8ul4kqUNCB0RhCDTkWWDuXv1xncbkSZAjDLGbu/WIpY7py6hLGNRKCl341U8xEmkYeVCVGpFMowPkPadDkdN7PKGlaVHnYvZbMa+JkIZcEJ83v2+weF+6CUl4aHCMo4Ukpk/OsAFd1MQ2lwb1QcTrrM+Dylpf4lkcvFB84hcrJ/7kVwrvb2o9AvJWg5Ee1vqjjsYe+0pSWO/cPsKW7M64gdrVvUij3snkqaA7BkjufrNH/LO7XtHmaUtpgLb4DWuIPCaI+YZJ+zRsIuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(54906003)(2906002)(36756003)(31696002)(53546011)(16576012)(107886003)(956004)(2616005)(8936002)(83380400001)(316002)(16526019)(26005)(186003)(86362001)(66946007)(4326008)(6486002)(478600001)(31686004)(5660300002)(8676002)(66476007)(66556008)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VFZ5SlpxNzFCTjlFUXVNRFc2dTNELyt0b1NNTEJRaHpyR3hiYVFJVVFFbVM1?=
 =?utf-8?B?cFpqS1VuNys5L0h1dnBwZ2tSam5iRU1teDRQY3lwM1pRUExic1U2M0QvTDgx?=
 =?utf-8?B?WGFsdmo1djVKNUJPVWJTY0dCNzE3em5lbVdyNThWMmxoUlVydVRVcnlZUEo3?=
 =?utf-8?B?VDRhUUlDdmZ3ckk3YjhwOFhBTTdBK0FDSHhCVmIzREIvcDJ4U2ZXQjUyQ1pY?=
 =?utf-8?B?c3NKT1pUc0VpcDJJL0FOOW44L2dSS2U1aWFJVDA0Y29hUHp1eE9ZUjJEY21Q?=
 =?utf-8?B?QUtsblQ1QkhHZGMzekY4N3BueWpEVlIvVHZHbFdWNm1SVGZmL0pEU3ZuZWRR?=
 =?utf-8?B?Sll6aXB0eVVFcE1YY2FadjN2eFlQQmhVbEh0bEtHeHY3a2JqQUFkRzFKaDY5?=
 =?utf-8?B?Q3dmR1YxWDg5U3FUdXY1SXgyYnAwR25uRTcvN1BINm1WaVhJb2hCeThiZ1NW?=
 =?utf-8?B?ZUN5UTlNMmpZTURWYjREQnRJWVpobENjY1NVODh3OXRKQ2VXa2hwa3lIOUVp?=
 =?utf-8?B?MlF5WXZXUXczSTRDeWIxWnpEOEZET3BCU3FsUHdNWFRwKzNqME9HK2NseXg2?=
 =?utf-8?B?K1djZnpDaEV2Rksxd1Y3dzNpNmEwV2llWDdGRXFiWGl3WVF1aXhOcWs4Zm1r?=
 =?utf-8?B?UDFWYk1sbUQ0dzdmdURvamdaVld1ZHNMNWMwNjA2UG1Kc1cycjdwYTJ3Ykt0?=
 =?utf-8?B?ZEZWTjBjcVU4bzUxcTRWcVU3dEZWRUoyQUtmMlJLcW1pYlp6cEVackluZ0NZ?=
 =?utf-8?B?aldKNE10aHBJWExTU0NIWjhwRUE4blcwUEdKbjlCanNOT1VZckl0R0NvRHQx?=
 =?utf-8?B?OFBPS0NLY1kwQWxvZndObmowL2ZvbVNjUlZEVyt5R0xrTzdpSnplVU9VUURR?=
 =?utf-8?B?bFNRcm1oQzNuZG5YNit6WHN2YktNNDR3Y2FaaHFISUZ3QWdrMlRBd2RaVXps?=
 =?utf-8?B?dlNjWmZPQ0Y4SjJjemdyamJibExLbXM3VUlJN2gwaW5KdDB1TzAzeTk4L0RP?=
 =?utf-8?B?U3pqOWZZVU5uaGU5Q3hOVzF0bW5qU21zSk91YUYzOGlySmhjQjBHbjBCKzU5?=
 =?utf-8?B?V2R3WEszdjZxQlRlMmQ3RUNKYW1FWjlQNDYzU0lUd1d6WUJGL05pMUlqMGVw?=
 =?utf-8?B?dDZZS0V3SzJHc1pNUlJzMGRpY25WYVlZS3NDWFB2ZjY5QjlCenVBQkQ2UW5I?=
 =?utf-8?B?RlVOUmlldkVQOVNseHVqSDRiVmllM2p0V0NUUVNsNWw1ZG4rcDFBUDNJTWR2?=
 =?utf-8?B?MlF4Rm5rK29DZ0x4NnExb0J1cG94U1QzQUc3UjQ4dnFwRnJKMHJ6cGMvdWxU?=
 =?utf-8?Q?9pjm2AJuytcfS9jQ5aMfKnYuafPqVSbvob?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ceba5b-ba4e-455c-e166-08d8beefc9e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 16:07:16.8456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: la5djJ4+JWpomwGahlCzlq96CBWBKHkXgcd3ubEr2bMzDs6ORIX1qZaHL17+Zs4IH2NJf2DXi35r80/e6FDZQRckYMDy770k9/6pBfH8D1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4456
X-OriginatorOrg: citrix.com

On 22/01/2021 15:56, Ian Jackson wrote:
> Previously, we let the Xen build system and startup scripts choose
> which xenstored to use.  Before we upgraded to Debian buster, that
> gave us C xentored tests on ARM.  Since then, armhf and arm64 have
> both had enough ocaml support and we haven't been testing C xenstored
> at all !
>
> Change this, by selecting between C xenstored and Ocaml xenstored
> "at random".  Actually, this is based on the job name.  So the same
> job in different branches will use the same xenstored - which helps
> avoid confusion.
>
> I have diffed the output of standalone-generate-dump-flight-runvars.
> As expected, this addes a variable all_host_xenstored to every job.
>
> To make sure we have enough diversity, I eyeballed the results.  In
> particular:
>   * The smoke tests now have 2 C and 2 Ocaml, one of each on
>     ARM and x86.
>   * XTF tests have 2 oxenstored and 3 C xenstored.
>   * The ovmf flight has one of each
>   * The seabios and libvirt flights look reasonably mixed.
>
> Most other flights have enough jobs that I think things are diverse
> enough without looking at them all in detail.
>
> I think this lack of testing needs fixing for the Xen 4.15 release.
> So after review I intend to push this to osstest pretest, and may
> force push it even if shows regressions.

Sounds good.

A couple of quick questions/observations.  Does this cope in a sensible
way if, for whatever reason, the chosen daemon isn't present?

How hard would it be to add the 3rd option, stub-cxenstored into this
mix?  It is just one other key in xencommons to tweak.

SUPPORT.md doesn't appear to make any statements about the disposition
of xenstoreds, but stub-cxenstored is used by at least two major
downstreams so is obviously has security support in practice, and ought
to be tested.

~Andrew

