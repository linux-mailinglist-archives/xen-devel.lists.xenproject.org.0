Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3994D03CE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:15:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286257.485704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRG1D-0001Pc-DZ; Mon, 07 Mar 2022 16:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286257.485704; Mon, 07 Mar 2022 16:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRG1D-0001NZ-9X; Mon, 07 Mar 2022 16:15:31 +0000
Received: by outflank-mailman (input) for mailman id 286257;
 Mon, 07 Mar 2022 16:15:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRG1B-0001NT-UU
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:15:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccd7f925-9e31-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 17:15:28 +0100 (CET)
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
X-Inumbo-ID: ccd7f925-9e31-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646669728;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Km/3q68rw2JH7gSLpeViXaUZ7XTJ4dNuvIHVdXeI1Mc=;
  b=IHyN2fWWaJMcOIQp5NBiWO46CjI1J58KuRnphzJnpilZhcXHXXc5BSOr
   UQR6nq5CMUI6M4jjIXrTGLDQLqDjUpsXpPS2HEy/WVNMXGfpwVV2+2WGN
   GLfAvZjg7K1SkBcfvq5OjFw9Ziov6ktW/upda493QMnUjMtsYkBmKAfV3
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65560131
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4GpiEq9V7S+OIkJVIrzWDrUDn36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mVOUTuDbvaPa2akKdl2b9nk/EJQu5XTm9BhSgtspCo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZuZDlk0G4nJof4QeT52NXBsLKZo3JaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4TQKiGP
 pFAAdZpRFPjUgNoEVQSM7lgrt6BrFalLwxSlU3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9QvnWIMJUryjsPcyhEaUwEQcDRQXUR2wpvzRoky0Vs9bK
 kcU0jEztqV0/0uuJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S6eLy9aUxtlbeU8ueURaxp7x
 E6CsffAUGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lo0EuRE48L/Lqdy4SsRGqum
 2ziQD0W2u1L5fPnwZlX6rwub9iEgpHSBjA46QzMNo5OxlMoPdX1D2BEBLWy0BqhEGp7ZgTb1
 JTns5LHhAzrMX1qvHbRKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJWG0M
 RGL5lgBtMM70J6WgUhfOd7ZNijX5fK4SYSNug78NLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuKHMCT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZIdQFadSVgXMuuwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:ObI5cK3uEwK7z6crx8DUowqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXyOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mOryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idgrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amGazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCR2B9vSyLaU5nlhBgu/DT1NU5DXStuA3Jy9/B96gIm0kyQlCAjtY4idnRpzuNId3AL3Z
 WADk1SrsA8ciYnV9MMOA4/e7rENoXse2O7DIvAGyWvKEk4U0i93qIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65560131"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vhlu8zUNwSvb06bdZTw/OGmWPJ+llISCLJMp00gPdET3BZ7MAmSxw1Fn0xBRZoFFmenzkoFd8XRM4zD6lzs4xlyN8aTwFvCKgEf7+sunfdyv1x3oabKUT97f1/FkTSAkSFMnaSuC8faS+HYtXUqq3ICsnieHOKEcc7kl/FLNEmPIQx73jM9Y18uT7eED30C5KLjVa8qmaPnRGQOqGguFcbjVDSehzUY0IHqvHA53VPKvdIOlkLlAPJZOlhTNNx8phLRP0uLi6p+BI4ccuw+mI20ROeINmEg2kn0xtonTZB22LJprmGYFsXoLXZMHV/VCFk/ptcbRO/u+ikZicFkF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a+UhMJ/OFCFj36MDwfJR7NkceoAv1d/Lp9Zg/v2CUk=;
 b=MX4f9Fp1iF5hfGhaakr0lQj6U7FCQ+KprG5YDzriE6SBy/sMszn9hlZEPL1FAjkll8+eeW5FrUAYAtkWZdXVrJv73PjXAmFTXkVfj1sPDQBYsnTouqWQAwj2Hkg4A/Z6o3Xetn2Fl984u9q1Ioujq/WEaB2iLyTtpIOwPbXCcsnJL53JL9kJ2/nzdOeDCDk+1vvcKHSXoZ7P9adbMEqIeeaztNfSf4KJ+H33aml45+fCt1J6jFjRnzHfOIx6t5gmaMBKSbFQJJ8ZOzXnksD8wPRYc6MFyKefhQyFIPSkdClGuD+RfV27c4z/nlkLf3L08/HRFUFK/b/EpPY+efGfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5a+UhMJ/OFCFj36MDwfJR7NkceoAv1d/Lp9Zg/v2CUk=;
 b=r2fWVkr3CFLqQTL7FGgGQKiBYrhAG5+gsydXdqTfkKTZdLnvisMWyXentOMCmMKtPYKKB/2Hef+Hev4hX0ocPVAY9PCvDTi3xSio7DXpYZ6hPGTPPBmjnvgvQzKbAmPREKR6tDigMnWLl6+dqKNpkS26QFGZSnaJA2U/sbnQXZA=
Date: Mon, 7 Mar 2022 17:15:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] vpci/msix: fix PBA accesses
Message-ID: <YiYvltzDBzPCHzFx@Air-de-Roger>
References: <20220307125347.71814-1-roger.pau@citrix.com>
 <1480fa5d-bcee-e945-6b2f-9db7931c63af@suse.com>
 <YiYtoxcpi/KalGqg@Air-de-Roger>
 <62bc3030-496a-5d33-9278-614350df94d1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62bc3030-496a-5d33-9278-614350df94d1@suse.com>
X-ClientProxiedBy: LO2P265CA0381.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cefa20b-a0b1-4625-60d4-08da0055af0d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6875:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6875A8C95E31127C31E4F2B78F089@SJ0PR03MB6875.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PYNX32h7+491E+v5sRUlL0ucYVgRDsfTWHVNNDnjpDw4poI/YfjBL9zKV+vbkQNURjLqV9Q2Tlo+JFvsNevCy5rpbGOUQDSnPi4CvWR9xIZ7pUfwAStc10vVsk6Ftiur/7jrY5vHQv4h61emckJ9rzP6dmkbQkOBQDT/y464GaJj9O+623amZuVkctAo3+QQiScrWzW2UpeLA+yxO//WelC2C77/+q2q6Ujy8zEE5FwPNcqFLKc79+GAajj1o74nxrpWw221tl0xkUozxU1+6M0OvrCtakSDCukasg1wqa//kqeZGwmqbjWDcCP7G5YoxqxOFZrTqqh+hR2O2XyAAM6OT7/G19/SfGTNnzx8XZ/durp0SkPqjOwl5+3AKJRWeXUAhY4WIubJ3wL7wrhxj5QIpd225MyS4XLqidmclh/gju4sEWTVgIhcCXBIj4e1G4GHtQeULxcM/+FNSd0pqF5yJcgDTx+95K3tObTKHOL2DSI8fPuI0owePb9GFU0LekrlT+FkhG6EZKc4jdBJG16e4X79cti3P/TINlrdV/2M0nzE+768AJAzylBdtZvbcUvd0UteN2v/Uwywc50z6TlCwInn3BK1mbo4SQ9XLXCRlBAC/V9DZAKgQxWA+Kt7GTxqIsqGpPXONKvKXI1MQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(6486002)(5660300002)(9686003)(6512007)(316002)(53546011)(6666004)(6506007)(6916009)(85182001)(508600001)(86362001)(83380400001)(186003)(26005)(33716001)(66476007)(8676002)(66556008)(66946007)(4326008)(2906002)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXZ5Q1dsaEh1c1JhT3NENHlhZThxZk56VWt0ejB2WEFzeko0bHZvclpuRVlL?=
 =?utf-8?B?RVNQRm1XZnk4eDBZOGJRNVgrZHhrTmFLRmJDdnI5TzVzNFdOUDdpbTZncFYr?=
 =?utf-8?B?OFo1Wkk0c0F5ekJ3emhDRmJYUklqb0Z4RW1PalZGUEg3UzF0TGZPUWlPaG5k?=
 =?utf-8?B?VytZL3VWNEpWR2cxd0wrVTlIUy81QTkvK00zcWdYa0drVnhDa0hjdnlqcUVC?=
 =?utf-8?B?aktyV3ByZnZ0djQzSWZJeDJadnNGbkFTQ0ZaWmtNcmFWeDMyMUdWZ0R5UkVC?=
 =?utf-8?B?RFZtenZKLzRRdTVHSEpPSm1ZamNGclJlam5YTURaZ0lCaGZhZDFSRlZDS0xs?=
 =?utf-8?B?QStCS0RTM1JwTEtCVkVoMjVjSUk3M1luMmJYcXNiSGZVaUhMY1orZHZvZFVi?=
 =?utf-8?B?cVh5NUpKSWRjNDh6R1lLeWtmcUpIVXJFSzlXcTZQajVuYWsxcVh6NnpocWlJ?=
 =?utf-8?B?YkUzT3F4Q2xwRDhjc3FtYmk5c01mTTBXRHNnOFRtYThadWlxRGl6QXNtQW5x?=
 =?utf-8?B?RVJEWUpJbWFNTkQzVXJKMWFKdGlFWFhtYjk4T2VHR3l3TG51OGtyMEh4TE9u?=
 =?utf-8?B?U3VmcGxac09pOXlKUlQ4cHp0cTI4bXp0YVgxQVVvdFc0U2laUWowVVRPY1Jr?=
 =?utf-8?B?ekZFYlh4ekMyK25jaWNSbDNnWlVPbDRQTmhwYm9zQVNsS3Z2bGZyZEVxUnRt?=
 =?utf-8?B?UWsvTnRaeWgwcWt5QW0zQ0ZTTGZrTGRXL1dOZXZpcnVQYk1GNWRkdkUzbFRo?=
 =?utf-8?B?ajFGSFk2bDU5Sm5Da29EVzF0NTlKY2hLcFltbnlMT3J6R1d6ZGp3OUYxL0w0?=
 =?utf-8?B?ZFpEZ0NsdFRpemdseVFreEw4YjlBekMzdTA0ZVVpTktBLyszOUhLZzNuSmFp?=
 =?utf-8?B?bFpKTS9qT2JleGgycGhJSjVRV0RXWWVNWm9kT291eWVaUmhORko4dkpQTTVt?=
 =?utf-8?B?YlZuL1NLM1RmWm1CMG1BWDRoM0dKblk1bi9oaU1QOEJTbUNWa0xOYlVRUndO?=
 =?utf-8?B?V3BwQzJXeTd5QWZYb0FleFE0ZmtBMHVYWVZaN3dBRjNlWHBBanVSclcvZG1z?=
 =?utf-8?B?UTcvRzlMaXVPQ2tmQ0ZDVE8zbHVPMW9vallkOHhqODRIRUJCeE1tSjVacXBa?=
 =?utf-8?B?dFJML1liclRpdUxxSFNrcUZuakUxdXF6d1dHUFBwbzhGMTJXLzBzc01HQ1Bl?=
 =?utf-8?B?a2NheVZ4UzJqbVhsVTlPdUdPdnpoaURINWtLN05iZVNlVlJFRmNyMFE2SjFj?=
 =?utf-8?B?Y3R2bVFQOFppYjBOQkJBL3NyRmdtUzhvSXhYMWZQUGI5eis1aGpmRU5MdWdO?=
 =?utf-8?B?N0RNT2hMY3d2ME9xNDhZaElINkZ6Yzl4OFVSOVI4Z0pxK2t6R0xvcXkwbUMx?=
 =?utf-8?B?c0JWa01RQXptZ29GUmZKcTFKTTE3M1lmSXgxTUV6dlNLVVRrZG9EZDlaM01t?=
 =?utf-8?B?V2lrNXZBeG80djFRc3ZtNHc4RklvWXFJRXh4Mk4ydEVxYVpSMzBuS2ZQN3A3?=
 =?utf-8?B?TUZEMW9jVWdGdFFmOGlFbFFYaW5pUGFORGJoaXhzT0o4bnRpQ1d0b0FZdnMw?=
 =?utf-8?B?ejAzT3hXM05raW9qUWlSTXBKQzBHUWo5U3NlOXI3OHZVcTVKVDNkaXJjeW14?=
 =?utf-8?B?dGlpZnY5R2cxbTFkVm8zRFBuRHlvODIza1ZwZGoyY2hoK0NpaVhhZUt5N0k2?=
 =?utf-8?B?STdZYXp5a29zZmpobnk2ZzZ1clU4M2xDQXdGOWV5T0RDZEkyTHBIMzhLYWto?=
 =?utf-8?B?VjMvWmxDRDVCejJ4Nkt6Wmw3M0c4YTVVOEZjZ0Fzdmc4NGFUL0I2WXlaWVFI?=
 =?utf-8?B?QVpIczNFZS9HK1ZONURMa0hiVkpVN2tHcExqbHFJS3hKQktwS3FuNFZGYzhy?=
 =?utf-8?B?R0Q2bTBJdmxLZ2p6bksveDU1UmVFNU50SWppTm43NEFQakpOT3RVVFJneGxp?=
 =?utf-8?B?YmVwWGx1Y2RVT1AySDJ0MHJGbGh4Tnp4NCtjVzhxdjRpcy9nbEdFV09iTkVJ?=
 =?utf-8?B?ZGNtWUdDZWF0aGVHTTRMR0lvcGZXUzFkU3h6TnNOdmpnSHZWRlFRS2VreWVz?=
 =?utf-8?B?SlhuWkptdjlrR1YzQ2ZSdW4rUE11NUxBckZSaVQwN2FqSTVyd29UV0QzMmlM?=
 =?utf-8?B?QXpHblY1TWdJdzRkSFJyYUdrTnRhZ2lwQjRSWmwvV3R4VGdNMHVqZjFNdFh0?=
 =?utf-8?Q?qUTXp8Kr7tDy9U2simn0Hd4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cefa20b-a0b1-4625-60d4-08da0055af0d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:15:23.7487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7eVVaSn/fgiHiKLS4nQU3krrmQtwOE1DOnAP2qLtIJ5eIzrZYdfaC3e6VSR7fkaVeDMeDes+i32tQ2KvvreEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6875
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 05:11:34PM +0100, Jan Beulich wrote:
> On 07.03.2022 17:06, Roger Pau Monné wrote:
> > On Mon, Mar 07, 2022 at 03:12:32PM +0100, Jan Beulich wrote:
> >> On 07.03.2022 13:53, Roger Pau Monne wrote:
> >>> --- a/xen/drivers/vpci/msix.c
> >>> +++ b/xen/drivers/vpci/msix.c
> >>> @@ -182,6 +182,33 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
> >>>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
> >>>  }
> >>>  
> >>> +static void __iomem *get_pba(struct vpci *vpci)
> >>> +{
> >>> +    struct vpci_msix *msix = vpci->msix;
> >>> +    void __iomem *pba;
> >>> +
> >>> +    /*
> >>> +     * PBA will only be unmapped when the device is deassigned, so access it
> >>> +     * without holding the vpci lock.
> >>> +     */
> >>> +    if ( likely(msix->pba) )
> >>> +        return msix->pba;
> >>> +
> >>> +    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
> >>> +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
> >>> +    if ( !pba )
> >>> +        return msix->pba;
> >>
> >> For this particular purpose may want to consider using ACCESS_ONCE() for
> >> all accesses to this field.
> > 
> > Hm, I think I've asked before, but we do assume that ACCESS_ONCE will
> > generate a single instruction, or else we would have to use
> > read_atomic.
> 
> Yeah, that looks to be the assumption. It has become my understanding
> that ACCESS_ONCE() is generally favored over {read,write}_atomic().
> Personally I prefer the latter when the goal is to have single insns.

Oh, OK, so I should use 'ACCESS_ONCE(msix->pba) = pba;' rather than
write_atomic then.

Thanks, Roger.

