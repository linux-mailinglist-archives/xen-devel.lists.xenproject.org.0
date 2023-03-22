Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196C86C51ED
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 18:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513545.794703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf1wz-0003Jy-IP; Wed, 22 Mar 2023 17:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513545.794703; Wed, 22 Mar 2023 17:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf1wz-0003H6-Ew; Wed, 22 Mar 2023 17:08:37 +0000
Received: by outflank-mailman (input) for mailman id 513545;
 Wed, 22 Mar 2023 17:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5r5y=7O=citrix.com=prvs=438090303=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pf1wx-0003Gy-V1
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 17:08:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c8488f0-c8d4-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 18:08:33 +0100 (CET)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 13:08:27 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SN4PR03MB6736.namprd03.prod.outlook.com (2603:10b6:806:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 17:08:25 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 17:08:25 +0000
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
X-Inumbo-ID: 2c8488f0-c8d4-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679504913;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SYrDl2D9DAsJLwqvDY8FqfqcorTOQtVSfbNMyZgdq7M=;
  b=eXp+JnKZ4SGdDa7EJU3Vw+jkzhqq7OBTZrkFSxopBH9sPlsfUoPxjArM
   1UHtxFNvUyP0jkyyN+6fjZHM9nNeFKY/3bc6zTFZQ5OHqdnHfP9LqayXj
   Le/1buCVBRvNr0/bFIgdchGJHdIgqOxXFcw5lWCAQ4LhZAYqGRqsURqHn
   0=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 101263949
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Y4hDnareAq8y8tQh+xyi2LhR65teBmIKZBIvgKrLsJaIsI4StFCzt
 garIBmFOK7cYzameIt+PoS19k1SsMCHzNcxHAs5+yk2RCsTp5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAHMzN0zajc6b/JG2Ye1jg5Ufc8fJEpxK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKLEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpLTuPjp6I76LGV7n0eGkRLeQGGmOKCilO4AtF2N
 G4S1RN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy8qDqzPW0QMjUEbCpdFQ8duYC7/sc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNsmuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:64CDKattBzaWBO93qBqN/wcv7skD8tV00zEX/kB9WHVpm6yj5q
 fe4MjzGyWEwQr5P0tQ1+xoWZPwDk81l/ZOkPos1NKZLXvbUQSTXfVfBOHZsl/d8kHFh5lgPO
 JbAuND4POZNzdHZOzBgDVRKr4boeVviZrHuQ689QYZcem6AZsM0+4aMHfXLqQsfmV77PMCff
 L2jLsj1l7QHwVpH7XLdkXpR9Kz2eEj1qiWKyLuYSRXizVm5gnYoIISfSLoqCv3A1t0sPsfGI
 X+4nTED7+YwouG4y6Z7Xba69Btkt37xrJ4dbexY9YuW0jRY9mTFf1cZ4E=
X-IronPort-AV: E=Sophos;i="5.98,282,1673931600"; 
   d="scan'208";a="101263949"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEp9LaWoeAJUPPydWpBZlQi8uoIEYNeFshH4iUVRjHZfPKatspqTZTb4d3WOxjzItlzk9ZjY0y/UeXoIKKlUQW7Sel3VeTYLzwK/sA3Yy8pgOIdTfpb30gGw1DPf62pFPieofP27IzieMfq+9sfPjlxSUCY6d4qmfCuNAg4YchegHgYbeLOvclL9MitlJHiMBd37/0r10n28p2+7cS6YbpbF11v8rfW02Aoo8ZsYUAWdtWmKLj47nXBZOMRE8prMqVn0twEH/hb+DQaXyvNMggcX8hzqJivn4is9/nT6OPdpGuYxymbbKl8xYgfSK/PT28DI154vWRP8R7/GHife0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkAZNr9qmVtByBj01VaXlRcj66THFNxuvl3AaxLV+CY=;
 b=EBZncks8wLGz/A5JyqG82lru5vPjfU80wQh4DNhsZJ0en7W8WgNMkWgcnEZre4w+Vgvayi+STBm8uo3mKxrrA1r6+0+EHpRcMLhNuddgXDI6PmYjzfqs6CwZvK6+IPTsZOSk7CmVahxUlxOQxZh8Zpj01JRF/YggLSCL0tVuMhK45QHBMIljLtfiyiBy5mq5luXmbwEPpfKP9zKK2WFRT+EiZjEAJp5PgVTmAAqMZcl4IuNZEzZB+xiCo34Wb08DZADyZt8fFu/qCnar3ix/eIJACd+XfaNtIXhnhNUmCAd5KAkOFEETaD37DRQgXUuUPKb165lbKbsUtMjRtdZX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkAZNr9qmVtByBj01VaXlRcj66THFNxuvl3AaxLV+CY=;
 b=JLXs0yPG6G3iDU5bBylFpXqhdvmgGJD58s6DQySymAqu5+xHCJ0qsEcgdGkXtP0FEuLQuVlJczM9jH+ahmYefZtr0jny8HFDdQWP+/7xPobAl6ngGShr187VKtd1wFln9Gf7odxYXvpGbYGoxh45b0xv0iqvkYVXs/jUGC4m0EI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Mar 2023 18:08:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] vpci/msix: handle accesses adjacent to the MSI-X table
Message-ID: <ZBs2BKAfoRap1CjC@Air-de-Roger>
References: <20230322143001.66335-1-roger.pau@citrix.com>
 <0a69ba74-71fd-101c-2f06-2cd6ced412b4@suse.com>
 <ZBs1c7ILtkRQOzki@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBs1c7ILtkRQOzki@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0262.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::34) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SN4PR03MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 6006362f-2e1b-42d9-9ccc-08db2af80c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O+LkPvSIsVIQck9v46Apl11cVSOHbUOnJUzB+sjjtdcBX1X2eiSDtlxbuCwamPWOsQG4fCjx+Wq+Fr4LHI0VoO+qFf7rLDaHQa6n1zjFiILUcwlQ3IPvSMJGPPxT+OBan9ZlWxlqoFH9q+XMlRSyMZ7vcDtGFNcmqt14jj79qbDMfWR/SX4Btb+mN7uuWkXhVQbQzDZXnkBb+t94cp+fClz7uBPwlYeNF3/4GApDFNTGI7KK7psQZWCwT/BQEU0HitqspARBHqxZTLTnn15O6oSQfOtl5DkCj2D/u2CuJPJk6g9hcmtLaD3bHwJaA+LJUshLwScIt2ZYsmm0TcYLee9cY4Zrq3xi3sUno+F9IlFGjMCT3KjTlotWrQEBeGOh7ZndV9D4ucpoXZnzdyk2D4U/JjqzsWAyZP0bVj/EE9xxZ7Af4jOziesv6WrjEsi3x22ABYqt45idhp8SmWkKtxjiE+aQrmr5SER+BbELqAd9cUiFumHe6uoW+UHgxo5j0RyuHajn5Ha4BhAMinwHxCY5cr0H2sRwVB0gcdfWyP3myezg+qrxz8WpiNabJR4pXv7ORqgoVYdqcJ33UvOuXRPent2sxrx8wzeHVL5+GKciQghqPAVobYA/1H44KQ8NbXHFS00m0NwdEdYATPKzdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199018)(6506007)(82960400001)(6666004)(6486002)(26005)(186003)(53546011)(6512007)(9686003)(33716001)(86362001)(38100700002)(2906002)(83380400001)(4326008)(478600001)(66476007)(316002)(66946007)(8676002)(6916009)(41300700001)(8936002)(5660300002)(85182001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFgvemlkSEFYRWFkZEdTUTBLS0pJYjB0UXg1elpZOVgySDUvaGxUUDlkVTlp?=
 =?utf-8?B?ZkJPcVFwZFJzdHl6OVpUME1JZnFWOXA4ZDh1NE1rNjdhM1NCV0V3Yi9tWTFH?=
 =?utf-8?B?dVIxRHo0a2xtUEduZmUxbkV6bDMwTEhSeFVNMjRqcEdCUy9lZ2NKZUJ5akkz?=
 =?utf-8?B?OWUzTkRIZ05KMWIyWEhLUDl1QTdFREJFc2NjdDQwWFNCWmc2RGlTSXRsWnVW?=
 =?utf-8?B?OG1BR0tIaGpVVjhhbGlJeGhiSktEQ2t0WlptaDNzaWNmTmJVNkVMM2t3T2Rr?=
 =?utf-8?B?Q2dxcmUrbTRyemlmbVhFREdSVEdnRUtYYlJNUVJuYjB4NVBtcS93OGNkYm4z?=
 =?utf-8?B?M3A4WVpPSDVpRE1jcFJ2NFdMRVR2VW5tbWlBK3hHU29HWVUxL1Z6cjk3dXly?=
 =?utf-8?B?bEZRaFhoRENEQW1FbzZydTlBMmM3QXhGcVJHeDRuK1NzeFh0WDZRU3Q2MTFO?=
 =?utf-8?B?RHl6T05wQStVZ3VyT1pVcEZCUUpVakFjN3pxRzh5V0tvemFxdTZTNEtLV1JT?=
 =?utf-8?B?ZzUzM2N2bmppUzdkS1UzV256blNJbU02RFlOMXFNTmo4cGNYZnJIb0pHTjQ1?=
 =?utf-8?B?YUgvL1gxbnVnODlWNnFlTGJOSU0wRkppQ3EzU2NjUUJXSENFcGhMVEFVUmNB?=
 =?utf-8?B?S2V2ZzNRbWJUSERxcGxrMEpJcU1vdWVCWXBRUlBNS1JUNVhGL0NCTG1FNjFv?=
 =?utf-8?B?T1lGTFlDdDBWTnNrejB4WGlCV1pBbC9OV2VPNzVUcWIzekwrVEpSK2JIWUdI?=
 =?utf-8?B?WTRoZVVyZFJtbE5ybFpSQzYyVjI0MTVxUWJuWnM5SWVXN3c2Z2JjNGRDdkhJ?=
 =?utf-8?B?ZGdPZWtESC9qU1J5SHdTNnFuUUVRci83UUtlWkhpc3UrbmFVb2l6UnBSczU2?=
 =?utf-8?B?b1dkdWdIenp4NjFNRi9aRXZWR3RUbUJaQUtDVG1xaExkNkxCMVJHZmtIb2w4?=
 =?utf-8?B?bVF3RDhsVnVCV0d2ZGhtNGNPL2xJUGtDQ0xka2ZzV1dRYmZBYS9zUWpIdllS?=
 =?utf-8?B?Q3VqRUNPa3RML3ZIUldwdXRBRGY2QXZYbWdqdGFDYWN5RFcyTk5VcDVobEVZ?=
 =?utf-8?B?NG9IWEhLQnZiNGc3VUt1VlpobTJ6c3F0ZzZGeE54RjhPTyszdVBTWWxEM0J5?=
 =?utf-8?B?YUVPeFBvUTVaUzkvNEFQOWg0OWt6YXdKZExaOTNPNDFiQmhPOFZSaStTNGlx?=
 =?utf-8?B?N1ZtT2dFSHQ3M09LSGJtSEhTaGpGc0syOSszWGpYWjZnUmZrbjIya1F4T0Fs?=
 =?utf-8?B?bk1sdExTeFJFR05kVzZyQSttaTVIa2xZb2FwK3BsZ2ZFRDUyanIvZjdFcVpF?=
 =?utf-8?B?eWc3SUFKZElHdWJ0eGxuNWgxbXZNcVpERlVtZmF6NkdUb2RrRUNsa2RSUU1w?=
 =?utf-8?B?UzdpMnE5SHVTR21RTmtlVjlhR0MvNlRLR1V2b2kwenBZU0p4VXFCaFlyNzBs?=
 =?utf-8?B?TEwvc0twRkxIMjRXMVhUOEdHb29VNUM5WTc5S1kyYWJnODBieTB6RlNkNFdX?=
 =?utf-8?B?bHRSU2ptZG45RlgzZXBYRWVQQlJQa2lBbFJVbHVUcHA1U3FEbmxsVjk4R0hr?=
 =?utf-8?B?QUlUYVBUVWVFaENFeGlnUFJmSU1ZNThnLzdOQm8weVpuZ1F6dnJLVnBmYlRO?=
 =?utf-8?B?YW1XTGNMU0JqY2ZHTERMKzYwVDZEVTNYbmtXNUFQL1BUeE9wS0tMRTBrRjYx?=
 =?utf-8?B?ODNLd2QwcU1XNm9GSGJETHlES2c4K3Z0emVhcnhRV1VYbTErR21CUkdwQjNn?=
 =?utf-8?B?TCtRQ2ZXc2N5UlljNXBnWnB2Ty9peFVIQk1jaC9aN1Z4OEhXd2EvSU4vOWFl?=
 =?utf-8?B?M0hndDltTXNGcHFUcSsxSFNXeCtwWnRvQWtSOERTZ2FGdTN6cGZndGtTYU1h?=
 =?utf-8?B?RTNHdzhTWUhXUktRdFg1clBNNjFKWXV1OStsTms1UW1aTTI1RFNmZ1BWVGNV?=
 =?utf-8?B?Nmh4cDhoYlpoNFFBTTBkVml0bUpVMUNacC92eFQ5U0NUZVpCb2Qrd1FMMnFr?=
 =?utf-8?B?dmhIQ0w1azJwZU1McWFJc1pxZjQ5VUY1K240WFZKQk9BL1lwanB5RnZsZWdY?=
 =?utf-8?B?dDA1R2hrRysrSDI3QjI5Z0lrQ2RxVkZsOWhGanNVZ3FPclp0Z3B0elBBVGpJ?=
 =?utf-8?B?NzBqQ2hsUzg4MEFVdkU5b3V0WC8ydmJPSytkLzRwU2RvTlB3VnNTU3MwVlVi?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EzQyHCpa+nKo98CB7sQ4/zRvkzgc4hLjtDA6aAlyPYB31dEqaJDtKBCSajxeZx13mYvGLhwJs8XZjd64VJntZQTC7IqQqeGKyfMgeIsj/zpEpUUzz+fLcqt4fB5tjQVdc3Z5p26wr9E/kuvK6/hqsq2+QH2fM8OI1Zf8DJYdXwrE/BkFc/TMgFKm0IBAj66krsenJ/gwis/NJHd0Zn5LUhAeAv0a3VaaWmwn8HzTSZ/xo1iWPwj9sR04LnQkGS29ea8JrL/czAjBZL/qs0Z6OmaP1xn0D93nUczaz/cqpiVWlOCu75ShgWBEVk9d8VG5TUxN7aCsBhvHJVUk90mmHFj21H1yDyiVVyMJDKlpGGL+QN17XmFgOCGxc2txCP8ZqQ+KeJnY1Mxts5elY8qEBxmOnrvpEJF1cAaRDW8vD/BcilnWe9T+fiWEd14tRvDu7d6L1puulfiXwvXelnXEukWZY/5uoEgVA2gfRvruP8xUcl8vkziR+giXXEWoGUxg6qcukGbSoHY93KeWtFA2vvW2TcPeJqA3mmnBrD3JkSbFFMNBglfW/3eHg65nZbp9/EKIF2z1FHMJVKfAYAk1nvMhLzP5HOMtxolCU2+4HU9tBLJUgK8y/TTBTkEngN1Fj+E+BofM7kCzNpiIK6GqCjNTAWfycwumaCHVgunRaUG19aIL2RUmoLrFoOuEkIF7aU5XEeFRt8No0J13eMA8oAbQNkF248um42ULNmgY5lt05Pg3qZsxwJ+eAPYoZms24EoJFjJ4YbXW55l1qnjRzuFy67J0v9L02X8N0DiXPkk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6006362f-2e1b-42d9-9ccc-08db2af80c7c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 17:08:25.5149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsloPDyYgQMcFdNYWe62tK26VsszcN7IcGGVsaBFeBM57edr3Gqy1T65ADewNCwW8yeT4glszuNKOzAP7ZWM/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6736

On Wed, Mar 22, 2023 at 06:05:55PM +0100, Roger Pau Monné wrote:
> On Wed, Mar 22, 2023 at 04:14:54PM +0100, Jan Beulich wrote:
> > On 22.03.2023 15:30, Roger Pau Monne wrote:
> > > Changes since v2:
> > >  - Slightly adjust VMSIX_ADDR_SAME_PAGE().
> > >  - Use IS_ALIGNED and unlikely for the non-aligned access checking.
> > >  - Move the check for the page mapped before the aligned one.
> > >  - Remove cast of data to uint8_t and instead use a mask in order to
> > >    avoid undefined behaviour when shifting.
> > >  - Remove Xen maps of the MSIX related regions when memory decoding
> > >    for the device is enabled by dom0, in order to purge stale maps.
> > 
> > I'm glad you thought of this. The new code has issues, though:
> > 
> > > @@ -182,93 +187,201 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
> > >      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
> > >  }
> > >  
> > > -static void __iomem *get_pba(struct vpci *vpci)
> > > +static void __iomem *get_table(struct vpci *vpci, unsigned int slot)
> > >  {
> > >      struct vpci_msix *msix = vpci->msix;
> > >      /*
> > > -     * PBA will only be unmapped when the device is deassigned, so access it
> > > -     * without holding the vpci lock.
> > > +     * Regions will only be unmapped when the device is deassigned, so access
> > > +     * them without holding the vpci lock.
> > 
> > The first part of the sentence is now stale, and the second part is in
> > conflict ...
> > 
> > > @@ -482,6 +641,26 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
> > >          }
> > >      }
> > >  
> > > +    if ( is_hardware_domain(d) )
> > > +    {
> > > +        unsigned int i;
> > > +
> > > +        /*
> > > +         * For the hardware domain only remove any hypervisor mappings of the
> > > +         * MSIX or PBA related areas, as dom0 is capable of moving the position
> > > +         * of the BARs in the host address space.
> > > +         *
> > > +         * We rely on being called with the vPCI lock held in order to not race
> > > +         * with get_table().
> > 
> > ... with what you say (and utilize) here. Furthermore this comment also wants
> > clarifying that apply_map() -> modify_decoding() not (afaics) holding the lock
> > when calling here is not a problem, as no mapping can exist yet that may need
> > tearing down. (I first wondered whether you wouldn't want to assert that the
> > lock is being held. You actually could, but only after finding a non-NULL
> > table entry.)
> 
> Oh, yes, sorry, I should update those comments.  vpci_make_msix_hole()
> gets called before bars[].enabled gets set, so there should be no
> users of the mappings at that time because we don't handle accesses
> when the BAR is not mapped.
> 
> Not sure whether we should consider an access from when the BAR was
> actually enabled by a different thread could still continue while on
> another thread the BAR has been disabled and enabled again (and thus
> the mapping removed).  It's a theoretical race, so I guess I will look
> into making sure we cannot hit it.

Hm, maybe it doesn't matter much because such kind of trace could only
be triggered by the hardware domain anyway, and it has plenty of other
ways to mess with Xen.

Roger.

