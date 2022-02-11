Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307934B2948
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 16:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270572.464903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIY5u-0005HA-Mg; Fri, 11 Feb 2022 15:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270572.464903; Fri, 11 Feb 2022 15:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIY5u-0005EU-JN; Fri, 11 Feb 2022 15:44:22 +0000
Received: by outflank-mailman (input) for mailman id 270572;
 Fri, 11 Feb 2022 15:44:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFbI=S2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nIY5s-0005EO-UZ
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 15:44:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 784e1590-8b51-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 16:44:18 +0100 (CET)
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
X-Inumbo-ID: 784e1590-8b51-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644594258;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SIr7/WtiBl1F0ZoXxDRjaDCDTuaOnEY0ZZxoZSftg/0=;
  b=ZjRFC+d4PhCtu5/cLJKDGueyxoEu/qNSGcS6IyTk8Ug9dYmFhoBA2pUN
   /4mCSCakr3pVhx5hp8Yrh44NusRZuXIFpQTJENpyzPzer+BztEWbaqMwO
   1K9kcegtoJmvfDzPdKh+GZU6YZGGJze5pJkJVjhfzcd4Mc2YU2re4kna4
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 028tthY1i0h/JNOt3X+QEEQwHFcqeQRf9FBFZylQrlvvdDvZFILVm2XKi9ZUv9wnP/4z49YpEl
 MsGbwyIoWbuooyc6HQqY9Gi6tg+Y01kg3q0estmv3rLR663lcq092UvKZl17ct/LR/gekMXK9K
 rEO7TL56whGAvcUUhXxp+qD010woG1dLmanzd0/fAWaipdWF+ekDQW7Wv5Cinvkncz6jMUuCyX
 H4OSW0kerEQXWGkNDEUblySXHcn/tw3FKp7VgUmOBCDli701CkRCFXaw7R7kDEOh9cQiTKaGCv
 Z1JawnNPh5LizNun/wFvYKuu
X-SBRS: 5.1
X-MesageID: 66251363
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VuD+yq6TlY11zgSjxNbH2AxRtCrBchMFZxGqfqrLsTDasY5as4F+v
 mNND2nQb67ba2P3fox1PYq08BhSv5TcydYwTFBu+CxhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29cw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 okWq6WbGAgVNZaUkeQMD0YCODx8IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmlq25kVQ622i
 8wxOBxBUwrpbT5zCF4dIbRiv8rzv3umbGgNwL6SjfVuuDWCpOBr65DTN97Sds2PVN9itE+Sr
 WLb/Ez0GhgfcteYzFKt1XahhfTGmy/hb74DD72z9vNsg1q7y3QaDVsdUl7TidCjlkO7bPdOJ
 EUV9zQGoLA78QqgSdyVdwexoGOA+AUdXdVQO+Qg7UeGza+8ywyUHHQeRzhNLtkvrtYrRCcC3
 0WM2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85jroSttgC6ezgsfCMDf82
 S2RrCM+irMQiuYGz6y+u1vAhlqEpJLEUwo07QX/RX++40VyY4vNT5ez9VHR4PJELYCYZlqMp
 n4Jn46Z9u9mJZOQkC2ARs0dEbfv4OyKWAAwmnY2QcNnrW70vSf+I8YAu1mSOXuFLO42JWT3W
 WSCtj9a38daPGr2MvVcfoCuXpFCIbfbKfzpUfXdb9xra5d3dROa8CwGWXN8z1wBg2B3z/hhZ
 M7zndKESC9DVP85lGbeq/I1jOdzrh3S018/UnwSI/6P9bOFLECYRr4eWLdlRrBotfjUyOk5H
 js2Cidr9/m9eLCmCsU02dRKRbzvEZTdLcqnwyCwXrTdSjeK4El7V5fsLUoJIuSJZZh9mObS5
 W2aUURF0lf5jnCvAVzUNiw+Mu6wAswi9CpT0ckQ0bCAgSlLjWGHtvl3SnfKVeN/qLwLIQBcE
 5HphPls8twQE2+aqlzxnLH2rZB4dQTDuO59F3HNXdTLRLY5H1ah0oa9JmPHrXBSZgLq5ZpWi
 +DxjWvzHMtcLzmO+e6LMZpDOXvq5iND8A+zNmOVSuRulLLErtQ0dXyr06NfzgNlAUyr+wZ2H
 j2+WH8wjeLMv5U04J/Og6WFpJ2uCOxwAgxRGGyz0Fp8HXOyErOLzdASXeCWUyraUW+oqqyua
 f8Ml6P3MeEdnUYMuI15Su45waU77trphrlb0gU7QymbMwX1UuttciucwM1ClqxR3bsF6wG4b
 V2Cp4tBMrKTNcK7TFNIfFg5bv6O3O0/kyXJ6ahnO13z4SJ6peLVUUhbMxSWpjZaKb95bNEsz
 es74ZZE4A2jkBs6dN2Bi3kMpWiLK3UBVYQht40bX9C32lZ6lAkabMWFWCHs4ZyJZ9FdCWUQI
 2eZ1PjYmrBR5kveaH5vR3LD6vVQ2MYVsxdQwV5ce1nQwojZhuU61QF6+CgsSlgH1Q1O1u9+N
 zQ5N0BxIqnSrT5kiNIaAjKpEgBFQhaY5lbw2x0Ck2iAFxukUWnELWscP+eR/R9GrzIAL2YDp
 LzImnz4VTvKfd3q2npgUEFonPXvUNht+1CQg8ugBcmEQ8E3bDeNbnVCvobUR88L2f8MuXA=
IronPort-HdrOrdr: A9a23:8T0ED6qT0wL8BuXBMvC6pPgaV5u8L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6Ku90dq7MAnhHP9OkMMs1NiZLW7bUQeTTL2KqLGSuwEIeBeOu9K1t5
 0QFZSWYeeYZTMR46fHCUuDYq8dKbG8geWVbIzlvhVQpHRRGsVdBnBCe2Om+yNNNWp7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpDWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1+cJi+EzSvBkuPJlagkEuTzYJ7iJbofy/Qzd7tvfqmrC2+
 O83ivId/4Dl085OFvF5ScFkjOQrwoG+jvsz0SVjmDkptG8TDUmC9BZjYYcaRfB7VE81esMmZ
 6j8ljpwKa/Nymw6hgVJuK4JC1Chw6xuz4vgOQTh3tQXc8Xb6JQt5UW+AdQHI0bFCz35Yg7GK
 02Zfusr8p+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIgUn2sG9pg6V55Yjt
 60ephAhfVLVIsbfKh9DOAOTY++DXHMWwvFNCaILVHuBMg8SgbwQl7MkcAIDc2RCe01JaoJ6e
 b8uQljxBAPkmrVeL2z4KE=
X-IronPort-AV: E=Sophos;i="5.88,361,1635220800"; 
   d="scan'208";a="66251363"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evmNfj5J9athv/Q/MAnV7/PHE9GU+ldOFkQc+Q+YKI9q8tPdqachrlArfdybyw3U0ZSjrM/RfYitXNc9tf+BIEaPjpywV10vwQrXupZZmdJQjPcTluJWfuSiS6ksSvSymtgx5PFqXkFHVMQvGFTF0W0/y4DMGwoyAQdM+j+E0/ZsWIsmAzjF7Sp8f0ahbLYnUdIlJaxS+Jz8XYioFdLsLEK1YN0dVjKZAaADmCDsDopnIWPtG39MYBjNmHpg9/C16LYOHx/+Pv6/Z6KGAWRlaDqC9OzVUcQ5Q9YWXaDSq0LKv5wtJvwAAfGkP9mFGHMyojxiNqIQHfNxUu4uGSV77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgKdJrADDx7vLgciLHuGqrjnG5eQrRWvFKfaM1dzUKY=;
 b=Tl4WEtRHsVykSO3PvfnAeVftRfLkr8aXv0IPzeWoSLtp8RLHTtIAKL5IbDZlHcNIoeKCBB7YVZ/xPfn9eWvRuMnP0nNeAEQPSXJGGPJzbuVaHYXpJjrFbb4B5vc2hzb6SIxI6JFgt+DkaMtta3+sqp3DaJA73WF3FWgBsGhOzR4CsUCWTjFhGBzf2r8gF/fb4hRpZA4dTle9k3wVynYx7D4CDN4XOUPjRdm0WJnKlm0Xm3nqhb96/PNblyuh38mrmTCAyyvzzHhvw7VmQHQ4m7rneOaiaAXtgZhius46Ld7fSZXUEq7sqrBWoH01AzypBs4wtT6GdIbwLzOLRzMykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgKdJrADDx7vLgciLHuGqrjnG5eQrRWvFKfaM1dzUKY=;
 b=Zi0QLNrTuCoONlJ4Wkz2DIbxGPo74sofgiua1WUuFhxAsbUoe+cqSUeYd+okHEAJnNPOfT65Vsats4fLJlAk0yXE7Wvfvz2dHDRNmqxC2IQ7nPNU9SwgFkhuyVNqY+X3ic0WG/LacqDfpnoKs0PSaylQWkUtbG0eOVqnBUxmTdM=
Date: Fri, 11 Feb 2022 16:44:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Message-ID: <YgaEQrqIEPc258Fy@Air-de-Roger>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <1dbd0f54-affb-1e67-215c-6e6c8fb8535b@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1dbd0f54-affb-1e67-215c-6e6c8fb8535b@epam.com>
X-ClientProxiedBy: LO4P123CA0351.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89f04d0a-1153-4b01-5e2e-08d9ed755718
X-MS-TrafficTypeDiagnostic: MWHPR03MB2462:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB246216286C87BD780EBCE76D8F309@MWHPR03MB2462.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ep671u9f9pgFMQJuaAgL8qj5ORbtOy2WhBmfZuSeX7//jY2yWWenF/kGi0S3dfqbcVF+7Pyc5iAb17wLUCmwUUWwVO1S6fMQLa3qZN18wwvrrPFEX8lnCJPw7Gg5J0NuDtKiPB5E/P3+eMJ8vZarWL9+z+IhdalZ80uCIylWzpqfEo5DTIdKuH13CrokqPyQ5ASZpQpW8qyyMCRi+n4kKHFCCOXaOfdYYr5E+MM0vIWYmOyp0kX/Y+DOoXR4LOUOIEQd6TxJXZRXBos6u1DIAR8sddFzfjGd/HsTFiMyV+CpuNuy6kilEK86niTQnFZda6PaTTupzxMb3ntO7wvgi5ePBa1/n7wJlBmR+MblhcVZLHI13pvp9u/xmuDxwdt+3xgFxARoAYvZPe6Me9QJ57Un3Rx4hMH5ToOrET5smftWl3LBhBtHdjkXPpaizeSaHX7NEnOMCshzSZlzNQXWM48sBIl4cyQ7cdnks4vB+fXu8OpQBnLIcE6SfZc2i3cUZpa+1JwA4KBPH51WVIOVqk6Ud/7m38Nqj3MpD/bwupqVDhSGa6z346ENyc1HFUKpDEMDcq6b61k4DVpW1doRuxqM7x6vkr7iFnYg93qkpBoPuDW4REqeCIfVVKQNSXpKAdjBLlNG27evitB0YCOS/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(83380400001)(186003)(26005)(9686003)(8676002)(6512007)(4326008)(6666004)(5660300002)(8936002)(6506007)(66476007)(66556008)(53546011)(66946007)(86362001)(54906003)(85182001)(508600001)(7416002)(6486002)(82960400001)(6916009)(316002)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzVFWVdNOFVYNmVXRFlKbHlvMkk0VGFsSnR1MVBsKzBIUTdRM0xweTcvMDJD?=
 =?utf-8?B?bzAvaU9Hb21FMlZXTTlsQm9KSEZIVEtXQ1Y4NjZrb1kydjdiQUdqNDg1N0s2?=
 =?utf-8?B?STZObVhHZ1NlSnFaL1pyTzFZMlNoc2NzUzZNQXZZemhsbXhiN1JMTzNhVlUx?=
 =?utf-8?B?cDI1S0pTTFMyVHdZeHdIRjVzbExCMll0VWs1UjEzbFp2cmM1Tm5nZGVmMW9z?=
 =?utf-8?B?QWF3UzV5cldWTHlyZlgzRFpWcWYzdzJCdUhIQ2VhSmEvUWZON3F3dWRVOTBx?=
 =?utf-8?B?T2tzeTBvaUtydWJscjNZYjRIRk5ZcEFRV0tjcDVoS1NnMTdidko5T1V1QWpu?=
 =?utf-8?B?RThMSHE5QllKUTlaYVpDay9sdFJBZE05dnMyZFZGZVY0KzRJa3o0VXUvT3Yx?=
 =?utf-8?B?Mk1nSWJnUk1CWFBxRk8yV0xvdnV3NDhjcW9BYmJFL0VuckZPRTNRdk1EZUFO?=
 =?utf-8?B?b0lqbkJYZjd2Uk9Fb3dSS200RmNXcGhpcnBsSWtJa3pQMERpZTd4Qm1DdTVu?=
 =?utf-8?B?aEE3dDBDaDYxY2lOVUI0dmxodUFiRUtqNS9CelFQYm5zUUlvT0ZPc3Y3Ullx?=
 =?utf-8?B?N21BWGU1Ylc5TDBhMWRpdXR0SjZNaFkvb3lycXB5QmphVk5UOU1FR2NUeTNs?=
 =?utf-8?B?ejlUTGlHc21ZellhbzhSU3VhMzBFaTU3SnI2eXE5a2xpMzhPeVlTSWJwUHN4?=
 =?utf-8?B?SVJadDZDZ0lidmRHUUExMDBjTTlyb1lhNVJmYnQyNVMyUWI2dEFNeHdOczFX?=
 =?utf-8?B?TksySVdqSSt3NmI5OC9CUEQ0bGFZamZCVTBuTHppTEM4YkQyR3dRUWd2aWd6?=
 =?utf-8?B?QzRMWEJGcnUwVk5YWTRFMHh3clVmU1ZIOGdPWlBlOWtWRjRnZmhKOHFkWm45?=
 =?utf-8?B?bFdRdTJaWEJMNjcrbmJOM1FRYzZPUnFqK2Z1cmMyOWp1TnNHUzFZQm83NGVM?=
 =?utf-8?B?dXlaQWhEdGlFaHFzQVpPQ2RkckNIbWdIZkQyWmJ1SklnL1NYRFFnYTRneE82?=
 =?utf-8?B?N1B0Z0dwNkNvUGlQNXlXQ0N5aGE1Vm50ejhRODhHUTJEOElrZkVoYVU2YnNn?=
 =?utf-8?B?c1J5VEUycTM0cWt1bXFBWmtoNUtVY1BSbmZNUnBSaEFwNXZrSXE3cjZxYllT?=
 =?utf-8?B?Q1RieVFISEVoRVUwUmdscGRJNTVDZ01rWCt3d1k4WVdPcWF0NmJENXY2TmFO?=
 =?utf-8?B?WWx1TEROM01IYVFnUEp2a3lwaDdUV2VmSVFyOEdVQTRVRytVL2lUd0h6clpr?=
 =?utf-8?B?SVRGc3VJMTNLYVlaYXUzeEtRdW5tZmtVYklmMXdJNDc4YU5kWjVHN0lZNEJR?=
 =?utf-8?B?UzF2MFNDWkJ5UjJoNGlSU2pLVHhjUnFXSjUzemNhd2ZRcmdYQ2lTdS9yL3B0?=
 =?utf-8?B?Nm1mdWdXU1JjOExTM3Y3eGJtcjhsUzZJdTZaWFlmcG1OVis5ZVNLWFUrQ3VM?=
 =?utf-8?B?NVBWcjd1Y0xJanVUSk14MWcxRXExcjB5U0JNTlp3bzczV2tXcnZWeWhXUnQ5?=
 =?utf-8?B?Yk5ZYkVWRmlTNVdHdmpZWUFIMDdyeEdrYWNmdlpORDZUNGJDQWlRamtmUUE0?=
 =?utf-8?B?bWxmRUdoWElIWGM3eUlQS0drVUN2V1RUTGZZRXdJSXh2Mm1mbHcrOVVFS3FN?=
 =?utf-8?B?Wnhxc3Q1ZDZ6QWN4SUtGUFNsRjRTSHJuSFgwcWQwNWNVeHZ5U2FpRlEvb0Ix?=
 =?utf-8?B?VEVvcGZYQzVHalhaTjVLY0pCUlpicGttSUlhTm15dnRkMU83am8wRjl2Y2s5?=
 =?utf-8?B?ZnlwdXRhMWlQUFVJWGtlK25LRFB3cm0vRWJkU3ZkMUFwQlk2M0tlNDF0TkM3?=
 =?utf-8?B?bWRlWjMvMS82M0FNR2JWUEpoMCthbUQyb2Z0QkVJcjNZSWlxKzdMVUViYlVC?=
 =?utf-8?B?Tm9IbnpkaE51U3lYTnArL3lTNlZsTzl3bGE5c25FTUxTZDdZKzV2a0RzRXNm?=
 =?utf-8?B?V0pVV2gxaHYzNHBZRjBYZ2h4NGtJRkFLSlpjQWYxSkY5Y0xsY0dDa1N2eW03?=
 =?utf-8?B?U2RyU29TMmVoaDBhRitjaDFrc3JlRXhnTzRPNUtZVVJyMDNZZXM4b0hIekYv?=
 =?utf-8?B?TWROVCtUWWhmNEI4a1NlZThkVjBEYVJTY1dUVXdZMmlWaWRhZjkvUmcyeFRI?=
 =?utf-8?B?dnN3a3ZRVFhIbVAyMnZCSnlPK0NLK1p4QjZ0Z2dwMFJwVG9GK0lLczIrWVNN?=
 =?utf-8?Q?tUot7LIO17gnk0QKjmx5soo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f04d0a-1153-4b01-5e2e-08d9ed755718
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 15:44:07.9681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJOasxIqPaYJqwajZ2WC7Vk19Mnf4VbsmYe4qxB8XREpiTTbQbqy4P/5A5ngLSNAqkT6YaY/ShCHPiFTbV83Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2462
X-OriginatorOrg: citrix.com

On Fri, Feb 11, 2022 at 12:13:38PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 11.02.22 13:40, Roger Pau Monné wrote:
> > On Fri, Feb 11, 2022 at 07:27:39AM +0000, Oleksandr Andrushchenko wrote:
> >> Hi, Roger!
> >>
> >> On 10.02.22 18:16, Roger Pau Monné wrote:
> >>> On Wed, Feb 09, 2022 at 03:36:27PM +0200, Oleksandr Andrushchenko wrote:
> >>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>
> >>>> Introduce a per-domain read/write lock to check whether vpci is present,
> >>>> so we are sure there are no accesses to the contents of the vpci struct
> >>>> if not. This lock can be used (and in a few cases is used right away)
> >>>> so that vpci removal can be performed while holding the lock in write
> >>>> mode. Previously such removal could race with vpci_read for example.
> >>> Sadly there's still a race in the usage of pci_get_pdev_by_domain wrt
> >>> pci_remove_device, and likely when vPCI gets also used in
> >>> {de}assign_device I think.
> >> Yes, this is indeed an issue, but I was not trying to solve it in
> >> context of vPCI locking yet. I think we should discuss how do
> >> we approach pdev locking, so I can create a patch for that.
> >> that being said, I would like not to solve pdev in  this patch yet
> >>
> >> ...I do understand we do want to avoid that, but at the moment
> >> a single reliable way for making sure pdev is alive seems to
> >> be pcidevs_lock....
> > I think we will need to make pcidevs_lock a rwlock and take it in read
> > mode for pci_get_pdev_by_domain.
> >
> > We didn't have this scenario before where PCI emulation is done in the
> > hypervisor, and hence the locking around those data structures has not
> > been designed for those use-cases.
> Yes, I do understand that.
> I hope pcidevs lock move to rwlock can be done as a separate
> patch. While this is not done, do you think we can proceed with
> vPCI series and pcidevs locking re-work being done after?

Ideally we would like to sort out the locking once and for all. I
would like to be sure that what we introduce now doesn't turn out to
interact badly when we decide to look at the pcidevs locking issue.

Thanks, Roger.

