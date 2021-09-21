Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C4D4130B0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 11:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191595.341676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSbxH-00066c-TB; Tue, 21 Sep 2021 09:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191595.341676; Tue, 21 Sep 2021 09:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSbxH-00063d-Pr; Tue, 21 Sep 2021 09:20:47 +0000
Received: by outflank-mailman (input) for mailman id 191595;
 Tue, 21 Sep 2021 09:20:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/tM=OL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSbxG-00063X-9R
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 09:20:46 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a142143b-1ac9-4c25-9624-9f2b8565b884;
 Tue, 21 Sep 2021 09:20:44 +0000 (UTC)
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
X-Inumbo-ID: a142143b-1ac9-4c25-9624-9f2b8565b884
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632216044;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bpeOjIBrupabDN+FdD3y+xN/an7SLfG3FXIiQScb2a8=;
  b=SlB8A/FOwQZez3wg6+Jjv1oe+9fsl++db4XIQYvQ3Tir1rp58vIMlcZD
   nfdhbOeGz8roODtvlv4PhxbWvqY9S4mzZgkjNI6rHyf95XJ3J3dBO9eRS
   4m3PD6xYlbTnDOEUfy+LdH2tWH4rAly13qXfqt25atA49wKCsyzDeFJ2P
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /qXoLdOR4W/wHl2Rb1URGAWa7o5FsW6irWPgfOKMTKpDv8fyrHOMs/aA/ZYmyb6lx9tETI27E4
 w5ssWk9Qhv/7aBZm0xQ4PrkaaxUL4S6uPB3LcC6PUNttaJI3I6VorTToZoOj4aSEHmezXE+OlO
 QVpONEyhTilBpE9BnQGrMqxBHkfLnBU4jTrFuEEgz8Ckgvs3PPLDhm6MeaGW0mtGojwFF2qSlr
 sy6IhFC5b8UHqVQQxG/D/LHrio3XSuJywa6RAULYMhIXLhEpltKravnTIuEVAmPXz+nc0NcpC8
 luBe/JoX+NyoWNXEMGQYIdNf
X-SBRS: 5.1
X-MesageID: 54994351
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PKlmnq9+P5hMspkFoe7bDrUDbnmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 mFLD23Ub/nZM2akLt0ia4zn9RkHupODyoViSQc/rS48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79j29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhqm
 MsVlLKUTjwQEYjQp9oYQhh7NyNxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgGZh2psTRJ4yY
 eInRxVVVxribyZgP2g3Eb4hgde2hlPwJmgwRFW9+vNsvjm7IBZK+LrwNNvYfPSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoNEJWo+/gsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLV/ASxFmUCViRGatEtqIkxXzNC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBXRSe3clYy8C2ODMhZ0MsBfeT/VHEqHg27UZBgrML
 yC2QDkW3utI1J5QhvTjpzgrkBr3+cOYFVddChH/Gzv/t1InPtbNi5mAtACDhcusOrp1WbVoU
 JIsoMGY8OlGJpWEjiXlrA4lTezxuqrt3NExhzdS83gdG9aFoCXLkWN4umgWyKJV3iEsI2SBX
 aMrkVkNjKK/xVPzBUONX25UNyjN5fO6fekJq9iONoYeCnSPXFbfoUmCmnJ8L0iyyRNxwMnTy
 L+wcNq2DGZyNEiU5GPtHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBhVMiq9JQIJrDcSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74lxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:gt9ZBqvNCa9X2umRZCbHrxmX7skC54Mji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLnAbV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1EtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqZmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87ysIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXoHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1nackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMG9yV0qp/FWH/ebcG0jaRny9Mww/U42uonZrdUlCvgglLJd1pAZGyHo/I6M0rt
 gsfJ4Y0o2n46ctHNZA7dw6MLmK41r2MGTx2VKpUCfa/Z48SgfwQr7Mkf4IDbKRCdY1JKVbou
 W3bLofjx9qR37T
X-IronPort-AV: E=Sophos;i="5.85,310,1624334400"; 
   d="scan'208";a="54994351"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2GYZiNqZzwKRKQITxpa7xdO/P3pive+DVQf5is9vL5ud2nUj/rDIHxvRgP5OIXiEnJRupNHUOICh7j3G2/NYZrT/CKPQBKIr9rMB+MBhA/DXxaiJcHxw1A11FhAQd6tjgQ1LqEvxKxVVcQ3yA+cossEQsKYLCYpGeuVseSNkVhBMVVxLSpUCgMHik5h+X4klTlD3l8RhNh3tptbWX+gSkjxu9/LSbtqmKbH5hOo2dNV7bNJNP48uE9y93krCzyjVve6FI0vMSNK/q4Lso5Q01rdMgUJpQ48BNfRFJmhRqphCmImTT4AxtZadU4fTsIq1JJhiPCo+G5HmL6fZCy+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Mw9V19GYeYg80+2iPoM1iFhfs5y4YO6kDw5nFI2ANSE=;
 b=No+3L/sNjSdimnLZDlpJeTmoSWfOm+hkaCYqR+4Ww4K7osQcW8iJAv+DC/XtA1N6HNgGR7+fONd98pdvQS9OfWeRq+kZjkRrv0sFdPETkIn0nwMy5Fj8ptu46zgqCsUfW2AUBMSuAzDtA7XhbIbBgRyEchexECjlkdvnTMOC16hChXECv133in+KTpDagj5XYARcxadYDYD63l7i4I7l60v8iOY2j5h7gZcRgO9HJLjsxRAqX69eBzRpwjbf9PhXrQO2v4a9oq8EV3PO+4oCvvqkCMf+WpofY+ZMJMRQde5IBJJW+ENu/sOj0d5dgLu4SwUc9hB0CXp1dm39Vdbyeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mw9V19GYeYg80+2iPoM1iFhfs5y4YO6kDw5nFI2ANSE=;
 b=kUqKESlP9eefIfBV4MIiFyctieTZ+BFozAtlUG6b8NHo109D89bzxIUGkYBmAQKpnzxmkAAPlqXhTw5vNhwHKDHfRjriAtsCRcE9OoFJvkwehLfAGmjoDV6wjxkpynMHfik1lVIfbEP/VBUwc90/sn0wx6wsilDoDirZ4W+Am4A=
Date: Tue, 21 Sep 2021 11:20:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] common: guest_physmap_add_page()'s return value needs
 checking
Message-ID: <YUmj3P3j6f5Gl/xh@MacBook-Air-de-Roger.local>
References: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
X-ClientProxiedBy: LO4P123CA0284.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db9ffc52-37ef-484a-8d75-08d97ce110e5
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3370E17DC5D2E041270C8C278FA19@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zEkHvyodOkIoeeLPCW+hzibYu9L946FDG7sU0I01Y1Fh9IsQMBcKlDokHETP1ZYs9A7Z7551yphyKF9hrow3lj7Un2vmarbxFwcZMLiGHqVxHDrUPw8kx92czRge5BSdrlC9yDUw3k4BrLtvJsd5ccACBv8oRonashq+idFB4yVBpybOUMvXLxQEWNbzDOn2zY692l4A+edHICUvSnaHue5yAq26Ws2bGVZ98+T6ha6ide7U5xoXwMNcDBRvaMhKR87nCuylpsfNRDL+BT1YoRa/N7eSHF91Dp0Cice020MAquc9ydr+D6hKP0/LMzi83PgaTD8Ddc2eZ43bpm3RFsMxAzySZfcw1pV12J3tjttRhvI/lZsbUS7KdlIhWmLwjmR4AKjDKdosPQKpdeWZ1VSyyYYHDuFPZqiG383yWY6hHZB5ExmTn5ATyGShBoUqMFJgg5gyOHRbk+MT1gcfzn4DhApYip9W1FlLnZmnhFM29Mk7hnC+1/NSz9qJn2rxFCIJxbOlTAbyoC9V1ZA6kXAHxA9pLGFMXl++1299tfD21iWwAaVn8iHhvef5lXALbzfjI/DaR4AHqRhiHp6TfAd4jgLCy3btz58kdjvsjXOrtZodcvFicI04nCUU/4RbCf5iKl1YTjlEHdsdcjxd3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(66476007)(186003)(6496006)(83380400001)(6666004)(8676002)(8936002)(54906003)(66556008)(6486002)(5660300002)(66946007)(316002)(2906002)(956004)(86362001)(4326008)(85182001)(9686003)(508600001)(38100700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2k1NzFYN092Zmg3c0ViSnM5SzZEQXh4b0RFN2tkSXpNWlpwRENNUm0va1hh?=
 =?utf-8?B?WWl0UFlaODgxS284RUNIbmlnKzVkeHNFNDRsM3ZEQ1BPTlJ4TGdXSUkrQkMz?=
 =?utf-8?B?STN1Y2RTMEg3ek91dXRYR2ZTcmdoVERvWEdQSkJNMXNUZzQ5c2Nyd2JzZkpN?=
 =?utf-8?B?TlliR0w1eDlGY3VmY1dYTS9vWnhGNGtlSmk2ZmhZbUQySDBqSGEvcTVlUSs1?=
 =?utf-8?B?QzVYZ1p2ZWc0MzFrVGIxQVc4TU55OXVtM0RkdW5Ua0Znd1lCVU1wSVFTZzRv?=
 =?utf-8?B?RUM3OEh5QzFDeUNFWTdaSndDK1dleHBuOUkyc1hsYkdUcjI5OWxwOTdKS2ha?=
 =?utf-8?B?bkxhajY1VUV3enl3dWVMbVZSZXRiTmlnWkxXQ1ZaN0xCWDZ2OTFVcThENGM4?=
 =?utf-8?B?Z3VleFErc2crQXh3Y0oxN0NQcVJybityV0k5Z3VST0RvQUh6UmswWUZvYUN1?=
 =?utf-8?B?WXgyVUZMdEdWY2diT2dZZGxOWEJ4R3FTUUQ2VzhIaUFEL2pWSWlSbTNsRXBt?=
 =?utf-8?B?RElHMjVENUxpU3lYYmkrUTRoTlg5MENSYktIbkJLYTVqQXJkZE12WEE4eEZJ?=
 =?utf-8?B?QzFDMTkwTVB0QXNJbU5Ray9zellDcDB2dmZsK1RDdWlsOTlIeVI4RG91REVH?=
 =?utf-8?B?eUFmOURUUWZSMmRTSGlBUlJPcVlwTFVaQVp0ZWpQZ3RSeEYveWJCdEFmSk1S?=
 =?utf-8?B?TzUzVS9EYzl5VGgxQWtVazhpS0ZSOExsZXAxaTdLMkk1U29zWVpocENTZkxt?=
 =?utf-8?B?eDhUQnZwNmlrMytxNStLMmljcEtTWTJnTCszSzNRQmtRd2lsTFdIU3dlSzVz?=
 =?utf-8?B?ZVZkdGpPWVovWjBSUmdjZGR0cjhOT3F1Vlc0alhuZ1NONzNFeHoxNW9Gd3I1?=
 =?utf-8?B?bldsZlp3Nm1EWnY4Q1pObFdGbE83Yk00NzRzdDY3K0EybEkyQ1hrRFZud015?=
 =?utf-8?B?ME9xRGhjc3FOZ1JvUFp0eDNaNWJ5RGt4b2xOMTBqd2J5UGlyeWRhalhnNmZC?=
 =?utf-8?B?S2tHanY5ZnhvK1dpTHpReVcweGdTTFVVVHZoR3B6RFlaUHcwUmduR2hZQXlr?=
 =?utf-8?B?K2RwNWFkYTMzQkFwTFlGZXlHQnE2MVJDd21sOHU5Ui80M3FFL2hoRHJ4MG0z?=
 =?utf-8?B?cUlRT1RoaUVrYTVITkp5QUtPMHIzR1gzdkV6ZnFpd0NxTzZZTUFUcHRCRmFm?=
 =?utf-8?B?ODQ1bndoZ0FySHhNbVJFUzkvY1RCaWQ1ZGh3ZVJOTUFCTlZtekZIVngzRUtX?=
 =?utf-8?B?RjJiUEszQVRXYmpkRnVmNFBHdDFKRkFxa1VWajFJZ1hvRS9RS1hCaXRNRUVv?=
 =?utf-8?B?YURBZmhWN2d1cGYxR1dMaXc4UTJSWEZ3TkpaSk5qQTdIRDFBUnZDZDc5SHQv?=
 =?utf-8?B?R0V6SGoxSFF1Y1RFam1VSVdLRG53MHpWQXpjanROeVVJTXJTc2lQYXlWZzZQ?=
 =?utf-8?B?TWhNeCtUOGZxSUxmZ0xXR3NkRVVQK2NaTHBDNStBSC9PZXZmWnhvNzJMQkEy?=
 =?utf-8?B?UjBCYzZsWUJQbkt2ZDh1MUZwOEZ2V1Z6OEdwM05qZ1Q4T05sMFNORnJVOTVW?=
 =?utf-8?B?RVFVdUNGRlM3d2Izc1dwajZDSEVWVjdCSEdoWWdnNml1ZE1zWUdoWVM1WUo0?=
 =?utf-8?B?ODF0ZUlYUm5wMUtYUW5XNjZQVXRMU0xpVTE2OTRjaldwUHh4VmQ4Z2tpU1VW?=
 =?utf-8?B?aitoZ0x0Q041aENxSk9XSGJEaCsxODRUUXNjcEVYS2xjenI1TlBzY3RWK0hU?=
 =?utf-8?Q?TTAp2vEKnj41PHeFsjrwgnfUsoMrxlerVeeMB7p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db9ffc52-37ef-484a-8d75-08d97ce110e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 09:20:34.4134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7aDDYz55WhUcQd6+TvL/UsQRiuLY6zWSKi0DEzAYU+We+K3ag3XQ0+sql7r6v1gqWeeR+HPZtNLyqZRfyXzIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Wed, Sep 01, 2021 at 06:06:37PM +0200, Jan Beulich wrote:
> The function may fail; it is not correct to indicate "success" in this
> case up the call stack. Mark the function must-check to prove all
> cases have been caught (and no new ones will get introduced).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Just a couple of comments, as we now handle errors in some placs where
we didn't before.

> ---
> In the grant-transfer case it is not really clear to me whether we can
> stick to setting GTF_transfer_completed in the error case. Since a guest
> may spin-wait for the flag to become set, simply not setting the flag is
> not an option either. I was wondering whether we may want to slightly
> alter (extend) the ABI and allow for a GTF_transfer_committed ->
> GTF_transfer_completed transition (i.e. clearing GTF_transfer_committed
> at the same time as setting GTF_transfer_completed).
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -2394,7 +2394,7 @@ gnttab_transfer(
>          {
>              grant_entry_v1_t *sha = &shared_entry_v1(e->grant_table, gop.ref);
>  
> -            guest_physmap_add_page(e, _gfn(sha->frame), mfn, 0);
> +            rc = guest_physmap_add_page(e, _gfn(sha->frame), mfn, 0);
>              if ( !paging_mode_translate(e) )
>                  sha->frame = mfn_x(mfn);
>          }
> @@ -2402,7 +2402,7 @@ gnttab_transfer(
>          {
>              grant_entry_v2_t *sha = &shared_entry_v2(e->grant_table, gop.ref);
>  
> -            guest_physmap_add_page(e, _gfn(sha->full_page.frame), mfn, 0);
> +            rc = guest_physmap_add_page(e, _gfn(sha->full_page.frame), mfn, 0);
>              if ( !paging_mode_translate(e) )
>                  sha->full_page.frame = mfn_x(mfn);

Is it fine to set the frame even if updating the physmap failed?

>          }
> @@ -2415,7 +2415,7 @@ gnttab_transfer(
>  
>          rcu_unlock_domain(e);
>  
> -        gop.status = GNTST_okay;
> +        gop.status = rc ? GNTST_general_error : GNTST_okay;
>  
>      copyback:
>          if ( unlikely(__copy_field_to_guest(uop, &gop, status)) )
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -268,7 +268,8 @@ static void populate_physmap(struct memo
>                  mfn = page_to_mfn(page);
>              }
>  
> -            guest_physmap_add_page(d, _gfn(gpfn), mfn, a->extent_order);
> +            if ( guest_physmap_add_page(d, _gfn(gpfn), mfn, a->extent_order) )
> +                goto out;
>  
>              if ( !paging_mode_translate(d) &&
>                   /* Inform the domain of the new page's machine address. */
> @@ -765,8 +766,8 @@ static long memory_exchange(XEN_GUEST_HA
>              }
>  
>              mfn = page_to_mfn(page);
> -            guest_physmap_add_page(d, _gfn(gpfn), mfn,
> -                                   exch.out.extent_order);
> +            rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
> +                                        exch.out.extent_order) ?: rc;
>              if ( !paging_mode_translate(d) &&
>                   __copy_mfn_to_guest_offset(exch.out.extent_start,

Would it be worth it setting the mfn on the guest output to
INVALID_MFN or some such if the physmap addition failed?

Thanks, Roger.

