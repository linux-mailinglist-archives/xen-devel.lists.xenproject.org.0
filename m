Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBEC4B6FE2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273346.468500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzwF-0005Nz-I0; Tue, 15 Feb 2022 15:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273346.468500; Tue, 15 Feb 2022 15:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzwF-0005L6-De; Tue, 15 Feb 2022 15:40:23 +0000
Received: by outflank-mailman (input) for mailman id 273346;
 Tue, 15 Feb 2022 15:40:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vySV=S6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJzwD-0005L0-Ca
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:40:21 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93a75bd2-8e75-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 16:40:20 +0100 (CET)
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
X-Inumbo-ID: 93a75bd2-8e75-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644939620;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=O0HD0Ve1RTy45p9c87j+J6TLa6Skcri5TG+tjxzDiAI=;
  b=ctbvswzfX4qYudwiW9aOjMVwrUeu0EXP6G5e1UFpdRAFjBqiyeVuPYUp
   TroE/K+jTtPrzE0zdRhtTc31AM+RkGB1I9btCmwIs+Vo/kK3wZxdPk9Nw
   MjEt7xiY23hZUVz7MfdgJ21Vqh8slaNAGFN4puiaH7eC6o7C/5/pONOQ8
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 59SwxqVfKx53CEv5IFg/HAVPZgv/32SVVWgMvVSfYMoCnUONH29DjZuRS4W+NvVtfPcqChIa+V
 yPJnOiK0wqFyEn/azpJ4guS5HZ0NfrfqL65blbJZbb1z5R+6M2qsbuoWUDiBRL6ibZnW2UJtKz
 NUKo8pITIDE08ry6pMX0h9z6/Vy0F/eYi+HM+HntNNtOH1ihCyUjQ7KLAjNIr9tCZiALm7et26
 73OozCkDRUJsZ1oIpGASfuvZuqpIaabH3eRXRO01oooxd0Fn9mC6Vpxr4nU+61d83pUjTuCsP9
 WVx0YR3hJ2euQqwNH1MGeWxc
X-SBRS: 5.1
X-MesageID: 64661971
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xzKCw6yYfWmdoqpeuC96t+fHwSrEfRIJ4+MujC+fZmUNrF6WrkUHz
 TYcDWjQb/yNMDPwLtBzPYq090NVsJOBx4Q2GVQ6qiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdk2tUAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/xhm
 fpTnq65cyQ0OrDpyPg8ChJ6Ny4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEEgmlp158XdRrYT
 /Yzbzt3Z1PMWkdWJXNUCaBkl+i0rHaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJWj7eJjilCXwm0VCTUVWEG9rP3/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQomOAvxMac8pdFas98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt//5VBNxm4+cc1GA8qqx/S+TYCM3CWBXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQevBCxWtamS0bbtT834JrWrFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtztV5t6nfW9TY2+DJg4i+aihbArKme6ENxGPxbMjwgBbmBw+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbaeVQ4QTl4UaeOqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937xs5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:JlZXlKCK/k0aylzlHeg2sceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHpXgslbnnZE422gYzRLrWd9dP0E/M
 323Ls4m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.88,371,1635220800"; 
   d="scan'208";a="64661971"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igT3/cM1x5Qikbq1vxcB5dhmMAFGLgS9dfwfDoR0LiRwNmCFDrku9Lk20b+u8YY7hMNdhCH8TCGJ5Ao9Y4prnrQswKdSd7hVQu48L9TGm4T1ifGQPHwWX5hhYl1leQd4rfmZxqXx99do9l/1dE7gPy6Ql6wozPezv8kpb0xIn4nLY+C6DaiSCdIJNqWRbHnP6nMxEr2Fd1Zf/vDxENmdGTBnFmK7sENpze1uvDDt+9Q1u4UIKZHOCuIhPdkuIL9ZqkGMA0DGQJLtLtiAKYwGM7uajBOUTQEAH5kraJ4ZCf9KvmUG+L1TfVPiMGRzoSLvkd1U5719emKXWQ4629HKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuRqmTWbUjTjuX5plPEf1g4P3C3FUUOPNwt8Hbq16j8=;
 b=cFfnjZmQdCoRR56Z6EP7uiA8ox9haLQyQp4eT+ZPmqitsq2b0YaoSufLrRf8y1UzaAI+u3XGHn2HogEOLBf0CPoBstOzyXLmWN0WETxqekdI6PLieaoe8ua7Rpx2mIDCzxgte4Oshl9qGhsah3BkrEgI5BHbnpgMRHEUdPq148hLtolHT7l3t6syCPinokHB9q0WP90t/08t22zrOBrSad3vApqvWd22znVeI5v5CaD1vuXfpEwUeENloTLdEniERkqvGUzQ/tBXfk6Bn1ieKgSCY4nhrUTkYEX4jz1Z95pbHBOGJzPmGUujqg+Z5eO/W4JUB0/dElbT/vH+k1NXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuRqmTWbUjTjuX5plPEf1g4P3C3FUUOPNwt8Hbq16j8=;
 b=g8AuPxIrpjAZyQLKIGCaHzpuXjWqzdlJ7M62fROUlJxiIXjvgR0QyhgM4GMAlfZjPDNYp7A401IY3i4eWD1v2cbp3nnNQGxegxufs1WqUOwaGVOuABlwh8F2txbiZkQlVDlbt32vmQp9k/7XJm7BoK60x3/tvsTqfM0eauFVwGI=
Date: Tue, 15 Feb 2022 16:40:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] rwlock: remove unneeded subtraction
Message-ID: <YgvJWJftVfyEWY2b@Air-de-Roger>
References: <20220215093951.97830-1-roger.pau@citrix.com>
 <7710f137-7123-ca70-3a58-3dba1981b2c2@xen.org>
 <dfc3ab95-f2ca-bf03-98c1-5d77ebcdb048@suse.com>
 <Ygu1si+HEiPB8vGz@Air-de-Roger>
 <493bf9e6-7f75-7f90-0c5b-a4a3e30cfb34@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <493bf9e6-7f75-7f90-0c5b-a4a3e30cfb34@suse.com>
X-ClientProxiedBy: LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c88ad8f1-054e-410a-73c8-08d9f099751a
X-MS-TrafficTypeDiagnostic: BN6PR03MB2545:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2545F02B7849F12DF397B39B8F349@BN6PR03MB2545.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yGPG847weSiRQfFOX8iOMhBn2wXtAk4Thw95eDFmNrRApIvrlCi+vd1xpvyRK2kqug5I7/9IiydcyPS0P7S7Jv7ARjrI6C9YKtcMZWN++oA4lZUYNYXGKLat9r3mhvQjGa+gg3OBmTyyCCeL1CIRDnFduO76LNIA9PA88dan49mKB4SbInrDQxqD0V8wdvIERmbhrqHa2U9SzVh/nvsICRX/69oEcHborraAnALAaneZNoAB7wV52Fm3lLAn0dbSF09SrllUvw+W1ZRH/ddR/f2ajSrc8UVAP64SFxyX0gsHcErbVwQzM95s6yoeCwl7FQQsmvXYWtMOsZVaCRTkM6r0HpcC9RteNUVaFy6YsEf7m5OBPKl9Rn9ZZ1HzmKmewFVfzxTa8u6+5VG+/tWDS9TugxCkg/l1psHpxDXffK31hRviWAu/+BQDp4th4TZbjaCHSqwAoQ3zzftCwlOSnsA6ti0os7TQKbPRnvYQF+L3vtVy3+4SmbaWd6IjsnHOKtvSDyXFNWMK/ROtwCXRXpTTl6bnZNk0mhSQYWjUuwnwNfrN15l8lqeQQQ5A3CDyifrIssga071glogwFAJELQETJ5cBvO4hxxvUKUQvu0nSHESU4e+Jxru854PJrFkLYuGD67knNvXi7W9ndGxog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(6512007)(26005)(6916009)(508600001)(316002)(54906003)(66556008)(66476007)(4326008)(82960400001)(186003)(5660300002)(66946007)(6486002)(85182001)(83380400001)(2906002)(86362001)(53546011)(9686003)(33716001)(6506007)(38100700002)(4744005)(6666004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0lUQUhqRVdDdmtvQ1IwWjBkUmYyUnZWZDhZTFYyOE9zcENBYUJWNXdZTnRW?=
 =?utf-8?B?N3YrbGdRaElYYVp2eTFOZnNWRzlxWm8yemRvZWsvMGFlbjEvdVVieEw5NmNF?=
 =?utf-8?B?UUN4Z0JYSk9wUTA4dVZ2a0lXbi93UHdjaUZoSjl4dHVWR0xJdElVNytnU2xW?=
 =?utf-8?B?aHptalZkU1diSFNGS1RRU2RmNU9TUkUzdlp5RFp5c1Z5WTl4cGkzaVo1Risx?=
 =?utf-8?B?dUNDUHR2N25TQjgyZmFZRkwyTUF3MGVpQXhkM3YrSHNWYzhQYWI1ck1JWHdU?=
 =?utf-8?B?M0Qyd0l0cjNRcDltWk4wM3VNU2NuY0tCMlJJLzdGM0VCQUpvV0NTc0Jyb2ND?=
 =?utf-8?B?dWoyaUtlUmdUOUlFYnIxaUNLcndkdWVsSktMVUdaeGU1amQ1SXlzd0xXNTEy?=
 =?utf-8?B?TG92QWZIVFZvekNCTkdVbzB6eEVEK3VjVHZNS1phL3FMcEhPdjJxWkJXR3Iw?=
 =?utf-8?B?a3FNRkpOQTE3ZFVkeVRpQ1NQbE8rNFRxQ2JNd3dQQVlMV09CRDd2a1JRNEt4?=
 =?utf-8?B?R29CS1dPZ2VFRFltM0ZjV2lKbytHMVNKeFB1UlFLRFh1cTJGNGZCS0FTcTN0?=
 =?utf-8?B?UjNmazlKUzlldFBiYUxqYyswWUFsME1tblByV0srRGtYZTJFUUVsalMzU0JM?=
 =?utf-8?B?MmVPR0RHZlppOWtnbUZ3MmxIOEdnYXlXNkVoMVRBOEhCYzV4dWFrRnY5dURj?=
 =?utf-8?B?MXhIaFljdVVONzEzV2s1dEdGTkxwUXZSWGpNVG9IQ1Z0NU5YL1I2c2k4elFV?=
 =?utf-8?B?emtZNlNLblpiNmIvNi84dXBJZlVRNDFpMm5qVTVrYWlVRTVhVUw2cmNlZjRE?=
 =?utf-8?B?RFhxWjFna3krUjI2bmRFbklsRC9qZnIvVFRGZnhyTWZYTnRab3FZT1Rwd2JR?=
 =?utf-8?B?R0daS2U2UkRtU0hzVHh0eldqcUJPSUkrRFhFRHMxd0VqVU1uUktvUElCSEVy?=
 =?utf-8?B?TmE2SEc3Wjk5Q2dFZURQblRLQnRIMDJSSklreFB1MklzOTZVdWhSZ0FNOGE3?=
 =?utf-8?B?WTlIVmhDZEtlMXRiNlBzVEk0Nkh3RUh2OHRHeExBbFpKemxrc0NmNE9PbmpM?=
 =?utf-8?B?MW41YnVHRFVHWnVjMVVPTDl1R0lwMThPWm1mbUViajJkZzhneG03T21ZU0JH?=
 =?utf-8?B?RmVQekhLa1dmbnFNdVM1dkpNM3VxLzIzcWgxMUFjdzFlOTJVQUVkTjY2aE4v?=
 =?utf-8?B?WVBDeG13ZWo5MjYxUmxrYjU2dVUvK2VBRklKNDRMdnVwbkhxNnJ2SVVGS212?=
 =?utf-8?B?aXVySHkzMzkycEV2cnM0QXdBUldrMGdCRWJUY2U1bGlEaUZJY3c3MUsvVWlH?=
 =?utf-8?B?ZVNoM1IxYlV6enUvbTdXdXJWOTZQSVJiVkN5S21VekxRZU1vTGp6NlRTRXVM?=
 =?utf-8?B?cjBDeHh0VDRoeVlQMlVyY2hNZ2d0UlpvVzhqVGFUWVN0akVBWWU5bEhPRkxV?=
 =?utf-8?B?YWtDbEtHNEYyc082TDA0VENKL3h4blErNUVsbENCM2twdXNxa1JKc0xPUHo3?=
 =?utf-8?B?c2RjMERMc1RFaGJhbGh3K041ZXliUFJaYjYzNlVGaDY2NS9EQ25tUmZ1UVRE?=
 =?utf-8?B?cU12K3ZqR0h5RXBabGtxblhNQlhyaUg0MmZCR1NmMFVVVWNhT1laSjhlOS85?=
 =?utf-8?B?UlYzeEcyR29Qb2UzM1hNSjNoYlAzTXFoWFk2bGxTbkxhYTNhSFlQTS9KTVRT?=
 =?utf-8?B?MGVEbmJRK3FXMG5ydTY1aXZUK3djU0pRMGVXbW10UUEvenJ3WXhldDFpeFlB?=
 =?utf-8?B?YlZON3htdHJZZ2FFKzRDL2NaWHdsZzN5N1E2TGZhUUlZNlQvbko1Q3Z6bGIv?=
 =?utf-8?B?cUw3ZENDN2p5ZkZJVXcxTmdJRHZTSGh6L0Z3MHQzZWVLUDFZYVdGWUZBVHho?=
 =?utf-8?B?Y2tFZ1VJQnB5TlllL1FzZnFxK2N3cTBnYmRySU9ybi9IY3RYQUpSa3pPcEdr?=
 =?utf-8?B?dnBIcWtocElkZWdvaDlXRnZNbk5oemhWWllkR2ZWd1p0ZEV6Q0R1RlhqSlpS?=
 =?utf-8?B?RzB0OThQTmZtN0FFZEJLaEphMzhRbWtKYjJYT2dUTlczMVZuazFtdzZCY3VS?=
 =?utf-8?B?WW1HdWVDSG8vcFpvTWNUQ0xyRytUVVhRVW5OdGw1b2hRUzVLK0NZcVg0UkI0?=
 =?utf-8?B?Y2ExRXRwTmpTNUtFVzNUcHRzTlJXUG95bHB4UmZlSkFOU2V0RzZDVEhCMzNU?=
 =?utf-8?Q?8I4IBKwmNeKlgdH85caEW7M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c88ad8f1-054e-410a-73c8-08d9f099751a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 15:40:13.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ns9wi1o2aKQDEYZDNLkoecMb6fZ/2t3/hPi93hLCqWqhA8gmszP4/3rXYO2k6psOFkTZYg/6SY//Mstyo5m8DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2545
X-OriginatorOrg: citrix.com

On Tue, Feb 15, 2022 at 03:45:00PM +0100, Jan Beulich wrote:
> On 15.02.2022 15:16, Roger Pau Monné wrote:
> > I could add to the commit message:
> > 
> > "Originally _QR_BIAS was subtracted from the result of
> > atomic_add_return_acquire in order to prevent GCC from emitting an
> > unneeded ADD instruction. This being in the lock slow path such
> > optimizations don't seem likely to make any relevant performance
> > difference. Also modern GCC and CLANG versions will already avoid
> > emitting the ADD instruction."
> 
> ... I'm fine with this as explanation; I'd also be fine adding
> this to the description while committing.

Sure, thanks.

Roger.

