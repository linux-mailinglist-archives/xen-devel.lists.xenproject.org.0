Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CFF36D6B6
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 13:45:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119262.225676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbibl-0005xe-Sk; Wed, 28 Apr 2021 11:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119262.225676; Wed, 28 Apr 2021 11:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbibl-0005xF-PP; Wed, 28 Apr 2021 11:43:57 +0000
Received: by outflank-mailman (input) for mailman id 119262;
 Wed, 28 Apr 2021 11:43:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8fo=JZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbibk-0005xA-74
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 11:43:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02dbc3f1-84c9-4055-8c0e-8f80552a42a4;
 Wed, 28 Apr 2021 11:43:54 +0000 (UTC)
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
X-Inumbo-ID: 02dbc3f1-84c9-4055-8c0e-8f80552a42a4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619610234;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jN+ndvN9/DrxVG3muYUg2aYVO7Vk22ndV6F7PGNQf7A=;
  b=QESqDbc9tjyhr/A+Lpbi6boxW91dOzahwfNsBNt8mDEsDzxIUec+7inX
   P2wuepDmjhEyu2vihpoX3JUuP0MaW/0OlakTdSwUgFBbZ1OAcIhfyiGMR
   oVUMJ3iEpmSa4xhhb4ZrucJrj2vK9nJSJxU56BY+HfNolAlVDqJYn/dsa
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: T5HGxE53Z6Z6jB55asCXhL1K51fCaAxt8eVcYKjtZfusPHPnULYk30waoNzNuDUqdXhxr7dBWI
 pb5pDi7V8bjd2EtvtwEgRqeMd7Pu2agAaPqWZuJEqN/C2tl0bbsAdFHbj0vGCqT+eR6uqpWeB1
 RGiDwbnZtm8I1bMyNh+GAoYopC0Cosip+YuyBaf5ZEPB4f50W+iH2j6LnpXs/mf+oVOjaoDspU
 4VVpgQYp1jB2kZm+a1i5V2zacOoZsK9S7TdoxkQvG1js9o3BTNy0K8fOhEFfEhRFOIfLjYOzYU
 vsE=
X-SBRS: 5.1
X-MesageID: 42607899
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8csJfampuHVYFjbIsYN24p9amh/pDfP+imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVybysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CT4FFw0NHBh2AEktwLTM2YKYRMJ
 aH/MJIq36BVB0sH6eGL0IIVeTCuNHH/aiOCXI7LiUq9RWUineQ4KP6eiLy4j4lTzhNzb0+mF
 K18TDR26PLiZCG4y6Z7UD/xdB8mNztytxMbfb89/Q9G3HXpSuDIKhkU72GljgprO+o80ZCqq
 ixnz4Qe/5dxlmUUmapoQb8+wSI6kdQ11bSjWW2rFGmgcvlSCk0A8BM7LgpDCfx2g4bk/xXlI
 dotljp0KZ/PFf7swnWo+XsbVVMkHG5pHIz+NRj9EB3YM8lR5J66bAE8Fg9KuZnIAvKrLoJPc
 NJF8/m6PNfYTqhHgrkl1gq+tCqU3gpdy32O3Qqi4iQ2zhSqnhz01EV8swZhmsB75IwUfB/lp
 z5Dpg=
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="42607899"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mgc9hEZ53b1cb7EDcyd51+epUwxeZhb8ujg7RMjPkmcokANO6JoGRND2L2Mump231TIgmuNwXCHPsqFd6Hw48KTakhbkzG2BzXsm0viwTqkkUM/ZcQut+aYqQ2niV8wq74tTV1dvsgnxwl5+tmO9xYnaT2YfgriqPf/ArbbD2UNGq/NQqOnYkYfNb60AzNXYXpq4i3b0jHHdaYR7BLRmMXn3Bcon1q78aPualh+OxXNnJMz09tVB1tunpjYIj1H/0lC8PjZ591k3HqjOHjbSMs7YzyGLaVCTPgDqdt2YqFjxvoQjax9p8quDaDzv823mieIuzJ84LRY2DChIYEWTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN+ndvN9/DrxVG3muYUg2aYVO7Vk22ndV6F7PGNQf7A=;
 b=hC3z6p/ZejZ2mYpOBklLJzdxtkVx03r/oR1xDZAymx33XTYYCvehAW6geT89AMS0DzXNJDDqs38ZYLdL6cwjz5q05t2fQeVn2HMhJlQXcss4LFy2YBD7rvBUIIu+Xxv/TU/M7A1ZgsqAailSBx6wr9YIlnxoAh2qtn6XiZdTyvdlL1i0YBWycLO93ig2Qlajz2dalTA/gyk6NS9uUjEDggQdNtZ6BwjN9dIOyZord9DXzVchl47Tx+qe7pZ3fq5uu/BRVVba2etNeWV7kUSWVb6tXd83YdRFkY9rlEMJH7zAfPssgzxJwjSkwbjKYdAadp6YhvjetxYs9EKy9nZKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN+ndvN9/DrxVG3muYUg2aYVO7Vk22ndV6F7PGNQf7A=;
 b=raA3m8IAVABFRSqy6GP0mJyojyiVDxWe4C+Gb9qOn2U0pLR4SgV/1Z4X8emwq60VPOW8AsSHwS7FkpVO9TmTLmLnwP1wveGGJUj5yHLdAjQEzhkkUrbYo1BFiLGF4Ts0rUWeSUZb3EYmJ34sISUAySwOvx7Hufw/jDZgvJL88sE=
To: Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <20210428095049.14a8272b.olaf@aepfle.de>
 <8427397f-0953-94df-04f6-8dfe2a4ceee8@suse.com>
 <20210428121701.3272b369.olaf@aepfle.de>
 <d508af0b-dd4a-7c13-f33e-bc60a4fb7272@suse.com>
 <20210428130346.2477ffda.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: obtain a list of granttable PFNs from toolstack
Message-ID: <efef0c49-aa39-8df2-4f0c-2b4f86795956@citrix.com>
Date: Wed, 28 Apr 2021 12:43:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210428130346.2477ffda.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 844a4a75-82a9-4283-9cff-08d90a3ae498
X-MS-TrafficTypeDiagnostic: BY5PR03MB5032:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5032A44B01EA6F9C2C0430CCBA409@BY5PR03MB5032.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R/D36/4jZa15FkXzPn6auJUDvsn96WpYrIrma53wXyNc9je1IyKtGONgVem4S6WzYHuqmtXlE2wjc7KOSSmLxjtfLvTZH0/I4DGNUoVutUySRovmB2NyIMLKL18kfiyyb5Szit2V0YYGPI7GZ5diAaEO86PMCzckrFvHJ0jg7ZB1VGEhnI8nErn2QyVkJgRqG7PAiuyt+Q/120i93QYdRbWVWrk8F5TfrEJsULMGj8st0WU2DHKAIKorew/iFGZ9NZtnffWMKdkbQCfx02iyMrrcPLT4w+FVRRucXTADTusNDBbdKlol4eSW4AMQ0xYUt+TD+SWmw24o58RTAJDGuPzl9BLz9OHm1q23AxkET1row0vcYavrwgCrYxTYIn/lqnvlZstAkomu8wyFjweCvAG5htNrv2X2/76u+uOMYOLGe7+V3locMUPMilPYZGIfjd4eR/udRgDJse1hCeCAC3z7I/6OE95m3xLzn0UFEsWeAT8J5iHKbIuTtMxvxlqg/Lpc1gmZZ1z+tvEYsuX5IWcwGqbsE2tYVkdaQc1Y9WlhqVdlZcAot8Y1HJ/KPzddGVXvA48qXcS68BMXs6E/fDBqcNT+u9wyTOha2gck2W49hJypIofhNg6VkTwRHVri7xy7BmwWfMb/DSHz43jI2dMY4ezm9yuu5OZgaL9/2xn1ZgjcHzqxXSCFWDq7rATR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(53546011)(6666004)(16576012)(83380400001)(2906002)(6486002)(186003)(16526019)(36756003)(26005)(86362001)(316002)(4326008)(110136005)(2616005)(66946007)(956004)(5660300002)(8676002)(66476007)(66556008)(31686004)(31696002)(8936002)(38100700002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?xtLn9mTnkSDizUjznTdJGs0sSlqOVRudNbB+FGs0KB9FHdOu1RQzGHVp?=
 =?Windows-1252?Q?be+cwEdYOi3Kw89xj7ORNYry6gYxs/qnwDxcvfcxBgT0V/yM4GdJA29r?=
 =?Windows-1252?Q?kkz6cTYq8W6jqaBWe4PGbgvuTdiHtbiNFAmGMbT8cGdkAzp4x59ZzZe3?=
 =?Windows-1252?Q?CRtogvorvJErhoExYdO0Gf2xenaKpxTqoRqfNO68cHHYWTwocmKv3YT2?=
 =?Windows-1252?Q?fCYrnCghWs4Ycxi3jHaJGMoqe6x8wlAv6GxEoRbrOr8rZv6uIwcCDQHo?=
 =?Windows-1252?Q?xpv1C75c1ElWSWk9//N6eZSK4F58GFFeJLXXlB39+OhMVOgSfrDqUceq?=
 =?Windows-1252?Q?M64P8TVFMvuSjh1XmqXip7zIEry7WgX8g4UZCd/dsTmXvf4PcGmNRd9Z?=
 =?Windows-1252?Q?rZ49Tfb09kje2M8v14Ci0PaR5kpqabtllBaym6Z7Qvc/Q0KIwhvQUZcO?=
 =?Windows-1252?Q?eMIzo2w3k4JVaIc/GEObkTHnUW5JI4eSWxxwIpDsaWfEXRTpS9e4tRGN?=
 =?Windows-1252?Q?I7Pv/nAYtMz/br47zFIdFCLmXMDRO4lx+BjsMwJALcN4AHEHl/EQvOvw?=
 =?Windows-1252?Q?nYIQke43CfGovGhUCC+u3c5f/g4T0nBpoQa+rCWy2VG2J56/tlBFRA0O?=
 =?Windows-1252?Q?J0c0H13SDBaP4Li8vQNJ6FQm3vqc5W/Q3mjpW2XaKLdpDLypOoKPwCTG?=
 =?Windows-1252?Q?Uzr/WKC5LBCWtiOHQHC9Re8dQszMitrC0u/6iV/xgnW+T9ep7COTWxOB?=
 =?Windows-1252?Q?oDhnRRZnLuN50VlGxAo2tRTu0h/5+hhHSD8jP/X2Pmo77uZdz54OIYbn?=
 =?Windows-1252?Q?ApaR5lTp6fZ6dWpwN8ZwfmNLwXpdndqIRY6LPCRFBLbqo5izYwIJWBKK?=
 =?Windows-1252?Q?KFBpzh3gQXyadmheVxN4AB7UjceedVdy+h1lzeF1Z4+J3aQfjS01p0Wt?=
 =?Windows-1252?Q?cLb7B9panjpIM+3TVPE9Hht3n7/hhX+Hmp4x5OPqVJGN06mUyTycXwNq?=
 =?Windows-1252?Q?4Vskx1YCjuzr4HL466qDJJjikEn2fhkxIeQmVcZDOk1pLc0tRKigS3Ot?=
 =?Windows-1252?Q?X7ajY7yepRaj9B5zM0MW02DTgI2NKgyz5m/qzppQ93B6h/rcqoNQQCJ3?=
 =?Windows-1252?Q?+DJuP42VjTZLEZI7UGUeASkSekBSDA/i9kbHLOnUTVsb+ewp8v60A68Z?=
 =?Windows-1252?Q?V7B/nJccldfJXmWVTjNSFIXKy9wGQ6qH3U+1a6AKDOiIJOxZ7WMINHA5?=
 =?Windows-1252?Q?wnlF8PgCDve7sSxtFcs+DUGX8FEVVbu94LIA6+69CeBPUPNGuMmIJwaO?=
 =?Windows-1252?Q?AKu/M3zzO39nsezylnJRqUbyyBTaw0U7W0dnJIdQ8TElBsVz7PQ8Bsny?=
 =?Windows-1252?Q?D20G9Mcxrui/j3LNzfpugi6BwvQoAa4S/ljvapCdlSBbkLdZbb9tUdS1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 844a4a75-82a9-4283-9cff-08d90a3ae498
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 11:43:51.1542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZ3TlqgNo8kVTYsrMWrWiuH9s/fZcwU4q635ZnIiFsMal3hnDLYSxSc1zbPwVbGdIXGgDLX2Ib3PKY+kPesEJgt7apMKHA6BhgTGDlA2aCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5032
X-OriginatorOrg: citrix.com

On 28/04/2021 12:03, Olaf Hering wrote:
> Am Wed, 28 Apr 2021 12:42:54 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
>
>> It might help if you would outline what you're actually after by
>> knowing a domain's active grants.
> There is REC_TYPE_VERIFY, which will re-transmit all memory of a paused d=
omU and compare what was previously transferred. Last time I used it a larg=
e number of pages are different. I did not spent time to dig further into i=
t, what pfns are affected, how the pages differ. I suspect the backends do =
still write into the granted pages, hence the question.
>
> I think the domU may undo all grants during its suspend anyway, that is s=
omething to explore as well.

Grants are not properly accounted for in the logdirty bitmap, because
they're not unmapped during the final phase.

This came as an unexpected surprise when I was doing migration v2.=A0 You
really will see `--debug` identify dirty frames, but its "fine", allegedly.

The reason is that frontends and backends can't disconnect while the VM
is paused, and will continue to process outstanding IO.=A0 The reason this
doesn't explode on the destination is because the guest kernel replays
the command ring.

Disks get possibly re-issued read/writes.=A0 Networks really does drop
some to-guest packets, and may send duplicate to-host packets - TCP
handles this normal mechanisms, and UDP is UDP.=A0 Other PV protocols will
encounter similar problems.

I didn't get the impression that this behaviour was intentional in the
first place, and its certainly not something you'd deliberately design.=A0
It appears to have been a consequence of how PV guests evolved, where
kernel cooperation on migrate is mandatory, which caused kernel
cooperation to be mandatory for the paravirt driver pairs too.

~Andrew


