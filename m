Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76564458CDF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 12:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228796.395962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp74H-000296-CT; Mon, 22 Nov 2021 11:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228796.395962; Mon, 22 Nov 2021 11:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp74H-00027E-93; Mon, 22 Nov 2021 11:01:01 +0000
Received: by outflank-mailman (input) for mailman id 228796;
 Mon, 22 Nov 2021 11:00:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=smF8=QJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mp74F-00026i-8X
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:00:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77ce4475-4b83-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 12:00:58 +0100 (CET)
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
X-Inumbo-ID: 77ce4475-4b83-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637578857;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2JWT7tYp+/aj1Rqf2pO5lx6Y/dgAT5U0g/ga01MYsuk=;
  b=g9GK+1TqvhEw3TaClQgsKhF/t7gu9J/o40c+SciD8OjxtDDIMBegWu0l
   z4HAd8aNGWMIX1gFJ7gxv6SuGB5/TmAYIQj+++CXJaaubkBQ+SmE7mSzy
   3jK5E1BQRCXD5W2BNC8TNsAlwqcH+6oUlp4004p7vG2LYhBUsJQxny55c
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DwlfENfOavzQFCaLity1I9kDUkjxKahqdaRteV3YUsxKgh4svNkyvnJ4UCwOSRAw1tJH5iuk8F
 vZNB7nDoeP0QI9Qp/HJEzbWOe8Igr2eDnQL5PUPvQt14A8Md8+kmLhvUUSMcFy4g1BK25lAmy4
 E4D5sWtkC16aNPcPt1TnQiWGkMT0WuMvkHY3z2x94bef8bOC5XP1z8GdhP2cKmlbIx2IJuPUGa
 gll9WrmF3ZDJ5iW+prywYuDdsCxvQm/CPhMY/1xTxJhohZS+KeKzaM4WM+R7Fv47OrIu/GUIrj
 56hPNfY6FBA0A2H6fMJTVVtS
X-SBRS: 5.1
X-MesageID: 58367631
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/gEu46gJuDKALxfkb4UmgdiWX161nRcKZh0ujC45NGQN5FlHY01je
 htvWmuFOK3bazb2eYwjPtuwoRlSvp7UndMwGVBuqnpmFy0b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy24Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1jpNvzZxkSPJb2o8IsUT9+SCxOI45vreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t1psQQqiFP
 qL1bxJJcBCZcTwUfWslK54ak9qDj0vleTtX/Qf9Sa0fvDGIkV0ZPKLWGNvKePSaSMNNhEGaq
 2nauWPjDXkyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYDUUX1ampfiyimalRslSb
 UcT/0IGpq838VGtT8XsGRixpneLswQ0S9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmJOEDjGz6IyWlgmJHxkXC0lZaB8abiJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r8tlshDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGCE6bKMN8N4n9hIx5JEVdoOiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+Tou4DKiINIYUP8AZmOq7EMZGPxD44owQuBJ0zfFX1
 WmzL65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI50/P7FZqX1bMEe1tGALXNogRtfrYyC2Io
 4c3H5bbkH13DbyhChQ7BKZOdDjm21BgXsuowyGWH8beSjdb9JYJV6WMnOh/ItM9xMy4VI7gp
 xmAZ6OR83Km7VXvIgSWcHFzLrTpWJd0t3UgOiIwe12v3hAejUyHtc/zrrM7Iusq8vJN1/lxQ
 6VXcsmMGK0XGD/G5y4cfd/2q4k7LEanggeHPiyEZjkjfsE/G1yVq4G8Jga/pjMTCieXtNclp
 +Hy3A3sXpdeFR9pC9zbaazzwgrp72Qdgu97Q2DBPsJXJBf36IFvJiGo1q03LsgAJA/t3Dyf0
 wrKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FJGmPWnn19aOuY
 fRu48v9aPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99RXZeeJNcfiHAJDLQYpdL3eh/Qdmz2U5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lztkAcuP/aHkjtQpjaFIXE3Wqk6so0XXd3wgQ0xx1AeOZHRB0caOn1Uhwmg5qXyH
 gKpuQ==
IronPort-HdrOrdr: A9a23:G5xCNaszI9NCKd3e135SkPdk7skCkoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5pau854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.87,254,1631592000"; 
   d="scan'208";a="58367631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWUBcHu+DFVBLNjx4XO7Pz/TrVYxeEV8g5IwlkH6sXWuWQMl/wS9GWxUjn9iaK8IBJa8cNSb4VptznyxR3TQH9k2Y7OG3PfLE0UU9y32e+LzchApYABZq1WcyYf6uUVRsuxMHTh/bg+bOWMUDM2PhxgPqU1GH8ecE6OM8C+IC/szbgt+5NmmKBFaWWFYlZKp3QbFq7OEAwC82eVvQ6qWrzD0Ojg2Pn8x1j18xm/oMKfVqvdzQNkVq6gtzLC5LbKx1m6YZVZaERn3PC+cdv7/4TUPH86VW6h5bi8/Ige6Auh9pIyvOBzKAproLcc+DNElIaWflOPtvpP271S769aFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qbLN8RgILPf02a+OrgIlXBuOT5Lo6ac1OQeWn+w24Y=;
 b=HbFlJWMRHc1etvgtoAP36wF2kH0sKBhqtwbGegOUFw9FhWBMTy3wILVtl5cCTM3CWdPA3m7N50g0tDU8AMkm08Sy2ioGOZYuhUC1Rgu7zloqI9NxAkq0gTtNzlqf9JGDZxuKJAGhbfE+cY2PHj7ll80GUvbnmySsal5hEqKg/ylU0CA5A7WvVzztyrAmO4m1CDIiEgU8WYhZYqaDtMQqlG0tfCz0rqetzgvdlPeczUFwgo6gCyk8fyXIIJ8M/t31rQ6s5+xT9RaPuG8l/2FPpIcC6WY5NBwGiX0AtFGK5THW0NSt9jSoX+9MQZMIDe30DWqIpxNy4XFAZLHZ1x1OoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qbLN8RgILPf02a+OrgIlXBuOT5Lo6ac1OQeWn+w24Y=;
 b=ElZR/ymjzfSU0KdepqVfgH9r6pBCJMnilfZfPynNZ+O1V+b7+tSfKNQbEC5WffzdecHs55khoE3+2zZSB/rz9TuFxWpeIj6q9CUwhwScosdNZFGTEZ6oD8CepgLPbWCV5dMVMIJMa7vwYvIOogZVZESmmi8dK+yvrWhjLJoKNRQ=
Date: Mon, 22 Nov 2021 12:00:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Community Manager <community.manager@xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16 v2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Message-ID: <YZt4Wtr5uGeBVrZT@Air-de-Roger>
References: <20211122104005.58897-1-roger.pau@citrix.com>
 <7f8fd875-a69b-1821-5abc-a8062a7a6242@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f8fd875-a69b-1821-5abc-a8062a7a6242@suse.com>
X-ClientProxiedBy: MR1P264CA0115.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bca3a12-e159-4d02-0eca-08d9ada7570d
X-MS-TrafficTypeDiagnostic: DM6PR03MB5067:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5067505B89D2EB3F8762B10A8F9F9@DM6PR03MB5067.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 23gf22cha0ILwhI+WS1S0wwS5qzUW8fJqNc5qeY3NqiQMnh03qfDbiOSEFH1o/TDqOtu7f9PTzj7f7cCZBONPtXVbChOzy5E9jvCYwES4P29sgKxk0Dwfjvopvl7MhP8kmuF6WolEKQh1pq8EbdB5RprtaOiUBOmyLxw2wUP25v5zHTinVZpG8UM1rxrnWtm2EqO2u+RDhn29yN8lZHUoevoX5e1+RV+M/cJTQ10Z3nUVdrpruIX1030Arhp2WD38lgPqM2cBpsoDNKmeAP7jIXEx9SXNU47jAStuaK4aSbqyREhwdKls/hplOKJs+nrEqxb8pI2gkhnR0NFZFJzcWzuxnF7cizT8Bed2joGq7QB8LLb7Eatv3jETUdj7b6IACRSjgQ/HGJZRooT+U3nuG/SFsdjeQ8SSnhsrgVfhA8KhGoTeXcJEmn7ErdxGo7JzeEQdZs+WaVbKVXDDB2NGYLT35O5EWvJNvaO1QNO5FNj/EXTtQWsMtFgVKw4zFUwEm8ZIt3pwUj6Zxf/o7iwUt1ymq/zDc5wDUvXh7Scvda4O3SAWDKDPj26Ig5Y5qanFkubRdxKnQ7P1F4oli6gviLhrFL6Plh+Nl69mR7CHlxRwOe3aBW3WyRUEFPkAUEbeAJBDOGeFbJR+uELUkymm5Oufk7fl991JgYnN3qUvBXdCTcJi2us3QOyY5RZ1NDUG/BU6DxdhlZjN84OZCaZL4CigtAhdfrIU0GEdV6SAelxOVq1Vg8d11SdgWkS1mkI2kv2uFefcRytKEf3J9mCXxMScTiiw3n7f5oYU5sWMsTw2RsRD/tqeNQwJlOhu1tZe4HuwwbIYKs3vdBreoqHrbIVH4GfbM6MNA+UPCyK6ZptNBq1xAsmiu4aRcIlPjR4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66476007)(8676002)(86362001)(8936002)(186003)(956004)(82960400001)(53546011)(9686003)(2906002)(54906003)(38100700002)(66556008)(6916009)(33716001)(6666004)(83380400001)(26005)(316002)(85182001)(5660300002)(4326008)(508600001)(66946007)(6496006)(966005)(6486002)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0dhM3FCT3R0Ukc0ZVRNNDFnNk10OTFhR2hyZGN4VFROaVpLeHpEZkxxNUJE?=
 =?utf-8?B?RmtjakFyUWxjbUlCY2QxVVQ4R21mNnFLUzB4ZzNaZ0hia0xqKzBYTTFlOTF3?=
 =?utf-8?B?bGN6RE90Y1F4OTZSN1N4NUVLYnJEMXl0MG5FMSsrdUhVVVVjSzVyWWNIcDRP?=
 =?utf-8?B?Y01VcS9KMk8weitvWm92L1dWM2VkMFpxck1PSHNtTFNHeEpieUFwQWVzMEV1?=
 =?utf-8?B?d0gzbE9QU0tuTFFXZzVEeFQ3SGV0azVHcnVYTTNrMTk4dTkrTmdhc3N3bS8r?=
 =?utf-8?B?QUR2VUludW80aDIzMW01QXMySFAzWThHSk84ZTV2TVFlS0dKWFJwMG9MN0tp?=
 =?utf-8?B?RGppM2xsSXZmK0x6N0JzOHIxZEE2Q3VIL0xSZnNSUm5CMFBUZEFIV0doOXV2?=
 =?utf-8?B?NnFGM1pLL1ViNUNQb3RMSHJMVzQyY1lQNjFRTmM0aUp5YW1wYmRvK2J6bkts?=
 =?utf-8?B?NGR3ZVp5MzE1TUQzdzZNbFJLY2t0OW5CZU9wUUxKRUZxR0JXSFpVYkxCTlY0?=
 =?utf-8?B?QlZwMDhyZ2RNQ3hyelRzdklJN0NrRzlsLzBlQjF3UzBmQTRSMTExanNYdEQ4?=
 =?utf-8?B?dmNuVUh5MVN1ajVoTzZQVVF1K2pFRUZJNDJZNmVhTktQcVhoLy9KVkZaZGdS?=
 =?utf-8?B?YlJiaGN6djF5cUg4ZVdZUDZad29WTldmWERmbmUrWEI5N05BUU9PRTNydWsr?=
 =?utf-8?B?Z29aeFNqM2hUazNmRTRUZFByV0wyNTl1NHVhTHF4S2VCa0s0OHFpOTJhcGlt?=
 =?utf-8?B?N0dvR1VyY3RvdVNtNnRGUkdSem11UGhuZnZTVTBCK2hLM1FkeG1XRDdxa0xu?=
 =?utf-8?B?TUtzSEtEcCtoUksxVkpQc2dIS0lMUzhZYU9XVlQ0ZnB2Q0duRUlWUXI2R2tF?=
 =?utf-8?B?azJCbmtNbVVZV1FQc2hJREI4RitYMlVTYVhSOXNKWjZKb004dVoxTEhqUHdB?=
 =?utf-8?B?YnR3cWFFcm9OV0JQRlUxZFRKTWQrNi95eEZQZkpocy9GcUlvRTNxNmVPVjFK?=
 =?utf-8?B?WVhMNjZJL1lPS3BWb2RzZU5Xb2gwWHc4NlNrT01TTTdON01nNll4eEEvODcv?=
 =?utf-8?B?ZkxvQWUreEM1UUN4eVo3UERNM1ViZWpCUEp1UXowMUtueVM3SUlncmsvZG5i?=
 =?utf-8?B?YjMrMTJCdG5hdGg3TkYxYXg0MEt0UTQ0WWxjSk9QRERuOUdsV0dyWGJoQmlr?=
 =?utf-8?B?U0ZQbTN4eXFOL0V2Q0dkYnVwY1JFZDdvcmtGQUJLU2pxbGNQa3FWb2ZRNWpQ?=
 =?utf-8?B?VUdoVmJJb1dJTFAwb09GRUkyNG16ZkZBWFNwaER0eEtxdXVkNkZIRkJhVk4y?=
 =?utf-8?B?TnUzMmZZMXVwTnh6blJqNmlHZmlUb0NTZG44ZGZnL2JqeEU0TFlXT2VydHF3?=
 =?utf-8?B?YW9tOW5xRjdsM2J3bzdQYWRCdzlYMUYvTmt4cVpCS0JIOVBXc0Q2dW9hb2oz?=
 =?utf-8?B?UGprWWJobVlzalJxWXVXRTZwWUZmNWg3TEdWUkczYmlXdU1MT0p3OEpQeUgw?=
 =?utf-8?B?ZGtIV0hmRHRqeDQ1Z1VjL09GNThtUHdORkFKOUsyWUpOQmUzRHlHNVc5dGNt?=
 =?utf-8?B?SHM0TXVnaU9IamVrc25IL1daOUc5V2RiWmw2VHN3YnNrRkp2eEJsdDd2bmNj?=
 =?utf-8?B?cEhiTHU5cXVoTzcvM0NwaHVmVUdnUTNSdnBTRTUyeUF5YmRuRzlSR3VSQUkv?=
 =?utf-8?B?bitTZHMwTytGanU5WkhIVXJlMkZJNkdkOTY2ZmJTYVd0eDEyeVY2VDV6NWZW?=
 =?utf-8?B?U1ZILzZuUW1KenNzQkVRcWc5dGhiOVVqak0rNGY0VzlDZmRaUU5RMWt6YklP?=
 =?utf-8?B?ZU92RWwxZWtWNnd2elhGNjEvNTJVbVpIZ2d2S1hYZVlqcFBwbDEwTWp1UjNh?=
 =?utf-8?B?MzRmUzBMYWtxaU1NS2xOd2VoUDJkVWVqdm5jK2dPWmk1b3JBVEMwbFRlZHM1?=
 =?utf-8?B?NGtnNklDRk04QitmVUhnREVadFE0Z0dWMUc1YnRpR0JrTy9mTE1aVXlQU0xL?=
 =?utf-8?B?R0gyOGZCNjdQTmJlWW1mWUtWNUZtamN3L3gzRHVIOFhWNCtEcTR3NlpSZC9C?=
 =?utf-8?B?VGlWOE1xUVFkTFUvZmlVQmZ5dnVGcHNzOW05TUdwZ3lmTnRFQUNUQWhGZ3FC?=
 =?utf-8?B?RHNUallpak53V3RrdlpUZzVUbnVhQkRMRWpXMnhyTTNFZ3o2bEZ5akRTTU5K?=
 =?utf-8?Q?Pail2BMEellocs5b90uX3/I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bca3a12-e159-4d02-0eca-08d9ada7570d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 11:00:48.3523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMUC+shsvl9bRq9pjsF1h6jwMAwIccLq3VHPxdMBupRdr3xTTmYm2LMUj/pU86qvKfc1pe1ELEAakqnWXH5cHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5067
X-OriginatorOrg: citrix.com

On Mon, Nov 22, 2021 at 11:51:59AM +0100, Jan Beulich wrote:
> (reducing Cc list)
> 
> On 22.11.2021 11:40, Roger Pau Monne wrote:
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -21,6 +21,32 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >   - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
> >     no longer be built per default. In order to be able to use those, configure needs to
> >     be called with "--enable-qemu-traditional" as parameter.
> > + - Fixes for credit2 scheduler stability in corner case conditions.
> > + - Ongoing improvements in the hypervisor build system.
> > + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> > + - 32bit PV guests only supported in shim mode.
> > + - Improved PVH dom0 debug key handling.
> > + - Fix booting on some Intel systems without a PIT (i8254).
> > + - Do not build qemu-traditional or pvgrub by default.
> > + - Cleanup of the xenstore library interface.
> > + - Fix truncation of return value from xencall2 by introducing a new helper
> > +   that returns a long instead.
> 
> This has been backported, so it's not really new in that sense, I would say.
> I don't necessarily mean to request removal from this list, but some indication
> as to its availability in 4.15.1 may be helpful.
> 
> Then again I realize this also would apply to a few other items; this one is
> just where the aspect first occurred to me.

I'm not sure how we could properly track backports, short of adding a
separate section for each minor version.

> > + - Fix system register accesses on Arm to use the proper 32/64bit access size.
> > + - Various fixes for Arm OP-TEE mediator.
> > +
> > +### Added
> > + - 32bit Arm builds to the gitlab-ci automated tests.
> > + - x86 full system tests to the gitlab-ci automated tests.
> > + - New x86 pagetable APIs.
> 
> May I ask what this is about?

It's related to:

https://lore.kernel.org/xen-devel/cover.1619014052.git.hongyxia@amazon.com/

But I realize I should have added "Switch to domheap for Xen page
tables" instead likely. Some patches in the series had "switch to new
APIs" and that made me write that entry.

Thanks, Roger.

