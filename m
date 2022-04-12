Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B844FD344
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 11:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303537.517828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neCju-00009B-FR; Tue, 12 Apr 2022 09:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303537.517828; Tue, 12 Apr 2022 09:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neCju-00006W-CS; Tue, 12 Apr 2022 09:23:10 +0000
Received: by outflank-mailman (input) for mailman id 303537;
 Tue, 12 Apr 2022 09:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=to5A=UW=citrix.com=prvs=094341a74=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neCjs-00006Q-Ng
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 09:23:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28af536b-ba42-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 11:23:07 +0200 (CEST)
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
X-Inumbo-ID: 28af536b-ba42-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649755387;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/Gnjo/xY88ob8Hx229+4Bgq36VKYmqSc/6gVO/nOMLk=;
  b=bYwJ0XjCHXV5vR+rHhXpzxfv7K0L21gd/0Mp5bTDevyoqqnS+ecNuZ4T
   4p/v3H/FSDSJzBy3nIKLo9qID47OpcvB+7ueN4KoSMf/xWK+Xrx8kYd6J
   F89FQAD/Gk6w8mztEVTzdmDK7tL2w2d68uN4YXLRUfuC3RrMTLtbR4/w3
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68655857
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ABB1a66D4FRFo7wuL3kVygxRtBTHchMFZxGqfqrLsTDasY5as4F+v
 mYZWG+DOqnbZ2f3fY9+O4y19UNQ7ZXczNFlGlA/pHthHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTgWVvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS+Wwl2JKPvgdgnThxKN3ojHJBcouDIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQTaiDO
 ppENlKDajzFb1oIJU43M6gnxuqL33b4QWx8iAua8P9fD2/7k1UqjemF3MDuUt+HW8RT2FqZr
 2Tu/mLlDxVcP9uaoRKd+2+orv/Cm2X8Qo16PL+y++NugVaT7ncOExBQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nMEkS2Mw2
 HyQo+n0AC5L6+C0dGjHqbjB+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hid21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshTVflhdwTXGY3h+Y1FAd7fblUwZnY1QvEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/MmPNrgW5RzkPK9fTgAahwyRoARCnSWXFXZlByCmGbKhzy9+KTSufxX1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClY+QzF+VqWJmNvMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAgRDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:xtf53K0ai+EH6RGba6THAAqjBStyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXxOpFDNNKz0uHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T/s2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1Qdfhb2jf0RCWYsBHt0w7v3HIH7GLj80aRhT/ZrcnwVFsBerx8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVjlx/3DE70YKoKo2tThyQIEeYLheocg050VOCqoNGyr89cQODP
 RuNsfB//xbGGnqIEwxhlMfgOBEY05DXStvGiM5y46oOnlt7TxEJnIjtY0idixqzuN5d3FGj9
 60RZiA2os+CvP+VpgNd9vpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZWXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="68655857"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3Vi7gEbs7KByGdpO49C2Re+d72J+3tFIzg49SpNXO8xTx3gjCWGQO8OckTaQoOmKSN6SGF7YdNf8uin2GbD5VJQl5f5WQiLPClc+eK2sY4iLi9kaoTuYpAch5n7jzVsP2jrPIJJBpOc7OcaVisTOCAcUIZQdrqc7+06k+/DU4LXsaJMc9ewq7cFxjTq62SiNxEe0pNzMMGx/REi5NnwNMgrrktidgpc8J2Z2ZYqkMEfQxl/H53aMZz/3X6vOptb6iqMOCc2l0qJ9mFWwjWp4oseiAutj+DD3/eQnQUH84G32P0TXYK2DZAOXxeQeOaiKwchP4A2dOaRaVB9nC4ECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1xvT0fQk+N1z2+I1Q0QHhEkltRtiJLLoSK7wbUdhcQ=;
 b=nwy1qLV7BlWOdtz6MBeHeXhHwkSER3fgl3XwgfoHv4hB43a7hBXQGeuBqj4Gd8BpYvah57KWvU5+iPDdiaU+va0tRHMHCP7JX77ux3hO3F+U8Q9ee0B0RSn1fPofLH2BSvaM/7VU/7fUrzJizmf5PDGVNWV63YqNgb0ipLeG1qzzOYddk544j4gAXFZEjKxUkuRBqInHkyPWNDudMsXU32EyS/u6h6wcKhvjU9VakDEepYzB6pfMdOvxS5VmyHuZEPrmo43qqcmyMSUV++G7DEIoIfNbcJvhe2UB25RstiNk3No0sGTlPgxpYZqaOh1RPqRWLGgq+5RiZPe59LTDmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1xvT0fQk+N1z2+I1Q0QHhEkltRtiJLLoSK7wbUdhcQ=;
 b=QeqP4eB4bUnauX+1ZB6I2Lg4cn6hj/Vte5jyaI7i/OfAQUNQOCAr5+goacU//+hlvnjAwx1FL1gXYcChQrSn4Y5elQO7p1ZuOuCsotdILYGJ4ICTTSoGb0yKGMEMbThJmXwUmBQBviKfiDBH+M1uqy/UBu2oUHSV1gh0lEd6634=
Date: Tue, 12 Apr 2022 11:22:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 4/8] VT-d: refuse to use IOMMU with reserved CAP.ND value
Message-ID: <YlVE8ImYfQUPEPxn@Air-de-Roger>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <0f7136ae-0b52-431d-f789-4b7d5bbecb25@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f7136ae-0b52-431d-f789-4b7d5bbecb25@suse.com>
X-ClientProxiedBy: LO4P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c820fe70-a521-4512-871c-08da1c660a65
X-MS-TrafficTypeDiagnostic: BN6PR03MB2979:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR03MB2979417B5DE5261D981B424E8FED9@BN6PR03MB2979.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPeb3vvUOAOV2xVwjT8H79ev9V4g1BDCf9/NX1LjqFckf4viVkr3SpJxdGkVoHocQdt5ABMiIWGiQl7U7PjUu/6kftXhRfygJAvAoOB9X14CVVxWmlPFAuOrddXLZ/iOo1lk0DpUwq8Co7gjgl/0kJK2+hs0g9HNapKYSOTkh5So1eMOzm4PaGMaES+73QSOMmvZRvUksGoKR/dl7x8DSkxiv+2/jL2r/CySylaslsCTsirC5UkKDqryPMc+D4/2bNLVDpUNfN3xmKJ1UZmePydtibvy3u+oE/KOTpwQmNJbeA1xroff08V3DcvE8CKNL84CMQ9APyytR77XLZUgjWwfayWdL+Ke0yYScT9F3rqOlB5sDZiUEqVF6srIj1kGJHgBln1ARClV6YGw+zLmTeZ9aIcvwbaWz59jLshP43lozo81XMeKdjzfIBec6yxAudDFMTKm31xDDbx5baypM11VpiJ+27rZ3oYvULe/mSs4XzC6LSAl4DWy6BK0TX+3U9AeFGaKineeBqfhDbu0jXOR/fRpxerr9wh05jjHiSrze4smGlu6CgIIYuYCBJAPU/OVUWqBCEnpKPZdSkjHBicvfwHcHBZGREfZHqEHSCQU19lA+bXGHWi96uUe/2b3mhXNIyiJOLBvncVoVk2dSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(6486002)(4744005)(85182001)(2906002)(8936002)(4326008)(8676002)(38100700002)(66556008)(66476007)(83380400001)(6916009)(66946007)(54906003)(316002)(33716001)(508600001)(6666004)(9686003)(86362001)(26005)(186003)(82960400001)(6506007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDN6ejJCUGk0dFlVTXVGZUFYU0t5ZnFhVXRVSXdPejhsRUFWcU9vaHUyNDlP?=
 =?utf-8?B?VVNKQnUrTzlEbjJ5SU9rdjkyY2dtZGd0aHJOcVp2TnhtM2pyeTg1TnZtSFRZ?=
 =?utf-8?B?VGJjZWRPblB6eEp5QlhsQ0pnNzBONW5CTVdqTUp4MjFBbFFXU1J3WC9LWlNt?=
 =?utf-8?B?Y3ArSVQ4eDZPZlBRcHZ0NThNV2lKTGVNSTZRK29LNFJKdWppMXVLZ2wyTnl3?=
 =?utf-8?B?dXAzQm9hNjlCWU4xRXFZdUg5TjJ2Y2VwNFg0UkVMeUlGYWZMRWFZZnVyMXhw?=
 =?utf-8?B?Tyt5MzROa1V5WldFVGVUR3hIUkVoWkVTUURaTmU0K0Zaa3FtZWxHUjdVZTBs?=
 =?utf-8?B?N0pLRU1hLzU2eDhLU2F3U1Brd2RqVHdKQmFlb3AzYUEzZVNlc1AwZnpvRXQ5?=
 =?utf-8?B?d3lOVkxxUmNOT1dna0gveGJtb05jMWZ5NWZva2VZaWVhRDVVZVhyYysrcW5r?=
 =?utf-8?B?Sy9ZUVZOT0ZJUlBTWDNLMlAyZ2YydUNDQit1disxZlNiS2h3UDBzSGtQUExr?=
 =?utf-8?B?U1lqOVJDNmRUTDVGcTRTa1dNbzhyTVF3Tnk1N2FOYURNWWg0dHFpcjcvOXJh?=
 =?utf-8?B?NDlwb2ZaRUhYREpjMFVEZUpYR0ZCYVVmbEdiVTNBbzR3N3d2MHBoYnA2emNQ?=
 =?utf-8?B?QU0yUHo1RDYyUmNrWHNnbWNKSW5rUVpZYmt1ZVdQUjcyR3VZQThBWnhva2pN?=
 =?utf-8?B?V0ZHNnJ6QlE2eEF2U245NXo0NWk3QTNzQWJCREVQQlIwMlVMRnN5Sm43YjU2?=
 =?utf-8?B?T01wSndXNTk0MmkweDFHbCtVdmp3aVlRY01MRXI5Q0VtMmlWNjRXTkpSNXFB?=
 =?utf-8?B?SWJvRnFIWE8vV0VKZjZGL2s2UjArM1QyVWFQSk9tbWNoTnBJWVo0bmh4MnBn?=
 =?utf-8?B?U3dIOGl5T1N1QWM2bE1EQU1DRGVaYnZudElwS0xkaVhGVlVmOWtjWnh2N2Jp?=
 =?utf-8?B?RHVCUDBxQVVtcmhWaWR5Y3Qza3Vha0RPcXF1Wm1FSDJKRTZjZ3RTTHVZSnFq?=
 =?utf-8?B?Zm5RWk5uaEVZRWNPdXVBNjdmSGRwcDRXWmt2UGZ4WTJQTmpBWUpicEFYQU5v?=
 =?utf-8?B?UzJMOUc4MlpsY2JJczRZdThWY3lueXRjaXA4akFCSEtJblNPeFgvVy9sbzRE?=
 =?utf-8?B?VVlWakUzSEFYcFVqOW1iRVNMQkpGRm1WMG0xRE9ySE9Xc3lwSlRENDVGSlVI?=
 =?utf-8?B?cWY2MnZmazVXS1gwdGpEd1ZyOFViTHQ3WXdKS2RmRUpYOXR0UWNNZGRLbmo2?=
 =?utf-8?B?UXJuYVFiQmZFT1dLTkdyUjVrWkd4RjJpa3VOQzR3Qy9Nc1AybVNaSzBzSC9k?=
 =?utf-8?B?bjRWQUZKeGROQXViT3IyN0hNSHdCbW0xeWIyREJnTC9wM3R4c29FaVVDZHg4?=
 =?utf-8?B?aFNla3FhU05vc0hlY1dibCtrcENMRDljYlhOWFhkZ21STGJ0Qyt4TUwvcTlv?=
 =?utf-8?B?cU5kMUNTVXNrSUxVanA3RmE0cHRidFZMNHo5YSszOWhoQXFJN2E2WXdoR05u?=
 =?utf-8?B?NU5RUjJrelNJRG9pTlBJd2V3cEN4UkE4SUJPQURmcGF5MjFLaHhVVSs0OGtr?=
 =?utf-8?B?UUNtUzVySmJMdFI2TlUyQmRTcWQ5bFo1YWtzZlJ4UGp2ZXVvQ3FWSE9QRFBz?=
 =?utf-8?B?MFZmcmNMS1lXaVJrREFITDRvN05lalhrZTdNWXJ3NWE4dEs2Rm9DM0FKWjVh?=
 =?utf-8?B?WGlpd0tCSTdCZC9hTlhaZCtxM3d5K2FSZG82cGV5WHZIQnlienJySTJNRFBw?=
 =?utf-8?B?djREMjZaVUFsSXZnVzQrTTcvMmQwQXhVbFdlam04ZXFmWkcwRExFTWRpdlZr?=
 =?utf-8?B?Z0liR0ZDR045Unk5SEtyVFJoV21mU21iMlpacWdvRmRxUU1nc21Gdmh5cWdh?=
 =?utf-8?B?WEtCeW9SQjNoOU52aElheDQyM3NqMmZmMkt6N2xONDUyaGprUkl1S0hEUVN6?=
 =?utf-8?B?SmRvdk1LbXV5MHdGSnV2aWxKV0VmTFplQkp6aFF4clYrdFpkby9ndWFyMUFK?=
 =?utf-8?B?RnVNNnd5UUhjMnR3OUdtMHVkTThXVm9QQTVVY0VLNXNxbW9zRGwyQzE3Uzln?=
 =?utf-8?B?V3hBZ2FtNlFXU2puRmxzSCs1cFYzalBIaWNsU0xRVEV5QU5IWVRZUFFTeHYy?=
 =?utf-8?B?OFRKWWs0VmJYbHhVVVh2VXVWWTdwRms2cHdsU1dDdThIUnp6ZlZmWkZ1allC?=
 =?utf-8?B?UkNUYVR2UDdYbnNsRnFrU1I5SWoybmpzUk5GVlR5MzR0TmZiNDdkMk83Sy9E?=
 =?utf-8?B?YmhQM2hVanEvT0VBZktVS0c1VXhCMlZ0b3BnR2NoQ1ZZMkZ2c05YQ25JdTJQ?=
 =?utf-8?B?WEM5dXQ1WGVrL2N6cnRhZFhwVm8zZHNXNUY0QmpMazJBcmUvNGwvbHAzdXZU?=
 =?utf-8?Q?wtVQfDih+QJ9Xkts=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c820fe70-a521-4512-871c-08da1c660a65
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 09:23:01.4431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5ewk/f7DI0HxDgP63WC/DbPEOs5/VSeLBxP6TSLdmK2QGeMiP7cCFDaiMGVWwvyvE48Vniv3mY3Yo9ataVsAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2979
X-OriginatorOrg: citrix.com

On Mon, Apr 11, 2022 at 11:37:28AM +0200, Jan Beulich wrote:
> The field taking the value 7 (resulting in 18-bit DIDs when using the
> calculation in cap_ndoms(), when the DID fields are only 16 bits wide)
> is reserved. Instead of misbehaving in case we would encounter such an
> IOMMU, refuse to use it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I would maybe prefer to get more specific error message rather than
"IOMMU: unsupported" and a dump of the iommu registers.

Thanks, Roger.

