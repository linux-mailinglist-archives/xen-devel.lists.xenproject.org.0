Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA356142E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358285.587405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pDW-0005HI-GC; Thu, 30 Jun 2022 08:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358285.587405; Thu, 30 Jun 2022 08:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pDW-0005Eu-CG; Thu, 30 Jun 2022 08:08:02 +0000
Received: by outflank-mailman (input) for mailman id 358285;
 Thu, 30 Jun 2022 08:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pDU-0005Ek-3R
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:08:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfa89246-f84b-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 10:07:57 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:07:51 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB5894.namprd03.prod.outlook.com (2603:10b6:510:31::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 08:07:49 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:07:49 +0000
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
X-Inumbo-ID: bfa89246-f84b-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656576477;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5b/th6kArmUiqQBbSdQYC1Fo21zGwgyT9Qq5XyRFtdI=;
  b=cInC76afEbJ0rQz4zxZ1Gqq3NFb4hcjqFSPvtE2rFEVWzoQBhCJym1mG
   nlAEYlPpyjQ9ThVpNCBbZdZNqJOXFA0YWPXtKSG2Wk5NUsSvWA2CX+rZV
   s5QSmU3skaIfA+rl4/19HdmAGWIvlA3ShkPNi4KTDV7GBSq9Bdl1NphOK
   4=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 74095269
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HNoD/qxhrxrTz9PhaO16t+crxyrEfRIJ4+MujC+fZmUNrF6WrkUBz
 WUdWzrXM6zcNzH2c9kkbIzjoR5VscKGzNFnSgU4pCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY22oDhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqqWRZiIKP/zwifU+Vh1jQiYhBYFn0eqSSZS/mZT7I0zuVVLJmqwrJmdmeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeE+OTu48wMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgL2UJ9QjL9MLb5UDSzi1D8bHNauDwIOGQXMVPwFeZm
 UDvqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtvgWxy1plaUsxhaXMBfe8Uh8x2EwKfQ5wefB0AHQyRHZdhgs9U5LRQ10
 neZktWvAiZg2IB5UlqY/7aQ6Dm0aS4cKDZbYTdeFFVVpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:oqThjKrDLie/MTudz2ml+kMaV5uwL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCAIqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP8f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aiSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7svVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wU9HdwGOtt5Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexjwqEH3QRWvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="74095269"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAa0q+5/J80Aj9tAkXE5qd3vId3UNCQzme56w87RJGYHpvMDd3cgOGLODUX4UATEO72ZA2Co1loLHHEOJZOaOHmzV7BtN/F4VRnZisjvdijk5DLxRpLg0Xmzub720DQa3USWdDbo5OcAh3600FVhNgN3abgrmRi52/6dyi5EjA6PuGGZaYhpr/AcmDTbaa4Gu+rFCidiAd0DIKXTIfALU62q5K23oZO8jXYlniegBMDCx7vy7UafqOCp9hqMo6hU0XG3AR2N/spZMzz3IC253nXtjSXnp9f2DmKVUkJqzpiuwUDY+NJk3WACDIsqPwQvOcPmp81uywL/cP1/X+LPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cv2DunFRSB8qTBkbROka8eJZHPCMPRgJF6AjxqMOXg=;
 b=jPL2/LsrtBv8mEmkLLU6wXsn9QbKI1BDTNDNfX9tL7gnQOPwdTOtQL7sy+wHvEtqmulgKzs9M7uCLn4aKHGcwSG1xwOp+DPquGMJioucrUcHzGDwJ23pOyzvLgRL8c1FZSByd8uO2ZYRmtTu1vWVZzNdHzeuAbiVRcX31BD2Gz3gxusG0D1LUZOOlFTp9z9l0feixbYh0nsNuNfV3/o/kZJDEDTmiNYZ8Q5cYG/Bsg1fjHkT0UXpKQ5VGU7NMVnzQmjjtFA4az1XqzMwbAFbpalzrwI0/yz6K8im6J+/SjJX8OwvSwOBj6P4olCPh0cfrOwkhfUWE+OGzxx4ZE7DyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cv2DunFRSB8qTBkbROka8eJZHPCMPRgJF6AjxqMOXg=;
 b=GH81edFulI9BmVgSFjuZwDeqVGUzyEUZ0SN8MxJfoRrFrVogGiPjxe4PeKswJ2JIDZnJcqWIECNxM4H43Hue21n9oYtle6CWRvlbBkgw2djIVj87lrSppw0AcgQjNS8lLXe1OzxsRlzzHRviYpcUK3qowuphgZY4j8rVzDNBtzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Jun 2022 10:07:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] console/serial: bump buffer from 16K to 32K
Message-ID: <Yr1Z0eK2ub/Ad/kU@Air-de-Roger>
References: <20220623090852.29622-1-roger.pau@citrix.com>
 <20220623090852.29622-3-roger.pau@citrix.com>
 <e45d8dcf-fd0a-6875-a887-5c0dafcc4543@suse.com>
 <YrxuVPMb990xYKi9@Air-de-Roger>
 <b4740e9b-3586-04c3-454a-5d60bae2cc55@suse.com>
 <Yrx7hDevqMgvtMRR@Air-de-Roger>
 <59fe1b28-b173-e497-5b8a-5e0bb6d946b6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59fe1b28-b173-e497-5b8a-5e0bb6d946b6@suse.com>
X-ClientProxiedBy: LO4P123CA0179.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2fedcc7-5f22-4082-9510-08da5a6f9f89
X-MS-TrafficTypeDiagnostic: PH0PR03MB5894:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	otC55MIya8O/iFcLq4Ay1mICOSh4IE7Klf0u8VFuLmhfavqwSAy/+h4jIvB9+OzBTzhFqm3A9ltgfWwkoCx+c5ZJRjsTmKBwIXoUNEAcleS84U6MVP2fpGNQ40RiySjULwEMOHXrp+x8w8z8nnUmtUkQsP/SB2wOLUQb5EjQCOA97X7U9mKBvMwDAYhpvyDI1GOA0ZkHfZUM8/yngj6mYPObl2gTKHe/hOKu+yJz3bKorcRIiWfnG1AMpLCtbAN3LXPKFPNX56mkUi5M4TBWiA4/uv4+BqNUSfmK1c/agtqAwRF3S9Bp9YExVjCcVP0xsKUR+ga1Y8l0hgQZh0gFIxBVnRG6wwsDuMTsWU9LDJ8QME/6Gec4prOohlG/86UdGICVIIhhb1gWUEyEqqaRYl0Q+JXUvIWrfpMivw/y652LFaVz9BAEXvSMlZTIian7BObbK8/94w/4nkmkK7d8uyT10zgnfnsNvyLu9Ij9orraYdokFP1sAH6s6ZHv9PzVi2t1Uy0DuzKy8ppREYON7pkCsjUKS2kfSoOp4w1giRVLGyXECI+BkvbqdRuqu+NmV51b7aqabbLQABn5Brv42edExnOOQuQqqkOFTAtXqypJDvsM8yYeXZzn4cjUsaJv07y4wNmKsbfeE8YTn9Ojw0AnrBlAoVmNH7+9vtF7DhE6wLnUwod4h5J11GAvt2OlxaqkxtFluj2mA5eaDC0QtQIPaAp5lEsQ3JTBpg63Av/dtOXGzB6RMb7g4mZQ0vrUA2rZEL3brkA7IC8upXkSBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(396003)(136003)(346002)(366004)(39860400002)(376002)(41300700001)(86362001)(38100700002)(478600001)(6486002)(66946007)(8936002)(9686003)(4326008)(66556008)(26005)(66476007)(8676002)(6512007)(5660300002)(6506007)(33716001)(6916009)(85182001)(186003)(54906003)(316002)(53546011)(83380400001)(6666004)(2906002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUZXZGpzbmI3UXAzZHZPdFlCc2FTSlNrNzE1RGJNak1jdDlMSmpZU3lzcTdP?=
 =?utf-8?B?eG8rWnZjVGFSNzJZVFk2UHQvRjl4cS95eWhEUnhQMFp5V2pGSTRtdzRlQkFP?=
 =?utf-8?B?YnR1YkNhVWNXdFllaENUanA2Q0FJbUdxNlpZakJoT2llYk01YU9ZaTNwUURs?=
 =?utf-8?B?K1pid1FrTzZ2L3FQSFoyUFFtakQvZDFZMUNSSVlvT1Bsa3pJWEorMWVScjVm?=
 =?utf-8?B?Sk9MNHdkOGVULzYzaUhaV3dpTE1TYmZxaU1rVk56NDlVUElHNDFqNTltOGFR?=
 =?utf-8?B?SHpOc3BjOVd2ZmlkZWN0QnJNaG1RTnlRU2RtQmtoT0gwbmgxTHgvMGxJTEVT?=
 =?utf-8?B?ZzZmUjN5MjFyMVlsMnZIMXZiSldsbkZxRWFCT0dLZ2xLYkRvblJML0cvOFhY?=
 =?utf-8?B?Y1JHWlo4b3g0NzBTL1dENEhwQTNFVHNyN24raTdybm5WZ3pZU2RWL04xUFk2?=
 =?utf-8?B?VGQzYVNSYkVzRnRGNzRoUnBKVlFUNjNtVnRUckpkc3JES0d3TWVicEZ4TU9r?=
 =?utf-8?B?czkyV2F5SWxtQ1JOTEtZQmdPWHA2RlVTNllraElIWUwybkxoV3YvdzU5ZzBy?=
 =?utf-8?B?bGJXYmJKTlFEK0xkWmh1NXJCWVprNm91YnRGZkU0anB3LzRwNkVhV3MybVdZ?=
 =?utf-8?B?a0t5ZlN5UDM3eVhaaHo5ZmdNa1lWeVg5Y2cwN2Y2Z2RaT2JHSlova0lzSmlJ?=
 =?utf-8?B?R1FVUmlGbTFDYm0rREJHT2V3Um9NSzEzbE4xRlpSUm4yNmNhV1BPYkNCS1dy?=
 =?utf-8?B?VzJQRVNGQlVsYUFwQkNGTDBNakVJcWdHQTZmUmxrSnpxK3dMci9wUHZaa21J?=
 =?utf-8?B?RnZKUmRoc0duOWZrNHA3SzVVZHliZTR0Qms4Um9Oa0tVaUxUckYxQ1kvVmJk?=
 =?utf-8?B?RlNPemxrdTU3UWdodnhwamVRdkpZSXVoWEpCWWRaRlIxMlZ1UDBnakRnYTcr?=
 =?utf-8?B?dXhnSUJJbkZBZUpsQXJkQjVuR3h2by9Mdmp6OEp1emtEeDJaYmJpdWJ0dnRy?=
 =?utf-8?B?ZHFBNU5aNkJzSjJWU2crL2taSHo5SG83ZlJWWkYwVUUwdjV0NllvUDBsUm5E?=
 =?utf-8?B?Qm01QlAxU0lRaVNES1F0Y2VTK2YvYjB0alF0WTAvaUNzcHE0MjVCanJQUnVY?=
 =?utf-8?B?MGVDd1haQnlwbTFOR090SzJ3TzFZY2s4cEV4aThyZ2F3ZUpkVWlPS29xTXJD?=
 =?utf-8?B?S09MNHZRNGtPTE95cWZmZm94RjUrR0lPMWY4d0gzNm5GRU9LQ21SNi9VZjMv?=
 =?utf-8?B?WHkrMlNQMzJmSlM2T1hidG1IaTk2WUg5Q1Z3eDhiVDZSVGtlRnFVajNPajlj?=
 =?utf-8?B?UVhiM2dtMzB4WjB1aE5KYlVBeUJLcTFaQTllNWpINzhXUVBpVXpVSlhnS0Qy?=
 =?utf-8?B?ZFdiRG1CWHhscE5ad2dPV2pQaFo3QWcxbFYxR0w4MU9kL2dQT2NPYUFscjlX?=
 =?utf-8?B?MURLUktQc1h4VVcxOWJTNHM3ckIvdkYyaUVyMnN2VFJCOSt4ajlCaXhsV0dV?=
 =?utf-8?B?c1BTQ2NKWE9GT2xuMGxOa3JXWDYvYWR4THVWbHdZZ2lWVkF0azlKY20zaW5B?=
 =?utf-8?B?bnV4OUlqci90M3dPM043Q2ltTXAxVEZrV1Y1U0MrZ2RVbitKbi9sMEFOQkI3?=
 =?utf-8?B?c2c4Vnd6eFJtNmN3UUZweU1nV3FjMkduZU5wTzBUV1U3bWNQQ3hDa0poM0ZY?=
 =?utf-8?B?WnlJend5aS9oSXVLN0RQMTdoS0pLTU9rckVKSHRiOEluU0RhQnBNZWFMMDA2?=
 =?utf-8?B?RmdNVjZkZWtxMVlndjZRNU93SitKK2ZqWGV2bmNuck1IU0pFTjNLVFJ0c2ls?=
 =?utf-8?B?eEFPQ1ViN1JPeFZGOFUwZkFlLy9QKy9uTnhDTGNoWEFKczZKa3QvMFFTZTQ0?=
 =?utf-8?B?cTF1UmE4NG1BNTByUW1PdWhpY25YMzR6a25iYzE4QTUwWmw0eGhORkU2ZEtM?=
 =?utf-8?B?WisrZ2pMMkN0Tm5DcURKUXp0eUpwaXlKaHk3cUxsVGtteXFiMFBTdUV2WVJ1?=
 =?utf-8?B?UnRzbkRRTFp3Q080UHZ2MmZsTjhTWUxzOFpuQjdRSFNhTkt5TWV1RENiT0Rm?=
 =?utf-8?B?NWFiQWIzVGVDUUNIYVV6SGFrS0I2ZXpXcGpEY1NwSDI4YzJjT3pkNnc2UW5w?=
 =?utf-8?B?Sy9Ic21wZWNZMlhXdmtCL2VyY2VoWmM1YWM4Rlp2SDQyQ2VrcHFSeFJXZ2hs?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fedcc7-5f22-4082-9510-08da5a6f9f89
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:07:49.2841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crIH7NFdFlJDOfN0oS0boXpm9WKfgNKNEcKCyQBh6HiuxjZLrZWtu7OdNBUf4EMXDC4x2igcH5Dj+YgwdG5/rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5894

On Wed, Jun 29, 2022 at 06:30:18PM +0200, Jan Beulich wrote:
> On 29.06.2022 18:19, Roger Pau Monné wrote:
> > On Wed, Jun 29, 2022 at 06:03:34PM +0200, Jan Beulich wrote:
> >> On 29.06.2022 17:23, Roger Pau Monné wrote:
> >>> On Thu, Jun 23, 2022 at 03:32:30PM +0200, Jan Beulich wrote:
> >>>> On 23.06.2022 11:08, Roger Pau Monne wrote:
> >>>>> Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
> >>>>> being filled halfway during dom0 boot, and thus a non-trivial chunk of
> >>>>> Linux boot messages are dropped.
> >>>>>
> >>>>> Increasing the buffer to 32K does fix the issue and Linux boot
> >>>>> messages are no longer dropped.  There's no justification either on
> >>>>> why 16K was chosen, and hence bumping to 32K in order to cope with
> >>>>> current systems generating output faster does seem appropriate to have
> >>>>> a better user experience with the provided defaults.
> >>>>
> >>>> Just to record what was part of an earlier discussion: I'm not going
> >>>> to nak such a change, but I think the justification is insufficient:
> >>>> On this same basis someone else could come a few days later and bump
> >>>> to 64k, then 128k, etc.
> >>>
> >>> Indeed, and that would be fine IMO.  We should aim to provide defaults
> >>> that work fine for most situations, and here I don't see what drawback
> >>> it has to increase the default buffer size from 16kiB to 32kiB, and
> >>> I would be fine with increasing to 128kiB if that's required for some
> >>> use case, albeit I have a hard time seeing how we could fill that
> >>> buffer.
> >>>
> >>> If I can ask, what kind of justification you would see fit for
> >>> granting an increase to the default buffer size?
> >>
> >> Making plausible that for a majority of contemporary systems the buffer
> >> is not large enough would be one aspect. But then there's imo always
> >> going to be an issue: What if non-Linux Dom0 would be far more chatty?
> >> What if Linux, down the road, was made less verbose (by default)? What
> >> if people expect large enough a buffer to also suffice when Linux runs
> >> in e.g. ignore_loglevel mode? We simply can't fit all use cases and at
> >> the same time also not go overboard with the default size. That's why
> >> there's a way to control this via command line option.
> > 
> > Maybe I should clarify that the current buffer size is not enough on
> > this system with the default Linux log level. I think we can expect
> > someone that changes the default Linux log level to also consider
> > changing the Xen buffer size.  OTOH when using the default Linux log
> > level the default Xen serial buffer should be enough.
> > 
> > I haven't tested with FreeBSD on that system, other systems I have
> > seem to be fine when booting FreeBSD with the default Xen serial
> > buffer size.
> > 
> > I think we should exercise caution if someone proposed to increase to
> > 1M for example, but I don't see why so much controversy for going from
> > 16K to 32K, it's IMO a reasonable value and has proven to prevent
> > serial log loss when using the default Linux log level.
> 
> But see - that's exactly my point. Where do you draw the line between
> "we should accept" and "exercise caution"? Is it 256k? Or 512k?

Hard to tell, it would depend on the justification/use case for needed
those buffer sizes.

To be fair 16K seems equally random to me, I tried to backtrack to the
commit it was introduced, but I haven't been able to find any
justification.

I think we can at least agree that making the buffer size configurable
from Kconfig is a desirable move.

Thanks, Roger.

