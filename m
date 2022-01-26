Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A721C49C9F3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 13:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260876.451057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChfH-0006ZF-UP; Wed, 26 Jan 2022 12:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260876.451057; Wed, 26 Jan 2022 12:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChfH-0006Wc-Qi; Wed, 26 Jan 2022 12:44:43 +0000
Received: by outflank-mailman (input) for mailman id 260876;
 Wed, 26 Jan 2022 12:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8h68=SK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nChfH-0006WW-2n
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 12:44:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba58ea6e-7ea5-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 13:44:41 +0100 (CET)
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
X-Inumbo-ID: ba58ea6e-7ea5-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643201081;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CkkDv1ZgfgkZTqq0/NRcdDtIMXOji7Ls91Ea+seX+uk=;
  b=gEfUhLilhDsAKmY5LUFMYzNWo9TRjq+93cXph8G8Pi93yRruIrdqC59k
   FELC3b75F9T7IAF/zyuBoNvxec5nU3suq7hiIHrIM9I2ZMzh/i743sTVD
   xZfg6hNcMAcPvjC8KRe1SHwyfaBDwhR5icfccfQSyLQmPxTxXc1yjhEHx
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yAV5+4J7yydsmF//WHtXcVq8Jgr20IDxNXeJPmuN7V+M7CCtehpB7Ax2rSWTJdICW2TZ2vBGjl
 cC1QxmKLFhBG7jnN4utVIOa5BXaoxeKjHhbLvSDpGnYK1DO7s3vO3/vrWW5u1eiVxZM0aTd8Dk
 g823e4nHtwj6YLZDbObjl/h8EdiqV1jMcjm4b4bFzVAKqZ0s3tzEFrrNw36AF13mcJkWMpnnmF
 J8z7qm8jS7zQ9WbLEJSekRXHq9V/+eLdkxUuSNM/91UnQVR1qB8mJCa6nCdgjg11P8RQoJlWam
 LPKB9GD7O8piMpeNTRdn7iVm
X-SBRS: 5.2
X-MesageID: 62262429
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:autP+aqFhadQM70byZE62QMQCDVeBmL+YhIvgKrLsJaIsI4StFCzt
 garIBmFMvmLNDHzKN5yadyy/E8PsMeHndIyHgE4+HtgFS9H85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYysRQQVBaDIo/Y2fyNXLHpkZYlb+ZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4UR6iEO
 5BIAdZpRBb9TjwUYUtKM7UZwvbrvGjaIjBxl03A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0S8ZcENEB5QW22IH42QmmXXJcaiNAQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5NuRECnCBtJ6sybp1qHHb7
 RDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0lfRw0bJpYJG+2C
 KM2he+3zMUCVJdNRfQvC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhTfSFkXsin8pIOHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu2NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:1eX6kKq7aUtasrRiubI/ioUaV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+W5gNcNvpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="62262429"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPIfHbC4WXd7Tb5KxLuy+EPn6iYzgt24zKrFPNIwiErcEukwtMauT9muaqLydeKTEhPdntrlG4t02IayZQYqOLg8KCmFKr+Ky4j43L85A8lQaiaasrZnRNRB1YuDx/AtRCbqp6z+pT4Tqeub4YZxv6zpqeFtJip/5f0j5wVrCJxGu04I8g0FYPGHL7lrQ/9e3s0I+prNXrJqmx6wy6jqhZriRLTbod9wB7sGsowCz1Ta28BD8gkXD2tswSBbq2bBdWxqqiYkXNKTbEZhJu/JHy4JyPLjctKBNY6rKSr/iHnuN2aokdnX/BWO+6hD15RddHR2vA806Pp+zlQzmKbktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmaDoHg/rKSVZYMvEwO3Cnf8KOnX0bicLWOUtT2qznM=;
 b=Awllnu/bKjaKHWG4QBbftP2NBsgd48hj+j2YzmxwyWhvsWtQMAUMIvt6OAU6x61FjF8D42DD1J8bgTZnwdmixu1FdrVWpvqtFb1BqNhqGN0WALyU44HdxOfpDNJPx9Y7c4cadC1OSaKv+WgM3AlHC6WAaiU2mvDvxwhk7IaZr7KA3gip3DX+5yjd0/5l5990gXrLq+K2/ROcHvk6osyghIrcsuivPjqcyEZmmRMTaS2TMh4cYpA649WA8AD1KUUjVEqgjOD4dR0o2Uz9k2AqLNNBaYNJoom4LCU0U7GzwTP6dOOy5+cbQi8BO5yoSJLsUDYCPcPFfpENSBslfQEHug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmaDoHg/rKSVZYMvEwO3Cnf8KOnX0bicLWOUtT2qznM=;
 b=Aab5+qzmtCRoqC2nCiHPNbeI2+RJqKFTococrHXUhGx3DkUFHo+8byGtp5lqX5C9yQtxeOQikxMcA+IWkR1Q0AvPE5ynitDIiihSco9pUwmmJLpHGIdMFxImDDDK2j+ObBILn22X53AZBJUnA2lBNKXTsQZFb3gP5l/ue4arPBg=
Date: Wed, 26 Jan 2022 13:44:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] x86/boot: Collect AMD speculative features earlier
 during boot
Message-ID: <YfFCLxnGDeuk/va0@Air-de-Roger>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220126084452.28975-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 820aec31-aa6e-4e39-d9ad-08d9e0c99cc3
X-MS-TrafficTypeDiagnostic: SA2PR03MB5691:EE_
X-Microsoft-Antispam-PRVS: <SA2PR03MB56911439F45330DD363F419A8F209@SA2PR03MB5691.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w3mFYhYLiV1Y7kzuJNdIOzv+CQa75mIlmkVe25pn98Aw6d2ZErwyObkvgmpKaa/gBffSN1XvFekDyTGWAZ1VbcO89zTjKeP2ZNIKthgKB3nVZkaDXY5RDfy2wOvDZb5XFCKwcrpnmk1YJbpGEBNRrZq1+NIVEdyV6pHKU8UTJGeOpb+nJH2gtRwBhHlRn2Zc0qA3wLWR91Bvw/uKazJ0LupLkuW4PQWPBMDXEsqYR36EKjOYRRhRXNvSG1XyBv190ZMjZdxIQvSHaf2MvwfJl/a3TJLqeROLH3o/lUWeNNjMkka1HlyfIcul6TV3N6viFJ7ysETKgF8GDw6OkrfeLzRh3nbHZW3gIdVM/Efn4X+KoR1dADrocfhk28RovOI5rgNYDFw6k/OHFTBH6rP7ZnUCqZ58IA1ykBu0Cqo2reYHRctDtksTf4j4ExjsmNsLxM3IvuVsbTQa1LXyNCjBV2RhbQs/mCWHtpYz6dU6dEKNE2JYx3quShxLBO+rko2Oe59bLXw9zml2LfVdq/8zyP9HsAtjf7BTdUhgDFUuCUPpKJp2jx5qwo/apeCo+qSTpJCw4G181P+WuMbvNM9xq5gn6T/gZnH/O+4ByK9Nymbggu2E/mSHyz6JUXGFrVt/g5TMexAe7NG2P9Tgy7w6Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(82960400001)(6636002)(33716001)(6506007)(4744005)(66476007)(66946007)(66556008)(83380400001)(8936002)(316002)(6512007)(54906003)(26005)(86362001)(38100700002)(8676002)(186003)(85182001)(4326008)(508600001)(2906002)(5660300002)(6862004)(6486002)(6666004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3hOa01ybjVnSkdMZG1UcVJvWVRtYWFmb3dWaXdpU2NsZ3lYK1NNazBCbUh6?=
 =?utf-8?B?eEdpZWQ3SGZPR2RCWU1aZGpkcTdvVDZaejBQcEJPVC80S1ZCSW1lZjVlSGFL?=
 =?utf-8?B?Rmw4N2lFNGVGUG9rOEJsdnlQV1R1VUhVR1ZNY1BZdldvSDl0dUpRU05PeTRG?=
 =?utf-8?B?Qjdib0M3dHEyMXBxbnpGUUgxWS9ISDlGMDlhdCt2NHE4YUduTFl2UVJ2N0VL?=
 =?utf-8?B?a2VlbGo2YmpZbGo2UzQvYlRQSVR3b09CRDk2a2ZhaTRXdStacnRnWUs4NTJ1?=
 =?utf-8?B?cEdXTDVqakJSOGxMK0x1c0FCZGV0TE5QMThCMEg2UVZkNFBwNUt5THUvUzhM?=
 =?utf-8?B?Tk1tdHhkR3d4VnkyTlJmcUJOR0xBQTBIQnM3QXd0SlRNYVBTNGN2VTJUaXFL?=
 =?utf-8?B?NmIzL3MvOXVQMXhqU1BEU3lja2k3bDFTSXhrZVNlZUlJK0NIVm9hdHA4VFFK?=
 =?utf-8?B?cUlxWGtEQlc2WGRwdC85QkNUVE1yR1B2TUQ1dzJnK0lZRVlKbXNpaFFUOUpH?=
 =?utf-8?B?Tm1FVFR5aFF3TEN6bm9DcXdLbFo3eXRhODIyM2tTc1hQTUNzUVM3aWdBWlBn?=
 =?utf-8?B?anVCUExOMkMzRGhJTldpdkFxd3owTjd3Y0h2bzF4SDFlaGhEb1RRbUhRaHo5?=
 =?utf-8?B?L2tucmtBZDNsY2wvOUlNekFqdDhrVlk5djkzazZSckhJOWVwQUExeHZKVXhF?=
 =?utf-8?B?dEp3VzJYbGNRUTZCQ2NoK2d2dkFnQTJrVE1Bbjl2Q0NmUFpNRk9CZ09rNDdD?=
 =?utf-8?B?ZXQ2cWRZdVY5TTloYnZScEc2eXVTaEpURjVHOFdEWWhaMDJiUndXcDd5cWFZ?=
 =?utf-8?B?YlRHU3dINEdFOGhiUStNRDJDM0duTER6b1FBN1pLQ3ZKS0pmanhESGtKbmFR?=
 =?utf-8?B?RzdqYmVVbFZ6VTlWNk5JdkZiM21QQzU2OERHWkRzTzdQUUt6VWNVcW95NXR1?=
 =?utf-8?B?ZmRqdVl0cjVnU3RnV3hKdXdpYXdSMlQ1S3pTQzlaTU9zT01Pc3F1VW8xL3R5?=
 =?utf-8?B?a2ZSMVk0VTZpaXFnTVRreTE4cWxrOFlqZytUbWh0U3RRdGRsRGNPbG9RT2hL?=
 =?utf-8?B?Z3NjZ0lkaHhLRkx1eDI3aWhkb0RtWnI2VlgxN2RUK2NGcEsyS3ZiZFYvNXF2?=
 =?utf-8?B?aXRaeXVFay9ENnpPTWlTWjBja2RtQ3J5SmpzdnBRa0pPS3JKNHpxaHFVTDEx?=
 =?utf-8?B?UXJVWThjQW9VZVAxdlpHNXNjQTluSmJ5WWJzVTh2emhOYVFyNUFRMXIvRHl3?=
 =?utf-8?B?R1kzRmZjTTBwQjlEcWNWQnd0Qmp3VkRxN1ZBUk4zeHdaQ1lqR1JjUnVDc1px?=
 =?utf-8?B?K0tCcnpIbnhhQkJwOU13c1Jwb3hHb3lKSko2RGJKM2pRVW1tNjF6cXpkZFVr?=
 =?utf-8?B?YzBvb1RJN1Z1QXlFMW1aNjVzOUtLSjhCakFkTEgrNk9mUjgvVDVKTkhNUWlV?=
 =?utf-8?B?YWpRT0JMQUcxbVJBdklnM2RDcWZZMmhzeTBFbDNwUE5aWHgyWEFIMDV1cTBi?=
 =?utf-8?B?enVDbm91djRoQVpYTU9RK1d6aDJtVVBUV1BHZ2ZxZDk0cjVSSUtBWGRSdFg1?=
 =?utf-8?B?YmVFRExzYmFScUJadzI5bTRXeFhUdXZPeGdQa0k2VnhRdndzdm9SM21SMlIv?=
 =?utf-8?B?WHl5d3J0L093UTc2dUpFZ2VIZjIyczdxc3o2MDd6SEN3c1RscG5xQU1seE0z?=
 =?utf-8?B?WlVLMnBIaGdWVDhwQU5IOWd4KzhaRmljUjZGWFVGamlXdklReGJNQXh1ZThB?=
 =?utf-8?B?SkluL3BEMUNtcEJpSFZtd0pOaVNNOEdYYWdidml5WGw2K1lzTlR3RGo5a3RX?=
 =?utf-8?B?ZlZkTkZQeS8rRnRCREU0dytCb1BNMkI1QTdTUG5oWWM1ZHpGalRxVC9Rdzk1?=
 =?utf-8?B?dmFtNVl4dStUcDl5SURIWWE1dkxlUlppZmwvbC9CMmpZb01Bc1d3S0Y1L3J6?=
 =?utf-8?B?anBnczAxaElNT1J3enI4TlQ2RCtKeC9TMXRYODdkbVhlYmFNRGtOYjVMaGJi?=
 =?utf-8?B?bEhwY2pJL1VZZG5QZnI0V0pWWDRNQWFtS2tyajcwZmF2U2ZIZjFqRXRlRzlY?=
 =?utf-8?B?b1pLcEswY2g1ZFNiendQcnVONVBGbVVSaW1UVUdLcGFURHVnanZhSE1ya3dz?=
 =?utf-8?B?ZWJmZDVJZDdHZWpiQ0FuWnJid3NWTWJQV0VYWkZBSUhyVHNESTlVdi9MeU9R?=
 =?utf-8?Q?xvU+Mw3NRd9dexmmYiC+M34=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 820aec31-aa6e-4e39-d9ad-08d9e0c99cc3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 12:44:37.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6voGiFtJVxLVYtiUpk35qLH76DFlv5N9SRPLkwKQHLTnUCntSo9qoXZSEeEOZyn2Yd6FQ3F57kkk2bs98adz/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5691
X-OriginatorOrg: citrix.com

On Wed, Jan 26, 2022 at 08:44:46AM +0000, Andrew Cooper wrote:
> All AMD IBRS-related features are in CPUID.0x80000008.ebx.  Collect them in
> early_cpu_init() so init_speculative_mitigations() can use them.
> 
> Rework the existing logic structure to fill in c->extended_cpuid_level and
> separate out the ambiguous use of ebx in an otherwise 0x80000008-specific
> logic block.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

It would be good to update the comment ahead of early_cpu_init to
mention it now also gather speculation-related fields from CPUID in
order to do early setup of mitigations.

I think you could also use boot_cpu_data in spec_ctrl.c print_details
instead of fetching again the cpuid leafs?

Thanks, Roger.

