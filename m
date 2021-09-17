Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFFD40FD17
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 17:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189499.339267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG4w-0007AJ-Rd; Fri, 17 Sep 2021 15:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189499.339267; Fri, 17 Sep 2021 15:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG4w-00075s-KV; Fri, 17 Sep 2021 15:47:06 +0000
Received: by outflank-mailman (input) for mailman id 189499;
 Fri, 17 Sep 2021 15:47:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Eq=OH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mRG4v-0006W6-BF
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 15:47:05 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ddbc655-17ce-11ec-b6db-12813bfff9fa;
 Fri, 17 Sep 2021 15:47:00 +0000 (UTC)
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
X-Inumbo-ID: 7ddbc655-17ce-11ec-b6db-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631893620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1etlgP7mFsflfylfK61PxYqfdVOAtjgUkmrFPWOAfDA=;
  b=B/DH57/Bv7Qn/CdtFSMJ6FZiX6yYcLJR5Ef7TJWw4DZvYCi6ovG5JB48
   faSnNcWHuQTyc6S/iLUynCEMaEDNcY6ej9xy8SNt0ziRN9nDUkgMn0KZa
   HRZbv60mYWfhprsVSf7/jQXNvCfGSSKby+4dNJ1MxPfShh88wvVG0UE0f
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5f+G22Fki+OfZN26Pv7RKruV6RxMPHJj8Zb815KCJHFJKaoMw8qwbyHEi0mucEcrY657uV3RAp
 s/3EWfkSbLEqLBnMiuuqpIexW37AZrgrePdUBalU/HWbWtZ37nrp2hs3BkmzA5ZwwSg3vPh98z
 4ROX338qrJguUkkUs1ojw1WAidVyh5nQ9I2fuoqwH9u1X5Y8LN6GLCyvsPFh5zagX7MSdtgTzH
 FeyJi9b00jyARX9L2Dizy7lMxm/4Q9vOok8D7PgCwclpdEk5Wq7VDRpGngKDHy7JXyoVb1bn/C
 /ZmisBWXuDKzKHXBo8Vh2phl
X-SBRS: 5.1
X-MesageID: 52589406
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pUYhq6nklf5B8/E/WBcZVdTo5gwuIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaDGrTP/ffNGCjKtpyOorg909X7J7dn95jQARrpSowHyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09c32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ml9rp6tZhYSBa3vlNw7eRMfHAhvJZQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpq25AfQa6AD
 yYfQWcsQzTCTBwTAHZJArYktej0j1fvKyIN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJWG8fptjEyW13YkIhQcXlumotG0kke7HdlYL
 iQ89iMwoIAo+UesT927WAe3yFaGoxodVtx4A+A8rgaXxcL84hmbLngJSCZbb94rv9NwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty9vprZw3jxnPZs1+C6PzhdrwcRnvx
 xiaoS54gK8c5fPnzI3iowqB2Wj14MGUEEhlvW07Q15J8CtlVJWneqO50mPbzvp4CqyTCVaor
 WA9zp32AP81MX2dqMCcaLxTR+j5vKfUaGe0bU1HRMZ6pm/0k5K3VcUJumgveh0xWioRUWKxO
 CfuVRVtCIi/1ZdARZR+ZZ64Q+8uxLLpfTgOfqGJNocSCnSdmQnuwc2PWaJy9zu2+KTPuftmU
 Xt+TSpLJSxBYZmLNBLsG48gPUYDn0jSP18/oKwXKDz8itKjiIO9E+9ZYDNikMhgtP7sTPrpH
 yZ3aJLRlkQ3vBzWSSjL648DRW3m3lBiXsueliCjTcbaelAOMDh4U5f5mOp9E6Q4z/U9vrqZp
 RmVBx4HoGcTcFWacG1mnFg4M+ixNXu+xFpmVRER0aGAgSl7Pdn3s/dBKPPav9APrYRe8BK9d
 NFcE+2oCfVTUDXXvTMbaJj2tot5cxq3wwmJOkKYjPIXJMcIq9Xh9oC2cw3x2jMJCybr58Iyr
 6f5jlHQQIYZRhQkB8HTMar9w1S0tHkbueRzQ0qXfYUDJBSyqNBne37rk/s6A8AQMhGflDGU4
 BmbXEUDru7Xro5rrNSQ3fKYr52kGvdVF1ZBGzWJ9q6/MCTXpzLxwYJJXOuSUyraUWf4pPera
 elPlqmuO/wbhlda9YF7Fu8zn6454tLuoZ5czxhlQyqXPwj6VOs4LyDfj8dVt6BLyrtIgieMW
 xqCqotAJLGEGML5C1pNdgArWfuOiKMPkT7I4PVrfEijvH1r/KCKWFl5NgWXjHAPN6N8NY4oz
 LtzuMMS7ADj2BMmPszf03JR/mWIaHcBT78mptcRB4qy0lgnzVRLYJr9DC7q4c7QN4UQYxdye
 jLE1rDfg7l8x1bZdythHHfA6uNRmJAStU0Y11QFPVmIxoLIi/JfMMe9KtjrotC5Fil67t8=
IronPort-HdrOrdr: A9a23:eVanpKD4DMFqoVHlHeg9sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90c67MA/hHP9OkPQs1NKZMjUO11HYSr2KgbGSoQEIXheOjdK1tp
 0QApSWaueAdGSS5PySiGLTc6dCsam6GeKT9J3jJh9WPH9XgspbnmBE42igYyhLrF4sP+tHKH
 PQ3LsLmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZQbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczPgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxeo0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesWMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO61GkeKp
 gtMCjg3ocSTbvDBEqp+lWHgebcEEjbJy32AXTr4aeuon9rdHMQ9TpQ+CVQpAZHyHqRI6M0k9
 gsCZ4Y5o2mePVmG56VNN1xMvdfNVa9NC4kSFjiWWgPNJt3cE4l+KSHqonc2omRCes1Jd0J6c
 38bG8=
X-IronPort-AV: E=Sophos;i="5.85,301,1624334400"; 
   d="scan'208";a="52589406"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAuMLAZWBc1iFweknCy4RbD2zLvawFtieXRQYv1GlvDlki1U+lvTHV91yR+K1PKvZZCn4WYSWyaNa0cDTdWyQqMBYhxqa2e8xMGkMGi7f4Yy3XMHzRL4Z4rLYGfRkvKlMtMsNsVG5o1rn91JkEBcwn1sIfwxFz3A4PnRntME3FClP0CjUmQsYvFU96cHSV9hetYn6yZmTw0w/7NJtB/XD8sN/26MH225ecX2B4tvKP2Qojaww8GkihQSUFgMPjI/8zGViQmo7oW7g8K3auPSDrFYSyXk/8fJSSYM4VVKRgCjl8oSVfz3Ic5rc8hF5zM4HIBd23LvBc1wO1epT8zH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Bu0TMxjWbgiww8scS6K16pgJHFVz6vxT3LdI3IYuik0=;
 b=kUMWcBVpt1t2b4klqTFfwLJ8Pv2kMS7GU13BB314Cm7Gs4Q4HrkMaZAgX7lWOV3EU0vQpIgldAkMJPq1h0kPr8DyVSkAyg5YUEFNrVpWUaJ+rVofqrVtCf29Lzwjg0CA69rhTR7W71pXgl/9Z0PvEzC4ZdTE2TOnV6VK0XHNRJa09KY6W6nDxe/0k6TzvtP+hXEYRG/hhnHDi1UvhcXJoDX1u41DZGkfSBx9hsN9bMnVkto04x3uYlT3lU2FPot3ZyfTAKrWb8iYfmxB3wkc01wSqpBIW+oGKRXxtUHG+oRG/aDrF+X/2IEJrhj7cEvnsi494+1j0rMJi7/jDS5uGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu0TMxjWbgiww8scS6K16pgJHFVz6vxT3LdI3IYuik0=;
 b=MKeAI1VklbvZUZHIGTO50eMJxE8o2GFHE2+tb4/+UJ4EBMgfDsoDPpT3Pi5YdYvsCKPB0XAdCUI1b4SruBTB7OBYvTNfs7Z1kGKvBmzs3Sv4hANJ8QVBrZaKs3U0lIQqvbneG5vZu4u66d0B1RYNLePHZgARnH+9lhgdTBlE4J0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/6] gnttab: allow setting max version per-domain
Date: Fri, 17 Sep 2021 17:46:20 +0200
Message-ID: <20210917154625.89315-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917154625.89315-1-roger.pau@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de553a2c-7165-4c43-b22d-08d979f25907
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4057A414C8E9A6701EDA358E8FDD9@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pI+Geo3HKY3FeSPmOcwH8O5Kbs7Ff39+UtD1jiHhx+OwoARP66WdbJ4mI9dHju3oRn81R36yc0icepko06kimHlQ/4VQlRk5ju56hqTNfp5tFXae3gny9od9tJCwqkb8gvn8F4VRc9zqDjhKGBjibHoBm3awp7GZOPQEoRcuyb9nv9bRq1c4iqtw0M+bb3+Pe00IfVZrO59JR/TJlDF+1N+/ZjLQWFApe05Rd/vpF565mfd4DC3wxae6vt0OItJD2n85D5VmdeIkQFG3Bsn8TWbX5okov+1FDEe2engchjOLABZHL9Xly7hjrn1TFIhzA7Dev10NoQrzLvm9bCTZMzBtAJ16fZd7Ycc/4ICO6zAyWAcQHsKcI42IAzzqR4yDOaP3SS8Lg7xrlqTZB1NIZnFHMspVWnyCC16+rKskz0y3ojNZpYvmeG7QFCezk3jK9dURvbWe4p85gE+XjtovT6Pg4I4WtUS79RHDn52R6g3f1yYR/9Q8u6nTm2H2iYtfy+ecKMhP9O6LS8PyT9GOQiPlgVkc8hOcpCT1v0tt12qifHi0LT/9KlcfXT7tYayw5FeuvsgW4IHnWECwu2cGu+yFjSAKKFAm5Iaz7yFe4g0ICpoMm/YgOoA4yJMqVuRNkw2pAojUCmvylLs/pYGqFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(2616005)(956004)(66946007)(66556008)(66476007)(316002)(6666004)(30864003)(8936002)(8676002)(2906002)(4326008)(186003)(26005)(6916009)(54906003)(6496006)(508600001)(6486002)(38100700002)(36756003)(83380400001)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFFVanIrNGE2aktmSXd5UTlMMXBZQWRIb3M5NmFPcHBBSk9TQkx1ZEUvNXFh?=
 =?utf-8?B?VlRacVorRXI5ODVzejNvZVFxbldFVnpRTXYwQzYvMkNBSEFqbUdQaHBCb2ty?=
 =?utf-8?B?R3g2bWpOWVFHWjNRbDJtalBEdEc5M0pZaWhqWGtiRnluOXhmK0tvM1VteGlC?=
 =?utf-8?B?UnA0d3c5ZUgvTzAzSlROVjBNNm9mWnJJc1d4VFBuTUUwZ1hURGN0NHZCQ3Nu?=
 =?utf-8?B?NGI0WGFwVUZ3a01OeTRHaW94RTd5OEpja2FIcVNGd3c2UjI0UzNsUFVhblRW?=
 =?utf-8?B?UHNySU05SEMwQXE1VUVzaWdVTlh5ZGNmN2twTU12RmdYY2RMZUQwVlVFd281?=
 =?utf-8?B?WlNpaE5Kbnl5VEJnTlNqbGhUNEV0aG14WFZ4YTRvUHgrQ3ljY0h2YnFOUWJX?=
 =?utf-8?B?N1JmSHdmeG04azVwUnpoaW44dnVRVEMvalFNU1ZCWTZYdmpnMDJZYjFzdGZq?=
 =?utf-8?B?ZGdBdDdCVWR2UGsrMDZJMHB6NVZScFB0bkRsdlEyWnlFRmRmU2ZQeVFHY3VO?=
 =?utf-8?B?MUV1TFlQSmpBTTQrQU0rYzg1bnVjWUZvOEd4ZlRyWld1TTFVNXZwRGJUM0E5?=
 =?utf-8?B?UDQyUUxZTlEyYzVNWlVyZFZ6eSszNG1rVm9zSnh2elJCeUtKcnhYa1pVczdY?=
 =?utf-8?B?cUJyc1E3d2pzTmtXZUxMRlBweHp5NmI2S1JRTEdMTXRKUFJUeUcyWjRNWGQw?=
 =?utf-8?B?RlFnMFpZZllUK3lHR3NLSGwrYk1MS21lOGcxbHdVdlpqTGxtZStlTnFna3Rr?=
 =?utf-8?B?SFFrckMwM2k0MExVamNXNTN5ZHdHa1BPVVNiME5PWFdHaHBXNm5ieU5jM2lv?=
 =?utf-8?B?aGdUT05DODZaUEE1Y2gwTnI5M2FabUppYW0zY0hQeVdyNVhuSzYybE95TStZ?=
 =?utf-8?B?RWI1b1lDbHhGVkxMYmN0SmY2UEJ3eDRyT2IvR0dEL1dFRzBLazIrSUdyMTdI?=
 =?utf-8?B?RW5NQXVrZDJYZDRSay9pTnFVWnQxMzlKeld4b21sT0Vubk1oM2RiemlFVmtl?=
 =?utf-8?B?aHdUUmdUV0JmZDlkOGlxQjBpQmxKRitkYks3VXVkU0JSS0lUdkp2NzJUaW9v?=
 =?utf-8?B?VjhjSXV5eTZ6Z2RDbTZneFVUTjhZOTB1Q1hCQjcvNnpiTG9FOXVOcGxzU3cr?=
 =?utf-8?B?YTRBcldkaGxzdGxwOHNpL1FZTEtLR0pFdUNndHpjMlRmRjYxd0RNVmFoN3ZX?=
 =?utf-8?B?SU16UkdtbFZzKzFKZnk3bDhxY2huWWEwRkx3bGEwOEY3ckZJNVlrTEgzY1F0?=
 =?utf-8?B?UWFPc3F6MGdQYi8xQ3daWWZJd2hhVWM5blk5aHQrbHlkeXNqWE9mVGJURGI3?=
 =?utf-8?B?ZmhnYXhTN0xQN3lzaXhrZUZ1dW15Ymt2N2p1eTVwc2YrdGhTWnlKdUxCQjdT?=
 =?utf-8?B?NjROcjgrTGpOTjFtTFdvS29mZlBKK2kvMXhDV3JyRTJ5TEN6VVZZd01odkdG?=
 =?utf-8?B?MzNRcy9JZ25acENxejNVQlFiQ3I3VGNzKzFrM1drQk9XR0JFTHhGSUxualVB?=
 =?utf-8?B?MjBQY1NyL1IzaTEvRWlsTEowd0JJbTVrUUt6UnpsRDhrckR3aUlUbGJCQ25r?=
 =?utf-8?B?RnQ1OGZDM2plWXlkcVc0YkIrb3JCTlFkYkszTEREZkZ5Y0trbmsxL3ZKNE1E?=
 =?utf-8?B?dG1ucko4TXd3aVBmeU1OcjIwVU1MSTVmSWQ2SzZkUi9VUWVRd3RRVXZ5K0lX?=
 =?utf-8?B?Tlo1QUxOQ3dha1Z2UVB4MU5zQXBpZXlxZTFSY0NLcDJVb1QweGlWNmVZVnh5?=
 =?utf-8?Q?WSYdp+lw9Wwo+TxkXcbBTqRKOsKy1ZBB2nIIeRk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de553a2c-7165-4c43-b22d-08d979f25907
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 15:46:43.3742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6NtZZjRXxfc3ualrD4KL6juyTi9ZMvENLUXel/TlD6WNn/+uaXWIdaPLSijWnymNdS1WYs9/526DBpO+0gynw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

Introduce a new domain create field so that toolstack can specify the
maximum grant table version usable by the domain. This is plumbed into
xl and settable by the user as max_grant_version.

Previously this was only settable on a per host basis using the
gnttab command line option.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
NB: the stubdom max grant version is cloned from the domain one. Not
sure whether long term we might want to use different options for the
stubdom and the domain. In any case the attack surface will always be
max(stubdom, domain), so maybe it's just pointless to allow more fine
setting.
---
 docs/man/xl.cfg.5.pod.in             |  6 ++++++
 docs/man/xl.conf.5.pod.in            |  7 +++++++
 tools/helpers/init-xenstore-domain.c |  1 +
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl_create.c      |  1 +
 tools/libs/light/libxl_dm.c          |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  5 ++++-
 tools/xl/xl.c                        |  8 ++++++++
 tools/xl/xl.h                        |  1 +
 tools/xl/xl_parse.c                  |  9 +++++++++
 xen/arch/arm/domain_build.c          |  2 ++
 xen/arch/x86/setup.c                 |  1 +
 xen/common/domain.c                  |  3 ++-
 xen/common/grant_table.c             | 21 +++++++++++++++++++--
 xen/include/public/domctl.h          |  5 +++--
 xen/include/xen/grant_table.h        |  5 +++--
 19 files changed, 78 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 4b1e3028d2..a4bf2caafa 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -580,6 +580,12 @@ to have. This value controls how many pages of foreign domains can be accessed
 via the grant mechanism by this domain. The default value is settable via
 L<xl.conf(5)>.
 
+=item B<max_grant_version=NUMBER>
+
+Specify the maximum grant table version the domain is allowed to use. Current
+supported versions are 1 and 2. The default value is settable via
+L<xl.conf(5)>.
+
 =item B<nomigrate=BOOLEAN>
 
 Disable migration of this domain.  This enables certain other features
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index b48e99131a..0a70698a7c 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -101,6 +101,13 @@ Sets the default value for the C<max_maptrack_frames> domain config value.
 Default: value of Xen command line B<gnttab_max_maptrack_frames>
 parameter (or its default value if unspecified).
 
+=item B<max_grant_version=NUMBER>
+
+Sets the default value for the C<max_grant_version> domain config value.
+
+Default: value of Xen command line B<gnttab> parameter (or its default value if
+unspecified).
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 6836002f0b..dae2b68f27 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -88,6 +88,7 @@ static int build(xc_interface *xch)
          */
         .max_grant_frames = 4,
         .max_maptrack_frames = 128,
+        .max_grant_version = 1,
     };
 
     xs_fd = open("/dev/xen/xenbus_backend", O_RDWR);
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d698..7a35833312 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -502,6 +502,13 @@
  */
 #define LIBXL_HAVE_X86_MSR_RELAXED 1
 
+/*
+ * LIBXL_HAVE_MAX_GRANT_VERSION indicates libxl_domain_build_info has a
+ * max_grant_version field for setting the max grant table version per
+ * domain.
+ */
+#define LIBXL_HAVE_MAX_GRANT_VERSION 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e356b2106d..69b5419416 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -606,6 +606,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .max_grant_version = b_info->max_grant_version,
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
         };
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9d93056b5c..9a8ddbe188 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2320,6 +2320,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     dm_config->b_info.max_grant_frames = guest_config->b_info.max_grant_frames;
     dm_config->b_info.max_maptrack_frames = guest_config->b_info.max_maptrack_frames;
+    dm_config->b_info.max_grant_version = guest_config->b_info.max_grant_version;
 
     dm_config->b_info.u.pv.features = "";
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 3f9fff653a..37789a568c 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -518,6 +518,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("max_grant_frames",    uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     ("max_maptrack_frames", uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
+    ("max_grant_version",   integer, {'init_val': '-1'}),
     
     ("device_model_version", libxl_device_model_version),
     ("device_model_stubdomain", libxl_defbool),
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index a5588c643f..6a8658bfec 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -83,6 +83,7 @@ type domctl_create_config =
 	max_evtchn_port: int;
 	max_grant_frames: int;
 	max_maptrack_frames: int;
+	max_grant_version: int;
 	arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 6e94940a8a..5933d32c70 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -75,6 +75,7 @@ type domctl_create_config = {
   max_evtchn_port: int;
   max_grant_frames: int;
   max_maptrack_frames: int;
+  max_grant_version: int;
   arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index ad953d36bd..aad3c6a726 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -188,7 +188,8 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #define VAL_MAX_EVTCHN_PORT     Field(config, 5)
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
-#define VAL_ARCH                Field(config, 8)
+#define VAL_MAX_GRANT_VERSION   Field(config, 8)
+#define VAL_ARCH                Field(config, 9)
 
 	uint32_t domid = Int_val(wanted_domid);
 	int result;
@@ -198,6 +199,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
+		.max_grant_version = Int_val(VAL_MAX_GRANT_VERSION),
 	};
 
 	domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
@@ -251,6 +253,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 	}
 
 #undef VAL_ARCH
+#undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
 #undef VAL_MAX_EVTCHN_PORT
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 4107d10fd4..0fde879cf4 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -55,6 +55,7 @@ bool progress_use_cr = 0;
 bool timestamps = 0;
 int max_grant_frames = -1;
 int max_maptrack_frames = -1;
+int max_grant_version = -1;
 libxl_domid domid_policy = INVALID_DOMID;
 
 xentoollog_level minmsglevel = minmsglevel_default;
@@ -213,6 +214,13 @@ static void parse_global_config(const char *configfile,
     else if (e != ESRCH)
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (!e)
+        max_grant_version = l;
+    else if (e != ESRCH)
+        exit(1);
+
     libxl_cpu_bitmap_alloc(ctx, &global_vm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_hvm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_pv_affinity_mask, 0);
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7e23f30192..cf12c79a9b 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -282,6 +282,7 @@ extern char *default_colo_proxy_script;
 extern char *blkdev_start;
 extern int max_grant_frames;
 extern int max_maptrack_frames;
+extern int max_grant_version;
 extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 17dddb4cd5..1206d7ea51 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1431,6 +1431,15 @@ void parse_config_data(const char *config_source,
     else
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (e == ESRCH) /* not specified */
+        b_info->max_grant_version = max_grant_version;
+    else if (!e)
+        b_info->max_grant_version = l;
+    else
+        exit(1);
+
     libxl_defbool_set(&b_info->claim_mode, claim_mode);
 
     if (xlu_cfg_get_string (config, "on_poweroff", &buf, 0))
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 206038d1c0..e9a34f2f8d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2484,6 +2484,7 @@ void __init create_domUs(void)
             .max_evtchn_port = -1,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
+            .max_grant_version = -1,
         };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
@@ -2591,6 +2592,7 @@ void __init create_dom0(void)
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
+        .max_grant_version = -1,
     };
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8105dc36bb..af69e20029 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -750,6 +750,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
+        .max_grant_version = -1,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6ee5d033b0..0c85d89419 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -669,7 +669,8 @@ struct domain *domain_create(domid_t domid,
         init_status |= INIT_evtchn;
 
         if ( (err = grant_table_init(d, config->max_grant_frames,
-                                     config->max_maptrack_frames)) != 0 )
+                                     config->max_maptrack_frames,
+                                     config->max_grant_version)) != 0 )
             goto fail;
         init_status |= INIT_gnttab;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index e80f8d044d..d01c6813d1 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -53,6 +53,7 @@ struct grant_table {
     percpu_rwlock_t       lock;
     /* Lock protecting the maptrack limit */
     spinlock_t            maptrack_lock;
+    unsigned int          max_grant_version;
     /*
      * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
      * values are invalid.
@@ -1917,11 +1918,26 @@ active_alloc_failed:
 }
 
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames)
+                     int max_maptrack_frames, int max_grant_version)
 {
     struct grant_table *gt;
     int ret = -ENOMEM;
 
+    if ( max_grant_version < 0 )
+        max_grant_version = opt_gnttab_max_version;
+    if ( !max_grant_version )
+    {
+        dprintk(XENLOG_INFO, "Invalid grant table version 0 requested\n");
+        return -EINVAL;
+    }
+    if ( max_grant_version > opt_gnttab_max_version )
+    {
+        dprintk(XENLOG_INFO,
+                "Requested grant version (%u) greater than supported (%u)\n",
+                max_grant_version, opt_gnttab_max_version);
+        return -EINVAL;
+    }
+
     /* Default to maximum value if no value was specified */
     if ( max_grant_frames < 0 )
         max_grant_frames = opt_max_grant_frames;
@@ -1947,6 +1963,7 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     gt->gt_version = 1;
     gt->max_grant_frames = max_grant_frames;
     gt->max_maptrack_frames = max_maptrack_frames;
+    gt->max_grant_version = max_grant_version;
 
     /* Install the structure early to simplify the error path. */
     gt->domain = d;
@@ -3076,7 +3093,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
         goto out;
 
     res = -ENOSYS;
-    if ( op.version == 2 && opt_gnttab_max_version == 1 )
+    if ( op.version == 2 && gt->max_grant_version == 1 )
         goto out; /* Behave as before set_version was introduced. */
 
     res = 0;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 96696e3842..7f8456c50e 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -87,13 +87,14 @@ struct xen_domctl_createdomain {
     /*
      * Various domain limits, which impact the quantity of resources
      * (global mapping space, xenheap, etc) a guest may consume.  For
-     * max_grant_frames and max_maptrack_frames, < 0 means "use the
-     * default maximum value in the hypervisor".
+     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
+     * means "use the default maximum value in the hypervisor".
      */
     uint32_t max_vcpus;
     uint32_t max_evtchn_port;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
+    int32_t max_grant_version;
 
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 41713e2726..d6da067fc1 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -36,7 +36,7 @@ extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames);
+                     int max_maptrack_frames, int max_grant_version);
 void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
@@ -67,7 +67,8 @@ int gnttab_acquire_resource(
 
 static inline int grant_table_init(struct domain *d,
                                    int max_grant_frames,
-                                   int max_maptrack_frames)
+                                   int max_maptrack_frames,
+                                   int max_grant_version)
 {
     return 0;
 }
-- 
2.33.0


