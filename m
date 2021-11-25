Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE845D810
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 11:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230820.399016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBn8-0000as-C3; Thu, 25 Nov 2021 10:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230820.399016; Thu, 25 Nov 2021 10:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBn8-0000Y2-8D; Thu, 25 Nov 2021 10:15:46 +0000
Received: by outflank-mailman (input) for mailman id 230820;
 Thu, 25 Nov 2021 10:15:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dIP=QM=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mqBn6-0000Xu-F6
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 10:15:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3dfcf9d-4dd8-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 11:15:41 +0100 (CET)
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
X-Inumbo-ID: a3dfcf9d-4dd8-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637835341;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PeokghDe/5CMURbxAE1HEp7nxdNS643CxBIXgJ4axro=;
  b=SpGBXkXnwjMZgFwVogygRsO2CmA4LDD5sgveA+w3mVJ3UK1n2THRfNZG
   gWy0fTM/Iyf6Yo19+AUz/G6JTUt2JP5OSuJRmJ7RyrX297gDgpcC6Mp/s
   RGNofWsD8V06hFRseumwnA+QI/9jO43/l4Z4o8onFVV1ggmMI6PXdCpDT
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7Gh0ZZqNqWn87HreQ9X7CS8oaTckiLM/YhwygK6nm6mWncNqkk0ksIyrTXzXA6jPRc+uCugwJU
 2+5K1jvlcH85M65sgkdNy5HBdVRpwGyaU/dTx8djelMu3uLOE2iEi7pcEjhPT/lAnIPf6IP0K5
 PIbNY4IECufqksHZOtZ09smmWFhmuVOdft5aRCyIALMRAp06wU4GV4AQbBxwPQIYY5oBYTZ4CF
 rfl7OfPH4GhoKn/+cAjPOp7XlhAyR98lf5mafCoMIkNce2CAiD87462P+RGwaOjx5oPTz2n3N/
 INvrj6jl0R5pEskzppS86wWJ
X-SBRS: 5.1
X-MesageID: 58566233
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Czk8UaBveOVj0BVW/87kw5YqxClBgxIJ4kV8jS/XYbTApGkm12RUy
 WAYXmyFOPaPamX2Lt1+YNu19h5Q7JDQyNJiQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540087wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/yBeOuop/9
 NR3uLOgUzwNFfHNnctFXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvWXu4ECh2xYasZmJdCAR
 fg/dRRVYhHpZQ0QNgcvOq5lg7L97pX4W2IB8w/EzUYt2EDS0w5ZwLXrKMDSeNGBWYNShEnwj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCglee22gSAx0+TkagrL+yjUvWc81bA
 1wZ/Gwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4un25CPDCFQFdDNueMYdkORqRDkFj
 lDcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjT9HBm74j/m/LnwElSEbrvpzu37qbEQQcujuk8djL0t1gpDGJJimHB1LQ60RqiBNrGJrVil
 CJd8yR70AzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlbJm65M
 B6J51I5CHpv0JyCN/EfXm5MI55ykfiI+SrNCpg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DLejP3KJqNFLdjjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX3BUr8C2GNSJubq3BR5F6oS5pNCAgJw/wiXMifZyu/OEUcJ5uJesr8+lqzPhVS
 fgZeprfXqQTG2qfozlNP4PgqIFCdQiwgV7cNSSSfzViLYVrQBbE+4G4c1K3pjUOFCe+qeA3v
 6akilHAWZMGSgk7VJTWZfujwkmfp38YnO4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE3PnWoZ2oHu1yGlthM1PatbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7ZfwwlpQCfLYlCsBu8yK3WKx5AS5KhEx7sfsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WbkuFhyFqJbdoNJ8on
 LU6s8kM5g3j0hcnP75qVMyPG7hg+pDYb5gaiw==
IronPort-HdrOrdr: A9a23:e7Nz3694lOCzdRNbvTtuk+FCdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8vgdQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXwOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mIryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idmrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amIazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCT2B9vSyLYU5nlhBgs/DT1NU5DWytuA3Jy9fB96gIm3EyQlCAjtYgidnRpzuNKd3AL3Z
 WCDk1SrsA9ciYhV9MLOA4we7rFNoXze2O4DIuzGyWuKEhVAQOHl3bIiI9FkN1CPqZ4iqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58566233"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOuA13Jr4paky7+7fUA6yKvSfSKFM9MQrVot3vU8XMSaCsr2r/hbAOBnjdBvsmPbcHeQYQF63iXmjPQqlTLYpYFXsG2pMwVQa9i7fpW5CBvm0svy3g/xDeBihRi32n5TS1Fdl6yo7H5eVJGjGKlfanPrcW5y0SY1JtOkaAEhzG0mc3vQfAFxAFIrrG99fBJuwxKcHEt4V1UtKFsW5vWO84QKlqmeUCf6N2OhRvcMTu/DcVpeFu/QbkWJaefaHihG9TPWSH+50J7EVbzftjyZxg/xtcFdES6zztk/3mQJmxZWJLoJ9p3Hu0/4YCvFm+NRQdnNNrrVbGoEsfcGFtYsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNpL+w2RpxEXzvDwYtJ7L7SGl0DONk0ZKpymlGx9Wns=;
 b=i6Qxy9jG6djJSu+G+dI/cu/9OHP54Cm0bCq6CUo7VaqX2CWxGjQCkhMzXXKdqSxpVyQE+mPBEbT8isVVzagQ2nSursIzPh99ogDLUEfxm7Iw1ezu7g0jBAy14bSuiwIJzhzDAiLvVvDW00QSZwuRB6E2OVZpXrtjbcrmLcXF/q/6XSmhn7019rkvZxwToUhVJtU38spcMkbkQv5yaiMEEkLH4xsm7+umogrSXOrtKBwKXLmgMLKzyhAAGvGYMzQSIEEyQ9TAdecD0b5ZcVEvhjb0D/kxLupKYE511AkRalxFNA/A4XsZnKAcMGgrr1TfdLMTsEVVHAiT5cJhbQWrfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNpL+w2RpxEXzvDwYtJ7L7SGl0DONk0ZKpymlGx9Wns=;
 b=kqknSd5+3DQ+Ze6NEMHdf3dI95yO0WHve2j2ep7qiloQGiXwVebsCHFlX4+Qu46ovlIUgi6vo2Z4Lm1mKy4DA+q5BMN/GqosAHlbV8meqvP3ixSRre9aLfTXjIKcbvnoLUaEJUMvuVVF0YahjNZyg6674xUs9UGrTydV2KpQZVg=
Date: Thu, 25 Nov 2021 11:15:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian
 Jackson <iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Message-ID: <YZ9iQg4Hoo5Y6kyv@Air-de-Roger>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
 <cbe791cc-848f-8511-6974-2c9e300ea66b@suse.com>
 <YZ9WSfy3pYp8uzqI@Air-de-Roger>
 <614efba0-a3fb-7ddf-1fe9-d4fe2feb21f2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <614efba0-a3fb-7ddf-1fe9-d4fe2feb21f2@suse.com>
X-ClientProxiedBy: MRXP264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edde0f13-c2a8-424e-13d8-08d9affc8629
X-MS-TrafficTypeDiagnostic: DM6PR03MB3578:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3578E45E1AFD62CDA81A69AC8F629@DM6PR03MB3578.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UwisHRkN9me5bqiL3BF2+1ZgpT2SqfyVfts/knxrV09I0jE7Opj6OhyVsmrZcXJ+6FkzWjqLYzQh17YcOqWB48zaHLJ1IdG82NmFPR4ndhZquYYQbCoiTVYGN/6E4K6axgaXD3WlYi9DUPpy5sYSiuELE1w42YowBfyhinBiVd/tMPGaDquyd9yhXT4sg9TBf9KGssaDaRQB2NiKivz3DLyMYjcEQg85a2dlB9vz3Z3tH70P3ZaSjkbcefBoEET1CD7DzCW1PSvEUXwP4+CEU3mwQMSSsxdtgJ3L1OKgyypCSH4MggUKUmk0xYLvSJS16F4F/TpAxX98YTz8FBPKWl3jg/xSMBvk78EH+w14WCA9RHA2xyrSHDizJzH9drCs3vKiu/A5Qw4LfLLaIlGMEqL4MPqVod7TerQy9viBZa9HF/j2nU/fVhS/InhKB566quZiY4QBdZ77rskcqBU20utHRa+6TVvcSTshJuOeA9EjWmBIJcoWVKJXq35PRvP1TYQftXW5OkWiuG3Wdl7tr70ldlxJXbigNnK41Z+p5vL4ha/vxXJ3KwSqoeMqaXrTtayUYUqU7rx97i/NMDFQqMNZAxmIlUci/oXhoV3MSKtdMBDtZt/skQC0e4L8ADbjS9ebNK5u11vwf5YKsTQO7YwxoPnMG94a2Rd+tl6R3WOFkVD/YHjqpPnwHTOJVmZmKgbGbfBdirfNYdzPj4AOzzTYxpeVAR5bAKDro5JVMqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(83380400001)(86362001)(33716001)(508600001)(54906003)(316002)(8676002)(9686003)(966005)(66556008)(66476007)(66946007)(5660300002)(8936002)(6666004)(85182001)(82960400001)(956004)(6496006)(186003)(4326008)(26005)(2906002)(38100700002)(6916009)(6486002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qjc4cXg3WVd5VExnZDdwcytMTDRtSXEyVkJCamg3QjdVR0Y4R21DQVFmcW1P?=
 =?utf-8?B?UEp2SGZxeUN1S3JnN2R5aGVZZ3J6d05Wd1VEVld3SGp1aHhSUS9BdHVTV1Fl?=
 =?utf-8?B?SUhPcktFY2tEcUVSckRWZDhyN01FZEJRTGNSWXBYbElZZm8yeHp2bXNLeEFu?=
 =?utf-8?B?RlFGaXhBSFBkck5XSytpdi94b1Q4RGZxOTdjcTVrNDJBRGErY0REaVREMUNv?=
 =?utf-8?B?QmRkNUx2R2EwVUJsS2gxWkxDM2MwaHpHVkxDL2JaZTJqa0lnZEs3aUVnY1F5?=
 =?utf-8?B?M1I1TUFSVjBWQjhxQ2ZYU0o0VXBYWExDaFVwdkJNd3J4a3Y3Y0RBMitZMEo1?=
 =?utf-8?B?djkyd3I2WGRnOHoyb3FHM0g1Vk1QQlJwZ3JVOFNISXBpcVgzZmFJK05TazZ1?=
 =?utf-8?B?QUU4NDlIQy9lZCtmaW1zY0U1UzIrcVNQOW9HMW50OG80b3VlaFZaaDZiYVRx?=
 =?utf-8?B?RHdJVW1tN21Wc21tR0NMV05NeEFJMzdldHQxMGZZcDJ3VjlScXR1cTYrZG40?=
 =?utf-8?B?SWp4S3B1RmpUWXd0MndkTUtZMG1XOXFhblRUbVlwMEF5ZkhDMkxJSGxvTmF3?=
 =?utf-8?B?SHUzL2hJMzBDMkhBZjM0QlowQ0tUT3ZMQVE2ejZlWlQwK0p5Q2ZmSUN0alV0?=
 =?utf-8?B?d1NXR2thU2Zmbng3VWNkTHcrOE9WdDM3K3BKUStlSlVSSTlsSHd6cllyVmJq?=
 =?utf-8?B?OUhPQXJBV0dzcVpRTWRsemdzL1JLeVBXa3BRUWpBdnNOSG9CRER2dllMUnB6?=
 =?utf-8?B?VHFnT1dmbEh2N2NoS05lVWdFZWRRK3ZXbHlmOXROanBjMGFlSjhkMFZHeFBJ?=
 =?utf-8?B?cVFEZzM0Z2tnVjBFQXJ6V3FqZ0NJYldTTW4rWTVjWTlObjlIMTZuSnorYURV?=
 =?utf-8?B?WS9sYmhjc0ZOT0wvcExCM0p0RFcyQmxSZFlRRlAxL0EyZzZJTXNNME96Qmhr?=
 =?utf-8?B?YUdDZjhkWjVxRU11TVlLVWJvVjBaSXBBS05WTHVpZ25BVjQvT2ErQjhkZHRT?=
 =?utf-8?B?NVB0cGlOWTlOOHd5WXBON1Qvd0wzWlBGZVczdC9IZ1ZYNzJpY0JzZjI5dk50?=
 =?utf-8?B?UnUxanRLU1hOVnc1VkY3dWo4NUM5RDVoNTF4NGc1bW5BejEzcEJQWGZQRHBn?=
 =?utf-8?B?cG9FblBsajVEZHQvRFIzQU13UXk0SG9JaGMxWTJna2RuYU45M29WZ2oxQ0pO?=
 =?utf-8?B?Q2JwNmhOSC93SFl3MFJtZ2l5VVJCK2NXNU5FWkZRNVBHOXJEV2R0OEZkT1lJ?=
 =?utf-8?B?K2t3ajQwaWtMM0FxWjRsbjlLZXZNQklFYzJ2RXRXVnpZOG5ubEE0RFpwUm1L?=
 =?utf-8?B?U3g4bTZHT3RYRDZDU1V2MHY0U3BwQit0UTg1KzgyT1JiZDNweEpEZUljMVR2?=
 =?utf-8?B?MEwycndVaGtOQ2ltRUVZVVlKRnYyd0tBd1JxZjhQeFh6eG1iUVRVcVArcm4z?=
 =?utf-8?B?ZzduN1NnVEtGbVpnS1ZjRndNbEpyc0d4cnI4WEV2czR4djJ3UWlkZUdGNjhH?=
 =?utf-8?B?cnZEN2FwZk5iQks3WnMrbGFPVjNmSUNtRCtCVlZIM3ByNmVJOGhWeGhlRjFX?=
 =?utf-8?B?aUw3RFpDZHBkNFpBclkyc2MzWlpySVA0bmJGbk9vaU1kaDBsUzNXQyttajQ5?=
 =?utf-8?B?WjU2eGlNWHd3aVpxUW4xQ2l2c2tWYkZPc3FNejlCK0JzaElFYS8zWXl5ZGZP?=
 =?utf-8?B?WmJOcGZXN2dMOEVXSmJZVkVMYzBGS01ZajdCaTA4MjBYWS9KcFRTL2c1V2Er?=
 =?utf-8?B?RVQvSExIN3c5S1psZE8vR2F4ZFJRZUQxN3VGYjBuYjVPZmlKMUJuS01NMUdI?=
 =?utf-8?B?dEhUTUFsRzR3VmcyYzVIZ1hHS0RoWmdxQjYrdWwvM0ZzakNVZkNOaU94Ukxm?=
 =?utf-8?B?L3JVZ2p1YTM5UWFUcUUyUHhhZDVwK0ZjSGNIekVIN1pvR2k5TlVDZmRDMUpr?=
 =?utf-8?B?aXBQcTU3OERpUXdNWVlIbjZXYzBncDFGWThtQml3WjhvN3lYdDg2RTJVZDF4?=
 =?utf-8?B?eW4rK2QwK2lBeVlSQXNHUk54RjVYRFBBNndPOU5XTmlPb1owWFZoMFdFSk9u?=
 =?utf-8?B?UEJvNlp3VkVrc2hta2FkM3JNSVl4bGZrUHQ2QVlWKzJ0emV4bkdUb1lCdVh3?=
 =?utf-8?B?UWZONEtvNTFLd3c3eWJjVDdIa1J0d28vZFo2UVdjMUR2RUxnT3gxRm9yUk9t?=
 =?utf-8?Q?vDtk4MGKujhQBkIWd1lFEnM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edde0f13-c2a8-424e-13d8-08d9affc8629
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 10:15:36.8129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXZV1SHol3KRj/eFAavfFDzrDod7sZzIwDgJwX0b/kovDNMMY0ll4y08QZ04O2m70n/dfFZGHIh/6QEyyEnUwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3578
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 10:52:12AM +0100, Jan Beulich wrote:
> On 25.11.2021 10:24, Roger Pau Monné wrote:
> > On Thu, Nov 25, 2021 at 09:57:31AM +0100, Jan Beulich wrote:
> >> On 24.11.2021 22:11, Andrew Cooper wrote:
> >>> OSSTest has identified a 3rd regression caused by this change.  Migration
> >>> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4133)
> >>> fails with:
> >>>
> >>>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffffff, msr ffffffff (22 = Invalid argument): Internal error
> >>>   xc: error: Restore failed (22 = Invalid argument): Internal error
> >>>
> >>> which is a safety check to prevent resuming the guest when the CPUID data has
> >>> been truncated.  The problem is caused by shrinking of the max policies, which
> >>> is an ABI that needs handling compatibly between different versions of Xen.
> >>
> >> Would you mind pointing me to the flight which has hit this problem? I
> >> don't think I've seen any respective failure. I also don't think I've
> >> seen any respective discussion on irc, so I really wonder where all
> >> this is coming from all of the sudden. It's not like the change in
> >> question would have gone in just yesterday.
> > 
> > It's from a pair of newish boxes that Credativ and Ian where
> > attempting to commission yesterday. Since the boxes are not yet in
> > production Ian wasn't sure if the issue could be on the testing or
> > hardware side, so emailed the details in private for us to provide
> > some feedback on the issue. The error is at:
> > 
> > http://logs.test-lab.xenproject.org/osstest/logs/166296/test-amd64-amd64-migrupgrade/info.html
> 
> I see. Quite lucky timing then.

Indeed, it was pure luck that we got this just yesterday.

> 
> >>> Furthermore, shrinking of the default policies also breaks things in some
> >>> cases, because certain cpuid= settings in a VM config file which used to have
> >>> an effect will now be silently discarded.
> >>
> >> I'm afraid I don't see what you're talking about here. Could you give
> >> an example? Is this about features the flags of which live in the
> >> higher leaves, which would have got stripped from the default policies?
> >> Which would mean the stripping really should happen on the max policies
> >> only (where it may not have much of an effect).
> > 
> > I think there are two separate issues, which I tried to clarify in my
> > reply to this same patch.
> > 
> > Options set using cpuid= with xl could now be rejected when in
> > previous versions they were accepted just fine. That's because the
> > shrinking to the policies can now cause find_leaf calls in
> > xc_cpuid_xend_policy to fail, and thus the whole operation would
> > fail.
> 
> Okay, this could be addressed by merely dropping the calls from
> calculate_{pv,hvm}_def_policy(). Thinking about it, I can surely
> agree they shouldn't have been put there in the first place.
> Which would be quite the opposite of your initial proposal, where
> you did drop them from calculate_{pv,hvm}_max_policy(). A guest
> migrating in with a larger max leaf value should merely have that
> max leaf value retained, but that ought to be possible without
> dropping the shrinking from calculate_{pv,hvm}_max_policy().

I won't argue it's not possible to do that without dropping the shrink
from calculate_{pv,hvm}_max_policy(), but given the point we are on
the release we should consider the safest option, and IMO that's the
revert of the shrinking from there in order to restore the previous
behavior and have working migrations from 4.15 -> 4.16.

We can discuss other likely better approaches to solve this issue
after the release.

> Even
> leaving aside migration, I guess an explicit request for a large
> max leaf value should be honored; those possibly many trailing
> leaves then would simply all be blank.
> 
> > There's another likely error that only affects callers of
> > xc_cpuid_apply_policy that pass a featureset (so not the upstream
> > toolstack), where some leaves of the featureset could now be ignored
> > by the guest if the max leaves value doesn't cover them anymore. Note
> > this was already an issue even before 540d911c2813, as applying the
> > featureset doesn't check that the set feature leaves are below the max
> > leaf.
> 
> If this was an issue before the commit to be reverted, I take it
> the revert isn't going to help it?

I think the commit makes it more likely to hit the above scenario by
shrinking max leaves.

> In which case this information
> is interesting, but not applicable as justification for the
> revert?

As said above, while the commit at hand is not introducing the issue
with the featuresets, it makes it more likely by shrinking the max
leaves, and IMO it's a regression from behavior in 4.15.

Ie: options set on the featureset on 4.15 would be exposed, while the
same options could be hidden in 4.16 because of the shrinking to the
default domain policies, if the user happens to set an option that's
on an empty trailing featureset with a tail of zeroed leaves.

Thanks, Roger.

