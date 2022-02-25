Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BA94C40D2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 10:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278904.476327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWT2-0004BV-VK; Fri, 25 Feb 2022 09:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278904.476327; Fri, 25 Feb 2022 09:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWT2-00049K-RI; Fri, 25 Feb 2022 09:00:48 +0000
Received: by outflank-mailman (input) for mailman id 278904;
 Fri, 25 Feb 2022 09:00:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNWT1-00049E-Jl
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 09:00:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 696d2c52-9619-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 10:00:45 +0100 (CET)
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
X-Inumbo-ID: 696d2c52-9619-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645779646;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FbsQLOGvzoXDYqbL3/2y7ff0ve1G6Yj8lSyEZyC5L7Q=;
  b=f2gvh0lkDXqFtGDUJo1fQrTrqqeYqBM62ffhKQqh+qpDfBVu9x86Na1c
   IGmQd5TQGqhNT5nMpk6CFirL/I2BH062pN8LX2nFRqAfVDecM14959gbu
   Pu5m/++HOLGTYNQtZUPETb31ceWNI6qU5ziDYkd/EcAu6sU9N4B3F1cUX
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64867165
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Wt8WUqJv4n3NzAT3FE+RJ5UlxSXFcZb7ZxGr2PjKsXjdYENShTMGn
 WNOX2qOPvaJNGajeNAiOd7n8UkCucCHytVhQQNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2NQ12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OQdp5aKEF54B/HVkvYPbSYCKmJiMrITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gls1p4RRKiDD
 yYfQThUazvFQjluBnkeDrkUjcOlj3XfYSIN/Tp5ooJoujOOnWSdyoPFM9fLe9rMWcRcmG6Zo
 H7L+yLyBRRyHMOb4SqI9DSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3I
 koY4HB29fAa+0miT927VBq9yFactwMYc8pdFas98g7l4qje7hudB2MEZiVcc9Fgv8gzLRQxz
 UOAld7tAT1psZWWRGib+7PSqim9UQAXMGsDaCksXQYDpd75r+kOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s7vJ4Z3Z/ipAH+3yumtIr3cVQMpRnYQTfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8R5r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C8RLwJtdiON7Kih6SdkifdrUmCgmbKggjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8ymkEj+jefGPCbNIVvgDLdoRrpohE9jiF+Im
 +uzyuPQk0kPOAEASnO/HXEvwaAiciFgWMGeRz1/fe+fOAt2cFzN+NeKqY7Nj7dNxvwP/s+Rp
 ynVchYBlDLX2C2WQS3XOysLQO6+Av5CQYcTYHVE0aCAgCN4P+5CLc43KvMKQFXQ3Lc7nK4sE
 qJcIJ3o7zYmYm2vxgnxpKLV9eRKXB+qmRiPL2yiZj0+dIRnXAvH5pnveQ6HycXEJnDfWRcWy
 1F46j7mfA==
IronPort-HdrOrdr: A9a23:04sO+q7R8nmTUDdkqwPXwVGBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVdUiz9bUN1KtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmHp6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcEIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64867165"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1lRB/KIZbjjc8AhITbiQQzFHxvlrbNL76iphoNbFHbrxCOQXHuus2jdTr9Dc6ms2eZzC+xmlgcDiP2bVkiJdweC3CYsI7/shoan2QyHcqJjpuwrt0ifRKoYBXVslrcn3NIvip57uvmShopu4e9vWkBMkBhXP0nOIZ9LU+SD3F4BWBaC1UPsOit4ZBeQVKCsAVSAqPVppnoD64o0LPHv4N5DM9UQ5mpQ4Fh86t3Sv5mq9NIObx6ihpX7kM7z46gkktUwjLCc1P2dZR8x8kTxKQSf3mI0yH6XXobyz8zXTbAy/oiqc4FRReD/4NSAN7rsOIqwKk8gbV85/w9ulBnanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEbboJgImCIzDFMuUIWNM1MW/+/0gagx6MuzxgoWux0=;
 b=WK5XrTxOxS3tmJ2JZmcv/uiPnQN3Q1nNeSqPNt8ASB9jS6WLvEzp5fml46AK9oJuLOuBPrFmMex3FSm33uyX3RTq+mnSvObjbKRrLX9LdfYUgXt5ocpZTrivInJS/Qn8mSrTfsCYASU28t/YM8sNzs9wtBO4orMdasnTtu+9+kVHX4LXgm9IBd+jtl9+aKv9wCrcPoQBcxEpnsbtnfnOxVG6zbFOOPtFBYODvavqFyfHXL2SvH3vVhwk5P25LrW8ECFTbYswmgn0V4IP5y2Ji8wIkc3krUlX/d6Crqu7ng3h8mmeoZeKdKXH2zrRAoQXCzPUQGpa+JrWM6+TVA33NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEbboJgImCIzDFMuUIWNM1MW/+/0gagx6MuzxgoWux0=;
 b=gxyOsjVWqU4eyOfSVg1JugcvTvN0WT3OboVptKkYF2P/taRtJS9vYh1tXzjD1dGUf0VYE90Qa45/GpqzC8H0VnWGmSXR11NxnsZuJsv2JWqkLIaOhk/4isHv6T7H5rrEz75/8+ci5/o4Wx9WIUUb3ioIz1nZIBSfXwMj2Dai7J0=
Date: Fri, 25 Feb 2022 10:00:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Oleksandr Andrushchenko <andr2000@gmail.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] pci/ats: do not allow broken devices to be assigned
 to guests
Message-ID: <Yhias2g1moF/9gzC@Air-de-Roger>
References: <20220224163701.89404-1-roger.pau@citrix.com>
 <87b47562-7689-de37-f2ee-df05ef01c923@suse.com>
 <YhiWU+7Q9/Fbsig+@Air-de-Roger>
 <37c1934c-1d73-a9cd-64ba-8e004e4ca916@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37c1934c-1d73-a9cd-64ba-8e004e4ca916@suse.com>
X-ClientProxiedBy: MR1P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f254a7bc-6291-4118-8771-08d9f83d4bee
X-MS-TrafficTypeDiagnostic: MW4PR03MB6967:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <MW4PR03MB6967BE3EAF88EC05911E2F968F3E9@MW4PR03MB6967.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fh7n2cd7kc+aS+HSMH69hPM7+q+dK/HBjCUzstYMWlCk9VbHjSahYYQWawLKFxwVxNUK4Gb7/Voan1KwwDk4WFzD5DYuFAAcZQ1DP0hmTD1pBw+UOuK34k6KMg0p7WJJPD0i7rFMkvCp6q6QzjqsiorhT1z4x6XUTDOzVxSQyQk1qSMw+V4ZCO8Na2/6+mBtQodHR9EOuEe2QIMhRqMvF7nMi4au1q5bE95E0fDXxFJimfoNHiQdmXVSytdek994kBKPIUhS8O9C/f5Q/agBLL4BJW3k7SDvcTELD8e3yPiHzpdbQp1+PqF14TR44mMzNPmMJjYERD+GPsmRx5DGJ06BbJ5ZHzjFOT+UBJjh/hxxJRmpvDk59cUxWG00BE6+/QEGyIgtAD3bYmGtgG2u1jQncOL0gnmJZ23kVOaVob+UGLUku4cDG95ZzzkqjWmpcIAz82SEQYHBNjKIHGgre3H2XORgYU8HFRQuKQ59o6b+pBTJdDQOVA6WaEQK1OHBx9z1OIKic55FI89q0mFpxRVEEVNb/8fA0PJD38V4nCxDLUd8sOTFX5/fzK/UUGtRsnYAbgfjlYywsa45m4SUrgF1ynuuJBp2DWdKcq+8xm1FXRdXOcXZV/ybZrbwK39OPhF7lEwU7usSGJK4BJP2lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(186003)(26005)(38100700002)(2906002)(6916009)(316002)(54906003)(6486002)(8936002)(85182001)(82960400001)(508600001)(9686003)(6512007)(6666004)(83380400001)(66556008)(53546011)(5660300002)(66476007)(6506007)(66946007)(33716001)(8676002)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnlmN2ZCTlFUQWVMU2ExckhsMStFcEsvbEdCekRpRG9mYXNCNTJvK1czQnFP?=
 =?utf-8?B?ODcwODFKKzFqUUxWR2kvcDh3T0ZpWE1nWnJ2K3R4WDJQZ3NoOXJYZ05YTUJj?=
 =?utf-8?B?emx4Yno2c2NmM3N6NCtCUVA1ejRhbm15QlFqcTNpdFE3K3lBSnV5TU94WU1L?=
 =?utf-8?B?dWhzOFQ3cWRKdmpzSm8vUndOT2s1R3ZtY1BoR1NDUW1qV09BUjVPVlNmNjFS?=
 =?utf-8?B?WElSVVNFQzByeFBmV0VPd0hTZ0RJTEJ5eGFLUXU1M25kT01yVkR5VGNxbldr?=
 =?utf-8?B?VFBQSWhydlRaY2xwdmZ4N1hReFdpU0hmWFgrMVo2NEp5T0FSTnZjaGp5Rk50?=
 =?utf-8?B?YmxjcEdoVG9YZ2YwVkw5WUs0dXVkbzFCZCt0dkFCdGs0cVVPdU5vSk9mMHRD?=
 =?utf-8?B?TFFNcGQvVXdlVnZUak9raWZNWVV2R3kxcnFwendzeDEyakhLZ0FsQ01HUWFk?=
 =?utf-8?B?dUNHZDBrVjZwWm1peHhjbjRYWVNFUEZtcHp2a3FjTC83NUs2cURuZ0s0Rll5?=
 =?utf-8?B?V1grNXh0clA4cERCTlRYZ3g1ZHdlNjc5aittSHo0bC83ZnpzbWdnNU5pRzl6?=
 =?utf-8?B?QzJ5c0c5cTJtOE5nM2lCSXBtNUxMNE1PK2wwOW9HK1NYdXhCVXF5Z0FOUm5Z?=
 =?utf-8?B?d2FWU09maWkycXQ5Z2d0eUJsd3pwdVhWRG5zMzI0RG1mMGpESUVaOGswZ1Zq?=
 =?utf-8?B?RXN2NkRtTlM5aHVzaVF6MDBDVS9Ra3lVRm5hYkd5L0h3Y3V2VzUwZE9jN2xX?=
 =?utf-8?B?aGVuVCthck5HRzdEUllKUWE1dFZRV09xRFBJcTQzTldiVE9wekxlRkNQY081?=
 =?utf-8?B?RkdqUEdGcTZJeENKY3ovWUZ5cjhwMXA4eE5iYW0wZjcwc2Q5bGh5SDdCYmh2?=
 =?utf-8?B?MlR0a1FIekk3V3NRV2NsZTlxZ0FJalVmRGJwelFiWFg4SEFRb2NZOEhvNXhO?=
 =?utf-8?B?VEJTa0tTMlRMckdBV3ByNXBia0NDckhoSDdKMndWR2JFQk1JRnArZHlXRDYz?=
 =?utf-8?B?LzFlZW9Td1NTMmpUZWlqc3JtUFUwMzF2WTk4Y3RlZzhrOVVOcC93WWh5Tmcy?=
 =?utf-8?B?WDJha3VlNjQvRURaVHluME0rUFhBMWlkVmlxdnBoZW16dStScXVXcDk2S3Vp?=
 =?utf-8?B?cmlaZFhvQmZ3MXk5b0pPaUhXR0RTTStWaEtrbEEzSWw5QXRwZDlwYUIzcDJD?=
 =?utf-8?B?b1hXNDlHY2hBY01rMDArSkxlZm5UeVgwSWZnN3RFSHF1M1ErZExuKys4SStV?=
 =?utf-8?B?bDJOM1RQaVFuS0tRWmFCQjl4eHBUNW1YdS9qMWUxRGNkYzJaR1E1dTJLSWlM?=
 =?utf-8?B?TVR5aWZjOE4xd3Z4SnJpQTdoMTFLcS9PSDA1UFZxeDdXQkhUWkIyc0wyTFdh?=
 =?utf-8?B?QlJBR3gwS3NobVpDcVJrbFgyMlFaSjljSDluOG15NEtCVzlkaTUvVUFROHFL?=
 =?utf-8?B?amlQVGFFVi9jVXpJeUFzL3lhNFQzb3dMMFFmTWdZcnpZRmNtRU9SNGdvU0pH?=
 =?utf-8?B?U0VGeURDM0U4aTJVMjFZVElwU0MwZElTZDc0M1cyUVplWlJ1c3loZk52RXBZ?=
 =?utf-8?B?T0pXY2QyVk1UbWR3R1ordXJCTTB2QngrVGdhNlFyczZhR0NHZE9SL0taVlBK?=
 =?utf-8?B?TGpnZm1pOTliWU0vRjFrSWpBMWRGWnN0WjhCT0xReVNhUHBQaTNoRnJCakFt?=
 =?utf-8?B?QWp5WHlOV3BuN3Z5eFQ3N29zSkhqL0lZVUJQSmcydnZJL1RUcXFJdk5SdkJv?=
 =?utf-8?B?bjFVMjhwenhQVGZyaFo1NVVrcHJDUkwwaEFQVURoWHZpK3BSVDlLZGxaOW1h?=
 =?utf-8?B?M29wd2c4OXFaNWMrZ2dsRlF1eldsMDBnM0MwVTZhQ0lrSTErbVAwNXlLeTJ0?=
 =?utf-8?B?Rm1hWlRxSkZ0VlA5ZUhhajJPQnNzR0thZDZrWXVwS3ROTUpSMi91YnBtQk9L?=
 =?utf-8?B?MThYVVBscmxaUURjZExSdjI5MmdxM0gzNkRDdVlZd1dXUzF6SzJXOWFvcmJN?=
 =?utf-8?B?OUI5YmZHcExhT3dZdENFeHltanlqazkvWWRmNCtVczBsTzBoU3NTeGtlV2RE?=
 =?utf-8?B?WUF2bll6bFhXbGQwdWtya2tEN3hCR0QrL1FvcDdCM1ovT2tsNnpHamZDNkxK?=
 =?utf-8?B?SUVYNSswT1h1aHBJT2xqWTg0YmZaUVNDOVVsbG5YdlhnbUlrV2ZvcmcvaEJE?=
 =?utf-8?Q?9OjbCptRTYKDxNlRvZ9Vpco=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f254a7bc-6291-4118-8771-08d9f83d4bee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 09:00:40.1190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FQVQHm6bHLmFotQ5j7MQqelzy5F8Aplw6CMIXKLGBWvXryS3dHADq+QUMucgHdMWB/ZAkQgavNaS26eTdOQ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6967
X-OriginatorOrg: citrix.com

On Fri, Feb 25, 2022 at 09:50:03AM +0100, Jan Beulich wrote:
> On 25.02.2022 09:41, Roger Pau Monné wrote:
> > On Thu, Feb 24, 2022 at 05:43:13PM +0100, Jan Beulich wrote:
> >> On 24.02.2022 17:37, Roger Pau Monne wrote:
> >>> Introduce a new field to mark devices as broken: having it set
> >>> prevents the device from being assigned to guests. Use the field in
> >>> order to mark ATS devices that have failed a flush as broken, thus
> >>> preventing them to be assigned to any guest.
> >>>
> >>> This allows the device IOMMU context entry to be cleaned up properly,
> >>> as calling _pci_hide_device will just change the ownership of the
> >>> device, but the IOMMU context entry of the device would be left as-is.
> >>> It would also leak a Domain ID, as removing the device from it's
> >>> previous owner will allow releasing the DID used by the device without
> >>> having cleaned up the context entry.
> >>
> >> This DID aspect is VT-d specific, isn't it? I'd be inclined to ask to
> >> make this explicit (which could be done while committing if no other
> >> need for a v3 arises).
> > 
> > Indeed. AMD doesn't use iommu_dev_iotlb_flush_timeout so the function
> > is VT-d specific.
> 
> But perhaps wrongly so. Which is why I'd prefer to ...

I thought the same, but didn't care enough to try to fix the AMD side.

> > What about using:
> > 
> > "Introduce a new field to mark devices as broken: having it set
> > prevents the device from being assigned to guests. Use the field in
> > order to mark ATS devices that have failed a flush when using VT-d as
> > broken, thus preventing them to be assigned to any guest.
> 
> ... omit VT-d here (i.e. leave this paragraph as you had it before),
> but ...

OK, it wasn't my intention to make it sound like this is not required
for AMD, just not used ATM. Was merely trying to reflect the current
logic in the text.

> > This allows the device IOMMU context entry to be cleaned up properly,
> > as calling _pci_hide_device will just change the ownership of the
> > device, but the IOMMU context entry of the device would be left as-is.
> > It would also leak a VT-d Domain ID if using one, as removing the
> > device from it's previous owner will allow releasing the IOMMU DID
> > used by the device without having cleaned up the context entry."
> 
> ... use this as replacement.

Fine.

Thanks, Roger.

