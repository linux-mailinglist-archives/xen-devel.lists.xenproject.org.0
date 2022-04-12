Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7B4FD4B4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 12:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303577.517916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDRH-0000FJ-0E; Tue, 12 Apr 2022 10:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303577.517916; Tue, 12 Apr 2022 10:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDRG-0000DP-TE; Tue, 12 Apr 2022 10:07:58 +0000
Received: by outflank-mailman (input) for mailman id 303577;
 Tue, 12 Apr 2022 10:07:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=to5A=UW=citrix.com=prvs=094341a74=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neDRF-0000DF-5p
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 10:07:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b627086-ba48-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 12:07:55 +0200 (CEST)
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
X-Inumbo-ID: 6b627086-ba48-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649758075;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kbu6kM8SIKbLzGynWPAbXCPVFWBLIQ9H+zKtmhQC/FE=;
  b=E1Jv502MUV8CnXzQs23spNT/A8BEoyEJ3P91Dux+4cAOwpIRtL5x5Out
   cVNWA1IYrACGeRN7yF2qbZXKJZKak4t9YChuWy6ClAheVAxCBtn2nYiXK
   b/pOw8jaX26J2jk5BnwMbH1ck4okF32OUEuYxkDuDFOHg3v1RD2f/43Ke
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68658941
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:J5AHxqDikxVpMBVW/7/jw5YqxClBgxIJ4kV8jS/XYbTApDohgWBSx
 moeXmHUbPbZYTHyLY90aYq2pB5UuJOBm9EyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jg2NYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgul
 v5qjdu8RD4JGbLupstBCRheVC9haPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGjGlt1pESRJ4yY
 eJERxhifhfsUSZGN1QtNs4uod23vUbWJmgwRFW9+vNsvjm7IBZK+KbqNN3Za9mbX/Jfl0yTp
 n/F12nhCxRcP9uaoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQMDDUGWF39puO24ma0VshDM
 UUS9mwrpLIr6U2wZtDnWluzp3vslhwBX9tdFcUq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/H7qZw3pgLCSJBkCqHdpt74BzD2h
 SyLpS4WhrMPgMpN3KK+lW0rmBr1+MKPFFRsoFyKACT1tWuVebJJeaT3t3P81bFMIb+5aUajg
 ldYwcmYq+4RWMTleDO2fM0BG7Sg5vCgOTLagEJyE5RJywlB60JPbqgLvmggeR4B3tIsPGawP
 RSN4V85CIp7ZiPCUENhX26m5y3GJ4DEHM+taP3bZ8EmjnNZJF7ep3EGiaJ9MgnQfKkQfUMXZ
 M/znSWEVy9y5UFbINyeHbl1PVgDnH1W+I8rbcqnpylLKJLHDJJvdZ8LMUGVcscy576erQPe/
 r53bpXWmkoHAb2uO3SNrOb/yGzmy1BhWvgaTOQNKIa+zvdOQjl9W5c9P5t8E2Cao0ilvriRp
 SzsMqOp4FH+mWfGOW23hoNLM9vSsWJEhStjZ0QEZA/ws1B6ONrHxPpPJvMfIOh8nMQ+nKEcc
 hXwU5jZahi5Ym+coGp1gFiUhNEKSSlHcirSZ3H1P2VlJ8cIqs6g0oaMQzYDPRImV0KfncA/v
 6ehxkXcR58CTB5lF8HYdLSkyFbZgJTXsLgas5fgSjWLRHjRzQ==
IronPort-HdrOrdr: A9a23:qSTfn6nJAPm9e6MIY6ByE2w6cVbpDfO3imdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftW7dyReVxeBZnPHfKljbehEWmdQtsJ
 uIH5IObOEYSGIK8voSgzPIY+rIouP3iJxA7N22pxwGIHAIGsNdBkVCe32m+yVNNXh77PECZe
 OhD6R81l2dkSN9VLXEOpBJZZmImzWN/6iWFSIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsm1P73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhM12dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYAB89IletiA1LkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooFI5+NRjzkB3YM87Uvt8vIYf9ERaHNMrByTh8r0qF+
 FoEYX1+OtWS1WHdHrU11MfjuBEZk5DXStuf3Jy+PB8i1Nt7TVEJgojtYMid047hdIAo8Iu3Z
 WBDkxq/Is+OPP+I5gNQ9vpevHHeFAlcSi8Q156Hm6XYZ3vG0i946Ifs49Fr91DRvQzvewPcd
 L6IRVliVI=
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="68658941"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ko98hMhPUVaXXfp49u63VnWfv5C5+GT2ro6jiREQ9muubSZlRjbF8LBr0sYPKQouZAEf0qYqy1gZ7DBWvxi3B2DyTYc+/H5RP7S38EKpaAm+KVqrToOZxkSuIvcGmYzJodx9mMJ/LiL6NxAMhcOi5v+EyKwQymm9CBEIk3g5nadleckeV2TSyRYUkl2cUbLlW1f9j9c6vqLouxAYTdUM1BFpGgh0lbJXmKUF5vwBtIqFbjHAWgWs+Rgxrc36a6cG4/mTNcydjHPM5Oa2db8BxOVkcSxLBi29tQ2/gqyfEeS99Op9SAPN9+irUnXzdiR9S1t+s5fBYoAN0GqbFVomeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRRVvVk2095zWUu31BvnUuwIFmTFrkNfsk8pcpax5rE=;
 b=AxXXgEKDsVpoioqTdPJSMV3hiA2Zq5NFTJM4XBrIVP+qnR6f/Fn7+veeU2PlwKzdhmj9/VMRCrVqAzsnlAp4B9vo5p4Bs0fHfN9osKnt+ohRidn0SGX3XsWKwDKbK26Tp4ah4LDM3Tl6eBvdVmVQNhnnDq9EW0zoEXVqEWlqjQpLIAdWi6GpAJ984HDsgNLy36Ck07S13/JXWOMYwYq3L6wtL04ylhSyg5/dI8qgi9El6MR+qPhO0QzYg0wr1899WgPrkWilCc9gJ623iYG8YUoKGvMo9Ly/8f4rXSJHPFvCYIS2pz2tAXvkaP+Ag4aa8fPISq5R/HGiXuZ054Cy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRRVvVk2095zWUu31BvnUuwIFmTFrkNfsk8pcpax5rE=;
 b=U+Mm+xDrpd8zM3KGgsC7zyhLUIkbhSBL9JxR7O9r6Qd4HdnmDd2hvHHMniq9WPOApkiuNrrTKm8MlHeFtpEl2/m1GH73r/+64VWduNO/QLp4VJCbNoOPXJGC14ttRl0W9vFO7RzbI8xQZDjT9pkhaWpV+ljJp4rOhhzD7f0dhTc=
Date: Tue, 12 Apr 2022 12:07:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Kevin
 Tian" <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Message-ID: <YlVPcb036UtuJ9TI@Air-de-Roger>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
X-ClientProxiedBy: LO4P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13d82cc4-197e-45b2-f4b3-08da1c6c4d5f
X-MS-TrafficTypeDiagnostic: PH0PR03MB6872:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR03MB687208EE0F7C95C02A241DBF8FED9@PH0PR03MB6872.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ru2SR9p9pfQQv0h1Dus2R72GWDIpjLZ3zxIT/qctOYnVJtVv2z7YVts+Ld7RlWpZlqcg9LMXrq91XSRJ0Ar+4fhqUaKUgP0WfGXZ0bX1E9YhDiGI3ildtjlWbx64B5W92Nr+ZpFBoCkpznkKR5mzeNR3SBX6Z9Mb0v/PJqqq6Dp0brQ2Ims6/5Bz21mWWIQGLA8YTp+R+xCDzMHBCQfZMp9/1EQQkBGDO1Ge2/xhikPX5pQRGPqfh7cFDnqz5lt29vu9OXoq2xQ44RqgpRN2daFWnCWBjal6Otyko9rzO2knW80jisDQC5DQlnuRLgLO7etdg7bDzDIAssie6DMrUC4B9IEpalUHW4AJqU7jGTSF95eCYz4ufKJsbEhizsdw83LsavIPatCb1h1WbZMXG2IuW1fLH5ZFi0NyOR6fVRsdow33iQXKWd1ihu1PmDphJ1JYsDNy2mu8JUEWtvyptpErnkGs/lDeY8kr7zV7l2hFEZEVB4GMCkPYQeoJZ+r7FXrnWKnhTKVzP3fIB5tSCMoANJX9M/sCUcRCIEjmVhnejgNiyfgbb8KO16ZoRg0N0FB2JW7KowooaNtYBNvZy2yHfZSoGLgqQ1XYH10L745tgO84JWEhTIqig7tsXmE3B1nSCvfBd46q3ei/7gY/QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6512007)(186003)(6916009)(54906003)(26005)(9686003)(6506007)(82960400001)(508600001)(6486002)(4326008)(5660300002)(4744005)(2906002)(85182001)(33716001)(66946007)(66556008)(66476007)(8676002)(86362001)(316002)(38100700002)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm1KNjViRXR4aVZyVVdJNWdJWEV5SWpOcHVYdXh3QVZWT3BxYUM4K3cwVU5h?=
 =?utf-8?B?cDBsSGlLb1JXdFB0TWJxdjBvWjNkTmk4T2djamZYUnNDOXNKSzk0bnpGNkFx?=
 =?utf-8?B?QXpUeTU1Zy9nTERtZTZNakQ3S2lXb0VMRGI3VzlEbzlqaGY1WVdVVkdRS25a?=
 =?utf-8?B?MTA0enUyZGdha0JkTk43TjFiKzFweFRNYVV4OUp3aDd2b1RLdTJVd3NabjdF?=
 =?utf-8?B?VmFaSStqZ0tjd0d3K1FORnByTlNtRS9OeUNSM1NLY2Y4dEtZV0RHcU81RmR3?=
 =?utf-8?B?YlY5eVdUWjFzT2xLSS9IUVgrUXNSdDZLNVluMXhjMm03ZEtoWmxWcWJDNjh5?=
 =?utf-8?B?czVDWlNSWkNxZVliUWlybXpyV0xPY3JTWGtsdmpaaC9GYXF3eTVBR2t5QUs4?=
 =?utf-8?B?MjJ3UU5ZZmFVbUhIbmlxTlBZV25Tcmx2WlhuSjVnRTNHNkpBRFNxajdDdlo3?=
 =?utf-8?B?dlY0c3VncFV3dmpmQ29ReWNlVCtuQ2tUcWQ0VnhjMTduRlRQQXNpay9oTHps?=
 =?utf-8?B?REt2YmtXbGoybWtuVGdpMWlXd2Z1Y1o2T2tiVXdvTnd6WFkzRFZJekwvWVZQ?=
 =?utf-8?B?Z3hSTWxPWkFEUG4vSGQxVHhVd2xKZkwzOGUvRGFvd2tCQ1lLK3FIdGR3TGR3?=
 =?utf-8?B?ekpTWVAxR3Q1SkVaaDlrRGs5WmlTZTF4YXpmTUFVVndJTGtpbXRiV3F4SW1v?=
 =?utf-8?B?U241dm16TGpWM3NOamZpTG8yWDluaEprOW8wSVVSRE1JWU13T0VHUzBKMEZU?=
 =?utf-8?B?bmZYditXQW5YOENCenVRTEtlNDRHRnhCbDhKQmZ3bmVZUis0dXEzSE1EeEg2?=
 =?utf-8?B?T1MxRmFHaW9peGo0UDFBNm9FMlNENkZOWkFGT0R0Q3RDKzg0Z3hmekJvTmZu?=
 =?utf-8?B?cVBIbXkwSVVjTithSnpBbExHNEpac25jUmE1bk1kbm1UZW12UG44eWUyWmVL?=
 =?utf-8?B?SUhDSUlZaWtpUXpITGdodUdkNmpSLzI3a3ZKaGlIb0FGMStrWFFMZlZ2TFpR?=
 =?utf-8?B?cUxvaXhYTWh6dzNkd0h2YUJhS0VScXNGTi9ZbVpVd1VqMVdGbXdTY2dSTFN2?=
 =?utf-8?B?Wk9IdjVCWWhpcndMem5jZGY0cnYwOFNnRnE1WEVqTGhBN2g0T1gzRFo4K0JK?=
 =?utf-8?B?ZE9TWDRQY3QrWE8raXN2UjNSVmZNVzJhRnlXd3QrTE56aC9WNERxM0RXWmVm?=
 =?utf-8?B?SWE0WmlZWVJxS3B3VGtJRkhpY0xLU2VaZ2QzYTRCb1BpTEJVdHFoS0EzT1JI?=
 =?utf-8?B?azNGaWFOQzZGb3FIelNCZG9FL05XNVdISzliVW1CMjVWZmdXU2VDbHdOV3Zo?=
 =?utf-8?B?bXg5SzV0TTNscTJvaTVUTG5lWUgydzVMTi96SnoyL0NUMHh1U293VzBWOVFW?=
 =?utf-8?B?T3gyZU5ZNjRXK2ZtMmdFa2k5RS9CMnVoT3lON3JTczlvQzlaK2ZZR2JjTmlz?=
 =?utf-8?B?M0JmS08xVEt5UnMvS1pyS3plU2RFdXR1Q1ovbUEzT1BEZlFvZHJTRGZ6TThz?=
 =?utf-8?B?aDZqdkQxckZ1WEZJMHliVlBCMWZNNU1IWTFUTEtVbnFMVzhNczZCLytveWhJ?=
 =?utf-8?B?dEVORUNGZ2lhRittcnl2TGRHQ09iVnl0L0c3TzNjUEwyWTNLWmVpdi9MZVNU?=
 =?utf-8?B?QllpekVCSmx2RzJIT1BoOFAvUGN4S3RmWmE0T05qZk9MdEkzcTdCRzJlbUVU?=
 =?utf-8?B?SGxIYm9HMWcvemQrTjlYS1V2ZGMvanJSOFcwZTlqMy9OOHBjSUsrM0JGM0J2?=
 =?utf-8?B?Sy9yRU0wZlN4SGsxbW9xVmI5c3gybElBY1pnQ1p0Q1h5ck1OY05pVkZGdG05?=
 =?utf-8?B?dG5hTlhzZ3laUU8xVXdwaW1SaDhEVG4vcUhzMEFlVnQ0cEJXWUowN3pPVGhF?=
 =?utf-8?B?bDhySWJSd2Iya3dWVUw0ZFVVTFV2T05acm04ZzltUzZaOVhEQzJ0TW0vMVN0?=
 =?utf-8?B?SFppNHpTcWZsYVlqaTJ4N1hiMVlnQXJ6aVlrVmRHQWtzd1dCa0FsR2YzRFBC?=
 =?utf-8?B?U0RiSUtqMEZvRVR4cFhkU2JyaTZlWU83bFJFUlhEZEFMOHd6OW5wOTEzcENQ?=
 =?utf-8?B?cUJwb3JyeFhGNHpSL2FsOVRsemd6OHFrdnFtbWllOGhadnU0T3k1ejZTcTVB?=
 =?utf-8?B?NWNmUmszdTdhbkRrd0VMMXJCL25xaXhnSXRjQUYxRmRvNzlHSDkvN3pYK0NO?=
 =?utf-8?B?M0UvRS9HbWVjeHUyOHFUaktGU1kxRGpDcWFTK1ozQzVUdDZBUWJTb1FJbXNG?=
 =?utf-8?B?NUh4OXNWMGRxaVQrU3JDMVBRWTFCWWtTSWg5blRmN3pqeTI3M08yVDQvdnk5?=
 =?utf-8?B?M3poSllNNVNQVDRQdmpST0VWUjJudlBVajlDMFhLL2FFdFpGREdzQ05iL21U?=
 =?utf-8?Q?x+pxrtUP0+qTegBo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d82cc4-197e-45b2-f4b3-08da1c6c4d5f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:07:50.7789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqWxsJxrCJeqB/2tW+rK+nbdk/5gEYBvlAPRa+I6b2A27btAgKYmHGSfVUbhd0tDV3IcShsmFJVspa20+ZDdmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6872
X-OriginatorOrg: citrix.com

On Mon, Apr 11, 2022 at 11:40:24AM +0200, Jan Beulich wrote:
> There's no good reason to use these when we already have a pci_sbdf_t
> type object available. This extends to the use of PCI_BUS() in
> pci_ecam_map_bus() as well.
> 
> No change to generated code (with gcc11 at least, and I have to admit
> that I didn't expect compilers to necessarily be able to spot the
> optimization potential on the original code).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

