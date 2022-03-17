Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC02A4DC47C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 12:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291501.494777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUo0S-0008PY-Cp; Thu, 17 Mar 2022 11:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291501.494777; Thu, 17 Mar 2022 11:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUo0S-0008NI-8c; Thu, 17 Mar 2022 11:09:24 +0000
Received: by outflank-mailman (input) for mailman id 291501;
 Thu, 17 Mar 2022 11:09:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNAg=T4=citrix.com=prvs=0684b021b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nUo0Q-00080x-Jb
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 11:09:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b16bb2bb-a5e2-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 12:09:21 +0100 (CET)
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
X-Inumbo-ID: b16bb2bb-a5e2-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647515361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=fpKWCCUtR+/R9d1fr17rKD/uI5IeMN8VnwhiJs0DQeI=;
  b=Yw7CtvRkwwZk/udo9kE2Sp8uRvIJQS5rt3jLtChBIzLIb0QuhdMGE4W/
   hpXRxMjf0jGE6jm/4WxeXnvHPBOYgounVtKBcf6BV2vhNkrajwLZuSrc2
   J6mpvWPOTOeaGddLOyGCB9mivuPdIu9fSa3ua/SWJI6lPFZ9KqaGjtrDP
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66496270
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xAxTwK8imfBwi2eYLQAADrUDDX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WYeCz3TPKzfZjHwf9x+b4zl8UoPu8fQnNQ3Hgpk+X88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oHmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYaiRTszHojRpNQceRJBFTFPOaFi+JaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4QQaeAP
 ZVBAdZpREybOzlRHAwPM5IVu/uQjGfPfSNpq13A8MLb5ECMlVcsgdABKuH9RNuOQslEm1eCk
 UjP9W/5HxIyOcSWzHyO9XfEruXChz/hUYQeUrix7Od3gUa7z3YWThYRUDOTvv2RmkO4HdVFJ
 CQ8+CAjsKwz/0yDVcTmUluzp3vslh0bXcBZH6sl6QWO4q3O6g2dCy4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L3IGZCICZRsI5Z/kuo5bpgnUUt9pHaqxj9v0MTL92
 TaHqG45nbp7sCIQ//zlpxad2Wvq/8WXCF5ujunKYo67xhlraLK/R6m11Wjax/1ZKpaoSlWlv
 FFRzqBy89syJZ2KkSWMRsAEE7eo++uJPVXgvLJ/I3Uy32/zoiD+JOi89Bk7fR40aZhcJVcFd
 WeJ4WtsCIlv0GxGhEOdS6a4EIwUwKfpDrwJvdiEP4MVMvCdmOJqlRyChHJ8PUiwyCDAcollY
 P93lPpA615AVcyLKxLsG48gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/lmKr
 4sAbpHUk0oCOAEbXsUx2dRPRbztBSJnba0aVuQNLrLTSuaYMDxJ5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGcTdlWcQThmnktLMeu1Nb4m9CpTFXV1YT6AhihyCa7yvfx3X8ZmItEaGBlLkKcco
 w8tIJ7bXJyii13vplwgUHUKhNc7JUrx2l7WYXbNjfpWV8cIejElM+TMJ2PH3CIPEjC2pY05p
 bih3RncWp0NW0JpC8O+VR5l5wrZUaQ18A6qY3b1Hw==
IronPort-HdrOrdr: A9a23:ZMq3MKo0ZwdJ+A+PZTyyPsoaV5vPL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBThHPlOkPYs1NaZLXXbUQ6TTb2KgrGSugEIdxeOk9K1kJ
 0QCZSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHxXgslbnnZE422gYytLrWd9dP4E/M
 323Ls4m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUbqFh/dL5kUUtDPpZ1fSLOMB23ffvtChPaHb21LtBOB5ryw6SHlIndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="66496270"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xn2LMnkCgqbd1tMp4K/L4L5ni8CsCeu2FZcrK8C0In4KiBb8ESTsaXunzZYaxWQcUx3xHxrWhdB33aRW/Z/qs6XMGlEkDsFDdsxq5DRt9GgRcb23aQVdJXD6RxXadP/eRHOExbXwabE+eVBS/eXDPl/bkjssSRQmjaNG6/LJSJBIz+2Ju0aRv/DrQdnRH56lBZAnATEKi+4FE89F8i7UIkARL1jgGzgPc5BfsZSOipgg7tXEoL78dDuge76ZgXBK7kZc7E7QWLiEwYWlUwU/M0BeH1EcVd64hldqIz8O5Y3gE4fY31XSb7gX41MF05qatXMC0qRGHCB0w3hpHGRIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThI7FNLNj1qjzQJ85InJ5XwxtR+RxYNzUMMHvZI+Xew=;
 b=c2n1vAhBtjbvFq0pzUDZ4xTqD2eWCadALKWopb73NVqIOuAlgSRVHU91A4/B2AjIx3v4BFxOqf1iulIQ9wR8a5W/HbyOh3OssavggInXUbgZ7j2PRUvONZ1eJL/+7TsUSqBuYIQGnJYBU9mBY0+rlx6dj187KI4lefSN6cK6L2XCg4IfbVEsrs8ntY1/F0KVe8BBJW5hdH8U1zmbSc5rsfpaOuurMd5PyH/1qsiid2eZcgLj7uEn6Kty7XeWXOz65zM5rb0yirkvdLA4cUpnCav0R43dhHH8ybW9lquKZyQgw1DCrFpkT5h+WdK654Pp/jgie4XC31zAPIEPJUPJpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThI7FNLNj1qjzQJ85InJ5XwxtR+RxYNzUMMHvZI+Xew=;
 b=ACm97TaiD+KOsOX0HVQtgqd3U1M9MlT/MXC7KtcuAqe73oTITPm6s+8cccXdrYQlBX1qKgJuYx8kWE450omD9PeTTCqb0BqI0VOgt96V+wBnX8xdl3KWytll4Xtscg9kLD+XEfAyPBBvKNKUpjteEyFLRL6FHmeQXDxyKaHyF2E=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] livepatch: avoid relocations referencing ignored section symbols
Date: Thu, 17 Mar 2022 12:08:54 +0100
Message-ID: <20220317110854.39050-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317110854.39050-1-roger.pau@citrix.com>
References: <20220317110854.39050-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f79d9085-d628-4113-1a46-08da08069218
X-MS-TrafficTypeDiagnostic: BL1PR03MB6102:EE_
X-Microsoft-Antispam-PRVS: <BL1PR03MB6102D60FD3530E677D3771218F129@BL1PR03MB6102.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPgnejJ9C/oWZ0ZlHwxVHEA3YlAR6nZeOLn5S+6KqzfXiUT52GmmC//O/Fj6hsyk4J9RsMQrpMaPQF6wIg4wpLDoV2MpeFzNa/PxtIL0m/W6NOZ55gH4tWpq23JVDy8KZ+5g2n+UZr77QSexZmwmnyOl5FPX8+8DV2k/q/Y71gDsF5vpVSxUp1cxwmzHW1R+KmDCgtc4OeNbPtBPuIqprPyo1tRj+SSYGZAyk1bvgqEXzRL92kKIKoWRlYCFbptJ0RjgBa6Lj8OR47i7AjHZpe5CelWhlxvWNMA2POs3hGyrxbqJwiApUVVNcVlVIGR8oB/uB/brc84Cg+ITfV64cfZT3q6Rj+FsvnBPCvFPUR5M0V+DHniRpQcceQmFWR/myRS2Y8fZZGGrI2+Ju1nTpcHbN+29u9r5I+/cix2N05NGykTSC7hvi6wg7Q89fWnh+xp1h6BEO2kLHHkECCs67t/iP2ac2MUgZI7QaoVdZ3EJeYfIIwtaTWKejpsz5roICyH1sdYCnGQLS5CqNXIF85ZNVMnz2/YGZi7udnrh8x23oKznHKdN2Fh+QfYnRu4F6zKqBj9kP6F+iaHNtBABZYQNgwySVzt8QR7BPS1FuPRQe9tpqafuJDk+jJXDdLYmEycpDi5Y0iuNnDxFpEdM5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(4326008)(508600001)(8676002)(82960400001)(6512007)(86362001)(6506007)(5660300002)(6666004)(6916009)(8936002)(26005)(66946007)(66476007)(316002)(66556008)(186003)(36756003)(2616005)(6486002)(38100700002)(1076003)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3l3a1YwYjJzQ0JQNVRBUk5oM0dEUGNGcm50ZUFmeGNRRi9GU281TEdEdS9O?=
 =?utf-8?B?eldadGRvVzZja1picGVwdTVEWHcya3pOQmZiVVoyN0Y1eCtMZFNVVWs5a1Fa?=
 =?utf-8?B?UW5HRml4b0dCRWlETFN6eEN1QjRzY3I3S09ldDJLRHh3cmF1NDcraDNWZ2RV?=
 =?utf-8?B?Y2JGbUgvajA2Tkt4S01QbksvU3Fwa2RrdkgvdlBZVFgxYk5sQmdZSEVvUGtm?=
 =?utf-8?B?TjNYeGZ2amxaNWpEMnhmYW1aSk1mcm4weDdiaGJSc1Z2NDdnODdaNmZKY2dj?=
 =?utf-8?B?RGQ5bHpIR2FwL2U3RkZBN29aa2VWM2lXYlVxc2R3YTd6cTVuTGxBYWEvZHRZ?=
 =?utf-8?B?ZEpPb0tPZUgvaHJ5d2N1aEdGcERETDEvOUx1bkpwai9wVnJOeUYwRTV6eis4?=
 =?utf-8?B?WUlWcVhRSmdzQ3ZIa2xwNVV0VWNBRnIwRk1xZ2NVWW5sdm1oZjR5dVowbkpJ?=
 =?utf-8?B?dXBDVDdvL2VLRGppUzI3NWxWSnVrVkM4MXdZR3ZSNmZDWlozRkU1TzlZZFVx?=
 =?utf-8?B?QldTUnJaeTFxZmNkL01OZHVDUzhsVFhTY0Fsbmh0UEh0VUx1cFpsakVqMFdn?=
 =?utf-8?B?NmNqOFYxRzdTcWpTM2ZiU1JRS0xPSjVoZHBOcHMveUtnUTZOdzBXY0pnMUZT?=
 =?utf-8?B?djkvRllVUERhNkR5WGNlZWxqOExrS0J2ZnBFcjQraCtxOXhYbThkdWNnU0Zx?=
 =?utf-8?B?aEovNGV6RHVUVGE3T2hjSTZNMG5JUTRHZGcwSVY0dG4rWmFzWGtpV0FYNS84?=
 =?utf-8?B?R0tnUGJXSnc5WmFuaHJsUFFqektsVzgwbGJCd2lOcTNnVmVOZlF2K3lIZHpl?=
 =?utf-8?B?Zk9mWDVsR0ZvaEJjOEwwZWNmVE9KR29QTkhlSFozTmhRR3ZDa2oxUnpHbmRw?=
 =?utf-8?B?NCtwK0xHMU44MjVJZUIxeHdLUmNhTkx6M2Rpa3lsOC9MUUMwSXlqM05CdGlo?=
 =?utf-8?B?RjF5Tkx0VFpoRmE4WkdPaTVvMldyTC9UcUYzRENCcE9CdHhROHRVRjRmWWdp?=
 =?utf-8?B?bjBodTdWaDZURGRsQ0trTzdtUUFVOUs5TGdNcXdqbXdYbmZ0Qjk4c1kyK2Zt?=
 =?utf-8?B?VU5TdVB4cGFESXY1bTc1MHhod0t6VWxyaDBRempqNDVpKzhvQ1paU0lLaUdw?=
 =?utf-8?B?SVQybXBOVzQwZ0pidmdXbHMxREdLTm43aU5zRGJKcXRFaTM2RldLb1JLTWo0?=
 =?utf-8?B?ajdqUVJCSnVhb2J4dzI5c1VzUlU3WDNCM3ppcll4MEVlNktJbEdhSFFhUEJG?=
 =?utf-8?B?aExoU1VHb3psbXN2Z3ZnSnRoYmNNSjVJYkJJcG5MOHpPdUtoWEEyWW1IbUtt?=
 =?utf-8?B?WHZKTHRHWTNaTkJjS2lQMkc5VGVFNndIK3BzMVVCTTRqQXFkbFRJU1dEdFZN?=
 =?utf-8?B?YzJDM2VaZHVKbjFURUpFd29WQW1wUnA1cDlIbUx5UWwzUDVvWGJ3alpwOFhy?=
 =?utf-8?B?RlVxNmI5ek1mQm5qVlBqTGFOMTlmRDNCTXpFemlRcVJJQ0ZwUzF0cWNsdzJx?=
 =?utf-8?B?bGN0THNXYXppZmowbGw5QkFadHloNTErdjEyZThtdXNSQ3h5UFpCb1p4YTM4?=
 =?utf-8?B?bnJ6VjcyVDczQnlGTXp2a04xOUovYVpDZTBJZS9ZRXpJTFpxRE1ZT2N4SDBU?=
 =?utf-8?B?UnE3aEE2THRGa1FwVUtxTjZYSU5VMGQ3WGd0bmx6QWJmOG1uRXFodzJreVdu?=
 =?utf-8?B?UU4zTlBBTzNlTUhPekhvdTR5WjQ5WGEzeDdXL0MrNFlXZHRPZ1lhZGFLbld3?=
 =?utf-8?B?S0dDVWZOakNoWU1yWXFyaWdkN1FTR2NzbTNaN21nSklMYjhjM0FITTF0MzAv?=
 =?utf-8?B?ZGlZa3J1Q2FzejRNZ29rY01xdzdZd2FoTExmeEc1WlAzZFMyMWxkY05FcEtJ?=
 =?utf-8?B?Vi9od1FoSnNDeWlwWW5ZWExRV3NrdjJqeE8yMUR5eWJUdUUyMVM4VG1FZ2pG?=
 =?utf-8?B?cEN2dlo5OXNIamhZdVlYaFRlVno5bEREMitVUWoza3hJb2g2Wm1MNXNiT3hE?=
 =?utf-8?B?NGlPeGFqTEpBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f79d9085-d628-4113-1a46-08da08069218
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 11:09:14.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCxUG53zduJ8rvKhDmhAHfsZpE8T8s45J9rBwamCnl00wWkY7X2CX5rYgom9oICh55R6OI4hX3gu8c4+En+Bvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6102
X-OriginatorOrg: citrix.com

Track whether symbols belong to ignored sections in order to avoid
applying relocations referencing those symbols. The address of such
symbols won't be resolved and thus the relocation will likely fail or
write garbage to the destination.

Return an error in that case, as leaving unresolved relocations would
lead to malfunctioning payload code.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/arm32/livepatch.c  | 7 +++++++
 xen/arch/arm/arm64/livepatch.c  | 7 +++++++
 xen/arch/x86/livepatch.c        | 7 +++++++
 xen/common/livepatch_elf.c      | 6 ++++++
 xen/include/xen/livepatch_elf.h | 1 +
 5 files changed, 28 insertions(+)

diff --git a/xen/arch/arm/arm32/livepatch.c b/xen/arch/arm/arm32/livepatch.c
index 5a06467008..6aed227818 100644
--- a/xen/arch/arm/arm32/livepatch.c
+++ b/xen/arch/arm/arm32/livepatch.c
@@ -272,6 +272,13 @@ int arch_livepatch_perform(struct livepatch_elf *elf,
                    elf->name, symndx);
             return -EINVAL;
         }
+        else if ( elf->sym[symndx].ignored )
+        {
+            printk(XENLOG_ERR LIVEPATCH
+                    "%s: Relocation against ignored symbol %s cannot be resolved\n",
+                    elf->name, elf->sym[symndx].name);
+            return -EINVAL;
+        }
 
         val = elf->sym[symndx].sym->st_value; /* S */
 
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index 6ec8dc60f0..655ded33d2 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -270,6 +270,13 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
                    elf->name, symndx);
             return -EINVAL;
         }
+        else if ( elf->sym[symndx].ignored )
+        {
+            printk(XENLOG_ERR LIVEPATCH
+                    "%s: Relocation against ignored symbol %s cannot be resolved\n",
+                    elf->name, elf->sym[symndx].name);
+            return -EINVAL;
+        }
 
         val = elf->sym[symndx].sym->st_value +  r->r_addend; /* S+A */
 
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 37c9b8435e..a928e5bfcd 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -262,6 +262,13 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
                    elf->name, symndx);
             return -EINVAL;
         }
+        else if ( elf->sym[symndx].ignored )
+        {
+            printk(XENLOG_ERR LIVEPATCH
+                    "%s: Relocation against ignored symbol %s cannot be resolved\n",
+                    elf->name, elf->sym[symndx].name);
+            return -EINVAL;
+        }
 
         val = r->r_addend + elf->sym[symndx].sym->st_value;
 
diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
index b089cacb1c..45d73912a3 100644
--- a/xen/common/livepatch_elf.c
+++ b/xen/common/livepatch_elf.c
@@ -334,7 +334,13 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
             }
 
             if ( livepatch_elf_ignore_section(elf->sec[idx].sec) )
+            {
+                dprintk(XENLOG_DEBUG, LIVEPATCH
+                        "%s: Symbol %s from section %s ignored\n",
+                        elf->name, elf->sym[i].name, elf->sec[idx].name);
+                elf->sym[i].ignored = true;
                 break;
+            }
 
             st_value += (unsigned long)elf->sec[idx].load_addr;
             if ( elf->sym[i].name )
diff --git a/xen/include/xen/livepatch_elf.h b/xen/include/xen/livepatch_elf.h
index 5b1ec469da..7116deaddc 100644
--- a/xen/include/xen/livepatch_elf.h
+++ b/xen/include/xen/livepatch_elf.h
@@ -22,6 +22,7 @@ struct livepatch_elf_sec {
 struct livepatch_elf_sym {
     const Elf_Sym *sym;
     const char *name;
+    bool ignored;
 };
 
 struct livepatch_elf {
-- 
2.34.1


