Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A604DB0B7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 14:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291182.494048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUTRl-0004Sf-Po; Wed, 16 Mar 2022 13:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291182.494048; Wed, 16 Mar 2022 13:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUTRl-0004Pz-Mr; Wed, 16 Mar 2022 13:12:13 +0000
Received: by outflank-mailman (input) for mailman id 291182;
 Wed, 16 Mar 2022 13:12:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsrA=T3=citrix.com=prvs=067c1f106=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUTRj-0004Pt-Jg
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 13:12:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aea3f896-a52a-11ec-853b-5f4723681683;
 Wed, 16 Mar 2022 14:12:09 +0100 (CET)
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
X-Inumbo-ID: aea3f896-a52a-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647436329;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=u7hDWoxS+34gyfjcBBLKForO1fKGP3KgSHWnPRU5r50=;
  b=ZgfJiAfiDhqeudrDuxL13voOf/fOZSx4WlYefbw/qX/qg6qILzu70Bob
   8tSjlnpwhSmSKelp9JWoeL81J9taE2/g/ZqsKVMhRS1fyOBFLxfS7N6qt
   uR5NsfnLvXXHD/FqhPBdGGlCISMbdLXxmxAnsCYCR9DPXHXBg+vSR/W6j
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66311278
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KRyr+aAICT309hVW/zvjw5YqxClBgxIJ4kV8jS/XYbTApDgm1WMEz
 jdMDDvSaPiMajHwedsnbdyypkwPv5SBxt8yQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vg3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhP4
 c9oiaCbdzwVAZfzgegecUZbGQ1xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4QRq+HP
 ZVJAdZpRDnZXTBLCmhPM7Jkpt2lvVTGb2NfkE3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0ZfNKNtEGwz+29pXu3B+VBUpbTTRtZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgLZ1
 JTjs5LChN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvG4kdR0waJZdI2WBj
 KrvVeV5v8Y70JyCN/MfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3C7SvPHOIrdZNcTjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX3xUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:t5v/bK1zIhmDDDU/7kNKFAqjBRxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/hfAV7QZnibhILOFvAt0WKC+UytJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZi6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngcOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4kzEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXMISaCUmRQXee
 v30lMd1vdImjTsl6aO0F3QMjzboXMTArnZuAalaDXY0JTErXkBerV8bMpiA2XkAgwbzYtBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIfLH4sJlOy1GkcKp
 gnMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNxd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDhRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dvP22J6IJzYEUaICbQxFrEmpe4PdIi89vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.90,186,1643691600"; 
   d="scan'208";a="66311278"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+O/3ZlRonscei/2MZ6zzd2KMoop0Vj9g5+oAqUhpVD3U7ENV336WadkRjlLgF/HJMLWatR708p5ZbF+yWXb7/+/9Hdfl22PvEdc8PQYGawLM/A1HmGCwp6LmfUz18T2sdIL3p9nDRfbMFmFJzhP0/WooLTYIcFqwPZtzgQkDhZHUKXL+Pa/LhDblGh1M1hoK1wXMcfIkdylHC0QnenyxsB4MOlw0AueTNCK4k1OLcLPfkgQ49S6n/gt6I7XqtEzrO2+XQ81JzYFG2qcAJSB5ijhI+5YrGTS+ISSrzyYzMelU3vmMaB9aUdnaEFAbquEKzO8WG9m1SM+/P64llRpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7hDWoxS+34gyfjcBBLKForO1fKGP3KgSHWnPRU5r50=;
 b=FE/KLuBlBSpEaSTzaDo5opww1pMcU+jR05SfIRqnOiOfv2n3shF0cMsb992+5JkJXMpY6I7zSFQQOe1wEZoOp9hVSybb+ntC1XFXPF5ETslnIzO89isvJi+ym/cxbDh8H65l6lwm8gYjQ8/zWyEpRo/KQAR0hIYjfDWKlZqEtRFQzVriQWbOqv3jzZzC8hnygcz7KdVbqs7R9BpOwL43E0Yn9fLJH6RVFuWlDVYpVoY1lTQZ3CVdBqXIb4cRiinUwLomIwJCFwcwOlvrLQcfHW4z6jYBlhj3MpXorLTcAgcNhxCEN6dJcFQvly0wJRY2bBOUO1hLhEtHq4VxJ3bwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7hDWoxS+34gyfjcBBLKForO1fKGP3KgSHWnPRU5r50=;
 b=Zzt/YTE7v5ckWNxM3XFOHc/roxl0toUUPeEcMdAEE4+u5ITUoNUnzbrXO6TNXv1bl2emsvuSZGJwH15mSCzEgO40nAUN3gcQsLrmTtG77JOOmEI9P5fvfittrEnuBVqDPUlcQlymnw2ZHmYqfdEIg41y5st0saINJkr6w5vZbqk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul/test: correct VCVTUSI2S{S,D} comments in
 predicates test
Thread-Topic: [PATCH] x86emul/test: correct VCVTUSI2S{S,D} comments in
 predicates test
Thread-Index: AQHYOSMTF1LKw8bS+UCSoPU3HI63yazB/JSA
Date: Wed, 16 Mar 2022 13:12:04 +0000
Message-ID: <ead1f73c-0d7e-3ee8-f464-a0ca28c9fd62@citrix.com>
References: <85dd9ad2-0eea-432c-24d2-40c6530776dc@suse.com>
In-Reply-To: <85dd9ad2-0eea-432c-24d2-40c6530776dc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c6e8bdb-d077-4b4d-ed33-08da074e9133
x-ms-traffictypediagnostic: DM5PR03MB3306:EE_
x-microsoft-antispam-prvs: <DM5PR03MB3306319C9331CAC65FDEDC35BA119@DM5PR03MB3306.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RlK/JByb2Y+Z8DIA6BqbVof/EkNfEvCuyXyMV40O9pNn9f/1FD0SzXaaKFvslFmVS25NXf3qL1Mb+YvzNR/FfJviaQA9LNv+zt6tK5ZsatYHaWmqZ1IlR3WmTu+jD4Vjy5GsrkSN/ZL01sTX9F4Auf5hkmlkU5SueQsufT3lSc/r7ZT8sG8ek1smYSZVgw3SPx9M54pJulyspR/q47WaGKbwFgtTiqNNk/jj66k+tMqqU+YHoTBfMlRBvWqV/Xl6/Mi9/WXMfGnkt3xUiEr4Y++FE14GW3RejU7XxH7cMpfZBVzhMl0InL2S2uPvM82QNFJ/KvK8X0YMIc0y+w8dSoiZztNdR3yCwdZqfrogyFAp1Qs3bYcGPeYtkH+tCa3bDEKVzreMXVKNWDrTxeKCvAoNkqZVRoQDIDxtlTsGAXtWv+eTtWQp2bG+dYQx0vXnztwMtB6D3aojctQxWuneSt5/hmBmAUnsxtj3ZUF0Z2WI9D6+hSm+jjs5s2EmJ5+s26l5H3jNSAVMv96D92hWVxCGjGehx3bGua6A9MGZqfuUlEl5Y+7gOfC6JUxr6ikAW7idpfkk8F9Z9lebt5eUDmQGUmtDNl8fK8rosTAhGhds3g8m3I6qvALIFA9bzpQgKLUizUeC3K5uF46z8YrlQwjIoj7V5wFK06Be68VBTnwhumYS+Yl/sbKzAVoIpsohn+XADLZWQKstYfPrjOUAPqevqAP2FaMnCGAdhJXtAmr/ahzWWiQKaeppsPKe7DZOhVmr5cZC1OCX9Cbyn7mVJg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(71200400001)(38100700002)(2616005)(122000001)(316002)(8676002)(26005)(186003)(4326008)(110136005)(6512007)(86362001)(54906003)(6486002)(107886003)(5660300002)(2906002)(31696002)(38070700005)(6506007)(31686004)(91956017)(66946007)(53546011)(64756008)(66446008)(66476007)(66556008)(508600001)(76116006)(36756003)(558084003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFlocVA0Qm1ScHRiWk54eDRkMXdTQTNxQjdPVTVCOHphOFJaSGtiWlRqT0xJ?=
 =?utf-8?B?Q3NsdVdlQXU2NGJrTHY0eDMza3gwL2t2Qng4emdmNWFxT1NjdHRYbEdXRGx2?=
 =?utf-8?B?VG9YUVcrYkxGNjBlazZHVDdPdDkxVzBvUU5Od1pzcElqYmw4SDlzNzJpYjA3?=
 =?utf-8?B?MVlrUnRIaTFUY043WHlKQ00zMFB3SmtSTG14Y3dwVTlnd1NRVm9LK1ZIWmJ0?=
 =?utf-8?B?VFlSVGhFRzNNWmhDWTh0dDF5T3E3MlorQUVFQnNIN05pYjcvaEc4YTluRGVT?=
 =?utf-8?B?ZmdsL2lGdGY2Q0t1V1B2UVRGZ2VoVE45RjdRa1p1V01NRTk0Qmg3VmZxSEc0?=
 =?utf-8?B?T2dVemZCVHJMVVJhQUIzWks0S1NPVnZTcGpyZXJnYk1DVlQ2dXFhcnNoZFJS?=
 =?utf-8?B?OGZPVS9HTGVxRXA2WTJlblhVb3dTSUFhb1B6dHB1cXZ2d0hVclVWejlSSjJl?=
 =?utf-8?B?U2ovZWtFK3JFNDRpRGJYeklkU1hieUkwUC9aazgxZXJTYnA1aGlGRVlkdG5E?=
 =?utf-8?B?UGIrL2VCOWphdDdQY2VBRFhSMmJ2YkFhREN6N2VqOVN0M09UbTRvR1Z3QWoy?=
 =?utf-8?B?U3g1MUt4d3VsK2drMEpyK1Y4S3VpTnlzTXhHUG1FZTZUVTYreS9VMlBmS2hL?=
 =?utf-8?B?NWZRS1h6NTV6UlV6aU42T0VKdkJwNVduUXlELy9DbzdiMkZJUHFPWmhQclk2?=
 =?utf-8?B?SjJrTDdUSnl0SG4vZHV1K2tQWFpleUJlMDhvalAyTW1xb202b0RtVE9FUzNk?=
 =?utf-8?B?K1h5SmRFTFZOR21GRW9FWEwwQ2ZtelBJSnNLWGNHaEs3RnFNUkpGRDRtekEx?=
 =?utf-8?B?NVE4MHRKU3VxdGRSdXM2a1dEc29rRFQ1bkM1VXhHbUZRVEFJaWhWbVl1VlpB?=
 =?utf-8?B?WXU4TGtiVVJTek5IZWs4SXlnL0hITUt3ZzdZSjJQcldJNkk3dEpqL0t6TFZq?=
 =?utf-8?B?SW9zWEpTbUlEUFNQTHMvUWg1Y2U3VHYzRTFjcW9lOEF0Mkt6M0twSUY1Q1dF?=
 =?utf-8?B?bi9yQUZTaTk5NU4vL3IwSmt0MHJzNUV3Z0I3RStLN3JiN3Q1cnQ5QUl3ektR?=
 =?utf-8?B?VEpucUxQNWFLeEJqMWVPTXFadUFmUklTeW9BSklOdHdFdmxRUFBST2JDcTdM?=
 =?utf-8?B?MXVvRXhXOUVHYXp5a21JYU15UTdnWHYzQW5KK21mRDNWcHk5S2R1MTRJb0Mz?=
 =?utf-8?B?eElLRUI4NWpaai9DUHlnNk1tQXkwcFJaNXpUbXQvVVFPZHdIZjJkcGtvMGln?=
 =?utf-8?B?WmxSZWxoZlRKM3oyaTU2K2RnR2ltU2IreFZrejVVQWFLOGMzcVVCTnd4Ukkz?=
 =?utf-8?B?RW5HaW83QVZwdyswanVvdFdKcTcvS0YzcU4xNEI3K2hJNGx3SUc2dEtRemZ0?=
 =?utf-8?B?cE9nbllGQVhCU1JPanY2UWZQNlBmYnNLWHBmMms3akljY0RwMWRyclVRd0dE?=
 =?utf-8?B?VTVTZFZXVTgvZVUvNktjbC9JeTc4OEc2cmRTd2FjemliREhpS1RPSHlZbExH?=
 =?utf-8?B?cmlPUDZlZlExK1E3YTVsQkl5RGVFN1psTFIvR2xqak1DakErcGo0M2xsRG9p?=
 =?utf-8?B?bjYybkppekFYTGZ2QnBzSmpUNXU0NUZ2b1d5Mm5xYjFvWGYxRlJ6S3NXTldr?=
 =?utf-8?B?ZkNmemRBdG1NTklKTzA5UHdFb0E3OXpHOWNldDZnUkx0YlBUYzExZXdCNmh1?=
 =?utf-8?B?YVBCdWJiZTBodnVpNjAvSnlZTytWUjY5bE1EMDd6ekliRG9DMTlTMnk3N0pr?=
 =?utf-8?B?WGtnOFVqU3ArRllIMzlxOVBRdDBUeUFsWGFGRWZaMklIUnBldFpjdExCTGVs?=
 =?utf-8?B?YjdkMktzTVhldGpZdkxPa0U4NzBaZ1dGL3lNWWdYSkdXNnhiTXMxZ3VHcnN3?=
 =?utf-8?B?ajlCQXFWdmJVQlVzOFVlOGJvemtsYndkYjY0WjhKdXF5UVV3d2h3TW1YWHdq?=
 =?utf-8?Q?UBfOO7e4RBpmd6TT3Rd2LYRB6GXZ2x5F?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF319104D5E5D340BFF201E4361C6492@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6e8bdb-d077-4b4d-ed33-08da074e9133
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 13:12:04.8945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4NbQosFz3/bC30TFc9WJdWlD1JcExxNqXeFB6J5R0S1EIkOkMpgUiTrhJGusLjpCjR4KA04uqyxaCRDeQk+8Dnj2yV4YcH/ua5d2dIGG2Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3306
X-OriginatorOrg: citrix.com

T24gMTYvMDMvMjAyMiAxMDo0NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZXNlIHdlcmUgbWlz
c2luZyB0aGUgc2l6ZS1pbmRpY2F0aW5nIHN1ZmZpeGVzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

