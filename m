Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBD945570B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 09:34:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227180.392839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncrj-0002Lg-RA; Thu, 18 Nov 2021 08:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227180.392839; Thu, 18 Nov 2021 08:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncrj-0002Iq-NF; Thu, 18 Nov 2021 08:33:55 +0000
Received: by outflank-mailman (input) for mailman id 227180;
 Thu, 18 Nov 2021 08:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45Id=QF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mncrh-0002Ik-Tc
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 08:33:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41c19268-484a-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 09:33:52 +0100 (CET)
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
X-Inumbo-ID: 41c19268-484a-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637224432;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VHmZFiAkSNNxr5QfyVe7wxDdItwEVCjRSrloPzTYd2E=;
  b=H+EK+oOTTNw3e+ftqW0ZiW46rqv81djBkB5imkS+hvsP5gKaj9+lI+Qm
   MNNzQfyrJSa0aIILZDd3fRpaxF4BmXuFUTLCQ10XJywCLGt5UZCGS5gVJ
   3HOo9KeOOCsl+CdkNzyagLhYkuwv4ItLjBhQrv2X10zBHeXZFh6TQYD1n
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0ye4teCl4pYXgdahYzoaZL/J1BE4AjzysmXW1fUgQc5Rv9lvHev6KspxH3Mp7EZ5xfB6Qd78F1
 Iv3mKTnOS7XPpW3wZ3UFmRzMLKQxA2n85My1y6D0/UjeJdaj+orRQCSKvvdtaDoiw5CnQCWvkm
 xmlVWRZDaXJzLvbXQGeKaPGW/iaS0VnsR2vTzIpq5sR5Zm3TQTkRlDxTYN3nZc6qQZyTU6M1xS
 7Ffz/RT5pBxozyWqr4nlkTayOjMjJhqJ21cumQ+yeVnlm1OBjZbHO5nZxSXnVq+LRB7hYbki7o
 ey1qYH91X2DsY76u2YynqOMU
X-SBRS: 5.1
X-MesageID: 60089620
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:52YhV6N5Ovg7ffTvrR1PkMFynXyQoLVcMsEvi/4bfWQNrUok1TYPx
 mBNUWiAafePMWuhfYhxbonip0JX7MKHyNdmTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eszw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozDZxZdz8
 slQjrq1c0QnHb3ekc8EXiANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uSvY8Jgm1o7ixINefEX
 5QJZwNFVhHrODFGPAsPCq5ug9790xETdBUH8QnI9MLb+VP7zRNz+KjgNsLPfd6HTtkTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M/pAL
 2QE9yxoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1ILRs1zeBFIYUwVnbeZluuwmVzUBz
 1KwyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
 yWi9XBm390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7FHjFtX
 1BewqByCdzi67nXyERhp81XQtmUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hSM4FwNucMDYSvwBUOSX25XI552pUQHPY67Ps04k/IUOsQhHON51H8GibGsM5DFzxF3zPBX1
 WazesewF3cKYZmLPxLtL9rxJYQDn3hkrUuKHMiT503+jdK2OS7EIZ9YYQDmRr1os8u5TPD9r
 o832z2ikE4EDoUTo0D/rOYuELz9BSRhWM2t9ZUILrXrz8gPMDhJNsI9CIgJIuRNt69Uiv3J7
 je6XEpZw0D4nnrJNUOBbXULVV8ldc8mxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:2vBHmqo3Mn5VDy/82/NL1+0aV5u3L9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGMaGJ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqX+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+qemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lsdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNzN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wqJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABKnhkjizytSKeGXLzEO9k/seDlHhiXV6UkZoJlB9Tpa+CRF9U1ws67USPF/lq
 352+pT5fdzp/QtHNdA7dE6ML2K41z2MGDx2V2pUCDa/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.87,243,1631592000"; 
   d="scan'208";a="60089620"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6tEQzw+2DPuc2inXhtpzbhozjkgAbmdduD6znsCXYydRSbDx9HFpN3e9Vh09isi9YxXFvcD1JJJNUIwkbZxRO3V1fYI0J95B3l/qnERBmsv5ODs0V4NuhsJlBO3Udc9Tw183rNUiLIM+nPYqphfAdkrczyLYr6ob52KVf3Eyz/SrlmbeZc8MdiLO/4R6sWSf8i06yGIXCWaF7zsZDDSH08vnC/TZodrW/3+0gs2ZseSZwAInOoQ6TknA3uBoNwSnlcSqrq+0hJY0XEGD4Wsc0W2n15LrjcPCQF7YPok6h+86aZrEeCyRbv/7C2Bns53MBipDb5cIMCLGQLBHIC6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SK0g71aPS4DeWVUriS6RFJbsGDjmSYdetg4JMbE7GrE=;
 b=OPddE+3+m1f8xatItWtQNj9ezo/LS4BHEAZyley1W563Cs6VKMdlz/KYqRfcIRrf8x85nVN5qhkqzT4fTRGThAYCazUg8rQYvH5FiNWw8W0vGnLAVjJZXo4iieq9i/1/+h8SOuUja//2HoqHc6JKz7HAIxieS2SXZTWOvXj3spiAf2ghbnE+xkFDMtB1I+v03wbVrO2OQZrbH7NJZsMPrm2Hmq/HOz60hMXue4JeBZp9lVnrtKo6XQCiobPj8nYG0S8lJpRymqf4DMovp3diCYM2cmitihBGOv6bzvKBWiPUJIx2SUzxQmntqCA/kW4GYEr5TQZgmBEJ4HnjpsW5qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SK0g71aPS4DeWVUriS6RFJbsGDjmSYdetg4JMbE7GrE=;
 b=VI6/meC/282oXFbnAQ+i+AypI7shRoCCk2+C6XEGVlIk/rMSq4NJlvHuhEGgbgOqAcz0Nfj0kBWk6DLHkTsyCuiTopm35UsTY8+3SGVc1KHrkDUkJIJ+DKb4MNprNWHocG1N1J3GnA1cjt1tL3olnuxD4aKqMmYuukcsHVhbjSQ=
Date: Thu, 18 Nov 2021 09:33:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with
 GCC 12
Message-ID: <YZYP3BpugHwOhNuV@Air-de-Roger>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
 <24962.46376.136195.463274@mariner.uk.xensource.com>
 <1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
 <67d7cf93-2860-f8f1-9de7-932da7f537e0@citrix.com>
 <2051641d-17f4-07ee-9db2-0234e6ce4c70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2051641d-17f4-07ee-9db2-0234e6ce4c70@suse.com>
X-ClientProxiedBy: MR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f912e6b-8ccd-4d48-94d9-08d9aa6e1e1a
X-MS-TrafficTypeDiagnostic: DM5PR03MB2970:
X-Microsoft-Antispam-PRVS: <DM5PR03MB29708CBE9E7EDF3AD7AC93F98F9B9@DM5PR03MB2970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VoGPS18hARjXrgC+gC6s1JO9SBpQKP7g6ASBGj4KAOIjpoElI6Xhl53ZQ3QRcniXZ8hS0z1zmlTZKgv1nF/piAWPMY873PluCkDxzEOufiOokIH3b08VuQfi2nq95h/Ub1n6lMbTt1Xl5iEt/0mmkuIzXUSR4FoTLWFvpnAdTzkor/iNIgPTegbWOILwE+9SDpgQTP6Mw4D/hbxmYaZRFEicExw4EIBDQ4zhkOBSWYJUzQxBuPEouDOqM/w9FfX237BtaoDMWsQC4/HBtAM09VUJXrdTMuLjY8/xwHDxOVQzTWDD+kgDf3t+mKHPKOwdpkjd0D1YX3gHZtjKej+0nyk2+rDpJ8L4quOW2HKkmRsnztWKX6eXjE3dztQv7FEuSN/MQEWuMXDpHlVuEpQGTKVRvxNEZLR/KfHU2WwZnfUT0PIpf/MTrDS6u2ljyFzJr5tZTbgXDYbihPtfZUnE++OhWL1zU2wA+qP2ejnz3VqfBxM2vBiZwLmR1edFMYdaZhf9bygqGYLSMOrhLwdQrobVBQ/O2kmjrHFicu3vusdnC0sBuIaJQb8NGs4LY91dEh3LJMaoSDXAPH0ZUqO3N0mJ/rtcdB2bWsnFiRIFxAPh0UY3o52reSY2SgKvUCBDvPed9oSgudZ6N7bI0+a44M0Xa8qKvexXFQSO7noJbfpkwrU+U+7r8/8nXYG69HIQTVSnZe6jYCoXU+qtC+rUSbyYWbCHW4Xy0cWbvvc9BtA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(508600001)(316002)(86362001)(186003)(6496006)(9686003)(85182001)(26005)(6666004)(38100700002)(2906002)(5660300002)(66946007)(956004)(33716001)(110136005)(66556008)(66476007)(54906003)(6486002)(4326008)(82960400001)(53546011)(8936002)(966005)(8676002)(6636002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW9hb2lOcjFIL2Y3T1hmMlZhak01RHdrRGdYVkZlZEJLVDIvdjNjYi9uRk5u?=
 =?utf-8?B?Z1dzK01xb0VFTXpFS3o0NzBJMEZWWTFJU2tBWW5WbDBFZTdlK0k5eWtabTZ5?=
 =?utf-8?B?UC9mSFZ4eU9VeWpyNmdUTlpTcmVQZGZ0Rk1wWE5wYThxdEF2QzBrMWd6LzIz?=
 =?utf-8?B?VHlhNE1FZEovLzZUUVhKVW8zSnYvTjg0dmd4bHpzaHZRelBnNkdxeXd2d1g1?=
 =?utf-8?B?RWxKcW1FK1Vkd04vN2JvdU9Lam9QSHFrVWZlYVBxTEV3WlNEOGJUWE1TZHdj?=
 =?utf-8?B?RGIzYkl0K0pQVTBrZlNLY2Z4RFlJRW5VdVBSYUQ4WlpmTFBsRXpPS0lEcXVI?=
 =?utf-8?B?ckJ3ZWN5d0hSVnBTbXdLYy94aTVtQ2srOTFKM1lKbEZzKzVsRkYrUlNmT2lp?=
 =?utf-8?B?OVNhZFFGUjhuVGJiUGJ5YmpsU1ZiS2YyZHBVTDF5K3hnWXhmcW5OY3J6QldZ?=
 =?utf-8?B?TjV6NTZPV1N5K3lNQ2lNSWhiK0l4akk0QVJFeFRXQzlZc2VhUVBZN0ZoRTN0?=
 =?utf-8?B?YUo3Ukl0MGxwYVJxcCt5MFdUdk41N1hYelNmK2pIVGJpWFp5WUdvU1V3cWJJ?=
 =?utf-8?B?RlI1RVFieFVoa0pVZ3RFblZTalc1U0FJWDR2S1RKa1lwZGpVOW5pbzhzbWRi?=
 =?utf-8?B?Qm05TDV0TCtuSm4yazNnNHBLUUxaK0Y0YU45NVF3TFA0RGVqOG5CRkdpRS9F?=
 =?utf-8?B?MmJTSjhsY3VkNUl0Q3ByMUF2RDc5NUJuZlpzcDM5cnNGN01NUjF3Y2hFWURB?=
 =?utf-8?B?S1lHZnZHU2drOUJPOHFKSHJkRVozajE3dkpxd3l6OTdRRTV3Y0JYWDRHZytz?=
 =?utf-8?B?NkoxRk5vbS9mUlBvblltYjlvWlFDT2h4UVpUM1M3TUx0LzE2aGZ3YXJ4UUhS?=
 =?utf-8?B?WVEvRXpLN3Zjbk5BSW53VG9GKzNQOEtoZG5ud0JYa25SNm4zRGIvcEN6dW1N?=
 =?utf-8?B?eDEwS1Rkb0pCNnFPT01uVnBQY0U0Sy8wK2xZWDc2bHkzaHAwbzVjOTY1ZnVV?=
 =?utf-8?B?TTJWa2lQWms5djhmVzdTSWVINWxRb2FjZEpXMzZQa0daUU56OU5kOFJzTUxG?=
 =?utf-8?B?NkpldTFJc3JNNkZLQUoxaVZDcW9Gb3lUSGZCT0JVK1BTTW00MUloZVdKSzdR?=
 =?utf-8?B?QzZwTmdDWnUzQlNjb0pVaWlOT1k4Z21NWi9YWnYrdk5yN2pQNnZRejhIbW45?=
 =?utf-8?B?YWsxbUhtWHMvbDFoQnNFaEZ5VW9rMXFCVXJHMCtZY3AwMU0vaWxxelFwcGZy?=
 =?utf-8?B?cEF4NFlTZDByRU4wT01VaC90SnhnS3pxbEh5cXczKzNDajdUdHhFbXQrZUU3?=
 =?utf-8?B?QVpockUwSWU4STBaK3MwcGhWa3UwMWlCRFZBZzE1WHgxMkdzeFhsRVJJbFRr?=
 =?utf-8?B?elNpNEZvUjRGV0RCdW05RWVydldRbE1QQU5XbHJCMmxvSmJoaC9UeE1YdHNU?=
 =?utf-8?B?MVUwcDlpQmgxV1JNYWNWOC81VnFucFNDUGZuQ0lCNnpQMDlVMklSWGk4bDlC?=
 =?utf-8?B?S1FqQ0tIa3lBY1R6a1E0bjFRNVVEOWwzZUozbldnR2hDWEZxaGtwaU9QZ2xm?=
 =?utf-8?B?d1Q0aGlQYVZwT2lUTlpUdTBQM1FVU25HdUQ2UnpRZjZuM2xKRWViT0JzdjFY?=
 =?utf-8?B?d2NCTW5mMEZhVWlaeDI4NE5jNHgyRVlVOXUxWUtOQW8wenFuUlBWOFh3cWo0?=
 =?utf-8?B?ZlNWb1pBUEplNlVub2NJenZqTlFKa3BGSFUwM01uejFVNmZDYkxZdGttekI4?=
 =?utf-8?B?NUNoZjY2TWpDRVRmVVQzVWVDcHplYkhTSDE5ZmNEbmZKWlJQdHcvSzRhblUw?=
 =?utf-8?B?SDl5bVJuUXNGRnZQdG0zbmhmTGYzV3pIZkNna2hzeG54bjhNZERUS1NTSW9r?=
 =?utf-8?B?d3FtcHhXT2JYeENuVUtsc3B2YVQxcVcxQzVBelljak1FYi9sYVVibDBaVWFk?=
 =?utf-8?B?SlMzNHBOMmJhNm9zQVpUNDY3eUMvOTE2U2N4MTJIYnJFSXlGMGVjWFd1UFRp?=
 =?utf-8?B?cC9LamJscjNxWXN6YUZRU252WEdKRmYxRmZjZmFUd2ljVzFxaW1wUlI0cXFJ?=
 =?utf-8?B?SndRWFVQMVl0Y3BveTVBUFMxQlFMTG05c0xveUdUOFlobW1uYVNUWjN2SEpv?=
 =?utf-8?B?dWwvekNuODdHVHNIRFFBQk94aERYRWhQOUUvSWtkT0cvSHJqbTdKeVZySStE?=
 =?utf-8?Q?/dMeaEY6PRmtNf3sgCEC7tU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f912e6b-8ccd-4d48-94d9-08d9aa6e1e1a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 08:33:38.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Yj6CeP7BGEZUaEdfuNciVaKnxc0WUNZ8gKimiNrWWUrg/ZaJpZR0uzKpo0cuvx82OwQdQ9BEIeYE8LtUX8TkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2970
X-OriginatorOrg: citrix.com

On Thu, Nov 04, 2021 at 01:17:53PM +0100, Jan Beulich wrote:
> On 04.11.2021 11:48, Andrew Cooper wrote:
> > If your answer is "well actually, we didn't mean to say 'if a GSI is
> > mapped' in the comment, and here's a different predicate which actually
> > inspects the state of a dpci object for validity", then fine -  that
> > will shut the compiler up because you're no longer checking for the
> > NULLness of a pointer to a sub-object of a non-NULL pointer, but that's
> > a bugfix which needs backporting several releases too.
> > 
> > The current logic is not correct, and does not become correct by trying
> > pass blame to the compiler.
> 
> I have yet to understand in which way you deem the current logic to not
> be correct. I'm sorry for being dense.
> 
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102967 is the GCC bug, but
> > the result of it was them persuading me that the diagnostic was
> > legitimate, even if currently expressed badly.  They've agreed to fix
> > how it is expressed, but I doubt you'll persuade them that the trigger
> > for the diagnostic in the first place was wrong.
> 
> Well, thanks for the pointer in any event. I've commented there as well.

Did we get any resolution out of this?

It would be good IMO if we could build out of the box with GCC 12
instead of having to backport fixes later on.

Regards, Roger.

