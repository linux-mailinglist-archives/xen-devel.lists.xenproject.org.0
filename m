Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D4049518A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 16:35:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259113.446981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZSi-0006cv-QJ; Thu, 20 Jan 2022 15:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259113.446981; Thu, 20 Jan 2022 15:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZSi-0006ak-MI; Thu, 20 Jan 2022 15:34:56 +0000
Received: by outflank-mailman (input) for mailman id 259113;
 Thu, 20 Jan 2022 15:34:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWAP=SE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAZSg-0006ae-Vu
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 15:34:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81ae9107-7a06-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 16:34:52 +0100 (CET)
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
X-Inumbo-ID: 81ae9107-7a06-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642692892;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ihXuRc9VccmNFcUBgjiAWM48zQvEbC7wypVXEHiqcUU=;
  b=ehmRrq1JGPVn20BXBg9aef+Raxdqs8bxkhgHBfa0S6Nj5HkKjO3WHPQ6
   KF53zMRM9IZWcOTlB+v4hVJKbVkxFUyR6x9xH7haRK9HdFyjJ1AfLcj3D
   OnCjPZLfLKuQcqrhNohLTFzWBT3ne8q9edxpK8uNPchfqwd9zEmOdtXIN
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aF7Uw05ngT0NUxWd4LepGtxe1dYYOA7STtW/ui6zeCCtug0wgR1/7bPQMjJWAs4PMPTeoTCiP/
 JeURWg0oKgzPzwwhPvQuk5Gu8czKEEOKnk3Tbn1cTuzwFJlPRj2y+u9998hX8jHEMQgb0sJ0yp
 U+05yCpXiO6g2cc2IKmdEJ9gljjDoQkjkzwkdXrDbAhy+ugHCjR3YeW2rGefT7wJiMJ0jFrgi6
 PtUxsOP/AXTZcDWDiyzKoTC/3IY2FptMLsQzvjtFmQWjP7qI/E0Q4LgQ3aIM0QCN2R5lUyTZRs
 3V5Z7amNicNfGXQfzG27/8ks
X-SBRS: 5.2
X-MesageID: 64563935
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IXfcNK/is0IsHFqfjggjDrUDQHmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 WsaUWuAPfuDZ2Hxc4x0bY+1p0wP7MWEx9JmSQE9+3w8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj2tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh2y
 e5opdudYz41O7ecqNo6Yjx2KQFxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgGpu3ZEVQJ4yY
 eIzeAFmTh/JYCZVFWs2A4t5maCHjHvWJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqRavTnxH2hHthITfvhq6As0Ab7KnEv5AM+UlqAhOn+p2SHR9dFe
 3wq3RsLg5IS+xn+JjXiZCGQrHmBtx8aftNfFewm9Q2AopbpDxal6nssFWAYNoF/3CMibXlzj
 wLSwYu1bdB6mOTNESr1y1uCkd+l1cH5x0cmbDRMcwYK6sKLTGob3kOWFYYL/EJYY7TI9dDML
 9Ki8HlWa1Y715djO0CHEbbv2W7ESn/hFF9d2+kvdjj5hj6Vnab8D2BS1XDV7OxbMKGSRUSbs
 X4PlqC2tb5SV8/Uy3zRHrlUTNlFAspp1hWG3TaD+LF6r1yQF4OLJ9gMsFmS2m80Wir7RdMZS
 BCK4l4AjHOiFHCrcbV2c+qM5zcClsDd+SDefqmMNLJmO8EpHCfepX0GTRPOgwjFzRZ9+Ylia
 cbzWZv9Vh4yVPU4pAdass9Ai9fHMAhkmzOKLX06pjz6uYejiIm9EOdcbwDWP7lntctpYmz9q
 r5iCidD8D0GOMXWaSjL648Da1cMKHkwH5ftrMJLMOWEJ2Jb9KsJUJc9GJstJN5ombp7jODN8
 i3vU0NU0gOn13bGNR+LejZob7a2BcRzqncyPCoNO1e02id8PdbzvflHL5ZnL6M68OFDzOJvS
 6VXccu3HfkSGC/M/C4QbMehodU6Jgirnw+HIwGsfCM7I8x7XwXM99K9Jlnv+SACAzCZr8w7p
 7H8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6epheJw/Cyz2W0
 xetLS0Z/eSd8ZUo9NTphLyfq9v7GeVJAUcHTXLQ6qy7NHeG8zP7k5NASuuBYRvUSHjwpPe5f
 exQwvzxbK8HkVJNv9YuGrpn1/tjtd7mprscxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOXbIt7hHX4QOBEhP7aK2vwjkzXP6eg4fRfh7yht8bvbCUhfMnFgUsCGwGeZ5G/9/
 dochQ==
IronPort-HdrOrdr: A9a23:STskMqmjSrRvq0PXwVo5IyNsvOzpDfPAimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTM2ftWjdyRCVxeRZg7cKrAeQfREWmtQtt5
 uIEJIOd+EYb2IK9PoSiTPQe71LoKjlzEnBv5aj854Hd3AMV0gP1XYdNu7NeXcGOTWuSKBJXa
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWCSw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLLhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqn3d+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7k16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXavoJBiKprzPLd
 MeTf01vJ1tABOnhjHizyNSKeWXLzsO9kzseDlAhiSXuwIm6UyRgXFohvD3pU1wha7VfaM0ld
 gsAp4Y6o2mcfVmHZ6VfN1xOfdfKla9Ni4kY1jiV2gOKsk8SgHwQtjMkfAI2N0=
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="64563935"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbBD5FoZI1DghiBLhgASrJE8dt+LQ31BE66wbtRjiFiGQR5sEU0qq4wnhhR2DaF+1IYpoCmrCKASoEntUfW4ObLz/CmM2mCHKyuVceNxkc+Xp/gITqZ0GNIQa4TvWYT/+Z1QiQ0VgjwMQX52+zUnSiPUbuc5wbckKv+ene8pqwBJTTYMr/HgIXQtExnouu0kt2vFu8pG2bxBLPxaBce2jjoMWijNpofQSrMQTiQKAQN/HoggtZgMH1C33tbs8XzjO1rx2U879qWKF4amqA7GQbk5TcvhKkhBa5xxfxF/zAnMUsEvnOXynsWdOLHcATSMgnD3NLHfpNYY97Bkdq/wTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oIfLIGdwZNZYOUj4IE0DMdzfoOGTvBy/VKEYbhrVro=;
 b=Krz04wHHscOFlr/wwcVGw3DxdcoWfFLQFMecCP+BYaul7WDkQrdIkM6bhOpZLZRXEIsFZtgMgIhxePmaXZoO+PV71vLEkI79roN34O4a3eKbqiNRazDUy9liK/+YYSaJLRXWVAtg7T9pxN16+BWiZjWYYq/MSuwIMI0KyZFPbpbCaGV/VKGCK/anGmoYmsPGObZ1GwUrjADcOIpmFsk7ZyoEu5f7MhKPOPQkX40Xwh8ZuIc0bAJejVfgN4mFLJnm9DlA3Ksetc4HJ+ktPXVb7T3IBdYJHo2TVZ12TMC/so/urd5LbV+ei8CMiqRe5qcPus/l0LjHuJjuNIONU0Mhdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oIfLIGdwZNZYOUj4IE0DMdzfoOGTvBy/VKEYbhrVro=;
 b=cwwHPOolB18Ikt3BYO3x4YKxEYOMSFucsmmBvdjYIBANcZzp74cytza1VCZlURZOWj2Px7lDre+/84QQm3PGUTkIdcu7/ijIYyB0yVAZB1AkRjzFIKs1QlRMGLxj2W8dT9EZxISGYD5lDeWGaKW2gF6rZSF/65KwZaE+enRBN9Y=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/2] xen/x86: use extended destination mode if available
Date: Thu, 20 Jan 2022 16:34:37 +0100
Message-ID: <20220120153437.7750-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 591dc596-f4f5-43a2-2b49-08d9dc2a63ed
X-MS-TrafficTypeDiagnostic: DM6PR03MB4044:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB40441485434ABB4D6E5809538F5A9@DM6PR03MB4044.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TmZcqcj3BpO4kGdgeybHC2hBrqQ1Xb8FtnshlOWiiJVSKe5zCC67XDreg06oFDtIetkMZQeqnU0CGjIvRf7zxH45CGyWnNAmKZNm0hzd9CaD8z61wumQDMGSdfeE2bYtYO5keDYCAzy946B+YnWFWvsGQMVlg+2pWNaTpRy3Fy3IAEeFYVDQ1dIzmfvQPthP3674L0HbOZ1KNRCagfg88ij+mgL8qwea4RoHw5XQmJ0lUMTh0WWSD5lrMbZZkPNC4Mbwh1TH0pzc6Ye8ieGpDMXa84x/SAYdQ6ZR7JaCv1Ouw9IIJtrWOkZqGUkf0I1tzJMLHZZUCUBAUrY2xqW02QgA8myOnVMnxXx6228hpFaPmMgQsHR0i0sJ7bbvkmWRrNbjEE8SEa/uDxxo9BxQSZFPpNptnPd1Kbyu7FkRoKAyLVqxKnbfkcmLQQnN8KihdtFCvdlajEI4P+T2rPas/RNqFYvpr2GOlHimucosEysmsB4pLAvgJC0w4tzqYMVbdrS8TDdOJO5DuxkPKg48A5U+InlhsmIjSMuMVcHq5sl2Pofu2aJcP0LMM+abu3JyVZ8ZwXGsa6Vo46J4NN/KXlmZc6r/rosNpNEXK/XFfxYRXcBiBWzgnQGc1SSykw/hLcq1fZNc/W4FJ2GhNl1UXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(82960400001)(4744005)(6512007)(1076003)(107886003)(6666004)(316002)(5660300002)(4326008)(86362001)(66476007)(66556008)(66946007)(38100700002)(6916009)(8676002)(2906002)(8936002)(36756003)(508600001)(26005)(83380400001)(186003)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHB3akxYTkh0QVgyQVdxMmNTcHY5SUNaVzBWZVdmL2xlaSs0VGZLdjVGZmQ1?=
 =?utf-8?B?ZDBwdHRWS2QrUWhSWkhGMmJObTBkUmdTd21YeitWT0ZtYlh5Qms0NXgwOEZG?=
 =?utf-8?B?cVFIV3p5UFREd2M4MythRUs1T25sT1FOb09INHlSYTZnQmUybmRvUm1acy9G?=
 =?utf-8?B?WFpaZCt3QmN1SlI2bzRwVUxubmxRTlQ3dEc5NFdaSmZnYlA0ai92cTlIOTI5?=
 =?utf-8?B?dUI3UFEvQmMyYWg3NktrQkRQM1M5Rk16czFJbTZOcHdrVzBsbnpCMldxcXFs?=
 =?utf-8?B?d1duaXlLSzYvQUdZV1pXSnhlZURuNnczcE1OUWRHRHlIS3cwdE1ReEhXaUQx?=
 =?utf-8?B?T1NsdVg1ZElxNEU0SmJ6akhpeVhmRWlIUUxKTGRKYThwMU1Xa0tuQWNUSWt6?=
 =?utf-8?B?TTVLcVBlczZpZGE3ZlZ0eGhXOGdsTHRCUWxQTVI4Q2owc2JZdE5iYXBuZ29C?=
 =?utf-8?B?NUtCQ1lOUmR4NlZuNU44RXYzR3lhcGNhSFcva0VxUUM0MjY0aW95b3pXVU11?=
 =?utf-8?B?MXJhbkhyalZQR2RXRnZpbFFuSjRJeE5qTmlJeE9wRzhjWWd4NDJITStJY2Ft?=
 =?utf-8?B?V1FaZTZINnVYYUpXc2pGYzNIMnlodTViK24rTHZvTDlTeHY0Y1lXdWFXeU8r?=
 =?utf-8?B?VlRhbkhEN3o0azY1UDFpNTRnMUNpcU5CSjJ6a1V6WTExZkN2VnBNaEt5N21F?=
 =?utf-8?B?cVEvU0k3UThhbnhjNGk1a3o4Tk0rOTJKOERPSHVCMG5PVElSMDRTU0diVERS?=
 =?utf-8?B?Q29GdmFUaWFFMXpydkVBWFd4VEJxZC9UaTNEdGZlSUpVekRwdVoxQzRrOUs2?=
 =?utf-8?B?blNPemhKOXZVRlU4UWxFUWxic2lkMWs0Mmg4eTQweHVrZmFlM2lFaDF1anpr?=
 =?utf-8?B?bE5sZ01OLzJvVWRCeXV0bjNFdEYxQ0Mrck9TbzVycTdocjFIWTYxWWpadHMy?=
 =?utf-8?B?MWNwVDkrRjhUeC9Od3ZpdU9obEhEOUN2OSs4cVJPYWJFQnBEMUJ1TGtNQkF4?=
 =?utf-8?B?cFdUUnVIdXFLZmR4VVQ3TVdFaXU5WERWT240cGVKUWpja0xkQmRZSWQ4Kzcz?=
 =?utf-8?B?WExRa1JPSTB1SnhnN1lGWGdva3MyaENBNjFTMVlMYlJTamJtcm9KNGhVL0lv?=
 =?utf-8?B?USt3MllCUm5uZTQvdFRjVVNhcTNKNFdUd0h1NGExTDdiTlRYNzY5Y0pudXp2?=
 =?utf-8?B?ZnBkNjJlajQra1NIbHZGMkFPR09pdXJJSjY0VmpDQXdKTnRrcGUwUU03MEcz?=
 =?utf-8?B?cUpic0FXTkJ3VGM0SU8rVVRRYVJ5blF2NTY5U0s3eWRyaUNtTnRnYjNsa0I1?=
 =?utf-8?B?MmlLaUwyTDdwemNRUTVCeEZPbFJneXYrNEpmQUE2ZlpWY2c4aThKM1BWbUdM?=
 =?utf-8?B?bUczUU13WElReWlKM3NlUXJYeDlockUxVTBYVFNLUk5QQVBrUW5WQzdwb1JF?=
 =?utf-8?B?TkZLaUlhQ3BUQldqMzJhMFM3WkdDMzRqNStZcWxROXBUbjBuVG9GZXdkN0dm?=
 =?utf-8?B?Y1ZtUmZFNkRyeVAwaldic0tvODlxUG45SmxjYjFrdGtRK2JDSWZYc0hLc0M1?=
 =?utf-8?B?TGRGSDAzWkMzZmFzSzcvN1ZvQ1NGVHlMZlFEWWdVY29UaThNUHJ3ZTBjcVVt?=
 =?utf-8?B?YWZZamg0NHV5RmxocGFyd0RycWNERE0yMU42UFNFYU9OWHB6WDVLbHJ2RGdQ?=
 =?utf-8?B?VmVBQXhVdXlzblBWZHk4aFFsZXU0d1k1bm8yRWtVVEF2U2lqWDF1eEc0bzkv?=
 =?utf-8?B?WURMdXJzc2VoTnBPM2lTSW15bTJGbzgxa3hzczFtK1BHa3crMHJFRVVJczZO?=
 =?utf-8?B?c2k4Qk5sMlRrWXcrSFBrYVF3RmVYTTNzTVRWc2M5YUFSRy9yQUhXeGpnVWZa?=
 =?utf-8?B?ZUNGeUYvWEtINHoxekEwU3M0ZEd0bVE5VTRTdW00SFZlZmtpcE5ML2p4Zksx?=
 =?utf-8?B?QW43MVpDcSttQ3ZsOHludno2N3JuVWxqRmlRSkplbTBBQ3hTSWtOa0RTTlBW?=
 =?utf-8?B?OEtSeDZZU1l5bUhlSCt1VFdsTGtXQTBsYmNtOFF6WFRsMFJpTU51MHVQdE5T?=
 =?utf-8?B?WEdQeDMvb1JXbis5dW5vaHRnc2g0dVpIRmxMeVNNRFE5RjJBWmEyQkh3cHA0?=
 =?utf-8?B?dDNmUC95dzZxZzFyc0JBVWI2WHoyWmticSt0Zml0c2lYcWlPM3lDTXBUbkp2?=
 =?utf-8?Q?8BLA4JywcmEH2Z4tyy/Rzjg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 591dc596-f4f5-43a2-2b49-08d9dc2a63ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 15:34:47.3642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SH31M5YxG7Cx4VnuA2OS+v4WfS7Ks6b47+ZJLBD02E/RuuZtmmfYf0HJN2eANwTFK6UflX+aRmv2dzlLy34Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4044
X-OriginatorOrg: citrix.com

Hello,

Following two patches enable the usage of the extended destination ID if
supported by Xen. This is the same feature already supported by QEMU/KVM
and HyperV.

First patch can probably go in regardless of whether Xen ends up
implementing the extended destination ID, there's no reason to prevent a
VM from using x2APIC mode.

Thanks, Roger.

Roger Pau Monne (2):
  xen/x2apic: enable x2apic mode when supported
  xen/x86: detect support for extended destination ID

 arch/x86/include/asm/xen/cpuid.h | 7 +++++++
 arch/x86/xen/enlighten_hvm.c     | 9 ++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.34.1


