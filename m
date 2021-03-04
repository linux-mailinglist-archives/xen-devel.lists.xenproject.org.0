Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4BE32D8CC
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 18:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93359.176266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHs0z-0002E2-Gl; Thu, 04 Mar 2021 17:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93359.176266; Thu, 04 Mar 2021 17:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHs0z-0002Dd-Ct; Thu, 04 Mar 2021 17:43:57 +0000
Received: by outflank-mailman (input) for mailman id 93359;
 Thu, 04 Mar 2021 17:43:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zd52=IC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHs0x-0002DY-Hc
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 17:43:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fa647cf-ebad-45d8-a2bc-f3559f40d516;
 Thu, 04 Mar 2021 17:43:54 +0000 (UTC)
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
X-Inumbo-ID: 4fa647cf-ebad-45d8-a2bc-f3559f40d516
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614879834;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Hm79e+OCa+e9Tm6AtQyhrXxWSkmiauxNJJC8IH5sNNE=;
  b=XeWwjRIxl6n7wiaM126d7EdPJXcqjLNlolg1+hUE1Ty6s7Gkhx1ucxO6
   889EP/FieOQ2VkuH3bYkmUk0pG/6Ad7Kmz4m75bFdmwNSiykU75stvT68
   i/tSD4+CVXL+y3UKgCIYiUNIx9pLglIoeTH60IPQSbGTW5NKy1c1aT2vn
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NbYSviL9vSXgLauD0vjMO07HeWU6M0V35KaAqG7Tmv+LKenc27fUBUHkyLyuGeHNbN5QN/hKQP
 fcDZ+VYKaOxWxIOLnp5J4KDF+AnFVjXnIFj5s5d6BJq6iOj2UIh8VG73mnK2RPkK/IHe1985GF
 anZMgPbp4U2wTXQDtKKp714xZEZpq3hetHItvW6tkL0EMzOUesLR8z9R1OQSwXNBJSSZbSN91A
 0SNGtlFNCstZU78KZpYOOVX1ExhRgNEj5rSsCa7AjkoO9aRoAJGgwP8Gn7VYrgDEtXyRbvhjnw
 U4A=
X-SBRS: 5.2
X-MesageID: 39971285
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="39971285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqAdiI0mU6SrwDCdeQtNi9OcdeBNCp00BVgkunTipNEB94VQbTOAEsaQFNK+Mx6LF33NmS9Oo3fopB1DJGSb6KpAvaTycXYyDmn8yAYB+PwyucWMbWPOwQ6emtsRz7z22G7EDP4Vk0yFS/3RB8BbuEkz5EtiUjFh0vLWbDB3kVwD2OU2xx4YaxjWLBZQb7ClzxkqO8iATXZ9ntnMluxxXc39prpZQQwyu/ka+OavtQJDhPCOhn4M30xqrUzCZT5SNCgpFEXR/jdwy5A7YyZfLHMvCGOSajK7Fgj52wT4mez1UMiiG+eb8fSG4ZZBaHT/Ki98AHuz4FXYkxmjJuqS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSdFpfSRkuzbYTSqVwBf1q9Rq0x+HVWqOqbJ2/xel2U=;
 b=GFqREsYOJVBCykl5NVe6JvomorqZmsrFtuwASPTpqKiPIUOd7StlsdTMlXbGpwRcgJqmhHAspc6MRhG1aKijgs6pSaIH1FCupz88MPAcVDDVRERfd62KNyMYP0UzuAzbs1L3p66IzShfTb7nlG10XOqPyHmBqLJaDpJ4IDyU7q98XTSmdobykZlaEcrddbiNE3urAfz1w+vcgrVLCv44or4VXPgY0f9G7EUvkWxZmoWUI1l8QeMUILaXiIyaSGvz46WxN90juebgrwWULZHU0FDdD4xjEMQ89XaDUBKajkPAZCPI+M1GjK3sR39yzNibdjd+nMeu7F0EP2evGyhznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSdFpfSRkuzbYTSqVwBf1q9Rq0x+HVWqOqbJ2/xel2U=;
 b=BRy7aX24lEhp0dvpj5WKbUVdcYW/98Qd6Uj1phpv4G7o+UIAq3zrw+wXmkDa2Abh4D5Da+tICjO89cd8w1Cx1MwYSzDE2jiiHmK5y3gnEbwOiPU6ynakeB40q3qHdk+8dRsNTnWc132UBhPtrVtra/TIYnLGDtApxnJ3SZoZjoo=
Date: Thu, 4 Mar 2021 18:43:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
Message-ID: <YEEcR/Jb5TgI31rY@Air-de-Roger>
References: <20210304144755.35891-1-roger.pau@citrix.com>
 <24640.62938.427877.757656@mariner.uk.xensource.com>
 <YED5Czp+v2xFSCOG@Air-de-Roger>
 <24640.64194.445736.52546@mariner.uk.xensource.com>
 <YEERBL4AO371ZxmP@Air-de-Roger>
 <24641.5419.379341.215528@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24641.5419.379341.215528@mariner.uk.xensource.com>
X-ClientProxiedBy: LO4P123CA0249.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7aa9e20d-7c62-4c78-af3a-08d8df350b9b
X-MS-TrafficTypeDiagnostic: DM4PR03MB6047:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB60470AA4CB04B34EFAD045158F979@DM4PR03MB6047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHw5QFzDuAoBLHOB4dq44Jndvi6mid3WaJ+cKju+5v3wmA8JP5AHk+9kB+SjQOUtzGRp7eKA3W4dXH0rzJTfw6egaxKvDZk10+TN7dGKCpwDQWoJCXHlJDvFwJ1wr5RC8Zek9XwYSR3G4jr8DcvZxPF2bqvAWzVdburp6+yYWzJ2e78lDMNFXaTzglwrH+Y+P9/8PmP4Vrn0h0l4P3OaYmwEZh770vd3Btx9MJV9OmMs6IZLHO0TLldO3Xjyk3OXRvTSKFWaDdXAoXJLQN2DZ88QK8TmylS4raa8SyL++clM9fE/uB8ZbHJUwkguFdPmwB/H3lxjDTqv/mow96Nr0M4dIyeAdqxF38WycFaEVglwdcwJjz1roIymnn158L4rQVIhM3ENdWqncjT5Kbn/uyUl936kx7viFcbS1s+lVk0jdnnqz7GHQpGS3ligC6fdMvx1EPduEHwgWVM/SxC4ASyN04j8JzAY83rY2VNiU8RfKwPM6+wmmCYrFcvcDqcYTHC9f/EX4h8WrT5i0Zmtwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(346002)(396003)(136003)(366004)(186003)(16526019)(83380400001)(26005)(6916009)(2906002)(54906003)(6666004)(6486002)(4326008)(86362001)(956004)(316002)(33716001)(66946007)(66556008)(66476007)(5660300002)(85182001)(8676002)(9686003)(8936002)(478600001)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZFNUUXpmdDdSOWMxalBLclBIUUQ1ZG9MaVFIL2dnbUJEb3I0cXFTU1BWYlVp?=
 =?utf-8?B?d3NjcW1PZWhNWmhHb0l2R2cxRDd4aUtJVGptcHN2UWVBeE85MUkzSmtURFh5?=
 =?utf-8?B?bktIQUUyeUQvZGdwUXJ6SUVGR1MxWFlqZTdmVWpOUFRuZnhkbjRzY1dXQ0lt?=
 =?utf-8?B?bFF0VTM5dmZxN0dteGRzaFVXTWU1TzJmeWVIMkpBdko1K25vNFUxclp0MDlj?=
 =?utf-8?B?T1FHeDRNMGtQdTYxdXZSUThNS09WTVRDc1VRMi9nSnVzeUVISGNTdFh2RXZO?=
 =?utf-8?B?T3lHRE5DaDNSZVdBdm5VS0tZY1VEZzJ5dVowa2tLaEFVWWw1NTRuZDFNemhK?=
 =?utf-8?B?RjQyS1dQeThBbit4L05WVTVwZ1NhU211dSswZURSUjVIQ1V1UWd4OC8wUTZv?=
 =?utf-8?B?dk1kZUlBc2ovQ2lSSDR6ZjRXU2xndzRwYkdmNjdHWmRsMTFiV0J5b0YyS3Rv?=
 =?utf-8?B?cDdpaU50c2Z6UzhkRlN4c3VJdk1RZldJYTd0OTlkRzBYK2VJUTNkU3hjNEpO?=
 =?utf-8?B?MnBxMlNKSW9vNG5UaW1KbmFKbFAvZDl4eENvUUJxbU10ZE9CTFp1MjhDRjBh?=
 =?utf-8?B?V1BUSmVjL25yaGtDMXBuQ1lQVTZLUGVjNFJ6RTNQalZ3T3Q4TGpKb0FjOWo5?=
 =?utf-8?B?Ni8zUVlMRDc5cVVCSlM2ZlZteC91VDJ2OWtMRUd3SFB3Z2l6bllMRk9PWTM5?=
 =?utf-8?B?RWhMbXlpVEgvNjJaNnZ5S3JNY1Jlb3FvTVpJM0VvTVRMN2JtZEtYRXZGbWRM?=
 =?utf-8?B?QlFDWEFxN0pEaHpHNU85dTA2Q3Yra1o2dURTVUlISjlmR2tPWjc1clg0Si9N?=
 =?utf-8?B?TVRuY0tScVNxa2x2c2FNUXN6TUx1ZEZnV3ZXVTg0aDNicHhNMmVwZnB0TWMy?=
 =?utf-8?B?dml3SlJDZi9NNml5ZDIvdlA5c0M5TFh6VUYvOGJuVzVvYlJweHRxR3IzR0Fs?=
 =?utf-8?B?WnVzUnpmVWtIclQyRXhjSHdJNEtSMlVNK1hBcXQzbk9CRGt1Zytzd2c4dnVT?=
 =?utf-8?B?bHpuYXgzb0szeWsxbG5xSTA3T1VtbWhyelV4YU1uVVN0aG81VDFBYUFWd1N3?=
 =?utf-8?B?Y0dnb0UrdXJkMW5kMmdkWTg4M2x4THJmSzloSEozd2U3Z3A4Y2MzTk0vWGl2?=
 =?utf-8?B?UEV6bjB0bmxWUUxwU2JsVFBmVFpLMVhMSkc3dCtScmZUdk01VjBCajY0aFll?=
 =?utf-8?B?dkhCUDhKYUt2ZmI2QUFIYjFpbHVFSUFYVmlhR3VKem1xUlNwQVNVTWRVdmV0?=
 =?utf-8?B?NkYyZnM0RWM5V21Gb0hXdCt1cXArUTM4Z0dhMGpsVElkQVA0cmp5cHdnMWY3?=
 =?utf-8?B?cmYzOUFqbDAxZlBIQXFtelFBdUJJaG1uT3htNXY2ZXVRR25UaWlqbXpKQVk0?=
 =?utf-8?B?by93ZDBaUjRhYXp3Z1E1ZmxQK2pjUjRMTE9saFVjZldEbk9XTG9sb1dac3Jh?=
 =?utf-8?B?dm5KLzRIZFRBMHlrNWppRzE4RDZweUEwbnBLVE1MU1U4ZEE5WXVzUVc5ZWZ6?=
 =?utf-8?B?TExDUHlUL29VZVRuaHJKSlJRWGVqWElOeFVwbmhHeE9TYUZUbHV1bm9Wak8w?=
 =?utf-8?B?cnNUUS9ucCsxbThQMk1FdEZOeENBSjMyM250V0dCaFpmeXpZMVQ3cFBsVVJU?=
 =?utf-8?B?Sk9WNXpoNStwMEpJTUVJOVBKTkRzV0pRU3AveTFxbWloamRFaUt1b2gwVVpi?=
 =?utf-8?B?THA4MXBwSlRnSm0zQWZvcTA5bWRXMlQrSWJJdEx6aU9CR2VWRTA0M0laL2Ix?=
 =?utf-8?Q?tLepCc2Z2UfiAUArFhfWkX3Nz4SnMezKA5zMtp5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa9e20d-7c62-4c78-af3a-08d8df350b9b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 17:43:39.4993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltHxPcQtlvTTJxR+ZghCAj5R/fJpsy7EhJQpf4kLynFHbNwttgTb6NoiaVopTko/FFcx/7If4v0Rkm71T5pvXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6047
X-OriginatorOrg: citrix.com

On Thu, Mar 04, 2021 at 05:13:15PM +0000, Ian Jackson wrote:
> Roger Pau Monné writes ("Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed rdmsr behavior"):
> > On Thu, Mar 04, 2021 at 03:20:34PM +0000, Ian Jackson wrote:
> > > The guest could be stopped with xl shutdown and then recrated with xl
> > > create, from the config file.  I don't think we want to break that use
> > > case here either.
> > 
> > So my original approach was to actually risk breaking creation from
> > config file and require the user to set the rdmsr_relaxed option, and
> > report the problem upstream. I think ideally we would like to get to a
> > point where we could drop the rdmsr_relaxed option, but maybe that's
> > too optimistic.
> 
> Isn't there some way we can move in this direction without the first
> thing that users experience being their guests not being able to be
> created ?
> 
> Maybe we could print a warning on the console or something ?

I (sadly) fear unless you get a guest crash no-one will ever look at
the logs and notice those messages.

> > We have done quite a lot of testing of this new policy, but obviously
> > it's not possible to test all possible guest OSes. Forcing the new
> > policy by default might be too risky, so indeed falling back to
> > enabling this by default could be the only solution.
> > 
> > The main downside of enabling by default is that then we have to
> > resign to always having this kind of quirky behavior for MSR
> > accesses as the default.
> 
> What would stop us changing the default later, when we had a better
> idea of the set of RDMSRs that need to be special-cased ?

We could. From the Citrix side I'm afraid there's not much more
testing that we can do however. We tested the new policy against all
possible guests known by XenRT, but obviously that's not every
possible OS.

One option we could go for is making this behavior depend on Kconfig:
enable strict MSR policy for debug builds and fallback to the
'relaxed' one for non-debug builds. That might get us some more data,
but again I fear most people out there will run non-debug builds
anyway.

Thanks, Roger.

