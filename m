Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846434143A2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 10:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192241.342614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxW5-0005KY-69; Wed, 22 Sep 2021 08:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192241.342614; Wed, 22 Sep 2021 08:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxW5-0005Hh-2X; Wed, 22 Sep 2021 08:22:09 +0000
Received: by outflank-mailman (input) for mailman id 192241;
 Wed, 22 Sep 2021 08:22:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSxW3-0005Fo-H6
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 08:22:07 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c15c576-1b7e-11ec-b962-12813bfff9fa;
 Wed, 22 Sep 2021 08:22:06 +0000 (UTC)
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
X-Inumbo-ID: 2c15c576-1b7e-11ec-b962-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632298926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=jl8Da4tdx3a57Qk/VIGdkSe4VlRYgk2bnETxrUhv7Ps=;
  b=Ydg7ksKQWc3u7cch7O0kHt981kk1A2eLXc6VAbtf8ynaZc/MagHTcgQD
   onT/wZuaQz+Sls1KTk2NIGfYLkDPKd9pYFx1/+zs1+hDAv78yZX4FC4Q9
   WwvZU+Ss4Mie41sEhOg4l0KddyYXqkI8DMHZP6nWsENP1b9dWQ9bekO/J
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XFSfHGlrHY4bDoejpoN6A72iiDwFrWClWCBZ4OdBkv8r5pezev8lt8kCNR9IxlxCIF3tTSCXgW
 0Rj6A9J7Jm+yLSCvFFhXiJJfUrefIvIKOTIZssBNQQQ7tGvuQmkEjuaoaqWinGP51wY5ZZKvaU
 E1rIhT4NTlg3aKefdW7YaNxDytvm6TPBmdOc869FJqt54AelI0fnkdFbaVF5S0f0ngn/Nie7D2
 afGDxq5IwcUJ/8adbsJ4r+tLXX5VSURfp6Bp/bCTccTKqKgd3mKlU1f//uCByctcn1UVD/1vOB
 GTXCBIOf2b+yLYe5zZExwTeP
X-SBRS: 5.1
X-MesageID: 52894204
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hauNmqJJUDqaEwGiFE+R6ZIlxSXFcZb7ZxGr2PjKsXjdYENS0GMFz
 TBMXGHUbP7eNmqkL4h3aI6ypE9S6JeEmNYwSlRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM5wbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2EpIB22
 IxClabrUChyGerisuomCCVXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Xv48JgG1o2qiiG974R
 5UnTQpGay3uIBJrPE8IVc0/gOqR0yyXnzpw9wvO+PtfD3Lo5A5+yr/2K/LOZ8eHA85Smy6wp
 H/C/mn/KgEXMpqY0zXt2m2orv/Cm2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGrLcw3FymSMHnWB+1q2LCuQQTM+e8CMVjtlvLkPCNpV/EWC5UFVatdeDKquc7fmwtx
 gaGv+myHBM0l/q7Y3ymrYub+Gba1TcuEYMSWcMVZVJbuIO68N9v1kunosVLS/Hu34ascd3k6
 3XT9nFv2e9L5SIe//jjpTj6bySQSo8lp+Lfzj7eWH6spih9bZSsD2BDwQmGtascRGp1o1/og
 ZTlpyR8xLtVZX1uvHbUKAnoIF1Oz6zeWAAweXY1Q/EcG82FohZPh7y8BQ1DyLpBaJ5YKVcFn
 3M/SSsOvcQObRNGnIdcYp6rCtRC8JUM4e/ND6iOBvIXO8AZXFbeoElGOB7Bt0iwwRNEufxuZ
 v+mnTOEUC9y5VJPl2HtGY/wENYDm0gD+I8kbcqql0j4ieXOOiH9pHVsGALmU93VJZis+W392
 91eK9GL21NYVuj/aTPQ6okdMRYBKn1TOHw8g5U/mjerLlU0FWc/JeXWxL99KYVpk74MzrXD/
 22nW18ew1363CWVJQKPY3FlSbXuQZcg8i5rYX1yZQ6liyo5fIKizKYDbJ9rL7Mpw/NukKxvR
 P4fdsTeXvkWEmbb+y4QZIXWpZB5cEj5nhqHOieoOWBtf5NpSwHT1MXjew/jqHsHAiat7JNsq
 Ly8zALLB5EEQl06XsrRbfuuyXK3vGQcx70uDxeZfIELdRy1ooZwKiH3gvsmGO02KE3OlmmAy
 gKbIRYEvu2R8YU7x8bE2PKfpICzHuogQkcDRzvH7ay7PDXx93a4xdMSS/6BeD3QWT+m+KimY
 ukJnfjwPOdewQRPuot4Vb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIJ6xGrX
 k+v+8VBPeTbMczoJ1cdOQ45Y7nRzvoTgDTTsaw4LUiSCPWbJ1ZbvZG+5yWxtRE=
IronPort-HdrOrdr: A9a23:+A2wQqoFWjSaHv7dPBewOMwaV5u6L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSpQEIdxeOlNK1kJ
 0QCJSWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHtXgslbnnlE422gYypLrWd9dP8E/M
 323Ls5m9PsQwVbUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZszU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDi1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyUfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW82/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 guMCjl3ocVTbqmVQGdgoE2q+bcGkjbXy32DHTqg/blkAS/xxtCvgwlLM92pAZIyHtycegD2w
 xoWp4Y4I2mdfVmH56VMt1xN/dfOla9Mi4kD1jiVGgPbJt3Q04li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="52894204"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdbyU0MLp3zipdElBXPzgnhh3vHdRo4xl/AEO8OELYlNS/vYbiEcmFCzAVZqRk826vBd1ji3OZcbQL52k2ZI1OgujG9VooVhaEvP1pZbrngAOqJx0wPyZeFCdvZQ4WFACYcEXYvZfsoEQ5gsrMWnUo3PRT2QdTEWVkK8NshssX6ARcEvHCnOznZIY9iX7SKo5bpIMJGt7dxcvqfSxRbS0kvDZRKiOAkdrrMy/7EVSzi7uZ4xs+/eLdczgvFfl+orEIknGpUppuAPwMEek3XZbHpetqHgNEgvc5CKjfHhj0dja3LT7Q0VzopYOdycQZAqZyJwInsCFok/UU9fqv0jEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cD1jNa1dkKGTraDhEkBrz9VgImKuoXQDqGBPFO2wT9s=;
 b=atl4Pw5LlfP8hZEjnz2dk2DPpuLtPAhtBwhHAV/EFOL8+NMf3vT6N05j5Sd9Q0F+E1SF0mWXAePPcRCSxgUhWUacOEps6IW/xWfGPk8FYXfh/FFFC8Dr8aM53s/n5+UGyhlVPU9Kiaxz7TkCRpjwSxaom7JL94O4yKsOMV0edM9GPqGz6flTPevje9NxUA5Bl211sOpPITxAcrItGpFV55HL2+EZaJsuP191Hkqf0SLaxMXpV7voZJT6nPbe7/Lobmjh4GqujEcLBPdkkGuFynccbU3fo9KoVbB9F3Af4ZOGX51wq26rbV/okdOOBLTe86K/n1Tg2Z4cQDCOXbz1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cD1jNa1dkKGTraDhEkBrz9VgImKuoXQDqGBPFO2wT9s=;
 b=wR8JCmAKn9vUj5yvepkwH+sQuUVKSjBg2R3LuJOhCr0f/uGD25DsIWO5ZzyLYtNsPiKtVD15+JhKJsOES/pHmbzGpi46QaW7wggH2psnxclAzoD4pFUAR6IwQ8rX4TijVcHJ1fKF4lDQHd9auqWaZ6zxkS1M9Vegwug5jGJ+nIE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>
Subject: [PATCH v2 4/6] tools/xenstored: use atexit to close interfaces
Date: Wed, 22 Sep 2021 10:21:21 +0200
Message-ID: <20210922082123.54374-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922082123.54374-1-roger.pau@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0338.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::19) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03569a38-9dee-4d0e-000d-08d97da20e86
X-MS-TrafficTypeDiagnostic: SN6PR03MB4015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB40152857C183A409F8FBAE7C8FA29@SN6PR03MB4015.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85vh3Jizza0/DKULkJZcbNfALAEoACDwEUv/YFuvMgoAtgycNk4AOrYAisHuDsDJ99M63PoBj3WdykTOP8giDA0GxlMLRWmv0hf3OZDkpBeU+zzC9oJ4wqH9Sc5kJ82Vqfi6nrP3ZuqPusdYX0vT+lEtDVotimt5GIxsMJ5qDUxOkg2HAPaY5hOHaHOIIxsV3NShHTwwV9XbdKKAn9WakvH/Hf0L3m5jkNNBB3TtwD4JibJiZludo+QnBOJQVu5swx2j7nX7ZfiQILrWnoXjj1bXzQP221B/4Lo4poCN4ImKy9c5IgnEZDPvDqlwgQKSopT0Ob7vuGjtXDOKFKCXauqV60e/HutpZkzRTgeCKVxsn6yrhue48pGrmVCpt7FqPfBK/dnwoixoOjHhInHIbZNjlAlzJfy4nRm1qYDcNw/EhHqPGalFUwbLKUbs7AhwtI8JR9+8ZI8MTWE8hW6WqeRtyf/yhpkmC7+MdXbNegAnE+8mGioSlJKrzqzvdpnoVKqHLDzQpqKhvoM1UOSVlOOpp9RKGcYq5NL9Rv8W5RiLOrGb8w38wHNoP50buvZL3BC3l1jFXyxpb5N2yw8lSFEz5yt6XCcaaN5K+9ZjDegVddOjrpxiwHk2UQ2dObPWJqdn2g5shWPSeSymQ2WE+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(66946007)(4326008)(38100700002)(8936002)(186003)(956004)(86362001)(2616005)(8676002)(508600001)(54906003)(83380400001)(6496006)(26005)(6916009)(2906002)(6666004)(5660300002)(1076003)(6486002)(36756003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFo1bjFoVVFLZlZ6YWIzTk9Fd3FwMWcrNy9OcUU1dEtYNGdvNzVESTZSQVRQ?=
 =?utf-8?B?UmZHTUV2VWxHY3lyZnFobW14b3dVcDhPeTAzdE1HM2NYa1dzN1ZiU1ZNSWxD?=
 =?utf-8?B?c0JtYkRYLy8yeXdXOWpqV0o4bWlHMFYxVVVLV0ZqeXNQZGgwTHlVT3RPTVBQ?=
 =?utf-8?B?bjVQVWt6VWpBeUVtUFE2cmJvdEVzTThMa3lYU1l6UlRQYk5ZOXltVFVNaHNR?=
 =?utf-8?B?NnZ3UGV1ZlRkZk1HdU42V3Nza1ZINFpybUF6Ty9tVzJndXBpdnlMaDZDRzN0?=
 =?utf-8?B?SFZDVExwVjcwVVhUZGN0OU41RkcySW5xNkFBblprN2NXNjZRTGVsRXpUZm0v?=
 =?utf-8?B?b1orM2ltYjNtMTgwN2dTT2w0U1lBWjZjazQ2enVKdWdpVDlMalVwSjcrRUht?=
 =?utf-8?B?cVdhMHRucG5MT21saS8xcUE4NU1SRnhOOXc5TjY3Y1ZxVUV3OXBmZk9nVjB0?=
 =?utf-8?B?V2c0ZmswUDFDb3ZNRFB6YkJvUjJiaE42Nk9EcWJYQXNhc3lPUlV4MkFVSGxK?=
 =?utf-8?B?SWtaN2Z2RSsyaEZCTHBIc0ZvU2JFNU5vRW1qL2tndnVSb3hLV0Z6MnBoWThL?=
 =?utf-8?B?cTBBVlA2cXdSNVQrQzVjbnVIVW5vdE1RM0grWjFETDFCcS9DVlpOVzUzUVZ0?=
 =?utf-8?B?S2dSWkhFSXNUcnVQeldyY1dtbWRGWkhrNzJSUkZRTVJWL05xNG5DTFl3YjJx?=
 =?utf-8?B?L2V2ek9maEc4U3Zvb2FiZHJ1VjZtZTUyRm1xZC9NM0RUSnFRSlJPY3JLVjEv?=
 =?utf-8?B?Um5wdDIvR1pBOFc2TnVUSGdFaTU4ZFNLa0M2VGl3WmlkbkpGM2loSVBFeER1?=
 =?utf-8?B?MlJIN1B2aWtES2Z0UFRuR04zYUpwb1ZIYWNJMjBQaURTU0k0WGJNZFZidzhK?=
 =?utf-8?B?WjdFajVyeVlTK25SbXBvLzZMRUxPRWExQ0tRTUxMcytNbVlEOW9LcHhhSUdP?=
 =?utf-8?B?RDV6MlNodlNrQ0tsMVFnWE9LMmtUS2RMaTk0UVkyR2k1RG80MDVKRlh3Qk5Z?=
 =?utf-8?B?WFV5YzhxWUpPUVBSMVRIZW11RVFZVUx3Y09mOEdCTFhiYlNqYjlhSnUwS1pC?=
 =?utf-8?B?VTVnQXpJMjZINFpFWnN6SGlja0hwOWtHTTdmVWdUUno4czFzWnVKOE1TYmJk?=
 =?utf-8?B?ZXVhVE5nQ0RkdWJHazFLaDZTWkt4c2N5SElWREN4QVFDODIzdTBiK0huRWRF?=
 =?utf-8?B?cm5WWFhrWFFaNSsvdlVvYm55TFNlYWtYMER4RCttVW5uWXl4MDhJTzZVaFhT?=
 =?utf-8?B?elV3a0xJM3MzaGRlc3ZzSHpTV1d4Y0FaT3FtenlUNGRyL2NscDdyWFFPYTBz?=
 =?utf-8?B?dnlFNjd6RlYwSVJzQklsdWpLSUhlOUVrNGpkUTdEL21jRlNIVUxNY1RJTnJE?=
 =?utf-8?B?NGN2MmovUmFiT3d4VytSL0x1U2Y4aGl3dVJFUUY4TkNpV3h0bTRXZklOSmxX?=
 =?utf-8?B?YzNNZGI5a1FIRmVvZW5GOGtqUEFtZWNYb2JQK1NiblhsNVpJbndsYUIzVVFJ?=
 =?utf-8?B?aEpGRE9KbjRKVlpOc1R0WGhKcURoMFdlSFhkeG1VTmlLZnFuWlpJTUp1ZUJt?=
 =?utf-8?B?ZS8wRkFSUmNhb0JqNUJJVCtUZmdOYVk0R0x4WDdZUU9FS3RTYUtxL2pHNWZu?=
 =?utf-8?B?VzZ2VWlCc3ZIR2EyUlJVL1hSLzBHd2o3SWV5bG1XdXE0RUZ4YnZHUWZUakNK?=
 =?utf-8?B?R3ZRUDE3TGpIa0dvb2dIdWc3MXZYblRLQ29aczZlQ3hyRG9wb2U1SCtlaEFN?=
 =?utf-8?Q?0HymaWAKcVxDEy2wieogcmGEKibiP/24WPCvXAb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03569a38-9dee-4d0e-000d-08d97da20e86
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 08:22:03.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIVgAK/7kr0uxyHLN53ht7WX4pQTz7c8gEQmpxDi2AY1v75F8w31TfCO0UZLritnjnHeUtxnjG11sWNy+mi59A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4015
X-OriginatorOrg: citrix.com

Exploiting the talloc clean up routines to close the Xen interfaces
is cumbersome, specially when atexit can be used to the same effect.

Convert xc and gnttab to use atexit which allows to drop one
indirection from the storing variables. While there also close the
event channel interface.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Fix minios xenstored build.
 - Also close event channel handle
---
 tools/xenstore/xenstored_core.h   |  2 +-
 tools/xenstore/xenstored_domain.c | 61 ++++++++++++++-----------------
 tools/xenstore/xenstored_minios.c |  4 +-
 3 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 258f6ff382..a813bc5a8c 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -266,7 +266,7 @@ void init_pipe(int reopen_log_pipe[2]);
 #ifndef NO_SOCKETS
 extern const struct interface_funcs socket_funcs;
 #endif
-extern xengnttab_handle **xgt_handle;
+extern xengnttab_handle *xgt_handle;
 
 int remember_string(struct hashtable *hash, const char *str);
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 47e9107c14..9fb78d5772 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -35,8 +35,8 @@
 #include <xenctrl.h>
 #include <xen/grant_table.h>
 
-static xc_interface **xc_handle;
-xengnttab_handle **xgt_handle;
+static xc_interface *xc_handle;
+xengnttab_handle *xgt_handle;
 static evtchn_port_t virq_port;
 
 xenevtchn_handle *xce_handle = NULL;
@@ -198,14 +198,14 @@ static const struct interface_funcs domain_funcs = {
 
 static void *map_interface(domid_t domid)
 {
-	return xengnttab_map_grant_ref(*xgt_handle, domid,
+	return xengnttab_map_grant_ref(xgt_handle, domid,
 				       GNTTAB_RESERVED_XENSTORE,
 				       PROT_READ|PROT_WRITE);
 }
 
 static void unmap_interface(void *interface)
 {
-	xengnttab_unmap(*xgt_handle, interface, 1);
+	xengnttab_unmap(xgt_handle, interface, 1);
 }
 
 static int destroy_domain(void *_domain)
@@ -240,7 +240,7 @@ static int destroy_domain(void *_domain)
 
 static bool get_domain_info(unsigned int domid, xc_dominfo_t *dominfo)
 {
-	return xc_domain_getinfo(*xc_handle, domid, 1, dominfo) == 1 &&
+	return xc_domain_getinfo(xc_handle, domid, 1, dominfo) == 1 &&
 	       dominfo->domid == domid;
 }
 
@@ -648,18 +648,6 @@ int do_reset_watches(struct connection *conn, struct buffered_data *in)
 	return 0;
 }
 
-static int close_xc_handle(void *_handle)
-{
-	xc_interface_close(*(xc_interface**)_handle);
-	return 0;
-}
-
-static int close_xgt_handle(void *_handle)
-{
-	xengnttab_close(*(xengnttab_handle **)_handle);
-	return 0;
-}
-
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn)
 {
@@ -737,35 +725,42 @@ void dom0_init(void)
 	xenevtchn_notify(xce_handle, dom0->port);
 }
 
+void interface_cleanup(void)
+{
+	if (xc_handle) {
+		xc_interface_close(xc_handle);
+		xc_handle = NULL;
+	}
+	if (xgt_handle) {
+		xengnttab_close(xgt_handle);
+		xgt_handle = NULL;
+	}
+	if (xce_handle) {
+		xenevtchn_close(xce_handle);
+		xce_handle = NULL;
+	}
+}
+
 void domain_init(int evtfd)
 {
-	int rc;
+	int rc = atexit(interface_cleanup);
 
-	xc_handle = talloc(talloc_autofree_context(), xc_interface*);
-	if (!xc_handle)
-		barf_perror("Failed to allocate domain handle");
+	if (rc)
+		barf_perror("Unable to register cleanup handler");
 
-	*xc_handle = xc_interface_open(0,0,0);
-	if (!*xc_handle)
+	xc_handle = xc_interface_open(0,0,0);
+	if (!xc_handle)
 		barf_perror("Failed to open connection to hypervisor");
 
-	talloc_set_destructor(xc_handle, close_xc_handle);
-
-	xgt_handle = talloc(talloc_autofree_context(), xengnttab_handle*);
+	xgt_handle = xengnttab_open(NULL, 0);
 	if (!xgt_handle)
-		barf_perror("Failed to allocate domain gnttab handle");
-
-	*xgt_handle = xengnttab_open(NULL, 0);
-	if (*xgt_handle == NULL)
 		barf_perror("Failed to open connection to gnttab");
 
 	/*
 	 * Allow max number of domains for mappings. We allow one grant per
 	 * domain so the theoretical maximum is DOMID_FIRST_RESERVED.
 	 */
-	xengnttab_set_max_grants(*xgt_handle, DOMID_FIRST_RESERVED);
-
-	talloc_set_destructor(xgt_handle, close_xgt_handle);
+	xengnttab_set_max_grants(xgt_handle, DOMID_FIRST_RESERVED);
 
 	if (evtfd < 0)
 		xce_handle = xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
diff --git a/tools/xenstore/xenstored_minios.c b/tools/xenstore/xenstored_minios.c
index c94493e52a..9b050c7e02 100644
--- a/tools/xenstore/xenstored_minios.c
+++ b/tools/xenstore/xenstored_minios.c
@@ -49,12 +49,12 @@ evtchn_port_t xenbus_evtchn(void)
 
 void *xenbus_map(void)
 {
-	return xengnttab_map_grant_ref(*xgt_handle, xenbus_master_domid(),
+	return xengnttab_map_grant_ref(xgt_handle, xenbus_master_domid(),
 			GNTTAB_RESERVED_XENSTORE, PROT_READ|PROT_WRITE);
 }
 
 void unmap_xenbus(void *interface)
 {
-	xengnttab_unmap(*xgt_handle, interface, 1);
+	xengnttab_unmap(xgt_handle, interface, 1);
 }
 
-- 
2.33.0


