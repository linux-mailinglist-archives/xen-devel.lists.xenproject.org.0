Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8EB403AED
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 15:49:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182061.329485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxwy-0005w8-Uh; Wed, 08 Sep 2021 13:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182061.329485; Wed, 08 Sep 2021 13:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxwy-0005th-RL; Wed, 08 Sep 2021 13:49:16 +0000
Received: by outflank-mailman (input) for mailman id 182061;
 Wed, 08 Sep 2021 13:49:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF9z=N6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNxwx-0005tb-Hc
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 13:49:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d7dedc6-10ab-11ec-b156-12813bfff9fa;
 Wed, 08 Sep 2021 13:49:14 +0000 (UTC)
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
X-Inumbo-ID: 8d7dedc6-10ab-11ec-b156-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631108954;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DtULsXlCgXIOQLWWWQwNgu4W3fzzOpTBB/X0vAO+RWA=;
  b=RYuELsEBS7K1NFG5mDgul2FA+Fn56+b8yo77dzwGELMi+8O//RSo1pqq
   bAfFxqEJoJXUKBHZnHqThFGo38WNOTchy/iw9GhZdAuEAtAr/QMM9FKRX
   2fw14NOi0r9H+/SkdMJPmXawXV1g/a9UyvAJAE82CmgknOHP4pPljuP3l
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uNySJenAmPay8mybxv87qnmwJEb+pvmhv0Z5N242NqaN/k9Lz1h4VQDs8XhHdv+57jNqGy54oj
 gYOjpEDGh5afllPVCHokReWVkKdGafRP//HxKdr0VcjT1Df0Xz21N8O7FAIpkEqpY4JkUvgnkh
 APBWceMIi1kK91lfXpKo4+tlIZux/bLAC3OOFXJdssBOg9eBNKVGIhpHpFfOluDigi1Mf4LzeI
 vE4wrshJjgrHhkHLuyoKfPNDiUAUoc5Ycbp2fIH8I6fVyfFYyoikxPC5+XxPILNK4TSKguYsdC
 Sr9Zr2fgtZzgSDkEQEEHIDAm
X-SBRS: 5.1
X-MesageID: 54017415
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rj4KqKkTx9ffw4fos5fCsg2DgG/pDfP4imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdC9qADnhOZICOgqTMCftWbdyQ6Vxe1Zg7cKhgeQfREWldQto5
 uIEZIObOEYZGIS5aqU3OD7KadG/DDtysCVbJLlvhVQpHZRGsJdBmlCazqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOvXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6W64aT1eUapDOtouEzTvBkuPJlZQkEuTzYKriJbofy8Azc+ImUmRcXeZ
 f30lcd1o9ImgjslymO0GHQMk/boX8TAlLZuC+laEHY0L/EbSN/D9AEiZNScxPf5UZltNZg0L
 hT12bcs5ZMFxvPkCn0+tCNDnhR5z+JiGtnlfRWg21UUIMYZrMUpYsD/FlNGJNFGC7h8ogoHO
 RnEcmZ7vdLdlGRaWzfowBUsa6Rtl9aJGb6fqEmgL3g79F7pgEG86JD/r1hop4pzuNNd3Flj9
 60TphVqA==
X-IronPort-AV: E=Sophos;i="5.85,278,1624334400"; 
   d="scan'208";a="54017415"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqXHydLbR7CT3aaSXvofUG6GsZhmgH2gJK1HP523f6z2jSx/9zGRJRx8rTM8C9tp00zu1nNgDIFiqrSW1IP6u00GL+G2xs3rcv4iemX6p0PltvYqiwaIsqC0vPTO11ahIxiyZtORtrKL8Ws3JglABS2xxN/PFJRLoMlKumlliSLgIv/TZLAnzvT1ck+qIrO2rwgfS8Ujh/u1IthN95T7GxNRjpwPULNki59l3qrvYFwYR8R+KbrwkyuNfCMomvuzWlMBfnEHCnX8t1bds/uIzN1N4AZ98do67UenZI5RnuN7/OU6Db2Siw1NubsOHy+L+gaxjrrhoDSmlargtSveaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DtULsXlCgXIOQLWWWQwNgu4W3fzzOpTBB/X0vAO+RWA=;
 b=RYj0K05T0Jg1CHWaGlx+kJLXOAw7CRi09t8QV6w2fko/yOHzX+UO9w6cVaV2ZsEHx5loNp/oIumnyUaehnYtglZk833iUUtP5Mx/yXRGEB96zeddtSD0SA44YQ13TPmgcvT76pzPuSPdsOr+ShLjJTt07l+gv7mw04XVMW2lMTX/8R2Dzye22nRi2bqbzsxTOsYvvgmNXBPlroLGczxZ0/xPVVVqQkNL6G5XUCxr4vpDLURoo0YKZ/OLIuaR3sWgU1QUDh/DQrq7a3hM30DIWJcE+enllrXOEeyUAst/3WFbuKm0V0Udc2cORNKlmTyWRlu1B3Iukfg/SaFxRtToyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtULsXlCgXIOQLWWWQwNgu4W3fzzOpTBB/X0vAO+RWA=;
 b=YsS7LAbLVef5J/1LWPh+ZM2bX+dv0mvoV4RbZX0MzLcDULDagUjk6J5zgS8S1pkaMdnnNDy1IDsDm1dxhs9YActIP89lA4rfZnuXHusbPYVtuXEluR9gfoA65zyy3nZPI89/1TfehbOY04snrVWLeC3JVy3iEMCDZu6RsuSW0ts=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <20bf2b1c-9c4b-bf9e-bf57-d0ba18e6458c@suse.com>
 <33dc91cf-1c80-b386-f9e0-6cdb8e32d5d0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/boot: fold branches in video handling code
Message-ID: <6d74fb5a-d7ca-8fab-7f6e-09f6a0a9a700@citrix.com>
Date: Wed, 8 Sep 2021 14:49:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <33dc91cf-1c80-b386-f9e0-6cdb8e32d5d0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f61a4b8f-1c68-403b-4bf1-08d972cf6f3e
X-MS-TrafficTypeDiagnostic: BYAPR03MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4551744A3375AD74B9B1FF4ABAD49@BYAPR03MB4551.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XEStdw1XPUVsMryYnb7YpViuRCWw0OK0gO/jiTu2oHlA2LUdKVeP8KfpTDgW4Lbu+pj5LrHRhvHlFKPSmDskXadCRAQncTMJk70H1BPHpO02kwKPg41vJkMS9qEnF4zwkM6vLcRWB9HWr53vEb/LXcy7DdkZ5wXsuCaOzHQWztdX8+VWIyahKKI7CGTgrMtm8taWfGdsGhcYeOq3SrVsTh1uN1V7p7BSInu4ookwZdG/fhWEhSF1lDprbSGfnkE6FbRfvFxnpCG0hsyAzTearVAb+3P9x10kzV9wEvV0eQ7uYZshWcxjUNyI+NYrRjiKUMv3bMD1fubWJME9OBGyODP1b33dPwodg9rTtA541R4MxTU27eaL4z8J83Ay4bQhUtbfXqN8zgz4p6EO7oAREOdiPjpetlqrRlxvkTIvECfgBVm/wUmSXJ3UCdZroqw70Ox5jf9vqUR48qtGWtmd0H4vdJrIIqfN59sGFhVRAWKkHHoSrf4sAVAs1UtjerO3b7VJJQJRJnv2t1B60VFRr2F1k7e8ViZPIriUa1XCVKu+TVc3kHjdqfMmctGYo41Qqxpyl917HN8Bys/1nOyUMZh2FE+C5ywvTrBeGNmA+GTbfTilQs6VnRn/42WFDp80b5+Fqt8lKGXuLfVUMV75twE0V7Xb+CBt3EVW71LtwAC3tdLz2KA6sLzzot2a2lMTMrSAGNpuUioQwYe5M1Vckg+sGz3I7Apo/Ts6t6SJmUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(8936002)(107886003)(6486002)(478600001)(4326008)(5660300002)(66946007)(2616005)(66476007)(6666004)(66556008)(956004)(8676002)(38100700002)(16576012)(31696002)(83380400001)(31686004)(26005)(110136005)(55236004)(2906002)(36756003)(53546011)(86362001)(186003)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEpyT2p6aVd2YjlkSnhwa2I2SGR0OFQ3L2E1ME9zeGRzZVBIcWRuNDVERVVC?=
 =?utf-8?B?MjdTQitKR1hNeVNWdVBGaXFzTlduSWsvZ2ljMHJ3VVJJYVI4d3ZKeXJ2am5o?=
 =?utf-8?B?TktsM2RTK1ZxVzBmQURURUphdnZJN1VxRzUxL0VSdzRPN2hHYmh6US91aGJV?=
 =?utf-8?B?d3l6MUJHREprSmlrVmNVZWtFbHZsNyszNmNNUUdGUE82eDBVNUZkdFZjL2Rm?=
 =?utf-8?B?R0VzVUNBNnU1N0ZWN0dreXhlNFgvT1JmazQ2dlMrUVB0aEoxa1NVczBtSDV1?=
 =?utf-8?B?UTAxMS9lemhYY3lkUGEzTUVjWWRKUFVJZ2pGV0xINXlhV1F5Tm0vV3IrakUz?=
 =?utf-8?B?bEV1YnJmS1JGTlZLWmVSdG1ZSHdHOVhjWXJOV1Z0ZWVLME5raFRmcEwrSyta?=
 =?utf-8?B?RXpyT083b3YyR21KN1VWUWdNbThOOVM2TXdJbzd2UXplaExkUE1YMWJCaXZG?=
 =?utf-8?B?Q0dKQ1Q5Z2ZHcTFscktFaVRKdWpid3Fwei9hOGNjT2lwOVhhSm14b3dSOWhv?=
 =?utf-8?B?WjZTN3A2YmhEb2tqZUlqVWwydmVwYUwxeVNIOWN5NFZvajZJbmtuV3BSTTNB?=
 =?utf-8?B?dUFBSXFNNjJYRCttQ3NndzNQRE84T0RWMUtEYUlJZnQ3TzhOeXRDdU1rNU1j?=
 =?utf-8?B?ekNYaHowY0hkNVpHL2t3c21yVVdQcHhUZWlRcWJ4bVJvaTcwTEswUm1CTDNO?=
 =?utf-8?B?ZGlrelFRSmdZTjdkdDBZUVZFY0pkK3dLcjFYUzVHa0ZqMlNYaE14dnVnakxk?=
 =?utf-8?B?QmhJU1pTQmU3Q1phNURub0VQcjZNQkdUdkRHdVhibjJtRS9OUFNTRUR4RnAz?=
 =?utf-8?B?SjNMT0YxeXMydG1tTUdWU2R6NWtaWHY2QUZyRnExOURKMDZ6SFp5VE44QmRr?=
 =?utf-8?B?ZlpRYzdKaXFnb0tOOVliVVdnSnpOV2lyTFBjcUZkdm42cUtBazZCM3p1SnYr?=
 =?utf-8?B?YlYrNCthZS9TckhaeFVTQXNXbEozSG02eE9BVW9pcUlpL1N2YW5ybGZMNWUy?=
 =?utf-8?B?dXNqdDQ0NVlKQVNIeXFMTnJQQUJ4U1pUU2Q0TUZSV2prOVBHV2REN0dWUHp6?=
 =?utf-8?B?ZjFkQXNEck03c2ZVR2Z0N1JZWlpwaTczZ29nQVcyenhuS3dNQ1pLdzlEVkp3?=
 =?utf-8?B?QUc4THFGVnFpdHQzVTdCVVpDVGZjTzNXZGp2SmVXUE1mR2llRWRVY2hCb1RE?=
 =?utf-8?B?MG9LYjBDaEhTU1B3bmZtUXhYQitJaDhpN1ozTytQc0k4U0lFc0lXeFVzWDJP?=
 =?utf-8?B?bmkzNE9haytvdDRqSXBTVXBWUnNyL25HaW5QSGtndE9mOE1BRjlBZW5wMTNx?=
 =?utf-8?B?TEZUbEdHSGtsRjZJbVRSbUxXQnd1a2tBRUYzdG5pbno5QUJDRDdMZDQ2UWdQ?=
 =?utf-8?B?MFgzY1Z4NVlkT1JQL1VYNE1rUWRrb0JDVmdQUlpBSi9XUGNQSWkyM2EyWFdE?=
 =?utf-8?B?dURxU1ZscER4emhZdHN4emxJVzUvUTFhMU9rV0J0SjBaYWZEVUZaZGNVTWZT?=
 =?utf-8?B?U25BMDVya0VnNVNvMmJhY3R2ZWpHYW1IMTFSMU1oQzV2YnBVZzRUMGpYaFY5?=
 =?utf-8?B?Y2MvRTNTOHpvSXEzdzRuSHNkcHZKNms3NG5KeGl0ejVZR0VGM1BvT0pHTUFC?=
 =?utf-8?B?OG9BUU9ES3RUZlk5NjdFVDgwcTFqOWFMZkFQN1p2elFPWE1kTXBDYUxoUzQ2?=
 =?utf-8?B?NmY0VXZkY28ra3UvczJucUt3UHR4S0lyNi9lOWhMZjdPMHFCMy8xTkJXUE1Z?=
 =?utf-8?Q?zJ6l1kR8j0S25eWQsKOQIXW3A1loQLbvH3w6sn3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f61a4b8f-1c68-403b-4bf1-08d972cf6f3e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 13:49:10.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fu6SE5zKFcb7aj/SOzeL0cVvvhaRvc/3Uxo9isp/WfdBP80QPijx8ez4UjdOexCFvy8XrOnAfMX1EGlH8Olx2UY5QtwzSDWUEzyPAOHub1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4551
X-OriginatorOrg: citrix.com

On 08/09/2021 14:24, Jan Beulich wrote:
> Using Jcc to branch around a JMP is necessary only in pre-386 code,
> where Jcc is limited to disp8. Use the opposite Jcc directly in two
> places. Since it's adjacent, also convert an ORB to TESTB.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is an easy change reducing the overall trampoline size a little.
> We're pretty close to needing a 4th page, which I'd prefer to avoid for
> as long as we can.

Honestly, it is high time we ditch all of this.

The interactive video mode menu only appears to have confused users
who've encountered it, and it is a weird thing to have in the first place.

Furthermore, the Multiboot1/2 specs have supported passing
video/edid/etc information for longer than Xen has been around.

I am not aware of anything we currently obtain via BIOS INT calls which
we can't rely on the bootloader for.=C2=A0 Furthermore, if the bootloader
can't provide it, we've got 0 chance of our 16bit assembly being able to
do something useful...

Dropping all of that should remove the bsp-only path from the
trampoline, taking it down to just a single page and removing a lot of
fragile code.=C2=A0 It gets us closer to being able to support Coreboot
(where the current logic says "not EFI?=C2=A0 I can make BIOS INT calls
then", and is wrong).

I know its a larger piece of work, but the wins are substantially larger.

~Andrew


