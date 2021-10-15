Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3172642F50A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210692.367655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbO1s-0007qB-J2; Fri, 15 Oct 2021 14:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210692.367655; Fri, 15 Oct 2021 14:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbO1s-0007nd-Fs; Fri, 15 Oct 2021 14:17:48 +0000
Received: by outflank-mailman (input) for mailman id 210692;
 Fri, 15 Oct 2021 14:17:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UM5E=PD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbO1q-0007nT-MI
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:17:46 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa0efcc6-2dc2-11ec-823d-12813bfff9fa;
 Fri, 15 Oct 2021 14:17:45 +0000 (UTC)
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
X-Inumbo-ID: aa0efcc6-2dc2-11ec-823d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634307464;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=X+CM9WWEl8W22qiK6sD30MnmK66/ALVNwYYQ+V9I66A=;
  b=ewZxzH8UcJhPaGvGmvjIv6FDGZKSt5uuc9i5bqms0fgDYerC37w5sie2
   g/VAiK+gYVRIxKqdfi9/ibh13dWdwxzT/M4nF5fLp2yxxYvoSjNG+p4Oe
   AJYOIGiy+a8t5QXyk+W2UhJ70SXrT0eZgbZD1OznoptJasWnhKZX2qQ+K
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KkAKFokib1zOJ+ZfDwH32cjGMsBT6arnbbOvLhbYZd+58vcC0r/zdnobvrkjD5rBRud3fsRncX
 kFRcTNdtX6yKnBV2JM2paVWHS6WRGNmBhNIClta+/7IzQCExeATkNCu0K8WrQfqGftPQSvX5aB
 cfRW3cPAbiMFFyy+4WVG0ig0hY+gmPLEFAp76WJrXECQaYKIU18e6Z+pLOvwyZEzcYQ4VZxmOa
 LBuQO323DwvaYyYuGeVd39VZrDqd/BSAPiLg7mVFXuJc/86QkyloAU+X1bAwhB5M/pxkBRiStx
 WBYOuZAj6w2xamLQT811+yyF
X-SBRS: 5.1
X-MesageID: 55690843
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Za4x8Kk7tYquD6ruwTADZ/vo5gweIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXW+Daf2KZmWjedpxbtzjoRwF7Z6HyddrGQZu/yFnRSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdg2tc12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OlQ6rOqT1oFBbbRn8AeCwYIFTBYZZQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpt2JEWTaqFD
 yYfQSdGdi2QORheA21JOs4Up8utpmjBKiIN/Tp5ooJoujOOnWSdyoPFKNPIfvSaSMMTmVyXz
 krE9WnkBhARNPSE1CGItHmrg4fngifTSI8UUrqi+ZZCilCJ2nYaDhFQUFKhuOS4kWa3QdcZI
 EsRkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yweGBEAUQzhZctskucQqAzsw2
 Te0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqWTJbYhEDvvXYu5w0qhGXUYZlAYjtt4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVqPADr0hu9tTMv8PdbwsAmEhRpVBN/BFgHpg
 ZQSpySJAAni57m2nyuRXP5FIrit4/uUWNE3qQ8yR8d/n9hBFnjKQGyx3N2cDBs2WirnUWWwC
 KM2he+3zMQOVJdNRfUmC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyyv1lY
 s3ALJ/8Vyhy5UFbINyeHLp1PVgDnXhW+I8ubcqjk0TPPUS2NRZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLaWX8UjyqZKdQpiBSFiXfje8pULHsbeclsOMDxwUJf5nOJ+E7GJaowIz48kC
 FnmARQGoLc+7FWaQTi3hodLM+2yA8wm9ixmZETB/z+AghAeXGpm149GH7Mfdrg77u1zi/lyS
 vgOYcKbBfpTDD/A/lwggVPV8OSOrTyn2lCDOTSLej86c8IyTgDF4Ia8LADu6DMPHmy8ss5n+
 ++s0QbSQJwiQQV+DZmJNKLzng3p5XVNyvhvW0boI8VIfBm++oZdNCGs3OQ8JNsBKEufy2LCh
 RqWGxoRucLEv5QxrIvSnamBoorwS7l+E0NWEnP197GzMSWGrGOvzZUZCLSDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi/uYIwB5lEXPHa0WQJolhenTWj9NSsqBtx6NCvVfkU
 Ey45dQHa66CP9noEQBNKVN9PPiDz/wdhhLb8e8xfBfh/CZy8beKDRdSMh2LhHAPJbd5Ktp4k
 +IoucpQ4A2jkBs6dN2Bi3kMpWiLK3UBVYQht40bX9C32lZ6lAkabMyOEDLy7bGOd85IYxsjL
 TKjjabfg6hRmxjZeH0pGHmRhedQiPziYvyRIIPu87hRpuf4uw==
IronPort-HdrOrdr: A9a23:bC7U46yXxUL3MpPuaojEKrPxveskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurAYccegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LS0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13DDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3O
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0ITEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fy1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfuspcq+SWnqLUwxg1MfheBFBh8Ib1O7qwk5y4KoOgFt7TNEJxBy/r1Zop8CnKhNAqWsqd
 60dJiBOdl1P7srhJlGdZU8qP2MexrwqCL3QRGvyGvcZdQ60lL22tXKCeYOlauXkKJh9upEpH
 2GaiIAiVIP
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="55690843"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFOY+eu1A6VNMCj7cUI3TqhJh5ZFe5VGMSkBz+Ykdtk8r1UXg8C1txXqM3R7KphvKv2GdmS3WdlnGGi/36iuTFnso1hdJOE4HYoNZfqfQ5Dzh2UW0qdbpYP3JnrEtsVqk1qy6ZfLyUNAgD/ErLaIL2D+kAcicwwT/msmG/sBQcbLBHDOIiuEIsU2AeAKTUqjtLuXZT/LVKRtRUkQFbCUaJWg23rn3K/BzvZKt+BedJG46e32MgoVzHCPzyX6+m7diHudTbjFbc1bmJqYAXWgMwre7n/BQVdkSYP/hUysQYt1P7bLvLUWDeoiQd21p/FN4WWb0B4s5txPycNYNpGi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTqxUtnqHnu6/MFHf4+rmAddRe2Lb+QYfkfKY0fUZHs=;
 b=KExcHtRrkGreyOaxQG/S3wBssDYAKwdCBGSzIYYKOg7X+muGkk3LdWxcbds3Kd+ws+NwSx2Zejo/ZdElTjwvfFCTKPAPD7mL0yoqTVxpRxTgVZaWRAnqaOc/biGADku7etm17k7+vJXbx7XW32kpfcQLjJp/2hnAFpT7scDClSdT+gCKUQ+J81srCHrfapeBuDy/0ng5o8vDEeI+2pZ1szwJsX4IwZtKxeA+I/ltA+bSMX/0twLuDD6JKqno8tvaAYpY/2ML3wqY0V/gAf+P6YALkwpykBOBYj91e4cDa0I5DwcJ5v3q/iZTs/kyinu5NU8V9rHxgVsHP8nJQ/s4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTqxUtnqHnu6/MFHf4+rmAddRe2Lb+QYfkfKY0fUZHs=;
 b=uIcg6I871FiQcsPAiCA3uUTwTszwnkwXA1TduCdm0lVB33yJ+YE4W+sRB/tK4SaYpI7eXRUJ9dOZYBnnS2rQHegBjohpcD9n/ZTeQFiRpIw9ADdDefmcWwrRdslqdqrHxJUVOT5tG2K6CEsPd+y2Td282/w0/wsNX7/QK5k8KJs=
Date: Fri, 15 Oct 2021 16:17:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, Paul Durrant
	<paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7 1/5] xen/vpci: Move ecam access functions to common
 code
Message-ID: <YWmNeWSdmcbKNdSh@MacBook-Air-de-Roger.local>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
 <bac1cc0d06dffc8f00233ea31233080bae8868aa.1634305870.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bac1cc0d06dffc8f00233ea31233080bae8868aa.1634305870.git.bertrand.marquis@arm.com>
X-ClientProxiedBy: LO2P265CA0504.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75cf156b-e79e-4b12-02b6-08d98fe6886e
X-MS-TrafficTypeDiagnostic: DM5PR03MB2972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29724CCEC4FAA1C5FC71099E8FB99@DM5PR03MB2972.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GYKuqzLc3v0Zqh42v7tXlaW6B4Hr6Rs8YnVkKq2YQPGs36mA9uuf+hiiKfSfW+gO+Qwh8SlceYYw6emj3Xv3osyl3QNija6fngLFQzEwA28PNjJsQ9OYBZacY5v0CzAoecf4A34gvlF+c16uw3KqLIZg+J84XHejT9mEgaxiwJ1D8Js5SjzUluG9tWYw2cuirNwpJeknEnref7/Fe8w19ESX/vnKQ5BCfIzNBNjHh4Y8iyxMpaqtaDTVZ+yHOM6JK9VjFWd6r+hfdQEBgZ4e2R+c0rUj9TRUnj13thegDOdvAAcX4DGglUPy6iPKbfTg7E98nvADrMWas6rIJTZIcclQvd2Mbxkd3BGJwtuu6fh31XChqv0DpvrpE0athQucsqV0Z6f8uxqwSew7XWx2rm3nUlQ4XmJeuHWuE8iPnwsHJg8fkelLBEW7Hxx0liXVfr3orBDh54Bm0zT72g8FSBpQpH55e6/z/6a3g2AnTVCStqtY4hWAgYJeXCBQDEwWlImsGKV/zdK1zPEAos3xo+WqhTXaD9m/9ndo7L4FDHKtscLErDnoEk7nV2mzEQ+VSVl3gk0GRmBKRfU9NhX1S/3LKntj+Ug0o0FEPhjzj7G2ndBMWGMZC00UnEAyshhvJVd4fdS+XBsxZj8ffpmROn3MyTHEy7CILG8m53/3ncxRllyH38F47e48Y66BZJetVDFCAXNYj+1pxzq6z2bZfwQ5wfHg4wmqGH81tb1BcXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(316002)(6916009)(2906002)(4326008)(508600001)(6486002)(38100700002)(9686003)(26005)(66946007)(6496006)(86362001)(85182001)(966005)(83380400001)(82960400001)(66556008)(54906003)(956004)(66476007)(186003)(8676002)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUFwbnZuOEwyc0p4a2w2S0JLTlJ3YTdVd2lEUWFpaklrQVl5TnZuanR6OHk5?=
 =?utf-8?B?RnhneVFTS1J6Z2lKelpZNlptV3YrUFN0Y3p2YURKNU54cno1ajdKbVFoUHJo?=
 =?utf-8?B?bG5zSVZHYW96ZmxMMWllOFdOOStmY1lpRkFoMU9VdXdGUkpRdGR6cEc0Wnp5?=
 =?utf-8?B?aXZlUktiRjI1ZW9wR2RYVjlWVjk2T1JNbG5tekhEckFJVFloeGY1cG5yQUR0?=
 =?utf-8?B?Zi9MRi96ZXdzK3hjbXBsMGlSd3NmT1ZSa0JjSnJVWWVqZkphTFNQb2U2S0xz?=
 =?utf-8?B?TFNKSkM0My9RTHB5enp4cVAwWnI1dHFRakJrd1lwVFA2ZE5yTjVuLzBtWnVT?=
 =?utf-8?B?Ulhhbi8rRndFa2FWYUp6NDVsam4zR0U4RGlaVWJXd1BhbGhpVHk1N0VwdEpl?=
 =?utf-8?B?LzJHYS92Tm5ndDJxK1FGV0M1dEZVeElLSmpIYWt3dTk0YTBtYVJrb0Q1N0l5?=
 =?utf-8?B?eHQ5QlZ4a2EvUlJ1bUNLaXhJTHo3VjZKNm5pdU0yRjBEc2wrdVJ3TE81WWF2?=
 =?utf-8?B?Skg0ZUplb3ZqTTRlQmxwSWxRTElrSjR5T0o0YVMxbUZsS0dWSlBrN0w1QVVQ?=
 =?utf-8?B?VlRHc01tSkFidUxQMDA1N2pnQW9yZlBHWVpielhZeDREN3daTGN1NjlHN0dl?=
 =?utf-8?B?ME8wTnZIYm9WNjc1QTh5clhKanpkSjhucTVrdFdUNGZNMDBSaXlxcHhzU0Vt?=
 =?utf-8?B?Z00zc1dXMDYrOVNwTjQ0MTZUT0xCLytZaVFQODZPNVFlVjdBYXN4MXJjNGJl?=
 =?utf-8?B?S3FmRW9KK0I2d2Q1YUU1VU1NcjBwVnBhdUkwc0xVc1kxUTgrWUJFeTQ2VWhZ?=
 =?utf-8?B?K2lWbEZCMTBwZUFSbWo4OEJycG51N3VFU2lsUmVndVROcmZwZTk4VnUwcGtj?=
 =?utf-8?B?MEJ3MXovVEhodHhaNkVtbXlBSWlManhKNzFIRUpaWllpRVBGbU12bWxDcXhT?=
 =?utf-8?B?MnlrQzlJazhmWGdpaGoxaFFBRW5SS2dsQXpIYmNaTUNSUTNsVzJHVkF2cG1l?=
 =?utf-8?B?aVUzMGRidlNXT1hNazZNOXcvTlRBUUNKMTdzMFBobi9WSElqYS9ERVRJR1ZO?=
 =?utf-8?B?TDM5TDVxQ2JwVFc5VTh0MlE2MkJJaDFYTE0ybVNxYTh5VHVTTW85L0FpaS94?=
 =?utf-8?B?R015dzVVSzUyVVNIbFFyREsyUHk3V0dJamZoZUEyaHgwaE1DNjNOeWdUbnI4?=
 =?utf-8?B?NVRHdWNxRlNHRkxRQXdVbWQ3WHVLZk40bUo2Mmo2aXFReWd4MDA5dzU4ZlNP?=
 =?utf-8?B?d045d3M5WjBWTDQwclFEMEZTbEN2c05zTWxnQjZuTkp0bHFCd3dWdFpOQzYz?=
 =?utf-8?B?SmhuTnVQeVJkeTR1VjlrNVRQU3NSUDlSNmVNbDR4U0oyYkt1V2hEcFFvT3Jm?=
 =?utf-8?B?dEcyOHhCUjBTbDhWSG51a0JJSzJodkVRZUZQMUF2dG1JS0htcE10WjZ1dUNn?=
 =?utf-8?B?eDhEOERZaHJTSHdvTkZlNm03dHdneld6QXZwMm83bUx1RjdMa0t2Rnl4MWl1?=
 =?utf-8?B?UFVJblJJUW5JZTNrcE5Ya2JGZmYwdEVXYnpTRFlwREQ0Ky96V1ZOZUJST2tZ?=
 =?utf-8?B?Sk5oWGsvcjlEUHRJVXp0dHlGVG5heHUrd1VxS0cybFUrZm9CczVFUDVmdE1X?=
 =?utf-8?B?dDUvaFdFcXJKSGRnS0xaMHBsNFEvTGhwWG9iUU5XZWVmUHFlZ2swd2x6L3dx?=
 =?utf-8?B?WGRGWWI5OTVWSEQvTDVUSDZyaGhIWkN4T3hYZUZnazJheUNueWpHNUZFdDlF?=
 =?utf-8?Q?I+rUbPy5kHDswHzQ5s03ssOTn4CR0BzSJ+NZU+U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cf156b-e79e-4b12-02b6-08d98fe6886e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 14:17:34.5101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tW9/O/PkrPgMAFpPKsH36X3JO2jj0H8Hf4u3NApmSjsokiGtwk/77kvTu7Kd1r7NjXDB3brmze0sqhux18pXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2972
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 02:59:18PM +0100, Bertrand Marquis wrote:
> PCI standard is using ECAM and not MCFG which is coming from ACPI[1].
> Use ECAM/ecam instead of MCFG in common code and in new functions added
> in common vpci code by this patch.
> 
> Move vpci_access_allowed from arch/x86/hvm/io.c to drivers/vpci/vpci.c.
> 
> Create vpci_ecam_{read,write} in drivers/vpci/vpci.c that
> contains the common code to perform these operations, changed
> vpci_mmcfg_{read,write} accordingly to make use of these functions.
> 
> The vpci_ecam_{read,write} functions are returning false on error and
> true on success. As the x86 code was previously always returning
> X86EMUL_OKAY the return code is ignored. A comment has been added in
> the code to show that this is intentional.

I still wonder how you plan to propagate those errors back to the
guest in a proper way, so I'm dubious whether returning a boolean is
really warranted here, as I don't think raising a CPU fault/abort or
similar on vpci errors in correct. We will see I guess, and the
current behavior for x86 is not changed anyway.

> 
> Those functions will be used in a following patch inside by arm vpci
> implementation.
> 
> Rename MMCFG_BDF to VPCI_ECAM_BDF and move it to vpci.h.
> This macro is only used by functions calling vpci_ecam helpers.
> 
> No functional change intended with this patch.
> 
> [1] https://wiki.osdev.org/PCI_Express
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Changes in v7:
> - Rename vpci_ecam_access_allowed to vpci_access_allowed
> - Rename vpci_ecam_mmio_{read/write} to vpci_ecam_{read/write}
> - Replace comment in x86/hvm/io.c with one suggested by Roger
> - Remove 32bit comments and fixes from this patch and move it to the next
> one to keep only the moving+renaming in this patch
> - Change return type of vpci_ecam_{read/write} to bool
> - rename ECAM_BDF to VPCI_ECAM_BDF and move it to vpci.h
> Changes in v6: Patch added
> ---
>  xen/arch/x86/hvm/io.c     | 46 ++++-----------------------------
>  xen/drivers/vpci/vpci.c   | 54 +++++++++++++++++++++++++++++++++++++++
>  xen/include/asm-x86/pci.h |  2 --
>  xen/include/xen/vpci.h    | 12 +++++++++
>  4 files changed, 71 insertions(+), 43 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
> index 046a8eb4ed..eb3c80743e 100644
> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -260,20 +260,6 @@ unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
>      return CF8_ADDR_LO(cf8) | (addr & 3);
>  }
>  
> -/* Do some sanity checks. */
> -static bool vpci_access_allowed(unsigned int reg, unsigned int len)
> -{
> -    /* Check access size. */
> -    if ( len != 1 && len != 2 && len != 4 && len != 8 )
> -        return false;
> -
> -    /* Check that access is size aligned. */
> -    if ( (reg & (len - 1)) )
> -        return false;
> -
> -    return true;
> -}
> -
>  /* vPCI config space IO ports handlers (0xcf8/0xcfc). */
>  static bool vpci_portio_accept(const struct hvm_io_handler *handler,
>                                 const ioreq_t *p)
> @@ -394,7 +380,7 @@ static unsigned int vpci_mmcfg_decode_addr(const struct hvm_mmcfg *mmcfg,
>                                             paddr_t addr, pci_sbdf_t *sbdf)
>  {
>      addr -= mmcfg->addr;
> -    sbdf->bdf = MMCFG_BDF(addr);
> +    sbdf->bdf = VCPI_ECAM_BDF(addr);
>      sbdf->bus += mmcfg->start_bus;
>      sbdf->seg = mmcfg->segment;
>  
> @@ -434,25 +420,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsigned long addr,
>      reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>      read_unlock(&d->arch.hvm.mmcfg_lock);
>  
> -    if ( !vpci_access_allowed(reg, len) ||
> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> -        return X86EMUL_OKAY;
> -
> -    /*
> -     * According to the PCIe 3.1A specification:
> -     *  - Configuration Reads and Writes must usually be DWORD or smaller
> -     *    in size.
> -     *  - Because Root Complex implementations are not required to support
> -     *    accesses to a RCRB that cross DW boundaries [...] software
> -     *    should take care not to cause the generation of such accesses
> -     *    when accessing a RCRB unless the Root Complex will support the
> -     *    access.
> -     *  Xen however supports 8byte accesses by splitting them into two
> -     *  4byte accesses.
> -     */
> -    *data = vpci_read(sbdf, reg, min(4u, len));
> -    if ( len == 8 )
> -        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> +    /* Failed reads are not propagated to the caller */
> +    vpci_ecam_read(sbdf, reg, len, data);
>  
>      return X86EMUL_OKAY;
>  }
> @@ -476,13 +445,8 @@ static int vpci_mmcfg_write(struct vcpu *v, unsigned long addr,
>      reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>      read_unlock(&d->arch.hvm.mmcfg_lock);
>  
> -    if ( !vpci_access_allowed(reg, len) ||
> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> -        return X86EMUL_OKAY;
> -
> -    vpci_write(sbdf, reg, min(4u, len), data);
> -    if ( len == 8 )
> -        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +    /* Failed writes are not propagated to the caller */
> +    vpci_ecam_write(sbdf, reg, len, data);
>  
>      return X86EMUL_OKAY;
>  }
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index cbd1bac7fc..ef690f15a9 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -478,6 +478,60 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>      spin_unlock(&pdev->vpci->lock);
>  }
>  
> +/* Helper function to check an access size and alignment on vpci space. */
> +bool vpci_access_allowed(unsigned int reg, unsigned int len)
> +{
> +    /* Check access size. */
> +    if ( len != 1 && len != 2 && len != 4 && len != 8 )
> +        return false;
> +
> +    /* Check that access is size aligned. */
> +    if ( (reg & (len - 1)) )
> +        return false;
> +
> +    return true;
> +}
> +
> +bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
> +                         unsigned long data)
> +{
> +    if ( !vpci_access_allowed(reg, len) ||
> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> +        return false;
> +
> +    vpci_write(sbdf, reg, min(4u, len), data);
> +    if ( len == 8 )
> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +
> +    return true;
> +}
> +
> +bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
> +                        unsigned long *data)
> +{
> +    if ( !vpci_access_allowed(reg, len) ||
> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> +        return false;
> +
> +    /*
> +     * According to the PCIe 3.1A specification:
> +     *  - Configuration Reads and Writes must usually be DWORD or smaller
> +     *    in size.
> +     *  - Because Root Complex implementations are not required to support
> +     *    accesses to a RCRB that cross DW boundaries [...] software
> +     *    should take care not to cause the generation of such accesses
> +     *    when accessing a RCRB unless the Root Complex will support the
> +     *    access.
> +     *  Xen however supports 8byte accesses by splitting them into two
> +     *  4byte accesses.
> +     */
> +    *data = vpci_read(sbdf, reg, min(4u, len));
> +    if ( len == 8 )
> +        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> +
> +    return true;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
> index edd7c3e71a..443f25347d 100644
> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -6,8 +6,6 @@
>  #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
>  #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
>  
> -#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)
> -
>  #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
>                          || id == 0x01268086 || id == 0x01028086 \
>                          || id == 0x01128086 || id == 0x01228086 \
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 9f5b5d52e1..d6cf0baf14 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -19,6 +19,8 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>  #define VPCI_PRIORITY_MIDDLE    "5"
>  #define VPCI_PRIORITY_LOW       "9"
>  
> +#define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
> +
>  #define REGISTER_VPCI_INIT(x, p)                \
>    static vpci_register_init_t *const x##_entry  \
>                 __used_section(".data.vpci." p) = x
> @@ -208,6 +210,16 @@ static inline unsigned int vmsix_entry_nr(const struct vpci_msix *msix,
>  {
>      return entry - msix->entries;
>  }
> +
> +/* ECAM mmio read/write helpers */

Nit: comment should likely be below vpci_access_allowed.

> +bool vpci_access_allowed(unsigned int reg, unsigned int len);
> +
> +bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
> +                         unsigned long data);
> +
> +bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
> +                        unsigned long *data);

Nit: the lines containing the overflow parameter are not properly
aligned.

Thanks, Roger.

