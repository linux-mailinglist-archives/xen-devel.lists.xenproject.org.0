Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D254D1B03
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287041.486832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbCw-0001hQ-Dw; Tue, 08 Mar 2022 14:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287041.486832; Tue, 08 Mar 2022 14:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbCw-0001ew-AU; Tue, 08 Mar 2022 14:53:02 +0000
Received: by outflank-mailman (input) for mailman id 287041;
 Tue, 08 Mar 2022 14:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRbCu-0001R6-Ig
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:53:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71157518-9eef-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:52:59 +0100 (CET)
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
X-Inumbo-ID: 71157518-9eef-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646751179;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=I1WitbfWAxoZ0vvH/bHz2qmBA4KrfcaAqYYuhLVeTx8=;
  b=LptDJvfB9syc2kAFDUxoVSH2RxHP1GjJvIXXboMUcAshtTStEqgS/dpW
   4pvD0v/ejZt15SeXcrKDYrgRsmsgNMpGrN2oaA1vx4C4+TlUN5tPXbiiY
   dhzy8fLBmPlnBQf1Suu7LxU54g5VD9zn9Bav6t3Z403sTpn5f6+kcieZQ
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65719511
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:21ZIKq3eMh84+9IbtfbD5fhxkn2cJEfYwER7XKvMYLTBsI5bp2cBz
 zMeUGqGPPneZjH3c4p0OoS38E1TvpLVmNJjHAc5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw0YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1RhcOWERgjMZb9p/tATyhHHgZSAJ1JreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u258XTKuHP
 qL1bxJAQRrPWBxRFmsvN6gwps6rnHbOQjRh/Qf9Sa0fvDGIkV0ZPKLWGNbSd9aHQe1cm0+Ko
 WSA82mRKhMHMN2SzxKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 08T/DAnoe4t9UioZt7nVha8rTiPuRt0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nNMGGhpyy
 VWGpOLWGmFzgaKYbl6gxrjB+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hia22rEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUMnleM+lGrxl8FSVCxCtamW0bblHRcVJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPErPdzuW5lxlPi9TrwJs8w4iPIUOfCdkyfdoElTibO4hTixwCDAb4llU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI6QDFxUaGAm+h9E2Gn9owM/tr1E
 riGchYw4HL0hGHdKBXMbXZmabj1Wo14o259NispVWtEEVB5CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:aZ84GaF5b/Ts692wpLqFDJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y5o2mfvVmHp6VO91xNPdfKla9CC4kY1jiaWgOKsk8SgbwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65719511"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUjw6t4YhYbxWV5ryWB8Gh5I7W283amLES/KCz8Yrvsvfb4gkAr9+3Xkl63uJKs7xAeMTqYx4jiYc87e+Cl9uaL73qZgQaro7rRKfuHXbi+XHNRF7Ginw3vJoT/KLe6GqlZVj7qXmL1nNeiD2wx3QOUWAuWgC3JKdMSQ0xQ0V6lUKn1ZwaonPYb2NkZQMjhz2jPz0p3NKOC90c99UXQlrnXVxC8fna582siold8h9Ec4aUghj8ZKJZ0miLAr7k9cWLvPjVwJGhlsAzBkq3gha48KfXO9oJ4D9zfdTdU535qX5atCFUZvUtqWEBTR/6jMm2uSMua+LkXAJP5Tdu0b1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nG0fC5JoZBpZSdRQVousvPLt3MTbVP6sArOWO3yEn7w=;
 b=aNuXL3xZFRGKyZGBUAmEXCOyve5ZOWAxvE/JmktfHqTKg2C3fKvz9tLbsXYwJbNQs15PmFCtf1OKR5fr6RCkK9J189oSYS2bMdXiVK6parhGjsc1zxYVfnUZOp2kEMHIp8ywnOKeH/1M4dY8L5uOScBDdI8hY6ZPqiL4gX24LTo3sXxFhtIxD5mF0Oe+SohtEJ5dZ86F9Z4Ze6bwzI1n/rfkNe8u1ECaYDL6gyTHx1WyqbU56oPFtKVkTeJH03dUINPmuiZCyAVE+W8jnb9d7zRhU0hpXjQmZ7X4GpPt26SB63ceU/jPt1jTgC5d+Ie3VoB15JNzy+EzO6C0FA3vrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nG0fC5JoZBpZSdRQVousvPLt3MTbVP6sArOWO3yEn7w=;
 b=M+k/iK/5CbvUoJOuVL5GbaL6KdzQpTn//9fiPHfJvTPw55wIiSOmbd4vKCWIlS4G82t4fxDEMSpG0aR5kBrWHpHl53BG1I2ictQYqM8cew2aQ6ZzcTOweaD1+gDXGoWA8NmESENM38V62vX0H96wxGoDlireh+Wo3qXNmWjTcvU=
Date: Tue, 8 Mar 2022 15:52:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, "konrad.wilk@oracle.com"
	<konrad.wilk@oracle.com>, "doebel@amazon.de" <doebel@amazon.de>,
	"julien@xen.org" <julien@xen.org>
Subject: Re: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Message-ID: <Yidtuq8YUq+SbY7C@Air-de-Roger>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-5-roger.pau@citrix.com>
 <32b098c1-963f-2e03-84bb-c8db410c8554@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32b098c1-963f-2e03-84bb-c8db410c8554@citrix.com>
X-ClientProxiedBy: LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c58324eb-7d23-43c1-5600-08da01134f95
X-MS-TrafficTypeDiagnostic: CO6PR03MB6306:EE_
X-Microsoft-Antispam-PRVS: <CO6PR03MB6306B4793F2C02628C21AB3B8F099@CO6PR03MB6306.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xU3sAULlNjlbnVO6MNbfO2VQe2SoWptuhd8hSmj4LApZbawTFHl1Ao51lSpNwo+sOaQ+TcmNCn6yqsU23CVF0rEI06D5CmaJ9eN3Pr+mdu/LPe6yzeJbDBpIAGw9AIstpScP8Qacq1FSxyIeMVtJ5ko972enmEdc+EXgFnxeKsFpQphRRc5bZPqajcWFvDNnWLwmVz+bLIGRfrVlPo/kkw4NyL9VGbYrXun5ypA2OXZkTxFO3tFfqjVF8wwJWjTLCSlPa6JdMSIzXQ+lu6pYJPFzUkBl1omOEuQkacwMbZJ+f3e+r9hEStSFtLMuCPY7m9a1TpuogHkGQk6/RmRvY75KW59HkImVORQmt17CDf5suO/W7Is4Q6oyCyDTMSMhrAOCNTgKj0kmp37V1TbtCG+V2Q88jDyPqgPyP+g9oblFP8xGmyEemO0OEmUOA7cUqy3+vI33LU/QU3vd+Z5o7fdAIj6OhWk5TdkJAElW/LY+0ai2B1jPbm0kIYf70/su6afVUaLIerPSoZZhUNAU0oqG3yKOJ8UExdTLAHXddbWxfL9ixMKoxd3/9uHhz3WyJTvVBgyPcvBZUNozj9p5nSTMiyQeN4T+Qst2a/ofcH2Ik6MRk3/8gfh0u/dIMmnacMPbhaFfMExhkQWL0rmUZnBwBVXTYDrgNlMihiQYbhwnQKAFjBTegEymyZF59LNRo5Dj+Umf78SRnv1qWDhxLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(66946007)(6506007)(66556008)(66476007)(4326008)(6862004)(6486002)(5660300002)(6512007)(53546011)(6666004)(9686003)(86362001)(83380400001)(33716001)(316002)(186003)(26005)(8936002)(38100700002)(508600001)(85182001)(6636002)(82960400001)(2906002)(54906003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R21CalpwOStDTXdaNHUybXFqK29nV0E2b2FqUVZ1VC9jZXVTdHAreDcvOXlY?=
 =?utf-8?B?bDVZUkowdHdBQVJ0TkxONktZdEZ1c25NS3A2bHZ4bjFzV3ROWUhBR0M0R0tW?=
 =?utf-8?B?dHorMlFVS2d0eVVuWTJ3bk1QNklFS1ZKMW42Rlc3ZTkxV1d2MEVSSVc3b05Z?=
 =?utf-8?B?S2d6aEFqV3JXK0ZFSTVUeXNaYVJqSGVHTEhtdmM5VFVaeWZoWFBHMzFEVC9J?=
 =?utf-8?B?enIyR1lFaURXOEdCeDNBb0hHcVFkbFhmTW5ZcEpqWjg1dW1NY2Z5RW1ROXBS?=
 =?utf-8?B?YjBhTzBoT1V6MGk0SlNUbS9pYXpVYXlLT1MvT0t5dEpMWllKTTBjMHo4YVBr?=
 =?utf-8?B?aGhyNTQ3RlpQcmZLWVFHZUZ6dU11c0JieDhNVkhnYWpFeEhURE5TZys3ekxx?=
 =?utf-8?B?ell2VWpLNzBJM0tCV1RtNE4wQ1grMUtiTkN0cC93YldkN3pqK3h1ejVuYld5?=
 =?utf-8?B?RW5UcG0rRXp0Q3Q0WTBOWDZBaGJMbWlTWFdsOE5zYmxCYzlKcFlLUk4yTjRC?=
 =?utf-8?B?dkV3WXlobWtONUVSSXlBZENWSG5WM1ZRM2hLNU4rMnBMUlNrY1hlVkNRS2Ew?=
 =?utf-8?B?aE1hMkgzc25NK2Y1UktPSFE3MXRYc2ZrT1YzY2I0Tk1GTXpTTkZTeDVReW9F?=
 =?utf-8?B?NlBwcDZiaFVlODRJVDdBZktheEkza2dZd1NEdllmTzlKNWFUMEtpNlhyOVR4?=
 =?utf-8?B?aE8wUnYvSlkra0FQWC9GZG9VY1UxM1h3akljemRJeTE3MG15ZERNLzl5Z2c5?=
 =?utf-8?B?L3lzdFV0dDE1Ui9jZ25qMWZtTjNacVlxelZFTk1oUk11bVhJU3l5bk9Cc2lz?=
 =?utf-8?B?ak5xZHJ4U3Jra2pFWmYycUs5aHU4YXlLLzhreVhxUy9yTHhGbjVZNjAzVkNB?=
 =?utf-8?B?d3Rib2FNMUR4eTBIdDVCVDFuU1YyeC9DeEdCYmdMY2h1WEV0blFHZjQxUDc4?=
 =?utf-8?B?aTlpSFlPUG5WaVppYU9majlybXV3K2hpV1RBUUE4Vys4bm4rcndzTmEvMjZk?=
 =?utf-8?B?OTRONjV1T1h0aTFBOEc5N2wxV2NyeCtPNUI4dlVONUY5TjNKUUZ3Q1hISmQ3?=
 =?utf-8?B?bEVSejBXOGRDQUdmWG44QmVEK0xuNlBOemE4UUxaQWJ0c3RhcW1icWExSGtX?=
 =?utf-8?B?ZmFBUHp2YUEreHdMVlpTbGxybHZsMXB5SXVyRW9TSzRqOU5NbHJXVGZwa1hP?=
 =?utf-8?B?T2VsMTJrbHg1VEViUUNweXY0L0hSb2t2Q0s3dUhEQ3lDTGtkWEtvdk1GdzI5?=
 =?utf-8?B?TEhKZUVLU1pGbVhTdUpCa0x1cG9KOVpMRFczOUs2dVNXeE5FMG1hZnlNWEFP?=
 =?utf-8?B?dnFCU3h0QzNOTFZVSGl6aGhDNytweCs3YnhENFBBR1JFTFBxaTVvSTZYbmFj?=
 =?utf-8?B?QjZUSktYUWMycWhydjhHb3ozVjVlRjJqZEw2dVJlT3lPTVA5ZE10a1AzYjFY?=
 =?utf-8?B?T2ZVMnF5d2tYeXFUVlZ3OXZRTEpGK3I3QjhzVDVleTF6eHRZTWFwRWk5b1JE?=
 =?utf-8?B?eXNIeTNTR3o2eXh3MzJZb3QrM0tzN2lVem5LcFd0Tk9Ka1VQanlaYnNqNkNT?=
 =?utf-8?B?aUtrSTlKWmNpRjhMQldnYm9icVo1bU9FMjBQcFpYQlBldWhhZHZvcmNpaWR2?=
 =?utf-8?B?ZUh3cjF0WU1mejRQMzAwTktCMlA0ZUFUc3JYSVdIS1VIblJDR0dDcm5QRUxE?=
 =?utf-8?B?Vy9GTEthaitFSEE2UUM4Mi9yck5wM09HWGRSU2U5K3d2MXR6WWtmeUluMkpU?=
 =?utf-8?B?b2tPeTRnZjRqQ0o3Y2wyUVVJdDRXREl3M2l0SWtSSC9KdCswOVdTNkM5U2ZL?=
 =?utf-8?B?OUhEUGo5VVBET2hTZXRKaWwzNnA3MTMwSGpmT0hqV2hFVWh6azlLV1NGNkRQ?=
 =?utf-8?B?VVlDRTExZW04LzFrK2pHeURaUU8vRHlaS1lFV2F2OVpIWnh0dWNnemk0MkY3?=
 =?utf-8?B?b1FVNEdyRisyVkZzYXl6OTNpOTUvWXg1U1VnMmdBUTNpdDFtR2JQYjlIM2Qw?=
 =?utf-8?B?TXVPMzl1TDY2cStCOFplMnk3SVVqRzlXTHd6L3c0bVJNRDF0VjVQQzhjV2tw?=
 =?utf-8?B?eWhMOGZJWjUrL1RDaFYyM2N4emlCallzLytQQUFWcSttL1FZRmdxcjd4Zkdz?=
 =?utf-8?B?cW55WEQ3MU9SY1JoSGY3TUM5TVROb1VtRkM3Y2hCM0tHaFUrYlJVTm95THJ1?=
 =?utf-8?Q?p7APWkcDrkSbptlV3dJY1Qk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c58324eb-7d23-43c1-5600-08da01134f95
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:52:47.8945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PK2CNE7OnfQ81vwjGlrm8WiVOuvPvP+d5UlMReMAVlaOz8tZrvZe9fSbvN84+f10cBDUL+4aaHOCmg/JrVE1cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6306
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 02:38:47PM +0000, Andrew Cooper wrote:
> On 02/03/2022 14:27, Roger Pau Monne wrote:
> > diff --git a/livepatch-build b/livepatch-build
> > index 38a92be..656cdac 100755
> > --- a/livepatch-build
> > +++ b/livepatch-build
> > @@ -98,14 +98,20 @@ function build_special()
> >  
> >      # Build with special GCC flags
> >      cd "${SRCDIR}/xen" || die
> > -    sed -i 's/CFLAGS += -nostdinc/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/' Rules.mk
> > -    cp -p arch/x86/Makefile arch/x86/Makefile.bak
> > -    sed -i 's/--section-alignment=0x200000/--section-alignment=0x1000/' arch/x86/Makefile
> > -    # Restore timestamps to prevent spurious rebuilding
> > -    touch --reference=arch/x86/Makefile.bak arch/x86/Makefile
> > -    make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
> > -    sed -i 's/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/CFLAGS += -nostdinc/' Rules.mk
> > -    mv -f arch/x86/Makefile.bak arch/x86/Makefile
> > +    if grep -q 'nostdinc' Rules.mk; then
> > +         # Support for old build system, attempt to set -f{function,data}-sections and rebuild
> > +        sed -i 's/CFLAGS += -nostdinc/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/' Rules.mk
> > +        cp -p arch/x86/Makefile arch/x86/Makefile.bak
> > +        sed -i 's/--section-alignment=0x200000/--section-alignment=0x1000/' arch/x86/Makefile
> > +        # Restore timestamps to prevent spurious rebuilding
> > +        touch --reference=arch/x86/Makefile.bak arch/x86/Makefile
> > +        make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
> > +        sed -i 's/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/CFLAGS += -nostdinc/' Rules.mk
> > +        mv -f arch/x86/Makefile.bak arch/x86/Makefile
> > +    else
> > +        # -f{function,data}-sections set by CONFIG_LIVEPATCH
> > +        make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
> > +    fi
> 
> This really ought to be the other way around, by spotting the thing we
> know is good, and then falling back to the heuristics.  In light of the
> updates to the Xen side, something like:

I'm not sure I agree. I do prefer to spot the 'bad' one, and just
fallback to expecting Xen to correctly set -f{function,data}-sections
otherwise.

> if grep -q CC_SPLIT_SECTIONS Kconfig; then

Because this logic ties us to not moving CC_SPLIT_SECTIONS from being
defined in xen/Kconfig (or even changing it's name), and gain ties the
livepatch tools to internal details about the Xen build system.

Thanks, Roger.

