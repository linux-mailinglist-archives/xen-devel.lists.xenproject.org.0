Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B472431F7F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212371.370219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTbS-0000EQ-6U; Mon, 18 Oct 2021 14:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212371.370219; Mon, 18 Oct 2021 14:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTbS-0000CU-2t; Mon, 18 Oct 2021 14:27:02 +0000
Received: by outflank-mailman (input) for mailman id 212371;
 Mon, 18 Oct 2021 14:27:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcTbQ-0000CO-Sn
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:27:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a24517bd-3238-4cb9-9da3-956f62d0fdd2;
 Mon, 18 Oct 2021 14:26:59 +0000 (UTC)
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
X-Inumbo-ID: a24517bd-3238-4cb9-9da3-956f62d0fdd2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634567219;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9coZakRqer3Nmfzd1rZy7qiVb1AIGaejw51CT80OliI=;
  b=emC+YWdNpcJRUENyY1h7vxaLABrwz+Q2BNOUIDTK4UFIH4cyVX2SC0yK
   iI59t1yC5yfV1EGjUoGtA4KfkJyPQPf/HFXvENYxt5ZnpvKEMB9prd0sz
   eUQi5F+8SdICby8FN4e677ZgY0ZfgTVuuUxBSP+F4nx/wcAnq/4iVICRv
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PMr+irBcdrLguanZgSKl0gOt8nXPkQZZ582ymqkgvYAxpdBFEu2VoTGR5DJbwSyE43hU8h3uaI
 Ncnqi05Rx4d1Q9w4gDNKVsbIMEX/KtRZ1vOHN5Q8B8Xci1+A+fBa4l3WL8+QOaGhzJmGRolGzc
 96e4w8SA+JXOKIDGZOx9CxeiysIr2Xiu4b4sBYpLiyTpmy+dSevp/kkdWPNCsSeO3P+B4i+Tnb
 EeqfqHChO80FiRr8zSQbyXTQTIFKne9l3Ylubc7nozGXcA6SYHv+lv+iLUFg6jTJhMZ67JlD8g
 0eTlnJpVjLk8Z2kUhvJsim8K
X-SBRS: 5.1
X-MesageID: 55841004
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gFRPMqzTahyThr4xscR6t+fswSrEfRIJ4+MujC+fZmUNrF6WrkUDz
 2tLUTqEM/+KMzH8KN4jOtzi/UMD65GBnIIwG1M6/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dp2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt90pk
 45qmo6WcCECP5bnk+oMXD5SLy4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIFjGtp3pgSdRrYT
 9soYiRISlfmWRERPn0tGLBvmsOBgnaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQrSbf5TkzSfxpNcY70yqGxLvbxAylCT1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89mzqZ3BERYMWTWpdF1Fduoi8yG0mpkuXFo4LLUKjsjHi9dgcK
 Rixpy8im65bs8cP06iqlbwsq2Px/saXJuLZCwO+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPQ1
 JTjs5PGhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOu20idRo4aJpYI26Bj
 KrvVeV5vs470JyCNvcfXm5MI55ykfiI+SrNB5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3C7GnPXSLrNdOdDjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX2hUr8C2GNSJubq3BR5F6oS5pNCAgJw/wiXMifZyu/OEUcJ5uJesr8+lqzPhVS
 fgZeprfXqQTG2qfozlNP4PgqIFCdQiwgV7cNSSSfzViLYVrQBbE+4G4c1K3pjUOFCe+qeA3v
 6akilHAWZMGSgk7VJTWZfujwkmfp38YnO4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE3PnWoZ2oHu1yGlthM1PatbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7ZfwwlpQCfLYlCsBu8yK3WKx5AS5KhEx7sfsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WbkuFhyFqJbdoNJ8on
 LU6s8kM5g3j0hcnP75qVMyPG7hg+pDYb5gaiw==
IronPort-HdrOrdr: A9a23:lblueaxOirXawdyWkTCOKrPxseskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WBxB8bZYOCCggqVxe5ZnO7fKlHbaknDH6tmpN
 tdmstFeazN5DpB/L7HCWCDer5KqrT3k9HL9JfjJjVWPHpXgslbnnlE422gYzRLrWd9dP0E/M
 323Ls5m9PsQwVbUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZszU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDi1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyUfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW82/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 guMCjl3ocVTbqmVQGdgoE2q+bcGkjbXy32DHTqg/blkAS/xxtCvgwlLM92pAZIyHtycegD2w
 xoWp4Y4I2mdfVmH56VMt1xN/dfOla9Mi4kD1jiVGgPNJt3cE4l+KSHqonc2omRCes1Jd0J6c
 38bG8=
X-IronPort-AV: E=Sophos;i="5.85,382,1624334400"; 
   d="scan'208";a="55841004"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgjXlRjHXzuSSnEbbuHbuxtsTrXQqE5bNeuIDeZbyM9Zbf8UxyV1CIDBMupmUeS0ZYwelvCYAsSxba6adZ4MfBTLcXlLBDo+n9nf9JxdZzitnhzdaCRgxVOi+LJ6lKKzIBkXoGSy1l+qDJsC5NdhPrcw7uhYaPs1CPNBqe7dn6pUIh9O7M5TC0VhrM08qE1BxIJ8dNjughv3VDkK2bUr3c1peI1vIE7raJ5rcKfrdsCyzVexBrh7eEZIKuW++dFHTdpOBE/UjtI+AYrHt2HnX5z/l1MHMDVZTc5lWLrdnhPGPj+7PQNKJROsUIoIHRegZsugeL28+dH2GsrPM3B+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pAVrMRA+vG0xvh/Afkvx5KcAtWtLEotGVlwTALjwpk=;
 b=nUt4eTCff+5lcIAkuB1iVsQtFZYQKVRrsNaRI9nJO4vrrVMK6TtoGq7SBYcJ+A2+qYP596byiCmi9I+P4KyV0QgI6PPW3yXHLU4kV+Hw8qzVwGblGsAwxhoxd0M6zL2sfUpnY5LFZwOFOfIrW8/BGsfTiPk+CSug7b7zqDOOewfDwpeJrck0xLkerPAptM78lpqxYUDJYNASHO6zbAbZUsgz+pis+fJnVXdqxLyY7zomA4YEmOfDSd3sWVMop/7wxAXOsyiZAqDu1P8sfbtDS4CAWuGG26wXcmO4hAm+rCXww6/sYOMNfPYks3S7hRcRc6hqhKdMj86MFaWCqx5J/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pAVrMRA+vG0xvh/Afkvx5KcAtWtLEotGVlwTALjwpk=;
 b=aU9x5pBXSOaP5HgU1PmpdHAFrbVpIk/veN0Km4e2GWfHbXTQzKrZEcg0nrmqf+U1jLaVnpwXJlt0DhK3r39DBDIlsdPVE0HMHD/gJQeB804YHQTfxvfKK9azXBwERfzqWcPB5BSLafwxlmSDaV02TIjWYIx8bLFaeLQKJaLblO0=
Date: Mon, 18 Oct 2021 16:26:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] x86/PV: replace assertions in '0' debug key stack
 dumping
Message-ID: <YW2EJaZ4DoR6ptp1@MacBook-Air-de-Roger.local>
References: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
 <5ab88195-660e-5d73-cc34-67734ae161fa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5ab88195-660e-5d73-cc34-67734ae161fa@suse.com>
X-ClientProxiedBy: LO2P265CA0222.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5565de0-4565-4bdc-256b-08d992435304
X-MS-TrafficTypeDiagnostic: DM5PR03MB2716:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB27169ABE38253761B2A860288FBC9@DM5PR03MB2716.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f4dnpHj+gvQadrZkUd39JykVIfyZDb3fz/jvnYVIxaW/n9UeGYlc977h3Zb3FJP9ve2lZemQqIyDMIy6dk+PVOn9KnhsAoYkQzPhpQdF571+zcmdbBXEwZ7BWUaY84GRIbhMxPXk+lLl5n+6xjrS26G/DYRKXie6e2KF4LeoGKq4OQTv3dN0Xapo7JmqTnZCnXTr5B9roxLUXtZCLiokdAjLw3qxh5t3UteusXM3vXzVj7M6lug7xxlOPy9L4Fq9jCUStTykK2Ov8posw6nXWkQWlXz5oj6rWXnxjpww1bDWBgZTJaEmxXT2bgLbK7J6yUMJaBS/VQLIYjjRbKeKZOjkmiRGCIA1UhjkZo/+SmfIU4v98zFzolT59Xd2zmPo0hnX6zgockS7sQDqTOhoYqtJ9R+omnST0RjTnzF6TRPIuMwa88n9YIWlLosEyAU1khCBgiw9ABZSR4dLU/vrvV50S6OVYrlI4SILhrXmDMOI7bkNGA9jb6icR1emzqLpkkCnjOlpR+8Hw28yNGznTSlatghXpJ/jdPf7glq6pz0NWMawmF3zVbC7Sy39i0I+w+NLGVZ0/pE08YQzylBAFGAmbBJaaBl7mRbwWhlow9LKw4SwrCYEs2K7QMkMnFHcIUpWsbXAghIdjI2P2jFLpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(8676002)(26005)(66946007)(54906003)(8936002)(5660300002)(2906002)(6916009)(186003)(6496006)(85182001)(956004)(6486002)(508600001)(9686003)(6666004)(66476007)(82960400001)(66556008)(4326008)(86362001)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFBEM2hXbStycHdPd0F4UUFlMU90cUdySTEvS2FyWFB1Tm9XbkdTMkF5WWk5?=
 =?utf-8?B?dzJrUEZydG5ZM1NJL2VNUHoxTGd5bXdqRGUwTUZJdFcvYVdwNzdGNC9nTEh0?=
 =?utf-8?B?Z0dNRXE5QUdIMGgyZDhBTEluZFdGYmxNS1NKUXVKaHcyUWhvOURxSGZhVG1v?=
 =?utf-8?B?OVRmODd5QXdJR2hyeFo0T2paeHhXU3g4VHlOaDBYVER2VFQzbCtLWkYvN1h1?=
 =?utf-8?B?L1JMV3lKLzhuMWNtbUJMZzlQUnpYZGd1cE1IOVZ4SGQ0Q1VjeW8wcFkyOXFa?=
 =?utf-8?B?M2l5OXRhQTBtR25TSVFjQk0wbGNjeUNnbDJZZU1DL2sxdjAwSUZGcDlxdVlP?=
 =?utf-8?B?MGlqaXJkNkRQdkZ1NkhBeCtsNEswRmtZd3N1Ykd6ajNpUTVMTkFzUXQ2OTdV?=
 =?utf-8?B?cFZEUjJRVWpFTkdKRjZxUzRGOENBb1d3RnRsN1M0NWZjNlRpbE5iZzYxY3Z2?=
 =?utf-8?B?Z2RPQmo3REdtTDB1QnNiaE82OXFLbTY4NG5ZdUJ1b2dZbFEyQnV2RGhkc0RW?=
 =?utf-8?B?U2Z0SUx1Sjlubm5teGN2T2RZcFh3NXo2OHhMaHZJNkhxazJiRWFjTGp2RWZo?=
 =?utf-8?B?QTF0MmR6TXNja2s3SWZFUjM2RHlwdEwzMHFCakR3c1c4M215MFdBZzB6YkQw?=
 =?utf-8?B?anpqczg1RFJkY09KSkY5Tndocmlvdkw2MDZjYVVwVXIzZFZ1T3d2QS9xYk1k?=
 =?utf-8?B?OU1qUVFtMDdBbFFUZklLWTJ3YmdVdHE2TDMyY0pnZnNvMnU5MVdET1JBdXBo?=
 =?utf-8?B?UlNTWXNmbktjTFFYM3YxbEtQaHFxcG9XV2FzaFNFaEFtQUc1Q2FadEpsTlpr?=
 =?utf-8?B?cHozTEhOQ3FobmVyYVFkQUM4eitqMDRxNnpPYnMvUWFVR1RtQXhFNW5UVVMw?=
 =?utf-8?B?TDk5cWFPbUM0ZGRGRXdFMHV6cVJtR3Q1WmJndjhsT28zQmdEK3Z6dGczRnlJ?=
 =?utf-8?B?REZjS1Y4UHdJSWwwaFpqaGVKSVQrUEpvUm93MmVuTGtnYUozandTQjczM1dV?=
 =?utf-8?B?WGUzM0s0bDM0NmtGN0c0eE5uTVNiUnlwRlRQK2NaYlo5WS95eElhTnp2Zk9B?=
 =?utf-8?B?clV5NnZhWUh3K3FLYkRoUnEzamN1TklMYVhYTStZOWZOR3NIZFlwWGgwNzBJ?=
 =?utf-8?B?TkJVZjZhT1U5cHBHN1ErMjN1bnFGNDlrSW8zMHloVk5pZXNjMEUwVjVMVkRB?=
 =?utf-8?B?SkZRbnZKVlFwZ0tSZHFXWkR0cWFyUmMzR2FHM1NreDVLK2RQWGFzS1VPWUtz?=
 =?utf-8?B?ay9udkRWdzU3NStPc0dqNnBSbTg4MVA2b21CYmxadVVlSkg4dlA3Vk94SXpj?=
 =?utf-8?B?UjhZMG43TC9zZVpyVURLV3hpTWw4djJWZGt6aEZxMHdpV0Zha004bXlIeTY1?=
 =?utf-8?B?QjZmcHhHckM5aFA2L3NUU3BCekE1L3kxRjM5QjZDWmRyS0FrQXRkRmJzN0U1?=
 =?utf-8?B?WHlpcytEM0VZa29hSXJ6VzA3VVhDOTZYYXZJVXV5VENlSlJIUFowT2pTeXJ0?=
 =?utf-8?B?ZjI4cXhuZXBQZS9jMGtCbkpXUkpTQjRLaE9xckkwWkF1TTlYUzBndmFQdVZw?=
 =?utf-8?B?bXA3QVZrMXh5cE1uR0lNVGo1cUNPQjNxYmVSb1ptYUVqYmdZZEVhRVRkMkNk?=
 =?utf-8?B?clU2bWVTVk5UdG1YaitJVFpOTGdVSjNyck5EWFhjeGpVcUJMa1FtWWY5RFFp?=
 =?utf-8?B?ZElHT1FTekFlTEdSSVRGdEhkOEkxR2c5M1RScGZqOE5JUmIrTysxSTYwWkVS?=
 =?utf-8?Q?KXDo1DL/+eTSrL+AXUdtG7SBYwiQ9cNcjK57AQa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5565de0-4565-4bdc-256b-08d992435304
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 14:26:50.5429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztbt/QHp2QMAbBD6aD3nvKEG8yvWRSUKcJsfBj82/fe4PRgsHwhaV+IkF+h4FUvSrEBlWVV3eNy50hR32ogJ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2716
X-OriginatorOrg: citrix.com

On Wed, Sep 29, 2021 at 11:42:54AM +0200, Jan Beulich wrote:
> While it was me to add them, I'm afraid I don't see justification for
> the assertions: A vCPU may very well have got preempted while in user
> mode. Limit compat guest user mode stack dumps to the containing page
> (like is done when using do_page_walk()), and suppress their dumping
> altogether for 64-bit Dom0.

I'm slightly lost by this last sentence...

> Fixes: cc0de53a903c ("x86: improve output resulting from sending '0' over serial")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> An alternative to suppressing the dump for 64-bit would be to make
> do_page_fault() guest-user-mode aware.
> 
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -254,7 +254,6 @@ static void compat_show_guest_stack(stru
>          struct vcpu *vcpu;
>          unsigned long mfn;
>  
> -        ASSERT(guest_kernel_mode(v, regs));
>          mfn = read_cr3() >> PAGE_SHIFT;
>          for_each_vcpu( v->domain, vcpu )
>              if ( pagetable_get_pfn(vcpu->arch.guest_table) == mfn )
> @@ -269,6 +268,8 @@ static void compat_show_guest_stack(stru
>              }
>              mask = PAGE_SIZE;
>          }
> +        else if ( !guest_kernel_mode(v, regs) )
> +            mask = PAGE_SIZE;
>      }
>  
>      for ( i = 0; i < debug_stack_lines * 8; i++ )
> @@ -328,7 +329,12 @@ static void show_guest_stack(struct vcpu
>      {
>          struct vcpu *vcpu;
>  
> -        ASSERT(guest_kernel_mode(v, regs));
> +        if ( !guest_kernel_mode(v, regs) )
> +        {
> +            printk("User mode stack\n");
> +            return;
> +        }

...as you seem to unconditionally prevent the dump regardless of
whether it's dom0 or domU as long as it's not a kernel stack?

I assume when running in PV 64bit mode user-space could be executing a
32bit program and hence Xen could then misprint the stack as a 64bit
one?

Thanks, Roger.

