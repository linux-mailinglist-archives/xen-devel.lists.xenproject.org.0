Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B55936F8B9
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 12:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120460.227803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcQpx-0006jy-UK; Fri, 30 Apr 2021 10:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120460.227803; Fri, 30 Apr 2021 10:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcQpx-0006jb-Qn; Fri, 30 Apr 2021 10:57:33 +0000
Received: by outflank-mailman (input) for mailman id 120460;
 Fri, 30 Apr 2021 10:57:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcQpw-0006jT-70
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 10:57:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f03a6514-133f-4d1f-b677-cdc8fc12d585;
 Fri, 30 Apr 2021 10:57:30 +0000 (UTC)
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
X-Inumbo-ID: f03a6514-133f-4d1f-b677-cdc8fc12d585
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619780250;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AuRN35QUbwxaT6ORnxj6kDOdMZJHxjCP7bVeUFgKOoE=;
  b=NBvIv7+14IsltsqEzXzTLXR+d1++N76oFsk6ui175e6mSUR+rdW8QQcP
   Q2lpxT7PFjB2qLHAiJlQ3s+oPjDELDObTjTtucleEClD5wJtQK5eTwvDf
   muqNEJHBY1bPD2ZEd4mgH6YLK4rFjtIiQHh6qfUmoUfME1mWKBvoUz89f
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ySjvVM7JfuhNMr0y+nWvweZ9G3UHRrtUHMZuqfnF+dyav79C+SQowDuYVAhlgrVi8zJO6fAbcn
 sc6uHdJqgedDi2T9eNkiHp/Lj19jIMyk3sEiKlIgktWux+fdw4bOPqQuOJUEnTs2tfLJs4WKLX
 rLPTV59wDEDaj+j7wvRYRziio6Pi9YDfyENP1XbWH6/5Te6B12TwECcaYWSrsXfhth9d177UPp
 7lqSIVlxpMyK0VOerd/DjMse0eRhy1zEMUmCjkxcxwO0ZvVXARMCAyUkOKN45ol8VUHj9NUjQg
 PvA=
X-SBRS: 5.1
X-MesageID: 42802626
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:g0ErWa+NvLdmLZzMjwluk+FocL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2GmO2dxQxRLAod8OZ
 qH/8xcpyehf3N/VLXAOlAuWe/fq9rX0K/8aRkdCBI9rCWIhzWk6Ln1eiLooys2eTVJ3Lsk7C
 z5gxX0j5/TyM2T5z398yvo75pQkMb80dcrPqKxo+UcNzmEsHfLWK1PQLuH1QpFxd2HyFFvq9
 XUpgdlAsIb0QKsQkiQgT/Anzbtyywv7XiK8y7pvVLGrdbiTDw3T+pt7LgpCyfx0EYrsNFi3K
 8j5Qvw3PA2fHCw7hjV3NTGWwpnkUC5uxMZ4JYupkdSTJcEb/tppZEflXklYasoJj7w64wsDY
 BVfafhzctRGGnqC0zxjy1ExdyhWWkLBRGWQkQOkdz96UkpoFlJi2Qf38ARhXEG6dYUTIRF/f
 3NNuBSmKhJVdJ+V9MwOM4xBe+MTkDdSxPFN2yfZXzhCaE8InrI77r6+q886u2GcIEBpaFC16
 jpYRd9jyofakjuAcqB0Nlg6RbWWliwWjzr14V3+4V5kqeUfsuqDQSzDHQV1+ewqfQWBcPWH9
 ypPohNPvPlJWzyXa5UwgzFXYVII3V2arxVhv8LH3a15u7bIIzjseLWNNzJIqD2LDoiUmTjRl
 QZWjzeI9hB81CLVnf0jAO5YQKuRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbR1O25ZGOX
 dWEffCqOeWtGO29WHH4yFCIRxGFHtY573mTjdvrQ8OOEXkTKYbt7ykCCRv9UrCAiU6Y9LdEQ
 ZZqVgy07mwNYasyScrDM/iFW6GkX0JpjavQ40HkqOOoefpE6lIQKoOaehUL0HmBhZ1kQFlpC
 NocwkfXHLSETvolOGCl5wbBObWcvFmmwe1KctoqXbS3H/s5v0Hdz8+ZXqDQMSXiQEhS35/nV
 tq6ZISh7KGhHKSM2cluf85N1dNcWyTJ7pDAG2+FcJps4GuXDs1YXaBhDSchR12Xmbx7U0dil
 bsKjCudejRDkBQvW1Z1ajW4Ep5H1/tDH5YWzRfi8lQBG7GsnF83auwaq2/33C4R3ECzuseWQ
 u1Kgc6E0dL/ZSaxRSVkDGNGTEa3Z0oJPXaF6lmWarUwGmRJIqBkrwmE/dY8I1+Ds3ntvYGXI
 ukCkmoBQK9L9ls9x2ep34jNiUxlWItlunw3gb5qEe/x3wyDJPpUSJbboBeB+vZyWfqR/yFis
 okyf00uPa9KWX3ZJqtz7rNYztKNxPUpiqXQogT2ORplJN3kIE2OZ/RFQbs/jVg+j4VKc/vjk
 MQQKhh+tn6S8dSVv1XXxgcx0YjkdSEEVAivQP3CNIvZF1FtQ6vA/q5p57z7Yc1CkKPpAHMKU
 CS3i1U8fDCRTaC39chetUNCFUTTEg383J5+uyeM6XWFQWxbulGlWDKeEOVQft4SKKfH68XoQ
 s/y9aUn/WPfy69/AzLpzN0LuZv9GmgKPnCTT6kKKpt89agP06LjbbvyMmvjC3vQT/+Un8mv+
 R+BAUtR/UGrCIjgo0x2jWzTaKygntNqSog3RhX0nj32oan52/HG1phKgOxuOQOYQVu
X-IronPort-AV: E=Sophos;i="5.82,262,1613451600"; 
   d="scan'208";a="42802626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtawxO57zkenmpYelBvQOEF0wHdkHFTLYAKlWnQiNriewcr05spQpbm3K4cnSazVwXlRWK4tE6TRUZkIv44Cv7QsbjhflAxHtq18pnlGxz5N8Qcf5CdboUdvQ5S3NONu+eXqV/MJhGvEE1kYiTgSZTr+XgRuLPSBpcahmQkaICrnXWj8NBXduZdtlJgA/I5sV3sp1HxhGAUrWYqbaKMF6jy1uPsjog99oAoXCxtb48WKHIw3NWIYiOc155vYUE3RQXxwdqEsU/67Xh0VNhLEcsd6JiTJ3c1+sR7TAy9qhIBNTBgcMMVkeNiKZlBdAcPjI6ydJtO7CmaoAHNyCkKPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zTE5dBoG/zjo9xrFuZxsi1ZDaDLyRIvBc5Zey3+Mg8=;
 b=cbhisrRPq05yhqU/UpzZ8GKaebSh/K1soXnydYPyxlwd+8arOYFnJ5k1EtGbAeqpHvE7Bq3upFQOWMe3KG9rShjNP6cB4JSO5yzb7ilUo4Y8Od/5tADC+Tj2vgOazfXeQHR4HQaCRJAZ9pBHfjTAJex3wf4KIp8bQVp7ryEGLZDHhVeRONOLxxoaggO6VpuWtf9aGkpcw10HTi+EHeKHysk4efVGRyqxs2M6fdJGpAODungwjufmMRKB1olcYjx74nEefBPcsQY7e758pxrLTWpAyspVOKWUkL1KOsObcxBF0p8ASVPjE0l/9WUltB3yxBJFIZry7yUO6LUbNVFL6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zTE5dBoG/zjo9xrFuZxsi1ZDaDLyRIvBc5Zey3+Mg8=;
 b=oDr3dY9bmBDoj9SaD7r5SdGRJUbuWqIWwtwnDGUi0ynds/B9rNsMsVoTWuPRLZi94y4YUCvFIMDCtSGut1YfsbQohWZcgpVOyyjirDGsaAOQ7TY8ZUbOJ6Pq7sN57PPOC7eetiJwTSORqQnNDxiBeq32z2lNoviAnFUpZk3AYSc=
Date: Fri, 30 Apr 2021 12:57:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v2 10/12] x86/p2m: {get,set}_entry hooks and p2m-pt.c are
 HVM-only
Message-ID: <YIvijl5n3BQeGNbu@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <fdcdb91f-87ee-084a-da55-b6ef560d5508@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdcdb91f-87ee-084a-da55-b6ef560d5508@suse.com>
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 090d0dca-fdd7-42fe-f2fc-08d90bc6bcbb
X-MS-TrafficTypeDiagnostic: DM6PR03MB4841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB484136E41E495C04B72BB2B78F5E9@DM6PR03MB4841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kdIBJDD1abpwDC1FxMVW83x+YKJs5a/LnATwVQfTwDFLn9j9qCy3vaUwjPIWc+lqj7wKUrrkue2YP+RHq4zjWqb7wahFWPmGdwpxBWgC9oUlfkXdyJRoNWZPdGOlZaJGxlACH4mdtx0WlEOCb4dFfAbTOh52SjVGrcaoUcai4k53B74K65KiL57et1ByuNt820sWSm8RWjQipn6+rBfCG93DxfiZ4G8ZTe56F8tZt3EVI+5KTiVCP+4ZVXVmh1Ac5qE9xc1+pPagQT6cUV2dcxrJis2LY9nhLxO4qGkpPVhwkzDWYqmFstxCT4zdLonYviT8wMHwlJ4HeSYJD0kZvgKuBe1OlOSbwWGylxdbX2b73fLVLYUfms849UW1SxWUMmolsin8JjjCiIqT1yHCndZDUpHlbE+yO+LAGviFzzNdqemmKrPfEStPWG6RJr8btl7bXBGpjPtTZP6u6MfxY0lRiUD3icyjnMeoWD+hOszbRIY7uj4eeheKlHhPrQW0Pkx8XFki9E4/qwGTBRrVzlFUhH0AgoxA7FXr568Of3qShFKjK9Go/ICoO1xicAc8aDYxt8k+DClYPdmePC4ep8O5Eub8RziRwPlsJFX+sLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(366004)(376002)(39860400002)(396003)(26005)(478600001)(66556008)(38100700002)(85182001)(5660300002)(107886003)(66476007)(66946007)(6916009)(16526019)(9686003)(186003)(33716001)(316002)(8676002)(54906003)(6666004)(83380400001)(2906002)(956004)(86362001)(4326008)(6496006)(6486002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWQyMFBoZFVOMHJLM0JJZEZLOVJENWlPaXlIVCtZU1hQT0pSdDVVUjJoUTEw?=
 =?utf-8?B?SnkvMUczY1hVcitWMU9mRVpEczFXRjZ3ZXAxN0lKTTU4aEtYd1pXcytGY3lN?=
 =?utf-8?B?U2EyT1hRZDlDN1BpMVl1NGNtcjlBWXRVOUs5b1Vrd01SRXJEcndWL1BmK01q?=
 =?utf-8?B?VTFuUkVTbmFtOUJsUklOZGtSY3FtZkZNN2hxQkFsRWJyMCtZVXo5aW10NVQ1?=
 =?utf-8?B?bWd3ZStrNEpiUFF4alFXcE9IMU1EZFV1bTZTb01yYzFLd3QrTWFzZWVQODJP?=
 =?utf-8?B?MHhxVXRwM2lSclE5eEcyM2sxc3VZMzdXT1dSbVRrbldKYzJSMTdLdVg2T001?=
 =?utf-8?B?UjR3VTJLekp6eVQ5V0RJRSt2dndhSlVvOHBFRW9qMkdOTDl5cEcxMWpYTHZt?=
 =?utf-8?B?L3QxRCs1QlB0RmVYTVA2cDNqWlJUaE1oaHlLRHpsZmNwUnhMbi95b25iYzJS?=
 =?utf-8?B?a3NaMzBqVjNBTFd4T2V3SUxGc3pGQzFoV1dVaVF0MUlKOTdZdnY2QWFZdlhP?=
 =?utf-8?B?a2FBKzJzSmdhZEFFVzhMQkRqOHdiZjNPWC8xYVVxczlGdCt2YXVlWFI5b1F5?=
 =?utf-8?B?VCtTbFdHOXFRQkV1eElCa2RuZjE3bklrN2NiekZhQ0IxOER5ejR0ODl2QzMv?=
 =?utf-8?B?ZDFaVVJUVUQyRTgySlNyL1BVWU5rbUFzZDJ2Mi9wWEczM3N2cGV5a3RHdzRo?=
 =?utf-8?B?UCs4TFlBK3hmc2QvNUQ4d0h6ckVJQVZHN0VtTWtDV3JabHoxZWlMVmtMVGtz?=
 =?utf-8?B?TnhrSVJaNkJrYUI4Mkx2RkxKdWcvRjREWEZmdTdqY1JEc1Z2Wmk3UGRmcUVX?=
 =?utf-8?B?MUwwdHF4eFY5R1MxU3NzdVI2QUVTWndBaVRWc3doeG1TVXhVTlNpMHZxYmRT?=
 =?utf-8?B?dEJMRm9IbEgxTGh4c2IvMndJUkdDSkFpM0p6VFJROUxqRmFMUFJzaG9YbE5o?=
 =?utf-8?B?V1NZQS9xMWxPUEZ4NTFMOXpkcWJGTC94MXdJQjV3b1lZakhZZjFmM0VYRE0y?=
 =?utf-8?B?LzNkQXI3dE0zUFhDRjBuaGowam9BZGVvbHlld3V4Vml1UmVjZm5yOXc0MkRV?=
 =?utf-8?B?Si90U25zdWUvSWVxaUh6SkNVUzM2OGhtRWZiZXFNUUJTQ051UXB1cVJ1YkxU?=
 =?utf-8?B?K1AzaUxKQWc3eXpzYTRodEcrVWFFM2xrY2tsUFlLY253SitKWVovQ0F2dER6?=
 =?utf-8?B?ZWo3aUhkbDFnODJMdnZEOUdnRjhOYWk5M2VGdnBGMmhPMkFkL1pGOWtGa2U4?=
 =?utf-8?B?ZGNnVTh0K2ZpSDlQdVB2Ry9EdDQrdHNtNzkrWDMxbXVqd1pSSkRxOGtzRDhC?=
 =?utf-8?B?VDhqVDltK3IvUUhXZDVYQkRyazJpdER1eVVGcnZWcUl0WEoxdlFlSWFuOUJz?=
 =?utf-8?B?cFlHZ2NvdlpzODEwR3pibGNZQ0h6VTZidE9neU9BZUJ1bWpHZFovY2NvL0k1?=
 =?utf-8?B?ZmF2c2VjV25WMXY3Ujk4UERrNnhER1BqN1U1NE00MisrTzdsWkNxbmhBbUpk?=
 =?utf-8?B?a0NCQ2JlRXhIc3Ruek1sakRkdCtNYXV1dkREenhXdnpTdkNzRy90VWJuNmlB?=
 =?utf-8?B?cGsxTkQrcmE0QTN5eTMxdHdEeENEOGZRN0hzL1k2b3dQMFRtZGVod2Fhbkdj?=
 =?utf-8?B?RXpYRGc1aXU5ZTI4Tk94L3BaUVNBamFFTGFsRE9TTTVxZVVlZXg2MytuOFg2?=
 =?utf-8?B?NHlYRlJSdjhSTTJoNTlaRm9Xcm1VMmtYTEYxQjB5OC9yS0hNc2VWZnlPTGU4?=
 =?utf-8?Q?VYoHrauBsOTp1TxdaOzNF2tRyLRs9pgK/KktM6m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 090d0dca-fdd7-42fe-f2fc-08d90bc6bcbb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 10:57:24.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYUcU6GXeckUfAkH8dKkcZbao0wD02urCFLLiXzmRXKWxViyJyDYoqL5Ujj4jcrn1ZFzLu57DMZ0lmhB301fXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4841
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 04:13:19PM +0200, Jan Beulich wrote:
> With the hooks no longer needing setting, p2m_pt_init() degenerates to
> (about) nothing when !HVM. As a result, p2m-pt.c doesn't need building
> anymore in this case, as long as p2m_pt_init() has proper surrogates put
> in place.
> 
> Unfortunately this means some new #ifdef-ary in p2m.c, but the mid-term
> plan there is to get rid of (almost) all of it by splitting out the then
> hopefully very few remaining non-HVM pieces.
> 
> While the movement of the paging_mode_translate() check from
> p2m_remove_page() to guest_physmap_remove_page() may not be strictly
> necessary anymore (it was in an early version of this change), it looks
> more logical to live in the latter function, allowing to avoid acquiring
> the lock in the PV case. All other callers of p2m_remove_page() already
> have such a check anyway (in the altp2m case up the call stack).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

