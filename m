Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0651942EFC9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 13:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210347.367186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLVF-0001nP-Vi; Fri, 15 Oct 2021 11:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210347.367186; Fri, 15 Oct 2021 11:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLVF-0001l3-SM; Fri, 15 Oct 2021 11:35:57 +0000
Received: by outflank-mailman (input) for mailman id 210347;
 Fri, 15 Oct 2021 11:35:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UM5E=PD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbLVE-0001kx-5y
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 11:35:56 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e87c8f2-2dac-11ec-822e-12813bfff9fa;
 Fri, 15 Oct 2021 11:35:55 +0000 (UTC)
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
X-Inumbo-ID: 0e87c8f2-2dac-11ec-822e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634297754;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RBR8NExi6P/5nWPVx8DSkXub3TBMlXw+Y1GZJthKL4Y=;
  b=Ysf77pEWlIhlSGiX5vVeNC1Jmq4w7d92YXDedHkZ35Vcdoelgu5earI2
   ji6fDIcpFAB5/34b2X33BpBvtWy8ruDpiTzImBR1In0zVam75bRxR6cfo
   sDdV4cCDeLEnSyCt5HzmJYTIn2agYwNetSC9q0NsbS2xSjijE7LfAfKoE
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KVHSt4gABU8tRG0vCqTIkdfqOGeDIHfy1xk+dP8KJGTZ4ExNReIAW2KdddWqwBGXDQfsN3lyJ8
 fFI9MCGKGjxy8E4/kIQ3/BcOL4jMSlcs77aNLftlmJBpkoLCumS2ryM3hdtHHEo9A1Hrjs9rP7
 Ei3ncVTnfbg3wR1LW4gcwvgRvYJN8qt1ogY5Edi8zrSKALlAYuAAp1dcfniFI6CWCFjb+nlX7E
 6bz0yHYVsS79Tjrl2dCNAn+UYkCdztwrGRO7SxrOvKiGTAwMeN7NhFc0iMEYB+XiDjr2oxbfL9
 hXPD9SPH7DbOPygZAivoo7cJ
X-SBRS: 5.1
X-MesageID: 57166003
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uQeY6KLY3qQDy4qPFE+Rp5MlxSXFcZb7ZxGr2PjKsXjdYENSgzECy
 zMeUWjVMviDYzT9edt/O47ipBxUuceDztQxTARlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140Eo6xrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2zoopX5
 81Mr6aBUAsuZLbNneRCWDxXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XuoYGgm9o3aiiG96Aa
 sAcMSMocy7uaiJoIVo1JYphm7eB0yyXnzpw9wvO+PtfD3Lo5DJ21L/hId/EYOugTM9enlubj
 m/e9mG/CRYfXPSd1D6E/3SEluLJ2yThV+o6C7mQ5vNsxlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzWgqWOAlg4RXZxXCeJSwACSyILE7gCBHG8GQzVdLts8u6ceRzYny
 1uIlNPBHiF0vfueTnf13p2Zty+oMC4Za0oLfzYZTBAt6sPm5oo0i3rnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqYj7ay74FSBuDOqqZjhRxQwoA7QWwqYAhhRPdD/IdbysB6CsKgGfN3xokS9U
 GYsofXEys8WDIu3pTWBR78WHbSpuP2gP2iJ6bJwJKUJ+zOo8n+lWIlf5jBiOUtkWvo5lS/Vj
 Fz74lwJuscCVJe+ReouOdjpUpV1pUT1PY29Dqi8UzZYXnRmmOZrFglVbkmMw3ulrkEolawuU
 XtwWZfxVShEYUiLITzfegv87VPJ7nxhrY8wbcqip/hC7VZ4TCXIIVviGAHfBt3VFIve/G3oH
 y93bqNmMSl3XuzkeTXw+oUON10MJnVTLcmo8JANLbTYf1M2Qj9J5xrtLVUJINENc0N9zb+gw
 51AchUAlAqXaYPveG1mlUyPmJuwBM0i/BrXzAQnPEqy2mhLXGpcxPx3SnfDRpF+rLYL5actF
 5EtIpzcatwSGmWv02lMNvHV8d09HClHcCrTZkJJlhBkJMU+L+EIk/e5FjbSGN4mVXTq65Fn+
 OP9j2s2g/MrHmxfMSofU9r2p3uZtnkBguNiGUzOJ9hYYkL394Z2bSf2i5cKzwskcn0vHxOWi
 FSbBwk2v+7Ir9Nn+dXFn/nc/YyoD/F/DgxRGGyCteS6MizT/2yCx45cUbnXIWCBBT2soKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7IA4Vm2V
 0uD98N0I7KMPM+5QlcdKBB8NraI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsom
 L5zttQX5gqzjgsRHuyH1i0EpX6RKnEgUrk8ss1ICoHclQd2mEpJZobRC3Gq7cjXOclMKEQjP
 hSdmLHG2+ZH3kPHfnc+SSrN0O5aichcsRxG1gZfdVGAm96Djf4rxhxBtz8wS10NnBlA1utyP
 EltNlF0evrSr2s52pAbUjD+ARxFCT2Y5lf1mgkAm2DuRkW1UnDAcT8mMuGX8UFFq29Rc1C3J
 l1DJLoJhdoyQPzM4w==
IronPort-HdrOrdr: A9a23:R9SaR61Be9X7iWhzfAj5qgqjBSlyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcPY9Ns2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCD4qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPsf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aySwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7QvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WXAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 dT5fnnlbVrmG6hHjLkVjEF+q3oYp1zJGbIfqE6gL3U79AM90oJi3fxx6Qk7wE9HdwGOt55D0
 mtCNUcqFh0dL5kUUtKPpZ3fSKGMB28ffvyChPhHb3GLtBOB5ufke+93F0KjNvaDKDgiqFC3q
 j8bA==
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="57166003"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0D1Ac4rBM9E+2g8xhmIyNXp89R/zgOwFCgdbPh59RiMfS/qjMCjU8bE8Xzi+g2RmqbcrAfJnS0+B/yjM5KwnPOaTmoYzIEDc1bjp9suDGLqO1sUG+J+j5Uh7MdA5jc7APmf+g3h+4KVSAmxUvQvHO5PeGlHQxa+yLCUvEJGVoTXD3DRKL5ozoIwcaV+SYD80fYJZYA3rt3vni0KCkF/XFm9PUJVE1zjOrQJBIdlGI8iIl64F0nHSrf/qRnRZBlAu8fp57nHnKlG5/lPVs9Fo54w7rr2m1kG2n5hcWTWTLzaZC81wBtzE2Z0ex0ElKRfR7Wd5S0yh5ko74q48FWYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVaKWQWok/L4wsobSpNYYkwFYE4O5PER6ESkKvtd2w0=;
 b=CFpPxtQ+4GIY0xjDUXv93Q0UO8/4nfPYxXbbvV0DRYOTkhC8xjC1oEZWoLCdqrE9RuS1/+6w6ut0t5luPh4HVh6lArfUii5cB2DdMbTWVPtulQ8fBXkZ0WLUH+JLPOrZBrFviQ2giAka2kivjYOZrk85Z06CDYEnP3Ma52/C2ni+rT3sxMPo/SCX0cN0h8jsIzPIfsFcTI1+ePTHkoEzAhkYghM6P0O4FX8TkIwnJHy2DL5DUfTvPSDaVBuWeo5fW0NT5DfVxaVQRtct+m8w4HJX5tmxAEYHGG27DKSMvLz6Ocx8HbzpJP9W7A3GcN9Qsc6t+PMUpVs3BngjIfSFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVaKWQWok/L4wsobSpNYYkwFYE4O5PER6ESkKvtd2w0=;
 b=ti+ZNzWyQenyhmPMcxAq9Wsi/B8O6pGC7xaDW8sAhNvplr5D81jH8J6n7UuBoA1F4uwvoke2Q3WQfF8GsY75xkjYCqbXkPk8A2O0TSaU+owqSRqcDh5QaWtaViy/1tyG6SBK9q7tB1gRcuxzFpC4mid2DEn2+Pk3TZ/yuWzOWcc=
Date: Fri, 15 Oct 2021 13:35:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Message-ID: <YWlnc3b0sj4akUWa@MacBook-Air-de-Roger.local>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
 <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
 <24937.21631.538303.29471@mariner.uk.xensource.com>
 <b8fc68e6-2bba-ef11-4c4a-50c2046ecb04@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b8fc68e6-2bba-ef11-4c4a-50c2046ecb04@suse.com>
X-ClientProxiedBy: LO4P123CA0471.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd30eaa5-e932-42f0-1da8-08d98fcfdeec
X-MS-TrafficTypeDiagnostic: DM6PR03MB3738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB37380B30A6ADA1E4CF9D50948FB99@DM6PR03MB3738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yuCpHIS6ugD8WZyjPkkX3ZGhTPaNve9xySe3Lm+Ico+ET4EUXcvPROWADZw2KKsEEAwh3MlUDuX64XkskQXbd2R9Unv1f3xPMMAt6xns8h4pcuWs8XRDAwZTaFa2uNJaw9LOQf195/0ci6ttvHwDLIvOdJ7exXTgXJHTm8nfFkFmIuktQLIxZypzz59kyv7w8WByxojlCK5soOAYiUZULzTY9DunwlVVTXjIKwJXzvmMOLyn2HJXv7JkGxNYFkcX/K79JyGE4ubqqVDiWUQA4vAK86wImW+qK4NZ1W9pT3p5Sy5CwzGQVCCNmwDfnlRGukbEhDdaAbbB5hSHby+Z/FLt7Zovq+vRC+NN8EDMIiHXE2JPf6QDkrCCRbPq7rQ5uJYH74+0jY7Cwy7yL5JXWwzO2lu6zsS5V9eVfnkiEKlyrf02yOjyXeffwlVUYlkZ8z6o8AA5MEL/kamLFl9OF3EBCYQXgwoPqJil0zyUSGaPvPXmUhlDTi8PHwc3DfIsv2TJdFQVjj2oLbKDygcDYTgGY6g4bI+blgDAZbdQ+8nfpPOsijN6m5VwOv27cOjS12vhIywBfCNDGN2pdU3Un3DTr5s+lhx3IgBu4v11m55T6Tr3pXM3jqjukVItWTGuPdtxk4ETmm39QspSAGGxzeBZN7xLp5KQZi5gisRBYepmDco10jatdnzOgN2pmXeoV9/+eJwcjIYQl5+DL30kG0y8GEDTmbxozLapna563Xs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(966005)(6486002)(2906002)(66556008)(508600001)(6666004)(6916009)(8936002)(9686003)(38100700002)(85182001)(66476007)(66946007)(4326008)(5660300002)(83380400001)(86362001)(8676002)(6496006)(316002)(26005)(186003)(82960400001)(7416002)(54906003)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDgzTHNCRXpWYncrNk5UTzBXZTFwT3RNYmFSUUI0WC9LY0RzeVRUbFhoUU5G?=
 =?utf-8?B?MEw2UlErTWliUTFKZEw3a3NIUXFwK0lTd0pUdTg2UUIvTnAvZDZXTEl1ZlFX?=
 =?utf-8?B?dVpLdHJnOFp4OXBsOWk3VHZSMWgyc2Z5SGtiSk9aTDBoK1VZOXFwS0Z4ZTI1?=
 =?utf-8?B?N0dPRzVmU1djOUJkMkt5RUN6a3N3WE1EU0xnMWp4Y2FCamlSanVBUXM3VWhC?=
 =?utf-8?B?Mk1MaExhaklYQUdzeHl3aDNpS09RZTJpSnFuTmF6dHJiS2lsNSs3YlBFRHgx?=
 =?utf-8?B?SXVySGxHcXdROGNVZ0hqRVNqMkwvRENndzc4OEJaWkNDcEI5YkdGeTVIbHVx?=
 =?utf-8?B?NjczRHM1VXBnektuNWdBNUJBeWUyVkVyaHVRSm5RWVFHYnZXbmVLSmszT1RX?=
 =?utf-8?B?TndtOVg3b0dib2JRejluVzA4bzFVRE93OG9FSjFaVXpkWUgxMlM5KzYrMlJ0?=
 =?utf-8?B?b1lOamJHVFl0eEliU3VPdTMvOFZ4dmY5SklnVXBFMVViUXR4eHhIdGo3L1J3?=
 =?utf-8?B?OStFOGdPSVk1YlRVRm9WMmdzeGJMdFMzME9UYmk1aWdGSXdtWG5LVVM0bTRR?=
 =?utf-8?B?U3VkRm5WUHM1UWFmY1lYK0xNNWtxdTdIRnc0d3NxV0c0dnBLdWlLeUw5cU9V?=
 =?utf-8?B?VUpmc1JnVDlVZkV0MzVBRTNOb0JpZlpzaDhVWlV0WmhraEM3d08vRmFmZEdV?=
 =?utf-8?B?bnNHaWFzdWxRZEFpd3FEaUtXSGtpdi9WMm0rN09NK0srYXZodzFWY0VqaVhT?=
 =?utf-8?B?Z2JkSXQ1YStLWGhoYU9iY3NFODJCZzEvdkt0aFFhdnFxemZRK1E1SkRsSFkw?=
 =?utf-8?B?eFoxVTY3bWZSc3RuN1Z0UCtCNWZuRkhUSlRkSFFXejNDVGVrdzVldlhOSlV3?=
 =?utf-8?B?dHlyc0J1NFN4SnZQV1VQWU9UZ1pJdFo1UUxWakk2d2lVSmJneXZLZGM1UHNa?=
 =?utf-8?B?Qlh4SkpadXNuekhQcVdZa0FCaDZoUS80cjBOS2wrWm1OOWVnWlZ6SmVxY3pT?=
 =?utf-8?B?SmlkTlFJdE0rbG0wUDFhUzBlQnpGaE5mYUlaZEZ0ajBYVnB3VzBQdy84dVp1?=
 =?utf-8?B?ZVhzSmltMkJyM1llb2Z4NzY2TVhVYXZVWVZlRTBEenJ0WlJYVlNPdDdGWUhP?=
 =?utf-8?B?Ykx1T2Q3ZDd1T1hJRldZMWl2UFdvOXZDMTBjRnJGN2poVkt5am40cDE4enVP?=
 =?utf-8?B?UXRJK2I2WXVtM0wxaENtTE5QN1NZK0U5bVRsNm4wczkzWXhweUZIZThLQ3ky?=
 =?utf-8?B?bUhGb1B4RDJkOHFQNEZPOG9ncGI3RnE5eWNhcUNzVENtR3lqdjJERzVBT3B2?=
 =?utf-8?B?OXE3QXRTbHZ1SmR2RlBwb2I0NG4zZU1wV0JNbTFzUURPbUtiOUMreEZiU09M?=
 =?utf-8?B?MU4rNHhLU2dwSTRqa1gzRlRRMzM4ZHB6OVQrY2VyS3I5RzNwQWVPTmFsWHhE?=
 =?utf-8?B?ZlpCZVFocnBTeExQT0tYYjFXL21mTEJKcmdQTHdmakNNaTFhankwOUt1RjZ3?=
 =?utf-8?B?Vm1uSlZMeEZrMEFEM0FIcVlIK1lucTh3SitxUDAzbms4VDdqZmRMNWcrZ0g1?=
 =?utf-8?B?MjExSGZHRlJlMGl3N2d3cExOZXB6aFQvbDFOMHhrbWpSVG94UWpnNXZXanVr?=
 =?utf-8?B?eWo0TUZwSytpQm9uU3hITkNleUxoU0FGdUQ2Y09kT2hhRkFZOUJVNzlMLzEr?=
 =?utf-8?B?MFVXVjhnWGo2cEpzMlRndCtLTHovMkV1a0NyTE45YlhyeVJtbS9xRWFUdUxz?=
 =?utf-8?Q?zKWJ6PiYUAjBV4GChOnsBys/AK90FU+akXiQml1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd30eaa5-e932-42f0-1da8-08d98fcfdeec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 11:35:21.2774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+bn55isxTeCalMS6vAcBmUzhvQ3P+mfnQX13cNN2WFZoFvwKXHWWcwkYFRKh1gvKgkbgZeCG5wilHl/jWwRKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3738
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 12:18:59PM +0200, Jan Beulich wrote:
> On 15.10.2021 12:14, Ian Jackson wrote:
> > Bertrand Marquis writes ("Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI support for ARM."):
> >>> On 15 Oct 2021, at 09:00, Jan Beulich <jbeulich@suse.com> wrote:
> >>> The latter is fine to be put here (i.e. FTAOD I'm fine with it
> >>> staying here). For the former I even question its original placement
> >>> in asm-x86/pci.h: It's not generally correct as per the PCI spec, as
> >>> the bus portion of the address can be anywhere from 1 to 8 bits. And
> >>> in fact there is a reason why this macro was/is used in only a
> >>> single place, but not e.g. in x86'es handling of physical MCFG. It
> >>> is merely an implementation choice in vPCI that the entire segment 0
> >>> has a linear address range covering all 256 buses. Hence I think
> >>> this wants to move to xen/vpci.h and then perhaps also be named
> >>> VPCI_ECAM_BDF().
> >>
> >> On previous version it was request to renamed this to ECAM and agreed
> >> to put is here. Now you want me to rename it to VPCI and move it again.
> >> I would like to have a confirmation that this is ok and the final move if possible.
> >>
> >> @Roger can you confirm this is what is wanted ?
> > 
> > I think Roger is not available today I'm afraid.
> > 
> > Bertrand, can you give me a link to the comment from Roger ?
> > Assuming that it says what I think it will say:
> > 
> > I think the best thing to do will be to leave the name as it was in
> > the most recent version of your series.  I don't think it makes sense
> > to block this patch over a naming disagreement.  And it would be best
> > to minimise unnecessary churn.
> > 
> > I would be happy to release-ack a name change (perhaps proposed bo Jan
> > or Roger) supposing that that is the ultimate maintainer consensus.
> > 
> > Jan, would that approach be OK with you ?
> 
> Well, yes, if a subsequent name change is okay, then I could live with
> that. I'd still find it odd to rename a function immediately after it
> already got renamed. As expressed elsewhere, I suspect in his request
> Roger did not pay attention to a use of the function in non-ECAM code.

Using MMCFG_BDF was original requested by Julien, not myself I think:

https://lore.kernel.org/xen-devel/a868e1e7-8400-45df-6eaa-69f1e2c99383@xen.org/

I'm slightly loss in so many messages. On x86 we subtract the MCFG
start address from the passed one before getting the BDF, and then we
add the startting bus address passed in the ACPI table. This is so far
not need on Arm AFAICT because of the fixed nature of the selected
virtual ECAM region.

Thanks, Roger.

