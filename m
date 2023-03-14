Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B442E6B96E9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 14:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509609.785674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc56d-0006oQ-Bz; Tue, 14 Mar 2023 13:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509609.785674; Tue, 14 Mar 2023 13:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc56d-0006mF-95; Tue, 14 Mar 2023 13:54:23 +0000
Received: by outflank-mailman (input) for mailman id 509609;
 Tue, 14 Mar 2023 13:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXSW=7G=citrix.com=prvs=430734c92=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pc56b-0006m7-9E
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 13:54:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5db2f98-c26f-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 14:54:18 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 09:54:13 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6673.namprd03.prod.outlook.com (2603:10b6:a03:398::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 13:54:11 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Tue, 14 Mar 2023
 13:54:11 +0000
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
X-Inumbo-ID: b5db2f98-c26f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678802058;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mkd19be+Ph6fNECjG5UlVvyvbsKqkUygha90H8JjJw4=;
  b=Ig8lyffsII4ftdTKeoV3WetL5cPQ6mJ9MsnLxNw1g8O+wVGnx1672YFn
   z8CveDutzuD7+usiDpjGpM9uyNpGKHbr9qLkhwg4vwzLt+DmwrfrCW3mj
   Z3lB/2ex1eqcB4zkghJ1EMXgacT+MFSSVnhhmdWEQZPJCPpE1H/Re9sSK
   Y=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 100152133
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wq4o8att8ym+JPF97D+7hu85q+fnVERfMUV32f8akzHdYApBsoF/q
 tZmKWvSPfqDNjTyc48lOtu+oB9Q75TSz9cwTwFqrH9gHy0X+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASHyyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwLDcQMRSNqtOM4buYU7NNmOIZI83kFdZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANpLSefhraUCbFu76XArCw8uc1GA/PS+lX7hcNhVd
 0kSw397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIU9x7Z+RpDK2fCITfWkLYHZdSRNfuoez5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr/hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:Ipl2c6jzThv7/4ZXWuZDodji43BQXtQji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAaWSSVPyKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100152133"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B05cpJgBLR57dZNNQDYPsAcNKtByaVxDZTQPUofKCjgvgLGrTej8ImeeosPCbTuHo2z5k4pCUMp4Ox1TbIAM8jL3lv7aOLlJXPm5d6d0WxeiZ8+8ESe8xvC6GwILmDD/BV7i33w1uAvh2dqhm5xN7CEyjk55mUdNzF2vQlQpYMWjd2q0pr/aDkp6Lc2QMtLw5yewSM6oMVrNS6tmIfWtXB+9Ui4hcmLuO6wIGSgQHToVA28lKcGayno9/c/JGydsA+L6HVW2xkURE+mU10eWaw0KlmCBCtzRVDVdk3ST0Q4AkQo9YAJHl4kXENYCifW4xXNIsi2bloUZVddhhSDcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyLtwW1bznW9ueRtDO73KTBnRCp9bOfHDj+wizqFG0s=;
 b=mJ1QQGzSsm9H5AfhdMZjnt/JDnHhxjTP72vQp8aaO0CTNHim4Fh5au2M7nbIDhEYPDsdIDw6Z+6vkuP2GtWemBWNvmUWrhhEf0VjgfmTX6Y2s9KhkxgFE4KpbZWW+f3+UjDgxEG4zEyMWjD8hIJK5doXZ27CfcPt407Habyws3myECHGxPSq66kLdOmnY8iYspz/jqRhDyc4vAW68Xq+9OAGYZ7PP8AQiUNI4XzAyUU3TCZm/aRrYKD3Cy9+H7J2Oz6ngwvLlUgoTWYKu7vjLkzMotDrcp+ABkmXt1wmObIj1jNEv15lSN/2ZzIpQFv3kJ5nXFua+UBxtdBhIudY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyLtwW1bznW9ueRtDO73KTBnRCp9bOfHDj+wizqFG0s=;
 b=ph4nTANzjSs5TNm/+0yBd4pVKVcMxNZlnci+Zhzf4k34aL5Hn+TaBCjX4xCK+ce4a+0oQImhK6oQoZ5koJIp3zbDy7uR10Kn0LIKRybnepASlNwzKSYt85Adzg15FX2P9Zu4WKI/EXMgcezGHTbwHVqo0ANcPvC3gK43fiD28L4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Mar 2023 14:54:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] vpci/msix: handle accesses adjacent to the MSI-X table
Message-ID: <ZBB8ejEi4mBktBpb@Air-de-Roger>
References: <20230314101331.4194-1-roger.pau@citrix.com>
 <d22fabea-5821-075d-07be-7e9378be1b5c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d22fabea-5821-075d-07be-7e9378be1b5c@suse.com>
X-ClientProxiedBy: MR2P264CA0047.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::35)
 To SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: ebac2932-d99f-474f-be83-08db24939669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PAdBsMARepS2fZq8YVIdM06Dlltd80CfuG7TQlc0c4ngapr/5zAvm4LIJSAvOyPlt7mqGG6krdRHKTad+6Vz8S51/gb31yC3eRLq+ZV4W66vqmwofWnDLf9zVgqxBkO+8JNoI8yvtxzsiOWn9TiLhwuU/wraTxkjnHSFcpYxADTabikoQ7IyddMj4+slTO5oj43Lmj1ypsJUEd0V7Nv1DumE4Xpw9YK8jcTxce9pXx9OXmCpe62c0NvpWZya/NgQdyKAy/8lr36Tvpk/Mb7q+tSZrywzn1MkTn2qugJ0qgqlbg2CHtgZDsp/6n6gJbJudGNiahoYfz5/WV2oIyPqctknSgEf4ED2whEfpl31IUpfgUJp7QU8cxf4XHS0CXfNHEX+KTau1uNRYmKpPRG/iFwN41o5gk0vBu+CjybRFVcb+YG50x0B4MUFRmd19AhRy9AuSRwlKpBIszA5QJIqPHsgJFY4WY0/t52LbsyY2TCIYg7uWYl/c1/jukHhQb+3gMI4ER/+33Cte0vj6dKMFpumQxw8fti+Qsgds4t3ZY4mkTilLcG+ohXm4bdcBvunAA97heDJaraJ5bavp7b8VWfTTQLd/7Nb59Ve/2KdkgS1lF5t9JZKMATHLhfROoZ83hK6uM3K+5WO2kxkn50uOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199018)(66556008)(82960400001)(6666004)(2906002)(38100700002)(85182001)(66476007)(66946007)(186003)(66899018)(4326008)(41300700001)(6916009)(8676002)(5660300002)(53546011)(8936002)(478600001)(83380400001)(6512007)(9686003)(6506007)(26005)(86362001)(33716001)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUowcUs0MWM3TzlyWS9ETFdVUzZ5dHFOV1NhM1BwRlBBei80WlBSTUt1aHJN?=
 =?utf-8?B?a0diVUFvb09XSk9vdlRPZEp4RTlYUlNkOE54dExYamRPVGlHMGZWRExhSFAy?=
 =?utf-8?B?aUNvbUw0QzB0dHRCMTdWeStyck5rbjJ4WDdnMW1lK2d6SjlINGNiRmZpSklC?=
 =?utf-8?B?eWVkYWdrTXRzU3VjUGF6K2RUZkJLdWptTnlHQnJvS1NSbEVvdU9TQlJ4MUJM?=
 =?utf-8?B?SUovZzJla25JMHoyQ1U2Y1M1OXdjeVhOd2xlSi8yajRXb0w2cHdzZ3FmVVhW?=
 =?utf-8?B?NjdpTmc2SlRLaUVrRmJWVDdrRmN4RUJCZkttTWxWQ2pJaDkrVWVzRXg5OGxV?=
 =?utf-8?B?OTVyV0pOR25vNE5jWjJFVGVVc0xIdy9CV0U5Z054YzVpZU1nc0FtY0FaM1Bs?=
 =?utf-8?B?eXd1TE4rM09IeFlFNnlSYVJLTEE3VTVzTTZFVUVyajlyK1BtQnE2UVQzWlFs?=
 =?utf-8?B?RGhjS3lCSWs3Z0o1cTk3bFM2VHYwZnVHd1lCWlpqcnU3TGZXbDA4NllhSTNF?=
 =?utf-8?B?VlpPZ1ZzRkdSTUJ6MHJrN2hNUFBrcFhOd0ozSUQ5ZVdWZ0V2UDZoSTRZMjl2?=
 =?utf-8?B?Z2lha2RNSzdSaThwUmtZYi9sZzJsVngzbi9hb3hKb05yRGZUc0VwNXBqTlMz?=
 =?utf-8?B?dFVqSEMwby9kS2ZVSk1JVVRSL0lCdktUYXowNXVJU013UkxRTnV0UEEyTFN3?=
 =?utf-8?B?SC9Db1FzOTZZa2NTbUdVUVBnWHpHdkFGMUQwUG1uRHYzeVdFaXdnNlZVSzl1?=
 =?utf-8?B?NVUxdHhQU2RFRmd5Y3J3aXhrMWt4ekRLVmo3eUU2UERESXplVkZvUU5IK2Jj?=
 =?utf-8?B?S3FFS010N2ZuVkhTTFllRlB4NDBuRFZHdjhKZkZKYW5KSzZuV2kveGZBVTdB?=
 =?utf-8?B?TmEyS29QY1VkOU5lNjI3TDJYYUsxTk02S2hPUXdNQUUxNGEyWU51WEg3T3lW?=
 =?utf-8?B?L3FOaXJ4WmtjcTlmWWI1eTRBZ09TQnhlekhzNHdxS1NtZzFNcCtTdEQyWjVX?=
 =?utf-8?B?dExTM1AwVlBCUnZXbkNhR2tKYWhtd2l5SHJXVzhYNHAySTF3Qy9zL3ZsS2Fo?=
 =?utf-8?B?dTV4c3RJQkdWRFVqZ1VLQnZxNGxEcXdxVE1wc0ZIbW5VSkVSNU9wTXB0VlJp?=
 =?utf-8?B?anh5Wlp3ZUN3NTU1NEJ2NHFuVTRDUlRSaWRCSnI3QW1VNGhqaHB2eWEyb0h5?=
 =?utf-8?B?SkNaNlM0cmVBTW9NVkNDZlNtQksyVUdrcVI0dFQ4c29BT1dpMzV1U0JFN3JP?=
 =?utf-8?B?QnhScDg3WkNzb3NFWVVWbWNzMmNHYzlva2FKaEZ4MGt1T1MzQmt6NG1KVThh?=
 =?utf-8?B?OUU2MHhMSll0QjUvRll2YzY5V0wyUXl2c1paMDUwK213QWVOODYxemJwSTNy?=
 =?utf-8?B?UkNMbDE0dEREaENsYnBXYUxpSEN0MVpubkRxTHQzZHc3Mi9MdmR3MUdXVzNX?=
 =?utf-8?B?bXVsNkxJd1pxVjk0WVBnUFAvVVJmSzlETGZRN0RPWXNWV2diVDhsNWROWFNL?=
 =?utf-8?B?VU4vU0pWT3V4UjJraEk2dks4eTVQM0tpbWNWLy8zeUpWSUQvU3Y3cXRhdG9o?=
 =?utf-8?B?QUgyUVA2UGhOcGtuL1ZTNEUrd3gvUGdmNmZPcDBGMnNrVm5WRS95UEtOOExK?=
 =?utf-8?B?SzF2Z25lQ1dzeDJuM2VSenFKN01oUEV3bC9veXB3bWNyWTNpWVRWMmdsY01v?=
 =?utf-8?B?azhVSlB1ZldDYjN2WmZRWkRyNEVIRE15bCtTeFg0VkNjMk1zTTNhZzY0anlB?=
 =?utf-8?B?UjEzVDR3SmdLYjNoQ1MzZTdtUVgxVTlBWUlJM093L09Sbnd4YisvMklreU83?=
 =?utf-8?B?anQrUnRYaTJ4aE51OWltWkR3YmVMcTFranZCOUZtVTBKRzE4Q0hucFdRTkRp?=
 =?utf-8?B?b1pCM24yRlVRVERUREVWNE1pT0RyREE3Vkx3b1dZM2dwUm9vTlFXd1ZEZ2tF?=
 =?utf-8?B?TVJ5U0RnUUFQMEVsbEJCQWlNWjljeXZJeE5zWTBDWWdwYzdFU2JJRWdCeUpm?=
 =?utf-8?B?UU1sdVBpTGk3clNNUFRtWTFoVnc1ckhWSkdNMFlEZ2VXOVkrUWpHWTRJRWhq?=
 =?utf-8?B?dE9GUGdmdlFIM0xSTWgrV1psQzVGVjB4bGd4RDRtU05TbDRYbUoxeUZCTk5v?=
 =?utf-8?B?NHBPcTBCbjBVY2FQZU5qZW9sM2hSWVdValhvblJ1Mm0vY3JqbW5uSXBxVUZU?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vGkRE2T9yRagytpiHgTYnK4EskDvaBnfAZ8DfnceBrpK/TBaqQn211IQS3rAe7Kr5m+o11IJRPrlRu6S3YOwmlz0b7KbSI6Nopuw++prQope6In7RQnJT1CgIGmEKfuLNOsi+eDJtqaCDPINsL5fSFdRGMtbaaI8OVxB7W96R3pgeG6tRdXp8WzWZa4UCbIFe2WHC8MQWiM6MU8LA+RAL59cWhqKJWBWe3CM9s0pN3ew6vK92fG4y/wA5xQILV6XjRcWOJQ2wT3kCh66Y9mM2gn/i1NZhCw8v3vstS5lNszMDUFI0aV8wzPe+UUxub4Nm/z83drqfUcM9Vd2BV3cX+X34xiryB8UQR9fZ7C6wBYQPnjlIM63jh/bvRXUU9GStIT050VZwHzF1v+EtTPR5ewb+RgrOVZcQjMFVsLH8kQ1f4zXOH4ivCg8bkgybJHcXeCQM4dS3zsfzYQDn/LqDYbgF+cmWgtP/R/FLZ0PUwSTXUyB1+fyrl7HwuVIJAU0iFlOXVxfPGaXvwMYDKUArt61O7l481SJ1snBOX3l0HRbAPiRFS7+uaBxScdOxheIatbkNwjGwRAhHG+ifKwQpDdigg4KH+3D95cKMkkrTqJL/3911tL8qtel6Tny6Dc+DRL5CuIlTESppGUgYjSES6olRS10gUWImtUxiJ/R7KPHT4fXuCFXNmakbqbgBjWzur2FVQLkWLeQFaD+gTMleDWv6l/JJr0iy0mtcNa64f93cQLqgMWsu/TXgp3XtsU3kjUPZFu+SRV4Cb8YkYXvz6Z4/pABycBFYr5b5YZ0wHA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebac2932-d99f-474f-be83-08db24939669
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 13:54:10.8798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4pxKyvSvr1JAT1bDTToXuUNWIrkB5eVQ/N76k0moND110NiIhSSO4rTExU2JyX2kSYcoxgg+a61VqsHWIv6+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6673

On Tue, Mar 14, 2023 at 12:56:33PM +0100, Jan Beulich wrote:
> On 14.03.2023 11:13, Roger Pau Monne wrote:
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -27,6 +27,13 @@
> >      ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
> >       (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
> >  
> > +#define VMSIX_ADDR_ADJACENT(addr, vpci, nr)                               \
> > +    ((PFN_DOWN(addr) == PFN_DOWN(vmsix_table_addr(vpci, nr)) &&           \
> > +      (addr) < vmsix_table_addr(vpci, nr)) ||                             \
> > +     (PFN_DOWN(addr) == PFN_DOWN(vmsix_table_addr(vpci, nr) +             \
> > +                                 vmsix_table_size(vpci, nr) - 1) &&       \
> > +      (addr) >= vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr)))
> 
> While I realize this may impact performance a little, did you consider
> using !VMSIX_ADDR_IN_RANGE() instead of open-coding it kind of? Then
> again there's only a single use of the macro, and that's in code where
> VMSIX_ADDR_IN_RANGE() was already checked (by the earlier invocation
> of msix_find()), so the re-checking of the MSI-X table bounds isn't
> strictly necessary anyway.

I didn't want to rely on the order of execution of the MMIO handlers,
so I would rather make sure that the newly added one would work
correctly if it turns to be checked for before the MSIX table handling
one.

I could indeed use !VMSIX_ADDR_IN_RANGE() if that is clearer.

> > @@ -438,6 +369,145 @@ static const struct hvm_mmio_ops vpci_msix_table_ops = {
> >      .write = msix_write,
> >  };
> >  
> > +const static struct vpci_msix *adjacent_find(const struct domain *d,
> > +                                             unsigned long addr)
> > +{
> > +    const struct vpci_msix *msix;
> > +
> > +    list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
> > +        /*
> > +         * So far vPCI only traps accesses to the MSIX table, but not the PBA
> > +         * explicitly, and hence we only need to check for the hole created by
> > +         * the MSIX table.
> > +         *
> > +         * If the PBA table is also trapped, the check here should be expanded
> > +         * to take it into account.
> > +         */
> > +        if ( VMSIX_ADDR_ADJACENT(addr, msix->pdev->vpci, VPCI_MSIX_TABLE) )
> > +            return msix;
> 
> Is the comment really correct when considering that you don't change
> vpci_make_msix_hole()?

Urg, I was really confused then, as I didn't remember (and didn't
check) that we also punch a hole for the PBA.  That's not really
needed for dom0, as we allow both reads and writes on that case anyway.

> (I was actually puzzled by struct vpci_msix'es
> table[] field remaining a 2-element array, despite the PBA now being
> dealt with differently. But I realize you need to keep that for the
> VMSIX_ADDR_IN_RANGE() in adjacent_write().)

If we need to handle the PBA I would need to take it into account for
the array handling, since the PBA can be in a different set of page(s)
than the MSIX table.

> > +static int cf_check adjacent_read(
> > +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> > +{
> > +    const struct domain *d = v->domain;
> > +    const struct vpci_msix *msix = adjacent_find(d, addr);
> > +    const void __iomem *mem;
> > +    paddr_t msix_tbl;
> > +    struct vpci *vpci;
> > +
> > +    *data = ~0ul;
> > +
> > +    if ( !msix )
> > +        return X86EMUL_RETRY;
> > +
> > +    vpci = msix->pdev->vpci;
> > +    msix_tbl = vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
> > +
> > +    if ( addr + len > round_pgup(msix_tbl +
> > +                                 vmsix_table_size(vpci, VPCI_MSIX_TABLE)) )
> > +        return X86EMUL_OKAY;
> > +
> > +    mem = get_table(vpci,
> > +                    PFN_DOWN(addr) == PFN_DOWN(msix_tbl) ? VPCI_MSIX_TBL_HEAD
> > +                                                         : VPCI_MSIX_TBL_TAIL);
> > +    if ( !mem )
> > +        return X86EMUL_OKAY;
> 
> The respective PBA logic had a gprintk() on this path.

Ack, will add one.

> > +    switch ( len )
> > +    {
> > +    case 1:
> > +        *data = readb(mem + PAGE_OFFSET(addr));
> > +        break;
> > +
> > +    case 2:
> > +        *data = readw(mem + PAGE_OFFSET(addr));
> > +        break;
> > +
> > +    case 4:
> > +        *data = readl(mem + PAGE_OFFSET(addr));
> > +        break;
> > +
> > +    case 8:
> > +        *data = readq(mem + PAGE_OFFSET(addr));
> > +        break;
> 
> So far we have allowed only aligned 4- and 8-byte accesses to the PBA.
> Shouldn't we continue to do so?

I've read the spec about this and wasn't able to find a reference
about having to access the PBA using 4 and 8 byte accesses.  There's
one for the MSI-X table, but it's my understanding it only applies to
the table.

> I'm also concerned of misaligned accesses: While we can't keep the
> guest from doing such on pages we don't intercept, depending on the kind
> of anomalies such may cause the effects there may be contained to that
> guest. When doing the accesses from the hypervisor, bad effects could
> affect the entire system. (FTAOD I don't mean to constrain guests, but I
> do think we need to consider splitting misaligned accesses.)

I was also wondering about misaligned accesses.  Should be allow dom0
any kind of access, while limiting domUs to aligned only?

> 
> > +    default:
> > +        ASSERT_UNREACHABLE();
> 
> Is this correct? In msix_{read,write}() these assertions are valid
> because of the earlier access_allowed() checks, but here you have
> nothing like that. Yes, the emulator currently would only pass sizes
> that fit what is being handled, but relying on no "unusual" insns
> appearing down the road feels risky. Then again
> hvmemul_phys_mmio_access() splits accesses accordingly, so perhaps
> all is fine here.

It's only on debug builds, so on production ones the access would just
be silently dropped without any ill effect on the hypervisor state.

> > +static int cf_check adjacent_write(
> > +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
> > +{
> > +    const struct domain *d = v->domain;
> > +    const struct vpci_msix *msix = adjacent_find(d, addr);
> > +    void __iomem *mem;
> > +    paddr_t msix_tbl;
> > +    struct vpci *vpci;
> > +
> > +    if ( !msix )
> > +        return X86EMUL_RETRY;
> > +
> > +    vpci = msix->pdev->vpci;
> > +    msix_tbl = vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
> > +
> > +    if ( addr + len > round_pgup(msix_tbl +
> > +                                 vmsix_table_size(vpci, VPCI_MSIX_TABLE)) )
> > +        return X86EMUL_OKAY;
> > +
> > +    if ( (VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) ||
> > +          VMSIX_ADDR_IN_RANGE(addr + len - 1, vpci, VPCI_MSIX_PBA)) &&
> > +         !is_hardware_domain(d) )
> > +        /* Ignore writes to PBA for DomUs, it's undefined behavior. */
> > +        return X86EMUL_OKAY;
> 
> Just as a remark: Checking only start and end is sufficient merely because
> the PBA is a multiple of 8 bytes in size, and "len" currently cannot be
> larger than 8. This feels somewhat fragile, but is - like above - presumably
> okay.

Indeed, I was relying on len <= min PBA size.  I can add a comment to
clarify this.

> > @@ -530,7 +600,10 @@ static int cf_check init_msix(struct pci_dev *pdev)
> >      }
> >  
> >      if ( list_empty(&d->arch.hvm.msix_tables) )
> > +    {
> >          register_mmio_handler(d, &vpci_msix_table_ops);
> > +        register_mmio_handler(d, &vpci_msix_adj_ops);
> > +    }
> 
> Did you consider re-using the same ops by widening what their accept()
> covers, and by having read/write recognize inside vs outside accesses,
> dealing with them differently (much like the PBA was dealt with before)?

I had the feeling it would be clearer to have the MSIX handler only
deal with the MSIX table accesses (and so have it's scope properly
limited in the accept hook), and deal with the fallout from having to
poke a 4K hole in the physmap using a different handler.

I will play a bit with both options and see which one I prefer.

> Besides my gut feeling of this ending up being less code, there's also
> the aspect of NR_IO_HANDLERS being the upper bound to how many handlers
> may be registered.
> 
> Or else did you consider registering this further handler only when
> there actually is a device where the MSI-X table has "slack" at the
> front and/or end?

Hm, no, I didn't consider this conditional registering.

Thanks, Roger.

