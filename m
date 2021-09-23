Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C10415C8F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193710.345073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMcu-0005no-SD; Thu, 23 Sep 2021 11:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193710.345073; Thu, 23 Sep 2021 11:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMcu-0005kZ-O1; Thu, 23 Sep 2021 11:10:52 +0000
Received: by outflank-mailman (input) for mailman id 193710;
 Thu, 23 Sep 2021 11:10:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTMct-0005jh-2R
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:10:51 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e89bb3c8-1c5e-11ec-ba2a-12813bfff9fa;
 Thu, 23 Sep 2021 11:10:50 +0000 (UTC)
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
X-Inumbo-ID: e89bb3c8-1c5e-11ec-ba2a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632395449;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Rjvg1g1MiNfMPHB5E9DE3X/pJjj2vLy6IeghbUb9V6U=;
  b=C0jhYbxJ6GoD1lZYjh6+ZTwBNx61fZfLzL1EuGBSpnIRZf2RV+kiwzcJ
   NM9fFL4NDZX/9Cmy8l/ptRDdGriiK67y2IIWQ9CgL8L0GN/r/F74EYAe+
   eWNUSMC9dtflzzg4UkJn73HALGf4tt2iWAK+86/2NucwJWiLxEu5/F7gz
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: irpx3oFTrN59n0nP8PpNYti4d7IxnlLCj96BRyCPIncQq/fnsmuLZjqqnC4bGCJ3hM+G8O9gWV
 S484bQQKEDc9uOEgalGBxtDqtUfArBmWFKsqpUBNbldq/7hfMY7zU32lQjmp6uN4GBIYvohRpp
 d/kidudfv4fp7XBRyRoHF+UdNSNbvLgrl53aEjmPRQkaH7Lgdp9I5cN8YIifhy4KFiNeZL/0Ke
 RJP/5Jp4xlXCqD6mNch+LTpihYK8sfM+96csly2/dkJvzj19vSj+YHL1gwrhZJNxRdRA2XnWs8
 GErOWQA6LQH4hyPFYnYYg+35
X-SBRS: 5.1
X-MesageID: 53021683
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:I4BrWau4KzKotsrxkMir6Z6dc+fnVIhZMUV32f8akzHdYApBsoF/q
 tZmKT+PM6zYNGKged0gPI20o0NSscTUn4A1HFM9qi81RHwT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524PhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6KaQaSIiAfP2lLpMDkZ7Aw9kHfNX5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25sWR6+AN
 5FxhTxHK0vnWg1rCFsrULEC29jyn1vhYyR2twfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZBYfpwNuYFtjuBlPuJvCWJKHIkEC9ePYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOcjRfP3FsoR8tpoC5+dBu0kunosNLTfbt5uAZDw0c1
 NxjQMIWvLwVkcdD/KGy51mvb9mE98WRE1ZdCuk6WAuYAuJFiGyNO9fABbvzt68owGOlor+p5
 iNsdy+2trxmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8lfhwyap5fJ2W4M
 Sc/XD+9ArcJZxNGioctP+qM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzK66R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WkOXSIrd5PcwpaRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:aVw5kK6/mCiJ95ndjwPXwVOBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdgLNhRotKOTOJhILGFvAB0WKP+UyEJ8S6zJ8h6U
 4CSdkBNDSTNykCsS+S2mDReLxBsbr3gZxAx92ut0uFJTsaFJ2IhD0JbDpzfHcGIDWvUvECZe
 ahD4d81nCdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lIn9y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zX0IidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6q9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFL9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc4a+d
 FVfYLhDcttABGnhyizhBgr/DXsZAV9Iv6+eDlDhiTPuAIm2EyQzCMjtboidzk7hdUAozQt3Z
 WwDk1SrsA8ciYhV9MLOA4we7rGNoXze2O/DIuzGyWuKEhVAQOHl3bIiI9FkN1CPqZ4iqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53021683"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzuGAKM2V1GV2HMOyck7wMXmtEaVrh1A8r6Wj5H26kJs7lrO/+Lp8fk46Fc0GyrC7sZVoSHGOZpplWZ2Muqa6l7G9G/CDGH8t5e6UC/l5ONSoDyBsM1eS+jP2TWgJM40dM75mY1AX+fLZwDYSGObEBt+8X8RyW1Q9jifTVdYWfpXOC40aS4smb3xFJKc1FmBU8P8/aVLDktGM6XrIkGecUMOVmZzu5GTfUD5xy37Ylc/sFRx1doFfKzi5Ve6wT5aWyOZJgMIGcFd1lR0gwv5ao5CGIHzkpO2R9cVzjr6npG4OPoFUtHoR3PX8e2YcQyhHs4j2pQm7eurXrCgzZPP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QCMVIrccNaP+l9SSMJIa+u7dt+224mLkUJX64Qpo0J4=;
 b=MB9fzhiQUoOGM84T/Yh8Dv2+S3J9XD2A2bYZaEntVXeu6kuchELYmCGyNlSQCOpq72epZyjIaBKy+XN7SjaR9iOEsxlQxTkJMCavg3j/gT4C4wFEkEZ3D7kC63X7Gb7LFzcKHGXKYQch+8hzbM6bPhcRAS94/uBa+w0cMBom1wkeicYgqtvtGArbrx+jUh8mXNpGaWjR3V+wkAcfqvlwKiVBWkbeVlHXsL1fZ25zCIpNgDIr2s+S2e56NuNDMkwJxKqXDnjLkzuHRz+MONBtOa+DmoWVZ08cJ+JvMg8tpbuZv1Sa/ipOo3EV9JZ7L9PcVmXFeu+W/Uj7L6JUQki0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCMVIrccNaP+l9SSMJIa+u7dt+224mLkUJX64Qpo0J4=;
 b=a5/2m2gbDxEbU0H/45HfqBdDLh1zc/f+NWtI7FSXRIf72Rd3jjgiJxDs9CPoSUVd5k5q/0IJq9P3NXiA9jGkx7WONMAmdc2tNDIyZAti4fpJZxk/hD5JjveDXkFeOvTE71Jlsonah1fn+ukrINKIIIKGxFcDQH1QjRpN6SGpYfw=
Date: Thu, 23 Sep 2021 13:10:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v3 9/9] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
Message-ID: <YUxgsF47nrTn8WrS@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <a141e1a5-0185-4923-a91e-68c06a4f78cf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a141e1a5-0185-4923-a91e-68c06a4f78cf@suse.com>
X-ClientProxiedBy: LO4P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::12) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fd14a30-d877-449a-7fcc-08d97e82c9b0
X-MS-TrafficTypeDiagnostic: SN6PR03MB3822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB38224CD17663E7E1D7CBD85A8FA39@SN6PR03MB3822.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jTPlX5fp6zVgn2Po/KFzYZIXlkhQe5Q6tnT+o4AFBo+eo4L7gj4b6YbGF/loLNYEFf9TMPfM+rtalzTbfw7BUVEe+7wjqHtsuqmOqnqrIzvNdz6kk5ufUmP2P5KpU0HS1zh48GFiD+K790olsZ13eV3U0Pj3ThcSNs72YqvmhyC8j9ShPqje2Mkl346ub/m7fFfsfb0priveC6B9Fk+OpWUPe0LomhyG9LknVzh3XA7H3Sg02KogOaFDHhMs2tIoiHLuWF1Dyc5SEf9vtmIUOjaFtInt4CKgguXNtIei72Peq6LmugR03CViAtHRpxprQB75NTjiMOOUh1iAuAEhl2hc3fzp74rUVSU+3QIyLmW6VLiE6b7mJXvGp7qkzYgzLiPN+hQQJ8hjC6bA7xbiz1rfvzpEPUi+c7aPxxpKNkkFCXa1HCQJHo6f3myzhT/XMf+JVSGTDS/sytQbvc8JDAa5EBacww9uby7csMT5Ne3Oho+Lk1SJGHeaZJhUBIL1jX4tPeoHtJsbX6OztIROxwB80cZDLPXuxDfy/UDtgvskGgYkT0Sal/Wx+1d558TuGleiBwjwwuIz0oJo9VO4SljOzNcg/JnpT2iJJXn7FTnHZ44SGmsxaYWM2Hs3PnjCru5lx5fAk6vMYWfyzbpLBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(54906003)(66946007)(8676002)(85182001)(83380400001)(66556008)(6916009)(4326008)(26005)(6486002)(956004)(5660300002)(66476007)(8936002)(9686003)(2906002)(508600001)(38100700002)(6666004)(107886003)(6496006)(316002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anUrcWM5S2lNaXQxTWNEU2l4N2NjYUt1R21IbTE2VDhaVWJIbmxLUHJ4SS9t?=
 =?utf-8?B?MWNZNjdYM3czSWd3cG9ySW0zMTVMYTFkQ20yVjF3b05XQ2ZVWFE1WVZzZGlE?=
 =?utf-8?B?VXZRNzJaeVBJdFVBaFVMcDlScWIwb2hUeGdmMGJLY1FUaWtUSkNad3JoVkxy?=
 =?utf-8?B?WE40RXg2ak1pVWJtTTlvME04aCtjaFR3YWVlYldtS1ZVZ0ZRS01ZSWxkeGNw?=
 =?utf-8?B?ak5RSVpzTndydHUxVmUyVnM4QXJKVEFGbi91cHl1Zlg5cUlNRFBLY2FYKzBS?=
 =?utf-8?B?TWc0bSt3c2dSK0pZSDhJdUwvUWY3VGM2citkOHRZU1Q1cmJPNkJpRVkvTWg0?=
 =?utf-8?B?WUlhUjl5SDJlYWpsVlVmYlNvUDhXTXM1QzhJa3FwT0FpMTdJRTdNVTdXYU9U?=
 =?utf-8?B?M01ueFFlRHlaUUdOeWtEQllBdnpoWmtGTW0vRW13SjVKaVFNWVRHVW9hb2JW?=
 =?utf-8?B?RXBVQWQzcnFkRVVHWDFJaUU0UGVZUTRZY3JQTFhkTFhBSmtGN1VEL05iOWkv?=
 =?utf-8?B?WHRMSW1GNjg4Tjl5SCtpRnIxV1FPV2Rra3FUYVpLaUVtNHlwV3ovYVVsb2tM?=
 =?utf-8?B?eWtXeXpqU29ZUzhyVXU1VXQ0NHBGc3BKWkhKN1pycjllSnZCRHU2ZVY2OXho?=
 =?utf-8?B?d21EOWRtT2czWWlETUxlYTZCTnB6VytDckIzVExsbGUyUExwN1dDSVlCTkdH?=
 =?utf-8?B?ckZQdEJna2lMSUE2blJnbEZaaFlWOXZpOVp3c09mN0ZsRDJoOXRyZGhnY1VV?=
 =?utf-8?B?OHh2ZG41K0c2TU5DNzM5NHJWOS84WTl5SzkxZ0RVL20xcDNwbzNsR3lGc3Qz?=
 =?utf-8?B?R3pPVG1SZDhLTnpYRlVFTEJkWmMzYVNXVUhqOVpuUWtRMU4xUENwNFN5K0xQ?=
 =?utf-8?B?MW5nQ2didTV5RmRQVm5iaG80RlJ3RHY3ZnJhV1N4aG43ZUJzbkRUQjdYd0ly?=
 =?utf-8?B?aFdsMjBlajFON1I0cHV5VkRjUUU1UXFWL3h2SkYrR0tCSWNLQVBndW13OE5R?=
 =?utf-8?B?dWt0eVZPZUFrWDFGbW5HV0ZzMHM5WUFKVG1SYmRJOFI1WUJjUkdQd29PcFFD?=
 =?utf-8?B?WU8xNzhDK1QySkxEYW9CQ2dKcUlBR1A0R3E5T29vb2NYc2F3UEF0TWRoalp6?=
 =?utf-8?B?ck5KRTBYeElINmhHbDZJeWR5dUowdGErZU5WOFRRcUFFMnY1NnlDSVRrc2I5?=
 =?utf-8?B?eGFEdjBSaENvWkVpTU9qTzVHK0YxZEFsY0tsVEZleVBQR3lMUGRiS1R0dHlP?=
 =?utf-8?B?Ti9jQlNCWTZObnQrWEE4ZmhpVG9XeTZzejlRbEhnRFJQT2dxSzBibW1FemtT?=
 =?utf-8?B?OUl2c0tvSkRMQnRhcWE2ZHlxOE9jdnd4U0xZSVZnbUdRRGlEVnU3U1EvNGVn?=
 =?utf-8?B?S1dtcmdUMGx6WlExNTdyS1pIZENnRFRVYnJuSmp3UjFyYzNPY0RVOERvTk1F?=
 =?utf-8?B?QW9pb2g5eDAwYmdnb2trSHZ1amZVdjgvb0R0QjdCMzM1cmNNZS9aUUFPSzI3?=
 =?utf-8?B?U2lLNEg0ZHByZ1pTYWNKeEFOZGZFNGREUm8rblRFU3cwT2sxWEVTWnYyNEFS?=
 =?utf-8?B?VXI3RHJNSWtJNEE5MzJ6VDdyZXo3TzJzVlJLVDNMSUZ1dGVxYXN2MExOd2Fw?=
 =?utf-8?B?d3Y0QVRDZ3RPUzJFZzhmT3lnY052Z2htdHVJdnBsejZzOStTVUhpemR2azBY?=
 =?utf-8?B?QmhrOEZaaS94Y05XejdoRXZmZmFQQ2xYNldDbjgzVUgrM0NYckt6OFhwOC82?=
 =?utf-8?Q?U/NARZ6IMTOChE53vjG5btoRPUzDVWkTw4SE/cS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd14a30-d877-449a-7fcc-08d97e82c9b0
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:10:44.6750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYHuGEWZY/AaOPG49ey2VXDnXcj7ybqH867BRZSs7toKIXK2EkQ4M7341ABqtgZxWck7HwPiRjtCtdGkqTYbMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3822
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 09:21:11AM +0200, Jan Beulich wrote:
> To become independent of the sequence of mapping operations, permit
> "access" to accumulate for Dom0, noting that there's not going to be an
> introspection agent for it which this might interfere with. While e.g.
> ideally only ROM regions would get mapped with X set, getting there is
> quite a bit of work. Plus the use of p2m_access_* here is abusive in the
> first place.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Move last in series, for being controversial.
> v2: Split off from original patch. Accumulate all of R, W, and X.
> 
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
>              return -EPERM;
>          }
>  
> +        /*
> +         * Gross bodge, to go away again rather sooner than later:
> +         *
> +         * For MMIO allow access permissions to accumulate, but only for Dom0.
> +         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() differ in
> +         * the way they specify "access", this will allow the ultimate result
> +         * to be independent of the sequence of operations.

Wouldn't it be better to 'fix' those operations so that they can work
together?

It's my understanding that set_identity_p2m_entry is the one that has
strong requirements regarding the access permissions, as on AMD ACPI
tables can specify how should regions be mapped.

A possible solution might be to make set_mmio_p2m_entry more tolerant
to how present mappings are handled. For once that function doesn't
let callers specify access permissions, so I would consider that if a
mapping is present on the gfn and it already points to the requested
mfn no error should be returned to the caller. At the end the 'default
access' for that gfn -> mfn relation is the one established by
set_identity_p2m_entry and shouldn't be subject to the p2m default
access.

Thanks, Roger.

