Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D10439750
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 15:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215827.375214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mezoj-0003uC-Du; Mon, 25 Oct 2021 13:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215827.375214; Mon, 25 Oct 2021 13:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mezoj-0003rR-Af; Mon, 25 Oct 2021 13:15:09 +0000
Received: by outflank-mailman (input) for mailman id 215827;
 Mon, 25 Oct 2021 13:15:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Ub=PN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mezoh-0003rL-6K
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 13:15:07 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9184c64c-3595-11ec-840f-12813bfff9fa;
 Mon, 25 Oct 2021 13:15:05 +0000 (UTC)
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
X-Inumbo-ID: 9184c64c-3595-11ec-840f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635167705;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6NN+HcK4pNW1+uu67L4LFJbJeM74ILo1Qa1fUmmi0MI=;
  b=e2G4MSUJ1bi8WnGKqzIlbgvYauQbulV6yRwfjrx5hxMOR6qSeeTN4lqA
   5E9ubrXHyAJ3BckwfelbIa3JQWq9zNDGlU4JKipKMocK7YctLQNFcXcxK
   BmscFEuej5qx8Kk9Dq8BDPrinRJSct1Qc3u1/RtDFzkAgugDSmftMAmFA
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TZGhpoVpHX+QUPvf4bjYRSd5GMitJBHpfyGyeCOOrzAIrgRHcwDWsEIwrZqV1gi2b3wtKF11cr
 KogPpn5KI66Ri5aTQejKSgCJoHAQz67Kyw/lyBAbMy/F3wZnCYqbEpbtHKie1WIR5BkW+vVvhb
 /odwa8Fi6EZtfoXc3j6dIVjGGEiA9cXW1RP9E40of26oEeCS+5r6XnyXaOAU0h0AikCeWaA9WY
 p7fs2wZuzr+buoKOAPrIi4N4XSBZ+EXX2BbtFhpSqv1z0wfTDjRYwxY+BrE8Kj1we6XG8VVWvH
 L1d2G/dEsPqT8hipyfIuhE7H
X-SBRS: 5.1
X-MesageID: 55969246
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CIWwOqy6qVAMOpqbWZ96t+fTwCrEfRIJ4+MujC+fZmUNrF6WrkVRy
 WMcWm6Aa/mNYjTxKo8gPo/j9BgF6pDcyIJgSlNkqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6w7Rk2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/99x
 s9/np+ccysCE7PjuvYPXQdiNS4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIFjWlh3JwQdRrYT
 /E6Vxc+fg//WkNGE2hIVpgXmdWajECqJlW0r3rK/PFqsgA/1jdZ2rX3LMDcfNDMQMxPh1uZv
 UrP5WG/CRYfXPSHwCeB2mKhgKnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPXOhqPmkjgilWtRQK
 2Qd4C9opq83nGSpQcP6RAaQu2Ofs1gXXN84O+wl6imdx6zM+QGbC2MYCDlbZ7QOs8s7Ricj0
 FOTqNrvCSZyq72eSX+b9bC8oCu7PG4eKmpqTS0ZSQoI5fHzrYd1iQjAJv5zHajwgtDrFDXYx
 zGRsDN4l7gVldQM1aiw4RbAmT3EjpHPQhRvvl2Pdm2g5wJ9IoWiYuSA8kPH5PxNKIKYSFipv
 3UencWaqucUAvmlvTaRTeA6OaCm7veILhXRmVdqWZIm8lyF5XmneoxB5SBkE01gOM0EZDzBb
 VfavEVa45o7FHyuYKxsaoS9EfM23LPgHtToUPPTRtdWa503fwiClByCfmbJgTqryhJ11/hiZ
 9HLKq5AEEr2F4xIwDSsdcwe/YUH7Q0g6kHBV57l9TKohO/2iGGudZ8JN16Hb+Yc5ayCoRnI/
 9s3C/Zm2ymzQ8WlPXGJqd97wUQiaCFhX8iv+pM/mvure1I+QAkc5+ntLaTNkmCPt59ekfvU5
 TmDU0tcxUuXaZbveFjSNC4LhF8CW/9CQZMH0c4EYA7AN5sLO9/HAEIjm3wfJuFPyQCb5aQoJ
 8Tpgu3Zahi1dhzJ+i4Gcb72p5F4eRKgiGqmZnT+PWFnJ8QxH1STqrcImzcDEgFUXkJbUuNl+
 9WdOv7zG8JfF2yO8u6PMJpDMG9dTVBCwbkvDiMk0/FYeVn28ZgCFsACpqRfHi34Ej2anmHy/
 1/PWX8w/LCRy6dooIihrf3V9O+BTrohdne26kGGtN5awwGBpTH9qWKBOc7VFQ3guJTcofTyO
 74NlKqiYZXqXj9i6uJBLlqi9opnj/PHrL5G1AV0WnLNalWgELR7JXeam8JIs8VwKnVx4FTet
 pun9oYINLOXFtniFVJNdgMpYv7ajaMfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLa3CpawHuBcy4bWKI9u5BEXIKy0lg3yktPaID3AzPt5M3dcM1FN0Qne
 2fGhKfLi7lG6FDFdn4/SSrE0eZH3MxcsxFW1l4SYV+On4Od1PMw2RRQ9xUxTxhUkUobg74iZ
 DAzOhQsd6uU/jpuiMxSZEyWGllMVE+D50j861oVj2mFHUOmYXPAcT8mMuGX8UFHr28FJmpH/
 KuVwXrOWCrxeJ2jxTM7XENopqCxTdF18QGeysmrE97cQss/aDvhxKSveXAJu13sBsZo3B/Lo
 uxj/eBRb6znNHFP//1nWtfCjblAGgqZIGFiQO16+PJbFG7RTzi+xDySJh3jYchKPfHLrRe1B
 sEGyhijjPhiOPJidgwmOJM=
IronPort-HdrOrdr: A9a23:0n7zPaNFwM6DScBcTyX155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YfT0EdMqyIMbESt6+Ti2PZYrVQseVvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4F6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1ojegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKve/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdZ11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtRqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW3HAbgcYa
 lT5fznlbVrmQvwVQGagoAv+q3hYp0LJGbGfqBY0fbllgS/nxhCvjwlLYIk7zM9HakGOup5Dt
 L/Q9BVfYF1P78rhJ1GdZU8qOuMeyXwqEH3QSqvyWqOLtBzB5uKke+x3IkI
X-IronPort-AV: E=Sophos;i="5.87,180,1631592000"; 
   d="scan'208";a="55969246"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eY/cjr+dMEpK50JGeBuM6LJ3uxiTCu4TD8KisEnr7tSf8pchGuhTh2oVD04G/1Rutxy1MS5xl5WzTDyhwL2OXk34/xvanVAnkTueAEZEzO46OtEAThOu98KDUqrOUxXDTfp9CJ5trSDOTIKpWQFpPk3tk7EvZdnBkRv5MqNg+ZKAaCXgAWFcM/kDNzOcOn87D/LD9Y0CNGjpzVPDdmc1wqvh8n3SAqXf12+bFf7BRiP9KH7NLqkTthSAccmdIbV4IA0ilq+n42A366BgeaWq0fI2ah5vvPtbUkQXdLuVxd7bpFny5CP9bunRh5xbLxutVw+eaBrc83j9s1weqogE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR/NR7Wlo246b1K1PEZZknQiaEr9mmqr/4Os4faUQh0=;
 b=kLUo6DyVuK2WRLWFRxGFs69uR3Lv1iGHpUhcRISLPSZN6afbD1QeJPCoHwzuVSHRrpQX0uH5RMpmPeTN8WlEqCDxkmzj5cusg+L8WvFPry7WfryjEXWsJGI+DRGY3Kpdq+/xf7yd4NAOxUwuGXZ75PfO0Pjv34dV/GwEvnKHMxHjGgU5JpAk0MqeQldSK+WFk5MjWtmvSuB8e3/0aflAPY4pWKJiYEy1/3WnjnkHEBS+KEcoOL8Zd8SDuEsv28q9pbT0d4Ol2dEjqVDAE3eGsIZJbYigMP99NMz2Zccxvs2zND6aB7X1FNb3gCTy1I4aPR6U0wtK2hnT6PzpQ2r2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR/NR7Wlo246b1K1PEZZknQiaEr9mmqr/4Os4faUQh0=;
 b=T5mXoyUCpFxsCqxZLXhMzWFlRmy06WxRMlJUeBLYYTWw2JR6cF6AxfNZV0M6BWM9GafkNMkTIJCSHNhv1JkdAQ9bdZrctHDUyOdKOOk2nR7/tNwn846WgvbMuu/5nMXAdlJPBaWjmoDZD2yFrFCPOW1wZTKHe3Nmt1/QWJXjhbE=
Date: Mon, 25 Oct 2021 15:14:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Ian Jackson <iwj@xenproject.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [PATCH v5 06/10] libxl: Allow removing PCI devices for all types
 of domains
Message-ID: <YXatzfvSLZc9g6BV@MacBook-Air-de-Roger.local>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-7-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211008055535.337436-7-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94117386-1471-4e27-405d-08d997b97254
X-MS-TrafficTypeDiagnostic: DM6PR03MB4138:
X-Microsoft-Antispam-PRVS: <DM6PR03MB41382C6CCF55D492ECC88DE68F839@DM6PR03MB4138.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vwA6pKni9WHowaob+y+38X9V5jOT62sgkPrFAL1soauq8jAge4Sh89EGMFEp+uqBxuNOQDf1AdvCZeyTvM61qcw1sUdm2td1UAav+wgr89+GXXY5oCg2fpZxBiMFSnwZQgMjrSkLR4JOzqLodSx28QgMvsLaCL7IepEr9al23tUQSADjtkkdYCP3Xs3iZQHLNoYDvRmbNarVEHNnd9jn71dS+m89tgX9L8XlMoGrZ+0IPTq7u1V5nBUSac6J3cWFNfGmmr+1g0WeKCXMcuFZrTc9peuzJwR2NMywwE72X8z/e+s/qZFcD5pXovDPMjkqQA3VPngNoAH4IoJOpHttSp8Q+BQAL/K8Cm3GXac2MpyvxBLh3POM65aq01FIoy4fO0kQAXyiJUjgODeFhXvt5tMNm0OLYZ0mvDL5mPf4/BC5KKUcga7wg1E0HS7E1NuCSnt/2LbdYWyQrgFSR+ZQlkPhRaA8uRK3odQ003wtqcHWpXmkko+Z1fJPCiJ46/ySvxikdFxqc2+zJ5cAktPq6bztdlGim9kjmMkC8XvUljQj4u8ksZdxoEZ2phqzOwTy1CpDZK2PVRE/VT07+vaVFSvmL4ditnVEzfMJxFVzc/6ao4goPl9lcdvQTwoAcXfLGeOP0ZrPrPYF4sHbVAIZgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(186003)(9686003)(6486002)(316002)(86362001)(956004)(5660300002)(66946007)(54906003)(7416002)(2906002)(6916009)(6496006)(85182001)(508600001)(4326008)(66556008)(82960400001)(6666004)(4744005)(38100700002)(66476007)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUZrbmhYNk9FcFI3bTlKU0Eyd0o1WTRJV04xMTBkSTVoaC81L2J4TnpNdFpv?=
 =?utf-8?B?NEdiblpoeXZWOWFuOVY4UXI4Uk9rWklsWWtLcUtheUdqSjE0b2xPR2ErQlI5?=
 =?utf-8?B?Q2JSdVJWQTRwelg3YXh5N1QrUGF0OWR1SUJrdzJsNlNDalNhakdvS3NrYjBQ?=
 =?utf-8?B?VzRNZ1ROdytpZzcwYjg1M3VkdnEzOXprTXhBanROdE1nWk0xcDFpd1c3czh3?=
 =?utf-8?B?cEF2N0NqaGNzc05CSFhCanR6bitDMllta1ZpU3JEcGV5STlQdkVPeEx5c01q?=
 =?utf-8?B?Z0dIaWJOUGdHY1crRXp2dXlSWGhObnFYNUk1WXVtbXg3eUVvSER5c1kwOE5C?=
 =?utf-8?B?Tm9xSSswK0Vhbmk4dk5YMWlaaHo0UGp6YVRwWnFQZnkvdGd0RWRnWDlXVVhu?=
 =?utf-8?B?TEQzcVdQZmFaUEl6Z1d4ck9UYjdzeVB5dmxiVkkrK0hBMkVPQjdRbFJFcUhB?=
 =?utf-8?B?cDlyMVFpaG9JaUJOU00ydXR6dUcyWXIxbmE2bkFrUGp1cG83K0RuaEhyclh4?=
 =?utf-8?B?REp4SWszdEhMTk5MNERRUFpBUEg0TGIrcHVpYjBpTmk3aHlMQUx5NGd2MGNV?=
 =?utf-8?B?dm5QS0VTcDlycE5yS0FsMURqUkZNNHZtM2U1aEtvUWpHaFpFRGpGMi9oVWlw?=
 =?utf-8?B?NVZ2MkZ3eGlFTUFKWEJHU0dOT0dYbjRROU1UUENmell1VnJCMGpwUHlLemdz?=
 =?utf-8?B?MzBkT0RaY3RRUWtwb3ZXVFJNT0tSMm50NFNyb1VqMHpBOVkzR0xrSVhrNncz?=
 =?utf-8?B?enRjVmJqWnlJTW1YUytBWG9aSTk5bnIySlVrN1NwcmRXSDZYUmNCK1Z6bUpK?=
 =?utf-8?B?OHU0T29PbEVWRzRoVDdhT0QySlZmMi8xZ0FhcTFOZFhsMWR3aHhudTRIOWpK?=
 =?utf-8?B?eWFOZlBEZEFpZDZmWTc2WUc2cldmeCtnbG42WkthS2VzZFpUY0Y5emZkVkJC?=
 =?utf-8?B?dm1wS0h1S1BkQkl1R2dDNW5SclJRT3VMUTd5QjdZYzRMblgyTTlHTWd1bEtQ?=
 =?utf-8?B?QW5NQWtCclFJeEwrQkM0QkhiS3UrMXZkZi9zcE9ZelpDdGZBcjUrTEZQbWhj?=
 =?utf-8?B?U1BsYW1MZlZmQkx0QU1FSTBOQ25pSkdOT2drMXhPZzlmRXRjWlc3b3h3aDRS?=
 =?utf-8?B?Vms2bml3eml6R3JqKzZndFNZUnpRTm5NOHVoTWErcWg3VUlsZG1LN1FSdktR?=
 =?utf-8?B?NVZrbDlXRkw0dGJlVWhTMjN4aE14VW1mcGFyNjA2TCs0aWlTeSs2SzFFemUr?=
 =?utf-8?B?OWkwMlY3eERhRXZNdWdRdEE5TDh1M0MrVUE1eGs0a29UZW14alF2RXJNVHN0?=
 =?utf-8?B?Q2hvMGk0ZnlHUm9qb3BsbTlNRlBYdFQ1VWg4Z2tWTFZwODJSSjMzVVVxb3px?=
 =?utf-8?B?VWJLb2JPSE9DWmdGMnNMRU1tYzJYS2hlOGxKYVJDNU10bnFOWXdTdURBb1g3?=
 =?utf-8?B?dmcveGszZ1RMc0NDd0dXaEkrNmp1Z3QxcXVSb0ZFRU51R3NMUmxXaDN3UTcx?=
 =?utf-8?B?WElTMWNVdmF6bzl4MGdNcXh3Vnd5em9rY1UwVkZxMmdCQ1VWUndMUE4yUHZh?=
 =?utf-8?B?ZUp5OGMxVVRyV0xITFhkT1c3UUxHNXZmZFhhVzZjcUEzNFNDVmNSUTdlcEUr?=
 =?utf-8?B?WWZrRVlub2ZNelNzTVZ0d3JJa3FPQ3NvdXRsVkp3dU81SnJzMFZuQXpTWUx1?=
 =?utf-8?B?ZmNFeVg4eGgyYmNNK2VCaDBMbm1wQmkrNmp0ZHlhYjdSNFNJV0QwY3FxZFFn?=
 =?utf-8?B?MzVoWDY2VUJsWFJKM3JaZGl6d1c4T3RoazFLVXQ5QXVYMUtwRk9yWnBMb0dV?=
 =?utf-8?B?RlRvYVZVQTZ3R2FqNlowOTN2NEVPVi9EQ29UcE03L1AyZkIwUkt6MmpKekQ2?=
 =?utf-8?B?ZUt5TmgrM1BrYnR6VnRlSW9UMXFzVEtWTWdzVnZ2SXFLSG40dU5TemNEN0lN?=
 =?utf-8?B?QmNrUVAzSUVzcFc3THJLVEh4VzdHWFVBZXh6enFKRDUwSG1mQ3N1ejI5dUh0?=
 =?utf-8?B?azFxU2R5enlXN0hkSzR5L1lUZklPTXhIaXdiVldybVR6RUhiTERiQ1RqZGJW?=
 =?utf-8?B?MzdEaSs5NXhvU0RiSUFxZWlaZi9aTDROd2xlSnVtRTVjM2lVR2FPWXRkMGtk?=
 =?utf-8?B?SVNObmFGalVUUWczY2Z4MklmdTY2eXB2UFpRZlNYTFlnV01ZOXJxZ092SFRp?=
 =?utf-8?Q?cP6ob4G5R62mcDlfrMaW4Z4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94117386-1471-4e27-405d-08d997b97254
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:14:59.3360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1v0dY1/a/h4otxbGd1++wh2bn8QdM5tecppDJhGCcldTQ2PK8jY7xIJpoqyHC62eHKqIW5JohJvtdDZDrE86+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4138
X-OriginatorOrg: citrix.com

On Fri, Oct 08, 2021 at 08:55:31AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> The PCI device remove path may now be used by PVH on ARM, so the
> assert is no longer valid.

I think ti might be worth saying that this is a preparatory change and
that PCI passthrough is not yet functional on Arm after it.

Thanks, Roger.

