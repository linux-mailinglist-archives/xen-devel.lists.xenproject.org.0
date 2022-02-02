Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A7F4A7465
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 16:15:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264316.457375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHLa-0005rT-6e; Wed, 02 Feb 2022 15:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264316.457375; Wed, 02 Feb 2022 15:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHLa-0005oP-3Y; Wed, 02 Feb 2022 15:15:02 +0000
Received: by outflank-mailman (input) for mailman id 264316;
 Wed, 02 Feb 2022 15:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAZh=SR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFHLY-0005oJ-SJ
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 15:15:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e21ae6bb-843a-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 16:14:59 +0100 (CET)
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
X-Inumbo-ID: e21ae6bb-843a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643814899;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HgEdGVe4YFt/O82PFXP+0au2sF6rKSNyOnjwa/NZzLQ=;
  b=Lo6lKNHnkFT/S66PYUA/ReqruXTZzoMz6ruVl2svzxFIYZlOSC0cgE0m
   Pa0pTgXJVoitFmFib78Y2BLfnYY8CraFsUD5mvo4FnKLXHlwSmCdEF27N
   4yDXt/rKqib96NbLyJmVoibpSiagVeNXFkcdsH6BeCBWop45PxdD7+E4u
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pXzJWqyKZr+9btlBIQKiCgtLHrP5nA6RNQ6LmBipJSIXM+B3/N9l6A3gmkfQnhRsQvJ4EeGeIR
 FHyHgz+PIJ9u2N1XQombOsdWePP4/RRS7UoF/8uj5wiYKYkj+U/G2jIdHi1+Er4PTvlxz97qGk
 gGvqqjpdEYRNKLBPC33q888AdeRMsbTsJjeLu6GB5OsyzuJGgS2N/fPTaed4kJ7tc9HkMw+G20
 F2xAdpwNf+/T8Ebm3bU9HSo/1vnjxOKAhzxazk+2Mbj/g3Qu6YyOd2TQt2PFNmG/3nufFxrsJy
 9LX53Z3iHq443NV9ckQEgLWC
X-SBRS: 5.2
X-MesageID: 63333418
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nuvooaBRbnp0OhVW//Tkw5YqxClBgxIJ4kV8jS/XYbTApGgihj0Px
 mMXUGuCbqqKM2L3fot3bYW09kMDvpHdndY3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970Ug7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/timPsdtwl
 8505LeQTF0xY7fTt+E9akwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf6RvoQEhWdYasZmLaz6T
 uxJYCFUTw3tYx9LY1MJS5wStbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHAQxuWq3/bpSdNcPpVSfVn8h6iz4rttlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL/dlr5i8jWOqPB0JcYjfdPTjri
 w6HoyEl71n4pZ5ajv7rlbwrbt/Fm3QocuLXzlmGNo5GxlkgDGJAW2BPwQODhcus1K7DEjG8U
 IEswqByFtwmA5CXjzCqS+4QBryv7PvtGGSC3QUwQ8Bwpmn0pS7LkWVsDNZWfx8BDyr5UWWxP
 B+7Vf15uPe/w0dGnYcoOtnsWqzGPIDrFMj/V+C8Uza9SsMZSeNzxwk3PRT49zm0yCAEyPhjU
 b/GL5rEJStEWMxPkWrnL89AgORD7n1vmgvuqWXTkk7PPUy2PiDFEN/o8TKmM4gE0U9ziF6Er
 o8CZ5bWkEg3vS+XSnC/zLP/5GsidBATLZv3t9ZWZqiEJA9nE3smEPjf3fUqfIkNokifvr2Ql
 p1kckMHmlf5m1PdLgCGNiJqZL/1BM4tpnMnJy08e12v3iF7M4qo6a4ecboxfKUmq7M/naIlE
 aFddpXSGOlLRxTG5y8ZMcv3ort9eUn5ngmJJSekPmQyJsYyWwzT99b4VQLz7y1SXDGvvM4zr
 uT4hAPWSJYOXSp4C8PSZK79xl+9pyFFyulzQ1HJMp9Yf0C1qNpmLCn4j/kWJcAQKEqcmmvGh
 ljOWRpB/LvDuY449tXNlJuolYbxHrssBFdeEkna8a2yaXvQ8F28zNISS+2PZz3cCj/5of3we
 eVPwvjgG/Qbh1IW4ZFkGrNmwK9itdvio7hWklZtEHnRNgn5D7phJj+N3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOhaMOhz3fzfUpO0GrtiZ48Y2OXVhWIxTR2jdWK6F4Md99z
 Oos0CLMB9dTVvb+3g66sx1p
IronPort-HdrOrdr: A9a23:8BPSd63wMyLhm+szph5YRgqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W1Dk1frsA6ciYnV9MNOA4/e7rFNoXse2O7DIvAGyWvKEk4U0i92aIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.88,337,1635220800"; 
   d="scan'208";a="63333418"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+DMPe/VPiUR3obl3B3XVpjVY64uhO8IVK/Q9LLOrtIgIurcoR3hRpGfDvcWMhWbPhMTM7IUTK5p/ocYMOnTBwjS5tQtrhduWd1970U/6Ll9UhNE9b1Ysg8VuAxEWN6sRUypj/5mdasYlW2Hu6Lu/zT1mwwNbKWURtmiTWuRMqZAoCxdcW6sYCwL/kePuMaP+XmEqVDJi/HtEZ+vjR4zyPbqNg/KG/70T6f22bACDtEw9WpsI0KKT5SAs6wxOtZW2xEJmcIn8pSMXxTZIjIP4Nwc1o9jj3HoakfkTjyYIrZTpFoyam1A5tZTUILaOv8oo6D2dGcX9FC0B6mv9YQZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JtSTh7t3cVGnSGxaJCada0ZD+PemwdU4u58v5gELL0=;
 b=ezEr15apGXiUcy3QKMfBqoMzSxvGINzmhVpOMUptLpwiiIpVfo70ocGJper2tZF3lEe2wwEWRs4XY7TTdSak8UEGgObUwuXyR7rPREtwLaAZMwad4bWw+uPpEdLp2CvNkg+2lYDg3P7e4D1Trnk0FsqZzlxj6OEAmmSu9yLPc7OOpBe6MDm6H7v2pzFabjO+wekiFnlWALWdWT7p5pFZIQ9LuHqNwyMMd3qmnHYUxrqCegTxw1mkWkH4bFE4IrvqeuWbUhoJK9W+BOkYJ9IHClItxoL63q4SBQU/M8trnfqsu7tsMIXXDZt4aaiEJLpIaD7W6DyMCsJ7YiDpIrFzCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JtSTh7t3cVGnSGxaJCada0ZD+PemwdU4u58v5gELL0=;
 b=xClUHifQyUECki6b6QcpCjANZCq/AlfdnyMcpwEDFSVKPym/b7nuMv9SWpDdANc6hQ2YJD+D+/UedmtGrq4UMlU7js6VTMBYEHPjC1AM4hMQEuLug2aTXHRqFwfO3i3isazv+CzwKIyGs1xtLxtDAUaAX1dlEVvk7QOez9yeJQI=
Date: Wed, 2 Feb 2022 16:14:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v3 2/2] x86/mm: tidy XENMEM_{get,set}_pod_target handling
Message-ID: <Yfqf5jiO0cHjR6gR@Air-de-Roger>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <8cba4cd0-d218-da1b-dcea-4cc3047c0946@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8cba4cd0-d218-da1b-dcea-4cc3047c0946@suse.com>
X-ClientProxiedBy: LO2P265CA0268.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0d5515f-d7e0-4f8e-1147-08d9e65ec257
X-MS-TrafficTypeDiagnostic: BYAPR03MB4248:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB42481C1E6336CABF9FAB56B78F279@BYAPR03MB4248.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgObVhAc5Uml9MwwFIMKvHmBSPWIrV+/43nAYtSniaQ/NS6cGFwgShLssgPorGeynUHwX2W9BRcXL7IJ5R+UJtIjxUqVN3gJU7+GMOuIzOxl02UQNXrQCN72XGiklwBYDU4I0b0tO36SMY7EZ7Nn9pWltW6ltLeEhMGYELpmyOIqQ+VpdY9PGoh9sa6bcXFY6Yfft1m8/2U7BUmAT2fKgmveaqVlHma6nVcR5UEG9LnhxBmcFfm6IM8PsK2VZX47noGZw6YKPbDq7ejCfHAFO+3iIIdMU47FyTSs9i4U1rhhNfh6gwthhyaZ1rKdG056m5eL+q1A5iXOXaUx0vZCNFDSfSOzJnTqvIJ+M+/8KC73sQ01oqhdxVkpcnG9ADQyUpSHFgn+OgVIuLJEu5LJ0wuHvOj/QGNFSAl8rLTgxZ16YDu/YMoSRrS8QPEk/8PmdQC9JHASKng65adFOE/UR2H8Sw1v1LPXBSLT470WVdzLnrE65oFEx85rL3jjEeQ4cC43JY6JxosntE0Pvmvo1CDJgf8Zi56uK4WwyiHLgwf8XU4lKlRKbWPVpvhkCCE/aDiDGjDGy2rYC8JnuFsGcUtuwVdh1IosKKy3P6vwec6Y9tZER0coOJom+uUy0ayvr8sR6iKC4e7Hhx5SDuFmCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66476007)(8936002)(4326008)(6666004)(82960400001)(66946007)(8676002)(9686003)(54906003)(6506007)(86362001)(66556008)(6512007)(83380400001)(107886003)(6916009)(508600001)(85182001)(6486002)(2906002)(33716001)(4744005)(38100700002)(26005)(316002)(5660300002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlR5Y2M0aEpabUhabWhabWVpOCthazJyS3R5QVhhbUZ4c09HNGhBV0hlVXox?=
 =?utf-8?B?VlMzaXdWL1g4aE43UzhBaHptTnJmNzFhbnppNHNZRFBYQWtmZkRKOFVtb1E0?=
 =?utf-8?B?eE5rOERkakUzUG1qSGxoK080clAxSEthMjdVMjlnS2c2SzJERFpFQ1VlOHZT?=
 =?utf-8?B?Yjk1Z05JZ2dZb0hKSEtuUVdDNnpFTnNzbS80OWF1ODd4V09mVm1henhjU0RN?=
 =?utf-8?B?WWFMbENVeFNEeTJWeVpoQmZxR25lUDdRdGJOek9uRnBybzZqQncxSFdOdlVn?=
 =?utf-8?B?TmV6UlhRZTg2eSt0TUg2T1RpVmg5RmJvZHh6T2lCS1d6anZxRk9HK25jOHdn?=
 =?utf-8?B?Z3hEZ1R1R1JwVEs3S1JzRnFLTUxGMENtZ0lkcXM2TUJEMUtYdEt0Z1BOUEpn?=
 =?utf-8?B?NHd3MGNMZDJSYVFKL1hLQmlzRlBRS0Y5c0hTcU1Nc2dReWJNYTVWME5tVEc2?=
 =?utf-8?B?bzJJZlFCZmtNdXlQeWlOcU8zK25jdXpiWlRqZ0REM2JsTW92MTMwN3NoMlF4?=
 =?utf-8?B?eEhBa1NKdjBjTWZLaTFZUnBEMkJhdUYvdG5UTzFCeUNoQllacVEzeDBRUkM3?=
 =?utf-8?B?R1JpaFk1YmFxbUJ5ZUFNSVcwVGF5NHZhdithY0ViaVFVZHR3WVZ0TEhoNVNP?=
 =?utf-8?B?b0ZRS2FKUlN5L1BZaTBWcVdFUUYxN1M2ZlkwcTJjU0k5UTdwb3Q3dGxqSXh0?=
 =?utf-8?B?RWpvNlVPZEs1Qmt1eGV4ZEZoVXIzN2VNbk1wam0ybHlURmY3S2gvaS96TWdY?=
 =?utf-8?B?WVNoL1hDdXI0OW5jeUpJcSs3MDZ4ckZqSXBmQUpPeitZMjR6cVRYNDdXUlAz?=
 =?utf-8?B?R0dvUExsTmpIWEljcnFWSFZLa0NCa3NENGwraVhNcEZuMEJEb0l5WlAvb29N?=
 =?utf-8?B?N2VPS1MvSS9QMmYyRVZKMlA1eTFXMlJReXFudFFZWWdpRVBFNnJpWGJqM2Ix?=
 =?utf-8?B?dTM0VjRXZndIT1hNSDFlRzVVUG5BVk5oUGZodFYzaUtYTlRwb0hlY1cvUW1G?=
 =?utf-8?B?ekxSNzhaaHF6cDN3K2dJOFZIZ0dVNy9BcGdneEhuS3lvUVVFZU90aWRSRHBs?=
 =?utf-8?B?eWxFYjM5eW5tOGw0VUkvcjZXTHQwa040TDNVRjdOcHdtb09UejFhQnRTelli?=
 =?utf-8?B?YlVKTVhkOWk2ZFl1UWhlUE90Nm5tQzdQREFTeWg2S2Z3eHpqMlUyOUlnOTVY?=
 =?utf-8?B?Z3FreXR1REplWXBHVWV3SkU5VmZlTCtvV051SE1WSGRqRFprdEkwZDhjM1Ez?=
 =?utf-8?B?V0hWbWsvL2hoc2ZvZnMzY3RGaWV0SFNyamdMK2s4YXhiQjFNWkVidFFGKzdi?=
 =?utf-8?B?cFpmMHFsU2xLUm5NQ3lVQlA5SU1zZGlPUmZ2elY3UXM0V1RLZDJHWWRuREYr?=
 =?utf-8?B?NlN1L2hObkRBYnVwTHYvdkFvRGhRUVJEcHNnQ0lDRTR2NDRhaGNMOUpoOGVI?=
 =?utf-8?B?dDJqS3BvQjhSRVRnN1ZVTklMUUN0TEZ6UEVTODZFVm1pcGlFSmVpTTRESHpP?=
 =?utf-8?B?ZkZaeEVUMUlOMzBYbEJvZEZZOHVzcS9UWi9oYUJUYWdvdHNxQmZYdTQ0WG9V?=
 =?utf-8?B?YnBBaFA1VytJUDZkWmY4NWxuMjljZGNqTjJ4b2NTYzgwVnE4UkxlcFRrTEYr?=
 =?utf-8?B?TjUycEtqWDZaSGxHd0VESUVYbW9rbmZ3M1U1VGVRbXlPUm1IWHQrdXNhZG5F?=
 =?utf-8?B?ZE5HdXFFYWMydDZWVVBlR3ZpT3RkMjRYVWlEMUo2dkJnWG11eUFpWlA3QXFm?=
 =?utf-8?B?ZU9ReDdHNDJ1VDlLQkpLNlM5K2dZSDRRRXVoT2pOUjNtU1pwQkxRb2tsUHE2?=
 =?utf-8?B?VzMwUlFDVWlDdmZXSkRLYTRXb09FK01xOU40c244TjVkZTZBNEx2UEpxcEgv?=
 =?utf-8?B?L2xpTnQyMU9hemluOWF1V2kyNHlhSXlWOG5uaE1vaUZaZVFFeVZLM1MzdWQ2?=
 =?utf-8?B?M2pmZ3h2NTltbUdJOFdGQkNUbDdIaWtzSlpWdjdCbmxncjd4b1JCbE50Vm5o?=
 =?utf-8?B?VEpwUWFxQUxOQThXYTM5WHVVby9mVk9iV05yamQ1d1dDNWgvMXBzUllUbkJ1?=
 =?utf-8?B?dFNPTmFkZnBZRGN1cDY5a3NHVHdadnY2OEtuSGRORGhoRnBSY3hHNkozUHRR?=
 =?utf-8?B?ZXBxM0o1M0kyWVR3Y056Qi83VU9YcDZpUkRZUXY1S2VGTWlGZ3BEMTliM0ll?=
 =?utf-8?Q?XpztCLlfSi7fjYmI8GQTm8w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d5515f-d7e0-4f8e-1147-08d9e65ec257
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:14:51.2529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qb1l+Ro6Hg7yGLIEKkfjJqWA3Y8uON6fsdLwPG0xtGCQAjy6pmmhi8QA35yxyCtZQcEEd1OsNvTRSWr63w2vkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4248
X-OriginatorOrg: citrix.com

On Tue, Jan 04, 2022 at 10:41:53AM +0100, Jan Beulich wrote:
> Do away with the "pod_target_out_unlock" label. In particular by folding
> if()-s, the logic can be expressed with less code (and no goto-s) this
> way.
> 
> Limit scope of "p2m", constifying it at the same time.

Is this stale? I cannot find any reference to a p2m variable in the
chunks below.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Code LGTM, but commit message likely needs dropping of that last
sentence or the block using p2m needs to be adjusted.

Thanks, Roger.

