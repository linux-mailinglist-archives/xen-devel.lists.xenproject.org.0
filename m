Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FE535E0E0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109844.209737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJe3-0006mY-9s; Tue, 13 Apr 2021 14:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109844.209737; Tue, 13 Apr 2021 14:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJe3-0006ll-65; Tue, 13 Apr 2021 14:03:59 +0000
Received: by outflank-mailman (input) for mailman id 109844;
 Tue, 13 Apr 2021 14:03:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJe1-0006KX-9G
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:03:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b22a6313-700b-47c6-8043-5dbf28a6fce9;
 Tue, 13 Apr 2021 14:03:52 +0000 (UTC)
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
X-Inumbo-ID: b22a6313-700b-47c6-8043-5dbf28a6fce9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1ZGNdKBhjvThEnMln1+LkfE1eKjpN3KTfKSH625bhak=;
  b=PbnrFhLkr94vYr4zBfwP9MkXVN3fqcVMRWuxDLEqc6rWGX8h4X74vlkL
   xd3KUqJEOLZdaSY2lXX0cnBA5OdlH3vKWpRM2VG5x8GA8O+PvpbiXV0db
   czbMlKGCz3/lc94QKGo0PUu6KvzJQok7tPQBajpe5ED5pqWbbU5Dcbke+
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8gAufaKXGEGoDCe6F/F1z2FkpMfLa8gBEpX6ofA5UnhAwguadMcmbXbU/WFfe/EWUGwjieJXvv
 x2coIsckgwrbUJFpXsdOO4TurK1+uWGhMbzquwTDI6c+UoVFq9tvoAF4PqCXy08y4WW9bfoFRY
 9XVNkLBpGh+REAWLo02V99sOp/9og9GnpUqpwqCaXTslNp2tQQg+IwUe1vVWXV1sUKaPOV/wsl
 zjf/AZAZbl7zQlDKFqKO5tpOEzOach1AGPqw1/KbLcmf044A5xsMlW8btlCzNcYSQdzRDXxdHN
 C1w=
X-SBRS: 5.2
X-MesageID: 42956165
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SDdhiq4TPknhxP4onAPXwU2EI+orLtY04lQ7vn1ZYSd+NuSFis
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
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="42956165"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5BqyPvZiwpyD6PI1ufOTnddjTPosRJJEyWJ0egR42CDlnUs8beoy93a0rjgv42Jm5zzKOOfRa/OWAi2c4E8v8eEGaJuZN761EnV6rozJRD8VdTxIX9ezqroAwKSK1V/5GpTQ4UBOU2cJA1+K7xo6Tua0JcL389dNoTxGk1M9qcKH037zCxNQ99DL108v0gzGmvd9hgzTTZY1VNrjv0A5IXj8KQEFFmldq+CRMpNVKa6gaHHIxGp12eYtCwlqexRjvzjYHrEYlyN77g1Rrcz1lWiK7bPDnJBLfMpNSalCcebjn0GiXSvVNXyxMWli7Yj2l7vxPQUC9OolG1Xst6oJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESxMv/ykLpGDWIhuuWTbo4Xni3atEDtt5kOgmKjenh0=;
 b=f72CMt1U9wmMlKLtcEZ8XsBxvyff6nCTjhS2PDPuhGebhJypXrh+L8aM2Q0PgqgULFcxv7L2yWYSq2k/juElJBmzQ8VLmwHalSEFLdNBdU+ytkOqamU3Vd7E4ZW1EfLGH23ADcbgJK6w/ZO/XAYyHVqiyO65ykSDVR22mLqM6ObknCwPsbV0mWhpCC81x+0Ecc0X2L1GWW4w1NOWy9Q1mmskomeEx7BIjHO94MEcxoZ4FVhmUkS/a2qHG+dz4WtKyh69CX+58lgSw9bch1YjtE88M/gfNI812osd5kwV8EvaN2JsIjDSE8hjb40GS5auDKFYlCuFXgQTUIe8nhNsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESxMv/ykLpGDWIhuuWTbo4Xni3atEDtt5kOgmKjenh0=;
 b=MwHAdH5SouZ5jbYseZvDQB0wZplWETdAgm448rW+Yg/fE15VRD9aaq/XD+rqw4vzeF22Mi9Qi79TbJh8pqiG7xDm1EurKkP40/3vsIGIvkTon2RDEIE4+9JNAmsP65vb5z7LxhDrarkIJ5eRrmDIA5Fkhfdl6vTwK9moNkKetLw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 20/21] libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
Date: Tue, 13 Apr 2021 16:01:38 +0200
Message-ID: <20210413140140.73690-21-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed5d0484-8858-4498-f588-08d8fe84f5e3
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB296952DE29665A669F5B2A6F8F4F9@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TwJ9A6UkPp042MAhw2pkMO0Q81Ql8aqmNaoBnPRHv+LRlGAildlwJXfL9byXCFY0B1b6M6IFJujjhwNPFSlWaWWF6s7xBS73V1sxMqZSLNVQ7HyQRIHDrIl1Tv6drohRrygFF4WWTUZd+vKeJgYGqddH60bZuw9B3JyqGRROI3sJpIpaCwqfcxS0UB0qCzpnWJgn8m9YigRA+NYRosyW8u4bfZPARkuf8TyZzPP8+ZVHZ6IFu4TXMETp3mtwvfhecxraaI7Ks8XN33758Fbvxbc1VGER9ODiDWVQ2V0xc0DcRzpBCQnfnDnR98w6zbCp05x99P4hBu1XvUjg0fWU/oGR48BOvCiRsE9kES2y/DMHN0Gzv3FLRWDAoHvwkVOS/azFbnxd6pzB0bCDVBJgm5sJgbKz/tFaLm2qKxOwmNR7vxrlidMGN1uE99YaQd+e9tc+YYZeiDaiwABFvG8RP98xNA73vDmwAhnZrS2UAXIEa9gGo90lDKS3ZNAAOghagEyC8RY2lUpoR2N2IoPCNL66LL5I/UbzF5NLeBwOLOstjKU3vj1HFcX7bG+wPqehSFaNP0OSB4723lli1W2Dg4VNPsmoaaDxVlEXHqYD6aE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(83380400001)(186003)(6496006)(316002)(2906002)(4326008)(36756003)(54906003)(6916009)(2616005)(6666004)(107886003)(16526019)(26005)(478600001)(6486002)(1076003)(8676002)(8936002)(5660300002)(66556008)(66946007)(86362001)(66476007)(38100700002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aTl1S2RFQ2J3TmFIYktQWXQrL1dZeTlZZkZITkxlSTBVMm1qWmZSS296NU5O?=
 =?utf-8?B?ZjVkSXhSbkh5ci9salFodkpDU1FIVkZxTHgxWUM3bFpMWEVBMWovQ0NGa2pS?=
 =?utf-8?B?dlR4Yk9KcnNlVXRIQk1jeXV4S0lxUG1lMXdyWTBTdHB1ajFxNzNQZlNsb3dY?=
 =?utf-8?B?cDdBZEd3UllOM1B6clBoTUZ3dHh0dDV5WnY0VUVMYXhQZkVDaUFVR1ZaOHBm?=
 =?utf-8?B?ckFOOG5lQUJMMERjMzhNczJNLzVoVXdBbVI4TGRPempPRHNIZktSLzVjYkM0?=
 =?utf-8?B?SjNNY0FjcW1va1RscnVVWXNVRGhnVVhVOENCc3FicnZzZHR3aUVmK3VnTnJV?=
 =?utf-8?B?NUMyNkJlWFFyM2hMa1h5NXplYkdLbmVKa3lDVHZFZ3Z6ZDM3V2x6NnlyNDBQ?=
 =?utf-8?B?THZwUTJ5QUp2NndqTnFaN2ZGTXpDR1JMMkIyMDdFMjFVZkM4ZnJ3TUxpQTNz?=
 =?utf-8?B?L3JiOEpFbDlNWVZjSUR5OFlOYkFGaTFVUHRmWng4bEtBcUJIcGtSc0xTalAw?=
 =?utf-8?B?VzBaRFI2VXJhclFWZWtac01ZWXFkQWw3RzJIMk5vQkRodWxNcXAram9uYlpQ?=
 =?utf-8?B?WFlLVHZmOCsrYjJRRVR1ejBIWTA4L0dWc3FFT2Y2anN0YzFOdDBKR2FJLzdI?=
 =?utf-8?B?Yk5vRnJTaTduUGkvWWdiSUpYZ2ZoKytyWGpGOUlCY2RUV2FXa2ZtdDVtd0xR?=
 =?utf-8?B?SXdQa2RtOHl2N2QrQjQyeXpPd3d2RFpaSURralJVci84ZE1vU0hVYTM0K3dE?=
 =?utf-8?B?ekR2L0o2eFJnU2JqQWM3TTRYU2h1M29HS3hBVExBQVRCQzMxTUtUN09XNlZQ?=
 =?utf-8?B?bmR1VXZzQ2pEWm1zb09LckdIRnIrWFdDT1gzM1JraWVZRlV1bnRWeHlENlA1?=
 =?utf-8?B?eUFsV215dndDUEVZa0tZMThlUFBSeDlrMGYwRFpvWHZvZlBqTHVnRUZ5Q29Q?=
 =?utf-8?B?YzBMVGV2dW5YMzdIdXh6NUM0dXJINEZpc1NRV3hqRGxKZDJ5MWlFOEdRVDVZ?=
 =?utf-8?B?QWlsU0FWamdjVTEvT09jdStMRHFVcVdRVnA3amVrWjlWNTRvcnAwTWMxRnhu?=
 =?utf-8?B?cy9iS1liUFBFdWRvdkpDZlh2UnB0aUhwN2VuWWN0TnFLK3F0VWY0clFFdC9x?=
 =?utf-8?B?ZkNMQ2NUcVhhRlhjVnB1WXl0OENHaGR4NGg4RWpCME1XWWZWY3BvY2Ywd1V5?=
 =?utf-8?B?bE9IK2JveVo4NW50bkU4N1lWWXpGZkVtRE9GNmVINTFuV2p2RTZMb3U1eTFT?=
 =?utf-8?B?L2dJZlMxREFvMk02Q0d2aEZMY0FiS25aRWNRTWV4SytIdWRlNVdxaTQ4cmsv?=
 =?utf-8?B?RW5hL2ppZHhtNWIrQVhBRENrV2o4c3FkVzJRRloreHdmTmNWVlZVbVpsK01S?=
 =?utf-8?B?MjROMWtDbWNGMWNHUjI1MFJkV1NuSDk5RmROUFpTNkNQRUlTYjJmbDZQQXND?=
 =?utf-8?B?SG8rMHpCMXJwM2RvUldtMHd5bXlmajgweUoyYnJkVmhZUHpUQStmYXR5c0dz?=
 =?utf-8?B?Y2dXZWl4dFllUkhxaklxaDNKVStlZlhsc0NCeVZDNXFVVDNOT3RDNU1FdkRZ?=
 =?utf-8?B?Z3hXWTVyU1loYXYya0hHNVU2ZWdkNldXMmlITVFxeTBmNHBFTDZFTi9VV0h6?=
 =?utf-8?B?ZmlwZEJmYmpnS1NjblA0a3N4U3Q5eVZEQ3cyZmRyQk96YUtlSERiQ1dWTlAz?=
 =?utf-8?B?ZXNnajVEME81OENXa0cvRTVqd0huQUhwc0RLUTJKWFhIQWdmSVFrYUlseVBU?=
 =?utf-8?Q?piqqdVyTc1+gyy2aV2doEFZrk0ytAO6KNRv91zr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5d0484-8858-4498-f588-08d8fe84f5e3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:03:48.8545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysKlc21lzfBBltJB+NthR0nry4CGKnA2jQxmMmQx5D6yOyy8CP7dsvTDeQEBRv5yBn/Vm17NVrlGrlvt+mgDjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

With the addition of the xc_cpu_policy_* now libxl can have better
control over the cpu policy, this allows removing the
xc_cpuid_apply_policy function and instead coding the required bits by
libxl in libxl__cpuid_legacy directly.

Remove xc_cpuid_apply_policy.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  18 -----
 tools/libs/guest/xg_cpuid_x86.c | 126 --------------------------------
 tools/libs/light/libxl_cpuid.c  |  87 +++++++++++++++++++++-
 3 files changed, 83 insertions(+), 148 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 3fef954d1d1..c6ee1142e8e 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1890,24 +1890,6 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
-/*
- * Make adjustments to the CPUID settings for a domain.
- *
- * This path is used in two cases.  First, for fresh boots of the domain, and
- * secondly for migrate-in/restore of pre-4.14 guests (where CPUID data was
- * missing from the stream).  The @restore parameter distinguishes these
- * cases, and the generated policy must be compatible with a 4.13.
- *
- * Either pass a full new @featureset (and @nr_features), or adjust individual
- * features (@pae, @itsc, @nested_virt).
- *
- * Then (optionally) apply legacy XEND overrides (@xend) to the result.
- */
-int xc_cpuid_apply_policy(xc_interface *xch,
-                          uint32_t domid, bool restore,
-                          const uint32_t *featureset,
-                          unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *xend);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index b0690d9799d..70ca4939392 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -413,132 +413,6 @@ int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
     return rc;
 }
 
-int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
-                          const uint32_t *featureset, unsigned int nr_features,
-                          bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *cpuid)
-{
-    int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    xen_cpuid_leaf_t *leaves = NULL;
-    struct cpuid_policy *p = NULL;
-    struct xc_cpu_policy policy = { };
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto out;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = -ENOMEM;
-    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL ||
-         (p = calloc(1, sizeof(*p))) == NULL )
-        goto out;
-
-    /* Get the domain's default policy. */
-    nr_msrs = 0;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, leaves, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves,
-                                    &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-              err_leaf, err_subleaf, -rc, strerror(-rc));
-        goto out;
-    }
-
-    /*
-     * Account for features which have been disabled by default since Xen 4.13,
-     * so migrated-in VM's don't risk seeing features disappearing.
-     */
-    if ( restore )
-    {
-        policy.cpuid = *p;
-        xc_cpu_policy_make_compatible(xch, &policy, di.hvm);
-        *p = policy.cpuid;
-    }
-
-    if ( featureset )
-    {
-        policy.cpuid = *p;
-        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
-                                            nr_features);
-        if ( rc )
-        {
-            ERROR("Failed to apply featureset to policy");
-            goto out;
-        }
-        *p = policy.cpuid;
-    }
-    else
-    {
-        p->extd.itsc = itsc;
-
-        if ( di.hvm )
-        {
-            p->basic.pae = pae;
-            p->basic.vmx = nested_virt;
-            p->extd.svm = nested_virt;
-        }
-    }
-
-    policy.cpuid = *p;
-    rc = xc_cpu_policy_legacy_topology(xch, &policy, di.hvm);
-    if ( rc )
-        goto out;
-    *p = policy.cpuid;
-
-    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
-    if ( rc )
-        goto out;
-
-    rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
-    if ( rc )
-    {
-        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
-        goto out;
-    }
-
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto out;
-    }
-
-    rc = 0;
-
-out:
-    free(p);
-    free(leaves);
-
-    return rc;
-}
-
 xc_cpu_policy_t xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 539fc4869e6..cadc8b2a05e 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -423,6 +423,8 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
     GC_INIT(ctx);
+    xc_cpu_policy_t policy = NULL;
+    bool hvm = info->type == LIBXL_DOMAIN_TYPE_HVM;
     bool pae = true;
     bool itsc;
     int rc;
@@ -436,6 +438,42 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     bool nested_virt = info->nested_hvm.val > 0;
 
+    policy = xc_cpu_policy_init();
+    if (!policy) {
+        LOGE(ERROR, "Failed to init CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    rc = xc_cpu_policy_get_domain(ctx->xch, domid, policy);
+    if (rc) {
+        LOGE(ERROR, "Failed to fetch domain %u CPU policy", domid);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /*
+     * Account for feature which have been disabled by default since Xen 4.13,
+     * so migrated-in VM's don't risk seeing features disappearing.
+     */
+    if (restore) {
+        rc = xc_cpu_policy_make_compatible(ctx->xch, policy, hvm);
+        if (rc) {
+            LOGE(ERROR, "Failed to setup compatible CPU policy for domain  %u",
+                 domid);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    rc = xc_cpu_policy_legacy_topology(ctx->xch, policy, hvm);
+    if (rc) {
+        LOGE(ERROR, "Failed to setup CPU policy topology for domain  %u",
+             domid);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
     /*
      * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
      * the xen-3.0-x86_32 and xen-3.0-x86_32p ABIs).  It is mandatory as Xen
@@ -446,8 +484,15 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      *
      * HVM guests get a top-level choice of whether PAE is available.
      */
-    if (info->type == LIBXL_DOMAIN_TYPE_HVM)
+    if (hvm)
         pae = libxl_defbool_val(info->u.hvm.pae);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("pae=%d", pae));
+    if (rc) {
+        LOG(ERROR, "Unable to set PAE CPUID flag: %d", rc);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
 
     /*
      * Advertising Invariant TSC to a guest means that the TSC frequency won't
@@ -463,12 +508,46 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     itsc = (libxl_defbool_val(info->disable_migrate) ||
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("invtsc=%d", itsc));
+    if (rc) {
+        LOG(ERROR, "Unable to set Invariant TSC CPUID flag: %d", rc);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Set Nested virt CPUID bits for HVM. */
+    if (hvm) {
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("vmx=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOG(ERROR, "Unable to set VMX CPUID flag: %d", rc);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("svm=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOG(ERROR, "Unable to set SVM CPUID flag: %d", rc);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    /* Apply the bits from info->cpuid if any. */
+    rc = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
+    if (rc) {
+        LOGE(ERROR, "Failed to apply CPUID changes");
+        rc = ERROR_FAIL;
+        goto out;
+    }
 
-    rc = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                               pae, itsc, nested_virt, info->cpuid);
+    rc = xc_cpu_policy_set_domain(ctx->xch, domid, policy);
     if (rc)
-        LOGE(ERROR, "Failed to apply CPUID policy");
+        LOGE(ERROR, "Failed to set domain %u CPUID policy", domid);
 
+ out:
+    xc_cpu_policy_destroy(policy);
     GC_FREE;
     return rc ? ERROR_FAIL : 0;
 }
-- 
2.30.1


