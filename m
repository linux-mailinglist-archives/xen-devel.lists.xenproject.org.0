Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276664B6B4D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 12:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273062.468115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJwBP-0004A7-J1; Tue, 15 Feb 2022 11:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273062.468115; Tue, 15 Feb 2022 11:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJwBP-00047z-FW; Tue, 15 Feb 2022 11:39:47 +0000
Received: by outflank-mailman (input) for mailman id 273062;
 Tue, 15 Feb 2022 11:39:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vySV=S6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJwBN-00047t-2r
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 11:39:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6a4e2f2-8e53-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 12:39:43 +0100 (CET)
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
X-Inumbo-ID: f6a4e2f2-8e53-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644925183;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=b9Zb2AIRk3432QZbm3gTgbK7cxVzH1UzfbjbtiJ+KUM=;
  b=OZAFTWDxTBp3IFhV4eNjzGJqDGdsvQP/lparg0V+onTJ7WrVYlOmrRFB
   ZQcv0W8bFKd1Wg37KWU0fjK4TKOaKlk2xGe9xOkfYtEJ0MwzykTD6OxhC
   ydfOrL06ScmuziUStEtuaSmrSPPPs/8W7QYuw4ocOUK0SSr00dG90KlF7
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ApMsiIAStKa0/G+hG3CGxy750D7lPymXhNp5kM61EPn3/vchRXL7kSIMmADuhpyxv1eJYHPaj6
 +FSajBBGUBhm2P2gQjf2DCiCD7sjBddEd+xkpr/ntH9PEj9pRBPJaXAk6iGESq3nNZfH5IJouc
 ZVT/7kkFFlmn8y1jPlcCk4Y4J9KEBqnDH7KDucCLpOIWPKVPD5SSN98EjMwaBg2XjYJEFXECFa
 Zk5lhNdS8Dpcl1mya4DJprnt3PkpyTGfZNzdOnH1jCqnvRTj9HJT+G29dFzaDa9AbafHXpM+gu
 5ZrACyA8zJ0c7wFHa5skKcIe
X-SBRS: 5.1
X-MesageID: 66462108
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AMRbRKu+vSv1X9DIcMOrbDyxSOfnVF5YMUV32f8akzHdYApBsoF/q
 tZmKWjQaKmLYjSkeo1xOY2woBhQv8fUmtU1HVBvqHgyFiMb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IXhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpltrGXcER3ALDwpL4sSDBpTy15Eo1B5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J4SQ6yHP
 5pxhTxHNQ/gWzhGZk0tJZM0gtinlGXTKm1FkQfAzUYwyzeKl1EguFT3C/LrfdiNSdRQj1yvj
 GvM9GTkATkXLNWajzGC9xqEoevCnjjyXo4II4Gp7f5hgFCVxWs7BQUfUB2wpvzRomekR99aH
 GkF9SMvoLYa+VSiS5/2WBjQiGSNvgMYHcFRFeI6wAiXz+zf5APxLmIJVCJbYdoq8so/XyU31
 0ShlsnsQzdotdW9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJv5EFKO2ldTzFSvH6
 jaGtjUlh74TgMgI0I225VnCxTmro/DhTAQ4+wHWVWKN9R5iaciuYInAwUPA8f9KIYKdT1+Al
 HsJgc6T6KYJF57lvC6QROQAGpm56vDDNyfT6WODBLF4qW7roST6O9kNvncufy+FL/roZxfqT
 Wjq+l1v+aNvZkqxRJ4rb4WeK8M1mP2I+cveatjYad9HY55UfQCB/T1zaUP4410BgHTAgolkZ
 87FLJ/E4WIyTP0+kWHoH7t1PaoDm3hmrV4/U6wX2PhOPVC2QHeOAYkIP1KVBgzSxPPV+V6Fm
 zqz2ibj9vm+bAEcSnSNmWLwBQpTRZTeOXwRg5YJHtNv2iI8RAkc5wb5mNvNgbBNkaVPjfvv9
 XqgQEJew1eXrSSZdVnVOiA+Neu2BswXQZcH0csEZwjA5pTeSdz3sPd3m2UfIdHLC9CPPdYrF
 qJYKq1s89xESyjd+iR1UHUOhNcKSfhfvirXZ3DNSGFmJ/ZIHlWVkve5LlqH3HRfVUKf6Jphy
 4BMIyuGGPLvsSw5V52IAB9upnvs1UUgdBVaBhCWfIALIR+0r+CH6UXZ15cKHi3FEj2arhOy3
 AeKGxYI4+7Lpo4+6t7Sgq6Y6YyuFoND8oByQwE3NJ66anvX+HSN24hFXLradDzRTjqsqq6je
 f9U37f3N/hexARGtI91ErBKy6Mi5oSw++8Gn1o8RHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4PlseBf66SZ78aCpS0JXOxXQ2iVRIKEsaNEuw
 Ps7ud5Q4Au600J4PtGDhyFS1mKNMn1fDPl36sBEWNfm01N5xEtDbJrQDj7NzKuOM9gcYFM3J
 jK0hbbZg+gOzET1bHduR2PG2vBQhMpStUkSnkMCPVmAhvHMmuQzgE9K6T0yQwlYkkdH3uZ0N
 jQ5PkF5P/zTrTJhhcwFVGGwAQBRQhae/xWpmVcOkWTYSWiuV3DMczJhabrcohhB/jIOZCVf8
 ZGZ1H3hAGTjc8zG1ycvXVJo9q74Rttr+wyewM2qEqxpxXXhjeYJVkN2WVc1lg==
IronPort-HdrOrdr: A9a23:E+yarqxZRHUuNyQFcOWIKrPxtOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cJzp/ktHNZA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRB2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.88,370,1635220800"; 
   d="scan'208";a="66462108"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Db9oXkxLMixTr4fd4bkFUTCtMVxpHJt1MgRErMtCp3FVD8cN4e4wyr6ewSnpzadSCDvUHaUuUnJPTbtyMUAdtXDv6cbLKYowBPSFhXQVGHYRmqodFX04Am9XDtp7MaEGEDhsbE7NyhhctOKhRQmvs16zckaY9W3Uz4c39qgHMZtWbzxZi8RON7Gia8sKXEmggtdn3NQ+6Si097i0ikqoYc/1MHNl3OZyO4ByMcla3YRyBWXI5TbqzB9jcIQXgUMdyCIWxwU5UV3yV+qhYMhnTaHr1FT5lqBJGcW4d2qXtXFvDJo3VaWQrOmDJsd9EfcKUMyfPXaqVZ16nDZ57W4XLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHohejBKFp1uIYSaKF+87manGwACtmUZAC6ONm0/1J8=;
 b=GINDLA+5InJ7mmI6lCUjd0IEDMEllK3COrkQN6l4UbimSRVH+1P47PwsJ7+aZulmeLKfSkid9i+vqA0V/6pDtX9UfYk4UidqxmDLLtvF2EntqVMB9VdF1BLxfClnEMNzgsabGgcyd6sVmi1yx5Sd6Mjoe+Z7B7lAHsG9TdWXkZKti11zMLRGoM27JucbsuLYlxZDxIev+bnRAf8x6w1oEFCBTRUTfbslcWWG0J4HTbpvO08y6jkgoec213ji5cD/PFgQyCocdit1MH/4HajfuDScqGSi0DhkeoEeyiTOqTwzW8IsL16sWtbBjQMSRVykQ04tSOkGXbzpbti5H7Wq3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHohejBKFp1uIYSaKF+87manGwACtmUZAC6ONm0/1J8=;
 b=Scv9dmH/q5o9Y2tS43uOJzbBzWsDeCaToF4xoWXwet47bTDMH79jSwG157bg13LvCrXJdwslb8h4NM4qlAWqPVm+JIzIKN3BLKiBVHEWQ9WWnO3c3Zoj+9Ca2ZFISQjswXK1JjSSF2sJnqG5NnVzDnigCaJIff3e0gKofYpeBhY=
Date: Tue, 15 Feb 2022 12:39:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Message-ID: <YguQ8wfhfYFXTWSU@Air-de-Roger>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
X-ClientProxiedBy: LO2P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5ebf36e-30c2-4ae4-cb45-08d9f077d7b7
X-MS-TrafficTypeDiagnostic: CY4PR03MB3030:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB30306819710D83C8E856AAEA8F349@CY4PR03MB3030.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JM+wfecFrBvW7T5oXMlP0r13lv1aoPvelTyaNR+oYPcqA/+nGNDS1dCon57f9rAreCaGIp7DCpCpijjrf9UHYsQlkWKMAwgBohunJa8/nTkABOHfGHPhi8IpJiPYNh/jyN3/NGxcu7JPG9QC7twqzJsrIft8fmAyv2t+sdLTjNZ7QV3r6fXSPrdJb6avAKgSGyBdgXfOUyNGKsEt3fyRlqVEEasCp5U6ZG3QrdfGOBzAfrTT/hnRLlUbWZqmMQRa+TanscAAuHppLHQKvvKmKLYhk+iIyuUq66PdvsL7Vmzd6cACsO55af8Ow0za2RqnP/fgXC8JD4o3KkRJDpIYx2OIRr427QXPQ77WkSZL7uoacAvpw6SwVfj9GdvEfYIliOGe2bGJJvKlOAupY9uYs/URRq4Y7bzadzDIEUxeWDMGb55Sth9GWEbba9Zek6lOGhxeO0+4929Jbwyht1kGOwfotfIDf3CyEYtQcJplZ5KJEQ559w7JFD2UTD0Zzme3yuFPWeO9FKZyky4pAVyt/+GNl4QXeo6uni5c457QxkGW2vWIP9TKAAsQ1y3c++6V2OeevzfKGGOzfGKHGUXUNaKV2PaZFTzS3JGsgrXhMkU50AjMZABwuOZmeHPfFE+462hXaU6hgR+658v4Z6TnIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(82960400001)(86362001)(9686003)(83380400001)(33716001)(26005)(186003)(6512007)(8676002)(6486002)(316002)(2906002)(53546011)(7416002)(85182001)(54906003)(6916009)(5660300002)(8936002)(66556008)(4326008)(66476007)(38100700002)(6506007)(6666004)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykd4SVcvcUJLZmFHajZQaEFUWENCSEd3UTF3UnlFTklwaUtlYnNta2dGR0lz?=
 =?utf-8?B?QmtlNkxadDJ5UUVRR1puQzJPYXFDVWFtRmI5ZzBPMVZmbjJhOXpYTDBmTXZ3?=
 =?utf-8?B?M1hJZWZLSkpJRFFSckhqMDVhZUlzZGJGSXZ0bHVteXBVWUJpeWE1WVRkQUFt?=
 =?utf-8?B?dU1PVnJrdzlzM0d0YmNQNVRlbFkzTTRIWTlrUVVvVWpvV3JleUFQclhnVi9m?=
 =?utf-8?B?ZjNwNDFHVU9EQTNuRGRqZitKaXJFZnoxN2ZUeStSUkVxZkIrSkVBNitaK1Vy?=
 =?utf-8?B?eHZkYk55NVN0YjdkMGhYTHpXbWc2Q24vUnE2QWNmbjEva1QvNk9OTzJZaThp?=
 =?utf-8?B?M1doYWhsOU1nRG01QysyZmYwcUhUQ1oxNlF1TXFhSEhCdG5KRHhCTnVoVExZ?=
 =?utf-8?B?MWs1LzBpZjNiM0R6UnhxUW0zT0xDK3UzamVQR0tVSm9pYmFIRGtEMm9UdVZR?=
 =?utf-8?B?aVBpemw1a290Q29GUkg1UVlJUE8xQmxkZEQwejlzbE1UNkpnMThTRVAwK29M?=
 =?utf-8?B?Y3hjYzFqSlRzVE1CQ3MyaVQvbzljY0dZNU9uOFdTYk1Dcm9QYUZvOFNLTFNH?=
 =?utf-8?B?SUk4QXAxRDkvb2NxdGp2SkE0UWZUcWtxNzNwd21ackw5eDBxS0VTTGVIUExS?=
 =?utf-8?B?SFVKZ2ZCS1lUM2JKQzhOSlJRdm9HV1gwOGVKZnZFSkZUK2JuNEpuMlhsNWN2?=
 =?utf-8?B?eWZUMHRxWXRTNEJCdXRscVljQmtLNkN2YTRTTnBuTnc2dWd5QjdLN3JqZGU5?=
 =?utf-8?B?Q2pKK0ZETFZOVDFSc2VMSklRRGFjOE14WUhER1lGbXJ1T0FTb1FuV3QzU1NV?=
 =?utf-8?B?WDRLVk95RlN4ck5nL0lsN2V0QW8yTDYwbmNuV291NWhFelBHbTBqaXZ0WGhV?=
 =?utf-8?B?QUNINlprTld2T2F3aytLWk9NUnpSUkZhb2VZM2VzNmFYYU5sODVEcjhZOXY4?=
 =?utf-8?B?V0JNdjB6TlNrQmNUNlRLY0cwenlQVHhWNEdVVkdVNy9Tamt2SW83MFdRTTVC?=
 =?utf-8?B?RTRVZDhNcDRTbHdYMHkyQVk2SE9YRnJZWG90enhxdms0UjRsRnAycHdkM3hz?=
 =?utf-8?B?OTlkVk9GYjRET3crNE9vY0txTms2d0ZLVE9QMEdmMElJRU84cXo4QVBKWDEv?=
 =?utf-8?B?MmYxYkYzZ2hLK0NKS2ZDSk9GL0NSZEIwSFlpN0RPaTRra0Z0eUxoV1MwUmU1?=
 =?utf-8?B?Q3ZKN3k1QkhnR1Q2OU1pbmRmWS9FWnMvbVNUNVFpL2VINmlESXpkY3FoVHJM?=
 =?utf-8?B?S25NL2VFbk5XSzEwWHNBNHpCSU12K1lwNU1CT1lKeTAyNFVqM2wzZncwK1Rr?=
 =?utf-8?B?MGw3SW95QUt3cGdDLzFJanhKQkFOQlBEd2thQUE1d2Y1dHZ5ZFdZQXE1QWxt?=
 =?utf-8?B?NldqUkw4ajQ2OEw0VDE0YlZZRmNuWjFua052MHVwcTgza2hMeGRsTzYvaEZW?=
 =?utf-8?B?aU5GMmNtdytjY2tpRVp6MEU1Mi83ejhzYjRNcHVDdWNuREc4MDVNWjFoMkxW?=
 =?utf-8?B?dlV0cVlxRW55bFZaK3pBUzVYaWg0ZGxmMmJrbjdSRkVQdzBTOWxlb2JOVHQw?=
 =?utf-8?B?b213NlVDN1JmMGpMcE94dWg3VVEwSGlhMDlHYW13VkhjeEV6OGtUeFhxdFZR?=
 =?utf-8?B?d3Z1NVRZcFM0NXAwZTJPTXQvT0RPc0lHSGdQditkdzR4b0p5ZWplNnJzK3NR?=
 =?utf-8?B?MmhiNDQrMGZVTUlLYjNOMks5TWdWYncwYnFuUnJkbGxDZ3czcm5qZm5PQjIr?=
 =?utf-8?B?cGVlc015Y00xSUlkNm5hcEhRSmd2Y3pmNWRJdmNYb1BOWHZjNmhJZVpHdDAx?=
 =?utf-8?B?QTdENUs4TkVkMnQwNEw3UEZQRUNyMm1CQ2tvTUVFS0lmMmhTNUs1bDBrZWJn?=
 =?utf-8?B?Wmp5SWRob2Y5ajdxU0pQb0VwckY2blFHbjhzRC9SejJmS3d1b2U0Z2R4UEpS?=
 =?utf-8?B?bkVwMzVqQjNadkZHYXFWSWs4MlFUcXF0MzNlTWRRdi9FamUxWWNHNksyaUtO?=
 =?utf-8?B?ZlJFNDVyazU3THRZVVRuUWJheWIzbUxyZXNDei9YY2tlUVdRZmdhZ0pmU2E2?=
 =?utf-8?B?MzliQXNLNDJhcVMrK3lwWW8zT0tkZVFxeUdpQkhwRmR6aWRCNE9LbHlJYUFI?=
 =?utf-8?B?RDdzRHhxUWg3dXVSbDFCNGc2R3lHMm95MHIrSFlaTWdXSkJXalBYM3A1dVBn?=
 =?utf-8?Q?GrDTf2wEWw7rpd3vJad2t44=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ebf36e-30c2-4ae4-cb45-08d9f077d7b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 11:39:36.2431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uNKZrtXudglwwLcPEdWC2mu4oBg4xivAXQHTzyluXaTclyui5/g/gSqy8/UV9EtLUwKCCZ838WnMUS0v8Jz9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3030
X-OriginatorOrg: citrix.com

On Tue, Feb 15, 2022 at 11:12:23AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 15.02.22 12:48, Roger Pau Monné wrote:
> > On Tue, Feb 15, 2022 at 10:11:35AM +0200, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> Introduce a per-domain read/write lock to check whether vpci is present,
> >> so we are sure there are no accesses to the contents of the vpci struct
> >> if not. This lock can be used (and in a few cases is used right away)
> >> so that vpci removal can be performed while holding the lock in write
> >> mode. Previously such removal could race with vpci_read for example.
> >>
> >> 1. Per-domain's vpci_rwlock is used to protect pdev->vpci structure
> >> from being removed.
> >>
> >> 2. Writing the command register and ROM BAR register may trigger
> >> modify_bars to run, which in turn may access multiple pdevs while
> >> checking for the existing BAR's overlap. The overlapping check, if done
> >> under the read lock, requires vpci->lock to be acquired on both devices
> >> being compared, which may produce a deadlock. It is not possible to
> >> upgrade read lock to write lock in such a case. So, in order to prevent
> >> the deadlock, check which registers are going to be written and acquire
> >> the lock in the appropriate mode from the beginning.
> >>
> >> All other code, which doesn't lead to pdev->vpci destruction and does not
> >> access multiple pdevs at the same time, can still use a combination of the
> >> read lock and pdev->vpci->lock.
> >>
> >> 3. Optimize if ROM BAR write lock required detection by caching offset
> >> of the ROM BAR register in vpci->header->rom_reg which depends on
> >> header's type.
> >>
> >> 4. Reduce locked region in vpci_remove_device as it is now possible
> >> to set pdev->vpci to NULL early right after the write lock is acquired.
> >>
> >> 5. Reduce locked region in vpci_add_handlers as it is possible to
> >> initialize many more fields of the struct vpci before assigning it to
> >> pdev->vpci.
> >>
> >> 6. vpci_{add|remove}_register are required to be called with the write lock
> >> held, but it is not feasible to add an assert there as it requires
> >> struct domain to be passed for that. So, add a comment about this requirement
> >> to these and other functions with the equivalent constraints.
> >>
> >> 7. Drop const qualifier where the new rwlock is used and this is appropriate.
> >>
> >> 8. Do not call process_pending_softirqs with any locks held. For that unlock
> >> prior the call and re-acquire the locks after. After re-acquiring the
> >> lock there is no need to check if pdev->vpci exists:
> >>   - in apply_map because of the context it is called (no race condition
> >>     possible)
> >>   - for MSI/MSI-X debug code because it is called at the end of
> >>     pdev->vpci access and no further access to pdev->vpci is made
> >>
> >> 9. Check for !pdev->vpci in vpci_{read|write} after acquiring the lock
> >> and if so, allow reading or writing the hardware register directly. This is
> >> acceptable as we only deal with Dom0 as of now. Once DomU support is
> >> added the write will need to be ignored and read return all 0's for the
> >> guests, while Dom0 can still access the registers directly.
> >>
> >> 10. Introduce pcidevs_trylock, so there is a possibility to try locking
> >> the pcidev's lock.
> >>
> >> 11. Use pcidev's lock around for_each_pdev and pci_get_pdev_by_domain
> >> while accessing pdevs in vpci code.
> > So if you use the pcidevs_lock then it's impossible for the pdev or
> > pdev->vpci to be removed or recreated, as the pcidevs lock protects
> > any device operations (add, remove, assign, deassign).
> >
> > It's however not OK to use the pcidevs lock in vpci_{read,write}
> > as-is, as the introduced contention is IMO not acceptable.
> >
> > The only viable option I see here is to:
> >
> >   1. Make the pcidevs lock a rwlock: switch current callers to take the
> >      lock in write mode, detect and fixup any issues that could arise
> >      from the lock not being recursive anymore.
> >   2. Take the lock in read mode around vpci_{read,write} sections that
> >      rely on pdev (including the handlers).
> >
> > These items should be at least two separate patches. Let's not mix the
> > conversion of pcidevs locks with the addition of vPCI support.
> >
> > I think with that we could get away without requiring a per-domain
> > rwlock? Just doing lock ordering in modify_bars regarding
> > tmp->vpci->lock vs pdev->vpci->lock. Neither pdev or vpci can go away
> > while holding the pcidevs lock.
> >
> > Sorting the situation in modify_bars should also be done as a separate
> > patch on top of 1. and 2.
> So, to make it crystal clear: we can do with the locking as in this
> patch and instead we need to convert pcidevs lock into rwlock.
> Meaning that I need to drop this patch.
> 
> Then, 3 patches to follow:
> 1. pcidevs as rwlock
> 2. vpci_{read|write} and the rest using new pcidevs rwlock
> 3. lock ordering in modify_bars
> 
> Is it what we want?

Likely? The current approach of the per-domain rwlock still leaves us
with a window between pci_get_pdev_by_domain and taking such lock
where the device could be removed.

We also need a safe way to use pci_get_pdev_by_domain without the
devices being removed while using them, so it would seem we need the
pcidevs lock anyway, in which case it seems possible to avoid having
to introduce a per-domain rwlock.

I'm happy with any approach that solves the issues we have at hand,
but this proposal has a fundamental flaw of leaving a window after
pci_get_pdev_by_domain where the device could be removed. I'm OK to
have this fixed in a different way if there's one, but if the pcidevs
lock is used in vpci_{read,write} it needs to be converted into a
rwlock.

Thanks, Roger.

