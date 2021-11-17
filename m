Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAEC454B79
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 17:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226952.392376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnOFt-0003OO-P4; Wed, 17 Nov 2021 16:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226952.392376; Wed, 17 Nov 2021 16:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnOFt-0003Mc-Lb; Wed, 17 Nov 2021 16:57:53 +0000
Received: by outflank-mailman (input) for mailman id 226952;
 Wed, 17 Nov 2021 16:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74+5=QE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnOFs-0003MW-1H
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:57:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dac5677-47c7-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 17:57:49 +0100 (CET)
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
X-Inumbo-ID: 7dac5677-47c7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637168269;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eq/wWhq5bg/oLeMPXks+gumnEIglVeAohywBXKHohpU=;
  b=UlpLHH6+h+envZy0pmuP/zASb4ErwzAJmXMNMQdA3urd7c+CA+/s+Exn
   qpoIESnUQh5XO3zmCmM2Ab5XpoDRDNDJg0lzKiFP9lehjwVsw3bs80KH8
   hwcIIS7Eti3QZB1LNZGuZOrGIyhSAMxE2bNYuEYG4/48In0YKDd7oFL6c
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VbJi2NMkJbfKvKQaikCm7zuoNe6UDwG0kjslPbHaZw/c/yKbQfR29v3+JURMbuy9p0MeoJ9hnN
 rzKjcW/ftBhgNvCkRhgc22nQD12yBCvS3IuanGoOG1JSK2mOueqeS41qhfezLZZXJQ9Pl5yOpc
 OxJ4/3m5ApWefYO29cA3tWZ2UFJ6LrbmTc6cABTYwFM4wQ6ErgA4OoWApMvMLd2ob+zHl8u+ro
 CehMDflWVkLAPO8IpGSWzfaFkZaiOn4qWQRuySfbFlNpsqtLt7wJF05SmXCrRQDft33Juc1ECC
 J/B4ZrVkMrNoOwJAl+NUyTp/
X-SBRS: 5.1
X-MesageID: 58049829
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uQmoUalYrpELyNhXBHPj5tPo5gx2IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOUT2DOPfeZGWhe4t+O4nkoUIHvMfVmNU1G1Bo+ys9RSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29c32YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PgSpKPzbgQVBffjtLk8TDZ2I31DBKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpg3pwfTayPD
 yYfQShFUU/9OkxOA2c4VLwnweiFmijUdwQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfNly7mXIMZFJWj6+VnxlaUwwQ7CQIUfUu2p+GjjUyzUM4ZL
 FYbkgInqKNjqmSwVNLzGRu1vBa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpRYM3i4wRRgARj
 HClwvL2KhJf7ICsRifInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ds0ICscd3k6
 3XT9XVl2e1P5SIe//zjpQivvt66mnTeoufZDC3zV3nt0A52bZXNi2eAuQmCtqYowGp0ozC8U
 Jk4dyq2sLBm4XKlznXlrAAx8FeBva7t3Nr02wAHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSXxMvcnPN7uV557kMAM8OgJsNiONbKihbArKme6ENxGPxbMjwgBbmBy+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbfeFc7Qz94VKeKqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937xs5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:FnDMlKG1GiIIMSwJpLqFDpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcV2/hqAV7GZmjbUQSTXeRfBOfZslnd8mjFh5JgPM
 RbAtlD4b/LfCBHZK/BiWHSebtQo6jkgdCVbKXlvgxQpGlRGt9dBmxCe3+m+yNNNW577c1TLu
 vi2iMLnUvrRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIC/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF5nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSgGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KAoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFoLA
 BXNrCe2B9qSyLZU5iA1VMfheBEH05DUStue3Jy+vB8iFNt7TREJ0hx/r1oop5PzuN7d3B+3Z
 W3Dk1frsA4ciYnV9MPOA4/e7rDNoXse2OFDIvAGyWtKEk4U0i936Ifpo9Fot2XRA==
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="58049829"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+J5Fg8Eqj7NrHkakT0T1naj4qeGpzWk8XQQYCZ5VBllE5v+oPYFyQMVeZJ2XeoNaYpb8nFZVCTnmbxcYHatLnZx4v98GDbNRk7S5q/j41Mn3BEvOAlAloX0wgaYMFyn7tUDDHc1z8Z7IV4ieQ3L1E0QwvTCpJXXmgxqywhK09XljIo++H7iiraAUItdTGYgdhMWHxUz5qUFrVv8foKb+1c2SZgj6Zt19g6nZ3Q4XQGQJx/+qPgzjlKIl5rMb7EfBOPNEHJbSZkyFzkO0YOaZLRYq6hZL0bSGQS3RHRUDqI96lC3IRrwpXx6QVV3PwK9q/pCzTVUsfvJDE7cKGlwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLMuqhF5StVAg6CgYgwcWpx3AKbJN+4UVewL1yzV2y0=;
 b=F2g6vBx/ScJm4nuQFzfLip5Tmk9o+JHYHE54WlwfhBbVIWOebcLxuxzZkPcpDeYm5EJ2Oqc2xvd22dR/Souahb5g1E1PobGRCKR6Vis6HuwMqa+uiFRlIWsXLv5iXcp6X4usE8S8I4p516us09BDWe8ArBmEU/pdGS7DGIALNlSITJNYGMWVw221/PtTgAM6CtS4butcDHPBB/Dzarf+yyyxEDh09X+gd1lDCwIwS6NYIaYTpWGS0vrb/eypL1NJzko4MLmT7myb5kQgCAy8YZdk/UxotulNPJT/enkmcu7X2nPQ+Tk92GGGN5F4IVhj3Hj5+lFAlO8xm+rixcyYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLMuqhF5StVAg6CgYgwcWpx3AKbJN+4UVewL1yzV2y0=;
 b=A4avnLQkylO5AV3f7gCPp3MrILzqPiREXt51jckZcDX0JCBei4TcOdmhjg0BAcI2gL1XFtZu1qGhK1piOMtSNUTqcmT12dg7hMWHel7B2XFBZ6HDhHvkRrOICKLNsuT0u3pNmwssw7FJc6x1ZPKyCB4gPo47emVhE+qlVLXKKIc=
Date: Wed, 17 Nov 2021 17:57:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Andrew Cooper <amc96@srcf.net>, <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH for-4.16] efi: fix alignment of function parameters in
 compat mode [and 1 more messages]
Message-ID: <YZU0fIm7pLAc/z7n@Air-de-Roger>
References: <20211117153350.19823-1-roger.pau@citrix.com>
 <1927a35e-9902-bee8-f7f2-ab8463043d8e@srcf.net>
 <24981.10327.56927.848136@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24981.10327.56927.848136@mariner.uk.xensource.com>
X-ClientProxiedBy: PR0P264CA0223.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff52465e-b24c-4c86-57d7-08d9a9eb5c16
X-MS-TrafficTypeDiagnostic: DM6PR03MB4058:
X-Microsoft-Antispam-PRVS: <DM6PR03MB405818072DDAC90DA2C7ED4E8F9A9@DM6PR03MB4058.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8N+ZKxR/zV12ZZFyHVzc07oKDCHyGdebujtAhWJdLDoFoyCk3h/w8atPspdl+qtxVr4V6dKkIj2utTO4K4s+pmPAVNtR198Q/TWEEGL+l4uRXrO712a1t680YZ9VrOxz8ioSjiXIU2a3KgyOfs7VsRlDlXyrOGReyjKbkicIatz34EDzjiumKtgTPyETfXKSAu7kAuNdxt94+4un60Ec90VbrLTae+BI892q5s+NYhUeJm5Jud4iv9cirq85ma3hWtywqGOw3Zo9Wwy5Tat2DkvGzwECOAQB80idZgOaDTagrD3/BiiSgD0i410gkYM48571WAcQ5ilfHOqoddn5Ze+gAY5KJ1DzQlUsYeHxJeLf6Re7Z8UYZvuWlXODRXeUGOiU/u5ts79dME4fGVyJRjrwz2ZApJM2yEtvG8eLDx+NYqY6twO0ADwhNGyUGzEZauDvxlIytPMIJoZqINz2RUk3tuHQjhpqMe2gGr4xvi+Qbv+whwoT6m+pqWUJ/esZ8vfvbmOYr6UmSeweJ6CPRMsoJq8D6zQFICfs+Fs2Hg463neebk9Mnu4lbAQVPNNfuln2CayTcUHiux1ZQfsqxxv1oOgxkqBQ9lbiphc6wasWG3Lf8qZwLucDFMdjzQoMTmaWtM9KjWedzyPe3Owhgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(4744005)(26005)(85182001)(54906003)(956004)(6916009)(82960400001)(2906002)(5660300002)(86362001)(8936002)(6666004)(4326008)(6496006)(316002)(508600001)(38100700002)(8676002)(9686003)(66556008)(66476007)(186003)(6486002)(33716001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkNzaFRBcEd3ZUtnZkxOblpjNXhlVzBPZUUwd0xjRUdYOU9DRUNMMTl1Sm9G?=
 =?utf-8?B?RW00VWc2ckh1K1p6M1l4Q1dBeTUwdFpIMG9EQSt2ZWlpTjhwVEhqOHdtOTc0?=
 =?utf-8?B?aW1vTmozU1ZIcHYvMm51WDNqUVY4aTQ1a1p2L2ZsRHB3MXRadi8zMFQvQm03?=
 =?utf-8?B?cWwyODM0bktLaWNJdzBkUnFhaExQMEh6R0g0eDRoRVFOeFNhRUNMTnJrbkpW?=
 =?utf-8?B?ekVOdDhVcTZxbXpPNjI4c21yT3FWaDBBNi9vNHBuUVI3dnNiWldBUlpkMU8w?=
 =?utf-8?B?VzdhS21UUlBNOTJnTmcwWkF4OHBoT1R6SUdweWluUFNNT2tRY0NxS0c1SStJ?=
 =?utf-8?B?bzVDRlRFUjRZUFdzUEszc0pkYnFieVBpS2tFRkdiMmJpYWRzTUVobHZvVGsz?=
 =?utf-8?B?OGRWKzRKWU1UUHJVY2RjWjZQR092T1lWaUdsZk8wWnpka3pVRHZiYWlpc3JN?=
 =?utf-8?B?TWFTblhmVU5WZndXUk1vUnlzQzgyV2FRakR6VE1HMG1renh2RDlWN01OQzY2?=
 =?utf-8?B?SUhhaENtR2dDTmFMUWI1OTcvRGhZVlczcmZ5TCtKbTYyOEg3L3J0dFA4bFF0?=
 =?utf-8?B?R3hQa1dSd2NSc0h0MGM0ZjlQMWVZbXNzOE85RjRWZ09iVGtHMzFZcEplMStS?=
 =?utf-8?B?SDdLVytZVStIR3FKaC9LQTJoQkUrdGhhVWtUOWc4bmZ3S2c1ZU8yZEtuTUlZ?=
 =?utf-8?B?aVpjNVU4ZGlKZHJ3V2dyOWxNem1PL1daOWZCZ1hyMytwVXhXMCsrMGpuZnE5?=
 =?utf-8?B?WUdubWRmMTZxTGVJbXZMWkRRVldTUGtOcjYvRXgyYjRyeUQyaDh2T1pKeTJB?=
 =?utf-8?B?eHZ4cmgxd0pVclBnRldhRjVzZGdWZjFOQVBWMyszVDM4dGFIYm5vVVZEVWRp?=
 =?utf-8?B?MEJSUHU4WmR0Y1VlVWlxWkZxR1YrK0VuanNjUUhuQjhiK0xGVlRQTUVaOXBH?=
 =?utf-8?B?SDVNSncrWHYyL1dUNmlXMjZUN2NTdDJ1ci9pRDU2aXoweHFVMHEvN2gvS3Qw?=
 =?utf-8?B?d3JUZi9uSUNLc3hMdlhLbXhuanRPU2RORDFjL3lEd1BubW5yMVIrbE50Q0x3?=
 =?utf-8?B?VHh5ZmwvZVV0b25GNzFreWdhbzRNNG1TTTNHamN6YVVpanhvQ1pVRGMrN2hr?=
 =?utf-8?B?WURIaFRnMW9CRTNoZS9vSXBRemRLdytDVWZldDdXYS9lalk0VDJIZnFuMVlX?=
 =?utf-8?B?SFhhZk1rcnp6d294aUFmQlBHVCs3bjJLbEh4YUJHYzlvQkpLUU1HbUZLZit0?=
 =?utf-8?B?emliV210YkFzbkRKcWgvQjNDdThSckl2SmpFeEo4YkV3ZXQrR1diRmVSb2Np?=
 =?utf-8?B?SDYrRzFHUHEwVXlXMU1xcHE1NFFmZEExV2d4K0xoYVVlQkowbFpqa2pmc3Nt?=
 =?utf-8?B?N0laNzcwSTZpU293RklSYlROWG1IK3pCNXY2TnpnMzRZcm9XZzAvRmZsTG5K?=
 =?utf-8?B?K0N0Y1pLTEhQWCtMYWIyODl3QXJNbUZ5ZVEwdGtsdjJVSTR6blg5TXV3ZCs3?=
 =?utf-8?B?NElOZXNpTlQ5ZVV6QjNwNnhZYkdRcU1BeGJMb1REaHl2Wk9Wd0lZVlZ1L3F0?=
 =?utf-8?B?VzA2aXNFTUNQNDhZS2ZzdXhQSDQzd1dOazF5Q2RobmV0QmxLYlZTbWo3c2di?=
 =?utf-8?B?SzZOSjJvMUVWVEY5b2lMYmpiMm9oeVkrVEhJL3h0Vy9XYi9KbVEvVGp1dEdQ?=
 =?utf-8?B?aUlQWHVHN3JJR1dGenBkNTV6em13NmVTRTY2YXRPNlV0SlhmYmhhVVdBOFFu?=
 =?utf-8?B?Mk5PYXF6R3dsUkZaZDR3RlJwM25sc2tlcmdoTFR6Nmhqcjd3dTJjUEZyVmhp?=
 =?utf-8?B?QTMwUDBVcXNOUWx6WHkwRFV5N0d6Z3ozWXlJOGQ2bEh6UExEZlQwRGJqbW5s?=
 =?utf-8?B?YUpQbU9jTUgxQ3pQTlFnV3U5WmVabFRRTndKTWViWEJxRzRyQ2J2c2xRNDFR?=
 =?utf-8?B?eFo3TFloWkpZQVYxNFRHM1BOYmZmZHNuZTVOODZOZjJMUjh1NW5TbEI3SEsx?=
 =?utf-8?B?OUFkYUdBYmxJTFV4RWVKOXhqRWZWYlhvc3VrbXF6UDMyd1RidFZKNkQvMldZ?=
 =?utf-8?B?d0xIejc1UWs4aitpU3BZc1lrTDNjdS9CYnBhYmRtTjVXeTFNc2VVMDR5SW1x?=
 =?utf-8?B?QVJrdjlacCtNYVZMM3lpSGhFNE9wR1NqNDVwOER0MEFrb3h3YVk3UG84cjR2?=
 =?utf-8?Q?ZFLcGVqpt+HDwb3zloKAScg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff52465e-b24c-4c86-57d7-08d9a9eb5c16
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 16:57:37.7789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZsRnI4weZfvhkZnJb4GO2fPKtoPu5rV92gJlPHxu4UC6I94atFg9TrXO5tsTO9xTHcwWH1fbGevBis/bucctA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4058
X-OriginatorOrg: citrix.com

On Wed, Nov 17, 2021 at 04:05:43PM +0000, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH for-4.16] efi: fix alignment of function parameters in compat mode"):
> > This will compile, but the caller won't get any data back unless you 
> > copy the opposite way here...
> 
> Well spotted.  I feel quite the fool!

Indeed. Will send a fixed version tomorrow. Would you like me to keep
the release ack Ian?

Thanks, Roger.

