Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCEC6F4060
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528424.821548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmXd-00073o-V3; Tue, 02 May 2023 09:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528424.821548; Tue, 02 May 2023 09:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmXd-00071I-S7; Tue, 02 May 2023 09:43:25 +0000
Received: by outflank-mailman (input) for mailman id 528424;
 Tue, 02 May 2023 09:43:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJpR=AX=citrix.com=prvs=4790f2855=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ptmXc-00071C-Th
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 09:43:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6e2a9cb-e8cd-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 11:43:23 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 05:43:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6526.namprd03.prod.outlook.com (2603:10b6:510:b6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 09:43:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 09:43:18 +0000
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
X-Inumbo-ID: c6e2a9cb-e8cd-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683020603;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SqrnxB1FHGf9zwSPosA5wTrIkQF4vLRLE1zeU49Fi80=;
  b=Z8gbEux+3tQy039Ju48KQH0wPgsG5U7kUFVmNqWgzbAvOA9xdJzI7P3c
   JVxdmXLyViIwNNSHAbZxC0uG/f4zsA0IWSlgpDErJIEobEsZDonKP4BqR
   jrLpGc+96Ddeu15A94QhiEyc7piRPcAphNBHdzabutsdEQZ0Zf0uTe3uV
   E=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 106877086
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iZ+TGKysO+xm+jKOPJZ6t+caxyrEfRIJ4+MujC+fZmUNrF6WrkVTm
 2JLXDuPOazeY2L2ctF2PIyw8k8A75+BnINhGlM4qyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPaoT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT1B+
 tdGDxkgVRyGg92nxoOdW9J0ott2eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQpuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiANxCS+LgpqACbFu75F0sCTsGeEWAotKGh0+jauAGd
 F1Kw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptPl/4c6i0uXSs45SfbtyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:+gkPba3ShLyJWOJP9nScEQqjBfdxeYIsimQD101hICG9Lfbo6f
 xGzc5rqiMc1gxhJE3I+erwSJVoj0msvKKdkrNhSotKOzOW9FdATbsSoLcKpgeQahEWmdQtp5
 uITZIOcOEYYWIKxvoSpTPIWerJ7rG8gcaVbM3lvhJQpTgDUdAG0++SYjzra3GePTM2YabRd6
 DsqPavxQDQCkj/Nf7LfUXtNtKrz7an+P2JAH52ZCLPqjP+xQ9Ax4SKaSRwtS1uJw+nr41Sh1
 Qt3zaJk5lKcpmAu33hPzi51eUYpDKt8KoEOOW8zugTNjHmjEKJSe1aKsC/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwhRf2wQHv3Bsn9nenkDaj8CPeiP28YAh/J9tKhIpffBecw008vOtk2K
 YO+26CrZJYAT7JgSy4zdnVUBNBkFayvBMZ4Lcupk0adbFbRK5arIQZ8k8QOJAcHBji4IRiK+
 VqBNG03ocSTXqqK1Ti+kV/yt2lWXo+Wj2cRFIZh8CT2z9K2Fhk0kox3qUk7ys93aN4b6MBy/
 XPM6xumr0LZNQRd7hBCOAIRtbyInDRQCjLLHmZLT3cZfw60kr22sDKCYgOlbCXkMRi9upjpH
 2BaiIDiYcKQTOwNSXUt6c7oSwkQw2GLHbQI49llspEU4bHNfnW2B24ORETevSb0rUi6+3gKr
 KO0cFtcrjexC3VaN109jy7fYVOJnwXV89Qnt46XlaHpavwQLHXig==
X-Talos-CUID: =?us-ascii?q?9a23=3Au6oNtWo6yOzObBVyo8Zr3u3mUZwqfVaD6179GEO?=
 =?us-ascii?q?9DVl4ToyzWGSI3Lwxxg=3D=3D?=
X-Talos-MUID: 9a23:2CGbMAkQlv5Otoj+uUjBdnpABfhpxbSDFnsOuqoLutS1B3UvKmmk2WE=
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="106877086"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vcn2R3zHW7Yk7eCf2+geCobSmlIBLWoztBjE51PVNQGH1okYj3h2698Iu3mRk+GPhpT7BFkhuoKoEL2p6BZQWNezUHyVs7dvmMQ35QwCeq6a4i+FbtUvLEsawiExBqt1xmoNc5yQb85XVM+yxoM0KY3ZOosCUKxcBEv5gwSKDfE5y+dEoAcyNrvxDkPAVeSm0gUkF3BBzZdUFzG668nYUDe47qCo/BahMGHV5sqwux2IAI6eos56Hf99J27Im+jpAeBuO7lkBnWJ1O1msJNBANek1T4XLo5DhnGeeTVqwv9m+ZTts1a1ixnxRrj5qC0NRkzICa0JwyTey+BnPJnWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/ohsvz7RMYZ/9dWDuDSvtZTZRcuZhJhikCKGjbfp9M=;
 b=ijOuBBMk0c71m43wZbFuuiKP8ae9/PULpH2zcthzKUVxQdCVhjfmMx8BiebxI/s+4Bu/aDa1v/OlQ1Od6SZ4lwnV+uV87f1AvT2KYwMfIJdGmKZwD5ZWoU8n++X+bDOn0yrPFRsstChtGb+Ls09/lGsWt/Uwj7NQSWHH5icsKwtFMox6uPFIj0IA4HpgQ7fsSk2ocsxCPJ81tET4/pV7nof5ziuF0XaytSDHwpTLp35vH7+yFeMnWRfCncj6904M2ULMl0T+II33VnS5HxJH9raMKT1pAXth3/0hLCKCNdC+IBqpe5UhRbadgaPXYz6OllAZzZddm71/HsyfOWbqbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/ohsvz7RMYZ/9dWDuDSvtZTZRcuZhJhikCKGjbfp9M=;
 b=YQykTkpwG/5Jd7e53JYnlGV3j3MFSztUhiE674oqoyN8TS/Hk+nVR1ePSiuvQsp6ff11GoekWXkKarwkMaErXfObHAJFjhl+rijNtt/OyKYL77pYpeNacExbF3ti6kl7i44msondXkwoOjuziEdLbe33ZRWAuHHAsPBAsVWcj1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <11b24761-9268-e647-7316-0bffb549ae6d@citrix.com>
Date: Tue, 2 May 2023 10:43:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/trampoline: load the GDT located in the
 trampoline page
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-3-roger.pau@citrix.com>
In-Reply-To: <20230502092224.52265-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b78b9ed-f411-40b1-feec-08db4af1a8eb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b+pmVU6BAQoYmnilQ1Y3dJZU9ngm4iugPpLPT2GOUiuQTuWtyrIYWulh6Wupzy7dlgna1BrcryknsfH15KjaMNIVLoKvcPu06kMhCkRBwHbmbvwLr2+yqTCYfpZ/hr4456s8WkwGb3F09rKnzcYtH4EeSk61y/wmNCY9xxXFJvPaX1IxSQ6DrWQnswTSDEFDP+nFQK9yUUH99MWuIG9MyKhGu2fwI/S7FilKP7sd6pCTe/TzNDKv2xjuXnDEIC/bp67IwxrzA8ixdKe1KOzqLmtRMiw4/xYhWv033ePqxKwQ15rvLckyYZ2UK4bFZQp/ZO88O7654yjlfngHnFOL2TNoaEs4M/KTrqLqnj1BQVy9k+Fg7Q7MNQ34RWfUQEC2yuCcpCQ6MLFla2fkN3+0j7ZgPn+CClZCc1CoBwA6ueeK+WTf6526b8Lbsy8H5bk1okRhLUN6NVQKi9SwpXeoc3Qw3X2RlCVCuMghjROPXWzlvlalwbmu8DlQpijChbiFEmXcVsjJq7bnV91ultPrFehLOm09BXwRAysOZf9HTqbdMhvimG0tmm6iLzpMy2FgyyVDMYsHTi2mbo/q12o8bzHbfaURJ+c3iEaTk8hfK+8JEReY8odVvYGi3iLPVu7kyNu5jZhNBdK/SIwdovBe8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(53546011)(6512007)(4326008)(316002)(2616005)(6506007)(41300700001)(26005)(54906003)(478600001)(38100700002)(66556008)(6486002)(66946007)(6666004)(186003)(66476007)(2906002)(36756003)(82960400001)(31696002)(86362001)(8936002)(8676002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1dRdjhwalpmREo1N29mTWRRdmFSeWIxR3lCL3RxbUxPVzBxVGZ6L01JNkt2?=
 =?utf-8?B?VjNRcVdNa3ZRVGk2dUhhQUlhdkNzckhDZzNyTUhDMS9MLys4QUhaZ3A1aHYx?=
 =?utf-8?B?RzZkTUxwbEpIdW80OEwrZFRHWHhSQUIvQUQ2Y0Z6NGduS2xoWGs2WXBZNEN4?=
 =?utf-8?B?QVQvdVlnYVZvZ1dKaTFRa0RsaGVuaGNGbTdDQ2xPUHRLV1U1c3pyMTN1YWhm?=
 =?utf-8?B?TW1BVXlZYTVZRkJkMGZHRDk2YU44MmxNcTVtYUphSy9lR3M1WGVFVi9xS1N2?=
 =?utf-8?B?Qk9PSk9nWHhYT2w3aW5LZUZObjhJdDRtakhyelRzNUwvVlg2RUsrSExmckQ2?=
 =?utf-8?B?YkJxczBBRkorOGdGYldRZUU3NGNjS05NRHdRVUkwbTY2N3R5K1E5ZWFmTjNS?=
 =?utf-8?B?OWRJckQrVUsvVXZiS3VpUmt1bnNBdG1wYlNLS0FVUmJxSkY0c25iV2M5MXBV?=
 =?utf-8?B?T3YwOHpuMGx0Y2hoS0dDR3ZqSFhZcGhXTHRWZXZoay9iV3lIY1ArSWlMcFhD?=
 =?utf-8?B?aE40K0ZrVmFyNmZ6OEV1QXhtK2ZvaDN5NFVYcnR4OURmd2xGK3FzODU2Yk5u?=
 =?utf-8?B?REMzT2gwUmNZN1BHekRVVEhMRFZkclczZHhISTF5RGQwOUI3dzd2QU56U09Y?=
 =?utf-8?B?dkxIdGowUitKdnk5VWhEZHhwUjUyakJUakc1WUEwUmF2Y3VOS0JYWUNld3lo?=
 =?utf-8?B?SDVMSkE0NXlvZUJYK3QzYnBsTEIweWNlZGlRb2JDZjd3ZDlSSTd5TVhqTlRw?=
 =?utf-8?B?dXc1ZzFUblcxdW5VczZvRHJDT08yVWlPSkY4Y2RuUXpNbG9icC9jQkFmRzNK?=
 =?utf-8?B?NmlJcVcxbHo0MUdiT2VxektWRTFheXl3eFc2N1h3ODR3OTZ5bExJVm1aanhl?=
 =?utf-8?B?YWJ0dFJ6ekZkd29VOHJGWDZSNEF5L0VRL3NNTTZUTzdMekNqUk9KUWx6a3BH?=
 =?utf-8?B?dm96WGVlSkY3bFU0TlRlM29sTnJEU3BTeXErSDJpcmp5TVMxeVFSdGdaUDgv?=
 =?utf-8?B?N09nUDd1R2JTaWFFQnVTd2sxV0tUMnBJTTl2RDlGdzZLVlN2cEpJeWNMNnhy?=
 =?utf-8?B?S1FiTGxqajBZUVR0N3lQVXhXTnFWRHBMZWdUY1J3bXJEeURUY0hhU3lLVWM0?=
 =?utf-8?B?U3VjZy9pK1BkUkh6ZFk1bmNWZWszc25BN1k4dWJMcFZidmIwUkI3SnpBdi8z?=
 =?utf-8?B?aklabjVoWlpjM1hUYXV1bFlET1ZCdTdRSHdJRkdxK3puTEZQTkpCdGo2YjZo?=
 =?utf-8?B?YjdxUG94ekcxVUxSMzArZWs1S0tkR053V2x4WTVsYTJzVnhVeWhTd2o3MU1U?=
 =?utf-8?B?V1ppNk5qUjJKWmpWcm0vT2VGb2U1UHh3bm5Uc1QzOGhuQnA5cmlHd2xyMmQ2?=
 =?utf-8?B?NDlpNzk1WTBPKzBKdkxYTkpSQUl3Q2ZKc2cvOU9kRjNmNk1VSWcxalNUWnc4?=
 =?utf-8?B?NmRsQzdNU3FXR2FFaGk5alhRWHE3dk9VL3ZOWTZsdkdSeThyNHhFdFFVQ3hu?=
 =?utf-8?B?Y082ejd1QjQ3Ty9USjFwY3FiM21FQy9FNHBRa0htQ0tIQnltZlNyeENSeWlM?=
 =?utf-8?B?MG4vdzNCSkRnd0FsUUJpZzBKRVVRaFk1blpnMUkvQlpkcDR6aU16VzRaVGt3?=
 =?utf-8?B?OXBQSWJ2WjFXT0FIbnNpOE9XWURScUpheDRKVWo5aXN6eGhiS3JOZzJBRFhn?=
 =?utf-8?B?em14RkNWdWpxa1Fxd21laHJ6RWY1UTQvZERkb2FLaEV6VUU4NWpZRWFRMDF5?=
 =?utf-8?B?TFFIUFFUY1NSdEpCUGdiZDNLUGFZTXpBYUh1UnJwOUU1NUhWejB2aXoxNldK?=
 =?utf-8?B?SDl2cUNTRmJSQ2dFUHR6ZVcvMW1hZ3lqeXl3YjlEVjI0ODFFMzNzWGx5RXBU?=
 =?utf-8?B?eis4ZXdpOHBsTlZmMEJ5Wk5rVEdpbitIS21yRTZWend0SjZFVzNjMFpuTGQx?=
 =?utf-8?B?VCtJMk1zWVU5U1FNSkc5b2lJaEVnT2c5Y3ZzVXZQbGR0OFBiVzN1M04xVWk3?=
 =?utf-8?B?UytZMWJmSzBZWGExWmhWdURQdmhseEh3NXVTVkZvcmd4VzZROGtFTTU1dHV3?=
 =?utf-8?B?QWRIS0MxOFc3ek5mZml2cVVBZGdLaXYvOGhXQWJ5Qk1SWGlHTzFSMStoRUVY?=
 =?utf-8?B?WmhHWkNIODV5UVRoM2ZhSmk1MytOQTA4UDJQVHZvanF4M1dXVCtkNjgvK0pC?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mR/ESx0KRPO8Gqdntnpjc+du4dZtK2MZ/dUdT4GKUh6TK7nMP5p/5Tmx+HIjSEGGuGnFgkN3jmvnXMZ/gZd331TILLcC3y2U6Am92+W5+vd/PbgslZgC6JE5Ej2oOJ8L8eG44cZ0KgB8Wz+79x03TXL32OiysL3Y8SwnCUoxv+viQZdd4UaZc+c6s+fMFoKi1vcrkRQ6XmTE6icrn4lBgKE+Jdb3ResAKICcyfy5tIfw9Y9ez0M/NklkqlqZ3BkInPYkA5Q2yYkzeBvjXXjLxGF9Vp4lC4lwPk+4wlVjs7L9stJC0sK2Ht2/OHpSnMiGjnCfpXGD/waiRTq9etMPOTPmscPBH4zVEL4ExbrDpJDw1y3qmHZvD7HEYIjNMjZq2pI04ofMSO7S60hVU41mQdv8iA6P4XjMOV5EhytY4Srht/XfTFsSu1/dduCYsuEKAAdWsAiWJav5NaRprYE30utEzDeerJLa0+4+e3Tu4jVW0RVaKcJsKtr7bI07igfY5wAqN1xdspzy3yZcfaPiXJM8+2gUNKR338cu2IBqRw1PJXGppPJjO5YwaMzqT10B1U3rYwLPiTQdlKzxDimCsscP6WydtCtSMwA8MjLtGC+mnZSiofpjXODI01soAUqtCe3WBzBLKkBEgT2amPtSqjrI5CJ/7ucNKOSmEm5f2KSMLcyJSUoniU1/TSRokEYDWlQ74r/9pxOFadu8bzPYouddz+Ho3gV4nfbem4C72XEa6JNNNDPvvoCzfNGkNGPflXBR9fU1jUANrdiPgjBiXmMadNLdvxBdKXUlFWNssR01iPL2QoIwyDW0FJOGmb40
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b78b9ed-f411-40b1-feec-08db4af1a8eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 09:43:18.7160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXeHrFU7MO+zflkpkciGSm+fW9XThtRyqHW8rn8WjvylJ5YW2jYFZC2IKT43gYBh9QpAzBa8F92XBjNwTW+2tpAoOcG9lkxwX3Oc4b+xarg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6526

On 02/05/2023 10:22 am, Roger Pau Monne wrote:
> When booting the BSP the portion of the code executed from the
> trampoline page will be using the GDT located in the hypervisor
> .text.head section rather than the GDT located in the trampoline page.

It's more subtle than this.

gdt_boot_descr references the trampoline GDT, but by it's position in
the main Xen image.

>
> If skip_realmode is not set the GDT located in the trampoline page
> will be loaded after having executed the BIOS call, otherwise the GDT
> from .text.head will be used for all the protected mode trampoline
> code execution.
>
> Note that both gdt_boot_descr and gdt_48 contain the same entries, but
> the former is located inside the hypervisor .text section, while the
> later lives in the relocated trampoline page.
>
> This is not harmful as-is, as both GDTs contain the same entries, but
> for consistency with the APs switch the BSP trampoline code to also
> use the GDT on the trampoline page.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although ...

> ---
>  xen/arch/x86/boot/trampoline.S | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
> index cdecf949b410..e4b4b9091d0c 100644
> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -164,6 +164,12 @@ GLOBAL(trampoline_cpu_started)
>  
>          .code32
>  trampoline_boot_cpu_entry:
> +        /*
> +         * Load the GDT from the relocated trampoline page rather than the
> +         * hypervisor .text section.
> +         */
> +        lgdt    bootsym_rel(gdt_48, 4)

... I'd suggest rewording this to simply /* Switch to trampoline GDT */,
or perhaps with an "alias" in there somewhere.

The important point here is that we want to shed all pre-trampoline
state, and unexpectedly being on the wrong GDT alias certainly
complicated debugging this...


> +
>          cmpb    $0,bootsym_rel(skip_realmode,5)
>          jnz     .Lskip_realmode
>  


