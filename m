Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE4444099
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 12:27:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220806.382212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miEQ9-0004UX-6D; Wed, 03 Nov 2021 11:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220806.382212; Wed, 03 Nov 2021 11:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miEQ9-0004Sl-2P; Wed, 03 Nov 2021 11:27:09 +0000
Received: by outflank-mailman (input) for mailman id 220806;
 Wed, 03 Nov 2021 11:27:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+yV=PW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1miEQ6-0004Sf-OH
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 11:27:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8b7fab4-3c98-11ec-8568-12813bfff9fa;
 Wed, 03 Nov 2021 11:27:05 +0000 (UTC)
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
X-Inumbo-ID: f8b7fab4-3c98-11ec-8568-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635938825;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PcWxRx6lKDW0LWsRnIK8eLYiE3zVMCeVeGyeKQjpmRA=;
  b=cn67Mev+XP9pO0Pz7ZgWrdNPUhHWY1r4BvVFlN3uVeNXAGOeIBtpl/FE
   fxYVRpWWEHAL7zt6r4zb1mfjbW1LiwVyfTYe7kjSmPmfojZOXig4zVBgI
   s04iGKEn31EtEgcksEu9I0kIxmnaLatsPh5BgNXCn+9t7DMFzpGR1NUP6
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: et+79km01JCDOnRvj91Nc+gMPUiFK+ONfo3mWTwKAXTf7do7/wJsoldHVaDogORt+N944ep98Z
 GYWOXeJbvbosOj+51HfrjyhRiVwMFhSNKPDb22idL4qgBxxywlkbshZUvi/FBBlVDx1N2yPSnJ
 vU2AV5XMK24IwLF+N1vxMKX6s++AsPPTw8WNecQmbeQVvPNqpoohvdXoGYWTqrA6H8/a3+j3IA
 w2xK8nB8D6MbjPsngR9cKMcZKoqDgTZz+Fa13fX9xRLXCuqYtm3i0su4pt9G/LgHUfACDPhqCy
 +oRG//PdeV5OeKndlC3gKbXh
X-SBRS: 5.1
X-MesageID: 56993047
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:chGVxqh8vctNexGvlXndygCSX161VBYKZh0ujC45NGQN5FlHY01je
 htvXDiEa/6CYWv3KIokOti38EJUuceAyIRkG1BvpHs0EX4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cw2oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1AhKKZFiwvPJfWo/RGdh4COCVVLPVZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2JEfRq6CO
 KL1bxJdfBn5Zht2HWw0FbgjkcemjUXbVGRH/Qf9Sa0fvDGIkV0ZPKLWGPPPZtGPcuBEkU+Zq
 3zu8nzwB1cRM9n34QSC9nWgl+rehxTRUYgZFKC73vNyiVjVzWsWYDUcWEGnu/C/hgi7UshGN
 k0P0iM0qO4580nDZtz8VB2xpDiDpAwRX/JZCeh84waIooLO6gaEAi4fTzhOaPQvrspwTjsvv
 neum97qHjVpvKeidWOG9ryUoDWxPgAYNWYHIyQDSGMt4dPuvYUyhRLnVct4Hei+ididMRb0z
 jORpS4ynYI6i8IRyr679lDKhTGrjpXRRwtz7QLSNkq14wU8aIO7aoiA7VnA8e0GPIufVkOGv
 nUPh46Z9u9mJYqWiCWHTeEJHbeoz/WIKjvRhRhoBZZJ3zaw/3+ue6hA7Tc4I11mWvvoYhewP
 hWV41kIosYOYj36Nsebfr5dFewn/JbJSv/jVMrOVcoVR58rXwus7XlxMBv4M3/WrGAglqQ2O
 JG+eMmqDGoHBakP8AdaV9vxwpdwmHlgmDq7qYTTik3+jOHAPCL9paItaQPWNogEALW4TBI5G
 jq1H++D0F1hXeL3eUE7GqZDfAlRfRDX6X0bwvG7l9JvwCI6RwnN6NeLmNvNnrCJeYwPyI8kG
 VnnCydlJKLX3yGvFOlzQikLhEnTdZh+t2knGicnIEyl3XMuCa72svxCJ8RnI+F9qLw8pRKRc
 xXjU5/eahioYm+fkwnxkLGn9NAyHPhVrVvWV8ZaXNTPV8E5HFGYkjMVVgDu6DMPHkKKWTgW+
 NWdOvfgacNbHWxKVZ+OANr2lg/ZlSVNyYpaAhqTSvEOKRqEzWSfA3Go5hPBC5pXckurK/rz/
 1v+PCr0UsGW/9RuqImV3vvZx2presMndndn86Dgxe/eHQHR/3a5wJ8GV+CNfDvHU3jz9rnkb
 uJQp8wQ+tVc9LqTm4YjQbtt04wk4N7j++1Twgh+RS2ZZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQxmvY48MqLRio/yRw5reGDxlfZkHelCxHIbJpG4o52
 uN96tUO4gmyh0NyYNaLhyxZ7UqWKXkEX/l1v50WGtaz2AEq1ktDcdrXDSqvuMODbNBFM08LJ
 D6IhfWd2+QAlxSaK3dqTCrDx+tQg5gKqStm9l5aKgTbgMfBi982wAZVrWY9QDNKw0gVyOl0I
 GVqaRF4fP3c4zdyicFfdGmwAAUdVgaB80n8xlZVxm3US06kCj7EIGEnYLvf+UkY9yRXfyRB/
 aHew2HgCG64cMb01yo0eEhkt/28EoAhqlycwJiqT5afAp03QTv5mav/N2MHpizuDd41mECa9
 /Jh+/x9aPGjOCMdy0Hh51J2CVjEpMi4GVF/
IronPort-HdrOrdr: A9a23:hHV7davKiDoaxxYgpRYdJTyS7skC7IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLnAbV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqpmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXsHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa13ackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmP29yV0qp/VWH/ebcHEjaRny9Mw0/U42uondrdUlCvgslLJd1pAZFyHo/I6M0kd
 gsfJ4Y042mdfVmH56VMt1xNvdfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.87,205,1631592000"; 
   d="scan'208";a="56993047"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3ijAPKa88kd/dws4th91RN/T+Zi1H5LS0KRHpnInmHGmRUvmNRaweiJvEPO8NgLhOEs6jz0/YQakzm/wBWVw9MkeC1L9yHTSYIPdsvjo72IwDgBKnKzyVP8j0qrY8JQjTm2FUmx8K5C6AraFPjjeM0pGzd1jQlw4r7l8pBu4DcyLXToin1lcLldobFQpuU/FgipBopIqhkWO6qA9x1SZIuzYxdxq+XCcXOiGKcE37LFhoPF9b2kn/hlgZCcgEZQcw/VgtbMzm1WyJ6qwMIwH1awuegHdaYGz3tmx19nA1N7m9kMbVw9xS4Oon6SnYW4BLPZp4iPu5iChE4Wz4XfFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5/rMpp17fCyF7TNdmwANrqFRWQerO9Pqw7bzVFp80E=;
 b=lsZi40epYwea9ofnbUfS0vfjC1x4wjRYyLVSlR52FnEIJiT3XFE5my9EGRl1xZHc7vlljtr0j2xahQyCk0Alq30bBEJ+TByiSlTv10/Utgo6rhDXjabJef/zLs4aVexIKFbjJEUlO/lVevq3TsCuYf/hfCDSj1SRsl6ZDWRpUM0dxwcdtSJnZfgd4I9qZLw28meEcjrHCxjQNmSTRAXdPheGr6VCHp33+8Epjg8v0WcuXccjRZQzrxlmKvhCwJAU1PNCYuGp/VmdS9LJKeZOsAibKhwKzD2wPSA9H5P1tLZ9C4rt7efzCuy2Ja7V/2huXs2QnGskJIWZrzXCl0KcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5/rMpp17fCyF7TNdmwANrqFRWQerO9Pqw7bzVFp80E=;
 b=ndw+UurDftu2/UXmlHWJqbWiceUgSQI4vh0Xw4COJFRrHS0siDqMwg52Lpw3Sw2SlveIBidy92YqEsK07kxhShSRjzx2cyzFHqronlYC+yRiBskOS5Sru4J1kiQ+M7D2XgYNOezdDowafZxskayN2qoCFBTtpXfowt2lYtTjcvI=
Date: Wed, 3 Nov 2021 12:26:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Message-ID: <YYJx/3YpcLRTHThB@Air-de-Roger>
References: <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
 <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
 <4d4a061f-6437-5d51-84e0-d2139f47eb76@epam.com>
 <4f77a4f2-a66b-465d-5859-7fe71ece8168@suse.com>
 <48506e1b-2dc9-4652-f169-3d44135a4e74@epam.com>
 <7efa4dd7-83b3-daac-cc02-86f80762513b@suse.com>
 <d3908703-3501-892c-55fc-5a171318eeea@epam.com>
 <YYJr75RbSOuvbzGF@Air-de-Roger>
 <9b9bd48d-ab2a-3e3a-5327-d0b8eff5a8ae@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b9bd48d-ab2a-3e3a-5327-d0b8eff5a8ae@epam.com>
X-ClientProxiedBy: MR2P264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8d6600b-b74f-4ad1-ec5c-08d99ebcda57
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-Microsoft-Antispam-PRVS: <DM6PR03MB40578DFA77F3CD8E71D3D1B88F8C9@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xkwMbgIaRUe74vPlCZ6bUTy4MS8fM2xSvHH1DXRwX9gZwBp6v2hiipICPfJl/2s0hUAq1i0FsHGk+zmEZcHM47Gtbn0FTyJ87c1dxiDtOCfcC3Ykb2lwLq+npwtcKTngQuNNRWafIWlu8/4EBcZlYdLQoDpqVllF8xJD/OLhLv8TPT1+EujjQ7hDlRYotHSRNLbsfA+tDYhko9LFw0Vb4FflfzzsV+0DvPvmE5+fG02GxcxCPtu9sTbrWqgn7g7yDvpjihT8KdO0S4WRHqDEeA6r9bnefYFjweFL4U5SL3+PwYqAOIifQGh/kMsc3vua9SzahYr9TBHR4gnm5u/Fuc0NCRClQY5cmUIi8y84mI9/6qQCfPHwIwhWrAtTjg5MkTU6SyU9sRvwLGLTteutwLzNa4mIZqr7gbVHWHisN7zNOHvkcEQBUjFfRUlvHhkQdESrDmadVc4c0Eejg5LkEh+G8MYEbFe3aIznEFVlghL3pCK11i/WjaA1h6DAaQtREZ/MHHBKiCdrM6gLv5JxZDNSAwj2Ez7NO4udv7+OSBdJzRN3tdsTrpLMrwCm1UzbkNC0uKhtRR+FW9A0Fkspxf0yEp2n47chrc6ObQVpggqvTKKYihtMpMWtmY5TJJTmEW1/UgcMwmOdqMWWFDFxbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6496006)(6666004)(7416002)(38100700002)(316002)(2906002)(82960400001)(4326008)(86362001)(85182001)(8676002)(26005)(186003)(6916009)(53546011)(5660300002)(8936002)(9686003)(33716001)(54906003)(66946007)(66476007)(66556008)(956004)(6486002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGdJZWhGRGptZVRVTnhodlZnQnB0VVdtYi8zbUNpLzhtVFNldnoyMDZ0R2ox?=
 =?utf-8?B?M1dDNFhrQkJwMjdSaFVZZCtGSlU3VGhLTHNTVVd0SnVkRHRnTlNSb1FsY1F6?=
 =?utf-8?B?R0NzYVJjUkNaRWlEdlVaUUV5dHZLUnhmNDU5VDloQjFjUnRGdVpjYkcyM2Yw?=
 =?utf-8?B?Q21sRFozUTAxK2toMHdrbmxzdndRdVZSaEJoOXRhTDZmSjA4cDM5VHBzZWVl?=
 =?utf-8?B?b3MvRWlCTGlSalRPSDRWS2Jsb3VlMWJxSWVXc2dFT2pqcWxlOUwzdEN0dkZC?=
 =?utf-8?B?eEdtdjV5Q3pKcjg3MVJUbS8zMytsallDMjlLWWpNc2ZMUncrelBlOElCZlVu?=
 =?utf-8?B?TkRBM0gybU5lSEd4WUhmanh1NUF6QldobjVZMGx3TlM1Zi85WEJLRThsNTlP?=
 =?utf-8?B?UTJOS2RSVXNRSWNHTXJVNlZHK3NWMThsdEI1VE44cGhOcHNVeEE2NkxiQzE4?=
 =?utf-8?B?djhMYnRjRjVKUXl5VmtTNUtQME1jR3FBTlpSeUNDd0ViYWhpYjhVTG5tbks4?=
 =?utf-8?B?WnFud0hBeHFMelprVktMa01KQWdCdkM5M1lmQUZlQmJNUEpIajdpMUFQaGxN?=
 =?utf-8?B?RVR1WVY1SzlTd05hNnd3dXkvaW43L0RlWEd4b0MzOEdwVHRXVGRNODlVbS9i?=
 =?utf-8?B?dkR3Mm5ROUY4UWJTaWZZOFJ3RCtIRFZqQy9adnB1UlJKLzlKWEJtM3FmOTFL?=
 =?utf-8?B?UTh6RDhFTDhzQkVkOUl2SWsvTG1UajhIUzFLczVweWRxSnlrY3hWNmVPcjVG?=
 =?utf-8?B?emNscVM4MWdXdWNBNVFsY2M3cnhWaEpUdllXK2Y1WnZreTVKaGQvM3JXd2Zn?=
 =?utf-8?B?OW45cENvNVJraXJpSUVPa25pTVNMZC9hcFVsL3I4UnFhMmRoMUJmTEwrWDYv?=
 =?utf-8?B?K1cvVHpHcWdJSVJTcUN1QmFhM0hoYlVOSUd2Y0l5cXgzY3FTQWNiQ1diZUg2?=
 =?utf-8?B?bUp0eHY0US9pbG9XQXZUNzBhZE9ZRlRhYTB4K3ROdi9aY1VFZ05SQzFMT3Rr?=
 =?utf-8?B?cURHRDhqUUdrTTY5akNFUkwzQzNZQkhqUVBTSktxSXV5NnFvNmR3N2h2M2Iw?=
 =?utf-8?B?dERlcWlGR2UxNW8wUXpWS3FWRFVCTm1xVnBqa1N6dTFIbjdhZ3FTZzgrcXdm?=
 =?utf-8?B?cEpHRkllSjU0MVhJMDhoTE15TitwWWQxVVFwWE00TmdheTFaK1NoaFlUdWtl?=
 =?utf-8?B?SXdvVFJIeVB1Uy9oUmdRMnF1Qk9UTGZTOXRaZlAxZEpmanZsZzFKTGYyNnFj?=
 =?utf-8?B?VHlaS1pMR0NycnoxUEtyQTBEbkJSbEJmTFlUU2l6NU9xbk9CT2sxOVN2S2FF?=
 =?utf-8?B?blUzRHB0eThjd2laK2l0Tm5BcEdGc3R3VkNMUldIdlgrVmpkVUlvWEhnM2tr?=
 =?utf-8?B?akxML1F2NWExTmVIaGtxWEZvOWJjRmpQV2UvUm83NW41T0UxVlh4aGk1WmN2?=
 =?utf-8?B?T0NsNFFha2dzbDR2RnZlaDVqMmVMdTFxZ2RKQ1JrYnEzK2k1c2tvYjYwRmlU?=
 =?utf-8?B?YzErdUZZL2cxOTR5ZTV1S0JaaHkrSUxMV1Mxcjc4TXRrS3BCQVdtRWN3YTNQ?=
 =?utf-8?B?QldVbnV3cnAzcy82TkdJZ3dyNmZOYS9CMmZST2REODc2am4wemtPdDFiYm5P?=
 =?utf-8?B?emNkcDM3a0JubFVXbmtFeHpNcjNCbGpJWDh6UzUraXNFbTVHN25TMEY5QmVi?=
 =?utf-8?B?S3B4a2FtVk5ib1I4anBGaElqRHJ3QWFBb1hsZERxdWNaMTBlV050VURsNWpS?=
 =?utf-8?B?VDN2eUtLWndMNFJSWnl2Rmc0RkFjWW91N2JSY2cxV09wWkRyWHNuZC90cFZE?=
 =?utf-8?B?MHhSUE1YZENXTS83THVOYllRVXlidHpoSnN6bCtsU3BmaFFwTm01WFVGZUFr?=
 =?utf-8?B?L29JTjdYWG5uUkFycVJNMm4vMkZvNmRzYitUeXJvVERidk54UzlEb1dzbisv?=
 =?utf-8?B?bGkycW5JR3JzNlkvRjVNRFVLc25WS1lqaWZCRWsyVVVtbzlGSG5jeE9HZDJ0?=
 =?utf-8?B?enJEL1VrQVZENHhhS0c5cUN6emhFdXRFK0ozbVhLVXpWUnZ1UnYrUzBVRWl1?=
 =?utf-8?B?Rno2MTBHcktDTCtUZ3ZDQkhFYldQZ0h5UjlsRXpvZzNJdUM3T3FhemdiRFpY?=
 =?utf-8?B?NzJLY2hrc3ZEeFBjU2tKcVdXREtUNkViWlEzNG9RYTIwWk9KcndrUG1kRktk?=
 =?utf-8?Q?LG/tfHSde0IwxqNBGgbqQ/c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d6600b-b74f-4ad1-ec5c-08d99ebcda57
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 11:27:00.5245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xogWBfSAzKGDu6zTNJQ93kEqldnyerhRrJ6oirWGD2tAKmrV3BeS/tn66VJ/xwWVihAzxooig8+1CsTV1OkEmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

On Wed, Nov 03, 2021 at 11:02:37AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 03.11.21 13:01, Roger Pau Monné wrote:
> > On Wed, Nov 03, 2021 at 10:36:36AM +0000, Oleksandr Andrushchenko wrote:
> >>
> >> On 03.11.21 12:34, Jan Beulich wrote:
> >>> On 03.11.2021 11:24, Oleksandr Andrushchenko wrote:
> >>>> On 03.11.21 11:49, Jan Beulich wrote:
> >>>>> Aiui you want to prevent the guest from clearing the bit if either
> >>>>> MSI or MSI-X are in use. Symmetrically, when the guest enables MSI
> >>>>> or MSI-X, you will want to force the bit set (which may well be in
> >>>>> a separate, future patch).
> >>>> static uint32_t emulate_cmd_reg(const struct pci_dev *pdev, uint32_t cmd)
> >>>> {
> >>>>        /* TODO: Add proper emulation for all bits of the command register. */
> >>>>
> >>>>        if ( (cmd & PCI_COMMAND_INTX_DISABLE) == 0 )
> >>>>        {
> >>>>            /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
> >>>> #ifdef CONFIG_HAS_PCI_MSI
> >>>>            if ( pdev->vpci->msi->enabled )
> >>>>                cmd |= PCI_COMMAND_INTX_DISABLE;
> >>>> #endif
> >>>>        }
> >>>>
> >>>>        return cmd;
> >>>> }
> >>>>
> >>>> Is this what you mean?
> >>> Something along these lines, yes. I'd omit the outer if() for clarity /
> >>> brevity.
> >> Sure, thank you!
> >> @Roger are you ok with this approach?
> > Sure, I would even do:
> >
> > #ifdef CONFIG_HAS_PCI_MSI
> > if ( !(cmd & PCI_COMMAND_INTX_DISABLE) && pdev->vpci->msi->enabled )
> > {
> >      /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
> >      cmd |= PCI_COMMAND_INTX_DISABLE;
> > }
> > #endif
> >
> > There's no need for the outer check if there's no support for MSI.
> Ok, sounds good!
> Thank you both!!

In fact you could even remove the check for !(cmd &
PCI_COMMAND_INTX_DISABLE) and always set PCI_COMMAND_INTX_DISABLE if
MSI is enabled, which I think is what Jan was pointing to in his
previous reply.

Regards, Roger.

