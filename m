Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC66A4B223D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 10:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270255.464480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nISPi-0000aZ-8L; Fri, 11 Feb 2022 09:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270255.464480; Fri, 11 Feb 2022 09:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nISPi-0000XQ-4c; Fri, 11 Feb 2022 09:40:26 +0000
Received: by outflank-mailman (input) for mailman id 270255;
 Fri, 11 Feb 2022 09:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFbI=S2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nISPf-0000XK-EG
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 09:40:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f617777-8b1e-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 10:40:20 +0100 (CET)
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
X-Inumbo-ID: 9f617777-8b1e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644572420;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=A1f9r5ncU9SUlNKvw4uKoNawn8Lzqtw1MJjsoLb4tXk=;
  b=E07A9op/rIdLP9AH1i14jpWZgTjmqwbXMVBBEl0p8bo9EpH6nYNtvUQ/
   96uRWv3TYGsLqt3aStCevahHoDxppkhxTarmLqP7omEjKomb/fejPy5ez
   /6U/+XTVPL/WbaA+3l1G8CV8JgP84Oq297aiqS4Utfu1V5E65sbZHGhqV
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nrYU3ccSSfdgGjEryl8uVvPQvkmDcp1AauUgeOk1nT6h9nmrPLjoAtVU766Pq7kV6r3I6cUlon
 6E6uWwNX/CwBPideYwDF6pEfXUdLBbB8TTKPwDugZl5QQDh2ylo82nyHPWRZH8VPkSpO+cwSyo
 hf7l6qMkiM9kTZkz+2K6DQ46444STvQCE4uWpz3kbN2QsWshHsDtK5TDQUq3zyQAyrW4ucGdj+
 AZyj2qWF2sY78rIiAC2DXwvbUXNLMOkv3YJtTKqRhMBhlN9BlH/Xc8TPzfmWc/zyYiuh3vhvwV
 LLM+QGHACKUkCtcDpuaQ/WKZ
X-SBRS: 5.1
X-MesageID: 64407617
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eQDfMKJUvBnrxoPGFE+RA5IlxSXFcZb7ZxGr2PjKsXjdYENShjUDm
 zcdWT2ObvbYamXyc9ElaYW18ExSvJWEmIQwHgZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6wrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Jlepa+
 utriqeREzt2Janogv44U0lHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UuYMAg2lp2aiiG97FY
 foieR1ONSjkRAdgExAsU4sRmcC30yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdx2ymlW2gDgjYPsKL7Ih7CWX0I/UsxnMUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzrNAuBRPtfNi2mUBb7zt6cowGGxFAfpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpyP5IN8PumwnfC+F1/ronxezM
 Sc/XisLuvdu0IaCN/crM+pd9ex2pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ba5XUm08CDIUToED/qOYuELzDFlBibbjeoM1LbO+TZA1gHWAqEfjKxr09PYdimsxoei3gp
 xlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:KWYzl6OAIOR8nMBcTyP155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YfT0EdMqyIMbESt6+Ti2PZYrUdKZu8gdiVbI/lvghQpGpRGsddBmlCe2Km+hocfng7OXN1Lu
 vV2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnT4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUrZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpwoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPXi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZNIMvD0vFnLA
 BSNrCd2B4PGmnqLEwx/1MfjeBEZ05DUCtvGSM5y46oOzs/pgEM86JX/r1bop46zuNMd3Bz3Z
 WwDk1ZrsA+ciYoV9MPOA4ge7rANoWfe2OEDIqtSW6XZp3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="64407617"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmUcBRtpTzjGre9rfiEVcFeOjNmf0L9UC5DizgAYlQ1jNG9ElxCI88q3R8797zqpXxoj1EkfNSJm3oBwcfMHwFDj3LWs2/4uYQJNI9e7HMRC5DH9RqmlFhvU7nW9yYE5gzdiSfR+XAGQXLaTimFt/tFWGQmO8cCgvJHJUmSgobSgiPgPC52tDPxhoLwNbis2kwwNRL3JgRWAWpW64Moi/gcdyapAMTJZaLu+Faub+87jqFZuGVlJ5omVl+Zbq+TjLblR65VNOnbLrJyWpJpr1CdTjiguMyxgt61PGcDSNm34R04aJq78gGAXGn06pqQ+MWG8MKkwvi/vMqpajJL2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1f9r5ncU9SUlNKvw4uKoNawn8Lzqtw1MJjsoLb4tXk=;
 b=OY+EKWmYomycA+EqWNWOhonDuLdMj32BQHodAgK9Sm7M97DjeY8lS8IelR5WdlNNn7a9Ogplp2hJ95EwtwuG7ReMWrknQLHXbX8RuGbd0nV3jVfNlgz8nGS6BNetgrQs8x+eaLIL71xiV62lJrq3l30sBZV+CeQ8Ng136OLroNuLzGUvhVX1hHjl9sGRmc/dx8HGP4KpquwIFLKOd2BdZkpganeo1tGsOO2uK/i7iNPNMbIMl8m9T1L/FYMspYIz8/ttxZluWtAgM7ibpt5imwrN1fHXTVgVrQp8hTL7Bq75nlYWOgROwsbC2XOJN1mqr2SbrUEOUx/E5OQ7WN8+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1f9r5ncU9SUlNKvw4uKoNawn8Lzqtw1MJjsoLb4tXk=;
 b=WBv5edrQ9op7mSvpntDzXDECPtwU1crbStfz6YTvr5O3c4Gwl8gY/jpRld0syk525qr6K7a5dgn4rARWSqgrTS71ljyaNwNuBw/ckxIS2BdzvSdcAReztPXXG1iS2LQumAVGalN2lWcj7+w5QNG/K+2q/bZz9ErzL2NNR15bJQ0=
Date: Fri, 11 Feb 2022 10:40:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] x86/Intel: skip PLATFORM_INFO reads on family 0xf
Message-ID: <YgYu+OoAovYmTg8E@Air-de-Roger>
References: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
 <6f56a75c-cd68-0dad-b1ef-a3421271ee47@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f56a75c-cd68-0dad-b1ef-a3421271ee47@suse.com>
X-ClientProxiedBy: LO2P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00efa24f-ddbe-4bae-04a6-08d9ed42809c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4443:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB44434C1F8861E805C593C97D8F309@DM6PR03MB4443.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /tZPY6DN2B4pfLsq3gLSZEjek7SfkJWIF3LQGrZSo5HDu7UeWeumKy0teug+q/9OF3o1idY9QmM+z6dGkjTTR3nBfrgJ0T3++dgSPgwwA8egaRSSBERv2G/bjkINVWg63dU+Uycp2P/p2OpnDuIJA5pXu+cgbyn9RgidNKQTdsFmXFyjUqCnrEWndsHEjhUp7SHRjqi3i8u9ve+9xhSfN3pmanoYnDoxmWGT7sY0buzLMympEaicdiC7/VL4/Scu8Ysm81c5CgR19WpFY97HYAFWZFRFulPlZu6ZLIoEOJao9k3PHXDILYt/MCGK/L17VLEccf00nwQYewKk9S0wWzHUy88x6bgw3xGBZHcpxN5ae2FY7PSh6xUIF7G1C3L/p9iXl/bQ4NdM4ZMC36fRySU8QQZ66ZqzrXCL0xvQ+yJqyI1O7tvW4YJqAOVFxsJHSeBN7/JAlNJxhpFoM10DXmh+YE3XxzldkAdFN1ZiCYsYG4Ok7DAQNflStQ/EOWHkGZjP+vgvVt8ieEemwaY0ZMM/+UmMsXUdVC1ZExIDPVgIulLx07GVVnt02g/kY68FJF1U/W54JH9Gapggd9//XbS10NLIbu0uHXhhjjCezv8/UHyPc9HekMXFvg23JmdSB4K7CVPF3y1TP2c7DtBp8GIKUvLpTardNofOKRl1tkKZITn4feGYwrpBP5Vc+hDGRWISvf1pWgwA3O+n/wNDoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(54906003)(6666004)(4326008)(6512007)(9686003)(6506007)(508600001)(86362001)(66946007)(82960400001)(6486002)(33716001)(66476007)(8936002)(66556008)(8676002)(6916009)(26005)(38100700002)(186003)(4744005)(5660300002)(2906002)(85182001)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0NNeDRIMWNsMEtXbjE1ZFN5ZVFESTdHeXJxdE1pNFJWc1lYdUdEMlcvTmlq?=
 =?utf-8?B?TGE0alBlZEZDOThCS0xuenJmd2Ntd2pNYjhUZC9oeWF5OEFOWkVtZ3pnYTdW?=
 =?utf-8?B?TUQ4TVJKNGo4dzlGMndPS0xua0Q5bFRDc1RCdmNKOTY3S1FJRFIyR3U0NUMx?=
 =?utf-8?B?czFESSt1V0FyTWNwOFV0SWpGcm84SmpuL0F2U0lmSjdiUGNlK01VYXlkdHpx?=
 =?utf-8?B?RFE0UndIZ1U3TnZIQ1gzcCsyTE9tUTBMaUo2bnU4akxHQjIvdnowcDBhQ3RN?=
 =?utf-8?B?djZXdzlkbzFYVXZQTUZhTUlpUEd4blVEOHBpdzhiQkVvZWtjR2svb1k0Z0c4?=
 =?utf-8?B?ZDZITTlGK3BnakNqQ3N2YnkrYXdndkNuRiszbDJreENtUDE0bGtoVGJSV2Z2?=
 =?utf-8?B?UzNOdkxMMmVwTmxZeHZFNjVWRzlTSVRWRDdEVnBWdFZKVDladlBJVEV5SXV0?=
 =?utf-8?B?M21PRFZhVWFsdy9IZ2MwNGpBMnpwbzRQaXRESWxHMkdJOXVvZDAzZHBRdHJC?=
 =?utf-8?B?RnBsdFkrTWV5N0ZEbkJhMFdpZHY1Rm1LZlp4clNMNW0vUjhMbkhMNGNoblFC?=
 =?utf-8?B?dzVSQ2NISWQyYlZOY3BzOHpPdFQ2dnlOMG5uTjBCUjc4UkZWdmRUNlV1WVdm?=
 =?utf-8?B?TmZWbmdlSDZqK1VKTFZaYzFyU2VWUDlzTjBScTkrczVBZVAySjlrajdJNVRq?=
 =?utf-8?B?amhhbUN5TGtyeWUrb0ttdDlsaHkvQlpPZ3llbjVucVF5YTlOTHlsemtFWWZR?=
 =?utf-8?B?TDgvZTlYYTMvRG1Ld1ZvbFBSOGtiWDVaWS8yU0FFL2RxeXhJYkczaS9Vak8w?=
 =?utf-8?B?eXBmVlhtUVVTS3hoZFNpYU9tbEw3VTZKN3ZkS1QwYkZ2R2l6YWcwNTVMRFZV?=
 =?utf-8?B?WXhuRkcvWXZac0xlVEQ2dmhXeWRHNkdMMkpud1JWN1I5aXRpRFlDOTBlWHdD?=
 =?utf-8?B?eWFJTUcvbjVjODh5SE92WGoxRzRCVnlzQXBuV0xkL0VBekF0TWlEc3ZQSGJW?=
 =?utf-8?B?VmwxdlkxdzFvd1p6eklkbWN2bE4rbjFlOFpKMFp0ejZEa1l4bVpoVHl1cHBH?=
 =?utf-8?B?ZC8rK01SaEFmSnEzaGdIc0Ezc3BseDRyRFQxSElOZGlWdG1JakdFTDVuUVNw?=
 =?utf-8?B?ak9mNzl6ZEdBL0xCNHBEODBXdnpZV1M3YWlKbVpBM1NIcDBHbWxkSE5vakpu?=
 =?utf-8?B?WGcxZzBKL1hOMWZ6SWl6cVp2M2pWOGpseG5VZGMvcFQ4YkVXZ29CbE84aTg3?=
 =?utf-8?B?THQ3dCtDeUxHWGZxRHExTzRSaXBEaEhLSDdOQ2I4ZGh2RXJiRnpHWTE5RERu?=
 =?utf-8?B?TzBPWW0rVFJGTWU0elJtVituSHhpSVhKSGduY2plMStySmVRNlhpVkNudG1K?=
 =?utf-8?B?NHF4eEZnY0dIb0dvaHdrbFRVdHErNmlCcTBvdHJBR1JJaGkxVFNtRkdPRkM1?=
 =?utf-8?B?RURqaUtwUGNCNHQ2cXJnVXRrckNaUllielV3czlMR3RBR1Rqd1hncmhNYmFt?=
 =?utf-8?B?UzZ1a0dpSFNSbU5FMzhRajR1SlVtTEFQcm1wMlNaVFk2SWowM2ZFTjd2clJy?=
 =?utf-8?B?TC9jU1VWazZzb0pYVElJb1ZJSHpEUDdCdDZaa3BKbjdWVk5FMjZ3N1VxWFpY?=
 =?utf-8?B?U3p6R2k1T2w5cXBydDNVOFpvR05MTWlWRHFoYkp0WEt1Zi95eGhLZzJVK2pz?=
 =?utf-8?B?QmVDNThSeXlFMGR3VGVKaHhNVnF6VEJORVF6V2cwSGFjS2o4UEJqZmNLZjBo?=
 =?utf-8?B?VTM5UUR4dTZIUlN3ZmkzYU53dFNuNWhMSHdmby82WVdpVWVsL29QcTlhTFpR?=
 =?utf-8?B?MmkraUVhd3ZDNTVTdjNWRE01cFBqV3VtNWVwR0oxekM0QUtoL2FDR29FSGM5?=
 =?utf-8?B?ak1WdkVFUGVIV21UcUNNU2xTQzZaN0FncDA3am9DM2ErSEVlMElUQ05UUWx1?=
 =?utf-8?B?Z0RMTGtkd1huYk4vcDdxb0JtREs0Qi9nbnIxMmt2RWhNTHZrWTJkVnJpK3V5?=
 =?utf-8?B?blNLaGlIS1hTWmlqRGxpNVhMeDRRNHdHVy8wNlIyc3RHVTFWR0RSeTgxODJ1?=
 =?utf-8?B?dXI0RW5KdFo1cUdlRTZEcllCTm1uUGQ3cnJYT0ZqQWljckRTVHh2Z0pucS9D?=
 =?utf-8?B?UzdDUVZxR2VKZGluejBiQUZRaThvZm1Gajg3NHl3aVA0c1U4em5GYytkT3hC?=
 =?utf-8?Q?PiBJZ+f9ePHAfYit58AoLNo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00efa24f-ddbe-4bae-04a6-08d9ed42809c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 09:40:13.1906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdbG9a9A0rZaLY6du1zgNKtqXP4/BhgcQjfWnQ+xr4F2dy6jIYczLzKeGcVhhgtJoP4+CSy2W569szqyROoXKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4443
X-OriginatorOrg: citrix.com

On Thu, Feb 10, 2022 at 03:55:52PM +0100, Jan Beulich wrote:
> This avoids unnecessary (and always somewhat scary) log messages for the
> recovered from #GP(0).

Could we maybe get rid of the #GP messages for cases like this where we
are explicitly probing for MSR presence? (ie: it's expected that we
can get a #GP)

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Perhaps even use "!= 6" in at least the CPUID-faulting family check?

Likely, or else you would also need to check for family 11 (Knights
Corner?) which doesn't seem to support PLATFORM_INFO either.

Thanks, Roger.

