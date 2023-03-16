Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4976BCF91
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510565.788430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmp8-0002EF-97; Thu, 16 Mar 2023 12:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510565.788430; Thu, 16 Mar 2023 12:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmp8-0002BS-66; Thu, 16 Mar 2023 12:35:14 +0000
Received: by outflank-mailman (input) for mailman id 510565;
 Thu, 16 Mar 2023 12:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcmp6-0002A3-H9
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:35:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcd7d131-c3f6-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 13:35:10 +0100 (CET)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 08:35:07 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 12:35:03 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 12:35:03 +0000
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
X-Inumbo-ID: fcd7d131-c3f6-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678970110;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HM+h0vwGewEfNLLtKd6XiheGsyy6w6t21s0Z7iMwJ5o=;
  b=CLvmTU7ydJ03G57hcyiF9u1xH1dJhiTVK6VWRkeRlC7okZBZGzaocIYZ
   FJ7bhNfwM5nQG2x3+pyfYgyyEVaYsx8HkvyEQtI+daWT+E/MssceJFbEI
   vjq5YbgiXsrSMcL8oy3UlTJuZdV6tiYbHXHnTCWSbQT+3zypjlO4hfbXz
   w=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 101016688
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BI80aKnuRlYZMwK68O5QT/ro5gy0J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWjuAOqnfMDemfNFxaYm3oBkAuZLVn4drSlM/+yw9QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QGGyRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fU1cRMCSiyOvbK7xpyrc7FC2Pg8PNa+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieC1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHuiANtMSu3onhJsqF7N+F4JJxEMbkThoNeliReTd/JgB
 VNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9MW4HTT8JS00C+daLnW0ophfGT9ImHKvriNTwQGn02
 2rT9HB4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:KNfxuqlhb/zVH9LcOOIeBwzQrJTpDfIW3DAbv31ZSRFFG/Fwwf
 re+8jzsiWE6wr5OUtBpTnuAsK9qB/nn6KdgrNxAV7BZmbbUTCTXeVfBOLZqlXd8kvFm9K1vp
 0PT0ERMrHN5fcRt7ed3OEVeexQouVuUcqT9ILj80s=
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101016688"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6kZo5Da5UZBLwDJ0O7gVTXvIngB77q8koe4EhSCmn4ydJWduFFKqRRWpLTSQ/pGO+SxEFYNGHIsT4kdJMDvk3RoE4rMDjq0A8qlY8z4IGx34usObYs9x/eq5a0eoJS7uAVjbR03al3JFnBGpNgSnUVncKqapAGgliY3/GKhgp7ToI43H4Azb9mq9G3XlMyWIuaOsEkjI08qQOj+9WjwTd2QB32fDCiq1lel5ikPwM2jPR/B/aqZZRABiz1nRDbTPDR9Acj89nV7v2K8BxIpP8WBtYP2kWbY2cM0vosgnlrVyY7W68DnDkgnSMJtajBqXSY0pTO58B9VKZhwNyMGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWKj0DgKhsn1FC7rEBrBEVZs80wf/xpxpc3eazY+ljo=;
 b=i06VKc5k62g+jZ7ZO3AU12rVZiu2zVPh25vE668+x1C0A7UXzHLIIAfi/30OL95ARc58RbM96rRZxqx37iCFcvpRkoR2xcAJJWuPl/Ft978pKqyhM91GSJlBrQYdoMJtVgzVam7sOZlF7etxn4WRUV2D8QOBdVv6nxuD3uY64HyrYYFKWwEjk0z0fL5Kv0hBza+XUoJo0/mFE7BcSZAWpigfDnvvsRY7e4fpdmcslKR/5u4Rk6K1hhN00NKn/5NQSVs6mJUrLRrshpbyvdNZzine48H3Vwpb0U+n6yKtBz1g5AyxbGArxtV2a/J0KfVoNSRV0tX+NPgnxfYuSLV8Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWKj0DgKhsn1FC7rEBrBEVZs80wf/xpxpc3eazY+ljo=;
 b=HAf9XKZsxv1rbTrgAfqDLXVP9HDFVc7I7g/KMN2/a0WNgHMEzCw3AlcgK+7l7xreM2462DCCCAJv3MEo5VHg7j07bpyLcdlad0oMemclBb568yNOEGDv6r4c6Di0y264oOUf3Rt0VtdeCQI9ps5wlui0bmTiQEQUYWghmxnbyyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 13:34:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v2 2/5] x86/paging: drop set-allocation from
 final-teardown
Message-ID: <ZBMM8n6SDYn0q3ii@Air-de-Roger>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
 <99270ce9-39d8-1f3e-f922-afc2c0289205@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99270ce9-39d8-1f3e-f922-afc2c0289205@suse.com>
X-ClientProxiedBy: LO2P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 596e04fa-22f2-4eed-05fa-08db261addb7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1dCVLDVELQei35lMk3ZunLJD/EGK8tgGI6precqt0jK3/3nyCIRVfx6B45MTMlYdc8ZQy+4thqeMARXioy+yo4Bff6PykXlNShH/ix+1sKfQi8hQ+Pe5jHFDX9/WTD5oVYa7fnuc0ks982JtRSYBs8h6LzUrau0KgTMCFDNTu0SvU2YJzh30DoFYq7MgzDsVbQ/VZrsjkXWuN5BgQa/KsS9nrWT+yctA83w1Lyc4n2cpwqhNJ5GiETYd7vmQRrMpum+Lr1Qr+U8liqZY5IZ2g0niivzrJEiXEJvCvhJjNSVEHxU7pSLIDxbnPovzTGJn649CPKLDFsWiYDdchInW0QFQx2HqnesJLqcYameeotjsZl4q8qUv+qADODbzH1fbmU34PQyqCFdfvTuFVCzmp+13TyGnFWpAuHck3eDTQRVpzXP0vheuSsvVYcgqZ5IYfh0b7zkS2K4qu95am8l8Na7ycHSvGBFKUb4lKSIZHVpTbBK8XCGx20pXDuYSVeF40T+bSTnd/wzGIR5OSohFwHrqtjlNEMdcfVcYJzVX/i6jNfgR+9vyaXk1fwDAP0ds+FCtJSnNe8RSD7Fvtvv0UsjcL5sTHI8BP6aALNO2juaw6+fC8uII7WCEK78U9wkWDs/Kqa/YxqcgAj7Qd3FbPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(366004)(376002)(39860400002)(136003)(396003)(346002)(451199018)(6666004)(54906003)(85182001)(316002)(83380400001)(38100700002)(82960400001)(26005)(9686003)(6512007)(186003)(86362001)(6506007)(33716001)(5660300002)(2906002)(6486002)(8936002)(478600001)(41300700001)(4326008)(66946007)(8676002)(66476007)(6916009)(4744005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkhtRUhSMU1YUnNXNXZzT2dLN3plMUZmUVBrd3haUkJsdkxzbFcxbWhrK0NB?=
 =?utf-8?B?NEZxaWNoRlVETkRRNmpMOXRXajdNZ1g1MkppVUtHa0JkTmhtNDlBMVpoSURH?=
 =?utf-8?B?aFN4R2ZBN3VIbmpyb2FyR2tLMEx4MUE2aEF3MVdXcmcvOFhmT1AycUdUUjhv?=
 =?utf-8?B?V2FRdjN4N1lxYnlnWDRqSWQ2RVkwb29MSnZjbERSMjFOWWVuTVk0ZmtjVnM5?=
 =?utf-8?B?eDFMNmxCLys5TnhCekRqTmJXQVpVR0lKV3QxckNtOEs0RDg3UDhaRWsrTTlG?=
 =?utf-8?B?SmpHbUZNNVpXVE12anZIV3ZVZzBJU2dqUGxkZlE4by85dUpIREZzZ3lRUGw3?=
 =?utf-8?B?cHZnanh5dk1lWmZmTUx0VUcyRWxtY3B6T1ZaM0pOZFB2dGlOdldWaURIb0RJ?=
 =?utf-8?B?T1Y4bWNxTXIxbEkyOEszdWZJR3RzTUVqMTcxYXdtT0JoVHMxUG10OWVteWZ5?=
 =?utf-8?B?THpkQ0w3YmU0VkdYZW10dXdPdHR0MlF0aUJ1NERnTFU3Z01mb24zNWFGQ2Rn?=
 =?utf-8?B?WjRNUjdwZWhZbCtQSkFmNVZMR2dpTlpFTHd2QnFscS9MWlYrUnpvS3ZWdXZ3?=
 =?utf-8?B?dzlXbElqQ2N1bTFQYnlud2dtNE5lRGNLVjJRQUw2a1NjRzJaUmJxWVZDRHl0?=
 =?utf-8?B?TndPTC9WS245T0tlZ1pLMFpkMjJsRXU5RGM0aFRDb0E2NGxNUFVEalRLdzNq?=
 =?utf-8?B?VU4rSWZSTEhFRE1jYTFqeEJBVDE0b1YvTGdJbWcyb2VlblVSUjM5ajdnVTM3?=
 =?utf-8?B?bUlNMUNCMCt5OTBxWFBCZGp0S08yMmJwRmxIUU5iazQ3cjlzeS9DK202ektx?=
 =?utf-8?B?MDBGaUNGVkFXV0h2M3JVQlc1QWlLaFEyb2RXeUt5dDcyejdmV2VmMS9raVNy?=
 =?utf-8?B?clhuYytIM25rN1d2VTRpRXQ0Mm03YVBJT2JXT0xYaUtNK04zcUJHMWNsOXUr?=
 =?utf-8?B?ZjkxbTQ3Tm43YTdMQ29XT2JzZU1oYVpTSnFFeE9OOTdhenVDTjZ0eXh1L3hW?=
 =?utf-8?B?bmZMdEs0aTgvVll2ZWJtVFNZWTA4OGxuenVETXlvYk9YUXdZcVNhMEJja2Ra?=
 =?utf-8?B?bmJpYVJOeFk0anVLKzBramJUdGQ3SkRKdUlTT0dQVGh2YjQwdlVVampnQmZE?=
 =?utf-8?B?QlR5ZmwxLzljbGo5dmwrM0Rzemp6MUp6ekpUQlVGNWJLODhxdjg0RzdGV1Ba?=
 =?utf-8?B?N0ljNFJReXRrbUlUOVNESEszbERTWjltaFptNXoxS2pDbTk1TXhGS0haN05r?=
 =?utf-8?B?dWJjMkJJVHRqRkQ2Nis2ZXlSN3hKWE5FaGhHMzllby9pMk1CTnhIYVd5TUdN?=
 =?utf-8?B?MWo1S0dJb3JUcVM4SUlkWFZNUzdKRUt6OG9vVndnbWFtZ3VNYm5PZlRWS2Vi?=
 =?utf-8?B?ZnZwVWRYOElyWDd2RmdscDJpYlBHM3RQZm9TNWE3V1JUWmZ1MjRQelJqY0sw?=
 =?utf-8?B?TXFYZW16Y2MrS0MxK2d6ZUprUnkyRXlmT0xwK1cxM2ZkbFRlK2JOR0h1OHQ4?=
 =?utf-8?B?NkFaUkowTXJjSDF1cFE1czljK1NWNHNEdkFaUTJRcTIySjFXbzR2bFNlMDBj?=
 =?utf-8?B?SDdPVmNqRVdQRmU1RmR5Z3YyZy9lVWNNYitvREhxWVNiZlJaM01LbW1CTmEr?=
 =?utf-8?B?bVRJc1JvNFNHaER0MUlIRlFtQUFLaTh3S2t3Q3c2VC9KRkJvN1JwNUg0S1lG?=
 =?utf-8?B?ZzdYMHcwaDg1eFJjeittM1plci9UUFh5c1NFMzNPYU1LbUZxTE9BMGV6QXpI?=
 =?utf-8?B?YkU5ZldiSTE2TFdWcmZCTm5mb2lvTGVFaTlZSTNNS0hnZVN3NHNJcStmM2Rx?=
 =?utf-8?B?cVQ4M0NENXNyK2lIb2YwVTlBVnVKakw1L0J6RURGbGtzZGJ6Nm5BOGhuRk5M?=
 =?utf-8?B?R0R2ZVFmZG40ZHpEN25KbjdBZ2lsa1VhS0taaHNuclFvbkkyV3I5azMzcWE1?=
 =?utf-8?B?djZjQUxRemNZVFpoeDJQc015MU96eDFoakpzdUx4T3lsQ0RadjhLWVVSTkwz?=
 =?utf-8?B?TG9Mc2NXQ2phb2Z0NlY3dDVmV3JVSzJhb2dacVpwMC8vVzlzSk5DUGEzaDlF?=
 =?utf-8?B?L3pHY2ZsR0FJUldKYXlNcDJrL2FnZE95bUg3bUhRaEcyaEZPeWdFRzE3c3NO?=
 =?utf-8?B?aHppb0dXcGVvampCVlVjb3RvRWhxU21tTjIvdmc5dHNuVUZaY09SRnhGaUtC?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WGGDqkpbLVEokZSxmXWqiAtxI6Q2+7NOG9wbPP9mnKRHmqhL1dH7Su+Ksh/0c0WOk6BAIW04paCEiQgDKJH3DcVUuG33nwQPilBhLd09NfRyX0rKsQU0hp5a8MzZH8PgtvfE8Aqm/tyYeuAkkdpglmJUG3KtmWqe+EZJJznB1VNXOr2egTgJ9QhWUqKLsHtY7eBWSMUCYqk/DijEoIQACs5OYojg3wBadoMSOTWsKakNt/XR3SJpXVVk9p5HIDpzizEjXZIvEq5QdtUzA5Hc9IGe57//qASG7bIAPTYYsmr8xr7E3tV32wSiUyAjxPX90AaAHi1ApNju0x9HiU8n8hIayy6oI2/URAdLHIE0MHgWy4nLycGK64BVNiJZ6NByD5KPZ/jjvjatE0O9AdsLj4P/KSxbOfbhOdaSYAJu5917iwJpApi2hqGDgwoykmrKvLMokMXWv68ksFbyIFeyb13sETR1st8SJvLc3HfQniLJ/GFB1YCM4ihS03iVh/MoHodPubjlpSPMEJLXjrgw4dAmO1jfplUfbyAHHsR3EdauYt+UpKvn58OC3ZuwgZ+W0WJIame6vnoS1fkDYk9QgyCN+WQg80f5HWulV/JGm7UQw99qqJ+00tuSb9lC74KRbGKf6OIXXgzJ4Dh4tCFhbpuZzdQ7NelF/QlvzXDzgrp35AF+NH8MdPoejwrNfqPjKZwR9tf1tn25A3AiA7N4a1hjsTbPMdpPa/IL3O6j/MK/XvyYg9o8p9aN7X44bP6MX0ZdmyTPrkdbOc/zE1so8k7qmQKdCqukOPD2Z2ck81fwPwr8a+5nxTI2xMKp01dZip97B3R2BIKH/NL27Ww/tg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596e04fa-22f2-4eed-05fa-08db261addb7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 12:35:03.5071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9DM6WKt/u1516A/iqESW8AUPtfM/1UNQiGztSi/MQDwnOtcCMnxlFGNkszcvRd/3QveAgIscKhRTgCTBi7qQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5669

On Mon, Jan 09, 2023 at 02:39:52PM +0100, Jan Beulich wrote:
> The fixes for XSA-410 have arranged for P2M pages being freed by P2M
> code to be properly freed directly, rather than being put back on the
> paging pool list. Therefore whatever p2m_teardown() may return will no
> longer need taking care of here. Drop the code, leaving the assertions
> in place and adding "total" back to the PAGING_PRINTK() message.
> 
> With merely the (optional) log message and the assertions left, there's
> really no point anymore to hold the paging lock there, so drop that too.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> The remaining parts of hap_final_teardown() could be moved as well, at
> the price of a CONFIG_HVM conditional. I wasn't sure whether that was
> deemed reasonable.

I think it's cleaner to leave them as-is.

Thanks, Roger.

