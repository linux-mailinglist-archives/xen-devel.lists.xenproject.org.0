Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF0A2E7EEC
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 10:21:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60456.106111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuu8D-0007WK-Ar; Thu, 31 Dec 2020 09:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60456.106111; Thu, 31 Dec 2020 09:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuu8D-0007Vv-7i; Thu, 31 Dec 2020 09:20:29 +0000
Received: by outflank-mailman (input) for mailman id 60456;
 Thu, 31 Dec 2020 09:20:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIAU=GD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuu8B-0007Vq-Tk
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 09:20:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23639c43-f2fe-4376-9ab8-e5250c2a7422;
 Thu, 31 Dec 2020 09:20:25 +0000 (UTC)
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
X-Inumbo-ID: 23639c43-f2fe-4376-9ab8-e5250c2a7422
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609406425;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TwKZvhaWdoloaatJwqQSOY86w/qSW1E7cgF73NYgEQI=;
  b=bfSyjZ0bDBmJV63ug/FHqiLq1AMsbLlmoWt9X4GFJFHnBZkVADKKJB6H
   bwADXXV9KqhwC+AFX7cqWrWpmrjrsacdr+ESiCBeHZ0/3Z/fPrJyE2dtR
   5dfwypcdtvnHxs80ihfbJviEmV/lr58PSKtXRGPBRBx0WP1US4CPrJ5e6
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: y/QRrfxr3OiAkFFQNis31YGruPcxEiROiOz+SnKJzpZYuZo+h/NoKiXOT/gcyCpPYNZ6R4XwSh
 +ggq7srKfuNaAQ4bnhkCYDuQmRMZgB+6OS9ZdqH3RahTIH7dzH2sb202iF7VoRAQJnyoEvzEW/
 djxY1TdgOYIQH3eFuQTVTubNnsJicH54jkwiP78h9j+29shTWtjbX+zg2wCcwKr4wwIWf/rBp4
 wziNIIX9mNZQcTVExkga0b5yXMz9nwAa/diy5pUP4XWrmKdLL7sYKKEnkMImsRErgX26p1qE5g
 UR0=
X-SBRS: 5.2
X-MesageID: 35456442
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,463,1599537600"; 
   d="scan'208";a="35456442"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XC0JzoMQEa10fcDz2fj2zA3dw4/A5XpnuNkpTlqRDPhe+B42RGucC3+vMv5ZYELmjDMR3L5bivo93M/YIUiywEA67XQhzPcxkfJ2q15tIB3eAgd6mtRB/pN2VroGbPaWfZ1XhxzguIPgpGTIwZNg2TZMWEPjyVDr2nBA+J01YylHs+9ROXAb8XoXkumS/8ZedrpqT8Y49nUVt6+Kc2kynxzlG9eTgEWgFSoi4AVWqy3Hs9meNRqmY+ys4H8LAUtaXcEAtSjgAsIm6tSn2UZPpet5icku5cKHXgpwxyECulguIJzaGHhEZ5HNl/wHqGjwLhLsa2VT7QzN75UxuFqKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3mxOnLO74MPNjud4xKFP0mDDrraeYSt6AZo5I4xlSQ=;
 b=ISza6vBwz+QiVSyHIKJjZFGHePbM6qiIlXxofItzWqrncz3g/045CasDj79TQjcs+X2S1zjQUvb2gkzCpqiEGVuowFWxRq7tL89MtvmKTWjYRZXpGyhbdpskS3UOk2hVjAMscIzGIql7KJLco14Gmh2dSgCfqR/xnnyMqAiJCSD5vXJfL6nWZMZIsK82pojHHMNzuLbQqi3GIJwUmrYOucr5ltRkbhzdU4h97SN3+vEorxk+RRWv37B8dIL12yJTuGQB3hhwrHaTDd5SMaRWGI5BD2O9Lvnreif+QWwYg5e5dDG1DzZacPOWTwUem33iFWfSz3W5nSBCiNZuA/NWjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3mxOnLO74MPNjud4xKFP0mDDrraeYSt6AZo5I4xlSQ=;
 b=CZSJeYJsql/B+UwJ0btZaMpZsHiboJCw5nV2sFsJsaxtDPU9ytX1tukjP58oZSfbUu/Pp/3hx3gZMNXVqCxWcFKPnwmxNbwD9CFfDbvSeSgSnDiGF0VbeTucf9BuCfChef/GOaUn/0N56jSsJqOPBGgmA74kLQAUUdpPbO7n0b8=
Date: Thu, 31 Dec 2020 10:20:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen: remove the usage of the P ar option
Message-ID: <20201231092015.ojmlwfvqky6uqyig@Air-de-Roger>
References: <20201230173446.1768-1-roger.pau@citrix.com>
 <b90b93d0-ea83-bc00-6dc0-cbe9e7cfa1ce@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b90b93d0-ea83-bc00-6dc0-cbe9e7cfa1ce@citrix.com>
X-ClientProxiedBy: MR2P264CA0019.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0170727-a61a-4f00-9892-08d8ad6d4b59
X-MS-TrafficTypeDiagnostic: DM6PR03MB5356:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53569B344C0E1EFC8FF9D8C98FD60@DM6PR03MB5356.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEG7sAD1Q71IoCXGQjlGXrdUZumJsMTYjcVjJaQ0Xypp8Yck6FYD9X1YC+AQpWE+dSbpBUAA10JDJD0NqMvSH2uRpBQmHPnbuk5s4m6qlRI6yv9bsLFQf6M/zDFeqPdXzCjNJ7wqDtbfu4/jyvXo9ZmYQpLsFk3zy337tGk4oDXDIgwKiJLYdhj/N8d7EMNnawY9olMa3cJKTPRUt564WWcMXClidfOMO7vw0WDX5yQmu+p/PmCHlSDR/uPb9Nzm7gDfEDTytDbY6doxEkG52aYuZensCTC1OsQuvIVUDI/YGLS8FRSbIJkXIyB8vaYexDHn31eqkfnqkgbuxBdnU8mG3v/Y7juDK7jN1jXcJ9KmwQWvWIhth5Ms4aah2W2SLp+htFc2Eu6piKzBmW2eF4jTle5MtGnPEMXgJxkrGBx+37EEY5IB4hUg97WF84pgx+Zg5Ar5E1BATsFV5fPXAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(366004)(39860400002)(396003)(376002)(54906003)(5660300002)(316002)(2906002)(6636002)(66946007)(53546011)(66476007)(6496006)(16526019)(1076003)(86362001)(8936002)(26005)(66556008)(186003)(6666004)(8676002)(6486002)(9686003)(33716001)(85182001)(478600001)(4326008)(6862004)(966005)(83380400001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NzlmbWFMMVVkclNwd0hZeTdaU1k1ZWMyM3RSaHJYdjdaUUFweDlENXlyUXJz?=
 =?utf-8?B?ckRIQkw4WndVQWlaWWZEMkl3Nk1Na1lXeDFLRVh5cXkvU3dXWTVJMXlDOXAy?=
 =?utf-8?B?aGtXUHQ5ZytzOFhQWldwMUdqUjA3dnR5bWVXVEpzZDlZMUtqeXZRT3hwa0JQ?=
 =?utf-8?B?WlVWemd0dFh0elpVTkd5bDNEOWQ1M0VWZXJEZE9YcHdUWjhNdE04ZWFnUENx?=
 =?utf-8?B?QzdDanhaUDFIbmxVTVNyYS96VU5tSklPcDNHVk5HRXBNd2dtRXFzc3FVZllO?=
 =?utf-8?B?ODRyS2ZUaDBXdy9yRkU3ZlVPZlU3Q05wUEVqWVRtMCtqVDNuUXNXVjF4Unk2?=
 =?utf-8?B?TU4razg3Z2JYeUIxb1dEU2Z5WVBtdDZrdzRMQUdWMTdLMU5OZENlNHNta2sx?=
 =?utf-8?B?eGJMVTFZZlVOejZPKzgwK0JrL0JVK1Y0NUZDZ1M5aVJ2MHErSkRpaTE1NzRZ?=
 =?utf-8?B?ZTRyTHJUZ3UrWEpqRE9WMjV2cnh2bFJzWEV6M3c0OWt0Ty96NHJSNmFSTzg5?=
 =?utf-8?B?YWtmMTdQaC9Ic3ZqOFJGQTlxdVpkK0lwS2NMU1NwT1R1eEtaUjRYSHp3RmhX?=
 =?utf-8?B?bE1WRHY1RXZvUkVHZXVPa0FuZUtPaHNzbnhleWhYdXN3cnVVMkZlM3lYLytM?=
 =?utf-8?B?YTBQNG15Mkl2Z0NPRkdJZDFybUVlTUwzYkM4Umt4RVYrZGNhZDdmMnFTd3Jy?=
 =?utf-8?B?eEVVeFJJekZjdEpXWDBzL1VoOEhVQkJzYTZtWTcvQk1BZ2hJeTB6MjlmRE91?=
 =?utf-8?B?b2Fab3RXOUFwb2JBK1ZjSEJCNm1nWXBXZnpDOU5qd0dQbVE0bkk5dU1aU1d3?=
 =?utf-8?B?Uzh3V2tQdWtKcnVhLys5ZjcvbGdzajN4Mk1GZGJwYkxkNEJkbVE4R1VKV1Nk?=
 =?utf-8?B?R3NvZ3dic2RjZUYxUUMwNm45Y0NVUW0rRjFudTR4NGtqM1FSdThKVVl5SDZU?=
 =?utf-8?B?emRwUHVwUUMzM3NtWGFKUG11ZEFSRk8rbjdQanpzWmwwSHpwcnBNMlpZaFVC?=
 =?utf-8?B?cU5JeGVZb3Nxb2l2eEhGN3pTSU5wYmxOWXh0V2JyMWhTem1VamNMS3NCc1dT?=
 =?utf-8?B?M1BVSHFoYmVMTWhlL0pzWjJmYVRvS0VBb0pQOWVmSkJKbWw1N0pJc3ljZ3Zo?=
 =?utf-8?B?NXR5QytZN2IrcUU5anMwbnVWaHpqdFlzTlZ3TlBEOVNnSktkUmFpaFhzYnJw?=
 =?utf-8?B?aGErOEYwekVRenhzZ09XdUZGZ2pPL2tMT2tKWTlPUyt5UHAvSGVpNWkwMW9k?=
 =?utf-8?B?alhycXE3N002ZG16Skx5SFkrdVpZbXBZZEVFSGhpVWZ6d1pUNm43bWR2ZVEz?=
 =?utf-8?Q?JfKsmetCxxta4FbwX/f5kmtX7wp8tjxz5k?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 09:20:19.8515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: c0170727-a61a-4f00-9892-08d8ad6d4b59
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duPZv+VNmeXn6ps/+z1Ph++0XPlR+BhrvFUTox9RCIrAaAnBZbuB/LHdrW3qztuigPpjW7qpESVcLNvqauRHMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-OriginatorOrg: citrix.com

On Wed, Dec 30, 2020 at 06:32:58PM +0000, Andrew Cooper wrote:
> On 30/12/2020 17:34, Roger Pau Monne wrote:
> > It's not part of the POSIX standard [0] and as such non GNU ar
> > implementations don't usually have it.
> >
> > It's not relevant for the use case here anyway, as the archive file is
> > recreated every time due to the rm invocation before the ar call. No
> > file name matching should happen so matching using the full path name
> > or a relative one should yield the same result.
> >
> > This fixes the build on FreeBSD.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
> 
> We really need some kind of BSD build in CI.  This kind of breakage
> shouldn't get into master to begin with.

Fully agree. I'm not that familiar with gitlab CI, but since we have
our own runners there, could we also launch VMs instead of just using
containers?

It might be easier to integrate with osstest in the future, since
FreeBSD has now switched to git.

> >
> > [0] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/ar.html
> > ---
> > I'm unsure whether the r and s options are also needed, since they
> > seem to only be relevant when updating a library, and Xen build system
> > always removes the old library prior to any ar call.
> 
> ... I think r should be dropped, because we're not replacing any files. 
> However, I expect the index file is still relevant, because without it,
> you've got to perform an O(n) search through the archive to find a file.

Right, the description of 's' between opengroup and the Linux man page
seems to be slightly different. From the opengroup description it seems
like s should be used to force the generation of a symbol table when
no changes are made to the archive, but otherwise ar should already
generate such symbol table.

Thanks, Roger.

