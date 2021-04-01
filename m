Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3F43511AD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104209.199035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtQp-0001SC-Bk; Thu, 01 Apr 2021 09:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104209.199035; Thu, 01 Apr 2021 09:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtQp-0001Rn-8A; Thu, 01 Apr 2021 09:16:03 +0000
Received: by outflank-mailman (input) for mailman id 104209;
 Thu, 01 Apr 2021 09:16:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m73y=I6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRtQn-0001Rg-Ud
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:16:01 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 343f3375-e764-4e0b-8be3-543d6c93c60e;
 Thu, 01 Apr 2021 09:16:01 +0000 (UTC)
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
X-Inumbo-ID: 343f3375-e764-4e0b-8be3-543d6c93c60e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617268560;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VBigh4Jjc9bf+9Suh37vdMLsfns5kgMGZiGdO285b38=;
  b=XeQSH/G03LuwrZZL5hy//FBDrPtxAAD0zofIfGDbZbIIPsGtcC5nfMHW
   v3t/YMWLehaMrXU8HYiwPARo+Op3KHu5izIh2dP0O2HKqnLxvkRTukueP
   1GMh/NCBtQuvDF3B8bLE0OcWn1SdAQ9dZq0vKR54rphei0fn1DzGT59TB
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gzGQLHkO/6MaMEO8/Rl5ZRpIcQEyiGWPyUJDMgC7Wwomf7pk4e6+Tap+bQ1JKFU/YoOGacdU3o
 gR4tZqPonMXeMdnSw0rvA01S2Yw/MXBoyguVAFuwsxhAM/NBcvuEoV7jWllKr+whNKKGU189UZ
 KeJaQI5hACPqAPdJmXHOJIXsNxXp2M4oXj/Yi7izNhYjkiUV16xLwqJTn4T8zrKZDgXyCZS/Gp
 gCalMzbiGhLNCtPT0veTFq/vnQZLLVUyejPkcrivAw4pqk+r1vlJ768evqjON/tzyeECoLU7Ml
 YgU=
X-SBRS: 5.2
X-MesageID: 40668093
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SgtE7K7A+HWNx6rT2QPXwRKBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3Xa6JJz/M0tLa6vNTOW3VeAAaNDyc/ZwzPmEzDj7eI178
 1dWoV3FdGYNzdHpOng5g3QKbgd6f2m1IztuuvE1XdqSmhRGsNdxiN0EBySHEEzZCQuP/oEPa
 GR7MZGuDasEE5/BqiGL0IIQvTZoJnznI/mCCRsOzcc9AKMgTm0gYSKcCSw4xF2aVJy6IZny0
 fpuUjT5qKvs/a0oyWsrVP73tBtt/bKjvdGDMyIoMAJJjvrkRbAXvUdZ5Sy+AobjcvqxFE2kM
 TdgxpIBbUO11rhOlubjDGo+w783C0g43XvoGXo/kfLkIjCax8RT+9i7LgpFifx2g4bk/xXlJ
 9v5Sa/saFaCBvR9R6Nn+TgZlVRuWef5UY5nfV7tQ05baIuLIV/gKY4501vHJIJDEvBmfsaOd
 grNs3a6fpMGGnqCUzxjy1qyNyoaHw5Ag2LdEgEotCUyDhbhhlCvjIl+PA=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40668093"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLq87aEgwqtFtwpITzKBXImTeWcY2bUUeiyK8yhkh58g41RckDHo9XpE4bgJGOLH5Ha8psecVMlnTUbOzAy2rsLbk1Iv0fZ8K1rx93MkqEnaX3KJMct9wnxrxW4hm4jJjF3u/tB8Izgn14XPUxvvOranWs9GZUmQ52+OkmNzW4NAr3Ifbvw/n0SjL+e+UyR9mU5iEVFccxYL5jX6oE6T6VC7fDAa5gcicjO545EwyurIhjbc5TpH069i3YGc7p+YPOWTA3K/HluyfdSkO1yqCe1N/0fTSJISkfYwYnLUQXsG38M66Mk95u/AR3zspSMfuDkmxc5bD8cNWQxAaR7Hbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+bvJqg/PbAj/zaIBp4Zsin11W4wJLOT6sVFvy9DVdI=;
 b=hHWq4I8ziMggBgY31mVBw+CMVxsvV8xQ8IMm5d3XsQQeEhnqznpSZQ+vZdMlCsEgTCiVjjiRiRlOyPNgwX4+RJYEaD+IuViwOLlGxwWZIN1QWJmH9BLCIr/zfJcgSMj/Im4W6WNIkAQC6ztgxJ1RBi2gpuQtw+vVsnArVUZmg0l6R2JWZAMGdk7drWvlrCsXP8eRapsejR6tKOOz67QSp16/6SZ+JHapiY4MrC/GEcDuoHE+0VIs+S4jiNzufNCTDurHTivhN2F1vqaemKbCoP+wmfzljU94L4TvWWJzFtQ0B47Gd96R/TeJFmt4RGkg2QjqB+1eXndWgl4zvm7c/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+bvJqg/PbAj/zaIBp4Zsin11W4wJLOT6sVFvy9DVdI=;
 b=q63sK+Y+Dv3sE98B2wdoWoYLtCnM/1/VIXnTyWmxwon+n6+FS7/MzFct9i3V1YVlFSivwSvejZTcziHeJEim/5mG0SWTvbVg5XQfGRVGcjpeDRV46rW9d7+mzZ72w9JQh4bu4Z+0L0sXU8YmDMD712qj8MvKn5k0aLDMaZDWYV0=
Date: Thu, 1 Apr 2021 11:15:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Paul
 Durrant" <paul@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 02/11] x86/hvm: drop domain parameter from
 vioapic/vpic EOI callbacks
Message-ID: <YGWPSF+zDWc4+slD@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-3-roger.pau@citrix.com>
 <b9a244b9-834d-4e41-3e39-504277b0c916@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9a244b9-834d-4e41-3e39-504277b0c916@suse.com>
X-ClientProxiedBy: MR2P264CA0032.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::20)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9adb56d8-3bc8-42c7-2ac7-08d8f4eec273
X-MS-TrafficTypeDiagnostic: DM4PR03MB5965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59650DFF96AD89BDE924593E8F7B9@DM4PR03MB5965.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4M66Opk2kC2KPa1R2GK3bQku/tAgD7h7qpGfwW0SOc2P9Fb2FlMAohYfC+viOxPw/RNx2kqyUSB5qjZxqwPIwDeB7Z0KjeEmB/8PFReyRz/xi+9wmua+KjagVC61EcYnpqxH5OUuBEThn7CuYXoTfLKF0JYxUjVP7thAEn2zJgNCWBT3g+qtaPltdQIXK8DAExzur1yWspB/9v8EJ6wLVWNXoIhAUB10fgBXXvEZdJqfn4uXRlS+DkIAWmZMmtPYu8cr08jrj4vtJDh/Xo6Epw9fRUOqYYL6nstS0U+cURnGB0baZ9SVFFCYziL7hDvOLO8IT5V9ctKh2U/wsCQ/gJt/Eedz6AaH2oGDuUXo+AiQNpamEouiaNy1TwA8qwLFGIsPzwKG1VReHWhXNWtT/3NJCIuaq45SbnucZCuVARqhM4VPfJX7TcbgeCc73Zy5ztrgJ2KGa+MULS8rsUz9bwdPzICshx5G4BFXuCq5oZusXk8uaIfkWxKoFSmOArIAf6NRSuGYaX7Wock+96nZvRY4enVkLLvC3aSuozaExExS9yKC7cnVEQ7LC0TwwEq0lgAsib228jiFyjXsu5GvR4H9KFrRpicofAZQVUVIKNP3sWVxl2Onj9rbbtdw9/dmuXip6xbAfsmBaMn+GqHxze0P+MCKoYH9l1TMseUkoGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(136003)(376002)(39850400004)(366004)(38100700001)(26005)(4744005)(86362001)(16526019)(316002)(186003)(8676002)(4326008)(85182001)(6666004)(6916009)(5660300002)(6486002)(66946007)(83380400001)(2906002)(54906003)(6496006)(8936002)(956004)(33716001)(9686003)(66556008)(66476007)(478600001)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VENWLzU3SW11K1RiaG03NzBObm9aM0NsUVkvd1cwSVFmWm5nUmZ5S3Z4VjNJ?=
 =?utf-8?B?VUFibGRBNWxhOXNsdW1oa0IzMmcwTm9nZERRZ3V1d3FOWkZod2d5ai9Xc0Uv?=
 =?utf-8?B?MVYxYnBRNnkySVQyKzJJM2pLSlRUVloxTzRxUW5LTlljK21pV0ZwMi9RS1I1?=
 =?utf-8?B?UEExTjJ0NjZNREQ4V0d6OVhhYnJLQm1HS1JmMWU2WTZ6STBmSlR1MlNvN0Zt?=
 =?utf-8?B?aTNjaWJzSUtkc0plUE9EVWpZNkNIZFo3Qyt4eFdHSVJEcnEyeFJyQ0JIbU05?=
 =?utf-8?B?ODNZTncraXlFNFBWTElXNWIvbHk4cXdBQnAxQXloajJycHF4MEgrazVOcmxW?=
 =?utf-8?B?cUtUclg4M01rckhIbXY4UnJoMWJjNS9ZNXNDZ2xzWkg5aWwyU0xEZ2dLelp3?=
 =?utf-8?B?MUtwTytwQ2p6dC9KRDZvQnROL3M4VnhZTkVtVEozM0w0OTNOS1ZTV1Zya1gz?=
 =?utf-8?B?aHdLQk5tc0Z3c3hSbTVaYi9INUxmaVFkd2h0WWdycVU5OEdCcmJqbVpsSmNK?=
 =?utf-8?B?VE9lS3RCemMyWnozcklQMEFtQ0ZraFhleEdkOCtYYUgwM1BzV2NVVWxmUFQ1?=
 =?utf-8?B?ZGh6SHZ0TkZHV0xsTkN2ZW85eDFPK2ppV2NTNzcvVkhCQ0ZncGUwdVkyaTlt?=
 =?utf-8?B?akNXOUFyRUdQOW4zbFQxc0F1VWNvSHl3L2p1Q2JmeFpDbmxIcHdQUmRDTHRa?=
 =?utf-8?B?d3UwaFN0b054OXdHVlprQmVkR3NuYmRkTWVWbGVKeVhPdTZRZU11RmxPT0F4?=
 =?utf-8?B?R0VHdTU3V2MyaUc2M2k0RUEyaFV3M3k0WVpuNko1LzZHc0Z6ZW9pQ25YRlZv?=
 =?utf-8?B?SnpOdXZvR0JldXVRQURRZmtFRmxEaUN3RFYvMUF1dWdaR0ZubGliUitXcC9H?=
 =?utf-8?B?SDl2VmpQUjlFVnI4OWFtanlwVWhjZVBCS2Fha0RDTWM3ZlVvYkxBYnVJRUJR?=
 =?utf-8?B?REx3SFVKVzQ1c216eFFQbERCZjBRZktZenVRL1V6bW00M3FIcmN0Z044djdI?=
 =?utf-8?B?VFZMTElTMUlicUVZR0p3M1I1dHNlZTdXMnNmN0FiQ3BQa0RIWmlZUDRoenY3?=
 =?utf-8?B?QXlWeCtTWFJ2TkJFWEVqK0xMdm1ESUZRc1RkSlJTVlNFeXJ3czZJUEpYMEYr?=
 =?utf-8?B?cUdHVnRhSGxYMzdUT2FLMWFqQUhVREFQL1kzc2RzUEtDOElhUGJXYXg4ZEJh?=
 =?utf-8?B?dTh0Z09YMGVXTzh4eDhub29VRmVQR1NNUUdFRG5nOXJYOStqbHVjTUZTSTlB?=
 =?utf-8?B?UGdjb1A0eDNsOUF1UlRydGsrS3FaM0dIZ01EeTZIb2hzZ2NyT0MrTlB6aWV2?=
 =?utf-8?B?WXhpclM0M0J3SXp2aDlHcW4vVXdXR1U5OEpXYXNPM1NsVzFkbThOemhycnE0?=
 =?utf-8?B?TmNDR1A2UW1pc3Y1a0Q2Z0F0ZzdmN1lYSitXbUZ0TzZZWEN1SVV1K0xxQUdy?=
 =?utf-8?B?MHBQM2dWcUJMclJod2R0UnhsTWttK2dpdEJjVExlcWJiK3A5WXAxOTJZTHU3?=
 =?utf-8?B?UWVEZG94VjBSekhVSngvQWhyaG96bDI1ZndRN2NDbGg4REVIeGRxaTNrb2dV?=
 =?utf-8?B?ajBMejF6NTQ0ek1VZDVGY0dKRDUxVG13SnRLck9ibnhKd3VZa0wyNnZuM0lh?=
 =?utf-8?B?aHRlQWZhZVpmdkFZalBJZURPNDZaVVlFRklvQjlxY1pvcUhXem9CNGgrQVdr?=
 =?utf-8?B?RE5SRjlmYzdza3lYM1NzeVIxM0VKYi9qT2V3cTNJb0NneE83OEJNTk9uTENZ?=
 =?utf-8?B?TUx5V3NPcFcwMkhEUkpwbUkydXJaV2RMdVNjMTlyd3NVSFpNVDZFcERJaFln?=
 =?utf-8?B?MmZmK3NsSXVhUzBPNk12dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9adb56d8-3bc8-42c7-2ac7-08d8f4eec273
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 09:15:57.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6tFQVcA42ecJy4ojDI9lpPRYWh/gDQPj1ZMVjGrZEMwd3AmVTMb+9RAIFH1NoLIQGO6lhWcI17GvR1am+HXmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5965
X-OriginatorOrg: citrix.com

On Wed, Mar 31, 2021 at 06:04:43PM +0200, Jan Beulich wrote:
> On 31.03.2021 12:32, Roger Pau Monne wrote:
> > EOIs are always executed in guest vCPU context, so there's no reason to
> > pass a domain parameter around as can be fetched from current->domain.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Reviewed-by: Paul Durrant <paul@xen.org>
> > ---
> > Changes since v1:
> >  - New in this version.
> 
> Just to make it explicit - possibly same thing as with patch 1,
> depending on how exactly the issue there gets taken care of.

I don't think we have any scenario ATM where we allow EOI'ing of
interrupts from a different vCPU context, neither I can see us
allowing such in the future, but I don't want this discussion to block
the series, hence I'm going to drop this patch together with patch 1.

Roger.

