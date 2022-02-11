Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6AA4B24C9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270438.464733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUTA-0000o1-Ga; Fri, 11 Feb 2022 11:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270438.464733; Fri, 11 Feb 2022 11:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUTA-0000lO-DB; Fri, 11 Feb 2022 11:52:08 +0000
Received: by outflank-mailman (input) for mailman id 270438;
 Fri, 11 Feb 2022 11:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFbI=S2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nIUT8-0000lI-Rp
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:52:07 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 076d5a3a-8b31-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 12:52:05 +0100 (CET)
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
X-Inumbo-ID: 076d5a3a-8b31-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644580325;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ODpKe1Z1mnh2NwbX23CJJ0JMCaIjnnoBv0UYDgTxAUI=;
  b=HOn7IhDOPVLX1UutYcoLlGTHkPIjXcQUCp0x1nykhlIG3jLuf7yIw2ux
   LUYIjKMzvNxLaoqQX7DpysXH+IyrGl/dzSo8O/4Ht9HxVQCJmr63P94Nw
   BLGBMgkKRuX9ByAgvrEQvcJt433TKl5aXjb9zlX/U/L6QEPxYFg0sh/py
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DFSDBVZwqBcPlvGqGAULNiUihvOs6k/ysY2GoaUSsYdzsC2N8dQVgWCj55i2nFM4r0Yi/Vw2AQ
 eRKfqwi36gsorM4+nuMoAgqc1s0m+ewGFaW7chC5MGokdLWFnPM90JrG7Er+yOXztGVgNUiBmZ
 UpaqZMDx83dBoCn7gwwRzTePmv2+Ysk08ADhqnKyAuJgE3i8dLdvQSarnWA3e98tkvVuxNe9eu
 0pnuay7zDMJaY8uoESMUiLzSb6aDnES5P2fkX2LyeS+j6zzPeuDTZpURCCX2AltZycArmD2Ncg
 rfij0vuTyoOaYqW4KN2BqaNJ
X-SBRS: 5.1
X-MesageID: 64415550
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PPlgLq6tj/SI/gdAdlOfgwxRtB3BchMFZxGqfqrLsTDasY5as4F+v
 jZJDG2HOvreZ2WkctAjPovj8BlVuZKAnIdiGlNrrSFnHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29cw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 +5jt5qUDhsTPqCQxf9Gdht1SipCBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmts350TQK62i
 8wxNSBTTjnJehN1YA0xFrMCzMGq2nT+SmgNwL6SjfVuuDWCpOBr65DTN97Sds2PVN9itE+Sr
 WLb/Ez0GhgfcteYzFKt1XahhfTGmy/hb74DD72z9vNsg1q7y3QaDVsdUl7TidCjlkO7bPdOJ
 EUV9zQGoLA78QqgSdyVdwexoGOA+AUdXdVQO+Qg7UeGza+8ywyUHHQeRzhNLtkvrtYrRCcC3
 0WM2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85jroSttgC6ezgsfCMDf82
 S2RrCM+irMQiuYGz6y+u1vAhlqEpJLEUwo07QX/RX++40VyY4vNT5ez9VHR4PJELYCYZlqMp
 n4Jn46Z9u9mJZOQkC2ARs0dEbfv4OyKWAAwmnY2QcNnrW70vSf+I8YAu1mSOXuFLO4fQhHrZ
 muUpTlR6cMOJyCPb4IuaL6IXpFCIbfbKfzpUfXdb9xra5d3dROa8CwGWXN8z1wBg2B3z/hhZ
 M7zndKESC9DVP85lGbeq/I1jOdzrh3S018/UnwSI/6P9bOFLECYRr4eWLdlRrBotfjUyOk5H
 js2Cidr9/m9eLCmCsU02dRKRbzvEZTdLcqnwyCwXrTdSjeK4El7V5fsLUkdU4Jkhb9JsezD4
 2uwXERVoHKm2yGbdF/XNS85Neq3NXqakZ7dFXZ9VbpP8yJ9CbtDEY9FL8dnFVXZ3LALIQFIo
 wktJJzbX6UnpsXv8DUBd5jtxLGOhzzw7T9iyxGNOWBlF7Y5HlSh0oa9ImPHqXlfZgLq5JBWi
 +DxiWvmrW8rGl0KJNzIc8im017ZlSFbwIqeqWOTeYINEKgtmaA3QxHMYggffZ1Sd0WZm2fyO
 sT/KU5wmNQharQdqbHhrauFs52oA615GE9bFHPc9rG4KW/R+W/L/GOKeL3gken1WDym9aO8S
 /9Syv2gYvQLkEwT69h3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0Ga7+HD9zoTQwKLw0/Y+XdifxNwmvO7e44KVnR7TNs+ObVSl1bOhSB0XQPLLZ8PI4/7
 /0mvcoat162hhYwa47UhSFI7WWcaHcHVvx/5J0dBYbqjCsty01DPsOAWnOnvsnXZowVYEcwI
 zKSiK7TvJhmxxLPIygpCHzA/etBnpBS6hpE+0APegaSkd3fi/5pgBAIqWYrTh5Yxwls2v5oP
 jQ5LFV8IKiD8ms6hMVHWGzwSQhNCAfApx70wloN0mbYU1OpRirGK2hkYbSB+0UQ8mR9eDlH/
 e7HlDa5AGiyJMyhjDEvXUNFquD4SY0j/wLPr8mrAsCZEsRoejHimKKvOTIFphaP7RndX6EbS
 T2GJNpNVJA=
IronPort-HdrOrdr: A9a23:p/2ufa3MMhonvN6Pzaa80gqjBSpyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA8ciYhV9MIOA4we7rGNoXze2O/DIuzGyWvKEhVAQOEl3bIiI9Fkd1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="64415550"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jm5rC02hn8y/u16k0iZaWL/HSyHN9G+xmdQ1bCr2JhOBKgsHNOtoMGj+XNqgQdwjTN5abUaceuUg9zwHnpt6jN7mZUjsJe5iuJLmTEHxdM3+b+Bl7ar1tUXeO2vjN9vDL/j+7dseQ6udXQ5Q8Z9VLcXocP2Y/pidcqINo0ZpG2oehZ2HctXVNjNEcxwzSpeQ9CHLrkNhh74A3t9gb1pkqIAiWAIFxQ6ISAWbW2kQxS1sBfFYB2pXo4V0TnIa7gO2AifoVdg3oGhKL2F4e1DullrDo4Haqlht2ZPZdNxR+eyVxhmZSQAxRiALvGIlYdS9oqP/KY5vv/FAIIQ4Kobvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3iEnlsl/OISpugzlYfdMqzfKrt7Q+BNMrtT57nZTgM=;
 b=LCOPD6A/s9EfYOysuOyRIeKGl+148FRHiCgcI8l1t6Sny6CzJk9d3/Ns2aCU0Wg0HRVc781WJHhwa0RRD2S11+oiXDMHyxOyVAuY8Pds9IOLf2Sm37qY3/vwHHeY1AVfbeihrbi2251jXHKsXPwxjdFEEd7CHOc4ZnX7Lk9fWgfWMHSLwEWVMEg7oqFUgf4zABo1dusCcHKPqwRTHfZCNGQN8ILf5vrG8FwQNSVvDiX6Ck9aEOVFOajG9VLX9PiqZ+zWNjWGSYX3ao0CQ84XNtWwmWjc+JegzDFJV128LACBSmxRrOAEi7+1JbNfqmeoQJfyQfEyBtzk/nToUUsZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3iEnlsl/OISpugzlYfdMqzfKrt7Q+BNMrtT57nZTgM=;
 b=EaLyVNW4lMwrOPjylMePt0bgH8H1Gh9E78TzmbmKHtocG+5nJdVTxau8pzO+X92s/rm/ahcM2UEmzzXM7VDHAvoR6n4AlGtlLY3oYqF+mlNfOiR7zOdCrxpPo0/G4Lny09/D6/qsR/TtqEVVZxJDI75qBhDTQl1eqNNr92SRipw=
Date: Fri, 11 Feb 2022 12:51:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Message-ID: <YgZN2acOL5B+PYF5@Air-de-Roger>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <878371dd-4269-6e44-4e73-344a74a04a84@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878371dd-4269-6e44-4e73-344a74a04a84@epam.com>
X-ClientProxiedBy: LO2P265CA0435.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeb84734-a78a-4b1a-9c53-08d9ed54e881
X-MS-TrafficTypeDiagnostic: DM6PR03MB4649:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB464977AFD62DB49740825D288F309@DM6PR03MB4649.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZB0nyzJoBSG1dClZy+TBqO21AuP2UBMLg6Oh6Umriw9St9GpWcCMaYa45iCGQJsNDFNsM2nfmGJVCangGRXAcG1PfeN274U00cd/DpQHrEubQ8FNmyAFp4AX3eUYcP3oRD9su2TALmjzgryv2dj60AvOjMhOOFgsK7vi1LIJntgo4ChvVGJfhDADi5RZpmQSeD+EwSQK4WofdecMiynsF7sKZzMsx7KOP7MQUdYsF154poWsyjZsRDaE8bLi3Tmqqx9wfj61f3zk4cO7UvCWEjRgDYdCMSGNEYx4bT4QVPfat7QF29GvlBHf2h0f6cIt70oTxImECXVvFAX9Zl1/T/WChAkkYNQiVp5p0C4ULTh1m+H7uDD1OAiLGtR1JLwR1MxmJUYw4x6gPcWuWw6lIGAAOOOOWMo+xaQ8k9JPhZuY0KvO4jSQ0krMXCwh/mXDjZwEXkC0w95vtx3t0A9dVhgtElBgamTwxqd9uMP8gFecQZLeSTzIaD3qJNyf+glmZ91VrkKQEIJa1s8s8y9t1j4uTWH5MyqbsXx1yMcdA7nP11xzphVcA0EwNJR94qY6hIsYHwkC/7h7FfMPljWYESvWB8PkHC1QD9Ih5KuZOcN0rQBXy9K9WeC9UpOOgXrmwBOb0EuGGJcvDF9ECLpwAu37ANG+t3a9k1hkXl+Rj6OD20+FuiUYkxpKuM3BBnvRjuqd947OKt08zSYvF0ZyhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4326008)(6666004)(508600001)(66946007)(86362001)(8936002)(8676002)(66556008)(66476007)(6486002)(83380400001)(6916009)(7416002)(5660300002)(316002)(85182001)(82960400001)(186003)(26005)(53546011)(6506007)(9686003)(38100700002)(54906003)(33716001)(6512007)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXBhSEFXblpmeFdENm9lcyt1WitnUjViNW16QnQ5b1paYUQ4TTJLWGhmRE9v?=
 =?utf-8?B?eWpiNXpWZFJGbG84UHh0MTRxTzgyYnhGZTJQZFIzQVZieTBCbTZpai9NTHhk?=
 =?utf-8?B?bmpWTjl6cVRIeGM3Y3JKYjVCb0dRU3pGc3l4ekwvemQrbmFyS0R1ZGwrZXB4?=
 =?utf-8?B?bDM4cFVVWWZ4RXlaYld6WFhIdHpTbGtkcmxscTJyTnNJNjJlazVLYlNDVzdI?=
 =?utf-8?B?d3UyQnk2MVV1QmlUUWlZOEx5R2pZaXh5enVjV1FWa29Sb09FS29QZEtQUHlW?=
 =?utf-8?B?REdUTEkvMzZvbytPMlI5NnkzZ2pmOVJHcUJLR04wcFNWY0xWZDlSeVZ0bHRB?=
 =?utf-8?B?OU16TzJjRFlEa1E3VFBWc0l1b09Xd0phRk15R2pjQzBGTVZqSmNhc21lZEtS?=
 =?utf-8?B?d21iTlhkYm50RzhLVEdMaVo5TkdlcnhTQXJTcmxMcXhqZEU4QlQ0QWhxbGh0?=
 =?utf-8?B?Y3dQdWdaUzVJTnhWdnVVdFcyUXJtNnB3NDdXenhpVnVPSVlSMHJzNFI2RFdo?=
 =?utf-8?B?YVZZK28yRkFvdzBkcFJnTlhCS2tjOVM2N0xETk1ETTdsOVZzMmM2aktkcGsx?=
 =?utf-8?B?THArcVp2aVlTRHpxNEdXMzFLampPdmlVemxIM0xKeEFrYXBSOHYwUWdsWDZh?=
 =?utf-8?B?ZExmZVpna1RzVDRLR3hsSHNoY0NwQ05qVkczK0xyZ2dJT09WSUpwSE9tSG5m?=
 =?utf-8?B?amxlZFRzZkMxaGYrc04zY3JqVmptWmc0dmkrTGNxNG5JdXFMdG9xQkNoc1FS?=
 =?utf-8?B?REtEdC9GcUZDV0xEYmhYWTlETFlrWW1zY3NWT092aXRHd2FkdlU0UGdNd1JW?=
 =?utf-8?B?N21iN3ZiOWxzSTVnaXloaXZpWE04N3NMUTMyYWVUMUpFRmVmbDdsNHRxSERj?=
 =?utf-8?B?TlBFUmpPcktCVjNsbmhXRTE0TnZjYlVHdzQxbmxDOXVveElpelpPbDAwNXl1?=
 =?utf-8?B?Rjl2L0RwSmVnN3M0amhpVUlsN3NFbHlreTdxaFExRGorUVBFbGVUd3JSZktu?=
 =?utf-8?B?QnJHRCt4L045T2xEaThMbFNXWTY4SytvY1VMb1lZdCt6ZStFNWdXWnppM0I2?=
 =?utf-8?B?T0lsR2ZHTTVEWVBKYUdrSmdvYU5sblMzZHhGdVczMHRWMEZmY3MyaGlKRnNz?=
 =?utf-8?B?YzB5TTZkODZpMk5rMG45ZWlaaDc4V3Z6a3labmhmcEd6dVFRd2JlMVAxR2pL?=
 =?utf-8?B?aFIzZndkNzk1dFRWNXFZSjJCeE5uVHFQOUpNSzhlWXB2QjMxVXlDRk9hTXcr?=
 =?utf-8?B?d3BKT0lLSFI3UHZTRHlsczdoKy9KdnNZZUVCdVAwL0RCZUVYRHcrcUlGSmhj?=
 =?utf-8?B?Y29zUmJveEJQOG5ZSDVFRjRtT21WdXh2OWIwTGY4V0syTXFEMUpsUDdqZVNk?=
 =?utf-8?B?Y1N0Ymw2QXhPZXJ2QVY2VldBNkNLNXhRYlhsUkxOZHBVU0FZVkNjRmVvTkh3?=
 =?utf-8?B?bnhkVHZSTE9Rdko2ODFXS2ZNSHlCS012Y0lWbTdaOUJ2ZmJZSm9aclFkMDVq?=
 =?utf-8?B?eFd1dzc3T1dDeGJHbkhCUlBLdWF6T3VETGxXWTlJM3Avd2FwK0c5cXg3YjlV?=
 =?utf-8?B?WlBBUTRSc0RYTmUvd2wzWWNBZ3RHZzJhVDAvajNqS1NhekNibEdrMFRqajBW?=
 =?utf-8?B?RTVBelVSanNwUmduWnlLV3JUMmVvQUxkTUlSQzNOUVozRjJuQ0hZSWhHMVFn?=
 =?utf-8?B?aFh6aG9zRVRLM25LTGhiOS9Nc0VWWTdORHgyMXhFS052VVBJKzYzS3oybkFp?=
 =?utf-8?B?N3NCNDdGVDI3ZGpLM3g2NnJZdnlJbTAwWDlaSDhnK0hOclBzMmgvczNlSnFs?=
 =?utf-8?B?UDBIVC9wK0JadndMZWZpM1hCcW9NUCtSNHRpQSt6aGdTZExTeEN5OFBXNFNq?=
 =?utf-8?B?azdVcWpJZjRYd3NrSXc5Mk5KRHpJdGVjS3BoeWZrVE5XUDV1bjN3VXdJZzR3?=
 =?utf-8?B?cy9vTi9TbHRxaFdPbWcvamZJRjlQWkVQVmhOZUs2dklKb01kSmF6RW1yWWlW?=
 =?utf-8?B?cmRrcldxR284aXdzeC9ra2pqQ25KSkJMNUlIQUJvK1V4ZmJadFZHUnJCWi9q?=
 =?utf-8?B?UmV5Q0Y2WWJFV1lXRjRXeUwrRGJnc054VEZFSFV0eFFmQzNyeXpNdTJya0I2?=
 =?utf-8?B?d25VSjIxWXErb3FNbmZWTGhFSXY5K2R2eFhpbHBZalRtSStUdURmZUVESE1q?=
 =?utf-8?Q?XqZoHdqa0r6gC/V5Fc2w8+s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb84734-a78a-4b1a-9c53-08d9ed54e881
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 11:51:58.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+idTFp82i2EYzVOicOku9iH5IodAvgm6pIjU3SJEdfWKEdBzbMd2dz8R7vUo6BmZn4FckiinQWkGrAtOAmoug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4649
X-OriginatorOrg: citrix.com

On Fri, Feb 11, 2022 at 08:46:59AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 10.02.22 18:16, Roger Pau Monné wrote:
> > On Wed, Feb 09, 2022 at 03:36:27PM +0200, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> Introduce a per-domain read/write lock to check whether vpci is present,
> >> so we are sure there are no accesses to the contents of the vpci struct
> >> if not. This lock can be used (and in a few cases is used right away)
> >> so that vpci removal can be performed while holding the lock in write
> >> mode. Previously such removal could race with vpci_read for example.
> > Sadly there's still a race in the usage of pci_get_pdev_by_domain wrt
> > pci_remove_device, and likely when vPCI gets also used in
> > {de}assign_device I think.
> >
> How about the below? It seems to guarantee that we can access pdev
> without issues and without requiring pcidevs_lock to be used?

Hm, I'm unsure this is correct. It's in general a bad idea to use a
per-domain lock approach to protect the consistency of elements moving
between domains.

In order for this to be safe you will likely need to hold both the
source and the destination per-domain locks, and then you could also
get into ABBA lock issues unless you always take the lock in the same
order.

I think it's safer to use a global lock in this case (pcidevs_lock).

> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index e8b09d77d880..fd464a58b3b3 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -937,8 +937,14 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>       }
> 
>       devfn = pdev->devfn;
> +#ifdef CONFIG_HAS_VPCI
> +    write_lock(&d->vpci_rwlock);
> +#endif
>       ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
>                        pci_to_dev(pdev));
> +#ifdef CONFIG_HAS_VPCI
> +    write_unlock(&d->vpci_rwlock);
> +#endif
>       if ( ret )
>           goto out;
> 
> @@ -1474,6 +1480,9 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>       const struct domain_iommu *hd = dom_iommu(d);
>       struct pci_dev *pdev;
>       int rc = 0;
> +#ifdef CONFIG_HAS_VPCI
> +    struct domain *old_d;
> +#endif
> 
>       if ( !is_iommu_enabled(d) )
>           return 0;
> @@ -1487,15 +1496,34 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>       ASSERT(pdev && (pdev->domain == hardware_domain ||
>                       pdev->domain == dom_io));
> 
> +#ifdef CONFIG_HAS_VPCI
> +    /* pdev->domain is either hwdom or dom_io. We do not want the later. */
> +    old_d = pdev->domain == hardware_domain ? pdev->domain : NULL;
> +    if ( old_d )
> +        write_lock(&old_d->vpci_rwlock);
> +#endif
> +
>       rc = pdev_msix_assign(d, pdev);

I don't think you need the vpci lock for this operation.

>       if ( rc )
> +    {
> +#ifdef CONFIG_HAS_VPCI
> +        if ( old_d )
> +            write_unlock(&old_d->vpci_rwlock);
> +#endif
>           goto done;
> +    }
> 
>       pdev->fault.count = 0;
> 
>       if ( (rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
>                             pci_to_dev(pdev), flag)) )
> +    {
> +#ifdef CONFIG_HAS_VPCI
> +        if ( old_d )
> +            write_unlock(&old_d->vpci_rwlock);
> +#endif

Like I've mentioned above, I'm unsure this is correct. You are holding
the lock of the previous domain, but at some point the device will be
assigned to a new domain, so that change won't be protected by the
lock of the new domain.

Thanks, Roger.

