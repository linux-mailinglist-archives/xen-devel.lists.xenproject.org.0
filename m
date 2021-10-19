Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96963433006
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 09:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212827.370856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjp0-0002lJ-0Q; Tue, 19 Oct 2021 07:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212827.370856; Tue, 19 Oct 2021 07:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjoz-0002hq-Tc; Tue, 19 Oct 2021 07:46:05 +0000
Received: by outflank-mailman (input) for mailman id 212827;
 Tue, 19 Oct 2021 07:46:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcjoy-0002hk-6D
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 07:46:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a9520d6-30b0-11ec-8305-12813bfff9fa;
 Tue, 19 Oct 2021 07:46:01 +0000 (UTC)
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
X-Inumbo-ID: 9a9520d6-30b0-11ec-8305-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634629561;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kPvnOFF6e+CIHo8PKZ0IM85N6dI6NrnsASITc8qAUnA=;
  b=VlwSY/la2sqv7/ORdU/EkFFRaYSaBJlEnQOOANftRqmVH3pD/pOYHkjG
   MUqhv76MdOdTYS3PkfJwJ9M5pVaGBaxvo1vtSfk1T2+ksiuIy1xIq1N96
   JVzl7YQq11NeYRatmvd7pu3lx8pSYMBPamzwkP/Xzdoi4Z3xgk6eGPteX
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: COHYvfMboBdCf91H+pn7u6lVfECoIG8Hro3ysJFb5BI6NZNi2TaSf5IkmCjd42cuRK2WQwE7OE
 oTSSCX1EQN14Lqv4YpVS/DfxswE1T5jWRN6fuy/7PDPKxoqQMeeX+9QnCPLcWvrV/sSYAVLoU0
 F1wTu/l6pVZUIBg2rHi9o21jMhY9MSq+0TgXRczrWN3YgRE/5T+4T6vA+W3Ew8RQLmndtXRFEV
 MK+I1IxWxrhf+yIi7DqOCTAnf6sVLcpnFjefcoO1RGT0VZLkXZP+6Tb3CXrJ2EC3kFJcFDRsb/
 FZ70yimKGJRrDQNEX5dnAmBs
X-SBRS: 5.1
X-MesageID: 57404957
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3Thg3K6J9LcLWJfgmmIPLwxRtJLAchMFZxGqfqrLsTDasY5as4F+v
 jQXCGyEM/+CZmbwc952bITl/U8O78TXmtdhSwRo+XsxHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrdh298w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 dZB64fvQAUQPrDrwdo0TDAEAnF5BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWhs3pwfQKm2i
 8wxSmVLMBjlZj1zJl4OErkXnsHzuEKgWmgNwL6SjfVuuDWCpOBr65DsL9j9atGMXd9SnEuTu
 iTB5WuRKgkCNcaUwD6M+G+EjO7TkS71VYQeGaf+/flv6HWax3caCRkffVG6vfW0hEO4V99Fb
 UcT/0IGsaE3/VeDUtr5Uhu3sXOA+BUbXrJ4Eec39QWMwar8+BuCCy4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqPHFeC1Ffup+6/d913kmnostf/LCd1975Ryqvy
 jKzrDUZ3os6kudXxvW8xAWS696znaThQgkw7wTRe2uq6AJleYKoD7CVBUjnAeVod9nBEAHQ1
 JQQs43HtrpWVMDS/MCYaLxVROnB2hqTDNHLbbeD9bEa/DOx52XrQ4lU5DxvTKuCGpdZIWG3C
 KM/VAU42XOyAJdIRfMoC25SI55zpUQFKTgDfqqEBjapSsMpHDJrBAk0OSatM5nFySDAa50XN
 5aBatqLBn0HE6lhxzfeb75DiuN2lnpgnTmNHMCTI/GbPVy2Pi79pVAtawPmUwzExPnc/FW9H
 yh3ZqNmNCmzoMWhO3KKoOb/3HgBLGQhBICeliCkXrXrH+aSI0l4U6W56ep4I+RNxv0J/s+Vr
 iDVchIJkzLX2CyYQThmn1g+MdsDq74k9illVcHtVH71s0UejXGHvP5OKcpnI+N5nAGhpNYtJ
 8Q4lwy7Kq0nYhzM+igHbIm7q4pndR+xghmJMTbjaz86F6OMjSSTkjM9VgewpiQIEAStss4y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg69lOdwIJDXC2iCei
 1ScDyAHqLSfuIQy6tTI2/yJ9t/7D+tkE0NGNGDH9rLqZzLC92+uzNYYAuaFdDzQTk3u/6Cma
 bkHxv3wKqRfzl1Lr5B9A/Bgyqdnv4njoLpTzwJFGnTXbgv0VuM8cyfehcQW7/9D3L5UvweyS
 3mjwNgCNOXbIt7hHX4QOBEhMraJ28YLl2SA9v8yOkj7unN6peLVTUVIMhCQoyVBN78pYpg9y
 OIstcNKuQyyjh0mboSPgixOrjneK3UBV+Mst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP1+ZG207PU3svDnycj+NSiKMHtA1O0FJfdU+CncDIh6Nv0RBcmdjtot+5EvmTPzpPB
 1VW
IronPort-HdrOrdr: A9a23:n3w5xqr3yVkcNmQ1q79YrSAaV5u4L9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGMaGJ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqT+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+uemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lgdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNwN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wmJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABOnhkjizyxSKeGXLzAO9k/seDlEhiXV6UkWoJlB9Tpb+CRF9U1wsq7USPF/lq
 z52+pT5ehzpmJ/V9MLOA47e7rDNoX6e2OEDIujGyWUKEg5AQO4l3fW2sR+2Aj4Qu1E8HMN8K
 6xJm+w81RCI37TNQ==
X-IronPort-AV: E=Sophos;i="5.85,383,1624334400"; 
   d="scan'208";a="57404957"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayZblKb7YRgsl3YwDd5uWX9AwayQSGWzewf51pqNCX3zP2+19lejeu1Z065B917JLl7LY6C05/Vl4Lg3telpDBbXJvzKRvnZybje14PMUPnJckPLRLCg1qKO09knX1Vr2KnRLrMQUQeYGzz0JlR5q/gB/iEDUe5FMOnT9jcNQZSnCA2teLr8yKUwTHy5FuilfK8Ah0XWciKieWqVKKt5HO4QD/ERj+OEVGqFrvRfwjmkwMLEmDYjZf7Vz1fwM6PFvA5GXJXwOL7//HabkIOORTlpVvQJiy8B9JMWI0InLFJw1HUxXeMVLUJ6udJLJW5CNbGLxq7WVEZ526oSMpfGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz4VozwYbHuZn93oK1so7+q4bf1ox0W13ZwCcLXmpao=;
 b=Hzj8Km7bL1IeS7JhFs4dZO9G/2sfMfkL6KBTnHGBaAD5+df2CmdYsPqblWVscDzVtblz1MXF9AWGQ0RALtjQRkQ83Ch10u8s3sYLei2P98bGN1pRudjXOVwKHp9+N4zlcSnt0Omkc0/PQOmbnB7cpmwxMZOR6g08g8eD2zS5pV6OhCzrm56HeNVW7/hQCQgFSPChx0IS/4kIOUowfUM2gvaa49Mfbu4xU44YKB3rDaAtdmJI/nxNzXPBNg4K8KRVqtrMqnl4HJ2HjarJ46l+AHNlMiPADHJC3E9mFTCo1+h54scdWJSaNWThcG0nlVAGOKWjlXXlWZmsse34BxORsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sz4VozwYbHuZn93oK1so7+q4bf1ox0W13ZwCcLXmpao=;
 b=buFGe/wGh5G1ye9DFh77AncOXaWyHEefMDbyUpGuPfFlwWhF/hWHii0IRsK8MuLS/vcF9e2RzP0I39Y6Q/ab4VAKsGWpkVDYRSufnQ6WN8rcvQpqhJAAWvSu5c6ywfgw4wEDTJdT9+6gLjO305rVP/XoStTLMt43RgoAdO1Rmmk=
Date: Tue, 19 Oct 2021 09:45:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: Ping: [PATCH] x86/altp2m: don't consider "active" when enabling
 failed
Message-ID: <YW53mkPnrTCCViXz@MacBook-Air-de-Roger.local>
References: <f0de7945-84df-8668-f94a-c15cd5196be3@suse.com>
 <7f947b0b-4b65-51cb-c098-edf056610fb0@suse.com>
 <CABfawhmYzu43sMSG_TD0kHhvEjQfo1S-d-iz6cqFwb4JNbjbDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhmYzu43sMSG_TD0kHhvEjQfo1S-d-iz6cqFwb4JNbjbDA@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0343.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a123787-e4b0-4eef-281f-08d992d4701f
X-MS-TrafficTypeDiagnostic: DM4PR03MB5965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB596513F8622687C4D04E0FA58FBD9@DM4PR03MB5965.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: swpZdV737Dhm0Rd1HMEzs9mXeLWucmO1N1qa3KTFTI9kvtL3xlCScIbPDPPjm2/idxr86L3FD6w6mz0R1qukCKrqKoKRRKtmUM1ca9hOQCL0p45KP+UjTa5R16MSCT5s6yOtv/WetPtuoHiNrtOgt/xaPrydvs0LZX0OVTd8X3NzUu1KX+HDZMdmQT/AriwS4rRQqZ5PAhRsBLs8YwKMJkPgeEIWXexBobCpKJeZ7FIHhylWEYjFWzKuQ08cM2cgFvL8Qdbt9m6ja4EcOgFjnhvvEhLO190E7uJRwUK+E9NmFr7VMZz7JwF9W8jTN6kIaNutdL6lnbe4XxdWZQ0mW962TMKIslbWl8EA+AiRf15DaK9Ok8FExL7Kxcn73WJKSq9f1KZHJZI88CwQFCK6Jwlya4Eg8MYZFv9M+B4CG1gc/QbVcDbcaxqYPW1P2ghy/ao8KI3ljMoGhUZyFt0u2FOoRz6vRMcMOgzfV3rKLF6WNskfKddamWOD8vDicxqSphqznoBqh/NymOoSOP27N4km4UpJgy+F8ehH8ejWriRPZ3N7/K+jSqzbxiAZC4KrdUJR7LfbOe9jixq8CbdJaBcb6KnwqJECjx8BgxY3pap3HeZgAT2nJmclJdBLGqykqw5ym5A1OXy0Bq9xRE7AEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(6916009)(82960400001)(86362001)(8936002)(508600001)(83380400001)(26005)(6666004)(9686003)(5660300002)(8676002)(2906002)(956004)(316002)(54906003)(4744005)(66946007)(4326008)(6496006)(53546011)(66556008)(38100700002)(85182001)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkdVa1NRb2E3czJPbmhsUERJbkNzallDSmY1bnVZOUprckl0VWlTbVNsYytk?=
 =?utf-8?B?U1M4M2pzZ2o5a0FmOFRjSk1tVXI0Uk5JZjBjZjQ5QWJlMWJRenVYdzdndGVE?=
 =?utf-8?B?SW1MZ0lybUJXZVpRbUEvNjBtZUxMOExXODQ0RnozbUs4VGZLQnExc1NLUEZs?=
 =?utf-8?B?MWs4Rm9KUXNIb2tudkZHZVFKZjBPTk5yUFdUeTdYY1BBV2pVa3ZseUxVTmtT?=
 =?utf-8?B?eWRWOHpRMEhkZUFVV3NIL2hDckNnT3J6a2xEUnA2ODFYQ2RRajBia0MvalY0?=
 =?utf-8?B?N2R6N0V6N0UyQ00rRXcxTHRHOEVVQndZam0xWHY2V21EaU9jRG9xd0pMZElX?=
 =?utf-8?B?blEyV0M4eWdmc2MwaStwdUpZQW1kejFpbzJpVEFFZm1DeGcrNVUwSkRwaVZj?=
 =?utf-8?B?VlNmZUJBcEs3bnRHZmdxRUZvSXBjVzBxckpZQmtIV0xXNEhVUDhGbmRQMG9X?=
 =?utf-8?B?UjdteEhTOVRudFVUVDFNRTZ0cjJFN3dvazhjVmlLWmlaQ2lld1hUb0JGb3V6?=
 =?utf-8?B?ZXVJUUdPSjlydmgrQmsrKzBNRmEzQ1l2SjhVZVBoRUpBcSs3ako3VVJEL1ZM?=
 =?utf-8?B?S2QyZ0dKUEdJdnMrMXArTHVLdWF2NjF0aitNM05SQmZIcmtQVlV5THF5Z2No?=
 =?utf-8?B?RXVMMDF1eTBhYWFENDZQclBqa1VqUUR4MFdkODZ3cEhtUDVBaGl2SGJZN3dp?=
 =?utf-8?B?SENqaXM3a252ZmgyY3FXdlhmaFlGeDFiYnhGL2Q2YW56VGE3ZnBWTW5MSFc0?=
 =?utf-8?B?a2VWdzJsZXZEbTlCOTZxbTA5RVRPa0psVVRjUzdKQTBsQnJvMUdlS3NYKzFK?=
 =?utf-8?B?UzNjVE5MRXRFNHQvRFlBRVdqR01ueVJ6Qm1VRFI2TEp0TzA1Tm9TQVkzZ1Rx?=
 =?utf-8?B?NWU0bUlOT2hPbW9aZVluVGN3UE8wUmJXaUx6cVJLMzU5cnRLTHB4MkJzeGUy?=
 =?utf-8?B?QmxCYWEvQjdqeUVzejlKalZyV0Q2WVFZWU9ZNnVTNmJoYmtETEpTcDl1MGQz?=
 =?utf-8?B?YVhjN3hKY3lFcktWWnh3UmIxY3RJVnRvMlBTTm5UNlBuZ0k0SmlLVVBpL05P?=
 =?utf-8?B?NU1DRS9sT2JaakF0NUtKbHNnS2tuQW9PcGc4MDVFRk1HOUJDelBxU0xHbDY2?=
 =?utf-8?B?cm5rSHp1SSs3MjJQWVZUU2NubU9aWGlML2NFZlliRnFJcWs4QzVFZjZ3MGRT?=
 =?utf-8?B?YjBUUWVaSXk5Q3FDOXpqaGFSc3Rhcms0S21neTFqaWo4ZHZaNk1nMHlEbkFR?=
 =?utf-8?B?d3E3a3BWV2pDNDZxN3pDTUl6aHpsaTFLYlVkK0VneE82RW5POWFGcUJ6WDdt?=
 =?utf-8?B?MVk1bnBLNDUxTldZdjZVZ1QzakVyRkt6eFdyTlpUUDJrU1dDT052SkVya1I0?=
 =?utf-8?B?bVZOZWVtaUcvMkJQVzdkOGROQm9kYk9xK0NzZlpPSzFFTUpNQmFCckhCeCtZ?=
 =?utf-8?B?dUdhRE5kN3VlbE5DenZ3Q1N3dFp6M2UrUXN0bWpmSmFoemwyYmwwR0dWbXJp?=
 =?utf-8?B?Z3dObWZYd1p0TzNrd28rbE4wVVg2VTVWNENCUEpITys5Y2h1VUJvc240a0E4?=
 =?utf-8?B?THhJLzFzV0hkUDBETHZiQW9ubjBPdzZOVXNLdkxtNDFPcG9QWEU5NFFYOWRI?=
 =?utf-8?B?MWE0VkRMOVdyVFdMTk1TU1RrMWJab2dodlB5SkhCSWR2aE1xOXZ6TXRJT0hM?=
 =?utf-8?B?aGl0WDhnWlFNcmhBc0FOMDd0V2hDQ0NvbkJBN2hid24zeHphR2dLTUxoSVBS?=
 =?utf-8?Q?3ShdoMxWC6UWkjlun0/FbMNMWPCC5/0EefNrm5a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a123787-e4b0-4eef-281f-08d992d4701f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:45:36.3668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMjEa/cYEpzvrDfFXUPFYpgTzAmoU7+sI/hyLeL37z/nmtoODZWv7eJ9F5WAOum2fY6c33312u1nVOqkrxLHQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5965
X-OriginatorOrg: citrix.com

On Mon, Oct 18, 2021 at 09:16:30AM -0400, Tamas K Lengyel wrote:
> On Mon, Oct 18, 2021 at 4:26 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
> > On 25.08.2021 11:31, Jan Beulich wrote:
> > > We should not rely on guests to not use altp2m after reporting failure
> > > of HVMOP_altp2m_set_domain_state to them. Set "active" back to false in
> > > this case.
> > >
> > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > Because of their relationship, I'm also Cc-ing the vm-event maintainers /
> > reviewers: Maybe one of you would care to review this one?
> >
> > Jan
> >
> > > --- a/xen/arch/x86/hvm/hvm.c
> > > +++ b/xen/arch/x86/hvm/hvm.c
> > > @@ -4609,6 +4609,8 @@ static int do_altp2m_op(
> > >              if ( ostate )
> > >                  p2m_flush_altp2m(d);
> > >          }
> > > +        else if ( rc )
> > > +            d->arch.altp2m_active = false;
> > >
> > >          domain_unpause_except_self(d);
> > >          break;
> 
> 
> Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

