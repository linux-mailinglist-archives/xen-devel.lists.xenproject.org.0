Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F649842C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 17:03:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259902.448666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1oM-00079w-LW; Mon, 24 Jan 2022 16:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259902.448666; Mon, 24 Jan 2022 16:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1oM-00077E-IF; Mon, 24 Jan 2022 16:03:18 +0000
Received: by outflank-mailman (input) for mailman id 259902;
 Mon, 24 Jan 2022 16:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BDBv=SI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nC1oK-000778-Kv
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 16:03:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2277cc1b-7d2f-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 17:03:15 +0100 (CET)
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
X-Inumbo-ID: 2277cc1b-7d2f-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643040195;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=7+M4s+BpLwAUOD7I9haB1CaD++O8DYTn3Vf7uuRxXeM=;
  b=T2OnCa5HlDpQjOh43OiVJHNn/yqacLlknnJxpn2bCvmz6OCUbepOQCN4
   h4Ikj492Vj13PgyMlS5ciXeWh385ryucFopm6kE17+tBAWXcV66oIxYyF
   JqXglavfgKSEozYX7oc1fZ6haDxcawvQ/F/KpT2jg+wrJUVaQjxjYWMxo
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FNCIAW0fKnbpv2mB9jNUwfZzgwubMqr3R4neb9JQoqclex/uBD/CKWFLjzuJvmFsQnZ9dL/Ahh
 BBijlLcwDEATquub9W9HqiKB5uYbInL34nCD6pzN17dIbRVSw3zNd57lt53z/7smmrWSWc8aKz
 4zLh/onnY5lIQSjdYMu8hWdFFC0F2m+BlzI/67mlkC4NfgFowOyTmPDhxDv6+Z5AarvK9Tskng
 0pOWceLnYh1sLjVe32ndgIt7QdnF1i5SxDFz2UOBecrc3T/sCkBDjgDtx1YKxiAuvuELnvC4ZB
 +6JCJ3ztaseZ9tF0vTTrY+fZ
X-SBRS: 5.2
X-MesageID: 62109603
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tG8Tka7mDCdSNAB28jyV5wxRtKzAchMFZxGqfqrLsTDasY5as4F+v
 jQbDGDSOq7bY2D1fN8ibd/n904BvpfXyN9iQAI+rHs8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2NIw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 /kWpKCRVlkQIqSSyfU6Cj1ITj5GBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgm1p3pEQRa22i
 8wxVx1XaguRXwdzfUooKLkYmcW0nT64WmgNwL6SjfVuuDWCpOBr65DvOd/YYZmaSMN9kkeeq
 X3P+2C/BxxcKd/34SWI8zSoh/Lnni7hXo8WUrqi+ZZCmFSOwkQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8VUO/037keK0KW8ywSWHG8fVRZadccr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9MkNZdBMlUlU8/9C98ZAU1zbfE8lbKfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxasYdO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb+J+i8AxkkfS+F1/ronheyO
 CfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlPdrX81PhPBjj60+KTJrU3YE
 czDGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3eLmaZOcwFiBSVrVPje9p0MHsbec1UOJY3UI6KLqV/XU9Y7z/09eyah1
 izVZ3K0P3Km1SSYcl3bMy46AF4tNL4mxU8G0eUXFQ/A81AoYJq17bdZcJ0yfLI98/dkw+IyR
 P4AE/hsyNwVItge0zhCP5T7sqJ4cxGn2VCHMya/OWBtdJ98XQ3ZvNTje1K3piUJCyO2s+o4o
 qGhiVyHEcZSGVw6AZaEcu+rwnOwoWMZxLB4UXzXL4QBY07r6oVrdXD816dlP8EWJBzf7TKGz
 ALKUwwArOzArtZtotnEjKyJtamzFO56EhYIFmXX9+/uZyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64clSuRl16Mz4dfrtoR29AU8ESWZdUmvB5NhPmKCgZtFuJpSy+ILogCxQ
 E+OpIVXYO3bJMP/HVcNDwM5deDfh+oMkzzf4PlpckX34Ch7oOiOXUlIZkTejSVcKP1+MZ8/w
 Pdns8kTslTthh0vO9eAryZV62XTcSBQD/R57skXUN3xlw4m6lBeepiNWCb57aaGZ8hILkR3c
 CSfg7DPhugEy0fPG5bp+aMhAQaJaUwyhS13
IronPort-HdrOrdr: A9a23:dzwgm6PA++JzssBcTy3155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwO080lKQFmrX5WI3NYOCIghrPEGgP1/qB/9SCIVyAygc+79
 YYT0EWMrSZZjIb/KXHCWGDYqodKbK8gceVbInlvhJQpVYAUdAc0+41MHfTLmRGAC19QbYpHp
 uV4cRK4xKmZHQsd8y+Ql0IRfLKqdHnnI/vJUduPW9t1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yj0/L+qvf2XwgLVk0XT85NVst38zcYrPr3FtuElbhHXziq4boVoXLOP+BgzveGU8V4v1O
 LBph8xVv4Dn0/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqU12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pSVFZol/1QwKppKuZAIMqjg7pXUN
 WGTfusrsq+SGnqIEww5QJUsZ+RtndaJGbyfqFNgL3W79FspgEJ86Iv/r1sop4xzuNCd3B63Z
 W1Dk0RrsA3ciY3V9MLOA5Te7rANoTyKSi8Q156Z26XUZ06Bw==
X-IronPort-AV: E=Sophos;i="5.88,311,1635220800"; 
   d="scan'208";a="62109603"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXQyg8mprSTAPcqB/y3PH6NhPqDQu7Ll8STP4ng9kGEg0XxoMACpGHmPr7ES5sC1lMv7Pm4/uParbk5rgsT3JG0kKsCrF/NrpLTM/RSIuYT1sUsHqZhod88VwUF+MIG1yZiOuzIdW3g71ZiespjBRtuNJevrWCPwIkWGcy9jjXkUf12mBTPp8V8ieLhln6yhHBGlHExRfHTR9wt/8w/ESus9BdrgXJpchaPD3uuPrlHZfyoerM4tQD9HKw3G638sDzNGSKtQO3UbqAVHEGWCqpp8X3dF3HNPtFkCYnyFoQV3bPVT5lPRZKn5P8/WrAi8PEPro32fyaGPwtO/rYqNaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfvPklOSDpUnAhCpobwRFBkRfn6mkddhxjHdfkQocDA=;
 b=KMgWLkPebE7OKO1m8KY4YO6ULVKiScDZDxOE72haz+gZfoq99D1D7V/xy3aUg8ByHQsPjjQcah/QRvQa89d2g11DaEQw6g8M/40mWa7zdy/lM66zSAQT9+5TniJrhz9zBrIr9o9Qwt23rM/BXoLgzym0yaz8OPhBJs29cLIEalhYPODT6TXjoSo6iUSWIwVp52qarbvV5k+TXgxQciyzyE4HtDhc8nAD1jKFUgwBaUv9lfWm0/3tOtF2uxzKge/iJMJx8X5fkCrY//DHDLCzWlaFt98RJA5JBCNd+T9N+r5H8jCa7NRZb2wfyEtMh+jJ8gF4IsmOj0BPC3Q/06+kzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfvPklOSDpUnAhCpobwRFBkRfn6mkddhxjHdfkQocDA=;
 b=nxUwhIOChEvAcMSR3pEvpNpU7PgOYfpslwXdigUqCGGN1m4FE4X/6DJ6IV04QgIrojr4/zEnGGkt08lEdSoi+/YYJBY9L5QDZvu1hfiAInBqSMLPMMSs4LJnpnD6N3guuJk/M1qul9CzXuLvZbwa5qe5mtINKle8grig4HaeqXk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, James
 Dingwall <james-xen@dingwall.me.uk>, Wei Liu <wei.liu@kernel.org>, Paul
 Durrant <paul@xen.org>
Subject: [PATCH] libxl: force netback to wait for hotplug execution before connecting
Date: Mon, 24 Jan 2022 17:02:48 +0100
Message-ID: <20220124160248.37861-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0024.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b98c19f-c990-4dd0-0258-08d9df5300e9
X-MS-TrafficTypeDiagnostic: CO1PR03MB5921:EE_
X-Microsoft-Antispam-PRVS: <CO1PR03MB59217EA19D63091FD464D70B8F5E9@CO1PR03MB5921.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VwH9RQbM0R/UP8pSagMLW/cirQUQMJpDIhauZDC5hAwTg34fGx37E606vxxopW6KdZ0fJ1rDTlyQTuz+X+gN6dG2HpGkcV+8VC4p0Wi9q5/4Xj6JKzu9KQJAztGf2bz3+1eutpDKvvgPVoi3P/n/XoerAF7ulnHJlXQFtrec5UgtfPbzQSMOEpSRH7LjxiVXmRzSlViYRz0z6uX4zYGWcnBp6M8s1jPPXXHwAY3jk0PeTpir9t5FcQvQf5NEh6nTKxN36RV2KwIZYk/Y/7nhxjcBqKhZzQYo+axR6NGvjNUkZDC4JVZEkITGSTouW5z65AhCYAdnFLFRNxY7aXDLFkCJk0YWpJ7bxXCiTfEWeojjkjB+INM4MLEbABtoGo/WJAbyHsMgt9jDhPQQUghiN5keNu8WENjiTaqQo/OYbmaEW/C2kvuX/u+aHScbFlYYud+tM0dtUkCXIp3++Q+P7nBcPtQW/5uDc5mWF5eAzHjgUQVArZgctR8T4E4yk0SZaRIBrYLs1xZR0jA+q448Z6paUsDIXeI20zVEtIkejnN6EIOhW8nA3CDjWJjGB+2bIg4qDlukodiWL7/YyvmOtVDFky1BfqZ2DiqysipeJFJK2Ipiko2r+B87TRqj+dhjdpIkicdh37M3kLdcze3UAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(83380400001)(38100700002)(5660300002)(6506007)(508600001)(2906002)(2616005)(6512007)(6666004)(36756003)(4326008)(66556008)(66476007)(6916009)(66946007)(8936002)(86362001)(8676002)(54906003)(82960400001)(1076003)(186003)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDNoN0svcWZHc1BYekkxbkJsY0JYbnR3Z1hrL1FNVTk3U216L0swRGJPSCt1?=
 =?utf-8?B?a1dPbjdDSFhxR1B3dGkreHA5RHY0bGpCd2JwYzBmZkZZendGR2ZHSDhIOE1n?=
 =?utf-8?B?MXI5L1JHSmVYRFBUNy9EbWRSNDh0cDRYQU4wdlQ0S2tMbkQwUkF4ZmFUVVBv?=
 =?utf-8?B?M0EvYjVQMk1JZTVBM0MvM3h4SVBHanFNdkk1eklNR21sbzA0NEd5SWRyYkNr?=
 =?utf-8?B?UVoxSVF1aU8rVW1EaWNyT0JHbmp1MCs1WjdyYmR6TXJqN0RCYTl5MjJoeFA5?=
 =?utf-8?B?Q2hPQXovYXRNOGZNdEJPcUR5dWNMazh2a3ZMVG0wQVNSNWhIY3d1SXJ0M2cy?=
 =?utf-8?B?THBqWGhuYkNUa0JMZUt2blhoTGR6aC80eDBqbHMwcWZhaERMSm1yVDZKTUtR?=
 =?utf-8?B?Y1lkVWJDSDJ4eTlSM3d5am9RYm1OY1d4akJZeVd1cUhUdUw5dGNvKzBteE5M?=
 =?utf-8?B?cjVza1FLYU5DT0YzNnhQNFl6MHg0NG9qS3k1VHZJVzJwMk8yc0dTYTBoYmx0?=
 =?utf-8?B?SG5uNzg2YXQwRktzQVZQVnFzQXFveERleFdyNk1pNHpLcVg0MnVHZFJmbnkz?=
 =?utf-8?B?K0wxL1pJVnZ4bEJ1eHgwRlRJQkJnWlR2MERwcDFDQ0JxczkwRVJxSzFSMVU5?=
 =?utf-8?B?eWh3a0d6eTN3K0d0dFlydWZPU3dFQlZDMG5lVmpJbDNCdSthV2pkbHppTUx0?=
 =?utf-8?B?bWhOQUVnNUc5dWpiT0djQThrWGZrbC9VcWZ2REVEcUF5NVRHZ2R2YndtZWN4?=
 =?utf-8?B?aUNmVHkxUU8vL1IzdFNPcWVDMjNRbU0wTjViWkxQV1BtUGh6bXpxaDN6dEZC?=
 =?utf-8?B?VEQzOEMwMTlwRTVJNTFobTRycTRLdnpwZ3dtVXYyOEdlWkFEKy85bmlQVVh6?=
 =?utf-8?B?NnBvdkU3NGt5L2FDSVFzdzFpSUQrTTloQmMzTjJEOHJmNWFKZlNVdStrbUdr?=
 =?utf-8?B?UlN4UzV5M3FHbDhhelRsaldYd1RVVGZOODRyc1RaR0JlU09OWlZFeEx5dnZZ?=
 =?utf-8?B?QVNDeDU0K2N6YlVZcjErNmRNTm1NOE1walA0bDliOXNKK2hEeWZsSlR0SGNs?=
 =?utf-8?B?OXNvdTNtd1pESU1uZFh2QzRyRGVSaWhFSE1iTmc0TkJIRjFRMmMyUXlBK2hH?=
 =?utf-8?B?MXdOTDA0WXQwS2E1UnRUNzFmb0kzekpLSDE0RFBsMDJ5L1F3ZzRoVjNxZ25q?=
 =?utf-8?B?MEt2L1JjUGEyakVyREcrQmFxUytOMzVkUzEwSFhockxuSnc5WTRpVkZmVDUv?=
 =?utf-8?B?R1VGRkEwbDZoSWlrRnp5TWF6UmNRQWRQaHZDOEZ1TUpWQ0w1Z2N4U3dJcEh2?=
 =?utf-8?B?OXZWZUM1VFdXUVZtRng3WlRXdFZ2MGhVUldOZndMeTlRNUZNeVVNeU9nRmdJ?=
 =?utf-8?B?VmR2UGNiVTNBL0UrZzNReXV0NTFTaU96bmZxazBOR2tiNXB6QURNNGJlcVNT?=
 =?utf-8?B?R0RYN3VreVNKbXBMbFF4MlFRQldNSFg4ZVFsaXVkMVhmM2ZyZy9SWGhyYXdO?=
 =?utf-8?B?a2N6ZlFEQ1czcWZqTmllWkRTb1dEUXZ6c2VFZ3JYbGdid0ZKczcvK0NCTUlJ?=
 =?utf-8?B?eTBuN1B6bUNTN3NTZmdlbENMeFZuQW9ucU1rb1AzOG55aGJxQUMySzZBWU1j?=
 =?utf-8?B?QnVpZDg1ZjltYzFmb3ZsRzRYLyt5dFY4YlRVYlZWZ0xrK1NvTUJudTY3TE5w?=
 =?utf-8?B?ZFhCbTY4YWpQSWhRSWFCSGxlWGltVHVsYVJucGMyc2JHKzI5ODQ4SlJOcVlN?=
 =?utf-8?B?Snh3VmoyODMreGhjTUl1MStpRUZPcmFxUTBHTFN0YTJndUFPVFFKbzBweUNr?=
 =?utf-8?B?RXBETVZjWWpwYnV6Rk00aVB5bm4rZFpBbG4vMGxHTVFjUkhTazRXeGI4dEI4?=
 =?utf-8?B?dGpCQmhZMTFFWXRvWkM4RldqSDNoRmhrSEZqRWF5Ky93NVdlQ1NyN3FZb3Zu?=
 =?utf-8?B?NGZXS0c2WlFTNjZzL2NnY3JhdEhOVGRqRUUxVksyaFFLSTZlaXFReEY2STlG?=
 =?utf-8?B?ci9YL09YZDV6L3JGeGpXWlM2RTVoTFpuVlFOUUFpS2dMb293VGowT2cyNWEx?=
 =?utf-8?B?ckdUcVVqREhBQnMyT2NUenBKcEpCbWsvVEhzSmJKTlRWcXRYSHBsN2RLc0xO?=
 =?utf-8?B?Qm5IKy80ei9QSllwYWRaSEZHWFd4K2lLN3Z6WHZPa1YwdVRyR2NOSDNtSkdu?=
 =?utf-8?Q?NdoQI33v+xs2HIZg16KnoO8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b98c19f-c990-4dd0-0258-08d9df5300e9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 16:03:04.2060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2xWZrk95qr95DWsUOI4/Bpau23dh2n8rHpmhgEtzkZHAG/s9TAaJAai8N7gJErh25rT0mKD3+0EmesJqt5aDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5921
X-OriginatorOrg: citrix.com

By writing an empty "hotplug-status" xenstore node in the backend path
libxl can force Linux netback to wait for hotplug script execution
before proceeding to the 'connected' state.

This is required so that netback doesn't skip state 2 (InitWait) and
thus blocks libxl waiting for such state in order to launch the
hotplug script (see libxl__wait_device_connection).

Reported-by: James Dingwall <james-xen@dingwall.me.uk>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Tested-by: James Dingwall <james-xen@dingwall.me.uk>
---
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Paul Durrant <paul@xen.org>
---
 tools/libs/light/libxl_nic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
index 0b45469dca..0b9e70c9d1 100644
--- a/tools/libs/light/libxl_nic.c
+++ b/tools/libs/light/libxl_nic.c
@@ -248,6 +248,13 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
     flexarray_append(ro_front, "mtu");
     flexarray_append(ro_front, GCSPRINTF("%u", nic->mtu));
 
+    /*
+     * Force backend to wait for hotplug script execution before switching to
+     * connected state.
+     */
+    flexarray_append(back, "hotplug-status");
+    flexarray_append(back, "");
+
     return 0;
 }
 
-- 
2.34.1


