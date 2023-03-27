Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543116CA7DA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 16:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515306.798027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgnyY-0002vI-Rr; Mon, 27 Mar 2023 14:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515306.798027; Mon, 27 Mar 2023 14:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgnyY-0002sy-Ow; Mon, 27 Mar 2023 14:37:34 +0000
Received: by outflank-mailman (input) for mailman id 515306;
 Mon, 27 Mar 2023 14:37:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d31z=7T=citrix.com=prvs=4435eb1af=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pgnyW-0002ss-Bv
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 14:37:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e31dbb88-ccac-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 16:37:25 +0200 (CEST)
Received: from mail-dm3nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Mar 2023 10:37:25 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH8PR03MB7308.namprd03.prod.outlook.com (2603:10b6:510:254::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 14:37:22 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 14:37:21 +0000
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
X-Inumbo-ID: e31dbb88-ccac-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679927849;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t/JOudHH7PfVN3UFa6YiS0zewuuJ+wj/kCmjxPohUrk=;
  b=NMQL4A2BdHGyGsr5xZ2LbRK9fET+GHxUr8SlJTKr+6ln3HBuUyOMEAoR
   PGA+FDQ7uKyPBu3XKUokoxj5go1fi+32uDt3fnC0lnzfxo4k0YblcxAQD
   Ls83/Ykd6P2K0BRp9f4Wng/GpdT3tUaIECg5XWZ6l+PdGKiTV1vJPv+2J
   w=;
X-IronPort-RemoteIP: 104.47.56.45
X-IronPort-MID: 102923428
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7mKFhamqTWHmn1LThXqReEro5gxcJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDGqGaKmPNGbxeo9zadiz/UhXsZOHzNZnHARvqilnEiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gCGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eBEBDVQRQuGvdidxrame9VrnJhkAta+aevzulk4pd3YJdAPZMiZBonvvppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3jOWF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXmqAtlOTu3QGvhCrUPKwn0iDjAtZEbk+9m7sRCARehPJ
 BlBksYphe1onKCxdfH4Vge9qWSJvTYdXcRRCOww7AyRyqvS7B2dD2JCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BW0LYyMeXBYGy9bmqYA3yBnIS75LEqS4k9n0EjHY2
 C2RoW41gLB7pdEP/7W2+xbAmT3Em3TSZgs85wGSUmf+6Ap8PNShf9bwtQWd6utcJoGESFXHp
 GIDh8WV8OEJC9eKiTCJR+IOWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdkIiN2iDC+F6vo5RAI=
IronPort-HdrOrdr: A9a23:J/K5lqzfGKE3eDWqqvBFKrPw671zdoMgy1knxilNoRw8SL3/qy
 nOppQmPHrP4wr5N0tApTntAtjkfZq+z+8N3WByB8bbYOCOggLBQ+9fBOPZskbd8kbFh4pgPM
 lbAs9DIey1IGJWyeDdy2CDf+rIxuPszImYwd3z9TNGayZES49d1C9FKiC9VndbeWB9dPkEPa
 vZ6cpDqyChangMB/7XOlAOQ/LfodnGj7LKCCR2ZSIa1A==
X-IronPort-AV: E=Sophos;i="5.98,294,1673931600"; 
   d="scan'208";a="102923428"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXX+2MpLgR8jXEyzlexmWpLCznFAcizEKdDBbyta0c6RaU//xTLrgJhTNMroFHYOak8fbFqEaru64BNzyKTVGsXN4G4Xpc/AkrcuQdeuISkr//cy64nTWALGCi+tnlC8k17mcIOfnK6n8xAavdtz8L9hEmoOsbi1Iae94+2IS6R5FjYO5FXanYWM9pN4KFEQors+8hvM08TrELeWfFroSXyoA9x8jQHH9NtZTGNO3YKHrINvajlSIBjEmaZh01zbvCV5mp46/Sn0yEG4/Jy1umgkfzaihibThW4SAqzWZjiJvUK9Of8Hb8Xn0k6reet2CmTE4kvI50ckpy0JQmjD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4U/iOvc4GK2jeuldVJLiDqeVp/B957B7zqLJNBBoqg=;
 b=jy7bLrHC4j4JQ/FEKDzu8ygSFAp9CqMiwkWHBTIvfNg4o1wP1g9d3oTCmfy459WlxzupI8yfKVikpyln942ojxjHAulEpvyhprMrCmvTKFG9ESoyhTkOOL/3hrxEj+BOfS36SnjjTnyaBBep1DT0hOiHU7pISTT4n0DYYVJoKHs0U2/InAzjztZQ1qKtDE5D0rHT6shgg5u58iKgRTFrlOdog4FFOj8/ns/r8YJbpvQGFsBpm/GZJEZ53qQz4+0tedtVVIVc/mUUcifrvsG2MWE4kQOU07G/jpFXqTMFf/GrsK40sisOwN0muWcxNiuD/9S9IwUdeRCyYfsW/UT6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4U/iOvc4GK2jeuldVJLiDqeVp/B957B7zqLJNBBoqg=;
 b=GaACp2g8kihfu2Mna7PCLQwtxC7UR2PhjBWNkI0h6DwsRctm9UYCJsMyzZreAWYdUeiprKTuI8v7VA/DvHZey4mgBWTViRj/Z+JUPidpXk1cML016pfoyIJESogVv53VtUEIu2oxvdmIuGG74SDDeQcgqzxNh4zdQY9C4sv5g+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Mar 2023 16:37:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Message-ID: <ZCGqGwzxLdpGlB9D@Air-de-Roger>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <ZCFsDbKfGvn7giN+@Air-de-Roger>
 <ZCFvPTpOixe582JU@mail-itl>
 <ZCF1HX6Dp7mrm65l@Air-de-Roger>
 <ZCF/P22HaeZs4+To@mail-itl>
 <ZCGaU1sM/z3wJzJF@Air-de-Roger>
 <ZCGmPZcyWE2za+rw@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCGmPZcyWE2za+rw@mail-itl>
X-ClientProxiedBy: LO4P265CA0183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH8PR03MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b6c9eb7-aa4a-4f61-8efc-08db2ed0c5a6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZZ2wr23SizsewEIQYJ+yUZfB827sye0ncMcf4wGon566sBFuszF7WusZoQNdKcr2qosvei6kj+vwzLwXXe36zAFZAR/0O56MOBzqgfpQXWZxv3ibKcAK+J30VBpVRt2qaMcBafKB7eUMRmDaZUdN4Oeq7WPSI3pXCflcAyvrqXYZF2pldwKml7HKCAVgufILlEFBVV3KPaXJm6Z8x5XnReREax/XrANYBMP/ko3ZG2XB2ZdMP6WTE0kWoObm9UhmQNnQ+POgUuW3PUn/mgycvSI3ODb/54PeW6Yyk2tJVajsvHkGvjm17yBk1S7UysEfDYG3IZgoIIF4MFcffjA1sMilDIzXUb7+QUcPawoXQkMF2VS8k2NNz89W95nn82ZFSyBHclH067xp2lCE4RK0wQ15NRvW4YR53yd6WzqDWa07/R9E7gLV3RrLNavoFwyW7Alek66m+6nicGj+9X7yTP4nQuP+0P8kcvrYLmHgOr8xnDzorcJQOdmS6tr62zCB03pnCh0sfSm3d3t9eOW6LbXMRN/zzLQkktGJ6jz7igPYJZuic8nf/MAiiw0GOn26
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199021)(66899021)(83380400001)(2906002)(66574015)(85182001)(316002)(9686003)(6666004)(5660300002)(54906003)(6486002)(8936002)(66946007)(478600001)(4326008)(6512007)(66556008)(8676002)(41300700001)(186003)(6916009)(38100700002)(33716001)(82960400001)(6506007)(26005)(66476007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjFJaWhmQ0dOQUJxMmJ3b1ZTM2d6eU8rT05qbXY5YWdiMmpjQzV6dmxJUXp1?=
 =?utf-8?B?TVVUMzRsQk42bzJLZ3hsc1NudnZtRlZKWm1CSzRjL0ZkVkhOdnpOcXJRMDNL?=
 =?utf-8?B?Yi8xRmxGN25FSWp6ZGlKVG9nbFBVaHNJVDg4ck8zcmZ6OUxMTDFzNGE0d29l?=
 =?utf-8?B?dGFnLzJKL09xR2FqUDU3U1Q5RWJPMEpVR05kVUpHU3IwUEdOd3hLc2s2ZmZN?=
 =?utf-8?B?N2lVSTI1ZFJVRm5qMDdIMzNjTWNacGhURjFHald6bm9mRjlTTm4zczJKQUhj?=
 =?utf-8?B?dDFjQlVkV1VBUXV1dTVKS1oxWmYrSUxQZjY3Nzc1akUyNExHcm1EUDIwR1Jt?=
 =?utf-8?B?ZW96KzZBbFdxYnpFOXZTZm9ZRzVkdm56SVlva2FEaFQvWld6c2ZReS8xcGQ3?=
 =?utf-8?B?Sk5qK0lkWm5sUldDV1hFRU51WHR0TEw5UVR4WmF1ekdqRjQwVUZOUHlNOFZU?=
 =?utf-8?B?RnBoUlhKdHZCSDBXcWRjVTNvaU5yK0hreVA3UU5ZOVJHbEYyNktoOGl0b3lH?=
 =?utf-8?B?LzBnQTdMa0FseVNseUFaWnkyTWE2MmlhUVRDRHJsdkJyYnVZNDBwM0FuTGZQ?=
 =?utf-8?B?VHRqKytZU05qV0tFNkNsb3hoU3BsTjNhR2FJdGw4ell0NC9ZZjIwQ054eDhY?=
 =?utf-8?B?b1NiZkVDaXB2V2hON01mRHZJUVFsMjdBY09OL2F6dHpUamJUcmN4Q3VRb0NK?=
 =?utf-8?B?eFVvZjZuMGRjeUh4UEpxRnR6dEcwenpnNzFPSUw5NjZ0RDA5MkpwaXlxVE9k?=
 =?utf-8?B?eUFMVnJMM2hMNnFJSUJ2SUdVTFd1ckRRZ0FsZk12Vzh5enlZbi9NUUs5VndT?=
 =?utf-8?B?bkQ0OS9QME0zajdWOUdQMVFVNlQ5L0U4cHlQOFI5d3RvQzhSRlhPTmdTem5J?=
 =?utf-8?B?UTUwUnJpRWNyK3BGbFMyaC9ZMGxCd3pTODc3RjZ1RmtEd2l0a1NwaDRnRnZr?=
 =?utf-8?B?ak9XM2IwWjFLZlFid2R2cnhTRXJPcEJSRlQ4NTlGWjhpaWJXYWhJMUp4VEt2?=
 =?utf-8?B?MTR5Wms4cmJlV200UlAyRkVpeDBlQ1IvTXZmTjcwOWFMVTN6Zkk5M0FKZ0xH?=
 =?utf-8?B?WlUxa2JEamt0eHNZMnRpZ3c4Y0VGclBLcWZmNmpSTmNxU3dMVGcyVC8xT2lF?=
 =?utf-8?B?MXhzbTZ1NDZqTkpoRFhjbmpTSHNCTnoxclNYNVFnOG44dWpwdHdDdDM5QWlP?=
 =?utf-8?B?Sjk3UUdYanN2WHNnRHo1QnAxekl2Z2xCVzdFYnE5STlsRjRMUzM4RmYvUElk?=
 =?utf-8?B?NDBmK1lkSnVHd3RxRWJoZi9WVTZuS0NCRjBrVTRVMkpwZ0hDaFUrZ1g1RzFW?=
 =?utf-8?B?NzdnQTQzTFpDMkJaQ0tQTHdLWlpwYmQ5Sk9TRUoxYzl4eXVEQ21sS2lLS2lI?=
 =?utf-8?B?bWh4ZlozTUxRN0VVRHQvWndkS2FMYVRaWHNkWmkyYXFUWjhjNXpQTVkxTlFH?=
 =?utf-8?B?VVRVNnV3L244cGRPS0xmd25KbmorcEVJQzgrYk1USW1lUzVCbElqVHhrTlg2?=
 =?utf-8?B?M3oyVytsdlIvampnTmhldTZzTUMyamgvWDVWdkJLbS85aU1ObjI3WjhSS2c3?=
 =?utf-8?B?cTNvN2JtbUIzMTh2TFZnSlRLQkZYS3VyUXRTeXZBTTdkZG02c09ZQnB1ZlY0?=
 =?utf-8?B?SWFiRUJmOUVOUDdCeUhZUkVCSDM3dk9IeThPRFh2NEJLWXBodWU2djMwYk5q?=
 =?utf-8?B?NElFNXpFamt2anFndTdDeG45TWVEejg1SkV4a0dQa2c1Mm9OcWlkT3pwMXNI?=
 =?utf-8?B?dE90TlpGVGgxU0Y2Z081MDhvbGN3eVk2ZGpUdEJCRzgxVHBZakIzYUZ3UlNu?=
 =?utf-8?B?Y2FGeTZFY2RkSU0zS0s0eVlvRzR2bXpjeGlFR2xLR2QrVHk2UFlUbjVpNE5T?=
 =?utf-8?B?V1o0M3R1MC9lNHQwQ3RieXZIRGJlcXFDUTVGMGFxMTEvbzNDQ0NDcU5idm5w?=
 =?utf-8?B?NTNpNEtKc0VKdWhqYU5wT20yREV4c2Q1RWo0ZzVhckpNb0l5YmFhOG5EVzYr?=
 =?utf-8?B?V05UbzFjb3Q2NGVUTHkvY0FDRmtLQUlPK3lDK2VrZXh3N0lqcURPTkdWS1hW?=
 =?utf-8?B?SFoveUQ1Q3BqWHBrbTQrWm12dTBQNEhXT3diRnFPYXYyWCtzMGs3ZUxKWTJU?=
 =?utf-8?Q?3XTPHsStdBeygv5UwEm2LRsYr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Jk/XW3oM82SGE5Py+yA5ZbF6PeNmoxNTu7JlUGpko8iSmfLJ7IIGENREpfIjofKH7TuisGHksNB/IMO75Xw8QpDZAKEcP7YJclebQG0Uqfib/oraieoFfaRSdABA//QeCtFXXxk4BfoEZi3kBJ3WzQXrjsGIjHvI6wPK4uibLkJ2JPt40xH1frsTZHtLTIHUFQSsosfacC/G+DmLKLBkKjiiBjLnpuskLL6wMIIDaYMI54Jph9Gfpxv8aS8dGi4nfnys0c7U9AgzMstl0VeMUSrlMsXBq5XiM1VydSN+0Q09q6Ths/te57V2xMTqfrtitwEBr6eHh6tXzjtXP8slbn0kXap9rJIfxb1qBGHXpG9Y5hLrZKLJ9NMI8+D7wW5AwaMihSCRIxqN2CYtn6ScYS0ONpsAvJhJEMyHygu9gJtwQDvvAoPZX4B+muursCARM0i667kPr9To0M+C0g26XD+i3y9RxOmINN+f66fJWqsSWEchAvGE1/ZVm38u1mHPVLNdxIzavMwEjV+FXeC5FWJOJHxwr7Ri17aQ6j+MWNzkY9ExzcY7O0wn3Xxyg15AI4tzLDd3AnVd+GhkuC9vsIv0HGn/idSI3B8hxbyGt3r+2sZsaQSt4WcLoDPvo2wniN42hKFuq+x+iwg6F2W8YRNopuRzuhg06PBcegm/CpoCgnFgHgX78pEAfjm2AoPrNgxQWDPXgYmSFiIrCMc2JWfhioN8bsEcsBrjobbSctg4LJFMhV+eigGyNU9Enmpb112lQb7HPKyYKxBlGxYNh7DXBc5oWPALQ83d4fBqu8LLMW7EDhcnN3spNuBe0vckimzGno2UQr01X2YlFYy83QBSFFcvFEQ1YdZSwnORNtIHgXNGhGKuypt60RuRf9uhn4skzAhKnIXl33e+G9UfWPpYPQ8wSQ1EvmUV5192jV8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6c9eb7-aa4a-4f61-8efc-08db2ed0c5a6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 14:37:21.0609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xleBxpHmbP+sgMnOW42/LdQDAVs9cbUXRDF674Wgd7C6eYDuR2sLTq62wPCCyete6oWWxsYHECw9xcv6E6DgOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7308

On Mon, Mar 27, 2023 at 04:20:45PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 27, 2023 at 03:29:55PM +0200, Roger Pau Monné wrote:
> > On Mon, Mar 27, 2023 at 01:34:23PM +0200, Marek Marczykowski-Górecki wrote:
> > > On Mon, Mar 27, 2023 at 12:51:09PM +0200, Roger Pau Monné wrote:
> > > > On Mon, Mar 27, 2023 at 12:26:05PM +0200, Marek Marczykowski-Górecki wrote:
> > > > > On Mon, Mar 27, 2023 at 12:12:29PM +0200, Roger Pau Monné wrote:
> > > > > > On Sat, Mar 25, 2023 at 03:49:22AM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > QEMU needs to know whether clearing maskbit of a vector is really
> > > > > > > clearing, or was already cleared before. Currently Xen sends only
> > > > > > > clearing that bit to the device model, but not setting it, so QEMU
> > > > > > > cannot detect it. Because of that, QEMU is working this around by
> > > > > > > checking via /dev/mem, but that isn't the proper approach.
> > > > > > > 
> > > > > > > Give all necessary information to QEMU by passing all ctrl writes,
> > > > > > > including masking a vector. This does include forwarding also writes
> > > > > > > that did not change the value, but as tested on both Linux (6.1.12) and
> > > > > > > Windows (10 pro), they don't do excessive writes of unchanged values
> > > > > > > (Windows seems to clear maskbit in some cases twice, but not more).
> > > > > > 
> > > > > > Since we passthrough all the accesses to the device model, is the
> > > > > > handling in Xen still required?  It might be worth to also expose any
> > > > > > interfaces needed to the device model so all the functionality done by
> > > > > > the msixtbl_mmio_ops hooks could be done by QEMU, since we end up
> > > > > > passing the accesses anyway.
> > > > > 
> > > > > This was discussed on v1 already. Such QEMU would need to be able to do
> > > > > the actual write. If it's running in stubdomain, it would hit the exact
> > > > > issue again (page mapped R/O to it). In fact, that might be an issue for
> > > > > dom0 too (I haven't checked).
> > > > 
> > > > Oh, sorry, likely missed that discussion, as I don't recall this.
> > > > 
> > > > Maybe we need an hypercall for QEMU to notify the masking/unmasking to
> > > > Xen?  As any change on the other fields is already handled by QEMU.
> > > > 
> > > > > I guess that could use my subpage RO feature I just posted then, but it
> > > > > would still mean intercepting the write twice (not a performance issue
> > > > > really here, but rather convoluted handling in total).
> > > > 
> > > > Yes, that does seem way too convoluted.
> > > > 
> > > > > > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > > > > > ---
> > > > > > > v2:
> > > > > > >  - passthrough quad writes to emulator too (Jan)
> > > > > > >  - (ab)use len==0 for write len=4 completion (Jan), but add descriptive
> > > > > > >    #define for this magic value
> > > > > > > 
> > > > > > > This behavior change needs to be surfaced to the device model somehow,
> > > > > > > so it knows whether it can rely on it. I'm open for suggestions.
> > > > > > 
> > > > > > Maybe exposed in XEN_DMOP_get_ioreq_server_info?
> > > 
> > > Make flags IN/OUT parameter (and not reuse the same bits)? Or introduce
> > > new field?
> > 
> > I think it would be fine to make it IN/OUT, but see below.
> > 
> > > > > > 
> > > > > > But I wonder whether it shouldn't be the other way arround, the device
> > > > > > model tells Xen it doesn't need to handle any MSI-X accesses because
> > > > > > QEMU will take care of it, likely using a new flag in
> > > > > > XEN_DMOP_create_ioreq_server or maybe in XEN_DOMCTL_bind_pt_irq as
> > > > > > part of the gflags, but then we would need to assert that the flag is
> > > > > > passed for all MSI-X interrupts bound from that device to the same
> > > > > > domain.
> > > > > 
> > > > > Is is safe thing to do? I mean, doesn't Xen need to guard access to
> > > > > MSI-X configuration to assure its safety, especially if no interrupt
> > > > > remapping is there? It probably doesn't matter for qemu in dom0 case,
> > > > > but both with deprivileged qemu and stubdom, it might matter.
> > > > 
> > > > Right - QEMU shouldn't write directly to the MSI-X table using
> > > > /dev/mem, but instead use an hypercall to notify Xen of the
> > > > {un,}masking of the MSI-X table entry.  I think that would allow us to
> > > > safely get rid of the extra logic in Xen to deal with MSI-X table
> > > > accesses.
> > > 
> > > But the purpose of this series is to give guest (or QEMU) more write
> > > access to the MSI-X page, not less.
> > 
> > Right, but there are two independent issues here: one is the
> > propagation of the MSIX entry mask state to the device model, the
> > other is allowing guest accesses to MMIO regions adjacent to the MSIX
> > table.
> > 
> > > If it wouldn't be this Intel AX
> > > wifi, indeed we could translate everything to hypercalls in QEMU and not
> > > worry about special handlers in Xen at all. But unfortunately, we do
> > > need to handle writes to the same page outside of the MSI-X structures
> > > and QEMU can't be trusted with properly filtering them (and otherwise
> > > given full write access to the page).
> > 
> > Indeed, but IMO it would be helpful if we could avoid this split
> > handling of MSIX entries, where Xen handles entry mask/unmask, and
> > QEMU handles entry setup.  It makes the handling logic very
> > complicated, and more likely to be buggy (as you have probably
> > discovered).
> > 
> > Having QEMU always handle accesses to the MSI-X table would make
> > things simpler, and we could get rid of a huge amount of logic and
> > entry tracking in msixtbl_mmio_ops.
> > 
> > Then, we would only need to detect where an access falls into the same
> > page as the MSI-X (or PBA() tables, but outside of those, and forward
> > it to the underlying hardware, but that's a fairly simple piece of
> > logic, and completely detached from all the MSI-X entry tracking that
> > Xen currently does.
> > 
> > > So, while I agree translating {un,}masking individual vectors to
> > > hypercalls could simplify MSI-X handling in general, I don't think it
> > > helps in this particular case. That said, such simplification would
> > > involve:
> > > 1. Exposing the capability in Xen to the qemu
> > > (XEN_DMOP_get_ioreq_server_info sounds reasonable).
> > > 2. QEMU notifying Xen it will handle masking too, somehow.
> > 
> > I think it's possible we could get away with adding a new flag bit to
> > xen_domctl_bind_pt_irq, like: XEN_DOMCTL_VMSI_X86_MASK_HANDLING that
> > would tell Xen that QEMU will handle the mask bit for this entry.
> 
> Technically, for Xen to not care about those writes, it would need to
> observe this flag on all vectors, including those not mapped yet. In
> practice though, I think it might be okay to say device model should set
> XEN_DOMCTL_VMSI_X86_MASK_HANDLING flag consistently (either on none of
> them, or all of them), and Xen can rely on it (if one vector has
> XEN_DOMCTL_VMSI_X86_MASK_HANDLING, then assume all of them will have
> it).

I agree.  I would just return -EINVAL if the flag is not consistent
across vectors on the same device.

> > QEMU using this flag should be prepared to handle the mask bit, but if
> > Xen doesn't know the flag it will keep processing the mask bit.
> > 
> > > 3. QEMU using xc_domain_update_msi_irq and XEN_DOMCTL_VMSI_X86_UNMASKED
> > > to update Xen about the mask state too.
> > > 4. Xen no longer interpreting writes to mask bit, but still intercepting
> > > them to passthorugh those outside of MSI-X structures (the other patch
> > > in the series). But the handler would still need to stay, to keep
> > > working with older QEMU versions.
> > 
> > Xen would need to intercept writes to the page(s) containing the MSI-X
> > table in any case, but the logic is much simpler if it just needs to
> > decide whether the accesses fall inside of the table region, and thus
> > needs to be forwarded to the device model, or fails outside of it and
> > needs to be propagated to the real address.
> > 
> > While true that we won't be able to remove the code that partially
> > handles MSIX entries for guests in Xen, it would be unused for newer
> > versions of QEMU, hopefully making the handling far more consistent as
> > the logic will be entirely in QEMU rather than split between Xen and
> > QEMU.
> 
> In fact, it was easier for me to register a separate ioreq server for
> writes outside of the MSI-X table. But I'm afraid the current one would
> need to stay registered (just not accepting writes).

(I assume in the paragraph above you should use hvm_io_handler rather
than ioreq server, as ioreqs are only for emulation running outside of
Xen)

The handle is currently registered when a device with MSIX is assigned
to an HVM domain.  I think it's fine to leave as-is as long as the
handler doesn't accept any accesses if QEMU does handle the mask bit.
We can always see later about not registering it.

Thanks, Roger.

