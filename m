Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515344B02B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 16:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224025.387062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSqa-0004xr-8u; Tue, 09 Nov 2021 15:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224025.387062; Tue, 09 Nov 2021 15:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSqa-0004vO-5e; Tue, 09 Nov 2021 15:15:40 +0000
Received: by outflank-mailman (input) for mailman id 224025;
 Tue, 09 Nov 2021 15:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azzv=P4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mkSqY-0004vI-2L
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 15:15:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3020378-416f-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 16:15:36 +0100 (CET)
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
X-Inumbo-ID: e3020378-416f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636470936;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Bcjri57atFZBp/+ifGojycw2ZCKYgjK1tc42FKfQLE8=;
  b=J1f2Vx3c8TEjIc1rHQ3o3gTkuxf/O8aWjq8Y/cTOy4U+Oz45jKT1IEtc
   7vyePFyD1wJi46f4T4Y1kWvbfkqpY3mRa77USwYYebbz5cSGtRPkMQNO7
   HLmDl8XQbc+JPzVq03uukarSExbL3mu7la3qZ1GvLZeGUNxAUdmjjvsFy
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bqyN6sKQRKQGceD3TntbwXkHST77c6mOSIIars39hEnfV29tmPJcr+s1iIPMu++sFz7lsUvEWN
 lAG1FCWXARDujHe5xRb7Co5zO0Q2Bukf4Z/FtR2md9kSZexKga5T4hIddNJ7h9/XsSX0AoPwYR
 /nn3rKdaSc1fvDTQFL9JpLjqiRRhHFkoFK7BMJCk9uoblXf/1HAn9Pcj9p8beFte/Tu8iKHyfZ
 FwpbW5GNvBaGksVAGlaKR5LsU4yF8BnuesRQJBA30ueZYKykHcqI0t3p0IpePEEua2SU1UkwLp
 jIKZqp6t/EdiArtCYnRMcbmW
X-SBRS: 5.1
X-MesageID: 57437871
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q+KfpKipUv1mN8IX/bhIqOmuX161IxYKZh0ujC45NGQN5FlHY01je
 htvXDvXa/yLMzOkfotxaI6x9kNQuMKExtU2SAtp+HsyQ3wb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cw0IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /12nsW0FAQgZpfrwtkXbRsJEgtQB7JZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2ZwVQqaBP
 qL1bxJwZx2RWBJBGG4tDagGgOyKtnvSLT5h/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcIMJHby79/gvjFiS2nYCIAwfU1e2sb+jlyaWW9VZJ
 F0E+yMGpK075kutCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc3Wj4Cx
 lKPh8nuBzFkrPuSU3313rWJqTK/PwAFIGlEYjULJSMH6dT+pIA4jjrUU81uVqWyi7XI9SrYm
 m7Q6nJk3vNK0JBNh/7TEU37byyEnbOQSlM2713teTiY5D17NY+PSba39g2OhRpfF7qxQl6Et
 XkCvsGR6uESEJ2A/BCwrPUx8KKBvKjcbmCF6bJ7N9x4rmn2pSb/FWxFyGgmfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKFDvEMJGPxf4M4XRfK4Ey/xX1
 XCzK5fEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlebgDfMLFit/3e+W05F
 uqz0ePQln2zt8WkM0HqHXM7dwhWfRDX+7iv86S7idJv0iI5QTp8Wpc9MJsqepB/nrQ9qws71
 irVZ6Os83Km3SevAVzTMhhLMeqzNb4i/SNTFXF9Zj6Ahil8CbtDGY9CLvPbi5F8r7c9pRO1J
 tFYE/i97gNnFm6apm9DNMal9+SPtn2D3GqzAsZsWxBmF7ZITA3V4N70OAzp8SgFFC2sssUi5
 ban02vmrVArHWyO1e7aN6CiyU2fp38YlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVsT69h8Hr9nwLgQ/dzqo7MGnA1oEG+SNwagC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcfVN3YP6C2PcYnijpwc40eEiqtjVq+LenUFlJO0XegiJqM7YoYpgux
 v0suZBK5lXn2AYqKNuPkgtd63+Ici4bS6wiu5wXXN3rhw4sxg0QaJDQEHarspSGatEKOUg2O
 D6EwqHFgu0ElEbFdnMyE1nL3PZc2stS6EwbkgdaKgTbgMfBi982wAZVoGY+QQlixxla1/5+Z
 zpwPEpvKKTSpzpliaCvhYx3992t0PFBxnHM9g==
IronPort-HdrOrdr: A9a23:6eUtU6HJuK8JhQQlpLqFDJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo6j3zEnrv5an854Ed3AUV0gK1XYeNu/0KDwTeOEQbqBJaK
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfKla9CC4kY1jiaWgOKsk8SgfwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.87,220,1631592000"; 
   d="scan'208";a="57437871"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHmubYf91dFSILjcgPxXZdJnKEaKkBXDtgnvAGxMolIQ5Jm1X2YJ/AeWorpBZeyVr/W3KaxsIJQEkoMHH17AYM9zUK7DRIySdf8+1UORXdV/xCpmtMbZVSzmwGSr1hIwGLB+17ZEdur8KLPNH1swbkSZeVqGVonaiPOpzdZnxyKTOzYubaFsKddZ5RHbDCpt5AYym9hnYn3x2gdZp+UdAZCstj9aC34C4UMwJVHcLRDNseva4bU9El7xOTfdgjb+wdMppKiqrrpL0pYpl9OMq7GPGnWSWgiv+w0L0cFXtJDwPz6HaEOck234CKq+kI7MLN+uhageWh5Moor7De2k2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2kMCwwT4JmgyKttHt6v6srMtRRgrhPUgjJRAtqeu9g=;
 b=OHmdLnmFs5L29aNavn0TPpbCOXGVTbFLLuktV6rwvnKWkmF5HQCV/gCUSaIiw3Lhf2atGioGDpJgVv77ojUEPqKV3zLRw3Oy/gnnsps1KcGK7lsea9q8KGJiI/d1RcGV2cT8332hoW0tuptxGa6jx41tNlGl4ieFkWDobLbRi0+EuPXe9GtnmYONWH6XIkJ4MP5w5MVUZS2ozBw/7ToGyPYUfaicY8Kc3O2K7qcy38Pm+S6wGbexiVuEStMQWiCpjaYNY8A7Kif/LAtqhLC/2Wtzcm2qhs9SDYbf9DyNRiTygcBzlu9ZLCZ9889AjDZXaRYRhdqtUenzA4VPBgCVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2kMCwwT4JmgyKttHt6v6srMtRRgrhPUgjJRAtqeu9g=;
 b=PNob2Ej5/hYbzCNAsOkUZ+yu1Tlc9D9KrP/rSD2HgNqAL64TB7lkF8BQ+PXM+VYohixxKnvKiyveyXBG0PxjMGGdAr2qQGsWSK6PAoMTyc5GlzoHvkVD7LbxWrmoQEMwhEFEAHYzcvbyQ6Se7CTseIz187dKxcbg38ciS+iXAYc=
Date: Tue, 9 Nov 2021 16:15:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Hongyan Xia
	<hongyxia@amazon.com>, Dmitry Isaikin <isaikin-dmitry@yandex.ru>
Subject: Re: [PATCH for-4.16] Revert "domctl: improve locking during domain
 destruction"
Message-ID: <YYqQjMuARXwG4/yW@Air-de-Roger>
References: <20211109143128.56089-1-roger.pau@citrix.com>
 <24970.36376.658415.956968@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24970.36376.658415.956968@mariner.uk.xensource.com>
X-ClientProxiedBy: MR1P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09e43d24-872e-4da5-12b7-08d9a393c4f4
X-MS-TrafficTypeDiagnostic: DM6PR03MB4396:
X-Microsoft-Antispam-PRVS: <DM6PR03MB439650A20EFD0E586B72D50A8F929@DM6PR03MB4396.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ztvlih6b3ovoDiXwXQC5g9YxR9BUXJ/3UibgV0+kJiv1cISOpym3b+/ZI0FNeP6ZJ2DYjitymbfPYFQLaMXCl1EmO9e/22/oXBPmP4AkLx6M6D4PLgz7DP4+l8xJ4Irgcz0g8K+xi+ZgWG2b+r2kA/AtfcWSoYM7tC33ti+msmq1EjPm6Q2nyfW1mL/boGH9qW/Eyg7Yx15KeCleCds6U78B+UqCVqtTxhjft53RoFPIpPYgkp5S7EZn/FRQ1BnDdD0DCfG5D9J01LBIsAblxvKUZqjwOoBgGxON7OY//udHGky7FLM3LJXLPRsrGaRw4R3X+H1UBdp8Lx61fN21qpo9qWO8C9z4Dz4RpYIkxIOeqCTJQDLq/mH+Ja2IH4ZvufGWxlqZBgzuFJZDbqGac3xhmAwk5V8gSlkbyGFCiVwL0A6diEMKefqst1CUtumfU0lg3If0Zit6gG6y43dW6+L0aUpPnsHcDBadSi0cTUOb0wMU+A8VxEA/5k7OhImeKHoLqkGUtKTtQheqlmMeHKMhJTfr97EEh5VDJREsVKxVmhAc6SJdc7tZMkYa73NU5Lx52fstJB6b5+Eb0I+ZjaMmlYdw6Fj5RZemp3QWPMT/SbPuwE056kiUe8kA00VPtCRMr5xPuVo+GPXXwh5bbUtxRNjBsrj7Yp/K/3/WdzVGEK3KdRZ+EGV203AdL5LyL+Ein57hs6aLT82/MHGofYloI4R+Z5jGBcs3Hax+flkQR21qSToJN/H7fWK5HQAgv0WZNeEGLpekIo//V/+sYX/MoogwSu2fBcNIUsIwRKyW0pWxNt7wtwDDbYb7H49PS166MVWHrya6KTp7QbeeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(86362001)(85182001)(66556008)(5660300002)(66946007)(8936002)(966005)(8676002)(9686003)(316002)(508600001)(54906003)(83380400001)(82960400001)(38100700002)(2906002)(956004)(186003)(26005)(66476007)(4326008)(6486002)(33716001)(6666004)(6496006)(6916009)(23180200003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEFpRjY1R1ZLMWJjVzQ4Uk1hQWZwQjRmMnNuUFhkZGMyaWZVZEdSZGZHekJm?=
 =?utf-8?B?cHlHMlFKNlFUcGIwcDh1Q0dFVWRWdkhBSjZDeTRGbXlMdE9VTm9jNk5iWTdq?=
 =?utf-8?B?Ui8yeGpQeElNR1k5RHY2bTlKSkU0OS9Wd29QTUplR0F4eVYzVmY0SkYwQk9F?=
 =?utf-8?B?K1JyZGpmR3p2L2N6M0JxMVNMcldqVlF2cXIrdFBhcFdhZWYvTEtZZXM2NG0y?=
 =?utf-8?B?aFpXYVFzNzExOVRKdEpBbi9qT1FPSWxBellVejNjWHJXb1pFQmwwQkZ5alVp?=
 =?utf-8?B?ZTZMc0lscGE3RlRVY25yNHRRTzl6RFpybkEwRW9GN2ZmRVRudlA4bWNjQVNl?=
 =?utf-8?B?RG9xVXFwNzBMOXMyNkZQeE5FeDFWZGJuYUs0aXBXTTFZd1FNMUVYYWdacDlX?=
 =?utf-8?B?YTk0a0JzZlYyOWNOazZuN1VFVVZlZTlIT1dDblU5VWRCa3BNUE9jdlg0NTh1?=
 =?utf-8?B?WVpJb0VqelQ1eFppUTNOd2dlcFVka3pkdm0vcy9DMHpIK3ZZc00vZUJodlhE?=
 =?utf-8?B?bzFoaXpWd2dKczBXUkpkNE5zenRNblRPQTF4L3lVTTEzZUtQMjAyeXhjQURn?=
 =?utf-8?B?NDl0QTRBQTA5OHFSaVU3am4zbTlXS3VFcFJybWxZUlRiSlpqZXZTYVVYYWhQ?=
 =?utf-8?B?TkRTN3h0ZzF5OTVxNnBsOEhqa3JCU1ZkSUUrMmpkK1c1ZVZJYWplZVQweElw?=
 =?utf-8?B?L0V0M2c0cG15Z1piN3V4T3RvVGZCSFBsTjR3NUdMcDIxeTl5bksrZ3ltZWVi?=
 =?utf-8?B?NEpWRzlUZGQxSXZGNzFEOW5ydGlXaTRodHFBZXFxZ0RhQ2dXNnNrZmZFWnlq?=
 =?utf-8?B?MjFMWmhvOERvVlkvTVNJbnMxays2b1NRYTVKcVoxK0pCZjZOaG0yNkRtS21M?=
 =?utf-8?B?ays4SXE0d3pOQjJxdmNCVFdqRVNqWFdJZnVzRVZVRDlZdzBmN2UvbHlSd253?=
 =?utf-8?B?UlU5eW01QU4vb2swNFp2Z3Z3VkdJL0lrSUlkZHdSSTc0WnNleWJWc0M1dy9z?=
 =?utf-8?B?eXpwRFMzY0lBUFFGcDFjd2E0YzNlSmJiY3B2bVFTcXdwSWIrUXRFYzRzWGl0?=
 =?utf-8?B?MzFNR1I5UWVrVWI4ZW9Yd3ZsRys4dTZtbWYrOENIRmpoM3htN3pkUzVvd2FD?=
 =?utf-8?B?VVRiVVB1QVZEWUV2TmdhTndsQlRtNlFzTVMvem5KN0poR3dnQnFqbStWTDgy?=
 =?utf-8?B?OWE0RE12OHJYcHU4RXpNS3dabGRyU2ZoYTgyYkdEdXd5RkpRSFFaaU1mUlpI?=
 =?utf-8?B?a2hvR3IxRnk3V3pyZE9MeXJFaFVkV29KczJmd2NtRjZwL3RXSkk4NWdGbStW?=
 =?utf-8?B?cWlOeENrVDZ0UlZxRXUrS28xUHk5MkZrWHVRUVFZaXBQaXkrMlJJQ2I3akRS?=
 =?utf-8?B?dXRBbFV2OEplOTZkOTNGTTNpUE5manBib0x5ZCs3b0ZZc25YcndkbGRUR3B6?=
 =?utf-8?B?MWFTNWpBNVJZZkdKcHQzNFJscWZ1OGNqTVJMWFBKcHkvdmVwU2hNVHozS3Fo?=
 =?utf-8?B?cEtKVDNFbEpCMWQ3ZW5QbS9rY2U1andXWDFPNEdLeEFBSVFhZC9oK3YrRTll?=
 =?utf-8?B?SnEzZTFERWZEWUorZ0hub21IdWRTdzJIa0dRSjFmZWVlRklhWTZWNkNSY28x?=
 =?utf-8?B?RnhoWExTSmtnU25jNXJ3ZlhScjFxemFvY2oyYmxJUzRlRlJyZzgvNWhGaXVk?=
 =?utf-8?B?L0EzdVJUdDludEEwR3hqOXN3bklIOHlmTlE2MWwxMXU5Z0RYdzdoeTNoeWJa?=
 =?utf-8?B?YVl5aXFyWm1CTkU4ellvcWdGSVhYU3N6SkVRalJlbXBNdW9TOEwzdGEvMS9S?=
 =?utf-8?B?ei9CUUVIazM1MmdpZ3NTTVRNU2NPMk10bDVNUXdGR1dhTUFIRGI1YUFpL01q?=
 =?utf-8?B?RDVuRUVLZzhJL1VMZ01UaTVDb3RZN3U1RDlyTmpSdWMwelNRL2xjNS9GY0U5?=
 =?utf-8?B?VDVzdXh4RUxlci9UZldZSXBFTW95RmlnazNsOXhMM1A2NEg2eUM3MGlvYklw?=
 =?utf-8?B?MXp6MXQ5QnE1K1pzUkR6dzNiOUJ1djhkRnlxTnlZMVdwSkdvTG1OT3NGTnMw?=
 =?utf-8?B?R2tBdSttblBJVXdHRS94YUdQeDdLa2tSYkV1bndVcmpwcHQ5SGQ3OHFYcm5G?=
 =?utf-8?B?bThWb1hoTGxhVkUrcnhiL1dwS1ZWbE9Tc0Mzb1krK1oyVGwxUWttY0NuRjNI?=
 =?utf-8?Q?gqp1mNzxZCocm6VNMiVfcAw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e43d24-872e-4da5-12b7-08d9a393c4f4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 15:15:31.1427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNgMNJ1VAuaTtuz2POU/exBKXXZvrWvz17Jk/14gnlublaSWdg53l9XrJJJ8l2C5bHglZkZFfiiWNcZ49xFfVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4396
X-OriginatorOrg: citrix.com

On Tue, Nov 09, 2021 at 03:04:56PM +0000, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH for-4.16] Revert "domctl: improve locking during domain destruction""):
> > This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.
> > 
> > Performance analysis has shown that dropping the domctl lock during
> > domain destruction greatly increases the contention in the heap_lock,
> > thus making parallel destruction of domains slower.
> ...
> > Given the current point in the release, revert the commit and
> > reinstate holding the domctl lock during domain destruction. Further
> > work should be done in order to re-add more fine grained locking to
> > the domain destruction path once a proper solution to avoid the
> > heap_lock contention is found.
> > ---
> ...
> > Since this is a revert and not new code I think the risk is lower.
> > There's however some risk, as the original commit was from 2017, and
> > hence the surrounding code has changed a bit. It's also a possibility
> > that some other parts of the domain destruction code now rely on this
> > more fine grained locking. Local tests however haven't shown issues.
> 
> From a release management point of view I don't regard this as the
> kind of "revert" that ought to get any kind of special consideration.
> The tree has been like this since 2017 and Xen 4.11 and many changes
> have been happened since.
> 
> So I am going to treat this as an effectively new change.
> 
> AIUI it is a proposal to improve performance, not a bugfix.  Was this
> change posted (or, proposed on-list) before the Xen 4.16 Last Posting
> Date (24th of September) ?  Even if it was, it would need a freeze
> exception.

It was posted here:

https://lore.kernel.org/xen-devel/de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com/

Which was missing a spin_barrier, and in a different form here:

https://lore.kernel.org/xen-devel/2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru/

Thanks, Roger.

