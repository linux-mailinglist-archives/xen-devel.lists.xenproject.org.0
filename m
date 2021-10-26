Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82643AF3E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 11:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216319.375875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfIwN-0004zi-5B; Tue, 26 Oct 2021 09:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216319.375875; Tue, 26 Oct 2021 09:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfIwN-0004xv-1h; Tue, 26 Oct 2021 09:40:19 +0000
Received: by outflank-mailman (input) for mailman id 216319;
 Tue, 26 Oct 2021 09:40:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0pl=PO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfIwM-0004xp-24
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 09:40:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9aca058-3640-11ec-8428-12813bfff9fa;
 Tue, 26 Oct 2021 09:40:16 +0000 (UTC)
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
X-Inumbo-ID: b9aca058-3640-11ec-8428-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635241216;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1H/PNyAPUuwUIhadN1jEiq6UwFgPl+4vKP8Y6Be51EE=;
  b=BUivXNcGlXG7Z0k8gT+fCcp6HEr7XTpYX/gzzLMVHePE12I2/cBz5q2H
   oqknBikgD6m2314WQJBuBm7FhCd7jxlfrWZPXoDBz+wzBs3vw8hR5cGQZ
   tjhSSheu3fs/GgREGoVUTtzmJT2F812LnP1z0V260V/hz2SL4vcIqpQd8
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1QLIqOg2fUskHwwFZRjKRQC9EYA2fkduRWb05pEont/iC6N4u5WJMrApeyGbEPHsHZvbeaQeNW
 Dyjxosdg4VHq6n9AwNQxIsrD7cIjAFFh/WJVMwsPzCKIUvfBwfUA2vTgKDVzMpPR3Fsu19+GSp
 v+QScEyVxpHjdwRbA4GHF/Ypp7BYWx7GgWEYAjRsDhJ1v8xIfyuE8fTbpeEVX1xX2cnkbBsW3o
 CwYUPmPQ7aLvrPkfvy2ujpEdWTA9HJRXeDVwHX8chwxkQO3jir7PlJX+8E5XnKOVBny2Ic3j5D
 /ra2sgW7Az6vvb2rMzPXhriZ
X-SBRS: 5.1
X-MesageID: 57983270
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:i2VOw6MANeQbkFzvrR2zkcFynXyQoLVcMsEvi/4bfWQNrUp012EDm
 mMXDWiBaP+JamT2eo1wb4ngph4Hu8TUyoJmHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Ug9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxWlwMFsz
 dNtjLaXTC0HALfwivgiUzANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iVtI8Dhmho7ixINa3nP
 NM7cQpUUDKDUjYRB1IPVrFkuPj90xETdBUH8QnI9MLb+VP7zgZ8zbzsO9r9YcGRSINemUPwj
 kvc42n8NTQLO9WexCSt/2qlg6nEmiaTcIgfDqGi//hmxlia3HUOCQY+XEG+5/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Ug4QGQzuzP4gCWBkANVDsHY9sj3Oc0WDgr2
 1mhj97vQzt1v9W9bnaQ9aydqz+oDgETIXUffi8PTQYD4N7LrZk6i1TESdMLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1W7AhzWgt53YVDkf7w/cXn+mxg5hbYvjbIutgXD86ftDN4+fQkO2g
 Gkfm8Oe4eYNCrmAjCWIBu4KGdmUC+2taWOGxwQ1Rt94qmrrqyXLkZ1sDC9WBGs2I9sBfx/QS
 mjWky1v/qNBIESqRPoiC26uMPgCwa/lHNXjc/nbaNtSf5R8HDO6EDFSiV24hD+1zhB9+U0rE
 dLCK5z0VCdFYUhy5GPuH7917FM9+swpKYo/r7jAxBO7zaHWWneRTboUWLdlRrFktP3ayOk5H
 tA2Cidr9/m9eLGhCsU02dRKRbzvEZTcLcuuw/G7jsbZfmJb9JgJUpc9O48JdY1/hLhynezV5
 Hy7UUIw4AOh3iCeeVXTOyEzOeKHsXNDQZUTZnREALpV8yJ7PdbHAFk3LsNfkUYbGBxLkqcvE
 qhtlzSoCfVTUDXXkwnxnrGmxLGOgC+D3FrUVwL8OWBXV8c5G2Thp4+1FiOypXJmJnfm6qMDT
 0iIi1qzrWwrHF85Uq47qZuHkjuMgJTqsLgiAxeReYIDJh6EHUoDA3WZs8Lb6vokcH3r7jCby
 xyXEVEfo+zMqJUy697HmeaPqILBLge0NhAy87Dz4enkOC/E0HCkxIMcAu+EcSqEDDH/+bm4Z
 PUTxPb5aaVVkFFPuot6MrBq0aNhuIe/++4EllxpTCfRclCmKrJ8OX3aj8NBgbJAm+1CsgysV
 0PRptQDYeeVONnoGUI6LRY+arjRzukdnzTftKxnIEjz6CJt0qCAVEFeY0uFhCBHdeMnO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDday2AQxy1xEbZjNMQPM4cmCO4dWL00nA
 j6In66e1b5S8VXPLigoHn/X0OsD2ZlX4EJWzEUPLkiik8begqNlxwVY9Dk6Q1gHzhhD1O4va
 GFnO1csePeL9jZswsNCQ3qtC0dKAxjAoh79zF4AlWv4SUi0VzOScD1haLjVpE1JoXhBejV7/
 a2DzDe3WDnnS8j9wy8uVBM3sPfkV9FwqlXPlc3P8x5pxHXmje4JWpOTWFc=
IronPort-HdrOrdr: A9a23:LQCaV6t8itJIDsYfcyzyvDvl7skCkIMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtRD4b7LfClHZKTBkXGF+r8bqbHtms3Y5pa9vgdQpENRGtpdBm9Ce3im+yZNNXB77PQCZf
 2hDp0tnUveRZ1bVLXwOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mIryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idmrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amIazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCT2B9vSyLYU5nlhBgs/DT1NU5DWytuA3Jy9fB96gIm3EyQlCAjtYgidnRpzuNKd3AL3Z
 WCDk1SrsA9ciYhV9MLOA4we7rFNoXze2O4DIuzGyWuKEhVAQOHl3bIiI9FkN1CPqZ4iqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,182,1631592000"; 
   d="scan'208";a="57983270"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SM7u+P7Iv9TI40ypVgAj6MHMIOh1i4TUbWhrIsJQt/bA8iOlGoNABDObnDU+syIWK9uLdxjR1WkehvZHz47y+bNOExwJGZh5uMOoTHXddhDI6Qmybnlmc8Z2F3rZ9Cf/cs+ir1+WQrCnlses5cKPA9VG32IRGRQapYN10NDx68RVNLD9v5Ap1nB7mHU6yzlfl7vC7bJoFRNM4FLJJm+yxPgUGP/bvB3CerHxCRz1uoiO/38w9jRrDGti7BDhdFKZUyMCEYziC/5SRkUmIQrLx3CJeKzNsq6pyJMt9ZWu2AlW2iOFjAjq+SNybwVZ5qFKK6pViHh9briThmrWplzpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1H/PNyAPUuwUIhadN1jEiq6UwFgPl+4vKP8Y6Be51EE=;
 b=FxHBa8PWnvtNkNPBVZzAoE7ldUjMVBuNKuyDHGGsno+G42jRDttNhJOhCvMpdvCmtSXD7abYgOPues/w/tL/wRdLueRURTiPsB4BzRnqXEt1MY0L9HlCHhp/KWcXWXY20tgQugyBLYWtXR51uivAT/4u8yCEjTSo9+WZov7cFVoU4+QN6uj2ytMLWA0NazRceJ0rp9z5LCDlkostLo72GFVpIeZCxsnbx5D7HUYOR8+Zeea9mGHSe6Vp/+PnnWgG6xLrpQHTCUTSdqOXgzrpNnt3QOgVhJEVuAO7hbjjClFD6ahCBeV2+7p8kfv5b7XFwSxEyxrjU5xJwwrzGWCwRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H/PNyAPUuwUIhadN1jEiq6UwFgPl+4vKP8Y6Be51EE=;
 b=kuwKoJETM+FWigcWVHbo1wcWyRTu7OfkQMBeLIdiEFSv4RqL5r+cV8q3SPL9FfIW/TeVSUwFXmcNDlNuev6eQNT1IXxjuFrBwL+KQpV2AG/i3RvX5WC4Osp/EomgARODpksfyZ6VDWBgQjq2kEPPTikzWsSSXw2hmyYbq117vdA=
Date: Tue, 26 Oct 2021 11:40:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 06/11] vpci/header: Handle p2m range sets per BAR
Message-ID: <YXfM9mQh3DS3bpfw@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-7-andr2000@gmail.com>
 <fc9de674-1000-c956-3401-103d8388d428@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc9de674-1000-c956-3401-103d8388d428@epam.com>
X-ClientProxiedBy: PR0P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25ebb418-5dae-472c-309c-08d998649b23
X-MS-TrafficTypeDiagnostic: DM6PR03MB4762:
X-Microsoft-Antispam-PRVS: <DM6PR03MB47624136E8450FC1646465638F849@DM6PR03MB4762.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JIAB/Ahdlf3WDqrQg6nUGnsZxxko+tKqrPTmymIfr7g4RKrHmG4VCmuzFGqQobZx33VrDk17wffC+UaRJAEbnGZALtSjz4cZPbejpG4s5npJBtY7JhglNWBvVHKWeaiEKYp7pWitQbpVl3qM/MD20x+Zdi4uDjicev74Ml/ZTuh16bO3pcWyQGzhJQJcGqowQxpA3K/CTCRNdpWWhpFxPO1odyKeG5VUe9nEq8cYeECIKZ9YEwFGtIi4cC+2SO2qMCiRBzKQ8MohBj7VNAlxQun2E+ZL3+lOGIWs7H2obgpazQ9QtuAW9opWq+c8orJkcrLYOaH/sXzyqTpHMRRgXI5fUcniwYpRwGAFKnDO8wDVnrzomzkL2URq+lWFeHM7a8XFOHiXKThm5jOhvTJ8ctRW578vudLSFAHb6sTHVzdRlDvp+8WUWt5F8S2n4Lf4vKFcDWBUAL/MasXDKpskk3K4uowrGSLuqYxKkrmhOeXVFVotGgk9IMmtgokH+3qaY2nVnocED/+5Qw//6PXCPvlqbbG2d/8f+/Dzg+QA3zEDCP0z6JFuQs6mzy7ABSrsmqXVCDpUCwCqzbDLZMNkvtYq4CzGoT6DXdxK/r17nUfV0jsBPaJrT7Qv9aTGi4owRa36GXIH9XYh281yO6Y4pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(66476007)(66946007)(956004)(66556008)(9686003)(5660300002)(186003)(82960400001)(85182001)(508600001)(8676002)(4744005)(6486002)(54906003)(38100700002)(26005)(6916009)(4326008)(6666004)(316002)(86362001)(7416002)(6496006)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0xBYjk4WTZjTldJUTJtTCtucjF0Q0QxZHVkVXVNMlJ0cCtBRG9KT3hYVk93?=
 =?utf-8?B?eGJab093L3Q4QTc4K2g2Q1VjVlBxTGo5MkVWK0ZMY2Z1cnBTQ3FkSG81NllG?=
 =?utf-8?B?OFFNb0FacTZtQUNxampDekJxbFJYSFRnSkVoZ3NLZ2dML0cvMnVLK1JEZEpD?=
 =?utf-8?B?T0sxMldCSUxUMERNYThvSk1GVGZIZW52SjhMcjAySkdUSmR6L2VTN3R2eXQ4?=
 =?utf-8?B?NEpHUGhqMURZbHlsY3VHVFdMWGJaN2tseENBMVkvTGY4ZnFsUnZWSE5GaEU4?=
 =?utf-8?B?UjdWTjVJTk1ZV0tuUndmMGM5em5IcGFkSmx5d2thSGtzSzVnaXd5eTQ2bUJn?=
 =?utf-8?B?dXUxUDZ0NnhKSXN4RGRQMkdwSTJTcFlaTHpKUzdycGdrcjBkVUI4cFlDbmNC?=
 =?utf-8?B?OGVKMjVpeEFKcDBXbURlTDdjSmRMRDc2YUZGckJiOENtM3FpN0pnN3oxdnht?=
 =?utf-8?B?TWQ5SjM3UnF4Z2JzRXd1L29ELzJqZEI5Z0hzQzBxR3NCUll0YkVqaHdLRDQw?=
 =?utf-8?B?Q0ZzOGZ3Um5XNUozblpZL09RRHh5Y1lSZmtDaHdHMVlFV1FDMXNoeDJvRXNn?=
 =?utf-8?B?VlVFK0Z4cjZvRmprOTBnUFFqdG5BaFZELzdWWk5kWnp5RkMwMUQzcEVXbmVu?=
 =?utf-8?B?QldMUnhYa3l5TVhDMUR6TjVleVJvbm1zSy8rR2VUQVltZVBHOHBCaDltcWor?=
 =?utf-8?B?elNhN2wydDBpcEE0SktaejVUSmxGVnBFUDdzWkpkQXZZRmdtYTlLSVZqMkhq?=
 =?utf-8?B?L2M0b2lzejZMbm5URnpBOE5jYnl5STArempHT0lKVW1tS0xseFRsZFozVU1B?=
 =?utf-8?B?VUJxZ3QyUmZLWDdJT2hnY0Y0UUtkTS80QnMzeEhEWkpDRTkyNDZhUGkyei81?=
 =?utf-8?B?dXRjdVc4ZTRkQ2NYSW95YWc4MEJCdEg2cEJaSWZDSHZ2SUQycVIzNzl5S1k1?=
 =?utf-8?B?RkdMNE93RG5peUVscnJxRlZldzFPN2NOcEJ2Vk5neEpmdC9MY2dTaW45TVFJ?=
 =?utf-8?B?RXVIOWZ6WnlUaDBBR1BaVGVyUGpQSUtBSGlrQTZpMjVkSWM5R20wUE9WRlBL?=
 =?utf-8?B?OGRsQ0xDazd1cGdFWTY5UFQ2bUdOdkJoNEpUcENBT2hENUNHTlI5SG1CMno3?=
 =?utf-8?B?Rys3QXdSVjlVb2NaQms4ZmhjbWtWd1NkSVRlZjVqVEkyN2d6WFNhMHVkc1B1?=
 =?utf-8?B?TGJPdTBCWTRzazdITGg4Z25OL0JIdzU3WngwNTQvSmg4YWVocU5zeTRjRnRm?=
 =?utf-8?B?L1VmV2J4RGhnOE9UdWRSL2JTRTFTaXZRSlNDWDdxL3ZjQ2YrZ3Y3T0kzSzdJ?=
 =?utf-8?B?N1VpRHdFUVJFR2RNTERuTkNaandHcG1Nbml5S0c1L0tuaHlCbElUUVNiKzVZ?=
 =?utf-8?B?VTYzTHJEMDNUMXNXNUtzSXB6a25vUWZuODF6OTh1MVdNSXZxalJleGJCbnV5?=
 =?utf-8?B?YlYrb0I5NzY0QVFScUpPWGQ2VmpWVjQ2Q202TE9EZ3RKMUc0empXUXdaSVFL?=
 =?utf-8?B?SVVnMWVYb3VoUkN4OUZsbmExK0lFK1VUZnQ5bGRSeUNrQkZTd2FqNWtZNlIr?=
 =?utf-8?B?aDJBQ29OaEg2WVVjaEFGd25CY0dzUldMS1V3bTUzNlZQSzNGa3d4OXczVlhp?=
 =?utf-8?B?SUkzNEFxY1hjSEYyN3FtNklyeE1PbXBkSU9Qd1EvbDJ6NVYxbHFrdlFJR2RK?=
 =?utf-8?B?WlZPeFNGdllqRkFRMjNQK3hjeUQ4KzkxR01iZURpdUlhZTNQTXZyWkRVNUFm?=
 =?utf-8?B?K1pFT3JwZzlKVndraVJUSDN1L2ZKU0ZMR3g1c3BTRjFqVTlaamt1V0IvTkFw?=
 =?utf-8?B?UkxFL3JjQnJjVHN2ZUowV2pxRC91TmtqQUdXZmNEd3BsdVI0TWVqM1NXczZ6?=
 =?utf-8?B?Q1hweCtMWlZjajVTS3R3dDFNb1FRd21RMDJJNTg3ZVVCaiswWW0rRWxpYk95?=
 =?utf-8?B?aUNuM2VQZXcwOTNHR2tiZHcxTHlmQ0t1QXVMS2VCV0NnYTRiV3dGVkNZazNx?=
 =?utf-8?B?blVjcnhqVzVpb2E2b1p1ejdDVm9hVWhTb1p1Ti9xRkx6UFNGWVRHUFZrUVUy?=
 =?utf-8?B?VzVqNXMxbEV6QU93YmFCa0h3YjZUL3E4YzN3cVM3bVdjWk5rZTNJdDhQMVhP?=
 =?utf-8?B?MGU5UnVHWjB0R0trRHo1ODM3VmNYTFRoOGh5eGxadW5rcm1LQkFHa2xTaHVT?=
 =?utf-8?Q?KsEM+bfAwkGswJpV6FsnQWc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ebb418-5dae-472c-309c-08d998649b23
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 09:40:11.9300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/DNARs3ics/T3pl5gsrWT2BnDDIgAiyIY3Kuz16+c571YgcxgJgiynGRXPaf+urc+oDLrxbIogfGjXS1vCNLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4762
X-OriginatorOrg: citrix.com

On Mon, Oct 25, 2021 at 11:51:57AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> Could you please take a look at the below?
> Jan was questioning the per BAR range set approach, so it
> is crucial for the maintainer (you) to answer here.

I'm open to suggestions to using something different than a rangeset
per BAR, but lacking any concrete proposal I think using rangesets is
fine.

One possible way might be to extend rangesets so that private data
could be stored for each rangeset range, but that would then make
merging operations impossible, likewise splitting ranges would be
troublesome.

We could then store the physical BAR address in that private data and
use the rangeset addresses as guest physical address space. It's
unclear however that this approach would be any better than just using
a rangeset per BAR.

Thanks, Roger.

