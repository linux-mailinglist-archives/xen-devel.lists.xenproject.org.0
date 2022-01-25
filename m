Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA5D49B754
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 16:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260475.450005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNVp-0008R5-3N; Tue, 25 Jan 2022 15:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260475.450005; Tue, 25 Jan 2022 15:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNVp-0008PB-0D; Tue, 25 Jan 2022 15:13:37 +0000
Received: by outflank-mailman (input) for mailman id 260475;
 Tue, 25 Jan 2022 15:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCNVn-0008P5-8Y
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 15:13:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bfe7bc6-7df1-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 16:13:34 +0100 (CET)
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
X-Inumbo-ID: 5bfe7bc6-7df1-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643123613;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=p81UJp1oazqxZkcl7WH8cxOy0cBgZGst09qbiAwyewU=;
  b=Mb1TgIfAiqFgpJso8sLcRBwGFzIhiKcmwSPYp1psX0Xal+OOUaSZCRML
   5IEbJRFd2vI8C1O/aPXLih/3QG8uaOPZHAx0SRe2eFghnLrzJLPHWj3yB
   R0j7PdPzRlSjJK+PucvBVj7nKhbiX4b3IUxn1+ATfcVC684AQejN7YluC
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6aaHGghgiBzo3QR8b1R0jS9CSVAZh0hHeA/KrxBj53J/ufLeqMwcTBv0UcimNNOi+91/Mr6jZ3
 mfrlOIr/l0waQFjAdeHqJasi+4zvp3qGs7ZctsCDNRVapIYjXQ1j6QnfBLwOW7sPUZ4arVNdAO
 rqwEAaGaG/l1c/DkK1XB1OAZXV3c4QvkAjl67jN1cYPfYLM8kr9p4xbP3QUO9ARchBE1ig0kKZ
 2vFuZW5Jnjj/HY9lvRM34tn8IAXr+Sr9hngW2ZWqEdupQzPHUzvGEf0h8iWW6/WAm5sFs83zoN
 pkeLDW6WY+DZM8dEk2tqu5va
X-SBRS: 5.2
X-MesageID: 62719314
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NlNmUqK29BsMDJ+HFE+RLJIlxSXFcZb7ZxGr2PjKsXjdYENSgj0Dz
 mYYWjzUOPqOYDeke9glboizpB9U75+Byd9jSQtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Pj/909
 foQjqacTFcQH6bxhLhDQiRHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uv4ABjWxp2qiiG97nP
 ZcbTQhVfC/ZXB1hNEgPUc0hvKSR0yyXnzpw9wvO+PtfD3Lo5Bx81v3hPcTYfvSORN5JhQCIq
 2Te5WP7DxoGctuFxlKt/m2pmbXnnCX1QoseGbS0sPlwjzW7xGYeFRkXXluTuuSihwi1XNc3A
 1MQ0jojq+417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKywCJKW05YWN6UvAj5PYXTgE2i
 gGYosy8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBj3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEwHpU
 JsswZH2AAUy4XelznDlrAIlR+nB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGP4lsNtcAMYir7Ncebhr5d7exwkcAM8vy+DpjpgidmOMAtJGdrAgkwDaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPLFd8tbQXfBshkvPLsiFiEq
 L53aprVoyizpcWjOEE7B6ZJcwBTRZX6bLirw/Fqmhmre1o/Rzp5WqaPmNvMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAghDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:JFRqcKDcak5d3V3lHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dC/DDEytHRuQ639QYTcegAUdAH0+4WMHf+LqUgLzM2eabRWa
 DsrvZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolCs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REIGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUETwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJu3fwivZv20voz6hNO6Ws0d
 60R5iApIs+P/P+UpgNd9vpYfHHfFAlEii8eV57HzzcZdM60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="62719314"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6dpwWH7AyLfZvbtp9a6nKFPDOPwQ8LHbzMD8mXQZVHiI+nOU2BMFmKeifwyLL2XLHCZG4TbUx0USEDchR2sfpG2525xwecvkyZxsybF5+56MqDYuaToszhxZFcxsYfvkx8V9FAaXxFWp4uZenGQ0eSjAMsa1351+s841ycgQxwHeCTLNtKNK0fibj97DA2RN0L1UAvCl4wlJH0h+2IxuLKdyW3m9L36HpBxrJyQLea9SPvIDGcbTpLrBUcxATUzDB1cnarnRt0mtOdUZ3AHXHXfiaSuaiMgb/6yqyWcYiy0HxD2/7+4T1CRkuRvOlVZVd3WOFv7sSD+ZJ+DnFROWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3+UgH08CvOSDe5Oh14icPNTKe8R+DoJt2CNc16FP10=;
 b=Sw7lm6g36R+JaExxqv3JjW6zSS+4YbvYEPbkC3dP6cmwCpUh9OX3Rg9Sp5vcDDpV4g3YDUfAfPuHE4QvVUmS99/hCtUIg24yPFCkOeBRM624OQ0dpotQjSriauUzK7u2Pyw+pZFvw3AquhHzfqHEAt7amZDwqfkSx3pgnRimawUcRFXOLf2E/DO+ic7OyS0njdb4NKB+t8kiboAGPixa12QJjt52Rf/HlYSR/oBKVLdxVlZiBk/G4vKvZbE4DD5VPPg1K2ZNKPIix/x/0y0TqkNlDCRFoT45tJ1ZcqQ0b/wlN32s5TB7IE1Nj+OiGqlPNgnJVL2832EeEHSSV8WZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3+UgH08CvOSDe5Oh14icPNTKe8R+DoJt2CNc16FP10=;
 b=rD6XmsNSwQXiKyJiVViZzLmFWmyuSHFO3dn1lTDks3sCYq7qoaue18BH1QBMvQBKOKoqenPLddB663c15YOwh0/w0zSuN/PziyuLWiFMQ2hBxjLITBX7F5Ta9pOx57pCATrY+v79Hb3fmvH5geUChXjcxc0ZkIUWTzn1S66RVgQ=
Date: Tue, 25 Jan 2022 16:13:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/3] xen/vioapic: add support for the extended
 destination ID field
Message-ID: <YfATkz+nse45Vg3C@Air-de-Roger>
References: <20220120152319.7448-1-roger.pau@citrix.com>
 <20220120152319.7448-2-roger.pau@citrix.com>
 <5f8d332d-1bc3-af71-27ba-a4ff7b6e9514@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f8d332d-1bc3-af71-27ba-a4ff7b6e9514@suse.com>
X-ClientProxiedBy: MR1P264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df555a5e-3236-431e-df5b-08d9e0153d6f
X-MS-TrafficTypeDiagnostic: BYAPR03MB3542:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB3542F2531BAE8A6D1BB22EEC8F5F9@BYAPR03MB3542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: boK9UO46JHpmVuTYEmlKsxYUTzQfZUEj6O+0ALu7sqVFOKDPYUsg0f+DZjIdjBpafNgf2UQDbEB10TRpbdZhr14kKnUjxZTD4o0d9cmRNCGYjjthCUpU7wtq6jz4imLhzRG/WKNFMGz7lYAAVBw8Q8c7GdLLfkd7cd4XLvz/OYKi0qc8xsTTLe4UE0wjfpNgjzqbp4npOQYYs/b85tIAZ0lVXC7X2PZrpAsdZyA8zuJCmOd9YcCWmvFz1qSnxmSeu7XZKW2DXvH7i8fqUWA0V7WJI8Dk8rH0WNDq4JOswUNPNaclkbyq2Z6iNzut/vwr4HlWfuzX7Nh9ueMF6AXJa+lV97XowsbL43cSN2y3LWhrJUgUvIxucGQkAyc9sgPsqdH2852Br7dPwYL/RUOPnW8BcddLFVQ4TXKVld2RWed+YCQEMKul5Z5VhFUUi1dhPSsA3MvtP9vREKsYeYaj/9EuRsLlXDsy5RT/+blVmNk2C1p4kHb7TpsqJK0OfKs5gdIO2/j/XEPtAehL6kuaE7MUyhD4kv78Dl3WC77zxxVHLhlMtGl7H8a+lfuR0f9PJRgOpTtTM7hbd8BjfqbVJqMgl6UHVEwHSkk5PeZMNpjRcLGMpYHpW37KPg/ylwN+nmtxd5MjfM+xGYdkO22tApfzkjZdwZ4VQ9oKIh49MTyX0lyvHIvOTPS7QbqKCTKGvV4sGwKhCikiBsZQKwKEwN88GrTewyJX0tYTqg3yLusXv9WSXX6wTTzbUVFQCG+23MjY19JsaHhHs5UOCOM9xSHwrelNRfuhrWUFuoE86Ew=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(316002)(2906002)(86362001)(66946007)(66476007)(66556008)(6512007)(9686003)(508600001)(8936002)(53546011)(38100700002)(85182001)(186003)(6486002)(4326008)(54906003)(6666004)(33716001)(6506007)(82960400001)(966005)(5660300002)(6916009)(8676002)(26005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEt5UVhhaVk5S2dabkNlOVo5SE9kZSs4U1VHZitnc2xSSkJvQklJcnBXM1h2?=
 =?utf-8?B?U2V1a1hZQlhVckJsemJrTVg5OGY5SHlYT0UxMVZ0ZHVDWGE3R0djL2ovaXdI?=
 =?utf-8?B?Tm84UXdrdzZwU0Y2aXpiTzMwTGhVQzZ4ZXVKL1VlYXQyZ2pQRUZpdzJ6bGRL?=
 =?utf-8?B?THZHY3dHQngyR0JEUmtoL1VzSlVEU1RiVEQvbXc5ZXNleGZ3ZEhMMU8wbXNL?=
 =?utf-8?B?ZUJ2L1VFVlYvUktzeXg2bXZISmpPUTZHM0NleDdTUHdVUkN6VDM0MFl6bUtG?=
 =?utf-8?B?bktwck5XV1A3MDVVM29yajkzYTBURk9XeXpHeVBXUXM3UzZhZWp5dGpDaXBK?=
 =?utf-8?B?bGduQzdWUStRNTlZS2M5anpxa1NVaVkvaXBjSUxCbmtYclNxc25TNGdsakIy?=
 =?utf-8?B?RkxHZmw1Tzh1a0IvQkZrd3lUU3F3Zyt0ckZVNzl3b21nVHFFYlBrWUtOQ1BJ?=
 =?utf-8?B?S2tmaXdhdElYa0kwMzJxQWoxS2U0WW0rTllOSDJONTlxR2pBM3RPNkdnUkVo?=
 =?utf-8?B?eW5WNFhjWnhleHRGMU5KR1FvZEgwdmN2elRkRXlwL2NXcS9LemFzL3U2WW5E?=
 =?utf-8?B?N2FBZEVSZlcxRER0NEpCRnVpU1FCT25DaVROQkE1VlFOSGtpVm53VUV5Qjcr?=
 =?utf-8?B?SWh5RmI1YWJTZFhHeXRIYXBJMDRqTmhDbG1wUTFJYk5kVkw3Zk50YzQyQmdP?=
 =?utf-8?B?STZ5bEpVSmQyTGptSlF3OFpLSHVMSUhzQ1MwU25DQlEyQ205YWNtdS81YzRD?=
 =?utf-8?B?ZlVvMzZGTVNXQUUyNmZIc1NGT1ZrSmNBS3ZlMkY3emp3bkQweHl1QnMrQmcy?=
 =?utf-8?B?OW8wczhTcVF1Y1FBcGVxckUreU1meXM2VXF6enFHUlhFU1A4MEYyd2R0UG9Z?=
 =?utf-8?B?Zk9QQ21xU1VTTm1xVEpIL2kyb0NJNzA5blBnSFdhdTNSQy83dWNGNlRxUmpn?=
 =?utf-8?B?bEk3Zjd6Zy9aTnlyVHN2Q0VnOWhZUG9TZUxkTEh0VHFNYzBIV2dtbzJLaEpv?=
 =?utf-8?B?Zm9ZQ0tjdzZUMkp4NTlEZk1idjVlK3QxN1ZueGNEVFIvc05UNmtrd0dsQjg1?=
 =?utf-8?B?b25nellqSzNvUXU4ZG9LZ20rYVYrM3cwQ0JLOVA0SWo2Z1loNWsraGo0TDd6?=
 =?utf-8?B?TktORlhvRzVTOGxDR2VUV1ozOHpHRVNQV3hlSDBSYzQ2dkFibkF3dEtLNHEw?=
 =?utf-8?B?TE1nVGdwS2Y4VVdqSVlpU28rVGUybTBXUW56cWllVmdJV2xoa1IwN1p0T3dR?=
 =?utf-8?B?N1Z0Uzg3cFBKNGw5dDNXa2FrUVlwK2JYeFJNVkwzTFI4L0pwWVJxSGZ3cmRi?=
 =?utf-8?B?SWNPcEFmdGo1V0VnSkpzeG03Z0tuQksxcFVpWEdXc0R2S1B0cmd4b2pRVFpx?=
 =?utf-8?B?UGxZbURVOFVLUlZ0QWZjWFozTkhnUVRHUGhIWUw4dlkxMzdac3p6WU5TcVpk?=
 =?utf-8?B?QklmOGk3eHAyakYzTjgrYk0wYjYvdzUrVS9KQy9DM3diTU1zU1pVbldxSXd2?=
 =?utf-8?B?Z2xzNHlod1BUNStJZDJoN0Y4SHZwZk14WGduc1RKaERaa205bmRnK1FWZm56?=
 =?utf-8?B?M0xXNHFrcEU4RjUxcFpJRmR4Y3VSOXg4TWhtVFdXVWVnV3U4TTFNSGluZFIr?=
 =?utf-8?B?RmxKMG9xOTVKekNsMTNNMExIQzMvZHcveDIzQjlvOTZ3ZHJYRVhBaSswT1lW?=
 =?utf-8?B?cEFIWHg2L3U2WGZrTzlLNHExSHJobVhjNW1zcE5UV1lqUDVYcG9LQ0RrRWtL?=
 =?utf-8?B?a1dTSmc5cFlVWGVTSHozKzVJa0VHREpjSWVCK01JemZzZXJKN2RLdjh2YWZR?=
 =?utf-8?B?SHphYzZpV2pYZmIxNTFCbU5mMWZaUVRYcHBUeEhNRDZ6TGk1dFRNYnhmNFhs?=
 =?utf-8?B?UmJlYmZ4VWEvQWlwenl1Q1Q1ZldYcEFEczdUK3Rzd2E4WlBReElvRy9oWCtE?=
 =?utf-8?B?TXgxU2VZdmNwV1QxcFVySzFyd1JSck9pSmppS0ZpQit4THd6ZXUxT3dSaUlu?=
 =?utf-8?B?ZGM2bUF1ZVIwakQ4L2JDTkN6RkVyeEZJNkZYbzZZRW9LbW1rTVUrQU11QnZ2?=
 =?utf-8?B?VFVtZWk4TTFjZDY5VmplWE5SajQ0VWd6QjFxZFYrR2htMVJiZU1vWHNmSy9p?=
 =?utf-8?B?dEhxR2pBcEhpYy9xNUh0dmZrYU5jZmNpVDZjQmlIa3N1RkwycVlKdjdBU1hM?=
 =?utf-8?Q?390La0F0o3pTkAwAlH/X3ek=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df555a5e-3236-431e-df5b-08d9e0153d6f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 15:13:28.1499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Br6DgvmwTGkvdC7U1J5/fVoH4pAUI+KHf7R846Uo/MBdJAw2FJDPdAWGr3XxpNf7/8Ed4aXFU/xzjMML7PFttA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3542
X-OriginatorOrg: citrix.com

On Mon, Jan 24, 2022 at 02:20:47PM +0100, Jan Beulich wrote:
> On 20.01.2022 16:23, Roger Pau Monne wrote:
> > Such field uses bits 55:48, but for the purposes the register will be
> > used use bits 55:49 instead. Bit 48 is used to signal an RTE entry is
> > in remappable format which is not supported by the vIO-APIC.
> 
> Neither here nor in the cover letter you point at a formal specification
> of this mode of operation.

I'm not aware of any formal specification of this mode, apart from the
work done to introduce support in Linux and QEMU:

https://lore.kernel.org/all/20201009104616.1314746-1-dwmw2@infradead.org/
https://git.qemu.org/?p=qemu.git;a=commitdiff;h=c1bb5418e

Adding David in case there's some kind of specification somewhere I'm
not aware of.

> What I'm aware of are vague indications of
> this mode's existence in some of Intel's chipset data sheets. Yet that
> leaves open, for example, whether indeed bit 48 cannot be used here.

Bit 48 cannot be used because it's already used to signal an RTE is in
remappable format. We still want to differentiate an RTE entry in
remappable format, as it should be possible to expose both the
extended ID support and an emulated IOMMU.

> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -412,7 +412,8 @@ static void ioapic_inj_irq(
> >  
> >  static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
> >  {
> > -    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
> > +    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id |
> > +                    (vioapic->redirtbl[pin].fields.ext_dest_id << 8);
> 
> What if an existing guest has been writing non-zero in these bits? Can
> you really use them here without any further indication by the guest?

Those bits where reserved previously, so no OS should have used them.
There are hypervisors already in the field (QEMU/KVM and HyperV) using
this mode.

We could add a per-domain option to disable extended ID mode if we are
really worried about OSes having used those bits for some reason.

Thanks, Roger.

