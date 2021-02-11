Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8699318620
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 09:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83778.156731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA75K-00072a-R7; Thu, 11 Feb 2021 08:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83778.156731; Thu, 11 Feb 2021 08:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA75K-00072B-NZ; Thu, 11 Feb 2021 08:12:22 +0000
Received: by outflank-mailman (input) for mailman id 83778;
 Thu, 11 Feb 2021 08:12:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szQa=HN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lA75J-000726-Lm
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 08:12:21 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18c7dd5b-3b01-4acf-893a-4a84d7b85138;
 Thu, 11 Feb 2021 08:12:18 +0000 (UTC)
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
X-Inumbo-ID: 18c7dd5b-3b01-4acf-893a-4a84d7b85138
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613031138;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dG6JCylEl2/Tfujvrf43gaV2OOWFnRLuvhhOujU7IGs=;
  b=QZ19+isf1lyMZJMpKupWctg90vDbFMzXAacCpgLrRVee9Nxk2NYYDlLj
   wtzwaJniVVDiIlS8k7/fr7TCOn/mq8llACLnN7kHRTSJmGEjzoeUFsiic
   nZgsgMCAhM0u1uQT9HjN4s27XL5Up/EvTOcbFgUhug+/iepA2zph+Kg4v
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3UxdGt+y4JLdadUcNkU0CGFwvJbRq+Ip3M016hc/n1yN/6xuFqiqLJX8feCTEbBguwkj9rIJjX
 KHzfvmV67XpTXBKTQhsSV30UbCrjeJNEm9nyirdd1/BaIIUKZf+6J257nbLv4uWUqcGuahPPR6
 YXSn2QSnqtqx+ieg4SUrWdjhsqn9kryYWm8yXp0xH+GGTF85P1Ak3gdhJJ/WfMAQdVqj46edqI
 K3woKKwq/FM+9Yuz2EiYIVe6HKFGFJpg+9o38pOue4Z7TN+VKKI4kRnQV0rxfGgHXo78iMjCtH
 SVE=
X-SBRS: 5.2
X-MesageID: 37049007
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,169,1610427600"; 
   d="scan'208";a="37049007"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgvqKG5du2WYh0m77pL+u8C1Z2gmdEZ0CjMLl3FT2X0tUqDPeTMkNbc6g8IY7Tekd9yRvPH3HbULycyWQJfWHfYMsSFTsOCH4NzBtcXv5+bJpwETQwdkhwT3UrX4qKxGPgD6q4W3dRL9U+K9FN2JFlnppAXAkZ5Mb5elpjAGKuTyQYjeWuEbEHTEO4Mgdn4EEpTrSqRWTakDVGYqAy2vNR8dUmVpKCcVbreNawFavTkHsPGhsW1T4VeTIa3TTo/LSMLFrwkUCKcgtmJ1+2aN+tWnrEyh4NKt1fvcOM99/YvyA0GEQ9GsKUxlLV0u1rHh2KGqdV0ujug3Jjfd14BXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojR4zD6caGLc48AS2kVww9sTzC7GHI0szU8/ekSZn2A=;
 b=ccAiU1uX6zdeADLOIpJLeyjVjdR2338Pv9bwxN+UwzI709hUkSSvjqJ6/vjNuotnQ6mpoXimmBHu7RyeAUcdX6U/bUIlpVyid/U++SDcGu5faAXR6vINnmjp/A5HOJA9RHlV9OAyGOqAfw2Gh0w2Oyk3pVCVFHoUxQOBvmRgzTKO9ckp4VQYRGTJxHriZAhY/Hs7AHsW9IuZCKvv6/StqPtGXoW7QDSv7kV515JOEoO8GGv712oRNG/i9sxIKKJFtAOpqMZKIhFtloPE2bM8UUUM3Qn/pz1p0KodksP/RFtj6QJC+RuAzvLJoU91KGs1TzvXsMIqs7zqL56ItsGuRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojR4zD6caGLc48AS2kVww9sTzC7GHI0szU8/ekSZn2A=;
 b=qPUVnuxju1k1a9uYtgapFzS3yxRImSJYzSeS+65mVXaKLUnl5I/+vWPpHv8JP8u5O8dzf1SXlMqPyR838gHHjzC6ts/HHP2NriVmN9XKTOKvHrTFyTnml92szvckjsctNtN7G+6EIu8GRuO5HULW3m9d+wkHGNzce9mnbeLmxRU=
Date: Thu, 11 Feb 2021 09:11:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 04/17] x86/PV: harden guest memory accesses against
 speculative abuse
Message-ID: <YCTmzRcZw9JUJkxw@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <5da0c123-3b90-97e8-e1e5-10286be38ce7@suse.com>
 <YCK3sH/4EVLzRfZ3@Air-de-Roger>
 <d3b62090-fdb5-068b-93ab-63f8bebc9d2e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3b62090-fdb5-068b-93ab-63f8bebc9d2e@suse.com>
X-ClientProxiedBy: MR2P264CA0173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::12)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a921c9a8-42d1-461e-d903-08d8ce64bd43
X-MS-TrafficTypeDiagnostic: DM5PR03MB3369:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3369D1C72771DB44150F877E8F8C9@DM5PR03MB3369.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W3x+/qARg+Gr14I65juVDQBz2Rtp/1bAVC2eDVUc59CdlfydKTClsJTWG6hf28b66wVSXn5+8vM0MKckCV1/b1m58ppft7+ONQGZpXX2PAbM3rbzq9lJGBBcC8FPnA0aZZtQwcwxIzICdLb2GkU39anvUD3PABHR0uZC97QZ+IkgEdR5pJlsMvIcOm7OW+3oMsDUveXFd6J9C0rrU6epIyiVDcvmY9tHoWrW6GO0//6tGh/wgD9MTNfkOMb5qtBZBFzbVWhZ+9ESJjyTUI6dyJGc0WC0shv6QshCCZFtmpcQzwx7aFz4bHLcVs0e9pEmJIeFuXyFKhlDzPhUGEUtZED+rAWDiN7X+AOtHYqriqhzehvSseOtFb+A6eo1FEQjB3vrHZQ+vwbZcFP0pLAXRIp28qFcAEPMzRufaqgbOj6Ihd62IvS2sEMJztd5U4un/S/Br9kR7qkal+X0xnxmH9AO+b8FX2xX35YAyNQWKp185yNPmelc/+KzE5MtFXpYzmhw4+BzUVE1GFSho1VU8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(366004)(376002)(136003)(396003)(5660300002)(316002)(9686003)(478600001)(85182001)(83380400001)(6916009)(6486002)(53546011)(186003)(956004)(86362001)(6666004)(8936002)(16526019)(26005)(6496006)(54906003)(4326008)(66556008)(66946007)(33716001)(107886003)(66476007)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEVqQjdNQmVoTXBVdjc5WHoxam5UL2tuTktHdzgvUG8vVjhFK0xFVHh2QlNm?=
 =?utf-8?B?YXNxK3pGWEtQS1B0Y2c4L3c4bUFGNnRSVDlhc0hhK1lSMWNvWmpXNCtKaXg0?=
 =?utf-8?B?YVFHcTFmdnpxTlNQRkZXaVpsWGIzYVNldlovQWlDVjlKOEM3eTBkY2JjZVZT?=
 =?utf-8?B?aldQYzVIaDNaTDVyOWcvZ0JpNVozckJSc3k1eDNHRyt5K3kvM3o1MGhtRTJw?=
 =?utf-8?B?RXBZNFBaUWkrcUx4UUd4M1pLdDJpaGJTd1RoWG9XZ0d6MzR2eUo1ZDdLOTdr?=
 =?utf-8?B?M3EvVk9iTlozUWhEc01sU2NIUG5MWlBDeDJBVDR3UmhXRzU1TEVrYWhYWTZj?=
 =?utf-8?B?L2lPT0JZZi82VjJ0emZ5UGxFTFp6RXB6MS9HY2lsVnhZT3VUYXcvSHpaSENh?=
 =?utf-8?B?QVJmT2dtNldUcHdIYXJCYWIrZGkzVjBPcFhKbkdCc2MxeGNnS2FGRTBmUHVJ?=
 =?utf-8?B?Z2xDbXpkMUtTdWt1RWJtYmIwbE1QY2loRUtSN0lEWnViaGUzN0RvWGtITGR6?=
 =?utf-8?B?ZnFaVkptWGFVYWhZS2p5aE52a2hhYVE5WEdKMzVIbktnVWtsQWdCcFpzR2hP?=
 =?utf-8?B?dVdkcENjdmY4dGpDNjRFWlp5bmk3R0xueE5RbFpIb1FtNWF5RGFPTDBPZDFQ?=
 =?utf-8?B?Tmt2UUZ6SGUvVnAvd1YwMkNvaGY0ZHdYemVna3U4RE92SHhNWFFVRUY2Nm15?=
 =?utf-8?B?bE9yUzl4Q2xMT3pTMmVVUDN4cnZ3Zm5iTVB4aDlBK1Q0SEZXeGlscDdTMXlG?=
 =?utf-8?B?THE1U01zZGFna3Y5Um5ldkp0akd5Y2wrTEVMQVIyYXN0ckVFVyttY1dJL2V4?=
 =?utf-8?B?V1VCZFc1dmw5M2hhOHZ1MEVlcUlaYWl0elYzY0N1Mkk3b2h1RlVXVmhjUzc3?=
 =?utf-8?B?T0R5ZS9GNThHZmNUcWdDZ1lENm81dUdJVTVGd1FxTDVCdUhWc0pqcTVlczRz?=
 =?utf-8?B?TUR5T0Y0QVAwbzVsSnhQdjh6QVJldk5HRm1yZ0lkdHU5OWJJdlFtM3BGWXdx?=
 =?utf-8?B?dzVNWGlMT1BVNEtweU92WXBvRzN3UGRHeUhaRzlQS1JSZlozT2hmTndzN2hX?=
 =?utf-8?B?YmQvL2NCaXlrellWdUlqZDU4eWtIb3BxaGZNbjN3MkM1dUVLdFAvU1NCb1lh?=
 =?utf-8?B?SGo5WlZHekZTc0N2VGNGSWlWb0lhdFRSTTFuRkxqRUdXTkJKenZZemZxZFN3?=
 =?utf-8?B?dGtIYnVVWmhDMU9hYXFWTWdCOEZidVRjRTBFaDF0NXVFdlhLTk9IR2NZV0hk?=
 =?utf-8?B?OWEva0JyM09NS0IySU5aTW52Y01HS0J5ZndZbG9pL1hBLzQyL1pKNHNRRWVK?=
 =?utf-8?B?T3NZM0krQWJ5cGxROC92SE8yc0JTRUZoeXhvdFVjQnZObFdtNDF3L0s4UzlU?=
 =?utf-8?B?d1VkdkxGTC84eGVsQUFwSy9vNjh6Y1kxd2FCbXB1N2ZLbWpQRDJGTlVFdi9D?=
 =?utf-8?B?N01iNC8zb3ZxSXNpQ3laZ2dNenpVU04rQ2JnMEd5Qm1kZnorK1daMGNxbG9z?=
 =?utf-8?B?Smc4bTREVUFJTER2U3N1TklHOFg4aDI0WXdObU1jUm44WUM0bG1xZjNIbFpU?=
 =?utf-8?B?M2VPRGNrNlNxYyt5WXB4a3N0bGlOb2pxSnYxeXE5eHdPZ0VCS1dJWGYzUjVM?=
 =?utf-8?B?dldUOFRkSk5LTzRsV25NRDBHZ25rZWNyNVYvQ0ZUTnRkWTMySlhONW1ReU5h?=
 =?utf-8?B?Sm5FU0Y1Mllacm9MVXdEMWR6cXRTRjZZZ01HYllVbWY2MVloblBhdGdFMGFa?=
 =?utf-8?Q?W13nU9+AjptcfjdB4Nv8AT2pgj7+AtT4xyXy9DE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a921c9a8-42d1-461e-d903-08d8ce64bd43
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:12:14.3642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2UBkgOgT2uABDKHYskSUs0b9leQXhDIW17x1Ip/v56xcnVGb4oHt+u+7QjySZuA7t40Sc+m+CPsPEDtrej5Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3369
X-OriginatorOrg: citrix.com

On Wed, Feb 10, 2021 at 05:55:52PM +0100, Jan Beulich wrote:
> On 09.02.2021 17:26, Roger Pau Monné wrote:
> > On Thu, Jan 14, 2021 at 04:04:57PM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/usercopy.c
> >> +++ b/xen/arch/x86/usercopy.c
> >> @@ -10,12 +10,19 @@
> >>  #include <xen/sched.h>
> >>  #include <asm/uaccess.h>
> >>  
> >> -unsigned __copy_to_user_ll(void __user *to, const void *from, unsigned n)
> >> +#ifndef GUARD
> >> +# define GUARD UA_KEEP
> >> +#endif
> >> +
> >> +unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
> >>  {
> >>      unsigned dummy;
> >>  
> >>      stac();
> >>      asm volatile (
> >> +        GUARD(
> >> +        "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
> > 
> > Don't you need to also take 'n' into account here to assert that the
> > address doesn't end in hypervisor address space? Or that's fine as
> > speculation wouldn't go that far?
> 
> Like elsewhere this leverages that the hypervisor VA range starts
> immediately after the non-canonical hole. I'm unaware of
> speculation being able to cross over that hole.
> 
> > I also wonder why this needs to be done in assembly, could you check
> > the address(es) using C?
> 
> For this to be efficient (in avoiding speculation) the insn
> sequence would better not have any conditional jumps. I don't
> think the compiler can be told so.

Why not use evaluate_nospec to check the address like we do in other
places?

Thanks, Roger.

