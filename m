Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC75514580
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 11:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317071.536227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkN3k-0005fa-DV; Fri, 29 Apr 2022 09:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317071.536227; Fri, 29 Apr 2022 09:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkN3k-0005du-9k; Fri, 29 Apr 2022 09:37:08 +0000
Received: by outflank-mailman (input) for mailman id 317071;
 Fri, 29 Apr 2022 09:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkN3i-0005do-Jq
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 09:37:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed1c12c3-c79f-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 11:37:05 +0200 (CEST)
Received: from mail-sn1anam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 05:37:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB4825.namprd03.prod.outlook.com (2603:10b6:5:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 09:36:59 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 09:36:59 +0000
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
X-Inumbo-ID: ed1c12c3-c79f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651225024;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Rop4v5R40LGeUzCkE8sILGrwn1lXGmJdPUUUxOkBq90=;
  b=Y1zvaa15Obj5LgGdHBe9bcnh2s8SKwZRqeOg/JnDN4l2pQjU5PAYuVRZ
   yPzczcrmbSyrpxf8pzkMSFk3NZy+wCMmQ136yWhWB5C3P7//s0bKNfT/e
   od2XHwxUMZqdsEmMIf7oLfqsO4KN11fMZX8REFNAfyByrST3xsAwVRjvD
   A=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 70238441
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:H4ItIatledGlUf7Lbhf3+Aq66+fnVEpfMUV32f8akzHdYApBsoF/q
 tZmKTrTbKuCYWD2L9pya4nn/BkD6JTVmtRhHlQ/+Hg3FHsU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW1/X6
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8QfY6Xw/tHQyBmKH93J/IcwI39ISmw5Jn7I03uKxMAwt1IJWRuZ8gj3L8yBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IHmmtv7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wrP/vprvzG7IApZybK2KsP3XMCwfcBvgn2Ar
 WTEpkTkHURPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzW6vXqFsxg0S9dWVeog52ml0bHI6gyUAmwFSD9pa9E8ssIyAzsw2
 TehgNfBFTFp9rqPRhqgGqy8qDqzPW0OKzYLYyYBFVEB+4O7/N51iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:qAkMnqD5WOrc4THlHegxsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwOU80lKQFmLX5WI3PYOCIghrNEGgP1+vfKl7balDDH5BmpM
 BdmsFFYbWfbGSS5fyKmjVQeOxQpeVvnprY5ts3mBxWPHpXguxbnnFEIzfeNnczaBhNBJI/Gp
 bZzs1bpwC4cXBSSsigHHEKU8XKutWOzfvdEFY7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+4B7B0G346YhQhbLau5J+Lf3JrvJQBiTniw6uaogkc7qevAotqOXq01oumM
 mkmWZUAyzeg0mhD12dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TttgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4dkWUmxjIaLH48JlO61Gh+e9
 MeTP00pcwmO29yVkqp8VWGm7eXLzcO9hTveDlxhiXa6UkVoJlD9Tpm+CUupAZ9yHsDceg72w
 29CNUPqFhvdL5jUUsvPpZ3fSOIYla9MS7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.91,297,1647316800"; 
   d="scan'208";a="70238441"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITQXWxpe0ImC3GChbfaXl7/lB2XfWAOQ3N40ArVPEPrnlrzw0H5puQOj1nbmYZIPaeTVwO+LotZ9WborQq4BHUDmpP2kHuE09u5vdF2xebBsL9iV5iWJ7/XVgcS2iRQ48V9kRT26cdSa1zsFugNI4Nbv1ctCkzlpscXrEfKBOOQPrTqVLnzSv956IqQUgNlADXQd6MfYgv2lqkDH5OoUgELBNzuwvcUYa68AIg+NhgzfMrnF9/y+exhRZtHmnO9rm6nRSdwsfF8cYniNFqBgB1cS0GJQQtn3hBFsZiMrvhGP0FE2+i8+xM7E8VxjzE/5EIgPCTSsntYkK1ZAKIV1wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L930wC+Zn/2IbXAp8S80W4g1JAnY9tSi/j7OYIXn7tA=;
 b=RRyIBPAglkhFs2vWbF+TemvKWRFaYY1z6a4s+y/cxaTeOLFqXK1mWyp8J00octoh5LUguUUOJV/+7m1Ji1UTaOZvTtARn3j3qQpBMIpFGZudsKusQb7GzAbFkhN0NiBuixMb7TDvz4YbOknig1+CA1knebEOJkTBUPhu1CA/qOam54LIh0aNxho8Xt4avFlUesGH2XUmnIwBf6jAYFbszQfLz/l7YsYFUfgpjcwnQQajQ+bBNB29JjcfY1Sp92/PYWGM72SYRn1ort0GjT5x+MqGSqoLK62qiEe+UcGescA5E0oG5OBabhxkJaaj6nmRO1qP5USuHIqNQ9j4MvIEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L930wC+Zn/2IbXAp8S80W4g1JAnY9tSi/j7OYIXn7tA=;
 b=OMafc+poJSof5ACOZI/4UJiiw7qv8hcEa0eblkOXca8GQqGdMTYswFNc8ZQWpOD6TzjIIRAOcOveTOBk5iq1uX8wi+8YFNdvJ/F7z16PyBRg19TqVO5Kjj9Is5WzFCgsWVo3IX9s2rFO1sKTOagKfs0XyRaqWn/nQ7Wh+7w47pQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] linker: fix build with LLVM LD
Date: Fri, 29 Apr 2022 11:36:42 +0200
Message-Id: <20220429093644.99574-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0043.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 710ed1b9-a2a4-4e5c-6e1a-08da29c3cf17
X-MS-TrafficTypeDiagnostic: DM6PR03MB4825:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB4825914A9B66C92F08CC30508FFC9@DM6PR03MB4825.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DwssLMqMXkl5/PpPawZpCJMt1yPX656IOMbSZTFkxHvY96VirEgQBU7O9g74QdU9eM0q9TYt3okLMWnxsww51DlIznG4eNYOKjxorGZu/+Pr2+ggX+1KvtkYJyZ+EshcQwc9u2LvhHE7PsX24icKlX1kwu5J5U25/zF3ERVVKMxI+N7bV9lEfocHeKqtjF7FygZmrw8oD17Ngy/DduRq3tSpPf23nocGRTR0YO8CQXEh1loD+2yp6OX2020QCOxcVYuz4ydDBspxF2mHQ/HPAVrr05Ne09yzguALkyorHPqwf1h+ZWutMZKn07vf4ktszOf8g2jOUFK1faL+CmQhmoyi0CBpcs/DjGvIjaaCyX+s9i/jH68JzP4li6/GuubNMdV2qqtDjB0K54i0xb8LHPNGQdzdzkmmSHVoapyj+hk+V815HAYBxBNoLYfQBBeWBPB3Fa7SAKNoIF4yxbXgrb6yGCCsj4raT4AKXrKM7BYDhyF42nHZ7pVNUMqbuiKJgW6dajDLgexl/3zdACfZax5tFqI2NnjC9C/dNYL9Z4DLlBOBl4VjsHOe4aqSGdcCmwgp6HoIHpo+/btU5Eaz07ygIhEPj3Mu5DcaeZVj7y2RoUjHeZoFpibne+UWTPEkGeRrQ0Pi3iv0D68+pSpwvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(6916009)(508600001)(8936002)(36756003)(66476007)(4326008)(8676002)(66946007)(316002)(82960400001)(54906003)(66556008)(26005)(2616005)(6512007)(6666004)(2906002)(1076003)(6506007)(6486002)(186003)(83380400001)(4744005)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkhzUFVHTkRaVFNqMkVPNFlvdGVrMnk2TmROSzBPMnFxdlR4Zkp4Q1VzdGpC?=
 =?utf-8?B?cE5ZZmZIOW0xV0Zrd2RtT1lOWW9sWlNIaDN1b0JIOGFNUFVIVFVYelhUdmhv?=
 =?utf-8?B?YSt4V1czNWQyRjlDclNyb2FoYUZBTFhxZ1FoVEhucnI0cGwrVDUrZE96Nnoz?=
 =?utf-8?B?WldYL2Q1azhsbU9UOHpRWGlnMEJQNmVZOWdTeDlpRHdoSlhWR3F6aHZEZzAz?=
 =?utf-8?B?Nlk3QWRuUmwvMlR4U3dqN1RYREE0eGYrc3lTdnM1NTQ0a1dIMzNTN1JLbksr?=
 =?utf-8?B?UE1CblBMQmVybDJHb3FTWnhyaWxoZ09Yb1h0czN6TmlCR0hhWlRwMExrQ1B0?=
 =?utf-8?B?aTJLaEhISTZyaDBtQjJmOWI3ZTQ0WG5uTjg3ZkY1U3R3bWlLMDNRdFhVdnJu?=
 =?utf-8?B?UUUwait0NUpUYTVSR2ladkpqOXVwV2YrRy9JZnd6UGR0Z0ZyZGpOdHdzbmRV?=
 =?utf-8?B?WnNtTDkvSWJIaFlxYUgyeEEwdWE1WWdJYTAyTlZMMGI5VGM4WWxBakVHR0JC?=
 =?utf-8?B?b3dBYTFKcjEyWmc2TWRlZGxidWhPYW1ZbnNQTjZQTVlhSENiOHRjUWplNUpW?=
 =?utf-8?B?SE5YVDc4YlMraHhpZmpEa2grR1d0NU1SNWpkRllvY1BaamtsRVZ2OEhRTFJi?=
 =?utf-8?B?QkUzdG1ZSGdxWWRtRTJqSkRoV0JDbzFVQVRUOVRTc0NKT3J5N2tlcVhLMVo3?=
 =?utf-8?B?NlJoQzRBVEpZSDZhLzdyb1dLN1gveXZVMnVRRW4xd0w0dFk5MCtzNEJ5aU90?=
 =?utf-8?B?cnVKT0gvdFI4bHhSVTkvL293NFM2L1lxNFZqd2lDNFM2SmhBWXU2ZldKRXVR?=
 =?utf-8?B?MmJrN2ZQYnZtNGZRa3ZGNkgwRHRvbmVwNUNmd283b3dtTDgwQUpyMkVTZ2FI?=
 =?utf-8?B?MDhiZlliWmJDSjF5R0NreTNHQ0ZsVlNybWFSRWRQcUhFZHVMeXZPVzlzZmZZ?=
 =?utf-8?B?Z1hxYSs3bVhlMUlJYVNQU3lEcEFta1ZXV1BodHZHOUJZMkhjaHZZVlJHQTM0?=
 =?utf-8?B?aWJZN21kbGJtN1g0TXA0dmxEVGlkTVdkOXhYdUljVk1vWU1OelRQVW9Xa1NT?=
 =?utf-8?B?djVsZGt6bUEzYWgrbTdNdXNZYzN5OXZoSDhpaFhPeE1YSi9PYitDYUVBc0Nw?=
 =?utf-8?B?T2taU2xMRDU2Z1U0a0VsSUcvNXJ2V0xLZy96R1I2ZkRMQ0dXZnJncW1mTFla?=
 =?utf-8?B?ZkI5NVdKMGZTdFNaSm1xcVZSWkZvSzNpVXFuWUF1MnRTbUVBR2dqbDNkZlVo?=
 =?utf-8?B?OVAxM2lVVXFuMys5MmN0YlErMTYxTzRLejZ6L1JzTjJvVTJDUHBxQ21qTmRY?=
 =?utf-8?B?Mmw5UXRZNUFQUmp0RXlTNW55eFZzdnpOZDdWdHNsbGZYeC9FTER4ZWVJRVJu?=
 =?utf-8?B?Zmg2NDBzemZNTHlGcjVid0hycjN1UzZvUUMrVlh2Z0RiVTFDZ3NBQlhDbk50?=
 =?utf-8?B?ZVFnTVpzOExieU1oUytWT1pzTk1yN0o5N2s2M3c1YjF3d0tOR0ZJRjdYWG02?=
 =?utf-8?B?ZUJzdzhnREh1d0FyenZJTHVEdWt0RzRucVJCOHFyNWZjWE9ZdGlrcitaaE1P?=
 =?utf-8?B?a3R4a1lxc1I0d050UFA1MnovQnFSZHplNWVSRXNxSW5od0xTVEhqYmNGRUs0?=
 =?utf-8?B?ZUtKZ1hvbm4xa3JCR2VHQ2VHNm5oU1htdExRdlVFYVhOTE56TStieURXNDg0?=
 =?utf-8?B?ZmNEYU0zUmRhSDRYdTd0aEl3VUFBWVgwdzZBZzhiWEowOS8rQkZtdktsSkpa?=
 =?utf-8?B?ZG5MY1dvYWdpRXRORlNOU3RSVEc0L3FtTUY1dmJnOUtRSW54MzdJeEp2UUVP?=
 =?utf-8?B?Kzc5Yms4ZFFuUXpra3BYcmRaeURmYkdMNG1uU3dLWjZRSTNXeXFXUThGVE1Y?=
 =?utf-8?B?YStuUk5UNTNXVXA2YTl6bWpDbm5hM3E3djUydzlPOXJmZFdyTWFkY09OT3F1?=
 =?utf-8?B?ei9SOExNNFlibjRUQVEva3ZPeVg2bHVRUGFyQ09pZHdLdmNhSHVjeFRnT3JG?=
 =?utf-8?B?ejJVMGhyR2gwYi9GWDVSM2Q1azlBeEIyOE44QmhTV1cwclg1NjI1ZUVSa1B2?=
 =?utf-8?B?bk9JYm50dlBMM3ZNUzVlUmxRUlptSi9tNm1EMlJ6bEVtbE5Ob2t1b1NXWE83?=
 =?utf-8?B?UEsyNFY3Z2Y3NmFzeGs5SW9IQThWNWlmdDBIS0R0dDVxZDBXQnVMZDFpYmtE?=
 =?utf-8?B?d1hyR3BhQVZuajhQQ2F5ak51d09ieVNkVktPTW1JMjhqblM3Z3lzYmk1UFFo?=
 =?utf-8?B?WlMwNzdERFhNTldwNHV1dzhTZ0dFSGJ6NVNHUEtJT29ybldmbGowOUdaVmNu?=
 =?utf-8?B?Y09LYWJtbFdUMTlPYjB1b1BkTXRFbDNyUTE3dnJOUEJza09RdW9FUEtxZklv?=
 =?utf-8?Q?cTuCZMM7BmvKYfx0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710ed1b9-a2a4-4e5c-6e1a-08da29c3cf17
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 09:36:59.6921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3vntZj3fEEx8byB0TIzeG6ZMbQTWwDwqPYhhCpXi6ipT2NOb6HPSloE91nhw2lo7SC7ISw9WPA47O1HniCEsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4825

Hello,

LLVM LD doesn't remove quotes from sections names, and thus the
resulting binary cannot be parsed by some tools due to the quoted
sections names.

First patch has already been posted independently and got not enough
Acks/RB, second patch depends on the first one and is the actual fix for
the issue.

Thanks, Roger.

Roger Pau Monne (2):
  kconfig: detect LD implementation
  linker/lld: do not generate quoted section names

 xen/Kconfig               | 6 ++++++
 xen/arch/x86/xen.lds.S    | 6 +++++-
 xen/include/xen/xen.lds.h | 8 ++++----
 3 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.35.1


