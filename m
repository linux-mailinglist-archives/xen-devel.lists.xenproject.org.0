Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FF7431FDE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212385.370241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTk9-0002Me-A7; Mon, 18 Oct 2021 14:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212385.370241; Mon, 18 Oct 2021 14:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTk9-0002KK-6x; Mon, 18 Oct 2021 14:36:01 +0000
Received: by outflank-mailman (input) for mailman id 212385;
 Mon, 18 Oct 2021 14:36:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcTk8-0002KE-15
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:36:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 276784e1-de06-4073-9acc-76c6cdf5776e;
 Mon, 18 Oct 2021 14:35:59 +0000 (UTC)
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
X-Inumbo-ID: 276784e1-de06-4073-9acc-76c6cdf5776e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634567759;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FKl2FEncP2by20CzQ2Fx76DUTBjJzEWHP6//3Hkjvd8=;
  b=DBBx0fz7ON4f/F6ARQoJN44JolEQvEo2lyjZKmSqUZbqXgB7jM/Q36XW
   W9QES9PzQtJ6kCu+6DdBFsd3izhImrToy7tqqY3gKYiJ3MLgLo+V/nPLt
   pjo0DhNGGAZlTDwLSaJ9HBg+7bnXzn+zFKSE4b7HEZ5aH6BzXWCeUXTxf
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: A+r86Y1FkF+CwN89RHLvtMRr9Ym8kMCK1TJr+xFqclXuqi2MkObSauBqNHdlR7EppD4FXITwH2
 cJS2dN7MuCo6gfoAW28TlDzhLllQK2L6jEP5vtz6t1gJL4eO7VG77EaQT7q5arzTsyjgz5wW90
 Eg8se1NgGkQ2j5c3ZAd/eymxoVP+bSkSMqTwR+jQJw8GBjFvnEYUcv3EcaU/QmgNsfQGuYI5GA
 TAK+6ft87nr3uq9tgcJuT1Y92DUr5qALUgcfcUZSmNAP5GXZHJ4WeLOHpVVdO22SbiX2lo+N+D
 QlqT58V2dF3+4Vdsl77vOkaz
X-SBRS: 5.1
X-MesageID: 55841867
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ygDCIq7+RqnLjtXMRf8KIwxRtOPAchMFZxGqfqrLsTDasY5as4F+v
 mIbUGHXP/+NZDPxL40kboSx9k1U65HSx9RnT1FprX9mHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrdh294w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 4p0rZzhFz8SG5LiisUsfhIEESAlBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWpg2pkeQ6m2i
 8wxUz03Myacei91GnwSA78exNWul0T+bGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlan4ScEW4sOK9Yf1y+f65v56FqbBzM9G2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZnBLdT5qiTssCFJfuYG68d5bYgfnF447SMaIYsvJ9SYcK
 txghBM1gKkPloY13qG/8EGvb9mE98WREFBdCuk6WAuYAuJFiGyNOtTABbvzt68owGOlor+p5
 ilsdy+2t7hmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8leBs4b5deJWOzM
 Sc/XD+9ArcJbRNGiocsO+qM5zkCl/C8RbwJqNiFBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlPnCIrNJOdA1TRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WZQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:+bn4IKFdUTE012s1pLqFeZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pav854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nI/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Svl
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DPeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Np+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeTf003MwmM29yUkqp+1WGmLeXLzAO91a9MwY/U/WuontrdCsT9Tpe+CQd9k1wva7VBaM0od
 gtn8xT5cVzp/QtHNBA7dE6ML2K41z2MGHx2V2pUCHa/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.85,382,1624334400"; 
   d="scan'208";a="55841867"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfgljEinTwZIhuFI4l/UJnzK1ghwwn1zxwoV2ODVNgsZqIT+mMd3k6Xz2N1uDIGs1BV0Vx2NfYC4NfzSg125/aklxPJWkRgruFpL5WlXppGz6PxCMvGO15MbtnRHb7n2EsbXzHo+9Wp3FC/t8SupMu0uCcY30WX4b8SkDq68ygnpPqCDIYVp+/KVsneIVYP9THBbIOeLyOwMBCgDJolEBkW4xhnttODaY3lBzUXlNQBIvOtEkD4Ax0QQD4PoJWWT0kmqkRuFSSKWljA45WHD47BLN4D5nPKR+hDCfCNoIORvFgu0sYRHsk+KdfqHRNepRMywuysqoIch7NjFUX5OSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4ipIxAZmgfh4+f6trev402Zd5Xdi5moSq+db0QEPK0=;
 b=EZyQLiReIS2kS2ogavoaL5Icz7bpfQ+oq1YALQUF7O/aPNq/WapUJHqsQeMOraailILphxadwmqfEoWB6BDxxH+hbdGdDUcsJ6xN75LjUD0Z5iMsVWUag8qTdPjEHrAJVRs5lbSBn/N2lvcXQ05J9GHcmDI6Y+xT5OpCwo04kM5r91eypUmAmveWHCTjFpeE7s21YLUZwh5uUY5uml0BFWrbHcBMEvYhWcam2aBPd02JMSTVo2Fio3iXejT64dcEzRfeIBQKoCRgNgrWzUsOMfqmor8Vg+TBWOQyDrtRggnNLsGqxmPYxOtKEsD0fBpxCS7LQ9LTt+YCHH20P0k0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4ipIxAZmgfh4+f6trev402Zd5Xdi5moSq+db0QEPK0=;
 b=bk075Jo8ZINwJWJzShWEPwT2VYlH89jxJo0BNeH9QWYTjqa+/UssCVkbacRK/sMXfEBWmTgvk/IQOK0MA9lgl6hlB7tgen8+T91ErsCYo8FPfmTRyZX8026xyaI9JOYjh6bPbNbnRzYeERNXb/u40r7JxmtnA9sUfvTEX0RjmkQ=
Date: Mon, 18 Oct 2021 16:35:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] x86/PV: drop "vcpu" local variable from
 show_guest_stack()
Message-ID: <YW2GOBRJ9hV7O7AW@MacBook-Air-de-Roger.local>
References: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
 <6dad4cfb-708d-027b-0fa1-77bb39319fe6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dad4cfb-708d-027b-0fa1-77bb39319fe6@suse.com>
X-ClientProxiedBy: LO4P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d2ed056-ded4-43b7-5617-08d992448efc
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5525C18B1F3F710B1035846F8FBC9@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CCb18SlmuHbQaxDSSxDf0qJUDoNJHYhbUJTAfFdNsbmBUJ6hjWJ0lHsv8ow9iZc+pBJMi7twc9OkDFjJsVMNHbC2eivjI9Pa4xbyCadDH2/X+LLeuepMYVaHFpHxbFlBHqWAgrn2Fz83LNbFyY9OHCxo0lYlrl+zk0a7j5BpgdTqpibF9k5Lc4k8Gk3ZDV3lHzlW3jln5q+pM+yQpyIvLoo439E9Xdk3WCGhQ8OlwVEWrl0uM0ZgMDdpmNmbKACP9fdbcmRyxuXbrET7g4aJhb3l0cIk59gNaIc+wJ87wYvJGdFu1qwwfzDZNe1dsdKdIjGMH1U9ROW7xTc2CgpCm4/0/2Scm8lvyrK2NQKnUeqa+gdkJcMwOmJs90JMUeUZ/ibfAxgZGl7aw5Eqap/QdCcORa3bSgxp6mrE7ZASlnPvzEHQSu6vVRi+ajCktSL0MQ470+ksZeUFJ3M7HPS4L/9dDpX7+o42FEq+6TZ5n6TwcXH2UkP5ooESM05PB4NuZH3i5BNLv31V7qnJfeMjpyReu5Qutz5vzb6X/HVYtFnCnvTgrAH7Kbb2LHMMXBJ/bqZFkTdsXSV1bqviytavfxuaiUotRTqLZ+bBt5cRh6pAkM7e2/s5goCJQmakz8hvzqPbpPOsMwvealRK3qdsBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(5660300002)(85182001)(66476007)(66556008)(38100700002)(82960400001)(186003)(6486002)(9686003)(956004)(316002)(86362001)(4326008)(26005)(54906003)(2906002)(8936002)(8676002)(66946007)(508600001)(6496006)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3hvQXNCdTlXSFNXc3FnaXgxc1J3YXU3S0FwS2s5bi80eWY5WWZ6VXBrSExs?=
 =?utf-8?B?UUlYeS9HZ2ptWW9sZy9GNFVrSEplMjROM2d6UTdqU0Q1QVJSWEFkR2pManZm?=
 =?utf-8?B?S1NxM2NicVMxUmczdzhpRG9NSXM5THIyejJKR3JBZkxwQWZXSHBOdzZlMkxw?=
 =?utf-8?B?N2NXdUtKRGR2WFljeFo4MHNwKytFTXJab3NxVWFyTUc3K2hkb3RhcXl1OHVv?=
 =?utf-8?B?MGNmNngwdFBKWWw0ckxwMjZReDJhb2tJNGhXcEN3bmt6Qkw5TjVCUGZEMENm?=
 =?utf-8?B?WHUvMDJ2V2ExQXBsdjdVWU9lNzQrMlhuUVpSZjVQS1M5dEFZaVB4RllFdlhP?=
 =?utf-8?B?cWg0c0xhdEMrM1U2Sk03dXRVODRzNVlEODA3VENsZkhxYkgwQVMvRWYzaG5q?=
 =?utf-8?B?b0tpcUV6UXg3d3dkVFNUdmd1THVURWJ3SSs2clF3c1VyanMrNHE3aGpRTTdQ?=
 =?utf-8?B?SjI1T280WVYxS0xNQVQwVXM4M0RyaUFIZXA4aEtXUE56MVZFaDdzcllYODhQ?=
 =?utf-8?B?VnJqSUxWUFN2Q0JpVzlET0xCZTEyRDRIQVdwOG00QTVNWnlGR0N3cHNaL0U0?=
 =?utf-8?B?UXpjamU5VytNYWlpMEFvckxHRXlkSnUyOVhWdDRNdys1d2ZxRjQ1cFRSVXBB?=
 =?utf-8?B?WUNYZkdLNnZJWWRSeUQ5aDNiNXlyNlNEcFhTcGhndmYyU0xhZmgzbVNid3NR?=
 =?utf-8?B?WHJCd3RBdnBMQm9HRk1pblZYVUxEdnB0VkpPdlphVC9VTUxUYlAwbFFYQVF0?=
 =?utf-8?B?ZG95QXBMa0tVMkRaK29qUWErRlZZaUJqMHdzSXlPUW92ODM1RWFwNzBIc1lt?=
 =?utf-8?B?VmgrcXVDallJd2FtWnJUVFl0Wlk2TFhYMmkyK04xNzkzY0MvTnA3bUZSWDlW?=
 =?utf-8?B?dXZnRHpSQjlsb3VIQU5RWU1KR2gyRlhwaWoyQnlheU5Cd2NXSVRkVnBudTRJ?=
 =?utf-8?B?SEVRdUtTejE0Yk85TGNTcmdPTWUxaW9ZbDRJaE5OYjBIdnBuR0t0TjZDSGFi?=
 =?utf-8?B?alZoc0NQeGZKRDZFRHlMa3RvMWRsWk15MVVVTkVSdW9Qd2NlMm1MTG9VdWo3?=
 =?utf-8?B?eFFDc2lyK3pHSzRyZjBwcHJ4M1BOaXpxM2tVMkNzaHpMOGN0bC91K21FVDhD?=
 =?utf-8?B?QU5TR09zL09venZQOHMwbk01cFNDejd1K3ZTV093blBnVlExQ2RPTGZxQVMv?=
 =?utf-8?B?WGk4YlRNOXpHdndlMVF1ODZhRlQzeGY4Tis1ZnJiUG5rZGd5MWx6Rjg3QmFT?=
 =?utf-8?B?SmFwYVBnM2tYdjhyZ1l4amhEQ2JBU2kyOFFNTlZ0RmJ6SGpub3hzdmdCcVpr?=
 =?utf-8?B?MS9oZUFvVjFYV2lXK1Z5TjNGSjhqdExFSjJkTzlYSHQ3eVNONDFob3ljUU5I?=
 =?utf-8?B?NHFMaWFjRXF6ODhDVnhmaWtESS94dUlzZldvdzRHMkdWdHBPcGwrMWVjbWJQ?=
 =?utf-8?B?VlhlNTR1QkRlTUt1NFUyTzhnU0dTVi9mZTQ0ZTU1U01XMVNRKzA1VkUxZ3dr?=
 =?utf-8?B?VUJUbURBSjF1bUpWMWltaTRVSDU2YWIzQzN3OTdHczVGMVUrZjZvaDlqY2Z3?=
 =?utf-8?B?N1pKbkJMT1B3QWhuemh3QlhzZTIyM3hrRzV0NENERGI0L3B0dmlldXc1aW42?=
 =?utf-8?B?WFhxU3JSQ29XRi9IMGVma2NVRFJxa0pySTNER1VPYWdmK0w2dytlOE94SVhq?=
 =?utf-8?B?YUdPSDVKSGh5T1ppaUZLRGtneWpJTUNBMU1ZNUl1SDlCWHJCdW5BVUxORE55?=
 =?utf-8?Q?3inObd9trWzmhzaL5BhkcCKESR9r1xCQhqstJuC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2ed056-ded4-43b7-5617-08d992448efc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 14:35:40.6039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0CxVatsxq4XxykFV2B6qImpOWrHZDTsgXtcUnPo+fR7P9hOx8/VcXCifFw1qdLff06qRDyyEhuIlNfyUQ4LOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Wed, Sep 29, 2021 at 11:43:32AM +0200, Jan Beulich wrote:
> It's not really needed and has been misleading me more than once to try
> and spot its "actual" use(s). It should really have been dropped when
> the 32-bit specific logic was purged from here.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

As it makes the current code clearer. I have one question/concern
below.

> 
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -327,16 +327,13 @@ static void show_guest_stack(struct vcpu
>  
>      if ( v != current )
>      {
> -        struct vcpu *vcpu;
> -
>          if ( !guest_kernel_mode(v, regs) )
>          {
>              printk("User mode stack\n");
>              return;
>          }
>  
> -        vcpu = maddr_get_owner(read_cr3()) == v->domain ? v : NULL;
> -        if ( !vcpu )
> +        if ( maddr_get_owner(read_cr3()) != v->domain )

Wouldn't it be more accurate to check that the current loaded cr3
matches the one used by v?

AFAICT we don't load the cr3 from v, so it's still possible to have
diverging per-vcpu page tables and thus end up dumping wrong data?

Thanks, Roger.

