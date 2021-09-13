Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301A408A09
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 13:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185630.334319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPk12-0000mY-Bi; Mon, 13 Sep 2021 11:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185630.334319; Mon, 13 Sep 2021 11:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPk12-0000jw-8Q; Mon, 13 Sep 2021 11:20:48 +0000
Received: by outflank-mailman (input) for mailman id 185630;
 Mon, 13 Sep 2021 11:20:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hZsy=OD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mPk10-0000jq-G9
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 11:20:46 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a7074c2-759b-44aa-8356-86c3356b1671;
 Mon, 13 Sep 2021 11:20:44 +0000 (UTC)
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
X-Inumbo-ID: 2a7074c2-759b-44aa-8356-86c3356b1671
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631532044;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VqYPEljlgoLTiGyunFHVzOz/Hs8XXd0NXcxD7WPjkEc=;
  b=Y5u9QvRGQgnUVb553iw0s04zJktXBeUD38rOJmzsDmWPUAAkryFoAqpf
   geLf1dfoY8sByHeM0yGeomR481U6ewnEF9ltU0MWju+zujvKFN7wnUzRe
   kI6dLAFRbapcpnhZPcvWSQcZu6Dj/enwql7q+URC2IylHgz/6SqLRaH3+
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2ku4Lm4i1i6PnQOBIkDlCUco2ia6Xpgza/K8AUK4TV66R+qSlRfu2YRmF6wE2klcxOEXf/1VSr
 o4FGxViDAYKUKBg6cfn5DyPcHzgOXXE3kYZZ3j3wUpO1E7W1X3Mxw0oBjvmngGreh+m/YFqQyo
 8W+pA+odna8hqYbaHCo70+/MHsc7SUCQ1DQqx+Oya6wJRCg1cnUCAys3wX6v3xumZZ5ipDL09Y
 ONHi+khlJ7XmLVJ2dXvTNRR74LIcbD3ZhC++W6l16jOMvEdGLuBtq08NvYH6FZa/dosXiV39dg
 dyr4UKL7qJ3oAND1W9svq0me
X-SBRS: 5.1
X-MesageID: 52977045
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BbRc76u9m+7NyU58R1Guae66befnVK5ZMUV32f8akzHdYApBsoF/q
 tZmKWjQPq6DZGv1L9FxYY/jp0pTv8PcztRgQVNrry41QnwS+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y52IPhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplsbaCVRZ3DIfwlOEPXzQEMmJ3I/BK0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25ofQqmGO
 5dxhTxHMhfpMzZSK34tDJ8spL2ql3vHTmF0pwfAzUYwyzeKl1EguFT3C/LPfceAX8JSnUCwr
 2PA8WPiDxpcP9uaoRKf9WmmnOjIniXTV4cbFbn+/flv6HWXz2oPF0FKfVS+qPi9zEW5Xrp3K
 lMW0jojq7Ao806mRcW7WAe3yFabujYMVtwWFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHjVGOYSvDrPHO92r0YHVLaz9ZDcMZcecby93Jkp0i0CDlctpmAqKY0vy2EC+tz
 xnf+UDSmI4vYd43O7STpA6c2mj3+8mVEWbZ9S2MATn0tVoRiJqNItXysAmFt64owJOxEwHZ1
 EXojfRy+wzn4XulryWLXOxFN7Wg/f/t3Nb00AM3QsVJG9hA/ReekWFsDNNWfxwB3iUsI2aBj
 KrvVeV5vsI70JyCN/MfXm5JI552pZUM7Py8PhwuUjarXnSXXFXalM2JTRXLt10BbWB2yf1vU
 XtlWZ/0UR729piLPBLpHrxAgNfHNwgVxH/JRICT8vhU+ePFPxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt4K9I8wPUEyb6Sl
 px/M2cBoGfCabT8AVziQlhoaa/1XIY5qnQ+PCc2Ok2v1WRlaoGqhJrzvbNuItHLLcRvkqx5S
 ecrYcKFDqgdQzjL4W1FP5L8sJZjZFKgggfXZ3ipZz02fphBQQ3V+4C7IluzpXdWVifn59Ejp
 7CA1x/ARcZRTQpVE8uLOumkyEm8vCZBlbsqDVfIONRaZG7l7JNud37qlvYyLsxVcUfDyzKW2
 hy4GxAdoeWR8YY5/MOQ3fKPrpuzEvs4FU1fRjGJ4bGzPCjc32yi3Y4fD7rYIWGDDDv5ofzwa
 /9UwvfwNOw8sGxL64csQax2ya8e5sf0o+MIxApTA3iWPU+gDaltIyfa0JAX5LFN3LJQpSC/R
 lmLpotBIbyMNc7oTAwRKQ4iYrjR3P0YgGCPv/E8IUG87y5r5ruXF05VOkDU2iBaKbJ0NqIjw
 Psg55FKu1Du1EJyP4bUlD1Q+kSNMmcEAvcuuZwtCYP2jhYmlwNZapvGBy6quJyCZr2g6KXxz
 uN4UEYau4lh+w==
IronPort-HdrOrdr: A9a23:h1sWU6rJBvFyEgXxw+4k76caV5u6L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFniJvVmGZ6VP91xM/dfPFa9Ny4kAFjiUmgPK5t3Tk4li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.85,288,1624334400"; 
   d="scan'208";a="52977045"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuoRI8TAZ/X8EBbOOydpEC3B4h7wVoeVeZOinPFkAHODstjk0Q7ttPxTd87v9nn7xEpW/+UBSTqRkbuRXfBbD8d92z5PaYMiyw2GNZ7XhLyQyHCymuvRtlirKBlCP86gWXcdFUGUXHwzwm+UrKQFcUsT/sh4Yetx0tw3fLc8zgStmnEUkRflyGE1mjZXWrtFjiRM3KJhbGCoiJsdq7ODCixQ20D4Satv0vTvwHQZ7YRdcGqJlZSmqAc2xHnJz0Zr/MBTg3pPCYFZfiqu/ZXTSuE9YkWXtXHdXyN12bVcD9apaaw2JsOdWb92xWk12K22JK3pDtkpxY52QqfAZTOJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5oyrCDiMSrMpA7iodNQnls1mmEHmZJdzQbV25sFyCgs=;
 b=QAZzIy9emoi6BfQJ6lN0TZCUsKmyIrK0gz50gvV3G9DM5gjFpdDAP58UBTgAuN19beq33Y1/ABLYN+UbNVwZmG8SaWE98enq2eWFmB3Ks+4Pp7bWXJm9HkkKZfo46ULrs93RUrGwojCc4E5kmkazhmsgsAbZidQLr2U3XN07kwuGkh8gE44upziTmejjfgrdq+1bXv17Ntd+lq5hRnM8Qu/9/aDm5SAIZg+BtsIxyY8MhTV8XUCmjAIYB2+4eSQQqtCpfDf/fZTR4cARMM4RRmnKo6HdehjN5gu9oIlJmhsDLxW/sGb8PeeA88nb4QB+n2gLXcGLYDK4fmSdiKaRcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oyrCDiMSrMpA7iodNQnls1mmEHmZJdzQbV25sFyCgs=;
 b=oNqpGRCpteDJL9uRTKxrRUR5Y9ecEGG6Ruq8VTLaVITJ7ncyI8PbX2R/12yH4h5goE2RDxn2YtprVMS4vnXEogTQTuKhlt+PdZWlGmoPr9X+UZBG1PQ8BGcVoBkHWx9zk3RsGSGbjH9tU1fRWs7uivBhYtM40eNEh9SvVhUWM3M=
Date: Mon, 13 Sep 2021 13:20:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
CC: <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, Nick
 Rosbrook <rosbrookn@gmail.com>, Ting-Wei Lan <lantw44@gmail.com>
Subject: Re: [PATCH] tools/go: honor append build flags
Message-ID: <YT8z9DUaxOyx9gcz@MacBook-Air-de-Roger.local>
References: <20210707071531.69001-1-roger.pau@citrix.com>
 <YOWvPLcQywmEIPdI@FED-nrosbr-BE.crux.rad.ainfosec.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOWvPLcQywmEIPdI@FED-nrosbr-BE.crux.rad.ainfosec.com>
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92956759-8197-4818-f33d-08d976a87c17
X-MS-TrafficTypeDiagnostic: DM6PR03MB5356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB535629C479E314D481DA821E8FD99@DM6PR03MB5356.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4rklQWGXnErEWzyLJeYuJo/7+/RznxY4H5rsAjq7GSzb4RheT7vSgOx3YiFBMI+6nzwRPfpKM7mPf6QmEHX7mqj8/Ez/ixdiZ+BaRSWAqPeNK9byoUqFnQPkJoBe18WeU2VKI9///YIJaICjqLeuq1fCu46ZHeUXiB+uRFu5eiRH2/AZJkX7xdfHPb/A7zeBAWqxCwjoU1RpQAjy8PJP5zX2Bc/6E3ufHTkBSS3GpzckxzeWSuCZk5hLaL1Sms8N37w9fcI/NJVS8reh9C+DNmsWLJUZAau079HUAnST7SlyyHkCP3xmDkQo1LDf5xHdCXxFEyK0tgwxUR1fsgQ5S5e2UOh0sQHamGRH/YawIpFEmXYmsxytXK3Wc18Ktox9X8LIhR4HAyHqvouQ94PdQISDcaHoCL2WwfYnT32HR3dvbB9xbp2pOtkqO+ADG9EKDmyPSyuLuOFQLbbEU7TEUzJeZhjbvYxv4S1oHB+OzXWnIzt2D8OtdYEFrcMhtDkVLaX4PqjtDRoy6lvgWuPCRuF5j/yI42t4SYJ86jfwIvxU+wy6dJkZviu/qg0l1M8dgQ5/jOIplE02wrTiZW718ALHib7tuzGdzO9D04ILt64r0f0cdXhquAxhIrbB7j4VCO5zad7Y1lG2rc0/zl1fwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(5660300002)(316002)(66556008)(110136005)(54906003)(66946007)(4326008)(26005)(186003)(9686003)(6666004)(6486002)(956004)(478600001)(2906002)(6496006)(83380400001)(8676002)(38100700002)(86362001)(8936002)(66476007)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzIzRmFxYW1Db09ZL3hqd0JNQlhoOWlIWEg2UXgzOWwxc0dVekVYdkFzVUhn?=
 =?utf-8?B?Wmw2RUpZaTV2YTZUdm1tSDZNb0lWYkV2MmtJNTZnRzUrVU1vT1BIdDNoaWVp?=
 =?utf-8?B?bThPMDI4Q0dheGtzaGlDd2N6Z0FzN2w5cm9WZ3JXQ3VJOE45R2tWVVlXVk5L?=
 =?utf-8?B?UUhBQ2V0SjdFcHhlQ2gzVWNMK2NvaXlja1NRL3ZuR0VPaDltU1VKdnN6TTJn?=
 =?utf-8?B?djN4V2JUejR5d1hxT2NkeWRuTDRBNXJvWjY0VERxcFdKSUtTSUhQK1NvT09C?=
 =?utf-8?B?WDJuMTdlalhWZ003T1VGVWtyazdXM3pDQm01UWhUNHJZc2h4UUhlU1dFekZ2?=
 =?utf-8?B?alo3em1sT0hGOGJwL3BzVDVyQVlFTWJoQUR2b2hFd3dURlZWN3kycytoRCtm?=
 =?utf-8?B?THJVTGY3YnpsWlNwWTVXaG8zWlhFRjJLK3I2WWo5Qm5xNmVRZjNxclVXNXJi?=
 =?utf-8?B?Q0p4NHFJb2Z6MkFEcDdCcVRXNmt4VjJpRXZqV0JYcXkwZ0ptcjNPekpKSEpZ?=
 =?utf-8?B?YkFyRUYzYm5HNnFiNkJwMzRmamdSbVNhT0ZlMWlocXRNeTdqVCswSG0rbS96?=
 =?utf-8?B?VlQ4VEFmdjA2cnhWYlgxc0tsa3BjTzRlOG0wcDkvQ2kvNFZ3eFJ5VE5zTGpY?=
 =?utf-8?B?TFNYdDl2VmZqcGxybXMwYkNSZTlLUFNFeU01M1B6dFJZaGordUZtT0JzOCtp?=
 =?utf-8?B?cHhzeHFPVlBJZU9sRXVkOUxqY2phSEtESVoyZTEweEorQ1kxcldFRkhJYzhF?=
 =?utf-8?B?amNvSnBweDBGSTVZUDRjTU56WDVrcCs1a29XdGxUZ25MTjlQMCszeExRK3Q2?=
 =?utf-8?B?WGxXRzVWeWlMMEhCMW4zZmJJcWpCaGtoMjRmWjBoaXQ5L1pYcnlYa2ZFUTU1?=
 =?utf-8?B?b1hBUUFEUVAyL0RRS1ZNNXIrUmoyWm42cG9Ia2tSeU0wNFcyQlJpRkgyVlRp?=
 =?utf-8?B?MFI5dmNyN0tUYTZNb0d0ZzdVdXZ5SWd4NjNPWnlqbi9BcjFPS0NxWjlvWVpD?=
 =?utf-8?B?REw3bzNwbXBMUUhmcjllWDJHWG5FYjh1eDJFTDVFZjV3ZlR4VHczQmt6UVNj?=
 =?utf-8?B?b2NQZXhDZ3JidEpkU1ZKeUIwOHNqS2lOdWR1OUJmaklGeU54aGtUWUlySG12?=
 =?utf-8?B?WkUxVEJiUk41Yk91RnRzYnBHdEY4OTFQMVgrY3B6N1JPSnJJdWxCbExkYk42?=
 =?utf-8?B?akFjRXNnaHk5T0dVRm1nTGY1a1RBbmVhT3lPalBvQmhtajhsdUY4Y0dVekNF?=
 =?utf-8?B?S3VyR2xCcGFQczYwMTcrM0wvMm1vL3JFTmtnQ25KVTYyZGVEYS9VTm5GNFAw?=
 =?utf-8?B?Smt6QUpUSWRFOW5UVjREWG10MmFvMjNCZXJicThlTC9zVVg5MXVnZEppNGFW?=
 =?utf-8?B?UW03c1BQUzdMU01Lcmh1MEFuK1YrZ0xncUljTGd1aGtuSGJtZVBmeDcwZG5r?=
 =?utf-8?B?OWtBdGdpV2hwVFQzaWhMdzdnZyswbUh4dVAvdVlRQU1NWXNNOE1OTGw5TXpW?=
 =?utf-8?B?alpQT3EvSkx3ZEl2emxuaXhZdkVKY1JvWHBxRUN3ZS9TQTJqSjB0V3o5NkpL?=
 =?utf-8?B?MU9FT3VGWmc0WXVQa1dTZEZzcEV0RGZrVXIrdkZoelF5QnVDYitQbjE4ZE5a?=
 =?utf-8?B?cHplRFRzUndPcFlGTGdUMFJlUXdIZGxkc0RFTjZXTTY3dEVWdmZ0ZXl5SlJ6?=
 =?utf-8?B?L21sRFAzRnhPZ0Y5V3dwM0pqVWFkNnowVHVGSjBxMkx6K1hkRlRYRWtNeTRk?=
 =?utf-8?Q?rFxF7sDTsygD4qFcuoZ+xDzJvD/I4norVn5GUiX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92956759-8197-4818-f33d-08d976a87c17
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 11:20:26.0458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7ntZ/2OOimWMs5k903EWE13qqvjsTOU6FUlS3adSk8LlPn9uADra27uVIYUYi1KhockP9CijesbMd5qdrHF8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-OriginatorOrg: citrix.com

On Wed, Jul 07, 2021 at 09:42:20AM -0400, Nick Rosbrook wrote:
> On Wed, Jul 07, 2021 at 09:15:31AM +0200, Roger Pau Monne wrote:
> > Make the go build use APPEND_{C/LD}FLAGS when necessary, just like
> > other parts of the build.
> > 
> > Reported-by: Ting-Wei Lan <lantw44@gmail.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Note sure if it's the best way to add the appended flags, I'm not
> > familiar with the go build system. In any case this fixes the build
> > when required libraries (ie: yajl) are not part of the system search
> > path and instead passed in APPEND_{C/LD}FLAGS.
> 
> This is right. The CGO_{C,LD}FLAGS environment variables basically work
> just like regular {C,LD}FLAGS.
> 
> > ---
> >  tools/golang/xenlight/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
> > index e394ef9b2b..64671f246c 100644
> > --- a/tools/golang/xenlight/Makefile
> > +++ b/tools/golang/xenlight/Makefile
> > @@ -27,7 +27,7 @@ GOXL_GEN_FILES = types.gen.go helpers.gen.go
> >  # so that it can find the actual library.
> >  .PHONY: build
> >  build: xenlight.go $(GOXL_GEN_FILES)
> > -	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog)" $(GO) build -x
> > +	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog) $(APPEND_LDFLAGS)" $(GO) build -x
> >  
> >  .PHONY: install
> >  install: build
> > -- 
> > 2.31.1
> > 
> > 
> Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Ping?

Unless someone else has opinions I think this is ready to be
committed. Can a committer please queue it up?

Thanks, Roger.

