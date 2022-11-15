Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C76298FA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 13:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443931.698668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouv9z-0001PP-2R; Tue, 15 Nov 2022 12:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443931.698668; Tue, 15 Nov 2022 12:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouv9y-0001Nd-Vl; Tue, 15 Nov 2022 12:35:26 +0000
Received: by outflank-mailman (input) for mailman id 443931;
 Tue, 15 Nov 2022 12:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxYI=3P=citrix.com=prvs=31178c1ec=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ouv9x-0001NX-Iq
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 12:35:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7811cce-64e1-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 13:35:22 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 07:35:14 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5520.namprd03.prod.outlook.com (2603:10b6:a03:282::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 12:35:10 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 12:35:10 +0000
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
X-Inumbo-ID: f7811cce-64e1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668515722;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=yx1qT6ADU6F03ua5VujyVXnrhoNLwEoV9OK8YImi7Vo=;
  b=WI8Pa7E/M99Y7GEgXqKaKmWL7IIpcMWgF3XKPMRocITL2+3vM8X/BRsE
   ilwkxAAve7mDm5R+6CkaPa7aJBfDk2AwnOuZQSFOkOqSxbdzEgDtIR7TD
   wxPA/DzfJfXeB66g/Vof1qPFF4nsKhyDFFh7lOlMINZgyWOvOw23QA2hk
   Q=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 83913977
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bwG0G623EWEY9bNZ0/bD5fRwkn2cJEfYwER7XKvMYLTBsI5bp2YCn
 TBNUGnUafaLYmCmLYtzO4yz9U0FvpHRx9QwHgM4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVnOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfWERRx
 OxCGio3cw2i3tvp2JaVEa5Rv5F2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6Kkl0ZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r83b6WxnKkB+r+EpXk1cRA3WGi9lYeVgckXgG7h6G1rFWhDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSNrmK2YTzSa7Lj8kN+pES0cLGtHbylUSwIAuoDnuNtq0EOJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTN/Ni1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:tFwN9q110za2lXMZESbckQqjBcZxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8M3WBxB8baYOCCggeVxe5ZnO/fKlHbexEWldQtqJ
 uIDZIOb+EYZGIS5aia3ODRKadb/DDtytHMuQ6x9QYPcek8AJsQlDuRRzzrZnFedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0oTvXOvNrCkbPheFojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv+/olbg9zoz/pEHYiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvHxUWDiXXujMTlTHZiYvAx875xQ1/80Q4Nrdt82K
 VE0yawsIdWNwrJmGDY68LTXx9nu0KoqT4JkPIVjVZYTYwCAYUh2rA3zQdwKtMtDSj64IcoHK
 1HC9zd3u9fdRegY3XQrgBUsa+Rd0V2Oi3DblkJu8ST3TQTtmt+1VEkyMsWmWpF3I4hSrFfjt
 60fphApfVrdIs7fKh9DOAOTY+cEWrWWy/BN2qUPBDOCLwHAXTQsJT6iY9Fqd1CQKZ4gqfapa
 6xEW+x7QUJCgLT4Iy1rdd2Gyn2MSqAtW+H8LAc23B70oeMNIYDfxfzCmzGqPHQ3cn3MverJ8
 pbB6gmfMMLVVGef7qh/zeOKaW6ekNuJfE9i5IcZ2+khP7tB8nDitH7GcyjVYYFVwxUEV/CPg
 ==
X-IronPort-AV: E=Sophos;i="5.96,165,1665460800"; 
   d="scan'208";a="83913977"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiALM4XeKf/SaOQ1OAHoP1VGRUif4Di0XX0MQ523JhiZl3is5V3JaITiVmz3k/6BfEpuzsqRQc2+P4a4+/311qquoa7zDhbvVI/BT2vgnkN7AfvUTkLszu9tDGFvLvn9NojdAVRXeQ0InrQLjCiwS/j1Sur0dc2iLEsRTk6abkPGAdrR53t2XM+cJgdv5iU+pYjLwgTLTLFcuKxF2W8IyhBRcsNbGQSia3hrckh68MeZxjFtlF1fW0zi6TIjJJYVDlMxF+tJBpb38HzvklNcI54cYz56j8Bp4l5wChRVj3vNRzjd50VGjaJ9JR6LzvuTFNv9G+zDqEa7MFAO99crSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+kVssPldB61vaARpAydKDcBb+cwifH0pqEE8rmTf2Y=;
 b=YKgF4mEalHB4mWGrtkltIimtJ54/I95CHq1RTHBC6v5EHLvFt1Xu+vWmScSqZX3/dDChGqyWHOTiGbsZm0OKpOQgC4I9BNtLoUkf+6vm8hB2C0wdfgdx1WIldI/8mZ514wp/EhlRMexvrqjXsOk++79JKUiFKVc5XcGAh2gVRG2YyO2qFZC1GYONPyKa/I7Xxb7C72NmreCi9j6ZynXzA32/IN36zwSYu74A1Bs65r5h+4H4n1TYEmn7Qua+7tmZuE4VDnr2KDI4vk9IYIs3ecXnXwiiUXcmzl1i5RtqSD9jm5H6hwV0HdoP9tZsLBZcIK+LZpH/kcJGs2sipwaf3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+kVssPldB61vaARpAydKDcBb+cwifH0pqEE8rmTf2Y=;
 b=drbGzl0Fx0DdepvsJ99DghUdp5Jo9BK+ML+uVEOR6+0L2QNVboYPDf++d2lZeQf7lxSHLe4r79ygm5yU7SOflZ+4U4EshQTXbfF/zWsTYQmOCH/OXZR+uy2t7JCEJryNd05ijFGCs7DD4SbZwfNzCY8xNSCL+9xKJuuNaMhA88c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/irq: do not release irq until all cleanup is done
Date: Tue, 15 Nov 2022 13:35:00 +0100
Message-Id: <20221115123500.97114-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0106.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 69bf5e86-c4aa-4651-7e4f-08dac705d53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+nlb+6XFmoNoDL5QmhvZk8czHkYaXjlV+azb26Jo/c4QrY0guwqVEak5/taZZZCNK3zYUZhhX87ilqGFd/TxgVOlY8uQF5HmynWwM8zlmGeeKtZ8zr7ZfKPvkdAgBQvH6wHNvRjgjoIlGAsV7Vtg7bkBc8Pd3kkWzvOD/cZgrIx15thvefs+MRpb5wdgAjjMaKWWx1YxXQdOZi5UNJJneOwsaR5IF2POWgxwOR7W6lAybc+5tVvIJq66w5Q8HOypp6dT3bvIM0sdMJOqIPOjj7mDDw6Ej6TZfaukYTH42+efjt9V0by2BgGKBuecNugE6I6SmKEHmgCMy710jo2i2nMQZ8HN9KZZ+sS/3OXt4z/iQZEYBtvBAaIvi4HeiP4pZLPtnQUZB9zG3SuM6MLvLJmeId+XzbzGsFLS68FumFyniSPoDSUmrYtIkLtTq9ulUfmC1H8yoPj73bSgPQZtTR4vExWTEwIBHHyK9UFqvtMmnLp+0IVTGe/6AOLyomWCeLySWyJ5Wn/dLzN3tyHlDDcYSHKS9U2JcFlABL+cCO79eItbj+E1BUCgE5l65YvjOBIrKkThkwHi9WoddqSle/kVkQ2hP/t8mIPrP8q0OxpTHwHnRBD9xjJuNFHDMRQCgc1GshE1PxfohoRSa29ltgP1GwhpfO3Glv26ZqI/XKzc4cbk3qiYvYSyCmXnjx/ByfVMWXbiEjU6H/5VqiS3dw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(6666004)(478600001)(6486002)(54906003)(6916009)(5660300002)(66556008)(8936002)(36756003)(6506007)(41300700001)(2616005)(1076003)(2906002)(66476007)(316002)(6512007)(26005)(8676002)(4326008)(66946007)(186003)(83380400001)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk5yUU9rRjI4N0V3bElublI0bnhOR2lCaFE4NkxySjRmbVBvQ05BVVJEdWlI?=
 =?utf-8?B?UU1tVSt6c0d5OWMyUUZhUWwyL1owVkM1UzVneE0wTlZNTXV3OFNTRnRVUEdS?=
 =?utf-8?B?KzRCbElwaXhQL3BJSm9ZTzgyUVhOQk1QSFJjSUVaakEzQ0Vjd2JhSUdmd1R6?=
 =?utf-8?B?Z3pPMFB3d09zdGw1SWR6b2h2cThsNGNVYncrdDQ2ZVMyWjRoOHc4c1ZrUkRW?=
 =?utf-8?B?WnIzZGxNTkxKbCtIcmVidG9xZUt2WUIyeHZ3RFZ0M1d1Rzg5czdFNGp2VmFF?=
 =?utf-8?B?WGJCa0FpNUM0SXd1V0dyelNlSTlyQW1ONjJGZ2xRQUtlZCtpQVozdi9SVjE3?=
 =?utf-8?B?TG1lQ0Y0K3E1L1hBbWNlM2RSQ0xzdEg5Vm8xNWVydGREZjZFbGwzQmprb0RU?=
 =?utf-8?B?bDdBRVBHZG9KQm55T3N0Z0RPL2F4eE42WlowYmRkcm1JRE1BTkliVG11Y3Y4?=
 =?utf-8?B?MzVnMG5ZdzZ2MCtybXpxUFR5M0cyM2xXU1pPZE9pTTRzVFNCMEpRN0hiVXJ0?=
 =?utf-8?B?NmZ6QTE4cU1zQjEzRVU0ZW4yR2RWSWlUU1BNQzJLUUZRcEdrS05DeEdoZUcz?=
 =?utf-8?B?L1hkYnJValg3aVJXZkxteFM1RnN5aFFZS3E5b0N3S25Fc2xRNDAzTTJFYXNa?=
 =?utf-8?B?dUpqdy9VdXE3bEpSMjB1a0h2dlRyc2x1NzZqaCtlQU9BM0U0S0FYWnBrd1pC?=
 =?utf-8?B?ZWRtbEg1dHR5SjJ2K29tQ0F2Q09wRnBtZkdld0k3aitsa20zeU90MnpoYzg0?=
 =?utf-8?B?eVR2SFhKY2oydVVscGt0ZjdXdTY5eUdPSjZ5Z2RjM1Avdld4dmI0L0ZvTU8z?=
 =?utf-8?B?Z0NnQ3Vwdlh6emthV2djanFEbHJOdW9WM09hOVAwYXVFUHRwTWFtS25vcHNs?=
 =?utf-8?B?eWYwbVFLREZ6cndIYVp4aEZjc09wN3NDV0JOK0svZ2d3MjRSZmw2SVdwRm85?=
 =?utf-8?B?djVsck1RdjIwSXhrSmV0ZHhITUZab0w5eGV6TnpCUlBnRDVJVDA4N3JDbGkx?=
 =?utf-8?B?a1hMcURTQjdDTkpJZ1g1VzlFUWNiT1JySm1ISGxFN2V2YXIrUEd0Tm1rNXEx?=
 =?utf-8?B?c2pyWkhPQ3R5eHlyM3lKUGF1aHlCTVAyK0YxcEhhZEJuWU9nSU9pMzJMTU5a?=
 =?utf-8?B?WVVWNGNDQWJKVlQyaStqeUJjRFY1UmVuTlEyekVDTGpsamRWSU04VStzeFFN?=
 =?utf-8?B?UjFoUW91UGZFTkdSQTc4L0VzZkRRM0FjckgxbmQ0UndpRE1sckVUNW4rOWJ4?=
 =?utf-8?B?ckl6bklTM0FIc0FxbTg3OG5VU3E2TXMrYXdCTnJrcVhuWk1zQnZxdlA0YmNt?=
 =?utf-8?B?Rll0aEhFQ1FyZk5ZTkZuZ3RNQWxmd2dWNzJSTXNReXpCOUJTTlVpVDJIOWpE?=
 =?utf-8?B?UjEvdjhkRzJmL0IvdmNreFh6QlIweTVyVk5aQVJyMElYMEs1TkFiMlI5VEJ4?=
 =?utf-8?B?MGx4TWx5cWlRQXhpTHpMbS91MjdBTkJwTHZkM01mVUxpV3FXY25vRkFLUkYw?=
 =?utf-8?B?Rjd4SUZEUkkrQXUyTWhyUkhKOEN5TTBaSUV2UUtHWi92TEFCOVVoSVBCRzRn?=
 =?utf-8?B?YllmdFllL202N3dmRGNhV0YwYjNmV05KZnFSTjRaV21WbjFvNUJ4UEFwVWNK?=
 =?utf-8?B?REMzUzF4amcvTzFkVEcwaHFyK0lmRkNmUHA1cnduVVFmcU9KTUtFQWFKQmxv?=
 =?utf-8?B?eVBSWVF4QVk2WUdSb09KWU50cDJ1RkNkZU92WVYxdk0yYUQ4Q3VPS2hla1Bj?=
 =?utf-8?B?Mk1Vb0RNQXQ2amdRYThmMThlakYySHlvbmFLcXdIUlpja0NQVWl2SWRWZmsw?=
 =?utf-8?B?ZVJaNHF3eXNrajgvay8vT3c3dnZEVTlJaFRPTGtqMUNBNk9CNFJIWm9xOWM4?=
 =?utf-8?B?SU15bXZYT0xER0g0WWtyQUZCVytNaytOeWpJa2ZsYnZIU1M1WU9tYWJZbGdo?=
 =?utf-8?B?ZzNrdGdvamhIVVZPWlYxSE1ZNkxZZ3E3Vi9iTDJqbExocFg5N1pmNmtJVk5n?=
 =?utf-8?B?QjliTFVKS3JqcmxDdTFCSnJYalBaTkZOZ2xDWHRPZElrQTFLblpJRDVXS25F?=
 =?utf-8?B?TWVoNmpUSHBtdWpSNHZTTUFDbkFRVWtCcXkrNHRkc2pRWFptNi96V2FWaGx5?=
 =?utf-8?Q?FSnKrvVRV/ZmUVxW4UxOGJlLz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dCDYBSsTUaXIHAiGwmAyaB+iX/fv6nbtvDnzhhnMs+ABNdmaNZrT3I7ZOXVRxcFo6EfJ/ox6ouWg3TYddNXBpSIfs27w+u0n3bnxi4IRHfzVeUtmvP/xt74+QtrnHwL6ekzPub8qSK+grtQxLgWwfNooY6bTCgc0tRURmHt7jVYSuaOB6bu/t+ttIoT08nZBEI5xhfctn1Wb1PMN+H97NkL8LyZg+IJQGJE8IZHJmk+jmN/iwEweiuUYNTwUG372GjlcGbtj2xwkWLEw5nVQzVmBgqNqSnnffG0hHgAYmPpsDyXbvJH8WbykIWxJ6IbvvKGeR/sf5Nh97QGkzVEMU3jcXmzxDoWa9eAnfM0d6eP/MmQSR2h7L3U6mV18fwP2jysXk3ldKlF6l5zyzwKk5e3nbx3rMoWvLWN1dkqODOS+/JvfFE3t2HXidsb0WqfOOfnBIWAAyD2fkn65EQQh5+3mYF2YFpPRgoYM4d75RxrKl5KoAx9OiKM2TiFwjd1e88Yx1Afnnm/SrBNUVWOvtmZxv5wf3cwQIwuzQfWRav/uP0crW0/7gBAm8moyaqmEftKiqqjadSyEEEZPtkw04qZ8Nbz92bjVm1XBShr3f5d0gvGe4vUJm39J64RvH3DJl8j66Vi/tSHSj4wKM6BCwfj9y5fa0O+Bvu0IgjlCvKCKjfO4LvX++hMC6ng5wtTjZZ1f7E1ZmIzc4t75ywecEebWhwaPMzL+b0muTRj034Bc0m2IOeppFPmmc0X3VcuO+suMx5yIN3mGPQuqvpwgI53CqrX/de33BDOdM/JFMYYAVSIexDX2ZToBa9Y8VcaxhsqG80Xew4bUk+GJ5p/85w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bf5e86-c4aa-4651-7e4f-08dac705d53e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:35:10.0407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4cVOcC92Rri2ACm4SMAYpvv0G9jd3hM5DfddfjstW1DpmNLSWCqk9vHvG+4lbXxGyJkaaP9fSEi/ZS9Il3+kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5520

Current code in _clear_irq_vector() will mark the irq as unused before
doing the cleanup required when move_in_progress is true.

This can lead to races in create_irq() if the function picks an irq
desc that's been marked as unused but has move_in_progress set, as the
call to assign_irq_vector() in that function can then fail with
-EAGAIN.

Prevent that by only marking irq descs as unused when all the cleanup
has been done.  While there also use write_atomic() when setting
IRQ_UNUSED in _clear_irq_vector().

The check for move_in_progress cannot be removed from
_assign_irq_vector(), as other users (io_apic_set_pci_routing() and
ioapic_guest_write()) can still pass active irq descs to
assign_irq_vector().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I've only observed this race when using vPCI with a PVH dom0, so I
assume other users of _{clear,assign}_irq_vector() are likely to
already be mutually exclusive by means of other external locks.

The path that triggered this race is using
allocate_and_map_msi_pirq(), which will sadly drop the returned error
code from create_irq() and just return EINVAL, that makes figuring out
the issue more complicated, but fixing that error path should be
done in a separate commit.
---
 xen/arch/x86/irq.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index cd0c8a30a8..15a78a44da 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -220,27 +220,27 @@ static void _clear_irq_vector(struct irq_desc *desc)
         clear_bit(vector, desc->arch.used_vectors);
     }
 
-    desc->arch.used = IRQ_UNUSED;
-
-    trace_irq_mask(TRC_HW_IRQ_CLEAR_VECTOR, irq, vector, tmp_mask);
+    if ( unlikely(desc->arch.move_in_progress) )
+    {
+        /* If we were in motion, also clear desc->arch.old_vector */
+        old_vector = desc->arch.old_vector;
+        cpumask_and(tmp_mask, desc->arch.old_cpu_mask, &cpu_online_map);
 
-    if ( likely(!desc->arch.move_in_progress) )
-        return;
+        for_each_cpu(cpu, tmp_mask)
+        {
+            ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
+            TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
+            per_cpu(vector_irq, cpu)[old_vector] = ~irq;
+        }
 
-    /* If we were in motion, also clear desc->arch.old_vector */
-    old_vector = desc->arch.old_vector;
-    cpumask_and(tmp_mask, desc->arch.old_cpu_mask, &cpu_online_map);
+        release_old_vec(desc);
 
-    for_each_cpu(cpu, tmp_mask)
-    {
-        ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
-        TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
-        per_cpu(vector_irq, cpu)[old_vector] = ~irq;
+        desc->arch.move_in_progress = 0;
     }
 
-    release_old_vec(desc);
+    write_atomic(&desc->arch.used, IRQ_UNUSED);
 
-    desc->arch.move_in_progress = 0;
+    trace_irq_mask(TRC_HW_IRQ_CLEAR_VECTOR, irq, vector, tmp_mask);
 }
 
 void __init clear_irq_vector(int irq)
-- 
2.37.3


