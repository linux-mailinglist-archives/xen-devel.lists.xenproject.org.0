Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BAA63645A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 16:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447633.704088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrwb-0000L5-2l; Wed, 23 Nov 2022 15:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447633.704088; Wed, 23 Nov 2022 15:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrwa-0000IA-Ve; Wed, 23 Nov 2022 15:45:48 +0000
Received: by outflank-mailman (input) for mailman id 447633;
 Wed, 23 Nov 2022 15:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nECt=3X=citrix.com=prvs=319181206=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oxrwZ-0008Tc-2G
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 15:45:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3846b7b-6b45-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 16:45:45 +0100 (CET)
Received: from mail-mw2nam04lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Nov 2022 10:45:41 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB6935.namprd03.prod.outlook.com (2603:10b6:8:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 15:45:39 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 15:45:39 +0000
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
X-Inumbo-ID: e3846b7b-6b45-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669218344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=IvQbbGWxta8BOU6NuWUtOzHVaS0IfJ/5pqW/Sjjha+0=;
  b=ZT9Z2ehWaxW/+tnNR+EqLjE2wgqJa7bHpvKDYbpUDgWHmmQGwBruOJh7
   MT+6ox1ad0Q/JSxzpsS4hxynOor/srNzQyGpH5X/JATjGZaZ+gYlyHc/C
   ExeePRAXwDNwPRp+QpH0cBCAPQAdCGq/GinOHMeId9bNhRYr/k+rdvEoH
   I=;
X-IronPort-RemoteIP: 104.47.73.177
X-IronPort-MID: 85425892
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:H92EDa1erck4eEgpcfbD5T1wkn2cJEfYwER7XKvMYLTBsI5bp2MEz
 TYdWz+BO6vYN2fwetl+YY23/BkHu8PTzdE1HgFopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVkPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLE1lx
 8A9Bi82NDO4wM/r6rKiTsNwiZF2RCXrFNt3VnBI6xj8VapjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6Kk1MZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r827OVwHOqAur+EpWhr98xvBqX5lVLVh09DnS4rdKliVOHDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsSzdbbdU8ucweRDo01
 0SIldfkGTxutrKOTXuXsLyTqFuaOyIYMGsDbi8sVhYe7p/op4Rbpg3LZsZuFuiylNKdMTPtx
 zGHqgAuirNVitQEv42g5kzOiT+oopnPTyY26x/RU2bj6Rl2DLNJfKSt4FnfqPNfdoCQSwHdu
 GBewpfBqucTEZuKiSqBBv0XG62k7OqENzuahkNzG54m9HKm/HvLkZ1s3QyS7XxBaq4sEQIFq
 meJ0e+NzPe/5EeXUJI=
IronPort-HdrOrdr: A9a23:dpotOKsyZ4rq5Wszh1m+HKvF7skCFoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPMs1NaZLXLbUQ6TQL2KgrGSpwEIdxefygcZ79
 YYT0EcMqyOMbEFt7ec3ODQKb9Jrri6GeKT9J/jJh9WPH1XgspbnmJE42igYy5LrF4sP+tFKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD/nTLdny3blBo+4X7rzlGVxVPlvMzCXTo/T+5Mn5hQfBf141cp+IgU6t
 MC40up875sST/QliX04NbFEzlsi0qPuHIn1coelWZWX4cyYKJY6aYf4ERWOpEdGz+S0vFvLM
 BeSOXnoNpGe1KTaH7U+kFp3dyXR3w2WiyLR0AT0/blpgR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZOfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIWiYcLQTOvNSSy5uwJzviUK1/NHwgFi/suq6SRg4eMBYYCaka4ORUTe8jJmYRsPiSUYY
 f2BHtsOY6SEYLfI/c24+TAYegiFZBnarxyhj8aYSP7niuZEPycisXrNNDuGZHKLREIHkvCP1
 prZkmBGCwH1DHnZkPF
X-IronPort-AV: E=Sophos;i="5.96,187,1665460800"; 
   d="scan'208";a="85425892"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJNNP/A1EP399rVzYLncv4RFnxE5LnSEYxAokaCTDBcy6AhGDZeJSThiX9gZEnJh/G55wqsdfnAszO46o+s0qWaCbYlYutPa8PpJpPNZLOxMxpVF11I4qDWf/lVDdB9xY6NZPsOBG+Mx/UnVibihZhR1nkgxAW+VfQHnrSa3VdNHU80CTfI4/nKLC8qonoww2yLaZbrPZ+b7nYH8cLbzRWQMPhiZ8gfiRrMEDJ0R7Ku4UqlPEi0wKrRNwD2LREkMkXV+ZmRdA7nMc1Q4e5OfZR4bojHasMMEqPiDwtPjoYgVDC7Zp5BNlLGO1PRU4IFo4uGuIh9uWKS992G6JPGT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijoTp2u9ZjfF4M3JsrM4RqHyGjKHHh5FQnpmKT5pXL8=;
 b=WVRIw6Bwn9wABibvjF5Bt1sF9UyvmyoN4s/n+G81aocW9xuKHA4IIwm1kX1qmy7ldX3efpBPkfhcSZbeN5PJNx8v3UdyBQ/8ElrsHDhvwHD83qKvn6qCB3hHpzPHgdzt3JS3Vwk9w516zFhilaVrtc7Ummbr9SfQdHANfOz0SG/TK6DWeDIDiHSDzCwpyMoA0KhMSz9T2nJvsM8vyVEirbGT+XtujJV0CK+0MjjPap5a2UYRzyGeQSk5WyNI1RMESFH/5GjiYsgn5cz6W0h8LLOfUOr+2QjKzABpHJ0K/CuVNrimx7I84TAcUfc7rEd3RNdVa9zDvoGbeyjmYLqIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijoTp2u9ZjfF4M3JsrM4RqHyGjKHHh5FQnpmKT5pXL8=;
 b=jRxKeSP3Gl+fmWAwE4+FF3vbTY6zG9fDjDC63OXgbAdmMxPopD5jaCNDbeD12NttSrdvtvFSOp2L20tXGM30UhqUrmmUUn6KsXIjfChsJ3+fut7ZN2inTUfpzsxLYHQtgT9hvQZnBEKRr38meqcHhrk6NPGa1PVkDo0zzdLdbzg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/5] x86/platform: introduce hypercall to get initial video console settings
Date: Wed, 23 Nov 2022 16:45:20 +0100
Message-Id: <20221123154525.63068-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123154525.63068-1-roger.pau@citrix.com>
References: <20221123154525.63068-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0534.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6fcbc1-6e5d-4547-8d5e-08dacd69c52c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EYHDaoyi020U3R0Vs3XR2TVA7oK3rE2HaB7ZdMmIEbV4D93tVl/nZU69nKdrOd/BVtWyFqlNOQvBfPhNsaj2DZUyh5BTDDUa0NWF8uMpxWtAemDfJWyDteAHphW8/QNaBHDoo/zTI3TUt3MLoDCLy45D4p/cg7grmqD7GQG4PAJ1kasAXX5gy2AERcaz8WwS+xgMUyw1EtjR+mnAnLWmU/7bs+Gd7Ucvds0zh9Zqm63q3LCeaDd0aDiUPJmLea2JlrCChrTtMoH+qFeIpjaUZ59CwjeCesXd1WCQewVccr36bQrHvIpv8KA2RZXcLW2to7sBKMn8u6/oTfkCZV/YmT0kviQ2+BfLrILJcNanuniMwPr8dlPCbjn/E2kYJTPfwK3HLuU+/kPnUZwnynarDn5Stc4wdjmubqoaZrKMSs6CA4GOG3TnimlV5KmhYeuLB/TrIp/rkqxmYuB/l0+2WpfxaGfpRV3MSNGvl4A04ALa5VZAYxXIwpAo197BIzhw7S7qti9dV9oWSyWnslzlLXlfVh0hBLJEJvRmMhX5+NxY7rl12lEMTkTPKdVPqkTuGDchZ8G7lyrpU1ucNMXSMxNROTgau2DMuuo2nnFHPHWnMDhSFfOTKMqWh6BJF87uq5pP2q66RMrCmUqko7Cy7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(36756003)(86362001)(41300700001)(66556008)(66946007)(316002)(66476007)(4326008)(8676002)(82960400001)(38100700002)(6486002)(83380400001)(54906003)(6916009)(478600001)(186003)(2906002)(5660300002)(8936002)(6506007)(2616005)(1076003)(26005)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGFjWDdDa1NPcW5LYlJDUWowMG5VZExQcVFKMkQzQzFJZm4xM0NpbzFHK1Rt?=
 =?utf-8?B?dEd2NWQ5M2lNM0k0SUFTbXRFSm1oRjBHaUxTb0cycTNpSUZVZFlScFloZmhv?=
 =?utf-8?B?UFB6S3IwcWgzbDIwSVpvQTJ0WnRTVmJxYVZBV1dyU0lZVFB0OVBRNWdBMTcy?=
 =?utf-8?B?SVJFTjdjNGZScGVudHJSSU5MWXc1cEdXdzh6Qk53QTV4WXZOQlpISmk2b0ll?=
 =?utf-8?B?Y2dTSXBrY2tpVklvajhESUc1cVhLbEVSMGV2YlFTaTVJR2NpcVZ4Z2NKQ2Yv?=
 =?utf-8?B?YzZleWd1bVlQOHhhbjUwZkpFa3gwYUFDZWlqQjhCNWRGZnYvMUZzUDQzRE95?=
 =?utf-8?B?Q1ZTUUd6QUtBT1B2Z3hIaE45eTFIQnNwM2gwbVZxLzNaYXJPNldIYTgyajhP?=
 =?utf-8?B?VExIRHpDUDRiam1uamc4YnAzRkMxcWcxNHlnL2sxb3VldmdqREMyckQ1d0V2?=
 =?utf-8?B?cnMzb2NXMGE0b1d6ZUxxclhHNTdBMmQrcXkvT29tbExzbVFxeTRyYVQyN2NP?=
 =?utf-8?B?dWF2MDdvQUZDOFNNUEk4UmxrVjVpTUhoV3JJeGY3anNUVXJacHQ1aXZ5SU41?=
 =?utf-8?B?cWVDRXZGU2kvMTIvbWFwU01uWnVCV2dFT2I4SThWOWNnaUU4NmNvcEIwbWNx?=
 =?utf-8?B?a3QrWWRpQTBjaHRQZGMrWnhzTnJYSjRENFFHdjJEeFJuRTN2QkpRUWhtQ0g0?=
 =?utf-8?B?OENLZnJqbE9hL2hFQk1nMXg5OE5Qb1dleTZRNHNad1hEYk9rd0s2QUtya2U3?=
 =?utf-8?B?L0pUbklCdnBtOVh2Y040TlNsbmRRcUtKaGdQdElUWFM5WHAzWmlmZTV4YUtl?=
 =?utf-8?B?K2gvSXkzQU9rRDNMNitDZzQ2LzU1OTRNQzFXS2xoVkllY0xXbDB6UGpkcCsy?=
 =?utf-8?B?YmpLd2ZkUkplRnRUNUZneXA0VlcvcjNhU2VvbE11QnBTNVprbHppdktyOTZX?=
 =?utf-8?B?c1U2UlcwZjFFUmF4ODZacHRZWjdJS0EyTklKL3hXbUIzTldiL3FwOS9XMURp?=
 =?utf-8?B?dEt3bjB2VjAzSUhyNFdiOFVQeEVXRGd1WUx6eXZXOGZickd6ZTFmZzh0UU8w?=
 =?utf-8?B?Y1FCYXVwWGxZdk9jSHU4MWE4bE5OVmRDTE1NejZyYjZSalh2cmtBWUQvLy9o?=
 =?utf-8?B?NTIwaUJTZFRsd1g2ZStPalBwL3FvUERmRHlJQWQ0ZkhHK0xWMHdIZjNtS2Vz?=
 =?utf-8?B?cVpMc0ZYOTh4WEdiRzJvaGF0c0w3YzdSOWFvUWdjdGxGTzNXYytFTFY1RkE3?=
 =?utf-8?B?S0RYRTFObDQ4UVV5OWphVDFLK3VEcWZ4bmtYQi8zTXB5WnNuSmQ1Q0RyaHpH?=
 =?utf-8?B?OUdsTm1pSEtDNjhwVjEyUXN1MzB5WXYrR3pKVktGdUZ3YjBtS1lZNWJzVGpE?=
 =?utf-8?B?L2Y4WnlVaE1TazNJZW9NQU9LTHkxMW11SFJaYkNsRDFqL2VhTm5aVmNNMFd0?=
 =?utf-8?B?SFZSdklIWGhadWxOV1BRZHZOZythdnFxd0hWZTdEc0dyMC80azg0Q2t3MUlR?=
 =?utf-8?B?VWk5QTc5YXFwcXpsN1UwRG54UngxYkpYWG81Q1U0SjRWV1NNd3VzREYwOWNa?=
 =?utf-8?B?d29EbHdDR0tKcjFuNGVEeGNXcExuNC9ObEpzSWVUTmZFWVJDQmZMQm1aY3N0?=
 =?utf-8?B?bFB2SG1zdlNNNDZ3QlM5MUVJd3R0R1BCcEZBQ24wMmU5QnRiUDhCaVhWTnFV?=
 =?utf-8?B?Wm92bEI2NUxucmtjd29BbXB1ZjBhZHpjdW1oTlpiY0FSTW11cFdxVjExeFcz?=
 =?utf-8?B?TkNhVkZHTTdVb3Zab21JYVN2KzcvZlhuR1BzT3FRai8xdzI4c3UxQ24ycmtL?=
 =?utf-8?B?MFZieWx4ZFlVTHB1b3BCdHNvY1o1NWhzSG9pUytPQ0JOdWNHQ1gzTFFxdmVE?=
 =?utf-8?B?RUxSQkVkUVFWam9haUpHeXg2eFZONkFmUk5kZEhwZk42NWhNbk43Z0FmQk0z?=
 =?utf-8?B?YzROdzJuRklPTnRvK0Eyb1hhQ25OdHEyYkRlZkZ6SEQrZVRUSUJ2VCtyWXI3?=
 =?utf-8?B?cER3T2FMaVlEdGF3bmVMRlRZeUs2N3dtS1Q5L1g5VnQzdGxLMlpUSy92Zno2?=
 =?utf-8?B?K1J1Z0xOenV0S3VSM20xRllpd1FOS2NHM2p6YXdYVXBndGozRTdJUjdPQUdI?=
 =?utf-8?Q?njHo4IPcQ1xRqMdxl8muPwlPQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Q2lXSUhFbExITUJOeXNVVTFWempCR3l1YjdobTAvaTVXUmNKSXBMcHV0Q3g3?=
 =?utf-8?B?L2tpNU9BUUxVOTQxdytkRUd4TVNqbEJDUG80S2VmcmxJb1I5QzRZaFB1NlNG?=
 =?utf-8?B?Wk9PYW9uVG1WaVJxTjYySGNZVSszYVovR2RYSGU0VUVleGg1bm5yWExnbFBk?=
 =?utf-8?B?MERWMDBvWmp4TmNDdTZkUWVmRW4wNlh1bVRncm1WSFExbFpVb3lEbCt0Nkt5?=
 =?utf-8?B?Tk5zdGhpUkczZEQ3WUtZTVR3VllENzlqRVQwRXhzSVRjckpnb2ppSXErcmZh?=
 =?utf-8?B?azN1bXlXRFh5cGU5aWVpS1lISHR4VXA3d1lFS2gzQTc0Y1phaHJnOTR1QnAy?=
 =?utf-8?B?TEVSNEwxTWFEbW4wRk96Mk1PMlptMjdVcDBzR3lHVHpwdkdKRERFYWEzSEtL?=
 =?utf-8?B?dzRoUzhmRmZubXlkQVl0aFBRcXZ0UDRVdE13Z2dWWmpWNWRWSEM3UEVGNGZu?=
 =?utf-8?B?OWEzZmYyVm0xZm1jOWhrOEJGNkNWTDY5MHBlZitsbHlBcVl5M3hXK2R3QWJZ?=
 =?utf-8?B?YUJrUlltSUE1NlBib1hxRXdyRnlhbkduZHJBTlJ4Rnd3VDN0ZmwrZm53ekha?=
 =?utf-8?B?MXRLRllTQm5RNFlPYXRFQkZvVEU1MG5DS3VEVENqcDlacXM3RWRpbTNka0dp?=
 =?utf-8?B?N251MDdpdVM2bEpacTBrd0dLYmoxNzkvbGpzOXhsZVJzTW4zOFkvNnlPK0dD?=
 =?utf-8?B?TWJTV2tlWnBOSC9jM3BxOUIwdk5SVHd6Qys1VHZqYmpDVGdNZ1dIblcxR251?=
 =?utf-8?B?MHRISENySlFoYlJKYy8xQUVlR1UxS3VOSzY3L1hBRS9Nd3JiUHI4VXRCdnha?=
 =?utf-8?B?aXFETUJ1ODlqa0JzWnVwS0dSaVVOeCtIanRKRHk3aHhuV3h4WEdkZTk0Q1FX?=
 =?utf-8?B?Q1gvQXE2cVZMZlJUUFVwRWh0KzdQblFKZmFIdWNvY2FHMkhuZmZEOXlXN1NZ?=
 =?utf-8?B?cjhQaFFKVlNWTk5vQVhsNUJlT05mWDE4RldHZVJ3VW1mOHVFT3luckdBNGUz?=
 =?utf-8?B?T29zWGZBcHdRaTFjOFFPYXFiVWVQQUZPdEljaVpsSWdQNkYvM1hFK2xmWHUv?=
 =?utf-8?B?Q1dTYU9kdU15Yzczai9rb0dWTUMyL2Q3cmNiNXRjT1d2TmVEMXNHbllHMzM1?=
 =?utf-8?B?UTVhRUdRcTd3OWp6VXBxdC9lbmhTUTh3emNiamtHTTVvTlBlcGZiWE5qSTV4?=
 =?utf-8?B?a0lrTGlPV2hDNFlycXhWQXIrZHM1empYa3N3b2dLdG9xaHAyVlFuMVc4MUdK?=
 =?utf-8?Q?q1GOsHwctiPvY+b?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6fcbc1-6e5d-4547-8d5e-08dacd69c52c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:45:39.2137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZrmzDV8EVFYEjS9rROJ+VFh9NztKUJCrrOQ2DyLtgirDyN+gSwDbnbGWGX52HW7zrIrcUNzjndy67GcN5RO0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6935

This is required so PVH dom0 can get the initial video console state
as handled by Xen.  PV dom0 will get this as part of the start_info,
but it doesn't seem necessary to place such information in the
HVM start info.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/platform_hypercall.c | 11 +++++++++++
 xen/drivers/video/vga.c           |  2 +-
 xen/include/public/platform.h     |  6 ++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index a7341dc3d7..3f0d0389af 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -839,6 +839,17 @@ ret_t do_platform_op(
     }
     break;
 
+    case XENPF_get_dom0_console:
+        if ( !fill_console_start_info(&op->u.dom0_console) )
+        {
+            ret = -ENODEV;
+            break;
+        }
+
+        if ( copy_field_to_guest(u_xenpf_op, op, u.dom0_console) )
+            ret = -EFAULT;
+        break;
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index 29a88e8241..0a03508bee 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -205,7 +205,7 @@ static void cf_check vga_text_puts(const char *s, size_t nr)
     }
 }
 
-int __init fill_console_start_info(struct dom0_vga_console_info *ci)
+int fill_console_start_info(struct dom0_vga_console_info *ci)
 {
     memcpy(ci, &vga_console_info, sizeof(*ci));
     return 1;
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 5e1494fe9a..14784dfa77 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -605,6 +605,11 @@ struct xenpf_symdata {
 typedef struct xenpf_symdata xenpf_symdata_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_symdata_t);
 
+/* Fetch the video console information and mode setup by Xen. */
+#define XENPF_get_dom0_console 64
+typedef struct dom0_vga_console_info xenpf_dom0_console_t;
+DEFINE_XEN_GUEST_HANDLE(xenpf_dom0_console_t);
+
 /*
  * ` enum neg_errnoval
  * ` HYPERVISOR_platform_op(const struct xen_platform_op*);
@@ -635,6 +640,7 @@ struct xen_platform_op {
         xenpf_core_parking_t          core_parking;
         xenpf_resource_op_t           resource_op;
         xenpf_symdata_t               symdata;
+        xenpf_dom0_console_t          dom0_console;
         uint8_t                       pad[128];
     } u;
 };
-- 
2.37.3


