Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F5316BF7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 18:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83668.156308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9squ-0002yy-T9; Wed, 10 Feb 2021 17:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83668.156308; Wed, 10 Feb 2021 17:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9squ-0002yY-OR; Wed, 10 Feb 2021 17:00:32 +0000
Received: by outflank-mailman (input) for mailman id 83668;
 Wed, 10 Feb 2021 17:00:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08uA=HM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9sqs-0002yT-NY
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:00:30 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6bc416f-5210-4c55-82ac-0223bcaa7d92;
 Wed, 10 Feb 2021 17:00:29 +0000 (UTC)
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
X-Inumbo-ID: d6bc416f-5210-4c55-82ac-0223bcaa7d92
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612976429;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ud91ZUGiELp7dK+WvV+JKkvJnwquss6sCLbZsKcKllQ=;
  b=dh5RK/cGKT7FIslyoDL8GWmLs8vEp8GyfL+1z5KovXCyL0JZYL9SUweS
   FoD61Cmka1CzzIg5NVb0IHEcUd1mg3shNr7aF0X4+q7uYzY4bTkD7OGjT
   +dOyINaEF6Iiv86JUS2W1EnA0ccVmEBWw3jIKNq3YWfhxIEKDm78QxaBd
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DtCNs9wZPliw90ZVdn/6IdryXwlSK0eUT9Tz12zSDkBIaL60s+JZhKP+LWG07lhARHy8We6dgG
 j3Fxmx3l8EOoRMeBq56XOhRY1iEhQYuTkdm8XAXHbHzIg+7ego+hCO2aOZgKUHO5EceWnpMpln
 KS1fajXWxOlh3sD9MUN7uy/tOcE1CBUdEbui79gLZI/58aakfKvV0DlDlPl0yRa32at0BEfzLQ
 mSa10qaMPouMI0HWPBzz2soqmg6O0wfvbvrM3MHgoLR7UMIHOI6rZE7kZrQiNXd/C0chcuWygl
 e+Q=
X-SBRS: 5.2
X-MesageID: 36969478
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="36969478"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6zYwy/g4hkrXE8u35DFzPg37Um+LkPdNedzJTHuEyzTTBZavjIC+peMCsClFRjWG9vGf1/6gJn+m19yiwAa+4RpOMNAY1Vb4V6Ejs0/RPoWNrUVfvRUkXdIbJN8JVLu+0s0NoNrKTi6tV0036AuMZ8aBvo3o2kpPA/d2sbkUp2aXF0j16pLB8S4Tfvhh1RDfVnqfLjQ10yoWYAWej/CwUdKmP5hwCMy41/g7/2y5ARnbcFs40pSlp53stGMJ2UcLuv8vJLbcv/n5RCKQrFIiTB/UxFYF3dvLzdt5hCXJZO4zaRnmn1Cbqefrjp0y1C9uQW1YJxbS4ibirLEbOyajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ud91ZUGiELp7dK+WvV+JKkvJnwquss6sCLbZsKcKllQ=;
 b=adaEjeKGju3bWabD0PxtKcWCWXT4JpRK6zJWftMAHFM1eYX9bPhJqNI8MEoq+lSDcZFdeZBYr0Ew9wcJrGdsSRM60vsNMRYvmVt+Y5nP2XYHzcgh0x0l5Jb+piZOt1GX3PvIxUmd2LQcOhpdqiFlw+c03YIxNFpwMIzmT3ugsib4e9n5nH5S6joPvNkZuhI+PYYu9WWqzZhHNGUtD5vxMC3Jx7ZCHRawj1Sjkn0CCaxRC7Sb7AGwcS+xLUT7dazUcb/3PrwaFR7E25SGW4Bm4PS1NeClBchC3Irit1kIMJ74VxVjjC5mkucLrqiCM4QMipoFXfLF0R6KA7uE0OMqRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ud91ZUGiELp7dK+WvV+JKkvJnwquss6sCLbZsKcKllQ=;
 b=IIX+gUvQrJ2ukCxiXLGfmOOQKo7TRo5GBaoBQ9MvpwF9rS9swoEZoH4qHtb4atj4eqys0DtbdIcqFB+o9iXUSNtau0Tj7D6vgD4gcZ8+gSLb1t8PG40vVcm5P5vnpzfZ6ea5ayjb5IplNozwgTJww2pQI09BT3WaPnOnW54zfU8=
Subject: Re: [PATCH] VMX: use a single, global APIC access page
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3c7a4cff-3f11-22e1-ed46-e76f62cc08f4@citrix.com>
Date: Wed, 10 Feb 2021 17:00:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0413.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3af7927a-e94b-41b8-f010-08d8cde55bd5
X-MS-TrafficTypeDiagnostic: BYAPR03MB3558:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB35581ABE92DDBE891A20BD94BA8D9@BYAPR03MB3558.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8oz/CCogkFdbuRuGG/MojN8F/DtcTeRL6Q28Vp1IX79wbv4rqEQOwJAGQlbeRvqAiGwfVx5wkAF2hAhXaPgK+WtKLxXOeTnabxum4FDU8+jr7pU1drIqy/05PuQGNrH+woZ6u7J222h3kKDevG14OD4hGbTsV9ngjHrg9dJllbrukRA8g+Vmraxy1T/sjqbav45lDbM9MvLxyhDkL3s3pztIcIyge55Je6AarhWkF5uhw38j6/gfAvGxd2I1hekzhwpxAC75JVoUV5hLnmyMPUliKMqyalUSyCzrhDpJ8ilzzjfghZu9PVp8vFcWoceRmF6VKkj95eFkLO9V/cuzejG0amlBtZBQS5W7O6WMdqIDjAox0xcY0vm4TPl8eyZZNrsrVl4SHltXCshiAj0liuZQmcpaUOJwRIsv4KBCKCWjNTUXWZ+gK1hUunsnUi4eYab0AH7ue5F2VPmgHtRz+z21VdzsH5C3KowVBBjvoqEAvNMb+uiqHMvoO5uaU2FQTxKThHDNCqbom08NPE3fez7DJMmFCxqXQ2mpwu1BV4lxgyoUsgR7paAWQ6J6nwiJr1ctw3SDfj1sL3+9EnjkSyCujXFe/ScTsz39DKDDYg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(66946007)(6666004)(2906002)(66476007)(83380400001)(16576012)(110136005)(54906003)(316002)(66556008)(16526019)(26005)(2616005)(86362001)(956004)(4744005)(8676002)(8936002)(5660300002)(36756003)(31686004)(6486002)(186003)(31696002)(107886003)(4326008)(478600001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SC82NmVEd0RQS3Q4aFVUdzJDUmVrckE1WFdxSHJhZUY2UzVNeGxOYjByQ0Nq?=
 =?utf-8?B?eTNSdWJEQ2VhYU1yTWZweXVlSFRiVkRuaFJrWnJVWnZ5TmFIakZJTUhndHA5?=
 =?utf-8?B?QkdjczUyc0JObS9GZE40YUl3TkVVK3lqbXU2alZneGpadnB5YlhFYmd4MW01?=
 =?utf-8?B?S3Y2K21VNEtaQTNBU2xjWmNQM3ZLN2kzSDRIaHRnOTJIK3FCZTFRZkFDUTZm?=
 =?utf-8?B?ZlRlWGhseDBmNEJLazFLQURRd3lERm5KN2crOFZrNlNyQTJtWjJ2MXhFdVFw?=
 =?utf-8?B?cW82VThKakdoS28reDRwSG5aMzY5Vy9OY2hZc21FWlBBWDdQREU4MDMvZnJp?=
 =?utf-8?B?MTdhU0ROWEtZNTV2dTUzUVZ1SVYwalp5Q0JGTTNtMjh3emVIdnNwbzhTdE9p?=
 =?utf-8?B?WmVqSDFMZ2tZUmRZbjVwb1pBb29STWlOM0RieCtjZGl6S2JIU3MvVjhMWCtO?=
 =?utf-8?B?dGxRODJCQnJ3TXk3aSs1N0ZSa29UM1JlZGt5bGVtNWRXRmg3RWdkSHozOEpr?=
 =?utf-8?B?S09SQ1ZQMThVSjJpS2JSK3VEMXNGVHY3SXFtc2pYaG81Z2NYZHB1NTBoVkxW?=
 =?utf-8?B?b2YxdGNUdWlRbnBVUVVkUE9naFk4MnhCRW85QkNDYi9JNXpCRHVpanhOWUtr?=
 =?utf-8?B?cmRlRG5GVDdkK3FmL09LYnZ6VGJUVG9PUGlpdGlaajd1ajFrcFI5UGt0MEpU?=
 =?utf-8?B?NGo4czhscFZqUUswc3Y1NEVSbzZxY2R0Rmo2UnUrV2dOTHFtaURsU2RuUkZ2?=
 =?utf-8?B?enEwYUI4Ykd4Z044eU03QjNtZXJSeWhLZlNzU2pXZ0tVTEV1VnQ3TnY4VXdL?=
 =?utf-8?B?UW9ubmMxUEcwS0lUeElQWjVLbThjWnNFU1Z3Y2hXVU9QZkRZV1VYUUpiejFE?=
 =?utf-8?B?ck91dXhrakVTeHhyY0NVQ2NYK3BIM0tjZ0RzZTVwMDJCSlFjdTFlVGVjcFhW?=
 =?utf-8?B?enBMR1BPYW8vanZHaExadkY5VHZMc2hvZHVZY0ZWMFNCQ1JFSTBFa1pPbmxE?=
 =?utf-8?B?VmkvUkFCcTFZdEtUb21ubzVLUm1DUTBNVWUwOTZ3bVFwZUpPVjRURjh2R0VC?=
 =?utf-8?B?bU9Sc0twK1ZodldMY08yQXlLcVNMVVBaVHJWbmlzbzIzdnIza1c0NVlhQ2dY?=
 =?utf-8?B?TU9TWTR2ZlpIcy9zeDBGZUI3MmNVd0RYK0pyZUZ1OFg1dkJ6QVhSTDE5VW1D?=
 =?utf-8?B?Z21PeWlBVTVXNDVkVy9QT1VqUzBRTTFGTXFyTmNUSEJnOEJ3TVJUSy9EWHl6?=
 =?utf-8?B?eXNEeEY5M0IwQmkxcG9URmk3MW5hdTByd2VtN2lRYzIzay91KytFRU5QSTJ4?=
 =?utf-8?B?YVR5b3lkMStZN1Ivb01WU2Q1RnUvNzl0VGdYRDAvTmZ0dU5ua2NoNjB3YXJh?=
 =?utf-8?B?QkJXdzdNMjljRTVkTWVzMElGYWZVWmlscEsxQ1ovT2VabzNadUgzQ2Q1VUsr?=
 =?utf-8?B?U29yZWNtYWlSYkI1dkZmRFAwUjM1SkY2YWV2NGtjdVVWQXJ6ZHB1SHNLZVdT?=
 =?utf-8?B?VE1iSkFyVUQ5M080R0hkVG4vaFlWN1o2MXdYQ0tSZlVYQUhyZFh5Skk2dGdx?=
 =?utf-8?B?cnFlMkFIZHhXTWtHeWxJT0VGejBPMk56dktVaVo0eklhRUgzV2ZJTmVGeVdD?=
 =?utf-8?B?OFRqbFpKaUFDUG9jV3RzS3hrK1FpaHJ5dnNsSWZkdlJmcjBkdGpxcUZFZGVM?=
 =?utf-8?B?dE9NTDBzVjZIWEcyb0ZocFBnZjMwRXo5bm5BemI1MWtJSkFXOWcxT21Qa2VT?=
 =?utf-8?Q?iI+xYPoZXYrbokYbWkbIXXkw8vB84QJW6RMjYpf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af7927a-e94b-41b8-f010-08d8cde55bd5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 17:00:24.6786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NtFszymuzEkAWWV0rkAV6xYxeM4XSbEUzThQ3jHIUm0p/HzDSiznSYfmOKf0YDHybw+TvoZfk991W1oZgYtLod9sF1v53B/qpedj1ejvzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3558
X-OriginatorOrg: citrix.com

On 10/02/2021 16:48, Jan Beulich wrote:
> The address of this page is used by the CPU only to recognize when to
> instead access the virtual APIC page instead. No accesses would ever go
> to this page. It only needs to be present in the (CPU) page tables so
> that address translation will produce its address as result for
> respective accesses.
>
> By making this page global, we also eliminate the need to refcount it,
> or to assign it to any domain in the first place.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

How certain are you about this?

It's definitely not true on AMD's AVIC - writes very definitely end up
in the backing page if they miss the APIC registers.

This concern was why we didn't use a global page originally, IIRC.

~Andrew

