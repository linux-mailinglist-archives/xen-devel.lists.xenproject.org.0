Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8D4A6E41
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:57:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263958.456856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCNk-0000oh-IY; Wed, 02 Feb 2022 09:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263958.456856; Wed, 02 Feb 2022 09:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCNk-0000mg-F3; Wed, 02 Feb 2022 09:56:56 +0000
Received: by outflank-mailman (input) for mailman id 263958;
 Wed, 02 Feb 2022 09:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAZh=SR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFCNi-0000ma-IP
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:56:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71c17c70-840e-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 10:56:53 +0100 (CET)
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
X-Inumbo-ID: 71c17c70-840e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643795813;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sPmT3JDIaL/uh2kaOHhkZ/VZsaKC9kh/h9aOVL7jNjM=;
  b=fMunAhdb95FOLKCdKhIbYDQfikKVpp2H7s2shcuqRBZsyLDg5CUT7pFi
   Unp168lmCrwzgBiYeLylPUIZPWaEnQpE4JdKdrbmHai4F1DrBzroFVDck
   /fYYJdLieNJEA/4+5TX0zXFsLEyu/LgQbZW/Moizeb9Le9Jw0BD21TOa1
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cK9s+8wVzQB4yNCjkQTu+DYRabqvepeJ6S85EImQ2VmHk8xTFG1L1GBpccM/Udhx712pP5xAOc
 CI9E0gEF13zNjRtaMT1tdnLvKr32INYjoiPkSOelsn+xZ5MSVmGQzTBjNepXEUuGlEuVht7KLV
 4XPiEh7Y+BjwgyaVI99Zq0rbEN+SK3yGonWWZwTyNUCcR1xadZ3tIC4ykxFuKdVLIWNO8hjX1i
 yYJpvlGmdmHviNtUELGrU8xymHcbXPzT1UYkahqzRdMafkziSGQ+U4lMRKrBJDx2tfKr9lediM
 9X7IFnra/opdLyfGNykeA51I
X-SBRS: 5.2
X-MesageID: 63710980
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ehl+c6t/mP+AozK4Y//yrjLTGufnVHZYMUV32f8akzHdYApBsoF/q
 tZmKWqHPvaMZGH1KYx2OY3ip04Ou8Dcm4NqTAY4+HxjF34R+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2YLhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplsL6AET8XEfDwl/UEUBJ9DB4vZfZn0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JsRRK6PN
 5JxhTxHQjLYfRlLZ2wsJJcXpNeN3VfCcwUFgQfAzUYwyzeKl1EguFT3C/LXcNGXQcRenm6Du
 3nLuW/+B3kyHcaDxD+y12Ojj+7Cgwv2QIsXUra/85ZCmFSOwkQDBRtQUkG0ydGjg06jX5REK
 kob+gInt610/0uuJvH3UgekuneCslgZUsBJDuwhwAiXz+zf5APxLlYDSjlNedk3rvgcTDYh1
 kKKt97xDDkpu7qQIVqN+7HRoT6sNCw9KW4ZeTRCXQYD+8Pkoow4klTIVNkLOImxg97uEDf82
 QejqiQkmq4Ths4G0aa81V3fijfqrZ/MJiY3+wHWU2SN/g5/Iom/aOSAzlzW7u1JKoqDeWWQp
 3gPm8WY7+cmAImEkWqGR+BlNKqy+/+PPTnYgFhuN5os7TKg/zikZ4843d1lDB43aIBeI2avO
 RKN/1MKjHNOAJe0RapVU9qJNet38afxDNfuc+/rP4IVQ7EkIWdr4xpSTUKX2mnslm0lnqc+J
 YqXfK6QMJoKNUh05GHoHrlAiNfH0gh7nDqOHs6jk3xLxJLDPCb9dFsTDLeZggnVBougqR6dz
 dtQPtDiJ/53ALynOXm/HWL+wDk3wZkH6XLe950/mg2reFMO9IQd5xj5mutJRmCdt/4J/tokB
 1nkMqOi9HLxhGfcNSKBYW15ZbXkUP5X9CxnZnNwZAf5hiF9Me5DCZvzkLNsJdEaGBFLl6YoH
 5Hphe3cahiwdtg302tENsSsxGCTXB+qmRiPL0KYjMsXJPZdq/jy0oa8JGPHrXBWZgLu7JdWi
 +D+imvzHMRSLyw/XJe+QK/+lDuZ4ClC8N+eqmOVeLG/jm22rtgzQ8Ew59dqS/wxxeLrnWrHj
 lvGXEtD+IEgYeYdqbH0uExNlK/we8NWFUtGBWjLq7GwMCjR5G24xoFcFu2PeFjguKncos1Ov
 M1ZkKPxNuMphlFPv9YuGrpn1/tmtdDuu6Vb3kJvG3CSNwanDbZpI3+n28hTt/ISmu8F6FXuA
 k/fqMNHPbipOd/+FAJDLgQSceneh+ofnSPf7KppLRyitjN35reOTW5bIwKI1H5GNLJwPY58m
 bUhtcca5haRkB0vNtra3ClY+37Vdi4LUrk9t4FcC4ju01J5xlZHaJ3aKyn3/JDQNIkcbhh0e
 meZ3fOQia5dy0zOd2sIOULMhecN144TvB1qzUMZIwjbkNTymfJqjgZa9i46T1oJw0wfgf5zI
 GViK2Z8Ob6Ko2VznMFGUm2hR1NBCRme9hCjwlcFjjSEHUyhV2iLJ2whI+edukse9jsELDRc+
 biZzkfjUCrrI56tjndjBxY9pqyxV8F1+y3DhNujTpaMEJQNaDb4hrOjODgToBz9DMJt3EDKq
 IGGJgqrhXEX4cLIn5AGNg==
IronPort-HdrOrdr: A9a23:wM/+/qht/gdl+YXshJbR1TzYlXBQX0J13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhPY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX212oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iHnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegy2w
 2LCNUtqFh0dL5kUUtKPpZ0fSKGMB28ffvyChPhHb3GLtBPB5ufke++3F0KjNvaDaDgiqFC36
 j8bA==
X-IronPort-AV: E=Sophos;i="5.88,336,1635220800"; 
   d="scan'208";a="63710980"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEulqdUaSaTjz1xSCp85JJYRIQByJo6BmA0nJbtOkCbq1277XGkOwoa4fRcvp116SNbt3Rcx39eeKdivlzIoSk2Y5ABgUhwPSH7t1o4Cyk0YvH/6m7Iz9JjoBQV3n1GLKxyLqxKEukdS6tqL0XXIxbC64cKjkAWuUxbXSHC6E5EJt4FvhxO7uvHHpaWORMt9uULRlcewKfWx3h64AqtFDmraVGyG73xo+BdB606PQQiLG2QO2F6q3m4tyPxcIZQ/VBNM5eMMmfp4Qi8lFkDxrflBZSgTYx21/vAkKpHN81yVcm7kmtNDiEpMjXrwy8t0X1Y/Cj8tAfFcSzNvrtPJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up3aWVFT11Jy+6A9UtW39ucH1Hrxvt0rVS1nPyaag3Q=;
 b=DfoC9CsqA7m1hschcSc/Vt9pw4OCzjSMi5Dwum4BIt73atpNJYmBtLLrI6O7oN2i3XQBFrwa9cPrZ8mGI/aywU4r9rwvc6RxRGUWRgcjNcgSPZUpbiYSkEH7ze1s62zhywse96yoweuaoXw2+Ew7x+Pbi7Ka25CndDMwmEqaD2cNDBX/VEog63ByLuXjlk3eNCio0nCYnGIIAuRJLNBw7PVSUlXb0CW5YWd3iVG+FHhjaXvvU+QlAgLb0KsO2y/sfQ0x7FNFwu6ZxNdjzJXbf6is+hXXDAEprwZh5StbjvBYNzK58xT7cQu3FIw4HOeP2CqSEs2or0UFFYImQsWXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Up3aWVFT11Jy+6A9UtW39ucH1Hrxvt0rVS1nPyaag3Q=;
 b=CDZyUZwV6cGbC0MXzCSc5S5aRHpT0g4J/cuaM3eyOu71TTC9JaCEi4Xf9VOklhZb58er2yGhZJ3FdNWaDFIB1U4j+QOLf4H7ifrUtAfh9XXm1YDOUng87ajjbgXTvFYgc8v0HHyEf/mdnO5EKkEFkdgAGxbGzu20VrWqcI/+1GE=
Date: Wed, 2 Feb 2022 10:56:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v5 07/14] vpci/header: handle p2m range sets per BAR
Message-ID: <YfpVWdITDHpz+bW6@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-8-andr2000@gmail.com> <Yd7wjP8WLWQxzLbq@Air-de-Roger>
 <9c8ea4bc-feeb-dfa0-9265-83ff724b216d@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c8ea4bc-feeb-dfa0-9265-83ff724b216d@epam.com>
X-ClientProxiedBy: MR1P264CA0097.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8609c017-47fb-4889-74e7-08d9e6325376
X-MS-TrafficTypeDiagnostic: DM5PR03MB2569:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2569998DA8AC406B24CF843A8F279@DM5PR03MB2569.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1zqU78KSgK10ACpfyelNAJHJx4IvFYrwsi/mXRFD2NhhqzkQNCtERws72JyBnF97noAyNv974lTKrjnG2YIpZ48osqefK8Qcnot4DpmatYNVJhDZ5yDB10UtU5qwSJseyGMa3kMAUkxru7Qe3g6CCZwRu2/Y16E5z9h0Q/uTgokWq/MVRDXhFm3J3VtDkuFJFzkrUuXNddRn/HyhmIe4j1ykWUsHn7+C/g5bD79uvCUYqRnv/5hFm2yrMrwCBaXxlVkX21fNQa1eymXQwxfcrIbIDNcHTP1eOZBHkrYlO8Kob0fHIAAVyQuYyoAIZl3tQoBETBPKzeJH8Xv42Ds1KnoNEl0hy9WPt/j8RC1xSQx1zyjUx51IUpbzIRpXhvrd9rDuhyhSfZBgvKNeGI7zeUEgbeIqABVNpN5nqVzdzrORvGcQk1fiMvFaGDobdziBS7NK1/f0CIHQH04AV/Zs8OziQ528lSApnfk7kCqz9ZKenYuvv1YLQbm5c5dzT2yfNvHigVVlVEuWYo679mPH/N7x3dvs3NYuvvCfmQbWL3d/wReg4gYjho+58t9RLg37N2aV5Qnrp7fFG58n/EBojOj45Lu/bCpVcrQ1M8hyBzM7K4IwueTAuRpmhbsC7/AfcnYhhOKUHYN7uxvplFeBbG4n6iStQFmJ4CcuW8x2OcvWQKM7Ck+Z1Jvl+85FJrmehlYzRTx+oDCa9R73sHlYCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(85182001)(26005)(8936002)(4326008)(316002)(8676002)(82960400001)(186003)(33716001)(53546011)(83380400001)(508600001)(6486002)(54906003)(66556008)(6916009)(9686003)(6666004)(38100700002)(66946007)(7416002)(5660300002)(6512007)(2906002)(6506007)(66476007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTd4amFWZ0N4U3B2ZVEzSlVSbHh4WXdQQ2JGTE5RcnU2SStIUzlIVzRaVnVS?=
 =?utf-8?B?RVhISUhNOS9HQjdYb2V1Y3JVUlRTcUNHK0ZXSVZOZ3VjQlVRZ1ViRnZHY21Q?=
 =?utf-8?B?MHFUNXlWOVdIVStVK2J0SVZwandoU3BIbHdQUk54c2RYWUNUKzY4RU5heWhq?=
 =?utf-8?B?NzI2K0RIWmVpUDkvMGd3Mmc0RWdVUlN2MGdNN3RrNGdwK1lXZUczOFBqekhB?=
 =?utf-8?B?bUNtTUU2enA3REJjNzd2N1h0ekxzbkQra0tLUk1ZZC96K09JdW5CL2pjOGxn?=
 =?utf-8?B?dTRCRHlSZFZnV2ltNUtIZVBRY3dndkZ2eC9ZbUZ1SzNiMzlCNFcrN3J4ZU1n?=
 =?utf-8?B?T3VxcGsrZ005TS9DWDkwUzByNUJhdmlGU05GdHlGVnplOTlOMmJqSGdRMmZN?=
 =?utf-8?B?Z1c4WldRMXVQLyt3RGdJMTNKTjAwVTR3WitMejFFSVYzdVpYdUYxWFRXcGRS?=
 =?utf-8?B?aUs2a0JQeXljNktaazQ2ZWEzd1JvUWcrT1h0Vm00ZFVxYk1vNDBHbTFsMDZz?=
 =?utf-8?B?aFRZV2xZUDhmQVQySk03d0tXQXlPd002S1F5RFpta2tCT21MUWJzdlR0aWwx?=
 =?utf-8?B?Ymt1dkt4NTcwK1FPYzZQSEhRN1ZFYkY5NGlqdVFPYlpYNStmOHI4UitjZW9O?=
 =?utf-8?B?blo0K1RkS1VCVGNRYXREVzErdVhmWEpUejJjdlJjTG90L0d5Q3ZINjZkRURh?=
 =?utf-8?B?YVFTaGVxeXhMVk1KVjVSM3hxNVN6SXI2RStmVGNPeUZxVkFCMG03SGtiQURn?=
 =?utf-8?B?U1c3ZlVxdVh6Qm5FcjlNVkFMUDlXdGJEdVBGZm4vTndsTEFuSzVrakhVRExP?=
 =?utf-8?B?QUZoSkNXRVhJRnVkdGV4dkN5Y1NBUjQxTEllS2dkRVhoSlRkQWRiSTRRVlB3?=
 =?utf-8?B?ekpZZkpVU3hSK0RXdEpTYlkvMmNMVGM2T0ErdWU0dm1BYXNLbXdUTHpYMGMv?=
 =?utf-8?B?aVF3N0FjVytmSjFoNzJJZ216T2tTNVlDbVorUTh2VWVPaFVLY2puaDJBVjJa?=
 =?utf-8?B?dVVZb1ZtQkFhK004ZW5TQ2plUVAyTmpZNWJVVmNHYURGYzFtZlpiWGFWZ0xI?=
 =?utf-8?B?dnU5L3hkR250WDFlR2FmNERzZEx6TkNkZ1JadEN6UGxHcVk2UHNQNGRhZzVK?=
 =?utf-8?B?M05CVG1MNEE3MDA3TkVKNzJtV1hBQjIyQ01jcUpaV1BGcXJ0OWtaTi9ma2p0?=
 =?utf-8?B?OXQwajgwVDA4WjkxT2ZZdU9PdzlXZE9zZGpDQ3diNUJ3Z1BFQkpaN1BBOHJ5?=
 =?utf-8?B?MXZqRkZGMVNhVHM3RS9pREthT1BXUUtZSWN2WllQa0twalA2VEkxREVRQmpY?=
 =?utf-8?B?ZXlyaUhCL2lncVN6VlZMUklNYVhnUzZFZEowenlaWkxncFJOK0cwdE9GY0hE?=
 =?utf-8?B?cUxHUE1zcTJMcWFFTWFDWnlJZ0JxcC9pQ3czdVgvRDU2UnFoQ3JDa0VQekpJ?=
 =?utf-8?B?Umc5T1A2MVNhdklxOEhNM1NYaEpSdzVMNExaWGRHeDBXdXFQSGI5akNicmFC?=
 =?utf-8?B?b3MrUUt4c2I4b0gvM0pOcVZQTjJsVVVxOG85ZDBBd2FhbVZHRmNVYnRXOFZK?=
 =?utf-8?B?QzFtTktaay8wT1Frd1VnQjF2NGJIek5aSmpGMmI0OW1IeHlCYWx5RHU5a0Vk?=
 =?utf-8?B?SUYwcytYYm12TmdWY1Z6QXNIM3ljRTFjbHBYMmVHcHl0cU91eEk3NitUZWcy?=
 =?utf-8?B?Z2Q4bFVpeDVTcWNaN1VYY3FBcnpTL3NnemdCMFJnTjRzeU96UTNhb1p3cTdn?=
 =?utf-8?B?QnpMTDZuQ3RsNHZVb2kzNngxSlB1bHl0c0dHbFZpQ3FjQ3hFbCt3MWIyd0lH?=
 =?utf-8?B?dFgrdFcyZVlKcUpCVGp1cVNqR2VMdzlrbnNiR0RaUExiUWJrLys1ckRFOFhr?=
 =?utf-8?B?SCtmQlNKZDdlUHVZV1ozMDluQWlES2NJdytiSWFRUzRBUmNlR0ZBcUNTYm44?=
 =?utf-8?B?OUdLZVl4bk9WRkZLWVNyL0ZSTDlMeU5hRE1kNmg0QzZnTEtlZWRIOUhqTytI?=
 =?utf-8?B?SktEcW5HWVphbStvdHJsM00zMlB5SWFJcnAzQmhkOFpPaStjNmRWUHNZK0U3?=
 =?utf-8?B?WUxKQ2EzNzFPZy9mOUFpWi9EVXZ3OGVRQUNFVkhuc1laejVmNDJ6cXBoQzNw?=
 =?utf-8?B?N0VYZzhteXRpeXNRbENsY2NoL2RSMXZrR2hnK3k2c3QyVEgyWDc3c0xOazVq?=
 =?utf-8?Q?K9a/AgfP0Spc6gmd3TmCPdg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8609c017-47fb-4889-74e7-08d9e6325376
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 09:56:47.4535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErlwKHjgRhHoqAVrfYKshRBco2AW1lj1Mmgz/j05Wb6ndwD5oIU2XlU4r9nsmqC1w/QLvwqheM2aIbsjtQa3xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2569
X-OriginatorOrg: citrix.com

On Wed, Feb 02, 2022 at 06:44:41AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 12.01.22 17:15, Roger Pau Monné wrote:
> > On Thu, Nov 25, 2021 at 01:02:44PM +0200, Oleksandr Andrushchenko wrote:
> >> @@ -108,11 +115,32 @@ int vpci_add_handlers(struct pci_dev *pdev)
> >>       pdev->vpci = vpci;
> >>       INIT_LIST_HEAD(&pdev->vpci->handlers);
> >>   
> >> +    header = &pdev->vpci->header;
> >> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> >> +    {
> >> +        struct vpci_bar *bar = &header->bars[i];
> >> +        char str[32];
> >> +
> >> +        snprintf(str, sizeof(str), "%pp:BAR%d", &pdev->sbdf, i);
> >> +        bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
> >> +        if ( !bar->mem )
> >> +        {
> >> +            rc = -ENOMEM;
> >> +            goto fail;
> >> +        }
> >> +    }
> > You just need the ranges for the VPCI_BAR_MEM32, VPCI_BAR_MEM64_LO and
> > VPCI_BAR_ROM BAR types (see the MAPPABLE_BAR macro). Would it be
> > possible to only allocate the rangeset for those BAR types?
> I guess so
> > Also this should be done in init_bars rather than here, as you would
> > know the BAR types.
> So, if we allocate these in init_bars so where are they destroyed then?
> I think this should be vpci_remove_device and from this POV it would
> be good to keep alloc/free code close to each other, e.g.
> vpci_add_handlers/vpci_remove_device in the same file

The alloc/free is asymmetric already, as vpci->{msix,msi} gets
allocated in init_msi{x} but freed at vpci_remove_device.

Thanks, Roger.

