Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1481D4D2F0F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 13:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287794.488016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvSm-0003nf-89; Wed, 09 Mar 2022 12:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287794.488016; Wed, 09 Mar 2022 12:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvSm-0003jh-1C; Wed, 09 Mar 2022 12:30:44 +0000
Received: by outflank-mailman (input) for mailman id 287794;
 Wed, 09 Mar 2022 12:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRvSj-00039g-Jb
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 12:30:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9c62885-9fa4-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 13:30:39 +0100 (CET)
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
X-Inumbo-ID: b9c62885-9fa4-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646829039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=9n5J/SLlazG5OkZb6XiFpdMz0tZKAWZaKoaZX6MjJqU=;
  b=GUMTuAtdaO4rGxTGrN55r/Pav/tELktoEnL00v5VEZDdD0zsu6ZDhD2I
   iQhKZX6tuG6AH5m2koz8fWJ660Ut0HsvWygc8c0b1hqNMR91N7J29vo5w
   N7sXpDjazdDLG4H9yP6gIUh03zAS56fOs37M7ZEc8yTdLLZlIMNxh6Znl
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65807411
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cX6ByqufSQXZVZWYaU8iuyRAmufnVNdeMUV32f8akzHdYApBsoF/q
 tZmKWuFMq6NNjbweowgaNm+90wBu57WmtQwHgo4pC9jEn8Q+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV6
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi94J43emOkcdCBGAiJVZfFe877sPFKw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 ppBNmY2NXwsZTVxJggLGZgBmtv0qV3wLhFCkVeTtbsetj27IAtZj+G2bYu9lsaxbcdfk1ucp
 2nG13/kGRxcP9uaoRK79Xariv7KjDnMcosYH72l9dZnmFSWgGcUDXU+V1ShqP29oke7UsBYL
 Qof/S9Ghbc23FymSJ/6RRLQiGWfohcWVt5UEus7wAKA0KzZ50CeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaMyUPMXULYyNCSAIf+sTiu6k6lBeJRdFmeIa3k9n0FDfY0
 z2M6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyNvxpZdo6oZquR90nYxq4cNI2YZUSrs
 y1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BKL4WtsCIlv0GxGhEOdS6a4EIwUwKfpDrwJvdiEP4MVMvCdmOJqlRyChHJ8PUiwyCDAcollY
 P93lPpA615AV8yLKxLsG48gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/lmLr
 IgDbZvWl0kBOAEbXsUx2dRDRbztBSJnba0aVuQNLrLTSuaYMDpJ5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGcTdlWcQThmnktLMeu1Nb4m9CpTFXV1YT6AhihyCa7yvfx3X8ZmItEaGBlLkKcco
 w8tIJ7bXJyii13vplwgUHUKhNc7JUrx2l7WYXbNjfpWV8cIejElM+TMJ2PH3CIPEjC2pY05p
 bih3RncWp0NW0JpC8O+VR5l5wrZUaQ18A6qY3b1Hw==
IronPort-HdrOrdr: A9a23:xK2uj6thJSs9yEz4KkeBwTH57skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcT2/hsAV7CZniahILMFu9fBOTZslvd8kHFh4xgPO
 JbAtND4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNz2CA5sQkTuRYTzrdXGeKjM2YKbQQ/
 Gnl7V6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9dVfYF1P78rhJ1GdZU8qLOMexTwqDL3QRSvyAfcZeg600ykke+D3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65807411"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAGMM5H9N2vt2BURr1GKfuyHuNEVnI76fRYF23v8whSwtazgy9ZjgDgxqZ/hKllupgHdwBdmvYVSbL4J42UqEqv3MtB5lhO2QxyEJpmN/0OVkLBOVetHjfb21UEYrd1spcBUtGvXjvc31oJJBkYUZJ8poJ0292Z38V4AEKzP6oKxg2wak/gotHttIJouzTHm4eW4zmUEKHSQLynznCRFOo4dlGlwgTDKwq32HuQtUxyMpDTXViORswFidiNvRDCX6MILybhwCr/8Am0A7gU510HqsnL8Gix8fVw2upSpJtQ7cUAhqFRzzbwcZpt2FB/Oj/L/o+Z69wYyX3zvDNlXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfLEQnh7siEH8oE4+sQ6IzMnA97R6ZK1oefy+4uZXVI=;
 b=EdRkYGHBU1JIOBcgotvFDUVRvn+MBy/9Mtg6SajhV1OYg2K0rL50qNYfRcPn/V00u5aHvyVdGOxmBt5tGtl070a55ysxJMl3/0vc+vtWnQ5YRzGl5PA6jKpNbvX9pXm71I0jX9xWnYQ25jasljCJNJOlcGLrYx/0NB/2DTFURuG63GIe3f/H+phiHgNzst+S1lcrN/W6v/z2ohfYxbcYFyeuCN03DQ6ygxV5Jm39gHVu3V4m1gIrCgMuoxhRyK89Vx4TI+ibJ3spbjposiApCBf3FH22wPmGdnfSL2RchN0Qo4dgYrBRqMTU4CCwa7QV19qf60Knivx6wBYe11m0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfLEQnh7siEH8oE4+sQ6IzMnA97R6ZK1oefy+4uZXVI=;
 b=HVT362XLc3xn2RNNHoYaLKrJcOy1Eapht6iMPQUDpqYZK6k8iDMHP2abN6GJEU8Oz3a7ac1QQ/Jv+wPyBKtcw09L+2F2NCH4X9pUEAi9g8MdDYwmdpmvfanVbD4eRMRO3/A/3HiwXeu+4di6tDkC5cwGUPrkNcPXfprLGyThNls=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 1/2] xen/build: put image header into a separate section
Date: Wed,  9 Mar 2022 13:28:45 +0100
Message-ID: <20220309122846.89696-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220309122846.89696-1-roger.pau@citrix.com>
References: <20220309122846.89696-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92357126-b1c5-49fc-377e-08da01c897b1
X-MS-TrafficTypeDiagnostic: BYAPR03MB4359:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4359F983D122F7C5EE92559C8F0A9@BYAPR03MB4359.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DJI9bbypEy1YzBYVl9NYq5Bt17/7veoSOzg/+J70XYVRXgRGnMa2DCxwbY86y/Qu0lMZM/IzJj8s04d0nPhBSR5v3yjzJ3eQLbRYofdILOFFg7pYYiLDTgOyJUJp22d0VPygYsi8x/scCBNnVStIROzz+dEh2cfFDumd69pwLTI5Wbsmm6ccKyS451zPAQfMx4JO+qmKtZDmOt5OGmunf/43Eq2TX9aXh7RqR93YtAeJGG3HIutpEeY7DvTrEGRWMremr+ac1Ui44BAtx/PzU32McqgV5awx4Sjwyec/3Bm8TYWCiFqlvtJY/wUSdXgRSnsV+jQecayrlPh1l8czEF6PHSwQtAx64GQx0mNHuVnHEPN/YNqNnknaOD51bv+mT2Tc9KNxnOgC2U/tHajHcP4J0iHFQWkKv5D4XkYFPYjjoPCLurDeXZfjH5hBD3+H7QjMzvfVb5sovDKDOrniML5Sf3GKVuk4dLWpwmZL+imOaL5GwQUqPm+S7ynpoqdpDFVolBPTo6WUyyfNj92N50T9uVgYxZyB8+A8LCopVWmMdQUaQjz3hE0+DGLjyThDSV3c1Kk/u2Ddp4C/yWxttjGFNcNhABncwHYjQ6+Ksoogi/Qr0ryEL9SRvhgitvAZILr0ml6sx0p3ff3coy2kFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(66556008)(4326008)(66946007)(1076003)(8676002)(6666004)(86362001)(83380400001)(2906002)(38100700002)(66476007)(82960400001)(5660300002)(8936002)(6486002)(6916009)(6506007)(36756003)(54906003)(508600001)(2616005)(316002)(6512007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEd1Q3EyUVlKNjJ1L1hKeTByRW0rWEgrUjBQOWJiVU5TV3dGUjhveFZsY0Jk?=
 =?utf-8?B?UGpRNkc4ZStySU9UQnNsRXBpQ3FJUTJ0UG5JOXppeHNEdTNaLzNtdWNRS3lL?=
 =?utf-8?B?K0VFdUh1S0JmTm5XTWtHcitXK3R1ZXBVdWVKTEZmaFFlWDhaMmhJcXU3ZFlH?=
 =?utf-8?B?MTBRMWN2MVJaYXA4bkZESHRQR1BaTXBBVHQ1cHBUQ1grbUlVYnFGWlZpM3Nj?=
 =?utf-8?B?RXZiYXR4SGY5TDI2a1RSc1d5Y0NKQ0kvc3ZMS3pUTUtQMm9Mcy9HQURucXhK?=
 =?utf-8?B?anNrb1NUMjVaM0l3R2Noc1kvbXRRREY1UVBHQUlsUUl1dlY0WTVvb0JRZ0pL?=
 =?utf-8?B?UDk4VWN3dk1UazZrNHVlMG5TNzZwc1pjRXljNExibnVvQzk2b1AwQlBDV1Jk?=
 =?utf-8?B?RUNoNG9sNElDQmtxSEhmMllRcng3ZzdKaGZBcHZ0ZVlxMkJ2bmZnQjhYUUZJ?=
 =?utf-8?B?V2xiTHVyTytyeFhYV0xvTktOMzFoZC9xNkdHTDJnSGlHYzJ4eTJvWlZIcFc3?=
 =?utf-8?B?WWJPKzdqakdzMU1wUGo3eWdhRlMyNVNwNG53ZmhWR2xyMnRweTBucUFaQWk0?=
 =?utf-8?B?TDVNTHVCeVhuWWY0VzV3cWtqNGNPbFlMN3pJUlczVFNHeDBzVHJGRDY1cHA5?=
 =?utf-8?B?NEVldkh0VFVYY1hraG5ULy9PSGtCWXBaWEo4V1Nmb2FRSEpzRTRaREYzd3Fp?=
 =?utf-8?B?MU55OWR6K29Ka1hYbDBOb1UwNjVNRmR1enRzSlVUWFFYWE9FcDRoVlpXN2h6?=
 =?utf-8?B?eVdSUWEyK0dPMGY5WEoyMU93SFg2ZEUzbDJ2bll3MlNtM3MrZXhTamRzeVJL?=
 =?utf-8?B?R09KVDY0VG13K1FNYks0R0I4b1pUNitvdmJNTkVQUm5ldmY5ZEdiNVRwL0dT?=
 =?utf-8?B?cmlPb3lGK3dnZlNFaU0rWHlDZDZGbVdWeWQwV0xJWTJyT052YnFkcG4xd2dU?=
 =?utf-8?B?T1l1aUJkZ28wU1JVT3NPTGYwd2s2VHpRdWRvd3dvNEpKZXA2TElMSzdmOFJZ?=
 =?utf-8?B?US9GQXhPRVVsVjJudUUrMzFZUFB1dG5Da0wvUFJ6ZUJ6OERBaXh2cVpNcFN0?=
 =?utf-8?B?NU44YzBpSzRwT3E3eEl0VDNJSnh4V2RJd0tXZzk0RXc0ejhJdHdBV2dyY2VF?=
 =?utf-8?B?bGRUL0dPcjZwZ29wRnRGVU95c0ZsaTk3T0IrbVNkQzlVcjAxMFFsd3RXMHkr?=
 =?utf-8?B?TGllNWd0R1JPSDZjKzg5RFdWeE81b2hPN1JaYWI5bWY3MUQ2eDR3VVpoTzZT?=
 =?utf-8?B?ZlNYRU9GemVRYzNLalY4NHB5aEwyYVBsWVJhay8xT0lqZWNibWJIS092UXl6?=
 =?utf-8?B?YWhnTlp5RmZRemNPa1dPbGc1TTFaNnpjQWJWYzUyUzNvMjZacFZMZC9kZTVP?=
 =?utf-8?B?ZGZ6ekE2ZjZkamMrZnl5SVl0VXpOR2xjUzkzbFh2bWNXWU5YMStRWHJuazVR?=
 =?utf-8?B?Umk3NlRLWkU0d3JnT29DUFZjQjgrZ2F4T1VZMjRwMlYvV1pYbm9YQ0NGamp5?=
 =?utf-8?B?RVpMYlFETlZ2SnBGOFVKRTk3R3ExN2RjUjc4ZU03YUo1T3lyZTZ0SzJDWDlS?=
 =?utf-8?B?ZUgwTHpPZlZoanM3NXo4SWYxa0NVSU10Z3FSZUFmRk1YdGd0QjUyNmpMc0VH?=
 =?utf-8?B?VVdPQnNGbVZBNFdFcHpPSGhGY0UzdWw3ZFN4QlFaR0RjRjRFVUJiY2RScmt4?=
 =?utf-8?B?ZjN6Vk5DbHQ2anhUbkxaaTFDV1I2Zlp6Q2k4cEh6UDJzekxDY09hM0FlU2pP?=
 =?utf-8?B?L0svKzl4NWRaZjlyU3Q2dzU5K3l3Q3k5YVF2N0F6TUh0SW9EZmtnWFJLNDk2?=
 =?utf-8?B?RjFXbDJFNlNqN3hlWFF3QWVLMlFrMGdaQkpkMzIyMWRJbm1XU1NIZXpaVGxR?=
 =?utf-8?B?NXdyclJQT1ZYclgzeHR5ZEtHalIwbXJaVE9pZmRjTUdrOUNGMkxmZms3S1Vx?=
 =?utf-8?B?aGVLc3R6eXRVemEwdExWdUV1dU40ZkJPRDNuZDY5amJKL0RiN2dkdklGWWF6?=
 =?utf-8?B?dWNEL2xlMTFoa1N6NmZxTFM4WnA5Ny9UQTdKRXlOajdOeWVXSUorSGpoamE5?=
 =?utf-8?B?UXlGUjdmcDF3Q3l5RnpDVkVJa0lqelBqdDhzWTlmVFpHWjBRVlhhWk5aNHFF?=
 =?utf-8?B?RVBtZ1p4Y3NsSElBV0FFUWNhVnIzQnhnL1RIa0RFNThubk5ucjNYWDk3VFRu?=
 =?utf-8?Q?Akmv2RlHOVyUAXm7VK/DAF4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92357126-b1c5-49fc-377e-08da01c897b1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 12:30:27.7982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrnMYLF+lruE/J5u7p+kRph3ujArnCghrlRc0vXw1U1nqPtScn7M7TRVFRQHZFIsq53PmRKhPUApBz6/vjBHug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4359
X-OriginatorOrg: citrix.com

So it can be explicitly placed ahead of the rest of the .text content
in the linker script (and thus the resulting image). This is a
prerequisite for further work that will add a catch-all to the text
section (.text.*).

Note that placement of the sections inside of .text is also slightly
adjusted to be more similar to the position found in the default GNU
ld linker script.

The special handling of the object file containing the header data as
the first object file passed to the linker command line can also be
removed.

While there also remove the special handling of efi/ on x86. There's
no need for the resulting object file to be passed in any special
order to the linker.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com> # xen/arm
---
Changes since v3:
 - Drop .text.cold.* handling.

Changes since v2:
 - New in this version (split from patch 2).
---
 xen/arch/arm/arch.mk        |  2 --
 xen/arch/arm/arm32/Makefile |  3 +--
 xen/arch/arm/arm32/head.S   |  1 +
 xen/arch/arm/arm64/Makefile |  3 +--
 xen/arch/arm/arm64/head.S   |  1 +
 xen/arch/arm/xen.lds.S      |  8 ++++++--
 xen/arch/x86/Makefile       |  5 ++---
 xen/arch/x86/arch.mk        |  2 --
 xen/arch/x86/boot/head.S    |  2 +-
 xen/arch/x86/xen.lds.S      | 11 +++++++----
 10 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 094b670723..58db76c4e1 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -23,5 +23,3 @@ ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
         LDFLAGS += --fix-cortex-a53-843419
     endif
 endif
-
-ALL_OBJS-y := arch/arm/$(TARGET_SUBARCH)/head.o $(ALL_OBJS-y)
diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 3040eabce3..520fb42054 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -4,11 +4,10 @@ obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
 obj-y += domain.o
 obj-y += entry.o
+obj-y += head.o
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += proc-v7.o proc-caxx.o
 obj-y += smpboot.o
 obj-y += traps.o
 obj-y += vfp.o
-
-extra-y += head.o
diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 7a906167ef..c837d3054c 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -120,6 +120,7 @@
 
 #endif /* !CONFIG_EARLY_PRINTK */
 
+        .section .text.header, "ax", %progbits
         .arm
 
         /*
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index baa87655fa..6d507da0d4 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
 obj-y += domain.o
 obj-y += entry.o
+obj-y += head.o
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += smc.o
@@ -14,5 +15,3 @@ obj-y += smpboot.o
 obj-y += traps.o
 obj-y += vfp.o
 obj-y += vsysreg.o
-
-extra-y += head.o
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 66d862fc81..e62c48ec1c 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -133,6 +133,7 @@
         add \xb, \xb, x20
 .endm
 
+        .section .text.header, "ax", %progbits
         /*.aarch64*/
 
         /*
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 08016948ab..743455a5f9 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -30,9 +30,13 @@ SECTIONS
   _start = .;
   .text : {
         _stext = .;            /* Text section */
-       *(.text)
+       *(.text.header)
+
        *(.text.cold)
-       *(.text.unlikely)
+       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
+
+       *(.text)
+
        *(.fixup)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 9c40e0b4d7..04065a7310 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -1,5 +1,7 @@
 obj-y += acpi/
+obj-y += boot/
 obj-y += cpu/
+obj-y += efi/
 obj-y += genapic/
 obj-$(CONFIG_GUEST) += guest/
 obj-$(CONFIG_HVM) += hvm/
@@ -77,9 +79,6 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 obj-y += sysctl.o
 endif
 
-# Allows "clean" to descend into boot/
-subdir- += boot
-
 extra-y += asm-macros.i
 extra-y += xen.lds
 
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 8e57476d65..c90e56aeab 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -117,5 +117,3 @@ endif
 
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(srctree)/include
-
-ALL_OBJS-y := arch/x86/boot/built_in.o arch/x86/efi/built_in.o $(ALL_OBJS-y)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index dd1bea0d10..92d73345f0 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -9,7 +9,7 @@
 #include <asm/cpufeature.h>
 #include <public/elfnote.h>
 
-        .text
+        .section .text.header, "ax", @progbits
         .code32
 
 #define sym_offs(sym)     ((sym) - __XEN_VIRT_START)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 506bc8e404..960c51eb4c 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -73,9 +73,7 @@ SECTIONS
   _start = .;
   DECL_SECTION(.text) {
         _stext = .;            /* Text and read-only data */
-       *(.text)
-       *(.text.__x86_indirect_thunk_*)
-       *(.text.page_aligned)
+       *(.text.header)
 
        . = ALIGN(PAGE_SIZE);
        _stextentry = .;
@@ -87,7 +85,12 @@ SECTIONS
        kexec_reloc_end = .;
 
        *(.text.cold)
-       *(.text.unlikely)
+       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
+
+       *(.text)
+       *(.text.__x86_indirect_thunk_*)
+       *(.text.page_aligned)
+
        *(.fixup)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
-- 
2.34.1


