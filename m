Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878334FE27
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103858.198119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYDJ-0005KF-Bc; Wed, 31 Mar 2021 10:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103858.198119; Wed, 31 Mar 2021 10:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYDJ-0005Jb-69; Wed, 31 Mar 2021 10:36:41 +0000
Received: by outflank-mailman (input) for mailman id 103858;
 Wed, 31 Mar 2021 10:36:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYDH-0005Ed-JG
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:36:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 440c7728-2050-4477-a6dd-05bb39e4a66f;
 Wed, 31 Mar 2021 10:36:38 +0000 (UTC)
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
X-Inumbo-ID: 440c7728-2050-4477-a6dd-05bb39e4a66f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=B3R84wGa0btRIL/3aNgrKfpGpevLyFpwyXFTHJnsMJ0=;
  b=SSPNJfXwG/1rMAzA3rau21NMjcro7nbt87SNDxUR9G3MaUUumcRUgA11
   6q0Qo2xAbo+qxmamXchS9OpoyJYRCeK1dbJt/YK2It3EfltWaNhFBO9Lr
   tmrdZIT1zlvOv1PfDX4V3WE3ZUnAaZwZjR2QyBzZrKaV5+nf6lu3ZkCdG
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: J0+egh/HB9w0uExws+9FQpNDWGM/17eI9U5UUsZUD9o912kloBjPpsMtSfje76GBCX7Yrgk3u9
 empouI3GLEc1z/GUM1CYrm0Em4q9ezUxPH78HFRkFllkEIpbH7N3kf36HLnrLHNhtKUr2Yqedn
 csfK+Klyqe5W25YumqNessRWB4pIcWXOTrGQrHYPjB+TW/Np4ekU3Ph0I5NGvx48JS9LK87X6S
 Rc85jLJu4Pz33RV5CR1Ho+vWhBUerwtH2wyrl5wmOQR2twHnhLKOumVJyhNuAa6ctNu61aoSAl
 XEE=
X-SBRS: 5.2
X-MesageID: 40526885
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DHm5Kq4VNS/c6S4p4APXwU2EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbjqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+LpT+jvfMk4/rZgNDOg4/5GC1/E6VwZPZMzzd5BcRVDtT3awvmF
 KqryXV7riu2svLrCP0+HTU6/1t6bnc4/tFQPeBk80Ebgjr4zzYH7hJf52nkHQLrPq06FAs+e
 O80ysIG8ho8XveciWUjHLWqnDd+Q0j4XPj1lOU6EGLyaeSJENYerh8rLlUfRfD500rsMsU6t
 Mw40uju4dKFhSFpSzh5rHzJmBXv3Cpqnkvm/N7tQ05baIibtZq3Oki1XIQOpIBECXm0ZsgAe
 ljAerNjcwmD2+yXjT3uHJiz8erWWl2NhCaQlIassjQ6DROmmtlpnFoiPA3rzMlztYQWpNE7+
 PLPuBBk6xPdNYfaeZYCP0aScW6J2TRSXv3QS2vCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieSfGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erGs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IVQFSLjsXXKpD7l+DSffrJTYCdUwoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwje8PtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7BLvml6i8tFSn5Gqg1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmFyKOwF4VMGTNA
 JEvVx49eaWIvWrtG4fIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjfrdwGwXNHxlcgh1rt2
 9HVQ8BSibkZ3DToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqemEWRAe0UcmcgR8nQh1dgl
 EZyd5ZvJOw3RKUbUcviuUxN1NBLECaGqhPAgi+aIJIobzzYw1rQWCWhTuVtgErdgPRhjYvr1
 2kCRfRVeDAA1JbtHwd6Krs/V9uXki2fk57aBlBwMZAPFWDnkw2/f6AZ6K13WfUV0ALxfsFNi
 rZJREIJBl1+tyx3BmJuTqLGHk83K8yNujFALlLScCU5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku7Kij7B+5B4X3iml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NAgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso6I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmIpA79Ij
 CkglVg1saAeyuIzrgBDa0sZUxQdUgn8XxnldnyPbH4OUGPd+tZ+kC9PWL4WLhBSLKdEbFVih
 ph+dmHk6u2cCX/sTqg8AdTE+Zr82y9R9m1Dx/JMelU88aiMVDJu5CU2qeI/X7KYAr+TV8Zi4
 1DfVERacoGqgBKtvxJ7gGCDortokwklFNC5ypAjVCF4Pn+3Fvm
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40526885"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zzc/wNQ3ljeOR4eZhtwJUbxP/AuLct8xKDkONao4O3aXc13WRZsA0D+11QY0XVwyETlmrB9xLOJWTkEyjDyCR82d+lqkKYEjdoWfe3RgDnezp/EB2AeN4bcqboWztzBht23dWz25DxlD5huxZMvHImjkiEb1NK8zDS0LCYK/pP2hPKk6jEQv0dhi6k7BPvQxTJ9XJvMQcXbvdhQRvfSkR3noZ7XnSPz3bRYDscUJTGYcY+EuOHCTeoMv8VLsMtpmmcpehtS7CWswcaJ1L7ziJg3FBBdubHVFNb4JeNY86cQ7Wuuw6gc6EbVv6yAf8DgyowlR9orFxiQFSHAXpTnFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBYI1lpn/Fj2wAf8tHHymIobOKG3y0f6hpA3NmNveyE=;
 b=aleQpKvS2SO0DBknfMZ5EkFTOzRlnwfF4sVpIUSegYCJPNguTymaw+md6/3URuG5wrsIJI70A/b17FxkrAFgJxMJZ6o1ZQDpCQiWaReaPHr3NbLrm72EVJ4PaKkIujV8J14EKYEx78ZihJ6fl25ysukFfhH6Ac5eFGx+riTI/5kI9WVXYEqRTp3UycursdyhV50dXDATpms6FNPjJs3vg6kAHMP+dcj/TrLLBZGQ4LaQR1CSYaiRRGsbuLVX7hctI+dij5n+swGBGnfaTaBWBxKjm94Rb2ADwplkcY6KgATlLAHWTVDTVVM36m60H3hhu7rdo8Gj9ToHznQ3FNfymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBYI1lpn/Fj2wAf8tHHymIobOKG3y0f6hpA3NmNveyE=;
 b=ApRSLVEpeO1RkHrFz+izAix7NlukknuZu9a3BB/Ez1F1DNZa4GFynfHttRxfcelcnMjKDCYuBg8G00Ndm9BvNRZyXwVwIzZ4mYbJpms66cgbg+7PqcjCNeZg0Cp+mJfN/wnNu4jF9U+waTv1oXdZHVrGDGrdyOIBB3TENd6idhY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 10/11] x86/vpt: remove vPT timers per-vCPU lists
Date: Wed, 31 Mar 2021 12:33:02 +0200
Message-ID: <20210331103303.79705-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0079.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aed7e27a-8a5d-4e4e-d2fd-08d8f430db10
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5968C422491B68B1EB3573DB8F7C9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0PS4fuAgedwJDFLy+NSQUDq58ytXpZ/X9mmNtwnv86dlymuEghiUCFGgNmNGw4OUjJZ4RTa3V04BCz8U2NiyYUX4yFAqP4Rs6GkVLZAvk3yORj8wNqXhRvV+UuYaTT0x7FmpWRgqR30jivksDhLJkvM7C+iVGBWyylW4jcKDqwSvbfwU8CQlbFGp8LVQluyXNXbioGub5L1aBr9aP79R3Uoc4VuY8QrhUUkbuiiPSD1LXk7ilAUX9RjYDUTyt5VNZSZVgdIyGSdwyJTDU1wNbtQW254peqBIV3gKyVMzDiB6Aoumr6jYROKtckAG5ktasx61uvmSHYvTiohJc6l93bR6DOHXN3WEgw0DE9ZE7r5aaZnzgQs4MdCGQZZAAZ7z/9ZQq5YiP4DRU0jd9b/Nb16Cq7P17b+LhGzOrNyQmLs+7SMqttlkTkIZPMLbhT0V7ZyaJ0wO2t7aa79EjAb+k6nNXr9B4Fw4FsceRYs0Mi+MzwijsmRFssVgiRMmdlXcGK8yZlglKog3uMGw+Vr9tbjT/OP+Dnr3oWf4F2Daopi93bCz5lLMIfC0TmZrFlUdBmQ8RyenQHJpBcWO8UAjsmVJ8f7vx+GvXr2dMm5Vb20WToYvDFcyIg7SbUqUCHQURhRyxO7WodsPLUQhSujGHRtq5KIQnQ/4W4i0FyJ4eq0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(26005)(2906002)(6486002)(30864003)(8676002)(1076003)(36756003)(38100700001)(8936002)(83380400001)(16526019)(86362001)(186003)(6916009)(6496006)(66556008)(66946007)(478600001)(66476007)(5660300002)(316002)(4326008)(2616005)(6666004)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzYvT0duUnhyWVdCQlFWT1g5SnFMVFVXeTNrMEtuSHhvemFNY3FHOU1MbFJE?=
 =?utf-8?B?dzlGQjRTcndRd2hhYXRFK2s5S0QvU2NPT0o2ZXZpOVAzL0p3RTRKeHpmek1J?=
 =?utf-8?B?emQ0NDVkT3FFenVlYmpDYlVtbGFHNlVvTmtGY21jSEhGTThnRUluSFBTTHlD?=
 =?utf-8?B?NzAvUlkyOEQ0SnFveUFBZkwyd3lrUXg3VTJkZzJaL1BOTEVZUnBpOXdXVURY?=
 =?utf-8?B?MzFzd041dHk5QnZ2WnFoVjRqZWZHSlA3a0VLaVFnYlo4bUtYQWNjTGkrb0RU?=
 =?utf-8?B?OW4xaXBLWGNudU56anorcXpPMGJoT25GTmtRcnlIRHpvUkQ4R3Zjd29oY2ZW?=
 =?utf-8?B?Y0g4amRKWkJkRmUvZEo1L2tmV052Z2RCS0hRb1V4U3c0MHdpeFMvZTJXQkND?=
 =?utf-8?B?NzhpWm5selUvUm5HNTVNaW1CQjcxZk5RSWdNRkNqczZCT1hMWFpIQ1Voa3l6?=
 =?utf-8?B?Tk9JMFcrWGYrZkl5aWllY0k3aWMvTjJ0N3ZjK0VjUXI0ZHExcWhRdGpySnJV?=
 =?utf-8?B?Q2J2V0xMV1k2aWcrK3lBNGxnNTNiTWNVZzJsU2U4bGNOS1VMZ3BucmJNc0JN?=
 =?utf-8?B?K3IrU05nZ1RwVnY0Z0tacGhwTGdkSUtnbE5oc2NnM1BQNDV6SCs0aUgrTUhQ?=
 =?utf-8?B?cTU1NVlLbTZNaXN6Nll5VUhHaFgycjJCclJmVStNRHNlYkowNWl6VDJzSFgx?=
 =?utf-8?B?SjQ0c1B0aUJlWVZyNHo3MFY0enEzM2xoV1VDejA3a3pNem9UU0cycThaMGJj?=
 =?utf-8?B?UDROSW1zSHlNbmdJb0pGRkJmRWlDenJNRHUxb3pTbWNBSUM2SkZnTW5TTkJB?=
 =?utf-8?B?R0gwd0RieXM2dG9tOVhkMDBpQjlTaVZ6bkVxdlI0dGZWRm5lakZDS1VuVTVT?=
 =?utf-8?B?ZHltOFpkSXgwQWFoaHl1NTYwUXlzTE45RzlKRmdXUzIxOTN2d0Vnc0Nkdjlk?=
 =?utf-8?B?ak9ybzcxRzlrSUtMenVJaFpCS0JRVHpETEhGUW8rQmRFT2pMMWtYSVdKZjQy?=
 =?utf-8?B?Z1lhejhQTTBMTFQzelFjN2s4REd1a05wdHZWZElLQlpVUDZsYkN1SEQrNys3?=
 =?utf-8?B?VjBvMFJCVTUyRnRpVkJ4OGlGUnUyaityYXZodnRMYWZJRzdrUEJXMXNabXFG?=
 =?utf-8?B?ZlpjK0F5MlJXVGg5Y2JUWWViK0t0ZWU3RlVHVUhyNXpURWlTOXhWSHpoR29w?=
 =?utf-8?B?cEIyZGJDL2ZITWRjTkovZytWU0R3Ly9nQk44LzdHalBpSHJ6Q2Q5a1hMY3Zj?=
 =?utf-8?B?Qk02VkZBYkt1V1U2VnBSbUpSeis4bjAvK2lBTnhLb2xNSDdTUXMzSGpoRUt0?=
 =?utf-8?B?Yjgydmp4dis4NThLRE5EZWZvUUdkL09WSCtmSTh4RXdGdkdvMmFMOCtEd3Jv?=
 =?utf-8?B?U1c3cjJmeWxvZDBzSnNmemRsaHlPNVEyRnl4NDFyYmQ2eVA2Z1JHS3ZJa1FM?=
 =?utf-8?B?Nzg5R0hySnZUd1N6enQzY3FtaWJrR0R1ZVQ0S205dDdBSkhQN2Q5bGhYTmlr?=
 =?utf-8?B?Qk9qam9HTWdYdHVQNTd3N0lWdURoSlYwdkZjTWhBWU5EbVlaNVFhRyt5ZkNt?=
 =?utf-8?B?WEdlaXJYYUN3YXJQc25lUXA2YTJKSnRxVGVsb1lxSnJsZTNsaVhGbER0TG5a?=
 =?utf-8?B?TWY3dk9CenlwU1gxYVhEaitqQkdqaUlodG5pSE5GUVI2VGVzTURNT0hJOUFQ?=
 =?utf-8?B?V01jSFJiTWwyZmxzcjE1SmRsMnQ1a1l0MVBaSloyS2NoNDJVTG95UElub3pZ?=
 =?utf-8?Q?YRHzQmSsUE+1XoBjzLO6P7yG90Mh2+Vi2+rcMtO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aed7e27a-8a5d-4e4e-d2fd-08d8f430db10
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:36:34.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9TtQBuLChHUbdsPZotUwQ+IHZ++3MlAJI5FN7ZTQ+Ki6MDfd60FE8FBxTCNe4X10V++9JGzVeWMo+vXE8iMYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

No longer add vPT timers to lists on specific vCPUs, since there's no
need anymore to check if timer interrupts have been injected on return
to HVM guest.

Such change allows to get rid of virtual timers vCPU migration, and
also cleanup some of the virtual timers fields that are no longer
required.

The model is also slightly different now in that timers are not
stopped when a vCPU is de-scheduled. Such timers will continue
running, and when triggered the function will try to inject the
corresponding interrupt to the guest (which might be different than
the currently running one). Note that the timer triggering when the
guest is no longer running can only happen once, as the timer callback
will not reset the interrupt to fire again. Such resetting if required
will be done by the EOI callback.

Since virtual timers are no longer added to per-VCPU lists when active
a new 'masked' field is added to the structure, to signal whether a
timer has it's interrupt source currently masked.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Remove pt_{save/restore}_timer and instead use
   pt_{freeze/thaw}_time.
 - Remove the introduction of the 'masked' field, it's not needed.
 - Rework pt_active to use timer_is_active.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/domain.c          |   4 +-
 xen/arch/x86/hvm/hvm.c         |   4 +-
 xen/arch/x86/hvm/vlapic.c      |   1 -
 xen/arch/x86/hvm/vpt.c         | 174 ++++-----------------------------
 xen/include/asm-x86/hvm/vcpu.h |   3 +-
 xen/include/asm-x86/hvm/vpt.h  |  12 +--
 6 files changed, 27 insertions(+), 171 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b2127298800..a711ff2814a 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2014,8 +2014,8 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
     vpmu_switch_from(prev);
     np2m_schedule(NP2M_SCHEDLE_OUT);
 
-    if ( is_hvm_domain(prevd) && !list_empty(&prev->arch.hvm.tm_list) )
-        pt_save_timer(prev);
+    if ( is_hvm_domain(prevd) )
+        pt_freeze_time(prev);
 
     local_irq_disable();
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0279014e66e..3a72da67ef2 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -489,7 +489,6 @@ void hvm_set_info_guest(struct vcpu *v)
 void hvm_migrate_timers(struct vcpu *v)
 {
     rtc_migrate_timers(v);
-    pt_migrate(v);
 }
 
 void hvm_migrate_pirq(struct hvm_pirq_dpci *pirq_dpci, const struct vcpu *v)
@@ -544,7 +543,7 @@ void hvm_do_resume(struct vcpu *v)
 {
     check_wakeup_from_wait();
 
-    pt_restore_timer(v);
+    pt_thaw_time(v);
 
     if ( !vcpu_ioreq_handle_completion(v) )
         return;
@@ -1558,7 +1557,6 @@ int hvm_vcpu_initialise(struct vcpu *v)
     hvm_asid_flush_vcpu(v);
 
     spin_lock_init(&v->arch.hvm.tm_lock);
-    INIT_LIST_HEAD(&v->arch.hvm.tm_list);
 
     rc = hvm_vcpu_cacheattr_init(v); /* teardown: vcpu_cacheattr_destroy */
     if ( rc != 0 )
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 63fa3780767..8091b6d8925 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1339,7 +1339,6 @@ void vlapic_adjust_i8259_target(struct domain *d)
     if ( d->arch.hvm.i8259_target == v )
         return;
     d->arch.hvm.i8259_target = v;
-    pt_adjust_global_vcpu_target(v);
 }
 
 int vlapic_has_pending_irq(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index f951cd95bcf..84d49c1b25c 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -126,18 +126,6 @@ static int pt_irq_masked(struct periodic_time *pt)
     return 1;
 }
 
-static void pt_vcpu_lock(struct vcpu *v)
-{
-    read_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
-    spin_lock(&v->arch.hvm.tm_lock);
-}
-
-static void pt_vcpu_unlock(struct vcpu *v)
-{
-    spin_unlock(&v->arch.hvm.tm_lock);
-    read_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
-}
-
 static void pt_lock(struct periodic_time *pt)
 {
     /*
@@ -151,7 +139,8 @@ static void pt_lock(struct periodic_time *pt)
 
 static void pt_unlock(struct periodic_time *pt)
 {
-    pt_vcpu_unlock(pt->vcpu);
+    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
+    read_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
 }
 
 static void pt_process_missed_ticks(struct periodic_time *pt)
@@ -166,14 +155,12 @@ static void pt_process_missed_ticks(struct periodic_time *pt)
         return;
 
     missed_ticks = missed_ticks / (s_time_t) pt->period + 1;
-    if ( mode_is(pt->vcpu->domain, no_missed_ticks_pending) )
-        pt->do_not_freeze = !pt->pending_intr_nr;
-    else
+    if ( !mode_is(pt->vcpu->domain, no_missed_ticks_pending) )
         pt->pending_intr_nr += missed_ticks;
     pt->scheduled += missed_ticks * pt->period;
 }
 
-static void pt_freeze_time(struct vcpu *v)
+void pt_freeze_time(struct vcpu *v)
 {
     if ( !mode_is(v->domain, delay_for_missed_ticks) )
         return;
@@ -181,7 +168,7 @@ static void pt_freeze_time(struct vcpu *v)
     v->arch.hvm.guest_time = hvm_get_guest_time(v);
 }
 
-static void pt_thaw_time(struct vcpu *v)
+void pt_thaw_time(struct vcpu *v)
 {
     if ( !mode_is(v->domain, delay_for_missed_ticks) )
         return;
@@ -193,52 +180,11 @@ static void pt_thaw_time(struct vcpu *v)
     v->arch.hvm.guest_time = 0;
 }
 
-void pt_save_timer(struct vcpu *v)
-{
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    if ( v->pause_flags & VPF_blocked )
-        return;
-
-    pt_vcpu_lock(v);
-
-    list_for_each_entry ( pt, head, list )
-        if ( !pt->do_not_freeze )
-            stop_timer(&pt->timer);
-
-    pt_freeze_time(v);
-
-    pt_vcpu_unlock(v);
-}
-
-void pt_restore_timer(struct vcpu *v)
-{
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    pt_vcpu_lock(v);
-
-    list_for_each_entry ( pt, head, list )
-        if ( pt->pending_intr_nr == 0 )
-            set_timer(&pt->timer, pt->scheduled);
-
-    pt_thaw_time(v);
-
-    pt_vcpu_unlock(v);
-}
-
 static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
 {
-    pt->irq_issued = false;
-
     if ( pt->one_shot )
     {
-        if ( pt->on_list )
-            list_del(&pt->list);
-        pt->on_list = false;
         pt->pending_intr_nr = 0;
-
         return;
     }
 
@@ -252,7 +198,11 @@ static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
         pt_process_missed_ticks(pt);
 
     if ( !pt->pending_intr_nr )
+    {
+        /* Make sure timer follows vCPU. */
+        migrate_timer(&pt->timer, current->processor);
         set_timer(&pt->timer, pt->scheduled);
+    }
 }
 
 static void pt_timer_fn(void *data)
@@ -268,21 +218,15 @@ static void pt_timer_fn(void *data)
     v = pt->vcpu;
     irq = pt->irq;
 
-    if ( inject_interrupt(pt) )
+    pt->scheduled += pt->period;
+
+    if ( !inject_interrupt(pt) )
+        pt->pending_intr_nr++;
+    else
     {
-        pt->scheduled += pt->period;
-        pt->do_not_freeze = 0;
         cb = pt->cb;
         cb_priv = pt->priv;
     }
-    else
-    {
-        /* Masked. */
-        if ( pt->on_list )
-            list_del(&pt->list);
-        pt->on_list = false;
-        pt->pending_intr_nr++;
-    }
 
     pt_unlock(pt);
 
@@ -304,22 +248,12 @@ static void eoi_callback(unsigned int unused, void *data)
     pt_lock(pt);
 
     pt_irq_fired(pt->vcpu, pt);
-    if ( pt->pending_intr_nr )
+    if ( pt->pending_intr_nr && inject_interrupt(pt) )
     {
-        if ( inject_interrupt(pt) )
-        {
-            pt->pending_intr_nr--;
-            cb = pt->cb;
-            cb_priv = pt->priv;
-            v = pt->vcpu;
-        }
-        else
-        {
-            /* Masked. */
-            if ( pt->on_list )
-                list_del(&pt->list);
-            pt->on_list = false;
-        }
+        pt->pending_intr_nr--;
+        cb = pt->cb;
+        cb_priv = pt->priv;
+        v = pt->vcpu;
     }
 
     pt_unlock(pt);
@@ -378,19 +312,6 @@ static bool inject_interrupt(struct periodic_time *pt)
     return true;
 }
 
-void pt_migrate(struct vcpu *v)
-{
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    pt_vcpu_lock(v);
-
-    list_for_each_entry ( pt, head, list )
-        migrate_timer(&pt->timer, v->processor);
-
-    pt_vcpu_unlock(v);
-}
-
 void create_periodic_time(
     struct vcpu *v, struct periodic_time *pt, uint64_t delta,
     uint64_t period, uint8_t irq, time_cb *cb, void *data, bool level)
@@ -410,8 +331,6 @@ void create_periodic_time(
     write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
 
     pt->pending_intr_nr = 0;
-    pt->do_not_freeze = 0;
-    pt->irq_issued = 0;
 
     /* Periodic timer must be at least 0.1ms. */
     if ( (period < 100000) && period )
@@ -469,9 +388,6 @@ void create_periodic_time(
         break;
     }
 
-    pt->on_list = 1;
-    list_add(&pt->list, &v->arch.hvm.tm_list);
-
     init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
     set_timer(&pt->timer, pt->scheduled);
 
@@ -487,9 +403,6 @@ void destroy_periodic_time(struct periodic_time *pt)
         return;
 
     pt_lock(pt);
-    if ( pt->on_list )
-        list_del(&pt->list);
-    pt->on_list = 0;
     pt->pending_intr_nr = 0;
 
     gsi = pt->irq;
@@ -511,51 +424,6 @@ void destroy_periodic_time(struct periodic_time *pt)
     kill_timer(&pt->timer);
 }
 
-static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
-{
-    ASSERT(pt->source == PTSRC_isa || pt->source == PTSRC_ioapic);
-
-    if ( pt->vcpu == NULL )
-        return;
-
-    write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
-    pt->vcpu = v;
-    if ( pt->on_list )
-    {
-        list_del(&pt->list);
-        list_add(&pt->list, &v->arch.hvm.tm_list);
-        migrate_timer(&pt->timer, v->processor);
-    }
-    write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
-}
-
-void pt_adjust_global_vcpu_target(struct vcpu *v)
-{
-    struct PITState *vpit;
-    struct pl_time *pl_time;
-    int i;
-
-    if ( !v || !has_vpit(v->domain) )
-        return;
-
-    vpit = &v->domain->arch.vpit;
-
-    spin_lock(&vpit->lock);
-    pt_adjust_vcpu(&vpit->pt0, v);
-    spin_unlock(&vpit->lock);
-
-    pl_time = v->domain->arch.hvm.pl_time;
-
-    spin_lock(&pl_time->vrtc.lock);
-    pt_adjust_vcpu(&pl_time->vrtc.pt, v);
-    spin_unlock(&pl_time->vrtc.lock);
-
-    write_lock(&pl_time->vhpet.lock);
-    for ( i = 0; i < HPET_TIMER_NUM; i++ )
-        pt_adjust_vcpu(&pl_time->vhpet.pt[i], v);
-    write_unlock(&pl_time->vhpet.lock);
-}
-
 static void pt_resume(struct periodic_time *pt)
 {
     struct vcpu *v;
@@ -566,14 +434,12 @@ static void pt_resume(struct periodic_time *pt)
         return;
 
     pt_lock(pt);
-    if ( pt->pending_intr_nr && !pt->on_list && inject_interrupt(pt) )
+    if ( pt->pending_intr_nr && inject_interrupt(pt) )
     {
         pt->pending_intr_nr--;
         cb = pt->cb;
         cb_priv = pt->priv;
         v = pt->vcpu;
-        pt->on_list = 1;
-        list_add(&pt->list, &pt->vcpu->arch.hvm.tm_list);
     }
     pt_unlock(pt);
 
diff --git a/xen/include/asm-x86/hvm/vcpu.h b/xen/include/asm-x86/hvm/vcpu.h
index 8adf4555c2a..9a756964fb0 100644
--- a/xen/include/asm-x86/hvm/vcpu.h
+++ b/xen/include/asm-x86/hvm/vcpu.h
@@ -148,9 +148,8 @@ struct hvm_vcpu {
     s64                 cache_tsc_offset;
     u64                 guest_time;
 
-    /* Lock and list for virtual platform timers. */
+    /* Lock for virtual platform timers. */
     spinlock_t          tm_lock;
-    struct list_head    tm_list;
 
     bool                flag_dr_dirty;
     bool                debug_state_latch;
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index 9440fe4ac7d..af04efa5e01 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -31,11 +31,7 @@
 typedef void time_cb(struct vcpu *v, void *opaque);
 
 struct periodic_time {
-    struct list_head list;
-    bool on_list;
     bool one_shot;
-    bool do_not_freeze;
-    bool irq_issued;
     bool warned_timeout_too_short;
     bool level;
 #define PTSRC_isa    1 /* ISA time source */
@@ -145,11 +141,9 @@ struct pl_time {    /* platform time */
     struct domain *domain;
 };
 
-void pt_save_timer(struct vcpu *v);
-void pt_restore_timer(struct vcpu *v);
-void pt_migrate(struct vcpu *v);
+void pt_freeze_time(struct vcpu *v);
+void pt_thaw_time(struct vcpu *v);
 
-void pt_adjust_global_vcpu_target(struct vcpu *v);
 #define pt_global_vcpu_target(d) \
     (is_hvm_domain(d) && (d)->arch.hvm.i8259_target ? \
      (d)->arch.hvm.i8259_target : \
@@ -158,7 +152,7 @@ void pt_adjust_global_vcpu_target(struct vcpu *v);
 void pt_may_unmask_irq(struct domain *d, struct periodic_time *vlapic_pt);
 
 /* Is given periodic timer active? */
-#define pt_active(pt) ((pt)->on_list || (pt)->pending_intr_nr)
+#define pt_active(pt) ((pt)->pending_intr_nr || timer_is_active(&(pt)->timer))
 
 /*
  * Create/destroy a periodic (or one-shot!) timer.
-- 
2.30.1


