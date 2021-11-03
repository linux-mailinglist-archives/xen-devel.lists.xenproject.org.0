Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838D444200
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 13:57:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220889.382325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miFpP-0001R4-Ds; Wed, 03 Nov 2021 12:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220889.382325; Wed, 03 Nov 2021 12:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miFpP-0001P0-Aj; Wed, 03 Nov 2021 12:57:19 +0000
Received: by outflank-mailman (input) for mailman id 220889;
 Wed, 03 Nov 2021 12:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXy+=PW=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1miFpO-0001Ou-6t
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:57:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d86d5e29-2550-426d-840b-4e28c890a4cb;
 Wed, 03 Nov 2021 12:57:16 +0000 (UTC)
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
X-Inumbo-ID: d86d5e29-2550-426d-840b-4e28c890a4cb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635944236;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tHBYuh7t2F4E+jyZHh2FingL0z/K6T02qyeDunMTkCg=;
  b=P+9NtEY4qVVGb5P5XetR06gTlK7BoAtWUTzehEIVqWR+ubG50YPuT9aV
   a865HqW66XJkLKAxnI8hP8i74dx+945l8/LPGAVSoSKCvLs5KfbyjAxvT
   lMHu8ajI92SOixAckfdXlSj0WKNX6JvjLkda6lwJz8pJ9he5DWe972qan
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ym9en7AL96q1/tlI9Pes8pc+92zDTQATcF5cxVpqo/oDVfx+ZDPuTWGsNoHFLfyAqUxTdOEYvc
 /5XRfX+styWUWaKV/fr641IqpjZYBFPv3/xn1cfg4Inn0CvJ9gjspjMdIo+ZIPUq0YM2INYptb
 HU/aYlo3G6knB8G3XF7BW+thYOeqGOK0uvEJe5h6OvAI1k0D9qxhw4aJ7BiovKdpXLwY94pjZc
 D8vbgnpwgI4CKQXeGVJ9CP1yS3WVL3m24gpEV96NY39OfPyKmYm1zNzVV+kT1T7nD4zYjVgetY
 kcl1rmHVXjXNrHbJg7ScPVRS
X-SBRS: 5.1
X-MesageID: 58911476
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OzUGX6s7MTDGaQpKA3nIDAdPT+fnVNxZMUV32f8akzHdYApBsoF/q
 tZmKW7SbPaDZWvzKd4latnl8hxVup6GyNYxTwQ5/Cs0Qi1D+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpltJeaczwCb6D3hN8NVDJ8EyF5J7UaweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5tAMGYwMnwsZTVzYVEPDp4R392GoUmibxt7rA+XrvoOtj27IAtZj+G2bYu9lsaxbcRKnG6Iq
 2Te5WP7DxoGctuFxlKt8Hihm+vOliPTQ58JGfuz8fsCqEKX7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0Ud1aGfx85RqNzqfR6gCxCW0NTzoHY9sj3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxuzMgIvFkRTaBQYdhsCyP3joIYplk72G4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAsACDtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRzxpBZPnqgKuVmSwXuF1O5eJ1cFh
 2eJ6GtsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeonozNRHAgTi3zBhz+U3aB
 Xt9WZzyZZr9If8/pAdaus9HieN7rszA7TqLLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5TPb9q
 L5i2z+x40wHCoXWO3CPmaZKdAxiBSVrVPje9p0MHsbec1UOJY3UI6KIqV/XU9c+xPo9eyah1
 izVZ3K0P3Kk2SaccVXWMSs+AF4tNL4mxU8G0eUXFQ/A81AoYJq17bdZcJ0yfLI98/dkw+IyR
 P4AE/hsyNwWFVwrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:/KT4+akb7DdB3YkRXAe1OcsMnD3pDfO8imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IObuEYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtJdBkVCe2Gm+yVNNXh77PECZf
 ihD6R81l+dkDgsH7+G7i5vZZm8mzSHruOqXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6S60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKcQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOifx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Ss1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgv/DWVZAVwIv66eDlGhiTMuAIm2EyRjnFoivD3p01wt67UEPJ/lq
 P52qcBrsAGciZZV9M6OA47e7rDNoX6e2O7DIujGyWUKEg5AQO4l3fW2sR/2Aj4Qu1D8HMN8K
 6xJ2+w81RCIn7TNQ==
X-IronPort-AV: E=Sophos;i="5.87,205,1631592000"; 
   d="scan'208";a="58911476"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDmWvCZSV4j8xtLDGpvjYEt1ARbqc2F4gr60dhhTaFrdNdOknYJPPk4d0lWUAGQZ2aIczwC/WvvDOZ1vFPAIlx+2xwftYxtbjN5X9wxV60afkEkscuyNYRZvcSQeO4XccTsNjHOFLeZmr8+m+WTBAS5tOi+thoXYnLkATFzHJK21Qpb5ZIi9W1ALAKwGE582jOI3da3SUOYPNRooTmXCzQBJNhRo5bvTbTh4OrxEKhjHKE/QwLCgXHqhBCznSQdFMeRAgyjAjbGxO5ojXDPVvhDPaAb9hmomUkGBWOxSqUAg5tP7DbynTlWb6Mpoui6E3Ms9J1nfceu5NO5QITe+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WoxbEitlizOc+uNhuQlrfGu8piRhbo4zk8G3aoBw9w=;
 b=RLZVnfb5E7+XYSjnQhG5Bl0Yv47aY3lFjranhUIjElOlcLtUdRZuJfZ+dgNoKgnWoxCHVvvbHYTBtoaqca5ALrjeaL/GJOyfyjHLwIZfFydk6VEY/f1lzcmfSofs1lk4BVL+TXsKuyYCCLqBCAIfn0AcX+E/AoLIMCxNZKagz3fIxT61y3ENknpvx1PHLo0HX0tQOUkzngtlfS0wZVCdytWZlefJNYOSrbibY/ADicFsPO9vsfGk2rt/HOSu4v5kuSBmS+Hy8++QN1+8LrXRwG5RfIbhclk5pnI2D+NZw4Pq/Qsd7ZToRSfjR1EWzN2pBWLzRbrJt8b6wK5NrTwIIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WoxbEitlizOc+uNhuQlrfGu8piRhbo4zk8G3aoBw9w=;
 b=mvslVNtUj/cMhMzotz4DMU9BqtMDSxXx0uxA1zrMpPgbwxgciJXIJLDnGaQFUOjgmYTS2NbVPbwZ5cGWt5724GFijhm7x/6cR2Yy73+bEuPrG3G+4UAB0HkcNsg+/OTFnjnK20ZknirnpjQYjujddskfMRdzJvPZ4eU1LItkGFk=
Subject: Re: [PATCH] x86/traps: Fix typo in do_entry_CP()
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Bobby Eshleman <bobby.eshleman@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210928210014.27954-1-andrew.cooper3@citrix.com>
 <3408f175-d71a-267b-515a-972b3ed8c4e8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <519bcaac-cc32-c1d5-8f01-34318ed398ca@citrix.com>
Date: Wed, 3 Nov 2021 12:56:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <3408f175-d71a-267b-515a-972b3ed8c4e8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0105.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eaec0cb-ab78-45f8-f956-08d99ec97008
X-MS-TrafficTypeDiagnostic: BYAPR03MB3429:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3429DF7F30B52A9965BEB3E8BA8C9@BYAPR03MB3429.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WuvSE2wTSqR0JUUTRg+yXgUZU3zE8sJcGZd5SliHoYY1ChstBMLtFHKZXPgimGgZsbnXYCpJxMPTEtzEDNCZFjqCB6F5PB4S0foMrJHmT5V/+u38nswo5XGEqCbnRFgV/OkFQmzoPqUESzvUWKhCiDodq51A6jUNsI6sSORKIxciz9AKqePUlzCZQXC9IEYstdGXZe0DTS2Goa7MnLFiCrpASJ1mu+JHh/Xga1RZqzofvsVUzashOkCI6sGftF41f5KVtCSBwng2nU9xTTIYMQmTLMpX47+WzowS8LzvhFgGHn3HkAdDleVJB2KpI3MqhhYeUvBEf6GitzWr+Dhd/fHk7euD6uZgs1mTHWhAdMbCs0XGIK+cM50XgJ1xDgakOpPGUw+PvAkza2DP4WTLEG7IEoYlE1DpduxBf8Zxu714KYPqJiMjP2MuAzbCsYNfE++K4Twp7fNQiWLuNWq+IYblrvlxh+hyh/Q2vUxuvE/vIAv87yShwWFu4wzFtcdp6qshfkmFlCGRL4cri8DlrAul41DGQDEQHqm8EPdd9J9+1SSJ5yWO7e5TwBHbjkw34BO9IhcTN/hXAM4cwDbZj/ddMF7BpnLOjzt+sLwv/qadZeOT/Fn/Um+ro4iyQ8GZf9+AumTSbd5Un6CLRBiMUieXUbsC6gkHKjxTIiDc6kLe9Xl9IT6ig1xhBPmhu6TXY72B6DIap9G7NhEMYwa+OGrstOlZr5d4/OZakwic88CCizB3voO4CiuztwdR6RV+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(26005)(31686004)(66476007)(31696002)(8936002)(36756003)(956004)(4326008)(5660300002)(86362001)(54906003)(8676002)(2616005)(6486002)(66946007)(38100700002)(6666004)(2906002)(508600001)(4744005)(16576012)(53546011)(110136005)(316002)(82960400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2tuK3NZR1lzbFJ2MTlaRTF2dkRldlBBSUcwREdaRDBvTzJneExMRjhad3F5?=
 =?utf-8?B?ZlEwdkNBZ20xZzlUMTQ5dUZMVUllcHc4SHRRMzhGTFIvSVN4R1Y3KzA5K2Z2?=
 =?utf-8?B?eHh4WHU5bXZIaEl3azkzU3NZb3VHYjRQVVhoUDNlZFNtcVhvQ2NZc1hobDBz?=
 =?utf-8?B?bTBoQTlUMjFXRzRtQUsySnV2d1piOUxUNDhZVU8wSExXUGpDRi9UZU1RSEd1?=
 =?utf-8?B?d0U5a2J4c2JOWVB3TVdTN0RNR0xxaERQOGh5WkRVSmExQ29IdHdiOW5maTNW?=
 =?utf-8?B?cGVXL29ra0lOckdSNHdScFpXZThQQnI5NFpCMXFHbWpGbUJNZFZFblBSV0ZR?=
 =?utf-8?B?bU53ME5yYzUzNHhpR3BySUhIdXg5L3VBYW16S3BJK09TazU3SEMrOTF1SHQ1?=
 =?utf-8?B?VnhleGhCMVhDSEJVVDlDUytBbUh4ZTlieXpLKzB4UEhJdnFsdWp1Qjl3elRz?=
 =?utf-8?B?cTh6RTBJSUM5Y3pwL1JJRGhWQzJiTEV5Y1VjdHNLMVo4YklrSWlsMnFoQ1dp?=
 =?utf-8?B?SW84WXlVb0pQVEkzNWNtOVdxUWR1WUNLY2lENEsvdERad0JXZkRWZ2d2ZDhu?=
 =?utf-8?B?WVc4Wlg3RDFJN1ZXL1A3RTNSbHVoK3doQk5jSDVPWlJ6ZGo0NVcvOGRYdnNq?=
 =?utf-8?B?MU02UTduTXdYRjBNUTVFUU1IckFwdEhzRDNHZGZQcGNlTE9xZ2FGN0MweXk2?=
 =?utf-8?B?KytRNktOdHExTEdIcHpZTVN4ME52ZjdFWnFmT1FGZWpQUXp3cTZqajJ6RFRY?=
 =?utf-8?B?dTVaaWozT2xTaHFyd3N5NmZvYnBFalNGZ2d6dmdhYVZHVk5FUTg1MmJsK1Y5?=
 =?utf-8?B?Y25MU01lVWNpekNWbVhsMXk5bDdmZWRqVGhKdDJsRTVnV0hSNVgyNzVzZGFK?=
 =?utf-8?B?SkpyWDRIQXdNTk1PTVlDY0RiekhDakZEd05qaktDZURXc1lvV3lwcm1qU21C?=
 =?utf-8?B?akJrSEFSaDkxSVp3eGNUblNHWVRqZytjVC82b0h6bU9sd2lJaGdxZTRjTFRq?=
 =?utf-8?B?enRGNGhlVmJ0YnB1dDVFRUFZYzhybDBUMnh1Rng4VUNla0JmMU9sZy9CYlpy?=
 =?utf-8?B?MjMrVW1pUnpDRjFVTnpxT2RyWEw2S1I2TGljdG05RGszYWY4eG5sVU51Sk9I?=
 =?utf-8?B?d2VuRjNNSlc5aklRRWJFTG12RVMwMHM2NE0yVmx6aUN3NFFTa29oNnRmYzNN?=
 =?utf-8?B?Q21ienN3azd2aTJlQk4waUhWUlRJWDEzbGFRVlh3OFM0UkJ5Q2tPaFNtbUEr?=
 =?utf-8?B?ZG0rU1Y3NVhSUDB3cnpEemVtSmlqRmZabXZlVnR3UnBab2hvSVBwTlhiK0Jt?=
 =?utf-8?B?Q01YdTFDQkUrWW9nZmdUUlEzdGRDYVBxeW1FSkNvUEpRVFVsYWltcVdsa3Iv?=
 =?utf-8?B?RENEMFVIWjZWTFNQM1dkZFoxWkNxLzF0U3Z4NG9Yc201dFdIcGRyUDZwVmZh?=
 =?utf-8?B?MjhjYlJCK2E1c0VrZThxZ292WUNHb3JUaEJybFlvZkRDMmptUEtiemtnOW9q?=
 =?utf-8?B?eXo1T0doUlQ0bDFmYUw2bm9xeUNVbE5IQkJWMHR3L3pCYU9FNVI0YkhpZ040?=
 =?utf-8?B?Y09wOEwxTkJwd2IwRkV6R0xyaUR5TG1CNmxBSVhNNmcwdzl0L05QYVB4MUxV?=
 =?utf-8?B?RDFucUhrbmh6UjhLQVNxdDlqbnYvd3g2bkg1SEdiQU5Jb1c2YzRINlhma0V0?=
 =?utf-8?B?Qnl6NzBKbXNYeU1heHNsZENHT25OUjNvU1A5dFVod3g5SExic0QzQlZ0OUF4?=
 =?utf-8?B?KzhVenpLV0VDczZwUE5kZWx0ekZDbkdUMXh6TmhyK2JBR0VoQlFHb2tuUTVB?=
 =?utf-8?B?a3JWSFJpREM3MXhWYVY3b3VpQUJXWUdZcUV3MXdIMnVuQ2k4QW5Yb0FrQ2VF?=
 =?utf-8?B?TThNV3h1b1pidlk4aG4vc0FuekdFTHVNVFFFMGRWMThTNjNlYU5pajgxbDdN?=
 =?utf-8?B?NWtjYkVLSEZucWJXc3BaN0lxUy8zRDBlMnhuWmZaMEJCRXEvNUVHSFhyaGM4?=
 =?utf-8?B?NkZ0cW5DbGdhbUM3RWI3MFNnSTdrcE5ybVVYT05nUmxBd241S0V3eVd5VGZZ?=
 =?utf-8?B?Zk5Yc1NKYWl2NG9XYUoySEZYUit5UmxjODZJUm1ZSDdFNE5LNWVEOFVUSWVa?=
 =?utf-8?B?VXpDYUVSZDZ6TmhoNllmZ3JtU2taQjNHQzRBdG5UcXZPVU44ckNUTUhQWDQy?=
 =?utf-8?B?bEdlTFhWT0ZGZUlqazl0LzhreHBhbnNZWGJVQmViZjNhckxneEZwc3RrQTVU?=
 =?utf-8?B?cUQzYmFxa2hOdTRFNmpQTXBORTF3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaec0cb-ab78-45f8-f956-08d99ec97008
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 12:57:05.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RON71MLKZdrPmRmakWfMXQZLhbN7Efdsf95IvF5O9IfUdg89bmk72rHP7605B/drJJw6HimhFoH8tCtq2LUoOMG/S/wpPjMkiSr0QsPTtr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3429
X-OriginatorOrg: citrix.com

On 29/09/2021 09:07, Jan Beulich wrote:
> On 28.09.2021 23:00, Andrew Cooper wrote:
>> The call to debugger_trap_entry() should pass the correct vector.  The
>> break-for-gdbsx logic is in practice unreachable because PV guests can't
>> generate #CP, but it will interfere with anyone inserting custom debugging
>> into debugger_trap_entry().
>>
>> Fixes: 5ad05b9c2490 ("x86/traps: Implement #CP handler and extend #PF for shadow stacks")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>

It turns out that I forgot to commit this patch, and it now needs a
Release Ack to go in.

It is very safe and obvious.  It is passing the wrong constant into a
debug function.

Luckily the impact is benign due to other properties of the logic, and
would only cause problems for people adding manual debug logic.

~Andrew

