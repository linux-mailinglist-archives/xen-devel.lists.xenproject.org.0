Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0FD6F54D3
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529046.822970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu8rY-000544-1Z; Wed, 03 May 2023 09:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529046.822970; Wed, 03 May 2023 09:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu8rX-00051j-UI; Wed, 03 May 2023 09:33:27 +0000
Received: by outflank-mailman (input) for mailman id 529046;
 Wed, 03 May 2023 09:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tguP=AY=citrix.com=prvs=48085cdab=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pu8rW-00051K-TI
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:33:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a370b6a-e995-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 11:33:22 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 05:33:18 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5130.namprd03.prod.outlook.com (2603:10b6:5:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 09:33:16 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 09:33:15 +0000
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
X-Inumbo-ID: 8a370b6a-e995-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683106402;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7kyWfYul+N75/GPvgOf9U6x0PuiLzb7N0wkESfsbdow=;
  b=U7gn32TxpdyjxK85FxjUDW93x0XT7OOFX1brSgH9cUu0L/CeOu2/UcAF
   D0CHl0IQjb6/Tk0NDSRhQJ8TbxC6qwFTiJtY9KpnSH6moeT27zZ2GrUWM
   2LXeNm8p740IzAvLOs+YjVohUX4OQGjGCRVbyBBhhzxbdEGRc/V95RoHK
   k=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 107574493
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9GBtEqKTzD/+qfJWFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENShTJRz
 GQeDWCFPPbfNjbxeNFyOoS/9EwBsZ/VyIc2QARlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wRlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5GWFtv1
 fNAMAtRfxHYoMGs4L6cFtZV05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv02bKQwX+qA+r+EpWY66Itw2bDzVVPDTYGZGWdnMu9yW6hDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHYDBeSwIAuoHnuNtq1kOJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNXNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:e3yq9au0g1rG7JZ7IJZFWhSa7skDqtV00zEX/kB9WHVpm62j5r
 uTdZEgviMc5wx+ZJhNo7290eq7MBfhHOdOgLX5ZI3DYOCEghrLEGgB1/qb/9SIIUSXnNK1s5
 0QFpSWY+eeMbEVt6rHCUaDYrEdKXS8gcaVrPab5U1ECSttb7hk7w9/AAreKEtrXwNLbKBJd6
 Z0ovA33gadRQ==
X-Talos-CUID: =?us-ascii?q?9a23=3ApNEZ3Gl3tjV41vLMYiPTjQoYiTfXOUyE9lbwLBe?=
 =?us-ascii?q?gMjp4SeayakWw9IQ4rPM7zg=3D=3D?=
X-Talos-MUID: 9a23:+R31Xgbtne+r1uBTlyKww3JZZMxRv6GFGHEzt6g0v4qkKnkl
X-IronPort-AV: E=Sophos;i="5.99,246,1677560400"; 
   d="scan'208";a="107574493"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h38E4wq066uDdodZCwl2CD3/gjWlD+a2ayXmwKgq9qVX4O1MSqs3lB6ITLW+F+ox3h8S10nWWVFAnPKTYmc/STe8F5XTJBVlBO1GH/BetIjrkbz96u4k9RbN8DNiYPDSXv379LdNtG0W9sG8R0VKERfy0CWKyTzbZUWPRlgl6Zw6Xvjd8hI+DGGVO7c7VmCpi5ZZainiLTuOY9IvCR/PPb0/b3+rC4fglHZycj+0CiN2S3G4jqINPxBdw1K/X/BYbWiBTw9VYro+Bq18YWBxsy3f0WPvm3LYsA10Loyx9CjK3/LjSyoQ1R0MchDgJE8w/MP0ZDG7Z173Xa15ctDTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJFcSxQoVfNgBFA18BFegmC01/OvepmAEyPElUa5FiA=;
 b=KHFFLwYt6WtngYimK6VLe5XR9jylchbIsPf+cNzWCzwU2XFdGqk6H8aKRUPbzVeCWLnzyMaqsPzdrqKQKzudOO3Pnw8A7ox4zihr6XYvNsmvu2/42c9yjXUJ34KKdI3vSqsMovWY3SR1C4F2nrD4xYuREFAjjNxbUPOzpukamakJaBTn3iw8NELU0tdmv1YNrt5oW5bZIsZ1q4kDCko8P15xGGgXb73p2QFGmfvDV8RNrjX3ebpH/T4wlN6e2s/qBl8yw2xTTWzxdvw2h3ei/cNJtSgP7vz/FMMJmyaYeiUfC+JqtWVqq1qACtXUxTEJCxjXiXBcKIFsA6b3AwKp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJFcSxQoVfNgBFA18BFegmC01/OvepmAEyPElUa5FiA=;
 b=FusvH7OS77V7esoJ2zUTQ2EbcL3+5E8DK72xoVlL1jkW6fuvKRYf2Lrle+LvLKronuGb4+//B3+NWl8H/CmM1BJuIf/45Hzr52D97st57ZgHnATFGET6iJPNNSWkUMA86AXv8cAg7n39QOr80sezCYC36LrQtQxzJMIWKu0gbn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 3 May 2023 11:33:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/head: check base address alignment
Message-ID: <ZFIqVcPEwQ6ZkhPd@Air-de-Roger>
References: <20230502145920.56588-1-roger.pau@citrix.com>
 <20230502145920.56588-2-roger.pau@citrix.com>
 <5045583e-8776-0834-ca93-44f85888d877@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5045583e-8776-0834-ca93-44f85888d877@suse.com>
X-ClientProxiedBy: LO4P123CA0526.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 062a9424-83dc-4392-9642-08db4bb96bfc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bobxd91YDYQx0Tw/pV0aYTfHSZTQ3lrM5m0eNQxA+ox4CB9k/MUzY9pSPd3tGZUr+hBK3K0ydOHty9AT5ciit4ClvrHuKy6XStxvgAedUTQPDZZgE0NdyGwh/T4SUVwbaUdim6Tfw9xAqrM5zqVk5QjBv7W7M2Up2GgCZQgU7W9RED4aO/Cqt8MpI1P3QnlCnc2e2LpMB8EdCzXEpZugRLfB17kqMwOSGTPh6tyFKz+Wdh7yDVUihEjc8jbjmpzhgw19Z1mtI55XGWZHMKdNxBSlXjG56MzYBI8epn5qT5Z+w/Bulk1viXh/5zl04FmLf65oloUdSMRrXGBhxfTEzzRKE863b+P9O2T3T5WxMiaUVfomFXilnSUXx+IPV1+IZCC9M4gTi209G7LfOJsG2JPw88xrSHYNFqwKjBaQ3B15sARRIjdbORs7UDW80nHxUc7jUXS4XAm4T+vS1+R08WfdeBd3RMLeDe96V8z3XRUDHZJaYsmKOW6kfiHuEPONluBERdshJJtUt2TTNg5sFrOQo5/ZOMMYVh5CQO3xtGh5yorUh2PGxOIxH0kub682
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199021)(9686003)(8936002)(8676002)(83380400001)(2906002)(186003)(82960400001)(85182001)(33716001)(38100700002)(86362001)(26005)(5660300002)(6512007)(6506007)(53546011)(41300700001)(6916009)(4326008)(66946007)(66556008)(66476007)(478600001)(316002)(6486002)(6666004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHQvdVN6c09pOHBldzFYVzB4Z2tDOG9tMzRCRjE5cTJyMi92Y2s5bkF3VFEr?=
 =?utf-8?B?Rmk1clBkcnR3Z3JkdkI0WkhBa3Y0bmVZcXVRMXRKWGdBRDkrMkFvaktoZzZp?=
 =?utf-8?B?SmdRRDNacC82L0NOU0xHMFBMQVowNUlHSjZSbnFjZnh0cXFUNkFYN25iUVh6?=
 =?utf-8?B?b0xLRUFJVDFRRmhzYnlkdXAwMXk3RXl5MFFqekdubnBCRWdSdGxHOVo1K1J4?=
 =?utf-8?B?R0JpRjErcnMvVW1IZEkrNnowR0tNV0VTY1ZEQ2J4bU1KZ3JqY0RlWjUvaGhS?=
 =?utf-8?B?eExwbkxDaGRSaVg3Q1JtSFd2WHhxSkVuTjFtRjg1cFVyVWkrYnVUc3daQUE3?=
 =?utf-8?B?dU9QOXR1QS9hWlI2RmMyRUNSenR2VHZ2RkxJdXNsM2VXQmFCUzltQXVRT0VF?=
 =?utf-8?B?Nm5JeHg5cHpab2g2Zm1MUE5sSVF4MUR4WUlFeVVqaU81Rnp2anBqTTZ4NFV1?=
 =?utf-8?B?alZjZWl0Y1lldGgxSGRKb015d1FrNXpHSGlZbzV3dmJudkFYaWM4aWZER0pL?=
 =?utf-8?B?WGZGd0RBRTI2aVZTZUpKcWw5QXh0NFl3Y2FhWVcyN0kvd3lLR1J6bVd3dmV6?=
 =?utf-8?B?WXU3em5uWUgzZXgvbzVxcnJYWTd4M3psOUNFVEtucDhHM0xSWlhMdFFTb0cr?=
 =?utf-8?B?SUMwYnRFemJoZDM2WXBKRk1FdFB4VHhvaXE4aGR5VUw3Z0dDNmVick5VZS9l?=
 =?utf-8?B?NXlxNjl1azA3RVZsUmpCQXMzbFRtK3hmNmZLQmZSdkZ3a2ZSdXUyM2dtVTJY?=
 =?utf-8?B?cFdCRDJkSjV6SkxaaWZRUmxMbzlMVG42b3g3dkxaQmV1RFhVQlRoQy9jYzZV?=
 =?utf-8?B?MVVSV0llWGl0ZFV0ZjRDejhpS0h0d1V1ZHRqS1ZkQ2RWSklIVDVicW9RcXRJ?=
 =?utf-8?B?R0M5dGVGby9XNi9HMCtxdTllRVlVNTFKeEpRQ0RWRk5XMnlWTGJJSlp3elp6?=
 =?utf-8?B?V2FvTE5Ld2tXUlNrT0ZZb2xIL0RocHBZOU9GTlpRUVRoaXRjb0VGa1dmL2Fz?=
 =?utf-8?B?eXNJeWsrNHVMN3RPTTVSbW9QUzdjWmw0V2ZidE85a1Z4aHB4cHZmVXRFdEtW?=
 =?utf-8?B?UHBhUXlweGtCSkl5M2lDTDZvNlFleWprKzVvdG9vZkVNWU5wdWpOT05wNzZL?=
 =?utf-8?B?WWlHTzI2WDdtWjR4ZVdTbGdselNEM1AwcmszOURnWkEyTkJsS0dKNisyWEFv?=
 =?utf-8?B?cmFHeTNpZEhpSFFMQUpPenRzdVkwWmh5dEN6bGZqYUpudGdFU3V5amxrYmVV?=
 =?utf-8?B?cVo1TnlQbkJyZ3pzV2grQm82Q3ZXVk9ncnppcUpCT0t6K2dFbm04cVNqUWZQ?=
 =?utf-8?B?bFRvV0oxbVhSMnExUVRLSU9mMW1JZnZUd2szcDVRV2MvNFM0NUkyMFhzV25F?=
 =?utf-8?B?b25vWHFid09rR05LaWs2QUVKZGJ1UkdlZkdPZmNHMDVicEFuTHRxSlVYZ1M1?=
 =?utf-8?B?YUFPS3ZKOW4waXlmQUxmWGxBNUdtdEdDUnJjTzJOQWJWVlFwamFsTU5IOTds?=
 =?utf-8?B?R2JDTHNFMndYVm1YVXJuclR2c2NwUWpmdkV0V3RkMUlVQTdmTXN6ck9QOE16?=
 =?utf-8?B?Y2J4b25rOFlPTlVmZVVUQ05udnlxNVc3cnVRRjNvUmIvQStpL3dHYjRnVGxI?=
 =?utf-8?B?KzZzUnJTc1hERWFTNFByRi9DNThXWmRaWENSZVgvejBPTm1BRU1vbUkrK2VH?=
 =?utf-8?B?RG50SnQ5NWVVZmM4VWtZa21DU0hNc2JMVHJpWjZYTGtHK0ZORFc1Tno1cmlG?=
 =?utf-8?B?OVUvZXUzUXhuUTBLbVZ2eGtDR0hBMkdrT3hucDdiSGJNUVdTbzFoR2VZS2pY?=
 =?utf-8?B?VHlyZytCVm1taFVHSlVzUFIwSzM2N0dFdVJVZCtVZkZSM3lOTVg4VndPVUpI?=
 =?utf-8?B?YVhpMnF3dCtwVEVtVWp2UVJDZTRFSFZYSmxhNXNWOVYwVkpqb09wcy9NRS96?=
 =?utf-8?B?MzJZUzI5QWd4enByUitVMTQ3ZFhSRGtUZG9TamJpVGNHSFlBc3BHdjEreHg0?=
 =?utf-8?B?U0UyWXZmSkFWSjU0OUNRLzBBanZCSEliS29NQlJZY0xTT0JhZTJxTVJFNFIz?=
 =?utf-8?B?T1dUY3ROcDl0NGRsWjlBSEplaVpoeFBXWWhodk5tU1ViUW1IUzZtaVFWN1Fa?=
 =?utf-8?B?aGtydlhUdWtJamh6Wjc1dnF1b0U2dmlCM3Y3dGRJc1hja04xeFlXUzJubU1S?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pOJsr4RIOW8ELRhh7sc8hHUC3SDAkOZHV5PT5WNuAs3gKzRdJlmosNSwvW2di3q6IochLxezE7eKeFZEU6FugLn7u2D8/ITp2GBYJNjLz8ELNUVDtm/++MKcXOlP1rO5F7fJSqfSTml+pqqXcPzSrwNdp4o0EwzSw6Oby5lLBdKXQIAYWfwTWJuqnyj8veuw1rIFjfIl9cFHAm/B1S4bvp06fkZIW5K8OvqoKpu14cqbTKYHTw0Nw2lMEx6YfwTh+3qlGiCIkMzk5rwa9u+dNi+WJkUqeEHvyDU+Ym76OBfx72QZODf5h0lyLPHhb9UOY0Xv7XcZver6cXIh/hwXtwwS/uXLvlhfPT4bK9+/z/mRSejpVXJCVXMsD37pLfzQF+5a3QRpB5i2u0M6LklL3zVz6X1oF6rS2xAev7lEoS06VYVVGHA2hzqB5iAnD4Q/VPvCjAjsj+FZPW/2KdozKFfho5Lbwu0qSuTBJfWxg0wutmK8pVAA1YACpg8vg/pdrVTGH7YvIanfmooJkBhjCj6hKEKVXWzYxdbTE1GI4Z22NIqSsO2pNr2GCUaLP2mlWVgQzgvAfbRnITQa34UyfnXBpfI5++fIaF2aWzOWRmqk326FDAVH7/+6pKaA+VmSKovnEEfAaBtJq2Zi6Kqu3e9YDnhN/2B37LBJ8tALFS+5/fSLXyJ0xRcvQL0bmXZQ16KRBqvcV19allgEvA4LctPJ7LzUHShanB0qPj/qes8EZL38u5ISY1SbUwKu6yIT+e3+q8FeXKQgXqyRMylEphJjj1Cdhh53Vhkzv7DvElG8l7pwXwL4Ye/wUDMvDX4w
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 062a9424-83dc-4392-9642-08db4bb96bfc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 09:33:15.8613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6RMVv8yMGEdEm/iWO0KKivXLa7nubGJd5Vosk3EdtRXnGX7T/N1CEN+76MdrUWZZLY7QLgsZGryNlQ2Yi97xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5130

On Wed, May 03, 2023 at 10:08:20AM +0200, Jan Beulich wrote:
> On 02.05.2023 16:59, Roger Pau Monne wrote:
> > Ensure that the base address is 2M aligned, or else the page table
> > entries created would be corrupt as reserved bits on the PDE end up
> > set.
> > 
> > We have encountered a broken firmware where grub2 would end up loading
> > Xen at a non 2M aligned region when using the multiboot2 protocol, and
> > that caused a very difficult to debug triple fault.
> > 
> > If the alignment is not as required by the page tables print an error
> > message and stop the boot.  Also add a build time check that the
> > calculation of symbol offsets don't break alignment of passed
> > addresses.
> > 
> > The check could be performed earlier, but so far the alignment is
> > required by the page tables, and hence feels more natural that the
> > check lives near to the piece of code that requires it.
> > 
> > Note that when booted as an EFI application from the PE entry point
> > the alignment check is already performed by
> > efi_arch_load_addr_check(), and hence there's no need to add another
> > check at the point where page tables get built in
> > efi_arch_memory_setup().
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Would you mind if, while committing, ...
> 
> > @@ -146,6 +148,9 @@ bad_cpu:
> >  not_multiboot:
> >          add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
> >          jmp     .Lget_vtb
> > +not_aligned:
> 
> ... a .L prefix was added to this label, bringing it out of sync with the
> earlier one, but in line with e.g. ...
> 
> > +        add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
> > +        jmp     .Lget_vtb
> >  .Lmb2_no_st:
> 
> ... this one? I don't think the label is particularly useful to have in
> the symbol table (nor are not_multiboot and likely a few others).

Hm, right, yes, I don't think having those on the symbol table is
helpful, please adjust.

Thanks, Roger.

