Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220314A7595
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 17:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264346.457420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFIGD-0005b8-IC; Wed, 02 Feb 2022 16:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264346.457420; Wed, 02 Feb 2022 16:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFIGD-0005Yt-E0; Wed, 02 Feb 2022 16:13:33 +0000
Received: by outflank-mailman (input) for mailman id 264346;
 Wed, 02 Feb 2022 16:13:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAZh=SR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFIGB-0005Yk-BS
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 16:13:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dd6e8ca-8443-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 17:13:28 +0100 (CET)
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
X-Inumbo-ID: 0dd6e8ca-8443-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643818408;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sq4c3yben27DwdS4YR4p3uZnSL++3geId4sKdu5V/34=;
  b=a5+PdnOx5/zc289mJNMbQns7158FUFiqCOSoXqQdyjSarR6meQgP826u
   iwOTVw7/L0Dd9aaTeOvpRIFwP5rcWYd3uKnxyZH+vkVx7JiToPD7DNt91
   jzZETJxXuZLzra2l8fyn9UjPTcEzSaaT2i/R8WNN0uCaXm2pC607y+8VN
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wBIQR5nyzNMDc+p6JVKXU9CGFc/LH1xrLFzdk9Ca3gEtutfErZL5cljCCO2rCibV3JdrJvG7lj
 tJfbRYYckcoR3mHgFxfp6w5YQFm9XNLx0RP1vm7Yl+cnP798+KX3V2kqfr7DELU+nhPxPQe2Gj
 sUGy2l/OjrQHhToLPd/kqmTwuXOb9VgoRovmkWaUMTDbncoYN5YWCTCSMahj/I/rTGzjWFZw74
 ArcAyCoiPQx5q6BNWe/RgP/BM6s/ZoXbE3L4RUeBnRLUydDUzW2gZXQNDwavRjnAse2ECnY66t
 iqMSbk4Wpsm/1SsmJoH6kQ82
X-SBRS: 5.2
X-MesageID: 62799540
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8kUUHKzqS6oH3DFZLr56t+eCwSrEfRIJ4+MujC+fZmUNrF6WrkUGn
 DQeWWGPP/yCZzH8coonPN7l/R8EucSHyYcyHldu/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZj2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt817m
 MQWkoWJcgYWPbXrof4ZXxhyLggraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYECg2Zh25wWdRrYT
 9ETaQU+fC/eWTtOHggVMq1ug9X03ECqJlW0r3rK/PFqsgA/1jdZzLHoOcH9Zt+OSMNaj0uc4
 GnB+gzRGgkbLteWzTOP71qmh/PDkC32Xo4fDvuz8fsCqFSS3WUSDBQ+X1qnrfS3h0iyVsgZI
 EsRkgI2pLU23FymSJ/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqWMMfZVJbuZ+5+th110+RCIY4eEKosjHrMSz6k
 yHRizEHvLQsjtYs7r+/8VHtvhv58/AlUTUJzgnQW2uk6CZwa4ike5Gk5DDn0BpQEGqKZgLf5
 SZZwqBy+MhLVMjQz3LVHI3hCZn0v67tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JmCMf4fj2GZUZ1CIU3c+TPNDai8Uza2SsItHDJrBQk3DaJq40jjkVI3jYY0M
 oqBfMCnAB4yUPo7l2XqHrZMjOZ1lkjSIF8/origl3yaPUe2PibJGd/pznPSBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07djg3wYwALcmu8aR/L7fbSiI/QT1JI6KPndsJJtI094wIxrag1
 izsASdwlQug7UAr3C3XMBiPnpu1A8YmxZ/6VARxVWuVN48LOtfytfpPKsdsINHKNoVLlJZJc
 hXMQO3ZatxnQTXb4TUNK577qY1pbhOwggySeSGiZVACk1RIHVWhFgbMclS9+S8QIDCwsMdi8
 bSs2hmCGcgIRhh4DdaQY/WqlgvjsX8YkeN0fk3JPtgMJxm8rNk0c3T83q0tPsUBCRTf3T/Gh
 QyYNggV+LvWqIgv/diX2a3d99W1E/FzF1ZxFnXA6erkLjHT+2eumNcSUOuBcT3Hennz/aGuO
 bdcw/3maaVVl1dWqYtsVb1syPtmtdfoorZbyCViHWnKMAv3Wu8xfCHe0JAW5KNXx7JftQ+nY
 W61+4FXaeeTJcfoMF8NPw55PO6N4u4Zx2vJ5vMvLUSkuCIupOibUV9fNgWngTBGKOcnK5ssx
 OostZJE6wG7jRZ2YN+KgjoNqjaJJ30EFa4mqosbEMngjQ9ykgNOZpnVCynX5pCTaooTbhl2c
 2HM3KeS1a5BwkficmYoESmf1OVQsp0CpRRWwQJQPF+OgNfE2qc60RA5He7bleiJIsGrC95OB
 1U=
IronPort-HdrOrdr: A9a23:n90JJq/Ei7nYLXYaiIpuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,337,1635220800"; 
   d="scan'208";a="62799540"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPUzUjBfe5PtrgZpf1ME/IVffgNvoPNY2BM8Zd2lYl1abwrmYyHlkm9Ji2JvFkVP56vJUb57o8+E7QPy7G7ZxO2HzzoQxTsdsY4lTL/EC7t41ciNvM5wW1xojujYIZ6t2OuWsVgBscKf5797bUF6MEMK4h1Wm5RzNlbKsJguvHqw3uqPEpsc7ZL/32LvqYARgWFqhRzfLAi1hgGHP8WiA9awvtaJvLPVHoFZdqAtuzYpVoJNS2ea6NDnItBp7Dz8BGDxdZPFDq3yvDrB3Y0ljLovx2EOjrWQtq2mSLZbd6paN+ahMJcvIcR8QzJrXioAyS8gNkacGuo7cJD0PtmFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wI/5xrT1lExdJ0pV+JJXv2YQ/AZnziy2JyXWmQQBDF4=;
 b=CJlosZLmUjVioBJxZbzpGMDPkO0U4aoTp99Q4jd/HtwmBUj3lVHJkdwcOVclbPKqJgxP8tazbvNLPGF/bm4DavkBYpsPFh/GBrQKC2kuMvE/Z3l85fdt7s/nFJLTIdEAost1Z4MZqQ7/r66IU+U+erh1JtvvxI8v3jv0c+vuW9dUOtwj44zcoHbiJx8yv4pOOQ8Z9O027OJySLbRrCXmFiDEvmhZg+d7BqiwQW8fOvdrpCAnuM7qIDWzaAFMn157lctUaARA1WffKWlbYoZ5En2YSYOnp1rtcIzlk6M9t3jhgVqHZiibGBTW9QodL4ZavpbD9Jmf+W/OBJ6XVtIOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI/5xrT1lExdJ0pV+JJXv2YQ/AZnziy2JyXWmQQBDF4=;
 b=Bp4xyZ53TZQlK64Lt88JTTvJC51VNYRb5w2Wto30Sv1PbGIGMIAdRXplhv2mPVlXNuWQI2lqBhSx18rsfCSkYQXOUjAr9m8o3JQ3iL+X78PigzzjoonhsKEx/7P0mtkdK3hS6L47d22iRV6LDHdLs9LzakV20m3asGMLFUyOZ5M=
Date: Wed, 2 Feb 2022 17:13:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: [PATCH v3 1/2] IOMMU/x86: disallow device assignment to PoD
 guests
Message-ID: <YfqtlZMAKd/HXsgf@Air-de-Roger>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
X-ClientProxiedBy: LO4P123CA0204.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc815b8b-6157-4bc3-25cc-08d9e666ea8b
X-MS-TrafficTypeDiagnostic: BYAPR03MB3957:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB39571CEB8A1EF8496612E74A8F279@BYAPR03MB3957.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TygixpSyqK8+uSOeXBCJUYfSbpskw1s8fV2YsKv00/koeVOjjgEe+VaewtR6EXCvCWGvrFKZp1AREiujEcXmjfXCDI2Nj/0qc/YOCj2wNxPn+Ji8OkpNhndGePriXWhtu5EE8ykeobTW7fejLZeiMhyapD30N1dxqPvhb1xbTExqhmLPMCvEnwJylqig7NVha9NmoGSVXi/zWmDFHL3gi58NVDUCwaRz6xyrwQ6ydQHLRELSwuiI0pyNOzKg+97xysm4TtUY3Bb++0tTDNkgbdcS60i+sZAkSmrO2xlqlddhXENmeAKKukkX7CnIO4hbgqdc8ygmUTGsX0QfKclZjkEBReKqihNrh+sR1QKuaUh9vD4uQpyego013WtHRkNTwcThfQvkj6lzseOd5VZd19ut+97QNXoiNgxZhIWYC81aytOOFRZOEfS50a6aOlOyzR2TjXWV+AQDYK5DwEaRD5VltWJf+aR1+7KN3QU4hb2hxXfiqgGsXVw1PwMq7VDTjiNaterLMmdJ2Jm2W7KB9E7ldQ7rsxBRNkmNjhJy6bdhMgCrJzNttEWbMGBI27/WN9tYA3GvgjR0c9p4gzntf0JmMSkDdUfU40N3W8CvxEBFkD9voU0dHx6nsIvcIjJgCmFIeh/d0crKrbhz/fP88w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6486002)(5660300002)(186003)(83380400001)(2906002)(6666004)(9686003)(85182001)(6506007)(6512007)(26005)(508600001)(33716001)(66946007)(38100700002)(6916009)(82960400001)(8936002)(8676002)(66476007)(4326008)(54906003)(316002)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlJ2bHRDVllONFZyaTFqMlRyNGVyUm5Dd1N1Q2cxZW14V0Y5NGFtT2xOV1Zv?=
 =?utf-8?B?VlRQV3hnKytlQk1EcXh6eWQxdlNidG5nRjdLNE9TS2QzUGhQaXpiczJDR2kx?=
 =?utf-8?B?NXpLVW5qalNDam5ZT3hrN3M0dkp1Uk5ENHlIcFF2V3IyUWJ2d0tFa3JzOXpP?=
 =?utf-8?B?OUtmWktSUzRqRFE1T1NSa3RQcU9VZHcwM01qZGlVNHY4OUxWZmxHdW9jblNn?=
 =?utf-8?B?NkVUbDlxVDZZeU9zdHhCNEVjUjk1YldUTVMxNEk3NldXVHlsTUo0dVFjdVpr?=
 =?utf-8?B?dzZpTG5zRWREWEY5NjdxQ1FvVTBSVnl3UVUyU1pQaFNMc09iRFlXYVo0cGRn?=
 =?utf-8?B?cDRsU01zMTBncW1CTWpOQ00yVzNUSzV0dE42YjY5L3FDWFhqN1BHM1FsUEFu?=
 =?utf-8?B?aUZ0UTQydU4rdlhBRmpkYzl4OE9aZjdlRlpHaVFWS0JHdTQyaFhRSG1WRmxp?=
 =?utf-8?B?ZVNrbGRqK3hib2xyM2NMSGUwTVl3RU0wNVk2VGpSNDJRNEFQUjJIRkNySmFh?=
 =?utf-8?B?WnRlb0QzM1pqZFdFMDlTQ1AzVVR6bkpaQ1ZzczJ4V2tBWmVuK2xNdEZGWVQr?=
 =?utf-8?B?UlVEUnVncklQSWVocGQ0WVVzN2F0SEJaUlhlcEtWb2hQZDlvcUZ1MFlGWEZ6?=
 =?utf-8?B?TnpBaU96cW9KaGJGME8vSXk2N3lrSUUzSzFLenNBNWxmaGpyZVJVcE85a1Yw?=
 =?utf-8?B?OUcrbmkvTVdrdzM3MGVSNVdyU1RkOEN1ZFlIZC9CWU5zZk9BVXFwWCtqV1Jw?=
 =?utf-8?B?Y0ljUmdUQlBQeCtzS0xnOFdheVVFS214azRkQkNVckN4SytnMitQWklySHNp?=
 =?utf-8?B?SllySThxR2hqdE9XNTBiSjJ2RFR0MGE4dVVPNW1WbkR0S3MvWDlEeGNaaGdI?=
 =?utf-8?B?emNIa0lWZGcwcjNZekRkSlo2WFoxeU9QaFdjOFlUNkNYdXJHeEgvQWY1Z1Y1?=
 =?utf-8?B?ZGdJTkNpQkFOWDZJWnNTWGxQOUVBWm5PbWYzclJZM2l3WWtjVlRCODYzdzFR?=
 =?utf-8?B?Nkc0aWNGZzhRZHRPWHBWQTBNWUZITjdxa0NqOWZmTWlTZFpLYkMrTExBYmx0?=
 =?utf-8?B?OERTcTh1aFp0aXlrb1dpamNPYjNodmtjVzl0WXhITVEvc0xOUE02cU9yTXVM?=
 =?utf-8?B?WmhtYVhRS2FLMlBNWTFWdUpDc3NSaUxTQ1FnaTVHVnpPWWhCRXUycHh3Qk8w?=
 =?utf-8?B?S0F4RkxkeFB0NUtzOEIrRUt0TFdvRE9tb2dBWkU3cFR6ZWhWTW55YWdaelZM?=
 =?utf-8?B?MzBYcjBJeDh3TmtHZjdDODl2N3lVbmlRbjA4WnREbmtjZXpsdVlJdWZBNERp?=
 =?utf-8?B?V2FEdFU3eUhUL2RVWmVTaFBvWGRXWjVBcytHb2JwSDNFVERiRVhSbnQyWUI2?=
 =?utf-8?B?cFluM3pGMEVmRjJpTi9RQUZDZ3crSFpDY2QyWGtUYlVuc1grYWQ5aG0yaG1X?=
 =?utf-8?B?THQvRnI1ZDhELzFUemZQMlJwSXRhTmpXQUxIU29pMi9FY3RTV0hsaWQ1Tk9k?=
 =?utf-8?B?UC9MVCtrZ2hpUlRrbVJlUnFuVStGNzE5OEpFeVc5Mjl2dFFlcDRvb0E2RTBu?=
 =?utf-8?B?STBKOG1OMzJRL3Zuc2VSdVBjZHdZaDNYR2tWcXZGRVlHUENvK0RaM1puOWtS?=
 =?utf-8?B?TEtPemlLd0luTGhtMzJObVFsNFdIR0hkbWNBdE53YkxCeVEvWW1mVVp2U3Fz?=
 =?utf-8?B?WnhpOE90YnpNVm1DbTFhSUxPdXVtenJXT21OSEpSbkFFVjM4RmpuWER6ZUdC?=
 =?utf-8?B?Z09nNGsyWjZ2NmRtYXA0TWI2Zkpwb1h2bFJjZUlYU1kyU05ScU1YditheGFq?=
 =?utf-8?B?WkZJR3NKbTF5ei9VdEIwYjNsaS9pcHF6eDVCOVlhcDVGOERwOUJuY085aUdo?=
 =?utf-8?B?MVdYSTYvY1MzbWZESnQ3a2cza2h4ZTJJYlZDTHRsekVkYWVxc3ZJNHRrQmww?=
 =?utf-8?B?U05ncUdEVWxDNi9yZGRPZ2UvTkhRcVh2SFdXUWRoWWVWbXFMSkpWU2xjbWhC?=
 =?utf-8?B?Sm5WT1lKY1oxTTlqb1NOdEptM1ZzOEFYQk5ZM3ExME01bGFtLzBqR3ZwTnBz?=
 =?utf-8?B?REF1RDRMckw0cmNDcHhNT1l6YjN6Sm9vdXZWZ1hhU2RwdmhIanJ3UHhUWk9S?=
 =?utf-8?B?TWZkUDhHN3hnRHpDQk5xOVBiTEVjUnc1dFhKMGwyTy9kMklLVjhaTDVGWFly?=
 =?utf-8?Q?pkQEyf6jxsrn1XYm5k2GwXE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc815b8b-6157-4bc3-25cc-08d9e666ea8b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 16:13:14.8019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYzLPCxijTda5mxFZ66BGGKJWuta/vJFuF5zKt8Ks7WbYJX+XSSqGjxsAfbMiDbsxYMIyiss0+OhRz5a7qbrCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3957
X-OriginatorOrg: citrix.com

On Tue, Jan 04, 2022 at 10:41:32AM +0100, Jan Beulich wrote:
> While it is okay for IOMMU page tables to get set up for guests starting
> in PoD mode, actual device assignment may only occur once all PoD
> entries have been removed from the P2M. So far this was enforced only
> for boot-time assignment, and only in the tool stack.
> 
> Also use the new function to replace p2m_pod_entry_count(): Its unlocked
> access to p2m->pod.entry_count wasn't really okay (irrespective of the
> result being stale by the time the caller gets to see it).
> 
> To allow the tool stack to see a consistent snapshot of PoD state, move
> the tail of XENMEM_{get,set}_pod_target handling into a function, adding
> proper locking there.
> 
> In libxl take the liberty to use the new local variable r also for a
> pre-existing call into libxc.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> If p2m->pod.entry_count == p2m->pod.count it is in principle possible to
> permit device assignment by actively resolving all remaining PoD entries.
> 
> Initially I thought this was introduced by f89f555827a6 ("remove late
> (on-demand) construction of IOMMU page tables"), but without
> arch_iommu_use_permitted() checking for PoD I think the issue has been
> there before that.
> ---
> v3: In p2m_pod_set_mem_target() move check down.
> v2: New.
> 
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1619,8 +1619,13 @@ void libxl__device_pci_add(libxl__egc *e
>      pas->callback = device_pci_add_stubdom_done;
>  
>      if (libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
> -        rc = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
> -        if (rc) {
> +        int r;
> +        uint64_t cache, ents;
> +
> +        rc = ERROR_FAIL;
> +
> +        r = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
> +        if (r) {
>              LOGD(ERROR, domid,
>                   "PCI device %04x:%02x:%02x.%u %s?",
>                   pci->domain, pci->bus, pci->dev, pci->func,
> @@ -1628,6 +1633,22 @@ void libxl__device_pci_add(libxl__egc *e
>                   : "already assigned to a different guest");
>              goto out;
>          }
> +
> +        r = xc_domain_get_pod_target(ctx->xch, domid, NULL, &cache, &ents);
> +        if (r) {
> +            LOGED(ERROR, domid, "Cannot determine PoD status");
> +            goto out;
> +        }
> +        /*
> +         * In principle it is sufficient for the domain to have ballooned down
> +         * enough such that ents <= cache.  But any remaining entries would
> +         * need resolving first.  Until such time when this gets effected,
> +         * refuse assignment as long as any entries are left.
> +         */
> +        if (ents /* > cache */) {
> +            LOGD(ERROR, domid, "Cannot assign device with PoD still active");
> +            goto out;
> +        }
>      }
>  
>      rc = libxl__device_pci_setdefault(gc, domid, pci, !starting);
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -20,6 +20,7 @@
>   */
>  
>  #include <xen/event.h>
> +#include <xen/iocap.h>
>  #include <xen/ioreq.h>
>  #include <xen/mm.h>
>  #include <xen/sched.h>
> @@ -359,7 +360,10 @@ p2m_pod_set_mem_target(struct domain *d,
>  
>      ASSERT( pod_target >= p2m->pod.count );
>  
> -    ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )

Is it possible to have cache flush allowed without any PCI device
assigned? AFAICT the iomem/ioport_caps would only get setup when there
are device passed through?

TBH I would be fine if we just say that PoD cannot be used in
conjunction with an IOMMU, and just check for is_iommu_enable(d) here.

I understand it's technically possible for PoD to be used together
with a domain that will later get a device passed through once PoD is
no longer in use, but I doubt there's much value in supporting that
use case, and I fear we might be introducing corner cases that could
create issues in the future. Overall I think it would be safer to just
disable PoD in conjunction with an IOMMU.

> +        ret = -ENOTEMPTY;
> +    else
> +        ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
>  
>  out:
>      pod_unlock(p2m);
> @@ -367,6 +371,23 @@ out:
>      return ret;
>  }
>  
> +void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    ASSERT(is_hvm_domain(d));
> +
> +    pod_lock(p2m);
> +    lock_page_alloc(p2m);
> +
> +    target->tot_pages       = domain_tot_pages(d);
> +    target->pod_cache_pages = p2m->pod.count;
> +    target->pod_entries     = p2m->pod.entry_count;
> +
> +    unlock_page_alloc(p2m);
> +    pod_unlock(p2m);
> +}
> +
>  int p2m_pod_empty_cache(struct domain *d)
>  {
>      struct p2m_domain *p2m = p2m_get_hostp2m(d);
> @@ -1384,6 +1405,9 @@ guest_physmap_mark_populate_on_demand(st
>      if ( !paging_mode_translate(d) )
>          return -EINVAL;
>  
> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
> +        return -ENOTEMPTY;
> +
>      do {
>          rc = mark_populate_on_demand(d, gfn, chunk_order);
>  
> @@ -1405,3 +1429,20 @@ void p2m_pod_init(struct p2m_domain *p2m
>      for ( i = 0; i < ARRAY_SIZE(p2m->pod.mrp.list); ++i )
>          p2m->pod.mrp.list[i] = gfn_x(INVALID_GFN);
>  }
> +
> +bool p2m_pod_active(const struct domain *d)
> +{
> +    struct p2m_domain *p2m;
> +    bool res;
> +
> +    if ( !is_hvm_domain(d) )
> +        return false;
> +
> +    p2m = p2m_get_hostp2m(d);
> +
> +    pod_lock(p2m);
> +    res = p2m->pod.entry_count | p2m->pod.count;
> +    pod_unlock(p2m);
> +
> +    return res;
> +}
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4778,7 +4778,6 @@ long arch_memory_op(unsigned long cmd, X
>      {
>          xen_pod_target_t target;
>          struct domain *d;
> -        struct p2m_domain *p2m;
>  
>          if ( copy_from_guest(&target, arg, 1) )
>              return -EFAULT;
> @@ -4787,7 +4786,9 @@ long arch_memory_op(unsigned long cmd, X
>          if ( d == NULL )
>              return -ESRCH;
>  
> -        if ( cmd == XENMEM_set_pod_target )
> +        if ( !is_hvm_domain(d) )
> +            rc = -EINVAL;
> +        else if ( cmd == XENMEM_set_pod_target )
>              rc = xsm_set_pod_target(XSM_PRIV, d);
>          else
>              rc = xsm_get_pod_target(XSM_PRIV, d);
> @@ -4813,10 +4814,7 @@ long arch_memory_op(unsigned long cmd, X
>          }
>          else if ( rc >= 0 )
>          {
> -            p2m = p2m_get_hostp2m(d);
> -            target.tot_pages       = domain_tot_pages(d);
> -            target.pod_cache_pages = p2m->pod.count;
> -            target.pod_entries     = p2m->pod.entry_count;
> +            p2m_pod_get_mem_target(d, &target);
>  
>              if ( __copy_to_guest(arg, &target, 1) )
>              {
> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -639,7 +639,7 @@ int vm_event_domctl(struct domain *d, st
>  
>              rc = -EXDEV;
>              /* Disallow paging in a PoD guest */
> -            if ( p2m_pod_entry_count(p2m_get_hostp2m(d)) )
> +            if ( p2m_pod_active(d) )

Isn't it fine to just check for entry_count like you suggest in the
change to libxl? This is what p2m_pod_entry_count actually does
(rather than entry_count | count).

Thanks, Roger.

