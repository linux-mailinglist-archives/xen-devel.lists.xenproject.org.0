Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82B306597
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 22:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76446.137973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4ryd-00050F-2p; Wed, 27 Jan 2021 21:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76446.137973; Wed, 27 Jan 2021 21:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4ryc-0004zs-VL; Wed, 27 Jan 2021 21:03:46 +0000
Received: by outflank-mailman (input) for mailman id 76446;
 Wed, 27 Jan 2021 21:03:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csCD=G6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4ryb-0004zn-2F
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 21:03:45 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4a5e9e3-529d-4974-a2fa-ec51f6807f35;
 Wed, 27 Jan 2021 21:03:42 +0000 (UTC)
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
X-Inumbo-ID: f4a5e9e3-529d-4974-a2fa-ec51f6807f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611781422;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EO+ncs1b/29wksAt3Mc4yey/rJNDjSMIQ6oJaKdYeg0=;
  b=cmwfqIEGor6MzMlnDlwiNf5U8fHvSvXWkFLdlOU/dRbECOc4rRbGlX0F
   wZ3h49syxzAz3lr91m6dGJTREhL8kdYawstAYe+0KhZZhqt2jb2/HEA4b
   Xu3bdoSvVh1FJzuzbJLZwF5n6Or0+R48bVtgp8wJ3plYmH0nTV2gcmPBw
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fThbi1ueMItbPmtwREbZU61VP5ZXe6wFg0fhVhpakZxpL16Zr3SEgGZcGSH3uUFWK63hoQ/0cz
 +GhnWeGV7iZz0knI3Mqj7weVQZO4mznrJMdts/geUBGW92lvcaAjMF+v6T5QHiIweRDe1z3Ti6
 pDgaMw8KD9Z/41VeRC87vK7fRP//sG37u789xPGgVjtzX4vTah7R6X8mTBCMF75UEN/dFtW2+D
 bGVa/3Uyn86uQIvo6uq5lUAId2wCREAjQaujOVh7bWZB8WA8CXNTjiu1K5RM2aUuL34kFTziaV
 7II=
X-SBRS: 5.2
X-MesageID: 37322557
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,380,1602561600"; 
   d="scan'208";a="37322557"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYo9yflS3HuxDBMc+SVvSMAnamRSe1SfPb3HSPEQ+hEomgaXVPCMGXUAwWujOGUc2wlJNqIdY/F3Fp3/oo6aGIsRgEUC2uVZ5Km4YVlLxrSbJ2f+PqipF8G7bRJLXiVuYV2/UvRK8gPFkIh+RSk3xzwQToJ9wyviR5Zyt4ELOoK7ySo2O2eBE1cI9xbLp6WNG0nmyPIMEsM1SrAgeSvvtPHGtK08nyiMkxUFaNCtDGqV3tPdWcO2G3Qs7b4fOvst0x5Ii7njS/D+ThKUTiuyEwmevsRqqHM4OkUg5iSqt/1HQ0Q7L6CKrGY5rGaKQeXW9XCOUiVyyf5doqDywaZjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXPkibSwvdFbVXNUaBojr3iXThvOZST2QqvnvfDLlPE=;
 b=C0anVPlv+GuWCjTpzenIBkXD/yOaDciPQDw9Ta5NMl02Ua38PXH9pvvi5vlc0kjhkqIlJNvAmjBZEqu+3sY8rIC510j5r8KxJOYknLOAV1q9PR4DEiAmcJyNbNsCo9nHbeaVBaA3+MZyJBWdYhMk4IUw/eGgsXqZNrZuQNwykHkjdJlC/4PCD4n4iEsTD/s1bD1jA2+JRLtfHyS06186hdHy9JkQ5X/cdAMoqxyHt/rK7G2soWZOGlaSiFlDQ6+AIuUywgCaW7P6mIjitBH2qL5vrH/GXqXqrDhfCxYhDgBAz+hFxQofsTg4YhN2yXzhgstxZd+/Gon6kiAWs4iggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXPkibSwvdFbVXNUaBojr3iXThvOZST2QqvnvfDLlPE=;
 b=lHNY625Gc9tFQmyrSExdaLJxJtnMKXRrqzG+M/ohRWurVp20KwaUvscE8vY8mmnMmSEN/PIqZ2iD7nvpLee1a/n8okG+mwhFp8C9OXs3MULKpN+GeTuZ4Kudj1T6SKDlRu4+ARvNG0H2Vy9DcKJzrxxt2Fhx+KvIWfjnCSma2g0=
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
To: Elliott Mitchell <ehem+xen@m5p.com>, Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 Monn?? <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <202101242308.10ON8Umj004866@m5p.com>
 <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
 <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
 <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
 <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
 <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
Date: Wed, 27 Jan 2021 21:03:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::22) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae9baab3-83b6-49ad-89c6-08d8c3070572
X-MS-TrafficTypeDiagnostic: BYAPR03MB4902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4902AD6F8C0A2D74DBB80F98BABB9@BYAPR03MB4902.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: avIJLPb9WZX0586b1fj4Xgbff6vftWypJfqQL4j54pM5UYgD5rtLIofXoN5PSVN2cs3JvgNh0WoOyXarJ8W8x/9v3sPJsttIa8KS6sssmtc0sbprKVW5RZixKgyMSpfa4mcAyE7J65NT+sBTHRyWe73xGU2/sBK8KfMowcOyJyV4N2J/wVg1bftTNFPjIbJauZgDTLP96QCyUOiu2P73blpJaGko76LGSNMMSybK/0Pv1eQUJ8YtEIRRqtTxYswqVVtEKTn9YSwpnpl5E4q3t+Y7EwZNSQ18lsZPLSZ/LGul3PImyiUGmP6pDTAo9R/AoZBvweaHEFd4aT7cqAIIu/Rpl/Tjg1ubFpwUynqYQIc5pHfPpUrCylc7dQ8TwgL2ksXkCkr0G6GuvqKZwPCT9gckr1ES0M0c7AXSF+i+XOMLJ94j6oxtyhx81I8ytFBoAjAShKJDx/Y449Yjq4QIB4n5zILw9majW4DuELzGh9UeAlxtnp7Js9tk5CguaN6giSTstzm+qxDBj7Izwy2SDepEQHp2JxNVSTGCR4gvOxUAgOk/ilPA6Mw7AXteov3lCDxE5cTpvgdnSlnmNpomB8OB3ocV5d8m/R4VA0SYSBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(478600001)(8676002)(31686004)(956004)(6486002)(53546011)(2906002)(36756003)(26005)(2616005)(16526019)(6666004)(86362001)(31696002)(66946007)(66476007)(83380400001)(16576012)(316002)(8936002)(54906003)(110136005)(186003)(66556008)(4326008)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVV2S004UWRkZzFDdHFWZWVSWXhIeGZRdjR2RXFleFV1S0E5M3QvL1RpYkkw?=
 =?utf-8?B?aW5RVk1oQU1QK1hRaDJ5MGdxQmdMdmJKek1Cd3R0TThtR0FxY3lYRGx2VVp6?=
 =?utf-8?B?S25OaWdoYTJ2dElpSnEvOGhEZXU5Z1ZDZ2FFYmwzbWNLMExMZVdxdk9zQ0U2?=
 =?utf-8?B?QjV3dElZOFJoWDJiVC9scVA0M1NIWE8yK0hWcUNGVHl1S1RrZzlSM3lETDF6?=
 =?utf-8?B?S201cjlGdndpWGlVbk5jUHJYRFVxeTBqWUk5UE5MbU00b0VROFZrZldGbDI1?=
 =?utf-8?B?Nng4K1YxU3FvKzMxejlYM3p3aDhrRW5jNHJLQk9xUU1ldHNWQWNJL3VFWVhB?=
 =?utf-8?B?YlBYcXFxNEFWckljUGhFM2F4WWxVT2UwM0d2bHNHYWpIdlpuaTlrY0lQU01C?=
 =?utf-8?B?ek8rd0pNOHl4WEp1c1J3OWJQZ3NlVmZNWU44VUNiNCtMUWJsT0VONzNHejFu?=
 =?utf-8?B?YWNWTXVCa3JydjJ1Qjd0eFJ2WnRSdjYreG83eTd2NU1LV1QxdGg5dnlWNjNK?=
 =?utf-8?B?TmpRUnVRY1BSbDdwaGthNUVrSzFVcmFWb3VCVkVaWjRVWFJocHlJTE9yZFZD?=
 =?utf-8?B?KzFRbmRNM1JmV015R3VBZ1RTdmRYbjNwQ2RPQVdUalhrdFRHenp4TVlqczdo?=
 =?utf-8?B?Ykk3aFBsT1gzMWp3QTh3b3c0RWRXWGFPSmJsd2psOFVIcXIza09SdTRKTjJs?=
 =?utf-8?B?bUZydnRjQ05pWlZuODVKYjk2Q2NtZmw1QkdZSEpmUXlwejZ6MXcvdTRHM3ll?=
 =?utf-8?B?Q2MwWm5aK0N3L2N2K1hlRElLSjRPZC9uTkkwMzJ5ZDhvNEtTZlhJMFJnOEFm?=
 =?utf-8?B?S0hYUTBiSUVORlM2SmlKTTJTOWJCWnYwK01YZEFyZWFKUW4xUHZ1NnE5bjRQ?=
 =?utf-8?B?SFJOdUFGTUZQaENXemJ6dUJZNXlsbmxseGJENTNwbElJdHY2dmRycngyTlZx?=
 =?utf-8?B?K0o1dDRQWXFOalFXbkk1NmV3WklXeStTUTlnOTBlZzlua3d2V3NwVGcydHJp?=
 =?utf-8?B?WjJoQ1NybERKOURUY1NpUW5FZW9vdlBSTXJtUUJ5RnZJbEdlaStpampuZjNU?=
 =?utf-8?B?cS9PR1FyN2tONGVmUmkwYWppRVJSazUzZWdzdjhvWGU2VkxUTlM4ZFBWdGJa?=
 =?utf-8?B?TlhJRWtmTVJoTzM0THM4TWZYQm9adC9OKzNUNy9hcTlnS3djL21QTFJyamRF?=
 =?utf-8?B?aFdzYW5CbkFiM05YbWJjTHhYV0tBdXdkcTQybUpoaWdNaWgxN0tRYTNYVWpk?=
 =?utf-8?B?WHZVWVpxWHJMN1ZTZ3VSYmtlNENUZUdpK0tMVTJLNzdMTHJCU240Z3I4QkMz?=
 =?utf-8?B?YnNUbUx3aGhDN0pnQ0djQVBGNW1YQ1RESnN1WEFNYXh2NHNBcHNnUnZMV1Qr?=
 =?utf-8?B?Y0kxeHdCZ3hnTWJ4anZIelcrR2xTREtpeVVhMkJxeEkyMURQZTVLVDVtckNY?=
 =?utf-8?B?eFc2b1E5aEdrcmJxUmJmZldpQklJZlNaRlhRZ1BBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9baab3-83b6-49ad-89c6-08d8c3070572
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 21:03:39.7674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2Mdz911RxEwlR5QKdeogtke/aHH8nDyvw0Bx2x963McsV8gahl/x1SeDAOG0M0bpq17cwGfe/n5TZRdBC+1KAbkhY17L45BL98SSq3rdHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4902
X-OriginatorOrg: citrix.com

On 27/01/2021 20:12, Elliott Mitchell wrote:
> On Wed, Jan 27, 2021 at 10:47:19AM +0100, Jan Beulich wrote:
>> On 26.01.2021 18:51, Elliott Mitchell wrote:
>>> Okay, this has been reliably reproducing for a while.  I had originally
>>> thought it was a problem of HVM plus memory != maxmem, but the
>>> non-immediate restart disagrees with that assessment.
>> I guess it's not really clear what you mean with this, but anyway:
>> The important aspect here that I'm concerned about is what the
>> manifestations of the issue are. I'm still hoping that you would
>> provide such information, so we can then start thinking about how
>> to solve these. If, of course, there is anything worse than the
>> expected effects which use of PoD can have on the guest itself.
> Manifestation is domain 0 and/or Xen panic a few seconds after the
> domain.cfg file is loaded via `xl`.  Everything on the host is lost and
> the host restarts.  Any VMs which were present are lost and need to
> restart, similar to power loss without UPS.
>
> Upon pressing return for `xl create domain.cfg` there is a short period
> of apparently normal behavior in domain 0.  After this there is a short
> period of very laggy behavior in domain 0.  Finally domain 0 goes
> unresponsive and so far by the time I've gotten to the host's console it
> has already started to reboot.
>
> The periods of apparently normal and laggy behavior are perhaps 5-10
> seconds each.
>
> The configurations I've reproduced with have had maxmem substantially
> larger than the total host memory (this is intended as a prototype of a
> future larger VM).  The first recorded observation of this was with
> Debian's build of Xen 4.8, though I recall running into it with Xen 4.4
> too.
>
> Part of the problem might also be attributeable to QEMU touching all
> memory on start (thus causing PoD to try to populate *all* memory) or
> OVMF.

So.  What *should* happen is that if QEMU/OVMF dirties more memory than
exists in the PoD cache, the domain gets terminated.

Irrespective, Xen/dom0 dying isn't an expected consequence of any normal
action like this.

Do you have a serial log of the crash?  If not, can you set up a crash
kernel environment to capture the logs, or alternatively reproduce the
issue on a different box which does have serial?

Whatever the underlying bug is, avoiding 2M degrading to 4K allocations
isn't a real fix, and is at best, sidestepping the problem.

~Andrew

