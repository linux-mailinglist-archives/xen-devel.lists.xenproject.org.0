Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B3730BE86
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 13:46:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80537.147377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6v3I-0002VP-DY; Tue, 02 Feb 2021 12:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80537.147377; Tue, 02 Feb 2021 12:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6v3I-0002V0-Ac; Tue, 02 Feb 2021 12:45:04 +0000
Received: by outflank-mailman (input) for mailman id 80537;
 Tue, 02 Feb 2021 12:45:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKoN=HE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6v3H-0002Uv-Gd
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:45:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f6aa90b-7798-46d4-9d8a-f731c7feb2ce;
 Tue, 02 Feb 2021 12:45:01 +0000 (UTC)
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
X-Inumbo-ID: 0f6aa90b-7798-46d4-9d8a-f731c7feb2ce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612269901;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Nxglflffc7e195qgy6DACSPUl7PMna6H60+G1Cp6nLg=;
  b=biu2Q+wUYlblmwddEuj0+2kLrfNnvcGm9NKrq0N6JCEltASnQijTIu+0
   5W2hK7bOYeXy9UmvIgr99WOdoprt1F1rAjBpZvdFDnkTzdGfGC2GIUhn3
   CR+aph4Hkzhvjixo+Z9+kXrfNgR2fHc/WDdghc8nAVyND6ph9E3lxaby6
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: V+sMeBFPq8dGK9WQQMkBCjWb+VMygr24/MJrGmDl71XYS3josa5LGm8EzZOTp7EghKD2eQ+xcN
 CtYxk0kVRjzjhsYHRtouN7716BV1zvPUUDaq379e4I69NfXMTZZoWiNBtPtNqzCS6ytJS4Ohld
 Ui3heynlxGZgYfsGiLUHZaoKwVJmBta6D5D1o0Tlnawmg6lP8wcjHOTtwmg3bgYDzaIkcteHmk
 fJ7c66hq3kRqlpeF5A9e8Z595JkRGo38Cpj1xAQ/n8GR8d8coedlOz6LnpHLcY4fDuAwVPUxf8
 iCI=
X-SBRS: 5.2
X-MesageID: 36742024
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,395,1602561600"; 
   d="scan'208";a="36742024"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVvD8oORX6qyupbnz/gYZrLddHJ5MvZnHTvI1dgSFs5XJvYON7WQeSVwIquYpK1kIqP45WvKRIL/8PhNJLm0J9avuXKJ8w3DMJbo7LjqenXHT3Qqrxp44KTMalenbeheH8VB61Jad/iE5rvAr7fc6rDV/9yW1EgN6EjsIihFlLXWIaws6VqRfsfWanPot4oTaU75lNSKqv1S/0kSgj5Yas0bfJBDK1I3AkO3Wtn0pdCYbU5mYwbuLor/+SDAw/Vr4RxJ2Vk6QwHFL/hVf2FTtTZvfURqrhNU1qXIU9NstcME1WHG2P1/pMbmclTigUmDWYM1oOymyGxsLa2dEMEpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFCNrdhEgxKpnC8BCo9ZS1EsEJGW/wgh2lGPWHcanj8=;
 b=jWLFK+HU2nlY63vMc/qLiUunO1Sggkf+xfjdcPCIMUWLA9i7H7f2J3N75HZl9Uo6w6J6iSmiE8CFghVse4woeyBwycEHrAWuuNZGG1t2s4xaPCE11f0PoyJqeKkjkRVXQ1QS+/pnyMkfNzhsto1WDf3RJiz5z/ZMJ9FPih4MrO6KsUH/NdMtVCZnCkxpyIhADMqivs3IeeUDw/aq+u7iWJJMhD5SXRPy+dGrHtll+BVQsZCIZdjXmhiFpWv0O7g/5asdT5T90kmQPkABhxk8JW+gZ9j6ir8OF517hBl/V8sSsqcmZa2N9Er2w6Goxu90+NZQwDVJ0294RsM2G9wbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFCNrdhEgxKpnC8BCo9ZS1EsEJGW/wgh2lGPWHcanj8=;
 b=xl/1fg5wSKlacP50DTBxJW9O2DvEWHlj66n1gxIHLEmKD/MCfuDhadaPhlTJTeS/T6V5/5D9tNV5bKbseh3WDe+qx7ozvlRkvMCgUB8UGj8+EwagHKGIXnMJMvk+MIKnhP5608npcEDO3J7JIzBHWQLNZqTxJbqFKva2h+7mOok=
Subject: Re: [PATCH v9 00/11] acquire_resource size and external IPT
 monitoring
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Jun
 Nakajima" <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, "Tamas
 K Lengyel" <tamas@tklengyel.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
 <24601.17287.280124.602809@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <85dc5ead-f381-d9f9-3b19-bbafe9712a58@citrix.com>
Date: Tue, 2 Feb 2021 12:44:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24601.17287.280124.602809@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0458.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::13) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86454e07-7f1b-42a3-9a14-08d8c7784172
X-MS-TrafficTypeDiagnostic: BYAPR03MB4407:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB440780C1380182A0E5D7A0A4BAB59@BYAPR03MB4407.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LNgxPBLzqgw7jbLz0+hfmCWnmfmrbPsZ6eo8JYqMOUXftAZ6LeVNxzEdYbvAgf5K8kbo3C4/urP4XXDg2ZMCwKQrev2DGZP6Nkwu7y9SBsVGabNCVewsh+PzeIF/WGDelZFI2C6GJ7b0SSNcTJoYP9ByUDNd2LSED0w1eMpuno5XLP7Our7hdgh76PXxep8DpGteZ2xrPYCRiJoGF+tB94JZ7nIiiJ+6+ZAIXDGE2KWBz2wXDW6/6XLblFnJgqW/goYS2zhkVqcHLplS2sFScYyzIjbklZXJEOZdbuKyMMWA4jv3RX8L01ZSjj8Stc5zoLOukVPFvTgGWtGEbE5qynDWUrxG71MKZ/wsr66zWfhwZSbwqYgs5T+spgeuNkF+P4dzuizPifedBW/Ct9sMb69kxPcIMyJPZ30WopUsKWoQDqgTaTpdb+BxVFSZrIIhW7W5r+AIiYeCEqo1cik44H7O92v6BFONpjgxlOg4A7EXsr0n2ozVAAjR6n8iEzXNZLUd3KoiH0rcj7NrI0cxmXO77WosSd7QDDx0nr1Kmd0ExzoteteS1/rE1v2ABzJt/yUgb1VLJZ1gwMZz9s+biRF8fLO6KN4o1XwI7wimhjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(6916009)(8936002)(4326008)(5660300002)(86362001)(6666004)(2906002)(6486002)(36756003)(478600001)(8676002)(16526019)(31696002)(66946007)(956004)(53546011)(66476007)(2616005)(316002)(26005)(186003)(31686004)(54906003)(16576012)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MWVvQ2FoNXQzL2dGVWFsYnlQYzlLYU1BaDVsNGJHRzhIV3U3d0MreklxcDRB?=
 =?utf-8?B?YnFsNG03aGJmTkNtcHh4NUREOEVkZTBVZlNGU1IrVXI1MWlTeVFZMklpcEQy?=
 =?utf-8?B?VHVWL0ZSVWxaV2FwS2ZSSll0cy90d254Yk9DOEl6VjJWTEMzeXgzbnhubkdM?=
 =?utf-8?B?YmNWRXBQdWJSOGpRcXZuR1c4MUxRaGswQ1MxdGo5a0ZIdnRpc2Z4ZTA1MHpo?=
 =?utf-8?B?QXJmeS96MmxtVFBNdHFacFIrOUxvS1BSWXZjU2FnYVFRMWk1dnNYYkpyNTI0?=
 =?utf-8?B?NGthTmhFVFFoVk9nZW90N3Rxb1FxcDAyNVVHL2ZsR3BYWHJmT1JHcHR6azVV?=
 =?utf-8?B?U09tZDUxNHp1NkZDb2NMak54NzQ0VFNMSlcvVWdHZWdKODNCekhDam9HdTdG?=
 =?utf-8?B?eVhkWERDbGtqOXV3cUlnbHhoM1ZiQVBCOG1xRVBWODVNeVpsT0llczI2MmNv?=
 =?utf-8?B?MDFVRzE3TS9qcFF2RHcrSXp1aVhFTjliQkZUa05Ta2F3d1lidzcyNHN1c1VS?=
 =?utf-8?B?UDhJcDJzNWs0ZVB5eGk2RkhIdXRiRCtKc0JhRE8rV2ppSjBBWWx1YXJXT3I4?=
 =?utf-8?B?N1BRM0dEbmtFZ2lkWEV1cUQ1RDlLc2IyaWM3bWxhb3pvZVd6dXo2SGZvWlVa?=
 =?utf-8?B?cUV5NmFvOVAwKzMvWEIzSFJSSlBCZ1JDWDZiaE40VEd5cCt2VGppdkdHSGJJ?=
 =?utf-8?B?dHFsenNOb0VOUVB4YXNWM0dsT05lRWgxc0NJQVFMa0RBTGQzQU0xRlROSUpJ?=
 =?utf-8?B?UEY1VVNwajhNUy95ZWw5TVU5TjdoR2NxQWlBZTJhUnFwRnVXUkJrczkvaUh5?=
 =?utf-8?B?MU5kMzByem95YmowQmZ1ZHR5RDdnWTBTYnNFNjNoSG9HTkJSd1lpK1piL1lQ?=
 =?utf-8?B?NXBQNFhyUHZja0hvZkVRSEJKZzFRU0F4SHJER3NEWHUveWxHQ1hKRWsrTDly?=
 =?utf-8?B?UERkUVg4TTlqeHMvRm9ldTVDVmluZUs0VUVtWEhiQVA2RC8zbGlpQXFlR2Jp?=
 =?utf-8?B?c2VwT01UMlZwd3F6T0lVZzl1ZXFiRVVPTDVzZ0lyenpkZkxqOFJKMmp4dHZP?=
 =?utf-8?B?S3lIdkFwTjhOOUozcWE1aW5oUDUvamlzT2VBaG5pTFpwSkErdlA3c2dKYzJs?=
 =?utf-8?B?VWoya0loK1FVa0ZBZ3ZzWG5VdUhqTnZMRXRnVDVXazVoRWpNaGpad1dqblpI?=
 =?utf-8?B?NXA0b01tTlhtU1lOZmNsSUo2djM5SFhYMzA5RURDMXpQZ1VTOGt2cGlyaUxm?=
 =?utf-8?B?eWZSTkZhR2YzMHJPenJKYVRFblR2M2I3c3Z3amZZZjhLdisxZmZKTjR4bjEv?=
 =?utf-8?B?K0dlZUlJYVdjSG9VcHhpOExyeUVQZDlOY3hHZWc2RWhya2xNbHZNUUM3dkdZ?=
 =?utf-8?B?ZEZCQUNWNDRuRGUyMGxNV2Rybzl4dlhsSDI1OEViWmdJSDVnS3BBK09velJP?=
 =?utf-8?B?elk5cG0ydXpUYllJNGs4M3RxRkVNZlNLRFl4WlVRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86454e07-7f1b-42a3-9a14-08d8c7784172
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:44:18.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CesucCAJLTmqOxThRurhBl3tZPnUlofUm5eVfIHZ695eAatg3LTnP5ifRGFh1eermFEXb3bw3AoZmoZ3ljb2gjpDQCX0//5DcUUyzu3DLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4407
X-OriginatorOrg: citrix.com

On 02/02/2021 12:20, Ian Jackson wrote:
> Since you mentioned patch 1 and asserted it didn't need a release-ack,
> I looked at it in a little more detail.  It seems to contain a
> moderate amount of (fairly localised) restructuring.  IDK whether
> XENMEM_acquire_resource is used by non-IPT configurations but I didn't
> see an assertion anywhere that it isn't.

Acquire resource is used by Qemu/demu/varstored/etc (for IO emulation)
and the the domain builder (seeding the grant table with
xenstore/console details).

None of these usecases used a size calculation, and made blind mapping
calls of 1 page in size.

IPT is the first usecase to want to map more than a single page in one go.

> I appreciate that whether something is "straightforward" on the one
> hand, vs involving "substantial refactoring" on the ohter, or this is
> a matter of judgement, which I have left up to the commiters during
> this part of the freeze.  But for the record my view is that this
> patch is not a "straightforward bugfix" and needs a release ack.

I have extensive testing, demonstrating the bug already present in
staging (unable to map the guests whole grant table in default
configurations), and demonstrating the correctness of the fix.

Some of this testing (specifically, the toos/tests/* binary) is
something I plan to fix up over the ARM IOERQ and other series, and
submit later this week.  It will demonstrate the current bug in staging,
and show it fixed with patch 1 committed.  (This is something I want to
become an autotest in due course.)

Other parts of this testing cannot be submitted.  To get the compat
layer correct, I needed an XTF test and modified Xen which had a known
pattern, to check the marshalling logic didn't lose anything when a
continuation hit an interesting.  I can talk you through these tests and
assert that I have run them, but its not testing logic we can commit
into Xen, and its not anything which gets tested by OSSTest because we
don't test 32bit PVH dom0's in anger.

~Andrew

