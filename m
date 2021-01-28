Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A09307B5B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 17:52:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77254.139811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5AWb-0007Ot-4y; Thu, 28 Jan 2021 16:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77254.139811; Thu, 28 Jan 2021 16:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5AWb-0007OU-1r; Thu, 28 Jan 2021 16:52:05 +0000
Received: by outflank-mailman (input) for mailman id 77254;
 Thu, 28 Jan 2021 16:52:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5AWZ-0007OP-Fp
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:52:03 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25b9a703-9703-4a0a-87f9-11e3f7885590;
 Thu, 28 Jan 2021 16:52:02 +0000 (UTC)
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
X-Inumbo-ID: 25b9a703-9703-4a0a-87f9-11e3f7885590
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611852722;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uO2erlpow8qcwr79nJAH50HDQvP8iT2gZvzll8QmW+o=;
  b=JDD3s9isH4P8SvX4zybuBJzeDsnerPhxovNXzOJVA2+I3f8Hpr9gUNOV
   /89e2/d1AdWUM5MUr/Bi27webnbUp/7j+wg7Gze9vdJCyqA0xdGN9sSV0
   nsFHwDPB/gW50IJ2++fC6x4hMGkaC0UemnlMzHn/2wOHHChwybxTVZMi9
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JS1D0Je09n/FxX1uvhNeK245E2GC2e/VG94lA0IpGGriv9ytwDNl65+rP29RnJ9TRNWQg2IFy4
 kI3s9dxKdmo4uhC/sD7q137roosXB6JnKj6CcS1WMndNGMoueKyr1IAef52OGqcW5ZyFUFan8P
 e00hQVfR3wTwglU7WGoMaaflIRHz1URdKce3XTZX2ESppafLwtAhZ/jkaoctm501lR+eko/KgG
 NHH2BCUZvVzDDBGNUkEvCge7PHgSftD0iWmIcNA6X1kaOmM/jv2AVMBaJWYaVnDjLrcIRVcDxB
 4OI=
X-SBRS: 5.2
X-MesageID: 36043411
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="36043411"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ8eeHqiLGlPHXVKNo+DTkTxC5U7vEXYzF5l6lw85iCdTit4tq0JrpkJX3AA63M5FPAwBF3ymEMtR3+eaf3hJxr2dYusMA8GJ8N0onjeuYFlP8fvLy9KdEkiptgd2t6Sko8aA6Z8nyQInRZ6hp0Y9KyxCmsbQ3dUMT1+eKI22lz1r9lMh+EHS1Z6lvoJRRcg9OgQwxFrot9VEJjtfxzN7oHuRcwHGEs5gY0cWCeXze/0nFxbcg/v46iXd0D2itlEtMke7eF4ulPvpTl58+JJ6LMLF65hT4YddCp3/zV6sgOaFVIu8yP79s5gCdUtS7C6oYR4KdjCmTPeOB1UfBOt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uO2erlpow8qcwr79nJAH50HDQvP8iT2gZvzll8QmW+o=;
 b=C92QrTI/vYxwDyvSKLEnPVY1J8DD1ngaAbHzetbIWXrq7ShbPkc1eSJryJBDYgiWarr5thgQADJR32ixVDtUqZNcP9eIatiNqB2kao1i2YB1fjkS03GvzMdvU2p/K9loWSKFqTnuJLgKdne0chpj5f4O36prEdCtnA2mtDZnB7r23/WWtHxNIDyay7FCMIlHbkKozwvy2xmKGEIYRgifVq2/ArGRoCMpOGgphUyWcMscEoSj90nnYaIMVeIZnZ4TeIJMXtaSLyQylRjUj3dfy3b266obZ0MIxcap7PaT+E3LzSYZEJd9kDXXIV5p3utlYudrFOs3bRdt0Qb6ln9Oiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uO2erlpow8qcwr79nJAH50HDQvP8iT2gZvzll8QmW+o=;
 b=ZzgOIoPcAaGZBg1MFJOOnZnabuUkViuG4SDH0t1ulc4FMKj9KiQZPulFCSWb1nWop12UcLycvUhlKFFUS5L6QNaqNm+crAzLkz//NOxv86uSv7jn2KgTXoriZ+RbDCB2PKPTjHr+NLkIbAXBdHGSkQIIeEhiT4buJKsZ3ZlIjw0=
Subject: Re: [PATCH] x86/HVM: re-order error path of hvm_domain_initialise()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <57a95580-bae0-ac76-fb4c-e1db85da4d5f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <55b43ce7-1fdc-9238-6eba-3c7c0377bea0@citrix.com>
Date: Thu, 28 Jan 2021 16:51:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <57a95580-bae0-ac76-fb4c-e1db85da4d5f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::28) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dd3d675-f5bd-4544-2057-08d8c3ad0671
X-MS-TrafficTypeDiagnostic: BY5PR03MB5128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB51281EA7B43D98D263B5C3D2BABA9@BY5PR03MB5128.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hsp69n9g/7zM7CFtq0NoTp4IejR4yIS5D44FrE1qT43q6ds8eRFW5o72gzJW5T7KLMxq6nUe0vjuDjl65oRz8hUbrKapgF70d7psFSoC/3Yu547ZZGVuvkfy2J/s/tRGGn6DqUYwL1A2OrTu2o31HVd1fIfcdk72TenU5X3ou1HUAJt3mTLgQnqVdeWsX3p54LoyF+w4vEXRpNYscEQsbEkVTg1tCBQb+xjJJnqJjoXqlGDh3EAL6Np2ZnZ2u2GbPrMfcM5Yr5P1xCqk8tIA8FeiqCBoBWI5mmphh9j0ovJMYA4kI9eERSUFrSLlaeo7cp55pLirW7sNq5KGAdptxW/5T0INkX8y7p1XA2A3QFZmATXzT7tq9g0DDQ2ZvB95IteJ4Jps1UEbPW0o9+ZqIbtc1sc5BrB47JDAfnHW14GyOWnIWuGMwpnNDV6xi6Aoj9nBbUpubTi0e2O2TYL11HkaT8lfilpIgK5rWiteyAQkBf1rrhEQyi6+netbOPanNlsO2MNRnvAcZYDsYlY6vWFC3bNEfmSK3bDx+QIcxM+6swq4VahFEBdO9QnA/mD39xnG8MSCpxQpg5Gj3CI/IruliAj/A8AO3mSxJ6vuw0iW2yhmeud4AYmXbwDUjOuMUOySlCblid6loNZu1TvkRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(110136005)(86362001)(53546011)(66556008)(6666004)(8936002)(478600001)(16526019)(16576012)(26005)(8676002)(956004)(6486002)(2906002)(31686004)(316002)(83380400001)(5660300002)(54906003)(66946007)(186003)(31696002)(66476007)(107886003)(36756003)(4326008)(2616005)(169823001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1Y4dytoOHhaYitkRU5vNHZrNDRIQWRkUkpVbnFSUlNNVDRzKzY4aWtaYW5Y?=
 =?utf-8?B?ZnhZZ1MzR0JxbElWbGtLTXBsVkxLNzBxQmVZOTZxUWNxeFZSbnh5Zm43YjNz?=
 =?utf-8?B?SnY0dG04azI4YmFSWGlnZXpPK1N5QzZlRHdiRFdWY0JNVWYvR0JiWjhONWxM?=
 =?utf-8?B?NjBoM0c1b1RwMHVmejkxbDBoTXl3TVc2MUJjVG1NTm52YThHaFI0Q09hemZj?=
 =?utf-8?B?cFFCWDFCendBM1JBUXF6NlVpVUNIc2UrWUUrclpiOGRNc205NkI0RWlMNm9i?=
 =?utf-8?B?NUdYWXo4UTA4REc2QWJkVWYxYitxZFd5U2hmdjF4QjZDN1BNOTNwWlVMSC9N?=
 =?utf-8?B?MFZkUlh2QllqR3YrZjNXTVliWTNuRE5CT1AwaklEK3Z1YzREbWlFN3JZWXY2?=
 =?utf-8?B?SGpsTXdXV1VFaFVKTU5ZTk4vYUcvK1pUZmZjSXRZMm5xR1Y4blU0VEpWc0FZ?=
 =?utf-8?B?UVJtYTRZcVRFbFRhWHcyK0Z3WHVsRnpnbDNGL1B1aDgzUU9hREdlK2lSSlFQ?=
 =?utf-8?B?cWxCTk1wMlFwY3FDcjJWbnhCZkF6ckhFWktLR1RnTSthc0t2M0NadUFVck5q?=
 =?utf-8?B?ekZsb0RaQVJlKys3ZWIrSzBiZU9PL0QyMGI4cHlGUy9jL0lWRm9QY2o5TDM2?=
 =?utf-8?B?dUM5RXZDZDN4TEdQMkpvZFVSSjUyMzA4Y0Nvc0I5VzI2d0w2SVUzU282ZzJE?=
 =?utf-8?B?dHJPdlV6MW04SmZGc0lUdzlmcUhQMCs4YmN5TkZISGltWFJkbmlUQkZ3ZXNn?=
 =?utf-8?B?emlpSUZnM1pzV0hsTXAzT3M1WVd3d0VwRDdlT1BlSy9qMHVNSTVmMGsyWU5R?=
 =?utf-8?B?WnV0NHVrYmZhRWZ2a2l2ZnpCQWFNUzBGMEt6bURTdGJZaXYwcDFFMzRwdjhV?=
 =?utf-8?B?SGdtVlVlUVdMa2hZMWo0QWZSK09xS2hXWTkxYzBONzE5djQvcjVpVkpWVXQ1?=
 =?utf-8?B?RXVyOE1JaWJQbzVYd21wVEJGcWFTOWd6YmRDaFIvNmYxaUN3UXRTREhUQmhO?=
 =?utf-8?B?QnYzRXMxWXIybTVGWWdJUEpYTTVMUjFwc2o3bStrUnN2N3ZrVlBjQ1N1QVNi?=
 =?utf-8?B?dXZURHRvcUNkYktLUkJ1SWJQTGl5ZFpiMUpzTGNac1k1aWJ3Mlh2Ym9Cak1O?=
 =?utf-8?B?R2Z3bUFRZGlKMkp1Q3VVV0JaN3AxcW5sbUlTL1g2d0JoUktrbEVEeVVPNTZn?=
 =?utf-8?B?MG14Qm80SlpncjlxQUxYdi9sZmVkbGszYVRJYTExUHpjeWFEV3FubHlZZU9u?=
 =?utf-8?B?WVlpTFFYdk9tRm9CcGRnRTRaWUQwekd0ZitFNzM2MWticHY3S0x5NDd3cTJE?=
 =?utf-8?B?R0syUWdwTVBZTjZEN2t6RjU4MVJhZlZUN2JyWkh4M01CRVUzYmhvUW1ZNjdQ?=
 =?utf-8?B?eDNUN09QeGd3SEUrbjhyeTd4VWhJSHBMTVFiMkEzOHkrYXF6aU0wcDh2QXFK?=
 =?utf-8?B?NytVTEw0cXV3L0NXWHBWNkxNU0NycnJ6Zmtvc2pRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd3d675-f5bd-4544-2057-08d8c3ad0671
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 16:51:57.9170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9gF/S/VsTpDc2bLK24GuuppSbkM5TrLy9UN/KoXcsbLY0eaTQ1XxoX6BRRDumpUfDLUW+qGfKsMWymzlbBN0VZuUoIz/EJoEgtfEn+v8Pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5128
X-OriginatorOrg: citrix.com

On 28/01/2021 14:40, Jan Beulich wrote:
> hvm_destroy_all_ioreq_servers(), called from
> hvm_domain_relinquish_resources(), invokes relocate_portio_handler(),
> which uses d->arch.hvm.io_handler. Defer freeing of this array
> accordingly on the error path of hvm_domain_initialise().
>
> Similarly rtc_deinit() requires d->arch.hvm.pl_time to still be around,
> or else an armed timer structure would get freed, and that timer never
> get killed.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> We may want to consider moving the other two XFREE()s later as well,
> if only to be on the safe side.

Wherever possible, I want to move stuff like this into the idempotent
domain_teardown()/_domain_destroy() logic, although I suspect you want
this suitable for backport as well?

This won't be the last ordering bug we find.

Also, I suspect this one is mixed up in the complexity of
arch_domain_destroy() which needs aligning carefully between x86 and ARM
before it can be switched.

> For vRTC I question the calling of check_update_timer() from rtc_init():
> I would consider it more reasonable to do so immediately before the
> guest gets first launched, especially if a guest remains paused for a
> while after creation.

That does look suspect.  (And yes - it can take minutes of wallclock
time to construct large guests, given the unintentional behaviour
introduced by the idle scrubbing logic.)

Honestly, its the kind of thing which shouldn't be firing until turned
on by HVMLoader.  Maybe we're too late to fix that...

~Andrew

