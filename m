Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5395A4923B3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 11:21:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258426.445018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9lbe-0004Zo-07; Tue, 18 Jan 2022 10:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258426.445018; Tue, 18 Jan 2022 10:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9lbd-0004Xr-ST; Tue, 18 Jan 2022 10:20:49 +0000
Received: by outflank-mailman (input) for mailman id 258426;
 Tue, 18 Jan 2022 10:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pp88=SC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9lbc-0004Xj-Pu
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 10:20:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c5970a9-7848-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 11:20:47 +0100 (CET)
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
X-Inumbo-ID: 4c5970a9-7848-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642501247;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=I41wQbo2yaYCJs7RYQNJYml0utR3f9jkO1nmY3//ydc=;
  b=HpqRD8D3RMU3auMU8eSLQ9yfi3r8PCnl7LmH6gOztxEOO2GZOYr9TTZ+
   AN5le6fGMzSEewtDgry42WKCZckkv0mPuOM5Z4DVlIeDwA1THRXjADjd2
   GWsBO1jgk7TFYb75uW3gfVmmw3g3YxJMEfCC+Jnh16zau/pg5D9oOiCGV
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CqRQnbFxtx1dNYUwGWL2DnTKnBjn3q5FJpjuAsgEKMoe4itmvpYMQ/odig7dN30ph7aV3rykJm
 qgN91lYe65L6OGVlq/UAoenHU0f/rhsksnOKMlW1pkMO/yOGUFe38AxDMybLb+alCEmue4eMx0
 P3aPVCJQQwCghhFR/CILAIsxrxQTPgOQ8DGUgxqf5g67J+4cp1fEPZ2Et9rOgHBoNuYHjGpm8Y
 3eWqWcDdLyOiI7HMLPCA15JeJ0n2Zs+mBQZgK3UV/tfb3fYmU/9VhYvbgRrGuhR2HHzaW6mIrI
 Qg5jK3QGhhSeJa99tJduowwE
X-SBRS: 5.2
X-MesageID: 64341516
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AWG/z6g0OsMj/omuDaaNGWCqX161gRcKZh0ujC45NGQN5FlHY01je
 htvXTqOPvuKZmGkfIolPYTk8k9TucPWytQ3TFRuqCgxQXgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcx0YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1pj6bzVD0gfZTTv74PEAtCGBF0Jq5vreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u2psSRKuHO
 aL1bxJUK0jNaThPOGsUUsoho8CtqX2lLRph/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCglee22gSAx0+TkagrL+yjUvWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaljomYZlNKeR50R6qkLiX8RySNmIfTRcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPe1
 JTjs5LPhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGsieBs4bJpfI2KBj
 KrvVeV5vsA70JyCN/4fXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjmz+7bc2lnnyPjOrPDFbIGOxtGAbfMYgEAFas/V+9H
 yB3bZXakn2ykYTWP0HqzGLkBQtbcihgW8Gn8pw/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOqHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:3PDULq9dTuvE7BwkFPVuk+FCdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICO4qTMuftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOd+EYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhVQpENRGtpdBm9Ce3em+yZNNXB77PQCZf
 2hDp0tnUvfRZ1bVLXwOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mIryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idmrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amIazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCT2B9vSyLYU5nlhBgs/DT1NU5DWytuA3Jy9fB96gIm3EyQlCAjtYgidnRpzuNKd3AL3Z
 WCDk1SrsA9ciYhV9MLOA4we7rFNoXze2O4DIuzGyWuKEhVAQOHl3bIiI9FkN1CPqZ4iqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="64341516"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyTnXEe6YELZ3JkqqflS55D5Te9JQEz4Hbc19rujHvJ5YxRAk/5LNQ5OMAqydJER+SgrrGEUIuWXdz90clKnSQV1NeSW5EsoMC+qh4Ain3ffAOQY9h4A/yHeL1FaOtKxYPB3weg5e1nAGHwRr/sCagzRkOhla5s9yucCt99nfj7K/xmkDmPH9mBMicUqpO5jsBe+ASFTtwIa0QOfGWrj9twuQJbLWveQ+btoL1TiTqRTF9WgKQT7/cs+L9W2bwrZcT7qPH6teK9UaKoPjrxoEc+eLu7TnJTEzgJpFqLXCzy1hEHsqApbbANHJBJMXDLPl4jur4VtVU9BMHKGTlEdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJdWyIisY65i69klBX2Fmu4PK658Hnb/9w6ZHg7fPok=;
 b=J7dWfR12zX1SI6pjzIF7PZCFEg1yzif5H7XwRYXFKPB/Uw4RNf/Fp1B2HOYKFgGv6exsDC7Wjd/YS2nkxnyBRYIifTGCq87F7HO3c57/eXPIuIIMOxZ/qE7zuEyWsFscss7FZ3B1Tq1We0I0nisPd6GnbQiC3EeoIn0+TEkkopVDc2rFP3XgonHVmoLrqhbHFwOljAei0FdFqPga+V/03A+LyRMeDkvOMcG8jmU+MFgxEUDcYL4qzinI4bOO4iYliYIgQXBK496eQHod8y/z3bwwTKE5oiUsnOT9t8jnaXueRpxkK+PdtJs+9TTLu3Ek1Ogke7v0Q7wIewOWi5mB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJdWyIisY65i69klBX2Fmu4PK658Hnb/9w6ZHg7fPok=;
 b=lK2ADEVjD3OljJYw3D632WkEaQzT//10aLjHiHq8sMDpUpaHl9KLm/2b0tXrSOAQM3lW1Ksnor7ZnM+msb8uQ9lPTBmEy1cXje/+WTAF1YpQDLv/gGpa7YhYZE8IkqiG/u6jUNYKMvRxAb5mzn0CBu16R6wjTPcc9DPiXhkuuxo=
Date: Tue, 18 Jan 2022 11:20:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/5] x86/mwait-idle: update ICX C6 data
Message-ID: <YeaUdIHubGgtVpV2@Air-de-Roger>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
 <fbe74c84-c9f9-dc00-a614-151634747f33@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbe74c84-c9f9-dc00-a614-151634747f33@suse.com>
X-ClientProxiedBy: MR2P264CA0103.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f927c0e2-63d9-484d-9bb6-08d9da6c2e6c
X-MS-TrafficTypeDiagnostic: CH0PR03MB6065:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB606510418D084D90DB1161648F589@CH0PR03MB6065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JMPrlh/BzWG/44bYWAv6gVh71vCT6D3InHTB2kIGMEZ20zailhND2enucI3V4d+3Daj5WXIL8WEen4IGRbZru1GMedFjdsXpsaG9zo7Ogg2b/dkahLRvw4cwhIm0lm+CiJ96yjop/xDSw0pAyazapBb/5uYyMbsD6LEbfrGQH7f0Ww3SNl17W7oyNMzSbQeQDOdLZr4YyL5dGxzQTxXXcCeTrJfBautNHpMKWdLVVmyPH7z7sl3ATxJHoSKtNGMCrTqBmzluMRP8JLH2TGAyAapTF1arZodNSZfXFE+v/yNkLWrkm4Oogv7J+uynegQ4j8/VkCF7XEA2IL7GLVwvyiuH4MbUwL5jMWSnuj01lvr++q2bNZ5SeNU4GW28FJEBkoFgN69jK9VCqIa9Bu4JHF681jb5gpwCmN6LZEMaeTRR4Nk9g01DP1b00ujpXyRxr0LGJoLVpERwgp8ey+Lw269dyQaTdZYLgIdCx9ns6EDEBH51QE2w42hCxmgC2QuBkapV/AA7jLRpc/JwtjjEmfsQGfdqDBfOQrnEfZ8iAhbKGxOohfRx2Whrr6dSldG+G/1WLOZESJ/N3tuPyUwRAmgN2YocPHEs9X6ktjOlJ5cSirk5GtjXWItNS6T4f2HWIYfF/D3EVGhxX1BjnT6wWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6512007)(9686003)(6486002)(316002)(54906003)(508600001)(38100700002)(33716001)(4326008)(2906002)(26005)(66946007)(86362001)(8936002)(66476007)(66556008)(6916009)(6506007)(5660300002)(186003)(85182001)(6666004)(82960400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm5ZT1AxYTNFRVZEV0FoaEI5aG00VnVaQTFhUjk2SnRNdU9nV3lsWlhmYTEz?=
 =?utf-8?B?T0lMaEQyZFJieStHQ0YzWjdIYVplZlBNVkZUdFFURzNoUFFYRVBQMlh2eHpI?=
 =?utf-8?B?VHZEUUtBOHZjS2tGZG56OVB0ck9PVlB1bHdWWE1UL21BVzBmZisxRzZKRFp2?=
 =?utf-8?B?ZW1UTjJtcGgxSkdxZlFmc3JIbEF1bk5xMDV4dXJnZTgyalpqdklMSW0wODVz?=
 =?utf-8?B?YmI2cVRneElEVXBCL3FzUUdVTGhMSU85SGxqOUpzTDdwZ1lId2pxbEV5NDN1?=
 =?utf-8?B?Tm5KSWNrMXppWS92TEo5clZKV0MvT0xTM09oemk0YkxvN1VJbjdGWU96OEVZ?=
 =?utf-8?B?cEtKbXZSZ3hveG91MExERzdhdkJaOUN1VVdFUStXd1FucHdOTXUzcnZPekl1?=
 =?utf-8?B?am9PUS9US1dDc2plT3cwRndleVlHb2FXNDUyeGdjRis2R0d6dDk1OEkzeURM?=
 =?utf-8?B?QUxNa25TeGErc1FFcmlSRGcrQ005aGl0V2tvbkRQenZVM0xZU09tNDlEZTc4?=
 =?utf-8?B?VmVjd2tNcjIzelZ1MXI5ZDdYdXJqY00zL0liTXU0bENtR2s0Q1NqWDI2OG52?=
 =?utf-8?B?RDIvNllMa2FHMlJMQ0gxTGRkZGhGQmZtb3VsMEZOR29hSE5jREZlTGFSUWlV?=
 =?utf-8?B?NWlZZWptOS9IM2Fsb1VSaVRiR1R6bytOSFVNdm95amFFbElHSzBaa25NbHJC?=
 =?utf-8?B?MklGU3d2N2NFZFpFY1l5cFJrUXlKakhnd0lxQUVjclJFS2J4VEpkYmNwQ1VG?=
 =?utf-8?B?OXJZYmwzQ1VISVh5KzA5blVPMnBvMlpRQW1ERCtMbzRhTGZmdUl3QmxPckhQ?=
 =?utf-8?B?dDRDdGtuNkhwMXh2Sk1ZWVpPV1F5Q0xSSjh0YkdNUjFzb0JYNnNEbnJ6R1RW?=
 =?utf-8?B?bmNRMVExdlZjb1hTTjNNd2ZQTk12UDdxcW9ReXlzYnNHbEprZU1hNTBJUlFk?=
 =?utf-8?B?d2lXb2t4M1lRQzRpQm14Z3ZsUkJxTFMzenpxL2dMYzhNc1dXODNWNVRZRGhx?=
 =?utf-8?B?QXJXcWxpZ0pwTGVleWkvOFJXalh3VUpnbHdQQ0p4eGZHcVFlUGxFTGthOWZ4?=
 =?utf-8?B?ZDBOL2pXUUxvbmI5dG1aZTFFWHF1R01RRDhySmRkTVlzenhGam13Tm9Vd0Ni?=
 =?utf-8?B?bThhN0NaUWdGQUdEVndWaVRxM3NFQzhkZ3RmbkYzSkRpZGtydG5UaTUwNWha?=
 =?utf-8?B?UHFaTUJKOGNxUHI1bGZwWmNtQVl4UlNOMC9kdHZYZks5MnNnR09xWVl4eTA1?=
 =?utf-8?B?R0xYMlVKMmJqTDh0Zm11YTFlNmdycGVNeGtQN1M3U2RlM2ovTVhGKzBmWEtj?=
 =?utf-8?B?L21HcXhCUVZBamZOOTlnTUdFM0V2Nk1uUlhGNlcvUkExdWpkaGpJZ200TGZ3?=
 =?utf-8?B?OTVZbGh6WnoybkdOa3o0LzVXQllVc3docVpaa2JmN3JJenVBZmRySEdJZndB?=
 =?utf-8?B?cGZBTENmNnBxMXhFd3lzaUlEREs4YTFDK0JvbEdwUVE1a0xzSDFtVlhzalpt?=
 =?utf-8?B?enp4UVp4bGRFRTgwanhkN3QxNkJKVDluSUNoZDdiUnJKQzMxR0dVOG9qSWk2?=
 =?utf-8?B?QVp0dk00cU1IM0o5Wjl0MCs5Yjc1cEJPeXM2VXBrejZWMFpqZjJRbnF3aFd1?=
 =?utf-8?B?TVNDbmNIS21QQ25YQW1wZGJ4dm1kNE9MQTFLeHFORzNWYU1LWXpXSzhzNGJP?=
 =?utf-8?B?MkgycC9lbmt5eXo2Y1h4eUFCbGIxd0IxT0plYjd5SE1GRG5DQkhzWUw3M2VU?=
 =?utf-8?B?c2FpckUxdUVwQTJGa3hZV2dQcTBXa011cHRHQS9IUUJnekdudllwdWlFZVZO?=
 =?utf-8?B?dmpMNmR2TnJxMkR4ekVIanlCYWdIU3VSbkJtYWJjMEFENjJlU1ZwM3p0ZzJH?=
 =?utf-8?B?S1VqemxwbHpvaWl0QU12OFYyK2VwMGxvK3JpYnU4WEZ4NWJ5aWthb2dlaldE?=
 =?utf-8?B?Mmd0MnpoaGg4Zk0wTXJCZzhNQ05zOFoxNVdqSGdtNGZqWXZsSlB2OTN0ck4y?=
 =?utf-8?B?VThtY0tJN0FUOXl3NDRGSUJObGZhcGxVbFRhdDZ0YzBsSlMrT1hNYS9PTGo2?=
 =?utf-8?B?RHFleDR3bjJ6dDE0WlhpbDhpVjhnQ1dYYmc4ZVZtT25qRi9pT0xXZStCQzlP?=
 =?utf-8?B?bmRXS3htQnJqSkRzd1hmVHM4dDRvV2pWOGI0YlJpWEZ6RitscURmR2RhSTha?=
 =?utf-8?Q?TP6MNXiQmyXGmnzNTt3Qe+c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f927c0e2-63d9-484d-9bb6-08d9da6c2e6c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:20:42.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p87Z/6cZafs/muDoEhPS4UiEAJw27UA48eMIxdm9SLNHgf9L5Wk3SBUZiZhzvqLE3PEIvkj9ob17yDcpzpKJDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6065
X-OriginatorOrg: citrix.com

On Mon, Sep 06, 2021 at 03:01:12PM +0200, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Change IceLake Xeon C6 latency from 128 us to 170 us. The latency
> was measured with the "wult" tool and corresponds to the 99.99th
> percentile when measuring with the "nic" method. Note, the 128 us
> figure correspond to the median latency, but in intel_idle we use
> the "worst case" latency figure instead.
> 
> C6 target residency was increased from 384 us to 600 us, which may
> result in less C6 residency in some workloads. This value was tested
> and compared to values 384, and 1000. Value 600 is a reasonable
> tradeoff between power and performance.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Acked-by: Zhang Rui <rui.zhang@intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> [Linux commit: d484b8bfc6fa71a088e4ac85d9ce11aa0385867e]
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

AFAICT those values are all from measurements, and not in any manual
or specification?

Thanks, Roger.

