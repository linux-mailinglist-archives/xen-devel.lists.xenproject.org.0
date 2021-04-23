Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF227368FA1
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 11:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116002.221386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsMH-0002bT-HI; Fri, 23 Apr 2021 09:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116002.221386; Fri, 23 Apr 2021 09:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsMH-0002ah-DO; Fri, 23 Apr 2021 09:44:21 +0000
Received: by outflank-mailman (input) for mailman id 116002;
 Fri, 23 Apr 2021 09:44:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZsMF-0002Zj-MO
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 09:44:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c36b503-ee47-4d45-91da-929ad3d53259;
 Fri, 23 Apr 2021 09:44:18 +0000 (UTC)
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
X-Inumbo-ID: 3c36b503-ee47-4d45-91da-929ad3d53259
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619171058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=FnjIKy4vPMufM1E2A44dzla8avWRqW9V4Gx5/pT11/U=;
  b=doaGTPs1F4rXiVXrOth7NSyPKzmIoBxH7jxQizbJyCvobaoJ3RcBOjUP
   qsIcXwC1VR4963zKbMQbxrekE2tGpo1cNZbPlDE17ZSCKK9Qx0wfl86Wo
   6Fb06Z6/z0l7KPWjsUagog8NJArZhuyv6wUYagLWfhxg7NyD4f7sRZBLn
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vamjpA7vshUN28lcXqHLfkp0uYiF3LQhRHBayNgIS4wkGQf0kyw4PxG7iLfXtIL7crlT4MC4uv
 JbzhIn8bwKm9Fw89Fo6xa46hkL1vBiWwUJT+LgcghziuLdJXVyNDLwLcI8CGKFefYyqRLyeVER
 CO/n0xJaaRXDGAv7Zg75+MT7jKiZmRYQq4LvcG6KYrb3Sse2OBrd/I3QZPC7XNKcro0lrEhq7R
 hTeAeAKEv8aU7CnRhW1166q+Ku0ofCHhgoj+RckGDI95PSv+Lvzur7v6E034fmFr2aWnUWQdg7
 pJg=
X-SBRS: 5.2
X-MesageID: 42643215
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:pE5baq5JcXsw4cT+JwPXwU2EI+orLtY04lQ7vn1ZYSd+NuSFis
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
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42643215"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXOCZfLq4krO+JQ8KWdLiyaJB22F4Pn4xLdFw2xXKOmQ14mPe77fM8Nf2MbKu/RH3rP8IlB8HPEYl3IapuifWyD2mLKlTw9MTGmQFk9wzb8/XeoH4wR7xdw5+Rik3WuAffBfxq0AgFr2vfy52t6fyFVrGH1UOumBA0HSyB1RWJ9BsEHDut73+hA4VTJj7Y3KGXi1lcS0Cqm+/TbuwIUkazoVIuOF0O8YcUet7zzQxgcqny90a+9Z1W5gh3AbKdGqz2ORpyTJ/2ILNKbeSSwvM+7vokO6frLXlqqB9XjSXwuRkiM2n3Ba4mIzBYY5ivMY8Yuud85tV2YojjSQmS9F2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTwYXU5O3V5OqqnU/mlpo7hQAAvN0IpnHHnFd6kULLw=;
 b=XFsKiOIG+nUq9TSB54nLXvSttZnAyyxdHCauyQo7c6v3ibjsZvIEfuF61eded3tsVwxZDjcr4fxb6sABMwAYvGyrRF6ACbmFlqqmcl9n1Pk9pj4TlNYvxwkl8b86a6qENITauvZkHeYgtSnxrdQNQh8aJ/PGw8zRKI5ufwuzgwDu+bAt8LRGcQFVv/dFr2vF4DbozZZCVLDJHSTY3jaUYpLh2X6/erxnwRW6fTyHirHbyGYNMcIk/zs5FLMjf7Pzox+3CL/9EKcsR6lz8ye3qjsl7VmHNMa5mAaMrY9+8wzqJIHBbBU7dotQK8x9p4CAN+F91fRDCwwbEfBIZOXu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTwYXU5O3V5OqqnU/mlpo7hQAAvN0IpnHHnFd6kULLw=;
 b=MFIAHLU6EjbXbncfZNc/l9xKHrxR2u+SQkRDeAe5SOWOJYaCkWl/lYpJMe9GGP0l7/Bb1gc+iUdJsSLVUZaIyGiDyoRZ8VbvEm2Mwh6Jwfh4bCTTXmZF9tS5/ubt8/47kGdFSoSu3bleK2VE8BeyZLLxrIg/1xh47BuLEyhBW3g=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/pv: fix clang build without CONFIG_PV32
Date: Fri, 23 Apr 2021 11:43:43 +0200
Message-ID: <20210423094343.5850-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210423094343.5850-1-roger.pau@citrix.com>
References: <20210423094343.5850-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e797e53-58c2-44a8-c696-08d9063c5b36
X-MS-TrafficTypeDiagnostic: DS7PR03MB5591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55914B940F2B581F73C0A5A48F459@DS7PR03MB5591.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6wq2RkAETP2g0ipHbZu9/xyiRMm55x4yjIgfiW1+zTFwKtsSELua+PVcFVh3+RqDBANv86a5QnX57ovzjQq61CueywqYaVJo8O3IcUyXBVs8U+qDHFwpDniZ+CfISc2jCu8sqrClI8h2CY4h4TA12ajcPTRscVpyhUqIxwUGLEEh67uE+3yw5pErBB5hliUOF9ANQWR9q/wFwLRh9EzsgRwyWLMI5CahLb47TRb4kMcyR6E+I2utVMZX/tgo2JCMIvzK9H8hwtThTJnG5EAjeJDpyR3qiKCpj2U/PFIYvmF0w1f5REzn1X2b9C0lvnYXFtbo+ZgKR445J1KZIYUBNXEPI0JV4kJAIzxJi4F6aG9nTkJSboj0vxHGYSxMNMYmIVCAlIX+Hb3G849jSIoNhECBDV1YiQvKTvPYFb23N8laGsgx4r9e1+EhZc9jozcJGSVakUKgTQDu6BxOFHK+VUJKv8za4BEQnRgKRTdSBEdGAfdcOCqeZPb1Wf4DHvilVbdysWaCcj3p86RQgX8TfNC413cPxEQK+/jv8tiP/V/vMhJ+/m4A0nlBLE1Iru2zSt42/YvdZ65nJeJY4OeoWU7XaJOZUer24W8SM3XVmsM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(2906002)(2616005)(26005)(66556008)(66476007)(16526019)(186003)(956004)(38100700002)(4326008)(316002)(6496006)(8936002)(478600001)(54906003)(66946007)(86362001)(6666004)(8676002)(1076003)(6486002)(83380400001)(36756003)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Zmt0ZjJ1eENwRlNTanhDRTNqZ2VvRStob3NNeDhPQW5jVnE1SFl2cWVXWkl1?=
 =?utf-8?B?VVpGYzFPMUJ0SlYwU01DWHNVSm5rWkhVVk1ldWhha0M2NFlUUGYwYnl1V0Jy?=
 =?utf-8?B?cFNrTk16Ym9UM3BGdTltUkd5TUZ6Qyt1ek1VbllCYnBkYWhNT2tIVllZT1ky?=
 =?utf-8?B?L2c0a2lYbURiQlZHUm5JQ2Y0Qzg1dVF4YStPRXFzdHRWR3NsVjR0S01QRjJM?=
 =?utf-8?B?YjhidERobVErUGFkeTVLM1ptMVlaVFdLa1hYb2lJMnp2Q2kvRWZodGtUL2RV?=
 =?utf-8?B?UDl2MHVLQmJ3TFBqcFpUUUZEN2VYV0t6MnllMURwZ25aTHQzQnZMRTQzdHA0?=
 =?utf-8?B?V0ZtUlhHQ3JUT2c1Q0QyWmE4ZHFBQ0Y4NUE1STBteHhpdzd3L0tOUk9aNXR5?=
 =?utf-8?B?U2xEVmlURmEzdnhDcnRKYWlrL0Z4Zkk2ZkQvVTRZZ1RoTzFqWHh0WXR2UXdT?=
 =?utf-8?B?dk9nakszbU96ODZodi8yVnd1bjJhWDlseU5yaFEvSVVHWGFzZ0QrTXpWYjBa?=
 =?utf-8?B?MStjSzF3V2lITHcxSk9rZ2hyenM2aUJUaFl2eVB5bCs3anZhUXMwUm9KT2hL?=
 =?utf-8?B?d0IvR2sxUUVoNTFoWEhieTdORUZwTVhEcGJPeGxnWWZJd3JHbTVxTUZpNUUx?=
 =?utf-8?B?U3p6TjUzWnppVlhmTXJpa0JIbnBNVWFiWFdpQ0N0RXJXS2c4azhDR2tFbUNY?=
 =?utf-8?B?ZlV1SnlZTExGNlorZk8yQVVSQ0pNVitGV1NobEo1bnlYL3hOMkdpRENOUjJi?=
 =?utf-8?B?Mk9FVEJGSTNnaDVBNUg1ZzhPY2M4Tm9WbEFKWkxFdmhEbFRLdHMxcUJMQUxv?=
 =?utf-8?B?UDZSZTgzajgzaU9QRHpuMGt0dTJJRmNQdjcwSU55MFEvTTUrWHVHMkJwYkRy?=
 =?utf-8?B?MVkwUnBwRjMyUFBrSXl0Vm0wbncwSFZBeUNicU94S1JuRVdKaGdMaFdzT3cx?=
 =?utf-8?B?Y3JSSnRwWWhvSjZiblBFcnNJUDlSR1IrMnRDSVJzcGlwRVBmMWhHS1B4bmtX?=
 =?utf-8?B?M1FpejR0a1dvTjdJN1lrdXVKUXZUeU00QUREY2ZWTFFONTFjeUcvamNNbm5x?=
 =?utf-8?B?Z0hCSmthZGsrS2p3M2Y0RkdJVVd2dVphejA4MzY2WlRQYStSdituSzF0aEtY?=
 =?utf-8?B?UUNNVGJnNkwvOE04bm03c1loTWRyaGNxYVpZY3NyQmg4NWZjejd0NlNMOHJJ?=
 =?utf-8?B?Qks0clBTN1VSakRhS1RPYzhaNXVRek5udVlUWFVEb3hXWWRNd1MrSjI2Z1Nv?=
 =?utf-8?B?ZWMveHhySFU5ZkxpbGtFcEhFemtzU1pIRVk4YWFiUlFKRHJVbDRRM0h5QTJj?=
 =?utf-8?B?M2pDWjBCbURLWm9PRHphSVdEcEtHcjE0aTR2UUhKMCtEZUxINnM3WmhIOEZS?=
 =?utf-8?B?ZzJZanRYWG12NVZoS0Z4eGRBemRkSW0zcXBTMUc4Z0JQNFUyY05DV25tNklm?=
 =?utf-8?B?WVd3b0xWMXpJaXhPWlB5aFhXQ2lPQllDamozWnNjSWZ4aTQ3ZnVDL1c0aHBJ?=
 =?utf-8?B?QzRVd1kzcFo0TncwQlZJV1F0blcrWlc1Rml4amZBRUpYRkdvWW1wd0s5MUVW?=
 =?utf-8?B?eUVlWXVNcHJoU0Jjbi9ybzNQMFo3Umk4blN4bTVlZDQzYmtDckRHWU9NMTBr?=
 =?utf-8?B?Z0NNMXpNZGE5c1M0UlMyTUl3U0xWZ1V0dlp5M3A1YkVqbFZQOWFLMzJwZ3V1?=
 =?utf-8?B?OUZCN2QwdTVkQ3FxTmd6QWp4bW4xc2pQUEdWUnNRL3JzZEgzK0hlb3V1Q2lp?=
 =?utf-8?Q?g+MY5KKwi6g2VUOTCw10SybyCiApvjhLZJF05NS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e797e53-58c2-44a8-c696-08d9063c5b36
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:44:15.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtFOVglOPsYRgmNjPsPv4pgc6atJziUrb2JJ+LWEt2CGkCKd7ANXXeclSjkO33TDUQ0pfYEjDvL/95LU9iaIcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-OriginatorOrg: citrix.com

Clang reports the following build error without CONFIG_PV:

hypercall.c:253:10: error: variable 'op' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    if ( !is_pv_32bit_vcpu(curr) )
         ^~~~~~~~~~~~~~~~~~~~~~~
hypercall.c:282:21: note: uninitialized use occurs here
    return unlikely(op == __HYPERVISOR_iret)
                    ^~
/root/src/xen/xen/include/xen/compiler.h:21:43: note: expanded from macro 'unlikely'
#define unlikely(x)   __builtin_expect(!!(x),0)
                                          ^
hypercall.c:253:5: note: remove the 'if' if its condition is always true
    if ( !is_pv_32bit_vcpu(curr) )
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hypercall.c:251:21: note: initialize the variable 'op' to silence this warning
    unsigned long op;
                    ^
                     = 0

Rearrange the code in arch_do_multicall_call so that the if guards the
32bit branch and when CONFIG_PV32 is not set there's no conditional at
all.

Fixes: 527922008bc ('x86: slim down hypercall handling when !PV32')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Should the is_pv_32bit_vcpu be wrapped in an unlikely hint?
---
 xen/arch/x86/pv/hypercall.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index e30c59b6286..d573f74aa1e 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -250,34 +250,34 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
     struct vcpu *curr = current;
     unsigned long op;
 
-    if ( !is_pv_32bit_vcpu(curr) )
+#ifdef CONFIG_PV32
+    if ( is_pv_32bit_vcpu(curr) )
     {
-        struct multicall_entry *call = &state->call;
+        struct compat_multicall_entry *call = &state->compat_call;
 
         op = call->op;
         if ( (op < ARRAY_SIZE(pv_hypercall_table)) &&
-             pv_hypercall_table[op].native )
-            call->result = pv_hypercall_table[op].native(
+             pv_hypercall_table[op].compat )
+            call->result = pv_hypercall_table[op].compat(
                 call->args[0], call->args[1], call->args[2],
                 call->args[3], call->args[4], call->args[5]);
         else
             call->result = -ENOSYS;
     }
-#ifdef CONFIG_PV32
     else
+#endif
     {
-        struct compat_multicall_entry *call = &state->compat_call;
+        struct multicall_entry *call = &state->call;
 
         op = call->op;
         if ( (op < ARRAY_SIZE(pv_hypercall_table)) &&
-             pv_hypercall_table[op].compat )
-            call->result = pv_hypercall_table[op].compat(
+             pv_hypercall_table[op].native )
+            call->result = pv_hypercall_table[op].native(
                 call->args[0], call->args[1], call->args[2],
                 call->args[3], call->args[4], call->args[5]);
         else
             call->result = -ENOSYS;
     }
-#endif
 
     return unlikely(op == __HYPERVISOR_iret)
            ? mc_exit
-- 
2.30.1


