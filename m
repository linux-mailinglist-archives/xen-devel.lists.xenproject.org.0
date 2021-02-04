Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6A030F82C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 17:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81373.150312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7hfk-0006kC-Qd; Thu, 04 Feb 2021 16:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81373.150312; Thu, 04 Feb 2021 16:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7hfk-0006jn-N4; Thu, 04 Feb 2021 16:40:00 +0000
Received: by outflank-mailman (input) for mailman id 81373;
 Thu, 04 Feb 2021 16:39:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAxh=HG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7hfj-0006ji-GX
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 16:39:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42fec056-5bb3-4ef6-a269-76028654a015;
 Thu, 04 Feb 2021 16:39:58 +0000 (UTC)
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
X-Inumbo-ID: 42fec056-5bb3-4ef6-a269-76028654a015
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612456798;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=b+ohvtkQ6WIL6lyHcHQX1ywWa3j8CpFE9vJ1L1NZCuQ=;
  b=a/5LA5rPo7DUw/S+7W7N4zACsFcouinmEtkOmWHURN4rnOFszEagwGLy
   o5jYacL9bxW4TXdyMSAX6OKAFkcE5m3yQvvemrETNCztilNSEEh52kdp2
   NUME7xyZR57/Iu0TrT/1Y/8ycD5NPWZTjFzmOvp510A/t/HXK2C4e0IUi
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rWpVNWfGsy+Ejq/Jxndnnz4grAutGk1AcZsKPPOqZRZdPP5mVnt3sKpr5H6Ixs16R9+NvQ7lzZ
 +N7McoNZ9t1MUSlE7mRbG1GOf67sSV1T8F/vyuHXAbBRYdbvMah+YqdP+YSTVsZLOww0XsQsen
 um0IUp40J60du0wSuXmpozNqFvLbbvmrZvGJL+CnWcuMEZmvNnjfBfTz/1rgLIUDWj0gRC1gmc
 Ksp457jXC8kpuhZirs2WMKGIu6vO9J8CV15Aa+3T7uxGpwPe72z7Qe+aa4d7KHFjHIo/aU1hQ6
 6a0=
X-SBRS: 5.2
X-MesageID: 36572465
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,401,1602561600"; 
   d="scan'208";a="36572465"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJDFa6x3WM1wxU7B5kLJcXUopys0t1Cnj8PKOSi7RJJu6aiRVc4hZQqu1TwQay7sYmzy52+E4PiP4KkoFllEIfgKdsSuTVMY+90vkCwlZBJl5xH13r4MItWlgC3Af1Y2ypNvjesxWAG7p2mEo9ESpi0XM40enMgnu9df4PTRzjm3k/dTRnXQtD44gZCiVDqkG1zjNaOVi6gJQH1JLJesDh1SLdUeaCunmmE+qDaoCZBsf734W/Vyp/APlEXWMjBMKnMRXzyCeXxM81Ic3EpDGHatRNI/qhK6RueS1p7aN0wKg+F9RPg/NwweL2/oYpPdQzoFmQkuN4vOCZZN9vqR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+ohvtkQ6WIL6lyHcHQX1ywWa3j8CpFE9vJ1L1NZCuQ=;
 b=OiaZb0AMwmwh2cxESzl+v4ux1XAzVhMpcxoFoItoK3idDwTpRDFuRZNIO4moyV1UBKfOlnerCACzE4oHH2wJ6OYBxfbzIN5VsYNP9aINXTpSxl9RjFTEPB0z/8oQMlBA24/9md1UN45nlmFA+PEphLJceQWK1JaYK/4fnOFWbZkf++BBGarlqG9EJ3cPGdROvxYJyp9KJvepq8ShaUWXElOIvENY0MMiM1k8QEGnlcUjl0DdM1/Ma/DUsl99FOVKntL/b+r7vn2dqDv/4PFJBPD5eOBoJjlwXZ9vakix4FwkjhU1l+odvVsnK48nG3xgTssk5DvNKAMP+9RYtNX89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+ohvtkQ6WIL6lyHcHQX1ywWa3j8CpFE9vJ1L1NZCuQ=;
 b=g620PBcpZui6CoJ67lsBjBqmWkYmPrSYy7N8nvo/H8I8rPym3/Mo7jq7yVxzID//YUN8HpcFogVUpouO0451delIfTET24SI38DYSfqf5W1xoA0c6vAO/vrSnHmKDojljxvl4Dr7f6m53GjWbbm5ZwETwvdBAS9EUTHOqjHgHiU=
Subject: Re: [PATCH for-4.15] tools/tests: Introduce a test for
 acquire_resource
To: Oleksandr <olekstysh@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20210202190937.30206-1-andrew.cooper3@citrix.com>
 <CAPD2p-nPr_OD7cMT-Ny6vyGsY4nMXuENgrqv0pfYRYtE5srnkQ@mail.gmail.com>
 <6586dd8a-8596-0226-f3d3-02cd9e361a52@gmail.com>
 <79a41e5b-0717-f31b-3cec-60b716777603@citrix.com>
 <3c103959-880d-ce25-6993-65b93d248bcf@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8b1a781a-598c-ae4a-a102-e3ebbb710f6b@citrix.com>
Date: Thu, 4 Feb 2021 16:39:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <3c103959-880d-ce25-6993-65b93d248bcf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0371.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::23) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60c61544-3c88-4901-73c7-08d8c92b7f1f
X-MS-TrafficTypeDiagnostic: BY5PR03MB5236:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB52363BDEE67AE8BDAF54B384BAB39@BY5PR03MB5236.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JY1ctFMIMXxKERoH1uHOB+1YhPfiTTMiAicSHhROhW7xlOxLxHZRMts/ST1EUnPsTgDkJG7u3uHlANi6+sVwVjdj/W7WMeOwiOkVy3JP/+W/Tdk+Xucg7U5JkldnFlEDc+JhzmvxzmLA4/n5d3QiBc7rtUhxXQGSUgDxZBEzYy7pYM5rdC3e/SVrR1f0YSZt0SPyExjx2Qewo4eEk+7HjkXJ3KIjI8e5jX1erPBBVOOE922u+1F1Y7Gish9/J0xZ1DOFVvlTUVv8Ju0fL6Rd6pzcNeYAYEHa3BdRRN1fi4AHp5mhXLNEqIylu0JLWpDRXIsVDeNgONDQlXo1vPNWDS7RGqKBdQlWhq/AE3O8kl1OaaTo2vvFG1zI++3cFJVJNqmrtIPuc+Me9JBPnjvRKO1o8lON7u1PQNfpM5cbZE9CGwlMMqR82ts8RtbBc3MOjzjERfcPQFrOveugoQlHkgdKrYKs2YbKyWld2YaEN+gsFz9rQKHGQZXeB/jfB3nSZFWQawdytVkdtYoavG+oKS7iTpwAyey/AnsyRdmwKAUs54xu2Ec6+LcdGLpaig0nGCcEh3THTpX35Inv4XYV07mVfgtnAqKHUdAIRFEug7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(8676002)(186003)(26005)(54906003)(31686004)(66946007)(8936002)(16576012)(31696002)(4326008)(6916009)(316002)(2616005)(6486002)(66476007)(86362001)(66556008)(36756003)(6666004)(478600001)(5660300002)(53546011)(956004)(16526019)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dU5rZERha0xLK1IyZEZxMXg3YmV1dTRURVMzOVc2bkgrV0Fhay9OZUpsQXIy?=
 =?utf-8?B?c0o0Y0FzQzhuRlcwMHVCT1dqb3dZVXR3dzYvMm9ZSFE5SkFlSTFjRFJSL3BS?=
 =?utf-8?B?bFUwNCtNMGV0LzdIdDhxcU1CRXRKRVNYNDVTSmdpWjJ2ZDM5Uis3OFdRMzg1?=
 =?utf-8?B?cTVJbkNYbk56OUVuUW5aUUp5enJPejlWK05JdzFQUlZiYTh0bHRNRHlackEv?=
 =?utf-8?B?dG1SeGZ0cFM3aUtCWnIvZHE0TE90SUtoU0ZRMER2WHFQQWJYSndKb080eno4?=
 =?utf-8?B?amEyL210K2FtVXJuSmpGTmZ4VnlXaVBtQ0dUREtLMlk3dWllT1QrUDJ2eDQ4?=
 =?utf-8?B?WURPWTIyK1hkK1J3WFZvckpRRlNmZ0hXZW03bEIxNFhHSExzKyswV2czeXFx?=
 =?utf-8?B?VmJrYnlsMHlkOFBLdG1oVGd6QTdEdUhzeFFxbSt5Y3h3UFNCRzdtblEzSEM0?=
 =?utf-8?B?dE5EbnNCaTBpajF4OUt4N1dlcEZoOFQ3UVZIS0RrQkJEZ3oyR3hFTDhtR3Rj?=
 =?utf-8?B?VEVMTTVOenBHNzhhZGpWUXJhNEFKaHNVMEgxV0Y3bXJEZXFFb0pTWVBvQ050?=
 =?utf-8?B?VGREZkZCc09WdWdOS2lhS3JVcjRvVldBV3lqODAraVRhNE9QM1pRYk80NCsr?=
 =?utf-8?B?ZXV4M2N6a1pzbkYvQ2IySWtzMmsyQWZiaVREc003eDVxOUJvWkduVTV6OFY4?=
 =?utf-8?B?NHdmTDZLcWJ5clcxWDFLY2lleWxVRXlENkJnTlhkTmJnQWphWWFwQUZ4QkNF?=
 =?utf-8?B?d2F3QnNFaE1mVDdibFc3NkFOZXpFQUYwdXBjK28zV2Q3WmdBQXhGOUxHTXJJ?=
 =?utf-8?B?TW4rNnI2cysyRUlOTHRuL1U2U0cyRm10MFFTdnpNSG1NdVRtTGZwS2RLeExE?=
 =?utf-8?B?aXRTSVdTT2sybmQvcTNITm1rS3drK1ExVzV6Zy9SNGV6VkJ5Q2x2c0JEQW5K?=
 =?utf-8?B?cFN3ckU0b2QzUVE3YVU4T1VVams2NWpLaUpEWHlSYjVISWtiV3E1R2YzNTdH?=
 =?utf-8?B?S0VBaDBKOHFITlVoNk9nYlpoNFpNeFYvemh3K0lLM0EvK3VUNE5DK05OdUFJ?=
 =?utf-8?B?c3J2bEpiS1ZPSk8rVHBMUk5LMHZPZ1p3aytyd1dlQkd5b3h3ckdSaGZyTUN2?=
 =?utf-8?B?TVBYQlBHMnB2SE5IVGJuS2MvZWlhc0U3Mjlaa0o0QXpCdWM3MTdLS3ZDdmpL?=
 =?utf-8?B?Wk5yN3hwRzlUeURkaHk2Qm9UNW8zNWROd08wdXFnZTdjT0dkQjBaYUpnaXdP?=
 =?utf-8?B?SDJOZHFBcWJBS1kzbVFDZmxJMGlnUTRoUlNOMkI0dEJpZmFmLytWY1prajZY?=
 =?utf-8?B?cnJJZTZrclRhUXgwcm0xMzBSWmRmOXZIS1ZGVWpPQkw0dWhsaENIVEQwcVph?=
 =?utf-8?B?MzJhRHQzSmVxaUJ6Y29ENFljS2s0NC9CSDM2M3YrWUlIOWxNbFNFZ3hZbjBC?=
 =?utf-8?B?SFNnUkxTRFdwbXg5TEV1Nkx6dXVUajBjOW5ST2VnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c61544-3c88-4901-73c7-08d8c92b7f1f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 16:39:52.8528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOy12RFGKT7a2yYVb9zs46VqWd63w6HeVTu8N4xP2HcLpH3iLC5YB5Ak4VpwKXDi58lyUYPG1cH384D2xp/BPh8uyG7EWf8m+7xyqj/w/qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5236
X-OriginatorOrg: citrix.com

On 04/02/2021 16:33, Oleksandr wrote:
> On 04.02.21 17:44, Andrew Cooper wrote:
>> On 04/02/2021 15:38, Oleksandr wrote:
>>>
>>>
>>> I got the following result without and with "[PATCH v9 01/11]
>>> xen/memory: Fix mapping grant tables with XENMEM_acquire_resource"
>>>
>>> root@generic-armv8-xt-dom0:~# test-resource
>>> XENMEM_acquire_resource tests
>>> Test ARM
>>>   d3: grant table
>>> xenforeignmemory: error: ioctl failed: Invalid argument
>>>     Fail: Get size: 22 - Invalid argument
>>>
>>
>> Ah yes - you also need a bugfix in the dom0 kernel.  "xen/privcmd:
>> allow fetching resource sizes" which is in mainline, and also
>> backported to the LTS trees.
>
> Well, my dom0 Linux is old)
>
> uname -a
> Linux generic-armv8-xt-dom0 4.14.75-ltsi-yocto-tiny #1 SMP PREEMPT Thu
> Nov 5 10:52:32 UTC 2020 aarch64 GNU/Linux
> so I use ported "xen/privcmd: add IOCTL_PRIVCMD_MMAP_RESOURCE".
> I didn't find "xen/privcmd: allow fetching resource sizes" for my
> Linux version, so I backported it by myself.
>
> So, with "[PATCH v9 01/11] xen/memory: Fix mapping grant tables with
> XENMEM_acquire_resource"
>
> root@generic-armv8-xt-dom0:~# test-resource
> XENMEM_acquire_resource tests
> Test ARM
>   d7: grant table
> (XEN) grant_table.c:1854:d0v1 Expanding d7 grant table from 1 to 32 frames
> (XEN) grant_table.c:1854:d0v1 Expanding d7 grant table from 32 to 40
> frames
>
> [I didn't test without your patch]
>
> Hope that helps.
>

Yup - fantastic thankyou.

~Andrew

