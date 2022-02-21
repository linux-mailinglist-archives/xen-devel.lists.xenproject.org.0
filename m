Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AB34BD9A5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 13:24:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276256.472366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM7j3-0001TX-A6; Mon, 21 Feb 2022 12:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276256.472366; Mon, 21 Feb 2022 12:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM7j3-0001R5-6u; Mon, 21 Feb 2022 12:23:33 +0000
Received: by outflank-mailman (input) for mailman id 276256;
 Mon, 21 Feb 2022 12:23:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vyL6=TE=citrix.com=prvs=04447c275=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nM7j2-0001Qz-1C
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 12:23:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 128e49dc-9311-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 13:23:29 +0100 (CET)
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
X-Inumbo-ID: 128e49dc-9311-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645446209;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5jPyyPXBC9pciqFvumRfpd60WqSCMarqJjjgPUvXU+g=;
  b=Q/BdmV9yHWm+r4JQd5DvZOlrwR10ErQtWwW4Y0cUNXbzop6ye2MNYpNY
   Fe5rwynByvVO+7L+1XoIzwHh5xxn1GBX69748Uq66e6p98c9wXlIBtOXR
   DSrm8VzjdE9opZjTz2QT0jHpECnxyxDo89j6GG10JVc0a6t1sh/G4O/gF
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64644193
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qMyuBKC9JK1A+RVW//zjw5YqxClBgxIJ4kV8jS/XYbTApDMq1DEOn
 WNLXzyEbvrcajGkL9Ajadjk90xS6pSAy94wQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rj29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhgl
 +4cj4W6WD5xL5XCs8I2D0hBKn9HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgGls2pkfRp4yY
 eIlUShtRwuePidTGQspWZBmzMCvn13wJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSFo
 mPL+UzpDxdcM8aQoRKd+2+orv/Cm2X8Qo16PKaj6vdgjVmXx2oSIB4bT122pb++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6R6P4rrZ5R6DAWoJRSIHb8Yp3OcUbzE30
 l6Cn/vyGCdi9raSTBqgGqy89G3of3JPdClbOHFCHVBtD8TfTJ8bn030H+x6Gr+M1szNFxrW6
 GzbtRFgvuBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxL1WVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxe0O
 ic/WisLvfe/2UdGioctPuqM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/1iY
 sfHIJv9UCxLYUiC8NZRb71AuYLHOwhknT+DLXwF50/PPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPRoyizpNbWO3GNmaZKdAhiBSFiWfje9pwGHsbec1EOMDxwVJfsLUYJJtUNc1J9zbyTo
 BlQmyZwlTLCuJEwAV/UMis6MOu3B/6SbxsTZEQRALph4FB6Ca6H56YDbZonO74h8e1o1/lvS
 PcZPc6HB5xypv7volzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:540en6Gb6XhYrdnWpLqFDJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y5o2mfvVmHp6VO91xNPdfKla9CC4kY1jiaWgOKsk8SgbwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="64644193"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5+YJ8Ha/1StT8J82LoYLIVCFRav4rPjLBxkPHXKgLD+VYBhCicfBeNCd6ocmqG5haVBjbsCmxCT62eDrDx8do+0Fkfuj8WKE5YE4QEommeM7o9dKKmDI/U4fhtWn4ruAduF6w8mr2Y9d5ej7rDNvFYVt1JmQMQIK9E3+EPuPgVw2en9ZqDFL6Py9SP+OUT5sSNDEzcg8JnycBS7MjkBz3MlJK47uyw0+rgwEYbRRH/gCcR1siAy/6saohDsekjFXk0fl5wQT9/2bo1KfSjlN+ZFCmMgNLV5UmM1wNbV/e++2mfjySarvCnAqKsZQNbKiW/nmY2kRbj+KpcKbafbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5qw7GyUqOfvkUmhewwPcICWhpVo2EPenFNEiRf8KZU=;
 b=me1dx0s72z0x/BaPk4hD9lxeHdbOK8qieGrf8u87oF76QmvTVd3accsI7VqvY9+4piPFEsAU/mpb+e/k/W1UiF2+KarHNaLmfwElBIl6AHvs24y9n4OQon5XDP0l6MJ19hl1QJzHM07SOrVg/q/lGTycgQXG+eaRVeuXyISSqo51YSzCDdLTmD/cgEO/hZ0s++s13wJn94AFzdbRvMcQTv7O0RHmlLY9cazhtwYEQIhIobbQ2RsHrZhGSd/KscwP81w0KEhK1vTy0fJC383FifGPeFK/DKjnzhXIWjoFWjBzB+xVOO80XYQOa8AcUrvFwbgxGfqnMyA0OrkwUke9IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5qw7GyUqOfvkUmhewwPcICWhpVo2EPenFNEiRf8KZU=;
 b=MQkvKp7HK8AmeiLfeq4RGT+wxWraXrUJg1u1M3WJNYSMAVnmsMSnsdxXxOKttTGK2iZNBBJrAulMDEWB44aocRGiMfFusATUnBhIlZH8co6vE7rcuqaVAyg/ffbht8iHQXKYVUQSvUxHsQdPxYZxaG5Is9RF/+864V/w5i/ePHE=
Date: Mon, 21 Feb 2022 13:23:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 2/3] xen: Rename asprintf() to xasprintf()
Message-ID: <YhOENAz/08oSD7WK@Air-de-Roger>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
 <20220221100254.13661-3-andrew.cooper3@citrix.com>
 <YhN1pJIDIiJscvjF@Air-de-Roger>
 <ada67c6c-bcd5-9732-c3e0-76032692ad23@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ada67c6c-bcd5-9732-c3e0-76032692ad23@citrix.com>
X-ClientProxiedBy: LO4P123CA0221.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3deab174-ffec-46fb-1a39-08d9f534f371
X-MS-TrafficTypeDiagnostic: BYAPR03MB4773:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4773D869BA29D95725F8192F8F3A9@BYAPR03MB4773.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hioEpByeDMm0q1aZHJ4lejGlxTL0PnVby6UwsYPzELOFyhaZCf/1HuU+qm/cUT6j5pS5czxvLDZlnBmyMRt7kYZH4HPZlDQqiH7cqHjIlqoAfLIqHP4/GUtM+l5zLbk8a39OS55wtB5L6v9Mi1/3O+ZI30F9gSxRvR1TpfDiphSK0hPZVKq5XBf7m1YnBn5i3Bi0bfoK9BhP1SLlaowExQI4D7Q4St2SDx7nztvvv51SFYyKvrz8hNBJe9iJv9V/DiUH6Jsfg9s9Z3ynvlTucbwR0ci1BuEMRW3QRGM3GkDcvYL5cfXiBmQpYm3QJw+nxtZIzzYTbKUd0UTo2TnGa3dzNPomQXu4NKLrcU7GIWNDVJDKxm/FeE5pqwjVf22wKhaNtKRnI1KZdMkAPFx6CcP2Q6b/+pgeYOWchkgpBKBzOUJSCXCVh/K3N3lljYsuvkfeiWj8eeg/GzSpxsM6VlxQCWAr0XiY0BzLNGf6fqbkrItBuyAgcyxbL8fPBbFSRdOdC0Og6p3CSYSMI6GAOO+FGyxlM8Cj7dzSD1ZQtpdY6RszQymA5MaXhVbjnxgyDRe68LCGly4dF/6roZ8y3vtntfrYP3I8+GU4EuNqQK4K+vsxJlPOzvxBAa5scUaXSgsagURWvaUoYRBVD4rNPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66476007)(66556008)(2906002)(6486002)(53546011)(66946007)(8676002)(4326008)(38100700002)(9686003)(6506007)(6512007)(6666004)(6862004)(8936002)(508600001)(86362001)(6636002)(316002)(33716001)(85182001)(5660300002)(186003)(26005)(82960400001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU1pQTRVLzNvOGJHT1FYTytkMklJcXBOWER0dmNkTjhhb1plNUdsMWc0dmNE?=
 =?utf-8?B?UDZrdHpueXlTaDIvWGJLWlh6eTgyZVkvaXlBVFlzcVVWVUIxR2dtVURxTGEr?=
 =?utf-8?B?Tm1MWXBzNlorMGdCNzFXUDdEaGVLcm5oNEI0WGp3enkvL3JPN2RSREpoM2xG?=
 =?utf-8?B?dEs0MnY3akhFZDEwRUdrcjlMRFk5QWdMY2YvMUg0RUVLVHdUaUVwOTBRK1RF?=
 =?utf-8?B?SHJ4NDExK0JpdXJ2dXdXTjRKRVIwaldqalgyYkhTd0pHWVloQXhjczg0TzhN?=
 =?utf-8?B?dFRjdnIrL1NlWVVnK1VmbVZ3UHFadFpnNXNUMU5VTUVpZXFKSG5zeEVPOEQ5?=
 =?utf-8?B?elBZMzBnZGRTT2d3TW5mUlJCd0hmRm5RcjZTVU5RaGhPbVVIWHQ4c3FhSGxV?=
 =?utf-8?B?eUhvSVdPTUtJa1ZSQjBaNUpQenFVbXhCNXM4U3N5SDhPdXl2WTg0ZFpKN3dw?=
 =?utf-8?B?eERwd2M4cTN6MW1LNUhHMFQzTURCV0NNNnFDUG41K2hVSDgyWThocmJobU9k?=
 =?utf-8?B?MXA1M1ZCR01Ta0JoYTVOS0Z5WHBNZFZhcHBLeUV4NC9ZYmxMUmdTU0RpQ1JL?=
 =?utf-8?B?bWxXTzJuOG52ZEVnd3RTMFR2VDM3MzVRVm9VS1lQSkc5S0tVM1VVSGtFK3Vj?=
 =?utf-8?B?U0U2elNGU0lGKzd5TnFjWk1JNDJsZU9jc3pXV1VLTG9vcVpUckV4cDF5K1pQ?=
 =?utf-8?B?MTZla2pzTjVEcjAvQmVzOVVPbDI1N0NxZXZNV1d5dkdhSVk5dWRZbjhtTUI1?=
 =?utf-8?B?N1Q2L3gySUFrSzJVV2daRWVnc3ZvbXlURWZoWmlzSXhrYjg5aXhKSjNiZ1pt?=
 =?utf-8?B?Q0JjQzBVMjRsckhGcldldFVSaVlxVkJLa1A2Nm10OE1lSkt2NmlvTVFTNXpw?=
 =?utf-8?B?bytUd1NaVW1YUDc4UTcwYVRGakZTTlc0eVFXNENON2FjQ2poY2N4SGxPekYv?=
 =?utf-8?B?ZmlFMjRRcDhNOUc5WndvV1I3dFVzV1lPcGhweDBEbzk3UEtKRFZWWXJwampK?=
 =?utf-8?B?ZzNPajlVMVJvY1BvU1hURktGQTlvZnUyZVY1c0ZYOG1ubFZwS1E4aW0zeFYv?=
 =?utf-8?B?WTQ0TXdrR1A4QzlqL0JZWlcrOVR6aU1WRlRxd3U3SVJSenVjVG9LSlFneWI3?=
 =?utf-8?B?dkV6NmpSM0VrNkd0NEpqR1hka3hHVGxIbW9HbjFCZ3pIcXRqVEwweEhjMFRP?=
 =?utf-8?B?THkrRS8rZlR0OUpnZk90dGY4anRDdjg3VTVvdHpCUkxTN292bG4xRTRaU0hC?=
 =?utf-8?B?cWx1WmtRVjk5dGVWdjBiQkw5VGlDL2ZmTjEweXA4NUQzcWJrQzdWakhSS3Jy?=
 =?utf-8?B?MVdzMFp5TUJkcENhRTBneVFkVGwyd2lMNWZFeEJLQUVUUG1FZFZRMXQ2VkVV?=
 =?utf-8?B?VzhsTStyVXdMSEUzWGZsQVp6RmFSZTR2WU15b0p6aUdwVmw5NjN2cDl5eW9L?=
 =?utf-8?B?VUZ6Q0h1NXlpK1ZHRjlwWTg3eEtiQ3RycXVEdkpTS1lLSnlERS83UW1KczQ0?=
 =?utf-8?B?eFV2RXNtZ2Rac1lzQlhRd2hqeFYzcU9QTlduazc4UlRkcjhpWEtna3E3SUtx?=
 =?utf-8?B?cURwajhVQzFYcjU1dHFhd09POWppTk5ERmFRbzZkT0RoY2lVeStpcFdqRmoy?=
 =?utf-8?B?TWFIYlI3TnJOVXhnTmY0U1NZNlBKZHNKem0xSSszRk5nK0pkaWRYKzJCd2Jz?=
 =?utf-8?B?d3NCelV1N3FIR1FMWTYveEJPYU04QjJTLzNnTHJkbEQzSlNGNkxVbE9yaEs1?=
 =?utf-8?B?QVhNSGh0WXJzdkxSNjNMSXdpaU9UTmNzR3NvbWlvU1V5NGttSWltQTBEMlNu?=
 =?utf-8?B?Umo0UHRzQzVhVW5WZjM1Nm05WmxiNlNIR1ZVbXdwckgydUN3R3Q2ZUdxelBq?=
 =?utf-8?B?d0NjTkhSWnMyN3NwU0JGYzdEVXF3TWNlS1BnNHJTRVU0Ulg0TmlSYkNhYk16?=
 =?utf-8?B?WnRRS1U4SGZPR3JzZ0lKWCs0OFNWRU9kNkE4ai9pQkZmL3hFd2NEM2lTYU1h?=
 =?utf-8?B?NGZPTTR3bXBNVVdNQktMS0did2o3aGZwYVdleW5GU25UdEhLUFNLZldZWlh3?=
 =?utf-8?B?N293d2Q0TUZRU0VZYmQ0WElzY1MzSWRKMDdqT242ZkNKa1pGQ3BrWklYVVR6?=
 =?utf-8?B?eGpoQ1c3enVpbVFkM1ZZLzh5SEtOTVpybHpUQjJEa1Bxd3hLeWpMYUNRbDU3?=
 =?utf-8?Q?HXr4BkAWYWpEa3mKHTQysmI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3deab174-ffec-46fb-1a39-08d9f534f371
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 12:23:22.3515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ydjV+RCe+Zk5Yy7vfjTRLTRJ+30HY68jluS6FGw4kf2EWnBPQuvtmegKdjLG88fcW/F3WcAE3dIISkz6KoKkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4773
X-OriginatorOrg: citrix.com

On Mon, Feb 21, 2022 at 11:28:39AM +0000, Andrew Cooper wrote:
> On 21/02/2022 11:21, Roger Pau Monné wrote:
> > On Mon, Feb 21, 2022 at 10:02:53AM +0000, Andrew Cooper wrote:
> >> Coverity reports that there is a memory leak in
> >> ioreq_server_alloc_rangesets().  This would be true if Xen's implementation of
> >> asprintf() had glibc's return semantics, but it doesn't.
> >>
> >> Rename to xasprintf() to reduce confusion for Coverity and other developers.
> > It would seem more natural to me to rename to asprintk.
> 
> Why?  This infrastructure doesn't emit the string to any console.

Right, but the f in printf is for print formatted, not for where the
output is supposed to go. So printk is the outlier and should instead
be kprintf?

I can buy into using xasprintf (also because that's what Linux does
with kasprintf), but I don't think it's so obvious given the precedent
of having printk instead of printf.

> >  I assume
> > there's no way for Coverity to prevent overrides with builtin models?
> >
> > I've been searching, but there doesn't seem to be any option to
> > prevent overrides by builtin models?
> 
> No, and we absolutely wouldn't want to skip the model even if we could,
> because that would break asprintf() analysis for userspace.

Well, we could maybe find a way to only enable the flag for hypervisor
code build, but anyway, it's pointless to discus if there's no flag in
the first place.

Coverity could be clever enough to check if there's an implementation
provided for those, instead of unconditionally override with a
model.

Thanks, Roger.

