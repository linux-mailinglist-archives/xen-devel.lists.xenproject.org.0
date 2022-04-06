Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C274F5A13
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 11:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299774.510953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc23w-0000yK-5U; Wed, 06 Apr 2022 09:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299774.510953; Wed, 06 Apr 2022 09:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc23w-0000vs-2L; Wed, 06 Apr 2022 09:34:52 +0000
Received: by outflank-mailman (input) for mailman id 299774;
 Wed, 06 Apr 2022 09:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc23t-0000vH-Kw
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 09:34:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb61019d-b58c-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 11:34:47 +0200 (CEST)
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
X-Inumbo-ID: cb61019d-b58c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649237687;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JhYqmcdLRVf1JaEF9woWJEc7IB0o/2EuT9pc2Y2RXRY=;
  b=O87z2idczSshbEM/NMxVynsvzUHfF7W7YdTdpBIcVkvEFI2xvZnhflOn
   DCMsUR2Z5c226As/raTio6CYS44MiYnSLYmXQEp4mUw5C7w62YM63nTwe
   24dZas/IdC3wfyM9B3UmFaWccQTbvcr61Aq28neDwXNskHWA5NpLl/bek
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68545964
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3/mUQqq4fqZvnklqQr4lMlic2QteBmLtZRIvgKrLsJaIsI4StFCzt
 garIBnSaf6LM2T1Kd52YI3k8UgHuJeDn4JlTgtv/yAzFn4QopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Y2q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBNJLQvslEaxJiEgZmEbFX2JvDO1ihrpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZpENWc+MkiojxtnG3cXMLQ8jP2TmCfmVA9FoXvNr5Aryj2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfRmif8VJMXBaeP/Pdgi12OxUQeEBQTE1C8pJGRgEOkR8hWL
 UBS/yM0tLUz72SiVNy7VBq9yFaGoxodVtx4A+A8rgaXxcL84QyUG2wFRT5pc8E9uYk9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt/N3LsIw1yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT92/bpR/1npPzTyktyhnGfkah9CNne9vwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yT7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfq2MBjatSsIoHONiwM2ITRTOt4wKuBJx+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jevHNCLFGedVbwDmggUFAEWs+lu9H
 zF3bZXi9vmieLemPnm/HXA7czjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9cNokihrc+Rp
 ivVchYBkDLX3CSbQS3XOiELQO6+Bv5X8CNkVRHAyH71ghDPl670t/xBH3b2FJF6nNFeIQlcF
 KBfIZjfW6gREVwqOV01NPHAkWCrTzzy7SqmNCu5ejkvOZlmQg3C4Nj/eQXzsiIJC0KKWQEW+
 tVMCiuzrUI/ejlf
IronPort-HdrOrdr: A9a23:zlA3hqzJwkSfgqLdM32ZKrPxzuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4yGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87heYAotd/lq
 H5259T5cJzp/8tHNJA7dg6MLmK40z2MGTx2TGpUB3a/J9uAQO5l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.90,239,1643691600"; 
   d="scan'208";a="68545964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QILOshNIfOD+UT0biytmXWrQSnOM1OPTGluC3ANWQ/UiMYFuBXlJiIMzvkpXH3CjP0dQn88CTXxDCQ6rZztZ4E3GFybhM8Q+LLE1p1vGx6/01GdX15gmCwPXx/f2ELZ3ZvQOBf04IXqX6KcAopV7vFSBrEkcX9HfufMbgbGHNLPxRUPjAmSdeDaiR7n+Dnzl/Z1xc5XgAyWgCfv15zpTbvkhQH6LrlAkfbb7sWMJp1dGYzlzcTWx2oYZ2kFtPoR7pyZYv2Q6KTIkUQtS/FfFc20k9NpgK7cwA2ivJZLGUz6LyOu2Cg0qfKL/fzoi4gP+tp7APMDSUIaKrbMs2uPDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMq2Ql/ldUUb0OMR3A5GjnGWymWVJx5C7R/0sNdQFIw=;
 b=C8CMOHhUsUvB3uoMykplvypKJC6kiIr4C9JYq+3sVu4yYkJ8Det+K+GzN4HrXfAj2ovIif/wt4SiX/CuUZ0O2pMYoP0IbeEo2khdWxjpahMxtXS48rNTf7rJnYSnn08o00INXRmX4XlBrcR9aLa0V3+B3OOPeoORnvYqr3+WzXy5HVW6zum9vPA7wH4uE5y5QoryUZKxMOJJVnjP/8LhA4neW7ug8p4g/WjS/CYwE1xayha28Lt1LDcE+0zxHX10NgvX/bIeYpNdIFwG6KUS2HZ0fSjhaQ/8YZdRJgSc5Lixvt7KYfHA3nJGRvFObcgtibPmzwa1biiajeKKJpbR0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMq2Ql/ldUUb0OMR3A5GjnGWymWVJx5C7R/0sNdQFIw=;
 b=wIQiGaF7Cj5W3kpZw12kNFOFhgtlghI2FtFWbUkJW6VuEppLJFgAuHZnaD4LWf7Vhs/6ynWenWQot1CdTTn7EYi2PKkFME8VtJl+v4HcalnKXfUAtN2m1zQC9+wtH0rrJxkpRBxqiVd4Er9RiIpFdZDwBq4CGoqH6q62KGU421w=
Date: Wed, 6 Apr 2022 11:34:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Message-ID: <Yk1erGso3rC68m/e@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
 <YkwZnBIOQ/jwzq9Y@Air-de-Roger>
 <39640fec-de8d-0c5a-c9aa-daf83fb785b0@suse.com>
 <YkxkfbNpR7yfLP7W@Air-de-Roger>
 <17163e1a-6598-5949-47cc-eb9734bc69ac@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17163e1a-6598-5949-47cc-eb9734bc69ac@suse.com>
X-ClientProxiedBy: LO4P123CA0494.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63b03ad6-d008-49ca-4522-08da17b0acdf
X-MS-TrafficTypeDiagnostic: BN7PR03MB3604:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3604B072AC15D1C8DC3432C58FE79@BN7PR03MB3604.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1sOJqzOZmqsfa8TXclRrdaEA7Es8l3qDnyy5GwQ8cnEUCpeh1e4w0xZUSeUvxMfP79KRd0cHRgrT5HqhlXZJkvdoAu3S4vkUkBG2qbKGpBAWtIQo0dEgm+D1izmEQkqHXUwEAJIQxiOOrkq3AM9VdTjeCghNJ2pU46N55gC2DZOt48DMmpZh6teTFJmm4VIXaO9XUrD4+RFgtHyYRgGarDqQT99cmmVeHCWPHaBfVwNFjbkiEHMIwKMno4BK9qF5XFrn8Zj0wca9MIyDv97K9xdsWAGF18Avto27u/7yTSpmfqOrmO0uEjoxJFJwYj7RtEBHVmJQVREDs/rIA9H+TLqxiHYERl4ADFOIdBv48YdFqyOjyl8sU30FXHvwblXr/eYBjrSGr44EpD1w8c46RqTsMyGQA0ZEWn8/t2elnE3hMeLVTh1NU1zevshVrlSpUdQMwT3sPOtBaayxTvIpVjFTsagmZVuSiVZ6dwZ3qaqPj9Pb2xsb1PQlh2UT/m9tRSNUlfYdQvg3ulZW3uFsUzPLE/GG6TtXw+6wPalmF+dOfF/rKZ63VR+oSaWsqfk+A5x8O3e6K0wqFPS8CbbjD0mcc91YRF8kv/FGdC3iKkWF3eugQduU5OCpJE7T2KsHK7GzASGzRYBZvutxqFfUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66556008)(4326008)(8676002)(66946007)(66476007)(316002)(54906003)(6916009)(6486002)(85182001)(86362001)(38100700002)(82960400001)(83380400001)(26005)(186003)(9686003)(6512007)(508600001)(6506007)(6666004)(53546011)(33716001)(8936002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFY3S0N2RDZNV1MzY0NTSTVxTUsrditsWU9RYkRhSmM4bkJTc1dzUnlYOFVN?=
 =?utf-8?B?Q01FUHNWVUpKT2dHV0RicE9YNXRUV1AyVjJQQlRqN2F5cGd5SGJvWXgxU1pO?=
 =?utf-8?B?anZucVFJWGoxeE5PQWQ4M09ycFo2M2ZIU1VwMTJPRDNIK28wNXpNeGdNdFVT?=
 =?utf-8?B?dEkxWmhMUERWc21lRnh6Vi90Q2xlQWdZL0plVmZDcC80eVlmRGZVVzFQU3ZS?=
 =?utf-8?B?RHJLb0dBUXN6Ty9pUVNGYlhEV1lDelo5bzhOcFUwbUpWVjl1VlFJb1pGUVRX?=
 =?utf-8?B?bnh1T3hiSW5hQXZLZXpRcXVGaUVJcnhwWUZYb3AxeFRiY0FGK1BURlQ5ZHcz?=
 =?utf-8?B?eE9zTnQvN1BockhCU0Zxcm1XNE9PWjcrZklpWithd2FyMUw0dCttTE5zNHhX?=
 =?utf-8?B?eFF6YXF2c1JjNXBoMXh3dmFJb1BIc2xXV2tCdWQyZUpzenUreWhLb2FEcEl3?=
 =?utf-8?B?THhpei91c1FtTlFDcnJpY1Awc2hsV0ozSFF4TWNkOVA1bG15NTVrNk9tMEZJ?=
 =?utf-8?B?QmJJNlEyTjN2VHd5bGw4cGdTYTJmNkpLVkF5K2lINFR2R0hpT1o3OTVlaS9k?=
 =?utf-8?B?YU84MnJMa2pLcDFpTmdHUkJ5MC9SM3VoRVp1RTlxVTlBSHZURWdwcnlKRGY0?=
 =?utf-8?B?bWxLWkU4WTE3bHo5ays2L2VoWEkyeDNOczFzblU4NzkrWklpVmVYODYvZjY3?=
 =?utf-8?B?WFlwWEx0T1RPN1hOZkN3SWVGdVdjT0FiTGIwZkt4RTBhY1puYWNtNm9HdXdP?=
 =?utf-8?B?ckJSTFgwbVFEVkIwbFVqSWJ3b0l4eFBUWCtHcGVvZ3JYL1RQYkU1TkxkOHd4?=
 =?utf-8?B?U2RQQnlscnZ3VXZ1UDErNnJYVC9LSm1Pb0pBalJSbTRxQzdVdFM2YjNpb3or?=
 =?utf-8?B?WVh4QmJJZUlLUTh3OFpReThnMFlRWTBIN3dFTmtyVEJvenFlc3hmeVFpUjNp?=
 =?utf-8?B?OUd0Z2JFRkw3YWpiYkNFeXpBZUtwYzRheGRCY0tFK21KQzBLREhObnRidjFt?=
 =?utf-8?B?b0I2VFdxcHlrVytGYmdZSURNcUVMZ1NQbkwrTWswV3ZYMmlBbytIdUd1QUxZ?=
 =?utf-8?B?U2hyMmY3MS8wVkpXcU9QTGR4U3JhVnFMc1BKeEk0VWh1NmxaUjR1eldjT1BL?=
 =?utf-8?B?YTYwbm05MkZqd1lrRzJIdnVPU05sL2czRWI1MDFWTWtneTBvaUFRRmZoNzNT?=
 =?utf-8?B?ZmFEdTJqSitQZVduK1ppU2kwYlJuRFpHSm9YUDRDVGNJUXE5YkV4cHQxSnp0?=
 =?utf-8?B?SWpVdHFPMzBEQXZ5UG8rbmFPMjQzUUROY3NSWjVxMEthT3N5SGZZWGdsYjVH?=
 =?utf-8?B?Tzdsbk9VeWhEcnhEaStkUmVLelo3aTFIZmsybUo0MEErQUprKzJ6elYySXg3?=
 =?utf-8?B?b3lDbWYySHg0Rjd5UGZVZjJOUTQ4S1hEa3ovRTZmTWtXRzEvTHlTQ3BUZ3Jt?=
 =?utf-8?B?OTV5TU90UkZXclEzenZIOGloZVVoQVVLM2JqZjQwb1RjR3I4cXRRVmd4TmI0?=
 =?utf-8?B?azBFbHdRRW8rNFdlYVVIS3BlbkVsS3o3cHBvSzQxczJWT05OU3ZBemFSdjky?=
 =?utf-8?B?ZE5NSVV5YmdoZWd3TlQ1RG5uTG5VdTdjL0RYdlFsSm1tMzR5dHZJeFNMMjFV?=
 =?utf-8?B?M3lJdGt6OEpmWkcrT040b0M4bVBEeEFMcFBuVUdOeDZGK1RITWV0RlJLOU5n?=
 =?utf-8?B?WGxadDA3VDEwSVd0ZGpqTFpDZ3BaZWNpdWprUUdLTFJtQys5UmVENjFhb3Qx?=
 =?utf-8?B?Ti9FVXpNVllPTFIzaHRoODlrcU1BWGM4ZC9NL08veW5vZERlQ1I4Zkp1MER5?=
 =?utf-8?B?dkhidWhjc2FxVW9BcE9OSmFsdjFIRWdCcFB2QU55U3ZmRTN5eC9adTV5N1c3?=
 =?utf-8?B?VXJRcythZFBBbjNJZStURk9YcnFEY1FYYm1uY0hka2ZjOXhTdTI5aFpTWmt1?=
 =?utf-8?B?a2lDRk5xWUYrNVNlcU5RazltajF0N1U2eFpBQXFFY2gvMmowdTc5andlYTVm?=
 =?utf-8?B?a0EzWndvVmNHL25Jb2NsV05YaTQ1ZHBsMjhoSisrODBSZUkvZ1E2WkMrWENz?=
 =?utf-8?B?bHlyNWxYVEg1ZE9HZXBXcmdtNCtmcCtqNlJiUmJhYk5IUFc2cTNGQ3VDNlJX?=
 =?utf-8?B?MWFmeWJuM2p1NlJSa0ZxVlJqQ0FYL0ZJUUp5dEMvYmZseDltYlAzSzY3eTlx?=
 =?utf-8?B?TEpDVFBpQmxTb1FCNmNMZkIxa1R3Q3hkVWN0d1gwK0EycTNIVVRFc3dwc0Q3?=
 =?utf-8?B?R2ZvMlBRazJKNWViRzFObTlnQStkUzFUZDk2VDZKVjhoZjd0SVBZOWdyaW1v?=
 =?utf-8?B?MXdQcEs0TXoreWg4UDh6Y0tDeHVSd2t2N2xPMWxMYlZ2MVNub2VoL09wSGdZ?=
 =?utf-8?Q?FU7lb+nrR2zHBI9k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b03ad6-d008-49ca-4522-08da17b0acdf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 09:34:40.9905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymsg5yFZW2o6gpIVSo1gob/0CdBlJyhbe7yb6UbOyzCpwbWOX+Zuee2j71r4WvD79oi2/jiFUrvDXIZfMtu4Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3604
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 10:44:12AM +0200, Jan Beulich wrote:
> On 05.04.2022 17:47, Roger Pau Monné wrote:
> > On Tue, Apr 05, 2022 at 04:36:53PM +0200, Jan Beulich wrote:
> >> On 05.04.2022 12:27, Roger Pau Monné wrote:
> >>> On Thu, Mar 31, 2022 at 11:45:36AM +0200, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/efi/efi-boot.h
> >>>> +++ b/xen/arch/x86/efi/efi-boot.h
> >>>> @@ -568,6 +568,49 @@ static void __init efi_arch_video_init(E
> >>>>  #endif
> >>>>  }
> >>>>  
> >>>> +#ifdef CONFIG_VIDEO
> >>>> +static bool __init copy_edid(const void *buf, unsigned int size)
> >>>> +{
> >>>> +    /*
> >>>> +     * Be conservative - for both undersized and oversized blobs it is unclear
> >>>> +     * what to actually do with them. The more that unlike the VESA BIOS
> >>>> +     * interface we also have no associated "capabilities" value (which might
> >>>> +     * carry a hint as to possible interpretation).
> >>>> +     */
> >>>> +    if ( size != ARRAY_SIZE(boot_edid_info) )
> >>>> +        return false;
> >>>> +
> >>>> +    memcpy(boot_edid_info, buf, size);
> >>>> +    boot_edid_caps = 0;
> >>>> +
> >>>> +    return true;
> >>>> +}
> >>>> +#endif
> >>>> +
> >>>> +static void __init efi_arch_edid(EFI_HANDLE gop_handle)
> >>>> +{
> >>>> +#ifdef CONFIG_VIDEO
> >>>> +    static EFI_GUID __initdata active_guid = EFI_EDID_ACTIVE_PROTOCOL_GUID;
> >>>> +    static EFI_GUID __initdata discovered_guid = EFI_EDID_DISCOVERED_PROTOCOL_GUID;
> >>>
> >>> Is there a need to make those static?
> >>>
> >>> I think this function is either called from efi_start or
> >>> efi_multiboot, but there aren't multiple calls to it? (also both
> >>> parameters are IN only, so not to be changed by the EFI method?
> >>>
> >>> I have the feeling setting them to static is done because they can't
> >>> be set to const?
> >>
> >> Even if they could be const, they ought to also be static. They don't
> >> strictly need to be, but without "static" code will be generated to
> >> populate the on-stack variables; quite possibly the compiler would
> >> even allocate an unnamed static variable and memcpy() from there onto
> >> the stack.
> > 
> > I thought that making those const (and then annotate with __initconst)
> > would already have the same effect as having it static, as there will
> > be no memcpy in that case either.
> 
> You cannot annotate non-static variables with __initconst.

Oh, I guess I've never realized.

> >>>> +    EFI_EDID_ACTIVE_PROTOCOL *active_edid;
> >>>> +    EFI_EDID_DISCOVERED_PROTOCOL *discovered_edid;
> >>>> +    EFI_STATUS status;
> >>>> +
> >>>> +    status = efi_bs->OpenProtocol(gop_handle, &active_guid,
> >>>> +                                  (void **)&active_edid, efi_ih, NULL,
> >>>> +                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL);
> >>>> +    if ( status == EFI_SUCCESS &&
> >>>> +         copy_edid(active_edid->Edid, active_edid->SizeOfEdid) )
> >>>> +        return;
> >>>
> >>> Isn't it enough to just call EFI_EDID_ACTIVE_PROTOCOL_GUID?
> >>>
> >>> From my reading of the UEFI spec this will either return
> >>> EFI_EDID_OVERRIDE_PROTOCOL_GUID or EFI_EDID_DISCOVERED_PROTOCOL_GUID.
> >>> If EFI_EDID_OVERRIDE_PROTOCOL is set it must be used, and hence
> >>> falling back to EFI_EDID_DISCOVERED_PROTOCOL_GUID if
> >>> EFI_EDID_ACTIVE_PROTOCOL_GUID cannot be parsed would likely mean
> >>> ignoring EFI_EDID_OVERRIDE_PROTOCOL?
> >>
> >> That's the theory. As per one of the post-commit-message remarks I had
> >> looked at what GrUB does, and I decided to follow its behavior in this
> >> regard, assuming they do what they do to work around quirks. As said
> >> in the remark, I didn't want to go as far as also cloning their use of
> >> the undocumented (afaik) "agp-internal-edid" variable.
> 
> Actually it's a little different, as I realized while re-checking in
> order to reply to your request below. While GrUB looks to use this
> only "just in case", our use is actually to also cope with failure
> in copy_edid(): In case the overridden EDID doesn't match the size
> constraint (which is more strict than GrUB's), we would retry with
> the "discovered" one in the hope that its size is okay.

Hm, the specification states in EFI_EDID_OVERRIDE_PROTOCOL.GetEdid that:

"Returns EDID values and attributes that the Video BIOS must use"

And since EFI_EDID_ACTIVE_PROTOCOL will return
EFI_EDID_OVERRIDE_PROTOCOL if present it makes me wonder whether it's
fine to resort to EFI_EDID_DISCOVERED_PROTOCOL if the problem is not
the call itself failing, but Xen failing to parse the result (because
of the usage of must in the sentence).

I think it's fine to resort to EFI_EDID_DISCOVERED_PROTOCOL if
EFI_EDID_ACTIVE_PROTOCOL fails, but it's likely not if the call
succeeds but it's Xen the one failing to parse the result.

> > Could you add this as a comment here? So it's not lost on commit as
> > being just a post-commit log remark.
> 
> As a result I'm unsure of the value of a comment here going beyond
> what the comment in copy_edid() already says. For now I've added
> 
>     /*
>      * In case an override is in place which doesn't fit copy_edid(), also try
>      * obtaining the discovered EDID in the hope that it's better than nothing.
>      */

I think the comment is fine, but as mentioned above I wonder whether
by failing to parse the EDID from EFI_EDID_ACTIVE_PROTOCOL and
resorting to EFI_EDID_DISCOVERED_PROTOCOL we could be screwing the
system more than by simply failing to get video output, hence I
think a more conservative approach might be to just use
EFI_EDID_DISCOVERED_PROTOCOL if EFI_EDID_ACTIVE_PROTOCOL fails.

As with firmware, this should mostly mimic what others do in order to
be on the safe side, so if GrUB does so we should likely follow suit.

Thanks, Roger.

