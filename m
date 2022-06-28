Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA755D17A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 15:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357095.585515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Axi-00085I-Hr; Tue, 28 Jun 2022 13:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357095.585515; Tue, 28 Jun 2022 13:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Axi-00083V-Cy; Tue, 28 Jun 2022 13:09:02 +0000
Received: by outflank-mailman (input) for mailman id 357095;
 Tue, 28 Jun 2022 13:09:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XT0n=XD=citrix.com=prvs=171720f04=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6Axg-00083P-1G
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 13:09:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77affbcf-f6e3-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 15:08:58 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 09:08:51 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB5861.namprd03.prod.outlook.com (2603:10b6:510:3a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 13:08:49 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 13:08:49 +0000
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
X-Inumbo-ID: 77affbcf-f6e3-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656421738;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Vf4bb+TM7E0Odjs5ChzhUjlVu7YvyIlojToWm+ccGoM=;
  b=aklJ9zqfY0OE/tNIRHeUwXt1fCuyJmHbIhvGC/yHrJiEmqaSqq/TCPTb
   8QvYNxhKLtstrWgNeDJYNTO9tXM1uo0l2Z+y31xUpV1azHqQSnDWpFsoL
   RoesgBUU78rLemXju3DB4dMkyyRQ4ZNJ3X4G/zxsxHgX08n1U36bw4zYh
   k=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 73919553
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dOIASawatEYGT6o8oLN6t+dNxyrEfRIJ4+MujC+fZmUNrF6WrkVVx
 mccCzjVb/6PMGWjf4p3bIm09UsEv5PQydQySQdrrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY224jhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplus21FwwXN7D2puVNSzxUFz0nO4tp9+qSSZS/mZT7I0zuVVLJmqwrIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHOOTuoEwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKGwB+Q/I/sLb5UDS1xd/ienyDub2XfWORt4FlUaHt
 E/ZqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWMwkQDBRtQUkG0ydGhg1O6c8JSL
 QoT4CVGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6k6nMsSzdAbJkqsZEwTDlzj
 1uRxYq2W3poraGfTm+b+vGMtzSuNCMJLGgEIygZUQ8C5Nqlq4Y25v7Scute/GeOpoWdMVnNL
 /qi9kDSW517YRY36piG
IronPort-HdrOrdr: A9a23:69cW6KHFWkmI86d6pLqFc5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZXbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczKgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenkPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesaMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO21GkeKp
 ghMCjg3ocWTbvDBEqp/lWHgebcFEjbJy32DXTr4aeuontrdHMQ9Tpr+CVQpAZDyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ0fSLlMB27fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.92,227,1650945600"; 
   d="scan'208";a="73919553"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnFGzWE53ILN7PrAKAlv0vvuYax7yV0hmLFIWx/qa1IeZP3Rt4USO/BoO1S2PjjYZhRI9ursCoJPi/6Y5qtUVrkVVhQOMumuPrDp4sfxXF3iljG3KJEf7PqsyCIq6vgsGr4OXifzfa1cfMGm/NRigLnwDxXz6TdLYJi2SjwwwFSTNvatFKyyuI6+U7sj5Ecpyl/G28kvhztCZk+J/7GYor+gA/3YB8FF9MNjhZEAFjm2nGarwI/p4QYjDvJvPpIiH8xLxu9SOLiuPSp3RifQoi9+qs+7CxXx458yKse61pgZRNLjRuSYrT4SqlF/gmenKAXkcH84cxba0GYUTvPgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3SwzpiVtop0VuA72AvRWz3+VKwiDk7gvmWxnGRbUwo=;
 b=Ze9epkjFjtBEG1IafI9XfSCM72FaQtnwiCk3pbmU2FsLSFTMcGVnb/Yyzcjp6dZJNSYJJ3q2ogbLRlafNBQJgSEcTXWSMoWN2qoAtMsc198LAOQbf7khsT7cYel45TQDmoNXCDlMbFc8kLPVU2yEVsr8SDGmgXVztACPiRhOqQReJDhTgq7AmcgOQT7K+UGZypu1rh8vAV/ufpPka1Lk6GwEL9sh3raqWBFTNkPApgP8IugBL9rkyZpxcmqUVsxEpA0+7EnoltQNZt5smUj7ScojdOiSJra11n9/J5IGnACEYJtVJf9KvzLqBCLJRfW+xtS16GCf9rB1NuCKqal/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3SwzpiVtop0VuA72AvRWz3+VKwiDk7gvmWxnGRbUwo=;
 b=hrPjkjdWOzpCEWpE0pFLW/3xqH0DijO++Kd+vKVGAvXPGed8/l7v9XAlC/4Hmhi7kfJjY8aqB2KotbgqJShTVNcvj/EDLwUUAqNl/SWPW2twnMryHDF19KmRT8BJccqSSBFzIWbDo91oSj2F3zxC01jl0ms3HJrtb63bEXiQLqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Jun 2022 15:08:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu: add preemption support to iommu_{un,}map()
Message-ID: <Yrr9XUxZCrjLFGDL@Air-de-Roger>
References: <20220610083248.25800-1-roger.pau@citrix.com>
 <a968598e-cacc-d762-46b8-579e18f64d12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a968598e-cacc-d762-46b8-579e18f64d12@suse.com>
X-ClientProxiedBy: LO4P123CA0229.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1da19fe6-3832-4fad-6bcc-08da59075762
X-MS-TrafficTypeDiagnostic: PH0PR03MB5861:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N+C8OCcZIPX7ebUkNms/i3ffStqvB2Epm1lQFAYYSPITSkNsEtZbkIodvp8eCKs4t1qB0WE/mm2E0fHPj52n5oUpVHXpPmIOw7u9AW+ous3Ytnz+JmsJMRebIyBkFoK2iXmT+NoNHxvIJCfrrMWoKSUkp2z2mUGwCwKbOGFKhttG2VQ4ePSnCM619cJNlFlJZUUWgZZ3JEdQxEpb4uLN86zlcNELRA40W5U56x68Ux3MEtAlPmEX9TB64Vh7X22PKJQ+lmtOGzz6o+VPf0sYcSe6stOpZOWm4BGV9Vl1KquSCCQZnwP48S6zGpXv5cJvRZPCHYMe+5/ao8IvzrMp89w0blmj8HnYkkHy3LfPvGPJkXpFZBFs+4xeHmwRupmlH+7O0S6Qv3Sovuhow+B6u7H5m6grXImhq9ebBiq/hXTkTM3ylH3VBxC1+uV2T96oftDcgoSUDOhKRGeJMYvin6zDnC0btpkLEynFNSVmi3Xnfnv7OGRItAjszGv8mlSW/6KKK8whzCn/Ni/mDP0ynxbvAmXY7gaQr2xH2I/TeREC5IJusPgGG/JLiLoIs7IDzMnXO+VNyfTtdil8I+Tvq38rN3kJufFoBlW0Hh3iehq3SkwNCLgl4XJvsS3DlCLuuw/H0KbroSbDItLNWQK3yU7BtdORWUnPewhS13fTmLVIG5Lb6M1HuuZ34BmsaqQZWMzcEMIYftyQ7Unom2Vup7X6vBu9BbpcKGAlzZGLiywVxP3Ctfuc5L9M/wICRY3i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(376002)(136003)(366004)(346002)(396003)(39860400002)(53546011)(6916009)(6666004)(316002)(54906003)(2906002)(82960400001)(86362001)(41300700001)(5660300002)(85182001)(38100700002)(66556008)(26005)(33716001)(66946007)(66476007)(4326008)(6512007)(8676002)(6486002)(6506007)(83380400001)(478600001)(9686003)(186003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGdaRXlIdjZhSjdscGxIWVNjaEl1RDBlNVUxd1BDUXFGa042c2VQTm9aOUt6?=
 =?utf-8?B?dUhyK1BvWUpodnlnYkdHdkFMS3o1aWdsVXBpZDZ0b0kwMnJtbk5ydnY0SHgx?=
 =?utf-8?B?aWMySnlHRGlrUmdMeXlGeWdlT1lIbGRpeW9BNGVSdzZSZ20zaSsyUCtPSFJk?=
 =?utf-8?B?L3ZFSUJuVEdJbTRxZ3FUTjAxVnpJSk55T014aWpoV0lmZGxHUHA1dmZ1azVk?=
 =?utf-8?B?TStUK0VCYlhqMXlWVU9peENkV0VTOUJXYXczeU5mQXEzUmEzTmM4VHpEY1Vx?=
 =?utf-8?B?TWNxY0E0OVhuQldYekVPd09LQzhCYkFkd000UEJNMVpLRG1rZzI2dVU5UDBV?=
 =?utf-8?B?OVFsUi9XaEpUbi9ZaTlLVVJIU2U4ZmVETkNkNEloU3BsbHRFTlkzZi9tMTk4?=
 =?utf-8?B?KzJwWmhrQmxHUmFmTEpjK2JPWFpYWldlZVRZZjVtcSs4SGxHakc3YTh6dGdX?=
 =?utf-8?B?eERPUFhZSllyeFdEeG04UnVXVXFLRHAwKzh2blVXYWppWVo1M2hpcEhXelFt?=
 =?utf-8?B?b0lHTjVselJhQS82RkVHODlHNk9LeHdwY21KRk85dHMzcmJSNkxydURvWUJ0?=
 =?utf-8?B?YlF6bGU5cnhpYlNYRmhvVHduZEhhNG0zUm9leXl4elJQa3EyRHl1dFp2VWl4?=
 =?utf-8?B?M1BtZTlMWGlINGNXR1AvM1BnckUzUHYyMUhuaUNRTmc3MHBXWkU3Szh4V3Zv?=
 =?utf-8?B?WFNIZUdBZmQyWE03U0xwS3UwcVQzNE1wTHNSK2xPV0dScTJQRlhyMXBJb0Rx?=
 =?utf-8?B?RGNrY3dVelF1dXlIdUI1TnNRRXRrb3ZBOUlZem1VbXlhV21VZUdxcEFpZjl5?=
 =?utf-8?B?SGJJNW5Kck5IcHQ4U3pONTM2RXc3L2xSNFUvTDBBM0VSeUpHT2NJQ2NxNVkr?=
 =?utf-8?B?MWJwcFliVG8vQjZyTUlRQXFEMTErc3UvZk5QejJtVkNhdXM0NnM3RlFuY2lv?=
 =?utf-8?B?WFBqa004bk1iam9qUkJrVERzNEE0bGdCSnJ5Ujg2VkNSNTE3SEt4c0Qxc29N?=
 =?utf-8?B?YVNQdGUyeXQ4Y2JkZFNQUDdKYmtEZE53MGFYRUZMekVFQ1VqSDZjUDI5NGg0?=
 =?utf-8?B?bm4xUk5EVE4xRjBaWHdaMEVQcXlaMWZlelNMT1Vza1NBRmN1dUZ2M2psbUsx?=
 =?utf-8?B?aVNKbnJKRHZKT0t5S3pQcVpWUmtiWDZQSmJpcjRtZU9yeEtEaHQxYlBHdVo3?=
 =?utf-8?B?cGY4Zk5IR3pndTMyWHozRU96UXZ1K3A1a1hNc2laYngvSjMvYjI1V3lSdUFT?=
 =?utf-8?B?NGx2bnBBd3RXWHIxTnM2b2loa2p0U25QUVY1QWNJVE9zVytOVGJ6aEhQdEpB?=
 =?utf-8?B?NENmYUYzU3dEMUNIa01YdWRqWGdtL21EMVlDWVFCL0RhKzFJNUY1U1V4bDBk?=
 =?utf-8?B?MUxwZkpRbVJQWnNyOVhyelVPc2VxQVc2ZVlRTFBXUDAyWjhUaFV0Q1owM1Bu?=
 =?utf-8?B?UURHalRnZWxxYjRDNmVUQUVLWE5BV1ZsUVpMdjZHWU9UclBiU1Z2WmpORUdF?=
 =?utf-8?B?U3AyWW1CNDM2Z2QxVENxVnRlYk5oRzVJSk1rZk5vWmNxS08vNEhiRTdCUjJF?=
 =?utf-8?B?aDNCanVvRGYyRFUraExQSEJITm11RXRORGxEZjRWdllwcWtnalREUE9iVGpU?=
 =?utf-8?B?Z0FyS0IrZnV4REJ6Y1JOYUxkOWdrMGx2dDhUK3poT09QcG5UQ3g4M1lHbFh4?=
 =?utf-8?B?dVJ4SkxldFNTOEdhOUhsT0hoc2NLcVZHOTIza0Z2N2VrdytJUWlFMnc5Q1Rz?=
 =?utf-8?B?WFhlL2dmNzNpeGFjZms5aGgrbGlGYXBnVHlqK0MzVzFVdnJPclFwYTJIYmll?=
 =?utf-8?B?Z28yVHBIUTU4bzRnUHZ2K29vcDN0bXdwZndURFNpZnd2MlA5bVFJMWwwR3RF?=
 =?utf-8?B?TkljS3BCMERJa3NoTjBRNkpVelgrTXN0bzhOSmxQTE1Nci9Vc2xGZkMyaWVU?=
 =?utf-8?B?Y2tCS003UUVyekNONGVmSG5IWGEzdXJNVmZENGcxdG00MElNN1p3c1d6cllT?=
 =?utf-8?B?UHp4cS9BYzVBYU9DMFowa283WEdjZDI3dlRzN2RYTlVGdHlZeTZZOTFRekF1?=
 =?utf-8?B?K3MwMyt0MHVMdVVEaGpJWE9jbkI1cVRaNGxXTDJYY29ZVnVrZmN4QVBtMHBY?=
 =?utf-8?B?OHBabXIxTXBUZEE0dm0rY0ZHWXk2QlBuSzRZeGkvalJwclExUFlSci82VG1a?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da19fe6-3832-4fad-6bcc-08da59075762
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 13:08:49.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4A4X/Ngl1XJEY1jtuLuVE3Kd8dScVrkt04FS2nKtmSlf9O3zuJXKuP56EbKx1T0ma6Wcgg2A8PffS7Yz+nBK9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5861

On Thu, Jun 23, 2022 at 11:49:00AM +0200, Jan Beulich wrote:
> On 10.06.2022 10:32, Roger Pau Monne wrote:
> > The loop in iommu_{un,}map() can be arbitrary large, and as such it
> > needs to handle preemption.  Introduce a new parameter that allow
> > returning the number of pages that have been processed, and which
> > presence also signals whether the function should do preemption
> > checks.
> > 
> > Note that the cleanup done in iommu_map() can now be incomplete if
> > preemption has happened, and hence callers would need to take care of
> > unmapping the whole range (ie: ranges already mapped by previously
> > preempted calls).  So far none of the callers care about having those
> > ranges unmapped, so error handling in iommu_memory_setup() and
> > arch_iommu_hwdom_init() can be kept as-is.
> > 
> > Note that iommu_legacy_{un,}map() is left without preemption handling:
> > callers of those interfaces are not modified to pass bigger chunks,
> > and hence the functions won't be modified as are legacy and should be
> > replaced with iommu_{un,}map() instead if preemption is required.
> > 
> > Fixes: f3185c165d ('IOMMU/x86: perform PV Dom0 mappings in batches')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/pv/dom0_build.c        | 15 ++++++++++++---
> >  xen/drivers/passthrough/iommu.c     | 26 +++++++++++++++++++-------
> >  xen/drivers/passthrough/x86/iommu.c | 13 +++++++++++--
> >  xen/include/xen/iommu.h             |  4 ++--
> >  4 files changed, 44 insertions(+), 14 deletions(-)
> 
> I'm a little confused, I guess: On irc you did, if I'm not mistaken,
> say you'd post what you have, but that would be incomplete. Now this
> looks pretty complete when leaving aside the fact that the referenced
> commit has meanwhile been reverted, and there's also no post-commit-
> message remark towards anything else that needs doing. I'd like to
> include this change in the next version of my series (ahead of the
> previously reverted change), doing the re-basing as necessary. But
> for that I first need to understand the state of this change.

It ended up not being as complicated as I thought at first, and hence
the change seemed correct.  I've posted it quickly without realizing
that you had already reverted the original change, and hence might
have sharp edges.

> > @@ -327,6 +327,12 @@ int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
> >          dfn_t dfn = dfn_add(dfn0, i);
> >          mfn_t mfn = mfn_add(mfn0, i);
> >  
> > +        if ( done && !(++j & 0xfffff) && general_preempt_check() )
> 
> 0xfffff seems rather high to me; I'd be inclined to move down to 0xffff
> or even 0xfff.

That's fine.  I picked this from arch_iommu_hwdom_init().  We might
want to adjust the check there.

> > --- a/xen/include/xen/iommu.h
> > +++ b/xen/include/xen/iommu.h
> > @@ -155,10 +155,10 @@ enum
> >  
> >  int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
> >                             unsigned long page_count, unsigned int flags,
> > -                           unsigned int *flush_flags);
> > +                           unsigned int *flush_flags, unsigned long *done);
> >  int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
> >                               unsigned long page_count,
> > -                             unsigned int *flush_flags);
> > +                             unsigned int *flush_flags, unsigned long *done);
> 
> While I'm okay with adding a 6th parameter to iommu_unmap(), I'm afraid
> I don't really like adding a 7th one to iommu_map(). I'd instead be
> inclined to overload the return values of both functions, with positive
> values indicating "partially done, this many completed".

We need to be careful then so that the returned value is not
overflowed by the input count of pages, which is of type unsigned
long.

> The 6th
> parameter of iommu_unmap() would then be a "flags" one, with one bit
> identifying whether preemption is to be checked for. Thoughts?

Seems fine, but we migth want to do the same for iommu_unmap() in
order to keep a consistent interface between both?  Not strictly
required, but it's always better in order to avoid mistakes.

Are you OK with doing the changes and incorporating into your series?

Thanks, Roger.

