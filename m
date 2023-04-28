Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457BB6F1A27
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 16:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527346.819907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psOjH-0002fb-GU; Fri, 28 Apr 2023 14:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527346.819907; Fri, 28 Apr 2023 14:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psOjH-0002dG-Dk; Fri, 28 Apr 2023 14:05:43 +0000
Received: by outflank-mailman (input) for mailman id 527346;
 Fri, 28 Apr 2023 14:05:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzbF=AT=citrix.com=prvs=4752babc1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psOjF-0002dA-Jz
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 14:05:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c014df37-e5cd-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 16:05:39 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 10:05:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5775.namprd03.prod.outlook.com (2603:10b6:a03:2d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Fri, 28 Apr
 2023 14:05:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 14:05:32 +0000
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
X-Inumbo-ID: c014df37-e5cd-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682690738;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z9IWpLZRvNTWr7HyvAvD+tzvrcLV5Ffmvh7en+qkInw=;
  b=iLyDSxmRHVzYTwCiRUvawBN3tJO50O154tTiPRknnTkiU7eIAGdROeHV
   YDqwVgj3mYIMmXSN3CKJZxUsKTjqtlSD6rAOEdhla9k5kxSJxuKoMhC7W
   GfKcgDst6GXy8358e7Q0bJFstzlHifnrNE8jGQfBxnlBO0eMQ1OJimWz/
   8=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 107632353
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SHx9KKy/A5h/SL5IR+56t+fMxyrEfRIJ4+MujC+fZmUNrF6WrkVRn
 GZJWTuFa/iNZ2OhedAlbtnlpk0AuJCByd5nGgI+pSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiP6AT4DcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUxyr
 fxANhw9Uh+aiPC82ZCcQfVHie12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQruFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAN1MT+fjq6UCbFu79HwNIwwNcGqB/Keal0mzRd5nc
 ndLw397xUQ13AnxJjXnZDWxpHOGtxgQQd0WDeQ+7AyPzYLf5wGECi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2UPeCsFRgst+MT4rcc4iRenZtR+FK+4iPXlFDe2x
 CqFxAAlnKkah8MP06S9/HjEjiiqq5yPSRQ6ji3IWkq14wU/Y5SqD6Sq5kLc9u1oN5uCQx+Ku
 31spiSFxOUHDJXInirSRuwIRemt/6zcaGeahkNzFZ488Tjr42SkYY1b/DB5IgFuL9oAfjjqJ
 kTUvGu9+aNuAZdjVocvC6rZNijg5fOI+QjNPhwMUudzXw==
IronPort-HdrOrdr: A9a23:UAZJh6kH58m77v5fY/YbMl7fk83pDfIK3DAbv31ZSRFFG/Fwwf
 re5sjz8SWE8Qr5P0tQ/+xoWZPwJk80kKQe3WB/B8bAYOCLgguVxeJZnO/fKl/bak/DH7VmpN
 9dmsFFYbWaMbEQt7ee3ODXKbcd6ejC2Ly0g/zT1nJ8JDsaEJ2ILD0UNu9YKCBLrcV9aqbR3a
 Dz2vZ6
X-Talos-CUID: 9a23:P8eHv28tX8mail/IL9yVv2MoQsB9bFHt8HjJLF2yEEROQ6G+RnbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AoIzsFAz79BkKVb1s1ItmxgVhESCaqJa+FmscirA?=
 =?us-ascii?q?3gZTaFjF3NimRtG2MHbZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="107632353"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H73FYkH4vY5t+VjGqn54K6qrZYctbi1C0Bcn7MY+te6JB8TpeFGbuctgr9LWEk19RIVwenlorK/yplvusuJwPNj8fOBWGTOASsgQXR0sny04IP6RqP5Tr49Snrcq8a/0f6Uj4umK6vGf4iNIBgYHWB1eqmweMLMHOpQBWi982kzG6U7erz3aGisFd5mb58qEpCIBWd5Pdgwal69/JGwy53Km7Y1JrOxZmW8W5QB2W+EzCCJ2+drB57k8SZPUMqMKC1q/G3JFg3uEgwUm5cNazJSFi9AJu5Hb9jdf6cirDmTlT1LHJujeL4jNLeMfpzzF0ViFqrtB7AatNJrWwts93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmXfpfamU0nc/ZxZH7bT9Vh4vN5MLQouDVIikVOw4Y8=;
 b=kMouGy5PGMktCeDGD4ZN7e5q3PUyLEZ4oHn2Esk8ywSH2dvrgRMtf8xfiEJ9xCahFUwNEteU0bq6QPTtOFgWrtPyOV3Y7n0wamXc5JBrRrvB2qBT2qcQWfrvY64tF2UnaPLhBtNAhw0VDjzkS54w5Gg8YQZsAoQAPRCeWJaInqc2JV73VIUHGCSnGDDT2GhJTpKRTJ8W/SiSqxCu87IcxaIkr9RCa2MBc7KliH2ytNEcRxxzvaVV5iuJ8w6mSw2P3GlK0HIeiKF1Ro5K8gq8Zx9UwiM/tpThqVJs6hC07l+O8yPQlKlHnPh7YynkIZKONx+tpEfTIi4CWa0pvQQV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmXfpfamU0nc/ZxZH7bT9Vh4vN5MLQouDVIikVOw4Y8=;
 b=HCpCdS+GfWZ+frC78i8WgyU90pohdl9GtA8LmYEH48ExvoulQyjxTk9SsPbH9TCVPcyJ2bgg/JqJ6Rmcx4vWFALMyPe09ESWQOilZu5f0W+1N7pruFi8KxMR3MP2P1SIIHBhqrrQA/sRJ7YD3lSh6bw6vHV2Q4pOo1y2ppnDKKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b2339ed9-59ab-e758-0180-f3deca061198@citrix.com>
Date: Fri, 28 Apr 2023 15:05:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 7/7] domctl: Modify XEN_DOMCTL_getdomaininfo to fail if
 domid is not found
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-8-alejandro.vallejo@cloud.com>
In-Reply-To: <20230428104124.1044-8-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0645.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 860feab7-08ec-45b7-50d2-08db47f1a146
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CMBA1NKDWQXUFBW8pJ4Hlz2l8fgINnQ4WfYElxebkZttHZXGZ0f4jF1Lhx+sCQRZcJzzhz5RsD8502FeuFJZ0iMsLT/zYZLtqSY+EV4Q5D+39YdVDebCxqlxNPNfFxftprOoRtPeL79BHE4ynFREYj3WCERMCBu33JrChVA3QfYgUXDgtvJZ9kRA3HhRablzd1yKE9lfra8PLw3Z4IJyU1DaKOC/PhbgUvRAWzU2fmDyW9szW7CJI6IJVXKR8S7AQ9bIT+HZKjOgunZKm4XJv61qyl03HEro7lVok/vhizyxSgqpZcJjT19/5qzHQGaZgjfb1vAPvslmewKFVcMRa5mXXeNFPx4X8+5IrQsQOaezLgCy9hxZEop3zAzVyMdX098a2f6eSOYRgakhFGoV2j9qHx6/B7TqIuvAsDgvu+np9Wol05V8qBR4DIKkScPO2NYkX7Ey+nYDQG3uW6/aG9WQVq5KgsJSLehNPUG4mi/IjndiZv31U2/3kt6hJpfLzMuVzCxkgYYc1u72fCvpwqN93xo/VxtuBhoT+0K+9lhRqZFpMzhuTkZdym98T1vAeLwBL3ay+ddpoG5LEfBXVK4YOEu6asHAYjf4B/axMxFvIzcG+2Vrl/wqInX75AWXOMCS3u8Id100cJIacrBLWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(31696002)(110136005)(54906003)(86362001)(36756003)(6486002)(53546011)(186003)(26005)(316002)(6512007)(82960400001)(6666004)(66476007)(66556008)(6506007)(66946007)(83380400001)(4326008)(2906002)(41300700001)(38100700002)(8676002)(31686004)(5660300002)(2616005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFdlR2trNElLY3Y5ZFplZTd1cU5WL0NlVHo3VU9Gc0hlVjhuM1lQbnNDaHQw?=
 =?utf-8?B?VFhYQ2F5MW1oY3R6c1VJaENFSzdJQStYYlZjdGNGc2czSFltYWZ4NE03N2NZ?=
 =?utf-8?B?Nm5oZW5wNkJmejJNSUdYdWZ6a0E5TzhDMzVtVG5sdXE4QlIwd0tXSm1nWGtI?=
 =?utf-8?B?MXdWdDJYUEljOUxHS1dPY2ZXSVhRZkJTVnNtbmE0VGFIbjBTbDNOSjN1RjdP?=
 =?utf-8?B?NTM5amFQKzN5SmdOUm9pVGsybXB3aVlWTkZ3dXd6V1M3aDRUUnljdk1rLzBZ?=
 =?utf-8?B?Q3JiVW9GSmQzRmc0NThXMk5qK2RabllQL1pWUUtEaFpWZ2xWT29iazN5SUZp?=
 =?utf-8?B?NWgrQUtMUDQ3SmJpOVZYZVMrRTNKRFdqL1ZDODNQaFdPSDhPbjU4TlUwSmNT?=
 =?utf-8?B?UlhCcEZUNDVHYndOVjZMc1Z0TDFxRlFuSVphMnRWQmtMbWwyYnV5Qm5oNmtk?=
 =?utf-8?B?ZWRpNzhxV0IxbDlZWEoxMVUzWjJCbVhvdHpwRnBjazJMQU1lbkZWektiQngy?=
 =?utf-8?B?TVIxVXhyUUdSdzRsZlBhSWpwWUFnbVd5SmZ5Ty85cUxSTWpOOC80L3RkZ3hi?=
 =?utf-8?B?eG5ERkRadGJLS1plSUR5dzlHMFlqOVRoSkM2SGFjMU05VHNsaGlNUCtjcXYr?=
 =?utf-8?B?VHV4YWFzbDZTajVCTmwrQW5hYjRIaTVGa1RIbzNITWh1K0RRYW5nN2dhTUxU?=
 =?utf-8?B?WHo5WGw4bDRCdjhkMzNmLzA0R29YcGNlOERKWXVnaklyTTI3ODV2eDh0bFRq?=
 =?utf-8?B?SHZ2Y1c0QUdwOWJoeGl3STREMFgySk1tQlkzTFRudVExcGd2SW14OHVDV2Ew?=
 =?utf-8?B?b0tVTFd3dDRxYndTcmIvcWpwVmRiSnh3dUdEQWM4NXZjWUxLaWc4alBKQVpX?=
 =?utf-8?B?aURMOXJ6VEg5b01UdU1ycnFyRkJaL1YrQmd0VHpDVUtGenpiQTQzckNMS3l4?=
 =?utf-8?B?VHMzelcxYWNwcjNMNDR4TzVudDAycDN0VExXWldIVWNRUnVoUEVRYk85YTA3?=
 =?utf-8?B?a1ZZdm1TdFRSUXpDT0FVbzh1OHIwS2dpc1dQTnh6aGt6dGxQU1gwMEtUS012?=
 =?utf-8?B?ZitrWkVmNzJRQlpVMVlXc2EyWVdsdU9vTFpxMGthMnpxemkrbm1HU3kwWFJr?=
 =?utf-8?B?RlloZHNoVXY5cThBbzgzcjZIUlpZcWQydU84WlAxQ2VudE91R29xQnV6cEJI?=
 =?utf-8?B?dkpLclBnQXd4TXRrVnZqbkd4eEl0YVJqaFp2UnkvQ2hFOXdIR2VNcXlJWFB2?=
 =?utf-8?B?cFBTSVFhYkZ1a1BaMmw4Uml2eWI2L09NM09NUU9ZZVdLSTR2SDJsYU8rTDNN?=
 =?utf-8?B?UFIySkh4ejFTM3dpTmhuQjZCT1pVVDJ4eG1WbTVuYyt0b1RGOVVYQ0tOUlhP?=
 =?utf-8?B?cnBTWS80SWFvbWpobWd4NWVRdDlySENBSjVRMDhITjJoQkhZTGQ1SEJDWWZH?=
 =?utf-8?B?bHVHNTNDODhQdEhQYlRiQXU1VHBKeld6K1VMZTNzcEx6bDZGcGZoT3R6RFYv?=
 =?utf-8?B?L1o2aXlMVENEQnhjRlJtYzg3RU56U3hZcVErL3NEMW5jeGg1ZXFTV1RyMVV2?=
 =?utf-8?B?WGVpb3ZZM3BMNTh2YVNOemFBdFlQMDNORHh6YUNqbFJZc0lDM3FSQ3kzbUkz?=
 =?utf-8?B?cyt0ZWl3WXBHRmZhRjRaYlhobXg2cThBVnBxOXhkQmJYMStkY05Jelc0SGlm?=
 =?utf-8?B?SUVWL0c5QWlvUDJ2WjJjY0dnUjRuTXF5NEt4Z292TmMySHEvVUIxamd3aFJt?=
 =?utf-8?B?aSthdDlCZHpLa1BlaWFtRGY2ajRLV3g4ZTZRK3RNcWVGemNxS0hHTjJTVWsv?=
 =?utf-8?B?MWFmS0dqSFVQUzIwczBGbXo4ZEUxdXB3M1p6Q3k2SmxrN2xFcTJQV1dlMUVG?=
 =?utf-8?B?TjRrNGl2ZGJBejhkbWpRV1A0Uzcza0ozNjkydm9YNnM3UGEvWGV3cE5ucXVH?=
 =?utf-8?B?MkUxaTAvTTBLRFBqQzd1RnFzcXlGNHltVFp4WlBVRm9ySGxwN0VGVndyTSs1?=
 =?utf-8?B?Vm15ajRKSDBpMkQya1RvVmVSRGtDcVBmY2d0dFVIaUhVQS9HTU1mTUFKL3hG?=
 =?utf-8?B?VHVVN0k1eWtWSGtJVTZZR0RVWS9sUDZKNkkvekpkdDVXVTZlSi82UVprYy80?=
 =?utf-8?B?aGF0Vi8zRVdFZWpZOUdzUDFRcE5oQVJ2d1ZJZDdtRXFOU21JR3RhRjZXZFJp?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xb9cEQQ0ImJPMeyr+0W2BMZ83IYXAcosgBXsGCs/FLnaYcZ1VO55P/xYbT/YSwwimsymN7wsOUyP4oCDA21zudgPdXQeVf2SJcX7QWIULxS84qr/9pyKHOnJuVZSy48NUT0qwvzAEQ2d9eI3iGrybp3gYIJSX6Xl/Vy0kKRXddXv2UpUmh1aaEFsrok8gnpRPxeqZDV66ISDrSDxxrqtxn2pGN7KXXOMD16Q2TGLByXCCeHWgnp/UaM2BGIp+MU8AhG09DHsljvLTCjnBabNkJEM3k+W/v7223ZNCd+hZ2aQv/TmpfVRLWwaJVrUOQn7qRv78aiF+tRkLGA/3aN3lu+gWEPBx7y+AnejNMg7EBvMWr2e1ziSfJGuMAHJbeCn2U8UEE3UWwpWZdJmCeD12Nd5EycjSdexByfHlnfbUjd1xkiYV8hZQwsmY87YaAX9QT465WFiO/KhZnRtaEu0A0DYsbdWv8Lcl7WWJkG3TavJ+cW/C3XsYeetebBUcO4tiSpjJhhWJLZsOuyxwoG7Nv0TkPMxCk4IsNcQzUEp+jA0taLnTAitC2F/xVc3kcQWGzSNOPn/zRCSw+2oKNywg6q0ZZnNJA3Tx9Wgb7VjtktFuNYapursD7X9hSLU6qrJF1dlc2aPc1qZHb9iUEUtIvgrrggROsXhV67Jmv3iBnyveam9uREN6utYuUJIizGgFR4wbaH63uBncCHrnaaBowqwgoKWy7mV/UWk4GKsTBW2lXsFXAb5+MeMdXV9gFZxLskgJXL5WfXORX9H1LDtEPPKq7QbQJu8cNh4OKJ3EuvpMf7BQdh0rQPRSDCNl+0ga4cY79CHIxGI0afYjapRuPJx7j5ksJALnnRnHhJzcIw9OfuofQS2WZJNkn3NdguM
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860feab7-08ec-45b7-50d2-08db47f1a146
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 14:05:32.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ovAn6eeFsDlc/pcRQsDplSziAbJiNfqy/mf9NYtJG7FTWFWLwBG26aofWeb1HCiN91/i3zMvYUJ0/yDoSyNGb9kLdSNpiBWur8CBvwlKco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5775

On 28/04/2023 11:41 am, Alejandro Vallejo wrote:
> It previously mimicked the getdomaininfo sysctl semantics by returning
> the first domid higher than the requested domid that does exist. This
> unintuitive behaviour causes quite a few mistakes and makes the call
> needlessly slow in its error path.
>
> This patch removes the fallback search, returning -ESRCH if the requested
> domain doesn't exist. Domain discovery can still be done through the sysctl
> interface as that performs a linear search on the list of domains.
>
> With this modification the xc_domain_getinfo() function is deprecated and
> removed to make sure it's not mistakenly used expecting the old behaviour.
> The new xc wrapper is xc_domain_getinfo_single().
>
> All previous callers of xc_domain_getinfo() have been updated to use
> xc_domain_getinfo_single() or xc_domain_getinfolist() instead. This also
> means xc_dominfo_t is no longer used by anything and can be purged.
>
> Resolves: xen-project/xen#105
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

You haven't (in theory) changed this patch, so should have retained my
R-by from v1, except...

> diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
> index 1dea534bba..dc858a1567 100644
> --- a/tools/libs/guest/xg_dom_boot.c
> +++ b/tools/libs/guest/xg_dom_boot.c
> @@ -178,7 +178,7 @@ int xc_dom_boot_image(struct xc_dom_image *dom)
>      {
>          xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
>                       "%s: getdomaininfo failed (errno=%d)",
> -                     __FUNCTION__, rc, errno);
> +                     __FUNCTION__, errno);
>          return -1;
>      }
>      dom->shared_info_mfn = info.shared_info_frame;

... this hunk means the patch 6 build is broken.

~Andrew

