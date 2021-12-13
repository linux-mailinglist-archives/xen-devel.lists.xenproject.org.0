Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ADA47300E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 16:04:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246165.424578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwmsR-00089L-Hk; Mon, 13 Dec 2021 15:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246165.424578; Mon, 13 Dec 2021 15:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwmsR-00086M-DP; Mon, 13 Dec 2021 15:04:31 +0000
Received: by outflank-mailman (input) for mailman id 246165;
 Mon, 13 Dec 2021 15:04:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0LF=Q6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mwmsP-00086G-Pb
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 15:04:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5b096ab-5c25-11ec-9e60-abaf8a552007;
 Mon, 13 Dec 2021 16:04:26 +0100 (CET)
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
X-Inumbo-ID: f5b096ab-5c25-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639407867;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=leu83rDoSXRjn4EAFrknbpmEB40yjnyBILmRC+G5cus=;
  b=DrgzGSaYuz5qb51OcG6CrOwAzmTShaMpdoRA0pvAzE3pPM6Twx458aBv
   Jy6eGUZcGS3vQn7MnIUYIaFv7RycosC+hYOPFji5QeWmwipFUFNy366pZ
   v2IjxwVasyP37uWhTlWOcHmGkSqRX+qwupS9+mZONEf7wfsJMcQ4QP0Ye
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Zm1YKzaLKr5snSc/mymHoS4frnN7FuOKjLIK4D9KxX7wvJjJfwsWfn5dqAzfwy74zu49nUEczM
 8JUUKtTdCeAVr+LfAXERWoLxlRIdnEGgCx7saF7gWLFNhZPwF58YmQ8T7rRWOLfj3VOJJsVWqo
 vs1ospLvgGPjYAsfQ4DO41caGenRceoHAmwUZzkWgRQdQNMtQXEJRVzSCTT6TXAoatVvC5MTFo
 +ExpuqU7dGTtap37k3mIFCR1GkgOkn2a2ep4Yoxvu/OkVvB9GKeNLWFcqLX0fhcYHsPVS145bd
 Z0Vrd87iezOmBJOrEiwrDItg
X-SBRS: 5.1
X-MesageID: 59835844
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NoWE+q2Wjd7PV/FhUvbD5Y93kn2cJEfYwER7XKvMYLTBsI5bpzNUm
 zQbW2DTbvjZY2L1e95yPovl/U4GucDWz9FnG1FppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn970Es5wrVh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhz/Fpl
 tRE6qCLWA44JLPAuugUf14EOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuI4Ih2pg2pwm8fD2Y
 eUbYDlIfBH8WhxjGUpOLsJ9tumaiSyqG9FfgA3M/vdmi4TJ9yRv17zqPMvQa8a9T8xflUaFp
 UrL5238RBodMbS30iGZ+3ihguvOmyLTW48IErC8sPlwjzW7/GUTFRlQblq9rvmRg1S7HdlYL
 iQ88Cc0sbI78kDtS9DnRgC5u1aNpBtaUN1Ve8U49QWMx6z88wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAXJ2IfYS4PTSMe/sLu5oo0i3rnTdt9Eajzktz8Hxnxx
 SyHqG41gLB7pdYCyqGT7V3BxTW2qfD0ohUdv1uNGDj/t0UgOdDjN9fABUXnAehofKeBEFiI4
 0Q/isGP9v4CL52EuGvRabBYdF223MqtPDrZiF9pOpAu8TWx5nKuFbxtDCFCyFRBaZhdJ2KwC
 KPHkUYIvcIIYiP2BUNiS9vpU5xC8ET2KTjyuhk4hPJqa4M5SgKI9ToGiaW4jzG0yxhEfU3S1
 P6mnSeQ4ZQyVP0PINmeHb51PVoXKscWnzy7eHwD5077uYdynVbMIVv/DHOAb/oi8ISPqxjP/
 tBUOqOikksEAbalPnmKrN5IdDjmyETX4ris9KRqmhOreFI6SAnN9dePqV/eR2CVt/sMzbqZl
 p1MckRZ1ED+lRX6xfaiMRhehEfUdc8n9xoTZHV0VX7xgiRLSdv+tM83KspsFZF6pbML8BKBZ
 6RcEyl2Kq8UEWqvFvV0RcSVkbGOgzz331/TZHT8P2BkF3OiLiSQkuLZksLU3HBmJgK8tNcko
 q3m0QXeQJEZQB9lAtqQY/Wqp25dd1BE8A6rd0eXcNRVZmv2941md374gvMtepleIhTf3DqKk
 Q2RBE5A9+XKpoY09vjPhLyF8Nj1Q7cvQBICEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iquYCnARpFXnGdXqxDbZkLiXU1MVDrPQVlLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtflseRf0/i56+raDQH5+BRjUhXwPNqZxPaMk3
 fwl5Jwc5Tugh0d4Kd2BlC1VqTiBdyRST6U9u5gGK4b3kQ53mEpaaJnRByKqspGCb9JAbhsjL
 jOO3feQgr1dwgzJcmYpFGiL1u1Y3MxctBdPxV4EBlKIhtua2aNngEwPqWw6HlZP0xFK8+NvI
 Ww6ZUR6KJKH8ypsmMUeDXunHBtMBUHB90H8o7fTeLY1k6V8urTxEVAA
IronPort-HdrOrdr: A9a23:UCWcwKvemb4DYAbT52gSvs517skC74Mji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCD8qhoPRPAh2Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX212oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iHnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegy2w
 2LCNUtqFh0dL5nUUtKPpZ0fSKGMB29ffvyChPgHb3GLtBPB5ufke++3F0KjNvaDaDgiqFC36
 j8bA==
X-IronPort-AV: E=Sophos;i="5.88,202,1635220800"; 
   d="scan'208";a="59835844"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOa+jzTdIPidmm/ummHH8SC07leMO0++73hIRd4btnqmf9OEQNfwXxwI/cDQRAcjFFGYR2nfDftVtpRsx6zSofqG92OxbpFPrZvv80Yl01A0sNw984bERJLIF6bPgc6DRoZC1AxknbvOkw3zoVQZ0STp+FDrPDtECybtrSwcolw5zvcVpNpAzJLi8S/j+EhXXtmkAebJUrjVcM73qySTUCJ2DHNbIrXOSkzWxWNUWdQXlsIt1aAAywDmhh9CSX4XWwuBwJ+n9IfiPj4FrzZSy/YihlnWyDNafhYhTdhBQkx83X1fOhBnUqb4IlrZdx2Ew1XoMfu2/ooCX9qU1RPYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmoTZP7pdgDxqssA+7fJec2uWa9cA3TctljcGSNgq4U=;
 b=bda9sAbTOX4ikCcahBNKVzjcF6KaIuBjOjpDEMXzqL+aAzQjHOOM1oeAFJFLI7rGD3LQZVYtH44kRLS4hwFhoGHIVu2RsEJpO3LAeJN+bFKzkKx3Jg3atf3GqegRtos/We+uJs/3uFYsW0mfcgyZCVUMxGrfBx9b/xJisrf8EP0qCnq5pLvB+WUjNVEws13R2VTm3N5mGjjtGqd/+d7wm7pQy4wf7CJyQ44n+paZ8Fpzxcv5MKJTDjPrKEFVKO+oOwHEMnOvS6xQSOlorl24Obiggvby10IerJ+37IMtQXIuo0kzeWNSyy7yrc9RbSmEi4yGQrgT6vloYO0oseAFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmoTZP7pdgDxqssA+7fJec2uWa9cA3TctljcGSNgq4U=;
 b=pe03tE1Ha9nUOB05CBW5KtSsNNABZgN9LXj+NGr2z9G2rNqEX8IEqlX25wf0IDlSkZP9ZIdpLrn3q/fL0nbVIjot1NTX0XF8oqlrFX/h3t5OEL6U0YG4nx+oY1UYQYVF4uVAHS7Ggo274w8Fr/mgsjCGh1uFBO/05HV0V6TiXss=
Date: Mon, 13 Dec 2021 16:04:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
Message-ID: <Ybdg6/J6oUf/5hEH@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
X-ClientProxiedBy: MR1P264CA0046.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b8755a-6464-4907-ef55-08d9be49d574
X-MS-TrafficTypeDiagnostic: DM5PR03MB2715:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB271549A829646C2E9624475F8F749@DM5PR03MB2715.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CjHIo7+4BhgFDME0WIbos0zgfMPXv1aA3Z2gleVuvZ5zNX33Un5KnAFvbWcWcyqjBBmmENjRNxNxeNxQvEaAU1SMc8tGzr7/CE1nDU0f8LiK91poHJwXQ3fHW7yZyD8CGUka8wTpdR6oAwEIlEWSu4BGmBXn3xxTwezRZZE5+GTvqHzf/VLKbmc740ipUHquGWzRRj8u8nIsXESPrqDWAgpjBhhrY8MFLLK4Wa+v+uu4viE3+EJknUm5Ro7Id2Ic3+m3p3PhO6MeJvP8+iDtGNXJGmuTc0GYKHYYLEFPhn/TniQnWMhDrsHL6edLPSZYk5WEpe714WdS19jPU3+a3etAK5qqrIioZ0f8/1iL4sncrsMSOPZEfeLWrNLRRlvpEJoRd1q5iGx6FvekWGgSdtnBP5zSd57PScYpkeeUyco2+1DFKAmQ9OIM/nbLi3cXdKptpjny4esT2Y1vb0UTT85gR4CXNFAsBU9odH2SM2K3zFASFybW33iwxVe9MOU0PSe2S/TsXVS6JDcx4ZLi3E8EL11lJork46oQN9ETzqpxJNMpEczdGgCx1DLppf6JCvEOFmPv9+N1TxAnGVU7myxOyBElpGlSwuf0/TNayNv2jx9dP6XATVGcNJwjMmZZgoSs9ifcnajLtEpRrlnaSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66556008)(5660300002)(2906002)(316002)(83380400001)(66946007)(33716001)(6666004)(66476007)(54906003)(4326008)(38100700002)(82960400001)(85182001)(6512007)(86362001)(6486002)(6916009)(26005)(6506007)(9686003)(8936002)(8676002)(508600001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGY4WkZvTjdsOXp4aW9CdDBLWk5rcXlDeWJPcGxaN2hHZGxJWE8xUHVLcW03?=
 =?utf-8?B?SDRIcmU0RlJqT2dSNkQ2U3RZb2o0SnNTbWN3aERpdTE0RXJobVpnZzRTVGtq?=
 =?utf-8?B?bDdaakN2RW9SOWE3OHF5SklVb0NvUnBpdDVPTTZuMlFVYnYrR0hMVXpzMDYw?=
 =?utf-8?B?d2YyWWpoK3p4Uk9SeHhPSXhrOFBxTDJxYU0ybW9IeGJSNnNLTGpPN3JQbWUv?=
 =?utf-8?B?Z1hLWmxsOXNLTnBUTEovaU5OTW1CRUxOUG1ZT1g3OWt5MENOMVQ2cW1hdExU?=
 =?utf-8?B?eHc0dHFUYXllZzhFU2N2d3pyVEV0aTlma2ZnbFBMT1dLSFdmWVJHOWpPWXNi?=
 =?utf-8?B?dUkzbEtOdVVJYmlRM1JLZFo0UkZhdEhWWm1SR3VNWUV2ckszcDJlQ0hxZkM1?=
 =?utf-8?B?QmRQU2dnUG85NGpGckpCZjVxTzFRZG45YkN0R240cURMZXhrWFJVS1I0MnBu?=
 =?utf-8?B?TkhIVUozd3BzVlJXUjNPR0dyaFpLekpWUU11dHUvdkR1ZGxKMnVyb1JlU0p1?=
 =?utf-8?B?TUk1KzJOS2FDa1YwTE50TUhBSmFWZllXZFJlMXhMM0VYMGJ4WDdGMi9JanZW?=
 =?utf-8?B?dUoyK295bUs0ajA0ZHl6WTF0bWt0MTEzb29IYVg0SkRUUmd3Qmc1eE1nbzZz?=
 =?utf-8?B?RFJRbUE4TEZDSEEvT1V5bllRVXpTSWZBREgxQnVLYTV4bytNaG9jS2dnU2Yy?=
 =?utf-8?B?S0lPRHB3VXlTZkxNMkNCZFM5aTB2Nmk1bjV6VndPN24wclMzdkpHc2lEbkNU?=
 =?utf-8?B?dTRqcGhFSWM1clNrMUJZRmFSVHVtSkxQczhvbEtiVFE4MXBkZkZ6QlBkZXRC?=
 =?utf-8?B?dU1aYmN2S0VuTkVkazY0WjJmeU83M2N3LzJBdGxXckxUZWw2dmVRUkdyeS8y?=
 =?utf-8?B?YlRxbkNucE9tdkY5c3ZRZmpwa0xsK0I3NFE5ZWtHLy9JN0RSc1FNTXArVnJ2?=
 =?utf-8?B?bDRhUzRZRmJzVmtNR3BHanZNQ1FzVU9NS3A2RW52b0lyRk1qSW9BQVFMMHRR?=
 =?utf-8?B?TWlwc3pUcG5GVjJJdnhIR2Y1dkRLb1NvMVJxNXJRcVlKZERrQ2p4dVJnanlL?=
 =?utf-8?B?WEJZMGZDQ3pBeS9tOWFzRER0alVYRWgvR0grSjAwKytnTlhmcGR2My9pb1h2?=
 =?utf-8?B?Mll3Rjd3RVhSV0w3azVROXAvRnZYZ0pzak5OMndoM1dMdXlsNE5TTEl6Witm?=
 =?utf-8?B?UTRoaU13ME9Jc3FVV01nRmRWc3JXN2JDV1c0bUV6dUl1R3MwNHJWcnVJUTRE?=
 =?utf-8?B?eFhHWUhGWDZmRDQ0SG1sR3JKS0E1UGo2UVFYSUdnRDJIQUVHLzBFQmxjODVF?=
 =?utf-8?B?MThZbzkyR2pxZll6Skd0NUtWbkxibUxyZWVnSUFiL0RadFR3Ujl2QXlqZ0Nu?=
 =?utf-8?B?TDlqdGgxdHJ6S3I0ampIR2ZUNTlIRktLbnkrVk16cGFUcXhIWHFsVjJjQWUv?=
 =?utf-8?B?T0FWRlpmaVIyNVBnWWlQL01Mejl1NDBWTU1qZmtFV3Y3NEdEaFhNMjNHdGwv?=
 =?utf-8?B?OCtBak5OSXc1YW9HSHVIbHhmRXpYZGlEYm5UTGNzWHNIa011bEhoRFJ6R3F3?=
 =?utf-8?B?UlM0T1pxUm1HNkRhU0ZWdThQdlFocUs0VzZXRDR5MWIxMU93cnhiSTlsVVdV?=
 =?utf-8?B?OXpaQWZFYWhZQk9XdFJ6OEFRa2p0Q2xQVS9oOTNtYm1TTDUwdGlIakZjN1dG?=
 =?utf-8?B?Ym41UDExYW1OaWJZZDlwR3hXbHVLUFFtY1FqNjBMSkxGZEdkTHJZQy83RzR5?=
 =?utf-8?B?WktVOWFBMjBiY09pL2hKUmQ1R2Ztb081RHlLSVNGZDg1ajVqQzUrWnQwTS96?=
 =?utf-8?B?emRzRldYWXhJd0s3ZHZweEhlM3pBc2JRYURNeVhGSXlHY0RPblN6QnVjUmJZ?=
 =?utf-8?B?Y3NQckFDcW5iZC8rdjdqTWc2RU8xUmJPMmc0eENFMEpwNEpuQU92Uy9iVFNk?=
 =?utf-8?B?WHZIK1o2L0htRXBkT0pjZFcwVkIyc09vSGcybDNPSXlLbThMWDJXd0tHZEdO?=
 =?utf-8?B?MWcyTE9FcDhBWUtEd2pQSUhVR013MU1HdTJ2Q3RGWXVVR0tsK3JlRkdzMEtG?=
 =?utf-8?B?OGp3WC9GOWdDemhFRWJQSk5SSGNsZ0kzWjBMbkppSThoTUhoL2FqUW1qSW15?=
 =?utf-8?B?ejgzZDdCVkVBL2tZaU8wUUtiTHd4QmVpMnlTbXA3M3EvMmhJTFZoN2EvN1Rj?=
 =?utf-8?Q?jfG/BEz6bEv0Ec30tE3Vtn4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b8755a-6464-4907-ef55-08d9be49d574
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:04:17.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mdxa4X8smygYnu8wtTOjuWbd/8ved9bGvfX3B/D0d6HrWq3Tyyu8CHxLJh/XYO1/tOhjz/oc9DTCa/GKqWQSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2715
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:53:59AM +0200, Jan Beulich wrote:
> Having a separate flush-all hook has always been puzzling me some. We
> will want to be able to force a full flush via accumulated flush flags
> from the map/unmap functions. Introduce a respective new flag and fold
> all flush handling to use the single remaining hook.
> 
> Note that because of the respective comments in SMMU and IPMMU-VMSA
> code, I've folded the two prior hook functions into one. For SMMU-v3,
> which lacks a comment towards incapable hardware, I've left both
> functions in place on the assumption that selective and full flushes
> will eventually want separating.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Just one nit I think.

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -731,18 +731,21 @@ static int __must_check iommu_flush_iotl
>                                                  unsigned long page_count,
>                                                  unsigned int flush_flags)
>  {
> -    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> -    ASSERT(flush_flags);
> +    if ( flush_flags & IOMMU_FLUSHF_all )
> +    {
> +        dfn = INVALID_DFN;
> +        page_count = 0;

Don't we expect callers to already pass an invalid dfn and a 0 page
count when doing a full flush?

In the equivalent AMD code you didn't set those for the FLUSHF_all
case.

Thanks, Roger.

