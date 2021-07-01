Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C88A3B93E5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 17:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148936.275272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyZ9-0004LZ-6M; Thu, 01 Jul 2021 15:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148936.275272; Thu, 01 Jul 2021 15:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyZ9-0004Ie-2B; Thu, 01 Jul 2021 15:25:23 +0000
Received: by outflank-mailman (input) for mailman id 148936;
 Thu, 01 Jul 2021 15:25:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRek=LZ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1lyyZ8-0004IY-BK
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 15:25:22 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c44fd48-da80-11eb-8340-12813bfff9fa;
 Thu, 01 Jul 2021 15:25:21 +0000 (UTC)
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
X-Inumbo-ID: 8c44fd48-da80-11eb-8340-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625153121;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X/V5ibCYQ5Ltjst3E1u/yOTCJtEyYzUZXQwk3N3+N8A=;
  b=SuZU4Sq/kFh51r6PDK8rqJPQR9NkpLnUAMySwSCxwiGL9oB38SNUStf5
   oHFi3Dxmc/BGFLQiTMTwHNdVcpKXEjrRLytpOZi9LotlZpaZhYuwnthSY
   qD0KBy/WpL4eUv+801B4rHAsF+Oo+Z9QeOrHkJXAJq0rk/46Cum5aEimG
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AxWbYp+n8zJn626r/8nVZagjrA9vK/HRgctX5sBjxiDLboBgojMajFNpOTFsSElb5+qVLt7UDm
 IzAHNGI4G3xjdlzOejouTclhEtTm4PxRXidxT5fL49gcTR8G1yuokBppr/DvDxVU5ReZNNIRfy
 Cs1kNimiawwRwnjF0rUnVICOeVGeZsf707zZ1UErjLxxpivEDaBHiItlctrdueRbM9sKbVLhSE
 hULnDmfDd/3GPJlMDBNUVzTR2ox74swBN8G3d4V4mXGnxKoAt8esZG8eqp0IYB38+Ju662EAAR
 Io8=
X-SBRS: 5.1
X-MesageID: 47455352
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5a/oW6+ZpwXnPhFqhxRuk+E1db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc69qADnhOBICO4qTMiftWjdyReVxeRZjLcKrAeQYBEWmtQtrJ
 uINpIOdeEYbmIK//oSgjPIa+rIqePvmMvD6Ja8vhUdOT2CKZsQiTuRYjzrYXGeLzM2YKbReq
 Dsgvav6wDQA0j+Oa+Adwk4tqX41pL2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTopOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpMCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvErf2UIUh6bD3wXklV6vpREnBmcYa+a
 hVfYHhDc9tABanhyuzhBg3/DTENU5DaytvQSA5y4aoOnZt7ShEJnAjtboid0E7hdkAoql/lp
 P525tT5fhzp+8tHO9A7bQ6MIeK4lKke2OFDIvEGyWXKEhAAQOXl6LK
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47455352"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4mgmGHWxsu3RaQMRFAyOgsPoC7dttGOOkH8Xor5Eqy/jKYgViChM7RywtYpqOhvKwDqMDUO1jiadE07A9MCmmk6Ji87GmY+XyLo7ROQL/qlxMKB36npglfBiCzzLefyv9p50yNHTfkLqhxMWt5vBDscvwXBMc+V/MoQhkojkxhIpaoFPDJkNqkXH9ieY6ewKCXv7qiBEhTYTt9+pvQ7UKZFNYPl0ZXn2FwoxjhyN3SoiDHuIr6QLp6baCQbj3Niu7SP29XJsRoEqG2DfRfsnFOj4quEML5SE0vISguo8cfCgTPXVinTeC9VVtyqx65dagV33vB7TYGz46/GBFNEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjwVxX4GgIrAQoSzUjcjTbNJwYYZxd6+6mayAKz3JtU=;
 b=Dax8dpeRQJNFqEhNGHJhsSYPuF43nWL/aR5pUff6noAFwBWgMQuSzE4BL7ntgqwVQHdncMP+hmZt1MLr4zOBsd4sk0uVwDo7TjB98buc8eqU4mA0FveZyKjIMODq+5zEWLU9OpONzfdgtSxPSa7YNXqW5qT6YdNM98ch2LusgppMsTKj8yod7XOwp5zMWBlTMWlZsAOoZ/itJV4X7aGq9T11+Sm0y169yCNVBdtUho5QPX/IEc6gvU+3l+p3XwpQKisG2ZB/C70cXTQk1Z/Ky55ilfObNmo7oJ19sLp+oC/K3mcaUyl2GgMdmlYatdE2TmVJbHti426GAXd2qpkEBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjwVxX4GgIrAQoSzUjcjTbNJwYYZxd6+6mayAKz3JtU=;
 b=W9Y4S3+IpzqVGGQUm03nPFM/w7U8NHdORGcZjp6gnL1uMZGsbh9DSQIIFWQ4iIJmCJS3LmC4zvwHRzQpYyFP94QUMeg4cc3ClfhnZ7cDHq2WICLed8Xab3/AZNcbrIsiBvwo30Lxj/t891tX6mVgF7GPsoEtY9safsYdcE8CECk=
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
 <20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
 <20210701170009.5a8be33f.olaf@aepfle.de>
 <48cfe27b-70fe-36aa-833a-7d78e205528c@citrix.com>
 <20210701171819.67968d4d.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dc9af473-b613-721c-87b8-d259a2448c09@citrix.com>
Date: Thu, 1 Jul 2021 16:25:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701171819.67968d4d.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0256.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ca967e3-da94-412b-5dfe-08d93ca46e0d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4680:
X-Microsoft-Antispam-PRVS: <BYAPR03MB46800E081772566FDAC3F370BA009@BYAPR03MB4680.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VBIHtrEeW7g7sgbxbguMX1tdpK/bg6/tlIs1jb1LZ/RGowor7dRaJKOTyvPg620dtx7wuuz4u46nJ8TT41PGvBLdTIxYtAlFojK87xTLZlQzHAR4GKffz27O1HEC3mrxqFCCBcKQx+d6SKqvXyz19q47vx+HLQplYUHk+pYYIHJLYi+LiwuJd605wO4duLlQ+imA21gSUc2SLYSyGo7nNtJDZOIpOhapXO0b1TkdZMZfNeXcRsLOg5AywJP3IBwmd7N++gNeAJx+h0R/PeiZsjr8l185QjAbaQOehWlqrh7nKX7Xya6V9U5Tr2TkKmwCiVDxv1u0tHgAAxJ9RT8n5K5TX6xjCoTbWM/9f16sweANF1FRtkmegmUDf4kSlDnCc5VHsy/xUITjnj8qBXWISIQqo2Of1OVPxafZSCSa2IA+sXTwvxTiDtWMXbe/x4XVt+v0IEEu9emY6fo6qUTsXRvpdXFGR2UhV1HXhTIrLoD3IMYD8adAEOq0eAg6AKK/xCguX/hWg9tsDJ62G4dfV/zmxEAT4w0pe3b+gqwnkUeAPMa60O80gWwrCqgB1e/WEFplE3baR1q+dhYMIEb25KqeCCV3k6gAqBT2Hzlz6IkhY4VMhcxG+UBI9SA6C9SpcEn3mzakvEkim6W5twINKzGZbHiK4pxinl1NcdjBUsTp4/OaI36s7Amm9mZmsyJDXwnuMjGgxO2CkP7FU6p4CDBMEwJ0sn3TmAH0uk0tzZvMSz1U9ZZZHa/amBm1aN21
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(8676002)(186003)(83380400001)(16526019)(6916009)(53546011)(38100700002)(26005)(6666004)(31686004)(478600001)(5660300002)(36756003)(2906002)(31696002)(86362001)(16576012)(316002)(956004)(4326008)(66946007)(66556008)(8936002)(2616005)(66476007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?GreJc3SMVHfRXYwURNJzmrwnk6axbm1G4rK2Ee2c2V/6kBOeZ4Cna4nP?=
 =?Windows-1252?Q?Cr+wZuNuIU1ks3woRGFpYp5XWgfKASzLfKStnvgxEpDyjQCexF1KN8FF?=
 =?Windows-1252?Q?nGEBNiMdgUgPJ54gEjalXwEwJhl2KzA3nsyZzwP54vM03pLOZvG3aw2s?=
 =?Windows-1252?Q?3lHFPEJiVy+siseGAzaOKBSm4WJNkg4k5gBnwUICD23wIsKWyEZ4o+tI?=
 =?Windows-1252?Q?Q0cd2ir9Dxx7pkTdrlUhjexQxY6esQYIYfCHprnJF8EaxbAypBCrUvSK?=
 =?Windows-1252?Q?UA6oX+pV5sF/laCOO5KMwvCqalF8aV3Q+SO4Q3NZKWkpW6H5YqN4JBMl?=
 =?Windows-1252?Q?s0m5N8axsFDgOj2aJMREfqjuIrNV8BiCB6RTfNToDhtsLLHb0Q2yZ7Si?=
 =?Windows-1252?Q?Eb+2dm1BcqsB40YwtxzYbi9ymUTnMJnaS//81cv4T5JI29tHSxaK87LG?=
 =?Windows-1252?Q?o0joUKp4kwL3tC4DeL5J1ckwilY4ESAtkVadS2jegzuVGFp1ChR7KCpV?=
 =?Windows-1252?Q?Hm8n/uMad7fyPPRZWzj7IoEJu3Y5gq7MNaRAh51/mDavU+JH0EO6nEVb?=
 =?Windows-1252?Q?V3MPRugXB+MLFd4xQput38semNl4SLGUA8gAMTMakqHBvKd0lou+3cJW?=
 =?Windows-1252?Q?UarDYrAhcsT7WWUU9HWB3tmCTvtFbmsxRAPOyYLrJi1O+x/QXK2zsMEY?=
 =?Windows-1252?Q?0l/RNvlM0CfN9YWfwAi0XWrufD9oYTsT97idg8m8ApcbC7hzEuLu5+It?=
 =?Windows-1252?Q?ay7sJ5e63VC7pT7jsfFiNTsB2SHRI4CH3ORTjRpUGkH4iyfPiKqF3DrX?=
 =?Windows-1252?Q?zHCQKBAJG1BQKC6SwVlgI05kNhoYfZIN68qecRHVx9dqpMyFwH/16WgN?=
 =?Windows-1252?Q?Qrl5J3Fh3GZPVGfHQck15LSpnFeJdaJPWywRoyU57cPZWufznQXYny00?=
 =?Windows-1252?Q?2cSjEJ2++AfJru0Jeyu+GzLgwmTz+Jg4itw8dzcTponruErL2XDCZs0I?=
 =?Windows-1252?Q?FEKcVOqtoanbxamUgz+/qkKq4MSrkeqD/giwQuzPn1RBILctvwEMbIHV?=
 =?Windows-1252?Q?UGL+1Nex75p6XxwoNRzTeNRWSF76WOF9xwSKd6hacoH1toL0n91mu3j4?=
 =?Windows-1252?Q?k3qsTp0CxmdqpHzgPfXUjnOk54MyvCxEK9IS3Qeiuifeo04aq5Uq2+WF?=
 =?Windows-1252?Q?cdiwJjQeX9z/qhExVeimlxZ0ZSUa1u1uRAcY0gQjG9nQmdvaKt0JDRCG?=
 =?Windows-1252?Q?QSeBFqGZ1UNbQAG/Ld+IrMapy4B97f4usATSpUtgsowQ+BfL+IMCjD0P?=
 =?Windows-1252?Q?n65biZQuMgCMHhnHSIdclOe0bqXJ4d6IVFRLJscRb0YBwj5q81Yvue6C?=
 =?Windows-1252?Q?s3irPoe2ab5e59twv/XFzOwFy6k3PaEMAS6phikJSKoD8t3nswiJlGkk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca967e3-da94-412b-5dfe-08d93ca46e0d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 15:25:16.9757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrYH1kp6hYoUOuKDajInr5xtH5jj/A6gCwYLjVWMxXEAKI++nwvSi2stIgeAcgj+kHWTg+LsNnEwgB4G9dRJfFgxBEbcawVFsgJEzL4Erxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4680
X-OriginatorOrg: citrix.com

On 01/07/2021 16:18, Olaf Hering wrote:
> Am Thu, 1 Jul 2021 16:13:21 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> That logic is definitely incorrect, but using a different constant isn't
>> right.
> Yeah, that occurred to me after sending this email.
> I think in the end the values should probably get closer to 51, not smaller than the current one.

Can you give this a spin?  (Sorry - I'm busy with another task right now
- I'll do a commit message in due course)

~Andrew

diff --git a/tools/libs/guest/xg_cpuid_x86.c
b/tools/libs/guest/xg_cpuid_x86.c
index e01d657e03..e1fa33d708 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -513,7 +513,7 @@ int xc_cpuid_apply_policy(xc_interface *xch,
uint32_t domid, bool restore,
         /* Clamp maximum leaves to the ones supported on 4.12. */
         p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
         p->feat.max_subleaf = 0;
-        p->extd.max_leaf = min(p->extd.max_leaf, 0x1cu);
+        p->extd.max_leaf = 0x80000000 | min(p->extd.max_leaf & 0xffff,
0x1cu);
     }
 
     if ( featureset )


