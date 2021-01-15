Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A42F7C7F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 14:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68083.121795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0P6h-0002HR-5G; Fri, 15 Jan 2021 13:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68083.121795; Fri, 15 Jan 2021 13:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0P6h-0002H2-21; Fri, 15 Jan 2021 13:25:39 +0000
Received: by outflank-mailman (input) for mailman id 68083;
 Fri, 15 Jan 2021 13:25:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0P6e-0002Gx-So
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 13:25:36 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8be5720d-9f63-482d-b46c-20008a8053a9;
 Fri, 15 Jan 2021 13:25:34 +0000 (UTC)
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
X-Inumbo-ID: 8be5720d-9f63-482d-b46c-20008a8053a9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610717134;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I3k9YhIEIr9XW9anBa3Qmo+25cBtvwMTgsy1h5q7ZYs=;
  b=aCC0UXk7/59aH1E1GTY8HvUaJi3oZmwaMvmfzADBODRG/aX4ROiyExuh
   mZ6tkc3zBuyPLoulOMpn2uZm6Fh3b7OZDAv57lHGwfjEV5Qv7cD7Eb8W5
   JyGG1l4uCDf6fvmUch/bHf+OxMzlmdd8y6NWnolny8vQLwPYnYCopbPFv
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9lxNbR7EKl1czjOoKlKza0svA19QSB6S1FPNxDg8/vOxd1101nywSiSurz6pbQu5/PFiL4W+Gp
 Xfu/E/ndp6ecgC0EjXT5bBN2H58Yu3gbSz+bjuGH2KQ9KP/68ck9FtwAylpehHHESGCNXzZYlj
 SY3+xldbFwkHOQ1KxYNp97xfP5S9RdQFsQ/BJnzd/ps+IQxlldIMkieljIGOhANdas+sHJSc3u
 Xly+iPmUglL0C/tPPFzIvdrPrtiGIXnHTpaOgvtKAb2BinDowMB+IkhnI9BPMRhXJlgSLjisZb
 Cig=
X-SBRS: 5.2
X-MesageID: 35387820
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35387820"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDvd4HUgx6BRBdjPPwIgtxCBy6cnf7qJvyur7rAHBgd3GGd2u0OW/Q6FZjoz3prceJp8/RAsejOM4KBq2/2SWi287wMIjJHzXSRQC2rC4BEDuAkR/tS6AzIX6ZJjd75YMojDcHnStH7+9maA4LcgD82PtEk63uDxt4vma/LYoMv80dwd+TBr7ftDGv+IxsD2X8uFH/nyBvmhl+b5adzswnEH+aSoIP4emvcQfxZwBRkU21uf/5QxUdp+a5jAqBepYaHJHZtaKmTG2wdil9xq6YClFK7x2v4JWzodSq8D7j9/Eyh2D07dCWGrzlJDPzK3PcdkFPIjCE4rUxC+MaRh7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Dtku8nyGceGUaZICcWQCXlOBSr8iuIjAmWR0GN3LmE=;
 b=aA1dWSUJutEj1WFG/6nxDibCGfO6GekFNSLqICOFMpJBj66MKV5LWz1WoNMxgqB1VP7/yB5YkUTgtxRd/DEjfe2W98CN3DXh+Jekcza3kexIevW8qAZGkHXWkrA9c7BBjyiS9dT8HHz/b8x79QnkCNFR/3qk7Frzcp85n9Hyjb3w4avJsJf3bUtGARThoSqJKcLznIzeozdZpAoZ1yy26GmegHrLCsOMzpSTAt+R2r55EDQ0GWvvr7VrgekkuY/x5beiFsh5FMsDXLlsYW8VbJSOgNqsDa9+ZRHOi7kxvgqv/wA91QuVrtZkU4Y9gvXAYc+oXxIqMg0RnavvlOP26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Dtku8nyGceGUaZICcWQCXlOBSr8iuIjAmWR0GN3LmE=;
 b=OZsm3ai38yKvm7FDwQH07Lp+NC67UPcYOlkbETwkaLpMBdgU9UMNHc/VmpOLeheMwxKMiGC8A0Ju4expUhEXpTcg+mzW2BCl2y3eBK+f71PDOcm2Dx6H+njzsrbOZtZY3jJ2ZJo4A6vhUo5ZS0dNqGtKVFpBeaIiANS0fG1z9vc=
Subject: Re: [PATCH 2/3] gnttab: consolidate pin-to-status syncing
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
 <5e84b80d-4b6f-118b-c2cb-071e6e774db5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7a3e008c-58cb-8bdb-ed7b-2f3a724f0358@citrix.com>
Date: Fri, 15 Jan 2021 13:25:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <5e84b80d-4b6f-118b-c2cb-071e6e774db5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0491.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::16) To BN8PR03MB4721.namprd03.prod.outlook.com
 (2603:10b6:408:6d::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ecc8873-222b-4c4e-a993-08d8b95906bb
X-MS-TrafficTypeDiagnostic: BN7PR03MB3492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB34926A55FE0DAC7A92914E64BAA70@BN7PR03MB3492.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwsuPsWGSCtZSQ7v9Fcj14gjgxdxPvXMfN5Pdc1gbOmZ8JYBOYuznJfsaJPdYBdjLAXXMtYsxCe9g9CGgLd3I8+aP/237251eaMwdgQaEPoYI2fYfYqlA49czANgn8TXBQI4KseSiRTdKL0sP+nRhCmFhJyFCP99Ns3tLBXghjdt03Er8j3aJQNEjIws+CwefL5u4wLgxqX1n860dY6mzqPTp2YZO6F95DC0NeyKnJ8ivJOVh4eTyzb+P9+JNmob/IV40AQ3YzeROiFwe3cIwO6BV5FHfgaf5pXjrQFMcFeLxrnYe0bPrkZpgE6Fuf3GtP3gPkd2JhSU0fyQKVp5xKwrH7Bo7QDWJX0yufuNLhLEpfRyiZTrcB4fDXffTXDjHslLMveSwTA/GNWYohjRyH/AmcyYnZKz/IgyP71XjGmA7bIEHD1Xy3eV+m17Dr0JYUEh3zSIBgppvCjv20J4R8GwSk4+7S5f/YW2XNFnAbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4721.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(6666004)(5660300002)(54906003)(31686004)(110136005)(53546011)(8676002)(478600001)(66946007)(31696002)(6486002)(16526019)(83380400001)(2616005)(16576012)(36756003)(186003)(8936002)(26005)(316002)(956004)(4326008)(86362001)(66476007)(2906002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1pOWm9ONk5QN2ZPbHpFWEJiREUrNmxFQXZxdzVERU1vRmowZ1BMdjdrcC9F?=
 =?utf-8?B?ODBiVFF1aG5Zd1FuYUM0dkFjVHRlQ2hCUUowZDVGWkpYZjB6aVppVnJ3VS9u?=
 =?utf-8?B?Nkp5eFFieWtnQXFmamtoOFMyY1E5Q3BnS2duSHpLNW5meFpPL1czUUFMQ0tN?=
 =?utf-8?B?cENpZlF1UXdHYzcrS29kYmptWEdzU0VKc3E5bGVrL3ozM1JEUWZqSkRjYzVC?=
 =?utf-8?B?V2ZDWE11c1NqRTFjRmxqOVVkZ3psSHZQNS9aOU1XUmplMHdpclN1dTUydWJT?=
 =?utf-8?B?d3M4U3kwbjEwK0EyTGd3YzlZL2V1eXJLWHY4VXh2bVNSRGpmV1ljeUdsN1c5?=
 =?utf-8?B?TlJrckM0dmtrN2xCNnRqWHU4eEtYR0VZNWQyRFlNaHRGRk1xcGtSWGRXT2sy?=
 =?utf-8?B?WUVBWVl5QWxhWDM1Tk1LSUtHcWtqL3NISWhqaDFUQXl1djkxamp4bkthZDlH?=
 =?utf-8?B?VWUwazdmZWhzZUx1a0xCd1haVE9DWjJpVVAxT05lQmV5dTlKODliUGFydTdt?=
 =?utf-8?B?TWRYMDBFMElCVFJrRmZIeDF1Z21XVEtFbW9WSzJCb1ZYUzA4U2NFMlJsU01G?=
 =?utf-8?B?bEo0M2FrazNjZGtCUEViUG5KUkN3NE1WWEZwbWF0eUprcVB4Nm1xcnRidlBU?=
 =?utf-8?B?Mk5WamRmS3Jvc2hob2JpQmFBclV3OGVQNHU2OEdaeWdad3RZTlBYTms1TlBD?=
 =?utf-8?B?OW9ueTUzR2E0cGhsV0xFU01MaGxLK2NrSk1qamR3SnNIanRoQ0tXL2h2b0Qr?=
 =?utf-8?B?cmNxMk5wS2Q4VEw4eDFZd0RCWUJnOXZBVllIUkt1U0R0cTN5U1UyS2pCOUxx?=
 =?utf-8?B?MTYraFFVbTNtRmxMZkVYYjNjMnh5SjVleGFjcmpjVHFqOExHTzl3dWVBTkU0?=
 =?utf-8?B?TDNNVFkrYU8yVmhBRlFMZGw1NUtNNW9nTWdpUWRxTDNUdERkVzlXeHJJMmx0?=
 =?utf-8?B?aklKRFVSdEhPM2Z6MVV3b3I4YWpwUGM4VFdvMEhSNy9yMUhJMjFIL3JuMWlB?=
 =?utf-8?B?VVZnSmxGaVAvYVgyYTFIbHdpd0dCVE84RjlqN1lBakhOZXVGcGVzc1o4d3Ix?=
 =?utf-8?B?SEJGMGZrSzNQUUxLYmIyMU1TWGlmSUMrZHB0WWxMUlF0Mk9GOTE2OHZjK0VL?=
 =?utf-8?B?cTdKMU5lb2R1Z2pydzYySVg5QzlsN1ZDUUlCZUJiVGtEM2VIZWRqakN6Rlhs?=
 =?utf-8?B?d1hZUnBBeFNOcU9Sb0hsY0xVdHZnTmVmQzc5Q0xtb1NDcUdqWUdzeDNrSHNB?=
 =?utf-8?B?dW14ankxeGNNOElnMDg4UGl4WXlxV0JpdUFCOTdhNSsvbXlaN0JpOHB1S2h2?=
 =?utf-8?Q?rcYUA5IDxZgY6ejYhWXMjjskdWPs51VD0s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecc8873-222b-4c4e-a993-08d8b95906bb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4721.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 13:25:29.0784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TuZApiIGyMaJRKtGssq7rjVk/54K9ncCdqE1CXJYRbOh1t8iraCpNYIDZVZOOMXOjgFhNZnDwLjFnNlXbOVG8js36Z6SvrRn5Cc7FLzd9MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3492
X-OriginatorOrg: citrix.com

On 14/01/2021 15:23, Jan Beulich wrote:
> Forever since the fix for XSA-230 the 2nd of the comments ahead of
> fixup_status_for_copy_pin() has been stale - there's nothing specific to
> transitive grants there anymore.
>
> Move the function up, drop the "copy" part from its name again, add a
> "readonly" parameter, and use it also on other paths having decremented
> one (or not having got to increment any) of the pin counts.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -908,6 +908,25 @@ static int _set_status(const grant_entry
>          return _set_status_v2(shah, status, rd, act, readonly, mapflag, ldomid);
>  }
>  
> +/*
> + * The status for a grant may indicate that we're taking more access than
> + * the pin requires.  Fix up the status to match the pin.

This sentence isn't correct.  It will only clear status flags to match a
reduction in the pinned references.  IOW it cannot be used in the case
that a grant goes from unpinned to pinned.

How about renaming to clear_status_for_pin() to make this clearer?  I
don't think it is worth trying to make the operation more generic.

If so (and with a suitable adjustment to the comment), Reviewed-by:
Andrew Cooper <andrew.cooper3@citrix.com>

