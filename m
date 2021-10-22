Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FFF437581
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 12:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214937.373808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdrpC-0004Tu-35; Fri, 22 Oct 2021 10:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214937.373808; Fri, 22 Oct 2021 10:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdrpC-0004RX-00; Fri, 22 Oct 2021 10:30:58 +0000
Received: by outflank-mailman (input) for mailman id 214937;
 Fri, 22 Oct 2021 10:30:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fDp0=PK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mdrpB-0004RR-0n
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:30:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50f32cf9-4827-4a76-a753-febb8debdd72;
 Fri, 22 Oct 2021 10:30:55 +0000 (UTC)
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
X-Inumbo-ID: 50f32cf9-4827-4a76-a753-febb8debdd72
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634898655;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7GbyDwN/Lj03cwpelDYqAeiZLgbd7nPDhZUpxhw+Ttg=;
  b=RZoxcgMORNiicwu3dqZys5zM3zFzvwk8H3gC3d4e9KejrefutOYvagUx
   cTnQJH27ppf5iA9286kFUDbukCkMsuPTusV4/2A0o25Sv6gtdNA/dUp0V
   BBtEGOPw9RQwZhef93a3CFfBMBbfC1K9RUyNl57WK75cmZma5U6rwEj5a
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 45n/udTYUnJWbMQuCTT02mjIJyTEuS7WDx9VpVu+E0AaclpyHi7iRmcZMNW7RkjtBN74b9iAsh
 n7DEC359UIo2+qb70W+E977HjPPwcGmMddZQAPq/iCgtc4kPuclYqP+txHq+GaP7SpW19Ci1KY
 UlMcpF/Omddr+pv3mcudSOyH+jeN50JLDPXcQ14M3jLQe90zdSh1kLd4mvV+Xx7aHa7uyHXD59
 pMzUVIYpYHzYM1EpzQ1FZVFPzN50HdMUX4nlChwbROGGMTIThViBHi2qZSrRCzZDDtS6wWTkum
 s10twhRyzkJKIGJJuWOASTZT
X-SBRS: 5.1
X-MesageID: 57732291
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iSRbCK0Nx+cUK0GudPbD5Qh2kn2cJEfYwER7XKvMYLTBsI5bp2RWx
 jdOW2/SaayNYTT2L9B+Yd+2o0tS6pWEy9VhHVc4pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es7wbRh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhk8pb9
 stS8qKMTig5E6zHyMIyYwcIOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIAHh21q15km8fD2V
 e9GVANgaCn8TBRtMXs5A4pinuukiSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTW0ulS6oAFbZeZXPP0X6Qrd7IXk/VawUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P8mvsYXl9wXsqIHZeF1NcsoaLTJQb10qXFr5e/LiJYsoZ8N0a6
 wuBqzQinP0thMoP2rTTEbvv0m/0+MahouLY4GzqsoOZAuFRONHNi2+AswGzARN8wGCxFAXpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4LvGEifRg5ap1ZKFcFh
 XM/XysLuPe/21PxNcdKj3+ZUZx2ncAM6/y1PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0GAbSgOHGOrNZPRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKl7ZEeAQnVOH1ldp31WpNz8SAyMSA2ZA760Hk/e4e/qqwYcsJvL7Ug8eViy99yT
 uUEJJrcUqgeFGyf9mRPd4T5oaxjaA+v2VCEMR26bWVtZJVnXQHIpIPpJ1O96CkUAyOrnsIiu
 Ln8hBjDSJ8OSl06XsbbYf6i1X2run0ZlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSQ3PKKtYakFed6D3F2JWiD4ObkLzTe80qi3ZREDLSCcwfCWT6m466lf
 +hUka3xaaVVgFZQvoNgOL931qZitcD3rrpXwwk4TnXGa1OnVuFpLnWchJQds6RMwvlSuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEDbRCDhRtUIKZxLI54k
 /wqv9Qb6lDnhxcnWjpcYvu4K4hYwqQ8bpga
IronPort-HdrOrdr: A9a23:+qvh+q4VnWVDlRtsnQPXwVuBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurQYfcegpUdAa0+4QMHfrLqQcfng+OXNWLu
 v62iIRzADQB0j/I/7LSkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IfEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4FC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfuspMq+SWnqKkwxg1MfhOBFBh8Ib1C7qwk5y42oOgFt7TJEJxBy/r1Yop8CnKhNA6Wsqd
 60a5iBOdl1P7grhJlGdZI8qP2MeyXwqCL3QRCvyGvcZdU60lL22tTKCeYOlayXkKJh9upFpH
 2GaiIBiVIP
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="57732291"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfwVvv0QDFLxpdU4xvE7CqRJBp5immZ8H4bTJ/RmATsg0tK0Hf4frww3jA+npoV8SDBY64fxDuAzacffw7HU5JNSTalHwGC3AsiNdI9K24lypagSEsGqhCxXg6ksv7IAA36qJ8rox7K/jC7NtZdz/Thh1XcLwBEfPWi1B+Ogi0mG5qoJRHcaWchp3TGucFGlkdAOR450EckNqW8h04kIPS5tYpMS/S+aJFpUu/TW6xC+WWAsadKOnXSCVZ/LcBIj0AOX7F5H/DvUoU2SM3V9Vwf7z3/PTgNqG+NeyiRR6a/J+V8I3ZlF7Uk7fJwA576zks3u9r23kqVYRtH1WFdJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoLmi8XjwYvIvNTlR2B7wn3vi07buVRKBWgAwmIbhNM=;
 b=nKchj5prBJ2W/gJRA2aYc1oSSK7uPav607h99tR/ohufGd+7MnqoA0CKfod7yehGutmTDpiRi8oOc988XsRkZb0OTEA1HpxDOpFGCBVdITCVDNg4I9jiUjpE0nfMwqQk8BQ2bW+wUPUWieEwT6EPJF0sMehN9CFyVNH4ZUKcE78a08J93gli2fHC8LYCh1VRzeN4zH5ZdyvnLjhvSDE0VwhkEv2kKz++KZ7jW6yVOvycooGY2XtZkcWO4KJp7dBYwVzugkMvI4BllIjmXvq6/bCapYHeQ0xAQwngG+hqvm93dLhMKA7w0wLmwtE7kov8wWXN+dEcb+IpuraVkcG3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoLmi8XjwYvIvNTlR2B7wn3vi07buVRKBWgAwmIbhNM=;
 b=uwIe+9aLh7O8eje4/OdKqT6PeQLJHlOVW5tWWIUVHY9HhwQrnKl4biHYK37oqCKeFh+uWuaPL/SmjCM2Qxs9Qaz8/StMyj4wHsnzEwvInYO4N+xnG3/Wv3L4tUDm994VMlYRpwuT6B9pm3V2DFZifWNbB46AlAVhpaTd0KAOknw=
Date: Fri, 22 Oct 2021 12:30:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 4/6] x86/HVM: also dump stacks from
 show_execution_state()
Message-ID: <YXKS1p1h37mF9cdL@MacBook-Air-de-Roger.local>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
 <db023918-618a-d19f-e600-ee0a683a01af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db023918-618a-d19f-e600-ee0a683a01af@suse.com>
X-ClientProxiedBy: LO4P123CA0174.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b56774e6-e2d8-47fb-8edc-08d995470487
X-MS-TrafficTypeDiagnostic: DM5PR03MB3146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3146CFE2380D5DEDD92104708F809@DM5PR03MB3146.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xjYBY6BIs8JMys9dZq5acb/+hbbmo6Enh1qjlcN1eZI/2Oay5b3bIuSucdHiJgEdz5vdMbegPJ+2vvebv76onLoQg+5PpmXxUpVJIF5j+I6JxwT7ADo2AwuIaoMWTHf4fxV0uZ/sEzhOHYV9poU1pJHmjtJaJbplGChmdZBOd6kRXFQVlWKfxtArXKYSxHV8YysEJona2oQMxFJ9WI3/W68z0xZCUPG8ji0dhG5yK769zetVH6i0DEQ1nDTspAjDFQ8olNTS4DxbBTwLS6Gf7l2Jl3lh+IN56vhR0mIXKH3779mrKySwAUiYs/SU4YSBlH8LuAVRma50uYSM1nXJj+76Wbt0MSHy518ncpC2E+fTOYaEgOTgjL1fst3sSDQ51hHYgLkwmrg8oPhnj1thp1k47kSx1OvvdiwwIbPg5SwAIEvMJfl/nQmlgLf8GLhKeiUz3nJ6+NhJcpU9Rd/szHN6AB7pi4nrtISCmij8aBHqGxDs0h37vGuofrrWo3HvWkemp1dqZxp9BztK3ULcsLwOTqtsYeVJ9gmpaJn5FQa6jPyJigbOsrzHzNXtiw1kib67MZkWpvFiscC2Ilv1rOTsDefuIviXeWxZ2NIQVqCyTC5TnneFWDtgvnVMtMtYO5+Ry81QsBFbUFolDbFZ4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(316002)(86362001)(38100700002)(2906002)(4326008)(6916009)(4744005)(85182001)(8676002)(8936002)(82960400001)(956004)(66946007)(66556008)(5660300002)(508600001)(6496006)(83380400001)(6666004)(6486002)(26005)(66476007)(9686003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2pIUXpzUnRMSTg2aGJRdm9ISE5mQ3hLbEwza3EyNkczWkkxdHpJWUZNaU9v?=
 =?utf-8?B?N1dvdU12NTNIOHk1NjJOLzM2V05qNmxqL0xZbTNZMDgyUlU0MkZSeC9Eb1Nl?=
 =?utf-8?B?N1ZVbXg5UWhraHoyc1VpRFphZ2hIOFlGN2Q5aVlaaG1Bb0g5R04rc0pwRXgy?=
 =?utf-8?B?dng4Zm5zS1FzRmphcHNMbDh6MVd0VFpidk10Sy93YmdjcUtVSHZZRVRMQTE4?=
 =?utf-8?B?bm1hN0pFWk5tUTZTWVd5b0hjdktmZElUbUUrY2QzalNyYmdPcTYvWVFGWStu?=
 =?utf-8?B?WWMyd081d243aE1abEdBNTdCMDAvWVF0bHg1anVyVGJPMy9PZmFLRWlZOUZP?=
 =?utf-8?B?T1BzR1paQlB6amtCdnV3NnhGcktyQ09CYXErSVRQRkNQY3BBSzdTbjQ3cURO?=
 =?utf-8?B?TW9OTGZHT1JtMng5NHRUbWRSanZ5MGozMHpmOU04UStEdVNjZkR5akxVQ1pa?=
 =?utf-8?B?V2QrRFN3Sy9VaS9hS2dPQlVOQnU2c3ZPdzJSL2ptc21Ea2h2MjI2MTAvYjV3?=
 =?utf-8?B?S2R1YjIxandFV3VIRkpuMExsUG0xMkN5Nm5sQmFTenM0UU1hUWlmWFNod3dI?=
 =?utf-8?B?TDlKNTFTV0d0L0gvbVNqQUtOdEd5WmhqaXRCQUxPdXB0SlFlNTgyL0MwMS9H?=
 =?utf-8?B?UkVwSUp5ZXRKR2JRWUdHYm5VYmV4OFp0MHlxOXZXMldJTW1uZkY0WmR0VDg5?=
 =?utf-8?B?MkZsbFk4Y2RtbW5XT2RZc0RncU40ampsYkNEYlg0NFBsb21vVE4yNTBxeS9Y?=
 =?utf-8?B?ek0wNk42R213VzB3Z1dlcjhCakFuTzRqUVM3N1k3L3ZjUEp5VXdsWXcxZENl?=
 =?utf-8?B?dE52TCt5VUwwVTFRSWh1Z0VuL0doM1lkR25MR0VPMlFUNGJmSHNXK3VNRk5Q?=
 =?utf-8?B?NHBnaE5acDA3b21DTTl5MFA4bW5pRnd5NkJ2Yk5RQjhDNUR5RStKOHBSQzc0?=
 =?utf-8?B?aG5CWjExT05jaUdTaXNCQlJtMllmSksyUzhaZXQwUnlDSjFITDRoRHdQNzdw?=
 =?utf-8?B?QmhFbjc1eWtzS0VoanRLMU5QdzNBMEI5NUlMZUFzWWJRZDBSR2tvTlJmYU9l?=
 =?utf-8?B?R3dTSnh2aTlqbFNkdW5XRFlvS3J2eTZNTHZDL2lZeEVmRnB3NzIyV0RLQWdQ?=
 =?utf-8?B?bTJibWZYSzBkUENMNUFRYklMaUVrTENvUzVxYm9FWC9rV2pQeU1wbjVIRUE2?=
 =?utf-8?B?dXpuaXBydVg4VmZYb0lHVytDRm5zTmVZZnNRV01xbXUvYm5adllvMXloZnow?=
 =?utf-8?B?dHRDSG5OVEpYVTRyd0dkR0ZpRFB1L2F1KzlXYklwVHBTYU9qOGk0OHhxb0RF?=
 =?utf-8?B?Mm1mczlxREpKNytGUXJDSXY3QXN4Y1UvanpmT2pRajR2Wmd4bmhOL1lzd3BQ?=
 =?utf-8?B?Mk1VUkpuUlVjNHY2SXVSV0h0M1NJWmtSd1poOW5UNTZxeEFYdlhRTmJKWlRL?=
 =?utf-8?B?bWFJUlRiejgvY3A5ZnpvNVN1QzE4TmtOc2dObHExajNkbGRpdHZnRTRQeUlo?=
 =?utf-8?B?MjFaSUtDU2JVZWlTU25YYW9jWklQQTFFQ2ZnUDN6ekxhVmhmWjVPYVU1L2RO?=
 =?utf-8?B?VHZwZ0dCemVpeDFSUFdGNkE1ZGlkK3dJZGdONEhZSHlIT2pjSmNhMUJGbTVa?=
 =?utf-8?B?TFZJQk1tTE95b1Btd3llN1B6aXFiZFRlSEJvRFB2bktWRXlHZjViV0Zra1VK?=
 =?utf-8?B?OTh2Uk83YU5XRlhRd0YrYXpQeDNaYzhSUzJyaGlQU0lLYndFMDY5VDlSY3My?=
 =?utf-8?Q?vihL+q9C2+DK4KeV9cBrMPws482WvDt3C+70x7X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b56774e6-e2d8-47fb-8edc-08d995470487
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 10:30:50.2079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3146
X-OriginatorOrg: citrix.com

On Wed, Sep 29, 2021 at 03:14:46PM +0200, Jan Beulich wrote:
> Wire up show_hvm_stack() also on this path. Move the show_guest_stack()
> invocation out of show_stack(), rendering dead the is-HVM check there.
> 
> While separating guest and host paths, also move the show_code()
> invocation - the function bails immediately when guest_mode() returns
> "true".
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: New.
> 
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -303,10 +303,6 @@ static void show_guest_stack(struct vcpu
>      unsigned long mask = STACK_SIZE;
>      void *stack_page = NULL;
>  
> -    /* Avoid HVM as we don't know what the stack looks like. */
> -    if ( is_hvm_vcpu(v) )
> -        return;

Might be good to keep it as an ASSERT_UNREACHABLE now.

Regardless:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

