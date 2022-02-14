Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C924B55DC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 17:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272508.467382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdzr-0000u8-7F; Mon, 14 Feb 2022 16:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272508.467382; Mon, 14 Feb 2022 16:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdzr-0000qn-3Y; Mon, 14 Feb 2022 16:14:39 +0000
Received: by outflank-mailman (input) for mailman id 272508;
 Mon, 14 Feb 2022 16:14:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJdzp-0000qg-SV
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 16:14:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 330cac24-8db1-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 17:14:36 +0100 (CET)
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
X-Inumbo-ID: 330cac24-8db1-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644855276;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6ZUhc558dYqqKBxXFYYF99xbrqlYedR5rtYnwiG/5sI=;
  b=MtUsK5zK7J7KDT5g3rrwr3PfyxS8ennmAG7ftWU5zACKqlP/1x5jWkD7
   tNvNhSoX38Hy39N/WRb0+dURpbT1NWbRGpgvbtC/wH4rX27qWMpzJL0vC
   9jEwRoWxwzVkfqQIoRaq6rwRKvpv03X6YjU76bPsm3G8POa8IJ0a1nZql
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N+hj6CHZVqAW5BVOQ5DfXGxKwOAL8RsJylwdm1VVjx5UCayWUTLQQJRgm36XLIYkkXnYR55Gil
 vowS0eVsX+3gW2Nel3riJF8BNt0BHgwo9G0p7rjZiLVL8X8eUB50dtUnkeAyavy0tQQMMcASN/
 Ohe47BySMS0jhr20Whd0P8R8GwRZbgYDIG2nTVcAEamsRUu9qbntCLp6FpElwN1slJXNdMAZuN
 eh6Z+uX1k228x6xHCIlsAFHiIxskjefHsp3/sv8A8isyHEXL5OVDuhpoEGzXqt5eHIcA8onn55
 ipPXs4cYCBSJnI8JP28MwElg
X-SBRS: 5.1
X-MesageID: 66395426
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5GawTqrGlDXj8XB+2N24F3ew6p5eBmLMYhIvgKrLsJaIsI4StFCzt
 garIBmOaKncN2rxc9F/bo/j8B8PuMSHx9BjSAVt+H83EygW9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HlW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCna2gRj4DJqLcpO0QWEBDOBlwOvRj+JaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZRCOGczNkqojxtnMUYsCpNmx8yRrV7wXjobiky8n5on2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajk4HtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUL+A604LLb8zqQC2NdVRV5Ztt/kc8fEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWBhRqjBNzAJrVkg
 JTjs5LAhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvG0hdBc0b55dImWBj
 KrvVeR5vsE7AZdXRfUvP9LZ5zoCkcAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3aZfblUUHCLemCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnnMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:BVHqs6gHc2xKq29vpu1EtWmdCXBQX3513DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwRZVpQRvnhPtICRF4B8btYOCUghrVEGgE1/qi/9SAIVywygc578
 ldmsdFeaTN5DRB/KXHCUyDYqwdKbq8geCVbIXlvg9QpGhRAskKhWYYNu/YKDwMeOAvP+tiKH
 P23Lsim9PUQwVwUi3NPAhjYwGsnayoqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+aemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aOSARcR4Z
 zxSiUbToNOAkDqDyeISNzWqlDdOQMVmjvfIJmj8CPeSILCNWkH4oF69P1km1PimjQdVZdHof
 92Niuixupq5VmrplWN2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZLIMvW0vFuLA
 BVNrCW2B+WSyLvU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegJ28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1E8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/surqSReoeMMoYDHRfzOmzGovHQ1Mn3WPerKM
 pbEKgmdsPeEQ==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="scan'208";a="66395426"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNHgUAc+q7W4kG9GlbCQSXxXydMryq5a8GG2S0F9Ds/SS51iQ90U97K007cisnpBJ2bJ7uUvgylz4zARGBMORMfsW7aANMspKELoDaYSiYA7ibAQ2goc7sgBOHdyRJfkpUMcW2jM7x9GYkJFlWknAkItlja+aQLgk0N1vBSiNCBryTq2a0e3XBoauY4Lsj839Yxh7mzp9KODSCNBqGYLn7tuRm9bRRkLAyNL0OS3Mc1DymqzgBK7ajL1uGLOiAfFHOjdCtp/aZB+6UmPfLudht5h2DalcpgqfBkeHxX5FldgJN1qlhINF84U4ELqR6PsvDnyWlQyyuKQdpsnE9Fg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZUhc558dYqqKBxXFYYF99xbrqlYedR5rtYnwiG/5sI=;
 b=M532WbzVvqnWn4jJRKPab5WRyImXCgPg3YozvXyc5sQVFtbgE5pjcp0QNpgb8XR/b++xEGPvuVsJpudL+WUPMWEs6fqlR6fluvqan5DSfRKxZssaweKxRJzXSE1D+GIes6bD6esoBW7fPVc9nti0Z/PX3MgHXNNoqorvbT6yg3IvVDx6pUZr6RAxFYWMYuYQNllHpyG3O/2v3VyMwFQrunu1i/tdmfpIixUjxOIkflcZaQxzT70ztBvPHeOUwFyPVToNIYvqx0cdiHQEgx6V904j4OJePl6As1qoZstm/sEpgzgJNPcBHIA+xWCTySoVMfHFnx5UT0E4zj5W+E8XlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZUhc558dYqqKBxXFYYF99xbrqlYedR5rtYnwiG/5sI=;
 b=xJwEk93vn8Dff3bPzqDCv9yDTLy+lhjxHe+2+yeoQyzPfcV429ltmW4BKmAG1r/6FakyLqDTRuV5rvnUibrxjQBXT9UJOZ0zyALlYAcyZUIbfaZSauZguo16xRTBWGsVp5XtcVHuP49Rxr20trUQelsxLkl9EhOak2Jvrzp4CuM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 64/70] x86: Introduce helpers/checks for endbr64
 instructions
Thread-Topic: [PATCH v2 64/70] x86: Introduce helpers/checks for endbr64
 instructions
Thread-Index: AQHYIaOdYBbjG8K/30i9NfK2lLyWE6yTOJwA
Date: Mon, 14 Feb 2022 16:14:30 +0000
Message-ID: <6a4eea6f-bd77-cb13-b476-b281b80c6413@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-65-andrew.cooper3@citrix.com>
In-Reply-To: <20220214125127.17985-65-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d66f5f1-ef15-473f-bdb6-08d9efd514d7
x-ms-traffictypediagnostic: MWHPR03MB2525:EE_
x-microsoft-antispam-prvs: <MWHPR03MB252578CC7C641741A46DE6FFBA339@MWHPR03MB2525.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D5mGcFEesY6v3ivcqx+TlA6lAAwRsacXr4pVBl2Xs0PU2wpl+LZG48PmBfhyrL2HUW+YIGc1UmfT1n6t4D6qxS5qRPt8gJ4JU66QveJ44K0hPxPgVunWRQUGBNosLmIF44/GmCl7dvqVgVhdfkYZr9jxuIYmdHhtMp/AznD4TbIn+pEyDP0XqAN0yvJrQwhC1WPLl5MkOq+UxQA6tGaxv7bmJZFe4f8S2OqA8mMdOUQeInZIVkTNqNIhUBKJDtpPj7gBn13VIsqCK+Iv/UJK99eGk5QTtOVNjpKqKDAyjpzb0OmB3yS/BED4uo61bHC/n9tbIZOsYMLhhv7z5E+WcKeoxcWfjXqy0IpAH40wq7xStgGdeve+6zFJZVhTRz4zaAQNgNxFwjCS2sVuu+tn8sgkIazF8uHiYhzwNzxnjuijPhJVtkPSHjvl/DP7ePhYHqRW2aEdv677VFlLnhDT7+tDd4HPP/oi+L+DmoYp1KYR+LNjgrMV98PvppWZqSARI23J8fovlTkpl5t++AG7HO6mORisemSCw72aQZCuMgfipMS+johueGXEZHGLIp20igdDN3fp7j8FfZC43vkFriuyBBFNTSVHKDgAqUenG1XX5AceLrAIOk10hrdyo/9L8eJLgPFDTbm8s8s8bxJPldvlpnC7u+kbM4Qg8iR5svypaRNJioEwAmoEZCTOBrq5wihOgims5kazNf5sS8wogjaHwiVJvNE0EULltdCeZHy/btg8yRFmGDRnaJt+JVMo6HchNLB0u3ioXOVbtSrkWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(53546011)(26005)(6506007)(122000001)(36756003)(6512007)(186003)(31696002)(38100700002)(4326008)(82960400001)(86362001)(2906002)(8676002)(38070700005)(8936002)(4744005)(66476007)(508600001)(31686004)(54906003)(316002)(2616005)(91956017)(76116006)(66946007)(66556008)(64756008)(71200400001)(66446008)(6486002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bURnQW9mQkhacWRRWjJ5czRVRlNRQkJ3aHVpcVNkYk12ZmdHOE5JZnpyRmFX?=
 =?utf-8?B?cElKanFYdHo3d29mYlJoWlNDTGRuWEhJV0hNQWNsZ2tXZG9jbUx3b3BJckl1?=
 =?utf-8?B?bk1keHdDTlV5cDFOOUhEWUFYbC8xcVB3ZTB6UzgvK2E2SkNIOG5sdmRzanB0?=
 =?utf-8?B?K05vVWxHd2VQMUN6Qkc1VW9NSitwWG1wWWxPWG5ITXVPd3pjYUhlajFyOWdw?=
 =?utf-8?B?ZkVDQU5KY3FQUVo1eDJFVEdKWDROcHVtU2M5bklwZHFlU2NuL2k4dGpiaHFv?=
 =?utf-8?B?cEQ3b2xHbnd1YUw5UVpzRi9rcWxZRDlIeWZlSnVEOU9TRkFlWGpLdWRydWpi?=
 =?utf-8?B?R1lZbU5tTi85L05XS2FsRzZmZUlyZVhlQ2hUdGZ6Z3hKNGxFT2VKS1BFT1gx?=
 =?utf-8?B?d0J5Vmsza094bnJKb1JCc3ZuQTNBMFl5WlZJdDJhUVUxWDlkSExQcXg5Zm4y?=
 =?utf-8?B?MDJFQlJHVWE5dzNoZGlYRVVHMEJDUS9LZ3huZGZsNjduQ0tPeFArRnVYM04r?=
 =?utf-8?B?Y1ZWanpsUnBuMUF4Vm56bXF0bFFZUGJOT003M3Z3ODcvVUZYNm11WWNTSWNF?=
 =?utf-8?B?Q3JSSWNTdDV0dGdNUW1GV0ROTTlpWUJlVDFzZlRGZWo2NXRZS0gwSFJRb2hh?=
 =?utf-8?B?bUdLVWJaU1pISGFPM0hwKzBCOS9iNys5WWNrZFJiQzFiSUg2QzJZaGQ0YWJ0?=
 =?utf-8?B?TzQxaVBDZlpkeEJ5dDh1eWhSWUxRTWk2VWg2NDdSWkRjZlk2M3BpRGROVW1J?=
 =?utf-8?B?L2t1SkNURUNFSE5MVitqOUt0MjM4T1V4ZG9NV1hOYi9OOHpvZk9VVUZRYjN6?=
 =?utf-8?B?R3d6ZExpZmJ2ZW5UOVVzaGZWWmdyZ3Y2eXQwU0xCTSt3amxHMUwxTWxreVpt?=
 =?utf-8?B?bjh4M3dGYXR3K1E3cE50SEljL0tWS1d1ODJuSjBwTTc5SGhvblVGQUlNMExk?=
 =?utf-8?B?WHFjVjQrOHBPQlBBSDg0UlZJMk1ieStpZVVpMUgzZUtuSmJUTUhoSGFQbGh5?=
 =?utf-8?B?ZzZOajhUSWNPT0JndFhCZTN6cU11YjNPaHJJYjZoQkFBcE5EM25taEhZQ2Jy?=
 =?utf-8?B?dWpkbGQyVkw3MkVvMVBGVGhwY25oYkJQMDRWbTdlRG9zNTVhaHFmL1V0Sm9M?=
 =?utf-8?B?VXBGREE1aCtsc2g0Z0d6cTdQdE9UNFhXWkpzU2RYQ1hTZnBIUityWExzYmxj?=
 =?utf-8?B?RjJsUzZTSEIvSGVkcWdSaW1BWVZENEdKQzVWN2pzaTE0RXBGTFp2a0NCTW51?=
 =?utf-8?B?QzkxZEdlR0NjUzdYY0VJUjRQV3hzSzBxZ2VVOWhxYWJqN2ZiS0xXTy9iVDFB?=
 =?utf-8?B?cDdCbWRtemlVTTZiTEloY0d3OTNpNzMvbnN3Vm9UTVhJblMrRjBNNTJKK245?=
 =?utf-8?B?T3doWGNPMXhsV3FGeDlxTmZOSjhyR0pyN2JTcmNadnpjaHhkNWlKSldlK3h5?=
 =?utf-8?B?TTNaMHFuMzBjSGhyRXNMS1RNL1lubDI5YnZ2d3B3R3hoczRXUHhhQ2R2WDlj?=
 =?utf-8?B?aHl5cUN5ZzdaZkNJMkFKcENqQ3psMGJuRndTc2JKaGp1dFMrVVliVkN5c2l4?=
 =?utf-8?B?Umg4SkNMRU1kVS85NUxTVkJqazlTd0RZL3FYblZvMEt3ckJlNk4xUCsrWlFQ?=
 =?utf-8?B?ZE1ockpmV0xUMFM0dlJPTTR2OWlVUU1rSmFNZENMZm95UU1FcEhFaVJoY1pE?=
 =?utf-8?B?eXZxeGFzWEJSRFY2QWhLc1Z1OW1hOUk2b0l0OVFWME1lSTB1Q1BVNHRWdWs0?=
 =?utf-8?B?OVlFRUFRbVlMMTZRV2JLWUxhNzZFWnhYV3lXMXpyL3J0NS8rbThvbzJIRytr?=
 =?utf-8?B?eUNnYWVic1gzN0M0NlRuRTkreENaZ2NJTWsxaE5nTjlWRndhQ1V0aE5Zancr?=
 =?utf-8?B?RXVPRHdmN1cvTElwcEF4ckJhdTh2cndJaUl4WDd0SmQwbEdUMDRscWNrQ29j?=
 =?utf-8?B?RkpTVzd2U0Z4YjFGYTc0QUFMUTI0YmFhWlk2Rm1kZzFzSkkvY3NIditZRExi?=
 =?utf-8?B?NUVJSitWdmJKdmxrOGhpdlNHdWJZd2d4cm9Gd1l6QllONjFQL09pSW5DZHhJ?=
 =?utf-8?B?UXZkYXhwU1JVV255TjAwTEFNWWVVS3ZtZmU4c1R3TGpta2prclFubWVpdGx5?=
 =?utf-8?B?NEFIeURhb1o1dk9SZjJqSEFjMEFORDh5SEpXOTkzNyt4SGtqOVdFOVBkeCtC?=
 =?utf-8?B?MC9HV1VJYTh2dWR6WmdWTjM1SVM2L0xDcVJMNzJnRW1uUFZMcXlGamxYQzRF?=
 =?utf-8?B?VUdoWkxDTlNqSXpLMnJZNTBTdzh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5513CE8F3CBE33479FB97D5FC4F4ECF9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d66f5f1-ef15-473f-bdb6-08d9efd514d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 16:14:30.5610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IciGUof1qJhQG8tKDwHClq8daQ9k0QA44Em4b6Xcf4tJ2czbFIiW6cUO4k7nU4dVTMab0AwLbUwLE+4xZfbAFbBMbfqfSFHJ0+Hgx8N8D3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2525
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMjo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gLi4uIHRvIHByZXZl
bnQgdGhlIG9wdGltaXNlciBjcmVhdGluZyB1bnNhZmUgY29kZS4gIFNlZSB0aGUgY29kZSBjb21t
ZW50IGZvcg0KPiBmdWxsIGRldGFpbHMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCkZyb20gcmV2aWV3IGluIHRoZSBmb2xs
b3ctdXAgc2VyaWVzLCBJJ3ZlIG1lcmdlZCB0aGlzIGRlbHRhOg0KDQpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2VuZGJyLmgNCmIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2VuZGJyLmgNCmluZGV4IDZiNmY0NmFmYWYyOS4uNjA5MGFmZWIwYmQ4IDEwMDY0NA0KLS0tIGEv
eGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2VuZGJyLmgNCisrKyBiL3hlbi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9lbmRici5oDQpAQCAtMTksNiArMTksOCBAQA0KwqANCsKgI2luY2x1ZGUgPHhlbi90
eXBlcy5oPg0KwqANCisjZGVmaW5lIEVOREJSNjRfTEVOIDQNCisNCsKgLyoNCsKgICogSW4gc29t
ZSBjYXNlcyB3ZSBuZWVkIHRvIGluc3BlY3QvaW5zZXJ0IGVuZGJyNjQgaW5zdHJ1Y3Rpb25zLg0K
wqAgKg0KDQppbiwgdG8gcmVwbGFjZSBzb21lIHJhdyA0J3MuDQoNCn5BbmRyZXcNCg==

