Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ABA7B6BA0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 16:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612235.952077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qngPv-0008GH-Dq; Tue, 03 Oct 2023 14:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612235.952077; Tue, 03 Oct 2023 14:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qngPv-0008Cv-As; Tue, 03 Oct 2023 14:30:31 +0000
Received: by outflank-mailman (input) for mailman id 612235;
 Tue, 03 Oct 2023 14:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/VM=FR=citrix.com=prvs=63394bc6a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qngPt-0008Cp-T4
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 14:30:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 633db057-61f9-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 16:30:25 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2023 10:30:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7293.namprd03.prod.outlook.com (2603:10b6:806:2e0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Tue, 3 Oct
 2023 14:29:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Tue, 3 Oct 2023
 14:29:57 +0000
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
X-Inumbo-ID: 633db057-61f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696343426;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Tbo3ldbRGxQ909GNcXG5NbYgMqz8VPtptEYB9Bb/sEA=;
  b=FH4hPd+hNrQoODpXl+hOWatnl5Ba6ROsEOXIZP/8FrGGy/MHtYpyX3Aj
   WQaCnF5Yoou910K5PH0URhBAoP243HCkinMWfgKhrmgJFGofJxDn7btCs
   iOfunj4KeSMr47l9Yg4SyPgKUJGKM37875fMO0TDbK0K1DNjQp1Z5ABiz
   0=;
X-CSE-ConnectionGUID: Z5ss70H1TwmP8uXJs6EN1g==
X-CSE-MsgGUID: TAaYNDSEQDSb74oEdBdG7w==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 127253783
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ZxAJmqxKu6eWFm/T0Mx6t+fHxyrEfRIJ4+MujC+fZmUNrF6WrkUDy
 DYbWm7QPfnYazejLY8iaYS19BsC756EzoNnTAM4qiAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmPasT4DcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVMT7
 udHcBBUUg+Gv7Kr8JCgFMRK38t2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WQx36gB9JJfFG+3sJDiWy16lc+MTEtXwTnptS1oEKRBM0Kf
 iT4/QJr98De7neDUtD4VgaQvH2AsxgTStdUVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWVRHSH5/GLpDW9ESEPKCkJYipsZQkP7sTnoYozpgnSVdslG6mw5vXqHRngz
 jbMqzIx750RkMoK2qOT7V3BxTW2qfDhVRUp7w/aWmak6AJRZ4O/YYGsr1/B4p59wJ2xS1CAu
 D0OnZiY5eVXVJWVznXTEKMKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCMfIfj16ZYyjy8ZXdKA==
IronPort-HdrOrdr: A9a23:3e/U+KrQC2KpvAj9OQeC7aEaV5tMLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qhoPRPAh3Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6f071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6p9XaoxV/Y5eDpTjMzDMRMwapfbxvi8kIl+PVxyr
 hC0W61v4deSUqoplW32/H4EzVR0makq3srluAey1RZTIslcbdU6agS5llcHpssFD/zrKonDO
 5tJsfB4+s+SyLTU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2Et0ykMJrfZv6ksoxdYYcd1p9u
 7EOqNnmPVlVckNd59wA+8HXI+eFnHNaQikChPSHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8JfV70A8Hm5uwEzvn0ehT/Yd3R8LAd23Ag0YeMAYYDcBfzB2zGqvHQ48n2WabgKr
 KO0JE/OY6XEYKhI/cP4+TEYegjFZAvarxqhj8FYSP+nivqEPycigWJSoekGJPdVRAZZ0jYPl
 wvGBDOGeQo1DHYZpa/ummcZ0/Q
X-Talos-CUID: 9a23:EscQXW1SLSbSQqNBx2RbbLxfKJ0+aSKF7C7sPEqAWXtZaqbLZHnJ9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3Alv1bzA/xYJ7EPtEI7OsTSs+Qf/tB6pWIJHsgqLk?=
 =?us-ascii?q?9sZbYMgF8ETuy0yviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,197,1694750400"; 
   d="scan'208";a="127253783"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyNlgygY5S13QpcU+3Fj7aWFq102O5Zc+6738jWV6K4cacYkMqAwK4R2JGU72WgcDOGnsKZHz5k88uwvnnwX4+l6KIYdAofLJ7G8yvoG2ygh1K4BSyTWt5z9oVIxrJszqiAhb5WKK2wSuKxgqOlJOpfEa0MbHqgsvKEJaXLXc7EgRvFKtLnJ3E2OJBaZkces3lzWnjVL6NY40Utp96cGuO19kVqvxhnj4Y+FkTcHSy/ogVyWKIt8Mcs7jkVNBxXX3pUE7f7R9Bb5Kuq1OBE5yapxpB6gsYo5RpFvvm4tMQUu5i/EHganLX489MeAThcw+jk5wmJts9yxtnsspxYQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+t61lgnBvuF4GtqBUIqxWJ8i13nyqtD2oICqzCJ/p0o=;
 b=AThs9GgqxxuYZWZamC40HGYMzBEKi7f3PGnfYZD92Rh8rJlJYxKBgSjErg6Vn5Z4zqu8NISmCS42Ji0ZHO/SW6C7xfycdBN5cHf1/6ypS5kHY2ux51iDhoahDWvzs2wGHi0rMFj+eRhUS93FRLl0ybKKPwPtzurd2eWVsBJudcm/FAwsAwpYr2tuxCPqMAd28vN+XkZyfiiZsZ9Y8JTDIXwKAhokC5+Atxt6jSW1k0JqYlGo0jInN+GgZu07BiYxFiz2wX/JnZhuMn+yikwidpJtA8pY+Gd+2Mgeo5pxmJo6Npg230GITXXgEDNXvq9efE+ETbaKERK2c8Do+nS8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t61lgnBvuF4GtqBUIqxWJ8i13nyqtD2oICqzCJ/p0o=;
 b=sT/JsDB1eRB1X0614d6y0a13ta5MAZdGOp7+AgP6WIenbMm6tKyLV4vuhMYS1qom4sS8i3H2U3jzbEYxLT87sERfFTK7i4cdGEKAwavQq0G3ciH1ThDopSaM+foZ2GtJ720JC8ODs0QNQ5+ooEt41M7jNM1N5jyQEj2BuXlIXxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 Oct 2023 16:29:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org, henry.wang@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 06/10] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZRwlXls8xRyc8AX4@MacBookPdeRoger>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-7-roger.pau@citrix.com>
 <CABfawhnHg3KrGP-hp4_Q8GvSf2nVSVSyK24HKqAGuWp_AtD8-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhnHg3KrGP-hp4_Q8GvSf2nVSVSyK24HKqAGuWp_AtD8-A@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ed60fd-3a78-447c-5c95-08dbc41d37fb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6CSNvjsIlNh/RADGL7eWRYnQHuABaDktIJGpo+zMImF+KREO9ouHmLGYNt/1XV2J1bNpTZ1CwQTkEZcw8LQvzgMQNIQsry2nYx6ZQP8LUOBGa/hhhLgFpMfQciOWE3nqtONJtRE2mwEpeDJSh6znep6juhpTOXUR+uzDKpJLDIZYFX65yfC+z9E8mrWi/bzsDkue3CGHRi1oHZ/4xwKtXyvb7gNtcyhLoZjc4B5V3a5IhzqeFaK/oUSwf4hexjuFE5Fmb9L02O5dETlUNUk63IxtrQ/aWHXvT2ptLo/93gF8ycjwjmkPuInOilL5B4p0r1X3wYAN5Ykb8WK7C+6zbc2kosu+UPAUEQFrxt7R4q0RBMoU/TxlG+mjNKzo7OWh9i5g7rKelFgQe43ozUmMDB75TRcURM5fqsvJwDk5yOhlcyjodIO97RaQvvkjDQM1Ejb45xeSirpTKHSoi3FQwIR4+cB5BddZHRwHw4CJmNMQIn643lXo5mlDVZNcfmbA/osJD0GgeZrdvmpRg5YkRlxApv0+CwJObfcfyFyXqJaOH4A9ue2zHPYmim90sHmS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(346002)(136003)(366004)(396003)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(83380400001)(86362001)(33716001)(85182001)(38100700002)(82960400001)(53546011)(316002)(66946007)(6916009)(66476007)(66556008)(54906003)(6506007)(6512007)(9686003)(41300700001)(6486002)(478600001)(6666004)(8676002)(4326008)(5660300002)(26005)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFAycXIyYmhEcmtVTWdpSnB6b004S21vd0pTaDNobjNaVjVlci8xbHl3enF6?=
 =?utf-8?B?dnJRZmlDYU1saVVFV2kvMkJBSG15eUFIbllQZGlZczAxeTRsV2J6UmQyOVpt?=
 =?utf-8?B?cnlGL0k0TnY0a2lqeUxHeTJ0dkZlazlCTEl2T0hEK21Dc0EzMzFHTnNBMFpp?=
 =?utf-8?B?NmVjUFBySnErNG9ZUVJJQXVhaWFxY0dsQTdZSnJXT2xUYXdnTlNZVUJyT2R0?=
 =?utf-8?B?ZHBMZHhoQjdYZ2trSVFpN2xHTTFQQmx1bHJYV2prdGw1UWZBUlNQUjZiWVZ5?=
 =?utf-8?B?d1BTSmFlR2FRTlBPY0gxMmRkZ3JzM0pYak9ZM29hakN5RHZ3c1hOdkkwWnVq?=
 =?utf-8?B?clVYb0dib3JIY25hcXFoTit4UUxqY1pVNWZ5SDJRcG0zQ1JNTUNDQTZGdk1M?=
 =?utf-8?B?aHpjRWVNaXFWSks4bjUwYXRlejZCTGplY1ZKamZheXJIbjlDRm5YLy80WHhu?=
 =?utf-8?B?QjlKRlkzd1hkNmlpK2UyNjZ1S0xMRVVsK1hqSmRISU82MjFWVGR0TFh4Q2Rn?=
 =?utf-8?B?dXIvdDZEWTcwY1JramxISWtzQTZCd2k4NzUyTE91WjNvSWdyeUY4Vk1EU0Y5?=
 =?utf-8?B?aFhZSi84QlJXYkpWY3c2S1hSL3VjTDN3T0pRcm5TV2Q3cnQ3YmZ1VGZxMU9V?=
 =?utf-8?B?QVdwZkdHODZFQjJnRXlhTEloZEM4ZXR0Q0YwMkRwZ2tqaU8vNnpVNS9vbmFx?=
 =?utf-8?B?bHFEbmQ5K1JOcUtraEcvRDI0bG4xeTVQOXg5SnZPVzg3V1pYWlZKLzkydmt0?=
 =?utf-8?B?a3hSM3o1UVM1T254TFJib2dDcytDSTdKUGpaTG0wNVAwVFBnTFNEOG1za2dz?=
 =?utf-8?B?Vy85SzlEUnNzNXdXQmh6Nk1iTUx4MHdMVVgxR1FoR25HRGZBdTd1dFU3YVdD?=
 =?utf-8?B?RDdWT1o5bElFa0hYaFl4SlB0RWJscXNYTEdGQUJ0alNERm1odFhWT25LeWZ4?=
 =?utf-8?B?bVZQQkpOVllVbWRiclFYZDlvNHNFdTdlTHpPeG0wb3QvMlQ4STFVelp5YnYy?=
 =?utf-8?B?Q2s3M1JoN0dId0FvV2lSYlVRc3VRQUxSazl4L2RJWWV3STZ5bkNuaEh4SllP?=
 =?utf-8?B?TW9Jd2wvOERod1hBMlZFK1ovdnZvcnNtS3ZPYUZ2NW14S25oN3Y2TlV0bzdZ?=
 =?utf-8?B?dGE3SFFGRi9SMXVVUDZmMXRFOVp4aVkrZHkxU3g5anN2cFdyOUwyUW1kUzNL?=
 =?utf-8?B?YTA3UDNTMTliZUZmNVgzMWJ1bEtTTm5UR243MEdLdG5uQjlGSlRBeVVIeUtm?=
 =?utf-8?B?SUtDVG43OE40Y0kwaVlsNk1NMGY2YktUU2Z3RGZIbGNsMTZjYWkxTTRNRlZN?=
 =?utf-8?B?L3J2UEFCOVNjTDZaam4wenAyc293QzlJdXVqMzlUZlluYlI1eFNNWGYyWUZ6?=
 =?utf-8?B?KzVCbVR4ZEttUDZKNll3aDZXYU9tUnBuRndzbWdOdjNnbHdvU1c4eWI0eFRP?=
 =?utf-8?B?YzZvL3YxSVFUK3lac1hRcVFoT2tLUnNLUTBCVHN0cllycVZVTi84aW1hQURa?=
 =?utf-8?B?SU1rdGhzQUt0MmNKcGloT1VBamVKT0pacWtIdGhmTkQ4cTAxZEs2U0c3dUlU?=
 =?utf-8?B?MFRRaWVnUFM5em5uZi8yU0VjVTFLRVNLcjZFL3l2K2p2VGh4UGw3Y3F4ZHBI?=
 =?utf-8?B?TlgycTZra0c5WVlpaHE2aU1YOUdCNHJRSGFTZ044bHhhMXJwQ2Q5WVZ4WGZt?=
 =?utf-8?B?YThsbGdFdkZzeE5Qa29GVnlYV1BVUE5QdlR2MDBjOHQweDQ2eDVGd0pOSzgr?=
 =?utf-8?B?MVArZENJYitHMGttK3I0Q255ZVBmb0ZWbklYbXUvT0ZtYk5JLzBHeE0yTURI?=
 =?utf-8?B?N0ZsR2toSFQvcS9LOWtMMEhPVE8yMEVmd3h2RkgzUGNJUjJjaXRjeWtDTHJu?=
 =?utf-8?B?S25Kai9zRmpsMEt1b3FENS9DaHFTVERxTVErQmxWT295RTZsUm5hR25FRTJF?=
 =?utf-8?B?V0lEQUVaakxuVTlEY0dseGNOVzRkc3Ziamlkai91Q2FRSXZzNjRaamFSMHlt?=
 =?utf-8?B?NEY5Rk1hbFFFcGV2aGtMemh5VnhiSngxS1ZsdVJrSlNzMTJ3Z1U1WjJQVU44?=
 =?utf-8?B?WjJFQjZtOWtKWFlhVHplQzd3YWlJUXlsSmxQdE5ucnl3Nnd4UW9xKzIrRExM?=
 =?utf-8?B?MVR0QXpWSXZiUmJSUUptM21yVlIwTW8yS29KYkQ2ZGt3TEc4b1EvM2JGakIy?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZssgIbhhuZ8kiOg9fTa33l+Zv2KLMqOehwqp6KxK2eHRy+/5rHG2i9IyCnmLB/zalMMna0PBcNrwCj+0UaptEngzJREQuG2xZG4FjqElnBvPuihUfWFQhM8YIRbGRqIwQYThJPm0vbou12DOhViAnPIFg0ky7yLDujG0Z5HpK5GVBDevsHzcl2KnIkLTsZVejsw6A26ZXIavNOGx9786dA48ZeVN8X1uNiYEh2wuKDC72hb92CrU1sRIsz2h3mCXzIBRwlHv5L4xrRGxjYjd7SVe6PrytFU6ug5B2WCGTjVjF2pJUu/WPlSjh+8Ig4qHDIN6kw3ft2EJyJ5qNkDc6R7C426K0GCcV4Y17KGjZrwI6Wp18ssESnhVvEslNaIM4/Ly1FaUMtZM58gWTX+OAli94dL9++0h96uJZkVqXZTmXP3CMSoypU3BsscBBbbOdzNRON+f2Jz/sg/EOH1g+zKwxvgS/NmTbEEUJkm75uTIEZjAqxgwf90ga2Ai96hxZ2R1chBwi9IQQVv0YTI0Af37EqEW7646KAQxPV6Amf6f+BEiuq9pJFJ7epsCGh3lVdEnhgOUMuV1wt5uAZkre0HKRIyUdRlhCn+/CbYHeGT4ia1r2SrT0iHfarQ0pfsTQ2CKUUhCHEA3WTCvQ+eBAGsWS0CSDtXezNW1R+v/MWEswGukk1I4JCihjemFw3mJMroARZuFEToyWDqFDJmElEE+da7r6tYYqxLpxIWBiWli8Uja1cOo53iiPNg8soY8esC5KUx5P/htQbwvt/U9nZdmg9/Vr+XDkFUfFVTPjdlAHTgvLxVusMMnf79krllNmYMeDoH/yAYKm/nTBEPcvNIFRFHgcxD8bu+zdnOUmTf1uYNQ7MnjY4QwIvpXzphB+vl4JK9M/5BXH6m9qbGXXzMfDZXXWWjjnZ9e4pj6h7E=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ed60fd-3a78-447c-5c95-08dbc41d37fb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 14:29:57.8584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3Eu7TaOe4lJQVx0O1WJfgau8V+YYL5c+As5zm8/zstw8OoUAb5I/o1Z478Fjm/wxJwVpYPRDzi0ujomhEqmhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7293

On Tue, Oct 03, 2023 at 09:53:11AM -0400, Tamas K Lengyel wrote:
> On Mon, Oct 2, 2023 at 11:13 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > From: Jan Beulich <jbeulich@suse.com>
> >
> > In preparation of the introduction of new vCPU operations allowing to
> > register the respective areas (one of the two is x86-specific) by
> > guest-physical address, add the necessary fork handling (with the
> > backing function yet to be filled in).
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v4:
> >  - Rely on map_guest_area() to populate the child p2m if necessary.
> > ---
> >  xen/arch/x86/mm/mem_sharing.c | 31 +++++++++++++++++++++++++++++++
> >  xen/common/domain.c           |  7 +++++++
> >  2 files changed, 38 insertions(+)
> >
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> > index 5f8f1fb4d871..99cf001fd70f 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1641,6 +1641,24 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> >      hvm_set_nonreg_state(cd_vcpu, &nrs);
> >  }
> >
> > +static int copy_guest_area(struct guest_area *cd_area,
> > +                           const struct guest_area *d_area,
> > +                           struct vcpu *cd_vcpu,
> > +                           const struct domain *d)
> > +{
> > +    unsigned int offset;
> > +
> > +    /* Check if no area to map, or already mapped. */
> > +    if ( !d_area->pg || cd_area->pg )
> > +        return 0;
> > +
> > +    offset = PAGE_OFFSET(d_area->map);
> > +    return map_guest_area(cd_vcpu, gfn_to_gaddr(
> > +                                       mfn_to_gfn(d, page_to_mfn(d_area->pg))) +
> > +                                   offset,
> > +                          PAGE_SIZE - offset, cd_area, NULL);
> > +}
> > +
> >  static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> >  {
> >      struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
> > @@ -1709,6 +1727,16 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
> >                  return ret;
> >          }
> >
> > +        /* Same for the (physically registered) runstate and time info areas. */
> > +        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
> > +                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
> > +        if ( ret )
> > +            return ret;
> > +        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
> > +                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
> > +        if ( ret )
> > +            return ret;
> > +
> >          ret = copy_vpmu(d_vcpu, cd_vcpu);
> >          if ( ret )
> >              return ret;
> > @@ -1950,7 +1978,10 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> >
> >   state:
> >      if ( reset_state )
> > +    {
> >          rc = copy_settings(d, pd);
> > +        /* TBD: What to do here with -ERESTART? */
> 
> There is no situation where we get an -ERESTART here currently. Is
> map_guest_area expected to run into situations where it fails with
> that rc?

Yes, there's a spin_trylock() call that will result in
map_guest_area() returning -ERESTART.

> If yes we might need a lock in place so we can block until it
> can succeed.

I'm not sure whether returning -ERESTART can actually happen in
map_guest_area() for the fork case: the child domain is still paused
at this point, so there can't be concurrent guest hypercalls that
would also cause the domain hypercall_deadlock_mutex to be acquired.

The comment was added by Jan, so I cannot be certain about the
intention, neither I would like to misinterpret his words.  My
understanding is that future uses of copy_settings() might indeed need
to report -ERESTART, and that it would need to be propagated for
proper hypercall continuations at some point.

Thanks, Roger.

