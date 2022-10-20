Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7F3605B6B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 11:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426331.674720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS9A-00021R-Ud; Thu, 20 Oct 2022 09:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426331.674720; Thu, 20 Oct 2022 09:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS9A-0001xq-Qk; Thu, 20 Oct 2022 09:47:28 +0000
Received: by outflank-mailman (input) for mailman id 426331;
 Thu, 20 Oct 2022 09:47:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olS99-0001OM-A5
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 09:47:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33ca61dd-505c-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 11:47:25 +0200 (CEST)
Received: from mail-sn1anam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 05:47:25 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Thu, 20 Oct
 2022 09:47:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:47:23 +0000
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
X-Inumbo-ID: 33ca61dd-505c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666259245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=QaWL9ZH+AlYfB57gC9TTJMbJfyVyxNkJBtusLwT0/kY=;
  b=G7O6tOvScYEECQCUwIalDplOWJOISIN3OEjBLLIdmXqgcCYQQDCbYAF4
   bfzzqkG2ORI6vLIDV1fQbWrWI87tD9HhwdJXC07WdyBBPWlmIQlgWH1/L
   PSH1vYeKXETYKP+a4sZyH+4CvKdvmZMiJUA4N2RbY+/WNZgBgYAc+v+6+
   M=;
X-IronPort-RemoteIP: 104.47.57.49
X-IronPort-MID: 83565866
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lkx/z6JoCmKKfgjdFE+Rq5QlxSXFcZb7ZxGr2PjKsXjdYENS3mQGy
 2JJXGuDMquNZmH9eopwbY208R4AucTdnNZnSwRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4mtA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FaYZ/vkpHzx3z
 qE/BDZXYDKel8e3zL3uH4GAhux7RCXqFKU2nyk6iAr/VLMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q3T+ftfD2v7lWSd1JD3N9XYYJqSTNh9lUeEv
 GPWuW/+B3n2MfTPkmfbryLy2IcjmwukaNpPGr7/7sVamUGcxUkcKBYyCAG09KzRZkmWHog3x
 1Yv0jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcLpDx2xA2EFSntaboUvssYzHWYuz
 gXRw4KvAiFzurqIT37b7q2TsT65JSkSKykFeDMASgwGpdLkpenfky7yczqqK4bt5vWdJN066
 2niQPQW71nLsfM26g==
IronPort-HdrOrdr: A9a23:POP50KlD7TikpDLkIrQHCH8EMgXpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhR4tKPTOWw1dASbsP0WKM+UyFJ8STzI5gPO
 JbAtFD4b7LfCdHZLjBkW6F+r8bqbHokZxAx92ut0uFJTsaF52IhD0JbzpzfHcGJzWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 T525RT5c9zp/AtHNNA7Z86MK2K40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="83565866"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFLiqwF97r76+iujKXTPn0bxpXq49FfqTelivfw7CL2t22ZS3MPPuxK7YAA+lHSUFjb+jM9ZZWqvpBvaHhnj3wTZFTp2BjkGTfugqYVXzj0tm8pXGUtnng9My4a1/rQN/uql2boYFVz71WSufGGW9cHtE6r9jFkEfW0xvsDpAx25KrcOMERNTGfs9lzhgOR6j6U2Y+nbtrufeaEhV96HSkcyiUoohf/nOnN7cO8OOYM+u8Qda/O8aOSfuRo+A2BypKN21UMIwK20vJM2HhdZ4shznSaHCX7H8sUId0oapvhh8f0pK+PPZAPt+qtijC9UlTyRzwTg0u/STPp2KNZsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYCSSJNqrhzg2jhEg2bewEOFbQS4tBVFIatzBZKv8Rw=;
 b=XPioA4wE6GNz6TDoJIP4UU1vZay1gIhwQi20bph8EaUHIggHloBrf4mbUZ0TsMHYObcRYj8KSsn5HMSXvPviNnuQqgSK592KO1YCPQnIK613PCFjRdCgOz/DUKDWWs3C1vcNmW/30vxJxYO4jJmiIL7Llfp63QAxglCv0BrX4ZdyYdfkhRJ8VAJBTsY2ObWwEjtx+Xh8lBxoBmki0KQr5V8BBmTsgDM4YROdY0L5DVPxolVtV+E55vyFHTsiMUI844F28fYv4xFTci2ZIyDZgTAgGNvwfmLnuVXrhIwnOIt2ilMdJGAoUFTXVSZWTgzLlX/C0gSsKUGqSWovirpHtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYCSSJNqrhzg2jhEg2bewEOFbQS4tBVFIatzBZKv8Rw=;
 b=l+DgvREwbBU6/NpEIlRSDA2L9Wt9P6JbtL3BMjba9Dxa2YLmycWyDYW6Ep3EWup113p5imaRyjWjBQTh05yJYJMV1Buz+lsBcWys+zDRnWLvU6EKTO824klAGEOzWbedj9YJe/tRXt5WeGkBfEtGqqm7ayMG9swxuJW54P7DPpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.17 3/6] vpci: don't assume that vpci per-device data exists unconditionally
Date: Thu, 20 Oct 2022 11:46:46 +0200
Message-Id: <20221020094649.28667-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020094649.28667-1-roger.pau@citrix.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0670.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ec937f-f5d4-4542-000a-08dab2801680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tv/SyzQeRxu/R2Ber9AaOVw41H8SEKQk4zMR3auy+FDhy3HTxycFwa5cRP9kGzPsFUs2hQcyMUqnn41ZUvo48un1Lh5BpdQwvmPm8lapLgA6HGP5syVr0lzm9u2Ibf6nN9Bj6gYQihhwfz435uPvhnEcWPlDxu+4q1z4BFff/C22znLVqOWi41Chbnss9FGiNlB+g58Y5spuLmaVIlfX68Zz0NItD/c53sZ3D1uQtkEY2GOxhrU9ZQlHkHs8db2N2pK2sFcxkacyZDU6d8+fkiIGriMU82Kv+CPBTa3FFtJ5vJzvCFJx2Bz3tSxXOuKNb4R1ht8n2Un2PP/1DkF9Ta2Fg58m1q6KuHr/rdFGHozcs/uJLnzmISZGsONFGqUyOwNRq7586Iv2/iRIBmkyy42Bya3qst7JWKqTSPUUdoLZGndDbO23HghplTNaG7zdtjkT/S9cgXxjTX48qGzuvzLBMj9fgv1GCVit6RrBGrbZugS9RlhzwNIDfLXlqAsiIkva5BCW3WzoLrkNKzwdQNDp4csnZ2RV9oPH/RQcLR779ij6jVHDdrN1wLoGHTe7jhQqWRzlbOlbQM7pX+xGc2YkuoR0Tp5a9/XFQvm85gj2iqnM+NU46lV7mOQ2sY+Fb5hadYyKo73Q2Yjnzk6zPd7UN5NiFBjOe5GCSkrUWmlbCloHSi8HF1uEMglmiha53l8MstDoJ+pe7a26/mMcYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(316002)(6916009)(6506007)(186003)(36756003)(2906002)(41300700001)(1076003)(2616005)(6512007)(5660300002)(83380400001)(8936002)(26005)(6666004)(8676002)(86362001)(66946007)(66556008)(66476007)(4326008)(107886003)(38100700002)(82960400001)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE8yYWkvbGdoM0NtcERYVmdjN3JScWQ0citlQ0NJNHIzVGNJckxQQXJIYVNV?=
 =?utf-8?B?RjhmVHFpNnl0M3h0VE42TG1XSHZ5a2NHclpEbEJvanZucVU4bnVzWGJZaGd6?=
 =?utf-8?B?SHZOZnY3SE5oZWZKT3MrT043R0IzZlI3OGZqR1BQOXZDWjdSSUVLZmltRFdM?=
 =?utf-8?B?Nm1MTm9FNUxQSUx6a1VLTW52QUpOd3IvKzRHNWNWc0dlZDlKeGZ1MURGRXYx?=
 =?utf-8?B?bVVUb1ZqSldzUGhZNjR4VGFVMm9SWTVEeno0anI5MXphcmhlZzFaTjdzMVp6?=
 =?utf-8?B?a0xlc05HN3gxdktGb1J1WjV4UGNoL2ZkZEJpRnFUaEo4VjhMRWdnRm83QXZT?=
 =?utf-8?B?a1E5bU1Hd0crUXY2WFFDT3F1Y0Y3N1ZWWWlqVis2amtWWmNtbi9qaXphMnBE?=
 =?utf-8?B?MWlnS1Q4bnlmbzNHU1JSTGcrY2IwYVFuaFBZSVYzbkRrSmJpMmY0Y1A3Q0NB?=
 =?utf-8?B?K0NHekI1RmkyYjdHa3g2dWltWTR0RnFsdm00N0huUm1QL3ZZdnR1Tk0rNkUv?=
 =?utf-8?B?Z2ZhOFVsVm9SSnZZTEh5RWF2ZzM1cTAyVVZpeGJ0aDdoK29Cb29uMzBEcHZm?=
 =?utf-8?B?K1EwQkc4QkhKZTdhN3hKdkNvMTlxQUtkODZPb05vRFlkRWVGVjZvWlNwcXUr?=
 =?utf-8?B?NW56TG5XWWR0V05TbkJ6M2JlMTQwVnVXWm5NRFp1M0xOcHhZL0JKenFGaUVV?=
 =?utf-8?B?TXBEYXdna1pQanNLMXJLTDNpRmNMTWhKQWIrankrZGJwcE1iTDl5YXVMOUtS?=
 =?utf-8?B?eWtPQnM2V0d2NVM0dWV2YSs3QmpRWE90REdVa3BubzNPZTBEYjJobVVqRWdo?=
 =?utf-8?B?VTZjWGo4TnpPaGs1bXVTZmRUVW1IK0VibUFWUmMyeTZTR0svUmkxVFJCaEJE?=
 =?utf-8?B?TXhMM0N6S1NoSFJpR3Y2c2ZIRCtaRlBxQkQ1THQwSDFNelNtQjQvSUZkUklK?=
 =?utf-8?B?OGNSZzNDL2tHNThyVjRSUG5kNDhIeU03RXRYY2dnTzRXZFU0dXg1UGlwcmpY?=
 =?utf-8?B?RnpLVmRlQkVJWC9oZHBmdWNyNUE5Ujl6S1lqSDVVNnFyWlFTem00L3pDVWNq?=
 =?utf-8?B?NGpFc3JvR1ZJODNyb0pFMWFNQXVKZ2s1Y1lTNUxUTWhpZGFZNzlGRGNSdEV6?=
 =?utf-8?B?SVprOWdXdk5lSmVEWi9rNFBOSzJSOFN0cTNHR1BuTHpUdXJYYW9qQTlHa3BL?=
 =?utf-8?B?eFkyZit0T0dRRkpTU283M3phRUNpTHd4WC9mYWJrM3lYRk5GUmJTZFQvaXgw?=
 =?utf-8?B?U2NvL1dBV1czLzFsNms3UVJHVVUwSUVHVUJTMDRRZ1hBWFY5cm13Rk0rdjFG?=
 =?utf-8?B?d29na3B0S1NvUUh1ZmlLbURDdDJqMkZwakNFOExETGpvZVRVUnBVUFFGZ3hw?=
 =?utf-8?B?WXpYYXlqOUd3SDkzMUpVNnNXQ29uNmNZZ3lQTXFIeSt5czU3MGdCTTRGU0tl?=
 =?utf-8?B?WDEvWUdzSUtzK28zMVNYK3VKZjFYT00xK0s4NFp3WUNBMnFDOWsyeUgxK2My?=
 =?utf-8?B?bkZiTDlUZGVIYjgxVmhGYUF6aTJDZ1FCZU1GVDFkSytKZ3VLYXprc3k1ZGZp?=
 =?utf-8?B?YkVzWThXU0cxc1h6ZUZHbVB2VThFSUZRQzAraGJiRSsxZUFybHlIRHF3NURS?=
 =?utf-8?B?UUkrR09CMm1ZdjJJM290WlhZYlJ3cmZ4dDBDdmtoYU9jd2ZienZ0V0JVSGd6?=
 =?utf-8?B?OUUvZGVYaGtGUDFxaDdjQ21zUVFqNzgxSUwxc09oNEcyWTBNQkFYVExMWnhZ?=
 =?utf-8?B?UDNzUXpKbGVocXBvbUJtTno3L2hqaUJBaWJCSWtxN1F2alJMYWRLNHpXMFJh?=
 =?utf-8?B?eFpFNWVYeHpUQm4rZnROSk9rYzhSNXU1QnlPY2VTZWFCTXJYbEJnTmpaeXJG?=
 =?utf-8?B?L3VVOEMwczBQTHJXSjg3ZkxaWG9pZll0YXJKQVVvUDlSVWJPY29HdXc2eldR?=
 =?utf-8?B?UzAweVBEZzNOcmNmR2ppTVdjLy9BeDlGNlVVQi9qSlI0RDBVcVpmQnRxTk1G?=
 =?utf-8?B?M2V5aS91VE42TXNrR25HSDVwQ05uN1JybG10OFluRXYwT2tFdU1sMmMyRzhU?=
 =?utf-8?B?V0FMenFUdDN1dzhIUXM4dzFtLytudng1Y2Vtb2Z6K0Q3WWJDckVlL2hpVHhu?=
 =?utf-8?Q?8Wa/oP3nvBYzpcUSrcKEzSbvc?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ec937f-f5d4-4542-000a-08dab2801680
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 09:47:23.2047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nT9vngJV517BOFpx84wI3HHxwz44bQckXOk80yg56jFgVUC41PGWlkpe2hVpjg1lE0pogWX1PuZCWTz3nXB5yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6027

It's possible for a device to be assigned to a domain but have no
vpci structure if vpci_process_pending() failed and called
vpci_remove_device() as a result.  The unconditional accesses done by
vpci_{read,write}() and vpci_remove_device() to pdev->vpci would
then trigger a NULL pointer dereference.

Add checks for pdev->vpci presence in the affected functions.

Fixes: 9c244fdef7 ('vpci: add header handlers')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/vpci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3467c0de86..647f7af679 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -37,7 +37,7 @@ extern vpci_register_init_t *const __end_vpci_array[];
 
 void vpci_remove_device(struct pci_dev *pdev)
 {
-    if ( !has_vpci(pdev->domain) )
+    if ( !has_vpci(pdev->domain) || !pdev->vpci )
         return;
 
     spin_lock(&pdev->vpci->lock);
@@ -326,7 +326,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 
     /* Find the PCI dev matching the address. */
     pdev = pci_get_pdev(d, sbdf);
-    if ( !pdev )
+    if ( !pdev || !pdev->vpci )
         return vpci_read_hw(sbdf, reg, size);
 
     spin_lock(&pdev->vpci->lock);
@@ -436,7 +436,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
      * Passthrough everything that's not trapped.
      */
     pdev = pci_get_pdev(d, sbdf);
-    if ( !pdev )
+    if ( !pdev || !pdev->vpci )
     {
         vpci_write_hw(sbdf, reg, size, data);
         return;
-- 
2.37.3


