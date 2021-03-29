Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9819734D125
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 15:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103007.196604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQryK-0004j5-PC; Mon, 29 Mar 2021 13:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103007.196604; Mon, 29 Mar 2021 13:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQryK-0004ig-Lm; Mon, 29 Mar 2021 13:30:24 +0000
Received: by outflank-mailman (input) for mailman id 103007;
 Mon, 29 Mar 2021 13:30:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vM0b=I3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lQryJ-0004ia-8N
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 13:30:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78514f58-c487-4737-bc10-bbdd444ae5b4;
 Mon, 29 Mar 2021 13:30:21 +0000 (UTC)
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
X-Inumbo-ID: 78514f58-c487-4737-bc10-bbdd444ae5b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617024621;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BneQqjWA+L829Hm2sWZKRRmYubGcDsANn3Y2Su4QpEg=;
  b=KxDECH06uFyjvxF+3NEmEc8WmOsOYFbwL4DCieMBvS9laawzRZVylewJ
   ltEa5+TQJqcIS1EK6AGQilsZD5su5wsGKZtTZZVPAn0aY5kc+6Ge42Btw
   0dDzUVdqNDcjiYCQWsD2DpgrVQP9sKIX8Y5veWGswTmOdrUmZCRYxWURy
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: raY8cfnV2KhPcZrh3unUkptJZFf5LTGRLEiAxrp21oz+daX8ejF0lvYfiyAP7i/xSmSHW3ImjW
 dDLPXabpdoVGwBbIjLJzIJBtNPr4vdH1PxMKkSVg9F7AI+kE/AYLQjUzD7mz2FsWZO98sAuc78
 pMoLqNHGxGK/sPfUo15Rl39/ofEs5DDYygvxEe5gVjJC0FgX2FX9PrchNvjJ3EzGORiUJeObA5
 WdWjpsfkWWhvezS8bBwOEUmYFOEICYYhNhcrFL1V0ZhQrc9TQvnuEUnPlbE3e+SzEAJDe9V+Gf
 KR4=
X-SBRS: 5.2
X-MesageID: 41790294
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YDPsFqAnuZwNrJflHeg9tMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmBEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVsUu2QAH4ZU+/f4+DajZ6OW298OzcLyimryQmp5rnzDgSC0n4lPQ9n7L8+/Q
 H+4m7Ez4q5tfXT8G6460by6NBslMLl2p9/AqW3+7UoAxHNrirtW4h7Qb2Fu1kO0ZCSwXInis
 PFrRtlH+kb0QKpQkiPrRHg2xbt3V8VgheIoz/o4gqRneXDSD03EMZHj45CGyGpk3YIh91gzL
 lNm1uQqps/N2K/oA3G+9PKWxt2/3DEx0YKrOh7tQ06baIuLJVVrYAZ4XpPFoYBEC/Q+OkcYZ
 ZTJfCZy/BMfVyAaXfF+kFp3dy3R3w2WiyLW04Yp6WuonVrtUE863Fd6N0Un38G+p54Y55Y59
 7cOqAtsL1VVMcZYY90Ge9pe7r6NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0Zobgv
 36IRJlnF93X3irJdyF3ZVN/ByIan66Ry7RxsZX4IU8kqHgRYDsLTaIRDkV4oWdisRaJveed+
 e4OZpQDfOmB3DpA5x10wr3XIQXBmIZVOETp9YnS3ODqs/GMeTRx6/mWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9oBW5YQKuRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbRlLsqk8el
 pCMKrq+5nL4FWezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIlt8iAf3tRmF+KPAV2Qc+TMA
 M3nSU5xYuHa7irgQwyAdOuNWyXy1EJomiRcpsakqqfoeH/ep05CZ4icLdrFRrCEiF0nQoCkh
 YCVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7U7EuV6kvsEpTHsDVzuIWcqa6DxeAwZ8tx
 lUyesykbCAkTGgJS8ajP4jOFNBUmiRHYlLFR+IfolSh7DtdjxhVGviv03rtzgDPk7Rs2kCjG
 3oKiOZPcvGBVdQoVh0+Kfn+lEcTBTUQ2tALlRB9aFtH2XPvXh+ldKRbq2oym2Ldx8p2ecGKg
 zIZjMUPyJjz926zwSuhT6HDHkqr69eedD1PfAGSfX+y3mtIIqHmeU6BPdS5o9iL82rnekRU+
 6TEjXlWw/QOqcM4UiyqXkkMiUv9yVhvvPsxRH/7G+3mFQ4GuHfJVx6R7cdZ/GQhlKUMsqg4d
 Fct5YSu+D1D0DaLvih4ovTZyRYKhzSrXWtJttY4Kx8jOYXjv9LA5LfUTH0z3lJ0xU1EdfsmC
 olMdZGyYGEHrUqQtcbdC1Y9Gc4jdijLEMktQrtH+81FGtd+0PzDpes47DSr6AoDVDEjAzsOU
 OH+yk1xYaPYwKzkZobAbk3O2JYdQwV72lj5vqLc8n1BB+xf+9OuHq8PXnVSs4WdIG1XZERpA
 19+deGgqu+cDf5whnZuX9DGZ11mlzXN/+aMUarAu5H89uzJFSKjO+L2aeI/UvKYAr+TV8Zi4
 1DfVEXdeJZhFAZ/csK7hQ=
X-IronPort-AV: E=Sophos;i="5.81,287,1610427600"; 
   d="scan'208";a="41790294"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtZDf133Hsy34eHpyVqspzpo11gmm6XVqZehMy62PvivBZPvUficUurSoC2meM0Z2XrweCJ4RNt275cd6mNa+ABTN28iLQijtMW1NsPjLmIZPnMTpaKwFhgLF8uy5SceMaBuR7tHiPJdlqrnz5zEIDhM2SaL1Y+kUR7TxqsCRExPUaywI9ckHjLfU7ZdTIN4dI08frC1OWvazXM8Y4EV2vk5JKWeLcE/GmHKu1RQ4xSoF+MQc6UXRJOknoZ4GyR+SUJMH07Sngzn+9jKeM1E/wnRKqqhnuDDlUmwYAxUaGr5rFpbt5wrNPuhpYr+gdz7B95KtbwV6ePo7e8HOjYaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8wPWxshNdlqgKNpGnz2SunT3zjIl81yeO8oPT7gk0g=;
 b=Cizc3s73R6Zrg3PGN98/lYPLStW3XCVmbiZG800Aq3IM102LNBm0m3uiwIr6Jt372OEecFimCdF6E/Yh3KSJFxSPSGwMiAEdaVWUodyd3QmxQdiuQPhgDg4CXR7Rpy60htt9+eR+ES+XVrxpZpmwNPhDZgFr2eFE72H/dNrwLALNf28l+P37U77qZSEpe+n+TeWW6+y1PLFUCAKj4Lkl3peq9PKsXmvcYZ1RXJZ3v0aJOcmei5Ik8XV3WsA86Ht4w+U0KC1w5xYVxAdTV02AojiryrPFq/uq4F52rLsK8kW0ObexOGaBl6tC8by344uHoF/nYkMbCB6bPgxiA1YT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8wPWxshNdlqgKNpGnz2SunT3zjIl81yeO8oPT7gk0g=;
 b=CNdrdFsvMXb4DYRg2KbdU0CNEA+374E13wkvtYj1btteyTu6q/Pss4ek1EHUA0Rj/np1z+XtfkuVuDRs7l3sh01g3FYlOwDUwFO84WEKKQop7ou1/cxgolAluk1fNGFVeqc2zi68GAadq7VqDYrJtf0/y7T6GUxSlGwngeNRP1s=
Date: Mon, 29 Mar 2021 15:30:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	=?utf-8?B?RnLDqWTDqXJpYw==?= Pierret <frederic.pierret@qubes-os.org>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
Message-ID: <YGHWYpK/7euwCcqC@Air-de-Roger>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
 <24669.52641.499147.88002@mariner.uk.xensource.com>
 <24669.54213.173154.400771@mariner.uk.xensource.com>
 <CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
 <24669.56958.383583.53595@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24669.56958.383583.53595@mariner.uk.xensource.com>
X-ClientProxiedBy: MR1P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ab242ee-8976-4923-57d1-08d8f2b6cab2
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059FD7188D3AF079A6B5E398F7E9@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jlJMdoGFFLsbaOlR9kAVDGGy8zd5+xc6U9hehR1E0i6tG/QPobXekC6xoZrEZYmC/BUtM3piQZMNoKmbbQMb2wm9L/KxFrTBInSkGLBabpUOSRFVJtz6HVZldof9w63jQJ2XWUzc09QdjBiecMdn6c1Zqp8Q3OSsr5hg//jnygPOZRfItJVodNPcQmc+qXjjwQmCaC+iJRP/YVGQCbxFwLRt3KNJrXxby9F2I6O5Otx+vUUiEd7ysbcDifskrAGmTOgWZ05tNkbw/oX//AZjBhuziu/Ovf149MJcbhiKer0QLvza7in58EWXa0OYq3NyfOfUu0VCpiZPN1ZKx8FoQ4wZmHH3M5PELE4WLT9KXZH65jIUFqc4UScJ3yE7c5Lqn0Lo37LUWzkYMTizEIKw/Ve9xG5xIqME54q8h3uRKKrX+FL/Xk8Y5rEsZ5YEPxwyGMbZtIto7HeJcx5BwSHzD8LolYTCBsgXmJsuJkcXzAXi/2xLEjCjQD6ScN/i7aqrbayXnKNNPbr6An4vN8jVJJfkfdqWubPqr87COTLhIWvO3sJew8NweF3uHvE/DCkYHh/X7fr5ibmKbt/6LoRB106nKMC4XiUtS65DxAy1Q6Ii7scwen70dySwLqeSoy/tNgTinaWgwvd5JExsELBoz70eIILJxuwlWC1M3t3pGkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(136003)(376002)(366004)(39860400002)(346002)(316002)(26005)(6496006)(83380400001)(8936002)(956004)(33716001)(38100700001)(6916009)(86362001)(186003)(6486002)(54906003)(4326008)(9686003)(66946007)(8676002)(6666004)(85182001)(2906002)(478600001)(16526019)(5660300002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dGVjYTdTQU44eW1BQzFpRFBFWDBob3dXWEcySStPeXFmc2gyOHZITVpVVTBj?=
 =?utf-8?B?alROWTAzSEE5YVZFeUg1TEcxc3J1Wlp4U3BSQ3Y3a3F6NHBqNy9KL1dueVht?=
 =?utf-8?B?TCtEVWJKOEZRQWd0bCsrRUo2bVB3cHhqQzBzZklMOVR1Z0pLZC80QWNFZmdl?=
 =?utf-8?B?bk1YVE1JSzlOUEtlZHpwY0pFQXhqbFBVMm0rWmp5bkU0aThXQ21ySXRsajdl?=
 =?utf-8?B?UktGWFdmZXkxVGMvVTZVSzN0MmJhV2x4amo1VHVVNUNLb1BneExZOTBrSkJF?=
 =?utf-8?B?dzVLWFBPU1I2ZUUzdmxCR1BMMGJPM29ydXNtSTJNSUhsMS9PMHJzWDFmNTJY?=
 =?utf-8?B?T09paHRkKzhxYk5uSmNRK3pYZmh5REpOZ3BoMzZIVjBOZnc5ZVJCZ2FVcEZR?=
 =?utf-8?B?ZEJwblFEQTcydVdwT3J3L2xXSzhiV05aYksreElobmlEUEluZzFMUHJjdlBF?=
 =?utf-8?B?L2wwc2R5emdHNm1yMmF0bHhHNm1FTTRWZHlYZ1pMVGk3VDBwTERSTVhIVmF0?=
 =?utf-8?B?Q3EyOGp1aksvMU1CdkdqelVReGw1eVN5MTFNU1ExOVNlck0wWmlRK3ZpV3Zu?=
 =?utf-8?B?VWRna2pRMklCUXE4eXBRckNhZmhYQ0xld2V6RWVvRlo2YTIvcXhRaHh1S3dH?=
 =?utf-8?B?N3k5MTJCd3NZeFVyYmJWMHRDeVRJRUQ2c2orNU9INFdnV0J1cEJaOCtvbWs4?=
 =?utf-8?B?OEJ0MTQ0N0FLcHk1Z1ptbEszeTMxclBZRUZiWm51SzFSZGFCMzRLcmJwNlJE?=
 =?utf-8?B?bnRLUmVEbmRkaGdVNHV1cEl0Z2J5bm9oRjlGOGluSlB5K01Vc3hCWTZxbE9S?=
 =?utf-8?B?UHJ0VCtzUzk0dVJHM1lUTHhLQlVCM3p6aFhSaGJXcDhNbXB3d1kxNEFmZmhV?=
 =?utf-8?B?RUhhc0I1d0pMcTQ1Wit6MVNLSmJTQkV1QmwwNkRNMHB6b0dIeE5NcHI1aG4y?=
 =?utf-8?B?NVZTRHlNSFUxZDR0eW9FMnNWOWhySGxGMG03ZEpwbE5qTzRRMEJMQUZqamgy?=
 =?utf-8?B?czRPeGd1RkUwZitqV3prSUNUS2RGOTJHREpxOS9SeElLWVNCTkRFdjV3bk1Q?=
 =?utf-8?B?TGNXWUwwWEU4VDkvS09RVVBjTHAxWWxRa014aG1zR3IyT3VUT2VEZ0FKTHpi?=
 =?utf-8?B?dm9HVGtNZTcveXJhQmQzSHpEaFBweUVja1cxVmgycFJOcjhrTmhzZmRqNUI3?=
 =?utf-8?B?anJNRVNBNmp0Lzc5UUE0WFUrY3RpZDlYdFYxRlYveFNMOXFTc3dNbHdkQzVo?=
 =?utf-8?B?OU9QTnFNZ1lPbUZCcDdLV2lWMFI1NUN5cDN5UmhFTGkzaWVPcWNFTHgydWc3?=
 =?utf-8?B?elRkWU1MNkFweEdkbThQWEJTRDZrWDR2OC9KeVBMZlJlc2tRZVZMR2IyaHpV?=
 =?utf-8?B?QWZYVURzK2NrMnVMRDR3aEhvVTU0M1ZvT2gvaUcvS0pwS2pDNnkxanF2NG1V?=
 =?utf-8?B?SWg2bkRFeStXSmVPdGU3VGNXRUZpYWkrQnd5MTk2dkJNcEZMTnZpdGRKUGJQ?=
 =?utf-8?B?OEV5dUZPL0NsejFhalhxenk3MXBiaE9LVUF6T3R6ZkFaYUVDeE5zWm1lVmpZ?=
 =?utf-8?B?UjlSZEJ4MVdZNEFjWWFTNWxzUXpUQUNBbk04RnNvU0NLcXg4b2dtWjdDdVBO?=
 =?utf-8?B?MUdaSnhrRE90TElPdndJZUdsb0xPVVVMWGdkMEU4VEJodUpzYjRqYTBxV3lM?=
 =?utf-8?B?M1N2TmhqQVV1QW1Da2J1Q1czdThIcXg0aGhhaTlHZHM0NUtRbkloVlBadTFP?=
 =?utf-8?Q?l22ZtGVHWEUVfOCA9EGT383PFTdH1YSEXbDTAgt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab242ee-8976-4923-57d1-08d8f2b6cab2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 13:30:17.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SX5EQXzZA011iDsY9peeBgONdOGcQoTOP/GuozCD2QUvKdr1Qpo1FBS/QEjzjAFAOM5LD6XyO50fsFpRT6QUvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

On Fri, Mar 26, 2021 at 01:15:42PM +0000, Ian Jackson wrote:
> Tamas K Lengyel writes ("Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally"):
> > The problem from my perspective is that the end-users have no way to
> > determine when that boot option is needing to be set. Having an
> > installation step of "check if things explode when you reboot" is just
> > plain bad. Many times you don't even have access to a remote serial
> > console to check why Xen didn't boot. So that's not a realistic route
> > that can be taken. If Jan's patch is applied then the only thing I'll
> > be able to do is make all installations always-enable this option even
> > on systems that would have booted fine otherwise without it. It is
> > unclear if that has any downsides of its own and could very well just
> > kick the can down the road and lead to other issues.
> 
> Thanks for the clear explanation.
> 
> I think our options are:
> 
>  1. What is currently in xen.git#staging-4.15: some different set of
>     machines do not work (reliably? at all?), constituting a
>     regression on older hardware.
> 
>  2. Jan's patch, with the consequences you describe.  Constituing a
>     continued failure to properly support the newer hardware.
> 
>  3. Andy's patches which are not finished yet and are therefore high
>     risk.  Ie, delay the release.
> 
> Please let me know if you think this characterisation of the situation
> is inaccurate or misleading.
> 
> This is not a good set of options.
> 
> Of them, I still think I would choose (2).  But I would love it if
> someone were to come up with a better suggestion (perhaps a variant on
> one of the above).

As the FreeBSD Xen packager I would consider simply adding Andrew's
patches to the port under my own risk, and maybe do the same with the
vpt performance fix, but that one is riskier as an issue there could
lead to XSA-336 being re-introduced, so I need to carefully consider.
I've cherry picked patches before to fix other issues before they hit
the stable branches.

I'm still trying to go over all emails, but if 2. is the chosen route
could we describe in the release notes those issues and maybe provide
hashes for the alternative patches provided they are in unstable by
the time of the release?

That way packagers will get an option to cherry pick those fixes at
their own risk. It's not the best model, as we are just pushing a
decisions towards consumers which might not have good judgment about
the effect of those issues and the risk of the fixes, but seeing how
much controversy this has caused it's likely an option to be
considered so that we are not seen as hiding such patches from
downstreams.

Thanks, Roger.

